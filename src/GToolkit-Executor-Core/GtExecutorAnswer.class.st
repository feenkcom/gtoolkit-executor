Class {
	#name : #GtExecutorAnswer,
	#superclass : #GtExecutorProtoAnswer,
	#traits : 'TGtExecutorAnswer',
	#classTraits : 'TGtExecutorAnswer classTrait',
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #testing }
GtExecutorAnswer class >> isAbstract [
	^ self name = #GtExecutorAnswer 
]

{ #category : #factory }
GtExecutorAnswer class >> noValue [
	^ GtExecutorAnswerWithoutValue new
]

{ #category : #factory }
GtExecutorAnswer class >> noValue: aDescription [
	^ GtExecutorAnswerWithoutValue new description: aDescription
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
GtExecutorAnswer class >> value: anObject [
	^ GtExecutorAnswerWithValue new value: anObject
]

{ #category : #testing }
GtExecutorAnswer >> isAnswer [
	^ true
]
