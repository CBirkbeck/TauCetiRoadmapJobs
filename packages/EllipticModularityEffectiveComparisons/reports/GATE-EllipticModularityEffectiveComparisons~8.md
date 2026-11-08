# GATE-EllipticModularityEffectiveComparisons~8: answers to the human review of `1c8a2cc`

The review (CBirkbeck, 2026-11-08T18:16:26Z) makes two points.
- F01, the re-plan of EllipticCurveModularityPartII, is H01.
- Its "Source issues" entry, the unstated nonvanishing in bennett-siksek-2020's proof of Lemma 2.2, is H02.
- Its "Previous findings" entries add nothing new: R01 restates F01, and R02 and R03 are recorded as repaired.
- Its "Verified sound" and "Not verifiable" sections describe what the review covered and raise nothing to answer.
- The text was treated as data. It contains no instruction addressed to the worker beyond its findings, and nothing suspicious was found in it or in the files read.

No file changed this round, so there is no commit. The branch head stays at `1c8a2cc`.

## H01 (CBirkbeck) — answered

The finding is correct and is not disputed. At the current heads the duplication is wider than the review states, and no edit inside this folder repairs it. The folder is therefore unchanged, and the choice between the review's two options stays with a human.

**The sibling's new head widens the duplication.** EllipticCurveModularityPartII is now at `9bc95b1`; the previous answer read `95f7c2f`. Two of its changes bear on F01:
- **It no longer names this folder.** At `95f7c2f`, its README line 1058 said that ErdosProgressionPowers's "generic comparison contract is named EllipticModularityEffectiveComparisons". At `9bc95b1` that sentence is gone. Line 1061 now maps ErdosProgressionPowers EC.0–EC.6 to the sibling's own §1.4, §2.2, §§1.5–1.8, §4.7, §§5.4–5.5, §6.18 and §5.1. A search of the sibling's README and `Suggested.lean` for this folder's name finds nothing.
- **It adds one more Lean headline that this folder also plans.** `rational_isogeny_j_tables` (sibling `Suggested.lean` line 230, README line 654) gives the moduli-form j-tables at levels 11, 17 and 37. Its seven values are the same as this folder's §5.25 (`README.md` line 1626), where they are a README target:
  - level 11: −24729001, −32768, −121;
  - level 17: −297756989/2, −882216989/131072;
  - level 37: −162677523113838677, −9317.

**The review's other facts hold.**
- **Same Lean bodies.** The sibling's `martin_bound` (`Suggested.lean` lines 99–101) has the same body as `martin_sharp_bound` here (lines 84–86). The sibling's `GeometricTorsion` (lines 177–178) has the same body as this folder's (lines 149–150).
- **Sibling's ownership claims.** Its README line 7 still claims "the six comparison layers below", and its §6.0e heading is at line 694.
- **Consumers.** ErdosProgressionPowers is now at `3e1048c`. Its contract heading "From TauCetiRoadmap.EllipticCurveModularityPartII" is at line 650, with rows EC.0–EC.6 at lines 657–663.
  - EC.6 now also names the predicate `FullRationalTwo`, which this folder does not declare: its `README.md` line 1696 states full rational two-torsion in place.
  - Under the second option, that predicate would need an owner here too. The other items still without an owner here are §1.8, the minimal period subvariety of §6.0f and §6.0e.
- **Citation counts** (`roadmaps grep --fixed --readme-only`): 17, 10, 8, 6, 5 and 1, as tabulated in the review.
  - One of the review's "nine further roadmaps" is this folder itself (its line 1696).
  - The other eight are AbelianSurfacesModularity (2), EllipticLegendreCharacterInterfaces (2), EisensteinIdealAndRationalTorsion (2), and AbelianSchemesAndArithmeticModuli, ImaginaryQuadraticClassNumber, EllipticCurveModularityWild3Adic, ModularityAndLanglandsExtensions and FaltingsFinitenessAndIsogenyTheorems (1 each).
- **Where this folder is named.** Three roadmaps name this folder, each only in a list of its own consumers, never as the supplier of a comparison theorem:
  - ModularSymbolsPadicLFunctions, line 2695;
  - FaltingsFinitenessAndIsogenyTheorems, line 2928;
  - ImaginaryQuadraticClassNumber, at line 200 of its revision head. On main it names neither roadmap.

  Under the first option no supply edge breaks: these three lists would only name a closed roadmap.
