Extension { #name : #GtExecutorAnnouncementSubscriptionsAdaptor }

{ #category : #'*GToolkit-Executor-UI' }
GtExecutorAnnouncementSubscriptionsAdaptor >> gtAdaptorsFor: aView [ 
	<gtView>
	self adaptors ifNil: [ ^ aView empty ].
	^ aView forward 
		title: 'Adaptors';
		priority: 1;
		object: [ self adaptors ];
		view: #gtItemsFor:
]
