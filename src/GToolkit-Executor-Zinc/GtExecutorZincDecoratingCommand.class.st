Class {
	#name : #GtExecutorZincDecoratingCommand,
	#superclass : #GtExecutorZincDecoratingProtoCommand,
	#traits : 'TGtExecutorZincConfigurationAccess + (TGtExecutorZincClientAssertions - {#zincClient})',
	#classTraits : 'TGtExecutorZincConfigurationAccess classTrait + TGtExecutorZincClientAssertions classTrait',
	#category : #'GToolkit-Executor-Zinc-Commands'
}

{ #category : #testing }
GtExecutorZincDecoratingCommand class >> isAbstract [
	^ self name = #GtExecutorZincDecoratingCommand
]
