
>[!Remark] 
>A sub-formula simplifying to a single literal and its CDT having depth 1 are not the samething. Let $F = (x \wedge y) \vee (x \wedge \neg y)$, 
>- $F\equiv x \vee(y \wedge \neg y) \equiv x$ 
>- But $\CDT(F)$ has depth 2. 


>CDT , Balancing, Assoc are all the same previous. 

>Unpacking, Banyan Decomposition

>[!Question] How about using leaves to label the nodes of the decision tree, not the vars.

by taking a hit of $2^t$ for choosing $a \in \{0,1\}^t$
$\Pr[\CDT(F,\rho) \text{\ has depth}\ t] \le$ 
- $\Pr_\rho[\exists \bar{x}\CDT^{(a)}(F,\rho) = (x_{i_1} \to a_1, \dots , x_{i_t}\to a_t)]$
- $\sum_{\bar{x}}\Pr_\rho[\CDT^{(a)}(F,\rho) = (x_{i_1} \to a_1, \dots , x_{i_t}\to a_t)]$


>[!Proof]+ $$\Pr_\rho[\exists \bar{x}\CDT^{(a)}(F,\rho) = (x_{i_1} \gets a_1, \dots , x_{i_t}\gets a_t)]= \sum_{T,b_T} \Pr[\exists \bar{x}\cA(F,a,\bar{x}, T, b_T) \cap \cB(F,a,\bar{x},T,b_T)]$$ 

>[!Proof]+ $$\Pr_\rho[\CDT^{(a)}(F,\rho) = (x_{i_1} \gets a_1, \dots , x_{i_t}\gets a_t)]= \sum_{T,b_T} \Pr[\cA(F,a,\bar{x},T,b_T) \cap \cB(F,a,\bar{x},T,b_T)]$$ 

>[!Proof]
> $\sum_{\bar{x},T,b_T} \Pr[\cA(F,a,\bar{x},T,b_T) \cap \cB(F,a,\bar{x},T,b_T)] = \sum_{\bar{x}} \sum_{T,b_T} \Pr[\cA] \cdot \Pr[\cB|\cA]$ 

- $F$,$a$ are fixed so we can think of $\cA, \cB$ as just functions of $\bar{x}, T, b_T$
## Claims about $\cA, \cB$
 
>[!Claim] Claim 1:  $\sum_{\bar{x}, T,b_t} \cA(\bar{x}, T ,b_T) \le 1$ 

We don't know how to prove this. 

What about $\Pr[\exists \bar{x}  \cA(\bar{x},T,b_T)]$
 


>[!Claim] Claim 2: $\cA$ is down-ward closed over all variables.

>[!Claim] Claim 3: $\Pr[\cB|\cA] \le p^t(...)$


$\sum_{\bar{x},T,b_T} \Pr[\cA(\bar{x},T,b_T) \cap  \cB(\bar{x},T,b_T)]$

$\sum_{\bar{x}} \Pr[\path(F,\rho,a)= (\bar{x} \gets a)] \le 1$

$\sum$ 


$\Pr[\cB(\bar{x},T,b_T)] \le p^t\prod_{i=1}^t\sqrt{L_{v_i}}$ 


