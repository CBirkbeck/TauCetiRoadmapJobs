# Review of GrothendieckTeichmuller (pull request #1058 at 4b88d9b)

**Verdict:** needs changes

Incremental re-review of 20 changed lines since cf826d9.

## R01 (P3) — The rewritten boundary sentence places the inputs of every excluded statement in BelyiMaps or InverseGalois

**Location:** `TauCetiRoadmap/GrothendieckTeichmuller/README.md:87–89`: "if it mentions a Galois group, a curve or a configuration space, it is not here, and its inputs other than `GT̂` are in BelyiMaps or in InverseGaloisAndArithmeticFundamentalGroups."

**Claim:** The added clause is false for the motivic statements that the Scope excludes a few lines earlier. Brown's faithfulness theorem and the Deligne–Ihara conjecture mention the motivic Galois group and `Gal(ℚ̄/ℚ)`. Their inputs are in neither roadmap.

**Witness:** README:64–66 places mixed Tate motives over `ℤ`, their Galois group and the motivic path torsor in PeriodsAndSpecialValues §§PS.9.8–9.10. "mixed Tate" and "motivic Galois" occur 0 times in main's BelyiMaps README and 0 times in InverseGaloisAndArithmeticFundamentalGroups at its head.

**Repair:** At :87–89, replace "it is not here, and its inputs other than `GT̂` are in BelyiMaps or in InverseGaloisAndArithmeticFundamentalGroups." with "it is not here." The Scope paragraph above already names the roadmaps that state the inputs of the Galois and motivic statements.

## Previous findings

