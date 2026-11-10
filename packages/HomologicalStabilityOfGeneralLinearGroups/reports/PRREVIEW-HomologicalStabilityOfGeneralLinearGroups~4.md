# Review of HomologicalStabilityOfGeneralLinearGroups (pull request #2036 at 41c3fd5)

**Verdict:** accepted

This is an incremental re-review of the 65 lines changed since ad6c8fc, all of them in `TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/README.md` ("README"); `Suggested.lean` has not changed. The change applies the repair asked for in the previous report's R01, the route of 2.4. That repair is complete, and it introduced no new problem. No finding remains.

Kal80 is van der Kallen, Invent. Math. 60 (1980), read on the GDZ scan and cited by printed page. Supplier READMEs were read at their open heads: SchemeKTheoryOperations at 07d5e4d, StableHomotopyKTheory at 23a1323, AlgebraicKTheory at a668252, GeneralAlgebraicKTheory at 43e9df6.

## Previous findings

- R01 — repaired. README lines 493–501 now read: "for `m = 1` the surjective and injective stability of `K₁` (AlgebraicKTheory 4.1, `surjective_stability` for `n ≥ sdim + 1`, …); … `H_i(E(R)) = colim_n H_i(E_n(R))` (SchemeKTheoryOperations §6.7, directed unions) … `BE_n(R)⁺ → BE(R)⁺` covers `BGL_n(R)⁺ → BGL(R)⁺`". StableHomotopyKTheory 1.14 and the telescope are gone from the whole folder: grep finds no "1.14" and no "telescope". `surjective_stability` has been added to Scope (line 57), to the contract (181), and to 2.4's *Needs:* (503). §6.7's directed unions have been added to the contract (177–178), to *Needs:* (502) and to Dependencies (530).

## Verified sound

- **Gate.** The worker's gate at 41c3fd5 passed every check. I ran it again here with the candidate merge order and `--build`: every counter is 0, `build=0`, `OK`. A bare rerun against the default order reports only `depcheck: NOT IN ORDER: HomologicalStabilityOfGeneralLinearGroups (insert it after its last supplier)`. That line is expected: the public order file does not list this new roadmap yet, and the candidate order places it at line 37, right after SchemeKTheoryOperations (36). It is not a finding.
- **Dependency check** (the command of the brief, `--movable`, `--pr 2036`): `depcheck: 236 roadmaps, 2272 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line. The suppliers' positions in the candidate order are AlgebraicKTheory 15, StableHomotopyKTheory 16, GeneralAlgebraicKTheory 17 and SchemeKTheoryOperations 36, all before this roadmap at 37. None of them is on main (f8836c4).
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean` on `Suggested.lean` at the manifest pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d) gives exactly 6 `declaration uses sorry` warnings, at lines 76, 98, 113, 130, 151 and 166, and nothing else.
- **Signatures.** The `#check @name` file for all 10 declarations elaborates with no error. Every type is as in the previous report, and no binder has been lost. `git diff ad6c8fc HEAD -- Suggested.lean` is empty, so the previous padding probes stand.
- **Seeded sample.** Of the seeded targets, only 2.4 falls in the changed passages, and I read it against the source: **Kal80 4.12, Corollary and proof, printed p. 289.**
  - The plus construction is taken with respect to the normal closure of `E_n(R)`, for `n ≥ 3`.
  - The map `π_m(BGL_n⁺) → π_m(BGL_(n+1)⁺)` is onto for `n ≥ max(3, 2m + e − 1)` and injective for `n ≥ 2m + e + 1`, `m ≥ 1`.
  - In the proof, `m = 1` is classical; for `m ≥ 2`, `BE_n⁺` is the universal cover, and a Hurewicz argument from Theorem 4.11 finishes.
  - This agrees with README 482–492.
  - The second claim (`→ K_m(R)`) is the README's own deduction, and I checked it in the table below. The other seeded targets (1.1–1.3, 2.1–2.3, 3.1–3.4) are untouched by this diff and are recorded in the earlier reports.
