# Review of LogicAndDefinabilityInNumberTheory (pull request #2276 at a546807)

**Verdict:** needs changes

## R01 (P1) — The normic family loses dimension at split parameters

**Location:** `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/README.md:1299`: “let X_u be the model of (a) for K=k((du)^(1/p)), defined in a smooth projective family”.
**Claim:** Part (a) requires a degree-p field extension. Adjoining a root at every u does not supply one, and its norm varieties cannot be the fibres of the asserted family.
**Witness:** Take k=ℚ, p=2, d=2, P=(x²−3)(x²−5). At u=1, dim U=2; at u=1/2, K=ℚ and dim U=1. Colliot-Thélène–Van Geel instead use a rank-two algebra (review_source_15 line 502).
**Repair:** Define A=k[u,u⁻¹], B=A[v]/(v^p−du), and the family by N_(B/A)(Ξ)=P(x)≠0. Its fibre algebra is k[v]/(v^p−du), including k^p at split parameters. Apply (a)'s field-only Brauer calculation only when its field and irreducibility hypotheses hold. At the witness's split parameter the equation is XY=P(x), still dimension two; retain this as a Check.

## R02 (P1) — The component-pairing prerequisite is not a registered supplier gap

**Location:** `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/README.md:77`: “What NeronModelsAndSemistableAbelianVarieties must provide (gap:neron-pairing-perfect-finite-residue)”; §2.10(c) uses it at line 555.
**Claim:** General finite-residue-field perfectness is neither supplied by the cited section nor registered in the package's gap contract. The nonsemistable case of §2.10 therefore has an unavailable premise.
**Witness:** PR #852, `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:2643`, explicitly excludes perfectness beyond semistable reduction. `packages/LogicAndDefinabilityInNumberTheory/design/plan.json` is absent; the README-only slug has no matching gaps entry.
**Repair:** Register `neron-pairing-perfect-finite-residue` in the package plan's top-level `gaps`, with supplier `NeronModelsAndSemistableAbelianVarieties`, section `4.6`, and the precise Galois-equivariant perfectness statement already written at line 77, including arbitrary reduction and finite residue field. Keep §2.10(c) dependent on that registered contract; do not narrow it to semistable varieties.

## R03 (P3) — The explicit integer polynomial has no API or Checks

**Location:** `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/README.md:1378`: “Put F=(a+A(u))(b+A(u))((u₁²−B−1)²+((t−2u₁)²−4C−4)²).”
**Claim:** Section 4.33 defines the polynomial kept in Suggested.lean but ends without the required API list and three discriminating Checks.
**Witness:** `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/Suggested.lean:122` defines it; README lines 1378–1386 contain no API or Checks. With a=b=1, u=(1,0,0,0), v=0, its values at t=0,2 are 0,64.
**Repair:** Add API bullets for evaluation, vanishing of either guard, the positive-parameter equivalence with the two norm equations, and the two degree bounds. Add Checks: F(1,1,0,(1,0,0,0),0)=0; F(1,1,2,(1,0,0,0),0)=64, detecting the shifted trace; F(−1,1,t,(1,0,0,0),0)=0 for every t, detecting the guard. Keep these Checks in the README.

## Verified sound

The headline inventory is: relative Denef–Pas elimination; AKE and eventual ring/coefficient transfer; Igusa–Poincaré rationality; motivic integration, specialization and transfer; dual Néron volumes; MRDP and integer Hilbert tenth; universal integers, rational nonintegers, universal-existential undecidability, one- and two-universal-variable definitions; normic zero-cycles and nonpowers; definable Chow; uniform rational and bounded-degree counting; André–Oort, CM-pair, period-codimension and mixed André–Oort reductions. The table identifies all 12 Lean theorem statements; the remaining headlines and their missing carriers are named in the module docstring.

The numerical and logical tests below are witnesses for the stated cases, not proofs of the general theorems. Source locators that could not be opened are listed separately.

