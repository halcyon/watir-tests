require "watir-webdriver"

browser = Watir::Browser.new :phantomjs
browser.goto("http://demo2.izenda.us/webforms-cs")
element = browser.li(:text => "Test")
element.click

shipCountry = <<-JS
  var UserData = new ud();
  UserData.reportName = "Test\\\\ShipCountry";
  RL_DeleteCallbackNew(UserData, true);
JS
browser.execute_script(shipCountry,element)

pieGrid = <<-JS
  var UserData = new ud();
  UserData.reportName = "Test\\\\PieGrid";
  RL_DeleteCallbackNew(UserData, true);
JS
browser.execute_script(pieGrid,element)

pieDash = <<-JS
  var UserData = new ud();
  UserData.reportName = "Test\\\\PieDash";
  RL_DeleteCallbackNew(UserData, true);
JS
browser.execute_script(pieDash,element)

element.wait_while_present
browser.close
