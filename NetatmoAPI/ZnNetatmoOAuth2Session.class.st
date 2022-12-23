Class {
	#name : #ZnNetatmoOAuth2Session,
	#superclass : #ZnOAuth2Session,
	#category : #'NetatmoAPI-Zinc'
}

{ #category : #public }
ZnNetatmoOAuth2Session >> authenticationUrl [

	^ (ZnUrl fromString: 'https://api.netatmo.com/oauth2/authorize')
		queryAt: 'client_id' put: self consumerData key ;
		queryAt: 'response_type' put: 'code' ;
		queryAt: 'redirect_uri' put: self redirectUrl ;
		queryAt: 'scope' put: self scopeParameter ;
		"Specify state some arbitrary (but unique) string. This is to confirm source of authentication (prevent request hack)"
		queryAt: 'state' put: 'PharoNetatmoAPIState' asString;
		yourself.
]
