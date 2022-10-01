Class {
	#name : #ImdbConfiguration,
	#superclass : #SpMorphicConfiguration,
	#category : #'Spec2-TutorialOne'
}

{ #category : #styles }
ImdbConfiguration >> customStyleSheet [

	^ SpStyleVariableSTONReader fromString:
		 '.application [ .xxx [ Draw { #color: #red, #backgroundColor: #green } ] ]'
]

{ #category : #'private - factory' }
ImdbConfiguration >> newStyleSheet [
	
	^ SpStyle defaultStyleSheet copy, self customStyleSheet
]
