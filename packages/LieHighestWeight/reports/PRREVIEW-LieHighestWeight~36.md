# Review of LieHighestWeight (pull request #1797 at 79f76f0)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

This is an incremental re-review of the 52 lines changed since 7db2eb6, all in `README.md`. `Suggested.lean` is unchanged.

- **Gate and build:** every check passes on this folder, and `lake env lean Suggested.lean` gives 0 errors and 10 `sorry` warnings.
- **Previous findings:** R02 is repaired. R01 is partly repaired and R03 is not repaired.
- **This report:** four findings, one of them blocking (P2).

## R01 (P2) — The compact centre theorem `Z(G) ≃ P∨/Y` still has no owner

- **Location:** `README.md:80–94`: "The centre theorem for a compact connected semisimple Lie group `G` … is not part of this roadmap … LieGroups consumes this roadmap and ConvexityToric consumes LieGroups, so a section here consuming them would close a cycle."
- **Claim:**
  - The locators, the `Γ_Y` caveat and the "owned here" wording are now correct.
  - The bullet still names no roadmap that plans the theorem. On main, this roadmap plans it under "Late compact-center application in LieGroups". After this pull request merges, no roadmap does.
  - The new text also rules out the LieGroups Layer 7 placement that the previous review proposed. The proof needs `Y = (2π)⁻¹ ker(exp)` from ConvexityToric T1, and ConvexityToric consumes LieGroups, so LieGroups cannot consume it.
- **Witness:**
  - On main, this roadmap plans the theorem at `README.md:1726–1747`.
  - On main, `LieGroups/README.md:750` defers "integral lattice/isogeny refinements" to ConvexityToric T1, and `:1454` lists ConvexityToric T1 among consumers, "none of them supplies it".
  - `roadmaps grep 'P∨ */ *Y'` finds the theorem only on main and in #1220.
- **Repair:**
  - Give the theorem an owner that comes after ConvexityToric, and cite it here by roadmap and section. Two placements respect the direction of supply:
    - ConvexityToric T1. It already builds `Λ_Z = (2π)⁻¹ker(exp)` and proves `exp_G(2πα∨) = 1`. It consumes LieGroups, and could consume §§10.1 and 10.3 here. That revision must be ordered against #1651, which also changes ConvexityToric.
    - A Part II of this roadmap (LieHighestWeightPartII is in the merge order) that consumes LieGroups Layers 4 and 6 and ConvexityToric T1.
  - State the theorem there with the hypotheses of main: `G` compact, connected and semisimple; `Z(G) ≃ P∨/Y`, equivariantly for `Γ_Y`; `Y = Q∨` when `G` is simply connected. Use this bullet's locators, and give the equivariance its own proof sketch.
  - Checked on four groups:
    - `SU(2)`: `exp(πα∨) = −I`, so `Y = Q∨`, and `P∨/Y = ℤ/2 = {±I}`.
    - `SO(3)`: `Y = P∨`, and the centre is trivial.
    - `SO(4) = (SU(2)×SU(2))/⟨(−I,−I)⟩`: `(ℤ/2)²/ℤ/2 = {±I}`.
    - `SU(3)`: `ℤ/3`.

## R02 (P3) — The order against the open revision #1220 is still unstated

This is R03 of the previous review, not repaired. No repair report marks it "not actionable".

- **Location:** the pull request description, and this folder's `README.md` and `Suggested.lean`.
- **Witness:**
  - The overlap listing reports "#1220 and #1797 conflict in `README.md`, `Suggested.lean`".
  - The description still says that `TypeAHaarTargets.lean` became "Suggested.lean section TypeAHaar (27 statements)", and that there are "No statement changes".
  - At this head, `Suggested.lean` has no `TypeAHaar` section and 10 theorems.
- **Repair:**
  - Say in the description which pull request rebases on the other.
  - Rewrite the description's LieHighestWeight paragraph to match the branch: `TypeAHaarTargets.lean` is deleted, `Suggested.lean` states 10 headline theorems, and the README is restructured.

