# Review of AdelicAlgebraicGroups (pull request #792 at 2dacc18)

**Verdict:** needs changes

Incremental re-review of the 138 lines changed since `6414f3d`: the diff touches `README.md` only (107 insertions, 31 deletions; `Suggested.lean` and `metadata.toml` are byte-identical to the previous head; nothing outside the folder changed). It adds the target *Archimedean points are a Lie group with finitely many components* to AA.1.2, rewrites *Arithmetic lattices in a real Lie group* in AA.3.4 (the variant for connected `G` is deleted, the lattice-image route is spelled out, the `SO₀(n,1)` Check is restricted to `n ≥ 2` and a negative control is added), gives the Weyl-orbit bullet of AA.1.5 its Borel–Tits locator with a route and three Checks, rewords the change-of-presentation sentence of AA.2.4, and adds [Borel–Tits] and [Witte Morris] to the references. The gate passes, the dependency check reports no upward edge and no cycle, and the Lean file elaborates with exactly 20 `sorry` warnings. All four findings of the previous review are repaired. The repaired AA.3.4 passage introduces two small defects: a pinned Mathlib lemma is cited for a step it does not state, and the newly consumed supplier section (the closed-subgroup theorem) is absent from the supplier contracts.

## R01 (P3) — `MeasureTheory.Subgroup.index_mul_measure` is cited for a step it does not state

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:3466–3468` (“`Γ_𝐇 ∩ 𝐇(ℝ)⁰` has finite index in `Γ_𝐇` because `𝐇(ℝ)⁰` has finite index in `𝐇(ℝ)`, so it is a lattice in `𝐇(ℝ)` (`MeasureTheory.Subgroup.index_mul_measure`)”), repeated in the `*Needs:*` line at `:3482`.

Claim: the pinned lemma gives that a finite-index subgroup of a lattice is a lattice (or that `Γ_𝐇 ∩ 𝐇(ℝ)⁰` has finite index in `Γ_𝐇`).

Witness: at the pin, `Mathlib/MeasureTheory/Group/Measure.lean:285` states `Subgroup.index_mul_measure (H : Subgroup G) [H.FiniteIndex] (hH : MeasurableSet H) (μ) [IsMulLeftInvariant μ] : H.index * μ H = μ univ`: the Haar mass of a finite-index measurable subgroup of the ambient group. No instantiation yields either step: with `G = 𝐇(ℝ)`, `H = 𝐇(ℝ)⁰` both sides are `∞`; with `G = Γ_𝐇` and counting measure it is the trivial count; the covolume of `Γ_𝐇 ∩ 𝐇(ℝ)⁰` is the measure of a fundamental domain, not of a subgroup, and `Mathlib/MeasureTheory/Group/FundamentalDomain.lean` has no finite-index lemma at the pin. (Its correct use in this README is the volume ratio of commensurable compact open subgroups at `:168–169`.) Instance: `𝐇 = PGL₂/ℚ`, `Γ_𝐇 = PGL₂(ℤ)`: `Γ_𝐇 ∩ PSL₂(ℝ) = PSL₂(ℤ)` of index `2`, covolume `π/3` versus `π/6`; nothing in the lemma computes either number.

Repair: replace the parenthesis by the argument that needs no index count: “`(Γ_𝐇 ∩ 𝐇(ℝ)⁰)\𝐇(ℝ)⁰ → Γ_𝐇\𝐇(ℝ)` is injective (two elements of `𝐇(ℝ)⁰` in the same `Γ_𝐇`-coset differ by an element of `Γ_𝐇 ∩ 𝐇(ℝ)⁰`) and open, so a fundamental domain of finite measure for `Γ_𝐇` restricted to `𝐇(ℝ)⁰` is one for `Γ_𝐇 ∩ 𝐇(ℝ)⁰` in the open subgroup `𝐇(ℝ)⁰`”, and drop `MeasureTheory.Subgroup.index_mul_measure` from this target's `*Needs:*` line (it stays in the Mathlib contract at `:396` for its real use). Tested on the instance: `PSL₂(ℤ)\PSL₂(ℝ)` embeds openly into `PGL₂(ℤ)\PGL₂(ℝ)` with image the full quotient of the identity component, measure `π/3` under `dx dy/y²` on `PSL₂(ℝ)`.

## R02 (P3) — the supplier contracts do not list RepresentationTheory/LieGroups, layer 2

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:511–512` (“RepresentationTheory/LieGroups, layer 9 (Cartan and Iwasawa theory)”), against the new `*Needs:*` line at `:1232–1234` (“RepresentationTheory/LieGroups, layer 2 (the closed-subgroup theorem and the automatic smoothness of continuous homomorphisms)”).

