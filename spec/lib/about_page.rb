# require_relative '../support/parent_page'
class AboutPage
  include PageObject

  h1(:a_main_text_title, css: '.hero-title.h1')
  
end
