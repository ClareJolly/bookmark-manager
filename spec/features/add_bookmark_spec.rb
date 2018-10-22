feature 'add bookmark' do
  scenario 'user adds a bookmark' do
    visit('/add-bookmark')
    fill_in :url, with: "https://makers.tech"
    click_button 'submit'
    expect(page).to have_content "https://makers.tech"
  end
end
