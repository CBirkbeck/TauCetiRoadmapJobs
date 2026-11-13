# Repair report: FIX-RT-MixedHodgeModulesAndIrregularHodgeTheory~1

Findings of the two red-team passes `RT-MixedHodgeModulesAndIrregularHodgeTheory~1a` and `~1b`. None overlap, so each has its own section. Section numbers below are the ones after this repair. Where the old number differs, it is given as old → new; the full map is in the README's "Former-numbering map".

## RT-MixedHodgeModulesAndIrregularHodgeTheory~1a/F01 (P2) — applied

§4.2 now requires `x : V_α M → V_{α−1} M` bijective for `α < 1` (ESY Definition 2.2.2(1c), ESY line 1029; uniqueness, Remark 2.2.3(2)). The witness holds: the constant filtration `U_α = O` satisfies the old list and has zero graded pieces. API bullet updated; Check added (constant `U`, genuine `V` on `O` and `δ_0`).

## RT-MixedHodgeModulesAndIrregularHodgeTheory~1a/F02 (P3) — applied

Witness holds: on `P¹` with no punctures and `L = ℚ`, `H⁰ = ℚ` and `H² = ℚ(−1)`. The §3.4 Check now says "on a curve with at least one puncture" and states this empty-puncture boundary case.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~1a/F03 (P2) — applied

Witness holds (CY lines 345–398). In §8.10 (old 12.9), "blow up where the pole orders have opposite signs" became CY's rule: blow up crossings where `(a_{D₁} − b_{D₁})(a_{D₂} − b_{D₂})` is negative and smallest, with the termination statement and its locator. New Check: `1/x`, `1/y`. The rule occurs nowhere else.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~1a/F04 (P3) — applied

Added to the `Suggested.lean` docstring: §10.2 (old 12.5), missing an associated graded ring of a filtered ring — none at the pins, only `IsRingFiltration`; and §10.5 (old 12.8), missing mixed Hodge modules, their direct images and `Π`. No declaration was added.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~1b/F01 (P2) — applied

Witness holds (FSY lines 47–51). New grouping: 8.1→6.7, 8.2→7.7; old Layer 9 + 12.1–12.3, 12.9 → Layer 8; Layers 10–11 → Layer 9; 12.4–12.8 → Layer 10. Target texts kept; surrounding sections and the former-numbering map updated (details below). SY15 Theorem 1.3(4) cited at §8.2; Sab18 Theorems 0.2(2), 0.3(2), 0.3(4) at §7.6.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~1b/F02 (P2) — applied

Witness holds (Sai90 lines 66–67, 98, 3217–3325). Conventions and §4.6 now define `MHM(X)` on every variety by affine-cover gluing (Checks: Hironaka threefold; node in `A²`/`A³`). §§5.1–5.2 cover every morphism (Sai90 Theorems 0.1, 4.3, §4.4), including proper purity via Chow's lemma (SchemeAndStackFoundations §4.12). Same pattern: §§8.3–8.4 now say quasi-projective.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~1b/F03 (P2) — applied

Confirmed at the EtaleDualityAndPerverseSheaves head: its §3.5 imports finite/ℓ-adic analytic categories (ComplexComparisonPartII §§C6.0–C6.6), and its §5.9 uses `D^b_c(X(ℂ), ℂ)` and the analytic heart; neither constructs them. Scope now says so and that Layer 1 constructs both; §1.3 gained the matching API bullet.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~1b/F04 (P2) — applied

Confirmed at Springer's head: §9.1 proves composition, identity, adjunction and proper-duality comparisons on holonomic complexes; §9.7 covers duality, smooth pullback and `j_!*`. The `gap:regular-holonomic-stability` needs line (README and `design/plan.json`) now asks only for stability under `f_+`, `f_!`, `f^†`, `⊠` and diagonal restriction.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~1b/F05 (P3) — applied

Confirmed. SchemeAndStackFoundations §3.3 and AlgebraicCurves Layers 9 and 12 were deleted from Scope and the contracts; the subsection is renamed "From TauCetiRoadmap.SchemeAndStackFoundations". §4.12 (`chow_lemma`) was added, which 1b/F02 uses. §4.17 was added to the §8.7 (old 12.1) Needs line and Dependencies clause.

## Checks run

