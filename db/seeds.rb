# Add seed data in this file
puts "Seeding spells..."

spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

spells.each do |spell|
  # make a request to the endpoint for the individual spell
  response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"

  # JSON.parse to convert response into a Ruby hash.
  spell_hash = JSON.parse(response)

  # Create spell in the db using the spell hash.
  Spell.create(
    name: spell_hash["name"],
    level: spell_hash["level"],
    description: spell_hash["desc"][0]
  )
end

puts "Done seeding!"