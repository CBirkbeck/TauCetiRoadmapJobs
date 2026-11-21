# Review of SpecialFunctionsHigherSpheres (pull request #2931 at c063187)

**Verdict:** needs changes

**Summary.** Changes are needed for one missing hypothesis: the prose target of 2.2 that every irreducible subrepresentation of `L²(S^{n-1})` is one of the `H_l` states no bound on `n` and is false for `n = 1`, and for `n = 2` over `ℂ`. Both findings of the previous review are repaired (the Gel'fand–Tsetlin index and the duplicated instances), and every identity and numerical Check I recomputed agrees with the text. There are two small corrections and two format notes, none blocking. None of the four books could be read legally, so no book locator was checked against its text; that, the reuse of names from the author's own formalization, and the ownership bounds of 4.6 are left to the human reviewers.

## R01 (P2) — The second target of 2.2 has no bound on `n`, and it fails for `n = 1`, and for `n = 2` over `ℂ`

The target reads "every irreducible subrepresentation of the quasi-regular representation is one of them" (2.2, second bullet, line 234), with no hypothesis on `n` and no coefficient field, while the bullet before it says "for `n ≥ 2`". An implementer who states it as written, or with the bound of its neighbour, states something false.

For `n = 1`: `SO(1)` is trivial and `L²(S⁰)` is two-dimensional, the sum of `H_0` (constants) and `H_1` (spanned by `x₁`). The line spanned by `1 + x₁` is invariant and irreducible and is neither `H_0` nor `H_1`. For `n = 2` over `ℂ`: the line spanned by the restriction of `(x₁ + i x₂)^l`, the character `e^{ilθ}`, is an irreducible subrepresentation of `L²(S¹; ℂ)` and is not the two-dimensional `H_l ⊗ ℂ`; the second Check of 2.2 says the same of `H_l ⊗ ℂ`. The route given (projection to some `H_l`, then Schur) needs `H_l` irreducible, which R8.3 supplies for `n ≥ 3` only, and the Hilbert-sum half of the bullet cites R8.2, which RiemannianGeometry states for `m ≥ 1`, that is `n ≥ 2`. Over `ℝ` the statement does hold for `n = 2`, since the real planes `H_l` are irreducible and pairwise inequivalent (traces `2 cos lθ`). Nothing later breaks: 2.3 uses the bullet only for `n ≥ 3`.

The smallest change: begin the bullet "for `n ≥ 3` (and for `n = 2` over `ℝ`)", and say that the Hilbert sum is for `n ≥ 2`. The last bullet of 6.2 (the restriction of `H^{p,q}(ℂ^{n+1})` to `U(n)`) would likewise repeat the bound `n ≥ 1` of the dimension count above it: at `n = 0` the count gives `0 ≠ 1` for `(p, q) = (1, 1)`.

## C01 — Three neighbouring roadmaps state special cases of targets here and are not named in "Scope and ownership"

A reader of the boundary paragraphs cannot tell that these statements exist elsewhere, or how the versions here differ.

- SpecialFunctionsHypergeometric §9.1, on main, states DLMF 15.9.5–15.9.7: `T_n`, `U_n/(n + 1)` and the Legendre polynomial as the terminating Gauss series `₂F₁(−n, n; ½; (1 − x)/2)`, `₂F₁(−n, n + 2; 3/2; ·)`, `₂F₁(−n, n + 1; 1; ·)`. These are the Chebyshev, second-kind and Legendre forms of 3.1 (`zonalPolynomial_two`, `zonalPolynomial_four`, `zonalPolynomial_three`), there as identities of functions for Mathlib's `ordinaryHypergeometric`, here as identities in `ℝ[X]` for the roadmap's own sum.
- GeometryOfNumbersAndQuadraticArithmetic §4.3, on main, states Hecke's identity `fourier_harmonic_gaussian`: the Fourier transform of `P(x) e^{−πt|x|²}`, `P` harmonic of degree `ℓ`, is `(−i)^ℓ t^{−ℓ−n/2} P(ξ) e^{−π|ξ|²/t}`. This is Bochner's theorem of 4.6 for a Gaussian radial factor, and at `t = 1` it is exactly the Check of 4.6 (`−i ξ₁ e^{−0.49π}`).
- SpecialFunctionsLegendre §3.4 (open) states the Funk–Hecke formula on `S²` in the `Y_{l,m}`; the boundary paragraph names its §3.2 only, and 4.3 here includes `n = 3`.

Would you add one clause for each to the boundary paragraphs, saying that the statement here is the general or polynomial form and that the cited one is its special case; the Check of 4.6 can name Hecke's identity.

## C02 — The rank-one roadmap is called a consumer of 4.4 and 6.5, but at its head it does not cite this roadmap

"Downstream consumers" (line 930) says that the roadmap on rank-one symmetric spaces "consumes the compact duals `S^{n-1}` and `S^{2n-1}` with their spherical functions (4.4, 6.5)", and the description repeats it under "Downstream". At its open head SpecialFunctionsRankOneSymmetricSpaces has no supplier section for this roadmap and no mention of it; its suppliers are Mathlib, SpecialFunctionsHypergeometric, LaguerreJacobi, ZerosOfLFunctions, SpecialFunctionsGamma, AutomorphicSpectralTheory, SpecialFunctionsGroupModels, SpecialFunctionsSU11MatrixElements, NoncompactQuantumSymmetry, RealSemisimpleLieGroups and RiemannianGeometry. It also declares its own `sphereMeasure n` as the unnormalized surface measure `toSphere` (used through an average), where `sphereMeasure n` here is the probability measure. Either drop the sentence in both places, or say what that roadmap would take from here once it cites it; the two normalizations of `sphereMeasure` are worth one clause.

## N01 — "Prior formalization" still records what an external repository proves at one commit

The section lists what a named commit "proves … without `sorry`" (line 1116); that will go out of date. A sentence that the names and conventions agree with that repository would be timeless. (Raised last round; the sentence about Checks was fixed, this was not.)

## N02 — The Layer 5 section comment of `Suggested.lean` uses another letter than the README

The Lean comment reads "branching `SO(n + 1) ↓ SO(n)`" and the README "`SO(m + 1) ↓ SO(m)`"; the declarations under it use `m`.

## Questions for the author

- 3.1, Route: is the comparison of the sum DLMF 18.5.10 (powers of `2x`) with the Gauss series in `(1 − t)/2` really "through Pfaff's transformation"? The passage between the two forms that I know is a quadratic transformation; Pfaff's is linear. I did not find a derivation by Pfaff's transformation and could not exclude one. The second route named there (the Jacobi relation of LaguerreJacobi §6.2) is sound.

## Verified sound

Previous findings, at this head: R01 (index of the Gel'fand–Tsetlin factor) repaired, "`ω_{j+1+2l_{j-1}, l_j - l_{j-1}}`" (5.2, line 679), with a new negative control; R02 (instances on Mathlib's groups) repaired, the file declares no instance and the docstring says the actions "are Mathlib's"; C01 applied in the second form offered (the bounds are called ownership boundaries and the excluded cases located); C02 repaired (`λ > 0`, `λ ≠ 1/2`; Gegenbauer form for `n ≥ 2`); C03 repaired (`not_exists_linearEquiv_harmonicRep` stated); C04 repaired ("(4.1–4.6)"); C05 repaired (no errata identifier left); C06 repaired (the six restatements are gone); C07 repaired ("irreducible over `ℝ`; its complexification…"); C08 repaired (the description lists SpecialFunctionsLegendre); N01 repaired (a paragraph on forward routes); N02 partly (N01 above).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 transitivity, double cosets | `n = 1`; `n = 2`, rotations `±0.5`; `η = 0` | `SO(1)` trivial, `1 ↛ −1`; both `cos 0.5 = 0.87758`, `K_η` trivial; stabilizer of `0` is the group | bounds `n ≥ 2`, `n ≥ 3` needed | none |
| 1.2 polar constant, density | `n = 2..6`; fourth moment `n = 2, 3, 5` | `c_n = 0.318310, 0.5, 0.636620, 0.75`; mass `1.0000000`; `0.375, 0.2, 0.0857143 = 3/(n(n+2))` | agrees | none |
| 1.3 Gel'fand pair `(SO(n), K_η)` | `η = 0`; non-unit `η`; `n ≤ 2`; `n ≥ 3` | `K = G`, constants commute; `K_η = K_{η/‖η‖}`; abelian; `⟪η, g⁻¹η⟫ = ⟪η, gη⟫` | true for all `n`, `η` | none |
| 2.1 closed dimension | `n = 3..9`, `l ≤ 9` exact; `n = 2`, `l = 0` | identity holds in `ℕ` in all 70 cases; `1 ≠ 0` at `n = 2`, `l = 0` | `n ≥ 3` needed | none |
| 2.2 inequivalence (Lean, `n ≥ 2`) | `n ≥ 3` dims; `n = 2`, `(l, l') = (1,2), (2,5), (3,4)` at `θ = π/(l+l')`; `n = 1` | dims strictly increasing, `n ≤ 9`, `l ≤ 12`; traces `±1.0000`, `±1.24698`, `±0.44504`; `H_0 ≅ H_1` at `n = 1` | true | none |
| 2.2 irreducible subrepresentations | `n = 1`; `n = 2` over `ℂ` and over `ℝ` | line of `1 + x₁` invariant, not `H_0`, `H_1`; `ℂ e^{ilθ} ≠ H_l ⊗ ℂ`; real `H_l` irreducible | false as written | R01 |
| 2.3 uniqueness | `n = 3`, `l = 2`; `n = 2`; misprint ratio | `(3x₃² − r²)/2` harmonic, value `1`; `dim H_l(ℝ²) = 2`; `C_2^{(1/2)}(1)/C_2^{(1)}(1) = 1/3` | agrees | none |
| 3.1 zonal polynomial (Lean body) | `n = 0..8`, `l ≤ 7`, exact rationals | value at one `1` for all `n`; parity, degree, Gegenbauer form (incl. `n = 2`: `1`, then `0`), `T_l`, `P_l`, `U_l/(l+1)` exact | agrees | C01 |
| 3.1 Checks | `t = 0.3` | `ω_{n,2} = −0.82, −0.365, −0.092` (`n = 2, 3, 6`); `T_3 = −0.792`; wrong parameter `−0.575` | agrees | none |
| 3.2 one-variable identities | `λ ∈ {−2, −1, −½, 0, ⅓, 1, 3/2, 5}`, `l ≤ 7`; `(λ, t, z) = (3/2, .4, .3), (−.7, −1, .5), (.3, 1, −.9), (2, −.3, .95)` | value at one and derivative exact; `1.2760615166`; `1.7641185338`; `0.6803742043`; `0.1635789437`, both sides | true for all real `λ` | none |
| 3.2 zonal derivative, equation | `n = 2..8`, `l ≤ 7`; control `(n − 2)` | exact; `ω_{5,4}' = 7 ω_{7,3}`; residual `−0.0374063` | agrees | none |
| 3.3 zonal harmonic | `n = 2..5`, `l ≤ 5`, `η = (1/3, 2/3, 2/3, 0…)`, `(3/5, 4/5)`; non-unit `η`; `P_2` in `ℝ⁴` | Laplacian `0`, `Z(η) = 1` in all 24 cases; `3` for `‖η‖² = 2`; `−1` | agrees | none |
| 3.4 Laplace integral | `(n, l, φ) = (3,2,.9), (5,3,.9), (4,5,2.1), (6,4,−.4)` | `0.0795984290`; `−0.0458759550`; `0.0064918679`; `0.5672946322`, imaginary parts `< 1e-16` | agrees | none |
| 4.1 addition theorem, reproducing | `n = 2` (`√2 cos lθ`, `√2 sin lθ`); `l = 0`; plane wave at `n = 2..5` uses it | `2 cos l(θ − θ') = 2 T_l`; `1 = 1`; series sums to `e^{0.92i}` with `dim H_l ω` | agrees | none |
| 4.2 orthogonality | `(n,l,l')`: `(3,2,2), (4,3,3), (6,2,2), (2,3,3), (2,0,0), (3,2,4), (5,1,3), (5,2,2), (7,4,4)` | `0.2, 0.0625, 0.05, 0.5, 1, 0, 0, 0.0714285714, 0.0054945055`; unweighted control `0.25` | agrees | none |
| 4.3 Funk–Hecke | `n = 3`, `f = exp`, `l = 2, 3` | `λ_2 = 0.0715628701 = (e − 7/e)/2`; `λ_3 = 0.0100650905`; `0.48 λ_2 = 0.03435018`; `−0.936 λ_3 = −0.00942092` | agrees | C01 |
| 4.4 zonal spherical functions, product formula | `l = 3`, `a = 0.7`, `b = 1.9`, `n = 3, 4, 6`; `n = 2` | `−0.0114984607`; `0.0332420083`; `0.0359525879`, both sides; `cos 1.2 = 0.36236 ≠ 0.67121` | agrees; `n ≥ 3` needed | none |
| 4.5 Gegenbauer addition (Lean form) | `λ ∈ {1.5, 1, 2.5, .8, .3, .51, .05, .49, 7.25}` × four `(l, θ, φ, ψ)` incl. `l = 0, 1, 6` | 36 pairs agree to `1e-10`; e.g. `1.6194486134`, `0.1774648150` (`λ = .3`), `0.0241443194` (`λ = .05`) | true on `λ > 0`, `λ ≠ ½`; equals DLMF 18.18.8 | none |
| 4.6 multiplier | `r = 1.7`: `(n,l) = (4,1), (2,3), (5,0), (3,0), (7,2)` | `0.3314575792 i`; `−0.0851499269 i`; `0.7392838087`; `0.5833322414`; `−0.0401713496` | agrees | none |
| 4.6 plane wave | `n = 2, 3, 4, 5`, `r = 2.3`, `t = 0.4`, 25 terms | `0.6058201566 + 0.7956016200 i = e^{0.92i}` in all four | true; also at `n = 2, 3` | humans |
| 4.6 Bochner | `n = 2..5`, `l = 0, 1, 2`, `ξ = (.42, .56)` | `−0.0900958687 i`; `−0.0504536865`; `0.2145139731`, each equal to the Gaussian closed form | true; also at `l = 0` | C01, humans |
| 5.1 branching | Laplacian `m = 1..4`, `l ≤ 5`, all `k`; dims `m = 0..7`, `l ≤ 8`; `κ` at `(m,l,k) = (2,2,1), (1,2,1), (2,3,1), (3,4,2)` | all harmonic; dims equal for `m ≥ 1`, fail at `m = 0`, `l ≥ 2`; `κ = 0.133333, 0.125, 0.047619, 0.017857` = direct integral | agrees | none |
| 5.2 Gel'fand–Tsetlin basis | `n = 4`, all chains `l ≤ 4`; `n = 3`, `l = 3`, `m = 1` with the old index | all 55 products harmonic; counts `1, 4, 9, 16, 25 = dim H_l(ℝ⁴)`; old index: Laplacian `−2x₁/3` | repaired | none |
| 6.1 `U(n)`: transitivity, density, Gel'fand pair | `n = 1`; `E|w|⁴`, `n = 2, 3, 4`; `σ = ᵀ` at `e_n` | `ξ = e^{iθ} η`; `0.3333333, 0.1666667, 0.1000000 = 2/(n(n+1))`; `(gᵀ)_{nn} = g_{nn}` | agrees | none |
| 6.2 dimensions | `n = 0..7`, `p, q ≤ 6` | closed form = binomial difference (`n ≥ 2`); sum over `p + q = m` = `dim H_m(ℝ^{2n})` (`n ≥ 0`); branching holds `n ≥ 1`, fails `n = 0`; `8`, `15`, `6+8+6 = 20` | agrees | R01 (last sentence) |
| 6.2 highest weight | `z̄₁² z₃` in `ℂ³`; torus action `f(t⁻¹z)` | complex Laplacian `0`; weight `q ε₁ − p εₙ` | agrees | none |
| 6.3 disk polynomials (Lean body) | `α ∈ {0, ½, −½, 2}`, six `(p,q)`, `w = 0.3 − 0.55i` | symmetric sum = `₂F₁` form = Jacobi form to `1e-12`; `R¹₁₁(.5) = −0.125`; `R⁰₂₁(.5) = −0.625`; `R₀₁(i) = −i` | agrees | none |
| 6.3 orthogonality, bound | `α ∈ {0, ½, −½, 1, 3}`, thirteen index pairs; 20000 random points | `h = 1/3, 1/4, 1/5, 0.190476, 0.8, 0.0666667, 0.00222222`; cross terms `< 1e-12`; `max |R^{n-2}| = 0.99999` | agrees | none |
| 6.4 `U(n)`-zonal harmonic | `n = 2, 3`, `η = (3/5, 4i/5, 0)`, `(p,q) = (1,0), (1,1), (2,1), (2,2), (1,3)`, exact Gaussian rationals | Laplacian `0`, bidegree `(p,q)`, value at rational unit `ξ` equals `R^{n-2}(⟪η, ξ⟫)`; control `4|z₃|² − |z|²`: `1` | agrees | none |
| 6.5 spherical functions | `(U(3), U(2))`, `(2,1)`, `a = .3 + .5i`, `b = .6 − .2i`; kernel at `(1,0)` | disc average `0.01792 + 0.01536 i = φ(g) φ(h)`; `R(ab) = −0.20384 − 0.17472 i`; `2⟪y, x⟫` | agrees; `⟪gη, η⟫` confirmed | none |
| 6.6 expansion | `(n,m,w)`: `(2,2,.35−.52i)`, `(2,2,1.3+.9i)`, `(3,3,1.3+.9i)`, `(4,5,.2+.7i)`, `(5,4,.9−.9i)`, `(2,7,−.4+.1i)` | `−1.53`; `17.28`; `136.76`; `22.33344`; `366.032`; `−1.3090816`, both sides; unweighted control `−0.06882` vs `−0.053` | agrees | none |
| Actions and measurable structures | instance search and `rfl` on a copy of the file | `Subtype.instMeasurableSpace`, `Subtype.borelSpace`, `Submonoid.mulAction` found; `g • x = Matrix.toEuclideanLin g.1 x` by `rfl` for both groups | Mathlib's, as the text says | none |
| Downstream and neighbours | rank-one roadmap at its head; Hypergeometric §9.1; GeometryOfNumbers §4.3; Legendre §3.4 | no citation of this roadmap, unnormalized `sphereMeasure`; `T_n`, `U_n`, `P_n` as `₂F₁`; Hecke's identity; Funk–Hecke on `S²` | pointers missing | C01, C02 |

- Source locators checked against the text: DLMF 18.18.8 (coefficient and range `λ > 0`, `λ ≠ 1/2`, DLMF18_18 lines 472–474; it equals the display of 4.5 since `Γ(2λ − 1)Γ(λ + m)²/(Γ(λ)²Γ(2λ + l + m)) = (λ)_m²/((2λ − 1)(2λ)_{l+m})`, checked numerically); 0 of 60 book locators (no book readable).
- Library declarations opened at the pin: `MvPolynomial.harmonicRep` (`TauCeti/RingTheory/MvPolynomial/Harmonic/Orthogonal.lean:122`), `MvPolynomial.sphereEval` and `harmonicSphereRestriction_injective` (`TauCeti/Analysis/MvPolynomial/Sphere.lean:49, 126`), `MvPolynomial.finrank_harmonicSubmodule_add_two`, `TauCeti.haarProb` (signature), `Complex.besselJ`, Mathlib's `toSphere` (`Mathlib/MeasureTheory/Constructions/HaarToSphere.lean`); no Gegenbauer, Jacobi, zonal, Gel'fand-pair or disk-polynomial declaration exists in either pinned library.
- Cross-roadmap citations resolved: 22, all present (RiemannianGeometry R8.1–R8.3; LaguerreJacobi §§3.2, 3.3, 4.3, 6.2; SpecialFunctionsBessel §§4.1, 4.3, 5.1; CompactGroups §§2.3, 5.4, 5.5; ClassicalGroups Layer 6; at their open heads SpecialFunctionsGroupModels §§0.3, 5.1–5.3, SpecialFunctionsSU2MatrixElements §§6.3–6.4, SpecialFunctionsLegendre §3.2, SpecialFunctionsMotionGroupsBessel §§5.3, 6.3). Local copies compared with their owners: `gegenbauer`, `jacobi`, `IsBiInvariant`, `conv`, `IsGelfandPair`, `IsSphericalFunction`, `SOn`, all identical.
- Elaboration: no error, 60 `sorry` warnings, 17 `#check` lines. Elaborated types of all declarations read against the README; the two definitions that lose a section binder (`IsBiInvariant`, `conv`) do not use it; README and Lean generality agree for all 60 theorems.
- One-tactic probe (`rfl`, `simp`, `simp` with every definition of the file unfolded, `infer_instance`) on a copy of the file: none of the 60 theorems closes; the two value-at-one statements are marked as sanity checks.
- Headlines: 59 bold headlines carry a Lean name and all are stated (60 theorems); not stated and named in the docstring: the decomposition, irreducibility and inequivalence of the `H^{p,q}` (no action of `U(n)` on polynomials in `z, z̄` at the pin) and the two targets of 5.2.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; the pull request changes nothing outside the folder; the description's counts (59 headlines, 60 theorems, no instance) agree with the head.
- Automatic checks: the text scanners, the dependency check and the targeted build passed; one form check is set aside below.

Overlap check: read SpecialFunctionsMotionGroupsBessel, SpecialFunctionsRankOneSymmetricSpaces, SpecialFunctionsGroupModels, SpecialFunctionsSU2MatrixElements, SpecialFunctionsAffineHeisenbergGroups, SpecialFunctionsLegendre, SpecialFunctionsBessel, LaguerreJacobi, SpecialFunctionsOrthogonalPolynomialsGeneral, SpecialFunctionsHypergeometric; the plane wave in `ℝ³` and the radial Fourier transform: SpecialFunctionsMotionGroupsBessel; `n ≥ 4` and `l ≥ 1`: this roadmap; Gegenbauer and Jacobi polynomials and their orthogonality: LaguerreJacobi; Gel'fand pairs in general, `SOn`: SpecialFunctionsGroupModels; `T_n`, `U_n`, `P_n` as Gauss series: SpecialFunctionsHypergeometric, the polynomial forms here (C01); Funk–Hecke and the addition theorem on `S²` in the `Y_{l,m}`: SpecialFunctionsLegendre (C01); Hecke's identity: GeometryOfNumbersAndQuadraticArithmetic (C01); the rank-one roadmap shares nothing and does not cite this one (C02); nothing owned twice.

Source independence: 1 passage compared with 1 source (DLMF 18.18.8, a formula; nothing shared); the four books were not readable, so no wording was compared with them; largest share Vilenkin–Klimyk Vol. 2, 28 of 61 locators; its contents were not read; by the cited section numbers alone the layers do not run in its order (Layers 2–4 draw on §§9.2, 9.3, 9.4, 10.2 interleaved, Layer 5 on §9.3.1, Layer 6 on §§11.1–11.4).

Research link: The targets are the harmonic analysis of the compact rank-one pairs `(SO(n), SO(n−1))` and `(U(n), U(n−1))` as in Vilenkin–Klimyk 1993, Klimyk–Vilenkin 1995, Wawrzyńczyk 1984 and Dieudonné 1980; Hecke's identity of GeometryOfNumbersAndQuadraticArithmetic §4.3 is the Gaussian case of 4.6. This rests on the README and that roadmap, not on a source I read.

## Not verifiable

- All 15 sampled targets' book locators (1.1, 1.2, 1.3, 2.2, 3.2, 3.3, 3.4, 4.1, 4.4, 4.5 apart from DLMF, 5.1, 5.2, 6.1, 6.4, 6.6) and every other locator into Vilenkin–Klimyk Vol. 2, Klimyk–Vilenkin (EMS 59), Wawrzyńczyk and Dieudonné: the sources service found only paywalled pages for the first three and no legal copy of the last. The mathematics of each target was checked by computation instead.
- The misprints the README attributes to Vilenkin–Klimyk and Wawrzyńczyk (2.1, 2.3, 3.2, 3.4, 4.4, 4.5, 6.3, Beyond), and the sign of `i` it says they print in the Laplace integral: the texts were not read.
- "Wawrzyńczyk's form (9.5.2) … both sides `0.60290 52598`" (4.4 Checks): the form was not read.
- The lists of the README's "Prior formalization" and of the description's paragraph of that name: the external repository was not opened.

Automatic checks set aside as false positives: the section comment "Supplier declarations named in the README" at the end of `Suggested.lean` is followed by `#check` lines that pin library declarations, which the form rules allow, and not by nothing.

## Source issues

- none

## For the human reviewers

- Licence and reuse: the README ("Prior formalization", lines 1113–1143) says the roadmap reuses the names and conventions of the author's own public formalization lean-SFVK (stated there as Apache-2.0); `Suggested.lean` was not compared with that repository.
- Not tested: Vilenkin–Klimyk Vol. 2 has the largest share of the locators (28 of 61); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it, nor with the other three books.
- Scope of 4.6: `hasSum_cexp_inner_sphereEval` assumes `4 ≤ n` and `fourier_mul_eval_div_norm` assumes `1 ≤ l`, called ownership boundaries (README lines 590–596); the open sibling states `n = 3` in its own `Y_l^m` and the case `l = 0`.
