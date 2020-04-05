Class {
	#name : #GtExecutorProtoConfiguration,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : #'GToolkit-Executor-Core-Configurations'
}

{ #category : #testing }
GtExecutorProtoConfiguration class >> isAbstract [
	^ self name = #GtExecutorProtoConfiguration 
]