| Statement | Instances tried | Left side / constructed value | Right side / required value | Result; change |
| --- | --- | --- | --- | --- |
| 0.1 Quotient interpretations | Fractions (1,2),(2,4); two-valued graph | Cross-products 4=4; outputs {0,1} | Equal quotient classes; uniqueness false | Consistent |
| 0.2 Composition | Identity interpretation composed twice | Formula x=0 realizes identically | x=0 | Consistent |
| 0.3 Fractions | (−1,2)+(1,2); denominator zero | Numerator 0, denominator 4; (1,0) excluded | 0; illegal representative | Consistent |
| 0.4 Arithmetic semantics | X−2 at 0,3 | −2,1 in ℤ | −2,1 after ring realization | Consistent |
| 1.1 Denef–Pas language | Zero; t² over ℚ((t)) | ac(0)=0; ord(t²)=2 | Zero guard; VG value 2 | Consistent |
| 1.2 Angular components | t³(2+t), parameter 3t | ac_t=2; ac_(3t)=2/27 | 2·3⁻³=2/27 | Consistent |
| 1.3 Relative elimination ★ | x²=1 in characteristic zero | VF solutions {−1,1} | Two solutions; zero guards unnecessary here | Consistent; carrier absent in Lean |
| 1.4 AKE ★ | Identical residue field and value group | Identity comparisons on k and ℤ | Identical sentence truth | Consistent; general carrier absent |
| 1.5 ax_kochen_ring ★ | ∃x,x²+1=0; p=2,3,5 | ℚ_p truth: false,false,true | 𝔽_p((t)) truth: true,false,true | Small-prime exclusion necessary |
| 2.1 Cells [CL §7.1, review_source_00 line 1525] | q=2; ord z=0, ac z=1; z=0 | Mass 1/2; singleton mass 0 | q⁻¹=1/2; 0 | Consistent |
| 2.2 Preparation [Pas 3.2; CL 7.2.1] | ℚ₂(√2); graph y=x² | ord√2=1, ord2=2; graph dimension 1 | Ramified normalization; ambient mass 0 | Consistent |
| 2.3 Constructible functions | 1_O, 1_F, q=2 | Integrals 1,∞; Σ2⁻ⁿ=2 | Integrable, nonintegrable; (1−1/2)⁻¹=2 | Consistent |
| 2.4 Integration and locus | φ(a,b,c;x)=ab−c on F | At (2,3,6): 0; (2,3,5): ∞ | h=0 versus h=1 | Constructible zero locus retained |
| 2.5 Substitution | x↦πx on O; q=3 | Target volume 1/3 | Integral of Jacobian 1/3 | Consistent |
| 2.6 igusa_poincare_rationality ★ [CL 14.4.1] | f=0,1,x; m=1,q=2 | Raw coefficients 2ⁿ; 1,0,0,…; 1,1,… | Series 1/(1−2T); 1; 1/(1−T) | Consistent; Denef text unavailable |
| 2.7 Gauge measures [GWZ §2.1, review_source_07 line 248] | ω=π²(dx)⊗² on O, q=2 | Mass 1/2 | Absolute coefficient's square root 1/2 | Consistent |
| 2.8 Nullity | Point in F; point as zero-manifold | Ambient mass 0; intrinsic mass 1 | 0 versus 1 | Dimensions remain distinct |
| 2.9 Weil volume | A¹_O and G_m,O; q=3 | Volumes 1,2/3 | Residue counts 3/3,2/3 | Consistent |
| 2.10 Dual point counts ★ | Split Tate curve, n=3,q=5; Φ=ℤ/3, σ=−1 | #𝒜(k)=12; invariants order 1 | 3(5−1)=12; coinvariants order 1 | Numerical identities consistent; R02 |
| 2.11 Dual volumes ★ | Identity isogeny; zero differential | Same measure; both integrals 0 | Equal volume; 0 | Consistent cases; R02 prerequisite |
| 2.12 Relative Fubini | Projection (x,y)↦x; dx∧dy | Relative form dy; unit-square mass 1 | dx first; 1·1=1 | Sign and normalization consistent |
| 3.1 Subassignments | Formula ∃y,y²=−1 over ℝ⊂ℂ | Truth false→true | No extension-natural truth preservation | Correctly avoids a functor claim |
| 3.2 Scissors | G_m; two-point map to point | [G_m]=L−1; pushforward(1)=2 | L−1; multiplicativity would give 2=4 | Additive pushforward retained |
| 3.3 Coefficients [CL §4.2, review_source_00 line 764] | q=2; q=1 | (1−q⁻¹)⁻¹=2; denominator 0 | Defined evaluation; excluded parameter | Consistent |
| 3.4 Presburger summation | q=2, Σ_(n≥0) n2⁻ⁿ | 2 | (1/2)/(1−1/2)²=2 | Consistent |
| 3.5 Motivic functions | 1_empty and 1_point | 0 and 1 | Empty and point classes | Consistent |
| 3.6 Dimension grading | Point embedded in VF | Degree-one class 0; degree-zero class 1 | Ambient nullity; counting mass 1 | Consistent |
| 3.7 Motivic pushforward ★ | One-cell α=0; two-point residue fibre | L⁻¹; 2 | L^(−0−1); 2 | Consistent; graded carriers absent |
| 3.8 Change of variables ★ | x↦tx | Jacobian order 1 | Weight L⁻¹ | Consistent; graded carriers absent |
| 3.9 Specialization ★ | L⁻¹ at q=2,3 | 1/2,1/3 | Unit angular-cell masses 1/2,1/3 | Consistent; motivic carrier absent |
| 3.10 Transfer ★ | Identity of zero integrals | 0=0 in both fields | Universal equality true in both | Consistent; transfer carrier absent |
| 3.11 Realization | G_m; dual numbers | Images [ℚ(1)]−1; 1 | Scissor measure L−1; reduction class 1 | Consistent |
| 4.1 Polynomial functions | X−2Y at (1,3) | −5 | Native Poly value −5 | Consistent |
| 4.2 Natural assignments | X−2 at 0 | −2 in ℤ | −2; not truncated subtraction 0 | Signed coefficients retained |
| 4.3 Syntax surjectivity | Constant −1 and projection X | Constant polynomial; X | Values −1 and input | Consistent |
| 4.4 Syntax injectivity | X(X−1) at 0,1,2 | 0,0,2 | Zero polynomial gives 0,0,0 | Infinite-box hypothesis discriminates |
| 4.5 Ring equivalence | (X+1)² at 2 | 9 | X²+2X+1 gives 9 | Consistent |
| 4.6 Finite support | Free X, witness Y₇ | Witness support {7} | Free X unchanged | Consistent |
| 4.7 Enumeration | Empty witness support | Fin 0 has one assignment | One empty tuple | Consistent |
| 4.8 Existential roots | u−v−1; identify u,v | Root (1,0); collapsed value −1 | Solvable; unsolvable | Injectivity necessary |
| 4.9 Normal form | Constant equations 0=0,1=0 | Universal set; empty set | Same with zero witnesses | Consistent |
| 4.10 Code comparison | Code for X−2 at 0 | Evaluator −2 | Decoded polynomial −2 | Consistent |
| 4.11 Diophantine ⇒ RE | X−2 with zero witnesses | Membership true exactly at 2 | Equality test halts exactly there | Consistent |
| 4.12 Sequence coding | Entries 1,2; y=6; x=15 | Remainders mod7,13: 1,2 | Requested list 1,2 | Consistent |
| 4.13 Bounded universal [Davis 5.1, review_source_13 line 728] | P(i): i=0; n=0,1,2 | Truth true,true,false | Empty conjunction; one zero; failing index 1 | Fixed-arity encoding required |
| 4.14 Computation graphs | Constant-zero program; divergent program | Graph ℕ×{0}; empty graph | Same Diophantine relations | Divergence not skipped |
| 4.15 Diophantine.mrdp ★ [Davis 8.1, review_source_13 line 1133] | S=∅, all tuples; n=0 | RE true,true; tuple carrier singleton | Dioph via 1,0; same singleton carrier | Consistent |
| 4.16 hilbert_tenth_integers ★ | a−x² at a=−1,0,1 | Solvability false,true,true | Four-square witnesses never produce −1 | Control family decidable; existential claim retained |
| 4.17 rationalDiophantine | S=∅,ℚ; x²+y²=0 over ℚ,ℂ | Constant 1,0; (1,i) fails rational domain | Empty,all; complex sum-of-squares implication false | Finite systems retained generally |
| 4.18 Undecidability transfer | Identity coding; zero witnesses | Same truth predicate; one empty tuple | Same membership; one evaluation | Effective reduction essential |
| 4.19 Quaternion traces | a=b=−1, norm one | Trace range over ℝ [−2,2] | Sum range [−4,4] | Real-place restriction retained |
| 4.20 Local trace ranges | Split quaternion; Hamilton real quaternion | Traces all ℚ; real sums [−4,4] | Split local ring ℚ; bounded real factor | Consistent |
| 4.21 Prime-class rings | R³₃; R³₅ | ℤ_(3); ℤ_(2) | First is class-guarded; second outside guard | Congruence hypothesis necessary |
| 4.22 Radicals [Koenigsmann 12–14, review_source_14 line 409] | Split (1,1); T=ℤ_(3) | Empty-support J=ℚ; radical 3ℤ_(3) | Jac(ℚ)=0; nonempty-support equality | Guard prevents false identification |
| 4.23 Prime-covering parameters | p=3, class 3 mod8 | Valuation support {3} | R³₃=ℤ_(3) | Consistent |
| 4.24 universal_integers ★ | t=0,−1,1/2 | Integer membership true,true,false | Every local valuation ≥0; v₂(1/2)=−1 | Consistent |
| 4.24 rational_nonintegers_diophantine ★ | t=1/2,0 | Complement membership true,false | Negation of integer predicate true,false | Consistent |
| 4.25 forall_exists_rational_undecidable ★ | Constant equations 0,1 | Universal-existential truth true,false | Trivial families computable | Existence does not quantify every family |
| 4.26 Square-detection unions | p=17·41; x=1/17 | x∈ℤ_(41), x∉ℤ_(17) | Union true; intersection false | Union convention retained |
| 4.27 Nonpowers/nonnorms [Koenigsmann 21, review_source_14 line 712] | −1,4; norm ℚ(i)/ℚ | Nonsquare true,false; N(1+i)=2 | Nonnegative norm; −1 not a norm | Consistent |
| 4.28 one_universal_variable ★ [Koenigsmann 22, review_source_14 line 875] | t=0,1/2; dyadic classes 1,3 | Integer membership true,false; 3−1=2 | 2∉8ℤ_(2), but 2∈ℤ_(2) | Factor 8 discriminates |
| 4.29 Normic zero-cycles ★ | p=2,d=2,u=1,1/2 | Field dimensions 2,1; norm-variety dimensions 2,1 | Rank-two étale fibres both dimension 2 | R01 |
| 4.29 Degree combination | Degrees p=2 and 2p+1=5 | 5−2·2=1 | Degree-one signed zero-cycle | Consistent |
| 4.30 nonpowers_diophantine ★ | ℚ,r=2: −1,4,0; r=3: 2,−8 | Membership true,false,false; true,false | Squares/cubes and nonzero guard agree | Consistent |
| 4.31 Existential closure | ℚ⊂ℝ, x²=2; identity embedding | No rational root; real root; identity preserves | Failure; success | Predicates distinct |
| 4.32 Rational models | Identity inclusion; positive n=1 | Z_K=Z_K; first powers K | Required inclusions equalities | Consistent; no model-completeness inference |
| 4.33 two_universal_integer_formula ★ | a=b=1,u=(1,0,0,0),v=0,t=0,2 | F=0,64 | Trace roots t=0 or4 for these witnesses | R03; theorem not refuted |
| 4.33 Polynomial guards | a=−1,b=1,u=(1,0,0,0) | First factor −1+1=0 | F=0 for every t | R03 |
| 5.1 Normalized counts | q=2,d=1,n=2; A=O | N=4, measure=1 | 2⁻²·4=1 | Consistent |
| 5.2 Uniform identities [CL exponential 9.2.4] | q=3, φ≡1 on O | Integral 1 in either field | Universally equal to 1 | Uniform relation, not matched VF points |
| 5.3 Zeta interface [CL §14.4] | f=x,q=2 | A(T)=1/(1−T/2); Z(T)=1/(2−T) | ((T−1)A(T)+1)/T=1/(2−T) | Constant term by continuation, no 0/0 |
| 5.4 Product map | q=2,n=1 | Fibre mass 1; residue solutions 3 | (1+1)/2=1; 2q−1=3 | Summed volume 3/4 |
| 6.1 IsOMinimalExpansion | Interval, singleton, ℤ | Frontiers {0,1},{0},ℤ | Finite,finite,infinite | Rejects discrete infinite definable set |
| 6.2 Restricted symbols [vdDries–Miller §2.5, review_source_16 line 336] | Restricted constant 1 at x=1,2 | Values 1,0 | Closed cube; zero outside | Boundary convention consistent |
| 6.3 Selected o-minimality [vdDries–Miller §4.2, line 502] | exp(x)=1; restricted constant 1 | Unique zero x=0; one compact support interval | Unary finite components; analytic pieces | Source supports selected expansions |
| 6.4 Components and paths | xy=1; [0,∞) | Two components; one component | Two branches; adjacent cells joined | Consistent |
| 6.5 Uniform components | (−1,1)∖{t}, t=0,2 | Counts 2,1 | Bound N=2 for both | N=1 rejected |
| 6.6 Definable atlases | Two projective-line charts | Transition z↦1/z, composed twice identity | z↦z | Finite charts and direction agree |
| 6.7 Complex varieties | xy=0 at origin | Two branches; singular point | Definable set, no smooth chart there | Consistent |
| 6.8 Remmert–Stein ★ | Punctured branch in xy=0 | Closure {y=0} including origin | Analytic branch | Singular ambient reduction consistent |
| 6.9 Definable Chow ★ | {1}⊂ℂ×; empty set | Ideals (z−1); (1) | Closed algebraic subset; empty variety | Nonproper ambient allowed |
| 6.10 Finite algebraic union | Finite points; countable rational points | Finite subunion; infinitely many isolated points | First definable; second not o-minimal definable | Countability alone insufficient |
| 6.11 algebraicPart | Interval; singleton; n=0 | Algebraic part interval; ∅; ∅ | Two distinct points possible only for interval | Native connectedness includes nonemptiness |
| 6.12 Heights | 0,−2/3,√2; transcendental x | H=1,3,√2; total H(x)=1 | Same heights; algebraicity excludes junk x | Consistent |
| 6.13 Blocks | Constant image of an interval | Image singleton, dimension 0 | One zero-dimensional block | Image need not retain positive dimension |
| 6.14 pila_wilkie ★ | Singleton {0}, n=0, whole interval | Counts outside algebraic part 1,1,0 | C=1 gives 1,1,0≤T^ε | Parameters stay outside C's dependence |
| 6.15 Integral/image counting | Integers −2,…,2 at T=2; constant image | Heights ≤2; image count 1 | Integral height bound; one image block | Consistent |
| 6.16 bounded_degree_counting ★ [Pila 1.6,5.3] | {√2}, k=1,2,T=2; transcendental singleton | Counts 0,1; 0 | Degree cutoff 1,2; algebraicity guard | k+1 coefficients retained |
| 6.17 Orbit versus counting | D⁽¹ᐟ²⁾ versus D⁽¹ᐟ⁴⁾ | Ratio D⁽¹ᐟ⁴⁾→∞ | Exceeds any fixed constant | Strict exponent inequality needed |
| 7.1 André–Oort inputs | g=1,τ=i | Discriminant magnitude 4; coordinate degree ≤2 | k₁=2; CM point special | No unrestricted weakly-special implication |
| 7.2 Exceptional CM points ★ | Singleton CM point | One exceptional point | Finite exceptional set | Consistent conditional instance |
| 7.3 Dimension induction | Zero-dimensional special variety | One maximal special subvariety | One component | Base case consistent |
| 7.4 André–Oort reduction ★ | Empty V; special singleton | Special-point closures ∅; singleton | Zero; one special component | Conditional hypotheses retained |
| 7.5 CM pairs ★ | Diagonal; line j₁=1 | Infinitely many CM pairs; zero pairs | Diagonal excluded; finite nonspecial example | Consistent |
| 7.6 Period codimension ★ | dim X=1,dim Ď=2,codim Z=1,dim U=1 | codim U=2 | codim V+codim W=1+2=3 | Strict 2<3; point case separate |
| 7.7 Mixed André–Oort ★ | Pure case; 2-torsion over τ=i | N=1; N=2,H_V=2,D=4 | Pure bound; rational lift (1/2,0) | Conditional inputs and degree bounds retained |

