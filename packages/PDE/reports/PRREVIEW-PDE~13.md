# Review of PDE (pull request #1614 at 2c19c3f)

**Verdict:** needs changes

**Summary.** Changes are needed for two findings. The proof sketch of the new finiteness-of-components statement in §4.6 rests on a false claim (the part of `Ω` inside a chart cylinder need not be connected), and two headline targets of `Suggested.lean`, every-order Meyers–Serrin and interior `H²` regularity for Lipschitz coefficients, are already theorems of the pinned Tau Ceti. The previous finding on the off-diagonal Marcinkiewicz theorem is repaired, and the nine new §4.6 statements are sound as stated. There are five small corrections and one format note, none blocking; the human reviewers are asked about four points, the first being that the second finding concerns text of main that this pull request does not change.

## R01 (P2) — In §4.6 the part of `Ω` inside a chart cylinder need not be connected, so the argument for finitely many components fails as written

An implementer who follows the sketch of `finite_connectedComponents_of_isLipschitzDomain` is asked to prove a false lemma. The Neumann-kernel bullet of §4.6 (line 2050) says "the finitely many charts covering the compact frontier each meet only one, since inside a chart cylinder `Ω` is the connected region below a graph". §1.6's predicate lets the graph leave the cylinder through its top, and then the region is disconnected.

Take `γ(s) = max(0, 3 − 3|s|)` on `ℝ` and `Ω = {(s, t) : |s| < 5, γ(s) < t < 1}` in `ℝ²`. Since `γ ≥ 1` exactly on `|s| ≤ 2/3`, `Ω` is the union of two convex open quadrilaterals, with vertices `(−5,0), (−1,0), (−2/3,1), (−5,1)` and its mirror image, whose closures are `4/3` apart: a bounded Lipschitz domain with two components. At the frontier point `x = (−2, 0)` the chart with `e = id`, `r = 3`, `h = 1` and graph function `s ↦ γ(s − 2)` satisfies the predicate (for `|s + 2| < 3` and `|t| < 1`, membership in `Ω` is `t > γ(s)`), and its cylinder contains points of both components, for instance `(−2, 1/2)` and `(0.9, 1/2)`.

The statement itself is true. The smallest change is in the parenthesis: "…and the finitely many charts covering the compact frontier can be taken, after shrinking the radius to `r' ≤ r` with `(Lip γ)·r' < h` (§1.6's chart restriction; `γ(0) = 0` at the centre), so that inside each cylinder `Ω` is the region above the graph, which is then connected; each such chart meets only one component". This also replaces "below a graph" by "above", as §1.6 and `IsLipschitzDomain` have it.

## R02 (P2) — Two headline targets are already theorems of the pinned Tau Ceti

`Suggested.lean` is the list of what the finished roadmap must prove, and its first entry and its §5.1 entry ask for nothing: an implementer would rebuild what the library has, and a reader is told the library lacks it. (Both passages are main's text, not this pull request's; see the human reviewers.)

Every-order Meyers–Serrin. §1.2 (line 747) says "Prove Meyers–Serrin in every order `k ≥ 2` on an arbitrary open `Ω` for finite `p`", and the scope paragraph (line 56) credits Tau Ceti with "order-one Meyers–Serrin density on arbitrary open sets". At the pin `2fd255d`, `TauCeti.Wkp.dense_contDiffOn_representatives` (`Analysis/Sobolev/Wkp/MeyersSerrin.lean:291`) is the statement for every `k`, with the same hypothesis `p ≠ ⊤` and the same set of smooth representatives. On a copy of the file, with that module imported, replacing the `sorry` of `dense_contDiffOn_representatives_wkp` by `exact TauCeti.Wkp.dense_contDiffOn_representatives hp k` elaborates without error.

Interior `H²` for Lipschitz coefficients. §5.1 (line 2130) says "Prove it for variable `a` with entries Lipschitz on `Ω`", and the scope paragraph (line 67) credits Tau Ceti with "constant-coefficient interior `H²` regularity". At the pin, `TauCeti.PDE.UniformlyEllipticOn.exists_lowerOrder_eq_restrictL_of_locallyLipschitzOn` (`Analysis/PDE/Regularity/Interior.lean:787`) has the conclusion of `exists_wkp_two_of_lipschitz_coefficients` word for word, under the weaker hypothesis that `x ↦ matrixBilinearForm (a x)` is locally Lipschitz on `Ω`; entrywise Lipschitz gives that, because `matrixBilinearFormLinear` (`Analysis/PDE/Ellipticity/Basic.lean:197`) is a continuous linear map of the matrix.

