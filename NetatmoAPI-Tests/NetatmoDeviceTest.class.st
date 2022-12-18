"
A NetatmoDeviceTest is a test class for testing the behavior of NetatmoDevice
"
Class {
	#name : #NetatmoDeviceTest,
	#superclass : #TestCase,
	#category : #'NetatmoAPI-Tests-Model'
}

{ #category : #tests }
NetatmoDeviceTest >> testConstructor [

	| device |
	device := NetatmoDevice type: NetatmoStation type.
	self assert: (device isKindOf: NetatmoStation).
	
	device := NetatmoDevice type: nil.
	self assert: (device isNil).
	
	device := NetatmoDevice type: #notExistingType.
	self assert: (device isNil).
]
