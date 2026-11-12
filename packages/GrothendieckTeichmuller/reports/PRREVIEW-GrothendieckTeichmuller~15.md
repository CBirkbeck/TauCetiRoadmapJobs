# Review of GrothendieckTeichmuller (pull request #1058 at cf826d9)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since ab052a8. This head only merges main (progress reports of other roadmaps), so the four findings of the previous review stand unrepaired.

## R01 (P3) — Out-of-scope Galois statements handed to a BelyiMaps successor that main does not name

**Location:** `TauCetiRoadmap/GrothendieckTeichmuller/README.md:53–54`, `:86`, `:661–665`: "are left to the successor of [BelyiMaps](../BelyiMaps/README.md) Layer 12 (`BelyiArithmeticActions`)"; "in BelyiMaps' successor"; "The successor of [BelyiMaps](../BelyiMaps/README.md) Layer 12, `BelyiArithmeticActions`, consumes".

**Claim:** The statements `Gal(ℚ̄/ℚ) → GT̂`, `Out♯ₙ ≅ GT̂` and `Out(Πₙ) ≅ GT̂ × 𝔖ₙ₊₃` are handed to a roadmap that does not exist. BelyiMaps on main owns its Layer 12 itself and excludes Grothendieck–Teichmüller theory, so it cannot own them either.

**Witness:** `TauCetiRoadmap/BelyiMaps/README.md` on main (7342e8f, identical at this head) has 0 occurrences of `BelyiArithmeticActions`. Its line 56 says it "owns every milestone" of Layers 0–14, and line 5616 excludes Grothendieck–Teichmüller theory.

**Repair:** Make these three edits.
- At :53–56, replace "the successor of [BelyiMaps](../BelyiMaps/README.md) Layer 12 (`BelyiArithmeticActions`) and to InverseGaloisAndArithmeticFundamentalGroups §IG.1.2 (tangential base points) and §IG.5.1 (configuration spaces)" with "GrothendieckTeichmuller, Part II, which consumes this roadmap, the outer action of `Gal(ℚ̄/ℚ)` on the profinite fundamental group of `ℙ¹ ∖ {0, 1, ∞}` of [BelyiMaps](../BelyiMaps/README.md) §12.8 (BelyiMaps excludes Grothendieck–Teichmüller theory and tangential base points), and InverseGaloisAndArithmeticFundamentalGroups §IG.1.2 (tangential base points) and §IG.5.1 (configuration spaces)".
- At :85–86, replace "it is in BelyiMaps' successor or in InverseGaloisAndArithmeticFundamentalGroups" with "it is in this roadmap's Part II, in BelyiMaps or in InverseGaloisAndArithmeticFundamentalGroups".
- At :661, replace "The successor of [BelyiMaps](../BelyiMaps/README.md) Layer 12, `BelyiArithmeticActions`, consumes" with "GrothendieckTeichmuller, Part II, consumes". At :663, replace "with the tangential base points of" with "with the outer action of BelyiMaps §12.8 and the tangential base points of". At :665, replace "that successor" with "that Part II".

## R02 (P3) — The description lists a definition `chi` that `Suggested.lean` does not declare

**Location:** Pull-request description, paragraph 4: "definitions (`subst`, `beta`, the `Monoid Param` structure, the Artin generators with their membership proofs, `RelI`–`RelIII`, `gtMonoid`, `GTHat`, `chi`) have real bodies".

**Claim:** `Suggested.lean` declares no `chi`: the character `χ` is a README target only (§4.1). The laws on which `Monoid Param` rests are `sorry`'d theorems.

**Witness:** `chi` occurs 0 times in `Suggested.lean` and is not among the 43 declarations the folder adds. `Suggested.lean:39–41` says `Monoid Param`, `gtMonoid` and `GTHat.betaEquiv` rest on `sorry`'d proofs.

**Repair:** Use this text: "definitions (among them `subst`, `commutatorClosure`, `Param` with its product and unit, `beta`, the six Artin generators with their membership proofs, `P4hat`, `toHat`, `RelI`–`RelIII`, `IsGT`, `gtMonoid`, `GTHat`, `IsGT0`, `GTHat.betaEquiv`) have real bodies. The monoid laws of `Param`, `isGT_one` and `IsGT.mul`, on which `Monoid Param` and `gtMonoid` rest, are `sorry`'d theorems. The character `χ` is a README target only."

## R03 (P3) — The description cites a "do not implement" section and a BelyiMaps successor, neither of which exists

**Location:** Pull-request description, paragraph 2: "need BelyiMaps' arithmetic successor, tangential base points (#850) and `π₁(M_{0,5})`; they are recorded as a roadmap for a roadmap, with an explicit « do not implement »."

**Claim:** The README has no such section. These statements are a scope exclusion (README:47–56), and BelyiMaps on main names no arithmetic successor (R01).

**Witness:** In `README.md`, "do not implement" and "roadmap for a roadmap" occur 0 times each. `BelyiArithmeticActions` occurs 0 times in main's `TauCetiRoadmap/BelyiMaps/README.md`.

**Repair:** Use this text: "need the outer Galois action of BelyiMaps §12.8, the tangential base points of InverseGaloisAndArithmeticFundamentalGroups §IG.1.2 and `π₁(M_{0,5})`; the README's Scope leaves them to a Part II of this roadmap."

