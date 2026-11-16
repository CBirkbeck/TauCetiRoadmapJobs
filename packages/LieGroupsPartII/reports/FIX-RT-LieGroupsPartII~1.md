# FIX-RT-LieGroupsPartII~1: repair of red-team round 1 (passes a and b)

Five findings, from two reviews: four applied, one not actionable in this package. Only `packages/LieGroupsPartII/README.md` and `packages/LieGroupsPartII/sources.toml` changed. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged. No section, layer or Lean name was renumbered, renamed or dropped.

## RT-LieGroupsPartII~1a/F01 (P3) — applied

Witness confirmed. `G` = rotations with rational entries (for instance `((3/5, −4/5), (4/5, 3/5))`) is an infinite subgroup of `SO(2)`, so it is dense and not closed. With `𝔞 = 0`, `M = N_K(𝔞) = G` is not compact, and `W_G` exists only for the datum of §7.1.

Change (§7.3, API): "`M` compact, normal in compact `N_K(𝔞)`; quotient faithful, is `W_G`" → subgroups, normality and faithfulness for every `G` and `𝔞`; compactness for closed `G`; quotient `= W_G` for a self-adjoint linear `G` with `IsMaximalAbelianSymmetric G 𝔞`. I added the rational-rotation group as a Check under "The group `M`".

Pattern: two more §7.3 API bullets were missing the same standing hypotheses. Both are fixed, and each has a new negative-control Check:
- **Minimal parabolic contains the centre.** This now assumes `IsMaximalAbelianSymmetric G 𝔞` and `IsRegularElement G 𝔞 H₀`. Without maximality it fails: in `GL_2(ℝ)` with `𝔞 = 0`, `H₀ = 0` (which is regular), the set is `O(2)` and misses `2·1`.
- **The component condition does not depend on `𝔞`.** This now reads "for a self-adjoint linear group, the same truth value for every `𝔞` with `IsMaximalAbelianSymmetric G 𝔞`". Without maximality it fails: in `O(1,1)` the subspace `𝔞 = 0` has `M = K`, which meets all four components, while for the maximal `ℝY` the condition fails.

The other API bullets of §§7.1–7.4 already carry their hypotheses. No Lean declaration changes.

## RT-LieGroupsPartII~1b/F01 (P2) — applied

Witness confirmed.
- In LieGroups (main), `TauCetiRoadmap/RepresentationTheory/LieGroups/Suggested.lean:583`, the coverage is only the `IwasawaData` field `chamber_normalizer_cover`. No theorem states it for a `CartanInvolution`.
- RealSemisimpleLieGroups (open head), Scope and ownership, lists "the carrying of `𝔞` into the closed chamber" among the facts about "a group carrying LieGroups Layer 9's `IwasawaData`". Its §2.3 consumes the coverage in that setting.

Under that reading, §2.3 proved the field from itself.

Change: §2.3's last field, "by LieGroups Layer 9's chamber coverage" → a proof by `N_{K⁰}(𝔞)`. `H` lies in the closed chamber of the positive system of a regular `H + εH₁`; `W(Σ)` carries that system to `Σ⁺` (RealSemisimpleLieGroups §1.2); and each `s_β` is realized in `N_{K⁰}(𝔞)` by §2.4's first statement, which does not use §2.3.

Related edits:
- §2.3 *Needs:* adds §2.2 step 1 and the first statement of §2.4, and drops the Layer 9 coverage.
- §2.4 now says its first statement needs only §1.1, LieGroups Layers 1 and 4 and `map_lieExp`.
- The Layer 9 supplier contract no longer claims that no `IwasawaData` is presupposed. It says the root-space decomposition, the reflection representatives and the coverage are consumed only for §2.3's `IwasawaData`, and how §2.3 avoids them.
- Scope: the owned list adds the `K⁰` representatives and the `N_{K⁰}(𝔞)` coverage. The "Stated by LieGroups" deferral says how this variant differs (identity component, needed to construct the datum).

