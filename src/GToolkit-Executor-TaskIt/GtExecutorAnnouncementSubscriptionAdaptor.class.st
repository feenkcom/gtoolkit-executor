Class {
	#name : #GtExecutorAnnouncementSubscriptionAdaptor,
	#superclass : #GtExecutorAnnouncementSubscriptionProtoAdaptor,
	#instVars : [
		'subscription'
	],
	#category : #'GToolkit-Executor-TaskIt-Adaptors'
}

{ #category : #accessing }
GtExecutorAnnouncementSubscriptionAdaptor >> subscriber [
	^ subscriber
]

{ #category : #accessing }
GtExecutorAnnouncementSubscriptionAdaptor >> subscriber: anObject [
	subscriber := anObject
]

{ #category : #accessing }
GtExecutorAnnouncementSubscriptionAdaptor >> subscription [
	<return: #AnnouncementSubscription>
	^ subscription
]

{ #category : #accessing }
GtExecutorAnnouncementSubscriptionAdaptor >> subscription: anAnnouncementSubscription [
	self 
		assert: [ anAnnouncementSubscription isNotNil ] 
		description: [ 'Subscription must be non-nil' ].
	subscription := anAnnouncementSubscription.
	self updateSubscription.
]

{ #category : #'private - update' }
GtExecutorAnnouncementSubscriptionAdaptor >> updateSubscription [
	self subscriber ifNotNil: [ :aSubscriber | 
		self subscription subscriber: aSubscriber ].
]
