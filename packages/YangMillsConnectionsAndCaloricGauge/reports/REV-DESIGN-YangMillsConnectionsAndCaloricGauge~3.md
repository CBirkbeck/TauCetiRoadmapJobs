<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7643#issuecomment-6715778922 -->
Review (claude) of 30dfebe

Verdict: needs_changes

1. **F01** (P2) 9.5's route (and 10.5's through it) uses the decay of homogeneous covariant-heat solutions, which no target states

   - Location: `design/README.md` line 1471: "`F_{0j}` solves the homogeneous equation of 8.3 with data `b`,
     so it is bounded in `Ḣ^σ` and tends to `0` there as `s → ∞`"; lines 1471–1473 (the reduction for
     `σ < 0` "interpolate between the `L²` decay and the `Ḣ^{σ₁}` bound"); `plan.json` 9.5 statement
     ("`F_{0j} → 0` in `Ḣ^σ` by 8.3"); the same decay is what 10.5's route (line 1644) needs for
     "the flow of `b` tends to `W(∞) + ∇c = 0`".
   - Claim: for a global `Ḣ¹` heat flow with `Q(a) ≤ Q` and `b ∈ Ḣ^σ`, the solution `B` of
     `(∂_s − Δ_A − 2ad(F))B = 0`, `B(0) = b`, satisfies `B(s) → 0` in `Ḣ^σ` as `s → ∞`, attributed to 8.3.
   - Witness: 8.3 (lines 1314–1320) states well-posedness and the bounds
     `‖B‖_{L^∞Ḣ^σ} + ‖DB‖_{L²Ḣ^σ} ≲ …` and the `L¹` bound; it states no limit at `s = ∞`. The source has
     the same gap: OhTataru-YMHF line 2543 asserts "`F_{0j}` vanishes at `s = ∞` in `Ḣ^σ`" with no
     argument, and line 3404 derives `lim F_{0j} = 0` in `L²` "by the `L²` theory in Theorem 4.3", whose
     statement (lines 1187–1189) is the bound (4.10) only. Nothing in Layers 8–9 owns the decay. The
     statement of 9.5 is the source's and is not in doubt; its route has an unowned input.
   - Repair: add to 8.3 the clause "for `J = [0, ∞)`, `G = H = 0` and `B(0) ∈ L²`, `B(s) → 0` in `L²` as
     `s → ∞`; hence, for data in `Ḣ^σ`, `−2 < σ < 2`, `B(s) → 0` in `Ḣ^σ`, by density and interpolation
     with the uniform bound", with the route: for data in `Ḣ^{−1} ∩ Ḣ¹`, the `L¹` bound at `σ = 0` gives
     `‖DB‖_{L¹L²} < ∞`, so `∂_sB = D^ℓD_ℓB + 2[F, B]` with `‖D^ℓD_ℓB‖_{Ḣ^{−1}} ≲ (1 + ‖A‖_{L⁴})‖DB‖_{L²}`
     and `‖[F, B]‖_{Ḣ^{−1}} ≲ ‖F‖_{L²}‖B‖_{L⁴} ≲ ‖F‖_{L²}‖DB‖_{L²}` (diamagnetic inequality and Sobolev)
     makes `B(s)` Cauchy in `Ḣ^{−1}`; `∫‖DB‖²_{L²} < ∞` gives `DB(s_n) → 0`, hence `B(s_n) → 0` in `L⁴`, so
     the `Ḣ^{−1}` limit is `0`; the uniform `Ḣ¹` bound and interpolation give `B(s) → 0` in `L²` and in
     every `Ḣ^σ`, `−1 < σ < 1`; the remaining `σ` by the bounds at indices near `±2`. Then let 9.5's route
     cite that clause (and drop "by 8.3" from the `plan.json` 9.5 statement in favour of the new clause),
     and record the source gap in the locator. Tested on `A = 0`: `e^{sΔ}b → 0` in `L²` for `b ∈ L²` and in
     `Ḣ^{−1}` for `b ∈ Ḣ^{−1}` by dominated convergence (multiplier `e^{−4π²s|ξ|²}`), and the Cauchy
     estimate reads `‖e^{sΔ}b − e^{s'Δ}b‖_{Ḣ^{−1}} ≤ ∫_{s'}^{s}‖∇e^{τΔ}b‖_{L²} dτ`, finite for `b ∈ Ḣ^{−1}`.

