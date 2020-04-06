Class {
	#name : #GtExecutorZincCommand,
	#superclass : #GtExecutorZincProtoCommand,
	#traits : 'TExecutorZincConfigurationAccess',
	#classTraits : 'TExecutorZincConfigurationAccess classTrait',
	#category : #'GToolkit-Executor-Zinc-Commands'
}

{ #category : #testing }
GtExecutorZincCommand class >> isAbstract [
	^ self name = #GtExecutorZincCommand
]
