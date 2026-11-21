# Review of SpecialFunctionsHigherSpheres (pull request #2931 at 3d3cd4c)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons. The Gel'fand–Tsetlin basis of 5.2 is stated with the dimension index of its zonal factor one too small, so the functions it describes are not harmonic (it contradicts 5.1 and the Check of 5.2 itself); and `Suggested.lean` declares five global instances on Mathlib's matrix groups that the pinned Mathlib already provides, one of them not definitionally equal to the library's. Every other identity and every numerical Check I recomputed agrees with the text. There are eight small corrections and two format notes, none blocking. None of the four books could be read legally, so no book locator was checked against its text; that, and the reuse of names from the author's own formalization, are left to the human reviewers.

## R01 (P1) — The Gel'fand–Tsetlin basis of 5.2 has the wrong dimension index in its zonal factor, so its elements are not harmonic

An implementer who builds the basis from the formula of 5.2 gets functions outside `H_l` as soon as some step has `l_j − l_{j-1} ≥ 2`. The factor is written (README line 653) as `sin^{l_{j-1}} θ_j ω_{j+2l_{j-1}, l_j - l_{j-1}}(cos θ_j)` with `l = l_{n-1}`, so `l_j` is the degree in `ℝ^{j+1}`. The step from `ℝ^j` to `ℝ^{j+1}` is 5.1 with `m = j`, `k = l_{j-1}`, `l = l_j`, and 5.1's factor is `ω_{m+1+2k, l-k} = ω_{j+1+2l_{j-1}, l_j - l_{j-1}}`.

Computed: for `n = 3` (`j = 2`, `l_1 = |m|`) the formula gives `ω_{2+2|m|, l-|m|}`, while the first Check of 5.2 (line 665) has `ω_{3+2|m|, l-|m|}`. At `l = 3`, `|m| = 1` the formula's function is the restriction of `x₁(4x₃² − |x|²)/3`, whose Laplacian is `−2x₁/3`; with `ω_{5,2}` it is `x₁(5x₃² − |x|²)/4`, of Laplacian `0`. This is the failure that the negative control of 5.1 describes.

The smallest change: write the factor as `sin^{l_{j-1}} θ_j ω_{j+1+2l_{j-1}, l_j - l_{j-1}}(cos θ_j)`.

## R02 (P2) — `Suggested.lean` redeclares, as global instances on Mathlib's types, an action and measurable structures that the pinned Mathlib already has

The file declares `MeasurableSpace`, `BorelSpace` and `MulAction … (EuclideanSpace …)` instances for `SOn n`, and the same three for `UnitaryMatrixGroup n` (lines 128–136 and 570–585). Both are abbreviations of Mathlib's `Matrix.specialOrthogonalGroup (Fin n) ℝ` and `Matrix.unitaryGroup (Fin n) ℂ`, so these are second global instances on library types. Every statement that mentions `TauCeti.haarProb (SOn n)`, a measure on a stabilizer, or `g • x` is then about the roadmap's instance and not about the one a library user gets, and the README says the roadmap "owns the `MulAction` instance built from its `rotE`" (Scope, line 967) although the library has that action.

How I know, at the pins and with only Mathlib and the four Tau Ceti imports of the file: instance search finds `Subtype.instMeasurableSpace` and `Subtype.borelSpace` for both groups (from the matrix instances of `Mathlib/Analysis/Matrix/MeasurableSpace.lean`, line 29), and `Submonoid.mulAction` for both actions on Euclidean space (over the matrix module of `Mathlib/LinearAlgebra/Matrix/Action.lean`, line 29, carried to `EuclideanSpace` by `WithLp.instMulAction`). For the library action `g • x = Matrix.toEuclideanLin g.1 x` holds by `rfl`. The roadmap's `borel (SOn n)` is not definitionally the library's measurable space (`rfl` fails). On a copy of the file with the five instance declarations deleted the file elaborates unchanged: 59 `sorry` warnings, no error, `smul_def` and `smul_def_unitary` still by `rfl`.

The smallest change: delete the five instance declarations; list the library action and the subtype measurable structures under "From Mathlib"; and replace the two ownership sentences (README line 967; module docstring, "The action of `SOn n` on `ℝⁿ` through `rotE` … is owned here") by the statement that the action is Mathlib's and agrees with `rotE`.

