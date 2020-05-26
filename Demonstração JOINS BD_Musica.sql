# Consulta que retorna o id  e nome dos usuários que reproduziram alguma música de um determinado cantor, o nome desse cantor, a duração da música, a gravadora e o ano em que a música foi lançada.
SELECT u.idusuario, u.nome, m.musica, a.nomeArtista AS artista, m.duracao, g.nomeGravadora AS gravadora, m.ano FROM usuario u
JOIN usuario_reproduz_musica ur ON ur.idusuario = u.idusuario
JOIN musica m ON m.idmusica = ur.idmusica 
JOIN gravadora_grava_musica gg ON gg.idmusica = m.idmusica
JOIN gravadora g ON g.idgravadora = gg.idgravadora 
JOIN musica_pertence_artista mp ON m.idmusica = mp.idmusica 
JOIN artista a ON a.idartista = mp.idartista 
where a.nomeartista like '%Gusttavo Lima%'
ORDER BY u.idUsuario, u.nome ASC 
;

# Consulta que retorna todas as músicas do banco contendo o nome, ano, duração, gênero musical e origem.
 
SELECT m.musica, m.ano, m.duracao, gm.nomeGenero AS "gênero musical", o.descOrigem AS "origem" FROM musica m 
JOIN origem o ON o.idOrigem = m.idOrigem
JOIN genero_musical gm ON gm.idGenero_musical = m.idGenero
ORDER BY m.idmusica;

SELECT u.nome, m.musica, m.ano, m.duracao FROM usuario u 
LEFT JOIN usuario_reproduz_musica ur ON ur.idusuario = u.idusuario 
LEFT JOIN musica m ON m.idmusica = ur.idmusica
ORDER BY m.musica;

SELECT a.nomeArtista AS artista, m.musica, m.ano, m.duracao FROM musica m
RIGHT JOIN musica_pertence_artista mp ON mp.idmusica = m.idmusica 
RIGHT JOIN artista a ON a.idartista = mp.idartista 
ORDER BY m.musica;


