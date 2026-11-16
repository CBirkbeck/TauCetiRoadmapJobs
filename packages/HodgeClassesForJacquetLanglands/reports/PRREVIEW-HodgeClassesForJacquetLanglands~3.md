# Review of HodgeClassesForJacquetLanglands (pull request #2436 at e9118f6)

**Verdict:** needs changes

The previous review of this head listed no findings, so there is nothing to check as repaired. The findings below come from the full review.

## R01 (P2) — the `d = 1` coefficient cohomology and multiplicity space already have an owner

**Location:** `TauCetiRoadmap/HodgeClassesForJacquetLanglands/README.md` lines 35–36: "no earlier roadmap states these, and they are needed here first."

**Claim:** For a quaternion algebra split at one real place, the local systems, the descent through the effective central kernel, the compact Matsushima comparison and the Hecke multiplicity space of `H¹` are already stated by a roadmap earlier in the merge order. This README neither cites it nor says how §§0.2 and 0.5 differ.

**Witness:** HilbertModularVarietiesAndShimuraCurves at its open head: §R18.4.1 (README line 3367), §R18.4.24b (3955), §R18.4.25a (3975), §R18.4.25 (3994). AutomorphicGaloisRepresentations §3.1 (line 2036) consumes that rank-two space.

**Repair:** Replace the quoted clause with: "For a quaternion algebra split at exactly one real place, the local systems, the descent through the effective central kernel, the compact Matsushima comparison and the Hecke multiplicity space of `H¹` of the Shimura curve are HilbertModularVarietiesAndShimuraCurves §§R18.4.1, R18.4.24b, R18.4.25a and R18.4.25, in the `ℓ`-adic realization over a splitting coefficient field; §§0.2–0.5 differ in treating every compact datum of abelian type and every `d`, with `L`-rational Hodge and `ℓ`-adic realizations in `M_E^L`. No earlier roadmap states the general case." Add a `### From TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves` contract with those four sections. Add a Check to §0.5: for `d = 1` and `r = 0`, `V_i ⊗_L E_λ` is the rank-two multiplicity space of §R18.4.25 (both sides are `Hom` from `(π_{i,f})^K` into `H¹`).

## R02 (P2) — the algebraic groups of §§1.7–1.8, Layer 2 and §5.1 are never defined

**Location:** `README.md` lines 1297–1299: "let `GSU_E(U) = {g ∈ GU_E(U) : det_E g = ν(g)²}`. Prove that `g ↦ ⋀²g` is an isogeny of algebraic `F`-groups `GSU_E(U) → GU_B(⋀²U)°` with scheme-theoretic kernel `μ₂`".

**Claim:** `GU_E(U)`, `U_E(U)`, `GSU_E(U)`, `GU_B(X)`, `U_B(X)` and their projective quotients are used as algebraic `F`-groups, but no target constructs them and no supplier is cited for them. The `*Needs:*` line gives only ReductiveGroups Layers 3 and 6.

**Witness:** A search of the README for "group scheme", "group functor" and "closed subgroup" finds no definition. `Suggested.lean` lines 32–34 say these group schemes are absent at the pins. The only construction of `U` and `GU` is AutomorphicLFunctionsAndLocalFactorsPartII §0.0, later in the merge order.

**Repair:** State the carriers here; the notion moves down from the later roadmap. After §1.2 add: "For `σ² = id` and nondegenerate Hermitian `H`, define `GU_E(U)` as the `F`-group functor `R ↦ {(g, ν) ∈ GL_{E ⊗_F R}(U ⊗_F R) × R^× : H(gx, gy) = ν·H(x, y)}`, a closed subgroup of `Res_{E/F}GL_E(U) × 𝔾_m` (ReductiveGroups Layer 3), `U_E(U) = ker ν`, and `GSU_E(U)` the closed subgroup `det g = ν²`." In §1.6 add the same definition for `GU_B(X) ⊂ GL_B(X) × 𝔾_m` and `U_B(X)`, with `°` the identity component. Give each its API (smooth, connected for `GU_E`, base change to `F̄` equal to `GL_n × 𝔾_m`) and Checks: dimensions `17` and `16` for `GU_E`, `GSU_E` at `n = 4`; `dim GU_B(X)° = 16` with two components; the multiplier is determined by `g` when `U ≠ 0`.

## R03 (P2) — the `L`-rational isotypic part is stated without an `L`-model

**Location:** `README.md` lines 728–729: "`H^i(Sh, 𝕍)_Π = Hom_{H(G(𝔸_f),K)}(Π_f^K, H^i(Sh_K, 𝕍))`"; lines 877–879: "prove that `f^*` identifies the `Π_H`-isotypic part with the `Π_G`-isotypic part".

