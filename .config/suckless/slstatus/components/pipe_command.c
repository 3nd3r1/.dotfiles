/* See LICENSE file for copyright and license details. */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

#include "../util.h"

static struct {
	int fd;
	int len;
	int bused;
	int neednl;
	char last[256];
	char buffer[256];
	const char *cmd;
} *pipes = NULL;
int npipes = 0;

char *find_last_seg(char *buffer, size_t n, char sep, int *len)
{
	char *i;
	char *pp = NULL;
	char *p = buffer - 1;

	for (i = buffer; n--; i++) {
		if (*i == sep) {
			pp = p;
			p = i;
		}
	}

	if (pp) {
		*len = p - pp - 1;
		return pp + 1;
	}

	*len = -1;
	return NULL;
}

const char *
pipe_command(const char *cmd)
{
	int i;

	for (i = 0; i < npipes && pipes[i].cmd != cmd; i++);
	if (i == npipes) {
		int pfd[2];
		pipes = realloc(pipes, sizeof(*pipes) * ++npipes);
		if (pipe(pfd))
			die("failed to open pipe");
		watch(pfd[0]);

		switch (fork()) {
		case -1:
			die("fork failed");
			break;
		case 0:
			close(pfd[0]);
			close(STDIN_FILENO);
			close(STDOUT_FILENO);
			dup2(pfd[1], STDOUT_FILENO);
			close(pfd[1]);
			open("/dev/null", O_WRONLY);
			execlp("sh", "sh", "-c", cmd, NULL);
			exit(1);
			break;
		default:
			close(pfd[1]);
			fcntl(pfd[0], F_SETFL, O_NONBLOCK);
			pipes[i].fd = pfd[0];
			pipes[i].bused = 0;
			pipes[i].len = 0;
			pipes[i].cmd = cmd;
			pipes[i].neednl = 0;
			break;
		}
		npipes++;
	}

	int fd = pipes[i].fd;
	int r;
	char *nnl;
	int len;

	r = read(fd, pipes[i].buffer + pipes[i].bused,
		 sizeof(pipes[i].buffer) - pipes[i].bused);

	if (r == 0)
		die("pipe source died");
	if (r < 0) {
		if (errno == EWOULDBLOCK || errno == EAGAIN)
			r = 0;
		else
			die("pipe error:");
	}

	nnl = find_last_seg(pipes[i].buffer, r, '\n', &len);

	if (nnl) {
		if (!pipes[i].neednl || nnl != pipes[i].buffer) {
			memcpy(pipes[i].last, nnl, len);
			pipes[i].len = len;
		}
		pipes[i].neednl = 0;
		pipes[i].bused = r - (nnl + len + 1 - pipes[i].buffer);
		memmove(pipes[i].buffer, nnl + len + 1, pipes[i].bused);
	} else if (!pipes[i].neednl) {
		pipes[i].bused += r;

		if (pipes[i].bused == sizeof(pipes[i].buffer)) {
			pipes[i].len = pipes[i].bused;
			memcpy(pipes[i].last, pipes[i].buffer,
			       pipes[i].bused);
			pipes[i].bused = 0;
			pipes[i].neednl = 1;
		}
	}

	if (pipes[i].len == 0)
		return NULL;
	return bprintf("%.*s", pipes[i].len, pipes[i].last);
}
