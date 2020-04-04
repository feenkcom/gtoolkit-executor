Extension { #name : #TGtExecutorProtoCommand }

{ #category : #'*GToolkit-Executor-UI' }
TGtExecutorProtoCommand >> gtCommandsFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Commands';
		priority: 1;
		items: [ self allCommands ];
		column: 'Command' item: [ :eachCommand | eachCommand ];
		column: 'Icon' do: [ :aColumn | 
			aColumn 
				itemStencil: [ :eachCommand | eachCommand statusIcon asElement ];
				noResize ];
		column: 'Answer' item: [ :eachCommand | eachCommand answer ];
		column: 'Exec' do: [ :aColumn | 
			aColumn 
				itemStencil: [ :eachCommand | eachCommand executionStatus icon asElement ];
				noResize ];
		column: 'Status' item: [ :eachCommand | eachCommand executionStatus ].
]

{ #category : #'*GToolkit-Executor-UI' }
TGtExecutorProtoCommand >> statusIcon [
	<return: #Form>
	^ self answer statusIcon
]
