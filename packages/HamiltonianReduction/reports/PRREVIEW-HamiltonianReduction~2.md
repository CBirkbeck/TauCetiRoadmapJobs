# Review of HamiltonianReduction (pull request #2696 at 2aba5a6)
Folder: `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/`
**Verdict:** accepted

**Summary.** Accepted. This pull request changes the folder by ten lines of `Suggested.lean` only. The patch replaces the family root's adapter `HasHamiltonianField` by Tau Ceti's `TauCeti.SmoothTwoForm.IsHamiltonianVectorField`, which has the same body. The file elaborates with only `sorry` warnings, and no statement changes meaning. Everything else in the folder is main's text. The open revision of this roadmap (#2690), which the description orders before this pull request and which conflicts with it, replaces both files, so main's defects are that revision's to settle and are not restated here; after that rebase this pull request changes nothing in the folder. Two small corrections and one format note, none blocking. The human reviewers have one fact about merge order and one about sources that were not read.

## C01 — `equivariantMoment_infinitesimal` restates the two fields of its hypothesis, so as a target it asks an implementer for nothing

The patch rewrites this statement (lines 59–64), so this is worth knowing before it merges. On a copy of the file, the single step `exact ⟨hμ.smooth.clm_apply contMDiff_const, hμ.hamiltonian ξ⟩` closes it. The first conjunct is the `smooth` field of `IsEquivariantMomentMap` composed with evaluation at `ξ`, and the second is its `hamiltonian` field unchanged. If the statement is a sanity check of `algebraicMoment`, mark it as one. If the comparison with Tau Ceti's infinitesimal moment map is meant (the docstring of `algebraicMoment` speaks of conversion to the algebraic dual), state instead that `algebraicMoment μ` is a `TauCeti.SmoothTwoForm.IsMomentMap` of the fundamental action. Nothing is needed if this pull request is rebased onto the revision as stated, because that revision's file drops the declaration.

## C02 — The docstring of `PullsBackTo` points an implementer to a predicate that this pull request's own root says does not exist

Lines 88–90 call `PullsBackTo` a temporary adapter of the HamiltonianSystems proposal's `SmoothTwoForm.IsSymplecticMap`, to be deleted once that roadmap is imported. The pinned Tau Ceti has no `IsSymplecticMap`: the name occurs nowhere under `TauCeti/`. The root README rewritten in this pull request (Conventions 2, lines 98–103) writes a symplectic map as the equation `SmoothForm.mpullback f hf σ₂ = σ₁`, written out and not wrapped in a new predicate. A reader who follows the docstring therefore waits for a declaration that the family no longer plans. A sentence that would be true: for smooth `p`, `PullsBackTo p σ τ` is the pointwise form of `SmoothForm.mpullback p hp τ = σ` (Tau Ceti `SmoothForm.mpullback_apply`, `TauCeti/Geometry/Manifold/DifferentialForm/Pullback/Smooth.lean`, line 226). Like C01, this is moot after the stated rebase.

## N01 — The patched import block still breaks the import rule twice where it is easy to meet

`Suggested.lean` has no `import Mathlib` line and keeps the submodule import `Mathlib.Geometry.Manifold.IsManifold.InteriorBoundary` (line 4). Putting `import Mathlib` first and dropping line 4 fixes both. The import of CotangentLagrangian's Lean file (line 1) has to stay while the file uses `Cotangent`, `cotangentModel` and `canonicalForm`. The revision's file needs none of them.

## Earlier findings

The earlier review read the open revision's text (#2690), not this head. Status here:

- R01, no headline locators: not repaired here. This head is main's text, whose References give "Cannas da Silva, *Lectures on Symplectic Geometry*, §§22–25" and chapters without numbers (lines 364–368). The finding belongs to the revision.
- R02, IntegrableSystems I2.0 and CotangentLagrangian C4 would break: repaired by the suppliers. Their open revisions now map the old ids: IntegrableSystems says "I2.0 is now §2.0" (#2691, line 1225), and CotangentLagrangian says "C4 is now Layer 4, §4.1–§4.8" (#2687, line 1278). The citations at lines 73, 103, 107 and 119 stay valid.
- C01, the R-numbering: does not arise here, because the R-numbering is kept. The revision now maps it (its lines 67–68).
- C02, the earlier description: concerns the other pull request's text.
- C03, "Retain the source exercises": still at line 183 here. The revision retitles it §2a.7 "Model computations and range tests".

## Verified sound

| Statement | Instances tried | Values computed (README side / independent side) | Result | Change |
|---|---|---|---|---|
| Patch: `HasHamiltonianField` → `IsHamiltonianVectorField` | main's root file lines 17–20; Tau Ceti `Hamiltonian/Manifold.lean` 124 | both `∀ x v, eval₂ σ x (X x) v = mvfderiv I f x v`; `hμ.hamiltonian ξ` typechecks against the new conjunct | identical | none |
| R1 fundamental fields antihomomorphism (l. 36–37; `fundamentalField_lie`) | `SO(3)` on `ℝ³`; abelian `ℝ` | `[Ax, Bx] = BAx − ABx = −[A,B]x`; abelian: `0 = 0`; pin `[ξ_M, η_M] = −⁅ξ,η⁆_M` | holds | none |
| R1 shifts by constants (l. 46–47) | `μ + c`; `O(2)` on `T*S¹` | equivariant iff `c = Ad*_g c`; reflection: `−p + c` vs `−p − c` | holds | none |
| R1 disconnected groups need a component condition (l. 48–49) | `O(2)`, `μ = p + c`, `c ≠ 0` | infinitesimal: `c([ξ,η]) = 0` holds; group: `−p + c ≠ −p − c` | holds | none |
| R1 group defect cocycle (l. 51–53) | telescoping; translations of `(ℝ², dq∧dp)` | `θ(gh) = θ(g) + Ad*_g θ(h)`; `μ(q,p)(a,b) = ap − bq`, `θ(g)(ξ) = ω(ξ,g)`, derivative `ω(ξ,η)` (Heisenberg) | holds | none |
| R1 linear symplectic moment map (l. 59) | `A ∈ sp(V)` | `d(½ω(Av,v))(w) = ½ω(Aw,v) + ½ω(Av,w) = ω(Av,w) = ι_{Av}ω(w)` | holds | none |
| R1 cotangent-lift moment map (l. 59–60; `cotangentMomentum_hamiltonian`) | `SO(3)` on `T*ℝ³`; Liouville sign | `p·(ξ×q) = ξ·(q×p)`; `μ(gq, g⁻ᵀp)(ξ) = μ(q,p)(Ad_{g⁻¹}ξ)`; `L_ξ̃λ = 0 ⇒ ι_ξ̃(−dλ) = d(λ(ξ̃))` | holds | none |
| R1 `f ↦ −X_f` a Lie homomorphism (l. 63–64) | `(ℝ², dq∧dp)`, `f = q²`, `g = p` | `{f,g} = 2q`, `X_{2q} = −2∂_p`, `[X_f, X_g] = 2∂_p`: `X_{f,g} = −[X_f, X_g]` | holds | none |
| R1a.0 two-parameter identity (l. 85) | `φ = (x+t, y+ux)` on `(ℝ², dx∧dy)` | `β_t = dy + u dx`, `β_u = −x dx`; LHS `dx`; RHS `d(ω(X,Y)∘φ) = d(x) = dx` | holds | none |
| Headline R1a.3 torus flux group (l. 107) | `T²`, `ω = A dx∧dy`, integer velocities | `ι(a∂_x + b∂_y)ω = A(a dy − b dx)`; `(a,b) ∈ ℤ²` gives `A·H¹(T²;ℤ)`; angular form `A/(4π²)` | holds | none |
| R1a.4 cylinder (l. 125) | `ℝ × S¹`, `ω = dr∧dθ`, `∫f = 1` | `ι(−f∂_θ)ω = f(r−R) dr`; compact-support class `1`, ordinary class `0`; independent of `R` | holds | none |
| Headline R2 KKS (l. 129, 152) | `SO(3)`, `ν = r e₃` | `ξ_O(ν) = ξ×ν`; `ω(−re₂, re₁) = r` gives `ω = dA/r`; area `4πr²/r = 4πr` | holds | none |
| R2 `SU(2)` normalisation (l. 153–154) | basis `−iσ_a/2` | bracket `ε_abc(−iσ_c/2)`; `exp(t·(−iσ₃/2)) = diag(e^{−it/2}, e^{it/2})`, period `4π` | holds | none |
| R2a.2 Hessian and KKS on root planes (l. 165–169) | `q_p = −α(p)J_α` substituted | `Hess(q_pA, q_pC) = −α(X)α(p)B(A,C)` both ways; `ω_p(q_pA, q_pC) = α(p)B(J_αA, C) = B(p, [A,C])` | holds | none |
| Headline R2a.3 index formula (l. 173–175) | `SU(2)`, `S²`, `μ, X` dominant | `p = μ`: index `2 = 2 − 0`; `p = sμ`: index `0 = 2 − 2`; maximum at `μ` | holds | none |
| R2a.7 Heisenberg orbits (l. 183) | `[X,Y] = Z`, `ν = (p,q,r)` | adjoint: `aX + bY + ℝZ`; `X_O = −r∂_q`, `Y_O = r∂_p`, `ω(X_O, Y_O) = r`, so `ω = dp∧dq/r` | holds | none |
| R2a.7 `Spin(7)` subgroup (l. 185) | supports 1234, 1256, 1357 | `(e₁e₂e₃e₄)² = (−1)⁶ = 1`; overlaps 2, so they commute; order 16 > 8 = `|T[2]|`, rank 3 | holds | none |
| Headline R3 regular reduction (l. 191–206) | `S¹` on `ℂⁿ`, `c = −½`; `SO(3)` on `T*ℝ³`, `c ≠ 0` | `dim Q = 2n − 2 = (2n − 1) − 1`; `6 − 3 − 1 = 2`; free ⇒ `g_x = 0` ⇒ `dμ_x` onto | holds | none |
| R3 orbit model `Φ` (l. 216–233) | `(gh, h⁻¹z)`, inverse | `↦ (gz, [gh] = [g])`; `μ(gz) = Ad*_g c = ι_O[g]`; `μ(g⁻¹m) = c` | holds | none |
| R4 right-action sign and shift (l. 289–291) | `R_g q = g⁻¹q` | `ξ^right = −ξ^left`, `A(ξ^left) = −ξ`; `(p + ⟨c,A⟩)(ξ^left) = c(ξ) − c(ξ) = 0` | holds | none |
| R5 gauge moment map (l. 315–317) | `g = exp(tξ)`; closed `Σ` | `[ξ,A] − dξ = −d_Aξ`; `∫B(d_A a, ξ) = −∫B(d_Aξ ∧ a) = Ω(ξ_A, a)` | holds | none |
| Headline R5 dimensions (l. 338, 344, 346, 356) | `U(1)`; irreducible `SO(3)`; framed | `h¹ = 2h⁰ + (2g−2)dim k`: `2g`, `6g − 6`; framed `(2g−1)dim k + h⁰`: `U(1)` gives `2g` | holds | none |
| R5 ineffective kernel (l. 342) | `O(2)`; finite `K` | `ker Ad = SO(2) = C_K(K⁰)`, reflection acts by `−1` on `so(2)`; finite `K`: `𝒜(P)` a point | holds | none |
| `equivariantMoment_infinitesimal` (C01) | one-tactic probe | `exact ⟨hμ.smooth.clm_apply contMDiff_const, hμ.hamiltonian ξ⟩` closes it; both are fields of the hypothesis | padding | C01 |
| `fundamentalField_lie`, `cotangentMomentum_hamiltonian` | `simp`, `rfl`, `intro; simp` | all fail; pin versions need `ContMDiffSMul`, complete group model; cotangent: Hausdorff, boundaryless (`Bundle/MomentMap.lean` 171) | not padding | none here |
| `descendedForm_unique`, `descendedForm_exists` | `simp_all`, `rfl`; degenerate `dim Q = 0`, `M = ∅` | probes fail; `Q` a point: `σ = 0`, `τ = 0` symplectic; `M = ∅` forces `Q = ∅` | not padding | none here |
| `PullsBackTo` docstring (C02) | pin search; root Conventions 2 | `IsSymplecticMap`: 0 occurrences in Tau Ceti; root writes `SmoothForm.mpullback f hf σ₂ = σ₁` | stale pointer | C02 |

- Source locators checked against the text: Cannas da Silva Def. 22.1 (CannasDaSilva2001 line 5357), Thm 23.1 (line 5550), §24.4 (line 5856), §§25.3–25.4 (lines 6078, 6122), and the contents for Lectures 21–26 (lines 175–215). Huebschmann Lemma 2.18 to Thm 2.32 (Huebschmann1995 lines 360–514); its standing hypothesis is a compact group, not necessarily connected (line 16), which matches R5.
- Library declarations opened at the pins: Tau Ceti `Symplectic/Hamiltonian/Manifold.lean` 124; `Lie/FundamentalVectorField.lean` 83, 236–248; `Symplectic/Hamiltonian/EquivariantMomentMap/Basic.lean` 170; `Symplectic/Cotangent/Bundle/MomentMap.lean` 84, 153–171; `Symplectic/Cotangent/MomentMap.lean` 80–202; `Manifold/DifferentialForm/Pullback/Submersion.lean` 113–143; `Pullback/Smooth.lean` 226–234; `Pullback/Basic.lean` 299–311; `Symplectic/Manifold/Descent.lean` (whole file).
- Cross-roadmap citations resolved: IntegrableSystems I2.0 and CotangentLagrangian C4 (main, and their open revisions' former-numbering paragraphs); LieGroupoidsPoisson ownership (lines 70–84) and §G7.2 (lines 1892–1912); ConvexityToric lines 32, 148, 156, 390; GeometricQuantization lines 40, 199; Orbifolds line 83; the root at this head, lines 49–132. CotangentLagrangian's revision keeps `Cotangent`, `cotangentModel` and `canonicalForm` in the same namespace, so the new import stays valid.
- Automatic checks, rerun on this head: the TeX subscripts (README lines 83 and 93), the pull-request numbers (lines 37–350) and the HamiltonianSystems citations (README lines 16 and 73, Lean lines 47 and 90) are all in main's text, which the revision replaces. The import hits are N01.
- Dependency check: `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` gives five `sorry` warnings and nothing else. `#check @` of all 13 declarations shows each binder explicit and in agreement with the README's description (R1, and R3 lines 200–205 for the two descent statements). The patch changed only the predicate's name.
- Headlines in `Suggested.lean` at this head: none of the README headlines is stated here. The revision states the two that can be stated at the pins (Weyl-relatedness and connected coadjoint stabilizers) and names the rest as not statable; this is not restated here.
- Overlap check: read LieGroupoidsPoisson, ConvexityToric, GeometricQuantization, Orbifolds and HeegaardFloer (main) and the family root at this head. KKS and coadjoint orbits: owner R2, with LieGroupoidsPoisson §G4.6B and ConvexityToric consuming. Proper-orbit slice: owner R3.1. Locally free level presentation: owner R3, with Orbifolds owning O1–O4. Moment-map defect: owner R1. Generic form descent: Tau Ceti `SmoothForm.descendedForm` at the pin, which the revision cites.

Source independence: 7 passages compared with 2 sources (Cannas da Silva Def. 22.1, Thm 23.1, §24.4, §§25.3–25.4 against README lines 41, 191–199, 234–235, 309–311 and 315–317; Huebschmann §§2.16–2.32 and the abstract against lines 324–336 and 307); nothing shared beyond forced formulas. Largest share: a tie at one locator each among five references (CannasDaSilva2001 §§22–25, Huebschmann1995 §§2.18–2.32, Marsden–Ratiu, Atiyah–Bott, Sjamaar–Lerman). Contents compared with CannasDaSilva2001 (Lectures 21–26): independent. R1a, R2, R2a and R4 have no counterpart there. The order R1 → R3 → R5 is forced by R3's use of R1's moment maps and by R5's role as the presentation for R3.2 (line 332).

Research link: R3's singular reduction and normal form are the framework of Sjamaar–Lerman (1991). R5's finite-dimensional local model of flat-connection moduli is Huebschmann (1995, §§2.18–2.32), extending Atiyah–Bott (1983) to disconnected groups. This rests on the README's references and on Huebschmann's text, which I read.

## Not verifiable

- Atiyah–Bott 1983 (References): no target cites it at a locator; it is not among this roadmap's recorded sources, and the publisher's copy is paywalled.
- Sjamaar–Lerman 1991 (References): no target cites it at a locator; it is not among the recorded sources, and the copy is behind JSTOR.
- Marsden–Ratiu, *Introduction to Mechanics and Symmetry* (References): cited by unnumbered chapters; it is not among the recorded sources and is a paywalled book.

Automatic checks set aside as false positives: the check for edits outside the roadmap folder listed the family root's README and Lean file, which are this pull request's own (the family index).

## Source issues

- none

## For the human reviewers

- The folder at this head is main's text plus a ten-line Lean patch. Rebased onto #2690 as stated, this pull request changes nothing in the folder. Merged first instead, main keeps its HamiltonianSystems supplier citations (README lines 16–24, 73), which this pull request's root no longer names.
- Not tested: three of the five referenced works (Marsden–Ratiu, Atiyah–Bott, Sjamaar–Lerman) were not read, so the README's wording and arrangement were not compared with them.
