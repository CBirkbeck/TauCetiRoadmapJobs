# Review of ArakelovGeometryAndAbelianHeights (pull request #3027 at f93f554)

**Verdict:** accepted

**Summary.** An incremental re-review of the 11 lines changed since `e7914b5`, all in the module docstring of `Suggested.lean`, together with the pull request's title and description. The new docstring bullets repair the previous C02, and both claims they make about the pinned Tau Ceti are true at the pin. There is no finding. Two small corrections (the description's account of this folder, one locator in untouched text) and two format notes remain, none blocking; one question is left for the human reviewers, the "Corollary of" convention under which a family roadmap restates sections of this one.

## C01 — The description's account of this folder leaves out Mumford's good metrics (§§5.1a–5.1d), the new layers by name, and the suppliers the folder gains

The description says of this roadmap only that it receives "slopes of Hermitian vector bundles, heights", and that it newly supplies SingularHermitianMetricsAndL2Methods and ThetaChainsAndFrobeniusPrimeSums. A reader does not learn that the revision adds two layers (1A and 1B) and 25 headings, that the folder now owns Poincaré growth, good forms, good metrics and their Chern forms (§§5.1a–5.1d, which SingularHermitianMetricsAndL2Methods cites at its lines 48 and 1613), nor which suppliers it gains. Text that would be right: "ArakelovGeometryAndAbelianHeights gains symmetric powers and the Gram and adelic degree formulas (§§1.2a–1.6a), Layers 1A–1B (heights of linear maps, maximal and minimal slopes, Bost's slope inequality, the Harder–Narasimhan filtration and its base change) and Mumford's good metrics (§§5.1a–5.1d); no section is removed or renumbered. Its new suppliers are DiophantineApproximationAndTranscendence §§2.5–2.5c, SuccessiveMinima §0.1, ArithmeticGaloisRepresentations §7.7, ComplexComparisonPartII §C5.4, ComplexKahlerGeometry Layer 3 and §§4.1–4.2, and CharacteristicClasses §§4.1–4.2."

## C02 — Untouched text: §1.14, line 649, cites Faltings' Lemma 3 on p. 356 for the point height, which Faltings defines on p. 354

The source line of §1.14 reads "§3, Lemma 3 and its proof, p. 356". Faltings defines the height of a point as `(1/[K:ℚ])·Grad(p*O(1))` on p. 354 (Faltings1983 line 255); Lemma 3 on p. 356 (line 323) is the finiteness statement for metrics with logarithmic singularities, which §5.2 already cites. The fix is "§3, p. 354".

## N01 — §1.5b, line 309, cites Roy–Thunder for the heights `H_Ξ` without a locator

DiophantineApproximationAndTranscendence §§2.5a and 2.5c cite §1, Lemma 3.1 and Propositions 4.1–4.2 of the same paper for the same heights; those locators would do here.

## N02 — Untouched text: §5.3, line 1971, calls the extension `ω_G`, while the same sentence writes the extended Hodge line as `ω̄_G`

One notation would do.

## Questions for the author

- FaltingsFinitenessAndIsogenyTheoremsPartII declares on this roadmap the gap `gap:hermitian-symmetric-power-slope` (`μ̂_max(SymⁿĒ) ≤ n(μ̂_max(Ē) + 2 log r)`, its line 1149). §1.6a gives the slope of `Sym^m Ē`, not the bound for its maximal slope. Is this roadmap meant to supply it, or HeightsRationalPointsAndObstructions? The contract sits in a roadmap this pull request does not change, so I cannot tell what is intended.

## Previous findings

The previous report, of `e7914b5`, had no finding (no R-numbered remark). Its small corrections and format notes:

