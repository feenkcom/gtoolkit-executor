Extension { #name : #GtExecutorAnswer }

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorAnswer class >> taskIt: aFuture [
	^ GtExecutorTaskItAnswer new futureAdaptor: aFuture
]
