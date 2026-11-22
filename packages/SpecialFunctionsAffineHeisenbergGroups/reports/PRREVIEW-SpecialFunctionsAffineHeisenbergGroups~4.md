# Review of SpecialFunctionsAffineHeisenbergGroups (pull request #2936 at b1d7382)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review (the orthogonality Check of 4.1 whose data did not satisfy `λ + n = λ' + n'`) is repaired, and the new data were recomputed here: the `α`-integral is `2π` and the `w`-integral is `0` at both index sets. The small correction on the matrix realization of 0.2 is also repaired, in the README and in the docstring. There is one small correction, to the pull request's description (a supplier's pull request number is out of date), and no format note. As before, none of the six cited books could be read legally; that and two licence notes are left for the human reviewers.

## C01 — The description names #2907 as the open pull request of ThetaKernelsForUnitaryDualPairs, and that pull request is closed

The description says "ThetaKernelsForUnitaryDualPairs (#2907) §3.45(i)–(ii)", and its `depends-on` block lists "#2907 ThetaKernelsForUnitaryDualPairs" as a supplier that merges first. #2907 was closed without merging; its folder is now carried by #2954 (the RiemannHypothesisForDirichletLFunctions family), at `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaKernelsForUnitaryDualPairs/`. A reader who follows the number finds a closed pull request and cannot tell that the supplier is still planned.

The citation in the README itself is sound: at the head of #2954 (`9549b32`) the supplier's README has "3.45 The Fock model and the infinitesimal Weil representation" (line 243) with (i) the Fock space and (ii) the unitary Bargmann transform from `L²` of a Lagrangian, as 3.4 and the supplier contract here describe them. The smallest change: write #2954 for #2907 in the prose and let the `depends-on` block be regenerated.

## Previous findings

- R01 — repaired: "`λ' = 3.3`, `(m, n, m', n') = (0, 1, 0, 0)` and `(1, 1, 1, 0)`, where `λ + n = λ' + n' = 3.3`, so the `α`-integral is `2π`, and the `w`-integral vanishes by the orthogonality of 3.2."
- C01 — repaired: "`toMatrix` is multiplicative; after unfolding, this is the oscillator group law of SpecialFunctionsGroupModels §0.2 transported to `Oscillator`"; the docstring of `Oscillator.toMatrix_mul` says the same.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.1 orthogonality Check at `λ = 2.3`, `λ' = 3.3`, `δ = 0.37` (changed) | `(m,n,m',n') = (0,1,0,0)`, `(1,1,1,0)`; old data `(1,0,0,0)`; control `(1,0,1,0)`, `(2,1,2,1)` at `λ' = λ` | `(0,1,0,0)`, `(1,1,1,0)`: `α`-integral `6.283185`, `w`-integral `0.000000`; `(1,0,0,0)`: both `0`; controls `39.478418 = 4π²` | Check true and now tests the case it names | none |
| 4.1 orthogonality modulo the centre (theorem the Check tests) | same data; angular argument: `E_{01} conj E_{00}` and `E_{11} conj E_{10}` carry one factor `e^{±iϑ}` | `λ + n − λ' − n' = 0` gives `2π`; angular integral `0`; product `0 = 4π² δ_{λλ'} δ_{mm'} δ_{nn'}` | holds | none |
| 0.2 matrix realization, `Oscillator.toMatrix_mul` (bullet and docstring changed) | `g = (0.4 − 0.9i, 0.7, 0.2)`, `h = (−1.1 + 0.3i, −1.9, 0.5)`; law of `Oscillator` against the supplier's `oscillatorMatrix_mul` | largest entry of `toMatrix(gh) − toMatrix g · toMatrix h`: `1.2·10⁻¹⁶`; both laws `w₁ + e^{−iα₁}w₂`, `α₁ + α₂`, `δ₁ + δ₂ − Im(e^{−iα₁} conj w₁ w₂)/4` | holds; the added sentence is true | none |

The rows for the statements the change does not touch stand as in the previous review, of `27aadbb`.

