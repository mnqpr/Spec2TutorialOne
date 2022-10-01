Class {
	#name : #ImdbFilmPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'nameText',
		'directorText',
		'yearNumber',
		'nameLabel'
	],
	#category : #'Spec2-TutorialOne'
}

{ #category : #transmission }
ImdbFilmPresenter >> defaultInputPort [

	^ self inputModelPort
]

{ #category : #layout }
ImdbFilmPresenter >> defaultLayout [

	^ SpGridLayout build: [ :builder | 
		  builder
			  beColumnNotHomogeneous;
			  column: 2 withConstraints: #beExpand;
			  add: nameLabel;
			  add: nameText;
			  nextRow;
			  add: 'Director';
			  add: directorText;
			  nextRow;
			  add: 'Year';
			  add: yearNumber ]
]

{ #category : #accessing }
ImdbFilmPresenter >> director [

	^ directorText text
]

{ #category : #initialization }
ImdbFilmPresenter >> initializeDialogWindow: aDialogPresenter [

	aDialogPresenter
		addButton: 'Cancel' do: [ :presenter | presenter close ];
		addButton: 'Save Film' do: [ :presenter | 
			presenter
				beOk;
				close ]
]

{ #category : #initialization }
ImdbFilmPresenter >> initializePresenters [

	nameLabel := self newLabel
		             label: 'Name';
		             addStyle: 'xxx';
		             yourself.
	nameText := self newTextInput.
	directorText := self newTextInput.
	yearNumber := self newNumberInput
		              rangeMinimum: 1900 maximum: Year current year;
		              yourself
]

{ #category : #initialization }
ImdbFilmPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Film';
		initialExtent: 400 @ 250
]

{ #category : #transmission }
ImdbFilmPresenter >> inputModelPort [

	^ SpModelPort newPresenter: self
]

{ #category : #accessing }
ImdbFilmPresenter >> name [

	^ nameText text
]

{ #category : #'accessing - model' }
ImdbFilmPresenter >> setModel: aFilm [

	nameText text: (aFilm ifNotNil: [ aFilm name ]).
	directorText text: (aFilm ifNotNil: [ aFilm director ]).
	yearNumber text: (aFilm ifNotNil: [ aFilm year ])
]

{ #category : #accessing }
ImdbFilmPresenter >> yearNumber [

	^ yearNumber text
]
