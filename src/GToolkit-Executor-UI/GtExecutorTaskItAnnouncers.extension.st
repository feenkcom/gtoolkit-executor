Extension { #name : #GtExecutorTaskItAnnouncers }

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorTaskItAnnouncers >> gtCollectionFor: aView [ 
	<gtView>
	self collection ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Announcers';
		object: [ self collection ];
		view: #gtItemsFor:
]
