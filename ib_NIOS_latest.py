import ConfigParser
import logging
import httplib
import json
import ssl
from json import loads
import requests

CONF="Validate_dnsloginput_parquetoutput.ini"
parser = ConfigParser.SafeConfigParser()
parser.read(CONF)
GRID_VIP = parser.get('Default', 'GRID_VIP')
DC_VM = parser.get('Default', 'DC_VM')
USERNAME = 'admin'
PASSWORD = 'infoblox'
DEFAULT_OBJECT_TYPE = 'network'
URLENCODED = 'application/json'
DEFAULT_CONTENT_TYPE = URLENCODED
VERSION = '2.3'
PATH = '/wapi/v' + VERSION + '/'
JSON = 'application/json'

logging.basicConfig(filename='output.log',level=logging.DEBUG,filemode='w')

# WAPI Call methods

def wapi_request(operation, ref='', params='', fields='', \
                    object_type=DEFAULT_OBJECT_TYPE, \
                    content_type=DEFAULT_CONTENT_TYPE):
    '''
    Send an HTTPS request to the NIOS server.
    '''
    # Create connection and request header.
    # This class does not perform any verification of the server`s certificate.
    #conn = httplib.HTTPSConnection(GRID_VIP,context=ssl._create_unverified_context())
    conn = httplib.HTTPSConnection(GRID_VIP)
    auth_header = 'Basic %s' % (':'.join([USERNAME, PASSWORD])
                                .encode('Base64').strip('\r\n'))
    request_header = {'Authorization':auth_header,
                      'Content-Type': content_type}
    if ref:
        url = PATH + ref
    else:
        url = PATH + object_type
    if params:
        url += params
    conn.request(operation, url, fields, request_header)
    response = conn.getresponse();
    if response.status >= 200 and response.status < 300:
        return handle_success(response)
    else:
        return handle_exception(response)

def handle_exception(response):
    '''
    If there was encountered an error while performing requested action,
    print response code and error message.
    '''
    logging.info('Request finished with error, response code: %i %s'\
            % (response.status, response.reason))
    json_object = json.loads(response.read())
    logging.info('Error message: %s' % json_object['Error'])
    raise Exception('WAPI Error message: %s' % json_object['Error'])
    return json_object


def handle_success(response):
    '''
    If the action requested by the client was received, understood, accepted
    and processed successfully, print response code and return response body.
    '''
    logging.info('Request finished successfully with response code: %i %s'\
            % (response.status, response.reason))
    return response.read()

