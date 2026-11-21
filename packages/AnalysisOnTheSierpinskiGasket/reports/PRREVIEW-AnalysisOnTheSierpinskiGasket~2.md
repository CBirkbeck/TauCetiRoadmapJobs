# Review of AnalysisOnTheSierpinskiGasket (pull request #2945 at b06ab08)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the repair is sound. The existence half of the Dirichlet problem for Poisson's equation (5.3) now has a complete level-by-level route whose every input is a section of this roadmap, a named supplier theorem or a Mathlib declaration; each step was rederived and the new Check was recomputed in exact arithmetic. There are no small corrections and no format notes, and nothing is left for a human to decide.

## Previous findings

- R01 — repaired: 5.3 now builds tent functions, level solutions `g_m` with right sides `∫_K ψ_x^m φ dμ`, proves `g_(m+1) = g_m` on `V_m`, bounds `E_m(g) ≤ (5/3) ‖φ‖_K²`, and extends by 4.4; *Needs:* and scope updated.
- C01 — repaired: the FractalGeometry 1.5 contract now says the supplier gives `μ(F_w(K)) ≥ 3^(−m)` and that equality needs the finite-preimage, no-atoms step (Kig93, Lemma 1.13, p. 725).
- N01 — repaired: the Conventions read "it charges every nonempty relatively open subset of `K`".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.3 sign and normalisation of the level equation | `−(L_m g)(x) = ∫ψ_x^m φ`; `φ = 1` | `(3/2)5^m ∑(f(y)−f(x)) = −(3/2)3^m (L_m f)(x) = (3/2)3^m ∫ψ_x^m φ`; `φ = 1` gives `1`; `u(q₂) = −1/15`, levels 1–4 | agrees with 5.1 | none |
| 5.3 tent functions | level 1–4 tents; cell not containing `x` | nonnegative, sum 1 on `V_*`; zero on corners ⇒ zero on `F_w(V_*)`; support within `2^(−m)` (diam `T` = 1); refinement identity on `V_(m+1)` | holds | none |
| 5.3 level solutions | `m = 0`; `m ≥ 1` | `m = 0`: empty system, `g₀ = 0`; kernel is harmonic off `V₀` with zero boundary values, so `0`; injective ⇒ surjective | holds | none |
| 5.3 consistency `E_(m+1)(h, u) = E_m(h, u)` | `φ = ψ_(q₂)^1`, levels 1–4 | `g_m(q₂) = −1/45` at every level, all restrictions equal; first-variation and polarisation steps rederived | holds | none |
| 5.3 Check, sampled right sides | `(2/3)3^(−m) φ(x)`, levels 1–4 | `g_m(q₂) = −1/25, −29/1125, −43/1875, −629/28125`: not consistent | Check true | none |
| 5.3 Check, integral formula | `M = (1/3)∑ᵗAᵢ M Aᵢ` on symmetric matrices | `T − I` has rank 5 of 6; `(3δᵢⱼ + 4)/45` is fixed, entries sum to 1; `c = c' = (1,1,1)` gives 1 | unique, as stated | none |
| 5.3 Check, level sum at `q₂` | `m = 1, …, 4` | `(3/2)3^m ∫ψ_(q₂)^m φ − 1 = −8/15, −8/25, −24/125, −72/625 = −(8/15)(3/5)^(m−1)` | Check true | none |
| 5.3 Check, harmonic `φ` | two cells at `x`, corner sums `S₁ + S₂ = 6φ(x)` | `3^(−m)(6φ(x) + 24φ(x))/45 = (2/3)3^(−m)φ(x)` | two right sides coincide | none |
| 5.3 bounded energy | `φ = ψ_(q₂)^1`; general | `‖g‖² ≤ (5/3)E_m(g) ≤ (5/3)‖g‖‖φ‖`, so `‖g‖ ≤ (5/3)‖φ‖`; instance `1/45 ≤ 5/3`; `R(x, p₀) ≤ 5/3` is 4.2 with `k = 0` | holds | none |
| 5.3 uniqueness | difference `d` of two solutions | `Δd = 0` (margins add), `E_m(d) → 0` by 5.2 with `u = v = d`, monotone and nonnegative so all `0` | holds | none |
| Kig93 Theorem 5.8 (2) as quoted in 5.3 | Kig93 lines 762–767, p. 738 | `λ^m H_(m,p)(G_μ f) = −∫ψ_p^m f dμ` for `p ∉ V₀`; README's `g` is `−G_μ φ` on the gasket | locator and sign agree | none |
| Cell masses (FractalGeometry 1.5 contract) | supplier bullets at its open head; Kig93 lines 212–215 | supplier: image of product measure, `μ(f_w(K)) ≥ p_w`, equality for injective coding map; preimage of a cell is cylinder plus ≤ 6 sequences | contract accurate | none |

