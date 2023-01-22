"
A NetatmoStationTest is a test class for testing the behavior of NetatmoStation
"
Class {
	#name : #NetatmoStationTest,
	#superclass : #TestCase,
	#category : #'NetatmoAPI-Tests-Model'
}

{ #category : #tests }
NetatmoStationTest >> testConstructor [ 
	| deviceList |
	
	deviceList := OrderedCollection new.
	deviceList add: NetatmoStation new.
	deviceList add: (NetatmoDevice type: NetatmoStation type).
	
	deviceList do:[ :device |
		self assert: device type equals: NetatmoStation type.
		self assert: device product equals: NetatmoStation product.
		self assert: device isStation.
		self assert: device haveModules not.
		self assert: device haveOutdoorModules not.
		self assert: device haveIndoorModules not.
		self assert: device haveAnemometerModules not.
		self assert: device haveRainGaugeModules not.
	].
]
