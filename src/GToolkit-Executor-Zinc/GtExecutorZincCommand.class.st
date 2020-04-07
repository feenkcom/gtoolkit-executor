Class {
	#name : #GtExecutorZincCommand,
	#superclass : #GtExecutorZincProtoCommand,
	#traits : 'TGtExecutorZincConfigurationAccess + (TGtExecutorZincClientAssertions - {#zincClient})',
	#classTraits : 'TGtExecutorZincConfigurationAccess classTrait + TGtExecutorZincClientAssertions classTrait',
	#category : #'GToolkit-Executor-Zinc-Commands'
}

{ #category : #testing }
GtExecutorZincCommand class >> isAbstract [
	^ self name = #GtExecutorZincCommand
]
