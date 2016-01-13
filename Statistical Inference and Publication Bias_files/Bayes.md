

Statistical Inference and Publication Bias
========================================================


Hypothesis testing
========================================================
Compare an experimental group and a control group.

$H_0$: Null hypothesis.   
<small>No difference between the groups.</small>
  $$\mu_{exp} - \mu_{ctrl} = 0$$
  
$H_A$: Alternative hypothesis.  
<small>Statistically significant difference between the groups</small>

  $$\mu_{exp} - \mu_{ctrl} \neq 0$$
  
"Difference" defined in terms of some __test statistic__.  
(different means (eg t-test), different variances (eg F-test))

Groups defined through careful experimental design  
randomisation, blinded, double blinded
  
Examples
========================================================

The new ad produces more click-throughs  
The survival rate will increase with this drug  
The traffic calming measures led to fewer road accidents.  

Summary of hypothesis testing
========================================================
transition: fade

   | Do not reject $H_0$ | Reject $H_0$
-------------|-------------------|--------------
$H_0$ is True  |Correct Decision  |type I error 
$H_0$ is False |type II error | Correct decision 

Summary of hypothesis testing
========================================================
transition: fade

   | Do not reject $H_0$ | Reject $H_0$
-------------|-------------------|--------------
$H_0$ is True  |True Negative  |False Positive 
$H_0$ is False |False Negative | True Positive 

Summary of hypothesis testing
========================================================
transition: fade

   | Do not reject $H_0$ | Reject $H_0$
-------------|-------------------|--------------
$H_0$ is True  |$P(-|H_0)$  |$P(+|H_0)$ 
$H_0$ is False |$P(-|H_\mathrm{A})$ | $P(+|H_\mathrm{A})$ 

Summary of hypothesis testing
========================================================
transition: fade

   | Do not reject $H_0$ | Reject $H_0$
-------------|-------------------|--------------
$H_0$ is True  | $1 - \alpha$ | $\alpha$
$H_0$ is False | $\beta$ |  $1-\beta$
  

<span style="color:red">$\alpha$</span> is the <span style="color:red">type I error rate</span>: the probability of observing a relationship when there isn't one.  
<span style="color:red">$\alpha$</span> is the significance threshold that the investigator has chosen, typically 0.05 or 0.01. 

<span style="color:green">$\beta$</span> is the <span style="color:green">type II error rate</span>: the probability of missing a relationship when in fact there is one. 

<span style="color:blue">$1-\beta$</span> is the <span style="color:blue">_power_</span>: the probability that a real relationship will be detected..

  
How different is different?
========================================================

* How do we know that the difference between the experimental and control groups is not due to chance?  
* We don't! But we can calculate the odds that it is.  
* This is the <span style="color:blue">_p_ value</span>, which tells us: 
  + In repeated experiments of this sample size, how often we would expect to see a result as or more extreme than this, assuming that the null hypothesis $H_0$ is true.
    + Expressed as a conditional probability:
$$p=P(\mathrm{Result}|H_0)$$
    + which means..."what is the probability of getting this result, _given_ the null hypothesis $H_0$"

p value
========================================================
* If the test is two sided: $\mu \neq \mu_0$
  + <span style="color:blue">_p_ value</span> = 2 * P($X$ > |observed value|)
* If the test is one sided
  + $H_\mathrm{A}$: $\mu > \mu_0$
  + <span style="color:blue">_p_ value</span> = P($X$ > observed value)
  
  + $H_\mathrm{A}$: $\mu < \mu_0$
  + <span style="color:blue">_p_ value</span> = P($X$ < observed value)

Significance Level
========================================================
0.05 is typical.   

Why? No good reason.  

The Truth Wears Off (Lehrer 2010)
========================================================
<small>Lehrer, J. (2010, December 13). The Truth Wears Off. The New Yorker. Retrieved from http://www.newyorker.com/magazine/2010/12/13/the-truth-wears-off</small>



__John Davis, University of Illinois__  
* <small>"Davis has a forthcoming analysis demonstrating that the efficacy of antidepressants has gone down as much as threefold in recent decades."</small>

__Anders Pope Moller__ (1991)    
* <small>"female barn swallows were far more likely to mate with male birds that had long, symmetrical feathers"</small>   
* _Between 1992 and 1997, the average effect size shrank by eighty per cent._


What could be the reasons for this?
========================================================
One possible reason is known as "publication bias"

For example, see:

<small>Joober, R., Schmitz, N., Annable, L. and Boksa, P. (2012) _Publication bias: What are the challenges and can they be overcome?_ Journal of Psychiatry & Neuroscience : JPN. [Online] 37 (3), 149-152. Available at: doi:10.1503/jpn.120065.</small>

Do publication pressures cause a tendency to produce only positive results?


Reason 1: Publication Bias (Joober 2012)
========================================================

"In the last few years, several meta-analyses1-4 have reappraised the efficacy and safety of antidepressants and concluded that the therapeutic value of these drugs may have been significantly overestimated"

"Although publication bias has been documented in the literature for decades and its origins and consequences debated extensively, there is evidence suggesting that this bias is increasing."

"A case in point is the field of biomedical research in autism-spectrum disorder (ASD), which suggests that in some areas __negative results are completely absent__"

"a highly significant correlation ($R^2 = 0.13$, _p_ < 0.001) between impact factor and overestimation of effect sizes has been reported."

So....the Decline Effect
========================================================
![decline effect](decline_effect.png)

could be due to.....

...publication bias
========================================================
![publication_bias](publication_bias.png)

Effect Size
========================================================
Interpretation is essential. 

Note that "statistically significant" is not the same as plain English "significant". 


Is the result important?  

_p_ values conflate sample size, effect size and statistical test.  

In many cases a small _p_ value is simply the result of a large sample size being used.  

What we want to know is, how big is the effect, what does it mean, and for whom?


Effect Size
========================================================
<small>Coe, R. (2002). _It's the Effect Size, Stupid: What effect size is and why it is important._ Annual Conference of the  British Educational Research Association.</small>

$$\mathrm{Effect\ Size=\dfrac{(mean\ of\ experimental\ group)-(mean\ of\ control\ group)}{standard\ deviation}}$$


Not just significant - __how__ significant.  


Often used in meta-analysis to combine results of different studies.  



Effect Size
========================================================
This is the standardised mean difference  

$$ES=\dfrac{X_1-X_2}{\sigma_\mathrm{pooled}}$$  

It is the same as the $Z$-score, or $T$-score.  

Different ways to calculate $\sigma_\mathrm{pooled}$ eg take $\sigma$ of control group.

Cohen's Heuristic
========================================================

<small>Cohen, J. (1988). _Statistical power analysis for the behavioral sciences_ doi:10.1234/12345678</small>


Standardised mean difference effect size
* small 0.2
* medium 0.5
* large 0.8

Confidence Interval (off effect size)
========================================================
What does a 95% confidence interval of the effect size mean?

* If we repeated the experiment 100 times than we expect that the interval will contains the observed effect size 95/100 times  
* If the confidence interval includes zero, then this is equivalent ot saying that the result is not statistically significant.

Reason 2: Mistakes and Fraud
========================================================
<small>Van Noorden, R. (2011). _Science publishing: The trouble with retractions_. Nature, 478 (7367), 26-28. doi:10.1038/478026a </small>

* From 2001-2011:10X increase in retractions but only 1.44X increase in papers.

![rise_of_retractions](RiseOfRetractions.png)

Example of method to detect fraud
========================================================
Benford's law: distribution of 1st digit of data.
![BenfordsLaw](benfordsLaw.png)
src: http://www.testingbenfordslaw.com/
