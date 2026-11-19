# GATE-HardSphereDynamicsAndKineticLimits~1: answers to human review

One review answered (kim-em, 2026-11-19T00:54:10Z): six requested changes (H01–H06) and two
non-blocking suggestions (H07–H08). Repairs are in commit `6ffdf49d` on the pull-request branch
(not pushed). Only `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits/README.md` changed;
`Suggested.lean` is unchanged.

## H01 (kim-em) — applied

The unnamed "roadmap on the BBGKY hierarchy" is now named BoltzmannGradLimitAndLanford with its §5.2 in five places: the overview (README line 13), §10.4 (line 893, "its proof … is the end theorem of BoltzmannGradLimitAndLanford, §5.2"), the §10.4 Check for `d = 0` (line 905), Downstream consumers item 1 (line 935) and the third Scope paragraph (line 954). The Downstream item now lists the sections that roadmap consumes, read from its README at head 993b517: §1.1, §1.3, §2.1, §3.2, §3.4, §4.1, §7.1, §7.2, §8.3, §9.3–9.6 and §10.2–10.4. It is named only as a consumer (no *Needs:* line, no supplier contract), so depcheck still reports no edge problem.

## H02 (kim-em) — applied

Applied as the reviewer's first option: structure independence is now a target of §10.4 (README line 895). For any two structures `S`, `S'` of §1.1 on `𝕋^d` with the §1.3 norm, σ-algebra and measure, `LanfordStatement d` holds for `S` exactly when it holds for `S'`. The route moved there from the Check: every cover is `π ∘ B` for a linear isometry `B`, and the flow, the correlation functions and mild solutions are conjugated by `(X, V) ↦ (X, BV)`. The old Check (line 908) is now a computed witness at the quarter turn: normal `(1, 0) = B⁻¹(0, 1)`, and `σ_{(1,0)}((−1,0),0) = (0,(−1,0)) = B⁻¹σ_{(0,1)}((0,−1),0)`; the unconjugated normal would treat the pair as grazing. The §10.4 *Needs:* line gains §2.1, §3.3, §3.4, §5.1, §7.1 and §9.3.

## H03 (kim-em) — applied

§6.4 (README line 518) now states the side condition `ε + 4Rt/m < ρ` and proves the converse inclusion with the reviewer's three steps:
- velocities stay in `{|V| ≤ R}`;
- when `N ≥ 3`, the matching condition and continuity of positions on the compact `[0, t]` give a uniform margin `η₀` over ε for each particle's second-nearest distance; take `2Rt/m < η₀`;
- step-time contacts are outgoing, and a tangency of a near pair within a step would be a grazing contact. Condition (5) excludes both.

The step map then follows the trajectory by §6.2 and §5.2. §5.1 is added to the *Needs:* line.

## H04 (kim-em) — applied

§7.3 (line 576): "Prove, for `0 < ε < ρ`, equivariance under relabelling …" → "Prove, for every real ε, …", with the route on `G` named (§5.1–5.3). Galilean covariance on `G` likewise now holds for every ε, and only its almost-everywhere consequence keeps `0 < ε < ρ`. The same defect recurred in §5.3 and §5.5, which the §7.3 route uses, so both are repaired:
- §5.3 (line 408): "Time translation and time reversal hold for every real ε" → "All five hold for every real ε", with the reason. Relabelling permutes the conditions, translations and boosts change no difference of positions or velocities, and all three commute with `σ_M`, by `σ_ν(v + c, w + c) = σ_ν(v, w) + (c, c)` for every ν.
- §5.5 (line 448): the invariance of `G` under relabelling, translations and boosts is now stated for every real ε.

The Conventions list of every-ε statements (line 26) now includes these, and conservation of `P` and `H` along trajectories (§5.1). Witness for ε = −1, on `E` with d = 1, `x = (1, 0)`, `v = (−1, 0)`: `T_3` is free transport, with positions `−2, 0`, `P = −1` and `H = 1/2` conserved.

## H05 (kim-em) — applied

