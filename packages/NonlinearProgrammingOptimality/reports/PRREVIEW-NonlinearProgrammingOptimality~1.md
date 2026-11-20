# Review of NonlinearProgrammingOptimality (pull request #2675 at b55d057)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every theorem, definition and Check was recomputed (including the claims that 1.1, the dual form of MFCQ, the Gould–Tolle equivalence and the description of the critical cone need no differentiability of the constraints, under the value `0` of `fderiv`), and the locators into Pacaud, Bertsekas–Ozdaglar and Nemirovski were read at the cited pages. There is one small correction and one format note, neither blocking. The source cited most, the Andréasson–Evgrafov–Patriksson draft, could not be found at a legal location, so its eighteen locators are unverified and the comparison of wording and arrangement with it is left to the human reviewers.

## C01 — The equivalence of 2.1 tests objectives differentiable at the point, while the passage cited for it speaks of continuously differentiable objectives, and the difference is not stated

A reader who takes 2.1 for the Gould–Tolle theorem as the cited passage gives it will assume the wrong strength in one direction. Bertsekas–Ozdaglar define admittance of Lagrange multipliers with "every smooth cost function" (BertsekasOzdaglar2002 lines 93–94, with smooth meaning continuously differentiable, line 43), and the characterization on pp. 292–293 is for that class. In 2.1 (README line 198, and `guignardCQ_iff_forall_kktMultipliers_nonempty`) the class is all `f` with `DifferentiableAt ℝ f x`. With the larger class the direction from Guignard to multipliers is stronger than the cited one, and the converse is weaker: it assumes multipliers for more objectives. The route matches the stated class (the function `−φ(y − x) + θ(‖y − x‖)` is differentiable at `x` only), so the statement is true as written; I checked both directions.

The smallest change is one clause after the locator in 2.1, for example: "there for continuously differentiable objectives; with objectives differentiable at the point, as here, the first implication is stronger and the converse weaker". If the converse for `C¹` objectives is wanted as well, it would be a separate target with its own route.

## N01 — The Tau Ceti level-set lemma in the scope section has no file

`HasStrictFDerivAt.tangentConeAt_preimage_singleton` (README line 463) is in `TauCeti/Analysis/Calculus/TangentCone/LevelSet.lean`; the other library declarations of that list either name their file or appear in the supplier contracts.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 tangent cone ⊆ linearized cone | `{x² ≤ 0}`; cusp; non-differentiable active `g` | tangent `{0}` vs linearized `ℝ`; half-line vs line `d₂ = 0`; condition reads `0 ≤ 0` | true, strict in both examples | none |
| 1.2 LICQ ⇒ MFCQ | disc and half-plane at `0`; empty `ι`, `κ` | gradients `(−1,0)`, `(−2,0)`: LICQ fails, MFCQ holds with `d = (1,0)`; empty case both true | true, converse fails | none |
| 1.2 dual form of MFCQ | Tucker family `−∇gᵢ`, `±∇hⱼ`; redundant equalities | relation forces `xᵢ = 0`, so `∇gᵢ(d) < 0`, `∇hⱼ(d) = 0`; `(0,1)`, `(0,2)`: relation `ν = (2, −1)` | iff holds with no differentiability | none |
| 1.2 MFCQ ⇒ Abadie; affine ⇒ Abadie | disc: points `(s², s)`; complementarity set | `s⁴ − s² + 1 ≤ 1` for `s² ≤ 1`; tangent = `{d₁ ≥ 0}`; axes vs quadrant, polars equal | true; Abadie fails, Guignard holds on complementarity set | none |
| 2.1 Gould–Tolle | cusp with `φ = −d₁`, `f = x₁`; complementarity `f = x₁`; no constraints | `φ(−1,0) = 1 > 0`; `1 + 0 = 0` unsolvable; multipliers `(1, 0, μ₃)`; `θ(r) = o(r)` by compact sphere | both directions hold without differentiability of constraints | C01 (wording) |
| 2.2 Fritz John | `{x² ≤ 0}`, `f = x`; discontinuous inactive `g`; `ι = κ = ∅` | `μ₀·1 + μ·0 = 0` forces `μ₀ = 0`, `μ = 1`; `−μ = 0` then `μ₀ = 0`: none; `μ₀ ≠ 0`, `∇f = 0` | true; continuity hypothesis needed | none |
| 2.3 Gauvin | disc `f = x₁`; redundant equalities; `{x² ≤ 0}`; `dim E = 0` with one equality | segment `μ₁ + 2μ₂ = 1`; line `ν₁ + 2ν₂ = −1`; empty set, MFCQ fails; `ν` free, MFCQ fails | iff holds; nonemptiness and local minimum both needed | none |
| 2.4 uniqueness under LICQ | half-plane and circle, `f = x₁` | `(1,0) + μ(0,−1) + ν(−2,0) = 0` gives `μ = 0`, `ν = 1/2` | unique | none |
| 3.1 critical cone by sign pattern | `x₁² + x₂ − x₂²`, `μ = 1`; `x₁² − x₂²`, `μ = 0` | `∇f(d) = −Σ μᵢ ∇gᵢ(d) ≥ 0`; line `{(t,0)}`; whole `{d₂ ≥ 0}` | true; `μᵢ > 0` forces `gᵢ x = 0`, no feasibility needed | none |
| 3.2 second-order necessary | `x₁² − x₂²` on `{x₂ ≥ 0}`; `x₂² − x₁²` on `{x₁² ≤ 0}`, `μ = 0` | Hessian at `(0,1)` is `−2`, `f(0,t) = −t²`; Hessian at `(1,0)` is `−2` with LICQ failing | true; LICQ needed | none |
| 3.3 second-order sufficient | `x₁² + x₂ − x₂²`; `{x₁² ≤ 0}` with `μ = 2`; `x³`; `x⁴` | `x₂ − x₂² ≥ 0.7 x₂ ≥ x₂²/2` on `[0, 0.3]`; `diag(−2,2) + 2·diag(2,0) = diag(2,2)`; Hessians `0` | true with no qualification; inactive terms are `0 · junk` | none |
| Lean signatures vs README | all 15 elaborated types | `[FiniteDimensional ℝ E]` present in all six theorems; absent only from definitions that do not use it | agree with README hypotheses | none |

