Class {
	#name : #GtExecutorAnswerWithoutValue,
	#superclass : #GtExecutorAnswer,
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #testing }
GtExecutorAnswerWithoutValue >> hasValue [
	^ false
]

{ #category : #printing }
GtExecutorAnswerWithoutValue >> printOn: aStream [
	aStream nextPutAll: 'Answer without value'.
]
