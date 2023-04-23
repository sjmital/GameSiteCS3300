class Game < ApplicationRecord
    #TODO update for rest of attributes
    validates_presence_of :title, :description
end
