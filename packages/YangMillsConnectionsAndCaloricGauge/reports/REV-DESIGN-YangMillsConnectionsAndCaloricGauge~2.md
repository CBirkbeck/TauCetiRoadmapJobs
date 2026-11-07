<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7643#issuecomment-6713789864 -->
Review (claude) of 32137ba

Verdict: needs_changes

1. **F01** (P2) §10.5 claims the div–curl bound on a σ-range its input §9.5 does not supply

   - Location: `design/README.md` line 1590: "`‖b‖_{Ḣ^σ} + ‖c‖_{Ḣ^{σ+1}} ≲_{Q,E} ‖w‖_{Ḣ^σ}` for `−1 < σ < 1`",
     with *Needs:* "8.2, 9.5, 10.2–10.4" (line 1606); `design/plan.json` line 2099 (test statement
     "(−1<σ<1)"); against line 1441: "the linearised solution with data `b ∈ Ḣ^σ`, `0 ≤ σ ≤ 1` … has a
     limit `B_∞` in `Ḣ^σ`" and line 1446 "the statement above keeps the range that is proved".
   - Claim: for `a ∈ 𝒞_Q` of energy `≤ E`, every `w ∈ L²` decomposes as `w = b − D(a)c` with the bound in
     `Ḣ^σ` for all `−1 < σ < 1`.
   - Witness: the source proves Proposition 7.9(1) for `−1 < σ < 1` by solving the linearised flow with data
     `w` and taking `W(∞) = −∇c`, "by Corollary 5.15 (see also Lemma 5.33), the map `w → W(∞)` is bounded in
     `Ḣ^σ`" (OhTataru-YMHF lines 3381–3384). Corollary 5.15 claims `−1 < σ < 2` (line 1954), but its proof,
     Lemma 5.33(2), is stated and proved for `0 ≤ σ ≤ 1` only (lines 2515–2516, 2538–2549). The README
     follows the lemma in §9.5 (round 1, F10) and therefore has no target giving `B_∞` for `−1 < σ < 0`;
     §10.5's route needs exactly that. The roadmap does not agree with itself on `σ ∈ (−1, 0)`.
   - Repair (either closes the gap; tested on `G = U(1)`, `σ = −½`, where `W(∞)` is the gradient part of `w`
     and the Helmholtz projection is bounded on `Ḣ^{−1/2}`, so both options are consistent):
     (a) extend §9.5's linearised limit to `−1 < σ < 1` (and `σ = 1`, `ℋ`), with the route the source's
     proof already uses for `0 ≤ σ < 1` (lines 2538–2549) and which runs unchanged for `σ ∈ (−1, 0)`: the
     infinitesimal de Turck trick, `F_{0j} → 0` in `Ḣ^σ` by 8.3 (`−2 < σ < 2`), the `L¹` bound of 8.3 at
     index `σ + 1 ∈ (0, 1)` giving `‖D^ℓF_{ℓ0}‖_{L¹Ḣ^{σ+1}} ≲ ‖b‖_{Ḣ^σ}`, hence `A₀ → a_{0,∞}` in `Ḣ^{σ+1}`,
     and the product bound `Ḣ¹ × Ḣ^{σ+1} → Ḣ^σ` on `ℝ⁴` (valid for `σ + 1 ∈ (0, 1)`, PDE §7.3) for
     `DA₀ → D(a_∞)a_{0,∞}`; keep the clause that Lemma 5.33(2) writes `0 ≤ σ ≤ 1` and say the negative
     range is proved here by the same route; update `plan.json` 9.5 accordingly; or
     (b) state §10.5's first bound for `0 ≤ σ < 1` only, with one clause that the source's Proposition 7.9
     asserts `−1 < σ < 1` on the strength of its Corollary 5.15, whose proof covers `0 ≤ σ ≤ 1`; update
     `plan.json` 10.5 and its test. Option (a) keeps §10.5 as the source states it and is preferred.

2. **F02** (P3) The §2.2 route's cut-off cannot be smooth as described when `W` reaches `∂U`

   - Location: `design/README.md` lines 546–547: "with a cut-off `h` vanishing on `V` and off a compact
     subset of `X` and equal to `1` on `W`".
   - Claim: the route produces `O'` equal to `O` almost everywhere off `U` and smooth on `W`, in particular
     (lines 543–545) smooth approximants on every ball `B` with closure in `X` (the case `U = W = B`, `V = ∅`).
   - Witness: `X = ℝ^d`, `U = W = B₁`, `V = ∅`. A smooth `h` with `h = 1` on `B₁` is `1` on `∂B₁`, so it is
     not `0` off `B₁` near the boundary; where `h > 0` off `U` the mollified map `O_δ` differs from `O`, so
     "equal to `O` off `U`" fails; and if instead `h = 0` off the closure of `U`, `h` is discontinuous on
     `∂B₁`. The source avoids this by working on `U` only (OhTataru-TopClass lines 1049–1050, Lemma 3.2's
     `O' ∈ G^{k,d/k}(U)` with no condition off `U`).
   - Repair: "with a smooth `h : X → [0, 1]` vanishing on `V` and off `U` and positive on `W`"; `O_δ` is then
     smooth on `{h > 0} ⊇ W` (an inhomogeneous mollification with positive radius) and equals `O` where
     `h = 0`, which is off `U` and on `V`; the disjoint closures of `V` and `W` are exactly what such an `h`
     needs. The statement of §2.2 is unchanged. Tested on the witness: `h` positive on `B₁`, `0` off `B₁`,
     smooth; `O_δ = O` off `B₁`, smooth on `B₁`, `π_G ∘ O_δ → O` in `W^{k,d/k}(B₁)`.

