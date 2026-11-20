# Review of KleinianGroups (pull request #432 at 83039bb)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. Layer 2 now uses Tau Ceti's Dirichlet domain and its general fundamental-domain theorem, and plans only what is new for `ℍ³`, the nullity of equidistant sets, whose stated geometry I recomputed. `Suggested.lean` elaborates with `sorry` as its only warning. There is one small correction and one format note, neither blocking; the licence of the cited prior formalization is left to the human reviewers.

## C01 — The guide to the layers and the scope section still say this roadmap builds and owns Dirichlet domains

"How to read the build" (line 36) says "Layer 2 builds Dirichlet domains", and "Scope and ownership" (lines 656–657) lists "Dirichlet domains" among what this roadmap owns for subgroups of `PSL(2, ℂ)`. §2.1 now says the domain and the theorem that it is a fundamental domain are Tau Ceti's and "Neither is planned again here", so the two sentences describe the text before the repair and give the object two owners on paper.

Write, for instance, "Layer 2 proves that equidistant sets in `ℍ³` are null and applies Tau Ceti's Dirichlet-domain theorem", and in the scope list "the nullity of equidistant sets and the Dirichlet fundamental domain of a discrete subgroup of `PSL(2, ℂ)` (the Dirichlet domain itself is Tau Ceti's)".

## N01 — Elstrodt–Grunewald–Mennicke is still cited by chapter only

The classification by trace (§1.2, line 214) and the Bianchi domains (§3.5, line 390) cite "Chapter 1" and "Chapter 7"; a section or theorem number with its page would let a reader check the two statements. Unchanged from the two previous reviews.

## Previous findings

- R01 — repaired: "The Dirichlet domain is Tau Ceti's `TauCeti.dirichletDomain Γ p₀` … Neither is planned again here"; the Lean theorem concludes `IsFundamentalDomain Γ (TauCeti.dirichletDomain Γ p₀) volume`; the four pinned declarations are listed under "From Tau Ceti". Two stale sentences remain (C01).
- C01 — repaired: "this roadmap adds the archimedean comparison; the Euler product of `ζ_F(2)` is Tau Ceti's".
- C02 — repaired: the docstring reads "The volumes of orientable finite-volume hyperbolic `3`-manifolds".
- N01 — not repaired: "Chapter 1" and "Chapter 7" without section or page (N01 here).
- N02 — repaired: "the Tau Ceti suppliers listed under Exact supplier contracts".
- N03 — repaired: "if `A ≠ ±1` maps to an element of finite order".
- Question on §5.1 — taken up: "adding them may change the set but not the rational relations among its members".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 `volume_setOf_dist_eq_dist` | `p=(0,1), q=(0,2)`; `p=(0,1), q=(1,1)`; `p=q`; general `t_p ≠ t_q` | `|w|²+t²=2`, through `(0,√2)`; plane `re w = 1/2`; whole space, so `p ≠ q` needed; centre `(t_q p − t_p q)/(t_q − t_p)` at height `0`, `r² = t_p t_q‖p−q‖²/(t_q−t_p)²` | true as stated; route matches `cosh_dist` | none |
| 2.1 `isFundamentalDomain_dirichletDomain` | pinned hypotheses; `Γ = ⊥`; `⟨w ↦ w+1⟩` at `(0,1)`; centre on the axis of `diag(i,−i)` | `IsIsometricSMul`, `ProperSpace`, `ProperlyDiscontinuousSMul`, `stabilizer = ⊥`, null bisectors, each supplied; domain `univ`; `n² ≥ 2n·re w` for all `n` iff `|re w| ≤ 1/2`; domain invariant under the involution | true; not closed by one library lemma (instances are theorems here) | none |
| 2.1 prose: translates, star-shaped, conjugation | pinned `smul_dirichletDomain`, `locallyFinite_smul_dirichletDomain` | `g • D(p) = D(g • p)`; locally finite with no stabilizer hypothesis; half-spaces through bisectors are geodesically convex | true | none |
| 3.3 torsion proof | `A = −1`; `(1, 1+i; −1+i, −1)` | `−1` maps to the identity and is excluded by `≠ ±1`; `det = 1`, `tr 0`, order 2 in `PSL` | repaired wording correct | none |
| 5.1 orientability remark | orientation cover | volume doubles, a rational factor `2` | "may change" claims nothing unverified | none |
| Scope: Euler product | §4.5 against the scope sentence | both now name Tau Ceti as owner | consistent | none |

