CREATE TABLE artista(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(20) UNIQUE
);

INSERT INTO artista (nome) VALUES
('Tom Jobia'),
('Elis Regina');

CREATE TABLE musica(
    id SERIAL PRIMARY KEY, 
    nome VARCHAR(30) NOT NULL,
    duracao_seg INT NOT NULL
);

INSERT INTO musica (nome, duracao_seg) VALUES ('Aguas de Março', 210);
INSERT INTO musica (nome, duracao_seg) VALUES ('Garota de Ipanema', 120);

CREATE TABLE artista_musica(
    fk_id artista INT NOT NULL,
    fk_id musica INT NOT NULL,
    CONSTRAINT artista_musica_pk PRIMARY KEY (fk_id_artista, fk_id_musica),
    CONSTRAINT fk_artista FOREIGN KEY (fk_id_artista) REFERENCES artista(ID),
    CONSTRAINT fk_musica FOREIGN KEY (fk_id_musica) REFERENCES musica(ID),
)

INSERT INTO artista_musica(fk_id_artista, fk_id_musica) VALUES 
(1,1),
(1,2),
(2,1),
(2,2)

SELECT * FROM artista_musica