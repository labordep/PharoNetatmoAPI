Class {
	#name : #NetatmoOutdoorModule,
	#superclass : #NetatmoStationModule,
	#category : #'NetatmoAPI-Model'
}

{ #category : #accessing }
NetatmoOutdoorModule class >> product [

	^ 'Smart Outdoor Module'
]

{ #category : #accessing }
NetatmoOutdoorModule class >> type [

	^ 'NAModule1' 
]

{ #category : #dashboard }
NetatmoOutdoorModule >> dashboardHumidity [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType humidity ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoOutdoorModule >> dashboardMaxTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType maxTemperature ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoOutdoorModule >> dashboardMinTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType minTemperature ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoOutdoorModule >> dashboardTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType temperature ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoOutdoorModule >> dashboardTemperatureTrend [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType temperatureTrend ] ifNone:[ nil ]

	
]

{ #category : #testing }
NetatmoOutdoorModule >> isOutdoorModule [ 

	^ true
]
