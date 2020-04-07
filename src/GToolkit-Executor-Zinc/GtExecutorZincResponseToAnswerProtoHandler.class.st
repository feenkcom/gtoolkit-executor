Class {
	#name : #GtExecutorZincResponseToAnswerProtoHandler,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : #'GToolkit-Executor-Zinc-Answers Builder'
}

{ #category : #factory }
GtExecutorZincResponseToAnswerProtoHandler class >> instanceForResponse: aZnResponse [
	<return: #GtExecutorZincResponseToAnswerHandler>
	^ self subclassResponsibility
]

{ #category : #building }
GtExecutorZincResponseToAnswerProtoHandler >> build [
	<return: #ZnExecutorAnswer>
	^ self subclassResponsibility
]
