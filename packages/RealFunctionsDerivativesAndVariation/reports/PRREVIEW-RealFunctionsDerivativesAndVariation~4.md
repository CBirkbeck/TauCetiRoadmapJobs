# Review of RealFunctionsDerivativesAndVariation (pull request #2971 at 56cdcad)

**Verdict:** accepted

**Summary.** Accepted: the previous review had no finding, and its one format note (no locator for the failure of normality of the density topology, §7.3) is repaired; the other change, naming YoungIntegrationAndRoughPaths with its Layer 1 as owner of the `p`-variation, resolves on main. No finding, no small correction and no format note. As before, none of the cited books could be read legally, so no locator is verified, the new one included; that, the licence of the prior formalization and the scope are left to the human reviewers.

## Questions for the author

- The new locator for non-normality (§7.3, line 648) is to a place where, by the README's own words, the result is stated without proof. Would the primary reference that Thomson points to (I believe Goffman, Neugebauer and Nishiura, *Density topology and approximate continuity*, Duke Math. J. 28, 1961) be worth adding beside it? I could read neither text, so this is a question and not a request.

## Previous findings

- N01 — repaired: "the density topology is not normal (Thomson, Example 9.2, p. 19, where it is stated without proof with references to the literature; the proof route below supplies the argument)"; References list §9 as well. The locator itself is not verifiable.

The previous report had no finding (R) and no small correction (C).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.3 `not_normalSpace_densityTopology` (the statement the changed locator is attached to), with its proof route | closed pair `ℚ`, `H` = Liouville numbers; `Dₙ` at a rational `q ∈ J`; Mathlib's `NormalSpace` (no T₁ in it) | both null, so closed; `Dₙ` usual-closed, cover `H`; at `q`: `λ(V ∩ I) ≥ (3/4)·2h`, `λ(U ∩ I) > (1/2)·2h`, sum `> 2h`, so `λ(U ∩ V) > 0` | true; Lean `¬ @NormalSpace ℝ densityTopology` says the same | none |
| Scope: `p`-variation for `p ≠ 1` owned by YoungIntegrationAndRoughPaths, Layer 1 | that README on main | Layer 1 "variation, Hölder paths and controls": §1.1 the `r`-variation for `0 < r < ∞`, §1.2 controls and Hölder paths; it says its definition extends Mathlib's `1`-variation | citation resolves, subject matches; this roadmap uses only `eVariationOn` | none |

The rows of the previous reviews stand for every untouched statement, as in the previous review, of `b0fe75e`; the diff changes no statement and no line of `Suggested.lean`.

- Source locators checked against the text: 0; the one locator added (Thomson, Example 9.2, p. 19) is into a text that could not be read.
- Library declarations opened at the pin: 0 new; `NormalSpace` and `CompletelyRegularSpace` are pinned by `#check` in `Suggested.lean` and elaborate.
- Cross-roadmap citations resolved: 1 changed (YoungIntegrationAndRoughPaths, Layer 1, on main, relative link target exists); none found unresolved.
- Dependency check: `depcheck: 106 roadmaps, 1216 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, 50 `sorry` warnings and no other; `import Mathlib` plus one Tau Ceti module, no `set_option`; nothing changed outside the roadmap folder.
- Automatic checks: all pass except the one set aside below.
- Pull request text read against this head: no sentence contradicted; the description already names YoungIntegrationAndRoughPaths (main), Layer 1, and "completely regular, not normal".
- Seeded sample: of the fifteen targets only §7.3 falls in the changed passages; its new locator is not verifiable.

Overlap check: read NonabsoluteIntegration (open), GeometricMeasureTheory, Isoperimetry and YoungIntegrationAndRoughPaths (main), the last one's Layer 1 again at this head; the change adds no object. NonabsoluteIntegration consumes the Dini derivatives and property (N) and names this roadmap as owner; density and Lebesgue's density theorem are owned by GeometricMeasureTheory G5 and cited here; the `p`-variation for `p ≠ 1` is owned by YoungIntegrationAndRoughPaths Layer 1 and not stated here; nothing else shared.

Source independence: changed passages only; 3 passages compared with 0 sources, because none of the cited books could be read legally; largest share Bruckner, about 30 of 86 locators; its table of contents could not be read. No layer was added, removed or reordered.

Research link: Layers 1–4 and 7 are prerequisites of the descriptive theory of the Denjoy, Perron and Henstock–Kurzweil integrals, planned in the open roadmap NonabsoluteIntegration, which cites §§1.1, 3.1, 4.3; Layers 5 and 7 of the Zahorski classes (Bruckner, 1978, Chapter VI). Rests on the README and on that roadmap's text.

## Not verifiable

- Thomson, Example 9.2, p. 19 (the locator added for the failure of normality): the text is paywalled and not held locally.
- Every other locator into Bruckner, Thomson, Hewitt–Stromberg, Benedetto–Czaja, Kechris and Kharazishvili, including all fifteen sampled targets: the texts are paywalled and not held locally.
- Every locator into Leoni, Bourbaki and Stein–Shakarchi: no legal copy found.
- The content of the proposed Mathlib file named under *From Mathlib*: it is not in the pinned Mathlib.

Automatic checks set aside as false positives: the report of a section comment with no declaration under it, for the closing block of `Suggested.lean`, which holds only `#check` lines pinning library declarations, as is allowed.

## Source issues

- none

## For the human reviewers

- **Not tested.** Bruckner, *Differentiation of Real Functions* (1978), has the largest share of the locators (about 30 of 86). Neither its text nor its table of contents could be read; wording and arrangement were compared with no source.
- **Licence.** README, *Prior formalization*: §§1.1, 2.1, 3.2, 5.1, 7.1 start from the author's Lean project CKMA (github.com/bjbraams/lean-CKMA, Apache 2.0 by the README's statement). `Suggested.lean` was not compared with its files.
- **Scope.** The sources are textbooks and monographs of 1975–2017 on classical real analysis; the only consumer found is the open roadmap NonabsoluteIntegration, by the same author.
