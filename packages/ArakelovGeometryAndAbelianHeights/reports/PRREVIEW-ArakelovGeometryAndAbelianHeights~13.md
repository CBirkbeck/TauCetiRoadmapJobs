# Review of ArakelovGeometryAndAbelianHeights (pull request #3027 at 7633b39)

**Verdict:** accepted

**Summary.** An incremental re-review of the 2 lines changed since `f93f554` (one locator in §1.14) together with the pull request's title and description. The locator now points at the page of Faltings' paper where the height of a point is defined, and the description now states what this folder gains, that it removes and renumbers nothing, and its new suppliers; each of those statements holds at this head. There is no finding and no small correction; two format notes carried from the previous review remain, none blocking. One question is left for the human reviewers, the "Corollary of" convention under which a family roadmap restates sections of this one.

## N01 — §1.5b, line 309, cites Roy–Thunder for the heights `H_Ξ` without a locator

DiophantineApproximationAndTranscendence §§2.5a and 2.5c cite §1, Lemma 3.1 and Propositions 4.1–4.2 of the same paper for the same heights; those locators would do here.

## N02 — §5.3, line 1971, calls the extension `ω_G`, while the same sentence writes the extended Hodge line as `ω̄_G`

One notation would do.

## Questions for the author

- FaltingsFinitenessAndIsogenyTheoremsPartII declares on this roadmap the gap `gap:hermitian-symmetric-power-slope` (`μ̂_max(SymⁿĒ) ≤ n(μ̂_max(Ē) + 2 log r)`, its line 1149). §1.6a gives the slope of `Sym^m Ē`, not the bound for its maximal slope. Is this roadmap meant to supply it, or HeightsRationalPointsAndObstructions? The contract sits in a roadmap this pull request does not change, so I cannot tell what is intended.

## Previous findings

The previous report, of `f93f554`, had no finding (no R-numbered remark). Its small corrections and format notes:

- C01 (description silent on §§5.1a–5.1d, the new layers and the new suppliers) — repaired: the description now reads "ArakelovGeometryAndAbelianHeights gains symmetric powers of a hermitian bundle (§1.2a), … Mumford's good metrics … (§§5.1a–5.1d); it loses or renumbers no section. It gains five suppliers: …".
- C02 (§1.14 locator) — repaired: line 649 now reads "§3, p. 354", where Faltings defines the height of a point (Faltings1983 lines 251–257, printed page 354).
- N01, N02 — not repaired: lines 309 and 1971 unchanged; written again.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.14 source line (changed): Faltings §3, p. 354, for the point height as a normalised degree | Faltings1983 lines 229, 251–257 | page header "354" at line 229; height of `x ∈ ℙⁿ(K)` defined as `(1/[K:ℚ])·Grad(p*O(1))` at lines 251–257; Lemma 3 only at line 323 (p. 356) | locator right |
| §1.14 (cited by the changed line): degree of `x*O(1)` is Mathlib's logarithmic height | `K = ℚ`, `x = (1:2)` | sup metric: `𝔟 = ℤ`, finite part `0`, archimedean `log max(1,2) = log 2`; Mathlib `logHeight = log 2`. Fubini–Study: `½ log 5 ∈ [log 2, log 2 + ½ log 2]` | agree |
| Description: "it loses or renumbers no section" | headings at the merge base against the head | 0 removed, 25 added; 6 layers keep ids and titles; Layers 1A, 1B new | holds |
| Description: "It gains five suppliers" with sections, and §C5.4 of a supplier already held | name counts, merge base / head | DiophantineApproximationAndTranscendence 0/15 (§§2.5–2.5c), SuccessiveMinima 0/3 (§0.1), ArithmeticGaloisRepresentations 0/4 (§7.7), ComplexKahlerGeometry 0/5 (Layer 3, §§4.1–4.2), CharacteristicClasses 0/5 (§§4.1–4.2); ComplexComparisonPartII 11/17, §C5.4 new | holds |
| Description: sections of this folder cited as added (§1A.4, §1A.5 (b), §1B.5) or existing (§2.9, §4.6) | README headings | 1A.4 line 817, 1A.5 line 851 with clause (b) (injective `φ`), 1B.5 line 1051, 2.9 line 1313, 4.6 line 1673 | all exist |
| `Suggested.lean` | elaboration at the pins | 0 declarations, `module`, single `import Mathlib`, no `set_option`; exit 0, no output; no one-tactic probe possible | holds |

The rows for every other statement stand as in the previous review, of `f93f554`.

- Change since `f93f554`: 1 insertion and 1 deletion, line 649 of the README; `Suggested.lean` identical.
- Source locators checked against the text: 1 (Faltings1983, the GDZ scan the README links, read by OCR; 19 pages, the article's p. 349 on its page 2). The same "§3, p. 354" is used for the same page at lines 208, 335, 1206 and 1398.
- Seeded sample: of the seeded sections only §1.14 lies in the changed passage; its locator is the first row. No statement changed.
- Description against the head: read as it stands on the pull request (the part on this folder lies beyond the cut of the copy quoted to this review); the six rows above cover every sentence that names this folder. The title describes the pull request and says nothing this folder contradicts. The statement that only the module docstring of `Suggested.lean` changes here holds (0 declarations at the merge base and at the head).
- Cross-roadmap citations resolved: the five new suppliers and ComplexComparisonPartII are roadmaps on main; ComplexKahlerGeometry Layer 3 (line 545), §4.1 (line 895) and §4.2 (line 951) exist at this head.
- Automatic checks: every check passed. The dependency check prints `depcheck: 122 roadmaps, 1394 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean`: exit 0, no output.
- Overlaps: no other open pull request changes this roadmap, no cited id is dropped, no id of this roadmap is dropped.

Overlap check: read RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles, ArakelovGeometryAndAbelianHeightsPartII and FaltingsFinitenessAndIsogenyTheoremsPartII as the previous review did; the changed line names no object, so the owners stand: slopes, the Harder–Narasimhan filtration and good metrics are owned here and cited there; nothing else shared.

Source independence: changed passages only; the 1 changed passage compared with 1 source (Faltings1983 lines 251–257), none shared (it is a locator, no prose). Largest share Gaudron2008, 42 of the 105 named locators of the added text (the count of the review of `e7914b5`, same layers). No layer added, removed or reordered since `f93f554`, so the arrangement was not compared again.

Research link: Layers 1A–1B are Bost's slope method (Bost 1996; Bost 2001), used in the period and isogeny theorems of Bost and of Gaudron–Rémond (2014) that FaltingsFinitenessAndIsogenyTheoremsPartII consumes; §§5.1a–5.1d are Mumford's good metrics (1977), behind the modular height of Layer 5. Rests on the README's Downstream consumers paragraph and Bost1996 Appendice A.

## Not verifiable

- Roy–Thunder (J. reine angew. Math. 476, De Gruyter, paywalled): cited in §1.5b without a locator (N01); not opened.

## Source issues

- none

## For the human reviewers

- RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles (its lines 73–292 and following) states §§1.5a–1.6a and 1A.1–1A.5 of this roadmap again, labelled "Corollary of: ArakelovGeometryAndAbelianHeights", under the convention the description proposes.
- The two recorded decisions (the move out of GeneralizedRiemannHypothesisFromWindowBounds; family sections moved to general roadmaps) concern removals from other folders; this folder removes nothing, so neither had to be applied here.
