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
  within '.overview' do
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
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be able to drill down my Phone charges$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

