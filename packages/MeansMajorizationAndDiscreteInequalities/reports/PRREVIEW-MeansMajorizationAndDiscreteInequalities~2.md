# Review of MeansMajorizationAndDiscreteInequalities (pull request #2500 at 8dc3a74)

**Verdict:** accepted

**Summary.** Accepted: the four findings of the previous review (the proof routes of 1.2, 4.4 and 6.1, and the uncited Mathlib lemma behind the zero-convention item of 6.3) are repaired, each repaired route was recomputed on an instance, and no repair introduced a false statement. There is one small correction (a symbol in the strong-form route of 6.1 lost its definition in the rewrite) and no format note; neither blocks. As before, none of the seven cited books could be read legally, so no source locator was verified; that, the scope and one licence question are left to the human reviewers.

## C01 — The strong-form route of 6.1 uses `ℓ`, which the rewritten `⇐` route no longer defines

In the proof route of 6.1 (line 1068) the strong form says "`φ ≥ ℓ` makes the negative part `μ`-integrable" and bounds `∫ φ⁺ dμ` by `∫ φ dν − ∫ ℓ dν`. The clause that introduced `ℓ` as an affine minorant of `φ` stood in the `⇐` bullet and went with its rewrite, which now subtracts `φ_1` instead; `ℓ` occurs nowhere else in the section. A reader has to guess what it is. Writing `φ_1` for `ℓ` in that bullet (the first supporting line is an affine minorant), or adding "for an affine minorant `ℓ` of `φ`, for instance `φ_1`", restores it.

## Questions for the author

- 6.1 cites Shaked–Shanthikumar Thm 3.A.1 for the stop-loss form, Thm 3.A.2 for the absolute-deviation form and Thm 3.A.4 for the martingale coupling. Are these the theorem numbers of the 2007 edition? The text could not be read.
- 5.1 now says that Niculescu–Persson, Thm 4.3.3, states the Schur–Ostrowski criterion for differentiable `φ`, and that Marshall–Olkin–Arnold 3.A.4 and Bullen Ch. I Thm 48 assume continuous derivatives (Bullen with `I ⊆ (0, ∞)`). Was each of the three read at its locator? None could be opened here; the target itself is true for differentiable `φ`.

## Previous findings

- R01 — repaired: 4.4 now takes a `z ≥ x`, `z ≺_w y` of largest total and raises `z_(k+1)` after the last tight prefix; recomputed below. The old route is kept only as a stated non-example.
- R02 — repaired: 6.1 uses the maximum of supporting lines at the first `n` points of a countable dense set, increasing and below `φ`, with monotone convergence on `φ_n − φ_1`. The repair left `ℓ` undefined in the next bullet (C01).
- R03 — repaired: 1.2 applies Hölder to `w ^ (1−t) x ^ ((1−t) r)` and `w ^ t x ^ (t s)`.
- R04 — repaired: 6.3 marks the zero-convention item as consumed from `InformationTheory.mul_log_le_klDiv`; both lemmas are in the Mathlib contracts and pinned by `#check`; the difference from the two targets is stated.
- C01 — repaired: the Check reads "`(1/2) • 1` (half the identity)".
- C02 — repaired: the entries 11.1–11.72 are attributed to the file SYNOPSIS11.md of the linked lean-CKMA repository.
- N01 — repaired: the closing header now says that it pins every library name the README writes in code font, which accounts for the names outside the contracts.
- N02 — repaired: the import of `TauCeti.Analysis.MeanInequalities` is gone.
- N03 — repaired: the contract cites `Mathlib/Basic/ENNReal/Holder.lean`, where the class is defined at the pin (line 42).
- N04 — repaired: 4.1 says the three definitions are stated for an additive commutative monoid with a linear order and the theorems take `M = ℝ`; the unused `[IsOrderedAddMonoid M]` is dropped.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.2 finite form, repaired Hölder route | `w=(1,0.01)`, `x=(1,2)`, `r=1`, `s=3`, `t=1/2` | product sum `1.04`; `(1.02)^(1/2)·(1.08)^(1/2) = 1.04957`, the target's right side `1.0496` | route gives the target | none |
| 4.4 majorized upper bound, repaired route | `x=(0,0)`, `y=(3,1)`; `z=(3,0)`; `z=(1,1)` | max total `4` at `(3,1)`, `(2,2)`, both `≺ y`; `k=1`: `0<1≤3≤3`, raise `z_2`; `k=0`: raise `z_1` | step valid; `(0,4)`, `4>3` not majorized as stated | none |
| 6.1 `⇐`, supporting-line approximation | `φ=x²`, points `0, 1, −1` | at `1/4`: `0,0,0 ≤ 1/16`; at `1`: `0,1,1 ≤ 1`; `φ_3 = −2x−1+2max(x+1/2,0)+2max(x−1/2,0)` | increasing, below `φ`, of stated form | C01 (strong-form bullet) |
| 6.3 zero conventions via `mul_log_le_klDiv` | `a=(1,2),b=(2,1)`; `a=(1,1),b=(1,0)`; `a=(0,1),b=(0,2)` | `0 ≤ 0.69315`; `0.38629 ≤ ∞` (not absolutely continuous); `0.30685 = 0.30685` | true; `B−A` cancels in real form | none |
| 4.1 `maxSubsetSum`, `Majorizes`, `WeaklyMajorizes` over `M` | `M=ℕ`, `a=(1,2,0)`; `ι=∅` | `0, 2, 3` at `i=0,1,2`; `Fin 0` has no index, sums `0=0` | elaborates without the order-compatibility class | none |
| 5.1 Schur–Ostrowski, changed attribution | `∏ x_i` on `(0,∞)²` at `(1,2)` | `(1−2)(2−1) = −1 < 0`: Schur-concave, consistent with the criterion | statement unchanged and true; attribution unread | question |

