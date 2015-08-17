module ShareHelper

  @short_description = 'Jag har anmält mig till MIUNs innovationsevent Midhack, gör det du också!'


  def link_to_facebook
    @title = 'Jag har anmält mig till Midhack, gör det du med!'
    @url = 'http://mm-midhack-stage.herokuapp.com'
    @long_description = 'Midhack är ett innovationsevent på MIUN arrangerat i sammarbete
                  med MittMedia. Här möts journalister, ekonomer, designers och
                  utvecklare och skapar morgondagens nyhetsupplevelse.'
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
end
