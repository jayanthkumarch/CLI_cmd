#!/usr/bin/perl
use CLI;

$num_args = $#ARGV + 1;
#if ($num_args != 1) {
#    print "\nUsage: set_test.pl grid_ip\n";
#    exit;
#}
our @ISA = qw(CLI);
my $ip = $ARGV[0];
my $master_ip = $ARGV[1];
system("cp input_bk.xml input.xml");
system("sed -i 's/admin_grid_ip/$master_ip/g' input.xml");
my $tcs = CLI::getInputData();
my $i=0;
my $execution_status_file = "Marvin_CLI_test.txt";
foreach $tc ((@$tcs)){
       push @test_cases,"\"".$tc->{"test_command"}."\"";
}
my ($status_value,$results) = &CLI::RunCommand($ip,\@test_cases);



