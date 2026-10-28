<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1764#issuecomment-6400420857 -->
Review (codex) of 7b1c006

Verdict: needs_changes

1. **F01** (P1) Seven declared gaps still have no owner or readable contract

   **Location:** `packages/RelativeFarguesFontainePartII/design/plan.json:5420–5476`; compare `packages/RelativeFarguesFontainePartII/README.md:31–103`. The first record says `"id": "G-MATRIX"`; these seven records have `id`, `title`, `detail`, `neededBy`, but no supplier or section.

   **Claim:** The package provides an owned dependency chain for its headline results.

   **Witness:** Seven legacy records have no supplier; the README contains only six `gap:` contracts, none for G-MATRIX, G-GENERATORS, G-BOUNDARY, G-HOMOGENEITY, G-EQUALCHAR, G-COORDINATE or G-RADIUS. Missing supplier means unowned under this review’s explicit rule.

   The mathematical obligations appear in the prose, but promoting an obligation to a theorem paragraph has not reconciled the outstanding design records:

   | Gap | Plan line | Corresponding package target |
   |---|---:|---|
   | G-MATRIX | 5420 | §8.9, simultaneous control of approximation and factorization neighborhood |
   | G-GENERATORS | 5428 | §§8.6–8.7, 8.10, one finite generating family and closed submodules |
   | G-BOUNDARY | 5437 | §9.5, two distinct boundary counterexamples |
   | G-HOMOGENEITY | 5445 | §11.5, automorphism extension for the specified maximally complete field |
   | G-EQUALCHAR | 5453 | §§7.6, 10.7, characteristic-two separable quadratic comparison and twists |
   | G-COORDINATE | 5462 | §1.9, ramified carry polygon and transformed threshold |
   | G-RADIUS | 5470 | §9.4, descent in an arbitrary compact J-norm |

   **Exact repair:** Reconcile each unresolved record with actual ownership. Where this roadmap owns the result, record its named local target and resolve the stale unowned gap in the top-level gaps list with an explicit resolution; where a supplier must prove it, give an earlier named supplier, exact section, atomic quantified requirement and matching `slug`/README contract. Do not turn a local prerequisite into a self-dependency or cite a later consumer. Split the two boundary obligations if kept as supplier contracts. Preserve the general statements, including irrational singletons and characteristic two. In resolving G-MATRIX, import AdicSpacesPartIII R3.2’s existing generic finite-module surjectivity theorem; what remains local is verification of its annular-square hypotheses, including maximal-spectrum coverage. Do not request that generic theorem a second time.

   **Repair test:** The unresolved gap list must have zero absent/`none` suppliers and identical slugs in the README contracts. For G-RADIUS, J={q^(−√2)} with value group q^ℚ has zero contained value-group compact intervals; the repaired owner must supply descent on J itself. For G-MATRIX, a bound ε(Z) alone still supplies no estimate on the chosen approximation error.

2. **F02** (P1) The arbitrary-algebra Witt functor is already owned by the earlier supplier

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:117`: “construct the ramified Witt ghost-polynomial functor on arbitrary O_E-algebras in mixed characteristic”. The ownership claim also occurs at line 13.

   **Claim:** This package owns that general construction, not merely its absolute annular specialization.

   **Witness:** `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:93–95`, VB−1 “Ramified coefficient rings and coefficient changes”, already constructs it on every O_E-algebra, with universal integral operations, noninjective ghosts, functoriality, reduction and Frobenius–Verschiebung API.

   The supplier is earlier: positions 139 and 140 in `merge-order/ORDER.txt` are VectorBundlesAndIsocrystals and this roadmap. Its scope is not confined to perfect residue inputs, contrary to the package’s narrower description of that contract.

   **Exact repair:** Delete the second construction of the arbitrary-algebra functor and its duplicate universal-operation/extensionality API. Expand the existing VB−1 supplier contract to its actual arbitrary-algebra scope, and consume it in §§0.1 and 2.1–2.4. Keep genuinely additional twisted-coordinate and absolute comparison statements, with their difference stated. The Q-twisted material still present in the later RelativeFarguesFontaine §§0.11–0.12 needs a recorded ownership move, not an upward dependency.

   **Repair test:** On O_E/π² the supplied universal polynomial construction still applies without ghost injectivity. At p=2 over F₂, vectors (0,0,…) and (0,1,0,…) have the same ghosts but different coordinates. Importing the actual supplier preserves this negative control without constructing a second functor.

3. **F03** (P1) The Hahn description admits infinite Gauss norms

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:510`: “the exponents on which |a_alpha|_ρ q^-alpha≥c form a well-ordered set”.

   **Claim:** This condition on rational Witt coefficients characterizes elements of B_I.

   **Witness:** Set q=2, Γ=ℤ[1/2], E=𝔽₂((π)), I={1/2}, and a_n=π^(−n²) at exponent n≥0. Every threshold support is well ordered; the term norms are 2^(n²−n), with supremum ∞.

   Thus the definition admits an object outside the normed completion it purports to describe. Merely allowing rational coefficients corrects the source’s omission of π⁻¹ but invalidates the boundedness argument available with integral coefficients.

   **Exact repair:** Define the Hahn period model as the separated Gauss completion of the bounded Hahn/Witt localization already used for Bᵇ, and prove its explicit coefficient description with both finite Gauss bounds and the required approximation/growth condition. Do not use well-ordered threshold supports alone, or silently restrict back to integral coefficients. Specify the norm/restriction/Frobenius API and at least three distinct Checks; this definition currently has no API list and only two Check bullets, both using π⁻¹.

   **Repair test:** π⁻¹ remains allowed with norm 2; T has norm 1/2. The displayed a_n family must be excluded by its infinite norm. Also test a_n=π^(−n) at exponent n: its monomial partial-sum differences have norm 1 at ρ=1/2, so boundedness alone cannot justify that proposed sum by convergence of those partial sums. Actual completion membership must be proved by the repaired criterion.

