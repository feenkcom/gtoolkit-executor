Extension { #name : #GtExecutorConfigurations }

{ #category : #'*GToolkit-Executor-Zinc' }
GtExecutorConfigurations >> zinc [
	^ self 
		optionAt: #zinc 
		ifAbsentPut: [ GtExecutorZincConfiguration new ]
]
