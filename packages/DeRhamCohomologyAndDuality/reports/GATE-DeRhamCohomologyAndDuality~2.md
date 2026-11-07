# GATE-DeRhamCohomologyAndDuality~2 — answers to review of d5b0c05

One comment, by roed-math (cross-PR overlap check, 2026-11-06), makes three points. They are numbered
H01–H03 in the order they appear. The repairs are in commit `1b57dbe0` (not pushed). Only
`TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md` changed; `Suggested.lean` is unchanged.

## H01 (roed-math) — applied

The duplication is confirmed. At ComplexKahlerGeometry's revision head `ac2f5a7`, `TauCetiRoadmap/ComplexKahlerGeometry/README.md` lines 1953–1987 (K6.1, "Relative integration contract") build the complex `Ω^q(X) ⊕ Ω^(q−1)(W)` with differential `(α, β) ↦ (dα, α|_W − dβ)`, its integration map, the isomorphism, the relative chain comparison and the compact-support formula, and line 38–40 there says this roadmap restates them. Main's K6.1 (lines 1382–1398) builds none of them and cites them as "DG8.4's open-pair cone", "DG8.3's relative-chain comparison" and "DG9.3's compactly supported relative integration formula". DifferentialGeometry 8.3, 8.4 and 9.3 on main (README lines 838–880) plan only the absolute theory.

The single owner is this roadmap, for two reasons. The objects belong to general de Rham theory, and this roadmap needs them in more generality than K6.1's boundaryless contract: §4.2 applies §3.3's relative class (README line 566) and §2.4's comparison to compact manifolds with boundary. Hence README line 72: a new Scope paragraph names §§2.4, 3.1–3.3 and 4.1 as having a single owner, this roadmap, says why they are stated over models with corners, and names K6.1's open-pair comparison as their boundaryless instance, consumed from those sections.

Pattern repair: §4.1's second bullet (old: "for noncompact `N`, compactly supported top forms evaluated on … compact-support classes", with no equation) did not state the formula K6.1 needs, and it excluded compact `N` without reason. New (line 519): for every oriented `N`, compact or not, every compact `K` and every smooth top form `η` vanishing outside `K`, `∫_N η = ⟨ℐ_K[η], [N]_K⟩`. Here `ℐ_K[η]` is §3.2's class of `(η, 0)` for the pair `(N, N ∖ K)`, and the case `K = N` is the first bullet. A new bullet (line 527) gives independence of `K` from AlgebraicTopology 6.3's support-enlargement law (main AlgebraicTopology README line 1329) and §3.2's naturality. That law is added to the AlgebraicTopology 6.3 supplier contract (line 184). The ℝ Check of §4.1 now names the representing simplex `t ↦ 4t − 2` and the computed values (line 555). §3.3's *Needs:* line now lists §2.4, which its route uses (line 492).

## H02 (roed-math) — applied

Both labels come from this pull request's first head `101fd8f`. There, DR.3.8 was "Relative de Rham theory": the complex, the cone-to-kernel comparison, relative integration and the isomorphism, now §§3.1–3.3. DR.4.4 was "Integration against fundamental classes", now §4.1. The later recast into numbered sections dropped both labels, but ComplexKahlerGeometry's revision head `ac2f5a7` (line 38) still cites them. The README now records the correspondence in *Downstream consumers* (line 702): "Citations of these targets as DR.3.8 and DR.4.4 refer to §§3.1–3.3 and §4.1 here". The citation on the ComplexKahlerGeometry side still has to be changed in that roadmap to §§2.4, 3.1–3.3 and 4.1.

## H03 (roed-math) — applied

*Downstream consumers* (line 695) changes from "§§3.1–3.2 … §2.4 … §4.1" to "§§2.4, 3.1–3.3 and 4.1". This now matches the Scope paragraph and the sections the reviewer proposes. Each clause of K6.1's contract at `ac2f5a7` (lines 1955–1987) is now matched to a section that states it:

| K6.1 contract clause | section here |
|---|---|
| relative form complex, negative degrees zero, differential | §3.1 |
| integration to the shifted cochain cone, then to relative singular cohomology; restriction of forms not assumed surjective | §3.2 |
| isomorphism via the two absolute comparisons and long exact sequences | §3.3 |
| relative smooth/continuous chain comparison | §2.4 |
| naturality for smooth maps of open pairs; image of `(α, 0)` in absolute cohomology | §3.2 |
| compatibility with enlargement of `W` | §3.3 |
| compact-support formula on `H_n(X, X ∖ K; ℤ)` | §4.1 (bullet 2, now stated) |
| compact absolute case; dimension-zero sign; open embeddings | §4.1 (bullet 1; dimension zero; embeddings) |
| support enlargement | §4.1 (bullet 3, new) |

