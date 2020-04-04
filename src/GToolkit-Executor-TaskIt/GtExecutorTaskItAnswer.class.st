Class {
	#name : #GtExecutorTaskItAnswer,
	#superclass : #GtExecutorSuccessfulAnswerWithoutValue,
	#instVars : [
		'future'
	],
	#category : #'GToolkit-Executor-TaskIt-Answers'
}

{ #category : #defaults }
GtExecutorTaskItAnswer >> defaultFuture [
	^ GtExecutorTaskItFuture null
]

{ #category : #accessing }
GtExecutorTaskItAnswer >> future [
	<return: #GtExecutorTaskItFuture>
	^ future
]

{ #category : #accessing }
GtExecutorTaskItAnswer >> future: aTKTFuture [
	self 
		assert: [ aTKTFuture isNotNil ] 
		description: [ 'TaskIt Future must be non-nil' ].
	future := aTKTFuture.
	self subscribeFutureCallbacks.
]

{ #category : #initialization }
GtExecutorTaskItAnswer >> initialize [
	super initialize.
	future := self defaultFuture.
]

{ #category : #'private - subscriptions' }
GtExecutorTaskItAnswer >> subscribeFutureCallbacks [
	self onPrivateSuccessDo: [ :aSubCommand | 
		self answerFromCommand: aSubCommand ].
	self onPrivateFailureDo: [ :anException | 
		self answerFromException: anException ].
]