The rows of the untouched statements stand as in the previous review, of `e85a407`.

- Library declarations opened at the pins: Tau Ceti `MeasureTheory/Group/DirichletDomain/Basic.lean` lines 79 (`dirichletDomain`), 225 (`smul_dirichletDomain`), 278 (`locallyFinite_smul_dirichletDomain`), 299 (`isFundamentalDomain_dirichletDomain`); `Geometry/Manifold/Riemannian/Geodesic/Minimizing.lean` line 252 (`TauCeti.Manifold.properSpace_of_completeSpace`); `Analysis/Complex/UpperHalfPlane/Bisector/Geometry.lean` line 145 (`UpperHalfPlane.volume_setOf_dist_eq_dist`); `Topology/Algebra/GroupAction/FreeLocus.lean` line 36 (`freeLocus`, carrier `stabilizer = ⊥`).
- Source locators checked against the text: 0 new; the changed passages carry no source locator, and the sampled target that falls in them, §2.1, was checked against the pinned library.
- Cross-roadmap citations: none added or changed; none reported as unresolved.
- Dependency check output: `depcheck: 182 roadmaps, 2076 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 45 `sorry` warnings and no other diagnostic; a single `import Mathlib` and nine Tau Ceti modules, no `set_option`, no sorry'd data. `#check @` of the two Layer 2 theorems agrees with the README statements.
- One-tactic probes on a copy: `volume_setOf_dist_eq_dist` is not closed by `simp` or one library lemma; `isFundamentalDomain_dirichletDomain` is not closed by `exact` with the pinned theorem, `simp` or `infer_instance`.
- Pull request text: the title and description agree with the head (a new roadmap, the four endpoints, the build); nothing changed outside the roadmap folder. The automatic checks all passed.

Overlap check: read FuchsianOrbifolds, ArithmeticFuchsianGroups, BallQuotientsAndComplexHyperbolicLattices (main), BianchiModularForms, MaassForms (open), as in the previous review; the change touches none of their objects; the Dirichlet domain is now owned by Tau Ceti alone; nothing shared.

Source independence: changed passages only; 3 passages (§2.1 prose, its two docstrings) compared with the pinned Tau Ceti docstrings, the only text they draw on, none shared beyond the dozen words of the definition; largest share Elstrodt–Grunewald–Mennicke, 2 of 6 claim-level locators; its text and table of contents could not be read; no layer was added, removed or reordered, so the arrangement was not compared again.

Research link: §4.6 is Humbert's volume formula (Humbert 1919) by the Tamagawa route of Borel 1981, §§7.3–7.5 and 9.1, as Milnor 1982 reports it; Layer 5 states question 23 of Thurston 1982, p. 380. Rests on borel1981 lines 707–716 and 922, milnor1982 lines 455–460, thurston1982 line 913.

## Not verifiable

- Elstrodt–Grunewald–Mennicke, *Groups Acting on Hyperbolic Space*: paywalled; Chapters 1 and 7 are cited without section numbers and were not opened.
- Maclachlan–Reid, GTM 219, and Ratcliffe, GTM 149: paywalled; cited in the references only.
- Cao–Meyerhoff, Invent. Math. 146 (2001): paywalled; the cusped minimum `2.0299` was not read in the text.
- Humbert (1919) and Neumann–Yang (1999): not fetched; the formula was checked in the previous review against milnor1982 line 460 and numerically.

## Source issues

- none

## For the human reviewers

- **Licence.** The Provenance section of `TauCetiRoadmap/KleinianGroups/README.md` says the domains, indices, integration route and ratio bound were first formalized in the repository `t4v1/thurston23`; its licence, and how far `Suggested.lean` is adapted from it, were not checked.
- **Not tested.** Elstrodt–Grunewald–Mennicke has the largest share of the locators (2 of 6); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
