# Review of PadicFunctionalAnalysis (pull request #1807 at 2faed4d)

**Verdict:** needs changes

## R01 (P3) — The description does not state how much of this roadmap the pull request rewrites

**Location:** the pull request description. On this roadmap's content it says only: "Small facts owned locally where a roadmap consumed a standard fact from a downstream roadmap (PadicFunctionalAnalysis: the specialised Amice comparison on ℤ_p)."

**Claim:** The pull request revises the PadicFunctionalAnalysis roadmap on main far beyond one locally owned fact. The README is rewritten in the house shape, three sections are removed, `Suggested.lean` loses 46 declarations, and PadicMeasuresIwasawaAlgebras stops being a supplier. The description states none of these changes.

**Witness:** Against main:
- `README.md`: 2434 lines changed. `Existing foundations`, `Dependency order and completion` and `Existing Lean work` are removed.
- `Suggested.lean`: 46 declarations removed (`IsTate`, `tateGauge`, `IsONable`, `HasPr`, `WeightSpace`, …), 11 added.
- Main's line 32 consumes PadicMeasuresIwasawaAlgebras. At the head it appears only as a consumer (line 1691).

**Repair:** Add this paragraph between the **LocalPurity** and **RigidAnalyticGeometry** paragraphs:

"**PadicFunctionalAnalysis** is rewritten in the house shape and keeps its section numbers 0.1–5.6. `Existing foundations`, `Dependency order and completion` and `Existing Lean work` give way to exact supplier contracts, a build overview, per-layer Examples and Dependencies, and a Downstream consumers section. Results now in the pinned libraries are cited by name. It no longer consumes PadicMeasuresIwasawaAlgebras: §5.3 owns the comparison of the Amice transform with the completed group algebra on ℤ_p, and a table maps the clauses PadicMeasuresIwasawaAlgebras cites to their new places. Its Suggested.lean drops its 46 API declarations (Tate gauges, orthonormal-basis predicates and (Pr), Mahler and Amice coordinates, `WeightSpace`, `measurePairing_norm_le`, …). It now states Amice's theorem, the analytic level of additive characters and of weights, the Amice bijection for distributions, the adic universal character, the Amice-coordinate comparison, separation by weights, the scalar factors κ(cz + d) and joint injectivity of the annular evaluations. It names the Banach–Tate structure of §5.6 as not statable."

Each clause is checked against the head:
- README headings at lines 146, 198, 370 and 1667.
- The clause table at lines 1704–1718.
- The `Suggested.lean` docstring at lines 22–30 and 52–56.

## Previous findings

- none: the review of `8d98b44` had no findings (verdict accepted). `git diff 8d98b44 HEAD -- TauCetiRoadmap/PadicFunctionalAnalysis` is empty.

## Verified sound

| Statement | Instance | Left side | Right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `amiceTransform_completedGroupAlgebra_compat` (§5.3, the comparison the description names) | `μ=δ_0, δ_1, δ_2` | transforms `1`, `1+X`, `1+2X+X²`; with `X↦[γ]−1`: `[1]`, `[γ]`, `[γ]²` | `map ofAdd δ_a`: `[ofAdd 0]`, `[ofAdd 1]`, `[ofAdd 2]` | equal | none |
| same | `μ=δ_0−δ_1` | `1−(1+X)=−X ↦ 1−[γ]` | `[ofAdd 0]−[ofAdd 1]` | equal | none |
| same, convention control | coordinate `X↦[γ⁻¹]−1`, `μ=δ_1` | `1+X ↦ [ofAdd(−1)]` | `[ofAdd 1]` | differs; the statement fixes `γ=ofAdd 1` | none |
| §2.4 splitting (cited by the changed AdicSpacesPartIII R3.6 text) | `E=ℚ_p²`, `i(m)=(m,0)`, `q(x,y)=y` | `d=id`: `d(i m)=(m,0)` | `(d(x,y)).2=y=q(x,y)` | holds | none |
| same, degenerate | `M=0` | `range i=0=ker q`, so `q` is bijective | `d=(0,q)`, `q⁻¹` continuous by open mapping | holds | none |
| §2.4 completed-extension target | `K′=ℚ_p(√p)`, `E=ℚ_p²` | `K′⊗̂E=K′²` | `0→K′→K′²→K′→0`, split by `(x,y)↦y` | strict exact | none |

