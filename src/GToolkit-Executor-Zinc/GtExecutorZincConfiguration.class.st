Class {
	#name : #GtExecutorZincConfiguration,
	#superclass : #GtExecutorConfiguration,
	#category : #'GToolkit-Executor-Zinc-Configurations'
}

{ #category : #accessing }
GtExecutorZincConfiguration class >> clientOptionName [
	^ #client
]

{ #category : #accessing }
GtExecutorZincConfiguration class >> responseOptionName [
	^ #response
]

{ #category : #accessing }
GtExecutorZincConfiguration >> client [
	<return: #ZnClient>
	^ self 
		optionAt: self class clientOptionName
		ifAbsentPut: [ ZnClient new ]
]

{ #category : #accessing }
GtExecutorZincConfiguration >> hasResponse [
	<return: #Boolean>
	^ self hasOptionAt: self class responseOptionName
]

{ #category : #accessing }
GtExecutorZincConfiguration >> name [
	^ 'Common'
]

{ #category : #accessing }
GtExecutorZincConfiguration >> response [
	<return: #ZnResponse>
	^ self 
		optionAt: self class responseOptionName
		ifAbsent: [ self signalMissingValueOfName: 'Zinc response' ]
]

{ #category : #accessing }
GtExecutorZincConfiguration >> response: aZnResponse [
	self 
		assert: [ aZnResponse isNotNil ]
		description: [ 'Zinc response must be non-nil' ].
	self assertOptionDoesNotExist: self class responseOptionName.
	^ self 
		optionAt: self class responseOptionName
		put: aZnResponse
]
