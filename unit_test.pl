TESTS FOR STUDENT(SID, SN, House):

student(af, 'Anthony Flynn', gryffindor).
    yes

student(af, Y, Z).
    Y = 'Anthony Flynn'
    Z = gryffindor

student(X, 'Anthony Flynn', Z).
    X = af
    Z = gryffindor

student(X, Y, gryffindor).
    X = hp
    Y = 'Harry James Potter';
    X = hg
    Y = 'Hermione Jean Granger'
    X = rw
    Y = 'Ronald Weasley'
    X = af
    Y = 'Anthony Flynn'

student(rw, 'Ronald Weasley', X).
    X = gryffindor

student(cd, X, hufflepuff).
    X = 'Cedric Diggory'

student(X, 'Draco Malfoy', slytherin).
    X = dm

student(dm, 'Anthony Flynn', slytherin).
    no



TESTS FOR ENROLLED_OPT(SID, SCN):

enrolled_opt(af, creatures).
    yes

enrolled_opt(X, astro).
    no

enrolled_opt(af, muggle).
    no

enrolled_opt(af, random).
    no

enrolled_opt(random, creatures).
    no

enrolled_opt(hp, X).
    X = div
    X = app
    X = quid

enrolled_opt(hg, X).
    X = runes
    X = arith
    X = muggle
    X = creatures
    X = app
    X = quid

enrolled_opt(X, Y).
    --> 42 solutions for X and Y


TESTS FOR ENROLLED_COMP(?SID, ?SCN):

enrolled_comp(af, creatures).
    no

enrolled_comp(af, astro).
    yes

enrolled_comp(X, astro).
    X = hp
    X = hg
    X = rw
    X = af
    X = ll
    X = cc
    X = tb
    X = ha
    X = cd
    X = nt
    X = dm
    X = gg
    X = vc

enrolled_comp(af, muggle).
    no

enrolled_comp(af, random).
    no

enrolled_comp(random, creatures).
    no

enrolled_comp(hp, X).
    X = astro
    X = charms
    X = defence
    X = fly
    X = herb
    X = history
    X = potions
    X = trans

enrolled_comp(hg, X).
    X = astro
    X = charms
    X = defence
    X = fly
    X = herb
    X = history
    X = potions
    X = trans

enrolled_comp(X, Y).
    --> 104 solutions for X and Y



TESTS FOR ENROLLED(?SID, ?SCN):

enrolled(af, creatures).
    yes

enrolled(af, astro).
    yes

enrolled(X, astro).
    X = hp
    X = hg
    X = rw
    X = af
    X = ll
    X = cc
    X = tb
    X = ha
    X = cd
    X = nt
    X = dm
    X = gg
    X = vc

enrolled(af, muggle).
    no

enrolled(af, random).
    no

enrolled(random, creatures).
    no

enrolled(hp, X).
    X = div
    X = app
    X = quid
    X = astro
    X = charms
    X = defence
    X = fly
    X = herb
    X = history
    X = potions
    X = trans

enrolled(hg, X).
    X = runes
    X = arith
    X = muggle
    X = creatures
    X = app
    X = quid
    X = astro
    X = charms
    X = defence
    X = fly
    X = herb
    X = history
    X = potions
    X = trans

enrolled(X, Y).
    --> 146 solutions for X and Y




TESTS FOR TEACHES(?TN, ?SCN):
teaches('Filius Flitwick', charms).
    yes

teaches('Filius Flitwick', astro).
    no

teaches('Filius Flitwick', runes).
    no

teaches('Albus Percival Wulfric Brian Dumbledor', X).
    no

teaches('Madam Hooch', X).
    X = fly
    X = quid

teaches(X, potions).
    X = 'Severus Snape'

teaches(X, muggle).
    X = 'Charity Burbage'

teaches(X, Y).
    X = 'Filius Flitwick'
    Y = charms
    X = 'Minerva McGonagall'
    Y = trans




TESTS FOR TAUGHTBY(?SN, ?TN):

taughtBy('Anthony Flynn', 'Filius Flitwick').
    yes

taughtBy('Anthony Flynn', 'Bathsheba Babbling').
    yes

taughtBy('Anthony Flynn', 'Charity Burbage').
    no

