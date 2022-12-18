Class {
	#name : #NetatmoInvalidDeviceIdError,
	#superclass : #NetatmoError,
	#category : #'NetatmoAPI-Exceptions'
}

{ #category : #accessing }
NetatmoInvalidDeviceIdError class >> code [

	^ 21
]

{ #category : #initialization }
NetatmoInvalidDeviceIdError >> initialize [ 

	super initialize.
	self messageText: 'Device id is invalid'.
]