- Source checks: 15/15 seeded target groups examined; 38 distinct supporting locators opened across 16 readable works, including the five additional comparisons §§3.1, 4.29, 4.33, 6.8 and 7.6; limitations below.
- Library comparisons: 16 declarations inspected; native `Dioph` and `pow_dioph` at `Mathlib/NumberTheory/Dioph.lean:245` and `:667`, halting obstruction at `Mathlib/Computability/Halting.lean:64`.
- Carrier comparisons: heights at `Mathlib/NumberTheory/Height/NumberField.lean:136` and `:532`; semialgebraicity at `TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:75`; Northcott at `TauCeti/NumberTheory/Height/Absolute.lean:187`.
- Ownership: 17 named supplier-contract sections audited against their roadmaps; the unavailable contract is R02; the resolver's one name lead is the actual nested declaration `Diophantine.mrdp`.
- Lean: direct elaboration succeeded with 12 `sorry` warnings; scratch `#check @name` compared all 16 signatures with the README, with zero lost hypotheses; all 12 `simp`/`rfl`/`infer_instance` probes failed to close their targets; no matching pinned theorem found.
- Gate: all 29 recorded checks passed, including the targeted build; outside-folder diff 0 paths; worktree unchanged.
- Dependency output: `depcheck: 235 roadmaps, 2115 edges, 0 problem(s)`; no UPWARD or CYCLE; the undeclared gap is not detected by that graph check.
- PR text: new-folder diff is 2,148 insertions, 0 deletions, 16 new Lean declarations; title, folder inventory, supplier prose and validation claims compared with this head; no contradictory removal or renumbering claim found.

