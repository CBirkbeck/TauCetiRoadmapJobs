# Review of FuchsianOrbifolds (pull request #2576 at 090b043)

**Verdict:** accepted

**Summary.** Accepted, with no finding. This head repairs the one finding of the previous review: the summary no longer says that point stabilizers of PSL(2,ℝ) are finite cyclic. It also repairs four of that review's corrections and notes, and a fifth in part. Every stated theorem, Check, worked example and case table recomputes correctly, including the new congruence-subgroup genus formula in §5.6 and the new cup-product route to the evenness of b₁ in §5.1. There are two small corrections and one format note, none blocking. The new genus formula in §5.6 is a target that ModularForms §10A and NoncongruenceModularForms already plan on main. The *Needs:* line of §5.1 omits AlgebraicTopology §6.3. Two questions are left for the human reviewers: the two most-cited sources could not be read, and two cited texts have no entry in the sources manifest.

## C01 — The congruence-subgroup genus formula added to §5.6 is a target of ModularForms §10A and of NoncongruenceModularForms on main, but here it reads as part of what §5.6 proves

Lines 903–907 add a sentence between "The first is the Fuchsian Riemann–Hurwitz formula" and "The second is …", inside the paragraph that opens "Prove the following two statements". The sentence reads: "For Γ the image of PSL(2, ℤ) and Γ′ the image of a congruence subgroup, … turn it into the genus formula `g(Γ′) = 1 + d/12 − ε₂/4 − ε₃/3 − ε∞/2`". Placed there, it reads as a further result that §5.6 plans. ModularForms §10A plans exactly this derivation, with ε₂, ε₃ and ε∞ defined there (its README, lines 1159–1161: identify the degree and the local multiplicities, "then apply Riemann–Hurwitz to obtain" the formula). NoncongruenceModularForms 2.3 proves the same formula for every finite-index subgroup by the same Riemann–Hurwitz argument (its README, lines 650–655; `TauCetiRoadmap.NoncongruenceModularForms.genus_formula`). This README already places the formula elsewhere: its Scope gives ModularForms "the congruence-subgroup arithmetic of `X(Γ)` (§10A)" (line 1253), and §6.1 refers to the genus formula of ModularForms §10A (line 1117).

The formula itself is right. For Γ(2), `(d, ε₂, ε₃, ε∞) = (6, 0, 0, 3)` gives `1 + 1/2 − 3/2 = 0`. For Γ₀(11), `(12, 0, 0, 2)` gives `1 + 1 − 1 = 1`, which agrees with the Examples of Layer 5. Only the ownership should change. One option is to attribute the sentence: "ModularForms §10A specialises it, for congruence subgroups, to the genus formula … (Diamond–Shurman, Theorem 3.1.1)". Another is to move it to the Examples of Layer 5. The description's bullet "In 5.6, the level-one case of the Fuchsian Riemann–Hurwitz formula" would then need the same wording.

## C02 — The route of §5.1 needs AlgebraicTopology §6.3 to turn the orientation of ComplexManifolds Milestone 2 into a fundamental class, but its *Needs:* line omits it

AlgebraicTopology §6.4 states duality for a manifold with a fundamental class (its README, lines 2573–2578). ComplexManifolds Milestone 2 gives an orientation in DifferentialGeometry's chart-sign carrier (its README, lines 197–219). AlgebraicTopology §6.3 provides the comparison between the two: smooth orientations correspond to integral homological orientations (its README, lines 2283–2288). The route "ComplexManifolds Milestone 2 orients `X`, and the Poincaré duality of AlgebraicTopology §6.4 gives …" (lines 789–790) therefore passes through §6.3. Without it, an implementer following the *Needs:* line (lines 795–797) has an orientation but no class to cap with. Adding "AlgebraicTopology §6.3 (from the smooth orientation to a fundamental class)" to that line, and to the AlgebraicTopology contract (lines 1540–1542), would make the route complete.

## N01 — The References entry for Diamond–Shurman lists only §§2.1–2.4

