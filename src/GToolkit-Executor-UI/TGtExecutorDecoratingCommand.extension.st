Extension { #name : #TGtExecutorDecoratingCommand }

{ #category : #'*GToolkit-Executor-UI' }
TGtExecutorDecoratingCommand >> gtCommandsFor: aView [
	<gtView>
	self command ifNil: [ ^ aView empty ].
	^ aView columnedList 
		title: 'Commands';
		items: [ self allCommands ];
		column: 'Command' item: [ :eachCommand | eachCommand ];
		column: 'Answer' item: [ :eachCommand | eachCommand answer ]
]
