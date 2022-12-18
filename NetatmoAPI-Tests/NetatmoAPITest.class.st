Class {
	#name : #NetatmoAPITest,
	#superclass : #TestCase,
	#category : #'NetatmoAPI-Tests-Core'
}

{ #category : #test }
NetatmoAPITest >> testBuildDevices [

	self flag: #toImplement.
	self assert: false
]

{ #category : #tests }
NetatmoAPITest >> testConnexionErrors [ 

	| api error |
	api := NetatmoAPI new.
	error := nil.

	[api getSmartHomeWeatherStations] onErrorDo:[ :e | error := e].
	self assert: (error isKindOf: NetatmoMissingAccessTokenError).
	
	api token: 'badtoken'.
	[api getSmartHomeWeatherStations] onErrorDo:[ :e | error := e].
	self assert: (error isKindOf: NetatmoInvalidAccessTokenError).
	
	api apiUrl: nil.
	[api getSmartHomeWeatherStations] onErrorDo:[ :e | error := e].
	self assert: (error isKindOf: STONReaderError).
]
