# Review of SuperconnectionsAndMathaiQuillenForms (pull request #2297 at ca0f42b)

**Verdict:** needs changes

## R01 (P3) — 6.1 and 6.2 still cite a review identifier; 4.4 (b) has a section but no statement number

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:1057–1058 and :1108–1109: “as stated in its review Zbl 0671.57013” (twice); :820: “Berline–Getzler–Vergne, §9.1, in Ch. 9, pp. 263–310, for (b)”.
**Claim:** Partly repaired from the previous review (its R03). 4.4 (b) now names the section, with a 48-page chapter range instead of a statement number and page; the two Quillen 1988 locators are unchanged and locate nothing inside the paper.
**Witness:** `git diff 16ea243 ca0f42b` touches neither :1057–1058 nor :1108–1109. The book's public table of contents confirms §9.1, “The Index Bundle in Finite Dimensions”, and gives no statement number.
**Repair:** At :1057 and :1108 replace “as stated in its review Zbl 0671.57013” by the section and page of Quillen 1988 for the correspondence and for each of `γ_(2k)`, `γ_(2k−1)`; at :820 give the statement number and its page inside §9.1. Both texts stay uncertified and are not requested again; this needs a reader with access to them.

## R02 (P3) — The description says the section of 4.4 (b) is not given

**Location:** Pull request #2297, description, “Review”: “the section and statement number in Berline–Getzler–Vergne, Ch. 9, of the finite-dimensional limit theorem of 4.4 (b), which are not given because those texts could not be read”.
**Claim:** The head gives the section; only the statement number is missing. The “Sources” bullet for the book lists Ch. 9 without §9.1.
**Witness:** README.md:820 “Berline–Getzler–Vergne, §9.1, in Ch. 9”; README.md:1220–1221 “contains §9.1 (the index bundle in finite dimensions)”.
**Repair:** Write “the section and statement numbers of Quillen 1988 for 6.1 and 6.2, and the statement number, in Berline–Getzler–Vergne, §9.1, of the finite-dimensional limit theorem of 4.4 (b), which are not given …”, and in “Sources” write “Ch. 9, pp. 263–310, which contains §9.1”.

## Previous findings

- R01 — repaired: “oriented tangent-first: an oriented basis of `T_pZ` followed by normal vectors that `∇s(p)` maps to an oriented basis of `E_p` is an oriented basis of `T_pM`” (README.md:957–959), with the torus Check at :982–989.
- R02 — repaired: “Garcia 2018, §A.1, (A.1)–(A.4), p. 23, and Wu 2006, §2.3, for the algebra and the supertrace; Berline–Getzler–Vergne, §1.4, for the identity with the covariant derivative” (:713–714); 2.3 added to *Needs* and Dependencies.
- R03 — partly repaired: “Berline–Getzler–Vergne, §9.1, in Ch. 9, pp. 263–310, for (b)” (:820); “as stated in its review Zbl 0671.57013” unchanged at :1058 and :1109. Written again as R01.
- R04 — repaired: **API.** blocks at :833–840 (five bullets on `P_K` and `∇^K`) and :1128–1135 (equivariance, complements, stabilization, Hermitian `P d P`).
- R05 — repaired: the description now lists GeneralizedCohomology G4.0b, LieGroups Layer 2, LieGroupoidsPoisson G0.1, B2.2, C5 item 5, the Tau Ceti contracts, RandomMatrices §8.5, `cayley_cayleyInv`, `cayleyInv` and Knuth. One sentence is now behind the head: R02.

## Verified sound

