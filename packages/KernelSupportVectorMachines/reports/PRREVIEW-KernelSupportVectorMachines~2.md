# Review of KernelSupportVectorMachines (pull request #3008 at 4032736)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 80 README lines changed since `15050a5`; the three small corrections and the format note of the previous review are all repaired, the new worked instance of the duality identity in 1.2 was recomputed exactly, and the new Conventions paragraph relating SupportVectorMachines' `misclassRisk` to the risks here agrees with that roadmap's definitions. There are two small corrections and one format note, none blocking. As before, three of the cited texts could not be read through a legal copy; that is left to the human reviewers.

## C01 — The Conventions paragraph on SupportVectorMachines 4.2 takes `E = H` without saying that `H` must be separable

The new paragraph (README line 59) says that, to use the leave-one-out bound of SupportVectorMachines 4.2 with the risks here, one takes "`E = H` with its Borel σ-algebra". That bound, `lintegral_misclassRisk_le`, also carries `[SecondCountableTopology E]`, and the Conventions of SupportVectorMachines say that `E` is separable; a reader who follows the paragraph with a non-separable `H` cannot apply the bound. Everything the paragraph asserts about the value of `misclassRisk D (h, b)` is correct without separability (I checked that `φ` is measurable, that the set `{y (⟪h, w⟫ + b) ≤ 0}` is measurable in the product σ-algebra of `H × ℝ`, and that `misclassRisk` is `ℝ≥0∞`-valued while `marginError` is `P.real` of the same set).

Smallest change: add a clause, for example "take `E = H`, separable (as it is when `X` is separable and `K` continuous, the `K(·, x)` spanning a dense subspace), with its Borel σ-algebra".

## C02 — The case `F(a) = a` lies in Jaakkola–Haussler's Def. 1 only for a strictly positive definite kernel

In 1.2 (README line 155) and 1.3 (line 237) the dual without offset "is their case `F(a) = a`", and 1.3 adds that the assumptions of their Def. 1 make the maximizer unique. Def. 1 (p. 2, after eq. (2)) asks the potential to be strictly concave whenever the kernel is only positive semidefinite; `F(a) = a` is not strictly concave, so the support vector dual is a classifier of their Def. 1 only when the kernel is strictly positive definite. That is also why uniqueness holds there and fails in the second Check of 1.2 (two copies of one point).

Smallest change: "is their case `F(a) = a`, for a strictly positive definite kernel" at line 155; line 237 then needs none.

## N01 — Five sentences report what the author did not read

"it was not consulted" (lines 80, 298, 528, 824, 827 and the sentence closing the source paragraph of 3.2) describes the writing of the roadmap, not the mathematics; a reader a year on gains nothing from lines 298 and 528 in particular. The Conventions sentence that "Proved here" claims no novelty, and the two References entries, carry the information; the in-layer repetitions could go.

## Previous findings

The previous review had no finding; its small corrections and format note are accounted for here.

- C01 — repaired: "This objective is Shalev-Shwartz–Ben-David's (15.6), p. 207, with the same `λ` (their (15.5) adds an offset); divided by `2λ` it is Mohri–Rostamizadeh–Talwalkar's …" (line 71); (15.5) and (15.6) reread, both as described.
- C02 — repaired: "Linear kernel on `X = [−1, 1]` … (`r = 1`, as `K(x, x) = x² ≤ 1`)" (line 377).
- C03 — repaired: "define a family of kernel classifiers whose coefficients maximize … for a continuous concave potential `F`; the dual without offset … is their case `F(a) = a`" (line 153); one nuance remains, C02 above.
- N01 — repaired: the run of 200 random choices is replaced by one explicit instance with its values (line 215), recomputed below.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2 Check, instance of the identity (line 215) | kernel `(1+xy)²` on `−1, 0, 1`, labels `+, −, +`, `λ = 1/4`, `h = K(·,−1)/2`, `b = 1/2`, `α = (1/3, 2/3, 0)` | Gram `4,1,0;1,1,1;0,1,4`; `C = 2/3`; `‖h‖² = 1`; `M = (5/2, −1, 1/2)`; `ξ = (0, 2, 1/2)`; `D = 1 − 2/9 = 7/9`; `P = 1/4 + 5/6 = 13/12`; left `13/12 − 7/18 = 25/36`; right `7/36 + 1/4 + 1/6 + 1/12 = 25/36` | true | none |
| Conventions, `misclassRisk` of the image law (line 56) | definition at the SupportVectorMachines head; `b = 0`; score `0` with label `false`; `φ` not measurable | `misclassRisk D p = D {z | z.2 (⟪p.1, z.1⟫ + p.2) ≤ 0}` in `ℝ≥0∞`; `⟪h, K(·,x)⟫ = h(x)`; `marginError = P.real` of the same set; tie: margin `0 ≤ 0` counted, `signClassifier` gives `false` = label, not counted; `Measure.map` of a non-a.e.-measurable map is `0` | true | C01 (separability for 4.2) |
| Conventions, normalisation (line 70) | Shalev-Shwartz–Ben-David (15.5), (15.6); division by `2λ` | (15.5): `λ‖w‖² + L^hinge((w, b))`; (15.6): `λ‖w‖² + L^hinge(w)`; divided: `‖h‖²/2 + (2λn)⁻¹ Σ hinge`, `C = (2λn)⁻¹` | true | none |
| 1.2, 1.3 source sentences on Jaakkola–Haussler (lines 152, 235) | Def. 1 with `F(a) = a`; psd kernel with a repeated point | objective `−(1/2)Σ a_i a_j y_i y_j K + Σ F(a_i)` on `[0,1]ⁿ`; strict concavity of `F` required for psd-only kernels; repeated point: maximizers `α₁ + α₂ = 1`, not unique | true up to C02 | C02 |
| 2.2 Check (line 377) | `X = [−1, 1]`, linear kernel | `K(x, x) = x² ≤ 1 = r²`; atoms `±1, ±1/2` lie in `X`; numbers unchanged from the previous review | true | none |

