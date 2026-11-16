# Review of EllipticCurveModularityImaginaryQuadraticPartII (pull request #2445 at fcd601d)

**Verdict:** needs changes

## R01 (P3) — the second Check of §3.5 gives the condition for `p = 5` inside a statement for every `p ≥ 5`

**Location:** `TauCetiRoadmap/EllipticCurveModularityImaginaryQuadraticPartII/README.md` lines 931–932: "forces `(D − 1)ξ(φ) = 0` because `1 + D + ⋯ + D^(q_v − 1) = 1` when `5 | q_v − 1`".

**Claim:** The Check is about (d), which is stated for every `p ≥ 5`. There the sum is `1` when `p | q_v − 1` (line 918 says so), and `5 | q_v − 1` is neither sufficient nor necessary.

**Witness:** `p = 7`, `q_v = 11`: sum `≡ 4 + 6(D − 1) + 4(D − 1)² ≠ 1`. `p = 7`, `q_v = 29` (`5 ∤ 28`): `29 ≡ 1`, `C(29,2) = 406 ≡ 0`, `C(29,3) = 3654 ≡ 0 mod 7`, sum `= 1`.

**Repair:** Replace "when `5 | q_v − 1`" by "when `p ≥ 5` and `p | q_v − 1`".

## R02 (P3) — the pull request's summary credits Theorem 6.2 alone with removing `ζ₅ ∉ F`

**Location:** Pull request description, block `roadmap-summary`, paragraph "Why Tau Ceti wants it": "Theorem 6.2 drops the hypothesis ζ₅ ∉ F from the residual criterion of ModularityAndLanglandsExtensions".

**Claim:** The head attributes this to Theorems 6.2 and 8.1 together. Theorem 6.2 needs a protected place on the representation it lifts, which the curve of that criterion need not have; Theorem 8.1 is what removes the hypothesis.

**Witness:** README line 1752: "can drop the hypothesis `ζ₅ ∉ F` by Theorems 6.2 and 8.1". For `E/F` with `ζ₅ ∈ F`, image `SL₂(𝔽₅)` and potentially good reduction away from five, `P = ∅`: Theorem 6.2 does not apply.

**Repair:** Replace the sentence with "Theorems 6.2 and 8.1 remove the hypothesis ζ₅ ∉ F from the residual criterion of ModularityAndLanglandsExtensions §2.29, and Theorem 6.2 serves any CM lifting argument that meets residual image SL₂(𝔽₅) and has a protected place."

## Verified sound