4. **F04** (P1) The closed-maximal-ideal assertion forgets the field exception

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:1236`: “closed maximal ideals are exactly the classical points Y_(F,I)”.

   **Claim:** This identification holds for every nonempty interval I⊆(0,1), including singletons.

   **Witness:** Take F=ℂ_p^♭ and I={p^(−√2)}. Section 5.1 gives a complete field B_I and Y_(F,I)=∅. Its zero ideal is closed and maximal: the two sets have cardinalities 1 and 0.

   The divisor/nonzero-closed-ideal bijection itself survives: the sole divisor 0 corresponds to the unit ideal B_I. It is the purported consequence about **all** closed maximal ideals that fails. FF17 Corollary 3.5.3 has the same omitted exception.

   **Exact repair:** Identify classical points with **nonzero closed maximal ideals**. State separately that when B_I is a field its zero ideal is the extra closed maximal ideal. Preserve the irrational-singleton theorem rather than excluding these intervals from the roadmap. Add this example to §5.3’s Checks and cross-check every subsequent use of classical maximal-spectrum coverage.

   **Repair test:** On the witness, both the classical-point set and the nonzero-closed-maximal-ideal set are empty; the full maximal spectrum is {(0)}. D=0 still maps to B_I. On an ordinary compact annulus containing a primitive point, that point’s maximal ideal is nonzero and the correspondence is unchanged.

5. **F05** (P2) The graded-fibre theorem omits t ≠ 0

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:1524`: “For t in P_1 vanishing at y, P/tP identifies as a graded algebra with {f in K_y[T]:f(0) in E}”.

   **Claim:** Vanishing at y alone is sufficient for the graded quotient identification.

   **Witness:** t=0 gives P/tP=P. For c=√π∈K_y∖E, (cT)²=T(πT) gives inequivalent degree-one factorizations in the proposed target, contradicting §6.3’s homogeneous factoriality of P. FF17 line 10306 explicitly requires t≠0.

   Equivalently, the evaluation map used by the proof has degree-one kernel E·s_y≠0, whereas quotienting by t=0 kills nothing.

   **Exact repair:** Require `0≠t∈P₁` and that y is a degree-one zero of t; state that div(t) is its Frobenius orbit, as in the cited corollary. Add t=0 as a rejected input. For the adjoining integral interpolation statement, retain the primitive normalization Π₋(a_i)∈A∖πA explicitly when choosing representatives.

   **Repair test:** With t=s_y the degree-one quotient is P₁/E·s_y≅K_y by §6.10, and the evaluation kernel is killed. With t=0 the hypothesis fails. Multiplying a normalized negative-half generator by π must not be accepted as another normalized representative.

