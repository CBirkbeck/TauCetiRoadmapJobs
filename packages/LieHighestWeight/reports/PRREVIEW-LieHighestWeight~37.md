# Review of LieHighestWeight (pull request #1797 at ee3a422)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

This is an incremental re-review of the 0 lines changed in this folder since 79f76f0. `README.md` and `Suggested.lean` are byte-identical to the head the previous review read. Since that review, the commits only return AlgebraicTopology, ReductiveGroups and QuadraticFormInvariants to their state on main, change GeometricTopology, and rewrite the pull-request description.

- **Gate and build:** the worker's gate passes. `lake env lean Suggested.lean` gives 0 errors and 10 `sorry` warnings.
- **Previous findings:** R02 (the description) is repaired. R01, R03 and R04 are not repaired, because their text is unchanged.
- **This report:** three findings, one of them blocking (P2). All three carry over from the previous review. None is new.

## R01 (P2) — The compact centre theorem `Z(G) ≃ P∨/Y` still has no owner

This is R01 of the previous review, not repaired. No repair report marks it "not actionable".

- **Location:** `README.md:80–94`: "The centre theorem for a compact connected semisimple Lie group `G` … is not part of this roadmap … LieGroups consumes this roadmap and ConvexityToric consumes LieGroups, so a section here consuming them would close a cycle."
- **Claim:**
  - On main, this roadmap plans the theorem. After this pull request merges, the bullet names no roadmap that plans it, so the theorem has no owner.
  - The bullet itself shows why LieGroups cannot take it: the proof needs `Y = (2π)⁻¹ker(exp)` from ConvexityToric T1, and ConvexityToric consumes LieGroups.
- **Witness:**
  - On main, this roadmap plans the theorem at `README.md:1707` and `:1747`.
  - `roadmaps grep 'P∨ */ *Y'` over main and all 458 open heads finds it only on main, in #1220 (`README.md:2765`, `:2820`) and in this bullet.
  - The board packages LieHighestWeightPartII, LieGroupsPartII and ConvexityToric do not state it.
- **Repair:**
  - Give the theorem an owner that comes after ConvexityToric, and cite it here by roadmap and section. Two placements respect the direction of supply:
    - ConvexityToric T1, which already builds `Λ_Z` and proves `exp_G(2πα∨) = 1`. That revision must be ordered against #1651.
    - A LieHighestWeight Part II that consumes LieGroups Layers 4 and 6 and ConvexityToric T1.
  - State the theorem there with the hypotheses it has on main: `G` compact, connected and semisimple; `Z(G) ≃ P∨/Y`, equivariantly for `Γ_Y`; `Y = Q∨` when `G` is simply connected. Use this bullet's locators.
  - Checked on four groups:
    - `SU(2)`: `Y = Q∨ = ℤ`, `P∨ = ½ℤ`, and `exp(2π·½) = −I`, so the centre is `{±I}`.
    - `SO(3)`: `Y = P∨`, and the centre is trivial.
    - `SU(3)`: `ℤ/3`.
    - `SO(4)`: `(ℤ/2)²/(ℤ/2) = {±I}`.

## R02 (P3) — The ConvexityToric link uses a heading anchor that the open revision #1651 renames

This is R03 of the previous review, not repaired.

- **Location:** `README.md:89`: "[ConvexityToric T1](../../SymplecticGeometry/ConvexityToric/README.md#t1-compact-symplectic-actions-and-local-models)".
- **Claim:**
  - On main the anchor resolves: the heading `## T1. Compact symplectic actions and local models` is at line 32.
  - At #1651's head (f049e2f) the heading is `## Layer 1: Compact symplectic actions and local models` (line 137), so the fragment breaks when #1651 merges.
  - The label "T1" survives: #1651's README line 133 says that "The labels T1–T5 denote these same five layers".
- **Witness:** `roadmaps overlaps` reports that #1651 "no longer defines" `#t1-compact-symplectic-actions-and-local-models`, which this README cites at line 89.
- **Repair:** keep the label "ConvexityToric T1" and drop the fragment, linking to `../../SymplecticGeometry/ConvexityToric/README.md`. The link then holds before and after #1651, and it creates no dependency on #1651.