**Claim:** `Π_f^K` is a complex space and `H^i(Sh_K, 𝕍)` an `L`-space, so the formula defines no object of `M_E^L` unless `Π_f^K` has a Hecke-stable `L`-structure. The source defines the complex part and puts the rationality hypothesis on the pullback statement; §0.3 drops it.

**Witness:** IP23 lines 694–696 (the definition is on `𝕍_ℂ`) and line 722 (`L` contains the field of definition of `Π_H` and `Π_G`). Instance: trivial coefficients, `L = ℚ`, `ℚ(Π_f) = ℚ(√5)`: no `ℚ`-form of `Π_f^K` exists.

**Repair:** In §0.2 write: "the complex isotypic part `H^i(Sh, 𝕍_ℂ)_Π = Hom_{H(G(𝔸_f),K)}(Π_f^K, H^i(Sh_K(ℂ), 𝕍_ℂ))`; and, when `L ⊃ ℚ(Π_f)` and `Π_f^K` has an `H_ℚ(G(𝔸_f),K)`-stable `L`-structure `Π_f^K(L)`, the `L`-rational part `Hom_{H_ℚ(G(𝔸_f),K)}(Π_f^K(L), H^i(Sh_K, 𝕍))`, an object of `M_E^L` whose complexification is the complex part". In §0.3 add: "when `L` contains the common field of definition of `Π_H` and `Π_G` and the chosen `L`-structures correspond under `f`, this is an isomorphism in `M_E^L`; otherwise it is asserted for the complex parts only". Add the `ℚ(√5)` instance as a Check in §0.2.

## R04 (P3) — wrong page range for IP23 §§12.2.5–12.2.11

**Location:** `README.md` lines 2791–2792: "(IP23, §§12.2.5–12.2.11, pp. 96–98; proof of Theorem 12.4, p. 99)".

**Claim:** §12.2.5 begins on p. 97, not p. 96.

**Witness:** IP23 line 4455 is the marker of p. 97 and §12.2.5 starts at line 4462. Page 96 ends inside §12.2.4 (line 4451).

**Repair:** "(IP23, §§12.2.5–12.2.11, pp. 97–98; proof of Theorem 12.4, p. 99)".

## R05 (P3) — the locator of §2.8 stops one page short

**Location:** `README.md` lines 1488–1489: "(IP23, §4.1, pp. 20–22; Propositions 5.7 and 5.11, pp. 31–32)".

**Claim:** The kernels `t ↦ (t, t⁻¹)`, `α ↦ ([1, α], [1, α])` and the formula for `ξ`, which the target and its third Check state, are printed on p. 23.

**Witness:** IP23 line 976 is the marker of p. 23; the embeddings and `ξ` are at lines 980–984, and §4.2 starts at line 986.

**Repair:** "(IP23, §4.1, pp. 20–23; Propositions 5.7 and 5.11, pp. 31–32)".

## R06 (P3) — undefined symbols in the auxiliary data of §10.4

**Location:** `README.md` line 2818: "`(E, τ̃, φ, φ̃, η, K, K₁, K₂, v₁, v₂)`".

**Claim:** `τ̃`, `φ̃`, `v₁` and `v₂` occur nowhere else in the README. The tuple is the source's list of symbols, not the roadmap's own objects.

**Witness:** A search of the README for `τ̃`, `φ̃` and `v₁` returns line 2818 only. The same tuple is IP23 line 4512.

**Repair:** "there are auxiliary data (the CM field `E` and place `v₀` of §10.2, the Hilbert representation of §10.1 with its constituent `τ`, a vector `φ ∈ τ`, the Schwartz form of §7.1, the character `η` of §7.7, levels `K`, `K₁`, `K₂`, and the vectors of the `L`-models chosen in §10.3) for which".

## Verified sound