2. **F02** (P3) 5.6's second locator points at a table-of-contents line

   - Location: `design/README.md` line 964: "(OhTataru-Threshold line 1074; OhTataru-TopClass line 53)".
   - Claim: the source supports `Top(4, G) ≅ π₃(G)` for connected `G` at that line.
   - Witness: OhTataru-TopClass line 53 reads "4.1. Solvability results for the inhomogeneous Gauss
     equation 35", an entry of the table of contents (page 2). The identification of classes in `d = 4`
     with `π₃(G)` is OhTataru-Threshold line 1074 (read: the topological class is the homotopy class of
     `O : S³ → G`), and the only `π₃` statements in OhTataru-TopClass are Bott's theorem and the induced
     isomorphism `π₃(SU(2)) → π₃(G)` at lines 2339–2344.
   - Repair: replace "OhTataru-TopClass line 53" by "OhTataru-TopClass lines 2339–2344" (Bott's theorem,
     used only as background) or delete it, keeping OhTataru-Threshold line 1074; same in `plan.json` 5.6.

Files reviewed: `packages/YangMillsConnectionsAndCaloricGauge/design/README.md` (1706 lines, 10 layers,
52 targets), `design/plan.json` (52 targets, 115 tests, 4 declared gaps), `sources.toml` (12 entries,
unchanged this round). Previous review: REV-DESIGN-YangMillsConnectionsAndCaloricGauge~2 (two findings,
F01 P2 and F02 P3), repair report FIX-DESIGN-YangMillsConnectionsAndCaloricGauge~3. Elaboration: not
available (this lane does not elaborate; a design has no `Suggested.lean`). Two findings, one blocking
(P2). No finding re-raises a settled one.

## Verified sound

**Round-2 findings, repair by repair.**

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) §10.5's `σ`-range not supplied by §9.5 | 9.5 (lines 1461–1468): "data `b ∈ Ḣ^σ`, `−1 < σ ≤ 1` … has a limit `B_∞` in `Ḣ^σ` … with `‖B_∞‖_{Ḣ^σ} ≲_{Q,M₁} ‖b‖_{Ḣ^σ}`"; route lines 1469–1484 with the clause on Corollary 5.15 and Lemma 5.33(2) and the `1 < σ < 2` exclusion; Check lines 1490–1495 (`U(1)`, `σ = −½`); 10.5 route lines 1638–1645 naming 9.5; `plan.json` 9.5 and 10.5 updated; PDE contract clause lines 233–235; Layer 9 and 10 Dependencies | Repaired (option (a), as preferred). The route is sound except for the decay step, R01 |
| F02 (P3) §2.2 cut-off | lines 549–557: "a smooth `h : X → [0, 1]` vanishing on `V` and off `U` and positive on `W`"; hypothesis restored to the source's `V ∩ W = ∅` (line 545); three Checks (lines 559–571) | Repaired, differently and correctly: for open `V`, `W`, `V ∩ W = ∅` gives `W ∩ V̄ = ∅` (a point of `W ∩ V̄` has the neighbourhood `W`, which meets `V`), so `W ⊆ U ∖ V̄` is open and is the positivity set of a smooth `h ≥ 0`; `O_δ` is smooth where `h > 0` and equals `O` where `h = 0`. The round-2 claim that disjoint closures are needed was wrong; the source's hypothesis is right |

**Gate.** Output of the dependency check, no UPWARD or CYCLE line:

```
candidate: YangMillsConnectionsAndCaloricGauge is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2393 edges, 0 problem(s)
```

**Citation resolver** (`roadmaps resolve` on the README): cross-roadmap citations found nowhere: none;
Lean names found nowhere: none.

**Principles.** General compact `G ⊆ U(N)`, not assumed connected; `d ≥ 3` where the sources allow,
`d = 4` only where criticality is used. No re-planned roadmap: PDE, SmoothBundlesConnections,
CharacteristicClasses, DifferentialGeometry, AlgebraicTopology, LieGroups and Yamabe are consumed by
section (each resolved below); FourManifolds' `SU(2)` unit-ball lemma is stated there as the special
case of §4.1. No computational algorithm; no copied passage; grep of the README for LaTeX delimiters,
pull-request numbers, dates, round labels, machine paths and process words ("removed", "deferred",
"optional", "so far", "checkpoint", "handoff"): empty. No backticked name of the roadmap's own, as
fits a design. Every layer ends with `### Examples` and `### Dependencies` (grep).

