Class {
	#name : #NetatmoAPI,
	#superclass : #Object,
	#instVars : [
		'apiUrl',
		'authorizationCode',
		'token',
		'znClient'
	],
	#category : #'NetatmoAPI-Core'
}

{ #category : #accessing }
NetatmoAPI >> apiUrl [

	^ apiUrl
]

{ #category : #accessing }
NetatmoAPI >> apiUrl: anObject [

	apiUrl := anObject
]

{ #category : #private }
NetatmoAPI >> buildDevices: aDictionary [
	| devices rawBody rawDevices |
	
	devices := OrderedCollection new.
	rawBody := aDictionary at: #body ifAbsent:[ ^devices ].
	rawDevices := rawBody at: #devices ifAbsent:[ ^devices ].
	
	rawDevices do:[ :rawDevice | | device |
		device := NetatmoDevice type: (rawDevice at: #type ifAbsent:[nil]).
		device ifNotNil:[
			
			"Build common devices properties"
			device id: (rawDevice at: '_id' ifPresent:[ :e | e asString ] ifAbsent:[ nil ]).
			device setupDateTime: (rawDevice at: 'date_setup' ifPresent:[ :e | DateAndTime fromUnixTime: e ] ifAbsent:[ nil ]).
			device lastSetupDateTime: (rawDevice at: 'last_setup' ifPresent:[ :e | DateAndTime fromUnixTime: e ] ifAbsent:[ nil ]).
			device lastStatusStoreDateTime: (rawDevice at: 'last_status_store' ifPresent:[ :e | DateAndTime fromUnixTime: e ] ifAbsent:[ nil ]).
			device name: (rawDevice at: 'module_name' ifPresent:[ :e | e asString ] ifAbsent:[ nil ]).
			device firmware: (rawDevice at: 'firmware' ifPresent:[ :e | e asNumber ] ifAbsent:[ nil ]).
			device lastUpgradeDateTime: (rawDevice at: 'last_upgrade' ifPresent:[ :e | DateAndTime fromUnixTime: e ] ifAbsent:[ nil ]).
			device wifiStatus: (rawDevice at: 'wifi_status' ifPresent:[ :e | e asNumber ] ifAbsent:[ nil ]).
			device isReachable: (rawDevice at: 'reachable' ifPresent:[ :e | e ] ifAbsent:[ nil ]).
			
			"Build specific devices properties"
			device isStation ifTrue:[self populateStation: device withRawDatas: rawDevice].
			
			devices add: device.	
		].
	].
	
	^devices
]

{ #category : #private }
NetatmoAPI >> buildMeasures: aDictionary forDataType: aDataType [
	| measures rawMeasures unit |
	
	measures := SortedCollection sortBlock:[ :a :b | a dateTime < b dateTime ].
	rawMeasures := aDictionary at: #body ifAbsent:[ ^ measures ].
	unit := NetatmoDataTypeEnum defaultUnitForDataType: aDataType.
	
	rawMeasures keysAndValuesDo: [ :timestamp :datas | | measure |
		measure := NetatmoMeasure new.
		measure dateTime: (DateAndTime fromUnixTime: timestamp asInteger).
		measure type: aDataType.
		measure data: datas first.
		measure unit: unit.
		
		measures add: measure.	
	].
	
	^measures asOrderedCollection
]

{ #category : #private }
NetatmoAPI >> checkIfError: aDictionary [

	aDictionary ifNil: [ ^ NetatmoError signal ].
	aDictionary ifEmpty: [ ^ NetatmoError signal ].
	aDictionary at: #error ifPresent:[ :dictionary | | error |
		"Create corresponding error"
		error := NetatmoError code: (dictionary at: #code ifAbsent:[nil]).
		dictionary at: #message ifPresent:[ :msg | error messageText: msg asString ] ifAbsent:[ "do nothing" ].
		^ error
 	] ifAbsent:[ "do nothing" ].

	self checkIfZnClientError ifNotNil: [ :e | ^ e ].
	
	^ nil
]

{ #category : #private }
NetatmoAPI >> checkIfZnClientError [

	| statusLine error |
	znClient isSuccess ifTrue:[ ^ nil ].
	
	statusLine := znClient response ifNil: [ ^ NetatmoError new ] ifNotNil: [ :e | e statusLine ].
	statusLine ifNil:[ ^ NetatmoError new ].

	error := NetatmoError code: statusLine code.
	error messageText: statusLine reason.
	
	^ error
]

{ #category : #'api - devices' }
NetatmoAPI >> getHealthyHomeCoachDevice: aDeviceId [
	"aDeviceId is the mac address of the device"
	| result |
	
	aDeviceId ifNil:[^ NetatmoDeviceNotFoundError signal].
	result := znClient 
		url: self apiUrl asString, '/gethomecoachsdata';
		queryAt: 'device_id' put: aDeviceId asString;
		forJsonREST;
		setBearerAuthentication: self token; 
		get.
	
	(self checkIfError: result) ifNotNil:[ :error | ^ error signal ].
	
	^ self buildDevices: result
]

{ #category : #'api - devices' }
NetatmoAPI >> getHealthyHomeCoachDevices [
	| result |
	
	result := znClient 
		url: self apiUrl asString, '/gethomecoachsdata';
		forJsonREST;
		setBearerAuthentication: self token; 
		get.
	
	(self checkIfError: result) ifNotNil:[ :error | ^ error signal ].
	
	^ self buildDevices: result
]

{ #category : #'api - measures' }
NetatmoAPI >> getMeasures: aDeviceId module: aModuleId scale: aDuration types: aTypeOrtypeList dateTimeBegin: dateTimeBegin dateTimeEnd: dateTimeEnd limit: aLimitInteger realTime: isRealTime [
	| result measures scale types |
	
	aDeviceId ifNil:[ ^ NetatmoDeviceNotFoundError signal ].
	aTypeOrtypeList ifNil:[ ^ NetatmoMissingArgumentError signal ].
	
	types := aTypeOrtypeList isString ifTrue:[OrderedCollection with: aTypeOrtypeList] ifFalse:[aTypeOrtypeList].
	scale := self printScale: (aDuration ifNil:[30 minutes]).
	measures := OrderedCollection new.
	
	"Cannot get multiple type list at the same time because of the API cannot return the type of the data, need to build a new request for all data types"
	types do:[ :type |
		znClient 
			url: self apiUrl asString, '/getmeasure';
			queryAt: 'device_id' put: aDeviceId;
			queryAt: 'scale' put: scale;
			queryAt: 'type' put: type;
			queryAt: 'optimize' put: false;
			forJsonREST;
			setBearerAuthentication: self token.
		
		"optional parameters"
		aModuleId ifNotNil:[znClient queryAt: 'module_id' put: aModuleId].
		aLimitInteger ifNotNil:[znClient queryAt: 'limit' put: aLimitInteger asInteger].
		isRealTime ifNotNil:[znClient queryAt: 'real_time' put: isRealTime].
		dateTimeBegin ifNotNil:[znClient queryAt: 'date_begin' put: dateTimeBegin asUnixTime].
		dateTimeEnd ifNotNil:[znClient queryAt: 'date_end' put: dateTimeEnd asUnixTime].
			
		result := znClient get.
		
		(self checkIfError: result) ifNotNil:[ :error | ^ error signal ].
		
		measures addAll: ((self buildMeasures: result forDataType: type) ifNil:[OrderedCollection new]).
	].

	^ measures
	
	
	
	
]

{ #category : #'api - measures' }
NetatmoAPI >> getMeasures: aDeviceId module: aModuleId types: aTypeOrtypeList [
	
	^self getMeasures: aDeviceId module: aModuleId scale: nil types: aTypeOrtypeList dateTimeBegin: nil dateTimeEnd: nil limit: nil realTime: nil
]

{ #category : #'api - measures' }
NetatmoAPI >> getMeasures: aDeviceId module: aModuleId types: aTypeOrtypeList dateTimeBegin: dateTimeBegin dateTimeEnd: dateTimeEnd [
	
	^self getMeasures: aDeviceId module: aModuleId scale: nil types: aTypeOrtypeList dateTimeBegin: dateTimeBegin dateTimeEnd: dateTimeEnd limit: nil realTime: nil
]

{ #category : #'api - measures' }
NetatmoAPI >> getMeasures: aDeviceId module: aModuleId types: aTypeOrtypeList scale: aDuration dateTimeBegin: dateTimeBegin dateTimeEnd: dateTimeEnd [
	
	^self getMeasures: aDeviceId module: aModuleId scale: aDuration types: aTypeOrtypeList dateTimeBegin: dateTimeBegin dateTimeEnd: dateTimeEnd limit: nil realTime: nil
]

{ #category : #'api - measures' }
NetatmoAPI >> getMeasures: aDeviceId scale: aDuration types: aTypeOrtypeList dateTimeBegin: dateTimeBegin dateTimeEnd: dateTimeEnd limit: aLimitInteger realTime: isRealTime [
	
	^self getMeasures: aDeviceId module: nil scale: aDuration types: aTypeOrtypeList dateTimeBegin: dateTimeBegin dateTimeEnd: dateTimeEnd limit: aLimitInteger realTime: isRealTime
]

{ #category : #'api - measures' }
NetatmoAPI >> getMeasures: aDeviceId types: aTypeOrtypeList [
	
	^self getMeasures: aDeviceId scale: nil types: aTypeOrtypeList dateTimeBegin: nil dateTimeEnd: nil limit: nil realTime: nil
]

{ #category : #'api - measures' }
NetatmoAPI >> getMeasures: aDeviceId types: aTypeOrtypeList dateTimeBegin: dateTimeBegin dateTimeEnd: dateTimeEnd [
	
	^self getMeasures: aDeviceId scale: nil types: aTypeOrtypeList dateTimeBegin: dateTimeBegin dateTimeEnd: dateTimeEnd limit: nil realTime: nil
]

{ #category : #'api - measures' }
NetatmoAPI >> getMeasures: aDeviceId types: aTypeOrtypeList scale: aDuration dateTimeBegin: dateTimeBegin dateTimeEnd: dateTimeEnd [
	
	^self getMeasures: aDeviceId scale: aDuration types: aTypeOrtypeList dateTimeBegin: dateTimeBegin dateTimeEnd: dateTimeEnd limit: nil realTime: nil
]

{ #category : #'api - devices' }
NetatmoAPI >> getStationDevice: aDeviceId [
	"aDeviceId is the mac address of the device"
	| result |
	
	aDeviceId ifNil:[^ NetatmoDeviceNotFoundError signal].
	result := znClient 
		url: self apiUrl asString, '/getstationsdata';
		queryAt: 'device_id' put: aDeviceId asString;
		forJsonREST;
		setBearerAuthentication: self token; 
		get.
	
	(self checkIfError: result) ifNotNil:[ :error | ^ error signal ].
	
	^ self buildDevices: result
]

{ #category : #'api - devices' }
NetatmoAPI >> getStationDevices [
	| result |
	
	result := znClient 
		url: self apiUrl asString, '/getstationsdata';
		forJsonREST;
		setBearerAuthentication: self token; 
		get.
	
	(self checkIfError: result) ifNotNil:[ :error | ^ error signal ].
	
	^ self buildDevices: result
]

{ #category : #initialization }
NetatmoAPI >> initialize [

	super initialize.
	self apiUrl: 'https://api.netatmo.com/api'.
	znClient := ZnClient new.
]

{ #category : #private }
NetatmoAPI >> populateStation: device withRawDatas: rawDevice [
	"Populate a station with station datas from a raw data source"
	
	| modules list |
	"Search for mpdules"
	modules := OrderedCollection new.
	list := rawDevice at: #modules ifAbsent:[OrderedCollection new].
	list do:[ :object |
		(object isKindOf: Dictionary) 
			ifTrue:[modules addAll: (object at: #oneOf ifAbsent:[OrderedCollection new])]
			ifFalse:[modules add: object].
	].
	
	"Create modules if necessary"
	modules do:[ :rawModule | | module |
		module := NetatmoDevice type: (rawModule at: #type ifAbsent:[nil]).
		module ifNotNil:[ 
			
			"Build common modules properties"
			module id: (rawModule at: '_id' ifPresent:[ :e | e asString ] ifAbsent:[ nil ]).
			module batteryPercent: (rawModule at: 'battery_percent' ifPresent:[ :e | e asNumber ] ifAbsent:[ nil ]).
			module batteryStatus: (rawModule at: 'battery_vp' ifPresent:[ :e | e asNumber ] ifAbsent:[ nil ]).
			"TODO : dashboard data"
			"TODO : data type"
			module firmware: (rawModule at: 'firmware' ifPresent:[ :e | e asNumber ] ifAbsent:[ nil ]).
			module lastMessageDateTime: (rawModule at: 'last_message' ifPresent:[ :e | DateAndTime fromUnixTime: e ] ifAbsent:[ nil ]).
			module lastSeenDateTime: (rawModule at: 'last_seen' ifPresent:[ :e | DateAndTime fromUnixTime: e ] ifAbsent:[ nil ]).
			module lastSetupDateTime: (rawModule at: 'last_setup' ifPresent:[ :e | DateAndTime fromUnixTime: e ] ifAbsent:[ nil ]).
			module name: (rawModule at: 'module_name' ifPresent:[ :e | e asString ] ifAbsent:[ nil ]).
			module isReachable: (rawModule at: 'reachable' ifPresent:[ :e | e ] ifAbsent:[ nil ]).
			module radioStatus: (rawModule at: 'rf_status' ifPresent:[ :e | e asNumber ] ifAbsent:[ nil ]).
			
			device modules add: module.
		].
	].
	
]

{ #category : #private }
NetatmoAPI >> printScale: aDuration [
	"Print scale as the expected format"
	"Return only supported values"

	aDuration = 30 minutes ifTrue:[ ^'30min' ].
	aDuration = 1 hour ifTrue:[ ^'1hour' ].
	aDuration = 3 hours ifTrue:[ ^'3hours' ].
	aDuration = 1 day ifTrue:[ ^'1day' ].
	aDuration = 1 week ifTrue:[ ^'1week' ].
	aDuration = (Duration month: 1) ifTrue:[ ^'1month' ].
	
	^ ''
]

{ #category : #accessing }
NetatmoAPI >> token [

	^ token
]

{ #category : #accessing }
NetatmoAPI >> token: anObject [

	token := anObject
]
