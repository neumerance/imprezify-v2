shared_examples 'an entity' do |entity, index|
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
    find('h2', text: name.pluralize.titleize).find('a').click

    within("##{entity.to_s}_#{index}") do
      expect(page).to have_css("a[name='#{entity.to_s}_#{index}']", visible: false)
      expect(page).to have_css("#resume_#{entity.to_s.pluralize}_attributes_#{index}_id", visible: false)
      expect(find("#resume_#{entity.to_s.pluralize}_attributes_#{index}_id", visible: false)['value']).not_to be_empty

      fill_in "resume[#{entity.to_s.pluralize}_attributes][#{index}][name]", with: FFaker::Company.name
      fill_in "resume[#{entity.to_s.pluralize}_attributes][#{index}][title]", with: FFaker::Job.title

      set_field_value_by_js("resume_#{entity.to_s.pluralize}_attributes_#{index}_since", 'value', '2014-04-01')
      set_field_value_by_js("resume_#{entity.to_s.pluralize}_attributes_#{index}_until", 'value', '2016-01-03')

      click_on 'Show advanced fields'
      expect(page).to have_css("##{entity.to_s}_collapsible_0")

      click_on 'Add Descriptions'
      expect(page).to have_css("input[name='resume[#{entity.to_s.pluralize}_attributes][#{index}][description][]']")
      find("input[name='resume[#{entity.to_s.pluralize}_attributes][#{index}][description][]']").set(FFaker::Lorem.paragraph)

      within("##{entity.to_s}_collapsible_0") do
        attach_file("resume[#{entity.to_s.pluralize}_attributes][#{index}][logo]", 'spec/fixtures/photo.jpeg', make_visible: true)
        fill_in "resume[#{entity.to_s.pluralize}_attributes][#{index}][address]", with: FFaker::Address.street_address
        fill_in "resume[#{entity.to_s.pluralize}_attributes][#{index}][city]", with: FFaker::Address.city
        fill_in "resume[#{entity.to_s.pluralize}_attributes][#{index}][country]", with: FFaker::Address.country
        fill_in "resume[#{entity.to_s.pluralize}_attributes][#{index}][postal_code]", with: FFaker::Address.zip_code
      end

      wait_for_ajax
      expect(resume.reload.try(entity.to_s.pluralize).first.description.any?).to be_truthy

      %w(name title since until logo address city country).each do |f|
        expect(resume.reload.try(entity.to_s.pluralize)[0]&.try(f.to_sym).present?).to be_truthy
      end
    end
  end
end
