<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1780#issuecomment-6432704760 -->
Red team round 1 pass a (codex) of 33cda60

Verdict: needs_changes

1. **F01** (P2) The quadratic nonvanishing headlines are statable at the pins

   **Location:** packages/RankOneConverse/Suggested.lean:22–24; packages/RankOneConverse/README.md:393. “lacks the primitive quadratic-twist newform interface with its full local character family.”

   **Claim:** Neither branch of §4.1 can be stated with a few simple definitions on pinned carriers.

   **Witness:** TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104, TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:80, TauCeti/NumberTheory/ModularForms/LFunction/Sign.lean:148, and TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean:34 already provide newforms, analytic rank, root sign and quadratic characters. A coefficient-equality predicate identifies the twist without constructing it.

   **Exact repair text:** “State both §4.1 nonvanishing theorems in Suggested.lean. Quantify over native positive-level newforms f of even weight k≥2 with f.χ=1. Use ε(f)=Re(Complex.I^k*f.frickeSign hχ), whose value is ±1 for even k. For each discriminant D use the native fundamental-discriminant predicate and character; splitting at q is χ_D(q)=1. Express primitive twisting by existence of a native newform g : Newform M k at a positive level M, of the same weight k and with trivial character whose good-prime Fourier coefficients satisfy a_q(g)=χ_D(q)a_q(f) at every q outside the two levels and D. For every finite prime set S₀ containing the primes of the level of f, assert infinitely many D≠1 splitting at every q∈S₀, with ε(f)·D positive, respectively negative, and g.analyticRank=0, respectively 1. Strong multiplicity one fixes g and its actual ramified factors; no abstract analytic function or free predicate is introduced. Add only this simple twist predicate, the two sorry-ended headlines, their imports/docstrings, and the matching README names. Remove the Layer 4 not-statable claim.”

   **Retest:** For ε=+1 the two signs select D>0 and D<0; for ε=−1 they select D<0 and D>0, exactly §4.1. At a good q with a_q(f)=2 and χ_D(q)=−1 the predicate requires a_q(g)=−2 and rejects the unchanged form. A nonprimitive oldform is excluded by Newform.isNew; its L-function cannot replace the primitive one. All required binders and carriers exist; this is an existence statement, not a request to implement twisting first. No Lean elaboration was run.

2. **F02** (P3) The opening Skinner subsection locators do not exist

   **Location:** packages/RankOneConverse/README.md:29, :33 and :35. “§§2.1.1–2.1.2” and “§§2.1.3–2.3”.

   **Claim:** The published Skinner article has those numbered subsections for the realization and finite conditions.

   **Witness:** skinner-2020 line 237 starts §2.1; line 316 starts §2.2. There are no §§2.1.1–2.1.3. The Tate realization is at lines 253–261 and the finite conditions at lines 316–337.

   **Exact repair text:** At line 29 replace the locator by “skinner-2020 §2.1, pp.334–336”; at line 33 replace it by “skinner-2020 §§2.2–2.3, pp.336–339”; at line 35 replace “§2.1.2” by “§2.1”.

   **Retest:** §2.1 contains V=V_p(A_f)⊗L and L(V∨,s)=L(f,s); §2.2 contains the crystalline and unramified kernels and away-p vanishing. The corrected locations contain the claims.

3. **F03** (P1) The ramification set is not required to be finite

   **Location:** packages/RankOneConverse/README.md:31, :280, :292. “Let S contain infinity and every place over pND.” / “Prove finite generation of X_∞”.

   **Claim:** The relaxed-away-from-𝔭 dual is finitely generated for the allowed S, which includes the set of all places.

   **Witness:** Take E:y²+y=x³−x, p=5, K=ℚ(√−111), S=all places. E[5] is irreducible and 5 ordinary. Infinitely many primes splitting in K(E[5]) give unbounded residual Selmer dimensions; a finitely generated dual cannot.

   **Exact repair text:** “Fix a finite conjugation-stable set S of places of K containing infinity and every place over pND. All restricted-ramification cohomology, finite-generation and control statements use this finite S; the imprimitive analytic function deletes the matching finite set of Euler factors.” Carry this finiteness explicitly into the strict-control contract and its matching plan.json gap sentence.

   **Retest:** This curve has minimal discriminant 37. Counts #E(𝔽₃)=7 and #E(𝔽₅)=8 give a₃=−3 and a₅=−2. The mod-5 Frobenius polynomial at 3 is X²+3X+3, with nonsquare discriminant 2, proving irreducibility. At 37, −c₆≡31 is nonsquare, so the reduction is nonsplit multiplicative; v₃₇(Δ)=1 gives nonzero mod-5 inertia. The discriminant −111 is fundamental, is 1 modulo 8 and 4 modulo 5, so 2 and 5 split and 37 ramifies. Thus even the intended arithmetic hypotheses are met. Let 𝔪=(5,γ−1). Under residual irreducibility, the coefficient inclusions identify H¹(K,M_∞[𝔪]) with the 𝔪-torsion in the deformed H¹, where the chosen coefficient duality identifies M_∞[𝔪] with E[5]. Classes locally zero at 𝔭 belong to Sel_∞. For a fixed finite initial S₀, the localization sequence has m new singular terms each of dimension 2; the obstruction lies in the fixed finite-dimensional dual Selmer group for S₀. Thus the global dimensions are at least 2m−C. Imposing zero full localization at 𝔭 removes at most dim H¹(K_𝔭,E[5])≤6 dimensions. Their dimensions remain unbounded as m→∞, whereas a finitely generated Λ-module has finite-dimensional X_∞/𝔪X_∞. Thus S=all places really contradicts the claimed finite generation; it is not just a missing proof citation. Finite S removes this counterexample and matches skinner-2020 lines 329, 393 and 632, which explicitly use finite S (in §2.7, the fixed set of divisors of pND).

4. **F04** (P3) The local-point Check uses an algebraic tensor for a completion

   **Location:** packages/RankOneConverse/README.md:486. “E(ℚ_p)⊗ℤ_p≅ℤ_p⊕ℤ/p”.

   **Claim:** The local point module tensored algebraically over ℤ has this finite-rank decomposition.

   **Witness:** ℤ_p⊗_ℤℤ_p is not ℤ_p. After rationalization it is ℚ_p⊗_ℚℚ_p, of infinite ℚ_p-dimension; multiplication kills x⊗1−1⊗x for x∈ℤ_p∖ℚ. The completed local point module has rank one.

   **Exact repair text:** “In the local model lim_n E(ℚ_p)/p^nE(ℚ_p)≅ℤ_p⊕ℤ/p, the torsion image modulo p is the second coordinate. The class (1,0) lies outside it and has nonzero rational component; (0,1) lies inside it and has rational component 0.”

   **Retest:** The inverse limit of (ℤ_p⊕ℤ/p)/p^n is ℤ_p⊕ℤ/p; rationalizing gives ℚ_p, and the two classes have rational coordinates 1 and 0. This matches the completed point-group convention already used at README:84.

