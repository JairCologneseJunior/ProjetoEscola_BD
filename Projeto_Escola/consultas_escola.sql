-- Produza um relatório que contenha os dados dos alunos matriculados em todos os cursos oferecidos pela escola.
SELECT ALUNO.CPF, ALUNO.Nome, ALUNO.Endereco, ALUNO.Telefone, ALUNO.Data_Nasc, CURSO.Nome, MATRICULA.Data_Matricula
FROM ALUNO
INNER JOIN MATRICULA ON ALUNO.CPF = MATRICULA.CPF_Aluno
INNER JOIN CURSO ON MATRICULA.Codigo_curso = CURSO.Codigo;

--Produza um relatório com os dados de todos os cursos, com suas respectivas disciplinas, oferecidos pela escola.
SELECT CURSO.Codigo, CURSO.Nome, CURSO.Descricao, DISCIPLINA.nome
FROM CURSO
INNER JOIN COMPOE ON CURSO.Codigo = COMPOE.Codigo_Curso
INNER JOIN DISCIPLINA ON DISCIPLINA.Codigo = COMPOE.Codigo_Disc;

--Produza um relatório que contenha o nome dos alunos e as disciplinas em que  estão matriculados.
SELECT ALUNO.Nome, DISCIPLINA.nome
FROM DISCIPLINA
INNER JOIN CURSA ON DISCIPLINA.Codigo = CURSA.Codigo_Disc
INNER JOIN ALUNO ON CURSA.CPF_Aluno = ALUNO.CPF;

--Produza um relatório com os dados dos professores e as disciplinas que ministram.
SELECT P.Matricula, P.Nome, P.Endereco, P.Telefone, P.Data_Nasc, P.Codigo_Depto, P.Data_Contratacao, DISCIPLINA.nome 
FROM PROFESSOR as P
LEFT JOIN DISCIPLINA ON P.Matricula = DISCIPLINA.Matricula_Prof;

