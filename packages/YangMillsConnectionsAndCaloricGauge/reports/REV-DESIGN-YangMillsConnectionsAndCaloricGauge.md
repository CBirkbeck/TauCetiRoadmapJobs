<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7643#issuecomment-6702212552 -->
Review (claude) of 9a5d985

Verdict: needs_changes

1. **F01** (P2) DifferentialGeometry Layers 8 and 10 are dropped by the open DifferentialGeometry revision

   - Location: `design/README.md` line 251 ("Layer 8 (the de Rham theorem) and Layer 10 (`degree`, …)"),
     line 986 ("DifferentialGeometry Layer 10's integral formula"), line 1002 ("*Needs:* … DifferentialGeometry
     Layers 8 and 10").
   - Claim: the de Rham theorem and the Brouwer degree with its integral formula are supplied by
     DifferentialGeometry Layers 8 and 10.
   - Witness: on main both layers exist (DifferentialGeometry README lines 816 and 877, with
     `integralTopForm_mpullback_eq_degreeAtRegularValue_mul`, `degree_id` and homotopy invariance at 10.3–10.5).
     At the head of the open DifferentialGeometry revision (pull request 886, head a565de6) the heading list
     runs Layer 5.6 → Layer 12: Layers 6–11 are gone, and its "Relation to sibling roadmaps" paragraph assigns
     "the de Rham theorem … the Brouwer mapping degree" to DeRhamCohomologyAndDuality. DeRhamCohomologyAndDuality
     at its head (pull request 1768) does not state them: its Scope imports "the absolute de Rham isomorphism
     (layer 8)" and "Sard on manifolds and the degree (layer 10)" from DifferentialGeometry. So the citation
     breaks when 886 merges and resolves nowhere at the open heads (`scratch/overlaps.md`, "Ids this README
     cites that an open pull request drops").
   - Repair: (i) drop the Layer 8 route entirely: the only use of the de Rham theorem is the comparison of the
     homological degree with the smooth degree in §6.4, which AlgebraicTopology Stage 6.5 on main already owns
     (AlgebraicTopology README lines 86–87: "Stage 6.5 compares its homological degree characterization with
     DG10's smooth mapping degree"); cite it (see R07). (ii) For the degree itself cite the content where it is
     at each head: in `## Exact supplier contracts` add a DeRhamCohomologyAndDuality subsection stating that the
     Brouwer degree with `∫ f*ω = deg · ∫ ω`, `deg id = 1` and homotopy invariance is DifferentialGeometry
     Layer 10 on main and, by DifferentialGeometry's own ownership paragraph, DeRhamCohomologyAndDuality's once
     that revision merges, and add DeRhamCohomologyAndDuality to `plan.json`'s `suppliers`. The intake then sees
     the dependency on the open revision (rule "only an open revision defines"). Tested on the instance: §6.4's
     route needs exactly `∫_{S³} O*ω_f = deg(Φ⁻¹∘O) ∫_{S³} Φ*ω_f`, homotopy invariance and `deg id = 1`, all of
     which the main Layer 10 text states at 10.3–10.5.

2. **F02** (P3) The route identity of §5.3 is written for the inverse gauge transformation

   - Location: `design/README.md` line 834: "`(O_(∞)⁻¹ P O'_(∞));x = Ad(O_(∞)⁻¹P)B' − Ad(O_(∞)⁻¹)B`" after
     "`A' = P·A`" (line 829).
   - Claim: with `A' = P·A`, `A = −η'O_(∞);x + B`, `A' = −η'O'_(∞);x + B'`, the displayed identity holds off `B₂`.
   - Witness (computed): `G = U(1)`, `B = B' = 0`, `O = e^{iθ}`, `O' = e^{iθ'}`, `P = e^{iψ}`. `A' = P·A` gives
     `dθ' = dθ + dψ`. Left side `(O⁻¹PO');x = i(−dθ + dψ + dθ') = 2i dψ`; right side `0`. False unless `dψ = 0`.
     The source's identity (OhTataru-TopClass line 1673) is for `A = O·A'` (line 1671), i.e. for `P⁻¹`. With
     `A' = P·A` the correct identity is `(O'_(∞)⁻¹ P O_(∞));x = Ad(O'_(∞)⁻¹P)B − Ad(O'_(∞)⁻¹)B'`: on the
     witness, `i(−dθ' + dψ + dθ) = 0` ✓.
   - Repair: replace the identity by the corrected one (or write `A = P·A'`). The theorem statement is unaffected.

3. **F03** (P3) §8.4 attaches the compatibility condition to the wrong envelope

   - Location: `design/README.md` line 1261: "with `c_k` a `δ`-compatible `(−δ, S)` envelope and `d^{σ,p}_k` a
     `(−δ, S)` envelope for `b`".
   - Claim: hypotheses of OhTataru-YMHF Theorem 4.7.
   - Witness: OhTataru-YMHF line 1353–1355: `c_k` is a `(−δ, S)` envelope for `A` as in (4.20); `d^{σ,p}_k` is a
     `(−δ, S)` envelope for `b` "which is δ-compatible with `c_k`". Compatibility is a relation of `d` to `c`
     (Definition 3.4, line 915); "`c_k` δ-compatible" alone has no meaning.
   - Repair: "with `c_k` a `(−δ, S)` envelope for `A` in (4.20) and `d^{σ,p}_k` a `(−δ, S)` envelope for `b` in
     `Ẇ^{σ,p}` that is `δ`-compatible with `c_k`".

4. **F04** (P3) §7.2's quantitative ε-regularity has no supporting locator

   - Location: `design/README.md` §7.2 (lines 1042–1051): "there is `ε > 0` such that `‖F‖_{L²(B₁)} ≤ ε` implies
     `‖D^{(n)}F‖_{L^∞(B_{1/2})} ≲_n ‖F‖_{L²(B₁)}`", cited to OhTataru-YMHF Theorem 2.1, OhTataru-Threshold
     Theorem 1.5 and Uhlenbeck-LpCurvature.
   - Witness: OhTataru-YMHF line 275–276 states only smoothness up to an `H²_loc` gauge; OhTataru-Threshold
     line 269–274 likewise; Uhlenbeck-LpCurvature's manifest locator is Theorem 1.3, the Coulomb-gauge lemma.
     None states the bound.
   - Repair: either mark the bound as proved here from §4.1 and §4.3 by the bootstrap route the section already
     sketches (then the locator is "this roadmap, §§4.1, 4.3"), or cite Uhlenbeck-RemovableSingularities by its
     locator for the classical ε-regularity, recording the theorem number as uncertified.

5. **F05** (P3) Poincaré on balls is PDE §1.5, not §1.4

   - Location: `design/README.md` line 519: "*Needs:* PDE §1.2 and §1.4 (Poincaré on balls, Sobolev embedding …)".
   - Witness: PDE README line 803 "### 1.4 Embeddings (A4)" and line 855 "### 1.5 Poincaré and Sobolev–Poincaré
     (A5)"; §1.4 has Morrey and the Sobolev embeddings only.
   - Repair: cite PDE §1.5 for Poincaré and keep §1.4 for the embedding; add §1.5 to the PDE supplier contract.

6. **F06** (P3) §1.2 does not cite the local retraction the pin already has

   - Location: `design/README.md` line 201: Tau Ceti's normal tube "gives no smoothness of the inverse, which §1.2
     adds".
   - Witness: `TauCeti/Geometry/Manifold/TubularNeighborhood/LocalInverse.lean:46`,
     `TauCeti.exists_contMDiffOn_normalRetraction`: near every point of a `C^{n+1}` Euclidean immersion a `C^n`
     retraction `r` with `y − f(r y)` normal, defined on an open set containing the image of a patch. That is the
     local nearest-point map with its smoothness.
   - Repair: cite it in the Tau Ceti contract and in §1.2's route; §1.2 keeps the global statement (uniqueness of
     the nearest point on a neighbourhood of compact `G`, the formula for `dπ_G`).

7. **F07** (P3) §6.4 re-derives a comparison AlgebraicTopology owns

   - Location: `design/README.md` line 988: "the comparison of the homological degree with DifferentialGeometry's
     degree through the de Rham theorem".
   - Witness: AlgebraicTopology README lines 86–87: Stage 6.5 compares its homological degree with DG 10's smooth
     mapping degree.
   - Repair: cite AlgebraicTopology Stage 6.5 and delete the de Rham-theorem route (this also removes the Layer 8
     citation of R01).

8. **F08** (P3) Process language in the Scope

   - Location: `design/README.md` line 92: "It is earlier in the merge order and does not consume this roadmap."
   - Claim: house style forbids process narrative ("merge order").
   - Repair: "FourManifolds does not consume this roadmap." The same sentence should cite the subsection: at the
     head of FourManifolds (pull request 936) the unit-ball Coulomb gauge is §5.3 ("All-charge compactification
     and obstruction gluing", lines 2545–2550), not the layer introduction; fix line 705 ("FourManifolds Layer 5's")
     and line 763 the same way.

9. **F09** (P3) The gap `lp-neumann-ball` bundles two theorems

   - Location: `design/README.md` lines 232–238 and `plan.json` gap `lp-neumann-ball`.
   - Claim: one slug asks for (a) `W^{2,p}` solvability of the scalar Neumann problem on `B₁` with the estimate and
     (b) the normal-boundary div–curl estimate `‖a‖_{W^{1,p}} ≤ C(‖da‖_p + ‖∂^ℓa_ℓ‖_p)` for 1-forms with `x^ℓa_ℓ = 0`.
   - Witness: (b) is a Gaffney-type inequality, not a corollary of (a); PDE main has neither (its Layer 5 is
     Dirichlet only, lines 1827–2202; the open PDE revision, pull request 1614, adds only the `H¹` energy-method
     Neumann problem, "Lane G", not `L^p` regularity).
   - Repair: two slugs (`lp-neumann-ball`, `lp-divcurl-normal-ball`) with one `needs` sentence each, or one slug
     whose `needs` names both statements explicitly as the two parts of one section.

10. **F10** (P3) §9.5 narrows Corollary 5.15 without saying why

   - Location: `design/README.md` §9.5: "the linearised solution has a limit `B_∞` in `Ḣ^σ`, `0 ≤ σ ≤ 1`".
   - Witness: OhTataru-YMHF Corollary 5.15 (line 1954) claims `−1 < σ < 2`; its proof, Lemma 5.33(2) (line 2516),
     gives `0 ≤ σ ≤ 1`. The README silently follows the lemma.
   - Repair: keep `0 ≤ σ ≤ 1` and say in one clause that the corollary's wider range is not proved in the source
     (as §9.6 does for `x_n → x₀`), so a reader does not take it for a slip.

Files reviewed: `packages/YangMillsConnectionsAndCaloricGauge/design/README.md` (1598 lines, 10 layers,
52 targets), `design/plan.json` (52 targets, 110 tests, 3 declared gaps), `sources.toml` (12 entries).
No previous review. Elaboration: not available (this lane does not elaborate; a design has no
`Suggested.lean`). The gate run is quoted under "Verified sound". One finding is blocking (R01, a
supplier citation that an open pull request drops); the rest are P3.

## Verified sound

**Gate.** Output of the dependency check (no UPWARD or CYCLE line):

```
candidate: YangMillsConnectionsAndCaloricGauge is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2359 edges, 0 problem(s)
```

**Principles.** General library: general compact `G`, general `d ≥ 3` where the sources allow it, `d = 4` only
where energy criticality is used (Conventions, OhTataru-YMHF lines 762–764). No re-planned roadmap: PDE,
SmoothBundlesConnections, CharacteristicClasses, DifferentialGeometry, AlgebraicTopology, LieGroups, Yamabe are
imported by section; FourManifolds' `SU(2)` unit-ball lemma is kept as the special case of §4.1 with the
difference stated in one clause (Scope), which is the resolution the target brief prescribed; §7.6's BPST
potential on `ℝ⁴` is the kept variant of FourManifolds' `S⁴` instanton, with its difference stated. No
computational algorithm, no copied passage (all statements paraphrased with line locators), no LaTeX
delimiters, no pull-request numbers, no dates, no machine paths (grep of the README).

**Supplier sections resolved (file and line).** PDE on main: §1.2 (720), §1.4 (803), §1.6 (905), §2.2 (1148),
§2.3 (1187, Riesz transforms and Mihlin–Hörmander at 1203–1216), §6.1 (2221), §6.3 (2309, built on
`TauCeti.heatKernel`), §7.1 (2668: homogeneous blocks `Ṗ_j`, Bernstein, Littlewood–Paley, the heat-block bound
`‖e^{tΔ}P_j f‖_p ≤ C exp(−c4^j t)‖P_j f‖_p`, and the first Check pinning `P_{j−1}` as the carrier of frequency
`2^j`, exactly as the Conventions say), §7.2 (2719: homogeneous `Ḃ^s_{p,q}` with the reconstruction for
`s < d/p`), §7.3 (2785); Layer 5 is Dirichlet only, no Hardy inequality anywhere (grep), so both PDE gaps are
real against main. SmoothBundlesConnections B3.1 (871, `A′ = Ad(g⁻¹)A + g⁻¹dg` for `s′ = s·g`), B4.1
(979, `Ω = dω + ½[ω∧ω]`), B4.2 (1010, `u·A = Ad(u)A − du·u⁻¹`, `F_{u·A} = Ad(u)F_A`): the README's
convention comparison is right. CharacteristicClasses C4 item 1 (1323–1329). DifferentialGeometry main Layer 0
(268), Layer 1 (311), 5.2–5.4 (Layer 5 items), Layer 8 (816), Layer 10 (877; integral formula at 10.3–10.4,
homotopy invariance and `degree_id` at 10.5) — see R01 for the open revision. AlgebraicTopology Stage 8
item 3 (1684–1693): absolute Hurewicz `π_n(X) ≅ H_n(X;ℤ)` for `(n−1)`-connected `X`, `n ≥ 2`, through pointed
sphere maps. LieGroups (`TauCetiRoadmap/RepresentationTheory/LieGroups`, on main): Layer 0 (233), Layer 1
(261), Layer 2 (275, closed-subgroup theorem with `Matrix.unitaryGroup` as an acceptance case), Layer 6 (383:
maximal tori, Weyl group, Weyl integration; no root `𝔰𝔲(2)` subalgebras), so the gap `compact-su2-subalgebra`
is real. Yamabe Y2 item 1 (150–158): `a_n∫|du|² ≥ Y(Sⁿ)(∫|u|^{p_n})^{2/p_n}` on `D^{1,2}(ℝⁿ)` with
`Y(Sⁿ) = n(n−1)Vol(Sⁿ)^{2/n}`; the README's `a₄ = 6`, `p₄ = 4`, `Y(S⁴) = 12(8π²/3)^{1/2} = 8√6π` recomputed.
FourManifolds at the 936 head: Layer 5 introduction (2225–2308) with `k = (8π²)⁻¹∫tr(F∧F)`,
`E(A) = 8π²k + 2‖F⁺‖²`, BPST on `S⁴` and the clutching comparison; §5.3 (2545–2550) the `SU(2)` unit-ball
Coulomb gauge with `‖a‖_{W^{1,2}} + ‖a‖_{L⁴} ≤ C‖F‖_{L²}`, as §4.1's Check says. InstantonFloerTheory (1083)
consumes FourManifolds for `SU(2)` and owns an `SO(3)` adapter only; SobolevDifferentialForms (1609) owns
real-valued Sobolev forms on open subsets of `ℝⁿ`, a different object from this roadmap's `𝔤`-valued
componentwise classes; IncompressibleFlows (237) is unrelated. No second owner of the general-`G` Euclidean
statements, the heat flow, the caloric gauge or the instanton number: `roadmaps grep` over main and all open
heads for "caloric", "Yang-Mills heat", "Hardy's inequality", "instanton number", "Gursky", "frequency envelope"
returns nothing; "Uhlenbeck" on main is only Ornstein–Uhlenbeck (OptimalTransport, RandomMatrices) and
SeibergWittenTheory's Coulomb representatives. Ownership against the open pull requests named in the brief was
checked with these tools.

**Pinned declarations opened.** Mathlib: `Matrix.unitaryGroup` (`LinearAlgebra/UnitaryGroup.lean:105`),
`Matrix.specialUnitaryGroup` (`:278`), `NormedSpace.exp` (`Analysis/Normed/Algebra/Exponential.lean:128`),
`NormedSpace.exp_add_of_commute` (`:521`), `Matrix.isUnit_exp` (`Analysis/Normed/Algebra/MatrixExponential.lean:145`),
`ContinuousMap.Homotopic` (`Topology/Homotopy/Basic.lean:333`) and `.equivalence` (`:354`), `HomotopyGroup`
(`Topology/Homotopy/HomotopyGroup.lean:441`, cubical), `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`
(`Analysis/FunctionalSpaces/SobolevInequality.lean:602`), `MeasureTheory.Measure.toSphere`
(`MeasureTheory/Constructions/HaarToSphere.lean:52`), `homeomorphUnitSphereProd`
(`Analysis/Normed/Module/Ball/RadialEquiv.lean:71`), `Submodule.ClosedComplemented`
(`Topology/Algebra/Module/Complement.lean:87`), `Orientation.volumeForm`
(`Analysis/InnerProductSpace/Orientation.lean:170`), `LieAlgebra.IsKilling.exists_isSl2Triple_of_weight_isNonZero`
(`Algebra/Lie/Weights/Killing.lean:556`). Mathlib has no Hardy inequality (grep: only continued fractions,
Hurwitz and Hardy's Z-function). Tau Ceti: `TauCeti.HasWeakFDerivOn` (`Analysis/Sobolev/WeakDeriv/Basic.lean:251`),
`TauCeti.W1p` (`Analysis/Sobolev/W1p/Basic.lean:372`), `Wkp` (`Analysis/Sobolev/Wkp/Basic.lean`, the
`SobolevStage` carrier with `lowerOrder`/`firstOrder`), `TauCeti.W1p.morreyRepresentative`
(`Analysis/Sobolev/W1p/Morrey.lean:156`), `TauCeti.enorm_sub_le_of_mem_ball_of_finrank_lt`
(`Analysis/Sobolev/Morrey.lean:181`), `TauCeti.exists_isOpenEmbedding_normalTube`
(`Geometry/Manifold/TubularNeighborhood/Euclidean.lean:351`, hypotheses `[I.Boundaryless] [IsManifold I 2 M]
[CompactSpace M]`, as the contract says), `Orientation.formHodgeStar`
(`Analysis/InnerProductSpace/HodgeStar/AlternatingForm.lean:76`), `wedge_formHodgeStar_apply` (`:111`),
`formHodgeStar_formHodgeStar_of_even` (`:157`), `TauCeti.heatKernel` (`Analysis/PDE/HeatKernel/Basic.lean:76`).
Tau Ceti's "Hardy" files are the circle Hardy graph and Hardy–Littlewood–Pólya references, not Hardy's
inequality on `ℝ^d`.

**Declared gaps.** `hardy-inequality`: precise (constant `p/(d−p)`, `1 ≤ p < d`, the classical sharp form),
minimal (absent at both pins and in PDE), declared in `plan.json` and the README with the same slug.
`compact-su2-subalgebra`: precise (a subalgebra `𝔰 ≅ 𝔰𝔲(2)` attaining `γ₀`, with the route through a highest
root and Mathlib's `𝔰𝔩₂`-triples), minimal (LieGroups Layer 6 on main has none), declared in both. `lp-neumann-ball`:
declared in both and real against PDE main; see R09 for its shape. None has supplier `none`.

**Sampled locators (all read at the line cited; all support the statement as written).**

| Target | Locator read | Result |
|---|---|---|
| 1.6 | GurskyKelleherStreets-GapTheorem Def. 2.3 (lines 164–172), Lemma 2.6 (207–222), Remark 2.7 (223–232); OhTataru-TopClass Lemma 6.4 (2381–2401), (6.3) line 2337–2338, 2403–2405 | `γ₀` defined as the README's; `|[A,B]| ≤ √2|A||B|` under `⟨α,α⟩ = 2`, which is `−tr` for `SU(n)`; GKS constants in their all-index norm, converted (see table) |
| 2.5 | OhTataru-TopClass Lemmas 3.20–3.22 (1623–1665) | statements match; source writes `[id]`, README's "class of a constant map" is the correct reading for disconnected `G` (Lemma 3.22's proof itself reduces to `[const]`, line 1649) |
| 3.1 | OhTataru-TopClass 283–335 | cocycle, refinement, equivalence, local potentials, curvature, `|F| ∈ L^{d/2}_loc` all as stated; source realises `G` in `O(N)`, README in `U(N)` (its own convention, equivalent) |
| 3.2 | OhTataru-TopClass 283–292; OhTataru-YMHF 103–118, 124–130 | gauge action and `F ↦ Ad(O)F` as stated |
| 3.3 | OhTataru-TopClass Props 3.9–3.10 (1300–1336), Scenarios (1)–(3) (1165–1325) | statement matches with `k = 2`; the source's `W^{k,d/k}` at line 1303 is the misprint the README names |
| 4.2 | OhTataru-TopClass Thm 3.12 (1398–1412) | matches, including extension to `A^{1,d/2}_loc(B_{1+δ})` |
| 4.3 | OhTataru-TopClass Lemmas 3.13–3.17, Remark 3.15 (1418–1496) | matches; source's `d/(n+2)` at line 1423 is a misprint for `d/(m+2)` |
| 5.1 | OhTataru-TopClass Thm 1.3 (226–235), 382–390 | good representative and gauge at infinity as stated; README's extra "η′ vanishes near 0" is justified by its own Check (`∫_{B₁}|x|^{−4} = ∞`) |
| 5.3 | OhTataru-TopClass Prop 1.6, Remark 1.7 (397–405), proof 1667–1686 | statement supported; the source's "homotopic" is for connected `G` (README's `{±1}` Check refutes it otherwise); route identity direction: R02 |
| 6.1 | OhTataru-TopClass (1.4) 238–255, 430–445 | definition and continuity in `Ẇ^{1,d/2}` as stated |
| 6.2 | OhTataru-TopClass Cor. 1.10 (445–448), 460–462 | matches |
| 6.4 | OhTataru-TopClass 256–264, 852–860, 2365–2371; OhTataru-YMHF 327–335, 2913–2915 | `c₂ = (8π²)⁻¹∫tr(F∧F) ∈ ℤ` equals the degree "with appropriate orientations" (line 2369); README fixes the sign by its Conventions and its computed Checks (table) |
| 8.1 | OhTataru-YMHF Defs 3.2–3.4, Lemma 3.5 (884–944), notation 947–954 | matches verbatim in content |
| 9.3 | OhTataru-YMHF Thm 5.9 (1873–1875), Lemma 5.16 (1963–1980), Lemma 5.26 (2338–2340) | matches; README's definition of `Ḣ¹` solutions as limits of regular ones is Lemma 5.26's |
| 9.4 | OhTataru-YMHF (2.5) 420–425, (5.40) 1940–1942, Thm 5.10 (1878–1893), Cor. 5.13–5.14 (1938–1948) | matches |

Also read for the adversarial pass: OhTataru-TopClass 121–127, 165–183, 277–279, 342–353 (Thm 1.4), 361–375
(Thm 1.5), 407–429, 451–466, 852–918 (c₂, Bogomol'nyi, Thms 1.29–1.32), 957–989, 1126–1132, 1358–1395
(Thm 3.11), 2310–2342, 2440–2450; OhTataru-YMHF 92–102, 238–246, 560–620 (Defs 2.17–2.21, Thms 2.18–2.22),
762–766, 1176–1184, 1344–1357 (Thm 4.7), 1513–1522 (Thm 4.8), 1541–1607 (Defs 5.1, 5.3, Lemmas 5.2, 5.4, (5.5)),
1612–1619 ((5.11)), 1804–1818, 1952–1957 (Cor. 5.15), 1986–2000 (Lemma 5.17), 2507–2520 (Lemma 5.33),
2560–2592 and 2600–2828 (Thm 6.1 and its proof), 2831–2837 (Thm 6.6), 2855–2869, 2903–2918 (Thm 6.10),
2998–3008 (Def. 7.1, Prop. 7.2), 3163–3166 (Lemma 7.3), 3213–3216, 3275–3282, 3284–3298 (Prop. 7.7, Thm 7.8),
3345–3388 (tangent spaces, Prop. 7.9); OhTataru-Threshold 236–246, 252–284, 905–930, 1060–1075, 428–447;
GurskyKelleherStreets-GapTheorem 34–41, 86–123, 137–153, 240–308.

**Adversarial table** (sampled targets, headline theorems, and every target a finding touches).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: gauge action sign | `U(1)`, `A = i x₁dx₂`, `O = e^{iφ}` | `F₁₂ = i`; `O·A = A − i dφ`; with the opposite sign `O·(O⁻¹·A) = A + 2i dφ ≠ A` for `dφ ≠ 0` | sound | none |
| Conventions: `⟨F∧F⟩` coefficient | pair sum over disjoint index pairs | `2(⟨F₁₂,F₃₄⟩ − ⟨F₁₃,F₂₄⟩ + ⟨F₁₄,F₂₃⟩)`; the all-index sum of TopClass (1.26) is `4×` this | sound; source misprint recorded | none |
| 1.1 `Ad`-invariance ⇒ `ad`-invariance, converse fails | `T²⋊ℤ/2`, `|e₁|² = 1`, `|e₂|² = 2` | `ad`-invariant (abelian); `Ad(swap)e₁ = e₂`, `|e₂|² = 2 ≠ 1` | sound | none |
| 1.1 `SU(2)` brackets | `i, j, k` as given | `ij = k`, `ji = −k`, `[i,j] = 2k`; `|i|² = −tr(i²) = 2` | sound | none |
| 1.2 polar factor Check | `M_t = [[1,t],[0,1]]` | `U = (4+t²)^{−1/2}[[2,t],[−t,2]]` unitary; `U*M` symmetric with `det = 1`; `|M−U|² = 4 + t² − 2√(4+t²)`; at `t = 1`: `5 − 2√5 ≈ 0.528 < 1` | sound | R06 (cite the pinned local retraction) |
| 1.3 Leibniz rule | `O = g·exp(x₁X)`, `B = Y`; `SU(2)`, `X = i`, `g = exp(πk/4)`, `Y = j` | `O;1 = Ad(g)X`; `∂₁(Ad(O)Y) = Ad(g)[X,Y] = [O;1, Ad(O)Y]`; `Ad(g)[Ad(g)i, j] = Ad(g)[j,j] = 0 ≠ 2k` | sound; source misprint recorded | none |
| 1.4 transgression for `SU(2)`, `f = tr` | `k = 2`, `F_t = t dA + t² A∧A` | `T = 2∫₀¹ tr(A∧(t dA + t²A∧A))dt = tr(A∧dA) + ⅔tr(A³)`; pure gauge: `dR = R∧R`, `F = 0`, `T = ⅓tr(R³)` | sound | none |
| 1.4 `∫_{S³}Φ*ω_f` | frame `(e₂,e₃,e₄) ↦ (k,i,j)` at `e₁` | `tr((dg g⁻¹)³)(k,i,j) = 3(tr(kij) − tr(kji)) = 3(−2 − 2) = −12`; `×2π² = −24π²`; `ω_f = ⅓(…)`: `−8π²` | sound | none |
| 1.5 Bogomol'nyi pointwise | `F = X(dx¹²+dx³⁴)`; `F = X dx¹²`; all-index normalisation | `|F|² = 2|X|²`, `⋆⟨F∧F⟩ = 2|X|²` (equality); `|X|²` vs `0` (strict); all-index would give `8|X|² > 2|X|²` | sound | none |
| 1.5 identity `⋆⟨F∧F⟩ = |F⁺|² − |F⁻|²` | general `F` | `F∧F = F∧⋆⋆F = ⟨F,⋆F⟩vol = ⟨F⁺+F⁻, F⁺−F⁻⟩vol` | sound | none |
| 1.6 `γ₀(𝔰𝔲(2), −tr)` | `X = k`, `Y = i` | `[k,i] = 2j`, `|2j|² = 8`, ratio `√8/2 = √2`; Lemma 6.4 gives `≤ √2` | sound | none |
| 1.6 cubic identity and bound | `ω^a = λ(i,j,k)` in the orthonormal self-dual basis | `𝔉_ω(ω)_{ij} = 2Σ_l[ω_il, ω_lj]`; `⟨ω,𝔉_ω(ω)⟩ = (λ³/2√2)·Σ_{i,j,l}⟨ε_ij,[ε_il,ε_lj]⟩ = (λ³/2√2)(12·(−8)) = −24√2λ³`; `6√2·⟨ω¹,[ω²,ω³]⟩ = 6√2·4λ³`; bound `(2√6/3)√2(6λ²)^{3/2} = 24√2λ³` (equality); general: `6√2γ₀|ω¹||ω²||ω³| ≤ 6√2γ₀(|ω|²/3)^{3/2} = (2√6/3)γ₀|ω|³` | sound | none |
| 1.6 scaling, commutative | `c⟨·,·⟩`; `𝔤` abelian | ratio scales by `√c/c = c^{−1/2}`; both sides `0` | sound | none |
| 2.1 discontinuous critical map | `d = 4`, `φ = log log(1/|x|)` | `∫|∇²φ|² ≈ ∫dr/(r log²(1/r)) < ∞`, `∫|∇φ|⁴ ≈ ∫dr/(r log⁴(1/r)) < ∞`; `exp(φX)` has no limit at `0` | sound | none |
| 2.1 vortex | `d = 3`, `O = e^{iθ}` | `∫_{B₁}ρ^{−3}dx = ∫dρ/ρ² = ∞` so `O ∉ G^{1,3}`; `∫|∇²O|^{3/2} ≈ ∫ρ^{−3}ρ dρ = ∞` so `O ∉ G^{2,3/2}` | sound | none |
| 2.1 component API | `X` connected, `O ∈ G^{1,1}_loc` | composite with the component map is `W^{1,1}_loc` with finitely many values, hence a.e. constant | sound | none |
| 2.5 extension iff constant class | `O = Φ(x/|x|)` on an annulus, `d = 4` | class of `Φ`, degree `1`; no `G^{2,2}` extension | sound | none |
| 3.1 scaling | `A_λ(x) = λA(λx)`, `d = 3, 4` | `‖F[A_λ]‖^{d/2}_{L^{d/2}} = ∫λ^d|F(λx)|^{d/2}dx = ‖F‖^{d/2}`; in `d = 3`: `‖F[A_λ]‖²_{L²} = λ^{4−3}‖F‖²` | sound | none |
| 3.1 line singularity | `d = 3`, `A = i dθ` | `|∇A| ≈ ρ^{−2}`, `∫ρ^{−3}ρ dρ = ∞` so `A ∉ W^{1,3/2}_loc` | sound | none |
| 3.2 gauge invariance | `U(1)`; `O = Φ(x/|x|)`, `A = 0` on `ℝ⁴∖{0}` | `F` unchanged; `F[−O;x] = 0` though `|O;x| ≈ |x|^{−1}` | sound | none |
| 3.3 bound regularity | `k = 2` in Prop 3.9 | hypotheses `O;x, A_(α) ∈ W^{1,d/2}`, conclusion `W^{1,d/2}` (source line 1309) | sound | none |
| 3.4 BPST concentration | `‖F‖²_{L²(B_r)}` | `96π²∫₀^r s³(1+s²)^{−4}ds = 96π²(1/12 − 1/(4U²) + 1/(6U³))`, `U = 1+r²`, `= 8π²(U³−3U+2)/U³ = 8π²r⁴(r²+3)/(r²+1)³`; limit `8π²`; small `r`: `24π²r⁴` so `r_c ≈ (ε²/24π²)^{1/4}` | sound | none |
| 4.1 `U(1)` Coulomb gauge | `Ã = A − i dφ` | `∂^ℓÃ_ℓ = 0 ⇔ Δφ = −i∂^ℓA_ℓ`; `x^ℓÃ_ℓ = 0 ⇔ ∂_νφ = −i x^ℓA_ℓ`; compatibility `∫Δφ = ∫∂_νφ` automatic; unique up to a constant | sound | none |
| 4.1 vs FourManifolds | `G = SU(2)`, `d = 4` | FourManifolds §5.3: `d*a = 0`, `a(ν) = 0`, `‖a‖_{W^{1,2}} + ‖a‖_{L⁴} ≤ C‖F‖_{L²}` modulo constants | sound | R08 (cite §5.3) |
| 4.2 punctured ball | `A = −O;x`, `O = Φ(x/|x|)` | `∫_{B₁}|x|^{−4}dx = ∞` so `A ∉ W^{1,2}(B′₁)`; `O⁻¹·A = 0` extends | sound | none |
| 4.3 exponents | `m = 0`, `d = 4` | `F ∈ L²(B) ⇒ ∂A ∈ L²(λB)` (interior `W^{1,2}` from div–curl) | sound | none |
| 4.4 / 5.2 scaling | dilation by `λ` | `(r,R) ↦ (r/λ, R/λ)`, `R/r` invariant; `‖F‖_{L^{d/2}}` invariant under `x ↦ x/|x|²` (conformal weight `λ^{−2·d/2}·λ^d = 1`) | sound | none |
| 5.1 good representative | `η′ ≡ 1`, `O = Φ(x/|x|)`; `G = {±1}`; BPST | `∫_{B₁}|x|^{−4} = ∞`; two constant gauges at infinity; `B = −Im(x̄dx)/(|x|²(1+|x|²)) = O(|x|^{−3}) ∈ L⁴`, `∇B = O(|x|^{−4}) ∈ L²` | sound | none |
| 5.1 right constants | `O_(∞)h` | `(Oh);x = ∂O h h⁻¹O⁻¹ = O;x`; `c·A = −η′(cO);x + Ad(c)B` | sound | none |
| 5.3 route identity | `U(1)`, `B = B′ = 0`, `A′ = P·A` | README identity: `2i dψ = 0` (false); corrected: `0 = 0` | **defect** | R02 |
| 5.3 conclusion | `[O′⁻¹PO] = const`, `[P] = const` (2.5) | `[O′] = [P][O][c]⁻¹`, i.e. `O′ ≃ cOc′` | sound | none |
| 5.4 `Top(d,G)` | `G = {±1}`; `G = O(4)`; `G = U(1)` | one class (`A = 0` only); reflection `q ↦ q̄` conjugates `L_u` to `R_ū`, swapping the summands of `π₃(SO(4)) = ℤ⊕ℤ`; `[S^{d−1},U(1)] = *` for `d ≥ 3` | sound | none |
| 5.5 trivial class | `−ηO;x`, `O = Φ(x/|x|)` | `χ = −8π² ≠ 0` while `χ = 0` on `Ḣ¹` (6.3) | sound | none |
| 5.6 based vs free | connected `G` | `O ≃ O(e₁)⁻¹O` by a path from `O(e₁)⁻¹` to `1`; `H ↦ H(t,e₁)⁻¹H(t,·)` | sound | none |
| 6.1 dilation and `U(1)` | `d = 4` | `f(F[A_λ]∧F[A_λ])(x) = λ⁴f(F∧F)(λx)`, integral invariant; `∫dα∧dα = 0` for finite-energy `α` | sound | none |
| 6.2 sign via Stokes | `A = −η′O;x + B`, `B` compactly supported | `∫_{B_ρ}dT = ∫_{∂B_ρ}T = ∫O*ω_f` (outward orientation, `A = −O;x` for large `ρ`); pure gauge of `Φ`: `χ_{tr} = −8π²` | sound | none |
| 6.3 integrated bound | `χ = −∫⟨F∧F⟩ = ∫(|F⁻|² − |F⁺|²)` | `ℰ − χ = 2∫|F⁺|²`, `ℰ + χ = 2∫|F⁻|²`; FourManifolds `E = 8π²k + 2‖F⁺‖²` with `k = c₂` | sound | none |
| 6.4 sign of `c₂` | `O = Φ`: `c₂ = χ_{tr}/8π² = −1 = −deg Φ`; BPST: `O_(∞) = Φ(x̄/|x|)`, `deg = (−1)³ = −1`, `c₂ = 1`; ASD gives `tr(F∧F) = |F|²vol`, `c₂ = ℰ/8π² = 1` | consistent across 1.4, 6.2, 6.3, 7.6 | sound | R01, R07 (citations) |
| 7.1 abelian examples | `A = (i/2)(x₁dx₂ − x₂dx₁)`; `F = iψ(x₁)dx¹²` | `F₁₂ = i` constant, harmonic, infinite energy; `∂₁F₁₂ = iψ′ ≠ 0` | sound | none |
| 7.2 ε-regularity | locators | none of the three cited texts states the quantitative bound | **locator gap** | R04 |
| 7.3 decay | BPST | `|F| = √48(1+|x|²)^{−2} ≈ √48|x|^{−4}`; inversion gives `|x|^{−4−n}` for `D^{(n)}F` | sound | none |
| 7.4 constants | `u = |F⁺|`, Kato `|∇F⁺|² ≥ (3/2)|∇u|²` | `uΔu + |∇u|² ≥ (3/2)|∇u|² − (2√6/3)γ₀u³` ⇒ `Δ(u^{1/2}) ≥ −(√6/3)γ₀u^{3/2}` | sound | none |
| 7.5 gap constant | `u = |F⁺|^{1/2}`, `d = 4` | `∫|∇u|² ≤ (√6/3)γ₀∫|F⁺|²`; `6∫|∇u|² ≥ 8√6π(∫u⁴)^{1/2}` ⇒ `2√6γ₀‖F⁺‖² ≥ 8√6π‖F⁺‖` ⇒ `‖F⁺‖ ≥ 4π/γ₀`; `SU(2)`: `16π²/2 = 8π²` = BPST; GKS (1.4) `2ℰ ≥ 16π²|κ| + 32π²` ⇔ `ℰ ≥ 8π²|c₂| + 16π²` ⇔ `|χ| + 32π²/γ₀²` | sound | none |
| 7.5 attained | `𝔰𝔲(2)⊕𝔰𝔲(2)`, charges `(−1, 1)` | `ℰ = 16π²`, `χ = −8π² + 8π² = 0`, `|χ| + 32π²/2 = 16π²` | sound | none |
| 7.6 BPST | `F = Φ(dx̄∧dx)/(1+|x|²)²` | `i`-coefficient of `dx̄∧dx` is `2(dx¹² − dx³⁴)` (ASD); six components of norm `2√2/(1+|x|²)²`, `|F|² = 48/(1+|x|²)⁴`; `ℰ = 96π²/12 = 8π²`; `−O;x = Im(x̄dx)/|x|²` for `O = Φ(x̄/|x|)` (from `dx̄·x = |x|d|x| − Im(x̄dx)`) | sound | none |
| 7.7 ground state | `𝔰 ≅ 𝔰𝔲(2)`, `⟨φX,φY⟩ = −c tr(XY)` | `γ₀(𝔰) = √2/√c`, `ℰ(φ∘A_BPST) = 8π²c = 16π²/γ₀(𝔰)²`; `γ₀(𝔤) = max` over simple ideals (orthogonal decomposition, `|[X,Y]|² = Σ|[X_i,Y_i]|²`); `E_i = 16π²/⟨α,α⟩` (TopClass 2445) with `|α| = γ₀` | sound | none |
| 8.1 envelopes | single block; `c_k = 2^k (k ≤ 0), 1 (k > 0)`; `λ = 2^m` | `c_{k₀} ≥ ‖P_{k₀}u‖`; `c_k/c_j = 2^{−(j−k)} ≱ 2^{−(1−ε)(j−k)}` for `k < j ≤ 0`; dyadic shift preserves `ℓ¹` sums | sound | none |
| 8.2 `A = 0` | Mathlib normalisation | `𝓕(Δu) = −4π²|ξ|²û`, `Δ⁻¹` multiplier `−(4π²|ξ|²)^{−1}` | sound | none |
| 8.3 `U(1)` energy, scaling | `a = αe^{2πiξ·x}`, `ξ·α = 0` | `‖B(s)‖² + 2∫‖∇B‖² = ‖B(0)‖²`; `λ⁴G(λ²s,λx)` in `L¹L²` scales by `λ^{4−2−2} = 1`, `λ³H` in `L²L²` by `λ^{3−2−1} = 1` | sound | none |
| 8.4 hypotheses | YMHF Theorem 4.7 | compatibility belongs to `d^{σ,p}_k` relative to `c_k` | **misstatement** | R03 |
| 9.1 energy identity | `U(1)`, one mode | energy `4π²|ξ|²|α|²e^{−8π²|ξ|²s}`, derivative `−32π⁴|ξ|⁴|α|²`; `Σ_j|∂^ℓf_ℓj|² = 16π⁴|ξ|⁴|α|²`; factor `2`; general: `dℰ/ds = −2∫Σ_j|D^ℓF_ℓj|²` by Bianchi and two integrations by parts | sound; source error recorded | none |
| 9.3 lifespan | dilation | `s₀(λa(λ·)) = λ^{−2}s₀(a)`; flat data static | sound | none |
| 9.4 `Q` | `F_λ = λ²F(λ²s,λx)`; BPST | `∫∫λ⁶|F|³ λ^{−4}λ^{−2} = ∫∫|F|³`; `|A_BPST| ≈ |x|^{−1} ∉ L⁴(ℝ⁴)` (log divergence), static with `Q = ∞` | sound | none |
| 9.5 range of `σ` | Cor. 5.15 vs Lemma 5.33 | `−1 < σ < 2` claimed, `0 ≤ σ ≤ 1` proved | README follows the proof | R10 |
| 9.6 omitted clause | Thm 6.1 proof, Step 2 (2797–2803) | cubes `Q_n` chosen, `s_n → s₀`, `r_n ≲ s₀ − s̃_n`; no bound on `x_n` | README's omission justified; source gap recorded | none |
| 9.7 threshold | `SU(2)`; BPST; abelian | `2E_GS = 16π²`; BPST has `ℰ = 8π² < 16π²` but `a ∉ Ḣ¹`; abelian excluded by hypothesis | sound | none |
| 10.3 `U(1)` bound | divergence-free `a = iα` | `∫|dα|² = ‖∇α‖² − ∫(div α)² = ‖∇α‖²` | sound | none |
| 10.4 split submanifold | Hilbert unit sphere; cross `x₁² = x₂²`; graph of `|x₁|` | derivative of `v ↦ (e+v)/‖e+v‖` at `0` is the inclusion (`‖e+v‖ = √(1+‖v‖²)` has zero derivative); the cross is not locally a line; the graph has no `C¹` chart with injective derivative at `0` | sound | none |
| 10.5 decomposition | `U(1)`; `w = D(a)c₀`; `w ∈ T^{L²}_a𝒞` | Leray projection, `L = 0`; `b = 0`, `c = −c₀`; `c = 0` | sound | none |
| plan.json ↔ README | all 52 targets | every definition has ≥ 3 README Checks (1.1: 4, 1.2: 4, others 3); 110 tests; gaps `neededBy` = README's `*Needs:*` gap lines (4.1; 5.2, 5.3, 6.1; 7.7) | sound | none |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, PDE,
SmoothBundlesConnections, CharacteristicClasses, DifferentialGeometry, AlgebraicTopology, LieGroups, Yamabe),
How to read the build, ten layers each ending with `### Examples` and `### Dependencies`, Downstream consumers,
References: all present. Every theorem carries its hypotheses in the sentence and a locator; every definition
its API bullets and Checks; every `*Needs:*` line resolves to a target, a supplier section on main or at an
open head, a pinned declaration, or a declared gap (checked line by line; the only unresolved citation at an
open head is R01). No backticked name of the roadmap's own appears in the README (grep for `YangMills.`), as
fits a design. Mathematics in Unicode, no LaTeX delimiters.

**Headline theorems** (from the Summary; the design stage has no `Suggested.lean`, so statability is recorded
for the package stage): gauge invariance of finite energy (3.2); Uhlenbeck's lemma for every compact `G`,
`d ≥ 3` (4.1); the good global gauge theorem (5.2); well-definedness, gauge invariance and locality of the
topological class (5.4) and the trivial class (5.5); topological invariance of characteristic numbers (6.2);
the Bogomol'nyi bound (6.3); integrality and completeness of `c₂` for `SU(2)` (6.4); the energy gap and the
ground state (7.5, 7.7); local well-posedness, continuation and the flat limit (9.3–9.5); the Dichotomy and
Threshold Theorems (9.6, 9.7); existence and uniqueness of the caloric gauge (10.2); the caloric manifold with
its tangent spaces and div–curl decomposition (10.4, 10.5). Carriers at the pins: `Matrix.unitaryGroup`,
`Matrix.specialUnitaryGroup`, `HomotopyGroup`, `ContinuousMap.Homotopic`, Tau Ceti's `W1p`/`Wkp` on open sets;
not at the pins: `Ḣ¹`, `ℓ¹L²`, `ℋ`, `𝒞` (PDE §7.1–7.2 are planned, unbuilt), so the heat-flow and caloric
headlines (9.x, 10.x) will need definitions in the file or a docstring note, as the target brief says.

## Not verifiable

- `Uhlenbeck-LpCurvature` Theorem 1.3, `Uhlenbeck-RemovableSingularities` Theorem 4.1 (Project Euclid bot
  wall; settled uncertified): the design relies on their certified restatements OhTataru-TopClass Theorems
  3.11–3.12, which I read.
- `FreedUhlenbeck-Instantons` Ch. 1–3, `DonaldsonKronheimer` Ch. 2–4, `Bogomolnyi-Stability`,
  `MimuraToda-TopologyLieGroups` Ch. IV–V: paywalled, settled uncertified; nothing in the targets depends on
  their text (the Bogomol'nyi bound is reproved in OhTataru-TopClass Lemma 1.31, read).
- Elaboration and the one-tactic probe: not available (this lane does not elaborate; no `Suggested.lean` at the
  design stage).
- The published numbering of the Oh–Tataru papers (Astérisque, CMP, Annals) against the arXiv v2 texts read:
  not checked; the manifest records `version_note = "arXiv v2"` for each.

## Source issues

- **Misprint** in OhTataru-TopClass at Lemma 3.4(3), line 1130 (p. 22): the source writes the second term of
  the Leibniz rule as the adjoint of the bracket of the right Maurer–Cartan form with `B`; it should be the
  bracket of the right Maurer–Cartan form with `Ad(O)B` (equivalently the adjoint of the bracket with the left
  form); affects nothing.
- **Misprint** in OhTataru-TopClass at (1.26), line 886 (p. 17): the source writes `⟨F∧F⟩` as the all-index
  sum without the factor `¼` that (6.11) of the heat-flow paper carries; with it omitted Lemma 1.31 fails for
  `F = X(dx¹²+dx³⁴)`; affects a stated result (Lemma 1.31 as printed).
- **Misprint** in OhTataru-TopClass at Proposition 3.9, line 1303 (p. 26): the source says the global
  potential lies in `W^{k,d/k}(B_R)`; it should be `W^{k−1,d/k}`, as its displayed bound says; affects nothing.
- **Misprint** in OhTataru-TopClass at Lemma 3.13, line 1423 (p. 29): the conclusion's exponent uses an
  undefined `n`; it should be `d/(m+2)`; affects nothing.
- **Misprint** in OhTataru-TopClass at Theorem 1.5, line 374 (p. 8): the higher-regularity hypothesis is on
  `L^p(B_R)`; it should be on `L^p(ℝ^d)`, since the conclusion `B ∈ Ẇ^{n+1,p}(ℝ^d)` is global; affects a stated
  result.
- **Error** in OhTataru-TopClass at Proposition 1.6(1), line 401, and Lemmas 3.21–3.22, lines 1634 and 1646
  (pp. 9, 33): for disconnected `G` the gauges at infinity are homotopic only up to left and right constants,
  and `[id]` differs from the class of a constant map (`G = {±1}`, `A = 0`); it should state connected `G` or
  the quotient by constants; affects a stated result.
- **Error** in OhTataru-YMHF at (1.19), line 240, and (5.11), line 1617 (pp. 6, 34): the dissipation term of
  the energy identity carries the factor `1` for the energy `½∫⟨F,F⟩`; it should be `2∫Σ_j|D^ℓF_ℓj|²`
  (witness: one `U(1)` Fourier mode); affects nothing.
- **Misprint** in OhTataru-YMHF at Theorem 4.8, (4.34), line 1522 (p. 33): the exponent is `1 − α/2` with `α`
  undefined; it should be `1 − β`, as in (4.32); affects nothing.
- **Gap** in OhTataru-YMHF at Theorem 6.1, lines 2567 and 2580 (pp. 55–56): the statement asserts that the
  concentration points `x_n` converge to a point `x₀`; the proof chooses the parabolic cubes without bounding
  `x_n`; it should either drop the clause or add the argument; affects a stated result.
- **Gap** in OhTataru-YMHF at Corollary 5.15, line 1954 (p. 41): the linearised limit is claimed in `Ḣ^σ` for
  `−1 < σ < 2`; its proof, Lemma 5.33(2), gives `0 ≤ σ ≤ 1`; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9a5d985fcda42e48537cfd2703445bbfe374fc7f", "job": "REV-DESIGN-YangMillsConnectionsAndCaloricGauge", "model": "fable", "worker": "chris-x17"} -->
