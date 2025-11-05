SELECT
    l.titulo
FROM
    livros l
LEFT JOIN
    autores a ON l.autor_id = a.autor_id
WHERE
    a.autor_id IS NULL;