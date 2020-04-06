Class {
	#name : #GtExecutorZincDecoratingCommand,
	#superclass : #GtExecutorZincDecoratingProtoCommand,
	#traits : 'TExecutorZincConfigurationAccess',
	#classTraits : 'TExecutorZincConfigurationAccess classTrait',
	#category : #'GToolkit-Executor-Zinc-Commands'
}

{ #category : #testing }
GtExecutorZincDecoratingCommand class >> isAbstract [
	^ self name = #GtExecutorZincDecoratingCommand
]