Checks:
- The `GL_2(ℝ)` Check used a swap, which is not in `K⁰`. It now uses the rotation `((0, 1), (−1, 0)) = lieExp((π/2)(E₁₂ − E₂₁)) ∈ SO(2)`, which carries `diag(0, 1)` to `diag(1, 0)`.
- New `O(1,1)` Check: `k = 1` covers, although `W_G ≠ W(Σ)`.

Pattern: the root-space decomposition, which RealSemisimpleLieGroups reads the same way, now comes from §2.2 step 1 (Mathlib `LinearMap.IsSymmetric.directSum_isInternal_of_pairwise_commute`). §2.4's use of the Layer 9 reflection representatives comes after §2.3 has built the datum. That use is consistent and unchanged.

Ownership: `roadmaps grep` finds `chamber_normalizer_cover` only as LieGroups' field. RealSemisimpleLieGroups §§2.3–2.4 consume the coverage for a group that already has an `IwasawaData`, or state it on `Int(𝔤₀)` for a semisimple Lie algebra. No roadmap proves it for a bare datum with an Iwasawa triple, so this roadmap owns that input form.

## RT-LieGroupsPartII~1b/F02 (P3) — not actionable in this package: the placement of LieGroupsPartII in the merge order is a decision outside this package

The claim holds as stated:
- RealSemisimpleLieGroups is not in `merge-order/ORDER.txt`.
- At its open head, its §2.3 and §3.1 cite AutomorphicFormsOnReductiveGroups §2.3a in their *Needs:*. AutomorphicFormsOnReductiveGroups is on line 63 of `ORDER.txt`, after LieGroupsPartII on line 62.

No README statement needs changing:
- This README cites AutomorphicFormsOnReductiveGroups only in ownership statements (Scope, §§3.2–3.3, Downstream consumers), never in a *Needs:* line.
- `roadmaps grep LieGroupsPartII` finds no roadmap on main or at an open head that cites this one, so there is no cycle.

The fix is a merge-order placement: LieGroupsPartII goes after RealSemisimpleLieGroups once that roadmap enters the order after AutomorphicFormsOnReductiveGroups, and the pull request names RealSemisimpleLieGroups in its merge-order paragraph. That is the worker's job. This job may not edit the merge-order file or pull-request text.

The optional shortcut for §8.1 (axiom (v) instead of RealSemisimpleLieGroups §2.3) was not applied. It is mathematically sound: `𝐇(ℂ)` is connected and `Ad(𝐇(ℂ)) = Int(𝔤_ℂ)`. But RealSemisimpleLieGroups stays a supplier through §§2.4, 2.5, 3.5, 4.2, 6.2, 6.3 and 7.3, including its §3.1, which itself needs AutomorphicFormsOnReductiveGroups. So the shortcut changes neither the order nor the chain, and the existing route is valid.

## RT-LieGroupsPartII~1b/F03 (P3) — applied

Witness confirmed. §2.5 step 1 uses `Int(𝔰_ℂ)`, the fact that it is the identity component of `Aut(𝔰_ℂ)`, and its adjoint `CartanInvolution` datum for `τ`. RealSemisimpleLieGroups §0.2 (open head, second paragraph) defines and proves exactly these, but §2.5's *Needs:* omitted it.

Changes:
- §2.5 *Needs:* "RealSemisimpleLieGroups §§1.2, 2.3" → "§§0.2 (`Int(𝔰_ℂ)` … adjoint datum for `τ`), 1.2, 2.3".
- Supplier contract §0.2: "Consumed in §§1.2 and 6.3" → "§§1.2, 2.5 and 6.3".
- Layer 2 Dependencies: "§§1.2, 2.3" → "§§0.2, 1.2, 2.3".

Pattern: the other uses of `Int(·)` (§§1.2, 2.2, 6.3) already cite §0.2 or are comparisons.

## RT-LieGroupsPartII~1b/F04 (P3) — applied

Witness confirmed. `TauCeti.stabilizer_eq_closure_wallReflections` (`TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean:201`) has the hypothesis `x ∈ dominantChamber P b` and describes one point's stabilizer. The pointwise stabilizer of a subspace needs an argument, and §3.1 step 2 uses that subspace form.

