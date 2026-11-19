# Review of FuchsianOrbifolds (pull request #2576 at a2aac07)

**Verdict:** needs changes

**Summary.** The mathematics of the revised README holds up. Every stated theorem, Check, worked example and table entry recomputes correctly, every library name resolves at the pins, and the targets that the README says the pins lack really are missing there. One finding blocks: a clause of the opening summary says that the point stabilizers of the PSL(2,ℝ) action are finite cyclic. They are circles; only stabilizers in a discrete subgroup are finite cyclic. Four small corrections and two format notes come with it, none blocking. The human reviewers have two questions: the two most-cited sources could not be read, and one cited text has no entry in the sources manifest.

## R01 (P2) — The opening summary says the point stabilizers of the PSL(2,ℝ) action are finite cyclic; they are circles, and only the stabilizers of a discrete subgroup are finite cyclic

The summary is read cold, and its second sentence makes a false statement about the group the whole roadmap is built on. As written (summary, lines 5–6), the relative clause attaches to PSL(2,ℝ): "for the effective action of PSL(2,ℝ), whose point stabilizers are finite cyclic groups". The stabilizer of i in PSL(2,ℝ) is the image of SO(2): the maps z ↦ (cos θ·z + sin θ)/(−sin θ·z + cos θ) with θ ∈ ℝ/πℤ, a circle. Finite cyclic stabilizers are those of discrete subgroups. This is what §0.4 and Convention 4 say, through `Subgroup.isCyclic_stabilizer`, which takes a subgroup `Γ`.

The smallest repair: "for the effective action of PSL(2,ℝ), under which every point stabilizer of a discrete subgroup is finite cyclic".

## C01 — The module docstring of `Suggested.lean` still uses the old numbering "Layer k item n", which the README no longer has

This pull request leaves `Suggested.lean` unchanged, but the README's targets are now headed §0.1, §0.2, §2.1, §5.6 and §4a.2. The docstring still sends readers to "Layer 0 items 1–2 and Layer 2 item 1" and "Layer 5 item 6" (lines 35–38), and to "the roadmap's Layer 4a item 2" (lines 128 and 136–137). Replace these with §§0.1–0.2 and §2.1, with §5.6, and with §4a.2.

## C02 — The scope claims "the standard presentation" of the acting group, but no section states the canonical signature presentation; §§2.3–2.4 give side-pairing presentations

Scope and ownership, line 1192, reads: "The roadmap proves the standard presentation of the acting Fuchsian group." The presentations here are Poincaré's: the side relations and finite vertex-cycle relations of `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.relatorQuotientTo_bijective_of_isParabolic` (§2.3), and their converse for Dirichlet polygons (§2.4). Nowhere does the README state the canonical presentation with generators a₁, b₁, …, x₁, …, y₁, … and relation [a₁, b₁] ⋯ x₁ ⋯ y₁ ⋯ = 1.

Consumers already read the sentence two ways. ArithmeticFuchsianGroups §1.4, an open pull request, plans that canonical presentation as its own target, built from §§2.3–2.5 here. GroupActionsOnRiemannSurfaces cites this roadmap's "Layer 2 items 3–6" for "the standard presentation with elliptic and parabolic cycles". Saying "Poincaré's side-pairing presentation of the acting group and its converse for Dirichlet polygons (§§2.3–2.4)" would remove the ambiguity.

## C03 — §4.5 calls `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange_eq_two_pi_mul` the level-one case of the polygon formula, but it is stated in the intrinsic form

The sentence "Its level-one case is …" (lines 758–759) follows the polygon formula `2π((n − k)/2 − 1 − V + Σₑ (1 − 1/mₑ))`. The pinned declaration reads instead `covolume = 2π(−χ(X(1)) + Σₑ (1 − 1/mₑ) + c)`, which is the §5.7 form with `−χ` in place of `2g − 2`. A reader who looks there for `(n − k)/2` will not find it. Attaching the citation to the next sentence, the intrinsic form, would make it accurate.

## C04 — Eight layers open with "The layer follows <sources>", although their organisation is the roadmap's own

These sentences (lines 148, 272, 361, 576, 672, 782, 1003 and 1104) say that a layer follows named sources. In fact no layer maps onto a run of one source's chapters (see Source independence), the order is the one the *Needs:* lines force, and every section already cites its sources at the claim. Saying this misdescribes the plan, and the project's planning rules exclude it. Either drop the sentences or rephrase them as a neutral list of sources ("Sources: …").

## N01 — §5.6 states two targets with no source locator

The Fuchsian Riemann–Hurwitz formula and the multiplicativity of `χ_orb` carry only "this roadmap's own". A standard locator would help a reader, for example the one NoncongruenceModularForms gives for the same formula (Diamond–Shurman, Theorem 3.1.1; Shimura, Proposition 1.40).

