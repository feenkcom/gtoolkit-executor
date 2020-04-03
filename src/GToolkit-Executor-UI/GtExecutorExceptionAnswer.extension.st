Extension { #name : #GtExecutorExceptionAnswer }

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorExceptionAnswer >> gtLiveFor: aView [
	<gtView>
	self exception ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Stack';
		priority: 2;
		object: [ self exception ];
		view: #gtLiveFor:
]

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorExceptionAnswer >> gtMessageTextFor: aView [
	<gtView>
	self exception ifNil: [ ^ aView empty ].
	^ aView forward 
		title: 'Exception Message';
		priority: 1;
		object: [ self exception ];
		view: #gtMessageTextFor:
]

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorExceptionAnswer >> statusIcon [
	<return: #Form>
	^ BrGlamorousIcons redcircle
]
