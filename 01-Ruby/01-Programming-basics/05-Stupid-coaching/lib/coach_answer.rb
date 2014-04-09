def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message == "I am going to work right now SIR !"
    ""
  elsif your_message.include? "?"
    "Silly question, get dressed and go to work !"
  else
    "I don't care son, get dressed and go to work !"
  end
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours !
  if your_message.include? "coach"
    "#{coach_answer(your_message)} and Call me SIR instead of coach !"
  else
    "#{coach_answer(your_message)}"
  end
end



