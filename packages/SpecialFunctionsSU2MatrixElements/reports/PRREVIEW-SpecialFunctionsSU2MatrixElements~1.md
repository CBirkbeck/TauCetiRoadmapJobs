# Review of SpecialFunctionsSU2MatrixElements (pull request #2692 at 4721df1)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons. The spherical harmonics on `S²` with their orthonormality, addition theorem, completeness and Laplace equation, and the Legendre addition theorem, are owned here and also by the open roadmap SpecialFunctionsLegendre (and completeness on spheres by RiemannianGeometry R8.2 on main), and neither text names the other; and one sentence of the proof route for the Haar measure is false as written. Every stated identity was recomputed from the Lean definitions and none failed. There are six small corrections and three format notes, none blocking; the locators into Edmonds and the other five books could not be read legally, which is left to the human reviewers.

## R01 (P2) — The spherical harmonics on `S²` and their main theorems have two owners: this roadmap and the open roadmap SpecialFunctionsLegendre, and neither names the other

An implementer would build `Y_l^m`, its orthonormality, its addition theorem, its completeness and its Laplace equation twice, in two normalisations of the carrier, with no stated comparison between them.

Here, Scope and ownership (lines 62–63) owns "spherical harmonics on `S²` as matrix elements, with their orthonormality, completeness, rotation law, addition theorem and the harmonicity of solid harmonics", and §§6.1–6.3 with `Suggested.lean` state them (`sphericalHarmonic` as a polynomial on `ℝ³` indexed by `i = m + l`, `integral_sphericalHarmonic_mul_conj`, `sum_sphericalHarmonic_mul_conj`, `ae_eq_zero_of_forall_integral_sphericalHarmonic`, `sphereLaplacian_sphericalHarmonic`, `laplacian_solidHarmonic`), and §3.1 states the Legendre addition theorem. SpecialFunctionsLegendre, at the head of its open pull request, owns the same objects: its summary (README lines 48–50) lists "the spherical harmonics `Y_{l,m}`: orthonormality, the addition theorem, … their harmonic polynomials, completeness in `L²` of the sphere"; its §3.1 (line 666) defines `sphericalHarmonic l m θ φ` by DLMF 14.30.1, §3.2 (line 689) states DLMF 14.30.8 and 14.30.9, §3.3 (line 714) the harmonic polynomials `ρ^l Y_{l,m}`, completeness and `L² Y = l(l+1) Y`, and §2.5 (line 624) the addition theorem for integer degree; its `Suggested.lean` declares `sphericalHarmonic`, `integral_sphericalHarmonic_mul`, `ferrersP_eq_sum_sphericalHarmonic` and `sphericalHarmonic_hilbertBasis`. That roadmap also owns the Ferrers functions, which this README lists as not owned (lines 71–72) with no owner named. On main, RiemannianGeometry R8.2 (README line 4869) already owns orthogonality and completeness of the restricted harmonic polynomials on `Sᵐ`, which is the "decomposition of `L²(S²)`" bullet of §6.3 at `m = 2`. A search of this README for either roadmap's name finds nothing, and SpecialFunctionsLegendre does not mention this one.

The smallest change is in Scope and ownership and in the description's merge-order paragraph: name SpecialFunctionsLegendre and RiemannianGeometry R8.2 and give each shared result one owner. One division that keeps every statement the author wrote: this roadmap keeps what needs the group (the column and row formulas, the orbit formula, the rotation law, irreducibility of `H_l`, and the group-theoretic proofs), states the comparison `sphericalHarmonic l i (spherePoint θ φ) = Y_{l, i−l}(θ, φ)` for `0 ≤ θ ≤ π` with the other roadmap's function, and for orthonormality, the addition theorem, completeness and the Laplace equation either cites the owner or says in one clause how its variant differs (a polynomial carrier on `ℝ³` and the measure `toSphere`, against the angle box with weight `sin θ`). Which of the two roadmaps is the owner is the author's choice, since both pull requests are the same author's; the order between them then goes into both descriptions.

## R02 (P2) — In the route for the Haar measure (§1.3), left multiplication does not act on the first row of `g` by a unitary map

