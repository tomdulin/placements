module FormsHelper
  def options_for_row_selection(default_state)
    options_for_select([10, 25, 50, 100], selected: default_state)
  end

  def conditional_filter_persisted(parameter)
    return unless params[parameter].present?
    hidden_field_tag parameter.to_s, params[parameter] 
  end
end
