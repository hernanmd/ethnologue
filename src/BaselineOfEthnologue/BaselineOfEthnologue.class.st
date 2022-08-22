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
				preLoadDoIt: #preLoad;
				package: 'Ethnologue';
				package: 'Ethnologue-Tests'	with: [ spec requires: #(Ethnologue) ].
			spec 
				group: 'Core' 						with: #('Ethnologue');
				group: 'Tests' 						with: #('Ethnologue' 'Ethnologue-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]

{ #category : #private }
BaselineOfEthnologue >> ensureMetacelloFileDownload [

	EpMonitor disableDuring: [
		Metacello new
			baseline: 'MetacelloFileDownload';
			onWarningLog;
			repository: 'github://hernanmd/MetacelloFileDownload';
			load ]
]

{ #category : #private }
BaselineOfEthnologue >> platformFilesUrl [

	^ Array with: 'https://github.com/hernanmd/resources/raw/main/Language_Code_Data_20220221.zip'
]

{ #category : #private }
BaselineOfEthnologue >> preLoad [

    self ensureMetacelloFileDownload.
    super preLoad.
]
