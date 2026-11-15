# Review of FuchsianOrbifoldsPartII (pull request #1696 at 3d95b6c)

**Verdict:** needs changes

Incremental re-review of the 8 lines changed since `a68a656`, plus the pull request's title and description read against this head. The folder's repair is correct; the one finding is in the description.

## R01 (P3) — The description identifies the core of every admissible list with F_A

**Location:** pull request description, `<!-- roadmap-summary -->` block, first paragraph: "For each admissible minus-digit list the cycle group Γ(n) receives a Ford polygon, a free-product presentation ℤ∗C₂∗⋯∗C₂ and infinite index; its core is then identified with the supplied quadratic-class surface F_A."

**Claim:** The head identifies Core(Γ(n)) with F_A only when n is the primitive reduced minus period of a narrow class A of a fundamental discriminant, not for each admissible list.

**Witness:** `TauCetiRoadmap/FuchsianOrbifoldsPartII/README.md:425` restricts §2.2 to "the primitive period of A∈Cl⁺(K)". n=[6] is admissible; T⁶S=[[6,−1],[1,0]] fixes the roots of z²−6z+1, of discriminant 32=4·8, not fundamental: no F_A. [4,4] is admissible and not primitive.

**Repair:** Replace the sentence's last clause by: "when n is the primitive reduced minus period of a narrow class A, its core is identified with the supplied quadratic-class surface F_A." Tested on [6] and [4,4]: neither is such a period, so nothing is claimed for them; for [4] (D=12, principal class) the clause gives §2.2.

## Previous findings

- R01 — repaired: `README.md:79`, `:81`, `:83`, `:85` each open "What AutomorphicSpectralTheory must provide (gap:<slug>):" with the slugs `primitive-minus-cycle-invariant`, `primitive-pell-word`, `narrow-dictionary-compatibility`, `oriented-quadratic-cycle-reversal`; mathematical text unchanged.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Gap slugs, README against the plan (`README.md:79–85`) | the four `gap:` identifiers | README set = plan set, 4 = 4, no duplicate, supplier and §4.17a equal in both; line 87's "first three … the last" still matches the order | Repair correct | None |
| `gap:primitive-minus-cycle-invariant` (cited by §§1.1, 1.4, 3.4, 4.3) | D=12, classes I and J | 2+√3 ↦ [4]; (3+√3)/2 ↦ [3,2] (3−w=(3−√3)/2, inverse (3+√3)/3, ceiling 2, return); lengths 1≠2, not rotations; both primitive | Two classes, two rotation classes | None |
| `gap:primitive-pell-word` (cited by §§1.5, 4.6) | [3,2]; [4,2] at D=8 | T³S·T²S=[[5,−3],[2,−1]], det 1, trace 4=ε+ε⁻¹ for ε=2+√3; fixes (3±√3)/2; derivative at w is (2+√3)⁻²<1. T⁴S·T²S=[[7,−4],[2,−1]], trace 6, ε₈=3+2√2=(1+√2)² | Primitive, attracting at w, norm +1 unit | None |
| `gap:narrow-dictionary-compatibility` (cited by §§4.3, 4.4, 4.6) | D=12 forms [1,−4,1], [2,−6,3] | [2,−6,3](1,1)=−1, while x²−3y²=−1 is impossible modulo 3; so the second form carries the label J, the first I | Sign clause separates the two labels | None |
| `gap:oriented-quadratic-cycle-reversal` (cited by §4.4) | D=12, A=I, JA⁻¹=J; D=5, A=JA⁻¹ | Both boundary lengths 2log(2+√3); densities 4+5=9=3(1+2). At D=5: 2ν_A=6ℓ_Aμ_mod, mass 2π=6·(π/3) | Reversal consistent with §4.4 | None |
| R01: description against §2.2 | [6], [4,4], [4] | [6]: discriminant 36−4=32, non-fundamental; the D=8 class has period [4,2]. [4,4]: word is the square of the [4] word, widths 8≠4 | Sentence false as written | Reword |

The rows of the previous review, of `a68a656`, stand for every untouched statement.

- Gap rules: each of the four contracts has a named supplier and section, the same slug in the plan and in the README, and one statement with its arithmetic hypotheses. None is already provided: AnalyticNumberTheoryPartI §2.1c on main (`TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1264–1284`) states one cycle per class, the signature, area and length, but not the rotation-complete invariant, the primitivity and attracting point of the word, the native `NumberField.NarrowClassGroup` comparison, or the reversal for JA⁻¹.
- Citations of the changed passages resolved: AutomorphicSpectralTheory §4.17a exists at its open head; IntegralLattices B2 and B3 on main (`README.md:1082`, `:1165`); GlobalNumberFields Layer 11 (`Completed/GlobalNumberFields/README.md:571`); `NumberField.NarrowClassGroup` at the pin (`TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean`). The lead of the citation tool is a false positive: `UpperHalfPlane.volume_setOf_re_mem_Ico_and_lt_im` is at `TauCeti/Analysis/Complex/UpperHalfPlane/Measure.lean:91`.
- Remark on untouched text, no change asked: `README.md:13` and `:77` say AutomorphicSpectralTheory §4.17a, §§1.14–1.15, 2.17–2.18, 4.20 own the arithmetic surface and the completed Eisenstein expansion; at that roadmap's open head these sections are one-paragraph deferrals to AnalyticNumberTheoryPartI §§2.1b–2.1c on main. The citations still resolve through them.
- Description, other sentences: the 3-file folder, 3 real-bodied definitions and 5 theorems, "the Lean imports none of them" (one `TauCeti.*` import), the ν_A+ν_{JA⁻¹} identity (§4.4), the coefficient-free statements about §§3.2–3.4 and §5.3, and the validation counts all agree with the head. The title is correct. Generated blocks not read.
- Gate: the worker's gate at this head is `OK` on every counter including the build; rerun here, every text counter 0, `OK`. Outside-folder diff: 0 paths. `git status` clean after the run.
- Elaboration of `TauCetiRoadmap/FuchsianOrbifoldsPartII/Suggested.lean` by `lake env lean`: exit 0, five `declaration uses sorry` warnings and nothing else. The file is unchanged since `a68a656`; the eight elaborated signatures of the worker's listing agree with the README, no binder lost. The one-tactic probes of the previous review stand.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The diff adds no supplier.
- No declaration of `Suggested.lean` shares a fully qualified name with another roadmap (`cycleGroup`, `cyclePolygon`, `AdmissibleCycle` occur in this folder only, over main and the open heads).

Overlap check: read ArithmeticFuchsianGroups, GeometricFreyMazur, TeichmullerGeometry, KleinianGroups, MaassForms, FuchsianOrbifolds, ConformalMappingPartII, ComplexCurveModuli; nothing shared. The surface F_A, Γ_A and the reduced cycles are owned by AnalyticNumberTheoryPartI §2.1c on main and consumed here; no open pull request changes this roadmap, drops an id it cites, or is cited at a revision's numbering.

Source independence: changed passages only; 4 passages compared with 1 source (DIT16), none shared (the added words are the project's contract form and occur in no source); largest share DIT16, as in the review of `a68a656`; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- The seeded sample falls in no changed passage: no source locator was reopened in this round; the locator checks of the review of `a68a656` stand.
- The four declared contracts are obligations on AutomorphicSpectralTheory §4.17a, absent from it today; this review is conditional on them, as the previous one was.
- The model names and round counts in the description's "AI assistance" line: the board holds three package reviews and two red-team rounds; the model names were not checked.

## Source issues

- none

## For the human reviewers

- none