The rows for the statements the change does not touch stand as in the previous review, of `f3fdd95`.

- Source locators checked against the text: 0 (two further fetch attempts, for Niculescu–Persson and Shaked–Shanthikumar, resolve only to paywalled pages).
- Library declarations opened at the pin: `InformationTheory.klDiv` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean:56`), `mul_log_le_toReal_klDiv` (line 341), `mul_log_le_klDiv` (line 355), `klDiv_eq_zero_iff` (line 372), `ENNReal.HolderTriple` (`Mathlib/Basic/ENNReal/Holder.lean:42`).
- Cross-roadmap citations: none added or changed; the tool's four unresolved names are this roadmap's own dotted declarations, all declared in `Suggested.lean`.
- Automatic checks: all pass at this head; nothing outside the folder is changed.
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/MeansMajorizationAndDiscreteInequalities/Suggested.lean` exits 0 with 44 `sorry` warnings and no other warning or error; the 62 `#check` lines resolve.
- Signatures: the three changed definitions compared with 4.1 as now worded (`AddCommMonoid`, `LinearOrder` only); `quasiArithMean_mem_Icc` is re-wrapped, not restated.
- Pull-request text: the count of 44 theorems, the suppliers and the layer list agree with this head; the dropped Tau Ceti import was never mentioned. Nothing to correct.

Overlap check: read Majorization (OperatorTheory/Majorization, main), ComplexHessianEquations (main), OptimalTransport (main), OperatorMonotoneFunctionsAndMatrixMeans (open), LargeDeviations (open); nothing shared. The change adds no object and moves no ownership; the list of closest roadmaps is the one the previous review read.

Source independence: changed passages only; 0 passages compared with 0 sources, because none of the seven cited texts could be read legally; the changed passages are proof routes and library contracts written from the mathematics, with no new locator except the reattribution in 5.1; largest share Marshall–Olkin–Arnold, 20 of 70 locators; no layer was added, removed or reordered, so the arrangement was not compared again (and its contents could not be opened).

Research link: the headline targets are the doubly stochastic characterisation of majorization (Hardy–Littlewood–Pólya 1934), Schur–Ostrowski and Tomić–Weyl (Marshall–Olkin–Arnold 2011) and the convex order (Shaked–Shanthikumar 2007); the README's downstream section names Strassen-type comparison of experiments and Schur–Horn as users. Rests on the README.

## Not verifiable

- Hardy–Littlewood–Pólya, *Inequalities* (1934): no legal copy found; its locators remain unchecked.
- Marshall–Olkin–Arnold (2011), Bullen (2003), Mitrinović (1970), Mitrinović–Pečarić–Fink (1993), Niculescu–Persson (2018), Shaked–Shanthikumar (2007): each resolves only to a paywalled publisher page; all locators unchecked, including the hypotheses now attributed to three of them in 5.1.
- Wording against the sources: not checked, for the same reason.
- That SYNOPSIS11.md of lean-CKMA has entries 11.1–11.72 as sorted in "Prior formalization": the repository was not opened.

## Source issues

- none

## For the human reviewers

- **Scope.** The subject is classical inequalities; all seven sources are published monographs (1934–2018). Several targets (Schur's inequality 5.3, Muirhead 5.2, Bergström 3.2) are also standard competition material. Whether this is in scope is yours to decide.
- **Licence.** `README.md` (Prior formalization) links the author's project lean-CKMA and now states Apache 2.0; `Suggested.lean` calls `maxSubsetSum` a local copy of the shape of Mathlib pull request #41898. Neither repository was opened.
- **Not tested.** Marshall–Olkin–Arnold has the largest share of locators (20 of 70); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it or with any other source.