6. **F06** (P3) Two Checks are process statements, not mathematical tests

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:1791`, “Uniform finite generation remains uniform generation”; line 1910, “This is a theorem target with an explicit quantitative supplier gap”.

   **Claim:** These bullets serve as discriminating Checks for uniform generation and continuous descent.

   **Witness:** Neither bullet specifies an instance or computed value. Both remain verbatim true descriptions if the adjacent mathematical theorem is replaced by a false one.

   **Exact repair:** Delete these two bullets; keep gap information in Exact supplier contracts and dependencies. Retain the actual rank-zero/rank-two and matrix-product Checks, and add any further concrete tests needed for definitions. No Lean declaration should be added to replace these bullets.

   **Repair test:** The remaining tests compute Γ(0)=0, Γ(B_J²)=B_I², and E₁₂E₂₁=E₁₁≠E₂₂=E₂₁E₁₂. The removed text contributes no lost mathematical assertion.

Six findings: four P1, one P2 and one P3; five blocking. The scope is repairable: retain the absolute function theory, fix the two false assertions and the missing hypothesis, remove the duplicated supplier construction, and settle the unowned gap records. No previous review was supplied.

## Verified sound

All four submitted files and all 109 numbered README subsections were read. The scratch worklist and 109-row computed ledger record the full subsection pass; the table below retains the seeded sample, headline targets and finding-related targets for this report. Calculations test definitions and conventions; they do not certify unresolved analytic existence proofs. No copied source passage, executable computational algorithm, good-prime restriction, sorry’d data, `set_option`, admitted example or illegal import was found in the package. The Newton corrections are mathematical proof routes, not executable procedures. The package uses 12 ordered layers, each ending in Examples and Dependencies. Shape was compared with main’s ComplexTori and PadicMeasuresIwasawaAlgebras roadmaps.

The convention checks distinguish raw and normalized scalar norms, radius zero and logarithmic parameter zero, positive rings and power-bounded rings, primitive degree and residue-field degree over E, Frobenius point direction, dual twist signs, repeated jets and separate points, nonnormal Galois stabilizers, compact fields and PIDs, and fibre dimension versus torsion length. p=2, p=3, equal characteristic, ramification, zero rank, the zero representation, empty products, inseparable extensions and square-zero quotients were included where relevant. q=1 and trivially valued F are excluded by the stated standing assumptions.

### Source sample

The manifest’s FF17 locators refer to the dated 2017 author copy, not an assumed match with the 2018 publication. Printed pages were checked against the extraction headers. All 15 seeded targets were opened; no sampled text was inaccessible. The SGA 1 citation inside §10.3 was missing from the manifest, so the sources service appended the single key SGA1. The four original entries remain unchanged.

| Target | Text opened, theorem/page | Outcome |
|---|---|---|
| 0.9 | FF17 lines 2994–3009, Proposition 1.6.12 and Remark 1.6.13, p.72 | Both derivative signs agree; singleton example detects the plus-ring issue. |
| 1.5 | FF17 lines 3752–3813, Definition 1.10.2, Proposition 1.10.5, Remark 1.10.6, pp.89–91 | Algebra equality and stronger endpoint-one topology correctly separated. |
| 2.3 | FF17 lines 4139–4249, Lemma 2.1.6 and Proposition 2.1.10, pp.100–103 | Complete-algebra theta and residue-Frobenius surjectivity supported; p-typical comparison also checked at pin. |
| 2.12 | FF17 lines 4932–4959, Lemma 2.3.14 and Proposition 2.3.16, p.120 | Correct normalization; package repairs the printed difference inequality. |
| 3.1 | FF17 lines 5006–5102, Theorem 2.4.1 and its argument/corollaries, pp.122–124 | Algebraic closedness, primitive degree, bounded-radius approximation and factor count retained. |
| 3.7 | FF17 lines 5340–5403, Proposition 2.7.3 and Theorem 2.7.4, pp.130–132 | Both divisibility directions and translations agree in the stated interior scope. |
| 5.3 | FF17 lines 5866–5897, Proposition 3.5.2 and Corollary 3.5.3, p.146 | Nonzero closed ideals supported; maximal-ideal consequence has R04’s exception. |
| 6.4 | FF17 lines 9921–9968, Definitions 6.2.2/6.2.4, Lemmas 6.2.3/6.2.5, pp.245–246 | Fundamental window and weights agree. Extension from geometric effective divisors to signed general-field divisors uses §4.7 and the finite-support carrier. |
| 6.9 | FF17 lines 10183–10268, Proposition 6.3.1, Remark 6.3.2 and comparison, pp.251–253 | Normalized logarithm, level-grouped products and equality modulo E× supported. Equal-characteristic extension is separately contracted. |
| 6.10 | FF17 lines 10270–10305, Theorem 6.4.1 and Example 6.4.2, pp.253–254 | Orbit separation, repeated jets, one-dimensional kernel and Banach exactness agree. |
| 7.3 | FF17 lines 10574–10675, Proposition 7.1.2 and proof, pp.262–264 | Package correctly excludes V=0 from nonvanishing. Quantitative general-field effectivity remains a supplier obligation. |
| 8.4 | ST02 lines 138–140, 293–448, §3, pp.7–11; FF17 lines 14599–14653, pp.369–370 | General complete nonarchimedean K is allowed; right flatness, dense projections and ordinary stage base change agree. No inference of finite generation from coadmissibility alone. |
| 10.3 | FF17 lines 10893–10920, Proposition 7.6.1, pp.269–270; SGA1 lines 3849–3856, Exposé V, Corollaries 2.3–2.4, reprint p.93/original p.113 | Residue stabilizer versus inertia distinction correct. Scheme torsor extension is explicitly contracted; no invertibility of group order used. |
| 10.7 | FF17 lines 11005–11069, Propositions 7.8.1–7.8.2, Example 7.8.3, pp.273–274 | Positive degrees, character twists and λ⁻¹ multiplier agree; equal-characteristic quadratic transfer is an additional obligation. |
| 11.1 | Berger08 lines 428–450, Remark 1.1.3, p.96 | Interleaved convex coefficient sequences, irrational limit and passage to the positive completed ring supported. No conclusion about B itself. |

Additionally opened KT16 Theorem 1.2, line 34, Theorem 1.3, line 64, Definition 2.3/Lemma 2.4, lines 101–135, and the proof at lines 169–212, pp.1–5. The source theorem permits arbitrary characteristic-p k, not just perfect k. The primitive-extension differential criterion is used after changing ground field, as required.

For the author’s outstanding proof obligations, also read FF17 lines 459–469 (homogeneity claim without extension proof), 3434–3462 (cyclotomic radius), 10776–10820 (quadratic generation), 14468–14471 (B-plus essential image), 14613–14653 (global generators), 14715–14808 (matrix gluing), and 14866–14919 (finite annular descent and its endpoint restrictions). These passages do not close the seven unowned records merely by citation.

### Computed adversarial table

These 56 rows cover the sample, the headline families and every finding’s mathematical witnesses. “Pass” means the displayed calculation agrees, not that it proves the full theorem.

| Target | Instances and computed values | Result / required change |
|---|---|---|
|0.1|Length 0 Witt ring has 0=1; length 1 is R. At p=2 on F₂, ghosts of (0,1,0,…) are all 0, while coordinate 1 is 1. Q=2X+X² gives [1]_Q=−1, whose square 1 differs from [1·1]_Q=−1. q=2,r=2 gives raw norm π=1/4 and normalized norm=1/2.|Conventions pass; arbitrary-algebra ownership duplicates VB−1.|
|0.4|π−[a],v(a)=2 has transform min(r,2), values 1,2 at r=1,3. Monomial gives 2+2r for r≥0, −∞ for r<0; polygon is +∞ left of index 2.|Pass.|
|0.5|Slopes 2,5 give v₁=2,v₃=5,v₆=7 and derivative jumps 1,1, not one slope 7.|Pass.|
|0.8|min(5r,11.2−3r) on [0.5,1.5] gives endpoint values 2.5,6.7, maximum 7 at 1.4; errors >7 preserve values.|Pass; endpoint zero uses separate π-adic stabilization.|
|0.9|[a]π²,v(a)=3,r=1 gives (5,2),(5,−2). At singleton r=1 with v(a)=1, π/[a] gives (0,1),(0,−1); its inverse exchanges signs.|Pass; smaller plus ring needed for both valuations in this singleton example.|
|0.10|e=2,f=1,q=2: right norm π=1/4=(1/2)²; right radius is square root of left. e=1 gives unchanged radii and φ iterated f times.|Pass.|
|1.2|π−[a],v(a)=2 has left bound 0 and lower height 0, extends at both ends. Closure not meeting endpoint gives no extension criterion there.|Pass.|
|1.3|π is a unit with inverse π⁻¹; π−[a] has one zero at radius |a|, nonunit on that radius and unit off it.|Pass.|
|1.5|At q=2,ρ=1/2, π⁻¹ has raw norm 2 but endpoint-one norm 1; [a]⁻¹ with v(a)=2 has endpoint-one norm 4.|Pass; positive is not power bounded.|
|1.9|p=2 ordinary bound=1/4, transformed bound=2^(−1/2). e=2: faces (0,1),(2,1/2),(4,1/4) have slopes 1/4,1/8, lengths 2.|Numerics pass; G-COORDINATE remains unowned.|
|1.11|q=2,Γ=Z[1/2],a_n=π^(−n²),α=n: every threshold support is a subset of N, hence well ordered, but at ρ=1/2 terms are 1,1,4,64,… with supremum ∞.|FAIL: add finite norms and actual completion/growth condition.|
|2.3|Monomial θ([x])=x♯, θ(0)=0, θ(1)=1. For R=F_p, θ is reduction W(F_p)→F_p and onto.|Pass with residue-Frobenius hypothesis.|
|2.12|f=1 and δ=2: truncated values min(0,2)=0=0; printed difference inequality would say 0≥2. Normalized π norm=q⁻¹.|Pass corrected identity.|
|3.1|Product of two primitive linear equations has degree2 and two factors; degree0 empty product=1.|Pass.|
|3.4|I={0}: π invertible. Integral boundary ring: vπ(π)=1, (π) maximal. Irrational singleton: all nonzero elements units.|Pass; leads to R04 downstream.|
|3.7|Orders f=2,g=1: f/g order1; reversed quotient order−1. Same support does not imply both divisibilities.|Pass.|
|4.5|d=2: marked tilt degree2, two geometric conjugates, integral θ not onto; d=1 onto.|Pass source comparison.|
|4.7|Degree3 point of order2 gives weighted Newton jump6, three geometric points each order2.|Pass.|
|5.1|Value group q^Q,ρ=q^(−√2): Y_I empty, B_I field, maximal spectrum consists of (0). Boundary integral ring adds π ideal.|Pass; field exception explicit.|
|5.3|Same irrational singleton: Y_I empty but closed maximal ideal set={(0)}. D=0 still maps to B_I, the unique nonzero ideal.|FAIL: qualify maximal ideals as nonzero, state field exception.|
|5.4|min(2,3)=2 gives ideal (a²); (f,0)=(f), (0,0)=0 without div(0).|Pass.|
|6.3|Homogeneous degree2 gives multiplicities2 or1+1; degree0 empty product1. No claim about inhomogeneous sums.|Pass.|
|6.4|q=2,ρ=1/2: fundamental window(1/4,1/2] counts upper endpoint once, lower zero times; weights3+2=5 versus unweighted2.|Pass.|
|6.7|b=1 solutionsE, generator1; multiply byπ gives another integral generator but vπ=1. Primitive-normalized generators require vπ=0.|Pass with normalization explicit in section.|
|6.8|φ(Π₊Π₋)=(π^d/b)Π₊·bΠ₋=π^dΠ; negative and nonnegative tails give coefficient1 at each translate.|Pass.|
|6.9|Derivative of π^(−n)[π^n]_LT at0 isπ^(−n)π^n=1; unnormalized derivative tends0.|Pass modulo E×; equal-char contract.|
|6.10|d=0 quotient by unit ideal=0, kernelE; repeated point d=2 gives local ring ξ²=0, length2, versus product of fields with idempotents.|Pass.|
|6.11|t=0 allowed by wording: P/tP=P, evaluation kernel in degree1 contains E·s_y≠0, so not the claimed fibre identification. Backward orbit overlap coefficient max(1,1)=1, not2.|FAIL: require t≠0 and its orbit divisor.|
|7.3|V=0 gives H⁰=H¹=0; nonzero H⁰ statement explicitly excludes it.|Pass; source omitted exclusion.|
|7.4|Zeros of orders1,2 give quotient factors K and O/ξ², lengths1,2; unit f gives empty product=zero ring.|Pass.|
|7.5|Characters of product multiply χψ; trivial ideal character1; inverse twist χχ⁻¹=1.|Pass.|
|7.6|Sym⁰(P₁)=E→P₀ identity. Char2: derivative of X²+πX+π isπ≠0, derivative X²−π=0.|Pass test; equal-char transfer remains unowned.|
|7.7|Ratio of degree-one sections has weighted zeros−poles1−1=0; constant has all orders0.|Pass.|
|8.4|Constant A_n=K,M_n=K² gives limitK² and stage basechangeK²; zero gives0. K[ε]/ε²→K killsε and is not flat.|Pass general field hypotheses in ST02.|
|8.6|Trivial rank2 system sectionsB_I² with identity splitting; rank0 sections0. These do not prove uniform generation of arbitrary systems.|G-GENERATORS unresolved ownership.|
|8.7|O_y/ξ^n fibre dimension1,length n; n copies of residue field have fibre dimensionn.|Pass; uniform fibres≠uniform lengths.|
|8.8|Z=diag(T,T⁻¹): ZE₂₁Z⁻¹=T⁻²E₂₁; derivative U+ZVZ⁻¹ and quadratic term UZVZ⁻¹.|Pass corrected local statement.|
|8.9|Identity rank2 overlap gives B_union²; rank0 gives0. Arbitrary ε(Z)>0 need not bound approximation error chosen beforeZ.|G-MATRIX unresolved ownership.|
|8.10|d=0 submodule0 rank0; aR with a≠0 free rank1, proper dense ideal from5.5 not closed.|Pass conditional on generator theorem.|
|9.1|L=F rank1 trace identity; degree-p trace(1)=0; endpoint0 is unramified Witt extension.|Pass tested boundary distinction.|
|9.3|Rank0 descends0; trivial rank1 cocycle1 descendsB_F. E₁₂E₂₁=E₁₁ versus E₂₁E₁₂=E₂₂.|Quantitative matrix input not proved by scalar test.|
|9.4|Value group q^Q and J={q^(−√2)} has0 nonempty contained value-group intervals; included irrational endpoint also missed.|G-RADIUS unresolved ownership.|
|9.5|Artin–Schreier degree-p regular representation has rankp and nonidentity cyclic permutation on inertia; trivial representation has inertia1.|Candidate correct test, endpoint-ring counterexample verification remains an obligation.|
|10.1|q=2 interval[1/4,1/2] satisfies1/4≤(1/2)² equality and meets each radius orbit.|Pass.|
|10.2|Unramified degree2 replacesφ byφ²; separable quadratic splits into2 embeddings, inseparable quadratic tensor can haveε²=0.|Pass.|
|10.3|Quadratic residue stabilizer order2 fixes1 closed point but swaps2 geometric embeddings, inertia1; L=F degree1.|Pass.|
|10.5|Φ=π⁻¹φ fixed vectors satisfyφf=πf; Φ=0 onB excluded, unique0→0 is invertible.|Pass.|
|10.6|Multiplierπ⁻¹ gives degree1, π gives−1, tensor degree0; geometric degree-zero fixed line dimension1.|Pass.|
|10.7|Φ(e)=λ⁻¹e givesφf=λf, degreevπλ; Koszul composite−ts+st=0 including char2.|Pass mixed characteristic; equal-characteristic transfer still a gap.|
|10.8|Approximation dominant termsπ/[b] versusπ[b]; at|b|=1/4 ratio of norms16.|Pass.|
|11.1|β_j↓√2 gives v(h modp)≥√2 and≤β_j allj, hence equals√2∉Q; rational β gives no contradiction.|Pass source comparison.|
|11.2|p=2:d₁=3,d₂=7,d₃=17, differences1,3 and d_n/2^n→3. Identity endomorphism fixesk and continuous but surjective, hence fails required third conjunct.|Pass signature; no one-tactic padding.|
|11.3|Closure of Qp-algebraic elements in Cp=Cp; in strict extension closure=proper embeddedCp.|Pass topological distinction.|
|11.4|Residues of(π), maximal ideal, W(m) areF,k_F,W(k_F)[1/π]; quotientA/(π)=O_F differs from residueF.|Pass.|
|11.5|Norm-preserving automorphism keeps valuation1, cannot send to2; scaling by2 permits1→2; zero remains0.|Conditional orbit theorem passes; maximal extension theorem G-HOMOGENEITY unowned.|
|11.6|Slope2 fails sufficient bound≤1, which has truth valuefalse but gives no converse; repeated two-jet length2 with kernel dimension1.|Pass stated limitation and named obstruction contract.|


### Pinned library audit

Pins read from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths below are relative to the respective pinned library repository. Searches used objects and hypotheses as well as declaration names.

| Opened declaration and location | Actual content and boundary of the import |
|---|---|
| Mathlib `WittVector.fontaineTheta`, `fontaineTheta_teichmuller`, `surjective_fontaineTheta`; `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:165`, 182, 195 | Native p-typical theta; completeness/nonunit assumptions retained; surjectivity adds residue Frobenius. On F_p this is reduction, with θ(1)=1. |
| `fontaineThetaInvertP`, `BDeRhamPlus`, `BDeRham`; `Mathlib/RingTheory/Perfectoid/BDeRham.lean:62`, 75, 88 | Localization, kernel completion and generator localization. If p=0, localization is the zero ring; these definitions do not supply general ramified interval rings. |
| `WittVector.Isocrystal`; `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` | Module with semilinear Frobenius automorphism; finite dimension is not a class field. Zero module is permitted. |
| `IsBezout`; `Mathlib/RingTheory/PrincipalIdealDomain.lean:65`; `IsBezout.TFAE`, `Mathlib/RingTheory/Bezout.lean:55` | Principality of finitely generated ideals, not all ideals. The domain/noetherian hypotheses distinguish the PID upgrade. |
| `ContinuousLinearMap.isOpenMap`, `exists_nonlinearRightInverse_of_surjective`; `Mathlib/Analysis/Normed/Operator/Banach.lean:228`, 278 | Complete normed spaces and complete nontrivially normed coefficient field. The right inverse is bounded and nonlinear; no splitting as a continuous linear map is supplied. |
| `ApproximatesLinearOn.image_mem_nhds`; `Mathlib/Analysis/Calculus/InverseFunctionTheorem/ApproximatesLinearOn.lean:290` | Requires the actual linear comparison and its quantitative bound. For conjugation by diag(T,T⁻¹), E₂₁ maps to T⁻²E₂₁; additive surjectivity before conjugation is different. |
| `LaurentSeries.valued`; `Mathlib/RingTheory/LaurentSeries.lean:502`; `IsAlgClosure`, `Mathlib/FieldTheory/IsAlgClosed/Basic.lean:264` | Laurent valuation is native; algebraic closure means algebraicity and algebraic closedness, without a topology. The kept theorem separately binds the norm-order comparison. |
| `KaehlerDifferential`, `.D`, `.linearMapEquivDerivation`; `Mathlib/RingTheory/Kaehler/Basic.lean:148`, 226, 355 | Algebraic cotangent module and universal derivation; no maximal nonexpanding seminorm or separated Banach completion. In characteristic p, d(X^p)=0. |
| `TauCeti.AlgebraicGeometry.WeilDivisor`, `.ofPoint`, `.weightedDegree`; `TauCeti/AlgebraicGeometry/WeilDivisor/Basic.lean:45`, 99, 339 | Carrier is X→₀ℤ; point divisor has coefficient 1 and degree is the weighted finite sum. Weight 3 with multiplicity 2 gives 6. Noncompact locally finite divisors require an extension. |
| `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.finiteProjectiveEquiv`; `TauCeti/AlgebraicGeometry/VectorBundle/Affine/Basic.lean:102` | Affine finite-projective/finite-locally-free equivalence, not global sections of a noncompact interval system. Rank-zero objects correspond to zero. |
| `TauCeti.FarguesFontaine.spaY`, `.spaX`, `.isOpenQuotientMap_quotientMap`; `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean:116`; `Quotient.lean:56`, 107 | Y excludes supports containing p or [ϖ]; X is the topological Frobenius orbit quotient with adic-topology hypothesis. These are not the general ramified structure sheaf and completed annulus algebra. |
| `IsRadiusLowerBound`, `IsRadiusUpperBound`, Frobenius radius comparisons and wandering windows; `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Window.lean:97`, 103, 144, 152, 551, 558 | Inequalities use rational powers in the valuation spectrum. κ=α/r in the README converts Frobenius multiplication of κ by p to the inverse logarithmic-radius transformation. |

The README's two Banach file line numbers are displaced by one; both declaration names resolve unambiguously. No substantive supplier claim depends on those offsets. Object searches for ramified Witt constructions, Q-twisted coordinates, Fréchet–Stein/coadmissible carriers and analytic-field differential seminorms did not locate the missing general carriers at these pins. This is not a claim that their p-typical or algebraic components are absent.

### Ownership and supplier direction

Read the board package index before searching. The ownership search covered main and the indexed open roadmap heads using `roadmaps grep`/`roadmaps show`, plus the 19 packages recorded in that index at their recorded heads. Where a package head carried a design rather than a finished README, its design was inspected. Existing main roadmaps were checked on main rather than adopting proposed revisions. The names-only open-PR list was not treated as a substitute for the available head index.

| Consumed object | Resolved current owner and scope |
|---|---|
| Ramified coefficients, relative annuli, marked Cartier divisors, period completions, twists and graded sections | `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md`, VB−1, named subsections at lines 92–201. The arbitrary-algebra duplication is R02; the other constructions are expressly imported. |
| Geometric bundle descent, positive twist cohomology, geometric PID charts and classification | Same roadmap VB1, Annular Frobenius descent, line 448; Slope-sensitive cohomology, 601; Classical points, 621; Regular geometric curve, 661; VB2 Classification. The present roadmap's general-field, arbitrary-interval and effective quantitative refinements are different obligations. |
| Lubin–Tate universal cover and degree-one untilt sequence | Same roadmap VB3, the named universal-cover and fundamental-sequence subsections exist. Repeated jets and the global absolute finite-jet sequence are the added targets here. The degree-two nonrepresentability gap is not inferred from failure of a sufficient slope bound. |
| Tilting, marked untilts, algebraic closedness, finite étale tilting | `TauCetiRoadmap/PerfectoidSpaces/README.md:4727`, 4799, 4870, 4912 (P1.19–P1.22), 8424 (P3.7), 8649 and 8688 (P3.11–P3.12). Quantitative cochains are separately contracted. |
| Finite Galois module descent | `TauCetiRoadmap/AdicEtaleGeometry/README.md:9376`, A4.2a. Faithful flatness and the Galois tensor isomorphism do not require division by the group order. |
| Crystalline sites and generic PD envelopes | `TauCetiRoadmap/CrystallineCohomology/README.md`, CR.1.1, line 611; `TauCetiRoadmap/DerivedDeRhamCohomology/README.md`, PD.1–PD.7. The special radius pro-finality comparison remains a named contract. |
| Formal module, logarithm and inverse-division Tate module | `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md`, LT.0 analytic-log, LT.1 lt-module, LT.2 tate-module-comparison. The supplied source retains finite-ℚ_p hypotheses; the equal-characteristic extension is a declared gap, not a missing-citation finding. |
| Convex conjugation | `TauCetiRoadmap/OptimalTransport/README.md:663–688`, Layer 5(1)–(2). Closed infimal convolution beyond Fenchel–Moreau is separately requested, so it is not duplicated here as a generic construction. |
| Proj and finite quotients | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:551–570`, §0.3; 3021–3043, §1.23. Arbitrary positive Veronese comparison is supplied. Geometrically free scheme torsors without tame group order are the separate declared extension. |
| Nonarchimedean locally convex spaces | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md`, §0.0, line 246; §0.2, line 398. General completion language is available; stronger compact-type duality is not applied without its extra hypotheses. |
| Bounded Witt norms and ordinary Laurent analysis | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`, RD.0.54, line 2233; RD.0.18–RD.0.23, beginning at line 1171. Ordinary Laurent divisors/preparation and discrete-Cohen-coefficient results are imported; arbitrary-perfect-field completed Witt function theory is the additional object. |
| P-typical annular charts and exact gluing squares | `TauCetiRoadmap/AdicSpaces/README.md:691`, 722, 772, 800 (§§6.1–6.4); `TauCetiRoadmap/AdicSpacesPartIII/README.md:9594`, R3.2. The latter explicitly requires strict exactness, density and maximal-spectrum coverage; it is not invoked from ring Mayer–Vietoris alone. |
| Cyclotomic annuli and affine bundles | `TauCetiRoadmap/PadicHodgeTheory/README.md`, §§1.2–1.4, lines 355–390; `TauCetiRoadmap/AlgebraicVectorBundles/README.md`, affine comparison, together with the pinned finite-projective equivalence above. Neither owns the general noncompact interval equivalence. |
| Newton envelopes, finite convolution and ordinary Gauss dictionary | `TauCetiRoadmap/NewtonPolygons/README.md:211–320`, §§0.1–0.6; 512–550, §§2.1–2.3. Source-positive slope λ is the negative of geometric slope; two factors of slopes 2 and 5 retain two lengths, not one slope 7. |

