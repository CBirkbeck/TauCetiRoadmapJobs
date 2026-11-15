<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13737#issuecomment-6896133596 -->
Review (claude) of cb2cd9c

Verdict: accepted

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No findings. The three round-6 findings (all P3) are repaired, and the repairs are correct at the
pins. The adversarial pass, recomputed this round by hand and by script on the sampled targets, the
headline theorems and every passage the repairs touched, found no false statement, no missing
hypothesis and no wrong sign. Two remarks for the package stage are under "Verified sound"; neither
asks for a change to the design.

## Previous findings: repair verification

Three findings in round 6; none was marked not actionable.

| Round-6 finding | Status | Repaired passage and check |
|---|---|---|
| F01 (P3) 4.3 used two pinned Mathlib declarations that no *Needs:* line named | **Repaired** | `design/README.md:245–257` ("From Mathlib"): "`MeasureTheory.Measure.infinitePi_map_piCongrLeft` (the same file, line 494 …) `ProbabilityTheory.iIndepFun_infinitePi` (… line 124 …) `ProbabilityTheory.iIndepFun.precomp` and `ProbabilityTheory.iIndepFun_iff_iIndep` (… lines 323 and 231 …)"; the same four names are in the *Needs:* line of 4.3 (`:1018–1023`) and in the plan's 4.3 `prerequisites`. Opened at the pin: `Mathlib/Probability/ProductMeasure.lean:494`, `Mathlib/Probability/Independence/InfinitePi.lean:124`, `Mathlib/Probability/Independence/Basic.lean:323` and `:231`, `Mathlib/Probability/Independence/ZeroOne.lean:290` (`h_le`, `h_indep : iIndep s μ`, `MeasurableSet[limsup s atTop]`). The prose paraphrases match the signatures. |
| F02 (P3) a manifest status word in the roadmap text | **Repaired** | `design/README.md:993`: "georgii2011 Theorem 14.15, restated as sheffield2005 Lemma 3.2.2"; `:1141`: "georgii2011 Theorem 14.15; gorin2021 Lemma 13.7". A search of the README and the plan for "uncertified", "certified" and "waived" returns nothing. |
| F03 (P3) the Summary's "every edge slope" | **Repaired** | `design/README.md:23–24`: "two distinct ergodic Gibbs measures of every non-corner edge slope (6.3)"; `:1353`: "at the non-corner points of the edges `s = 0` and `s + t = 1`"; plan 6.3: "likewise at the non-corner points of the other edges by ρ". |

Repaired patterns searched in the rest of the design:

- A route input used but not named (F01): every route was read against its *Needs:* line. The
  path-independence of 9.6 and the residue evaluations of 9.1 and 9.7(a) reduce to an explicit
  primitive with `Complex.log` and to geometric series under `intervalIntegral`, both named. No
  further instance.
- A status word (F02): none left.
- "Every" where a corner is excluded (F03): the remaining uses are "an ergodic Gibbs measure of
  every slope (9.5)", true on the closed triangle (corners by 6.2, edges by 6.3, interior by 9.3 and
  9.4), and "every interior slope", true. No further instance.

## Verified sound

### Coverage

