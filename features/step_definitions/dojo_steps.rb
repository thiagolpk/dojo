Dado("que esteja logado no site orangehrm") do
  visit "http://opensource.demo.orangehrmlive.com/"
  fill_in "txtUsername", :with => "admin"
  fill_in "txtPassword", :with => "admin"
  click_button ("btnLogin")
end

Quando("realizar o cadastro de um novo usuario") do
	find(:xpath, '//*[@id="menu_pim_viewPimModule"]/b').click
 	find(:xpath, '//*[@id="menu_pim_addEmployee"]').click
 	fill_in "firstName", :with => "Joaozinho"
 	fill_in "lastName", :with => "Maneiro"
  $id=find(:id, 'employeeId').value 
  click_button ("btnSave")
 end

Entao("é apresentado os detalhes pessoais do novo usuario") do
 	assert_text('Personal Details')
 	sleep(3)
 	page.save_screenshot './novocadastro.png'
end

Quando("alterar o nome do usuario") do
  find(:xpath, '//*[@id="menu_pim_viewPimModule"]/b').click
	find(:xpath, '//*[@id="menu_pim_viewEmployeeList"]').click
	fill_in 'empsearch_id', :with => $id
  click_button("searchBtn")
 	click_link ($id)
 	click_button ("btnSave")
 	choose('personal_optGender_1')
 	select 'Single', from: 'personal_cmbMarital'
 	select 'Brazilian', from: 'personal[cmbNation]'
 	fill_in 'personal_DOB', :with => "1992-12-18"
 	click_button ('btnSave')
end

Entao("é apresentado a mensagem de alteração realizada") do
  assert_text('Successfully Saved')
  page.save_screenshot './edicaocadastro.png'
end
