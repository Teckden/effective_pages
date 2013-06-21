module EffectivePagesHelper
  def effective_page_header_tags(options = {})
    @page ||= nil

    [
      content_tag(:title, options[:title] || @page.try(:title)),
      "<meta content='#{options[:meta_description] || @page.try(:meta_description)}' name='description' />",
      "<meta content='#{options[:meta_keywords] || @page.try(:meta_keywords)}' name='keywords' />"
    ].join("\n").html_safe
  end

  def application_root_to_effective_pages_slug
    Rails.application.routes.routes.find { |r| r.name == 'root' and r.defaults[:controller] == 'Effective::Pages' and r.defaults[:action] == 'show' }.defaults[:id] rescue nil
  end

  def page_region(region, options = {})
    if block_given?
      mercury_region(region, options) { yield }
    else
      mercury_region(region, options)
    end
  end

end
