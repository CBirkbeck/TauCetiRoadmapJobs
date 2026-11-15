# Review of TwistedAutomorphicDescents (pull request #1758 at a6dd947)

**Verdict:** needs changes

Incremental re-review of the 97 lines changed since `32ea3a8`, and of the pull request's title and description. Three P3 findings, none blocking; the gate passes.

## R01 (P3) — Docstring names two headlines by a group title that describes other theorems

**Location:** `TauCetiRoadmap/TwistedAutomorphicDescents/Suggested.lean` lines 35–37 and 54–55: "Section 5.4, Cuspidality, outer stability and parameter of the critical module: lacks residual Arthur packet members …"; "Section 7.3, Recovery from regular or subregular Fourier support: lacks … rational regular Fourier maps".

**Claim:** After the regrouping, the headings 5.4 and 7.3 title the groups 5.4–5.8 and 7.3–7.5. The docstring entries are for the first part only (vanishing above k₀; regular recovery), but now carry titles describing 5.5–5.7 and 7.5, which have entries of their own.

**Witness:** `README.md` line 833: "Parts 5.4–5.8 prove …"; line 835 (part 5.4) proves only that coefficients at k>k₀ vanish. Docstring lines 38–43 list 5.5, 5.6, 5.7 separately; lines 58–59 list 7.5 separately.

**Repair:** Name the part in the two entries: "Section 5.4, vanishing of Bessel coefficients above the critical index (first part of "Cuspidality, outer stability and parameter of the critical module"): lacks …" and "Section 7.3, recovery from a regular Fourier coefficient (first part of "Recovery from regular or subregular Fourier support"): lacks …". Comment-only; elaboration is unaffected.

## R02 (P3) — Description says the Lean states definitions and theorems; it states none

**Location:** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti; every target is in the README."

**Claim:** A reader concludes that `Suggested.lean` carries headline statements. At this head it declares nothing.

**Witness:** `TauCetiRoadmap/TwistedAutomorphicDescents/Suggested.lean` lines 73–75: the namespace is opened and closed with nothing between; the worker's change summary records "Lean declarations: 0 removed, 0 added".

**Repair:** Replace the sentence by: "`Suggested.lean` states no declaration: none of the 23 headline theorems is statable against the pinned Mathlib and Tau Ceti, and its module docstring names each with the carriers it lacks; every target is in the README."

## R03 (P3) — Description reports a `sorry` warning the build does not give

**Location:** Pull request description: "Validation: the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** The file has no `sorry`, so the build has no such warning.

**Witness:** `lake env lean` on `TauCetiRoadmap/TwistedAutomorphicDescents/Suggested.lean` at `a6dd947`: exit 0, empty output.

**Repair:** "Validation: the targeted Lake build succeeds with no warning (the file contains no `sorry`)"; the rest of the sentence stands.

## Previous findings

