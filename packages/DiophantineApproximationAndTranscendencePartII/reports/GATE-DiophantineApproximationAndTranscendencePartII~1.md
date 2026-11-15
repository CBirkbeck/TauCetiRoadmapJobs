# GATE-DiophantineApproximationAndTranscendencePartII~1: answers to human review

One comment, one point. Nothing in `TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/`
changed, so there is no commit; the branch head stays at `f36c2a5`.

## H01 (mycaule) — disputed

The 16 Lean files under [`Mordell/Roth/`](https://github.com/AxiomMath/Mordell/tree/82a30cb7857f6e3cfdb1be91f5533c0ccb57d493/Mordell/Roth) prove Bombieri's Roth's lemma (Bombieri, *The Mordell conjecture revisited*, §§8–9). That means the weighted index of a multivariable polynomial at an algebraic point, generalized Wronskians with their degree and height bounds, splitting off the last variable, the one-variable case and an elementary sum inequality. None of these objects appears in this roadmap: its nonvanishing step is that the lowest homogeneous jet at the origin of a multivariable *power series* is integral (§§1.1, 1.3), with no index at an algebraic point, no Wronskian and no Roth-type zero estimate. The overlap is real, but it is with the base roadmap DiophantineApproximationAndTranscendence (Scope and ownership; Tau Ceti supplier contract; §§1.2, 1.4, 1.5). That roadmap consumes the same results, which the pinned Tau Ceti already proves.

Evidence, file by file (the Tau Ceti side checked at the pin; the AxiomMath side read at commit `82a30cb`):

| `Mordell/Roth/` (16 files) | Result | At the pinned Tau Ceti | Where the roadmaps use it |
|---|---|---|---|
| `Index/` (`Basic`, `Add`, `Mul`, `HasseDeriv`, `Range`) | weighted index `inf Σ Iμ/rμ` over nonzero divided derivatives at a point, for `MvPolynomial` | `MvPolynomial.weightedIndex`, `TauCeti/RingTheory/MvPolynomial/WeightedIndex.lean:83`, and its index calculus | base roadmap §1.2 |
| `Wronskian/` (`Basic`, `Degree`, `NeZero`, `OneVariable`, `Product`, `Roth`) | generalized Wronskian, its nonvanishing criterion, degree bound, product factorisation | `MvPolynomial.genWronskian` (`TauCeti/RingTheory/MvPolynomial/HasseDeriv/Wronskian.lean:86`), `MvPolynomial.linearIndependent_iff_exists_genWronskian_ne_zero` (same file, line 234), `MvPolynomial.det_hasseDeriv_sum_mul_toMvPolynomial`, `MvPolynomial.degreeOf_genWronskian_le` | base roadmap §1.4 |
| `WronskianHeight.lean` | height bound for the Wronskian factors | `MvPolynomial.logHeight_det_hasseDeriv_le`, `TauCeti/NumberTheory/Height/MvPolynomial.lean:444` | base roadmap §1.4 |
| `SplitLastVariable.lean` | `P = Σ φⱼ ψⱼ(X_last)` with both families independent | `MvPolynomial.exists_sum_mul_linearIndependent`, `TauCeti/RingTheory/MvPolynomial/SeparateVariable.lean:95` | base roadmap §1.4 |
| `ElementaryInequality.lean` | `(s+1)·min(t/2,t²/2) ≤ Σ_(ν≤s) max(t−ν/r,0)` | `TauCeti.mul_min_le_sum_max_sub_div`, `TauCeti/NumberTheory/DiophantineApproximation/Roth/SumEstimate.lean:107` | base roadmap §1.4 |
| `OneVariable.lean`, `Main.lean` | Roth's lemma (one variable; general) | `TauCeti.weightedIndex_le_of_logHeight_le`, `TauCeti/NumberTheory/DiophantineApproximation/Roth/IndexEstimate.lean:338` | base roadmap §1.5 |

On this roadmap's side, searching `README.md` and `Suggested.lean` for `Roth`, `Wronsk`, `Hasse`, `index` and `Bombieri` finds only "index type" and "indexed by". The one ingredient both proof methods share is Siegel's lemma. Here it comes from Mathlib's `Int.Matrix.exists_ne_zero_int_vec_norm_le` (§1.2), and `Mordell/Roth/` contains no Siegel's lemma.

The repository README ("Porting existing work") asks a roadmap that develops the same mathematics independently to cite the existing work. This roadmap neither develops nor consumes any of these results, so a citation here would point readers at material outside its scope. A provenance note, if wanted, belongs to the base roadmap DiophantineApproximationAndTranscendence or to the Tau Ceti `Roth/` modules, and this pull request edits neither.

## Adversarial pass, signatures, ownership, sources

- No statement, definition, Check or convention was added or changed, so the adversarial table has no rows this round.
- `Suggested.lean` is unchanged. I compared the elaborated types of its 6 declarations with README §0.2 (`IntegralSeries`, `Uniformizes`, `positiveLogMean`, `rationalFunctionField`) and §§2.1–2.2 (`mean_rank_bound`, `arithmetic_algebraicity`). Every hypothesis in the README statements (nonconstant p, regularity through `pSeries`, tangent χ, integral pullbacks, closed-disc analyticity of φ, g and each uᵢ, `φ 0 = 0`, `1 < ‖deriv φ 0‖`, ℚ(p)-independence) is an explicit binder, and none was lost.
- Ownership: no new construction, so no new ownership question. The objects H01 names have one owner: the pinned Tau Ceti proves them and the base roadmap on main consumes them. This roadmap claims none of them.
- Sources: no new citation and no `needs-references.toml` entry. The AxiomMath repository is a formalization the reply refers to, not a source for any statement here.

## Build

`lake build TauCetiRoadmap.DiophantineApproximationAndTranscendencePartII.Suggested`: `Build completed successfully (18239 jobs).` The only warnings are `declaration uses 'sorry'` at `Suggested.lean:54:8` (`mean_rank_bound`) and `Suggested.lean:74:8` (`arithmetic_algebraicity`), which are the two headline theorems.

## Gate

    gate DiophantineApproximationAndTranscendencePartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency direction (`gate --depcheck … --movable --pr 1693`):

    depcheck: 239 roadmaps, 2255 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.