- C01 (description omits §§5.1a–5.1d and the new suppliers) — not repaired: the description still reads "slopes of Hermitian vector bundles, heights" for this folder; written again as C01.
- C02 (docstring silent on Layers 1A–1B and §5.1d) — repaired: new bullet "Layers 1A–1B's slope inequality and Harder–Narasimhan filtration require hermitian vector bundles over `O_K`…", and §5.1d is named in the Layer 5 bullet.
- C03 (§1.14 locator) — not repaired: line 649 still reads "§3, Lemma 3 and its proof, p. 356"; written again as C02.
- N01, N02 — not repaired: lines 309 and 1971 unchanged; written again.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Docstring, Layers 1A–1B bullet: Tau Ceti's Euclidean subspace heights give degrees of sub-bundles of `O_K^n` only | `V = ℚ(1,1) ⊂ ℚ²`; `(ℤ, e^{−c}|·|)` | pin: Euclidean Plücker height `√2`; §1.5b gives `deĝ_n = −log √2 = −½ log 2`. Rescaled line has degree `c`; the pin's height of `ℚ` is `1`, degree `0 ≠ c` | holds |
| Docstring, §5.1d clause: Tau Ceti's currents live on open subsets of a finite-dimensional real vector space | pinned `integrationCurrent`, constancy theorem | carrier `Ω : Opens E`, `E` finite-dimensional real normed space; no current on a manifold, no hermitian metric on a holomorphic bundle found | holds |
| §5.1d (cited by the changed text) | README line 1927 against the docstring | README: `X̄` smooth projective, `D` normal crossings, currents `[c_k]` on `X̄`; docstring names the same three carriers | agree |
| `Suggested.lean` | elaboration at the pins | 0 declarations, `module`, single `import Mathlib`, no `set_option`; exit 0, no output; no one-tactic probe possible | holds |
| §1.14 locator (C02) | Faltings1983, as read by the previous review | point height at line 255 (p. 354); Lemma 3 at line 323 (p. 356) | locator wrong, untouched |

The rows for every other statement stand as in the previous review, of `e7914b5`: the README did not change.

- Change since `e7914b5`: 10 insertions and 1 deletion, all in the module docstring of `Suggested.lean`; README identical.
- Library declarations opened at the pins: Tau Ceti `NumberTheory/Height/Arakelov/Subspace/Basic.lean` lines 86, 292 and its module docstring; `Analysis/Distribution/TestFunction/IntegrationCurrent.lean` lines 78–86; `Analysis/Distribution/Constancy/Current.lean` lines 12–20, 60. A search of both pins for hermitian vector bundle, Arakelov degree, Harder–Narasimhan and Poincaré-growth declarations finds none.
- Seeded sample: none of the seeded sections lies in the changed passage; §5.1d, which the changed docstring cites, was compared with it (row above). No source locator was added or changed, so none was re-read.
- Description against the head: its two statements about this folder as a supplier hold: ThetaChainsAndFrobeniusPrimeSums cites §§1A.4–1A.5 (0 citations at the merge base, 5 at the head) and SingularHermitianMetricsAndL2Methods cites §§5.1a–5.1d (1 at the merge base, 10 at the head).
- The roadmap as a record: 0 headings removed, 25 added; the six layers of the merge base keep ids and titles; Layers 1A and 1B are new ids.
- Automatic checks: every check passed. The dependency check prints `depcheck: 124 roadmaps, 1412 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean`: exit 0, no output.
- Overlaps: no other open pull request changes this roadmap, no cited id is dropped, no id of this roadmap is dropped.

Overlap check: read RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles, ArakelovGeometryAndAbelianHeightsPartII and FaltingsFinitenessAndIsogenyTheoremsPartII as this head has them, for the objects the changed docstring names; slopes, the Harder–Narasimhan filtration and good metrics are owned here and cited there, as the previous review found; nothing else shared.

Source independence: changed passages only; the 2 changed docstring passages compared with Bost1996 Appendice A and Mumford1977 §1 as the previous review located them, none shared (they describe missing library carriers, not source text). Largest share Gaudron2008, 42 of the 105 named locators of the added text (the previous review's count, same README). No layer added, removed or reordered since `e7914b5`, so the arrangement was not compared again.

Research link: Layers 1A–1B are Bost's slope method (Bost 1996; Bost 2001), used in the period and isogeny theorems of Bost and of Gaudron–Rémond (2014) that FaltingsFinitenessAndIsogenyTheoremsPartII consumes; §§5.1a–5.1d are Mumford's good metrics (1977), behind the modular height of Layer 5. Rests on the README's Downstream consumers paragraph and Bost1996 Appendice A.

## Not verifiable

- Roy–Thunder (J. reine angew. Math. 476, De Gruyter, paywalled): cited in §1.5b without a locator (N01); not opened.
- The description is longer than the text quoted to this review; what follows the cut was not checked.

## Source issues

- none

## For the human reviewers

- RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles (its lines 73–292 and following) states §§1.5a–1.6a and 1A.1–1A.5 of this roadmap again, labelled "Corollary of: ArakelovGeometryAndAbelianHeights", under the convention the description proposes.
- The two recorded decisions (the move out of GeneralizedRiemannHypothesisFromWindowBounds; family sections moved to general roadmaps) concern removals from other folders; this folder removes nothing, so neither had to be applied here.
