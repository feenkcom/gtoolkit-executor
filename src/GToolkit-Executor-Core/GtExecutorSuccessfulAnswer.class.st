Class {
	#name : #GtExecutorSuccessfulAnswer,
	#superclass : #GtExecutorAnswer,
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #testing }
GtExecutorSuccessfulAnswer class >> isAbstract [ 
	^ self name = #GtExecutorSuccessfulAnswer 
]

{ #category : #testing }
GtExecutorSuccessfulAnswer >> isSuccess [
	^ true
]
