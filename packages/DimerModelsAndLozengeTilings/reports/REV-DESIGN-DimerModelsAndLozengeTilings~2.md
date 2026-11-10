# Review of DimerModelsAndLozengeTilings (design, round 2)

**Verdict:** needs changes

Eleven findings: four P1, three P2, four P3. The earlier README repairs are mathematically sound; incomplete propagation into the plan, new counterexamples and drift at the supplied library pins prevent acceptance. This is a repairable design, not a re-planning of an existing roadmap. No design or source-manifest entry was changed by this review.

## Earlier findings and repairs

The previous report is `packages/DimerModelsAndLozengeTilings/reports/REV-DESIGN-DimerModelsAndLozengeTilings.md`; the repair report is `packages/DimerModelsAndLozengeTilings/reports/FIX-DESIGN-DimerModelsAndLozengeTilings~2.md`. None of its findings was marked not actionable.

| Earlier finding | Status and repaired passage | Independent verification |
|---|---|---|
| F01: cite the process tail | Repaired mathematically. `packages/DimerModelsAndLozengeTilings/design/README.md:827`: “For `I` infinite … and any enumeration `e : ℕ ≃ I`, `𝓣` equals `TauCeti.Probability.tailProcess`”. | Opened the definition and normal form at the supplied pin. Finite subsets are cofinal in enumeration prefixes, so the two intersections agree. The empty index set has a one-point product and trivial tail; it needs no enumeration. The newly added, unused array-tail file citation has since moved; see R04. |
| F02: exactness for boundary heights | Repaired. README:603: “`M`, `M'` are tilings of `R` whose height cochains are exact on `R`”. | The new ten-face region has 9 interior edges, 12 boundary edges, one boundary component and one tiling. Its increments around the missing white triangle are `0,0,1`, with circulation `−1`. The unit hexagon still gives the same six boundary values for both tilings. |
| F03: row-tiling target missing | Partly repaired: target 1.6 is repaired, but the accompanying signed-height correction was not propagated into the plan (R05). README:425 now has “### 1.6 Row tilings”; README:430 defines “`(σε)_x = ε_{x−1}`”. | Each white and black face has exactly one selected edge. Translating the step sequence by `e₁` changes its threshold from 0 to 1. The alternating sequence gives heights `−2,−1,−1,0,0,1,1` at `x=−3,…,3`. Plan target 1.6 has three API entries and three Checks. |
| F04: general diagonal conjugation | Repaired. README:1506 gives “`κ(x,y) = (−1)^{x+y} |ξ|^{−x} |1−ξ|^{y}`”. | Independently integrated both kernels at three slopes, on six ordered pairs each, including the diagonal and both directions of an off-axis pair. Largest entrywise discrepancy was below `4·10⁻⁸`. Pair and triple determinants agree to the displayed precision below. |

The pattern search included all occurrences of tails, boundary heights, row tilings, kernel conjugation, and plan/README Checks. It found the omitted height branch and the related kernel branches in R05 and the example inconsistencies below. Earlier numerical rows were used only for unchanged statements, and were not treated as a substitute for reviewing the new seeded targets. In particular, the earlier “trivial specification” and infinite-degree rows did not establish what they claimed: R01 and R06 give the separating instances.

## R01 (P1) — The identity kernel is not a specification on the full product

**Location:** `packages/DimerModelsAndLozengeTilings/design/README.md:922`, “The trivial specification `γ_Λ(·|ω) = δ_ω`”; reused at lines 948 and 958. Corresponding plan entries: `packages/DimerModelsAndLozengeTilings/design/plan.json:1083` and :1123.

**Claim:** This is a specification on `{0,1}^ℤ`, and every probability measure is Gibbs for it.

**Witness:** Take `Λ={0}`, `C={ω:ω(0)=1}`, and configurations differing only at 0. Their exteriors agree, but `γ_Λ(C|ω)` is respectively 0 and 1. Thus it is not outside-measurable.

**Exact repair:** Keep this as a negative-control Check for the measurability clause. For the positive identity-specification example, take the closed invariant subshift `X={constant 0, constant 1}`. Update the 4.6 Check and Examples, and both plan tests, to that `X`. Do not weaken the definition of specification.

**Repair tested:** On this two-point `X`, any coordinate outside a finite `Λ` determines the entire configuration, so the outside σ-algebra is the full σ-algebra. The identity kernels satisfy all three axioms; all probability measures on `X` are Gibbs. On the original full product with Bernoulli(1/2) law, the conditional expectation of `1_C` given the exterior is `1/2`, whereas the proposed kernel returns 0 or 1, also refuting the claimed example through the section's own API.

## R02 (P1) — Global completion sets do not depend on a finite neighbourhood

**Location:** `packages/DimerModelsAndLozengeTilings/design/README.md:985`, “depends only on `ω` on `F` and on the edges sharing a vertex with `F`”; `packages/DimerModelsAndLozengeTilings/design/plan.json:1174`, API `completion_finite`.

**Claim:** The subset `Ω_F(ω)` of global perfect matchings is determined by those local coordinates.

**Witness:** On the nearest-neighbour graph on `ℤ`, take `F=∅` and the even and odd perfect matchings. Both restrictions to the stated neighbourhood are empty, but their completion sets are the two different singletons.

**Exact repair:** State locality for the set of restrictions `{ω'|F : ω'∈Ω_F(ω)}`, determined by `ω` on the edges outside `F` incident to endpoints of `F`. Global completions are obtained by gluing these restrictions to the fixed full exterior `ω|Fᶜ`. Keep finiteness and containment of `ω` for the global set. Update the plan API and use this restricted-set statement to establish quasilocality in 5.2.

**Repair tested:** At `F=∅`, both sets of restrictions equal `{∅}`; gluing gives the two different global singletons as required. For a full isolated hexagon, the restriction set has the two alternating matchings, independent of configurations on other components.

## R03 (P2) — Small tori require labelled lozenges and individual edge summands

**Location:** `packages/DimerModelsAndLozengeTilings/design/README.md:1265`, “Each row has three nonzero entries”; :1324, “distinct lozenges `ℓ_i = (W(u_i), B(v_i))`”. Also conventions :159 and plan targets 8.1 and 8.4 (`packages/DimerModelsAndLozengeTilings/design/plan.json:1666`, :1773).

**Claim:** The matrix entries and endpoint pairs specify the correlation formula for every `n₁,n₂≥1`.

**Witness:** On the unit-weight `1×1` torus all three lozenges have the same endpoint pair. Matrix entries are `3,1,1,−1`; using them in 8.4 gives `(3+1+1+1)/6=1`, not the type-3 probability `1/3`.

