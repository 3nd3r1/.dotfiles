/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */


static const char col_purple[]       = "#800080";
static const char col_orange[]       = "#ff8000";
static const char col_black[]       = "#000000";
static const char col_darkpuple[]       = "#301934";

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"MesloLGLDZNerdFont:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#800080", "#000000" },
	[SchemeSel] = { "#000000", "#800080" },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
