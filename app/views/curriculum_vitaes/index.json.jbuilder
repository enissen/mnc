json.array!(@curriculum_vitaes) do |curriculum_vitae|
  json.extract! curriculum_vitae, :id, :title, :content
  json.url curriculum_vitae_url(curriculum_vitae, format: :json)
end
