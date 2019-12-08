module ResumeHelper
  def add_more_field_button(model, name, attr)
    link_to('javascript:void(0)',
            'data-object-name' => name,
            'onclick' => "addMoreField(this)") do
      concat content_tag(:span, '', class: 'fa fa-plus-circle mr-2')
      concat content_tag(:span, model.try(attr).any? ? 'Add more description' : 'Add Descriptions')
    end
  end

  def image_field(model, name, attr)
    id = name.parameterize.underscore
    content_tag(:div) do
      concat file_field_tag name, class: 'd-none', data: { behaviour: 'image-input', 'image-tag' => id }, onchange: 'submitForm(this)'
      concat image_tag model.try(attr).try(:url), id: id + '_preview', class: 'rounded d-block width-100'
      concat link_to(content_tag(:span, ' Change', class: 'fa fa-pen-square'),
                     'javascript:void(0)',
                     class: 'text-white rounded py-1 px-2 change-photo position-relative',
                     onclick: "document.querySelectorAll('input[name=\"#{name}\"]')[0].click()")
    end
  end

  def skill_levels
    Skill::VALUES.map { |s| [s.to_s.titleize, s] }
  end

  def contact_labels
    Contact::LABELS.map { |s| [s.to_s.titleize, s] }
  end

  def section_label(args, &block)
    content_tag(
      args[:el].to_sym,
      class: "#{args[:class]} #{args[:completed] ? 'text-success' : 'text-muted'}"
    ) do
      concat content_tag(:span, '', class: 'fa fa-check mr-2') if args[:completed]
      concat link_to args[:label], 'javascript:void(0)', onclick: "moveToAnchor('#resume-form', '#{args[:anchor]}')"
      block.call if block_given?
    end
  end
end
