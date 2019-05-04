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

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
