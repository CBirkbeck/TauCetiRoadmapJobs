# Review of HomotopyTheoryOfCategories (pull request #1521 at 2562b5f)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `8f3b224`: the folder is byte-identical at this head, which merges main. Since the last review, the HigherToposTheory pull request was closed without merging and StableHomotopyKTheory merged into main. Each change makes untouched text wrong.

## R01 (P1) — HigherToposTheory, cited as a supplier, exists nowhere

**Location** `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md` line 58: "| The characterization of Reedy structures by unique factorization, … | HigherToposTheory, F1.8 | 7.2 |"; also lines 78, 200–204, 228, 513, 925, 936 and 1003. The description has the same citation: "HigherToposTheory F1.8 (the characterization of Reedy structures), for 7.2".

**Claim** HigherToposTheory is not on main and not at any open head. The supplier row, the **From HigherToposTheory** contract, 7.2's *Needs:* and the two L5.4 comparisons therefore cite nothing, and the README leaves the Reedy characterization without an owner.

**Witness** `roadmaps show HigherToposTheory` prints "No roadmap HigherToposTheory on main or in an open roadmap pull request". Its pull request #1901 was closed unmerged on 2026-11-13. The citation resolver lists README line 58 as found nowhere.

**Repair** 7.2 does not need F1.8. With `W₁ = identities`, the only factorization of `f` is `𝟙 ≫ f`. Non-identity maps raise `rank`, and a well-ordered degree rules out infinite descending chains. Delete the dependency as follows.
- Line 58: delete the row.
- Lines 77–79: "StableHomotopyKTheory §2.31 states it for realised nerves, with homotopy equivalences; it is compared with 2.4 and is not an input to it."
- Lines 200–204: delete the **From HigherToposTheory** paragraph.
- Line 228: end the sentence at "… use Mathlib's `ReedyStructure` and none of Layers 1–6."
- Lines 512–513: "For `W∞` it is the form of Theorem A in StableHomotopyKTheory §2.31, with comma categories `d\F`."
- Lines 924–927: from "the equivalence is the case" to "is `IsDirect`.", write instead: "the equivalence holds as well: the factorization of `f` is the identity followed by `f`, unique; a direct category has no non-identity endomorphism (7.1); and a degree raised by every non-identity morphism turns an infinite descending `DirectRel` chain into one in `α`, so it gives `IsDirect`."
- Line 936: "*Needs:* 7.1; Mathlib `HomotopicalAlgebra.ReedyStructure`, `WellFounded.rank`."
- Line 1003: "Mathlib. Within the layer, 7.2–7.5 use 7.1, and 7.3 and 7.4 use 7.2."
- Description: delete the HigherToposTheory bullet under "It consumes".

## R02 (P3) — "No roadmap on main cites this one" is false now that StableHomotopyKTheory is on main

**Location** `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md` line 1581: "No roadmap on main cites this one. StableHomotopyKTheory records this roadmap as the owner of Theorem A for an arbitrary basic localizer (2.3–2.4) …"

**Claim** StableHomotopyKTheory is now on main and cites this roadmap. The first sentence is therefore false, and it contradicts the sentence after it.

**Witness** On main, `TauCetiRoadmap/StableHomotopyKTheory/README.md` names HomotopyTheoryOfCategories at lines 21, 2834 and 2844. Line 2844 is its consumer row "HomotopyTheoryOfCategories Layer 4".

**Repair** Delete the sentence "No roadmap on main cites this one." The paragraph then opens with "StableHomotopyKTheory records this roadmap as the owner of …".

## Previous findings

- none: the review of `8f3b224` raised no finding. It accepted the folder after its predecessor's R01, about the description, was repaired.

## Verified sound

