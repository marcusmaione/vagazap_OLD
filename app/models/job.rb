class Job < ApplicationRecord
  JOBPOSITIONS = ["Açougueira(o)", "Ajudante", "Analista", "Assistente", "Atendente", "Auxiliar",
                  "Balconista", "Barista", "Barman", "Caixa", "Carpinteira(o)", "Consultor(a)",
                  "Coordenador(a)", "Copeira(o)", "Corretor(a)", "Cozinheira(o)", "Diretor(a)",
                  "Eletricista", "Empregado(a) Doméstico(a)", "Encanador(a)", "Entregador(a) ou Motoboy",
                  "Especialista", "Estagiária(o)", "Estoquista", "Faxineira(o)", "Fiscal", "Frentista",
                  "Garçom / Garçonete", "Gerente", "Jardineira(o)", "Lavador(a) ou Limpador(a)",
                  "Manobrista", "Mecânica(o)", "Motorista", "Operador(a)", "Operador(a) de Máquinas",
                  "Padeira(o)", "Pedreira(o)", "Peixeira(o)", "Pintor(a)", "Pizzaiola(o)", "Porteira(o)",
                  "Promotor(a)", "Recepcionista", "Repositor(a)", "Secretária(o)", "Segurança",
                  "Supervisor(a)", "Sushiman", "Técnica(o)", "Terapeuta", "Trainee", "Vendedor(a)",
                  "Zelador(a)"].freeze
  JOBSECTORS = ["Administrativo", "Atendimento e Recepção", "Contábil", "Comercial / Marketing",
                "Departamento Pessoal", "Estoque", "Financeiro", "Manutenção", "Operacional",
                "Planejamento", "Produção", "Projetos", "Recursos Humanos", "Serviços Gerais",
                "Suporte e Apoio Operacional", "Transporte e Logística", "Vendas"].freeze
  belongs_to :company
  has_many :favorites, :dependent => :destroy
end
