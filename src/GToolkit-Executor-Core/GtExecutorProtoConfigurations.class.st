Class {
	#name : #GtExecutorProtoConfigurations,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : #'GToolkit-Executor-Core-Configurations'
}

{ #category : #testing }
GtExecutorProtoConfigurations >> isConfigurations [
	<return: #Boolean>
	^ self subclassResponsibility
]