The §7.4 route and *Needs:* line (line 590) now cite `MeasureTheory.Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` for the `[μ.Regular]` hypothesis of `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`. The phase space is proper, hence σ-compact, and `λ_N|𝒟̄` is locally finite. The Mathlib contract (line 984) gains the entry and notes that `MeasureTheory.Measure.Regular.restrict_of_measure_ne_top` does not apply. All three names were checked at the pinned Mathlib:
- the density lemma is at `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142` and needs `[μ.Regular]`;
- the regularity instance is at `Mathlib/MeasureTheory/Measure/Regular.lean:1183`, in namespace `MeasureTheory.Measure`;
- `restrict_of_measure_ne_top` is at `Regular.lean:1164` and needs `μ A ≠ ∞`.

## H06 (kim-em) — applied differently

The house format of locators is `<source id> line N`, so the line numbers stay. The reviewer's second option (say once in References which text they refer to) is applied, extended so every locator can be found. A new paragraph (README line 1027) says the line numbers count a plain-text rendering of the arXiv version listed, and that other renderings number lines differently. It then lists, for every page that contains a cited line, that page's line range and the page number printed on it: 15 pages of GST2013, 8 of BGSS2023, 4 of DengHaniMa2024. For example, BGSS2023 lines 290–349 are p. 4, which places Theorem 1 (lines 316–321) on printed p. 4.

A script checked that every one of the 128 README and 49 `Suggested.lean` line locators falls in a listed range. The existing "printed p." mentions agree with the key: GST2013 lines 835–847 on p. 27, BGSS2023 lines 241–266 on p. 3, BGSS2023 lines 158–160 on p. 2. A local `pdftotext` run put Theorem 1 at line 292, the cache says 316 and the reviewer found 395. That spread is why a statement of the text alone would not be enough.

## H07 (kim-em) — answered

The general fact is right: a jointly measurable, measure-preserving flow on a standard Borel space with a σ-finite measure has a strongly continuous Koopman group on `Lp`, `1 ≤ p < ∞`. It belongs to ClassicalErgodicTheory, which at its head e3c51083e states strong continuity only for finite measures (§0.2). This roadmap does not wait for another roadmap. §7.4 stays a target with its hard-sphere route and becomes a citation if ClassicalErgodicTheory adds the σ-finite statement. That change, and the request to its author, lie outside this pull request.

## H08 (kim-em) — answered

The topic is the author's choice, as the reviewer says, and it lives in `metadata.toml`, which this job may not edit. `math.AP` stays (`topic = "math.AP"`). The headline results (the Liouville equation, mild solutions of the Boltzmann equation, Lanford's theorem) are kinetic PDE, which `math.AP` covers.

## Gate repair outside the review

