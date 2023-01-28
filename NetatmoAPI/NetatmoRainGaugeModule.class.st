Class {
	#name : #NetatmoRainGaugeModule,
	#superclass : #NetatmoStationModule,
	#category : #'NetatmoAPI-Model'
}

{ #category : #accessing }
NetatmoRainGaugeModule class >> product [

	^ 'Smart Rain Gauge Module'
]

{ #category : #accessing }
NetatmoRainGaugeModule class >> type [

	^ 'NAModule3' 
]

{ #category : #dashboard }
NetatmoRainGaugeModule >> dashboardRain [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType rain ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoRainGaugeModule >> dashboardSumRain1hour [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType sumRain1hour ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoRainGaugeModule >> dashboardSumRain24hours [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType sumRain24hours ] ifNone:[ nil ]

	
]

{ #category : #testing }
NetatmoRainGaugeModule >> isRainGaugeModule [

	^ true
]