That entry (lines 1555–1556) lists §§2.1–2.4, but §5.6 now cites Diamond–Shurman, Theorem 3.1.1. "§§2.1–2.4 and Theorem 3.1.1" would match the citations.

## Questions for the author

- §5.1 says that the cup-product pairing on `H¹(X; ℚ)` is nondegenerate "by that duality over the field `ℚ`". Besides the cap isomorphism of §6.4, this step needs universal coefficients over ℚ, which the pin has as `TopCat.singularKronecker_bijective_of_projective_homology`. It also needs the identity `⟨a ⌣ b, μ⟩ = ⟨a, b ⌢ μ⟩`, up to the sign convention. I found that identity neither at the Tau Ceti pin (`AlgebraicTopology/Cohomology/Cap/`, `Kronecker.lean`) nor by name in AlgebraicTopology §§6.2–6.4. §6.4 does promise "field-coefficient" corollaries without naming them. Is the nondegenerate cup pairing over a field meant to be one of those corollaries, or should the route name the identity as a step of its own?
- §§0.1 and 0.2 cite Beardon, Chapters 7–8, and Katok, §§2.1–2.4, for second countability of PSL(2,ℝ) and for the isometric action of elements of negative determinant. Do those chapters state these facts? Beardon is recorded as uncertified and Katok has no manifest entry, so I could not open either.

## Previous findings

- R01, repaired. Lines 5–6 now read "for the effective action of PSL(2,ℝ), under which every point stabilizer of a Fuchsian group is a finite cyclic group".
- C01, repaired. The `Suggested.lean` docstrings now cite "the README's §§0.1–0.2 and §2.1" and "§5.6" (lines 36–37), and "§4a.2" (lines 128 and 136–137).
- C02, repaired. The Scope (lines 1189–1192) reads "Poincaré's side-pairing presentations … it derives from them no canonical presentation by the signature". Completion item 7 (line 1217) reads "the side-pairing presentations".
- C03, repaired. Lines 751–753 read "At level one, with `−χ(X(1))` in place of `2g − 2`, the intrinsic form is …". This matches the pinned statement (`Fuchsian/LevelOne/Signature.lean:105`).
- C04, repaired. No layer opens with "The layer follows" any longer; Layer 4 keeps only its normative construction order (lines 665–666).
- N01, partly repaired. §5.6 now has a locator, Diamond–Shurman Theorem 3.1.1, but only for the congruence specialisation (see C01). The general formula and the multiplicativity of `χ_orb` still carry "this roadmap's own". This is form only and is not raised again.
- N02, repaired. Lines 141–143 now say "Every backticked declaration name that `Suggested.lean` does not declare is …".
- The previous question about AlgebraicTopology §6.5 is answered. The route now uses §6.4 and `TopCat.singularCup_gradedComm` (lines 790–797; contracts at lines 1479–1481 and 1540–1542), and §6.5 is no longer cited.

## Verified sound

