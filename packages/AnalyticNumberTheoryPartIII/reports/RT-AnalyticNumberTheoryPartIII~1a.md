# Red-team review of #2008 AnalyticNumberTheoryPartIII at 69f498b (pass a (codex))

**Verdict:** changes needed


## R01 (P1) — Balancing does not preserve the number of factors

Location: `TauCetiRoadmap/AnalyticNumberTheoryPartIII/README.md:1460–1461`: “every approximate factorization A and cutoff L give an exact factorization of n! into t factors”.

Claim: the final factorization has the original cardinality `t = |A|` fixed at line 1444.

Witness: `n = 4`, `L = 2`, `A = ∅`, so `t = 0`, product `1`, but `4! = 24`. The README's own `{4,4} → {2,3,4}` Check changes cardinality from 2 to 3.

Exact repair text: “By induction on total imbalance, every approximate factorization A and cutoff L give an exact factorization A′ of n! into t′ = |A′| factors at most n, with t′ log n ≤ log n! + score_L(A).” Do not require `t′ = |A|`.

Repair test: for the empty input at `n = 4`, `score₂(∅) = log 4 + 3 log 2 + log(4/3) = log(128/3)`; `A′ = {2,3,4}` gives `3 log 4 = log 64 ≤ log 24 + log(128/3) = log 1024`.

## R02 (P2) — Exclude the zero denominators from the Mellin integration-by-parts identity

Location: `TauCetiRoadmap/AnalyticNumberTheoryPartIII/README.md:883–885`, the quotient formula with denominator `s(s + 1)⋯(s + k − 1)`.

Claim: the displayed identity is the proof route on every vertical strip, without excluding its zero denominators.

Witness: take the section's polynomial bump, `k = 1`, `s = 0`. The left side is `4 log 2 − 11/4 ≈ 0.0225887`; Lean's right side is division by zero, hence `0`.

Exact repair text: “For s outside {0, −1, …, −(k−1)}, k integrations by parts give mellin ν s = (−1)^k mellin (ν^(k)) (s+k)/(s(s+1)⋯(s+k−1)). Use this identity for sufficiently large |Im s|, and bound the remaining compact part of each strip by continuity of the entire Mellin transform.” Add the above `s = 0` negative control.

Repair test: `s = 0` now belongs to the compact part, where its value remains `4 log 2 − 11/4`; at `k = 1`, `s = 1` the identity reads `1/30 = −(−1/30)`.

## R03 (P3) — Continuous bumps do give absolute vertical integrability

Location: `TauCetiRoadmap/AnalyticNumberTheoryPartIII/README.md:1003–1004`: “for a merely continuous ν … need not be integrable”.

Claim: a continuous compactly supported bump can have a nonintegrable vertical transform after smoothing; `k ≥ 1` is necessary.

Witness: put `h(u)=exp(εσu)ν(exp u)`. Compact support and continuity give `h ∈ L²`; Plancherel and Cauchy–Schwarz give `∫ |mellin ν(ε(σ+it))/(σ+it)| dt ≤ ‖mellin ν(ε(σ+i·))‖₂ √(π/σ) < ∞`.

Exact repair text: “The C¹ assumption supplies the explicit O(|s|⁻²) pointwise bound used in this proof. Absolute vertical integrability also holds for continuous compactly supported ν, by Plancherel after x = exp u and Cauchy–Schwarz against (σ²+t²)⁻¹/².” Replace the purported necessity Check with this distinction. The current theorem's sufficient hypotheses need not change.

Repair test: the continuous, non-C¹ normalized bump `ν(x) = max(0, 1 − |log x|/log 2)/log 2` for `x>0`, zero otherwise, has support `[1/2,2]`, mass `1`, and the displayed finite bound for every `σ,ε>0`. The weight's squared integral is exactly `π/σ`.

## R04 (P3) — The width witness violates the standing width bound

Location: `TauCetiRoadmap/AnalyticNumberTheoryPartIII/README.md:224–225` and `:1055–1057`, the example with `η(t) = 1/log t`.

Claim: this is a witness for the defined zero-free widths and the transfer theorem.

Witness: `η(3) = 1/log 3 ≈ 0.910239 > 1/2`, whereas both the convention and §10.2 require `η(t) ≤ 1/2` for every `t ≥ 3`.

Exact repair text: “For η(t) = 1/(4 log t) and log x = 100, ω_η(x) = 10, attained at log t = 5.” Use these parameters in both places, retaining the general minimization formula.

Repair test: `η(3) ≈ 0.227560 ≤ 1/2`, the width is positive and decreasing, and the minimum of `25/u + u` for `u ≥ log 3` is `10` at `u = 5`.

## R05 (P3) — The extremal Check needs a positive parameter

Location: `TauCetiRoadmap/AnalyticNumberTheoryPartIII/README.md:783–785`, the extremal function asserted to satisfy `Re f < M`.

Claim: the displayed extremal satisfies the strict inequality with no restriction on `M`.

Witness: `M = 0`, `R = 1`, `z₀ = 0` gives `f = 0`, so the claimed inequality is `0 < 0`. At `M = −1`, even `Re f(z₀) ≤ M` fails.

Exact repair text: “For M > 0, the extremal f(z) = −2M(z − z₀)/(R − (z − z₀)) has Re f < M on the disc…” Keep the separate constant-function Check for `M = 0`.

Repair test: `M = R = 1`, `r = 1/2` gives derivative norms and bounds `8, 32, 192`; at `M = 0` the separate constant case gives `0 = 0`, without a strict inequality.

## R06 (P3) — Being outside the principal strip does not force the opposite square root

Location: `TauCetiRoadmap/AnalyticNumberTheoryPartIII/README.md:1266–1268`, the square-root Check when the imaginary Euler logarithm is outside `(−π,π]`.

Claim: leaving that strip makes the Euler-product square root differ from the principal square root by the nontrivial sign.

Witness: choose `s` with `Re s>1` and Euler logarithm `ℓ(s)=u+4πi`, as justified below. Both roots are `exp(u/2)`, although `4π` lies outside the stated strip.

Existence of the witness: the maximal imaginary part of `−log(1−p^{-σ}e^{iθ})` is `arcsin(p^{-σ})`. Choose finitely many primes with the sum at `σ=1` larger than `5π`, then fix `σ>1` close enough to retain a sum larger than `4π+1`. Enlarge the finite prime set until the absolutely convergent Euler-log tail has norm less than `1/4`. The logarithms of distinct primes have no nonzero rational relation, by unique factorization; Kronecker approximation therefore simultaneously approximates phases maximizing these local imaginary parts. Equivalently, each nonconstant torus-character time average is `(exp(iTΣmₚ log p)−1)/(iTΣmₚ log p)→0`, giving density. This produces a height with imaginary Euler logarithm greater than `4π`. At height zero that imaginary part is zero, so continuity supplies the stated intermediate height with value exactly `4π`.

Exact repair text: “Write ℓ(s) − Log(ζ(s)) = 2πik, k ∈ ℤ. Then L(d_{1/2},s) = (−1)^k ζ(s)^(1/2), where the power on the right is principal. The two values disagree precisely when k is odd; leaving the principal strip alone does not determine that parity.”

Repair test: `k=1` gives multiplier `−1`; the counterexample `k=2` gives multiplier `+1`, and both values are `exp(u/2)`.

## Verified sound

Read all 1,648 README lines and all 445 Lean lines. The record below contains 35 declaration rows, 87 additional target/convention rows, all 104 Check bullets, 44 source-locator groups and 13 cross-roadmap groups. The Lean inventory is 35 declarations: 8 definitions and 27 admitted theorems. Compared all 35 with the supplied elaborated signatures; no lost section variable or instance was found. No Lean command was run: this pass's read-only prohibition was respected. The instance tables below record mathematical checks, not a claim that finite numerical tests prove the general theorems.

The headline inventory is Fourier BV decay; pointwise truncated Mellin inversion and its window bound; Brown sampling; rectangle residues, isolated-singularity circles and the L-shaped contour; derivative Borel–Carathéodory and local Landau; smoothed Mellin transforms and uniform decay; smoothed sums, Ingham transfer and the Hecke logarithmic derivative; the complex divisor series and abscissas, Ramanujan and four classical arithmetic series; both Hardy–Landau forms; both factorial-factor asymptotics; and Goldbach interval transfer. All are represented in Lean. The other README claims are intermediate results or specializations. No definite acceptance-test padding, surrogate carrier, sorry'd data, name collision, or missing statable headline was found.

There is one `import Mathlib`, and the two individual Tau Ceti imports exist at the pins. There is no `set_option`, admitted example, `lemma` declaration, or forbidden command. The definitions have real bodies. Constants for uniform estimates occur before the parameters over which they must be uniform. In particular the window constant precedes `h,u₀,δ,T`, the Landau constant precedes `f,z₀,R,M`, and the smoothing constant precedes `ε,s`.

### Lean declaration computation table

