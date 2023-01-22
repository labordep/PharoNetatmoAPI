Class {
	#name : #NetatmoMeasureType,
	#superclass : #Object,
	#category : #'NetatmoAPI-Model'
}

{ #category : #pressure }
NetatmoMeasureType class >> absolutePressure [
	"sea-level pressure"

	^ 'absolute pressure'
]

{ #category : #'-- shortcuts - all' }
NetatmoMeasureType class >> allCo2MeasuresTypes [
	"self allCo2MeasuresTypes"

	| list |
	list := OrderedCollection new.
	list add: self co2.
	list add: self minCo2.
	list add: self maxCo2.
	^list
]

{ #category : #'-- shortcuts - all' }
NetatmoMeasureType class >> allHumidityMeasuresTypes [
	"self allHumidityMeasuresTypes"

	| list |
	list := OrderedCollection new.
	list add: self humidity.
	list add: self minHumidity.
	list add: self maxHumidity.
	^list
]

{ #category : #'-- shortcuts - all' }
NetatmoMeasureType class >> allNoiseMeasuresTypes [
	"self allNoiseMeasuresTypes"

	| list |
	list := OrderedCollection new.
	list add: self noise.
	list add: self minNoise.
	list add: self maxNoise.
	^list
]

{ #category : #'-- shortcuts - all' }
NetatmoMeasureType class >> allPressureMeasuresTypes [
	"self allPressureMeasuresTypes"

	| list |
	list := OrderedCollection new.
	list add: self pressure.
	list add: self absolutePressure.
	list add: self minPressure.
	list add: self maxPressure.
	^list
]

{ #category : #'-- shortcuts - all' }
NetatmoMeasureType class >> allRainMeasuresTypes [
	"self allRainMeasuresTypes"

	| list |
	list := OrderedCollection new.
	list add: self rain.
	list add: self minRain.
	list add: self maxRain.
	list add: self sumRain.
	^list
]

{ #category : #'-- shortcuts - all' }
NetatmoMeasureType class >> allTemperatureMeasuresTypes [
	"self allTemperatureMeasuresTypes"

	| list |
	list := OrderedCollection new.
	list add: self temperature.
	list add: self minTemperature.
	list add: self maxTemperature.
	^list
]

{ #category : #'-- shortcuts - all' }
NetatmoMeasureType class >> allTrendMeasuresTypes [
	"self allTrendMeasuresTypes"

	| list |
	list := OrderedCollection new.
	list add: self temperatureTrend.
	list add: self pressureTrend.
	^list
]

{ #category : #'-- shortcuts - all' }
NetatmoMeasureType class >> allWindAngleMeasuresTypes [
	"self allWindAngleMeasuresTypes"

	| list |
	list := OrderedCollection new.
	list add: self windAngle.
	list add: self gustAngle.
	^list
]

{ #category : #'-- shortcuts - all' }
NetatmoMeasureType class >> allWindStrengthMeasuresTypes [
	"self allWindStrengthMeasuresTypes"

	| list |
	list := OrderedCollection new.
	list add: self windStrength.
	list add: self gustStrength.
	^list
]

{ #category : #C02 }
NetatmoMeasureType class >> co2 [

	^'co2'
]

{ #category : #'-- tools' }
NetatmoMeasureType class >> defaultDataType: aMeasureType [

	aMeasureType ifNil: [ ^ nil ].

	(self allTrendMeasuresTypes includes: aMeasureType) ifTrue: [ ^ String ].
	aMeasureType = self health ifTrue:[ ^ Integer ].

	^ Number
]

{ #category : #'-- tools' }
NetatmoMeasureType class >> defaultUnit: aMeasureType [

	aMeasureType ifNil: [ ^ nil ].

	(self allTemperatureMeasuresTypes includes: aMeasureType) ifTrue: [ ^ '°C' ].
	(self allHumidityMeasuresTypes includes: aMeasureType) ifTrue: [ ^ '%' ].
	(self allCo2MeasuresTypes includes: aMeasureType) ifTrue: [ ^ 'ppm' ]. 
	(self allPressureMeasuresTypes includes: aMeasureType) ifTrue: [ ^ 'mbar' ].
	(self allNoiseMeasuresTypes includes: aMeasureType) ifTrue: [ ^ 'dB' ].
	(self allRainMeasuresTypes includes: aMeasureType) ifTrue: [ ^ 'mm' ].
	(self allWindStrengthMeasuresTypes includes: aMeasureType) ifTrue: [ ^ 'kph' ].
	(self allWindAngleMeasuresTypes includes: aMeasureType) ifTrue: [ ^ '°' ].
	(self allTrendMeasuresTypes includes: aMeasureType) ifTrue: [ ^ nil ].
	aMeasureType = self health ifTrue:[ ^ nil ].
	
	^ nil
]

{ #category : #'-- tools' }
NetatmoMeasureType class >> fromString: aString [
	"Return the corresponding measure type from a string"
	
	| cleanedString |
	(aString isNil or:[aString isEmpty]) ifTrue:[ ^ nil ].
	cleanedString := aString asValidSelector asLowercase.
	cleanedString isEmpty ifTrue:[ ^ nil ].
	
	self co2 asValidSelector asLowercase = cleanedString ifTrue:[ ^ self co2 ].
	self humidity asValidSelector asLowercase = cleanedString ifTrue:[ ^ self humidity ].
	self absolutePressure asValidSelector asLowercase = cleanedString ifTrue:[ ^ self absolutePressure ].
	self temperature asValidSelector asLowercase = cleanedString ifTrue:[ ^ self temperature ].
	self pressure asValidSelector asLowercase = cleanedString ifTrue:[ ^ self pressure ].
	self noise asValidSelector asLowercase = cleanedString ifTrue:[ ^ self noise ].
	self maxTemperature asValidSelector asLowercase = cleanedString ifTrue:[ ^ self maxTemperature ].
	self minTemperature asValidSelector asLowercase = cleanedString ifTrue:[ ^ self minTemperature ].
	self health asValidSelector asLowercase = cleanedString ifTrue:[ ^ self health ].
	self temperatureTrend asValidSelector asLowercase = cleanedString ifTrue:[ ^ self temperatureTrend ].
	self pressureTrend asValidSelector asLowercase = cleanedString ifTrue:[ ^ self pressureTrend ].
	
	^ nil
]

{ #category : #wind }
NetatmoMeasureType class >> gustAngle [ 

	^'gustangle'
]

{ #category : #wind }
NetatmoMeasureType class >> gustStrength [ 

	^'guststrength'
]

{ #category : #health }
NetatmoMeasureType class >> health [
	"health index"

	^ 'health_idx'
]

{ #category : #'-- shortcuts - measures' }
NetatmoMeasureType class >> healthyHomeCoachMeasuresTypes [
	"self healthyHomeCoachMeasuresTypes"

	| list |
	list := OrderedCollection new.
	list add: self temperature.
	list add: self humidity.
	list add: self pressure.
	list add: self co2.
	list add: self noise.
	^list
]

{ #category : #humidity }
NetatmoMeasureType class >> humidity [

	^'humidity'
]

{ #category : #C02 }
NetatmoMeasureType class >> maxCo2 [

	^'max_co2'
]

{ #category : #humidity }
NetatmoMeasureType class >> maxHumidity [

	^'max_hum'
]

{ #category : #noise }
NetatmoMeasureType class >> maxNoise [

	^'max_noise' 
]

{ #category : #pressure }
NetatmoMeasureType class >> maxPressure [

	^ 'max_pressure'
]

{ #category : #rain }
NetatmoMeasureType class >> maxRain [ 

	^'max_rain'
]

{ #category : #temperature }
NetatmoMeasureType class >> maxTemperature [

	^'max_temp'
]

{ #category : #C02 }
NetatmoMeasureType class >> minCo2 [

	^'min_co2'
]

{ #category : #humidity }
NetatmoMeasureType class >> minHumidity [

	^'min_hum'
]

{ #category : #noise }
NetatmoMeasureType class >> minNoise [

	^'min_noise' 
]

{ #category : #pressure }
NetatmoMeasureType class >> minPressure [

	^ 'min_pressure'
]

{ #category : #rain }
NetatmoMeasureType class >> minRain [ 

	^'min_rain'
]

{ #category : #temperature }
NetatmoMeasureType class >> minTemperature [

	^'min_temp'
]

{ #category : #noise }
NetatmoMeasureType class >> noise [

	^'noise' 
]

{ #category : #pressure }
NetatmoMeasureType class >> pressure [
	"surface pressure"

	^ 'pressure'
]

{ #category : #pressure }
NetatmoMeasureType class >> pressureTrend [
	"trend for the last 12h (up, down, stable)"

	^ 'pressure_trend'
]

{ #category : #rain }
NetatmoMeasureType class >> rain [ 

	^'rain'
]

{ #category : #'-- shortcuts - measures' }
NetatmoMeasureType class >> stationMeasuresTypes [
	"self stationMeasuresTypes"

	| list |
	list := OrderedCollection new.
	list add: self temperature.
	list add: self co2.
	list add: self humidity.
	list add: self pressure.
	list add: self noise.
	^list
]

{ #category : #rain }
NetatmoMeasureType class >> sumRain [ 

	^'sum_rain'
]

{ #category : #temperature }
NetatmoMeasureType class >> temperature [

	^'temperature'
]

{ #category : #temperature }
NetatmoMeasureType class >> temperatureTrend [
	"trend for the last 12h (up, down, stable)"

	^ 'temp_trend'
]

{ #category : #wind }
NetatmoMeasureType class >> windAngle [ 

	^'windangle'
]

{ #category : #wind }
NetatmoMeasureType class >> windStrength [ 

	^'windstrength'
]
