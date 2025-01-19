require 'csv'

require 'google-apis-civicinfo_v2'

require 'erb'

puts 'Event Manager Initialized'
puts ''

#Checks if the zipcode is valid
def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_num(phone_num)
  valid_nums = phone_num.split('').select { |s| s.strip.match?(/^[-]?\d+$/)}
  if valid_nums.length == 11 && valid_nums[0] == '1'
    phone_num = valid_nums[1..10].join('')
  elsif valid_nums.length == 10
    phone_num = valid_nums.join('')
  else 
    phone_num = 'Bad Number'
  end
end

def legislator_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  begin 
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_form(form_letter, id)

  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.html')
erb_template = ERB.new template_letter

hours_arr = []
hours_hash= {}
best_hours = []

days_arr = []
days_hash = {}
best_days = []

contents.each do |row|
  id = row[0]
  first_name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislator_zipcode(zipcode)
  phone_number = clean_phone_num(row[:homephone])

  reg_date = row[:regdate].split(' ')

  hours = Time.parse(reg_date[1])
  hours_arr << hours.strftime("%k").to_i

  dates = reg_date[0]
  new_date = Date.strptime(dates, "%m/%d/%Y")
  days_arr << new_date.strftime("%A")
  
  form_letter = erb_template.result(binding)
  save_form(form_letter, id)
end

hours_arr.each { |item| hours_hash[item] = hours_arr.count(item) }
hours_hash.each { |key, value| best_hours << key if hours_hash.values.max == value }

days_arr.each { |item| days_hash[item] = days_arr.count(item) }
days_hash.each { |key,value| best_days << key if days_hash.values.max == value}


puts ''
puts "The best hours to run ads would be at #{best_hours.map { |item| "#{item}:00"}.join(' and ')}."
puts ''
puts "The day when the most people registerd was on a #{best_days.join(' and ')}."
puts ''
