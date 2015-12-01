#tests which select menus options
require 'spec_helper'
require 'support/parent_page'

describe do

  menu_test = ParentPage.instance
  page_object = nil

  before do
    @exception = nil
    @custom_error_message = nil
  end

  after(:each) do
    if @exception
      menu_test.screenshot_tool.take_screenshot
      menu_test.log.info(@custom_error_message)
      menu_test.log.info(@exception)
      fail @exception
    end
  end

  after(:all) do
    page_object = nil
    menu_test.after_test(menu_test.test_messages[:end_of][:end_of_test])
  end

  context 'navigate through menu options' do
    it 'select main menu button' do
      begin
        menu_test.random_page.select_main_menu
        # expect(menu_test.required_test_data[:menu][:menu_options]).to match_array(menu_test.expected_data[:expected][:menu_options])
      rescue Exception => e
        
      end
    end
  end
end
