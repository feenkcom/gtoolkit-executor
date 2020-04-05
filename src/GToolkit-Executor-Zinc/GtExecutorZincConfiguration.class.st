Class {
	#name : #GtExecutorZincConfiguration,
	#superclass : #GtExecutorConfiguration,
	#category : #'GToolkit-Executor-Zinc-Configurations'
}

{ #category : #accessing }
GtExecutorZincConfiguration >> client [
	<return: #ZnClient>
	^ self 
		optionAt: #client 
		ifAbsentPut: [ ZnClient new ]
]

{ #category : #accessing }
GtExecutorZincConfiguration >> name [
	^ 'Common'
]
