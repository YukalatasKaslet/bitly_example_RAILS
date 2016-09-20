class Url < ActiveRecord::Base
  #antes de crear manda a llamar al método mencionado
  before_create :create_short_url

  #validaciones correctas :D
  validates :long_url, presence: true, uniqueness: true, format: { with: URI.regexp }
  
  private
  def create_short_url
    #aquí se crea la url corta, tiene self por que es un metodo de instancia y antes de crearlo se le asigna un valor a su atributo.
    self.short_url = "Yuk-" + (1..6).map{ ('a'..'z').to_a[rand(26)]}.join

  end
end