The route (line 272) says: "left multiplication acts on the first row `(g₀₀, g₀₁) ∈ S³ ⊂ ℂ²` by a unitary map preserving the surface measure". With `g = [[a, b], [−conj b, conj a]]`, the first row of `h g` is `h₀₀ (a, b) + h₀₁ (−conj b, conj a)`; for `h = [[0, 1], [−1, 0]]` this is `(a, b) ↦ (−conj b, conj a)`, which is antilinear, so the map is not unitary. It is an isometry of `ℝ⁴`, so the conclusion stands, but an implementer who looks for a `ℂ`-linear map on the row will not find one.

Either say "by a real-linear isometry of `ℂ² = ℝ⁴`", or use the first column: `(g₀₀, g₁₀) ↦ h (g₀₀, g₁₀)` is unitary, and `g₀₀ = cos(β/2) e^{i(α+γ)/2}`, `g₁₀ = −sin(β/2) e^{−i(α−γ)/2}` are the same spherical coordinates on `S³`.

## C01 — "How to read the build" says Layers 3–6 are independent apart from §6.3, but §§6.2, 6.3 and 6.4 use more of Layers 3 and 4

Line 189 says: "Given Layer 2, Layers 3–6 are independent of each other, except that §6.3 uses the Legendre addition theorem of §3.1 and Plancherel of §3.4." The routes below it say otherwise: §6.2 defines `eulerLaplacian_sphere` through `eulerLaplacian` (§4.3) and proves the eigen-equation from `wignerSmallD_ode` (§4.2); orthonormality in §6.3 is "Schur orthogonality pushed forward" (§3.3); §6.4 refers to the functional equation of §3.2. As this sentence is the only statement of the dependencies between layers, list these edges in it.

## C02 — The Krawtchouk polynomials are not new to the project: the pinned Tau Ceti has the coding-theory normalisation

Line 80 says the Krawtchouk polynomials are ones "which no other roadmap defines", and the description repeats it. The pinned library has `TauCeti.krawtchouk q n w j : ℤ` (`TauCeti/InformationTheory/Coding/Krawtchouk.lean`, line 39), from the completed AlgebraicCodingTheory roadmap, and the open roadmap BoundsOnCodes consumes it. It is the integer-`q` case in another normalisation, `TauCeti.krawtchouk q N s x = C(N, s) (q − 1)^s K_s(x; (q − 1)/q, N)`; at `(q, N, s, x) = (2, 3, 1, 2)` both sides are `−1` (`K_1(2; 1/2, 3) = −1/3`). The real-`p` family and its orthogonality are new, so the target stays; say so in Scope and ownership, cite the library declaration, and add that comparison as a Check.

## C03 — `convolution` restates the library's convolution on a compact group

The pinned Tau Ceti has `TauCeti.convolutionCLM` (`TauCeti/RepresentationTheory/Compact/Convolution.lean`, line 206) with `convolutionCLM_toLp_apply` (line 237): for continuous `k, f`, its value at `x` is `∫ k z * f (z⁻¹ * x)`, the formula of `convolution` in §6.4. Neither the supplier contracts nor §6.4 mention it. Either state `convolution_comm` for continuous functions through the library's operator, or keep the local definition and say in one clause how it differs (defined for arbitrary functions) with the agreement on continuous functions as a Check.

## C04 — The bullet on zonal spherical functions in §6.4 is not an exact statement

"The continuous bi-`T`-invariant eigenfunctions of convolution are the `D^l_{00}`" does not say which operators the functions are eigenfunctions of, and without a normalisation every scalar multiple of `D^l_{00}` qualifies. The intended statement is presumably: a continuous bi-`T`-invariant `φ` with `φ(1) = 1` satisfies `convolution f φ = λ(f) φ` for every continuous bi-`T`-invariant `f` (equivalently the functional equation of §3.2) if and only if `φ = D^l_{00}` for some `l`. State it with those quantifiers.

## C05 — Three declarations of `Suggested.lean` close in one tactic and ask an implementer for nothing

On a copy of the file: `isIrreducible_unitaryModel` is `(monomialScale d).isIrreducible_congr (isIrreducible_symPowerModel d)`, as its own README route says; `matrixElement_eq_conj_matrixCoeff` closes by `simp [matrixElement]`; `eulerLaplacian_sphere` closes by `simp [eulerLaplacian, sphereLaplacian]` for every `u` and `p`, because the `γ`-derivatives of a function that ignores `γ` vanish by unfolding. If they are kept as sanity checks or supporting steps (the first is needed by `irrepModel`), mark them as such next to `monomialNorm_pos` and `continuous_unitaryModel`; otherwise they belong in the README as Checks.

## C06 — The description counts 34 definitions; the file has 33

