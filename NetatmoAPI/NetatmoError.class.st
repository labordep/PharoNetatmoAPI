Class {
	#name : #NetatmoError,
	#superclass : #Error,
	#instVars : [
		'code'
	],
	#category : #'NetatmoAPI-Exceptions'
}

{ #category : #accessing }
NetatmoError class >> code [

	self subclassResponsibility 
]

{ #category : #constructor }
NetatmoError class >> code: aCode [
	"self code: 1"

	self allSubclassesDo: [ :class | class code = aCode ifTrue: [ ^ class new ] ].
	^ self new
]

{ #category : #constructor }
NetatmoError class >> signalFromCode: aCode [
	"self signalFromCode: 1"

	^(self code: aCode) signal
]

{ #category : #accessing }
NetatmoError >> code [

	^ code
]

{ #category : #initialization }
NetatmoError >> initialize [ 
	
	super initialize.
	code := self class code.
]
