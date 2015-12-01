#home page
require_relative '../support/parent_page'
require_relative 'work_partners_carrers_page'

class HomePage
  include PageObject

  link(:home_page_arrow, css:'.arrow-down.cd-next')

  def navigate_to_WorkPartnersCarrers
    home_page_arrow_element.when_present.click
    sleep 2
    WorkPartnersCarrers.new(@browser)
  end
end
