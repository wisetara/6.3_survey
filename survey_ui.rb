require "active_record"
require "./lib/survey"
require "./lib/question"


ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["development"])

def greeting
  puts "Welcome to SurveySquid!"
  main_menu
end


def main_menu
  choice = nil
  until choice == "e"
    puts "Enter 'A' to add a survey."
    puts "Enter 'Q' to add questions to a survey"
    puts "Enter 'E' to exit."
    choice = gets.chomp.downcase
    case choice
    when "a"
      add_survey
    when "e"
      puts "Thanks for using SurveySquid!"
      exit
    when "q"
      add_questions
    else
      puts "Say whaaaaa?"
    end
  end
end

def add_survey
  puts "What do you want to name your survey?"
  survey_name = gets.chomp.titlecase
  survey = Survey.new({:name => survey_name})
  survey.save
  puts "'#{survey_name}' has been created!"
  puts "Enter 'Q' to add questions to a survey."
  puts "Enter 'M' to return to the main menu."
  choice = gets.chomp.downcase
  case choice
  when 'q' then add_questions(survey)
  when 'm' then main_menu
  else puts "Not an option, Megamind."
  main_menu
  end
end

def add_questions(survey)
  # puts "Enter a survey to which you would like to add a question."
  # which_survey = gets.chomp.downcase
  # search_survey = Survey.where(name: which_survey)

#Need to validate that survey exists

  puts "Enter a question to add"
  user_question = gets.chomp.downcase
  survey_question = Question.new({:question => user_question, :survey_id => survey.id})
  survey_question.save
  # search_survey.questions << survey_question
  # search_survey.save
  puts "'#{user_question}' has been added!"


  # puts "Enter 'Q' to add another question."
  # puts "Enter 'M' to return to the main menu."
  # choice = gets.chomp.downcase
  # case choice
  # when 'q' then add_questions(survey)
  # when 'm' then main_menu
  # else puts "Get real, Lame-O."
  # end
  main_menu
end

greeting

# ..make new question ->call it question
# ..search for survey you want to add question to -> call it this_survey
question.survey = this_survey #This may not work....I can't remember.
# OR
this_survey.questions << question








