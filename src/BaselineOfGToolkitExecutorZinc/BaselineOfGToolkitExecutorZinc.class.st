Class {
	#name : #BaselineOfGToolkitExecutorZinc,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitExecutorZinc
}

{ #category : #baseline }
BaselineOfGToolkitExecutorZinc >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'GToolkitExecutorCore' with: [
				spec repository: 'github://feenkcom/gtoolkit-executor/src' ];
			package: 'GToolkit-Executor-Zinc' with: [
				spec requires: #( 'GToolkitExecutorCore' ) ]. 
	].

]
