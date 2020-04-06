Class {
	#name : #GtExecutorZincProtoAnswerBuilder,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : #'GToolkit-Executor-Zinc-Answers Builder'
}

{ #category : #building }
GtExecutorZincProtoAnswerBuilder >> build [
	<return: #ZnExecutorAnswer>
	^ self subclassResponsibility
]
