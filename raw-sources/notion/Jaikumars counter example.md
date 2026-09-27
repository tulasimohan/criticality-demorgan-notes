# Jaikumars counter example

#### JKR’s email 

I have an ad hoc suggestion.

As we build our decision trees, we set variables and consider the remaining formula subject to the setting of variables under the current path.  If at some point while building the decision tree, we notice that a variable x has no influence on the final output,

then set x to 0 in the formula. For the rest proceed as before, that is, implement the purple line with no collapsing.

If we do this on (X or Y) and Y-bar, we first examine ell1. If it is 0, we consider the rest of the formula and notice that Y has no influence anymore; the output is 1. If X is 1, we proceed to examine ell2. The resulting decision tree after balancing looks like this.

(ell1 (ell3 0 0) (ell3 0 1))

In this decision tree the last litteral ell3 will be discovered if KW is run with ell1 set to a1= 1.

Regards,

Jaikumar

The Formula

$\Gamma $ = CDT of $F_1$

0- balancing $\Gamma$

CDT of $F$ with balancing

CDT of $F$ without balancing 

- Apply the purple line strictly and don't collapse: Once we are done with $F_1$, both variables X and Y will have been queried on all paths. In particular, the literal ell3 will never make an appearance in the tree. The decision tree will look like

- Apply the purple line and collapse: If I am interpreting the proposal correctly, then we are left with a decision tree

(ell1 (ell2 0  0) (ell2 1 0))

- No assignment to $x$ will ever lead KW to $\ell_2$.

(ell1 (ell2 0 0) (ell3 0 1))

Again, ell2 is in the decision tree, but it will not be discovered by KW.

The literal ell2 is in the decision tree, but KW cannot find it.
