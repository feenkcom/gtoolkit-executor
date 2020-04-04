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

{ #category : #execution }
GtExecutorProtoNullCommand >> executeInContext: aGtExecutorExecutionContext [
	<return: #GtExecutorExecutionContext>
	^ GtExecutorExecutionContext skip
]

{ #category : #execution }
GtExecutorProtoNullCommand >> executionStatus [
	<return: #GtExecutorStatus>
	^ GtExecutorStatus null
]

{ #category : #execution }
GtExecutorProtoNullCommand >> executionStatus: aGtExecutorStatus [
	"ignore - it is not executed because of #executeInContext: implementation"
]

{ #category : #testing }
GtExecutorProtoNullCommand >> hasAnswer [
	^ false
]
