use Expect;
our $i=0;
       get_mysql_data();
sub get_mysql_data
{
my $Master_ip   = @ARGV[0] ;
my $cmd_output;
my $password= "infoblox";
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
                                           # exp_continue;
											} ] );
$exp->expect(
        $timeout,
[ qr/.*Please type 'q' to quit, or Enter to continue.*/          => sub { my $exp = shift;
																$exp->send("q\n");
																sleep(5);}] );
$exp->expect(
        $timeout,
[ qr/>/          => sub { my $exp = shift;
                                            $exp->send("admin_system_upgrade\n");
											sleep(5);}] );

$exp->expect(
        $timeout,
[ qr/.*admin.system.upgrade.*/          => sub { my $exp = shift;
                                            $exp->send("status\n");
											sleep(5);}] );
											
$exp->expect(
        $timeout,
[ qr/.*admin.system.upgrade.*/          => sub { my $exp = shift;
                                            $exp->send("revert 5\n");
sleep(5);
$exp->expect(
		$timeout,
[ qr/.*Proceed.*/				  => sub {my $exp = shift;
                                          $exp->send("y\n");}]);
sleep(5);
											}] );

$exp->expect(
        $timeout,
[ qr/.*admin.system.upgrade.*/          => sub { my $exp = shift;
                                            $exp->send("exit\n");
											sleep(3);}] );
$exp->expect(
        $timeout,
[ qr/.*>.*/          => sub { my $exp = shift;
                                            $exp->send("exit\n");
                                                                                         sleep(2);}] );


 exit;
}										
}
									
											
											
