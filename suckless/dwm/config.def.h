/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx = 0; /* border pixel of windows */
static const unsigned int snap = 32;    /* snap pixel */
static const unsigned int gappih = 20;  /* horiz inner gap between windows */
static const unsigned int gappiv = 20;  /* vert inner gap between windows */
static const unsigned int gappoh =
    20; /* horiz outer gap between windows and screen edge */
static const unsigned int gappov =
    20; /* vert outer gap between windows and screen edge */
static const int smartgaps =
    0; /* 1 means no outer gap when there is only one window */

static const unsigned int systraypinning =
    0; /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor
          X */
static const unsigned int systrayonleft =
    0; /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 1; /* systray spacing */
static const int systraypinningfailfirst =
    1; /* 1: if pinning fails, display systray on the first monitor, False:
          display systray on the last monitor*/
static const int showsystray = 1; /* 0 means no systray */
static const int showbar = 1;     /* 0 means no bar */
static const int topbar = 1;      /* 0 means bottom bar */
static const int user_bh            = 22;        /* 2 is the default spacing around the bar's font */
static const char *fonts[] = {"JetBrainsMono Nerd Font:size=10"};
static const char dmenufont[] = "JetBrainsMono Nerd Font:size=10";
static const char col_bg1[] = "#080808";
static const char col_gray[] = "#7c6f64";
static const char col_fg[] = "#ddc7a1";
static const char col_bg2[] = "#1d2021";
static const char col_cyan[] = "#89b482";
static const char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = {col_fg, col_bg1, col_cyan},
    [SchemeSel] = {col_fg, col_bg2, col_cyan},
};

typedef struct {
    const char *name;
    const void *cmd;
} Sp;
const char *spcmd1[] = {"st", "-n", "spterm", "-g", "120x34", NULL};
const char *spcmd2[] = {"st",     "-n", "spfm",   "-g",
    "144x41", "-e", "ranger", NULL};
const char *spcmd3[] = {"keepassxc", NULL};
static Sp scratchpads[] = {
    /* name          cmd  */
    {"spterm", spcmd1},
    {"spranger", spcmd2},
    {"keepassxc", spcmd3},
};

/* tagging */
static const char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};
// static const char *tags[] = {"一", "二", "三", "四", "五",
//     "六", "七", "八", "九"};
// static const char *tags[] = { "", "", "", "", ""};

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    {"Gimp", NULL, NULL, 0, 1, -1},
    {"Firefox", NULL, NULL, 1 << 1, 0, 0},
    {NULL, "spterm", NULL, SPTAG(0), 1, -1},
    {NULL, "spfm", NULL, SPTAG(1), 1, -1},
    {NULL, "keepassxc", NULL, SPTAG(2), 0, -1},
};

/* layout(s) */
static const float mfact = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;   /* number of clients in master area */
static const int resizehints =
    1; /* 1 means respect size hints in tiled resizals */
static const int attachbelow =
    1; /* 1 means attach after the currently active window */
static const int lockfullscreen =
    1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
    /* symbol     arrange function */
    {"[]=", tile}, /* first entry is default */
    {"><>", NULL}, /* no layout function means floating behavior */
    {"[M]", monocle},
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                                      \
{MODKEY, KEY, view, {.ui = 1 << TAG}},                                       \
    {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}},               \
    {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},                        \
    {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                             \
{                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
}

/* commands */
static char dmenumon[2] =
    "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {
    "dmenu_run", NULL};
static const char *termcmd[] = {"kitty", NULL};