## Adversarial pass on the changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| §4.1 bullet 2, `∫_N η = ⟨ℐ_K[η], [N]_K⟩` | `K = ∅` | `η = 0`, `H_n(N, N) = 0`: `0 = 0` | holds | — |
| same | `n = 0`, `N` signed points, `K` finite | relative complex in degree 0 is `Ω⁰(N)`, cocycle condition `η|_(N∖K) = 0`; `H₀(N, N∖K) = ℤ^K`, class `Σ ε(x)[x]`: both sides `Σ_(x∈K) ε(x) η(x)` | holds | — |
| same | `N = ℝ`, `K = [−1, 1]`, `η = ψ dx`, `∫ψ = 1` | simplex `t ↦ 4t − 2`, boundary `[2] − [−2] ⊂ ℝ ∖ K`: `∫_(−2)^2 ψ dx − 0 = 1 = ∫η` | holds | Check rewritten |
| same | `t ↦ 2t − 1` as candidate class | endpoints `±1 ∈ K`: no relative cycle | excluded | Check |
| same | absolute image instead of relative class | `deRhamHom [ψ dx] ∈ H¹(ℝ; ℝ) = 0`, so an absolute reading gives `0 ≠ 1` | relative class necessary | Check |
| same | compact `N = S¹`, `K = N` | `(N, ∅)`; `ℐ_N = deRhamHom` (§3.3, `W = ∅`), `[N]_N = [N]`: `2π = 2π` | reduces to bullet 1 | clause added |
| same | orientation reversed | both `[N]_K` and `∫` change sign | holds | — |
| same, old wording "for noncompact `N`" | compact `N`, `K ⊊ N` (`S¹`, `K` an arc) | formula holds equally; nothing needs noncompactness | old restriction unjustified | dropped |
| §4.1 bullet 3, independence of `K` | `K = [−1, 1] ⊆ K′ = [−3, 3]` | simplex `t ↦ 8t − 4`: value `1` again | holds | Check |
| same | `K = ∅ ⊆ K′` | `η = 0`: `0 = 0` | holds | — |
| same, directions | `g = id : (N, N∖K′) → (N, N∖K)` | `g_*[N]_K′ = [N]_K` (AT 6.3, main line 1329, written `(U,U∖K′)→(U,U∖K)`); `g^*ℐ_K[η] = ℐ_K′[η]`; Kronecker naturality gives equal pairings | directions consistent | — |
| Scope single-owner paragraph | does §4.2 need corners? | §4.2 (line 565) uses §3.3's `ℐ[α, β]` on `M` over `𝓡∂ m`, `m > 0` | yes | — |
| same | DifferentialGeometry 8.3/8.4/9.3 on main | 8.3 smooth chains + absolute smoothing; 8.4 `deRhamHom`; 9.3 `poincareDuality`; no open pair, no relative integration | absolute only | — |
| AT 6.3 contract, support-enlargement law | main AlgebraicTopology line 1329 | "support enlargement `(U,U∖K′)→(U,U∖K)` for K⊆K′" among AT 6.3's class laws | exists at main | contract line added |
| §3.3 *Needs:* | route text | "§2.4's relative comparison and the five lemma" | §2.4 used, not listed | added |
| Downstream note | each clause against `ac2f5a7` lines 1955–1987 and main lines 1382–1398 | see H03 table; main's `chainIntegral_map` and enlargement uses map to §3.2 naturality and §3.3 enlargement | all covered | rewritten |

## Signature check

`#check @name` lines for all eight declarations were added to `Suggested.lean` for one build only, then removed (the file is byte-identical to `d5b0c05`). The elaborated types match the README statements. Every needed binder is in the declaration's own signature: `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]` on `exists_smooth_inward_deformation`, the four `FiniteDimensional` binders and `[μ.IsAddHaarMeasure]` on `addHaar_setOf_not_isRegularIncidenceParameter`, and the three `FiniteDimensional` binders on `exists_isRegularIncidenceParameter_relativeTranslate`. `incidenceEquation` keeps only `[NormedAddCommGroup V]`, which is enough for its body. Nothing changed.

## Ownership, overlaps, sources

- Ownership was checked by object across main and all open heads, searching for "relative integration", "open-pair cone", "Relative integration contract", "relative de Rham" and the labels DR.3.8/DR.4.4. The only second builder is ComplexKahlerGeometry's revision head `ac2f5a7` (K6.1). Other ComplexKahlerGeometry heads (`f44628f`, `beeacfb`, `5c83375`) and main only consume these objects under DifferentialGeometry labels. The algebraic "relative de Rham" hits in AbelianSchemesAndArithmeticModuli and CrystallineCohomology are different objects.
- No ComplexKahlerGeometry head is in the merge order; it is on main and its open heads are revisions, so it is never a supplier here. This roadmap consumes nothing from ComplexKahlerGeometry, so the direction is this roadmap → ComplexKahlerGeometry with no cycle.
- No new source is cited. `lee` and `bott-tu` remain uncertified locators, unchanged, and nothing was added to `needs-references.toml`.
- `roadmaps resolve` on the edited README finds no cross-roadmap citation or Lean name that resolves nowhere.

Depcheck output:

    depcheck: 239 roadmaps, 2349 edges, 0 problem(s)

## Build and gate

`lake build TauCetiRoadmap.DeRhamCohomologyAndDuality.Suggested`: exit 0, "Build completed successfully (8988 jobs)", with the four `declaration uses 'sorry'` warnings at lines 54, 73, 109 and 122 and nothing else.

Gate (on commit `1b57dbe0`):

    gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