5. **F05** (P2) The unramified-coefficient gap repeats generic characteristic-divisor theory

   **Location:** packages/RankOneConverse/README.md:104 and packages/RankOneConverse/design/plan.json, gap:unramified-augmentation-divisor. “Extend characteristic divisors … to the completed maximal-unramified coefficient DVR” / “finite pseudo-null modules contribute no T-divisor”.

   **Claim:** Those two portions of the gap are missing from PadicMeasuresIwasawaAlgebras.

   **Witness:** TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2716–2733 already defines characteristic ideals for every noetherian normal UFD, via characteristic divisors over normal domains, and gives the pseudo-null criterion. No finite-residue-field hypothesis occurs.

   **Exact repair text:** “Use PadicMeasuresIwasawaAlgebras §4.6 for characteristic divisors, characteristic ideals and the pseudo-null criterion over the completed maximal-unramified coefficient DVR's power-series rings. What PadicMeasuresIwasawaAlgebras must provide (gap:unramified-augmentation-divisor): Prove faithful characteristic-divisor comparison under completed maximal-unramified coefficient extension and the augmentation criterion that a finitely generated O[[T]]-module whose torsion characteristic ideal lies in (T) after p-inversion, or whose Λ-rank is positive, has positive O-rank modulo T.” Mirror the narrowed needs sentence in plan.json.

   **Retest:** Ô^ur[[T]] is a noetherian regular local UFD despite its infinite residue field. The existing generic target assigns char(Ô^ur[[T]]/(T))=(T) and char(Ô^ur[[T]]/(ϖ,T))=(1). Only the new coefficient-comparison/augmentation application remains requested.

6. **F06** (P3) The Poonen–Stoll locator calls Theorem 8 a corollary

   **Location:** packages/RankOneConverse/README.md:475 and :582; packages/RankOneConverse/sources.toml, poonen-stoll version_note. “Theorem 5/Corollaries 6–9”.

   **Claim:** Items 6 through 9 in the cited copy are corollaries.

   **Witness:** poonen-stoll lines 456 and 461 label Corollaries 6 and 7; line 474 labels Theorem 8; line 510 labels Corollary 9.

   **Exact repair text:** Replace the range in both README locations and the manifest version_note by “Theorems 5 and 8, Corollaries 6–7 and 9, §§5–6, author-copy pp.10–12”. Keep §1 for the elliptic alternation statement.

   **Retest:** Theorem 5 supplies the obstruction identity; Corollary 7 supplies alternation; Theorem 8 and Corollary 9 supply the paired finite quotient. For a cyclic group of order 25 every alternating form is zero, so the finite cyclic exclusion remains correct.

## Verified sound

Read all 583 README lines and all 42 Suggested.lean lines. The package has **19 numbered mathematical targets**, **6 bold worked examples**, **91 Checks**, and **0 Lean declarations** (0 definitions, instances, theorems or variable blocks). The tables below record computed values, including the failed cases; “pass” means the tested instance agrees, not that a numerical example proves a deep theorem. Ninety of the 91 Checks agree as written; README:486 needs R04. All seven supplied source versions were readable. The source table resolves 32 locator groups, including the two erroneous groups in R02 and R06. Nineteen roadmap citation families were checked against their supplied heads, current indexed heads or main, as recorded below. Ten gap slugs and their needs sentences agree between README and design/plan.json.

The headline inventory is §0.1 residual restriction; §§1.2–1.4 arithmetic localization, semilocal image and strict kernels; §§2.1–2.4 the arithmetic deformation, reverse divisibility, control and augmentation obstruction; B; both §4.1 quadratic nonvanishing branches; A and A′; the §5.1 finite-Selmer implication and C; the derivative-twist construction and E. The simple predicate of §1.1 is supporting API. R01 concerns actual native newforms and their analytic invariants, not an abstract replacement for any Selmer or abelian-variety theorem. The remaining missing arithmetic carriers are expressly identified in the module docstring. No padding, admitted data, free Prop field, `set_option`, illegal import, duplicate fully qualified declaration, or dropped Lean instance was present. There is no declaration to subject to a `#check @name` or one-tactic probe; no Lean command was run.

The diff against origin/main contains seven files, all under packages/RankOneConverse. No computational algorithm, pull-request number or review-process instruction occurs in the README or module docstring. Earlier repair dispositions were read; none was marked “not actionable in this package,” so no finding here reopens such a disposition.

Dependency check, using the supplied configuration and the unchanged merge order:

```text
tauceti-roadmap gate --depcheck packages/RankOneConverse/README.md --name RankOneConverse --order merge-order/ORDER.txt --movable
depcheck: 56 roadmaps, 655 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The local proof order is 0 → 1 → 2 → B, then independent analytic twist nonvanishing → A/A′, then C, then E. The rank-zero derivative twist uses the local prescriptions of §4.2, not that section's rank-one/value conclusion. No reverse edge from the counting applications was found.

### Declaration and context register

| File and section | Declarations / variable and instance context | Computed boundary | Result / change |
|---|---|---|---|
| Suggested.lean:1–42 | Empty namespace TauCetiRoadmap.RankOneConverse; only import Mathlib; no section variables or instances | Declaration count = 0, sorry count = 0, padding count = 0 | Form is permissible for unavailable carriers; add the native §4.1 headlines under R01 |
| README conventions:27–35 | Nonzero characteristic-zero fields; weight 2; squarefree N>0; d≥1; p≥5; finite L/M_λ; actual geometric Tate V; K imaginary with D odd and 2,p split | d=0, N=0, p=2,3, zero coefficient ring, inseparable number-field extension are excluded; dim V=2, determinant cyclotomic, weights 0,−1 | No junk natural subtraction or zero denominator is used; S=all places is admitted and fails R03 |
| README:206–213 | Field L; finite-dimensional S₀; actual linear map to arbitrary L-space P₀ | Zero source: dim=0, injective=true, line=false; identity line: dim=1, ker=0; zero map on line: ker dimension 1 | Three discriminating Checks; finite-dimensionality explicitly retained |
| README:250–259 | H unrestricted rational cohomology; two full local targets, their finite lines and exchanged conjugation | Diagonal L²-image: dim=2, finite intersection=1, both projection kernels=0; coordinate-axis image: finite intersection=0 or 2 | Four discriminating Checks; conjugation transports the place as well as the class |
| README:280–290 | Λ=O[[Γ]], Γ≅ℤ_p; M∞ with inverse tautological action; specified coefficient-duality choice; one inertia kernel; un-inverted dual | At γ=1 fibre is L/O per lattice coordinate; Λ has characteristic 0 and coinvariant rank 1; inverse action moves root 1+p to (1+p)⁻¹ | Six discriminating Checks; finite S must be added (R03) |

### Target-by-target adversarial table

All line references in this table are to packages/RankOneConverse/README.md. The geometric/probabilistic defect classes involving nonproper schemes, non-quasi-separated spaces, fans, arbitrary topologies, equal-characteristic DVRs and cardinal changes do not enter these statements: their actual carriers are fixed number fields, coefficient DVRs, proper abelian varieties and canonical cohomology. They are not implicitly generalized to such objects.

| Target | Instances and values computed on both sides | Result / change |
|---|---|---|
| 0.1, :184, residual restriction | U=I+E₁₂ over 𝔽₅: U²=I+2E₁₂≠I, fixed line=Le₁ on both powers. Over 𝔽₂, U²=I. S₃ over algebraic closure of 𝔽₅ restricts to C₃ with eigenvalues ζ₃,ζ₃², hence two lines, while a transposition has 1,−1 | Squarefree nonzero residual unipotent excludes the S₃ model; characteristic 2 excluded |
| 1.1, :206–213, localization predicate and API | id_ℚ: (dimension, kernel dimension)=(1,0); zero_ℚ=(1,1); id_0=(0,0); id_ℚ²=(2,0). For e=2,h=3, loc(x)=(x,2x), loc′(2)=(3,6)=h(loc(1)) | All equivalences use the same map; no theorem needed in acceptance file |
| 1.2, :225, every coefficient place | Arithmetic rank d=2 gives M-rank 2/2=1, Tate-Sha cokernel 0. A torsion generator gives log=0 and Kummer=0; arbitrary coefficient projection (x,y)↦(x,0) gives component ranks 1,0 | Actual non-torsion point and supplied BSW eigenlogarithm exclude the zero component; finite coefficient extension preserves dimension 1 |
| 1.3, :238, semilocal image | Local dimensions 2+2=4; global (dim H¹,dim H²,dim strict)=(2,0,0) or (3,1,1); image=2−0=3−1=2. Trivial rank-one representation has dim H⁰=1 instead of 0 | Correct without assuming H²=0; use finite S explicitly (R03) |
| 1.4, :250–259, strict and one-sided kernels | Diagonal X⊂L²⊕L² has finite intersection dimension 1 and each projection rank 2. If image splits into axes, finite intersection dimensions are 1+1=2 or 0+0=0. If finite source dimension 2 and image 1, kernel dimension 1; at B(e), 1−1=0 | Equality of kernels alone does not assert vanishing; the extra source dimension is present |
| 2.1, :280–290, deformation and finite generation | n=2 yields weights (2,1),(−2,−3), two negatives. Λ/(p) has characteristic (p) and vanishes after p-inversion; Λ has characteristic 0 and coinvariants O. For S=all places residual augmentation dimensions ≥2m−C are unbounded | Finite generation false for admitted S; R03. Other action/duality choices are specified |
| 2.2, :305–311, reverse divisibility | char=(t²), analytic=t: (t²)⊆(t), valuation 2≥1. char=0 gives automatic containment without torsion. p=5,n₀=8 gives κ=16, 8 divides 16. Substitution γ↦a⁻¹γ evaluates to 1 at γ=a; wrong substitution gives a² | Direction and branch correct; exact control plus Fitting base change is used, not naive characteristic specialization |
| 2.3, :324–326, finite-error control | Finite cokernel ℤ/p has rational Tate dimension 0; divisible cokernel ℚ_p/ℤ_p has dimension 1. For scalar Frobenius a=2, V/(a−1)V=0; at a=1 quotient=V | Finiteness and cofinite generation retained; rational full-local kernel requires the stated unramified-kernel vanishing |
| 2.4, :336, obstruction and contrapositive | X=Λ/(t²): coinvariant rank 1; X=Λ/(t−p): coinvariants O/p, rank 0 and char not in (t) after p-inversion; X=Λ: rank 1; X=Λ/(p,t): rank 0 | Both torsion and positive-rank branches work; finite pseudo-null group alone cannot force rational nonzero kernel |
| 3.1, :357–369, B | Two inert primes: finite sign (+1), infinite sign −1; one inert prime: global +1. At d=2, rank and abelian order=2; f/K order=1. Rational/twist orders (0,1),(1,0) give 1; (1,1) gives 2 | Five hypotheses match source. Full-Sha step uses both factors and isogeny comparison, not a single primary subgroup |
| 4.1, :393–406, both general twist branches | ε=+1: value D>0, derivative D<0; ε=−1: value D<0, derivative D>0. D₀=−7,δ=17: D=−119≡1 mod8. In ℚ₃, 13 is a square unit, 2 is nonsquare; the two ramified Dirichlet characters both take value 0 at 3 | Full squareclasses correctly retained. Positive level 1/weight 2 has no cusp newform; theorem is then universally vacuous, not falsely existential. Native statement omitted: R01 |
| 4.2, :418–427, auxiliary field | At a ramified St⊗ξ prime μ(q)=−1, local sign −μ(q)=+1, global −1; at ramified St, local −1 and global +1. Two inert primes give (−1)² times −1=−1; q′=2 is prohibited by split-2 | Local alternatives supply the distinct odd q′. A split chosen residual prime would fail B(b), independently of the twist value |
| 4.3, :439–441, A | Rank d, complementary rank 0 give rank over K d+0=d; analytic 1−0=1 at each embedding; d=2 gives total 1+1=2. N=2q with both types St has one odd St prime, so neither local alternative | Entire-Sha and all-conjugate steps present; ordinary λ need not be unique |
| 4.4, :453, A′ | Nonsplit a_q=−1 corresponds to St⊗ξ, split a_q=1 to St; two odd split primes satisfy alternative, replacing one by 2 does not. Isogeny [2] on rank-one rational space is multiplication 2, rank unchanged | Actual elliptic/modular and Sha comparisons supplied; no claim of integral point isomorphism |
| 5.1, :475–477, finite Selmer line | (ℚ_p/ℤ_p)[p] and (ℤ/p²)[p] each have dimension 1, but rational Tate dimensions 1 and 0. Alternating form on cyclic ℤ/25 is identically 0. Local completed model (1,0) has rational coordinate 1, (0,1) has 0 | Pairing excludes finite cyclic alternative before localization; R04 corrects the model's notation |
| 5.2, :490, residual bad prime | Removing odd primes from squarefree N leaves 1 or 2. Genus at 1: 1+1/12−1/4−1/3−1/2=0; at 2: 1+3/12−1/4−0−1=0. Ramified odd residual conductor exponent 1 cannot be removed | No unowned replacement of fixed p by a large prime; finite-flat and irreducibility inputs stated |
| 5.3, :502–504, C | Base-change Selmer dimensions 1+0=1 versus wrong 1+1=2; analytic 1−0=1; local torsion-only coordinate gives rational 0, outside-torsion coordinate gives nonzero | Does not assume Sha finite; obtains full finiteness after analytic order 1 |
| 6.1, :527–529, derivative twist | Signs (+1)(−1)=−1; arithmetic 0+d=d, giving coefficient dimension d/d=1. At d=2, rank 0+2=2. Derivative branch gives order 1, whereas sign alone permits 3 | Does not use A's rank-one hypothesis on the original form; field construction preserves every local squareclass |
| 6.2, :542, E | Base-change order 1 = original order + twist order 1, so original 0; two embeddings give 0+0=0. Original order 2 would give 2+1=3≠1 | Nonzero holomorphic functions have nonnegative finite orders; no cancellation, no natural-subtraction junk value |

### Individual Check computations

“Pass” below records the given positive or negative control. Each row identifies exactly one README Check by line; the title/statement is recoverable from that line, and all values were recomputed rather than inferred from a sorry build.

| README line | Instance and computed values | Result / change |
|---|---|---|
| 39 | Inert count 2: (−1)³=−1; count 1: (−1)²=+1 | Pass |
| 40 | Ramified μ=−1: (−1)(+1)=−1; μ=+1: (−1)(−1)=+1 | Pass |
| 41 | χ_cyc weights −1; inverse +1; dual of (0,−1)=(0,+1) | Pass |
| 42 | Roots α+β=1, αβ=5; inverses sum 1/5, product 1/5; Euler polynomials 1−T+5T² and 1−T/5+T²/5 | Pass |
| 43 | Conjugate orders 1+1=2, not 1 | Pass |
| 44 | (6−1)/5=1; (6−0)/5=6/5; 6>2√5; p+1−2√p=(√p−1)²>0 | Pass |
| 88 | rank 2 divided by degree 2 gives component dimension 1; finite-primary Tate-Sha dimension 0 | Pass |
| 89 | For c=+1, (1+c,1−c)=(2,0); for c=−1, (0,2); determinant of ± map −2 | Pass; division by 2 only rationally |
| 90 | On ℤ/p², b(ng,mg)=nm·0=0; map to dual has rank 0 although group nonzero | Pass |
| 91 | Finite p-group has inverse-limit Tate module 0; ℚ_p/ℤ_p gives ℤ_p then ℚ_p | Pass |
| 92 | (−1)^0,(−1)^1,(−1)^2=+1,−1,+1; t³ odd, derivative at 0 is 0, order 3 | Pass |
| 131 | dq/q=2πi dz; q·dq/q=dq; omitting 2πi multiplies by 1/(2πi) | Pass |
| 132 | a₂−1−2=−3; 3/(−3)=−1 versus unnormalized 3 and zero 0 | Pass |
| 133 | Eigenprojector on Eisenstein correction =0; P(D+E)−P(D)=0 | Pass |
| 134 | [2] sends log 1→2, squared log 1→4 and quadratic height h→4h | Pass |
| 135 | At P in source, log_[2]*ω(P)=2=log_ω(2P); target-only point is not an input to [2]:A→A′ | Pass |
| 136 | (c/4)(2·1)²=c; simultaneous analytic-form scaling gives 4c | Pass |
| 137 | M⊗M projection (1,0) differs from orbit action (1,1); matching scalar log kills (0,1) | Pass |
| 138 | P=0 ⇒ log=0 ⇒ c·0²=0; a bare nonzero class can lie in a linear-log kernel | Pass |
| 190 | (I+E₁₂)²=I+2E₁₂ over 𝔽₅; both fixed spaces Le₁ | Pass |
| 191 | Same square over 𝔽₂ is I; fixed space grows to dimension 2 | Pass, excluded characteristic |
| 192 | C₃ eigenvalues ζ₃,ζ₃² distinct in algebraic closure of 𝔽₅; transposition eigenvalues +1,−1 | Pass |
| 219 | Identity line: dim 1, ker 0; zero map on line: dim 1, ker dimension 1 | Pass |
| 220 | Zero-source map: (dim,injective)=(0,true); identity on ℚ²=(2,true); both fail dim=1 | Pass |
| 221 | loc′(x)=(3x/2,3x); loc′(2)=(3,6)=3·loc(1); kernel 0 | Pass |
| 231 | M=ℚ, rank 1: 1/1=1; nonzero linear map from line has rank 1 | Pass |
| 232 | (x,y)↦(x,0) has component ranks 1,0 despite total rank 1 | Pass negative control |
| 233 | Torsion nP=0 gives n log(P)=0, hence log(P)=0; rational tensor P⊗1=0 | Pass |
| 234 | Extra divisible Sha line gives rational Tate cokernel dimension 1 rather than 0 | Pass negative control |
| 244 | Local target 2+2=4; image 2; deficit 2 | Pass |
| 245 | Global/strict pairs (2,0),(3,1) give 2−0=3−1=2 | Pass |
| 246 | Trivial coefficient H⁰=L, dimension 1 rather than required 0 | Pass negative control |
| 263 | Diagonal L²-image has dim 2; intersection with Le₁⊕Le₁ is diagonal Le₁ of dim 1; projection kernels 0 | Pass |
| 264 | Two e₁ axes give finite intersection dim 2; two e₂ axes give dim 0 | Pass negative controls |
| 265 | Finite source 2, image 1: kernel 2−1=1 | Pass |
| 266 | B(e) source 1 and injective map: image 1 and strict kernel 1−1=0 | Pass |
| 296 | Ψ(γ)^0=1; augmentation torsion fibre L/O, with every element p-power torsion; compact O has no such nonzero torsion | Pass |
| 297 | Local coordinates (0,b≠0): first inertia restriction 0, simultaneous restriction nonzero | Pass |
| 298 | X=Λ: extended char 0; X/tX=O of rank 1 | Pass |
| 299 | 0,−1 shifted by +2 and −2 gives (2,1),(−2,−3); inverse choice exchanges them | Pass |
| 300 | Λ/(p) has infinitely many powers of t, char(p); tensor with L is 0, char(0-module)=(1) | Pass |
| 301 | p=5,a=6: a²=36≠1; inverted root 1/6; γ⁻¹−6=−6γ⁻¹(γ−1/6); at a=1 both roots 1 | Pass |
| 317 | t²=t·t gives (t²)⊆(t); 1∉(t), so char(1) fails required direction | Pass |
| 318 | p=5,n₀=8: κ=16≥6 and 16 mod8=0; n₀=4 fails >6 | Pass |
| 319 | At γ=a: a⁻¹γ=1 while aγ=a²; take a=6 to obtain 1 versus 36 | Pass |
| 320 | R/(p,t): char=(1), Fitt=(p,t); specialization gives O/p with Fitt=(p)≠(1) | Pass |
| 330 | Tate_ℚp(ℤ/p²)=0; Tate_ℚp(ℚ_p/ℤ_p)=ℚ_p | Pass |
| 331 | Finite cokernel corank 0 preserves corank r; divisible-line cokernel adds 1 | Pass |
| 332 | a=2: quotient V/(1)V=0; a=1: V/0=V | Pass |
| 342 | Λ/(t²)/t=O rank1; Λ/(t−p)/t=O/p rank0; t−p at t=0 is −p≠0 after p-inversion | Pass |
| 343 | Λ/(p,t): height-one localizations 0, char(1), coinvariant rank0 | Pass |
| 344 | Λ: rankΛ1, char0, coinvariant rankO1 | Pass |
| 375 | gcd(D,N)=1 makes ramified clause true vacuously; two inert factors produce global −1 | Pass; conditional clause intentionally vacuous in this branch |
| 376 | d=2, each of two conjugate base-change orders 1: order2, rank2 | Pass |
| 377 | (0,1) and (1,0) sum1; (1,1) sums2 | Pass |
| 378 | (ℤ/5⊕ℚ₇/ℤ₇)[5∞]=ℤ/5 of size5; whole group infinite | Pass |
| 379 | log0=0 implies Lp=0; log1=1 implies Lp=c≠0; c=0 would make both values0 | Pass |
| 410 | ε=+1/value or ε=−1/derivative each forces δ>0; exchanging branch forces δ<0 | Pass |
| 411 | −7·17=−119; gcd(7,17)=1; 17 mod8=1; −119 mod8=1; squarefree and ≡1 mod4 | Pass; no analytic assertion |
| 412 | Squares mod3 are 0,1; 13≡1 lifts to square in ℚ₃, 2 does not; ramified Dirichlet values both0 | Pass |
| 413 | Quadratic field discriminant5 has χ(5)=0, while prescribed split means χ(5)=1 | Pass |
| 414 | t³ has sign−1, order3 and first derivative0; simple zero has derivative≠0 | Pass |
| 431 | Ramified St⊗ξ: −μ(q)=+1; global (−1)(+1)=−1 | Pass |
| 432 | Inert count2 gives (−1)^3=−1, count1 gives (−1)^2=+1 | Pass |
| 433 | All residual-ramified primes split ⇒ count of nonsplit residual primes0, contradicting ≥1; q′=2 conflicts with χ_D(2)=1 | Pass |
| 434 | D₀<0,δ>0 implies D₀δ<0; δ square locally gives [D₀δ]=[D₀]; nonsquare changes the class | Pass |
| 435 | Even germ t² has sign+1, order2, central value0; selected twist has order0 and value≠0 | Pass |
| 447 | d=1 gives1; d=2 gives1+1=2 | Pass |
| 448 | With two λ, ordinary predicates (true,false) and residual predicates (true,true) satisfy ∃ ordinary and ∀ residual; ordinary uniqueness not implied | Pass logical control |
| 449 | One odd St⊗ξ gives first alternative true; split types at 2,q give nonsplit count0, odd St count1<2 | Pass |
| 459 | Split a_q=1 gives μ(q)=1; nonsplit a_q=−1 gives μ(q)=−1 | Pass |
| 460 | Two odd split primes: count2; replace one by2: odd count1 | Pass |
| 461 | Isogeny [2] on ℚ-line invertible with inverse1/2; kernel and cokernel after rationalization0, rank1 | Pass |
| 483 | ℤ/25 cardinality25=5² but alternating form b(g,g)=0 forces b=0, hence nonperfect | Pass |
| 484 | Both p-torsion dimensions1; rational Tate dimensions1 and0 | Pass |
| 485 | floor(6+2√5)=10<25; floor(4+2√3)=7<9; local p-torsion exponents at most5 and3 | Pass, p=3 not asserted globally |
| 486 | Completed model rational coordinates1,0 work; algebraic ℤ_p⊗ℤ_p has infinite rational rank, not1 | **Fail: R04** |
| 496 | Genus formulas at levels1,2 evaluate to0,0; nonzero cusp form would require dimension≥1 | Pass |
| 497 | Squarefree ramified unipotent inertia: dim invariants1, Artin conductor2−1=1 | Pass |
| 498 | Rational 5-torsion on 11a1 gives invariant line in E[5], so irreducibility=false | Pass negative control |
| 510 | Residual inertia at specified p must have nonzero J; ramification only at another p′ allows J=0 at p | Pass logical control |
| 511 | Selmer dimensions1+0=1; alternative1+1=2 | Pass |
| 512 | Local class(0,1) in torsion summand rationalizes to0; class(1,0) to1 | Pass |
| 513 | ℤ/5⊕ℚ₇/ℤ₇ has finite5-primary part but infinite7-primary part | Pass negative control |
| 535 | (+1)(−1)=−1; value branch gives order0 instead of derivative branch1 | Pass |
| 536 | 0+2=2 arithmetic rank, divided by d=2 gives coefficient dimension1 | Pass |
| 537 | t³: sign−1, derivative0, order3; selected derivative branch: derivative≠0, order1 | Pass |
| 538 | Negative D₀ times positive square-at-S δ stays negative with identical local classes; negative δ gives positive product | Pass |
| 548 | 1−1=0; replacing twist order by0 gives1−0=1 | Pass |
| 549 | Conjugate orders0,0 give sum0; knowledge of only one order0 leaves the other undetermined | Pass |
| 550 | Proposed orders2,1 sum3≠1; nonnegative orders cannot cancel | Pass |

### Bold worked-example register

| Example and line | Computed values | Result / change |
|---|---|---|
| Degree-two coefficients, :566 | 2/2=1 per coefficient; local dimensions2,2; semilocal image2; finite image1; strict kernel1−1=0; product order1+1=2 | Consistent with §§1 and 3 |
| Ramified modular geometry, :567 | μ(q)=−1 gives finite sign+1 and global−1; denominator−3, numerator3, quotient−1; opposite sign convention gives same square1 | Consistent; permission for ℓ=2 means 2∤N |
| Quaternionic geometry, :568 | Two finite ramified places of quaternion algebra give product of Hasse invariants+1 with split infinity; root number−1. One inert place gives root number+1 | Correct indefinite/definite distinction |
| Augmentation and bounded errors, :569 | For Λ/(t²), Λ/(p,t), Λ/(p), Λ, ranks after coinvariants are1,0,0,1 | Correct distinction between finite and infinite p-power errors |
| Finite-Selmer/local torsion, :570 | p-torsion dimension1 for divisible line and cyclic finite group; cyclic alternating form0; local rational coordinates1 and0 | Completion interpretation as in R04 |
| Two twist branches, :571 | Rational signs−1,+1 require twist signs+1,−1; analytic subtractions1−0=1 and1−1=0 | Consistent with A and E |

### Resolved source locators

The following 32 groups use the cached versions named in sources.toml. They do not certify every proof in a cited article. Source errors affecting an otherwise correct locator are recorded separately below.

| # | Locator group and source-line witness | Resolution |
|---|---|---|
| 1 | skinner-2020 Theorems A/A′, pp.330–331; lines 66 and 78 | Same squarefree/local-type alternatives, rank and Sha hypotheses |
| 2 | skinner-2020 Theorems B/C, pp.331–332; lines 104 and 145 | Five B assumptions and finite-Selmer C assumptions retained |
| 3 | skinner-2020 Theorem E and §4, pp.351–352; lines 906–929 | Rank-zero converse via derivative twist |
| 4 | skinner-2020 §2.1, pp.334–336; lines 237–315 | Modular A, geometric Tate realization, twist and sign conventions |
| 5 | Purported skinner-2020 §§2.1.1–2.1.3 at README:29,33,35; lines 237 and 316 | Invalid subdivision; R02 |
| 6 | skinner-2020 Lemmas 2.2.1–2.2.2, pp.337–338; lines 345–392 | Parity and coefficientwise localization; the latter proof needs the BSW input explicitly supplied here |
| 7 | skinner-2020 Lemmas 2.3.1–2.3.2, pp.338–339; lines 402–431 | Dimension-two image and one-sided strict kernels |
| 8 | skinner-2020 §2.4, pp.339–340; lines 432–482 | Heegner cases, auxiliary Hecke denominator, Hodge representative |
| 9 | skinner-2020 Proposition 2.5.1/Corollary 2.5.2, pp.340–341; lines 501–521 | Nonzero point gives simple zero and conjugate-product order d |
| 10 | skinner-2020 Proposition 2.6.1/Corollary 2.6.2, pp.343–344; lines 606–621 | Squared-log formula; reverse nonvanishing uses actual-point eigenlogarithm |
| 11 | skinner-2020 §2.7 construction, pp.344–345; lines 623–662 | Inverse Ψ, inertia-strict group, un-inverted dual; S is finite |
| 12 | skinner-2020 Proposition 2.7.2, pp.345–346; lines 673–706 | Reverse inclusion after p-inversion and ψ₀ specialization |
| 13 | skinner-2020 (2.7.1), Proposition 2.7.3/(2.7.2), pp.346–347; lines 707–740 | Finite-error augmentation, rational kernel and contrapositive |
| 14 | skinner-2020 Lemma 2.8.1, p.347; lines 746–758 | Unipotent restriction argument; source restriction typo corrected in package |
| 15 | skinner-2020 §2.9, pp.348–349; lines 762–803 | B assembly and full Sha using the two rational factors |
| 16 | skinner-2020 §3, pp.350–351; lines 839–905 | Ordinary-prime/auxiliary-field choice and finite Selmer argument |
| 17 | bsw-2026 Theorem 1.1, p.3; lines 113–118 | Actual non-torsion algebraic point, degree=dimension, a real embedding |
| 18 | bsw-2026 Theorem 2.3/Remark 2.4, pp.4–5; lines 206–215 | General eigenlogarithm and automatic trace-field condition in real-field case |
| 19 | bsw-2026 §4, pp.10–11; lines 447–489 | Analytic subgroup proof applies to non-torsion generator; see source issues |
| 20 | bfh-1990 introductory Theorem (i)–(ii), pp.543–544; lines 76–86 | Derivative and value branches; OCR repeats “(i)” but manifest already records that artifact |
| 21 | bfh-1990 introductory local-twist discussion, pp.544–546; lines 94–99 and following discussion | Reduces root sign by a quadratic twist; primitive form needed at common conductor |
| 22 | bfh-1990 §9, pp.614–617; lines 3090–3224 | Residues, noncancellation, fundamental discriminants and infinitude |
| 23 | wan-2020 Theorem 1.2, pp.385–386; lines 125–143 | Both signs; p-inverted fractional-ideal inclusion, not integral equality |
| 24 | wan-2020 §2B–C, pp.392–394; lines 394–475 | Fitting/base change, Selmer conventions and control error |
| 25 | wan-2020 §7E, Proposition 7.7 and (7-2)–(7-6), pp.445–449; lines 3302–3460 | Interpolation, period and imprimitive comparisons; new anticyclotomic identification remains a declared gap |
| 26 | wan-2020 proof of Theorem 1.2, pp.479–480; lines 4961–4988 | Specialization, exceptional-prime discussion and normality |
| 27 | skinner-urban-author §3.1.6, pp.19–20; lines 733–767 | Fitting/base change and divisorial containment; generic ring caveat below |
| 28 | skinner-urban-author Proposition 3.2.8/Corollary 3.2.9, pp.23–24; lines 869–908 | Exact control under stated invariants hypotheses, then Fitting specialization |
| 29 | poonen-stoll §1 and §§5–6, pp.1–2,10–12; lines 425,456,461,474,510 | Elliptic alternation; obstruction identity and finite paired quotient |
| 30 | Purported poonen-stoll “Corollaries 6–9”; line 474 | Item 8 is Theorem 8; R06 |
| 31 | brooks-2015 §2.7, p.4190; lines 483–514 | Transfer and rational differential normalization; integral/unit caveat below |
| 32 | brooks-2015 Theorem 8.11, pp.4237–4238; Propositions 8.12–8.13/pullback, p.4239; lines 2029–2115 | Squared formula and source domain; printed square/domain slips are not copied into the package |

### Supplier and ownership register

The file in each row is TauCetiRoadmap/<roadmap>/README.md, at main for main roadmaps and the named current checkout/indexed head otherwise. The row lists the resolved sections and the relevant scope, rather than treating a search hit as proof. The independent object searches used `roadmaps grep`, the provided open-head checkouts, board packages, main and Completed. No declaration exists here that can duplicate a supplier's fully qualified Lean name.

| Roadmap | Resolved citations and scope check |
|---|---|
| EllipticCurves | Layers 1–2, 3–5, 7: formal kernel, Tate/Weil data, Hasse, reduction, quadratic twist and finite Selmer/Kummer; good-reduction and p≥5 retained |
| AutomorphicGaloisRepresentations | §§1.4–1.5 orbit/coefficient realization; §4.1 strict geometric compatibility together with §§6.1–6.4 classical Tate/residual/special-prime comparison; §§7.2 and 7.5–7.7 purity, large image, fixed-bad-prime ramification and ordinary choice. Some ordinary λ versus every sufficiently large residually admissible λ remains distinct |
| GL2AutomorphicRepresentationsAndTransfer | R16.1.8; R16.3.2, .5, .6; R16.4.6; R17.3.1, .8; R17.4. Special conductor is 1 for unramified χ, 2a(χ) otherwise; rational JL requires actual models. R17.6.15's restriction theorem uses projective-kernel disjointness and does not replace this package's local-unipotent argument |
| SelmerIwasawaCohomology | §§2.1–2.12a, 2.16–2.20, 2.24; 3.0, 3.8–3.16; 4.9, 4.24, 4.26, 4.28–4.29. Generic Kummer/descent and elliptic alternating pairing present. Family parity in 4.28 is not absolute root-number parity; the latter is correctly declared as a gap. Generic contragredient dual convention is explicitly converted to Skinner's un-inverted Λ-dual |
| ArithmeticGaloisDuality | R02.1.3; R02.3.1; R02.4.2–4.4; R02.5.1. Rational/compact comparisons, PT and Euler characteristic present. Finiteness target explicitly requires finite S: R02.4.4, “Finiteness of Galois cohomology with restricted ramification”; this independently supports R03 |
| PadicMeasuresIwasawaAlgebras | §§1.1–1.4, 4.1–4.6, 5.1–5.2, 6.5. Generic divisor target at :2716–2733 already covers noetherian normal UFDs; finite-free coefficient comparison at :2818 does not cover completed maximal-unramified extension. R05 removes only existing portions of that gap |
| AutomorphicCongruences | §2.22, “Wan's ordinary GU(3,1) Rankin–Selberg divisibility,” resolved in the board-indexed bfa3205 copy at :1165. The citation resolver's sole unresolved-name lead was therefore not a missing supplier. Its theorem is the ordinary single-form two-variable theorem, not the later nonordinary variation |
| GrossZagierAndArithmeticHeights | §§0a.3–0a.4, 0.7, 3.2–3.4, 4.2, 8.3, 8.13, 8.17, 9.6–9.22 at the supplied open head. Hodge/eigenprojector comparison, every-real-embedding height conclusion, genuine-point eigenlogarithm and point Kummer/logarithm are present. Ramified Case I is §9.17. The ψ₀/Wan dictionary remains a separate declared extension |
| HeegnerPointEulerSystems | §§1.4–1.6, 7.11–7.12 at the supplied head. 7.11 is the classical trace-point result; 7.12 retains maximal-order/non-CM/RM realization hypotheses. The general GL₂ forward application is expressly a gap, not falsely attributed to 7.12 |
| EllipticCurveModularityPartII | §6.0e at the supplied head, :674, gives rank-zero Mordell–Weil finiteness for every weight-two trivial-character newform of any positive level. It does not supply full Sha; package keeps the latter separate |
| AutomorphicLFunctionsAndLocalFactors | AL.1–AL.3: local factors, norm shifts, standard continuation, Rankin products and strong multiplicity one. Actual modular-abelian/Tate/product identification remains the declared arithmetic extension. Native analytic-order algebra alone is not that identification |
| MetaplecticAutomorphicForms | §§8.85–8.87, :3420–3452: BFH two-cusp/local-test exports retain first-cusp (2mN³)⁻¹, opposite-cusp (2m)⁻¹ and unscaled rank-zero term. They do not already assert final twist infinitude; this package owns that deduction |
| SerreWeightAndLevelOptimisation | §§2.10 and 4.7–4.8: odd-prime lowering and finite-flat weight-two bridge. They retain irreducibility at the specified p, rather than requiring a replacement large prime |
| EllipticCurveModularity | R29.5 quotient isogeny/modular parametrization and R29.6 modularity/actual elliptic L-function comparison. They provide the transport used in A′ and C |
| ArithmeticStatisticsPartI | §0.6, “Squarefree integers in residue classes,” :1241: fixed coprime residue class, density (6/π²)/q times ∏_(ℓ divides q)(1−ℓ⁻²)⁻¹. At q=8 this is 1/π², as used |
| ModularForms | Layers 10B–10C, :1068–1130: compact surface cohomology/genus and canonical section-space/differential dictionary; no nonzero weight-two form at genus-zero levels1,2 |
| ModularCurvesPartII | §7.2, :2428 in the indexed readout: f↦2πif(z)dz, effective cusp width and regular differentials; at width1, f=q+… gives dq+… |
| ArithmeticStatisticsPartVI | “Anticyclotomic main-conjecture implication,” “Heegner logarithm and low rank,” and §4.22's two rank-one criteria. Coprime elliptic instances already owned there are acknowledged. The new coefficient-degree and ramified-case conclusions here are stated as general extensions of those supplied instances |
| ModularIwasawaMainConjectures | §5.4, third rank-zero converse, :1718 at supplied head: elliptic arbitrary-conductor, good ordinary p>3, irreducible E[p] and finite Sha[p∞]. Package identifies its d=1 E as an existing special case and develops the wider GL₂-type derivative-twist argument |

The exact ten gap declarations were also checked as contracts:

| Gap slug | Boundary calculation and disposition |
|---|---|
| squarefree-base-change-signs | Split→+1, unramified field→−1, ramified μ=±1→∓1, complex infinity→−1; named earlier owner, same slug/needs |
| gl2-rational-kummer | rank d and finite primary Sha yield component dimension1 and cokernel0; an extra divisible Sha line adds cokernel dimension1; genuine coefficient comparison requested |
| quadratic-abelian-sha | ± matrix has determinant−2; inverse uses1/2; nonzero finite 2-primary errors allowed; abelian extension of the supplied splitting requested |
| ordinary-root-number-parity | Selmer dimensions0,1,2 require signs+1,−1,+1; family parity alone leaves the initial sign undetermined; absolute comparison requested |
| strict-anticyclotomic-control | Finite cokernel has rational Tate dimension0, divisible cokernel dimension1; exact specialization and that local error are needed. Add finite S under R03 |
| good-local-torsion-comparison | In the §5.1 application, the divisible Selmer line has p-torsion dimension1 and local completed coordinates (free,torsion); (1,0) detects the rational line, (0,1) does not |
| unramified-augmentation-divisor | char(R/(t))=(t), char(R/(ϖ,t))=(1) already supplied generically; faithful infinite coefficient extension/augmentation comparison is additional. R05 |
| wan-period-dictionary | γ↦a⁻¹γ takes evaluation at a to1; wrong twist gives a². Same removed factors and nonzero period augmentation are necessary; no independent second analytic function introduced |
| gl2-full-forward | Analytic orders0,1 require all-primary Sha finiteness; finite5-primary plus divisible7-primary is insufficient. General modular realization and nonsquarefree twists exceed the cited RM specialization |
| gl2-analytic-products | Newform orders1,1 yield abelian product order2 at degree2; base-change orders0,1 yield1. Requires actual ramified-factor comparison, beyond the native analytic multiplication theorem |

These are conditional supplier contracts, not claims that their extra arithmetic results are already implemented. No supplier is “none.” Related clauses concerning one comparison diagram or its finite errors were treated as one precise contract, rather than rejecting every multi-clause needs sentence merely for its grammar.

### Pinned native API checks

Pins read from lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Paths below are relative to those library repositories.

| Declaration / source | Actual retained context and boundary |
|---|---|
| Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:46,131, continuousCohomology | Ring k, topological k, topological group G, TopRep k G, degree n; body is `(homogeneousCochains A).homology n`. No finite-dimensionality or arithmetic finite condition is included |
| Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:62,71, ContinuousCohomology.tateShafarevich | K:Type u a field, index V:Type v, family f:V→Type u of field extensions, TopRep ℤ Gal(K), degree n; intersection of actual restriction kernels. Empty family gives the whole cohomology group, showing why this alone is not a geometric abelian Sha carrier |
| TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95 | Field K; group object over Spec K, proper structure map, geometric integrality. These fields are present; modularity, Hecke action and complex L-function are absent |
| TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean | Tangent-space API exists for the native abelian-variety carrier; its existence does not select a newform's modular quotient or eigenlogarithm comparison |
| TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104 | Newform N k retains `[NeZero N]`, integral weight k, cusp/eigenform/character data, isNew and coefficient-one normalization. Zero forms and arbitrary analytic functions are excluded |
| TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:65,72,80,107 | For hk:0<k, native L is nonzero, analytic order is finite, analyticRank is central order; rank0 iff central L-value nonzero. R01 uses this carrier, not a weakened scalar statement |
| TauCeti/NumberTheory/ModularForms/LFunction/Sign.lean:148,158 | Native functional equation has multiplier I^k·frickeSign for f.χ=1; theorem proves it is ±1. At k=2 multiplier is −frickeSign, not frickeSign |
| TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean:34,60 | Fundamental-discriminant character is integer-valued with modulus D.natAbs; at −1 its value is D.sign. The native discriminant convention admits D=1, which the requested quadratic-field statement must exclude |
| TauCeti/RingTheory/FittingIdeal/Basic.lean:343 and BaseChange.lean:128–136 | CommRing R,S; Algebra R S; AddCommGroup M; Module R M; Module.Finite R M. Arbitrary algebra base change; no flatness hypothesis. At k=0 it transports the zeroth Fitting ideal, not a Selmer module identification |
| TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:91,104 | Field K, affine Weierstrass curve W, IsElliptic and IsCharNeTwoNF; body is a subgroup of W.M cut out by local square-class conditions. This is two-descent, not the odd-p finite Selmer carrier of C |
| Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:79 | Elliptic LFunction has type ArithmeticFunction ℤ: Euler coefficients. The associated LSeries at :84 is the Dirichlet-series function; these declarations do not supply its continued analytic function and geometric comparisons needed by A′/C |
| Mathlib/Analysis/Analytic/Order.lean:523,528 | Analytic order of a product adds; the natural-order theorem retains finite-order hypotheses. This algebra already exists, but does not identify the actual abelian, newform and base-change functions |

The elementary linear-map operations listed at README:50 and Module.finrank were found at the pins. Their full API is deliberately absent from Suggested.lean. The ring/field and finite-dimensionality assumptions in the README's linear predicate are stronger than bare finrank notation and prevent a dimension-zero infinite-dimensional junk case from being misread as a line.

## Not verifiable

- No Lean elaboration or build was run, as required. Suggested.lean has no declarations, so there is no missing elaborated-signature comparison for the submitted file. R01 is a carrier/signature audit by reading the pins; the repair worker must elaborate the new signatures it writes.
- The ten declared supplier contracts are not proved by this review. In particular, exact anticyclotomic control, the ψ₀ period comparison, absolute parity and all-primary GL₂ forward finiteness remain conditional inputs. Their current absence is not a defect; R03 and R05 concern the finite-S hypothesis and a nonminimal request respectively.
- Finite tests verify signs, dimensions, directions and exclusions; they do not prove B, A, A′, C, E or quadratic nonvanishing. Source statements and supplier proof inputs were checked separately.
- The source cache is the supplied legal extraction. BFH is OCR; its already-recorded repeated “(i)” label is not reported as a source misprint. Ambiguous OCR coefficients were not used as new package findings. No additional missing source was needed, and no source request was created.
- Ownership against open pull requests without supplied checkouts or a readable indexed new-roadmap head was not checked. Broad object searches are not a certification of every unrelated open request. No later roadmap was used to fill a prerequisite.

## Source issues

- **Gap** in skinner-2020 at Lemma 2.2.2, p.338 (skinner-2020 line 387): the source says coefficientwise localization injectivity follows from scalar extension and freeness; it should be supplemented by nonvanishing of every eigenlogarithm of an actual non-torsion generator; affects the proof.
- **Gap** in skinner-2020 at Corollary 2.6.2, p.344 (skinner-2020 line 619): the source says point and p-adic value nonvanishing are equivalent after establishing only the value-to-point implication; it should be justified in the reverse direction by the actual-point eigenlogarithm theorem; affects the proof.
- **Misprint** in skinner-2020 at §2.4, p.340 (skinner-2020 line 478): the source says Brooks's rational transfer normalization is in §2.8; it should be §2.7, p.4190; affects nothing.
- **Misprint** in skinner-2020 at the proof of Proposition 2.7.2, p.346 (skinner-2020 line 706): the source says the two coefficient rings are unique factorization ideals; it should be unique factorization domains; affects nothing.
- **Misprint** in skinner-2020 at the proof of Lemma 2.8.1, p.347 (skinner-2020 line 753): the source says to suppose the global residual representation is reducible; it should be the restriction to G_K is reducible; affects the proof.
- **Misprint** in skinner-2020 at §2.9, p.348 (skinner-2020 line 772): the source says unrestricted H¹ of the abelian Tate module becomes the finite coefficient Selmer group after scalar extension; it should be H¹_f on the abelian Tate-module side too; affects the proof.
- **Error** in bsw-2026 at Theorem 3.2, p.10 (bsw-2026 line 439): the source says every x, including torsion, admits B with a field embedding into End⁰(B); it should be restricted to non-torsion x, or allow B=0 without an embedding: x=0,W=0 otherwise forces the impossible embedding into End⁰(0); affects a stated result.
- **Misprint** in bsw-2026 at §4.1, p.10 (bsw-2026 lines 447 and 469): the source says the embedding index is Σ_F and the contradicted hypothesis is (ii); it should be Σ_E and hypothesis (b) of Theorem 2.3; affects nothing.
- **Error** in skinner-urban-author at §3.1.6, p.19 (skinner-urban-author line 738): the source says a nontorsion finite module over an arbitrary Noetherian ring has zero Fitting ideal; it should be restricted to domains: over A=k×k, M=k×0 is regular-torsion-free with Fitt_A(M)=0×k≠0; affects a stated result.
- **Error** in wan-2020 at §2B, p.392 (wan-2020 line 399): the source says nontorsion implies zero Fitting ideal for arbitrary Noetherian A; it should be restricted to domains: A=k×k and M=k×0 give nonzero Fitting ideal despite no regular-element torsion; affects a stated result.
- **Misprint** in bfh-1990 at §9, p.617 (bfh-1990 line 3215): the source says to combine equations (9.2) and (9.3) to cancel the polar terms; it should be equations (9.5) and (9.10), multiplied by M₃(2) and M₂(2) respectively; affects the proof.
- **Error** in brooks-2015 at §2.7, p.4190 (brooks-2015 line 514): the source says defining the transfer differentially over O_F[1/N] makes its scalar ambiguity a unit; it should be a primitive generator of a specified integral eigenline; integrality alone permits nonunit scalar multiplication; affects a stated result.
- **Misprint** in brooks-2015 at the proof of Theorem 7.3, p.4228 (brooks-2015 line 1716): the source says ΘG_i=−(ρ−i+1)G_(i−1)=0 for i<ρ; it should be ΘG_i+(ρ−i+1)G_(i−1)=0 for 1≤i≤ρ, with ΘG₀=F; affects the proof.
- **Misprint** in brooks-2015 at the proof of Theorem 8.11, p.4238 (brooks-2015 lines 2074 and 2089): the source says to apply θ^(−1−j) again to the Coleman component after substituting that component for θ^(−1−j)f; it should be the component alone, with the displayed 1/j! retained; affects the proof.
- **Misprint** in brooks-2015 at Propositions 8.12–8.13, p.4239 (brooks-2015 lines 2108 and 2115): the source says the squared Euler factor multiplies a first power of the logarithm; it should be the squared logarithm, as in Theorem 8.11; affects a stated result.
- **Misprint** in brooks-2015 at the pullback identity before Proposition 8.13, p.4239 (brooks-2015 line 2112): the source says P belongs to C′ while applying φ:C→C′ to P; it should be P∈C, with φ(P)∈C′; affects a stated result.
- **Misprint** in brooks-2015 at §8.1, p.4230 (brooks-2015 line 1780): the source says ψ_t has infinity type (6h,−6h) although its defining exponents contain t; it should be (6ht,−6ht), which also makes the subsequent large-t argument work; affects the proof.
- **Misprint** in brooks-2015 at the proof of Theorem 8.11, p.4238 (brooks-2015 lines 2065 and 2094): the source says the cited results 7.3 and 7.4 are lemmas; it should be Theorem 7.3 and Proposition 7.4; affects nothing.
- **Misprint** in brooks-2015 at the weight-two explanation following Theorem 8.11, p.4239 (brooks-2015 line 2099): the source says the χ-weighted sum uses P_χ in every summand; it should be the CM point P_a indexed by the summed ideal class a; affects a stated result.
- **Error** in brooks-2015 at Proposition 8.13 and its preceding descent claim, p.4239 (brooks-2015 line 2113): the source says the weighted projected cycle is K-rational for every central-critical χ of type (1,1); it should be over the relevant class field; K-rationality follows for trivial finite part χN⁻¹, or for the zero cycle; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "33cda60a8e6616dd1518e9cea8cb12ba325f7414", "job": "RT-RankOneConverse~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
