-- Questão 1: Selecionar todos os livros
SELECT titulo, ano_publicacao FROM livros;

-- Questão 2: Contar livros foram publicados
SELECT COUNT(titulo) FROM livros;

-- Questão 3: Calcular a média do ano de publicação por editora
SELECT editora_id, AVG(ano_publicacao) FROM livros GROUP BY editora_id;

-- Questão 4: Exibir livro mais antigo e mais recente
SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao = (SELECT MIN(ano_publicacao) FROM livros) OR ano_publicacao = (SELECT MAX(ano_publicacao) FROM livros);

-- Questão 5: Listar livros publicados após o ano 2000
SELECT titulo
FROM livros
WHERE ano_publicacao > 2000;

-- Questão 6: Listar autores em ordem alfabética crescente
SELECT *
FROM autores
ORDER BY nome ASC;

-- Questão 7: Listar as editoras que publicaram mais de 2 livros
SELECT
    nome
FROM
    editoras
WHERE editora_id IN (SELECT editora_id FROM livros GROUP BY editora_id HAVING COUNT(livro_id) > 2);

-- Questão 8: Listar os livros disponíveis e emprestados
SELECT l.titulo AS "Título do Livro",
    CASE
        -- Se não houver registro de empréstimo (e.livro_id IS NULL)
        -- OU SE a data de devolução estiver preenchida (e.data_devolucao IS NOT NULL)
        WHEN e.livro_id IS NULL OR e.data_devolucao IS NOT NULL THEN 'Disponível'
        
        -- Caso contrário, se há um registro de empréstimo E a data de devolução está VAZIA
        ELSE 'Emprestado'
    END AS Status
FROM livros l LEFT JOIN emprestimos e ON l.livro_id = e.livro_id ORDER BY l.titulo;

-- Questão 9: Listar o título dos livros com o nome da editora
SELECT l.titulo, a.nome, e.nome
FROM livros l
INNER JOIN autores a ON l.autor_id = a.autor_id
INNER JOIN editoras e ON l.editora_id = e.editora_id;

-- Questão 10: Encontrar todos os livros que não possuem autor cadastrado
SELECT
    l.titulo
FROM
    livros l
LEFT JOIN
    autores a ON l.autor_id = a.autor_id
WHERE
    a.autor_id IS NULL;