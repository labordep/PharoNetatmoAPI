Class {
	#name : #NetatmoAPIAuthentificator,
	#superclass : #Object,
	#instVars : [
		'clientId',
		'clientSecret',
		'scopes',
		'redirectUrl',
		'oAuth2Session',
		'oAuth2ConsumerData'
	],
	#category : #'NetatmoAPI-Core'
}

{ #category : #accessing }
NetatmoAPIAuthentificator class >> clientId: aNetatmoClientIdString clientSecret: aNetatmoClienSecretString [
	"Danger: if you dont specify exact scopes your authentication request should be rejected"

	^self clientId: aNetatmoClientIdString clientSecret: aNetatmoClienSecretString scopes: NetatmoScopeEnum allReadScopes.
]

{ #category : #accessing }
NetatmoAPIAuthentificator class >> clientId: aNetatmoClientIdString clientSecret: aNetatmoClienSecretString scopes: aScopeList [
	| authenticator |

	authenticator := self new.
	authenticator 
		clientId: aNetatmoClientIdString;
		clientSecret: aNetatmoClienSecretString;
		scopes: aScopeList.
	
	^authenticator
]

{ #category : #accessing }
NetatmoAPIAuthentificator >> clientId [

	^ clientId
]

{ #category : #accessing }
NetatmoAPIAuthentificator >> clientId: anObject [

	clientId := anObject
]

{ #category : #accessing }
NetatmoAPIAuthentificator >> clientSecret [

	^ clientSecret
]

{ #category : #accessing }
NetatmoAPIAuthentificator >> clientSecret: anObject [

	clientSecret := anObject
]

{ #category : #private }
NetatmoAPIAuthentificator >> createOAuth2Session [

	(self clientId isNil or:[self clientSecret isNil or:[self redirectUrl isNil or:[self scopes isEmpty]]]) ifTrue:[ ^ nil ].

	oAuth2ConsumerData := ZnOAuth2ConsumerData key: self clientId secret: self clientSecret redirectUrl: nil.
	oAuth2Session := ZnNetatmoOAuth2Session netatmo: oAuth2ConsumerData.
	
	^ oAuth2Session 
]

{ #category : #initialization }
NetatmoAPIAuthentificator >> initialize [

	super initialize.

	"Specify Pharo Netatmo API default redirection URL"
	self redirectUrl: 'http://localhost:8080/netatmo_callback'
]

{ #category : #accessing }
NetatmoAPIAuthentificator >> redirectUrl [

	^ redirectUrl
]

{ #category : #accessing }
NetatmoAPIAuthentificator >> redirectUrl: anObject [

	redirectUrl := anObject
]

{ #category : #accessing }
NetatmoAPIAuthentificator >> scopes [

	scopes ifNil:[scopes := Array new].
	^ scopes
]

{ #category : #accessing }
NetatmoAPIAuthentificator >> scopes: anObject [

	scopes := anObject
]
