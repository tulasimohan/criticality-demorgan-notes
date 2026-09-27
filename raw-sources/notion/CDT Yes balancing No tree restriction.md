# CDT Yes balancing No tree restriction

Let $F = F_1 \vee F_2$ be a DeMorgan fomula and $\rho$ be a restriction.   

Canonical decision tree constructor 

Input: DeMorgan formula $\rm F$ and a restriction $\rho$.   

Base cases:

Recursive case:  $\rm F = F_1 \vee F_2$.

     else If  $\rm F|_\rho$ is non-constant:

The case when $\rm F = F_1 \wedge F_2$ can be  handled similarly.  

Ensures: for every $0$- path, there exists a corresponding $1$-path

For  $d =$ $\rm depth(\Gamma)$ to $1$:

Process leaves at depth $d$:

If ${\rm F}|_\rho \equiv \rm constant$ :

If $\rm F$ is a single literal ($x_i$ and $\neg x_i$): 

For each $0$-leaf $v$ of $\Gamma$ depth d , update $\Gamma$ as follows:  

returns a node with that constant(0 or 1).

- If  parent(v) has a 1 -leaf:

- If parent(v) does not have a 1-leaf:

- replace $v$ with a copy of its sibling and label all the leaf nodes to $0$ in this copy. 

- remove the node $v$ and its sibling and label parent(v) 0. 

return a node labelled $x_i$ with two two leaves one labelled 0 and the other labelled 1.  

If $\rm F_1|_\rho \equiv 0 $:

- return $\rm CDT(F_2, \rho)$

If $\rm F_1|_\rho \equiv 1: $

- return a single node labelled 1.

-  Construct $\Gamma = \rm CDT(F_1,\rho)$,

- 0-balance $\Gamma$ to get $\Gamma'$,

- for 0-leaf $\alpha \in \Gamma',$ attach to it $\rm CDT(F_2|_\alpha,\rho).$
