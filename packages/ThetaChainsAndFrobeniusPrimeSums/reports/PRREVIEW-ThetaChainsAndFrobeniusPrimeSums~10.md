# Review of ThetaChainsAndFrobeniusPrimeSums (pull request #2924 at 73ab875)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/`
**Verdict:** accepted

**Summary.** Accepted. The folder has not changed since the previous review of this head, so this round read the pull request's title and description against the head: every sentence agrees with the README, `Suggested.lean` and the family index, and the one small correction of the previous review (the description was silent on the new section of the family index) is repaired. There is no finding and no small correction; two format notes are carried, neither blocking. The scope, licence and policy questions stay with the human reviewers.

## N01 — "The mathematics of this roadmap follows a complete formal proof"

The first sentence of **Routes** in the Conventions (line 146) still says the roadmap follows a source. The family index words the same fact as "The results that the family states are those of the formal Lean proof"; the same wording would serve here.

## N02 — The letter `C₁` in the locator of 9.4 is already the constant of LocalGainOfThetaChains §4.10a

The locator of 9.4 (line 508) writes the bound of the formal proof as `max(11, 16 + 3C₁)` "with `log g₀, log g₁ ≤ C₁·x^ε`", while 10.6 fixes "the constant `C₁` of LocalGainOfThetaChains §4.10a" (`C₁ = 1` serves) and 10.6a writes the same bound with `max(5, C_g + 1)` in that place. Another letter in 9.4 (say `C_Y`) would keep the two apart.

## Questions for the author

- 10.6 (lines 981–983) says that in the construction of [FormalProof] the band constant "is the square of the last of its constants". The sentence has no locator, and I did not find where the constant of the band condition is set to a square. Which declaration fixes it? (Carried from the previous reviews.)

## Previous findings

The previous report (of this same head) had no finding; its small correction and its format notes stand as follows.

- C01 (then) — repaired: the description now reads "says at which commit of the published source the cited files are to be looked up, and has a section on what a contribution and its review may do when a roadmap of the family is demonstrably wrong".
- N01 (then) — not repaired: line 146 still reads "The mathematics of this roadmap follows a complete formal proof"; written again above as N01.
- N02 (then) — not repaired: line 508 still writes `max(11, 16 + 3C₁)` with `log g₀, log g₁ ≤ C₁·x^ε`; written again above as N02.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 10.10 (`cyclicWindowedBound`), which the description names | `ω₀ = 3/4`, order `o`; `o = 1` (`ψ` trivial); `o = 2` | `(1 − 3/4)/(1 + (3/4)(o − 1)) = (1/4)/((3o + 1)/4) = 1/(3o + 1)`; `o = 1`: family `{1}`, weight `1`; `o = 2`: weights `1`, `1/7` | Lean, README and description agree |
| 10.11 (`cyclicWindowedBound_forEveryEpsilon`) from 10.10 | `ε > 0` given; take `ε′ < min(ε₁, ε/9)` | `9ε′ < ε` and `y ≥ Y ≥ 1` on a window, so `y^{1/2+9ε′} ≤ y^{1/2+ε}`; weights `1`, `1/(3o+1) > 0`; `κ = 3/2 > 1` | consumer form follows; no hypothesis missing |
| Description: "`c_Δ` chosen after `ε` and `c_H`, before the node spacing" | Conventions table (line 223), 10.6 (lines 1001, 1021–1024), 10.6d (lines 1133–1135, 1163) | README order: `ε`, `c_H`, band constant, `c_Δ ≥ c_Δ⁰`, then `c_h ≥ c_h⁰` (node gap), then `x₀` | agrees |
| Description: "2 headline theorems … 5 definitions" | declarations of `Suggested.lean` | theorems: `cyclicWindowedBound`, `cyclicWindowedBound_forEveryEpsilon`; definitions: `PrimitiveDirichletCharacter`, `rieszRemainder`, `cyclicFamily`, `familyWeight`, `HasWindows`; docstring names 10.4 and 9.6 as not statable | 2 and 5, names as listed |
| Description: the family index | `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` | lists 41 sub-roadmaps "in merge order" (line 40); first-commit sentence (lines 18–19); section "When a roadmap is wrong" (lines 45–75) | agrees |

The rows for the untouched statements stand as in the previous review, of `73ab875`.

- Description sentences read against the head: the opening paragraph (folder, family, provenance), the second paragraph (word for word the README's Summary, lines 3–11, with the sentence on ThetaChainsOnDefiniteUnitaryGroups §§2.3, 2.3a), the family-index paragraph, the `Suggested.lean` paragraph, the dependencies paragraph; none contradicted, no change left unstated (the pull request adds a roadmap: 2118 lines, 63 headings, 7 declarations).
- Cross-roadmap citations resolved at the open heads: ThetaChainsOnDefiniteUnitaryGroups §2.3 and §2.3a ("Existence of adapted, separated data"), FrobeniusRestrictedRieszSums §0.5, PositivityOfDirichletSeriesWithKernels §6.9, RiemannHypothesisStatementsAndConsequences §8.4a, GeneralizedRiemannHypothesisFromWindowBounds §§4.2, 5.1 (which cite §10.11 here).
- Library declarations: none touched; `Suggested.lean` has the single line `import Mathlib` and no `set_option`.
- Dependency check: `depcheck: 133 roadmaps, 1479 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 111 and 122), nothing else.
- Changes outside the folder: the family index only (`README.md`, `Suggested.lean`, `metadata.toml` of the family); nothing outside the family. The worker's automatic checks all passed.
- Source locators: none newly checked (no line of the folder changed).

Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups, FrobeniusRestrictedRieszSums; nothing shared.

Source independence: changed passages only; 0 passages compared (the folder did not change); largest share FormalProof, all located citations; contents not compared again (no layer added, removed or reordered).

Research link: Layers 9–10 conclude the announced formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026), assembling Bost's slope inequality (1996), the Chowla–Selberg period (1967), the mass formula of Gan–Hanke–Yu (2001), Harish-Chandra's formal degrees (1966) and Banaszczyk's transference (1993); README Summary and References, [Announcement] lines 9–13.

## Not verifiable

- The family index says the cited files are to be looked up at the first commit of the public repository; the previous reviews checked the locators in a later commit of the same repository, and this round opened none.
- That each cited proposition of [FormalProof] is discharged for the chain: statements were compared in the previous reviews; the proofs were not traced or built.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets (9.6, 10.4, 10.10, 10.11) rest only on [FormalProof], an unrefereed Lean formalization announced 20 November 2026; [Announcement] lines 9–13 and 72–76 say only Lean is presented. No refereed source states them.
- Licence: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 10–19) says the proof was published without a licence and is mirrored for verification only; the sources service does not classify the repository's host.
- Licence: `HasWindows`, the bundle `PrimitiveDirichletCharacter` and `rieszRemainder` of `Suggested.lean` have the shape of `Formalism.HC.HasWindows`, `Formalism.HC.PChar` and `Formalism.HC.An.gChi` of that repository (`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/`), with bodies rewritten.
- Policy: the family index has a section "When a roadmap is wrong" (lines 45–75) that says what reviews of library contributions carrying out these roadmaps may and may not block on. Whether a roadmap index sets that rule is for the project to decide.
- Not tested: the formal proof was not compiled or kernel-checked in this review; agreement was checked statement by statement at the locators in the previous reviews.
