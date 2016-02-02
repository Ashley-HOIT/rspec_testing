require_relative '../support/env.rb'

describe 'access gov.uk', :type => :feature do

  it 'should navigate to gov.uk and click the benefits link' do
    @homepage = Gov_uk::Gov_uk_homepage.new
    visit(@homepage.url)
    expect(@homepage.homepage_title.text).to eq (Gov_uk::Config::Displayed_text::HOMEPAGE_TITLE)

    benefits_link=@homepage.benefits_link
    benefits_link.click

    @benefits_page = Gov_uk::Benefits_page.new
    expect(@benefits_page.benefits_page_title.text).to eq (Gov_uk::Config::Displayed_text::BENEFITS_PAGE_TITLE)
  end
end
