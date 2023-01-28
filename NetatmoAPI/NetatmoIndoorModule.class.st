Class {
	#name : #NetatmoIndoorModule,
	#superclass : #NetatmoStationModule,
	#category : #'NetatmoAPI-Model'
}

{ #category : #accessing }
NetatmoIndoorModule class >> product [

	^ 'Smart Indoor Module'
]

{ #category : #accessing }
NetatmoIndoorModule class >> type [

	^ 'NAModule4' 
]

{ #category : #dashboard }
NetatmoIndoorModule >> dashboardAbsolutePressure [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType absolutePressure ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoIndoorModule >> dashboardCO2 [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType co2 ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoIndoorModule >> dashboardHumidity [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType humidity ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoIndoorModule >> dashboardMaxTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType maxTemperature ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoIndoorModule >> dashboardMinTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType minTemperature ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoIndoorModule >> dashboardPressure [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType pressure ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoIndoorModule >> dashboardTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType temperature ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoIndoorModule >> dashboardTemperatureTrend [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType temperatureTrend ] ifNone:[ nil ]

	
]

{ #category : #testing }
NetatmoIndoorModule >> isIndoorModule [

	^ true
]
