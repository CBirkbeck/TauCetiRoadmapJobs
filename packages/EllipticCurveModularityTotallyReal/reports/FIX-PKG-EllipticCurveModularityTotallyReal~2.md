# FIX-PKG-EllipticCurveModularityTotallyReal~2

One review, `REV-PKG-EllipticCurveModularityTotallyReal`, with four P3 findings. All four were checked and are correct. F01 and F04 are applied with corrections to the suggested text. Only `packages/EllipticCurveModularityTotallyReal/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-EllipticCurveModularityTotallyReal/F01 (P3) — applied differently

**Verified.** §1.4 defines the **descended system** `W_θ` in bold, but it had *Needs:* and **Checks.** and no **API.** block. §§1.1, 1.2, 1.3 and 1.5 each have one.

**Changed.** An **API.** block now sits between §1.4's *Needs:* and its **Checks.** It has five bullets: members, restriction to M, reflection, base change and duality. One new Check, the "restriction witness", tests the polynomial rule. The *Needs:* line now also names `characterSystem θ`, and the carrier's restriction, dual and Tate twist from SmallRamificationAndAbelianVarietyBaseCases §5.0d.

**Why "differently".** Three of the proposed bullets were not correct as worded:

- **Bullet 1** said that two embeddings inducing the same λ give members that "differ by the corresponding automorphism of `ℚ̄_ℓ` over `M_{0,λ}`". That automorphism is over `ℚ_ℓ`, not over `M_{0,λ}`.
  - Two embeddings `M₀ → ℚ̄_ℓ` induce the same place exactly when `j′_ℓ = σ ∘ j_ℓ` for some `σ ∈ Gal(ℚ̄_ℓ/ℚ_ℓ)`. Such a σ is the identity on `j_ℓ(M_{0,λ})` only when `j′_ℓ = j_ℓ`.
  - The new bullet defines the member at λ as the θ-eigenspace of `H¹(C^δ_{n,L̄}, ℚ_ℓ) ⊗ M_{0,λ}`, which depends only on λ.
  - It says that `1 ⊗ σ` carries the eigenspace for `j_ℓ` σ-semilinearly and `G_L`-equivariantly onto the eigenspace for `j′_ℓ`. The computation: `u^*(1⊗σ)x = σ(j_ℓθ(u))(1⊗σ)x = j′_ℓ(θ(u))(1⊗σ)x`.
- **Bullet 2** claimed "the same bad set above S" as `characterSystem θ`. EllipticCurveModularityImaginaryQuadratic §4.1 only asserts that its bad set is "one finite set", so that equality has no source. The new bullet identifies the members, the Hodge multisets and the Frobenius polynomials at places `w | v` with `v ∉ S`, and says the two bad sets are not compared.
- **Bullet 4** said the restriction to `G_{L′}` "is the system built from `C^δ_n ⊗_L L′`". On the §5.0d carrier, restriction "enlarges S by ramified places". The system built over `L′` has the bad-reduction set of `J^δ_n ⊗ L′`, which can be smaller where `L′/L` is ramified. As raw data the two can therefore differ in S. The new bullet asserts only that the members agree and that the polynomials at `v′ | v`, `v ∉ S`, have roots equal to the `f(v′|v)`-th powers of the roots of `P_{θ,v}`.
- **Bullets 3 and 5** are kept. Bullet 5 now spells out its two consequences:
  - on roots: `{α⁻¹, β⁻¹} = {α/q_v, β/q_v}`;
  - on Hodge multisets: `−{0,1} = {0,1} − 1`.

## REV-PKG-EllipticCurveModularityTotallyReal/F02 (P3) — applied

**Verified.**
- `c(λ) = 2 − λ − λ⁻¹ = −(λ−1)²/λ`, so c vanishes modulo ℓ exactly when the reduction of λ is 1.
- EllipticCurveModularityImaginaryQuadratic §7.1 (at its open head) derives `c ≠ 0` from ℓ ∤ m.
- Its argument with `𝔽_{3^e}`, `e ≤ 4`, and `p > 100` is for `c² ≠ ±4`, the regular word, which serves decomposed genericity. This roadmap does not use decomposed genericity.

**Changed.** The first Check of §3.1:
- Old: "a failure would put λ of order p > 100 in `𝔽_{3^a}`…"
- New:
  - c is 3 for the pairs `(3,5)` and `(3,p)`;
  - for `(p,3)`, c vanishes modulo 3 only if the reduction of λ is 1, which is impossible for λ of order `p ≠ 3`;
  - computed instances at p = 101 and p = 7;
  - the bound `p > 100` is a hypothesis of §7.4 there and serves the regular word.

The reviewer's phrase "irreducibility alone needs only `p ≠ 3`" is narrowed to "the nonvanishing of c needs only `p ≠ 3`". §7.4's irreducibility conclusions still rest on the prime choice of §7.2.

## REV-PKG-EllipticCurveModularityTotallyReal/F03 (P3) — applied

**Verified.** In LeHung26 the page-6 marker is line 226 and the page-7 marker is line 262. §3.3 runs from line 250 to line 260, so it is entirely on p.6. The manifest locator already says "Section 3.3 p.6".

**Changed.**
- §3.1 locator: "§3.3, pp.6–7" → "§3.3, p.6".
- References entry for LeHung26: "… (9)–(11), §3.3, pp.6–7; §3.4, p.7" → "… (9)–(11) and §3.3, p.6; §3.4, p.7".
- No other "pp.6–7" occurs in the README, `Suggested.lean` or `sources.toml`.

## REV-PKG-EllipticCurveModularityTotallyReal/F04 (P3) — applied differently

**Verified.** In §4.3, θ was used for a Hecke character of KT and ψ for its Galois characters. Elsewhere θ and ψ are characters of `μ_n`.

**Changed in §4.3** (statement, proof and the Check on `y² = x³ − x`): θ and ψ become ξ. That gives `ξ_ι = r_{ℓ,ι}(ξ)`, `ξ_ι ≠ ξ^c_ι`, `AI_{KT/K}(ξ)`, `Ind ξ_ι`, and `a₅ = −2 = ξ(𝔭) + ξ(𝔭̄)` with `ξ(𝔭) = −1 ± 2i`.

**Why "differently".**
- **Letter.** I used ξ instead of the suggested ϕ. ϕ is the same letter as φ, which already denotes the twist isomorphism (Conventions, §§1.2–1.5) and Euler's function (§1.1, §2.3, Examples). ξ occurs nowhere else in the README.
- **Pattern repair.** The same reuse of ψ occurred in two more places, and both are renamed:
  - In Layer 2 a finite-order character was also called ψ: the GL2ModularityLifting contract (`det r = ε_ℓ⁻¹ψ`) and the last §2.2 Check. This is the layer where §2.1 uses ψ for the order-p character. Both now use ν, which is otherwise unused.
  - The ComplexMultiplicationAndExplicitReciprocity contract wrote that supplier's `ψ_A`. It now says "the algebraic Hecke character of k attached to A", with the supplier's section titles kept.
  - Without these two changes, the reviewer's own test ("θ and ψ occur only as characters of `μ_n`") would have failed.
- **Normalization.** The proof of §4.3 now states the normalization explicitly.
  - The supplier's rank-one components are `r_{ℓ,ι}(ξ⁻¹)` and its conjugate. This was checked against ComplexMultiplicationAndExplicitReciprocity §4.1, "One-dimensional CM components", which gives `ψ_{A,j} = r_{l,η}(χ_{A,τ}⁻¹)`, and against the geometric Artin normalization of AutomorphicGaloisRepresentationsPartII AG2.0.
  - Their duals are `ξ_ι = r_{ℓ,ι}(ξ)` and `ξ^c_ι`. This makes the statement's `ξ_ι = r_{ℓ,ι}(ξ)` agree with "their duals".

## Checks run

- **Elaboration.** `lake env lean packages/EllipticCurveModularityTotallyReal/Suggested.lean`, run from the content checkout, produced two warnings, both "declaration uses `sorry`" (lines 58 and 80), and no errors. The file is unchanged.
- **Signatures.** I ran `#check @…` on both declarations in one scratch copy, elaborated once.
  - `realCyclotomic_isCMField` keeps `[NumberField.IsTotallyReal k]`, `2 < n`, `[IsCyclotomicExtension {n} k M]` and `IsPrimitiveRoot ζ n`.
  - `three_five_switch` keeps `[NumberField K]`, `[DecidableEq (AlgebraicClosure K)]` and `[W.IsElliptic]`.
  - Both agree with README §1.1 item 4 and §2.3. Nothing changed.
