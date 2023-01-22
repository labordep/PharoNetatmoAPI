"
A NetatmoOutdoorModuleTest is a test class for testing the behavior of NetatmoOutdoorModule
"
Class {
	#name : #NetatmoOutdoorModuleTest,
	#superclass : #TestCase,
	#category : #'NetatmoAPI-Tests-Model'
}

{ #category : #tests }
NetatmoOutdoorModuleTest >> testConstructor [ 
	| moduleList |
	
	moduleList := OrderedCollection new.
	moduleList add: NetatmoOutdoorModule new.
	moduleList add: (NetatmoStationModule type: NetatmoOutdoorModule type).
	
	moduleList do:[ :module |
		self assert: module type equals: NetatmoOutdoorModule type.
		self assert: module product equals: NetatmoOutdoorModule product.
		self assert: module isAnemometerModule not.
		self assert: module isIndoorModule not.
		self assert: module isOutdoorModule.
		self assert: module isRainGaugeModule not.
		self assert: module batteryStatusDescription equals: 'Unknown'.
		self assert: module wifiStatusSignalQuality equals: 'N/A'.
	].
]
