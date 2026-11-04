<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1744#issuecomment-6423889201 -->
Red team round 1 pass a (codex) of 07fd530

Verdict: needs_changes

1. **F01** (P1) The required local twist-ratio theorem is cited in the wrong supplier section

   **Location:** `packages/RankZeroOneBSDPartII/README.md:101`, also :374 and :383: “The required instances of the latter local table are part of this local-ratio contract.”

   **Claim:** ArithmeticStatisticsPartVII §5.10 supplies a ratio-one twist at every bad prime other than three, including two, and the required good-ordinary differential table at three.

   **Witness:** `TauCetiRoadmap/ArithmeticStatisticsPartVII/README.md:2336`, §5.32 “Attainable local three-isogeny ratios”, owns these existence statements and tables. Section 5.10's Tamagawa formula gives the ratio of an already specified twist; it does not select one at a bad dyadic place.

   **Exact repair text:** Replace the last sentence of the supplier paragraph with: “ArithmeticStatisticsPartVII §5.32 ‘Attainable local three-isogeny ratios’ supplies the Kodaira/twist and differential tables and the existence of a ratio-one twist at every finite prime other than three, including two. Section 5.10 supplies the ratio definition, Tamagawa formula, strata and statistical bounds.” Add “ArithmeticStatisticsPartVII §5.32 ‘Attainable local three-isogeny ratios’” to §4.2's Needs and the Layer 4 dependency summary.

   **Repair test:** At a bad dyadic place, §5.32 expressly supplies a squareclass with c₂=1. Holding it fixed, finite-place ratios 1 and 3 yield real-sign pairs (1,1/3) and (3,1), respectively, as §4.2 requires. No new gap or duplicate local table is needed.

2. **F02** (P2) The density-tower citation assumes a limit that the application does not have

   **Location:** `packages/RankZeroOneBSDPartII/README.md:391`: “Use the existing relative-density tower theorem.” Also :91 and :400.

   **Claim:** ArithmeticStatisticsPartI §0.1's density-tower theorem supplies the passage from a lower relative proportion to the asserted absolute lower proportion without existence of the analytic-rank density.

   **Witness:** `TauCetiRoadmap/ArithmeticStatisticsPartI/README.md:318` requires both limits. In T=8ℕ, alternate full and half-filled blocks with endpoints 2^(2^k). Relative lower/upper densities are 1/2,1; μ(T)=1/8 and absolute lower density 1/16. The relative limit does not exist.

   **Exact repair text:** Replace that sentence with: “For the rank-zero or rank-one subset B of the nonempty stratum T, the eventual cutoff identity r_X(B | all)=r_X(B | T)·r_X(T | all), together with 0≤r_X≤1, gives liminf r_X(B | all)≥(liminf r_X(B | T))·μ(T) by Mathlib's le_liminf_mul and convergence of the stratum ratio. This uses no limiting density of B.” In the supplier paragraph and Needs, cite ArithmeticStatisticsPartI §0.1 for the ratios and bounds, and `Mathlib/Topology/Algebra/Order/LiminfLimsup.lean:133` for `le_liminf_mul`, rather than attributing this lower-limit assertion to `HasDensity.trans`.

   **Repair test:** For the displayed block family, the repaired inequality is 1/16≥(1/2)(1/8)=1/16. Inside each half-filled block retain the even-indexed elements of T; the endpoints grow fast enough that the preceding blocks have negligible relative size. For the odd stratum it gives (5/6)(1/4)=5/24. An empty stratum remains excluded.

3. **F03** (P3) Three ArithmeticStatisticsPartI targets have moved out of §0.5

   **Location:** `packages/RankZeroOneBSDPartII/README.md:91`: “§0.5 ‘Quadratic twist squareclass family’, ‘Family defined by local conditions’, ‘Positive squareclass denominator’ and ‘Squarefree integers in residue classes’.” Also :383 and :472.

   **Claim:** All four named targets are in §0.5.

   **Witness:** `TauCetiRoadmap/ArithmeticStatisticsPartI/README.md:462` is §0.2's local-family definition; :1240 is §0.6's squarefree residue count; :1950 is §0.15's positive denominator. Only the quadratic-twist family is in §0.5 (:1118).

   **Exact repair text:** “Use ArithmeticStatisticsPartI §0.1 for relative density, §0.2 ‘Family defined by local conditions’, §0.5 ‘Quadratic twist squareclass family’, §0.6 ‘Squarefree integers in residue classes’, and §0.15 ‘Positive squareclass denominator’.” Update every Needs/dependency occurrence that specifically assigns the denominator or residue-count theorem to §0.5, including §§4.2 and 5.2.

   **Repair test:** In §0.6's formula, q=3 gives (6/π²)(1/3)(1−1/9)⁻¹=9/(4π²) for either coprime positive residue. Dividing by the total positive squarefree constant 6/π² gives 3/8. The §0.15 positive denominator permits the same signed-family normalization.

4. **F04** (P3) Theorem E is outside the cited page range

   **Location:** `packages/RankZeroOneBSDPartII/README.md:143`: “Theorem E and standing hypotheses, pp. 517–521”.

   **Claim:** Theorem E occurs in that published page range.

   **Witness:** CGLS line 201 identifies printed page 522; Theorem E starts at CGLS line 219. The standing good-reduction hypothesis is at CGLS line 79, printed page 518.

   **Exact repair text:** “(CGLS Introduction, standing hypotheses, pp. 518–521, and Theorem E, p. 522; Theorem 5.2.1, p. 574; CGLS lines 79, 219 and 2145.)”

   **Repair test:** Both r=0 and r=1 implications and the local-character exclusion occur at the corrected Theorem E locator. No mathematical statement changes.

