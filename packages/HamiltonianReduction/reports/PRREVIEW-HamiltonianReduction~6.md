# Review of HamiltonianReduction (pull request #2690 at 6d61ae8)
Folder: `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/`
**Verdict:** accepted

**Summary.** Accepted with no findings. This was a full reading of the unchanged head: every Check and formula of Layers 1–5 was recomputed, 21 source locators were read at the text, and no false statement or unsupported headline was found. The four small corrections and the one format note of the previous review are not repaired and are carried unchanged in substance: §3.2 is narrower than the theorems it cites, §3.0e and most of Layer 5 have no locator, the Heisenberg group has no Lie group structure at the pin, and the description omits the restored anchors. Nothing new is left for a human beyond the licence note on Meinrenken's lecture notes.

## C01 — §3.2 states singular reduction only for compact groups at zero, while the theorems it cites cover proper actions of any Lie group

An implementer who follows the sentence builds only the compact case, and singular reduction for proper actions of noncompact groups then has no owner, although §3.1 supplies their local model. The sentence (line 1469) reads "For compact `G` and singular reduction at zero, construct the orbit-type pieces of the level and the strata of the quotient". Its parenthesis cites Bates–Lerman, Theorem 7, Corollary 14 and Theorem 15, which assume a proper Hamiltonian action of a Lie group and a locally closed coadjoint orbit (BatesLerman1997 lines 312–314, 601–604, 651–654), with no compactness and no restriction to zero.

Either state the orbit-type decomposition at that generality, with compact `G` at zero as the special case, or add the proper noncompact case to "Not claimed" with the reason.

## C02 — The orbifold presentation, the normal-subgroup stages statement and most of Layer 5 have no source locator

A reader cannot check the hypotheses of these targets against the literature. The following carry no theorem or page locator: §3.0e (line 1329); §§5.2–5.7 and §§5.9–5.10 (lines 1617–1757 and 1780–1839). Layer 5's only locators are in its preamble for §5.1 (Meinrenken, Theorem 7.46; Cannas da Silva, §§25.3–25.4) and in §5.8 (Huebschmann, §§2.18–2.32). In §3.0c the product case is located (Meinrenken, Proposition 8.13; Cannas da Silva, §24.3), but for a closed normal subgroup the text says only that the case "identifies the quotients in the same way"; Cannas da Silva's §24.3 mentions that extension in one closing sentence and proves nothing (CannasDaSilva2001 lines 5853–5855).

For §3.0e, Cannas da Silva, §24.5, pp. 150–151, treats regular torus levels and the weighted circle actions on `ℂ²` that the Check uses (CannasDaSilva2001 lines 5877–5904). For Layer 5 and for stages by a normal subgroup I opened no candidate source.

## C03 — §2.6 cites a Heisenberg carrier with no Lie group structure, although the pin already has its analytic charts

§2.1's homogeneous orbit `G / G_ν` needs a `LieGroup`, so §2.6 and §2a.7 cannot be applied to the real Heisenberg group from what their *Needs* lines name. §2.6 (line 888) names `TauCeti.HeisenbergGroup`, which at the pin is a structure with a group law and no manifold structure (`TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean`, line 58); §2a.7 (line 1125) names `TauCeti.heisenberg`, the Lie algebra of matrices (`TauCeti/Algebra/Lie/Heisenberg.lean`, line 125).

Tau Ceti's `TauCeti.Nil` (`TauCeti/Geometry/Manifold/Riemannian/Nil/Basic.lean`) has the type `ℝ × ℝ × ℝ` with its charts and `IsManifold 𝓘(ℝ, ℝ × ℝ × ℝ) ω` (lines 92–111), the group law `(a, b, c)(x, y, z) = (a + x, b + y, c + z + a y)` (lines 169–194) and the isomorphism `Nil.toHeisenberg : Nil ≃* HeisenbergGroup ℝ` (line 204). No `LieGroup` instance for `Nil` or `HeisenbergGroup` exists in that folder or in the Heisenberg files. The smallest repair: cite `TauCeti.Nil` and `TauCeti.Nil.toHeisenberg` in §2.6's *Needs*, and add to §2.6 the step that `Nil` is a Lie group, its multiplication and inversion being polynomial.