All names below are in `TauCetiRoadmap.AnalyticNumberTheoryPartIII`; locations are in `TauCetiRoadmap/AnalyticNumberTheoryPartIII/Suggested.lean`. There are no ambient `variable` blocks. `E` and `K` have independent implicit universes; other carriers are native real, complex, natural, integer, finite-set, and arithmetic-function carriers. “Retain” means no defect found in that signature, not a proof certificate.

| Declaration, line; section | Explicit variable/instance context | Instances and computed sides | Result/change |
|---|---|---|---|
| `norm_fourier_le_eVariationOn_div`, 62; 7.1 | Complex normed space `E`, complete; integrable global BV `f`; real `ξ≠0` | Indicator `[0,1]`, `ξ=1/2`: norm `2/π`, bound `2/π`. Zero space: `0≤0`. Excluded `ξ=0`: `1>0`. | Retain. |
| `tendsto_truncated_mellinInv`, 73; 7.3 | Complex `f`, Mellin convergence at real `σ`; `0<δ<x₀`; local BV | Indicator `(0,1]`, `σ=x₀=1`: `atan T/π→1/2=(1+0)/2`; excluded `σ=0`: integral `0`, mean `1/2`. | Retain. |
| `norm_dirichletKernel_integral_sub_mean_le`, 88; 7.3 | Absolute `C`; complex integrable global BV `h`; `δ,T>0` | Exponential step, `σ=T=1,δ=1`: error `1/4`; bracket `1−e⁻¹+2=2.63212`. Zero `h`: `0≤0`. Point spike changes neither integral nor limits. | Retain. |
| `exists_tendsto_samplingSum_norm_sub_le`, 105; 7.4 | Complex integrable spectrum; `W>0`; arbitrary real `t` | `W=1/2` extremal: `f(1/2)=1`, limit `−1`, error `2=2·1`; sample point error `0`. | Retain. |
| `rectangle_boundary_integral_eq_residues`, 119; 8.1 | Strict rectangle, open neighbourhood, finite interior poles; differentiability off poles, meromorphy at them | Square and `1/s`: four contributions `iπ/2`, sum `2πi=2πi·1`; `1/s²`: `0=0`; empty pole set and constant: `0=0`. | Retain. |
| `rectangle_boundary_integral_eq_sum_circleIntegral`, 134; 8.1a | Strict rectangle, `r>0`, finite pairwise-disjoint closed discs inside; differentiability on closed punctured rectangle | `exp(1/s)`: boundary `2πi`, circle `2πi`; overlapping discs for `1/s`: `2πi≠4πi`, excluded. | Retain. |
| `vertical_integral_eq_lShaped_add_sum_circleIntegral`, 152; 8.1b | `T,r>0`; `Re w≤1`, `0<Im w<T`; finite discs, disjointness; differentiated region `D\P`, uniform decay filter, two integrable rays | `exp s`: both sides `e(e^{iT}−1)`; stated pole example: both `−2.2208906054+1.1290164643i`. `Re w=1` makes bottom interval `0`. | Retain. |
| `norm_iteratedDeriv_le_borelCaratheodory`, 175; 8.2 | Open-disc differentiability, real-part bound; `k≥1`, `0≤r<R`, distance ≤r | Extremal `M=R=1,r=1/2`: `8=8`, `32=32`, `192=192`. Constant `i`, `M=0`: derivatives `0=0`; excluded `k=0` gives `1>0`. | Retain theorem; R05 fixes the Check. |
| `norm_logDeriv_sub_sum_zeros_le`, 187; 8.3 | `0<r₁<r₂<1`; `C` before function/radius; `R>0`, analytic closed disc, nonzero centre and evaluation, exponential bound | `f=z−0.3`, at `z=0`: `−10/3−(−10/3)=0`; `f=(z−0.3)e^{2z}`: residual `2`; constant `1`, `M=0`: `0≤0`. | Retain. |
| `deltaSpike`, 201; 9.3 | All real `ν,ε,x`; no hidden bump instance | `ε=1,x>0`: `ν(x)`; `ε=1/2`: `2ν(x²)`; `ε=0` or `x≤0`: `0`. Normalized positive bump mass at `ε=1/2`: `1`, without prefactor `1/2`. | Retain. |
| `smoothCutoff`, 207; 9.4 | All real `ν,ε,x`; explicit positive-argument branch | Normalized symmetric bump: value at `1` is `1/2`; nonsymmetric polynomial bump: `0.70646845`; value at `0` is `0`. | Retain. |
| `mellin_smoothCutoff`, 213; 9.4 | Nonnegative bump, support `[1/2,2]`, nonzero integral `1`; `ε>0`, `Re s>0` | Polynomial bump, `ε=1/2,s=1.3+2i`: both `0.3077244084−0.3285289455i`; inverse scaling gives `0.49617+0.09889i`. | Retain. |
| `norm_mellin_smoothCutoff_le`, 222; 9.4 | `C^k`, `k≥1`, bump laws; `σ₁>0`; `C` before `ε∈(0,1],s` in strip | At previous point norm `0.45014`; bound coefficient `1/(‖s‖(1+0.5‖s‖))≈0.1912` for `k=1`, requiring only finite `C`. If `σ₂<σ₁`, no `s` exists. | Retain; R02 fixes a proof formula. |
| `smoothedSum_eq_mellinInv`, 235; 10.1 | Absolute convergence at every real `σ′>1`; `C^k` bump, `k≥1`; `0<ε≤1,X>0,σ>1` | `a=δ₁,X=1`, symmetric bump: both `1/2`; `a` supported only at `0`: both `0`; general coefficient at `n=2` gives cutoff at `2/X`, confirming inverse argument `X⁻¹`. | Retain. |
| `inghamExponent`, 246; 10.2 | All real functions `η` and real `x`; infimum over subtype `t≥3` | Constant `1/4,x=e¹⁰⁰`: `25+log3=26.09861229`; `x=1`: `log3`; repaired width: `min(25/u+u)=10`. | Retain definition; R04 fixes witness. |
| `norm_sum_sub_mul_le_of_zeroFreeRegion`, 256; 10.2 | Continuous antitone positive capped width; polynomial-log lower bound; coefficient bound; open continuation, pole identity and growth; existential constants before `x≥3` | `a=0,r=0,G=0`: error `0`; constant coefficients at `x=3.5`: error `0.5`; constant width gives RHS `C′3^{-c}x^{1-c/4}`. `a(0)` arbitrary contributes `0`. | Retain. |
| `logDeriv_heckeLFunctionC_bound`, 277; 10.3 | Arbitrary `K`, `[Field K] [NumberField K]`, modulus, ray character; constants depend on character; equality only for `s≠1` | Trivial rational character: pole coefficient `+1`; presentation modulo 2: coefficient still `1` although `Res L=1/2`; removed-factor correction at `s=2` is `−log2/3`. | Retain. |
| `sigmaC`, 294; 11.2 | Complex exponent; native arithmetic function | `σ₁(6)=12`, `σ₋₁(6)=2`, `σ_{1/2}(4)=3+√2`; at `0`: `0`, at `1`: `1`. | Retain. |
| `generalizedDivisor`, 300; 11.2 | Complex parameter; factorization product with explicit zero branch | `d_{1/2}(p²)=3/8`; `d₂(p²)=3`; `d₋₁(p²)=0`; `d_z(1)=1`, `d_z(0)=0`. | Retain. |
| `LSeries_sigmaC`, 305; 11.2 | `ν,s∈ℂ`; `Re s>1` and `>1+Re ν` | `ν=1,s=3`: both `ζ(3)ζ(2)≈1.97730`; `ν=0,s=2`: both `ζ(2)²≈2.70581`. | Retain. |
| `abscissaOfAbsConv_sigmaC`, 314; 11.2 | All complex `ν`; RHS real maximum cast to `EReal` | `ν=2`: `3=3`; `ν=−2`: `1=1`; `ν=0`: `1=1`; `ν=it≠0`: prime lower bound `|1+e^{it log p}|≥1+cos(t log p)`. | Retain. |
| `LSeries_generalizedDivisor`, 324; 11.2 | Complex `z`; `Re s>1`; convergence and identity | `z=0`: `1=exp0`; `z=1/2,s=2`: `1.28254983=√ζ(2)`; `z=i,s=3`: `0.98311+0.18300i`. | Retain. |
| `abscissaOfAbsConv_generalizedDivisor`, 334; 11.2 | Complex `z≠0` | `z=−1,1/2,2`: prime absolute terms `1/p,1/(2p),2/p`, hence abscissa `1`; excluded `z=0` gives `⊥≠1`. | Retain. |
| `LSeries_sigmaC_mul_sigmaC`, 342; 11.3 | Four strict real-part inequalities; complex shifts | `α=β=0`: local coefficients `1,4,9,16`; numerator without denominator gives `p²` coefficient `10`, corrected `10−1=9`; complex example `≈2.4856−0.3646i`. | Retain. |
| `LSeries_two_pow_omega_moebius_sq_liouville`, 353; 11.4 | Complex `s`, `Re s>1`; native sequences and casts | At `s=3`: `1.42031`, `1.18156`, `0.84634`; local second coefficients `2,0,1`. Raw `2^ω(0)=1` is ignored by `LSeries.term`. | Retain. |
| `LSeries_totient`, 364; 11.4 | Complex `s`, `Re s>2` | At `s=4`: `ζ(3)/ζ(4)≈1.11063`; excluded `s=2`: prime absolute terms `(p−1)/p²≥1/(2p)`. | Retain. |
| `abscissaOfAbsConv_two_pow_omega_moebius_sq_liouville_totient`, 372; 11.4 | No variables/instances beyond native carriers | Critical prime terms `2/p,1/p,1/p,(p−1)/p²`; divergent in each case; abscissas `(1,1,1,2)`. | Retain. |
| `tendsto_of_cesaro_of_mul_ge`, 384; 12.1 | Real sequence, prescribed mean limit `S`, real `K`, bound at every natural index | `a₀=d`, other terms `0`: partial sums `d`, means `d(N−1)/N→d`; alternating constants give means `1/2`, partial sums `0,1`, but violate bound. | Retain. |
| `tendsto_of_cesaro_of_norm_mul_le`, 394; 12.1 | Real normed space, no completeness; prescribed `S`; `n‖a_n‖≤K` | Zero space: sums and limit `0`; in any noncomplete normed space, finite-supported `a₀=v`: sums `v`, means `(1−1/N)v→v`. | Retain. |
| `factorialFactorCount`, 407; 13.1 | Natural `B,n`; `sInf` of natural lengths, `Fin t→ℕ` | `(B,n)=(16,4):2`, `(4,4):3`, `(1,2):0` junk; for any `B`, `n=0,1`: empty product `1`, count `0`. | Retain. |
| `factorialFactorCount_sq_sub_isLittleO`, 412; 13.1 | Natural input cast to reals before division; `atTop` | At `n=10`: count `4`, main term `2.82852759`, residual `1.17147241`; denominator `4.34294482`. Asymptotic lower main term from Stirling is exactly half the `B=n` one. | Retain signature; R01 repairs proof target. |
| `factorialFactorCount_self_sub_isLittleO`, 419; 13.1 | Same real arithmetic and asymptotic filter | At `n=10`: count `7`, main term `5.65705518`, residual `1.34294482`; at `n=0`, both zero by total real division; finite exceptional values do not affect `atTop`. | Retain signature; R01 repairs proof target. |
| `EvenGoldbachUpTo`, 425; 13.2 | Real bound, natural even inputs `4≤n≤H`; natural prime summands | `H=3`: no inputs; `H=4`: `4=2+2`; `H=30`: `30=7+23`; real `H=4.5` adds no new input. | Retain. |
| `OddGoldbachUpTo`, 430; 13.2 | Real bound, natural odd inputs `7≤n≤H`; three natural primes | `H=6`: no inputs; `H=7`: `7=2+2+3`; `H=33`: `33=3+7+23`; repetitions must be allowed. | Retain. |
| `oddGoldbachUpTo_of_primeGaps`, 439; 13.2 | Real `Δ,x₀,H`; prime interval hypothesis only at natural `x`; two range hypotheses | `Δ=2,x₀=2,H=30`: endpoint `56`, all 25 odd inputs `7..55` represented. `Δ=0` gives empty `(x,x]`; `Δ<0` lower endpoint ≥x, so hypothesis impossible at positive x. | Retain. |

