Extension { #name : #TGtExecutorProtoCommand }

{ #category : #'*GToolkit-Executor-TaskIt' }
TGtExecutorProtoCommand >> asBlTktCommand [
	^ BlTktWrapperCommand new command: self
]