Claim: `## Exact supplier contracts` names every supplier section consumed and what is assumed of it.

Witness: `grep -n 'LieGroups, layer'` on the README finds layer 9 in the contracts (`:112`, `:511`) and layer 2 only in the new target (`:1232`); the contract subsection “From other roadmaps” (`:509–525`) lists LieGroups layer 9 alone. The section consumed exists on main: `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:275–298`, “Layer 2: the closed-subgroup (Cartan) theorem”, with the closed-subgroup theorem for finite-dimensional real Lie groups and Cartan's automatic-smoothness corollary, so the citation itself is sound.

Repair: in “From other roadmaps” (`:511`) write “RepresentationTheory/LieGroups, layer 2 (the closed-subgroup theorem for finite-dimensional real Lie groups and the automatic smoothness of continuous homomorphisms, which give `𝐇(ℝ)` its Lie group structure in AA.1.2) and layer 9 (Cartan and Iwasawa theory)”.

## Previous findings

- R01 — repaired: AA.1.2 now owns *Archimedean points are a Lie group with finitely many components* (`README.md:1215–1245`) with Whitney via [Witte Morris], Theorem A4.6, p. 435 and the closed-subgroup theorem from LieGroups layer 2; the connected-`G` variant (Cartan, isogeny inputs) is deleted; the `*Needs:*` line at `:3479–3482` names AA.1.2, AA.2.2, AA.3.4 and the Mathlib lemmas. The repair introduced R01 and R02 of this report.
- R02 — repaired: `README.md:3489–3493` reads “For `n ≥ 2`, `G = SO₀(n,1)` … `SO(f)` is connected semisimple because `n+1 ≥ 3`”, and `:3494–3503` adds the negative control (`G = ℝ`, `Γ = ℤ`; the `n = 1` torus case).
- R03 — repaired: `README.md:1413–1416` reads “([Borel–Tits], Théorème 5.3, p. 96, for `(⋂_α ker α)° = (Z(G) ∩ A)°` and for `W` being generated by the reflections `r_α`; the `W`-invariance step is an owned deduction)”, with the route and three Checks.
- R04 — repaired: `README.md:2087–2095` reads “leaves the left side `L(ψ, s)` unchanged and changes the two factors of the right side inversely … so the identity holds at every presentation”, with the `χ₄` witness.

## Verified sound

**Scope.** `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/AdelicAlgebraicGroups/` is empty; the folder holds `README.md` (5744 lines), `Suggested.lean` (648 lines, identical to `6414f3d`) and `metadata.toml`. The diff since `6414f3d` is confined to the six README passages named above.

**Gate.** My own run on this head:

```text
gate AdelicAlgebraicGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

(the worker's run adds `build=0`). The movable dependency check: `depcheck: 210 roadmaps, 1737 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. The new `*Needs:*` edges go to ReductiveGroups (layer 1), ReductiveGroupsPartII (RG2.0.1) and RepresentationTheory (LieGroups layer 2), all on main.

**Elaboration.** `lake env lean TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean`: exit 0, 20 warnings, all `declaration uses sorry`, nothing else. The file is byte-identical to the head the previous review probed (one-tactic probe: none of the 20 theorems closes; `#check @name` for all 62 declarations: the six dropped-binder leads are genuine non-uses), so those results stand; no Lean statement is touched by this diff.

