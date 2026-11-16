# Review of EllipticCurveModularityImaginaryQuadraticPartII (pull request #2445 at 669904e)

**Verdict:** needs changes

## R01 (P3) — §§3.3–3.5 cite a special case of CaptainSude26 Lemma 3.1 as the general statement

**Location:** `TauCetiRoadmap/EllipticCurveModularityImaginaryQuadraticPartII/README.md` line 877: "(CaptainSude26, Lemma 3.1, lines 184–220.)"; line 910: "(CaptainSude26, Lemmas 3.1–3.2, lines 187–226.)"; line 830: "(CaptainSude26, Lemma 3.1, lines 177–183, and …)".

**Claim:** §3.4 holds for any odd `p`, any `q_v` and any protected `ρ̄`, and §3.5(a)–(b) for any `q_v`. The cited lemma assumes `p = 5`, `μ₅ ⊂ F_v`, `ρ̄(τ) = U` and `ρ̄(φ) = 1`. The README drops these hypotheses without saying so. The general statements are true: the README's own computation proves them, and I checked it.

**Witness:** CaptainSude26 lines 177–183 assume `μ₅ ⊂ F_v` and `ρ̄(φ) = 1`. The README's §3.4 Check 4 (`k = 𝔽₂₅`, `z̄ = ζ ∉ 𝔽₅`) falls outside that lemma.

**Repair:** At line 877 write "(CaptainSude26, Lemma 3.1, lines 177–220, proves the case `p = 5`, `μ₅ ⊂ F_v`, `ρ̄(φ) = 1`; the computation above, with `ρ̄(φ)` upper triangular of diagonal ratio `q_v`, gives the general case.)". At line 910 write "(CaptainSude26, Lemmas 3.1–3.2, lines 187–226, prove (c)–(d) for `μ₅ ⊂ F_v` and `ρ̄(φ) = 1`; (a)–(b) for arbitrary `q_v` are the counting argument above.)". At line 830 write "(CaptainSude26, Lemma 3.1, lines 177–183, treats `ρ̄(τ) = U`, `ρ̄(φ) = 1`, `μ₅ ⊂ F_v`; the paragraph after Lemma 5.1, lines 533–536.)".

## R02 (P3) — the §7.5 Example leaves out two hypotheses of §7.2

**Location:** `README.md` lines 1671–1672: "choose `p > 100` from the parent's §7.2, a prime `q ≡ 1 mod 5` outside `Σ₀`, a place `v | q` and `t` in all the opens".

**Claim:** §7.2 also requires `q ≠ p` and that `q` split completely in the field of definition of the §7.1(b) data. Without the splitting, the node branches need not be defined over `K_v`, so §7.2(a) does not give split multiplicative reduction at `v`.

**Witness:** `101 ≡ 1 mod 5`. If `p = 101`, the Example's wording allows `q = p = 101`, which §7.2 (line 1467, "`q ≠ p`") excludes. Splitting in the field of definition of the §7.1(b) data is a hypothesis at line 1467 and is absent from the Example.

**Repair:** Replace the clause with "choose `p > 100` from the parent's §7.2, a prime `q ≡ 1 mod 5` with `q ≠ p`, outside `Σ₀` and split completely in the field of definition of the data of §7.1(b), a place `v | q` and `t` in all the opens;".

## R03 (P3) — the pull request's validation sentences describe a file with declarations

**Location:** Pull request description, "Validation:" paragraph: "the targeted Lake build succeeds with `sorry` as the only warning". The "Roadmap folder" paragraph before it says: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti".

**Claim:** At 669904e, `Suggested.lean` declares nothing. It has no `sorry`, produces no warning and states no definition or theorem.

**Witness:** `lake env lean` on `TauCetiRoadmap/EllipticCurveModularityImaginaryQuadraticPartII/Suggested.lean` exits 0 with no output. Lines 48–50 of that file are an empty namespace.

**Repair:** Replace the first sentence with "the targeted Lake build succeeds with no warnings". Replace the second with "`Suggested.lean` declares nothing; its module docstring names the three headline theorems and the carriers each lacks at the pins".

## Verified sound