**Exact repair:** Retain all positive torus sizes. Define torus lozenges as translation orbits of typed plane edges, retaining the direction label. Define their signed weights separately, and define each matrix entry as the sum of signed weights with those endpoints. Replace “three nonzero entries” by “three edge contributions, added when their columns coincide”. In 8.4 multiply the individual signed edge weights, not aggregate matrix entries. Define `c_ab=0` whenever selected distinct lozenges repeat either endpoint; otherwise use the signed complementary minor. State the inverse-minor equality with this convention. Propagate the labels and convention to the plan and the third Check of 8.4.

**Repair tested:** For the single type-3 orbit, each signed edge weight is 1, so the repaired numerator is `1+1+1−1=2` and the probability is `2/6=1/3`. Two different type orbits on that torus repeat both endpoints and give `c_ab=0`, hence probability 0. At weights `(1,1,2)`, the sole entry of `K_11` is 0, so even non-vanishing of the three contributions does not imply a nonzero matrix entry. For `n₁,n₂≥2` the three neighbours are distinct and the repaired formula recovers the intended one. No restriction to larger tori is needed.

## R04 (P1) — The supplier contract cites a theorem absent at the supplied pin

**Location:** `packages/DimerModelsAndLozengeTilings/design/README.md:253`, “`TauCeti.MeasureTheory.ergodicSMul_of_forall_smul_invariant`”; obsolete pin claims at :189 and :245; stale array-tail file at :266.

**Claim:** The named theorem exists in the pinned `CountableAction.lean` and supplies the exact-invariant-event criterion.

**Witness:** `TauCeti/MeasureTheory/Group/CountableAction.lean:68` declares `ergodicSMul_iff_forall_smul_invariant`, requiring `[SMulInvariantMeasure G X μ]`. The cited `…_of_…` name occurs nowhere in either supplied pinned library.

**Exact repair:** Cite `TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant` and consume its reverse implication with the invariant-measure hypothesis. Correct the pin descriptions to the actual `lake-manifest.json` revisions: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, or remove the hard-coded hashes. The unused `arrayTail` citation should point to `TauCeti/Probability/Process/Array/Tail/Basic.lean:43`, or be omitted. Audit the corresponding contract names, without changing any library or manifest pin.

**Repair tested:** The reverse implication gives exactly the criterion used by 4.3 for its invariant product measure. Its conclusion is null-or-conull; for a probability measure this is probability 0 or 1. `exists_smul_invariant_ae_eq` remains present at line 53. The tail definitions added by F01 remain present at their cited lines 42, 47 and 64. This is current-pin drift, not a rejection of the mathematical repair.

## R05 (P1) — The plan drops essential branches of height and kernel formulas

**Location:** `packages/DimerModelsAndLozengeTilings/design/plan.json:2079`, API `kernel_values`, “`K_ξ((x,y);(x+m,y))=|ξ|^m sin(πsm)/(πm)`”. The same pattern occurs in 9.1's API (:1882), 9.7's row determinant (:2104) and 2.5's unsigned row-height Check (:504).

**Claim:** The unqualified row formulas hold at every displacement, and the unsigned height sum holds for every integer `x`.

**Witness:** At `s=t=1/3`, the kernel diagonal is `1/3`, but the quotient at `m=0` is totalized `0/0=0`. For `ε≡1`, the height at `x=−1` is `−1`, while the displayed empty sum is 0.

**Exact repair:** Add `m≠0` to the plan's row formulas in 9.1 and 9.6, retaining their separate diagonal values. In 9.7 use the piecewise kernel `S_s(0)=s`, `S_s(m)=sin(πsm)/(πm)` for `m≠0`; merely requiring distinct row positions does not remove the matrix diagonal. In 2.5 use the signed sum from README:569–571: the positive sum for `x≥0` and `−Σ_{x≤i<0} ε_i` for `x<0`. The README already has these conditions at :1387, :1487 and :1513–1514.

**Repair tested:** At `m=0`, both kernel diagonal branches give `1/3`, and the one-position inclusion probability is `det[1/3]=1/3`, not `det[0]=0`. At `m=1` the beta contour and quotient both give `√3/(2π)`. At `x=−1`, the signed height sum gives `−ε_−1=−1` for the all-ones sequence. This completes propagation of the row-height improvement associated with F03.

## R06 (P3) — The infinite-degree Check is not a sequence of perfect matchings

**Location:** `packages/DimerModelsAndLozengeTilings/design/README.md:992`, “with `c` joined to `x₁, x₂, …`, the configurations `{c x_k}` converge to `∅`”; `packages/DimerModelsAndLozengeTilings/design/plan.json:1186`.

**Claim:** This proves that the perfect-matching configuration space need not be closed without local finiteness.

**Witness:** In the displayed star, `{c x_k}` leaves every `x_j`, `j≠k`, unmatched. No term is a perfect matching; the star's perfect-matching space is empty and therefore closed.

**Exact repair:** Use vertices `c,d,x_n,y_n` and edges `c x_n`, `d y_n`, `x_n y_n`, for `n≥1`. Let `M_k={c x_k,d y_k} ∪ {x_n y_n:n≠k}`. Explicitly present this as a Check of the graph-topology statement without a group action, as the finite-cycle Check already does.

**Repair tested:** Every vertex has matching degree 1 in each `M_k`. Coordinatewise the limit is `{x_n y_n:n≥1}`, where `c,d` have degree 0 and all other vertices degree 1. This is a genuine nonclosed perfect-matching space. Update both files.

## R07 (P2) — Local convergence excludes the plane case it subsequently uses

**Location:** `packages/DimerModelsAndLozengeTilings/design/README.md:1556`, “For finite regions `R_N`”; :1572 and :1581 use the set of all faces. `packages/DimerModelsAndLozengeTilings/design/plan.json:2153` has the same restriction, and :2192 omits the escape hypothesis of the third Check.

**Claim:** The definition applies both to finite regions and to the constant sequence of plane-tiling measures used in 10.2(b).

**Witness:** With `R_N` all faces and `μ_N=δ_M₃`, the advertised limit is `δ_M₃`, but no `R_N` satisfies the defining finiteness hypothesis. For the plan's wrong-sign Check, `v_N=0` yields the hexagon law, not the empty configuration.

**Exact repair:** Define local convergence for arbitrary regions and probability measures on their tilings embedded in `TriEdge → Bool`. Retain finiteness in the uniform-measure assertion 10.2(d), where it is needed. In the plan's wrong-sign Check explicitly include `R_N=R₆+v_N` and `|v_N|→∞`, as the README already does.

**Repair tested:** The constant plane law now satisfies the definition and converges to itself. The constant translated hexagon centred by `−v_N` gives its two-point law. Centring instead by `+v_N` gives the empty-configuration limit when `|v_N|→∞`; for `v_N=0` it gives the hexagon law, correctly excluded from that Check.