## Verified sound

Read all 528 README lines and all 53 Suggested.lean lines. The file has **2 declarations**: one coefficient definition and one admitted theorem. The README has **17 numbered targets**, **21 definition-API bullets**, and **49 explicitly labelled Check bullets**. All are covered below; prose warnings in Checks are tested through the mathematical distinction they describe. Four definitions have at least three distinct diagnostic instances: the fixed-isogeny predicate, admissible family, nineteen-a3 model and obstruction model. There are no additional bold mathematical targets outside the numbered sections.

The **14 named supplier/ownership families** were resolved against main, furnished heads or the two board designs; their relevant sections are tabulated below. Three legal cached works were read at **24 distinct locators** listed below; 23 have correct stated pagination, and R04 fixes the remaining locator. No extra source fetch was necessary. These counts describe statement and hypothesis checks, not newly proved arithmetic theorems.

The pin revisions read from the manifest and confirmed by read-only git queries are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; content main is `546d9e45b73f2d2924cdc3b424ca5efe928c062f`.

### Acceptance signatures and headline coverage

The mathematical headlines are §§0.2, 1.1–1.2, 2.1–2.3, 3.1–3.3, 4.2–4.4 and 5.2–5.3. The thirteen other than §5.3 are individually described in the module docstring as unavailable on the pinned arithmetic interfaces. The actual odd-primary Kummer Selmer groups, continued elliptic L-function/order comparison, ordinary anticyclotomic modules and marked arithmetic isogeny-character families are not supplied by the raw L-series or generic localization kernel. No free predicate or abstract scalar substitute is used. The seventeen targets also contain the three README definitions in §§0.1, 4.1 and 5.1.

The supplied elaborated signatures were compared with the source and README. There are no section variables, universe variables, or hidden standing arithmetic hypotheses to retain. I ran no Lean command: the supplied two-signature artifact provides the elaborated types, and this pass is read-only. No signature changed.

| Declaration and section | Exact variable/instance context | Computed instances and both sides | Result / change |
| --- | --- | --- | --- |
| `scopeObstructionCurve`, Suggested.lean:38, Layer 5 | No arguments; native `WeierstrassCurve ℚ`; five real coefficient bodies | Coefficients (1,0,3,0,0); b₂=1,b₄=3,b₆=9,b₈=0; Δ=−2160; c₄=−71,c₆=−1837; c₄³/Δ=357911/2160 | Correct; retained only to state the theorem |
| `no_good_three_twist`, Suggested.lean:48, Layer 5 | Explicit d:ℚ₃, hd:d≠0; fixed native ℚ₃/ℤ₃ field, DVR and fraction-field instances; no IsElliptic premise is silently assumed | For v₃(d)=k, raw v₃(Δ)=3+6k and v₃(c₄)=2k, so v₃(j)=6k−(3+6k)=−3. Good minimal reduction would give v₃(j)≥0. At d=1,3,1/3 these are (3,0,−3),(9,2,−3),(−3,−2,−3). At d=0, Δ=0 and hd fails | True as typed for every nonzero local parameter, including rational twists; no change |

The one-tactic probe found no padding theorem. The single theorem needs invariant calculation, twist ellipticity, j transport through minimalization and the integral-j implication; no single pinned theorem states its conclusion. Both declaration names appear in the README, and no other backticked name is presented as an undeclared local definition. The sole Tau Ceti import exists and supplies the native twist.

### Per-target adversarial table

All references in this table are to `packages/RankZeroOneBSDPartII/README.md`. Write C for its fixed-isogeny hypothesis, η for the unramified quadratic character at three, and R for the augmentation-local coefficient DVR. Arithmetic conclusions below are checked as implications using the named suppliers, not asserted for arbitrary abstract modules.

