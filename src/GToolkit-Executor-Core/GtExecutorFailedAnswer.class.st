Class {
	#name : #GtExecutorFailedAnswer,
	#superclass : #GtExecutorAnswer,
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #testing }
GtExecutorFailedAnswer class >> isAbstract [ 
	^ self name = #GtExecutorFailedAnswer 
]
