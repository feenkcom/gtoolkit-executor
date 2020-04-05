Class {
	#name : #GtExecutorAnswer,
	#superclass : #GtExecutorProtoAnswer,
	#traits : 'TGtExecutorAnswer',
	#classTraits : 'TGtExecutorAnswer classTrait',
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #factory }
GtExecutorAnswer class >> exception: anException [ 
	^ GtExecutorExceptionAnswer new exception: anException; freeze
]

{ #category : #testing }
GtExecutorAnswer class >> isAbstract [
	^ self name = #GtExecutorAnswer 
]

{ #category : #factory }
GtExecutorAnswer class >> noValue [
	^ GtExecutorSuccessfulAnswerWithoutValue new
]

{ #category : #factory }
GtExecutorAnswer class >> noValue: aDescription [
	^ GtExecutorSuccessfulAnswerWithoutValue new description: aDescription
]

{ #category : #factory }
GtExecutorAnswer class >> noValueWithSuccess [
	^ self noValue: 'Successfully executed'
]

{ #category : #factory }
GtExecutorAnswer class >> null [
	^ GtExecutorNullAnswer default
]

{ #category : #factory }
GtExecutorAnswer class >> subCommandFailure: aCommand [
	^ GtExecutorSubCommandFailureAnswer new subCommand: aCommand
]

{ #category : #factory }
GtExecutorAnswer class >> value: anObject [
	^ GtExecutorSuccessfulAnswerWithValue new value: anObject
]

{ #category : #testing }
GtExecutorAnswer >> isAnswer [
	^ true
]

{ #category : #testing }
GtExecutorAnswer >> isSuccess [
	<return: #Boolean>
	^ self subclassResponsibility
]