| Statement | Instances | Values computed (README side / pin or computation) | Result |
|---|---|---|---|
| 0.2 GL(2,ℝ) action, isometries | `diag(1,−1)`; `diag(2,1)`; instance search | `1+i ↦ −1+i`, `i` fixed; `dist` both `2 arsinh(1/2)`; `2z` = class of `diag(√2,1/√2)`; GL instance fails, SL found | holds |
| 0.3 proper discontinuity | `i` under `SL(2,ℤ)` and the image of `PSL(2,ℤ)` | stabilizer orders `4` and `2`; both finite | holds |
| 0.5 free locus | image of `PSL(2,ℤ)` near `i`; image of `Γ(2)` | fibre count `2 → 1` at `i`, not a covering; `Γ(2)` torsion free, free locus = ℍ | holds |
| 1.1 invariant discs | stabilizers of `i` and `ρ` | rotation by `−1` (m = 2) and by a primitive cube root (m = 3) | holds |
| 1.2 cyclic quotient | `m=2`, `ε=2 artanh(1/2)`; `ε=0` | radius `(1/2)² = 1/4`; empty ball on both sides | holds |
| 1.5 descent order | `j−1728` at `i`; `j` at `ρ` | `2 = 2·1`, `3 = 3·1`; without the factor `m`: `2`, `3`, contradicting degree one | holds |
| 2.5 cycles, boundary word | standard triangle; datum `σ=1`, `w=1` | cycle `{ρ, ρ+1}`, sum `2π/3`, order `3`; ideal cycle map `T`, not `T⁻¹`, `T²` | holds |
| 2.6 triangle groups | `(2,3,cusp)`, `(2,3,7)`, `(2,3,6)` | sums `5/6`, `41/42`, `1`; `Δ(2,3,∞) = ℤ/2 ∗ ℤ/3 ≅ PSL(2,ℤ)` | holds |
| 3.2 cusp data | image of `PSL(2,ℤ)` at `∞`; `z+2`; `Γ(2)` | width `1`; `z+2` generates index `2`, no datum; width `2` | holds |
| 3.5 q-expansion | `j = q⁻¹+744+…`; datum change `q′=κq` | growth `exp(2π Im z)`, `n=1`: pole order ≤ 1, exactly 1; leading degree `N` kept | holds |
| 5.1 `genus` | `P¹`, torus, genus 2, `RP²` | `χ = 2, 0, −2, 1` → `0, 1, 2, 0`; `(−χ/2).toNat` gives `1` at genus 2 | determines genus |
| 5.1 b₁ even | graded commutativity at `p=q=1`; `GradedCommutativity.lean:63` | `a⌣a = (−1)¹ a⌣a` ⇒ `a⌣a = 0` over ℚ; alternating and nondegenerate ⇒ even dimension | holds; C02, question |
| 5.4 extension | `j` against the pinned hypotheses | invariant, meromorphic, holomorphic high up, `O(exp(2π Im z))`, `k=1` | holds |
| 5.6 Fuchsian RH | `Γ(2)`, `Γ₀(11)`, `Γ₀(2)` | `R=3+3+4=10`, `−2=−12+10`; `R=6+8+10=24`, `g=1`; genus formula `0`, `1`, `1+1/4−1/4−1=0` | holds; C01 |
| 5.6 `χ_orb` multiplicativity | `Γ(2) ≤ PSL(2,ℤ)` | `−1 = 6·(−1/6)`; pin: `covolume Δ = ENat.card(Γ⧸Δ)·covolume Γ` | holds |
| 6.2 descent of j | local multiplicities at `ρ`, `i` | upstairs `3`, `2` ÷ stabilizer `3`, `2` = `1`, `1` | holds |
| 6.4 X(1) ≃ P¹ | values at `ρ`, `i`, cusp | `E₄(ρ)=0 ⇒ 0`; `E₆(i)=0 ⇒ 1728`; cusp `↦ ∞`, degree `1` | holds |
| `isRiemannianManifold_upperHalfPlane` | `(i,2i)`; `(i,1+i)` | `2 arsinh(1/(2√2)) = log 2 = ∫₁² dy/y`; `arcosh(3/2) ≈ 0.9624 < 1` (horizontal) | holds |
| `eulerChar_eq_two_sub_two_mul_genus` | genus 3; `P¹⊔P¹`; `ℂ`; `X(1)` | `−4=2−6`; `χ=4`, genus `0`: `4≠2` (needs connected); `χ=1` not `2−2g` (needs compact); `2=2` | holds; hypotheses needed |
| `riemannHurwitz` | `z²`; ℘; genus 3 → genus 2 unramified | `−2=−4+2`; `0=−4+4`; `4=4+0`; sign error `−R`: `−6` | holds |
| `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, `Γ₀(11)`, `(2,3,7)` | `π/3, π, 2π, 4π, π/21`; trivial group not cofinite | holds |
| `pi_div_twentyOne_le_covolume` | `(2,3,8)`, `(2,4,5)`, `(3,3,4)`, `(0;2,2,2,2)` | `π/12, π/10, π/6`; `δ=0` excluded by cofiniteness | holds |
| `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)`; counts at `m=0,1` | T/T; F/F; F/F; `0=0` | both directions |
| 4a.1 case analysis | `(2,3,m)` with `m=6,7,8`; `(2,4,5)`; `(2,5,5)`; `(3,3,4)`; `(2,2,2,3)`; replacement `m=7` | `0, 1/42, 1/24`; `1/20`; `1/10`; `1/12`; `1/6`; `1/6−1/7=1/42` | minimum only at `(2,3,7)` |
| `minimum_area_finite_area_orbifold`, 4a.2 table | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(0;2,2;1)`, `(0;2,3,7)` | `π/3, π, π/2`; `δ=0`; `π/21 < π/3` without a cusp | holds; cusp needed |
| `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;3,3;1)` | T/T; F/F; `2π/3`: F/F | both directions |
| 4.5 polygon form, level one | standard triangle `(3,1,1)`; `k=0`; pinned statement | `π/3`; `4π/3`; pin `2π(−χ(X(1)) + Σ + c)`, now so described | holds (C03 repaired) |
| 5.7 cell count | `(3,1,1,1)`, `(4,0,0,3)`, `(4,0,0,1)`, `(8,0,1,0)` | `2, 2, 0, −2`; without midpoints `1`; without cusps `−1` | holds |
| Summary stabilizer clause (R01) | stabilizer of `i` in a Fuchsian group | order `2` in the image of `PSL(2,ℤ)`; clause now restricted to discrete subgroups | repaired |

