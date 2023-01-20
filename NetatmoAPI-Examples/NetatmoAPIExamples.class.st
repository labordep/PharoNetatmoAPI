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

{ #category : #'Examples - API uses' }
NetatmoAPIExamples class >> getFirstStationDeviceEachThisWeekDaysHumidityMeasuresExample [
	"Display first station device humidity measures in a table"
	"This example works only if your have a station device ;-)"
	<script>
	
	| api devices table measures |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	
	measures := api getMeasures: (devices first id) 
		types: (OrderedCollection with: NetatmoDataTypeEnum humidity) 
		scale: 1 day 
		dateTimeBegin: (DateAndTime now - 7 day) 
		dateTimeEnd: DateAndTime now.
	
	table := SpTablePresenter new
		addColumn: (SpStringTableColumn title: 'Data' evaluated: #data);
		addColumn: (SpStringTableColumn title: 'Date & Time' evaluated: #dateTime);
		addColumn: (SpStringTableColumn title: 'Type' evaluated: #type);
		addColumn: (SpStringTableColumn title: 'Unit' evaluated: #unit).
	(measures notNil and:[measures notEmpty]) ifTrue:[table items: measures].
	
	table open.
]

{ #category : #'Examples - API uses' }
NetatmoAPIExamples class >> getFirstStationDeviceLastDayC02MeasuresExample [
	"Display first station device humidity measures in a table"
	"This example works only if your have a station device ;-)"
	<script>
	
	| api devices table measures |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	
	measures := api getMeasures: (devices first id) 
		types: (OrderedCollection with: NetatmoDataTypeEnum co2) 
		dateTimeBegin: (DateAndTime now - 1 day) 
		dateTimeEnd: DateAndTime now.
	
	table := SpTablePresenter new
		addColumn: (SpStringTableColumn title: 'Data' evaluated: #data);
		addColumn: (SpStringTableColumn title: 'Date & Time' evaluated: #dateTime);
		addColumn: (SpStringTableColumn title: 'Type' evaluated: #type);
		addColumn: (SpStringTableColumn title: 'Unit' evaluated: #unit).
	(measures notNil and:[measures notEmpty]) ifTrue:[table items: measures].
	
	table open.
]

{ #category : #'Examples - API uses' }
NetatmoAPIExamples class >> getFirstStationDeviceTemperatureMeasuresExample [
	"Display first station device humidity measures in a table"
	"This example works only if your have a station device ;-)"
	<script>
	
	| api devices table measures |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	
	measures := api 
		getMeasures: (devices first id) 
		types: (OrderedCollection with: NetatmoDataTypeEnum temperature). 
	
	table := SpTablePresenter new
		addColumn: (SpStringTableColumn title: 'Data' evaluated: #data);
		addColumn: (SpStringTableColumn title: 'Date & Time' evaluated: #dateTime);
		addColumn: (SpStringTableColumn title: 'Type' evaluated: #type);
		addColumn: (SpStringTableColumn title: 'Unit' evaluated: #unit).
	(measures notNil and:[measures notEmpty]) ifTrue:[table items: measures].
	
	table open.
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

{ #category : #'Examples - API uses with Roassal' }
NetatmoAPIExamples class >> getStationDeviceWeekHumidityGraphExample [
	"This example display some humidity data in a Roassal graph for the week"
	"This example works only if your have a station device ;-)"
	<script>
	
	| api devices measures chart |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	
	measures := SortedCollection sortBlock: [ :a :b | a dateTime < b dateTime ].
	
	"Because the number of result is limited, need to do multiple requests"
	1 to: 7 do:[ :i |
		measures addAll: (api getMeasures: (devices first id) 
			types: (OrderedCollection with: NetatmoDataTypeEnum humidity) 
			dateTimeBegin: (DateAndTime now - (i day)) 
			dateTimeEnd: (DateAndTime now - ((i - 1) day))).
	].	
	
	chart := RSChart new.
	chart addPlot: (RSLinePlot new y: (measures collect:[ :e | e data ])).
	chart addDecoration: (RSVerticalTick new).
	chart addDecoration: (RSHorizontalTick new).
	chart open.
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
	(devices notNil and:[devices notEmpty]) ifTrue:[table items: devices].
	
	table open.
]

{ #category : #'see class side' }
NetatmoAPIExamples >> seeClassSide [

	
]
