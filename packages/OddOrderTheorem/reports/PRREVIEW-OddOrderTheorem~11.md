# Review of OddOrderTheorem (pull request #1777 at b3bd1fe)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since b3bd1fe. The folder is unchanged and stands as reviewed; the three findings are all in the pull request's description, which was written for an earlier head. No file of the roadmap needs to change.

## R01 (P3) — The description names a supplier the head does not cite, and omits two it does

**Location:** pull request description, prose: "Prerequisites: LocalFiniteGroupTheory #1634 and FiniteGroupExtensionSplitting #1774." Also: "Existing ordinary character theory, local finite-group theory and extension cohomology supply the foundations".

**Claim:** The head does not consume LocalFiniteGroupTheory, and FiniteGroupExtensionSplitting is no longer an open prerequisite. The suppliers still open are FiniteGroupInvariants and InverseGaloisAndArithmeticFundamentalGroups, which the prose does not name.

**Witness:** `TauCetiRoadmap/OddOrderTheorem/README.md` has no occurrence of "LocalFiniteGroupTheory"; its supplier headings (lines 160–206) are CharacterTheory, InductionRestriction, InverseGaloisAndArithmeticFundamentalGroups, FiniteGroupInvariants, FiniteGroupExtensionSplitting. FiniteGroupExtensionSplitting is on main.

**Repair:** Replace the first sentence by: "Prerequisites: FiniteGroupInvariants (§0.2, §0.3, §2.1: chief series, minimal normal subgroups, Hall existence) and InverseGaloisAndArithmeticFundamentalGroups (IG.3.4, IG.4.3: Schur–Zassenhaus conjugacy, the Fitting subgroup), both still open; CharacterTheory, InductionRestriction and FiniteGroupExtensionSplitting (§2.4, §3.1) are on main. The general local analysis is stated here, in Layer 1." Replace the second by: "Existing ordinary character theory, the Fitting subgroup, Hall existence and extension splitting come from the supplying roadmaps; the remaining local analysis is Layer 1 of this roadmap".

## R02 (P3) — "five admitted targets": the file has six

**Location:** pull request description, prose: "Validation: `lake env lean TauCetiRoadmap/OddOrderTheorem/Suggested.lean` passes (five admitted targets)."

**Claim:** `Suggested.lean` at this head admits six theorems.

**Witness:** `lake env lean` on `TauCetiRoadmap/OddOrderTheorem/Suggested.lean` warns `declaration uses sorry` at lines 52, 55, 59, 118, 128, 144: `not_isMinimalOddSimple`, `isSolvable_of_odd_natCard`, `even_natCard_of_nonabelian_simple`, `exists_dadeExtension`, `isDadeExtension_eq_indClassFunction`, `appendixC_prime_le`.

**Repair:** "… passes (six admitted theorems: the three forms of the odd order theorem, the existence of the Dade isometry, its agreement with induction for trivial complements, and Appendix C)."

## R03 (P3) — The description lists definitions the file does not contain

**Location:** pull request description, prose: "Its concrete definitions include Dade complement data, coherence on the supported intersection, and sigma primes; the Appendix C signature fixes the finite-field action conventions."

**Claim:** `Suggested.lean` defines neither coherence nor the `σ` primes; its module docstring names `σ(M)` and the coherence theorems as not statable at the pins.

**Witness:** The four definitions at this head are `IsMinimalOddSimple` (line 44), `DadeDatum` (line 71), `supportedClassFunctions` (line 87), `IsDadeExtension` (line 105); docstring lines 20–28 list `σ(M)` and (5.6), (6.3), (6.8) as not stated.

**Repair:** "Its four definitions are `IsMinimalOddSimple`, the Dade data `DadeDatum`, the supported class functions `supportedClassFunctions` and the predicate `IsDadeExtension`; the five-type theorem, the type-I Frobenius theorem, the coherence theorems, Thompson transitivity and the `p`-length theorem are named in the module docstring as not statable at the pins. The Appendix C signature fixes the finite-field action conventions."

## Previous findings