Change (§2.1):
- **Argument.** Pick `x ∈ 𝔰` off the kernels of the roots that do not vanish on `𝔰`. Move `x` into the chamber by `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`. Conjugate the wall reflections, `w⁻¹s_αw = s_{α∘w}`. Conclude that `Stab(x)` equals the pointwise stabilizer of `𝔰`.
- **Locator.** "Bourbaki, Ch. V §3 no. 3" is cited at the claim, recorded in the `bourbaki-lie4-6` locator in `sources.toml` (uncertified, cited by locator), and added to References.

I added a Check for `A₁` with `𝔰 = 𝔞`, where `x = 0` gives the wrong group `W`, and for `A₂` with `𝔰 = ker α₁`. The new Tau Ceti declaration is added to the Tau Ceti contract, the RootSystems record (which lists it: RootSystems README lines 327 and 1522), §2.1 *Needs:* and the Layer 2 Dependencies.

## Checks run

- **Elaboration.** `lake env lean` on `packages/LieGroupsPartII/Suggested.lean`, run from the content checkout: 13 warnings "declaration uses `sorry`" (lines 65, 174, 200, 221, 238, 255, 269, 284, 308, 325, 341, 357, 377), one per theorem, and no errors. The file is unchanged.
- **Signatures.** A scratch copy of `Suggested.lean` with `#check @…` for all 26 declarations elaborated with no errors. Every type agrees with the worker's `signatures.md` and its README statement. The only section variable is `{n : ℕ}`, and no binder is lost. Nothing changed.
- **Newly cited pinned declarations.**
  - `#check @TauCeti.existsUnique_mem_orbit_inter_dominantChamber` gives `[LinearOrder R] [IsStrictOrderedRing R] [Finite ι] [P.IsCrystallographic] [P.IsReduced] [P.flip.IsReduced] [P.IsRootSystem] (x : M) : ∃! y, y ∈ orbit ∩ dominantChamber`.
  - `#check @TauCeti.stabilizer_eq_closure_wallReflections` gives the same hypotheses without `IsRootSystem`, plus `x ∈ dominantChamber`.
  - The README states these hypotheses.
