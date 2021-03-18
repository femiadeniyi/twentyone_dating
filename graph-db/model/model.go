package model

type Option struct {
	Oid  int    `json:"oid"`
	Name string `json:"name"`
}

type Question struct {
	Name   string   `json:"name"`
	Value  string   `json:"value"`
	Option []Option `json:"option,omitempty"`
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
			Name:  "Peacefulness",
			Value: "Would you date",
			Option: []Option{
				{
					Oid:  1,
					Name: "Wife of a Preacher / Preacher",
				},
				{
					Oid:  0,
					Name: "Wife of a Governor / Governor",
				},
				{
					Oid:  -1,
					Name: "Wife of a Gunman / Gunman",
				},
			},
		},
		{
			Name:  "Approachness",
			Value: "You prefer the approach to you",
			Option: []Option{
				{
					Oid:  1,
					Name: "Random compliment / Excuse me miss",
				},
				{
					Oid:  0,
					Name: "Excuse me 'random question' / Random Question",
				},
				{
					Oid:  -1,
					Name: "Eye contact (stare) / Sorry",
				},
			},
		},
		{
			Name:  "Handness",
			Value: "You go out and prefer",
			Option: []Option{
				{
					Oid:  1,
					Name: "Hand holding",
				},
				{
					Oid:  0,
					Name: "Arm around shoulder",
				},
				{
					Oid:  -1,
					Name: "None of that",
				},
			},
		},
		{
			Name:  "Forgive",
			Value: "The love of your life cheats on you. You",
			Option: []Option{
				{
					Oid:  -1,
					Name: "Divorce",
				},
				{
					Oid:  0,
					Name: "Neither",
				},
				{
					Oid:  1,
					Name: "Forgive",
				},
			},
		},
		{
			Name:  "Violence",
			Value: "You discover the person you're dating is the wife of a Gunman / a Gunman. You",
			Option: []Option{
				{
					Oid:  1,
					Name: "Carry on dating",
				},
				{
					Oid:  0,
					Name: "Convince them to leave gun life",
				},
				{
					Oid:  -1,
					Name: "Stop dating",
				},
			},
		},
		{
			Name:  "Rich",
			Value: "You discover the person you're dating is the wife of a rich man / a rich man and you're broke. You",
			Option: []Option{
				{
					Oid:  1,
					Name: "Try get money off them",
				},
				{
					Oid:  0,
					Name: "Carry on dating",
				},
				{
					Oid:  -1,
					Name: "Ask why they're into you",
				},
			},
		},
		{
			Name:  "Religion Wise",
			Value: "You discover the person you're dating is a religious leader and you're not religious. You",
			Option: []Option{
				{
					Oid:  1,
					Name: "Consider their religion will get in your way",
				},
				{
					Oid:  0,
					Name: "Ask about their religion",
				},
				{
					Oid:  -1,
					Name: "Carry on dating",
				},
			},
		},
		{
			Name:  "Outing",
			Value: "You go and a date and you like to",
			Option: []Option{
				{
					Oid:  1,
					Name: "Go somewhere",
				},
				{
					Oid:  0,
					Name: "Sit down and chat",
				},
				{
					Oid:  -1,
					Name: "Go in a group",
				},
			},
		},
		{
			Name:  "Money",
			Value: "You become mega rich. You",
			Option: []Option{
				{
					Oid:  -1,
					Name: "Still talk to old friends",
				},
				{
					Oid:  1,
					Name: "Disconnect from them",
				},
			},
		},
		{
			Name:  "Reaching Out",
			Value: "You find out someone likes you. You",
			Option: []Option{
				{
					Oid:  1,
					Name: "Reach out",
				},
				{
					Oid:  0,
					Name: "Let them try reach out",
				},
				{
					Oid:  -1,
					Name: "Forget it",
				},
			},
		},
		{
			Name:  "Many Many",
			Value: "The person you date had many partners before you. For you",
			Option: []Option{
				{
					Oid:  1,
					Name: "That's ok",
				},
				{
					Oid:  0,
					Name: "You need to ask them about this",
				},
				{
					Oid:  -1,
					Name: "100% unacceptable",
				},
			},
		},
		{
			Name:  "Not Social",
			Value: "You're wife / husband is 100% not a social person. For you",
			Option: []Option{
				{
					Oid:  1,
					Name: "That's ok",
				},
				{
					Oid:  0,
					Name: "You need to ask them about this",
				},
				{
					Oid:  -1,
					Name: "100% unacceptable",
				},
			},
		},
		{
			Name:  "Clothes",
			Value: "I care what my wife / husband wears. You prefer",
			Option: []Option{
				{
					Oid:  1,
					Name: "Conservative dressing",
				},
				{
					Oid:  0,
					Name: "I trust their judgement",
				},
				{
					Oid:  -1,
					Name: "Show skin",
				},
			},
		},
		{
			Name:  "First",
			Value: "You have to be your wife's/husband's no. 1 choice, You prefer",
			Option: []Option{
				{
					Oid:  1,
					Name: "100%",
				},
				{
					Oid:  0,
					Name: "As long as I'm on the priority list",
				},
				{
					Oid:  -1,
					Name: "I don't see things that way",
				},
			},
		},
		{
			Name:  "Opposite Sex",
			Value: "You don't like your husband / wife near many people of the opposite sex. You say",
			Option: []Option{
				{
					Oid:  1,
					Name: "100% no",
				},
				{
					Oid:  0,
					Name: "It's ok",
				},
				{
					Oid:  -1,
					Name: "It's normal, can't avoid it",
				},
			},
		},
		{
			Name:  "The One",
			Value: "You believe in the one. You say",
			Option: []Option{
				{
					Oid:  1,
					Name: "There is 1 right person and millions of the wrong person",
				},
				{
					Oid:  0,
					Name: "There are a few right people and many wrong people. Need to make a wise choice",
				},
				{
					Oid:  -1,
					Name: "There is no right or wrong person. You make things work together",
				},
			},
		},
		{
			Name:  "Different Country",
			Value: "Your wife / husband is from a different country to you. You prefer",
			Option: []Option{
				{
					Oid:  1,
					Name: "Yes",
				},
				{
					Oid:  0,
					Name: "Doesn't matter",
				},
				{
					Oid:  -1,
					Name: "No",
				},
			},
		},
		{
			Name:  "Uni",
			Value: "Your can find a wife / husband in uni. You say",
			Option: []Option{
				{
					Oid:  1,
					Name: "It's possible",
				},
				{
					Oid:  0,
					Name: "It's difficult",
				},
				{
					Oid:  -1,
					Name: "Are you crazy?",
				},
			},
		},
		{
			Name:  "Cheat",
			Value: "You cheat on your wife / husband. Can you live with yourself? You say",
			Option: []Option{
				{
					Oid:  1,
					Name: "It's not good but yes",
				},
				{
					Oid:  0,
					Name: "I have to tell someone but not them",
				},
				{
					Oid:  -1,
					Name: "I have to tell them",
				},
			},
		},
		{
			Name:  "Marriage",
			Value: "Your engaged. No sex before marriage",
			Option: []Option{
				{
					Oid:  1,
					Name: "That's right. No sex before marriage",
				},
				{
					Oid:  0,
					Name: "God forgive me",
				},
				{
					Oid:  -1,
					Name: "This question ain't real",
				},
			},
		},
	}
}
