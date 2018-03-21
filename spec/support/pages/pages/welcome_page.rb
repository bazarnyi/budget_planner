class WelcomePage < SitePrism::Page
  set_url '/welcome'
  set_url_matcher %r{/welcome}

  section :menu, MenuSection, '#mainNav'

  element :sign_in_btn, :xpath, '/html/body/header/div/div/a[1]'
  element :sign_up_btn, :xpath, '/html/body/header/div/div/a[2]'
end