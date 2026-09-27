# New CDT

#### Hurdles:

- Jaikumar’s counter example, 

- It is crucial that we balance the CDTs  when they are formed(as opposed to balancing when they are needed to be attached to some other decision tree). Otherwise there are examples of CDTs with a 0- path which doesn’t have a corresponding 1-path with the same set of variables (or vice-versa).

#### Observations:

- Extending Jaikumar’s suggestion to handle his counter-example i.e. to check if the root becomes a constant each time before we extend a path,

- We can 0 and 1 balance a Decision tree simultaneously.  

- A CDT is balanced at the time of its creation.  This makes sure that there is a 0-path corresponding to each 1-path with the same sequence of variables queried (and vice versa).  

#### Canonical Decision Tree

#### Unpacking:

Let $G = G_1 \vee G_2$.  If $CDT_F^{(a)}(G,\rho)  = \ell_1, \dots, \ell_t$: 

$\exist b,c$ such that  $path(G,\rho,b)$ and $path(G,\rho,c)$ are true paths Associated with $path(G,\rho,a)$.   

Note that $path(G,\rho,b)$ and $path(G,\rho,c)$  only differ on the last variable.

#### Rough work 

Given $a \in \{0,1\}^t$. If CDT picks the leaves $\ell_1, \dots , \ell_t$ along the path $a$  i.e. $CDT^{(a)}(F,\rho) = \ell_1, \dots, \ell_t$, then 

there exist $\alpha_1, \dots, \alpha_t  $ and $\beta_1, \dots, \beta_t$ which are extensions of $\rho$ such that $\forall i \in [t]$,  $KW(\alpha_i ,\beta_i) = \ell_i$. 

- $F = (x \vee y) \wedge \neg y $.  Let the  leaves of the formula $F$ be labelled $\ell_1 = x, \ell_2 = y $ and $\ell_3= \neg y$.  

- For the trivial restriction $\rho$ which doesn’t set any of the variables,  $CDT(F,\rho)$ picks $\ell_2$ instead of $\ell_3 $ in all its paths. It is  demonstrated  that there is no pair of  extensions which discovers $\ell_2$ in a KW game. Thereby shattering any hopes of achieving the stated “Dream Goal”. 

- this potentially raises a question(at least for me) whether to 0-balance the tree or 1-balance it and what should this decision be based on? 

- Here is another suggestion:  While constructing CDT of a node $G$, check if any of its ancestors becomes a constant and continue extending a path only if this is not the case.

- this suggestion is consistent with Jaikumar’s suggestion and hence takes care of his counter example. 

- this is also consistent with logic behind extending  only the 0-paths while constructing CDT for $(F = F_1 \vee F_2)$. 

Algorithm:

The non-trivial case in the CDT construction $\text{ CDT}_F(G,\rho)$ when $G = G_1 \vee G_2$

- Construct $\Gamma = CDT_F(G_1,\rho)$

- For each leaf $\alpha$, if $\alpha $ doesn’t “kill” (make it a constant) any of the ancestors of $G_2$,

- Balance the resulting tree

Input:  A partial decision tree $\Gamma $, where some of the leaf nodes are non-constant. 

Output: A partial decision tree such that for every 0-path there is an associated complementary path  corresponding 1-leaf with the same sequence of variables queried and vice-versa which computes the same partial function as $\Gamma$.  

Algorithm: 

For  $d =$ depth of the tree to $1$:

For each constant leaf $\ell$ of depth d : 

- Go up the branch till you find a node $v$ whose sibling $w$ has a complementary leaf(leaf which takes the opposite value as $\ell$) in it. 

- duplicate $v $ with $w$ and label all the leaf nodes under the duplicate node with the label of $\ell. $

- attach $CDT_F(G_2|_\alpha,\rho)$ to $\alpha$.

True path

Copied path

Given a formula $F$ and sub-formula $G$, restriction $\rho$, $a \in \{0,1\}^t$, $\epsilon \in \{0,1\} $, 

$\forall \alpha = path(G,\rho,a)$ in $CDT_F(G,\rho)$  such that $G|_{\rho, \alpha} \equiv \epsilon$,  $\exists \beta = path(G,\rho,b)$ in $CDT_F(G,\rho)$ such that 

- $G|_{\rho, \beta} $ is labelled by $1-\epsilon$.

- there exists $i \in [t]$ such that

We call such a  path $\beta $  as the associated complementary path of $\alpha$ or in-short, $\beta = ACP(\alpha)$.  

A path $\alpha \in CDT_F(G,\rho)$ is called a true path iff $\exists \beta \in CDT(F,\rho)$ such that $\alpha = ACP(\beta)$ and $ACP(\alpha)$. 

- $a_j \neq b_j$ iff $j \neq i$. 

- ($\forall j  \leq i$,  $c_j = a_j$)  $\implies$  $G|_{path(G,\rho,c)} \equiv \epsilon$. 

A path $\alpha \in CDT_F(G,\rho)$ is called a copied path iff it not a true path. 

KW game on $\rho\cdot path(G,\rho,b)$ and $\rho \cdot path(G,\rho,c)$ gives $\ell_t. $

Such $(\alpha_i,\beta_i)$ can be constructed  based on the true paths  for discovering each of the $\ell_i$’s. 
