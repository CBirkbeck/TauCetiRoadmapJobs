# Review of FuchsianOrbifolds (pull request #2576 at 090b043)

**Verdict:** accepted

**Summary.** Accepted, with no finding. The head is the one the previous review read, so its two small corrections and its format note stand unrepaired and are restated here; an independent recomputation of every theorem, Check, worked example and case table found nothing further. The two corrections are that the congruence-subgroup genus formula in §5.6 reads as a result of this roadmap although ModularForms §10A and NoncongruenceModularForms plan it on main, and that the *Needs:* line of §5.1 omits AlgebraicTopology §6.3. None of the three remarks blocks. Two questions are left for the human reviewers: the two most-cited sources could not be read, and two cited texts are not in the sources manifest.

## C01 — The congruence-subgroup genus formula in §5.6 is a target of ModularForms §10A and of NoncongruenceModularForms on main, but here it reads as part of what §5.6 proves

In §5.6 (lines 903–907), between "The first is the Fuchsian Riemann–Hurwitz formula" and "The second is …", inside the paragraph that opens "Prove the following two statements", stands the sentence "For Γ the image of PSL(2, ℤ) and Γ′ the image of a congruence subgroup, … turn it into the genus formula `g(Γ′) = 1 + d/12 − ε₂/4 − ε₃/3 − ε∞/2`". A reader takes it for a third result planned here. ModularForms §10A plans exactly this derivation and defines ε₂, ε₃, ε∞ (its README, lines 1153–1161: identify the degree and the local multiplicities, "then apply Riemann–Hurwitz to obtain" the formula), and NoncongruenceModularForms 2.3 proves it for every finite-index subgroup (its README, lines 650–663). This README's own Scope already gives ModularForms "the congruence-subgroup arithmetic of `X(Γ)` (§10A)" (line 1253).

The formula is right: `(d, ε₂, ε₃, ε∞) = (6, 0, 0, 3)` for Γ(2) gives `1 + 1/2 − 3/2 = 0`, and `(12, 0, 0, 2)` for Γ₀(11) gives `1 + 1 − 1 = 1`, as in the Examples of Layer 5. Only the attribution needs to change, for instance "ModularForms §10A specialises it, for congruence subgroups, to the genus formula … (Diamond–Shurman, Theorem 3.1.1)", or the sentence could move to the Examples of Layer 5. The description's bullet "In 5.6, the level-one case of the Fuchsian Riemann–Hurwitz formula" under "What it adds" would then take the same wording.

## C02 — The route of §5.1 needs AlgebraicTopology §6.3 to pass from the orientation of ComplexManifolds Milestone 2 to a fundamental class, and its *Needs:* line omits it

AlgebraicTopology §6.4 states duality for a manifold with a fundamental class μ (its README, lines 2573–2578). ComplexManifolds Milestone 2 gives a smooth orientation. The comparison of the two is in AlgebraicTopology §6.3: smooth orientations correspond bijectively to integral homological orientations (its README, lines 2284–2288). The route "ComplexManifolds Milestone 2 orients `X`, and the Poincaré duality of AlgebraicTopology §6.4 gives …" (lines 789–790) therefore passes through §6.3, and an implementer who follows the *Needs:* line (lines 795–797) has an orientation but no class to cap with. Adding "AlgebraicTopology §6.3 (from the smooth orientation to a fundamental class)" to that line and to the AlgebraicTopology contract (lines 1540–1542) completes the route.

## N01 — The References entry for Diamond–Shurman lists only §§2.1–2.4

§5.6 cites Diamond–Shurman, Theorem 3.1.1, while the entry (lines 1555–1556) lists §§2.1–2.4; "§§2.1–2.4 and Theorem 3.1.1" would match.

## Questions for the author

- §5.1 says the cup-product pairing on `H¹(X; ℚ)` is nondegenerate "by that duality over the field `ℚ`". Besides the cap isomorphism of AlgebraicTopology §6.4 this uses the identity `⟨a ⌣ b, μ⟩ = ⟨a, b ⌢ μ⟩`, up to sign, and universal coefficients over ℚ. I found no cup–cap adjunction among the theorem names of the pinned `AlgebraicTopology/` tree, nor by name in AlgebraicTopology §§6.2–6.4; §6.4 promises "field-coefficient" corollaries (its README, line 2637) without naming them. Is the nondegenerate pairing meant to be one of those corollaries, or should the route name the identity as its own step?
- §§0.1 and 0.2 cite Beardon, Chapters 7–8, and Katok, §§2.1–2.4, for second countability of PSL(2,ℝ) and for the isometric action of the elements of negative determinant. Do those chapters state these facts? Neither text could be opened.

