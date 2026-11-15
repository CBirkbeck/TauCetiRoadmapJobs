# Review of ExplicitCharacterSumsAndSieves (pull request #1948 at a1e357d)

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since `b701b75` (0 lines); this round reads the pull request's title and description against the head. One P3 finding, in the description.

## R01 (P3) — the description names a supplier, ExplicitPrimeCounting, as a consumer

**Location** pull request description, second paragraph after the summary block: "Character sums and sieve bounds with explicit constants are needed by the explicit multiplicative, prime-counting and number-field roadmaps and by effective results on least primitive roots and class numbers".

**Claim** The head contradicts it: ExplicitPrimeCounting supplies this roadmap and consumes nothing from it, and no class-number result consumes it.

**Witness** `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` line 327, `### From TauCetiRoadmap.ExplicitPrimeCounting`; lines 105–106 put class numbers outside this roadmap and its Part II; ExplicitPrimeCounting README line 4796: "ExplicitCharacterSumsAndSieves, later in the order of supply".

**Repair** Replace the sentence's first clause by: "Character sums and sieve bounds with explicit constants are needed by the explicit multiplicative and number-field roadmaps, for least primitive roots and norm-Euclidean fields, and by Part II; the roadmap itself builds on ExplicitPrimeCounting's Brun–Titchmarsh inequality and diagonal bound;". The rest ("Mathlib has the carriers but no explicit inequalities") stands.

## Previous findings

- none: the review of `b701b75` accepted with no finding (its own R01, of `d6d076d`, was recorded there as repaired; README lines 112–114 are unchanged at this head).

## Verified sound

| # | Statement | Instances | Values (left / right) | Result |
|---|---|---|---|---|
| 1 | `fan_rough_count` (4), cited by the description as "Φ(x, z) < x/log z for 1 < z ≤ x" | integer `x ≤ 400`, `z` at and just below each integer in `(1, x]`, and `z = 1.0000001, 1.5`; `Φ(9, 3)` | max of `Φ log z / x` is `0.7324` (at `x = 3`, `z → 3⁻`); `3 < 8.192` | true; hypotheses `1 < z ≤ x` as in the description, README §5.6 and fan2022 line 157 |
| 2 | `fan_rough_count` (5), with the roadmap's `x ≥ 8` | `8 ≤ x ≤ 400`, `max(3, √x) ≤ z ≤ x` at and below integers; negative control `x = 7`, `z = 4.995` | max ratio `0.8980` (`x = 13`, `z → 5⁻`); control `Φ = 3` against `2.99917` | true from `x ≥ 8`; the control fails as the Check says |
| 3 | `fan_rough_count` (6) | `4 ≤ x ≤ 400`, `max(2, x^{2/5}) ≤ z ≤ √x` at integers, below integers and at both endpoints | max of `3Φ log z / (2x)` is `0.9155` (`x = 9`, `z → 3⁻`) | true |
| 4 | Description, summary block: suppliers and consumers | each named roadmap against the README's supplier headings and Downstream consumers | 5 supplier sections (lines 275–327) / 5 entries of the depends-on block; consumers ExplicitNumberFields and Part II (lines 1817–1822) / same in the summary block | agrees |
| 5 | Description, author's prose: consumers | "explicit multiplicative, prime-counting and number-field roadmaps" against the open heads | ExplicitMultiplicativeFunctions cites §5.1 (its README lines 139, 522); ExplicitNumberFields cites §§3.5, 4.1, 6.1 (line 3232); ExplicitPrimeCounting cites nothing here and is a supplier | R01 |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `b701b75`.

- Folder diff `b701b75..a1e357d`: empty (`git diff --stat`); nothing changed outside the folder against `origin/main`.
- Description checked sentence by sentence against the head: 11 sentences of the summary block and 5 of the author's prose; one contradicted (R01). Title "ExplicitCharacterSumsAndSieves: roadmap" matches a pull request that adds the folder (2442 insertions, 0 deletions).
- Summary-block claims resolved at the head: Hölder and finite differencing (README lines 562, 1118), Fejér smoothing (lines 898, 928), nonprincipal characters modulo primes (line 961; `burgess_moment_bound`, `Suggested.lean` line 198), nonnegative absolutely continuous weights on a coprime progression (`buthe_weighted_brun_titchmarsh`, lines 456–459), Part II items (README lines 116–145).
- Source locator checked: 1 (fan2022 lines 157–163, the Theorem with (4)–(6)). The seeded sample falls in no changed passage and was not rechecked.
- Cross-roadmap citations resolved at the open heads: ExplicitPrimeCounting lines 76–82 and 4796–4800, ExplicitMultiplicativeFunctions lines 138–143 and 4418–4423, ExplicitZetaBounds lines 106–112, ExplicitNumberFields lines 197–203; each agrees with this README's Scope on the owner.
- Gate (rerun): `gate ExplicitCharacterSumsAndSieves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- Dependency check (`--movable`): `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no `UPWARD`, `CYCLE` or `moved:` line. Merge order: ExplicitZetaBounds 273, ExplicitPrimeCounting 275, this roadmap 276.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` exits 0; the only output is 19 `declaration uses sorry` warnings.
- Overlap check: read ExplicitNumberFields, ExplicitMultiplicativeFunctions, ExplicitZetaBounds, ExplicitPrimeCounting, SieveMethodsAndPrimePatterns (open, by vocabulary), AnalyticNumberTheoryPartI (main); the results-and-headings list is empty; shared objects: the diagonal sum `S(u)` bound `≥ log u + 1.07`, Büthe's asymptotic and `brun_titchmarsh`, owner ExplicitPrimeCounting §0.1; `selbergDiagonal` and the coprime comparison, owner this roadmap §5.1; the finite van der Corput inequality, owner ExplicitZetaBounds §4.2. No object has two owners.
- Source independence: changed passages only; 0 passages changed in the folder, so 0 passages compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- The uncertified citations (greaves2001, montgomeryvaughan2007, montgomeryvaughan1973, frolenkovsoundararajan2013, bordelles2012, filaseta1990, trevino2015kth, bachmanrachakonda2001, siebert1976, rieselvaughan1983) and the waived vanlintrichert1965 are cited by locator alone; none is touched by this round.
- The description's merge-order and depends-on blocks are generated and outside this check.

## Source issues

- **Error** in fan2022 at the Theorem, inequality (5), printed page 4 (lines 159–161): the source says (5) holds for all `1 < z ≤ x` with `z ≥ max(3, √x)`; it should require `x ≥ 8`, since at `x = 7`, `4.9910 < z < 5` the count is `3` and the bound is below `3`; affects a stated result.

## For the human reviewers

- none
