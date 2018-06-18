require 'pry'
class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    f_name = self.first_name + " " + self.last_name
    f_name
  end

  def list_roles
    Character.all.where("actor_id =?", self.id).map do |char|
      "#{char.name} - #{char.show.name}"
    end

  end
end