The rows for untouched statements stand as in the previous review, of `8d98b44`.

- **Gate.** The worker's gate at `2faed4d` has every counter at 0, `build=0`.
  - My run of `gate … --base origin/main` (main at `dc53e7e`) has every counter at 0 except `outside-folder=24`. Those 24 files are `README.md` and `Suggested.lean` of the 12 sibling folders the brief names as this pull request's own.
  - `git diff --stat origin/main...HEAD` outside those 13 folders is empty, so `outside-folder` is not a finding.
- **Dependency check:** `depcheck: 237 roadmaps, 2141 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0. The only warnings are eleven `declaration uses sorry`, at lines 74, 84, 98, 142, 166, 175, 189, 202, 218, 237 and 263.
  - I ran `#check @` on all 13 declarations in one scratch copy. Each elaborated type matches `signatures.md`, and no binder is lost.
  - The pins (`lake-manifest.json`) are unchanged since `8d98b44`, so the earlier padding probe stands.
- **Sibling text changed since `8d98b44`.**
  - AdicSpacesPartIII still cites this roadmap's §0.4 and §§1.2, 2.1–2.4 (README lines 109, 128, 573, 661, 669, 11018, 11025). All of these exist here.
  - Line 1673 here ("AdicSpacesPartIII §R3.6 consumes the splitting of §2.4") still matches AdicSpacesPartIII line 669.
  - RigidAnalyticGeometry's one changed line does not concern this roadmap. Its row 140 and its contract at line 342 still resolve to Layer 1 (§1.4) and §2.4.
- **Suppliers.** No commit from `c69ba93` to `origin/main` touches RestrictedPowerSeries, NewtonPolygons, AdicSpaces, ProfiniteProPGroups or LocalFieldsRamification. I re-resolved each on main:
  - RestrictedPowerSeries headings at lines 224, 247, 277, 306, 324, 340 and 704;
  - NewtonPolygons line 442;
  - AdicSpaces line 135;
  - ProfiniteProPGroups Layer 9 at line 79.
- **Sources and pinned declarations.**
  - [Conrad] Lemma 1.1.5 is at Conrad line 274 (p. 6). The section step is at lines 298–302, on p. 7 (page marker at line 296).
  - [RJW] diagram (3.4) is at RJW line 954 and Theorem 3.25 at line 959, both on p. 18. Proposition 3.16 is at line 816.
  - Pinned: `TauCeti.exists_continuousLinearEquiv_prod_of_countableType` (`Analysis/Normed/Module/Bases/Splitting.lean:87`) and `AbstractMeasure.completedGroupAlgebraEquiv` (`NumberTheory/Padics/Measure/CompletedGroupAlgebra.lean:449`, forward map `toCompletedGroupAlgebra`).
- **Pull request text.**
  - The loop sentence holds: PadicMeasuresIwasawaAlgebras appears here only as a consumer (lines 44, 1691), and the dependency check is clean.
  - "The specialised Amice comparison on ℤ_p" is §5.3 `amiceTransform_completedGroupAlgebra_compat`.
  - Overlaps: #1808 and #1854 are ordered in the merge-order block, and no id is dropped or defined only in a revision. Ownership stands as in the previous review, since the folder is unchanged.
- **Remark on untouched text** (asks for no change): Downstream consumers (line 1673) lists AdicSpacesPartIII only for §2.4. AdicSpacesPartIII line 128 also cites §0.4 and §§1.2, 2.1–2.2. Both texts are unchanged since `8d98b44`.

## Not verifiable

- [Sch], [BGR] and [Bel] are settled as uncertified and cited by locator. [BGR] 2.7.1/4 is reached only through Conrad line 300 and was not read.

## Source issues

- none
