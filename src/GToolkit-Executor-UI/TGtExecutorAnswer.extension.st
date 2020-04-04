Extension { #name : #TGtExecutorAnswer }

{ #category : #'*GToolkit-Executor-UI' }
TGtExecutorAnswer >> gtCommandsFor: aView [
	<gtView>
	^ aView forward
		title: 'Answers';
		priority: 5;
		object: [ self command ];
		view: #gtCommandsFor:;
		send: #answer
]

{ #category : #'*GToolkit-Executor-UI' }
TGtExecutorAnswer >> gtDescriptionFor: aView [
	<gtView>
	self hasDescription ifFalse: [ ^ aView empty ].
	^ aView textEditor
		title: 'Description';
		priority: 1;
		glamorousCodeFontAndSize;
		text: [ self description ]
]
