Class {
	#name : #NetatmoAPIExamples,
	#superclass : #Object,
	#category : #'NetatmoAPI-Examples'
}

{ #category : #'low level examples' }
NetatmoAPIExamples class >> exampleGetHomeCoachMeasure [
	<script:'self exampleGetHomeCoachMeasure inspect'>
	| result |
	
	result := ZnClient new 
		url: 'https://api.netatmo.com/api/getmeasure';
		queryAt: 'device_id' put: self homeCoachMacAddress;
		queryAt: 'scale' put: '30min';
		queryAt: 'type' put: 'humidity';
		queryAt: 'date_begin' put: '1671200000';
		queryAt: 'date_end' put: '1671302000';
		queryAt: 'optimize' put: 'false';
		queryAt: 'real_time' put: 'false';
		forJsonREST;
		setBearerAuthentication: self token; 
		get.
		
	^result
]

{ #category : #'high level examples' }
NetatmoAPIExamples class >> exampleGetHomeCoachMeasureModel [
	<script: 'self exampleGetHomeCoachMeasureModel inspect'>
	
	| raw measures |
	raw := self exampleGetHomeCoachMeasure. 

	measures := OrderedCollection new.
	(raw at: #body) keysAndValuesDo:[ :k :v | | m |
		m := NetatmoMeasure new.	
		m dateTime: (DateAndTime fromUnixTime: k asInteger).
		m type: 'humidity'.
		m data: v first.
		m unit: '%'.
		measures add: m.
	].

	measures
]

{ #category : #'low level examples' }
NetatmoAPIExamples class >> exampleGetHomeCoachsData [
	<script:'self exampleGetHomeCoachsData inspect'>
	| result |
	
	result := ZnClient new 
		url: 'https://api.netatmo.com/api/gethomecoachsdata'; 
		forJsonREST;
		setBearerAuthentication: self token; 
		get.
		
	^result
]

{ #category : #'high level examples' }
NetatmoAPIExamples class >> exampleGetHomeCoachsDataModel [
	<script: 'self exampleGetHomeCoachsDataModel inspect'>
	
	| raw |
	raw := self exampleGetHomeCoachsData. 

	raw
]

{ #category : #'low level examples' }
NetatmoAPIExamples class >> exampleGetHomeCoachsDataWithDeviceId [
	<script:'self exampleGetHomeCoachsDataWithDeviceId inspect'>
	| result |
	
	result := ZnClient new 
		url: 'https://api.netatmo.com/api/gethomecoachsdata'; 
		queryAt: 'device_id' put: self homeCoachMacAddress;
		forJsonREST;
		setBearerAuthentication: self token; 
		get.
		
	^result
]

{ #category : #'low level examples' }
NetatmoAPIExamples class >> exampleGetStationMeasure [
	<script:'self exampleGetStationMeasure inspect'>
	| result |
	
	result := ZnClient new 
		url: 'https://api.netatmo.com/api/getmeasure'; 
		queryAt: 'device_id' put: self weatherStationMacAddress;
		queryAt: 'module_id' put: self weatherStationMacAddress; "can be a module id"
		queryAt: 'scale' put: '30min';
		queryAt: 'type' put: 'humidity';
		queryAt: 'date_begin' put: '1671200000';
		queryAt: 'date_end' put: '1671302000';
		queryAt: 'optimize' put: 'false';
		queryAt: 'real_time' put: 'false';
		forJsonREST;
		setBearerAuthentication: self token; 
		get.
		
	^result
]

{ #category : #'high level examples' }
NetatmoAPIExamples class >> exampleGetStationMeasureModel [
	<script: 'self exampleGetStationMeasureModel inspect'>
	
	| raw measures |
	raw := self exampleGetStationMeasure.

	measures := OrderedCollection new.
	(raw at: #body) keysAndValuesDo:[ :k :v | | m |
		m := NetatmoMeasure new.	
		m dateTime: (DateAndTime fromUnixTime: k asInteger).
		m type: 'humidity'.
		m data: v first.
		m unit: '%'.
		measures add: m.
	].

	measures
]

{ #category : #'low level examples' }
NetatmoAPIExamples class >> exampleGetStationsData [
	<script:'self exampleGetStationsData inspect'>
	| result |
	
	result := ZnClient new 
		url: 'https://api.netatmo.com/api/getstationsdata';
		queryAt: 'get_favorites' put: false;
		forJsonREST;
		setBearerAuthentication: self token; 
		get.
		
	^result
]

{ #category : #'low level examples' }
NetatmoAPIExamples class >> exampleGetStationsDataWithDeviceId [
	<script:'self exampleGetStationsDataWithDeviceId inspect'>
	| result |
	
	result := ZnClient new 
		url: 'https://api.netatmo.com/api/getstationsdata'; 
		queryAt: 'device_id' put: self weatherStationMacAddress;
		queryAt: 'get_favorites' put: false;
		forJsonREST;
		setBearerAuthentication: self token; 
		get.
		
	^result
]

{ #category : #accessing }
NetatmoAPIExamples class >> homeCoachMacAddress [ 
	"Return a test address here"
	
	^'01:23:45:67:89:ab'
]

{ #category : #accessing }
NetatmoAPIExamples class >> token [ 
	"Return a test token here"
	
	^'0123456789ab|ba9846543210'
]

{ #category : #accessing }
NetatmoAPIExamples class >> weatherStationMacAddress [ 
	"Return a test address here"
	
	^'01:23:45:67:89:ab'
]