## R03 (P3) — §7.5: the chain sentence runs in the wrong direction, and its locator stops before the cited phrase

This is R04 of the previous review, not repaired.

- **Location:** `README.md:1056–1061`: "Every positive root `β` is reached from a simple root by a chain of simple reflections, each lowering the height … (Theorem 24.2(iii)–(iv), pp. 123–124, lines 4880–4897, where (iv) uses such a chain)".
- **Claim:**
  - Read from the simple root to `β`, every step raises the height. The steps lower the height only when the chain is read from `β` down to the simple root, which is how the source says it.
  - The contract entry at `README.md:253–256` already states the direction correctly.
  - The phrase that (iv) uses is on line 4899, after the cited range.
- **Witness:**
  - In `G₂` (`α₁` short), `⟨θ, α₂∨⟩ = −3+4 = 1` gives `s₂θ = 3α₁+α₂`, and `⟨3α₁+α₂, α₁∨⟩ = 6−3 = 3` gives `s₁(3α₁+α₂) = α₂`. The heights fall 5, 4, 1.
  - In EtingofLieGroupsLieAlgebras, line 4897 is the printed page number "123", and line 4899 maps every root to a simple root.
- **Repair:** write "Every positive root `β` is carried to a simple root by a chain of simple reflections, each lowering the height", and cite "lines 4880–4899".

## Previous findings

- R01 — not repaired: `README.md:80–94` unchanged: "is not part of this roadmap … LieGroups consumes this roadmap and ConvexityToric consumes LieGroups, so a section here consuming them would close a cycle". No owner is named. This is R01 above.
- R02 — repaired: the description now states "This pull request → #1220 … It is rebased onto this revision once it has landed". It also says "`TypeAHaarTargets.lean` is removed, so the folder holds `README.md` and `Suggested.lean`", which matches the head.
- R03 — not repaired: `README.md:89` still links "`…/ConvexityToric/README.md#t1-compact-symplectic-actions-and-local-models`", which #1651 renames. This is R02 above.
- R04 — not repaired: `README.md:1057` still reads "reached from a simple root by a chain of simple reflections, each lowering the height", and line 1061 still cites "lines 4880–4897". This is R03 above.

## Verified sound

### Gate, build, form and pins

- **Worker's gate:** every check 0, build OK.
- **My rerun of the gate command:**
  - Every check is 0 except `outside-folder=2`.
  - Both files are in GeometricTopology (`README.md` and `Suggested.lean`), a folder the brief names as this pull request's own.
  - The brief's `git diff --stat origin/main...HEAD` with its exclusions is empty.
  - Against main, the branch changes 5 files: GeometricTopology's 2, and in this folder `README.md` and `Suggested.lean` plus the deletion of `TypeAHaarTargets.lean`. The family index files in `RepresentationTheory/` are unchanged.
- **Dependency check:** `depcheck: 235 roadmaps, 2272 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean Suggested.lean` exits 0 with 0 errors and 10 warnings, all `declaration uses sorry` (lines 77, 95, 103, 112, 118, 124, 129, 134, 146 and 163).
- **Pins:** `lake-manifest.json` and `lean-toolchain` are unchanged since 79f76f0 and match main.
- **No change since the previous review:**
  - `git diff 79f76f0 HEAD` on this folder is empty.
  - The previous `#check @` comparison of signatures stands: `Suggested.lean` has no `variable` block.
  - The previous one-tactic padding probe also stands: none of the 10 theorems closes in one tactic.
- **Headlines:** the summary (`README.md:12–22`) names 10 headline theorems, and `Suggested.lean` states exactly those 10. No headline is missing.

### Pinned declarations re-opened (3)

- **`RootPairing.Base.IsPos.induction_on_reflect`:** Mathlib `LinearAlgebra/RootSystem/Base.lean:782`. It matches the contract entry at `README.md:253–256`.
- **`RootPairing.coweightLattice`:** Tau Ceti `LinearAlgebra/RootSystem/CoweightLattice.lean:303`, with `corootSpan_le_coweightLattice` at line 325.
- **`RootPairing.Base.relIndex_corootSpan_coweightLattice`:** Tau Ceti `CoweightLattice/Basis.lean:144`, declared inside `namespace RootPairing.Base` (line 59), with `[P.IsCrystallographic]`.