## Previous findings

- The previous review, on this same head, had no finding. Its two small corrections (the genus formula of §5.6; AlgebraicTopology §6.3 in §5.1) and its format note (the Diamond–Shurman entry) are unchanged in the text and are C01, C02 and N01 above.
- Its earlier-round repairs still hold at this head: lines 5–6 read "under which every point stabilizer of a Fuchsian group is a finite cyclic group"; the Scope (lines 1189–1192) reads "it derives from them no canonical presentation by the signature"; lines 751–753 describe the level-one formula with `−χ(X(1))`, as the pinned statement has it.

## Verified sound

| Statement | Instances | Values computed (README side / pin or computation) | Result |
|---|---|---|---|
| 0.2 GL(2,ℝ) isometries | `diag(1,−1)`, `diag(2,1)`; search of both pins | `1+i ↦ −1+i`; `cosh dist = 3/2` on both pairs, `= cosh(2 arsinh(1/2))`; no `IsIsometricSMul (GL …) ℍ` at the pins | holds; target is new |
| 1.2 cyclic quotient | `m=2`, `ε=2 artanh(1/2)`; `ε=0` | `(1/2)² = 1/4`; empty disc both sides; pin takes `0 ≤ ε` and a finite stabilizer (`Elliptic.lean:176`) | holds |
| 1.3 coarse atlas | image of `PSL(2,ℤ)` | multiplicities `2, 3, 1` at `i`, `ρ`, elsewhere; pin: `IsManifold 𝓘(ℂ) ω` (`CoarseQuotient.lean:130`) | holds |
| 2.3 Poincaré's theorem | standard triangle | `3 · 2π/3 = 2π`; pin hypotheses `orderOf(cycleMap) · cycleAngleSum = 2π`, parabolic ideal cycles (`Poincare.lean:75–102`) | holds |
| 2.4 Dirichlet polygons | pin signatures | centre in the free locus, `Γ.IsCofinite` (`Cofinite.lean:225, 240`) | as described |
| 2.5 cycles, boundary word | standard triangle | cycle `{ρ, ρ+1}`, sum `2π/3`, order `3`; ideal cycle map `T`; pins `Cusp/Polygon.lean:49, 68, 90` | holds |
| 2.6 triangle groups | `(2,3,cusp)`, `(2,3,7)`, `(2,3,6)` | sums `5/6`, `41/42`, `1`; `Δ(2,3,∞) = ℤ/2 ∗ ℤ/3 ≅ PSL(2,ℤ)` | holds |
| 3.4 q-coordinate | `σ′=2z`; `σ′=2z+1/2` | `q′=q`; `q′ = exp(πi/2) q = iq`, wrong formula gives `−q`; pins `ChangeScaling.lean:88, 98` | holds |
| 4.2 compactness | `⟨z ↦ z+1⟩`; `PSL(2,ℤ)` | punctured disc plus cusp = open disc, not compact; `{|x|≤1/2, |z|≥1, y≤2}` compact; pin `Cofinite.lean:163` | cofiniteness needed |
| 4.3 atlas | two data, `σ′=aσ+b` | transition is multiplication by `exp(2πib/(aw)) ≠ 0`; `i` in the example of 3.4 | holds |
| 4.4 maps of compactifications | `Γ(2)` in `PSL(2,ℤ)` | fibre sums `3·2`, `3·2`, `2·3`, all `6` = index | holds |
| 4.5 polygon area formula | Gauss–Bonnet rederivation; `(3,1,1)`; `k=0` | `(n−2)π − Σ 2π/m_v` equals the stated form; `π/3`; `4π/3`; pin `Area.lean:129` | holds |
| 5.5 quotient map | `Γ(2)`; pin | degree `6`; carrier needs finite relative index only (`FiniteHolomorphicMap.lean:38`) | holds |
| 6.2 descent of j | `ρ`, `i` | upstairs `3`, `2` ÷ stabilizer `3`, `2` = `1`, `1` (`ModularInvariant.lean:124, 131`) | holds |
| 6.5 no backward transfer | order of the pinned construction | `degree jSphere = 1` (`Sphere.lean:160`) precedes the biholomorphism | as described |
| `isRiemannianManifold_upperHalfPlane` | `(i,2i)`, `(i,1+i)`; instance in scope | `2 arsinh(1/(2√2)) = log 2 = ∫₁² dy/y`; `arcosh(3/2) ≈ 0.9624 < 1`; the bundle instance is the Poincaré one (`PoincareMetric.lean:144`) | holds |
| `genus` | `P¹`, torus, genus 2, `RP²` | `χ = 2, 0, −2, 1` → `0, 1, 2, 0`; `(−χ/2).toNat` gives `1` at genus 2 | determines genus |
| `eulerChar_eq_two_sub_two_mul_genus` | genus 3; `P¹⊔P¹`; `RP²` | `−4 = 2−6`; `χ=4`, genus `0`, `4≠2`; `1 ≠ 2` | holds; connected and complex needed |
| 5.1 `b₁` even | `p=q=1` in `GradedCommutativity.lean:63` | `a⌣a = −a⌣a` ⇒ `0` over ℚ; alternating nondegenerate ⇒ even | holds; C02, question |
| `riemannHurwitz` | `z²`; ℘; genus 3 → 2 unramified | `−2=−4+2`; `0=−4+4`; `4=4+0`; with `−R`: `−6` | holds |
| 5.6 Fuchsian RH, genus formula | `Γ(2)`, `Γ₀(11)` | `R=3+3+4=10`, `−2=−12+10`; `R=6+8+10=24`, `g=1`; formula `0`, `1` | holds; C01 |
| 5.6 `χ_orb` | `Γ(2) ≤ PSL(2,ℤ)` | `−1 = 6·(−1/6)`; pin: index in `ℕ∞` times covolume (`FundamentalDomain.lean:382`) | holds |
| 5.7 cell count | `(3,1,1,1)`, `(4,0,0,3)`, `(4,0,0,1)`, `(8,0,1,0)` | `2, 2, 0, −2`; without midpoints `1`; without cusps `−1` | holds |
| `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, `Γ₀(11)`, `(2,3,7)` | `π/3, π, 2π, 4π, π/21` | holds |
| `pi_div_twentyOne_le_covolume` | `(2,3,8)`, `(2,4,5)`, `(3,3,4)`, `(2,2,2,3)`; cusp replacement | `δ = 1/24, 1/20, 1/12, 1/6`; `1/6 − 1/7 = 1/42` | holds |
| `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)`; `m=0,1` | T/T; F/F; F/F; counts `0=0` | both directions |
| `minimum_area_finite_area_orbifold` | rows of the table; `(0;2,3,7)` | `δ ≥ 3, 1, 1, 1/2`; `(2,2): 0`, `(2,3): 1/6`, `(2,4): 1/4`, `(3,3): 1/3`; `π/21 < π/3` | holds; cusp needed |
| `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;3,3;1)` | T/T; `π`: F/F; `2π/3`: F/F | both directions |

- Source locators checked against the text: 2 (Martin2013, Theorem 2.1 at line 213 and Theorem 2.2 at lines 217–227, p. 6), against README lines 947–950, 1002–1003, 1014–1024, 1060 and 1565–1567 and three docstrings of `Suggested.lean`.
- Library declarations read at the pins (statement and hypotheses): 16, namely those cited with a line in the table, `TauCeti.one_div_forty_two_le_hyperbolic_deficit` (`Data/Rat/BranchDeficit.lean:116`), `MeasureTheory.covolume_pos` (`MeasureTheory/Group/FundamentalDomain.lean:358`), `Subgroup.IsCofinite` (`Fuchsian/Covolume.lean:117`), `TauCeti.eulerChar_onePoint` and `TauCeti.eulerChar_torus`, the branched-cover formula (`Branch/EulerCharacteristic.lean:130`) and `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange_eq_two_pi_mul` (`Fuchsian/LevelOne/Signature.lean:105`). Every `def genus` at the pins was read: none is the genus of a space.
- Pins-lack claims: no `IsRiemannianManifold` statement for ℍ, no `SecondCountableTopology` instance for `SL(2,ℝ)` or `PSL(2,ℝ)` and no `IsIsometricSMul (GL (Fin 2) ℝ) ℍ` in either pinned tree.
- Cross-roadmap citations resolved on main: AlgebraicTopology §§6.3, 6.4, 7.1 and 8.7 (the marked-points form at line 3353), ComplexManifolds Milestones 1, 2 and 4–6, ComplexKahlerGeometry §7.7, ModularForms §§10A–10D, AlgebraicCurves Layers 0 and 12, and the `RiemannSurface.genus` citations of PseudoholomorphicCurveAnalysis and NoncongruenceModularForms. Other roadmaps cite this one by layer and by "Layer k item n", which is §k.n here.
- Automatic checks: all passed. The dependency check prints `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The pull request changes nothing outside the folder.
- Elaboration: `Suggested.lean` gives eight `sorry` warnings (lines 58, 74, 84, 98, 110, 118, 129, 138) and nothing else. On a probe copy of the file, `rfl`, `infer_instance`, `simp` and `unfold genus; omega` close none of the five statements tried; the three equivalences were judged by reading. The elaborated types match the README statements, hypotheses included; the file has no `variable` block.
- Checks: 57 bullets, as the description says; each was recomputed.
- Overlap check: read FuchsianOrbifoldsPartII, KleinianGroups, ArithmeticFuchsianGroups, TeichmullerGeometry, GroupActionsOnRiemannSurfaces (open), BallQuotientsAndComplexHyperbolicLattices, NoncongruenceModularForms, ConformalMappingPartII (main); the third list is empty. Area formula, π/21 and π/3: owned here, cited by ArithmeticFuchsianGroups and TeichmullerGeometry. Topological genus and Riemann–Hurwitz: owned here. Congruence genus formula: ModularForms §10A and NoncongruenceModularForms (C01).

