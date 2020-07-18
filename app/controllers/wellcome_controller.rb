class WellcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de ruby on rails - about cookies"
    @firstName = params[:nome]
    @lastName = params[:sobrenome]
  end
end
