Class {
	#name : #NetatmoMissingAccessTokenError,
	#superclass : #NetatmoError,
	#category : #'NetatmoAPI-Exceptions'
}

{ #category : #accessing }
NetatmoMissingAccessTokenError class >> code [

	^ 1
]

{ #category : #initialization }
NetatmoMissingAccessTokenError >> initialize [ 

	super initialize.
	self messageText: 'Access token is missing'.
]
