class Footer
  include PageObject

  link(:arrow_up, css: '.cd-prev')

  def navigate_up
    arrow_up_element.when_present.click
    self
  end
end
