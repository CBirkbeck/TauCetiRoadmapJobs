# Review of GroupSchemesOverABase (pull request #1522 at c44b9b3)

**Verdict:** needs changes

Incremental re-review of 40 changed lines since 446fe51 (the two paragraphs of **Provenance: existing formalizations outside Tau Ceti** in `TauCetiRoadmap/GroupSchemesOverABase/README.md`). One finding, P3.

## R01 (P3) — The rewritten absence sentence says no tag treats the monomorphisms of 4.5; the `Groupoids` directory it names proves the immersion case (Stacks Tag 047T)

**Location:** `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 1503–1504: "No file name or tag in these directories treats the monomorphisms of 4.5, the approximation, quotients and factorization of 4.9".

**Claim:** `StacksFrontier/AlgebraicGeometry/Groupoids`, at the cited commit, states the case of `isClosedImmersion_of_mono` (4.5) and of its extension in 4.9 in which `u` is an immersion, with no finiteness or quasi-compactness hypothesis; the paragraph and the description name it nowhere.

**Witness:** `Groupoids/GroupSchemeProperties/Immersion.lean`: `@[stacks 047T]` `isClosedImmersion_of_isImmersion`, `[Field k]`, `(i : G' ⟶ G)`, `[IsImmersion i.hom.hom.left] : IsClosedImmersion i.hom.hom.left`. Stacks Lemma 39.7.8.

**Repair:** After "builds groupoid schemes over a base, their quotients and stabilizers." insert:

> Its `GroupSchemeProperties/Immersion.lean` has the case of the monomorphism statement of 4.5 and 4.9 in which the homomorphism is an immersion: an immersion of group schemes over a field is a closed immersion, with no hypothesis of finiteness or quasi-compactness (Tag 047T).

and replace "treats the monomorphisms of 4.5, the approximation" by "treats a monomorphism that is not assumed to be an immersion (4.5), the approximation". In the description's `## Provenance`, after "Cartier's theorem, 047N" add "; the monomorphism statement for an immersion, 047T". (Tested: `ℤ_k → 𝔾_a` in characteristic `0` has an image that is not locally closed, so it is no immersion and both statements exclude it; the open immersion `𝔾_m → 𝔾_m ⋊ ℤ/2` is closed on both sides; Frobenius of `𝔾_a` is neither a monomorphism nor an immersion.)

## Previous findings

- R01 — repaired: "the reduced subscheme of a group over a perfect field as a closed subgroup scheme, with no finiteness hypothesis and without its smoothness (Tag 047R, `ReductionSubgroupGlue.lean`) … of 4.9, the reducedness … (Tag 047O, `ReducedCharacteristicZeroGeneral.lean`)"; the description names 047R and 047O.

## Verified sound

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | Provenance: reduced subscheme over a perfect field, closed subgroup, "no finiteness hypothesis and without its smoothness" (Tag 047R, `ReductionSubgroupGlue.lean`) | file opened at c496df0; `μ_p/𝔽_p`; `X^{p²} = tX^p`, `k` imperfect | `exists_reduction_closedSubgroupScheme`: `[PerfectField k]`, no `LocallyOfFiniteType`; conclusion closed, surjective, reduced, no `Smooth`; `(μ_p)_red = 1`; imperfect case excluded on both sides | true |
| 2 | Provenance: "of 4.9, the reducedness of every group scheme over a field of characteristic `0`" (Tag 047O, `ReducedCharacteristicZeroGeneral.lean`) | file opened; `∏_ℕ 𝔾_a/ℚ`; `μ_p/𝔽_p` | `@[stacks 047O]` `isReduced_of_grpObj_of_charZero`: `[CharZero k]`, `[GrpObj (Over.mk f)]`, `IsReduced G`, no finiteness; polynomial ring reduced; `CharZero 𝔽_p` fails | true |
| 3 | Provenance: "four statements of 4.5" | 4.5's targets against the tags named | `isSeparated_of_field` 047L; `smooth_of_isReduced` 047P; `exists_reduced_subgroup` 047R (closed-subgroup part); `smooth_of_charZero` 047N: 4 | true |
| 4 | Provenance: "keeps it apart from its human-reviewed `StacksCore` tier"; "Lean and Mathlib v4.35.0" | the repository's README and `lean-toolchain` at c496df0 | two directories, `StacksCore` described as human-reviewed, `StacksFrontier` as written by AI agents, moved after review; toolchain `leanprover/lean4:v4.35.0` | true |
| 5 | Provenance: no file name or tag on "the approximation, quotients and factorization of 4.9" | 72 names of `OverField`; `AffineLimits`, `GenericQuotientFlat`, `AffineQuotientModel`, `RationalQuotientModel` opened; `∏_ℕ 𝔾_m` | Tag 0B7T (a homeomorphism of fibre products), no group; flatness of a rational quotient map on an open, steps of 047O; no `G/H`, no limit of finite-type groups, no factorization | true by file name and four files |
| 6 | Provenance: no file name or tag on the component schemes and groups (4.7–4.8), in `Groupoids` | 48 files, 12 directories listed; `OpenIdentityQuotient`, `OpenIdentityEtale` opened | general groupoid schemes with open identity, Tags 02WS, 02WW, 04S6: an algebraic-space quotient; no `G⁰`, no `π₀(G/k)` | true by file name and two files |
| 7 | Provenance: "No file name or tag … treats the monomorphisms of 4.5" | `Groupoids/GroupSchemeProperties/Immersion.lean`; `ℤ_k → 𝔾_a`; `𝔾_m → 𝔾_m ⋊ ℤ/2` | `@[stacks 047T]`: immersion of `k`-groups ⇒ closed immersion, no finiteness; `ℤ_k → 𝔾_a` not an immersion; open immersion of `𝔾_m` closed | R01 |
| 8 | 4.5 `isClosedImmersion_of_mono` (cited by the changed sentence) against `Suggested.lean` line 308 | elaborated signature; `ℤ_k → 𝔾_a`; Frobenius of `𝔾_a` | `LocallyOfFiniteType` on `H` and `G`, `QuasiCompact`, `Mono` on the scheme map; first not quasi-compact, second has kernel `α_p`: both excluded | true |
| 9 | Description `## Provenance` against the head | tags of the description and of README lines 1489–1507 | 047L, 047P, 047R, 047N, 047O, 047M, 0B7Q, 0B7P, 040M in both; three-dot diff outside the folder empty | true (R01's repair extends it) |

Rows for the untouched statements of the folder stand as in the previous review, of `446fe51`.

- **Gate.** Worker's gate (`scratch/gate.md`): every counter 0, `build=0`, OK. My rerun of the brief's command, without the candidate order: every counter 0 except `depcheck: NOT IN ORDER` (the placement the brief says is no finding).
- **Dependency check** (the brief's command, with the candidate order): `depcheck: 251 roadmaps, 2388 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; the candidate order lists the roadmap at line 75. The changed paragraphs name no roadmap.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 25 `declaration uses sorry` warnings, no other message. The file is unchanged since `446fe51`; the signature comparison and one-tactic probe of the earlier rounds stand.
- **External pages opened (17).** At c496df0: the repository's README and `lean-toolchain`; listings of `GroupScheme/OverField` (72 files), `Groupoids` (48 files, 12 directories), `Groupoids/OverField`, `Groupoids/GroupSchemeProperties`, `Groupoids/QuotientSheaf`; nine files (`ReductionSubgroupGlue`, `ReducedCharacteristicZeroGeneral`, `AffineLimits`, `GenericQuotientFlat`, `AffineQuotientModel`, `RationalQuotientModel`, `Immersion`, `OpenIdentityQuotient`, `OpenIdentityEtale`); Stacks Tag 047T.
- **Seeded sample.** Of the sampled targets only 4.5 lies in or is cited by the changed passage (rows 1–3, 7, 8); its SGA 3 locators were checked in the previous review and its text is unchanged.
- **Citation leads.** The two names of `scratch/citations.md` (`IsMultiplicativeType.exists_etale_cover`, `IsMultiplicativeType.isotrivial`) are declared in `Suggested.lean`.
- Overlap check: read PurityForFlatCohomology, ReductiveGroups (main), ReductiveGroupsPartII, ModularCurves as in the previous reviews, whose owners stand; the change adds no object and `scratch/overlaps.md` lists no shared roadmap, dropped id or second copy.
- Source independence: changed passages only; 4 passages compared with 2 sources (the repository's README and module docstrings; Stacks Tags 047R, 047O, 047T), none shared (longest run 5 words, "group scheme over a field of"); arrangement not compared again (no layer added, removed or reordered); largest share SGA 3, as in the previous rounds.

## Not verifiable

- That no file of the three directories treats 4.7, 4.8, the quotients and approximation of 4.9 or Layers 1–3 and 5–7: checked by file name and the nine files above, not by reading every file; the listings of `Groupoids` and of its subdirectories were read truncated, and `Groupoids/More` was not listed.
- That the `StacksFrontier` tier builds without `sorry`: the repository's README says so; not built here.
- Carried and untouched: Sansuc 1981 §6 and Popov 1974 §4; Demazure–Gabriel I; Slodowy, LNM 815; Jantzen II.1.8 and II.4.4, Humphreys 1.12, Bourbaki Lie VI §3 no. 4; Milne 2017 and SGA 3 VI_A for 4.6–4.7.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` lines 1479–1507 and 1560–1564 cite AxiomMath/Stacks (Apache-2.0 at c496df0). `Suggested.lean` is unchanged; its 4.5 statements differ from that repository's in name and binders (`exists_reduced_subgroup` adds `LocallyOfFiniteType` and `Smooth`).
- **Coordination.** `README.md` line 1486 says "adaptation is agreed with its maintainers first"; the description's `## Provenance` records that the maintainers "have not been contacted about this roadmap".
- **Ownership.** PurityForFlatCohomology (open, a825987) line 208 says diagonalizable groups, multiplicative type and tori over an arbitrary base are "owned here"; this README lines 41–48 owns the same. The edit is in that pull request.
- **Ownership.** Carried from the previous review, not reread (no checkout of it in this run): HeightsRationalPointsAndObstructions §3.8e owns the Picard group of a connected linear group over an algebraically closed field; 6.2 here (line 1207) owns the Picard groups over a field.
