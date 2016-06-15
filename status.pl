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

[ qr/.*Please type 'q' to quit, or Enter to continue.*/          => sub { my $exp = shift;
							   $exp->send("q\n");
   sleep(5);
						exp_continue;}],




            [qr/>/          => sub { my $exp = shift;
                                      if( $i==0)
                                        {
                                              $i++;

                                            $exp->send("admin_system_upgrade\n");
sleep(5);
                                            $exp->send("status\n");
sleep(5);
                                            $exp->send("exit\n");
sleep(5);
					    $exp->send("exit\n");
                                            exp_continue;
}else{
exit(0)
}
                                             } ],
        );
exit;
    }


}

