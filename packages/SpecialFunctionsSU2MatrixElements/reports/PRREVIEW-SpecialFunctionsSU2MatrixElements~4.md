# Review of SpecialFunctionsSU2MatrixElements (pull request #2692 at f3b29fe)

**Verdict:** accepted

**Summary.** Accepted: no finding. Both findings of the previous review are repaired (the surface measure `toSphere` is now compared with `sin θ dθ dφ` by a target of §6.3, and the classification of the zonal spherical functions is stated in `Suggested.lean`), and every identity, convention and numerical Check was recomputed from the Lean definitions without a failure. There are three small corrections and one format note, none blocking. Six of the seven cited works could not be read legally, so their locators and the wording and arrangement against them are left to the human reviewers.

## C01 — The Plancherel route of §3.4 says the Peter–Weyl basis vectors are `√(d+1)` times the matrix elements; at the pin they are `√(d+1)` times the conjugates of the transposed matrix elements

An implementer who follows the route literally obtains `Σ (d+1) |∫ f · D_{ba}|²`, not the stated `Σ (d+1) |∫ f conj D_{m'm}|²`, and has to find the missing step.

In §3.4 (line 529) the route reads "the Peter–Weyl basis vectors are `√(d+1)` times the matrix elements". `TauCeti.peterWeylFamily` (`TauCeti/RepresentationTheory/Compact/PeterWeyl.lean`, line 396) is `√dim` times `matrixCoeffLp … (basis a) (basis b)`, that is `g ↦ ⟪π g e_a, e_b⟫`, and Conventions (lines 70–72) say that `matrixElement d i k` is the conjugate of that coefficient at `v = e_k`, `w = e_i`. So the basis vector at `(a, b)` is `√(d+1) · conj D_{ba}`. The two sums agree after the reindexing `conj D_{ik} = (-1)^{i+k} D_{d-i,d-k}` (recomputed for `d ≤ 5` on random elements: difference `0`; for `f = D^1_{10}` the pairing with `D_{21}` is `0` and with `conj D_{21}` is `1/3`). The smallest change: "the Peter–Weyl basis vectors are `√(d+1)` times the conjugates `conj D_{ba}`, and `conj D_{m'm} = (-1)^{m'-m} D_{-m',-m}` (§2.5) permutes the index set".

## C02 — In `eq_matrixElement_zonal_iff_integral_mul_torusExp_mul` the bi-`T`-invariance hypothesis follows from the other two

The functional equation at `g = 1` with `φ(1) = 1` gives `φ(h) = (2π)⁻¹ ∫ φ(torusExp t · h) dt`, which is left `T`-invariant in `h`; at `h = 1` it gives right invariance. So the equivalence of §6.4 (lines 869–871) and of the Lean statement holds for every continuous `φ` with `φ(1) = 1`, and the hypothesis `hT` only weakens it. Either drop `hT` from the second statement, or keep it and say in the README that it is implied. The first equivalence (`eq_matrixElement_zonal_iff`) needs it as stated.

## C03 — The list of what SpecialFunctionsGroupModels consumes omits §§2.2 and 2.7

"Downstream consumers" (lines 912–916) and the merge-order paragraph of the description name §§1.1, 1.3, 1.4, 2.1, 2.3, 4.2 and 6.4. At its open head SpecialFunctionsGroupModels cites this roadmap's "§§1.1, 1.3, 1.4, 2.1–2.3, 2.7, 4.2 and 6.4" in its supplier contracts (the group law and unitarity of §2.2 for its instance bullets, and the Vilenkin–Klimyk dictionary of §2.7 in its Conventions). Add §§2.2 and 2.7 in both places, so that a later change to either section is seen to have a consumer.

## N01 — The headline "Jacobi orthogonality for integral parameters" of §3.3 states no value

It says the integral "must agree with" Edmonds (4.1.22). From `integral_wignerSmallD_mul_wignerSmallD` and the Jacobi form the value is `2^{a+b+1}/(2r+a+b+1) · (r+a)!(r+b)!/(r!(r+a+b)!) δ_{rr'}`; stating it would make the bullet a target.

## Earlier findings

