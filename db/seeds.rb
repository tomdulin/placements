require 'json'

def create_user(email, name)
  user = User.find_or_initialize_by(
    email: email,
    name: name
  )
  
  user.password = "P@ssword"
  user.save!
end

puts '[Seeds] Adding user owner'
create_user('tom@placements.io', "Tom Dulin")
create_user('jesse@placements.io', "Jesse Low")

puts "[Seeds] Line Items"
seed_file = JSON.parse(File.read(Rails.root.join('db', 'seeds', 'placements_teaser_data.json')))
batch_size = 100
line_item_expected_attributes = LineItem.new.attributes.keys


seed_file.each do |line_item|
  puts " -- Reading Line Items #{line_item['id']} - #{line_item['id'] + batch_size}" if line_item['id'].to_i % batch_size == 0

  campaign = Campaign.find_or_create_by!(name: line_item['campaign_name'])

  line_item_attrs = line_item.slice(*line_item_expected_attributes)
  line_item_attrs[:name] = line_item['line_item_name']
  campaign.line_items << LineItem.create!(line_item_attrs)
end

puts "Building campaign sortable index"
Campaign.includes(:line_items).all.each do |campaign|
  campaign.update(adjustments: campaign.line_items.sum(:adjustments))
  campaign.update(actual_amount: campaign.line_items.sum(:actual_amount))
end