| Target | Instances tried; computed values on both sides | Result / change |
| --- | --- | --- |
| §0.1, :119–145, fixed-isogeny predicate | At p=3, local characters (1,ω,η,ωη) have admissibility (0,0,1,1). Duality exchanges 1↔ω and η↔ωη. A good curve at p=2 has 2>2 false. Bad reduction gives the good-reduction conjunct false | Predicate coherent; Theorem E locator corrected by R04 |
| §0.2, :149–162, small Selmer | For S=(ℚ₃/ℤ₃)^c⊕M², s=dim M[3], (c,s)=(0,0),(1,0),(1,1),(0,1) give dim S[3]=0,1,3,2 and corank=0,1,1,0. Thus dim≤1 forces s=0; cyclic ℤ/9 has dim[3]=1, corank=0 but cannot carry the required perfect alternating finite pairing | Correct; finite reduced-primary pairing, not full Sha finiteness, is necessary |
| §1.1, :176–189, complementary fields | r=0: w(E)=+1, twist sign −1 and twist order 1. r=1: w(E)=−1, twist sign +1 and twist order 0. Both products of signs equal −1. D=−3 has u=3 and is excluded; D=−4 is even and excluded | Correct conditional on the declared complementary-twist contract |
| §1.2, :193–205, corank over K | Two branches give 0+1=1 and 1+0=1. Split completions each have degree 1 and local p-torsion dimension 0, forcing global p-torsion dimension 0 | Correct; the forward theorem is applied to the known twist |
| §2.1, :219–233, augmentation control | X=R gives (coinvariant dimension,torsion length)=(1,0); X=R⊕R/(T) gives (2,1); X=R⊕(R/(T))² gives (3,2). A finite ℤ/3 error rationalizes to 0, whereas R/(T) has dimension 1. Tor₁(R/(T),R/(T))=R/(T), so a cokernel cannot be discarded | Correct with the declared control contract and finite-generation inputs |
| §2.2, :237–250, traced class | For a₃=2, α=5 and β=6 modulo 9: α⁻¹=2, (1−α⁻¹)²=1, α²(β−1)²=4 modulo 9; both valuations 0. On the trivial-character trace each Artin action is 1. α≡1 would instead make the first factor nonunit and is excluded | Correct; traced factor and Howard factor are distinct |
| §2.3, :254–267, non-torsion Heegner point | S=R, κ=1 gives quotient length 0 and bottom 1; κ=T gives quotient length 1, squared characteristic exponent 2 and bottom 0. Equality with torsion exponent 0 excludes κ=T. h_(O)(P)=1 gives h_x(P)=2>0; root sign −1 and nonzero derivative give order 1 | Correct; uses equality at augmentation and the injection, not inverted augmentation |
| §3.1, :281–294, p-infinity converse | Central order sums (a,b)=(0,1),(1,0) give 1 in both branches. Subtracting the known complementary order gives a=0,1 respectively. Trying r=2 violates r∈{0,1}; no natural-subtraction junk case is admitted | Correct |
| §3.2, :298–310, rank and whole Sha | At analytic orders 0,1 the supplied forward implication outputs ranks 0,1 and finite whole Sha. A discrete group ⊕_(ℓ≠p)ℤ/ℓ has p-primary size 1 but infinite total size, so single-primary finiteness would not prove the stated endpoint | Correct use of the stronger forward theorem |
| §3.3, :314–327, finite-Selmer converse | At dimensions 0,1, §0.2 yields coranks 0,1, then analytic/arithmetic ranks 0,1. The false alternative S=ℤ/3 has dim[3]=1, corank=0 and fails the paired finite-part condition | Correct |
| §4.1, :341–366, admissible family | For nineteen-a3, local classes (1,2,3,6) give (0,1,0,0); for its 2-twist they give (1,0,0,0). d=2 and18 differ by 3² and give the same class. For W, v₃(j)=−3 gives (0,0,0,0) | Correct; ‘rational kernel’ in the first Check is read as a pointwise rational kernel, not merely a rational subgroup scheme |
| §4.2, :370–383, positive ratio strata | Fix admissible c₃=1 or3 and all other finite ratios 1. Real ratios (1,1/3) give global exponents (0,−1) or(1,0). Every specified local squareclass has positive mass; their finite product is positive | Correct mathematics; R01/R03 repair supplier locations |
| §4.3, :387–400, relative analytic bounds | Even ranks with q at0 and 1−q at2 have mean 2(1−q)≤1 ⇒ q≥1/2. Odd ranks with q at1 and 1−q at3 give 3−2q≤4/3 ⇒ q≥5/6. For masses 1/8,1/4, absolute bounds are1/16,5/24; at mass0 there is no conditional assertion | Correct bounds; R02 supplies the missing lower-limit argument |
| §4.4, :404–416, positive absolute proportions | For positive stratum masses a,b, a/2>0 and5b/6>0. If A₃=∅ then a=b=0; W provides this case and fails the explicit good-twist premise | Correct scope |
| §5.1, :430–454, nineteen-a3 model | b₂=4,b₄=2,b₆=1,b₈=0; (Δ,c₄,c₆,j)=(−19,−32,8,32768/19). Over 𝔽₃ affine x-fibres have2,2,1 points, hence #E=6, trace=−2. Tangent y=x gives x³=0 | Correct definition and diagnostics |
| §5.2, :458–472, admissibility and density | Unit-squareclasses masses3/8 each, ramified masses1/8 each. Trivial kernel permits exactly the nonsquare unit class, hence3/8. 5/12−3/8=1/24>0, so the unrestricted 41.6% conversion cannot arise solely from this admissible set | Correct; R03 corrects the residue-count location |
| §5.3, :476–502, no good twist | P=(0,0), partials (0,3), tangent y=0, intersection x³=0. Δ=−2160,c₄=−71,c₆=−1837,j=357911/2160. v₃(j)=0−3=−3 for every nonzero twist; good reduction requires ≥0; A₃=∅ | Correct; same statement as the retained local Lean theorem |

### Definition APIs and boundary domains

Each row identifies an individual API bullet by README line. Identity/composition statements use the actual isogeny diagram, not an unmarked curve isomorphism.

