Class {
	#name : #GtExecutorProtoCommand,
	#superclass : #Object,
	#traits : 'TGtAssert + TGtExecutorCommand',
	#classTraits : 'TGtAssert classTrait + TGtExecutorCommand classTrait',
	#category : #'GToolkit-Executor-Core-Commands'
}

{ #category : #testing }
GtExecutorProtoCommand class >> isAbstract [
	^ self name = #GtExecutorProtoCommand 
]

{ #category : #execution }
GtExecutorProtoCommand >> execute [
	"Perform a command task"
	self subclassResponsibility
]
