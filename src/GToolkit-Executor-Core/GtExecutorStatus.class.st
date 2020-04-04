Class {
	#name : #GtExecutorStatus,
	#superclass : #GtExecutorProtoStatus,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Executor-Core-Execution Statuses'
}

{ #category : #factory }
GtExecutorStatus class >> exception [
	^ GtExecutorExceptionStatus default
]

{ #category : #factory }
GtExecutorStatus class >> executing [
	^ GtExecutorExecutingStatus default
]

{ #category : #factory }
GtExecutorStatus class >> finished [
	^ GtExecutorFinishedStatus default
]

{ #category : #testing }
GtExecutorStatus class >> isAbstract [ 
	^ self name = #GtExecutorStatus 
]

{ #category : #factory }
GtExecutorStatus class >> notExecuted [
	^ GtExecutorNotExecutedStatus default
]

{ #category : #factory }
GtExecutorStatus class >> null [
	^ self notExecuted
]
