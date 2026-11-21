# Review of AnalysisOnTheSierpinskiGasket (pull request #2945 at c0ae306)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the existence half of the Dirichlet problem for Poisson's equation (5.3) rests on Kigami's Green operator, which no layer states and which the scope section places outside the roadmap. Every other statement, Check and locator that was tested holds: the seventeen Lean statements elaborate, the computed values were recomputed exactly, and the sampled locators agree with the two sources. There is one small correction and one format note, neither blocking, and nothing is left for a human to decide.

## R01 (P2) — The existence of a solution in 5.3 uses the Green operator, which the roadmap neither states nor owns

An implementer of `existsUnique_isLaplacianOn` has a route for uniqueness (5.2, then 2.2 and 1.2) but none for existence. In 5.3 (README line 702) the only construction offered is "Kigami's solution is `∑ᵢ bᵢ ψᵢ − G_μ φ` … with `G_μ` the Green operator of his §5", the *Needs:* line of 5.3 (line 713) lists only 1.2, 3.3, 5.1 and 5.2, and the scope section (line 782) puts "the Green function and its explicit formula" outside the roadmap. So the one input of the existence proof is a citation, not a target, a supplier section or a library declaration.

What the proof needs is exactly Kig93, Theorem 5.8, p. 738 (Kig93 lines 762–767), specialised to the gasket: for `φ` continuous on `K` there is `g` continuous on `K`, vanishing on `V₀`, with `(5/3)^m ∑_(y ∼ x) (g(y) − g(x)) = ∫ ψ_x^m φ dμ` at every `x ∈ V_m \ V₀` and every `m`, where `ψ_x^m` is the tent function of 5.1. With `∫ ψ_x^m dμ = (2/3) 3^(−m)` (5.1) and the uniform continuity of `φ` this gives `Δg = φ`, and `g + ∑ᵢ bᵢ ψᵢ` solves the problem. The smallest change: state that sentence as a target of 5.3 (or of 5.1) with its locator and a route — for instance the level-by-level one: solve the finite systems on `V_m \ V₀` (their solutions restrict to one another by the trace identity of 2.2, as the second Check of 5.1 already observes for `φ = 1`), and bound the correction on a cell of level `m` by a constant times `5^(−m) sup|φ|` to get uniform convergence — add it to the *Needs:* line, and narrow the scope sentence to what is really excluded (the kernel `g(x, y)` and its explicit formula).

## C01 — The supplier contract for cell masses points at a bullet that gives only an inequality for the gasket

The contract "From TauCetiRoadmap.FractalGeometry", item 1.5 (line 837), says that the bullet on the image of the product measure "gives the masses of cells". FractalGeometry 1.5, as it stands at its open head, states `μ(f_w(K)) ≥ p_w`, with equality when the coding map is injective; for the gasket it is not injective (each junction point has two codes), so a reader who follows the pointer finds `≥ 3^(−m)` only, while the Conventions use the equality to show `μ(V₀) = 0`. One clause repairs it: the preimage of a cell under the coding map is its cylinder together with finitely many sequences, and the product measure has no atoms (the argument of Kig93, Lemma 1.13, which the Conventions already cite).

