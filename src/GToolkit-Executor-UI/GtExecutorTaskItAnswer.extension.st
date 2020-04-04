Extension { #name : #GtExecutorTaskItAnswer }

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorTaskItAnswer >> gtAnnouncersFor: aView [ 
	<gtView>
	self announcers ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Announcers';
		priority: 11;
		object: [ self announcers ];
		view: #gtCollectionFor:
]