- none: the review of b3bd1fe accepted with no finding.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `isDadeExtension_eq_indClassFunction` (cited by the description's "general Dade/induction comparison") | `L = ⟨(12)⟩ ≤ S₃`, `A = {(12)}`, `H = ⊥`, `f = 1_A`; `L = A₃`, `A = A₃ \ {1}` | `C_G((12)) = L`; `Ind f` is `2/2 = 1 = f(a)` on transpositions, `0` elsewhere; norms `3/6 = 1/2`. `A₃`: `(123) ~ (132)` in `S₃`, not in `A₃`, so `fusion` fails | correct; fusion clause needed | none |
| description "five admitted targets" (R02) | elaboration of `Suggested.lean` | description: 5; `sorry` warnings: 6 (lines 52, 55, 59, 118, 128, 144) | description wrong | R02 |
| description "definitions include … coherence … sigma primes" (R03) | declarations of `Suggested.lean` | description: Dade data, coherence, `σ` primes; file: `IsMinimalOddSimple`, `DadeDatum`, `supportedClassFunctions`, `IsDadeExtension` | description wrong | R03 |
| description "Prerequisites" (R01) | README supplier headings; main; open heads | description: LocalFiniteGroupTheory, FiniteGroupExtensionSplitting; README: 0 mentions of the first, the second on main; open suppliers FiniteGroupInvariants, InverseGaloisAndArithmeticFundamentalGroups | description wrong | R01 |

The rows for the untouched statements stand as in the previous review, of `b3bd1fe`.

- Gate (`gate … --base origin/main`): every counter `0`, `OK`, exit 0; the worker's run with the build reports `build=0 OK`.
- Dependency check: `depcheck: 244 roadmaps, 2230 edges, 0 problem(s)`, exit 0; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0; the only warnings are the six `sorry` warnings above. The file is byte-identical to the one the previous review probed (`#check @` comparison, one-tactic probe, headline audit), so those results stand.
- Folder diff since b3bd1fe: empty. Changes outside the folder against `origin/main`: none. Folder contents: `README.md`, `Suggested.lean`, `metadata.toml`.
- Description sentences checked against the head and found consistent: the title; the summary block (five types, Appendix C, arbitrary universes at README lines 131–132, GlaubermanZStar and Bender–Suzuki consumers at lines 1630–1638, "Fitting subgroups, Hall existence and extension-splitting" suppliers); "The general character theory in F2 … independent" (README lines 47–49); "does not require modular blocks, CFSG or Glauberman Z*" (lines 91–93); "adds a roadmap" (not on main; 58 headings and 10 declarations added, none removed).
- Citations: `citations.md` lists three leads, all resolved (`IsMinimalOddSimple.proper_solvable` is the structure field at `Suggested.lean` line 48; the two `TauCetiRoadmap.RepresentationTheory.*` names are supplier headings for folders on main).
- Seeded sample and source locators: no sampled target lies in a changed passage (there is none); the README flags no locator as unverified.
- Overlap check: read LocalFiniteGroupTheory, GlaubermanZStar, FiniteGroupInvariants, ModularCharactersAndBlocks, CharacterTheory, FiniteGroupExtensionSplitting as listed in `overlaps.md`; no open pull request changes this roadmap or drops an id it cites; ownership unchanged since the previous reviews (nothing in the folder changed), not re-derived this round.
- Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change); arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- "Roadmap topic validation, whitespace checks and pinned source-link checks pass" (description): these are the author's own checks; the project gate, which I ran, passes, but I did not run the checks the sentence names.
- Bender–Glauberman 1994 and Peterfalvi 2000: settled as `uncertified`; nothing in this round depends on their text.

## Source issues

- none

## For the human reviewers

- **Not tested.** The two books cited most (BenderGlauberman1994, Peterfalvi2000) are `uncertified`: no review compared the README's wording or arrangement with their printed text, only with the math-comp transcriptions (`MC-BG*`, `MC-PF*`).
- **Licence.** The README's References cite the `math-comp/odd-order` formalisation as a provenance source; whether its licence permits that use is a human's reading. The names in `Suggested.lean` differ from math-comp's.
