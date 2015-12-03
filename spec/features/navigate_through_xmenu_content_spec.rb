#tests which select menus options
require 'spec_helper'
require 'support/parent_page'

describe 'Avenue Code new website'do

  menu_pages = ParentPage.instance
  page_object = nil

  before(:all) do
    menu_pages.browser.goto("#{ENV['ACNW_STAGING']}")
  end

  before(:each) do
    @exception = nil
    @custom_error_message = nil
  end

  after(:each) do
    if @exception
      menu_pages.screenshot_tool.take_screenshot
      menu_pages.log.info(@custom_error_message)
      menu_pages.log.info(@exception)
      fail @exception
    end
  end

  after(:all) do
    page_object = nil
    menu_pages.after_test(menu_pages.test_messages[:end_of_tests][:regarding_access_menu_pages])
  end

  context 'access menu pages' do
    it 'navigates to "About" page' do
      begin
        page_object = menu_pages.random_page.navigate_to_page("#{ENV['ACNW_MENU_ABOUT']}", "about")
        expect(menu_pages.browser.url).to include(menu_pages.expected_data[:pages_url][:about_page_url])
        expect(page_object.a_main_text_title).to eq(menu_pages.expected_data[:page_content][:about_page_content])
      rescue Exception => e
        @exception = e.message
        @custom_error_message = menu_pages.test_messages[:error_message][:about_page_not_found]
      end
    end

    it 'navigates to "Work" page' do
      begin
        page_object = menu_pages.random_page.navigate_to_page("#{ENV['ACNW_MENU_WORK']}", "work")
        expect(menu_pages.browser.url).to include(menu_pages.expected_data[:pages_url][:work_page_url])
        expect(page_object.w_main_text_title).to eq(menu_pages.expected_data[:page_content][:work_page_content])
      rescue Exception => e
        @exception = e.message
        @custom_error_message = menu_pages.test_messages[:error_message][:work_page_not_found]
      end
    end

    it 'navigates to "Services" page' do
      begin
        page_object = menu_pages.random_page.navigate_to_page("#{ENV['ACNW_MENU_SERVICES']}", "services")
        expect(menu_pages.browser.url).to include(menu_pages.expected_data[:pages_url][:services_page_url])
        expect(page_object.s_main_text_title).to eq(menu_pages.expected_data[:page_content][:services_page_content])
      rescue Exception => e
        @exception = e.message
        @custom_error_message = menu_pages.test_messages[:error_message][:services_page_not_found]
      end
    end

    it 'navigates to "Partners" page' do
      begin
        page_object = menu_pages.random_page.navigate_to_page("#{ENV['ACNW_MENU_PARTNERS']}", "partners")
        expect(menu_pages.browser.url).to include(menu_pages.expected_data[:pages_url][:partners_page_url])
        expect(page_object.p_main_text_title).to eq(menu_pages.expected_data[:page_content][:partners_page_content])
      rescue Exception => e
        @exception = e.message
        @custom_error_message = menu_pages.test_messages[:error_message][:partners_page_not_found]
      end
    end

    it 'navigates to "Careers" page' do
      begin
        page_object = menu_pages.random_page.navigate_to_page("#{ENV['ACNW_MENU_CAREERS']}", "careers")
        expect(menu_pages.browser.url).to include(menu_pages.expected_data[:pages_url][:careers_page_url])
        expect(page_object.c_main_text_title).to eq(menu_pages.expected_data[:page_content][:careers_page_content])
      rescue Exception => e
        @exception = e.message
        @custom_error_message = menu_pages.test_messages[:error_message][:careers_page_not_found]
      end
    end

    it 'navigates to "News" page' do
      begin
        page_object = menu_pages.random_page.navigate_to_page("#{ENV['ACNW_MENU_NEWS']}", "news")
        expect(menu_pages.browser.url).to include(menu_pages.expected_data[:pages_url][:news_page_url])
        expect(page_object.n_main_text_title).to eq(menu_pages.expected_data[:page_content][:news_page_content])
      rescue Exception => e
        @exception = e.message
        @custom_error_message = menu_pages.test_messages[:error_message][:news_page_not_found]
      end
    end

    it 'navigates to "Academy" page' do
      begin
        page_object = menu_pages.random_page.navigate_to_page("#{ENV['ACNW_MENU_ACADEMY']}", "academy")
        expect(menu_pages.browser.url).to include(menu_pages.expected_data[:pages_url][:academy_page_url])
        expect(page_object.ac_main_text_title).to eq(menu_pages.expected_data[:page_content][:academy_page_content])
      rescue Exception => e
        @exception = e.message
        @custom_error_message = menu_pages.test_messages[:error_message][:academy_page_not_found]
      end
    end

    it 'navigates to "Contact" page' do
      begin
        page_object = menu_pages.random_page.navigate_to_page("#{ENV['ACNW_MENU_CONTACT']}", "contact")
        expect(menu_pages.browser.url).to include(menu_pages.expected_data[:pages_url][:contact_page_url])
        expect(page_object.co_main_text_title).to eq(menu_pages.expected_data[:page_content][:contact_page_content])
      rescue Exception => e
        @exception = e.message
        @custom_error_message = menu_pages.test_messages[:error_message][:contact_page_not_found]
      end
    end



  end
end