## C01 — The plane-wave expansion of 4.6 is stated for `n ≥ 4` and Bochner's theorem for `l ≥ 1`, but the same formulas hold for `n = 2, 3` and for `l = 0`

A reader takes the bounds for mathematical ones. Computed with the stated formula at `r = 2.3`, `⟪η, x⟫ = 0.4`, forty terms: `0.6058201566 + 0.7956016200 i = e^{0.92i}` for `n = 2` and `n = 3` as well as for `n = 4, 5`. Bochner's formula at `l = 0`, `n = 3`, `φ(r) = e^{-πr²}`, `|ξ| = 0.7`: `0.2145139731 = e^{-0.49π}` on both sides. The bounds are ownership boundaries with the roadmap on motion groups (which states `ℝ³` in the `Y_l^m` and the radial transform), not hypotheses the proofs need. Would you either state the expansion for `n ≥ 2` (the form in an orthonormal basis of `H_l` is not the sibling's statement), or say at the two targets, in one clause each, that the excluded cases are true and where they are stated? The negative control "the plane-wave route needs `ν ≠ 0`" is about the route, and the formula itself is the Jacobi–Anger expansion at `n = 2`.

## C02 — Two one-variable identities carry hypotheses stronger than they need

The Gegenbauer addition theorem of 4.5 is stated for `λ > 1/2`; DLMF 18.18.8 states it for `λ > 0`, `λ ≠ 1/2`, and the Lean statement as written is true there: at `l = 4`, `θ = 0.6`, `φ = 1.3`, `ψ = 2.2`, `λ = 0.3` both sides are `0.1774648150`. The README's own route (a rational identity in `λ`) gives this range. The Gegenbauer form of 3.1 is stated for `n ≥ 3` and also holds at `n = 2`, where both sides are `1` for `l = 0` and `0` for `l ≥ 1`. State the wider ranges, or say that the narrower ones are a choice.

## C03 — The reason given for not stating the inequivalence of the `H_l` is not a missing carrier

The module docstring of `Suggested.lean` says the statement needs the harmonic spaces as representations and that Tau Ceti's action "lives in a module outside this file's imports". The carrier exists at the pin: `MvPolynomial.harmonicRep` in `TauCeti/RingTheory/MvPolynomial/Harmonic/Orthogonal.lean`, line 122, a representation of the orthogonal group on `harmonicSubmodule`, and the module can be imported. Note also that for `n ≥ 3` the inequivalence already follows from 2.1, since `dim H_l(ℝⁿ)` is strictly increasing in `l` (the third Check of 2.2 uses exactly this). Either state it with `harmonicRep`, or give the true reason it is left in prose. The reason for the `H^{p,q}` (no action of `U(n)` on polynomials in `z, z̄` at the pin) is correct.

## C04 — The completion list of "Scope and ownership" omits 4.6