The local exact supplier headings and all `*Needs:*` lines were checked against those objects. The six named gaps match the plan by slug and name an earlier supplier; their missing extensions are contracts, not findings. They are `perfectoid-quantitative-cochains`, `crystalline-pro-final-radius`, `lubin-tate-all-local-fields`, `positive-degree-two-obstruction`, `closed-infimal-convolution`, and `finite-group-free-scheme-quotient`. Their hypotheses distinguish them from the already supplied constructions. The seven ownerless legacy records are treated separately in R01.

The later `RelativeFarguesFontaine` still contains Q-twisted coefficient material in §§0.11–0.12 (beginning at `TauCetiRoadmap/RelativeFarguesFontaine/README.md:340`). Ownership must move to the earlier Part II package for that consumed foundation; it is not an admissible upward supplier citation. No second declaration with the kept theorem's fully qualified name was found on main or in the indexed open heads. The broader object search also inspected Fréchet–Stein distribution algebra plans: their specific distribution algebras do not replace the general ST02 analytic algebra input used here. Board designs for VectorBundlesAndIsocrystalsPartII, PadicHodgeTheoryPartII and CrystallineCohomologyPartII address different extensions and were not treated as absent merely because they lacked a package README.

Mechanical dependency output, with no UPWARD or CYCLE line:

