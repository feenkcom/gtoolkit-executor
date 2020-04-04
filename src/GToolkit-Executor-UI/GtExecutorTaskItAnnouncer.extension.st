Extension { #name : #GtExecutorTaskItAnnouncer }

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorTaskItAnnouncer >> gtSubscriptionsFor: aView [
	<gtView>
	self announcer ifNil: [ ^ aView empty ].
	^ aView forward 
		title: 'Subscriptions';
		object: [ self announcer ];
		view: #gtSubscriptionsFor:
]