### Additional README target and convention computations

Headline targets already have one row each above. This table covers the additional definitions, API claims, proof identities and the bold conventions. The Summary and scope lists refer to these same targets rather than adding separate statements. Parameters requiring fields, norms or positivity exclude zero rings, characteristic-p coefficients and nonpositive radii; no such excluded object was silently used as an instance.

| README statement/locator | Instances; computed sides | Result/change |
|---|---|---|
| Fourier convention, 173 | Indicator `[0,1]`, frequency `1/2`: `(1−e^{-πi})/(πi)=−2i/π`; opposite convention gives `+2i/π`. | Correct. |
| Mellin/inverse convention, 175 | Indicator `(0,1]`, `s=2`: `∫₀¹t dt=1/2`; inverse kernel at `x=2` is `2^{-s}`, not `2^s`. | Correct. |
| Two-sided Laplace, 178 | `g=1_[0,∞)`, `c=2`: integral `1/2`; opposite substitution gives divergent positive exponential integral. | Correct. |
| Truncation and kernel, 183 | `T=1,v=0`: continuous kernel value `1/π`; improper full integral `(1/π)(π/2+π/2)=1`. Perron jump limit `1/2`. | Correct; Lean's point value `0` is AE-equivalent. |
| One-sided limits/variation, 189 | Indicator `(0,1]` at 1: limits `(1,0)`, global variation `2`. | Correct. |
| Multiplicative convolution, 193 | Two indicators `(0,1]`, `x=e⁻¹`: `log(e)=1`; additive convolution there is `e⁻¹`. | Correct. |
| Bump normalization, 196 | Log-symmetric tent divided by `log2`: multiplicative mass `1`; zero function has integral `0`, so cannot satisfy mass hypothesis. | Correct. |
| Total `LSeries`, 203 | Constant coefficients at 2: `π²/6`; at 1: non-summable, total value `0`; coefficient at 0 contributes `0`. | Correct at native complex carrier. |
| Complex powers, 208 | `4^{1/2}=2`, `σ_{1/2}(4)=3+√2`; inverse exponent gives `1+1/√2+1/2`. | Correct. |
| Divisor conventions, 211 | `multichoose(1/2,2)=3/8`; `multichoose(−1,2)=0=μ(p²)`. | Correct. |
| Euler logarithm, 214 | At `s=2`, real Euler log `log(π²/6)=0.49770030`; exponential `π²/6`. | Correct definition; R06 fixes the later branch Check. |
| Sharp/Cesàro cutoffs, 218 | Sharp count at 2 is `2`; alternating sequence gives `S₀,S₁,S₂=(0,1,0)`, mean at 2=`1/2`. | Correct. |
| Width convention, 222 | Original example `η(3)=0.910239`; cap `0.5`. Repaired example `0.227560`, exponent `10`. | R04. |
| Ray character convention, 226 | Rational trivial presentation at 1: pole coefficient of `−L′/L`=`1`; modulo 2: L-residue=`1/2` but logarithmic residue=`1`. | Correct. |
| Constant dependence, 233 | Scaling BV indicator by `a` multiplies both sides by `|a|`; scaling Landau radius by 2 divides both sides by 2. | Uniformity order is consistent. |
| 7.1 limits and pointwise bound, 443 | Indicator `[0,1]`: limits `0,0`, supremum `1≤V=2`; nonintegrable step has limit `1`, excluded. | Correct. |
| 7.1 derivative identity, 457 | Tent at `ξ=1/2`: Fourier tent `4/π²`; Fourier derivative `4i/π=2πi(1/2)(4/π²)`. At zero, derivative integral `0`. | Correct. |
| 7.1 second-order and combined bounds, 458 | Tent: `4/π²=4/(2π·1/2)²`; at zero combined bound `1≤1+1/π²`. | Correct. |
| 7.1 C² decay, 464 | `f(t)=1/(1+t²), A=2`: transform at zero `π`; upper bound `2π+1/(2π)`. | Correct. |
| 7.2 oddness/continuity, 496 | `I(0)=0`; `I(−1)=−0.94608307=−I(1)`; integrand's removable value at zero is 1. | Correct. |
| 7.2 global Dirichlet bound, 496 | `I(π)=1.85193705`, `I(2π)=1.41815158`; both ≤first value. | Correct. |
| 7.2 tail bound/IBP, 497 | `x=π`: error `0.28114073≤0.63661977`; finite-tail endpoint terms cancel to the stated sign. | Correct, with the intended tail endpoint `R≥x`. |
| 7.2 arbitrary interval bound, 498 | `a=−π,b=π,T=1`: integral `2I(π)=3.70387410`; bound attained. Empty interval: `0≤3.70387410`. | Correct. |
| 7.3 two-sided Laplace inversion, 516 | Exponential step on positive half-line: `G(c+iy)=1/(c+iy)`; jump mean `1/2`. | Correct; equivalent to kept Mellin headline. |
| 7.3 Mellin/Laplace conversion, 527 | `u=−log t`: `t^{σ-1}dt` becomes `e^{-σu}du` with reversed limits; left and right limits swap `(1,0)→(0,1)`, same mean. | Correct. |
| 7.3 Perron instance, 550 | At `x=1,c=1,T=10`: `atan10/π=0.46827448`; limit `1/2`. | Correct; owner cited. |
| 8.1 U-shaped identity, 658 | `1/s` finite-height square: right `π/2`, left `−π/2`, horizontal `−π`, residue contribution `2π`; RHS `π/2`. | Correct. |
| 8.1a principal-part construction, 702 | `f=1/z,ρ=0`: constructed exterior term `1/z`; for `f=1`, exterior term `0`; remainder respectively `0,1`. | Correct sign/source/target. |
| 8.2 coefficient inequality, 772 | `f(z)=−2z/(1−z)`: each nonconstant coefficient `−2`, so `|a_n|=2=2(1−0)`; centre derivative `k!a_k`. | Correct. |
| 8.3 zero finiteness/Jensen route, 805 | `f=z−0.3,R=1,r₂=1/2`: one zero; `M=log(1.3/0.3)=1.466337`, bound `M/log2≈2.1155`. | Correct. |
| 9.1 convolution definition, 849 | Indicators `[1,2]`: at 2 value `log2`; at 1 or 4 value `0`; `f=0` gives `0`. | Correct. |
| 9.1 commutativity, 852 | Positive `x=2`: both `log2`; at excluded `x=0`, chosen indicators give `log2` versus `0`. | Correct. |
| 9.1 Mellin product, 855 | Indicators `(0,1]`, `s=2`: Mellin convolution `1/4`, product `(1/2)²=1/4`; zero factor gives `0=0`. | Correct; normalization agrees with AsymptoticExpansions §8.1. |
| 9.1 additivity/restriction, 860 | Double first indicator: value at 2=`2log2`; altering either function only on nonpositive inputs changes positive-x integral by `0`. | Correct under convergence. |
| 9.1 support multiplication, 862 | `[1,2]` with `[1,2]`: zero at `x=1/2,5`, positive `log2` at 2; product support interval `[1,4]`. | Correct. |
| 9.2 entireness, 880 | Polynomial bump on `[1,2]`: transform at zero `4log2−11/4=0.02258872`; interval width zero forces continuous bump zero, entire transform zero. | Correct. |
| 9.2 strip decay, 881 | Zero bump gives `0≤0`; polynomial C¹ bump has finite transform at 0 and integration-by-parts decay away from 0. | Correct theorem; R02 repairs formula. |
| 9.2 mass at zero, 882 | Polynomial bump: multiplicative mass `0.02258872`, additive mass `1/30=0.03333333`. | Correct. |
| 9.2 repeated IBP, 883 | `k=1,s=0`: `0.02258872≠0`; at `s=1`: `1/30=−(−1/30)`. | R02. |
| 9.3 mass/positivity/support, 906 | Normalized log-tent, `ε=1/2`: mass `1`, positive support between `1/√2` and `√2`; omitted prefactor gives mass `1/2`. | Correct. |
| 9.3 Mellin scaling, 908 | `ε=1`: unchanged; `ε=1/2`: Mellin argument `s/2`; at `s=0`, both masses `1`. | Correct. |
| 9.3 near-identity mass, 909 | At `ε=1,y=2`: `|2−1|=1≤2log2=1.38629`; at `y=1/2`: `1/2≤2log2`. | Correct bound. |
| 9.3 approximate identity, 912 | `f=1`: convolution `1` exactly; `f(x)=x` at `x=1`: value `mellin ν(−ε)→1`; at positive compact sets same modulus of continuity tends to zero. | Correct. |
| 9.4 positivity/range, 933 | Symmetric bump: values `1,1/2,0` below support, at1, above support; all in `[0,1]`. | Correct. |
| 9.4 exact plateaus, 934 | `ε=1/2`: at `x=1/2`, cutoff `1`; at `x=2`, cutoff `0`; endpoints carry no atoms. | Correct. |
| 9.4 continuity/convergence, 936 | Near zero cutoff is1, so weighted primitive `∫₀^a x^{σ-1}dx=a^σ/σ` for `σ>0`; at `σ=0` it diverges. | Correct. |
| 9.4 mass near1, 944 | Symmetric log-tent gives limit transform-at1=`1`; nonsymmetric bump at ε→0 also gives `mellinν(0)=1`. | Correct. |
| 10.1 sharp/smooth comparison, 985 | Constant coefficients, `X=2`, symmetric bump: error `1/2`; uncorrected RHS `2Cε→0`; corrected RHS `C(2ε+1)`. | Correct `+1` retained. |
| 10.2 infimum attained, 1013 | Constant width: minimizer `t=3`; reciprocal-log width `c₀=1/4,logx=100`: minimizer `t=e⁵`. | Correct. |
| 10.2 monotonicity/bounds, 1014 | At `x=1`, both lower and upper bounds `log3`; constant1/4 at `x=e¹⁰⁰`: lower `log3`, exponent=upper=`25+log3`. | Correct. |
| 10.2 logarithmic lower bound, 1015 | `A=0,η=1/4`: exponent `logx/4+log3≥logx/4`; `A=1,a₀=1/4`: exponent `√logx` once minimum interior. | Correct. |
| 10.2 width monotonicity, 1017 | Constant widths1/4 and1/2 at logx100 give `26.0986≤51.0986`. | Correct. |
| 10.2 contour/pole route, 1038 | Pole coefficient `r`, multiplier at1=`mellinν(ε)x`: residue product `r mellinν(ε)x`; r0 gives0. | Correct. |
| 11.1 complete multiplicativity definition, 1142 | `λ(4)=1=λ(2)²`; `μ(4)=0≠μ(2)²=1`; zero map over nontrivial ring has f1=0≠1. Zero ring uniquely has0=1, no inconsistency. | Correct. |
| 11.1 implication to coprime multiplicativity, 1147 | `λ(6)=1=λ(2)λ(3)`; converse fails at μ4 (`0≠1`). | Correct. |
| 11.1 equivalence with zero-preserving monoid hom, 1148 | λ maps0→0,1→1,4→1; evaluations determine unique hom. Zero ring has one such function/hom. | Correct. |
| 11.1 pointwise closure/examples, 1150 | `λ·λ` at4 and6=`1`; `n^ν` at2·3=`exp(νlog6)=exp(νlog2)exp(νlog3)`; Dirichlet character vanishes at bad factors compatibly. | Correct. |
| 11.1 distribution over convolution, 1153 | `f=λ,g=h=ζ,n=4`: left `λ4·3=3`; right `λ1λ4+λ2λ2+λ4λ1=3`. | Correct. |
| 11.1 inverse formula, 1154 | `f=λ,n=4`: convolution with `μλ=μ²` gives `0−1+1=0`; at1 gives1. | Correct. |
| 11.1 Euler product, 1155 | f(n)=n⁻² for n>0, f0=0: local factor at2=`4/3`; full product=sum=`π²/6`. | Imported pinned Euler theorem, not a new Lean target. |
| 11.2 natural σ compatibility, 1182 | σ₁6=`12`, σ₀4=`3`, σ₋₁6=`2`; k0,1 agree with native σ. | Correct. |
| 11.2 σ convolution/prime powers/reciprocity, 1183 | σ₁4=`1+2+4=7`; `4σ₋₁4=4(1+1/2+1/4)=7`; convolution ζ with n at6=`1+2+3+6=12`. | Correct. |
| 11.2 divisor parameter specializations, 1212 | `d₀(p²)=0`, `d₁(p²)=1`, `d₋₁(p²)=0`, `d₃(4)=6`; at n1 every value1. | Correct. |
| 11.2 additive convolution law, 1214 | z=w=1/2 at p²: `3/8+1/4+3/8=1=d₁(p²)`; z=0 contributes only divisor1. | Correct. |
| 11.2 divisor majorant, 1219 | z=i at p²: modulus `|(-1+i)/2|=1/√2≤d₁(p²)=1`; z0 at n1:1≤1. | Correct. |
| 11.3 τ(n²) corollary, 1293 | Local coefficients `1,3,5`; at s3 value `ζ(3)³/ζ(6)≈1.70729`; no factor n0. | Correct. |
| 12.1 finite-mean identity, 1380 | Only a₀=1, N2,H4: average `(S₂+S₃)/2=1`; RHS `3/4+2(3/4−1/2)/2=1`. | Correct. |
| 13.1 count existence/junk, 1415 | B1,n2: no factorization, sInf empty=0; B0,n0 and n1: empty product gives length0; B2,n3 impossible because prime3 missing. | Correct. |
| 13.1 count upper/log lower, 1420 | B4,n4: `3≤4`, `3log4=4.158883≥log24=3.178054`; n0: `0≥0`. | Correct on stated domain. |
| 13.1 antitonicity, 1421 | n4: counts for B4,16 are3,2, so `2≤3`; B1 junk0 is outside B≥n. | Correct. |
| 13.1 pairing, 1422 | B4,n4: `count16=2=ceil(3/2)`; n0:0=ceil0. | Correct, real ceiling interpretation in prose. |
| 13.1 approximate factorization, 1443 | n4, A{4,4}: t2, product16; balanced A{2,3,4}: t3, product24; empty A product1. | Correct definition. |
| 13.1 waste, 1444 | A{4,4}: waste0; balanced A{2,3,4}: log(8/3)=0.98082925. | Correct. |
| 13.1 balance/total imbalance, 1445 | A{4,4}: balances at2,3=`(+1,−1)`, total2; balanced A: `(0,0)`, total0. | Correct. |
| 13.1 zero imbalance and exact waste law, 1446 | Balanced A: product24=4!, waste `3log4−log24`; unbalanced A: waste0 differs from `2log4−log24=log(2/3)`. | Correct with balance assumption. |
| 13.1 score definition/balanced score, 1448 | n4,L2,A{4,4}: score log(32/3)=2.367124; balanced A: score=waste log(8/3). Empty A score log(128/3). | Correct. |
| 13.1 imbalance reduction, 1452 | `{4,4}→{2,4}→{2,3,4}`: imbalance `2→1→0`, scores `log(32/3)→log(32/3)→log(8/3)`. | Correct reduction; R01 fixes final cardinality. |
| 13.1 initial A₀/count/waste, 1462 | n100,M=L2: 80 factors; waste24.81303397≤100log2=69.31471806. | Correct instance. |
| 13.1 initial balances, 1465 | Same A₀: balance3=4, balance2=1; ten large prime balances−1; bound for all primes `Mlog100/log2≈13.2877`; medium balances≤2. | Correct instance. |
| 13.1 initial score estimate, 1472 | Same A₀ score55.33111137; five upper terms approximately69.31,138.16,244.77,∑large positive terms,145.01; sum exceeds score. | No counterexample found; asymptotic route uses M then L then n. |
| 13.1 small-score asymptotic route, 1476 | Fixed M,L: first term/n=`log(M/(M−1))→0` as M→∞; second asymptotic coefficient ≪M/L; remaining terms/n→0 at fixed M,L. | Consistent with sequential quantifiers; R01 needed for final implication. |
| 13.2 finite ranges/antitonicity, 1513–1520 | H3,6: empty input sets; H30 includes4=2+2 and30=7+23; restriction H30→H4 preserves witness. | Correct; finite decidability is mathematical, no computational project planned. |
| 13.2 elementary transfer, 1521 | Even30 yields odd33; 33−3=30=7+23, giving33=3+7+23. H<4 gives no troublesome odd inputs. | Correct. |
| 13.2 published ranges as hypotheses, 1531 | Even bound `4·10¹⁸` transfers to odd `4·10¹⁸+3`; published odd bound is exact integer `8875694145621773516800000000000`. | Treated as assumptions, not certified computations. |
| 13.2 Schoenfeld instance, 1562 | `x₀=2010882`: y=2010760.847933>2010759.9; `(H−4)16598+4=66391999999999999933612`. | Correct thresholds. |
| 13.2 Ramaré–Saouter instance, 1568 | x₀ is strict threshold+1; endpoint113255999999999999886744004≥1.1325·10²⁶. | Correct. |
| 13.2 Kadiri–Lumley chain, 1575 | e59≈4.20121·10²⁵<previous endpoint; next endpoint≈7.78513·10²⁷>e60≈1.14201·10²⁶; final≈7.86479·10²⁷. | Correct order; e60 cannot follow RS directly. |

