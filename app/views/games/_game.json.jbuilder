json.extract! game, :id, :title, :platform, :description, :genre, :releaseDate, :created_at, :updated_at
json.url game_url(game, format: :json)
