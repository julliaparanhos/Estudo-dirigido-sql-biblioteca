-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca; 

-- Tabela de Autores
CREATE TABLE IF NOT EXISTS autores (
	autor_id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	nacionalidade VARCHAR(50)
);

  
-- Tabela de Editoras
CREATE TABLE IF NOT EXISTS editoras (
	editora_id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cidade VARCHAR(50)
);
  

-- Tabela de Livros
CREATE TABLE IF NOT EXISTS livros (
	livro_id INT AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(200) NOT NULL,
	ano_publicacao INT,
	isbn VARCHAR(20) UNIQUE,
	autor_id INT,
	editora_id INT,
	FOREIGN KEY (autor_id) REFERENCES autores(autor_id),
	FOREIGN KEY (editora_id) REFERENCES editoras(editora_id)
);
  

-- Tabela de Membros (leitores)
CREATE TABLE IF NOT EXISTS membros (
	membro_id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	endereco VARCHAR(200),
	telefone VARCHAR(20),
	email VARCHAR(100) UNIQUE
);
  

-- Tabela de Empréstimos
CREATE TABLE IF NOT EXISTS emprestimos (
	emprestimo_id INT AUTO_INCREMENT PRIMARY KEY,
	livro_id INT,
	membro_id INT,
	data_emprestimo DATE NOT NULL,
	data_devolucao DATE,
	FOREIGN KEY (livro_id) REFERENCES livros(livro_id),
	FOREIGN KEY (membro_id) REFERENCES membros(membro_id)
);


-- Inserção de dados de exemplo

-- Autores
INSERT INTO autores (nome, nacionalidade) VALUES
('Machado de Assis', 'Brasileira'),
('Clarice Lispector', 'Brasileira'),
('George Orwell', 'Britânica'),
('Jane Austen', 'Britânica'),
('Gabriel García Márquez', 'Colombiana');
  
-- Editoras
INSERT INTO editoras (nome, cidade) VALUES
('Companhia das Letras', 'São Paulo'),
('Editora Rocco', 'Rio de Janeiro'),
('Penguin Books', 'Londres'),
('HarperCollins', 'Nova Iorque');
  
-- Livros
INSERT INTO livros (titulo, ano_publicacao, isbn, autor_id, editora_id) VALUES
('Dom Casmurro', 1899, '978-8535902778', 1, 1),
('Memórias Póstumas de Brás Cubas', 1881, '978-8535905205', 1, 1),
('A Hora da Estrela', 1977, '978-8535908022', 2, 2),
('1984', 1949, '978-8535902771', 3, 3),
('Orgulho e Preconceito', 1813, '978-8535902772', 4, 3),
('Cem Anos de Solidão', 1967, '978-8535902773', 5, 2),
('Ensaio sobre a Cegueira', 1995, '978-8535902774', NULL, 1); -- Livro sem autor cadastrado

INSERT INTO livros (titulo, ano_publicacao, isbn, autor_id, editora_id) VALUES
('O Alienista', 1882, '978-8535902775', 1, 1);
  
-- Membros
INSERT INTO membros (nome, endereco, telefone, email) VALUES
('Maria Silva', 'Rua das Flores, 123', '11987654321', 'maria.silva@email.com'),
('João Souza', 'Avenida Principal, 456', '21998765432', 'joao.souza@email.com'),
('Ana Paula', 'Rua Secundária, 789', '31987654321', 'ana.paula@email.com');
  

-- Empréstimos
INSERT INTO emprestimos (livro_id, membro_id, data_emprestimo, data_devolucao) VALUES
(1, 1, '2023-01-10', '2023-01-20'),
(3, 2, '2023-01-15', '2023-01-25'),
(2, 1, '2023-02-01', NULL), -- Livro ainda não devolvido
(4, 3, '2023-02-05', '2023-02-15');sys_config