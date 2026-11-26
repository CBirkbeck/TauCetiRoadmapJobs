# Review of HochschildHomologyAndHKR (pull request #2447 at 07afb86)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one changed sentence, in the scope section, now says that quasi-free algebras are characterised over a field by the vanishing of `Ext²_{Aᵉ}(A,M)` for every bimodule `M`; that is correct and agrees with §§3.6 and 4.4, which the sentence cites. The description now names RefinedTraceMethods §1.10, which settles the previous small correction. One carried format note, not blocking; one point of scope is left for the human reviewers, as before.

## N01 — Three lines of `Suggested.lean` exceed 100 characters

Lines 19, 101 (138 characters, in the docstring of `hochschildBimoduleCocycles`) and 264, unchanged since the previous review.

## Questions for the author

- §9.1 and the docstring of `cohomological_hkr` read "Loday98 §3.4, Theorem 3.4.4, and Weibel94 §9.4, Theorem 9.4.7, over a field". Is Loday's Theorem 3.4.4 not stated for a smooth algebra over a commutative ring, so that "over a field" should attach to Weibel's theorem only? Neither text could be read (both are cited by locator only). Carried from the previous review; the passage is unchanged.

## Previous findings

The previous review, of d18fb7a, listed no finding (no R01). Its other remarks:

- C01 (the description omitted RefinedTraceMethods §1.10) — repaired: the description now reads "RefinedTraceMethods §§1.1, 1.8 and 1.9, and, in one Check of §6.3, §1.10 for the derived value `HH₂(𝔽_p/ℤ) = 𝔽_p`; no statement of a layer uses §1.10".
- N01 — not repaired: written again above as N01.
- The question on Loday98 Theorem 3.4.4 is carried above; the passage is unchanged.

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| Scope section (README lines 2075–2080): quasi-free over a field iff `Ext²_{Aᵉ}(A,M) = 0` for every bimodule `M` | `A = k`; `A = k[x]`; `A = k[x,y]`; `M = A` alone | `k`: `Aᵉ = k`, `Ext² = 0`, quasi-free. `k[x]`: `A` has a length-one free `k[x,y]`-resolution, `Ext² = 0`, free algebra, quasi-free. `k[x,y]`: `Ext²(A,A) = ⋀²Der = A ≠ 0`, not quasi-free (Ginz05 line 4912) | true in both directions; "for every `M`" is needed, and the sentence has it |
| The same sentence against §3.6 and §4.4, which it cites | `k` a field, any `A`, `M` | §3.6: `k`-split square-zero extensions ↔ `HH²(A,M)`; §4.4: `HH² = Ext²_{Aᵉ}` for `k`-projective `A`; over a field both hypotheses hold, so all extensions split iff `Ext²(A,M) = 0` for all `M` | consistent |
| Description against head | 9 layers; 18 Lean declarations; suppliers; §1.10 | layers 1–9 as listed; suppliers as in the README's contracts; RefinedTraceMethods §§1.1, 1.8, 1.9 and, in one Check, 1.10 (README line 1326) | agrees; no sentence contradicted, and the change (a scope sentence) needs no mention |

The rows for the untouched statements stand as in the previous review, of d18fb7a.

- Changed passage: one sentence of the scope section; no statement of a layer, no Lean declaration, no supplier citation and no source locator changed. The seeded sample falls in no changed passage.
- Source text opened for the changed sentence: Ginz05 lines 4822 (Proposition 19.1.5), 4912 and 5012 (Theorem 19.4.2), which give the lifting definition, the projectivity of the bimodule of noncommutative differentials, and that polynomial rings in more than one variable are excluded; the `Ext²` form follows from the first two.
- Cross-roadmap citations in the changed passage: none (the sentence names §§3.6 and 4.4 of this roadmap, both present with the stated content).
- Files changed outside the folder: none.
- Dependency check: `depcheck: 109 roadmaps, 1257 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Automatic checks: all passed. Elaboration: `lake env lean` on `TauCetiRoadmap/HochschildHomologyAndHKR/Suggested.lean` gives 10 `sorry` warnings and nothing else; the file is unchanged, so the signatures and the one-tactic probe stand.
- Declared gaps: none.

Overlap check: read DGAInfinity, NoncommutativeGeometry, DerivedModuleAlgebra; nothing changed, and the shared objects and owners stand as in the previous review (DGAInfinity Layer 8, DerivedModuleAlgebra §§0.5 and 0.K.1, NoncommutativeGeometry N1, KTheoryFiniteLocalFields §4.0, RefinedTraceMethods §§1.8–1.9, each cited). The changed sentence names no roadmap as owner of quasi-free algebras and none is claimed here.

Source independence: changed passages only: 1 passage compared with 1 source (Ginz05 §19, lines 4822 and 5012), none shared; largest share Ginz05, 47 of 133 locators; the contents comparison with Ginz05 stands as independent (no layer added, removed or reordered).

Research link: the headline targets are the theorem of Hochschild, Kostant and Rosenberg (1962, Theorems 5.1–5.2) and its integral form used by Antieau and Vezzosi (2020, Proposition 1.2) for HKR in characteristic p; Gerstenhaber (1963) for the cup product. Rests on the README's sources HKR62 and AV20, read in an earlier review.

## Not verifiable

- Loday98 §3.4, Theorem 3.4.4, and Weibel94 §9.4, Theorem 9.4.7 (§9.1): cited by locator only, no legal text available.
- The other locators into Loday98, Weibel94, CE56, Ger63 and Mat86 remain cited by locator only, as in the previous review.

## Source issues

- none

## For the human reviewers

- Scope: KTheoryFiniteLocalFields §4.0 on main has the target `HH_n(A/k) ≅ Ω^n_{A/k}` for smooth `A`, map unnamed, on derived chains; §9.1 here proves it for the antisymmetrisation on the classical complex, as a stated variant.
