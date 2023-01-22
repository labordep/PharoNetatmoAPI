"
A NetatmoRainGaugeModuleTest is a test class for testing the behavior of NetatmoRainGaugeModule
"
Class {
	#name : #NetatmoRainGaugeModuleTest,
	#superclass : #TestCase,
	#category : #'NetatmoAPI-Tests-Model'
}

{ #category : #tests }
NetatmoRainGaugeModuleTest >> testConstructor [ 
	| moduleList |
	
	moduleList := OrderedCollection new.
	moduleList add: NetatmoRainGaugeModule new.
	moduleList add: (NetatmoStationModule type: NetatmoRainGaugeModule type).
	
	moduleList do:[ :module |
		self assert: module type equals: NetatmoRainGaugeModule type.
		self assert: module product equals: NetatmoRainGaugeModule product.
		self assert: module isAnemometerModule not.
		self assert: module isIndoorModule not.
		self assert: module isOutdoorModule not.
		self assert: module isRainGaugeModule.
		self assert: module batteryStatusDescription equals: 'Unknown'.
		self assert: module wifiStatusSignalQuality equals: 'N/A'.
	].
]
