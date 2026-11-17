# Review of HeightsRationalPointsAndObstructions (pull request #1017 at 0d73876)

**Verdict:** needs changes

Incremental re-review of 36 changed lines since 3dc9d71. One finding.

## R01 (P3) — the isomorphism theorem is cited at ReductiveGroups Layer 8; it is Layer 9D

**Location:** `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md` line 120: "by the isomorphism theorem of ReductiveGroups Layer 8 it is the base change of the Layer 9B pinned model"; line 1591 (*Needs:* of §3.8e): "Layer 8 (isomorphism theorem) and Layer 9B (pinned models)".

**Claim:** ReductiveGroups Layer 8 states the isomorphism theorem for split reductive groups.

**Witness:** On main, `TauCetiRoadmap/ReductiveGroups/README.md` line 3687: Layer 8 is "split groups and pinnings" (§§8.1–8.2 only; line 3722: "Existence and classification are Layer 9D's targets"). The theorem is Layer 9D's first bullet (line 4977); line 1197 maps the former Layer 8 → Layer 9D.

**Repair:** Line 120: "by the isomorphism and existence theorems of ReductiveGroups Layer 9D it is the base change of the Layer 9B pinned model of its root datum". Line 1591: "ReductiveGroups Layers 6–7 (structure, Bruhat cells, central isogenies), Layer 9B (pinned models) and Layer 9D (isomorphism and existence theorems)". Checked on the instance: Layer 9D line 4977 states both theorems, and 9B is the numbering the same sentence already uses.

## Previous findings

- The review of 3dc9d71 had no numbered finding.

## Verified sound

### Adversarial table (statements the diff changes)

| Statement | Instances | Values | Result |
|---|---|---|---|
| Contract *From TauCetiRoadmap.GroupSchemesOverABase*: `0 → X*(G) → X*(T) → Pic(G/B⁻) → Pic(G) → 0`, `Pic(G) ≅ P/X*(T_der)` | SL₂, PGL₂, GL₂, torus | SL₂: `0→0→ℤϖ→ℤ→0→0`, Pic 0. PGL₂: `ℤα=2ℤϖ ⊂ ℤϖ`, Pic ℤ/2. GL₂: `(m,n)↦m−n`, kernel ℤ·det, Pic 0. Torus: Δ=∅, `X*(G)=X*(T)`, Pic 0. | agrees with supplier §6.2 on main (lines 1207–1225) and its three Checks |
| §3.8e: big cell and `D_α` here are the preimages of the supplier's under `g ↦ g⁻¹B⁻` | SL₂, g=(a b; c d), B⁻ lower triangular | `gB⁻ ↦ [b:d]`; `U⁺B⁻/B⁻={[t:1]}={y≠0}`, `D_α=[1:0]`. `g⁻¹=(d −b; −c a) ↦ [−b:a]`: preimages `{a≠0}=U⁻TU⁺`, `{a=0}`, `y ↦ a`. On `U⁻TU⁺`, a=t=ϖ(t). | correct; general case `(U⁺B⁻)⁻¹=B⁻U⁺`, `(B⁺s_αB⁻)⁻¹=B⁻s_αB⁺` |
| §3.8e Check: "the quotient map alone gives U⁺TU⁻, {d=0} and d=1/ϖ" | SL₂, `u(x)·diag(t,t⁻¹)·u⁻(s)` | lower-right entry `d=t⁻¹`, so `{y≠0}` pulls back to `{d≠0}=U⁺TU⁻` and y to `d=ϖ⁻¹`; divisor of ϖ there is `−{d=0}`. | consistent with the older sentence of the same Check; the sign of `λ ↦ div λ` is fixed |
| `λ ↦ div λ = Σ_α⟨λ,α^∨⟩D_α` from the supplier's section of `𝓛(λ)` | λ=ϖ on SL₂; λ=α on PGL₂; λ=det on GL₂ | ϖ ↦ D (a vanishes once on `{a=0}`); α=2ϖ ↦ 2D; det ↦ `⟨det,α^∨⟩=1−1=0`. Supplier: `𝓛(λ) ↦ (⟨λ,α^∨⟩)_α`. | same map on both sides |
| "the reductive quotient of Ḡ is split … the contract applies to it" | k̄ algebraically closed, char 0; Ḡ=G_a; Ḡ=B⊂GL₂ | G_a: quotient trivial, Δ=∅, Pic 0, units 0. Borel of GL₂: quotient G_m², `X*=ℤ²`, Pic 0. Supplier Convention 7 needs a base change of a 9B model: given by existence plus isomorphism (Layer 9D, R01). | sound, with the locator of R01 |
| §3.8f: kernel `X*(G)` (§3.8e), cokernel `P/X*(T_der)` (supplier §6.2) of `[T̂→T̂_sc]` | PGL₂; G_m | PGL₂: `2ℤϖ→ℤϖ`, kernel 0 = units mod constants, cokernel ℤ/2 = Pic. G_m: `ℤ→0`, kernel ℤ = units `t^n`, cokernel 0. | consistent with §3.8e's Checks |