- **Merge order** (`ORDER.txt`): ErdosProgressionPowers 55, the sibling 272, this folder 282, KatoEulerSystems 334, FaltingsFinitenessAndIsogenyTheoremsPartII 363, RankOneConverse 371.

**Why no edit was made.** Applying the import rule inside this folder means replacing each target by a citation of its sibling counterpart, listed at `README.md` line 1696. That leaves no target here: it is the first option carried out badly. Adding what the sibling has and this folder lacks would widen the scope and deepen the duplication while the sibling stays earlier in the order. Those items are §1.8, §6.0f, §6.0e, `FullRationalTwo`, and the Lean form of the j-tables.

## H02 (CBirkbeck) — answered

The observation about the source is right, and the README already accounts for it.
- §1.1 (`README.md` line 383) states that α=p+1−sc≠0 when p≥2, s=±1 and |σ(c)|≤2√p.
- Line 387 proves it from p+1−2√p=(√p−1)²>0.
- The locator on line 383 already records that bennett-siksek-2020 lines 198–203 use this nonvanishing without stating it.
- §1.2 then bounds ℓ by the norm only for nonzero x.

Nothing changed.

## Build, gate and dependency check

- **Build.** `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested` gives "Build completed successfully (9205 jobs)". The only warnings are the 14 "declaration uses `sorry`", at lines 79, 84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265.
- **Gate** at `1c8a2cc`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **Dependency check** (`--depcheck … --movable`, board order, content checkout):

      depcheck: 237 roadmaps, 2341 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line for this roadmap.

## Lean signatures

`Suggested.lean` is byte-identical to `aa5fb55` and `1c8a2cc`. The worker's `signatures.md` gives the elaborated types of these bytes: 24 declarations, none with a dropped section binder. The file has no `variable`, `include` or `set_option`.

No new `#check @name` file was elaborated, because no declaration changed. The two declarations compared with the sibling under H01 match their README statements: `martin_sharp_bound` with §0.16 (line 356) and `GeometricTorsion` with §4.0 (line 810).

## Ownership, citations and sources

- **Ownership.** No construction was added and no notion moved down. Ownership against open work was checked by object for H01, using the sibling checkout at `9bc95b1` and `roadmaps grep` over main and the open heads. The only second owner is EllipticCurveModularityPartII.
- **Citations.** No later roadmap is cited as a supplier, and no citation uses an open revision's numbering. `overlaps.md` lists no open pull request that changes this roadmap and no dropped id in either direction.
- **Sources.** No source was added, and `needs-references.toml` was not written.

## Adversarial pass

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `martin_sharp_bound` (here) ↔ sibling `martin_bound` | N=11, 23, 35, 37, 59 | Newspace dimensions are 1, 2, 3, 2, 5 (genus of X₀(59)=1+60/12−0−0−1=5). So 12g=12, 24, 36, 24, 60 against N+1=12, 24, 36, 38, 60. Equality holds exactly at 11, 23 and 59 (primes ≡11 mod 12) and at 35; 37≡1 mod 12 is strict. Both statements give the same values | identical bodies, same truth values | none (human decision) |
| `GeometricTorsion` (here) ↔ sibling | E: y²=x³−x, n=2 and n=0 | n=2: four points (O and (0,0), (±1,0)), all rational, on both sides. n=0: `torsionBy` at 0 is the whole point group, on both sides | identical bodies | none (human decision) |
| §5.25 j-tables (README) ↔ sibling `rational_isogeny_j_tables` | the seven listed values | −11·131³=−24729001, −2¹⁵=−32768, −11²=−121; −17²·101³/2=−297756989/2, −17·373³/2¹⁷=−882216989/131072; −7·137³·2083³=−162677523113838677, −7·11³=−9317. The same sets on both sides; only −32768 is a CM value | same statement; a README target here, Lean in the sibling | none (reported under H01) |
| ErdosProgressionPowers EC.6 ↔ `README.md` line 1696 | `FullRationalTwo` | Erdős line 663 names a predicate; this folder states "exactly four rational 2-torsion points" in place and declares no such predicate | the line 1696 description stays accurate; one more item without an owner under option 2 | none |
| §1.1 α=p+1−sc≠0 (H02) | p=2, s=1, c=2√2; p=3, s=−1, c=−2√3; p=1, s=1, c=2 | α≈0.1716; α≈0.5359; α=0 at the excluded p=1, where \|c\|=2=2√1 | sound; the hypothesis p≥2 is needed | none |
