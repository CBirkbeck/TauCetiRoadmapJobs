# Review of EtaleDualityAndPerverseSheaves (pull request #3027 at 094da69)

**Verdict:** accepted

**Summary.** Accepted, with no findings, small corrections or format notes. In §7.6 the generic-flatness step of finitelyManyStabilizers now cites Tau Ceti `AlgebraicGeometry.Scheme.Hom.exists_dense_open_flat`. That name exists at the pin, and the stabilizer family `S → Z₁` meets its hypotheses. The consumer of §7.6 is now DeligneLusztigTheory Layer 1 instead of ReductiveGroups, which resolves the deferred two-way supply (D01). The second statement of the stabilizer lemma in FiniteReductiveGroups 3.4 is still deferred (D02). One point is left for the human reviewers: the Deligne–Lusztig paper has no legal open copy.

## Deferred findings

- D01 — resolved: ReductiveGroups at this head cites this roadmap nowhere. Deligne–Lusztig induction is now DeligneLusztigTheory Layer 1, which only consumes §7.6.
- D02 — stands

## Previous findings

- R01 — not repaired: deferred (D02)
- C01 — repaired: the description now says "DeligneLusztigTheory Layer 1 (Deligne–Lusztig induction) cites EtaleDualityAndPerverseSheaves §7.6 … neither it nor ReductiveGroups cites DeligneLusztigTheory, so supply runs one way."
- C02 — repaired: "by generic flatness (Tau Ceti `AlgebraicGeometry.Scheme.Hom.exists_dense_open_flat`) `S` is flat over a dense open subset of `Z₁`" (line 7538). The *Needs:* line (7552), the Layer 7 dependencies (7624) and a Tau Ceti contract row (7869) cite it, and §4.12 is no longer cited.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| finitelyManyStabilizers, generic-flatness step | `S → Z₁` against `exists_dense_open_flat` (Generic.lean:124) | It needs `Z₁` locally Noetherian and reduced, and `S → Z₁` quasi-compact and locally of finite type. `Z₁` is closed and reduced in a finite-type `W`; `S` is closed in `Spec F[M] × Z₁`, hence affine and of finite type | hypotheses met | none |
| same step, `μ_p` scaling `𝔸¹`, char `p` | `S = Spec F[ζ,x]/(ζ^p − 1, (ζ−1)x)` | fibre length 1 over `x ≠ 0` and `p` at `0`; flat locus `𝔾_m`, dense; `N = M`, `S_V = V` | holds | none |
| same step, `𝔾_m` on `𝔸²` with weights `(1,2)`, `Z₁ = {a = 0}` | `S = Spec F[t^±, b]/((t² − 1)b)` | free of rank 2 over `b ≠ 0`, fibre `𝔾_m` at `b = 0`; flat locus `{b ≠ 0}`; `N = 2ℤ`, `S_V = μ₂ × V` | holds | none |
| "that subset contains a dense affine open `V`" | `Z₁` irreducible; `Z₁` a closed point `Spec κ` | a dense `U` is nonempty, and a nonempty affine `V ⊂ U` is dense since `Z₁` is irreducible; flatness restricts to `V`; for a point, `U = V = Z₁`, `A = κ` | holds | none |
| Tau Ceti contract row (line 7869) | the declaration at the pin `2fd255d` | namespace `AlgebraicGeometry.Scheme.Hom` (Generic.lean lines 34, 46); hypotheses and conclusion as the row states them; module `TauCeti.AlgebraicGeometry.Morphisms.Flat.Generic` exists | holds | none |
| Downstream consumer sentence (line 7794) | DeligneLusztigTheory README at head | Layer 1 is "Deligne–Lusztig induction" (line 55); it cites §7.6 at lines 78, 134, 154, 183, 219, 297 and 317, and in its contract (line 1118) | holds | none |
| Supply direction (D01) | ReductiveGroups README at head; dependency check | no citation of this roadmap; it assigns Deligne–Lusztig induction to DeligneLusztigTheory (lines 55, 7145); depcheck finds 0 problems | resolved | none |
| Ownership of the stabilizer lemma and of (a) (D02) | FiniteReductiveGroups 3.4 at head, lines 1221–1262 | it still states (d), still proves (a) for every connected group, and still says §7.6 "cites the published proof of (b)" | stands | deferred |
| No stale citation left by the repair | README at head | "4.12" occurs only in BBD locators (lines 1514, 1544, 5714, 5717); "9F" does not occur | holds | none |