- **Dependency direction.** Output:

      depcheck: 237 roadmaps, 2157 edges, 0 problem(s)

  There are no UPWARD, CYCLE or `moved:` lines.
- **Citations.** `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name found nowhere. The three earlier leads (`GaloisRep.IsOdd`, `GaloisRep.iso_of_frobenius_charpoly_eq`, `TateModule.residualRep`) are README names of ArithmeticGaloisRepresentations and are cited as such.
- **Ownership.** No construction is newly claimed. The API added to §1.4 is about this roadmap's own `W_θ`. It uses the §5.0d carrier operations owned by SmallRamificationAndAbelianVarietyBaseCases and the `characterSystem θ` owned by EllipticCurveModularityImaginaryQuadratic. Both are cited, not restated. No new supplier and no new gap.

## Adversarial pass on the new and changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.4 API, members | `j′_ℓ = σ∘j_ℓ`; ℓ split in `M₀` (several λ) | `u^*(1⊗σ)x = j′_ℓ(θ(u))(1⊗σ)x`; for `σ ≠ 1` on `j_ℓ(M₀)`, σ is not over `M_{0,λ}` | holds over `ℚ_ℓ`; the review's "over `M_{0,λ}`" is corrected |
| §1.4 API, restriction to M | k = ℚ, n = 3, inert 5, `B_t ≡ y² = x³ − x + 1` | `P_{1,5} = X² − 2X + 5`, roots `1 ± 2i`; squares `−3 ± 4i`; `X² + 6X + 25`; `#E(𝔽₂₅) = 32`, `a₂₅ = −6`, matching `(−2)² − 2·5` (brute-force count) | holds; added as a Check |
| §1.4 API, bad sets | `characterSystem θ` (supplier §4.1); carrier restriction (§5.0d) | supplier: "one finite set"; carrier: S enlarged by ramified places | equality not asserted |
| §1.4 API, reflection | `w u_ζ w = u_{ζ⁻¹}` | `u′^*_ζ w′^* x = w′^* u′^*_{ζ⁻¹} x = θ⁻¹(ζ) w′^* x` | `W_θ → W_{θ⁻¹}`, so `P_{θ,v} = P_{θ⁻¹,v}` |
| §1.4 API, duality | `a_v = −2`, `q_v = 5` | roots `−1 ± 2i`; `1/α = (−1 ∓ 2i)/5 = β/5`; Hodge: dual `{0,−1}`, twist `{−1,0}` | `W^∨ ≅ W ⊗ ε_ℓ` |
| §3.1 Check | `(3,5)`, `(3,p)`, `(p,3)` with p = 101, 7, 13 | `c = 3`; `ord_101(3) = 100` and `ord_7(3) = 6`, so `λ̄ ≠ 1`; 101 and 7 divide no `3^e − 1` with `e ≤ 4`; 13 divides `3³ − 1`, so the regular-word argument does not apply there, while c ≠ 0 still | c ≠ 0 for every `p ≠ 3`; the bound serves the regular word only |
| §4.3 rename | `y² = x³ − x` at 3 and 5; `y² = x³ + 1` at 5 | 4 points, `a₃ = 0`; 8 points, `a₅ = −2 = (−1+2i) + (−1−2i)`; 6 points, `a₅ = 0` (brute force) | unchanged values |
| §4.3 normalization | supplier `ψ_{A,j} = r_{l,η}(χ_{A,τ}⁻¹)`, AG2.0 geometric Artin | `V_ℓ` component: arithmetic Frobenius value `ξ(v)`; dual: geometric Frobenius value `ξ(v)`, which is `r_{ℓ,ι}(ξ)` | statement and proof agree |
| §2.2 contract and Check (ν) | rename only | none | no mathematical change |

## Maintainer notes

- No name that other roadmaps cite changed. There are no Lean declaration changes and no section renumbering.
- The plan's gap `detail` for `totally-real-weight-two-lifting` still writes "psi" for the finite-order character. It is ASCII internal text that readers do not see, and it is left unchanged.
- The review's source-issue note (LeHung26 line 230 citing "[23, Theorem 3]" where the lifting theorem is Theorem 2 of FLHS15) does not affect this README. The README already cites FLHS15 Theorem 2 in §2.2.
- Ownership against open pull requests was checked through `roadmaps grep`/`roadmaps show` at the listed heads for the objects touched: the §5.0d carrier, `characterSystem θ`, and the CM Hecke character. No new object is claimed.
