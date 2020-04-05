Class {
	#name : #GtExecutorConfigurations,
	#superclass : #GtExecutorProtoConfigurations,
	#traits : 'TGtOptions',
	#classTraits : 'TGtOptions classTrait',
	#instVars : [
		'options'
	],
	#category : #'GToolkit-Executor-Core-Configurations'
}

{ #category : #factory }
GtExecutorConfigurations class >> default [
	^ self new
]

{ #category : #factory }
GtExecutorConfigurations class >> null [ 
	^ GtExecutorNullConfigurations default
]

{ #category : #accessing }
GtExecutorConfigurations >> common [
	^ self 
		optionAt: #common 
		ifAbsentPut: [ GtExecutorCommonConfiguration new ]
]

{ #category : #testing }
GtExecutorConfigurations >> isConfigurations [
	^ true
]