```text
depcheck: 53 roadmaps, 600 edges, 0 problem(s)
```

The citation resolver found no unknown roadmap references, but warned that its library lookup did not inspect the configured pins. The manual declaration audit above supplies that missing check; the resolver was not used as mathematical evidence.

### Headline coverage, elaboration and padding

| Headline family from README | Lean treatment |
|---|---|
| Completed Newton products and weighted zeros (§§0.8, 4.7) | Named in docstring; completed ramified interval ring and point carrier missing. |
| Boundary extension and units (§§1.2–1.3) | Named; boundary period-ring norms missing. |
| Primitive factorization and finite-degree marked untilts (§§3.1, 4.5) | Named; ramified Witt/marked untilt construction missing. |
| Closed ideals, divisors and half-open Bézout (§§5.3–5.4) | Named; interval rings and locally finite divisors missing. |
| Orbit products and homogeneous factorization (§§6.3, 6.8) | Named; actual period eigenspaces and graded algebra missing. |
| Finite-jet fundamental exact sequence (§6.10) | Named; eigenvectors and marked ramified jets missing. |
| General-field Dedekind charts and character class group (§§7.4–7.5) | Named; invariant Be chart and completed action missing. |
| Degree-one generation and weighted schematic curve (§§7.6–7.7) | Named; specific period graded algebra missing. |
| Interval bundle/coherent classification (§§8.6–8.7, 8.10) | Named; compatible annular module systems missing. |
| Finite étale annuli and effective continuous descent (§§9.1–9.4) | Named; actual annular Banach algebras/actions missing. |
| Rational functions, finite covers and coefficient change (§§10.1–10.3) | Named; specific period curve and comparison missing. |
| Frobenius line degree, characters and positive-line Proj (§§10.6–10.7) | Named; modules over actual global period ring missing. |
| Runge approximation and adic reconstruction (§10.8) | Named; schematic charts with radial norms missing. |
| Nonprincipal positive ideal (§11.1) | Named; positive period subring missing. |
| Strict endomorphism of completed Laurent algebraic closure (§11.2) | Stated as `exists_strict_laurentClosure_endomorphism` on native carriers. |
| Exotic untilt (§11.3) | Named; native marked tilt equivalence missing. |
| Weakly closed primes (§11.4) | Named; general ramified integral ring/weak topology missing. |
| Valued-homogeneity primitive-point orbits (§11.5) | Named; primitive-point action missing. |

