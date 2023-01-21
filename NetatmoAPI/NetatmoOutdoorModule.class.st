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

{ #category : #testing }
NetatmoOutdoorModule >> isOutdoorModule [ 

	^ true
]
