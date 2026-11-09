# Review of AdelicAlgebraicGroups (pull request #792 at 3750db2)

**Verdict:** needs changes

This is an incremental re-review of the 26 changed lines since `2486445`. All of them are in `TauCetiRoadmap/AdelicAlgebraicGroups/README.md`; `Suggested.lean` and the pins are unchanged. Line numbers refer to that README at `3750db2` unless another file is named. Other roadmaps are cited on the content repository's main branch (`9110a01`) unless an open head is named.

The gate passes and both findings of r18 are repaired. One changed *Needs:* line, in AA.4.6, introduces a new P3 finding.

## R01 (P3) — AA.4.6's new *Needs:* entry cites *quotient-measure*, whose hypotheses the target does not supply

**Location.** `README.md:5133–5142`, *Pushforward of a homogeneous measure to a compact abelian quotient*: "`Λ\T` compact … and `μ` the `T`-invariant probability measure on `Λ\T g` … *Needs:* AA.2.2 (*quotient-measure*, for the invariant probability measure on the compact quotient `Λ\T`)".

**Claim.** AA.2.2's *quotient-measure* supplies the `T`-invariant probability measure on `Λ\T` under the hypotheses of this target.

**Witness.** *quotient-measure* (`:1842–1844`) assumes a second countable locally compact Hausdorff group and `Δ_G|_H = Δ_H`. For the pair `(T, Λ)` this means `Δ_T|_Λ = 1`. The target assumes neither. For example, the `ax+b` group with `Λ = ⟨(2,0)⟩` has `Δ_T(2,0) = 2`.

**Why the target's hypotheses do not close the gap.**
- In that example `Λ\T ≅ (ℝ_{>0}/2^ℤ) × ℝ` is not compact. The target therefore excludes it, but only through the theorem that a group with a cocompact discrete subgroup is unimodular.
- No layer, supplier or pinned declaration states that theorem:
  - AnalyticNumberTheoryPartII §5.3k (its README `:733`) itself assumes matching modular characters;
  - Mathlib's `MeasureTheory/Group/ModularCharacter.lean` (lines 45–130) only defines the modular character and proves that it is multiplicative;
  - ProbabilisticAndMetricNumberTheory §4.9a works in a unimodular group from the start.
- Second countability of `T` also needs a source, since the target puts no hypothesis on `G`.

**Repair.** In `:5133–5137`, add to the hypotheses "`G` a second countable locally compact Hausdorff group and `T` unimodular (automatic for abelian `T`, in particular for `T(𝔸_F)` of a torus)". Alternatively, add an owned target, with a locator, stating that a locally compact group with a cocompact discrete subgroup is unimodular, and list it on this *Needs:* line.

**Tested** on the example above and on the cases the target is meant for:
- For the `ax+b` group with `Λ = ⟨(2,0)⟩`, the new hypothesis fails (`Δ_T(2,0) = 2`), so AA.2.2 is never invoked there.
- For `T = T(𝔸_ℚ)`, with `T` the norm-one torus of `ℚ(i)` and `Λ = T(ℚ)`, `T` is abelian, so `Δ_T = 1 = Δ_Λ` and AA.2.2 applies.
- The target's own Checks keep their values. For `T = C₄` and `T = {0,2}` (finite, `Δ = 1`) the masses are still `1/4` and `1/2`.
- Khayutin's setting (tori, Definition 3.1) is still covered.

## Previous findings (r18 at `2486445`)

- R01 — repaired: `:4117–4121` "Source interfaces are SchemeAndStackFoundations §1.13 (`GroupSpace.ofGroupScheme`), §1.15 (`torsorClasses.mk`, `torsorClasses.mk_eq_base_iff`, `Torsor.baseChange` …) and §2.3 (`NonabelianH1`). Only `Torsor.trivial_iff_section` is stated in its `Suggested.lean`"; row `:302` adds §1.13 and `GroupSpace.ofGroupScheme`.
- R02 — repaired: `:5174–5176` "*Needs:* RepresentationTheory/CompactGroups, layer 0 (Haar probability on a compact group and its invariance) and layer 5 (density of the span of characters)." AA.2.4 is gone from the line.

## Verified sound

**Gate, build and dependency check.**
- My gate run on `3750db2` prints `gate AdelicAlgebraicGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- The movable dependency check prints `depcheck: 239 roadmaps, 2364 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- The new suppliers are both on main, so the merge order is not affected: SchemeAndStackFoundations §1.13, and RepresentationTheory/CompactGroups layer 0. The new AA.2.2 edge in AA.4.6 points to an earlier layer, so it adds no forward reference.

