# FIX-RT-DiamondsAndVStacksPartII~2: red-team round 2 repaired

Findings of the two red-team reviews of round 2 (pass a, codex; pass b, claude), settled on the mathematics. Files touched: `packages/DiamondsAndVStacksPartII/README.md`, `packages/DiamondsAndVStacksPartII/Suggested.lean` (docstrings only), `packages/DiamondsAndVStacksPartII/design/plan.json` (top-level `gaps` only), `packages/DiamondsAndVStacksPartII/sources.toml` (one new entry).

## RT-DiamondsAndVStacksPartII~2a/F01 (P2) — applied

D9.1: target "Spec(A⁺_red) with A⁺_red = (A⁺/A⁺·A⁺°°)^perf" for every Tate pair → target Spec(A⁺/A°°) = V(A°°) ⊂ Spec A⁺ (BHA17 line 2887); perfection only when p ∈ A°°. Same change in the API bullet, the functoriality bullet (f̄⁺ : B⁺/B°° → A⁺/A°°), both Lean docstrings, and Conventions (formal pairs now explicitly ℤ_p-algebras with p in the ideal of definition, so A_red is defined). New Check: (ℚ((t)), ℚ[[t]]) has target Spec ℚ, one point to one point, and 4 ≠ 2 in ℚ. Lean bodies unchanged.

## RT-DiamondsAndVStacksPartII~2a/F02 (P2) — applied

Verified: AdicSpacesPartIII F0.3 *adic-systems-equivalence-finite-ideal-type* on main (its README lines 1411–1440) has no noetherian hypothesis and contains the étale-lift example over Spf O_K; SchemeAndStackFoundations §0.23a is unrestricted. D9.12 proof: "completed henselian lifting (gap:completed-etale-lifts)" → transport along perfection and the nil-ideal quotient (§§0.23a–0.24), lift to an adic system over R⁺/ϖⁿ⁺¹, F0.3's equivalence gives the unique formal scheme adic over Spf R⁺ with étale thickenings and the morphism part gives uniqueness, localization and gluing. D9.12 Needs and the D9 Dependencies updated; the gap paragraph and the plan's gap entry removed; the now-unused §0.14 clause of the SchemeAndStackFoundations contract dropped. D9.12 does not depend on D9.14.

## RT-DiamondsAndVStacksPartII~2b/F01 (P2) — applied differently

Verified: SchemeAndStackFoundations §0.21 on main has `regular_map_completion` and `IsGRing` but no henselization permanence; the strict henselization carrier is ModularCurves 4D on main (noetherianity, completion). D10.11 lemma (3): inline "André's theorem" → the completed local ring of A_Ŏ at 𝔫 is (R^sh)^∧ for R = Â_𝔪 (cofinal finite étale local factors of R ⊗ O_(E_r), union of residue fields k̄); R^sh is a normal noetherian local domain (étale stages over the normal R); R is a G-ring, R^sh is a G-ring by the new gap, so R^sh → (R^sh)^∧ is regular and the completion is normal. Differently: the reviewer's Stacks tag 0C22 is Algebra Lemma 163.8 (flat with normal fibres), not the henselization lemma; the correct locator is More on Algebra Lemma 15.51.8, tag 07QR (STACKS line 5992), fetched through the sources service and recorded as `STACKS` in `sources.toml` and in References. Gap `strict-henselization-g-ring` (SchemeAndStackFoundations §0.21) added to the contracts, to `design/plan.json`, to the D10.11 Needs and the D10 Dependencies; ℤ_p Check extended with R^sh = ⋃_r W(𝔽_(p^r)) and its completion W(𝔽̄_p).

## RT-DiamondsAndVStacksPartII~2b/F02 (P2) — applied

Verified at the GeometricSatakeAndFusion head (140b5a7, unchanged): §0.37 defines only the reduced admissible locus; §4.17 constructs 𝓜 as the v-closure of the generic Schubert bound; §4.18 the functoriality. README lines 15, 124, the D10.15 statement, its Needs and the D10 Dependencies: "GS0, Bounded admissible affine flag loci" → "§4.17, Integral local models and admissible special fibres" and "§4.18, Functoriality of integral local models"; §0.30 and §0.32 kept. GeometricSatakeAndFusion is line 147 of the merge order, this roadmap line 149.

## RT-DiamondsAndVStacksPartII~2b/F03 (P3) — applied

Verified: AGLR lines 532–533 take centres x ∈ T_C(C). D10.9 Check: "complement of all open residue discs centred on the torus" → complement of the open residue classes ⋃_n {|fⁿ| ≤ |ϖ|} of all closed points of 𝔾_(m,k_C) (f a monic lift of an irreducible polynomial ≠ T); C-centred discs only for C algebraically closed; the 𝔽₂((u)) witness α (α² + α + 1 = 0) recorded as the negative control. Recomputed: the smallest closed weakly generalizing set containing |D| is |D| ∪ {η} ∪ {η_P : P closed}, whose complement is the union of those open residue classes; for sp⁻¹(0) = |D| ∪ {η_0} nothing is removed.

## RT-DiamondsAndVStacksPartII~2b/F04 (P3) — applied

`roadmaps grep --fixed`: `Arc.VCover`, `Arc.Cover.ofVCover`, `PerfectScheme.vTopology` match nowhere on main or at any open head. Backticks dropped and the three supplier contracts and the five repeated D8 sentences now cite PrismaticCohomology §2.0 and SchemeKTheoryOperations §4.10 by section in prose. `FormalScheme.FSC` and `rigOfFSC` were checked and do exist (AdicSpacesPartIII README on main, lines 7723 and 7736); unchanged.

