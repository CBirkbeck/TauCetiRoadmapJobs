# FIX-PKG-MotivesAndAlgebraicCyclesPartII~9

The five findings of `REV-PKG-MotivesAndAlgebraicCyclesPartII~8`. Each was checked against the mathematics and the cited sources, and all five are applied. Files changed: `packages/MotivesAndAlgebraicCyclesPartII/README.md` and `packages/MotivesAndAlgebraicCyclesPartII/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~8/F01 (P2) — applied

**What changed.** §10.1: "imposing étale descent … no unrestricted Galois hyperdescent is part of the definition" became "imposing étale hyperdescent, that is by localizing at the étale hypercovers …", with CD and Bachmann locators and no comparison with the Čech localization asserted. The API, §10.4 and §10.6 now say hyperdescent, and the §10.6 route proves it.

**Verified.** The definition said descent, while the route (README §10.1) and §10.2 say hypercovers. The sources that §10.2 rests on use hypercovers:
- Bachmann line 73 (p. 2) and lines 713–715 (§5, p. 13) build `SH_et(S)` from étale hypersheaves of spectra `SH(Sm^∧_{S,ét})`.
- Cisinski–Déglise lines 1149–1162 (Definition 2.2.2 and Proposition 2.2.3, p. 25): étale-local complexes are those that satisfy descent along étale hypercovers.
- Scholze line 2402 (Remark 11.2, p. 57) says only "étale descent".

The old clause "no unrestricted Galois hyperdescent" contradicted the route: Galois hypercovers of `Spec k` are étale hypercovers.

**Details of the repair.**
- §10.1 statement: hyperdescent as the review asked, in my own words, with the locators Cisinski–Déglise Definition 2.2.2 and Proposition 2.2.3 (p. 25) and Bachmann §5 (p. 13).
- §10.1 API, universal property: "satisfying étale hyperdescent". In the same sentence, "inverting the reduced `G_m`-object" became "sending the reduced `G_m`-object to an invertible object" and "a functor" became "a symmetric monoidal functor". The old wording was ambiguous. Witness: over algebraically closed `k`, `X ↦ ℤ[π₀(X)]` is symmetric monoidal, `A¹`-invariant and satisfies hyperdescent, but it sends the reduced `G_m`-object to `0`, which is not invertible. So it must not factor through `DM_et(k, ℤ)`, and the new wording excludes it.
- §10.1 *Needs*: added EnhancedDerivedSheaves §E2.6 (hypercovers; heading "E2.6 Hypercovers and descent" on main).
- Pattern repairs (other places that said "descent" for `DM_et`):
  - §10.4 route: "Generation uses étale hyperdescent".
  - §10.6 statement: the descent/hyperdescent clause was deleted; it now ends "A comparison over non-closed fields is not asserted."
  - §10.6 route: proves hyperdescent of `X ↦ ℤmot[X^arc]`. `Y ↦ Y^arc` preserves finite limits (§0.8), so matching objects go to matching objects. A surjective étale `Z′ → Z` goes to an epimorphism of arc-sheaves:
    1. The residue fields of a strict `B` are algebraically closed (§0.4), so each nonempty étale fibre has a `K(x)`-point.
    2. `K(x)` is the completed colimit of the strict factors `B_U` (for uniform `B`, the colimit seminorm is `inf_U sup_U |b| = |b(x)|`, and `B → K(x)` is onto).
    3. Finitarity (§2.7(a), which holds without quasi-compactness) lifts the point to some `B_U`.
    4. Compactness of `M(B)` gives the lift over a finite clopen partition.

    The objects of `Deff_mot` are hypercomplete (§1.2), and corepresentability (§2.7) then gives the colimit.
  - §10.6 *Needs*: added §§0.4, 1.2, 2.1 and EnhancedDerivedSheaves §§E2.6–E2.7. Layer 10 *Dependencies*: added EnhancedDerivedSheaves §§E2.6–E2.7.
  - References and `sources.toml`: CD and Bachmann gain these locators and `cited_for` "10.1".
- Unchanged: no other `DM_et` occurrence exists outside Layer 10. The other "étale descent" in the README (§7.3, profinite étale descent of K-theory) is about a different object.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~8/F02 (P3) — applied

**What changed.** Conventions: "*analytic* when finitely many topologically nilpotent elements generate the unit ideal, and *uniform* … (Definition 2.20)" became "*analytic* when … generate the unit ideal; equivalently, every completed residue field `K(x)` is nondiscrete (Scholze, Definition 2.17, p. 11)", with a proof of both directions. "*Uniform*" keeps Definition 2.20; References add 2.17.

**Verified.** Scholze line 462 (page 11; page markers at lines 435 and 477) is Definition 2.17 (residue fields nondiscrete). Line 509 (Definition 2.20, p. 12) defines only uniformity.

**Details of the repair.** The converse is proved more simply than the review proposed. If the topologically nilpotent elements lie in a maximal ideal `m`, then an element of norm `< 1` is topologically nilpotent, so `|a| ≥ 1` for every `a ∉ m`. The seminorm that is `0` on `m` and `1` off `m` is then multiplicative (`m` is prime) and bounded, so it is a point with discrete residue field `A/m`. This needs neither closedness of `m` nor spectral radii.

Pattern repairs:
- The same Conventions sentence cited "Definitions 2.1–2.2, p. 7". Definition 2.2 is at Scholze line 299, after the page-8 marker at line 295, so the locator now reads "pp. 7–8".
- The manifest's Scholze `locator` now includes Definition 2.17.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~8/F03 (P3) — applied

**What changed.**
- §§11.3, 11.5: the test ring `R` became `S` ("`μ_n(k) ⊗_ℤ S`", "`⊗ S`", "`S`-points").
- §11.3 and its Check: the coordinate ring is `H = ℚ[t, t⁻¹] ×_ℚ ℤ[1/p]`, with augmentation ideal `(t − 1)ℚ[t^{±1}] ≅ H ⊗ ℚ`.
- §11.5 route: "`ℤ[1/p] ⊕ tℚ[t]` … over `ℤ[1/p]` … cobar complex `ℤ[1/p]`".
- §11.6 opens by introducing `R = ℤ[1/p]`.

**Verified.** Before the edit, `R` was undefined at §11.3 (line 1254), was the ring `ℚ[t^{±1}] ×_ℚ ℤ[1/p]` (which contains `t` and `t⁻¹`) in the §11.3 Check, and was meant as `ℤ[1/p]` in §11.5. With the second reading, `R ⊕ tℚ[t]` is no subring of `ℚ[t]`.

**Details of the repair.** The review said §11.6 needs no change, but there `R` was first fixed implicitly inside a Check ("so `R = ℤ[1/3]`") and only made explicit in the route, after its uses. One clause now introduces it where §11.6 opens. After the edit, `R` in Layer 11 occurs only in §11.6, always as `ℤ[1/p]`.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~8/F04 (P3) — applied

**What changed.** The heading "### From TauCetiRoadmap.MotivesAndAlgebraicCycles, MotivicEtaleKTheory and other roadmaps on main" now reads "### From TauCetiRoadmap.MotivesAndAlgebraicCycles, MotivicEtaleKTheory and further roadmaps".

**Verified.**
- Content main `19ff3de` has no folder `TauCetiRoadmap/MotivesAndAlgebraicCycles`, `MotivicEtaleKTheory` or `AdicCoefficientsAndComparisons`. They are lines 92, 138 and 107 of `merge-order/ORDER.txt`; this roadmap is line 381.
- ProfiniteCohomology, SchemeAndStackFoundations, EtaleCohomologyFoundations, RepresentationTheory, CharacteristicClasses and MorseNovikov are on main.
- Pattern search: no other sentence in the README states that a roadmap is on main.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~8/F05 (P3) — applied

**What changed.**
- `sources.toml`, Scholze `cited_for`: "10.3", "10.5", "10.6" became "10.3-10.6", which adds §10.4 (Remark 11.2).
- Pattern repair: "Conventions" was also added, since it cites Scholze Definitions 2.1–2.2, 2.17 and 2.20 by locator.
- README "Corrections to the source": "(arXiv v3; the author's copy of 21 January 2026 has the same expressions at the same places)" became "(arXiv v3)".

**Verified.**
- The cached text is dated "January 23, 2026" (Scholze line 38) with the arXiv stamp of 22 January 2026 (line 40). No manifest entry records an author's copy.
- Per-section count of "Scholze" in the README: Conventions, 0.1–0.8, 1.1–1.7, 2.1–2.7, 3.1–3.5, 4.1–4.10, 5.1–5.4, 6.1–6.3, 7.1–7.7, 8.1–8.5, 9.1–9.8, 10.1, 10.3–10.6, 11.1–11.8, 12.1–12.4, Corrections, References. "Scope and ownership" names the paper without a locator.
- The other entries match their citing sections after this round:
  - CD: 10.1, 10.2, 10.4, 10.5 and Corrections.
  - Bachmann: 10.1 and 10.2.
  - vanDerPut: 4.2.
  - Vakil: 9.5.
  - BLR: 4.3.

## Checks run

- `lake env lean packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, run from the content checkout: exit 0, no output (15 s). The file is unchanged: `import Mathlib`, one module docstring and an empty namespace.
- Its headline list still holds after F01. §10.6 states `DM_et(k, ℤ) ≃ Dmot(k)` for algebraically closed `k`, and neither category exists at the pins.
- `#check @name` audit: the file declares nothing, so there is nothing to compare and nothing changed.
- Dependency check (`gate --depcheck … --movable`):

  ```text
  depcheck: 240 roadmaps, 2272 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line. The new *Needs* entries cite EnhancedDerivedSheaves §§E2.6–E2.7, which is on main.
- `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- The worker's earlier lead "`Perf.Spd` occurs nowhere" (README line 101) is a false positive. `Perf.Spd` is a target of DiamondsAndVStacks §D6.1 (its README, lines 258–261 on main), cited here as a supplier name, not as a pinned declaration.
- House-style sweep of the README for process words, LaTeX delimiters, "optional", "deferred" and "for later": no match.
- No gate failures were listed for this round.