The smallest change: cite the two pinned declarations in the Tau Ceti supplier section and in §1.2 and §5.1 in place of "Prove…", correct the two clauses of the scope paragraph, and remove the two theorems from `Suggested.lean` and from its docstring's list. What remains a target in §5.1 is what the pinned theorem does not give: the estimate `‖u‖_{H²(V)} ≤ C(‖f‖_{L²} + ‖u‖_{L²})` with its constants, the `Hᵏ` bootstrap and the global versions.

## C01 — The README describes an older Tau Ceti than the revision its supplier section now names

A reader who opens the cited files at `2fd255d` does not find them, and three sentences about what the library has are no longer true there. The header of the Tau Ceti supplier section (line 281) now reads "line numbers are those of the Tau Ceti revision pinned by the content repository's `lake-manifest.json` (`2fd255d`)". At that revision:

- `TauCeti.W1p.dense_contDiffOn_representatives` in `Analysis/Sobolev/W1p/MeyersSerrin.lean:216` (line 312, and newly cited in §1.8 at lines 1127 and 1197) does not exist; the declaration is `TauCeti.Wkp.dense_contDiffOn_representatives`, `Analysis/Sobolev/Wkp/MeyersSerrin.lean:291`, used at order one as `… hp 1`.
- "De Giorgi–Nash–Moser Hölder continuity for `n ≥ 3`" (lines 68 and 2261, and the docstring of `exists_holderOnWith_of_isWeakSolution_ball`): the pinned `TauCeti.PDE.exists_holderOnWith_preciseRepresentative` (`Analysis/PDE/Regularity/HolderContinuity.lean:184`) assumes only `[Nonempty ι]` and its docstring says `n ≥ 1`.
- "Tau Ceti has no … Harnack inequality for variable principal coefficients" (line 650, in the bullet this pull request rewrote): `TauCeti.PDE.exists_ae_ae_value_le_mul_value` (`Analysis/PDE/Regularity/Harnack.lean:328`) is Moser's Harnack inequality for measurable uniformly elliptic `a`, `n ≥ 1`, on balls with `B(x₀, 16√n r) ⊆ Ω`.

Would correct these three places; §5.4's targets then read as the passage from the pinned operator-bound statements to the inverse-coercive, ratio-uniform ball statements, and no longer as the dimensions `n = 1, 2`.

## C02 — `neumann_kernel_iff_isLocallyConstant` holds on every open set, so its two domain hypotheses are unused

