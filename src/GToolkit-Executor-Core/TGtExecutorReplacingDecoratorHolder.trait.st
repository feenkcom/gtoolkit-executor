Trait {
	#name : #TGtExecutorReplacingDecoratorHolder,
	#traits : 'TGtExecutorDecoratorHolder - {#newCommandDecorator}',
	#classTraits : 'TGtExecutorDecoratorHolder classTrait',
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #'instance creation' }
TGtExecutorReplacingDecoratorHolder >> newCommandDecorator [
	^ GtExecutorReplacingDecorator new
]

{ #category : #'accessing - options - decorator' }
TGtExecutorReplacingDecoratorHolder >> replacingCommand: aCommand [
	self commandDecorator replace: aCommand
]
