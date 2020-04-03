Extension { #name : #TGtExecutorAnswer }

{ #category : #'*GToolkit-Executor-UI' }
TGtExecutorAnswer >> gtCommandsFor: aView [
	<gtView>
	^ aView forward
		title: 'Answers';
		priority: 1;
		object: [ self command ];
		view: #gtCommandsFor:
]