The rows for the roadmap's other statements stand as in the previous review, of `3dc9d71`.

### Counts

- Gate at 0d73876: every check passes (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`). Dependency check run this round: `depcheck: 241 roadmaps, 2547 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Changes outside the folder: none.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HeightsRationalPointsAndObstructions/Suggested.lean` prints seven `declaration uses sorry` warnings (lines 60, 72, 79, 91, 138, 152, 166) and nothing else; the file is unchanged since 3dc9d71.
- Cross-roadmap citations of the changed passages resolved on main: GroupSchemesOverABase Convention 7 (line 160), §6.1 (line 1186), §6.2 (line 1207); its *Downstream consumers* (line 1431) names §3.8e as the consumer of 6.2, so ownership is stated the same way on both sides. ReductiveGroups Layers 6–7 (central isogenies at lines 2454, 2473), Layer 9B (line 4410); Layer 8 is R01.
- Source locators checked in the changed *Sources* line of §3.8e: sansuc1981 line 1129 (Lemma 6.5, p.39), line 1138 (Lemma 6.6, p.40), line 1260 (Proposition 6.10, p.43); the dropped Lemma 6.9 locator is at line 1208 and is the supplier's now. The seeded sample falls in no changed passage.
- *Provenance* section checked against AxiomMath/Mordell at commit `82a30cb`: Apache-2.0, built on Mathlib and a Stacks project formalization; 63 files under `Mordell/Height`, 23 under `Mordell/NeronTate`; `Affine/Ratio.lean`, `LargeAffineCoordinate.lean`, `TateLimit.lean` exist; `Faltings.neronTateBilinear_posDef` is stated for an injective map from a finitely generated group, over fields algebraic over ℚ. Its section references (§§0.11–0.21, 1.8, 5.10–5.12) match the headings here.
- The title and description against the head: no sentence contradicted. GroupSchemesOverABase is on main, so "Roadmaps on main are cited by name" covers the new supplier. Remark, no change asked: the generated `depends-on` block does not list it among the ticked suppliers.
- Padding and headlines: no Lean statement changed; nothing to probe again.

Overlap check: read HeightsRationalPointsAndObstructionsPartII, ArakelovGeometryAndAbelianHeightsPartII, ArithmeticDynamics, ArithmeticStatisticsPartVI, SubspaceTheorem, DiophantineApproximationAndTranscendence as in the previous review, and GroupSchemesOverABase this round; the Picard group of a split reductive group over a field is owned by GroupSchemesOverABase §6.2 and cited here; nothing else shared.

Source independence: changed passages only; 3 passages compared with 2 sources (the contract and §3.8e against sansuc1981 lines 1208–1222; *Provenance* against the AxiomMath/Mordell description), none shared; largest share Poonen, *Rational points on varieties*, 55 of 241 source lines; contents not compared again (no layer added, removed or reordered).

Research link: Layers 4–5 prove Mordell by the route of Bombieri (1990) and Vojta, and Bogomolov by Ullmo (1998), Zhang and Szpiro–Ullmo–Zhang (1997); Layer 3 is the descent and Brauer–Manin theory of Sansuc (1981), Skorobogatov (2009) and Cao (2018). Rests on the README's References and layer sources.

## Not verifiable

- Faltings 1991 (§5.9a): carried from the earlier reviews; JSTOR only, untouched passage.
- Popov 1974 §4, cited through the supplier in the new contract: not in the sources cache; the statement was checked against GroupSchemesOverABase §6.2 and sansuc1981 instead.
- The declaration `Faltings.exists_abs_weilHeight_sub_le_of_pullback_iso` and `Faltings.IsHeightOfClass` named in *Provenance* were not opened; the directories and the third named declaration were.
- The description's sentence on AI assistance cannot be checked from the repository.

## Source issues

- none

## For the human reviewers

- **Licence.** README lines 2988–2997 (*Provenance*) name the Apache-2.0 formalization AxiomMath/Mordell as overlapping §§0.11–0.21, 1.8 and 5.10–5.12 and say no code is transferred. Its Faltings statement (`Faltings.finite_setOf_comp_eq_id_of_two_le_genus`) differs from `mordell_finite` in name, binders and carriers.
