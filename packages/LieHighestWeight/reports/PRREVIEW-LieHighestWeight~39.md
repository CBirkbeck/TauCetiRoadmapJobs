# Review of LieHighestWeight (pull request #1797 at ad05d6a)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

This is an incremental re-review of the 37 lines changed in `README.md` since d8ead3a. `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged.

The change moves the compact centre bullet out of the list "Stated by other roadmaps, not planned here". It now stands as a separate paragraph after the linkage-principle paragraph (`README.md:106–123`). A word diff against the old bullet (`README.md:80–97` at d8ead3a) finds only two edits: the word "either" is added, and the `;` after the ConvexityToric link becomes `.`.

The move takes away the part of R01 about the misleading label. It does not give the theorem an owner. R01 is therefore partly repaired and is written again below. It is the only finding, and it blocks (P2).

## R01 (P2) — The compact centre theorem `Z(G) ≃ P∨/Y` still has no owner

This is R01 of the previous review, partly repaired.

- **Location:** `README.md:106–117`: "The centre theorem for a compact connected semisimple Lie group `G` … is not part of this roadmap either … LieGroups consumes this roadmap and ConvexityToric consumes LieGroups, so a section here consuming them would close a cycle."
- **Claim:**
  - On main, this roadmap plans the theorem (main `README.md:1705–1724` and the subsection "Late compact-center application in LieGroups" at `:1726–1758`). After this pull request merges, no roadmap plans it.
  - The cycle argument is correct for this roadmap. But a cycle is broken by moving ownership to a later roadmap, not by dropping the target.
  - The word "either" puts the theorem alongside the linkage principle, but the two cases differ. Main never planned the linkage principle: main `README.md:1127–1130` calls it "a separate development".
- **Witness:** `roadmaps grep 'P∨ */ *Y'` (main, 451 open heads) matches only this roadmap: main `:1707`/`:1747`, #1220 `:2765`/`:2820`, this paragraph `:107`. LieGroups, ConvexityToric T1, CompactGroups (#1047) and the LieHighestWeightPartII and LieGroupsPartII packages never state it.
- **Repair:**
  - Give the theorem an owner later than both LieGroups and ConvexityToric. Then name that owner here by roadmap and section, and move the paragraph back into the "Stated by other roadmaps" list. Two placements keep the single direction of supply:
    - ConvexityToric T1, which already builds `Λ_Z = (2π)⁻¹ker(exp)` and proves `exp_G(2πα∨) = 1` (main `README.md:40–48`).
    - A section of LieHighestWeight, Part II that consumes LieGroups Layers 4 and 6 and ConvexityToric T1. The LieHighestWeightPartII package is at merge-order line 240.
  - The owner should state the theorem with main's hypotheses: `G` compact, connected and semisimple; `Z(G) ≃ P∨/Y` equivariantly for `Γ_Y`; `Y = Q∨` when `G` is simply connected. It can reuse this paragraph's locators.
  - This pull request changes neither ConvexityToric nor LieHighestWeightPartII. If no owner can be named from within it, the repair report should mark R01 "not actionable in this package" and give that reason. Under the review rules the finding is then settled, and the board parks it for a human. Rewording the paragraph again does neither of these things.
  - The owner's statement checks out on these instances:
    - `SU(2)`: `exp(2π·½α∨) = diag(e^{iπ}, e^{−iπ}) = −I`, so the centre is `ℤ/2`.
    - `SO(3)`: `Y = P∨`, so the centre is `1`.
    - `SU(3)`: `exp(2πϖ₁∨) = diag(e^{4πi/3}, e^{−2πi/3}, e^{−2πi/3}) = ω²I`, and `det A₂ = 3`.
    - `SO(4)`: `(ℤ/2)²` modulo the diagonal gives `{±I}`.

## Previous findings

- R01 — partly repaired: `README.md:106–123` is now a separate paragraph: "is not part of this roadmap either … so a section here consuming them would close a cycle". The misleading label is gone, but no owner is named. This is R01 above.

## Verified sound

### Gate, dependencies, elaboration

- **Worker's gate:** every check is 0 and the build is OK.
- **My rerun of the gate command:**
  - Every scanner is 0 except `outside-folder=2`. Both hits are in `TauCetiRoadmap/GeometricTopology/` (`README.md` and `Suggested.lean`), a folder the brief names as this pull request's own.
  - The brief's `git diff --stat origin/main...HEAD` with its exclusions is empty. The family index files in `RepresentationTheory/` are unchanged.
  - The rerun prints no `build` field, so I elaborated the file myself (next bullet but one).
- **Dependency check:** `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 10 warnings, all `declaration uses sorry` (lines 77, 95, 103, 112, 118, 124, 129, 134, 146 and 163).
- **Carried forward:** `git diff --stat d8ead3a HEAD` touches only `README.md` in this folder. The previous `#check @` signature comparison, the one-tactic padding probe and the headline count (10 summary headlines, 10 theorems) therefore stand.

