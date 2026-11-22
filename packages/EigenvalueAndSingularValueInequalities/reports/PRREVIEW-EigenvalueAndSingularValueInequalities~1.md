# Review of EigenvalueAndSingularValueInequalities (pull request #2969 at 421f950)

**Verdict:** needs changes

**Summary.** Changes are needed: five findings. One prose target of 3.1 is false as written (the "monotone symmetric" form of Wielandt's principle, on which the Gelfand–Naimark route rests); two blocks of the roadmap are also owned by other open roadmaps (chordal graphs, Dirac and elimination orderings by PerfectAndChordalGraphs; Lidskii's inequality and its singular-value form by SpectralSteepestDescent); the route to Yamamoto's theorem uses complex compound matrices that no layer supplies; and one sentence of the Check of 7.2 is false. Every statement of `Suggested.lean` survived the adversarial pass, and the file builds. There are eight small corrections and three format notes, none blocking. None of the five cited books could be read legally, so no locator was checked against its text; this is left to the human reviewers.

## R01 (P1) — The "monotone symmetric functions" form of Wielandt's principle in 3.1 is false as stated

README 3.1 (lines 238–239) states: "For `Φ` monotone in each variable and symmetric, the same max–min holds for `Φ(⟪T xⱼ, xⱼ⟫)` in place of the sum". It is a target of the roadmap, and the route to Gelfand–Naimark in 5.2 (line 421) uses it "with `Φ` the product", so an implementer who follows the text is asked to prove a false statement.

Take `n = k = 2`, indices `(0, 1)`, `T = diag(3, 1)`. A full flag determines the orthonormal family up to phases. For the flag with `M₀` spanned by `(1, 1)/√2` the family is `(1, 1)/√2`, `(1, −1)/√2`, with Rayleigh quotients `(2, 2)`. With `Φ = min` the max–min is at least `2`, while `Φ(λ₀, λ₁) = min(3, 1) = 1`; with `Φ` the product it is at least `4`, while `λ₀λ₁ = 3`. The sum is the one symmetric function for which the diagonal entries suffice, because it is the trace of the compression.

What is true, and what 5.2 needs: replace the diagonal entries by the eigenvalues `μ₀ ≥ ⋯ ≥ μ_{k−1}` of the compression of `T` to the span of the `xⱼ`. For the eigenvector flag every admissible family has `μⱼ ≥ λ_{iⱼ}` (the span of `x₀, …, xⱼ` lies in `Mⱼ`), and for every flag the family of the complementary-flag lemma has `μⱼ ≤ λ_{iⱼ}` (the span of `wⱼ, …, w_{k−1}` lies in `Wⱼ`), so `Φ(μ)` has max–min `Φ(λ_{i₀}, …, λ_{i_{k−1}})` for every `Φ` monotone in each variable. For positive `T` and `Φ` the product this is the determinant of the matrix `(⟪T xᵢ, xⱼ⟫)`, which is what 2.3 bounds. Restate the item that way and adjust the sentence in 5.2. Bhatia's Exercise III.3.7 could not be read; the locator should be checked against the corrected statement.

## R02 (P2) — Chordal graphs, Dirac's lemma and perfect elimination orderings have a second owner, PerfectAndChordalGraphs

README 7.1 and item 7 of "Scope and ownership" claim the definition of a chordal graph, Dirac's lemma and the characterization by perfect elimination orderings, and `Suggested.lean` declares `IsChordal`, `IsChordal.exists_isClique_neighborSet` and `isChordal_iff_exists_perfectEliminationOrder`. The open roadmap PerfectAndChordalGraphs (a new roadmap) owns the same three objects: its 1.1 defines `IsChordal` (no induced `cycleGraph n`, `n ≥ 4`), its 1.3 proves `IsChordal.exists_isSimplicial_not_adj` (README line 154 there), and its 1.4 proves `isChordal_iff_exists_isPerfectEliminationOrder` (line 178 there). Neither roadmap names the other, so the library would get two definitions of chordality and two copies of each theorem.