Item 4 (line 914) reads "(4.1–4.5)", but 4.6 states three named targets (the multiplier, the plane-wave expansion and Bochner's theorem), and the Summary lists them. It should read "(4.1–4.6)".

## C05 — The errata identifiers point to a file that is not in the repository

Seven places cite "the project's errata file" (E09.2.01, E09.4.01, E10.2.01, E11.4.10, W84-E09.3.01, W84-E09.4.01, W84-E09.5.01). No file in the roadmap repository contains these identifiers, so a reader cannot find what is corrected. Where the correction matters to a target (2.1, 2.3, 3.4 already say what is corrected), keep the sentence and drop the identifier, or say which repository holds the file.

## C06 — Six proved declarations of `Suggested.lean` restate definitions

`smul_def`, `smul_def_unitary`, `zonalPolynomial_def`, `diskPolynomial_def` and `branchHarmonic_apply` are proved by `rfl`, and `eval_linearForm` by one `simp`. The docstring calls them supporting lemmas, not targets; they ask an implementer for nothing. They can go, with the README keeping the formulas in prose; the README then no longer names them in code font.

## C07 — The negative control of 2.2 at `n = 2` is true only after complexification

"For `n = 2` and `l ≥ 1`, `H_l` is the sum of the characters `e^{± ilθ}` and is not irreducible" (line 239). The carrier of the roadmap is the real space `MvPolynomial.harmonicSubmodule (Fin n) ℝ l`; on it `SO(2)` acts by the rotation through `lθ`, which has no invariant line, so the real `H_l(ℝ²)` is irreducible. The sentence holds for `H_l ⊗ ℂ`; say so.

## C08 — The description does not name SpecialFunctionsLegendre among the roadmaps in open pull requests that the README cites

The README cites SpecialFunctionsLegendre §3.2 (the first Check of 4.1 and the Scope paragraph on the roadmaps of the same project), and that roadmap is an open pull request, not on main. The description's "Suppliers in open PRs" lists only SpecialFunctionsGroupModels and SpecialFunctionsSU2MatrixElements. Add: "SpecialFunctionsLegendre §3.2, only for the `n = 3` Check of 4.1."

## N01 — Three proof routes point forward in the layer order

4.5 needs 5.1 (said in the guide), while 5.1's norm needs 4.2 and 5.2 needs 4.1; 2.2 and 2.3 use the zonal objects of Layer 3; the irreducibility of 6.2 uses 6.4 and 6.5. There is no cycle between targets. Moving 4.5 after Layer 5, or a line of dependencies per layer, would let a reader see that at once.

## N02 — "Prior formalization" describes the state of an external repository at one moment

The list of what the external repository "proves … without `sorry`" will go out of date; a sentence that the names and conventions agree with it would be timeless. Likewise "The `**Checks.**` of each subsection are statements to prove" (line 922) reads oddly beside Checks that are numerical values.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 transitivity, double cosets | `n = 1`; `n = 2` rotations `±0.5`; `n = 3` rotation about `e₁` | `SO(1)` trivial; both give `cos 0.5 = 0.87758`, `K_η` trivial so cosets differ; `cos θ` | bounds `n ≥ 2`, `n ≥ 3` needed | none |
| 1.2 polar constant, density | `n = 2..6`; fourth moment `n = 2, 3, 5` | `c_n = 0.31831, 0.5, 0.63662, 0.75`; mass `1.000000`; moments `0.375, 0.2, 0.0857143 = 3/(n(n+2))` | agrees | none |
| 1.3, 6.1 Gel'fand pairs, all `n`, `η` | `η = 0`; non-unit `η`; `n ≤ 2`; `U(n)` with `σ = ᵀ` at `e_n` | `K = G`, constants commute; `K_η = K_{η/‖η‖}`; abelian; `(gᵀ)_{nn} = g_{nn}` | true as stated | none |
| 2.1 dimension | `n = 3..9`, `l ≤ 9` exact; `n = 2`, `l = 0` | product identity holds in `ℕ` in all 70 cases; `1 · 1 ≠ 0 · 0!` at `n = 2`, `l = 0` | `n ≥ 3` needed | none |
| 2.2 inequivalence | `n = 3`, `l = 1, 2`; `n = 2` real carrier | dims `3 ≠ 5`; real `H_l(ℝ²)` irreducible, complexification splits | statement true; control imprecise | C03, C07 |
| 2.3 uniqueness | `n = 3`, `l = 2`; `n = 2`; misprint ratio | `(3x₃² − r²)/2`, Laplacian `0`, value `1`; `dim H_l(ℝ²) = 2`; `P₂(1)/U₂(1) = 1/3` | agrees | none |
| 3.1 zonal polynomial (Lean body) | `n = 0..8`, `l ≤ 7` exact rationals; junk `n = 1` | value at one `1` for all `n`; parity, degree, `T_l`, `P_l`, `U_l/(l+1)` exact for `n ≥ 2`; `ω_{1,1} = 1` breaks parity | agrees; Gegenbauer form also true at `n = 2` | C02 |
| 3.1 Checks | `t = 0.3` | `ω_{n,2} = −0.82, −0.365, −0.092` (`n = 2, 3, 6`); `T₃ = −0.792`; wrong parameter `−0.575` vs `−0.213333` | agrees | none |
| 3.2 Gegenbauer value, derivative, generating function | `λ ∈ {−2, −1, −½, 0, ⅓, 1, 3/2, 5}`, `l ≤ 7`; `(3/2, 0.4, 0.3)`; `(−0.7, −1, 0.5)` | value and derivative exact; `1.2760615166` both sides; `1.7641185338` both sides | true for all real `λ` | none |
| 3.2 zonal derivative, equation | `n = 2..8`, `l ≤ 7`; control `(n − 2)` | exact; `ω_{5,4}' = 7ω_{7,3}`; residual `−0.03741` | agrees | none |
| 3.3 zonal harmonic | Laplacian of `⟪η,x⟫²` terms, `n = 3, 4`; non-unit `η` | `(3⟪η,x⟫² − r²)/2`: `3(‖η‖² − 1)`; `(3x₄² − r²)/2` in `ℝ⁴`: `−1`; `(4⟪η,x⟫² − r²)/3`: `0` | agrees | none |
| 3.4 Laplace integral | `(n, l, φ) = (3,2,0.9), (5,3,0.9), (4,5,2.1), (6,4,−0.4)` | `0.0795984290`; `−0.0458759550`; `0.0064918679`; `0.5672946322`, imaginary parts `< 1e-16` | agrees | none |
| 4.1 addition theorem, reproducing | `n = 2` (`√2 cos lθ, √2 sin lθ`); `l = 0` | `2 cos l(θ − θ') = 2T_l`; `∫ cos lθ cos l(θ − θ') dθ/2π = cos lθ'/2` | agrees | none |
| 4.2 orthogonality | `(n,l,l')`: `(3,2,2), (4,3,3), (6,2,2), (2,3,3), (2,0,0), (3,2,4), (5,1,3), (5,2,2), (7,4,4)` | `0.2, 0.0625, 0.05, 0.5, 1, 0, 0, 0.0714286, 0.00549451` = `δ/dim H_l`; unweighted control `0.25` | agrees | none |
| 4.3 Funk–Hecke | `n = 3`, `f = exp`, `l = 2, 3` | `λ₂ = (e − 7/e)/2 = 0.0715628701`; `λ₃ = 0.0100650905`; `0.48 λ₂ = 0.0343501777`; `−0.936 λ₃ = −0.0094209247` | agrees | none |
| 4.4 product formula | `l = 3`, `a = 0.7`, `b = 1.9`, `n = 3, 4, 6` | `−0.0114984607`; `0.0332420083`; `0.0359525879`, both sides | agrees | none |
| 4.5 Gegenbauer addition (Lean form) | `l = 4`, angles `0.6, 1.3, 2.2`; `λ = 3/2, 1, 5/2, 0.8, 0.3, 0.51` | `1.6194486134`; `0.8829812104`; `3.6109091337`; `0.6413108772`; `0.1774648150`; `0.3472897435`, both sides | true; holds for `0 < λ < 1/2` too | C02 |
| 4.6 multiplier | `r = 1.7`: `(n,l) = (4,1), (2,3), (5,0), (3,0), (7,2)` | `0.3314575792 i`; `−0.0851499269 i`; `0.7392838087`; `0.5833322414 = sin r/r`; `−0.0401713496` | agrees | none |
| 4.6 plane wave | `n = 2, 3, 4, 5`, `r = 2.3`, `t = 0.4` | `0.6058201566 + 0.7956016200 i` in all four | true; also at `n = 2, 3` | C01 |
| 4.6 Bochner | `n = 2..5`, `l = 1, 2`; `l = 0`, `n = 3`; wrong order | `−0.0900958687 i`; `−0.0504536865`; `0.2145139731`; control `−0.0316214280 i` | true; also at `l = 0` | C01 |
| 5.1 branching | dims `m = 1..7`, `l ≤ 8`; `m = 0`; norm `(m,l,k) = (2,2,1), (1,2,1), (2,3,1)` | dims equal; fails at `m = 0`, `l ≥ 2`; `κ = 2/15, 1/8, 1/21` against `1/15 = κ/2`, `1/8`, `1/42 = κ/2` | agrees | none |
| 5.2 Gel'fand–Tsetlin factor | `n = 3`, `l = 3`, `m = 1` | formula `ω_{4,2}`: Laplacian `−2x₁/3`; 5.1 and Check `ω_{5,2}`: `0` | false as written | R01 |
| 6.2 dimensions | `n = 2..7`, `p, q ≤ 6`; `n = 0, 1`; `n = 3` | closed form = binomial difference; sum over `p + q = m` equals `dim H_m(ℝ^{2n})` for `n ≥ 0`; `8`, `15`, `6+8+6 = 20`; branching fails at `n = 0` | agrees | none |
| 6.3 disk polynomials (Lean body) | `α ∈ {0, ½, −½, 2}`, six `(p,q)`; `w = 0.3 − 0.55i` | `₂F₁` form and Jacobi form agree to `1e-12`; `R¹₁₁(0.5) = −0.125`; `R⁰₂₁(0.5) = −0.625` | agrees | none |
| 6.3 orthogonality, bound | `α ∈ {0, ½, −½, 3}`, nine index pairs; 20000 random points | `h = 1/3, 1/4, 1/5, 4/21, 4/5`; cross terms `< 1e-6`; `max |R^{n-2}| = 1.0` | agrees | none |
| 6.4 `U(n)`-zonal harmonic | `n = 3`, `(1,1)`, `η = e₃` | `3|z₃|² − |z|²`: `3 − 3 = 0`; with `α = n − 1`: `4 − 3 = 1` | agrees | none |
| 6.5 spherical functions | `(U(3), U(2))`, `(2,1)`, `a = 0.3 + 0.5i`, `b = 0.6 − 0.2i` | disc average `0.01792 + 0.01536 i = φ(g)φ(h)`; `R(ab) = −0.20384 − 0.17472 i`; kernel `2⟪y,x⟫` at `(1,0)` | agrees; convention `⟪gη, η⟫` confirmed | none |
| 6.6 expansion | `(n,m,w)`: `(2,2,0.35−0.52i)`, `(2,2,1.3+0.9i)`, `(3,3,1.3+0.9i)`, `(4,5,0.2+0.7i)`, `(5,4,0.9−0.9i)` | `−1.53`; `17.28`; `136.76`; `22.33344`; `366.032`, both sides; unweighted control `−0.06882` vs `−0.053` | agrees | none |
| Instances of `Suggested.lean` | instance search without them; `rfl` test | library gives `Subtype.instMeasurableSpace`, `Subtype.borelSpace`, `Submonoid.mulAction`; `borel` not defeq | duplicates Mathlib | R02 |

- Source locators checked against the text: 0 of 59 book locators (no book readable); DLMF 18.18.8 read at its page.
- Library declarations opened at the pin: 8 (`Complex.besselJ`, `Mathlib/Analysis/SpecialFunctions/Bessel.lean:55`; matrix module, `Mathlib/LinearAlgebra/Matrix/Action.lean:29`; matrix measurable space, `Mathlib/Analysis/Matrix/MeasurableSpace.lean:29`; `harmonicSubmodule` and `finrank_harmonicSubmodule_add_two`, `TauCeti/RingTheory/MvPolynomial/Harmonic.lean:210, 359`; `harmonicRep`, `…/Harmonic/Orthogonal.lean:122`; `sphereEval`, `TauCeti/Analysis/MvPolynomial/Sphere.lean:49`; `haarProb`, `TauCeti/RepresentationTheory/Compact/Haar.lean:93`).
- Cross-roadmap citations resolved: 20, all present (RiemannianGeometry R8.1–R8.3; LaguerreJacobi §§3.2, 3.3, 4.3, 6.2; SpecialFunctionsBessel §§4.3, 5.1; CompactGroups §§2.3, 5.4, 5.5; ClassicalGroups Layer 6; and, at their open heads, SpecialFunctionsGroupModels §§0.3, 5.1–5.3, SpecialFunctionsSU2MatrixElements §§6.3–6.4, SpecialFunctionsLegendre §3.2).
- Local copies compared with their owners: 8 of 8 identical (`gegenbauer`, `jacobi` with LaguerreJacobi's `Suggested.lean`; the four Gel'fand definitions and `SOn`, `rotE`, `rotE_mul`, `rotE_one` with SpecialFunctionsGroupModels').
- Elaboration: no error, 59 `sorry` warnings, 16 `#check` lines. Elaborated types of all 96 declarations read against the README; the two definitions that lose a section binder (`IsBiInvariant`, `conv`) do not use it. Nothing changed.
- One-tactic probe: `zonalPolynomial_eval_one`, `diskPolynomial_one`, `diskPolynomial_swap` and `eval_zonalHarmonic` are not closed by `simp` with the definition unfolded; the six supporting lemmas close by `rfl` or `simp` in the file (C06).
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; the pull request changes nothing outside the folder.
- Headline theorems of the README stated in `Suggested.lean`: all that carry a name (59 theorems); not stated and named in the docstring: inequivalence of the `H_l` (statable, C03), irreducibility of the `H^{p,q}` and the Gel'fand–Tsetlin basis (not statable simply).

Overlap check: read SpecialFunctionsMotionGroupsBessel, SpecialFunctionsRankOneSymmetricSpaces, SpecialFunctionsGroupModels, SpecialFunctionsSU2MatrixElements, SpecialFunctionsAffineHeisenbergGroups, SpecialFunctionsLegendre, LaguerreJacobi, SpecialFunctionsOrthogonalPolynomialsGeneral, SpecialFunctionsBessel; the plane wave in `ℝ³` and the radial Fourier transform: SpecialFunctionsMotionGroupsBessel; `n ≥ 4` and `l ≥ 1`: this roadmap (C01); Funk–Hecke and the addition theorem on `S²` in the `Y_{l,m}`: SpecialFunctionsLegendre, which leaves higher dimension to others; Gegenbauer polynomial and its orthogonality: LaguerreJacobi; Gel'fand pairs in general, `SOn`, `rotE`: SpecialFunctionsGroupModels; nothing owned twice.

Source independence: 1 passage compared with 1 source (DLMF 18.18.8, a formula; nothing shared); the four books were not readable, so no wording was compared with them; largest share Vilenkin–Klimyk Vol. 2, 27 of 59 locators; its contents were not read; by the cited section numbers alone the layers do not run in its order (Layers 2–4 draw on §§9.2, 9.3, 9.4 and 10.2 interleaved, Layer 5 on §9.3.1).

Research link: The targets are the harmonic analysis of the compact rank-one pairs `(SO(n), SO(n−1))` and `(U(n), U(n−1))` as in Vilenkin–Klimyk 1993, Klimyk–Vilenkin 1995, Wawrzyńczyk 1984 and Dieudonné 1980, and are consumed by the open roadmap on rank-one symmetric spaces; this rests on the README, not on a source I read.

## Not verifiable

- All 15 sampled targets' book locators (1.1, 1.2, 2.1, 2.2, 2.3, 3.1, 3.3, 4.2, 4.3, 4.5, 5.2, 6.2, 6.3, 6.5, 6.6) and every other locator into Vilenkin–Klimyk Vol. 2, Klimyk–Vilenkin (EMS 59), Wawrzyńczyk and Dieudonné: the sources service found no legal copy of the first and the last, and only paywalled pages for the other two. The mathematics of each target was checked by computation instead.
- The seven misprints the README attributes to Vilenkin–Klimyk and Wawrzyńczyk, and the sign of `i` it says they print in the Laplace integral: the texts were not read.
- "Wawrzyńczyk's form (9.5.2) … both sides `0.60290 52598`" (4.4 Checks): the form was not read; the value equals `π/20` times `C₃^{(3/2)}(cos 0.7) C₃^{(3/2)}(cos 1.9) = 3.8382140923`, which is consistent with a constant `Γ(2p + l)/(2^{2p-1} l! Γ(p)²) = 20/π`.
- The counts of the description's "Prior formalization" paragraph and the README section of that name: the external repository was not opened.

Automatic checks set aside as false positives: the section comment "Supplier declarations named in the README" at the end of `Suggested.lean` is followed by `#check` lines that pin library declarations, which the form rules allow, and not by nothing.

## Source issues

- none

## For the human reviewers

- Licence and reuse: the README ("Prior formalization", lines 1078–1107) says the roadmap reuses the names and conventions of the author's own public formalization lean-SFVK (stated there as Apache-2.0); `Suggested.lean` was not compared with that repository.
- Not tested: Vilenkin–Klimyk Vol. 2 has the largest share of the locators (27 of 59); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it, nor with the other three books.
- Sources: the errata identifiers cited in the README (E09.2.01 and six others) refer to a file that is not in the roadmap repository.
