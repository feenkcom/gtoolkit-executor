Trait {
	#name : #TGtExecutorDecoratingCommand,
	#traits : 'TGtExecutorAllCommands - {#commandsDo:} + TGtExecutorReplacingCommand + TGtExecutorCommand',
	#classTraits : 'TGtExecutorAllCommands classTrait + TGtExecutorReplacingCommand classTrait + TGtExecutorCommand classTrait',
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #accessing }
TGtExecutorDecoratingCommand >> command [
	<return: #TGtExecutorProtoCommand>
	^ self explicitRequirement
]

{ #category : #enumerating }
TGtExecutorDecoratingCommand >> commandsDo: oneArgBlock [
	oneArgBlock cull: self.
	self command commandsDo: oneArgBlock
]
