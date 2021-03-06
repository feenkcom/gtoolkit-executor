Class {
	#name : #GtExecutorExecutionContinueContext,
	#superclass : #GtExecutorExecutionContext,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #executing }
GtExecutorExecutionContinueContext >> execute: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self handler run: aCommand
]
