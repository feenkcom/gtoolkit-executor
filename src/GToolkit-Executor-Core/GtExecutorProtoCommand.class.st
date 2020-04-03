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

{ #category : #testing }
GtExecutorProtoCommand >> hasAnswer [
	<return: #Boolean>
	^ self subclassResponsibility
]
