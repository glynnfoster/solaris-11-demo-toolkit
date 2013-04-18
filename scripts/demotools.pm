#--------------------------------------------------

package demotools;

#--------------------------------------------------

$prompt = "\$";
$delay = 0.15;   # in seconds

#--------------------------------------------------

## overwrite default prompt
sub setprompt {
  ($prompt) = $_[0];
}

#--------------------------------------------------

## overwrite default typing delay
sub setdelay {
  ($delay) = $_[0];
}

#--------------------------------------------------

## waiting for user to hit ENTER
sub wait4enter {

  ##  system("head -n 1");
  <STDIN>;
}

#--------------------------------------------------

sub typer {

  ## break argument into its characters. 
  @chars = split(//, $_[0]);

  ## Set this output device to flush after each printed character
  $| = 1;

  ## Go through all characters and print them to screen with delay
  while (@chars) {
    print (shift (@chars));
    select(undef, undef, undef, $delay); 
  }
}

#--------------------------------------------------

sub cmd {

  ## Get argument count
  $argc = @_;

  ## If no arguments, then exit
  if ($argc == 0) {
    return 0;
  }

  ## Get the first argument - the string to be printed
  my($pcmd) = $_[0];

  ## Print that string to the screen, after the prompt, with character delay
  printf ("$prompt ");
  typer ($pcmd);
  wait4enter;

  ## If we have only one argument, we want to execute the first argument
  ##   (the one that was printed.)
  ## Otherwise, we'll start with the second and execute all subsequent ones.
  if ($argc > 1) {
    shift @_;
  }

  while (@_) {
    $commandline = shift(@_);
    system ($commandline);
    if ($? == -1) {
      my ($command) = split /\s*:\s*/, $commandline, 2;
      printf "$command: command not found\n";
    }
  }

  ## Wait for user to give green light for next command
  printf("$prompt ");
  wait4enter;
 
}
#--------------------------------------------------
