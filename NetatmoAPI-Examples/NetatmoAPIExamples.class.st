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

{ #category : #'Examples - API uses with Spec' }
NetatmoAPIExamples class >> devicesListExample [
	"Display all available devices (and their children) in a table"
	<script>
	
	| api devices treeTable window |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getDevices.
	
	treeTable := SpTreeTablePresenter new
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		addColumn: (SpStringTableColumn title: 'Product' evaluated: #product);
		addColumn: (SpStringTableColumn title: 'Type' evaluated: #type);
		addColumn: (SpStringTableColumn title: 'Reachable' evaluated: #isReachable);
		addColumn: (SpStringTableColumn title: 'Wifi status' evaluated: #wifiStatus);
		addColumn: (SpStringTableColumn title: 'Wifi quality' evaluated: #wifiStatusSignalQuality);
		addColumn: (SpStringTableColumn title: 'Last Status' evaluated: #lastStatusStoreDateTime);
		addColumn: (SpStringTableColumn title: 'Setup' evaluated: #setupDateTime);
		addColumn: (SpStringTableColumn title: 'Last Setup' evaluated: #lastSetupDateTime);
		addColumn: (SpStringTableColumn title: 'Last Upgrade' evaluated: #lastUpgradeDateTime);
		addColumn: (SpStringTableColumn title: 'Firmware version' evaluated: #firmware);
		addColumn: (SpStringTableColumn title: 'Id' evaluated: #id).
		
	"Manage children"
	treeTable children: [ :device | 
		device isStation ifTrue:[ device modules ] ifFalse:[ OrderedCollection new ] 
	].
		
	(devices notNil and:[devices notEmpty]) ifTrue:[treeTable roots: devices].
	
	window := treeTable open.
	window title: 'NetatmoAPI available devices'.
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

{ #category : #'Examples - API uses with Spec' }
NetatmoAPIExamples class >> healtyHomeCoachDashboardExample [
	"Display a dashboard of a device"
	"This example works only if your have a healty home coach device ;-)"
	<script>
	
	| api devices table measures window homeCoach |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getHealthyHomeCoachDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	homeCoach := devices first.
	measures := homeCoach dashboardMeasures.
	
	table := SpTablePresenter new
		addColumn: (SpStringTableColumn new
			evaluated: [ :measure | 
				"Build data presentation string"
				measure type = NetatmoMeasureType health ifTrue:[
					'Health : ', (NetatmoHealthyHomeCoach healthIndexMeaning: measure data).
				] ifFalse:[
					measure type = NetatmoMeasureType minTemperature ifTrue:[
						measure type asString, ': ', measure data asString, ' ', measure unit asString, ' (' , measure dateTime asString , ')'.
					] ifFalse:[
						measure type = NetatmoMeasureType maxTemperature ifTrue:[
							measure type asString, ': ', measure data asString, ' ', measure unit asString, ' (' , measure dateTime asString , ')'.
						] ifFalse:[
							measure type asString, ': ', measure data asString, ' ', measure unit asString.
						].
					].
				].
			];
			displayBold: [ :e | true ]).
	(measures notNil and:[measures notEmpty]) ifTrue:[table items: measures].
	
	window := table open.
	window title: ('"', homeCoach name asString, '" Dashboard - ', homeCoach dashboardDateTime asString).
]

{ #category : #'Examples - API uses with Spec' }
NetatmoAPIExamples class >> healtyHomeCoachLast7DaysMeasuresExample [
	"Display device measures in a table"
	"This example works only if your have a healty home coach device ;-)"
	<script>
	
	| api devices table measures window homeCoach |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	homeCoach := devices first.
	
	measures := api getMeasures: (homeCoach id) 
		types: (NetatmoMeasureType healthyHomeCoachMeasuresTypes) 
		scale: 1 day 
		dateTimeBegin: (DateAndTime now - 7 day) 
		dateTimeEnd: DateAndTime now.
	
	table := SpTablePresenter new
		addColumn: (SpStringTableColumn title: 'Type' evaluated: #type);
		addColumn: (SpStringTableColumn title: 'Measure' evaluated: [ :e | e data asString, ' ', e unit asString ]);
		addColumn: (SpStringTableColumn title: 'Day' evaluated: [ :e | e dateTime dayOfWeekName ]).
	(measures notNil and:[measures notEmpty]) ifTrue:[table items: measures].
	
	window := table open.
	window title: 'Last 7 days Healthy Home Coach measures'.
]

{ #category : #'Examples - API uses with Spec' }
NetatmoAPIExamples class >> stationDashboardExample [
	"Display a dashboard of a device"
	"This example works only if your have a station device ;-)"
	<script>
	
	| api devices table measures window station |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	station := devices first.
	measures := station dashboardMeasures.
	
	table := SpTablePresenter new
		addColumn: (SpStringTableColumn new
			evaluated: [ :measure | 
				"Build data presentation string"
				measure type = NetatmoMeasureType minTemperature ifTrue:[
					measure type asString, ': ', measure data asString, ' ', measure unit asString, ' (' , measure dateTime asString , ')'.
				] ifFalse:[
					measure type = NetatmoMeasureType maxTemperature ifTrue:[
						measure type asString, ': ', measure data asString, ' ', measure unit asString, ' (' , measure dateTime asString , ')'.
					] ifFalse:[
						measure type asString, ': ', measure data asString, ' ', (measure unit ifNil:['']) asString.
					].
				].
			];
			displayBold: [ :e | true ]).
	(measures notNil and:[measures notEmpty]) ifTrue:[table items: measures].
	
	window := table open.
	window title: ('"', station name asString, '" Dashboard - ', station dashboardDateTime asString).
]

{ #category : #'Examples - API uses with Spec' }
NetatmoAPIExamples class >> stationIndoorModuleDashboardExample [
	"Display a dashboard of a station indoor module"
	"This example works only if your have a station device with an indoor module ;-)"
	<script>
	
	| api devices table measures window station module |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	station := devices first.
	module := station indoorModules ifEmpty: [ ^ self ] ifNotEmpty: [ :e | e first ].	
	measures := module dashboardMeasures.
	
	table := SpTablePresenter new
		addColumn: (SpStringTableColumn new
			evaluated: [ :measure | 
				"Build data presentation string"
				measure type = NetatmoMeasureType minTemperature ifTrue:[
					measure type asString, ': ', measure data asString, ' ', measure unit asString, ' (' , measure dateTime asString , ')'.
				] ifFalse:[
					measure type = NetatmoMeasureType maxTemperature ifTrue:[
						measure type asString, ': ', measure data asString, ' ', measure unit asString, ' (' , measure dateTime asString , ')'.
					] ifFalse:[
						measure type asString, ': ', measure data asString, ' ', (measure unit ifNil:['']) asString.
					].
				].
			];
			displayBold: [ :e | true ]).
	(measures notNil and:[measures notEmpty]) ifTrue:[table items: measures].
	
	window := table open.
	window title: ('Module "', module name asString, '" Dashboard - ', station dashboardDateTime asString).
]

{ #category : #'Examples - API uses with Spec' }
NetatmoAPIExamples class >> stationLast7DaysMeasuresExample [
	"Display device measures in a table"
	"This example works only if your have a station device ;-)"
	<script>
	
	| api devices table measures window station |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	station := devices first.
	
	measures := api getMeasures: (station id) 
		types: (NetatmoMeasureType stationMeasuresTypes) 
		scale: 1 day 
		dateTimeBegin: (DateAndTime now - 7 day) 
		dateTimeEnd: DateAndTime now.
	
	table := SpTablePresenter new
		addColumn: (SpStringTableColumn title: 'Type' evaluated: #type);
		addColumn: (SpStringTableColumn title: 'Measure' evaluated: [ :e | e data asString, ' ', e unit asString ]);
		addColumn: (SpStringTableColumn title: 'Day' evaluated: [ :e | e dateTime dayOfWeekName ]).
	(measures notNil and:[measures notEmpty]) ifTrue:[table items: measures].
	
	window := table open.
	window title: 'Last 7 days indoor station measures'.
]

{ #category : #'Examples - API uses with Spec' }
NetatmoAPIExamples class >> stationOutdoorModuleDashboardExample [
	"Display a dashboard of a station outdoor module"
	"This example works only if your have a station device with an outdoor module ;-)"
	<script>
	
	| api devices table measures window station module |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	station := devices first.
	module := station outdoorModules ifEmpty: [ ^ self ] ifNotEmpty: [ :e | e first ].	
	measures := module dashboardMeasures.
	
	table := SpTablePresenter new
		addColumn: (SpStringTableColumn new
			evaluated: [ :measure | 
				"Build data presentation string"
				measure type = NetatmoMeasureType minTemperature ifTrue:[
					measure type asString, ': ', measure data asString, ' ', measure unit asString, ' (' , measure dateTime asString , ')'.
				] ifFalse:[
					measure type = NetatmoMeasureType maxTemperature ifTrue:[
						measure type asString, ': ', measure data asString, ' ', measure unit asString, ' (' , measure dateTime asString , ')'.
					] ifFalse:[
						measure type asString, ': ', measure data asString, ' ', (measure unit ifNil:['']) asString.
					].
				].
			];
			displayBold: [ :e | true ]).
	(measures notNil and:[measures notEmpty]) ifTrue:[table items: measures].
	
	window := table open.
	window title: ('Module "', module name asString, '" Dashboard - ', station dashboardDateTime asString).
]

{ #category : #'Examples - API uses with Roassal' }
NetatmoAPIExamples class >> stationWeekHumidityGraphExample [
	"This example display some humidity data in a Roassal graph for the week"
	"This example works only if your have a weather station device ;-)"
	<script>
	
	| api devices measures chart |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	
	measures := SortedCollection sortBlock: [ :a :b | a dateTime < b dateTime ].
	
	"Because the number of result is limited, need to do multiple requests"
	1 to: 7 do:[ :i |
		measures addAll: (api getMeasures: (devices first id) 
			types: (OrderedCollection with: NetatmoMeasureType humidity) 
			dateTimeBegin: (DateAndTime now - (i day)) 
			dateTimeEnd: (DateAndTime now - ((i - 1) day))).
	].	
	
	chart := RSChart new.
	chart addPlot: (RSLinePlot new y: (measures collect:[ :e | e data ])).
	chart addDecoration: (RSVerticalTick new).
	chart addDecoration: (RSHorizontalTick new).
	chart open.
]

{ #category : #'Examples - API uses with Roassal' }
NetatmoAPIExamples class >> stationWeekInternalAndExternalHumidityGraphExample [
	"This example display some humidity data in a Roassal graph for the week"
	"This example works only if your have a weather station device with an outdoor module ;-)"
	<script>
	
	| api devices indoorMeasures chart station outdoorMeasures outdoorModule |
	api := self getCurrentConnectedNetatmoAPI ifNil:[ ^ self ].
	
	devices := api getStationDevices.
	(devices isNil or:[devices isEmpty]) ifTrue:[ ^ self ].
	station := devices first.
	station haveOutdoorModules ifFalse:[ ^ self ].
	outdoorModule := station outdoorModules first.
	
	indoorMeasures := SortedCollection sortBlock: [ :a :b | a dateTime < b dateTime ].
	outdoorMeasures := SortedCollection sortBlock: [ :a :b | a dateTime < b dateTime ].
	
	"Because the number of result is limited, need to do multiple requests"
	1 to: 7 do:[ :i |
		indoorMeasures addAll: (api getMeasures: (station id) 
			types: (OrderedCollection with: NetatmoMeasureType humidity) 
			dateTimeBegin: (DateAndTime now - (i day)) 
			dateTimeEnd: (DateAndTime now - ((i - 1) day))).
	].	
	 
	1 to: 7 do:[ :i |
		outdoorMeasures addAll: (api getMeasures: (station id) module: (outdoorModule id) 
			types: (OrderedCollection with: NetatmoMeasureType humidity) 
			dateTimeBegin: (DateAndTime now - (i day)) 
			dateTimeEnd: (DateAndTime now - ((i - 1) day))).
	].	
	
	chart := RSChart new.
	chart addPlot: (RSLinePlot new y: (indoorMeasures collect:[ :e | e data ])).
	chart addPlot: (RSLinePlot new y: (outdoorMeasures collect:[ :e | e data ])).
	chart addDecoration: (RSVerticalTick new).
	chart addDecoration: (RSHorizontalTick new).
	chart open.
]

{ #category : #'see class side' }
NetatmoAPIExamples >> seeClassSide [

	
]
