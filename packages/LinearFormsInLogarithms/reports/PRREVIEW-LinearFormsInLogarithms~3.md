# Review of LinearFormsInLogarithms (pull request #451 at 0dbb481)

**Verdict:** needs changes

:robot: AI-assisted independent review. Five findings: one P1, one P2 and three P3. The P1 records the supplied gate's build-warning failure, not a false mathematical theorem. The P2 is a missing hypothesis in a supplier contract. No pull-request file was changed.

## R01 (P1) — Clear the non-sorry build warning

**Location:** `TauCetiRoadmap/LinearFormsInLogarithms/Suggested.lean:1`: “import Mathlib”.

**Claim:** The supplied gate reports `build=1 FAIL`. The targeted build reproduces a module-system warning; the acceptance rule permits only sorry warnings. Direct elaboration succeeding does not clear this gate failure.

**Witness:** `lake build TauCetiRoadmap.LinearFormsInLogarithms.Suggested` reports that Mathlib is designed for the module system and recommends adding `module`. It exits successfully but emits this additional warning.

**Repair:** Add `module` before the existing import, then rerun the targeted build and warning-sensitive gate. A scratch copy with exactly this insertion elaborated with 73 sorry warnings and no other warnings or errors. No option override is needed. This minimal repair preserves the required literal `import Mathlib`; do not add a public section blindly, because a private import does not expose its names inside public declarations.

## R02 (P2) — Restore the packing theorem's range hypotheses

**Location:** `TauCetiRoadmap/LinearFormsInLogarithms/README.md:291–294`: “a subset of `box r c` whose points are `ε`-separated has at most `(4 c / ε) ^ (2 · card ι)` elements.”

**Claim:** The claimed supplier contract omits conditions essential to the bound. In particular it is false for separation parameters larger than the box scale.

**Witness:** One coordinate, `r = 1`, `c = 1`, `ε = 5`, `S = {0}`: containment and pairwise separation hold; cardinality is 1 but the claimed upper bound is 16/25.

**Repair:** State the pinned hypotheses: each `r i > 0`, `0 < ε ≤ c`, containment, and distinct points separated in some coordinate by **strictly more than** `ε * r i`. Cite `TauCeti.GeometryOfNumbers.finite_and_ncard_le_of_subset_box_of_separated`, `TauCeti/NumberTheory/GeometryOfNumbers/Doubling.lean:186`. The counterexample is then excluded by `5 ≤ 1`; the valid test `S = {-1,1}`, `r=c=ε=1` has separation 2>1 and cardinality 2≤16. Do not silently apply this library theorem outside its range; separately handle such a case if the sharper counting argument needs it.

## R03 (P3) — Complete the prescribed roadmap structure

**Location:** `TauCetiRoadmap/LinearFormsInLogarithms/README.md:68`, `:220`, `:328`, `:337`: “Scope”, “What Mathlib already has (consume)”, “The build, in layers”, “Layer 0”.

**Claim:** Previous R04 is only partly repaired. Prerequisites have been renamed Needs, but the opening Summary, Scope and ownership, Exact supplier contracts, How to read the build, second-level layer headings, topic subsections, and per-layer Examples/Dependencies are still absent. Some targets still have no individual Needs line. The module introduction also calls these “particular milestones” before calling them an acceptance test.

**Witness:** The README contains nine `### Layer` headings, zero `### Examples`, zero `### Dependencies`, and zero `## Exact supplier contracts`. Section 2.3 gives a proof route without a target-level dependency list.

**Repair:** Reorganize the existing mathematics into the requested hierarchy; preserve all targets. Collect exact library contracts, including R02's hypotheses, in their supplier section. Give each target its own inputs and each layer its examples and dependencies. Make the module introduction consistently describe the headline acceptance test. A heading scan should then find nine layer sections with Examples and Dependencies.

## R04 (P3) — Finish definition-level APIs and discriminating Checks

**Location:** `TauCetiRoadmap/LinearFormsInLogarithms/README.md:875–880`: “At `G = 1`, `E = (L + 1) h ^ L (2 L) ^ ((k + 1) h ^ 2)`.”

**Claim:** Previous R05 is partly repaired. The Taylor coefficient and size examples now compute useful values. But E still has one computed bullet followed by a symbolic specialization and a description of where its factors come from. Section 8.6 shares three bullets among frequency, gamma, polynomial factor and series; it does not provide three discriminating Checks and a prose API list for each definition. Earlier definitions also keep their APIs inline rather than as the required fact lists.

**Witness:** For E, k=0,L=h=1 gives 4 at G=1 and 64 at G=2. Those are both in the first bullet; the third bullet only identifies a previous bound.

**Repair:** Give each definition its API and at least three explicit evaluations/nonexamples. For E add k=0,G=1,L=2,h=1 giving 12, and k=0,G=1,L=1,h=2 giving 64; these distinguish the degree and derivative-order factors. For the polynomial factor use k=1,e=(2,3),β=2,β₀=5,ℓ_some=6,d=2: orders (0,0),(1,0),(0,1) give X², 2X+10X², 42X². Add separate frequency and series tests. Keep all these in the README.

## R05 (P3) — Register sources and give missing target locators

**Location:** `TauCetiRoadmap/LinearFormsInLogarithms/README.md:342–348` and `:1014–1030`: “Products of absolutely convergent series”; “Sums of power series”; the References list.

**Claim:** No `sources.toml` exists in the folder, although the source contract requires one entry per cited work. Several targets have no mathematical locator at the claim: examples include 0.1, 0.2 and 2.3; the Lang and Bombieri–Gubler references give no internal locator. Provenance file names identify proposed code, but do not certify the blanket sorry-free/axiom claims.

**Witness:** The folder contains exactly README.md, Suggested.lean and metadata.toml. Sections 0.1 and 0.2 have neither a theorem/page citation nor an exact pinned declaration identifying the finite-family or analytic-sum result.

