Class {
	#name : #NetatmoAPIExamples,
	#superclass : #Object,
	#classInstVars : [
		'session'
	],
	#category : #'NetatmoAPI-Examples-Core'
}

{ #category : #private }
NetatmoAPIExamples class >> cleanUp [
	<script>
	
	self cleanUp: nil
]

{ #category : #private }
NetatmoAPIExamples class >> cleanUp: anObject [

	session := nil.
]

{ #category : #private }
NetatmoAPIExamples class >> currentSession [

	^ session
]

{ #category : #private }
NetatmoAPIExamples class >> getCurrentConnectedNetatmoAPI [
	<script>
	
	| token api |
	token := self getCurrentSessionToken ifNil:[ ^ nil ].
	api := NetatmoAPI new.
	api token: token.
	
	^ api
]

{ #category : #private }
NetatmoAPIExamples class >> getCurrentSessionToken [
	<script>
	
	| token |
	(self currentSession isNil or:[self currentSession isLive not]) ifTrue:[ 
		SpInformDialog new title: 'Error'; label: 'No token. Execute the connexion example to initialize a user session.'; openDialog.
		^ nil
	].
	
	token := self currentSession liveAccessToken.
	^ token
]

{ #category : #'Examples - connexion' }
NetatmoAPIExamples class >> getSessionAndAuthenticateIfNecessary [ 
	<script>

	"Ask for user client id and client secret to authenticate a session"
	| clientId clientSecret authenticator |
	(session notNil and:[session isLive]) ifTrue:[
		^ session
	].
	
	clientId := SpRequestDialog new 
		title: 'Netatmo client Id';
		acceptLabel: 'Ok';
		cancelLabel: 'Cancel';
		openModal.
	clientId ifNil:[ ^ self ].
	
	clientSecret := SpRequestDialog new 
		title: 'Netatmo client Secret';
		acceptLabel: 'Ok';
		cancelLabel: 'Cancel';
		openModal.
	clientSecret ifNil:[ ^ self ].
	
	authenticator := NetatmoAPIAuthentificator 
		clientId: clientId asString
		clientSecret: clientSecret asString
		scopes: (NetatmoScopeEnum allReadScopes).
		
	session := authenticator createOAuth2Session.
	session isLive ifFalse:[
		authenticator requestUserAuthentication. "open the web browser"
	].

	^ session
]

{ #category : #'Examples - API uses' }
NetatmoAPIExamples class >> getStationDevicesExample [
	"Display station devices in a table"
	<script>
	
	| api devices table |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	
	table := SpTablePresenter new
		addColumn: (SpStringTableColumn title: 'Id' evaluated: #id);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		addColumn: (SpStringTableColumn title: 'Firmware version' evaluated: #firmware);
		addColumn: (SpStringTableColumn title: 'Reachable' evaluated: #isReachable).
	table items: devices.
	
	table open.
]

{ #category : #'see class side' }
NetatmoAPIExamples >> seeClassSide [

	
]
