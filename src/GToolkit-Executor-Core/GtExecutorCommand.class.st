Class {
	#name : #GtExecutorCommand,
	#superclass : #GtExecutorProtoCommand,
	#traits : 'TGtExecutorCommand',
	#classTraits : 'TGtExecutorCommand classTrait',
	#category : #'GToolkit-Executor-Core-Commands'
}

{ #category : #testing }
GtExecutorCommand class >> isAbstract [
	^ self name = #GtExecutorCommand 
]

{ #category : #factory }
GtExecutorCommand class >> null [
	^ GtExecutorNullCommand default
]