| Statement | Instances and computed values | Result / change |
| --- | --- | --- |
| :125 constructor | p=3, good=1, degree=3, φ=η: all conjuncts1, C=1; replace η by1: exclusion0, C=0 | Correct |
| :126 projections | Admitted tuple yields (p>2,good,degree=p)=(1,1,1); degree1 cannot equal3 | Correct |
| :127 actual characters | φ=η gives ψ=ωη and φψ=ωη²=ω; φ=1 gives ψ=ω and exclusion0 | Correct |
| :128 duality | Admissibility vector (0,0,1,1) is invariant under swapping 1↔ω,η↔ωη | Correct |
| :129 transport | A marked kernel generator rescaling by a∈𝔽₃ˣ has aφ(g)a⁻¹=φ(g), including a=−1 | Correct |
| :130 identity transport | Identity matrix gives Iφ(g)I⁻¹=φ(g), and id(id)=id | Correct |
| :131 composite transport | Two generator changes −1 and−1 compose to1; both transported characters equalφ | Correct |
| :347 admissible membership | Good=1 and φχ₂=η gives1∧1=1; good=0 gives0 regardless of character | Correct |
| :348 square invariance | 18/2=9=3², χ₁₈=χ₂; membership1=1 for nineteen-a3 | Correct |
| :349 initial twist | d₀=2,d=1: [1] admitted for E² iff[2] admitted for E, both1; d=2 gives[1] on E and both0. Heights of representatives1 and2 differ | Correct; bijection is not height preserving |
| :350 dual family | Twisted charactersη andωη both pass; 1 andω both fail; good reduction invariant under isogeny | Correct |
| :351 localization | Four classes1,2,3,6; original permitted subset{2}, its inverse image has mass3/8; for W permitted subset∅, mass0 | Correct |
| :352 C equivalence | For d=2 membership=1=C(E²,3,ι²); d=1 membership=0=C(E,3,ι); ramified d=3 both0 by bad reduction | Correct in both directions |
| :436 nineteen coefficients | Native projections(0,1,1,1,0); short-model projections a₁=a₂=a₃=0 would change two specified entries | Correct |
| :437 invariants | c₄³−c₆²=−32768−64=−32832=1728(−19) | Correct |
| :438 ellipticity | Δ=−19≠0 inℚ, with inverse−1/19; isUnitΔ=1 | Correct |
| :439 instance independence | Δ-unit inverse−1/19 times(−32)³=32768/19 for either proof of IsElliptic | Correct |
| :440 base change | For ℚ→ℚ[ε]/(ε²), coefficients remain(0,1,1,1,0), ε-coefficients0. In the zero ring all images0=1 and the formula remains true. A mapℚ→𝔽₃ would give1=f(3/3)=0, so none exists | Correct at the full commutative-ring generality stated |
| :492 obstruction projections/ellipticity | (1,0,3,0,0), Δ=−2160 with inverse−1/2160 | Correct |
| :493 obstruction invariants | c₄³−c₆²=−357911−3374569=−3732480=1728(−2160); j=357911/2160 | Correct |
| :494 local base change/minimalization | ℚ→ℚ₃ preserves coefficients and j. A coordinate scaling u changes v(c₄) by−4v(u) and v(Δ) by−12v(u), hence v(j) changes by0 | Correct |

Domain controls were applied throughout: p=0,1 are not primes; p=2 fails C; arithmetic curves are over characteristic-zero fields, so neither inseparable field extensions nor a zero/square-zero coefficient ring enters the converse. Those rings do enter :440 and were tested there. The zero Selmer module gives dimension/corank0, the zero augmentation module has rank0 and fails the rank-one premise, the unit characteristic ideal has length0, and an empty density denominator is expressly excluded. The quadratic projectors require 2 invertible; at p=2, 1/2 is not in ℤ₂. Nonabelian S₃ and Q₈ are not Selmer-module instances: their commutators can be nonidentity, whereas every supplied Selmer carrier is an additive abelian module. No theorem here quantifies over a cover, fan, arbitrary topological space or general group; those test classes cannot instantiate its domains. Total-function hazards are excluded by d≠0, nonzero discriminants, nonempty stratum denominators and r∈{0,1}.

### Every labelled README Check

The line identifier determines the statement; each row gives the computed diagnostic, including the mathematical content of prose warnings. “Retain” means the Check remains in README, not an instruction to add an acceptance theorem.

