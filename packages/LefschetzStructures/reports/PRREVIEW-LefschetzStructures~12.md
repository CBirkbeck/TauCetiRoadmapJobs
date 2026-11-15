# Review of LefschetzStructures (pull request #1061 at 9f3f7c1)

**Verdict:** needs changes

## R01 (P3) — The description's Layer 2 is an earlier head's transport layer, not the dictionary of 2.4

**Location** Pull-request description, ¶1: “Lefschetz structures and the theory of algebraic operators on them, transported to the cohomology of varieties.” … “Layer 2: … and Layer 1's theorems on `H(X)` with established cases imported as theorems.”

**Claim** The description describes an earlier head's Layer 2, which transported Layer 1's theorems to `H(X)` and imported the established cases. At this head Layer 2 does neither, and the description never mentions what Layer 2 actually delivers: the dictionary of 2.4 with MotivesAndAlgebraicCycles §7.3's predicates. The text also never says that the pull request adds a new roadmap.

**Witness** README 517: “this section proves only the dictionary”; 523: “they are not restated on `H(X)`”; 96: the established cases “reach Layer 1 only through the dictionary of 2.4”; none of the 14 *Needs:* lines cites §7.4.

**Repair** Replace the first sentence with “Adds the roadmap LefschetzStructures: the linear algebra of Lefschetz structures and the theory of algebraic operators on them, compared with the cohomology of varieties.” Replace the Layer 2 sentence with “Layer 2: Lefschetz data on MotivesAndAlgebraicCycles' minimal Weil theory, `𝒜(X)` from all graded correspondences, the Lefschetz and algebraic structures on `H(X)`, and the dictionary (2.4) between Layer 1's four properties on `H(X)` and MotivesAndAlgebraicCycles §7.3's `B_H(X)`, `C_ℚ,H(X)`, `D_ℚ,H(X)` and Hodge standard positivity; Layer 1's theorems are not restated on `H(X)`, and the established cases stay MotivesAndAlgebraicCycles §7.4's.” Both sentences agree with README lines 3–4, 96 and 504–523.

## Previous findings

- none: the review of `abf1d6c` (accepted) raised no finding of its own.

## Verified sound

Incremental re-review of 0 changed lines since `abf1d6c`. `git diff --quiet abf1d6c HEAD -- TauCetiRoadmap/LefschetzStructures` succeeds. The one new commit merges main at `8ad4192c`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/LefschetzStructures'` is empty, and the pins are unchanged (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, `v4.36.0-rc2`).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Description, Layer 2 sentence and “transported” (R01) | the two clauses against README 3–4, 96, 504–523; all *Needs:* lines; supplier contracts | README 4 says “compare”, 523 says “not restated on `H(X)`”; §7.4 cited by 0 of 14 *Needs:* lines; contracts list §7.3 only | contradicted | R01 |
| 2.4 `LambdaAlgebraic (𝒜(X)) ⇔ B_H(X)` against MotivesAndAlgebraicCycles §7.3 at `4cfd9b7` | general `i ≤ d`; curve `i = 0`; surface `i = 0` | `π_iΛ^{d−i}π_{2d−i}` has degree `i−d`, so its class is in `CH^{d+(i−d)} = CH^i(X×X)`, as in §7.3; curve: `CH⁰ ∋ [X×X]`; surface: codimension `0` (§7.3, Check 2) | consistent | none |
| 2.4 curve Check, `Λ = (deg ξ)⁻¹[X×X]_*` | `ℙ¹`, `ξ = pt` | `[X×X]_*ξ = (∫ξ)·1 = 1 = Λ(L·1)`; `[X×X]_*1 = 0`; agrees with §7.3's “coefficient `1/deg η`” | sound | none |
| 2.4 Check 1: 1.2 and 1.4 give `B ⇒ C`, and `B ⇒ D` with positivity | §7.3 at `4cfd9b7` | §7.3 has `B⇒A,C` and `A` + Hodge positivity `⇒ D`, so `B` + positivity `⇒ D`; `projectorsAlgebraic_of_lambdaAlgebraic` gives `B⇒C`; 1.4 gives `B`+positivity`⇒D` | sound | none |
| `projectorsAlgebraic_of_lambdaAlgebraic` (description: “algebraic `Λ` ⇒ algebraic projectors”) | `ℚ[ξ]/(ξ³)`, `n = 2`, on `(1, ξ, ξ²)` | `L²Λ² ↦ (0,0,ξ²)`, `LΛ−L²Λ² ↦ (0,ξ,0)`, `1−LΛ ↦ (1,0,0)`: `π₄, π₂, π₀ ∈ ℚ⟨L,Λ⟩`; odd projectors are `0` | sound | none |
| Description: `Suggested.lean` covers Layers 0–1, imports only Mathlib, `sorry` the only warning | `lake env lean`; header | section comments at lines 54 and 140; only import `public import Mathlib` (line 3); 12 warnings (lines 108–239), all `sorry`; exit 0 | true | none |
| Description boundary: DeligneWeightsAndPurity §9.7 at `fae1b73` | `P^i` convention; `n = 2`, `i = 0` | `primitivePiece 𝒱 L n (n−i) = 𝒱(i) ∩ ker L^{n−i+1}` = README 113; `i = 0`: `ker L³`, matching §9.7's Check (`j=0 ↔ r=2`); names at its Suggested.lean 148, 155, 180 | resolved | none |
| Description boundary: EtaleDualityAndPerverseSheaves §5.7 at `763a08d` | heading; cited names | heading at line 5741; `abstractPrimitiveDecomposition` at 5810; `gradedLefschetz_vectorSpace_compat` absent (was line 5797 at `23180d4`) | remark below | none |
| Description: “`𝔰𝔩₂` representations are LieHighestWeight's”; 0.4 formula | main `f973c75`; `ℚ[ξ]/(ξ³)`, `j = 0`, `k = 0, 1` | former-numbering table (line 76) maps old Layer 0 to three Tau Ceti declarations at the pin; `fξ = 2`, `fξ² = 2ξ` = `(k+1)(n−j−k)` | resolved | none |
| Description: Kähler hard Lefschetz is ComplexKahlerGeometry K6.1's | main `f973c75` | §6.3 “Compact Kähler Hodge theory (K6.1)”, line 2477 | resolved | none |