Read all 1951 lines of the README, the plan (10 layers, 51 targets: 19 definitions, 30 theorems, 2
examples; every definition has at least 3 API entries and 3 tests; `gaps: []`, `suppliers: []`;
baseline equal to `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) and the manifest
(10 works, one key each; 8 certified, 2 settled uncertified). No LaTeX delimiters, machine paths,
pull-request numbers, round labels or status words in the README. No declared gaps. No maintainer
notes. No author-flagged unverified locator.

### Seeded source sample (15 targets, each read at the cited lines)

| Target | Lines read | Outcome |
|---|---|---|
| 1.2 | gorin2021 686–704; kenyon2009 95–113 | Dual hexagonal lattice, bipartite by the colouring, tilings as perfect matchings of the restricted dual graph: supported. |
| 1.4 | aggarwal2023 342–364, 380–383; gorin2021 690–702 | Tilings of a domain, the three types, free tilings with at most one face outside: supported. Aggarwal's vertex lists for types 1, 2, 3 equal the roadmap's `W(v) ∪ B(v−e₂)`, `W(v−e₁) ∪ B(v)`, `W(v) ∪ B(v)` (recomputed). |
| 1.5 | aggarwal2023 342–364; gorin2021 698–702; kenyon2009 96–113 | A dimer covering is a perfect matching of the dual graph: supported. The bijection for arbitrary regions is the roadmap's own statement. |
| 1.6 | kenyon2009 line 891; gorin2021 4638–4642 | Exercise 13 (boundary slopes) and the definition of an extreme slope are at the cited lines. The row tilings are the roadmap's own construction; the locators support the context only, as the text says. |
| 2.1 | aggarwal2023 338–341; gorin2021 454–457; kos2006 177–181 | Simple connectivity of the union of faces, consistency of the local height rule, path-independence of the flux: supported. The cochain definition is the roadmap's own. |
| 2.2 | gorin2021 454–457 | Consistency of the local rule; the square identity is recomputed below. |
| 3.2 | gorin2021 714–717, 1218–1219; kenyon2009 504, 537–550; kenyon1997 184–186 | Theorem 2.1, Theorem 3.1, Theorem 2 with the honeycomb proof by flips, Theorem 2: all at the cited lines with the simply connected hypothesis. |
| 4.1 | sheffield2005 1341–1344 | The tail σ-algebra as the intersection of the exterior σ-algebras of finite sets: supported. |
| 4.2 | sheffield2005 1364–1371 | Lemma 3.2.2 and its attribution to Theorem 14.15 of Georgii (line 1366): supported. |
| 4.3 | sheffield2005 1352–1360 | Lemma 3.2.1: ergodicity as triviality on invariant events. |
| 5.4 | aggarwal2023 412–420; kenyon2009 869–878; gorin2021 4520–4526, 4583–4585 | Uniform conditional law, the reweighting by `(a,b,c)` leaving planar Boltzmann measures unchanged, Exercises 13.3 and 13.9: supported. |
| 6.3 | sheffield2005 6195–6198; gorin2021 4638–4642; kenyon2009 891 | Theorem 9.5.1 as cited; (a)–(f) are the roadmap's own and are checked below. |
| 8.5 | gorin2021 1545–1600, 1888–1895; kenyon2009 729–763; kos2006 667–679 | Claims 4.1–4.2, formula (4.8), the Fourier basis and the four products: supported. The eigenvalue `w₃ + w₂z + w₁w⁻¹` is the sources' in the roadmap's coordinates (recomputed below). |
| 9.4 | kenyon1997 85–93; kos2006 728–735; kenyon2009 1011–1036 | Strong mixing of the lozenge measure, the covariance formula and quadratic decay: supported. |
| 9.6 | aggarwal2023 463–476, 504–507; okounkov-reshetikhin2003 965–968 | Definitions 1.2 and 1.3, the formula for `ξ`, Definition 4: integrand, endpoints and crossing rule as stated. |

### Adversarial table

Values computed this round, by hand or from a script kept in the scratch directory.

| # | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| 1 | 4.3 invariance through `infinitePi_map_piCongrLeft` | constant family, `e = (i ↦ γi)` | `piCongrLeft` sends `f` to `g` with `g(γa) = f(a)`, so `g(i) = f(γ⁻¹i) = (γf)(i)`; on `ℤ`, `γ = 1` moves `1_{0}` to `1_{1}` | holds; matches the Layer 4 action |
| 2 | 4.3 independence along `e` and the zero-one law | `I = ℤ`, `e : ℕ ≃ ℤ` | `iIndepFun_infinitePi` with `X i = id`, then `precomp e.injective`, then `iIndepFun_iff_iIndep` gives `iIndep (fun n => comap (ω ↦ ω (e n)))`; `limsup` of these is `tailProcess` by definition (`TauCeti/Probability/Process/Tail/Basic.lean:47`) | holds; every input named |
| 3 | 4.1 enumeration form and properness | `I` finite nonempty; `I = ∅`; `Λ` finite | `F = F' = I`: every `γ` meets, so an infinite `Γ` is not proper; `tailFamily n = cylinderEvents e([n,∞))`, and every finite `Λ` lies in some `e([0,n))` | holds |
| 4 | 4.2 | general measurable `S` | `μ(A Δ γ_kC_k) = μ(γ_k(A Δ C_k)) < 2^{−k}`; `⋃_{k≥n} γ_kC_k ∈ 𝓕_{Λ_nᶜ}` and the unions decrease, so `limsup ∈ 𝓣`; trivial action on a point: `μ{ω = 1} = 1/2`, no tail event | holds; properness needed |
| 5 | 6.3(f) and the Summary | `s = 1/2`; `s ∈ {0,1}`; `ρ` on slopes | `P(ε₀=ε₁=1)`: `s² = 1/4` against `(s+s²)/2 = 3/8`; equal only at `s ∈ {0,1}`; `ρ(s,0) = (1−s, s)`, then `(0, 1−s)`: open edges to open edges; `β_s(A) = (β(A) + β(σ⁻¹A))/2 = β(A) ∈ {0,1}` for shift-invariant `A` | holds |
| 6 | 6.3(b), (c) | `M ∈ Φ₂`, `M Δ M'` finite | `H_{M'} − H_M` has finite support, `H_M` is constant on vertical lines and `H_{M'}` is nondecreasing there, so they agree; completion sets are singletons | holds |
| 7 | Conventions: lattice, rotation, heights | `ρ`; `M₁, M₂, M₃` | `ρ² = (y−x, −x)`, `ρ³ = id`; `ρ(W(0)) = {0, e₂, −e₁} = W(−e₁)`; edge directions `1 ↦ 2 ↦ 3 ↦ 1`; `H_{M₁}(ρ⁻¹w) + w₁ = w₂`; Gorin's height of `M₁` is `y − 2x`: `−2` along `e₁`, `+1` along `e₂` and `−e₃` | holds |
| 8 | 1.1–1.5 | faces at `0`; unit hexagon; `{W(0)}`; `R = ∅` | six faces at `0` and the 6-cycle through `(0,3)`, `(0,2)`, `((−1,0),1)`, `((−1,−1),3)`, `((0,−1),2)`, `(0,1)`; `T_a`, `T_b` cover all six faces; `{W(0)}`: 0 tilings, 3 free tilings; `∅`: 1 and 1; `18 = 2·6 + 6` | holds |
| 9 | 1.6 | `ε = 1_{[0,∞)}`; column variant with `ε = 1_{{0}}` | `W(x,y)` and `B(x,y)` each contain exactly one edge; `τ_{e₁}M_ε = M_{σε}` with `(σε)_x = ε_{x−1}`; column variant: `B(x,0)` has no edge | holds |
| 10 | 2.1, 2.2 | ring cochain; `c₀`; cochains of `M₁`, `M₃` | the 12 faces listed are those meeting `W(0)`; closure at `B(1,0)`, `W(1,0)`, `B(2,0)`: `1+0 = 1`, `0+1 = 1`, `1+0 = 1`; round `W(0)`: `0 + 1 − 0 = 1`; `c₀` on `W(v)`: `0 + 0 ≠ 1`; `M₁`: `1 + 0 = 1`, `0 + 1 = 1`, primitive `x`; shelling of the hexagon: one new vertex at each of five steps, two edges at the last | holds |
| 11 | 2.3, 2.7 routes | `Q` finite; a function constant on boundary components | the sum of face coboundaries over `Q` is `±1` and equals the boundary sum, which vanishes for an exact cochain; the extension by `0` outside `R` is closed on outside faces, and comparing primitives gives the constant | holds |
| 12 | 2.6, 2.8, 2.9 | hexagon; `R_ring`; `R₆'` | hexagon heights `0,0,0,−1,−1,−1`, `H(0) = 0` or `−1`; flip `T_a → T_b`; `T` and `T'` each cover the 12 ring faces and sum to `−1` round `W(0)`, and `c₀` sums to `−1` there, so no `h` exists (consistent with 2.9); `R₆'`: matrix `[[1,0,0],[1,0,0],[1,1,1]]`, `ρ_R((2,1),(1,1)) = 0 < 1` | holds |
| 13 | 3.1–3.3 | hexagon, unit and `(a,b,c)` weights | `det[[c,0,a],[b,a,0],[0,c,b]] = 2abc`; adjugate of the unit matrix `[[1,1,−1],[−1,1,1],[1,−1,1]]`, entries `1/2, 1/2, −1/2, 1/2`; pair determinant `1/2`; `c·ab/(2abc) = 1/2` | holds |
| 14 | Conventions: restricted Leibniz witness | `A = [[1,2,0],[0,1,3],[4,0,1]]` | `det A = 25`; adjugate `[[1,−2,6],[12,1,−3],[−4,8,1]]`; `det[[12,−3],[1,6]] = 75`, `75/625 = 3/25`, `25 · 3/25 = 3 = A(1,2)` | holds |
| 15 | 5.2 cylinder identities | `E ⊇ F` and its neighbours | `μ[ω]_E = w(ω∩F)/Z · μ{η = ω on E∖F}` with the same `Z` and the same exterior event for `ω'` | both directions hold |
| 16 | 7.1, 7.2 | floor tiling; 2 × 2 torus | increments `⌊u + a/n₁⌋ − ⌊u⌋ ∈ {0,1}` and along `e₃` since `a/n₁ + b/n₂ ≤ 1`; mean `h₁ = 6/9`, slope `1/3` | holds |
| 17 | 8.2, 8.3 parities | all parities of `h₁, h₂, n₁, n₂`; 1 × 2 and 2 × 2 tori | with `a' = a+n₁+1`, `b' = b+n₂+1`: sums `1+1+1−1`, `1−1+1+1`, `−1+1+1+1`, each `2`; cycle count `gcd`, length sum `n₁h₂ + n₂h₁`; 1 × 2: `(3, 5, −1, 1)` for `(00, 01, 10, 11)` from the sign formula; 2 × 2: `1−2−2+1+1−2 = −3` | holds |
| 18 | 8.5 and 8.1, 8.4 Checks | 1 × 1, 1 × 2, 2 × 2 unit, 2 × 2 `(2,3,5)`, 3 × 3 unit | `(K f)(u) = (w₃ + w₁w⁻¹ + w₂z) f(u)` with `z^{n₁} = (−1)^a`, `w^{n₂} = (−1)^b` at the seams; determinants `(3,1,1,−1)`, `(3,5,−1,1)`, `(−3,5,5,5)`, `(0,544,1044,1300)`, `(0,28,28,−28)`; `Z = 3, 5, 9, 1444, 42` | holds |
| 19 | 9.2 | `θ = π/2, 2π/3, 1, 0.1, 3`; `n < 3000` | failure of `n` and `n+1` forces `θ/π + δ' − δ ∈ ℤ` with `δ, δ' → 0`; `W_{π/2}`: no even `n`, every odd `n`; `3 ∉ W_{2π/3}`, `4 ∈` (`π/12 = 0.262 > 0.125`); last `n` with both bad: `0, 0, 0, 188, 177` | holds |
| 20 | 9.3, 9.4 | `w = (1,1,1)`; type-3 pair at `0`, `d` | `G(0,−1)² − G(0,−2)G(0) = 1/9 − (1/3)(√3/(2π) − 1/3) = 0.1303`; covariance `−w₃²G(d)G(−d)`; an event invariant under `ℤd₀` has `μ(A) = μ(A)²` | holds |
| 21 | 9.6 | `ξ = e^{πi/3}`; slope `(0.3, 0.45)` | diagonal `0.33333` and `0.30000`; vertical pair `−0.33333`, `0.057669 = 1/3 − √3/(2π)`; at `(0.3,0.45)`: `|ξ| = 1.39680`, `|1−ξ| = 1.14412`, `−0.25000 = −(1−s−t)`, `−0.0597019 = s − Im ξ/π`; rows `m = 1,2,3`: `0.359702, 0.295322, 0.089354` on both sides; inverse map returns `(0.3, 0.45)` | holds |
| 22 | 9.7(a), (e) and 9.5 | `ξ = e^{πi/3}`; `(1/2, 1/4)` | `G(0,−2) = −K_ξ(v₂;v₁)`, `G(0) = −K_ξ(v₁;v₂) = 1/3`; row form `(−1)^m sin(πsm)/(πm)` equals 9.1's with `θ₁ = πs`; `1/4 − 1/π² = 0.1487`; `w = (1, √2/2, √2/2)`, `1 < √2` | holds |
| 23 | 10.2, 10.3 Checks | `H = min(0,x,y)`; `A = B = C = 1` | increments in `{0,1}`; `H(e_k) = 0`, `H(−e_k) = −1`; the six vertices are the neighbours of `(1,1)` | holds |

### Pinned declarations and cross-roadmap citations

Opened at the pins this round (file and line): `ProductMeasure.lean:494`; `Independence/InfinitePi.lean:124`;
`Independence/Basic.lean:231`, `:323`; `Independence/ZeroOne.lean:290`;
`Constructions/Cylinders.lean:409`, `:415`, `:418`; `Process/Filtration.lean:534`;
`Measure/MeasuredSets.lean:86` (finite measure, ring, countable covering subfamily, generation: the
three hypotheses of the contract); `SimpleGraph/Matching.lean:254`; `SimpleGraph/Finite.lean:382`;
`FundamentalGroupoid/SimplyConnected.lean:137`, `:142`, `:147` (nonemptiness and path-connectedness,
as the contract says); `Topology/Homotopy/Lifting.lean:489` (`IsCoveringMap.existsUnique_continuousMap_lifts`,
`[SimplyConnectedSpace A] [LocallyPathConnectedSpace A]`); `Topology/Covering/AddCircle.lean:32`;
`Fourier/RiemannLebesgueLemma.lean:177`; and in Tau Ceti `Probability/Process/Tail/Basic.lean:42`,
`:47`, `:64`; `MeasureTheory/Group/CountableAction.lean:53`, `:68`. The remaining contract names
were opened by rounds 5 and 6 with file and line, and the pins have not moved. A search of both
pinned libraries for Kasteleyn matrices, lozenge tilings, Gibbs measures and specifications finds
none.

Citations resolved on main: VonNeumannAlgebras V8.BernoulliArbitraryDiscrete (`README.md:2788`),
FactorRigidity §8.3 (`:767`), TensorProductCombinatorics §1.1 (`:465`), RandomMatrices §8.3–8.4
(`:1183`, `:1253`), GraphConnectivityAndFlows §6.7 (`:753`). All five are scope citations; none is
a supplier.

### Ownership and overlaps

A search of main and of the open heads for Kasteleyn, lozenge, dimer, Gibbs specification, discrete
sine kernel, incomplete beta, Thurston's tiling criterion, tail σ-algebra and perfect matching
finds no roadmap that states dimers, lozenge tilings, Kasteleyn matrices, specifications or the
kernels of Layer 9. The roadmap's own Lean names (`hexGraph`, `TriEdge`, `TriFace`,
`kasteleynMatrix`, `IsLozengeGibbs`, `incompleteBetaKernel`, `IsSimplyConnectedRegion`,
`IsPlaneTiling`) occur in no other roadmap. The scratch overlap file lists no other pull request
changing this roadmap, no dropped id, no revision-only id, and an empty third list.