### README Checks ledger

The 23 Checks blocks contain 104 bullets. Each row below identifies one bullet, in its printed order; computations repeated in the target tables were done once. Decimal values are regression calculations, not interval-certified estimates. The branch-winding assertion fails the parity computation in R06.

| Check | Computed values / negative control | Result/change |
|---|---|---|
| 7.1.1 | V2, Fourier norm at1/2=`2/π`; proposed halved bound=`1/π`. | Sharp constant correct. |
| 7.1.2 | ξ0: Fourier1, totalized bound0. | Nonzero-frequency hypothesis needed. |
| 7.1.3 | Half-line step: V1, limit at+∞1, not0. | Integrability needed. |
| 7.1.4 | Tent: V′4, transform at1/2=`4/π²`; combined zero-frequency bound `1≤1+1/π²`. | Correct. |
| 7.1.5 | Rational C² bump: transform at0=π, bound=`2π+1/(2π)`. | Correct. |
| 7.2.1 | Iπ=1.85193705>π/2=1.57079633. | Proposed smaller bound false. |
| 7.2.2 | Tail errors atπ,2π:0.28114073,0.15264475; bounds0.63661977,0.31830989. | Correct. |
| 7.2.3 | x−1: difference2.51687940; RHS−2. | Positivity needed. |
| 7.3.1 | atan10/π=0.46827448→0.5; endpoint value1. | Mean, not endpoint, correct. |
| 7.3.2 | Resonant tail→log2/(2π)=0.11031780; proposed L¹ rate≤1/T₀→0. | Correct family refutes uniform L¹ rate. |
| 7.3.3 | Errors0.03172552,0.46827448,0.49968169; optimized brackets0.89442719,8.94427191,89.44271910. | Correct magnitudes. |
| 7.3.4 | σ0: all totalized Mellin values0, integral0; one-sided mean0.5. | Convergence needed. |
| 7.4.1 | Each term−4/(π²(2n−1)²), sum−1; f(1/2)=1; error2. | Correct. |
| 7.4.2 | At sample m: sinc(π(m−n))=δmn, so error0 after N≥|m|. | Correct. |
| 7.4.3 | Absolute tail comparable to1/(nlog n), divergent; symmetric value=∫h cosπξ>0, total tsum0. | Consistent; existence of this h uses uncertified Katznelson locator. |
| 7.4.4 | f(1/4)=−2√2 i/π≈−0.90031632i. | Complex instance correct. |
| 8.1.1 | Four oriented contributions iπ/2 sum2πi; reversed orientation−2πi. | Correct. |
| 8.1.2 | Pole2 outside square; analytic boundary integral0; pole set empty. | Correct. |
| 8.1.3 | f1/s²: residue0 and boundary0. | Covers double poles. |
| 8.1.4 | Rightπ/2=left−π/2+horizontal−π+residue2π. | Correct sign. |
| 8.1.5 | exp(1/s): boundary2πi, native nonmeromorphic residue0. | Meromorphy essential for residue version. |
| 8.1a.1 | Essential singularity: circle coefficient1, integral2πi=boundary. | Correct. |
| 8.1a.2 | Circle1/z at radius1/2=2πi=2πi·residue1. | Correct. |
| 8.1a.3 | Both overlapping circles enclose0: sum4πi, boundary2πi. | Disjointness needed. |
| 8.1b.1 | exp s: RHS telescopes to e^{1+iT}−e, same as LHS. | Correct. |
| 8.1b.2 | Both sides−2.2208906054+1.1290164643i; wrong sign gives2.0878416455−0.5461306048i. | Correct. |
| 8.1b.3 | Pole0 has Re0<Re w and Im0<Im w, hence removed; no pole in D. | Correct domain exclusion. |
| 8.2.1 | M1: derivatives8,32,192 equal bounds; M0 strict claim0<0. | R05. |
| 8.2.2 | k1,rR/2: new8M/R versus source128M/R. | Correct. |
| 8.2.3 | k0,f=i,M0: norm1>0. | k≥1 needed. |
| 8.2.4 | Re f attains upper bound: f constant; positive-order derivatives0, RHS0. | Correct. |
| 8.3.1 | Linear polynomial: residual0; zero just outside r₂ disc gives reciprocal distance≤1/((r₂−r₁)R); at R1,ρ0.3 M=1.46633707. | Correct. |
| 8.3.2 | M0, constant f: both0. | Correct. |
| 8.3.3 | ε=.01,R1: missing-zero term100, M=log101≈4.61512; ratio100/M grows without bound as ε→0. | Zero subtraction needed. |
| 8.3.4 | Positive dilation λ2: logarithmic derivative and zero terms double; radius halves, RHS doubles. | Correct for positive real dilation. |
| 8.3.5 | `(z−.3)e^{2z}` residual2; on unit circle maximum at z1 gives M=2+log(.7/.3)=2.84729786. | Correct. |
| 8.3.6 | For pole-cleared ζ, derivative adds exactly1/(s−1); e.g. at s2 adds1. | Matches Part I convention, with s≠1 as in supplier. |
| 9.1.1 | At x=e⁻¹ convolution1; Mellin at s2=`1/4=(1/2)²`. | Correct. |
| 9.1.2 | At0, g⋆f=log2, f⋆g=0. | Positive x needed. |
| 9.1.3 | Support endpoints1,4; value at2=log2. | Multiplicative support correct. |
| 9.2.1 | Multiplicative mass0.02258872 versus additive0.03333333. | Correct. |
| 9.2.2 | On positive half-line ν=(1−x)²₊: at s1 transform1/3; at s0 divergent integral, so not entire. | Correct positive-half-line interpretation. |
| 9.2.3 | Mellinν(1)=1/30; Mellinν′(2)=−1/30. | Correct sign. |
| 9.3.1 | ε1 spikeν; at ε1/2 omitted prefactor gives mass1/2 instead of1. | Correct. |
| 9.3.2 | ε1/2 support `[.70710678,1.41421356]`; reverse exponent support[.25,4]. | Correct. |
| 9.3.3 | At0 and−1 explicit branch0; for ε1/2, unguarded ν((-1)²)=ν1 may be positive. | Zero branch discriminates. |
| 9.4.1 | Symmetric cutoff1=.5; stated nonsymmetric cutoff1=.70646845. | Correct. |
| 9.4.2 | cutoff0=0, hence a0·cutoff0=0 for arbitrary a0. | Correct. |
| 9.4.3 | Correct transform .30772441−.32852895i; wrong scaling .49617+.09889i; correct ε.05 value .23536046−.35128673i; wrong moduli .50593,.76245,16.37048,19133.61036. | Correct. |
| 9.4.4 | At T≫1, bound scale1/(T(1+εT)); εT=1 gives1/(2T), εT≫1 gives1/(εT²). | Correct asymptotic regimes, not a small-T claim. |
| 10.1.1 | δ₁,X1,symmetric bump: both.5. | Correct regression instance, not Lean padding. |
| 10.1.2 | X2,symmetric bump: difference.5 for small ε; omitted endpoint correction gives2Cε→0. | Correct `+1` control. |
| 10.1.3 | Continuous log-tent: Fourier L² norm finite; ∫dt/(σ²+t²)=π/σ; CS bound finite. | R03, claimed nonintegrability false. |
| 10.2.1 | Original c₀1: exponent20, but width at3=.910239>.5; replacement c₀1/4: exponent10, width.227560. | R04. |
| 10.2.2 | A₀/u^9+u minimized with u^{10}=9A₀logx; exponent proportional(logx)^{1/10}. | Correct. |
| 10.2.3 | Constant1/4,logx100:26.09861229 at t3. | Correct. |
| 10.2.4 | Wrong η(x)logx=c₀ constant; correct exponent grows as2√(c₀logx). | Correct negative control. |
| 10.2.5 | μ at x3: M3=−1, residue0; claimed asymptotic has zero main term. | Consistent specialization to 1/ζ. |
| 10.2.6 | Constant coefficients x3.5: floor−x=−.5; residue1. | Correct. |
| 10.2.7 | Original height T₀ saves exp(−2logT₀/log²(T₀+3))→1; corrected equation saves exp(−logT)=1/T. | Correct shifted-height control. |
| 10.3.1 | At t0: log3>log2, so1−β/log3>1−β/log2; pole correction coefficient1. | Correct region inclusion. |
| 10.3.2 | Simple pole L≈a/(s−1): L′/L≈−1/(s−1), independent of a; negative log derivative residue+1. | Correct. |
| 10.3.3 | Deleted Euler factor at1=1/2; correction at s2=−log2/3; zeros on Re s0. | Correct. |
| 10.3.4 | At Kℚ coefficient at p²=`log p≤log(p²)`; main residue1 for trivial χ,0 for nontrivial χ. | Correct coefficient normalization. |
| 11.1.1 | λ4=1=(−1)²; λ12=−1=1·(−1). | Correct. |
| 11.1.2 | μ4=0, μ2²=1. | Correct negative control. |
| 11.1.3 | Zero function f1=0, required1 in nontrivial R. | Correct. |
| 11.1.4 | At4 inverse convolution0−1+1=0. | Correct. |
| 11.1.5 | Restricted prime-support indicator f65=1=1·1; f15=0=1·0; infinitely many 3 mod4 primes killed. | Correct distinction from finite-zero ideal weights. |
| 11.1.6 | 2^Ω4=4=2²; 2^ω4=2≠2². | Correct. |
| 11.2.1 | σ₁6=12; σ₋₁6=2; σ_{1/2}4=4.41421356. | Correct. |
| 11.2.2 | Abscissas atν2 and−2:3 and1; wrong formula gives−1 in second case. | Correct. |
| 11.2.3 | ζ3ζ2≈1.97730435. | Correct. |
| 11.2.4 | Divisors0=∅, sum0; LSeries term at0=0. | Correct. |
| 11.2.5 | p² coefficient3/8; convolution3/8+1/4+3/8=1; series at2=√ζ2≈1.28254983. | Correct. |
| 11.2.6 | d₂(p^a)=a+1; d₃4=6; unordered three-factor count2. | Correct. |
| 11.2.7 | k2,s2: ζ2²≈2.70580808; choose(2,2)=1 versus multichoose(2,2)=3. | Correct; partial-sum number not independently interval-certified. |
| 11.2.8 | exp(i logζ3)≈.98311+.18300i. | Correct. |
| 11.2.9 | Writing Euler log minus principal log=2πik gives ratio of square roots `(−1)^k`; k1 yields−1, k2 yields+1. | R06; outside-strip condition does not determine parity. |
| 11.2.10 | z0: δ₁ series1, absolute abscissa⊥, not1. | Correct. |
| 11.3.1 | Local coefficients1,4,9,16,25; second10−1=9. | Correct. |
| 11.3.2 | τ(p^{2a}) coefficients1,3,5; s3 series≈1.70729. | Correct. |
| 11.3.3 | Complex shifts put Re denominator argument5.1>2; finite-sum/local-factor calculation consistent with2.4856−.3646i. | Numeric agreement; no interval certificate. |
| 11.3.4 | Boundary α2,β0,s3 prime term2/p+2/p³≥2/p, divergent. | Correct. |
| 11.4.1 | Four local coefficient triples `(1,2,2),(1,1,0),(1,−1,1),(1,p−1,p²−p)`. | Correct. |
| 11.4.2 | s3 ratios1.42031,1.18156,.84634; totient at4=1.11063. | Correct. |
| 11.4.3 | Totient critical prime term(p−1)/p²≥1/(2p), divergent. | Correct. |
| 11.4.4 | n12: μ1+μ2=1−1=0=μ²12. | Correct. |
| 12.1.1 | Alternating constants: S_{2m}=0,S_{2m+1}=1, means→1/2; odd n gives na_n=−n. | Correct exclusion. |
| 12.1.2 | a_n1: S_N=N, means(N−1)/2→∞; na_n=n≥0. | Correct. |
| 12.1.3 | Alternating inverse square roots: at odd n, na_n=−√n→−∞ despite series convergence. | Correct sufficient/nonnecessary distinction. |
| 12.1.4 | n0 bound0≥−K; a₀ shift d changes mean by d(N−1)/N→d. | Correct. |
| 13.1.1 | Counts(16,4)=2,(4,4)=3; log24/(2log4)=1.14624063. | Correct. |
| 13.1.2 | n0,1: factorial1=empty product, count0. | Correct. |
| 13.1.3 | n5..10 counts Bn=`4,4,5,6,7,7`, Bn²=`2,2,3,3,3,4`; exact exhaustive factor DP reproduced them. | Correct. |
| 13.1.4 | Stirling divided by2logn gives n/2−n/(2logn)+O(1); proposed wrong correction differs by n/(2logn), unbounded. | Correct. |
| 13.1.5 | Balanced waste log(8/3)=.98082925=3log4−log24. | Correct. |
| 13.1.6 | Scores2.36712361→2.36712361→.98082925; final3log4=log64≤log256. | Correct Check itself refutes fixed-cardinality sentence; R01. |
| 13.1.7 | A₀ cardinal80,waste24.81303397,score55.33111137; (log100!+score)/log100=91. | Correct. |
| 13.2.1 | Even inputs4..30 admit two primes; 30=7+23; odd33=3+7+23. | Correct. |
| 13.2.2 | Minimum sum of two primes4>2; minimum sum of three6>5. | Correct lower endpoints. |
| 13.2.3 | Even range at3 and odd range at6 each has zero admissible inputs. | Valid boundary control together with preceding negative Check. |
| 13.2.4 | (30−4)·2+4=56; all25 odd integers7..55 have prime triples, including55=3+5+47. | Correct. |
| 13.2.5 | Interval(5/3,5] contains2,3,5; choosing2 leaves7 odd; choosing5 leaves4=2+2. | Correct largest-prime device. |

