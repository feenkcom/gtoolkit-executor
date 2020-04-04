Class {
	#name : #BaselineOfGToolkitExecutor,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitExecutor
}

{ #category : #baseline }
BaselineOfGToolkitExecutor >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'GToolkitExecutorUI' with: [
				spec repository: 'github://feenkcom/gtoolkit-executor/src' ]
	].
]
