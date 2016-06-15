#!/usr/bin/perl
use strict;
use Infoblox;
use Data::Dumper;
my $boolean="true";

my $Master_ip   = @ARGV[0] ;
my $session = Infoblox::Session->new(
                master   => $Master_ip, #appliance host ip
                username => "admin",       #appliance user login
                password => "infoblox"     #appliance password
 );
 unless ($session) {
        die("Construct session failed: ",
                Infoblox::status_code() . ":" . Infoblox::status_detail());
 }
 print "Session created successfully\n";


my @result_array = $session->get(
     object => " Infoblox::Grid::Reporting",
     #object => "Infoblox::Grid::Member::Reporting",
     #name => "member1.infoblox.com",
 );
 my $for_obj = $result_array[0];
 unless($for_obj){
        die("Get/Member reporting properties failed: ",
        $session->status_code() . ":" . $session->status_detail());
        }
 print "Get/Member reporting properties is sucess\n";

print Infoblox::status_code() . ":" . Infoblox::status_detail();
#print Dumper @result_array;

$for_obj->enabled("$boolean");
$for_obj->cat_dhcp_lease("$boolean");
$for_obj->cat_dns_perf("$boolean");
$for_obj->cat_ddns("$boolean");
$for_obj->cat_dhcp_fingerprint("$boolean");
$for_obj->cat_security("$boolean");
#$for_obj->cat_dhcp_perf("$boolean");
#$for_obj->cat_ipam("$boolean");
#$for_obj->cat_system("$boolean");
#$for_obj->cat_discovery("$boolean");
$for_obj->cat_dns_query("$boolean");
#$for_obj->cat_audit("false");
#$for_obj->override_audit("true");

 $session->modify($result_array[0])
         or die("Update Grid/Member Reporting Properties has failed: ",
                $session->status_code(). ":" .$session->status_detail());
  print "Grid/Member Reporting Properties updated successfully.\n";

