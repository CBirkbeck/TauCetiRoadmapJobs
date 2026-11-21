# Review of SpecialFunctionsRankOneSymmetricSpaces (pull request #2935 at 4d6f1a4)

**Verdict:** needs changes

**Summary.** Changes are needed: five findings. Two are false formulas (the complementary-series kernel of 3.4 is not integrable on half of the stated range, and the proof route of 0.2 misquotes DLMF 15.4.15); two are about ownership (the classical Paley–Wiener theorem and Carlson's theorem are attributed to Mathlib, which has neither, and the hyperboloid model already has an owner on main that is not cited); one is a statable headline missing from `Suggested.lean`. There are five small corrections and one format note, none blocking. Every numerical Check I recomputed agrees with the README, and every `Suggested.lean` statement survived its degenerate cases. Only the DLMF could be read; the locators into the four books are unverified and are listed for the human reviewers.

## R01 (P2) — The complementary-series kernel `|b − b'|^{2(iλ−ρ)}` of 3.4 is not integrable for `λ ∈ i(0, ρ)`

The last bullet of 3.4 (README line 737) says that for `λ ∈ i(−ρ, ρ) \ {0}` the invariant form has a kernel that is "a positive multiple of `|b − b'|^{2(iλ−ρ)}`, an integrable kernel on `S^{n−1} × S^{n−1}`". An implementer who builds the form from that kernel for `Im λ > 0` integrates a divergent kernel.

At `λ = iη` the kernel is `|b − b'|^{−2(ρ+η)}`. The sphere has dimension `n − 1 = 2ρ`, so the kernel is integrable exactly when `2(ρ + η) < 2ρ`, that is `η < 0`. For `n = 2`, `η = 1/4`: `|b − b'|^{−3/2}` on the circle, divergent. The exponent itself is right as the intertwiner `π_λ → π_{−λ}`: with `k(b, b') = [b̃, b̃']^s` and the Jacobian `(g⁻¹b̃)₀^{−2ρ}` of 2.4, `A π_λ(g) = π_{−λ}(g) A` forces `s − iλ + ρ = 0`.

Smallest change: state the bullet for `λ ∈ i(−ρ, 0)`, where the kernel is `|b − b'|^{−2(ρ−|η|)}` and integrable, and obtain `λ ∈ i(0, ρ)` from the equivalence `π_λ ≅ π_{−λ}` (or say that there the kernel is the analytic continuation, not an integrable function).

## R02 (P2) — The proof route of 0.2 misstates DLMF 15.4.15

README line 187 gives `(2 − 4a) sinh t · F(a, 1 − a; 3/2; −sinh² t) = sinh((2 − 4a)t)`. This is false, and it does not give the case of `ℍ³` that it is cited for: with `a = (1 + iλ)/2` it would give `sin 2λt/(2λ sinh t)`.

DLMF 15.4.15 at `z = sinh t` reads `F(a, 1 − a; 3/2; −sinh² t) = (e^{(1−2a)t} − e^{−(1−2a)t})/((2 − 4a) sinh t)`, so the right side is `2 sinh((1 − 2a)t)`. At `a = 0.3`, `t = 1`: left side `0.82150 46516`, `2 sinh(0.4) = 0.82150 46516`, `sinh(0.8) = 0.88810 59822`. At `a = 0` the left side is `2 sinh t` and the README's right side is `sinh 2t`.

Smallest change: replace the right side by `2 sinh((1 − 2a)t)`. The stated theorem `jacobiFunction_sin` is correct.

## R03 (P1) — The classical Paley–Wiener theorem and Carlson's theorem are attributed to Mathlib, which has neither

The supplier contracts list under Mathlib "the Fourier transform on `ℝ` with the classical Paley–Wiener theorem" (line 987), 1.3 needs "Mathlib Fourier transform and the classical Paley–Wiener theorem" (line 466), and 0.4 needs "Mathlib Carlson-type uniqueness" (line 305). The Paley–Wiener theorems of 1.3, 4.2 and 4.3, the surjectivity of the unitary map of 1.2 and the Laplace-type representation of 0.4 rest on these two inputs, so they have no owner as written.

A case-insensitive search of the pinned Mathlib for `paley` returns no file, and `carlson` returns none either (the pinned Tau Ceti has `Carlson` only for the symmetric elliptic integrals). Mathlib has the Phragmén–Lindelöf principle (`Mathlib/Analysis/Complex/PhragmenLindelof.lean`), which is an input to Carlson's theorem and not the theorem.

Smallest change: for Paley–Wiener, cite AutomorphicSpectralTheory §1.6 on main, which records the Euclidean theorem as the target `euclidean_paley_wiener` for smooth functions supported in a ball (`TauCetiRoadmap/AutomorphicSpectralTheory/README.md` line 889), and adjust the sentence of the scope section that says this roadmap does not depend on that one; or state the one-variable theorem here as a target. For Carlson, cite SpecialFunctionsGamma §10.1 (an open new roadmap, which states it) or state it here; the alternative "or a direct proof" in the Needs line can stay.

## R04 (P2) — The hyperboloid model of hyperbolic space has an owner on main that the roadmap does not cite

Layer 2 builds the hyperboloid, its Lorentz group action, its distance, its Riemannian volume and its Laplace–Beltrami operator, and the scope section draws the boundary with RealSemisimpleLieGroups and LieGroups only. RiemannianGeometry R4.7 on main already owns the hyperboloid model as a Riemannian manifold: the metric restricted from the Lorentz form, explicit isometries, geodesics, curvature `−1`, and "the identification of the isometry group of the hyperboloid model with O⁺(n,1), with its action on the future unit hyperboloid" (`TauCetiRoadmap/RiemannianGeometry/README.md` lines 1742–1777). Two bullets here assert facts about that metric without it: "`d` is a metric on `ℍⁿ`" in 2.1 and "`m` is the Riemannian volume of the metric `g_{ij}`" in 2.2, and 2.3 says `Δ` "is the Laplace–Beltrami operator" of it. As written the model has two owners and two carriers with no comparison.

Smallest change: add a boundary paragraph naming RiemannianGeometry R4.7 as owner of the Riemannian hyperboloid model and its isometry group, say that this roadmap owns the coordinate set, the volume in polar and horospherical coordinates, the wave-operator form of the Laplacian and the harmonic analysis, and turn the three bullets above into comparisons with R4.7's metric (as 2.1 already does for RealSemisimpleLieGroups §5.2), with R4.7 in their Needs lines.

## R05 (P2) — The Paley–Wiener theorem of 1.3 and the inversion with discrete terms are statable but absent from `Suggested.lean`

"How to read the build" names four hard theorems; three are in `Suggested.lean` and the Paley–Wiener theorem of 1.3 is not. The summary also announces "the discrete terms that appear when `|β| > α + 1`", and that inversion formula is absent too. The module docstring says only that the other headlines are stated in prose; it names neither and gives no missing carrier. Both are statable with the file's own definitions: the first as an iff between "`g = jacobiTransform α β f` for some smooth even `f` with `tsupport f ⊆ Icc (−R) R`" and "`g` entire, even, and for every `N` bounded by `C (1 + ‖λ‖)^{−N} exp(R |Im λ|)`"; the second with a finite sum over `j` and `d(λ_j) = (∫ φ_{λ_j}² Δ)⁻¹`.

Smallest change: state both, or name each in the module docstring with the reason it is not stated.

## C01 — Three statements of `Suggested.lean` close with one tactic

On a copy of the file, `hyperbolicDist_mulVec` closes with `simp [hyperbolicDist, g.2.1]` (it is the defining property of `lorentzGroup`), `jacobiFunction_even` with `simp [jacobiFunction]`, and `jacobiTransform_neg` with `simp [jacobiTransform, jacobiFunction_neg_spectral]`. As targets they ask an implementer for nothing. Would you mark them as sanity checks, or keep them in the README only?

## C02 — The proof route of 1.2 shifts the contour the wrong way

Line 400 shifts the integral of `f̃(λ) c(−λ)⁻¹ Φ_λ` "into `Im λ < 0`" and then uses that `c(−λ)⁻¹` has no poles in `Im λ > 0`. Since `|Φ_λ(t)| ~ e^{−(Im λ + ρ)t}` decays as `Im λ → +∞` and `Φ_λ` has its poles at `λ = −ik`, the shift is into `Im λ > 0`, which is also where the poles `λ_j` of 1.3 lie.

## C03 — The negative control of 2.5 needs `n ≥ 2`

"`(SO₀(n, 1), {1})` is not a Gel'fand pair, since `G` is not abelian" (line 624): for `n = 1`, which Conventions admit, `SO₀(1, 1) ≅ ℝ` is abelian and the pair is a Gel'fand pair. Add "for `n ≥ 2`".

## C04 — The last bullet of 0.3 states `c(λ) ≠ 0` without its hypotheses

"`c(λ) ≠ 0` for real `λ ≠ 0`" (line 226) holds for real `α, β` with `α + 1 ∉ {0, −1, …}`. For complex parameters a denominator Gamma factor can have a pole at a real `λ` (take `ρ = −2 − iλ`), and at `α + 1 ∈ {0, −1, …}` the value is `0`. Put the hypotheses before both claims of the bullet.

## C05 — "Layers 0 and 1 … depend only on the hypergeometric function and the Gamma function" overlooks 0.5

Section 0.5 needs SpecialFunctionsSU11MatrixElements §§1.1–1.3 and 0.1 needs LaguerreJacobi §3.2 (lines 56–57 against 343 and 170). Say "apart from 0.5 and the polynomial case of 0.1".

## N01 — Two docstrings name hypotheses their statements do not carry

`jacobiFunction_eq_cFunction` ("and `α ∉ {−1, −2, …}`") and `jacobiOperator_harishChandraSeries` ("for `iλ ∉ {1, 2, …}`"). Both statements are true without them, because both sides are `0` at the junk values; the docstrings could say so.

## Questions for the author

- Does Klimyk–Vilenkin (EMS 59), p. 233, state the inversion and Plancherel formulas with the hypotheses `α > −1`, `|β| ≤ α + 1` and the discrete terms with `d(λ) = −i Res (c(μ) c(−μ))⁻¹`, or does it refer to Koornwinder (1984) for them? The README says Koornwinder is read only through the books; I could not read either text.
- Which locator states the Paley–Wiener theorem of 1.3 for the Jacobi transform at general `α ≥ β ≥ −1/2`? The sources of 1.3 are cited for the poles, the residues and the spherical case (Heckman–Schlichtkrull §5.4); I could not open them to see whether one covers the general statement.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 0.1 definition, DLMF 15.9.11 | `φ_{0.5}^{(1,0)}(1)`; `k = 1, 2` at `(1, 1/2)`, `t = 0.7` | `0.6087020756`; `2.0070361572`, `4.9554815522`; README the same | agrees |
| 0.1 uniqueness | exponents `0`, `−2α`; `Re α = 0`, `α ≠ 0`; `α = −1/4` | `t^{−2iy}` has no limit at `0`; `t^{1/2}` continuous | hypothesis `Re α ≥ 0` needed and sufficient |
| 0.1 polynomial case, local `jacobi` | binomial form of DLMF 18.5.8 | `(α+n−k+1)_k/k!`, `(β+k+1)_{n−k}/(n−k)!` match | agrees; copy verbatim |
| 0.2 Fourier, `ℍ³`, quadratic | `cos 2`; `sin 1/sinh 1`; `α = 1.3`, `λ = 0.7−0.2i`, `t = 1.4` | `−0.4161468365`; `0.7160229154`; both `0.4739125261+0.0300453896i` | agrees |
| 0.2 proof route, 15.4.15 | `a = 0.3`, `t = 1` | `0.8215046516` against `sinh 0.8 = 0.8881059822` | R02 |
| 0.3 `c`-function, DLMF 15.9.13–14 | `c(−iρ)`; `(1/2,−1/2)`; `(0,−1/2)` at `λ = 1`; `(1.3,0.2)`, `λ = 0.7−0.4i` | `1`; `1/(iλ)`; `3.1298810356`; `0.6769696453−6.1381888302i` | agrees |
| 0.3 connection formula and asymptotics | `(0.3,−0.8,1.1+0.3i,0.6)`; `t = 30` | both `0.9069462413−0.0433537337i`; limit `0.67696965−6.13818883i` | agrees |
| 0.3 growth of `|c|⁻²` | Stirling exponents; `λ → 0`; double pole | `2α + 1`; bounded unless `α ≤ −1` | agrees |
| 0.4 energy and exponential bounds | 14 parameter pairs incl. `ρ = 0`, `β = 20`; 5600 random `(λ, t)` | max of `log|φ| − |Im λ|t` is `−0.0033` | no counterexample |
| 0.4 negative controls | `(−1/4,−3/2)`, `λ = 0.3`, `t = 3`; strip at `t = 10, 20` | `5.4728488029`; `16.3467448467`, `328.3331470238` | agrees |
| 0.4 Laplace and product formulas | constant at `t = 0`; `(1.3,0.2)`, `λ = 0.7−0.4i` | `C ∫∫ w = 1`; `0.58009+0.02910i` against `0.58005+0.02911i` (my quadrature, 4 digits) | agrees |
| 0.4 bound by `Im λ`; boundedness | 6 pairs, 1800 random points; zeros of `c` for `Im λ < −ρ` | max difference `−5·10⁻¹⁰`; none | agrees |
| 0.5 `𝔓^τ_{mn}` as Jacobi function | 7 pairs `(m, n)`, `t = ±1.3`; zonal values | `(2,−1)`: both `−0.0115064149−0.0159750333i`; `0.8654573797`, `0.8331690033` | agrees |
| 1.1 weight, DLMF 15.9.12 | `(−1/2,−1/2)`; factor-2 control at `λ = 0.7` | `Δ ≡ 1`; `0.31194` against `0.07799` | agrees |
| 1.2 inversion, Plancherel | cosine case; Mehler–Fock; `(1, 1/2)`, `e^{−t²}` | `2/π`; `λ tanh πλ/2`; left side `23.7387164498` | agrees |
| 1.3 discrete terms | `(0, 3/2)`: `φ_{i/2} = cosh⁻³ t` | `∫ φ² Δ = 32`, `d = 1/32` | agrees |
| 2.1 hyperboloid, group, distance | `n = 0, 1`; `diag(−1,−1,1)`; Euclidean distance | trivial, `ℝ`; lower sheet; `1.2946174807` | agrees |
| 2.2 volume | `n = 1`; horospherical Jacobian; disc, ball | `ω₀ = 2`; `x₀ ds · e^{−ms} dv`; `3.4122762653`, `5.1109327057` | agrees |
| 2.3 Laplacian | sign via `□ = ∂_r² + (n/r)∂_r − r⁻²Δ`; `Δ x₀` | `Δ = −□` on degree 0; `n x₀` | agrees |
| 2.4 plane waves, Jacobian | `μ(μ−n+1)` at `μ = iλ+ρ`; `n = 2`, `a_{0.8}` | `−(λ²+ρ²)`; `0.5000000000` and `0.5721806070` | agrees |
| 2.5 Gel'fand pair | `n = 0, 1`; negative control at `n = 1` | trivially true; `SO₀(1,1)` abelian | statement fine; C03 |
| 3.2 spherical functions | `n = 1` | `cos λ(s+t) ≠ cos λs cos λt` | `n ≥ 2` needed, present |
| 3.4 principal series | unitarity; multiplier at `a_t`; kernel at `λ = iη` | `Im λ = 0`; `e^{(iλ+ρ)t}`; `|b−b'|^{−2(ρ+η)}` | R01 |
| 4.1 spherical transform | `C₂, C₃, C₄`; Plancherel constant | `1/(2π²)`, `1/(2π²)`, `2/π³`; same `C_n` both formulas | agrees |
| 4.2 Abel transform | `m = 0, 1, 2`; `e^{−cosh t}(1+t²)` at `s = 0.7` | `F(|s|)`; `√2 ∫ …`; `5.3482274281` | agrees |
| 4.3 Helgason–Fourier | radial case; `μ = ρ − iλ`; `n = 1` | reduces to 4.1; `−(λ²+ρ²)`; `−λ²` | agrees |
| 4.4 | `ℍ³` Plancherel left side | `π √(π/2)(e^{1/2} − 1) = 2.5542767443` | agrees |

- Source locators checked against the text: 10 (DLMF 15.9.11–15.9.14, 15.4.11, 15.4.15, 15.8.1, 15.8.2, 18.5.7, 18.5.8); one misquoted in the README (R02).
- Library declarations opened at the pin: 10 pinned by `#check` in the file, all elaborate; `Mathlib/Analysis/SpecialFunctions/Arcosh.lean` line 61; `Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` line 192 (series only, no continuation); no Paley–Wiener or Carlson theorem.
- Cross-roadmap citations resolved: SpecialFunctionsHypergeometric Layers 1, 3, §§1.3, 4.1, 5.1, 7.1; LaguerreJacobi §3.2; ZerosOfLFunctions §1.3; NoncompactQuantumSymmetry M4, M4.Lorentz; RealSemisimpleLieGroups §§5.2, 5.3, 5.7; LieGroups Layer 9; AutomorphicSpectralTheory §§0.35–0.37; AnalyticNumberTheoryPartII §6.12c; SpecialFunctionsGroupModels Layer 1, §§1.3, 2.1, 5.1–5.4 and SpecialFunctionsSU11MatrixElements §§1.1–1.3, 2.1, 5.2–5.3 at their open heads. All exist and say what is cited.
- Local copies compared with the suppliers' files: Euler's integral, the continuation predicate, `𝐅`, `F` and `jacobi` are verbatim.
- Dependency check: `depcheck: 171 roadmaps, 1990 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: no error, `sorry` the only warning; 56 theorems, 56 `sorry`, no sorry'd data, no `set_option`. Elaborated signatures compared with the README: the two dropped binders are the unused topology and measurable-space instances of the copied `IsBiInvariant` and `conv`, as in the supplier; nothing changed.
- One-tactic probe: 6 statements tried, 3 close (C01).
- Pull request text read against the head: the counts (56 headlines, 37 proved in the prior formalization, 18 stated there, 1 new) and the supplier lists agree with the head.

Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsSU11MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsLegendre (open) and searched SpecialFunctionsAppell, SpecialFunctionsBessel, SpecialFunctionsGeneralizedHypergeometric (main); Gel'fand pairs and spherical functions: GroupModels; `𝔓^τ_{mn}` and Mehler–Fock: SU11MatrixElements; Jacobi function, `c`-function, Jacobi and Abel transforms: this roadmap (SpecialFunctionsLegendre §11.3 gives the Jacobi function no definition); hyperboloid model: RiemannianGeometry R4.7, uncited (R04).

Source independence: 10 passages compared with 1 source (DLMF), none shared beyond formulas; largest share Wawrzyńczyk, 26 of 71 source mentions in the layers; its text and contents page could not be read; by the README's own locators no layer maps onto one chapter (Layer 2 draws on §§11.2, 11.4, 11.5, 18.1; Layer 4 on §§11.3, 18.6–18.8): independent as far as tested.

Research link: The Jacobi transform with inversion, Plancherel and Paley–Wiener is Koornwinder's theory (1984) cited by DLMF §15.9(ii); Layer 4 is the rank-one case of the Helgason–Fourier analysis on symmetric spaces (Heckman–Schlichtkrull 1994), a prerequisite of the Selberg trace formula for hyperbolic manifolds. Rests on the README's references and DLMF §15.9.

## Not verifiable

- Every locator into Vilenkin–Klimyk Vol. 2, Klimyk–Vilenkin (EMS 59), Wawrzyńczyk and Koornwinder (1984): each resolves only to a paywalled publisher page.
- Every locator into Heckman–Schlichtkrull: no legal copy found.
- So, of the sampled targets, the book locators of 0.4, 0.5, 2.1–2.4, 3.2, 3.4 and 4.1–4.3 were not checked against a text; the mathematics of each was recomputed (table above), and the DLMF and supplier-roadmap locators of 0.1, 0.3, 0.5, 1.1, 2.5 and 3.2 were verified.

Automatic checks set aside as false positives: the report of a section header in `Suggested.lean` with no declaration under it (the header carries the `#check` lines that pin the Mathlib names the README cites, which the form rules allow); the report that `SU11.boostMatrixElement_eq_jacobiFunction` is found nowhere (it is declared in `Suggested.lean` inside the namespace `SU11`).

## Source issues

- none

## For the human reviewers

- **Not tested.** Wawrzyńczyk, *Group Representations and Special Functions* (1984), has the largest share of the locators (26 of 71 mentions); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
- **Licence.** README line 1060 says the roadmap reuses the names and conventions of the author's own lean-SFVK (Apache-2.0, commit `2a512fe`); `Suggested.lean` appears adapted from it. I did not open that repository.
- **Licence.** The inversion, Plancherel, discrete-term and Paley–Wiener theorems of Layer 1 go back to Koornwinder (1984), which README line 1102 says is "read here through" two secondary books; none of the three could be read.