## N02 — Convention 14 says every other backticked name is a Mathlib or Tau Ceti declaration

The seven `Suggested.lean` theorems (for example `covolume_eq_two_pi_mul_signature`) are backticked too, as are short forms such as `glAction`, `toPGL` and `jSphere`. "Every backticked name not declared in `Suggested.lean`" would be exact.

## Questions for the author

- Every section of a layer now carries that layer's full source list. Do Beardon, Chapters 7–8, and Katok, §§2.1–2.4, contain second countability of PSL(2,ℝ) (§0.1) and the isometric action of the elements of GL(2,ℝ) of negative determinant (§0.2)? Does Diamond–Shurman §2.4 contain the degree and local-multiplicity statements of §4.4? These texts are recorded as uncertified or have no manifest entry, so I could not open them.
- The §5.1 route takes from AlgebraicTopology §6.5 an intersection pairing on `H₁(X; ℚ)` that is nondegenerate and alternating. That section names "duality formulas for … the intersection pairing" in one clause and otherwise treats the torsion linking pairing. Is the rational pairing in odd middle degree meant to be there, or should the route cite §6.4 with the cup product, or rest on ComplexKahlerGeometry §7.7 (`b₁ = 2g`), which states it?

## Previous findings

The previous review left no finding open. The repair it confirmed is intact at this head:

- `Suggested.lean` 148–153 still contains only `export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)`, with no abbreviations.
- The carrier sentence survives as README 111–112: "The carrier written `CompactifiedQuotient Γ` in other roadmaps is `Γ.CompactifiedQuotient`."

## Verified sound