| Check line | Instances and computed values on each side | Result / change |
| --- | --- | --- |
| 33 | η(Frob)=−1,η(I)=1; ωη(I)=−1 and η·ωη=ω; admissibility(1,ω,η,ωη)=(0,0,1,1) | Retain |
| 34 | c=1 gives((1+c)/2,(1−c)/2)=(1,0); c=−1 gives(0,1); 2 is nonunit inℤ₂ | Retain |
| 35 | T maps to−T/(1+T), order1; constant3 is a unit after1/3, T still has constant coefficient0 | Retain |
| 36 | (8−2−2)/2=2=h_x(P); the (O)-height half-polar value is(4−1−1)/2=1 | Retain |
| 37 | 3/8+3/8+1/8+1/8=1; unit mass3/4;18/2=9 | Retain |
| 137 | η andωη each avoid1,ω, giving two true exclusions | Retain |
| 138 | φ=1 orω makes one prohibited equality true, exclusion0 | Retain |
| 139 | Multiplicative good flag0; at p=2, 2>2 is false | Retain |
| 140 | In a nonsplit extension of two nontrivial local characters, invariant subspace maps to0 in the quotient and is0 in the kernel, so dimension0; splitness is unused | Retain |
| 141 | At p=3 the admitted good model has a₃=2≠0,1 modulo3; ordinary flag1, both residual invariant dimensions0 | Retain |
| 157 | On cyclicℤ/9, alternating b(g,g)=0 forces b(ag,bg)=0 for all a,b; radical size9, not1 | Retain |
| 158 | c=1,s=1 gives dim=1+2=3 and corank1 | Retain |
| 184 | r=0→twist order1; r=1→twist order0 | Retain |
| 185 | At every level primeχ_D(ℓ)=+1 and local split degrees(1,1); inertχ_D(ℓ)=−1 fails the field condition | Retain |
| 201 | Coranks overℚ are r and1−r, sum1; only the twist's Sha has first been shown finite | Retain |
| 227 | rankΛ(X)=1, rankΛ(X_E)=0; substituting X_E removes the free coinvariant contribution1 | Retain |
| 228 | R⊕R/(T) has coinvariants ℚ_p², dimension2≠1 | Retain |
| 229 | (ℤ/3)⊗ℚ₃=0; (R/(T))⊗R/(T)=R/(T)≠0 | Retain |
| 245 | κ=T≠0 inR, κ modT=0 | Retain |
| 246 | Trace sends σ_v,σ_v̄ to1; (1−α⁻¹σ_v)(1−α⁻¹σ_v̄) becomes(1−α⁻¹)², equal1 modulo9 in the example | Retain |
| 262 | (T²) becomes(1) after1/T, concealing positive length2; without1/T it differs from(1) | Retain |
| 263 | A divisible Sha line contributes corank1 even when Mordell–Weil rank0; assumed rank1/finite Sha would remove this case before proving the converse | Retain |
| 289 | Sum order1 minus complementary orders1 and0 gives0 and1 | Retain |
| 290 | p=3 satisfies3>2 but3≥5 is false; η is reducible-kernel data and passes; no squarefree test is imposed onN | Retain |
| 306 | The abstract group⊕_(ℓ≠3)ℤ/ℓ has zero3-primary part and infinite total size, separating the two finiteness claims | Retain |
| 322 | ℤ/3 has dim[3]=1, corank0; its finite alternating perfect pairing cannot exist | Retain |
| 323 | p=3 lies in the theorem's odd-prime range and outside p≥5 | Retain |
| 358 | For pointwise rational kernelφ=1, classes1,2,3,6 give admissibility0,1,0,0 | Retain with that meaning of rational kernel |
| 359 | [18]=[2] since18/2=3²; both membership indicators1 | Retain |
| 360 | v₃(j(W))=−3<0; all four local classes give membership0 | Retain |
| 361 | Start withφ=η: χ₁ leavesη, permitted1; χ₂ sendsη to1, permitted0 | Retain |
| 362 | W has kernel size3 but admissible-family size0 | Retain |
| 378 | Fix class2 for nineteen-a3: membership1; replacing it by class1 gives0 and invalidates the converse input | Retain |
| 379 | Finite ratio1 gives exponent−1 after real factor1/3; finite ratio3 gives exponent+1 after real factor1 | Retain |
| 395 | At stratum masses1/8 and1/4, absolute lower bounds1/16 and5/24, not1/2 and5/6 | R02 concerns the proof of this valid Check |
| 396 | Oscillating relative ratios1/2 and1 have liminf1/2 and no limit; a lower bound does not assert a density | Retain |
| 412 | Admissible mass3/8 leaves complement mass5/8; this method assigns no analytic rank to that complement | Retain |
| 446 | Δ=−19, different from+19 and−361 | Retain |
| 447 | x=0,1,2 have2,2,1 affine solutions; total6, a_Frob=4−6=−2, coefficient a₃=1 | Retain |
| 448 | d=2 gives D=8; rawΔ=−19·8⁶=−4980736, not−19·2⁶=−1216; quotient4096=2¹² | Retain |
| 449 | At(0,0), partials(−1,1); tangent y=x; substitution leaves−x³, so intersection order3 | Retain |
| 450 | a₂=a₃=1 on the specified tuple, versus0,0 for a short equation | Retain as model discrimination |
| 466 | Allowed mass(3/4)/2=3/8≠1/2 | Retain |
| 467 | Affine(0,0) has projective z=1; infinity has z=0, hence points unequal | Retain |
| 468 | Restricted ceiling3/8 is below5/12 by1/24; full-family rank-one mass is not bounded by this computation | Retain |
| 484 | Twists changeφ byχ_d, but v₃(j)=−3 both before and after | Retain |
| 498 | W partials(0,3); tangent y=0; residual cubic−x³ has intersection order3; P≠O | Retain |
| 499 | 2160=16·27·5≠0; v₃(2160)=3, v₃(357911)=0; difference−3 | Retain |
| 500 | d=0→D=0,Δ=0; d=1,3→v₃(Δ)=3,9; both have v₃(j)=−3 | Retain |

### Supplier and ownership resolution

The line numbers below refer to the suppliers' repository files, not to the extra header emitted by `roadmaps show`. Relevant target texts were read after locating them. The broad indexed ownership search was followed by the supplied head checkouts for HeegnerPointEulerSystems, GrossZagierAndArithmeticHeights, ModularIwasawaMainConjectures and EllipticLegendreCharacterInterfaces. Board package searches also included the accepted CM and irreducible-residual designs.