| Target | Instances tried | Values computed (roadmap side / check side) | Result |
| --- | --- | --- | --- |
| 2.1 | `K₆₀`; LeHung26 lines 336, 342–355; CN23 line 4513 | `{a : a ≡ ±1 (15), a ≡ 1 (4)} = {1, 29}`; `29 ≢ 1 mod 5, 3`; CN Theorem 6.1 needs `ζ₅ ∉ F`, applied over `K` | holds |
| 2.2 | lifting primes; `h(t)` a square; parent §7.4 conclusions (1)–(3) | primes `3`, `p > 100`, so CN23 clause (4) (line 3856) never applies; `χ_(h(t)) = 1` gives `π_E = π_B` | holds |
| 2.5 (headline) | `ℚ(ζ₅)`, `K₆₀`; LeHung26 line 86 | source theorem assumes OpenAI26 Inputs 2.1, 2.2, 4.1; the parent's Layers 1–4, 6, 7 supply them | holds |
| 3.1 | `Ad(U)` on `e, h, f`; `UX − XU`; `diag(2,3)`; characteristic 2 | `D(h) = h − 2e`, `D(f) = f + h − e`; `[[z, −2x],[0, −z]]`; scalings `4, 1, 4`; Gram determinant `−2` | holds |
| 3.2 | norm of `D` over `𝔽₅, 𝔽₃, 𝔽₇` | `5 + 10(D−1) + 10(D−1)² = 0`, `H¹ = ad⁰/⟨e,h⟩`; `𝔽₃`: `(D−1)²f = e`, `H¹ = 0`; `𝔽₇`: dimension 1 against 0 | holds |
| 3.3 | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]`, `q_v = 11` | `M³ = 1`, `Φ² = 1`, `ΦMΦ⁻¹ = [[4,1],[4,0]] = M² = M¹¹` | holds |
| 3.4 | `N = [[a,b],[−a²/b,−a]]`; `ρ(φ) = [[q_vδ,z],[0,δ]]`; `q_v = 11` | `tr N = det N = 0`; `q(q+1)²δ² = (1+q)²ψ(φ)`; `11·144 = 1584`; kernel flag of rank 1, 2 matches LocalGaloisDeformationRings §2.3 | holds |
| 3.5 | `(p, q_v) = (5,11), (7,29), (7,11), (3,4)`; cocycle count | first two give sum `1`; `(7,11)` gives `4 + 6(D−1) + 4(D−1)²`; `C(4,3) ≡ 1 mod 3`; `dim Z¹ − dim B¹ = 4 − 2` | (a)–(d) hold; second Check is R01 |
| 4.1 | `Gal(LC_N/F) = SL₂(𝔽₅) × A`; inertia of order 2 | `H¹(A, M)^G = Hom(A, M^G) = 0`; `H¹(ℤ/2, ad⁰) = 0` since `2` is invertible | holds |
| 4.2 | `diag(2,3)`; `Ad(Uᵀ)e`, `Ad(Uᵀ)²e`; `κ(γσ₀)` | eigenvalues `4,1,4`, `W = ⟨e,f⟩`; `e − h − f`, `e − 2h − 4f`, determinant `2`; `κ(γσ₀) = κ(γ) + κ(σ₀)` | holds; matches CaptainSude26 lines 245–263 |
| 4.3 | `ℚ(ζ₅)`: `d = 2, t = 1, r = 6`; `d = 2, t = 3, r = 10` | `g = 0`; `dim R^loc = 14`, `g = 6`, `20 = r + 4t − d`, `22 = r + 4t` | holds; formula is CaptainSude26 line 439 |
| 5.1 | `[F⁺:ℚ] = 40`, degrees `(8,8,24)` and `(8,8,8,8,8)`; `36` | complementary sums `24 > 20`, `8 < 20`, `24 > 20`; `d_v + d_v' < D/2` forces `D > 32`; `8 ∤ 36` | holds; conditions are CN23 lines 4237–4246 |
| 5.2 | `d = 40`, ten places of degree 8, `R = ∅` | `dim R^loc_χ = 1 + 10·11 = 111 = 1 + 3t + 2d` | holds |
| 5.3 | `diag(u,1)`, `diag(1,u)` on `Iw_v`; `w = v^c`, `q_w = 11` | both operators the identity, `P_{v,σ} = (X−1)²`; indices `12` and `60`; `(1+ε)¹¹ = 1 + ε` over `𝔽₅[ε]` | holds; ACC23 lines 2329–2355 give the comparison |
| 5.4 | `d = 40`, `t = 10`, `R = ∅` | least `r = 111`; `dim R_∞ = 111`, `dim S_∞ = 151`, deficit `40` | holds |
| 6.1 | `p_b = 109`, `p_c = 2617`, `q = 11`; `E = ℚ(√31,√59,√71)`; Hilbert symbols | `2617 = 6·436 + 1` prime, both `≡ −1 mod 11`, `2617 ≡ 1 mod 109`; squares mod 5 and 11; product formula gives `−1` | holds |
| 6.2 (headline) | `μ² = 2` in `𝔽₂₅`, `γ = diag(1,2)`; `det ρ̄` of order 4; `ζ₅ ∈ F` | `det(μγ) = −1`, `(μγ)² = diag(2,3)`, order `240`, projective order `120`; `120 < 240`; preimage of `PSL₂(𝔽₅)` is `SL₂(𝔽₅)` | holds |
| 7.1 | involution on three nodes; fixed points of `w`; thicknesses | three fixed nodes give `p_a = 2`; genus `3` gives four horizontal fixed points and one isolated node; `2 + 1 = 1 + 1 + 1` | holds; `I₃` |
| 7.2 | `v(s) = 1, 5, 7` | `v(Δ_min) = 3, 15, 21`; `15` gives unramified `A[5]` | holds |
| 7.4 | `y² = x³ − x`, `y² = x³ + 1` over `𝔽₅`; AKT23 lines 3493–3507; CHT08 Lemma 4.1.2 | `8` points (trace `−2`), `6` points (trace `0`); `l` splits in `M ∋ ζ_{5⁷}` and is prime to `S`; lemma needs Galois local data | holds |
| 7.5 | generated subgroup; Example `y² = x³ + x + 1`; Theorem 6.2 hypotheses | transvections with entry `3` generate `SL₂(𝔽₅)`; `Δ = −496`, `j = 6912/31`; `L_{w'} = K_v`, so protection and Steinberg type persist | holds |
| 8.1 (headline) | `ℚ(ζ₅)`, `K₆₀`, `ℚ(√−1,√5)`; CaptainSude26 lines 26, 671 | only quadratic subfield `ℚ(√5)`; `K₆₀(ζ₅) = ℚ(ζ₆₀)`; Galois group `(ℤ/2)²` against cyclic of order 4 | holds |
| (S3) of switch parameters | parent §7.4 API at its open head | parent states "the specified geometric image lies inside the specialized `G_D` image" as an output, for arbitrary number fields | a stated output, not a proof step |

