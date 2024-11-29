require 'rspec/expectations'
require_relative '../utils/api_client'

module APIHelper
  include RSpec::Matchers

  attr_accessor :api_client, :response, :user_id

  def parse_response
    JSON.parse(@response.body, symbolize_names: true)
  end
end

World(APIHelper)

Before do
  @user_id = nil
end

Given('I initialize the API client') do
  @api_client = APIClient.new
end

When('I create a user with name {string} and job {string}') do |name, job|
  @response = @api_client.create_user(name, job)
  @user_id = response['id']
  puts "User created with ID: #{@user_id}"
end

Then('the response code should be {int}') do |status_code|
  expect(@response.code).to eq(status_code), "Expected #{status_code}, but got #{@response.code}"
end

Then('the response should contain:') do |table|
  expected_data = table.rows_hash
  actual_data = parse_response
  expected_data.each do |key, value|
    actual_key = key.to_sym
    actual_value = actual_data[actual_key].to_s.strip
    expect(actual_value).to eq(value), "Expected #{key}: #{value}, but got #{actual_value}"
  end
end

When('I fetch the user by ID') do
  if @user_id.nil?
    raise "User ID is not available. Please ensure the user is created first."
  end
  url = "#{APIClient::BASE_URL}/users/#{@user_id}"
  puts "Calling endpoint: #{url}"
  @response = @api_client.get_user(@user_id)
end

Then('the response should follow this schema:') do |schema|
  actual_data = parse_response
  expected_schema = JSON.parse(schema)

  def validate_schema(data, schema)
    schema.each do |key, type|
      if type.is_a?(Hash)
        validate_schema(data[key], type)
      else
        expect(data[key]).to be_a(eval(type.capitalize)), "Expected #{key} to be a #{type}, but got #{data[key].class}"
      end
    end
  end
  validate_schema(actual_data, expected_schema)
end