**Lean.**
- `lake env lean` on `Suggested.lean` exits 0 in 8 s with 19 warnings, all ``declaration uses `sorry` ``.
- `#check @name` for the 61 declarations, appended to a scratch copy, elaborates with 0 errors. The types are unchanged from r18. The five dropped-binder leads of `signatures.md` are the same harmless ones as in r18: `box`, `InfinitePoints`, `IsCentralCocharacter`, `algebraicPointMap` and `IsFaithfulAlgebraicPointHom` do not use the dropped binders. The leads `at` and `it` are words from docstrings.
- One-tactic probe: on a scratch copy, every `sorry` was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (trivial; done) | (decide; done) | (norm_num; done) | (aesop; done)`. This gives 19 errors on 19 theorems, so nothing is padding.
- The headline coverage of r18 is unchanged, since no headline statement was touched.

**Changed passages, resolved against the cited texts.**
- **Supplier row *Geometric torsors and classes*** (`:302`). All ten names occur in SchemeAndStackFoundations on main:
  - §1.13, `GroupSpace.ofGroupScheme` (its README `:2427`);
  - §1.15, `Torsor.trivial_iff_section` (`:2509`), `Torsor.hom_isIso` (`:2510`), `Torsor.baseChange` (`:2511`), `torsorClasses G := NonabelianH1 …` (`:2516`), `torsorClasses.mk` (`:2517`), `torsorClasses.mk_eq_base_iff` (`:2518`), `torsorClasses.surjective_mk` (`:2519`) and `torsorRepresentability` (`:2536`);
  - §2.3, `NonabelianH1` (`:3334`).

  Its `Suggested.lean` declares exactly `Torsor.trivial_iff_section` (`:1175`) and `torsorRepresentability` (`:1182`), inside `namespace Groups` (`:1128`) under `TauCetiRoadmap.SchemeAndStackFoundations` (`:23`). The row's "Groups." prefixes are therefore right, and so is its claim that the others are README targets (its `:2585–2587`).
- **The open revisions of SchemeAndStackFoundations** at the heads `rev/1656` and `rev/1276` keep §§1.13, 1.15 and 2.3, the README names, and both Lean statements. `overlaps.md` reports no dropped ids.
- ***Canonical `μ₂` class*** (`:4108–4122`) and ***Real-class realization*** (`:4153–4161`): every name now carries the section that defines it.
- ***Volumes under finite-index level change*** (`:5053–5060`):
  - `MeasureTheory.Subgroup.index_mul_measure` is at `Mathlib/MeasureTheory/Group/Measure.lean:286`. It states `H.index * μ H = μ univ` for a left-invariant `μ` and a measurable finite-index `H`.
  - *Volume of a level quotient* (`:5042–5052`) holds for any Haar measure, so dropping AA.2.4 is correct.
  - A scan of `:4011–5217` finds no remaining use of AA.2.4, gauge forms or the finite order formula. This justifies the edit to Layer 4's *Dependencies* (`:5210–5216`).
- ***Fourier convergence*** (`:5167–5177`):
  - RepresentationTheory/CompactGroups layer 0 (its README `:205–224`) has `haarProb` with left and right invariance.
  - Its layer 5 (`:318–347`) has uniform density of the representative `*`-subalgebra. For abelian `C` that algebra is the span of characters, because irreducibles are one-dimensional, as that roadmap uses for the circle (`:443–444`). The parenthetical is therefore accurate.
  - Scope (`:138–140`) and the supplier paragraph (`:578–579`) already list layers 0 and 5.

**Sources: the seeded sample, where it falls in the changed passages.** Khayutin was fetched through the sources service (arXiv 1710.04557v3) into a scratch copy of the manifest, so the package manifest is unedited.

| Sample target | Changed passage | Locator read | Result |
|---|---|---|---|
| 4.1 | *Canonical `μ₂` class*, *Real-class realization* | SchemeAndStackFoundations §§1.13, 1.15, 2.3, as above | supports |
| 4.5 | *Volumes under finite-index level change* | lt line 578–593, §3.2.3 p. 16: class count at most `#G(ℚ)\G(𝔸_f)/G(ℤ̂)` times `#G(ℤ̂)/Stab(L)` | supports "counting analogue" |
| 4.7 | *Fourier convergence* | khayutin line 1001–1008 (Prop 3.6, p. 24), line 1011–1044 (Rem 3.7 and proof, p. 25) | supports |
| (4.6, not sampled) | *Pushforward …* | khayutin line 912–919 (Def 3.1, p. 22) | supports |

The other sample targets contain no changed line, so this incremental review did not re-read them: 0.1, 1.1, 1.4, 2.2, 2.3, 2.4, 3.1, 3.2, 3.7, 4.2, 4.3 and 5.2. r18's readings of 0.1, 2.2, 2.4 and 3.7 stand. The README flags no locator as unverified.