## R03 (P3) — The new ConvexityToric link uses a heading anchor that the open revision #1651 renames

- **Location:** `README.md:89`: "[ConvexityToric T1](../../SymplecticGeometry/ConvexityToric/README.md#t1-compact-symplectic-actions-and-local-models)".
- **Claim:**
  - The citation is correct on main: the heading is `## T1. Compact symplectic actions and local models` (line 32), and T1 builds `Λ_Z` and `2πα∨ ∈ ker(exp)`.
  - #1651 renames that heading to `## Layer 1: …`, so the fragment stops resolving when #1651 merges.
  - The label "T1" survives. #1651's README says "The labels T1–T5 denote these same five layers", and its §1.1 keeps the lattice and the coroot period.
- **Witness:** the overlap listing reports that #1651 "no longer defines" this fragment. At #1651's head (f049e2f), README line 136 is `## Layer 1: Compact symplectic actions and local models`.
- **Repair:** keep the label "ConvexityToric T1" and link to `../../SymplecticGeometry/ConvexityToric/README.md` without the fragment. The link then holds before and after #1651, and it creates no dependency on #1651.

## R04 (P3) — §7.5: the new chain sentence runs in the wrong direction, and its locator stops before the cited phrase

- **Location:** `README.md:1056–1061`: "Every positive root `β` is reached from a simple root by a chain of simple reflections, each lowering the height … (Theorem 24.2(iii)–(iv), pp. 123–124, lines 4880–4897, where (iv) uses such a chain)".
- **Claim:**
  - Read from the simple root to `β`, every step raises the height. The steps lower the height only when the chain is read from `β` down.
  - The contract entry at `README.md:253–256` states the direction correctly.
  - The phrase that (iv) uses, "a composition of simple reflections", sits after the cited range.
- **Witness:**
  - `G₂` (`α₁` short): `α₂` (height 1) goes by `s₁` to `3α₁+α₂` (height 4), then by `s₂` to `θ = 3α₁+2α₂` (height 5).
  - EtingofLieGroupsLieAlgebras: line 4897 is the printed page number `123`, and the phrase is at line 4899 (p. 124).
- **Repair:** write "Every positive root `β` is carried to a simple root by a chain of simple reflections, each lowering the height", and cite "lines 4880–4899".

## Previous findings

- R01 — partly repaired: "the coweight lattice `P∨ ⊇ Q∨` with `[P∨ : Q∨] = |det A|` is consumed in §10.1 from Tau Ceti … Corollary 43.5(iii) … the `Γ_Y`-equivariance is not in that source". The theorem still has no owner; this is R01 above.
- R02 — repaired: "Every positive root `β` is reached from a simple root by a chain of simple reflections … (Mathlib `RootPairing.Base.IsPos.induction_on_reflect`)". The contract entry, §7.5's *Needs* and Layer 7's Dependencies all name it. The wording is R04 above.
- R03 — not repaired: the description is unchanged. It names no order against #1220 and still describes a `TypeAHaar` section of 27 statements. This is R02 above.

## Verified sound

### Gate, build and form

- **Worker's gate:** every check 0, build OK.
- **My rerun of the gate command:**
  - Every check is 0 except `outside-folder=23`.
  - The 23 files are 9 in AlgebraicTopology, 2 in GeometricTopology, 3 in QuadraticFormInvariants and 9 in ReductiveGroups. The brief names all four folders as this pull request's own.
  - The brief's `git diff --stat` with its exclusions is empty.
  - In this folder, the branch changes `README.md` and `Suggested.lean`, and deletes `TypeAHaarTargets.lean`. The folder now holds only `README.md` and `Suggested.lean`.
