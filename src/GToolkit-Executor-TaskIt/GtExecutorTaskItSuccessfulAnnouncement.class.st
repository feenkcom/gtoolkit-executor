Class {
	#name : #GtExecutorTaskItSuccessfulAnnouncement,
	#superclass : #GtExecutorTaskItAnnouncement,
	#instVars : [
		'subAnswer'
	],
	#category : #'GToolkit-Executor-TaskIt-Announcements'
}

{ #category : #defaults }
GtExecutorTaskItSuccessfulAnnouncement >> defaultSubAnswer [
	^ self defaultAnswer
]

{ #category : #initialization }
GtExecutorTaskItSuccessfulAnnouncement >> initialize [
	super initialize.
	subAnswer := self defaultSubAnswer.
]

{ #category : #accessing }
GtExecutorTaskItSuccessfulAnnouncement >> subAnswer [
	<return: #GtExecutorAnswer>
	^ subAnswer
]

{ #category : #accessing }
GtExecutorTaskItSuccessfulAnnouncement >> subAnswer: aGtExecutorAnswer [
	self 
		assert: [ aGtExecutorAnswer isNotNil ] 
		description: [ 'Executor sub-answer must be non-nil' ].
	subAnswer := aGtExecutorAnswer
]
