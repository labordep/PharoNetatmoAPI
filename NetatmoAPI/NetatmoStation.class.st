"
Weather
Product : Smart Home Weather Station
Product type : NAMain
"
Class {
	#name : #NetatmoStation,
	#superclass : #NetatmoDevice,
	#category : #'NetatmoAPI-Model'
}

{ #category : #accessing }
NetatmoStation class >> type [

	^'NAMain'
]

{ #category : #testing }
NetatmoStation >> isStation [

	^ true
]