- Source locators checked against the text: Martin2013, Theorem 2.1 (line 213) and Theorem 2.2 (lines 217–227), p. 6. These were checked against README 1002–1003, 1014–1024, 1060, 947–950 and 1565–1567, and against the `Suggested.lean` docstrings 93–97, 107–117 and 126–128.
- Library declarations opened at the pins: `TopCat.singularCup_gradedComm` (`AlgebraicTopology/Cohomology/GradedCommutativity.lean:63`), `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange_eq_two_pi_mul` (`Fuchsian/LevelOne/Signature.lean:105`), `MeasureTheory.covolume_eq_card_mul_covolume` (`MeasureTheory/Group/FundamentalDomain.lean:382`) and `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.covolume_eq_two_pi_mul` (`Fuchsian/Polygon/Area.lean:129`). I also read the declaration lists of `Cohomology/Cap/`, `Kronecker.lean` and `UniversalCoefficient.lean`, and every `def genus` at the pins: none is a topological genus of a space. The pins are unchanged since the head the previous review read.
- Pins-lack claims: instance search fails for `SecondCountableTopology PSL(2, ℝ)` and for `IsIsometricSMul (GL (Fin 2) ℝ) ℍ`.
- Cross-roadmap citations resolved on main: AlgebraicTopology §§6.2 (1991), 6.3 (2189, comparison at 2283), 6.4 (2571) and 8.7 (3325, marked-points form at 3353); ComplexManifolds Milestones 1–2 (172, 197); ComplexKahlerGeometry §7.7 (2943, `b₁=2h^(1,0)`); ModularForms §10A (1150), its contract with this roadmap (285) and its ownership paragraph (37–42); NoncongruenceModularForms 645–663. Headings are unchanged since the previous review, and the old "Layer k item n" citations of other roadmaps map to §k.n.
- Automatic checks: I reran the gate on this head and every check is 0 (`OK`). The dependency check reports `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line; FuchsianOrbifolds is line 53 of the merge order. Nothing outside the folder changes.
- Elaboration: `lake env lean` on `Suggested.lean` gives 8 `sorry` warnings (lines 58, 74, 84, 98, 110, 118, 129, 138) and nothing else. The one-tactic probe (`rfl`, `infer_instance`, `simp; done`, `norm_num; done`, `decide`) closes 0 of the 8. `#check @` on every declaration and on both exports gives types that match their README statements, hypotheses included. There is no `variable` block.
- Checks: there are 57 `**Checks.**` bullets, as the description says, and each was recomputed above or in its section's row.
- Overlap check: I read FuchsianOrbifoldsPartII, KleinianGroups, ArithmeticFuchsianGroups, TeichmullerGeometry and GroupActionsOnRiemannSurfaces (open), and BallQuotientsAndComplexHyperbolicLattices, NoncongruenceModularForms and ConformalMappingPartII (main); the list of closest roadmaps by results was empty. The shared objects and their owners are these.
  - The area formula, π/21 and π/3: owned here, and cited by ArithmeticFuchsianGroups and TeichmullerGeometry. GroupActionsOnRiemannSurfaces attributes π/21 to TeichmullerGeometry §10.1, which itself cites Layer 4a here; that citation is theirs to fix.
  - The topological genus and Riemann–Hurwitz in genus form: owned here. TeichmullerGeometry's `Surface.genus` and `riemannHurwitz` concern topological surfaces and branched covers, each in its own namespace, and that roadmap compares its genus with `χ = 2 − 2g`.
  - The canonical signature presentation: claimed by ArithmeticFuchsianGroups §1.4 and by GroupActionsOnRiemannSurfaces, and now disclaimed here.
  - The congruence-subgroup genus formula: owned by ModularForms §10A and NoncongruenceModularForms; C01.

