Class {
	#name : #GtExecutorPostExecutionCommand,
	#superclass : #GtExecutorDecoratingCommand,
	#instVars : [
		'valuable'
	],
	#category : #'GToolkit-Executor-Core-Examples'
}

{ #category : #defaults }
GtExecutorPostExecutionCommand >> defaultValuable [
	^ [ :aCommand | "do nothing" ]
]

{ #category : #execution }
GtExecutorPostExecutionCommand >> execute [
	self executeSubCommand.
	self valuable value: self command.
	self answer: (GtExecutorAnswer noValueWithSuccess)
]

{ #category : #initialization }
GtExecutorPostExecutionCommand >> initialize [
	super initialize.
	valuable := self defaultValuable.
]

{ #category : #printing }
GtExecutorPostExecutionCommand >> printOn: aStream [
	aStream
		nextPutAll: 'Post execution of ';
		print: self valuable
]

{ #category : #accessing }
GtExecutorPostExecutionCommand >> result: aValue [
	self command result: aValue
]

{ #category : #accessing }
GtExecutorPostExecutionCommand >> valuable [
	^ valuable
]

{ #category : #accessing }
GtExecutorPostExecutionCommand >> valuable: anObject [
	valuable := anObject
]
