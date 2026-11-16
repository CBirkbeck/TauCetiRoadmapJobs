# FIX-PKG-IgusaVarietiesAndTorsionConcentrationPartII~8

Findings of REV-PKG-IgusaVarietiesAndTorsionConcentrationPartII~7: five findings, two P2 and three P3. I checked each one against the sources, the supplier roadmaps at their heads and the README. All five are correct, and all five are applied. For F01, one step of the suggested repair is done differently, because the supplier it relies on does not state what the repair assumes (see F01).

## F01 (P2) — applied

**Verified.** `S_K^{(a)}(ℂ) = G^{(a)}(ℚ) ∖ (X × G(𝔸_f)/K)`, where `X = G(ℝ)/Cent(h)` (PELModuli §M3.4, README §8.1).

- `Cent(h) = ℝ_{>0} × ∏_{τ∈Φ} U(p_τ) × U(q_τ)`, which is connected.
- On `V_τ⁺`, which is definite, an element of the centralizer scales the form by `ν`, so `ν > 0` there.
- An element with `ν < 0` swaps the signature, so one exists exactly when `p_τ = q_τ` for every `τ`. When it does, the swap of orthonormal bases of `V_τ⁺` and `V_τ⁻` has similitude `−1` and order 2.

So Matsushima's formula for `S_K(ℂ)` needs `K_∞ = K_max°`, not `K_max`. The reviewer's witness is `GU(1,1)`:

- With `K_∞`: `ep(1) = χ(ℙ¹) = 2`, which equals `H^0 + H^2`.
- With `K_max`: the element of similitude `−1` acts by `−1` on `H²(ℙ¹)`, so `ep(1) = 1`.

CS17 does not fix `K_∞` (CS17 lines 4079–4090). The explicit formula for `c(π_f)` is the README's own.

**Repair done differently in one step.** Repair 2 says to apply ALS.5b.4 "on the connected variant". I read ArithmeticLocallySymmetricSpaces at its head. ALS.5b.4 is stated only for `X_K`, built from `X^G = G(F_∞)/K_∞A_∞`, where `K_∞ = G(F_∞)^θ` is a maximal compact subgroup (ALS.0.4). The connected variant `X̃^G` occurs only as ALS.0.4's API item `connectedVariant` and in ALS.5b.6 for `GL_n`.

So I derive the formula on `X̃` from ALS.5b.4 as stated:

- The nontrivial `χ = sgn∘ν` is `(ω∘ν)_∞` for the quadratic character `ω` of `𝒦/ℚ`.
- For `K ⊂ ker(ω_f∘ν)`, the function `[x,g] ↦ sgn ν(x)·ω_f(ν(g))` splits the quotient built from `X̃` into two copies of `X_K`.
- Hence `H^*(X̃) = H^*(X) ⊕ H^*(X)⊗ω_fν`. Reindexing `π ↦ π⊗ων` then gives the `(𝔪_G, K_∞)` formula.

ALS.5b.4 takes `LocallySymmetric.FrankeInput` as a hypothesis. AutomorphicSpectralTheory §§5.10, 5.12 and 5.14 prove it "under … full-`K_∞` conventions" (its line 112, read at its head), and the README now cites them.

**Changed** (old → new):

- Conventions: "`K_∞` a maximal compact subgroup" → `K_∞ ≅ ∏ U(p_τ)×U(q_τ)`, the compact part of `Cent(h)`. A new paragraph adds `K_max`, `e ∈ {1,2}`, the Shapiro sum `⊕_χ`, `f_EP = Σ_χ χ·f_max` and the `ω∘ν` splitting.
- The contracts for AutomorphicSpectralTheory and ALS (ALS.0.4 added) are updated to match.
- §10.2: the statement, route, *Needs* and elliptic-sign argument are updated.
- §10.3: the `ep` bullet, the route, *Needs*, and the discrete-series Check (`dim = e`) are updated, and a new negative-control Check is added.
- Layer 10 Examples (`c(π_f) = e·(ε_G d(G_ℝ))⁻¹Σm_a`, and `ep(1) = ∏ binom(n,p_τ)`) and Dependencies are updated.

**Same pattern elsewhere.** The Layer 10 Examples said "`ep(1)` = Euler characteristic of the compact dual". That is true only for `K_∞`, and it is now explicit. "Cohomological for the trivial representation" (§10.4, gap division-algebra-unitary-base-change) now uses the `K_∞` meaning. This adds only `π` with `π_∞⊗sgnν` cohomological, which are `π'⊗ων` with the same base change, so no supplier contract changes. Layer 9 uses no `(𝔪_G, K)`-cohomology of `G`.

## F02 (P2) — applied

**Verified.** A double coset `[KgK]` at `q` acts on `H^*(S_K, L_V)` only if the correspondence lifts to level `K′`, which needs `K′_q = K_q`. On the reviewer's witness (`K′_q` principal congruence, `V` nontrivial on `K_q/K′_q`), `T_{i,v}` for `v | q` has no action. §11.8(2) already works with `𝕋^{S′}`.

**Changed.**