Files reviewed: `packages/YangMillsConnectionsAndCaloricGauge/design/README.md` (1655 lines, 10 layers,
52 targets), `design/plan.json` (52 targets, 111 tests, 4 declared gaps), `sources.toml` (12 entries).
Previous review: REV-DESIGN-YangMillsConnectionsAndCaloricGauge (ten findings), repair report
FIX-DESIGN-YangMillsConnectionsAndCaloricGauge~2. Elaboration: not available (this lane does not
elaborate; a design has no `Suggested.lean`). Two findings, one blocking (P2). No finding re-raises a
settled one.

## Verified sound

**Round-1 findings, repair by repair** (each passage quoted at most in part):

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) DG Layers 8 and 10 dropped by the open DG revision | Scope lines 80–82: "DifferentialGeometry owns … the Brouwer degree … (Layer 10, items 10.3–10.5)"; contract line 273; §6.4 route lines 1033–1037 cite DG 10.3–10.4 and AlgebraicTopology Stage 6 item 5; no "Layer 8" or "de Rham theorem" remains (grep). Part (ii) (a DeRhamCohomologyAndDuality contract) marked not applied with a reason | Part (i) repaired. Part (ii) settled: the reason holds. At the DeRhamCohomologyAndDuality head its lines 9 and 50 import "Sard on manifolds and the degree (layer 10)" from DifferentialGeometry and state no degree; at the DifferentialGeometry head (the open revision) the headings jump from Layer 5.6 to Layer 12 and its line 261–263 hands the degree to DeRhamCohomologyAndDuality. The degree with `∫ f*ω = deg·∫ω`, homotopy invariance and `deg id = 1` is stated only on main (DG README lines 877–897, 10.3–10.5). Citing a roadmap for a target it lacks would be a false citation, and stating the degree here would re-plan main. Not re-raised; see the maintainer note below |
| F02 (P3) §5.3 identity for the inverse gauge | line 870: "`(O'_(∞)⁻¹ P O_(∞));x = Ad(O'_(∞)⁻¹P)B − Ad(O'_(∞)⁻¹)B'`", with the source's direction named (line 873) and a new Check (lines 879–883) | Repaired; identity re-derived (table) |
| F03 (P3) §8.4 compatibility on the wrong envelope | lines 1315–1316: "`c_k` of the hypothesis a `(−δ, S)` envelope and `d^{σ,p}_k` a `(−δ, S)` envelope for `b` in `Ẇ^{σ,p}` that is `δ`-compatible with `c_k`"; inhomogeneous part likewise (1318–1319); §8.2 "`1`-compatible with `c_k`" (1274) | Repaired; matches OhTataru-YMHF lines 1353–1355, 1518–1519, 1111–1112 |
| F04 (P3) §7.2 locator | lines 1096–1097: "the quantitative ε-regularity, which the cited sources do not state and which is proved here by the route below from 4.1 and 4.3"; Uhlenbeck-LpCurvature removed from §7.2 and from its `cited_for` | Repaired |
| F05 (P3) Poincaré is PDE §1.5 | line 551: "PDE §1.2, §1.4 (Sobolev embedding …) and §1.5 (Poincaré on balls)"; contract line 222; PDE main line 855 is §1.5 | Repaired |
| F06 (P3) local retraction at the pin | contract lines 205–210 cite `TauCeti.exists_contMDiffOn_normalRetraction` with its exact content; §1.2 route lines 358–369 | Repaired; declaration at `TauCeti/Geometry/Manifold/TubularNeighborhood/LocalInverse.lean:46` |
| F07 (P3) §6.4 comparison owned by AlgebraicTopology | line 1037: "`deg h · [S³]` by AlgebraicTopology Stage 6, item 5"; AT main lines 86–87 and 1560–1567 | Repaired |
| F08 (P3) process language, FourManifolds subsection | lines 94–96: "FourManifolds states … (§5.3) … FourManifolds does not consume this roadmap"; §4.1 Check line 739; FourManifolds head lines 2542–2550 state the unit-ball `SU(2)` lemma under §5.3 | Repaired |
| F09 (P3) gap bundling | two slugs `lp-neumann-ball` (lines 234–240) and `lp-divcurl-normal-ball` (lines 242–248), same in `plan.json` `gaps` | Repaired; each gap tested (table) |
| F10 (P3) §9.5 range | lines 1441–1446: `0 ≤ σ ≤ 1` with the clause on Corollary 5.15 | Repaired as asked; the consequence for §10.5 is R01 |

