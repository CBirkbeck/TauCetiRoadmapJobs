# Review of GroupSchemesOverABase (pull request #1522 at 446fe51)

**Verdict:** needs changes

Incremental re-review of 23 changed lines since 134ddbf (the second paragraph of **Provenance: existing formalizations outside Tau Ceti** in `TauCetiRoadmap/GroupSchemesOverABase/README.md`). One finding, P3.

## R01 (P3) — The provenance map lists the reduced subgroup of 4.5 as absent from the cited directory, which states it, and omits the characteristic-0 reducedness of 4.9, which the directory also states

**Location:** `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 1500–1501: "No file name or tag in these directories treats the reduced subgroup or monomorphisms of 4.5, the schemes and groups of connected components (4.7–4.8)".

**Claim:** `OverField`, at the cited commit, has the closed-subgroup part of 4.5's `exists_reduced_subgroup` (Stacks Tag 047R) and the statement of 4.9 that every group scheme in characteristic `0` is reduced (Tag 047O); the paragraph calls the first absent and names neither.

**Witness:** `OverField/ReductionSubgroupGlue.lean`: `exists_reduction_closedSubgroupScheme`, `[PerfectField k]`, `∃ L : ClosedSubgroupScheme G, Surjective … ∧ IsReduced …`, docstring Tag 047R, `@[sga "3 VIA 0.2"]`. `OverField/ReducedCharacteristicZeroGeneral.lean`: `@[stacks 047O]` `isReduced_of_grpObj_of_charZero`, `[CharZero k]`, citing Perrin 4.2.8.

**Repair:** In the paragraph, replace "It has the field case of three statements of 4.5: … (Tag 047N, `SmoothCharacteristicZero.lean`); and, of 0.2 and 4.6," by:

> It has the field case of four statements of 4.5: separatedness (Tag 047L, `Separated.lean`), smoothness of a reduced group locally of finite type over a perfect field (Tag 047P, `SmoothPerfectField.lean`), the reduced subscheme of a group over a perfect field as a closed subgroup scheme, with no finiteness hypothesis and without its smoothness (Tag 047R, `ReductionSubgroupGlue.lean`) and Cartier's theorem for groups locally of finite type (Tag 047N, `SmoothCharacteristicZero.lean`); of 4.9, the reducedness of every group scheme over a field of characteristic `0` (Tag 047O, `ReducedCharacteristicZeroGeneral.lean`); and, of 0.2 and 4.6,

and replace "treats the reduced subgroup or monomorphisms of 4.5, the schemes" by "treats the monomorphisms of 4.5, the approximation, quotients and factorization of 4.9, the schemes". Add 047R and 047O to the description's `## Provenance` in the same words. (Tested: for `μ_p/𝔽_p` both statements give the trivial closed subgroup; `X^{p²} = tX^p` over imperfect `k` is excluded on both sides by `PerfectField`; `∏_ℕ 𝔾_a/ℚ` is reduced on both sides.)

## Previous findings

