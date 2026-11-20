# Review of SpecialFunctionsSU2MatrixElements (pull request #2692 at fb3737a)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons. The decomposition of `L²(S²)` in §6.3 is stated for the measure `Measure.toSphere`, while both suppliers it cites for orthogonality and density work with the Riemannian volume of the round metric, and nothing compares the two measures; and the classification of the zonal spherical functions, which the Summary names as a headline, is statable at the pins but absent from `Suggested.lean`. Every stated identity and every numerical Check was recomputed from the Lean definitions and none failed; both findings of the previous review are repaired. There are three small corrections and two format notes, none blocking; six of the seven sources could not be read legally, which is left to the human reviewers.

## R01 (P2) — The decomposition of `L²(S²)` in §6.3 uses the measure `toSphere`, but the two suppliers it cites prove orthogonality and density for the Riemannian volume of the round metric, and no target or library declaration compares the two measures

An implementer of the last headline of §6.3 has orthonormality in `L²((0, π) × (0, 2π), sin θ dθ dφ)` and density in `L²` of the Riemannian volume, and cannot reach `L²` of `toSphere` from either.

Conventions (line 106) say: "The surface measure on `S²`, for `L²(S²)` in §6.3, is `MeasureTheory.Measure.toSphere` of Lebesgue measure, of total mass `4π`." The route of the decomposition (lines 807–809) takes "orthogonality from SpecialFunctionsLegendre §3.2 and density from RiemannianGeometry R8.2 at `m = 2`, both through the comparison of §6.1", and the supplier contract (line 995) adds the change of variables of SpecialFunctionsLegendre §3.3. At the head of its open pull request (#2121), SpecialFunctionsLegendre §3.3 (Completeness bullet) states that change of variables as carrying `sin θ dθ dφ` to "the Riemannian volume of the round metric", with `TauCeti.sphereRoundMetric` and `TauCeti.riemannianVolume` in its Needs line; RiemannianGeometry R8.2 on main (README line 4871) is stated "on the unit round sphere … with Tau Ceti's round metric". Neither mentions `toSphere`. In the pinned Tau Ceti no file mentions both `toSphere` and `riemannianVolume` or the round metric (every file that uses `toSphere` was searched), and no roadmap, on main or open, states the comparison. The comparison of §6.1 is pointwise and says nothing about measures.

The smallest change is one of two. Either define `L²(S²)` in Conventions with the suppliers' measure (the Riemannian volume of `TauCeti.sphereRoundMetric` on the unit sphere of `ℝ³`) and drop `toSphere` from the Mathlib contract; or keep `toSphere` and add one target to §6.3: for integrable `F` on the unit sphere, `∫ F d(toSphere) = ∫_0^{2π} ∫_0^π F(spherePoint θ φ) sin θ dθ dφ`, the complement of the image being null. With the second, orthonormality and completeness of SpecialFunctionsLegendre §§3.2–3.3 transfer directly and R8.2 is no longer needed. The rotation invariance of `toSphere` is at the pin (`TauCeti/Geometry/Euclidean/Volume/OrthogonalGroup.lean`, line 131) if the group-theoretic route of the closing paragraph of §6.3 is preferred.

## R02 (P2) — The classification of the zonal spherical functions is a headline of the Summary, is statable at the pins, and is not in `Suggested.lean`

The Summary ends with "(SU(2), T) is a Gel'fand pair whose zonal spherical functions are the `P_l(cos β)`", and §6.4 states the classification exactly. `Suggested.lean` states the first half (`exists_torus_mul_mul_eq_inv`, `convolution_comm`) and its module docstring lists "the zonal spherical functions (§6.4)" among the headlines not stated, without naming a missing carrier. None is missing: `convolution`, `torus` and `matrixElement` are in the file. On a copy of the file the following elaborates with no error:

```lean
theorem eq_matrixElement_zonal_iff (φ : SU2 → ℂ) (hφ : Continuous φ)
    (hT : ∀ k₁ ∈ torus, ∀ k₂ ∈ torus, ∀ g, φ (k₁ * g * k₂) = φ g) (h1 : φ 1 = 1) :
    (∀ f : SU2 → ℂ, Continuous f → (∀ k₁ ∈ torus, ∀ k₂ ∈ torus, ∀ g, f (k₁ * g * k₂) = f g) →
        ∃ c : ℂ, convolution f φ = c • φ) ↔
      ∃ l : ℕ, φ = matrixElement (2 * l) ⟨l, by omega⟩ ⟨l, by omega⟩ := by
  sorry
```

I checked the statement by hand: for `φ = D^l_{00}`, `convolution f φ = Σ_μ (∫ f conj D^l_{μ0}) D^l_{μ0}` and left `T`-invariance of `f` kills `μ ≠ 0`; conversely `f = D^{l'}_{00}` gives `c_{l'} D^{l'}_{00}/(2l' + 1) = c φ`, which leaves one `l`. State it (the name is a suggestion), or say in the docstring which carrier it lacks.

## C01 — `matrixElement_one` closes in one `simp` call, so as a sorried target it asks an implementer for nothing

On a copy of the file, `simp [matrixElement, EuclideanSpace.inner_single_left, Pi.single_apply, eq_comm]` proves it: `unitaryModel d 1` is the identity by `map_one`. Eight other sorried theorems tried the same way did not close. Either prove it in the list of supporting steps of the module docstring, beside `matrixElement_eq_conj_matrixCoeff`, or keep it as a Check of §2.2.

## C02 — The unitarity of §1.4 is proved from the entry formula of §2.1, an edge that "How to read the build" does not list

The route of the first headline of §1.4 (line 226) says that `isUnitary_unitaryModel` "follows from `matrixElement_eq_entrySum` (§2.1)", and `irrepModel` needs it, so the last three targets of Layer 1 wait for a theorem of Layer 2. There is no cycle (`matrixElement` and the entry formula need only the definition of `unitaryModel`), but the paragraph on dependencies (lines 41–47) calls Layers 1 and 2 "the foundation" and lists edges only from Layer 3 on. Add this edge there.

## C03 — The description places the list of lean-SFVK modules in "the README's last section"

It is in "Prior formalization", the section before "References". The right text is "the README's section Prior formalization lists the modules". The counts in the description (33 definitions, 73 theorems, 68 with `sorry`) agree with the head.

## N01 — Two phrases about scope and place

"Beyond this roadmap (a roadmap for a roadmap; do not implement)" lists seven topics that live in no layer and no named roadmap; naming an owner for each, or saying they are outside every Tau Ceti roadmap, would make the scope definite. In Scope and ownership (line 891) "the layers below" should read "above".

## N02 — "Tau Ceti provides it after the pin of this repository" will be out of date at the next pin

The sentence appears in Conventions, in the Tau Ceti contract and in two docstrings. A timeless form: "`pauliRotation` is a local copy of `TauCeti.pauliRotation`, with the same formula".

## Questions for the author

- In [VK, §6.3.3, (4)–(5)], is `P^l_{mn}` defined without the factor `i^{m−n}`, so that `P^l_{mn}(cos θ) = d^l_{mn}(θ)` is real, as §2.7 says? In Vilenkin's 1968 book the factor is inside `P^l_{mn}`. I could not read [VK] or [KV]; the conversion theorem itself is verified (it is a statement about `eulerX` and `wignerSmallD` only).

## Earlier findings

- R01 of the first review (two owners for the spherical harmonics and their theorems): repaired. Scope and ownership now lists them as not owned, "(SpecialFunctionsLegendre, §§2.5 and 3.1–3.3)", §6.1 states the comparison with that roadmap's `Y_{l,m}`, and the five duplicated declarations are gone from `Suggested.lean`.
- R02 (left multiplication on the first row is not unitary): repaired. §1.3 now uses "the first column `(g₀₀, g₁₀) ∈ S³ ⊂ ℂ²` by the unitary map `h`".
- C01–C06, N01–N03: repaired (dependency edges listed; `TauCeti.krawtchouk` and `TauCeti.convolutionCLM` cited with comparison Checks; the zonal bullet has exact quantifiers; the three one-tactic theorems are marked as supporting steps; the description's counts are right; Checks state values; the five upstream declarations are named; docstrings added).

## Verified sound

Every row was computed from the Lean definitions as written (natural-number subtraction and out-of-range branches included), in double precision, for `d ≤ 6` unless stated; "err" is the largest absolute difference of the two sides.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §1.1 `exists_euler_eq`, `bijOn_euler` (sample) | `β = 0`, `β = π`, generic | `(α ± γ)/2` fixed mod `2π` forces `γ` mod `4π`; `euler (2π) 0 0 = −1` | holds |
| §1.2 `pauliRotation_euler` (sample) | four triples incl. `β = 3.9, −0.8, 0` | err `2e−16`; torus `0.4 ↦ R_z(−0.8)`; `R_y(1.1)` vs `R_y(−1.1)`: `1.782`; `e₃ ↦ (−0.6816, 0.5741, 0.4536)` | holds |
| §1.3 Haar density (sample) | mass; `|D^1_00|²`; `|D^{3/2}_{01}|²`; translate by random `h` | `1.0000000`; `0.3333333`; `0.2500000`; left and right translates `0.3333333` | holds |
| §1.4 `isUnitary_unitaryModel` (sample) | random `g`; `d = 2` at `eulerMiddleX 0.7` | `‖D*D − 1‖ ≤ 2e−15`; unscaled `0.6768`; inverse scaling `1.6552` | holds |
| §2.1 `matrixElement_eq_entrySum`, `matrixElement_spinHalf` | random `g`; `A = [[2,3],[5,7]]` | err `4e−16` against the action on monomials; `29` vs `det = −1` | holds |
| §2.2 group law, inverse, unitarity, centre (sample) | random `g, h` | errs `6e−16`, `3e−16`, `2e−15`, `6e−16`; `(−1)^d` | holds; `matrixElement_one` C01 |
| §2.3 `matrixElement_euler` (sample) | four triples | err `8e−16`; unreversed order differs by `1.108` at `0.9` | holds |
| §2.4 Jacobi and hypergeometric forms (sample) | all `i, k ≤ d ≤ 6`, four `β` | errs `3e−16`, `2e−15`; `r + a + b = d − r` | holds |
| §2.5 swap, reflect, neg, `π + β`, `0`, `π` (sample) | all `i, k ≤ d` | errs `≤ 1e−15`; `wd 1 1 0 π = 1`, `wd 1 0 1 π = −1` | holds |
| §2.6 Legendre, Ferrers; Gegenbauer by hand | `l ≤ 5`, five `β` incl. negative | errs `9e−16`; `P_l^{(n)} = (2n−1)!! C_{l−n}^{(n+1/2)}`, sign `(−1)^{max(−m',0)}` | holds |
| §2.7 `matrixElement_eulerX` (sample) | four triples | err `1e−15`; without `i^{m−m'}`: `1.7` at `(2.0, 3.9, 0.4)` | holds |
| §3.1 `cos_of_euler_mul`, addition theorems | three triples, `d ≤ 4`, `l ≤ 4` | errs `2e−16`, `6e−16`, `9e−16` | holds |
| §3.2 product formula, functional equation | `l ≤ 4`, random `g, h` | errs `1e−15`, `1e−15`; integrand `−cos 2t` at `g = h = b_{π/2}` | holds |
| §3.3 `integral_wignerSmallD_mul_wignerSmallD` | seven index sets | `0.666667`, `0.5`, `0.4` on the diagonal; `0` off it | holds |
| §3.4 `hasSum_plancherel` (sample) | `f = D^1_00 + 2 D^{1/2}_{01}` | `2.3333333` both sides (`1/3 + 4/2`) | holds |
| §4.1 derivatives, commutators, Casimir, raising (sample) | `d ≤ 6` | derivative errs `4e−10`; commutators `2e−15`; Casimir `2e−15`; raising exact | holds |
| §4.2 ODE, recurrence, generating function | `d ≤ 6`, incl. `k = 0, d` | errs `9e−8`, `3e−10` (finite differences), `2e−16` | holds |
| §4.3 Casimirs and `eulerLaplacian` (sample) | `d ≤ 3`; non-eigenfunction `D¹₀₁D^{1/2}₁₁ + D^{3/2}₀₂` | eigen err `5e−7`; both Casimirs equal the Laplacian to `3e−6`; wrong sign `−1.6603`; `g₀₀ ↦ −0.75 g₀₀` | holds |
| §5.1 characters (sample) | random `g`; Euler angles | errs `3e−16`, `3e−15` | holds |
| §5.2 Krawtchouk (sample) | `N ≤ 6`, `p ∈ {0.3, 0.85, 2}`; library, `q ∈ {2, 3, 5}` | errs `5e−16`, `6e−14`, `2e−12`; `K_1(2; 0.3, 3) = −1.2222`; library `−1` and `3` | holds |
| §6.1 column, row, orbit, rotation law | `l ≤ 4`; off-sphere `x = (0.3, −0.5, 0.9)` | errs `≤ 1e−15`; off sphere `l = 2` defect `0.056`; `Y(1,2)` at `θ = −π/2`: `0.33006 + 0.10210i` | holds |
| §6.2 Laplacians (sample) | `sin θ e^{iφ}`, `cos θ` by hand | `−2 sin θ e^{iφ}`; without `cot θ ∂_θ`: `−cos θ`; DLMF 14.30.12 sign | holds |
| §6.3 `H_l`, decomposition | `l = 1`, `g = torusExp t` | `R(g)⁻¹ = R_z(2t)`, factor `e^{2it} = D^1_{11}`; suppliers' measure is not `toSphere` | route unsupported (R01) |
| §6.4 Gel'fand criterion, zonal functions | `(0.7, 1.1, −2.3)`; convolution of matrix elements by Schur | `k₁ g k₂ − g⁻¹ = 0`; `δ_{jk} D_{il}/(d+1)`; classification verified by hand | holds; absent from Lean (R02) |
| `jacobi` and `pauliRotation` copies | LaguerreJacobi `Suggested.lean` line 175; upstream Tau Ceti Adjoint module | bodies identical; upstream north-pole image `(2 Re u₁ū₀, 2 Im u₁ū₀, 2|u₀|² − 1)` equals the local formula | holds |

- Source locators checked against the text: 12, all DLMF (18.5.7, 18.5.8, 18.7.1, 18.7.9, 14.6.1, 14.9.3, 14.30.1, 14.30.8, 14.30.9, 14.30.12, 18.20.6, Table 18.19.1); all agree with the README.
- Library declarations opened at the pin: `TauCeti.SU2.symPowerModel` (SU2/Exhaustion.lean:97), `weightBasis` (SU2/Weight.lean:84), `coe_torusExp` (SU2/Basic.lean:393), `coe_peterWeylBasis` (Compact/PeterWeyl.lean:524), `convolutionCLM_toLp_apply` (Compact/Convolution.lean:237), `TauCeti.krawtchouk` (InformationTheory/Coding/Krawtchouk.lean:39), invariance of `toSphere` (Geometry/Euclidean/Volume/OrthogonalGroup.lean:131); all 27 `#check` lines elaborate.
- Cross-roadmap citations resolved: LaguerreJacobi §§3.2, 3.3, 3.4, 4.3, 6.1, 6.2 and RiemannianGeometry R8.2 (main); CompactGroups §§E.1–E.4 (main); SpecialFunctionsLegendre §§2.5, 3.1, 3.2, 3.3 (open, #2121); SpecialFunctionsGroupModels (open, #2694) cites this roadmap's §§1.1, 1.3, 1.4, 2.1–2.3, 4.2, 6.4 and restates none.
- Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no upward or cyclic line. The pull request changes nothing outside the roadmap folder.
- Elaboration of `Suggested.lean` at the pins: no error, 68 `sorry` warnings and nothing else; 33 definitions, 73 theorems, no `set_option`, no sorried data. The file has no `variable` line; the elaborated signatures were read against the README and none differs.
- One-tactic probe: 10 sorried theorems tried on a copy; 1 closes (C01), 9 do not.
- Automatic checks: one form check failed (below); the targeted build and the text scanners passed. Ownership against the open pull requests was checked by searching their heads for Wigner functions, Euler angles, Krawtchouk polynomials, Gel'fand pairs and spherical harmonics.
- Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsLegendre, CompactGroups (main); the spherical harmonics, their orthonormality, addition theorem and completeness are owned by SpecialFunctionsLegendre and cited here; the `SU(2)` conventions, matrix elements and the pair `(SU(2), T)` are owned here and cited by SpecialFunctionsGroupModels; the `SU(2)` engine is owned by CompactGroups and cited here; Krawtchouk polynomials of real `p` have no other owner (LaguerreJacobi and SpecialFunctionsHypergeometric exclude them).

Source independence: 12 passages compared with 1 source (DLMF), none shared beyond formulas; largest share E, 64 of about 184 locators; neither the text nor the contents page of E (nor of VK, 55 locators) could be read; by the section numbers the README itself cites, the layers are not one to one with either book (Layer 3 draws on E §4.6 and VK §§6.6, 6.10; Layer 4 on VK §§6.2, 6.7, 6.10; Layer 5 takes VK §6.9 before §6.8).

Research link: none found. The README cites monographs, a survey and the DLMF (Edmonds 1957; Vilenkin–Klimyk 1991; Klimyk–Vilenkin 1995) and names as consumers SpecialFunctionsGroupModels and a roadmap on Clebsch–Gordan coefficients; it names no research result. Rests on the README.

## Not verifiable

- Every locator into [E] (sample targets 1.1, 1.2, 1.3, 1.4, 2.2, 2.3, 2.4, 2.5, 4.1, 6.2): the publisher's page is not an open copy and the sources service found no legal copy.
- Every locator into [VK] and [W] (sample targets 1.1–1.4, 2.2–2.5, 2.7, 3.4, 4.1, 4.3, 5.1, 5.2, 6.2): paywalled publisher; uncertified.
- Every locator into [KV], [D] and [M] (sample targets 1.1, 1.2, 1.4, 2.2–2.5, 2.7, 4.1, 5.1): the sources service found no legal copy.
- The misprints of [VK] and [KV] listed under References: the texts could not be read, so none is recorded below.
- The double cover is not in the pinned Tau Ceti, as the README says. The upstream Adjoint module was read on the library's main branch and has `TauCeti.pauliRotation`, `TauCeti.SU2.toSO3`, `toSO3_surjective`, `toSO3_eq_one_iff` and `quotientKerToSO3`; the pin cannot check them.

Automatic checks set aside as false positives: the rule that a section comment in the Lean file must head a declaration fired on the closing block of `#check` lines, which pin the consumed library declarations and are allowed.

## Source issues

- none

## For the human reviewers

- Not tested: Edmonds [E] has the largest share of locators (64 of about 184) and Vilenkin–Klimyk [VK] the next (55); neither text nor table of contents could be read, so wording and arrangement were not compared with them.
- Licence: the README's section "Prior formalization" says the roadmap reuses names and conventions of the public repository bjbraams/lean-SFVK (Apache-2.0, owned by the pull request's author; modules under `SFVK/SU2/`); its statements were not compared with `Suggested.lean`.
- Scope: all seven references are monographs, a survey or the DLMF (1957–1995); the README names no research article and no research result its headlines serve (`Research link: none found`).
- Sources: six of the seven cited works ([E], [VK], [KV], [W], [D], [M]) could not be read legally; only the DLMF locators were verified.
