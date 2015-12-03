#tests which just navigate through website
require 'spec_helper'
require 'support/parent_page'

describe 'Avenue Code new website' do

  e2e_test = ParentPage.instance
  page_object = nil

  before(:each) do
    @exception = nil
    @custom_error_message = nil
  end

  after(:each) do
    if @exception
      e2e_test.screenshot_tool.take_screenshot
      e2e_test.log.info(@custom_error_message)
      e2e_test.log.info(@exception)
      fail @exception
    end
  end

  after(:all) do
    page_object = nil
    e2e_test.after_test(e2e_test.test_messages[:end_of_tests][:regarding_scroll_through_website])
  end

  context 'scroll through website' do
    it 'navigates to "home page"' do
      begin
        #expect if is on home page
        expect(e2e_test.browser.url).to include(e2e_test.expected_data[:expected][:home_page_url])
      rescue Exception => e
        @exception = e.message
        @custom_error_message = e2e_test.test_messages[:error_message][:not_on_home_page]
      end
    end

    it '"home page" should show main text' do
      begin
        expect(e2e_test.browser.text.include?(e2e_test.expected_data[:expected][:home_page_main_text])).to be true
      rescue Exception => e
        @exception = e.message
        @custom_error_message = e2e_test.test_messages[:error_message][:home_page_text_not_visible]
      end
    end

    it 'scroll to "work partners carrers" page' do
      begin
        page_object = e2e_test.home_page.navigate_to_WorkPartnersCarrers
        expect(e2e_test.browser.text.include?(e2e_test.expected_data[:expected][:work_partners_carrers_page])).to be true
      rescue Exception => e
        @exception = e.message
        @custom_error_message = e2e_test.test_messages[:error_message][:not_on_work_partners_carrers_page]
      end
    end

    it 'scroll to "talent solutions" page' do
      begin
        page_object = page_object.navigate_to_talent_solutions_page
        expect(e2e_test.browser.text.include?(e2e_test.expected_data[:expected][:talent_solution_page]))
      rescue Exception => e
        @exception = e.message
        @custom_error_message = e2e_test.test_messages[:error_message][:not_on_talent_solutions_page]
      end
    end

    it 'scroll to "AC Academy" page' do
      begin
        page_object = page_object.navigate_to_ac_academy_page
        expect(e2e_test.browser.text.include?(e2e_test.expected_data[:expected][:ac_academy_page]))
      rescue Exception => e
        @exception = e.message
        @custom_error_message = e2e_test.test_messages[:error_message][:not_on_ac_academy_page]
      end

    end

    it 'scroll to page footer' do
      begin
        page_object = page_object.navigate_to_footer
        expect(e2e_test.browser.text.include?(e2e_test.expected_data[:expected][:on_page_footer_city_name]))
      rescue Exception => e
        @exception = e.message
        @custom_error_message = e2e_test.test_messages[:error_message][:not_on_page_footer]
      end
    end
  end
end
