Class {
	#name : #ZnNetatmoOAuth2Session,
	#superclass : #ZnOAuth2Session,
	#category : #'NetatmoAPI-Zinc'
}

{ #category : #public }
ZnNetatmoOAuth2Session >> initialize [
	super initialize.
	self authorizationEndpoint: 'https://api.netatmo.com/oauth2/authorize'.
	self tokenEndpoint: 'https://api.netatmo.com/oauth2/token'.
]
