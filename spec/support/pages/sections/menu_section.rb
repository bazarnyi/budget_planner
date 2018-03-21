class MenuSection < SitePrism::Section
  # For not logged in visitor
  element :sign_in_link,      :xpath, '//*[@id="bs-example-navbar-collapse-1"]/ul/li[1]/a'
  element :sign_up_link,      :xpath, '//*[@id="bs-example-navbar-collapse-1"]/ul/li[2]/a'

  # For logged in user
  element :edit_profile_link, :xpath, '//*[@id="bs-example-navbar-collapse-1"]/ul/li[1]/a'
  element :logout_link,       :xpath, '//*[@id="bs-example-navbar-collapse-1"]/ul/li[2]/a'
end