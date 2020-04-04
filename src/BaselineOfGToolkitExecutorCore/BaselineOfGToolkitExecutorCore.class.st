Class {
	#name : #BaselineOfGToolkitExecutorCore,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitExecutorCore
}

{ #category : #baseline }
BaselineOfGToolkitExecutorCore >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'GToolkitAssertionUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility/src' ];
			baseline: 'GToolkitBasicUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility/src' ];
			baseline: 'GToolkitExamplesEngine' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples/src' ];
			package: 'GToolkit-Executor-Core' with: [
				spec requires: #( 'GToolkitAssertionUtility' 'GToolkitBasicUtility' 'GToolkitExamplesEngine' ) ]. 
	].

]