static const Key keys[] = {
    /* modifier                     key        function        argument */
    {MODKEY, XK_Return, spawn, SHCMD("alacritty")},
    {MODKEY, XK_b, spawn, SHCMD("min")},
    {MODKEY, XK_e, spawn, SHCMD("thunar")},
    {MODKEY, XK_r, spawn, SHCMD("redshift -O 5000")},
    {MODKEY | ShiftMask, XK_r, spawn, SHCMD("redshift -x")},
    {MODKEY, XK_s, spawn, SHCMD("flameshot gui")},
    {MODKEY | ShiftMask, XK_x, spawn, SHCMD("/home/xero/bin/./power")},
    // {MODKEY, XK_x, spawn, SHCMD("archlinux-logout")},
    {MODKEY | ControlMask, XK_Return, spawn, {.v = spcmd1}},
    {MODKEY | ShiftMask, XK_Return, spawn, SHCMD("rofi -show drun")},
    {MODKEY, XK_j, focusstack, {.i = +1}},
    {MODKEY, XK_k, focusstack, {.i = -1}},
    {MODKEY, XK_i, incnmaster, {.i = +1}},
    {MODKEY, XK_d, incnmaster, {.i = -1}},
    {MODKEY, XK_h, setmfact, {.f = -0.05}},
    {MODKEY, XK_l, setmfact, {.f = +0.05}},
    {MODKEY | Mod4Mask, XK_h, incrgaps, {.i = +1}},
    {MODKEY | Mod4Mask, XK_l, incrgaps, {.i = -1}},
    {MODKEY | Mod4Mask | ShiftMask, XK_h, incrogaps, {.i = +1}},
    {MODKEY | Mod4Mask | ShiftMask, XK_l, incrogaps, {.i = -1}},
    {MODKEY | Mod4Mask | ControlMask, XK_h, incrigaps, {.i = +1}},
    {MODKEY | Mod4Mask | ControlMask, XK_l, incrigaps, {.i = -1}},
    {MODKEY | Mod4Mask, XK_0, togglegaps, {0}},
    {MODKEY | Mod4Mask | ShiftMask, XK_0, defaultgaps, {0}},
    {MODKEY, XK_y, incrihgaps, {.i = +1}},
    {MODKEY, XK_o, incrihgaps, {.i = -1}},
    {MODKEY | ControlMask, XK_y, incrivgaps, {.i = +1}},
    {MODKEY | ControlMask, XK_o, incrivgaps, {.i = -1}},
    {MODKEY | Mod4Mask, XK_y, incrohgaps, {.i = +1}},
    {MODKEY | Mod4Mask, XK_o, incrohgaps, {.i = -1}},
    {MODKEY | ShiftMask, XK_y, incrovgaps, {.i = +1}},
    {MODKEY | ShiftMask, XK_o, incrovgaps, {.i = -1}},

    {MODKEY, XK_Tab, view, {0}},
    {MODKEY, XK_q, killclient, {0}},
    {MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
    {MODKEY, XK_m, setlayout, {.v = &layouts[2]}},
    {MODKEY, XK_f, fullscreen, {0}},
    {MODKEY, XK_space, setlayout, {0}},
    {MODKEY | ShiftMask, XK_space, togglefloating, {0}},
    {MODKEY, XK_0, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},
    {MODKEY, XK_comma, focusmon, {.i = -1}},
    {MODKEY, XK_period, focusmon, {.i = +1}},
    {MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
    {MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},
    {MODKEY, XK_y, togglescratch, {.ui = 0}},
    {MODKEY, XK_u, togglescratch, {.ui = 1}},
    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3)
    TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
    TAGKEYS(XK_9, 8){MODKEY | ShiftMask, XK_q, quit, {0}},
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
    /* click                event mask      button          function argument */
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
    {ClkWinTitle, 0, Button2, zoom, {0}},
    {ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
    /* placemouse options, choose which feels more natural:
     *    0 - tiled position is relative to mouse cursor
     *    1 - tiled postiion is relative to window center
     *    2 - mouse pointer warps to window center
     *
     * The moveorplace uses movemouse or placemouse depending on the floating
     * state of the selected client. Set up individual keybindings for the two
     * if you want to control these separately (i.e. to retain the feature to
     * move a tiled window into a floating position).
     */
    {ClkClientWin, MODKEY, Button1, moveorplace, {.i = 1}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button1, resizemouse, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
