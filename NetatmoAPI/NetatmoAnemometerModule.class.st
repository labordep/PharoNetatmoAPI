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

{ #category : #dashboard }
NetatmoAnemometerModule >> dashboardGustAngle [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType gustAngle ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoAnemometerModule >> dashboardGustStrength [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType gustStrength ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoAnemometerModule >> dashboardMaxWindAngle [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType maxWindAngle ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoAnemometerModule >> dashboardMaxWindStrength [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType maxWindStrength ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoAnemometerModule >> dashboardWindAngle [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType windAngle ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoAnemometerModule >> dashboardWindStrength [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType windStrength ] ifNone:[ nil ]

	
]

{ #category : #testing }
NetatmoAnemometerModule >> isAnemometerModule [

	^ true
]
