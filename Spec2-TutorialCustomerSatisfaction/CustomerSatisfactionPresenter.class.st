Class {
	#name : #CustomerSatisfactionPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'buttonHappy',
		'buttonNeutral',
		'buttonBad',
		'screen'
	],
	#category : #'Spec2-TutorialCustomerSatisfaction'
}

{ #category : #initialization }
CustomerSatisfactionPresenter >> connectPresenters [

	buttonHappy action: [ screen label: buttonHappy label ].
	buttonNeutral action: [ screen label: buttonNeutral label ].
	buttonBad action: [ screen label: buttonBad label ]
]

{ #category : #layout }
CustomerSatisfactionPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: buttonHappy;
				   add: buttonNeutral;
				   add: buttonBad;
				   yourself);
		  add: screen;
		  yourself
]

{ #category : #initialization }
CustomerSatisfactionPresenter >> initializePresenters [

	screen := self newLabel.
	buttonHappy := self newButton.
	buttonNeutral := self newButton.
	buttonBad := self newButton.
	
	screen label: 'Please give us your feedback.'.
	buttonHappy 
		label: 'Happy';
		icon: (self iconNamed: #thumbsUp).
	buttonNeutral
		label: 'Neutral';
		icon: (self iconNamed: #user).
	buttonBad 
		label: 'Bad';
		icon: (self iconNamed: #thumbsDown).
		
	self focusOrder
		add: buttonHappy;
		add: buttonNeutral;
		add: buttonBad
]

{ #category : #initialization }
CustomerSatisfactionPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Customer Satisfaction Survey';
		initialExtent: 400 @ 100
]
