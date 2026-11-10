# Review of LieHighestWeight (pull request #1797 at d8ead3a)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

This is an incremental re-review of the 8 lines changed in `README.md` since ee3a422. `Suggested.lean` is unchanged. The change:

- replaces the fragment-bearing ConvexityToric T1 link at line 89;
- rewrites the §7.5 chain sentence at lines 1057–1061, with its locator.

Previous R02 and R03 are repaired, and neither repair introduces a new problem. Previous R01 is not repaired: its text is unchanged and no repair report marks it "not actionable". It is carried below as R01, the one finding of this report, and it blocks (P2).

## R01 (P2) — The compact centre theorem `Z(G) ≃ P∨/Y` still has no owner

This is R01 of the previous review, not repaired.

- **Location:** `README.md:80–97`, under the heading "Stated by other roadmaps, not planned here": "The centre theorem for a compact connected semisimple Lie group `G` … is not part of this roadmap … LieGroups consumes this roadmap and ConvexityToric consumes LieGroups, so a section here consuming them would close a cycle."
- **Claim:**
  - On main, this roadmap plans the theorem.
  - After this pull request merges, no roadmap plans it, so the bullet sits under a heading ("Stated by other roadmaps") that is false for it.
  - The bullet itself explains why neither this roadmap nor LieGroups can take the theorem: it needs LieGroups Layers 4 and 6 and ConvexityToric T1, and ConvexityToric consumes LieGroups.
- **Witness:**
  - On main, this README states the theorem at lines 1707 and 1747.
  - This round, `roadmaps grep 'P∨ */ *Y'` over main and 454 open heads finds only those two lines, #1220 (a revision of this roadmap, `README.md:2765`, `:2820`) and this bullet (`:81`).
  - LieGroups on main identifies `π₁(G_ad)` with `Z(U)` (`README.md:565`) but never states the lattice form.
  - The board packages LieHighestWeightPartII, LieGroupsPartII, LieGroups and ConvexityToric do not state it either.
- **Repair:**
  - Give the theorem an owner later than both LieGroups and ConvexityToric, and name that owner in this bullet by roadmap and section. Two placements keep the single direction of supply:
    - ConvexityToric T1, which on main already constructs `Λ_Z = (2π)⁻¹ker(exp)` and proves `exp_G(2πα∨) = 1` (its `README.md` T1, lines 41–48). That revision must be ordered against #1651, which also changes ConvexityToric.
    - A section of LieHighestWeight, Part II that consumes LieGroups Layers 4 and 6 and ConvexityToric T1. The LieHighestWeightPartII package (merge order line 240, after both) does not plan it yet.
  - State the theorem there with main's hypotheses: `G` compact, connected and semisimple; `Z(G) ≃ P∨/Y`, equivariantly for `Γ_Y`; `Y = Q∨` when `G` is simply connected. Use this bullet's locators.
  - Tested on the instances below:
    - `SU(2)`: `Y = Q∨ = ℤα∨`, `P∨ = ½ℤα∨`, and `exp(2π·½·diag(i, −i)) = −I`, so `Z = {±I} ≅ ℤ/2`.
    - `SO(3)`: `Y = P∨`, so `Z = 1`.
    - `SU(3)`: `[P∨ : Q∨] = det A₂ = 3`, so `Z ≅ ℤ/3`.
    - `SO(4)`: `(ℤ/2)²` modulo the diagonal `ℤ/2` gives `{±I}`.
  - If the owner cannot be named from within this pull request, the repair report should say so with that reason: under the review rules the finding is then settled, and the board parks it for a human.

## Previous findings

- R01 — not repaired: `README.md:80–97` is unchanged except for the link at line 89. It still reads "is not part of this roadmap … so a section here consuming them would close a cycle", and it names no owner. This is R01 above.
- R02 — repaired: line 89 now reads "[ConvexityToric T1](../../SymplecticGeometry/ConvexityToric/README.md);" with no fragment. The link resolves on main and at #1651's head, and the label "T1" holds at both.
- R03 — repaired: lines 1057–1061 now read "Every positive root `β` is carried to a simple root by a chain of simple reflections, each lowering the height … the negated chain carries `−β` to the negative of a simple root … lines 4880–4899".

## Verified sound

### Gate, build and form

- **Worker's gate:** every check 0, build OK.
- **My rerun of the gate command:**
  - Every check is 0 except `outside-folder=2`.
  - Both files are in GeometricTopology (`README.md` and `Suggested.lean`), a folder the brief names as this pull request's own.
  - Neither roadmap cites the other (grep of both READMEs). The brief's `git diff --stat origin/main...HEAD` with its exclusions is empty, and the family index files in `RepresentationTheory/` are unchanged.
