# Review of NilpotentOrbits (pull request #2628 at a982a9c)

**Verdict:** accepted

**Summary.** Accepted: the two findings and the small correction of the previous review are repaired, and the full pass found no false statement in the README or in `Suggested.lean`. There is one small correction, not blocking: the pinned Tau Ceti already proves the open orbit of the grade-zero centralizer in `𝔤(2)`, which §2.2 still plans as a target and the scope paragraph lists as missing from the libraries. There are no format notes, and nothing is left for a human to decide.

## C01 — The pin already proves that the orbit of `e` under the centralizer of `h` is open in `𝔤(2)` and that two such elements are conjugate; §2.2 plans this as a target and the scope paragraph says the libraries lack it

An implementer of §2.2 would rebuild an argument the library has, and a reader of Scope and ownership is told it is absent. §2.2 (lines 445–447) asks to "prove that the `G(0)`-orbit of `e` is open in the irreducible space `𝔤(2)`" and that "Two such open orbits meet, hence coincide"; the scope paragraph (lines 1188–1190) counts "the orbit-openness and characteristic arguments in Layer 2" among the foundations "not in the libraries".

At the Tau Ceti pin:

- `IsSl2Triple.range_differential_flip_eigenspace_two_eq_top` (`Algebra/AlgebraicGroup/Tangent/Lie/Adjoint/Centralizer/Eigenspace.lean:190`): in characteristic zero, the differential at `e` of the orbit map of `C_G(h)` on the `2`-eigenspace of `ad h` is onto.
- `TauCeti.Comodule.isOpen_range_projectiveOrbitMap_mk_one_of_range_eq_top` and `TauCeti.Comodule.exists_basePointsRepresentation_eq_of_range_eq_top` (`Algebra/AlgebraicGroup/Representation/Orbit.lean:278` and `:287`): for an affine group of finite type over an algebraically closed field of characteristic zero and a finite-dimensional representation, a vector with surjective orbit differential has an open orbit, and two such vectors are carried one to the other by a rational point.

LieHighestWeightPartII §0.3 on main consumes exactly these for the same step. The repair is to cite the three declarations in §2.2 (text, *Needs:* line) and in the Tau Ceti contracts, and to keep as targets what the pin lacks: the parabolic of `λ` and the identification `C_G(λ) = C_G(h)`, the passage from equal dominant neutral elements to conjugacy of the nilpotent elements, and finiteness (§2.4). The scope sentence would then drop "orbit-openness", and the description's list of remaining targets ("the open orbit in degree two") would change with it.

## Verified sound

