Trait {
	#name : #TGtExecutorDecoratingCommand,
	#traits : 'TGtExecutorAllCommands - {#commandsDo:} + TGtExecutorReplacingCommand',
	#classTraits : 'TGtExecutorAllCommands classTrait + TGtExecutorReplacingCommand classTrait',
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #accessing }
TGtExecutorDecoratingCommand >> command [
	<return: #TGtExecutorCommand>
	^ self explicitRequirement
]

{ #category : #enumerating }
TGtExecutorDecoratingCommand >> commandsDo: oneArgBlock [
	oneArgBlock cull: self.
	self command commandsDo: oneArgBlock
]

{ #category : #'gt-extension' }
TGtExecutorDecoratingCommand >> gtCommandsFor: aView [
	<gtView>
	self command ifNil: [ ^ aView empty ].
	^ aView list 
		title: 'Commands';
		items: [ self allCommands ]
]