- Previous review (same head): it listed no finding; its one remark, on the second Check of §3.5, is R01.
- Source locators: 71 cited passages read at their lines (CaptainSude26 30, CN23 15, LeHung26 10, ACC23 5, AKT23 5, OpenAI26 3, MilneCM 2, CHT08 1); each is at the cited line and page and supports the statement.
- Library declarations opened at the pins: 14 Mathlib (for example `NumberTheory/NumberField/CMField.lean:70, 542, 564`, `AlgebraicGeometry/EllipticCurve/LFunction.lean:43, 79, 84`, `LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`, `RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:114`) and 4 Tau Ceti (`…/EulerCharacteristic/Theorem.lean:98`, `…/Duality/Perfect.lean:280`, `…/TateModule/Galois.lean:80`, `…/ClassFieldTheory/MuNRep.lean:130`). No automorphic, Weil–Deligne or Hodge–Tate carrier exists in either library.
- Cross-roadmap citations: every section and name cited from 21 suppliers and 3 consumers resolved on main or at the open heads, including 41 parent names; `ResidualImage.adZeroRep` is ArithmeticGaloisRepresentations `Suggested.lean` line 384. The three other leads of `citations.md` are source ids.
- Declared gap `gap:acc-torsion-inertial-comparison`: same slug in `plan.json` and at README line 349; hypotheses match ACC23 lines 2309–2355; no roadmap states ACC23 Theorem 3.1.1.
- Gate at fcd601d: every check passes. `depcheck: 256 roadmaps, 2432 edges, 0 problem(s)`. The diff outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there is no signature to compare and nothing to probe; none of Theorems 2.5, 6.2, 8.1 is statable at the pins.

Overlap check: read EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityTotallyReal, PotentialAutomorphyInfrastructurePartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, CrystallineLocalGlobalCompatibilityCM and ArithmeticGaloisRepresentations. The cover family, `switch_five` and the CM lifting criteria belong to EllipticCurveModularityImaginaryQuadratic; prepared patching and solvable preparation to CrystallineLocalGlobalCompatibilityCM; the trace-zero adjoint and `H¹(SL₂, ad⁰)` to ArithmeticGaloisRepresentations; all are imported. Nothing else is shared.

Source independence: 12 passages compared with 4 sources (CaptainSude26, LeHung26, CN23, MilneCM), none shared beyond formulas and one six-word mathematical phrase; largest share CaptainSude26, 22 of 51 parenthetical locators; contents compared with CaptainSude26: independent (`Layers 3–4 ↔ §3` with part of the proof in §4, `Layer 5 ↔ §4`, `Layer 7 ↔ §5`, `Layers 2, 8 ↔ §6`; Layers 1 and 6 have no counterpart, §2 has no layer, and the order of Layers 3–8 is forced by 3.5 → 4.1 → 4.3 → 5.4 → 6.2 → 7.5 → 8.1).

## Not verifiable

- The description's sentence on AI assistance (the number of review and red-team rounds): no file of the pull request records it.

## Source issues

- **Misprint** in CN23 at the end of the proof of Theorem 5.2, p. 86 (line 4460): the source says the auxiliary set contains all `q`-adic places of `K`; it should be of `F`, the field of the theorem; affects nothing.

## For the human reviewers

- Scope: Theorems 6.2 and 8.1 (Layers 3–8) rest on CaptainSude26, a pseudonymous, unrefereed GitHub release of 7 October 2026 (README lines 112–113, 1768–1774). LeHung26 line 355 has no seed when `ζ₅ ∈ K`; no other cited source treats that case.
- Scope: Theorem 2.5 rests on LeHung26, an unrefereed discussion draft whose Theorem 1.1 (line 86) assumes three inputs of OpenAI26, also unrefereed. No refereed statement was found in the eight cited sources or the open roadmaps.
- Licence: CaptainSude26 states no licence (README line 1774); `sources.toml` records it and OpenAI26 as `author-page`, both GitHub-hosted files.
