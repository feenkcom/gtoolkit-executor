Class {
	#name : #GtExecutorTaskItAnnouncer,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#instVars : [
		'answer',
		'announcer'
	],
	#category : #'GToolkit-Executor-TaskIt-Announcer'
}

{ #category : #announcing }
GtExecutorTaskItAnnouncer >> announceFinishedWithFailure: anException [
	self announcer announce: (GtExecutorTaskItFailureAnnouncement new 
		answer: self answer;
		exception: anException)
]

{ #category : #announcing }
GtExecutorTaskItAnnouncer >> announceSuccessfullyFinished: aSubCommand [
	self announcer announce: (GtExecutorTaskItSuccessfulAnnouncement new
		subAnswer: aSubCommand answer;
		answer: self answer)
]

{ #category : #accessing }
GtExecutorTaskItAnnouncer >> announcer [
	^ announcer
]

{ #category : #accessing }
GtExecutorTaskItAnnouncer >> answer [
	<return: #GtExecutorTaskItAnswer>
	^ answer
]

{ #category : #accessing }
GtExecutorTaskItAnnouncer >> answer: aGtExecutorTaskItAnswer [
	self 
		assert: [ aGtExecutorTaskItAnswer isNotNil ] 
		description: [ 'Executor Answer must be non-nil' ].
	answer := aGtExecutorTaskItAnswer
]

{ #category : #defaults }
GtExecutorTaskItAnnouncer >> defaultAnnouncer [
	^ Announcer new
]

{ #category : #defaults }
GtExecutorTaskItAnnouncer >> defaultAnswer [
	^ GtExecutorAnswer null
]

{ #category : #initialization }
GtExecutorTaskItAnnouncer >> initialize [
	super initialize.
	announcer := self defaultAnnouncer.
	answer := self defaultAnswer.
]

{ #category : #'announcer - subscription' }
GtExecutorTaskItAnnouncer >> unsubscribe: aSubscriber [
	self announcer unsubscribe: aSubscriber
]

{ #category : #subscriptions }
GtExecutorTaskItAnnouncer >> whenFailureDo: aBlock [
	<return: #AnnouncementSubscription>
	^ self announcer 
		when: GtExecutorTaskItFailureAnnouncement 
		do: aBlock
]

{ #category : #subscriptions }
GtExecutorTaskItAnnouncer >> whenSuccessDo: aBlock [
	<return: #AnnouncementSubscription>
	^ self announcer 
		when: GtExecutorTaskItSuccessfulAnnouncement 
		do: aBlock
]
