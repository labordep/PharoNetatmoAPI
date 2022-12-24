Class {
	#name : #NetatmoAPIAuthentificator,
	#superclass : #Object,
	#instVars : [
		'clientId',
		'clientSecret',
		'scopes',
		'redirectUrl',
		'oAuth2Session',
		'oAuth2ConsumerData',
		'code'
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

	oAuth2ConsumerData := ZnOAuth2ConsumerData key: self clientId secret: self clientSecret redirectUrl: self redirectUrl.
	oAuth2Session := ZnNetatmoOAuth2Session netatmo: oAuth2ConsumerData.
	oAuth2Session scopes: self scopes.
	
	"oAuth2Session authenticationUrlWithState: 'toGenerateStateString'."
	
	^ oAuth2Session 
]

{ #category : #initialization }
NetatmoAPIAuthentificator >> initialize [

	super initialize.

	"Specify Pharo Netatmo API default redirection URL"
	self flag:'PLA : create automaticaly the netatmoCallback file '.
	"file:///"
	self redirectUrl: 'file:///', ((SystemResolver userLocalDirectory / 'netatmoCallback.html') fullName).
	self redirectUrl: 'http://127.0.0.1:8888/pharoEndpoint'.
]

{ #category : #accessing }
NetatmoAPIAuthentificator >> redirectUrl [

	^ redirectUrl
]

{ #category : #accessing }
NetatmoAPIAuthentificator >> redirectUrl: anObject [

	redirectUrl := anObject
]

{ #category : #private }
NetatmoAPIAuthentificator >> requestAuthentication [
	"This method open a browser to waiting confirmation from the user"
	
	| znUrl znClient server |
	znUrl := oAuth2Session authenticationUrlWithState: 'generatedState'.
	znUrl queryRemoveKey: 'response_type'.
		
	znClient := ZnClient new.
	znClient 
		url: znUrl; 
		applicationFormUrlEncodedEntity;
		followRedirects: false;
		post.
		
	WebBrowser openOn: znClient response location.
	
	self inform: 'Start'.
	
	server := ZnWebSocket startServerOn: 8888 prefix: 'pharoEndpoint' do: [ :webSocket |
      [ webSocket runWith: [ :message | self inform: 'Received message: ', message printString ] ] 
			on: ConnectionClosed, PrimitiveFailed do: [ "ignore close" ].
      self inform: 'The server is closed'. 
	].
	
	"true whileTrue: [ "
		"waiting for user confirm / decline"
			
	"]."

	"SystemResolver userLocalDirectory"

	self inform: 'End'.

	server stop.
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
