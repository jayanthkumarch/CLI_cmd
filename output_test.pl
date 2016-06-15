@output="";

my $cmp_value = system("grep -m '1' 'Name:' serial-automation.log |grep 'DataCollector'");
if ( $cmp_value == 0 )
{
push(@output,"Validating Name CLI CMD: PASS","\n");
}
else {
push(@output,"Validating Name CLI CMD: FAIL","\n");
}


my $cmp_value = system("grep -m '1' 'Version:' serial-automation.log |grep '1.'");
if ( $cmp_value == 0 )
{
push(@output,"Validating Version CLI CMD: PASS","\n");
}
else {
push(@output,"Validating Version CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep -w  'output_reporting_data_filters_viewtype add external vvvv' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating SET VIEWTYPE CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating SET VIEWTYPE CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep -w 'output_reporting_data_filters_member add external mmmm' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating SET MEMBER CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating SET MEMBER CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep -m 1 '.tgz is created' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating GETBUNDLE CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating GETBUNDLE CLI CMD: FAIL","\n");
}


my $cmp_value = system("grep -w 'Access code' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating SET ACCESS CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating SET ACCESS CLI CMD: FAIL","\n");
}



#my $cmp_value = system("grep -w 'admin_support_debug set on' serial-automation.log");
my $cmp_value = system("grep -i -A 1 'admin_support_debug set on' serial-automation.log | grep 'Command applied successfully.'");
if ( $cmp_value == 0 )
{
 push(@output,"Validating SET DEBUG CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating SET DEBUG CLI CMD: FAIL","\n");
}



#my $cmp_value = system("grep -w 'admin_network_hostname set admin' serial-automation.log");
my $cmp_value = system("grep -i -A 1 'grid_username set admin' serial-automation.log | grep 'Command applied successfully.'");
if ( $cmp_value == 0 )
{
 push(@output,"Validating SET HOSTNAME CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating SET HOSTNAME CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep -w 'admin_network_domain set testing.com' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating SET DOMAIN CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating SET DOMAIN CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep -w 'admin_network_ping' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating PING CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating PING CLI CMD: FAIL","\n");
}


my $cmp_value = system("grep -w  'admin_network_dns set 10.0.2.35' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating DNS CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating DNS CLI CMD: FAIL","\n");
}


#my $cmp_value = system("grep -w 'admin_config_banner set Infoblox' serial-automation.log");
my $cmp_value = system("grep -i -A 1 'admin_config_banner set Infoblox' serial-automation.log | grep 'Command applied successfully.'");
if ( $cmp_value == 0 )
{
 push(@output,"Validating SET BANNER CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating SET BANNER CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep -w 'admin_config_uuid' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating UUID CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating UUID CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep  -w 'input_scp_users add admin' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating INPUT SCP USERS CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating INPUT SCP USERS CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep -w 'grid_username set admin' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating SET USERNAME CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating SET USERNAME CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep -w 'VM is not registered with Grid' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating STATUS CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating STATUS CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep  '1 hour' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating REFRESH CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating REFRESH CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep  'Unregistering Data Collector' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating UNREGISTER CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating UNREGISTER CLI CMD: FAIL","\n");
}



#my $cmp_value = system("grep  'grid_address set .*' serial-automation.log");
my $cmp_value = system("grep -i -A 1 'grid_address set .*' ser.log | grep 'Command applied successfully.'");
if ( $cmp_value == 0 )
{
 push(@output,"Validating ADDRESS CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating ADDRESS CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep  'Registering Data Collector VM with the Grid... done.' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating REGISTER CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating REGISTER CLI CMD: FAIL","\n");
}




my $cmp_value = system("grep  'Password updated' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating SET PASSWORD CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating SET PASSWORD CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep  'Updating Grid configuration' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating SET SYNC CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating SET SYNC CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'Grid member time zones:' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating TEST CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating TEST CLI CMD: FAIL","\n");
}


my $cmp_value = system("grep  'admin_network_route set address=10.34.24.1 mask=255.255.255.255 gateway=10.' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.1 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.1 CLI CMD: FAIL","\n");
}