- **Citations resolved for the changed passages** (8).
  - **SchemeKTheoryOperations §6.7** (heading at its README line 2508): the directed-union paragraph at line 2580 covers any group that is the union of a directed family of subgroups, any coefficients and `m ≥ 0`, both halves. Its scope paragraph (line 11) names this roadmap as a later consumer of these inputs, so the supply runs one way.
  - **StableHomotopyKTheory 3.16** (line 1187): relative Hurewicz for an `(n−1)`-connected pair with trivial `π₁A`-action. Applied inductively to the simply connected pair `(BE⁺, BE_n⁺)`, it turns `H_i = 0` for `i ≤ k` into `π_i = 0` for `i ≤ k`.
  - **StableHomotopyKTheory 3.27** (line 1320): homotopy functoriality for `φ` preserving perfect normal `P`, `P′`.
  - **StableHomotopyKTheory 3.31** (line 1375): for `P ⊆ H ⊆ G` with `P` perfect and normal, `BH⁺` is the cover of `BG⁺` with group `H/P`. With `H = P`, this is the universal cover.
  - **StableHomotopyKTheory 4.14** (line 1649): `E(R)` is AlgebraicKTheory A1's stable elementary subgroup. The "Supplied API aliases" at line 1655 include "perfectness of the stable elementary subgroup" and "the stable-elementary/commutator equality", which gives normality.
  - **AlgebraicKTheory 4.1** (line 461) and its `Suggested.lean`:
    - `surjective_stability` (line 280) has `hn : s ≤ Fintype.card n`.
    - `injective_stability` (line 293) has `hn : s + 1 ≤ Fintype.card n`.
    - With `s = sdim + 1`, these are the README's `n ≥ sdim + 1` and `n ≥ sdim + 2`.
  - **GeneralAlgebraicKTheory 3.14**: unchanged and cited as before.
- **Pinned declarations opened** (Tau Ceti 2fd255d), all under `TauCeti/`.
  - In `LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean`:
    - `StableGeneralLinearGroup` (:155) and `.of` (:162), with `of_injective` (:180).
    - `StableGeneralLinearGroup.elementarySubgroup` (:225): `⨆ n`, the images of the `E_n`, which is exactly the directed union that §6.7's statement needs.
    - `mem_elementarySubgroup_iff` (:238) and `of_mem_elementarySubgroup_iff` (:251). The latter turns `of(g) ∈ E(R)` into `diag(g, I_k) ∈ E_(n+k)`, the form `injective_stability` takes.
    - `elementarySubgroup_normal` (:271) and `elementarySubgroup_eq_commutator` (:293).
  - `RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean`: `groupHomology.exists_map_subtype_eq` (:113), the surjective half that §6.7 also names.
  - `…/Elementary.lean`: `commutator_elementarySubgroup_self` (:101).
  - Plus construction: none in Tau Ceti at the pin, a grep for `plusConstruction`, `IsPlusConstruction` and "plus construction" finds nothing. So the docstring's "2.4 not statable" stands.
- **Overlaps and ownership.** No open pull request changes this roadmap, drops an id it cites, or is cited at a revision's numbering (the overlap report, each item checked). The new citation does not duplicate anything:
  - §6.7 owns the directed-union identification for group homology, with Tau Ceti owning its surjective half.
  - StableHomotopyKTheory 1.17 is the classifying-space analogue, and this roadmap does not cite it.
  - This roadmap states neither.
- **Pull-request description.** "Depends on: … StableHomotopyKTheory (1.30, 1.32, 3.12, 3.16, 3.25–3.27, 3.31, 4.14) …" now equals the README's supplier list, and Layer 2 is described as "semilocal". The previous report's remark on the description no longer applies.
- **Remark, no change asked.** MotivicStructuresInModuliOfCurves §3.4 (README line 40, the one lead of the citation check) is a board package, at line 344 of the merge order, and is named in Scope only. This is unchanged since the previous report.

### Adversarial table