## N01 — "it charges every open subset of `K`" (Conventions, admissible measure, line 99) should read "every nonempty relatively open subset of `K`".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 vertices, edges | `m = 0..4`, exact arithmetic | `|V_m|` = 3, 6, 15, 42, 123; edges 3, 9, 27, 81, 243; formula `(3^(m+1)+3)/2` agrees | holds | none |
| 1.1 distance of disjoint cells | cells `F₀₂(T)`, `F₁₀(T)` at level 2 | distance `√3/8 = (√3/2)·2⁻²`; barycentric lemma rechecked for `m = 1` and the induction step | holds, sharp | none |
| 1.2 `closure_vertexSet` | solid triangle as non-attractor | union of three images misses the open middle triangle; closure of `V_*` is not `T` | hypothesis needed | none |
| 1.3 `levelNetwork`, connectivity | `m = 0`; loops | triangle connected; `s(x, x)` never an edge since `F_w` injective; Laplacian = `(5/3)^m` × graph Laplacian | holds | none |
| 2.1 `energy` | corner values (1,0,0); first coordinate | `E₀ = 2`; `E_m = 3/2, 15/8, 75/32, 375/128 = (3/2)(5/4)^m` | holds | none |
| 2.2 `isLeast_energy_succ` | (1,0,0); polynomial `a² − 3b + 5ab` | level-1 minimum `6/5`, renormalised `2`; energies 26, 205/6, 8275/192, 165625/3072, 3310625/49152 increasing | holds | none |
| 2.3 `energy_succ_eq_iff` | rule vs averaging rule on (1,0,0) | rule: `E₁ = 2 = E₀`; weights (1/2,1/2,0): `(5/3)(3/2) = 5/2 > 2`; `m = 0` gives `wordMap = id` | holds both directions | none |
| 2.4 `energyLimit_eq_sum` | harmonic (1,0,0); first coordinate | cell energies 18/25, 6/25, 6/25, sum × 5/3 = 2; `∞ = ∞` | holds | none |
| 3.1 `IsHarmonic` | first coordinate at `q₀`, `q₂` | neighbour sums 9/4 ≠ 3 at `q₀`; 2 = 4·(1/2) at `q₂` | Check true | none |
| 3.2 `isHarmonic_iff` | rule extension to level 4 | all `E_m = 2`; old-vertex sum scales by 3/5: `(3/5)(a + b − 2x)` | holds | none |
| 3.3 `existsUnique_isHarmonic` | (1,1,1), (1,0,0) | constant 1; values 2/5, 2/5, 1/5 at `q₂, q₁, q₀` | holds | none |
| 3.4 maximum principle | (1,0,0) at level 1; `K` not an attractor | values 1, 0, 0, 2/5, 2/5, 1/5 in [0,1]; without `hK`, `f` off `V_*` is free, so false | `hK` needed | none |
| 3.5 oscillation decay | (1,0,0), `m = 0..4`; `Aᵢ` on 0–1 vectors | max cell oscillation 1, 3/5, 9/25, 27/125, 81/625; ratios on 0–1 vectors 3/5, 2/5, 2/5, 2/5 | holds, sharp | none |
| 3.6 Hölder bound | points `F₀^m p₁` | `f = 1 − (3/5)^m`, distance `2^(−m)`, `(2^(−m))^β = (3/5)^m`; far case `C(√3/2)^β ≥ 1` | holds, exponent sharp | none |
| 4.1 `resistance_eq_effResistance` | corners, `V₁` pairs, levels 0..3; `x = y` | 2/3 at every level; 11/30, 1/2, 4/15 at levels 1–3; unit conductances 2/3, 10/9, 50/27, 250/81; both sides 0 on the diagonal | holds | none |
| 4.2 `exists_resistance_le` | chain sum; far case | `(2/3)(3/5)^k(1 + 3/2) = (5/3)(3/5)^k`; `1 + t² + (1−t)² ≥ 3/2`; `(4/√3·√3/2)^β = 2^β ≥ 1` | holds | none |
| 4.3 finite energy ⇒ Hölder | (1,0,0) at `p₀, p₁`; `E(f) = 0` | `1 ≤ (2/3)·2 = 4/3`; zero energy forces `f(x) = f(y)` since `R < ∞` | holds | none |
| 4.4 continuous extension | indicator of `{p₀}` | `E_m = 2(5/3)^m → ∞`; Kig93 Theorem 7.4 (1) and Lemma 7.4.4 read | holds | none |
| 5.1 `IsLaplacianOn` | Lean factor vs README; `Δu = 1` | `−(3/2)3^m(5/3)^m∑(f x − f y) = (3/2)5^m∑(f y − f x)`; `u(q₂) = −1/15` at levels 1–4 | agree | none |
| 5.2 `exists_tendsto_energyForm` | `Δu = 1`; harmonic (1,0,0); test function 1 | `(L_m u)(p₀)` = 2/9, 8/27, 26/81, 80/243 → 1/3; `∂ₙ = (2, −1, −1)`; `0 = 1 − 1` | holds, sign and normalisation pinned | none |
| 5.3 `existsUnique_isLaplacianOn` | `φ = 1, b = 0`; route inputs | solution negative inside (max −1/15, −4/75, −13/375, −8/375); existence route cites `G_μ` only | statement holds; route unsupported | R01 |
| 5.4 `isLaplacianOn_zero_iff` | `K = ∅`; `Δu = 1` | count `(3^(m+1) − 3)/2 ≤ (3/2)3^m`; `max|d|² ≤ (5/3) ε max|d|`; level-1 sum 2/15 ≠ 0 | holds for any `K` | none |
| Supplier copies | 12 declarations against the two open heads | `IFS`, coercion, `IsAttractor`, `Network`, `weight`, `graph`, `IsHarmonicAt`, `laplacian`, `groundedLaplacian`, `voltage`, `effResistance`, `dirichletEnergy`: identical bodies | verbatim | none |
| Cell masses (Conventions) | FractalGeometry 1.5 bullet | supplier gives `≥ p_w`, equality only for injective coding map | needs one clause | C01 |

