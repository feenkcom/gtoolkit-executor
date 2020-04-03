Trait {
	#name : #TGtExecutorAnswer,
	#traits : 'TGtOptions',
	#classTraits : 'TGtOptions classTrait',
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #accessing }
TGtExecutorAnswer classSide >> commandOptionName [
	^ #command
]

{ #category : #accessing }
TGtExecutorAnswer classSide >> descriptionOptionName [
	^ #description
]

{ #category : #'accessing - options' }
TGtExecutorAnswer >> command [
	<return: #GtExecutorCommand>
	^ self
		optionAt: self class commandOptionName 
		ifAbsent: [ GtExecutorCommand null ]
]

{ #category : #'accessing - options' }
TGtExecutorAnswer >> command: aGtExecutorCommand [
	self 
		assert: [ aGtExecutorCommand isNotNil ] 
		description: [ 'Executor command must be non-nil' ].
	self 
		assert: [ (self hasOptionAt: self class commandOptionName) not ]
		description: [ 'Command can be set only once in each answer' ].
	self 
		optionAt: self class commandOptionName 
		put: aGtExecutorCommand
]

{ #category : #'accessing - options' }
TGtExecutorAnswer >> description [
	<return: #String>
	^ self
		optionAt: self class descriptionOptionName 
		ifAbsent: [ '' ]
]

{ #category : #'accessing - options' }
TGtExecutorAnswer >> description: aString [
	self 
		assert: [ aString isString ] 
		description: [ 'Answer description must be non-nil' ].
	self 
		assert: [ aString isNotEmpty ] 
		description: [ 'Answer description must be non-empty string' ].
	self 
		optionAt: self class descriptionOptionName 
		put: aString
]

{ #category : #testing }
TGtExecutorAnswer >> hasDescription [
	<return: #Boolean>
	^ self 
		optionAt: self class descriptionOptionName 
		ifPresent: [ :aString | true ] 
		ifAbsent: [ false ]
]
