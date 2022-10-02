Class {
	#name : #WindowExamplePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'button1',
		'button2'
	],
	#category : #'Spec2-TutorialWindowExample'
}

{ #category : #layout }
WindowExamplePresenter >> defaultLayout [
	
	^ SpBoxLayout newLeftToRight
		add: button1;
		add: button2;
		yourself
]

{ #category : #initialization }
WindowExamplePresenter >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.
	
	button1 label: '+'.
	button2 label: '-'.
	
	button1 action: [ self window extent: 500 @ 200 ].
	button2 action: [ self window extent: 200 @ 100 ]
	
]

{ #category : #initialization }
WindowExamplePresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Example Window';
		whenClosedDo: [ UIManager default inform: 'When closed' ];
		whenOpenedDo: [ UIManager default inform: 'When open' ];
		initialExtent: 90 @ 90";
		windowIcon: self taskbarIcon"
]

{ #category : #private }
WindowExamplePresenter >> okToChange [

	^ self hasWindow
		ifTrue: [ false ]
		ifFalse: [ true ]
]

{ #category : #icons }
WindowExamplePresenter >> taskbarIcon [

	^ Smalltalk ui icons iconNamed: #thumbsUp
]
