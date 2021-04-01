# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all

def get_questions
    site = "https://www.marcandangel.com/2011/03/14/365-thought-provoking-questions-to-ask-yourself-this-year/"
    doc = Nokogiri::HTML(open(site))

    questions = doc.css("div.entry-content ol li")

    questions.each do |question|
        name = question.text
        Question.create(name: name)
    end
end

get_questions
