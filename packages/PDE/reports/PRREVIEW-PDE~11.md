# Review of PDE (pull request #1614 at 1e5dbd6)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the off-diagonal Marcinkiewicz theorem of §2.2 is false as stated when `q₀ = q₁`, and one clause repairs it. The six mathematical findings of the previous review (§1.8, §4.5, §4.6 and their Lean statements) are all repaired at this head, and the new statements `exists_poincare_friedrichs` and `existsUnique_weakSolution_mixed` are sound. There are five small corrections and two format notes, none blocking; the human reviewers are asked about three points (pinned counterparts of §1.5–§1.6, two unread textbooks, one licence).

## R01 (P2) — The off-diagonal Marcinkiewicz theorem of §2.2 is false when `q₀ = q₁`

An implementer who takes the target as written is asked to prove a false statement, and §8.1, which consumes §2.2 for the non-endpoint `TT*` bounds, inherits it. In §2.2 (line 1274) the target reads "a sublinear operator of weak types `(p₀, q₀)` and `(p₁, q₁)` with `p_i ≤ q_i` is of strong type `(p, q)`" along the interpolated exponents; nothing excludes `q₀ = q₁`.

Take `h(x) = |x|^{−1/2}` on `ℝ` and `T f = (∫_0^1 f) · h`. Then `|{|h| > t}| = 2t^{−2}`, so `‖h‖_{L^{2,∞}} = √2`, while `h ∉ L²`. Since `|∫_0^1 f| ≤ ‖f‖₁` and `≤ ‖f‖₂`, `T` is linear and of weak types `(1, 2)` and `(2, 2)`, with `p_i ≤ q_i`. At `θ = 1/2` the statement claims strong type `(4/3, 2)`, but `T 1_{[0,1]} = h` has infinite `L²` norm.

The smallest change: "…of weak types `(p₀, q₀)` and `(p₁, q₁)` with `p_i ≤ q_i`, `p₀ ≠ p₁` and `q₀ ≠ q₁` is of strong type `(p, q)` for `0 < θ < 1` along …", and the witness above as a Check ("with `q₀ = q₁ = 2` the rank-one operator `f ↦ (∫_0^1 f)|x|^{−1/2}` is of weak types `(1,2)` and `(2,2)` and not of strong type `(4/3, 2)`").

## C01 — The Tau Ceti supplier section names one revision and now cites declarations of another, and says the library lacks what it cites

A reader who opens the cited files at the stated revision does not find them. The section opens (line 274) with "line numbers are those of the Tau Ceti revision pinned by the content repository's `lake-manifest.json` (`358314d`)"; the manifest pins `2fd255d`, and the declaration this pull request adds at line 298, `TauCeti.W1p.denseRange_restrictL_ofTestFunctionₗ_top` in `Analysis/Sobolev/LipschitzDomain/GlobalExtension.lean:142`, is in a file that does not exist at `358314d` (it does at `2fd255d`, at that line). The same section closes (line 638) with "Tau Ceti has no … Lipschitz-domain predicate, no domain trace", while line 300 cites "Tau Ceti's `IsLipschitzDomainWith`" and the module docstring of `Suggested.lean` (line 47) names "the pinned trace `TauCeti.W1p.frontierTrace`".

Would change `358314d` to `2fd255d` and drop "no Lipschitz-domain predicate, no domain trace" from the closing bullet (or say "on `EuclideanSpace ℝ (Fin (n+1))`"). The older line numbers of the section (for example `Analysis/PDE/EnergyForm/Sobolev.lean:372,524,600`, now `411,649,733`) are main's text and are left to its maintainers; see the human reviewers.

## C02 — The backward-heat Check of §6.2 displays a function that does not solve the equation it names

In the Checks of §6.2 (line 2513): "Backward heat equation `∂ₜu − Δu = 0` with terminal data is ill-posed: `u = e^{k²t} sin(kx)` grows without bound in `k`". For that `u`, `u_t − u_xx = 2k²u ≠ 0`; it solves `∂ₜu + Δu = 0`, as the Check of §6.6 (line 2761) uses it for `P_back`. Either write the equation as `∂ₜu + Δu = 0` with initial data, or keep the heat equation with terminal datum `sin(kx)` at `T` and the solution `e^{k²(T−t)} sin(kx)`, whose value at `t = 0` is `e^{k²T} sin(kx)`.