Overlap check: read ShimuraVarieties, StratifiedSpacesAndTameTopology, AbelianSchemesAndArithmeticModuliPartII, HeightsRationalPointsAndObstructions, ArithmeticDynamics, ComputabilityTheory and ClassicalArithmeticCompletion; general o-minimal geometry/R_an,exp/smooth Chow belong to ShimuraVarieties, block decomposition to AbelianSchemesAndArithmeticModuliPartII, Brauer pairings to HeightsRationalPointsAndObstructions, triangulation/C^p stratification to StratifiedSpacesAndTameTopology. Basic computability and four squares remain Mathlib's; height foundations remain DiophantineApproximationAndTranscendence's. No second ownership of this roadmap's MRDP, normic or counting targets found in those scopes. The heading-results overlap list is empty.

Source independence: 20 roadmap passages compared with 16 readable sources; no copied nonmathematical expression or imported table found. The largest explicitly linked locator share is review_source_00 (Cluckers–Loeser), 19 of 106 linked citation occurrences before References; its short-form citations were also inspected. Contents at review_source_00 line 292 compared: independent organization. Cells precede the scissor construction here, and residue scissors precede coefficient localization, unlike the source's section sequence; the named dependencies lead to the integration and specialization targets. Waived and inaccessible texts below were not compared.

