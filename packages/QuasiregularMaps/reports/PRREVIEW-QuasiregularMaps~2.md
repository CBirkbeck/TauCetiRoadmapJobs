# Review of QuasiregularMaps (pull request #2134 at 97e2d44)

**Verdict:** needs changes

Incremental re-review of the 101 lines changed since 64a7eb8. Six of the seven previous findings are repaired and the repairs introduce no new defect. One remains, and it needs no edit in the roadmap folder.

## R01 (P2) — The orientation-descent gap is still declared against DifferentialGeometry

**Location:** `TauCetiRoadmap/QuasiregularMaps/README.md:88`: “No roadmap plans the orientation of the quotient manifold of a general free, properly discontinuous action; it is owned here (§7.5).” Compare `packages/QuasiregularMaps/design/plan.json:1995` on the board's main branch.

**Claim:** §7.5 is the single owner of orientation descent. The intake record still asks DifferentialGeometry (“Layer 2 (missing section; proposed DifferentialGeometry, Part II)”) for the same theorem, so the gap asks for what this roadmap provides.

**Witness:** At the board's main the plan still has the `orientation-descent` entry in `gaps` (line 1995), the prerequisite `gap:orientation-descent` of §7.6 (line 1769) and the supplier note (line 1868). The previous repair's removal was not landed there. The README has no matching contract.

**Repair:** Nothing changes in `TauCetiRoadmap/QuasiregularMaps/`. On the board, delete the `orientation-descent` entry from the plan's `gaps`, replace the prerequisite at line 1769 by this roadmap's §7.5, and drop the gap clause from the DifferentialGeometry supplier note, so that the gap is never announced to DifferentialGeometry. Test on `ℤⁿ` acting on `ℝⁿ` by translations: every `dγ = id`, `det = +1`, and both descriptions ask for the orientation with `dπ(o) = o/Γ`; after the removal that object has one owner (§7.5) and six declared gaps remain, all Sobolev.

## Previous findings

- R01 — repaired: README:1488 “exactly one pair of identified vertices … all other vertex images distinct”; README:1564–1570 gives rank `n − 1 ≥ 1` for that case and “Total collapse … is `1`-quasiregular (§2.1)”.
- R02 — repaired: README:1199 “its differentiation and stability assertions below, and §5.2, assume `F` finite-dimensional”; README:1228 “For finite-dimensional `F`, the partial derivatives of an `ACL` map exist almost everywhere”; both Lean docstrings qualified.
- R03 — repaired: README:1504 “the classical differential of `p|κ(σ°)` exists at every `x ∈ κ(σ°)`. The chosen weak differential `Dp` agrees with this classical differential almost everywhere”; modified-identity Check at README:1530.
- R04 — repaired: README:1636 “if `0 < α ≤ β`, `α|w| ≤ |w|' ≤ β|w|` on `TN`”; Checks at README:1649–1653 exclude `α = −2` and `α = 0`.
- R05 — repaired: README:63 “Already in Tau Ceti are the singular-value perturbation bound …”; contract bullets at README:259–268; §1.1 keeps only “`ℓ(B ∘ A) ≥ ℓ(B) ℓ(A)`” and cites the four declarations in its *Needs*.
- R06 — not repaired: the README is unchanged and consistent (one local owner, §7.5), but `packages/QuasiregularMaps/design/plan.json:1995` on the board's main still declares the gap. Raised again as R01 above.
- R07 — repaired: `packages/QuasiregularMaps/sources.toml:182` has one `Lee2012` record (DOI 10.1007/978-1-4419-9982-5, Ch. 15, cited for 7.5, uncertified).

## Verified sound

**Scope of this round.** The diff touches Scope and ownership, the Tau Ceti contract, §1.1, the Layer 5 preamble and §5.1, §6.2, §6.3, §6.4, §7.3, and two docstrings of `Suggested.lean`. No declaration body, binder or statement changed. The outside-folder diff is empty and the worktree is clean.

**Gate.** The worker's gate at 97e2d44 reports every counter zero, including the targeted build. My own run of the gate printed the same counters, all zero, ending `OK`.

