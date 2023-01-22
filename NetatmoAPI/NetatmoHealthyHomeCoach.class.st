"
Aircare / Home Coach
Product : Smart indoor air quality monitor
Product type : NHC
"
Class {
	#name : #NetatmoHealthyHomeCoach,
	#superclass : #NetatmoDevice,
	#traits : 'TNetatmoDashboard',
	#classTraits : 'TNetatmoDashboard classTrait',
	#category : #'NetatmoAPI-Model'
}

{ #category : #printing }
NetatmoHealthyHomeCoach class >> healthIndexMeaning: aValue [

	aValue ifNil:[ ^ 'Unknown' ].
	
	aValue = 0 ifTrue:[ ^ 'Healthy' ].
	aValue = 1 ifTrue:[ ^ 'Fine' ].
	aValue = 2 ifTrue:[ ^ 'Fair' ].
	aValue = 3 ifTrue:[ ^ 'Poor' ].
	aValue = 4 ifTrue:[ ^ 'Unhealthy' ].
	
	^ 'Unknown'
]

{ #category : #accessing }
NetatmoHealthyHomeCoach class >> product [

	^ 'Smart indoor air quality monitor'
]

{ #category : #accessing }
NetatmoHealthyHomeCoach class >> type [

	^'NHC'
]

{ #category : #dashboard }
NetatmoHealthyHomeCoach >> dashboardAbsolutePressure [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType absolutePressure ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoHealthyHomeCoach >> dashboardCO2 [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType co2 ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoHealthyHomeCoach >> dashboardHealth [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType health ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoHealthyHomeCoach >> dashboardHumidity [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType humidity ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoHealthyHomeCoach >> dashboardMaxTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType maxTemperature ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoHealthyHomeCoach >> dashboardMinTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType minTemperature ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoHealthyHomeCoach >> dashboardNoise [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType noise ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoHealthyHomeCoach >> dashboardPressure [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType pressure ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoHealthyHomeCoach >> dashboardTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType temperature ] ifNone:[ nil ]

	
]

{ #category : #testing }
NetatmoHealthyHomeCoach >> isHealthyHomeCoach [

	^ true
]