### The changed passage (`README.md:106–123`)

- **Word diff:** compared with the old bullet, the only edits are "either" and `;` → `.`. No heading changed, so no anchor moved. `roadmaps overlaps` reports no dropped id, and the names list at `:125` onward is untouched.
- **Locators, re-read in EtingofLieGroupsLieAlgebras:**
  - Theorem 43.4 starts at line 8891. The printed page number "216" is at line 8899.
  - Corollary 43.5(i) is at line 8914. The printed "217" is at line 8939.
  - (iii) runs over lines 8919–8924 and covers the semisimple case, with centres `P∨ᵢ/Q∨ᵢ`.
  - The source says nothing about `Γ_Y`, as the paragraph states.
- **Seeded target §10.1, cited by the paragraph:**
  - §21.6 has its heading at line 4313. Lines 4325–4334 define `P∨ = Q*` and the fundamental coweights.
  - Those lines fall on printed p. 109: the page marker is at 4304 and the printed "109" at 4343.
  - The §10.1 locator "§21.6, p. 109, lines 4325–4334" is therefore exact.
- **Pinned Tau Ceti declarations named by the paragraph and by §10.1:**
  - `RootPairing.coweightLattice`: `LinearAlgebra/RootSystem/CoweightLattice.lean:303`.
  - `corootSpan_le_coweightLattice`: same file, line 324.
  - `RootPairing.Base.coweightLatticeBasis`: `CoweightLattice/Basis.lean:113`.
  - `RootPairing.Base.relIndex_corootSpan_coweightLattice`: `CoweightLattice/Basis.lean:144`. It states `relIndex = b.cartanMatrix.det.natAbs` under `[CharZero R]` (line 110) and `[P.IsCrystallographic]`.
- **Internal cross-references:**
  - §10.1 (`:1485–1522`) consumes exactly those two Tau Ceti names, as the paragraph says.
  - §10.3 (`:1570–1572`) defines `Γ_Y ≤ Γ_root` as the subgroup preserving `Y`, so "owned here (§10.3)" holds.
  - Layer 10's Dependencies (`:1600–1603`) list no Lie-group, compact-torus or period input. This is consistent with leaving the centre theorem out.
- **The ConvexityToric T1 attribution:** main `SymplecticGeometry/ConvexityToric/README.md:32` has the T1 heading. Lines 40–48 construct `Λ_Z = (2π)⁻¹ker(exp)` and prove `2πα∨ ∈ ker(exp)`. Lines 34–38 consume LieGroups Layer 6. So the cycle stated in the paragraph is real.
- **LieGroups on main:**
  - Line 565 identifies `π₁(G_ad)` with `Z(U)`.
  - Lines 750–751 build the rank-one maps with `dφ(diag(i,−i)) = α∨`.
  - Line 936 transports the cocharacter lattice.
  - It never states `Z(G) ≃ P∨/Y`.

### Ownership, overlaps, description

- **Ownership:** checked by object.
  - `roadmaps grep` for `P∨ */ *Y` and for "cent(re|er) of (a|the) (compact|simply connected)" over main and 451 open heads.
  - CompactGroups at #1047 (its centre statements at README lines 29, 882–884 and 951 concern the centre/derived splitting only).
  - The board packages LieHighestWeightPartII (README and design), LieGroupsPartII (design) and ConvexityToric.
  - The changed text claims no new object. The only ownership gap is R01.
- **Overlaps:**
  - #1220 conflicts with this pull request. The order "this pull request → #1220" is stated in the description and in the `merge-order` block.
  - No id is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no id that others cite.
- **Description:** the sentence "The README takes the house shape and consumes Tau Ceti's Weyl-group, coweight and Serre-presentation developments" matches the head. The description makes no claim about the centre theorem.
- **Citations:** the six leads in `citations.md` are source keys used as locators, not roadmaps.

### Adversarial table