Source independence: 10 passages compared with 1 source (Martin2013, lines 196–227). The longest shared run is the forced name "(2, 3, 7) triangle group". The largest share of the locators is Diamond–Shurman, 21 of 81, followed by Katok with 17. Contents were compared with Diamond–Shurman from the section numbers the README cites (§§2.1–2.4 and Theorem 3.1.1), not from its text: independent. Layers 0, 2 and 4a, and §§5.1–5.5 and 5.7, cite no Diamond–Shurman section. The order is the one the *Needs:* lines force: 1 and 2 after 0, 4 after 0–3, 5.4–5.7 after 4, 4a after 5.7, and 6 after 0–5.

Research link: Layer 4a states Siegel's minimal covolume π/21 (Siegel 1945), and §5.7 the signature area formula. Martin (2013, Theorems 2.1–2.2) presents both as the two-dimensional case of Siegel's minimal-covolume problem for hyperbolic lattices, after Kazhdan–Margulis. ModularForms §10A–10D and NoncongruenceModularForms build on the compactified quotients. This line rests on the README's references, Martin2013 lines 196–227 and ModularForms on main.

## Not verifiable

- Beardon1983, Forster1981, FarkasKra1992, DiamondShurman2005, Serre1973, Stillwell1992 and Siegel1945 are uncertified and cited by locator only. The seeded-sample locators into them (§§0.2, 0.3, 0.5, 1.1, 1.2, 1.5, 2.5, 2.6, 3.2, 3.5, 5.4, 6.2 and 6.4) were checked against the pinned declarations and by computation, not against the texts.
- Diamond–Shurman Theorem 3.1.1, the new locator in §5.6, could not be opened. The formula agrees with ModularForms §10A, which cites the same theorem, and with the computations above.
- Katok and Miranda (Miranda for §§1.1–1.5, 5.1, 5.2 and 5.4) have no manifest entry, so they were not fetched; this review edits no manifest.

Automatic checks set aside as false positives: the citation resolver reports that the README's `RiemannSurface.riemannHurwitz` occurs nowhere, but `Suggested.lean` declares it by `export` (line 151), and `#check` resolves it.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, p. 6: the source names the number of punctures with a lower-case letter, then writes an upper-case letter for it in the area formula; it should use one letter throughout; affects nothing.

## For the human reviewers

- Not tested: Diamond–Shurman (21 of 81 locators, uncertified) and Katok (17, no manifest entry) could not be read, so wording and arrangement were compared only with Martin2013.
- Licence: Katok and Miranda are cited in `TauCetiRoadmap/FuchsianOrbifolds/README.md` (References, lines 1553–1554 and 1561–1562) but have no entry in the package's sources manifest.
