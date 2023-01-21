"
Weather
Product : Smart Home Weather Station
Product type : NAMain
"
Class {
	#name : #NetatmoStation,
	#superclass : #NetatmoDevice,
	#instVars : [
		'modules'
	],
	#category : #'NetatmoAPI-Model'
}

{ #category : #accessing }
NetatmoStation class >> product [

	^ 'Smart Home Weather Station'
]

{ #category : #accessing }
NetatmoStation class >> type [

	^'NAMain'
]

{ #category : #modules }
NetatmoStation >> anemometerModules [

	^ self modules select:[ :m | m isAnemometerModule ]
]

{ #category : #modules }
NetatmoStation >> haveModules [

	^ self modules notEmpty
]

{ #category : #modules }
NetatmoStation >> indoorModules [

	^ self modules select:[ :m | m isIndoorModule ]
]

{ #category : #testing }
NetatmoStation >> isStation [

	^ true
]

{ #category : #accessing }
NetatmoStation >> modules [

	modules ifNil:[ modules := OrderedCollection new ].
	^ modules
]

{ #category : #accessing }
NetatmoStation >> modules: anObject [

	modules := anObject
]

{ #category : #modules }
NetatmoStation >> numberOfModules [

	^ self modules size
]

{ #category : #modules }
NetatmoStation >> outdoorModules [

	^ self modules select:[ :m | m isOutdoorModule ]
]

{ #category : #modules }
NetatmoStation >> rainGaugeModules [

	^ self modules select:[ :m | m isRainGaugeModule ]
]
