require_relative 'produto'
require_relative 'estoque'

estoque = Estoque.new
loop do
    puts "= = = MENU = = ="
    puts "1. Cadastrar novo produto."
    puts "2. Remover produto pelo ID."
    puts "3. Listar todos os produtos."
    puts "4. Adicionar quantidade em estoque."
    puts "5. Salvar todos os produtos."
    puts "6. Carregar produtos salvos anteriormente."
    puts "7. Sair"
    print "Opcao selecionada: "
    option = gets.chomp.to_s
    case option
    when "1"
        estoque.adicionar_produto
    when "2"
        estoque.remover_por_id
    when "3"
        estoque.listar_produtos
    when "4"
        estoque.adicionar_em_estoque
    when "5"
        estoque.salvar_em_json
    when "6"
        estoque.carregar_json
    when "7"
        break
    else
        puts "Opcao invalida, tente denovo"
    end
end
