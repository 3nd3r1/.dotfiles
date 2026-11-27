---
name: coolify
description: Manage Coolify deployments, applications, databases, services, servers, logs, and environment variables using the coolify CLI. Use when asked to deploy to Coolify, inspect Coolify resources or logs, manage Coolify env vars, or check Coolify contexts and servers.
---

# coolify

Use the `coolify` CLI (`coollabsio/coolify-cli`) to interact with Coolify instances.

## Rules

- Pass `--format json` whenever reading command output programmatically.
- Never guess resource, app, project, server, or deployment UUIDs. Look them up with `coolify resource list --format json` (or `app list`, `project list`, `database list`, `service list`, `server list`).
- Never pass `-s` / `--show-sensitive` unless the user explicitly needs secret values, and never print or log API tokens or secret env values.
- Confirm before destructive or disruptive operations (`delete`, `stop`, `rollback`, `env delete`, `deploy --force` on production).
- Check `coolify <cmd> --help` before guessing flags on unfamiliar subcommands.
- Pass `--context <name>` when multiple Coolify instances are configured and the user targets a non-default one.

## Commands

Run `coolify --help` for the full list.

| Command | Purpose |
|---|---|
| `coolify context list` / `verify` / `use <name>` | Inspect, verify, or switch Coolify contexts |
| `coolify resource list --format json` | List all apps, services, and databases with UUIDs |
| `coolify project list --format json` | List projects and environments (`project get <uuid>`) |
| `coolify app list` / `get <uuid>` | List or inspect applications |
| `coolify app logs <uuid> [-n 100] [-f]` | Fetch or follow app logs (`--service <name>` for compose apps) |
| `coolify app start\|stop\|restart <uuid>` | Control application lifecycle |
| `coolify app env list\|create\|update\|delete\|sync <uuid>` | Manage app environment variables |
| `coolify app deployments <uuid>` | List deployments for an application |
| `coolify deploy uuid <uuid> [--force]` | Trigger a deployment by resource UUID |
| `coolify deploy name <name>` / `batch` | Deploy by resource name |
| `coolify deploy list` / `get <deploy-uuid>` / `cancel <deploy-uuid>` | Inspect or cancel deployments |
| `coolify database list\|get\|logs\|start\|stop\|restart\|backup` | Manage Coolify databases |
| `coolify service list\|get\|logs\|env\|start\|stop\|restart` | Manage one-click services |
| `coolify server list\|get\|validate\|domains` | Inspect or validate servers |
| `coolify shared-env team\|project\|environment\|server` | Manage inherited shared env vars |

## Examples

Find an app UUID and deploy it:

```bash
coolify resource list --format json
coolify deploy uuid <app-uuid> --format json
coolify deploy get <deployment-uuid> --format json
```

Read recent logs (with timestamps):

```bash
coolify app logs <app-uuid> -n 200 --show-timestamps
```

Inspect or sync app env vars (values masked by default):

```bash
coolify app env list <app-uuid> --format json
coolify app env sync <app-uuid> .env
```

## Local setup

`coolify` is managed by Home Manager in `modules/home-manager/apps/coolify.nix`. Never run `coolify update` or the curl installer.

If commands fail with auth or missing context errors, run `coolify context verify` and ask the user to configure a context with `coolify context add <name> <url> <token>`. Never print or log the token.
