Class {
	#name : #NetatmoAnemometerModule,
	#superclass : #NetatmoStationModule,
	#category : #'NetatmoAPI-Model'
}

{ #category : #accessing }
NetatmoAnemometerModule class >> product [

	^ 'Smart Anemometer Module'
]

{ #category : #accessing }
NetatmoAnemometerModule class >> type [

	^ 'NAModule2' 
]

{ #category : #printing }
NetatmoAnemometerModule >> batteryStatusDescription [

	| status |
	status := self batteryStatus.
	status >= 6000 ifTrue: [ ^ 'Max' ].
	status >= 5590 ifTrue: [ ^ 'Full' ].
	status >= 5180 ifTrue: [ ^ 'High' ].
	status >= 4770 ifTrue: [ ^ 'Medium' ].
	status >= 4360 ifTrue: [ ^ 'Low' ].
	status < 4360 ifTrue: [ ^ 'Very low' ].

	^ 'Unknown'
]

{ #category : #testing }
NetatmoAnemometerModule >> isAnemometerModule [

	^ true
]