- **Dependency check output:**

      depcheck: 234 roadmaps, 2231 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve` on the edited README:** no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures:** none were listed for this job.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| §2.1, pointwise stabilizer of `𝔰` = `Stab(x)` for generic `x ∈ 𝔰` | `A₁`, `𝔰 = 𝔞`; `A₂`, `𝔰 = ker α₁`; `𝔰 = 0`; `GL_2`, `𝔰 = ℝ·1` | `A₁`: generic `x ≠ 0`, `Stab = {1}` = pointwise stabilizer `{1}`; `x = 0` would give `W = {1, s}` ≠ `{1}`. `A₂`: `α₂` and `α₁+α₂` agree on `𝔰` and are nonzero, so any `x ≠ 0` works; `Stab(x) = {1, s_{α₁}}` = pointwise. `𝔰 = 0`: `x = 0`, both `W`. `GL_2`: all roots vanish on scalars, `x = 1`, `Stab = S₂` = pointwise (the swap fixes scalars) | holds |
| §2.1, `w⁻¹s_αw = s_{α∘w}` | `A₂`, `w = s₁`, `α = α₂` | `s₁s₂s₁ = s_{α₁+α₂}`, and `α₂∘s₁ = α₁+α₂` | holds |
| §2.3, coverage by `N_{K⁰}(𝔞)` | `GL_2`, `H = diag(0,1)`; `SL_3`, `H = diag(1,−2,1)` (a wall); `H = 0`; `O(1,1)`; `SL_3`, `H = diag(−1,0,1)` | `GL_2`: `Σ'⁺ = {e₂−e₁}`, `k = ((0,1),(−1,0)) ∈ SO(2)`, `Ad(k)H = diag(1,0)`, `h₁ ≥ h₂`. `diag(1,−2,1)`: values `3, −3, 0` on `e₁−e₂, e₂−e₃, e₁−e₃`; with `ε > 0` the system is `{e₁−e₂, e₁−e₃, e₃−e₂}`, `w = (2 3)`, `wH = diag(1,1,−2)`. `H = 0`: any `k`. `O(1,1)`: chamber `= 𝔞`, `k = 1`. `diag(−1,0,1)`: `w = w₀`, `wH = diag(1,0,−1)` | holds |
| §2.3, `wH` in the chamber when `w·Σ'⁺ = Σ⁺` | general | for `γ = w·β ∈ Σ⁺`: `γ(wH) = β(w⁻¹wH) = β(H) ≥ 0` | holds |
| §2.4, first statement is independent of §2.3 | `SL_2`, `X = E₁₂` | `dθX = −E₂₁`; `⁅X, dθX⁆ = −diag(1,−1)`; `B(X, dθX) = tr(−E₁₁) = −1`; `H_β = diag(1,−1)`, so `⁅X, dθX⁆ = −H_β`; `c = −π/2` gives `((0,−1),(1,0))`, acting on `𝔞` by `−1` | holds; the inputs are §1.1, maximality `Z_𝔭(𝔞) = 𝔞`, Layers 1 and 4, and `map_lieExp` |
| §7.3, `M ⊴ N_K(𝔞)` subgroups, faithful quotient (any `G`) | rational rotations, `𝔞 = 0`; `GL_2`, `𝔞 = ℝ·diag(1,−1)` | rational rotations: `M = N_K = G`, quotient trivial, not compact (closure `SO(2)` contains `R_{π/4}`). `GL_2`, line: `M` = diagonal signs, `N_K` = signed permutations (`k·diag(1,−1)·kᵀ = ±diag(1,−1)`), quotient `ℤ/2` acting by `−1`; normality uses `kᵀ𝔞k = 𝔞` (dimension) | holds; compactness needs closed `G`, and `W_G` needs maximal `𝔞` |
| §7.3, `minimalParabolic` contains `Z(G)` | `GL_2`, `𝔞 = 0`, `H₀ = 0`; `GL_2`, diagonal `𝔞`, `H₀ = diag(1,0)` | `IsRegularElement G 0 0` holds; `M = O(2)`, `N = dynamicUnipotent G 0 = {1}`, so `P = O(2) ∌ 2·1`. Diagonal case: `P` upper triangular, contains `ℝ^×·1` | maximality needed; added |
| §7.3, the component condition is independent of maximal `𝔞` | `O(1,1)`, `𝔞 = 0` versus `ℝY`; `GL_2`, diagonal versus `ℝ1 ⊕ ℝS` | `𝔞 = 0`: `M = K = {±1, ±diag(1,−1)}`, one element per component (det `±1`, sign of `g₁₁`), holds; `ℝY`: `M = {±1}`, fails. `GL_2`: `R_{π/4}` carries one onto the other; both `M` meet both components | maximality needed; added |
| §2.5, `Int(𝔰_ℂ)` from RealSemisimpleLieGroups §0.2 | `GL_2(ℝ)` | `𝔰_ℂ = 𝔰𝔩_2(ℂ)`, `Int = PSL_2(ℂ)`, `𝔲 = 𝔰𝔲(2)`, `K_τ = PSU(2)`, connected; centre of `Int` trivial (`ad` injective) | holds |

## For the maintainer

- **Ownership against open pull requests** was checked with `roadmaps grep` (main and the open heads), searching for `chamber_normalizer_cover` and "into the closed chamber". There is no second owner of the coverage of a bare datum with an Iwasawa triple.
- **RealSemisimpleLieGroups merge order (F02).** RealSemisimpleLieGroups is an open new-folder pull request of another author, cited throughout. It is not in `ORDER.txt`. Its §§2.3 and 3.1 need AutomorphicFormsOnReductiveGroups §2.3a (order line 63). So LieGroupsPartII must come after both, and the merge-order paragraph should name RealSemisimpleLieGroups.
- **No ids or names changed.** No id other roadmaps cite changed, and no Lean name changed.
- **No new sources.** No source was fetched, no text was requested (`needs-references.toml` was not created), and no gap was declared (`design/plan.json` is unchanged). `bourbaki-lie4-6` stays uncertified, with its locator extended.
- **No suspicious instructions** were found in the reviews or the sibling texts.