**Gate.** Output of the dependency check (no UPWARD or CYCLE line):

```
candidate: YangMillsConnectionsAndCaloricGauge is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2370 edges, 0 problem(s)
```

**Citation resolver** (`roadmaps resolve` on the README): cross-roadmap citations found nowhere: none;
Lean names found nowhere: none.

**Principles.** General compact `G ⊆ U(N)`, not assumed connected; `d ≥ 3` wherever the sources allow,
`d = 4` only where energy criticality is used. No re-planned roadmap: PDE, SmoothBundlesConnections,
CharacteristicClasses, DifferentialGeometry, AlgebraicTopology, LieGroups, Yamabe are consumed by
section; FourManifolds' `SU(2)` unit-ball lemma is the stated special case of §4.1; §7.6's BPST potential
on `ℝ⁴` is the kept variant of FourManifolds' `S⁴` instanton with its difference in one clause. No
computational algorithm; no copied passage (statements paraphrased with line locators); no LaTeX
delimiters, pull-request numbers, dates, round labels, machine paths or process words (grep of the
README for all of these: empty). No backticked name of the roadmap's own (grep `YangMills.`: none), as
fits a design.

**Supplier sections resolved (file and line, on main unless said).** PDE: §1.2 (720), §1.4 (803), §1.5
(855), §1.6 (905), §2.2 (1148), §2.3 (1187), Layer 5 (1827, Dirichlet only; grep "Neumann" finds only
Neumann series; grep "Hardy" finds only Hardy–Littlewood), §6.1 (2221), §6.3 (2309), §7.1 (2668), §7.2
(2719), §7.3 (2785). SmoothBundlesConnections B3.1 (871), B4.1 (979), B4.2 (1010). CharacteristicClasses
C4 (1321). DifferentialGeometry Layer 0 (268), Layer 1 (311), Layer 5 (503, with 5.3–5.4), Layer 10
(877; 10.3–10.4 integral formula and `degree`, 10.5 homotopy invariance, `degree_id`). AlgebraicTopology
Stage 6 item 5 (1560–1567: "the homological characterization … for the shared manifold degree"; lines
86–87 compare it with DG 10's smooth degree), Stage 8 item 3 (1684–1693: absolute Hurewicz through
pointed sphere maps, `π_n(X) ≅ H_n(X;ℤ)` for `(n−1)`-connected `X`, `n ≥ 2`). LieGroups
(`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`): Layer 0 (233), Layer 1 (261), Layer 2
(275), Layer 6 (383: maximal tori, Weyl group, Weyl integration; no root `𝔰𝔲(2)` subalgebras). Yamabe Y2
(150; item 1 at 157–158 with `Y(Sⁿ) = n(n−1)Vol(Sⁿ)^{2/n}`). FourManifolds at its open head: §5.3
(2542–2550) states the unit-ball Coulomb gauge with `d*a = 0`, `a(ν) = 0`,
`‖a‖_{W^{1,2}} + ‖a‖_{L⁴} ≤ C‖F‖_{L²}` modulo constants; Layer 5 introduction (2288–2289) states
`E(A) = 8π²k + 2‖F_A⁺‖²` and BPST on `S⁴`. Every `*Needs:*` line resolves to a target, one of these
sections, a pinned declaration or a declared gap (read line by line).

**Overlaps (`scratch/overlaps.md`).** No open pull request changes this roadmap. One cited id is dropped
by an open revision: DifferentialGeometry Layer 10 (README line 1051 and the contract at line 273), dropped
at the DifferentialGeometry head, whose named successor DeRhamCohomologyAndDuality imports it back at its
head and states no degree. The content exists at no open head; the README cites it where it exists (main).
This is the round-1 F01 part (ii), marked not applicable by the repair with a reason that I verified;
not re-raised. For the maintainer: whichever of the two open pull requests ends up stating the Brouwer
degree, this roadmap's §6.4 and its DifferentialGeometry contract will cite that one. No id of this
roadmap is cited elsewhere. Closest open roadmaps by vocabulary: InstantonFloerTheory (consumes
FourManifolds for `SU(2)`, owns an `SO(3)` adapter only), IncompressibleFlows (unrelated),
FourManifolds (above), SobolevDifferentialForms (owns real-valued Sobolev forms, the `L²` Gaffney identity
on the cube and Picard compactness; its line 48 excludes "the `Lᵖ` Hodge decomposition and closed range
for `p ≠ 2`", so it does not own the `W^{1,p}` estimate of `gap:lp-divcurl-normal-ball`), PDE (the open
revision is in the older lanes format; its Neumann material is the `H¹` energy method only). Second-owner
search with `roadmaps grep -i` over main and every open head: "caloric", "instanton number", "Hardy's
inequality", "Yang-Mills heat": no match; "Uhlenbeck": FourManifolds §5.3 (`SU(2)`, cited), InstantonFloerTheory
(consumer of FourManifolds), Ornstein–Uhlenbeck elsewhere; "Gaffney": SobolevDifferentialForms (above) and
CongruenceSpectralGap (unrelated). Ownership against the open pull requests named in the brief was checked
with these tools.

