Scriptname _JQ_BorrowBooksScript extends Quest  

FormList Property RecommendedBooksList Auto
ReferenceAlias Property BorrowedBook Auto
ReferenceAlias Property PlayerRef Auto
GlobalVariable Property PlayerLoanedBook Auto
ObjectReference Property BookContainer Auto

Function OpenBookChest(Actor akActivator)
	BookContainer.Activate(akActivator)
EndFunction

Function AddQuestItem(ReferenceAlias BookToBorrow)
	Debug.Notification(BookToBorrow.GetName())

	BorrowedBook.ForceRefTo(BookToBorrow.GetReference())

	Actor Player = PlayerRef.GetActorReference()
	Player.AddItem(BookToBorrow.GetReference(), 1)
EndFunction

Function RemoveQuestItem()
	Actor Player = PlayerRef.GetActorReference()
	Player.RemoveItem(BorrowedBook.GetReference(), 1)
	SetStage(100)
EndFunction