- R01 of the previous review (the decomposition of `L²(S²)` used `toSphere`, the suppliers another measure): repaired. §6.3 now has the target "**The surface measure in polar coordinates** (`lintegral_toSphere_eq_setLIntegral_spherePoint`, `integral_toSphere_eq_setIntegral_spherePoint`)", stated in `Suggested.lean`, and the decomposition's route is "the Hilbert basis of SpecialFunctionsLegendre §3.3 … carried to `L²(S²)` by the unitary map of the first headline". That Hilbert basis of `L²((0, π) × (0, 2π), sin θ dθ dφ)` is in SpecialFunctionsLegendre §3.3 at its open head. RiemannianGeometry R8.2 is no longer a direct supplier.
- R02 (the zonal classification absent from `Suggested.lean`): repaired. `eq_matrixElement_zonal_iff` and `eq_matrixElement_zonal_iff_integral_mul_torusExp_mul` are stated and the docstring no longer lists the headline as unstated.
- C01 (`matrixElement_one` closes by `simp`): repaired; it is proved in place and listed as the sixth supporting step.
- C02 (the edge from §1.4 to §2.1): repaired; "the unitarity of §1.4, and with it `irrepModel`, uses the entry formula of §2.1".
- C03 (the description's pointer to the module list): repaired; "the README's section Prior formalization lists the modules".
- N01, N02: repaired ("No Tau Ceti roadmap owns these topics"; "the layers above"; "`pauliRotation` is a local copy of its matrix, with the same formula").
- The question on the factor `i^{m-n}` in Vilenkin–Klimyk's `P^l_{mn}`: answered in §2.7 with the locator [VK, §6.3.3, p. 285, (4) and footnote 1], which could not be read.

## Verified sound

Every row was computed from the Lean definitions as written (natural-number subtraction, out-of-range branches and all), in double precision, for `d ≤ 6` unless stated; "err" is the largest absolute difference of the two sides.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §1.1 `coe_euler`, `exists_euler_eq`, `bijOn_euler` (sample) | five triples incl. `β = 0, π, −0.8`; 200 random `g` | err `2e−16`; all 200 inverted in the ranges; one preimage in the box; `euler (2π) 0 0 = −1` | holds |
| §1.2 `pauliRotation_euler` | five triples | err `2e−16`; torus `0.4 ↦ R_z(−0.8)`; `R_y(1.1)` vs `R_y(−1.1)`: `1.782`; `e₃ ↦ (−0.6816, 0.5741, 0.4536)` | holds |
| §1.3 Haar density (sample) | mass; `|D^1_00|²`; `|D^{1/2}_{01}|²`; a non-class `f` and its translates | `1.0007`; `0.3340`; `0.5004` (coarse grid); `0.33369`, left `0.33369`, right `0.33369` | holds |
| §1.4 `isUnitary_unitaryModel` | random `g`; `d = 2` at `eulerMiddleX 0.7` | `‖D*D − 1‖ ≤ 2e−15`; unscaled `0.6768`; inverse scaling `1.6552` | holds |
| §2.1 `matrixElement_eq_entrySum`, `matrixElement_spinHalf` | random `g`; `A = [[2,3],[5,7]]` | err `4e−16`, `0`; `29` vs `det = −1` | holds |
| §2.2 group law, inverse, centre | random `g, h` | errs `6e−16`, `3e−16`, `7e−16` | holds |
| §2.3 `matrixElement_euler` (sample) | five triples | err `5e−16`; Edmonds's `d¹` matrix err `0`; unreversed order `1.108` at `0.9` | holds |
| §2.4 Jacobi and hypergeometric forms (sample) | all `i, k ≤ d ≤ 6`, four `β` incl. negative | errs `3e−16`, `2e−15`; `r + a + b = d − r` | holds |
| §2.5 swap, reflect, neg, `π + β`, `0`, `π` (sample) | all `i, k ≤ d`; `neg` and `π + β` also with an index `> d` | errs `≤ 9e−16`; out of range both sides `0` | holds |
| §2.6 Legendre, Ferrers, Gegenbauer | `l ≤ 5`, five `β` | errs `7e−16`, `7e−16`, `7e−16` | holds |
| §2.7 `eulerX_eq_euler`, `matrixElement_eulerX` (sample) | five triples | errs `2e−16`, `1e−15`; without `i^{m−m'}`: `1.726` at `(2.0, 3.9, 0.4)`, `d ≤ 5` | holds |
| §3.1 `cos_of_euler_mul`, `wignerSmallD_addition`, `legendre_addition` (sample) | three products, `d ≤ 4`; other representatives `(α, β, γ)` incl. `β < 0`; `l ≤ 5` | errs `2e−16`, `1e−15`, `2e−15`, `1e−15` | holds |
| §3.2 product formula, functional equation | `l ≤ 5`, random `g, h` | errs `2e−16`, `7e−16` | holds |
| §3.3 `integral_wignerSmallD_mul_wignerSmallD` | nine index sets | `0.666667`, `0.5`, `1.0`, `0.285714` on the diagonal; `0` off it; Jacobi norm of N01 follows | holds |
| §3.4 `hasSum_plancherel` (sample) | `f = D^1_00 + 2 D^{1/2}_{01}` | `2.335` (coarse grid) vs `1/3 + 2 = 2.3333`; basis pairing `0` vs `1/3` | holds; route sentence C01 |
| §4.1 derivatives, commutators, Casimir, raising (sample) | `d ≤ 6` | derivative errs `3e−10`; commutators `2e−15`; Casimir `2e−15`; raising `0` | holds |
| §4.2 ODE, recurrence, generating function (sample) | `d ≤ 6`, `β ∈ {0.9, 2.2}`, `k = 0, d` included | errs `7e−10`, `2e−10`, `2e−16` | holds |
| §4.3 Casimirs and `eulerLaplacian` | `d ≤ 3`; a non-eigenfunction | eigen err `2e−6`; right `0.965953−0.034190i`, left the same, Laplacian `0.965953−0.034190i`; sign control `−1.660` | holds |
| §5.1 characters | random `g`; Euler angles | errs `3e−15`, `9e−16` | holds |
| §5.2 Krawtchouk (sample) | `N ≤ 6`, `p ∈ {0.3, 0.85}`; library, `q ∈ {2, 3, 5}`, `N ≤ 5` | errs `7e−16`, `4e−14`, `1e−13`; `K_1(2; 0.3, 3) = −1.2222`; library `−1`, `3`; wrong `p`: `0` | holds |
| §6.1 column, row, orbit, rotation law (sample) | `l ≤ 4`; off-sphere `x = (0.3, −0.5, 0.9)` | errs `≤ 1e−15`; off sphere `l = 2`: `0.028`; `Y(1,2)` at `θ = −π/2`: `0.33006 + 0.10210i` | holds |
| §6.2 Laplacians (sample) | `sin θ e^{iφ}`, `cos θ` by hand; DLMF 14.30.12 | `−2 sin θ e^{iφ}`; without `cot θ ∂_θ`: `−cos θ`; `sphereLaplacian = −L²/ħ²` | holds |
| §6.3 surface measure in polar coordinates; `H_l`; decomposition (sample) | `F = 1`, `F = x₃²`; `⟨Y_2^{−1}, Y_2^{−1}⟩`, two cross terms | `12.5665`, `4.1889` vs `4π`, `4π/3`; no weight `19.739`; `1.0000`, `3e−16`, `3e−18` | holds |
| §6.4 Gel'fand criterion; zonal classification, both forms (sample) | five triples; `φ = (D^1_00 + D^2_00)/2` | `k₁ g k₂ − g⁻¹ = 4e−16`; mixture: average `0.1288`, product `0.0653`, so excluded; both directions by hand | holds; `hT` redundant in the second (C02) |
| `jacobi` and `pauliRotation` copies | LaguerreJacobi `Suggested.lean` line 175; upstream Adjoint module | bodies identical; upstream matrix is that of `x ↦ pauliCoord(U · pauli x · U*)` | holds |

- Source locators checked against the text: 12, all DLMF (14.6.1, 14.9.3, 14.30.1, 14.30.8, 14.30.9, 14.30.12, 18.5.7, 18.5.8, 18.7.1, 18.7.9, 18.20.6, Table 18.19.1 Krawtchouk row); all agree with the README.
- Library declarations opened at the pin: `symPowerModel` (SU2/Exhaustion.lean:97), `weightBasis` (SU2/Weight.lean:84), `coe_torusExp` (SU2/Basic.lean:393), `ContinuousLinearEquiv.congr` (Continuous/Transport.lean:63), `matrixCoeff` (Continuous/MatrixCoefficient.lean:70), `IsIrrepSkeleton` and `peterWeylFamily` (Compact/PeterWeyl.lean:214, 396), `convolutionCLM_toLp_apply` (Compact/Convolution.lean:237), `TauCeti.krawtchouk` (InformationTheory/Coding/Krawtchouk.lean:39), Mathlib `toSphere` and `toSphere_apply'` (MeasureTheory/Constructions/HaarToSphere.lean:52, 66); all 29 `#check` lines elaborate.
- Cross-roadmap citations resolved: LaguerreJacobi §§3.2, 3.3, 3.4, 4.3, 6.1, 6.2, RiemannianGeometry R8.2 and CompactGroups §§E.1–E.4 (main); SpecialFunctionsLegendre §§2.5, 3.1, 3.2, 3.3 (open head); SpecialFunctionsGroupModels (open head) cites this roadmap and restates none of it.
- Dependency check output: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no upward or cyclic line. The pull request changes nothing outside the roadmap folder.
- Elaboration of `Suggested.lean` at the pins: no error, 71 `sorry` warnings and nothing else; 33 definitions, 77 theorems (6 proved), no `set_option`, no sorried data, no `variable` line, so no declaration can lose a binder; the signatures were read against the README and none differs.
- One-tactic probe: all 71 sorried theorems tried on copies, with `first | rfl | simp | infer_instance` and with `simp` unfolding the file's definitions; none closes.
- Duplication by object: the pinned libraries have no Euler-angle parametrization, Wigner function, Gel'fand pair, spherical harmonic or polar-coordinate formula for `toSphere`; no other roadmap, open or on main, states the last. Ownership against the open pull requests was checked by searching their heads for Wigner functions, Euler angles, Krawtchouk polynomials, Gel'fand pairs, zonal functions, Clebsch–Gordan and `toSphere`.
- Automatic checks: one form check failed (below); the targeted build and the text scanners passed.

Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsLegendre, CompactGroups, LaguerreJacobi, SpecialFunctionsHypergeometric; the spherical harmonics with their orthonormality, addition theorem and completeness are owned by SpecialFunctionsLegendre and cited here; the `SU(2)` conventions, matrix elements and the pair `(SU(2), T)` are owned here and cited by SpecialFunctionsGroupModels, which owns the general matrix element and the general Gel'fand-pair theory; the `SU(2)` engine is owned by CompactGroups and the Jacobi polynomial by LaguerreJacobi, both cited; Krawtchouk polynomials of real `p` have no other owner (LaguerreJacobi excludes them, SpecialFunctionsHypergeometric only names them).

Source independence: 12 passages compared with 1 source (DLMF), none shared beyond formulas; largest share E, about 75 of 188 locators; neither the text nor the contents page of E (nor of VK, 54 locators) could be read; by the section numbers the README itself cites, the layers are not one to one with either book (Layer 3 draws on VK §§6.6 and 6.10 and E §4.6; Layer 4 returns to VK §6.2 and uses §§6.7, 6.10; Layer 5 takes VK §6.9 before §6.8; Layers 1–2 run in the order VK §§6.1–6.3, which the dependencies force: coordinates, then the model, then its matrix elements).

Research link: none found. The README cites monographs, a survey and the DLMF (Edmonds 1957; Vilenkin–Klimyk 1991; Klimyk–Vilenkin 1995) and names as consumers SpecialFunctionsGroupModels and a roadmap on Clebsch–Gordan coefficients; it names no research result. Rests on the README.

## Not verifiable

- Every locator into [E] (sample targets 1.1, 1.3, 2.3, 2.4, 2.5, 3.1, 4.1, 4.2, 6.1, 6.2, 6.3): the sources service found only the publisher's page, which is not an open copy.
- Every locator into [VK], [KV] and [W] (sample targets 1.1, 1.3, 2.3, 2.4, 2.5, 2.7, 3.1, 3.4, 4.1, 4.2, 5.2, 6.1, 6.2, 6.3, 6.4): paywalled publisher; uncertified.
- Every locator into [D] and [M] (sample targets 1.1, 2.4, 2.5, 3.1, 4.1, 6.1, 6.4): the sources service found no legal copy.
- The misprints of [VK] and [KV] listed under References, and the footnote of [VK, p. 285] cited in §2.7: the texts could not be read, so none is recorded below.
- The double cover is not in the pinned Tau Ceti. The Adjoint and Differential modules were read on the library's main branch, which has `TauCeti.pauliRotation`, `TauCeti.SU2.toSO3`, `toSO3_surjective`, `toSO3_eq_one_iff` and `quotientKerToSO3`; the pin cannot check them.

Automatic checks set aside as false positives: the rule that a section comment in the Lean file must head a declaration fired on the closing block of `#check` lines, which pin the consumed library declarations and are allowed.

## Source issues

- none

## For the human reviewers

- Not tested: Edmonds [E] has the largest share of locators (about 75 of 188) and Vilenkin–Klimyk [VK] the next (54); neither text nor table of contents could be read, so wording and arrangement were not compared with them.
- Licence: the README's section "Prior formalization" says the roadmap reuses names and conventions of the public repository bjbraams/lean-SFVK (Apache-2.0, owned by the pull request's author; modules under `SFVK/SU2/`); its statements were not compared with `Suggested.lean`.
- Scope: all seven references are monographs, a survey or the DLMF (1957–1995); the README names no research article and no research result its headlines serve (`Research link: none found`).
- Sources: six of the seven cited works ([E], [VK], [KV], [W], [D], [M]) could not be read legally; only the DLMF locators were verified.
- Pin: the double cover `SU(2) → SO(3)` cited as a Tau Ceti supplier is on the library's main branch but not at the pinned commit; `Suggested.lean` carries a local copy of its matrix.
