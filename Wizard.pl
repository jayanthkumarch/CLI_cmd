use Expect;
our $i=0;
       get_mysql_data();
sub get_mysql_data
{
my $Master_ip   = @ARGV[0] ;
my $cmd_output;
my $complete =0;
        my $errFlag = 0;
    my $command = "ssh admin\@$Master_ip -p 2020";
        our $prompt = "Username.*";
    my $exp = Expect->spawn($command) or die "Cannot spawn $command: $!\n";
    # Log all session output to the upgrade log
   my $timeout = 60;
    while(!$complete) {
    print "i am here\n";
        $exp->expect(
            $timeout,
   [ qr/.*Are you sure you want to continue connecting.*/          => sub { my $exp = shift;
                                            $exp->send("yes\n");
sleep(5);
                                            exp_continue;
                                             } ],

            [ qr/.*password:/          => sub { my $exp = shift;
                                            $exp->send("infoblox\n");
sleep(5);
                                            exp_continue;
                                             } ],

            [qr/>/          => sub { my $exp = shift;
                                      if( $i==0)
                                        {
                                              $i++;

                                            $exp->send("wizard\n");
sleep(5);
                                            $exp->send("\n");
sleep(5);
                                            $exp->send("\n");
sleep(5);
                                            $exp->send("\n");
sleep(5);
                                            exp_continue;
}else{
exit(0)
}
                                             } ],
           [ qr/Enter hostname.*Enter to skip.*/          => sub { my $exp = shift;
                                            $exp->send("\n");
sleep(5);
                                            exp_continue;
                                             } ],
 [ qr/Enter domain.*Enter to skip.*/          => sub { my $exp = shift;
                                            $exp->send("\n");
sleep(5);
                                            exp_continue;
                                             } ],
 [ qr/Enter dns server.*Enter to skip.*/          => sub { my $exp = shift;
                                            $exp->send("\n");
sleep(5);
                                            $exp->send("\n");
sleep(5);
                                            exp_continue;
                                             } ],



        [ qr/Enter IP address mode.*/          => sub { my $exp = shift;
                                            $exp->send("\n");

sleep(5);                                            
                                       exp_continue;
                                             } ],
 [ qr/Enter the IP address.*or FQDN.*Grid Master/          => sub { my $exp = shift;

                                            $exp->send("\n");
sleep(5);
                                            exp_continue;
                                             } ],
 [ qr/Enter the NIOS.*admin username.*/          => sub { my $exp = shift;
                                            $exp->send("admin\n");
sleep(5);
                                            exp_continue;
                                             } ],
[ qr/NIOS admin password is already set.*/  => sub { my $exp = shift;
                                            $exp->send("n\n");
sleep(5);
                                            exp_continue;
                                             } ],


 [ qr/Enter the NIOS.*admin password.*/          => sub { my $exp = shift;
                                            $exp->send("infoblox\n");
sleep(5);
                                            exp_continue;
                                             } ],

 [ qr/Enter again.*/          => sub { my $exp = shift;
                                            $exp->send("infoblox\n");
sleep(120);
                                            $exp->send("\n\n");
                                            exp_continue;
                                             } ],

 [ qr/Adding an SCP user.*/                 => sub { my $exp = shift;
                                            $exp->send("\n\n");
sleep(5);
                                            exp_continue;
                                            }],

 [ qr/Enter username (Enter to skip).*/          => sub {my $exp = shift;
                                            $exp->send("user\n");

sleep(5);                                 $exp->send("\n\n");    
                                          exp_continue;
                                          } ],
        );
exit;
    }


}