The graph theory belongs with the graph roadmap; it lists chordal completions as outside its scope, so the one-edge chordal extension and all of 7.2–7.3 stay here. The smallest change: in 7.1 cite PerfectAndChordalGraphs 1.1, 1.3 and 1.4 for the definition, Dirac's lemma and the elimination orderings, keep the one-edge extension as this roadmap's item, remove the two theorems from `Suggested.lean` (the definition may stay there as the predicate needed to state 7.2, with a sentence that it is that roadmap's notion), and list the deferral in "Scope and ownership". If the authors prefer the opposite ownership, say so in both roadmaps.

## R03 (P2) — Lidskii's inequality and its singular-value form are also owned by SpectralSteepestDescent

README 3.2 (the Lidskii–Wielandt inequalities) and 4.1 (Lidskii's theorem for singular values, `sum_abs_singularValues_sub_le_kyFanSum`, and Mirsky's theorem) are stated as targets in 2.1 of the open roadmap SpectralSteepestDescent (README lines 164–174 there): "Lidskii's inequality" for symmetric `S`, `T` and every index set, marked as proved there, then the bound of any `k` of the `|σᵢ(A) − σᵢ(B)|` by `kyFanSum (A − B) k` and its consequence for every unitarily invariant seminorm. Its `Suggested.lean` declares the theorem under the same name, `sum_abs_singularValues_sub_le_kyFanSum` (line 82 there), and its scope section claims "the Ky Fan form of singular-value perturbation". Neither roadmap names the other.

One of the two must own these and the other cite it. This roadmap is the natural owner (it builds Wielandt's principle, of which the other roadmap's ad hoc proof is a special case); in that case say so in "Scope and ownership", naming SpectralSteepestDescent 2.1 as a consumer, so that the other roadmap can cite 3.2 and 4.1. If instead that roadmap keeps them, cite its 2.1 here and drop the two targets from 4.1.

## R04 (P2) — The route to Yamamoto's theorem (5.4) uses complex compound matrices, which no layer, supplier or pinned declaration provides

The route (lines 445–449) takes `Pᵢ(m)` as "the spectral norm of the `(i+1)`-th compound matrix of `Tᵐ`", uses that compounds are multiplicative "by Cauchy–Binet", and that "the compound of `T` has spectral radius `∏_{j≤i} |λ|ⱼ(T)`". Here `T` is complex. Layer 2.4 gives the norm of an exterior power over `ℝ` only, and nowhere gives the spectrum of an exterior power or compound; "Exterior powers over `ℂ`" is listed under "Beyond this roadmap". The pinned Mathlib has neither compound matrices nor Cauchy–Binet (no occurrence under `Mathlib/LinearAlgebra/Matrix`), and its inner product on exterior powers is real (`Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean`, lines 121–124). So 5.4 cannot be built from what the roadmap plans.

The smallest change is to add to 2.4 the two facts the route needs, in a form that reaches complex `T`: the `k`-th compound (or exterior power) of a complex operator has operator norm `∏_{i<k} sᵢ` and eigenvalues the `k`-fold products of the eigenvalues (the second follows from 2.2 by triangularizing), and compounds are multiplicative. Alternatively give a route through the underlying real space, which still needs the spectral radius of a real exterior power as an item of 2.4.

## R05 (P2) — A sentence of the Check of 7.2 is false

The first Check of 7.2 (lines 576–577) says: "a definition requiring only the diagonal to be positive would make every pattern completable in this example's sense". Under that weaker definition the four-cycle datum is still admissible and still has no positive definite completion, and on any graph with an edge the datum with diagonal `1` and the value `2` on that edge becomes admissible with no completion (its `2 × 2` block has determinant `−3`). So the weaker definition makes fewer patterns completable (only the edgeless ones), not all.

Replace the clause by what the weaker definition does get wrong, for instance: with only the diagonal required positive, the single edge with diagonal `1` and off-diagonal `2` would be admissible and have no completion, so the theorem would fail for every graph with an edge.

## C01 — The route of 1.1 attributes the increasing convex transfer to Tau Ceti, which does not have it at the pin

Lines 120–121 say "apply Tau Ceti's weak-majorization calculus (the increasing convex transfer of Bhatia, Ex II.3.5(vi), p. 42, applied to `φ ∘ exp`)". At the pin, `TauCeti/Analysis/Convex/Majorization.lean` has no statement about `ConvexOn` for `TauCeti.IsWeaklyMajorizedBy`, and that predicate requires nonnegative tuples (line 95, fields `nonneg_left`, `nonneg_right`), while logarithms of entries in `(0, 1)` are negative. "Scope and ownership" assigns the transfer (Tomić–Weyl) to another roadmap under another predicate. Say that the transfer for real tuples is proved here as part of the item, or name the declaration meant.

## C02 — The route to Thompson's product majorization in 4.2 bounds only the positive eigenvalues

Line 371–372: "Fan–Hoffman for `AB`, then Horn's product inequality". Fan–Hoffman gives `λⱼ(H) ≤ sⱼ(AB)`, and applied to `−AB` gives `−λ_{n−1−j}(H) ≤ sⱼ(AB)`. For the `k` largest absolute eigenvalues, `p` positive and `q` negative, this yields `∑_{j<p} sⱼ + ∑_{j<q} sⱼ`, which can exceed `∑_{j<k} sⱼ` (for `p = q = 1`: `2s₀` against `s₀ + s₁`). The statement is true by another input: the singular values of `(T + T†)/2` are weakly majorized by those of `T`, by Tau Ceti's `LinearMap.kyFanSum_add_le` and `LinearMap.kyFanSum_adjoint`. Name that input in place of Fan–Hoffman.

## C03 — The build-order statements disagree with the dependencies

"How to read the build" says Layers 3, 5, 6 and 7 can be built in parallel once Layers 1 and 2 are done, but the Dependencies of Layer 5 list 3.1 (Gelfand–Naimark) and 3.4 (Horn's converse). Thompson's product majorization in 4.2 uses Horn's product inequality of 5.2, a later layer, and the Dependencies of Layer 4 do not list it. Correct the sentence, and either move that item to 5.2 or list the dependency.

## C04 — `norm_exteriorPower_map_comp_le` follows in one line from the library

In a scratch copy the statement closes with `simpa [exteriorPower.map_comp] using ContinuousLinearMap.opNorm_comp_le _ _`, so as a target of `Suggested.lean` it asks an implementer for nothing. It can stay in README 2.4 as the corollary a consumer cites; in the Lean file either mark it as a sanity check of the norm on exterior powers or drop it in favour of the norm formula above it.

## C05 — Two inputs are said to be in Tau Ceti "after the pin", where they cannot be checked and have no named owner

Line 289–290 says the forward direction of interlacing "is in Tau Ceti", and the route of 6.1 uses Hadamard's inequality `det B ≤ ∏ bᵢᵢ`; "Scope and ownership" places both "In Tau Ceti after the pin", consumed "by name of result, not by declaration". At the pin neither is present (no declaration bounding the determinant of a positive semidefinite matrix by its diagonal, no interlacing for compressions of operators). A reader cannot resolve these. Name the roadmap section that owns each (Cauchy interlacing is a target of a roadmap on main), or state Hadamard's inequality for positive semidefinite matrices as an item of 6.1, since the outer inequalities of the chain are exactly it.

## C06 — Two examples point to numerical checks that are not in the folder

Line 378: "it fails for `888` of `2000` random complex `2 × 2` pairs in the numerical checks"; line 607: "to `10⁻⁸` in the numerical checks". Neither can be reproduced from the text. An explicit witness for the first: `A = [[1, 0], [0, 0]]`, `B = [[0, 1], [0, 0]]` give `|A| + |B| = I` and `|A + B| = [[1, 1], [1, 1]]/√2`, and `I − |A + B|` has the eigenvalue `1 − √2 < 0`. For the second, the value is exact: `x₁ = −x₂ = (3 − √5)/2`, where the two cofactors vanish and the determinant is `29.2705…`.

## C07 — The description's paragraph on closest roadmaps omits the two roadmaps that share objects with this one

The paragraph "Closest roadmaps and why there is no double ownership" names four open roadmaps and not PerfectAndChordalGraphs or SpectralSteepestDescent (R02, R03). Once ownership is settled, add one line for each saying who owns chordal graphs and who owns Lidskii's inequality.

## C08 — The non-normal example of Layer 3 refutes only the upper half of 3.5

Lines 309–310: for the nilpotent `[[0, 1], [0, 0]]` and `0` the lower bound `0 ≤ 1` holds; it is the upper bound `1 ≤ 0` that fails. Say "the upper bound fails", or add an example where the lower bound fails.

## N01 — Process words in the README

"the open roadmap on …" (several places), "after the pin", "sibling of this wave", "(a roadmap for a roadmap; do not implement)". Name the roadmaps and sections instead; a reader a year from now cannot tell what was open.

## N02 — Checks name Lean counterparts

The Checks of 1.1, 2.1, 7.1 and 7.2 carry the names of the five sanity-check theorems (`not_isWeaklyLogMajorizedBy_example` and the others). A Check is prose; the names can go.

## N03 — Two statements leave a hypothesis implicit

Rotfel'd's inequality in 4.1 reads as rectangular under the layer's opening `A B : E →ₗ[𝕜] F`, and the Lean statement is for endomorphisms; say which is meant. The path example of 7.3 needs `|c| < 1`.

## Questions for the author

- Horn's converse (5.5) allows `σᵢ = 0`, but the route realizes the data in a positive definite `P` and takes its Cholesky factor, which needs `σₙ > 0`. How is the singular case reached (I checked only `n ≤ 3` by hand: `σ = (1, 0)`, `μ = (1/2, 0)` gives `[[1/2, √3/2], [0, 0]]`)? The source could not be read.
- Does Bhatia's Exercise III.3.7 state the principle for the eigenvalues of the compression (R01)? The text could not be read.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `IsWeaklyLogMajorizedBy` and Check | `(1, 1/2)` vs `(5/4, 1/4)` | sums `1 ≤ 5/4`, `3/2 ≤ 3/2`; products `1 ≤ 5/4`, `1/2 > 5/16` | Check true, separates from prefix sums | none |
| 1.1 `prefixSum_comp_le` | `x = (0,0)`, `y = (1,0)`; `φ = 1/t` on `(1,1)`, `(2,1)` | `2φ(0) ≤ φ(1)+φ(0)` by monotone; `2 > 3/2` without monotone | true; monotone needed | C01 (route) |
| 1.1 `mul` | antitone nonnegative tuples | product antitone; prefix product is product of prefix products | true | none |
| 2.1 `eigenvalueModuli` | `dim 0`; nilpotent; `diag(1, −2)` | empty roots, all `0`; `0, 0`; `2, 1` | determines object | none |
| 2.2 invariant form | `s = 0`; `s` all roots | `V = ⊥`, charpoly `1`; `V = ⊤` | true over `ℂ` | none |
| 2.3 compression bound, determinant | `k = 0`; `dim 0`; `A = diag(3,2,1)`, `k = 2` | `1 ≤ 1`; `1 = 1`; top minor `6 ≤ 6` | true | none |
| 2.4 norm of exterior power | `k = 0`; `k > dim`; `diag(3,2,1)`, `k = 2`; rank one | `1 = 1`; `0 = 0`; `6 = 3·2`; `0 = 0` | true | C04 for submultiplicativity |
| 3.1 flag lemma | `k = 0`; Gram–Schmidt directions | `vⱼ` stays in `Vⱼ` (increasing), `wⱼ` in `Wⱼ` (decreasing order) | true | none |
| 3.1 `wielandt_minimax` | `k = 1`; eigenvector flag | Courant–Fischer; each `⟪Txⱼ, xⱼ⟫ ≥ λ_{iⱼ}` | both halves true | none |
| 3.1 monotone symmetric form | `T = diag(3,1)`, flag at 45° | Rayleigh `(2, 2)`: `min = 2 > 1`, product `4 > 3` | false | R01 |
| 3.2 Lidskii–Wielandt, majorization | `T = diag(1,0)`, `S = diag(0,1)` | `λ(T+S) − λ(T) = (0,1)`, a permutation of `(1,0)` | true | R03 (owner) |
| 3.3 two-sided gauge bound | same `T`, `S` | `Φ(0,0) ≤ Φ(1,1) ≤ Φ(1,−1) = Φ(1,1)` | true; gauge is sign-symmetric at the pin | none |
| 3.4 converse interlacing | `n = 0`; formula for `\|zⱼ\|²` | `Fin 0` trivial; numerator and denominator have equal signs | true over `ℝ` and `ℂ` | C05 (forward direction) |
| 3.5 normal Hoffman–Wielandt | `T = diag(1,0)`, `S = diag(0,1)`; nilpotent non-example | sums `0` and `2`, Frobenius `2`; nilpotent: `0 ≤ 1` holds, `1 ≤ 0` fails | true | C08 |
| 4.1 sums | `A = diag(3,1)`, `B = diag(1,3)`; `I` beyond dimension | `0 ≤ 2`, `0 ≤ 4`; terms `0` | true | R03 (owner) |
| 4.1 Rotfel'd | `f = −t`, `A = I`, `B = −I` | `0` against `−2n` | nonnegativity needed, as stated | N03 |
| 4.2 real parts, Thompson | `A = E₁₁`, `B = E₁₂` | `I − \|A+B\|` has eigenvalue `1 − √2` | unitaries needed; statements true | C02, C06 |
| 4.2 Ostrowski–Taussky | empty index; `A = H + iK` | `1 ≤ 1`; factors `\|1 + iμ\| ≥ 1` | true | none |
| 5.1 Weyl | `[[0,1],[0,0]]`; `k > n` | `0 ≤ 1`, `0 = 0`; equal `φ(0)` terms | true | none |
| 5.2 Horn, Gelfand–Naimark | index `≥ n`; adjoint symmetry | `0 ≤ 0`; `s(AB) = s(B†A†)` swaps roles | true | R01 (route) |
| 5.3 positive products | `B` singular; `k = n` | eigenvalues of `AB` equal those of `B^(1/2)AB^(1/2)`; `det` equality | true | none |
| 5.4 Yamamoto | `i ≥ n`; `m = 0` junk | `0 → 0`; exponent `1/0 = 0` irrelevant to the limit | statement true | R04 (route) |
| 5.5 Horn's converse | `λ = (2,1/2)`, `σ = (3,1/3)`; `σ = (1,0)`, `μ = (1/2,0)` | `t² = 175/36 > 0`, `det = 1`; `t = √3/2` | true in cases tried | question |
| 6.1 Oppenheim chain | `A = B = [[1,2],[2,1]]`; empty index | `−3 > −15`; `1 ≤ 1 ≤ 1 ≤ 1` | positivity needed; chain true | C05 (Hadamard) |
| 7.1 `IsChordal`, Dirac, orderings | `C₄`; `K₄`; one vertex | induced 4-cycle; no induced cycle; empty neighbourhood is a clique | definition right | R02 (owner) |
| 7.2 GJSW and Check | four-cycle, `c = 9/10` | `{0,1,2}` forces `x > 0.62`, `{0,2,3}` forces `x < −0.62`; grid search finds no completion | theorem and example true | R05 (sentence) |
| 7.3 max-det completion | 4 × 4 example; path with `c = 1/2` | `x₁ = −x₂ = (3−√5)/2`, cofactors `≈ 4·10⁻¹⁶`, `det ≈ 29.27`, nearby values smaller; cofactors `0` | true | C06, N03 |

- Source locators checked against the text: 0 of the README's (no cited book readable legally). Three statements of Layer 7 were cross-checked against Vandenberghe–Andersen, *Chordal graphs and semidefinite optimization* (author's page), its text lines 905, 1320 and 4516.
- Library declarations opened at the pin: `TauCeti.prefixSum` (`Algebra/BigOperators/Finset/PartialSum.lean:50`), `TauCeti.IsWeaklyMajorizedBy` (`Analysis/Convex/Majorization.lean:95`), `mem_convexHull_range_comp_perm_iff` (`Analysis/Convex/PermutationOrbit.lean:257`), `UnitarilyInvariantSeminorm.gauge` (`UnitarilyInvariantSeminorm/Gauge.lean:85`), `LinearMap.kyFanSum` (`KyFan.lean:99`), `LinearMap.singularValues_comp_le` (`SingularValues.lean:544`), `LinearMap.singularValues` (Mathlib `SingularValues.lean:95`), the exterior-power inner product (Mathlib `ExteriorPower.lean:121–144`), `Matrix.PosSemidef.hadamard` (Mathlib `Analysis/Matrix/Order.lean:214`), `iSup_maxGenEigenspace_eq_top` (Mathlib `Triangularizable.lean:74`), the star on endomorphisms (Mathlib `Adjoint.lean:709`).
- Cross-roadmap citations resolved on main: PD-A29, PD-A51, PD-A52, PD-A53, PA-B32, PA-B40, OI-A50, SSP-D06, NoncommutativeIntegration 3.3, Majorization Parts A and B: all present.
- Duplication by object against the pinned libraries: no headline is proved at the pin (the Tau Ceti Hoffman–Wielandt files are the symmetric and Frobenius singular-value cases only).
- Dependency check: `depcheck: 156 roadmaps, 1803 edges, 0 problem(s)`; no upward or cyclic edge.
- Targeted build of the module: completed successfully; `sorry` the only warning besides the `#check` output.
- Elaborated types compared with the README statement by statement: the three definitions of Layer 7 keep no finiteness binder, which their bodies do not need; nothing a statement needs was lost.
- One-tactic probe: `norm_exteriorPower_map_comp_le` closes (C04); the five sanity-check theorems are marked as such.

Overlap check: read Majorization (main and its open revision), PolarDecomposition, OperatorTheory, OperatorIdeals, MeansMajorizationAndDiscreteInequalities, OperatorMonotoneFunctionsAndMatrixMeans, SpectralSteepestDescent, and by object PerfectAndChordalGraphs, ConditioningAndPerturbation, SchattenClassesAndSchurMultipliers and SubadditiveAndMultiplicativeErgodicTheorems; chordal graphs, Dirac's lemma and elimination orderings: owner PerfectAndChordalGraphs (R02); Lidskii's inequality and its singular-value form: shared with SpectralSteepestDescent 2.1, owner to be settled, proposed here (R03); norm of exterior powers: owner this roadmap, consumed by the ergodic roadmap; nothing else shared.

Source independence: 0 passages compared with 0 sources, because none of the five cited books could be read legally; largest share Bhatia 1997, 34 of 86 locators; contents not compared with Bhatia 1997: its table of contents was not read.

Research link: Per the README, 2.4 is the input to the Oseledets multiplicative ergodic theorem; Layer 3 is the linear base of the Klyachko–Knutson–Tao description of eigenvalues of sums (Horn's conjecture), listed as an extension; Layer 7 is the Grone–Johnson–Sá–Wolkowicz completion theorem. Rests on the README only.

## Not verifiable

- Every locator of the seeded sample (1.1, 2.1, 2.3, 2.4, 3.2, 3.3, 3.5, 4.1, 4.2, 5.2, 5.3, 5.5, 6.1, 7.1, 7.2) into Bhatia 1997 and Marshall–Olkin–Arnold 2011: both resolve only to a paywalled publisher page.
- Every locator into Horn–Johnson 1985 and 1991 and into Bakonyi–Woerdeman 2011: no legal copy found (publisher landing pages only; the publisher's sample chapter of Bakonyi–Woerdeman refused the request).
- That Tau Ceti later than the pin contains Cauchy interlacing, Hadamard, Fischer and Koteljanskii: only the pin was read (C05).

Automatic checks set aside as false positives: the section header "Library declarations consumed" in `Suggested.lean` has no declaration under it because it introduces the `#check` lines that pin library declarations, which the form allows; three names reported as found nowhere in the pinned libraries are this roadmap's own declarations in `Suggested.lean`.

## Source issues

- none

## For the human reviewers

- **Not tested.** Bhatia 1997 has the largest share of the locators (34 of 86) and could not be read; neither the wording nor the arrangement of the README was compared with it or with the other four books.
- **Scope.** The README states that it is a synthesis of four textbooks (README lines 28–31); all headline theorems are classical refereed results. No scope concern observed.
