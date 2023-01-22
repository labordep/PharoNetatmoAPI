# Pharo Netatmo API

Pharo Netatmo API implementation for Legrand Netatmo products.

## Connexion and OAuth2 authentication

You cannot access data directly from the devices : Netatmo not provide that for the moment. The only way to access the data and the devices is via Netatmo servers. You need to be connected to Internet to get datas from your devices.

The access require an OAuth2 authentication to get an access token. This token should be refresh in time with another authentication request. For more details about the security see the link to official Netatmo documentation at the bottom of this page. 

OAuth2 authentication is working in this project using Zinc and can be used for desktop or web applications.

When your token is recover, use the api with it during the token validity time.

## Installing

```smalltalk
Metacello new
   baseline: 'NetatmoAPI';
   repository: 'github://labordep/PharoNetatmoAPI:main';
	onConflictUseIncoming;
	ignoreImage;
   load.
```

## Prerequisites

Create an application access with your Netatmo connect account to get your client_id and client_secret datas.
See the bottom section to use the OAuth2 authentication in this project. 

For more details [see the official guidelines](https://dev.netatmo.com/guideline).

## How to authenticate

This section describes how to authenticate and get an access token.
This step is not mandatory if you get manually a token, for example directly by a Netamo account website or another providing library.
When you get a token you can use the API, see next section to have some examples.

First, instanciate a new ```NetatmoAPIAuthentificator``` with your client_id and client_secret datas. You need to specifiy the scope of your datas, for examples : thermostat temperature, humidity, etc. If your are not sure or if you need all use ```NetatmoScopeEnum allReadScopes``` to get all can be read datas.

```smalltalk
authenticator := NetatmoAPIAuthentificator 
	clientId: 'myClientId' 
	clientSecret: 'myClientSecret' 
	scopes: (NetatmoScopeEnum allReadScopes).
```

Now create a new session to request the authentication.
This method return a ```ZnOAuth2Session``` which provide OAuth2 connexion process.

```smalltalk
session := authenticator createOAuth2Session. 
```

If this is the first try to get a token, the session is not live. Call the ```requestUserAuthentication``` method to open your web browser and validate the authentication using the Netatmo online form.

```smalltalk
session isLive ifFalse:[
	authenticator requestUserAuthentication.
].
```
At this step your default web browser open the online Netatmo authentication form :

![image](https://user-images.githubusercontent.com/49183340/211155898-80ff55bc-6129-49df-9d64-b73da93bdd00.png)

Check and accept if you are agree. 
A basic result page is display to confirm the good authentication, close this page when it appears : 

![image](https://user-images.githubusercontent.com/49183340/211156062-c3c5d6d1-9669-49a1-bb1f-19ae43f584bb.png)

Getting your token :

```smalltalk
token := session liveAccessToken.
```

## How to use the API to get datas

Instanciante ```NetatmoAPI``` to have to request datas from the API. Use a token to setup the connection.

```smalltalk
| api |
api := NetatmoAPI new.
api token: 'yourAccess|tokenHere'
```

Use "api" category methods to request datas.

### Get availables devices

Get all devices, return a list of ```NetatmoDevice```. The list can change depending session authorization. 

```smalltalk
| devices |
devices := api getDevices.
```

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
Each ```NetatmoMeasure``` contains data (for example ```56```), type (for example ```'humidity'```), unit (for example ```'%'```), data unit (for example ```Number```) and a ```DateTime``` of the measure.
When requested a measure from the API use ```types:``` to choose data type by passing a list of ```NetatmoMeasureType```.

Get one type of data from a device.

```smalltalk
| measures |
measures := api getMeasures: (device id) 
                types: NetatmoMeasureType humidity.
```

Get multiples types of data from a device.

```smalltalk
| measures |
measures := api getMeasures: (device id) 
                types: (OrderedCollection 
                           with: NetatmoMeasureType temperature 
                           with: NetatmoMeasureType humidity).
```

It is possible to request a date time interval of measure, with a scale for the sample.
Example : get temperature each days at the current time in the last week.

```smalltalk
| measures |
measures := api getMeasures: (device id) 
                types: NetatmoMeasureType temperature 
                scale: 1 day 
                dateTimeBegin: (DateAndTime now - 7 day) 
                dateTimeEnd: DateAndTime now.
```

## More examples

The package ```NetatmoAPI-Examples``` contains some API uses examples with basics user interfaces.
Somes illustrations :

Last 7 days humidity datas :

![image](https://user-images.githubusercontent.com/49183340/213777951-ea53ac13-9e08-4cf5-8319-6215db633046.png)

Oldest temperature datas : 

![image](https://user-images.githubusercontent.com/49183340/213778142-5cdef60d-6634-481f-9aa0-2ff73235083f.png)

A week humidity evolution :

![image](https://user-images.githubusercontent.com/49183340/213778296-c42abfce-c8c5-4b09-a1ef-d036545be709.png)

A week humidity evolution with indoor and outdoor datas :

![image](https://user-images.githubusercontent.com/49183340/213879463-20fbcf14-d8a3-460f-ae1f-6c3ff5c0e41f.png)

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