**Declared gaps.** `lp-neumann-ball`: precise (`1 < p < ∞`, `d ≥ 2`, inhomogeneous data `∂_νu = ν·V`,
`V ∈ W^{1,p}`, compatibility `∫f = ∫ν·V`, `W^{2,p}` solution unique up to constants with the estimate),
minimal (PDE Layer 5 is Dirichlet only; Mathlib and Tau Ceti have no Neumann problem), same slug in
`plan.json` and README. `lp-divcurl-normal-ball`: precise (1-forms with vanishing normal trace,
`‖a‖_{W^{1,p}} ≤ C(‖da‖_p + ‖div a‖_p)`), minimal (no owner at the pins or in any roadmap, see Overlaps),
declared in both. `hardy-inequality`: precise (constant `p/(d−p)`, `1 ≤ p < d`), minimal (grep of Mathlib
and Tau Ceti for Hardy's inequality: none), declared in both. `compact-su2-subalgebra`: precise (an
`𝔰 ≅ 𝔰𝔲(2)` attaining `γ₀`, with the route through a highest root and Mathlib's
`LieAlgebra.IsKilling.exists_isSl2Triple_of_weight_isNonZero`; OhTataru-TopClass Lemma 6.4, lines
2381–2401, read: `|[A,B]| ≤ sup_α|α||A||B|` with equality on a highest-root `𝔰𝔲(2)`), minimal
(LieGroups Layer 6 has none), declared in both. `neededBy` in `plan.json` equals the README's `*Needs:*`
gap lines (4.1; 5.2, 5.3, 6.1; 7.7). None has supplier `none`.

