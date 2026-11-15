# Review of GroupSchemesOverABase (pull request #1522 at 134ddbf)

**Verdict:** needs changes

Incremental re-review of 25 changed lines since 180c164 (25 insertions in `TauCetiRoadmap/GroupSchemesOverABase/README.md`: the section **Provenance: existing formalizations outside Tau Ceti** and one entry of **References**). Two findings, both P3.

## R01 (P3) — The provenance map omits 4.5, where the cited directory proves three of this roadmap's targets, and its two other scope sentences are not what the directory shows

**Location:** `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 1489–1498: "centers, stabilizers, actions and abelian varieties, the field case of 0.2 and of 4.6–4.8" and "No file name or tag there treats diagonalizable groups".

**Claim:** The map names 0.2 and 4.6–4.8 only. The cited directory, at the cited commit, states 4.5's `isSeparated_of_field`, `smooth_of_isReduced` and `smooth_of_charZero` at this roadmap's generality; no file name there names the `π₀` of 4.7–4.8; `Examples/` treats `𝔾_m` and `μ_n`.

**Witness:** `OverField/Separated.lean` (Tag 047L) `isSeparated_of_groupScheme_over_field`; `SmoothCharacteristicZero.lean` (047N) `smooth_of_groupScheme_of_charZero`, `[LocallyOfFiniteType f]`; `SmoothPerfectField.lean` (047P); `Irreducible.lean` (0B7Q), `QuasiCompact.lean` (0B7P); `GroupScheme/Examples/RootsOfUnity.lean` (040M), `Multiplicative.lean`.

**Repair:** Replace the second paragraph of the section by:

> `StacksFrontier/AlgebraicGeometry/GroupScheme/OverField` follows the Stacks chapter *Groupoid Schemes* over a field. It has the field case of three statements of 4.5: separatedness (Tag 047L, `Separated.lean`), smoothness of a reduced group locally of finite type over a perfect field (Tag 047P, `SmoothPerfectField.lean`) and Cartier's theorem for groups locally of finite type (Tag 047N, `SmoothCharacteristicZero.lean`); and, of 0.2 and 4.6, the irreducible component through the unit with its geometric irreducibility (Tag 047M, `IdentityComponent.lean`, `IdentityComponentGeometric.lean`), the irreducibility of a connected group (Tag 0B7Q, `Irreducible.lean`) and the quasi-compactness of an irreducible one (Tag 0B7P, `QuasiCompact.lean`). It also has centers, stabilizers, actions and abelian varieties, which are no target here. `StacksFrontier/AlgebraicGeometry/GroupScheme/Examples` has `𝔾_m` and `μ_n` over a base (Tag 040M), which this roadmap takes from Tau Ceti. `StacksFrontier/AlgebraicGeometry/Groupoids` builds groupoid schemes over a base, their quotients and stabilizers. No file name or tag in these directories treats the reduced subgroup or monomorphisms of 4.5, the schemes and groups of connected components (4.7–4.8), `D_S(M)` for a general `M`, groups of multiplicative type and tori (Layers 1–2), rigidity, density of torsion and Hom schemes (Layer 3), rank functions and maximal tori over a base (Layer 5), Picard groups of the flag scheme (Layer 6) or the Steinberg map (Layer 7).

If a file there does treat 4.1–4.4, 4.7, 4.8 or 4.9, name it with its tag instead of listing the target as absent.

## R02 (P3) — The description does not state the new section or its reference

**Location:** pull request description, `## Sources` (ten bullets, from "SGA 3, *Schémas en groupes*" to "J. E. Humphreys"), and `## Scope`.

**Claim:** The head adds a section on an existing Lean formalization and a References entry for it; the description names neither, and its source list is no longer the README's.

**Witness:** `README.md` line 1479 `## Provenance: existing formalizations outside Tau Ceti`; lines 1549–1553, the entry "AxiomMath, *The Stacks Project in Lean*"; the description has 0 occurrences of "AxiomMath", "Provenance" and "formalization".

**Repair:** Add to `## Sources`: "- AxiomMath, *The Stacks Project in Lean* (Apache-2.0, commit c496df0), an existing Lean formalization of the field case of 0.2, 4.5 and 4.6; cited in the README's provenance section, not a dependency and not adapted in `Suggested.lean`." Say there whether its maintainers were contacted.

## Previous findings

- none: the previous report, of 180c164, had no finding.