## R08 (P3) — A corner Check applies the slope map to tilings instead of measures

**Location:** `packages/DimerModelsAndLozengeTilings/design/README.md:1139`, “`Φ₂ ∩ slope⁻¹(1,0) = {M₁}`”.

**Claim:** This is a set equality for the slope defined in 6.1.

**Witness:** `Φ₂` is a set of plane tilings (README:1116); `slope` has domain invariant probability measures (README:1078). Its preimage cannot be intersected with `Φ₂`, and `M₁` is not a probability measure.

**Exact repair:** Say that the invariant probability measures concentrated on `Φ₂` with slope `(1,0)` form the singleton `{δ_M₁}`. Keep the equivalent statement about the unique shift-invariant sequence law of density 1.

**Repair tested:** `δ_M₁` has density 1 and slope `(1,0)`; `(δ_M₁+δ_M₃)/2` has density `1/2` and slope `(1/2,0)`, so it is excluded. The corrected Check follows the carrier convention of 6.2.

## R09 (P3) — Aggarwal's unit hexagon is a translate of the defined one

**Location:** `packages/DimerModelsAndLozengeTilings/design/README.md:1619`, “For `A = B = C = 1` it is the unit hexagon `R₆`”; plan test `unit_hexagon_case` at `packages/DimerModelsAndLozengeTilings/design/plan.json:2263`.

**Claim:** The hexagon with the source's coordinates equals the roadmap's hexagon centred at the origin.

**Witness:** aggarwal2023 line 370 gives boundary vertices `(0,0),(1,0),(0,1),(1,2),(2,2),(2,1)`. Its centre is `(1,1)`. README:380 defines `R₆` as the six faces at `(0,0)`.

**Exact repair:** Write `R₆+(1,1)`, or say that translating Aggarwal's hexagon by `−(1,1)` gives `R₆`, with two tilings. Make the same correction in the plan.

**Repair tested:** Subtracting `(1,1)` from the six source vertices gives exactly the six neighbours of 0 listed in 2.7. Translation preserves the count 2 and carries the two tilings to `T_a,T_b`.

## R10 (P3) — A downstream paragraph retains process-specific wording

**Location:** `packages/DimerModelsAndLozengeTilings/design/README.md:1638`, “The board's constructive field theory design”.

**Claim:** This describes a downstream consumer in the timeless roadmap.

**Witness:** The phrase identifies a work item by board state, not a named mathematical roadmap and section. It is process residue under the required README rules.

**Exact repair:** Delete that sentence. The preceding statement that lattice spin systems with finite single-site spaces consume Layer 4 already states the mathematical interface. No dependency, target or result needs changing.

**Repair tested:** The remaining paragraph still identifies precisely the finite-alphabet tail, Bernoulli, specification, face and closedness results supplied to spin systems.

## R11 (P2) — The plan omits conditions on Boltzmann measures and their masses

**Location:** `packages/DimerModelsAndLozengeTilings/design/plan.json:711`, “and the Boltzmann measure on `𝔈(R)`”; :1244, “the only Gibbs measure gives each matching mass 1/2”. The README retains the needed conditions at :712 and :1021.

**Claim:** Every finite positively weighted region has a Boltzmann probability measure, and an arbitrarily weighted hexagon cycle gives equal matching probabilities.

**Witness:** For `R={W(0)}`, `𝔈(R)=∅` and `Z=0`, so no probability measure exists. On `C₆`, alternate edge weights 2 and 1 give matching weights 8 and 1, hence masses `8/9,1/9`, not `1/2,1/2`.

**Exact repair:** Qualify the plan's Boltzmann-measure construction by positive partition function (equivalently tileability for finite regions with positive weights). Keep the matrix and partition function defined for every finite region. Restore “with unit weights” in the 5.2 Check, or state normalized products for general weights.

**Repair tested:** The one-face region is excluded only from the probability construction; its matrix and `Z=0` remain defined. The empty region has one empty tiling and `Z=1`, hence a point-mass Boltzmann law. The weighted cycle gives `8/9,1/9`; unit weights give `1/2,1/2`.

## Verified sound

**Coverage and principles.** Read all 52 targets in the ten layers, the conventions, ownership, supplier contracts, Examples, dependencies and all 158 plan Checks. All 19 plan entries classified as definitions have API entries and at least three Checks. The design develops reusable mathematics: arbitrary face regions; abstract proper countable-group actions; arbitrary locally finite countable graphs for the dimer specification; positive edge weights; all positive torus sizes; every slope in the closed triangle. The good-size subsequence in 9.2 is a proof device for existence at every liquid weight, not a restriction of the resulting measures to special weights or slopes. The continuum theory is expressly assigned to a Part II. No existing dimer roadmap was found in the supplied main/open-head searches. No computational algorithm, copied source passage, sorry'd data or `set_option` was found in the design. R10 is the process-residue exception.

The four prior repairs preserve the supply direction. The genuine Gibbs face theorem, finite-region determinant formula, corner/edge classification, and liquid-kernel existence/mixing arguments survive the counterexamples to their auxiliary examples and interfaces. The statement of uniqueness in 9.7 concerns the specified determinantal law; it does not assume the separately assigned uniqueness of all ergodic Gibbs measures of a given slope.

**Seeded source sample: all sixteen targets inspected.** Source passages were read from the legal cached texts named by the manifest. The author explicitly uses preprint numbering; extraction line numbers are the exact locators, not purported published page numbers. Aggarwal's preprint pp. 8–12, Sheffield's pp. 8–9 and 35–36, Kenyon's preprint pp. 24 and 28–32, and the relevant printed page labels visible in Gorin were checked. The extraction's `=== page ===` labels for Gorin are not reliable printed pagination: for example Lemma 4.7 is on displayed printed p. 45, not the earlier report's claimed printed p. 74. No new source was needed and all ten cited works already have manifest entries.

