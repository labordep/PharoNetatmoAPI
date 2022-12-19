"
A NetatmoDeviceTest is a test class for testing the behavior of NetatmoDevice
"
Class {
	#name : #NetatmoDeviceTest,
	#superclass : #TestCase,
	#category : #'NetatmoAPI-Tests-Model'
}

{ #category : #common }
NetatmoDeviceTest >> checkDeviceInitialization: aNetatmoDevice [ 

	self assert: aNetatmoDevice type equals: aNetatmoDevice class type.
	self assert: aNetatmoDevice id isNil.
	self assert: aNetatmoDevice firmware isNil.
	self assert: aNetatmoDevice isReachable not.
	self assert: aNetatmoDevice lastSetupDateTime isNil.
	self assert: aNetatmoDevice lastStatusStoreDateTime isNil.
	self assert: aNetatmoDevice lastUpgradeDateTime isNil.
	self assert: aNetatmoDevice setupDateTime isNil.
	self assert: aNetatmoDevice wifiStatus isNil.
]

{ #category : #tests }
NetatmoDeviceTest >> testConstructor [

	| device |
	device := NetatmoDevice type: nil.
	self assert: (device isNil).
	
	device := NetatmoDevice type: #notExistingType.
	self assert: (device isNil).
]

{ #category : #tests }
NetatmoDeviceTest >> testInitialize [

	| list |
	list := OrderedCollection new.
	list add: NetatmoHealthyHomeCoach new. 
	list add: NetatmoStation new.
	list do:[ :d | self checkDeviceInitialization: d].
]