## C04 — The description leaves out the restored anchors and the table of former labels

A reader of the description cannot tell that the links from roadmaps on main into this README survive the renumbering. The description says "A paragraph at the end of "How to read the build" states this map of the former numbering". It does not mention the two anchors kept before Layers 1 and 2 (lines 109 and 689), which CotangentLagrangian, IntegrableSystems and ConvexityToric link to on main, nor the table at the end of "Scope and ownership" (lines 1939–1950).

It would be right to append: "The two heading anchors that roadmaps on main link to, `#r1-smooth-actions-moment-maps-and-equivariance` and `#r2-coadjoint-orbits-and-kks`, are kept before Layers 1 and 2, and a table at the end of Scope and ownership repeats the map of the block labels."

## N01 — The table of former labels repeats only part of the map in "How to read the build"

The table (lines 1941–1950) has rows for the block labels and R3.1 only; R1a.k, R2a.k, R3.2 and R3's text before R3.1 are mapped only in the paragraph at lines 66–69. A reader who looks up R2a.2 (cited by ConvexityToric on main) or R1a.2 (cited by DGFloer) in the table finds no row. Add the four rows, or a sentence pointing to the paragraph.

## Previous findings

The previous review, of this same head, had no findings. Its small corrections and its format note are all unrepaired, the folder being unchanged:

- C01 — not repaired: "For compact `G` and singular reduction at zero, construct the orbit-type pieces of the level" (line 1469); carried as C01.
- C02 — not repaired: §3.0e and §§5.2–5.7, 5.9–5.10 still have no locator; carried as C02, with the normal-subgroup stages statement added.
- C03 — not repaired: "Tau Ceti `TauCeti.HeisenbergGroup`" (line 888); carried as C03.
- C04 — not repaired: the description is unchanged; carried as C04.
- N01 — not repaired: the table has the same eight rows; carried as N01.

## Verified sound