- **Dependency check:** `depcheck: 235 roadmaps, 2270 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean Suggested.lean` exits 0 with 0 errors and 10 warnings, all `declaration uses sorry` (lines 77, 95, 103, 112, 118, 124, 129, 134, 146 and 163).
- **Signatures:**
  - One scratch file, importing the built module, holds `#check @` for `serreLift_injective_of_base` and for the 6 pinned declarations that the changed text relies on. All but one elaborate.
  - The exception is `RootPairing.Base.relIndex_corootSpan_coweightLattice`: its module is not built, so it was read at `CoweightLattice/Basis.lean:144` inside `namespace RootPairing.Base` (line 59).
  - `Suggested.lean` has no `variable` block, so no binder is lost.
  - `signatures.md` lists 11 entries. The extra one, "`,` at line 28", is the word "theorem," in the module docstring, not a declaration.
- **Padding:** no statement changed, so the earlier one-tactic probe (none closes) stands.

### Changed passages and pinned declarations opened (9)

- **`RootPairing.Base.IsPos.induction_on_reflect`** (Mathlib `LinearAlgebra/RootSystem/Base.lean:782`):
  - The elaborated hypotheses are `[CharZero R] [Finite ι] [IsDomain R] [P.IsCrystallographic] [P.IsReduced]`, with the step `p i → j ∈ b.support → p (P.reflectionPerm j i)` for every `i`.
  - The proof is strong induction on `|height|`.
  - This matches the contract entry at `README.md:253–256` word for word in substance.
  - The `rootSystem H` of §7.5 meets these hypotheses: it is crystallographic and reduced (contract at `README.md:247`) over a field of characteristic zero.
- **`RootPairing.Base.induction_reflect`** (`:808`): the all-roots variant, with negation as `h₀`. It is an equivalent route to the negated chain.
- **`TauCeti.finrank_eigenspace_toEnd_neg`:** `[CharZero K] [FiniteDimensional K M]` and an `IsSl2Triple`, as the contract says.
- **Removed name:** `TauCeti.exists_mem_support_weylGroupToPerm_eq` and `Weyl/Orbit/Basic.lean` no longer appear anywhere in the README. `RootPairing.weylGroup` is still used (Conventions, line 209).
- **Coweight lattice:** `RootPairing.coweightLattice` (`CoweightLattice.lean:303`) and `relIndex_corootSpan_coweightLattice` (`CoweightLattice/Basis.lean:144`, giving `[P∨ : Q∨] = |det C|`). §10.1 (`README.md:1501–1504`) consumes both.
- **`Γ_Y`:** owned in §10.3 (`README.md:1570–1571`).
- **ConvexityToric on main:**
  - Line 32 is the T1 heading.
  - Lines 41–48 build `Λ_Z = (2π)⁻¹ker(exp)` and prove `2πα∨ ∈ ker(exp)` and `exp_G(2πα∨) = 1`.
  - Line 34 consumes LieGroups Layer 6. LieGroups consumes this roadmap (main `LieGroups/README.md:750`).
  - So the cycle claim holds: LieHighestWeight → LieGroups → ConvexityToric.
- **Relative link:** `../../SymplecticGeometry/ConvexityToric/README.md` resolves both on main and in this worktree.

### Seeded sample

- **§7.5 Serre's presentation** (changed) was checked against EtingofLieGroupsLieAlgebras:
  - Theorem 24.2 is at line 4818 (p. 122), and the reduction to irreducible systems at line 4827.
  - (ii) is at lines 4874–4879 (p. 123), and (iii) at 4880–4894.
  - (iv) is at 4895–4899 and uses "a composition of simple reflections" (pp. 123–124; see R04 for the end line).
- **The new Scope locators:**
  - Theorem 43.4 is at line 8891, printed p. 216, and gives `π₁` of the compact adjoint group as `P∨/Q∨`.
  - Corollary 43.5(i) is at line 8914, printed p. 217.
  - Corollary 43.5(iii) is at lines 8919–8924, p. 217: the semisimple case, with centres `P∨ᵢ/Q∨ᵢ`.
  - Lines 8914–8927 contain no automorphism equivariance, as the bullet now says.
