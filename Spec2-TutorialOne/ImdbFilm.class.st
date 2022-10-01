Class {
	#name : #ImdbFilm,
	#superclass : #Object,
	#instVars : [
		'name',
		'year',
		'director'
	],
	#classInstVars : [
		'films'
	],
	#category : #'Spec2-TutorialOne'
}

{ #category : #'testing - support' }
ImdbFilm class >> ET [

	^ self new
		name: 'E.T.';
		director: 'Steven Spielberg';
		year: '1982';
		yourself
]

{ #category : #adding }
ImdbFilm class >> addET [

	films add: self ET
]

{ #category : #accessing }
ImdbFilm class >> addFilm: aFilm [

	films add: aFilm
]

{ #category : #accessing }
ImdbFilm class >> films [

	^ films ifNil: [ films := OrderedCollection new ]
]

{ #category : #'class initialization' }
ImdbFilm class >> reset [

	films := OrderedCollection new
]

{ #category : #accessing }
ImdbFilm >> director [
	^ director
]

{ #category : #accessing }
ImdbFilm >> director: aDirector [ 
	director := aDirector
]

{ #category : #accessing }
ImdbFilm >> name [
	^ name
]

{ #category : #accessing }
ImdbFilm >> name: aName [ 
	name := aName
]

{ #category : #accessing }
ImdbFilm >> year [
	^ year
]

{ #category : #accessing }
ImdbFilm >> year: aYear [ 
	year := aYear
]