The rows for the untouched statements (§7.6's lefschetzIntegrality, lefschetzDevissage, lefschetzJordanFormula, lefschetzGroupActions (a)–(c), the Checks of finitelyManyStabilizers, and the headlines `uniformizerQuotient_selfInjective` and `form_similitude_det_alt`) stand as in the previous review, of `3b77a6a`.

- Source locators checked against the text: none needed. The changed passages carry no source locator, none of the 15 seeded targets lies in them, and the README flags no locator as unverified.
- Library declarations opened at the pins: 2. They are Tau Ceti `AlgebraicGeometry.Scheme.Hom.exists_dense_open_flat` (`TauCeti/AlgebraicGeometry/Morphisms/Flat/Generic.lean:124`) and `exists_dense_open_flat_of_isAffine` (line 105). The pins agree with `lake-manifest.json` (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`).
- Cross-roadmap citations resolved: 4. They are DeligneLusztigTheory Layer 1 (head), ReductiveGroups (head, which no longer cites this roadmap), FiniteReductiveGroups 3.4 (head), and SchemeAndStackFoundations §4.12 (main line 6921, no longer cited here; §1.24 is still cited).
- Record: from the merge base to this head no layer was removed or retitled (9 layers). `Suggested.lean` is unchanged since the merge base, and its elaborated signatures are as in the previous comparison.
- Dependency check: `depcheck: 129 roadmaps, 1437 edges, 0 problem(s)`.
- Automatic checks: the worker's run passed every check. Elaboration with `lake env lean` gives 7 `sorry` warnings and no errors. The pull request's diff outside its own folders is empty.
- Description: it was read in full against this head. It names DeligneLusztigTheory as the consumer of §7.6, gives the direction of supply, and states the order with the other open pull request that changes this folder. No supplier roadmap of this one is added or dropped since the merge base.
- Overlap check: the scope of LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations, ClassicalAdicEtaleCohomology, SheafTheoreticSmithTheory, GlobalShtukasAndFunctionFieldLanglands and DeligneWeightsAndPurity stands as read in the previous review. For the changed passages I read SchemeAndStackFoundations and DeligneLusztigTheory. Generic flatness is SchemeAndStackFoundations §4.12, realised at the pin by Tau Ceti, which this roadmap now cites. DeligneLusztigTheory consumes §7.6 and restates none of it. The stabilizer lemma's owner is §7.6, and its second statement is FiniteReductiveGroups 3.4 (d) (D02).

Source independence: changed passages only. 4 passages compared (the generic-flatness sentence of the route, the *Needs:* line, the Tau Ceti contract row, the consumer sentence) with 1 text: the docstring of the cited Tau Ceti declaration (Generic.lean lines 119–121, Apache 2.0). The longest shared run is 16 words, the statement of generic flatness itself, which the mathematics forces. The changed passages carry no source locator. No layer was added, removed or reordered, so the contents were not compared.

Research link: §7.6 states the Lefschetz-number calculus of Deligne–Lusztig 1976 §3 (Serre 1977; Dudas–Michel 2015 §13), on which Deligne–Lusztig induction in DeligneLusztigTheory Layer 1 rests. The headlines (the decomposition theorem; the Fujiwara–Varshavsky formula with local terms, from Varshavsky 2023 and Hansen–Kaletha–Weinstein 2022) serve geometric Satake and local Langlands. This rests on the README and Serre-1977.

## Not verifiable

- Deligne-Lusztig-1976, Proposition 3.3, Theorem 3.2, §3 and Proposition 6.4 (untouched text). The paper is only on JSTOR, and Lusztig's publication page lists it without a file. As in the previous review, these locators were checked through Serre-1977 and Illusie-Zheng-2013.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its own roadmap folders (so that an unreviewed change cannot merge unseen) flagged 123 files when I ran it by hand without the list of this pull request's own folders. All of them are in folders this pull request owns, and the diff outside those folders is empty.

## Source issues

- none

## For the human reviewers

- Deligne-Lusztig-1976 (Ann. of Math. 103) has no legal open copy: it is on JSTOR, and Lusztig's page has no file. Its locators in §7.6 (README lines 7431, 7481, 7510, 7606) were checked only through Serre-1977 and Illusie-Zheng-2013.
