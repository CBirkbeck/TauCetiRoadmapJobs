# FIX-PKG-PadicFamiliesPartII~7

This round repairs the eight findings of REV-PKG-PadicFamiliesPartII~6: three P2 and five P3. All eight were checked against the cached sources and the pinned Mathlib, and all eight hold.

Three files changed:
- `packages/PadicFamiliesPartII/README.md`;
- `packages/PadicFamiliesPartII/sources.toml` (locator strings only);
- `packages/PadicFamiliesPartII/design/plan.json` (only the `needs` of the existing gap `mixed-cube-cover`).

`Suggested.lean` and `metadata.toml` are unchanged.

## REV-PKG-PadicFamiliesPartII~6/F01 (P2) — applied

§6.1 "`0 ≤ w_v ≤ ε_v`", "`0 ≤ u_v ≤ w_v`" → strict at 0, with a group-law sentence, a negative-control Check and a Source-issues bullet. §6.2 "every admissible tuple … concentrated in `[0, |I|]`" → tuples with `min_v n_v ≥ max_v n(ε_v)` (Theorem 6.2.6), cofinality, the colimit `H^†` in `[0, |I|]` (Proposition 6.3.7), and two new Checks.

**Evidence.**
- BCGP21 lines 6863–6939 print the closed intervals from 0. At `u = 0`, `1 + R` contains 0, so it is not a group.
- Theorem 6.2.6 (line 7049, p. 145) assumes `ε ∈ ℚ_{>0}^{S_p}` and `inf_v n_v ≥ sup_v n(ε_v)`. The threshold `n(ε)` is defined at lines 7017–7020.
- Proposition 6.3.7 (line 7161, p. 148) gives the colimit statement.

**Where this follows the source rather than the review.** The review wrote "`n_v ≥ n(ε)`". I used the theorem's form, `min_v n_v ≥ max_v n(ε_v)`.

**Cofinality.** The repaired tuples are cofinal: replace `n_v` by `max(n_v, max_{v′} n(ε_{v′}))`. The tuple stays admissible because `ε_v ≤ n_v − 1/(p−1) ≤ n′_v − 1/(p−1)`.

**Repair the pattern.** No other parameter range in the README includes 0. The dagger radii `X((ε_v))` of §6.5.2 are degree bounds, and the multiplicative locus at `ε = 0` is legitimate there.

## REV-PKG-PadicFamiliesPartII~6/F02 (P2) — applied differently

gap:mixed-cube-cover "cover of the minimal compactification" → for `ε_v > 0` and `min n_v ≥ max n(ε_v)`: the thresholds `n(ε_v)`, the ample `det ω^mod`, and a cover of the open `X^*_{K(p^n)}(ε)` by `2^{|I|}` vertex charts whose intersections map projectively to affines, so small formal Banach sheaves are Čech-acyclic. Same wording in §6.2 and the §6.6 route.

**Why differently.** The review kept "acyclic for the toroidal-to-minimal pushforward of the analytic coefficients" inside the gap. Those coefficients are this roadmap's own (§6.1), so ShimuraCompactifications cannot state anything about them.

The gap therefore asks only for what that supplier can own:
- the geometry: BCGP21 Lemma 6.2.3, p. 145;
- the general acyclicity statement: BCGP21 Theorem 6.1.3, p. 140, after AIP15 Theorem A.1.2.2.

§6.2's proof route now carries the coefficient-specific step:
- relative vanishing for `O(−D)` from AutomorphicBundlesPartII §5.2 (BCGP21 Proposition 6.2.5);
- the mod-p filtration of the coefficient (BCGP21 Lemmas 6.1.11–6.1.12, p. 143).

**Other changes.**
- AutomorphicBundlesPartII §5.1, §5.2 and gap:hilbert-siegel-frame-torsor are added to §6.2's *Needs*.
- §5.1 is added to the Layer 6 Dependencies.
- Supplier and section are unchanged (ShimuraCompactifications §7.25). The README line and `plan.json` agree up to "Supply".

**Evidence.** BCGP21 lines 7034–7043 cover `X^*_{K(p^n)}(ε)`, not the minimal compactification. At `I = ∅` there is one chart. The proper minimal compactification of dimension `3[F:ℚ]` is not affine. This is the new second Check of §6.2.

## REV-PKG-PadicFamiliesPartII~6/F03 (P2) — applied