**Supplier sections resolved (file and line on main unless said).** PDE: §1.2 (720), §1.4 (803),
§1.5 (855), §1.6 (905), §2.2 (1148), §2.3 (1187), Layer 5 (1827; Dirichlet only, grep "Neumann" finds
only Neumann series), §6.1 (2221), §6.3 (2309), §7.1 (2668; blocks, Bernstein, heat-block estimate,
first Check on `P_{j−1}`), §7.2 (2719; homogeneous `Ḃ^s_{p,q}` with realisation for `s < d/p`), §7.3
(2785–2800: Bony's decomposition with estimates stated in `𝒞^α` only, so the PDE contract clause
"§7.3 states its estimates in `𝒞^α`" is exact and the `Ḣ^σ` product law is rightly stated as derived
here). DifferentialGeometry Layer 10 (877–897: `degreeAtRegularValue`, `∫ f*ω = deg·∫ω`, homotopy
invariance, `degree_id`). AlgebraicTopology Stage 6 item 5 (1560–1567) and Stage 8 item 3
(1684–1693: absolute Hurewicz through pointed sphere maps, `π_n(X) ≅ H_n(X;ℤ)`). LieGroups Layers 0–2
(233, 261, 275) and Layer 6 (383–395: maximal tori and Weyl group, no root `𝔰𝔲(2)` subalgebra; grep
"su(2)|sl2|root" hits only the Mathlib inventory and consumer notes). Yamabe Y2 item 1 (150–158,
`Y(Sⁿ) = n(n−1)Vol(Sⁿ)^{2/n}`). SmoothBundlesConnections B3.1 (871), B4.1 (979), B4.2 (1010–1020:
`u·A = Ad(u)A − du·u⁻¹`, `F_{u·A} = Ad(u)F_A`, exactly as the Conventions cite). CharacteristicClasses
C4 item 1 (1321–1326). FourManifolds at its open head: §5.3 (2542–2550, the unit-ball `SU(2)` lemma
with `d*a = 0`, `a(ν) = 0`, `‖a‖_{W^{1,2}} + ‖a‖_{L⁴} ≤ C‖F‖_{L²}` modulo constants) and the Layer 5
introduction (2288–2289, `E(A) = 8π²k + 2‖F_A⁺‖²`, BPST on `S⁴`). Every `*Needs:*` line of the
sampled targets and of 2.2, 8.3, 9.5, 10.5 resolves to a target, one of these sections, a pinned
declaration or a declared gap.

