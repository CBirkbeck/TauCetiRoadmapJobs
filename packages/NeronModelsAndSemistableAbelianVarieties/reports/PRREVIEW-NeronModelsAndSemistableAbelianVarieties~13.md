# Review of NeronModelsAndSemistableAbelianVarieties (pull request #852 at 861f8ce)

**Verdict:** accepted

## Previous findings

- R01 — repaired: The description now says “over every discrete valuation ring and connected Dedekind scheme” and identifies semistable reduction and Grothendieck’s criterion as README targets whose geometric carriers are absent from the pins; Suggested.lean:13–37 agrees.
- R02 — repaired: The description now says “Downstream consumers are listed in the README’s ‘Downstream consumers’ section”; that section starts at README.md:4565 and includes FaltingsFinitenessAndIsogenyTheorems at line 4590.

## Verified sound

| Statement | Instances tried | Left-hand value | Right-hand value | Result / change |
|---|---|---|---|---|
| §6.5 EquationGoodComparison, named in the corrected description | Minimal equation `y²+y=x³` over `ℤ₂`, generic field `ℚ₂` | `Δ=−27`, `ord₂(Δ)=0`; good reduction is true | Special cubic smooth: affine derivative in `y` is 1; at infinity derivative in `Z` is 1. Abelian-model existence is true | Both equivalences true, including residue characteristic 2; no change |

Untouched statement rows stand as in the previous review of `861f8ce`.

- Delta: 0 changed folder lines and 0 outside-folder changes; base-to-head adds 3 files, 4,880 lines and 5 declarations, removing none.
- Previous findings: 2 of 2 repaired; title, summary block and description checked against the head, including 4 headline theorems and 1 definition.
- Seeded sample: 0 of 15 targets lies in changed roadmap text; 0 source locators reopened and 0 pinned library declarations newly audited; untouched padding checks stand.
- Supplier claim: NoncommutativeAndEquivariantIwasawa §F.6 re-resolved at its open head; its generic period realization supplies README §5.3. All 4 roadmaps described as on main are present there.
- Signatures: all 5 declarations checked with `#check @name`; DVR, fraction-field, normality, dimension, isogeny and minimal-equation hypotheses agree with the README; 0 lost binders.
- Gate: every scanner passes; targeted module build exits 0, with 4 admitted-theorem warnings and the replayed Mathlib module-system advisory.
- Direct elaboration and signature probe: both exit 0 with only 4 `sorry` warnings each; worktree remains clean.

Dependency check output:

```text
depcheck: 245 roadmaps, 2222 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Overlap check: read FaltingsFinitenessAndIsogenyTheorems (height and isogeny applications), AbelianSchemesAndArithmeticModuli (abelian schemes and realizations), ArithmeticGaloisRepresentations (representation theory and conductors), RelativeJacobiansAndIntegralCurveModels (general integral Picard comparisons), FiniteFlatGroupsAndIntegralPadicHodgeTheory (finite-flat classifications), StableReduction (curve models), EtaleCohomologyFoundations (étale foundations), and ModularCurves (relative elliptic curves); those objects retain their named owners, with Néron models and regular semistable Picard comparisons here. The overlap inventory reports no conflicting edit or dropped cited id.

Source independence: changed passages only; 0 roadmap passages compared with 0 sources because the folder diff is empty. No layer was added, removed or reordered; the arrangement and locator-share audit was not repeated.

## Not verifiable

- SGA 7 I, Exposé IX, §§1.1–1.2, pp. 321–323: `sga7-ix` remains uncertified; no text requested again.
- Bosch–Lütkebohmert–Raynaud §1.2 Lemma 5 and §1.4 Propositions 1–2 and Theorem 3: paywalled locators carried from the previous review.
- The four admitted Lean theorems were elaborated, not proved.

## Source issues

- none

## For the human reviewers

- none