Source independence: 8 passages compared with 1 source (Martin2013, lines 196–227), none shared beyond the forced name of the (2, 3, 7) triangle group; largest share Diamond–Shurman, 21 of 81 locators, then Katok with 17; contents compared with Diamond–Shurman only through the section numbers the README cites (§§2.1–2.4, Theorem 3.1.1), its text and table of contents not being readable: independent as far as that shows, since Layers 0, 2 and 4a and §§5.1–5.5 and 5.7 cite no section of it, and the layer order is the one the *Needs:* lines force.

Research link: Layer 4a states Siegel's minimal covolume π/21 (Siegel 1945) and §5.7 the signature area formula, which Martin (2013, Theorems 2.1–2.2) presents as the two-dimensional case of the minimal-covolume problem for hyperbolic lattices. Rests on Martin2013 lines 196–227 and the README's references.

## Not verifiable

- Beardon1983, Forster1981, FarkasKra1992, DiamondShurman2005, Serre1973, Stillwell1992 and Siegel1945 are cited by locator only. Every locator of the sampled sections (0.2, 1.2, 1.3, 2.3–2.6, 3.4, 4.2–4.5, 5.5, 6.2, 6.5) points into them or into Katok or Miranda, so those sections were checked against the pinned declarations and by computation, not against the texts.
- Katok and Miranda are not among the texts the sources manifest records and were not read.

Automatic checks set aside as false positives: the citation resolver lists the README's `RiemannSurface.riemannHurwitz` as found nowhere, but `Suggested.lean` declares it through its `export` line (line 151).

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, p. 6: the source says the surface has a number of punctures named by a lower-case letter, then uses an upper-case letter for it in the area formula; it should be one letter throughout; affects nothing.

## For the human reviewers

- Not tested: Diamond–Shurman (21 of 81 locators, cited by locator only) and Katok (17, not in the manifest) could not be read, so wording and arrangement were compared with Martin2013 alone.
- Licence: Katok and Miranda are cited in `TauCetiRoadmap/FuchsianOrbifolds/README.md` (References, lines 1553–1554 and 1561–1562) but have no entry in the roadmap's sources manifest.
