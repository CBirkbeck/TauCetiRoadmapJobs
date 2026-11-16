# Review of GroupSchemesOverABase (pull request #1522 at 744fcb4)

**Verdict:** accepted

Incremental re-review of 15 changed lines since c44b9b3 (the last paragraph of **Provenance: existing formalizations outside Tau Ceti**, `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 1503–1511). No finding.

## Previous findings

- R01 — repaired: "Its `GroupSchemeProperties/Immersion.lean` has the case … in which the homomorphism is an immersion … (Tag 047T). No file name or tag in these directories treats a monomorphism that is not assumed to be an immersion (4.5)"; the description names 047T.

## Verified sound

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | Provenance: `GroupSchemeProperties/Immersion.lean` has "an immersion of group schemes over a field is a closed immersion, with no hypothesis of finiteness or quasi-compactness (Tag 047T)" | file opened at c496df0; Stacks Lemma 39.7.8 opened | `@[stacks 047T]` `isClosedImmersion_of_isImmersion`: `[Field k]`, `(i : G' ⟶ G)`, `[IsImmersion i.hom.hom.left]`; no `LocallyOfFiniteType`, `QuasiCompact`, `Mono`; no `sorry`. Tag 047T: same hypotheses | true |
| 2 | Provenance: this is "the case of the monomorphism statement of 4.5 and 4.9 in which the homomorphism is an immersion" | `ℤ_k → 𝔾_a`, characteristic `0`; `𝔾_m → 𝔾_m ⋊ ℤ/2`; Frobenius of `𝔾_a` | image of `ℤ_k` infinite, closed points only, not locally closed: no immersion, excluded on both sides; open immersion of `𝔾_m` closed (index 2); Frobenius has kernel `α_p`: neither mono nor immersion | true |
| 3 | Provenance: "No file name or tag in these directories treats a monomorphism that is not assumed to be an immersion (4.5)" | listing of `Groupoids/GroupSchemeProperties` at c496df0 (9 files); other declarations of `Immersion.lean` | `CompactImageAffineOpen`, `Dimension`, `EquivariantModule`, `EquivariantQuasicoherentModule`, `Immersion`, `InvariantAffineOpen`, `RationalPointsAffineOpen`, `TangentIdentity`, `Torsor`; `Immersion.lean`: one tagged theorem, two groupoid constructions | true by file name |
| 4 | 4.5 `isClosedImmersion_of_mono` and its extension in 4.9 (cited by the changed sentences), README lines 873–881 and 1012–1017, against `Suggested.lean` line 308 | elaborated signature; `ℤ_k → 𝔾_a`; Frobenius of `𝔾_a` | `LocallyOfFiniteType` on `H`, `G`; `QuasiCompact`, `Mono` on the scheme map; first not quasi-compact, second not mono: both excluded. 4.9 line 1015: quasi-compact monomorphism, no finiteness | true |
| 5 | Description `## Provenance` against the head | tags of the description and of README lines 1489–1511 | 047L, 047P, 047R, 047N, 047T, 047O, 047M, 0B7Q, 0B7P, 040M in both; diff outside the folder empty; `Suggested.lean` unchanged (33 declarations) | true |

Rows for the untouched statements of the folder stand as in the previous review, of `c44b9b3`.

- **Gate.** Worker's gate (`scratch/gate.md`): every counter 0, `build=0`, OK. My rerun of the brief's command, without the candidate order: every counter 0 except `depcheck: NOT IN ORDER` (the placement the brief says is no finding).
- **Dependency check** (the brief's command, with the candidate order): `depcheck: 251 roadmaps, 2387 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; the candidate order lists the roadmap at line 75. The changed sentences name no roadmap.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 25 `declaration uses sorry` warnings, no other message. The file is unchanged since `c44b9b3`; the signature comparison and one-tactic probe of the earlier rounds stand.
- **External pages opened (3).** At c496df0: `Groupoids/GroupSchemeProperties/Immersion.lean` (twice: signature, docstrings) and the listing of `Groupoids/GroupSchemeProperties`; Stacks Tag 047T.
- **Seeded sample.** Of the sampled targets only 4.5 is cited by the changed passage (rows 1–4); its SGA 3 locators were checked in the earlier rounds and its text is unchanged.
- **Citation leads.** The two names of `scratch/citations.md` (`IsMultiplicativeType.exists_etale_cover`, `IsMultiplicativeType.isotrivial`) are declared in `Suggested.lean`.
- Overlap check: read PurityForFlatCohomology, ReductiveGroups (main), ReductiveGroupsPartII, ModularCurves as in the previous reviews, whose owners stand; the change adds no object and `scratch/overlaps.md` lists no shared roadmap, dropped id or second copy.
- Source independence: changed passages only; 2 passages compared with 2 sources (the module and theorem docstrings of `Immersion.lean`; Stacks Tag 047T), none shared (longest run 6 words, "immersion of group schemes over a field", forced by the statement); arrangement not compared again (no layer added, removed or reordered); largest share SGA 3, as in the previous rounds.

## Not verifiable

- That no file of the three directories treats a monomorphism that is no immersion, 4.7, 4.8, the quotients and approximation of 4.9 or Layers 1–3 and 5–7: checked by file name and the files opened in this and the previous round, not by reading every file; the listing of `Groupoids/GroupSchemeProperties` may be truncated.
- That the `StacksFrontier` tier builds without `sorry`: the repository's README says so; not built here (`Immersion.lean` has none).
- Carried and untouched: Sansuc 1981 §6 and Popov 1974 §4; Demazure–Gabriel I; Slodowy, LNM 815; Jantzen II.1.8 and II.4.4, Humphreys 1.12, Bourbaki Lie VI §3 no. 4; Milne 2017 and SGA 3 VI_A for 4.6–4.7.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` lines 1479–1511 and 1563–1567 cite AxiomMath/Stacks (Apache-2.0 at c496df0). `Suggested.lean` is unchanged; its 4.5 statements differ from that repository's in name and binders (`isClosedImmersion_of_mono` assumes `Mono` and `QuasiCompact`, not `IsImmersion`).
- **Coordination.** `README.md` line 1486 says "adaptation is agreed with its maintainers first"; the description's `## Provenance` records that the maintainers "have not been contacted about this roadmap".
- **Ownership.** PurityForFlatCohomology (open, a825987) line 208 says diagonalizable groups, multiplicative type and tori over an arbitrary base are "owned here"; this README lines 41–48 owns the same. The edit is in that pull request.
- **Ownership.** Carried from the earlier reviews, not reread: HeightsRationalPointsAndObstructions §3.8e owns the Picard group of a connected linear group over an algebraically closed field; 6.2 here (line 1207) owns the Picard groups over a field.
