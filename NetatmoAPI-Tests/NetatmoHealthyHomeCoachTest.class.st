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

	| device |
	device := NetatmoHealthyHomeCoach new.
	self assert: device type equals: NetatmoHealthyHomeCoach type.
	self assert: device isHealthyHomeCoach.
	
	device := NetatmoDevice type: NetatmoHealthyHomeCoach type.
	self assert: device type equals: NetatmoHealthyHomeCoach type.
	self assert: device isHealthyHomeCoach.
]
