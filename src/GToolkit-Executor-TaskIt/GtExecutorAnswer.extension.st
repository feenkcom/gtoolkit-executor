Extension { #name : #GtExecutorAnswer }

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorAnswer class >> taskIt: aFutureAdaptor [
	^ GtExecutorTaskItAnswer new futureAdaptor: aFutureAdaptor
]
