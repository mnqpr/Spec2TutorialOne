Class {
	#name : #ProtocolCodeBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'text',
		'viewer'
	],
	#category : #'Spec2-TutorialSpecProtocolBrowser'
}

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> connectPresenters [

	viewer whenClassChangedDo: [ :class | text behavior: class ].
	viewer whenAPIChangedDo: [ :item | 
		item ifNotNil: [ 
			item selectedItem ifNotNil: [ 
				text text: item selectedItem sourceCode ] ] ].
	viewer whenEventChangedDo: [ :item | 
		item ifNotNil: [ 
			item selectedItem ifNotNil: [ 
				text text: item selectedItem sourceCode ] ] ]
]

{ #category : #layout }
ProtocolCodeBrowserPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: viewer;
		  add: text;
		  spacing: 3;
		  yourself
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> initializePresenters [

	text := self instantiate: SpCodePresenter.
	viewer := self instantiate: ProtocolViewerPresenter.
	text withSyntaxHighlight.
	self focusOrder 
		add: viewer;
		add: text.
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Spec Protocol Browser';
	initialExtent: 900 @ 800
]