## Not verifiable

- review_source_27, Denef 1984, Theorems 1.1–1.2: DOI 10.1007/BF01389133 resolves to paywalled content; all-prime rationality's primary locator remains uncertified.
- schneider, *p-Adic Lie Groups*, Proposition 6.4, p.42 and §7: publisher DOI access was paywalled; inverse-function and chart locators remain uncertified.
- blr, *Néron Models*, §7.3 Proposition 6, p.180: publisher DOI 10.1007/978-3-642-51438-8 is paywalled; locator remains uncertified.
- hodges, *Model Theory*, §5.3: the sources service found the Cambridge book landing page but no readable legal text; interpretations/composition locator not certified.
- vd_dr_tame; vd_dr_macintyre_marker; pila_wilkie; cl_addenda: previously waived texts, not requested again; their primary locators and wording were not independently checked.

## Source issues

- **Error** in review_source_00 at §15.1, p.83 (line 3416): the source treats affine variety charts as open subsets of affine space; it should use closed embeddings into affine space and embedding-independent gluing; affects the proof.
- **Misprint** in review_source_07 at Proposition 2.1(b), p.6 (lines 289–292): the source reverses the analytic covering and omits its degree in the displayed integral comparison; it should use Y→X and divide the source integral by #Γ(F); affects the proof.
- **Misprint** in review_source_08 at Proposition 4.1, p.20 (line 1046): the source places the relative form on Y; it should place that section on X; affects a stated result.
- **Misprint** in review_source_08 at Claim 4.2, p.20 (line 1081): the source takes η to be the r-fold tensor power of a volume form; it should take η to be the untensored volume form; affects the proof.
- **Misprint** in review_source_14 at Proposition 6 proof, p.78 (line 230): the source uses (1,1,0) for the quaternion parameters (6,15); it should use (1,1,1), giving 69≡5 mod8 instead of −21≡3; affects the proof.
- **Misprint** in review_source_14 at Proposition 10(b) proof, p.81 (lines 365–380): the source changes quaternion entries from Definition 7 for classes five and seven; it should retain (−2,2) for class five and (−1,−2) for class seven; affects the proof.
- **Error** in review_source_14 at Lemma 13(d), p.82 (line 437): the source identifies J_(a,b) with the Jacobson radical without a nonempty ramification support; it should restrict that identification to nonempty support, since the split case gives ℚ versus 0; affects a stated result.
- **Misprint** in review_source_14 at Proposition 21(b), p.88 (line 776): the source assigns Legendre symbol (2/l)=1 for l≡3 mod8; it should assign −1; affects the proof.
- **Error** in review_source_14 at Proposition 21(d), p.89 (lines 817–820): the source replaces products of square classes by a union and drops necessary square factors; it should retain the signed dyadic factor, rational squares, and the product over the allowed prime classes; affects the proof.
- **Misprint** in review_source_14 at Corollary 22, pp.90–91 (lines 887–896): the source uses an undefined one-parameter R¹_p and dyadic cosets modulo ℤ_(2); it should use S_p and cosets modulo 8ℤ_(2); affects the proof.
- **Misprint** in review_source_16 at §4.5, p.13 (line 521): the source claims f(g(x))=x for every x of an arbitrary definable map's domain; it should claim g(f(y))=y on the image; affects a stated result.
- **Misprint** in review_source_18 at Theorem 4.4 proof, p.12 (lines 603–604): the source applies the intersection result with A instead of E and closes M_i∩E; it should apply it with E and intersect the closure of M_i with E; affects the proof.
- **Misprint** in review_source_21 at Definition 5.1 and Lemma 5.2, pp.7–8 (lines 324–328, 358–361): the source uses k coefficients through degree k−1 for algebraic degree at most k; it should use k+1 coefficients through degree k; affects the proof.
- **Misprint** in pinned Mathlib at `Mathlib/NumberTheory/Height/NumberField.lean:134`: the source docstring gives transcendental absolute multiplicative height the value 0; it should say 1, as the definition's else branch does; affects nothing.

## For the human reviewers

- The primary texts of Denef, Schneider and Bosch–Lütkebohmert–Raynaud remain uncertified; Hodges was unavailable through the legal sources service. The four recorded waivers were respected. The dominant source, Cluckers–Loeser, and its contents were readable.