The rows for the untouched statements stand as in the previous review, of `c0ae306`.

- Source locators checked against the text: 4 in Kig93 (Theorem 5.8 (2), p. 738, lines 762–767; proof of Theorem 6.9, pp. 743–744, lines 992–1006; Lemma 1.13, p. 725, lines 212–215; Definition 5.5, p. 737, lines 715–719); all agree.
- Library declarations opened at the pin: `LinearMap.injective_iff_surjective` (`Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean` line 309, `[FiniteDimensional K V]`, `f : V →ₗ[K] V`); `IsCompact.uniformContinuousOn_of_continuous` (`Mathlib/Topology/UniformSpace/HeineCantor.lean` line 50); `ContinuousOn.integrableOn_compact` (`Mathlib/MeasureTheory/Function/LocallyIntegrable.lean`).
- Cross-roadmap citations resolved at the open heads: FractalGeometry 1.5 (`IFS.existsUnique_selfSimilarMeasure`, `IFS.measure_attractor_eq_one`, the two bullets cited) and ElectricalNetworksAndRandomWalks 1.2 (`existsUnique_isHarmonicAt`), 2.2 (`isLeast_dirichletEnergy`); all present as cited.
- Supplier order: the new edges are within Layer 5 → Layer 4 (5.3 uses 4.1, 4.2, 4.4); no section of Layer 4 uses Layer 3 or 5, and 5.4 does not use 5.3. Dependency check: `depcheck: 170 roadmaps, 1983 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/AnalysisOnTheSierpinskiGasket/Suggested.lean` (unchanged since `c0ae306`): seventeen `sorry` warnings and nothing else. The change touches no Lean statement, so the one-tactic probe and signature comparison of the previous review stand.
- Automatic checks: all passed on this head. No file outside the roadmap folder is changed.
- Pull request text: the description names Theorem 5.8 (2), the level-by-level existence proof, the Green operator as out of scope and the new computation; nothing in it is contradicted by this head.
- Overlap check: read ElectricalNetworksAndRandomWalks, FractalGeometry, LaplacianEigenvaluesOfGraphs; nothing shared (the first two are cited suppliers whose definitions are copied verbatim; the third states no gasket object).
- Source independence: changed passages only; 5 passages compared with 1 source (Kig93), none shared; largest share Kig93, about 44 of 55 page locators; the diff adds, removes or reorders no layer, so the contents comparison stands: independent. The existence route of 5.3 is the roadmap's own and differs from Kigami's (which uses the Green operator).
- Research link: The targets are the gasket case of Kigami's harmonic calculus on p.c.f. self-similar sets (Kigami 1993) as surveyed by Strichartz (1999); they are prerequisites of spectral decimation (Fukushima and Shima) and of the heat kernel estimates in the resistance metric (Hambly and Kumagai) named in README scope and Str99 p. 1203. Rests on the README and both sources.

## Not verifiable

- The README's remark in 5.2 that Kig93, Lemma 6.7, p. 742, lacks a factor `1/2`: the text layer of the publisher's scan is garbled at that display; the roadmap does not use the lemma (unchanged since the previous review).
- The final display of Kigami's proof of Theorem 6.9 (Kig93 lines 1003–1006) is garbled in the scan; the roadmap's route does not rest on it.

## Source issues

- **Misprint** in Kig93 at Definition 5.5 (2), p. 737: the source says an admissible measure is positive on each open subset of `K`; it should be each nonempty open subset; affects nothing.

## For the human reviewers

- none
