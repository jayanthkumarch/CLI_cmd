import ib_NIOS_latest 
import json
import unittest
import pytest
import requests
import ConfigParser

CONF = "Validate_dnsloginput_parquetoutput.ini"
parser = ConfigParser.SafeConfigParser()
parser.read(CONF)
DC_VM = parser.get('Default', 'DC_VM')

member_dns_response=ib_NIOS_latest.wapi_request('GET', object_type="member:dns")
print member_dns_response
member_dns_ref=json.loads(member_dns_response)[0]['_ref']
print member_dns_ref
data1 = {"enable_dns":True}
response_a = ib_NIOS_latest.wapi_request('PUT', object_type=member_dns_ref,fields=json.dumps(data1))
print response_a

grid_dns_response = ib_NIOS_latest.wapi_request('GET', object_type="grid:dns")
print grid_dns_response
grid_dns_ref = json.loads(grid_dns_response)[0]['_ref']
print grid_dns_ref
data2 = {"allow_recursive_query":True,"dns_query_capture_file_time_limit":1,"store_locally":True,"logging_categories":{"log_queries":True,"log_responses":True},"capture_dns_queries_on_all_domains":True,"enable_capture_dns_queries":True,"forward_only":True,"forwarders":["10.120.20.28"],"enable_capture_dns_responses":True,"file_transfer_setting":{"type":"SCP","host":DC_VM,"password":"infoblox","username":"admin","directory":"~"}}
response_b = ib_NIOS_latest.wapi_request('PUT', object_type=grid_dns_ref,fields=json.dumps(data2))
print response_b

grid_response=ib_NIOS_latest.wapi_request('GET', object_type="grid")
print grid_response
grid_response_ref=json.loads(grid_response)[0]['_ref']
print grid_response_ref

data3 = {"service_option":"ALL","member_order":"SIMULTANEOUSLY","restart_option":"FORCE_RESTART"}
grid_restart_status=ib_NIOS_latest.wapi_request('POST',object_type=grid_response_ref,params="?_function=restartservices",fields=json.dumps(data3))
print grid_restart_status

