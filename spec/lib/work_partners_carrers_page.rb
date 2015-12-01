require_relative 'talent_solutions_page'

class WorkPartnersCarrers
  include PageObject

  h4(:work_section, text:'Work')
  link(:arrow_down, css: '.cd-next')

  def navigate_to_talent_solutions_page
    arrow_down_element.when_present.click
    TalentSolutionsPage.new(@browser)
  end
end
