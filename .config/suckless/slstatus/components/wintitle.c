/* See LICENSE file for copyright and license details. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>

#include "../util.h"

static const char *getname(Window);
static const char *grepw(Window, const char *, int *);
const char *rematch(const regex_t *, const char *str, int *cl);
static Display *dpy = NULL;
static Atom netwmname;

const char *
rematch(const regex_t *re, const char *str, int *cl)
{
	regmatch_t m[2];
	if (regexec(re, str, sizeof(m) / sizeof(*m), m, 0) ||
	    m[1].rm_so == -1)
		return NULL;

	*cl = m[1].rm_eo - m[1].rm_so;
	return str + m[1].rm_so;
}

const char *
wintitle(const char *arg)
{
	int rl;
	const char *rv;

	if (!dpy) {
		if (!(dpy = getdisplay())) {
			warn("XOpenDisplay: Failed to open display");
			return NULL;
		}
		netwmname = XInternAtom(dpy, "_NET_WM_NAME", False);
	}

	rv = grepw(DefaultRootWindow(dpy), arg, &rl);

	if (!rv)
		return NULL;

	return bprintf("%.*s", rl, rv);
}

const char *
grepw(Window win, const char *pattern, int *rl) {
	unsigned int n;
	Window *wins, *w, dw;
	XWindowAttributes wa;
	const char *rv = NULL;
	regex_t re;

	if (regcomp(&re, pattern, REG_EXTENDED))
		goto err1;
	if(!XQueryTree(dpy, win, &dw, &dw, &wins, &n))
		goto err2;
	for(w = &wins[n-1]; w >= &wins[0]; w--)
		if(XGetWindowAttributes(dpy, *w, &wa)
		&& !wa.override_redirect && wa.map_state == IsViewable)
			if ((rv = rematch(&re, getname(*w), rl)))
				break;

err2:
	XFree(wins);
err1:
	regfree(&re);

	return rv;
}

const char *
getname(Window win) {
	static char buf[BUFSIZ];
	char **list;
	int n;
	XTextProperty prop;

	if(!XGetTextProperty(dpy, win, &prop, netwmname) || prop.nitems == 0)
		if(!XGetWMName(dpy, win, &prop) || prop.nitems == 0)
			return "";
	if(!XmbTextPropertyToTextList(dpy, &prop, &list, &n) && n > 0) {
		strncpy(buf, list[0], sizeof buf);
		XFreeStringList(list);
	} else
		strncpy(buf, (char *)prop.value, sizeof buf);
	XFree(prop.value);
	buf[sizeof buf - 1] = '\0';
	return buf;
}
