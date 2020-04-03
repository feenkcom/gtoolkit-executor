Class {
	#name : #GtExecutorProtoAnswer,
	#superclass : #Object,
	#traits : 'TGtAssert + TGtExecutorProtoAnswer',
	#classTraits : 'TGtAssert classTrait + TGtExecutorProtoAnswer classTrait',
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #testing }
GtExecutorProtoAnswer >> hasValue [
	<return: #Boolean>
	^ self subclassResponsibility
]

{ #category : #testing }
GtExecutorProtoAnswer >> isAnswer [
	<return: #Boolean>
	^ self subclassResponsibility
]
