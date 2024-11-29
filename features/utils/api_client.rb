class APIClient
  include HTTParty

  BASE_URL = 'https://reqres.in/api'
  HEADERS = { 'Content-Type' => 'application/json' }

  def create_user(name, job)
    self.class.post("#{BASE_URL}/users", body: { name: name, job: job }.to_json, headers: HEADERS)
  end

  def get_user(id)
    url = "#{BASE_URL}/users/#{id}"
    self.class.get(url, headers: HEADERS)
  end
end
