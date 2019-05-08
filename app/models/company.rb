class Company < ApplicationRecord
  COMPANYSECTORS = ["Agricultura e Pecuária", "Alimentos e Bebidas", "Arquitetura e Engenharia",
                    "Arte e Cultura", "Beleza e Cosméticos", "Bares e Restaurantes",
                    "Call Center e Telemarketing", "Comércio Atacado", "Comércio Varejo",
                    "Construção", "Consultoria", "Design", "Enfermagem e Medicina", "Escolas e Cursos",
                    "Elétrico", "Fotografia e Vídeo", "Eventos", "Farmácia", "Hospedagem e Turismo",
                    "Imobiliário", "Jornalismo", "Laboratórios", "Limpeza", "Manutenção e Reparos",
                    "Marketing", "Mercados e Padarias", "Mercado Financeiro e de Capitais", "Mineração",
                    "Óleo e Gás", "Produção de Bens Duráveis", "Produção de Bens Não Duráveis",
                    "Programação e Desenvolvimento", "Publicidade e Propaganda",
                    "Segurança", "Seguros", "Serviços Gerais", "Siderurgia e Metalurgia",
                    "Tecnologia da Informação", "Telecomunicações", "Transporte Logística",
                    "Vestuário e Calçados"].freeze
  belongs_to :user
  has_many :jobs, :dependent => :destroy
  has_many :favorites, through: :jobs

  def company_city
    if address.nil? || address == ""
      # 'Rio de Janeiro, Rio de Janeiro, Brazil'
    else
      address.split(', ')[1] + ', ' + address.split(', ')[2] + ', ' + address.split(', ')[3]
    end
  end

  def name_incomplete?
    name.nil? || name == ''
  end

  def address_incomplete?
    address.nil? || address == ''
  end

  def sector_incomplete?
    sector.nil? || sector == ''
  end

  def phone_incomplete?
    phone.nil? || phone == ''
  end

  def coordinates_incomplete?
    latitude.nil?
  end

  def company_incomplete?
    name_incomplete? || address_incomplete? || sector_incomplete? || phone_incomplete? || coordinates_incomplete?
  end

  geocoded_by :company_city
  after_validation :geocode, if: :will_save_change_to_address?
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
