# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all
Tag.destroy_all

# def get_questions
#     site = "https://www.marcandangel.com/2011/03/14/365-thought-provoking-questions-to-ask-yourself-this-year/"
#     doc = Nokogiri::HTML(open(site))

#     questions = doc.css("div.entry-content ol li")

#     questions.each do |question|
#         name = question.text
#         Question.create(name: name)
#     end
# end

# get_questions


Tag.create(name: "Life")        
Tag.create(name: "Love")        
Tag.create(name: "Past")        
Tag.create(name: "Present")     
Tag.create(name: "Future")      
Tag.create(name: "Beliefs")     
Tag.create(name: "Philosophy")  
Tag.create(name: "Lessons")     


Question.create(name: "When was the last time you tried something new?", tag_ids: [1, 3])
Question.create(name: "Who do you sometimes compare yourself to?", tag_ids: [1])
Question.create(name: "What’s the most sensible thing you’ve ever heard someone say?", tag_ids: [8])
Question.create(name: "What life lesson did you learn the hard way?", tag_ids: [3, 8])
Question.create(name: "What do you wish you spent more time doing five years ago?", tag_ids: [4, 8])
Question.create(name: "Who do you love and what are you doing about it?", tag_ids: [2])
Question.create(name: "What’s a belief that you hold with which many people disagree?", tag_ids: [6, 7])
Question.create(name: "What can you do today that you were not capable of a year ago?", tag_ids: [1, 3, 4, 8])
Question.create(name: "When you are 80-years-old, what will matter to you the most?", tag_ids: [1, 5])
Question.create(name: "Would you break the law to save a loved one?", tag_ids: [2, 7])
Question.create(name: "What makes you smile?", tag_ids: [1])
Question.create(name: "In the haste of your daily life, what are you not seeing?", tag_ids: [1, 4])
Question.create(name: "Which is worse, failing or never trying?", tag_ids: [1, 7, 8])
Question.create(name: "What are you most grateful for?", tag_ids: [1, 6])
Question.create(name: "Where do you find inspiration?", tag_ids: [1])



