Class {
	#name : #GtExecutorProtoNullCommand,
	#superclass : #GtExecutorProtoCommand,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Executor-Core-Commands'
}

{ #category : #testing }
GtExecutorProtoNullCommand class >> isAbstract [
	^ self name = #GtExecutorProtoNullCommand 
]

{ #category : #testing }
GtExecutorProtoNullCommand >> hasAnswer [
	^ false
]
