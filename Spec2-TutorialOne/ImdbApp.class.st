Class {
	#name : #ImdbApp,
	#superclass : #SpApplication,
	#category : #'Spec2-TutorialOne'
}

{ #category : #initialization }
ImdbApp >> initialize [

	super initialize.
	self
		useBackend: #Morphic
		with: ImdbConfiguration new.
]
