Class {
	#name : #BaselineOfNetatmoAPI,
	#superclass : #BaselineOf,
	#category : #BaselineOfNetatmoAPI
}

{ #category : #baselines }
BaselineOfNetatmoAPI >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			"Dependencies"
			self dependencies: spec.
			
			"Packages"
			spec
				package: 'NetatmoAPI'.
				"package: 'NetatmoAPI-Tests' with: [ spec requires: 'NetatmoAPI' ]."
		]
]

{ #category : #baselines }
BaselineOfNetatmoAPI >> dependencies: spec [

	self flag:'load only Zinc OAuth2 package'.
	"spec baseline: 'ZincHTTPComponents' with: [ spec repository: 'github://svenvc/zinc/repository' ]."
]