| Roadmap family and resolved file | Cited section/target and hypothesis test | Resolution |
| --- | --- | --- |
| `TauCetiRoadmap/EllipticCurves/README.md` | Layers1–2,4–5,7; stable cyclic quotient (:549), determinant (:678), minimal-equation good reduction and potential-good criterion (:793–858), twists and Kummer conditions. Degree3≠0; ℚ has characteristic0; W has nonintegral j | Existing generic owner; local Eisenstein dictionary remains declared |
| `TauCetiRoadmap/EllipticCurveModularity/README.md` | R29.3–R29.6; actual newform, bad factors, modular parametrization, continuation (:1892). The completed central factor at s=1 is nonzero and the actual finite order is not the total raw LSeries junk value | Existing owner; quadratic factorization is a declared extension |
| `TauCetiRoadmap/ModularForms/README.md:708` | Layer7 L-functions; weight2 has center1, completion N^(s/2)(2π)^(-s)Γ(s) | Existing continuation supplier |
| `TauCetiRoadmap/SelmerIwasawaCohomology/README.md` | §§2.6,2.9–2.12a,3.9–3.11,4.26,4.28–4.29. Compact/discrete dual distinction; rational coefficient decomposition; elliptic alternating pairing at :2532; zero/divisible/paired finite tests above. Quadratic Shapiro clause at :2461 is not family-parity constancy | Existing owner with the separate arithmetic control gap |
| `TauCetiRoadmap/HeegnerPointEulerSystems/README.md` | §§8.5–8.6a,8.13,8.24,8.31–8.32,8.34,8b.2,8b.10. At a=3 scalar rescaling changes an integral index square by(3²), which becomes a unit after inverting3. Section8b.2 expressly has the odd-p rational comparison, unlike its p>3 integral branch | Correct normalized imports; exact traced scalar here is not a duplicate of §8.32's near-character congruence |
| `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2328` | Layer4, particularly §§4.1–4.2 and4.6; finite-generation, pseudo-null errors and height-one lengths. At augmentation, R/(T) has length1 while an inverted-p finite error has length0 | Existing generic algebra owner |
| `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md` | §0.1 (:303), §8.14 (:5027), §§8.17–8.19 (:5069–5111). General explicit formula includes coprime split-level specialization without squarefree N; fixed parametrization/trace and x-height retained. Multiplying the map by2 multiplies height and degree by4 | Correct; the general §8.14/§8.18 route supplies the scope beyond the narrower examples |
| `TauCetiRoadmap/ArithmeticStatisticsPartI/README.md` | §§0.1,0.2,0.5,0.6,0.15, including :318,:462,:1118,:1240,:1950. Signed total asymptotic12X/π²; each unit local class has fraction3/8. Its density-tower theorem assumes two limits | R02/R03 |
| `TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md:2272` | “Windowed cubic counting contract”: seven conditions, matched weights/masses, finite windows, main term and both tails. An error of orderX would change the predicted mean; an o(X) error does not | Rational specialization correctly remains a declared gap |
| `TauCetiRoadmap/ArithmeticStatisticsPartVI/README.md:2277` and :2331 | Supporting low-rank forward theorem explicitly includes every rational elliptic curve with modular comparison data; p-parity includes reducible residual action andp=3. Signs at coranks0,1 are+1,−1 | Correct imports; complementary-field infinitude/derivative branch still declared |
| `TauCetiRoadmap/ArithmeticStatisticsPartVII/README.md:1287` and :2336 | §5.10 ratio/stratum/statistics and §5.32 attainable local ratios. Restricted bounds retain counting C; torsion-corrected rank equals dimSel₃ exactly on A₃ because rational3-torsion=0 | R01 supplies the correct extra section |
| `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:1954` | §6.1 is an interface for HeegnerPointEulerSystems, not a second proof. Its displayed general setting hasp>3; this package's actual odd-p equality is imported directly from HeegnerPointEulerSystems | Scope statement only; no p=3 theorem is inferred from this interface |
| `packages/CMRankZeroConverse/design/README.md:69` | C.0 “Rank-r p-converse”: exactly corank=r⇒analyticRank=r, meaningful atp=2 as a proposition but proving no theorem | Design owner exists earlier in the order; no duplicate predicate introduced |
| `packages/RankOneConverse/design/README.md` | PC.0–PC.6 identify the irreducible-residual branch; p≥5/irreducibility are not imported into C | Ownership-only citation, not a prerequisite |

`RankZeroOneBSD` itself has no separate folder in main, the indexed heads or the board. The package report acknowledges this and the README names actual owners for every consumed endpoint. I did not turn the historical continuation label into a missing-input finding. Likewise, the resolver's missing RankOneConverse lead is resolved by its board design and does not supply a theorem here.

The searched objects were actual isogenies and kernel characters, classical Selmer/Sha and alternating reduced-primary pairings, anticyclotomic normalized classes and augmentation specialization, ratio strata and twist counts, and the two concrete diagnostic curves. The generic owners above are reused. EllipticLegendreCharacterInterfaces §1.2 shares the integral-j proof input but has a Legendre-parameter conclusion, not this fixed three-isogeny obstruction. No second owner of the two acceptance declaration names was found. The package's new ownership is the Eisenstein assembly, the full-trace specialization consequence and admissible statistical conversion, not those generic objects. Indexed grep was used for all supplied open-head ownership searches; no additional unlisted open pull request was independently sought.

### Declared-gap audit

The five slugs match verbatim between `packages/RankZeroOneBSDPartII/design/plan.json` and the five “What … must provide” paragraphs. Each has a named earlier supplier. Their components specify the same arithmetic interface/application; none assigns a generic carrier anew or names supplier `none`. The proof of their endpoints is not treated as already present.

