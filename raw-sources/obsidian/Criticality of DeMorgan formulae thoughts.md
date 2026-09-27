Question: Effect of Random restrictions on DeMorgan formulae

>[! Conjecture] **Tal's Conjecture:** 
Let $f$ be a De-Morgan formula with $\sqrt{L}$ leaves.  $$\Pr_{\rho \sim R_p}[\text{DT}_{depth}(F_{|\rho}) \geq t] \leq (p\sqrt{L})^t$$



### Motivation:   

- Switching lemma like statement for De-Morgan formulae.

- Implications of Criticality:
	- Average case lower bounds, 
	- Learning algorithms,
	- Fourier tail bounds,
	- Pseudorandom generators, 
	- Satisfiability algorithms,
	- Bounds on decision tree size. 

### Strategies: 

#### Starting point: 
- Base case proof of Hastad used in [[Shrinkage exponent]].
- Uses [[KW games]] over restrictions(partial inputs).
- Double counting on the Communication matrix. 
	(Matrix = Rows x Columns = sum of rectanlges)  
- Cauchy-Schwarz
- How is this related to [[Khrapchenko's bound]] ? 

#### Broad strategy: 
The ideas is to use 
- Hastad's base case proof, 
- Induction on the formula and 
- Downward closure 
to solve this problem. 

#### Obstacles:
- Is the Hastad's base case proof compatible with downward closure?
- $g \vee \neg g$ kind of gates or gates which become $g \vee \neg g$ after restriction. 
- Jaikumar's counter example. 
#### Ideas: 	
- Canonical decision trees for DeMorgan formulae
- Downward closure 
$\newcommand{\zo}{\{0,1\}}$

---



 