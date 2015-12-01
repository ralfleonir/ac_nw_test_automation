require_relative 'footer'

class ACAcademyPage
  include PageObject

  link(:arrow_down, css: '.cd-next')

  def navigate_to_footer
    arrow_down_element.when_present.click
    Footer.new(@browser)
  end
end
