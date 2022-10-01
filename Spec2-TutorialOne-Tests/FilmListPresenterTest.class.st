Class {
	#name : #FilmListPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter'
	],
	#category : #'Spec2-TutorialOne-Tests'
}

{ #category : #running }
FilmListPresenterTest >> setUp [
	super setUp.
	
	ImdbFilm reset.
	ImdbFilm addET
]

{ #category : #running }
FilmListPresenterTest >> tearDown [

	presenter ifNotNil: [ presenter delete ].
	super tearDown
]

{ #category : #tests }
FilmListPresenterTest >> testListIsSimpleSelection [

	presenter := ImdbFilmListPresenter new.
	
	presenter open.
	
	self deny: presenter filmList isMultipleSelection
]

{ #category : #tests }
FilmListPresenterTest >> testWhenSelectingOneFilmAndClickOnEmpty [

	| name |
	presenter := ImdbFilmListPresenter new.
	presenter open.
	
	presenter clickFilmAtIndex: 1.
	
	name := presenter detail name.
	self deny: name isEmpty.
	self assert: presenter filmList listSize equals: 1.
	
	presenter clickFilmAtIndex: 2.
	self assert: presenter detail name equals: name
]

{ #category : #tests }
FilmListPresenterTest >> testWhenSelectingOneFilmThenDetailIsUpdated [

	| detail |
	presenter := ImdbFilmListPresenter new.
	presenter open.
	detail := presenter detail.
	self assert: detail name isEmpty.
	
	presenter clickFilmAtIndex: 1.
	
	self deny: detail name isEmpty.
]