| Statement | Instances tried | Roadmap side | Computed / source side | Result |
| --- | --- | --- | --- | --- |
| §0.1 data | `d = 0`, `d = n`, `k_v = 3` | `d = 0` kept, `d = n` rejected, exponent `(2−3)/2` not integral | IP23 line 840 (a real place ramified in both), line 792 (weights even) | agrees |
| §0.3 degree formula | `ℤ[√2]`, `K(9) ⊂ K(3)` | `1` and `3` points, index `9`, degree `3`, `f_*f^* = 1` | `ε` has order `8` mod `3`, `24` mod `9` (`ε¹² ≡ −1`); `72/24 = 3`; `−ε⁴ ≡ 1 − 3√2`, order `3`; Mil17 lines 2820–2830 | agrees |
| §§0.2–0.3 isotypic part | `L = ℚ`, `ℚ(Π_f) = ℚ(√5)` | `Hom` into `L`-cohomology | no `ℚ`-form; IP23 lines 694–696, 722 | R03 |
| §0.5 at `d = 1` | `F` real quadratic | rank two in `H¹` | HilbertModularVarietiesAndShimuraCurves §R18.4.25: the same `Hom`, rank two | R01 |
| §1.1 volume | `diag(1,2,1,−5)`, `c = −1, −2`; rank `0`, `σ(t) = t²` | `−10`, `−5/2`; `t⁻³` against `σ(vol) = t⁻⁶` | `det/(σ(c)c)` gives the same; IP23 lines 1175–1183 | agrees |
| §1.3 `existsUnique_isExteriorStar` | diagonal `H`; `H = 0` | six images, signs `−,+,−,−,+,−` | recomputed from the signs of `e_K ∧ e_J`: the same; IP23 lines 1207–1212; `H = 0` gives `L = 0` | agrees |
| §1.4 `IsExteriorStar.comp_self` | diagonal; Gram `1 + E₁₂`; alternating example | `a₁a₂a₃a₄`; `L²e₁₃ = e₂₃`; `64` | `L²e₁₂ = σ(a₁a₂)a₃a₄e₁₂`, equal to `vol` only if `σ(a_i) = a_i`; `L(e₁₃) = e₂₄ − e₁₄`, `L² e₁₃ = e₂₃`; Pfaffian `8` | agrees; `hH` needed |
| §1.7 `IsExteriorStar.map_similitude` | `g = t ∈ E^×`; `H = 0` | factor `ν²/det g` | left `σ(t)²L`, right `(σ(t)²t²/t⁴)t²L = σ(t)²L`; `0 = 0` | agrees |
| §§1.7–1.8 group statements | search for the carriers | algebraic `F`-groups `GSU_E`, `GU_B°`, `PGU` | no defining target, no supplier | R02 |
| §2.7 three plus one | basis `e₁, e₂, e₃ ∣ e₄` | `Wj = ⋀²U₃` | `L(e₁₄) = −a₁a₄e₂₃ ∈ ⋀²U₃`; IP23 line 1549 (p. 37), line 1559 (p. 38) | agrees |
| §2.8 diagram | `([b₁, α₁], [b₂, α₂])` | `[[b₁, b₂], Nrd(b₁)α₁⁻¹α₂]` | `det(g₁)α₁α₂ = Nrd(b₁)α₁⁻²α₁α₂`; IP23 line 984, on p. 23 | agrees; R05 |
| §3.3 torus map | `y = (1,1,1,−1)`, `(1,1,i,i)` | `(−1,−1,−1)`, `(1,1,−1)` | the same; IP23 lines 1869–1882 (p. 44) | agrees |
| §4.6 compact restriction | `ℓ = 1` | `(x₁ + εix₂)φ₀`, no sign | pairing `(−1)^ℓ` times Fock `(−1)^ℓ` is `1`; IP23 line 2345 prints `(−1)^ℓ` | README right |
| §7.1 theta data | `(4,2)` and `(0,6)` | `τ` of weight `−k_v−1` at `Σ`, `k_v+1` outside | kernel weights `ℓ + m/2 = k_v+1` and `−(k_v+1)`; IP23 lines 3010–3011, 3094–3097 | agrees |
| §8.5 degree selection | `d = 1` | `q₁` in `(1,1)` at each split place | each split place has degree `≥ 2`, total `2d`; IP23 lines 3947, 3960, 4009–4014 | agrees |
| §8.6 Hodge criterion | `w⁻¹ = (23)`, `w = 1` | `(k_v−1, k_v−1)`, `(0, 2k_v)` | `½(k−2, −k, k, −k+2)`, `Z`-exponent `−2`, `k′ = k−1`; `2k−4`, `k′ = 0` | agrees |
| §9.3 additive characters | `log χ`; `Frob ↦ 1` | de Rham exactly when unramified | `dim Hom(G_K, ℚ_ℓ) = [K:ℚ_ℓ] + 1`, unramified part `1`; IP23 lines 4144–4145 | agrees |
| §10.3 locator | §12.2.5 | pp. 96–98 | starts at line 4462, p. 97 | R04 |
| §10.4 invertibility | `d = 1` | diagonal `2 × 2`, both entries nonzero | IP23 lines 4513–4520 with Proposition 10.1 for both signs | agrees; R06 |
| §10.5 invariant parameters | `j(s) = ([s,s], s)` | `η_T(j(s)) = 1` | `T ≅ Res_{E/ℚ}𝔾_m` through `α`, `j(s) ↦ s`, `η(s⁻²·s) = 1`; IP23 lines 1019–1033 | agrees |
| §10.7 Hodge class | `d = 0`; weights | rank one of type `(0,0)`; weight `d + d − 2d = 0` | IP23 lines 4527–4529 and 840–842 | agrees |
| §10.9 weight two | `F` real quadratic, `d = 1`, `ℚ(π) = ℚ` | class in `H²(X₁ × X₂, ℚ)(1)` acting on `H¹` | `H¹ → H³ → H¹(−1)`, the twist restores; IP23 lines 166–168, 225–231, 4502 | agrees |