| Target | Instances tried | Values computed (roadmap side / check side) | Result |
| --- | --- | --- | --- |
| Conventions, Frobenius witness | `U` over `𝔽₅`, `q_v = 11, 7` | `U¹¹ = U`; `U⁷ = [[1,2],[0,1]]`; `7⁻¹ ≡ 3 mod 5` | holds; arithmetic Frobenius pinned |
| Switch-parameter Check 2 | `[[1,3],[0,1]]`, `[[1,0],[3,1]]` over `𝔽₅` | products `[[0,3],[3,1]]` and `[[1,3],[3,0]]`, which differ | holds |
| 1.1(a),(b) | `ℚ(i) ⊂ ℚ(ζ₂₀)`; `ℚ(i) ⊂ ℚ(i,√5) ⊂ ℚ(i,√3,√5)`; `K = ℚ(2^{1/3})` | cyclic of order 4 with 3 intermediate fields; quadratic subfields `d ∈ {−1,±3,±5,±15}`; `S₃`: `c₁c₂` can be a 3-cycle | holds; non-CM base fails as the Check says |
| 1.1 sources | MilneCM lines 292–300 | Cor. 1.5: composita of CM fields are CM; Rem. 1.6: subfields fixed by all `c₁c₂` are CM or totally real | supports (a), (b) |
| 2.2 | `h(t)` a square; lifting primes | `χ_(h(t)) = 1` ⇒ `π_E = π_B`; primes `3, p > 100`, so CN23 (4) (line 3856, `p = 5` only) never applies | holds |
| 2.5 (headline) | `K₆₀`; `ℚ(ζ₅)` | `{a ∈ (ℤ/60)ˣ : a ≡ ±1 (15), a ≡ 1 (4)} = {1, 29}`; `29 ≢ 1 mod 5, 3`; `K₆₀(ζ₃) = ℚ(ζ₆₀)` | holds; LeHung26 line 86 states it, given OpenAI26 inputs the parent supplies |
| 3.1 | `Ad(U)`; characteristic 2; `diag(2,3)` | `D(h) = h − 2e`, `D(f) = f + h − e`; Gram determinant `−2`; `e`, `f` scaled by `4` | holds; characteristic-2 counterexample correct |
| 3.2 | norm of `D` over `𝔽₅, 𝔽₃, 𝔽₇` | `5 + 10N + 10N² = 0`, `H¹ = ad⁰/⟨e,h⟩`; `𝔽₃`: `N = (D−1)²`, `H¹ = 0`; `𝔽₇`: dimension 1 | holds |
| 3.3 | `q_v = 11`, `Φ = [[4,1],[0,1]]`, `M = [[0,−1],[1,−1]]`; ramification index 5 | `ΦMΦ⁻¹ = [[4,1],[4,0]] = M⁻¹ = M¹¹`, `M³ = 1`; `U⁵ = 1` | holds |
| 3.4 | `δ = 1, z = 0, q = 11`; `(1+εf)U`, `(1+εh)U`; general `ρ̄(φ)` | `11·144 = 1584` both sides; traces `2+ε` and `2`; `ρ(φ) = [[qδ,z],[0,δ]]` valid for every odd `p` | true at README generality; locator narrower (R01) |
| 3.5 | (d) at `q ≡ 1 mod 5`; `q ≡ 2 mod 5`; `p = 3, q = 4` | `Σ_{i<q} D^i = q + C(q,2)N + C(q,3)N² = 1`, `dim H¹ = 4 − 2`; `h⁰ = 0`; `C(4,3) ≢ 0 mod 3` | holds; `p ≥ 5` necessary |
| 4.2–4.3 | `diag(2,3)`; `Ad(Uᵀ)`; `F = ℚ(ζ₅)`, `t = 1`, `r = 6`; `d = 2`, `t = 3`, `r = 10` | eigenvalues `4,1,4`; `det(e, e−h−f, e−2h−4f) = 2`; `g = 0`; `20 = r+4t−d`, `22 = r+4t` | holds; matches CaptainSude26 line 439 |
| 5.1 | `[F⁺:ℚ] = 40` with degrees `8,8,24`; five places of degree `8`; `36` | complementary sums `24>20`, `8<20`, `24>20`; at `36` every place needs degree `8`, and `8 ∤ 36` | holds; 40 minimal |
| 5.4 | `d = 40`, `t = 10`, `R = ∅` | least `r = 111`; `dim R_∞ = 111`, `dim S_∞ = 151`; deficit `40 = l₀`; `dim R^loc = 111` | holds |
| 6.1 | `p_b = 109`, `p_c = 2617`, `q = 11`; `E = ℚ(√31,√59,√71)` | both prime, `2617 ≡ 1 mod 436`, both `≡ −1 mod 11`, `(−2617/109) = 1`; generators are squares mod 5, 11 and `≡ 3 mod 4` | holds |
| 6.2 (headline) | `μ² = 2` in `𝔽₂₅`, `γ = diag(1,2)`; `det ρ̄` of order 4 | `det(μγ) = −1`, `(μγ)² = diag(2,3)`, order `240`, image `PGL₂(𝔽₅)`; index `120 < 240` | holds; hypothesis `ζ₅ ∈ F` necessary |
| 7.1 | involution on 3 nodes; thicknesses; `p = 101` | 3 fixed nodes ⇒ `p_a = 2 ≠ 1`; `z₁z₂ = s²`, resolved `1+1+1` ⇒ `I₃`; `R_*` of order `606` | holds; matches CaptainSude26 lines 509–516 |
| 7.2 | `v(s) = 1, 5, 7` | `v(Δ_min) = 3, 15, 21`; `15` divisible by 5 gives unramified `A[5]` | holds |
| 7.3 | `v(q_A) = 3, 15`; non-split twist | inertia `[[1,3],[0,1]]` versus trivial; twist gives `−1` times a unipotent Frobenius, inertia unchanged | holds |
| 7.4 | `y² = x³ − x`, `y² = x³ + 1` over `𝔽₅`; CHT08 Lemma 4.1.2 | `#E = 8` (`a = −2`, ordinary), `#E = 6` (`a = 0`, supersingular); lemma needs Galois `E'_v/F_v`, and `N_u` is Galois | holds |
| 7.5 and its Example | generated subgroup; Example with `q = p = 101` | `⟨[[1,3],[0,1]],[[1,0],[3,1]]⟩` has order `120`; Example admits `q = p` | theorem holds; Example incomplete (R02) |
| 8.1 (headline) | `ℚ(ζ₅)`, `K₆₀`, `ℚ(√−1,√5)` | only quadratic subfield `ℚ(√5)` is real; `K₆₀(ζ₅) = ℚ(ζ₆₀)`; `(ℤ/2)²` group, so `ζ₅ ∉` | holds |