| Sampled target | Text opened and comparison | Outcome |
|---|---|---|
| 1.3 Regions | aggarwal2023 lines 338–341, preprint p. 8: induced vertex graph, face union and boundary. | The roadmap explicitly adapts to arbitrary face sets and qualifies the comparison by requiring each vertex to lie in a face. The incidence identity is proved from its definition, not attributed verbatim to the source. |
| 1.4 Tilings | aggarwal2023 lines 342–364 and 380–383, pp. 8–9; gorin2021 lines 690–702. | Perfect matchings/lozenges agree. The roadmap's free tilings are the local extension-across-boundary formulation; it does not claim every arbitrary region is tileable. |
| 2.5 Plane heights | aggarwal2023 lines 384–401, p. 9; gorin2021 lines 447–458. | Source simply-connected hypothesis supplied by 2.2 for the plane. The `{0,1}` increments and `h_G=x+y−3H` conversion agree. |
| 2.7 Boundary heights | aggarwal2023 lines 403–407, p. 9; gorin2021 lines 511–526. | Aggarwal conditions boundary independence on a tiling with a height. The repaired exactness hypothesis and negative example are correct. Gorin's preliminary unconditional assertion needs the caveat recorded under Source issues. |
| 2.8 Lattice/flips | gorin2021 lines 756–782 and footnote at 765–769, displayed pp. 24–25; kenyon2009 lines 537–550; cohn-kenyon-propp2001 §1.4, lines 341–412, pp. 8–10. | Lozenge flip connectivity and extrema supplied by Gorin; CKP concerns domino heights and is background for the lattice principle. The roadmap gives its own lozenge local-rule proof and extremal formulas. |
| 3.3 Cofactor identity | gorin2021 proof of Theorem 3.5, lines 1339–1349; kenyon1997 lines 362–373; kenyon2009 lines 564–565. | Complementary/inverse minors support the formula. Arbitrary ordering signs are checked below; actual generic compound identities are supplied by the resolved main roadmap. |
| 4.4 Weak topology | gorin2021 Definition 13.1/Lemma 13.2, lines 4509–4519, displayed p. 109; aggarwal2023 lines 412–418; pinned portmanteau declarations below. | Gorin proves correlation determination by inclusion–exclusion. Weak convergence and compactness are correctly taken from Mathlib, not claimed as the content of Aggarwal's paragraph. |
| 4.5 Specifications | sheffield2005 §1.1.2, lines 303–342, displayed pp. 8–9. | Source expressly requires exterior measurability at 318–319 and invariance `μγ=μ` at 339–342. The definition agrees; the identity-kernel example does not (R01). |
| 6.2 Corners | kenyon2009 Exercise 13, lines 891–892, p. 30; gorin2021 lines 4638–4644. | Exercise 13 explicitly singles out corners. Gorin's cited lines define extreme slopes; they do not state the corner classification. The roadmap provides the elementary invariant-marginal argument, independently checked below. |
| 7.1 Torus heights | kos2006 lines 187–192; kenyon2009 Lemma 4, lines 682–690, p. 24, and lines 845–857; gorin2021 §3.3. | Source count/height identity agrees under the stated coordinate conversion. Rectangular periods and size-one cases are verified directly below. |
| 8.5 Fourier | gorin2021 Claims 4.1–4.2, lines 1545–1600, and equation (4.8), line 1895; kos2006 lines 668–679; kenyon2009 lines 729–763. | Characters, twist signs and inverse denominator agree. The inverse is conditioned on nonzero determinant. Small-torus edge aggregation still needs R03. |
| 9.3 Liquid determinantal law | gorin2021 Theorem 4.11, lines 1853–1886, Corollary 13.14, lines 4695–4723; kos2006 Theorem 4.3 and proof, lines 691–727; kenyon2009 lines 958–975. | Source proof supplies a subsequence avoiding zeros; the design makes this explicit in 9.2 and proves uniqueness from all correlations. No appeal to the excluded full slope-uniqueness theorem is needed. |
| 9.4 Mixing | kenyon1997 lines 85–93 (uniform model); kenyon2009 §6.2, lines 1011–1036; kos2006 lines 732–735. | Uniform mixing and general-weight covariance decay support the route. The extension to all measurable events uses cylinder approximation; no pointwise ergodic theorem is imported. |
| 10.1 Local convergence | aggarwal2023 lines 568–580, Theorem 1.5, preprint p. 12; gorin2021 lines 4530–4541. | Source translates by `−v_N`. The finite-only definition conflicts with its plane example (R07); cylinder convergence itself is sound. |
| 10.3 Lattice inventory | aggarwal2023 Theorem 1.5, lines 572–580, and Example 1.1, lines 370–375. | Continuum domain regularity, admissible boundary data, entropy maximizer, interior liquid gradient and scaling convergence are explicitly outside this inventory and assigned to Part II. The unit-hexagon translation is R09. |

No author-flagged unverified text remains beyond the two settled uncertified works below. The added 1.6 citations were also opened (Exercise 13 and the definition of extreme slopes). The repaired 9.7 was compared with okounkov-reshetikhin2003 Definition 4 (lines 965–968), Theorem 2 (993–1006), equation (36) (1076–1083), and aggarwal2023 Definitions 1.2–1.3/equation (1.2), lines 463–507. The sources give the kernel and its limit law; the exact diagonal change of coordinates is the roadmap's derived identity, independently recomputed.

**Computed adversarial table.** Exact small counts use face incidence and enumeration of typed-edge selections, not the target determinant formulas. Numerical kernel entries use the inner circle integral evaluated by residues and midpoint integration in the other variable; beta-kernel entries use the two declared polygonal paths. These are independent numerical checks, not claims of formal proof. Every row gives values on both sides or membership values for a definition. The table covers the new sample, headlines, changed targets and all mathematical findings; unchanged computed rows from the prior report also remain supporting evidence.