## R04 (P3) — The description's build sentence is an unfilled placeholder

**Location:** Pull-request description, paragraph 4: "It elaborated locally against a shim with Tau Ceti's signatures; [say here whether `lake build` passed in a TauCetiRoadmap checkout]."

**Claim:** The bracketed instruction was never filled in. The sentence about a shim is also out of date: the file builds in this repository at the pins.

**Witness:** At cf826d9, `lake env lean` on `Suggested.lean` exits 0 with 0 errors and 15 warnings, all "declaration uses `sorry`". The worker's gate reports `build=0 OK`.

**Repair:** Replace the sentence with: "`lake build TauCetiRoadmap.GrothendieckTeichmuller.Suggested` passes at the pinned Mathlib and Tau Ceti; its only warnings are the 15 `sorry`s of the stated theorems."

## Previous findings

- R01 — not repaired: README:53–54 still reads "are left to the successor of [BelyiMaps](../BelyiMaps/README.md) Layer 12 (`BelyiArithmeticActions`)"; :86 "in BelyiMaps' successor"; :661 "The successor of … `BelyiArithmeticActions`, consumes".
- R02 — not repaired: the description still reads "`RelI`–`RelIII`, `gtMonoid`, `GTHat`, `chi`) have real bodies".
- R03 — not repaired: the description still reads "they are recorded as a roadmap for a roadmap, with an explicit « do not implement »".
- R04 — not repaired: the description still reads "[say here whether `lake build` passed in a TauCetiRoadmap checkout]".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| README:53–54, :86, :661, owner of the out-of-scope Galois statements | BelyiMaps on main 7342e8f; open draft #1791, which revises BelyiMaps, at fcad6f1 | `BelyiArithmeticActions`: 0 on main, 15 lines at #1791. A revision is never a supplier, so main governs. BelyiMaps owns Layers 0–14 (:56). | broken | R01 |
| R01 repair target, BelyiMaps §12.8 | main `TauCetiRoadmap/BelyiMaps/README.md` | heading "12.8 The arithmetic extension and the outer action" at line 4880; Tau Ceti `outerAction` named at 4878 | resolves | none |
| §4.3 `c = (−1, 1)` and (II) at `f = 1` | `λ = −1`, `λ = 3` in `D_N` with `x ↦ s`, `y ↦ sr` | `λ = −1`: `m = −1`, `z⁻¹y⁻¹x⁻¹ = (xyz)⁻¹ = 1`. `λ = 3`: `m = 1`, `zyx = r⁻¹·sr·s = r⁻²`, which is not 1 for `N = 3` | Check agrees with 4.3 | none |
| Description: `chi` has a real body | the declarations of `Suggested.lean` | `chi`: 0 occurrences; 15 `sorry`'d theorems | contradicted | R02 |
| Description: «do not implement», roadmap for a roadmap | README at cf826d9 | 0 and 0 occurrences | contradicted | R03 |
| Description: the bottom rungs are implemented | Tau Ceti 2fd255d9 | `zpowHat` at `ZHat/Pow.lean:83`; `pureSubgroup` at `Braid/Basic.lean:504`; `ContinuousOut` at `ContinuousAut/Basic.lean:311` | holds | none |
| `Suggested.lean` elaborates at the pins | `lake env lean` on the file | exit 0; 0 errors; 15 warnings, all `sorry`; 5.1 s | builds | R04 |

The rows for untouched statements stand as in the previous review, of ab052a8: the sample of §§0.1–4.5, the headline theorems, the 43 signatures and the padding probe.

- **Scope of the change.** `git diff ab052a8 HEAD -- TauCetiRoadmap/GrothendieckTeichmuller` is empty. `git diff --stat origin/main...HEAD` outside the folder is empty, and the merge base is main 7342e8f. The 36 files outside the folder are main's progress reports, brought in by the merge.
- **Gate.** Rerun at this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- **Dependency check.** `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. README:177 says "Nothing is consumed from another roadmap."
- **Pins.** Tau Ceti 2fd255d9, Mathlib 1b1ccf4b, Lean v4.36.0-rc2. They have not changed since ab052a8.
- **Overlap check:** read ProfiniteArithmetic (main and #775), InverseGaloisAndArithmeticFundamentalGroups (#850), PeripheralActions, ProfiniteProPGroups and BelyiMaps (main, and #1791 for the successor name). The `overlaps` tool reports no dropped ids and no other pull request changing this roadmap. Owners as in the previous review: ProfiniteArithmetic and Tau Ceti own `ẑ`, `x ^ᶻ a` and `ContinuousOut`; BelyiMaps §12.8 owns the outer Galois action; this roadmap alone owns `GT̂`.
- **Citations.** The resolver finds no unresolved cross-roadmap citation. Its three Lean-name leads (`GTHat.isGT0`, `GTHat.injective_mk_betaEquiv`, `GTHat.isClosedEmbedding_betaEquiv`) are this roadmap's own declarations, and the elaboration accepted all three.

## Not verifiable

- No new items. Mel'nikov 1978 (no legal copy) and the source-version limits recorded by earlier reviews stand. They concern untouched text that no finding depends on.

## Source issues

- none