| Gap | Explicit boundary and computed test | Result |
| --- | --- | --- |
| eisenstein-local-dictionary | Good odd prime; actual kernel, not a free character. At3 the trivial/η and connected dual alternatives give exclusion flags0/1; ramified twists of a good model have good flag0 | Precise local extension of EllipticCurves; accepted declared gap |
| complementary-heegner-twists | Root signs−1,+1 request twist orders0,1, respectively; with all level primes split, both total signs are−1. Finite extra split set includes2,p in the application | Existing restricted auxiliary-value theorem does not supply both branches and full infinitude at this generality |
| quadratic-analytic-factorization | Orders(0,1),(1,0) both sum1; omission of a bad Euler factor could alter the actual function. Actual curves and all bad factors are required | Rational continuation exists, quadratic comparison remains declared |
| cgls-ordinary-control | Finiteℤ/3 errors have corank0; augmentation-primary R/(T) has dimension1; Tor₁=R/(T) may survive in the cokernel | Does not ask for false compact surjectivity; arithmetic specialization of generic diagrams remains declared |
| rational-three-isogeny-count | At exponents0,1 the isogeny means are2,4 and the dual means2,4/3; changing a main term byX changes a mean, whereas o(X) does not | Requests the rational counting instance, not a second abstract counting contract |

### Pinned interfaces

| Pinned file and declaration | Read fact / boundary check |
| --- | --- |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:76` | Five-coefficient carrier; it permits singular models. At the all-zero tuple Δ=0, so overℚ ellipticity fails |
| Same file :120,:124,:131,:230,:366,:388 | c₄,c₆,Δ,map,IsElliptic,j; ellipticity is IsUnitΔ. Δ=2 overℤ is nonzero but nonunit; overℚ it is a unit. j uses the inverse discriminant unit |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:274` | Minimality includes integrality. Scaling a good equation to discriminant valuation12 cannot leave it a good minimal equation |
| Same file :299,:323,:328 | `minimal`, `HasGoodReduction`, `hasGoodReduction_iff_isElliptic_reduction`; good reduction means multiplicative valuation1, i.e. additive order0 |
| `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:84` | `WeierstrassCurve.LSeries` is a literal Dirichlet series; no analytic continuation/order is part of its body |
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71` | `ContinuousCohomology.tateShafarevich` is an intersection of kernels for supplied TopRep and local fields; empty indexing gives the whole cohomology group, so it alone is not classical elliptic Sha |
| `Mathlib/NumberTheory/Height/NumberField.lean:431` | `NumberField.finite_setOfPred_logHeight₁_le` has the number-field/Northcott context; no analogous finite set of bounded-height points is inferred over an arbitrary field |
| `Mathlib/NumberTheory/Height/EllipticCurve.lean:116` | `WeierstrassCurve.Affine.finite_naiveHeight_le` retains Northcott and uses finite fibres of xRep; infinity and affine x=0 are distinct but the fibre stays finite |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139` | `TauCeti.Isogeny` has coordinate pullback and pointedness, not an arbitrary point-group homomorphism; the zero map is not an isogeny here |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169` | `quadraticTwistOf` has real coefficient bodies; t=0,n=−d gives D=4d, notd |
| Same file :239,:299,:306 | Discriminant scaling, ellipticity iff IsUnitD and original ellipticity, and j invariance with both ellipticity conditions. D=0 overℚ is excluded; D=2 overℤ cannot be accepted merely because nonzero |
| `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:260` and :332 | Nonnegativity and zero iff finite additive order; the latter has explicit Northcott. On O both sides true, on the positive-height test point both sides false |
| `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean:121` | `WeierstrassCurve.Affine.fg_point_of_numberField` supplies finite generation with ellipticity and number-field hypotheses; the canonical-height Northcott transfer is `CanonicalHeight/Basic.lean:302` |
| `Mathlib/Topology/Algebra/Order/LiminfLimsup.lean:133` | Global `le_liminf_mul` for nonnegative bounded real functions supplies R02; all cutoff ratios lie in[0,1] |

The native two-descent/S-unit Selmer developments do not define the classical odd-primary elliptic Selmer interfaces needed by the missing headlines. Greps by Selmer, Sha, analytic rank, Heegner and ordinary-module objects were inspected alongside the actual native definitions above. No claim of arithmetic continuation is inferred from the name LSeries.

### Legal-source locator audit

These are the 24 distinct locator groups checked. Source line references use the supplied numbered extractions; no source passage is reproduced.

| Source locator | Source lines read | Outcome |
| --- | --- | --- |
| CGLS standing hypotheses, pp.518–521 | 79–95,171–179 | Good odd prime, rational p-isogeny, character and (Sel) hypotheses agree |
| CGLS Theorem E | 200–223 | Printed p.522, not within517–521: R04 |
| CGLS §3.4, Corollary3.4.2, p.566 | 1847–1854 | Corank one excludes augmentation torsion; earlier divisibility outside augmentation is weaker |
| CGLS Remark4.1.3, equations4.4–4.5, pp.568–569 | 1934–1963 | Traced stabilization and two bottom normalization factors agree |
| CGLS Corollary4.2.3, p.570 | 2001–2007 | Equality inΛ[1/p] with (Sel), not an integral equality without it |
| CGLS Theorem5.2.1, pp.574–575 | 2145–2148 | Both r values, arithmetic rank and full Sha outputs agree |
| CGLS proof of Theorem5.2.1, conditions(a)–(d),(d′), pp.574–575 | 2151–2187 | Both complementary twist branches, split primes and order subtraction agree; typo noted below |
| CGLS Corollary5.2.2, p.575 | 2188–2193 | Small finite-Selmer consequence; paired finite part supplies the needed additional explanation |
| CGLS Corollary5.2.3/proof, p.575 | 2198–2205 | Good-twist proof-scope gap recognized, not copied into the package |
| CGLS Remark5.2.4, p.575 | 2206–2215 | Model equation correct; unrestricted numerical conversion needs the missing intersection argument |
| BKLOS §2, pp.2–5 | 85–98,128–200 | Signed squarefree ordering and absolute-exponent notation distinguished |
| BKLOS Theorem2.5, p.4 | 156–163 | Bounds1/2 and5/6 agree |
| BKLOS Theorem2.6, pp.4–5 | 166–173 | Rational field falls in totally real case; package uses its admissible refinement |
| BKLOS §§9.1–9.2, p.14 | 642–661 | Signed exponents and proof of the bounds checked; supplier retains torsion correction |
| BKLOS Proposition10.1, p.14 | 669–679 | Real ratios1,1/3 and complex ratio1/3 |
| BKLOS Theorem10.5, pp.15–16 | 713–745 | Ordinary ratio/differential alternatives1,3 overℚ₃ |
| BKLOS Proposition10.7, p.17 | 749–766 | Ratio-one twist exists also at2; this is the §5.32 supplier target |
| BKLOS §11, proof of Theorem2.6, p.18 | 800–811 | Weak approximation and real signs assemble positive ratio strata |
| PS §1, p.2 | 59–78 | Elliptic alternating pairing and divisible kernels |
| PS §2, pp.3–4 | 126–145 | Reduced group means quotient by the maximal divisible subgroup |
| PS Theorem5, p.10 | 421–445 | Polarization obstruction relation |
| PS Corollaries6–7, p.11 | 454–462 | Antisymmetry versus alternation; rational divisor(O) kills obstruction |
| PS Theorem8, pp.11–12 | 474–509 | Reduced-primary statements, not a blanket finite full Sha hypothesis |
| PS Corollary9, p.12 | 510–532 | Its explicit finiteness assumption is not imported into the converse |

### Dependency and policy checks

The requested dependency command completed successfully. Exact output:

```text
depcheck: 56 roadmaps, 650 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The checked graph is unchanged because this pass edits only its report and scratch notes. Within the package, §2.1 first states its general corank-one theorem and uses §1.2 for the selected-field application; §§2.1–2.2 feed §2.3, which feeds §3.1. Statistics depend on the finite-Selmer branch. The explanatory mentions of later applications do not create proof dependencies in the opposite direction.