## Checks

- Elaboration: `lake env lean` on `packages/DiamondsAndVStacksPartII/Suggested.lean` from the content checkout: exit 0, one warning "declaration uses `sorry`" at line 72 (the theorem). The import warning ("imports `Mathlib` from package `mathlib`, which is designed for use with the module system") no longer appears. Imports unchanged (`import Mathlib`, two `TauCeti.*` modules already built).
- `#check @reductionSpectrum` and `#check @exists_tate_specialization` in a scratch copy: elaborated types identical to those before this round (`{A : Type u_1} → [CommRing A] → [TopologicalSpace A] → (Aplus : Subring A) → Set (PrimeSpectrum ↥Aplus)`; `∀ {A} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [Huber.IsTateRing A] (P : Huber.Pair A), ∃ sp, (∀ x a, a ∈ (sp x).1.asIdeal ↔ x.valuation a < 1) ∧ Surjective sp ∧ IsSpectralMap sp ∧ IsClosedMap sp`). No section variables; nothing dropped. Only docstrings changed and they now match the README (target Spec(A⁺/A°°)).
- Dependency check: `depcheck: 236 roadmaps, 2156 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. ModularCurves is on main (not in the merge order), GeometricSatakeAndFusion is at line 147, this roadmap at 149.
- `roadmaps resolve`: no Lean name found nowhere; the only lead is the downstream consumer GeometricSatakeAndFusionPartII (consumer only, unchanged).
- Gap slugs: 10 in `design/plan.json` and 10 in the README contracts, identical sets.

## Adversarial pass on new text

| Statement | Instances | Values | Result |
|---|---|---|---|
| D9.1 target Spec(A⁺/A°°) | (ℚ_p, ℤ_p); (ℚ((t)), ℚ[[t]]); zero ring; (C, C⁺) rank two | Spec 𝔽_p, 1 → 1; Spec ℚ, 1 → 1 (only valuation rings over ℚ[[t]] are itself and the field); ∅ → ∅; 2 → 2 primes over m_C | holds; Frobenius on ℚ: 4 ≠ 2, so perfection is confined to p ∈ A°° |
| A°° an ideal of A⁺ | Tate A, A⁺ ⊂ A° | A°° ideal of A°, A⁺ ⊇ A°° | holds |
| Conventions: formal pairs over ℤ_p | 𝔽_p[[u]] discrete; ℤ_p; 𝔽_p[t] discrete | p = 0 ∈ (0); p ∈ (p); p = 0 | A_red defined in all three |
| D9.12 route | identity datum; two copies; R⁺ = O_C (nonnoetherian) | systems Spec(R⁺/ϖⁿ⁺¹), two copies; limits Spf R⁺, Spf(R⁺ × R⁺); extra ordinary factor R⁺[1/ϖ] has zero reduction and zero completion | holds without the removed gap |
| D10.11 (3): residue field of 𝔫 | κ = 𝔽_(p²), k = 𝔽_p | κ ⊗_k k̄ = k̄ × k̄, each factor k̄ | holds |
| (A_Ŏ)^_𝔫 = (R^sh)^∧ | A = ℤ_p | R^sh = ⋃ W(𝔽_(p^r)), not complete; completion W(𝔽̄_p) = Ŏ | holds |
| R^sh normal domain | R = ℤ_p[√p] (ramified, normal) | stages W(𝔽_(p^r))[√p], normal; colimit normal | holds; ramification irrelevant to this step |
| R^sh G-ring | R complete local | Stacks 07QR hypotheses: R noetherian local G-ring (07PS) | supplied by the gap, not proved here |
| D10.9 Check, residue classes | C alg. closed; C = completed perfection of 𝔽₂((u)) | all closed points rational, discs {|T − a| < 1}; α excluded by the degree-two class, kept by C-centred discs | holds; AGLR Example 2.5 restricted as stated |
| D10.15 supplier sections | G = GL(Λ), μ_d; d = 0 | §4.17 model Gr(d, Λ)^♢, §4.18 identity map; Spec O_E | holds |

## Gate failures repaired

- Warning "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`" (reported twice, once per elaboration): the file now begins with the line `module` followed by a blank line, as `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` on main does. Nothing else in the file changed: the imports are still the single `import Mathlib` and the two `TauCeti.*` modules, no `set_option`, no `public` or `import all` modifier. Elaboration after the change: exit 0, only the `sorry` warning at line 72. The dependency check was re-run after the edit: `depcheck: 236 roadmaps, 2156 edges, 0 problem(s)`.

## For the maintainer

- The GeometricSatakeAndFusion v-closure ordering remark of round 1 stands (its §4.17 forms a v-closure while D10.9 is later in the merge order); not re-raised, not actionable here.
- The reviewer's suggested Stacks tag 0C22 is not the henselization G-ring lemma; the gap cites tag 07QR. The `STACKS` manifest entry records `more-algebra.pdf` through the sources service.
- Ownership against open pull requests was checked with `roadmaps grep` for the three names and for strict-henselization G-ring permanence (no roadmap states it: ModularCurves 4D supplies the carrier, SchemeAndStackFoundations §0.21 the G-ring API); the gap is addressed to §0.21.
- No new sorried declarations; `Suggested.lean` signatures unchanged, so no name other roadmaps cite changed.
- No suspicious instructions in either review.
