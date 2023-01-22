Class {
	#name : #NetatmoAnemometerModule,
	#superclass : #NetatmoStationModule,
	#category : #'NetatmoAPI-Model'
}

{ #category : #printing }
NetatmoAnemometerModule class >> batteryStatusDescription: aValue [

	aValue ifNil:[ ^ 'Unknown' ].

	aValue >= 6000 ifTrue: [ ^ 'Max' ].
	aValue >= 5590 ifTrue: [ ^ 'Full' ].
	aValue >= 5180 ifTrue: [ ^ 'High' ].
	aValue >= 4770 ifTrue: [ ^ 'Medium' ].
	aValue >= 4360 ifTrue: [ ^ 'Low' ].
	aValue < 4360 ifTrue: [ ^ 'Very low' ].

	^ 'Unknown'
]

{ #category : #accessing }
NetatmoAnemometerModule class >> product [

	^ 'Smart Anemometer Module'
]

{ #category : #accessing }
NetatmoAnemometerModule class >> type [

	^ 'NAModule2' 
]

{ #category : #testing }
NetatmoAnemometerModule >> isAnemometerModule [

	^ true
]
