Trait {
	#name : #TNetatmoDashboard,
	#instVars : [
		'dashboardMeasures',
		'dashboardDateTime'
	],
	#category : #'NetatmoAPI-Model'
}

{ #category : #dashboard }
TNetatmoDashboard >> dashboardDateTime [

	^ dashboardDateTime
]

{ #category : #dashboard }
TNetatmoDashboard >> dashboardDateTime: anObject [

	dashboardDateTime := anObject
]

{ #category : #dashboard }
TNetatmoDashboard >> dashboardMeasures [

	dashboardMeasures ifNil: [ dashboardMeasures := OrderedCollection new ].
	^ dashboardMeasures
]

{ #category : #dashboard }
TNetatmoDashboard >> haveDashboardMeasures [

	^ self dashboardMeasures notEmpty
]
