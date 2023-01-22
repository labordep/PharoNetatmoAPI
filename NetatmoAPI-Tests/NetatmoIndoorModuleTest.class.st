"
A NetatmoIndoorModuleTest is a test class for testing the behavior of NetatmoIndoorModule
"
Class {
	#name : #NetatmoIndoorModuleTest,
	#superclass : #TestCase,
	#category : #'NetatmoAPI-Tests-Model'
}

{ #category : #tests }
NetatmoIndoorModuleTest >> testConstructor [ 
	| moduleList |
	
	moduleList := OrderedCollection new.
	moduleList add: NetatmoIndoorModule new.
	moduleList add: (NetatmoStationModule type: NetatmoIndoorModule type).
	
	moduleList do:[ :module |
		self assert: module type equals: NetatmoIndoorModule type.
		self assert: module product equals: NetatmoIndoorModule product.
		self assert: module isAnemometerModule not.
		self assert: module isIndoorModule.
		self assert: module isOutdoorModule not.
		self assert: module isRainGaugeModule not.
		self assert: module batteryStatusDescription equals: 'Unknown'.
		self assert: module wifiStatusSignalQuality equals: 'N/A'.
	].
]