taughtBy(X, 'Quirinus Quirrell').
    X = 'Harry James Potter'
    X = 'Hermione Jean Granger'
    X = 'Ronald Weasley'
    X = 'Anthony Flynn'
    X = 'Luna Lovegood'
    X = 'Cho Chang'
    X = 'Terry Boot'
    X = 'Hannah Abbott'
    X = 'Cedric Diggory'
    X = 'Nymphadora Tonks'
    X = 'Draco Malfoy'
    X = 'Gregory Goyle'
    X = 'Vincent Crabbe'

taughtBy(X, 'Wilkie Twycross').
    X = 'Harry James Potter'
    X = 'Hermione Jean Granger'
    X = 'Anthony Flynn'
    X = 'Luna Lovegood'
    X = 'Cho Chang'
    X = 'Gregory Goyle'
    X = 'Vincent Crabbe'

taughtBy('Cho Chang', X).
    X = 'Filius Flitwick'
    X = 'Minerva McGonagall'
    X = 'Quirinus Quirrell'
    X = 'Severus Snape'
    X = 'Pomona Sprout'
    X = 'Madam Hooch'
    X = 'Aurora Sinistra'
    X = 'Cuthbert Binns'
    X = 'Filius Flitwick'
    X = 'Sibyll Patricia Trelawney'
    X = 'Wilkie Twycross'

taughtBy(X, Y).
    X = 'Harry James Potter'
    Y = 'Filius Flitwick'
    X = etc.



TESTS FOR TAKESOPTION(?SN, ?CN):

takesOption('Anthony Flynn', 'Astronomy').
    no

takesOption('Anthony Flynn', 'Care of Magical Creatures').
    yes

takesOption('Anthony Flynn', 'Quidditch').
    no

takesOption('Hermione Jean Granger', X).
    X = 'Study of Ancient Runes'
    X = 'Arithmancy'
    X = 'Muggle Studies'
    X = 'Care of Magical Creatures'
    X = 'Apparition'
    X = 'Quidditch'

takesOption('Ronald Weasley', Y).
    Y = 'Arithmancy'
    Y = 'Frog Choir'
    Y = 'Quidditch'

takesOption(X, 'Divination').
    X = 'Harry James Potter'
    X = 'Cho Chang'
    X = 'Nymphadora Tonks'
    X = 'Draco Malfoy'
    X = 'Gregory Goyle'
    X = 'Vincent Crabbe'

takesOption(X, Y).
    X = 'Harry James Potter'
    Y = 'Divination'
    etc.



TESTS FOR TAKESALLOPTIONS(?SN, ?OptCourses):

takesAllOptions('Ronald Weasley', X).
    X = ['Arithmancy','Frog Choir','Quidditch']

takesAllOptions(X, ['Arithmancy','Frog Choir','Quidditch']).
    X = 'Ronald Weasley'

takesAllOptions('Ronald Weasley', ['Arithmancy','Frog Choir','Quidditch']).
    yes

takesAllOptions('Ronald Weasley', ['Arithmancy','Divination','Quidditch']).
    no

takesAllOptions('Ronald Weasley', ['Frog Choir','Arithmancy','Quidditch']).
    no

takesAllOptions(X,Y).
    X = 'Harry James Potter'
    Y = ['Apparition','Divination','Quidditch']
    X = 'Hermione Jean Granger'
    Y = [6 entries]
    etc.

takesAllOptions('Not real', X).
    no


TESTS FOR STUDENTSINHOUSE(?HOUSE, ?STUDENTS)

studentsInHouse(gryffindor, X).
    X = ['Anthony Flynn','Hermione Jean Granger','Harry Potter','Ronald Weasley']

studentsInHouse(hufflepuff, X).
    X = ['Cedric Diggory','Hannah Abbott','Nymphadora Tonks']

studentsInHouse(X, Y).
    X = gryffindor
    Y = ['Anthony Flynn','Hermione Jean Granger','Harry James Potter','Ronald Weasley']
    X = hufflepuff
    Y = ['Cedric Diggory','Hannah Abbott','Nymphadora Tonks']
    X = ravenclaw
    Y = ['Cho Chang','Luna Lovegood','Terry Boot']
    X = slytherin
    Y = ['Draco Malfoy','Gregory Goyle','Vincent Crabbe']

studentsInHouse(X, ['Draco Malfoy','Gregory Goyle','Vincent Crabbe']).
    X = slytherin

studentsInHouse(invalid, Y).
    no

studentsInHouse(test, Y).
    Y = []
N.B. NEED TO PASTE THE FOLLOWING:
house(test).



