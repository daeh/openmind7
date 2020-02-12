from schwimmbad import MultiPool
import emcee
import matplotlib.pyplot as plt
import numpy as np

def ln_probability(p, mean, var):
    x = p[0]
    return -0.5 * (x-mean)**2 / var

# initial positions for the walkers
n_walkers = 16
p0 = np.random.uniform(0, 10, (n_walkers, 1))

with MultiPool() as pool:
    sampler = emcee.EnsembleSampler(n_walkers, dim=1,
                                    lnpostfn=ln_probability,
                                    args=(5, 1.2),
                                    pool=pool) # the important line

    pos,_,_ = sampler.run_mcmc(p0, 500)
    sampler.reset()
    sampler.run_mcmc(p0, 1000)

plt.figure()
plt.hist(sampler.flatchain)
