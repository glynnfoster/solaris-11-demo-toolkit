# Here we define XTerm colors. STORY_COL is the color of the narrative,
# CMD_COL is the color of the commands.
# Possible colors are: 
# CLEAR, RESET, BOLD, DARK, FAINT, UNDERLINE,
# UNDERSCORE, BLINK, REVERSE, CONCEALED, BLACK, RED, GREEN,
# YELLOW, BLUE, MAGENTA, CYAN, WHITE, ON_BLACK, ON_RED,
# ON_GREEN, ON_YELLOW, ON_BLUE, ON_MAGENTA, ON_CYAN, ON_WHITE 
#
$STORY_COL = RED;
$CMD_COL = BLACK;


# This is to reset terminal colors after each print statement
$Term::ANSIColor::AUTORESET = TRUE; 

# This is to catch Ctrl-C inside the Perl script and return to the main menu
# instead of just abandoning completely.
$SIG{'INT'} = 'CLEANUP';
sub CLEANUP {
    print "\n\nCaught Interrupt (^C), Aborting\n";
    exit(1);
}

# Demo script typing delay
demotools::setdelay(.05);

# As we are going to run all the demos as "root", we change the prompt to "#"
demotools::setprompt("#");
