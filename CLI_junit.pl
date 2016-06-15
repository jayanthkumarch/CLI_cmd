#!usr/bin/perl
use Data::Dumper;

our ($pass,$fail,$total_cases,$skipped)=0;
my $i=1;
my ($start_time, $end_time, $test_start_timestamp, $test_end_timestamp);
my $execution_time;
my %output_summary;
# Read the output log into an array 

  open(LF,"<results.txt") or die "Cannot open t1.txt file for read :$!";
  our @output_log = <LF>;
  close(LF);

get_testcase_cases_count_n_status();

sub get_testcase_cases_count_n_status
{
  foreach (@output_log) 
  { 
    chomp($_);
    next if($_ =~ /^$/);
    my @array=split('\:',$_);
    my @result = grep(s/\s* / /g, @array);
    $output_summary{$i}{tc_name}=$result[0]; 
    my $test_case_result = uc($result[-1]) . "ED";
    $output_summary{$i}{status}=$test_case_result; 
    if($output_summary{$i}{status} =~ m/PASSED/) { 
      $pass++;
      $total_cases++;
    }elsif($output_summary{$i}{status} =~ m/FAILED/) {
      $fail++;
      $total_cases++;
    }
    $i++;
  }
}
print "\n Total test cases = $total_cases \n";
print "\n Total Passed test cases = $pass \n";
print "\n Total Failed test cases = $fail \n";

generate_report();

sub generate_report
{
#Write JUnit Report xml file
  open(FH,">JUnitReport.xml") or die "Cannot open JunitReport.xml file for write :$!";
  select FH;
  print qq(<?xml version="1.0" encoding="UTF-8"?>\n);
  print qq(<testsuites>\n);
  print qq(\t<testsuite classname="CLI_COMMANDS" disabled="0" errors="0" failures="$fail" hostname="$hostname" id="1" name="Admin CLI Commands DC" package="" skipped="0" tests="$total_cases" time="0" timestamp="0">\n);
  foreach (1..$total_cases)
  {
    print qq(\t\t<testcase id="$_" classname="CLI_COMMANDS.PASS" name="$output_summary{$_}{tc_name}" status="$output_summary{$_}{status}" time="">\n) if($output_summary{$_}{status} =~ m/PASS/);
    print qq(\t\t<testcase id="$_" classname="CLI_COMMANDS.FAIL" name="$output_summary{$_}{tc_name}" status="$output_summary{$_}{status}" time="">\n) if($output_summary{$_}{status} =~ m/FAIL/);
    print qq(\t\t<testcase id="$_" classname="CLI_COMMANDS.SKIP" name="$output_summary{$_}{tc_name}" status="$output_summary{$_}{status}" time="">\n) if($output_summary{$_}{status} =~ m/SKIP/);
    print qq(\t\t\t<failure message=" " type="ERROR"/>\n) if ($output_summary{$_}{status} =~ m/FAIL/);
    print qq(\t\t</testcase>\n);
  }
  print qq(\t</testsuite>\n);
  print qq(</testsuites>\n);
  close(FH);
  select STDOUT;
}
