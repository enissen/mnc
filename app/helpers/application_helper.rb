module ApplicationHelper

  def intro?
    controller.controller_name == 'welcome' && controller.action_name == 'intro'
  end

  def gallery?
    controller.controller_name == 'galleries' && controller.action_name == 'show'
  end

  def markdown(text)
    options  = {autolink: true}
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    markdown = Redcarpet::Markdown.new(renderer, options)
    markdown.render(text).html_safe
  end

  def spot_on(url,lang)
    I18n.locale = lang.to_s
    str = case lang
      when :en
        if url.match /(welcome|willkommen|bienvenido)/
          'welcome'
        elsif url.match /(impress|impressum|avisio_legal)/
          'impress'
        end
      when :de
        if url.match /(welcome|willkommen|bienvenido)/
          "willkommen"
        elsif url.match /(impress|impressum|avisio_legal)/
          "impressum"
        end
      when :es
        if url.match /(welcome|willkommen|bienvenido)/
          "bienvenido"
        elsif url.match /(impress|impressum|avisio_legal)/
          "avisio_legal"
        end
    end
  end
end
