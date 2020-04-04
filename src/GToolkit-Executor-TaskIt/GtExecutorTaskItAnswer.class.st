Class {
	#name : #GtExecutorTaskItAnswer,
	#superclass : #GtExecutorSuccessfulAnswerWithoutValue,
	#instVars : [
		'futureAdaptor',
		'announcers'
	],
	#category : #'GToolkit-Executor-TaskIt-Answers'
}

{ #category : #accessing }
GtExecutorTaskItAnswer class >> announcersOptionName [
	^ #announcers
]

{ #category : #'private - convenient' }
GtExecutorTaskItAnswer >> announcer [
	<return: #GtExecutorTaskItAnnouncer>
	^ self announcers newAnnouncer
]

{ #category : #accessing }
GtExecutorTaskItAnswer >> announcers [
	<return: #GtExecutorTaskItAnnouncers>
	^ announcers
]

{ #category : #defaults }
GtExecutorTaskItAnswer >> defaultAnnouncers [
	^ GtExecutorTaskItAnnouncers new answer: self.
]

{ #category : #defaults }
GtExecutorTaskItAnswer >> defaultFutureAdaptor [
	^ GtExecutorTaskItFutureAdaptor null
]

{ #category : #accessing }
GtExecutorTaskItAnswer >> futureAdaptor [
	<return: #GtExecutorTaskItFutureAdaptor>
	^ futureAdaptor
]

{ #category : #accessing }
GtExecutorTaskItAnswer >> futureAdaptor: aGtExecutorTaskItFutureAdaptor [
	self 
		assert: [ aGtExecutorTaskItFutureAdaptor isNotNil ] 
		description: [ 'TaskIt Future adaptor must be non-nil' ].
	self 
		assert: [ aGtExecutorTaskItFutureAdaptor isFuture ] 
		description: [ 'TaskIt Future adaptor must be a real adaptor' ].
	futureAdaptor := aGtExecutorTaskItFutureAdaptor.
]

{ #category : #initialization }
GtExecutorTaskItAnswer >> initialize [
	super initialize.
	futureAdaptor := self defaultFutureAdaptor.
	announcers := self defaultAnnouncers.
]

{ #category : #subscriptions }
GtExecutorTaskItAnswer >> unsubscribe: aSubscriber [
	self announcer unsubscribe: aSubscriber
]

{ #category : #subscriptions }
GtExecutorTaskItAnswer >> when: anAnnouncement do: aBlock [
	<return: #GtExecutorAnnouncementSubscriptionsAdaptor>
	"I recomend you do specific subscriptions 
	since more generic may iterate over too many announcement class collection"
	| anAdaptor |
	anAdaptor := GtExecutorAnnouncementSubscriptionsAdaptor new.
	(anAnnouncement instanceSide withAllSubclasses includes: GtExecutorTaskItFailureAnnouncement) 
		ifTrue: [ anAdaptor adaptor: (self whenFailureDo: aBlock) ].
	(anAnnouncement instanceSide withAllSubclasses includes: GtExecutorTaskItSuccessfulAnnouncement) 
		ifTrue: [ anAdaptor adaptor: (self whenSuccessDo: aBlock) ].
	^ anAdaptor
]

{ #category : #subscriptions }
GtExecutorTaskItAnswer >> whenFailureDo: aFailureBlock [
	<return: #GtExecutorAnnouncementSubscriptionAdaptor>
	| anAdaptor |
	anAdaptor := GtExecutorAnnouncementSubscriptionAdaptor new.
	self futureAdaptor onFailureDo: [ :anException | 
		| anAnnouncer aSubscription |
		anAnnouncer := self announcer.
		aSubscription := anAnnouncer whenFailureDo: aFailureBlock.
		anAdaptor subscription: aSubscription.
		anAnnouncer announceFinishedWithFailure: anException ].
	^ anAdaptor
]

{ #category : #subscriptions }
GtExecutorTaskItAnswer >> whenSuccessDo: aSuccessBlock [
	<return: #GtExecutorAnnouncementSubscriptionAdaptor>
	| anAdaptor |
	anAdaptor := GtExecutorAnnouncementSubscriptionAdaptor new.
	self futureAdaptor onSuccessDo: [ :aSubCommand | 
		| anAnnouncer aSubscription |
		anAnnouncer := self announcer.
		aSubscription := anAnnouncer whenSuccessDo: aSuccessBlock.
		anAdaptor subscription: aSubscription.
		anAnnouncer announceSuccessfullyFinished: aSubCommand ].
	^ anAdaptor
]