- **Dependency check output:** `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean Suggested.lean` exits 0 with 0 errors and 10 warnings, all `declaration uses sorry` (lines 77, 95, 103, 112, 118, 124, 129, 134, 146 and 163).
- **Unchanged since the previous review:**
  - `git diff ee3a422 HEAD` touches only `README.md` in this folder, together with GeometricTopology.
  - `lake-manifest.json` and `lean-toolchain` are unchanged.
  - The previous `#check @` comparison of signatures and the one-tactic padding probe therefore stand: none of the 10 theorems closes in one tactic, and 10 summary headlines match 10 theorems.

### The changed passages

**§7.5 chain sentence (`README.md:1057–1062`).**
- The direction now matches:
  - the source, which maps every root to a simple root (EtingofLieGroupsLieAlgebras line 4899);
  - the contract entry at `README.md:253–256`;
  - the pinned lemma.
- The negated-chain clause is correct, because `sⱼ` is linear.

**§7.5 locator.** EtingofLieGroupsLieAlgebras re-read:
- The page markers for pp. 122, 123 and 124 are at lines 4817, 4855 and 4898.
- Theorem 24.2 is at line 4818, on p. 122.
- (ii) runs over lines 4874–4879, on p. 123.
- (iii) starts at line 4880.
- (iv) starts at line 4895.
- Line 4897 is the printed page number "123".
- The chain phrase ends at line 4899, on p. 124.

"pp. 123–124, lines 4880–4899" is therefore exact. The other §7.5 locators in the seeded sample are line 4818 (p. 122) and line 4827 (the direct-sum reduction), and both are confirmed.

**Pinned Mathlib `RootPairing.Base.IsPos.induction_on_reflect`** (`LinearAlgebra/RootSystem/Base.lean:782`):
- Its context is `[CharZero R]` (line 537) and `[Finite ι] [IsDomain R] [P.IsCrystallographic] [P.IsReduced]` (line 692).
- Its proof picks `j` with positive pairing and passes to `sⱼ i`, whose height is strictly lower.
- This matches the contract entry ("finite reduced crystallographic pairing over a characteristic-zero domain").

**Scope link (`README.md:89`).**
- On main:
  - `SymplecticGeometry/ConvexityToric/README.md` exists.
  - The heading `## T1. Compact symplectic actions and local models` is at line 32.
  - T1 constructs `Λ_Z = (2π)⁻¹ker(exp)` (line 41) and proves `2πα∨ ∈ ker(exp)` (line 43), as the bullet uses.
- At #1651's head (708629f):
  - "The labels T1–T5 denote these same five layers" is at line 133.
  - `## Layer 1: Compact symplectic actions and local models` is at line 137.
  - `Λ_Z` is at line 152, and `exp_G(2πα∨)=1` at line 155.
- The link and its label therefore hold both before and after #1651 merges. `roadmaps overlaps` lists no id dropped by an open pull request.

**Tau Ceti declarations named in the same bullet, re-opened at the pin:**
- `RootPairing.coweightLattice`: `LinearAlgebra/RootSystem/CoweightLattice.lean:303`.
- `corootSpan_le_coweightLattice`: line 324 of the same file.
- `RootPairing.Base.relIndex_corootSpan_coweightLattice`: `CoweightLattice/Basis.lean:144`.

### Ownership, overlaps and citations

- **Ownership:**
  - Checked by object against main, 454 open heads (`roadmaps grep` for `P∨/Y`, `Y/Q∨` and "centre/center of a compact"), and the board packages LieHighestWeightPartII, LieGroupsPartII, LieGroups and ConvexityToric.
  - The changed lines claim no new object. The only gap in ownership is R01.
- **Overlaps:**
  - #1220 conflicts with this pull request; the order "this pull request → #1220" is stated in the description and in the generated block.
  - No id is dropped, and no id is defined only by an open revision.
  - LieHighestWeightPartII cites the anchors `#layer-7-…` and `#layer-9-reductive-lie-algebras-and-gl_n`, and both still match headings at lines 959 and 1379.
- **Citations:** the six leads in `citations.md` are source keys used as locators, not roadmaps.

### Adversarial table

