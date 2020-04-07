Class {
	#name : #GtExecutorZincDecoratingProtoCommand,
	#superclass : #GtExecutorDecoratingCommand,
	#category : #'GToolkit-Executor-Zinc-Commands'
}

{ #category : #testing }
GtExecutorZincDecoratingProtoCommand class >> isAbstract [ 
	^ self name = #GtExecutorZincDecoratingProtoCommand 
]