| Statement | Instances | Values computed (README side / pin or computation) | Result |
|---|---|---|---|
| §0.1 second countability | instance search at the pin; discrete topology | `SL(2,ℝ)`, `PSL(2,ℝ)`: no instance; `Matrix (Fin 2) (Fin 2) ℝ`: found; discrete `PSL(2,ℝ)` uncountable, not second countable | target real; Checks true |
| §0.2 GL isometries | `diag(1,−1)`; `IsIsometricSMul` search; `#print UpperHalfPlane.J` | `1+i ↦ −1+i`, `i` fixed; both distances `2 arsinh(1/2)`; GL: no instance, SL: found; `J = !![-1,0;0,1]` | holds |
| §0.4 stabilizers | `i` under `SL(2,ℤ)` and `PSL(2,ℤ)`; `ρ` | orders `4` and `2`; `3` at `ρ` | holds |
| §1.2 disc quotient | pinned type; `m = 2`, `ε = 2 artanh(1/2)` | `Metric.ball 0 (tanh(ε/2)^card)` at pin; radius `1/4` | holds |
| §1.5 descent order | `j − 1728` at `i`; `j` at `ρ` | pin: order upstairs = card·order downstairs; `2 = 2·1`, `3 = 3·1`; without `m`, orders `2`, `3` | holds |
| §2.1 metric, (b) | `dist(i,2i)`; `dist(i,1+i)`; vector `1` at `i` | `2 arsinh(1/(2√2)) = log 2`; `arcosh(3/2) ≈ 0.9624 < 1`; `1 = 4/4`; instance is `poincareRiemannianMetric` | holds |
| §2.1 checks | `−1/z` at `2i`; height rescaling; `i/n` | `1/4 = 1/4`; `1/16`; `|log(m/n)|`, not Cauchy | holds |
| §3.4 scaling | `σ′ = 2σ`, `2σ + 1/2`, `w = 1` | `q′ = q`; `q′ = iq` (pin factor `exp(2πib/(aw))`); dropping `aw` gives `−q` | holds |
| §4.1 carrier | `#check` | `Subgroup PSL(2,ℝ) → Type`; complement of the range of `ofQuotient` is the range of `ofCusp` | holds |
| §4.3 atlas | `cuspChart_mem_atlas`; transition | hypothesis `D.width ≤ A`; transition `× exp(2πib/(aw))`, nonzero | holds |
| §4.4 maps | `Γ(2) ≤ PSL(2,ℤ)`, index `6` | cusp `3·2`, `i` `3·2`, `ρ` `2·3`, each `6`; pin degree `(Δ.subgroupOf Γ).index` | holds |
| §4.5 polygon form | standard triangle `(3,1,1)`, `k = 0` variant | `π/3`; `4π/3`; pin numerator `n − #{σ.pair i = i}` | holds; C03 |
| §5.4 extension | pinned hypotheses; `j` | invariance, meromorphy, holomorphy high up, `O(exp(2πk Im z/w))`; `k = 1` | as stated |
| §5.5 finite map | pinned signature | `DiscreteTopology Γ`, `Δ ≤ Γ`, finite relative index; no compactness | as stated |
| §5.6 Fuchsian RH | `Γ(2)`; `Γ₀(11)` | `R = 3+3+4 = 10`, `−2 = −12+10`; `χ_orb −1 = 6·(−1/6)`; `R = 24`, `g = 1`, `4π = 12·π/3` | holds |
| §6.2 descent of j | pin | local multiplicity `1` at `ρ`, `i`; upstairs orders `3`, `2` | holds |
| §6.3 degree | pin | `jSphere = ∞` only at the cusp; multiplicity `1`; degree `1` | holds |
| §6.4 biholomorphism | pin | `Diffeomorph 𝓘(ℂ) 𝓘(ℂ) X(1) (OnePoint ℂ) ⊤`; `ρ ↦ 0`, `i ↦ 1728` | holds |
| §6.5 order | imports of `Compactification/Manifold.lean`, `Basic.lean`, `DirichletDomain/Cofinite.lean` | no modular-form module | holds |
| `genus` | `P¹`, torus, genus 2, `RP²`, empty | `0, 1, 2`; junk `0` and `1`; `(−χ/2).toNat` gives `1` at genus 2 | determines genus |
| `eulerChar_eq_two_sub_two_mul_genus` | genus 3; `P¹ ⊔ P¹`; `ℂ`; `X(1)` | `−4 = 2−6`; `4 ≠ 2`; `1` not of form `2−2g`; `2 = 2` | holds; hypotheses needed |
| `riemannHurwitz` | `z²`; `℘`; genus 2 → `P¹`; sign error | `−2 = −4+2`; `0 = −4+4`; `2 = −4+6`; `−R` gives `−6` | holds |
| `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, `Γ₀(11)`, trivial | `π/3, π, 2π, 4π`; trivial group not cofinite | holds |
| `pi_div_twentyOne_le_covolume` | `(2,3,7)`, `(2,3,8)`, `(2,4,5)`, `(3,3,4)`, `(0;2,2,2,2)` | `π/21, π/12, π/10, π/6`; `δ = 0` excluded by positivity | holds |
| 4a.1 case analysis | `(2,3,m)`, `m = 6,7,8`; `(2,4,5)`; `(2,5,5)`; `(3,3,4)`; `(2,2,2,3)` | `0, 1/42, 1/24`; `1/20`; `1/10`; `1/12`; `1/6` | minimum `1/42` only at `(2,3,7)` |
| `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)` | T/T; F/F; F/F | both directions |
| `minimum_area_finite_area_orbifold`, 4a.2 table | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(0;2,2;1)`, `(0;2,3,7)` | `π/3, π, π/2`; `δ = 0`; `π/21 < π/3` without cusp | holds; cusp needed |
| `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;3,3;1)` | T/T; F/F; `2π/3`: F/F | both directions |
| 5.7 cell count | `(3,1,1,1)`, `(4,0,0,3)`, `(4,0,0,1)`, `(8,0,1,0)` | `2, 2, 0, −2`; without midpoints `1`; without cusps `−1` | holds |
| R01 summary clause | stabilizer of `i` in `PSL(2,ℝ)` and in `PSL(2,ℤ)` | circle `θ ∈ ℝ/πℤ`; order `2` | literal claim false |
| C02 presentation | §§2.3–2.4; ArithmeticFuchsianGroups §1.4; GroupActionsOnRiemannSurfaces 313–314 | side and vertex-cycle relators only; canonical presentation planned there; cited here | ambiguous claim |
| C03 level-one lemma | pinned statement | `2π(−χ(X(1)) + Σ + c)`, no `(n − k)/2` | misattributed form |