Overlap check: read ClassicalErgodicTheory, PointProcesses, MathematicalBilliards, RandomGraphs, MathematicalStatisticsNonparametric, Exchangeability, ProbabilisticAndMetricNumberTheory, StochasticCalculus; shared: ergodicity of Bernoulli shifts — owner VonNeumannAlgebras V8.BernoulliArbitraryDiscrete on main, cited, 4.3 a kept variant (proper action on any countable index set, any law); sequence tail σ-algebras — owner Tau Ceti (`tailProcess`), cited; nothing else shared.

### Supplier order

Every *Needs:* line and Dependencies paragraph was read; no roadmap is a supplier and no gap is
declared. Dependency check output:

```text
candidate: DimerModelsAndLozengeTilings is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean
name found nowhere.

### Shape, headline theorems

The README has the required shape: Summary, Scope and ownership, Conventions, Exact supplier
contracts, How to read the build, ten layers each ending with Examples and Dependencies, Downstream
consumers, Worked examples, References. The layer order is forced where it matters (3.2 needs 2.8;
5 needs 4; 7 needs 5 and 6; 8 needs 7; 9 needs 4–8), and Layers 1–3 are independent of Layers
4–5.3, as the README says.

Headline theorems from the Summary: 1.5, 2.5, 2.9, 3.2, 3.3, 4.6, 5.3, 6.3, 7.3, 8.3, 9.5, 9.7,
10.2. Each is a named target with hypotheses and a locator.

There is no `Suggested.lean` at the design stage, so the padding probe and the `#check` comparison
do not apply. Two remarks for the package stage, neither a finding:

- The README backticks about two dozen names of its own; each must be declared in `Suggested.lean`
  or lose its backticks.
- The headline 5.3 carries no Lean name of its own (its lozenge form rests on
  `gibbsInvariant_extreme_iff_ergodic` and `IsLozengeGibbs`); the package decides how it is stated.

### Copyright and arrangement

Wording compared at 22 passages against 7 sources: the 15 sampled targets and seven further
passages (the lattice, lozenge-type, height and translation conventions against aggarwal2023
324–361, 392–399 and 416–418; the Gorin height against gorin2021 447–457; the route of 3.2 against
kenyon2009 537–550; the kernel definition against aggarwal2023 472–476). What is shared is
formulas, standard names and one forced clause of five words (the flip as a 3-cycle). No table,
figure or exercise list is taken over.

gorin2021 has the largest share. Its contents page (Lectures 1–19) against the layers: Layers 1–2
draw on Lectures 1 and 2.1; Layer 3 on Lectures 2.1 and 3.1–3.2; Layers 4–6 on Lecture 13 and
sheffield2005, placed before Layers 7–8 (Lectures 3.3 and 4.1); Layer 9 on Lectures 4.2–4.3, 6.1
and 13.4; Layer 10 on Lecture 13.2. Lectures 5, 7–12 and 14–19 have no layer. There is no
one-to-one run.