The read-only `git diff --stat origin/main...HEAD` shows six changed files, all under `packages/RankZeroOneBSDPartII/`: README, Suggested.lean, design/plan.json, metadata.toml, package report and sources.toml. The new review report is the only additional file written in that folder by this pass. There is no `lemma`, `set_option`, sorry'd data, admitted example, free Prop placeholder or unsupported import in Suggested.lean. No pull-request numbers or review-process narrative occur in its docstrings or the README. Arithmetic computations here and in the README are diagnostic identities, not a proposed computational-algorithm development.

## Not verifiable

- No Lean elaboration or build was run, as required by the read-only brief. Binder checking used the supplied elaborated signatures plus the actual source. This independently checks their agreement, not the authenticity of a newly generated build log.
- The five declared supplier gaps are future mathematical obligations. The pass checks their statements, ownership, boundaries and registration, not completed proofs. In particular, no proof of rational counting condition C or either new nonvanishing branch is claimed here.
- `RankZeroOneBSD` has no standalone current document in the supplied/indexed trees. Its historical boundary cannot be independently reconstructed from such a file. The package's actual inputs were resolved to the named existing owners; CMRankZeroConverse and RankOneConverse were checked at the board designs because they have no indexed delivered README.
- The exhaustive truth of the source theorems and their uncited background is not newly established by this review. All three cited works were legally readable at the stated locators. No inaccessible cited work or missing-text request remains.
- No independent ownership audit was performed against unlisted open work outside the indexed searches and furnished checkouts; no such work was used to allege a defect.

## Source issues

- **Gap** in CGLS at Corollary5.2.3 proof, printed p.575 (CGLS line 2198): the source says arranging the local character by twisting suffices for every rational three-isogeny family; it should be accompanied by a good-reduction argument or a different converse for families with no good-at-three twist; affects the proof.
- **Gap** in CGLS at Remark5.2.4, printed p.575 (CGLS line 2206): the source says unrestricted Selmer proportions transfer to analytic proportions of 41.6% and 25%; it should be justified on the intersection with the admissible family, whose mass for nineteen-a3 is 3/8; affects the proof.
- **Misprint** in CGLS at Theorem5.2.1 proof, condition(d′), printed p.574 (CGLS line 2177): the source says the s-order is taken of the fixed central value; it should be the order at s=1 of the function L(Eᴷ,s); affects nothing.
- **Misprint** in BKLOS at equation(9.2), author-version p.14 (BKLOS line 647): the source says the kernel rational points are taken over ℚ in its general number-field formula; it should be F in both kernel terms; affects nothing.
- **Misprint** in BKLOS at §9.2, author-version p.14 (BKLOS line 649 and line 660): the source says the odd-stratum average three-Selmer rank equals 4/3; it should be at most 4/3, the bound supplied by the preceding argument; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "07fd530e96f72c15f631980806623f1fcf65fb87", "job": "RT-RankZeroOneBSDPartII~1a", "model": "gpt-6-astra", "worker": "chris-30"} -->