"`Suggested.lean` has 34 definitions and 78 theorem statements (76 with `sorry`)": the head has 33 `def`s, 78 theorems and 76 `sorry`s. The right text is "33 definitions".

## N01 — Several Checks report a numerical experiment in place of a value

For example "hold for random `g, h` and `d ≤ 5`, with error below `10⁻¹³`" (§2.2), "computed by numerical quadrature" (§1.3), "agrees with SciPy's Ferrers function" (§2.6) and "All numbers above were recomputed in double precision with NumPy and SciPy" (Examples). A reader cannot verify these in the text and a year from now they read as process. A Check that states one instance with its value (as most of the others do) would serve.

## N02 — The supplier contract for the double cover names a module but no declarations

"From Tau Ceti's SU2 Adjoint module" could name what is consumed: upstream these are `TauCeti.pauliRotation`, `TauCeti.SU2.toSO3`, `TauCeti.SU2.toSO3_surjective`, `TauCeti.SU2.toSO3_eq_one_iff` and `TauCeti.SU2.quotientKerToSO3`.

## N03 — Two proved theorems have no docstring

`monomialNorm_pos` and `continuous_unitaryModel`.

## Questions for the author

- Do (4.1.9), (4.1.12) and (4.1.25) of Edmonds read the same in the 1957 edition and in the 1996 reprint that the References cite together, in particular which of `α`, `γ` is attached to `m'`? The claim that his displayed formulas "hold verbatim" depends on it. I could not read either printing.
- The References say errata of [VK] §§6.3.3, 6.3.6, 6.3.7, 6.6.1, 6.7.2, 6.8.1, 6.9.2 and of [KV] (19) were "applied". What is the error at each locator (a sign, a missing factor)? The README names only the factor `i^{m−n}` in [KV] (19). I could not read either text, so none of them is recorded below.

## Verified sound

