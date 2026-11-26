# Review of IndexTheory (pull request #3170 at 57376f9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 22 changed lines since `87e7f72`. The change adds one thing to §1.6: for infinite-dimensional `E`, the path components of `FredholmLocus E E` form a monoid, and the index is a monoid isomorphism onto `Multiplicative ℤ`. It also adds two Checks, extends the *Needs:* line and adds a bullet to the `Suggested.lean` docstring saying this isomorphism is not statable. All of it is correct mathematics, every pinned name it cites exists at the pin, `Suggested.lean` elaborates with only its two `sorry` warnings, and the dependency check reports no problem. Accepted with one small correction and one format note, neither blocking; nothing is left for a human to decide.

## C01 — The component-monoid route proves Mathlib's `Joined.mul` again, and its *Needs:* line names neither that lemma nor the monoid's unit

As written, an implementer following the *Needs:* line of §1.6 (README lines 378–381) would prove from scratch a lemma that the pin already has. The sentence on line 352 says that if `γ` joins `a` to `a'` and `δ` joins `b` to `b'`, then `t ↦ γ t * δ t` joins `a * b` to `a' * b'`. That is Mathlib's `Joined.mul` (`Topology/Connected/PathConnected.lean`, line 91), which holds for any `Mul` with `ContinuousMul`; its path is `Path.mul` (`Topology/Path.lean`, line 518). The unit of `FredholmLocus E E` is `ContinuousLinearMap.IsFredholm.id` (`Analysis/Normed/Operator/Fredholm/Basic.lean`, line 420), and `LinearMap.index_id` gives it index 0. Neither name appears in the clause "for the component monoid, Mathlib …".

The fix is to add `Joined.mul` and `ContinuousLinearMap.IsFredholm.id` to that clause, or to cite `Joined.mul` on line 352 itself.

## N01 — The Mathlib supplier contract does not list the new inputs

The From Mathlib contract (lines 1587–1591) lists `IsFredholm.index_comp` but not `ContinuousLinearMap.IsFredholm.comp` or `ZerothHomotopy`. Both are now named on the §1.6 *Needs:* line. If C01 is applied, `Joined.mul` belongs there as well.

## Verified sound

Previous review (at 6d85f5d): it raised no finding, so there was nothing to repair. The README at the merge base and at this head both have 8 layers. None is removed or retitled, no item or Check is removed, and the three `Suggested.lean` declarations are byte-identical.

