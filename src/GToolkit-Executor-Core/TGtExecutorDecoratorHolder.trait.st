Trait {
	#name : #TGtExecutorDecoratorHolder,
	#traits : 'TGtOptions',
	#classTraits : 'TGtOptions classTrait',
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #'as yet unclassified' }
TGtExecutorDecoratorHolder classSide >> commandDecoratorOptionName [
	^ #commandDecorator
]

{ #category : #'accessing - options - decorator' }
TGtExecutorDecoratorHolder >> commandDecorator [
	^ self 
		optionAt: self class commandDecoratorOptionName 
		ifAbsentPut: [ self newCommandDecorator ]
]

{ #category : #'accessing - options - decorator' }
TGtExecutorDecoratorHolder >> decoratingCommand: aCommand [
	self commandDecorator command: aCommand
]

{ #category : #execution }
TGtExecutorDecoratorHolder >> executeCommand: aCommand [
	<return: #GtExecutorAnswer>
	^ self commandDecorator execute: aCommand
]

{ #category : #'instance creation' }
TGtExecutorDecoratorHolder >> newCommandDecorator [
	^ GtExecutorDecorator new
]