## Adversarial pass (new and changed statements)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §10.1 definition (hypercover localization) | `M(A¹_k)`; `ℙ¹_k` by its Zariski cover; Artin–Schreier for `k = 𝔽̄₃`; finite Galois `k′/k`; Nisnevich wrong model at `k = 𝔽_p(t)` | `A¹`-invariance gives the unit; the Čech nerve of the two-chart cover is a hypercover, so `ℤ ⊕ ℤ(1)[2]`; `ℤ/3 = 0`; the Čech nerve of `Spec k′` is a hypercover, so `M(k) = M(k′)_{hG}`; Nisnevich `Hom(ℤ, ℤ/p(1)[1]) = k^×/p ∋ [t] ≠ 0` | The three Checks hold under hyperdescent, and the Nisnevich model is still excluded. No Check depends on Čech versus hyper. |
| §10.1 API universal property | `X ↦ ℤ[π₀X]` over algebraically closed `k`; Betti chains over `ℂ` | Reduced `G_m` goes to `0` (not invertible), so it must not factor; Betti: reduced `G_m(ℂ)` gives `ℤ[1]`, invertible, so it factors | The new wording "to an invertible object" separates the two; the old "inverting" was ambiguous. |
| §10.6 route: surjective étale → epimorphism | Kummer cover `x² = t` over `G_m`, `p ≠ 2`, at `B = C`, `B = Cont(S, C)` and `B = C⟨T^{±1}⟩` (non-strict); `G_m ⊂ A¹`; `⨿_ℕ Z → Z` | `√c` exists in `C`; a continuous branch exists locally on `S`, then on a finite clopen partition; `T` has no root in `C⟨T^{±1}⟩` (lift only arc-locally, as the claim allows); fibre over `0 ∈ A¹(C)` is empty, no lift (surjectivity needed); first copy lifts | Holds. Surjectivity is necessary, and lifts exist only on strict rings, which form a basis (§0.5). |
| §10.6: `K(x)` as completed colimit of `B_U` | `B = C × C`; `B = Cont(ℤ_p, C)`, `x = 0` | Colimit `C`; `inf` over balls of `sup|f|` is `|f(0)|`, completion `C` | Holds (strict rings are uniform and `B → K(x)` is onto, §0.4). |
| Conventions, "analytic" (both forms) | trivial `k`; `ℝ`; `ℚ_p`; `ℤ_p`; `ℤ` archimedean; zero ring; bounded product `∏ (ℚ_p, |·|_p^i)`; `A((T))_{1/2}` | `{0}`, point discrete: (fail, fail). `1 = 2·(1/2)`, `|1/2| ∈ (0,1)`: (hold, hold). `1 = p⁻¹·p`: (hold, hold). Ideal `(p)`, units have `|a| = 1 ≥ 1`, residue `𝔽_p`: (fail, fail). Top. nilpotent `{0}`, `m = (2)`, `|odd| ≥ 1`, residue `𝔽₂`: (fail, fail). `1 = 0`, `M = ∅`: (hold, hold). `|t_i|_i ≤ p^{−i}` gives `1 ≤ JM p^{−i}`, false; ultrafilter norms in `{0,1}`: (fail, fail). `1 = T⁻¹T`, `|T| = 1/2`: (hold, hold). | The two forms agree on all eight cases. |
| §11.3 `H` and the base change `S` | `S = 𝔽_ℓ`, `S = ℚ`, `S = 𝔽_p` | `H ⊗ 𝔽_ℓ = 𝔽_ℓ` (ideal rational, `Tor₁(ℤ[1/p], 𝔽_ℓ) = 0`), one line `μ_ℓ ⊗ 𝔽_ℓ`, a point; over `ℚ` no condition, `BG_m`; `𝔽_p` is no `ℤ[1/p]`-algebra, empty | Matches the API fibres. Augmentation ideal `(t−1)ℚ[t^{±1}] ≅ ℚ[t^{±1}]` is flat; Tor amplitude `[−1, 0]`. |
| §11.5 subring `ℤ[1/p] ⊕ tℚ[t]` | `p = 3`; products; generators | `1/2 ∉`, `t/2 ∈`; `(a + tf)(b + tg) = ab + t(ag + bf + tfg)`; `t^d/m = (t/m)·t^{d−1}`; with the old reading `R = H ∋ t⁻¹`, not inside `ℚ[t]` | Repaired reading holds; old reading confirmed defective. |
| §11.6 `R = ℤ[1/p]` | `p = 3`, `A = ℤ/2` | `A ⊗ ℚ = 0`, pair `(ℤ/2, 0)` | Unchanged Check, now with `R` defined beforehand. |
| Conventions locator, Definitions 2.1–2.2 | Scholze lines 287, 295, 299 | 2.1 on p. 7, 2.2 on p. 8 | Locator corrected to pp. 7–8. |

## Ownership

No new object or target was added: F01 sharpens the definition of `DM_et(k, ℤ)`, which this roadmap owns. Searching the open heads and main with `roadmaps grep --readme-only -i 'DM_et|DM_ét|étale motivic stable homotopy|SH_et\('` returns "no match on main or in any open roadmap pull request", so no second owner exists. No notion moved down from a later roadmap.

## For the maintainer

- No Lean name, section number, layer or target id changed. The only renamed heading is a supplier-contract subsection, which no roadmap cites.
- The §10.1 definition is now the hypercomplete étale localization, matching Cisinski–Déglise and Bachmann. A downstream roadmap that compares with a Čech-descent version of Voevodsky's étale motives over a non-closed field must supply that comparison itself; this roadmap asserts none.
- No source text was copied, and no new source was fetched: the new locators are in CD and Bachmann, which are already in the manifest and cache.
