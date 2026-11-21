# Review of SpecialFunctionsRankOneSymmetricSpaces (pull request #2935 at 7ad98a7)

**Verdict:** needs changes

**Summary.** Changes are needed: two findings, both in the text around true theorems. The involution `θ(g) = J (gᵀ)⁻¹ J` of 2.5 is the identity map on `SO₀(n, 1)`, so the symmetric-pair criterion does not apply to it and the Check `θ(a_t) = a_{−t}` is false; and the proof route of the Paley–Wiener theorem of 1.3 does not reach `β = −1/2`, the case of every `ℍⁿ`, where for even `n` it is circular with 4.2. All five findings of the previous review are repaired, every statement of `Suggested.lean` survived its degenerate cases, and the new inversion formula with discrete terms agrees with my computation at three parameter pairs. There are one small correction and two format notes, none blocking; only the DLMF could be read, which is left to the human reviewers.

## R01 (P2) — The involution `θ(g) = J (gᵀ)⁻¹ J` of 2.5 is the identity on `SO₀(n, 1)`

In the first bullet of 2.5 (README line 653) the Gel'fand pair is obtained from the symmetric-pair criterion "with the involution `θ(g) = J (gᵀ)⁻¹ J`, `J = diag(1, −1, …, −1)`", and the docstring of `isGelfandPair_lorentzGroup` (`Suggested.lean` line 615) repeats `g ↦ J g⁻ᵀ J`. An implementer who feeds this `θ` to SpecialFunctionsGroupModels §5.1 cannot verify its hypotheses.

Every `g ∈ G` satisfies `gᵀ J g = J`, so `(gᵀ)⁻¹ = J g J` and `J (gᵀ)⁻¹ J = J J g J J = g`. On the boost: `(a_tᵀ)⁻¹ = a_{−t}` and `J a_{−t} J = a_t`. So this `θ` fixes all of `G`, `P = {p | θ p = p⁻¹}` is the set of elements of order at most two, `G ≠ K P`, and the Check on line 662, "`θ(a_t) = a_{−t}`", is false for it. The proof route on line 657 says "`θ(g) = J g J` on `G` since `gᵀ J g = J`"; that is the value of `(gᵀ)⁻¹`, not of `J (gᵀ)⁻¹ J`.

Smallest change: define `θ(g) = (gᵀ)⁻¹`, which equals `J g J` on `G`, in the bullet and in the docstring. The proof route, both Checks and the second bullet are then true as they stand: `J a_t J = a_{−t}`, and `J k J = k` for `k = diag(1, k')`.

## R02 (P2) — The route to the Paley–Wiener theorem of 1.3 does not reach `β = −1/2`, and for even `n` it is circular with 4.2

The Paley–Wiener theorem is stated for `α ≥ β ≥ −1/2`, and its only consumers on `ℍⁿ` (4.2, 4.3, and the surjectivity of 1.2) use it at `(n/2 − 1, −1/2)`. The Laplace representation of 0.4 and the Abel-transform bullet of 1.3, from which the route takes the factorization and the bijectivity of `𝒜_{α,β}`, are stated for `α > β > −1/2` only. For the rest the route says (lines 478–479) "the boundary cases `α = β` and `β = −1/2` follow by the quadratic transformation of 0.2 and directly from the Fourier case". The quadratic transformation exchanges `(α, −1/2)` with `(α, α)`, which is the other boundary case, and the Fourier case is `(−1/2, −1/2)` alone; so no `(α, −1/2)` with `α > −1/2` is reached. Line 481 then refers `ℍⁿ` to 4.2, and 4.2 (lines 876–877) takes the bijectivity of `𝒜` "for even `n`, from the Paley–Wiener theorems of 1.3". For `n = 2, 4, …` each of the two targets is derived from the other. The README itself says no cited source states the theorem at these parameters, so nothing else carries it.

