"
A NetatmoHealthyHomeCoachTest is a test class for testing the behavior of NetatmoHealthyHomeCoach
"
Class {
	#name : #NetatmoHealthyHomeCoachTest,
	#superclass : #TestCase,
	#category : #'NetatmoAPI-Tests-Model'
}

{ #category : #tests }
NetatmoHealthyHomeCoachTest >> testConstructor [ 
	| deviceList |
	
	deviceList := OrderedCollection new.
	deviceList add: NetatmoHealthyHomeCoach new.
	deviceList add: (NetatmoDevice type: NetatmoHealthyHomeCoach type).
	
	deviceList do:[ :device |
		self assert: device type equals: NetatmoHealthyHomeCoach type.
		self assert: device product equals: NetatmoHealthyHomeCoach product.
		self assert: device isHealthyHomeCoach.
	].
]
