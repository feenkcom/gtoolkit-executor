Class {
	#name : #GtExecutorAnnouncementSubscriptionsAdaptor,
	#superclass : #GtExecutorAnnouncementSubscriptionProtoAdaptor,
	#instVars : [
		'adaptors'
	],
	#category : #'GToolkit-Executor-TaskIt-Adaptors'
}

{ #category : #convenient }
GtExecutorAnnouncementSubscriptionsAdaptor >> adaptor: aGtExecutorAnnouncementSubscriptionAdaptor [
	self 
		assert: [ GtExecutorAnnouncementSubscriptionAdaptor isNotNil ] 
		description: [ 'Subscription adaptor must be non-nil' ].
	self adaptors add: aGtExecutorAnnouncementSubscriptionAdaptor
]

{ #category : #accessing }
GtExecutorAnnouncementSubscriptionsAdaptor >> adaptors [
	^ adaptors
]

{ #category : #defaults }
GtExecutorAnnouncementSubscriptionsAdaptor >> defaultAdaptors [
	^ OrderedCollection new: 2
]

{ #category : #testing }
GtExecutorAnnouncementSubscriptionsAdaptor >> hasAdaptors [
	^ self adaptors isNotNil and: [ 
		self adaptors isNotEmpty ]
]

{ #category : #initialization }
GtExecutorAnnouncementSubscriptionsAdaptor >> initialize [
	super initialize.
	adaptors := self defaultAdaptors.
]

{ #category : #accessing }
GtExecutorAnnouncementSubscriptionsAdaptor >> subscriber: anObject [
	self adaptors do: [ :eachAdaptor | eachAdaptor subscriber: anObject ] 
]