Every row was computed from the Lean definitions as written (natural-number subtraction included), in double precision, for `d ≤ 6` unless stated; "err" is the largest absolute difference of the two sides.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §1.1 `euler`, `bijOn_euler`, `exists_euler_eq` | `γ ↦ γ + 2π`; `β = 0`; uniqueness mod periods | `euler α β (γ+2π) = −euler α β γ`; `(u,v) ↦ (u+2πa, v+2πb)` forces `γ` mod `4π` | holds |
| §1.2 `pauliRotation_euler` (sample) | `(0.7, 1.1, −2.3)`; `torusExp 0.4` | err `2e−16`; torus gives `R_z(−0.8)`; `R_y(β)` vs `R_y(−β)` differ by `1.782` at `1.1` | holds |
| §1.3 Haar density (sample) | mass; half box; no density | `2π·2·4π/(16π²) = 1`; `1/2`; `8π³/16π² = π/2`; `∫|D^1_00|² = 1/3` | holds; route sentence false (R02) |
| §1.4 `isUnitary_unitaryModel` (sample) | random `g`, `d ≤ 6`; wrong scalings at `eulerMiddleX 0.7`, `d = 2` | `‖D*D − 1‖ ≤ 8e−16`; unscaled `0.677`; inverse scaling `1.655` | holds |
| §2.1 `matrixElement_eq_entrySum`, `matrixElement_spinHalf` | random `g`; `A = [[2,3],[5,7]]` | err `4e−16`; `entrySum 2 1 1 A = 29`, `det A = −1`; `entrySum 1 0 0 A = 7 = A₁₁` | holds |
| §2.2 group law, inverse, unitarity, centre (sample) | random `g, h` | errs `6e−16`, `3e−16`, `8e−16`, `5e−16`; `(−1)^d` | holds |
| §2.3 `matrixElement_euler` (sample) | five triples incl. `β = 3.9, −0.8, 0` | err `9e−16`; `d = 2` matrix equals the printed spin-1 matrix; unreversed differs by `1.108` at `0.9` | holds |
| §2.4 `wignerSmallD_eq_jacobi`, hypergeometric (sample) | all `i, k ≤ d ≤ 6`, four `β` | errs `4e−16`, `3e−15`; `r + a + b = d − r` exactly; `jacobi 1 0 1 = (3X+1)/2` | holds |
| §2.5 six symmetries and values (sample) | `i, k ≤ d + 2` (out-of-range indices too) | errs `≤ 5e−16`; `d^{1/2}`: `wd 1 1 0 π = 1`, `wd 1 0 1 π = −1` | holds |
| §2.6 Legendre, Ferrers, Gegenbauer | `l ≤ 5`, `n ≤ l` | errs `6e−16`, `7e−16`, `2e−15`; `d^1_{10} = sin β/√2` | holds |
| §2.7 `eulerX_eq_euler`, `matrixElement_eulerX` | five triples, `d ≤ 5` | errs `1e−16`, `8e−16`; without `i^{m−m'}` off by `1.726` | holds |
| §3.1 addition theorems (sample) | three triples, `d ≤ 4`, `l ≤ 4` | errs `8e−16`, `6e−16`; `l = 1` is the cosine law | holds |
| §3.2 product formula, functional equation | `l ≤ 4` | errs `3e−16`, `1e−16`; unaveraged: `−1` vs `0` at `eulerMiddle (π/2)` | holds |
| §3.3 `integral_wignerSmallD_mul_wignerSmallD` | nine pairs `(d, d')` incl. `(0,2)`, `(5,1)` | quadrature err `2e−7`; value `2/(d+1)` or `0` | holds |
| §3.4 Plancherel (sample) | `f = D^1_00`; `f = 1` | `3·(1/3)² = 1/3`; `1`; follows from Schur values above | holds |
| §4.1 commutators, Casimir, derivatives (sample) | `d ≤ 5` | errs `9e−16`, `2e−15`; derivative err `3e−10`; raising coefficient `√((d−k)(k+1))` exact | holds |
| §4.2 ODE, recurrence, generating function (sample) | `d ≤ 5`, incl. `k = 0, d` | errs `7e−8` (finite differences), `2e−8`, `2e−16` | holds |
| §4.3 Casimirs, `eulerLaplacian` | `d ≤ 3`; a non-eigenfunction `D²₀₁D¹₁₁ + D³₀₂` | eigen err `6e−7`; both Casimirs equal the Laplacian to `1e−8`; wrong sign residual `−1.6603` | holds |
| §5.1 characters (sample) | `d ≤ 5` | err `2e−15`; `tr = U_d(cos(β/2) cos((α+γ)/2))` | holds |
| §5.2 Krawtchouk | `d ≤ 6`, `β ∈ {0.4, 1.1, 2.8}`, `p ∈ {0.3, 0.85}` | errs `3e−15`, `4e−14`; `K_1(2; 0.3, 3) = −11/9` | holds |
| §6.1 column, row, orbit, rotation law (sample) | `l ≤ 4`; off-sphere `x` | errs `≤ 1e−15`; orbit `(−0.6816, 0.5741, 0.4536)`; off sphere `l = 2` defect `0.036`, `l = 1` none | holds |
| §6.2 eigen-equation, solid harmonics | `l ≤ 3`, `x = (0.3, −0.5, 0.9)` | finite-difference errs `3e−6`, `6e−10` | holds |
| §6.3 orthonormality, addition theorem (sample) | `l, l' ≤ 3` quadrature; random unit `x, y` | errs `7e−5`, `5e−16` | holds; ownership R01 |
| §6.4 Gel'fand criterion (sample) | `(0.7, 1.1, −2.3)` with the stated `k₁, k₂` | `k₁ g k₂ − g⁻¹ = 0`; convolution of matrix elements `δ_{jk} D_{il}/(d+1)` by Schur | holds; C03, C04 |
| `jacobi` copy | LaguerreJacobi `Suggested.lean` on main | identical body; equals Legendre for `l ≤ 6` (err `2e−15`) | holds |
| `pauliRotation` copy | upstream Tau Ceti `pauli`, `pauliCoord` | same Pauli map and coordinates `(Re A₁₀, Im A₁₀, Re A₀₀)`; homomorphism err `2e−16` | holds |

