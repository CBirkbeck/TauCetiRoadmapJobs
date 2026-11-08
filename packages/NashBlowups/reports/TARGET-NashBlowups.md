# Triage report: TARGET-NashBlowups

Verdict: `design`, name `NashBlowups`. Brief: `packages/NashBlowups/target.md`; manifest: `packages/NashBlowups/sources.toml`.

A note on the run: the board checkout was reset between the previous run of this job and this one, and the deliverables that run had written were gone, although its scratch notes and the sources cache survived. Every check was redone and every file rewritten; the manifest was rebuilt from the service's records, with the earlier run's wrong metadata for the Duarte–Núñez-Betancourt entry (the service had resolved the title to an unrelated arXiv paper) replaced by the correct arXiv id 2001.10491.

## What was searched

- **Open targets and designs on the board** (the list in the brief): none concerns Nash blowups, Grassmannians of quotients, normalisation or resolution of singularities. `DESIGN-DynamicalDegreesOfRationalMaps` uses graph closures of rational maps and `TARGET-VirtualFundamentalClasses` uses Chow groups; neither plans the Nash blowup or its iteration. No merge.
- **Roadmaps on main and at open PR heads**, with `roadmaps grep` for `nash (blow|modif|transform)`, `nobile`, `gauss map`, `semple`, `spivakovsky`, `grassmannian (of|functor)`, `Grass_`, `locally free quotient`, `sheaf of (relative) differentials`, `cotangent sheaf`, `smooth locus`, `normalisation/normalization`: no roadmap mentions the Nash blowup, Nobile's theorem or the Gauss map of a variety (the "Gauss map" hits are the continued-fraction map and the Gauss map of an immersion). The Grassmannian of quotients is owned by ModularCurves Layer 0G (finite locally free, with charts and the Plücker closed immersion; PR #1101 head) and AlgebraicModuliForArithmeticGeometry §1.3 (finite type quasi-coherent, `coherentGrassmannian`, PR #853, merge order line 32). The sheaf `Ω_{X/S}` is StableReduction Layer 1 (main). Normal schemes, modifications, strict transforms, Chow's lemma, regular and smooth loci, and resolution of curves by normalisation are SchemeAndStackFoundations §0.30, §4.11, §4.12, §4.13 (main).
- **Board packages**: `ResolutionOfSingularitiesCharacteristicZero` (PR #1199, merge order line 15) was read by its headers and grepped for Nash, normalisation, Jacobian, smooth locus: it is Hironaka-style (marked ideals, maximal contact, Hilbert–Samuel invariants, principalisation) and plans no canonical modification. `AnalyticToricGeometry` (Completed) and `AnalyticToricGeometryPartII` (PR, merge order line 150) contain no Nash blowup or logarithmic Jacobian ideal. The packages-under-review index (`AnalyticNumberTheory`, `AutomorphicCongruences`, `LawrenceVenkateshMethod`, `LogicAndDefinabilityInNumberTheory`) is unrelated.
- **Pinned libraries**: Mathlib has `Scheme.Hom.normalization` (relative normalisation of a qcqs morphism, integral, with universal property `normalizationDesc` / `normalization.hom_ext`, smooth base change), `Scheme.Hom.smoothLocus`, `Smooth`, `Scheme.Birational`, `IdealSheafData.radical`, and the affine Grassmannian functor `Module.Grassmannian` (its header lists the scheme and representability as TODO). It has no sheaf of differentials on schemes, no blowup of schemes, no Kunz theorem, no finiteness of normalisation. Tau Ceti has `normalizationMap` (functoriality of relative normalisation), `IsPureDimensional`, vector-bundle exterior powers, and node blowup charts; nothing on Nash blowups.

Conclusion: nothing plans the target, so it is neither `duplicate` nor `merge-into`.

## Why `design` and not `part-ii`

The target does not continue any roadmap in its own direction. The nearest roadmaps are suppliers: it builds on the Grassmannian, the differentials and the normalisation, and it is a sibling of the Hironaka-style resolution roadmap rather than its continuation (that roadmap is earlier in the merge order and plans chosen blowup sequences on smooth ambient schemes; the Nash blowup is a different object with a different universal property). A Part II of `ResolutionOfSingularitiesCharacteristicZero` would have to start where it stops, which is embedded resolution in characteristic zero, not canonical modifications.

## Generality

The filed Setting (reduced separated finite type, pure dimension `d`, dense smooth locus) is already the right generality for the constructions and is kept, with the equivalence "dense smooth locus iff geometrically reduced" (Stacks 056V) made a target. The sources state the smoothness criteria over algebraically closed fields; the brief keeps Nobile's theorem over an arbitrary field of characteristic zero (by base change, which the Nash blowup commutes with) and keeps the positive-characteristic normal case over an algebraically closed field as the source does, with the perfect-field extension left to the design. The filed "locally free quotient" Grassmannian is imported from its owners; the roadmap plans at most the surjection-to-closed-immersion lemma. The toric Annals theorem is explicitly a consumer's statement: the roadmap's job is to make it statable and to prove the "never resolves" principle it feeds.

## Name

`NashBlowups`, the suggested name; no roadmap, pull request or package uses it (checked against the roadmap list, the merge order and `packages/`).

## Sources

Fetched through the sources service and read: Nobile 1975 (MSP's open back-issue scan, publisher-open), Nobile's 2024 survey notes (arXiv), Duarte–Núñez-Betancourt (arXiv 2001.10491), Castillo–Duarte–Leyton-Álvarez–Liendo (arXiv 2409.19767v3), González-Sprinberg 1982 (Numdam), Stacks Morphisms §§54–55 and Varieties §25. Recorded as `uncertified` (paywalled, cited by locator): Hironaka 1983, Spivakovsky 1990 (DOI corrected to 10.2307/1971467 after a Crossref lookup; the service's first guess 10.2307/1971471 is a different paper), Semple 1954, Teissier 1982, EGA I. The service wrote `[[missing]]` entries for the last three and for the DOI-landing failure of Nobile; Nobile was then fetched from the publisher's open PDF, and the three paywalled texts were entered by hand as `uncertified`, which the brief treats as settled, so `needs-references.toml` was removed. No final target depends on a paywalled text.

Locators in the brief were checked against the extractions: Nobile 1975 Theorem 1 (line 105) and Theorem 2 (line 143); Nobile 2024 Theorem 2.1 (line 143), the universal-property paragraph (lines 153–162), Proposition 2.3 (line 179), Theorem 5.1 (line 362); Duarte–Núñez-Betancourt Definition 2.1 (line 127), Theorem 2.3 (line 136), Theorem 3.10 (line 256); the Annals paper's definitions (lines 13–21) and main Theorem (lines 58–67); Stacks 035N, 035P, 0AB1, 035S (lines 6498, 6521, 6627, 6651 of the Morphisms extraction) and 056V (line 2112 of the Varieties extraction).

## Suspicious text

None. No fetched text contained instructions.