- **The other 14 sampled targets** are untouched. Their locators were opened in earlier reports and stand.

### Adversarial table

The rows for changed statements are computed this round. The rows for untouched statements are carried from the review at 7db2eb6, with the values computed there.

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| Scope: `Z(G) ≃ P∨/Y` (changed) | `SU(2)`, `SO(3)`, `SU(3)`, `PSU(3)`, `SO(4)` | `ℤ/2 = {±I}`; `1`; `ℤ/3`; `1`; `(ℤ/2)²/ℤ/2 = {±I}` (Cor. 43.5(iii)) | true; no owner (R01) |
| Scope: `Q∨ ⊆ Y` from `2πα∨ ∈ ker exp` (changed) | `SU(2)`, `SO(3)` | `exp(2π·diag(i,−i)) = I` and `exp(π·diag(i,−i)) = −I`, so `Y = ℤα∨ = Q∨`; in `SO(3)`, `−I ↦ I`, so `α∨/2 = ϖ∨ ∈ Y` and `Y = P∨` | holds |
| Scope: `[P∨ : Q∨] = |det A|` from Tau Ceti (changed) | `A₁`, `A₂`, `B₂`, `G₂` | `2`; `3`; `4−2 = 2`; `4−3 = 1`; native `Basis.lean:144` | holds |
| Scope: cycle claim (changed) | edges on main | LieGroups ← LieHighestWeight (line 750); ConvexityToric T1 ← LieGroups Layer 6 (CT line 34, LG line 1454); adding LieHighestWeight ← ConvexityToric closes the loop | holds |
| §7.5 Mathlib induction hypotheses (changed) | `rootSystem H` of a Killing `L` | needs `Finite`, `CharZero`, `IsDomain`, `IsCrystallographic`, `IsReduced`: all hold; the step is for every root `i`, as the README says | holds |
| §7.5 chains (changed) | `G₂` `θ`; `B₂` (`A = [[2,−2],[−1,2]]`); `A₂`; rank 0, 1 | `G₂`: `⟨θ,α₂∨⟩ = −3+4 = 1` gives `3α₁+α₂`; `⟨·,α₁∨⟩ = 6−3 = 3` gives `α₂` (heights 5, 4, 1). `B₂`: `⟨α₁+2α₂,α₂∨⟩ = −2+4 = 2` gives `α₁`; `⟨α₁+α₂,α₁∨⟩ = 2−1 = 1` gives `α₂`. `A₂`: `α₁+α₂` goes by `s₁` to `α₂`. Rank 0: no positive roots; rank 1: chain of length 0 | holds; direction wording (R04) |
| §7.5 negated chain (changed) | `G₂` `−θ`; `sl₃` `−α₁` | `−θ` goes by `s₂` to `−(3α₁+α₂)`, then by `s₁` to `−α₂`. `s₂(−α₁) = −α₁−α₂`, and both pieces have dimension `1 = 1`. The predicate `dim g̃_β ≤ 1` is stable under `sⱼ` for every `β` | holds |
| §7.5 graded-piece reflections (carried) | `G₂` `4α₁+2α₂`; `B₂`; `A₁×A₁` | goes to `2α₁+2α₂`, then to `2α₁`, a zero piece; `10 = dim so₅`; `6 = 6` | holds |
| §7.5 `sl₂` symmetry input (carried) | `V(1)`, `V(2)`, `sl₃` under `h₁` | `1 = 1`; `1 = 1`; `±1`: `2 = 2`; `±2`: `1 = 1` | holds |
| §3.2 kernel coefficients (carried) | `t`, `j(x)`, `u tⁿ` | in the kernel; not in the kernel, with image `x`; in the kernel for `u ∈ F_{n−1}` | holds |
| §6.2 dominant finiteness (carried) | `sl₂`: `2ϖ`, `3ϖ`, `−ϖ`; `A₂`: `θ` | `{2ϖ,0}`; `{3ϖ,ϖ}`; `∅`; `{θ,0}` | holds |
| §9.1 reductive criterion (carried) | `gl₂`; `sl₂ ⋉ K²`; Heisenberg; `K` | reductive; radical `K² ≠ 0`; derived `Kz` not semisimple; reductive | holds |
| §0.2 Clebsch–Gordan (carried) | `V(1)⊗V(1)`, `V(2)⊗V(1)` | `4 = 3+1`; `6 = 4+2` | holds |
| §1.1, §1.2 (carried) | `sl₃`; `A₁`, `A₂`, `G₂`, `B₂` | `8 = 2+6`; `(ϖ/2)(α∨) = 1/2`; `det = 3, 1, 2` | holds |
| §2.1, §2.2 (carried) | Jordan block; `sl₃` under `s₁` | generalized `2` vs honest `1`; `1 = 1` | holds |
| §3.1 (carried) | `sl₂` PBW; `[x,y] = y` | `dim F₁ = 4`, `dim F₂ = 10`; `{x,y²} = 2y²` | holds |
| §5.1, §5.2 (carried) | `sl₂` Casimir | `n(n+2)/8`; `3/8`, `1` | holds |
| §6.1, §6.3 (carried) | `sl₂`, `A₂` | `(e^ϖ+e^{−ϖ})(1−e^{−2ϖ}) = e^ϖ−e^{−3ϖ}`; Kostant `2` | holds |
| §7.1, §7.3 (carried) | `sl₂`; Gutt eq. (3) | `HC_dot = t²+2t`, `HC_lin = t²−1`; `x⋆y = xy+(ε/2)[x,y]` | holds |
| `serreLift_injective_of_base` (carried) | `A₁`; `sl₂×sl₂`; `B₂` transpose | `3 = 3`; `6 = 6`; `−e₂` vs `−2e₂` | holds |
| Layer 8 headlines (carried) | char 0; `ℝ` | `14`; `52 = 4+48`; negative definite vs signature `(8,6)`; `78, 133, 248` | holds |
| LR headline (carried) | `N = 2`, `λ = μ = (1)` | `(2)`: 1, `(1,1)`: 1, `4 = 3+1` | holds |
| `existsUnique_…ToPerm_mul`, §10.3 (carried) | `A₂`; `B₂`; `D₄`; `E₆` | `π(ω) = (0 1 2)`, `τ = (1 2)`; `2`; `24 = 4·6`; `6 = 3·2` | holds |

