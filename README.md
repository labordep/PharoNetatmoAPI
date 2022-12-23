# Pharo Netatmo API

Pharo Netatmo API implementation for Legrand Netatmo products.

## Connexion and authentication

You cannot access data directly from the devices : it is not possible for the moment. The only way to access the data and the devices is via the Netatmo Cloud. You need to be Internet connected to get datas from your devices.

For the moment you should use the api by passing your access token. The automatic token managment is made by Netatmo with an OAuth2 protocol. This is not yet implement in this project, the long term objective is to have this kind of connexion for a desktop applications. There are some works about OAuth2 in "incubator" package, see next updates...

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

### Get Weather station datas

Get all device, return a list of ```NetatmoStation``` devices.

```smalltalk
| devices |
devices := api getStationDevices.
```

Get specific device from mac address (id), return a list of ```NetatmoStation``` devices.

```smalltalk
| devices |
devices := api getStationDevice:: '01:23:45:67:89:ab'.
```

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

### Get measures from a device

Use the API to get measure from a device, return a list of ```NetatmoMeasure``` measures. 
Each ```NetatmoMeasure``` contains data (for example 56), type (for example humidity), unit (for example '%') and date time of the measure.
Use ```types:``` to choose data type with ```NetatmoDataTypeEnum``` enums.

Get one type of data from a device.

```smalltalk
| measures |
measures := api getMeasures: (device id) 
                types: NetatmoDataTypeEnum humidity.
```

Get multiples types of data from a device.

```smalltalk
| measures |
measures := api getMeasures: (device id) 
                types: (OrderedCollection 
                           with: NetatmoDataTypeEnum temperature 
                           with: NetatmoDataTypeEnum humidity).
```

Is it possible to request a date time interval of measure, with a scale for the sample.
Example : get temperature each days at the current time in the last week.

```smalltalk
| measures |
measures := api getMeasures: (device id) 
                types: NetatmoDataTypeEnum temperature 
                scale: 1 day 
                dateTimeBegin: (DateAndTime now - 7 day) 
                dateTimeEnd: DateAndTime now.
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
