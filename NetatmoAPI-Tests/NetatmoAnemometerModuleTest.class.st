"
A NetatmoAnemometerModuleTest is a test class for testing the behavior of NetatmoAnemometerModule
"
Class {
	#name : #NetatmoAnemometerModuleTest,
	#superclass : #TestCase,
	#category : #'NetatmoAPI-Tests-Model'
}

{ #category : #tests }
NetatmoAnemometerModuleTest >> testConstructor [ 
	| moduleList |
	
	moduleList := OrderedCollection new.
	moduleList add: NetatmoAnemometerModule new.
	moduleList add: (NetatmoStationModule type: NetatmoAnemometerModule type).
	
	moduleList do:[ :module |
		self assert: module type equals: NetatmoAnemometerModule type.
		self assert: module product equals: NetatmoAnemometerModule product.
		self assert: module isAnemometerModule.
		self assert: module isIndoorModule not.
		self assert: module isOutdoorModule not.
		self assert: module isRainGaugeModule not.
		self assert: module batteryStatusDescription equals: 'Unknown'.
		self assert: module wifiStatusSignalQuality equals: 'N/A'.
	].
]
