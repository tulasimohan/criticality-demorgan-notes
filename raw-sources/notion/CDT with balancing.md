# CDT with balancing

$\mathrm{CDT}_F(G,\rho)$:

Balance($\Gamma$): 

For  $d =$ depth of the tree to $1$:

- Construct $CDT_F(G_1,\rho)$

- To each leaf $\alpha \in CDT_F(G_1,\rho),$ which doesn’t kill any ancestor of $G_1$, attach $CDT(G_2|_{\alpha},\rho)$ to get a tree $\Gamma$.  

- Balance $\Gamma$

For each constant leaf $\ell$ of depth d : 

- Go up the branch till you find a node $v$ whose sibling $w$ has a complementary leaf(leaf which takes the opposite value as $\ell$) in it. 

- duplicate $v $ with $w$ and label all the leaf nodes under the duplicate node with the label of $\ell. $
