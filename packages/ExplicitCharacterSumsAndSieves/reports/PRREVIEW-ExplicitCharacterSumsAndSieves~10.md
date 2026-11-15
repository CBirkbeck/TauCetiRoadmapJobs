# Review of ExplicitCharacterSumsAndSieves (pull request #1948 at 438bce4)

**Verdict:** accepted

Incremental re-review of 2 changed lines since `a1e357d` (one bullet added to `## Downstream consumers`), and of the pull request's title and description as they stand now. No finding.

## Previous findings

- R01 — repaired: the description now reads "needed by ExplicitNumberFields, for least primitive roots and norm-Euclidean fields; its Selberg diagonal sum is the carrier of a squarefree sum in ExplicitMultiplicativeFunctions", and names ExplicitPrimeCounting among the five suppliers only.

## Verified sound

| # | Statement | Instances | Values (left / right) | Result |
|---|---|---|---|---|
| 1 | README lines 1817–1818 (added): `selbergDiagonal` of §5.1 is the carrier of `G₁(D) = Σ_{d ≤ D} μ²(d)/φ(d)` of ExplicitMultiplicativeFunctions Layer 7.2 | `D = 1, 2, 6`; `D = 0.5` (empty sum); the definition at `Suggested.lean` line 66 against the consumer's Checks | `S(1) = 1`, `S(2) = 2`, `S(6) = 1 + 1 + 1/2 + 1/4 + 1/2 = 3.25`, `S(0.5) = 0` / consumer's `G₁(1) = 1`, `G₁(2) = 2` (its line 3310) | same sum; true |
| 2 | Same passage: the section and the direction of supply | ExplicitMultiplicativeFunctions at its open head: heading 7.2 (line 3241), supplier section (lines 522–528), `*Needs:*` (line 3304); merge order | consumer cites "§5.1 (the carrier `selbergDiagonal` of `G₁`)" in 7.2 / this README says §5.1 and Layer 7.2; order positions 276 (this) and 277 (consumer) | agrees; downward |
| 3 | Description: "builds on five earlier ones", with what each supplies | each clause against the README's supplier sections (lines 275–350) | ExplicitZetaBounds §4.2 and §6.5; ExplicitPrimeCounting §0.1 (diagonal bounds, two proof steps); CharacterSumsOverFiniteFields §4.7; SieveMethodsAndPrimePatterns §1.3 and §2.9; AnalyticNumberTheoryPartI §§0.5, 0.8, 0.19, 0.20 / the same five | agrees |
| 4 | Description: consumers | each named consumer against `## Downstream consumers` (lines 1817–1824) and the open heads | ExplicitNumberFields (its lines 130, 697, 3232), ExplicitMultiplicativeFunctions (its line 522), Part II / the same three in the description's prose | agrees |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `a1e357d`.

- Folder diff `a1e357d..438bce4`: 2 insertions in `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md`, no statement changed; nothing changed outside the folder against `origin/main`.
- Description checked sentence by sentence against the head: the summary block (unchanged in substance since the previous check) and the 8 sentences of the author's prose; none contradicted. It states the five suppliers; no section, headline or declaration is removed (2444 insertions, 0 deletions). Title "ExplicitCharacterSumsAndSieves: roadmap" matches a pull request that adds the folder.
- Cross-roadmap citations resolved at the open heads: 2 (ExplicitMultiplicativeFunctions lines 138–143, 522–528, 3241, 3290–3304; ExplicitNumberFields lines 130, 697, 3232). Library declarations opened: none needed (no statement changed).
- Source locators: the seeded sample falls in no changed passage and was not rechecked; the added bullet carries no source locator.
- Gate (rerun): `gate ExplicitCharacterSumsAndSieves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`.
- Dependency check (`--movable`): `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no `UPWARD`, `CYCLE` or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` exits 0; the only output is `declaration uses sorry` warnings.
- Overlap check: read ExplicitNumberFields, ExplicitMultiplicativeFunctions, ExplicitZetaBounds, ExplicitPrimeCounting, SieveMethodsAndPrimePatterns (open, by vocabulary), AnalyticNumberTheoryPartI (main); the results-and-headings list is empty; shared object touched by the change: the diagonal sum `Σ μ²(n)/φ(n)`, carrier `selbergDiagonal` owned by this roadmap §5.1, its bounds by ExplicitPrimeCounting §0.1, its `G₁` asymptotics with constants `2.44`, `3.95` by ExplicitMultiplicativeFunctions 7.2, which cites §5.1. No object has two owners.
- Source independence: changed passages only; 1 passage compared (the added bullet) with 0 sources, since it cites none and names only a sibling roadmap's sum, none shared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- The uncertified citations (greaves2001, montgomeryvaughan2007, montgomeryvaughan1973, frolenkovsoundararajan2013, bordelles2012, filaseta1990, trevino2015kth, bachmanrachakonda2001, siebert1976, rieselvaughan1983) and the waived vanlintrichert1965 are cited by locator alone; none is touched by this round.
- The description's depends-on and merge-order blocks are generated and outside this check.

## Source issues

- **Error** in fan2022 at the Theorem, inequality (5), printed page 4 (lines 159–161): the source says (5) holds for all `1 < z ≤ x` with `z ≥ max(3, √x)`; it should require `x ≥ 8`, since at `x = 7`, `4.9910 < z < 5` the count is `3` and the bound is below `3`; affects a stated result.

## For the human reviewers

- none
