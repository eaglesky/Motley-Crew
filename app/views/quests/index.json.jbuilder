json.array!(@quests) do |quest|
  json.extract! quest, :id, :title, :description, :reward
  json.url quest_url(quest, format: :json)
end
