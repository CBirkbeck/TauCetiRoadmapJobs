# FIX-PKG-LieGroupsPartII~2

Repair of the findings of REV-PKG-LieGroupsPartII (six findings, F01–F06). Files changed: `packages/LieGroupsPartII/README.md`, `packages/LieGroupsPartII/Suggested.lean`, `packages/LieGroupsPartII/sources.toml`. `design/plan.json` is unchanged: no supplier gap is needed.

## F01 (P2) — applied

Verified. RealSemisimpleLieGroups, at the head 9a938c5 of its open pull request, says in §3.1 that AutomorphicFormsOnReductiveGroups §2.3a owns `P = MAN` and is consumed (its README line 807). AutomorphicFormsOnReductiveGroups §2.3a is in the `*Needs:*` of its §§2.3 and 3.1 (lines 673, 839) and in the Dependencies of its Layers 2 and 3 (lines 799, 908). AutomorphicFormsOnReductiveGroups §2.3a (head 4a03177, line 373) states `M`, `A`, `N`, `P = MAN`, the Langlands decomposition, conjugacy and the Borel–Tits comparison for the real points of connected reductive `ℝ`-groups.

Changes:
- **Ownership paragraph.** "Layer 3 owns … contains it as the … case" → AutomorphicFormsOnReductiveGroups §2.3a owns these objects, and RealSemisimpleLieGroups §3.1, built on it, owns them for its class. Layer 3 states the same facts for every reductive Cartan datum; on those two classes its statements are theirs. RealSemisimpleLieGroups §3.1 is consumed only for its definition.
- **§6.3.** "its §3.1 supplies the minimal parabolic datum" → the datum of `Int([𝔤,𝔤])`, with the Killing form, is a reductive Cartan datum; the group is connected, so §2.5 and §3.5 supply it. In `*Needs:*`, "RSSL 3.1" is dropped and "§§2.5, 3.5" added. Layer 6 Dependencies drop RSSL 3.1.
- **Same pattern elsewhere.** Changed in the Summary ("so supplies the minimal parabolic datum on which RealSemisimpleLieGroups builds" → "extends …; makes every triple with the component condition a minimal parabolic datum, to which … apply"), the Scope bullet on `P = MAN`, §3.2 (AutomorphicFormsOnReductiveGroups is now named as owner), §3.3's closing sentence, and the Downstream consumers ("disconnected real points" is now covered by AutomorphicFormsOnReductiveGroups §2.3a).

Lines 113 and 118 (Exact supplier contracts) are now true as written.

## F02 (P2) — applied

New theorem `doubleCoset_cell_coordinates` in `Suggested.lean`, after `bruhat_decomposition_linear`, with the review's signature. For `k ∈ N_K(𝔞)`, every `g ∈ P k P` is `u·k·p` for a unique pair, where `u ∈ dynamicUnipotent G H₀` with `k⁻¹uk ∈ dynamicUnipotent G (−H₀)` and `p ∈ P`. No component condition is assumed.

- The module docstring now names it.
- A matching README §7.3 bullet gives a short existence/uniqueness route.
- A new §7.3 Check covers `SL_2` for `k = w` and `k = 1`, `O(1,1)` and `Aut(𝔰𝔩_3(ℝ))`, with agreement with Tau Ceti.
- A new supplier-contract bullet records Tau Ceti's `GL_n` normal form: `TauCeti.mem_doubleCoset_permutationGL_iff`, `TauCeti.eq_and_eq_of_mul_permutationGL_mul_eq` and `TauCeti.unitriangularInversionGroup`, in `…/UpperUnitriangular/BruhatCell.lean` lines 347, 382 and 100.

## F03 (P3) — applied differently

Verified: borel-tits1965 lines 1488–1497 (Théorème 4.15) describe a parabolic subgroup by an order on the roots of a split torus, with Levi subgroup `Z(S)`. They say nothing about limits or boundedness.

The §6.2 sentence now reads: under the component condition, `Q(X) = Z_G(X)·N(X)` with `N(X) = lieExp(⨁_{β(X)>0} 𝔤^β)`, which is the Lie-group counterpart of 4.15. The boundedness description of `Q(X)` is the Lie-group form of the **limit** description `TauCeti.Cocharacter.parabolic`.

This differs from the suggested wording "the boundedness formulation is that of `TauCeti.Cocharacter.parabolic`". At the pin that declaration is defined by extension over `t = 0`, not by boundedness (`TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean` lines 150–157). The manifest's `cited_for` is unchanged (still 6.2).

## F04 (P3) — applied differently