### Citations, overlaps and ownership

- **Citations from `roadmaps resolve`:** its six "found nowhere" leads are source keys used as locators, not roadmaps. No Lean name is unresolved.
- **Overlaps:**
  - #1220 conflicts with this pull request: R02.
  - #1651 renames the ConvexityToric T1 heading: R03. It maps the label T1 to its Layer 1, so the citation is not lost.
  - No id is defined only by an open revision, and this pull request drops no id that another roadmap cites.
- **Ownership:**
  - The changed passages own no new object. They consume a Mathlib declaration and cite ConvexityToric T1 as the place where an input of an unplanned theorem lives.
  - `roadmaps grep` over main and the open heads, the LieGroupsPartII design and the LieHighestWeightPartII package found no owner of `Z(G) ≃ P∨/Y` other than main and #1220 (R01).

## Not verifiable

- HumphreysIntroLieAlgebras §18.3, cited in §7.5: the manifest records the source as uncertified (paywalled), so it is cited by locator and was not read.

## Source issues

- **Misprint** in EtingofLieGroupsLieAlgebras at the proof of Theorem 24.2(iii), printed p. 123: the source says the case with only one index `i` having `kᵢ ≥ 0` is clear; it should be the case with only one index having `kᵢ > 0`, since every `kᵢ ≥ 0` there; affects nothing.