- Changed passages: 3 (the bullet of 0.2, the Check of 4.1, one docstring); all read and recomputed. No layer, heading, target or declaration is added or removed; no file outside the folder changes.
- Source locators checked against the text: 0; the changed lines add no locator, and the six books were not readable at the previous review (not fetched again).
- Library declarations opened at the pin: none new; the changed lines cite none.
- Cross-roadmap citations resolved: SpecialFunctionsGroupModels §0.2 at its open head ("Oscillator group law", `oscillatorMatrix_mul`, README line 261, Lean line 253: the law agrees with the multiplication of `Oscillator` here); ThetaKernelsForUnitaryDualPairs §3.45(i)–(ii) at the head of #2954 (README line 243), its former pull request being closed (C01).
- Dependency check: `depcheck: 157 roadmaps, 1815 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 47 `sorry` warnings, the output of the closing `#check`s, and nothing else; single `import Mathlib` plus four Tau Ceti modules, no `set_option`, no sorried definition. Only a docstring changed, so signatures and the one-tactic probe stand as at `27aadbb`.
- Pull request text read against the head: 47 declarations and 47 warnings agree; one out-of-date supplier number (C01); no other sentence contradicted.
- Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsMotionGroupsBessel, SpecialFunctionsSU11MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsRankOneSymmetricSpaces, SpecialFunctionsBessel, SpecialFunctionsParabolicCylinder, SpecialFunctionsHypergeometric (scopes as at the previous review; the change touches no ownership); nothing shared beyond what is cited: the oscillator matrices, their law and Haar measure, owner SpecialFunctionsGroupModels §0.2, cited.

Source independence: changed passages only: 3 passages compared with 0 sources, since no cited text could be read; the passages are a cross-roadmap pointer and the roadmap's own computed Check, with no source wording to share; largest share Vilenkin–Klimyk Vol. 1, roughly 35 to 45 of about 110 page locators; arrangement not compared again (no layer added, removed or reordered) and not tested against that book's table of contents.

Research link: the headline targets are the matrix-element and kernel theory of the `ax + b`, triangular, Heisenberg and oscillator groups of Vilenkin–Klimyk (1991, 1993), Miller (1968) and Wawrzyńczyk (1984), and the one-variable case of the Fock model used by ThetaKernelsForUnitaryDualPairs; they feed the Askey-scheme Charlier theory named under Downstream consumers. Rests on the README; no source was read.

## Not verifiable

- Vilenkin–Klimyk Vols. 1 and 2, Klimyk–Vilenkin (Encyclopaedia of Mathematical Sciences 59), Wawrzyńczyk, Dieudonné (CBMS 42) and Miller (1968): not readable legally at the previous review (paywalled, or no accepted host); not fetched again, the change adding no locator. The locators of the sampled sections 0.1–5.1, and the misprints the README attributes to these books, remain unchecked against the printed text; the stated formulas were checked by computation.

Automatic checks set aside as false positives: the rule against TeX-only syntax outside code spans, raised in the route of 2.6 for an exponent that stands inside a code span broken over two lines; the rule against choice in the body of a definition, raised for the `L²` multiplier representation, a copy of the supplier's definition that picks a representation unique when it exists; the rule against a section heading with no declaration under it, raised for the closing block of `#check`s that pins library names; a lead that ThetaKernelsForUnitaryDualPairs exists nowhere, which is a folder inside the RiemannHypothesisForDirichletLFunctions family's open pull request; a lead that the kernel statement of the oscillator matrix realization is declared nowhere, which this roadmap's own Lean file declares.

## Source issues

- none

## For the human reviewers

- **Not tested.** No cited book could be read legally, so wording and arrangement were not compared with any source; Vilenkin–Klimyk Vol. 1 has the largest share of page locators (roughly 35–45 of about 110), concentrated in Layers 1–2 of `README.md`.
- **Licence.** `README.md`, "Prior formalization", says the roadmap reuses names and conventions of the author's own repository `bjbraams/lean-SFVK` (stated Apache-2.0), files `SFVK/AffineHeisenberg/*.lean`; the declarations of `Suggested.lean` appear to be taken from it.
- **Licence.** Miller's 1968 book appears to be offered on its author's university page; the sources service did not accept that address, so it was not read.