Added a locator at the claim: "Prove (Knapp 2002, Ch. VI §§4–5 and Ch. VII §§2, 5, 7, for the facts collected):".

- Ch. VII §5 is added because both bullets rest on the component condition of §2.5, which cites Ch. VII §§2, 5.
- The suggested clause "the restriction to `G⁰` uses only §1.1" is omitted because it is false. The second bullet also uses §2.3 (the `IwasawaData` of the restriction) and §2.5 (connected groups satisfy the condition), as §3.5's `*Needs:*` records.

## F05 (P3) — applied

In `sources.toml`:
- The title is now "A general Cayley correspondence and higher rank Teichmüller spaces", matching bradlow-collier-garciaprada-gothen-oliveira2024 lines 6–7.
- `version_note` → "arXiv v2 read; its title agrees with the published one; published as Annals of Math. 200 (2024), no. 3, 803–892".
- "7.3f" is removed from the `cited_for` of brown-rodriguezhertz-wang2022. Neither README §7.3 nor `Suggested.lean` cites that paper; it is cited only in the Conventions and the consumers.

Same pattern: I checked every other entry's `cited_for` against the README's citations (borel-tits1965, bourbaki-lie4-6, warner1972, wallach1988, brown-fisher-hurtado2022, knapp2002) and the titles of the two other certified texts. All agree.

## F06 (P3) — applied

Inserted a blank line before `### 7.2 The dynamic subgroups of a symmetric element`. A scan of every `##`/`###` heading found no other heading without a preceding blank line.

## Checks

- **Elaboration.** `lake env lean packages/LieGroupsPartII/Suggested.lean`, run from the content checkout: exit 0, with 13 `declaration uses sorry` warnings (the 12 earlier theorems and `doubleCoset_cell_coordinates`) and nothing else. Imports are unchanged (`import Mathlib`, `TauCeti.GroupTheory.TitsSystem.Parabolic.Basic`; its object file is present). There is no `set_option` and no sorried data.
- **Signatures.** I put a `#check @name` for all 26 declarations in one scratch copy and elaborated it once (exit 0). The only section variable is `{n : ℕ}`. Every hypothesis of `doubleCoset_cell_coordinates` is an explicit binder, matching the README bullet: self-adjoint `G`, `IsMaximalAbelianSymmetric`, `IsRegularElement`, `k ∈ orthogonalNormalizer G 𝔞`, and no component condition. The 25 earlier types are unchanged from `signatures.md`.
- **Citation resolver.** `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **Tau Ceti names added to the README.** I checked these at the pinned source by file and line, not by `#check`: the object file of `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.BruhatCell` is not built, and `Suggested.lean` does not import it.
- **Dependency check:**

