# FIX-RT-LieGroupsPartII~2: repair of red-team round 2 (passes a and b)

Three findings from two reviews: all three confirmed and repaired, one of them by another route than the reviewer proposed. Only `packages/LieGroupsPartII/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. No section, layer or Lean name was renumbered, renamed or dropped.

## RT-LieGroupsPartII~2a/F01 (P3) — applied differently

Change: "§2.4, first statement" (reflection representatives `lieExp(c(X + dθX)) ∈ K⁰`) → new §2.2 (e) with proof step 5 and two Checks; §2.3 and §3.1 step 2 cite §2.2 (e); §2.4 keeps the comparison. LieGroups Layer 4 is dropped, not added: step 5 uses only `Ad(lieExp) = exp(ad)`.

Why not Layer 4: its `exists_monoidHom_of_lieHom` requires `[SimplyConnectedSpace G]` (LieGroups `Suggested.lean`, the declaration at the start of its Layer 4 block), and `SL_2(ℝ)` is not simply connected, so the old route also needed the universal cover. Step 5: `⁅X, dθX⁆ = −‖X‖²·H'_β ∈ Z_𝔭(𝔞) = 𝔞`; `ad Z` vanishes on `ker β` and squares to `−ω²` on `span(H'_β, X − dθX)`, `ω² = 2‖X‖²β(H'_β)`; `c = π/ω` gives `s_β`. Its inputs (§1.1, LieGroups Layer 1, `map_lieExp`) were already on §2.2's *Needs:* line.

Pattern, every place repaired: Scope "Stated by LieGroups"; LieGroups Layers 0–3 contract (Layer 4 sentence removed) and Layer 9 contract; §2.2 summary sentence; §2.3 coverage bullet and *Needs:*; §2.4 preamble, list, proof sketch, *Needs:*, `SL_2` Check (its `c`-sentences moved to §2.2); §3.1 step 2; Layer 2 Dependencies. A script over all *Needs:* lines found the forward citation §2.3 → §2.4 before and none after.

## RT-LieGroupsPartII~2a/F02 (P3) — applied

Change (§6.2 Checks): "root flow" and the announced `β = e₂ − e₁` with `Y = E₁₂` → "the conjugates `lieExp(−tX)·lieExp(Y)·lieExp(tX)` of Conventions", each `Y` with its root space: `E₂₁ ∈ 𝔤^{e₂−e₁}` gives `I + e^{t}E₂₁`; `E₁₂ ∈ 𝔤^{e₁−e₂}` gives `I + e^{−t}E₁₂`; `Y = 0` gives `I`, so `Y ≠ 0` is needed in both equivalences.

Recomputed: `diag(e^{−t},1)(I+E₂₁)diag(e^t,1)` has lower-left entry `e^t`. "root flow" occurred nowhere else; no other Check names one root and uses a vector of another.

## RT-LieGroupsPartII~2b/F01 (P3) — applied

Change: Mathlib contract "`Matrix.SpecialLinearGroup`, `Matrix.orthogonalGroup`, `Matrix.symplecticGroup` give the matrix groups" → each carrier's type, and Layer 7 takes the subgroups of `GL (Fin n) ℝ` cut out by the same equations. §7.1 Check: `SL_n(ℝ)` = range of `Matrix.SpecialLinearGroup.toGL`; `Sp_{2n}(ℝ)` = `{g : g J' gᵀ = J'}` with `J'` the reindexed `Matrix.J`.

Evidence at the Mathlib pin: `Matrix.symplecticGroup : Submonoid (Matrix (l ⊕ l) (l ⊕ l) R)` (`Mathlib/LinearAlgebra/SymplecticGroup.lean:102`), `Matrix.J` (`:59`), `SymplecticGroup.transpose_mem` (`:164`); `Matrix.SpecialLinearGroup` a subtype (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:70`); `Matrix.SpecialLinearGroup.toGL` and `range_toGL_eq_ker_det`, `Matrix.GeneralLinearGroup.det` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369, 394, 94`); `Matrix.orthogonalGroup` a `Submonoid` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:318`).

