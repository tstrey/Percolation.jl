using Percolation

N = 50; p = 0.6
sq = Square(N, p, "nn")
sq.lattice_config.lattice_sites

label_components!(sq)
sq.lattice_properties.labeled_lattice_sites

sq
heatmap!(sq)

linsize = 50
ps = 0.1      
pinc = 0.025
pf = 1
nsample = 50
plot_percolation_prob("square", linsize, ps, pinc, pf, nsample)