- **Elaboration.** `lake env lean packages/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean`, run from the content checkout, exit 0. The only message is the warning that the headline theorem (line 157) uses sorry. No `TauCeti.*` import, so nothing to build.
- **`#check @name`.** All 13 declarations in one scratch copy, exit 0. The elaborated types are identical to `signatures.md`. `twistedDeRham_concentration_finrank` keeps `hfull` and `hnd` and agrees with README §10.3. No binder was lost or changed; only the docstring changed.
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve` on the README:** no cross-roadmap citation and no Lean name found nowhere.
- **Internal references.** A scan of every bare `x.y` reference found each one resolving to an existing `### x.y` heading. The remaining tokens are source theorem numbers or supplier sections. Every `§`-run of a supplier citation is unchanged by the renumbering: compared token-for-token with the pre-repair text.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §4.2 `V` with `x : V_α ≅ V_{α−1}` for `α < 1` | `O`; constant `U_α = O` | `V_0 = O`, `V_{−1} = xO`, `gr_0 = ℂ`; `x: V_{1/2} = O → V_{−1/2} = xO` bijective; at `α = 1`, `O → O` not onto. `U`: all `gr = 0`, `x : O → O` not onto | `U` excluded; true `V` kept |
| same | `δ_0`; `O(∗0)`; Kummer; `D/D(x∂)²` | `δ`: `V_α = 0` for `α < 1`, `V_1 = ℂδ`, `xδ = 0`. `O(∗0)`, Kummer: `x` invertible. `D/D(x∂)²`: `V_0 = Om_0 + Om_1`, `xV_0 = V_{−1}` | all satisfy it; no other Check changes |
| §3.4 Check | `P¹`, no puncture, `L = ℚ`; `P¹ ∖ {0, ∞}`, monodromy `−1` | `H⁰ = ℚ`, `H² = ℚ(−1)`; `j_* L = j_! L`, `χ = 0` so `H⁰ = H² = 0 = H¹` | hypothesis "≥ 1 puncture" needed; added |
| §8.10 blow-up rule | `1/x`, `1/y` | differences `1`, `−1`, product `−1`. Chart `y = xu`: `E = (1, 1)`, `D̃₂ = (0, 1)`, product `0`; sum `(u + 1)/(xu)`, zero transverse | one blow-up |
| same | `1/x²`, `1/y`; crossing `(0, ∞)` | products `−2`, then `−1`, then `0`; at `(0, ∞)`: `(1, 0)`, `(0, 0)`, product `0` | terminates; no spurious blow-up |
| §5.1 for all `f` | `a : P¹ → pt` over the cover `A¹ ∪ A¹` | Mayer–Vietoris: `H⁰ = ℚ`, `H¹ = coker(ℚ² → ℚ) = 0`, `H² = H¹(G_m) = ℚ(−1)` | agrees with §4.5 |
| §5.2 for all `f`, proper purity | smooth proper non-projective threefold; `G_m → pt` | `H^j a_* pℚ_X = H^{j+3}(X)`, weight `3 + j`; `H⁰ a_*` weight `2 ≥ 1`, `H⁰ a_!` weight `0 ≤ 1` | holds; nonproper `f` has no purity |
| §4.6 general `MHM(X)` | point in `A¹`/`A²`; node in `A²`/`A³`; `Spec ℂ[ε]/ε²`; Hironaka threefold | supported categories are equivalent (MHS for the point); nonreduced reduces to `MHM(pt)`; affine cover defines `MHM(X)` | consistent |
| §§8.3, 8.4 quasi-projective `U` | `(G_m, x)`, products | quasi-projective; Checks unchanged | statement now inside §8.1's domain |
| gap:regular-holonomic-stability | text of Springer §§9.1, 9.4, 9.7 at its head | §9.1: composition, adjunction, proper duality on holonomic; §9.4: no `f_+` stability | only stability is asked |
| Scope sentence (EtaleDuality) | §3.5 imports; ComplexComparisonPartII §§C6.1, C6.3–C6.6; §5.9 | finite and ℓ-adic only; §5.9 uses `D^b_c(X(ℂ), ℂ)` | sentence holds at the head read |
| §7.6, §8.2 citations | Sab18 lines 185, 196–205; SY15 lines 93–98 | 0.2(2) twist `MHM → IrrMHM`; 0.3(2) bistrict; 0.3(4) `E₁`. SY15 1.3(4): `H^j π_+ R_{F^irr}(N⊗E^f) = R_{F^irr}[(H^j π_+N)⊗E^h]` | statements as cited |
| Regrouped order | Needs of 6.7, 7.7, 8.1–8.10, 9.1–9.8, 10.1–10.5 | every cited target is earlier (e.g. 8.9 needs 8.7, 8.8, 7.x, 8.2, 8.3; 10.4 needs 8.7–8.9, 10.1, 10.3) | no forward Needs |
| Docstring bullets 10.2, 10.5 | pinned libraries searched for an associated graded ring, and for D-modules and MHM | none found | not statable; listed |

## For the maintainer

- **Renumbered sections.** Everything after Layer 7 is renumbered (§§8.1–8.2, 9.x, 10.x, 11.x, 12.x). The README's Former-numbering map has one row per moved id and remaps the lettered ids C, P, G, T and N.
  - No roadmap cites the old numeric ids 8–12 (`roadmaps grep`: MappingClassGroupsAndCanonicalRepresentations cites §§3.1–3.3 and 5.6; EllAdicHomotopyTypesAndWeights cites 5.1 and 5.2).
  - KloostermanMomentsAndPotentialAutomorphy and TopologicalMirrorSymmetryForHitchinSystems cite lettered ids, which resolve through the map.
- **Content repository PR.** The open content-repository pull request for this roadmap (#2279) carries an older text with different numbering. One must be rebased on the other before either merges.
- **TopologicalMirrorSymmetryForHitchinSystems.** Its `gap:geometric-compact-mhs` asks for the compact-support Hodge realization on separated varieties. At `f = 0` this is now met by §5.1 (`a_!` for every separated variety). Its character-projector and coefficient parts are not.
- **New sources.** SY15 and Sab18, fetched from arXiv and certified, recorded in `sources.toml`. No `needs-references.toml` was written.
- **Ownership.** Checked against open heads with `roadmaps grep` and on main. No other roadmap constructs mixed Hodge modules or the complex-coefficient constructible category, so this roadmap remains their owner.
- **No suspicious text** was found in the reviews or fetched sources.
