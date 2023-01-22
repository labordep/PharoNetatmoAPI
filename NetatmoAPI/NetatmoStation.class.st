"
Weather
Product : Smart Home Weather Station
Product type : NAMain
"
Class {
	#name : #NetatmoStation,
	#superclass : #NetatmoDevice,
	#traits : 'TNetatmoDashboard',
	#classTraits : 'TNetatmoDashboard classTrait',
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

{ #category : #dashboard }
NetatmoStation >> dashboardAbsolutePressure [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType absolutePressure ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoStation >> dashboardCO2 [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType co2 ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoStation >> dashboardHumidity [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType humidity ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoStation >> dashboardMaxTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType maxTemperature ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoStation >> dashboardMinTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType minTemperature ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoStation >> dashboardNoise [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType noise ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoStation >> dashboardPressure [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType pressure ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoStation >> dashboardPressureTrend [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType pressureTrend ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoStation >> dashboardTemperature [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType temperature ] ifNone:[ nil ]

	
]

{ #category : #dashboard }
NetatmoStation >> dashboardTemperatureTrend [

	^ self dashboardMeasures detect:[ :e | e type = NetatmoMeasureType temperatureTrend ] ifNone:[ nil ]

	
]

{ #category : #modules }
NetatmoStation >> haveAnemometerModules [

	^ self anemometerModules notEmpty
]

{ #category : #modules }
NetatmoStation >> haveIndoorModules [

	^ self indoorModules notEmpty
]

{ #category : #modules }
NetatmoStation >> haveModules [

	^ self modules notEmpty
]

{ #category : #modules }
NetatmoStation >> haveOutdoorModules [

	^ self outdoorModules notEmpty
]

{ #category : #modules }
NetatmoStation >> haveRainGaugeModules [

	^ self rainGaugeModules notEmpty
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
