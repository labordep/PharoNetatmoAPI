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

	| device |
	device := NetatmoStation new.
	self assert: device type equals: NetatmoStation type.
	self assert: device isStation.
	
	device := NetatmoDevice type: NetatmoStation type.
	self assert: device type equals: NetatmoStation type.
	self assert: device isStation.
]
