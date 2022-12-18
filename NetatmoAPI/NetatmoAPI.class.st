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

	self flag:'todo'.
	^OrderedCollection new
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
