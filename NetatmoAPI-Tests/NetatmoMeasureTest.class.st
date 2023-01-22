"
A NetatmoMeasureTest is a test class for testing the behavior of NetatmoMeasure
"
Class {
	#name : #NetatmoMeasureTest,
	#superclass : #TestCase,
	#category : #'NetatmoAPI-Tests-Model'
}

{ #category : #tests }
NetatmoMeasureTest >> testInitialize [

	| measure |
	measure := NetatmoMeasure new.
	
	self assert: measure type isNil.
	self assert: measure data isNil.
	self assert: measure dataType isNil.
	self assert: measure unit isNil.
	self assert: measure dateTime isNil.
]
