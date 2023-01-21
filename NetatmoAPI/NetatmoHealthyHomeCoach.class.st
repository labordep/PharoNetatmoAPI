"
Aircare / Home Coach
Product : Smart indoor air quality monitor
Product type : NHC
"
Class {
	#name : #NetatmoHealthyHomeCoach,
	#superclass : #NetatmoDevice,
	#category : #'NetatmoAPI-Model'
}

{ #category : #accessing }
NetatmoHealthyHomeCoach class >> product [

	^ 'Smart indoor air quality monitor'
]

{ #category : #accessing }
NetatmoHealthyHomeCoach class >> type [

	^'NHC'
]

{ #category : #testing }
NetatmoHealthyHomeCoach >> isHealthyHomeCoach [

	^ true
]
