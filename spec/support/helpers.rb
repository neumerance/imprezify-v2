def set_field_value_by_js(id, attr, value)
  execute_script("document.getElementById('#{id}').setAttribute('#{attr}', '#{value}')")
  trigger_change_by_id(id)
end

def submit_form_by_js(id)
  execute_script("window.submitForm(document.getElementById('#{id}'))")
end

def trigger_change_by_id(id)
  execute_script("document.getElementById('#{id}').onchange()")
end
