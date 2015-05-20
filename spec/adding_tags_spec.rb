feature 'links added with tags' do
  scenario 'with a few tags' do
    visit '/'
    add_link('http://www.makersacademy.com/',
               'Makers Academy',
               %w(education ruby))
      link = Link.first
      expect(link.tags.map(&:text)).to include 'education','ruby'
    end

    def add_link(url, title, tags = [])
      within('#new-link') do
        fill_in 'url', with: url
        fill_in 'title', with: title
        fill_in 'tags', with: tags.join(' ')
        click_button 'Add link'
    end
  end
end