- §8.6(1): "`𝔽_ℓ`-local systems `L` … `L^∨(d)`" → the reviewer's sentence. It covers `L_V` for normal `K′ ⊂ K` with `K′_q = K_q` outside `S′ ⊇ S`, the operators and maximal ideals of `𝕋^{S′}`, and `L_{V^∨}(d)`. It adds that the operators of `𝕋^S` at `S′ ∖ S` need not act.
- The proof gains one sentence on lifting the correspondence, and the equivariance clause now reads "`𝕋^{S′}` for `L_V`".

**Same pattern elsewhere.**

- §11.8(2) and (3) already use `𝕋^{S′}`.
- In §8.9(2), `L_ξ/λ` trivializes at a `K′` with `K′_q = K_q` for every `q ≠ ℓ`. Since `𝕋^S` already omits `ℓ`, `𝕋^{S′} = 𝕋^S` there, and the statement is unchanged.

## F03 (P3) — applied

**Verified** at EndoscopicTransferAndUnitaryTraceComparison's head:

- "### 8.22 Unitary specialization and the endoscopic coefficients" treats the quasi-split `G_{2n}` with the data of CS non-compact §§5.1, 5.3 and 5.4.
- "### 14.4 The signed source Igusa trace identity" and "### 14.5 Finite spectral factorization with virtual coefficients" are stated for the CSnc test functions.
- Our §9.1 *Needs* includes §§8.21 and 6.25, and §9.3 *Needs* includes §§6.22 and 14.3.

**Changed.** The Scope paragraph of kept variants gains two sentences. They say that §§8.22, 14.4 and 14.5 state the identity and factorization for the rank-`2n` quasi-split datum of signature `(n, n)` of the non-compact setting. §§9.1 and 9.3 are the forms of these for a compact Case 2 datum of rank `n` and arbitrary signature, proved from §§8.21, 6.25, 6.22 and 14.3 there.

## F04 (P3) — applied

**Verified.** "ACC+" occurred once in the README (Scope) and nowhere in References or `sources.toml`. `FiniteModelDecomposedGenericPrime` is a `def` in AutomorphicGaloisRepresentationsPartII `Suggested.lean`, line 74 at its head.

**Changed.** "for the ACC+ predicate `FiniteModelDecomposedGenericPrime`" → "for the predicate `FiniteModelDecomposedGenericPrime`". No other occurrence of "ACC+" remains in the README or `Suggested.lean`.

## F05 (P3) — applied

**Verified.** `[Shin11]` occurs in the gap contract (from EndoscopicTransferAndUnitaryTraceComparison), in §10.2 and in References, and not in §11.5.

**Changed.** In `sources.toml`, `Shin11` `cited_for` changes from `[…, "11.5"]` to `["Exact supplier contracts: gap auxiliary-character-finite-avoidance", "10.2"]`.

**Same pattern elsewhere.** I recomputed `cited_for` against the README for the other keys and found no further mismatch:

- `Shin09`: contracts, 8.9, 10.2, 11.4.
- `Shin12`: 10.1.
- `Shin-BCU`: 10.4 and the gap.

## Checks

- **Elaboration.** `lake env lean packages/IgusaVarietiesAndTorsionConcentrationPartII/Suggested.lean`, run from the content checkout, exits 0. Its only output is `declaration uses 'sorry'` at lines 79 and 91. The file is unchanged this round: no headline changed, and no backticked name of this roadmap's own was added or removed.
- **Signatures.** I put `#check @name` for all four declarations in one scratch copy and elaborated it once (exit 0).
  - Every type keeps `[Field F] [NumberField F] [Field L] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}` and `r : Gal(L/F) →* GL (Fin n) k`.
  - Both theorems keep their existential hypotheses (`∃ p₀, IsCompletelySplitStrongGenericPrime r p₀` and `∃ v₀, IsStrongGenericAt r v₀`).
  - They agree with README §§8.7–8.8. Nothing changed.
