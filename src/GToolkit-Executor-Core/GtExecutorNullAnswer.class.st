Class {
	#name : #GtExecutorNullAnswer,
	#superclass : #GtExecutorProtoAnswer,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #testing }
GtExecutorNullAnswer >> hasValue [
	<return: #Boolean>
	^ false
]

{ #category : #testing }
GtExecutorNullAnswer >> isAnswer [
	^ false
]
