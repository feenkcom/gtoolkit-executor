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

{ #category : #'exception handling' }
GtExecutorExceptionAnswer >> freeze [
	self exception freeze
]

{ #category : #printing }
GtExecutorExceptionAnswer >> printOn: aStream [ 
	aStream nextPutAll: 'Answer with exception'.
	self exception ifNil: [ ^ self ].
	aStream 
		nextPutAll: ': ';
		print: self exception.
]