| Statement | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| 1.1–1.2 conventions | `W(0),B(0)`; rotation of `e₁,e₂,e₃` | Shared-edge set `{(0,3)}` has size 1; white neighbours are `B(0),B(−e₂),B(e₁)`, size 3. Rotation gives `(e₂,−e₃,−e₁)` and its cube is identity. | Sound. |
| 1.3 incidence/boundary | One face; unit hexagon; pinched ring | `3=2·0+3`; `18=2·6+6`; `30=2·9+12`. Hexagon has six boundary vertices and one interior vertex. | Sound. |
| 1.4–1.5 tilings/matchings | Empty region; one white face; hexagon | Tiling counts/perfect-matching counts `1/1`, `0/0`, `2/2`; one-face free-tiling count 3. `M₁∪M₃` selects 2 edges of `W(0)`, not 1. | Sound. |
| 1.6 row tilings/shift | Step sequence; constant sequences; wrong column reading | Correct white/black selected-edge counts `1/1`; wrong reading at `B(x,0)` gives 0. `τ_e₁` changes threshold 0 to 1; `τ_e₂` leaves it 0. Constants give `M₁,M₃`. | F03 repaired. |
| 2.5 height correspondence | `M₁,M₂,M₃`; `H=x+y`; alternating rows | Heights `x,y,0`; diagonal increments respectively `1,1,0`. Wrong `x+y` has increment 2. Alternating heights at `x=−3,…,3`: `−2,−1,−1,0,0,1,1`, equal to floor `x/2`. | README sound; negative-index Check gives `−1` where the uncorrected plan gives 0 (R05). |
| 2.5 Lipschitz and symmetry | Displacements `(1,1),(−1,0),(2,1),(1,−1)`; rotated `M₁` | Upper bounds `1,0,2,1`; extremal affine heights attain them. `H_M₁(ρ⁻¹w)+w₁=(w₂−w₁)+w₁=w₂=H_M₂(w)`. | Sound. |
| 2.7 exactness and boundary | Hexagon; strip; new pinched ring | Both hexagon boundaries `(0,0,0,−1,−1,−1)`. Strip top boundary `0` versus `1`, with 2 components. Pinched ring: 1 boundary component, 1 tiling, circulation `0+0−1=−1≠0`. | F02 repaired. |
| 2.8 extrema/flip | Hexagon with `H(1,0)=0`; two no-type-2 torus tilings | `H_max(0)=0`, `H_min(0)=−1`; one lowering flip switches the two hexagon tilings, preserving counts `(1,1,1)`. Torus pair has 0 available flips and 2 distinct tilings. | Sound under finite simply-connected hypothesis. |
| 2.9 Thurston criterion | Single white triangle; `R₆'`; hexagon | Triangle boundary circulation `−1`, no boundary height. `R₆'`: difference `1>0=ρ((2,1),(1,1))`, tilings 0. Hexagon: compatible boundary, tilings 2. | Sound. |
| 3.1/5.2 Boltzmann conditions | One face; empty region; cycle with alternating weights 2 and 1 | One face: `Z=0`, no probability law on its empty tiling set. Empty region: `Z=1`, unique point mass. Cycle: products `8,1`, probabilities `8/9,1/9`, versus unit-weight `1/2,1/2`. | R11. |
| 3.2 determinant/partition | Hexagon unit/type weights; balanced untileable region; ring | `det=Z=2`; weighted `det=Z=2abc`; untileable `det=Z=0`; nonsimply-connected ring `det=0`, `Z=2`. | Sound; topology necessary. |
| 3.3 generalized cofactor | Empty matrix, `k=0`; `A=[[1,2],[3,4]]`, prescribed `(1→2,2→1)`; `k=1`, `(1,2)` | `1=1·1`; full reversed minor: `−1=(−2)(1/2)`; one cofactor: `−3=(−2)(3/2)`. Over `𝔽₂`, signs collapse to 1 on both sides. | Sound, including empty indices and sign. |
| 3.4 local correlations | Hexagon: one edge, two compatible edges, two sharing a face | `1/2=1·(1/2)`; `1/2=det[[1/2,1/2],[−1/2,1/2]]`; incompatible `0=det` with repeated row. | Sound. |
| 4.1 tail identification | Infinite ones; coordinate 0; empty index | Infinite-ones membership in both tails `true/true`; coordinate-0 membership `false/false`. Empty product has 1 configuration and both tail σ-algebras are bottom (where defined); no enumeration of the empty index. | F01 repaired. |
| 4.2–4.3 properness/product | Trivial action on one site; Bernoulli product; mixture of two Bernoulli densities | Trivial action: invariant-event mass `1/2`, tail-event masses only `0,1`. Product: tail-event masses `0,1`; density-1/3 event in the mixture has mass `1/2`. | Correct hypotheses; no independence shortcut. |
| 4.4 weak topology | Bernoulli(1/2) versus mixture of constants; indicators `[n,∞)` | One-site masses `1/2=1/2`; two-site masses `1/4≠1/2`. At a fixed finite window, indicators eventually all 0, so cylinder masses converge to those of `δ_0`. | Sound. |
| 4.5 specification | Identity kernel on full product; independent resampling; identity on two constant configurations | Full-product exterior fibre has kernel values `0,1`, violating constancy; conditional expectation is `1/2`. Independent kernel gives `1/2,1/2` on that fibre. On constants the exterior distinguishes both points. | R01. |
| 4.6/5.3 face/ergodicity | Independent specification; graph `ℤ`, action `2ℤ`; non-tail density | Independent Gibbs set `{Bern(1/2)^ℤ}`. Even/odd mixture has invariant event mass `1/2`, endpoints masses `1,0`. Density `2·1_{ω(0)=1}` changes site-0 mass from `1/2` to `1`; resampling restores `1/2`, so it is not Gibbs. | Main theorem sound; repair identity example. |
| 5.1 completion locality | Even/odd matchings and `F=∅` | Local restrictions equal `∅`; global completion sets `{even}≠{odd}`; repaired restriction sets both `{∅}`. | R02. |
| 5.1 infinite-degree Check | Original star; replacement double-hub graph | Original selected-edge vertex degrees: `deg(c)=deg(x_k)=1`, other leaves 0. Replacement `M_k`: all degrees 1; limit degrees at `c,d` are 0, elsewhere 1. | R06. |
| 5.2–5.4 dimer weights | Hexagon and nearest-neighbour `ℤ` | Hexagon weights `abc,abc`, normalized probabilities `1/2,1/2`; gauge multiplies both by `∏g(v)`. On `ℤ` completion cardinalities are `1,1`, so all laws on the two matchings are Gibbs. | Sound after R02's locality wording. |
| 6.2 corners | Corner masses; mixture; noninvariant step tiling | Slopes `(1,0),(0,1),(0,0)`; mixture `(1/2,1/2)`; step point mass has origin type-1 marginal 1 but a negative-column marginal 0. | Sound; invariance separates corner law from step law. |
| 6.3 edge classification | Bernoulli rows versus randomized blocks, `s=1/2`; corner | Adjacent ones probability `s²=1/4` versus `(s+s²)/2=3/8`; both single-site probabilities `1/2`. At `s=1`, both laws collapse to `δ_M₁`. | Main theorem sound; R08 corrects the Check's carrier. |
| 6.4 slope-fibre extremality | Three frozen measures with coefficients `a_k` | Slope `(a₁,a₂)=(1/3,1/3)` forces all coefficients `1/3`; invariant event `{M₁}` has mass `1/3`, neither 0 nor 1. | Sound; invalidates source fibre argument. |
| 7.1 height counts/floor | `1×1`; `2×2`, height `(1,1)`; height `(2,1)` | 3 tilings with heights `(1,0),(0,1),(0,0)`; floor `(x+y)/2` gives counts `(2,2,0)`; forbidden height requires `2·2+2·1=6>4`. | Sound. |
| 7.3 fixed-slope limits | Boundary `(0,0)`; half-density rows | First is constantly `δ_M₃`. Two ones on two fixed sites under uniform balanced period `2m`: `(m−1)/(2(2m−1))→1/4`; one-site mass always `1/2`. | Sound; full mixing/ergodicity of arbitrary fixed-slope limits is not assumed. |
| 8.1/8.4 small-torus entries | Unit-weight `1×1`; weights `(1,1,2)` | One column, not three. Determinants `3,1,1,−1`; aggregate-entry probability 1 versus typed-edge probability `1/3`. At `(1,1,2)`, `K_11=0`. Repeated endpoint pair corrected probability `0=0`. | R03. |
| 8.2–8.3 signs/partition | All 81 tilings on sizes `1×1,1×2,2×1,2×2,2×3,3×3`, all four twists | 324 direct permutation/seam signs agree with parity formula. Determinants respectively `(3,1,1,−1)`, `(3,5,−1,1)`, `(3,−1,5,1)`, `(−3,5,5,5)`, `(9,−7,5,13)`, `(0,28,28,−28)`; half signed sums and enumerated counts both `3,5,5,9,17,42`. | Sound when entries aggregate labelled contributions. |
| 8.5 Fourier diagonalisation | `2×2` untwisted/twisted; `3×3` untwisted | Eigenvalues `3,1,1,−1`, product `−3`; twisted product `(2+i)(2−i)i(−i)=5`. At `e^{2πi/3}`, eigenvalue `1+z+z⁻¹=0`, determinant 0, but `Z=42`. | Sound; nonzero inverse hypothesis essential. |
| 9.1–9.2 liquid/good sizes | Uniform weights; `(1,1,2)`; `θ=π/2` | Uniform zeros `±(2π/3,2π/3)`. Degenerate weight zero `(π,π)` has Jacobian determinant 0. Even `n` at `π/2` has distance 0; odd `n` has distance `π/(2n)>n^(−3/2)`. | Sound corrected `n,n+1` choice, not source's `n,n+2`. |
| 9.3 liquid measure | Uniform type-1 vertical pair | Kernel matrix entries `1/3,−0.0576688842,1/3,1/3`; determinant `0.1303340725`; beta formula `0.1303340735`. Shared-face determinant and event probability both 0. | Sound. |
| 9.4 mixing | Uniform row pair at separation `m`; frozen mixture | Covariance `−sin²(πm/3)/(πm)²→0`; at `m=1`, `−3/(4π²)`, at `m=3`, 0. Frozen mixture invariant event gives `1/3` versus product `1/9`. | Sound; decay supplies arbitrary nonzero subgroup ergodicity. |
| 9.5 all slopes | `(1/3,1/3)`, `(1/2,1/4)`, `(1/2,0)` | Weights `(√3/2,√3/2,√3/2)`, `(1,√2/2,√2/2)` with `1<√2`, and `(1,0,1)` nonpositive in second coordinate. Last case is supplied by rows, not the liquid kernel. | Sound. |
| 9.1/9.6/9.7 diagonal/row | `s=t=1/3`, `m=0,1`, one-position determinant | Diagonal and singleton inclusion probability `1/3` versus totalized quotient and determinant `[0]` equal to 0 at `m=0`; at `m=1`, both `√3/(2π)`. Reverse contour gives diagonal `−2/3`, not `1/3`. | R05; README formula already qualified. |
| 9.6–9.7 conjugation | Slopes `(1/3,1/3)`, `(0.3,0.45)`, `(1/2,1/4)` | Moduli `(1,1)`, `(1.3968022467,1.1441228056)`, `(1,√2)`. Middle-slope factors `−0.8740320489`, `1.9510565163`, `1.2208499296`; paired integral values `(0.0521813499,0.0521813497)`, `(0.1513653482,0.1513653086)`, `(−0.1411758989,−0.1411759059)`. | F04 repaired. |
| 9.7 determinants/law uniqueness | Vertical pair and triple `(0,0),(1,2),(−1,1)` at the three slopes | Pair determinants respectively `0.1303340725/0.1303340735`, `0.0750745318/0.0750745311`, `0.2954225275/0.2954225321`; triples `0.0480808805/0.0480808813`, `0.0342139658/0.0342139662`, `0.1177430185/0.1177430232`. | Sound; conjugation cancels in determinants. |
| 9.7 reconstruction hypothesis | Two heights equal to `1_{x>0}` below row 1, then `1` versus `y` | Both give the same nonempty `X={(0,y):y≤0}`; vertical increment above row 1 is 0 versus 1. No two empty consecutive rows would exclude both ambiguous tails. Row sine pair at `s=1/2`: `1/4−1/π²=0.1486788`. | Sound corrected source hypothesis. |
| 10.1 local limits | Constant plane law; moving hexagon; wrong sign | Correct centring gives probabilities `1/2,1/2` on `T_a,T_b`; wrong centring with escaping centres gives all occupied-edge probabilities 0. Constant plane law has type-3 edge probabilities 1. | R07 on scope and missing plan hypothesis. |
| 10.2 uniformity/exhaustion | Forced row regions; corner height `min(0,x,y)` | Forced completion cardinality 1 gives point-mass Gibbs limit. Corner height has `H(e_k)=0`, `H(−e_k)=−1`; completion cardinality 2, point mass assigns `(1,0)` instead of `(1/2,1/2)`. | Sound: uniformity needed, invariance not promised. |
| 10.3 hexagon inventory | `A=B=C=1` in source coordinates | Source centre `(1,1)` versus roadmap centre `(0,0)`; translated face/vertex sets equal, both tiling counts 2. | R09. |

