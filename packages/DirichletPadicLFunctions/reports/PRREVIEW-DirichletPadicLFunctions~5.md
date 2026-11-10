# Review of DirichletPadicLFunctions (pull request #1039 at d3b4392)

**Verdict:** accepted

No finding. This is an incremental re-review of 7 changed lines since `eea118d`: the deleted import in `TauCetiRoadmap/DirichletPadicLFunctions/Suggested.lean` and the rewritten logarithm supplier paragraph in `TauCetiRoadmap/DirichletPadicLFunctions/README.md:49–53`.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/DirichletPadicLFunctions/Suggested.lean:1–6` is `import Mathlib` plus five Tau Ceti modules; the `Logarithm.Basic` import is gone. Direct elaboration and the targeted build both succeed (details below).
- R02 — repaired: `README.md:49` now pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d`; at that Tau Ceti pin the three `Logarithm` modules exist and `README.md:51` states their actual hypotheses (checked line by line below).

The repair of R02 is by the pin move that came with the merge of main rather than by renaming to the `LogOneAdd` declarations: at `2fd255d` the `LogOneAdd` names of the old pin are gone and the `Logarithm` names the README cites are the ones that exist. No new problem was introduced by either repair.

## Verified sound

**Gate, build and elaboration (run on this head).**

- Gate rerun: every count zero (`imports=0`, `build` clean, `outside-folder=0`, `depcheck=0`, `statement-hygiene=0`), result OK; it agrees with the worker's gate.
- `lake env lean` on `Suggested.lean`: 22 `declaration uses sorry` warnings and no other output.
- `lake build TauCetiRoadmap.DirichletPadicLFunctions.Suggested`: completes; besides the 22 `sorry` warnings it prints only Lake's note that `Mathlib` is designed for the module system. This matches the description's validation sentence word for word in substance (22 admitted-theorem warnings and the module-system warning).
- `#check @name` for all 37 declarations (22 theorems, 15 definitions) elaborates with no error; no signature changed since the previous review, since the diff touches only the import block. No `set_option`, `lemma`, `#eval` or `#print` in the file.
- `git diff --stat origin/main...HEAD` outside the roadmap folder is empty.
- Dependency check:

```text
depcheck: 223 roadmaps, 2032 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Pinned declarations opened (9 in Tau Ceti, 4 in Mathlib).** The package checkouts are at Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, equal to the manifest and to the short hashes in `README.md:49`.

- `TauCeti/Analysis/Normed/Algebra/Logarithm/Basic.lean:66–68`: the binder block is `[NontriviallyNormedField 𝕂] [NormedRing A] [NormedAlgebra 𝕂 A] [CharZero 𝕂] [ContinuousSMul ℚ≥0 𝕂]`; `:71` `one_le_logSeries_radius`. `:91` adds `[CompleteSpace A]` before `:94` `logSeries_summable_of_norm_lt_one` and `:102` `log_hasFPowerSeriesOnBall`. This is exactly the README's "also require `CompleteSpace A`".
- `TauCeti/Analysis/Normed/Algebra/Logarithm/Inverse.lean:131`: `[NormedRing A] [NormedAlgebra ℚ A] [CompleteSpace A]`; `:134` `eventually_log_exp`, `:146` `eventually_exp_log`. As stated.
- `TauCeti/Analysis/Normed/Algebra/Logarithm/Naturality.lean:65–66`: source `[NormedRing A] [NormedAlgebra ℚ A] [CompleteSpace A]`, target `[Ring B] [TopologicalSpace B] [IsTopologicalRing B] [T2Space B]`; `:69` `map_log_of_mem_ball` takes `Continuous f` and `x ∈ Metric.ball 1 1`, which its proof unfolds to `‖x − 1‖ < 1`; `:82`, `:89`, `:101` are the eventual and germ forms. As stated ("same source assumptions", "Hausdorff topological ring B", "the ball is `‖x−1‖<1`").
- `Mathlib/Analysis/Normed/Algebra/Logarithm.lean:90` `log`, `:135` `log_eq_tsum` (needs `[CharZero 𝕂]`, sum over all `n : ℕ` of `((-1)^(n+1)/n : 𝕂) • (x−1)^n`), `:146` `log_one`. The README's `Σ_(n≥1)` form is the same series: see the first table row.
- Spot-check after the pin move of names in untouched text of the same supplier section: `TauCeti/NumberTheory/LocalField/Logarithm.lean:98, 163, 264, 283` (`hasSum_log_of_mem_unitFiltration_one`, `continuous_log_unitFiltration`, `valuation_log`, `log_unitFiltration_injective`), `TauCeti/NumberTheory/LocalField/Exponential.lean:173`, `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:251` (`riemannZeta_neg_nat_eq_bernoulli`), `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:706, 892`, `Mathlib/NumberTheory/Padics/Complex.lean:137, 199`. All present.

**Text that depends on the changed passage.** `README.md:79–85` (the PadicFunctionalAnalysis §4.5 contract) refers to "the hypothesis `ContinuousSMul ℚ≥0 𝕂` of `NormedSpace.one_le_logSeries_radius`": correct at the pin (`Basic.lean:68, 71`). The three Lean statements that use `NormedSpace.log` (`Suggested.lean:105, 247, 317`) need only `import Mathlib`; they elaborate without the deleted import.

**Pin move and the "not statable" docstring.** The new Tau Ceti pin contains a generic pseudomeasure carrier on `ℤ_pˣ` with character evaluation (`TauCeti/NumberTheory/Padics/Measure/Units/Pseudomeasure.lean:77, 126`), absent at the old pin. I searched both pinned libraries for the Kubota–Leopoldt pseudomeasure, tame components, a smoothing measure, an Iwasawa logarithm and Morita Gamma by object and by name: none is declared. So the docstring's sentence that the pins contain neither the arithmetic zeta pseudomeasure nor its tame components, and that a generic element of a total quotient ring does not supply them, remains true, and no stated headline duplicates a pinned declaration. Remark, no change asked: once IntegralIwasawaTheory's canonical object lands on that carrier, the §1.6 comparison becomes statable.

**Principles, suppliers, overlaps.** The change adds no target, carrier, supplier edge, algorithm or restriction on primes. `roadmaps resolve` reports no unresolved cross-roadmap citation or Lean name; the overlap report lists no conflicting head, dropped id or revision-only id. PadicFunctionalAnalysis §4.5 remains the cited owner of ultrametric logarithm convergence; nothing here restates it.

**Seeded sample.** None of the fifteen sampled targets (§§0.1, 1.3, 1.5, 1.7, 2.7, 3.1, 3.7, 4.5, 4.10, 4.11, 4.13, 4.14, 5.2, 5.3, 5.8) lies in or cites the changed passage; their text is byte-identical to the head the previous reports read, and their assessment is carried from those reports. §3.7's Lean statement uses `NormedSpace.log` and was re-elaborated.

**Adversarial table (25 rows).** "r4" is the previous report, `packages/DirichletPadicLFunctions/reports/PRREVIEW-DirichletPadicLFunctions~4.md`. The first four rows are computed for this head; the rest are the r4 rows for the headline theorems and sampled targets, whose statements the diff does not touch.

| Statement | Instances | Left side | Right side | Result | Change / provenance |
|---|---|---|---|---|---|
| `README.md:49` series form of `log_eq_tsum` | n=0,1,2,3 terms at `x=1+z` | Mathlib sum over ℕ: `(−1)/0 • 1 = 0` (division by zero is 0), `z`, `−z²/2`, `z³/3` | README `Σ_(n≥1)`: `z`, `−z²/2`, `z³/3` | Equal; the n=0 junk term is 0 | New row |
| `README.md:51` failure of `ContinuousSMul ℚ≥0 𝕂` | p=3, scalars 3⁻², 3⁻⁴; p=2, scalar 2⁻³ | size in ℚ≥0: 1/9, 1/81; 1/8, tending to 0 | p-adic norm of the scalar acting on 1: 9, 81; 8, tending to ∞ | `q ↦ q•1` is not continuous at 0; the hypothesis fails for every 𝕂 normed over a p-adic E | New row; the README example "norms 9 and 81" is right |
| `README.md:51` failure of `NormedAlgebra ℚ E` | p=3, E=ℚ₃, r=3 and r=1/3 | required `‖r•1‖ ≤ ‖r‖·‖1‖` with the real norm on ℚ: r=1/3 needs `3 ≤ 1/3` | actual `‖1/3‖₃ = 3` | Fails; `eventually_log_exp`, `eventually_exp_log`, `map_log_of_mem_ball` are not applicable to E | New row |
| `README.md:51` hypothesis lists against the pin | binder blocks of the 3 modules | README: radius needs 4 hypotheses; summability/power series add completeness; inverse and naturality need complete `NormedAlgebra ℚ A`; naturality target Hausdorff | pin: `Basic.lean:66–68, 91`; `Inverse.lean:131`; `Naturality.lean:65–66` | Identical | New row; closes r4 R02 |
| §0.6 `IsIwasawaLog` and its three existence theorems | x=p; x=2 in ℚ₃; x=−1 in ℚ₂; wrong branch `L+v_p` | `L(p)=0`; `2L(2)=log 4 ≡ 48 mod 243`; `2L(−1)=0` | normalization 0; wrong branch gives 1 at p | determined; zero map excluded by `log₃4 ≠ 0` | r4 |
| §0.6 product law on principal units | z=w=3 in ℚ₃; z=w=−2 in ℚ₂ | `log 16 ≡ 96 mod 243`; `log 1 = 0` | `2·48 = 96`; `2 log(−1) = 0` | Equal | r4 |
| §0.1 `exists_normalizedMellinContinuation` | f=e^(−t), te^(−t), e^(−2t) at s=−3 | 1, s, 8 | README Checks | agrees | r4 |
| §0.2, §0.3 Mellin kernels | β(0), β′(0), β″(0); a=2: h₂(0), D³h₂(0) | 1, −1/2, 1/6; 1/2, 1/8 | README | agrees | r4 |
| §0.4 `algebraicDirichletValue_complex` | χ=1, k=1; odd quadratic mod 3; principal mod 3 | −1/2; 1/3; 0 | ζ(0); L(χ,0); (1−1)ζ(0) | agrees | r4 |
| §1.2 `smoothedMeasure_moment` | p=3,a=2,k=0,1,3; p=2,a=3,k=0,1 | 1/2, −1/4, 1/8; 1, −2/3 | `(1−a^(k+1))·(−B_(k+1)/(k+1))`: same | agrees | r4 |
| §1.3 restriction and inverse-weight numerator | p=3,a=2; p=2,a=3 | λ₂(x)=0, λ₂(x²)=1/2; λ₃(x²)=2/3 | (1−3)(1−4)B₂/2=1/2; (1−2)(1−9)B₂/2=2/3 | agrees; unweighted restriction gives 0 | r4 |
| §1.5 residue masses | p=3,a=2,m=1; p=2,a=3,m=1 | (1/2,−1/2,1/2), sum 1/2; (1,0) | README | agrees | r4 |
| §1.7 unbounded moments | p=3,k=2; p=2,k=2,4 | 1/6, 1/12, −7/120; norms 3, 4, 8 | cleared moment 1/2 has norm 1 | denominator loss visible | r4 |
| §2.2 `smoothedMeasure_characterMoment` | p=3,a=2, quadratic mod 3, k=0,1,2; p=2,a=3, conductor 4, k=0,2 | −1, 0, 2; −2, 14 | Bernoulli side −1, 0, 2; −2, 14 | agrees; level one excluded by `0<n` | r4 |
| §2.4 `existsUnique_tameMeasure` | p=2, η quadratic mod 3, k=0,2 | 1/3, −2/9 | B₁,η=−1/3, B₃,η=2/3 | agrees; principal η excluded | r4 |
| §3.4 complex logarithmic value | quadratic mod 3 | Gauss sum `i√3`, log difference `−πi/3`, value 0.60460 | L(χ₋₃,1)=0.60460 | agrees | r4 |
| §3.6 `leopoldt_value_one` | tame, mixed, wild D=1, p=2 | mass `(θ(a)−1)L_p(θ,1)` | RJW Theorem 6.1(ii) | agrees | r4 |
| §3.7 `principalNumerator_mass`, `bernoulliQuotient_tendsto` | p=3,a=4; p=2,a=3; p=2, w=2,4,8,16 | 49 mod 81; 6 mod 32; valuations 0,3,3,4 | `−(1−p⁻¹)log_p a`: 49, 6; limit `1−1/p` | agrees | r4 |
| §4.1 Morita Gamma | Γ₂(5), Γ₃(4), Γ₃(9), Γ₂(2), Γ₃(3) | −3, 2, −2240, 1, −2 | README | agrees; units | r4 |
| §4.5 `grossKoblitz_formula` | a=0; p=3,f=1,a=1; p=2,f=1 | 1; `−g(ω⁻¹)=π`; π=−2, ζ=−1 | `π⁰Γ(0)=1`; `πΓ₃(1/2)=π` | agrees | r4 |
| §4.7–4.8 distribution rank | d=1: N=1,2,3; d=2, N=2 | 1, 1, 2; 3 | Kubert Thm 1.8, 4.14 | agrees | r4 |
| §4.10–4.11, §4.13 | b₂ relation at N=2; ι at p=5,N=3,B=25 | 2(1/6−1/12)=1/6; ι(1)=17, ι(3)=1, ι(24)=8 | README; `3ι(m)≡m mod 25` | agrees | r4 |
| §4.14 `ferreroGreenberg_derivative` | sign of the log N term; χ(p)=1 | `+(1−χ(p))B₁,χ log N` | Zhao (4.5), Gross–Dasgupta | agrees | r4 |
| §5.3, §5.5 Eisenstein constants | E₄, E₆; p=2,k=4; p=2,u=3,e=3 | 1/240, −1/504; −7/240; `−14/3 ÷ 160 = −7/240` | README; `−(1−8)B₄/8` | agrees | r4 |
| §5.9 stabilized q-expansion | terms with p∣d; u>1; u=1 | p∣d terms removed by multiplicativity; constant 0; `−B_(k,φ)/(2k)` | README | agrees | r4 |

Rows of r4 for README-only targets not listed here (§§1.1, 1.4, 1.6, 2.3, 2.5, 2.6, 3.5, 4.4, 4.9, 4.12, 5.1, 5.6, 5.7) stand as r4 recorded them; their text is unchanged.

## Not verifiable

- Washington §5.1 (uncertified, paywalled), Morita's text and the Kubert parity labels of §4.12 keep the limitations the earlier reports recorded; none of their locators changed, and no new source request was made.
- The fifteen seeded targets were not re-read against their sources this round: none falls in a changed passage, and an incremental re-review carries their earlier assessment.

## Source issues

- none
