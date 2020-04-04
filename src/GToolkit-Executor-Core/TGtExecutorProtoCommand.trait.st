Trait {
	#name : #TGtExecutorProtoCommand,
	#traits : 'TGtExecutorAllCommands',
	#classTraits : 'TGtExecutorAllCommands classTrait',
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #accessing }
TGtExecutorProtoCommand >> answer [
	<return: #GtExecutorAnswer>
	^ self explicitRequirement
]

{ #category : #enumerating }
TGtExecutorProtoCommand >> commandsDo: oneArgBlock [
	oneArgBlock cull: self
]

{ #category : #execution }
TGtExecutorProtoCommand >> execute [
	"Perform a command task"
	self explicitRequirement
]

{ #category : #execution }
TGtExecutorProtoCommand >> executeInContext: aGtExecutorExecutionContext [
	<return: #GtExecutorExecutionContext>
	^ self explicitRequirement
]

{ #category : #testing }
TGtExecutorProtoCommand >> hasAnswer [
	<return: #Boolean>
	^ self explicitRequirement
]