**Remarks on untouched text (no change requested).**
- In AA.4.6 (`:5137–5138`), the measure on `Λ\T g` is invariant under `g⁻¹Tg`, the translate of the `T`-invariant measure on `Λ\T`; "`T`-invariant" is literal only when `g` normalizes `T`.

**Adversarial table.** The rows marked "new" were computed this round. The rows marked "r18" are carried from the previous report for statements the diff leaves untouched.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| new: row *Geometric torsors and classes* | the 10 cited names, on main | §1.13: 1 name; §1.15: 8 names (`:2509–2536`); §2.3: 1 name; in its `Suggested.lean`: 2 of the 10 | true |
| new: 4.1 canonical `μ₂` class | `ℚ[t]/(t²−2)`, `t ↦ t⊗g`; base changes along `id` and `ℚ → ℝ` | sections: none over `ℚ`, none after `id`, `±√2` over `ℝ`; via `mk_eq_base_iff`: not base, not base, base; Kummer: `[2] ≠ 1` in `ℚ^×/ℚ^{×2}`, `= 1` in `ℝ^×/ℝ^{×2}` | true |
| new: 4.1 real-class realization | `SL₁(D)`, `D` Hamilton over `ℚ`; `SL_n` | `ℚ^×/Nrd(D^×) = ℚ^×/ℚ_{>0}` (2 classes) maps to `ℝ^×/ℝ_{>0}` (2 classes), `−1 ↦ −1`, bijective; `SL_n`: `1 → 1` | true |
| new: 4.5 level change | `G_m/ℚ`, `U = ℤ̂^×`, `U′ = (1+5ℤ₅)∏_{p≠5}ℤ_p^×`; `U′ = U` | `[U:U′] = 4`; level `U`: 1 class, `Γ = {±1}`, volume `1`; level `U′`: `{±1}\(ℤ/5)^×` gives 2 classes with `Γ′ = 1`, volume `2` each; `2+2 = 4·1`; `1 = 1·1` | true |
| new: 4.6 pushforward (route) | `C₄`, `Λ = 1`; `T(𝔸_ℚ)` of the `ℚ(i)` norm torus; `ax+b`, `Λ = ⟨(2,0)⟩` | `Δ = 1`, masses `1/4`; abelian, `Δ_T\|_Λ = 1`; `Δ_T(2,0) = 2 ≠ 1`, `Λ\T ≅ (ℝ_{>0}/2^ℤ)×ℝ` noncompact | statement true; route R01 |
| new: 4.7 Fourier convergence | `∏_ℕ{±1}`, `χ_n` coordinates, `ψ = χ_S` | `∫χ_S dm_n = 1` iff `S ∈ {∅,{n}}`, else `0` (pick `h ∈ ker χ_n` with `χ_S(h) = −1`); limit `[S=∅] = ∫χ_S dμ`; Walsh span dense | true |
| r18: Lean `exists_unique_convergentHaarProduct` | `ι = ∅`; one `C₄`, `B = {0,2}`; mass `∞` and `∅` factors | `1·∏'∅ = 1`; box mass `2`; `ν(∅) = 0 = ∞·0` | true |
| r18: 0.1 Borel boxes | `ℤ/4 ⊃ 2ℤ/4`; singleton `{0}` | not open, not a cofinite box; a countable intersection of boxes | true |
| r18: 0.2 right invariance | `C₂` counting; `g_i ∈ B_i` a.e. | `∏μ_i(C_i g_i⁻¹) = ∏μ_i(C_i)` | true |
| r18: 0.4 normalizations | `[0,1)×ℤ̂`; `ℚ(i)` annulus | `1`; `4π` vs `2π`, ratio `2 = \|d\|^{1/2}` | true |
| r18: 0.4 idele mass | `x₂ ∈ 1+4ℤ₂`, `[1,e]` | `(1−½)⁻¹·¼ = ½`; `¼` without the factor | true |
| r18: Lean `exists_weilRestriction_adelicPointsEquiv` | `ℚ(i)/ℚ`, `G_a`, point `i` | `i ↦` diagonal `i`; conjugate gives `−i` | true |
| r18: Lean `exists_restrictedProductEquiv` | `G_m`; `H = F` | `𝔸_f^× ≃ Πʳ[ℚ_p^×, ℤ_p^×]`; singletons | true |
| r18: 1.2 Lie components | `SO(x²−y²)`, `SO(2)`; `SL₂`, `PGL₂` | 2 vs 1 components; 1 vs 2 | true |
| r18: 2.1 split centre | real quadratic `G_m`, idele `(2,½)` | norm `1`, not in `F^×`, in `Z(F_∞)^0` | true |
| r18: 2.2 modulus | `ax+b` | `d_l/d_r = δ⁻¹`; Arthur prints `e^{+2ρ}` | true; source misprint (r18) |
| r18: 2.2 compact lifting | `ℤ ⊂ ℝ`; `ℝ_d → ℝ` | `[0,1]` lifts; finite compacts miss `[0,1]` | true |
| r18: 2.4 gauge pullback, orders | Borel `diag(a,d)`; `GL₂(𝔽₂)`; `U₃(q)` | `\|a/d\|`; `6`; `q³(q²−1)(q+1)(1+q³)` | true |
| r18: 2.4 Tamagawa | `G_a/ℚ`; `G_m` integral factor | `\|d\|^{−1/2}\|d\|^{1/2} = 1`; `(1−q⁻¹)⁻¹(1−q⁻¹) = 1` | true |
| r18: 2.5 Jacobian, gauge restriction | `ℚ(i)/ℚ`, `β = (1,i)`; `ω = 1+i` | `½ = 4^{−1/2}`; `2` and `\|2\|₂ = ½` | true |
| r18: 3.3 Siegel domain | `[[√y,x/√y],[0,1/√y]]` | `g·i = x+iy`; Gram `[[1,1],[1,5]]` | true |
| r18: 3.4 Siegel property, `S`-arithmetic | `G_m/ℚ`; `ℚ(√2)`, `π = 3+√2` | compact `ωω⁻¹K`; `N(π) = 7`, infinite index | true |
| r18: 3.5 heights | `GL₁` point `2`; `G_a` | `√17`; `√(4+2t²)`, `max(1,\|t\|_p)` | true |
| r18: 3.7 *triple-fundamental-set* | `G_m`; `SL₂`, `t = ¾` vs `1`; `SL₂(ℤ[½])` | covers; `0.45+0.9i` blocks `t = 1`; `4^k i` | true |
| r18: Lean `arithmetic_finite_volume_iff` | `G_m/ℚ`; `SL₂/ℚ` | infinite, `X* = ℤ`; finite, `X* = 0` | true |
| r18: Lean `finite_classes` | `G_m`, `ℤ̂^×`; `U = {1}` | `Cl(ℤ) = 1`; excluded by `hUo` | true |
| r18: Lean `exists_fundamentalDomain_normOne_lt_top`, `finite_volume_iff` | `G_m`; `G_a` | compact norm-one, infinite full; `𝔸/ℚ` compact | true |
| r18: Lean `exists_compact_normOne_iff` | `G_m`; `GL₂` | central compact; noncompact | true |
| r18: Lean `exists_reduced_GLZ` | `n = 0`; `n = 1` | `1 < C`; `β < Cβ` | true |
| r18: Lean approximation pair | `μ₂`, `{∞,2}`; `G_m` at 5; `SL₂ × D¹` | not dense; `±2 ≡ 2,3`; `hS` fails | true |
| r18: Lean `exists_isNeatLevel_le` | `GL₂(ℤ̂)` | `K(3)` of index `48` | true |
| r18: Lean `isCoveringMap_levelMap` | `U(3) ⊃ U(9)`; `Γ(9) → Γ(3)` | fibres `3`; `648/24 = 27` | true |
| r18: 4.4 fibre masses | `SL₂`, `Γ̂(2)`, `x = [i]` | `3·½ = 6/4` | true |
| r18: 5.3 level change | Hurwitz, `U₁(9)` at `3` | `72/24 = 3 = (72/2)(1/12)` | true |
| r18: Lean `nrd_image` | Hamilton, `c = −1, 3`; split | no norm/false; norm/true; every `c` | true |
| r18: Lean `compactSpace_ideleClassGroup_quotient_squares` | `2` at `∞`; `−1` at `3` | dies; survives | true |
| r18: Lean `isMulLeftInvariant_of_tendsto` | repeated `χ` | `ker χ` limit excluded by `hχ` | true |
| r18: Lean `nonempty_connectedComponent_homeomorph` | `ℚ`; `ℚ(√2)` | a point; a circle | true |
| r18: Lean `exists_componentHomeomorph` | `GL₂(ℤ̂)` | one component | true |

## Not verifiable

- **Paywalled:** Platonov–Rapinchuk 1994. Its Proposition 6.17, pp. 337–339, and Theorems 6.4 and 6.6 are cited in changed AA.4.1 targets, and the text around those locators is unchanged. Platonov–Rapinchuk–Rapinchuk 2023 is paywalled too. These locators are taken as given.
- **Ownership against open pull requests:** checked by `roadmaps grep` and `overlaps.md` for the changed objects. The ArithmeticLocallySymmetricSpaces, ShimuraVarieties and ShimuraData READMEs were not read, since the brief names those pull requests without files.

## Source issues

- **Misprint** in khayutin at the proof of Proposition 3.6, p. 25: the source says `[T(𝔸)]` is compact because the torus `T` is isotropic over `ℚ`; it should say anisotropic, since `T ≅ G_m\Res_{E/ℚ}G_m` has no nontrivial rational character; affects nothing.
