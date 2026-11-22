# Review of EigenvalueAndSingularValueInequalities (pull request #2969 at 4e66ae1)

**Verdict:** needs changes

**Summary.** Changes are needed, for one finding: the determinant identity `|det T| = ∏ sᵢ(T)` of 2.3, stated as a target and as a `sorry` in `Suggested.lean`, is already in the pinned Mathlib and closes in one line. The five findings of the previous review are all repaired, and every other statement survived the adversarial pass; the file elaborates with `sorry` as its only warning. There are five small corrections and one format note, none blocking. As in the previous round, none of the five cited books could be read legally, so no locator was checked against its text; that is left to the human reviewers.

## R01 (P2) — The determinant identity of 2.3 is already proved in the pinned Mathlib

README 2.3 (line 194) lists `norm_det_eq_prod_singularValues`, `|det T| = ∏_{i<n} sᵢ(T)`, as a target with the route "by the polar decomposition" (line 198), item 2 of "Scope and ownership" makes it part of the completion criterion (line 672), and `Suggested.lean` states it with `sorry` (lines 119–120). An implementer is asked to prove what the library has, and the roadmap's list of what Mathlib already supplies omits it.

At the pin, `Mathlib/Analysis/InnerProductSpace/NormDet.lean` has `LinearMap.normDet_eq_norm_det` (line 206: `f.normDet = ‖LinearMap.det f‖` for an endomorphism of a finite-dimensional inner product space over `RCLike 𝕜`) and `LinearMap.normDet_eq_prod_singularValues` (line 374: `f.normDet = ∏ i ∈ range (finrank 𝕜 U), f.singularValues i`). In a separate probe file the statement of `Suggested.lean`, with its binders, closes by `rw [← LinearMap.normDet_eq_norm_det, LinearMap.normDet_eq_prod_singularValues]`, with no error.

The smallest change: in 2.3 say that the identity is Mathlib's, naming the two declarations (5.1 uses it for the equality at `k = n`, so it stays as a cited input); list them under "From Mathlib" and in "Prior formalization"; remove the theorem from `Suggested.lean` and the clause from item 2 of the scope list. The same file's `LinearMap.normDet_comp` and `LinearMap.normDet_sq_eq_det_gram` may shorten the route of the compression bound, which remains a target.

## C01 — The Tau Ceti file cited for Cauchy interlacing is not at the pin

"Scope and ownership" (lines 705–707) and "Prior formalization" (lines 817–818) say that Cauchy interlacing "is formalized in Tau Ceti (`TauCeti/Analysis/Matrix/Eigenvalues/Interlacing.lean`)". At the pinned Tau Ceti that directory contains only `Basic.lean` and `Continuous.lean`, and no file on interlacing of eigenvalues exists anywhere in the library (the only files of that name are about Young diagrams and noncrossing partitions). The pull request's description itself places interlacing "beyond the pin". Nothing here uses the forward direction, so no result is touched; drop the path and keep the citation of RandomMatrices, Section 1.2, which does state it (its README, line 231).

## C02 — Three targets have von Neumann algebra forms in NoncommutativeIntegration 1.4, on main, which the scope section does not mention

NoncommutativeIntegration, Section 1.4 (README on main, lines 240–257) plans, for τ-measurable operators of a semifinite von Neumann algebra: the estimate `|x + y| ≤ u|x|u* + v|y|v*` with partial isometries (Thompson's inequality of 4.2), the inequality `∫₀ᵗ g(μ_s(x+y)) ≤ ∫₀ᵗ g(μ_s(x)) + ∫₀ᵗ g(μ_s(y))` for continuous increasing concave `g` with `g(0) = 0` (Rotfel'd's inequality of 4.1, at `t = d`), and the product inequality for increasing `f` with `f ∘ exp` convex (the `φ`-sum form of Horn's inequality in 5.2). Its Section 1.1 (lines 146–148) identifies `μ_t` on `M_d(ℂ)` with `LinearMap.singularValues`. This roadmap cites that roadmap only for Hölder (its 3.3).

The statements here are not the same objects: they are for finite-dimensional inner product spaces over `ℝ` or `ℂ`, with unitaries in Thompson's inequality and no continuity of `f` at `0`. Add a line to "Not owned here" naming NoncommutativeIntegration 1.4 as the owner of the von Neumann forms and saying in one clause how the three finite-dimensional statements differ.

## C03 — The route to Rotfel'd's inequality cites its main input from a source although the next item supplies it

The route of 4.1 (lines 364–366) reduces to "the concave majorization inequality for sums of positive matrices (Bhatia, Thm IV.2.13, p. 97)", which is no target, supplier section or library declaration. It is a consequence of the item that follows: if `(λ(G), λ(H))` lies in the permutation hull of `(λ(G + H), 0)`, then for concave `f` Jensen's inequality on the hull gives `∑ f(λ(G)) + ∑ f(λ(H)) ≥ ∑ f(λ(G + H)) + n f(0)`. Say that the input is the Rotfel'd–Thompson majorization of the same section.

