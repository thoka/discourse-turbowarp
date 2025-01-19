# frozen_string_literal: true

# name: discourse-turbowarp
# about: embed turbowarp projects in discourse
# version: 0.1
# authors: Thomas Kalka based on discourse-folksy-image Régis Hanol

require "onebox"

class Onebox::Engine::TurbowarpOnebox
  include Onebox::Engine

  matches_regexp %r{^(https?:)?//((scratch\.mit\.edu/projects)|(turbowarp.org))/([0-9]+).*$}i

  def to_html
    project_id = match[:project_id]
    options = match[:options]

    options = options ? "?" + options : ""
    url = "https://turbowarp.org/#{project_id}/embed#{options}"
    "<iframe src='#{url}' width='482' height='412' allowtransparency='true frameborder='0' scrolling='no' allowfullscreen></iframe>"
  end

  private

  def match
    @match ||= @url.match(%r{/(?<project_id>[0-9]+)/?(?:\?(?<options>.*))?})
  end
end