| Target | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.3 centralizers and orbits | sl₂, `e = E₁₂`; pin | `ker(ad e) = ℂe`, `[𝔤, e] = span(e, h)`, orbit dimension `2 = 3 − 1`; `Orbit.lean:68, 102, 115`, `Smooth.lean:51` carry the stated hypotheses | true |
| 1.3 Borel nilradicals | sl₃, `E₁₂`, `E₁₂ + E₂₃` | image `⟨e₁⟩`, kernel `⟨e₁, e₃⟩`; `V₂ ≠ ker` forces `V₁ = ⟨e₁⟩`; third condition `e₁ ∈ V₂` then automatic; two lines | Check true |
| 1.4 products, reductive case | 𝔤𝔩₂, `L = 0` | ad-nilpotent locus `cI + N`: dimension `1 + 2 = 3`; `tr = det = 0`: dimension 2; point for `L = 0` | true |
| 2.2 open orbit in degree two | sl₃; Tau Ceti pin | `diag(2,0,−2)` → (2,2); `diag(1,−1,0)` → `α₁ = 2`, `α₂ = −1`; Eigenspace.lean:190 and Orbit.lean:278, 287 prove the open orbit | true; already pinned (C01) |
| 2.3 regular orbit | sl₃, sl₂, `L = 0`; Yun16 l.178–181, BMIY22 l.228–229 | `E₁₂ + E₁₃`: rank 1, square 0, type (2,1); `8 − 2 = 6`, `3 − 1 = 2`, `0 = 0`; sources: `dim C_G(e) = r`, `dim 𝒩 = dim − r` | true; locators support |
| 4.2 type A dimensions | (3), (2,1), 𝔤𝔩₆, sl₄ | `λ′ = (1,1,1)`: 3, orbit 6; (2,1): 5, orbit 4; (4,1,1) and (3,3): 18 each; ranks (2,1) vs (3,0); sl₄: 12, 10, 8, 6, 0 | true |
| 5.1 unipotent scheme | 𝔾_m, SL₂; BMIY22 l.243–249 | `(T−t)(T−t⁻¹) − (T−1)² = −(t + t⁻¹ − 2)T`, `= −(t−1)²/t · T`; `t = 1 + ε` kills it; `−I`: `(T+1)²` | true; locator supports |
| 6.2 slice surface | sl₃ `e = E₁₂`, SL₂; LNS10 l.127–132 | `tr Y² = 6a² + 2b`, `det Y = −2a³ + 2ab + cd`, so `cd = 8a³`; `Ad(u)(e + tf) = [[t, 1−t],[t, −t]]` | true; locator supports |
| 7.1 Springer resolution | sl₂, sl₃; Yun16 l.136–140, 178–181; pin | fibre ℙ¹ over 0; two lines meeting at `⟨e₁⟩ ⊂ ⟨e₁,e₃⟩`; `totalSpaceScheme E = Spec Sym E^∨`, sections of `E`, so `Ω` gives `T*ℬ` | true; locators support |
| 7.2 flatness, normality | sl₂, `L = 0`; BMIY22 l.229–230, LNS10 l.127–132 | quadric cone singular at vertex only, codimension 2; point; normal (Kostant), faithfully flat on a slice | true; locators support |
| 7.3 restricted resolution | sl₂, `e = 0`; Yun16 l.291–298, 300–303; GHR06 l.92–94 | `T*ℙ¹ → 𝒩`, zero section of `O(−2)`: self-intersection −2; simply laced in Yun16, others referred to Slodowy | true; Slo80 not read |
| 8.1 germs | A₂, D₃, C₁; Yun16 l.289–297, LNS10 l.51–54, 78–81 | `cd − 8a³ = xy + z³` at `z = −2a`; `u = z + y²/2`: `x² + u² − y⁴/4`; `∂_z(x² + y²z + z) = 1` | true; locators support |
| 8.2 exceptional lattice | A₁, Aₘ, Dₘ, E₆–E₈; Yun16 l.275–286, 297–300; Mathlib | determinants `m+1`, 4, 3, 2, 1; `det(−C) = (−1)ᵐ(m+1)`; `CartanMatrix.E_det`: `9 − n` for `n ≥ 3` (Cartan/Basic.lean:376) | true; Slo80 not read |
| 8.3 non-simply-laced types | B₂ = C₂, C₁; LNS10 l.78–81, Yun16 l.279–286 | B₂ → A₃, C₂ → D₃ = A₃; C₁ → D₂ = A₁ × A₁ against A₁ | true; locators support |
| 9.2 diagram action | G₂, C₃, D₄; GHR06 l.149–187 | Table 1: S₂, S₂, S₂, S₃ for B, C, F₄, G₂; G₂, C₃, D₄ curves equal; S₃ and ℤ/3 orbits `{centre}`, `{3 outer}` | true; locator supports |
| 9.3 folding comparison | B₃, Bₙ, Cₙ, E₆ | B₃ → A₅, folding A₅ → C₃; Cₙ → Dₙ₊₁, folding → Bₙ; E₆ involution: 2 fixed nodes, 2 swapped pairs | true |
| `finite_orbits_isNilpotent_ad` | `L = 0`, sl₂, sl₃ | 1 orbit; 2 orbits; 3 orbits (dimensions 0, 4, 6) | true |
| `lift_eval_eq_zero_of_forall_isCentralizerRegular` | `L = 0`, sl₂ | `0` regular iff `L` abelian (pin, `isCentralizerRegular_zero_iff`); `𝒩 ∖ 0` dense in the irreducible quadric cone | true |
| `ringKrullDim_quotient_nilpotentConeIdeal` | `L = 0`, sl₂, sl₃ | `0 = 0 − 0`, `2 = 3 − 1`, `6 = 8 − 2`; rank ≤ dimension, no truncation | true |
| `exists_subregular_orbit` | sl₂, sl₃, G₂ | sl₂: `e = 0`, `3 = 1 + 2`, closure `{0}` = nilpotent non-regular; sl₃: `E₁₂`, `4 = 2 + 2`; G₂: `14 − 10 = 4` | true |
| `exists_isRegular_ofList_eq_nilpotentConeIdeal` | `L = 0`, sl₂, sl₃ | `[]`: `⊥ = ⊥`, `⊥ ≠ ⊤` in ℂ; `[a² + bc]`; `[tr X², det X]`, degrees 2, 3 | true |
| `nilpotentConeIdeal_isPrime`, `isIntegrallyClosed_quotient_nilpotentConeIdeal` | `L = 0`, sl₂ | `⊥` prime in ℂ; `a² + bc` irreducible, cone normal | true |
| `sliceConeRing_normal_surface_of_subregular` | sl₂, sl₃; triple relations | `h = 0` forces `e = f = 0`, then `dim L = r + 2` only for sl₂; ring `ℂ[a,b,c]/(a² + bc)`; sl₃: `ℂ[a,c,d]/(cd − 8a³)` | true |
| `nonempty_algEquiv_adicCompletion_sliceConeRing` | A 1, B n, C n, D n, G2; pin | `xy + z²`; `z^(2n)` = A₂ₙ₋₁; `z^n` = Dₙ₊₁; `CartanMatrix.B` has −2 at `(n−2, n−1)`: so₂ₙ₊₁; `Valid`: B ≥ 2, C ≥ 3, D ≥ 4 | true |
| `basePointIdeal` docstring | common zero or not; 𝔤𝔩₂ `e = I` | common zero: image ideal ⊆ augmentation, quotient `K`; otherwise some `p(e) ≠ 0` is a unit in it; `tr ↦ 2 + tr` | true as restated |
| `subregularEquation` docstring | C 1 | `CartanMatrix.C 1 = (2) = CartanMatrix.A 1`; `x² + y²z + z` has `∂_z = 1` at 0 | true as restated |
| Springer resolution (not statable) | Tau Ceti pin | `smooth_projectiveOrbitToSpec` (Smooth.lean:57): alg. closed, reduced, finite type; `relativeDifferentials` (LocallyFree.lean:95) needs `Smooth`; no incidence scheme | docstring stands |

