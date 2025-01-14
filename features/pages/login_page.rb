class LoginPage
  include Capybara::DSL

  def visit_login_page
    visit '/hackathonV2.html'
  end

  def login(username, password)
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'log-in'
  end

  def get_message
    find(:xpath, '//div[contains(@id,"random_id")]').text.strip
  end
end