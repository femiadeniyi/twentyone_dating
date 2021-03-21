package model

type Option struct {
	Oid  int    `json:"oid"`
	Text string `json:"text"`
}

type Question struct {
	Name    string   `json:"name"`
	Text    string   `json:"text"`
	Options []Option `json:"options,omitempty"`
}

type Person struct {
	Name        string     `json:"name"`
	Gender      string     `json:"gender"`
	Age         int        `json:"age"`
	Personality string     `json:"personality"`
	Questions   []Question `json:"questions,omitempty"`
}

func Questions() []Question {
	return []Question{
		{
			Name: "Peacefulness",
			Text: "Would you date",
			Options: []Option{
				{
					Oid:  1,
					Text: "Wife of a Preacher / Preacher",
				},
				{
					Oid:  0,
					Text: "Wife of a Governor / Governor",
				},
				{
					Oid:  -1,
					Text: "Wife of a Gunman / Gunman",
				},
			},
		},
		{
			Name: "Approachness",
			Text: "You prefer the approach to you",
			Options: []Option{
				{
					Oid:  1,
					Text: "Random compliment / Excuse me miss",
				},
				{
					Oid:  0,
					Text: "Excuse me 'random question' / Random Question",
				},
				{
					Oid:  -1,
					Text: "Eye contact (stare) / Sorry",
				},
			},
		},
		{
			Name: "Handness",
			Text: "You go out and prefer",
			Options: []Option{
				{
					Oid:  1,
					Text: "Hand holding",
				},
				{
					Oid:  0,
					Text: "Arm around shoulder",
				},
				{
					Oid:  -1,
					Text: "None of that",
				},
			},
		},
		{
			Name: "Forgive",
			Text: "The love of your life cheats on you. You",
			Options: []Option{
				{
					Oid:  -1,
					Text: "Divorce",
				},
				{
					Oid:  0,
					Text: "Neither",
				},
				{
					Oid:  1,
					Text: "Forgive",
				},
			},
		},
		{
			Name: "Violence",
			Text: "You discover the person you're dating is the wife of a Gunman / a Gunman. You",
			Options: []Option{
				{
					Oid:  1,
					Text: "Carry on dating",
				},
				{
					Oid:  0,
					Text: "Convince them to leave gun life",
				},
				{
					Oid:  -1,
					Text: "Stop dating",
				},
			},
		},
		{
			Name: "Rich",
			Text: "You discover the person you're dating is the wife of a rich man / a rich man and you're broke. You",
			Options: []Option{
				{
					Oid:  1,
					Text: "Try get money off them",
				},
				{
					Oid:  0,
					Text: "Carry on dating",
				},
				{
					Oid:  -1,
					Text: "Ask why they're into you",
				},
			},
		},
		{
			Name: "Religion Wise",
			Text: "You discover the person you're dating is a religious leader and you're not religious. You",
			Options: []Option{
				{
					Oid:  1,
					Text: "Consider their religion will get in your way",
				},
				{
					Oid:  0,
					Text: "Ask about their religion",
				},
				{
					Oid:  -1,
					Text: "Carry on dating",
				},
			},
		},
		{
			Name: "Outing",
			Text: "You go and a date and you like to",
			Options: []Option{
				{
					Oid:  1,
					Text: "Go somewhere",
				},
				{
					Oid:  0,
					Text: "Sit down and chat",
				},
				{
					Oid:  -1,
					Text: "Go in a group",
				},
			},
		},
		{
			Name: "Money",
			Text: "You become mega rich. You",
			Options: []Option{
				{
					Oid:  -1,
					Text: "Still talk to old friends",
				},
				{
					Oid:  1,
					Text: "Disconnect from them",
				},
			},
		},
		{
			Name: "Reaching Out",
			Text: "You find out someone likes you. You",
			Options: []Option{
				{
					Oid:  1,
					Text: "Reach out",
				},
				{
					Oid:  0,
					Text: "Let them try reach out",
				},
				{
					Oid:  -1,
					Text: "Forget it",
				},
			},
		},
		{
			Name: "Many Many",
			Text: "The person you date had many partners before you. For you",
			Options: []Option{
				{
					Oid:  1,
					Text: "That's ok",
				},
				{
					Oid:  0,
					Text: "You need to ask them about this",
				},
				{
					Oid:  -1,
					Text: "100% unacceptable",
				},
			},
		},
		{
			Name: "Not Social",
			Text: "You're wife / husband is 100% not a social person. For you",
			Options: []Option{
				{
					Oid:  1,
					Text: "That's ok",
				},
				{
					Oid:  0,
					Text: "You need to ask them about this",
				},
				{
					Oid:  -1,
					Text: "100% unacceptable",
				},
			},
		},
		{
			Name: "Clothes",
			Text: "I care what my wife / husband wears. You prefer",
			Options: []Option{
				{
					Oid:  1,
					Text: "Conservative dressing",
				},
				{
					Oid:  0,
					Text: "I trust their judgement",
				},
				{
					Oid:  -1,
					Text: "Show skin",
				},
			},
		},
		{
			Name: "First",
			Text: "You have to be your wife's/husband's no. 1 choice, You prefer",
			Options: []Option{
				{
					Oid:  1,
					Text: "100%",
				},
				{
					Oid:  0,
					Text: "As long as I'm on the priority list",
				},
				{
					Oid:  -1,
					Text: "I don't see things that way",
				},
			},
		},
		{
			Name: "Opposite Sex",
			Text: "You don't like your husband / wife near many people of the opposite sex. You say",
			Options: []Option{
				{
					Oid:  1,
					Text: "100% no",
				},
				{
					Oid:  0,
					Text: "It's ok",
				},
				{
					Oid:  -1,
					Text: "It's normal, can't avoid it",
				},
			},
		},
		{
			Name: "The One",
			Text: "You believe in the one. You say",
			Options: []Option{
				{
					Oid:  1,
					Text: "There is 1 right person and millions of the wrong person",
				},
				{
					Oid:  0,
					Text: "There are a few right people and many wrong people. Need to make a wise choice",
				},
				{
					Oid:  -1,
					Text: "There is no right or wrong person. You make things work together",
				},
			},
		},
		{
			Name: "Different Country",
			Text: "Your wife / husband is from a different country to you. You prefer",
			Options: []Option{
				{
					Oid:  1,
					Text: "Yes",
				},
				{
					Oid:  0,
					Text: "Doesn't matter",
				},
				{
					Oid:  -1,
					Text: "No",
				},
			},
		},
		{
			Name: "Uni",
			Text: "Your can find a wife / husband in uni. You say",
			Options: []Option{
				{
					Oid:  1,
					Text: "It's possible",
				},
				{
					Oid:  0,
					Text: "It's difficult",
				},
				{
					Oid:  -1,
					Text: "Are you crazy?",
				},
			},
		},
		{
			Name: "Cheat",
			Text: "You cheat on your wife / husband. Can you live with yourself? You say",
			Options: []Option{
				{
					Oid:  1,
					Text: "It's not good but yes",
				},
				{
					Oid:  0,
					Text: "I have to tell someone but not them",
				},
				{
					Oid:  -1,
					Text: "I have to tell them",
				},
			},
		},
		{
			Name: "Marriage",
			Text: "Your engaged. No sex before marriage",
			Options: []Option{
				{
					Oid:  1,
					Text: "That's right. No sex before marriage",
				},
				{
					Oid:  0,
					Text: "God forgive me",
				},
				{
					Oid:  -1,
					Text: "This question ain't real",
				},
			},
		},
	}
}
