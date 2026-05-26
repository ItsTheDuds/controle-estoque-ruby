class Produto
    attr_accessor :id, :nome, :preco, :quantidade, :categoria

    def initialize(id, nome, preco, quantidade, categoria)
        @id = id
        @nome = nome
        @preco = preco
        @quantidade = quantidade
        @categoria = categoria
    end

    def to_hash
    {
      id: @id,
      nome: @nome,
      preco: @preco,
      quantidade: @quantidade,
      categoria: @categoria
    }
    end

end