**Library and object audit at the actual pins.** `lake-manifest.json` and both checked-out library HEADs agree on the revisions in R04. The following declarations were opened at those pins, including their hypotheses, rather than relying on the previous report's hashes. Paths below are relative to their library repository roots.

| Object | Pinned declarations opened | What the native object supplies / limits |
|---|---|---|
| Graphs and matchings | `Mathlib/Combinatorics/SimpleGraph/Maps.lean:225` (`SimpleGraph.induce`); `Finite.lean:382` (`LocallyFinite`); `Matching.lean:67`, :236, :254 (`IsMatching`, `IsPerfectMatching`, `isPerfectMatching_iff`) | Induced graph on a subtype; finite neighbour types; perfect matching is matching AND spanning. It already includes every vertex, which exposes R06. No dimer/lozenge geometry is present. |
| Products | `Mathlib/Topology/Constructions.lean:65` (`Pi.topologicalSpace`); `Topology/Compactness/Compact.lean:1175`, :1178 (`Pi.compactSpace`, `Function.compactSpace`); `MeasureTheory/MeasurableSpace/Constructions.lean:580` (`MeasurableSpace.pi`); `MeasureTheory/Constructions/BorelSpace/Basic.lean:645` (`Pi.borelSpace`) | Product σ-algebra is the supremum of coordinate comaps. Borel equality needs countable index and second-countable Borel factors; finite discrete alphabets meet these conditions with their discrete measurable structure. |
| Product probability / weak topology | `Mathlib/Probability/ProductMeasure.lean:354` (`Measure.infinitePi`); `MeasureTheory/Measure/ProbabilityMeasure.lean:103`; `Prokhorov.lean:176`; `Portmanteau.lean:362`, :829 | Product has probability-factor condition; probability-measure carrier bundles mass 1. Compactness and cylinder convergence use compact Hausdorff Borel / second-countable spaces and, for the criterion, a countably generated filter and a neighbourhood π-system. |
| Tail approximation / zero-one | `Mathlib/MeasureTheory/Measure/MeasuredSets.lean:86`; `Probability/Independence/ZeroOne.lean:229`, :290; `TauCeti/Probability/Process/Tail/Basic.lean:42`, :47, :64 | Approximation requires a generating ring, finite measure and countable almost-everywhere cover (the whole-space cylinder suffices). Zero-one requires independent sub-σ-algebras. Native process tail is a limsup; it does not package the arbitrary proper action used here. |
| Invariance and extremality | `Mathlib/Dynamics/Ergodic/Action/Basic.lean:31`, :43; `MeasureTheory/Group/Defs.lean:59`; `Analysis/Convex/Extreme.lean:63`, :70; `TauCeti/MeasureTheory/Group/ErgodicExtreme.lean:75`, :86, :239; `MeasureTheory/Group/CountableAction.lean:53`, :68; `MeasureTheory/Measure/Face.lean:40` | Native ergodicity includes invariant measure and tests almost invariant measurable events. Tau Ceti handles countable groups and `ℝ≥0∞` convexity of measures. It supplies the extremality theorem, not the specification-specific face argument. Missing old name is R04. |
| Conditional expectation | `Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean:101` (`condExp`) | Real definition handles sub-σ-algebra inclusion, σ-finiteness and integrability; probability indicators satisfy the meaningful branch. No identity kernel bypasses exterior measurability. |
| Determinants and inverse | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:66` (`det_apply`); `Adjugate.lean:193` (`adjugate_apply`); `NonsingularInverse.lean:167` (`inv`); `GroupTheory/Perm/Sign.lean:358` (`sign`) | Determinant uses a permutation expansion; inverse is total and is zero when determinant is not a unit. The design's inverse formulas explicitly require invertibility/nonzero determinant. |
| Covering-space route | `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:41`, :137; `Topology/Connected/LocallyPathConnected.lean:61`; `Topology/Homotopy/Lifting.lean:489`; `Topology/Covering/AddCircle.lean:32` | Simply-connected-space means equivalence of its fundamental groupoid with a point, including connectedness and nonemptiness. Lifting needs a basepoint and chosen fibre lift as well as local path-connectedness; 2.4 supplies them using a vertex and 0. |
| Elementary geometry and kernel carriers | `Mathlib/Analysis/Convex/Hull.lean:48` (`convexHull`); `Analysis/SpecialFunctions/Complex/Log.lean:30`, `Arg.lean:30`; `MeasureTheory/Integral/IntervalIntegral/Basic.lean:655`; `Probability/Kernel/Defs.lean:55` | Convex hull is the convex closure operator; complex log/argument have total values at zero; interval integrals are oriented differences of restricted integrals. Kernel bundles a measurable measure-valued map; Markov probability is additional. The roadmap uses upper-half-plane slopes and nonzero denominators for the meaningful kernel formulas. |
| Fourier decay | `Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean:177` | Finite-dimensional real inner-product Fourier decay; the theorem's nonintegrable branch is totalized zero, so 9.1's separate integrability argument remains necessary. |
| Unused native examples | `TauCeti/Probability/Process/Array/Tail/Basic.lean:43`; `TauCeti/Probability/Ergodic/BernoulliShift.lean:63` | Array tail and one-sided Bernoulli shift exist; their old paths in the previous report are not current. Neither supplies the proper-action generalization on its own. |

Object searches covered lozenges, dimers, Kasteleyn matrices, specifications/Gibbs measures, tail σ-algebras, complementary minors, determinants, invariant measures and kernel correlations. No existing native dimer, lozenge-height or Gibbs-specification development was found. Existing generic matching, weak-probability, zero-one, extremality and process-tail objects are correctly imported rather than recreated, except for the obsolete citation in R04. The three `Matrix.compound*`/`higherAdjugate` resolver leads are not missing pinned declarations claimed as native: they are explicitly consumed from the main-roadmap supplier below.

**Cross-roadmap ownership and supplier resolution.** Read the board package index before searching; searched open heads and main with `roadmaps grep`, read the closest scopes with `roadmaps show`, and compared actual objects. Two main READMEs read for house shape were `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` and `TauCetiRoadmap/RandomMatrices/README.md`, as well as the relevant TensorProductCombinatorics subsection.

| Cited or nearby owner | Resolved location / open work | Ownership conclusion |
|---|---|---|
| PadicMeasuresIwasawaAlgebras §6.4 | Main `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3845`; `Suggested.lean:1029`, :1034, :1039, :1046 | Compound matrices, Cauchy–Binet, unit rule and higher-adjugate identity are present. Higher adjugate uses indices `(T,S)` and complementary submatrix `(Sᶜ,Tᶜ)`, consistent with the roadmap's cofactor orientation. Only this roadmap supplies a cross-roadmap prerequisite. |
| TensorProductCombinatorics §1.1 | Main `TauCetiRoadmap/TensorProductCombinatorics/README.md:465` | Finite barycentric arrays, rhombi and concave hives. No infinite dimer configuration or tiling height correspondence; the scope distinction is valid. |
| RandomMatrices §§8.3–8.4 | Main `TauCetiRoadmap/RandomMatrices/README.md:984`, :1029; revision #1971, same file :1183 onward | Continuous Hermitian positive-contraction kernels and continuous sine/Airy limits; the revision uses joint count laws and does not build the lozenge-specific non-Hermitian beta kernel or its plane-tiling law. No citation here relies on a new revision-only id; §8.3 remains §8.3. |
| GraphConnectivityAndFlows §6.7 | Main `TauCetiRoadmap/GraphConnectivityAndFlows/README.md:753` | Capacitated multiset Kőnig theorem; not used to supply the local perfect-matching definition or torus formula. |
| Completed Exchangeability | `Completed/Exchangeability/README.md:396`, :419; native tail definitions above | Owns the process tail and warns against identifying raw invariant and tail σ-algebras. This design only proves equality modulo a given invariant measure, under a proper action. |
| PointProcesses #417 | `TauCetiRoadmap/PointProcesses/README.md:71`, :105 | Random measures, Palm theory, finite-density processes; explicitly excludes infinite-volume Gibbs processes. Not cited as a supplier. |
| ProbabilisticAndMetricNumberTheory #1421 | `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:7` | Arithmetic statistics, pointwise ergodicity and Gauss-system tails; not the proper-action specification/face theorem. |
| AnalyticNumberTheoryPartII #1167 | `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md`, opening scope | Analytic-number-theory and spectral/Fourier inputs, not dimer Gibbs specifications or lozenge kernels. |
| MathematicalStatisticsFoundations #2111 | `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:40` | Experiments, sufficiency, tests and stochastic convergence; no dimer/specification ownership. |
| Board packages | `packages/AnalyticNumberTheory/README.md` at #123 head `310e834`; `packages/LogicAndDefinabilityInNumberTheory/README.md` at #164 head `972ee8e` | Arithmetic/logic scopes and headings, no vocabulary hits for the candidate objects. The third indexed package could not be read; see below. |

The supplied overlap report has no shared-roadmap conflict, dropped cited id, revision-only cited id or downstream numbering break. The current-head scope checks found no new overlap of ownership. Full open-head source searching was used; there is no claim that every unseen file of every open pull request was inspected.

**Supplier order.** Read all `*Needs:*` lines and the plan prerequisites. No declared gaps (`gaps=[]`); no forbidden supplier is consumed. Main supplies the matrix theory, and other roadmap names are scope exclusions or downstream descriptions. The mechanical gate output was:

```text
candidate: DimerModelsAndLozengeTilings is not in the merge order yet; checked as if placed after VirtualFundamentalClasses (the intake inserts it when its design is accepted)
depcheck: 223 roadmaps, 2027 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This does not certify the nonexistent library name in R04: that was checked separately at the pin. The candidate's absence from the order is not a finding.

