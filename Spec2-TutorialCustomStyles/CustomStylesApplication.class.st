Class {
	#name : #CustomStylesApplication,
	#superclass : #SpApplication,
	#category : #'Spec2-TutorialCustomStyles'
}

{ #category : #running }
CustomStylesApplication >> start [

	(self new: CustomStylesPresenter) open 
]

{ #category : #styling }
CustomStylesApplication >> styleSheet [

	^ SpStyle defaultStyleSheet
	  , (SpStyleVariableSTONReader fromString: '.application [
           Font { #bold: true },
           .lightGreen [ Draw { #color: #B3E6B5 } ],
           .lightBlue [ Draw { #color: #lightBlue } ],
           .container [ Container { #padding: 4, #borderWidth: 2 } ],
           .bgOpaque [ Draw { #backgroundColor: EnvironmentColor(#base) } ],
           .codeFont [ Font { #name: EnvironmentFont(#code) } ],
           .textFont [ Font { #name: EnvironmentFont(#default) } ],
           .bigFontSize [ Font { #size: 20 } ],
           .smallFontSize [ Font { #size: 14 } ],
           .icon [ Geometry { #width: 30 } ],
           .buttonStyle [ Geometry { #width: 110 } ],
           .labelStyle [
             Geometry { #height: 25 },
             Font { #size: 12 }  ]]')
]
