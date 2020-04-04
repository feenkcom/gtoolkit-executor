Class {
	#name : #GtExecutorTaskItFuture,
	#superclass : #GtExecutorProtoFuture,
	#instVars : [
		'future'
	],
	#category : #'GToolkit-Executor-TaskIt-Helpers'
}

{ #category : #factory }
GtExecutorTaskItFuture class >> null [
	^ GtExecutorNullFuture default
]

{ #category : #accessing }
GtExecutorTaskItFuture >> future [
	<return: #TKTFuture>
	^ future
]

{ #category : #accessing }
GtExecutorTaskItFuture >> future: aTKTFuture [
	self 
		assert: [ aTKTFuture isNotNil ] 
		description: [ 'TaskIt Future must be non-nil' ].
	future := aTKTFuture.
]
