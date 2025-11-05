SELECT l.titulo AS "Título do Livro",
    CASE
        WHEN e.livro_id IS NULL OR e.data_devolucao IS NOT NULL THEN 'Disponível'
        ELSE 'Emprestado'
    END AS Status
FROM livros l LEFT JOIN emprestimos e ON l.livro_id = e.livro_id ORDER BY l.titulo;