At head 4861d7d the gate failed with `tex=3` on overview lines 9 and 11, which this job had not touched. The three exponents `μ^{−n}`, `f(t)^{⊗n}` and `f^{⊗n}` stood outside code spans; they are now in backticks. No wording changed.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §10.4 structure independence | d = 0; d = 1, `B = −1`; d = 2, quarter turn; two radii with one cover | d = 0: `E` is a point, so every radius in `(0, ∞]` satisfies §1.1 and the bound `ρ' ≤ 1/2` of the old Check fails; the conclusions only use ε → 0⁺, so the radius is not needed. Quarter turn: `B⁻¹(0,1) = (1,0)`; `σ_{(1,0)}((−1,0),0) = (0,(−1,0))`; `B⁻¹σ_{(0,1)}((0,−1),0) = B⁻¹(0,(0,−1)) = (0,(−1,0))`; unconjugated normal `(0,1)`: `⟨(−1,0),(0,1)⟩ = 0`, a grazing contact, unchanged. Radii 0.1 and 1/2 with one cover give different flows for ε ∈ [0.1, 0.5) and the same for ε < 0.1 | The old claim fails at d = 0; independence holds | Radius bound dropped from the route; "ε below both radii" |
| §10.4 linear extension of the cover | `a, a', a + a'` in `B(0, 1/4)` | lifts have norms < 1/4 and < 1/2, difference < 3/4 < 1 = shortest nonzero vector of `ℤ^d` (none at d = 0) | holds | — |
| §10.4 `|det B| = 1` | ball `B(0, r)`, `r < min(ρ', 1/4)` | `vol(B(A)) = |det B| vol(A)` and the local axioms give `vol(B(A)) = vol(A)`, so `|det B| = 1`; `‖B‖ ≤ 1` then forces every singular value to be 1 | holds | — |
| §6.4 converse inclusion | N ≤ 2; N = 3, d = 1, ε = R = t = 1, positions 0, 1.5, 3 at rest; N = 2, d = 2, `a = (2,1)`, `u = (−1,0)`, t = 1 and t = 3 | N ≤ 2: nothing to show. N = 3: `η₀ = 0.5`; m = 5 gives `ε + 2Rδ = 1.4 < 1.5`, passes; m = 4 gives 1.5, which is within 1.5 of two particles, fails, so m must be large. Grazing pair: a trajectory exists on [0, 1] and passes every step (tangency at time 2); none exists on [0, 3], and step 1 of size 1 fails, as in the §6.3 Check | holds | `N ≥ 3` qualifier added |
| §5.3 symmetries for every ε | ε = −1; ε = 0; unit circle with ε = 1/2, N = 2; boost with ν = (1, 0), `v = (−1,0)`, `w = 0`, `c = (1,0)` | ε = −1: free motions only. ε = 0: normal 0, so (5) forbids coincidences. Circle: every point of `𝒟̄` is a contact with normal 0, so there is no trajectory and the statement is vacuous. Boost: `σ_ν((0,0),(1,0)) = ((1,0),(0,0)) = σ_ν((−1,0),0) + (c, c)` | holds | — |
| §7.3 for every ε | ε = −1, `E`, d = 1, `x = (1,0)`, `v = (−1,0)`, t = 3, c = 1 | `T_3 Z`: positions −2, 0, velocities unchanged, `P = −1`, `H = 1/2`; swapping labels commutes; boost: `T_3(X, V + 1) = (X + 3(V + 1), V + 1) = (X' + 3, V' + 1)` | holds | — |
| §7.4 regularity | N = d = 1 on the unit circle; N = 8, ε = 0.4, unit torus, d = 2 | first: σ-compact, ball of radius 1 has mass 1 · 2 = 2, total mass ∞, so `restrict_of_measure_ne_top` does not apply and the instance does. Second: `𝒟̄ = ∅`, mass 0 | holds | "in general infinite" |
| References page key | BGSS2023 Theorem 1; GST2013 (4.1.1)–(4.1.2); BGSS2023 (1.1.9) | 316–321 lie in 290–349, p. 4 (running head "4 CHAPTER 1"); 835–847 lie in 826–856, p. 27; 241–266 lie in 196–288, p. 3; no locator outside the key (script) | holds | — |
| BoltzmannGradLimitAndLanford §5.2 | its README at head 993b517 | Summary: "for every dimension `d ≥ 2`, the proposition `HardSphere.LanfordStatement d` … holds"; §5.2: "Prove `HardSphere.LanfordStatement d` for every `d ≥ 2`" | matches | — |

## Suggested.lean and signatures

`Suggested.lean` is unchanged, so there was no new `#check @name` run. Instead I compared the elaborated types in the worker's `signatures.md` with the README statements. All 23 "looks dropped" flags are heuristic artifacts: the binders appear under their qualified names (`MeasureTheory.MeasureSpace X`, `TauCetiRoadmap.HardSphereDynamicsAndKineticLimits.FlatPositionSpace d X`). `partitionFunction`, `grandCanonicalDensity` and `grandCanonical` keep only `[MeasureSpace X]` on purpose, matching README §9.3 ("every normed additive commutative group `X` with a measure").

## Ownership, citations, sources

- Ownership: the only new object is a target, the structure independence of this roadmap's own proposition. This roadmap owns it, and its consumer expects it from its supplier: BoltzmannGradLimitAndLanford §5.2 Check, "checking only the canonical structure without the supplier's structure-independence result leaves that quantifier unproved".
- `roadmaps resolve` on the README finds no unresolved cross-roadmap citation and no unresolved Lean name.
- No new source was needed and `needs-references.toml` is not written. Every locator added cites the three cached sources, or a printed page read from their page markers.

## Dependency check

```
depcheck: 199 roadmaps, 2186 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Build and gate

`lake build TauCetiRoadmap.HardSphereDynamicsAndKineticLimits.Suggested`: `Build completed successfully (18239 jobs).` The only warnings are the 11 `declaration uses 'sorry'`.

Gate, after the commit:

```
gate HardSphereDynamicsAndKineticLimits: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```
