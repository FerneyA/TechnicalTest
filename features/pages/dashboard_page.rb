class DashboardPage
  include Capybara::DSL

  def transactions_count
    find(:xpath, '//table[@id="transactionsTable"]', visible: true)
    all(:xpath, '//table[@id="transactionsTable"]/tbody/tr').count
  end

  def get_balance
    find(:xpath, '//div[contains(., "Total Balance")]/div[@class="balance-value"]/span[1]').text.strip
  end

  def get_credit_available
    find(:xpath, '//div[@id="creditAvailable"]/div[2]').text.strip
  end

  def get_positive_values_colors
    all('table#transactionsTable tbody tr td.text-right span').select do |cell|
      cell.text.strip.match?(/^\+?[\d,]+(\.\d{2})? USD$/) && cell[:class].include?('text-success')
    end
  end

  def get_negative_values_colors
    all('table#transactionsTable tbody tr td.text-right span').select do |cell|
      cell.text.strip.match?(/^\-?[\d,]+(\.\d{2})? USD$/) && cell[:class].include?('text-danger')
    end
  end
end