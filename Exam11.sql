--1. Academy databazasını yaradın - 2 bal
Create Database Academy

Use Academy
--2. Groups(İd,Name) ve Students(İd,Name,Surname,Groupİd) table-ları yaradın(one-to-many),
--tekrar qrup adı əlavə etmək olmasın - 5 bal

Create Table Groups
(
	ID int primary key identity,
	Name nvarchar(50) Not Null Unique
)

Create Table Students
(
	ID int primary key identity,
	Name nvarchar(50),
	SurName nvarchar(50),
)

Alter Table Students
Add GroupId int Not Null Foreign Key References Groups(ID)

--3. Students table-na Grade (int) kalonunu əlavə etmək - 3 bal

Alter Table Students
Add Grade int

--4. Groups table-na 3 data(P129,P124,P221), Students table-na 4 data əlavə edin(1 tələbə p221 qrupna, 3 tələbə p129 qrupuna aid olsun) - 5 bal

INSERT INTO Groups
VALUES
(P129),
(P124),
(P221)

INSERT INTO Groups
VALUES
(Murad, Hagverdi, 3),
(Vusal, Aliyev, 1),
(Togrus, Hagverdi, 1),
(Leyla, Hagverdi, 1),


--5. P129 qrupuna aid olan tələbələrin siyahisini gosterin - 10 bal

Select Students.GroupId '1', From Students

--6. Her qrupda neçə tələbə olduğunu göstərən siyahı çıxarmaq - 15 bal

Select Groups.Name From Groups


--7. View yaratmaq - tələbə adını, qrupun adını-qrup kimi , tələbə soyadını, tələbənin balını göstərməli - 20 bal

Create View usv_GetAllStudents
as
Select (Name+' '+SurName+''+GroupId+' '+Grade) 'Info' from Students
Union All
Select Info from Students
--8. Procedure yazmalı - göndərilən baldan yüksək bal alan tələbələrin siyahısını göstərməlidir - 20 bal

Create Procedure usp_MaxGrades
As
Begin
	Declare int
	Select COUNT(Distinct Grade) From usv_GetAllStudents where LEN(Grade) > @count
End

--9. Funksiya yazmalı - göndərilən qrup adina uyğun neçə tələbə olduğunu göstərməlidir - 20 bal

Create Function usf_GetCount
returns int
As
Begin
	declare  int

	Select @mycount = COUNT(Distinct FullName) From usv_GetAllStudents 
	where LEN(FullName) > @count 

	return @mycount 
End