**Dependency check.** Output:

    depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. The one new supplier citation, SobolevMapsBetweenManifolds §4.3 in the *Needs* of §6.3, resolves to “4.3 The weak differential (T2)” at `packages/SobolevMapsBetweenManifolds/design/README.md:906` and is covered by the declared gap `sobolev-maps-weak-differential`. The six Sobolev gaps are unchanged, with the same slugs in the plan and the README; the acceptance of this folder is conditional on them, as before. The citation resolver's three leads are not defects: SobolevMapsBetweenManifolds is the declared supplier (last before this roadmap in the merge order), and the two Lean names are declarations of `Suggested.lean`, confirmed by elaboration.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` gave five `declaration uses sorry` warnings (lines 90, 106, 160, 177, 191) and nothing else. I elaborated a scratch copy with `#check @name` for all ten declarations and compared each type with the README: nothing changed against the previous round. `formalDeriv`, `IsACLOn` and `IsACLpOn` carry no finite-dimensionality binder; `isACLpOn_iff_exists_hasWeakFDerivOn` and `ae_hasLineDerivAt_of_hasWeakFDerivOn` carry `[FiniteDimensional ℝ F]`. This is exactly the split the repaired Layer 5 preamble and docstrings now state, so README and Lean generality agree. The statements are untouched, so the one-tactic padding probes and the headline coverage of the previous report stand (five headline theorems stated; the five manifold headlines named in the module docstring with the missing carrier).

**Pinned declarations opened (5), Mathlib 1b1ccf4, Tau Ceti 2fd255d.**

| Declaration | File and line at the pin | What the README now says of it | Agrees |
| --- | --- | --- | --- |
| `LinearMap.abs_singularValues_sub_singularValues_le` | `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean:106` | Every index, finite-dimensional inner product spaces, bound by the operator norm of `A − B` | Yes; statement is over `RCLike 𝕜`, any `n : ℕ` |
| `LinearMap.singularValues_linearIsometryEquiv_comp` | `TauCeti/Analysis/InnerProductSpace/SingularValues.lean:589` | Left composition with an isometric equivalence preserves the singular values | Yes |
| `LinearMap.singularValues_comp_linearIsometryEquiv` | same file, line 595 | Right composition, with `V : G ≃ₗᵢ E`, so the domain dimension and hence the index `n − 1` are unchanged | Yes |
| `LinearMap.singularValues_smul` | same file, line 602 | Scaling by `c` multiplies by `‖c‖`, not by `c` | Yes |
| `TauCeti.HasWeakFDerivOn.congr_ae_deriv` | `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:453` | An almost-everywhere equal field is still a weak derivative | Yes |