- Source locators checked against the text: IP23, all 98 parenthesised locators by section, item and equation against the page markers (two wrong, R04 and R05); Mil17, 5; Wal85, 4; FM06, 4.
- Library declarations opened at the pins: 26, all present, among them Mathlib `LinearAlgebra/ExteriorPower/HodgeStar.lean:48` (the square identity is a TODO at lines 22–27), `WedgePairing.lean:42, 78, 92, 130`, `Pairing.lean:64, 71`, and Tau Ceti `Analysis/InnerProductSpace/HodgeStar/Complex.lean:126, 144`, `LinearAlgebra/ExteriorPower/Basis.lean:157, 175`. No pinned declaration states a semilinear star or any of the three theorems.
- Cross-roadmap citations resolved: every cited section heading and declaration name in 27 suppliers, on main or at the open head; statements compared for MetaplecticAutomorphicForms §§2.5, 3.9, 3.32a, 3.35, AutomorphicFormsOnReductiveGroups §§7.4, 7.6, PadicHodgeTheory §§3.1, 3.3, 3.6, 7.2, AutomorphicBundles §0.2, ShimuraVarieties §8.7, AnabelianGeometryAndNonabelianChabauty §4.6, EndoscopicTransferAndUnitaryTraceComparison §8.3.
- Declared gaps: the 8 slugs of the README match the plan's `gaps` list; each names a supplier and section.
- Gate at e9118f6: every check passed. Dependency check: `depcheck: 252 roadmaps, 2396 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings and nothing else. `#check @` on the four declarations shows no lost binder and the README's generality.
- Padding probe: `rfl`, `simp [IsExteriorStar]`, `infer_instance`, `simp_all` and `exact?` close none of the three theorems.
- Pull request text: the title and the description agree with the head; no finding.

Overlap check: read MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII, ExceptionalThetaCorrespondencesForG2, EndoscopicTransferAndUnitaryTraceComparison, ShimuraData, ArithmeticLocallySymmetricSpaces, AdelicAlgebraicGroups, and also HilbertModularVarietiesAndShimuraCurves and its Part II. Shared objects: the `d = 1` quaternionic coefficient cohomology and multiplicity space, owner HilbertModularVarietiesAndShimuraCurves (R01); the group schemes `U` and `GU` of a Hermitian space, stated only by AutomorphicLFunctionsAndLocalFactorsPartII §0.0, which is later in the merge order, so they move down to this roadmap (R02); the real generator formulas of the Weil representation, owner this roadmap (§4.2), since MetaplecticAutomorphicForms §2.5 is nonarchimedean. `overlaps.md` reports no dropped ids and no conflicting heads.

Source independence: 22 passages compared with 4 sources, none shared beyond what a definition forces (longest run 6 words, the definition of `Z_s`, IP23 line 682); largest share IP23, 116 of 133 locators; contents compared with IP23: independent. The pairs are Layer 0 ↔ §§2–3, Layers 1–2 ↔ §5 with §4.1, Layer 3 ↔ §§6–7, Layer 4 ↔ §8, Layer 5 ↔ §§4.2–4.3 with §12.2.2–12.2.3, Layer 6 ↔ §9, Layer 7 ↔ §10, Layers 8–9 ↔ §11, Layer 10 ↔ §12. Two sections are split, two merged and one moved, and the remaining order is forced by the `*Needs:*` lines of §§4.4, 7.4, 7.8, 8.1, 9.2 and 10.4.

## Not verifiable

- none

## Source issues

- **Misprint** in IP23 at §3.2, p. 19: the source says the isotypic component is concentrated in degree `2d`; it should be degree `d`, the dimension of the variety; affects nothing.
- **Misprint** in IP23 at the second diagram of §4.1, p. 22: the source labels the rank-one quaternionic block as a unitary group over `E`; it should be the unitary group over `B`, as on p. 21; affects nothing.
- **Error** in IP23 at Proposition 8.2, p. 55: the source says the contraction carries a factor `(−1)^ℓ`; it should carry none, since the pairing sign and the sign of (8.2) cancel; affects nothing.
- **Gap** in IP23 at the proof of Theorem 12.4, p. 99: the source says the Galois group acts trivially on the components of the block Shimura variety; it should take the component parameter in the Galois-invariant subspace, which contains the special class; affects the proof.

## For the human reviewers

- none
