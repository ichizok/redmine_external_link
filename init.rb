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
  EXTERNAL_LINK = <<EOT
Event.observe(window, 'load', function() {
  var domain = new RegExp('^https?://' + document.domain);
  $$('a').each(function(e) {
    if (!e.href.match(domain)) { e.target = '_blank'; }
  });
}, false);
EOT
  render_on :view_layouts_base_body_bottom, :inline => "<%= javascript_tag \"#{EXTERNAL_LINK}\" %>"
end