TESTS FOR STUDENTSONCOURSE(?SCN, ?CN, ?STUDENTSBYHOUSE)

studentsOnCourse(astro, 'Astronomy', X).
    X = [gryffindor-['Harry James Potter','Hermione Jean Granger','Ronald Weasley','Anthony Flynn'],hufflepuff-['Hannah Abbott','Cedric Diggory','Nymphadora Tonks'],ravenclaw-['Luna Lovegood','Cho Chang','Terry Boot'],slytherin-['Draco Malfoy','Gregory Goyle','Vincent Crabbe']]

studentsOnCourse(choir, X, Y).
    X = 'Frog Choir'
    Y = [gryffindor-['Ronald Weasley'], hufflepuff-['Cedric Diggory'], ravenclaw-['Cho Chang', 'Terry Boot'], slytherin-[]]

studentsOnCourse(X, 'Muggle Studies', Y).
    X = muggle
    Y = [gryffindor-['Hermione Jean Granger'],hufflepuff-['Hannah Abbott'],ravenclaw-['Terry Boot'],slytherin-['Draco Malfoy']]

studentsOnCourse(X, 'Flying', Y).
    X = fly
    Y = [gryffindor-['Harry James Potter','Hermione Jean Granger','Ronald Weasley','Anthony Flynn'],hufflepuff-['Hannah Abbott','Cedric Diggory','Nymphadora Tonks'],ravenclaw-['Luna Lovegood','Cho Chang','Terry Boot'],slytherin-['Draco Malfoy','Gregory Goyle','Vincent Crabbe']]

studentsOnCourse(history, X, [gryffindor-['Harry James Potter','Hermione Jean Granger','Ronald Weasley','Anthony Flynn'],hufflepuff-['Hannah Abbott','Cedric Diggory','Nymphadora Tonks'],ravenclaw-['Luna Lovegood','Cho Chang','Terry Boot'],slytherin-['Draco Malfoy','Gregory Goyle','Vincent Crabbe']]).
    X - 'History of Magic'

studentsOnCourse(quid, X, [gryffindor-['Harry James Potter','Hermione Jean Granger','Ronald Weasley','Anthony Flynn'],hufflepuff-['Hannah Abbott','Cedric Diggory','Nymphadora Tonks'],ravenclaw-['Luna Lovegood','Cho Chang','Terry Boot'],slytherin-['Draco Malfoy','Gregory Goyle','Vincent Crabbe']]).
    no

studentsOnCourse(quid, X, [gryffindor-['Harry James Potter','Hermione Jean Granger','Ronald Weasley'],hufflepuff-['Hannah Abbott','Nymphadora Tonks'],ravenclaw-[],slytherin-[]]).
    X = 'Quidditch'

studentsOnCourse(X, 'Quidditch', [gryffindor-['Harry James Potter','Hermione Jean Granger','Ronald Weasley'],hufflepuff-['Hannah Abbott','Nymphadora Tonks'],ravenclaw-[],slytherin-[]]).
    X = quid

studentsOnCourse(X, Y, [gryffindor-['Harry James Potter','Hermione Jean Granger','Ronald Weasley'],hufflepuff-['Hannah Abbott','Nymphadora Tonks'],ravenclaw-[],slytherin-[]]).
    X = quid
    Y = 'Quidditch'

studentsOnCourse(random, X, Y).
    no

Paste:
    optCourse(test, 'Testing', mh).

Then:
studentsOnCourse(test, X, Y).
    X = 'Testing'
    Y = [gryffindor-[], hufflepuff-[], ravenclaw-[], slytherin-[]]



TESTS FOR SHAREDCOURSE(?SN1, ?SN2, ?CN)

sharedCourse(X, Y, 'Astronomy').
    no

sharedCourse(X, Y, 'Quidditch').
    X = 'Harry James Potter'
    Y = 'Hermione Jean Granger'
    X = 'Harry James Potter'
    Y = 'Ronald Weasley'
    X = 'Harry James Potter'
    Y = 'Hannah Abbott'
    X = 'Harry James Potter'
    Y = 'Nymphadora Tonks'
    20 total

sharedCourse('Harry James Potter', 'Nymphadora Tonks', X).
    X = 'Divination'
    X = 'Quidditch'

sharedCourse('Hermione Jean Granger', 'Vincent Crabbe', X).
    X = 'Study of Ancient Runes'
    X = 'Apparition'

