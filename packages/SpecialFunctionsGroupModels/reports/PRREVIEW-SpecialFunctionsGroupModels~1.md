# Review of SpecialFunctionsGroupModels (pull request #2694 at fe90034)

**Verdict:** needs changes

**Summary.** Changes are needed: five findings. The GNS theorem for positive-definite functions on a general group, which 5.3 consumes from Tau Ceti, is not in the pinned Tau Ceti (it has it for commutative additive groups only); and four sentences assert false mathematics: the multiplier of the left regular representation for the right Haar measure is inverted, the change-of-basis formula of 3.2 claims an absolute convergence that fails, the proof of the converse of unitarity in 2.1 uses a test that the README's own Check shows does not work, and one numerical Check value is wrong. The stated theorems of `Suggested.lean` survived the computed pass (it elaborates with `sorry` as the only warning, and every other numerical Check was reproduced). There are six small corrections and three format notes, none blocking. None of the six cited books could be read from a legal copy, so no source locator was verified; that is left to the human reviewers.

## R01 (P1) — The GNS theorem for positive-definite functions on a general group, which 5.3 consumes from Tau Ceti, is not in Tau Ceti at the pin

The third bullet of 5.3 (positive-definite spherical functions come from representations, README line 1226) rests on "Tau Ceti's GNS construction", and the supplier contracts (line 314), the Inputs (line 194), the summary (line 32) and the pull request's description all locate it in `TauCeti/RepresentationTheory/Continuous/Unitary/PositiveDefinite.lean`. An implementer of 5.3 for `G = SU(1,1)` or `M(n)` has no such input.

