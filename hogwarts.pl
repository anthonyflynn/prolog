%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MSc in Magic at Hogwarts School of Witchcraft and Wizardry
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% the students in Hogwarts
student(hp, 'Harry James Potter', gryffindor).
student(hg, 'Hermione Jean Granger', gryffindor).
student(rw, 'Ronald Weasley', gryffindor).
student(af, 'Anthony Flynn', gryffindor).
student(ll, 'Luna Lovegood', ravenclaw).
student(cc, 'Cho Chang', ravenclaw).
student(tb, 'Terry Boot', ravenclaw).
student(ha, 'Hannah Abbott', hufflepuff).
student(cd, 'Cedric Diggory', hufflepuff).
student(nt, 'Nymphadora Tonks',hufflepuff).
student(dm, 'Draco Malfoy', slytherin).
student(gg, 'Gregory Goyle', slytherin).
student(vc, 'Vincent Crabbe', slytherin).

% the teachers in Hogwarts
teacher(ad, 'Albus Percival Wulfric Brian Dumbledore').
teacher(ff, 'Filius Flitwick').
teacher(rh, 'Rubeus Hagrid').
teacher(gl, 'Gilderoy Lockhart').
teacher(rl, 'Remus John Lupin').
teacher(mm, 'Minerva McGonagall').
teacher(qq, 'Quirinus Quirrell').
teacher(ss, 'Severus Snape').
teacher(ps, 'Pomona Sprout').
teacher(st, 'Sibyll Patricia Trelawney').
teacher(mh, 'Madam Hooch').
teacher(as, 'Aurora Sinistra').
teacher(cub, 'Cuthbert Binns').
teacher(bb, 'Bathsheba Babbling').
teacher(sv, 'Septima Vector').
teacher(chb, 'Charity Burbage').
teacher(wt, 'Wilkie Twycross').

% compulsory courses for the MSc in Magic
compCourse(astro, 'Astronomy', as).
compCourse(charms, 'Charms', ff).
compCourse(defence, 'Defence against the Dark Arts', qq).
compCourse(fly, 'Flying', mh).
compCourse(herb, 'Herbology', ps).
compCourse(history, 'History of Magic', cub).
compCourse(potions, 'Potions', ss).
compCourse(trans, 'Transfiguration', mm).

% optional courses for the MSc in Magic
optCourse(runes, 'Study of Ancient Runes', bb).
optCourse(arith, 'Arithmancy', sv).
optCourse(muggle, 'Muggle Studies', chb).
optCourse(creatures, 'Care of Magical Creatures', rh).
optCourse(div, 'Divination', st).
optCourse(app, 'Apparition', wt).
optCourse(choir, 'Frog Choir', ff).
optCourse(quid, 'Quidditch', mh).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% enrolled options for the MSc in Magic - ordered depth first
enrolled_opt(hp, div).
enrolled_opt(hp, app).
enrolled_opt(hp, quid).
enrolled_opt(hg, runes).
enrolled_opt(hg, arith).
enrolled_opt(hg, muggle).
enrolled_opt(hg, creatures).
enrolled_opt(hg, app).
enrolled_opt(hg, quid).
enrolled_opt(rw, arith).
enrolled_opt(rw, choir).
enrolled_opt(rw, quid).
enrolled_opt(af, runes).
enrolled_opt(af, creatures).
enrolled_opt(af, app).
enrolled_opt(ll, runes).
enrolled_opt(ll, creatures).
enrolled_opt(ll, app).
enrolled_opt(cc, div).
enrolled_opt(cc, app).
enrolled_opt(cc, choir).
enrolled_opt(tb, runes).
enrolled_opt(tb, muggle).
enrolled_opt(tb, choir).
enrolled_opt(ha, muggle).
enrolled_opt(ha, creatures).
enrolled_opt(ha, quid).
enrolled_opt(cd, arith).
enrolled_opt(cd, creatures).
enrolled_opt(cd, choir).
enrolled_opt(nt, creatures).
enrolled_opt(nt, div).
enrolled_opt(nt, quid).
enrolled_opt(dm, arith).
enrolled_opt(dm, muggle).
enrolled_opt(dm, div).
enrolled_opt(gg, runes).
enrolled_opt(gg, div).
enrolled_opt(gg, app).
enrolled_opt(vc, runes).
enrolled_opt(vc, app).
enrolled_opt(vc, div).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% enrolled_comp(?SID, ?SCN) means that the student with magical ID SID is 
% enrolled on the compulsory course with short name SCN

enrolled_comp(SID, SCN):-
    student(SID, _, _),
    compCourse(SCN, _, _).


% enrolled(?SID, ?SCN) means that the student with magical ID SID is enrolled 
% on the course with short course name SCN

enrolled(SID, SCN):-
    enrolled_opt(SID, SCN).

