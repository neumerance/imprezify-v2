shared_examples 'a common name and value' do |entity, index|
  let(:name) { entity.to_s.underscore.split('_').join(' ') }
  let(:resume) { create(:resume) }
  let(:user) { resume.user }

  background do
    login_as user
    visit edit_resume_path(resume)
  end

  scenario "When there are no #{name} yet" do
    within("##{entity.to_s.dasherize.pluralize}") do
      expect(page).to have_content("Click plus button above to add #{name}.")
    end
  end

  scenario "When adding #{name}" do
    find('h2', text: name.pluralize.titleize).find('a').click
    within("##{entity.to_s}_#{index}") do
      expect(page).to have_css("a[name='#{entity.to_s}_#{index}']", visible: false)
      expect(page).to have_css("#resume_#{entity.to_s.pluralize}_attributes_#{index}_id", visible: false)

      fill_in "resume[#{entity.to_s.pluralize}_attributes][#{index}][name]", with: FFaker::Lorem.sentence
      select 'Expert', from: "resume[#{entity.to_s.pluralize}_attributes][#{index}][value]"

      wait_for_ajax

      %w(name value).each do |f|
        expect(resume.reload.try(entity.to_s.pluralize)[0]&.try(f.to_sym).present?).to be_truthy
      end
    end
  end
end