- R01 — repaired: README:52–57 now reads "are not in this roadmap. They use, besides `GT̂`, the outer action of `Gal(ℚ̄/ℚ)` … of BelyiMaps §12.8 …, the tangential base points of InverseGaloisAndArithmeticFundamentalGroups §IG.1.2 and its configuration spaces of §IG.5.1"; :664 "No roadmap on main cites this one." The repair introduced the new R01 above (:87–89).
- R02 — repaired: the description now reads "(among them `subst`, `commutatorClosure`, `Param` … `GTHat.betaEquiv`) have real bodies. The monoid laws of `Param`, `beta_mul`, `beta_one`, `isGT_one` and `IsGT.mul` … are `sorry`'d theorems. The character `χ` is a README target only."
- R03 — repaired: the description now reads "need the outer Galois action of BelyiMaps §12.8, the tangential base points of InverseGaloisAndArithmeticFundamentalGroups §IG.1.2 and the configuration spaces of its §IG.5.1; the README's Scope records them as outside this roadmap".
- R04 — repaired: the description now reads "`lake build TauCetiRoadmap.GrothendieckTeichmuller.Suggested` passes at the pinned Mathlib and Tau Ceti; its only warnings are the 15 `sorry`s of the stated theorems."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| README:52–57, inputs of the excluded Galois statements | BelyiMaps on main 7342e8f and at #1791 fcad6f1; InverseGalois at #850 9432671 | "12.8 The arithmetic extension and the outer action": main :4880, #1791 :4081, `ρ : Gal(ℚ̄/ℚ) →* ContinuousOut (profiniteCompletion (FreeGroup (Fin 2)))`. IG.1.2 "Tame quotients and tangential fibres" :1027; IG.5.1 "Configuration spaces" :5425 | resolves | none |
| README:55–56 parenthesis: BelyiMaps excludes GT theory and tangential base points | main BelyiMaps exclusion list | :5613 "tangential basepoints, canonical splittings or liftings of the outer action"; :5616 "Grothendieck–Teichmüller theory and anabelian reconstruction" | holds | none |
| README:52–57, "They use, besides `GT̂`, …" (read collectively) | Harbater–Schneps `Out♯ₙ ≅ GT̂`; `Gal(ℚ̄/ℚ) → GT̂` | Harbater–Schneps: `π̂₁(M_{0,n})`, a configuration space (IG.5.1). The Galois map: outer action (12.8), tangential base point (IG.1.2), `M_{0,5}` for (III) (IG.5.1) | holds collectively | none |
| README:87–89, boundary clause "its inputs … are in BelyiMaps or in InverseGalois" | Brown 2012 faithfulness; Deligne–Ihara (README:67–71) | Both mention a Galois group. Inputs: README:65–66 points to PeriodsAndSpecialValues §§PS.9.8–9.10 (#1496 :2189, :2210, :2230). "mixed Tate"/"motivic Galois": BelyiMaps 0, IG 0 | false | R01 |
| README:664 "No roadmap on main cites this one." | grep of main 7342e8f and of the 439 open heads | `GrothendieckTeichmuller`: 0 hits outside this folder. BelyiMaps :5616 and PeripheralActions :576, :645 mention GT theory but cite no section of this roadmap. Phrasing as main's EquivariantIntersectionTheory :598 | holds | none |
| §4.3 `c = (−1, 1)` against the Galois input the changed text names | complex conjugation, `β_{−1,1}` | `β_{−1,1}(x) = x⁻¹`; `β_{−1,1}(y) = 1⁻¹ y⁻¹ 1 = y⁻¹`. (II) at `λ = −1`: `m = −1`, `z⁻¹y⁻¹x⁻¹ = (xyz)⁻¹ = 1` | agrees | none |
| Description, paragraph 4 (R02, R04) | the declarations of `Suggested.lean` | 15 `sorry`'d theorems: 3 `Param` laws, `beta_mul`, `beta_one`, `isGT_one`, `IsGT.mul` and 8 headlines. `chi`: 0 occurrences. `GTHat.betaEquiv` uses `beta_mul`, `beta_one` at :263, :267 | holds | none |
| Description, paragraph 2 (R03) | README at 4b88d9b | "do not implement": 0; "roadmap for a roadmap": 0; sections as in row 1 | holds | none |
| `Suggested.lean` elaborates at the pins | `lake env lean` on the file | exit 0; 0 errors; 15 warnings, all `sorry`; 4.3 s | builds | none |

The rows for statements this change leaves untouched stand as in the previous review, of cf826d9: the sample of §§0.1–4.5, the headline theorems, the 43 signatures and the padding probe.

- **Scope of the change.** The folder diff since cf826d9 touches only `README.md`, at head lines 53–58, 88–89 and 664. No Lean declaration changed. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** Rerun at this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- **Dependency check.** Output: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. README:177 still reads "Nothing is consumed from another roadmap." The changed passages add no `*Needs:*` line.
- **Pins.** Tau Ceti 2fd255d9, Mathlib 1b1ccf4b, Lean v4.36.0-rc2.
- **Cross-roadmap citations resolved:** 5 in the changed passages and 4 in the description. They are BelyiMaps §12.8 (main and #1791), its exclusions at :5613 and :5616, IG §1.2 and §5.1 (#850), and PeriodsAndSpecialValues §§PS.9.8–9.10 (#1496). The overlaps tool finds no dropped id and no other pull request that changes this roadmap.
- **Overlap check:** read ProfiniteArithmetic (main, #775), PeripheralActions and ProfiniteProPGroups (main), InverseGaloisAndArithmeticFundamentalGroups (#850) and BelyiMaps (main, #1791). Of these, BelyiMaps §12.8 owns the outer Galois action, and ProfiniteArithmetic and Tau Ceti own `ẑ`, `x ^ᶻ a` and `ContinuousOut`. This roadmap alone owns `GT̂`, `Param`, `β` and relations (I)–(III): PeripheralActions :576 and BelyiMaps :5616 exclude them.
- Remark on untouched text: the sources sentence of the description omits Ribes–Zalesskii, Herfort–Ribes, Belyi, Grothendieck 1984, Mel'nikov and Jarden–Lubotzky, which the References list. It says "Sources:" and does not claim to be complete.

## Not verifiable

- No new items. Mel'nikov 1978 (no legal copy) and the source-version limits that earlier reviews recorded still stand. They concern untouched text that no finding depends on.

## Source issues

- none