## Verified sound

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | Provenance: "built on Lean and Mathlib v4.35.0, earlier than our pin"; Apache-2.0; `StacksFrontier` by AI agents, no `sorry` | cited commit c496df0: `lean-toolchain`, `lake-manifest.json`, `LICENSE`, its README; this repository's `lean-toolchain` | `leanprover/lean4:v4.35.0`; mathlib `inputRev` `v4.35.0`; Apache 2.0; "written by AI agents", "no `sorry`"; ours `v4.36.0-rc2` | true (its README's prose says v4.34.0-rc2; the toolchain file is what the roadmap states) |
| 2 | Provenance: Tag 047M, `IdentityComponent.lean`, `IdentityComponentGeometric.lean` | Stacks Tag 047M; the two files at the commit | Lemma 39.7.4, chapter *Groupoid Schemes*: one irreducible component through `e`, geometrically irreducible; both files carry `@[stacks 047M]` | true |
| 3 | Provenance: "the field case of 0.2 and of 4.6–4.8" | file names of `OverField` (72) against 4.5–4.8 | 4.5: `Separated`, `SmoothPerfectField`, `SmoothCharacteristicZero` present, unnamed; 4.6: `Irreducible`, `QuasiCompact` present; 4.7–4.8: 0 file names on a component scheme or group | R01 |
| 4 | Provenance: "No file name or tag there treats diagonalizable groups" | `GroupScheme/Examples` (12 entries) | `Multiplicative.lean`, `RootsOfUnity.lean` (Tag 040M: `μ_n` over `ℤ` and over a base, `0 < n`); no `D(M)`, torus or multiplicative-type file name | R01 |
| 5 | 4.5 `isSeparated_of_field` against 047L there | constant `ℤ_k`; `μ_p/𝔽_p`; the two statements | discrete, separated; `Spec 𝔽_p[x]/(x−1)^p`, affine, separated; ours `IsSeparated G.X.hom`, theirs `G.X.left.IsSeparated`: equivalent, `Spec k` being affine | same statement, different name and form |
| 6 | 4.5 `smooth_of_charZero` against 047N there | `μ_n/ℚ`; `μ_p/𝔽_p`; `∏_ℕ 𝔾_a/ℚ` | étale (`n ∈ ℚˣ`); `(x−1)^p`, not reduced, `CharZero` fails; not locally of finite type, excluded on both sides | same hypotheses `[CharZero k] [LocallyOfFiniteType]`, same conclusion `Smooth` |
| 7 | 4.5 `smooth_of_isReduced` against 047P there | `Y^p = tX^p ⊂ 𝔾_a²`, `t ∈ k − k^p`; `μ_p/𝔽_p` | reduced, `(Y − t^{1/p}X)^p` over `k(t^{1/p})`: not smooth, `k` imperfect; `𝔽_p` perfect, `μ_p` not reduced | same hypotheses `[PerfectField k] [LocallyOfFiniteType] [IsReduced]` |
| 8 | Description: "Nothing outside the folder changes"; three files; five suppliers still open | diff outside the folder; folder listing; `depends-on` block | empty; `README.md`, `Suggested.lean`, `metadata.toml`; block unchanged, no supplier added by the change | true |

Rows for the untouched statements of the folder stand as in the previous review, of `180c164`.

- **Gate.** Worker's gate (`scratch/gate.md`): every counter 0, `build=0`, OK. My rerun of the brief's command, without the candidate order: every counter 0 except `depcheck: NOT IN ORDER` (the placement the brief says is no finding).
- **Dependency check** (the brief's command, with the candidate order): `depcheck: 239 roadmaps, 2260 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; the candidate order lists the roadmap at line 73. The new section names no roadmap and adds no supplier.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 25 `declaration uses sorry` warnings, no other message. The file is unchanged since `4a23b23`; the signature comparison and the one-tactic probe of the earlier rounds stand.
- **External pages opened (19).** The repository's root, `lean-toolchain`, `lake-manifest.json` and README at c496df0; the listings of `GroupScheme`, `GroupScheme/OverField`, `GroupScheme/Examples`, `GroupScheme/OverFieldProperties`, `Groupoids`; nine files (`IdentityComponent`, `IdentityComponentGeometric`, `Separated`, `SmoothCharacteristicZero`, `SmoothPerfectField`, `Irreducible`, `QuasiCompact`, `AffineLimits`, `Examples/RootsOfUnity`); Stacks Tag 047M.
- **Shape.** The repository's `README.md` line 339 asks for "a clearly secondary provenance section"; ModularCurves on main has one (line 4650). The section has no target, no backticked name of this roadmap and no supplier; its first sentence says it prescribes nothing.
- **Reuse.** `Suggested.lean` is unchanged by this head; its three 4.5 declarations and the repository's differ in name and binders (`G : Grp (Over …)` here, `(f : G ⟶ Spec …) [GrpObj (Over.mk f)]` there for 047N and 047P).
- Overlap check: read PurityForFlatCohomology, ReductiveGroups (main), ReductiveGroupsPartII, ModularCurves as in the previous review, whose owners stand; the change adds no object and `scratch/overlaps.md` lists no shared roadmap, dropped id or second copy.
- Source independence: changed passages only; 2 passages compared with 2 sources (the repository's README, Stacks Tag 047M), none shared (longest run 4 words, "written by AI agents"); arrangement not compared again (no layer added, removed or reordered); largest share SGA 3, as in the previous rounds.

## Not verifiable

- That no file of the cited directories treats 4.1–4.4, 4.7, 4.8, 4.9 or Layers 1–3 and 5–7: checked by file name only (as the section itself does), not by reading every file; the listings were read through the rendered pages.
- That the `StacksFrontier` tier builds without `sorry`: the repository's README says so; not built here.
- Carried and untouched: Sansuc 1981 §6 and Popov 1974 §4; Demazure–Gabriel I; Slodowy, LNM 815; Jantzen II.1.8 and II.4.4, Humphreys 1.12, Bourbaki Lie VI §3 no. 4.
- The seeded sample was not reread, except 4.5 (rows 5–7): no other sampled target lies in or is cited by a changed passage.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` lines 1479–1498 and 1549–1553 cite AxiomMath/Stacks (Apache-2.0 `LICENSE` at c496df0; the files opened have no copyright header). `Suggested.lean` is unchanged; its 4.5 statements differ from that repository's in name and binders.
- **Coordination.** `README.md` line 1487 says "adaptation is agreed with its maintainers first"; the repository's `README.md` (**Porting existing work**) asks to coordinate with the authors of existing material. Neither the README nor the description records a contact.
- **Ownership.** PurityForFlatCohomology (open, a825987) line 208 says diagonalizable groups, multiplicative type and tori over an arbitrary base are "owned here" (§§7.12a–7.12e); this README lines 41–48 owns the same. The edit is in that pull request.
- **Ownership.** HeightsRationalPointsAndObstructions (open) §3.8e, line 1559, proves the Picard groups of a split reductive group over a field itself; 6.2 here (line 1207) owns them. The edit is in that pull request.
