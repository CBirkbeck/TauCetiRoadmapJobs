# GATE-EllipticCurveModularityPartII~8: answers to human review

Comments covered: one review by CBirkbeck (2026-10-26T11:28:23Z, head `0677414`). It makes two points.

## H01 (CBirkbeck) — answered

Confirmed at the companion heads: PadicFamilies (`ed1464b`) README line 2358 defines `modularZeta c d M N k r r′` for every `k ≥ 2` from its own units and symbols, and never mentions EllipticCurveModularityPartII; ModularIwasawaMainConjectures README lines 17 and 91 still give these classes and their reciprocity to PadicFamilies §§4.0.1–4.0.3. The supply direction this roadmap states is consistent with the merge order (EllipticCurveModularityPartII line 191, PadicFamilies 193, ModularIwasawaMainConjectures 264), and the review itself finds this roadmap's half complete (§6.0e, the Scope paragraph and Downstream consumers). So nothing in `TauCetiRoadmap/EllipticCurveModularityPartII/` changes; the remaining edits go in the PadicFamilies and ModularIwasawaMainConjectures folders. PadicFamilies §4.0.1 should import the §6.0e units, ordered symbols, transfers, weight-two classes, reciprocity and CM adapter, and state the equality of its `k=2, r=r′=1` moment with the §6.0e class (same levels, smoothing integers, norm maps, period choices, dual, and coefficients `W_(M,N)(1)` and `W_f(1)`, with no extra sign). ModularIwasawaMainConjectures lines 17 and 91 should say that the weight-two classes come through PadicFamilies' re-export of §6.0e.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 690: "§11, pp. 199–217" → "§11, pp. 202–218". In the Numdam text of Kato, Astérisque 295, the table of contents lists §11 at p. 202 (Kato2004 line 50) and Chapter III at p. 218 (line 59). The §11 heading is on printed p. 202 (line 3352) and Chapter III starts partway down p. 218 (line 3931). Every other Kato locator in §6.0e was rechecked against the same text and is correct:

- §§1–2 cover pp. 121–133, since §3 starts on p. 134 (line 717).
- §5.1 is on p. 152 and §8.1 on p. 180.
- §8.4 and (8.4.1)–(8.4.3) are on pp. 182–183.
- §8.9 is on p. 185 and §8.11 on p. 186.
- §9.4 and Theorems 9.5–9.6 are on p. 188; Theorem 9.7 is on p. 189.
- §10.8–Proposition 10.12 cover pp. 195–198 (line 3171 is on p. 198).
- Theorem 12.5 is on pp. 221–222 and Theorem 14.2 on p. 235.
- §§15.12–15.17 cover pp. 263–265.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §6.0e locator "§11, pp. 202–218" | Section start; end of the section | ToC entry 202 and heading on p. 202; Chapter III ToC 218 and heading on p. 218 | holds | 199–217 → 202–218 |
| §6.0e locator "§10, (10.9.5), Prop. 10.12, pp. 195–198" | 10.8 setup; 10.9 start; Prop. 10.12 | 10.8 on p. 195, 10.9 on p. 196, Prop. 10.12 on p. 198 | holds | none |

No mathematical statement changed, so no further rows apply. `Suggested.lean` is unchanged. Its signatures were not rechecked with `#check` this round, because no declaration was touched.

## Sources

Kato's article (open Numdam copy, `https://www.numdam.org/article/AST_2004__295__117_0.pdf`) was read through the sources service under the key `Kato2004`. No text is missing, and no `needs-references.toml` was written.

## Build and gate

- `lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested`: `Build completed successfully (9233 jobs).` The only warnings are `declaration uses 'sorry'`.
- Gate after commit `b3e9f15a`: `gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.

Commit: `b3e9f15a EllipticCurveModularityPartII: review repairs (Kato §11 printed page range)`. It is not pushed.
