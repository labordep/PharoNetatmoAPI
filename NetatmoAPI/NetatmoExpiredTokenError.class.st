Class {
	#name : #NetatmoExpiredTokenError,
	#superclass : #NetatmoError,
	#category : #'NetatmoAPI-Exceptions'
}

{ #category : #accessing }
NetatmoExpiredTokenError class >> code [

	^ 3
]

{ #category : #initialization }
NetatmoExpiredTokenError >> initialize [ 

	super initialize.
	self messageText: 'Access token expired'.
]
