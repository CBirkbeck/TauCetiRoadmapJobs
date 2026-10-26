# GATE-EllipticCurveModularityPartII~9 — reply to human review

The single review since the last reply (CBirkbeck, 2026-10-26T17:10Z, head b3e9f15) makes one point.

## H01 (CBirkbeck) — applied differently

The conflict is real, but the edit that removes it belongs in the companion folders, which this pull request cannot touch: PadicFamilies (#1019 at ed1464b, §§4.0.1–4.0.3) still builds the weight-two objects itself, and neither it nor ModularIwasawaMainConjectures (lines 17 and 91) mentions this roadmap, while the merge order already runs EllipticCurveModularityPartII (191) → PadicFamilies (193) → ModularIwasawaMainConjectures (263). On this side, README line 11 ("PadicFamilies §§4.0.1–4.0.3 imports these objects…" → "…a consumer of this roadmap, is to import these objects under the export contract stated under Downstream consumers rather than construct them again…") and line 1028 ("…imports these objects. That roadmap's comparison theorem identifies…" → "The export contract to PadicFamilies §§4.0.1–4.0.3 is that that roadmap imports these objects instead of constructing them again, and proves a comparison theorem identifying…") now state that import as an obligation instead of something PadicFamilies already does; the mathematics is unchanged (same levels, smoothing integers, norms, periods, dual, W_(M,N)(1) and W_f(1), and no extra sign).

What the companion pull requests still need: PadicFamilies has to import the §6.0e objects, add the k = 2, r = r′ = 1 comparison target and update its ownership and supplier lines. ModularIwasawaMainConjectures has to update its ownership wording at lines 17 and 91. The ModularIwasawaMainConjectures sentence at README line 1028 now also says "under this contract".

## Notes

- Adversarial pass: the edit changes only how three sentences about a consumer are worded. No statement, hypothesis or normalization changed, and `Suggested.lean` is untouched, so its 24 elaborated signatures (scratch `signatures.md`) still stand.

| statement | instances tried | values | result | change |
|---|---|---|---|---|
| §6.0e / Downstream: the weight-two moment of PadicFamilies equals the §6.0e class | PadicFamilies at ed1464b, §4.0.1 (line 2355 ff.) and §4.0.2 (line 2370 ff.); ModularIwasawaMainConjectures at rev 1499, lines 17 and 91 | PadicFamilies does not import from this roadmap, and has no comparison target (0 occurrences of `EllipticCurveModularityPartII`); ModularIwasawaMainConjectures also has 0 | the present-tense claim was false at the companion heads | restated as an export contract (README lines 11 and 1028) |

- Ownership: §6.0e owns the weight-two objects because it comes first in the merge order (191, before PadicFamilies at 193). Ownership against the other open pull requests the brief lists was not checked again this round, because no ownership claim changed apart from this one.
- Citations: the PadicFamilies section numbers (§§4.0.1–4.0.3, headings at lines 2354, 2370 and 2383 at ed1464b) were checked and still resolve.
- Commit: 0e44114c "EllipticCurveModularityPartII: review repairs (PadicFamilies weight-two import stated as export contract)". Not pushed.

## Build

`lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested`: Build completed successfully (9233 jobs). The only warnings are the expected `declaration uses 'sorry'` lines.

## Gate

`gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
