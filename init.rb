require 'redmine'

Redmine::Plugin.register :redmine_external_link do
  name 'Redmine External Link plugin'
  author 'ichizok'
  description 'This is a plugin for Redmine'
  version '0.0.3'
  requires_redmine :version_or_higher => '2.1.0'
  # url 'http://example.com/path/to/plugin'
  # author_url 'http://example.com/about'
end

class ExternalLinkHookListener < Redmine::Hook::ViewListener
  EXTERNAL_LINK = <<EOT
$(function() {
  $('a[href^=\\\"http\\\"]:not([href^=\\\"//' + location.hostname + '\\\"])')
    .attr('target', '_blank')
    .bind('click', function() {
      var url = this.href;
      var w = window.open();
      w.document.write('<meta http-equiv=\\\"refresh\\\" content=\\\"0;url=' + url + '\\\">');
      w.document.close();
      return false;
    });
});
EOT
  render_on :view_layouts_base_body_bottom, :inline => "<%= javascript_tag \"#{EXTERNAL_LINK}\" %>"
end
