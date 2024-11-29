Given('I am on the login page') do
  @login_page = LoginPage.new
  @login_page.visit_login_page
end

When('I login with username {string} and password {string}') do |username, password|
  @login_page.login(username, password)
end

Then('I should be redirected to the dashboard: {string}') do |dashboard|
  expect(page.current_url).to eq(dashboard)
end

Then('I should see a table with {int} transactions') do |count|
  @dashboard_page = DashboardPage.new
  expect(@dashboard_page.transactions_count).to eq(count)
end

Then('the Total balance should display {string}') do |expected_balance|
  @dashboard_page = DashboardPage.new
  actual_balance = @dashboard_page.get_balance
  expect(actual_balance).to eq(expected_balance)
end

Then('the Credit Available should display {string}') do |expected_credit|
  @dashboard_page = DashboardPage.new
  actual_credit = @dashboard_page.get_credit_available
  expect(actual_credit).to eq(expected_credit)
end

Then('all positive numbers in the table should be green') do
  @dashboard_page = DashboardPage.new
  positive_cells = @dashboard_page.get_positive_values_colors
  puts "Positive Cells Found: #{positive_cells.join(', ')}" # Depuración
  positive_cells.each do |cell|
    expect(cell).to have_css('.text-success'), "Cell with value #{cell.text.strip} is not green"
  end
end

Then('all negative numbers in the table should be red') do
  @dashboard_page = DashboardPage.new
  negative_cells = @dashboard_page.get_negative_values_colors
  puts "Negative Cells Found: #{negative_cells.join(', ')}" # Depuración
  negative_cells.each do |cell|
    expect(cell).to have_css('.text-danger'), "Cell with value #{cell.text.strip} is not red"
  end
end