### Suppliers, ownership and direction

Checked the eight named cross-roadmap contract subsections against the current available files, and checked the additional scope-only owners below. Names were resolved from the files, not inferred from the citation resolver. In particular its single unresolved-name lead is not a defect: `IsCompletelyAdditive.powOfAdditive_mul` is explicitly a target at `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:323–326`.

| Owner and checked locations | Contract comparison |
|---|---|
| `Completed/ContourIntegration/README.md:158–203`, Layers 2–4 | Meromorphic residues, circle and global null-homologous residue calculus. The package uses the pinned implementation and supplies rectangle-edge adapters. |
| `Completed/ArithmeticDirichletSeries/README.md:123–158`, §0.2; `:256–281`, §§6.3–6.4; Layers 9–10 | Ideal weights have finite zero-prime support; Perron has positive x and c and the half-weight endpoint. Package's general natural-indexed complete multiplicativity does not inherit that finite-zero restriction. |
| `TauCetiRoadmap/LFunctions/README.md:730`, Layer 3; `:929`, Layer 5; `:1440`, Layer 7 | Presented versus primitive characters, Euler products, continuation and boundary nonvanishing agree. The trivial character remains a pole case, not an entire L-function. |
| `TauCetiRoadmap/ZerosOfLFunctions/README.md:705`, §3.4; `:837`, §4.3; `:1046–1179`, §§6.2–6.5; `:1182`, §7.1; `:1398–1430`, §§8.5–8.6 | Wide strips and Jensen are the supplied analytic inputs; exceptional real zeros are retained and then avoided by a character-dependent width. Rectangle curve orientation is counterclockwise. Argument-principle §7.2 is not the general meromorphic edge theorem. |
| `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:813`, §0.30a; `:863`, §0.33; `:873`, §0.33a; `:2260–2280`, §§3.3–3.4; `:3007`, §3.24a | Local logarithmic derivative excludes the pole, the single-log pole-subtracted bound and divisor-square identity exist. Complex-parameter extensions here specialize to them with coefficients and signs unchanged. |
| `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:323–330`, §0.1a, supplied head | The complete-additivity exponential target includes all pairs; the coprime exponential target supplies multiplicativity of `2^ω`. No reversed supplier edge is needed. |
| `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/README.md:1322–1350`; `Suggested.lean:307`, §5.1, supplied head | `LSeriesHasSum_zeta_pow` has k natural, Re s>1, absolute summability and sum ζ(s)^k. This package extends the parameter to complex z; it does not invent a different natural divisor count. |
| `TauCetiRoadmap/ExplicitPrimeCounting/README.md:4441`, §7.1; `:4470`, §7.2; `:4491–4518`, §7.3; scope §§2.1,3.1,3.6 | Thresholds, strict/open endpoints and Δ values agree. All named verification, zero-region and zero-count hypotheses remain with the supplier. No unconditional short-interval theorem is claimed here. |
| `TauCetiRoadmap/AsymptoticExpansions/README.md:904–939`, §§8.1–8.2 | Mellin product normalization agrees after inversion of the integration variable; the supplier's full-line vertical shift differs from the finite rectangles and horizontal leftward limit here. |
| `TauCetiRoadmap/SpecialFunctionsEiLiErfIncompleteGamma/README.md:1087–1145`, Layer 9 | Entire Si and auxiliary functions are owned there. The bounds here are stated on the real integral without a competing special-function carrier. |
| `TauCetiRoadmap/TauberianBoundaryConvergence/README.md:21–78`, N1–N2 | Newman analytic-boundary convergence is distinct from Hardy–Landau's Cesàro hypothesis. |
| `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md:41–79`, T1 | Fejér L¹ uniqueness/approximation belongs there. The flat supplied checkout path was absent; the nested main path was available and read. |
| `TauCetiRoadmap/ExplicitZetaBounds/README.md:2454–2482`, §6.1; `:3259–3287`, §7.6, through roadmap tool | Numerical Perron and explicit Vinogradov–Korobov contracts are excluded, as the scope says. |