Source independence: 22 passages compared with 7 sources, none shared; largest share gorin2021, 47 of 164 source citations; contents compared with gorin2021: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean
  command was run.
- `thurston1990` and `georgii2011`: settled uncertified entries, cited by locator; not requested.
  The attribution of the face theorem to Georgii's Theorem 14.15 was checked through sheffield2005
  line 1366.
- The publisher pagination of gorin2021 was not checked; the cached pre-publication copy was. Its
  extraction has unreliable page markers in Lecture 4 (lines 1741–1833), so the printed pages of the
  two gorin2021 entries under "Source issues" are placed by its contents page (Section 4.2 on pp.
  43–46, Section 4.3 from p. 46), not by the markers.
- The READMEs of the two packages in the board index (AnalyticNumberTheory,
  LawrenceVenkateshMethod) live on other pull requests' heads and were not fetched; both are
  number-theoretic by title.
- The numerical values of round 6 that this round did not recompute (the torus correlations `c_{ab}`
  of 8.4, the kernel `G_w` by quadrature in 9.1, the seven-pair identity of 9.7(a)) are relied on
  from that round's table, whose rows carry computed values.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, pre-publication p. 45 (line 1766): the source says that for large n either n or n+2 is a good size; it should be n or n+1, since for the angle π/2 every even n fails; affects the proof.
