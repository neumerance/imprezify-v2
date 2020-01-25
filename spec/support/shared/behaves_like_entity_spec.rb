shared_examples 'an entity' do |entity, index, sample|
  let(:name) { entity.to_s.singularize.titleize.downcase }
  let(:resume) { create(:resume) }
  let!(:basic_info) { create(:basic_info, resume: resume) }
  let(:user) { resume.user }
  let(:expection) do
    resume.try(entity).as_json[index-1].symbolize_keys
  end

  background do
    login_as user
    visit edit_resume_path(resume)
  end

  scenario "When there are no #{name} yet" do
    within("##{entity.to_s.dasherize}") do
      expect(page).to have_content("Click plus button above to add #{name}.")
    end
  end

  scenario "When adding #{name}" do
    within("##{entity.to_s.dasherize}") do
      find('h2', text: entity.to_s.titleize).find('a').click
      wait_for_ajax
      sleep 2

      within("##{entity.to_s.singularize}_#{index}") do
        expect(page).to have_css("a[name='#{entity.to_s.singularize}_#{index}']", visible: false)
        expect(page).to have_css("##{entity.to_s}__id", visible: false)
        expect(find("##{entity.to_s}__id", visible: false)['value']).not_to be_empty

        if has_link?('Show advanced fields')
          click_on 'Show advanced fields'
          expect(page).to have_css("##{entity.to_s.singularize}_collapsible_#{index}", visible: false)
        end
      end

      fill_form(entity, sample)
    end

    resume.reload
    sample.each do |key, value|
      if key == :logo
        expect(expection[:logo_file_name]).not_to be_empty
      else
        expect(expection[key]).to eq value
      end
    end
  end

  private

  def fill_form(entity, sample)
    sample.each do |key, value|
      if key == :description
        value.each do |v|
          click_on 'Add Descriptions'
          all("input[name='#{entity.to_s}[][#{key}][]']").last.set(v)
          wait_for_ajax
        end
      elsif key == :logo
        attach_file("#{entity.to_s}[][#{key.to_s}]", value, make_visible: true)
      elsif [:since, :upuntil].include?(key)
        set_field_value_by_js("#{entity.to_s}__#{key}", value)
      else
        fill_in "#{entity.to_s}[][#{key.to_s}]", with: value
      end
      wait_for_ajax
    end
    execute_script "formUtils.submitForm(document.getElementById(\'#{entity.to_s}__#{sample.keys.first.to_s}\'))"
    wait_for_ajax
  end
end
