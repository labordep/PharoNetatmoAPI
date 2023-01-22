Class {
	#name : #NetatmoMeasure,
	#superclass : #Object,
	#instVars : [
		'dateTime',
		'type',
		'data',
		'unit',
		'dataType'
	],
	#category : #'NetatmoAPI-Model'
}

{ #category : #accessing }
NetatmoMeasure >> data [

	^ data
]

{ #category : #accessing }
NetatmoMeasure >> data: anObject [

	data := anObject
]

{ #category : #accessing }
NetatmoMeasure >> dataType [

	^ dataType
]

{ #category : #accessing }
NetatmoMeasure >> dataType: anObject [

	dataType := anObject
]

{ #category : #accessing }
NetatmoMeasure >> dateTime [

	^ dateTime
]

{ #category : #accessing }
NetatmoMeasure >> dateTime: anObject [

	dateTime := anObject
]

{ #category : #accessing }
NetatmoMeasure >> type [

	^ type
]

{ #category : #accessing }
NetatmoMeasure >> type: anObject [

	type := anObject
]

{ #category : #accessing }
NetatmoMeasure >> unit [

	^ unit
]

{ #category : #accessing }
NetatmoMeasure >> unit: anObject [

	unit := anObject
]
