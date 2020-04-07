Trait {
	#name : #TGtExecutorZincClientAssertions,
	#category : #'GToolkit-Executor-Zinc-Traits'
}

{ #category : #'asserting - client' }
TGtExecutorZincClientAssertions >> assertClientUrl [
	self 
		assert: [ self zincClient request isNotNil ]
		description: [ 'Zinc client request must be non-nil' ].
	self 
		assert: [ self zincClient request url isNotNil ]
		description: [ 'Zinc client URL must be non-nil' ].
	self 
		assert: [ self zincClient request url hasScheme ]
		description: [ 'Zinc client URL scheme must be defined' ].
	self 
		assert: [ self zincClient request url hasHost ]
		description: [ 'Zinc client URL host must be defined' ].
	
]

{ #category : #'accessing - client' }
TGtExecutorZincClientAssertions >> zincClient [
	<return: #ZnClient>
	^ self explicitRequirement
]
