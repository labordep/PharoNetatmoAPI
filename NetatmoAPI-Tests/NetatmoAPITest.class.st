Class {
	#name : #NetatmoAPITest,
	#superclass : #TestCase,
	#category : #'NetatmoAPI-Tests-Core'
}

{ #category : #'official samples - errors' }
NetatmoAPITest class >> sampleError0ResponseJSON [
	<script: 'self error0ResponseJSON inspect'>

	^STONJSON fromString:
'
{
"error":{
"code":0,
"message":"explicit error"
}
}
'
]

{ #category : #'official samples - errors' }
NetatmoAPITest class >> sampleError10ResponseJSON [
	<script: 'self sampleError10ResponseJSON inspect'>

	^STONJSON fromString:
'{
"error":{
"code":10,
"message":"Argument(s) is(are) missing"
}
}'
]

{ #category : #'official samples - errors' }
NetatmoAPITest class >> sampleError3ResponseJSON [
	<script: 'self sampleError3ResponseJSON inspect'>

	^STONJSON fromString:
'
{
"error":{
"code":3,
"message":"Access token expired"
}
}
'
]

{ #category : #'official samples - errors' }
NetatmoAPITest class >> sampleError9ResponseJSON [
	<script: 'self sampleError9ResponseJSON inspect'>

	^STONJSON fromString:
'
{
"error":{
"code":9,
"message":"Device not found"
}
}
'
]

{ #category : #'official samples - data' }
NetatmoAPITest class >> sampleGetHealthyHomeCoachsDataResponseJSON [
	<script: 'self sampleGetHealthyHomeCoachsDataResponseJSON inspect'>

	^STONJSON fromString:
'
{
"body":{
"devices":[
{
"_id":"70:ee:50:22:a3:00",
"date_setup":1513707043,
"last_setup":1513707043,
"type":"NHC",
"last_status_store":1555677748,
"module_name":"string",
"firmware":45,
"last_upgrade":0,
"wifi_status":22,
"reachable":true,
"co2_calibrating":false,
"station_name":"Bedroom",
"data_type":[
"Temperature, CO2, Humidity, Noise, Pressure, health_idx"
],
"place":{
"altitude":45,
"city":"Boulogne-billancourt",
"country":"string",
"timezone":"Europe/Paris",
"location":[
"30.89600807058707, 29.94281464724796"
]
},
"dashboard_data":{
"time_utc":1555677739,
"Temperature":23.7,
"CO2":967,
"Humidity":41,
"Noise":42,
"Pressure":45,
"AbsolutePressure":1022.9,
"health_idx":1,
"min_temp":21.2,
"max_temp":27.4,
"date_max_temp":1555662436,
"date_min_temp":1555631374
},
"name":"Bedroom Baby",
"read_only":true
}
],
"user":{
"mail":"name@mail.com",
"administrative":{
"lang":"fr-FR",
"reg_locale":"fr-FR",
"country":"FR",
"unit":"GB",
"windunit":1,
"pressureunit":0,
"feel_like_algo":0
}
}
},
"status":"ok",
"time_exec":"0.060059070587158",
"time_server":"1553777827"
}
'
]

{ #category : #'official samples - data' }
NetatmoAPITest class >> sampleGetStationsDataResponseJSON [
	<script: 'self sampleGetStationsDataResponseJSON inspect'>

	^STONJSON fromString:
'
{
"body":{
"devices":[
{
"_id":"70:ee:50:22:a3:00",
"date_setup":1435834348,
"last_setup":1435834348,
"type":"NAMain",
"last_status_store":1555677748,
"module_name":"Indoor",
"firmware":137,
"last_upgrade":1512405614,
"wifi_status":55,
"reachable":true,
"co2_calibrating":false,
"station_name":"Casa",
"data_type":[
"string"
],
"place":{
"timezone":"Africa/Lagos",
"country":"EG",
"altitude":144,
"location":[
"30.89600807058707, 29.94281464724796"
]
},
"read_only":true,
"home_id":"594xxxxxxxxxdb",
"home_name":"Home",
"dashboard_data":{
"time_utc":1555677739,
"Temperature":23.7,
"CO2":967,
"Humidity":41,
"Noise":42,
"Pressure":997.6,
"AbsolutePressure":1017.4,
"min_temp":21.2,
"max_temp":27.4,
"date_min_temp":1555631374,
"date_max_temp":1555662436,
"temp_trend":"up",
"pressure_trend":"up"
},
"modules":[
{
"oneOf":[
{
"_id":"06:00:00:02:47:00",
"type":"NAModule4",
"module_name":"Indoor Module",
"data_type":[
"Temperature, Humidity, CO2"
],
"last_setup":1435834348,
"reachable":true,
"dashboard_data":{
"time_utc":1555677739,
"Temperature":23.7,
"CO2":967,
"Humidity":41,
"Pressure":997.6,
"AbsolutePressure":1017.4,
"min_temp":21.2,
"max_temp":27.4,
"date_min_temp":1555631374,
"date_max_temp":1555662436,
"temp_trend":"up"
},
"firmware":19,
"last_message":1555677746,
"last_seen":1555677746,
"rf_status":31,
"battery_vp":5148,
"battery_percent":58
},
{
"_id":"06:00:00:02:47:00",
"type":"NAModule1",
"module_name":"Outdoor Module",
"data_type":[
"Temperature, Humidity"
],
"last_setup":1435834348,
"reachable":true,
"dashboard_data":{
"time_utc":1555677739,
"Temperature":23.7,
"Humidity":41,
"min_temp":21.2,
"max_temp":27.4,
"date_min_temp":1555631374,
"date_max_temp":1555662436,
"temp_trend":"up"
},
"firmware":19,
"last_message":1555677746,
"last_seen":1555677746,
"rf_status":31,
"battery_vp":5148,
"battery_percent":58
},
{
"_id":"06:00:00:02:47:00",
"type":"NAModule3",
"module_name":"Rain gauge",
"data_type":[
"Rain"
],
"last_setup":1435834348,
"reachable":true,
"dashboard_data":{
"time_utc":1555677734,
"Rain":0,
"sum_rain_24":0,
"sum_rain_1":0
},
"firmware":19,
"last_message":1555677746,
"last_seen":1555677746,
"rf_status":31,
"battery_vp":5148,
"battery_percent":58
},
{
"_id":"06:00:00:02:47:00",
"type":"NAModule2",
"module_name":"Wind Module",
"data_type":[
"Wind"
],
"last_setup":1435834348,
"battery_percent":58,
"reachable":true,
"firmware":19,
"last_message":1555677746,
"last_seen":1555677746,
"rf_status":31,
"battery_vp":5148,
"dashboard_data":{
"time_utc":1555677734,
"WindStrength":2,
"WindAngle":75,
"GustStrength":3,
"GustAngle":75,
"max_wind_str":4,
"max_wind_angle":100,
"date_max_wind_str":1555673190
}
}
]
}
]
}
],
"user":{
"mail":"name@mail.com",
"administrative":{
"reg_locale":"fr-FR",
"lang":"fr-FR",
"country":"FR",
"unit":0,
"windunit":0,
"pressureunit":0,
"feel_like_algo":0
}
}
},
"status":"ok",
"time_exec":"0.060059070587158",
"time_server":"1553777827"
}
'
]

{ #category : #test }
NetatmoAPITest >> testBuildHealthyHomeCoachsDevices [

	| api devices device |
	api := NetatmoAPI new.
	
	devices := api buildDevices: self class sampleGetHealthyHomeCoachsDataResponseJSON.
	self assert: devices size equals: 1.
	
	device := devices first.
	self assert: device isHealthyHomeCoach.
	self assert: device id equals: '70:ee:50:22:a3:00'.
	self assert: device firmware equals: 45.
	self assert: device isReachable.
	self assert: device name equals: 'string'.
	self assert: device lastSetupDateTime equals: (DateAndTime fromUnixTime: 1513707043).
	self assert: device lastStatusStoreDateTime equals: (DateAndTime fromUnixTime: 1555677748).
	self assert: device lastUpgradeDateTime equals: (DateAndTime fromUnixTime: 0).
	self assert: device setupDateTime equals: (DateAndTime fromUnixTime: 1513707043).
	self assert: device wifiStatus equals: 22.
]

{ #category : #test }
NetatmoAPITest >> testBuildStationDevices [

	| api devices device |
	api := NetatmoAPI new.
	
	devices := api buildDevices: self class sampleGetStationsDataResponseJSON.
	self assert: devices size equals: 1.
	
	device := devices first.
	"test device properties"
	self assert: device isStation.
	self assert: device id equals: '70:ee:50:22:a3:00'.
	self assert: device firmware equals: 137.
	self assert: device isReachable.
	self assert: device name equals: 'Indoor'.
	self assert: device lastSetupDateTime equals: (DateAndTime fromUnixTime: 1435834348).
	self assert: device lastStatusStoreDateTime equals: (DateAndTime fromUnixTime: 1555677748).
	self assert: device lastUpgradeDateTime equals: (DateAndTime fromUnixTime: 1512405614).
	self assert: device setupDateTime equals: (DateAndTime fromUnixTime: 1435834348).
	self assert: device wifiStatus equals: 55.
	self assert: device wifiStatusSignalQuality equals: 'Good'.
	
	"test device modules properties"
	self assert: device haveModules.
	self assert: device numberOfModules equals: 4.
]

{ #category : #test }
NetatmoAPITest >> testBuildStationDevicesModules [

	| api devices device module1 module2 module3 module4 |
	api := NetatmoAPI new.
	
	devices := api buildDevices: self class sampleGetStationsDataResponseJSON.
	self assert: devices size equals: 1.
	device := devices first.
	
	module1 := device modules at: 1.
	"Device properties"
	self assert: module1 isStation not.
	self assert: module1 isIndoorModule.
	self assert: module1 id equals: '06:00:00:02:47:00'.
	self assert: module1 firmware equals: 19.
	self assert: module1 isReachable.
	self assert: module1 name equals: 'Indoor Module'.
	self assert: module1 lastSetupDateTime equals: (DateAndTime fromUnixTime: 1435834348).
	self assert: module1 lastStatusStoreDateTime isNil.
	self assert: module1 lastUpgradeDateTime isNil.
	self assert: module1 setupDateTime isNil.
	self assert: module1 wifiStatus isNil.
	self assert: module1 wifiStatusSignalQuality equals: 'N/A'.
	"Modules properties"
	self assert: module1 batteryPercent equals: 58.
	self assert: module1 batteryStatus equals: 5148.
	self assert: module1 batteryStatusDescription equals: 'High'.
	self assert: module1 lastMessageDateTime equals: (DateAndTime fromUnixTime: 1555677746).
	self assert: module1 lastSeenDateTime equals: (DateAndTime fromUnixTime: 1555677746).
	self assert: module1 radioStatus equals: 31.
	
	module2 := device modules at: 2.
	"Device properties"
	self assert: module2 isStation not.
	self assert: module2 isOutdoorModule.
	self assert: module2 id equals: '06:00:00:02:47:00'.
	self assert: module2 firmware equals: 19.
	self assert: module2 isReachable.
	self assert: module2 name equals: 'Outdoor Module'.
	self assert: module2 lastSetupDateTime equals: (DateAndTime fromUnixTime: 1435834348).
	self assert: module2 lastStatusStoreDateTime isNil.
	self assert: module2 lastUpgradeDateTime isNil.
	self assert: module2 setupDateTime isNil.
	self assert: module2 wifiStatus isNil.
	self assert: module2 wifiStatusSignalQuality equals: 'N/A'.
	"Modules properties"
	self assert: module2 batteryPercent equals: 58.
	self assert: module2 batteryStatus equals: 5148.
	self assert: module2 batteryStatusDescription equals: 'High'.
	self assert: module2 lastMessageDateTime equals: (DateAndTime fromUnixTime: 1555677746).
	self assert: module2 lastSeenDateTime equals: (DateAndTime fromUnixTime: 1555677746).
	self assert: module2 radioStatus equals: 31.
	
	module3 := device modules at: 3.
	"Device properties"
	self assert: module3 isStation not.
	self assert: module3 isRainGaugeModule.
	self assert: module3 id equals: '06:00:00:02:47:00'.
	self assert: module3 firmware equals: 19.
	self assert: module3 isReachable.
	self assert: module3 name equals: 'Rain gauge'.
	self assert: module3 lastSetupDateTime equals: (DateAndTime fromUnixTime: 1435834348).
	self assert: module3 lastStatusStoreDateTime isNil.
	self assert: module3 lastUpgradeDateTime isNil.
	self assert: module3 setupDateTime isNil.
	self assert: module3 wifiStatus isNil.
	self assert: module3 wifiStatusSignalQuality equals: 'N/A'.
	"Modules properties"
	self assert: module3 batteryPercent equals: 58.
	self assert: module3 batteryStatus equals: 5148.
	self assert: module3 batteryStatusDescription equals: 'High'.
	self assert: module3 lastMessageDateTime equals: (DateAndTime fromUnixTime: 1555677746).
	self assert: module3 lastSeenDateTime equals: (DateAndTime fromUnixTime: 1555677746).
	self assert: module3 radioStatus equals: 31.
	
	module4 := device modules at: 4.
	"Device properties"
	self assert: module4 isStation not.
	self assert: module4 isAnemometerModule.
	self assert: module4 id equals: '06:00:00:02:47:00'.
	self assert: module4 firmware equals: 19.
	self assert: module4 isReachable.
	self assert: module4 name equals: 'Wind Module'.
	self assert: module4 lastSetupDateTime equals: (DateAndTime fromUnixTime: 1435834348).
	self assert: module4 lastStatusStoreDateTime isNil.
	self assert: module4 lastUpgradeDateTime isNil.
	self assert: module4 setupDateTime isNil.
	self assert: module4 wifiStatus isNil.
	self assert: module4 wifiStatusSignalQuality equals: 'N/A'.
	"Modules properties"
	self assert: module4 batteryPercent equals: 58.
	self assert: module4 batteryStatus equals: 5148.
	self assert: module4 batteryStatusDescription equals: 'Medium'.
	self assert: module4 lastMessageDateTime equals: (DateAndTime fromUnixTime: 1555677746).
	self assert: module4 lastSeenDateTime equals: (DateAndTime fromUnixTime: 1555677746).
	self assert: module4 radioStatus equals: 31.
]

{ #category : #test }
NetatmoAPITest >> testCheckIfError [

	| api |
	api := NetatmoAPI new.
	
	self assert: ((api checkIfError: self class sampleError0ResponseJSON) isKindOf: NetatmoExplicitError).
	self assert: ((api checkIfError: self class sampleError3ResponseJSON) isKindOf: NetatmoExpiredTokenError).
	self assert: ((api checkIfError: self class sampleError9ResponseJSON) isKindOf: NetatmoDeviceNotFoundError).
	self assert: ((api checkIfError: self class sampleError10ResponseJSON) isKindOf: NetatmoMissingArgumentError).
]

{ #category : #tests }
NetatmoAPITest >> testConnexionErrors [ 

	| api error |
	api := NetatmoAPI new.
	error := nil.

	[api getHealthyHomeCoachDevices] onErrorDo:[ :e | error := e].
	self assert: (error isKindOf: NetatmoMissingAccessTokenError).
	
	api token: 'badtoken'.
	[api getHealthyHomeCoachDevices] onErrorDo:[ :e | error := e].
	self assert: (error isKindOf: NetatmoInvalidAccessTokenError).
	
	api apiUrl: nil.
	[api getHealthyHomeCoachDevices] onErrorDo:[ :e | error := e].
	self assert: (error isKindOf: Error). "Type of the Error depends of the JSON used library : STONJSON or NeoJSON"
]

{ #category : #test }
NetatmoAPITest >> testPrintScale [

	| api |
	api := NetatmoAPI new.
	self assert: (api printScale: 30 minutes) equals: '30min'.
	self assert: (api printScale: 1 hour) equals: '1hour'.
	self assert: (api printScale: 3 hours) equals: '3hours'.
	self assert: (api printScale: 1 day) equals: '1day'.
	self assert: (api printScale: 1 week) equals: '1week'.
	self assert: (api printScale: (Duration month: 1)) equals: '1month'.
]

{ #category : #test }
NetatmoAPITest >> testStationDevicesModulesAccessing [

	| api devices device modules |
	api := NetatmoAPI new.
	
	devices := api buildDevices: self class sampleGetStationsDataResponseJSON.
	self assert: devices size equals: 1.
	device := devices first.
	
	modules := device anemometerModules.
	self assert: modules size equals: 1.
	self assert: modules first isAnemometerModule. 
	
	modules := device indoorModules.
	self assert: modules size equals: 1.
	self assert: modules first isIndoorModule. 
	
	modules := device outdoorModules.
	self assert: modules size equals: 1.
	self assert: modules first isOutdoorModule. 
	
	modules := device rainGaugeModules. 
	self assert: modules size equals: 1.
	self assert: modules first isRainGaugeModule. 
]