```
depcheck: 243 roadmaps, 2249 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `doubleCoset_cell_coordinates` | `SL_2`, `H₀ = diag(1,−1)`, `k = ((0,−1),(1,0))` | `k·((1,0),(y,1))·k⁻¹ = ((1,−y),(0,1))`, so `kN̄k⁻¹ = N`; `g = ((a,b),(c,d))`, `c ≠ 0`: `u = ((1,a/c),(0,1))`, `k⁻¹u⁻¹g = ((c,d),(0,1/c))`, product back to `g` via `ad − bc = 1` | holds | Check added |
| same | `k = 1` | `N ∩ N̄ = 1`, `u = 1`, `p = g`; without the `N̄` clause, `g = u·(u⁻¹g)` for all `u ∈ N`, so uniqueness fails | holds; the clause is necessary | negative control in Check |
| same | `O(1,1)`, `H₀ = Y` | `exp(−sY)·d·exp(sY) = exp(−2sY)·d` unbounded, so `N = 1`; `PkP = kP`, `x = (1, k⁻¹g)` | holds | Check |
| same | `Aut(𝔰𝔩_3(ℝ))`, `k = σAd(w₀)` | `k` preserves `Σ⁺`, so `{β ∈ Σ⁺ : k⁻¹β < 0} = ∅`, `N_k = 1`, `PkP = kP` of dimension 5 (open cells are `w₀` and `w₀·σAd(w₀)`, dimension 8) | holds without the component condition | Check |
| same | uniqueness in an eigenbasis of `H₀` | `N̄`: entries `g_ij e^{t(λ_i−λ_j)} → δ_ij`, so `g_ij = δ_ij` for `λ_i ≥ λ_j`; `P ⊆ dynamicParabolic G H₀`: `g_ij = 0` for `λ_i < λ_j`; intersection `= {1}` | holds | route in bullet |
| same | `n = 0` | `GL(Fin 0)` trivial; `g = 1 = 1·1·1`, unique | holds | none |
| same | `GL_n(ℝ)`, `k = P_w` | `N_k = U ∩ P_w N̄ P_w⁻¹ = U ∩ P_w B⁻ P_w⁻¹` (diagonal of `P_w⁻¹jP_w` is 1) = `TauCeti.unitriangularInversionGroup ℝ w` | agrees with the pin | contract + Check |
| §6.3 route through §3.5 | `𝔤 = 𝔰𝔩_2(ℝ)` | `Int = PSL_2(ℝ)` connected; Killing `4 tr(XY)`: `−8` on `((0,1),(−1,0))`, `8` on `diag(1,−1)`; `M = image of {±1} = 1`, `P` = image of upper triangular | holds | none |
| same | `O(1,1)` (`[𝔤,𝔤] = 0`) | `Int(0) = 1`, `P = G = 1`, criterion reduces to `𝔮 ⊇ 𝔷`; matches the existing Check | holds | none |
| §6.2 `Q(X) = Z_G(X)·N(X)` (component condition) | `GL_2`, `X = diag(1,0)` | `Z_G` diagonal, `β(X) > 0` only for `e₁−e₂`, product = upper triangular = `Q(X)` | holds | none |
| same | `X = 0` | `Z_G(0) = G`, no positive roots, `N(0) = 1`, `Q(0) = G` | holds | none |
| same | `SL_3`, `X = diag(1,1,−2)` | `β(X) = 3` for `e₁−e₃`, `e₂−e₃`, `0` for `±(e₁−e₂)`; `Z_G·exp(ℝE₁₃ ⊕ ℝE₂₃)` = `(2,1)`-block upper triangular | holds | none |
| same | `O(1,1)`, `X = Y`; `Aut(𝔰𝔩_3)`, `X₀` | `Z_G(Y) = {±exp(tY)} = Q(Y)`; `Z_G(X₀)N = (MA ⊔ σAd(w₀)MA)N = Q(X₀)` | also holds; stated only under the condition | none |
| §3.5 `P ∩ G⁰ = Z_{K⁰}(𝔞)AN` (locator only) | `GL_2`; `O(1,1)` | `Z_{K⁰}(𝔞) = {±1}`, `P ∩ G⁰` = upper triangular with `det > 0`; `O(1,1)`: `A = G⁰` | holds | none |
| Ownership paragraph | classes | `SL_2(ℝ)` in both owners' classes; the double cover of `SL_2(ℝ)` only in RealSemisimpleLieGroups'; positive diagonal ⋊ swap (Zariski closure contains negative diagonal) and tilted `ℝ × S¹` in neither, only here | consistent | none |

## For the maintainer

- **Merge order.**
  - LieGroupsPartII consumes RealSemisimpleLieGroups (§§0.2, 1.2, 2.3, 3.1 as a definition, 3.2–3.3, 4.1–4.4, 5.4), an open new roadmap by another author.
  - RealSemisimpleLieGroups is not in `merge-order/ORDER.txt`, and it consumes AutomorphicFormsOnReductiveGroups §2.3a.
  - `ORDER.txt` lists AutomorphicFormsOnReductiveGroups (line 63) after LieGroupsPartII (line 62).
  - At submission, LieGroupsPartII has to sit after RealSemisimpleLieGroups, hence after AutomorphicFormsOnReductiveGroups. The dependency check cannot see this chain because RealSemisimpleLieGroups is not in the order file.
- **Ownership.** Checked with the `roadmaps` tools against main and the open heads.
  - `P = MAN`: AutomorphicFormsOnReductiveGroups §2.3a owns it for real points of connected reductive `ℝ`-groups, RealSemisimpleLieGroups §3.1 for connected groups with semisimple Lie algebra and finite centre, and this roadmap's Layer 3 is the kept variant for every reductive Cartan datum.
  - Cell coordinates:
    - RealSemisimpleLieGroups §3.3 has them under the component condition.
    - ReductiveGroups Layer 7C (7C.5) has them for split groups over fields; this README already leaves that to ReductiveGroups.
    - Tau Ceti has the `GL_n` permutation-matrix case, now cited.
    - The statement without the component condition is owned here (§§4.2, 7.3).
- **Names.**
  - New Lean name: `doubleCoset_cell_coordinates`, found in no other roadmap.
  - No name was renamed or deleted.
  - No roadmap cites LieGroupsPartII, so no id change affects others.
- **Sources.** No new source was fetched and `needs-references.toml` was not created.