Rows for the changed statements were computed this round. The others are carried from the previous review (r37), whose rows carry values computed at 7db2eb6 (r36).

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| §7.5 chain, positive roots (changed) | `G₂` `θ` (`α₁` short); `B₂` `α₁+2α₂`; `A₂` `θ`; `A₁` | `⟨θ,α₂∨⟩ = −3+4 = 1` gives `3α₁+α₂`, and `⟨3α₁+α₂,α₁∨⟩ = 6−3 = 3` gives `α₂`, heights 5, 4, 1; `⟨α₁+2α₂,α₂∨⟩ = −2+4 = 2` gives `α₁`, heights 3, 1; `⟨α₁+α₂,α₁∨⟩ = 1` gives `α₂`, heights 2, 1; empty chain | holds, and the wording now runs from `β` to the simple root |
| §7.5 negated chain (changed) | `G₂` `−θ`; `A₂` `−θ` | `−θ` goes by `s₂` to `−(3α₁+α₂)`, then by `s₁` to `−α₂`, heights −5, −4, −1; `s₁(−α₁−α₂) = −α₂` | holds |
| §7.5 locator (changed) | EtingofLieGroupsLieAlgebras | (iii) at line 4880, (iv) at 4895, page number "123" at 4897, p. 124 marker at 4898, chain phrase at 4899 | exact |
| Scope link (changed) | main; #1651 at 708629f | T1 heading at line 32, `Λ_Z` at 41, `2πα∨` at 43; "labels T1–T5" at 133, Layer 1 at 137, `exp_G(2πα∨)=1` at 155 | resolves at both |
| Scope: `Z(G) ≃ P∨/Y` (recomputed) | `SU(2)`, `SO(3)`, `SU(3)`, `SO(4)` | `exp(π·diag(i,−i)) = −I`: `ℤ/2`; `Y = P∨`: `1`; `det A₂ = 3`: `ℤ/3`; `(ℤ/2)²/(ℤ/2) = {±I}` | true; no owner (R01) |
| §7.5 Mathlib hypotheses (recomputed) | `rootSystem H` of a Killing `L` | Base.lean:537 `[CharZero R]`; :692 `[Finite ι] [IsDomain R] [P.IsCrystallographic] [P.IsReduced]`; all hold for `rootSystem H` | holds |
| Scope: `Y/Q∨` stabilizer versus centre (r37) | `SU(2)`, `SO(3)` | stabilizer: `0`, `ℤ/2`; centre: `ℤ/2`, `1` | holds |
| Scope: `[P∨ : Q∨] = \|det A\|` (r37) | `A₁`, `A₂`, `B₂`, `G₂` | `2`; `3`; `4−2 = 2`; `4−3 = 1` | holds |
| §7.5 graded-piece reflections (r37) | `G₂` `4α₁+2α₂`; `B₂`; `A₁×A₁` | goes to `2α₁+2α₂`, then to `2α₁`, a zero piece; `10 = dim so₅`; `6 = 6` | holds |
| §7.5 `sl₂` symmetry input (r37) | `V(1)`, `V(2)`, `sl₃` under `h₁` | `1 = 1`; `1 = 1`; `±1`: `2 = 2` | holds |
| `serreLift_injective_of_base` (r37) | `A₁`; `sl₂×sl₂`; `B₂` transpose | `3 = 3`; `6 = 6`; `−e₂` vs `−2e₂` | holds |
| §3.2, §6.2, §9.1, §0.2 (r37) | Rees kernel; dominant sets; `gl₂`, Heisenberg; `V(1)⊗V(1)` | `t` in kernel; `{2ϖ,0}`; reductive / not; `4 = 3+1` | holds |
| §1.1–§2.2, §3.1, §5, §6.1–§6.3, §7.1–§7.3 (r37) | `sl₃`, `A₂`, `G₂`, `sl₂` PBW and Casimir | `8 = 2+6`; `det = 3`; `dim F₂ = 10`; `n(n+2)/8`; Kostant `2`; `t²+2t` vs `t²−1` | holds |
| Layer 8 headlines (r37) | char 0; `ℝ` | `14`; `52 = 4+48`; negative definite; `78, 133, 248` | holds |
| LR headline (r37) | `N = 2`, `λ = μ = (1)` | `(2)`: 1, `(1,1)`: 1; `4 = 3+1` | holds |
| `existsUnique_…ToPerm_mul`, §10.3 (r37) | `A₂`; `B₂`; `D₄`; `E₆` | `π(ω) = (0 1 2)`; `2`; `24 = 4·6`; `6 = 3·2` | holds |

### Remark on untouched text

`README.md:1044` attributes Theorem 24.2 to the source "over `ℂ`". EtingofLieGroupsLieAlgebras §24.1 (line 4766) works over any algebraically closed field of characteristic zero. This is not a finding and needs no change.

## Not verifiable

- HumphreysIntroLieAlgebras §18.3, cited in §7.5: the manifest records it as uncertified (paywalled), so it is cited by locator and was not read.

## Source issues

- **Misprint** in EtingofLieGroupsLieAlgebras at the proof of Theorem 24.2(iii), printed p. 123: the source treats the case of a single index `i` with `kᵢ ≥ 0` as clear; it should read `kᵢ > 0`, since every `kᵢ ≥ 0` there; affects nothing.
