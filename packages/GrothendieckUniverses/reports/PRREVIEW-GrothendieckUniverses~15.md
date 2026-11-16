# Review of GrothendieckUniverses (pull request #1783 at 6888244)

**Verdict:** needs changes

## R01 (P3) — Stacks Tag 05N2 described as a cofinality bound

**Location:** `TauCetiRoadmap/GrothendieckUniverses/README.md` lines 346–347: "ordinals of large cofinality above a given cardinal (Tags 05N2 and 05N3, `Cardinal/Cofinality.lean`)"; the description's Provenance paragraph: "ordinals and strong limits of large cofinality (05N2, 05N3)".

**Claim:** Only 05N3 gives an ordinal whose cofinality exceeds a given cardinal. 05N2 is the factorisation of a map into an ordinal-indexed colimit through one stage, so the locator is wrong for half its content.

**Witness:** Stacks Tag 05N2 is Lemma 3.7.1: a map `S → colim_{α<β} T_α` with `|S| < cf(β)` factors through some `T_α`. Tag 05N3 is Proposition 3.7.2. AxiomMath `Cofinality.lean` line 77 tags `Ordinal.exists_factorization_of_mk_lt_cof` with 05N2.

**Repair:** In README lines 346–347, write: "ordinals whose cofinality exceeds a given cardinal (Tag 05N3) and the factorisation through one stage of a map from a set of cardinality `< cf(β)` into a colimit indexed by the ordinals below `β` (Tag 05N2), both in `Cardinal/Cofinality.lean`,". In the description write: "its reflection principle (Tag 000G), ordinals of large cofinality (05N3), maps into ordinal-indexed colimits (05N2) and strong limits of large cofinality sit next to 1.3 and 2.3".

## Previous findings

- none: the review of 8c6b38b raised no finding. Its only bullet, R01 of the review before it, was repaired, and README lines 324–326 are the same at this head.

## Verified sound

The diff changes no statement. Rows 1–2 are for the statements the new text cites ("They border on 1.3 and 2.3"). Rows 3–5 are for the claims of the new section, checked against the two repositories at the cited commits.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 `IsGrothendieckUniverse.isInaccessible_card` | `V_ ω`; `V_ κ.ord`, `κ` inaccessible; `ℶ_{ω₁}`, AxiomMath's kind of strong limit of large cofinality | `V_ ω`: card `ℵ₀`, not inaccessible, `ω ∉ V_ ω`. `V_ κ.ord`: card `κ`, `ω ∈`. `ℶ_{ω₁}`: `cf = ℵ₁ < ℶ_{ω₁}`, singular, so UA4 fails | true; AxiomMath's result yields no universe | none |
| 2.3 `forall_exists_isGrothendieckUniverse_iff` | level `u` with no inaccessible; 05N3 witness for `κ = 0` | No inaccessible: the left fails at `x = ω` (only `V_ ω`), the right at `c = 0`. `ℵ₁.ord`: regular, `2^ℵ₀ ≥ ℵ₁`, not a strong limit | true; 05N3 does not give the right side | none |
| Provenance ¶1: licence, version, sorry, review | AxiomMath at c496df0 | Apache-2.0 (GitHub; README line 59). Toolchain and Mathlib `v4.35.0` < pin `v4.36.0-rc2`. No `sorry` (line 7; 0 in 8 files). AI-written tier (lines 11, 13–14) | supported | none |
| Provenance ¶2: files and tags | `StacksFrontier/SetTheory`, 6 files | `Reflection.lean`: 000G (lines 327, 344). `Cofinality.lean`: 05N3 at line 60, 05N2 at line 77. `SizeBound.lean`: 046U. "Partial universe": Stacks 000B | 05N2 misdescribed | R01 |
| Provenance ¶3: LeanPool | lean-pool at f8b9b72 | Toolchain and Mathlib `v4.35.0`. `SetTheory` (11 files): ZF models, elementary embeddings, Kunen. `PCFTheory/ClubGuessing.lean`. Neither has "inaccessible" or "Grothendieck" | supported | none |

The rows of the other statements stand as in the previous review, of `8c6b38b`.

- **Change since 8c6b38b.** 29 added lines of `README.md`: the section « Provenance » and 2 references. No layer, target, supplier or Lean declaration changed. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** My run with `--base origin/main` passes every check (exit 0), and the worker's run with the build gives `build=0`. Depcheck: `depcheck: 235 roadmaps, 2233 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 8 `declaration uses sorry` warnings (lines 67, 72, 78, 85, 91, 99, 104, 112) and nothing else.
- **External code opened at the cited commits (19 files).** AxiomMath: 6 `StacksFrontier/SetTheory` files, 2 `StacksCore/SetTheory` files, `StacksFrontier/EgaSgaIndex/SGA4/ExposeI.lean`, README, `lean-toolchain`, `lakefile.toml`, `lake-manifest.json`. LeanPool: 6 `SetTheory`/`PCFTheory` files, the Hanf `VonNeumannModel.lean`, `lean-toolchain`, `lake-manifest.json`.
- **Stacks tags resolved (5).** 000B (§3.5, defines "partial universe"), 000G (Theorem 3.8.1), 05N2 (Lemma 3.7.1), 05N3 (Proposition 3.7.2) and 046U (equation 3.9.1.1).
- **Beyond `SetTheory`.** `StacksFrontier/EgaSgaIndex/SGA4/ExposeI.lean` lines 1006–1021 register SGA 4 I App. Definitions 1–2, Lemma 3 and Proposition 12 on Mathlib's `ZFSet.IsTransitive`, `Cardinal.IsInaccessible` ("special case") and `ZFSet.regularity`. It defines no universe, so "Layers 0–2 have no counterpart" also holds outside `SetTheory`.
- **Pull request text.** The description's new Provenance paragraph matches the head except for 05N2 (R01). Its file list (3 files in the folder, none outside) and its 9 declarations are still correct.
- **Remark (untouched text, as at 8c6b38b).** gabriel1962 puts §1 in Chapitre I. README lines 62, 109, 128, 263 and 360 and `Suggested.lean` lines 48 and 103 say "Ch. 0"/"Chapitre 0".

Overlap check: read HanfNumbers; nothing shared. It uses Mathlib's `ZFSet.vonNeumann` API and no universes. `roadmaps grep` for `IsGrothendieckUniverse` and "Grothendieck universe" on main and the open heads finds only convention sentences (HabiroCohomologyFoundationsPartII line 41, AnalyticToricGeometryPartII line 33), so there is no other owner. The overlap file lists no dropped id, no second copy and no other pull request changing this folder.

Source independence: changed passages only. 4 passages (the 3 Provenance paragraphs and the 2 references) were compared with 3 sources: the AxiomMath README and file docstrings, the LeanPool docstrings, and Stacks Tags 000B, 000G, 05N2, 05N3 and 046U. The longest shared run is "strong limit cardinals of large cofinality", the name of the notion and the title of the AxiomMath file. No sentence is followed clause by clause. The largest share is williams1969, as counted in the earlier full reviews. Contents were not compared again because no layer changed.

## Not verifiable

- The description's statement that the AxiomMath maintainers have not been contacted is the author's own and has no public record to check.
- The repository-wide searches for `IsInaccessible` and "Grothendieck universe" (GitHub code search) ran on the default branches, not on the cited commits. Directory listings and files were read at the commits.

## Source issues

- none

## For the human reviewers

- none
