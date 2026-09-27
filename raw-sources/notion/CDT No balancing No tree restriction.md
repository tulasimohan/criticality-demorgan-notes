# CDT No balancing No tree restriction

Let $F = F_1 \vee F_2$ be a DeMorgan Formula, $\rho$ be a random restriction. 

Canonical decision tree constructor

If $F|_\rho \equiv constant$ :

Otherwise:

Returns the next variable to query. Recursively finds the left most child which is not set to a constant by $\rho$.

If $F$ is a leaf node:

Otherwise:

returns a node with that constant

 returns then node $F$.

- Let  $x = Survivor(F, \rho)$

- Creates $T_1= CDT(F_1,\rho \cdot \langle x \to 0\rangle)$ and $T_2 = CDT(F,\rho \cdot \langle x \to 1\rangle)$

- returns a tree with the root labelled by $x$ and has children $T_1, T_2$.  

If $F_1|_\rho \not\equiv 0:$

else if $F_1|_\rho \equiv 0$: 

return $Survivor(F_1,\rho)$

returns $Survivor(F_2,\rho)$