Rows marked "changed" were computed this round for the moved paragraph. The other rows are carried from the previous review (r38), which carried values computed at 7db2eb6 and ee3a422.

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| `Z(G) ≃ P∨/Y` (changed) | `SU(2)`, `SO(3)`, `SU(3)`, `SO(4)`, trivial group | `exp(π·diag(i,−i)) = −I`: `ℤ/2 = {±I}`; `Y = P∨`: `1 = 1`; `exp(2πϖ₁∨) = ω²I`, `det A₂ = 3`: `ℤ/3 = μ₃I`; `(ℤ/2)²/Δ = ℤ/2 = {±I}`; rank 0, `0/0 = 1` | true; no owner (R01) |
| Semisimple hypothesis (changed) | `U(1)` | no roots, so `P∨ = t` is not a lattice; `t/Y = U(1) = Z`, which is infinite | the hypothesis is what makes the quotient finite |
| `Γ_Y`-equivariance (changed) | `SU(3)`; `SO(4)`; `SO(8)` | `Γ_root = C₂` inverts `ℤ/3`, and conjugation sends `ωI` to `ω²I`; the factor swap fixes the diagonal `Y` and acts trivially on `ℤ/2`; `Y/Q∨` is one of the three nonzero elements of `(ℤ/2)²`, whose stabilizer in `S₃` is `C₂ = Γ_Y ≠ Γ_root` | holds; `Γ_Y`, not `Γ_root`, is needed |
| `Y/Q∨` stabilizer versus centre (changed) | `SU(2)`, `SO(3)` | stabilizer `0`, `ℤ/2`; centre `ℤ/2`, `1` | holds ("orders reversed") |
| `[P∨ : Q∨] = \|det A\|` (changed citation) | `A₁`, `A₂`, `B₂`, `G₂` | `2 = 2`; `3 = 3`; `2 = 2`; `1 = 1`; Basis.lean:144 gives `det.natAbs` | holds |
| Paragraph and §10.1 locators (changed) | EtingofLieGroupsLieAlgebras | Thm 43.4 at line 8891, "216" at 8899; Cor 43.5 at 8914, "217" at 8939; (iii) at 8919–8924; §21.6 at 4313–4334, p. 109 | exact |
| §7.5 chain, positive and negated (r38) | `G₂` `θ`, `B₂`, `A₂`, `A₁` | heights 5, 4, 1; 3, 1; 2, 1; empty chain; negated −5, −4, −1 | holds |
| §7.5 Mathlib hypotheses (r38) | `rootSystem H` | Base.lean:537 `[CharZero R]`; :692 `[Finite ι] [IsDomain R] [P.IsCrystallographic] [P.IsReduced]` | holds |
| §7.5 graded pieces and `sl₂` symmetry (r37) | `G₂` `4α₁+2α₂`; `B₂`; `V(1)`, `V(2)` | goes to `2α₁+2α₂`, then to `2α₁`, a zero piece; `10 = dim so₅`; `1 = 1` | holds |
| `serreLift_injective_of_base` (r37) | `A₁`; `sl₂×sl₂`; `B₂` transpose | `3 = 3`; `6 = 6`; `−e₂` vs `−2e₂` | holds |
| §3.2, §6.2, §9.1, §0.2 (r37) | Rees kernel; dominant set; `gl₂`, Heisenberg; `V(1)⊗V(1)` | `t` in kernel; `{2ϖ, 0}`; reductive / not; `4 = 3+1` | holds |
| §1.1–§2.2, §3.1, §5, §6.1–§6.3, §7.1–§7.3 (r37) | `sl₃`, `A₂`, `G₂`, `sl₂` PBW and Casimir | `8 = 2+6`; `det = 3`; `dim F₂ = 10`; `n(n+2)/8`; Kostant `2`; `t²+2t` vs `t²−1` | holds |
| Layer 8 headlines (r37) | char 0; `ℝ` | `14`; `52 = 4+48`; negative definite; `78, 133, 248` | holds |
| LR headline (r37) | `N = 2`, `λ = μ = (1)` | `(2)`: 1, `(1,1)`: 1; `4 = 3+1` | holds |
| `existsUnique_…ToPerm_mul`, §10.3 (r37) | `A₂`; `B₂`; `D₄`; `E₆` | `π(ω) = (0 1 2)`; `2`; `24 = 4·6`; `6 = 3·2` | holds |

### Remark on untouched text

`README.md:1045` attributes Theorem 24.2 to the source "over `ℂ`". EtingofLieGroupsLieAlgebras §24.1 (line 4766) works over any algebraically closed field of characteristic zero. This is carried from r38 and needs no change.

## Not verifiable

- HumphreysIntroLieAlgebras (§§18.3 and 22.5, cited in Layers 6–7): the manifest records it as uncertified (paywalled), so it is cited by locator and was not read. The change does not touch it.

## Source issues

- none