There are 18 headline families: one stated theorem and 17 explicit unstatability explanations. These missing carriers are constructions, not a few simple predicates; arbitrary rings would be stand-ins. No absent statable headline was identified. The auxiliary differential construction supports the one native headline and is not substituted for it.

Ran `lake env lean` on `packages/RelativeFarguesFontainePartII/Suggested.lean` from the content checkout: exit 0, only the expected `declaration uses 'sorry'` warning at line 40. There are no Tau Ceti imports to build. A scratch copy with `#check @TauCetiRoadmap.RelativeFarguesFontainePartII.exists_strict_laurentClosure_endomorphism` also elaborated. Its displayed type retains the prime, field, characteristic, normed-field, algebra, algebraic-closure and `hvaluation` binders. It agrees with §11.2; no declaration lost a standing hypothesis.

For padding, a scratch copy tried each of `simp`, `rfl`, and `infer_instance` as a closing tactic on the one admitted theorem; none closed it. Searching native carriers and the exact declaration name located no single library theorem supplying the result. The identity map is continuous and fixes k but is surjective, so it is not a witness. No padding deletion is requested for Suggested.lean. The theorem, namespace, layer heading and docstring meet the required form.

## Not verifiable

- No cited source text was inaccessible. FF17, KT16, Berger08, ST02 and the added SGA1 were read from legal cached extractions; no missing-reference request is needed.
- The source excerpts do not prove the seven additional obligations in R01. In particular, no uniform matrix-neighborhood argument, bounded global generator proof, arbitrary-radius descent extension or maximally complete automorphism-extension proof was supplied. This is an unresolved mathematical input with an ownership finding, not a claim that the desired theorems are false.
- The six named supplier gaps are future contracts. Their statements and ownership were checked; their eventual proofs were not available for certification.
- This review does not certify unspecified newer versions or unindexed pull-request heads. Ownership was checked against main and the heads supplied by this job's index. Lean elaboration verifies types, not the truth of the admitted theorem.