**Pinned declarations opened** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`; paths under `Mathlib/`,
`TauCeti/`): `Matrix.unitaryGroup` (`LinearAlgebra/UnitaryGroup.lean:105`, abbrev),
`Matrix.specialUnitaryGroup` (`:276`), `NormedSpace.exp_add_of_commute`
(`Analysis/Normed/Algebra/Exponential.lean:521`), `Matrix.isUnit_exp`
(`Analysis/Normed/Algebra/MatrixExponential.lean:145`), `ContinuousMap.Homotopic`
(`Topology/Homotopy/Basic.lean:333`) and `.equivalence` (`:354`), `HomotopyGroup`
(`Topology/Homotopy/HomotopyGroup.lean:441`), `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`
(`Analysis/FunctionalSpaces/SobolevInequality.lean:42`), `MeasureTheory.Measure.toSphere`
(`MeasureTheory/Constructions/HaarToSphere.lean:52`), `homeomorphUnitSphereProd`
(`Analysis/Normed/Module/Ball/RadialEquiv.lean:71`), `Submodule.ClosedComplemented`
(`Topology/Algebra/Module/Complement.lean:87`), `Orientation.volumeForm`
(`Analysis/InnerProductSpace/Orientation.lean:170`); `TauCeti.HasWeakFDerivOn`
(`Analysis/Sobolev/WeakDeriv/Basic.lean:251`), `TauCeti.Wkp` (`Analysis/Sobolev/Wkp/Basic.lean:145`),
`TauCeti.W1p` (`Analysis/Sobolev/W1p/Basic.lean:372`), `TauCeti.W1p.morreyRepresentative`
(`Analysis/Sobolev/W1p/Morrey.lean:156`), `TauCeti.enorm_sub_le_of_mem_ball_of_finrank_lt`
(`Analysis/Sobolev/Morrey.lean:181`), `TauCeti.exists_isOpenEmbedding_normalTube`
(`Geometry/Manifold/TubularNeighborhood/Euclidean.lean:351`, `[I.Boundaryless] [IsManifold I 2 M]
[CompactSpace M]`), `TauCeti.exists_contMDiffOn_normalRetraction`
(`Geometry/Manifold/TubularNeighborhood/LocalInverse.lean:46`), `Orientation.formHodgeStar`
(`Analysis/InnerProductSpace/HodgeStar/AlternatingForm.lean:76`), `wedge_formHodgeStar_apply` (`:40`,
`:75`), `formHodgeStar_formHodgeStar_of_even` (`:157`), `TauCeti.heatKernel`
(`Analysis/PDE/HeatKernel/Basic.lean:76`). All 23 exist at the pins.

**Sampled locators** (every one read at the cited lines):

| Target | Locator read | Result |
|---|---|---|
| 1.4 | OhTataru-TopClass 236–255 (characteristic class, closed, `χ_f` on `ℝ^d`); OhTataru-YMHF Lemma 6.7, 2860–2883 (`Y` with `dY = −⟨f∧f⟩`, `χ = 0` on `Ḣ¹`) | supports; the 3-form `Y` of line 2869 is the third Check's transgression form |
| 1.5 | OhTataru-TopClass 860–866 and Lemma 1.31, 901–906; OhTataru-YMHF Lemma 6.9, 2892–2902 | supports; the source's orthonormal basis `{dx^j∧dx^k : j<k}` (line 2894) is the Conventions' norm |
| 2.3 | OhTataru-TopClass Lemmas 3.1 and 3.3, 1000–1102; "utterly fails to be any more regular" at 1011 | supports, including the product estimate (line 1018) and `∂O⁻¹ = −O⁻¹∂O O⁻¹` (1100) |
| 3.3 | OhTataru-TopClass 1165–1200, Prop. 3.9 (1300–1309), Scenario (3) and Prop. 3.10 (1310–1347) | supports; line 1303 writes `W^{k,d/k}` for the potential against 1309's `W^{k−1,d/k}`, the misprint the README names |
| 4.3 | OhTataru-TopClass Lemmas 3.13–3.17 and Remark 3.15, 1418–1496 | supports (angular version on balls with `B ∩ B₁(0) = ∅`, 1440; continuity from `ℓ¹W^{1,d/2}`, 1487); the source's `L^{d/(n+2)}` at 1423 is `L^{d/(m+2)}` |
| 5.1 | OhTataru-TopClass 382–390 (good representative, `1 − χ ∈ C_c^∞`) and Theorem 1.3, 226–235 | supports; the README's "vanishing near `0`" strengthening is justified by its first Check |
| 5.6 | OhTataru-Threshold 1074; OhTataru-TopClass 53 | Threshold supports; TopClass line 53 is a table-of-contents entry: R02 |
| 6.4 | OhTataru-TopClass 256–264, 852–860, 2365–2372; OhTataru-YMHF 327–335, 2913–2915 | supports; "with the appropriate choices of the orientations" at 2369 as the README says |
| 7.4 | GurskyKelleherStreets-GapTheorem (2.1) at 134, Lemma 2.1 (139–153), Prop. 2.8 (242–286), (3.1)–(3.4) (293–308) | supports; `|∇ω|² ≥ (3/2)|d|ω||²` at 244, `Δ|F⁺|^{1/2}` at 307 |
| 8.4 | OhTataru-YMHF (4.20)–(4.23), 1346–1357; Theorem 4.8, 1512–1530 | supports; the `1 − α/2` exponent at 1522 against `1 − β` at 1517, as the README says |
| 9.1 | OhTataru-YMHF Definitions 5.1, 5.3, (5.4)–(5.8), Lemmas 5.2, 5.4, Remark 5.5, Prop. 5.6, 1541–1619; (1.7)–(1.8) at 146–148; (1.19) at 243; (5.21)–(5.28) at 1818–1847 | supports; the dissipation factor is recomputed below |
| 9.4 | OhTataru-YMHF (2.5) 419–425, Theorems 5.9–5.11, Corollaries 5.12–5.14, 1873–1948 | supports |
| 9.5 | OhTataru-YMHF Cor. 5.15 (1952–1957), Lemma 5.23 Case 1 (2172–2208), Lemma 5.33 (2509–2555), Theorem 4.6 (1288–1293); Remark 7.10 (3402–3405) | the statement and range are supported; the decay step is the source's own gap: R01 |
| 9.7 | OhTataru-YMHF Theorem 6.6, 2833–2837, discussion 2841–2851 | supports |
| 10.3 | OhTataru-YMHF Prop. 7.7, 3286–3290; OhTataru-Threshold Theorem 2.8, 912–917 | supports |

Also read: OhTataru-TopClass 395–430 (Prop. 1.6, Def. 1.8, Prop. 1.9), 430–466 (Cor. 1.10–1.11, Remark
1.12), 2339–2344; OhTataru-YMHF 1187–1200 (Theorem 4.3), 1986–2000 (Lemma 5.17), 2443–2451 (Lemma
5.31), 3363–3390 (Prop. 7.9); OhTataru-Threshold 237–246, 905–930, 1060–1076.

**Adversarial table** (repaired passages, sampled targets, headline theorems and every target a
finding touches; round 2's rows with computed values are relied on for the untouched text):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.2 with `V ∩ W = ∅` (repaired) | open `V = (−1,0)`, `W = (0,1)` | `V̄ = [−1,0]`, `W ∩ V̄ = ∅`; `U ∖ V̄ ⊇ W` open; `x ∈ W ∩ V̄` would give `W ∩ V ≠ ∅` | sound | none |
| 2.2 route: `O_δ` smooth on `{h > 0}`, equal to `O` on `{h = 0}` | `O_δ(x) = (δh(x))^{−d}∫ζ((x−z)/(δh(x)))O(z)dz` | smooth in `x` where `h > 0` (`h` smooth, `O ∈ L¹_loc`); `x ↦ x − δh(x)y` has differential `I − δ y⊗∇h`, invertible for `δ‖∇h‖_∞ < 1` on `cl U`, so `O_δ ∈ W^{k,d/k}_loc` | sound | none |
| 2.2 Check 1 | `U = W = B₁`, `V = ∅` | `h = 1` on `∂B₁` forces `h > 0` on a neighbourhood meeting `ℝ^d ∖ B₁`; bump `exp(−1/(1−|x|²))` has values in `(0, e^{−1}]` on `B₁` | sound | none |
| 2.2 Check 2 | `V = B₁∩{x₁<0}`, `W = B₁∩{x₁>0}` | at `0`, an Urysohn `h` has limits `0` and `1`; `exp(−1/x₁)·bump > 0` iff `x₁ > 0` and `|x| < 1` | sound | none |
| 2.2 Check 3 and finite `G` | `V = U`, `W = ∅`; `G = {±1}` | `O' = O`; locally constant a.e. maps are already smooth where `h > 0` | sound | none |
| 9.5 range (repaired) | `σ = −½, 0, ½, 1`; `σ = −1`; `1 < σ < 2` | Theorem 4.6 and Lemma 5.23 Case 1 need `−1 < σ < 1`; `σ = 1` by the div–curl route (2530–2537); `1 < σ < 2` claimed at 1954 and proved nowhere | `−1 < σ ≤ 1` is the right range | none |
| 9.5 product bound `Ḣ¹ × Ḣ^{σ+1} → Ḣ^σ` on `ℝ⁴` | `s₁ = 1`, `s₂ = σ+1` | `s₁ + s₂ − d/2 = σ`; needs `s₁, s₂ < 2` and `s₁ + s₂ > 0`: `σ < 1` and `σ > −2`; scaling `λ^{σ−2}` on both sides | sound for `−2 < σ < 1` | none |
| 9.5 data of the `D^ℓF_{ℓ0}` equation | `D^ℓ b_ℓ = ∂^ℓ b_ℓ + [a^ℓ, b_ℓ]` | `Ḣ¹ × Ḣ^σ → Ḣ^{σ−1}` needs `σ < 2`, `σ + 1 > 0`: holds on `(−1, 1)` | sound | none |
| 9.5 `L¹` bound index | 8.3's clause `‖DB‖_{L¹Ḣ^σ} ≲ ‖B(0)‖_{Ḣ^{σ−1}} + ‖G‖_{L¹Ḣ^{σ−1}}`, `−1 < σ < 1` (Theorem 4.6, 1288–1290) | with `B := D^ℓF_{ℓ0}` it yields `D(D^ℓF_{ℓ0}) ∈ L¹Ḣ^σ`, i.e. `D^ℓF_{ℓ0} ∈ L¹Ḣ^{σ+1}` | sound | none |
| 9.5 decay of `F_{0j}` | `A = 0`, `b ∈ Ḣ^σ` | `e^{sΔ}b → 0` in `Ḣ^σ` by dominated convergence; general `A`: no target states it, source lines 2543 and 3404 assert it from Theorem 4.3's bounds | **unowned route input** | R01 |
| 9.5 interpolation for `σ < 0` | `σ = −½`, `σ₁ = −1`, `θ = σ/σ₁ = ½` | `Σ2^{−k}a_k² ≤ (Σ2^{−2k}a_k²)^{1/2}(Σa_k²)^{1/2}`; data in `L² ∩ Ḣ^{σ₁}` dense in `Ḣ^σ`, uniform bound transfers | sound given the `L²` decay | none |
| 9.5 curl identity | `B_∞ = D(A_∞)a_{0,∞}` | `D_kD_j a₀ − D_jD_k a₀ = [F_{kj}(A_∞), a₀] = 0`; `[A_∞, a_{0,∞}] ∈ Ḣ^σ` by the product bound | sound on `(−1, 1]` | none |
| 9.5 `U(1)` Check, `σ = −½` | `b = ∇ψ + b^{df}` | `∂_sB = ΔB − ∇div B`: `∇ψ` static, `e^{sΔ}b^{df}` with `∫|ξ|^{−1}e^{−8π²s|ξ|²}|b̂^{df}|²dξ → 0`; Helmholtz multiplier `ξξ^T/|ξ|²` has norm `1` and commutes with `P_k`, so `‖B_∞‖ ≤ ‖b‖` | sound | none |
| 10.5 route (repaired) | `W(∞) = −∇c` | `div W(∞) = −Δc`, so `c = −Δ⁻¹∂^ℓW(∞)_ℓ`, `‖c‖_{Ḣ^{σ+1}} ≈ ‖W(∞)‖_{Ḣ^σ}`; `D(A(s))c → D(0)c = ∇c` for caloric `a` by `A → A_∞ = 0` in `Ḣ¹` and the product bound; `[a, c] ∈ Ḣ^σ` for `−2 < σ < 1` | sound | none |
| 10.5 route vs its Checks | `U(1)`; `w = D(a)c₀`; `w ∈ T^{L²}_a𝒞` | `W(∞) = ∇Δ⁻¹div w`, `c = −Δ⁻¹div w`, `b = w − ∇Δ⁻¹div w` (Leray); `W(∞) = ∇c₀`, `c = −c₀`, `b = 0`; `W(∞) = 0`, `c = 0`, `b = w` | agrees with all three | none |
| PDE contract §7.3 clause (repaired) | PDE main 2795–2800 | estimates in `𝒞^α` only; `𝒞^α × 𝒞^β → 𝒞^α` for `α < 0 < β` | the `Ḣ^σ` law is derived here, not cited: exact | none |
| 1.5 Bogomol'nyi, equality case | `F = X(dx¹² + dx³⁴)` | `⋆F = F`, `|F|² = 2|X|²`, `⟨F∧F⟩` coefficient `2⟨X,X⟩ = 2|X|²` | equality | none |
| 1.5 strict case | `F = X dx¹²` | `F^± = ½X(dx¹² ± dx³⁴)`, `|F⁺|² = |F⁻|² = ½|X|²`, `|F|² = |X|²`, `⋆⟨F∧F⟩ = 0` | strict | none |
| 1.5 formula `⋆⟨F∧F⟩ = |F⁺|² − |F⁻|²` | `F = X dx¹² + Y dx³⁴` | `⟨F∧F⟩ = 2⟨X,Y⟩ dx¹²³⁴`; `|F⁺|² = ½|X+Y|²`, `|F⁻|² = ½|X−Y|²`, difference `2⟨X,Y⟩` | sound | none |
| 1.5 wrong normalisation | all-index sum `8(⟨F₁₂,F₃₄⟩ − …)` | first Check gives `8|X|² > 2|X|²` | refuted, as the Check says | none |
| 5.1 BPST good representative | `O = Φ(x̄/|x|)` | `O;x = Im(dx̄ x)/|x|² = −Im(x̄dx)/|x|²` (since `conj(x̄dx) = dx̄ x`), so `−O;x = Im(x̄dx)/|x|²`; `B = A_BPST + O;x = −Im(x̄dx)/(|x|²(1+|x|²))` off `B₂`, `|B| ≈ |x|^{−3}`, `|∇B| ≈ |x|^{−4}`; `∫|x|^{−12}r³dr`, `∫|x|^{−8}r³dr < ∞` | `B ∈ Ḣ¹` | none |
| 5.6 based vs free, connected `G` | `O` free; based `H` | `O ≃ O(e₁)⁻¹O` along a path from `O(e₁)⁻¹` to `1`; `H(t,e₁)⁻¹H(t,·)` is based; `G×G` acts trivially on `[S³,G]` by the same paths | bijection `Top(4,G) ≅ π₃(G)` | locator only, R02 |
| 5.6 `U(1)` | `π₃(U(1)) = 0` | one class, matching 5.4's `[S^{d−1}, U(1)]` a point | sound | none |
| 6.4 sign | `O = Φ`; BPST `O = Φ(x̄/|x|)` | `∫_{S³}Φ*ω_f = −8π²` so `c₂ = −1 = −deg Φ`; reflection `(x₁,x₂,x₃,x₄) ↦ (x₁,−x₂,−x₃,−x₄)` has degree `(−1)³ = −1`, `c₂ = 1 = χ/8π²` for anti-self-dual `F` | consistent with 6.2, 6.3, 7.6 | none |
| 7.4 cubic constant | GKS `−½tr`, all-index norm; BPST | `⟨ω,𝔉_ω(ω)⟩ ≤ (2√6/3)γ₀|ω|³` in this norm (round 2); `Δ(u^{1/2}) ≥ −(√6/3)γ₀u^{3/2}`, `u = |F⁺|`; 1.6 Check: `24√2λ³ = (2√6/3)√2(6λ²)^{3/2}` | sound | none |
| 8.4 Checks | `A = 0`, `b = P_k b`; `β = 0`, constant `P_kG` | `‖e^{sΔ}P_kb‖_p ≲ e^{−c4^ks}‖P_kb‖_p` beats `(1+2^{2k}s)^{−N}`; Duhamel gives `‖B‖ ≈ s‖G‖ = (2^{2k}s)2^{−2k}‖G‖` for `s ≲ 2^{−2k}` | sound | none |
| 9.1 energy identity factor | `U(1)`, `a = αe^{2πiξ·x}`, `ξ·α = 0` | `|f|² = 4π²|ξ|²|α|²e^{−8π²|ξ|²s}`, `d/ds = −32π⁴|ξ|⁴|α|²e^{…}`; `Σ_j|∂^ℓf_ℓj|² = 16π⁴|ξ|⁴|α|²e^{…}`; covariantly `dℰ/ds = −2∫Σ_k|D^ℓF_ℓk|²` | factor `2` for `ℰ = ∫|F|²`; source's (1.19), (5.11) print `1` | none (Source issues) |
| 9.4 `Q` dilation invariance | `F_λ(s,x) = λ²F(λ²s, λx)` | `λ⁶·λ^{−4}·λ^{−2} = 1` | sound | none |
| 9.4 BPST | `|A_BPST| ≈ |x|^{−1}` | `∫|x|^{−4}r³dr = ∞`: not in `L⁴`, not in `Ḣ¹` | sound | none |
| 10.3 `U(1)` Check | divergence-free `a = iα` | `|dα|² = Σ_{i,j}(∂_iα_j)² − Σ∂_iα_j∂_jα_i`, `∫Σ∂_iα_j∂_jα_i = ∫(div α)² = 0` | `ℰ = ‖∇α‖²` | none |
| plan.json ↔ README | all 52 targets | 115 tests; every definition has `≥ 3` tests (script); `neededBy` of the four gaps equals the README's gap `*Needs:*` lines (4.1; 4.1; 5.2, 5.3, 6.1; 7.7); statements of 2.2, 9.5, 10.5 match the README | sound | R01 touches 8.3 and 9.5 in both files; R02 touches 5.6 |