§7.3 "λ-twisted torus action" → `CC_λ, CC_{cusp,λ} : O(𝔤,𝔟)_{λ-alg} → D(Mod^{λ-sm}_{B(ℚ_p)}(E))` with its `B(ℚ_p)`-action, `CC^fs`, `CC^{=μ}`, two API bullets and a Check. §7.1b "Banach models" → `T⁺`, the character space, `(−)^fs` through `K_U`-invariants with the normalized-trace Hecke action, independence of `K_U`, slope parts, ordinary = slope 0, three Checks.

**Evidence.**
- BCGP25 lines 4426–4430 give the target `D(Mod^{λ-sm}_{B(ℚ_p)}(E))`.
- Lines 4196–4314 (pp. 93–96) give `(−)^fs`, the slope functors, the `K_U` Hecke action and Lemmas 4.6.51–4.6.53.
- Line 3086 (p. 68) says 𝔟 acts like λ.
- Line 4579 (p. 102) says the ordinary part is the minimal-slope part.

**Where the repair goes beyond the review.**
- **§§7.4–7.5.** Instead of putting equivariance only in an API bullet, the comparison of §7.4 is stated `B(ℚ_p)`-equivariantly. §7.5 names its spectral sequence as the `B(ℚ_p)`-equivariant Cousin spectral sequence (BCGP25 Proposition 4.6.13 and Remark 4.6.14, p. 83), which is what §7.6 needs.
- **The ordinary part.** `(−)^{ord}`, used undefined in §§7.7–7.8 and Layer 8, is the same defect. It is now defined in §7.1b as the minimal-slope part, which is 0 on the §7.6 coefficients (BCGP25 Theorem 4.6.60, p. 98). §7.8 identifies `V` with `CC^{=0}_λ(M(𝔤)_λ)_{m_ρ̄}`.
- **Page range.** The review gave pp. 94–96. §4.6.46 starts on p. 93 (line 4196, after the page-93 marker), so the README cites pp. 93–96.

**Ownership.** I searched for a derived solid finite-slope functor on λ-smooth `B(ℚ_p)`-representations:
- on main, at the open heads (`roadmaps grep`) and in the board packages: none found;
- LocallyAnalyticRepresentationsOfLocalGroups §3.5 has only λ-smooth representations;
- HigherHidaAndColemanTheory has only Banach finite-slope blocks;
- OverconvergentAutomorphicForms §0.6 has Emerton's underived, locally convex finite-slope part.

This roadmap therefore owns the functor (Scope says how it differs). It imports the character space of `T(ℚ_p)` from OverconvergentAutomorphicForms §0.6, which is a new supplier contract and is earlier in the merge order (251 against 256). It imports solidified group algebras from LocallyAnalyticRepresentationsOfLocalGroups §3.4.

## REV-PKG-PadicFamiliesPartII~6/F04 (P3) — applied

§1.1 "(BPS §3.1–§3.2, HAL pp. 15–16)" → "(BPS §1.5, HAL p. 11; recalled at the start of §3.2, HAL p. 16)". `sources.toml` BPS locator gains "§1.5 (p. 11)".

**Evidence.** BPS lines 483–509 sit under the printed header "11" (line 476). Line 719 says "nous avons défini", under the printed header "16" (line 696).

**Pattern.** No other BPS locator in the README cites §3.1 for δ.

## REV-PKG-PadicFamiliesPartII~6/F05 (P3) — applied

§5.1 "(BCGP21 §§5.2–5.4, pp. 119–124)" → "(BCGP21 §§5.2–5.4, pp. 119–122; the two identities on p. 121)". §7.1 "(BCGP25 Lemma 3.4.6, p. 54)" → "pp. 53–54". The `sources.toml` locators are updated to match.

**Evidence.**
- BCGP21: §5.2 is at line 5791 (p. 119), §5.5 at line 5959 (p. 122), and the identities at lines 5889–5890 (p. 121).
- BCGP25: the lemma's statement is at lines 2473–2474 (p. 53), and its proof follows the page-54 marker at line 2476.

**Pattern.** No other occurrence of either locator.

## REV-PKG-PadicFamiliesPartII~6/F06 (P3) — applied

Contracts "From Mathlib": End.lean:32 → 33, Eigenspace/Basic.lean:71 → 72, Projective.lean:70 → 71, Artinian/Module.lean:308 → 307.

