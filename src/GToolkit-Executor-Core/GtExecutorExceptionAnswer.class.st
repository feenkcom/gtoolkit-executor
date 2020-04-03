Class {
	#name : #GtExecutorExceptionAnswer,
	#superclass : #GtExecutorFailedAnswer,
	#instVars : [
		'exception'
	],
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #accessing }
GtExecutorExceptionAnswer >> exception [
	<return: #Exception>
	^ exception
]

{ #category : #accessing }
GtExecutorExceptionAnswer >> exception: anException [
	self
		assert: [ anException isNotNil ] 
		description: [ 'Exception must be non-nil' ].
	exception := anException
]

{ #category : #testing }
GtExecutorExceptionAnswer >> hasValue [
	^ false
]
