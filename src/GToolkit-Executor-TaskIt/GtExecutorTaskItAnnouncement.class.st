Class {
	#name : #GtExecutorTaskItAnnouncement,
	#superclass : #GtExecutorTaskItProtoAnnouncement,
	#instVars : [
		'answer'
	],
	#category : #'GToolkit-Executor-TaskIt-Announcements'
}

{ #category : #accessing }
GtExecutorTaskItAnnouncement >> answer [
	<return: #GtExecutorAnswer>
	^ answer
]

{ #category : #accessing }
GtExecutorTaskItAnnouncement >> answer: aGtExecutorAnswer [
	self 
		assert: [ aGtExecutorAnswer isNotNil ] 
		description: [ 'Executor answer must be non-nil' ].
	answer := aGtExecutorAnswer
]

{ #category : #defaults }
GtExecutorTaskItAnnouncement >> defaultAnswer [
	^ GtExecutorAnswer null
]

{ #category : #initialization }
GtExecutorTaskItAnnouncement >> initialize [
	super initialize.
	answer := self defaultAnswer.
]
