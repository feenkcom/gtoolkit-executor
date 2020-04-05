Trait {
	#name : #TGtExecutorDecoratingCommand,
	#traits : 'TGtExecutorAllCommands + TGtExecutorReplacingCommand + TGtExecutorCommand',
	#classTraits : 'TGtExecutorAllCommands classTrait + TGtExecutorReplacingCommand classTrait + TGtExecutorCommand classTrait',
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #accessing }
TGtExecutorDecoratingCommand classSide >> subCommandExecutionContextOptionName [
	^ #subCommandExecutionContext
]

{ #category : #accessing }
TGtExecutorDecoratingCommand >> command [
	<return: #TGtExecutorProtoCommand>
	^ self explicitRequirement
]

{ #category : #enumerating }
TGtExecutorDecoratingCommand >> commandsDo: oneArgBlock [
	oneArgBlock cull: self.
	self command ifNil: [ ^ self ].
	self command commandsDo: oneArgBlock
]

{ #category : #configurations }
TGtExecutorDecoratingCommand >> configurations: aGtExecutorConfigurations [
	self 
		assert: [ aGtExecutorConfigurations isNotNil ]
		description: [ 'Executor configurations must be non-nil' ].
	self 
		assert: [ aGtExecutorConfigurations isConfigurations ]
		description: [ 'Executor configurations must be a real configurations instance (not null pattern)' ].
	^ self
		optionAt: self class configurationsOptionName
		put: aGtExecutorConfigurations
]

{ #category : #configurations }
TGtExecutorDecoratingCommand >> defaultConfigurations [ 
	^ GtExecutorConfigurations null
]

{ #category : #execution }
TGtExecutorDecoratingCommand >> executeInContext: aGtExecutorExecutionContext [
	<return: #GtExecutorExecutionContext>
	self subCommandExecutionContext: aGtExecutorExecutionContext.
	^ aGtExecutorExecutionContext execute: self.
]

{ #category : #'private - accessing' }
TGtExecutorDecoratingCommand >> subCommandExecutionContext [
	<return: #GtExecutorExecutionContext>
	^ self 
		optionAt: self class subCommandExecutionContextOptionName 
		ifAbsent: [ GtExecutorExecutionContext null ]
]

{ #category : #'private - accessing' }
TGtExecutorDecoratingCommand >> subCommandExecutionContext: aGtExecutorExecutionContext [
	self assertOptionDoesNotExist: self class subCommandExecutionContextOptionName.
	self 
		optionAt: self class subCommandExecutionContextOptionName 
		put: aGtExecutorExecutionContext
]
