require 'redmine'

Redmine::Plugin.register :redmine_external_link do
  name 'Redmine External Link plugin'
  author 'ichizok'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  # url 'http://example.com/path/to/plugin'
  # author_url 'http://example.com/about'
end

class ExternalLinkHookListener < Redmine::Hook::ViewListener
  render_on :view_layouts_base_html_head, :inline => "<%= javascript_include_tag 'external_link', :plugin => 'redmine_external_link' %>"
end
