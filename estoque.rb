require 'json'

class Estoque
    def initialize
        @estoque = []
        carregar_json
    end

    def adicionar_produto
    puts "Digite o nome do produto:"
    p_nome = gets.chomp

    puts "Digite o ID do produto:"
    p_id = gets.chomp.to_i

    puts "Digite o preco do produto:"
    p_preco = gets.chomp.to_f

    puts "Digite a quantidade do produto:"
    p_quantidade = gets.chomp.to_i

    puts "Digite a categoria do produto:"
    p_categoria = gets.chomp

    produto = Produto.new(
      p_id,
      p_nome,
      p_preco,
      p_quantidade,
      p_categoria
    )

    @estoque << produto
    end

    def listar_produtos
        @estoque.each do |produto|
                puts "Identificador: #{produto.id}"
                puts "Nome: #{produto.nome}"
                puts "Preço: R$#{produto.preco}"
                puts "Quantidade em estoque: #{produto.quantidade}"
                puts "Categoria: #{produto.categoria}"
                puts "-------------------------"
        end
    end

    def remover_por_id
        if @estoque.empty?
            puts "Estoque vazio!"
            return
        else
            @estoque.each do |produto|
                puts "Identificador: #{produto.id}"
                puts "Nome: #{produto.nome}"
                puts "Preço: R$#{produto.preco}"
                puts "Quantidade em estoque: #{produto.quantidade}"
                puts "Categoria: #{produto.categoria}"
                puts "-------------------------"
            end
        end
        puts "Qual produto deseja remover: "
        item_id = gets.chomp.to_i
        
        @estoque.delete_if do |produto|
        produto.id == item_id
        end
    end

    def salvar_em_json
        dados = @estoque.map do |produto|
            produto.to_hash
        end
        File.write("estoque.json", JSON.pretty_generate(dados))

        puts "Estoque salvo com sucesso!"
    end

    def carregar_json
        return unless File.exist?("estoque.json")

        conteudo = File.read("estoque.json")

        return if conteudo.strip.empty?

        dados = JSON.parse(conteudo)

        @estoque = dados.map do |item|
            Produto.new(
            item["id"],
            item["nome"],
            item["preco"],
            item["quantidade"],
            item["categoria"]
            )
        end

    puts "Estoque carregado com sucesso!"
    end




    def adicionar_em_estoque
        if @estoque.empty?
            puts "Estoque vazio!"
            return
        else
            @estoque.each do |produto|
                puts "Identificador: #{produto.id}"
                puts "Nome: #{produto.nome}"
                puts "Preço: R$#{produto.preco}"
                puts "Quantidade em estoque: #{produto.quantidade}"
                puts "Categoria: #{produto.categoria}"
                puts "-------------------------"
            end
        end
        puts "Qual ID do produto que deseja adicionar: "
        item_id = gets.chomp.to_i
        puts "Qual a quatidade de itens deseja adicionar: "
        item_qtd = gets.chomp.to_i
        
        produto = @estoque.find do |p|
            p.id == item_id
        end
            if produto
                produto.quantidade += item_qtd
                puts "Estoque atualizado com sucesso!"
            else
                puts "Produto nao encontrado!"
            end
    end
end