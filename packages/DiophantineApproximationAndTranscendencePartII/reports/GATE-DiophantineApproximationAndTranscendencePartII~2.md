# GATE-DiophantineApproximationAndTranscendencePartII~2: answers to human review

There is one comment, and it names three LeanPool projects. Each project claims a different theorem, so each is answered separately (H01–H03). Nothing in `TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/` changed, so there is no commit and the branch head stays at `f36c2a5`. The LeanPool side was read at the linked commit `f8b9b72`. The numbers in parentheses in the comment (10, 9, 213) are the file counts of the three folders.

## H01 (mycaule) — disputed

This roadmap states no transcendence result for π. π occurs only as the normalisation `z = exp(2πit)` and the factors `2π` and `(2πi)^d` (README lines 21, 43, 437, 495), and none of the six declarations of `Suggested.lean` mentions it. Transcendence of π belongs to the base roadmap on main, DiophantineApproximationAndTranscendence §3.2: its README line 2151 and `Suggested.lean` line 583 state `Transcendence.transcendental_pi : Transcendental ℚ Real.pi`, proved through Hermite–Lindemann.

LeanPool's `IsTranscendentalPi/Main.lean` proves `IsTranscendentalPi : Transcendental ℚ (Real.pi : ℂ)` and the real version `IsTranscendentalPiReal` by Niven's argument. It overlaps that §3.2 target, not anything here. Neither pin proves it: Mathlib has only `Mathlib/NumberTheory/Transcendental/Lindemann/AnalyticalPart.lean`, and `TauCeti/NumberTheory/Transcendental/Lindemann/Theorem.lean` has `linearIndependent_exp` and `algebraicIndependent_exp` but no `transcendental_pi`. Under "Porting existing work", the prior-art citation belongs in a revision of DiophantineApproximationAndTranscendence, and this pull request does not edit that roadmap.

## H02 (mycaule) — disputed

ζ(3) does not occur anywhere in this roadmap's README or `Suggested.lean`, and no target here states, proves or uses an irrationality result for a zeta value. LeanPool's `Zeta3Irrational/Basic.lean` proves `zeta3_irrational : ¬ ∃ r : ℚ, r = riemannZeta 3`. Its proof uses Beukers' Legendre-polynomial integrals (`LegendrePoly.lean`, `Integral.lean`, `LinearForm.lean`), which share no object with the arithmetic rank bound (`mean_rank_bound`, §2.1) or the holonomic spans of Layer 4.

I searched every roadmap on main and the 458 open roadmap heads by object: Apéry, "irrationality of ζ", ζ(3) and ζ(5) irrationality, Ball–Rivoal and Zudilin. No roadmap plans the irrationality of ζ(3). The only hits are ζ(3) as a numerical value (ArithmeticStatisticsPartV, Polylogarithms, ColemanIntegration, PeriodsAndSpecialValues, the ConformalMappingPartII radius expansion) and Apéry sets of numerical semigroups (ClassicalArithmeticCompletion §4.30). Neither pin proves it.

## H03 (mycaule) — disputed

ζ(5) does not occur in this roadmap. LeanPool's `Zeta5Irrational/Main.lean` proves `irrational_zeta5 : Irrational zeta5`, and `Zeta5.lean` identifies `zeta5` with `riemannZeta 5`. The module docstrings attribute the proof to a 2026 paper by A. Fauzan, and the proof uses no object of this roadmap:

- **Irrationality criterion.** `Criterion.lean` (`irrational_of_eventually_exists_int_poly`) uses integer polynomials `Q` of degree at most `d n` with `0 < Q(ξ) ≤ ε n` and `b^(d n)·ε n → 0`. There are no power series, no uniformization and no rank or dimension bound.
- **Potential theory.** These files work on the positive half-line with an explicit external field (`Energy.lean`, `Potential.lean`), and `ArcsinePotential.lean` computes the logarithmic potential of the arcsine measure of an interval. There is no general energy-minimiser, capacity, transfinite-diameter or circle-equilibrium theorem. Those general facts are what §§3.7–3.8 and §5.1 consume, through the ClassicalArithmeticCompletion energy/equilibrium contract.
- **Circle integrals.** `CircleAtoms.lean` derives `∫₀^{2π} log‖e^{iθ} − a‖ dθ = 2π log⁺‖a‖` from Mathlib's circle-average identities. This roadmap uses those identities directly, as `Real.circleAverage` and `AnalyticOnNhd.circleAverage_log_norm` in the Mathlib supplier contract.

So there is nothing to cite or import here.

## Adversarial pass, signatures, ownership, sources

- No statement, definition, Check or convention was added or changed, so the adversarial table has no rows this round. The comparison behind H01–H03 is recorded instead:

| Declaration of this roadmap | Object it is about | LeanPool theorem compared | Shared object |
|---|---|---|---|
| `IntegralSeries`, `Uniformizes`, `positiveLogMean`, `rationalFunctionField` (§0.2) | rational power series, analytic germs at 0, circle mean of `log⁺|g|`, ℚ(p) inside ℚ((x)) | `IsTranscendentalPi`, `zeta3_irrational`, `irrational_zeta5` | none: these three theorems are about a single real constant |
| `mean_rank_bound` (§2.1) | `m ≤ e·J(g)/log|φ′(0)|` for ℚ(p)-independent integral-pullback series | the same three | none: the three LeanPool criteria are a Niven polynomial and integer-polynomial approximations to one real number, not independent families of series |
| `arithmetic_algebraicity` (§2.2) | algebraicity of `f` over ℚ(p) and ℚ(x) | the same three | none: the three conclusions are transcendence or irrationality of a constant, not algebraicity of a series |

- `Suggested.lean` is unchanged at `f36c2a5`. I compared the elaborated types of its 6 declarations (the `#check @name` record of the current head) with README §0.2 and §§2.1–2.2. Every hypothesis of the README statements is an explicit binder, and none is lost.
- Ownership: the repair adds no construction, so no new ownership question arises. Of the three results the comment names, only transcendence of π has an owner among the roadmaps (DiophantineApproximationAndTranscendence §3.2, on main). Ownership against open pull requests was checked by object, using the grep above over the 458 open heads and main.
- Sources: there is no new citation and no `needs-references.toml` entry. The LeanPool repository is a formalization the reply refers to, not a source for any statement here.

## Build

`lake build TauCetiRoadmap.DiophantineApproximationAndTranscendencePartII.Suggested`: `Build completed successfully (18239 jobs).` There are two warnings, `declaration uses 'sorry'`, at `Suggested.lean:54:8` (`mean_rank_bound`) and `Suggested.lean:74:8` (`arithmetic_algebraicity`).

## Gate

`gate DiophantineApproximationAndTranscendencePartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency direction

`depcheck: 249 roadmaps, 2380 edges, 0 problem(s)`: there is no UPWARD, CYCLE or `moved:` line for this roadmap.
