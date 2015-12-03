#random page used to access the main menu options
require_relative '../support/parent_page'
require_relative 'about_page'
require_relative 'work_page'
require_relative 'services_page'
require_relative 'partners_page'
require_relative 'careers_page'
require_relative 'news_page'
require_relative 'academy_page'
require_relative 'contact_page'

class RandomPage
  include PageObject

  div(:main_menu_button, css:'.main-menu-button>div')

  def select_main_menu
    main_menu_button_element.when_present.click
    self
  end

  def navigate_to_page(page_url, page_name)
    browser.goto(page_url)
    page = page_name
    
    case page
    when "home"
    when "about"
      AboutPage.new(@browser)
    when "work"
      WorkPage.new(@browser)
    when "services"
      ServicesPage.new(@browser)
    when "partners"
      PartnersPage.new(@browser)
    when "careers"
      CareersPage.new(@browser)
    when "news"
      NewsPage.new(@browser)
    when "academy"
      AcademyPage.new(@browser)
    when "contact"
      ContactPage.new(@browser)
    else
    end
  end


end