**Repair:** Add the source manifest with stable keys, retrieval metadata and honest readable/uncertified status. Add exact source locators, or precise pinned declarations and the stated extension, at each target. Reuse W00 for the author-hosted book; do not create separate keys for its chapters. Record unavailable texts as uncertified where appropriate, without claiming to have read them. This review has fetched the sources it could and has not edited a manifest.

## Verified sound

### Previous findings, checked before the full review

The six findings of the review at d47950d were checked individually. No supplied repair report marks one “not actionable in this package”.

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01: missing branch-free product headline | README 721: “Baker.transcendental_exp_sum_mul”; Suggested 475–480 states it | Repaired. The nonprincipal 2πi witness is admitted by the new signature. |
| R02: empty module section | Suggested 31: ordinary comment “Mathlib declarations that README.md cites” | Repaired; empty-sections=0. |
| R03: padding/proof scaffolding | README 334–335: “the auxiliary functions and the steps … are specified here only” | Named padding and proof-only scaffold deleted. Three real-bodied definitions remain; 73 single-tactic probes closed none. |
| R04: roadmap structure | README 340: “Needs: Mathlib only”, but 337 still “### Layer 0” | Partly repaired; R03 above. |
| R05: definition Checks | README 597–598: H(M) takes “8, 24 and 64”; 875–880 still has the E block | Partly repaired; R04 above. |
| R06: three library locators | README 60 Exp.lean; 255 house_pow; 301 Weierstrass/Division.lean | Resolved at these newer pins: all three now exist. They are not re-raised. |

### Scope, build and elaborated signatures

Reviewed the entire 1,097-line README and 704-line Lean file, including all 76 declarations (73 theorems and three definitions). The three definitions are finite multilinear coefficient extraction, chosen analytic Taylor coefficients with a zero nonanalytic value, and the polynomial operator (D+c)^m. They use native carriers and real bodies. There are no sorry-valued data definitions, free proposition stand-ins, set_option commands, admitted examples, computational algorithms, good-prime restrictions on the general theorem, or imports from another roadmap. The odd-prime restriction is confined to the exp(p) example: p=2 remains covered on the strict convergence disc.

Pins read from the manifest: Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2; Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. These differ from the previous review's pins, explaining the resolved library locators. The review head is exactly 0dbb48112f3037cdfdf4068c0dd6b0bdcda72a3c. Both the outside-folder diff against origin/main and working-tree status are empty.

Direct `lake env lean` elaboration succeeded with 73 sorry warnings. A separate scratch copy appended `#check @name` for **every one of the 76 declarations** and also elaborated. I compared the explicit signatures and their retained binders with the README. The two flagged omissions are intentional `omit [CompleteSpace L]` clauses at Suggested 510 and 540: radius and coefficient bounds require no convergent value in L. Completeness remains on exp's functional equation, isometry, injectivity and series-value claims. Nothing was changed.

For every one of the 73 admitted theorems, a scratch probe tried complete closure by a single bare simp, rfl or infer_instance. All 73 reached the fallback; zero closed and zero elaboration errors occurred. The probe's tracing produced its own unused-tactic warnings, which are not warnings in the reviewed file. Reading the retained definitions and pinned statements did not identify another concrete one-library-lemma closure. This is a padding screen, not proof of any admitted theorem.

The supplied full gate reports every text/dependency check zero and **build=1 FAIL**, caused by the module-system warning in R01. My text/dependency gate rerun reports:

```text
gate LinearFormsInLogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

That command does not include a build field. I separately ran the prescribed targeted build; it exited zero and reproduced the non-sorry warning. Accordingly I do not report the full acceptance gate as passing.

### Headlines and ownership

The headline inventory is: multivariate reconstruction and uniqueness (0.3–0.4); Cauchy, Taylor remainder and Cartesian Schwarz bounds (1.4–1.6); exponential-polynomial independence (2.3); arithmetic lower bounds and Thue–Siegel/Siegel existence (3.1–3.5); the auxiliary function (4.1); Schneider–Lang (5.7); its two corollaries, Hermite–Lindemann and Gelfond–Schneider with quotient alternative (6.1–6.4); the basis-form Baker theorem, full affine independence and its linear/exponential/product consequences (7.1–7.3); ultrametric zero/interpolation estimates and p-adic Baker (8.3,8.5,8.10); the named transcendental constants. Each has a Lean statement. The branch-independent product statement is now present. None is forced through a free predicate or an unavailable carrier. The proof-only steps 5.1–5.6 and 8.6–8.9 correctly remain in prose.

Object searches used `roadmaps grep`, `roadmaps show`, main, board packages, the provided open-checkout corpus and both pinned libraries. Search objects included multi-index Taylor coefficients, exponential polynomials, Schneider–Lang, Baker–Brumer, Hermite interpolation, house/Liouville bounds, Siegel, the exponential disc, power-series division and Gauss norms. No duplicate fully qualified declaration of this file was found. The 55 unresolved citation-tool leads are names of this roadmap's proposed declarations or future TauCeti names; they are not absent suppliers.

The owner of the qualitative logarithm results is this roadmap: main's DiophantineApproximationAndTranscendence explicitly imports them. That roadmap retains broader rank, separate degree/frequency budgets, quantitative bounds and Hermite-method work. GenericDoublePointInterpolation §4.6 concerns ranks of value/first-jet evaluation; it does not supply the arbitrary-order ultrametric coefficient bound of 8.5. The polynomial bound here therefore adds a distinct result, not a second jet carrier. Native PowerSeries and Polynomial are retained.

Cross-roadmap citations resolved:

- `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:112–141` on main: supplier table for Layers 0–8 and explicit broader-consumer boundaries. Its §§3.2–3.3 and 3.5–3.8,5.6 match the qualitative, effective, Schanuel and Ax–Schanuel ownership statements. The revised open PR is not used as a supplier.
- `TauCetiRoadmap/LocalFieldsRamification/README.md`, Layer 1 “Deep units in mixed characteristic”, at the supplied open head: integer threshold (p−1)i>e, local exp/log construction and inverse targets. Its normalized absolute value differs from the norm of a normed Q_p-algebra. For an unramified degree-two extension at p=3 the normalized |3| is 1/9, versus norm 1/3; the square relation is the required distinction.
- `TauCetiRoadmap/AdicSpaces/README.md:234–250` on main: §0.5 owns restricted series and Weierstrass division/preparation. The actual route here uses pinned division, not the roadmap as an additional supplier.
- `TauCetiRoadmap/EllipticCurves/README.md:164–166`, `:1497–1499` on main: integral-point finiteness is explicitly excluded for the stated missing Diophantine input.

The GL2ModularityLifting and IntegralIwasawaTheory consumer references appear in the search index, but this brief does not give their open-head file paths. Those open consumers were not independently inspected; they are not supplier edges. No ownership claim is based on their unseen full files.

### Supplier order and native contracts

All Needs lines and supplier passages were read. There is no declared roadmap supplier or supplier gap. Deferrals and downstream consumers do not become reverse supply edges. No upward dependency, cycle or move is reported. Mechanical output:

```text
depcheck: 205 roadmaps, 1544 edges, 0 problem(s)
```

The dependency text does not detect missing hypotheses: R02 is the manual correction. The statement of 5.6 consumes quantities of 5.1–5.3, so the prose ordering at README 983 should place their definitions before 5.6 even though proving 5.3 is unnecessary for the numerical parameter choice.

Pinned declarations opened, in addition to elaborating all 28 library #checks:

| Native source | What was checked |
|---|---|
| `Mathlib/Analysis/Analytic/OfScalars.lean:132–134` | ofScalarsSum is a formal-series sum; its scalar expansion is a tsum, not an unrestricted convergence theorem. |
| `Mathlib/Analysis/Normed/Algebra/Exponential.lean:107,127,437` | expSeries coefficients, total exp, and the functional equation's ball hypotheses. |
| `Mathlib/Analysis/Complex/Schwarz.lean:145` | The imported bound is for a difference, with an order/little-o condition; 1.3 supplies the bridge and g(c)=0. |
| `Mathlib/Analysis/Calculus/Taylor.lean:62` | taylorCoeffWithin is real and univariate, so it is not the multivariate coefficient object being built. |
| `Mathlib/Analysis/Normed/Ring/InfiniteSum.lean:45,70,152` | Binary absolute convergence and product/Cauchy formulas; 0.1 extends to a finite dependent family. |
| `Mathlib/NumberTheory/NumberField/House.lean:38,54,60,100,311,348` | House is canonical-embedding norm; product API indexes a finite set of elements; house_pow is now equality; Liouville's input exists; Siegel's constant is private and the theorem has nonzero-matrix and dimension conditions. |
| `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:612` | Finite integral data produce a finite-dimensional adjoin; finiteness is explicit. |
| `Mathlib/RingTheory/Discriminant.lean:127,143` | Nonzero basis discriminant and squared embedding determinant, with separability; number fields provide it. |
| `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:882` | Normed-algebra construction in the algebraic-extension setting, not a claim that every normalized local absolute value already extends the Q_p norm. |
| `TauCeti/NumberTheory/GeometryOfNumbers/Doubling.lean:69,186` | Native box and packing theorem; exact missing range conditions give R02. |
| `TauCeti/RingTheory/PowerSeries/GaussNorm.lean:449` | Multiplicativity requires positive radius and restricted factors. |
| `TauCeti/RingTheory/PowerSeries/Weierstrass/Division.lean:369` | Distinguished divisor, unit leading coefficient, positive radius, restricted series and completeness. A monic polynomial meets the unit condition. |
| `TauCeti/Analysis/Analytic/OfScalars.lean:115,131` | Existing scalar-series composition/derivative bridges, not a ready-made many-zero estimate. |
| `TauCeti/RingTheory/PowerSeries/Exp.lean:53–76` | Existing rescaling and exponential specialization; no duplicate of the polynomial (D+c)^m operator. |

The two main-branch examples read for document shape were DiophantineApproximationAndTranscendence and Completed/EffectiveBounds. Their existing mathematical ownership was not replanned.

### Source sample and locators

The brief says “15 targets (none found by heading)” but provides no actual target list or seed. I do not claim to recover the worker's draw. For a reproducible replacement I sampled the numbered README targets in document order with Python Random seeded by the full reviewed head. The 15 targets are **0.3, 1.4, 1.5, 4.1, 5.1, 5.5, 5.6, 6.2, 6.3, 7.1, 7.3, 8.3, 8.4, 8.6, 8.9**. All are included in the computed tables below; additional headline and finding-related locators were checked too. There are no explicit “unverified” locator flags in this README.

W00 was fetched through the sources service from the [author's book PDF](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf). Its printed numbering matches the cited edition. The text extraction loses some overbars; the distinction between Q and the algebraic numbers was checked from context and the corresponding hypotheses, not interpreted as an assertion about rational coefficients only.

| Targets checked | Exact source location | Outcome |
|---|---|---|
| 0.3,1.4 | Pinned analytic series/uniqueness and derivative APIs; no precise mathematical source locator supplied for the new multivariate construction | Native inputs verified; source-locator limitation R05. |
| 1.5 | W00 lines 6977–7041, Lemma 4.13, pp.134–135 | Source has scalar entire functions and 1+√T. Roadmap labels its Banach/local 1+T variant and supplies the Schwarz/Cauchy route. |
| 1.6 | W00 lines 6451–6502 and 6742–6766, Proposition 4.7/Lemma 4.8, pp.122–123,129–130 | Entire scalar source, 18^n and rectangular order; roadmap explicitly owns the local Newton-division variant and its different constant. |
| 2.1 | W00 lines 6778–6850, Lemma 4.9, pp.130–131 | Ordinary derivatives divided by σ! give the stated coefficient formula; choose(τ,j)=0 handles j>τ. |
| 3.1 | W00 lines 4526–4565, Proposition 3.14, pp.83–84; pinned House.lean:100 | Source is a height/polynomial inequality; the roadmap's elementary house form has its own exact native norm input. |
| 3.4 | W00 lines 6887–6975, Lemmas 4.11–4.12, pp.132–134 | Strict real count and weak complex count match. The proof allows real U and arbitrary U,V after scaling; empty equation types cause no contradiction. |
| 4.1 | W00 lines 6867–6880,7043–7107, Proposition 4.10, pp.131–132,135–136 | Constants 12n², 6 and (2W)^(n+1) match. The local version needs only the two radii. For W≥12 and T≤4W/3+1, 1+T≤exp(W/3)/2, so the weaker remainder constant still fits. |
| 5.1,5.2,5.5,5.6 | W00 lines 7116–7316, §4.6 steps 1–6, pp.137–141 | Auxiliary monomials and arithmetic route match; total-degree transport and the q-parameter formulas are declared modifications, not formulas falsely attributed to the book. |
| 5.7 | W00 lines 6151–6159, Corollary 4.2, p.117 | Algebraic coordinates, rational independence and a complex basis all retained. |
| 6.1,6.2 | W00 lines 6187–6202, Corollaries 4.3–4.4, p.118 | Rank version belongs to the named consumer; the independent-family form and first-coordinate condition match. Lean carries NeZero d for 6.2. |
| 6.3,6.4 | W00 Chapter 1, Theorems 1.2 and 1.4, pp.2–3; lines 804–811 and 6202 | Nonzero logarithm and irrational exponent restrictions retained, including nonprincipal logarithms of 1. |
| 7.1 | W00 lines 6242–6409, Theorem 4.5 and Lemma 4.6, pp.119–121 | Basis/embedding argument verified. The last all-zero λ case requires inversion of the same matrix to recover all l_i=0; the roadmap explicitly says so. |
| 7.2,7.3 | W00 lines 822–835, Theorem 1.6 and following corollaries, pp.3–4 | Affine independence, nonzero-form transcendence, exponential and branch-free product conclusions supported. Baker's own theorem numbering remains uncertified below. |
| 8.3,8.4 | Pinned Gauss-norm/division and formal exponential APIs | The intermediate radius r′<r ensures restrictedness; complete characteristic-zero field retained. The altered p-adic proof is not literally a theorem of W00 or Baker's complex chapter. |
| 8.6,8.9 | Baker75 Chapter 2 proof cited; text unavailable | Algebraic identities and numeric/asymptotic parameter tests performed below; exact source adaptation not certified. |
| 8.10 provenance | KaratarakisPadic lines 47–51,63–73,123–170,175–183, Main.lean at 65cdef5722 | The two displayed signatures and normalization/denominator choices match. This does not certify the entire dependency tree or axiom claim. |

### Adversarial values: every Lean declaration

Rows below are concrete consistency tests, not numerical proofs of transcendence or universal inequalities. T means transcendental and A means algebraic where a theorem asserts that alternative. “Retain” means no signature change from this test. Rank-zero impossible premises are explicitly identified rather than counted as positive examples. All numbers and polynomial coefficients were recomputed for this review.

| Statement (Suggested.lean line) | Instance | Values on the two sides / rejected model | Result; change |
| mvCoeff (75) | p₂(u,v)=u₀v₁; then u₀v₀ | Mixed coefficient 1=1+0; repeated coefficient 1, not 2; constant series 3 has coefficient 3 | Retain |
| apply_eq_sum_mvCoeff (82) | p₂ as above,z=(2,3); empty coordinate type,k=2 | 6=1·2·3; empty type gives 0=0 in degree 2 and c=c in degree 0 | Retain |
| hasSum_mvCoeff (90) | f(z)=1/(1−z), one coordinate,z=1/2 | Σ(1/2)^k=2=f(1/2); weighted norm sum=2 | Retain |
| exists_hasFPowerSeriesOnBall_tsum (99) | c_k=2^(−k),r=1,z=1/2 | Normal sum=2; function sum=4/3; extracted coefficients 1,1/2,1/4 | Retain |
| mvCoeff_eq_zero_of_eventuallyEq_zero (107) | f=0; contrast f=z² | Zero coefficients all 0; z² has coefficient 1 at 2 and fails local-zero premise | Retain |
| mvTaylorCoeff (115) | f=z²,x=3; nonanalytic f=1+conj z at 0 | Coefficients 9,6,1; nonanalytic coefficients 0, including constant 0≠f(0)=1 | Retain |
| mvTaylorCoeff_eq (119) | f=(3+z)² at 0 | Chosen and explicit series both have (9,6,1) | Retain |
| mvTaylorCoeff_add (125) | f=z²,g=3z at x=1,degree 1 | 5=2+3 | Retain |
| mvTaylorCoeff_const_smul (131) | c=3,f=z²,x=1,degree 1; c=0, f nonanalytic | 6=3·2; 0=0·0 | Retain |
| EventuallyEq.mvTaylorCoeff_eq (136) | g=z² near 0, changed to 7 outside unit disc | Both degree-two coefficients 1; outside change does not enter the germ | Retain |
| mvTaylorCoeff_comp_add_right (141) | f=z²,x=1,y=2,degree 1 | Coefficient of (z+2)² at 1 is 6; coefficient of z² at 3 is 6 | Retain |
| prod_factorial_smul_mvTaylorCoeff (147) | f=z₀²z₁,α=(2,1); characteristic 2 | 2!1!·1=2; in characteristic 2 both derivative and factorial product are 0 | Retain |
| factorial_smul_mvTaylorCoeff_of_unique (156) | f=z³,x=0,k=3 | 3!·1=6; in characteristic 3 both are 0, while coefficient remains 1 | Retain |
| mvTaylorCoeff_smul (163) | f=1+z,g=1−z,x=0,degree 2 | −1=1·0+1·(−1)+0·1 | Retain |
| exists_hasSum_mvTaylorCoeff (171) | f=1/(1−z),x=0,ρ=1/2,y=1/4 | Normal sum=2; reconstructed value=4/3 | Retain |
| mvTaylorCoeff_eq_of_hasSum (180) | c=(1,2,1,0,…),f=(1+z)² | Expansion at z=1/2 gives 9/4; recovered coefficients exactly 1,2,1 | Retain |
| mvTaylorCoeff_comp_eq_zero (189) | G=z₀²,A(u,v)=(u+v,v) | Degree 1 coefficients 0 stay 0; degree 2 becomes (1,2,1), showing rectangular vanishing is not preserved | Retain |
| analyticAt_dslope_update (197) | f(z)=z²,ζ=1 | Quotient z+1 off diagonal; value at 1 is 2=f′(1) | Retain |
| isLittleO_sub_pow_sub_one (210) | g=z²,T=2,z₀=0 | Ratio |z|²/|z|=|z|→0; T=0 excluded | Retain |
| Complex Schwarz (217) | g=z²,ρ=2,M=4,T=2,w=1; T=0,g=1 | 1≤4(1/2)²=1; 1≤1 | Retain |
| norm_mvCoeff_mul_pow_le (228) | f=z₀²z₁,ρ=1,R=2,M=8 | Coefficient norm·ρ³=1≤8; empty coordinates reduce to |c|≤M | Retain |
| norm_sub_partialSum_le (235) | f=z²,R=2,M=4,T=2,z=1; T=0 | 1≤3·4/4=3; 1≤4 | Retain |
| Cartesian Schwarz (245) | n=1,E={0},m=2,r=1,R=5,f=z²,M=25; S=0 | 1≤(15/5)²·25=225; S=0 gives original bound multiplied by n | Retain |
| exp-monomial coefficients (264) | f=z²exp(3z),at 0,orders 1,2,3 | Formula gives 0,1,3; the 0 from choose(2,3) kills truncated-subtraction junk | Retain |
| exp-polynomial independence (271) | Q₀+Q₁exp z with Q₀=1,Q₁=−1; empty T | At 0 gives 0, at log2 gives −1, so global-zero fails; empty conclusion vacuous | Retain |
| archimedean Liouville (287) | K=Q,α=2,D=1; α=1/2 nonintegral | 1≤2·2⁰=2; removing integrality would give 1≤1/2 | Retain |
| scaled Liouville (294) | K=Q,δ=2,a=1,α=1/2,H=1 | 1≤2·(1/2)·1⁰=1; δ=0 excluded | Retain |
| real Thue–Siegel (301) | u=(1,1),X=1,ℓ=2,U=2 | 2<4; ξ=(1,−1) gives 0≤1; no unknowns would require ℓ^m<1, impossible | Retain |
| complex Thue–Siegel (308) | u=(1,1),U=log2,V=−log4,X=1 | (1+√2/2)²≈2.914≤4; ξ=(1,−1) gives 0≤4 | Retain |
| number-field Siegel (319) | K=Q, matrix [1,1],A=1; zero matrix | ξ=(1,−1), product 0, house 1≤2C; zero matrix admits (1,0) | Retain |
| auxiliary function (334) | n=1,N=1,U=11,V=0,R/r=e,L=576,all φ=0 | W=12; count 576≤576; coefficient vector e₁ has size 1≤e and function 0≤1 | Retain |
| Schneider–Lang (352) | n=d₀=d₁=1,x=y=1; n=0 | First coordinate 1 is A; exponential e is T. For n=0 the strict dimension bound forces a nonempty independent family in zero space, impossible | Retain |
| homogeneous criterion (367) | n=1,x=(1,√2),y=log2 | Exponentials 2 and 2^√2≈2.665144; first A, second T. Zero y would fail span=top | Retain |
| algebraic-coordinate criterion (375) | d=1,x=y=1 | exp(1)=e≈2.718282, T; d=0 excluded by NeZero | Retain |
| transcendental_of_isAlgebraic_exp (384) | x=πi; x=0 negative control | exp(πi)=−1 is A and πi is T; exp0=1 but 0 is A, excluded | Retain |
| transcendental_exp (390) | a=1; a=0 negative control | exp1≈2.718282 is T; exp0=1 is A and a≠0 fails | Retain |
| transcendental_log (396) | u=2; u=0 or 1 | log2≈0.693147 is T; total log0=log1=0, excluded by log u≠0 | Retain |
| transcendental_exp_mul (402) | x=log2,b=√2; b=1/2 negative control | exp(√2log2)≈2.665144 is T; exp((log4)/2)=2 is A, irrationality fails | Retain |
| principal Gelfond–Schneider (408) | α=−1,β=−i; α=1 negative control | (−1)^(−i)=expπ≈23.140693; 1^(−i)=1 excluded | Retain |
| quotient alternative (415) | y=log4,x=log2; y=log2,x=log3 | First quotient 2 is rational; second ≈0.630930 is T. x=0 excluded | Retain |
| Baker basis form (428) | K=Q,β=1,l=0; l=log2 | 0 algebraic gives l=0; log2 is not algebraic, so latter fails hsum | Retain |
| Baker affine independence (436) | l=(log2,log3),zero coefficients; dependent (log2,log4) | First relation 0=0 gives zeros; dependent coefficients (2,−1) give 0 with nonzero coefficients and fail independence | Retain |
| Baker finite-set form (443) | s empty; s singleton,l=log2 | Empty relation β₀=0, conclusion β₀=0; singleton nonzero coefficient gives nonzero logarithmic form | Retain |
| Baker add_sum_mul_ne_zero (451) | β₀=1,l=log2,β=1; no logs | 1+log2≈1.693147≠0; empty sum gives 1≠0 | Retain |
| Baker transcendental_sum_mul (459) | l=(log2,log4),β=(1,1); β=(2,−1) | First sum 3log2≈2.079442 is T; second is 0, excluded by hΛ | Retain |
| Baker exponential affine form (466) | β₀=1,l=log2,β=1; β₀=0 negative control | exp(1+log2)=2e≈5.436564; at β₀=0 gives 2 and hypothesis fails | Retain |
| Baker branch-free product (475) | l=2πi,β=√2 | exp l=1; exp(βl)≈−0.858216+0.513288i≠1; principal 1^√2=1 | Previous R01 repaired |
| Baker principal product (484) | α=(2,3),β=(√2,√3); dependent β=(√2,−√2),α=(2,2) | First product≈17.869770; second product=1 and independence of (1,β) fails | Retain |
| Padic integer bound (502) | p=3,n=9; n=2; n=0 | 9·1/9=1; 2·1=2≥1; zero gives 0<1 and is excluded | Retain |
| PadicExp radius (512) | p=2,3 | ρ₂=1/2; ρ₃=1/√3≈0.577350; factorial estimate gives these lower radii | Retain |
| PadicExp exp_add (517) | p=3,x=y=3 | norms 1/3<ρ; exp6=(exp3)². At x=y=0: 1=1·1 | Retain |
| PadicExp norm_exp_sub_one (523) | p=3,x=3; x=0; p=2,x=4 | Norms 1/3=1/3; 0=0; 1/4=1/4 | Retain |
| PadicExp injOn_exp (528) | p=3,x=0,y=3 | exp0=1, distance from exp3 is 1/3≠0; equal inputs give distance 0 | Retain |
| exp-polynomial sum (533) | Q=X,ψ=3,x=1 in Q₃ | Sum=exp3, whose norm is 1; ψ=0,x=2 gives polynomial value 2 | Retain |
| exp-polynomial coefficient bound (544) | Q=1,ψ=3,r=1,M=1 in Q₃ | First coefficient norms 1,1/3,1/9≤1; at r=0 only constant term survives | Retain |
| integral norm bound (554) | Q₃,x=3; x=1/3 negative control | 1/3≤1; 3>1 but 1/3 not integral. In a trivially normed field nonzero norms are 1 | Retain |
| ultrametric Liouville (559) | K=Q,x=3,H=3,D=1; δ=3,x=1/3,H=1 | 3·1/3=1; denominator case 1·3=3≥1. Wrong exponent D−1 would give 1/3<1 | Retain |
| ultrametric Schwarz (568) | f=z²,r=1,M=1,T=2,z=3 in Q₃ | 1/9≤(1/3)²=1/9; at z=0:0≤0 | Retain |
| many-zero coefficient bound (586) | f=(X−1)(X−2),A={1,2},S=1,r=3,M=9 in Q₃ | Norms (1,1/3,1)≤9/3²=1; weighted norms (1,1,9)≤9 | Retain |
| many-zero value bound (596) | Same f, x=0; empty A | Norm f(0)=norm2=1≤1; empty A yields M rather than a fictitious gain | Retain |
| Hermite interpolation (609) | σ=(0,1),S=1,r=0,s=0,ϱ=1; singleton σ=0,s=2 in Q₂ | W=1−X has values (1,0), coefficient norms≤1; X²/2 has second derivative 1 and coefficient norm 2=norm(1/2!) | Retain |
| expDerivFactor (620) | c=2,P=X,m=0,1,3; c=0,P=X³,m=2 | X;1+2X;12+8X;6X. Zero ring yields zero operator | Retain |
| expDerivFactor_eq_sum (625) | c=2,P=X²,m=2 | 4X²+8X+2 on both sides; characteristic 2 gives 0 on both sides | Retain |
| natDegree_expDerivFactor_le (631) | c=2,P=X²,m=2; P=0 | 2≤2; natDegree0=0≤0, no subtraction error | Retain |
| norm_coeff_expDerivFactor_le (637) | Q₃,c=3,P=X,m=1,B=1 | 1+3X has norms 1,1/3; bound max(1,1/3)·1=1 | Retain |
| formal exp-polynomial derivative (643) | Q=X,ψ=2,m=1 | D(Xexp2X)=(1+2X)exp2X; constant and linear coefficients 1,4 on each side | Retain |
| p-adic Baker affine independence (654) | Empty family; off-disc singleton ℓ=1,β₀=−1,β=1 | Empty relation is β₀=0; off-disc exp1=0 is algebraic and −1+1=0 would contradict conclusion, but norm1=1≥ρ excludes it | Retain |
| p-adic linear-form transcendence (663) | ℓ=log₃4,β=1,β₀=0; β=0 | Nonzero form has norm 1/3; zero coefficient gives algebraic β₀ and violates hne | Retain |
| transcendental_exp_prime (672) | p=3 versus p=2 | 1/3<1/√3; 1/2=ρ₂. At n=2^j terms 2^n/n! have norm 1/2 and do not tend to zero | Retain |
| transcendental_e (682) | a=1 | a≠0; exp1≈2.718282, versus exp0=1 | Retain |
| transcendental_pi (686) | x=πi | exp x=−1; (−i)x=π≈3.141593 | Retain |
| transcendental_exp_pi (689) | principal log(−1)=πi | (−i)(πi)=π; expπ≈23.140693 | Retain |
| transcendental_two_cpow_sqrt_two (692) | principal positive base | exp(√2log2)≈2.665144; exponent 1/2 instead gives √2, algebraic | Retain |
| transcendental_log_two (695) | principal real log | exp(log2)=2; log2≈0.693147≠0 | Retain |
| transcendental_log_two_div_log_three (698) | log2/log3 | ≈0.630930; equality to a/b would force 2^b=3^a; prime exponents force a=b=0, forbidden denominator | Retain |
| transcendental_pi_add_log_two (702) | coefficients −i,1 on logarithms πi,log2 | (−i)πi+log2=π+log2≈3.834740≠0 | Retain |

### Adversarial values: README-only statements, proof steps and conventions

These additional rows cover the sampled proof steps, definitions removed from the Lean file, the supplier counterexample, and API/check computations not covered by a separate declaration above.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| Packing contract, README 291 | One coordinate, singleton, c=1,ε=5; then {-1,1},c=ε=1 | 1>16/25; repaired premise 5≤1 false. Valid example: separation 2>1 and count 2≤16 | R02. |
| Box convention | r=(1,2),c=3,z=(3,6); equal radii r=(1,1) | Bounds 3≤3 and 6≤6; equal-radius box has sup norm≤3 | Body matches; positive radii matter in packing. |
| 0.1 finite products of sums | Families (1,2),(3,4); empty outer/inner family | Product sum 3+4+6+8=21=(1+2)(3+4); empty outer=1; empty inner=0 | Retain. |
| 0.2 sum of power series | g_j(z)=z^j/2^j,r=1 | Double coefficient norm sum=2; at z=1/2, sum and reconstructed series both 4/3 | Retain; complete value space. |
| 0.3 zero/additive/scalar coefficient API | Mixed coefficient 1 of u₀v₁ | Zero coefficient 0; sum of two copies 2=1+1; scalar 3 gives 3=3·1 | Retain. |
| 0.4 constant coefficient/constant function | f=z²,x=3; f=7 | Constant coefficient 9=f(3); constant-function coefficients (7,0,0,…) | Retain. |
| 0.4 subtraction/finite sums | f=z²,g=3z at x=1,degree 1 | Difference −1=2−3; sum of three copies of z² has coefficient 6=2+2+2 | Retain. |
| 0.4 monomial API | f=z₀²z₁ at 0 | Coefficient at (2,1)=1; at (1,2) and (0,0)=0 | Retain; not a separate admitted example. |
| 0.5 coordinate division | f=z² at 0,m=2 | Quotient 1, f(z)=z²·1; derivatives below 2 vanish, second derivative=2 | Retain. |
| 1.1 coordinate maximum | f=z₀z₁,R=2 | Boundary supremum=4; interior norm≤4 | Retain. |
| 1.2 polynomial quotient bounds | f=(z−1)²,g=1,r=1,R=3,M=16 | Quotient norm1≤16/(3−1)²=4; at z=−1, norm4≤16(2/2)²=16 | Retain. |
| 1.2 single-power variant | f=z²,g=1,R=3,r=1,M=9 | Quotient1≤9/9=1; inner value1≤9(1/3)²=1 | Retain; R>0 is indispensable. |
| 1.4 homogeneous terms and torus extraction | f=z²,R=2,M=4,y=1; root orders 2 and 3 | Term1≤4; two-point average of z² is1, wrong for constant coefficient0; three-point average (1+ω²+ω)/3=0 | Correct k+1 sampling. |
| 1.5 multi-index inequality | f=z²,T=2,r=1,R=2,M=4 | Actual1; low-order sum0; bound3 | Retain. |
| 1.6 finer K-bound | n=m=S=r=1,R=5,f=z,M=5 | K=2; fine bound=10; coarse bound=15; actual inner supremum1 | Retain. |
| 2.1 translated coefficient formula | f=z²exp z,at ξ=1,σ=2 | Taylor coefficient=(1/2+2+1)e=7e/2; derivative/2! gives the same | Retain. |
| 2.2 growth | z²exp z,z=1 | Actual e; bound (1+1)²e=4e | Retain. |
| 2.3 frequency distinction | Frequencies 0 and 1; repeated frequency 1 | 1−exp(log2)=−1; repeated equal exponentials cancel as exp z−exp z=0 with nonzero coefficients | Distinctness is essential. |
| 3.2 size operations | δ=2,a=b=1,α=β=1/2,H=H′=1 | Scaled product1≤1; scaled sum2≤2; scaled square1≤1; exponent c=2 gives2≤2 | Denominator exponents agree. |
| 3.3 finite data | {√2,1/2} in C | Degree of Q(√2)=2; δ=2; houses 2√2≈2.828 and1≤G=3; δ≤G | Retain. |
| 4.1 weaker interpolation constant | W=12,T=17; T≤4W/3+1 | 1+T=18≤exp4/2≈27.299; increasing W keeps the exponential ahead of 2+4W/3 | Constant 1+T still fits source proof. |
| 5.1 F and Γ | T=0; n=2,d₀=d₁=1,one selected term; n=1,d₀=0,d₁=1,T=2 | F=p₀,Γ=e^N; selected term z₀exp z₁; last F=exp2z,Γ(ρ)=3exp2ρ | Formula tests. Last two are tests of the formula outside the contradictory-data dimension conditions, not realizations of all standing hypotheses. |
| 5.2 denominator and H | All discrete parameters,δ,G=1,N=0 | a(2)=4; H(0),H(1),H(2)=8,24,64. T=0 gives a(0)=0,H(0)=e^N | Retain. |
| 5.3 Λ | Same data,D=2,M=0,1,2; D=1,M=0 | Λ=8,24,256; D=1 case Λ=δ^a; M=2 gives M^M=4≥σ!∈{1,2} | Retain. |
| 5.4 nonvanishing | x₂=2x₁, coefficient pair (1,−1) at (2,0),(0,1) | Frequencies equal2x₁; F=0 despite p≠0 | Independence excludes the wrong model. |
| 5.5 total-degree transport | n=2,M=3,S₁=1; P(u)=[u(u−1)(u−2)]², F(u,v)=P(u), y₁=(1,0),y₂=(1,1) | floor(3/2)S₁=1. Rectangular first-order derivatives vanish on old grid, but transformed mixed derivative at0=P″(0)=8 | Total-degree repair needed and present; source gap below. |
| 5.6 parameters | n=d₀=d₁=D=δ=G=1,A=A_y=B=0 | c₃=1/144,K₁=3457,S₁=60; q=1 gives N=0; q=2 gives R/r=2<e | Two small choices correctly rejected. These are scalar parameter tests; A_y=B=0 cannot be an actual nonzero-dimensional basis. |
| 5.6 large-q inequalities | Same scalar data,q=10^6 | U≈9.59410e10,N≈2.39853e10,S₀=289268151; count 1.86395e23≤3.31369e23; growth log1.49142e7<U; vanishing log5.63577e9<U; extrapolation log at S₀≈−1.39452e11<0 | For these data extrapolation log is const−29M log M, decreasing for M≥S₀. Scalar inequalities nonvacuous. |
| 7.1 embedding/trace normalization | Basis (1,√2) | Embedding determinant squared8; trace Gram matrix diag(2,4), determinant8 | Both required inversions agree. |
| 8.1 factorial / sums / boundary | Q₃,n=3; two copies of x=3; Q₂,x=2 | norm(3!)=1/3≥3^(−3/2); exp(2x)=(exp x)²; boundary terms for n=2^j have norm1/2, not→0 | Strict disc and natural-number normalization correct. |
| 8.3 characteristic-zero control | f=X³ in characteristic3 | All positive ordinary derivatives vanish, but root multiplicity at0 is only3 | CharZero in signature prevents the overclaim. |
| 8.6 frequency/gamma/polynomial/series | k=1,e=(2,3),ℓ=(3,6),β=2,β₀=5,d=2; then k=0,d=0,e=1 | ψ=24,γ=7,e_noneβ₀=10; factors X²,2X+10X²,42X²; singleton series exp(ℓX), derivative β₀exp(ℓX) agrees iff β₀=ℓ | Formulas sound; separate API/Checks still needed, R04. |
| 8.6 value and relation | k=0,ℓ=β₀=3,l=2,m=0; change β₀ to5 | exp6=(exp3)²; derivative constant coefficient3 versus5 if relation dropped | Relation is used in the correct identity. |
| 8.7 arithmetic, integrality, E and separation | k=0,L=h=1; nonintegral P=1/2,δ=1; α=1/4,δ=4,G=1,p=3 | Count4=4; E=4G^4 gives4,64 at G=1,2; A=1/2 nonintegral; separation would be1/2≤1/3 but δ≤G fails | Negative controls correct; E's other values12 and64 supplied in R04. |
| 8.8 admissibility and final extraction | k=0,L=h=D=G=C=1,p=3,r₀=2,S=R=0; f=X+exp3X | Final sides1536 and1 reject zero ranges. Hermite dual W=X−2X²/3+X³/9 gives functional4−6+3=1=P(1,0) | Factorial and direction correct. |
| 8.9 all parameter conditions | k=0,D=B=G=C=lmin=1,p=3,r₀=2,X=2^22,Kmax=21 | Count logs320.927<335.483; S₀/h²=1/2,R₀/h=1,2S(J+1)/S(J)=1; maximal extrapolation log ratio5.32056e−44; final logs3.46213e145<2.34359e271 | All 21 extrapolation steps evaluated. General exponent count: unknowns exceed equations by one power of X; each extrapolation gain exceeds the L·R′ exponent by one power. |

The table has 76 declaration rows and 36 additional rows. The remaining standing restrictions have direct roles: number fields are nonzero characteristic-zero finite extensions; a finite complex basis rules out rank-deficient maps; elementary polynomial identities also permit the zero ring and positive characteristic; ordinary-derivative zero counting requires characteristic zero; positive radii protect analytic division. The roadmap has no assertion about arbitrary schemes, nonabelian groups, inseparable number fields, noncompact-group integration or a DVR-uniformizer identification to which those unrelated defect classes apply.

## Not verifiable

- **Baker75**, Chapter 2 Theorems 2.1–2.4 and Lemmas 1–7/§5: the sources service title search and DOI 10.1017/CBO9780511565977 reached Cambridge errors/timeouts, not readable text. W00 supports the complex conclusions; it does not certify this book's exact numbering or the whole p-adic adaptation.
- **Brumer67**, pp.121–124: the DOI route reached Wiley HTTP403. The original text and its precise treatment of the constant term were not read. The roadmap identifies the constant-term proof as a Baker-method adaptation; the displayed author-code signatures are independently readable.
- **BM80**, pp.283–288, and **Hua82**, §17.9: the sources service classified them as paywalled/uncertified. The actual BM80 title was resolved after an unsuccessful DOI lookup. No content is inferred from those landing pages. The Bertrand–Masser argument reproduced in W00 was read.
- **Lang66** and **BG06**: the former yielded no legal text; the latter's Cambridge DOI timed out. Neither citation has an internal README locator. Their use here is background; the native Siegel and house inputs were inspected directly.
- **KaratarakisBaker**, CriterionMain.lean at 1d51891b5b: the sources service returned an unrecognized-document response. The full complex provenance file map, claimed axiom set and sorry-free closure were not certified. **KaratarakisPadic** Main.lean was read, but its imported proof tree was not built or audited in full. No downloaded source code was executed.
- The full Zhao and Karatarakis Mathlib submissions were not audited. The pinned library, rather than a promised future merge, was used throughout.
- The exact worker-seeded 15-target list is unavailable in the brief. The reproducible replacement list and all its successes/limitations are stated above. Open-head ownership checks are limited to supplied files; the two additional consumer references noted above remain unverified.

All requested review work independent of those unavailable texts is completed. Missing-text attempts are recorded in the scratch request file; settled paywalled works were not added there under new keys. The successful W00 retrieval was removed from the missing list. No source manifest or pull-request file was edited.

## Source issues

- **Misprint** in W00 at Lemma 4.13 proof, printed p.134 (W00 line 7001): the source says the auxiliary one-variable function at the vector z₀ has modulus |g(1)|; it should be the remainder G at z₀ has modulus |g(1)|; affects the proof.
- **Misprint** in W00 at §4.6 step 4, printed p.139 (W00 line 7219): the source says (4.14) is the upper bound and (4.16) the lower bound; it should be (4.14) is the lower bound and (4.16) the upper bound; affects nothing.
- **Gap** in W00 at §4.6 step 5, printed p.140 (W00 lines 7246–7256): the source says rectangular vanishing order transfers through the y-basis substitution; it should be total-degree vanishing transported first and coordinate order reduced by dimension; affects the proof.