## C03 — The description describes an earlier head

The description says "Adds Lane G to the PDE roadmap … built on A.6's Lipschitz charts … Lane G builds on Lanes A and D". The head has no Lane G, no A.6 and no Lanes: the additions are §1.8 (A8), §4.5 (D20) and §4.6 (D21), and the description does not state the change to `Suggested.lean`.

Text that would be right: "Revises the PDE roadmap on main: adds §1.8 (A8: admissible boundary parts, `W^{1,p}_Γ(Ω)`, Lipschitz shears, the trace characterization, Poincaré–Friedrichs) to Layer 1 and §4.5 (D20: mixed and Neumann problems) and §4.6 (D21: their spectra) to Layer 4. No section of main is removed or renumbered; the labels become A1–A8 and D16–D21. `Suggested.lean` gains the definition `w1pVanishingOnSubmodule` and the theorems `w1pVanishingOnSubmodule_frontier`, `exists_poincare_friedrichs`, `existsUnique_weakSolution_mixed` and `neumann_solvable_iff`. The Tau Ceti supplier contract gains `W1p.denseRange_restrictL_ofTestFunctionₗ_top` and `W1p.compL`; Brezis is added to the references. No roadmap supplier is added or dropped."

## C04 — Meyers' Theorem 1 is stated for his own class of domains, not for `C¹` domains

§5.2 (line 2113) cites "on a bounded `C¹` domain (Meyers, Theorem 1, p. 198)". The theorem (`meyers-1963` line 264–269) assumes a bounded domain of the class defined at `meyers-1963` line 164–168 by `W^{1,q}` solvability of the Laplace Dirichlet problem, of which the paper says only that it holds for sufficiently smooth boundaries. The statement for `C¹` domains is true, but the reader is sent to a theorem with another hypothesis. Would write "on a bounded domain on which the Laplace Dirichlet problem is solvable in `W^{1,q}` (Meyers, Theorem 1, p. 198), in particular on `C¹` domains".

## C05 — The reason given for not stating §4.6 does not apply to its eigenbasis theorem

The module docstring of `Suggested.lean` (line 50) says "§4.6: the realization `−Δ_Γ` is a target". The eigenbasis statement of §4.6 needs no realization: a Hilbert basis of `Lp ℝ 2 (mu.restrict Ω)` whose members are values of elements `u` of `w1pVanishingOnSubmodule mu Ω 2 Γ` with `energyFormH1 1 0 0 u v = λ ∫ u v` for every `v` in that space is statable with the file's own definition, as the pinned Dirichlet eigenbasis theorem is stated without one. Either state it, or say in the docstring which statements of §4.6 lack the realization (the spectrum of the `LinearPMap`) and that the eigenbasis is left to the README.

## N01 — The new labels D20 and D21 share their numbers with E20 and E21

The Labels paragraph (line 200) now has D16–D21 and E20–E26; a consumer who cites "item 20" by number alone is ambiguous. The letter disambiguates; a clause saying so would do.

## N02 — The citation of Bauer–Pauly–Schomburg, Theorem 4.8, omits its hypothesis on `Γ`

In §1.8 (line 1134) and the docstring of `exists_poincare_friedrichs`: the source's theorem is for weak Lipschitz pairs (`bauer-pauly-schomburg` line 1110–1117, standing assumption of its Section 4); "for `p = 2`, dimension three and weak Lipschitz pairs" would say so.

## Questions for the author

- §2.2 cites Grafakos, Theorem 1.3.2, for the off-diagonal Marcinkiewicz theorem. I recall Theorem 1.3.2 as the diagonal theorem and the off-diagonal one, with `p₀ ≠ p₁` and `q₀ ≠ q₁`, as Theorem 1.4.19; the book is not legally readable here, so this is a question and not a required change.
- In the Lipschitz-shear route of §1.8 the pinned `TauCeti.W1p.compL` is applied to the mollified shears `Φ_ε`, which map `U` onto `Φ_ε(U)`, not into `V = Φ(U)` (its hypothesis `MapsTo Φ U V`). Is the intended argument local (on `U' ⋐ U`, where `Φ_ε(U') ⊆ V` for small `ε`), or direct for smooth `u` by Rademacher and Fubini in `t`? I did not work the route through.

## Previous findings

