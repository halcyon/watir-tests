require "watir-webdriver"

browser = Watir::Browser.new :chrome

#browser.goto("http://izenda.zeddworks.com/webformscs67")
browser.goto("http://demo2.izenda.us/webforms-cs")

# Create ShipCountry Grid Report
browser.link(:text => "+ New").click
browser.checkbox(:title => "Orders").click
browser.element(:id => "ctl00$PlaceHolder$Adhocreportdesigner1$ctl01$_TS_tab1").click
browser.select_list(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_sc_Column").option(:value => "[dbo].[Orders].[ShipCountry]").wait_until_present
browser.select_list(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_sc_Column").select "ShipCountry"
browser.link(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_SaveButton_TitleAnchor").click
browser.text_field(:id => "promt_input").set("ShipCountry")
browser.select_list(:id => "promt_input2").select "(Create new)"
browser.text_field(:id => "promt_input").set("Test")
browser.element(:css => 'div#mbd input[value="OK"]').click
browser.element(:css => 'div#mbd input[value="OK"]').click

# Create Pie Chart of ShipCountry
browser.link(:text => "+ New").click
browser.checkbox(:title => "Orders").click
browser.element(:id => "ctl00$PlaceHolder$Adhocreportdesigner1$ctl01$_TS_tab1").click
browser.select_list(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_sc_Column").option(:value => "[dbo].[Orders].[ShipCountry]").wait_until_present
browser.select_list(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_sc_Column").select "ShipCountry"

browser.element(:id => "ctl00$PlaceHolder$Adhocreportdesigner1$ctl01$_TS_tab3").click

browser.select(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_chc_ChartTypeSelect").option(:value => "Pie").wait_until_present
browser.select(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_chc_ChartTypeSelect").select "Pie"

browser.select_list(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_chc_Column", :index => 0).option(:value => "[dbo].[Orders].[ShipCountry]").wait_until_present
browser.select_list(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_chc_Column", :index => 1).option(:value => "[dbo].[Orders].[ShipCountry]").wait_until_present

browser.select_list(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_chc_Column", :index => 0).select_value "[dbo].[Orders].[ShipCountry]"
browser.select_list(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_chc_Column", :index => 1).select_value "[dbo].[Orders].[ShipCountry]"

browser.link(:id => "PlaceHolder_Adhocreportdesigner1_ctl01_SaveButton_TitleAnchor").click
browser.text_field(:id => "promt_input").set("PieGrid")
browser.select_list(:id => "promt_input2").select "Test"
browser.element(:css => 'div#mbd input[value="OK"]').click

# Create Dashboard of Pie Chart and ShipCountry
browser.element(:css => '.btn.dropdown-toggle').click
browser.link(:text => "Dashboard").click

browser.text_field(:name => "0_TextBox").set "Pie"

browser.select_list(:name => "0_ReportSetName").option(:value => "Test\\PieGrid").wait_until_present
browser.select_list(:name => "0_ReportSetName").select "PieGrid"

browser.select_list(:name => "0_ReportName").select "Chart"

browser.text_field(:name => "3_TextBox").set "Countries"
browser.select_list(:name => "3_ReportSetName").select "ShipCountry"
browser.select_list(:name => "3_ReportName").select "Fields"

browser.link(:id => "PlaceHolder_dashboard_SaveButton_TitleAnchor").click
browser.text_field(:id => "promt_input").set("PieDash")
browser.select_list(:id => "promt_input2").select "Test"
browser.element(:css => 'div#mbd input[value="OK"]').click

browser.goto("http://demo2.izenda.us/webforms-cs")
browser.close
