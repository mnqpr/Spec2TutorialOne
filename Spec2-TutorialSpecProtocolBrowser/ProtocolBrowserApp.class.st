Class {
	#name : #ProtocolBrowserApp,
	#superclass : #SpApplication,
	#category : #'Spec2-TutorialSpecProtocolBrowser'
}

{ #category : #running }
ProtocolBrowserApp >> start [

	(ProtocolCodeBrowserPresenter newApplication: self) open
]
