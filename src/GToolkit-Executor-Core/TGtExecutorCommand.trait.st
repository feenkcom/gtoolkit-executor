Trait {
	#name : #TGtExecutorCommand,
	#traits : 'TGtExecutorAllCommands - {#commandsDo:}',
	#classTraits : 'TGtExecutorAllCommands classTrait',
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #enumerating }
TGtExecutorCommand >> commandsDo: oneArgBlock [
	oneArgBlock cull: self
]

{ #category : #'gt-extension' }
TGtExecutorCommand >> gtCommandsFor: aView [
	^ aView empty
]