Rows for the untouched statements stand as in the previous review, of `15050a5`; the diff changes no statement and no Lean declaration.

- Source locators checked against the text: 5 (Shalev-Shwartz–Ben-David (15.5), (15.6), lines 8128 and 8145 of the cached text; Jaakkola–Haussler Def. 1 eqs. (1)–(2) and its assumptions, lines 51–90, Lemma 1 eq. (5), lines 168–182, App. A eq. (30), line 433).
- Bibliography: Steinwart, J. Complexity 18 (2002), no. 3, 768–791, and Steinwart–Christmann, Springer New York 2008, Information Science and Statistics, agree with Crossref at the two DOIs given.
- Cross-roadmap citations resolved: SupportVectorMachines 4.2 (`misclassRisk`, `lintegral_misclassRisk_le`) at its open head; both exist with the stated content.
- Library declarations: none new in the diff; `MeasureTheory.Measure.map` (junk value `0`) as in Mathlib at the pin.
- Automatic checks: all passed. Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` (unchanged since `15050a5`) elaborates with 11 `sorry` warnings and nothing else.
- Pull-request text: the description states the new Conventions paragraph on `misclassRisk`, the meaning of "Proved here", and the two works cited as not consulted; no sentence contradicts the head; nothing outside the folder is changed.

Overlap check: read SupportVectorMachines, StatisticalLearningTheory, DiscriminantAnalysisAndLogisticRegression, OnlineLearningAndLittlestoneDimension, PACBayesBounds, MathematicalStatisticsNonparametric, MathematicalStatisticsSemiparametric, MathematicalStatisticsAsymptotic; nothing shared (as in the previous review; the new paragraph cites SupportVectorMachines 4.2 and restates nothing of it).

Source independence: changed passages only; 4 passages compared with 2 sources (Shalev-Shwartz–Ben-David, Jaakkola–Haussler), none shared; largest share Mohri–Rostamizadeh–Talwalkar, 11 of 32 located citations, text not readable; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 3 states the hinge case of the comparison theorem of Bartlett–Jordan–McAuliffe (2006) and consistency for Steinwart's (2001) universal kernels; Layer 2 the oracle inequality of Shalev-Shwartz–Ben-David (2014) via Bousquet–Elisseeff (2002) stability; 3.3 supplies the universality hypothesis of OptimalTransport 13.4. Rests on the README and the three texts read.

## Not verifiable

- Mohri–Rostamizadeh–Talwalkar, *Foundations of Machine Learning*, 2nd ed.: (5.24) and (6.13), pp. 88 and 116, in the rewritten Conventions sentence, and the other locators listed in the previous review; no legal copy readable.
- Steinwart (2001) and Bousquet–Elisseeff (2002): as in the previous review, the journal's host is not accepted by the sources service.
- Steinwart (2002) and Steinwart–Christmann (2008): only the bibliographic data was checked; the README cites no locator in either and says so. The chapter subjects named in Conventions were not checked against a contents page.

## Source issues

- none

## For the human reviewers

- **Not tested.** Mohri–Rostamizadeh–Talwalkar carries the largest share of the locators (11 of 32, README References) and could not be read: wording and arrangement were not compared against it.
- **Licence.** Steinwart (2001) and Bousquet–Elisseeff (2002) are in an open-access journal whose host the sources service does not classify; their locators stand unverified.
- **Licence.** Bartlett–Jordan–McAuliffe was read as the 2005 preprint on P. Bartlett's page, which is the version the README cites; the published article numbers its theorems differently.
- **Scope.** The README now names Steinwart (2002) and Steinwart–Christmann (2008) as the standard references for 3.2 and says neither was consulted (README lines 76–80, 478–480); whether 3.2's hypotheses should be compared with them before approval is yours to decide.
