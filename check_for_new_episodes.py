import time
from apns import APNs, Frame, Payload
from urllib2 import Request, urlopen, URLError

# make get request for devices
request = Request('https://podwise.azurewebsites.net/tables/Devices?ZUMO-API-VERSION=2.0.0')

try:
    response = urlopen(request)
    devices = response.read()
    print devices
except URLError, e:
    print 'Problem getting devices', e

#apns = APNs(use_sandbox=True, cert_file='apnsServer.pem')

# Send an iOS 10 compatible notification
# token_hex = 'a4863f527285da30c449de096ec3911489d70fa6f08953be183448ac7fb0521d'
# payload = Payload(alert="Hello World!", sound="default", badge=1)
# apns.gateway_server.send_notification(token_hex, payload)


# https://podwise.azurewebsites.net/tables/Devices?ZUMO-API-VERSION=2.0.0