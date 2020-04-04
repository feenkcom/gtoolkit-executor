Class {
	#name : #GtExecutorProtoStatus,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : #'GToolkit-Executor-Core-Execution Statuses'
}

{ #category : #testing }
GtExecutorProtoStatus class >> isAbstract [ 
	^ self name = #GtExecutorProtoStatus 
]