**Pinned declarations opened** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`; paths under `Mathlib/` and
`TauCeti/`): `Matrix.unitaryGroup` (`LinearAlgebra/UnitaryGroup.lean:105`, an `abbrev`),
`Matrix.specialUnitaryGroup` (`:278`), `NormedSpace.exp_add_of_commute`
(`Analysis/Normed/Algebra/Exponential.lean:521`), `Matrix.isUnit_exp`
(`Analysis/Normed/Algebra/MatrixExponential.lean:145`), `ContinuousMap.Homotopic`
(`Topology/Homotopy/Basic.lean:333`) and `.equivalence` (`:354`), `HomotopyGroup`
(`Topology/Homotopy/HomotopyGroup.lean:441`, cubical), `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`
(`Analysis/FunctionalSpaces/SobolevInequality.lean:602`, `[FiniteDimensional ℝ F]`),
`MeasureTheory.Measure.toSphere` (`MeasureTheory/Constructions/HaarToSphere.lean:52`),
`homeomorphUnitSphereProd` (`Analysis/Normed/Module/Ball/RadialEquiv.lean:71`),
`Submodule.ClosedComplemented` (`Topology/Algebra/Module/Complement.lean:87`), `Orientation.volumeForm`
(`Analysis/InnerProductSpace/Orientation.lean:170`); `TauCeti.HasWeakFDerivOn`
(`Analysis/Sobolev/WeakDeriv/Basic.lean:251`), `TauCeti.Wkp` (`Analysis/Sobolev/Wkp/Basic.lean:145`),
`TauCeti.W1p.morreyRepresentative` (`Analysis/Sobolev/W1p/Morrey.lean:156`),
`TauCeti.enorm_sub_le_of_mem_ball_of_finrank_lt` (`Analysis/Sobolev/Morrey.lean:181`),
`TauCeti.exists_isOpenEmbedding_normalTube` (`Geometry/Manifold/TubularNeighborhood/Euclidean.lean:351`,
`[I.Boundaryless] [IsManifold I 2 M] [CompactSpace M]`), `TauCeti.exists_contMDiffOn_normalRetraction`
(`Geometry/Manifold/TubularNeighborhood/LocalInverse.lean:46`), `Orientation.formHodgeStar`
(`Analysis/InnerProductSpace/HodgeStar/AlternatingForm.lean:76`), `wedge_formHodgeStar_apply` (`:111`),
`formHodgeStar_formHodgeStar_of_even` (`:157`), `TauCeti.heatKernel` (`Analysis/PDE/HeatKernel/Basic.lean:76`).

**Sampled locators** (all read at the cited lines; all support the statement as written):

| Target | Locator read | Result |
|---|---|---|
| 1.4 | OhTataru-TopClass 236–255 (characteristic class, closed, `χ_f` on `ℝ^d`); OhTataru-YMHF Lemma 6.7, 2860–2883 (the 3-form `Y` with `dY = −⟨f∧f⟩`) | supports the transgression and the `d = 4` form of the third Check; the Cartan-form and `SU(2)` items are the README's own, verified by computation (table) |
| 2.1 | OhTataru-TopClass (1.5) 283–285, 964–968, 982–989 | `G^{k,p}_loc` as stated; `L^∞` by compactness |
| 2.2 | OhTataru-TopClass Lemma 3.2, 1038–1072 | statement supported (the README's variant on `X ⊇ cl U` instead of a Lipschitz `U` is sound); route slip R02 |
| 2.5 | OhTataru-TopClass Lemmas 3.20–3.22, 1623–1665 | supported; "`[id]`" read as the class of a constant map (line 1649) |
| 4.1 | OhTataru-TopClass Theorem 3.11, 1358–1395 | items (1)–(3) are the source's (1), uniqueness, (2) |
| 5.2 | OhTataru-TopClass Theorem 1.5, 361–375; OhTataru-Threshold Theorem 2.17, 1069–1075 | supported; the `L^p(B_R)` hypothesis issue is named in the README |
| 5.5 | OhTataru-TopClass Corollary 1.11, Remark 1.12, 451–466; OhTataru-Threshold Theorem 2.16, 1066–1067 | supported, including "no quantitative bound" |
| 6.1 | OhTataru-TopClass (1.4) 238–255, 430–445 | definition and continuity in `Ẇ^{1,d/2}` as stated |
| 6.3 | OhTataru-TopClass 860–868, Lemma 1.31, 901–906; OhTataru-Threshold 237–246; OhTataru-YMHF Lemma 6.7 and 6.9, 2860–2902 | supported; `χ(a) = 0` on `Ḣ¹` is Lemma 6.7 |
| 7.1 | OhTataru-YMHF (1.1)–(1.2), 124–128; OhTataru-TopClass 829–834; OhTataru-Threshold 253–266 | supported |
| 7.4 | GurskyKelleherStreets-GapTheorem Lemma 2.1 (139–153), Prop. 2.8 (242–286), (3.1)–(3.4) (293–308); (2.1) at line 134 (`⟨A,B⟩ = −½tr(AB)`) | supported; constant `√6/3` recomputed (table) |
| 9.7 | OhTataru-YMHF Theorem 6.6, 2833–2837, discussion 2841–2851, proof from 2920 | supported |
| 10.1 | OhTataru-YMHF 552–560, 584–592, Lemma 7.3, 3163–3166; OhTataru-TopClass Lemma 3.17, 1487–1496 | supported |
| 10.2 | OhTataru-YMHF Definitions 2.17, 7.1 (564–568, 3000–3001), Theorems 2.18, 2.20 (571–574, 591–592), Prop. 7.2 (3003–3008), Prop. 7.4 (3213–3216), Cor. 7.6 (3275–3276) | supported; `C¹` in `ℋ ∩ Ḣ^σ`, `σ > 1`, is Cor. 7.6 |
| 10.4 | OhTataru-YMHF Theorem 7.8, 3294–3306 | supported, including the slice `{a + b : D(a)^ℓ b_ℓ = 0}` and "`C¹` possibly no better" |

Also read for the adversarial pass: OhTataru-TopClass 1666–1686 (proof of Prop. 1.6), 2381–2405,
2440–2450; OhTataru-YMHF 1106–1114 (Thm 4.2), 1346–1357 (Thm 4.7), 1513–1522 (Thm 4.8), 1950–1957
(Cor. 5.15), 2507–2555 (Lemma 5.33), 3347–3390 (tangent spaces, Prop. 7.9); OhTataru-Threshold 905–930;
GurskyKelleherStreets-GapTheorem 34–41, 86–100, 160–175, 200–232.

**Adversarial table** (repaired passages, sampled targets, headline theorems, and every target a finding
touches; round 1's rows with computed values are relied on for the untouched text and were not recomputed
except where listed):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `SU(2)` brackets, `−tr` | `i, j, k` as given | `[i,j] = 2k`, `[j,k] = 2i`, `[k,i] = 2j` (matrix check), `|i|² = −tr(i²) = 2` | sound | none |
| 1.2 route (repaired): tube inverse smooth, nearest point unique on `{dist < ε'}` | `U(N)`, `M_t = [[1,t],[0,1]]`, `t = 1` | polar factor `U = (4+t²)^{−1/2}[[2,t],[−t,2]]`, `UᵀU = 1`, `UᵀM` symmetric positive; `|M−U|² = 0.5279 = 5 − 2√5 < 1 = |M−1|²` | sound; the Gram–Schmidt non-example is right | none |
| 1.4 `∫_{S³}Φ*ω_f` | frame `(k,i,j)` at `e₁` | `tr(kij) = −2`, `tr(kji) = 2`, `6tr(kij) = −12`; `×2π²` gives `−24π²`; `ω_f = ⅓(…)`: `−8π²` | sound | none |
| 1.4 transgression, `SU(2)`, `f = tr` | `k = 2`, `F_t = t dA + t²A∧A` | `T = 2∫₀¹tr(A∧F_t)dt = tr(A∧dA) + ⅔tr(A³)`; pure gauge `A = −R`: `⅓tr(R³)` | sound | none |
| 1.6 `γ₀(𝔰𝔲(2), −tr)` | `X = k`, `Y = i` | `|[k,i]|/(|k||i|) = 1.41421 = √2` | sound | none |
| 1.6 and 7.4 constants vs GKS | GKS (2.1) `−½tr`, all-index norm; Lemma 2.6 `|[P,P]| ≤ (2/√3)γ₀|P|²` | all-index `|ω|²` is `2|ω|²` and the all-index pairing is `2⟨·,·⟩`: `⟨ω,[ω,ω]⟩ ≤ (2√6/3)γ₀|ω|³` in the README's norm; then `uΔu ≥ ½|∇u|² − (2√6/3)γ₀u³` and `Δ(u^{1/2}) ≥ −(√6/3)γ₀u^{3/2}` | sound | none |
| 2.1 discontinuous critical map | `d = 4`, `φ = log log(1/|x|)` | with `u = log(1/r)`: `∫|∇²φ|²r³dr = ∫du/u² → 1`, `∫|∇φ|⁴r³dr = ∫du/u⁴ → ⅓` (both finite) | sound | none |
| 2.2 statement | `U = W = B₁`, `V = ∅` | `h = 1` on `B₁` and `0` off `B₁` is discontinuous on `∂B₁`; `h > 0` on `B₁`, `0` off `B₁` works | route defect | R02 |
| 2.5 extension iff constant class | `O = Φ(x/|x|)`, `d = 4` | degree `1 ≠ 0` (6.4), no `G^{2,2}` extension | sound | none |
| 3.4 / 7.6 BPST energy on `B_r` | `r = ½, 1, 2, 10, 200` | Simpson of `96π²∫₀^r s³(1+s²)^{−4}ds`: `8.2115, 39.478, 70.745, 78.934, 78.957`; formula `8π²r⁴(r²+3)/(r²+1)³`: `8.2115, 39.478, 70.745, 78.934, 78.957`; limit `8π² = 78.957` | sound | none |
| 4.1 `U(1)` Check vs gap `lp-neumann-ball` | `A = iα` | `Δφ = ∂^ℓα_ℓ`, `∂_νφ = x^ℓα_ℓ = ν·α`: `f = div α`, `V = α`, compatibility `∫div α = ∫ν·α` (divergence theorem) | the inhomogeneous gap covers the Check | none |
| gap `lp-divcurl-normal-ball` | `a = (−x₂, x₁, 0, …)`; `a = ∇φ`, `Δφ = 0`, `∂_νφ = 0` | `ν·a = −x₁x₂ + x₂x₁ = 0`, `div a = 0`, `(da)₁₂ = 2`, right side `2C|B₁|^{1/p} > 0`; harmonic Neumann gradient: `φ` constant, `a = 0`, no kernel, so no "modulo constants" is needed | sound | none |
| 5.2 flat connection | `F = 0` | `r_c = ∞`, `R_c = 0`, `O_(∞)` constant, `B = 0` | sound | none |
| 5.3 repaired identity | general Leibniz; `U(1)` | `Q = O'⁻¹PO`: `Q;x = Ad(O'⁻¹)(−O';x + P;x + Ad(P)O;x)`; from `A' = P·A`: `P;x = O';x − B' − Ad(P)O;x + Ad(P)B`, so `Q;x = Ad(O'⁻¹P)B − Ad(O'⁻¹)B'`. `U(1)`: `dθ' = dθ + dψ`, left `i(−dθ' + dψ + dθ) = 0`, right `0`; exchanged form `2i dψ ≠ 0` | sound; source's form is for `A = O·A'` (line 1671) | none |
| 5.3 conclusion | `[P] = [c]`, `[Q] = [c'']` | `O' = P O Q⁻¹ ≃ c O c''⁻¹` | sound | none |
| 5.5 trivial class | `−ηO;x`, `O = Φ(x/|x|)` | `χ = −8π²` (6.2 Check) while `χ = 0` on `Ḣ¹` (6.3) | sound | none |
| 6.1 `U(1)`, dilation | `A = iα`; `A_λ` | `χ_f = ∫dα∧dα = 0`; `f(F[A_λ]∧F[A_λ])(x) = λ⁴f(F∧F)(λx)`, integral invariant | sound | none |
| 6.3 identities | general | `ℰ = ∫|F⁺|² + ∫|F⁻|²`, `χ = ∫|F⁻|² − ∫|F⁺|²`; `ℰ − χ = 2∫|F⁺|²`, `ℰ + χ = 2∫|F⁻|²`; BPST (`F⁺ = 0`): `χ = ℰ = 8π²`, `c₂ = 1` | sound, consistent with 6.4 (`deg = −1`) and 7.6 | none |
| 6.4 route (repaired) | `h = Φ⁻¹∘O`, `ω = Φ*ω_f` | `∫h*(Φ*ω_f) = deg h·∫Φ*ω_f` (DG 10.3–10.4) and `h*Φ*ω_f = O*ω_f`; `O = Φ`: `c₂ = −1`; BPST: `deg = (−1)³ = −1`, `c₂ = 1`; constant: `0` | sound | none |
| 7.1 abelian example | `A = (i/2)(x₁dx₂ − x₂dx₁)`; `F = iψ(x₁)dx¹²` | `F₁₂ = i`, `∂^ℓF_ℓ2 = 0`; `∂^ℓF_ℓ2 = iψ' ≠ 0` | sound | none |
| 7.2 quantitative ε-regularity (repaired) | `F = 0`; BPST dilated `λ → 0`, `λ → ∞` | `0 ≤ 0`; `‖F_λ‖²_{L²(B₁)} ≈ 24π²λ⁴`, `|F_λ(0)| = √48λ²`, ratio bounded; `λ → ∞`: `|F_λ(0)| → ∞` with `‖F_λ‖_{L²(B₁)} → √8π`, so smallness is needed | sound | none |
| 7.5 gap constant | `u = |F⁺|^{1/2}`, `d = 4` | `Y(S⁴) = 12(8π²/3)^{1/2} = 61.562 = 8√6π`; `‖F⁺‖ ≥ 4π/γ₀`; `(4π/√2)² = 78.957 = 8π²` = BPST | sound | none |
| 7.7 ground state | `𝔰 ≅ 𝔰𝔲(2)`, `⟨φX,φY⟩ = −c tr(XY)` | `γ₀(𝔰) = √2/√c`, `ℰ(φ∘A_BPST) = 8π²c = 16π²/γ₀(𝔰)²`; source `16π²/⟨α,α⟩` (line 2445), `|α| = γ₀` (Lemma 6.4) | sound | none |
| 8.1 `ℋ ⊊ Ḣ¹` Check | `a = ∇φ`, `‖P_k div a‖ = 1/k` | `‖P_k a‖_{Ḣ¹} ≈ ‖P_k Δφ‖_{L²} = 1/k`: `Σ1/k² < ∞`, `Σ1/k = ∞` | sound | none |
| 8.2 envelope hypothesis (repaired) | Thm 4.2, lines 1111–1112 | `d_k` `1`-compatible with `c_k` | sound | none |
| 8.4 hypotheses (repaired) | Thm 4.7, 1353–1355; Thm 4.8, 1518–1519; `A = 0` | compatibility is a relation of `d` to `c`; `A = 0`: any small positive `c_k` | sound | none |
| 9.5 range (repaired) | Cor. 5.15 vs Lemma 5.33(2) | `−1 < σ < 2` claimed (1954), `0 ≤ σ ≤ 1` proved (2515–2516) | README keeps the proved range | none here; see R01 |
| 9.7 threshold | `SU(2)`; BPST; abelian | `2E_GS = 16π²`; BPST `ℰ = 8π² < 16π²` but `a ∉ Ḣ¹` (`|A| ≈ |x|^{−1} ∉ L⁴`); abelian excluded | sound | none |
| 10.1 pure gauge | `a = O⁻¹∂O` | `O·a = Ad(O)a − O;x = ∂O O⁻¹ − ∂O O⁻¹ = 0`; `(cO)⁻¹∂(cO) = a` (left constants); `O;x = Ad(O)a` | sound | none |
| 10.2 `U(1)` | `ã = iα` | `Cal(ã) = ã − ∇φ` divergence-free; pure gauge `↦ 0`; `d(Ad(c)a, a) = 0` | sound | none |
| 10.3 `U(1)` Check | divergence-free `a = iα` | `|dα|² = Σ_{i,j}(∂_iα_j)² − Σ∂_iα_j∂_jα_i`, `∫Σ∂_iα_j∂_jα_i = ∫(div α)² = 0`: `ℰ = ‖∇α‖²` | sound | none |
| 10.4 split submanifold | Hilbert sphere; cross; graph of `|x₁|` | derivative of `v ↦ (e+v)/‖e+v‖` at `0` is the inclusion; the cross has no chart; the graph has no `C¹` chart with injective derivative | sound | none |
| 10.5 range | `σ ∈ (−1, 0)`; `U(1)`, `σ = −½` | §10.5 claims `−1 < σ < 1`; §9.5 supplies `B_∞` for `0 ≤ σ ≤ 1` only; source proof uses Cor. 5.15 at `−1 < σ < 1` (3381–3384); `U(1)`: Helmholtz projection bounded on `Ḣ^{−1/2}`, so the claim is plausible but unowned on `(−1, 0)` | **defect** | R01 |
| 10.5 decomposition | `w = D(a)c₀`; `w ∈ T^{L²}_a𝒞` | `b = 0`, `c = −c₀`; `c = 0`, `Π_a w = w` | sound | none |
| plan.json ↔ README | all 52 targets | every definition has ≥ 3 tests (script); 111 tests; gap `neededBy` = README gap lines; statements of 2.2, 9.5, 10.5 match the README | sound | R01 touches 9.5 or 10.5 in both files |

**Shape.** Summary; Scope and ownership; Conventions; Exact supplier contracts (Mathlib, Tau Ceti, PDE
with three gap lines, SmoothBundlesConnections, CharacteristicClasses, DifferentialGeometry,
AlgebraicTopology, LieGroups with its gap line, Yamabe); How to read the build; ten layers each ending
with `### Examples` and `### Dependencies`; Downstream consumers; References: all present. Every theorem
carries its hypotheses in the sentence and a locator; every definition its API bullets and at least three
Checks (counted in `plan.json`); Unicode mathematics throughout.

**Headline theorems** (from the Summary; the design stage has no `Suggested.lean`, so statability is
recorded for the package stage): gauge invariance of finite energy (3.2); Uhlenbeck's lemma for every
compact `G`, `d ≥ 3` (4.1); the good global gauge theorem (5.2); well-definedness, gauge invariance and
locality of the topological class (5.4) and the trivial class (5.5); topological invariance of
characteristic numbers (6.2); the Bogomol'nyi bound (6.3); integrality and completeness of `c₂` for
`SU(2)` (6.4); the energy gap and ground state (7.5, 7.7); local well-posedness, continuation and the flat
limit (9.3–9.5); the Dichotomy and Threshold Theorems (9.6, 9.7); existence and uniqueness of the caloric
gauge (10.2); the caloric manifold with its tangent spaces and div–curl decomposition (10.4, 10.5).
Carriers at the pins: `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `HomotopyGroup`,
`ContinuousMap.Homotopic`, Tau Ceti's `W1p`/`Wkp` on open sets; not at the pins: `Ḣ¹`, `ℓ¹L²`, `ℋ`, `𝒞`
(PDE §7.1–7.2 are planned, unbuilt), so the heat-flow and caloric headlines (9.x, 10.x) will need simple
definitions in the file or a docstring note at the package stage. The one-tactic probe does not apply (no
Lean file).

## Not verifiable

- `Uhlenbeck-LpCurvature` Theorem 1.3 and `Uhlenbeck-RemovableSingularities` Theorem 4.1 (Project Euclid
  bot wall; settled uncertified): the design relies on their certified restatements OhTataru-TopClass
  Theorems 3.11–3.12, which I read.
- `FreedUhlenbeck-Instantons` Ch. 1–3, `DonaldsonKronheimer` Ch. 2–4, `Bogomolnyi-Stability`,
  `MimuraToda-TopologyLieGroups` Ch. IV–V: paywalled, settled uncertified; nothing in the targets depends on
  their text (the Bogomol'nyi bound is proved in OhTataru-TopClass Lemma 1.31 and OhTataru-YMHF Lemma 6.9,
  both read).
- Elaboration and the one-tactic probe: not available (this lane does not elaborate; no `Suggested.lean`
  at the design stage).
- The published numbering of the Oh–Tataru papers against the arXiv v2 texts read: not checked; the
  manifest records `version_note = "arXiv v2"` for each.

## Source issues

- **Gap** in OhTataru-YMHF at Proposition 7.9(1), proof, PDF page 72 (lines 3381–3384): the proof takes the
  boundedness of `w ↦ W(∞)` on `Ḣ^σ` for `−1 < σ < 1` from Corollary 5.15; it should note that Lemma 5.33(2),
  the proof of that corollary, covers only `0 ≤ σ ≤ 1`, and supply the range `−1 < σ < 0` (the same de Turck
  argument applies); affects a stated result.
- **Gap** in OhTataru-YMHF at Corollary 5.15, PDF page 42 (line 1954): the linearised limit is claimed in
  `Ḣ^σ` for `−1 < σ < 2`; its proof, Lemma 5.33(2) (PDF page 54, line 2516), gives `0 ≤ σ ≤ 1`; affects a
  stated result.
- **Misprint** in OhTataru-YMHF at Theorem 4.8, (4.34), PDF page 33 (line 1522): the exponent is `1 − α/2`
  with `α` undefined; it should be `1 − β`, as in (4.32); affects nothing.
- **Gap** in OhTataru-TopClass at Lemma 3.2, PDF page 21 (lines 1039–1050): the hypothesis is `V ∩ W = ∅`
  and the proof takes a smooth `h` equal to `0` on `V` and `1` on `W` by Urysohn's lemma; smooth Urysohn
  needs disjoint closures (two open sets with touching closures admit no such continuous `h`); it should
  assume the closures of `V` and `W` disjoint, as the roadmap does; affects the proof.
- **Error** in OhTataru-TopClass at Proposition 1.6(1), line 401, and Lemmas 3.21–3.22, lines 1634 and
  1646: for disconnected `G` the gauges at infinity are homotopic only up to left and right constants, and
  `[id]` differs from the class of a constant map (`G = {±1}`, `A = 0`); it should state connected `G` or
  the quotient by constants; affects a stated result (recorded in round 1; re-read this round).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "32137ba27fc146b4e95c3c6e14c3ba5d96014775", "job": "REV-DESIGN-YangMillsConnectionsAndCaloricGauge~2", "model": "fable", "worker": "chris-x9"} -->