enrolled(SID, SCN):-
    enrolled_comp(SID, SCN).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% teaches(?TN, ?SCN) means that the teacher with name TN teaches the magical 
% course with short name SCN.

teaches(TN, SCN):-
    teacher(TID, TN),
    compCourse(SCN, _, TID).

teaches(TN, SCN):-
    teacher(TID, TN),
    optCourse(SCN, _, TID).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% taughtBy(?SN, ?TN) means the student SN is enrolled on a magic course that 
% is taught by TN.

taughtBy(SN, TN):-
    student(SID, SN, _),
    teaches(TN, SCN),
    enrolled(SID, SCN).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% takesOption(?SN, ?CN) means the student SN is enrolled on the optional 
% course CN

takesOption(SN, CN):-
    student(SID, SN, _),
    optCourse(SCN, CN, _),
    enrolled_opt(SID, SCN).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% takesAllOptions(?SN, ?OptCourses) - OptCourses is the list of all magical 
% courses the student SN is enrolled on (alphabetical order).

takesAllOptions(SN, OptCourses):-
    setof(CN, takesOption(SN, CN), OptCourses).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q8 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% facts to define the houses.

house(gryffindor).
house(hufflepuff).
house(ravenclaw).
house(slytherin).


% student_house(?House, ?StudentHouse) collects students from a particular 
% House into an unsorted list StudentHouse.

student_house(House, StudentHouse):-
    house(House),
    findall(SID, student(SID, _, House), StudentHouse).


% change_SID_SN(+SID_List,-SN_List) takes in a list of student SIDs and
% outputs the equivalent list of SNs (i.e. student names).

change_SID_SN([],[]).
change_SID_SN([SID|T1], [SN|T2]):-
    student(SID, SN, _),
    change_SID_SN(T1,T2).


% studentsInHouse(?House, ?Students) - Students is the list of student names 
% of all students in a particular House, sorted alphabetically (by SID).

studentsInHouse(House, Students):-
    student_house(House, StudentHouse),
    sort(StudentHouse, StudentHouseAlphabetised),
    change_SID_SN(StudentHouseAlphabetised,Students).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q9 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% student_enrolled(?SN, ?SCN, ?House) means that student SN in House is 
% enrolled on course SCN

student_enrolled(SN, SCN, House):-
    student(SID, SN, House),
    enrolled(SID, SCN).


% list_students_on_course(+SCN, +House, -List) creates a list, List which 
% contains all students in a particular House studying a course SCN. %

list_students_course_house(SCN, House, List):-
    findall(SN, student_enrolled(SN, SCN, House), List).


% studentsOnCourse(?SCN, ?CN, ?StudentsByHouse) - for a magical course CN with
% short course name SCN (compulsory or optional), the list StudentsByHouse has 
% 4 elements of the form House-Students, one for each house */

studentsOnCourse(SCN, CN, StudentsByHouse):-
    (compCourse(SCN, CN, _);
    optCourse(SCN, CN, _)),
    StudentsByHouse=[gryffindor-L1, hufflepuff-L2, ravenclaw-L3, slytherin-L4],
    list_students_course_house(SCN, gryffindor, L1),
    list_students_course_house(SCN, hufflepuff, L2),
    list_students_course_house(SCN, ravenclaw, L3),
    list_students_course_house(SCN, slytherin, L4).    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q10 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% sharedCourse(?SN1, ?SN2, ?CN) - the optional magic course with name CN is 
% taken by two different students with names SN1 and SN2

sharedCourse(SN1, SN2, CN):-
    takesOption(SN1, CN),
    takesOption(SN2, CN),
    SN1 \= SN2.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Q10 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% allCoursesShared(SN1, SN2, CourseList) produces a list (CourseList) of all 
% the courses shared by students SN1 and SN2.

allCoursesShared(SN1, SN2, CourseList):-
    sharedCourse(SN1, SN2, CN1),
    sharedCourse(SN1, SN2, CN2),
    sharedCourse(SN1, SN2, CN3),
    CN1 \= CN2,
    CN2 \= CN3,
    CN1 \= CN3,
    SN1 \= SN2,
    CourseList = [CN1, CN2, CN3].


% member_of_list(+List1, -List2) checks to see if the first element (List1) is % contained in the second (List2).  If it finds a match, it does not look for 
% more matches.

member_of_list(List1, List2):-
    member(List1, List2),!.


% sameOptions(?SN1, ?SN2, ?Courses) - two different students are enrolled
% on exactly the same three optional courses, which form a list (Courses) of
% course names. For Hermione, sameOptions if 3 of her 6 magical courses match

sameOptions(SN1, SN2, Courses):-
    setof(CourseList, allCoursesShared(SN1, SN2, CourseList), CourseDup),
    member_of_list(Courses, CourseDup).
