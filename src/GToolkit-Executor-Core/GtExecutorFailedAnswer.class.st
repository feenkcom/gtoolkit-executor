Class {
	#name : #GtExecutorFailedAnswer,
	#superclass : #GtExecutorAnswer,
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #testing }
GtExecutorFailedAnswer class >> isAbstract [ 
	^ self name = #GtExecutorFailedAnswer 
]

{ #category : #testing }
GtExecutorFailedAnswer >> hasValue [
	^ false
]

{ #category : #testing }
GtExecutorFailedAnswer >> isSuccess [
	^ false
]
