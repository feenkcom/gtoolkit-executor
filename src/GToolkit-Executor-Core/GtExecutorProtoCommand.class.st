Class {
	#name : #GtExecutorProtoCommand,
	#superclass : #Object,
	#traits : 'TGtAssert + TGtExecutorProtoCommand',
	#classTraits : 'TGtAssert classTrait + TGtExecutorProtoCommand classTrait',
	#category : #'GToolkit-Executor-Core-Commands'
}

{ #category : #testing }
GtExecutorProtoCommand class >> isAbstract [
	^ self name = #GtExecutorProtoCommand 
]

{ #category : #accessing }
GtExecutorProtoCommand >> answer [
	<return: #GtExecutorAnswer>
	^ self subclassResponsibility
]

{ #category : #execution }
GtExecutorProtoCommand >> execute [
	"Perform a command task"
	self subclassResponsibility
]

{ #category : #execution }
GtExecutorProtoCommand >> executeInContext: aGtExecutorExecutionContext [
	<return: #GtExecutorExecutionContext>
	^ self subclassResponsibility
]

{ #category : #execution }
GtExecutorProtoCommand >> executionStatus [
	<return: #GtExecutorStatus>
	^ self subclassResponsibility
]

{ #category : #execution }
GtExecutorProtoCommand >> executionStatus: aGtExecutorStatus [
	^ self subclassResponsibility
]

{ #category : #testing }
GtExecutorProtoCommand >> hasAnswer [
	<return: #Boolean>
	^ self subclassResponsibility
]
