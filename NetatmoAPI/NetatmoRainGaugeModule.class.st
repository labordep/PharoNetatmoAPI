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

{ #category : #testing }
NetatmoRainGaugeModule >> isRainGaugeModule [

	^ true
]
