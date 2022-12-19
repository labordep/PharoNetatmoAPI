Class {
	#name : #NetatmoAPI,
	#superclass : #Object,
	#instVars : [
		'apiUrl',
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
			
			device id: (rawDevice at: '_id' ifPresent:[ :e | e asString ] ifAbsent:[ nil ]).
			device setupDateTime: (rawDevice at: 'date_setup' ifPresent:[ :e | DateAndTime fromUnixTime: e ] ifAbsent:[ nil ]).
			device lastSetupDateTime: (rawDevice at: 'last_setup' ifPresent:[ :e | DateAndTime fromUnixTime: e ] ifAbsent:[ nil ]).
			device lastStatusStoreDateTime: (rawDevice at: 'last_status_store' ifPresent:[ :e | DateAndTime fromUnixTime: e ] ifAbsent:[ nil ]).
			device name: (rawDevice at: 'module_name' ifPresent:[ :e | e asString ] ifAbsent:[ nil ]).
			device firmware: (rawDevice at: 'firmware' ifPresent:[ :e | e asNumber ] ifAbsent:[ nil ]).
			device lastUpgradeDateTime: (rawDevice at: 'last_upgrade' ifPresent:[ :e | DateAndTime fromUnixTime: e ] ifAbsent:[ nil ]).
			device wifiStatus: (rawDevice at: 'wifi_status' ifPresent:[ :e | e asNumber ] ifAbsent:[ nil ]).
			device isReachable: (rawDevice at: 'reachable' ifPresent:[ :e | e ] ifAbsent:[ nil ]).
			
			devices add: device.	
		].
	].
	
	^devices
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
	
	^ nil
]

{ #category : #api }
NetatmoAPI >> getSmartHomeWeatherStations [

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
	znClient := ZnClient new
]

{ #category : #accessing }
NetatmoAPI >> token [

	^ token
]

{ #category : #accessing }
NetatmoAPI >> token: anObject [

	token := anObject
]
