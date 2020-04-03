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

{ #category : #testing }
TGtExecutorProtoCommand >> hasAnswer [
	<return: #Boolean>
	^ self explicitRequirement
]
