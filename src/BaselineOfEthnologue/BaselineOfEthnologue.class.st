Class {
	#name : #BaselineOfEthnologue,
	#superclass : #BaselineOf,
	#category : #BaselineOfEthnologue
}

{ #category : #baselines }
BaselineOfEthnologue >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				package: 'Ethnologue';
				package: 'Ethnologue-Tests'	with: [ spec requires: #(Ethnologue) ].
			spec 
				group: 'Core' 						with: #('Ethnologue');
				group: 'Tests' 						with: #('Ethnologue' 'Ethnologue-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
