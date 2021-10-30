/* See LICENSE file for copyright and license details. */
//#include "/home/augusto/.cache/wal/colors-wal-dwm.h"

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int CORNER_RADIUS 		= 6;
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const char *fonts[]          = { "Source Code Pro:size=8", "JetBrainsMono Nerd Font Mono" };
static const char dmenufont[]       = "monospace:size=10";

// stolen from elken, ty
static const char *colors[17] = {
    /* border    fg         bg */
    { "#282828", "#928374", "#282828" },        /* [0]  01 - Client normal */
    { "#ebdbb2", "#458588", "#282828" },        /* [1]  02 - Client selected */
    { "#83a598", "#fb4934", "#282828" },        /* [2]  03 - Client urgent */
    { "#83a598", "#83a598", "#282828" },        /* [3]  04 - Client occupied */
    { "#282828", "#fb4934", "#282828" },        /* [4]  05 - Red */
    { "#282828", "#fabd2f", "#282828" },        /* [5]  06 - Yellow */
    { "#282828", "#b8bb26", "#282828" },        /* [6]  07 - Green */
    { "#282828", "#928374", "#282828" },        /* [7]  08 - Dark grey */
    { "#282828", "#d5c4a1", "#282828" },        /* [8]  09 - Light grey */
    { "#928374", "#928374", "#282828" },        /* [9]  0A - Bar normal*/
    { "#3c3836", "#a89985", "#282828" },        /* [10] 0B - Bar selected*/
    { "#fb4934", "#fb4934", "#282828" },        /* [11] 0C - Bar urgent*/
    { "#928374", "#458588", "#282828" },        /* [12] 0D - Bar occupied*/
    { "#3c3836", "#3c3836", "#282828" },        /* [13] 0E - Tag normal*/
    { "#83a598", "#83a598", "#282828" },        /* [14] 0F - Tag selected*/
    { "#fb4934", "#fb4934", "#282828" },        /* [15] 10 - Tag urgent*/
    { "#3c3836", "#928374", "#282828" },        /* [16] 11 - Tag occupied*/
};

static const char norm_fg[] = "#f5dc9d";
static const char norm_bg[] = "#120512";
static const char norm_border[] = "#ab9a6d";

static const char sel_fg[] = "#f5dc9d";
static const char sel_bg[] = "#6C4B4D";
static const char sel_border[] = "#f5dc9d";

static const char urg_fg[] = "#f5dc9d";
static const char urg_bg[] = "#4B1C49";
static const char urg_border[] = "#4B1C49";

/*
static const char *colors[][3]      = {
	//              fg         bg         border   
	[SchemeNorm] = { norm_fg, norm_bg, urg_bg },
	[SchemeSel]  = { norm_fg, norm_bg,  norm_bg  },
	[SchemeStatus]  = { urg_bg, urg_bg,  "#000000"  }, // Statusbar right {text,background,not used but cannot be empty}
	[SchemeTagsSel]  = { norm_fg, norm_bg,  "#000000"  }, // Tagbar left selected {text,background,not used but cannot be empty}
    [SchemeTagsNorm]  = { urg_bg, urg_bg,  "#000000"  }, // Tagbar left unselected {text,background,not used but cannot be empty}
    [SchemeInfoSel]  = { norm_fg, norm_bg,  "#000000"  }, // infobar middle  selected {text,background,not used but cannot be empty}
    [SchemeInfoNorm]  = { urg_bg, urg_bg,  "#000000"  }, // infobar middle  unselected {text,background,not used but cannot be empty}
};*/

/* tagging */
static const char *tags[] = { "", "", "", "ﭮ", "", "", "", "", "" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     iscentered   isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            0,           1,           -1 },
	{ "Firefox",  NULL,       NULL,       0,			0,           0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int decorhints  = 1;    /* 1 means respect decoration hints */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", "#282828", "-nf", "#928374", "-sb", "#3c3836", "-sf", "#a89984", "-h", "22", NULL }; 
//static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", urg_bg, "-nf", urg_bg, "-sb", norm_bg, "-sf", norm_fg, NULL };
static const char *termcmd[]  = { "st", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