The rows for the statements this change does not touch stand as in the review of `abf1d6c`.

- **Gate** (brief command, with `--build` and the candidate order): every scanner 0, `build=0`, OK, exit 0. The dependency check printed `depcheck: 245 roadmaps, 2234 edges, 0 problem(s)`, with no UPWARD or CYCLE line (MotivesAndAlgebraicCycles 93, LefschetzStructures 94). Run against the configured order instead, the check reports `NOT IN ORDER`; that is not a finding.
- **Elaboration**: 12 `declaration uses sorry` warnings and nothing else. The elaborated types in `signatures.md` match the README statements for all 24 declarations; its 25th entry, `of`, is docstring line 39 (“structure of `H(X)`”) misread as a declaration. The one-tactic probe of the previous rounds stands, since the file is byte-identical.
- **Pull-request text**: the title and 7 description sentences were checked against the head. Two sentences are contradicted (R01). The depends-on block is generated and outside this check.
- **Citations re-resolved at current heads**: 21 in total. MotivesAndAlgebraicCycles `4cfd9b7`: 7 sections, plus `Corr k X Y r`, `Corr.comp`, `NumTrivial`, `WeilCohomology k F`, `HomTrivial_H`, the `e ↦ λe` rescaling and the third Check of §2.3. DeligneWeightsAndPurity `fae1b73`: §§9.6–9.7 and 3 names. On main: SchemeAndStackFoundations §§5.1–5.6 and 5.10, EtaleCohomologyFoundations §§F.5–F.7, HodgeStructures and ComplexKahlerGeometry K6.1.
- **Library declarations opened at the pin**: `TauCeti.exists_int_of_hasEigenvalue` (`TauCeti/Algebra/Lie/Sl2/Spectrum.lean:151`), `TauCeti.finrank_eq_of_hasPrimitiveVectorWith` (`TauCeti/Algebra/Lie/Sl2/WeightString.lean:324`), `TauCeti.Sl2Std.isInternal_cgSummand` (`TauCeti/Algebra/Lie/Sl2/ClebschGordan.lean:275`) and `TauCeti.exists_isCompl_of_isKilling` (`TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean:259`).
- **Remark (untouched text)**: README line 51 cites `gradedLefschetz_vectorSpace_compat`. At EtaleDualityAndPerverseSheaves' head `763a08d` that name no longer exists: the vector-space Check of §5.7 is now unnamed. At `23180d4` it was `TauCeti.EtaleDuality.gradedLefschetz_vectorSpace_compat`.
- **Remark (untouched text)**: main's rewrite of LieHighestWeight (`1d2aa9a6`) moved its old Layer 0, `𝔰𝔩₂` representation theory, to the Tau Ceti declarations above and maps it in its former-numbering table (line 76). The README's “LieHighestWeight Layer 0” (lines 53–55, 171–175, 272, 307) therefore stays valid.

Overlap check: read MotivesAndAlgebraicCycles (`4cfd9b7`) and DeligneWeightsAndPurity (`fae1b73`), the two closest open roadmaps (none is listed on main or by results), and EtaleDualityAndPerverseSheaves §5.7. Shared objects and their owners: the primitive decomposition and pairings belong to DeligneWeightsAndPurity §9.7, which 0.2 and 0.5 adapt; the categorical decomposition belongs to EtaleDualityAndPerverseSheaves §5.7; Weil theories, correspondences and the §7.3 predicates belong to MotivesAndAlgebraicCycles, and 2.4 is a dictionary to them. DeligneWeightsAndPurity line 3089 leaves `Λ`, the `𝔰𝔩₂` triple and the grade projectors to the downstream consumer, which is this roadmap.

Source independence: changed passages only. The folder is byte-identical to `abf1d6c`, so 0 passages were compared with 0 sources, and the arrangement was not compared again (no layer added, removed or reordered). Largest share: the Montpellier fonds (folders 14 and 16), 4 of 14 locators. Contents not compared, because that text was not read in any round.

## Not verifiable

- Montpellier fonds folders 14 and 16; Kleiman 1968 and 1994; Grothendieck 1969; Lieberman 1968; André 2004. They sit in passages untouched since `abf1d6c` and were not fetched this round. The package records no `sources.toml`.

## Source issues

- none

## For the human reviewers

- Not tested: the largest share of the README's locators, 4 of 14, is Grothendieck's Montpellier fonds (folders 14 and 16; README lines 22, 228, 348, 378). No round has read them, so wording and arrangement were not checked against them.
- Sources: the Montpellier fonds are unpublished manuscripts. They are the cited source for 1.2 (alongside Kleiman 1994, Theorem 4.1), for 1.3 (alongside Beilinson 2012, §2.3) and for one 0.1 Check. Every other cited source is a published, refereed text.
