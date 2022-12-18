Class {
	#name : #NetatmoInvalidAccessTokenError,
	#superclass : #NetatmoError,
	#category : #'NetatmoAPI-Exceptions'
}

{ #category : #accessing }
NetatmoInvalidAccessTokenError class >> code [

	^ 2
]

{ #category : #initialization }
NetatmoInvalidAccessTokenError >> initialize [ 

	super initialize.
	self messageText: 'Invalid access token'.
]
