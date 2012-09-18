require 'redmine'

Redmine::Plugin.register :redmine_external_link do
  name 'Redmine External Link plugin'
  author 'ichizok'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  requires_redmine :version_or_higher => '2.1.0'
  # url 'http://example.com/path/to/plugin'
  # author_url 'http://example.com/about'
end

class ExternalLinkHookListener < Redmine::Hook::ViewListener
  EXTERNAL_LINK = <<EOT
$(function() {
  var domain = new RegExp('^https?://' + document.domain);
  $('a').each(function() {
    if (!this.href.match(domain)) { this.target = '_blank'; }
  });
});
EOT
  render_on :view_layouts_base_body_bottom, :inline => "<%= javascript_tag \"#{EXTERNAL_LINK}\" %>"
end