## Source issues

All entries below concern the versions read; no published correction was verified.

- **Misprint** in FF17 at Preface §1.4, printed p.9, line 465: the source says automorphisms act transitively on the maximal ideal in the maximally complete case; it should exclude zero, which every automorphism fixes; affects a stated result.
- **Error** in FF17 at Lemma 1.7.2 and Proposition 1.7.3, printed pp.81–82, lines 3388 and 3443: the source says raw period and ordinary Gauss norms agree at reciprocal radii; it should include the radius-dependent power: at q=2 and raw radius 1/4, π has raw norm 1/4 and ordinary norm 1/2; affects a stated result.

- **Error** in FF17 at §1.7.5, printed p.84, line 3536: the source says integral Witt coefficients describe B_I; it should be a localized completed description allowing π⁻¹ and enforcing appropriate finite norms and growth; affects a stated result.
- **Misprint** in FF17 at Proposition 1.10.5 proof, printed p.90, line 3788: the source says the sum lies in B_[0,1]; it should be B_[ρ,1], the ring in which the preceding convergence was established; affects the proof.
- **Error** in FF17 at Proposition 2.3.16 proof, printed p.120, line 4955: the source says valuation differences are bounded below by point distance; it should be equality of valuations truncated at the closeness threshold, which implies continuity; affects the proof.
- **Error** in FF17 at Corollary 3.5.3, printed p.146, line 5894: the source says all closed maximal ideals are classical points; it should be nonzero closed maximal ideals, with the zero maximal ideal treated separately when B_I is a field; affects a stated result.
- **Misprint** in FF17 at Remark 3.5.4, printed p.146, lines 5895–5897: the source says classical points and (π) classify all closed ideals of the integral boundary ring; it should say closed maximal ideals; the closed ideal (π²) is not maximal; affects a stated result.
- **Misprint** in FF17 at Theorem 6.4.1 proof, printed p.254, line 10301: the source says the left arrow is surjective; it should be the right evaluation arrow; affects the proof.
- **Error** in FF17 at Theorem 6.4.4, printed p.254, lines 10317–10326: the source says unshifted negative products generate the evaluation ideal and translated divisors always sum; it should be a Frobenius-shifted product with orbit separation, or pointwise supremum for overlapping tails; affects a stated result.
- **Error** in FF17 at Proposition 7.1.2, printed p.262, line 10589: the source says positive-eigenvector invariants are nonzero for every finite-dimensional representation; it should be restricted to nonzero representations for this assertion; affects a stated result.
- **Misprint** in FF17 at Proposition 7.3.1 proof, printed p.267, lines 10787–10791: the source says the Koszul maps are (−s,t) followed by (s,t); it should be followed by (t,s), so the composite is −ts+st=0; affects the proof.
- **Gap** in FF17 at Proposition 11.2.2, printed pp.369–370, lines 14613–14624: the source says the cited coadmissibility results yield finite-projective global sections; it should supply a finite global generating family before deriving projectivity and the asserted equivalence; affects the proof.
- **Gap** in FF17 at Lemma 11.2.10, printed p.372, lines 14715–14726: the source says ordinary additive surjectivity permits the conjugated local factorization argument; it should justify surjectivity and a quantitative bound for U+ZVZ⁻¹, the actual derivative; affects the proof.
- **Gap** in FF17 at Proposition 11.2.12 proof, printed pp.373–374, lines 14787–14795: the source says choosing Z sufficiently close makes local factorization applicable; it should control the factorization neighborhood's dependence on Z simultaneously with the approximation error; affects the proof.
- **Gap** in FF17 at §11.2.4 after Proposition 11.2.18, printed p.377, line 14916: the source says the value-group-endpoint theorem yields descent on every interval; it should supply arbitrary-radius completed base change and norm estimates or a controlled extension theorem, including irrational singletons; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7b1c00652d55a8865a8a4ac9e7dd7b4b5600dc01", "job": "REV-PKG-RelativeFarguesFontainePartII", "model": "gpt-6-astra", "worker": "chris-30"} -->
