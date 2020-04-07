Class {
	#name : #GtExecutorZincNotFoundHandler,
	#superclass : #GtExecutorZincResponseToAnswerHandler,
	#category : #'GToolkit-Executor-Zinc-Answers Builder'
}

{ #category : #testing }
GtExecutorZincNotFoundHandler class >> handlesResponse: aZnResponse [
	<return: #Boolean>
	^ aZnResponse isNotFound
]

{ #category : #building }
GtExecutorZincNotFoundHandler >> build [
	<return: #GtExecutorAnswer>
	^ GtExecutorZincFailureAnswer notFound: self response 
]
