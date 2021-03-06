# START:given
Given /^I am on the page for "(.*?)"$/ do |title|
  urls    = {'Cucumber Recipes' => 'http://pragprog.com/titles/dhwcr'}
  url     = urls[title] || raise("Unknown title #{title}")
  browser = Mechanize.new
  @page   = browser.get url
end
# END:given

# START:when
When /^I look for related titles$/ do
  css = 'table#related-books td.description a'
  @related = @page.search(css).map &:content
end
# END:when

# START:then
Then /^I should see "(.*?)"$/ do |title|
  @related.should include(title)
end
# END:then