The cited `AbsolutelyContinuousOnInterval.ae_differentiableAt` (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean:444`) is stated for `f : ℝ → ℝ`; the repaired bullet calls it scalar and applies it componentwise, which is correct.

**Sources.** Of the seeded sample only §1.1 falls in a changed passage. MartioRickmanVaisala1969 line 127 (printed p. 6) defines the quantity `ℓ(T)` as the minimum of `|Tx|` over unit vectors, for linear self-maps of `ℝⁿ`; the README's statement for maps between two inner product spaces is its own extension and says so through the singular-value definition. I also re-read MartioRickmanVaisala1969 lines 332–340 (Definition 2.16) for the repaired §5.1: the source's maps take values in `ℝᵐ`, so its remark that ACL maps have partial derivatives almost everywhere is a finite-dimensional statement, which the repair now matches. The other fourteen seeded targets lie in untouched text.

**Adversarial table: changed statements (values computed this round).**

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 perturbation bound, now consumed | `diag(3,1/2)` vs `diag(3,3/4)`; shear `[[1,1],[0,1]]` vs `I` | `1/4 ≤ 1/4`; `ℓ(S) = (√5−1)/2 ≈ 0.618`, `|0.618 − 1| = 0.382 ≤ ‖S − I‖ = 1` | Pass | None |
| §1.1 scalar law, now consumed | `c = −2`, `c = 0` on `diag(3,1/2)` | `ℓ = 1 = 2·(1/2)`; `ℓ = 0 = 0·(1/2)`; signed scalar would give `−1 < 0` | Pass; `‖c‖` needed | None |
| §1.1 isometry laws, now consumed | quarter turn on the left, coordinate swap on the right of `diag(3,1/2)` | Gram matrices `diag(9,1/4)` and `diag(1/4,9)`; `ℓ = 1/2` both times; swap has `det = −1`, irrelevant | Pass | None |
| §1.1 “`1`-Lipschitz, hence continuous and Borel” | `A_t = diag(3, 1/2 + t)`, `|t| < 1/4` | `|ℓ(A_t) − ℓ(A_0)| = |t| = ‖A_t − A_0‖` | Pass | None |
| §5.1 infinite-dimensional control | `u(t)(s) = |t − s|`, `t = 1/2`, `r = 1/4` | `sup_s ||1/2 − s| − |1/4 − s|| = 1/4 = |t − r|` (at `s = 0`); evaluation at `s = t`: quotients `|h|/h = +1`, `−1` | 1-Lipschitz, ACL, nowhere differentiable; hypothesis essential | None |
| §5.1 finite-dimensional differentiation | `t ↦ |t − 1/2|`; `u = (t, |t|)` into `ℝ²` | derivatives `−1`, `+1` off `{1/2}`; `(1, sign t)` off `{0}`; exceptional sets of measure `0` | Pass | None |
| `formalDeriv` docstring | the `C([0,1])` curve; `|t|` | `lineDeriv` is `0` at every `t` for the curve (set of failure has measure `1`, not `0`); for `|t|` failure only at `0` | Qualified docstring correct, unqualified one was false | None |
| §6.2 one-pair collapse | triangle `0, e₁, e₂ ↦ 0, e₁, 0`; tetrahedron `0, e₁, e₂, e₃ ↦ 0, e₁, e₂, 0` | matrices `diag(1,0)`, `diag(1,1,0)`; ranks `1 = n − 1`, `2 = n − 1` | Pass | None |
| §6.2 total collapse | all vertices to one, `n = 1, 2` | rank `0`, `‖dp‖ⁿ = 0`, `J = 0`; `0 ≤ 1·0` | 1-quasiregular, agrees with §2.1 | None |
| §6.4 rank `n − 1` control and its `n ≥ 2` | `diag(1,0)`, `diag(1,1,0)`; edge collapse `n = 1` | `1 > K·0` for every finite `K` in both; for `n = 1` rank `0` and `0 ≤ 0` | Negative control valid exactly for `n ≥ 2`, as stated | None |
| §6.4 sufficient theorem against the new Checks | identity; torus doubling `diag(2,1)`; constant | `K_p = 1`; `4/2 = 2`; constant is degenerate, theorem silent, map 1-quasiregular | No contradiction between theorem and Checks | None |
| §6.3 classical versus chosen weak differential | `id` with `D(x₀) = 0`; `|x₁|` on a triangulated `ℝ²` | `D(x₀) = 0 ≠ id`, equality off a singleton; rows `(±1, 0)` on the interiors, skeleton line `x₁ = 0` null | Almost-everywhere statement true, pointwise one false | None |
| §6.3 passage to all of `M` | exceptional null set in each top simplex interior plus the lower skeleton | countably many top simplices (disjoint non-empty open images in a second countable `M`); `Σ 0 + 0 = 0`; §2.8 also gives `Dp = mfderiv p` a.e. directly | Pass | None |
| §7.3 with `0 < α ≤ β` | equal metrics; `g' = 9g`, `n = 3`; `dx² + 4dy²` on `T²` | factor `1`; norm ×3, `J` ×27, factor `(3/3)³ = 1`; `α = 1`, `β = 2`: covering has `‖dπ‖'² = 4`, `J' = 2`, `q_O = 2 ≤ 4` | Pass | None |
| §7.3 excluded constants | `ℝ`, `α = −2`, `β = 1`; `α = 0` | inequalities hold, factor `(1/−2)¹ = −1/2 < 1`; `α = 0` leaves `β/α` undefined | Both excluded by `0 < α` | None |
| §7.3 against §4.1 | §4.1 with `a = b = 1` | `(bβ/(aα))ⁿ = (β/α)ⁿ`; §4.1 already assumes `0 < α ≤ β` | Same hypotheses in both sections now | None |
| §7.5 single ownership | `ℤⁿ` translations on `ℝⁿ`; glide `(x,y) ↦ (x+1, −y)` | `dγ = id`, `det = +1`, `dπ(o) = o/Γ`; glide `det = −1`, excluded | Theorem sound; intake record duplicates it | R01 |

**Adversarial table: carried forward.** The rows of the previous report (PRREVIEW-QuasiregularMaps~1, 132 rows) for statements the diff leaves untouched stand as written there. The rows for the headline theorems and the seeded targets are repeated here with their values, each from that report.

| Statement | Instances (previous report) | Values (previous report) | Result |
| --- | --- | --- | --- |
| §1.2 `q_O`, `q_I` | `diag(2,1)`, `0`, `diag(1,0)`, reflection | `(2,2)`, `(0,0)`, `(∞,0)`, `(∞,0)` | Pass |
| §1.3 linear comparison | `diag(2,1,1)`, `diag(1,1,1/2)`; `n = 1` | `(q_O,q_I) = (4,2)`, `(2,4)`, `4 = 2²`; `1 ≤ 1⁰` | Pass, exponent `n − 1` sharp |
| §2.3 attainment | identity, fold, empty source | admissible `K`: `[1,∞)`, `∅`, `[1,∞)`; `K_O = 1, ∞, 1` | Pass |
| §2.5 locality | shear `(x, y + x³/3)` on strips `|x| < R` | `J = 1`, strip `K_O = ((R² + √(R⁴+4))/2)²`, supremum `∞` | Pass |
| §2.6 vanishing differential | two components with values `0, 1`; Cantor function | `D = 0`, image sizes `1` and `2`; `c(1) − c(0) = 1` vs integral `0` | Pass |
| §2.9 `IsQuasiregularOn` | `diag(2,1)`, reflection, projection, constant; `n = 0` | `4 ≤ 2·2`; `1 ≤ −K` false; `1 ≤ 0` false; `0 ≤ 0`; `0⁰ = 1 ≤ K·1` | Pass |
| §3.2 outer-to-inner headline | radial `a = 1/2` in `ℝ³`, `K = 2` | `det = 1/2 = 2²·(1/2)³`; exponent `1` would give `1/4` | Sharp |
| §3.2 inner-to-outer headline | radial `a = 2` in `ℝ³`; projection | `8 = 2²·2`; projection: inner `0 ≤ 0`, outer `1 ≤ 0` false | Sharp; quasiregularity hypothesis needed |
| §4.2 orientations | identity, one and two reversals | `J = −1`, then `+1` | Pass |
| §4.3 precomposition | torus projection; shear | `K_O = 2 ≤ 2·1`; `q_O(dθ) → ∞` with `K_O(f) = 1` | Pass; global bound needed |
| §4.4 postcomposition | `z²` after `z²`; radial `2` after `1/2` | `1 ≤ 1·1`; `K_O = 1 ≤ 4·2` | Pass |
| §5.2 equivalence headline | `|t|`, `p = ∞`; Cantor; `p = 1/2` bumps | both sides true; both false; `L¹` masses sum to `∞` | Pass; `p ≥ 1` needed |
| §5.2 line-derivative headline | `|t|`, weak derivative altered at `t = 1` | agree off `{0}`, `{1}` | Pass |
| §5.3 agreement headline | `diag(2,1)`; projection; `n = 0` | both sides true; both false; `1 ≤ K` both sides | Pass |
| §6.1 triangulations | `t ↦ t²` at `0`; infinite star | inverse ratio `1/√t → ∞`; centre in infinitely many edges | Pass |
| §7.2 orientation independence | `f ∘ R`, target orientation negated | `J = (−J_f)(−1) = J_f` | Pass |
| §7.4 local diffeomorphisms | torus doubling; `exp` | bound `2·1 = 2`; `‖d exp‖² = J` | Pass |
| §7.6 flat manifolds | flat torus cover; glide reflection | `‖dπ‖ = J = 1`; `det = −1` excluded | Pass |
| §7.7 tori | doubling after the flat cover; constant `p` | `K_O = 2`, image not a point; hypothesis false | Pass |

**Duplication and ownership.** The only ownership change in the diff is R05's: four minimal-stretch laws moved from targets to the Tau Ceti contract, and each of the four declarations exists at the pin as cited. Overlaps: no other open pull request changes this folder, drops an id it cites or defines one it relies on; the closest roadmaps (TeichmullerGeometry, SobolevDifferentialForms, DifferentialGeometry, CalibratedGeometry) were compared in the previous report and the diff adds no object of theirs. Open heads were not re-read this round.

**Policy.** The added text has no process words, pull-request numbers, LaTeX delimiters or local paths; the new Checks name library declarations only.

## Not verifiable

- Lee2012, Ch. 15 (cited in §7.5, untouched text): uncertified, paywalled; cited by locator only. The descent argument was checked against the pinned quotient and orientation declarations in the previous report.
- Rickman1993 and Vaisala1971 (cited for §5.2): settled as uncertified. The repaired §5.1 passage does not rest on them; its inputs are the pinned scalar differentiation theorem and Fubini.
- The previous report's list of uncertified sources for untouched sections is unchanged.

## Source issues

- none