## Checks run

- **Elaboration.** `lake env lean packages/LieGroupsPartII/Suggested.lean` (unchanged file): exit 0. It printed 13 warnings "declaration uses `sorry`" (lines 65, 174, 200, 221, 238, 255, 269, 284, 308, 325, 341, 357, 377), one per theorem. There were no errors.
- **Signatures.** I elaborated once a scratch copy with `#check @TauCetiRoadmap.LieGroupsPartII.<name>` appended for all 26 declarations. All 26 types printed. Every definition has only the binder `{n : ℕ}` besides its explicit arguments, and every theorem carries its hypotheses explicitly. The types equal the README statements and the worker's `signatures.md`; nothing changed.
- **Dependency check.** Output: `depcheck: 237 roadmaps, 2235 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` reports "Cross-roadmap citations found nowhere: None", and "Lean names found nowhere: None". The six new Mathlib names were checked by hand at the pin, with the files and lines cited above.
- **Ownership.** `roadmaps grep` was run for the moved statement. RealSemisimpleLieGroups (open head) only consumes LieGroups Layer 9's representatives, which lie in `N_K(𝔞)`. No other roadmap places them in `K⁰`, so ownership is unchanged by the move.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.2 (e) | `SL_2`, `β = e₁−e₂`, `X = E₁₂` | `⁅X,dθX⁆ = −diag(1,−1)`; `‖X‖² = tr E₁₁ = 1`; `H'_β = diag(1,−1)`, `β(H'_β) = 2`; `ω = 2`, `c = −π/2`: `k = ((0,−1),(1,0))`, `Ad(k)diag(1,−1) = −diag(1,−1)` | holds |
| §2.2 (e) | `SL_3`, `X = E₁₃` | `⁅X,dθX⁆ = −diag(1,0,−1) = −H'_β`; `ω = 2`; `k = E₁₃ − E₃₁ + E₂₂ ∈ SO(3)`, `Ad(k)diag(h₁,h₂,h₃) = diag(h₃,h₂,h₁)` | holds; `s_{e₁−e₃}` |
| §2.2 (e) | `GL_2`, centre `ℝ·1` | `1 ∈ ker β`, `Ad(k)1 = 1`; `k = ((0,1),(−1,0))` sends `diag(0,1)` to `diag(1,0)` | holds |
| §2.2 (e) | `X = 0`; `c = −π/4`; `Σ = ∅` (`O(1,1)`, compact `G`) | `k = 1`, trivial action; rotation sends `diag(1,−1)` to `((0,1),(1,0)) ∉ 𝔞`; vacuous | `X ≠ 0` needed (new Check) |
| §2.2 step 5, sign | `B(⁅X,dθX⁆,H) = β(H)B(X,dθX)` | `B(X,dθX) = −1 < 0` in `SL_2` | negative multiple |
| §2.4, `SL_2` Check | `W_G` vs `W(Σ)` | both of order 2 | holds |
| §3.1 step 2 | `GL_3`, `𝔰 = ℝ·diag(1,1,−2)`, `β = e₁−e₂` | `k` = rotation in the (1,2)-plane, in `(K ∩ L)⁰ = SO(2) × 1`, fixes `𝔰` | holds |
| §6.2 Check | `X = diag(1,0)`; `Y = E₂₁`, `E₁₂`, `0` | `e^t`, `e^{−t}`, `0` off-diagonal; `(e₂−e₁)(X) = −1` | holds |
| §7.1 Check | `Sp_2`; `n = 0`; `SL_n` | `gJ'gᵀ = det(g)J'`, so `Sp_2 = SL_2`; trivial group; range of `toGL` = `ker det` | holds |

## Notes for the maintainer

- `design/plan.json` target 2.4 still lists `roadmap:LieGroups Layer 4`. This brief lets me edit only its `gaps`. The README no longer consumes Layer 4, and `gaps` stays `[]`.
- No Lean name, section number or cross-roadmap citation changed. The one new id, §2.2 (e), is a new list item inside an existing section.
- Ownership against open pull requests was checked with the tools above.
