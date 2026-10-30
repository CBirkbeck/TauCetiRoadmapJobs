# Review of PolynomialGaloisGroups (pull request #986 at 2e4a762)

**Verdict:** needs changes

:robot: AI review. Incremental re-review of 10 changed lines since 23cb9bf: the diff touches `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean` only, replacing the three plain `import` lines by `module`, three `public import` lines and a `public section` before the namespace. `README.md` is byte-identical to the previous head, no file outside the folder changed, and the pins are unchanged (Mathlib `f6090c70`, Tau Ceti `358314d4` in both the pull-request worktree and main's manifest). The header change repairs the gate's build failure (previous R03). The roadmap identity (previous R01) and the missing sources manifest (previous R02) are untouched and are carried.

## R01 (P2) — One owner for the radical criterion, with its own roadmap identity

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:3`, “This roadmap continues the completed Polynomial Galois Groups roadmap”; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:21`, `namespace TauCetiRoadmap.PolynomialGaloisGroups`; `README.md:122`, “## Layer 1: the radical criterion for finite Galois extensions”.

**Claim:** this extension still uses the completed base's folder name and namespace, so “PolynomialGaloisGroups, Layer 1” denotes both the base's permutation theory (on main) and this continuation's radical criterion, and a consumer citing the base by section cannot resolve uniquely. In addition, the same author's other open pull request for the same folder (title “Galois groups of polynomials, part III”, head `3baabd6` in the index of this round) states the same radical theorems under its own namespace. Two open proposals each build the radical criterion; a roadmap has one owner.

**Witness:** `Completed/PolynomialGaloisGroups/Suggested.lean:60` on main opens the same namespace as this file's line 21; `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:26` (open head) cites “PolynomialGaloisGroups, Layers 0 and 1” meaning the base's permutation layers. `roadmaps grep 'isSolvable_gal_iff_forall_rootSet_mem_solvableByRad'` this round hits two open proposals: this file's line 50 and the other proposal's `Suggested.lean:71` (namespace `TauCetiRoadmap.PolynomialGaloisGroupsPartIII` at its line 31, README line 482).

**Exact repair:** decide the owner. Either this folder becomes a Part roadmap with its own folder name and namespace (`TauCetiRoadmap/PolynomialGaloisGroupsPart<N>/`, `namespace TauCetiRoadmap.PolynomialGaloisGroupsPart<N>`, title and summary saying where the base stops) and the other proposal drops its radical layer and imports this roadmap by section, or this folder is withdrawn in favour of the other proposal, as the pull request's own description says. Retest: the Part II citation must resolve uniquely to the base, and the grep above must hit one open proposal. No mathematical statement needs changing. Carried from the previous report's R01, which the header change does not touch.

## R02 (P3) — Record the sources in the required manifest

**Location:** the folder `TauCetiRoadmap/PolynomialGaloisGroups/` contains `README.md`, `Suggested.lean` and `metadata.toml` only; `README.md:310`–321 cites `milne-fields`, `dummit-quintics` and `chapman-quintics` by source id.

**Claim:** three source ids are cited and no `sources.toml` records them (bibliographic data, locators, `cited_for`, provenance and licence class).

**Witness:** the folder listing at this head; the three texts are author-page copies the sources service fetched in earlier rounds under these ids (Milne v5.10, September 2022; Dummit printed pp. 387–401; Chapman's one page dated 22 January 1992).

**Exact repair:** add `TauCetiRoadmap/PolynomialGaloisGroups/sources.toml` under schema `tauceti-roadmap-sources/v1` with one entry per id (`id`, `authors`, `title`, `year`, `locator_scheme`, `locator`, `cited_for`, `url`, `fetched_from`, `fetched_at`, `sha256`, `licence_class = "author-page"`, `status`). Carried from the previous report's R02; nonblocking.

## Previous findings

- R01 — not repaired: `README.md:3` still continues the completed base under its folder identity, `Suggested.lean:21` still opens the base namespace, and the other open proposal for the folder still states the same radical theorems. Carried as R01.
- R02 — not repaired: `README.md:310`–321 still cites three source ids and the folder has no `sources.toml`. Carried as R02.
- R03 — repaired: `Suggested.lean:1`–5 now reads `module` and three `public import` lines; the worker's gate at this head reports `build=0` with every counter zero and `OK`, and a fresh `lake env lean` of the file emits the `#check` output and exactly seven `declaration uses sorry` warnings, no module-system advisory. The repair introduced no new problem (see the header checks below).

No supplied repair report marks any finding “not actionable in this package”; no settled disposition is overridden.

## Verified sound

**Extent.** `git diff --stat 23cb9bf..HEAD` is `Suggested.lean | 10 +++++++---` and nothing else; `git diff --stat origin/main...HEAD` outside the folder is empty (the merge base is `origin/main` itself, `fa41b374`); the worktree is clean; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` (`stray-files=0`).

**The header form, checked as the changed passage.** (1) Precedent on main at `fa41b374`: `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean:6`–13 is the only roadmap file on main with `module`, `public import` lines and a `public section`; this file follows the same form with `public import Mathlib` as its first import. (2) The gate's import rules accept it: `imports=0`, `mathlib-subimports=0`, `no-import-mathlib=0`. (3) Both `TauCeti.*` modules exist at the pin and their object files are built (`TauCeti.GroupTheory.Solvable`, `TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.Basic`). (4) `public section` matters for an acceptance test under the module system, since a non-public theorem is invisible to importers: a scratch file `import TauCetiRoadmap.PolynomialGaloisGroups.Suggested` with `#check @name` for all seven declarations elaborated with exit 0 and printed all seven types, so every headline is exported. (5) Each printed type equals the one recorded in the previous review's signature check, binder for binder: §1.1 carries `[CharZero F] [FiniteDimensional F E] [IsGalois F E]` and `ι`; §2.1 and §2.2 carry `[CharZero F]`, §2.2 `Irreducible q`; §2.3 carries `Irreducible q`, `Nat.Prime q.natDegree`, `5 ≤ q.natDegree` and the root-count equation; §3.1 and the group form carry `Monic`, `Irreducible`, `natDegree = 5`, `(5 : F) ≠ 0`; the radical form carries `[CharZero F]` instead of `5 ≠ 0`. No binder was lost or gained by the `public section`. (6) The `#check @Group.IsSolvable.exists_normal_index_prime` at line 29 still prints `[Finite G] [Group.IsSolvable G] [Nontrivial G] → ∃ N, N.Normal ∧ Nat.Prime N.index`, the contract §1.1 assumes of Tau Ceti.

**Gate, build and dependency check.** Worker's gate at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. My rerun of the gate (scanners and depcheck) printed the same counters and `OK`, exit 0. `lake env lean` on `Suggested.lean`: exit 0, seven `sorry` warnings (lines 36, 50, 59, 68, 80, 89, 98), nothing else. The dependency command returned:

```text
depcheck: 204 roadmaps, 1392 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `PolynomialGaloisGroups` is not itself in the merge order (the completed base lives under `Completed/`; `PolynomialGaloisGroupsPartII` is listed). The six `*Needs:*` paragraphs are unchanged since the previous review (§1.1 Mathlib and Tau Ceti; §2.1 Layer 1 and Mathlib; §2.2 §2.1 and Mathlib; §2.3 Mathlib; §3.1 Tau Ceti and Mathlib; §3.2 §3.1, Tau Ceti and Layer 2); no later roadmap is cited; no gap is declared and none is needed. The worker's citation resolver found no cross-roadmap citation and no Lean name missing.

**Pins and library citations.** Both manifests pin Mathlib `f6090c70` and Tau Ceti `358314d4`, the revisions the previous review re-resolved every cited declaration at (its table of 13 rows, from `Mathlib/FieldTheory/AbelRuffini.lean:194` to `TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Collision.lean:197`); the README did not change, so those resolutions stand.

**Headline coverage and padding.** The seven headlines of the README (§§1.1, 2.1, 2.2, 2.3, 3.1, 3.2 group form, 3.2 radical form) are stated at `Suggested.lean:36`, `:50`, `:59`, `:68`, `:80`, `:89`, `:98`, byte-identical to the previous head apart from line numbers (shifted by four by the header). No definition, stand-in or omitted headline. The one-tactic probe of the previous review (`rfl`, `simp`, `infer_instance`, `exact?` on a scratch copy at this pin: none closes) carries, since no statement changed.

**Sources.** The six sampled targets are unchanged in text and locator since the previous review, which read them at `milne-fields line 3409`–3420 (Theorem 5.34, printed p. 77), `line 2217`–2225 (Proposition 4.16, p. 52), `chapman-quintics line 8`–30 and `dummit-quintics line 31`–32, `46`–52, `84`–105 (Theorem 1, p. 389); that record stands for this head. No locator is flagged unverified in the README.

**Ownership.** `roadmaps list` shows two open pull requests for the folder `PolynomialGaloisGroups` by the same author and one for `PolynomialGaloisGroupsPartII`; the grep above is R01's witness. The sibling checkouts in the brief carry no radical criterion; ownership against open pull requests was checked through the `roadmaps` tools only.

**Adversarial table.** No mathematical statement changed, so the rows of the previous report (its 9 fresh rows, 37 carried rows and 13 review-9 rows, covering the six sampled targets, all seven headlines, the native definitions and the proof steps) are carried with their values. The rows for the sampled targets and headlines are repeated here with their computed values, each cited to the previous report; one row records this round's check of the changed header.

| Statement | Instances tried | Values computed on each side | Result and change |
|---|---|---|---|
| Header change (`module`, `public import`, `public section`) | importer scratch file; fresh `lake env lean` | names visible to an importer: 7 of 7; `sorry` warnings: 7; other warnings: 0; gate `build`: 0 (was 1). Binder lists of the 7 types identical to the previous record. | New this round. No change. |
| §1.1 trivial extension `E = F` | group order 1, derived order 1 | every image a base element: `true ↔ true` | Carried, previous report carried row 6. |
| §1.1 nonabelian solvable, splitting field of `X³ − 2` | derived series `6 → 3 → 1`; `α³ = 2`, `ζ₃³ = 1` | `true ↔ true` | Carried, row 7. |
| §1.1 nonsolvable, splitting field of `X⁵ − 4X + 2` | values at `−2,−1,0,1,2`: `−22, 5, 2, −1, 26`; three real roots; derived orders `120 → 60 → 60` | radical containment false: `false ↔ false` | Carried, row 9. |
| §1.1 normality needed, `E = ℚ(α)`, α real root of that quintic | `[E:ℚ] = 5`, automorphism group order 1 | dropping `IsGalois` gives `true ↔ false` | Carried, row 10; `[IsGalois F E]` is in the printed type. |
| §1.1 ambient closure, `E = ℚ(ζ₇ + ζ₇⁻¹)` | `u³ + u² − 2u − 1 = 0`, group `C₃` | closure inside `E` is `ℚ`, closure in the algebraic closure contains `u` | Carried, row 4; matches the docstring at line 35. |
| §2.1 all roots, `q = 0, 1, X − 1, X² − 2, (X² − 2)²` | root-set sizes `0, 0, 1, 2, 2`; groups `1, 1, 1, C₂, C₂` | `true ↔ true` in each case | Carried, rows 1, 2, 16, 17. |
| §2.1 versus §2.2, `q = (X⁵ − 4X + 2)(X − 1)` | six roots, one radical; group onto `S₅` | all-roots `false ↔ false`; unrestricted some-root `false ↔ true` | Carried, row 18; `Irreducible q` is in the printed type of line 59. |
| §2.2 some root, `X − 1`, `X² − 2`, `X⁵ − 4X + 2` | `(solvable, radical root) = (true,true), (true,true), (false,false)` | both directions hold | Carried, row 19 and review-9 rows 1–3. |
| §2.3 intended case `X⁵ − 4X + 2` | complex roots 5, real roots 3, `5 = 3 + 2`, degree 5 prime, `5 ≤ 5` | no root radical | Carried, row 20 and review-9 row 5. |
| §2.3 lower bound needed, `X² + 1`, `X³ − 2` | nonreal roots 2, 2; `5 ≤ 2`, `5 ≤ 3` false; groups `C₂`, `S₃` | all roots radical, so the bound cannot be dropped | Carried, row 21. |
| §2.3 irreducibility needed, `(X² + 1)(X − 1)(X − 2)(X − 3)` | degree 5, roots `i, −i, 1, 2, 3`, `5 = 3 + 2`, group `C₂` | every root radical | Carried, review-9 row 7. |
| §3.1 separation, `X⁵ − 2` and `X⁵ − 5X − 12` over `ℚ` | sextics `X⁶ − 50000X` and `1, −40, 1000, −20000, 250000, −66400000, 976000000`; `gcd(R, R′)` degree 0 both | separable | Carried, previous report fresh rows 1–2. |
| §3.1 reducible control `X⁵ − X` | `disc = −256 ≠ 0`; sextic `(X − 2)⁴ (X² + 16)`; gcd with derivative degree 3 | inseparable: irreducibility needed | Carried, row 30. |
| §3.1 characteristic-5 control, `𝔽₅[t]/(t⁵ − t − 1)` | invariant values `3, 2, 2, 2, 2, 2`; sextic `(X − 3)(X − 2)⁵` | inseparable while `(5 : F) ≠ 0` fails | Carried, row 29 and fresh row 6. |
| §3.1 characteristics 2 and 3, `𝔽₂[t]/(t⁵ + t² + 1)`, `𝔽₃[t]/(t⁵ + 2t⁴ + 1)` | six distinct invariant codes `1,14,10,30,8,19` and `1,215,211,240,128,201` | separable | Carried, rows 27–28. |
| §3.2 group form, small characteristic | the two quintics above, groups `C₅` | sextic root `1` in each field: `true ↔ true` | Carried, row 35. |
| §3.2 radical form, `X⁵ − 2`, `X⁵ − 5X − 12`, `X⁵ − X − 1` | roots `R(0) = 0`, `R(40) = 0`; `X⁵ − X − 1`: `R(±1), R(±9631)` nonzero, `9631` prime, group `S₅` | `true ↔ true`, `true ↔ true`, `false ↔ false` | Carried, rows 31–34 and fresh rows 1–3. |
| §3.2 supplier hypotheses | `Solvable.lean:104` needs `f.Separable` and sextic separable | `f.Separable` from irreducibility and `5 ≠ 0`; sextic separability from §3.1 | Carried, fresh row 8. |

**Finding witnesses as adversarial checks.** R01: the namespace strings of `Suggested.lean:21` and `Completed/PolynomialGaloisGroups/Suggested.lean:60` are equal; the grep hits two open proposals. R02: three cited ids, zero manifest entries.

## Not verifiable

- No source was re-read this round: no locator changed, and the previous report's locator table stands. No reference request is pending and `needs-references.toml` was not created.
- Ownership against open pull requests was checked only through the `roadmaps list`, `grep` and `show` tools and the sibling checkouts named in the brief.
- The seven theorems remain admitted. Elaboration verifies their signatures and their export; the finite examples and the cited proof routes do not constitute proofs.

## Source issues

No locator was re-read this round; the four entries of the previous report (a gap in dummit-quintics at Theorem 1, printed p. 389; misprints in dummit-quintics at printed p. 399 and in milne-fields at printed pp. 74 and 77) stand and are not repeated.

- none