- Source locators checked against the text: 33 in Kig93 (Definitions 1.3, 1.6, 1.12, Lemma 1.13, Definitions 2.1, 2.2 and remark, 2.4, eq. (2.2), Theorem 2.9, Definitions 4.1, 4.4, Lemmas 4.5, 4.6, Theorem 4.7, Proposition 5.4, Definition 5.5 and remark, Theorem 5.8, Definitions 6.1, 6.2, Lemmas 6.3, 6.4, Theorem 6.5, Definition 6.6, Lemma 6.8, Theorem 6.9, Corollary 6.10, Lemma 6.13.1, Corollary 6.14, Propositions 7.2, 7.3, Theorem 7.4, Lemma 7.4.4, Example 8.2) and 10 in Str99 (eqs. (3)–(6), (9), (10), (18), Theorem 1, the (2/5, 1/5) law, the resistance paragraph); all pages agree.
- Library declarations opened at the pin: 24 in Mathlib, each in the file the README names (for example `ENNReal.finsetSum_iSup_of_monotone`, `Mathlib/Basic/ENNReal/BigOperators.lean` line 182; `uniformly_extend_of_ind`, `Mathlib/Topology/UniformSpace/UniformEmbedding.lean` line 498; `ContinuousOn.integrableOn_compact`, `Mathlib/MeasureTheory/Function/LocallyIntegrable.lean` line 587). No object of the roadmap exists in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved at the open heads: FractalGeometry 1.1, 1.3, 1.4, 1.5, 5.2 and ElectricalNetworksAndRandomWalks 1.1, 1.2, 2.1, 2.2, 2.5, with the eight theorem names cited; all present with the stated hypotheses.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/AnalysisOnTheSierpinskiGasket/Suggested.lean`: exit 0, seventeen `sorry` warnings and nothing else. One-tactic probe (`simp`, `rfl`, `infer_instance`) on a copy: none of the seventeen closes. Elaborated types compared with the README statements: no hypothesis lost (the two flagged binders are unused instance arguments of the copied `graph` and `dirichletEnergy`, as in the supplier).
- Automatic checks: all passed on this head. No file outside the roadmap folder is changed.
- Overlap check: read ElectricalNetworksAndRandomWalks, FractalGeometry, LaplacianEigenvaluesOfGraphs; nothing shared (the first two are cited suppliers whose definitions are copied verbatim, the third copies the same network definitions and states no gasket object). A search of all open roadmaps and main for the gasket, Kigami's Laplacian and the resistance metric found no other owner.
- Source independence: 14 passages compared with 2 sources, none shared; largest share Kig93, about 43 of 54 page locators; contents compared with Kig93 (§1 self-similar sets, §2 quasi-harmonic structure, §4 harmonic structure, §5 Green's function, §6 Laplace operator, §7 Dirichlet form, §8 examples): independent — Layers 2 and 4 have no counterpart section, and Layer 3 draws on §2, §4 and §6.
- Research link: The targets are the gasket case of Kigami's harmonic calculus on p.c.f. self-similar sets (Kigami 1993) as surveyed by Strichartz (1999); they are prerequisites of spectral decimation (Fukushima and Shima) and of the heat kernel estimates in the resistance metric (Hambly and Kumagai) named in README scope and Str99 p. 1203. Rests on the README and both sources.

## Not verifiable

- The README's remark in 5.2 that Kig93, Lemma 6.7, p. 742, lacks a factor `1/2`: the publisher's file is a scan whose text layer is garbled at that display (Kig93 line 924); the roadmap does not use the lemma.
- The printed value `λ = 5/3` in Kig93, Example 8.2, p. 749: the same display is garbled (Kig93 line 1175); the value was confirmed by computation instead (level-1 trace `(3/5) D`).

## Source issues

- **Misprint** in Str99 at eq. (10), p. 1201: the source says the normal derivative is the renormalised limit of the sum of `f(y) − f(x)` over neighbours `y` of the boundary point `x`; it should be the sum of `f(x) − f(y)`, as its Gauss–Green formula (11) requires (for `Δv = 1` with zero boundary values the printed sign gives `−1`, not `1`); affects nothing.
- **Error** in Str99 at the paragraph on the resistance metric, p. 1203: the source says the metric is the infimum of the energy of functions with values 0 and 1 at the two points; it should be the reciprocal of that infimum; affects nothing.

## For the human reviewers

- none
