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
			"Packages"
			spec
				package: 'NetatmoAPI'.
				"package: 'NetatmoAPI-Tests' with: [ spec requires: 'NetatmoAPI' ]."
		]
]