**Overlaps (`scratch/overlaps.md`).** No open pull request changes this roadmap. The one dropped id,
DifferentialGeometry Layer 10 (README line 1073 and the contract at line 276), is unchanged from round
2: at the DifferentialGeometry head (lines 258–263 and 1378–1386) the Brouwer degree is handed to
DeRhamCohomologyAndDuality, whose head (lines 9 and 50) imports "the degree (layer 10)" from
DifferentialGeometry and states none; the degree exists only on main, where the README cites it. This
is the round-1 F01 part (ii), marked not actionable with a reason I re-verified; not re-raised. For the
maintainer: whichever open pull request ends up stating the degree, §6.4 and the DifferentialGeometry
contract will cite it. No id of this roadmap is cited elsewhere. Closest open roadmaps: InstantonFloerTheory
(`SU(2)` consumer of FourManifolds), IncompressibleFlows (unrelated), FourManifolds (above),
SobolevDifferentialForms (its 7.1 is the `L²` Gaffney identity on the cube and its scope line
excludes "the `Lᵖ` Hodge decomposition and closed range for `p ≠ 2`"; it is not earlier in the merge
order, so even its `p = 2` case cannot be a supplier here), PDE (its open revision's Neumann material,
Lane G items 31–32, is the `H¹` weak formulation only, so `gap:lp-neumann-ball` asks for nothing it
provides). Second-owner greps with `roadmaps grep -i` over main and every open head: "caloric",
"Yang-Mills heat", "Hardy's inequality", "instanton number", "div-curl": no match; "Neumann problem":
PDE revision only (above); "Gaffney": SobolevDifferentialForms and CongruenceSpectralGap (unrelated).
Ownership against the open pull requests named in the brief was checked with these tools.

