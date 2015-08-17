module ShareHelper
  def link_to_facebook
    @title = 'Jag har anmält mig till Midhack, gör det du med!'
    @url = 'http://mm-midhack-stage.herokuapp.com'
    @long_description = 'Midhack är ett innovationsevent på MIUN arrangerat i
                        sammarbete med MittMedia. Här möts journalister,
                        ekonomer, designers och utvecklare och skapar
                        morgondagens nyhetsupplevelse.'
    @action_prefix = 'Dela på'
    query = {
      s: 100,
      p: {
        url: @url,
        title: URI.escape(@title),
        summary: @long_description
      },
      u: @url,
      t: URI.escape(@title)
    }.to_query

    html_attrs = {
      title: "#{@action_prefix} Facebook",
      rel: 'external',
      class: 'share facebook',
      target: '_blank'
    }

    link_to "http://www.facebook.com/sharer.php?#{query}", html_attrs do
      yield
    end
  end

  def link_to_twitter
    @tweet = 'Jag har anmält mig till MIUNs innovationsevent Midhack, gör det du
              också! http://www.midhack.se #Midhack #hackaton #MIUN #MittMedia'
    @URI = "https://twitter.com/intent/tweet?text=#{URI.escape(@tweet)}"
    html_attrs = {
      title: "#{@action_prefix} Twitter",
      rel: 'external',
      class: 'share twitter',
      target: '_blank'
    }
    link_to @URI, html_attrs do
      yield
    end
  end

  def link_to_googleplus
    @url = 'http://mm-midhack-stage.herokuapp.com'
    @uri = "https://plus.google.com/u/0/share?url=#{URI.escape(@url)}"
    html_attrs = {
      title: "#{@action_prefix} Google+",
      rel: 'external',
      class: 'share googleplus',
      target: '_blank'
    }
    link_to @uri, html_attrs do
      yield
    end
  end

  def link_to_linkedin
    @url = 'http://mm-midhack-stage.herokuapp.com'
    @title = 'Jag har anmält mig till Midhack, gör det du med!'
    @long_description = 'Midhack är ett innovationsevent på MIUN arrangerat i
                    sammarbete med MittMedia. Här möts journalister,
                    ekonomer, designers och utvecklare och skapar
                    morgondagens nyhetsupplevelse.'
     @action_prefix = 'Dela på'

    query = {
      mini: true,
      url: @url,
      title: @title,
      summary: @long_description,
      source: 'midhack'
    }.to_query

    html_attrs = {
      title: "#{@action_prefix} LinkedIn",
      rel: 'external',
      class: 'share linkedin',
      target: '_blank'
    }
    link_to "https://www.linkedin.com/shareArticle?#{query}", html_attrs do
      yield
    end
  end
end