- Earlier remarks: R01 repaired ("When `e` is a common zero of `nilpotentConeIdeal` it is a maximal ideal with residue field `K`, and otherwise it is the whole ring", lines 181–185 of `Suggested.lean`); R02 repaired ("a value need not be the subregular singularity of the Lie algebra with that Cartan matrix", lines 223–226); C01 repaired (§1.2 lines 329–332 cite `TauCeti.Comodule.smooth_projectiveOrbitToSpec` and keep only properness; docstring lines 42–49; contracts lines 1335–1336; the description follows).
- Source locators: 17 read at their lines in Yun16, BMIY22, LNS10 and GHR06 (every locator of the sampled sections), all supporting their claims; Slo80 §6 (2 locators) is settled as uncertified.
- Library declarations located at the pins: 36, with the statements and hypotheses read for those the table and C01 rest on, among them `Centralizer/Eigenspace.lean:190`, `Representation/Orbit.lean:278, 287`, `Smooth.lean:57`, `LocallyFree.lean:95`, `TotalSpace.lean:99`, `InvariantZeroLocus.lean:77`, `Adjoint/Orbit.lean:68, 102, 115`, `Adjoint/Smooth.lean:51`, `Sl2/Borel.lean:81`, `NilpotentCentralizer.lean:130`, `GeneralLinear/NilpotentOrbit.lean:55, 98, 123`, `OrbitClosure.lean:272, 282, 301`, `SerreCondition/Normal.lean:214`, `DynkinType.lean:105, 153, 219, 418`, `AdjointAction/Regular.lean:102`, Mathlib `Cartan/Basic.lean:125–141, 376`.
- Cross-roadmap citations resolved on main: all supplier sections exist (ReductiveGroups Layers 0–8, 3A, 5P, 6A, 9A.1b, 11C; FormalConnectionsOpers §§2.4, 4.3; LieHighestWeight Layer 7; LieHighestWeightPartII §§0.2, 0.3; RootSystems §§5.2, 6.1; ReflectionInvariantTheory §§1, 3; LieGroups Layers 0, 3, 7; CharacteristicClasses §5.1; ComplexKahlerGeometry Layer 1, §3.1; ComplexComparisonPartII §C-1.1; AlgebraicVectorBundles). Consumers cite labels N0–N9 and `Nk.n`, all covered by the numbering table.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2203 edges, 0 problem(s)`; every supplier is on main. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives nine `sorry` warnings and nothing else. The elaborated types of the 14 declarations agree with their README statements; no binder is lost.
- Padding, decided by reading the definitions and the pin: no theorem closes in one tactic or restates a definition; the pin has no cone ideal, slice coordinate ring or orbit-finiteness statement. The description's count of 54 Checks in 30 sections is right.
- Ownership against open pull requests: searched every open head and main for the Brieskorn–Slodowy objects, the cone, the slice and the Springer resolution; other roadmaps consume or use different objects (the Higgs nilpotent cone, p-adic unipotent orbits).

Overlap check: read LieHighestWeightPartII (main and open head), ReflectionInvariantTheory, LieHighestWeight, AdoIwasawa, RealSemisimpleLieGroups and ReductiveGroups, and also McKaySkewGroup, K3SurfacesAndSymplecticBoundedness and SpringerResolutionAndCharacteristicCycles. `Ad(G) = Int(L)`: LieHighestWeightPartII §0.2, cited. Conjugacy of triples over other algebraically closed fields: LieHighestWeightPartII §0.3, a variant both record. Weyl invariants: ReflectionInvariantTheory §3, cited. ADE hypersurface resolutions and intersection matrices: this roadmap, Layer 8; the quotients `ℂ²/Γ`: McKaySkewGroup §§7.1–7.3. The cone over other fields: SpringerResolutionAndCharacteristicCycles. Nothing else shared.

Source independence: 19 passages compared with 4 sources (the README at each of the 14 locator passages read, and §5.1's definition, §6.1's contracting action, §8.2, Convention 7 and the docstring of `sliceConeRing_normal_surface_of_subregular`), none sharing more than a standard term; largest share Yun16, 10 of 31 locators; contents compared with Yun16 (Lecture 1, §§1.1–1.7, all ten locators in §§1.2–1.3): independent. Slo80 could not be read.

Research link: Layer 5's exponential isomorphism is Proposition 2.3 of Bertoloni Meli–Imai–Youcis (2022), used for Jacobson–Morozov parameters; Layers 6–8 are the subregular slice setting of Lehn–Namikawa–Sorger (2010) after Brieskorn and Slodowy; Layer 7 is the Springer resolution of Yun's lectures (2016). Rests on the README's references and BMIY22 §2.1, LNS10 §§1–2, Yun16 §1.

## Not verifiable

- Slo80, §6 (the restricted resolution as the minimal resolution and the `−2`-curves for `Bₙ`, `Cₙ`, `F₄`, `G₂`, cited in §§7.3 and 8.2): paywalled and settled as uncertified; cited by its section and not opened.

## Source issues

- **Misprint** in BMIY22 at §2.1, p. 5: the source says the nilpotent variety is the unique reduced subscheme whose k-points are the nilpotent elements; it should be points over every extension of k, since an anisotropic form has only the k-point 0; affects nothing.

## For the human reviewers

- none
