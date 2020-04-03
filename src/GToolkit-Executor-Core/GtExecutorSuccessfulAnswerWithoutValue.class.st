Class {
	#name : #GtExecutorSuccessfulAnswerWithoutValue,
	#superclass : #GtExecutorSuccessfulAnswer,
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #testing }
GtExecutorSuccessfulAnswerWithoutValue >> hasValue [
	^ false
]

{ #category : #printing }
GtExecutorSuccessfulAnswerWithoutValue >> printOn: aStream [
	aStream nextPutAll: 'Answer without value'.
]
