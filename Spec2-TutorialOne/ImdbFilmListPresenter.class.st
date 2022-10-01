Class {
	#name : #ImdbFilmListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'filmList',
		'detail'
	],
	#category : #'Spec2-TutorialOne'
}

{ #category : #adding }
ImdbFilmListPresenter >> addFilm [

	| dialog windowPresenter |
	dialog := ImdbFilmPresenter newApplication: self application.
	windowPresenter := dialog openModal.
	windowPresenter isOk ifFalse: [ ^ self ].
	ImdbFilm addFilm: (ImdbFilm new
			 name: dialog name;
			 director: dialog director;
			 year: dialog yearNumber).
	self updatePresenter
]

{ #category : #'testing - support' }
ImdbFilmListPresenter >> clickFilmAtIndex: anIndex [

	filmList clickAtIndex: anIndex
]

{ #category : #initialization }
ImdbFilmListPresenter >> connectPresenters [

	filmList transmitTo: detail
]

{ #category : #layout }
ImdbFilmListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: filmList;
		  add: detail;
		  yourself
]

{ #category : #'testing - support' }
ImdbFilmListPresenter >> detail [

	^ detail
]

{ #category : #'testing - support' }
ImdbFilmListPresenter >> filmList [

	^ filmList
]

{ #category : #initialization }
ImdbFilmListPresenter >> initializePresenters [

	filmList := self newTable
		            addColumn:
			            (SpStringTableColumn title: 'Name' evaluated: #name);
		            addColumn:
			            (SpStringTableColumn
				             title: 'Director'
				             evaluated: #director);
		            addColumn:
			            (SpStringTableColumn title: 'Year' evaluated: #year);
		            yourself.

	detail := self instantiate: ImdbFilmPresenter.
	detail enabled: false.
]

{ #category : #initialization }
ImdbFilmListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Mini IMDB';
		initialExtent: 600 @ 400;
		toolbar: (self newToolbar
				 add: (self newToolbarButton
						  label: 'Add film';
						  action: [ self addFilm ];
						  icon: (self iconNamed: #smallAdd);
						  yourself);
				 yourself)
]

{ #category : #layouts }
ImdbFilmListPresenter >> listAboveLayout [

	^ SpBoxLayout newTopToBottom
		add: detail;
		add: filmList;
		yourself
]

{ #category : #layouts }
ImdbFilmListPresenter >> listOnlyLayout [

	^ SpBoxLayout newTopToBottom
		add: filmList;
		yourself
]

{ #category : #initialization }
ImdbFilmListPresenter >> updatePresenter [

	filmList items: ImdbFilm films
]
