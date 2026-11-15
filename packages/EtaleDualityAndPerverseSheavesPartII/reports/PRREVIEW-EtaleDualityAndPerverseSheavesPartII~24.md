# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at 5818348)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since b9f5936 (the reworded end of the §8.3 proof route), plus the check of the pull request's title and description against this head. The folder's change is sound; the one finding is a sentence of the description.

## R01 (P3) — The description's summary block misstates where Part I stops

**Location:** pull request description, `<!-- roadmap-summary -->` block, paragraph "Why Tau Ceti wants it": "Part I stops at finite-type schemes over fields."

**Claim:** The head says Part I also covers one-dimensional bases, so the sentence contradicts the README (and the description's own first sentence, "beyond its finite-type field and one-dimensional base setting").

**Witness:** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:7`: "The base stops at separated finite-type schemes over a field and its specified excellent one-dimensional bases". EtaleDualityAndPerverseSheaves `README.md:3048` (open head) treats a regular `ℤ[1/ℓ]`-base of dimension at most one.

**Repair:** Replace the sentence by: "Part I stops at separated finite-type schemes over fields and its specified excellent regular bases of dimension at most one." No change in the folder.

## Previous findings

- none: the review of b9f5936 listed no finding. (R01 of the review before it, the double ownership of §§6.11, 6.12, 7.1, 7.3 with PurityForFlatCohomology §§1.4–1.5, was settled there as not actionable in this package; it is carried under `## For the human reviewers`.)

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §8.3, reworded glueing step (`README.md:1574`) | A = 𝒪_C × 𝒪_C, ϖ = (ϖ₀, ϖ₀) ≠ 0, U = Spec 𝒪_C ⊔ Spec C | Idem(U) = 4 (two components). Glueing data: Idem(C × C) = 4, Idem(𝒪_C) = 2 on the one principal open {s₁}, first coordinate fixed by compatibility: 2 · 2 = 4. U^♭ likewise 4. | Holds |
| §8.3, same step, compatibility clause | same A and U, compatibility dropped | 4 · 2 = 8 ≠ 4 | "all compatible with one another" is needed and is stated |
| §8.3, same step, ϖ = 0 | A = 𝔽_p, U = Spec A | A[1/ϖ] = 0 has 1 idempotent; the localisation 𝔽_p is complete and perfect, 2 idempotents; total 2 = Idem(𝔽_p) = Idem(𝔽_p^♭) | Holds |
| §8.3, same step, U = Spec A[1/ϖ] | any A | U ∩ V(ϖ) = ∅: no localisations, the data is one idempotent of A[1/ϖ], the second settled case | Holds |
| §8.3, "every such completion is perfectoid" | localisation A[1/b] of complete perfectoid A | A[1/b] is ind-étale over A; CS24 Corollary 2.1.6 (CS24 line 492, p. 13) gives its ϖ-adic completion perfectoid | Holds |
| §8.4 (sampled; cites §8.3) | locator only | Lemma 2.2.4 at CS24 line 774 (p. 19, ending p. 20); product case at CS24 lines 863–872 (p. 22); §8.3 still supplies clopens with disjointness | Locator correct; unaffected by the rewording |

The rows for all other statements stand as in the previous review, of `b9f5936`.

- Source locators checked against the text: 4 (CS24 Theorem 2.2.7 and first part of its proof, lines 827–851, p. 21; Corollary 2.1.6, line 492; equation (2.1.2.2), line 416, p. 11; Lemma 2.2.4, line 774). The reworded step matches CS24 lines 843–851 in content.
- Cross-roadmap citations in the changed passage resolved: ArcTopologyAndDescent §§8.6–8.9 (headings present at its open head; §8.9 states the open comparison for D(a) ⊂ U with torsion F, which covers degree 0 with ℤ/2), PerfectoidQuotients §§0.4–0.6 (headings present at its open head). The `*Needs:*` line of §8.3 is unchanged and still covers the route.
- Gate on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0); the worker's run adds `build=0`.
- Dependency check (`--movable --pr 1743`), full output: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/Suggested.lean` exited 0; the only warnings are nine "declaration uses `sorry`" (lines 84, 107, 200, 244, 281, 301, 316, 339, 361). The diff does not touch the Lean file, so the binder check of the previous review stands.
- Description read against the head, other than R01: nine headline theorems (9 `theorem` declarations, the listed split 3 + 2 + 1 + 1 + 1 + 1); the five suppliers named as on main are on main; the ten other suppliers are the ten `From TauCetiRoadmap.*` headings not on main, all before this roadmap in the merge order (latest AdicCoefficientsAndComparisonsPartII, line 396 against 397); PerfectoidQuotientsPartII §§Q5.1–Q5.3, Q6.2–Q6.7 as at `README.md:156`; PurityForFlatCohomology named only as consumer (`README.md:23`, `:1656`), and its §§1.4–1.5 still state the same statements at its head 160e354 (`:1107`, `:1160`); the title and the 2081-line addition agree (a new roadmap, nothing removed).
- Overlap check: read AdicCoefficientsAndComparisonsPartII, ClassicalAdicEtaleCohomology, LefschetzPencilsAndVanishingCycles, EtaleDualityAndPerverseSheaves, PurityForFlatCohomology, EtaleCohomologyFoundations, SchemeAndStackFoundations, ResolutionOfSingularitiesCharacteristicZero in the previous reviews; this round re-read only PurityForFlatCohomology and the scope of EtaleDualityAndPerverseSheaves, since the diff changes no ownership; nothing shared except §§6.11, 6.12, 7.1, 7.3 with PurityForFlatCohomology §§1.4–1.5, owner this roadmap (settled, see the human reviewers' section). The worker's overlap listing reports no pull request changing this roadmap and no dropped or revision-only id.
- Source independence: changed passages only; 1 passage compared with 1 source (CS24 lines 843–851), longest shared run 4 consecutive words, the order of its four steps forced by the argument; no layer added, removed or reordered, so the arrangement was not compared again.
- Remark on untouched text (no change requested): `README.md:1684` names "L. Illusie" as author of published Exposé XIII; the cached text names Fabrice Orgogozo.

## Not verifiable

- Ill03, Epp73 and Ser65 are settled as uncertified and cited by locator; none is cited in the changed passage.
- The description's sentence on AI assistance (the number of review and red-team rounds) is not a statement about the head and was not checked.

## Source issues

- none

## For the human reviewers

- **Ownership.** PurityForFlatCohomology at 160e354 still states §1.4 and §1.5 (`README.md:1107`, `:1160`) and says this roadmap "is to import" them (`:3472`), while this roadmap owns §§6.11–7.3 (`README.md:23`). The repair lies in that roadmap; the merge order lists it first (line 224 against 397).