- **Dependency check**, complete output:

  ```text
  depcheck: 245 roadmaps, 2258 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line. The new citations (ArithmeticLocallySymmetricSpaces ALS.0.4; AutomorphicSpectralTheory §§5.10, 5.12, 5.14) are to suppliers earlier in the merge order.
- **Citations.** `roadmaps resolve` finds no cross-roadmap citation and no Lean name that is found nowhere.
- **Sources.** No text was fetched, and `needs-references.toml` was not written. I read CS17 lines 4055–4111 for §5.6.
- **Ownership.** No target was added. The `ω∘ν` splitting is a route step that carries ALS.5b.4 to the quotients `S_K(ℂ)` are built from.
  - I searched the open heads and main for Matsushima's formula by object (`roadmaps grep -i matsushima`). ArithmeticLocallySymmetricSpaces ALS.5b.4 and AutomorphicSpectralTheory §5.14 state it for the maximal compact subgroup.
  - TorsionCohomologyInfrastructure §3b.2 states a Zucker/Matsushima decomposition only for `GU(n,n)` intersection cohomology.
  - No roadmap states it for the connected-compact variant of a compact Shimura variety.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| `e = [K_max:K_∞]` | `n=1`, `(1,0)`; Harris–Taylor `n=3`; `n=2`, `(1,1)` at the only `τ`; `[F⁺:ℚ]=2`, `(1,1)` and `(2,0)`; wholly definite | `e = 1, 1, 2, 1, 1`. In the fourth case `ν<0` would turn the definite `(2,0)` into `(0,2)`, so `e = 1`. | holds |
| Witness of `e = 2` | `GU(1,1)`, `w: e ↔ f`, `⟨e,e⟩=1`, `⟨f,f⟩=−1` | `⟨we,we⟩ = −1`, so `ν(w) = −1`; `w² = 1` | holds |
| Shapiro sum `H^*(K_∞;M) = ⊕_χ H^*(K_max;M⊗χ)` | `M = ℂ` for `GU(1,1)` | Left `H^*(ℙ¹)` has dimensions `(1,0,1)`. Right: `(1,0,0) + (0,0,1)` | holds |
| `f_EP = Σ_χ χ·f_max` | trivial `π`, `GU(1,1)` | `tr = ep_max(1) + ep_max(sgn) = 1 + 1 = 2 = ep_{K_∞}(1)` | holds |
| Splitting `s = sgnν(x)·ω_f(ν(g))` is `G(ℚ)`-invariant | `ω = ω_{ℚ(i)}`, `ν(γ) = −5` | `sgn(−5) = −1`. `ω_f(−5) = (−5,−1)_2·1 = −1` (both ≡ 3 mod 4, so `(−1)^{(−3)(−1)} = −1`; `5` splits). Product `+1`. | invariant; none |
| Reindexing keeps the central character on `A^0` | `t ∈ ℝ_{>0}` scalar | `ν(t) = t² > 0`, so `sgn ν(t) = 1` | holds |
| Elliptic elements have `ν > 0` (§10.2) | `GU(1,1)` diagonal torus in `{e,f}`; `w` | `ν(diag(a,b)) = |a|² = |b|² > 0`. `w` swaps the lines and lies in no elliptic torus. | holds; `χ = 1` on elliptic elements, so the factor `e` |
| Discrete series: `dim H^q = e` (Check) | `U(1,1)`, `ρ = (½,−½)`; `U(2,2)`, `ρ = (3/2,…,−3/2)`; `U(2,1)` | 2 parameters, swapped by `w`. `C(4,2) = 6` subsets in 3 complementary pairs, no fixed point. `U(2,1)` has `e = 1`. | `ep = e(−1)^q`; Check rewritten |
| `ep(1) = ∏ binom(n,p_τ)` (Examples) | `n=2`, `(1,1)`; HT `n=3`; `n=1`; wholly definite | `2 = χ(ℙ¹)`; `3 = χ(ℙ²)`; `1`; `1` | holds; matches the Check of §10.3 (`ep(1)=1` at `n=1`) |
| `q(G) = d` | `GU(1,1)` | `(dim G(ℝ) − dim K_∞ − dim A)/2 = (5−2−1)/2 = 1 = d` | holds |
| `c(π_f)` for discrete series | `ep = e(−1)^q` | `(−1)^q(εd)⁻¹Σm·e(−1)^q = e(εd)⁻¹Σm` | Examples updated |
| Negative control (Shimura curve) | trivial `π_f`; weight-two discrete series | per piece: `K_∞` gives 2 and `K_max` gives 1 (`1_f⊗sgnν` is not automorphic by real approximation). `H^1`: `2g` versus `g`. | Check added |
| §8.6(1) for `L_V` | `K′ = K`, `V` trivial; the reviewer's `K′_q`; `L_ξ/λ`; `d = 0` | first reduces to constant coefficients; `T_{i,v} ∉ 𝕋^{S∪{q}}`; `S′ = S∪{ℓ}` and `𝕋^{S′} = 𝕋^S`; pairing of stalks `V × V^∨ → 𝔽_ℓ` | holds; §8.9(2) unchanged |
| Scope variant sentence (F03) | `n = 2` in §9.1 against `2n = 2` in §8.22 there | both have `n⃗ = (1,1)` with coefficient `1/2` | consistent |
| `cited_for` (F05) | every key against README occurrences | `Shin11`: contracts and 10.2; the others match | holds |

## For the maintainer

- No Lean name changed, and `Suggested.lean` and `design/plan.json` are unchanged.
- The README now cites ArithmeticLocallySymmetricSpaces ALS.0.4 and AutomorphicSpectralTheory §§5.10, 5.12 and 5.14. If either roadmap renumbers these, this README must follow.
- `e = 2` occurs only in Case 1. In Case 2, `p_τ = q_τ` everywhere together with quasi-splitness at every finite place makes the hermitian space hyperbolic at every place, hence isotropic, which Case 2 excludes. So only Layer 10 sees the change.
- ArithmeticLocallySymmetricSpaces states its automorphic comparison (ALS.5b.4) only for the maximal-compact quotient, although its ALS.0.4 defines the connected-compact variant. A statement for `X̃_K` there would let this roadmap cite it directly instead of deriving it through the `ω∘ν` splitting.
- I found no suspicious instructions in the review or in the fetched supplier texts.
