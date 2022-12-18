Class {
	#name : #NetatmoExplicitError,
	#superclass : #NetatmoError,
	#category : #'NetatmoAPI-Exceptions'
}

{ #category : #accessing }
NetatmoExplicitError class >> code [

	^ 0
]

{ #category : #initialization }
NetatmoExplicitError >> initialize [ 

	super initialize.
	self messageText: 'Explicit error'.
]