**Adversarial table.** It covers the changed statements, the §1.6 headline that carries the change, and the other sampled targets and headlines. The rows marked "carried" are from the previous reviews and lie in untouched text.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `FredholmLocus E E` is a topological monoid (lines 348–350) | `E = ℓ²(ℕ)`; `E = ℂ`; `E = 0` | `‖ST − S′T′‖ ≤ ‖S‖‖T−T′‖ + ‖S−S′‖‖T′‖`; `IsFredholm.comp`, `.id` at pin; on ℂ the zero map is Fredholm (ker ℂ, coker ℂ); `B(0) = {0}` | holds |
| `ZerothHomotopy M` is a monoid for a topological monoid `M` (lines 350–352) | `{0,1}` discrete under `×`; `S¹ ∪ {0} ⊂ ℂ` | π₀ is `{0,1}` itself; π₀ `= {[1],[0]}`, `[0]·[1] = [0]`; Lean probe: composition respects `Joined` on `FredholmLocus E E` | holds |
| Index descends to an isomorphism onto `Multiplicative ℤ`, `E` infinite-dimensional (lines 352–355) | `ℓ²(ℕ)`; `ℓ²(ℝ)`; `E = ℂ²` | `[S]↦−1`, `[S*]↦1`, `[S*S]=[1]↦0`, `[SS*]=[1−e₀₀]↦0`, `[S²]↦−2`; shift on countable family `↦ −1`; `ℂ²`: one component, image `{0}` | holds; infinite dimension needed |
| "Those components form a group" (line 355) | `[Sᵏ]` | inverse `[(S*)ᵏ]`: `−k + k = 0` | holds |
| Check: `S*∘S = 1`, `1 + (−1) = 0 = ind 1` (line 373) | backward ∘ forward shift | `(S*Sx)ₙ = xₙ`; `ind S = 0 − 1`, `ind S* = 1 − 0`; the wrong law `ind S − ind T` gives `2 ≠ 0` | true and discriminating |
| Check: finite-dimensional `E` gives the trivial monoid (lines 373–376) | `E = ℂⁿ`; `E = 0` | index `n − n = 0` (Lean probe, `index_eq_of_finiteDimensional`); `B(E)` convex, one component; `B(0) = {0}` | true |
| *Needs:* clause (lines 379–381) | each step of the route | `ZerothHomotopy` (PathConnected.lean:117), `IsFredholm.comp` (Basic.lean:544), `IsFredholm.index_comp` (:613) at pin; `Joined.mul`, `IsFredholm.id` unnamed | C01 |
| `Suggested.lean` docstring bullet (lines 15–18): not statable | `Monoid (ZerothHomotopy M)` at the pins | `infer_instance` fails; no instance in pinned Mathlib or Tau Ceti; the Prop form needs that instance; the rest is `index_comp` plus the two stated theorems | holds; no headline missing |
| I1.6 `normPath_iff_index_eq` against Freed display (3.13), p. 13 | `ℂ² → ℂ`; `ℓ²(ℕ) → ℂ`; `ℓ²(ℕ)`; `ℓ²(ℕ) → ℓ²(ℝ)` | one component, index 1; empty locus; indices 0, −1, +1 separate; empty locus. Freed gives the isomorphism with no hypotheses | holds; README adds the needed hypotheses |
| I1.6 `exists_index_eq` | `E = F = ℓ²(ℕ)`, `e = refl`; `E = ℂ²` | `Sᵏ`, `(S*)ᵏ` give `−k`, `k`; `¬FiniteDimensional` excludes `ℂ²`, whose image is `{0}` | holds |
| I5.5 `ind_a = ind_t`, equivariant (headline; Freed Theorem 4.18 opened) | point; SO(2) on S²; circle Toeplitz | `a − b` on both sides; de Rham `2·1`; `−1` on both sides | holds |
| I4.2 equivariant quantization Checks | trivial `G`; SO(2) on S²; `P = 0`, `A = 1/2` on ℂ | `ind_a^G = ind_a`; `1 + 1 = 2` trivial; spectrum `{1/2}` sits on the gap, so the projection is undefined | holds |
| I8.1 induced maps | `f = id`, `φ = id`; constant `f` with trivial `E` | identities, trace `χ(M,E)`; `f*` zero on `(0,q)`-forms for `q > 0`, evaluation on constants | holds |
| I1.1, I1.2, I1.4 (carried) | `0 : ℂ² → ℂ`; snake on `ℂ²`; `‖π(Id)‖` on ℓ², ℂ², 0 | index 1; six terms ℂ, `δ(y) = y`; 1, 0, 0 | holds |
| I2.3, I2.5 (carried) | `(ℂ^b, ℂ^a, 0)`; block rotation `t = 0, π/2`; `(g,h) = (2,3)` | `b − a`; `diag(σ,σ*)`, `[[0,−1],[1,0]]`; `−3 = −3` | holds |
| I3.4, I3.5 (carried) | `G = {1}`; O(1) on S¹; values `0`, `2·ind_t` | `ind_t^G = ind_t`; `ℝ ⊕ ℝ_sgn`; normalisation excludes 0 and 2 | holds |
| I4.4, I5.3 (carried) | `Q = 0 : ℂ^p → ℂ^q`; rotation by θ | `ind_a(a)·(p − q)`; eigenvector `e^{iθ}(1,−i)ᵀ`, det trivial on SO(2) | holds |
| I6.4, I8.3 (carried) | genus g, ℂP², K3; ℂP¹ with `z ↦ qz` | `1 − g`, `1`, `2`; `1 + q` | holds |

