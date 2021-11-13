# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  belongs_to(:director, {:foreign_key => "director_id", :class_name => "Director"}) 
  #name of the method you want, foreign key column, class name
    #one to one
  
  has_many(:characters, {:class_name => "Character", :foreign_key => "movie_id"})
    # def director
  #   key = self.director_id

  #   matching_set = Director.where({ :id => key })

  #   the_one = matching_set.at(0)

  #   return the_one
  # end

  #many to many
  has_many(:cast, {:through => "characters", :source => "actor"}) #many to many
    #relies upon the others being defined--here, character

  # def cast
  #   the_many = Array.new

  #   self.characters.each do |joining_record|
  #       destination_record = joining_record.actor
  #       the_many.push(destination_record)

  #   end
  # return the_many
  # end



end


# Direcotr has many movies
# Movie belongs to one director
# Movie has many characters
# Character belongs to one 
# MovieActor has many characters
# character belongs to one actor