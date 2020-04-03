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

{ #category : #accessing }
GtExecutorProtoNullCommand >> answer [
	^ GtExecutorAnswer null
]

{ #category : #testing }
GtExecutorProtoNullCommand >> hasAnswer [
	^ false
]