**Evidence.** At Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`:
- `abbrev Module.End` is at line 33.
- `def genEigenspace` is at line 72.
- `class Module.Projective` is at line 71 (line 70 is `@[wikidata …]`).
- `theorem eventually_isCompl_ker_pow_range_pow` is at line 307, inside `namespace LinearMap` opened at line 285, so its full name is `LinearMap.eventually_isCompl_ker_pow_range_pow`.

`Prod.lean:95/199`, `AlgebraMap.lean:259` and `DerivedCategory/Basic.lean:87` were re-checked and are exact.

## REV-PKG-PadicFamiliesPartII~6/F07 (P3) — applied

Layer 7 Dependencies: added "Tau Ceti `TauCeti.VermaModule`". They also gain OverconvergentAutomorphicForms §0.6 and LocallyAnalyticRepresentationsOfLocalGroups §3.4, which the new §7.1b *Needs* line introduces.

**Pattern.** A script compared every `*Needs:*` item with its layer's Dependencies line after all edits. No item is missing in any layer. Five Dependencies items name inputs of standing hypotheses that no `*Needs:*` line lists; these are pre-existing and not defects:
- PELModuli §M0.21 (Layer 1);
- SmoothRepresentationsOfLocalGroups §SR.4.5 (Layer 3);
- HigherHidaAndColemanTheory §9.4 and §9.8 (Layer 4);
- HigherHidaAndColemanTheory §1.1 (Layer 7);
- HigherHidaAndColemanTheory §8.5 (Layer 9).

## REV-PKG-PadicFamiliesPartII~6/F08 (P3) — applied

§6.7 "Assume `|I| = 1`" → "Assume `|I| ≤ 1` (at most one Klingen place)"; amplitude `[0, 1]` → `[0, |I|]`; the locator notes `#I ≤ 1`; the route adds `I = ∅` (degree 0, `b = 0`); a new `I = ∅` Check (`χ(source) − χ(target) = −a`; global statement needs `l_v ≥ 4` everywhere). Heading kept.

**Evidence.** BCGP21 lines 7986 and 8004 (Theorems 6.6.4–6.6.5, p. 167) assume `#I ≤ 1`.

**Pattern.** No other `|I| = 1` restriction is stated as a hypothesis. §6.6(2)–(3) already say `|I| ≤ 1`.

## Checks

- **Elaboration.** `lake env lean packages/PadicFamiliesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged: it imports `Mathlib` only and declares nothing.
- **`#check @name` comparison.** There are no declarations, so there was nothing to compare and nothing changed. No `TauCeti.*` import, so nothing needed building.
- **Dependency direction.** `gate --depcheck … --movable`: `depcheck: 223 roadmaps, 1997 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` returns the same three leads as before. HigherHidaAndColemanTheory §§9.6, LocallyAnalyticDistributionsPartII §2.5 and LocallyAnalyticRepresentationsOfLocalGroups §4.2 are board packages earlier in the merge order, and their headings exist. The new citations resolve:
  - OverconvergentAutomorphicForms §0.6 at its open head ("General analytic vectors, coadmissibility and Jacquet coefficients");
  - LocallyAnalyticRepresentationsOfLocalGroups §3.4 in the board package.