| Statement | Instance | Computed on each side | Result |
| --- | --- | --- | --- |
| 7.2 `isDirect_iff_nonempty_reedyStructure`, without F1.8 | `[1]`; `ω + 1` | `[1]`: rank 0, 1, and `𝟙 ≫ f` is the only factorization. `ω + 1`: `rank ω = sup(n + 1) = ω`. Both direct, both Reedy. | equivalence holds on 7.2's own route |
| same, negative side | `ℤ`; `SingleObj (ℤ/2)` | `ℤ`: `deg(−n−1) < deg(−n)` for all `n` is impossible in a well-order, and `ℤ` is not direct. `ℤ/2`: `g ≠ 𝟙` needs `deg ★ < deg ★`. | both sides false; agree |
| 7.2 against ModelCategories 7.4.1 (#2269 head) | monoid `ℕ`, `W₁ = 𝟙`, `W₂ = ⊤` | 7.4.1 excludes it by the endomorphism clause. Here 7.1's Check "`SingleObj G` not direct" excludes it, via the non-identity `1 : ★ ⟶ ★`. | consistent |
| 2.4 and Scope comparisons with "HigherToposTheory L5.4" | resolver; `roadmaps show` | Lines 78 and 513 cite L5.4. The target roadmap is on main: no. At an open head: no. | unresolvable (R01) |
| Downstream consumers: "No roadmap on main cites this one" | main, grep of `HomotopyTheoryOfCategories` | StableHomotopyKTheory README lines 21, 2834, 2844 versus the claim of 0 citing roadmaps. | false (R02) |
| StableHomotopyKTheory contract, now on main | §§1.10–1.12, 1.21, 2.26, 2.29, 2.30, 2.31, 2.34 | Lines 251, 259, 267, 339, 855, 893, 907, 915, 939. Its line 21 says this roadmap is a consumer, not a supplier. | all resolve; one-directional |
| SchemeAndStackFoundations contract on main | §§1.18, 1.24, 3.4, 3.7 | Lines 3538, 3891, 5967, 6146. `Stack.stackification J F` for any small site and category-valued pseudofunctor, at line 3553. | all resolve |
| 12.3 contract against §1.24 | `CrossedModule Ht H`, main line 3915 | Supplier: `∂(h·x) = h ∂(x) h⁻¹` and `∂(x)·y = x y x⁻¹`; `.quotientCategory`, `.isGroupoid`, `.isoClasses`, `.aut`. README 12.3: the same law and the same four projections. | agree |
| 12.5 Check `ε(𝒪, 1) = −1` for `gradedPicardGroupoid (Spec ℚ)` | supplier §3.4, main line 6037 | Supplier: swap times `(−1)^{f·g}`, so `f = g = 1` gives `−1`. README: `−1 ≠ 1` in `ℚ^×`. | agree |
| GeneralizedCohomology G2 item 1 and GrothendieckInfinityGroupoids 0.1 | main lines 213–226; #1060 head line 170 | G2.1: the Kan–Quillen structure, with weak equivalences via realization, `π₀` and all `πₙ`. 0.1: `Globe` with `Category`; its line 596 names this roadmap's 8.6. | resolve |
| Description: "in fourteen layers" | README headings | `## Layer 0` … `## Layer 13`: 14. | true |
| Description: "`### k.n` targets, each with a *Needs:* line and at least three discriminating Checks" | mechanical count | 64 of 64 `### k.n` sections have at least 1 *Needs:* and at least 3 Check bullets. | true |
| Description: "changes nothing outside it"; build "with only `sorry` warnings" | three-dot diff; `lake env lean` | Outside the folder: empty. Inside: 3 files, +2590. 52 `sorry` warnings, 0 other messages, exit 0. | true |
| Description: "Cisinski's Corollary 2.3.3 and Theorem 2.3.6"; Tau Ceti `HomotopyGroup.loopSpaceMulEquiv` | `Suggested.lean` lines 449, 456; Tau Ceti pin | The docstrings cite Cor. 2.3.3 and Thm. 2.3.6. `def loopSpaceMulEquiv` is at `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean` line 243. | true |
| Description: the supplier list | README lines 56–63; the world | The same five roadmaps and sections as the table. Four resolve; HigherToposTheory resolves nowhere. | false for one bullet (R01) |
| 10.1 locators | `groth2013` | Def. 1.1 at line 188; Ex. 1.2 at line 216 (represented prederivator); Ex. 1.11 at line 578 (derivator criterion); Def. 1.15 at line 725; Thm. 1.31 at line 1344. | present; Ex. 1.11 remark stands |

The rows of the previous reviews for statements that did not change stand as in the review of `8f3b224`.

- **Gate.** The worker's gate at `2562b5f` is all 0 with `build=0`, result OK. My re-run (`--base origin/main`) is 0 on every text scanner. Its only non-zero check is `depcheck: NOT IN ORDER: HomotopyTheoryOfCategories` against the public merge order, which is not a finding.
- **Dependency check** against the candidate order: `depcheck: 245 roadmaps, 2211 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. It does not catch R01, because an edge to a roadmap that exists nowhere is not reported.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, 52 "declaration uses `sorry`" warnings and nothing else. The pins are unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d`.
- **Cross-roadmap citations resolved this round:** 17 sections in 5 roadmaps. Fifteen resolve; HigherToposTheory F1.8 and L5.4 do not.
- **Citation-resolver leads:** of the 32 Lean-name leads, 31 are declared in `Suggested.lean`. The 32nd, `Stack.stackification`, is the supplier's, at main line 3553.
- **Pinned declarations opened:** 3. They are Tau Ceti `loopSpaceMulEquiv` (line 243) and `zerothHomotopyLoopSpaceEquivFundamentalGroup` (line 200), and Mathlib `SimplexCategory.reedyStructure` (`Reedy/SimplexCategory.lean` line 42).
- **Description against the head:** 14 claims checked, besides the generated depends-on block: the outside-folder claim, the layer count and summaries, ownership, suppliers, Tau Ceti, the README shape, the Needs and Checks, module form, the headline list, the not-statable docstring, the sources, the build and the gate. One is false: the HigherToposTheory bullet (R01).
- **Consumers of this roadmap's ids:** PosetHomotopyAndSubgroupComplexes (#2296 head) cites 2.1, 2.4, `IsBasicLocalizer`, `IsAsphericalFunctor` and `mem_of_isAsphericalFunctor`. All exist here.

Remarks on untouched text (no change requested):
- Line 1583: GrothendieckNotesLemmas is still neither on main nor at an open head, so the sentence about it cannot be resolved.
- Line 1218: the represented prederivator is Groth's Example 1.2 (`groth2013` line 216). Example 1.11 (line 578) is the criterion for it to be a derivator.
- Line 928: "A direct factorization of `f` is unique" repeats a clause two lines above it.
- Downstream consumers does not name PosetHomotopyAndSubgroupComplexes, an open consumer of 2.1 and 2.4.

Overlap check: read GrothendieckInfinityGroupoids (#1060), ModelCategories, KanQuillen, EnrichedLocalization and SimplicialCategories (#2269), and StableHomotopyKTheory and BordismFormalGroups (main). Shared objects and their owners:
- `Globe`: GrothendieckInfinityGroupoids 0.1, consumed in 8.6.
- Theorem A for realised nerves: StableHomotopyKTheory §2.31, compared with 2.4.
- The general Reedy characterization: ModelCategories 7.4.1, which does not cite this roadmap. Here 7.2 states only its direct case, on this roadmap's `IsDirect`.

No object is owned twice.

Source independence: changed passages only. No folder passage changed, so 0 passages were compared with 0 sources. No layer was added, removed or reordered, so the arrangement stands as compared in the full review.

## Not verifiable

- Brown–Heath–Kamps 1983, Brown–Spencer 1976 and Joyal–Street 1993: `uncertified` in the manifest and cited by locator alone. No changed text cites them.
- Hirschhorn 2003 (8.3): verified only through secondary sources, as in the earlier reports. No changed text cites it.
- GrothendieckNotesLemmas (Downstream consumers, line 1583): no readable copy on main or at an open head.

## Source issues

- none

## For the human reviewers

- Licence: `bhk1983`, `brownspencer1976` and `joyalstreet1993` are recorded as `uncertified` in the manifest (paywalled). The README cites them by locator only, and no text was compared with them.
