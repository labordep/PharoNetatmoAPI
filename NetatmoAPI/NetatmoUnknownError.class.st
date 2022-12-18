Class {
	#name : #NetatmoUnknownError,
	#superclass : #NetatmoError,
	#category : #'NetatmoAPI-Exceptions'
}

{ #category : #accessing }
NetatmoUnknownError class >> code [

	^ nil
]

{ #category : #initialization }
NetatmoUnknownError >> initialize [ 

	super initialize.
	self messageText: 'Unknown error'.
]
