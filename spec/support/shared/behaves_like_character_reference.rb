shared_examples 'an character reference' do |entity, index|
  let(:name) { entity.to_s.underscore.split('_').join(' ') }
  let(:resume) { create(:resume) }
  let!(:basic_info) { create(:basic_info, resume: resume) }
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
    within("##{entity.to_s.pluralize.dasherize}") do
      find('h2', text: entity.to_s.pluralize.titleize).find('a').click

      within("##{entity.to_s}_#{index}") do
        expect(page).to have_css("a[name='#{entity.to_s}_#{index}']", visible: false)
        expect(page).to have_css("##{entity.to_s.pluralize}__id", visible: false)
        expect(find("##{entity.to_s.pluralize}__id", visible: false)['value']).not_to be_empty

        fill_in "#{entity.to_s.pluralize}[][name]", with: FFaker::Company.name
        fill_in "#{entity.to_s.pluralize}[][title]", with: FFaker::Job.title
        fill_in "#{entity.to_s.pluralize}[][phone]", with: FFaker::PhoneNumberSG.fixed_line_number
        fill_in "#{entity.to_s.pluralize}[][email]", with: FFaker::Internet.email
      end
    end
  end
end
