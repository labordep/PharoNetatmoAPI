Class {
	#name : #NetatmoDataTypeEnum,
	#superclass : #Object,
	#category : #'NetatmoAPI-Model'
}

{ #category : #shortcuts }
NetatmoDataTypeEnum class >> allCo2DataTypes [
	"self allCo2DataTypes"

	| list |
	list := OrderedCollection new.
	list add: self co2.
	list add: self minCo2.
	list add: self maxCo2.
	^list
]

{ #category : #shortcuts }
NetatmoDataTypeEnum class >> allHumidityDataTypes [
	"self allHumidityDataTypes"

	| list |
	list := OrderedCollection new.
	list add: self humidity.
	list add: self minHumidity.
	list add: self maxHumidity.
	^list
]

{ #category : #shortcuts }
NetatmoDataTypeEnum class >> allNoiseDataTypes [
	"self allNoiseDataTypes"

	| list |
	list := OrderedCollection new.
	list add: self noise.
	list add: self minNoise.
	list add: self maxNoise.
	^list
]

{ #category : #shortcuts }
NetatmoDataTypeEnum class >> allPressureDataTypes [
	"self allPressureDataTypes"

	| list |
	list := OrderedCollection new.
	list add: self pressure.
	list add: self minPressure.
	list add: self maxPressure.
	^list
]

{ #category : #shortcuts }
NetatmoDataTypeEnum class >> allRainDataTypes [
	"self allRainDataTypes"

	| list |
	list := OrderedCollection new.
	list add: self rain.
	list add: self minRain.
	list add: self maxRain.
	list add: self sumRain.
	^list
]

{ #category : #shortcuts }
NetatmoDataTypeEnum class >> allTemperatureDataTypes [
	"self allTemperatureDataTypes"

	| list |
	list := OrderedCollection new.
	list add: self temperature.
	list add: self minTemperature.
	list add: self maxTemperature.
	^list
]

{ #category : #shortcuts }
NetatmoDataTypeEnum class >> allWindAngleDataTypes [
	"self allWindAngleDataTypes"

	| list |
	list := OrderedCollection new.
	list add: self windAngle.
	list add: self gustAngle.
	^list
]

{ #category : #shortcuts }
NetatmoDataTypeEnum class >> allWindStrengthDataTypes [
	"self allWindStrengthDataTypes"

	| list |
	list := OrderedCollection new.
	list add: self windStrength.
	list add: self gustStrength.
	^list
]

{ #category : #C02 }
NetatmoDataTypeEnum class >> co2 [

	^'co2'
]

{ #category : #wind }
NetatmoDataTypeEnum class >> gustAngle [ 

	^'gustangle'
]

{ #category : #wind }
NetatmoDataTypeEnum class >> gustStrength [ 

	^'guststrength'
]

{ #category : #humidity }
NetatmoDataTypeEnum class >> humidity [

	^'humidity'
]

{ #category : #C02 }
NetatmoDataTypeEnum class >> maxCo2 [

	^'max_co2'
]

{ #category : #humidity }
NetatmoDataTypeEnum class >> maxHumidity [

	^'max_hum'
]

{ #category : #noise }
NetatmoDataTypeEnum class >> maxNoise [

	^'max_noise' 
]

{ #category : #pressure }
NetatmoDataTypeEnum class >> maxPressure [

	^'max_pressure'
]

{ #category : #rain }
NetatmoDataTypeEnum class >> maxRain [ 

	^'max_rain'
]

{ #category : #temperature }
NetatmoDataTypeEnum class >> maxTemperature [

	^'max_temp'
]

{ #category : #C02 }
NetatmoDataTypeEnum class >> minCo2 [

	^'min_co2'
]

{ #category : #humidity }
NetatmoDataTypeEnum class >> minHumidity [

	^'min_hum'
]

{ #category : #noise }
NetatmoDataTypeEnum class >> minNoise [

	^'min_noise' 
]

{ #category : #pressure }
NetatmoDataTypeEnum class >> minPressure [

	^'min_pressure'
]

{ #category : #rain }
NetatmoDataTypeEnum class >> minRain [ 

	^'min_rain'
]

{ #category : #temperature }
NetatmoDataTypeEnum class >> minTemperature [

	^'min_temp'
]

{ #category : #noise }
NetatmoDataTypeEnum class >> noise [

	^'noise' 
]

{ #category : #pressure }
NetatmoDataTypeEnum class >> pressure [

	^'pressure'
]

{ #category : #rain }
NetatmoDataTypeEnum class >> rain [ 

	^'rain'
]

{ #category : #rain }
NetatmoDataTypeEnum class >> sumRain [ 

	^'sum_rain'
]

{ #category : #temperature }
NetatmoDataTypeEnum class >> temperature [

	^'temperature'
]

{ #category : #wind }
NetatmoDataTypeEnum class >> windAngle [ 

	^'windangle'
]

{ #category : #wind }
NetatmoDataTypeEnum class >> windStrength [ 

	^'windstrength'
]
