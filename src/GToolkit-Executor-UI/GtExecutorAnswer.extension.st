Extension { #name : #GtExecutorAnswer }

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorAnswer >> gtCommandsFor: aView [
	<gtView>
	^ aView forward
		title: 'Answers';
		priority: 10;
		object: [ self command ];
		view: #gtCommandsFor:
]