- **Gap** in gorin2021 at Theorem 4.10, pre-publication p. 46 (lines 1847–1849): the source says torus correlations are inverse-matrix minors for arbitrary weights; it should use complementary minors or assume four nonzero determinants, weights (2,3,5) on the 2 × 2 torus being singular; affects a stated result.
- **Error** in kenyon2009 at Theorem 6 and Section 5.4, preprint pp. 28–29 (lines 836–839, 858–859): the source says every slope of the closed triangle has a unique ergodic Gibbs measure; it should restrict uniqueness to interior slopes, non-corner edge slopes carrying at least two; affects a stated result.
- **Gap** in kenyon2009 at Section 5.4, preprint p. 29 (lines 863–866): the source says torus limits are ergodic because extreme points of the fixed-slope set are ergodic; it should prove ergodicity separately, the equal mixture of the three frozen measures being fibre-extreme and not ergodic; affects the proof.
- **Error** in aggarwal2023 at Section 1.3 after Definition 1.2, preprint p. 10 (lines 465–467): the source says a plane tiling is determined by its type-1 positions unless that set is empty; it should require that no two consecutive rows lack type-1 lozenges; affects nothing.

## For the human reviewers

- **Licence.** `gorin2021` is read from the author's pre-publication copy (`sources.toml`, `licence_class = "author-page"`); it has the largest share of the locators, and its publisher pagination was not compared.
- **Scope.** The proposed DimerModelsAndLozengeTilingsPartII (Sheffield's uniqueness, the variational principle, Aggarwal's theorem) is named in `design/README.md:116` and in no board package or open pull request; whether to commission it is a human decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cb2cd9c0215de5e4d370accfe82bfd2c1f929927", "job": "REV-DESIGN-DimerModelsAndLozengeTilings~7", "model": "fable", "worker": "chris-x30"} -->
