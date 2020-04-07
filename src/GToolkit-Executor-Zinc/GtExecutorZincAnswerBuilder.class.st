Class {
	#name : #GtExecutorZincAnswerBuilder,
	#superclass : #GtExecutorZincProtoAnswerBuilder,
	#traits : 'TGtExecutorZincResponseAccess',
	#classTraits : 'TGtExecutorZincResponseAccess classTrait',
	#category : #'GToolkit-Executor-Zinc-Answers Builder'
}

{ #category : #building }
GtExecutorZincAnswerBuilder >> build [
	<return: #ZnExecutorAnswer>
	| aHandler |
	aHandler := self rootHandlerClass instanceForResponse: self response.
	^ aHandler build
]

{ #category : #accessing }
GtExecutorZincAnswerBuilder >> rootHandlerClass [
	^ GtExecutorZincResponseToAnswerHandler
]