**Sources read at their locators this round.** [Witte Morris] (arXiv copy, cache `4c0936b5…`; printed page = pdf page − 16): Theorem A4.6 at printed p. 435 (cache line 18075–18076, page header line 18031): every Zariski closed subset of `SL(ℓ, ℝ)` has finitely many connected components; the README's reduction `g ↦ diag(g, det(g)⁻¹)` lands in a Zariski closed subgroup of `SL_{N+1}(ℝ)` (the equations of `𝐇` in the entries and `det⁻¹ = c`, together with `c · det g = 1`), so the theorem applies as stated. [Borel–Tits] (Numdam, cache `ec6674ba…`; printed page = pdf page + 53): Théorème 5.3 at p. 96 (cache lines 1711–1714): the rank of the relative root system equals the semisimple `k`-rank, and the relative Weyl group is generated by the reflections in the root hyperplanes; its proof (lines 1715–1717) shows that the identity component of `⋂_α (ker α)°` is `(𝒵(G) ∩ S)°`, which equals `(⋂_α ker α)°` since both are the largest connected subgroup of `⋂_α ker α`. [Milne] (author page, cache `f637e617…`): Proposition 3.6, pp. 34–35 (cache lines 1531–1546): every arithmetic subgroup of a semisimple real Lie group with a faithful representation is discrete of finite covolume; the proof uses properness of the surjection with compact kernel and the surjection of quotients, which is the route the README writes out. The other locators of the diff ([Milne] §3 pp. 33–35, [Borel] §8 pp. 26–30, [Marzec–Neururer] 5.17) were read in the previous rounds and are unchanged.