| Statement | Instances | Left side computed | Right side computed | Result | Change |
|---|---|---|---|---|---|
| 5.3 orientation of `Z`, (b) | `T²`, `dx∧dy`, trivial line, `s = sin 2πx`, `φ = f dy` | `e_(d,βs) = −(2π)^(−1/2)∫_B(1 − β ds·e)e^(−β²s²/2) = g_β(s)s′dx`; limit `−∫f(0,y)dy + ∫f(½,y)dy` | `dx∧dy(a∂_y, ∂_x) = −a`, so `−∂_y` at `x = 0`; `dx∧dy(a∂_y, −∂_x) = a`, so `∂_y` at `x = ½`: same value | agrees; normal-first gives the opposite sign | — |
| 5.3 “for even `r` the order is immaterial” | `r` normals moved past `dim Z` tangent vectors | sign `(−1)^(r·dim Z)` | `+1` for even `r`; `−1` for `r = 1`, `dim Z = 1` (the torus Check) | agrees | — |
| 5.3 (a) against the same Check | closed `ω = c dy` | `−c + c = 0` | `∫_Z ω = −c + c = 0`; `e(∇) = 0` in odd rank | agrees | — |
| 5.3 against CharacteristicClasses Conventions | Thom map `a ↦ π*a ∪ U_E`, form on the left | `∫_E π*ω∧τ = ∫_M ω` needs base coordinates before fibre coordinates | tangent-first on the tube of `Z` | consistent | — |
| 4.1 route through 2.3 | `∇ = d + Θ`, `Θ` block-diagonal one-forms; `Θ = diag(a, b)`, `X = E₁₂·f` | `Θ` has parity `1 + 0`; `str[Θ, X] = 0` (off-diagonal) | 2.3 API: `str(covD δ Θ p X) = d str(X)`, `Θ` odd; `d str(X) = 0` | agrees | — |
| 4.4 API | `T = 0`; `T` invertible; `ε(w − X)⁻¹ε = (w + X)⁻¹` | `P_K = 1`, `XP_K = 0`, `∇^K = ∇`; `P_K = 0` | `ker X = E`; `ker X = 0`; `εP_Kε = P_K`, so `∇^K` preserves the grading | agrees | — |
| 6.2 API | `V = ℂ`; `u ∈ U(V)`; `W ↦ W ⊕ 0` | `F_0 = −1`, `F_ℂ = 1`; `P_(uW) = uP_Wu⁻¹`; `d(P ⊕ 0) = dP ⊕ 0` | `−F_ℂ = −1`; `2uP_Wu⁻¹ − 1 = uF_Wu⁻¹`; `tr((P ⊕ 0)(dP ⊕ 0)^(2k)) = tr(P(dP)^(2k))` | agrees | — |

The rows of the untouched statements stand as in the previous review, of `16ea243`; `Suggested.lean` is unchanged since that head.

- Source locators checked against the text in the changed passages: 3 (Garcia2018 lines 1063–1083 for §A.1, (A.1)–(A.4), p. 23; Wu2006 line 183 for (2.6), p. 2; the public contents page of Berline–Getzler–Vergne for the title of §9.1). Sampled targets falling in the diff: 4.1, 4.4, 5.3, 6.2.
- Cross-roadmap citations resolved on main for the changed passages: CharacteristicClasses C2, item 3 (README.md:835–847) and its Conventions (:166–175); GeneralizedCohomology G4.0b (README.md:939), so the overlap lead “only an open revision defines it” does not hold.
- Remark: C2, item 3 on main says “the specified orientation” without stating a rule; the tangent-first rule of 5.3 is the one its Thom-map order `π*a ∪ U_E` gives, and 5.3 now states it in full.
- Gate: every worker check passed (`build=0`, `depcheck=0`, `OK`). Dependency check: `depcheck: 244 roadmaps, 2200 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Elaboration of `Suggested.lean` at the pins: 16 `sorry` warnings, nothing else. The file is byte-identical to the one read at `16ea243`, so the signature comparison and the padding probe of that review stand.
- The new API bullets carry no backticked name of this roadmap's own (`readme-ids-missing=0`).

Overlap check: read RationalHomotopyModels, SpinGeometry, CalibratedGeometry, IndexTheory at the previous review; the diff adds no object, and ownership stands as recorded there (Clifford modules: SpinGeometry; real skew normal form: CalibratedGeometry §4.2; index formulas: IndexTheory; real Pfaffians: RandomMatrices §8.5); nothing shared with RationalHomotopyModels.

Source independence: changed passages only: 4 passages compared with 2 sources (Garcia2018, Wu2006), none shared; largest share Wu2006, 23 of 55 locators; no layer added, removed or reordered, so the arrangement stands as compared before: independent. The texts of BGV1992 and Quillen1988 could not be read.

## Not verifiable

- BGV1992 §1.4 (the identity `str[∇, α] = d str(α)`, new locator of 4.1) and §9.1 (4.4 (b)): settled uncertified, text not read; only the title of §9.1 was confirmed from the public contents page.
- Quillen1988 for 6.1 and 6.2: settled uncertified, text not read.

## Source issues

- none

## For the human reviewers

- **Not tested.** BGV1992 (15 of 55 locators) and Quillen1988 were not readable: wording and arrangement were not compared with them, and the locators R01 asks for need someone with access to both texts.
- **Licence.** README.md:1245 and :1250 cite Knuth (arXiv:math/9503234) and Harvey–Lawson (arXiv:math/9407216), both read from arXiv; the package's `sources.toml` has no entry for either.
