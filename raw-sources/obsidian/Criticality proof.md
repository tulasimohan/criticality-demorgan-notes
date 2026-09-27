$\newcommand{\CDT}{\mathrm{CDT}} \newcommand{\cA}{\mathcal{A}} \newcommand{\cB}{\mathcal{B}}$

## Proof Sketch
- Preliminaries
	- Trunk, Aerial roots
	- Decision Tree, depth
	- Restrictions
	- $p$ - random restrictions
- Canonical Decision Tree
	- Balancing

- Unpacking 
	- Unpacking lemma
	- Exploration Certificate
	- Banyan decomposition lemma

- Base case proof
	- Follows Hastad's base case proof. 
	  
- Downward closure
  
- Claims
	- Sub-additivity of smaller events
	- Upper bound  on smaller events 

- Main Proof
	- Puts it all together using convexity and Cauchy-Schwartz.  
---
## Proof and modifications from last time

Modify the definition of $\cA (\bar{v},T,b_T)$ 
- $\cA$  only talks about AND becoming 0 and OR becoming 1. (currently $\cA$ talks about $\cA$ becoming both 0 and 1) 
- $\cB$ talks about the aerial roots becoming literals. 
This address the issue of $\cB$ being subsumed by $\cA$. 

**Claim 1**: $\cA(\bar{v},T,b_T)$ is Downward closed in all variables. 

**Claim** 2: $\sum_{x_i}\Pr[\cB(\bar{v},T,b_T)| \cA(\bar{v},T,b_T)] \le (2p)^t \prod_{i=1}^t \sqrt{L(T_i)}$ where $T_i$ is the sub-formula of $F$ rooted at the $i$th aerial root of $T$. 
- Follows from Hastad's base case proof and factoring and using downward closure. 
 
 
$\sum_{x_1, \ldots,  x_i, \ldots , x_t}\Pr[\cB(\bar{v},T,b_T)| \Delta]$

1.  $\cB(\bar{v},T,b_T) = \cB_1 \cap \ldots \cap \cB_t$ 

$\cB_i := F_{v_i}|_{\rho \circ \eta(v_i)}$ reduces to a literal in the variable $x_i$.

1.  **Claim:**  $B_i$ is downward closed in $X \setminus \{x_i\}$

2. **Corollary of above Claim:** $B_1 \cap  \cdots \cap B_i$ is downward-closed in $X \setminus \{x_1, \ldots x_i\}$

3. $\sum_{x_1, \ldots ,x_t}\Pr[\cB|\Delta] = \sum_{x_1, \ldots, x_t}\prod_{i=1}^t \Pr[B_i|B_1, \ldots, B_{i-1}, \Delta]$   
   = $\sum_{x_t} \Pr[B_t|B_1, \ldots, B_{t-1}, \Delta] \cdot (\sum_{x_{t-1}} \Pr[B_{t-1}|B_1, \ldots, B_{t-2}, \Delta] (\sum_{x_{t-2}} \ldots \cdot (\sum_{x_1}\Pr[B_1|\Delta])))$

4. $\sum_{x_i}\Pr[B_i|B_1, \ldots, B_{i-1}, \Delta] \le (2p)\sqrt{L(T_i)}$

$\rho \in \cA$ $\implies$ $\rho(x \to 1) \in \cA$

$\rho(x_i) =0$

$F|_{\rho \circ (x_i \to 1)}$

**Claim 3:**   $\sum_{T,b_t} \Pr[\cA(\bar{x}_{T,b_T},T,b_T)] \le 1$
- **We want**: given $a$,  $(T,b_T)$ is determined by $\rho$.
- for every function $(T,b_T) \mapsto \bar{x}_{T,b_T}$



---
- $\Pr[\CDT(F,\rho) \text{has depth\ } t] = \Pr[\sum_{\bar{x}}\CDT^{(a)}(F,\rho) = (x_1 \to a_1, \dots, x_t \to a_t)]$