Rows marked "r3" are carried from the previous report (review at ad6c8fc), whose statements this diff leaves untouched; "r3 (r2)" rows were carried there from the review at 1fae7cd. The 2.4 rows are new: the statement is unchanged, its route rewritten.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.4 second claim, relative groups (route changed) | `E_n ⊂ E_N ⊂ E(R)`, `N ≥ n` | From 2.1: `H_i(E_n) → H_i(E_N)` is onto for `i ≤ k` when `n ≥ 2k + e − 1`, and injective for `i ≤ k − 1` when `n ≥ 2k + e − 2`. So `H_i(E_N, E_n) = 0` for `i ≤ k`. A filtered colimit, by §6.7 and the five lemma, gives `H_i(E(R), E_n(R)) = 0` for `i ≤ k`, exactly at `n ≥ 2k + e − 1` | holds | — |
| 2.4 second claim, Hurewicz ranges | `(BE⁺, BE_n⁺)`, both simply connected | Onto on `π_m` needs `k = m`, so `n ≥ 2m + e − 1`. Injective needs `k = m + 1`, so `n ≥ 2m + e + 1`. Hence bijective for `n ≥ max(3, 2m + e + 1)`, the README's bound | holds | — |
| 2.4 covering ranges | `m ≥ 2` | `n ≥ 2m + e − 1 ≥ e + 3 ≥ sdim + 3 > sdim + 2`, so `E_n` is normal (AlgebraicKTheory 4.1) and perfect (`n ≥ 3`), and 3.31 applies with `H = P = E_n`. `E(R)` is normal (Stable.lean:271) and perfect (4.14). So `π_m(BE_n⁺) = π_m(BGL_n⁺)` and `π_m(BE⁺) = π_m(BGL⁺)` | holds | — |
| 2.4 `m = 1` (route changed) | `π₁ = GL_n/E_n` | Onto: `GL_n → GL/E` is onto for `n ≥ s = sdim + 1` (`surjective_stability`), and the route needs `n ≥ max(3, e + 1) ≥ sdim + 1`. Injective: `of(g) ∈ E(R)` gives `diag(g, I_k) ∈ E_(n+k)` (Stable.lean:251), and `injective_stability` applies at `n ≥ e + 3 ≥ sdim + 2 = s + 1` | holds | — |
| 2.4, `ℤ`, `m = 2` (`e = 1`) | README Check | `H_i(E(ℤ), E_n(ℤ)) = 0` for `i ≤ 3` once `n ≥ 2·3 + 1 − 1 = 6`, so `π₂(BGL_n(ℤ)⁺) = K₂(ℤ) = ℤ/2` for `n ≥ 6`, as the Check states. `m = 1`: `K₁(ℤ) = ℤ/2 = GL_n(ℤ)/SL_n(ℤ)`, claimed from `n ≥ 4` | holds | — |
| 2.4, `𝔽₂`, `m = 2` (`e = 1`), negative control | `n = 4, 5, 6` | `π₂(BGL_n(𝔽₂)⁺) = H₂(E_n(𝔽₂))`, the Schur multiplier. At `n = 4` (`GL₄(𝔽₂) ≅ 𝔄₈`) it is `ℤ/2`, at `n = 5` it is `0`, at `n = 6` it is `0` (README 2.2). The map `ℤ/2 → 0` at `n = 4` is onto, as claimed (`n ≥ 4`), and not injective, which is allowed (`n ≥ 6` needed). `→ K₂(𝔽₂) = 0` is bijective at `n = 6` | holds; the injective bound cannot drop to `2m + e − 1` | — |
| 2.4, zero ring | `R = 0` | `GL_n = E_n = GL = E = 1`, `BGL_n⁺` is contractible, `K_m(0) = 0`; every map is `0 → 0` | holds | — |
| §6.7 directed union as used | the family `n ↦ of(E_n)` | The family is monotone (Stable.lean, `monotone_map_elementarySubgroup`), so it is directed, and its supremum is `E(R)` by definition (:225). §6.7's own control, `S₃` as the non-directed union of its cyclic subgroups, fails at `H₁(A₃) = ℤ/3 → H₁(S₃) = ℤ/2`. That control is not in play here | holds | — |
| 1.1 stabiliser count | r3 | `P = ∅`, `Q = {1}`, `n = 2`, over `𝔽₃`: `Stab(e₁) = {(1 0; 0 u)}`, of order 2; the count is `1 + 0 + 1 − 1 = 1`. Square case `t = 0`, `k = 0`: `G^({1},∅)`, size `1 = t + k + 1` | holds | — |
| 1.1 trivial-group Check | r3 | `G₂^([1,2],[1,2])` and `G₂^([1,2],{1})` both fix `e₁` and `e₂`, so they are trivial; the stabiliser has order 2 over `𝔽₃` | holds | — |
| 1.1 transitivity | r3 (r2) | Sphere ring: nothing is claimed. Field, `n = 2`: transitivity is claimed, and the stabiliser has order 2 over `𝔽₂` | holds | — |
| 1.2 `d¹` parity, Check 4 | r3 (r2) | `GL₂(𝔽₂)`: `ℤ/2 → ℤ/2` is onto. `GL₃(𝔽₂)`, `r = s = 1`: no claim. Reduced `H₀ = ℤ` for `GL₁(𝔽₃)` | holds | — |
| 1.3 NS property, `affineGroup` | r3 (r2) | `𝔽₃`: `H₃(𝔖₃) = ℤ/6` against `ℤ/2`. `ℚ`: `H₁ = ℚˣ` on both sides. `(1 0; 1 1)(0;1) = (0;1)` | holds | — |
| 2.1 / 2.2 `E_n`, non-target | r3 (r2) | `𝔽₂`, `m = 1`: `0, ℤ/2, 0`. `ℤ`: `ℤ/12 → 0`, onto at `n = 2`. `m = 4`: `n ≥ 8 < 9` | holds | — |
| 2.3 | r3 | `ℚ × ℚ`, `m = n = 1`: `ℚˣ × ℚˣ`, the identity through the two determinants. Zero ring: `ℤ → ℤ` and `0 → 0`. `ℤ_(2)`: not onto, and excluded by its residue field `𝔽₂`. `𝔽₂`: `ℤ/2 → 0`, excluded | holds | — |
| 2.3 product decomposition | r3 | `r` maximal ideals give at most `r` clopen components, each containing a closed point. `l = 0` is the zero ring, whose spectrum is empty | holds | — |
| 3.1 degree | r3 | Truncated constant system: `τ₂ : A → 0` is not injective, so there is no degree, while `Rel_1^2 = A ≠ 0`. `Rⁿ`: `Σρ = Re₁ ⊕ τ(Rⁿ)`, degree 1. Zero system: degree 0 | holds | — |
| 3.2–3.4, `hφ` | r3 (r2) | `G' = G`: every `Rel` is `0`. `𝔽₂` with `Rⁿ`: `Rel_1^2 = 𝔽₂`, `Rel_1^3 = 0`. `diag(g,1)(v;0) = (gv;0)` | holds | — |
| Convention 7 | r3 | `ℤ_(2)`: residue field `𝔽₂`, finite. `ℚ⟦t⟧`: residue field `ℚ`, infinite. Zero ring: the hypotheses hold vacuously, and it is not connected | holds | — |
| Conventions 3, 4 | r3 (r2) | `2 + 5c = ±1` has no solution. Ranks `1, 3, 6` give `6 − 3 + 1 = 4` | holds | — |

## Not verifiable

- Nesterenko–Suslin 1989 (Proposition 1.10, Theorems 2.7, 3.25) and Guin 1989 (Théorème 2) are cited for 2.3, which this diff does not touch. As in the previous reports, they were not opened, only confirmed through Galatius–Kupers–Randal-Williams, arXiv:2005.05620v3, Theorem 9.4.

## Source issues

- **Misprint** in Kal80 at Theorem 4.11, printed p. 289: the source writes the target of the first stabilization as the homology of `GL` with index `m + 1`; it should be `GL` with index `n + 1`; affects nothing.