- Source locators checked against the text: Freed (arXiv 2107.03557v1) display (3.13), p. 13 (I1.6), and Theorem 4.18 (I5.5). The other sampled locators lie in untouched text.
- Declarations opened at the pins:
  - Mathlib 1b1ccf4b: `IsFredholm.comp` (Fredholm/Basic.lean:544), `IsFredholm.id` (:420) and `IsFredholm.index_comp` (:613); `LinearMap.index`, `index_comp` and `index_eq_of_finiteDimensional` (Algebra/Module/LinearMap/Index.lean); `ZerothHomotopy` (PathConnected.lean:117), `Joined.mul` (:91) and `Joined.prod` (:650); `Path.mul` (Path.lean:518).
  - Tau Ceti 2fd255d9: `Path.index_eq` (Analysis/Fredholm/ContinuousFamily.lean:81).
  - Neither library has a monoid instance on `ZerothHomotopy`, a Fredholm submonoid or an index monoid hom.
- Cross-roadmap citations: the change adds none. PseudodifferentialOperators P4.2 (line 431) resolves to §4.2 under Layer 4 (P4) on main, line 753.
- Automatic checks: rerun at this head, all pass apart from the check for edits outside the folder, set aside below. Dependency check: `depcheck: 122 roadmaps, 1393 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Outside the sixteen folders the pull request owns, the diff is empty.
- Elaboration: `lake env lean` on `Suggested.lean` takes 6 s and warns only `declaration uses sorry` at lines 52 and 64. A scratch copy with `#check @` for all three declarations gives types identical to the recorded signatures, with no binder lost.
- The same scratch copy proves at the pin that:
  - composition respects `Joined` on `FredholmLocus E E`;
  - `index (S ∘L T) = index S + index T` in the file's own form;
  - the identity has index 0;
  - in finite dimension every endomorphism has index 0.

  `Monoid (ZerothHomotopy M)` fails to synthesize.
- Ownership: the change adds no construction that another roadmap owns. A search of main and the open heads for `ZerothHomotopy` and for monoid or group structures on π₀ finds only inline uses: TeichmullerGeometry §3.1 for π₀ Diff(Σ), CharacteristicClasses for π₀(G) and the ∞-categorical π₀ Map. None claims the general structure. Nothing states π₀ Fred ≅ ℤ elsewhere.
- Overlap check: read PseudodifferentialOperators, SeibergWittenTheory and SpectralManifolds (main), and CharacteristicClasses, TangentialBordism, PositiveScalarCurvature and ComplexKahlerGeometry (main text, open heads searched). The list of closest roadmaps by results is empty. Nothing is shared: the one new object, the component monoid of `FredholmLocus E E`, is owned here.

Source independence: changed passages only. Five passages compared (the new §1.6 paragraph, its two Checks, the extended *Needs:* line, the new docstring bullet) with one source (Freed, display (3.13), p. 13): no wording shared. The largest share of locators is Atiyah–Singer I, 13 of 24. Arrangement not compared: the diff adds, removes or reorders no layer.

Research link: the roadmap proves the Atiyah–Singer index theorem (Atiyah–Singer, Ann. of Math. 1968) with its cohomological form, and the Atiyah–Bott holomorphic Lefschetz formula (1968). The changed §1.6 is the classification of Fredholm operators up to norm paths by the index (Freed 2021, display (3.13)), and SeibergWittenTheory consumes Layers 1–7. Based on the README overview and References.

## Not verifiable

- These sampled targets lie in untouched text that the change does not affect, so in this review of the change they were not re-read against Atiyah–Singer I, Atiyah–Bott II or Atiyah (QJM): I1.1, I1.2, I1.4, I2.3, I2.5, I3.4, I3.5, I4.2, I4.4, I5.3, I6.4, I8.1 and I8.3. Earlier reviews checked them, and their rows are carried above.

Automatic checks set aside as false positives: the check for edits outside the folder, rerun without the list of this pull request's own folders, flagged the 29 files of the fifteen other roadmap folders the pull request changes, all of which it owns. The citation lead "PseudodifferentialOperators P4.2" resolves to that roadmap's §4.2 under its Layer 4, labelled P4.

## Source issues

- **Gap** in Freed 2021 (arXiv 2107.03557v1) at display (3.13), p. 13: the source says the index from path components of Fredholm operators between two Hilbert spaces onto ℤ is an isomorphism, with no hypothesis on the spaces; it should be restricted to infinite-dimensional spaces of equal Hilbert dimension, since in finite dimensions the image is one integer and for unequal infinite Hilbert dimensions there are no Fredholm maps; affects nothing.

## For the human reviewers

- none