## C04 — Three build-order statements disagree with the routes

"Within a layer the sections are in build order" (lines 71–72), but Rotfel'd's inequality in 4.1 uses Thompson's inequality of 4.2. Layer 4 is said to need Layer 3 (lines 70 and 410), and Layer 6 to need Layer 2.3 (lines 71 and 570), yet no route of Layer 4 uses an item of Layer 3 (Lidskii is consumed from the supplier, Fan–Hoffman uses Courant–Fischer), and no route of Layer 6 uses the compression bound. An implementer would wait for layers that are not needed. Correct the three sentences, or name the item that uses each dependency.

## C05 — "Headlines of the same standing" is said of items that are lemmas, corollaries and special cases

The overview (lines 43–44) and the module docstring of `Suggested.lean` (lines 22–24) call the items without a Lean name "headlines … of the same standing". Those items are the compression form of Wielandt's principle, unitary triangularization, the Rotfel'd–Thompson majorization, Thompson's product majorization, the lower bound of 5.3, Mirsky's lemma, Schur's lower bound, banded completions, the one-edge chordal extension and the factorization form of 7.3: a generalization used once, an equivalent form, lemmas and corollaries. Several are statable at the pins, so the sentence reads as an admission that statable headlines are missing. Either call them targets rather than headlines, or state the ones the Summary names as results in their own right (Thompson's product majorization is one line with `LinearMap.kyFanSum`).

## N01 — Mixed index bases

Horn's converse in 5.5 is stated with `λ₁⋯λ_k`, `σ₁⋯σ_k` (line 493) and its route counts from `0` (line 505); the Fan–Hoffman route (lines 390–391) takes "the first `j` eigenvectors" and "the singular vectors from `j` on", which meet nontrivially only if `j` counts from `1`, while the statement and 3.1 count from `0`.

## Earlier findings

