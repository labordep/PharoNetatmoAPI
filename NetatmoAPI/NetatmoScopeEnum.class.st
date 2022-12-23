Class {
	#name : #NetatmoScopeEnum,
	#superclass : #Object,
	#category : #'NetatmoAPI-Model'
}

{ #category : #read }
NetatmoScopeEnum class >> accessCamera [

	^'access_camera'
]

{ #category : #read }
NetatmoScopeEnum class >> accessPresence [

	^'access_presence'
]

{ #category : #shortcuts }
NetatmoScopeEnum class >> allReadScopes [
	"self allReadScopes"

	| list |
	list := OrderedCollection new.
	list add: self readSmokedetector.
	list add: self readCamera.
	list add: self readStation.
	list add: self readHomecoach.
	list add: self readThermostat.
	list add: self readPresence.
	^list asArray
]

{ #category : #shortcuts }
NetatmoScopeEnum class >> allWriteScopes [
	"self allWriteScopes"

	| list |
	list := OrderedCollection new.
	list add: self writeCamera.
	list add: self writeThermostat.
	^list asArray
]

{ #category : #read }
NetatmoScopeEnum class >> readCamera [

	^'read_camera'
]

{ #category : #read }
NetatmoScopeEnum class >> readHomecoach [ 

	^'read_homecoach'
]

{ #category : #read }
NetatmoScopeEnum class >> readPresence [

	^'read_presence'
]

{ #category : #read }
NetatmoScopeEnum class >> readSmokedetector [ 

	^'read_smokedetector'
]

{ #category : #read }
NetatmoScopeEnum class >> readStation [

	^'read_station'
]

{ #category : #read }
NetatmoScopeEnum class >> readThermostat [

	^'read_thermostat'
]

{ #category : #write }
NetatmoScopeEnum class >> writeCamera [

	^'write_camera'
]

{ #category : #write }
NetatmoScopeEnum class >> writeThermostat [

	^'write_thermostat'
]
