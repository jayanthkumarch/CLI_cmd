Manually we can run the script as below:
perl set_test_bk.pl <DC_VM_IP> <Grid_Master_IP> 



Below files does the following functionality:


1. CLI.pm:

Script of perl Pexpect module which run xml file which is given
as input inside script that run all the test cases which is there
in xml file.

2. input.xml:

xml file which has test cases used by perl script(CLI.pm).

3. serial-automation.log:

file used to store all the output in this file.

4. output_test.pl:

script used to validate test cases by using serial-automation.log file.

5. JUnitReport.xml:

scirpt used to generate xml report by using result.txt.

6. CLI_junit.pl

script used to count number of test cases.

7. Wizard.pl

script to run Wizard related test cases.

8. top.pl 

script to run top related test cases. 

9. Reporting_Service.pl: 

Script used to enable reporting service.