### Sources

- **R03's locator:** EtingofLieGroupsLieAlgebras lines 4878–4902 re-read:
  - (iii) runs from line 4880 to 4894.
  - (iv) starts at line 4895.
  - Line 4897 is the page number "123", and line 4898 is the page-124 marker.
  - The phrase that maps every root to a simple root is at line 4899.
- **R01's locators:**
  - Theorem 43.4 is at line 8891 and gives `π₁(G_ad) = P∨/Q∨`.
  - Corollary 43.5(i) is at line 8914, and (iii) at lines 8919–8924, as the bullet cites.
  - Lines 8914–8926 say nothing about automorphism equivariance, as the bullet says.
- **The seeded sample:** the README is unchanged, so no sampled target falls in a changed passage. The 15 sampled locators were opened in earlier reports, and their verdicts stand.

### Description and overlaps

- **The description's claims about this folder hold at the head:**
  - `TypeAHaarTargets.lean` is deleted.
  - The README consumes Tau Ceti's Weyl-group (`HighestWeight/Weyl/`), coweight (`CoweightLattice/`, `README.md:473–481`) and Serre-presentation (`Presentation/Serre.lean`, `README.md:400`) developments.
  - Its Scope paragraph matches `roadmaps list`: #1652 changes AlgebraicTopology, #1676 ReductiveGroups, and #1215 QuadraticFormInvariants among others.
  - The order "this pull request → #1220" matches the generated `merge-order` block.
- **Overlaps:**
  - #1220 conflicts with this pull request; the order is now stated (previous R02, repaired).
  - #1651 drops the T1 anchor (R02).
  - No id is defined only by an open revision.
  - This pull request drops no id that another roadmap cites.
- **Citations:** the six leads in `citations.md` are source keys used as locators, not roadmaps. No Lean name is unresolved.
- **Ownership:** checked against main, all 458 open heads (`roadmaps grep`), and the board packages LieHighestWeightPartII, LieGroupsPartII and ConvexityToric. No change in this folder claims a new object. The only gap in ownership is R01.

### Adversarial table

