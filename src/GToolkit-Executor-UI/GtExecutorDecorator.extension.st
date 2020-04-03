Extension { #name : #GtExecutorDecorator }

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorDecorator >> gtCommandsFor: aView [
	<gtView>
	self commands ifNil: [ ^ aView empty ].
	^ aView list
		title: 'Commands';
		priority: 1;
		items: [ self commands reversed ]
]
