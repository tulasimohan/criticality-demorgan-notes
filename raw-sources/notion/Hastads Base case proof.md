# Hastads Base case proof

Let $M_F$ be the communication matrix of the game whose $rows = \{\rho: F|_{\rho} \equiv 0\}$ and $columns = \{\rho: F|_\rho \equiv 1\}$ ${}$.

For each leaf $\ell \in F$, let $A_\ell \times B_\ell$ denote the rectangle corresponding to $\ell$ in the usual KW protocol for $F$. 

Proof:

Consider the set of “bad” restrictions  defined as below

Define the sets $E^0_{\mathcal{T}}(x,\ell)$ and $E^1_{\mathcal{T}}(x,\ell)$ by extending the restriction in $E_{\mathcal{T}}(x,\ell)$ as follows  : 


$$\begin{align*} 
\Pr_{\rho}[CDT(F,\rho) = \ell \wedge \rho \in \mathcal{T}]
&\leq \Pr_{\rho}[ E_{\mathcal{T}}(x,\ell)] \\
&\leq \frac{2p}{(1-p)} \sqrt{\Pr[E^0_{\mathcal{T}}(x,\ell) \Pr[E^1_{\mathcal{T}}(x,\ell) ]}\\
\end{align*}$$

Note that $E^0_{\mathcal{T}}(x,\ell) \subseteq A_\ell(F) \cap \mathcal{T}$ and $E^1_{\mathcal{T}}(x,\ell) \subseteq B_\ell(F) \cap \mathcal{T}$.

where $A_\ell(F) \times B_\ell(F) $ is the rectangle corresponding to the leaf/transcript $\ell$ in the Karchmer wigderson protocol $\Pi(F.)$

Therefore, 

Therefore, $\Pr_{\rho}[CDT(F,\rho) = \ell |\mathcal{T}] \leq \frac{2p}{1-p} \cdot \sqrt{L}$

Let  $F$ be a De-Morgan formula of size $L $ and  let $\ell$ be a leaf in $F$. Let $\mathcal{T}$ be a downward closed set of restrictions. Then,


$$\Pr_{\rho}[CDT(F,\rho) = \ell| \rho \in \mathcal{T}] \leq O(p\sqrt{\Pr[A_\ell]\Pr[B_\ell]}). $$

If $CDT_{depth}(F,\rho) = 1$, there exist a variable $x \in stars(\rho)$ and a leaf $\ell$ in $\Pi_F$ such that $\Pi_F(\rho_0,\rho_1) = \ell$. 

- $\forall a \in \{0,1\} F|_{\rho(x \to a)} = a $, 

- $\Pi(\rho(x \to 0), \rho(x \to 1)) = \ell$, 

- $\rho(x) = *$. 

- $F|_{\rho} = 0,\ F|_{\rho(x \to 1)} = 1 $, 

- $\Pi(\rho, \rho(x \to 1)) = \ell$, 

- $\rho(x) = 0$. 

- $ F|_{\rho(x \to 0)} = 0 $, $F|_\rho \equiv 1$,  

- $\Pi(\rho(x \to 0), \rho) = \ell$, 

- $\rho(x) = 1$. 

$\sum_\ell \Pr[A_\ell(F) \cap \mathcal{T}] \Pr[B_\ell(F) \cap \mathcal{T}] \leq \Pr[\mathcal{T}]^2$


$$\begin{align*}
\sum_{\ell} \Pr_{\rho}[CDT(F,\rho) = \ell \wedge \rho \in \mathcal{T}]
&\leq \frac{2p}{1-p} \sum_{\ell} \sqrt{\Pr[A_\ell(F) \cap \mathcal{T}] \Pr[B_\ell(F) \cap \mathcal{T}]}\\
&\leq \frac{2p}{1-p} \sqrt{\sum_{\ell} 1} \sqrt{\sum_\ell \Pr[A_\ell(F) \cap \mathcal{T}] \Pr[B_\ell(F) \cap \mathcal{T}]}\\
&\leq \frac{2p}{1-p} \sqrt{L}\sqrt{\Pr[\mathcal{T}]^2}
\end{align*}$$