**Shape, headline acceptance test and padding.** The required title, Summary, Scope, Conventions, supplier contracts, build explanation, ten layers with Examples/Dependencies, downstream consumers and References are present. The plan and README have the same 52 numbered targets, now including 1.6. API facts and Checks are prose. Mathematical/generalization defects are R01–R09 and R11; R10 is the timelessness defect. No copied source paragraphs, machine paths, pull-request numbers, target-number tables or LaTeX delimiters were found in the design. This is a design review: no `Suggested.lean` is present, so its absence is not treated as a missing package deliverable.

The Summary's headline groups are 1.5 (tilings/matchings), 2.5 (plane heights), 2.9 (Thurston), 3.2 (Kasteleyn), 3.4 (correlations), 4.6/5.3 (Gibbs face/ergodicity), 6.3 (edge classification and two measures), 7.3 (torus limits/slopes), 8.3 (four determinants), 9.5 (all-slope existence), 9.7 (incomplete-beta process), 10.2 (uniform local limits). These can be expressed using native sets, functions, matrices, probability measures, Markov kernels and elementary lattice predicates; no stand-in theorem or sorry'd carrier is needed. The package must state each statable headline using only the simple definitions it actually needs, and document any genuinely missing heavy carrier instead of inventing one.

The planned names `TriEdge`, `TriFace`, `hexGraph`, `Faces`, `IsTiling`, `IsPlaneTiling`, `IsSimplyConnectedRegion`, `kasteleynMatrix`, `partitionFunction`, `IsLozengeGibbs`, `slope`, `incompleteBetaKernel`, and the Summary's theorem names are mathematical definitions/targets in this design, not declarations already present in a Lean file. The future package must reconcile these own-name claims with its acceptance file; native/supplier names have been separately resolved above. No one-tactic probe, declaration-type `#check` comparison or import/docstring audit can be run on a nonexistent acceptance file. In particular, no padding verdict or successful Lean build is being claimed. The constant/corner examples and small determinant computations remain README Checks and must not become sorried acceptance theorems.