sharedCourse('Draco Malfoy', 'Luna Lovegood', X).
    no

sharedCourse(X, 'Hannah Abbott', Y).
    X = 'Harry James Potter'
    Y = 'Quidditch'
    X = 'Hermione Jean Granger'
    Y = 'Muggle Studies'
    X = 'Hermione Jean Granger'
    Y = 'Care of Magical Creatures'
    X = 'Hermione Jean Granger'
    Y = 'Quidditch'
    X = 'Ronald Weasley'
    Y = 'Quidditch'
    X = 'Anthony Flynn'
    Y = 'Care of Magical Creatures'
    X = 'Luna Lovegood'
    Y = 'Care of Magical Creatures'
    X = 'Terry Boot'
    Y = 'Muggle Studies'
    X = 'Cedric Diggory'
    Y = 'Care of Magical Creatures'
    X = 'Nymphadora Tonks'
    Y = 'Care of Magical Creatures'
    X = 'Nymphadora Tonks'
    Y = 'Quidditch'
    X = 'Draco Malfoy'
    Y = 'Muggle Studies'

sharedCourse('Hannah Abbott', X, Y).
    X = 'Harry James Potter'
    Y = 'Quidditch'
    X = 'Hermione Jean Granger'
    Y = 'Muggle Studies'
    X = 'Hermione Jean Granger'
    Y = 'Care of Magical Creatures'
    X = 'Hermione Jean Granger'
    Y = 'Quidditch'
    X = 'Ronald Weasley'
    Y = 'Quidditch'
    X = 'Anthony Flynn'
    Y = 'Care of Magical Creatures'
    X = 'Luna Lovegood'
    Y = 'Care of Magical Creatures'
    X = 'Terry Boot'
    Y = 'Muggle Studies'
    X = 'Cedric Diggory'
    Y = 'Care of Magical Creatures'
    X = 'Nymphadora Tonks'
    Y = 'Care of Magical Creatures'
    X = 'Nymphadora Tonks'
    Y = 'Quidditch'
    X = 'Draco Malfoy'
    Y = 'Muggle Studies'

sharedCourse(X, 'Harry James Potter', 'Arithmancy').
    no

sharedCourse(X, 'Ronald Weasley', 'Quidditch').
    X = 'Harry James Potter'
    X = 'Hermione Jean Granger'
    X = 'Hannah Abbott'
    X = 'Nymphadora Tonks'

sharedCourse('Ronald Weasley', X, 'Quidditch').
    X = 'Harry James Potter'
    X = 'Hermione Jean Granger'
    X = 'Hannah Abbott'
    X = 'Nymphadora Tonks'


TESTS FOR SAMEOPTIONS(?SN1, ?SN2, ?Courses).

allCoursesShared('Harry James Potter', X, Y).
    no

allCoursesShared('Gregory Goyle', X, Y).
    X = 'Vincent Crabbe'
    Y = ['Study of Ancient Runes', 'Divination', 'Apparition']
    6 times (different combinations of 3 subjects).
    
allCoursesShared(X, 'Gregory Goyle', Y).
    X = 'Vincent Crabbe'
    Y = ['Study of Ancient Runes', 'Divination', 'Apparition']
    6 times (different combinations of 3 subjects).

allCoursesShared('Hermione Jean Granger', X, ['Care of Magical Creatures','Apparition','Study of Ancient Runes']).
    X = 'Anthony Flynn'
    X = 'Luna Lovegood'

allCoursesShared('Vincent Crabbe', 'Gregory Goyle', Y).
    Y = ['Study of Ancient Runes', 'Divination', 'Apparition']
    6 times (different combinations of 3 subjects).



sameOptions('Anthony Flynn', Y, Z).
    Y = 'Luna Lovegood'
    Z = ['Care of Magical Creatures','Apparition','Study of Ancient Runes'])
    Y = 'Hermione Jean Granger'
    Z = ['Care of Magical Creatures','Apparition','Study of Ancient Runes'])

sameOptions('Anthony Flynn', 'Harry James Potter', Z).
    no

sameOptions(X, 'Harry James Potter', Z).
    no

sameOptions(X, Y, ['Apparition', 'Study of Ancient Runes', 'Divination']).
    X = 'Gregory Goyle'
    Y = 'Vincent Crabbe'

sameOptions('Gregory Goyle', X, ['Apparition', 'Study of Ancient Runes', 'Divination']).
    Y = 'Vincent Crabbe'
