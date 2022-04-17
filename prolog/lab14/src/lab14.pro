DOMAINS 
	name = symbol.
	sex = symbol.
	
PREDICATES
	% parent(child, parent, parent_sex)
	parent(name, name, sex).
	% grandparent(child, grandparent, parent_sex, grandparent_sex)
	grandParent(name, name, sex, sex).
	
CLAUSES
	parent(child_a, mother_a, w).
	parent(child_a, father_a, m).
	parent(mother_a, mother_of_mother_a, w).
	parent(mother_a, father_of_mother_a, m).
	parent(father_a, mother_of_father_a, w).
	parent(father_a, father_of_father_a, m).
	
	parent(child_b, mother_b, w).
	parent(mother_b, father_of_mother_b, m).
	
	grandParent(Child_, GrandParent_, ParentSex_, GrandParentSex_) :- 
			parent(Child_, Parent_, ParentSex_), 
			parent(Parent_, GrandParent_, GrandParentSex_).
	
		
GOAL
	% 1 - all grandMothers
	% grandParent(child_a, GrandMother, _, w).
	% GrandMother=mother_of_mother_a
	% GrandMother=mother_of_father_a
	% 2 Solutions
	% grandParent(child_b, GrandMother, _, w).
	% No Solution
	
	% 2 - all grandFathers
	% grandParent(child_a, GrandFather, _, m).
	% GrandFather=father_of_mother_a
	% GrandFather=father_of_father_a
	% 2 Solutions
	
	% 3 - all grandParents
	% grandParent(child_a, GrandParent, _, _).
	% GrandParent=mother_of_mother_a
	% GrandParent=father_of_mother_a
	% GrandParent=mother_of_father_a
	% GrandParent=father_of_father_a
	% 4 Solutions
	
	% 4 - mother of mother
	% grandParent(child_a, MothersMother, w, w).
	% MothersMother=mother_of_mother_a
	% 1 Solution
	
	% 5 - mother and father of mother
	grandParent(child_b, ParentOfMother, w, _).
	% ParentOfMother=father_of_mother_b
	% 1 Solution