- $\Pr[\exists \bar{x} \CDT^{(a)}(F,\rho) = (v_1 \to a_1, \dots, v_t \to a_t)] \le \sum_{\bar{x}}\sum_{T,b_T} \Pr[\cA(\bar{v},T,b_T) \cap \cB(\bar{v},T,b_T)]$ 
                                    = $\sum_{\bar{x}}\sum_{T,b_T}\Pr[\cA(\bar{v},T,b_T)] \Pr[\cB(\bar{v},T,b_T) | \cA(\bar{v},T,b_T)]$ 

---
$$\newcommand{\E}{\mathbb{E}}$$
$\sum_{\bar{x}}\sum_{T,b_T}\Pr[\cA(\bar{x},T,b_T)] \Pr[\cB(\bar{v},T,b_T) | \cA(\bar{v},T,b_T)]$ 

$\leq \sum_{T,b_T}\Pr[\cA(\bar{x}_{T,b_T}^*,T,b_T)] \sum_{\bar{x}} \Pr[\cB(\bar{x},T,b_T)| \cA(\bar{x},T,b_T)]$  where $\bar{v}^*_{T,b_T}$ is $\arg \max_{\bar{v}}$ of $\Pr[\cA(\bar{v},T,b_T)]$

**ToDo:**  don't take maximizer of all of $\bar{v}$ at once , instead peel off one variable at a time. 


$\le  \sum_{T,b_T} \Pr[\cA(\bar{v}^*_{T,b_T},T,b_T)] (2p)^t \prod_{i=1}^t \sqrt{L(T_i)}$ by claim 2

 = $(2p)^t$ $\sum_{T} \mu(T)\prod_{i=1}^t \sqrt{L(T_i)}$ ,  where $\mu(T) := \sum_{b_T} \cA(\bar{v}^*_{T,b_T},T,b_T)$

= $(2p)^t$ $(\sum_{T}\mu(T))$ $\cdot$ $(\mathbb{E}_{T \sim \mu} \prod_{i=1}^t \sqrt{L(T_i)}$ ),  
 
 $\le (2p)^t \cdot (\sum_{T}\mu(T)) \cdot  \sqrt{\E_{T \sim \mu}\prod_{i=1}^t. L(T_i)}$    since $\mathbb{E}[\sqrt{X}] \le \sqrt{\mathbb{E}[X]}$
 
 $\le (2p)^t \cdot (\sqrt{\sum_{T}\mu(T)}) \cdot  \sqrt{\E_{T \sim \mu}\prod_{i=1}^t. L(T_i)}$     by claim 3, Since $\sum_T \mu_T \leq 1$

 $= (2p)^t  \cdot  \sqrt{\sum_{T} \mu(T) \prod_{i=1}^t. L(T_i)}$    Since $\mu(T) \le \sum_T \mu(T) \leq 1$

 $\le (2p)^t  \cdot  \sqrt{\sum_{T}  \prod_{i=1}^t. L(T_i)}$    

 $\le (2p)^t\sqrt{L^t} = (2p\sqrt{L})^t$


 **Changes to do**
 - 0-balance ->. $balance_{\to1}$
 - Ass. c_0 -> $Assoc_{\to 1}$
 ---- 
$$\newcommand{\T}{\mathsf{T}}$$
## Exploration Certificate

**Definition:** Given a sequence of $t$ variables $\bar{x} = (x_1, \dots , x_t)$, a Trunk $\mathcal{T}$ and a collection of bit-strings $b_\mathbf{T} = \{b_v\}_{v \in \mathcal{T}}$ for each node $v \in \mathcal{T}$, we define the _Exploration Certificate_, denoted by $\text{EC}(\mathcal{T}, \mathbf{T},\bar{x})$, as the tuple $(t_v, X_v, \eta_v, \alpha_v, \beta_v)$, where all its components defined below are functions of $\bar{x}$, $\mathcal{T}$, and $\mathbf{T}$:

1. **Length $t_v$:**     $t_v(\mathcal{T})$ is the number of terminal nodes of $\mathcal{T}$ under a node $v$. 
2. **Sub-sequence of Variables $X_v$:**  Assign the variables of the sequence $\bar{x}$ to the terminal nodes of $\mathcal{T}$ based on the in-order traversal on the nodes of $\mathcal{T}$. $X_v(\mathcal{T}, \bar{x})$ is the sub-sequence of variables from $\bar{x}$ that are assigned to the terminal nodes of $\mathcal{T}$ under $v$.
3. **Pre-restriction $\eta_v$:**  A restriction defined recursively as:
    - If $v$ is the root of $\mathcal{T}$, then $\eta_v = \langle \rangle$.
    - For all other nodes of $\mathcal{T}$, $\eta_v = \eta_{\text{parent}(v)} \circ \alpha_{\text{lsibling}(v)}$ if $v$ has a left sibling $\text{lsibling}(v) \in \mathcal{T}$, else $\eta_v = \eta_{\text{parent}(v)}$.        
4. **Original Path $\beta_v$:** A path defined as $\beta_v = \langle X_v \gets b_v \rangle$.
5. **Inherited Path $\alpha_v$:** A path defined recursively as $\alpha_v = \beta_{\text{parent}(v)}[1,t(v)]$, and $\alpha(v) = \beta(v)$ if $v$ is the root.

The _Exploration certificate_ is the tuple $\text{EC}(\mathcal{T}, b_\mathbf{T}) = (t_v, X_v, \eta_v, \alpha_v, \beta_v)$.

### Lemma: Banyan Decomposition 

Let $F$ be a De Morgan formula, and $\rho$ be a restriction. Let $t \in \mathbb{N}$, let $\alpha = \langle x_1 \gets a_1, \dots, x_t \gets a_t \rangle$ for any bit string $a \in \{0,1\}^t$, and let $z \in \{0,1\}$.

If $\text{CDT}^{(a)}_z(F, \rho) = \alpha$, then there exist a unique Trunk $\mathcal{T}$ whose aerial roots $(v_1, \dots, v_t)$ correspond to variables $(x_1, \dots, x_t)$ and a unique collection of bit-strings $\mathbf{T} = \{b_v\}_{v \in \mathcal{T}}$ for each non-root, non-terminal node $v \in \mathcal{T}$ such that their corresponding exploration certificate $\text{EC}(\mathcal{T}, \mathbf{T}) = (t_v, X_v, \eta_v, \alpha_v, \beta_v)$ satisfies the following two conditions:


### **$\mathcal{A}_F(\rho,\bar{x}, \mathcal{T}, b_\mathbf{T})$:** 
- For each non-terminal node $v \in \mathcal{T}$:    
    - If $F_v = F_{v_1} \lor F_{v_2}$, then 
	    - for $j \in \{1,2\}$: 
		    - if $F_{v_j}|_{\rho,\eta_{v_j}} \equiv 0$ then $v_j \notin \mathcal{T}$. 
		    - Else, if $F_{v_j}|_{\rho,\eta_{v_j}} \not\equiv 0$, 
			    - it is witnessed by $F_{v_j}|_{\rho,\eta(v_j),\beta(v_j)} \equiv 1$ and $\text{Assoc}_0(F_{v_j}|_{\eta_{v_j}}, \rho, \alpha_{v_j}) = \beta_{v_j}$        
    - If $F_v = F_{v_1} \land F_{v_2}$, then 
	    - for $j \in \{1,2\}$: 
		    - if $F_{v_j}|_{\rho,\eta_{v_j}} \equiv 1$ then $v_j \notin \mathcal{T}$.
		    - Else, if $F_{v_j}|_{\rho,\eta_{v_j}} \not\equiv 1$, 
			    - it is witnessed by $F_{v_j}|_{\rho,\eta(v_j),\beta(v_j)} \equiv 0$ and $\text{Assoc}_1(F_{v_j}|_{\eta_{v_j}}, \rho, \alpha_{v_j}) = \beta_{v_j}$.

### $\mathcal{B}_F(\rho,\bar{x}, \mathcal{T}, b_\mathbf{T})$:
- For each aerial root $v$ of the trunk $\mathcal{T}$, 
	- the sub-formula $F_v$ simplifies to a literal under the given restriction:$$F_v|_{\rho \circ \eta_v} \text{ is a literal in the single variable } X_v$$

-----



