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

{ #category : #testing }
NetatmoIndoorModule >> isIndoorModule [

	^ true
]