| Statement | Instances tried | Values computed (README side / independent side) | Result |
|---|---|---|---|
| §1.3 translation moment map and Heisenberg cocycle | `V = ℝ²`, `Z = ∂_x`, `Z' = ∂_y`; pin `MomentMap.lean` 590, 689 | `d(ω(Z,x))(v) = ω(Z,v) = ι_Z ω(v)`; defect `ω(Z,v)`; cocycle `ω(∂_x,∂_y) = 1`; pin: `ω(τZ, x)`, `ω(τZ, τZ')` | holds |
| §1.3 `Sp(V)` and lifted rotations | `A ∈ 𝔰𝔭`, `g ∈ Sp`; `n = 3` | `½(ω(Aw,v)+ω(Av,w)) = ω(Av,w)`; `½ω(Agv,gv) = μ(v)(g⁻¹Ag)`; `p·(ξ×q) = ξ·(q×p)` | holds |
| §1.2 component criterion | `O(2)` on `T*S¹`, shift by `c ≠ 0` | reflection: `−p + c` against `−p − c`; `θ(gk) = θ(g) + Ad*_g θ(k)` makes `dθ_g = Ad*_g dθ_1 = 0` | holds |
| §1a flux signs and homotopy identity | torus translations; `(x+t, y+ux)`; shear `t sin 2πx`; cylinder | `ι_X ω = A(a dy − b dx)`; `∂_u β_t − ∂_t β_u = dx = d(x)`; `−sin(2πx)dx = d(cos(2πx)/2π)`; `ι_X(dr∧dθ) = f dr`, class 1 | holds |
| §2.2 KKS form and orbit moment map (sample) | general `G`; `SO(3)` radius `r`; Heisenberg `r₀ ≠ 0`; sharp convention | `η_O(ν)(ξ) = ν([ξ,η]) = ι_(ξ_O)ω(η_O)`; `(ξ×ν)×(η×ν) = (ν·(ξ×η))ν`, area `4πr`; `dp∧dq/r₀`; `π♯dℓ_ξ = −ξ_O` | holds |
| §2.4 `exists_mem_normalizer_Ad_eq` (headline) | `SU(2)`, `X = diag(i,−i)`, `Y = −X`; `U(n)` permutations | `c g T g⁻¹ c⁻¹ = T`, `Ad_(cg)X = Ad_c Y = Y`; `Ad(T)` trivial on `𝔱`, so `n ∉ T` | holds |
| §2.5 `isConnected_stabilizer_coadjointRepresentation` (headline) | `SO(3)`; `U(3)`, `diag(i,i,0)`; `O(2)` at `0` | circle, `SO(3)`; `U(2)×U(1)`, `5 = 3 + 2`; `O(2)` disconnected, so connectedness of `K` needed | holds |
| §2a.2–2a.3 Hessian and index formula | `SO(3)`, `p = rZ`, `X = aZ`; `U(3)` regular; minimal coset `w` | `q_p A = −rJA`; `Hess = −(a/r)B` both ways; indices `6,4,4,2,2,0`; `dim − 2ℓ(w)` from `#{β>0, β(μ)>0, wβ<0} = ℓ(w)` | holds |
| §2a.7 `Spin(7)` test | supports `1234, 1256, 1357`, `e_i² = −1` | square `(−1)⁶(−1)⁴ = 1`; commutation `(−1)^(16−2) = 1`; sums `3456, 2457, 2367, 1467`; order 16 against `(ℤ/2)³` | holds |
| §3.0a regular reduction (sample, headline) | circle on `ℂⁿ` at `−½`; `SO(3)` on `T*ℝ³`, `c ≠ 0`; `g x = x ⇒ g ∈ G_c` | `2n−1−1 = 2n−2`; `6−3−1 = 2`, `dμ(ξ_M) = ξ×c ≠ 0`; Meinrenken 8.3 + 8.4 same hypotheses | holds |
| §3.0b shifting (sample) | generators `(ξ,0)` at `(1,z)`; abelian `G`; `SO(3)` | `ω(ξ_M,η_M) = c([ξ,η]) = ω_KKS(ξ_O,η_O)`, difference 0; `8 → 5 → 2`; other sign gives `μ⁻¹(½) = ∅` | holds |
| §3.0c stages (sample) | `T*U(2)` by `SU(2)` then `U(1)`; `T²` on `ℂ²` | `8 − 6 = 2`, then a point; direct: a point; `Ad_n ξ − ξ ∈ 𝔫` | holds; C02 for the normal-subgroup locator |
| §3.0d discrete quotients (sample) | `ℤ²` on `ℝ²`; `ℤ/2` by `−1` | torus of area 1; fixed origin, cone, excluded by freeness | holds |
| §3.0e locally free levels (sample) | weights `(p,q)` coprime; `(2,2)` | generator `i(pz₁,qz₂)`, `μ = −½(p|z₁|²+q|z₂|²)`; `ℤ/p` on `z₂=0`; `(2,2)`: `ℤ/2` everywhere | holds; C02 |
| §3.1 local normal form (headline) | trivial `H`, `ν = 0` (`T*G`); fixed point of circle on `ℂ` | `−dλ = b(ξ) − a(ζ) + η([ξ,ζ])`; `d⟨Ad*_gη,ξ⟩(ζ,b) = b(ξ)+η([ξ,ζ])`; `½ω(iz,z) = −½|z|²` | holds |
| §3.2 singular reduction | weights `(1,1)` at 0; weights `(1,−1)` | level the origin; level `|z₁|=|z₂|`, quotient `ℂ` by `z₁z₂`, strata `{0}`, `ℂ∖{0}`; Bates–Lerman: proper actions | holds, narrower; C01 |
| §4.1 cotangent reduction (sample) | shift for invariant `c`; Ortega–Ratiu conventions; Hopf | `(p+⟨c,A⟩)(ξ^left) = c(ξ)−c(ξ) = 0`; `τ_α*ω = ω − π*dα`; `A = −A_left` turns `Ω − B_c` into `ω_can + pr*β_c` | holds |
| §5.1 gauge moment map | `g_t = exp(tξ)` | `[ξ,A] − dξ = −d_Aξ`; `∫B(d_A a,ξ) = ∫B(a∧d_Aξ) = Ω(ξ_A,a)` | holds |
| §5.2 Sobolev range (sample) | `s = 1`, `s > 1`, dimension 2 | `H¹ ⊄ L^∞`, not an algebra; `H^s ⊂ C⁰` for `s > 1` | holds; C02 |
| §5.4 flat quotient (sample) | `U(1)` over `T²` | `Hom(ℤ², U(1)) = U(1)²`, conjugation trivial | holds; C02 |
| §5.5 deformation complex (sample) | `U(1)`; irreducible `SO(3)` | `χ = (2−2g)dim 𝔨`, `h² = h⁰`: `h¹ = (2g−2)dim 𝔨 + 2h⁰`; `2g`; `6g−6` | holds; C02 |
| §5.6 centre and central curvature (sample) | `O(2)`; `F_(A+a)` | reflection `−1` on `𝔷 = ℝ`; `[a∧a] ∈ [𝔨,𝔨]`, so `F^𝔷` changes by `d^𝔷 a_𝔷` | holds; C02 |
| §5.7 ineffective kernel (sample) | `O(2)`; finite `K`; connected `K` | `Ad_u = Id` and `du = 0`; `C_K(SO(2)) = SO(2)`; finite: whole gauge group; connected: `Z(K)` | holds; C02 |
| §5.9 regular semisimple locus (sample) | `U(1)`, `g ≥ 1`; connected `K` | `(2g−2)+2 = 2g`; `H⁰_A = H⁰(𝔷_P)`, `= 𝔷` for connected `K` | holds; C02 |
| §5.10 framed quotient (sample) | `U(1)`; general | `h¹ + dim 𝔨 − h⁰ = (2g−1)dim 𝔨 + h⁰`; `U(1)`: `2g = dim U(1)^(2g)`; lattice `2πH¹(Σ;ℤ)` | holds; C02 |
| §2.6 Heisenberg model orbits | pin: `Nil/Basic.lean`, both Heisenberg files | adjoint orbits `aX+bY+ℝZ`; no `LieGroup` instance at the pin | gap; C03 |