- Distinct cited passages checked against the cached texts: 59 (CaptainSude26 23, CN23 14, LeHung26 9, ACC23 4, AKT23 3, OpenAI26 3, MilneCM 2, CHT08 1). Each is at the cited line and page.
- Library declarations: 17 Mathlib and 4 Tau Ceti names elaborated by `#check` in one scratch file, all present at the pins. Examples: `Matrix.SL2.commutator_eq_top` (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`), `WeierstrassCurve.localPolynomial` (`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43`), `IsCyclotomicExtension.Rat.isCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:564`), `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` (`TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean:98`).
- Cross-roadmap citations: every section, target and name cited from 21 supplier roadmaps resolved at their open heads or on main, including 40 parent declaration names and CrystallineLocalGlobalCompatibilityCM §§7.5, 8.2–8.7 and 9.1–9.11. Of the four leads in `citations.md`, three are source ids, not roadmaps; `ResidualImage.adZeroRep` is ArithmeticGaloisRepresentations' `Suggested.lean` line 385.
- Gate at 669904e: every check passes. Dependency check: `depcheck: 252 roadmaps, 2396 edges, 0 problem(s)`. The diff outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there is no signature to compare and nothing to probe for padding. None of Theorems 2.5, 6.2 and 8.1 is statable: the pins have no automorphic representations, Weil–Deligne representations or potentially semistable representations.
- Declared gap `gap:acc-torsion-inertial-comparison` uses the same slug in `plan.json` and at README line 349. Its hypotheses match ACC23 lines 2309–2355. No roadmap on main or at an open head states ACC23 Theorem 3.1.1; CrystallineLocalGlobalCompatibilityCM §7.4 covers `p`-adic places only.

Overlap check: read EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityTotallyReal, PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM and OrdinaryAutomorphicFormsAndModularityLiftingPartII; the main-branch and results lists are empty. Shared objects: the cover family, character systems, `switch_five` and the CM lifting criteria (owner EllipticCurveModularityImaginaryQuadratic, imported); prepared patching and solvable preparation (owner CrystallineLocalGlobalCompatibilityCM, imported, with §§5.3 and 6.1 here stated as variants). Nothing else is shared.

Source independence: 26 passages compared with 7 sources, none shared beyond formulas and phrases of at most four words; largest share CaptainSude26, 23 of 64 locators; contents compared with CaptainSude26: independent. Layers 3–8 follow its §§3–6 in an order forced by the `*Needs:*` chain 3.5 → 4.1 → 4.3 → 5.3 → 5.4 → 6.2 → 7.5 → 8.1, while Layers 1–2 and 6 have no counterpart section.

## Not verifiable

- none: all eight cited texts are in the sources cache and were read at the cited lines.

## Source issues

- **Misprint** in CN23 at the end of the proof of Theorem 5.2, p. 86 (line 4460): the source says the auxiliary set `V` contains all `q`-adic places of `K`; it should say of `F` (`K` is AKT23's notation for the field in Theorem A.14); affects nothing.

## For the human reviewers

- Scope: Theorems 6.2 and 8.1 (Layers 3–8) rest on CaptainSude26, a pseudonymous, unrefereed GitHub release of 7 October 2026 (README lines 112–113 and 1753–1759). LeHung26 line 355 says it has no seed when `ζ₅ ∈ K`. No other cited source treats that case.
- Scope: Theorem 2.5 rests on LeHung26, an unrefereed discussion draft (Hexagon preprint, README line 1749), and the parent's OpenAI26. Searched: the eight cited sources and the open roadmaps; no refereed statement found.
- Licence: CaptainSude26 states no licence (README line 1759). `sources.toml` records it as `author-page` for a pseudonymous GitHub release; OpenAI26 is recorded the same way.
