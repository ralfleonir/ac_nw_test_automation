#random page used to access the main menu options
require_relative '../support/parent_page'

class RandomPage
  include PageObject

  div(:main_menu_button, css:'.main-menu-button>div')

  def select_main_menu
    main_menu_button_element.when_present.click
    self
  end
end
