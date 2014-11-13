json.array!(@delivery_quests) do |delivery_quest|
  json.extract! delivery_quest, :id, :title, :description, :reward
  json.url delivery_quest_url(delivery_quest, format: :json)
end