- R01 (the monotone symmetric form of Wielandt's principle): repaired. 3.1 now takes "the eigenvalues of the compression of `T` to the span of the `xⱼ`", with the counterexample for diagonal entries; both halves recomputed (row 3.1 below), and 5.2 uses the determinant form.
- R02 (chordal graphs owned twice): repaired. 7.1: "consumed from PerfectAndChordalGraphs, Sections 1.1, 1.3 and 1.4"; the two graph theorems are gone from `Suggested.lean`; the definition there is the supplier's, character for character.
- R03 (Lidskii's inequality owned twice): repaired. 3.2: "Lidskii's inequality is consumed from SpectralSteepestDescent, Section 2.1"; 4.1 likewise; the sign translation between the two forms is correct.
- R04 (Yamamoto through complex compounds): repaired. The route now uses invariant subspaces from 2.2, Courant–Fischer and Gelfand's formula; both bounds recomputed (row 5.4).
- R05 (false sentence in the Check of 7.2): repaired. The negative control is now the single edge with off-diagonal `2`, determinant `−3`.
- C01–C08, N01–N03: repaired, except that C05 is repaired for Hadamard's inequality and only partly for interlacing (C01 above). The question on singular `σ` in Horn's converse is answered by the bordering construction of 5.5, which I recomputed.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 definition, Check | `(1, 1/2)` vs `(5/4, 1/4)` | sums `1 ≤ 5/4`, `3/2 ≤ 3/2`; products `1 ≤ 5/4`, `1/2 > 5/16` | Check true, separates the two notions | none |
| 1.1 transfer to `φ`-sums | `(1,1)` vs `(2,1)`, `φ = 1/t`; zeros: `y` with `m` positive entries | `2 > 3/2` without monotonicity; `x` vanishes from `m` on; Abel sum with decreasing slopes `cᵢ ≥ 0` | true; route sound | none |
| 1.1 products; example | `(2, 1/2)` vs `(2, 1)` | `2 ≤ 2`, `1 ≤ 2`; `2^p + 2^(-p) ≤ 2^p + 1` | true | none |
| 2.1 eigenvalue moduli | nilpotent; `diag(1, −2)`; index beyond `n` | `0, 0`; `2, 1`; padded `0` | determines the object | none |
| 2.2 invariant form | `s = 0`; `s` all roots | `V = ⊥`, no roots; `V = ⊤` | true over `ℂ` | none |
| 2.3 compression bound | `k = 0`; `k >` rank; `diag(3,2,1)`, `k = 2` | `1 ≤ 1`; `0 ≤ 0`; `6 ≤ 6` | true | none |
| 2.3 determinant identity | probe with two Mathlib lemmas | closes by `rw`, no error | already in Mathlib | R01 |
| 2.4 norm of exterior power | `k = 0`; `k > dim`; `diag(3,2,1)`, `k = 2`; rank one | `1 = 1`; `0 = 0`; `6 = 3·2`; `0 = 0` | true | none |
| 3.1 minimax and compression form | eigenvector flag; arbitrary flag; `T = diag(3,1)` at 45° | `μⱼ ≥ λ_{iⱼ}`; `μⱼ ≤ λ_{iⱼ}` on the flag-lemma family; diagonal `(2,2)`, `4 > 3` | true; counterexample true | none |
| 3.2 Lidskii's majorization | `T = diag(1,0)`, `S = diag(0,1)`; supplier form with `T + S` for `S` | `(0,1)` a permutation of `(1,0)`; both forms agree | true | none |
| 3.3 two-sided gauge bound | same pair | `Φ(0,0) ≤ Φ(1,1) ≤ Φ(1,−1) = Φ(1,1)` | true | none |
| 3.4 converse interlacing | `n = 0`; formula for `\|zⱼ\|²` | trivial; numerator and denominator of equal sign, sum `1` | true over `ℝ` and `ℂ` | C01 (pointer) |
| 3.5 normal Hoffman–Wielandt | `diag(1,0)`, `diag(0,1)`; nilpotent and `0` | matchings `0`, `2`, Frobenius `2`; nilpotent: `0 ≤ 1` holds, `1 ≤ 0` fails | true; example true | none |
| 4.1 Rotfel'd, majorization | `f = −t`, `A = I`, `B = −I`; `G + H = CC*` against `C*C` | `0 > −2n`; pinching gives the majorization | true; `f ≥ 0` needed | C02, C03 |
| 4.2 real parts, Thompson | `A = E₁₁`, `B = E₁₂` | `\|A\| + \|B\| = I`, `\|A+B\| = J/√2`, eigenvalue `1 − √2 < 0` | true; unitaries needed | C02 |
| 4.2 Ostrowski–Taussky | empty index; `H` singular; `H` definite | `1 ≤ 1`; `0 ≤ \|det A\|`; factors `\|1 + iμ\| ≥ 1` | true | none |
| 5.1 Weyl | `[[0,1],[0,0]]`; `k > n` | `0 ≤ 1`, `0 = 0`; equal `φ(0)` terms | true | none |
| 5.2 Horn, Thompson product, Gelfand–Naimark | index `≥ n`; `2 kyFan(H) ≤ kyFan(T) + kyFan(T†)`; `BX = YR` | `0 ≤ RHS`; `det(X*B*A*ABX) = det(Y*A*AY) det(X*B*BX)` | true; routes sound | C02 |
| 5.3 positive products | `B` singular; `k = n` | `AB` and `B^(1/2)AB^(1/2)` share a characteristic polynomial; determinants equal | true | none |
| 5.4 Yamamoto | `i ≥ n`; `dim 0`; `\|λ\|ᵢ = 0`; `(i+1) + (n−i) > n` | `0 → 0`; `0 → 0`; upper bound suffices; subspaces meet | true; new route sound | none |
| 5.5 Horn's converse | `λ = (2,1/2)`, `σ = (3,1/3)`; `σ = (1,0)`, `μ = (1/2,0)`; bordering | `t² = 175/36`, `det 1`; `t = √3/2`; `a ≤ σ_{m−1}`, `MM* = diag(σ²)` | true | N01 |
| 6.1 Oppenheim, Schur's bound | `A = B = [[1,2],[2,1]]`; empty index | `−3 > −15`; `1 ≤ 1 ≤ 1 ≤ 1`; `A∘B ≥ λ_min(A) diag(b)` | true; positivity needed | none |
| 6.2 Hadamard singular values | weights `(pᵢqᵢ)^(1/2) ≤ (pᵢ + qᵢ)/2` | prefix sums at most those of `s(A)` | deduction sound; source step unread | none |
| 7.1 chordality | supplier's definition against the copy | identical text | consumed correctly | none |
| 7.2 GJSW, Checks | four-cycle `c = 9/10`; single edge with `2`; induced cycle of length `k` | minors vanish at `x = ±0.62`: need `x > 0.62` and `x < −0.62`; `−3`; needs `c > cos(π/k)` | true | none |
| 7.3 max-det completion | 4 × 4 example; path, `c = 1/2` | `det = 29.2705… = (25 + 15√5)/2`, cofactors `≈ 4·10⁻¹⁶`, nearby values smaller; tridiagonal inverse | true | none |

- Source locators checked against the text: 0 of 85 (no cited book readable legally; see below).
- Library declarations opened at the pin: `LinearMap.normDet_eq_norm_det` and `LinearMap.normDet_eq_prod_singularValues` (Mathlib `Analysis/InnerProductSpace/NormDet.lean:206`, `:374`), `TauCeti.IsWeaklyMajorizedBy` (`Analysis/Convex/Majorization.lean:95`), `TauCeti.mem_convexHull_range_comp_perm_iff` (`Analysis/Convex/PermutationOrbit.lean:257`), `Matrix.BlockTriangular` (Mathlib `LinearAlgebra/Matrix/Block.lean:62`), `LinearMap.singularValues_comp_le` (`Analysis/InnerProductSpace/SingularValues.lean:544`), the Gram Hadamard inequality (`Analysis/InnerProductSpace/Gram/Hadamard.lean:115`), the Tau Ceti Hoffman–Wielandt files (symmetric and singular-value cases only).
- Cross-roadmap citations resolved: SpectralSteepestDescent 2.1 and PerfectAndChordalGraphs 1.1, 1.3, 1.4 at their open heads; RandomMatrices 1.2, NoncommutativeIntegration 3.3, SpectralSubspacePerturbation on main; MeansMajorizationAndDiscreteInequalities Layer 4 and 4.1, SchattenClassesAndSchurMultipliers 6.1 at their open heads; the consumers' citations of 1.1, 2.4 and 3.3 here resolve.
- Dependency check: `depcheck: 136 roadmaps, 1514 edges, 0 problem(s)`; no upward or cyclic edge. Both open suppliers are new roadmaps by another author, named in the description.
- Elaboration of `Suggested.lean`: exit 0, 34 `sorry` warnings, no error, no `set_option`, no sorried data.
- Elaborated types compared with the README statement by statement: the two definitions of Layer 7 keep no `Fintype` or `DecidableEq` binder, which their bodies do not need; nothing a statement needs was lost.
- One-tactic probe: `norm_det_eq_prod_singularValues` closes from Mathlib (R01); the four sanity-check theorems are marked as such; no other declaration is a restatement.
- Change outside the folder: none.

Overlap check: read Majorization (main and its open revision), PolarDecomposition, OperatorTheory, OperatorIdeals (main and its open revision), MeansMajorizationAndDiscreteInequalities, OperatorMonotoneFunctionsAndMatrixMeans, TraceInequalitiesAndQuantumEntropy, and by object SpectralSteepestDescent, PerfectAndChordalGraphs, NoncommutativeIntegration, SubadditiveAndMultiplicativeErgodicTheorems and SchattenClassesAndSchurMultipliers; Lidskii's inequality and its singular-value form: owner SpectralSteepestDescent, cited; chordal graphs and elimination orderings: owner PerfectAndChordalGraphs, cited; Thompson's, Rotfel'd's and the product inequality for τ-measurable operators: owner NoncommutativeIntegration 1.4, the finite-dimensional variants here, not yet said (C02); weak log-majorization, exterior-power norms and the gauge bounds: owner this roadmap, consumed by the trace-inequality and ergodic roadmaps; nothing else shared.

Source independence: 0 passages compared with 0 sources, because none of the five cited books could be read legally; largest share Bhatia 1997, 34 of 85 locators; contents not compared with Bhatia 1997: its table of contents was not read.

Research link: Per the README, 2.4 is the input to the Oseledets multiplicative ergodic theorem; 1.1 and 3.3 feed the Araki–Lieb–Thirring trace inequalities; Layer 3 is the linear base of the Klyachko–Knutson–Tao description of eigenvalues of sums, listed as an extension; Layer 7 is the Grone–Johnson–Sá–Wolkowicz completion theorem. Rests on the README only.

## Not verifiable

- Every locator of the sample (1.1, 2.3, 2.4, 3.1–3.5, 4.1, 4.2) into Bhatia 1997 and Marshall–Olkin–Arnold 2011: both resolve only to a paywalled publisher page.
- Every locator of the sample (5.4, 5.5, 6.1, 7.2, 7.3) into Horn–Johnson 1985 and 1991 and Bakonyi–Woerdeman 2011: no legal copy found (publisher landing pages only).
- The statement attributed to Horn–Johnson 1991, Thm 5.5.19, in the route of 6.2, and the factorization form of 7.3 attributed to Bakonyi–Woerdeman, Thm 2.2.10 and Cor 2.2.11: the deductions from them were checked, the source statements were not.

Automatic checks set aside as false positives: the section header "Library declarations consumed" in `Suggested.lean` has no declaration under it because it introduces the `#check` lines that pin library declarations, which the form allows.

## Source issues

- none

## For the human reviewers

- **Not tested.** Bhatia 1997 has the largest share of the locators (34 of 85) and could not be read; neither the wording nor the arrangement of the README was compared with it or with the other four books.
- **Scope.** The README states that it is a synthesis of four textbooks (README lines 27–31); all headline theorems are classical refereed results. No scope concern observed.
