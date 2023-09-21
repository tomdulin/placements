module VersionsHelper
  def get_name_of version
    return "Invoice" if version.invoice?
    version.object['name']
  end

  def changed_value_from(version)
    return "" if version.invoice?
    number_to_currency version.changeset["adjustments"].first
  end

  def changed_value_to(version)
    return "Created" if version.invoice?
    number_to_currency version.changeset["adjustments"].second
  end
end
