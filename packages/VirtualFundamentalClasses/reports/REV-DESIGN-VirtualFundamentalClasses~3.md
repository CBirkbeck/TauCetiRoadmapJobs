<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7642#issuecomment-6715944608 -->
Review (claude) of a1f6327

Verdict: needs_changes

1. **F01** (P3) The corrected invariance has a published source that the design does not cite

   **Location.** `packages/VirtualFundamentalClasses/design/README.md` lines 866–868 ("`β` is not
   invariant under all of `T_Y`, which behrend-fantechi1997 Proposition 3.5 (line 889) asserts (Checks)")
   and lines 1490–1518 (the 8.5 invariance bullet, whose only locators are behrend-fantechi1997 lines
   781–809 and "the proof of Proposition 3.5, lines 894–897"); `design/plan.json` 8.5 locator ("proof
   of Proposition 3.5, lines 894–897 (corrected: …)").

   **Claim.** The roadmap corrects a published proposition on its own authority, and states the corrected
   invariance (8.5) with locators only into the source it contradicts.

   **Witness.** kresch1999b lines 334–343: Theorem 3.1 states the invariance of Vistoli's rational
   equivalence under the tangent bundle of the smooth, regularly embedded substack (restricted to `X'`),
   and the remark after it names behrend-fantechi1997 Proposition 3.5 as incorrect for the bigger group
   `T_Y|_{X'}`. The proof (lines 377–405) acts by `𝔸^m = T_X ⊂ 𝔸^n = T_Y` on the deformation space
   `M̃°_{Y'Y}` and uses that the function to `𝔸¹ × 𝔸¹` of its Corollary 1.10 is `𝔸^m`-invariant. (The
   statement of Theorem 3.1 writes the group as `T_{Y'}|_{X'}` with `Y'` the arbitrary substack; the
   proof, and the remark "if `X ⊂ Y'` the action is trivial" at line 346, use the tangent bundle of the
   smooth `X`: a misprint, recorded under Source issues.)

   **Repair.** In 4.4 (line 867), after "which behrend-fantechi1997 Proposition 3.5 (line 889) asserts",
   add "(kresch1999b lines 41–47 and 340–343)". In the 8.5 bullet, at "Deduce: for a regular local
   embedding `Y' → Y` of DM stacks smooth … invariant under `T_{Y'/𝔐}|_{X'}`", add the locator "(for
   `𝔐 = Spec k` this is kresch1999b Theorem 3.1, line 334, proved there by extending the `T_{Y'}`-action to
   Vistoli's double deformation space, lines 377–405; the route below reproves it from 4.4)". In the plan's
   8.5 locator and in the References add the same. In `sources.toml`, the entry `kresch1999b` that this
   review added through the sources service carries the placeholder locator "§4": set `locator_scheme =
   "theorem"`, `locator = "Theorem 3.1 (lines 334–336), the remark at lines 340–343, and lines 41–47"`,
   and split `cited_for` into `["4.4", "8.5"]`. Tested on the instance that refuted the original: with
   `Y = 𝔸²`, `X` the origin, `Y' = {y = 0}`, Kresch's group is `T_{Y'} = ⟨∂_x⟩`, acting by `ξ ↦ ξ + a`, which
   fixes `c·ν/η`; the design's deduced statement gives the same group.

2. **F02** (P3) 10.7's route covers only a regular local embedding, not the general lci case it states

   **Location.** `packages/VirtualFundamentalClasses/design/README.md` lines 1846–1853 ("The second case
   uses the rational equivalence of behrend-fantechi1997 Lemma 5.9 (line 1397) for a regular local
   embedding between stacks smooth over `𝔐`: … it is `β` of 4.4 for the regular local embedding
   `Z' ×_𝔐 W → Z ×_𝔐 W`"); `design/plan.json` 10.7 statement ("in the second case beta of 4.4 for
   Z' x_frakM W -> Z x_frakM W").

   **Claim.** The second case of 10.7 is stated for every local complete intersection `v : Z' → Z` between
   stacks smooth over a reduced `𝔐`, but the route treats `v` itself as a regular local embedding; for `v`
   not an embedding (for instance `Z' = Z × 𝔸¹ → Z` composed with a closed immersion of `Z`), the
   substack `Z' ×_𝔐 W → Z ×_𝔐 W` is not an embedding and `β` of 4.4 is not defined for it.

   **Witness.** behrend-fantechi1997 lines 1489–1498: the source proves the regular case first (lines
   1471–1488) and then the general case by factoring `v` through its graph `Z' → Z' × Z` and the
   projection, with the obstruction theory `Ω_{Z'} ⊞ E` on `Z' × X`, combining the smooth case and the
   regular case. Instance: `Z = 𝔸¹`, `Z' = 𝔸¹ × 𝔸¹ → 𝔸¹` the composite of `(s, t) ↦ (s t, t)` with the
   projection, lci but neither smooth nor an embedding; the design's text gives no `β` for it. In the
   relative setting the product obstruction theory on `Z' ×_𝔐 X` over `𝔐` is not 10.5's (which is over
   `𝔐 × 𝔐'`): it is `pr^*Ω_{Z'/𝔐} ⊕ pr^*E`, split off by 8.3's transitivity triangle for
   `Z' ×_𝔐 X → X → 𝔐` (the first map smooth, hence lci) together with the flat base change
   `τ^{≥−1}L_{Z'×_𝔐X/X} ≅ pr^*Ω_{Z'/𝔐}` and the functoriality map `pr^*τ^{≥−1}L_{Z'/𝔐} →
   τ^{≥−1}L_{Z'×_𝔐X/𝔐}` as a section (8.3).

   **Repair.** After "The smooth case uses no hypothesis on `𝔐`." add: "For a general local complete
   intersection `v` with `Z'`, `Z` smooth over the reduced `𝔐`, factor `v` as the graph
   `Γ_v : Z' → Z' ×_𝔐 Z`, a regular local embedding between stacks smooth over `𝔐`, followed by the smooth
   projection `p` to `Z` (behrend-fantechi1997 lines 1489–1498); on `Z' ×_𝔐 X` over `𝔐` take the
   obstruction theory `pr^*Ω_{Z'/𝔐} ⊕ pr^*E`, which maps to `τ^{≥−1}L_{Z'×_𝔐X/𝔐}` because 8.3's
   transitivity triangle for the smooth `Z' ×_𝔐 X → X` is split by the functoriality map of
   `Z' ×_𝔐 X → Z'`; it is compatible with `E` over `p` and `F` is compatible with it over `Γ_v`, so the
   smooth case and the regular case combine." In the plan's 10.7 statement, replace "in the second case
   beta of 4.4 for Z' x_frakM W -> Z x_frakM W" by "in the second case, after factoring v through its
   graph, beta of 4.4 for (Z' x_frakM Z) x_frakM W". Tested on the instance: for `Z' = Z × 𝔸¹ → Z` the
   graph is `(z, t) ↦ (z, t, z)`, a regular local embedding of codimension `dim Z`, and the composite
   `v^! = Γ^! ∘ p^*` recovers `[X, E]^vir × [𝔸¹]` of the 10.7 Check.

Round 3 of the design review. Files read in full: `packages/VirtualFundamentalClasses/design/README.md`
(2105 lines), `packages/VirtualFundamentalClasses/design/plan.json` (11 layers, 61 targets, 130 tests,
no definition under three tests, no declared gaps), `packages/VirtualFundamentalClasses/sources.toml`
(21 entries recorded by the author; this review added one, below). The four findings of round 2 were
checked one by one against the repaired text and the plan, the adversarial pass was run on every
passage the repairs changed or added and on the seeded sample of fifteen targets, and the sampled
locators were read at the cited lines. No finding blocks; the two P3 findings below each ask for a
repair (a citation and a route completion), so the verdict is needs changes rather than accepted.

The pivotal item of this round is the repair of F01, which the fix worker applied differently from the
proposed repair on the ground that the proposal, and behrend-fantechi1997 Proposition 3.5 itself, are
false. I recomputed the counterexample independently and then fetched the literature's own correction:
kresch1999b (A. Kresch, *Canonical rational equivalence of intersections of divisors*, arXiv
alg-geom/9710011v2) says at lines 41–47 that the equivariance "is used, but appears with mistaken
proof" in Behrend–Fantechi, and at lines 340–343 that Lemma 5.9 there invokes "the incorrect stronger
claim appearing in Proposition 3.5"; its Theorem 3.1 (lines 334–336, proof at lines 344–405) proves the
invariance under the tangent bundle of the regularly embedded smooth substack only, which is the
design's deduced statement in 8.5 with `𝔐 = Spec k`. The fix worker's mathematics is therefore right
and agrees with the published record.

## Repairs of the previous review, finding by finding

- **F01 (P2, descent along `T_{W/𝔐}` needs an invariance 4.4 did not state) — repaired, differently
  from the proposed repair, and correctly.** The proposed repair asked for invariance of `β(Y', X)`
  under `T_{Y/𝔐}` for every regular `Y' → Y`; the fix worker refuted it and, with it,
  behrend-fantechi1997 Proposition 3.5. Recomputed: `Y = 𝔸²`, `X` the origin, `Y' = {y = 0}`;
  `C = T_0𝔸²` with coordinates `ξ, η`; `N ×_Y C = 𝔸³` with `ν` on `N`; `u = id`, so `C_{u^*C/C}` is
  the zero section `{ν = 0}`; `C_{X'/Y'} = T_0 Y'` embeds in `u^*C` as `{η = 0}` (the surjection
  `k[ξ, η] → k[ξ]`, `η ↦ 0`); `W_2(𝔸³) = k(ν, ξ, η)^×`, and `div β = [ν = 0] − [η = 0]` forces
  `β = c·ν/η`. Under behrend-fantechi1997 Lemma 3.2 (lines 781–809, identification (6):
  `(n_1, n_2) ↦ (n_2 − n_1, n_1)`, `p_{2*} = n + t`) the action of `T_Y` on `C` is translation, so
  `η ↦ η + b` moves the boundary component `{η = 0}`: Proposition 3.5 (line 889) is false as stated,
  and its proof (lines 894–897) fails because the inverse images of `Y'` under the two projections of
  `Y × Y` are `{η_1 = 0}` and `{η_2 = 0}`, which differ. kresch1999b confirms this (lines 41–47,
  340–343) and proves the corrected statement (Theorem 3.1, line 334). The repaired text: 4.4 now
  states Proposition 3.4 precisely (lines 857–865: "`α^*β(Y', X) = β(Ỹ', X)` in `W_*(N ×_Y C_{X/Ỹ})`
  (Proposition 3.4, line 884)"), says that invariance is stated in 8.5 (lines 865–868), and carries the
  negative-control Check (lines 893–901); 8.5 has the new bullet (lines 1490–1518) with the first
  statement (invariance under `T_{Y/𝔅}|_{X'}` when `Y' = Y ×_𝔅 𝔅'`), its route through the two
  projections of `Y ×_𝔅 Y`, and the deduced statement (invariance under `T_{Y'/𝔐}|_{X'}` for a regular
  local embedding of stacks smooth over a reduced `𝔐`); 10.6 (lines 1812–1823) and 10.7 (lines
  1846–1853) cite it; the plan's 4.4, 8.5 (statement, prerequisites `target:4.4`, `target:8.3`, API
  `vistoliRationalEquivalence_relTangent_invariant`, tests `beta_invariance_needs_base`,
  `beta_invariance_node`, `beta_invariance_degenerate`), 10.6 and 10.7 match. Both statements and the
  route were recomputed below and hold. Repaired.
- **F02 (P3, `C_{U/W}` for the conormal sheaf) — repaired.** 8.1 (lines 1331–1334): "conormal sheaf
  `I/I²` (`I` the ideal of `U` in `W` …; the degree-one part of the graded algebra `⊕ I^n/I^{n+1}` of
  the normal cone `C_{U/W}` of 4.2), define … `K_{U,W} := [I/I² → Ω_{W/𝔐}|_U]`"; 9.1 (line 1582):
  "`h^♯ : g^*(I/I²) → J`"; plan 8.1 statement likewise. A grep for `C_{U/W}` finds only the cone.
- **F03 (P3, 9.2 Check refuted by its own instance) — repaired.** Lines 1619–1626: "in which case `M`
  has pure dimension `vd = m + rk τ^{≥−1}L` (on a relative local embedding `(U, W)` with `W` of pure
  dimension `m + d` and `U → W` regular of codimension `c`, every component of `U` has dimension
  `m + d − c` and `rk τ^{≥−1}L = d − c` …)". Recomputed: a regular sequence of length `c` cuts the
  local dimension at each generic point of `U` by exactly `c`, so `dim = m + d − c = m + (d − c)`; the
  non-lci instance `Spec k → Spec k[ε]/(ε²)` (`vd = −1 ≠ 0`) is no longer claimed. The plan's
  `IsObstructionTheory.id` matches.
- **F04 (P3, 11.5 lists 10.1) — repaired.** Line 1998: "*Needs:* 11.2, 11.4, 7.3, 10.2; StableReduction
  Layer 2"; plan 11.5 prerequisites `target:11.2`, `target:11.4`, `target:7.3b`, `target:10.2`,
  `roadmap:StableReduction Layer 2`. The added 11.4 is used ("the obstruction theory of 11.4") and
  11.4 does not depend on 11.5 (its *Needs* are 9.3, 11.1–11.3), so no cycle.

## Verified sound

**Principles.** Arbitrary field `k` throughout; no route-specific shortcut (the integral/rational split
is justified by `A_0([𝔸¹/μ₂]) = ℤ/2` versus `0`); no re-planning (stacks, scheme Chow theory, cones on
schemes, cotangent complexes of rings, derived functors on sites, curve families are imported by
section); no copied passage, no algorithm; no LaTeX delimiters, process words, pull-request numbers,
URLs, dates or machine paths (grep for `$`, `\(`, `\[`, `http`, `pull request`, `#NNN`, `TODO`,
`handoff`, `checkpoint`, `removed`, `so far`, `deferred`, `optional`, `uncertified`: no hits).

**Dependency gate.** Output:

```
candidate: VirtualFundamentalClasses is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2391 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id
is dropped by an open pull request, none is defined only by an open revision; the closest roadmaps in
vocabulary are EquivariantIntersectionTheory (a supplier, cited and compared in 6.2) and the
SchemeAndStackFoundations revisions (suppliers). `scratch/citations.md` lists ten Lean names found
nowhere by the resolver; all ten are SchemeAndStackFoundations or DerivedModuleAlgebra names that
exist on main (below), so the leads resolve.

**Supplier citations resolved on main (head `65930bac`).** SchemeAndStackFoundations README: §0.7
l.755 (`topologicalKrullDimAt`, `dimension_theory_finiteType`), §1.1 l.2071 (`qcoh_fpqc_descent`),
§1.10 l.2320 (`smallEtale_map`), §1.18 l.2745 (`Stacks.StackInGroupoids`, `Stack.stackification`),
§1.19 l.2817 (`IsDeligneMumford` with `.iff_unramified_diagonal` and `.ofSpace`, l.2826–2829), §1.20
l.2843 (`setoid_criterion`), §1.21 l.2951 (`Stack.quotient`, `actionQuotient`,
`quotientStack_algebraic`), §1.22 l.2989 (`QCoh.presentationEquiv`), §1.23 l.3021
(`IsCoarseModuliSpace`, `keel_mori`), §2.6 l.3437 (`serre_affineness_criterion`), §2.9 l.3582
(`bigSheaf`), §2.10 l.3631 (`quasiCoherent_topology_comparison`), §2.20 l.4275, §3.3 l.4713, §4.1
l.5066, §5.1 l.6567 (`Chow.cyclesOfDimension`, `Chow.RatEquiv`), §5.2 l.6653 (`chow_affine_bundle`),
§5.4 l.6721 (`Chow.chernClass`), §5.5 l.6768 (`conormal_regular`, `normalCone_eq_normalBundle`,
`Chow.IsRegularImmersion`, `Chow.gysin`, `excess_intersection`, `gysin_self_intersection`,
`homotopy_invariance`, `Chow.externalProduct`, `deformationToNormalCone`, `commutes_with_c1`,
`gysin_open_independent_double_cover`), §5.6 l.6921 (`Chow.intersect`, `Chow.graphPullback`,
`test_pn_ring`); `test_BG_representations` present. AlgebraicVectorBundles: L0B l.228, L1A l.269, L2A
l.306, L2B l.340; the eleven cited names are declared in its `Suggested.lean`. DerivedModuleAlgebra:
§0.7 l.949 (`Algebra.CotangentComplex.homologyOneIso` l.964), §0.13 l.1151, §0.25 l.1303
(`Algebra.CotangentComplex.extensionObstruction` l.1329). EnhancedDerivedSheaves: §0.2 l.441, E1.2
l.534, E1.4 l.580. StableReduction: Layer 2 l.405, Layer 3 l.467, `PrestableFamily` l.109.
EquivariantIntersectionTheory at its open head: Conventions l.49, §2.1 l.379 (`A^G_i(X) =
A_{i+l−g}(X ×^G U)` l.385), §2.2 l.403, §2.3 l.431 (`A^*_{μ_n} ≅ ℤ[t]/(nt)` l.434). It is a new roadmap
folder in an open pull request, so an allowed supplier; the package's pull request must name it in
its merge-order paragraph.

**Library declarations at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, as in
`lake-manifest.json` and the plan's baseline).** `AlgebraicCycle`
(`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` l.44, `.map` l.51 ff.); `Scheme.ord`
(`OrderOfVanishing.lean` l.52, `ordHom` l.35); `Abelian (SheafOfModules R)` (`Sheaf/Abelian.lean`
l.40); `DerivedCategory` (`DerivedCategory/Basic.lean` l.87); `cotangentComplex` l.61,
`exact_cotangentComplex_toKaehler` l.324, `H1Cotangent` l.333 (`Extension/Cotangent/Basic.lean`);
`FormallySmooth` l.70, `iff_split_injection` l.290, `iff_comp_surjective` l.370 (`Smooth/Basic.lean`);
`derivationToSquareZeroEquivLift` (`ToSquareZero.lean` l.116); `smallEtaleTopology` (`Sites/Etale.lean`
l.50); `CategoricalPullback` (`Pullback/Categorical/Basic.lean` l.81); Tau Ceti `LineBundleClass`
(`LineBundle/Class.lean`), `CartierDivisor` (`CartierDivisor/Basic.lean` l.127). No file at either pin
mentions `DeligneMumford` or `AlgebraicStack` (grep), so no headline theorem is statable at the pins.

**Seeded locator sample (15 targets), read at the cited lines.** 1.3: stacks-properties Lemma 12.1
l.1374–1381 (`dim_x = dim_u U − dim_{e(u)} R_u`), Definitions 12.2–12.3 l.1404–1417, Remark 12.4
l.1418, Example 12.5 l.1421–1424 ✓. 1.5: vistoli1989 (1.15) l.367–370, the `BG → S` example of degree
`1/n` l.372–376, (1.16) l.379, `[E : K] = 0` for infinite extensions l.426–427, (1.17) l.428–432, base
change for schemes l.363–364 ✓. 2.1: (3.1) l.892–894, (3.5) l.967–971, the sheaf property and Gillet's
Lemmas 4.2–4.3 l.953–957; stacks-chow-spaces Lemma 4.3 l.169 (length along a closed immersion),
Lemma 10.3 l.516 (étale pullback of an integral cycle has coefficients `1`) ✓. 3.4: vistoli1989 Lemma
3.9 l.1049 (push–pull); stacks-chow Lemma 19.3 l.1395 and stacks-chow-spaces Lemma 15.2 l.813 (the
localisation sequence) ✓. 3.5: vistoli1989 l.1707–1708 ("as in [Fu] 1.10"); fulton1998 §1.10
uncertified ✓. 4.3: (3.10) l.1081–1100 (`(F·T) = s^*[C_{U/T}]`, `f^! y = Σ m_i h_{i*}(F·T_i)`), (3.11)
l.1101, (3.12) l.1110–1117, (3.13) l.1118, Lemma 3.19 l.1197–1202 (`T` equidimensional), Lemma 3.20
l.1206; the reduction to integral `Y` l.1218–1222, 1244–1246 as in round 2 ✓. 5.2: vistoli1989
l.1570–1599; stacks-chow §37 at l.44 of the contents; fulton1998 Corollary 6.3 uncertified ✓. 5.3:
vistoli1989 l.1705–1718 (graph `γ` regular of codimension `n`, `x·_f y := γ^!(x × y)`, "formal
properties of [Fu] 8.1.1"), (5.6) l.1719–1721 ✓. 6.3: (1.17) l.428, l.372–376; stacks-chow Definition
41.1 l.3936–3940 (degree as pushforward to `CH_0(Spec k) = ℤ`); (3.6)–(3.7) l.974–997 ✓. 8.4:
Definition 3.6 l.902, l.943–962, Lemma 1.1 l.244, l.237–239, Proposition 2.4 l.674, l.1652 ✓. 10.1:
Definition 5.2 l.1282, l.1286–1298, Proposition 5.3 l.1299 and its proof l.1303–1320 (the source gap of
round 2 stands) ✓. 10.2: l.1286–1298 (`C(F^•)` of pure dimension `rk F_0`, class of degree
`rk F_0 − rk F_1`), relative form l.1664–1667 ✓. 10.6: Proposition 7.2 l.1682–1699, Lemma 5.9
l.1397–1427 (its proof uses, at l.1416–1419, only the invariance under `T_{Y'×M}`), the standing
smoothness of the base l.1645–1647 and l.1668 ✓. 11.2: l.1539–1545 (`p^!G = p^*G ⊗ ω` for a flat
relatively Gorenstein projective `p`) ✓. 11.6: behrend1997 l.157–161 (`rk = χ(f^*T_V) = deg f^*T_V +
dim V·χ(C)`), l.193–197 (`dim M(τ) + rk`), Proposition 2 l.99–100 (`dim M(τ) = #S − #E − 3χ(τ)`, which
for one vertex of genus `g` with `n` markings is `n − 3(1 − g) = 3g − 3 + n`) ✓. Also read for the
repairs: behrend-fantechi1997 l.755–897 (Propositions 3.1–3.5, Lemma 3.2 and their proofs),
l.1376–1435 (Definition 5.8, Lemma 5.9, Proposition 5.10), l.1436–1498 (proof of 5.10), l.1598–1616
(Proposition 6.2), l.1700–1739 (Propositions 7.3–7.5); behrend1997 l.133–200 (Propositions 4–5);
kresch1999b l.30–60, 300–405.

**Adversarial pass (sampled targets, headline theorems, every target a repair or a finding touched).**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.4 `β` not `T_Y`-invariant (new Check) | `𝔸²`, origin, `Y' = {y = 0}` | `C_{u^*C/C} = {ν = 0}`, `ρ^*C_{X'/Y'} = {η = 0}`, `W_2(𝔸³) = k(𝔸³)^×`, `β = c·ν/η`; `T_Y` acts by translation (Lemma 3.2, `p_{2*}(t, n) = n + t`); `η ↦ η + b` gives `c·ν/(η + b)`; also `ν ↦ ν + n` would move `{ν = 0}` | Proposition 3.5 false as stated; Check correct | none |
| 4.4 Proposition 3.4 restated | `Ỹ = Y × Y` via `p_1`, same `Y, X, Y'` | `Ỹ' = {y_1 = 0}`, `C̃ = T_0𝔸⁴`, `β(Ỹ', X) = c·ν/η_1 = α_1^*(c·ν/η)`; via `p_2`: `c·ν/η_2 = α_2^*(c·ν/η)` with `α_2 = p_{2*}` the action | holds, and the two differ, as the design says | none |
| 8.5 invariance, `Y'` pulled back | `p = y : 𝔸² → 𝔸¹`, `𝔅' = {0}`; node `𝔐 = Spec k[a,b]/(ab)`, `W = 𝔐 × 𝔸¹`, `𝔐' = V(a + b)` | `Y ×_𝔅 Y = {y_1 = y_2} ≅ 𝔸³`, `Ỹ' = {y = 0}` for both projections, `β(Ỹ', X) = c·ν/η`, both pullbacks equal, `ξ`-translation fixes `c·ν/η`; `a + b ∉ (a) ∪ (b)` is a nonzerodivisor, `k[a,b]/(ab, a+b) = k[a]/(a²)`, `Ω_W` fibre `3` at the node (`a·db + b·da = 0` vanishes there) and `2` elsewhere, `T_{W/𝔐} = O`, `W ×_𝔐 W = 𝔐 × 𝔸²`, diagonal `{s = t}` regular with normal bundle `O`, both projections pull `W'` back to `𝔐' × 𝔸²`; `Y ×_𝔅 Y` smooth over reduced `Y` is reduced of pure dimension, so 4.4 applies to it | holds | none |
| 8.5 invariance, `Y'` not pulled back | `p = x : 𝔸² → 𝔸¹` | `T_{Y/𝔅} = ⟨∂_y⟩`, `c·ν/(η + b) ≠ c·ν/η` | hypothesis needed; negative Check correct | none |
| 8.5 route: projection and action | identification (6) of Lemma 3.2 | `(n_1, n_2) ↦ (n_2 − n_1, n_1)`; `p_{1*} = n`, `p_{2*} = n + t`; `C_{X/Y×_𝔅Y} = i^*T_{Y/𝔅} ×_X C` by Proposition 3.1 for `X → Y ×_𝔅 Y → Y` (unramified diagonal, `p_1` smooth with `T_{p_1} = p_2^*T_{Y/𝔅}`) | `proj^*β = act^*β` | none |
| 8.5 deduced statement | `Y' ⊆ Y` regular, both smooth over `𝔐`; `Y' = Y`; `𝔐 = Spec k` | `0 → I/I² → Ω_{Y/𝔐}|_{Y'} → Ω_{Y'/𝔐} → 0` exact with locally free cokernel, so `df_1, …, df_c` independent along `Y'`, `(f_i) : Y → 𝔸^c_𝔐` smooth on a neighbourhood of `Y'` (restrict to it, legitimate by Proposition 3.3), `Y' = (f_i)^{−1}({0} × 𝔐)`, `T_{Y/𝔅}|_{Y'} = ker(T_{Y/𝔐} → f^*T_{𝔸^c})|_{Y'} = T_{Y'/𝔐}`; `𝔸^c × 𝔐` reduced of pure dimension; `X → Y ×_𝔅 Y ⊆ Y ×_𝔐 Y` (closed substack) stays a local embedding; `c = 0`: `β = 0`; `𝔐 = Spec k`: Kresch Theorem 3.1 | holds | R01 (locator) |
| 8.5 degenerate cases | `p` étale; `𝔅' = 𝔅` | `T_{Y/𝔅} = 0`; `N = 0`, ideal of `Y'` zero, `β = 0` | holds | none |
| 10.6 regular case | `𝔅 = 𝔐`, `Y = W`, `Y' = W ×_𝔐 𝔐'`; origin of `𝔸¹`, `M = 𝔸¹ × Y`; `𝔐 = Spec k[ε]/(ε²)` | `W'` pulled back from `𝔐`, invariance under `T_{W/𝔐}|_{U'}`, descent to `N ×_𝔐 [C_{U/W}/T_{W/𝔐}]`; gluing over relative local embeddings by Proposition 3.4 (4.4); `v^![𝔸¹ × Y] = [Y]`; non-reduced base: flat case only | holds | none |
| 10.7 second case | `v` regular local embedding; `v = Z × 𝔸¹ → Z`; `v` lci not an embedding | `Y = Z ×_𝔐 W`, `Y' = Z' ×_𝔐 W` smooth over `𝔐`, deduced invariance under `T_{Y'/𝔐} = T_{Z'/𝔐} ⊕ T_{W/𝔐}`, matching Lemma 5.9's `T_{Y'×M}`; smooth case `[X, E]^vir × [𝔸¹]`; graph `(z, t) ↦ (z, t, z)` regular of codimension `dim Z`, route needs the factorisation and `pr^*Ω_{Z'/𝔐} ⊕ pr^*E` | statement true; route incomplete | R02 |
| 9.2 lci ⇒ pure dimension `vd` | hypersurface in `𝔸^n`; `W` of pure dim `m + d`, `U` regular of codim `c`; `Spec k → Spec k[ε]` | `vd = n − 1 = dim`; a regular sequence cuts each generic local dimension by `c`, so `dim = m + d − c`, `rk τL = d − c`; not lci, `vd = −1 ≠ 0`, no claim | holds | none |
| 8.1 `K_{U,W} = [I/I² → Ω]` | `k[x]/(x²) ⊆ 𝔸¹`; `BG`; `f = id` | `(x²)/(x⁴) → A dx`, `x² ↦ 2x dx`, `0` in char `2`; `I = 0`; `K = 0` | matches | none |
| 11.5 needs | the statement | global resolution (7.3), theory (11.4), class (10.2); 11.4's *Needs* exclude 11.5 | consistent, no cycle | none |
| 1.3 dimension | `BG`; `[𝔸¹/μ₂]`; `Spec k` with atlas `𝔸¹`; `B𝔾_m`; `∅` | `0`; `1`; `1 − 1 = 0`; `0 − 1 = −1`; `−∞` (Remark 12.4) | matches 12.1–12.5 | none |
| 1.5 degrees | `BG → pt`; `pt → BG`; `𝔸¹ → pt`; coarse map of `[𝔸¹/μ₂]`; `Bμ₂ → {0}`; char `p` quotient | `(1/|G|)·1`; `(|G|/1)·1`; product `1`; `[k(t) : k] = ∞ ⇒ 0` and `dim 1 ≠ 0`; `(1/1)·1 = 1`, representable and integral; `(1/2)·1`; `V(x)` carries the trivial `ℤ/p`-action, `𝒱 = 𝔸¹_y × B(ℤ/p)`, `e = p`, `[k(y) : k(y^p)] = p`, `(1/p)·p = 1 = p/p` | matches (1.15)–(1.17) | none |
| 2.1 cycles | `BG`; `[V(x²)/μ₂]`; descent on `[𝔸¹/μ₂]` | `Z_0(BG) = ℤ`; length of `k[x]/(x²)` is `2`, so `2·[Bμ₂]`; `s^{−1}(a) = {(a, ±1)}` and `t^{−1}(a) = {(a, 1), (−a, −1)}` differ for `a ≠ 0`, so `[a]` is not in the image but `[a] + [−a]` is | matches (3.1), (3.5), 10.3 | none |
| 3.4 push–pull, localisation | `pt → BG` against itself; `Bμ₂ ⊆ [𝔸¹/μ₂]`; two points of `ℙ¹` | `Spec k ×_BG Spec k = G`, both sides `|G|·[pt]`; `ℤ → ℤ/2 → A_0([𝔾_m/μ₂]) = A_0(𝔾_m) = 0` exact, `2 ↦ 0`; `ℤ² → ℤ` not injective | matches Lemma 3.9, 19.3, 15.2 | none |
| 3.5 exterior product | `K/k` separable of degree `2`; `K = k(a^{1/p})`; `BG × BH` | `K ⊗ K = K × K`, `2 + 2 = 2·2`; `K[t]/((t − a^{1/p})^p)` local of length `p`, `p·[Spec K]`, `p² = p·p`; `B(G × H)` | matches l.1707 | none |
| 4.3 Gysin maps | `{0} → 𝔸¹` through `z ↦ z²`; `Spec k → BG` with `Y = Spec k`; zero section | `U = Spec k[z]/(z²)`, `C_{U/T} = N` over `U` of length `2`, `s^*[C] = 2·[pt]`; `U = G`, `N = 0`, `C_{U/T} = U`, `f^![pt] = [G]`, pushforward `|G|·[pt]`; `s^! = (π^*)^{−1}` and `s^![𝓜] = c_r(E) ∩ [𝓜]` | matches (3.10), 3.19 | none |
| 5.2 Chern classes | `O(−1)` on `ℙ¹`; `BG`; `L ⊕ L^∨` | `−1`; `A_{−i}(BG)_ℚ = 0`; `(1 + x)(1 − x)`: `c_1 = 0`, `c_2 = −x²` | matches | none |
| 5.3 products | `BG`; `[ℙ¹/μ₂]`; `ℙ¹` | `A^*(BG)_ℚ = ℚ`; `[𝒫]·[𝒫] ∈ A_{−1} = 0`, `[𝒫]·[𝓜] = [𝒫]`, `∫ = 1/2`; `[pt]·[pt] ∈ A_{−1} = 0`, unit `[ℙ¹]` | matches l.1705–1721 | none |
| 6.1 (headline) | `BG`; `[𝔸¹/μ₂]`; char `p`; char `0` | `(1/|G|)[pt]`; `ℤ/2 → 0`, `p_*[Bμ₂] = (1/2)[0]`; `deg = p/p = 1 ≠ 1/p`, `k(y^p)` not perfect; `ℚ ⊆ k(p(𝒱))` perfect | matches (2.4)–(2.5), (6.1) | none |
| 6.3 (headline) | `BG`; `Spec K`; `ℝ`-gerbe; `[ℙ¹/μ₂]` | `1/|G|`; `[K : k]`; `2/4 = 1/2` (not `1/4`); `div(x²/(x² − 1)) = 2[𝒫] − [𝒪]` (order `2` at `0`, `−1` at `±1`, `0` at `∞`), `2·(1/2) = 1 = [k : k]/1` | matches (1.17), 41.1 | none |
| 8.4 `N` vb stack ⟺ `τL` perfect | fat point; `Spec k → Spec k[ε]`; étale; smooth | `(x,y)²/(x,y)⁴` of length `3 + 4 = 7 ≠ 9`; `I = (ε)`, `I/I² = k`, `τL = k[1]`, `N = 𝔸¹`, `C = Spec k[t]/(t²)`; `N = M`; `BT` | both directions hold | none |
| 8.5 pure dimension (headline) | `k[x]/(x²) ⊆ 𝔸¹`; fat point; embedded point; `Spec k → B𝔾_m` | `C = [M × 𝔸¹/T]` of dimension `0`; `dim C = 0 ≠ dim N = 1`; `Sym(I/I²) ≅ gr_I` via `I = xJ`, not a vector bundle, depth `0`; `B𝔾_a` of dimension `−1 = m` | consistent with 3.11, 3.12 as corrected | none |
| 9.3 (headline) | char `2`, `k[x]/(x²)`, `φ = (0, id)`; smooth `M`; `ℙ¹`, `[O(1) →0 Ω]` | `φ^*ω = 0` yet `(x + ax²)² = x² ≠ 0` in `k[x]/(x³)`; `φ^∨ = id_{BT}`; zero section of `C(O(1)) × BT`, closed immersion, not iso | matches 4.5 | none |
| 10.1 global resolutions | `E = 0`; `Ω_M[0]`; `ℙ¹`, `[O(−4) →0 Ω]` | `K_1 = 𝔸¹ × M`; ranks `n + g` both ways; `End_D = k ⊕ k ⊕ H¹(O(−2)) = k³`, chain maps `k²`, homotopies `H⁰(O(−2)) = 0`, so `1 + ξ` is an automorphism not from a chain map | holds | none |
| 10.2 (headline) | smooth `M`, `E = Ω[0]`; `ℙ¹`, `[O(1) →0 Ω]`; `vd < 0` | `[M]`; `F_1` = total space of `O(−1)`, `0^!0_*[ℙ¹] = c_1(O(−1)) ∩ [ℙ¹]` of degree `−1` (`+1` with the wrong dualisation); `0` | matches 5.2, Convention 7 | none |
| 10.3–10.5, 10.8 (headline) | `E = 0` two resolutions; `F ⊕ [G →id G]`; `[O(a) →0 Ω]`; `[O^s → 0]`; `ℙ¹ × ℙ¹`; `Z(x² + y²) ⊂ ℙ¹`; `BG` | `[M] = [M]`; unchanged by 5.1; `−a`, `0` for `a = 0`; `A_{−s} = 0`; `(−1)² = 1`; `2`; `1/|G|`, `𝔐 × B` reduced iff `𝔐` is | match | none |
| 11.2 duality | `V = O`, genus `g`; `L` of degree `d`; `ω_C`; nodal fibre | `R⁰ = O`, `R¹` rank `g`, trace `R¹π_*ω ≅ O`; `d + 1 − g`; `g − 1`; `2g(Ẽ) − 2 + #branches`; `π^! = π^* ⊗ ω[1]` for relative dimension `1` | matches l.1539–1545 | none |
| 11.4 (headline) | `X = pt`; `ℙ¹ → ℙ^r`; elliptic `C → C` | `E = 0` iff étale; `H¹(F^*T) = 0`, `dim = (r + 1)d + r`; `Ob = H¹(O) = k` trivial on translates, `vd = 0`, class `0` | matches 6.2 | none |
| 11.5 (headline) | `V = O` on a smooth curve; double line | `π_*G = π_*H = 0`, `χ = 1 − g`; `H⁰(L^{−N}) ≠ 0` possible, prestable fibres reduced | matches Proposition 5 | none |
| 11.6 (headline) | lines in `ℙ²`; CY3; `X = pt` | `3 + 2·1 + (0 − 3) = 2`; `0 + 0 + 3g − 3 + n + 3(1 − g) = n`; `vd = b` | matches l.157–161, 193–197, Proposition 2 | none |
| Conventions 4–8 | `[𝔸¹/μ₂]`; `BG`; `C(O(1))` on `ℙ¹`; `[O(1) →0 Ω]`; separated DM | `ℤ/2` vs `0`; `1/|G|`, `|G|`, product `1`; total space of `O(−1)`, degree `−1`; `rk 0`, `Ob = O(−1)`; finite diagonal is affine | witnesses consistent across layers | none |

**Shape and completeness.** Headings in TauCetiRoadmap form; every layer ends with Examples and
Dependencies; every definition has its API and at least three discriminating Checks (plan: none under
three); every theorem states its hypotheses and a locator; standing hypotheses (Conventions 1–3, 8, the
Layer 8 and Layer 10 preambles) are in scope where used. Lean form, elaboration, the `#check`
comparison and the one-tactic probe: not available (design stage, no `Suggested.lean`; this lane does
not elaborate).

**Headline theorems (from the Summary).** The coarse-space comparison (6.1), the degree of zero-cycles
(6.3), the intrinsic normal cone of pure dimension `dim 𝔐` (8.5), the characterisations of obstruction
theories (9.3), the virtual class with its properties (10.2–10.8), the obstruction theory of spaces of
maps from curves (11.4–11.6). None is statable at the pins (no Deligne–Mumford or algebraic-stack
carrier in Mathlib or Tau Ceti at the pins); the package's module docstring must name each and the
missing carrier.

**Ownership.** `roadmaps grep` over main and the open pull requests: "intrinsic normal cone" and "Chow
groups of DM stacks" have no match; "virtual fundamental class" matches only ImplicitAtlases (the
topological class, named in the scope section as a different object); "canonical rational equivalence"
matches only an unrelated sentence of CohomologyComparisonsPartII; "Vistoli" matches bibliographies
(Arsie–Vistoli, Abramovich–Vistoli) and EquivariantIntersectionTheory's appendix citation, none of them
Vistoli's Chow theory. This roadmap is the owner. Ownership against open pull requests whose files the
brief does not provide was not checked beyond the grep tool.

**Declared gaps.** None declared; none needed (every prerequisite resolves).

**Manifest.** 21 entries recorded by the author, unchanged; this review fetched kresch1999b (arXiv
alg-geom/9710011v2, open repository, certified) through the sources service, which added it as the
22nd entry with `cited_for` 4.4 and 8.5; its placeholder locator is corrected under R01. No local path
in the manifest.

## Not verifiable

- gillet1984 §4 and fulton1998 §1.10, Corollary 6.3, Proposition 8.1.1, Appendix B.6.6: settled as
  uncertified; cited by locator only.
- kresch1999b: read in the arXiv version v2; the published numbering (Invent. Math. 136 (1999),
  483–496) could not be compared (paywalled), so the design should cite the version read, as the
  manifest's `version_note` records.
- Lean elaboration, the `#check` comparison and the one-tactic probe: not available at the design stage.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, printed page 26: the source says Vistoli's
  rational equivalence is invariant under the whole tangent bundle of the ambient smooth stack; it
  should say invariant under the tangent bundle of the regularly embedded substack when that substack
  is pulled back from a smooth base (for `𝔸²`, the origin and the line `{y = 0}`, `β = c·ν/η` moves
  under `η ↦ η + b`); affects a stated result (and the proof of Lemma 5.9, which uses only the true
  part); corrected in print at kresch1999b Theorem 3.1, with the remark at its lines 340–343.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, printed page 10: the source
  names the acting group as the tangent bundle of the arbitrary substack `Y'` restricted to `X'`; it
  should be the tangent bundle of the smooth substack `X` (the proof acts by `𝔸^m = T_X`, and the
  tangent bundle of `Y'` acts trivially on the normal cone of `Y'`); affects a stated result (the
  intended meaning is clear from the proof).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a1f6327c7b2a664fa8874e6da420614108259761", "job": "REV-DESIGN-VirtualFundamentalClasses~3", "model": "fable", "worker": "chris-x17"} -->
