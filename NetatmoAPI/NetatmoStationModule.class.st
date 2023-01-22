Class {
	#name : #NetatmoStationModule,
	#superclass : #NetatmoDevice,
	#traits : 'TNetatmoDashboard',
	#classTraits : 'TNetatmoDashboard classTrait',
	#instVars : [
		'batteryPercent',
		'lastMessageDateTime',
		'lastSeenDateTime',
		'radioStatus',
		'batteryStatus'
	],
	#category : #'NetatmoAPI-Model'
}

{ #category : #printing }
NetatmoStationModule class >> batteryStatusDescription: aValue [

	aValue ifNil:[ ^ 'Unknown' ].

	aValue >= 6000 ifTrue: [ ^ 'Max' ].
	aValue >= 5500 ifTrue: [ ^ 'Full' ].
	aValue >= 5000 ifTrue: [ ^ 'High' ].
	aValue >= 4500 ifTrue: [ ^ 'Medium' ].
	aValue >= 4000 ifTrue: [ ^ 'Low' ].
	aValue < 4000 ifTrue: [ ^ 'Very low' ].

	^ 'Unknown'
]

{ #category : #accessing }
NetatmoStationModule class >> product [

	^ nil
]

{ #category : #accessing }
NetatmoStationModule class >> type [

	^ nil
]

{ #category : #accessing }
NetatmoStationModule >> batteryPercent [

	^ batteryPercent
]

{ #category : #accessing }
NetatmoStationModule >> batteryPercent: anObject [

	batteryPercent := anObject
]

{ #category : #accessing }
NetatmoStationModule >> batteryStatus [

	^ batteryStatus
]

{ #category : #accessing }
NetatmoStationModule >> batteryStatus: anObject [

	batteryStatus := anObject
]

{ #category : #printing }
NetatmoStationModule >> batteryStatusDescription [

	^ self class batteryStatusDescription: self batteryStatus
]

{ #category : #testing }
NetatmoStationModule >> isAnemometerModule [

	^ false
]

{ #category : #testing }
NetatmoStationModule >> isIndoorModule [

	^ false
]

{ #category : #testing }
NetatmoStationModule >> isOutdoorModule [

	^ false
]

{ #category : #testing }
NetatmoStationModule >> isRainGaugeModule [

	^ false
]

{ #category : #accessing }
NetatmoStationModule >> lastMessageDateTime [

	^ lastMessageDateTime
]

{ #category : #accessing }
NetatmoStationModule >> lastMessageDateTime: anObject [

	lastMessageDateTime := anObject
]

{ #category : #accessing }
NetatmoStationModule >> lastSeenDateTime [

	^ lastSeenDateTime
]

{ #category : #accessing }
NetatmoStationModule >> lastSeenDateTime: anObject [

	lastSeenDateTime := anObject
]

{ #category : #accessing }
NetatmoStationModule >> radioStatus [

	^ radioStatus
]

{ #category : #accessing }
NetatmoStationModule >> radioStatus: anObject [

	radioStatus := anObject
]

{ #category : #printing }
NetatmoStationModule >> wifiStatusSignalQuality [

	^ 'N/A'
]
