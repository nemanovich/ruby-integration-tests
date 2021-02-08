# frozen_string_literal: true

Given(/^empty ToDo list$/) do
  visit('')
  page.execute_script('localStorage.clear()')
end

When(/^I add task "(.*)"$/) do |text|
  fill_in class: 'new-todo', with: "#{text}\n"
end

Then(/^ToDo list has (\d+) task\(s\)$/) do |count|
  expect(tasks).to have_exactly(count).items
end

And(/^task \#(\d+) is "(.*)"$/) do |index, text|
  expect(tasks).to have_at_least(index).items
  expect(tasks[index - 1]).to have_content(text)
end

When(/^I delete task \#(\d+)$/) do |index|
  expect(tasks).to have_at_least(index).items
  tasks[index - 1].hover.find('.destroy').click
end

Then(/^ToDo list is empty$/) do
  expect(page).not_to have_css('.todo-list')
end

When(/^I complete task \#(\d+)$/) do |index|
  expect(tasks).to have_at_least(index).items
  tasks[index - 1].find('.toggle', visible: false).click
end

Then(/^task \#(\d+) marked as completed$/) do |index|
  tasks[index - 1].assert_ancestor(class: 'completed')
end

private

def tasks
  page.all('.todo-list .view')
end
