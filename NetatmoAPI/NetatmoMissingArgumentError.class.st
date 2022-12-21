Class {
	#name : #NetatmoMissingArgumentError,
	#superclass : #NetatmoError,
	#category : #'NetatmoAPI-Exceptions'
}

{ #category : #accessing }
NetatmoMissingArgumentError class >> code [

	^ 10
]

{ #category : #initialization }
NetatmoMissingArgumentError >> initialize [ 

	super initialize.
	self messageText: 'Argument(s) is(are) missing'.
]