The statement carries `hΩ : IsLipschitzDomain Ω` and `hb : IsBounded Ω`. Neither is needed: if `B(u, v) = 0` for all `v` then `v = u` gives `∇u = 0` and `u` is almost everywhere locally constant on any open set; conversely a class equal almost everywhere to a locally constant `g` has zero weak gradient (a test function's compact support meets finitely many of the open sets on which `g` is constant, and a partition of unity gives `∫ g ∂ᵢφ = 0`). Would drop the two hypotheses, or say in the docstring that they are kept only to match the surrounding statements; the Lipschitz hypothesis belongs to the finiteness statement next to it.

## C03 — The polar divergence in the half-disk Check of §3.2 is written with the wrong power of `r`

In the Checks of §3.2 (line 1574): "`div(a∇u) = r^{−1}∂_r(s r^s sin θ) + r^{−1}∂_θ(s² r^{s−1} cos θ) = s² r^{s−1} sin θ − s² r^{s−1} sin θ = 0`". Each term is `s² r^{s−2} sin θ` in absolute value (`r^{−1} · s² r^{s−1}`), not `s² r^{s−1} sin θ`. The cancellation and the conclusion stand; the exponent should read `s − 2` twice.

## C04 — Sarason's Theorem 1 is stated on the real line

§2.4 (line 1389) defines `VMO(ℝⁿ)` and cites "Sarason, *Trans. Amer. Math. Soc.* 207 (1975), Theorem 1" for the closure characterization. The paper's Section 2 concerns functions on the real line (p. 392, opening of Section 2), and Theorem 1 (p. 392) is stated there, with a fourth condition through the Hilbert transform. The equivalence used here, vanishing mean oscillation against the BMO-closure of the uniformly continuous functions, is true in `ℝⁿ`, but the reader is sent to a one-dimensional theorem. Would write "(Sarason, …, Theorem 1, (i) ⇔ (ii), on `ℝ`; the same mollification argument in `ℝⁿ`)".

## C05 — The description still describes an earlier head

The description says "Adds Lane G to the PDE roadmap … built on A.6's Lipschitz charts … Lane G builds on Lanes A and D". The head has no Lane G, no A.6 and no Lanes, and the description does not state the change to `Suggested.lean`, which is now sixteen declarations.

Text that would be right: "Revises the PDE roadmap on main: adds §1.8 (A8: admissible boundary parts, `W^{1,p}_Γ(Ω)`, Lipschitz shears, the trace characterization, Poincaré–Friedrichs) to Layer 1, and §4.5 (D20: mixed and Neumann problems) and §4.6 (D21: their spectra) to Layer 4. No section of main is removed or renumbered. `Suggested.lean` gains the definitions `w1pVanishingOnSubmodule`, `IsMixedEigenvalue` and `mixedEigenvalue` and thirteen theorems (`w1pVanishingOnSubmodule_frontier`, `exists_poincare_friedrichs`, `existsUnique_weakSolution_mixed`, `neumann_solvable_iff` and the nine statements of §4.6), with two new Tau Ceti imports. The off-diagonal Marcinkiewicz statement of §2.2, the Meyers citation of §5.2 and a Check of §6.2 are corrected; Brezis is added to the references. No roadmap supplier is added or dropped."

## N01 — §4.6 dates itself by a commit and a pin bump

The realization bullet and the `*Needs:*` line of §4.6 (lines 2041, 2062–2072, 2099) say "Tau Ceti `main` (`b2350004c`, after the pin)", "once the pin includes it" and "at the next pin bump", and name `TauCeti.IsCoercive.formOperator`, `TauCeti.PDE.dirichletOperator` and `isLeast_dirichletEigenvalue` in files that the pinned revision does not have (`Analysis/InnerProductSpace/Variational/` holds `Fredholm`, `Rayleigh` and `Spectrum` only, `Analysis/PDE/Spectrum/` holds `Basic` and `Interval` only). A reader a year from now cannot tell what "the next bump" was. Would state the target on its own ("the realization is built from the solution operator, as §4.4 asks for Dirichlet") and keep the library's later operator out of the `*Needs:*` line.

## Questions for the author

- §1.5 and §1.6 cite Evans, §5.8.1 Theorem 1, §5.5 Theorems 1–2 and §5.7 Theorem 1 for bounded Lipschitz domains. I recall these as stated for `C¹` boundaries, as the docstring of `exists_extension` already says of §5.4 Theorem 1; should the other three say so too? The book is not legally readable here.
- §5.5 cites Gilbarg–Trudinger, Theorem 9.22, for the Harnack inequality of strong solutions (`harnack_of_isStrongSolution_ball`). I recall Theorem 9.22 as the weak Harnack inequality and the full inequality as Corollary 9.25; the book is not readable here.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 interval classes | `x`, `x²` on `(0,1)` | `∫xφ' = −∫φ`; `∫x²φ' = −∫2xφ`; endpoint values `(0,1)` | true | none |
| §1.2; `dense_contDiffOn_representatives_wkp` | `x^{3/2}`, `k = 2`; pinned lemma | `((3/4)x^{−1/2})² = (9/16)x^{−1}` not integrable; `exact Wkp.dense_contDiffOn_representatives hp k` closes it | true, already pinned | R02 |
| §1.4 embeddings | `\|x\|^{−a}`; `x(1−x)`; `\|x\|^{3/4}`, `\|x\|^{1/4}` | `ap* < n ⇔ (a+1)p < n`; `1/4 ≤ 1/2`; `(9/16)\|x\|^{−1/2}` integrable, `(1/16)\|x\|^{−3/2}` not | true | none |
| §1.5 Poincaré | `x(1−x)`; dilation | `1/30`, `1/3`, ratio `1/√10 < 1/π`; `R^{n/p}` against `R^{n/p−1}`; `n/p − 1 = n/p*` | true | none |
| §1.8 `W^{1,p}_Γ`, Poincaré–Friedrichs | `(0,1)`, `Γ = {0}`, `∅`; rooms | `\|u(x)\| ≤ x^{1−1/p}‖u'‖_p`; sharp `2/π`, `λ₁ = π²/4`; `2^{kp}·2^{−k(p+3)} = 2^{−3k}`, `(4/3)4^{−k}` | true | none |
| §1.8 Lipschitz shears | `Φ_ε(s,t) = (s, t − γ_ε(s))` | `det = 1`; `Φ(U') ⋐ V` and uniform convergence give `Φ_ε(U') ⊆ V` | true | none |
| §2.2 off-diagonal Marcinkiewicz | `Tf = (∫_0^1 f)\|x\|^{−1/2}`, `(1,2)`, `(2,2)` | `‖h‖_{2,∞} = √2`, `‖h‖₂ = ∞`; now excluded by `q₀ ≠ q₁` | true | none |
| §2.4 BMO, VMO | `log\|x\|` on `(−1,1)`; `[x, H]` | `f_B = −1`; `∫\|x\|^{−c} < ∞ ⇔ c < 1`; kernel `(x−y)/(π(x−y)) = 1/π` | true | C04 |
| §3.2 half-disk Check | `u = r^s sin θ` | `r^{−1}∂_r(s r^s sin θ) = s² r^{s−2} sin θ`; second term `−s² r^{s−2} sin θ` | sum `0`; exponent misprinted | C03 |
| §3.3 Harnack | `1 + x₁`; Poisson kernel at `±rξ` | `(5/4)/(3/4) = 5/3`; `(1+r)/(1−r)^{n−1}` over `(1−r)/(1+r)^{n−1}` `= ((1+r)/(1−r))ⁿ` | true | none |
| §3.4 potentials | ball of `ℝ³`, `f = 1`; half-line kernel | `−Δ(3−\|x\|²)/6 = 1`, trace `1/3`, `(1−\|x\|²)/6`; `c₁ = Γ(1)/π = 1/π` | true | none |
| §4.2 lifting | `−u'' = 1`, `g = x`; `g = 1` | `x(1−x)/2 + x`; constant `1`, difference `0 ∈ H¹₀` | true | none |
| §4.5; `existsUnique_weakSolution_mixed`, `neumann_solvable_iff` | `−u'' = 1`: `Γ = {0}`; `Γ = ∅`, `h(1) = −1` | `x − x²/2`; `∫(−x)v' = ∫v − v(1)`; `v = 1` gives `∫f + ∫h = 0` | true | none |
| `mixedEigenvalue`, `isLeast_mixedEigenvalue` | infinite-dimensional `W`; `(0,1)`, `Γ = {0}` | `finrank = 0` excludes it; value map injective on `W^{1,2}`; `W = span` of first `k+1` eigenfunctions gives `λ_k` | true | none |
| `exists_hilbertBasis_mixedEigenvalue`, `mixedEigenvalue_spectrum` | `(0,1)`: `Γ = ∅`, `{0}`; square | `m²π²`; `(m+½)²π²`; `π²/4 < 5π²/4 < 9π²/4`; dense range needs `Γ ∩ Ω = ∅` | true | none |
| `neumann_kernel_iff_isLocallyConstant` | arbitrary open `Ω`; `(0,1) ∪ (2,3)` | `v = u` gives `∇u = 0`; partition of unity gives `∫g∂ᵢφ = 0`; kernel dimension `2` | true without `hΩ`, `hb` | C02 |
| `finite_connectedComponents_of_isLipschitzDomain` | two quadrilaterals under `γ = max(0, 3 − 3\|s\|)`; `n = 0` | chart at `(−2,0)`, `r = 3`, `h = 1` meets both components; `r' < h/Lip γ` meets one | statement true, sketch false | R01 |
| `isLeast_rayleigh_meanZero_mixedEigenvalue_one` | `(0,1)`; `(0,1) ∪ (2,3)` | `cos πx`: `π²`; `x − ½`: `1/(1/12) = 12 > π²`; disconnected: quotient `0` | true | none |
| `exists_isSelfAdjoint_mixedLaplacian` | `(0,1)`, `Γ = ∅` | graph single-valued by density of values; resolvent at `−1` has eigenvalues `1/(1+m²π²)` | true | none |
| `isMixedEigenvalue_frontier_iff` | pinned `IsDirichletEigenvalue` (`Spectrum/Basic.lean:213`) | same formula on `W1p0`; needs `w1pVanishingOnSubmodule_frontier` | true, a comparison | none |
| §5.1; `exists_wkp_two_of_lipschitz_coefficients` | `a = 1 + 1_{x>0}`; pinned `Interior.lean:787` | `u' = C/a` jumps; pinned conclusion identical, hypothesis weaker | true, already pinned | R02 |
| §5.4; the two ball theorems | `u = x₁`; `a = I + x₁J` | `r^{−α−n/2}·r^{1+n/2} = r^{1−α}`; `div(x₁J∇u) = −∂₂u`, `u = e^{x₂}` | true; pin wider than stated | C01 |
| §6.2 Galerkin | `e^{−t} sin x`; jump; backward heat | `(π/2)e^{−2t} + (π/2)(1−e^{−2t}) = π/2`; `3C/2 + 1/4 = 0`; `e^{k²(T−t)} sin kx` solves it | true | none |
| §6.4 parabolic Hölder | distances; `cos ωx`; `√t` | `d((0,0),(0,4)) = 2`; `ω ≤ ½(εω² + 1/ε)` at `ε = 1/ω`; `t^{−α/2}` unbounded | true | none |
| §7.1, §7.3 blocks and paraproducts | `\|ξ₀\| = 2^j`; `f = 1` | `ψ(2) = 1`, `ψ(1) = ψ(4) = 0`, block `P_{j−1}`; `Σ_{j≥2}P_j g + P_0 g + P_1 g = g` | true | none |
| §8.1 dispersive kernels | Gaussian, `d = 1`; Tao's `Δ/2` | `\|1 + 4πit\|^{−1/2} = (1+16π²t²)^{−1/4} ≤ (4π\|t\|)^{−1/2}`; `(2πi·2t)^{−d/2} = (4πit)^{−d/2}` | true | none |
| §8.3 wave Strichartz | `d = 4`, `(2,6)`; `d = 3`, `(2,∞)` | `1/2 + 3/12 = 3/4`; `s = 2 − 2/3 − 1/2 = 5/6`; `1/2 = (d−1)/4` excluded | true | none |
| §9.1 global input | `x(1−x)/2`; `\|x\|^{−γ}`, `d = 3` | `1/8 + 1/2 ≤ 1`; `Δ\|x\|^{2−γ} = (2−γ)(3−γ)\|x\|^{−γ}`; `2 − γ ↓ 2 − 3/q` | true | none |
| `hopf_boundary_point`, Calderón–Zygmund pair, Krylov–Safonov pair, Schauder | `−(x+1)`; `x·f(x)`; `n = 1`; `x₁²` | quotient `1 > 0`; `R² + R + 1/3 → ∞`; `\|u'(x) − u'(y)\| ≤ ‖f‖₁/λ`; `0 ≤ C(4r^{−α} + 2r^{−α})` | true | none |

- Source locators checked against the text: 14 (`tao-dispersive` lines 3604, 3688, 3856–3871, 3875–3878, 4023, 4052–4056; `armstrong-kempe` lines 112, 131–136, 197–200; `bauer-pauly-schomburg` lines 340–341, 414, 1110; Rosales, arXiv:1806.07003, Theorem 4.1 on p. 9, Remark 4.2 on p. 13, `n ≥ 2` on p. 2; Sarason, Section 2 and Theorem 1 on p. 392; Lunardi, Corollary 4.2.10).
- Library declarations opened at the pin `2fd255d`: `Analysis/Sobolev/Wkp/MeyersSerrin.lean:291`, `Wkp/SmoothDensity.lean:92`, `Analysis/PDE/Regularity/Interior.lean:787`, `Regularity/HolderContinuity.lean:184`, `Regularity/Harnack.lean:328`, `Regularity/Hessian/Schauder/Interior.lean:341`, `PDE/DirichletProblem.lean:366`, `PDE/Spectrum/Basic.lean:213`, `PDE/Ellipticity/Basic.lean:154,197`, `InnerProductSpace/Variational/Spectrum.lean:550`, `Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:129,140`, `Resolvent/Compact.lean:68`, `Sobolev/LipschitzDomain/Basic.lean:482`, `LipschitzDomain/RellichKondrachov.lean:53,71`, `LipschitzDomain/GlobalExtension.lean:142`.
- Automatic checks: all pass at this head. Dependency check: `depcheck: 200 roadmaps, 2203 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 28 diagnostics, all `declaration uses sorry`. One-tactic probe (`first | rfl | simp | infer_instance`) on a copy: none of the 28 closes; `exact` with one pinned lemma closes one (R02).
- Signatures: the elaborated types of the 35 declarations read against the README; the §4.6 declarations carry `[mu.IsAddHaarMeasure]` and their domain hypotheses in their own binders; none lost a binder. README `λ₁` is index `0` in Lean, as both say.
- Cross-roadmap citations: none unresolved; no roadmap supplier added. Eight Lean names in the README are not found at the pin under those names; two are this file's own, two are the after-the-pin names of N01, the rest are main's text.
- Overlap check: read CompressibleEulerEquations, IncompressibleFlows, SchrodingerOperatorsAndSpectralTypes (open) and ComplexHessianEquations, SobolevPolynomialApproximation, YangMillsConnectionsAndCaloricGauge (main); nothing shared. No second owner of `W^{1,p}_Γ`, Poincaré–Friedrichs or the mixed and Neumann problems; the Lipschitz-domain predicate has two forms, PDE's own and the pinned `Set.IsLipschitzDomainWith` that SobolevPolynomialApproximation and SobolevDifferentialForms cite (see the human reviewers).
- Previous findings: R01 (Marcinkiewicz, `q₀ = q₁`) repaired at line 1285 with the witness as a Check (line 1312); C02, C04, C05, N01, N02 repaired; C01 partly (the revision label and the closing bullet changed, the older citations did not: C01 here); C03 not repaired (C05 here). Both earlier questions are answered in the text (Grafakos, Theorem 1.4.19; the local shear argument).

Source independence: 11 passages compared with 6 sources (`tao-dispersive`, `armstrong-kempe`, `bauer-pauly-schomburg`, Rosales, Sarason, Lunardi), none shared beyond formulas; largest share Gilbarg–Trudinger, about 30 of 115 locators, its text and table of contents not read; contents compared with the chapter list the README's References give for it (Layers 1, 3, 4–5 against Chapters 7, 2–4, 8, 6, 9, not in order; Layers 2 and 6–9 outside it): independent.

Research link: §1.8 extends to every dimension and finite `p` the density and Poincaré–Friedrichs results of Bauer–Pauly–Schomburg (2016, Lemma 3.1, Theorem 4.8); §5.4 is De Giorgi–Nash–Moser as formalized by Armstrong–Kempe (arXiv:2604.05984); Layer 8 states the Strichartz estimates of Keel–Tao (1998) and Tao (2006). Rests on the README's References and the texts read.

## Not verifiable

- Evans, Gilbarg–Trudinger, Leoni, Brezis, Grafakos (both books), Stein (both books), Adams–Fournier, Giaquinta–Martinazzi, Grisvard, Lieberman, Bahouri–Chemin–Danchin: books with no legal open copy found; their locators were not checked.
- Gehring (1973): the open archive refused the request; Coifman–Rochberg–Weiss (1976): paywalled; Meyers–Serrin (1964): the publisher's page refused the request.
- Axler–Bourdon–Ramey, Theorem 3.4: the author's copy was fetched but its text could not be extracted on this worker.
- The declarations §4.6 attributes to Tau Ceti after the pin (`formOperator`, `dirichletOperator`, `isLeast_dirichletEigenvalue`): that revision is not available here.
- The Lean names `holder_Moser`, `EllipticCoeff`, `quadratic_upper`, `mixed_bound` of the Armstrong–Kempe repository: not in the paper's text; the repository was not read.

## Source issues

- none

## For the human reviewers

- **Scope of this pull request.** R02 and C01 concern main's §1.2, §5.1 and §5.4 text, unchanged here; main's pin `2fd255d` also has `Analysis/PDE/Parabolic/Galerkin.lean`, `HeatKernel/Generator.lean` and `Regularity/Hessian/Schauder/Interior.lean`, not compared with Layers 5–6 in full.
- **Two Lipschitz predicates.** `Suggested.lean` defines `IsLipschitzDomain` on `EuclideanSpace ℝ (Fin (n+1))`; the pin has `Set.IsLipschitzDomainWith` on `WithLp 2 (ℝ × E)` with finite-`p` Rellich, Poincaré–Wirtinger, trace and extension (`LipschitzDomain/RellichKondrachov.lean:53,71`), which §1.5–§1.6 restate.
- **Not tested.** Gilbarg–Trudinger and Evans carry the largest shares of locators (about 30 and 20 of 115); neither text nor contents page was read, so wording and arrangement were not compared against them.
- **Licence.** `README.md` lines 3464–3470 describe names taken from `scottnarmstrong/DeGiorgi` (stated Apache-2.0); the repository and its licence file were not opened.
