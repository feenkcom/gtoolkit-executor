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
	futureAdaptor := aGtExecutorTaskItFutureAdaptor.
]

{ #category : #initialization }
GtExecutorTaskItAnswer >> initialize [
	super initialize.
	futureAdaptor := self defaultFutureAdaptor.
	announcers := self defaultAnnouncers.
]

{ #category : #subscriptions }
GtExecutorTaskItAnswer >> whenFailureDo: aFailureBlock [
	self futureAdaptor onFailureDo: [ :anException | 
		self announcer
			whenFailureDo: aFailureBlock;
			announceFinishedWithFailure: anException ].
]

{ #category : #subscriptions }
GtExecutorTaskItAnswer >> whenSuccessDo: aSuccessBlock [
	self futureAdaptor onSuccessDo: [ :aSubCommand | 
		self announcer
			whenSuccessDo: aSuccessBlock;
			announceSuccessfullyFinished: aSubCommand ].
]