- R01 (Poincaré–Friedrichs and the coercive mixed problem statable and absent) — repaired: `Suggested.lean` lines 213–222 and 362–375 state both; §1.8 line 1132 reads "any `Γ ⊆ frontier Ω` with `μHE[n] Γ > 0`"; the docstring entry (lines 46–50) is rewritten.
- R02 (containment of `W^{1,p}_0`) — repaired: line 1144, "For `Γ` disjoint from `Ω` (in particular `Γ ⊆ frontier Ω`) … `W^{1,p}_Γ(Ω)` contains `W^{1,p}_0(Ω)`", with the witness `Γ = {1/2}` as a Check (line 1169).
- R03 (bi-Lipschitz change of variables unowned) — repaired: the "Lipschitz shears" target (line 1113) and its entry in the `*Needs:*` line (line 1186); see the second question.
- R04 (`w1pVanishingOnSubmodule_empty` pinned) — repaired: the declaration is gone and line 1108 cites `TauCeti.W1p.denseRange_restrictL_ofTestFunctionₗ_top`.
- R05 (Checks of §1.8) — repaired: lines 1160–1172.
- R06 (locators of §1.8, §4.5, §4.6) — repaired in form: Bauer–Pauly–Schomburg, Theorem 4.8, p. 16 (read) and Brezis, Proposition 9.24, Theorem 9.23, §8.4 Example 5, Problem 47, Theorem 9.31 (not readable here).
- R07 (the description) — not repaired: the description is unchanged; C03.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 interval classes | `x`, `x²` on `(0,1)` | `∫xφ' = −∫φ`; `∫x²φ' = −∫2xφ`; endpoint values `(0, 1)` | true | none |
| §1.3 Bessel agreement | Gaussian, `k = 1`, `p = 2` | `∫(1+ξ²)e^{−2πξ²} = (1+1/(4π))/√2`; `∫(1+4π²ξ²)e^{−2πξ²} = (1+π)/√2` | true | none |
| §1.4 embeddings | `\|x\|^{−a}`; `x(1−x)`; `\|x\|^{3/4}` | `ap* < n ⇔ ap < n−p ⇔ (a+1)p < n`; `1/4 ≤ 1/2`; `(9/16)\|x\|^{−1/2}` integrable | true | none |
| §1.8 `W^{1,p}_Γ`, containment | `(0,1)`: `Γ = {0}`, `{1/2}`; `p = ∞` | `closure Γ ∩ Ω = ∅` when `Γ ∩ Ω = ∅`; bump with `φ(1/2) = 1` excluded; `‖1 − φ'‖_∞ ≥ 1` | true | none |
| §1.8 empty case | pinned predicate against §1.6's | finite cover of the compact frontier, `L = max Kᵢ`, recentred chart `γ(· + s') − γ(s')` still `L`-Lipschitz | true | none |
| §1.8 Poincaré–Friedrichs; `exists_poincare_friedrichs` | `(0,1)`, `Γ = {0}`; `Γ = ∅`; rooms | `\|u(x)\| ≤ x^{1−1/p}‖u'‖_p`, `C ≤ 1`; constant `1` refutes; `2^{−k(1−p)}·2^{−k(p+2)} = 2^{−3k}` against `(4/3)4^{−k}` | true | N02 |
| §1.8 admissibility | square, `{0}×(0,1)`; `{0}×((0,1)∖{1/2})` | corner chart `t = \|s\|`, one side of `s = 0`; base minus one point is neither all, none nor one side | true | none |
| §2.2 off-diagonal Marcinkiewicz | `Tf = (∫_0^1 f)\|x\|^{−1/2}`, `(1,2)`, `(2,2)` | `‖h‖_{2,∞} = √2`; `‖T1_{[0,1]}‖₂ = ∞` at `(4/3, 2)` | false as stated | R01 |
| §2.2 Riesz–Thorin | Hausdorff–Young | `1/p = 1 − θ/2`, `1/q = θ/2 = 1/p'`, constant `1^{1−θ}1^θ = 1` | true | none |
| §3.4 potentials | ball of `ℝ³`, `f = 1`; half-line Poisson kernel | `−Δ(3−\|x\|²)/6 = 1`, trace `1/3`, `(1−\|x\|²)/6`; `∫ t/(x²+t²) dx = π`, `c₁ = 1/π` | true | none |
| §4.4 Dirichlet spectrum | `(0,π/2)`; `(0,π)²` | `λ₁ = 4 ≥ 1`; `5 = 1+4 = 4+1` | true | none |
| §4.5; `existsUnique_weakSolution_mixed`, `neumann_solvable_iff` | `−u'' = 1`: `Γ = {0}`; `Γ = ∅` with `h = 0`, `h(1) = −1`; `−u''+u = 1` | `x − x²/2`; `∫f = 1 ≠ 0`; `∫(−x)v' = ∫v − v(1)`; `u = 1`; coercivity `λ/(1+C²) ≥ 1/2` | true | none |
| §4.6 mixed spectra | `(0,1)`, `Γ = {0}`, `∅`; square | `cos((m+½)π) = 0`, `λ₁ = π²/4`; `μ = 1/(1+m²π²) ∈ (0,1]`; `π²/4 + π² = 5π²/4 < 9π²/4` | true | C05 |
| §5.1; `exists_wkp_two_of_lipschitz_coefficients` | `a = 1 + 1_{x>0}`; `F = 1_{(0,1/2)}` | `u' = C/a` jumps; `u' = −F + c ∉ H¹` | true | none |
| §5.2 Meyers, VMO | planar example | eigenvalues `μ²`, `1`; `p(1−μ) < 2`; pages 198, 200, 204 from the scan's page count | true | C04 |
| §5.4; the two ball theorems | `u = x₁` | `r^{−α−n/2} · r^{1+n/2} = r^{1−α}` on both sides | true | none |
| §5.5 Krylov–Safonov pair | `n = 1` | `\|u'(x) − u'(y)\| ≤ ‖f‖₁/λ` | true | none |
| §5.6; `holderOnWith_iteratedFDeriv_two_of_schauder` | `x₁²` | `0 ≤ C(4r^{−α} + 2r^{−α})` | true | none |
| §5.7 Calderón–Zygmund | multiplier; `I + b x̂⊗x̂`; `a = 1 + 1_{x>1/2}` | `(2πiξᵢ)(2πiξⱼ)/(4π²\|ξ\|²) = −ξᵢξⱼ/\|ξ\|²`; `(n+γ−2) + b(γ−1) = 0`; `1/2 + 1/8 = 5/8` | true | none |
| §6.1 Gelfand triple | `u = tv`; `Σ e^{−k²t} sin(kx)/k` | `t²‖v‖² = 2∫_0^t τ‖v‖²`; `Σ 1/(2k²) < ∞`, `(π/2)Σ e^{−2k²t} → ∞` | true | none |
| §6.2 Galerkin | `e^{−t} sin x`; `a = 1 + 1_{x>0}`; `e^{k²t} sin kx` | `(π/2)e^{−2t} + (π/2)(1−e^{−2t}) = π/2`; `3C/2 + 1/4 = 0`, `C = −1/6`; `u_t − u_xx = 2k²u` | true except one Check | C02 |
| §6.6 backward problems | `u = s`; `u = t` | `P_back u = 1`, `P̃v = −1 = −g∘R`; `‖u‖ ≥ T`, so `K ≥ T` | true | none |
| §6.9 weights | `u = wv`, `w = e^{φ}`; `w = e^x`; `e^{x²}` | drift `b + 2aφ'`, zero order `c + a(φ'' + φ'²) + bφ'`; `b + 2a`, `c + a + b`; `4ax²` unbounded | true | none |
| §9.1 global input | `x(1−x)/2`; `\|x\|^{−γ}`, `d = 3` | `1/8 + 1/2 ≤ 1`; exponent `2 − γ ↓ 2 − 3/q` | true | none |
| `hopf_boundary_point` | `v = −(x+1)` on `(−1,1)` | `(v(−1) − v(−1+t))/t = 1 > 0` | true | none |
| `CalderonZygmundOperator.eLpNorm_le`, `weakType_one` | `x·f(x)` | `R² + R + 1/3 → ∞`: not an instance | true | none |
| `exists_poincare_wirtinger`, `exists_trace`, `exists_extension`, Rellich | pinned counterparts on `WithLp 2 (ℝ × E)` | same hypotheses there with `volume`; the pin's Rellich has `p ≠ ∞` only | true as stated | none (human reviewers) |

- Source locators checked against the text: 10 (`bauer-pauly-schomburg` lines 305–326, 329–341, 414–424, 1110–1117, 1556; `meyers-1963` lines 164–168, 264–269, 300–309, 397–408; `krylov-vmo` lines 103–104, 193–198, 203–208).
- Library declarations opened at the pin `2fd255d`: `Analysis/Sobolev/LipschitzDomain/Basic.lean:144,482`, `LipschitzDomain/GlobalExtension.lean:94,142`, `LipschitzDomain/RellichKondrachov.lean:53,71`, `LipschitzDomain/Trace/Frontier.lean:219,448`, `W1p/ChangeOfVariables.lean:274`, `Analysis/PDE/EnergyForm/Sobolev.lean:411,649,733,1099`.
- Automatic checks: all pass at this head. Dependency check: `depcheck: 200 roadmaps, 2191 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 20 diagnostics, all `declaration uses sorry`. One-tactic probe (`first | rfl | simp | infer_instance`) on a copy: none of the 20 closes.
- Signatures: the elaborated types of the two new theorems read against the README, the other 23 declarations read in the source with their section variables; the new declarations keep `[mu.IsAddHaarMeasure]`, `[Fact (1 ≤ p)]` and their domain hypotheses in their own binders; none lost a binder.
- Cross-roadmap citations: none unresolved; §4.6 cites OperatorTheory's `LinearPMap` vocabulary only, as §4.4 does. Six Lean names of main's text are not found under those names at the pin (lines 345, 372, 1321, 2252); two are this file's own declarations.
- Overlap check: read SobolevPolynomialApproximation, ComplexHessianEquations, YangMillsConnectionsAndCaloricGauge (main) and the Neumann-Laplacian passages of SchrodingerOperatorsAndSpectralTypes (open); nothing shared. A search of main and the open heads for `W^{1,p}_Γ`, Poincaré–Friedrichs, mixed boundary conditions and Neumann problems finds no second owner; YangMills asks PDE for the `L^p` Neumann problem on the ball, a different statement from §4.5.

Source independence: 9 passages compared with 3 sources (`bauer-pauly-schomburg`, `meyers-1963`, `krylov-vmo`), none shared beyond formulas; largest share Gilbarg–Trudinger, about 29 of 110 locators, its text and table of contents not read; contents compared with the chapter list the README's References give for it (Layers 1, 3, 4–5 against Chapters 7, 2–4, 8, 6, 9, not in order, Layers 2 and 6–9 outside it): independent.

Research link: §1.8 states, in every dimension and for finite `p`, the density and Poincaré–Friedrichs results of Bauer–Pauly–Schomburg (2016, Lemma 3.1, Theorem 4.8); §5.2 and §5.7 rest on Meyers (1963) and Krylov (2007); §5.4 on De Giorgi–Nash–Moser as formalized by Armstrong–Kempe (arXiv:2604.05984). Rests on the README's References and the three texts read.

## Not verifiable

- Brezis (Proposition 9.24, Theorem 9.23, §8.4 Example 5, Problem 47, Theorem 9.31): the sources service resolves it only to the publisher's paywalled page.
- Evans; Gilbarg–Trudinger; Leoni (Theorem 7.13); Stein (both books); Grafakos (Theorems 1.3.2, 1.3.4); Adams–Fournier; Giaquinta–Martinazzi; Grisvard; Lieberman; Bahouri–Chemin–Danchin: books with no legal open copy found; locators not checked.
- Chiarenza–Frasca–Longo (1991, 1993), Di Fazio, Auscher–Qafsaoui, Lunardi's notes: not fetched in this round.
- The Lean names `holder_Moser`, `EllipticCoeff`, `quadratic_upper`, `mixed_bound` of the Armstrong–Kempe repository: the repository was not read.

## Source issues

- none

## For the human reviewers

- **Scope of this pull request.** Main's §1.5–§1.6 targets (Poincaré–Wirtinger, trace with kernel, extension, finite-`p` Rellich) have counterparts at the pin `2fd255d` on `WithLp 2 (ℝ × E)` in `TauCeti/Analysis/Sobolev/LipschitzDomain/`; `Suggested.lean` still states them on `EuclideanSpace ℝ (Fin (n+1))`.
- **Not tested.** Gilbarg–Trudinger and Evans carry the largest shares of locators (about 29 and 20 of 110); neither text nor contents page was read, so wording and arrangement were not compared against them.
- **Licence.** `README.md` lines 3397–3403 describe names taken from `scottnarmstrong/DeGiorgi` (stated Apache-2.0); the repository and its licence file were not opened.