- Source locators read at the text: 21 — Meinrenken2024 Propositions 7.18, 7.20, Theorems 7.25, 8.3, Remark 8.4, Proposition 8.6, Example 8.9, Proposition 8.13 (lines 3136–3169, 3322–3341, 3696–3742, 3764–3789, 3866–3878); CannasDaSilva2001 §22.4, Homework 17, Theorem 23.1, §§24.3–24.5 (lines 5461–5522, 5550–5555, 5830–5904); BatesLerman1997 Theorem 7, Proposition 11 and its remark, Corollary 14, Theorem 15; OrtegaRatiu2005 pp. 1–3 (lines 29–46, 63–98, 132–137); AlexandrinoBettiol2010 Lemma 4.26, Definition 4.28, Theorem 4.31. Pages and hypotheses agree with the README in each case.
- Library declarations opened at the pin: `Geometry/Symplectic/Hamiltonian/MomentMap.lean` 355, 575–596, 689–691; `Algebra/Lie/Coadjoint.lean` 131–144; `Geometry/Lie/Subgroup/Torus.lean` 82–89; `LinearAlgebra/RootSystem/FundamentalDomain.lean` 201, 247; `Geometry/Manifold/Riemannian/Nil/Basic.lean` 92–204; `Algebra/Lie/Heisenberg.lean` 125; `GroupTheory/SpecificGroups/Heisenberg.lean` 58; no statement of either headline found under `Geometry/Lie`.
- Cross-roadmap citations resolved on main: SmoothBundlesConnections B1.0, B1.1, B1.4, B2.1, B2.5, B3.1, B4.1, B4.2, B5.2; LieGroupoidsPoisson Conventions, G0.0, G3.4, G3.5, G4.3, G4.5, G4.6A, G6.3, G7.2–G7.4; LieGroups Layers 5A, 6; MorseTheory 2.3, 2.4, 5.1; MorseNovikov 6.4; HeegaardFloer 4.1; DifferentialGeometry 0.4, 1.4, 3.5, 5.4, 6.2, 6.4, 8.3, 8.4, 10.2, Layers 5, 10; DeRhamCohomologyAndDuality 2.4, Layer 3; GeometricTopology 1.1, 1.3.1, 1.5; AlgebraicTopology Layer 4, 6.1, 6.4; Orbifolds O1.4, O2, O4.2, O7; ComplexKahlerGeometry 5.4, 5.7; PDE Layers 4–5; SpinGeometry 1.1; SchubertGeometry 9.7; ConvexityToric 1.1, 3.1, 4.2. CotangentLagrangian §§4.1, 4.2, 4.3, 4.7 resolved at the head of its open revision, which the description names as merging first.
- Dependency check: `depcheck: 182 roadmaps, 2075 edges, 0 problem(s)`; no UPWARD or CYCLE line. All suppliers are on main.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: the two `sorry` warnings only. Elaborated types compared with §2.4 and §2.5: compact, connected, Hausdorff and finite-dimensional binders all present; nothing changed.
- One-tactic probe on a copy of the file (`simp`, `rfl`, `infer_instance`, the witness `g`, `aesop`): neither theorem closes. No padding. Headlines not stated (reduction, flux, KKS, chamber parametrization, orbit Morse theory, local normal form, Layer 5) are each named in the module docstring with the missing carrier.
- Changes outside the folder: none. 68 Checks counted, as the description says.
- Overlap check: read ConvexityToric (main), GeometricQuantization (main), the SymplecticGeometry index (main), IntegrableSystems (main) and CotangentLagrangian (main and its open revision); nothing shared. ConvexityToric and GeometricQuantization cite Layers 2, 2a and 3 as this roadmap's; the compact real root data are LieGroups Layer 6's and are consumed here. No other roadmap plans `G / N` as a Lie group or the flux homomorphism.