- Source locators checked against the text: 9, all DLMF (18.5.7, 18.5.8, 18.7.1, 18.7.9, 14.6.1, 14.30.1, 14.30.8, 14.30.9, 18.20.6 with Table 18.19.1); all agree with the README.
- Library declarations opened at the pin: `TauCeti.SU2.symPowerModel` (SU2/Exhaustion.lean:97), `weightBasis` (SU2/Weight.lean:84), `coe_torusExp` (SU2/Basic.lean:393), `ContinuousLinearEquiv.congr` (Continuous/Transport.lean:63), `ContRepresentation.matrixCoeff` (Continuous/MatrixCoefficient.lean:70), `IrrepModel`, `IsIrrepSkeleton` (Compact/PeterWeyl.lean:137, 214), `existsUnique_nonempty_equiv_symPower` (SU2/Exhaustion.lean:298), `schur_orthogonality` (Compact/SchurOrthogonality.lean:151), `convolutionCLM` (Compact/Convolution.lean:206), `TauCeti.krawtchouk` (InformationTheory/Coding/Krawtchouk.lean:39); all 25 `#check` lines elaborate.
- Cross-roadmap citations resolved: LaguerreJacobi §§3.2, 3.3, 3.4, 4.3, 6.1, 6.2 (on main); RepresentationTheory/CompactGroups §§E.1–E.4 (on main); SpecialFunctionsGroupModels (open) cites this roadmap's §§1.1, 1.3, 1.4, 2.1, 2.3, 4.2, 6.4 and restates none.
- Dependency check output: `depcheck: 185 roadmaps, 2083 edges, 0 problem(s)`; no upward or cyclic line.
- Elaboration of `Suggested.lean` at the pins: no error, 76 `sorry` warnings and nothing else. The file has no `variable` line, so no declaration can lose a binder; signatures read against the README, none differs.
- One-tactic probe: 9 theorems tried on a copy; 3 close (C05), 6 do not.
- Automatic checks: one form check failed (below); the targeted build and the text scanners passed.
- Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsLegendre, CompactGroups (main); spherical harmonics, their orthonormality, addition theorem, completeness and Laplace equation, and the Legendre addition theorem are shared with SpecialFunctionsLegendre with no single owner (R01); the `SU(2)` conventions, matrix elements and the pair `(SU(2), T)` are owned here and cited by SpecialFunctionsGroupModels; the `SU(2)` engine is owned by CompactGroups and cited here.

Source independence: 9 passages compared with 1 source (DLMF), none shared beyond formulas; largest share E, 65 of 179 locators; neither the text nor the contents page of E (nor of VK, 50 locators) could be read; by the section numbers the README itself cites, the layers are not one to one with either book (Layer 3 draws on E §4.6 and VK §§6.6, 6.10; Layer 6 on E §§2.5, 4.1, 4.6).

Research link: none found. The README cites textbooks and a survey (Edmonds 1957; Vilenkin–Klimyk 1991; Klimyk–Vilenkin 1995) and names as consumers SpecialFunctionsGroupModels and a roadmap on Clebsch–Gordan coefficients; it names no research result. Rests on the README.

## Not verifiable

- Every locator into [E] (sample targets 1.2, 1.3, 1.4, 2.2, 2.3, 2.4, 2.5, 3.1, 4.1, 4.2, 6.1, 6.3): the publisher's page is not an open copy and no legal copy was found.
- Every locator into [VK] and [W] (sample targets 1.2, 1.3, 1.4, 2.2, 2.3, 2.5, 3.1, 3.4, 4.1, 4.2, 5.1, 6.1, 6.3, 6.4): paywalled publisher; recorded as uncertified.
- Every locator into [D], [KV] and [M] (sample targets 1.2, 1.4, 2.2, 2.4, 2.5, 3.1, 4.1, 5.1, 6.1, 6.4): no legal copy found (publisher pages; a web search for an author's copy of [M] found none).
- The errata of [VK] and [KV] that the References say were applied: the texts could not be read.
- The double cover and the differential of `Sym^d` are not in the pinned Tau Ceti, as the README says; the upstream Adjoint module was read and has the homomorphism, surjectivity, the kernel `{±1}` and the quotient isomorphism; the Differential module was not opened.

Automatic checks set aside as false positives: the rule that a section comment in the Lean file must head a declaration fired on the closing block of `#check` lines, which pin the consumed library declarations and are allowed.

## Source issues

- none

## For the human reviewers

- Not tested: Edmonds [E] has the largest share of locators (65 of 179) and Vilenkin–Klimyk [VK] the next (50); neither text nor table of contents could be read, so wording and arrangement were not compared with them.
- Licence: the README's last section (lines 932–956) says the roadmap reuses conventions and declaration names of the public repository lean-SFVK (Apache-2.0, same author); that repository was not opened.
- Scope: all seven references are monographs, a survey or the DLMF (1957–1995); the README names no research article and no research result its headlines serve (`Research link: none found`).
- Sources: six of the seven cited works ([E], [VK], [KV], [W], [D], [M]) could not be read legally; only the DLMF locators were verified.