**Declared gaps.** All four unchanged since round 2 and re-read: `lp-neumann-ball` (precise: `1 < p < ∞`,
`d ≥ 2`, inhomogeneous data `∂_νu = ν·V`, compatibility, `W^{2,p}` solution unique up to constants
with the estimate; minimal: PDE Layer 5 on main is Dirichlet only and the open revision is `H¹`),
`lp-divcurl-normal-ball` (precise; minimal: no owner at the pins, on main, or earlier in the order),
`hardy-inequality` (precise with constant `p/(d−p)`; minimal), `compact-su2-subalgebra` (precise;
minimal: LieGroups Layer 6 has none). Same slug in `plan.json` and the README; none has supplier `none`.

**Shape.** Summary; Scope and ownership; Conventions; Exact supplier contracts; How to read the build;
ten layers each ending with Examples and Dependencies; Downstream consumers; References. Every theorem
carries its hypotheses in the sentence and a locator; every definition its API bullets and at least
three Checks; Unicode throughout.

**Headline theorems** (from the Summary; recorded for the package stage, which has the `Suggested.lean`):
gauge invariance of finite energy (3.2); Uhlenbeck's lemma for every compact `G`, `d ≥ 3` (4.1); the
good global gauge theorem (5.2); well-definedness, gauge invariance and locality of the topological
class (5.4) and the trivial class (5.5); topological invariance of characteristic numbers (6.2); the
Bogomol'nyi bound (6.3); integrality and completeness of `c₂` for `SU(2)` (6.4); the energy gap and
ground state (7.5, 7.7); local well-posedness, continuation and the flat limit (9.3–9.5); the Dichotomy
and Threshold Theorems (9.6, 9.7); existence and uniqueness of the caloric gauge (10.2); the caloric
manifold with its tangent spaces and div–curl decomposition (10.4, 10.5). Carriers at the pins:
`Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `HomotopyGroup`, `ContinuousMap.Homotopic`, Tau
Ceti's `W1p`/`Wkp`; not at the pins: `Ḣ¹`, `ℓ¹L²`, `ℋ`, `𝒞` (PDE §7.1–7.2 planned, unbuilt), so the
heat-flow and caloric headlines will need simple definitions or a docstring note at the package stage.
The one-tactic probe does not apply (no Lean file).

## Not verifiable

- `Uhlenbeck-LpCurvature` Theorem 1.3 and `Uhlenbeck-RemovableSingularities` Theorem 4.1 (Project
  Euclid bot wall; settled uncertified): the design relies on their certified restatements
  OhTataru-TopClass Theorems 3.11–3.12.
- `FreedUhlenbeck-Instantons`, `DonaldsonKronheimer`, `Bogomolnyi-Stability`,
  `MimuraToda-TopologyLieGroups`: paywalled, settled uncertified; no target depends on their text.
- Elaboration and the one-tactic probe: not available (this lane does not elaborate; no `Suggested.lean`
  at the design stage).
- The published numbering of the Oh–Tataru papers against the arXiv v2 texts read: not checked; the
  manifest records `version_note = "arXiv v2"` for each.

## Source issues

- **Gap** in OhTataru-YMHF at Lemma 5.33(2), proof, PDF page 55 (line 2543): the proof asserts that the
  homogeneous covariant-heat solution `F_{0j}` vanishes at `s = ∞` in `Ḣ^σ`; it should prove the decay,
  which Theorem 4.3 (bounds only) does not give; affects the proof.
- **Gap** in OhTataru-YMHF at Remark 7.10, PDF page 72 (lines 3402–3404): the `L²` decay of `F_{0j}` is
  taken from "the `L²` theory in Theorem 4.3"; it should note that Theorem 4.3 states bounds and supply
  the decay argument; affects the proof.
- **Misprint** in OhTataru-YMHF at (1.19), PDF page 6 (line 243), and Proposition 5.6, (5.11), PDF
  page 34 (lines 1612–1619): the energy dissipation is printed with factor `1` for the energy
  `½∫⟨F_jk, F^{jk}⟩`; it should be `2∫Σ_k|D^ℓF_ℓk|²`; affects nothing.
- **Gap** in OhTataru-YMHF at Corollary 5.15, PDF page 42 (lines 1954–1955): the linearised limit is
  claimed in `Ḣ^σ` for `−1 < σ < 2`; its proof, Lemma 5.33(2), writes `0 ≤ σ ≤ 1`, and its argument
  extends to `−1 < σ < 1` but not to `1 < σ < 2`; affects a stated result (recorded in round 2; re-read).
- **Misprint** in OhTataru-TopClass at Proposition 3.9, PDF page 26 (line 1303): the global potential is
  said to lie in `W^{k,d/k}(B_R)`; it should be `W^{k−1,d/k}`, as the estimate at line 1309 reads;
  affects nothing.
- **Misprint** in OhTataru-TopClass at Lemma 3.13, PDF page 29 (line 1423): the conclusion is printed
  as `L^{d/(n+2)}` with `n` undefined; it should be `L^{d/(m+2)}`; affects nothing.
- **Error** in OhTataru-TopClass at Proposition 1.6(1), line 401, and Lemmas 3.21–3.22, lines 1634 and
  1646: for disconnected `G` the gauges at infinity are homotopic only up to left and right constants;
  it should state connected `G` or the quotient by constants; affects a stated result (recorded in
  rounds 1–2; re-read).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "30dfebe67e33f84fdccc6c74b776cca242065e1f", "job": "REV-DESIGN-YangMillsConnectionsAndCaloricGauge~3", "model": "fable", "worker": "chris-x9"} -->