Smallest change: prove the bijectivity of `𝒜` at `β = −1/2` without the Paley–Wiener theorem. On `ℍ^{m+1}` the closed form of 4.2 is a Weyl fractional integral of order `m/2` in `u = cosh s`; by the Beta integral, `∫_c^∞ (u − c)^{a−1} ∫_u^∞ G(w)(w − u)^{b−1} dw du = B(a, b) ∫_c^∞ G(w)(w − c)^{a+b−1} dw`, so for odd `m` one further integral of order `1/2` followed by `(m + 1)/2` derivatives inverts it and keeps the support (for `m = 1` this is Abel's classical inversion). Say this in 4.2 in place of the appeal to 1.3, state the Abel-transform bullet of 1.3 for `α ≥ β ≥ −1/2` with the one-variable kernel at the boundary, and replace the sentence on the boundary cases.

## C01 — The summary states the two bounds without the hypotheses under which they hold

The opening paragraph (lines 9–10) lists "the bounds `|φ_λ| ≤ 1` for real `λ` and `|φ_λ(t)| ≤ e^{|Im λ| |t|}`" with no condition on `(α, β)`, while 0.4 proves them for real `α ≥ −1/2`, `α + β + 1 ≥ 0`, and its own negative control gives `|φ_{0.3}^{(−1/4,−3/2)}(3)| = 5.47`. Add "for real `α ≥ −1/2` and `α + β + 1 ≥ 0`".

## N01 — The *Needs* lines of 1.2 and 1.3 name each other

1.2 needs 1.3 (for the surjectivity of the unitary map) and 1.3 needs 1.2 (for the discrete terms); the targets themselves are not circular, since the Paley–Wiener theorem does not use 1.2. One line per target, or a clause saying which target needs which, would show that.

## N02 — The Paley–Wiener theorem of 1.3 has no locator, and the two papers the text names for it are not in the References

Lines 450–452 say that none of the cited passages states the theorem and that Klimyk–Vilenkin refer to Flensted-Jensen (1972) and Koornwinder (1975). Listing those two papers in the References, with the theorem numbers, would give the target a locator.

## Verified sound

Earlier findings at this head. R01 (complementary-series kernel): repaired; 3.4 now states the form for `λ ∈ i(−ρ, 0)` and transports it to `i(0, ρ)`; exponents recomputed below. R02 (DLMF 15.4.15): repaired; the right side is now `2 sinh((1 − 2a)t)`. R03 (Paley–Wiener and Carlson attributed to Mathlib): repaired; AutomorphicSpectralTheory §1.6 and SpecialFunctionsGamma §10.1 are cited and both state what the contracts say. R04 (hyperboloid owner): repaired; RiemannianGeometry R4.7 is named in the scope section, the contracts and the comparison bullets of 2.1–2.3. R05 (missing headlines): repaired; `jacobiTransform_inversion_discrete` and `jacobiTransform_paley_wiener` are stated. C01–C05 and N01: all applied.

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 0.1 definition, polynomial case | `φ_{0.5}^{(1,0)}(1)`; `k = 1` at `(1, 1/2)`, `t = 0.7` | `0.6087020756`; `2.0070361572` both sides | agrees |
| 0.1 junk values | `α + 1 ∈ −ℕ`; `λ = iρ` | both sides of the equation `0`; first parameter `0`, `F = 1` | hypotheses sufficient |
| 0.2 Fourier, `ℍ³`, quadratic, `(1/2, 1/2)` | `(1.3; 0.7 − 0.2i; 1.4)`; `λ = 0.9, t = 0.8` | `0.4739125261 + 0.0300453896i` both; `0.6168206088` both | agrees |
| 0.2 route, DLMF 15.4.15 | `a = 0.3`, `t = 1` | left `0.8215046516`, `2 sinh 0.4 = 0.8215046516` | repaired |
| 0.3 `c`-function | `c(−iρ)` at `(1, 1/2)`; `(1.3, 0.2)`, `λ = 0.7 − 0.4i`; `(0, −1/2)`, `λ = 1` | `1`; `0.6769696453 − 6.1381888302i`; `3.1298810356 = π tanh π` | agrees |
| 0.3 connection formula | `(0.3, −0.8, 1.1 + 0.3i, 0.6)` | both `0.9069462413 − 0.0433537337i` | agrees |
| 0.3 `c(λ) ≠ 0`, growth | real `α, β`, real `λ ≠ 0`; `λ → 0` | denominator arguments have imaginary part `λ/2 ≠ 0`; double pole needs `α ≤ −1` | agrees |
| 0.4 Laplace representation | `(1.3, 0.2)`, `λ = 0.7 − 0.4i`, `t = 0.9` | both `0.5800453793 + 0.0291068436i` | agrees |
| 0.4 product formula | same, `(t₁, t₂) = (0.5, 0.8)` | both `0.5427290055 + 0.0297530962i` | agrees |
| 0.4 negative controls | `(−1/4, −3/2)`, `λ = 0.3`, `t = 3`; strip at `t = 10, 20` | `5.4728488029`; `16.3467448467`, `328.3331470239` | agrees |
| 0.4 boundedness iff | zeros of `c` for `Im λ < −ρ`; `ρ = 0` | zeros lie in `Im λ > 0`; `cos λt` bounded iff `Im λ = 0` | agrees |
| 0.5 `𝔓^τ_{mn}` | `(2, −1)` at `t = ±1.3`; `(5/2, 1/2)`; `(3, 3)`; `(1/2, −1/2)` at `t = −0.9` | `∓(0.0115064149 + 0.0159750333i)` both sides; others agree to `10⁻¹⁴` | agrees, also for `t < 0` |
| 0.5 zonal | `λ = 0.8` | `0.8654573797`, `0.8331690033` both sides | agrees |
| 1.1 weight, Fourier value | `(−1/2, −1/2)`, `λ = 1.5` | `0.5049568809` both | agrees |
| 1.2 inversion | `(1, 1/2)`, `e^{−t²}`, `t = 0.5` | right side `0.7788009` (my quadrature, 7 digits), `e^{−1/4} = 0.7788008` | agrees |
| 1.2 poles of `c(−λ)⁻¹` | `|β| ≤ α + 1`; `β > α + 1`; `β < −α − 1` | none in `Im λ > 0`; `i(β − α − 1 − 2j)`; `i(−ρ − 2j)` | agrees with `λ_j` |
| 1.3 discrete terms | `(0, 3/2)`; `(0, −3/2)`; `(0.3, 3.6)` (two terms); `f = e^{−t²}`, `t = 0.5` | `0.0708752 + 0.7079256`; `0.4837133 + 0.2950876`; `0.7501590 + 4.0230229 − 3.9943821`; each `0.77880` | agrees |
| 1.3 norms and index set | `‖φ_{i/2}‖²` at `(0, ±3/2)`; `(|β| − α − 1)/2 = 1` | `32`, `1/2`; `range ⌈1⌉ = {0}`, and `j = 1` gives `λ = 0`, excluded | agrees |
| 1.3 Paley–Wiener statement | `R < 0`; `R = 0`; `(−1/2, −1/2)` | left `{0}`, right bounded entire tending to `0`; same; cosine Paley–Wiener | statement sound; route R02 |
| 2.1 group, transitivity | `n = 0, 1` | trivial group and one point; `SO₀(1,1)` boosts | agrees |
| 2.2 volume | disc, ball, control | `3.4122762653`, `5.1109327057`, `4.3388468454` | agrees |
| 2.2 horospherical chart | `x₀² − e^{−2s}|v|² − x_{m+1}²` | `(e^s + |v|² e^{−s}) e^{−s} − e^{−2s}|v|² = 1` | agrees |
| 2.3 general formula | `b = o`, `F(u) = u` | `n x₀`; equals `G″ + (n − 1) coth t G′` for `G = F ∘ cosh` | agrees |
| 2.4 Jacobian | `n = 2`, `a_{0.8}`, `cos² θ + 0.3 sin θ` | `0.5000000000`; without the factor `0.5721806070` | agrees |
| 2.5 involution | `g ∈ G`; `a_t` | `J (gᵀ)⁻¹ J = g`; `θ(a_t) = a_t`, README says `a_{−t}` | R01 |
| 3.1 Harish-Chandra's integral | `n = 3`, `λ = 0.7 + 0.2i`, `t = 0.9` | `0.8240849752 − 0.0319468381i`; quadrature `0.82408500 − 0.03194683i` | agrees |
| 3.2 classification, parametrization | `n = 1` | `cos λ(s + t) ≠ cos λs cos λt`; `cos λt = cos μt` iff `μ = ±λ` | `n ≥ 2`, `n ≥ 1` as stated |
| 3.4 complementary series | `λ = iη`: kernel exponent; invariance | `−2(ρ + η) > −2ρ` iff `η < 0`; `π_{−λ}(g)* = π_λ(g⁻¹)` when `λ̄ = −λ` | repaired |
| 3.4 multiplier, coefficient | `a_t`, `b = e₁`; `(g⁻¹ b̃)₀` | `e^{(iλ+ρ)t}`; `[g o, b̃]` | agrees |
| 4.1 constants | `C₂, C₃, C₄`; `C_n ω_{n−1} 2^{1−n}` | `0.0506605918`, same, `0.0645030689`; `1/(2π)` | agrees with 1.2 |
| 4.2 Abel transform | `m = 2`, `m = 1`, `e^{−cosh t}(1 + t²)`, `s = 0.7` | `5.3482274281` definition and closed form; `1.62427409` both | agrees |
| 4.2 route | `[x(s, v), (1, 0, …, −1)]`; exponent | `e^{−s}`; `e^{−iλs} e^{−ms/2}` | agrees |
| 4.3 equivariance, Laplacian | multiplier of `π_{−λ}`; `μ = ρ − iλ` | `(g⁻¹ b̃)₀^{iλ−ρ}`; `μ(μ − n + 1) = −(λ² + ρ²)` | agrees |
| 4.4 | `C₂ |c(1.3)|⁻²`; heat kernel of `ℍ³` | `0.2067841277` both; transform `e^{−s(λ²+1)}` by the Gaussian sine integral | agrees |

- Source locators checked against the text: 6 (DLMF 15.9.11, 15.9.12, 15.9.13, 15.9.14, 15.4.11, 15.4.15); all say what is cited.
- Library declarations: the 10 names pinned by `#check` elaborate; the pinned Mathlib and Tau Ceti have no hyperboloid model, Lorentz group, Jacobi function, Gel'fand pair, Paley–Wiener or Carlson theorem (object search over both trees).
- Cross-roadmap citations resolved: SpecialFunctionsHypergeometric Layers 1, 3, §§1.3, 4.1, 5.1, 7.1; LaguerreJacobi §3.2; ZerosOfLFunctions §1.3; AutomorphicSpectralTheory §1.6 (README line 889); RiemannianGeometry R4.7; NoncompactQuantumSymmetry M4, M4.Lorentz; RealSemisimpleLieGroups §§5.2, 5.3, 5.7 on main; SpecialFunctionsGamma §10.1, SpecialFunctionsGroupModels Layer 1, §§1.3, 2.1, 5.1–5.4, SpecialFunctionsSU11MatrixElements §§1.1–1.3, 2.1, 5.2 at their open heads. All exist and state what is cited.
- Local copies compared with the suppliers' files at their heads: `boostMatrixElement`, `IsBiInvariant`, `conv`, `IsGelfandPair`, `IsSphericalFunction` are verbatim.
- Dependency check: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: no error, `sorry` the only warning; 58 theorems, no sorry'd data, no `set_option`. Elaborated signatures compared with the README: the two dropped binders are the unused topology and measurable-space instances of the copied `IsBiInvariant` and `conv`, as in the supplier; nothing changed.
- One-tactic probe on a copy: 11 statements tried; the three marked as sanity checks close, the other eight (`jacobiFunction_zero`, `jacobiFunction_neg_spectral`, `jacobiFunction_quadratic`, `cFunction_neg_I_mul_rho`, the zonal case, `exists_orbitMap_eq`, the parametrization, `abelTransform_neg`) do not.
- Pull request text against the head: the counts (58 statements, 55 headlines, 3 sanity checks; 37 proved, 18 stated, 3 absent in the prior formalization) and both supplier lists agree with the head.

Overlap check: read SpecialFunctionsSU11MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsGroupModels, SpecialFunctionsMotionGroupsBessel, SpecialFunctionsSU2MatrixElements, SpecialFunctionsLegendre (open) and searched SpecialFunctionsAppell, SpecialFunctionsBessel, SpecialFunctionsTheta, RealSemisimpleLieGroups, LieGroupsPartII, AutomorphicSpectralTheory (main). Gel'fand pairs, spherical functions, multiplier representations: GroupModels. `𝔓^τ_{mn}` and Mehler–Fock: SU11MatrixElements. Riemannian hyperboloid model: RiemannianGeometry R4.7. Jacobi function, `c`-function, Jacobi, Abel and Helgason–Fourier transforms, `SO₀(n, 1)` on the hyperboloid: this roadmap (SpecialFunctionsLegendre §11.3 gives the Jacobi function no definition). SpecialFunctionsHigherSpheres says at its head that this roadmap owns `U(n, 1)`, which this roadmap places beyond its scope; that sentence is the other pull request's to correct.

Source independence: 6 passages compared with 1 source (DLMF), none shared beyond formulas; largest share Wawrzyńczyk, 27 of 79 source mentions in the layers; its text and contents page could not be read; by the README's own locators no layer maps onto a run of its sections (Layer 2 draws on §§11.2, 11.4, 11.5, 18.1; Layer 3 on §§11.1, 11.3, 11.7, 18.1, 18.3, 18.5; Layer 4 on §§11.3, 11.4, 18.6–18.8): independent as far as tested.

Research link: The Jacobi transform with inversion, Plancherel and Paley–Wiener is Koornwinder's theory (1984), cited by DLMF §15.9(ii); Layer 4 is the rank-one case of the Helgason–Fourier analysis on symmetric spaces (Heckman–Schlichtkrull 1994), a prerequisite of the Selberg trace formula for hyperbolic manifolds. Rests on the README's references and DLMF §15.9.

## Not verifiable

- Every locator into Vilenkin–Klimyk Vol. 2, Klimyk–Vilenkin (EMS 59), Wawrzyńczyk and Koornwinder (1984): each resolves only to a paywalled publisher page.
- Every locator into Heckman–Schlichtkrull: no legal copy found.
- Flensted-Jensen (1972) and Koornwinder (1975), named in 1.3 for the Paley–Wiener theorem: paywalled publisher pages.
- So, of the sampled targets, the book locators of 0.4, 0.5, 1.2, 1.3, 2.1–2.4, 3.4 and 4.1–4.3 were not checked against a text; the mathematics of each was recomputed (table above), and the DLMF and supplier-roadmap locators of 0.1–0.3, 0.5 and 1.1 were verified.

Automatic checks set aside as false positives: the report of a section header in `Suggested.lean` with no declaration under it (the header carries the `#check` lines that pin the Mathlib names the README cites, which the form rules allow); the report that `SU11.boostMatrixElement_eq_jacobiFunction` is found nowhere (it is declared in `Suggested.lean` inside the namespace `SU11`).

## Source issues

- none

## For the human reviewers

- **Not tested.** Wawrzyńczyk, *Group Representations and Special Functions* (1984), has the largest share of the locators (27 of 79 mentions); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
- **Licence.** The README's section on prior formalization says the roadmap reuses the names and conventions of the author's own lean-SFVK (Apache-2.0, commit `2a512fe`); `Suggested.lean` appears adapted from it. I did not open that repository.
- **Licence.** The theorems of Layer 1 go back to Koornwinder (1984), which the References say is read through two secondary books; none of the three could be read.
