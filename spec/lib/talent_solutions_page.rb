require_relative 'ac_academy_page'

class TalentSolutionsPage
  include PageObject

  link(:arrow_down, css: '.cd-next')

  def navigate_to_ac_academy_page
    arrow_down_element.when_present.click
    ACAcademyPage.new(@browser)
  end
end
