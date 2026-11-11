# Review of GrothendieckTeichmuller (pull request #1058 at ab052a8)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 4a4fb37. The folder is byte-identical to the head the previous review accepted, but this head merges main, and main's BelyiMaps no longer names the successor roadmap this README hands its out-of-scope Galois statements to (R01). The pull-request description still describes the first head of this pull request (R02–R04).

## R01 (P3) — Out-of-scope Galois statements handed to a BelyiMaps successor that main no longer names

**Location:** `TauCetiRoadmap/GrothendieckTeichmuller/README.md:53–54`, ":85–86", ":661": "left to the successor of [BelyiMaps](../BelyiMaps/README.md) Layer 12 (`BelyiArithmeticActions`)"; "it is in BelyiMaps' successor"; "The successor of [BelyiMaps](../BelyiMaps/README.md) Layer 12, `BelyiArithmeticActions`, consumes".

**Claim:** The merge of main made these three passages wrong. BelyiMaps now owns Layer 12 itself and names no successor, so `Gal(ℚ̄/ℚ) → GT̂`, `Out♯ₙ ≅ GT̂` and `Out(Πₙ) ≅ GT̂ × 𝔖ₙ₊₃` are handed to a roadmap that does not exist. BelyiMaps also excludes Grothendieck–Teichmüller theory, so it cannot be the owner either.

**Witness:** `TauCetiRoadmap/BelyiMaps/README.md` at this head (identical to main): 0 occurrences of `BelyiArithmeticActions` (13 at 4a4fb37). Line 56 says it "owns every milestone" of Layers 0–14, and line 5616 excludes Grothendieck–Teichmüller theory.

**Repair:** Make these three edits.
- At :53–56, replace "the successor of [BelyiMaps](../BelyiMaps/README.md) Layer 12 (`BelyiArithmeticActions`) and to InverseGaloisAndArithmeticFundamentalGroups §IG.1.2 (tangential base points) and §IG.5.1 (configuration spaces)" with "GrothendieckTeichmuller, Part II, which consumes this roadmap, the outer action of `Gal(ℚ̄/ℚ)` on the profinite fundamental group of `ℙ¹ ∖ {0, 1, ∞}` of [BelyiMaps](../BelyiMaps/README.md) §12.8 (BelyiMaps excludes Grothendieck–Teichmüller theory and tangential base points), and InverseGaloisAndArithmeticFundamentalGroups §IG.1.2 (tangential base points) and §IG.5.1 (configuration spaces)".
- At :85–86, replace "it is in BelyiMaps' successor or in InverseGaloisAndArithmeticFundamentalGroups" with "it is in this roadmap's Part II, in BelyiMaps or in InverseGaloisAndArithmeticFundamentalGroups".
- At :661, replace "The successor of [BelyiMaps](../BelyiMaps/README.md) Layer 12, `BelyiArithmeticActions`, consumes" with "GrothendieckTeichmuller, Part II, consumes". At :663–664, replace "with the tangential base points of" with "with the outer action of BelyiMaps §12.8 and the tangential base points of". At :665, replace "that successor" with "that Part II".

## R02 (P3) — The description lists a definition `chi` that `Suggested.lean` does not declare

**Location:** Pull-request description, paragraph 4: "definitions (`subst`, `beta`, the `Monoid Param` structure, the Artin generators with their membership proofs, `RelI`–`RelIII`, `gtMonoid`, `GTHat`, `chi`) have real bodies".

**Claim:** This sentence describes the first head. `Suggested.lean` at this head has no `chi`: the character `χ` is a README target in prose only (§4.1). The laws of `Monoid Param` are `sorry`'d theorems.

**Witness:** The 43 declarations of the folder change contain no `chi`, and `chi` occurs 0 times in `Suggested.lean`. `Suggested.lean:39–41` says `Monoid Param`, `gtMonoid` and `GTHat.betaEquiv` rest on `sorry`'d proofs.

**Repair:** Use this text: "definitions (among them `subst`, `commutatorClosure`, `Param` with its product and unit, `beta`, the six Artin generators with their membership proofs, `P4hat`, `toHat`, `RelI`–`RelIII`, `IsGT`, `gtMonoid`, `GTHat`, `IsGT0`, `GTHat.betaEquiv`) have real bodies. The monoid laws of `Param`, `isGT_one` and `IsGT.mul`, on which `Monoid Param` and `gtMonoid` rest, are `sorry`'d theorems. The character `χ` is a README target only."

## R03 (P3) — The description cites a "do not implement" section and a BelyiMaps successor, neither of which exists

**Location:** Pull-request description, paragraph 2: "need BelyiMaps' arithmetic successor, tangential base points (#850) and `π₁(M_{0,5})`; they are recorded as a roadmap for a roadmap, with an explicit « do not implement »."

**Claim:** The README at this head has no such section: these statements are a scope exclusion (README:47–56). BelyiMaps on main names no arithmetic successor (R01).

**Witness:** In `README.md`, "do not implement" occurs 0 times and "roadmap for a roadmap" 0 times; the review of the first head saw a section headed "Do not implement this section". `BelyiArithmeticActions` occurs 0 times in main's BelyiMaps.

**Repair:** Use this text: "need the outer Galois action of BelyiMaps §12.8, the tangential base points of InverseGaloisAndArithmeticFundamentalGroups §IG.1.2 and `π₁(M_{0,5})`; the README's Scope leaves them to a Part II of this roadmap."

