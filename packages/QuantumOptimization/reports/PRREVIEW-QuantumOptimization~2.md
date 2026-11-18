# Review of QuantumOptimization (pull request #2505 at ddd83af)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the false description of the separating events in the proof sketch of 2.2, is repaired, and the three other changed passages (the sentence on deleting an end in 1.4, the boundary with BanachAlgebras 2.1, the sentence on splitting schemes) are correct at this head. No finding remains. There are one small correction, to the pull request's description, and one format note, neither blocking. Two questions of scope, one of licence and one of a neighbouring open roadmap are left for the human reviewers.

## C01 — The description's list of boundaries no longer names all of them

The description says "Boundaries are stated with GraphConnectivityAndFlows (network cuts and min-cut), OperatorTheory/SpectralSubspacePerturbation … and TemperleyLiebOperatorAlgebras 1.7." At this head "Scope and ownership" (README lines 812–814) also states a boundary with BanachAlgebras 2.1, which owns Riesz projections; a reader of the description alone does not learn of it.

The text that would be right: add "BanachAlgebras 2.1 (Riesz projections; the first bullet of 4.2 is only a comparison)" to that list.

## N01 — `Suggested.lean` states more than the headline theorems

Unchanged from the previous review: besides the eight or so headlines of the summary it carries elementary identities and bounds (`qubo_eq_ising`, `ising_eq_qubo`, `ising_ancilla`, `cutWeight_eq_ising`, `qaoaMean_le_sup'`, `exists_qaoaMean_eq_of_le`). None closes in one tactic; they could stay as they are or live in the README only.

## Previous findings

- R01 — repaired: "the two-sided event is a pair of opposite arcs of angle `θ` and the one-sided event is one of them. If `u = v` both events are empty; if `u = −v` … the complement of the origin … an open half-line."
- C01 (small correction) — repaired: "No roadmap on main treats splitting or composition schemes as integrators of differential equations; the two-matrix bound 5.2 is owned here." A search of the roadmaps on main, completed ones included, finds no such treatment.
- N01 (format note) — repaired: "BanachAlgebras 2.1 owns Riesz projections of a separated part of the spectrum in a Banach algebra. The first bullet of 4.2 only compares the band projection of a Hermitian matrix with that integral".
- N02 (format note) — repaired: "An internal edge costs at least `A`, and deleting one of its ends removes that cost and raises the second term by exactly `B`."
- N03 (format note) — not changed; written again as N01 above, still an option and not a request.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 2.2 The hyperplane probability, the changed sketch | `u=(1,0)`, `v=(1/2,√3/2)` (`θ=π/3`); `u = v`; `u = −v` with `t = ⟪g,u⟫` | signs differ on directions `(π/2,5π/6) ∪ (3π/2,11π/6)`: `(2π/3)/(2π) = 1/3 = arccos(1/2)/π`; one-sided `(π/2,5π/6]`: `1/6`; `u=v`: both empty; `u=−v`: `{t≠0}` (1), `{t<0}` (1/2) | sketch now agrees with the statement and its Check | none |
| 1.4 Maximum independent set, the changed sentence | path `a–b–c`, `A = 2`, `B = 1`, `x = {a,b,c}` | energy `2·2 − 3 = 1`; delete `a`: `2 − 2 = 0`, change `−A + B = −1`; delete `b`: `0 − 2 = −2`, change `−2A + B = −3`; second term rises by `1 = B` both times; minimum `−2 = −B·2` at `{a,c}` | holds | none |
| 4.2 first bullet (cited by the new boundary) | `H = diag(0,1,3)`, band `[1/2, 2]` | residue of `(H − z)⁻¹` at `z = 1` is `−E₂₂`, so `−(2πi)⁻¹∮ = E₂₂ = bandProj`; BanachAlgebras 2.1 builds idempotents for a partition of `σ(a)`: same object, cited not rebuilt | holds; boundary sentence true | none |
| Scope: no roadmap on main treats splitting schemes | search of every README on main for Trotter, splitting scheme or method, Runge–Kutta, one-step method | 0 roadmaps (the only hits are numerical-integration remarks in two Checks and titles by Toda and Gray on composition methods in homotopy) | sentence true | none |

The rows for the statements the change does not touch stand as in the previous review, of `ebff77f`.

