package CLI;
use Expect;

sub RunCommand {

    # Define expected values and variables. All error messages should
    # contain UPGRADE FAILED as this is what the parser looks for to
    # to determine if the upgrade was successful or not
    my ($ip, $user_commands) = @_;
    #my ($ip, $user_command) = ("10.35.1.154","set smartnic-debug max-cached-lifetime +100");
    my $prompt = ">.*";
#    my $maintenance_mode = "Maintenance Mode.*>.*";
#    my $command_to_maintenancemode = "set maintenancemode";
    my $usernamePrompt = "login: ";
    my $pwPrompt = "admin@.*'s password";
   # my $timeout = 7200;
    my $timeout = 60;
    my $scriptAborted = ".* Script Aborted .*";
    my $rebootMsg = "SYSTEM REBOOTING!.*";
    my $username = "admin";
    my $password = "infoblox";
    my $password1 = "infoblox1";	
	
    our $rebDetected = "Detected Reboot Message...\n\n...Going to sleep while the NetMRI Reboots";
    our $notFoundMsg = "Upgrade file not found on netmri. UPGRADE FAILED!";
    our $timeOutMsg = "+++ $ip has not responded in [$timeout] seconds...UPGRADE FAILED!";
    our $scriptAbortedMsg = "The upgrade script aborted.  UPGRADE FAILED!";
    our $cmdFailed = "Command Failed, status";
    our ($errFlag,$cliComplete,$rebootDetected) = 0;
    our $promptCnt = 1;
    # Open expect session to the upgrade server
    #
    my @user_commands = @$user_commands;

    my $command = "ssh admin\@$ip -p2020 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null";
    my $exp = Expect->spawn($command)
    or die "Cannot spawn $command: $!\n";
    # Log all session output to the upgrade log

    $exp->log_file("serial-automation.log", "w");

    # start while loop that kicks off the upgrade, answers all the questions
    # and leaves when the netmri prompts that it will now reboot.  Tried to catch
    # all possible error scenarios as well.
    
#$exp->debug(1);


    while(!$cliComplete) {
        $exp->expect(
            $timeout,
            [ timeout                   => sub { $exp->print_log_file($timeOutMsg);
                                                $errFlag = 1;
                                                $cliComplete = 1;
                                                return $cliComplete; } ],
            [ qr/$scriptAborted/     	=> sub { $exp->print_log_file($scriptAbortedMsg);
                                                $errFlag = 1;
                                                $cliComplete = 1;
                                                return $cliComplete; } ],
            [ qr/$cmdFailed/            => sub { $exp->print_log_file($scriptAbortedMsg);
                                                $errFlag = 1;
                                                $cliComplete = 1;
                                                return $cliComplete; } ],
            [ qr/$rebootMsg/            => sub { $exp->print_log_file($rebDetected);
                                                $rebootDetected = 1;
                                                $cliComplete = 1;
                                                return $cliComplete; } ],
            [ qr/$usernamePrompt/       => sub { my $exp = shift;
                                                $exp->send("$username\n");
                                                exp_continue; } ],
            [ qr/$pwPrompt/             => sub { my $exp = shift;
                                                $exp->send("$password\n");
                                                exp_continue; } ],
	    [ qr/Do you want to continue.*/             => sub { my $exp = shift;
                                                $exp->send("y\n");
                                                exp_continue; } ],
            [ qr/Enter <return> for next page or q<return> to go back to command line./             => sub { my $exp = shift;
                                                $exp->send("\n");
                                                exp_continue; } ],



[ qr/Do you want to start wizard?.*/ => sub { my $exp = shift;
                                                $exp->send("no\n");
                                                exp_continue; } ],
[ qr/Please type 'q' to quit, or Enter to continue.*/ => sub { my $exp = shift;
                                                $exp->send("q\n");
                                                exp_continue; } ],
[ qr/Password:/  => sub { my $exp = shift;
                                                $exp->send("$password\n");
                                                exp_continue; } ],


[ qr/Enter password:/  => sub { my $exp = shift;
                                                $exp->send("$password\n");
                                                exp_continue; } ],

[ qr/Enter again:/  => sub { my $exp = shift;
                                                $exp->send("$password\n");
                                                exp_continue; } ],


[ qr/Enter the NIOS admin's password:.*/  => sub { my $exp = shift;
                                                $exp->send("$password\n");
                                                exp_continue; } ],

[ qr/Enter again:/  => sub { my $exp = shift;
                                                $exp->send("$password\n");
                                                exp_continue; } ],

[ qr/Enter the password:.*/  => sub { my $exp = shift;
                                                $exp->send("$password\n");
                                                exp_continue; } ],


[ qr/.*Enter to continue.*/  => sub { my $exp = shift;
                                                $exp->send("\n");
                                                exp_continue; } ],
  


            [ qr/$prompt/     => sub { my $exp = shift;
						#print "\nStart*****+++++\n". $exp->before() ."\n*****************++++++End\n";
						if ($promptCnt == 1) {
                                                    if(!@user_commands)
                                                    {
							@user_commands = @$user_commands;
							 $exp->send("exit\n\n");
                                                         $cliComplete = 1;
                                                         return $cliComplete;
						    }
                                                    #print $user_command;
                                                    my $user_command = shift @user_commands;
                                                    $user_command = $1 if ($user_command =~ m /\"(.*)\"/);
                                                    $exp->send("$user_command\n");
                                                    #$promptCnt++;
                                                    sleep(15);
                                                    exp_continue;
                                                } elsif ($promptCnt == 2) {
						    $exp->send("exit\n\n");
                                                    $cliComplete = 1;
                                                    return $cliComplete;
                                                } } ]
#            [ qr/$prompt/           	=> sub { my $exp = shift;
#                                                $exp->send("$command_to_maintenancemode\n");
#                                                exp_continue; } ],
		

        );
    }

    $exp->log_file(undef);

    # No sense in doing the reboot check if an error was detected as this would delay the build
    # by 20 minutes for no reason
    our @output =();
    if ($errFlag) {
	@output = $exp->before() ;
	#print "\n*****+++++\n @output \n*****************++++++\n";
        print "+++ Killing expect session due to timeout or no preoper response!\n";
        $exp->hard_close();
        return (1,\@output);
    } else {
	@output = $exp->before() ;
	print "\n*****+++++ expect soft close ****************++++++End\n";
        $exp->soft_close();
    }
     
    # If we made it here, than nothing failed
    return (0,\@output);

}

sub getInputData
{
        use XML::LibXML;
	use Data::Dumper;
        my $device_input = "input.xml";
        my $obj =  XML::LibXML->new();
        my $xp = $obj->parse_file($device_input);
        my $xpc = XML::LibXML::XPathContext->new($xp);
        my $devices = $xpc->findnodes("/TestSuite/TestCase");
        my @all_tcs=();
        foreach my $ele ( @{$devices})
        {
                my $child_hash={};
                foreach my $options ($ele->getChildnodes())
                {
                      next if($options->nodeName() =~ m/#text/);
                      $child_hash->{$options->nodeName()} = $options->textContent();
			 foreach my $options1 ($options->getChildnodes())
                	{
					next if($options1->nodeName() =~ m/#text/);
                     			 $child_hash->{$options1->nodeName()} = $options1->textContent();
			}

                }
		delete $child_hash->{"ExpectedResults"};
		push @all_tcs,$child_hash;		
		#print Dumper $child_hash;
         }
         return \@all_tcs;

}
1;