## Not verifiable

- Lean elaboration: **not available (this lane does not elaborate; say so in the report)**. No `Suggested.lean` exists at this design stage; no Lean command was run, and there is no “sorry is the only warning” result. Padding, elaborated binder retention and exact package headline signatures require the eventual file.
- `thurston1990` and `georgii2011` remain settled `uncertified` manifest entries. Their paywalled texts were not requested again. The used alternative texts were read: Gorin Theorem 1.4 and Sheffield Lemma 3.2.2. Nothing was added to the missing-source request list.
- Published-edition page correspondence for Gorin is not independently certified by the cached prepublication text. This review uses the exact extraction lines and the visible printed labels of that copy; the earlier report's printed-page claim for Lemma 4.7 was not retained.
- The indexed board package `packages/LawrenceVenkateshMethod/README.md` at #345 head `9ee7ac3` returned HTTP 404. Ownership against that board-head file could not be checked; no assertion that the package does not exist is made.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, prepublication printed p. 45 (line 1766): the source says sufficiently large `n` or `n+2` avoids the critical mesh; it should use `n` or `n+1`, since both even sizes hit `θ=π/2`; affects the proof.
- **Gap** in kenyon2009 at §5.4, preprint p. 29 (lines 863–866): the source says extremality in a fixed-slope fibre implies ergodicity; it should supply another argument, since the equal mixture of three frozen tilings is a nonergodic extreme point of its fibre; affects the proof.
- **Error** in kenyon2009 at Theorem 6, preprint p. 28 (lines 836–839): the source says each realizable slope has a unique ergodic Gibbs measure; it should restrict uniqueness to interior slopes, since boundary Bernoulli rows and randomized block rows can share a slope; affects a stated result.
- **Error** in aggarwal2023 at §1.3, preprint p. 10 (lines 465–467): the source says nonempty type-1 positions determine a plane tiling; it should impose a reconstruction condition, for example that no consecutive rows both lack type-1 lozenges; affects nothing.
- **Error** in aggarwal2023 at equation (1.2), preprint p. 11 (lines 491–505): the source says the determinantal inclusion formula holds for arbitrary position lists; it should require pairwise distinct positions, since a repeated position gives determinant zero but a positive one-site probability; affects a stated result.
- **Misprint** in cohn-kenyon-propp2001 at §1.4, preprint p. 9 (lines 374–377): the source says dominoes are bisected by edges with height difference of absolute value 1; it should use absolute value 3 for the bisecting edge; affects the proof.
- **Error** in gorin2021 at Lecture 1, discussion preceding Theorem 1.4, prepublication printed p. 17 (lines 511–514): the source says simply connected untileable regions still have consistent boundary heights; it should require zero boundary circulation, as condition 1 of Theorem 1.4 does; affects a stated result.
- **Misprint** in gorin2021 at the proof of Theorem 4.11, prepublication printed p. 47 (lines 1891–1893): the source says the inverse is `Q⁻¹Λ⁻¹Q` when columns of `Q` are eigenvectors; it should be `QΛ⁻¹Q⁻¹`; affects the proof.