At the pinned Tau Ceti commit (`2fd255d`) the directory `TauCeti/RepresentationTheory/Continuous/Unitary/` contains `Basic.lean`, `Equivalence.lean`, `OneParameter.lean` and `StronglyContinuous.lean` only. The GNS construction that exists is `TauCeti/Analysis/PositiveDefinite/Function/GNS.lean`, whose line 39 reads `variable {G : Type*} [AddCommGroup G] {F : G → ℂ} (hF : IsPositiveDefiniteSub F)`: it is for commutative additive groups (it feeds Bochner's theorem in `TauCeti/Analysis/Bochner/LocallyCompactGroup.lean`). What the pin does have in general is the Kolmogorov space of a positive semidefinite kernel (`Matrix.PosSemidef.KolmogorovSpace`, imported by that file from `TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean`).

The smallest change: stop attributing the theorem to Tau Ceti in those four places, and either cite FactorRigidity §4.1 (on main; it states that positive-definite functions on a group are exactly the coefficients `⟨ξ, π(g)ξ⟩` of unitary representations) for the algebraic statement and keep strong continuity from the continuity of `φ` as this roadmap's part of 5.3, or state the GNS representation of a positive-definite function on an arbitrary group as a target of 5.3, built on the pinned Kolmogorov space.

## R02 (P2) — For the right Haar measure the left regular representation of the `ax + b` group has multiplier `Δ(g)^{−1/2}`, not `Δ(g)^{1/2}`

The Examples of Layer 1 (README line 672) say: "with right Haar measure it is the multiplier representation with `α(g, x) = Δ(g)^{1/2}`". With the README's own conventions this operator is not unitary, so the example contradicts the unitarity criterion of 1.3.

By 0.2, `Δ(a, b) = a` and `μ_R = a⁻¹ da db`. For `g = (2, 0)` and `E = [1, 2] × [0, 1]`: `gE = [2, 4] × [0, 2]`, `μ_R(E) = log 2`, `μ_R(gE) = 2 log 2`. Hence `Measure.map (g • ·) μ_R = Δ(g)⁻¹ μ_R`, so `ρ(g, x) = Δ(g)⁻¹`, and `‖f(g⁻¹ ·)‖² = Δ(g) ‖f‖²` in `L²(μ_R)`. The criterion `|α|² = ρ` gives `α = Δ(g)^{−1/2}`; with `Δ(g)^{1/2}` one gets `‖T(g) f‖² = Δ(g)² ‖f‖²`, which is `4 ‖f‖²` here. (The Check of 0.2 at line 489 already records that left translation by `(2, 0)` doubles `μ_R` of a set.)

Replace `Δ(g)^{1/2}` by `Δ(g)^{−1/2}`.

## R03 (P2) — The change-of-basis formula of 3.2 does not converge absolutely as a double series

The last bullet of 3.2 (README line 991) states `D'_{m'm} = Σ conj c_{jm'} D_{jk} c_{km}` "with absolute convergence". An implementer would state summability of the norms over pairs `(j, k)`, which is false.

Take `G = ℤ` acting on `L²(haarAddCircle)` by powers of multiplication by `ψ(θ) = e^{iθ/2}` on `[0, 2π)`, a unitary representation, and `e` the trigonometric basis. Then `D_{jk}(1) = ψ̂(j − k)` and `|ψ̂(n)| = 1/(π |n − 1/2|)`. Let `x_j = 1/(√(j+1) log(j+2))` for `j ≥ 0` and `0` otherwise; `x ∈ ℓ²`, and `Σ_{j,k} x_j |D_{jk}| x_k ≥ Σ_j x_j² π⁻¹ Σ_{d ≤ j/2} 1/d`, which is comparable to `Σ 1/(j log j) = ∞`. Any Hilbert basis `e'` containing `x/‖x‖` then has a divergent double series for its diagonal matrix element. (The matrix of absolute values of a bounded operator need not be bounded.)

What is true is the iterated form: `D'_{m'm} = Σ_j conj c_{jm'} (Σ_k D_{jk} c_{km})`, each of the two sums absolutely convergent, by Parseval and Cauchy–Schwarz as in the addition theorem. State that, or drop "with absolute convergence".

## R04 (P2) — Testing `f = 1` does not prove that a unitary principal series has `Re τ = −1/2`

The proof paragraph of 2.1 (README line 729) says: "Unitarity at `Re τ = −1/2` is the criterion of 1.3; the converse tests `f = 1`." The test does not separate `Re τ = 0` from `Re τ = −1/2`, as the Check at line 737 states.

`‖T(g) 1‖² = ∫ |b e^{iθ} + conj a|^{4 Re τ} dθ/2π`, which is `1` at `Re τ = 0` trivially and at `Re τ = −1/2` by the Poisson integral; I recomputed `‖T_{(0,0)}(g) 1‖² = 1.000000` and `‖T_{(0,0)}(g) f‖² = 11.4937819663` for the `g` and `f` of the Check at line 737. The theorem `SU11.isUnitary_principalSeries_iff` is true; only the route is wrong.

The converse follows from the other direction of the criterion of 1.3 (`exists_isUnitary_multiplierAction_iff` with uniqueness of the realization): unitarity forces `|u|^{4 Re τ + 2} = 1` almost everywhere, which fails for any `g` with `b ≠ 0` unless `Re τ = −1/2`. Replace "the converse tests `f = 1`" by that.

## R05 (P2) — The value `φ_{−0.3}(b_5) = 0.41425 42793` in the Checks of 5.2 is wrong

The last Check of 5.2 (README line 1210) gives "at `τ = −0.3`, `φ(b_5) = 0.41425 42793`". Since the README declares its Checks statements to prove, this one cannot be proved.

`φ_τ(b_t) = ∫ (cosh t + sinh t cos θ)^τ dθ/2π`. At `τ = −0.3`, `t = 5` the periodic trapezoid rule gives `0.4120799646` with 2000, 20000 and 200000 nodes alike; the two-term asymptotic expansion `Γ(τ+½)/(√π Γ(τ+1)) (2 cosh t)^τ + Γ(−τ−½)/(√π Γ(−τ)) (2 cosh t)^{−τ−1}` gives `0.4452 − 0.0332 = 0.4121`. The same program reproduces the other values of that Check (`φ_1(b_5) = 74.2099485248`, and `2.3364502682`, `1.4099165308`, `0.9016545857` for the functional equation). The printed value is that of `t ≈ 4.98`.

Replace it by `0.41207 99646`.

## C01 — Five statements of `Suggested.lean` close in one step, among them the one that stands for the quasi-regular representation

On a copy of the file each of these is closed by a single term or `simp` call: `multiplierRep_unique` (line 530, by `Lp.ext` on the two hypotheses), `matrixElement_eq_conj_matrixCoeff` (line 956, `simp [matrixElement]`), `continuous_matrixElement` (line 962, `Continuous.inner continuous_const h`), `matrixElement_one` (line 983, orthonormality of the basis), and `isMultiplierCocycle_sqrt` (line 599, `simp [IsMultiplierCocycle, h₁, hmul]`). As targets they ask an implementer for nothing. The first conjunct of `SU11.antiDiscreteAction_spec` (line 839) likewise holds by unfolding.

The first four would be marked as sanity checks of the definitions, or moved to the README as Checks. The fifth carries the bold headline "Quasi-regular representation" of 1.3, whose content is that `f ↦ ρ(g, ·)^{1/2} f(g⁻¹ • ·)` is a unitary representation on `L²(μ)`; that is statable with the file's own definitions (the conclusion of `multiplierRep_spec` for `α = √ρ` under `IsQuasiInvariantWith μ ρ`), and would replace the algebra on square roots.

## C02 — The half-plane models of `D_l^±` are not in NoncompactQuantumSymmetry M6.C

Scope and ownership (README line 120), the supplier contracts (line 350) and 2.3 (line 823) cite "M6.C" for the Fourier–Laplace and upper half-plane models of `D_l^±`. On main, M6.C is "the complementary×complementary SL(2,ℝ) tensor adapter" and mentions neither model. They are stated in M6 under "Two spacelike inputs: the complete Gram-stratified table" (the Fourier–Laplace model with norm `∫ |φ(ξ)|² ξ^{1−l} dξ` and the half-plane norm `2^{l−1}/Γ(l−1) ∫ |F|² y^{l−2}`). Cite that subsection of M6.

## C03 — Multiplicity one in 5.3 uses a Schur lemma on Hilbert space that its `*Needs:*` line does not name

"How to read the build" (README line 388) says multiplicity one "needs Schur's lemma for a commutative `*`-algebra of operators", but the `*Needs:*` line of 5.3 lists only 5.1–5.2 and the GNS theorem. The pinned `TauCeti/RepresentationTheory/Continuous/Schur.lean` is the algebraic lemma (its hypothesis is `Representation.IsIrreducible`, no closed subspaces), so it does not serve an infinite-dimensional unitary representation. CStarAlgebras §2.2 (C2.2), on main, owns "irreducible exactly when the commutant is scalar"; name it in the `*Needs:*` line of 5.3 and in the supplier contracts.

## C04 — The irreducibility of the sphere models is statable with a definition of the kind the file already makes

The module docstring (`Suggested.lean` line 19) says this bold headline of 2.6 is not stated because it needs the sphere as an `M(n)`-space carrying `multiplierRep`. The file already gives `ℝ` such a structure for `AxB` and for the Heisenberg group (lines 290 and 891) and states irreducibility for `axbRep` in exactly this form. With a `MulAction (MotionGroup n) (Metric.sphere 0 1)` by `rotE` and the multiplier `e^{iR⟨a, ξ⟩}`, the statement of 2.6 for `n ≥ 2` would read as the third and fourth conjuncts of `axbRep_spec` do. Either state it, or say in the docstring that the definition was left out by choice.

## C05 — The supplier list and the description omit two sections of SpecialFunctionsSU2MatrixElements that the text cites

The supplier contracts (README line 363) and the description list "its §§1.1, 1.3, 1.4, 2.1, 2.3, 4.2 and 6.4". The Conventions also cite its §2.7 (line 244, the Vilenkin–Klimyk dictionary) and 3.1 cites its §2.2 (line 966, group law and unitarity relations); both exist at that roadmap's open head. The right list is §§1.1, 1.3, 1.4, 2.1–2.3, 2.7, 4.2 and 6.4, in both places.

## C06 — The Check of 2.2 evaluates M5's eigenvalue outside the range M5 states it for

The Check "`w(1)/w(0) = 7/3 = a_2(−0.4)`" (README line 792) uses NoncompactQuantumSymmetry M5's `a_{±2j}(s)`, which that roadmap gives for `C_s = I_(0,s)` with `0 < s < 1`. For `−1/2 < τ < 0` the parameter `ν = −(2τ + 1)` is negative; M4 does admit `0 < |ν| < 1`, and the product formula is right there too (I checked the recursion `w(n+1)/w(n) = (n+1+τ)/(n−τ)` against invariance under `J_±`), but a reader matching against M5 finds `a_2(0.4) = 3/7`. One clause would settle it: for `ν < 0` the ratio is `1/a_{±2j}(|ν|)`, the form of `I_(0,ν)`, which M4's intertwiner identifies with `C_{|ν|}`.

## N01 — In 0.2 (README line 469) the `ax + b` group is called "triples `(a, b)`"; they are pairs.

## N02 — `Suggested.lean` line 302 declares `MeasurableSpace (SOn n) := borel _` although the pinned Mathlib already gives `↥(Matrix.specialOrthogonalGroup (Fin n) ℝ)` a measurable space through the subtype of matrices, so two non-identical instances are in scope; and the `MulAction (TauCeti.HeisenbergGroup ℝ) ℝ` of line 891 is a global instance on a library type. Both would be `scoped` or `local`, as `circleMulAction` already is.

## N03 — `multiplierRep` (line 506) and `SU11.principalSeries` (line 693) pick their value by `h.choose`; the docstring says so, and the alternative is to build the operator from `Lp.compMeasurePreserving` and the bounded multiplier. The two closing `/-! ## … -/` headers (lines 1255 and 1294) have only `#check` lines under them.

## Questions for the author

- In 2.6 the sphere model `T_R` is identified with NoncompactQuantumSymmetry M6's `T_(R, 0)` and `S_(R, 0)`. That roadmap writes the character of `F₂` as `exp(i k·v/ℏ)` and relates radii by `κ_(F₂) = ℏ κ_Δ`. Is the radius of `e^{iR⟨a, ξ⟩}` in its labelling `R` or `ℏR`? I did not follow its normalisation of `ℏ` through M6 far enough to decide.
- The four "corrected source statements" (Klimyk–Vilenkin §1.6, Vilenkin–Klimyk §§6.1.2 and 6.4.4, Wawrzyńczyk §2.8, Vilenkin–Klimyk §1.2.7) are right as mathematics in the corrected form; I could not read the printed forms. Do the negative controls quote the print exactly, including each source's own group law?

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.1 Euler factorization, ranges | product `k_α b_t k_γ`; period lattice | `a = ch e^{i(α+γ)/2}`, `b = sh e^{i(α−γ)/2}`; lattice covolume `8π²` = area of `[0,2π)×[−2π,2π)` | holds | none |
| 0.1 `eulerHaar`, Lie basis, Casimir | `{t ≤ 1}`; brackets | `(8π²)⁻¹·2π·4π·(cosh 1 − 1) = 0.5430806348`; `[b₁,b₂] = −b₃`; `[b₁, b₁²+b₂²−b₃²] = 0` | holds | none |
| 0.1 `mem_su11_iff`, `SU(2)` conversion | `[[0,1],[−1,0]]`; `β = it` | `gᴴJg = −J`; `k_α b_{it} k_γ` has `b = i sh e^{i(α−γ)/2}` = `g(α+π/2, t, γ−π/2)` | holds | none |
| 0.2 `axb_haar`, modular function | `g = (2,0)`, box `[1,2]×[0,1]` | `μ_L`: `1/2` and `1/4`; `μ_R(gE) = 2 μ_R(E)`; Mathlib: `haarScalarFactor (map (· * g) μ) μ` | holds | none |
| 0.2 oscillator and triangular groups | `s(1,0,0)²`; Jacobians | `(1,3)`: `iδ` with `δ = δ₁+δ₂ − Im(c)/4`; misprint gives `−5/4 ≠ −2`; both densities `e^{−τ}` | holds | none |
| 0.3 motion groups | `M(1)`, `M(2)`, `iso(2)` | `(−1,1)`: `r e₁ = 1 ≠ −1`; `[b₂,b₃] = b₁`, `[b₃,b₁] = b₂`; `cosh 2 = 3.7621956911` | holds | none |
| 1.1 Radon–Nikodym cocycle | translation with `eˣ dx`; half-plane | `ρ = e^{−g}`; `|1.6 − 1.3i|⁻⁴ = 0.0553633`, `|2.4 + 1.3i|⁻⁴ = 0.0180172` | holds | none |
| 1.2 representation law | `α ≡ 0`, `α = χ(g)` | `T(g)T(h)f = α(g,x)α(h,g⁻¹x) f((gh)⁻¹x)`; `α ≡ 0` fails `α(1,x) = 1` | holds | none |
| 1.3 unitarity criterion, strong continuity | both directions; `ρ = 0` or `∞` | `∫(|α|² − ρ)|h|² = 0` on `L²(ρμ)`; `ρ ∈ (0,∞)` a.e.; uniform convergence on `V·supp f` (no countability used) | holds | none |
| 1.3 Layer 1 example (right Haar) | `g = (2,0)` | `ρ = Δ⁻¹ = 1/2`; `Δ^{1/2}` gives norm² factor `4` | false | R02 |
| 1.4 cohomologous multipliers | `β = e^{ix}`, `β = eˣ` | twist `e^{ig}`; twist `e^{g}`, modulus `≠ 1` | holds | none |
| 2.1 unitarity, adjoint, weights | Check data | `11.0000`, `12.0198880665`, `11.4937819663`; adjoint `−1.19620 − 0.38632i` both sides, wrong parameter `−1.99828 − 0.47504i` | holds; sketch false | R04 |
| 2.1 `ofSL2R`, compact picture | `h = [[2,3],[1,2]]`, `t = 0.81` | `a = 2 − i`, `b = 2i`; both sides `−0.3133253614 + 2.7950357546i` (`e=0`), `−1.7051684444 − 2.2366935927i` (`e=1`) | holds | none |
| 2.2 complementary weights | `τ = −0.2, −0.3, −0.8, 0.3` | `w(−0.2,0) = 0.25360`, `w(−0.2,1) = 1.01439`; ratios `7/3`, `4.38971`, `1/6`; `w(0.3,0) < 0` | holds | C06 |
| 2.3 discrete series | `k = 2,3,5`; kernel point | `‖zʲ‖² = C(k−1+j,j)⁻¹`: `1/2`, `1/10`, `1/5`; `‖h‖² = 2.43333`; kernel `1.01357 − 0.61087i` | holds | none |
| 2.4 `axbRep_spec` | product order | law exact (`1e−16`); reversed order differs by `0.2505463` | holds | none |
| 2.5 Schrödinger, Fourier dictionary | cocycle; substitution `w = v + x` | exponent `z+z'+(y+y')X+xy'` both sides; `𝓕` phase `2πxξ + z − xy`, shift `ξ − y/2π`; matches M2's `π_1` | holds | none |
| 2.6 sphere models | `M(2)`, `R = 1.7`, `r = 0.8`; `n = 1` | `i³ J₃(1.36) = −0.046620 i` by series; `n = 1` splits into `e^{±iRa}` | holds | C04 |
| 3.2 addition theorem, unitarity relations | shift on `ℓ²(ℤ)`; `τ = 0.1` | column sum `1.0585138265`; rows need `U U* = 1`, true for a group | holds | none |
| 3.2 change of basis | `ψ = e^{iθ/2}` | `|D_{jk}| = 1/(π|j−k−½|)`, double sum `≳ Σ 1/(j log j)` | false as stated | R03 |
| 3.3 weights, Euler factorization | non-unitary `τ` | `T(k_α)* e_{m'} = e^{−im'α} e_{m'}` for all `τ`; `D₀₀(b_{0.9}) = 0.8331690033` | holds | none |
| 4.1 ladder operators | general `n`, `ε` | `A₁zⁿ = ½[(τ+ε−n)z^{n+1} + (τ−ε+n)z^{n−1}]`; `J₊ → (m−τ)`, `J₋ → −(m+τ)` | holds | none |
| 4.2 Casimir, `q_B` dictionary | `τ = 0.23+0.4i`, `−½+0.8i`, `−k/2` | `0.1229 + 0.584i`; `−0.89`; `0, −3/4, −2`; `−b₁+ib₂ = −E_+`, `−b₁−ib₂ = E_−` | holds | none |
| 4.3 template ODE | four parameter sets, `t = 0.9` | residuals `1e−9` to `6e−12` (finite differences); with `−coth t`: `0.95678` | holds | none |
| 5.1 Gel'fand's criterion, symmetric pairs | `M(n)`; transpose on `SU(1,1)` | `σ(kp) = k⁻¹(kp)k⁻¹`; `gᵀ = (k_γ k_α⁻¹) g (k_γ⁻¹ k_α)`; `b_{−t} = k_π b_t k_π⁻¹` | holds | none |
| 5.2 spherical transform, characters | functional equation; `t = 5` | `2.3364502682`, `1.4099165308`, `0.9016545857` both sides; `φ_{−0.3}(b_5) = 0.4120799646` against `0.4142542793` | one value false | R05 |
| 5.3 spherical functions of representations | projection onto fixed line | `∫_K ⟪v, U(xky)v⟫ = ⟪U(x)⁻¹v, v⟫⟪v, U(y)v⟫`; GNS input absent at the pin | holds; supplier missing | R01, C03 |
| 5.4 radial equation | `cosh t`, `cosh² t` | `c = 2`; `6cosh²t − 2`, not a multiple | holds | none |

- Source locators checked against the text: 0 of the 15 sampled subsections (no legal copy of any of the six books).
- Library declarations opened at the pin: `ContRepresentation.IsUnitary` (`Unitary/Basic.lean:49`), `matrixCoeff` (`MatrixCoefficient.lean:70`), `leftRegular`, `coeFn_leftRegular` (`LeftRegular.lean:57, 81`), `HeisenbergGroup` law (`Heisenberg.lean:95`), `Schur.lean`, `PositiveDefinite/Function/GNS.lean:39`, Mathlib `modularCharacterFun_eq_haarScalarFactor` (`ModularCharacter.lean:52`), `SL n R` topological group (`Topology/Algebra/Group/Matrix.lean:128`), `Matrix.PosSemidef` (`PosDef.lean:62`), `besselJ` (`Bessel.lean:55`).
- Cross-roadmap citations resolved: NoncompactQuantumSymmetry `C₀`, `k_t ↦ δ(0,2t)`, M4 induction law, M4.SL2R generators, M4.P `q_B`, M5 `a_{±2j}`, M2 `π_b`, M6 adapters (main and its open head); MetaplecticAutomorphicForms 0.15, 0.17, 1.1, 1.2; RealSemisimpleLieGroups §5.7; BallQuotients §1.6; SmoothBanachRepresentations 0.2, 2, 3.1; CompactGroups Layer 5 gap; LieGroups Layer 9; AutomorphicFormsOnReductiveGroups §§2.1, 2.6, 2.7; SpecialFunctionsSU2MatrixElements §§1.1, 1.3, 1.4, 2.1, 2.3, 4.2, 6.4 at its open head.
- Dependency check: `depcheck: 182 roadmaps, 2072 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean`, 78 `sorry` warnings, no error; elaborated types compared with the README; five definitions omit an unused section instance (harmless).
- One-tactic probe: ten candidates tried on a copy, five closed (C01).
- Duplication: no Gel'fand pair, spherical function, multiplier representation or topological semidirect product in the pinned Mathlib or Tau Ceti; the spherical multiplicity-one of AutomorphicFormsOnReductiveGroups §3.5 is the smooth `p`-adic statement, a different carrier.

Overlap check: read SpecialFunctionsSU2MatrixElements (open), NoncompactQuantumSymmetry (main and open head), QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (open), QuantumFoundations (open); the general matrix element and Gel'fand-pair theory are owned here and SpecialFunctionsSU2MatrixElements says so (its scope names this roadmap as the owner); the `SL(2,ℝ)` dual, the Heisenberg models `π_b` and the Euclidean adapters are NoncompactQuantumSymmetry's and are consumed; nothing else shared.

Source independence: 0 passages compared with 0 sources (none of the six texts could be read); largest share Vilenkin–Klimyk Vol. 1, cited in the Sources line of 21 of 23 subsections; contents not compared with its table of contents, which I could not open. By the locators alone, the layers draw on its chapters out of order (Layer 0: chs. 6, 1, 5, 4; Layer 1: chs. 1, 2; Layer 2: chs. 6, 1, 4; Layer 3: chs. 2, 6; Layer 4: chs. 6, 2; Layer 5: chs. 1, 6).

Research link: The explicit `SU(1,1)`, Heisenberg and motion-group models and their Casimir and weight dictionaries are those NoncompactQuantumSymmetry's unitary dual of `SL(2,ℝ)` is compared with; the Gel'fand-pair layer is the harmonic analysis of Dieudonné 1980 and Wawrzyńczyk 1984 that the planned special-function sequels use. Rests on the README's scope and consumer sections.

## Not verifiable

- Vilenkin–Klimyk, Vol. 1 (Kluwer 1991): paywalled; every locator into it unverified.
- Klimyk–Vilenkin, Encyclopaedia of Mathematical Sciences 59 (Springer 1995): paywalled.
- Wawrzyńczyk (Reidel 1984): paywalled.
- Dieudonné, CBMS 42 (AMS 1980): the publisher's page is not a classified open host.
- Miller (Academic Press 1968): no legal copy found by the sources service; a page on the author's university host was refused because its address does not name him.
- Edmonds (Princeton 1957): the publisher's page is not a classified open host.
- The four misprints the README attributes to its sources, for the same reason.
- NoncompactQuantumSymmetry's `ℏ` normalisation of the `F₂` radius (see the questions).

Automatic checks set aside as false positives: the four `instance … := by sorry` declarations for the motion groups are instances of proposition-valued classes (topological group, local compactness), so they are theorems stated as instances and carry no admitted data.

## Source issues

- none

## For the human reviewers

- **Not tested.** No text of any of the six cited books was readable legally, so neither the wording nor the arrangement was compared with a source; Vilenkin–Klimyk Vol. 1 has the largest share of locators (21 of 23 subsections).
- **Licence.** README "Prior formalization" (line 1303) says the names and statements of 0.1, 1.1–1.3, 2.1 and 3.1–3.2 are those of the author's own repository `bjbraams/lean-SFVK`, stated there as Apache-2.0; I did not open that repository.
- **Licence.** Three requests for texts (Dieudonné, Miller, Edmonds) are recorded for the operator; Miller's book may be on its author's own university page, which the service could not confirm.