- Source locators checked against the text this round: 1 (Luc13 lines 529–554: Section 4.2 with equations (30)–(32), the independent-set form at (32)); it agrees. The three Williamson–Shmoys locators of 2.2 are unchanged and stand as read in the previous review (see below).
- Library declarations opened at the pin: 1 (`TauCeti/Geometry/Lie/Exponential/Trotter.lean`, named in the changed paragraph; it exists).
- Cross-roadmap citations resolved: 1 new (BanachAlgebras 2.1 on main, README line 442, "Holomorphic germs and Riesz projections", idempotents at lines 540–543); the citation of the open one-step-methods roadmap is gone.
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; no supplier roadmap is named.
- Automatic checks at this head: all passed, none set aside.
- Elaboration of `TauCetiRoadmap/QuantumOptimization/Suggested.lean`: 32 `sorry` warnings and nothing else. The file is unchanged since `ebff77f`, so the one-tactic probe and the comparison of the 53 elaborated types with the README stand as in the previous review.
- The pull request changes nothing outside the folder. Its title and description agree with the head (a new roadmap, 32 theorems, 21 definitions, one Tau Ceti import, no supplier roadmap) except for C01.

Overlap check: read ExactPenalties, ApproximationGuarantees, KernelsAndSpectralMethods, OperatorMonotoneFunctionsAndMatrixMeans (open), MathematicalStatisticsHighDimensional, ConvexLifting (main); the third list is empty. One object is near: ApproximationGuarantees 2.4 (a later open pull request) defines a cut weight for `Sym2`-weighted edges of a simple graph and a local-optimality bound, and puts semidefinite relaxations out of its scope; the `cutWeight` of 1.3 here is on ordered-pair real weight matrices, in another namespace, and this pull request is the earlier, so 1.3 stays the owner of its form and nothing here changes. Nothing else shared.

Source independence: changed passages only: 4 passages compared, 1 with a source (Luc13 line 542, no shared wording) and 2 with roadmap text, none shared; the sketch of 2.2 could not be set beside Williamson–Shmoys this round (text not extractable), and its new wording is the repair this review proposed; largest share Luc13, 7 of 24 locators; no layer added, removed or reordered, so the arrangement stands as compared before: independent.

Research link: Layer 5 states results of Farhi–Goldstone–Gutmann (2014) and Wang–Hadfield–Jiang–Rieffel (2018); Layer 4 sharpens Jansen–Ruskai–Seiler (2007, Theorem 3); Layer 2 is Goemans–Williamson (1995); 5.2 is Childs–Su–Tran–Wiebe–Zhu (2021, Proposition 15). Rests on the README's references and the five texts read.

## Not verifiable

- Williamson and Shmoys 2011, Fact 6.4, Corollary 6.6 and Lemma 6.7 (2.2): the authors' web edition was fetched but is an encrypted PDF that the text extractor available this round could not read; the locators did not change and were read in the previous review. The changed sketch was checked by computation.
- Goemans and Williamson 1995 (2.1), Kato 1950 (4.3), Rosenberg 1975 (1.5): as in the previous review, no legal copy could be read; none is cited by a changed passage.
- The four public Lean repositories named under "Existing formalizations" were not opened, so `Suggested.lean` was not compared with them.

## Source issues

- **Misprint** in JRS06 at Theorem 4, printed page 5: the source says its hypotheses are those of Theorem 4 itself; it should be those of Theorem 3; affects nothing.
- **Error** in WHJ+17 at Theorem 1, equation (14), journal version: the source says, by its own closing correction note, that the first trigonometric term lacked a factor 2; it should be the coefficient `1/4` on `sin 4β sin γ (cos^d γ + cos^e γ)`; affects a stated result; corrected in print at arXiv version 2, which the README cites.

## For the human reviewers

- **Scope.** The main source of Layer 5, Farhi–Goldstone–Gutmann (FGG14), is an arXiv preprint; the README's reference gives no journal. Wang et al. (Phys. Rev. A 2018) and Childs et al. (Phys. Rev. X 2021) build on it.
- **Scope.** Two headline statements are stronger than any cited source and are marked "proved here": the adiabatic bound without the factors `m` (4.4) and the exact constant `1/2 + 1/(3√3)` on all 3-regular graphs (5.6). The previous review rederived both.
- **Licence.** The README names four public Lean repositories as reference material, one sharing this folder's name (urikol/QuantumOptimization, Apache-2.0). They were not opened, so adaptation of `Suggested.lean` from them was not tested.
- **Neighbouring roadmap.** ApproximationGuarantees 2.4 (open, later, same author) defines its own cut weight on `Sym2`-weighted graph edges; 1.3 here uses ordered-pair weight matrices. Neither cites the other; whether one form should serve both is for the approvers.
