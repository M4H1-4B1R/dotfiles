//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

	{"^c#f5c2e7^ ", "~/.local/scripts/kernel",					360,		2},

	{"^c#cba6f7^ ", "~/.local/scripts/cpu",					10,		18},

	{"^c#f38ba8^ ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	10,		0},

	{"", "~/.local/scripts/battery",					5,		3},

	{"^c#fab387^󱑆 ", "date '+%I:%M%p'",					5,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "  ";
static unsigned int delimLen = 10;
