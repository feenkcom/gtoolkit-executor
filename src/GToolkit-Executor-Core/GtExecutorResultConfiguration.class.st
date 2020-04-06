Class {
	#name : #GtExecutorResultConfiguration,
	#superclass : #GtExecutorConfiguration,
	#category : #'GToolkit-Executor-Core-Configurations'
}

{ #category : #accessing }
GtExecutorResultConfiguration class >> hasValueOptionName [
	^ #hasValue
]

{ #category : #accessing }
GtExecutorResultConfiguration class >> valueOptionName [
	^ #value
]

{ #category : #status }
GtExecutorResultConfiguration >> beWithValue [
	self 
		optionAt: self class hasValueOptionName 
		put: true.
]

{ #category : #testing }
GtExecutorResultConfiguration >> hasValue [
	self 
		optionAt: self class hasValueOptionName 
		ifAbsent: [ false ].
]

{ #category : #accessing }
GtExecutorResultConfiguration >> name [
	<return: #String>
	^ 'Result'
]

{ #category : #accessing }
GtExecutorResultConfiguration >> value [
	self
		optionAt: self class valueOptionName
		ifAbsent:
			[ self signalMissingValueOfName: 'Result' ]
]

{ #category : #accessing }
GtExecutorResultConfiguration >> value: aValue [
	self 
		optionAt: self class valueOptionName 
		put: aValue.
	self beWithValue.
]