- Every statement is unchanged, so every row is carried from the previous review, which read 79f76f0; that report's rows in turn carry values computed at 7db2eb6.
- The rows that a finding touches were recomputed this round and are marked "recomputed".

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| Scope: `Z(G) ≃ P∨/Y` (recomputed) | `SU(2)`, `SO(3)`, `SU(3)`, `SO(4)` | `Y = ℤ`, `P∨ = ½ℤ`: `ℤ/2 = {±I}` (`exp(π·diag(i,−i)) = −I`); `Y = P∨`: `1`; `det A₂ = 3`: `ℤ/3`; `(ℤ/2)²/(ℤ/2)`: `{±I}` | true; no owner (R01) |
| Scope: `Y/Q∨` alcove stabilizer versus centre (recomputed) | `SU(2)`, `SO(3)` | stabilizer `Y/Q∨`: `0` and `ℤ/2`; centre: `ℤ/2` and `1`; the orders are reversed, as `README.md:95–97` says | holds |
| §7.5 chain direction (recomputed) | `G₂` `θ`; `B₂` `α₁+2α₂` | `G₂`: `⟨θ,α₂∨⟩ = 1` gives `3α₁+α₂`; `⟨·,α₁∨⟩ = 3` gives `α₂`; heights 5, 4, 1 (falling from `β`, rising from the simple root). `B₂`: `⟨α₁+2α₂,α₂∨⟩ = −2+4 = 2` gives `α₁`; heights 3, 1 | the mathematics holds; the wording is reversed (R03) |
| Scope: `[P∨ : Q∨] = \|det A\|` (r36) | `A₁`, `A₂`, `B₂`, `G₂` | `2`; `3`; `4−2 = 2`; `4−3 = 1` | holds |
| Scope: cycle claim (r36) | edges on main | LieGroups ← LieHighestWeight (`LieGroups/README.md:750`); ConvexityToric T1 ← LieGroups Layer 6 | holds |
| §7.5 Mathlib induction hypotheses (r36) | `rootSystem H` of a Killing `L` | `Finite`, `CharZero`, `IsDomain`, `IsCrystallographic`, `IsReduced` all hold | holds |
| §7.5 negated chain (r36) | `G₂` `−θ`; `sl₃` `−α₁` | `−θ` goes by `s₂` to `−(3α₁+α₂)`, then by `s₁` to `−α₂`; `s₂(−α₁) = −α₁−α₂`, with dimension `1 = 1` | holds |
| §7.5 graded-piece reflections (r36) | `G₂` `4α₁+2α₂`; `B₂`; `A₁×A₁` | goes to `2α₁+2α₂`, then to `2α₁`, a zero piece; `10 = dim so₅`; `6 = 6` | holds |
| §7.5 `sl₂` symmetry input (r36) | `V(1)`, `V(2)`, `sl₃` under `h₁` | `1 = 1`; `1 = 1`; `±1`: `2 = 2`, `±2`: `1 = 1` | holds |
| §3.2 kernel coefficients (r36) | `t`, `j(x)`, `u tⁿ` | in the kernel; not in the kernel, with image `x`; in the kernel for `u ∈ F_{n−1}` | holds |
| §6.2 dominant finiteness (r36) | `sl₂`: `2ϖ`, `3ϖ`, `−ϖ`; `A₂`: `θ` | `{2ϖ,0}`; `{3ϖ,ϖ}`; `∅`; `{θ,0}` | holds |
| §9.1 reductive criterion (r36) | `gl₂`; `sl₂ ⋉ K²`; Heisenberg; `K` | reductive; radical `K² ≠ 0`; derived `Kz` not semisimple; reductive | holds |
| §0.2 Clebsch–Gordan (r36) | `V(1)⊗V(1)`, `V(2)⊗V(1)` | `4 = 3+1`; `6 = 4+2` | holds |
| §1.1, §1.2 (r36) | `sl₃`; `A₁`, `A₂`, `G₂`, `B₂` | `8 = 2+6`; `(ϖ/2)(α∨) = 1/2`; `det = 2, 3, 1, 2` | holds |
| §2.1, §2.2 (r36) | Jordan block; `sl₃` under `s₁` | generalized `2` vs honest `1`; `1 = 1` | holds |
| §3.1 (r36) | `sl₂` PBW; `[x,y] = y` | `dim F₁ = 4`, `dim F₂ = 10`; `{x,y²} = 2y²` | holds |
| §5.1, §5.2 (r36) | `sl₂` Casimir | `n(n+2)/8`; `3/8`, `1` | holds |
| §6.1, §6.3 (r36) | `sl₂`, `A₂` | `(e^ϖ+e^{−ϖ})(1−e^{−2ϖ}) = e^ϖ−e^{−3ϖ}`; Kostant `2` | holds |
| §7.1, §7.3 (r36) | `sl₂`; Gutt eq. (3) | `HC_dot = t²+2t`, `HC_lin = t²−1`; `x⋆y = xy+(ε/2)[x,y]` | holds |
| `serreLift_injective_of_base` (r36) | `A₁`; `sl₂×sl₂`; `B₂` transpose | `3 = 3`; `6 = 6`; `−e₂` vs `−2e₂` | holds |
| Layer 8 headlines (r36) | char 0; `ℝ` | `14`; `52 = 4+48`; negative definite vs signature `(8,6)`; `78, 133, 248` | holds |
| LR headline (r36) | `N = 2`, `λ = μ = (1)` | `(2)`: 1, `(1,1)`: 1; `4 = 3+1` | holds |
| `existsUnique_…ToPerm_mul`, §10.3 (r36) | `A₂`; `B₂`; `D₄`; `E₆` | `π(ω) = (0 1 2)`, `τ = (1 2)`; `2`; `24 = 4·6`; `6 = 3·2` | holds |

## Not verifiable

- HumphreysIntroLieAlgebras §18.3, cited in §7.5: the manifest records the source as uncertified (paywalled), so it is cited by locator and was not read.

## Source issues

- **Misprint** in EtingofLieGroupsLieAlgebras at the proof of Theorem 24.2(iii), printed p. 123: the source says the case where only one index `i` has `kᵢ ≥ 0` is clear; it should say `kᵢ > 0`, since every `kᵢ ≥ 0` there; affects nothing.
