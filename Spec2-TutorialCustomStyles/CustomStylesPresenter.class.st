Class {
	#name : #CustomStylesPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'text',
		'label',
		'zoomOutButton',
		'textFontButton',
		'codeFontButton',
		'zoomInButton'
	],
	#category : #'Spec2-TutorialCustomStyles'
}

{ #category : #initialization }
CustomStylesPresenter >> connectPresenters [

	zoomInButton action: [ 
		text
			removeStyle: 'smallFontSize';
			addStyle: 'bigFontSize' ].
	zoomOutButton action: [ 
		text
			removeStyle: 'bigFontSize';
			addStyle: 'smallFontSize' ].
	codeFontButton action: [ 
		text
			removeStyle: 'textFont';
			addStyle: 'codeFont' ].
	textFontButton action: [ 
		text
			removeStyle: 'codeFont';
			addStyle: 'textFont' ]
]

{ #category : #layout }
CustomStylesPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: label expand: false;
		add: (SpBoxLayout newLeftToRight
				 add: textFontButton expand: false;
				 add: codeFontButton expand: false;
				 addLast: zoomOutButton expand: false;
				 addLast: zoomInButton expand: false;
				 yourself)
		expand: false;
		add: text;
		yourself
]

{ #category : #initialization }
CustomStylesPresenter >> initializePresenters [

	zoomInButton := self newButton.
	zoomInButton icon: (self iconNamed: #glamorousZoomIn).
	zoomOutButton := self newButton.
	zoomOutButton icon: (self iconNamed: #glamorousZoomOut).

	codeFontButton := self newButton.
	codeFontButton
		icon: (self iconNamed: #smallObject);
		label: 'Code font'.

	textFontButton := self newButton.
	textFontButton
		icon: (self iconNamed: #smallFonts);
		label: 'Text font'.

	text := self newText.
	text
		beNotEditable;
		clearSelection;
		text: String loremIpsum.

	label := self newLabel.
	label label: 'Lorem ipsum'.
	
	self initializeStyles
]

{ #category : #initialization }
CustomStylesPresenter >> initializeStyles [

	label addStyle: 'labelStyle'.
	label addStyle: 'lightGreen'.
	
	text addStyle: 'codeFont'.
	text addStyle: 'smallFont'.
	
	text addStyle: 'bgOpaque'.
	
	zoomInButton addStyle: 'icon'.
	zoomOutButton addStyle: 'icon'.
	
	codeFontButton addStyle: 'buttonStyle'.
	textFontButton addStyle: 'buttonStyle'.
	
	self addStyle: 'container'
]

{ #category : #initialization }
CustomStylesPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Using Styles';
		initialExtent: 600 @ 400
]