my $cmp_value = system("grep  'admin_network_route set address=10.34.24.2 mask=255.255.255.255 gateway=10.' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.2 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.2 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.3 mask=255.255.255.255 gateway=10.' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.3 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.3 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.4 mask=255.255.255.255 gateway=10.' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.4 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.4 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.5 mask=255.255.255.255 gateway=10.' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.5 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.5 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.6 mask=255.255.255.255 gateway=10.' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.6 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.6 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.7 mask=255.255.255.255 gateway=10.' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.7 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.7 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.8 mask=255.255.255.255 gateway=10.' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.8 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.8 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.9 mask=255.255.255.255 gateway=10.' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.9 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.9 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.10 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.10 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.10 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.11 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.11 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.11 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.12 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.12 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.12 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.13 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.13 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.13 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.14 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.14 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.14 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.15 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.15 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.15 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.16 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.16 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.16 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.17 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.17 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.17 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.18 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.18 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.18 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.19 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.19 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.19 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.20 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.20 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.20 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.21 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.21 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.21 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.22 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.22 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.22 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.23 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.23 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.23 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.24 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.24 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.24 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.25 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.25 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.25 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.26 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.26 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.26 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.27 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.27 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.27 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.28 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.28 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.28 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.29 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.29 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.29 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.30 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.30 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.30 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.31 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.31 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.31 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  'admin_network_route set address=10.34.24.32 mask=255.255.255.255 gateway=1' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating Route for 10.34.24.32 CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating Route for 10.34.24.32 CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep  '.*Reached the max. # of static routes (32).' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"CAPACITY OF STATIC ROUTER IS 32 You have reached the Maximum Number of limits: PASS","\n");
}
else {
 push(@output,"CAPACITY OF STATIC ROUTER IS 32 You have reached the Maximum Number of limits: FAIL","\n");
}



my $cmp_value = system("grep -w  'Uploaded backup to.*' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating BACKUP CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating BACKUP CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep -w  'Uploaded backup to.*' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating BACKUP CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating BACKUP CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep -w  'dc_backup_admin_.*.tgz' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating RESTORE CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating RESTORE CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep -w  'admin_system_virtual_stat' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating VIRTUAL STAT CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating VIRTUAL STAT CLI CMD: FAIL","\n");
}


my $cmp_value = system("grep -w  'Pipeline statistics' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating COUNTERS CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating COUNTER  CLI CMD: FAIL","\n");
}


my $cmp_value = system("grep -w  'Memory usage, %     :' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating MEMORY CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating MEMORY CLI CMD: FAIL","\n");
}


my $cmp_value = system("grep -w  'Disk space usage:' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating DISK CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating DISK CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep -w  'CPU Load, %         :' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating CPU CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating CPU CLI CMD: FAIL","\n");
}


my $cmp_value = system("grep -w  'System statistics deleted.' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating RESET CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating RESET CLI CMD: FAIL","\n");
}



my $cmp_value = system("grep -w  'admin.system.stats > containers' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating CONTAINERS CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating CONTAINERS CLI CMD: FAIL","\n");
}

my $cmp_value = system("grep -w  'Network interfaces statistics' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating NETWORK CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating NETWORK CLI CMD: FAIL","\n");
}


my $cmp_value = system("grep -w  'admin.system.stats > top' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating TOP CLI CMD: PASS","\n");
}
else {
 push(@output,"Validating TOP CLI CMD: FAIL","\n");
}


#####################restore set and restore del #############


my $cmp_value = system("grep -m '1' '.tgz is restored' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating RESTORE SET: PASS","\n");
}
else {
 push(@output,"Validating RESTORE SET: FAIL","\n");
}


my $cmp_value = system("grep -m '1' '.tgz is deleted' serial-automation.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating RESTORE DEL: PASS","\n");
}
else {
 push(@output,"Validating RESTORE DEL: FAIL","\n");
}



####################flume.log#########################


my $cmp_value = system("grep -m '1' 'Last read took us just up to a file boundary.*' flume.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating FILE BOUNDARY in FLUME LOG: PASS","\n");
}
else {
 push(@output,"Validating FILE BOUNDARY in FLUME LOG: FAIL","\n");
}

my $cmp_value = system("grep -m '1' 'Preparing to delete file /infoblox/data/in/flume.*' flume.log");
if ( $cmp_value == 0 )
{
 push(@output,"Validating DELETE in FLUME LOG: PASS","\n");
}
else {
 push(@output,"Validating DELETE BOUNDARY in FLUME LOG: FAIL","\n");
}




###################syslog#################



my $cmp_value = system("grep -m '1' 'Moving /infoblox/data/in/flume/.*' syslog");
if ( $cmp_value == 0 )
{
 push(@output,"Validating MOVING FILE IN SYSLOG: PASS","\n");
}
else {
 push(@output,"Validating MOVING FILE IN SYSLOG: FAIL","\n");
}

my $cmp_value = system("grep -m '1' 'Received file: captured-dns.*' syslog");
if ( $cmp_value == 0 )
{
 push(@output,"Validating RECEIVED FILE IN SYSLOG: PASS","\n");
}
else {
 push(@output,"Validating RECEIVED FILE IN SYSLOG: FAIL","\n");
}

my $cmp_value = system("grep -m '1' 'Deleted /infoblox/data/in/.*' syslog");
if ( $cmp_value == 0 )
{
 push(@output,"Validating DELETED FILE IN SYSLOG: PASS","\n");
}
else {
 push(@output,"Validating DELETED FILE IN SYSLOG: FAIL","\n");
}







foreach(@output)
{

print $_;

}


