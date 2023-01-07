Class {
	#name : #NetatmoAPIAuthentificator,
	#superclass : #Object,
	#instVars : [
		'clientId',
		'clientSecret',
		'scopes',
		'redirectUrl',
		'callbackServerPort',
		'oAuth2Session',
		'oAuth2ConsumerData',
		'code',
		'znServer'
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
NetatmoAPIAuthentificator >> callbackServerPort [

	callbackServerPort ifNil: [ callbackServerPort := 8080 ].
	^ callbackServerPort
]

{ #category : #accessing }
NetatmoAPIAuthentificator >> callbackServerPort: anObject [

	callbackServerPort := anObject
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

{ #category : #api }
NetatmoAPIAuthentificator >> createOAuth2Session [

	self redirectUrl: 'http://localhost:', self callbackServerPort asString ,'/'.

	(self clientId isNil or:[self clientSecret isNil or:[self redirectUrl isNil or:[self scopes isEmpty]]]) ifTrue:[ ^ nil ].

	oAuth2ConsumerData := ZnOAuth2ConsumerData key: self clientId secret: self clientSecret redirectUrl: self redirectUrl.
	oAuth2Session := ZnNetatmoOAuth2Session netatmo: oAuth2ConsumerData.
	oAuth2Session scopes: self scopes.
		
	^ oAuth2Session 
]

{ #category : #private }
NetatmoAPIAuthentificator >> generateRandomState [

	^ (Generator on: [ :g | 
		   1 timesRepeat: [ g yield: UUID new asString36 ] ]) upToEnd first
]

{ #category : #initialization }
NetatmoAPIAuthentificator >> initialize [

	super initialize.
	
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
NetatmoAPIAuthentificator >> requestCallback: aRequest state: aState [
	"Callback when OAuth2 user request is received from Netatmo auth form website"
	| error stream response state |

	"Prepare head of the result message"
	stream := WriteStream on: String new.
	stream nextPutAll: 'Pharo Netatmo API authentication'.	
	stream cr; nextPutAll: '---'; cr.

	"First : Recover the state to validate the source of the request"
	state := aRequest uri queryAt: 'state' ifAbsent:[ nil ].
	(state isNil or:[state ~= aState]) ifNil:[ error := 'invalid_state' ].
		
	"Second : Recover if an error is occurred"
	error ifNil:[error := aRequest uri queryAt: 'error' ifAbsent:[ nil ]].
	
	"Third : Without error, recover the code and raised an error in case of missing code"
	code := aRequest uri queryAt: 'code' ifAbsent:[ nil ].
	((code isNil or:[code isEmpty]) and:[error isNil]) ifTrue:[ error := 'invalid_code' ].

	"Dispatch processing depending an error or not"
	error ifNotNil:[ 

		"In case of error"
		stream nextPutAll: '/!\ Error detected : '.
		stream nextPutAll: error asString.
		stream nextPutAll: ', please retry the authentication.'.
		stream cr; nextPutAll: 'More informations about errors : https://dev.netatmo.com/apidocumentation/oauth#errors'.
		response := ZnResponse serverError: stream contents.	
			
	] ifNil:[
	
		oAuth2Session isLive ifFalse:[
			"Request token"		
			oAuth2Session handleAuthenticationCallback: ((Dictionary new) at: 'code' put: code asString; yourself).

			"Display result in case of success"
			oAuth2Session isLive ifTrue:[
			
				stream nextPutAll: 'Your authentication is successful !'.
				stream cr; nextPutAll: 'Close this window and go back to your application.'.
				stream cr; nextPutAll: 'Debug -- Token : '; nextPutAll: oAuth2Session liveAccessToken asString.
				stream cr; nextPutAll: 'Debug -- Expire On : '; nextPutAll: oAuth2Session expiresOn asString.
				response := ZnResponse ok: (ZnEntity text: stream contents).
			] ifFalse:[
			
				response := ZnResponse serverError: '/!\ Error detected on requested/refreshing token, please retry the authentication.'.				
			].

		].	 
			
	].

	^response 
]

{ #category : #api }
NetatmoAPIAuthentificator >> requestUserAuthentication [
	"This method open a browser to waiting confirmation from the user"
	
	| znUrl znClient state |	
	state := self generateRandomState.
	ZnServer stopDefault.
	znServer := ZnServer startDefaultOn: self callbackServerPort.
	znServer onRequestRespond: [ :request | self requestCallback: request state: state ].
	
	znUrl := oAuth2Session authenticationUrlWithState: state.
	znUrl queryRemoveKey: 'response_type'.
	
	znClient := ZnClient new.
	znClient 
		url: znUrl; 
		applicationFormUrlEncodedEntity;
		followRedirects: false;
		post.
		
	WebBrowser openOn: znClient response location.
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
