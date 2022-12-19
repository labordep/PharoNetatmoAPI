Class {
	#name : #NetatmoDeviceNotFoundError,
	#superclass : #NetatmoError,
	#category : #'NetatmoAPI-Exceptions'
}

{ #category : #accessing }
NetatmoDeviceNotFoundError class >> code [

	^ 9
]

{ #category : #initialization }
NetatmoDeviceNotFoundError >> initialize [ 

	super initialize.
	self messageText: 'Device not found'.
]