- none: the review of `32ea3a8` accepted with no finding.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.4 group sentence: one surviving cell; a>ℓ gives P(π,σ^t), a≤ℓ gives P(σ,π) | a=1, r_W=0, ℓ=0 and ℓ=1 | β=max(a−ℓ,0)=1 and 0; survivors (0,1) and (0,0); cell (1,1) has α=1>0, killed. Regimes agree with part 2.6 | consistent | none |
| §5.4 group sentence: vanishing above k₀, decomposition of parameter φ_τ | d=5, m=2, a=4, j=1 (the §5.9 Check) | k₀=a−j−1=2; 2a+m=10; 2a+m−2k₀−1=5=d; partition [2k₀+1,1^5]=[5,1^5], sum 10 | consistent with §§5.3, 5.9 | none |
| §6.1 group sentence: partitions p and p¹ | a=2, m=1 (odd SO); a=2, m=2 (even SO); a=1, m=0 (U₁) | (3,1,1) and (3,1,1), sums 5; (3,3) and (3,1³), sums 6; [1,1] and [1,1], sums 2; all equal 2a+m | consistent | none |
| The seven "consume" sentences (README lines 460, 694, 766, 833, 938, 1011, 1096) | each named consumer against its `*Needs:*` line | 22 of 23 edges are in the consumer's `*Needs:*` line (lines 532, 546, 614, 732, 839, 853, 894, 971, 985, 1017, 1030, 1061, 1086, 1102); §5.9 uses §5.5 in an API bullet and §5.7 in a Check, not in `*Needs:*` | consistent; no consumer omitted | none |
| "No later section consumes" §§6.4–6.5 and §§7.3–7.5 | every `*Needs:*` and Dependencies line after line 1017 | §6.4 cited only by part 6.5 (same group); §§7.3–7.5 cited only within the group | true | none |
| R01: docstring entries 5.4 and 7.3 | title against part statement | title covers parts 5.4–5.8 / 7.3–7.5; entry's "lacks" clause and the README part are the first part only | mislabelled | R01 |
| R02, R03: description against the Lean file | declarations and warnings at the head | 0 declarations; elaboration exit 0, 0 warnings | description wrong | R02, R03 |

The rows for untouched statements stand as in the previous review, of `32ea3a8`.

- Changes read: 7 headings renamed, 7 group sentences added, 15 `###` headings turned into run-in part titles with unchanged ids and statement text, 3 docstring entries retitled; no statement, hypothesis, locator or `*Needs:*` line changed.
- Old titles: 0 remaining references in the README to the 7 replaced heading titles; the titled cross-references (§0.6, §2.3, §4.5 and supplier sections) still match.
- Source locators rechecked for the lead parts of the regrouped sections, 8 of 8 at the cited place: JZ2020 line 1256 (p.769), line 2090 (p.786), line 2112 (p.787), line 2353 (p.792), line 2386 (p.793), line 2907 (p.803), line 2991 (p.805), line 3190 (p.809). Seeded targets 2.4, 5.4 and 6.4 fall here; the other twelve are untouched.
- Library declaration reopened for the description's claim: `TauCeti.RegularFormClass.wittDecomposition`, `TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean` line 262 at the pin.
- Cross-roadmap: no open pull request drops or redefines an id cited here; GanGrossPrasadUnitaryGroups (README line 1553) names this roadmap as a consumer only. Outside-folder diff: empty.
- Gate at `a6dd947`: every check 0, OK. Elaboration: exit 0, no warning. Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Title and summary block: agree with the head (adds a roadmap; suppliers as in the README's contracts). Remark: the summary's "top layers" include the period-to-central-value implication, which is §4.7 in Layer 4 of 0–7.
- Padding probe and `#check` comparison: not applicable, the file has no declaration.

Overlap check: read GanGrossPrasadUnitaryGroups, AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicSpectralTheory; nothing shared (unitary relevant pairs and Bessel data: GanGrossPrasadUnitaryGroups; orthogonal ones: this roadmap; Eisenstein continuation and intertwiner holomorphy: AutomorphicSpectralTheory).

Source independence: changed passages only; 17 passages (7 headings, 7 group sentences, 3 docstring entries) compared with 1 source, none shared; largest share JZ2020, 64 of 80 line locators; the change adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- GRS2011 (settled as uncertified): its locators in §§1.3, 5.7, 6.3 and 7.3 are untouched by this change and were not read.
- The description's sentence on AI assistance (review and red-team round counts) describes the job board, not the head; not checked.

## Source issues

- none (no new one in this round; those listed in the review of `32ea3a8` stand)

## For the human reviewers

- **Scope.** The main source JZ2020 (64 of 80 line locators) is a refereed research article; the roadmap adds comparisons the article does not prove (listed under "Not verifiable" in the review of `32ea3a8`) and keeps Generic Summand and weak Fourier support as hypotheses.
- **Not tested.** GRS2011 is cited by locator only (uncertified); its text was not read in either round.
