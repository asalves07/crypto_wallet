module ApplicationHelper
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def locale_br()
    I18n.locale == :en ? "Estados Unidos" : "Português do Brasil"
  end

  def environment_
    if Rails.env.development?
      "desenvolvimento"
    elsif Rails.env.production?
      "produção"
    else
      "teste"
    end
  end
end
