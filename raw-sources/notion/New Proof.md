# New Proof

 

#### Outline of the proof

- We are interested in bounding $\Pr[\rm DT_{depth}(F|_\rho) \geq t]$ 

- It is enough to bound  $\Pr[\rm CDT_{depth}(F|_\rho) = t]$

- Partition this event into ${\cal E}(\bar{x},a)$ for each $\bar{x} = x_{i_1}, \dots , x_{i_t}$ and $a \in \{0,1\}^t$  where ${\cal E}(\bar{x},a) = \{\rho: {\rm CDT}^{(a)}(F,\rho) = x_{i_1}, \cdots , x_{i_t}\}$.

-  Blame this bad event $\cal E(\bar x ,a )$ on $(\rm T, b)$ where 

- ${\cal E}(T,b) = {\cal A}(T,b) \wedge {\cal B}(T,b)$

- Convexity and some calculation 

## Canonical Decision Tree

#### CDT Algorithm

Input: A DeMorgan formula $\rm F$ ,  and a restriction $\rho$.  

Output: A decision tree for $\rm F|_{\rho}$. 

### Balancing 

Input : A decision tree $\Gamma$. 

Output:  A decision tree $\Gamma’$ such that for every 0 leaf in $\Gamma’$, there is a 1- leaf which queries the same sequence of variables.  

Similarly, there is a 1-balancing where the roles of 0 and 1 reversed.  

Tal’s Conjecture

Let $\rm F$ be a DeMorgan formula with $\rm L$ leaves. Let ${\bf R}_p$ be the $p$-random restriction. Then for any natural number $t \geq 1$, 
 $\Pr[\rm DT_{depth}(F|_\rho) \geq t] \leq (p \lambda)^t$ for $\lambda = O(\sqrt{\rm L})$.  

- $\rm T$ is leaf-branching sub-tree of $\rm F$ and 

- $b$ gives an assignment of  the internal nodes of $\rm T$, 

- $\cal A$ is downward closed and “forms a distribution”.

-  $\cal B$ is “AND” of $t$ base cases. 

Canonical decision tree constructor 

Input: DeMorgan formula $\rm F$ and a restriction $\rho$.   

Base cases:

Recursive case:  $\rm F = F_1 \vee F_2$.

     else If  $\rm F|_\rho$ is non-constant:

The case when $\rm F = F_1 \wedge F_2$ can be  handled similarly.  

If ${\rm F}|_\rho \equiv \rm constant$ :

If $\rm F$ is a single literal ($x_i$ and $\neg x_i$): 

returns a node with that constant(0 or 1).

return a node labelled $x_i$ with two two leaves one labelled 0 and the other labelled 1.  

If $\rm F_1|_\rho \equiv 0 $:

- return $\rm CDT(F_2, \rho)$

If $\rm F_1|_\rho \equiv 1: $

- return a single node labelled 1.

-  Construct $\Gamma = \rm CDT(F_1,\rho)$,

- 0-balance $\Gamma$ to get $\Gamma'$,

- for 0-leaf $\alpha \in \Gamma',$ attach to it $\rm CDT(F_2|_\alpha,\rho).$

Ensures: for every $0$- path, there exists a corresponding $1$-path

For  $d =$ $\rm depth(\Gamma)$ to $1$:

Process leaves at depth $d$:

For each $0$-leaf $v$ of $\Gamma$ depth d , update $\Gamma$ as follows:  

- If  parent(v) has a 1 -leaf:

- If parent(v) does not have a 1-leaf:

- replace $v$ with a copy of its sibling and label all the leaf nodes to $0$ in this copy. 

- remove the node $v$ and its sibling and label parent(v) 0. 

### Pivot Algorithm

- Corresponding to each 0-path , there is a 1- path which shares the same sequence of variables queried.  and  $\rm Pivot (a , \bar{x}, F,\rho) = b$ . 

## Unpacking

If $\rm{CDT}(F,\rho$ ) has a path of length $t$, this path can be uniquely represented using a bit-string $a \in \{0,1\}^t$. The nodes along this path are labelled by variables which can be written as a sequence $(x_{i_1}, \dots , x_{t_t})$, where  $x_{i_j}$’s are the variables queried by the Canonical Decision Tree algorithm $\rm{CDT}(F,\rho)$.  In short, we write this event as  $\rm{CDT}^{(a)}(F,\rho) $ $= (x_{i_1}, \dots , x_{i_t})$ . We read this as “ $\rm{CDT}(F,\rho)$  has  a path along $a$ given by the variables $x_{i_1}, \dots , x_{i_t}$” . 

If $\rm{CDT}(F,\rho)$ has a path of length $t$,   then there exists 

- a sequence of variables $(x_{i_1}, \dots , x_{t_t})$  and 

- an assignment $a \in \{0,1\}^t$ 

such that   $\rm{CDT}^{(a)}(F,\rho)$ $= (x_{i_1}, \dots , x_{i_t})$.  


$$\begin{equation}
\Pr_\rho[{\rm CDT(F,\rho)\ has\ depth\ t}] 
\leq \sum_{x_{i_1}, \dots,x_{i_t}} 
\sum_{a \in \{0,1\}^t} {\rm CDT}^{(a)}(F,\rho) = (x_{i_1}, \dots , x_{i_t})
\end{equation} $$

Therefore, we partition the event into a bunch of events  one for each tuple $(\bar{x}, \bar{a})$, 


$${\cal E}(\bar{x},\bar{a}) = \{\rho: {\rm CDT}^{(a)}(F,\rho) = (x_{i_1}, \dots , x_{i_t})\}$$

We now fix $\bar{x}$ and $\bar{a}$ and upper bound each such event.  

Pivot ($a , \bar{x}, F,\rho$)

Input : $a \in \{0,1\}^t$

Output: $b \in \{0,1\}^t$   

Let $\alpha = (x_{i_1} \to a_1 , \dots , x_{i_t} \to a_t)$,  

For $j = t {\rm \ to\ } 1$,

- check of there is an assignment to re-assignment of the variables $x_{i_j}, \dots , x_{i_t}$which makes the $\rm F|_{\rho}$ 1 upon further restriction.

- if such a $j$ exists, flip the $j$th bit in $\alpha$ and start over again with $j=t$ and this new ordered restriction. 

- If in successive iterations , you get the same $j$, then terminate and output the assignment. 

Claim

If ${\rm CDT}^{(a)}_0(F,\rho) = \langle x_{i_1}, \dots , x_{i_t}\rangle$, and $\rm F = F_1 \vee F_2$, then there exists

- $k \in \{0,1,\dots , t\}$

- $b \in \{0,1\}^k$  

such that   

- $\rm CDT_1^{(b)}(F,\rho) = \langle x_{i_1} ,\dots , x_{i_k}\rangle$ and  $\rm Pivot (a_{\leq k} , \bar{x}, F,\rho) = b$ . 
