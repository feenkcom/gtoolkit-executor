Class {
	#name : #GtExecutorNullFutureAdaptor,
	#superclass : #GtExecutorProtoTaskItFutureAdaptor,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Executor-TaskIt-Adaptors'
}

{ #category : #testing }
GtExecutorNullFutureAdaptor >> isFuture [
	^ false
]

{ #category : #subscriptions }
GtExecutorNullFutureAdaptor >> onFailureDo: aCallback [
	"do nothing"
]

{ #category : #subscriptions }
GtExecutorNullFutureAdaptor >> onSuccessDo: aCallback [
	"do nothing"
]
