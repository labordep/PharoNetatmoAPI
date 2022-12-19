# Pharo Netatmo API

Pharo Netatmo API implementation for Legrand Netatmo products.

You cannot access data directly from the devices : it is not possible for the moment. The only way to access the data and the devices is via the Netatmo Cloud. You need to be connected to get datas.

## Installing

```smalltalk
Metacello new
   baseline: 'PharoNetatmoAPI';
   repository: 'github://labordep/PharoNetatmoAPI';
   load.
```

## Prerequisites

1 - Create an application access with your Netatmo connect account

For more details [see the official guidelines](https://dev.netatmo.com/guideline).

2 - Create an access token

For more details [see the official security documentation](https://dev.netatmo.com/apidocumentation/oauth)

## How to use

Instanciante ```NetatmoAPI``` to have to request datas from the API. Use a token to setup the connection.

```smalltalk
| api |
api := NetatmoAPI new.
api token: 'yourAccess|tokenHere'
```

Use "api" category methods to request datas.

### Get Healthy Home Coach datas

Get all device, return a list of ```NetatmoHealthyHomeCoach``` devices.

```smalltalk
| devices |
devices := api getHealthyHomeCoachDevices.
```

Get specific device from mac address (id), return a list of ```NetatmoHealthyHomeCoach``` devices.

```smalltalk
| devices |
devices := api getHealthyHomeCoachDevice: '01:23:45:67:89:ab'.
```

## Legals and privacy

Using Netatmo Connect APIs you will have access to very sensitive information. This is particularly true if your app accesses our Cameras (live stream or videos). Make sure you respect user's privacy and have a strong privacy policy.

[Netatmo Connect APIs Terms of Use](https://dev.netatmo.com/legal) 

## Legrand Netatmo API documentation

This ressources are my reference to implement this API.
There are two API product groups : Weather/Security/Energy and HomeCoach/Aircare.

### Weather, Security and Energy products

[General Netatmo documentation](https://dev.netatmo.com/)

More specific produtcs API :
- Weather product : [Weather API Documentation](https://dev.netatmo.com/apidocumentation/weather)
- Energy product : [Energy API Documentation](https://dev.netatmo.com/apidocumentation/energy)
- Security : [Home + Security API Documentation](https://dev.netatmo.com/apidocumentation/security)

### Healthy HomeCoach / Aircare product

[Netatmo Aircare API Documentation](https://dev.netatmo.com/apidocumentation/aircare)
