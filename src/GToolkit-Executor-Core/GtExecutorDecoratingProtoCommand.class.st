Class {
	#name : #GtExecutorDecoratingProtoCommand,
	#superclass : #GtExecutorProtoCommand,
	#traits : 'TGtExecutorDecoratingCommand',
	#classTraits : 'TGtExecutorDecoratingCommand classTrait',
	#category : #'GToolkit-Executor-Core-Commands'
}

{ #category : #testing }
GtExecutorDecoratingProtoCommand class >> isAbstract [ 
	^ self name = #GtExecutorDecoratingProtoCommand 
]
