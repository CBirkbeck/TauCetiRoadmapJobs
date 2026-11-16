# GATE-HalfIntegralWeightModularForms~1: answers to human review

One review comment, one point. It asks for no change, and none is made: `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md` and `Suggested.lean` stay at `d7e7ece`, and no commit was made.

## H01 (mycaule) — answered

At LeanPool commit `f8b9b72`, `LeanPool/LeanModularForms` has no form of weight `k + 1/2`, no `Γ₀(4)`, no theta multiplier, no `η` law beyond `S`, no Dedekind sums and no eta quotients; its nearest results are integral weight or already at the pins: `Modularforms/Eta.lean` proves only the `S`-law `η(−1/z) = (√i)⁻¹ √z η(z)`, which is Mathlib's `ModularForm.eta_comp_eq_csqrt_I_inv` (`Mathlib/NumberTheory/ModularForms/Discriminant.lean:136`), already consumed under *Exact supplier contracts → From Mathlib*, and `Modularforms/JacobiTheta.lean` puts `Θ₂⁴`, `Θ₃⁴`, `Θ₄⁴` in weight 2 on `Γ(2)` (so the folder is not purely level-one, but with `θ(z) = Θ₃(2z)` this gives only the integral-weight `θ⁴ ∈ M_2(Γ₀(4))`, which no section here states). Its other contents (Eisenstein series, `E₂`, `Δ`, the level-one valence and dimension formulas, Hecke rings of `GL₂` and `GLₙ`) are integral weight, which this roadmap takes by name from the modular-forms roadmap (Layers 0, 1, 2, 10) and from Tau Ceti (`LevelOne.GradedRing`, `HeckeRing.GL2.Newform`); no section owned here develops that mathematics independently, the one case where the repository README's porting rule asks for a citation, so the README is unchanged.

## Supporting evidence for H01

Evidence read at `f8b9b72`:
- the directory listing of `LeanPool/LeanModularForms`: `ContourIntegral`, `ForMathlib`, `GeneralizedResidueTheory`, `HeckeRIngs`, `Modularforms`, `SpherePacking`, `ValenceFormula`;
- the full file list of `Modularforms/` (47 files) and of `ForMathlib/`. `ForMathlib/CongruenceSubgrps.lean` defines only the cusp width and its lemmas, and `Γ₀(4)` does not appear in it;
- the full file lists of `HeckeRIngs/` (abstract, `GL2`, `GLn`) and of `SpherePacking/` (Viazovska's magic function);
- the declarations of `Modularforms/Eta.lean`: four lemmas, ending in `eta_equality`, the `S`-law;
- the declarations of `Modularforms/JacobiTheta.lean`: `Θ₂`, `Θ₃`, `Θ₄`; `H₂MF`, `H₃MF`, `H₄MF` in weight 2 on `Γ(2)`; `jacobi_identity`; `Delta_eq_H₂_H₃_H₄`. None of its statements has half-integral weight.

Computation for the `θ⁴` remark: `Θ₃(τ) = jacobiTheta₂ 0 τ = jacobiTheta τ`, and this roadmap's `θ(z) = jacobiTheta (2z)`. For `γ = [[a, b], [c, d]]`, `2·(γz) = [[a, 2b], [c/2, d]]·(2z)`. That matrix lies in `Γ(2)` exactly when `4 ∣ c` (then `a` and `d` are odd), and `(c/2 · 2z + d)² = (cz + d)²`. So `z ↦ H₃(2z) = θ(z)⁴` is a weight-2 form on `Γ₀(4)` with trivial character. The nearest statements in this roadmap are the checks `θ² ∈ M_1(4, χ₋₄)` in 0.3–0.4. They follow from the half-integral carrier, and LeanPool has no counterpart.

## Build

`lake build TauCetiRoadmap.HalfIntegralWeightModularForms.Suggested`: `Build completed successfully (18454 jobs).` The only warnings are `declaration uses 'sorry'` on the stated targets.

## Gate

    gate HalfIntegralWeightModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
      depcheck: NOT IN ORDER: HalfIntegralWeightModularForms (insert it after its last supplier)

The only failing count is `depcheck=1`, and it comes from the `NOT IN ORDER` line. The roadmap is not yet in the merge order (it is still at the design stage), so this is not a defect of the text.

## Dependency direction

    NOT IN ORDER: HalfIntegralWeightModularForms (insert it after its last supplier)
    depcheck: 248 roadmaps, 2377 edges, 1 problem(s)

There is no UPWARD line and no CYCLE line.

## Other obligations of this round

- Adversarial pass: no statement was added or changed, so there is nothing to tabulate.
- Signatures: `Suggested.lean` is unchanged, so no new `#check` file was elaborated. The worker's `signatures.md` was produced at this head and reports none of its 36 declarations losing a section binder.
- Ownership against open pull requests: no construction was added, so there is nothing new to check.
- Sources: none fetched and no `needs-references.toml` entry added. The LeanPool repository was read on GitHub as an existing formalisation, not as a cited source.
- Untrusted text: the review comment contains no instruction-like text.
