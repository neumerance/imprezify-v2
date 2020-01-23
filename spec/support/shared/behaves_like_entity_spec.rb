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
    byebug
    within("##{entity.to_s.pluralize.dasherize}") do
      find('h2', text: entity.to_s.pluralize.titleize).find('a').click

      within("##{entity.to_s}_#{index}") do
        expect(page).to have_css("a[name='#{entity.to_s}_#{index}']", visible: false)
        expect(page).to have_css("##{entity.to_s.pluralize}__id", visible: false)
        expect(find("##{entity.to_s.pluralize}__id", visible: false)['value']).not_to be_empty

        fill_in "#{entity.to_s.pluralize}[][name]", with: FFaker::Company.name
        fill_in "#{entity.to_s.pluralize}[][title]", with: FFaker::Job.title

        set_field_value_by_js("#{entity.to_s.pluralize}__since", 'value', '2014-04-01')
        set_field_value_by_js("#{entity.to_s.pluralize}__upuntil", 'value', '2016-01-03')

        click_on 'Show advanced fields'
        expect(page).to have_css("##{entity.to_s}_collapsible_#{index}")

        click_on 'Add Descriptions'
        expect(page).to have_css("input[name='#{entity.to_s.pluralize}[][description][]']")
        find("input[name='#{entity.to_s.pluralize}[][description][]']").set(FFaker::Lorem.paragraph)

        within("##{entity.to_s}_collapsible_#{index}") do
          attach_file("#{entity.to_s.pluralize}[][logo]", 'spec/fixtures/photo.jpeg', make_visible: true)
          fill_in "#{entity.to_s.pluralize}[][address]", with: FFaker::Address.street_address
          fill_in "#{entity.to_s.pluralize}[][city]", with: FFaker::Address.city
          fill_in "#{entity.to_s.pluralize}[][country]", with: FFaker::Address.country
          fill_in "#{entity.to_s.pluralize}[][postal_code]", with: FFaker::Address.zip_code
          wait_for_ajax

          expect(resume.reload.try(entity.to_s.pluralize).first.description.any?).to be_truthy
          %w(name title since upuntil logo address city).each do |f|
            expect(resume.reload.try(entity.to_s.pluralize)[index-1].try(f.to_sym).present?).to be_truthy
          end
        end
      end
    end
  end
end
