# Review of RelativeJacobiansAndIntegralCurveModels (pull request #1232 at 2af2fd0)

**Verdict:** accepted

Incremental re-review of 5 changed lines since f6d3602 (the conclusion of `globalFunctions_constants` in `Suggested.lean`), plus the pull request's title and description. No finding.

## Previous findings

- R01 — repaired: `Suggested.lean:73–74` now reads "`∀ a : X.functionField, a ∈ g.hom.range ↔ ((Scheme.ΓSpecIso (.of R)).inv ≫ f.appTop ≫ g).hom.IsIntegralElem a`"; no `letI` remains and `statement-hygiene=0`.
- R02 — repaired: the description's summary block no longer says the roadmap follows a source; "Approach and generality" now describes the rigidified presentation, imperfect residue fields, genus zero and the Greenberg argument.
- R03 — repaired: the clause "with author-side red-team passes to follow" is gone; the paragraph ends "The roadmap is ported from the accepted explorer package."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| `globalFunctions_constants` (changed), head against the statement at `f6d3602` | Scratch `example`: old `letI`-algebra `IsIntegral R a` ↔ head `IsIntegralElem a`, arbitrary `R`, `X`, `f`, `a` | Closed by `Iff.rfl`: `IsIntegral R a` unfolds to `(algebraMap R A).IsIntegralElem a` (Mathlib `IsIntegral/Defs.lean:54`). | Same statement, definitionally; only the instance moved out of the signature. |
| `globalFunctions_constants`, truth | `X = P¹_ℤ`: `a = t`, `1/2`, `3`; `X = Spec R`; `R = k` a field, `X = Spec L`, `L/k` finite | `P¹_ℤ`: range `ℤ`; `t`, `1/2` neither in range nor integral, `3` both. `Spec R`: range `R` = integral elements of `K`. Field: range `L` = integral elements, all of `L`. | Both sides agree in each case, both directions. |
| `globalFunctions_constants`, normality hypothesis | `X = Spec ℤ[√−3]` over `ℤ` (finite, flat, integral, not normal), `a = (1+√−3)/2` | `a` is a root of `T² − T + 1`, so integral; range is `ℤ[√−3]`, which does not contain `a`. | Fails without `hnormal`; the hypothesis is present. |
| `globalFunctions_constants` against README §0.4 (line 164) | The sentence "identifying the range of the global germ map in the function field with the elements integral over `R`" | Lean: range of `g` on the left; integrality along `R → Γ(Spec R) → Γ(X) → K(X)` on the right. | Agree; the README needed no change. |
| `globalFunctions_constants`, padding probe | `simp`, `rfl`, `exact Iff.rfl` after `intro g a` | 1 error each (unsolved goal; not definitionally equal; type mismatch). | Not padding. |

All other rows stand as in the previous review, of `f6d3602`.

- Gate, rerun on this head: every counter 0, `OK`; the worker's run has `build=0`.
- Elaboration of `Suggested.lean` with `lake env lean`: seven `sorry` warnings, nothing else. Elaborated type of the changed theorem compared with the README: no binder lost (`R`, `IsDedekindDomain R`, `IsIntegral X`, `IsProper f`, `Flat f`, `hnormal` all present).
- Dependency check: `depcheck: 245 roadmaps, 2217 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- The diff changes one statement of `Suggested.lean`: no README line, heading, `*Needs:*` line, supplier or locator. Files changed outside the folder against the base: none (the paths listed since `f6d3602` come from the merge of main; `git diff origin/main...HEAD` outside the folder is empty).
- Library declarations opened at the pin: 2 (`RingHom.IsIntegralElem`, `IsIntegral`; `Mathlib/RingTheory/IntegralClosure/IsIntegral/Defs.lean:39`, `:54`). No roadmap, open or on main, declares `globalFunctions_constants`, `reductionHom` or `twoChartDifferential`.
- Description checked sentence by sentence against the head: 3 paragraphs of the summary block and 4 of prose, none contradicted. It adds the roadmap (README, `Suggested.lean`, `metadata.toml`; 0 headings and 0 declarations removed); "seven `sorry`s" matches the seven theorems; the torsion, Greenberg (README line 88, §4.4), genus-zero (§2.2), imperfect-residue and `J(L) ≅ Cl⁰(C_L)` (§2.3) sentences match; the six consumers named match "Downstream consumers".
- Overlap check: read JacobianChallengePartII, NeronModelsAndSemistableAbelianVarieties, AlgebraicModuliForArithmeticGeometryPartII, StableReductionPartII, NeronModelsAndSemistableAbelianVarietiesPartII, StableReduction, JacobianChallenge, SchemeAndStackFoundations (scope sections; the third list is empty); nothing shared. Finite flat rigidificators are owned here (§§1.3–1.5) and cited from here by FunctionFieldArithmetic.
- Source independence: changed passages only; 0 passages of prose changed (the diff is one Lean conclusion, a formula with no source wording), 0 sources compared; largest share BLR, 40 locators against 13 Stacks tags; contents not compared again (the diff adds, removes and reorders no layer).

## Not verifiable

- BLR (*Néron Models*, Springer 1990): resolves only to a paywalled publisher page (`uncertified`); none of its locators was reopened, and none lies in the changed passage.
- The seeded targets lie outside the changed passage and were not reopened; §0.4, which the change touches, is not among them.

## Source issues

- none

## For the human reviewers

- **Not tested.** BLR (*Néron Models*, Springer 1990) carries the largest share of the README's source locators (40, against 13 Stacks tags) and is not legally readable here. The paragraph at README line 592 (§3.1) was not compared with BLR pp. 265–267.
