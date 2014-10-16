module SessionHelpers
  def add_post
    visit '/'
    click_link 'Post'
    fill_in 'Content', with: "I'm so happy!"
    click_button 'Post'
  end
end