**Cross-roadmap citations resolved this round.** ReductiveGroups, layer 1 (main, `README.md:176`, with the embedding theorem at `:206`: every affine group scheme of finite type has a closed immersion into `GL_n`); ReductiveGroupsPartII, RG2.0.1 (main, `README.md:463`) with *affine-point-topology-embedding* (`:492`: the point topology is induced by any finite presentation, closed embedding for finite `I` and T1 `R`) and *affine-point-topology-functoriality* (`:502`: a surjection `B → A` induces a closed embedding of point spaces), which together give the subspace topology of `𝐇(ℝ) ⊂ GL_N(ℝ) ⊂ ℝ^{N²+1}` claimed at `:1220–1221`; RepresentationTheory/LieGroups, layer 2 (main, `README.md:275–298`: the closed-subgroup theorem for finite-dimensional real Lie groups and Cartan's automatic-smoothness corollary, exactly the two facts the target names). Within this roadmap: AA.1.2 *Adelic groups are locally compact* (`:1208`), AA.1.4 restriction of scalars (`:1280–1288`), AA.2.2 *quotient-measure* (`:1804–1817`: right coset space `H\G` for closed `H` with `Δ_G|_H = Δ_H`, which a compact normal `ker p` satisfies, uniqueness of the invariant Radon measure), AA.2.3, AA.3.4 `Reduction.IsSArithmetic` and *S-arithmetic subgroups are lattices* (`:3378–3386`, hypothesis `X*_F(G) = 0`). All resolve. The ReductiveGroups contract (`:479–487`) already lists layer 1; the ReductiveGroupsPartII contract (`:489–498`) lists RG2.0; LieGroups layer 2 is R02.

**Pinned declarations opened.** `Subgroup.index_mul_measure` (`Mathlib/MeasureTheory/Group/Measure.lean:285`): see R01. `MonoidHom.isOpenMap_of_sigmaCompact` (`Mathlib/Topology/Algebra/Group/OpenMapping.lean:114`, section variables at `:29–32`: `[SigmaCompactSpace G]` on the source, `[BaireSpace H] [T2Space H]` on the target): a surjective continuous homomorphism from a σ-compact group to a Baire Hausdorff group is open; `𝐇(ℝ)⁰` is an open, hence closed, subgroup of the σ-compact `𝐇(ℝ)`, so σ-compact, and the Lie group `G⁰` is locally compact Hausdorff, hence Baire; the use at `:3468–3470` is the declared form. `Subgroup.IsArithmetic` (`Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean:102`) as in the previous report.

**Manifest.** `packages/AdelicAlgebraicGroups/sources.toml` records `borel-tits` (Borel and Tits, Groupes réductifs, 1965) and `witte-morris` (Witte Morris, Introduction to Arithmetic Groups, 2015), the two works the diff adds to `## References`; both are in the cache.

**Ownership.** *Archimedean points are a Lie group with finitely many components*: `roadmaps grep -i 'finitely many connected components'` finds the same statement only in ArithmeticLocallySymmetricSpaces (`README.md:583`, `realPoints_lieGroup`), at line 62 of the merge order against this roadmap's line 31; the earlier roadmap owns it, as the previous review's repair required, and the later one's duplication is that roadmap's review's business. No other roadmap on main or at an open head states it. Arithmetic lattices in a real Lie group: owner unchanged from the previous report (FuchsianOrbifolds and TeichmullerGeometry own the Fuchsian specialisation only).

**Adversarial table.** Rows for the changed statements carry values computed this round; the rows for untouched statements are carried from the previous report (r11, which carried r10), whose statements the diff leaves unchanged.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| 1.2 archimedean points, Lie group and components | `𝔾_m`, `𝔾_a`, `μ_2`; `SO(x²−y²)`, `SO(x²+y²)`; `SL₂`, `PGL₂`; `ℤ ≤ ℝ`; `GL₁` under `g ↦ diag(g, g⁻¹)` | `π₀`: `ℝ^×` 2, `ℝ` 1, `{±1}` 2 (dimension 0); `SO(1,1) ≅ ℝ_{>0} × {±1}` 2 versus `SO(2)` 1, both `𝔾_m` over `ℂ`; `SL₂(ℝ)` 1, `PGL₂(ℝ)` 2 with `PSL₂(ℝ) = PGL₂(ℝ)⁰` of index 2; `ℤ` infinitely many components, Zariski closure `𝔸¹`; `{(a, a⁻¹)} ⊂ SL₂(ℝ)` Zariski closed, 2 components | Correct; no change |
| 1.2 smooth structure independent of the embedding | two embeddings of `𝔾_m`: `a ↦ a ∈ GL₁`, `a ↦ diag(a, a⁻¹) ∈ GL₂` | identity `ℝ^× → ℝ^×` continuous both ways, smooth by automatic smoothness, diffeomorphism | Correct; input named (LieGroups layer 2) |
| 1.5 Weyl-orbit product and route | `GL₂`, `diag(2,1)`; `SL₂`, `diag(2,1/2)`; split torus; `PGL₂`, `b = [diag(−1,1)]`; `SL₂`, `⋂ ker α` | `diag(2,1)·diag(1,2) = 2I`; `I`; `W = 1`, product `a`; `s(b) = [diag(1,−1)] = [−diag(−1,1)] = b`, `α(b) = −1 ≠ 1`, `b² = 1`; `{±I}`, identity component `1`, component group of order 2. Also: `N : A → A`, `a ↦ ∏_w w(a)`, is a homomorphism of tori with `α∘N = ∏_{β ∈ Wα} β^{|Stab|} = 1` (the orbit is closed under `β ↦ −β`), so `N(A)` is a connected subgroup of `⋂ ker α`, i.e. `N(A(E)) ⊆ (Z(G) ∩ A)°(E)` with no finite group at all | True as stated (the stated form is weaker than the truth, not wrong); locator now correct; no change |
| 2.4 change of presentation | `χ₄` at `12∞` versus `4∞` | `χ₄(3) = −1`: `L_{12∞} = L_{4∞}(1 + 3^{−s})`; `S_ψ` gains `3` with `(1 − χ₄(Frob_3)3^{−s})^{−1} = (1 + 3^{−s})^{−1}`; product unchanged; left side `L(χ₄, s)` presentation-free | Correct; wording now right; no change |
| 3.4 arithmetic lattice, `PSL₂(ℝ)` Check | `𝐇 = SL₂/ℚ`, `Γ = PSL₂(ℤ)`, `Γ′ = PΓ(2)` | `SL₂(ℝ)` connected; `ker p = {±1}`; covolume `π/3`; `[PSL₂(ℤ) : PΓ(2)] = 6`; Mathlib `IsArithmetic` is `Commensurable 𝒢 𝒮ℒ` | Correct; no change |
| 3.4 `SO₀(n,1)` Check at `n ≥ 2` | `n = 2`, `k = ℚ(√2)`, `f = x² + y² − √2 z²`; `n = 3` | `SO(f)` connected semisimple (dim 3, `n+1 = 3 ≥ 3`); `𝐇(ℝ) = SO(2,1) × SO(3)`, `𝐇(ℝ)⁰ = SO₀(2,1) × SO(3)`, `ker p = SO(3)` compact; `n = 3`: type `A₁ × A₁`, semisimple, definition needs no absolute simplicity | Correct; no change |
| 3.4 negative controls | `G = ℝ`, `Γ = ℤ`; `n = 1`, `k = ℚ(√2)`, `f = x² − √2 y²` | `ℤ = 𝔾_a(ℤ)` satisfies `IsSArithmetic ∅`, lattice in `ℝ`; `dp` kills `[𝔥,𝔥] = 𝔥`, so `p = 1`, no surjection; `SO(f) = R^1_{ℚ(2^{1/4})/ℚ(√2)}𝔾_m`, dim 1, `𝐇` a 2-dimensional torus; unit ranks `2` and `1`, relative norm-one units of rank 1, positive at the real place: infinite cyclic, cocompact in `ℝ_{>0}` | Correct; no change |
| 3.4 `p` open and proper, image discrete | `𝐇 = SL₂`, `p : SL₂(ℝ) → PSL₂(ℝ)`; `Γ_𝐇 = SL₂(ℤ)`, `Γ(2)` | `SL₂(ℝ)` σ-compact, `PSL₂(ℝ)` Baire: open; fibres cosets of `{±1}`: proper; `Γ_𝐇 ∩ ker p = {±1}` versus `{1}` for `Γ(2)` (`−1 ∉ Γ(2)`); image `PSL₂(ℤ)` discrete | Correct; no change |
| 3.4 finite-index step | `𝐇 = PGL₂/ℚ`, `Γ_𝐇 = PGL₂(ℤ)` | `[PGL₂(ℝ) : PSL₂(ℝ)] = 2`, `PGL₂(ℤ) ∩ PSL₂(ℝ) = PSL₂(ℤ)` of index 2; covolumes `π/6` and `π/3`; `index_mul_measure` with `H = PSL₂(ℝ)` gives `2 · ∞ = ∞` | Step true; cited lemma does not give it: R01 |
| 3.4 finite volume through `ker p` | `Γ′ = SL₂(ℤ)`, `G⁰ = PSL₂(ℝ)` | `Γ′\SL₂(ℝ) → PSL₂(ℤ)\PSL₂(ℝ)` bijective (fibre `{±1}` absorbed by `−1 ∈ Γ′`), volumes equal `π/3`; for `Γ(2)`: 2-to-1, `2π/3 → π/3` | Correct; no change |
| 3.4 restriction of scalars and compact factors (r11) | `k = ℚ(√2)`, `𝐇′ = SL₂`; `SO(f)`, `n = 2` | compact ideal of `𝔰𝔩₂ ⊕ 𝔰𝔩₂` is `0`; `ker p = SO(3)` | Correct; no change |
| 3.4 stability under automorphisms and commensurability (r11) | conjugation by `diag(1,−1)`; index-2 overgroup | same kernel; commensurable intersections with `G⁰` | Correct; no change |
| 0.2 *level-measure* (r10) | `S = {i₀}`, `ℤ/4`, `B = 2ℤ/4`, `C = {0}`; `S = ∅` | `1` versus `1/2`; `μ_∅(univ) = 1` | Correct; no change |
| 0.2 `exists_unique_haarProduct` (r10) | masses `1`; `2`; `2, 3`; `ℚ_p`, `B = ℚ_p`; `ι = ∅`; `C_i = ∅` | `1`, `2`, `6`; `∞`; `1`; `0` | Correct; no change |
| 0.3 `exists_unique_convergentHaarProduct` (r10) | `S = ι`, `C₄`; `SL₂` tail; `T ⊋ S`; tail mass `2`; infinite tail | `∏' = 1`, box `2`; `∑ q_v^{−2} < ∞`; `∏_T = ∏_S·∏_{T∖S} a_i`; `(1/2)μ`; excluded | Correct; no change |
| 0.3 change of normalization (r10) | `c = (2, 1/2)`; one factor `2` | `∏ᶠ c = 1`; `2` | Correct; no change |
| 0.4 finite-adele and idele measures (r10) | `2ℤ₂`; uniformizer; `z ↦ 2z`; principal `2`; `1 + 4ℤ₂`; annulus; `vol(𝔸_K/K)` | `1/2`; `q_v⁻¹`; `4`; `1`; `1/2`; `4π`; `|d_K|^{1/2}`; `∏(1 − p⁻¹) = 0` | Correct; no change |
| 1.3 discreteness and squaring (r10) | `ℚ^× ∩ ℤ̂^×`; `SL₂(ℤ)`; `F ∩ Ô`; squaring on `𝔸_ℚ^×` | `{±1}` discrete; not discrete; not discrete; closed, infinite index, not open | Correct; no change |
| 1.3 centre (r10) | `SL₂`, `diag(2,1/2)`; `GL₂`, `[[1,1],[0,1]]` | `{±I}`; not central | Correct; no change |
| 1.4 `Res_{E/F}` and `GL_n` (r10) | `ℚ(i)`, `G_m`; `E = F`; inversion twist; inverse transpose | `𝔸_E^×`; unit; `2 ↦ 1/2`; differs | Correct; no change |
| 2.1 characters, `a_G`, `H_G`, `normOne`, `A_G` (r10) | `GL_n`, `SL_n`, `Res_{ℚ(i)/ℚ}G_m`; ideles; `(2, 1/2)`; scalar `t` | `ℤ`, `0`, ranks `1` vs `2`; `ℤ/2`; `1`, `p⁻¹`, `1`; `H_G(t) = 2 log t` | Correct; no change |
| 2.2 modulus of the Borel of `GL₂` (r10) | `diag(2,1)`, `diag(1,2)`; `diag(3,1)` at `3` | `2`, `1/2`; `1/3` upper, `3` lower | Consistent; no change |
| 2.2 Iwasawa integration `nmk` (r10) | `GL₂`, `m = diag(2,1)` | `δ_P(m) = 2`, density `1/2` | Correct; no change |
| 2.2 quotient measures in stages (r10) | `{1} ≤ C₂ ≤ C₄` | `(2,2) ↦ 4`; `(1,4) ↦ 4`; `(1,4/3) ↦ 4/3` | Correct; no change |
| 2.2 *quotient-measure* Check (r10) | `SL₂(ℝ)`, upper Borel | `Δ_G = 1`, `Δ_B(diag(a,a⁻¹)) = a²`, no invariant measure on `ℙ¹(ℝ)` | Correct; no change |
| 2.4 *artin-local-factors* (r10) | `ℚ(i)/ℚ` at `2`; inert `3` | `(1 − 2^{−s})^{−1}`; `(1 − 3^{−2s})^{−1}` | Correct; no change |
| 2.4 `Ind_{ℚ(√−5)}^ℚ χ` Check (r10) | `2`, `5`, `11`; two lifts at `2` | `(1 + 2^{−s})^{−1}`; `(1 − 5^{−s})^{−1}`; `(1 − 11^{−2s})^{−1}`; `(1 − 2^{−2s})^{−1}` vs `(1 + 2^{−s})^{−2}` | Correct; no change |
| 2.4 holomorphy and nonvanishing at `1` (r10) | gamma factors; `χ = 1`; `χ⁰ = 1` | finite nonzero; excluded; `χ = 1` | Correct; no change |
| 2.4 *convergence-factors* leading coefficient (r10) | `χ ≠ 1`; real representation | pole order `0`; `det(1 − tA) > 0` | Correct; no change |
| 3.1 projection, lift, `H_P`, standard parabolics (r10) | Borel of `GL₂`; `GL₃`; Iwahori | `(a,d) ↦ a + d`; `(a/d)E₁₂`; `4`; `∌ w` | Correct; no change |
| 3.2 reduced forms, horospherical coordinates (r10) | `I_n`, `diag(4,1)`, `diag(1,4)`, `C = 2`; `n = 0`; `k = [[0,−1],[1,0]]` | `diag(4,1)` fails; `C > 1`; `1/2` | Correct; no change |
| 3.3 `IsReduced`, `exists_reduced_GLZ`, Gram map (r10) | `n = 1`; `[[√y, x/√y],[0,1/√y]]`; columns `(1,0),(1,2)` | `±1`; `|x| ≤ u`, `y ≥ t`; `[[1,1],[1,5]]` | Correct; no change |
| 3.4 `finite_volume_iff` (r10) | Borel of `GL₂/ℚ`; `G_m`; `SL₂`; `G_a`; trivial | `∞`; `≅ ℤ`; subsingleton | True; no change |
| 3.4 `exists_fundamentalDomain_normOne_lt_top`, `exists_compact_normOne_iff`, `arithmetic_finite_volume_iff` (r10) | Borel; `diag(t,1)`; tori; `{±1}`; `𝒪_{ℚ(√2)}^×`; definite `D¹` | finite; `[[2,2],[0,1]] ≠ [[2,1],[0,1]]`; compact; infinite; compact | Correct; no change |
| 3.4 `finite_classes` (r10) | `G_m`, `ℤ̂^×`; `G_a`, `ℤ̂`; `U = {1}` | `1`; one class; `hUo` fails | Correct; no change |
| 4.4 `isCoveringMap_levelMap` (r10) | `GL₁`, `U(3) ⊃ U(9)`; `SL₂`; `ℚ(√2)`, `η = 17 + 12√2`; `U′ = U`; `n = 0` | `3`; `27`; `η ≡ 1 + 4√2 (8)`; `1`; trivial | Correct; no change |
| 4.6 `nrd_image`, `compactSpace_ideleClassGroup_quotient_squares` (r10) | `(−1,−1)`, `c = 2, −1`; `(1,1)`, `−3`; `(−1,3)`; `−1` at `3` | `N(1+i) = 2`; no unit of norm `−1`; `−3 = N(diag(−3,1))`; `+1`; compact | Correct; no change |
| 4.7 `tendsto_quadraticKernel_haar`, `isMulLeftInvariant_of_tendsto` (r10) | `ψ = 1`, `χ_n`; `(ℤ/2)²`; constant | `δ_{ψ,1}`; vacuous; not invariant | Correct; no change |
| 5.1 `levelQ`, `posRealsDiag`, `XQ`, `π₀(X_Q)` (r10) | `Q = ∅`; `ℚ`, `Q = {3}`; `ℚ(√2)`, `ℚ(√3)` | `4 = 2²`; index two; `h⁺ = 2` | Correct; no change |
| 5.2 `exists_componentHomeomorph` (r10) | `GL₂(ℤ̂)`; `K(3)`; `−1`; `2 + 3i` | `SL₂(ℤ)`; `(ℤ/3)^×`; `[[3,2],[0,1]]·i = 2 + 3i` | Correct; no change |
| 5.3 Hurwitz Checks (r10) | `U₁(9)` at `3` | `72`; `{0,…,4}`; `3 = (72/2)(1/12)` | Correct; no change |

**Headline inventory.** Unchanged: twenty headlines stated in `Suggested.lean`; the docstring names the Tamagawa, Siegel-covering, Weil-restriction, disconnected-finite-volume, torsor-Hasse, `GL₁`-cohomology and Riemann-surface headlines as not statable with their missing carriers. The new AA.1.2 target is a README-only structural statement (*Lean:* none), and no Lie group carrier exists at the pins, so its absence from the Lean file is correct. No padding (the file is unchanged and was probed at the previous head).

**Checks and shape.** The new AA.1.2 target has four Checks (two computed component counts, an isogeny non-invariance, a non-example), its locator at the claim and a `*Needs:*` line; the AA.1.5 bullet now has three Checks; the AA.3.4 definition now has three Checks including a negative control. No LaTeX, process words, pull-request numbers or absolute paths were added. The scope section (`:40–41`) now claims the Lie group structure and the finiteness of the component group, matching the new target.

## Not verifiable

- Platonov–Rapinchuk–Rapinchuk 2023 and Platonov–Rapinchuk 1994 (locators this README already cites, untouched by the diff): Cambridge and Academic Press paywalls; locators only.
- Borel–Harish-Chandra 1962, Voight, Schneider, Platonov 1969 (English pages), Orr–Schnell, BGST, HW, Gordon, Dudas–Michel, Marzec–Neururer, Conrad RGS, Casselman, Rapinchuk, Stacks tags, BHV: untouched by the diff; their locators stand as resolved in the previous reports.
- Ownership against open pull requests whose files the brief does not supply (ArithmeticLocallySymmetricSpaces, AutomorphicSpectralTheory, ShimuraVarieties, ShimuraCompactifications, CompletedCohomologyPartII, KTheoryLowDegrees, AutomorphicFormsOnReductiveGroups, ShimuraData) was checked only through `roadmaps grep`.

## Source issues

- none
