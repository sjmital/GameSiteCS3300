class Game < ApplicationRecord
    validates_presence_of :title, :description, :platform, :genre, :releaseDate
end
