Extension { #name : #GtExecutorDecoratingProtoCommand }

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorDecoratingProtoCommand >> gtCommandsFor: aView [
	<gtView>
	self command ifNil: [ ^ aView empty ].
	^ aView columnedList 
		title: 'Commands';
		priority: 1;
		items: [ self allCommands ];
		column: 'Command' item: [ :eachCommand | eachCommand ];
		column: 'Answer' item: [ :eachCommand | eachCommand answer ]
]
