Extension { #name : #GtExecutorExecutionExceptionContext }

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorExecutionExceptionContext >> gtMessageTextFor: aView [
	<gtView>
	self exception ifNil: [ ^ aView empty ].
	^ aView forward 
		title: 'Exception Message';
		priority: 1;
		object: [ self exception ];
		view: #gtMessageTextFor:
]
