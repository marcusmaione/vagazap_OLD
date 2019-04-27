class Job < ApplicationRecord
  JOBPOSITIONS = ["Açougueira(o)", "Ajudante", "Analista", "Assistente", "Atendente", "Auxiliar",
                  "Balconista", "Barista", "Barman", "Cabeleireira(o)", "Caixa", "Carpinteira(o)",
                  "Consultor(a)", "Coordenador(a)", "Copeira(o)", "Corretor(a)", "Cozinheira(o)",
                  "Desenvolvedor(a)", "Diretor(a)", "Eletricista", "Empregada(o) Doméstica(o)",
                  "Encanador(a)", "Entregador(a) ou Motoboy", "Especialista", "Estagiária(o)",
                  "Esteticista", "Estoquista", "Faxineira(o)", "Fiscal", "Frentista", "Garçom / Garçonete",
                  "Gerente", "Inspetor(a)", "Instalador(a)", "Jardineira(o)", "Lavador(a) ou Limpador(a)",
                  "Manobrista", "Maquiadora(o)", "Mecânica(o)", "Motorista", "Operador(a)",
                  "Operador(a) de Máquinas", "Padeira(o)", "Pedreira(o)", "Peixeira(o)", "Pintor(a)",
                  "Pizzaiola(o)", "Porteira(o)", "Promotor(a)", "Recepcionista", "Reparador(a)",
                  "Repositor(a)", "Representante", "Secretária(o)", "Segurança", "Supervisor(a)",
                  "Sushiman", "Técnica(o)", "Terapeuta", "Trainee", "Vendedor(a)",
                  "Zelador(a)"].freeze
  JOBSECTORS = ["Administrativo", "Atendimento e Recepção", "Contábil", "Comercial / Marketing",
                "Departamento Pessoal", "Estoque", "Financeiro", "Manutenção", "Operacional",
                "Planejamento", "Produção", "Projetos", "Recursos Humanos", "Serviços Gerais",
                "Suporte e Apoio Operacional", "Transporte e Logística", "Vendas"].freeze
  SALARYRANGES = ["998 a 1.500", "1.501 a 2.000", "2.000 a 3.000", "3.001 a 4.000",
                  "4.001 a 6.000", "6.001 a 8.000", "8.001 a 10.000", "acima de 10.000",
                  "a combinar"].freeze
  belongs_to :company
  has_many :favorites, :dependent => :destroy
end