- R01 — partly repaired: "It has the field case of three statements of 4.5: separatedness (Tag 047L, `Separated.lean`) … (Tag 0B7P, `QuasiCompact.lean`)" is right; the new absence sentence is wrong for the reduced subgroup (this report's R01).
- R02 — repaired: the description has `## Provenance`: "A secondary section maps AxiomMath, *The Stacks Project in Lean* (Apache-2.0, commit c496df0 …) … who have not been contacted about this roadmap."

## Verified sound

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | Provenance: separatedness, Tag 047L, `Separated.lean` | Stacks 047L; file list of `OverField` (72); constant `ℤ_k` | Lemma 39.7.3: a group scheme over a field is separated; file present; `ℤ_k` discrete, separated | true |
| 2 | Provenance: reduced, locally of finite type, perfect field ⇒ smooth, Tag 047P, `SmoothPerfectField.lean` | Stacks 047P; `Y^p = tX^p`; `μ_p/𝔽_p` | Lemma 39.8.4 (perfect, char `p > 0`, locally algebraic, reduced ⇒ smooth); imperfect `k`: not smooth; `μ_p` not reduced | true |
| 3 | Provenance: Cartier, Tag 047N, `SmoothCharacteristicZero.lean` | Stacks 047N; SGA 3 VI_B 1.6.1; `μ_n/ℚ`, `μ_p/𝔽_p` | Lemma 39.8.2 and `sga3-6b` line 316: char 0, locally of finite type ⇒ smooth; étale; `(x−1)^p` not reduced | true |
| 4 | Provenance: "irreducibility of a connected group (Tag 0B7Q)", "quasi-compactness of an irreducible one (Tag 0B7P)", of 4.6 | Stacks 0B7Q, 0B7P; 4.6's route; `ℤ_k`; `μ₃/ℚ` | Lemma 39.7.10: connected ⇒ irreducible; 39.7.9: irreducible ⇒ quasi-compact; `G⁰(ℤ_k)` = one point; `μ₃`: 2 components, each irreducible | true |
| 5 | Provenance: `𝔾_m` and `μ_n` over a base (Tag 040M), `Examples` | Stacks 040M; listing of `GroupScheme/Examples` (12) | Example 39.5.2: `μ_n = Spec ℤ[x]/(x^n − 1)` and its base change; `Multiplicative.lean`, `RootsOfUnity.lean` present | true |
| 6 | Provenance: "`StacksFrontier/AlgebraicGeometry/Groupoids` builds groupoid schemes over a base, their quotients and stabilizers" | listing of that directory | exists; `Basic.lean`, directories `FiniteFlatQuotient`, `QuotientSheaf`, `Stabilizer` | true |
| 7 | Provenance: "No file name or tag … treats the reduced subgroup … of 4.5" | 72 file names of `OverField`; `ReductionSubgroupGlue.lean` opened; `μ_p/𝔽_p` | `exists_reduction_closedSubgroupScheme`, perfect `k`, closed, surjective, reduced; Tag 047R = Lemma 39.7.6; `(μ_p)_red = 1` on both sides | R01 |
| 8 | 4.9 "In characteristic `0` every `k`-group is geometrically reduced" against the directory | `ReducedCharacteristicZeroGeneral.lean`; `∏_ℕ 𝔾_a/ℚ`; `μ_p/𝔽_p` | `@[stacks 047O]`, `[CharZero k]`, `IsReduced G`, no finiteness; polynomial ring reduced; `CharZero` fails | R01 (unnamed in the map) |
| 9 | Provenance: no file name on the component schemes and groups (4.7–4.8) | 72 names; `GaloisFixedComponentDescent.lean` opened | Tag 038J, on irreducible components fixed by Galois; no `π₀`, no étale quotient `G/G⁰` | true by file name |
| 10 | 0.2 `exists_identityComponent` (cited by the changed passage) | SGA 3 VI_B 3.9, 3.10; `μ₂/ℤ`; `(ℤ/2)_S` | `sga3-6b` line 808: `G⁰ → G` open immersion, quasi-compact; line 821 (i)⇔(iv): smooth along the unit ⇔ `G⁰` open, smooth; `μ₂` not smooth, excluded | true |
| 11 | 4.5 `isClosedImmersion_of_mono` (listed absent) | SGA 3 VI_B 1.4.2; `ℤ_k → 𝔾_a`; Frobenius of `𝔾_a` | `sga3-6b` line 262: Artin local base, quasi-compact, locally of finite type, monomorphism ⇔ closed immersion; not quasi-compact; kernel `α_p` | true |
| 12 | Description: "Nothing outside the folder changes"; `## Provenance` | three-dot diff outside the folder; README lines 1479–1503 | empty; tags 047L, 047P, 047N, 047M, 0B7Q, 0B7P, 040M in both; 047R, 047O in neither | true (R01's repair extends it) |

Rows for the untouched statements of the folder stand as in the previous review, of `134ddbf`.

- **Gate.** Worker's gate (`scratch/gate.md`): every counter 0, `build=0`, OK. My rerun of the brief's command, without the candidate order: every counter 0 except `depcheck: NOT IN ORDER` (the placement the brief says is no finding).
- **Dependency check** (the brief's command, with the candidate order): `depcheck: 235 roadmaps, 2239 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; the candidate order lists the roadmap at line 74. The changed paragraph names no roadmap.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 25 `declaration uses sorry` warnings, no other message. The file is unchanged by this head; the signature comparison and one-tactic probe of the earlier rounds stand.
- **External pages opened (20).** Listings at c496df0 of `GroupScheme`, `GroupScheme/OverField`, `GroupScheme/Examples`, `GroupScheme/Subgroups`, `GroupScheme/OverFieldProperties`, `Groupoids`, `AlgebraicGeometry`; six files (`ReductionSubgroupGlue`, `ReducedCrux`, `ReducedCharacteristicZeroGeneral`, `GaloisFixedComponentDescent`, `AffineLimits`, `OverFieldProperties/Reduction`); Stacks Tags 047L, 047N, 047P, 047R, 0B7P, 0B7Q, 040M.
- **Source locators checked against the text (4).** SGA 3 VI_B 1.4.2, 1.6.1, 3.9, 3.10 (`sga3-6b` lines 262, 316, 808, 821).
- **Citation leads.** The two names of `scratch/citations.md` (`IsMultiplicativeType.exists_etale_cover`, `IsMultiplicativeType.isotrivial`) are declared in `Suggested.lean` lines 178 and 195.
- Remark: `GroupScheme/OverFieldProperties/Reduction.lean` carries `@[stacks 047R]` for the same statement; it lies outside the three directories the paragraph names.
- Overlap check: read PurityForFlatCohomology, ReductiveGroups (main), ReductiveGroupsPartII, ModularCurves as in the previous reviews, whose owners stand; the change adds no object and `scratch/overlaps.md` lists no shared roadmap, dropped id or second copy.
- Source independence: changed passages only; 3 passages compared with 2 sources (the repository's module docstrings, Stacks Tags 047L–0B7Q), none shared (longest run 4 words, "group scheme over a field"); arrangement not compared again (no layer added, removed or reordered); largest share SGA 3, as in the previous rounds.

## Not verifiable

- That no file of the three directories treats the monomorphisms of 4.5, 4.7, 4.8 or Layers 1–3 and 5–7: checked by file name and six opened files, not by reading every file; the `Groupoids` listing was read truncated (58 files, 12 directories visible).
- That the `StacksFrontier` tier builds without `sorry`: the repository's README says so; not built here.
- 4.6 and 4.7 of the seeded sample, which the changed passage cites: their locators (SGA 3 VI_A; Milne 2017) are not in the sources cache and were not reread; the other sampled targets lie in no changed passage.
- Carried and untouched: Sansuc 1981 §6 and Popov 1974 §4; Demazure–Gabriel I; Slodowy, LNM 815; Jantzen II.1.8 and II.4.4, Humphreys 1.12, Bourbaki Lie VI §3 no. 4.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` lines 1479–1503 and 1554–1558 cite AxiomMath/Stacks (Apache-2.0 at c496df0). `Suggested.lean` is unchanged; its 4.5 statements differ from that repository's in name and binders (`exists_reduced_subgroup` adds `LocallyOfFiniteType` and `Smooth`).
- **Coordination.** `README.md` line 1486 says "adaptation is agreed with its maintainers first"; the description's `## Provenance` now records that the maintainers "have not been contacted about this roadmap".
- **Ownership.** PurityForFlatCohomology (open, a825987) line 208 says diagonalizable groups, multiplicative type and tori over an arbitrary base are "owned here" (§§7.12a–7.12e, line 2215); this README lines 41–48 owns the same. The edit is in that pull request.
- **Ownership.** HeightsRationalPointsAndObstructions (open, ece41e2) §3.8e owns the Picard group of a connected linear group over an algebraically closed field; 6.2 here (line 1207) owns the Picard groups over a field. The edit is in that pull request.