Source independence: 17 passages compared with 5 sources, none shared beyond formulas and standard names; largest share CannasDaSilva2001, 9 of 33 locators; contents compared with CannasDaSilva2001: independent (its Lectures 22–25 meet only Layers 1, 3 and 5; Layers 1a, 2, 2a and 4 have no counterpart there, and the order moment maps → orbits → reduction → gauge theory is forced by the *Needs* lines of §3.0b, §4.1 and §5.8).

Research link: Layer 1a is Banyaga's flux theorem (1978); Layer 3's normal form and singular reduction are Bates–Lerman (1997); Layer 2a is Bott's Morse theory of orbits (1956); Layer 5's local model is Huebschmann (1995), after Atiyah–Bott. Rests on the README's references and the texts read.

## Not verifiable

- Nothing in the sample. Banyaga1978, Bott1956 and Huebschmann1995 were outside this round's sample and were not reread.

## Source issues

- **Misprint** in Meinrenken2024 at Theorem 8.3, p. 101: the source says the reduced form is characterised by the pullback of `ω` along the inclusion equalling the pullback of `ω` along the projection; it should be the pullback of the reduced form `ω_μ` along the projection; affects nothing.
- **Misprint** in Meinrenken2024 at Proposition 7.18, p. 87: the source says, in the equivariance line of the proof, that the moment-map component equals the contraction of `θ` with the generating field; it should carry the minus sign of the statement on both sides; affects nothing.

## For the human reviewers

- Licence and status: Meinrenken2024 is unpublished lecture notes on the author's Toronto page (README line 2120). It carries 8 of the 33 locators, including the general-group statements of regular reduction and of the Kirillov–Kostant–Souriau theorem.
