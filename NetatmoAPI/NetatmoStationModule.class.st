Class {
	#name : #NetatmoStationModule,
	#superclass : #NetatmoDevice,
	#instVars : [
		'batteryPercent',
		'lastMessageDateTime',
		'lastSeenDateTime',
		'radioStatus',
		'batteryStatus'
	],
	#category : #'NetatmoAPI-Model'
}

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

	| status |
	status := self batteryStatus.
	status >= 6000 ifTrue: [ ^ 'Max' ].
	status >= 5500 ifTrue: [ ^ 'Full' ].
	status >= 5000 ifTrue: [ ^ 'High' ].
	status >= 4500 ifTrue: [ ^ 'Medium' ].
	status >= 4000 ifTrue: [ ^ 'Low' ].
	status < 4000 ifTrue: [ ^ 'Very low' ].

	^ 'Unknown'
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
