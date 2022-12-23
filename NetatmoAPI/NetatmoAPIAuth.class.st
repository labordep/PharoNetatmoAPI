"
This is an incubation classe to implement and manage the OAuth2 authentification for Desktop Application
"
Class {
	#name : #NetatmoAPIAuth,
	#superclass : #Object,
	#instVars : [
		'oauth2Url'
	],
	#category : #'NetatmoAPI-Incubator'
}

{ #category : #'api - authorization' }
NetatmoAPIAuth >> getOrRefreshToken [
	"Return the current token or refresh it an return it"

	| state znClient scopes result |
	self flag:'PLA write code to get token here here'.	
	state := 'myState'.
	"Si pas de token il faut demander un token avec les identifiants de lutilisateur"
	
	scopes := String new.
	NetatmoScopeEnum allReadScopes do: [ :e | scopes := scopes, e asString ] separatedBy: [ scopes := scopes, ' ' ].
		
	znClient := ZnClient new.
	result := znClient
		url: self oauth2Url asString, '/authorize'; 
		applicationFormUrlEncodedEntity;
		followRedirects: false;
		queryAt: 'client_id' put: self clientId asString;
		queryAt: 'redirect_uri' put: 'http://localhost:8080/netatmo_callback';
		queryAt: 'scope' put: 'read_station';
		queryAt: 'state' put: state asString;
		"queryAt: 'response_type' put: 'code';"
		post.
		
	"znClient isSuccess ifFalse:[ ^ NetatmoError signal ]."
	WebBrowser openOn: znClient response location.
	
	self flag:'PLA : comment on récupère sans serveur ??? http://localhost:1234 ? TODO : Récupérer avec une websocket depuis appel dun fichier html generé'.
	"(self checkIfError: result) ifNotNil:[ :error | ^ error signal ]."
	
]

{ #category : #accessing }
NetatmoAPIAuth >> oauth2Url [

	^ oauth2Url
]

{ #category : #accessing }
NetatmoAPIAuth >> oauth2Url: anObject [

	oauth2Url := anObject
]
