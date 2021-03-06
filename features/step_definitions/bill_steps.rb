Given(/^I have at least one bill$/) do
  allow(API).to receive(:get).and_return(
    YAML.load_file(Rails.root.join('spec/fixtures/success.yml'))
  )
end

When(/^I am on the bills page$/) do
  visit root_path
end

Then(/^I should see my latest bill$/) do
  expect(page).to have_content 'Latest Bill' # Smoke test
  expect(page).to have_content '£100.63' # bill total amount
  expect(page).to have_content 'Due 25 Jan' # bill due date
end

Then(/^I should be able to drill down my services$/) do
  # Assert initial state
  within '#subscription .overview' do
    expect(page).to have_content '£71.40' # Displayed within dropdown button
  end
  expect(page).to have_selector('table.subscriptions', visible: false)

  # Click subscription dropdown
  click_button('Subscriptions')
  # Amount hidden within dropdown button
  expect(page).to have_selector('#subscription .overview', visible: false)

  # Show subscription breakdown
  expect(page).to have_selector('table.subscriptions', visible: true)
end

Then(/^I should be able to drill down my TV charges$/) do
  within '#tv_charges .pull-right .overview' do
    expect(page).to have_content '£4.99'
  end
  expect(page).to have_selector('table.tv_charges', visible: false)
  click_button('Sky TV Store')

  expect(page).to have_selector('#tv_charges .pull-right .overview', visible: false)
  # Show TV charge breakdown
  expect(page).to have_selector('table.tv_charges', visible: true)
  within('table.tv_charges', visible: true) do
    expect(page).to have_content '50 Shades of Grey	Rental	£4.99'
    expect(page).to have_content '£4.99'
  end
end

Then(/^I should be able to drill down my Phone charges$/) do
  within '#phone_charges .pull-right .overview' do
    expect(page).to have_content '£4.26'
  end
  expect(page).to have_selector('table.phone_charges', visible: false)
  click_button('Phone usage')

  expect(page).to have_selector('#phone_charges .pull-right .overview', visible: false)
  # Show phone charge breakdown
  expect(page).to have_selector('table.phone_charges', visible: true)
  within('table.phone_charges', visible: true) do
    expect(page).to have_content '07716393769    00:23:03    £2.13'
    expect(page).to have_content '£4.26'
  end
end

Then(/^I should be able to download a PDF of my bill$/) do
  click_link 'Download PDF'
  expect(page.status_code).to eql 200
  expect(page.response_headers['Content-Type'].downcase).to include('pdf')
  expect(page.response_headers['Content-Disposition']).to include %{filename="my_bill.pdf"}
end