- **Gaps.** All 15 gaps have the same supplier and section in `plan.json` and the README. Only `mixed-cube-cover` changed; its README line and `needs` agree up to "Supply".
- **Sources.** No new source was fetched and nothing was added to `needs-references.toml`. Every new locator was read in the cached BCGP21, BCGP25 and BPS texts.
- **Gate failures listed in the brief.** One: in `packages/PadicFamiliesPartII/sources.toml`, source 2 (BCGP25) had a 1161-character `locator`, over the manifest's 1000-character limit. It is now 930 characters. The words Definition, Proposition, Theorem, Lemma, Corollary and Remark are abbreviated (Def., Prop., Thm., Lem., Cor., Rem.), and each subsection's items sit in one group (Theorems 4.5.20 and 4.5.23 now go with §4.5). The locator still has the same 87 numbered items and page locators: a mechanical comparison of the extracted item lists matched exactly. No item was dropped or widened into a range, and nothing else in the manifest changed. When re-run on the file, the gate's manifest-text check reports no problem. The BCGP21 locator (707 characters) is under the limit and was left alone.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §6.1 admissible tuple, `0 < w ≤ ε ≤ n − 1/(p−1)` | `p = 3, 5`; `n = 1`; `(1, 0, 0)` | bounds 1/2, 3/4 (> 0, so nonempty since `p > 2`); `(1, 1/4, 1/8)` admissible; `(1, 0, 0)` excluded | pass |
| §6.1 u-analyticity, `u > 0` | `u = 0`; `u = 1/16` at `p = 3`; order-3 χ | `1 + R ∋ 0`, so not a group; `(1 + 3^{1/16}x)⁻¹ = Σ(−3^{1/16}x)^j`; χ needs `u > 1`, `(2, 3/2, 3/2, 3/2)` admissible as `3/2 ≤ 2 − 1/2` | pass; Check added |
| §6.2 amplitude at threshold | `I = ∅`, `|I| = 1, 2`; `ε_v = 0` | charts 1, 2, 4; faces `3^{|I|}` = 1, 3, 9; cubical terms (1), (2, 1), (4, 4, 1), length `|I|`; Čech length `2^{|I|} − 1` = 0, 1, 3; at `ε = 0` the image is the proper minimal compactification, so no affine chart | pass |
| §6.2 cofinality | `(1, 1/4, 1/8)` at `p = 3` | `n′ = max(1, n(1/4))`, `1/4 ≤ n′ − 1/2`; filtered colimit exact | pass; Check added |
| gap:mixed-cube-cover | `I = ∅`; `|I| = 1` | one chart = all of `X^*(ε)`; two charts and one edge; Euler characteristic of the cube `4 − 4 + 1 = 1` at `|I| = 2` | pass |
| §6.7 `|I| ≤ 1` | `I = ∅` with `(h⁰_s, h⁰_t) = (2, 3)`; `l_v = 3, 4` | `χ_s − χ_t = −1 ≠ 0`, so equality forces `a = 0`; `0 < l_v − 3` iff `l_v ≥ 4` | pass; Check added |
| §7.1b `T⁺`, `T^{++}` | `GL₂`: `diag(p,1)`, `diag(1,p)`, `diag(p,p)^{±1}` | `v(α)` = 1, −1, 0: in `T^{++}`, not in `T⁺`, in `T⁺ ∖ T^{++}` | pass |
| §7.1b normalized Hecke action | trivial representation, `K_U = U(ℤ_p)`, index p | normalized `p⁻¹·p = 1`, slope 0; unnormalized p, slope 1 | pass; Check added |
| §7.1b slope order | `p^{v(a)−v(b)}`, `(−1)^{v(a)}`, `p^{v(a)}` | slopes α (≥ 0, ≠ 0), 0, `ε₁` (value −1 at `diag(p⁻¹, p⁻¹) ∈ T⁺`) | pass; Check added |
| §7.1b `(−)^fs`, slope parts | t acts by (1, p); by (1, 0) | `N^fs = N`, `N^{=0} = Ee₁`, `N^{=α} = Ee₂`; `N^fs = Ee₁`, kernel `Ee₂` | pass; Check added |
| §7.1b independence of `K_U` | trivial representation, `U(pℤ_p) ⊂ U(ℤ_p)` | both invariant spaces E; trace `p⁻¹·Σ_{p cosets} 1 = 1` | pass |
| §7.3 λ-smoothness | `X ∈ 𝔟`, 𝔤-linear f | `X∘f − f∘(X − λ(X)) = λ(X)f` | pass |
| §7.3 twist `CC_{λ+η} = CC_λ ⊗ E(η)` | `𝔤𝔩₂`, `M = det`, `λ = 0`, `η = det`; `M = 0` | `det(diag(p,p)) = p²`; zero | pass; Check added |
| §§7.4–7.5 equivariance | modular curve | two Bruhat cells `P\PwB`, each right-B-stable; Cousin SS with two columns | pass |
| §7.8 `V = CC^{=0}_λ(M(𝔤)_λ)` | PBW freeness of `U(𝔤)` over `U(𝔟)` | `RHom_𝔤(U(𝔤)⊗_{U(𝔟)}λ, −) = RHom_𝔟(λ, −)` derived | pass |
| ord = minimal slope | Theorem 4.6.60 at `ν = λ + w⁻¹w_{0,M}ρ + ρ` | bound `λ − ν + w⁻¹w_{0,M}ρ + ρ = 0` | pass |
| F04–F06 locators | BPS, BCGP21, BCGP25 page markers; Mathlib lines | p. 11 / 16; pp. 119–122, 121; pp. 53–54; 33, 72, 71, 307 | pass |

## For the maintainer

- **New supplier edge.** This roadmap now names OverconvergentAutomorphicForms §0.6 (character space of `T(ℚ_p)`). That roadmap is an open new-roadmap pull request and is earlier in the merge order (line 251; this roadmap is at 256), so the depcheck reports no problem.
- **Changed gap.** The gap `mixed-cube-cover` to ShimuraCompactifications §7.25 now asks for a cover of the Hodge–Tate neighbourhood `X^*_{K(p^n)}(ε)` (above the thresholds `n(ε_v)`), plus a general Čech-acyclicity statement for small formal Banach sheaves. It no longer asks for anything about this roadmap's analytic coefficients.
- **Names others might cite.** No heading, section number or Lean name changed; §6.7's heading is kept although it now covers `|I| ≤ 1`. No id that another roadmap cites was dropped.
- **Suspicious text.** None found in the review or in any fetched text.