- Source locators read at the text: 12 (Pacaud Definition 2.1, (2.10), (2.11), Theorems 2.4, 2.6, Proposition 2.7, Definition 2.11, Proposition 2.12; Bertsekas–Ozdaglar pp. 290, 292–293, 295, 317–318; Nemirovski Theorems 8.2.6, 8.2.7). Not read: the 18 locators into Andréasson–Evgrafov–Patriksson.
- Library declarations opened at the pins: 17, among them `posTangentConeAt` (`Mathlib/Analysis/Calculus/TangentCone/Defs.lean:132`), `IsLocalMinOn.hasFDerivWithinAt_nonneg` (`Mathlib/Analysis/Calculus/LocalExtr/Basic.lean:143`), `tangentConeAt_eq_biInter_closure` (`TangentCone/Basic.lean:57`), `HasStrictFDerivAt.implicitFunctionOfComplemented` (`Implicit.lean:343`), `TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos` (`TauCeti/Geometry/Convex/Cone/Alternative.lean:159`), `TauCeti.fderiv_fderiv_self_nonneg_of_isLocalMin` (`TauCeti/Analysis/Calculus/DerivativeTest.lean:122`); all exist with the statements the README gives.
- Cross-roadmap citations resolved: 7 (VariationalMethods 2.1 on main; ConvexAnalysisAndDuality 1.4, 3.7, 5.2; ManifoldOptimization O3.2–O3.4; ExactPenalties scope), each says what the README reports.
- Duplication by object: no declaration on Karush–Kuhn–Tucker multipliers, Fritz John, constraint qualifications or linearized cones in the pinned Mathlib or Tau Ceti beyond those the README cites; no other roadmap, open or on main, states these objects for smooth nonconvex programs.
- Dependency check: `depcheck: 197 roadmaps, 2162 edges, 0 problem(s)`; no supplier roadmap is cited, only Mathlib and Tau Ceti.
- Elaboration: `Suggested.lean` elaborates with six `sorry` warnings and nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded) closes none of the six theorems. All six headline theorems of the README are stated; no padding.
- The pull request's title and description agree with the head (a new roadmap, 6 theorems, 9 definitions, no supplier roadmap).

Overlap check: read ConvexAnalysisAndDuality, OnlineConvexOptimization, ManifoldOptimization, ExactPenalties (and VariationalMethods on main); nothing shared.

Source independence: 12 passages compared with 3 sources, none shared; largest share Andréasson–Evgrafov–Patriksson, 18 of 32 locators; its text and table of contents could not be read, so contents were not compared with it (by the locator numbers alone, the roadmap places all constraint qualifications before the multiplier theorems, whereas the cited numbering has Fritz John at 5.15 before Abadie at 5.23 and LICQ last at 5.41).

Research link: Gauvin's theorem (1977) and the Gould–Tolle characterization (1971) are the inputs Bertsekas–Ozdaglar (2002) generalize to pseudonormality; the second-order conditions and the dual form of MFCQ are the standing hypotheses of parametric sensitivity analysis in Pacaud (2025, §2). Rests on the sources read, not on the README.

## Not verifiable

- Andréasson–Evgrafov–Patriksson, draft of February 22, 2005 (Definitions 5.2, 5.23, 5.35, 5.41, Lemma 5.10, Theorems 5.15, 5.25, 5.33, Propositions 5.36, 5.42, 5.44, Examples 5.4–5.7, 5.30, 5.31, 5.34): not found at a legal location. Looked at the Chalmers course pages for TMA947 (which link only to the publisher and an errata list), the first author group's Chalmers pages and a web search; the only copies found are on document-sharing hosts, which were not read. The mathematics of every statement carrying only this locator (1.1, LICQ ⇒ MFCQ, affine ⇒ Abadie, the examples) was recomputed independently.

## Source issues

- **Error** in Pacaud2025 at Theorem 2.6, printed page 6: the source says the multiplier set is bounded if and only if MFCQ holds; it should be nonempty and bounded, at a local minimizer (on `{x² ≤ 0}` with objective `x` the set is empty and MFCQ fails); affects a stated result.
- **Misprint** in Nemirovski1999 at Theorem 8.2.6, printed page 166: the source says the equality multipliers are indexed from 1 to n; it should be from 1 to m, the number of equality constraints; affects nothing.
- **Misprint** in Nemirovski1999 at Theorem 8.2.7, printed page 167: the source says the strongly active set is where m_j is positive; it should be where the multiplier μ_j is positive; affects nothing.

## For the human reviewers

- **Not tested.** The source with the largest share of locators (Andréasson–Evgrafov–Patriksson, 18 of 32) could not be read: wording and arrangement were not compared with it, and its locators are unverified.
- **Licence.** That source is a 2005 course draft of a book later sold by Studentlitteratur; the README says it is on Chalmers course pages, where I found no copy.
- **Scope.** The headline theorems date from 1948–1977 and are textbook material; the sources are a textbook draft, lecture notes (Nemirovski), a tutorial preprint (arXiv:2504.15851) and one refereed article (JOTA 114, 2002).
