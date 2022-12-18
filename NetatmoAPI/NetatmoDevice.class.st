Class {
	#name : #NetatmoDevice,
	#superclass : #Object,
	#instVars : [
		'id',
		'setupDateTime',
		'lastSetupDateTime',
		'type',
		'lastStatusStoreDateTime',
		'firmware',
		'lastUpgradeDateTime',
		'wifiStatus',
		'isReachable'
	],
	#category : #'NetatmoAPI-Model'
}

{ #category : #accessing }
NetatmoDevice class >> type [

	self subclassResponsibility  
]

{ #category : #accessing }
NetatmoDevice >> firmware [

	^ firmware
]

{ #category : #accessing }
NetatmoDevice >> firmware: anObject [

	firmware := anObject
]

{ #category : #accessing }
NetatmoDevice >> id [

	^ id
]

{ #category : #accessing }
NetatmoDevice >> id: anObject [

	id := anObject
]

{ #category : #initialization }
NetatmoDevice >> initialize [ 
	
	super initialize.
	self type: self class type.
]

{ #category : #accessing }
NetatmoDevice >> isReachable [

	^ isReachable
]

{ #category : #accessing }
NetatmoDevice >> isReachable: anObject [

	isReachable := anObject
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

	^ wifiStatus
]

{ #category : #accessing }
NetatmoDevice >> wifiStatus: anObject [

	wifiStatus := anObject
]
