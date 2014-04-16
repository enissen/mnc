module ApplicationHelper

  def intro?
    controller.controller_name.eql?("welcome") && controller.action_name.eql?("intro")
  end


  def markdown(text)
    options = {autolink: true}
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    
    markdown = Redcarpet::Markdown.new(renderer, options)
    markdown.render(text).html_safe
  end


  def spot_on(url,lang)
    I18n.locale = lang.to_s

    case lang
      when :en
        if url.match /(welcome|willkommen|bienvenido)/
          str = "welcome"
        elsif url.match /(impress|impressum|avisio_legal)/
          str = "impress"
        end

      when :de
        if url.match /(welcome|willkommen|bienvenido)/
          str = "willkommen"
        elsif url.match /(impress|impressum|avisio_legal)/
          str = "impressum"
        end

      when :es
        if url.match /(welcome|willkommen|bienvenido)/
          str = "bienvenido"
        elsif url.match /(impress|impressum|avisio_legal)/
          str = "avisio_legal"
        end
    end

    str
  end
end
