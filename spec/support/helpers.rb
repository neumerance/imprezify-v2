def set_field_value_by_js(id, value)
  execute_script "document.getElementById(\'#{id}\').value = \'#{value}\'"
  execute_script "formUtils.submitForm(document.getElementById(\'#{id.to_s}\'))"
end

def submit_form_by_js(id)
  execute_script "formUtils.submitFormById('#{id}')"
end

def trigger_change_by_id(id)
  execute_script("document.getElementById('#{id}').onchange()")
end
