shared_examples 'common name and value' do |entity, index, sample|
  let(:name) { entity.to_s.singularize.titleize.downcase }
  let(:resume) { create(:resume) }
  let!(:basic_info) { create(:basic_info, resume: resume) }
  let(:user) { resume.user }
  let(:expectation) do
    resume.try(entity).where(
      name: sample.dig(:name, :value).downcase,
      value: sample.dig(:value, :value).downcase
    )
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
    find('h2', text: entity.to_s.titleize).find('a').click
    wait_for_ajax
    sleep 2

    within("##{entity.to_s.singularize}_#{index}") do
      expect(page).to have_css("a[name='#{entity.to_s.singularize}_#{index}']", visible: false)
      expect(page).to have_css("##{entity.to_s}__id", visible: false)

      fill_in_contact_form(entity, sample)
    end

    resume.reload

    expect(expectation).not_to be_empty
  end

  private

  def fill_in_contact_form(entity, sample)
    sample.each do |key, field|
      if field.dig(:type) == :select
        select field.dig(:value), from: "#{entity.to_s}[][#{key}]"
      elsif field.dig(:type) == :input
        fill_in "#{entity.to_s}[][#{key}]", with: field.dig(:value)
      end
    end
    execute_script "formUtils.submitForm(document.getElementById(\'#{entity.to_s}__name\'))"
    wait_for_ajax
  end
end