## R04 (P3) — The description's build sentence is an unfilled placeholder

**Location:** Pull-request description, paragraph 4: "It elaborated locally against a shim with Tau Ceti's signatures; [say here whether `lake build` passed in a TauCetiRoadmap checkout]."

**Claim:** The bracketed instruction was never filled in, so a reader cannot tell whether the file builds, and the shim sentence is out of date: the file builds in this repository at the pins.

**Witness:** At ab052a8, `lake env lean` on `Suggested.lean` exits 0 with 15 warnings, all `sorry`, and 0 errors. The worker's gate reports `build=0 OK`.

**Repair:** Replace the sentence with: "`lake build TauCetiRoadmap.GrothendieckTeichmuller.Suggested` passes at the pinned Mathlib and Tau Ceti; its only warnings are the 15 `sorry`s of the stated theorems."

## Previous findings

- none: the review of 4a4fb37 raised no finding (verdict accepted).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| README:53–54, who takes the out-of-scope Galois statements | BelyiMaps README and Suggested.lean at 4a4fb37 and at ab052a8 | 13 + 2 occurrences of `BelyiArithmeticActions` before, 0 + 0 after; at this head BelyiMaps owns Layers 0–14 (lines 56–57) | broken by the merge | R01 |
| README:84–86, the boundary sentence | an owner for `Gal(ℚ̄/ℚ) → GT̂` on main or in an open pull request | `roadmaps grep` finds it only at this README's :47 and :663; the outer action itself is BelyiMaps §12.8 (line 4880) | no owner on main | R01 |
| README:661–666, the downstream consumer (conventions agree) | complex conjugation `τ` through `GT̂ → ẑˣ` and through BelyiMaps §12.10 | `τ ζ = ζ⁻¹`, so `χ_cyc(τ) = −1`; its image `c = (−1, 1)` has `χ(c) = −1` and `β_c(x) = x⁻¹` | the repaired interface agrees with the BelyiMaps convention | none |
| Scope citations of open heads | InverseGalois at 9432671; PeriodsAndSpecialValues at its head | IG.1.2 "tangential fibres" at 1027, IG.5.1 at 5425; PS.9.8 at 2190, 9.9 at 2211, 9.10 at 2231, 9.22 "motivic Hoffman basis" at 2505 | all resolve | none |
| Description: `chi` has a real body | the 43 declarations of `Suggested.lean` | `chi`: 0; named definitions with a body: 28, plus 4 instances; `sorry`'d theorems: 15 | contradicted | R02 |
| Description: «do not implement», roadmap for a roadmap | README at ab052a8 | 0 and 0 occurrences | contradicted | R03 |
| Suggested.lean elaborates at the pins | `lake env lean` on the file | exit 0; warnings 15, all `sorry`; theorems with `sorry` 15; errors 0; 5.3 s | builds | R04 |
| Pins and folder | `lake-manifest.json`, `lean-toolchain` and the folder, 4a4fb37..ab052a8 | 0 changed lines; Tau Ceti 2fd255d9, Mathlib 1b1ccf4b, Lean v4.36.0-rc2 | unchanged | none |

The rows for untouched statements stand as in the previous review, of 4a4fb37: the sample of sections 0.1–4.5, the headline theorems, the 43 signatures and the padding probe.

- **Scope of the change.** `git diff 4a4fb37 HEAD -- TauCetiRoadmap/GrothendieckTeichmuller` is empty. `git diff --stat origin/main...HEAD` outside the folder is empty. The 601 files changed since 4a4fb37 are main's, brought in by the merge commit.
- **Gate.** Rerun at this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- **Dependency check.** `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Merge-order positions: InverseGaloisAndArithmeticFundamentalGroups 53, PeriodsAndSpecialValues 323, this roadmap 408. The README states "Nothing is consumed from another roadmap" (README:177).
- **Cross-roadmap citations.** 9 resolved:
  - BelyiMaps Layer 12 (main :4558);
  - ProfiniteArithmetic at `Completed/ProfiniteArithmetic/README.md`;
  - ProfiniteProPGroups, under `Completed/`;
  - IG.1.2 and IG.5.1;
  - PS.9.8, 9.9, 9.10 and 9.22.

  One does not resolve: `BelyiArithmeticActions` (R01). The resolver's three Lean-name leads are this roadmap's own declarations at `Suggested.lean:254, :276, :287`, and the elaboration accepted all three.
- **Overlap check:** read ProfiniteArithmetic (main and #775), InverseGaloisAndArithmeticFundamentalGroups (#850), PeripheralActions, ProfiniteProPGroups and BelyiMaps (main). Shared objects and their owners:
  - `ẑ`, `x ^ᶻ a` and `ContinuousOut`: owned by ProfiniteArithmetic and implemented in Tau Ceti; this roadmap consumes them by name.
  - The outer Galois action: owned by BelyiMaps §12.8; this roadmap does not use it.
  - The Grothendieck–Teichmüller relations: PeripheralActions names them as "not a target" (main :576, :645). `GT̂` is owned here only.
- **Remark.** `Completed/ProfiniteArithmetic/README.md:28` still refers to "the successor of BelyiMaps that owns its Layers 12 and 13". That is ProfiniteArithmetic's text, not this roadmap's.

## Not verifiable

- No new items. Mel'nikov 1978 (no legal copy) and the source-version limits recorded by the earlier reviews stand. They concern untouched text that no finding depends on.

## Source issues

- none
