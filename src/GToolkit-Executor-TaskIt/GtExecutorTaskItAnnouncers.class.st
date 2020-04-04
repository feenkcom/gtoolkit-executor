Class {
	#name : #GtExecutorTaskItAnnouncers,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#instVars : [
		'collection',
		'answer'
	],
	#category : #'GToolkit-Executor-TaskIt-Announcer'
}

{ #category : #accessing }
GtExecutorTaskItAnnouncers >> answer [
	<return: #GtExecutorAnswer>
	^ answer
]

{ #category : #accessing }
GtExecutorTaskItAnnouncers >> answer: aGtExecutorAnswer [
	self 
		assert: [ aGtExecutorAnswer isNotNil ] 
		description: [ 'Executor answer must be non-nil' ].
	answer := aGtExecutorAnswer
]

{ #category : #accessing }
GtExecutorTaskItAnnouncers >> collection [
	^ collection
]

{ #category : #defaults }
GtExecutorTaskItAnnouncers >> defaultAnswer [
	^ GtExecutorAnswer null
]

{ #category : #defaults }
GtExecutorTaskItAnnouncers >> defaultCollection [
	^ OrderedCollection new: 2
]

{ #category : #initialization }
GtExecutorTaskItAnnouncers >> initialize [
	super initialize.
	collection := self defaultCollection.
	answer := self defaultAnswer.
]

{ #category : #'instance creation' }
GtExecutorTaskItAnnouncers >> newAnnouncer [
	<return: #GtExecutorTaskItAnnouncer>
	| anAnnouncer |
	anAnnouncer := GtExecutorTaskItAnnouncer new.
	anAnnouncer answer: self answer.
	self collection add: anAnnouncer.
	^ anAnnouncer
]
