module ResumeHelper
  def add_more_field_button(model, attr)
    link_to('javascript:void(0)',
            'data-object-name' => "#{model.object_name}[#{attr}][]",
            'onclick' => "addMoreField(this)") do
      concat content_tag(:span, '', class: 'fa fa-plus-circle mr-2')
      concat content_tag(:span, model.object.try(attr).any? ? 'Add more description' : 'Add Descriptions')
    end
  end

  def image_field(model, attr)
    name = model.object_name.parameterize.underscore + '_' + attr.to_s
    content_tag(:div, class: 'position-absolute') do
      concat model.file_field attr, class: 'd-none', data: {behaviour: 'image-input', 'image-tag' => name}
      concat image_tag model.object.try(attr).try(:url), id: name + '_preview', class: 'rounded d-block width-100'
      concat link_to(content_tag(:span, ' Change', class: 'fa fa-pen-square'),
                     'javascript:void(0)',
                     class: 'text-white rounded py-1 px-2 change-photo position-relative',
                     onclick: "document.getElementById('#{name}').click()")
    end
  end
end
