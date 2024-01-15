/* See LICENSE file for copyright and license details. */
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <unistd.h>

#include <grapheme.h>

#include "../slstatus.h"
#include "../util.h"

#include <sys/soundcard.h>

const char *
vol_perc()
{
    FILE *fp;
    char buffer[128];

    // Execute amixer command to get the volume percentage
    char command[256];
    snprintf(command, sizeof(command), "amixer -c 0 -M -D pulse get Master | grep -m 1 -o -E [[:digit:]]+%%");

    fp = popen(command, "r");
    if (fp == NULL) {
        perror("popen");
        return NULL;
    }

    if (fgets(buffer, sizeof(buffer), fp) == NULL) {
        perror("fgets");
        pclose(fp);
        return NULL;
    }

    // Strip newline character and % sign
    char *newline = strchr(buffer, '\n');
    if (newline != NULL) {
        *newline = '\0';
    }
    char *percentSign = strchr(buffer, '%');
    if (percentSign != NULL) {
        *percentSign = '\0';
    }

    pclose(fp);

    return strdup(buffer);
}

const char *
vol_icon(const char *str)
{
    int perc = atoi(vol_perc());
    size_t p;
    size_t l;
    int i = 0;

    for (p = 0; str[p]; p += l, i++)
        l = grapheme_next_character_break_utf8(str + p, SIZE_MAX);

    i = i * perc / 101;

    for (p = 0; i--; p += l)
        l = grapheme_next_character_break_utf8(str + p, SIZE_MAX);
    l = grapheme_next_character_break_utf8(str + p, SIZE_MAX);

    return bprintf("%.*s", (int)l, str + p);
}
