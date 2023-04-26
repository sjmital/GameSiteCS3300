class Game < ApplicationRecord
    validates_presence_of :title, :description, :platform, :genre, :releaseDate

    # Games are associated with a single image
    has_one_attached :game_image
end
