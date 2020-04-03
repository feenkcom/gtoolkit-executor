Trait {
	#name : #TGtExecutorProtoCommand,
	#traits : 'TGtExecutorAllCommands - {#commandsDo:}',
	#classTraits : 'TGtExecutorAllCommands classTrait',
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #enumerating }
TGtExecutorProtoCommand >> commandsDo: oneArgBlock [
	oneArgBlock cull: self
]

{ #category : #execution }
TGtExecutorProtoCommand >> execute [
	"Perform a command task"
	self explicitRequirement
]

{ #category : #'gt-extension' }
TGtExecutorProtoCommand >> gtCommandsFor: aView [
	^ aView empty
]

{ #category : #testing }
TGtExecutorProtoCommand >> hasAnswer [
	<return: #Boolean>
	^ self explicitRequirement
]
