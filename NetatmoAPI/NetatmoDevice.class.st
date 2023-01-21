Class {
	#name : #NetatmoDevice,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'setupDateTime',
		'lastSetupDateTime',
		'type',
		'lastStatusStoreDateTime',
		'firmware',
		'lastUpgradeDateTime',
		'wifiStatus',
		'isReachable',
		'product'
	],
	#category : #'NetatmoAPI-Model'
}

{ #category : #accessing }
NetatmoDevice class >> product [

	self subclassResponsibility  
]

{ #category : #accessing }
NetatmoDevice class >> type [

	self subclassResponsibility  
]

{ #category : #constructor }
NetatmoDevice class >> type: aType [

	aType ifNil:[ ^nil ].
	self allSubclassesDo: [ :class | class type = aType ifTrue: [ ^ class new ] ].
	^ nil
]

{ #category : #accessing }
NetatmoDevice >> firmware [
	"version of the software"

	^ firmware
]

{ #category : #accessing }
NetatmoDevice >> firmware: anObject [

	firmware := anObject
]

{ #category : #accessing }
NetatmoDevice >> id [
	"mac address of the device"
	
	^ id
]

{ #category : #accessing }
NetatmoDevice >> id: anObject [

	id := anObject
]

{ #category : #initialization }
NetatmoDevice >> initialize [ 
	
	super initialize.
	type := self class type.
	product := self class product.
	isReachable := false. 
]

{ #category : #testing }
NetatmoDevice >> isHealthyHomeCoach [

	^ false
]

{ #category : #accessing }
NetatmoDevice >> isReachable [
	"true if the station connected to Netatmo cloud within the last 4 hours"

	^ isReachable
]

{ #category : #accessing }
NetatmoDevice >> isReachable: anObject [

	isReachable := anObject
]

{ #category : #testing }
NetatmoDevice >> isStation [

	^ false
]

{ #category : #accessing }
NetatmoDevice >> lastSetupDateTime [

	^ lastSetupDateTime
]

{ #category : #accessing }
NetatmoDevice >> lastSetupDateTime: anObject [

	lastSetupDateTime := anObject
]

{ #category : #accessing }
NetatmoDevice >> lastStatusStoreDateTime [

	^ lastStatusStoreDateTime
]

{ #category : #accessing }
NetatmoDevice >> lastStatusStoreDateTime: anObject [

	lastStatusStoreDateTime := anObject
]

{ #category : #accessing }
NetatmoDevice >> lastUpgradeDateTime [

	^ lastUpgradeDateTime
]

{ #category : #accessing }
NetatmoDevice >> lastUpgradeDateTime: anObject [

	lastUpgradeDateTime := anObject
]

{ #category : #accessing }
NetatmoDevice >> name [
	"name of the module"
	
	^ name
]

{ #category : #accessing }
NetatmoDevice >> name: anObject [

	name := anObject
]

{ #category : #accessing }
NetatmoDevice >> product [

	^ product
]

{ #category : #accessing }
NetatmoDevice >> setupDateTime [

	^ setupDateTime
]

{ #category : #accessing }
NetatmoDevice >> setupDateTime: anObject [

	setupDateTime := anObject
]

{ #category : #accessing }
NetatmoDevice >> type [

	^ type
]

{ #category : #accessing }
NetatmoDevice >> wifiStatus [
	"wifi status per Base station. (86=bad, 56=good)"

	^ wifiStatus
]

{ #category : #accessing }
NetatmoDevice >> wifiStatus: anObject [

	wifiStatus := anObject
]

{ #category : #printing }
NetatmoDevice >> wifiStatusSignalQuality [

	| status |
	status := self wifiStatus.
	status <= 56 ifTrue: [ ^ 'Good' ].
	(status > 56 and:[ status < 86]) ifTrue: [ ^ 'Average' ].
	status >= 86 ifTrue: [ ^ 'Bad' ].

	^ 'Unknown'
]