Ownership searches used `roadmaps grep` by object, including Mellin convolution, generalized divisor functions, Ramanujan, factorial factors, sampling, and Hardy–Landau. Main, completed, board-package and available open-head matches were compared; the supplied overlaps report reports no dropped section ids and no other head editing this folder. No fully qualified declaration of this namespace was identified in another owner. The extension ownership is justified by the broader carriers and hypotheses listed above; no supplier gap is declared or needed for the findings in this report. In particular the derivative Borel–Carathéodory estimate is not the pinned value estimate, and the BV/windowed inversion theorem is not the pinned continuous absolutely-invertible Mellin theorem.

Pinned checks used Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Representative definition/signature anchors, including the conventions that could otherwise silently change the statements:

| Pinned file and declaration | Verified distinction |
|---|---|
| `Mathlib/Analysis/MellinTransform.lean:75–117`, `MellinConvergent.comp_rpow`, `mellin`, `mellinInv`, `mellin_comp_rpow` | Positive-half-line integration, inverse factor1/(2π), and scaling factor `|a|⁻¹` with argument s/a. ε>0 yields exactly εs in the spike theorem. |
| `Mathlib/Analysis/MellinInversion.lean:49–94`, `mellin_eq_fourier`, `mellinInv_mellin_eq` | The log substitution has minus sign. Inversion needs positive x, Mellin convergence, vertical integrability and continuity; it does not supply jump inversion. |
| `Mathlib/Analysis/Fourier/FourierTransformDeriv.lean:792,856` | Differentiable Fourier derivative and C² estimate have the integrability assumptions stated in the contract; they do not already state global BV decay. |
| `Mathlib/MeasureTheory/VectorMeasure/BoundedVariation.lean:119,566`; `Mathlib/MeasureTheory/VectorMeasure/Integral.lean:774,876` | BV derivative measure, variation bound, norm bound and dominated convergence are present. |
| `TauCeti/Analysis/BoundedVariation/OneDimensional.lean:42–48`, `BoundedVariationOn.integral_deriv_smul_eq_neg_integral_vectorMeasure` | Real Banach carrier and real compact C¹ test; complex application splits the test into real and imaginary parts. |
| `Mathlib/Analysis/Complex/BorelCaratheodory.lean:109` | Value estimate, requiring M>0, rather than the package's arbitrary-order derivative estimate. |
| `TauCeti/Analysis/Contour/Residue/Basic.lean`, `residue`; `TauCeti/Analysis/Contour/Residue/Cycle.lean`, `classicalResidueTheorem_nullHomologous` | Meromorphic residue and null-homologous curve hypotheses are essential; essential singularities need the separate circle-integral theorem. |
| `TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74,84,89,130,138` | `heckeLFunctionC` is a normal-form meromorphic continuation; primitive equality on the right half-plane and punctured-germ equality elsewhere are supplied. |
| `TauCeti/NumberTheory/NumberField/Global/RayClass/Finite.lean:155` | `finite_rayClassGroup` is an instance, so searching only theorem/definition headers would falsely report it missing. |
| `Mathlib/NumberTheory/EulerProduct/Basic.lean:225,357` | General multiplicative Euler product and completely multiplicative hom version, with summable norms and the exact zero/one conditions. |
| `Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean:221` | Log Euler product is the Dirichlet series of χΛ/log, on Re s>1, not the principal logarithm of the continued value. |
| `Mathlib/NumberTheory/ArithmeticFunction/Defs.lean:434` | Multiplicativity is defined for a monoid with zero; complete multiplicativity in §11.1 does not secretly require addition or commutativity until the closure/convolution claims. |
| `Mathlib/Analysis/Asymptotics/SpecificAsymptotics.lean:176,191` | `cesaro_smul`/`cesaro` prove convergence implies mean convergence, not the converse asserted with Tauberian hypotheses here. |
| `Mathlib/Analysis/Fourier/LpSpace.lean:51,90` | Fourier isometry and `MeasureTheory.Lp.norm_fourier_eq` support the L² argument in R03. |