- Automatic checks: the gate rerun on this head reports every check `0`, `OK`. The dependency check reports `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line; FuchsianOrbifolds is line 53 of the merge order. The diff outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 8 `sorry` warnings (lines 58, 74, 84, 98, 110, 118, 129, 138) and nothing else. The one-tactic probe (`rfl`, `infer_instance`, `simp; done`, `norm_num; done`, `decide`) closes 0 of 8. There is no `variable` block, and all 9 elaborated types match the README hypotheses.
- Library: 214 backticked README names were checked with `#check @` at the pins. All resolve; `TauCeti.eulerChar_torus` was read in source (`AlgebraicTopology/Cellular/EulerCharacteristic/Torus.lean:50`) because its module is unbuilt. 40 pinned signatures were compared with the README's stated hypotheses, for example `covolume_eq_card_mul_covolume`, `eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`, `cuspDatum_coordinate_eq` and `stabilizerBallQuotientHomeomorph`.
- Pins-lack claims: instance search fails for `SecondCountableTopology` on `SL(2,ℝ)` and `PSL(2,ℝ)`, for `IsIsometricSMul (GL (Fin 2) ℝ) ℍ` and for `IsRiemannianManifold 𝓘(ℝ,ℂ) ℍ`. No ℍ ↔ `UpperHalfSpace ℝ` comparison and no topological genus exist in the Tau Ceti source. `FiniteCWType` for a compactified quotient exists only at level one (`Fuchsian/LevelOne/Signature.lean:65`).
- Suppliers resolved on main: AlgebraicTopology §§6.4 (README 2571), 6.5 (2665), 7.1 (2809) and 8.7 (3325); ComplexManifolds Milestones 1–6 (172–319); ModularForms §§10A–10D (1150–1313) and its contract with this roadmap (285); ComplexKahlerGeometry §7.7 (2943); UniversalCovers and ConformalMapping under `Completed/`.
- Citations of this roadmap: all resolve under the §k.n numbering. On main: NoncongruenceModularForms 651–655 and 1252, PseudoholomorphicCurveAnalysis 1319 and 1380, the anchors in ConformalMappingPartII. At open heads: TeichmullerGeometry, ArithmeticFuchsianGroups, GroupActionsOnRiemannSurfaces and FinitenessAndDualityOfGroups (old "Layer k item n" = §k.n), and the ArithmeticDynamics anchors (Layer 5 heading kept).
- Sources: Martin2013 Theorem 2.1 (line 213) and Theorem 2.2 (lines 217–227) were read against README 4a.1, 4a.2, 5.7 and the references (1563–1565), and against the `Suggested.lean` docstrings 93–97, 107–117 and 126–128.
- Overlap check: read FuchsianOrbifoldsPartII, KleinianGroups, ArithmeticFuchsianGroups, TeichmullerGeometry and GroupActionsOnRiemannSurfaces (open), and BallQuotientsAndComplexHyperbolicLattices, NoncongruenceModularForms and ConformalMappingPartII (main). Each consumes this roadmap by citation (owner: FuchsianOrbifolds). The one shared object is the canonical signature presentation, which ArithmeticFuchsianGroups §1.4 owns and which this Scope's wording appears to claim (C02). TeichmullerGeometry's `riemannHurwitz` is a different, topological branched-cover statement in its own namespace. Pull request #2578 does not touch this folder.

Source independence: 8 passages compared with 1 source (Martin2013, lines 212–227); the longest shared run is the forced phrase "(2, 3, 7) triangle group". The largest share of locators is Diamond–Shurman, 23 of 95, with Katok next at 22. Contents were compared with Diamond–Shurman and Katok from the section numbers the README cites, not from their texts: independent. Layers 0, 2, 5 and 4a cite no Diamond–Shurman section, Layers 1, 3, 5 and 6 cite no Katok section, and the layer order is forced by the *Needs:* lines (1 and 2 after 0, 4 after 0–3, 5.4–5.7 after 4, 4a after 5.7, 6 after 0–5).

Research link: Layer 4a states Siegel's minimal covolume π/21 (Siegel 1945), and §5.7 the signature area formula. Martin (2013, Theorems 2.1–2.2) presents both as the two-dimensional base case of the minimal-covolume problem for lattices, after Kazhdan–Margulis. This line rests on the README's references and on Martin2013 lines 196–227.

## Not verifiable

- Beardon1983, Forster1981, FarkasKra1992, DiamondShurman2005, Serre1973, Stillwell1992 and Siegel1945 are uncertified and cited by locator only. The locators of the seeded sample (§§0.1, 0.2, 0.4, 1.5, 2.1, 4.1, 4.3, 4.4, 5.4, 5.5, 6.2–6.5) were not checked against their texts; the statements were checked against the pinned declarations instead.
- Katok (*Fuchsian Groups*) and Miranda (*Algebraic Curves and Riemann Surfaces*) are cited 22 and 12 times but have no key in the package's sources manifest. They were not fetched, since this review edits no manifest.
- §5.6 has no locator to check (N01).

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, p. 6: the source names the number of punctures with a lower-case letter and then uses an upper-case letter for it in the area formula; it should use one letter throughout; affects nothing.

## For the human reviewers

- Not tested: Diamond–Shurman, the source with the largest share of locators (23 of 95, uncertified), and Katok (22, no manifest entry) could not be read. Wording and arrangement were compared only with Martin2013.
- Licence: Katok and Miranda are cited in `TauCetiRoadmap/FuchsianOrbifolds/README.md` but recorded nowhere in the package's sources manifest. Earlier rounds found no legal copy of either.
