{ pkgs, ... }:

{
  home.packages = [
    pkgs.waypipe

    # Create the devenv script
    (pkgs.writeShellScriptBin "devenv" ''
      #!/bin/bash

      start_waypipe() {
          echo "Starting waypipe connection to devenv..."
          
          # Clean up any existing processes and sockets
          ${pkgs.procps}/bin/pkill -f "waypipe.*client" 2>/dev/null || true
          ssh devenv "pkill -f waypipe" 2>/dev/null || true
          
          rm -f "/tmp/waypipe-client.sock" 2>/dev/null
          ssh devenv "rm -f /tmp/waypipe-server.sock /run/user/\$(id -u)/wayland-devenv" 2>/dev/null || true
          
          # Start local client in background with no compression to avoid version mismatches
          ${pkgs.waypipe}/bin/waypipe --compress none --socket "/tmp/waypipe-client.sock" client &
          
          # Wait for client socket
          for i in {1..20}; do
              if [[ -S "/tmp/waypipe-client.sock" ]]; then
                  break
              fi
              sleep 0.5
          done
          
          if [[ ! -S "/tmp/waypipe-client.sock" ]]; then
              echo "Failed to start waypipe client"
              return 1
          fi
          
          echo "✓ Local client started"

          # Start waypipe server
          ssh -q -f -R /tmp/waypipe-server.sock:/tmp/waypipe-client.sock devenv \
              "waypipe --compress none --socket /tmp/waypipe-server.sock --display wayland-devenv server sleep infinity 2>/dev/null"
          
          # Wait for remote wayland socket
          for i in {1..20}; do
              if ssh devenv "test -S /run/user/\$(id -u)/wayland-devenv" 2>/dev/null; then
                  break
              fi
              sleep 0.5
          done
          
          if ssh devenv "test -S /run/user/\$(id -u)/wayland-devenv" 2>/dev/null; then
              echo "✓ Waypipe connection established"
              echo "  Remote display: wayland-devenv"
              echo ""
              echo "Use: devenv connect"
          else
              echo "Failed to establish waypipe connection"
              stop_waypipe
              return 1
          fi
      }

      stop_waypipe() {
        echo "Stopping waypipe connection..."
        
        ${pkgs.procps}/bin/pkill -f "waypipe.*client" 2>/dev/null || true
        ${pkgs.procps}/bin/pkill -f "ssh.*devenv.*-R" 2>/dev/null || true
        
        # Kill the sleep process on remote
        ssh devenv "pkill -f 'waypipe.*server'; pkill -f 'sleep infinity'" 2>/dev/null || true
        
        rm -f "/tmp/waypipe-client.sock" 2>/dev/null
        ssh devenv "rm -f /tmp/waypipe-server.sock /run/user/\$(id -u)/wayland-devenv" 2>/dev/null || true
        
        echo "✓ Waypipe connection stopped"
      }

      status_waypipe() {
        echo "Waypipe status:"
        
        if ${pkgs.procps}/bin/pgrep -f "waypipe.*client" >/dev/null; then
            echo "✓ Local client: running"
        else  
            echo "✗ Local client: not running"
        fi
        
        if [[ -S "/tmp/waypipe-client.sock" ]]; then
            echo "✓ Local socket: exists"
        else
            echo "✗ Local socket: missing"
        fi
        
        if ${pkgs.procps}/bin/pgrep -f "ssh.*devenv.*-R" >/dev/null; then
            echo "✓ SSH tunnel: active"
        else
            echo "✗ SSH tunnel: not active"  
        fi
        
        if ssh devenv "pgrep -f waypipe" >/dev/null 2>&1; then
            echo "✓ Remote server: running"
        else
            echo "✗ Remote server: not running"
        fi
        
        if ssh devenv "test -S /run/user/\$(id -u)/wayland-devenv" 2>/dev/null; then
            echo "✓ Remote display: active"
        else
            echo "✗ Remote display: missing"
        fi
      }

      connect_ssh() {
        # Check if waypipe client is running, start if not
        if ! ${pkgs.procps}/bin/pgrep -f "waypipe.*client" >/dev/null; then
            echo "Starting local waypipe client..."
            ${pkgs.waypipe}/bin/waypipe --compress none --socket "/tmp/waypipe-client.sock" client &
            sleep 1
            
            if [[ ! -S "/tmp/waypipe-client.sock" ]]; then
                echo "Failed to start waypipe client"
                return 1
            fi
        fi

        # Check if server is already running
        if ! ssh devenv "pgrep -f 'waypipe.*server'" >/dev/null 2>&1; then
            echo "Starting remote waypipe server..."
            ssh -f -q -R /tmp/waypipe-server.sock:/tmp/waypipe-client.sock devenv \
                "waypipe --compress none --socket /tmp/waypipe-server.sock --display wayland-devenv server sleep infinity 2>/dev/null"
            
            sleep 1
            
            # Verify the wayland display was created
            if ! ssh devenv "test -S /run/user/\$(id -u)/wayland-devenv" 2>/dev/null; then
                echo "Warning: Wayland display socket not found"
            fi
        else
            echo "Remote waypipe server already running"
        fi

        echo "Connecting to devenv..."
        ssh -t devenv 'export WAYLAND_DISPLAY=wayland-devenv; exec $SHELL'
      }

      case "''${1:-connect}" in
          start)
              start_waypipe
              ;;
          stop)  
              stop_waypipe
              ;;
          restart)
              stop_waypipe
              sleep 2
              start_waypipe
              ;;
          status)
              status_waypipe
              ;;
          connect|"")
              connect_ssh
              ;;
          *)
              echo "Usage: devenv [start|stop|restart|status|connect]"
              echo ""
              echo "Commands:"
              echo "  start     - Start waypipe connection"
              echo "  stop      - Stop waypipe connection" 
              echo "  restart   - Restart waypipe connection"
              echo "  status    - Show connection status"
              echo "  connect   - Connect to devenv (default)"
              exit 1
              ;;
      esac
    '')
  ];
}
