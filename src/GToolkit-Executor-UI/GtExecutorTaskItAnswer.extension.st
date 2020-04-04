Extension { #name : #GtExecutorTaskItAnswer }

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorTaskItAnswer >> gtAnnouncersFor: aView [ 
	<gtView>
	self announcers ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Announcers';
		priority: 11;
		object: [ self announcers ];
		view: #gtCollectionFor:;
		updateWhen: GtExecutorTaskItAnnouncement in: [ self ]
]

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorTaskItAnswer >> gtCommandsFor: aView [
	^ (super gtCommandsFor: aView)
		updateWhen: GtExecutorTaskItAnnouncement in: [ self ]
]