The dependency command requested in the brief was run on this README and the supplied merge order. Its complete diagnostic output was:

```text
depcheck: 228 roadmaps, 2122 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The requested out-of-folder diff statistic against `origin/main...HEAD` was empty. No checkout file was edited, no Git write or external post was made, and no Lean process was started.

### Source locator audit

The following groups were checked against the cached line-numbered text. A supported narrower source result is distinguished from the package's explicit generalization; a source error is not silently treated as certification of the erroneous version. The originally cached DLMF file was only a chapter index. Sections 6.2, 6.12 and 6.16 were fetched through the sources service from the official NIST site, using the existing `dlmf-ch6` key. The resulting request is resolved, with no missing-reference request remaining.

| Source and locator group | Comparison |
|---|---|
| `kontorovichtao-pntplus` line 189, Lemma3.1.4 | BV Fourier bound; package supplies Banach-valued route. |
| `kontorovichtao-pntplus` lines198–209, Lemmas3.1.5–3.1.6 | First-derivative BV and combined Fourier bounds. |
| `kontorovichtao-pntplus` lines210–220, Lemma3.1.7, printed p7 | C² hypotheses and constant; erroneous coefficient in proof confirmed visually in the PDF. |
| `kontorovichtao-pntplus` lines596–613, Definitions4.1.3–4.1.5/Lemma4.1.1 | Edge and U-contour orientation. |
| `kontorovichtao-pntplus` lines621–642, Theorem4.1.2/Lemmas4.1.2–4.1.4 | Rectangle reduction; last lemma omits2πi, corrected by package. |
| `kontorovichtao-pntplus` lines893–914, Definition4.3.1/Lemma4.3.2 | Multiplicative convolution and commutativity; package guards positive x. |
| `kontorovichtao-pntplus` lines916–946, Theorem4.3.1 | Product transform and integrability premise. |
| `kontorovichtao-pntplus` lines947–962, Theorem4.3.2 | Bump transform/decay for k1; package gives higher-order route, with R02 needed. |
| `kontorovichtao-pntplus` lines964–978, Definition4.3.2/Lemma4.3.3/Theorem4.3.3 | Spike, mass and εs scaling. |
| `kontorovichtao-pntplus` lines980–1005, Lemma4.3.4 | Spike mass near Mellin parameter1. |
| `kontorovichtao-pntplus` lines1007–1017, Theorem4.3.4/Definition4.3.3 | Indicator transform and cutoff; source omits convergence half-plane for indicator. |
| `kontorovichtao-pntplus` lines1025–1104, Lemmas4.3.5–4.3.8 | Cutoff plateaus, nonnegativity and upper bound1. |
| `kontorovichtao-pntplus` lines1107–1127, Lemma4.3.9 | Cutoff transform; source omits Re s>0, retained by package. |
| `kontorovichtao-pntplus` lines1128–1134, Lemmas4.3.10–4.3.11 | k1 decay and mass approximation. |
| `kontorovichtao-pntplus` lines1463–1498, Definition4.5.2/Theorem4.5.2 | Smoothed Chebyshev Mellin integral; package allows general absolutely convergent coefficients. |
| `kontorovichtao-pntplus` lines1502–1506, Theorem4.5.3 | Sharp/smooth comparison; package correctly adds endpoint correction+1. |
| `kontorovichtao-pntplus` lines1507–1516 and1673–1684, Definition4.5.3/Theorems4.6.1–4.6.2 | Log-power widths and transfer; arbitrary-width package route is stated separately. |
| `kontorovichtao-pntplus` lines1718–1723, Theorem5.2.3 | Weaker ζ log² bound, not the stronger general Hecke theorem; README says this. |
| `kontorovichtao-pntplus` lines1751–1758, Theorem5.3.2 | Weaker derivative Borel–Carathéodory constant. |
| `kontorovichtao-pntplus` lines1971–1977, Theorem5.3.7 | Local logarithmic derivative with nested radii and zero subtraction. |
| `kontorovichtao-pntplus` lines2984–3019, Definitions8.1.1–8.1.4 and balancing steps | Waste/score reduction; balance qualifier needed for exact waste identity; factor count can change. |
| `kontorovichtao-pntplus` lines3020–3095, initial construction and score | Smooth-integer initial construction and order of choosing M,L,n; package changes rounding and weakens some constants. |
| `kontorovichtao-pntplus` lines3096–3101, Theorems8.1.1–8.1.2 | Two factorial-factor asymptotics. |
| `kontorovichtao-pntplus` lines3151–3212, Definition9.1.3/Theorems9.1.11–9.1.15 | Natural-parameter divisor counts, not a complex-exponent source; README explicitly says so. |
| `kontorovichtao-pntplus` lines3215–3297, Definitions9.1.4–9.1.5/Theorems9.1.16–9.1.29 | Complex σ function and arithmetic identities. |
| `kontorovichtao-pntplus` lines3309–3323, Theorems9.1.31–9.1.32 | Upper convergence region and σ series; exact abscissa lower bound is the package's prime argument. |
| `kontorovichtao-pntplus` lines3324–3363, Theorems9.1.33–9.1.36 | Ramanujan, divisor-square and τ(n²) identities; source Ramanujan proof confuses convolution and pointwise product. |
| `kontorovichtao-pntplus` lines3379–3393, Theorems9.1.38–9.1.39 | 2^ω≤τ and convergence. |
| `kontorovichtao-pntplus` lines3454–3545, Theorems9.1.49–9.1.57 | Euler identities for2^ω andμ², square-divisor expansion and convergence. |
| `kontorovichtao-pntplus` lines3590–3640, Definition9.1.8/Theorems9.1.66–9.1.70 | Complete multiplicativity, λ series and corrected totient half-plane Re s>2. |
| `platttrudgian2020` lines21–32 and54–56 | Ingham factor(1−ε)/2 and Pintz factor1−ε; package does not claim either sharp fraction. |
| `oliveiraesilva-herzog-pardi2014` lines13–14 | Published even Goldbach endpoint4·10¹⁸. |
| `helfgottplatt2013` lines9–10 and27–31 | Exact odd endpoint and prime-ladder argument. |
| `alexeevetal2025factorial` §1, opening text | Neighboring problem391, correctly labelled method background rather than theorem392 source. |
| `estradavindas2012littlewood` lines32–35 | One-sided scalar Abel-Tauberian result; Banach Cesàro version requires the separately stated finite-sum proof. |
| `dlmf-ch6` §6.2, lines743–746, equation6.2.19 | Si tail written with auxiliary f,g and correct signs. |
| `dlmf-ch6` §6.12, lines246–365, equations6.12.5–6.12.8 | At n0 and x>0, remainders give f≤1/x,g≤1/x² with positive signs. |
| `dlmf-ch6` §6.16, lines183–185 | First maximum atπ, approximately1.1789π/2. |
| `ieantn-brown1967` lines37–40 and52–56 | Brown hypotheses/optimal constant and symmetric partial sums; this is a synopsis, not the original proof. |
| `ieantn-contourintegration` lines60–90 | Rectangle/circle conclusion including interior discs and differentiability on the punctured closed rectangle. |
| `ieantn-ch2v4` lines93–110 and135–162 | L-shaped identity/signs on the larger strip; package explicitly proves its weaker-domain extension. |
| `ieantn-erdos392` lines16–26,62–65,72–75,87–89 | Upper/lower bounds for both factor-size choices and asymptotic constants. |
| `ieantn-goldbach` lines46–73,91–115 | Natural-bound transfers and numerical chain; package explicitly proves real-bound extension. |
| `ieantn-goldbach-vocabulary` lines25–51 | Lower endpoints4 and7, natural prime summands with repetition. |

Audit counts: **35 Lean declarations**, **23 target-bearing README sections**, **87 additional target/convention rows**, **104 README Check bullets**, **44 source-locator groups across 13 accessible source records**, and **13 cross-roadmap owner/contract groups** appear above. Six findings were raised. The other computed instances did not refute their statements. The eight settled inaccessible source records below are not included in the verified-locator count. Scope citations and repeated citations are grouped, not counted as separate verifications each time they occur.

## Not verifiable

- `montgomeryvaughan2007` (Chapters5–6, especially §§5.1 and6.1), `titchmarsh1986` (ChaptersI andIII), `iwanieckowalski2004` ((1.25), (1.28), (1.31)–(1.33), (1.35), Chapter5), `tenenbaum2015` (II.4–II.5), `apostol1976` (Chapters2 and11), `hardy1949` (Cesàro-Tauberian material), `katznelson2004` (ChapterI), and `brown1967` (Theorem1) are settled uncertified sources. Their original texts and exact printed locators were not certified or requested again. In particular the convex-coefficient Fourier-series construction in Check7.4.3 and the original Brown proof remain dependent on these settled sources; the supplied IEANTN synopsis and the package's separate sampling proof were read.
- No new Lean elaboration or proof build was performed. Binder comparison used the supplied 35 elaborated signatures; the mathematical and source checks do not certify future proofs or runtime elaboration in a different environment.
- The published Goldbach computations and the explicit-prime supplier's computational hypotheses were not independently reproduced. The package correctly takes them as hypotheses; the small finite ranges and the endpoint arithmetic were checked here.
- Numerical integrations and finite Dirichlet sums were used as regression witnesses, without interval arithmetic. Exact counterexamples in R01–R06 do not depend on rounding. The complex Ramanujan sums to200,000 terms gave `2.4856119673−0.3646344172i` and `2.4856121278−0.3646344864i`, a difference of about`1.75·10⁻⁷`; this is consistency evidence, not a certified tail bound.
- Ownership against open pull requests without supplied local files was not exhaustively certified. Searches of the available main, completed, package and head index were used to locate matches, not to infer inaccessible statements. The eight direct supplier-contract groups were resolved as described above. The flat Toeplitz checkout in the brief was absent; its available nested main version was used. The scope-only PartII layer allocation was not independently checked against an unavailable supplied PartII head.

## Source issues

- **Misprint** in kontorovichtao-pntplus at Lemma3.1.7 proof, printed page7, line218: the source says the second-derivative coefficient is u/(4π²); it should be 1/(4π²); affects the proof.
- **Misprint** in kontorovichtao-pntplus at Lemma4.1.4, printed page17, line639: the source says the rectangle integral equals the simple-pole coefficient; it should be 2πi times that coefficient; affects a stated result.
- **Error** in kontorovichtao-pntplus at Theorem4.3.4, printed page25, lines1010–1011: the source says the indicator's Mellin transform is 1/s without a convergence restriction; it should be asserted for Re s>0; affects a stated result.
- **Error** in kontorovichtao-pntplus at Lemma4.3.9, printed pages27–28, lines1107–1124: the source says the cutoff transform formula holds without restricting s and compact support proves weighted integrability; it should be restricted to Re s>0 because the cutoff equals one near zero; affects a stated result.
- **Error** in kontorovichtao-pntplus at Theorem4.5.3, printed page37, lines1502–1506: the source says the sharp/smoothed error is uniformly O(εX log X); it should be O((εX+1)log X), or impose an appropriate lower bound on εX; affects a stated result.
- **Error** in kontorovichtao-pntplus at Lemma8.1.2, printed page74, lines2990–2991: the source says approximate-factorization waste equals t log n minus log n! without a balance qualification; it should be asserted only for balanced factorizations; affects a stated result.
- **Error** in kontorovichtao-pntplus at Theorem9.1.33 proof, printed page83, lines3332–3334: the source says the relevant series uses convolution of the two divisor functions and negative exponent shifts; it should be a proof by pointwise products and the prime-power rational-factor identity with positive divisor exponents; affects the proof.
- **Error** in kontorovichtao-pntplus at the earlier hypothesis of Theorem9.1.70, printed page90, line3631: the source says the former totient-series half-plane was Re s>1; it should be Re s>2; affects nothing; corrected in print at Theorem9.1.70, printed page90, lines3629–3631.
