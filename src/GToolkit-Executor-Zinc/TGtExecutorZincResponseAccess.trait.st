Trait {
	#name : #TGtExecutorZincResponseAccess,
	#instVars : [
		'response'
	],
	#category : #'GToolkit-Executor-Zinc-Traits'
}

{ #category : #accessing }
TGtExecutorZincResponseAccess >> response [
	<return: #ZnResponse>
	^ response
]

{ #category : #accessing }
TGtExecutorZincResponseAccess >> response: aZnResponse [
	self 
		assert: [ aZnResponse isNotNil ] 
		description: [ 'Response must be non-nil' ].
	response := aZnResponse
]
