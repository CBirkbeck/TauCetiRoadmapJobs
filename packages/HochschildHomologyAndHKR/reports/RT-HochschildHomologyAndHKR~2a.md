<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17976#issuecomment-6908165787 -->
Red team round 2 pass a (claude) of 7fa7abc

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §6.4(a): the route does not show that the antisymmetrised class factors through `Ω^n_{R/k}`, and for non-flat `R` no section or supplier does

   **Location.** `packages/HochschildHomologyAndHKR/README.md:1909–1912`: "Flatness enters only through
   the comparison with the derived chains: the antisymmetrised chain is a cycle (…) and
   `π^cl_n ∘ b = 0` by the Leibniz rule of `d`, for every commutative `R`"; `:1915–1919` (*Needs:*).

   **Claim.** `ε^cl_n : Ω^n_{R/k} → HH_n(R,R)` is well defined for every commutative `R`, flat or not,
   and the two listed facts are what makes it so. §7.5 ("Evaluation, for every commutative
   `k`-algebra `R`, flat or not", `:2103`), §8.4 and `homological_hkr_mvPolynomial` (arbitrary `r_i`,
   `Suggested.lean:286–299`) rest on it.

   **Witness.** Being a cycle gives a map `R ⊗ ⋀^n_k R → HH_n`; to descend to `⋀^n_R Ω¹` the class must
   be a derivation in each `r_i` modulo boundaries, which neither fact gives. The supplier's own route
   needs it ("a derivation in each slot", RefinedTraceMethods §1.9) and takes it from its §1.6, stated
   for `k`-flat algebras only.

   **The statement is true**; the missing step is a boundary identity. Computed for `n = 2`, in any
   commutative `R`: with `s = 1 ⊗ a ⊗ b ⊗ c − 1 ⊗ a ⊗ c ⊗ b + 1 ⊗ c ⊗ a ⊗ b`,

       b(s) = a ⊗ b ⊗ c − a ⊗ c ⊗ b + b ⊗ a ⊗ c − b ⊗ c ⊗ a − 1 ⊗ ab ⊗ c + 1 ⊗ c ⊗ ab,

   that is `a·A(b,c) + b·A(a,c) − A(ab,c)` for `A(u,v) = 1 ⊗ u ⊗ v − 1 ⊗ v ⊗ u` (the twelve terms of
   `b(1⊗a⊗b⊗c) − b(1⊗a⊗c⊗b) + b(1⊗c⊗a⊗b)`; `∓1 ⊗ a ⊗ bc`, `∓c ⊗ a ⊗ b`, `±1 ⊗ ac ⊗ b` cancel).

   **Repair.** In §6.4, replace the sentence "Flatness enters only through the comparison with the
   derived chains: … for every commutative `R`" by:

   > Flatness enters only through the comparison with the derived chains. For every commutative `R`:
   > the antisymmetrised chain is a cycle (the inner terms of `b` cancel in the pairs `σ, σ ∘ (i i+1)`
   > and the first term of `σ` cancels the last term of its cyclic shift); its class is a derivation in
   > each `r_i`, because for `a, b, r₂, …, r_n ∈ R` the signed sum `s` of the chains `r₀ ⊗ w` over the
   > orderings `w` of `(a, b, r₂, …, r_n)` in which `a` precedes `b` has boundary
   > `A(r₀a; b, r₂, …) + A(r₀b; a, r₂, …) − A(r₀; ab, r₂, …)`, where `A(r₀; r₁, …, r_n)` is the
   > antisymmetrised chain (the boundary is a derivation for the shuffle product of chains of a
   > commutative algebra, and `b(1 ⊗ r) = 0`); so the class is `R`-multilinear, alternating and a
   > derivation in each slot and factors through `⋀[R]^n Ω[R⁄k]`; and `π^cl_n ∘ b = 0` by the Leibniz
   > rule of `d`.

   and add to §6.4 Checks:

   > - The derivation property at `n = 2`, with no flatness: for
   >   `s = 1 ⊗ a ⊗ b ⊗ c − 1 ⊗ a ⊗ c ⊗ b + 1 ⊗ c ⊗ a ⊗ b`,
   >   `b(s) = a(1 ⊗ b ⊗ c − 1 ⊗ c ⊗ b) + b(1 ⊗ a ⊗ c − 1 ⊗ c ⊗ a) − (1 ⊗ ab ⊗ c − 1 ⊗ c ⊗ ab)`. For
   >   `k = ℤ`, `R = 𝔽₂[x,y]`, `a = b = x`, `c = y` this gives `[1 ⊗ x² ⊗ y − 1 ⊗ y ⊗ x²] = 2x[1 ⊗ x ⊗ y − 1 ⊗ y ⊗ x] = 0`,
   >   as `d(x²) = 0` requires. Dropping the middle term of `s` leaves `1 ⊗ a ⊗ bc − 1 ⊗ ac ⊗ b` in the
   >   boundary, so all three orderings are needed.

   A locator for the shuffle product, if one is wanted, is Loday98 §4.2 (uncertified; I state the
   locator from the book's table of contents and did not read the text); the manifest entry of
   Loday98 then gains "§4.2" and "§6.4" is already in its `cited_for`.

   **Tested on.** The instance above (`ℤ → 𝔽₂[x,y]`, not flat): the repaired route proves
   `ε^cl₂(d(x²) ∧ dy) = 0` without any comparison with derived chains; the original text gives no
   reason for it.

2. **F02** (P3) §§1.3 and 1.4 have no Checks, and the hypothesis "flat, or `k`-split" of §1.4 has no negative control

   **Location.** `README.md:890–899` (§1.3, the two induced maps) and `:901–934` (§1.4).

   **Claim.** §1.3 constructs the maps `C_•(A, φ*N) → C_•(B, N)` and `C^•(B, N) → C^•(A, φ*N)`; §1.4
   asserts short exactness of the complexes under "`A` flat, or `k`-split" (chains) and "`A`
   projective, or `k`-split" (cochains). Neither section has a **Checks** block.

   **Witness.** Every other section that constructs an object has at least three Checks (32 blocks,
   121 bullets); these two have none, and no Check elsewhere shows that the hypothesis of §1.4 is
   needed.

   **Repair.** Add to §1.3:

   > **Checks.**
   >
   > - For the structure map `φ : k → B`, the chain map is `n ↦ n ⊗ 1 ⊗ ⋯ ⊗ 1` in each degree and on
   >   `HH₀` it is the quotient `N → N/[B,N]`; for `B = N = Mat₂(k)` this is the trace `Mat₂(k) → k`.
   > - Multiplicativity of `φ` is needed: for nonzero `k` and the `k`-linear `φ : k[x] → k[x]` with
   >   `φ(1) = 1`, `φ(x) = x`, `φ(x^j) = 0` for `j ≥ 2`, and `N = k[x]`, the image of
   >   `b(1 ⊗ x ⊗ x) = 2x ⊗ x − 1 ⊗ x²` is `2x ⊗ x`, while `b(1 ⊗ φ(x) ⊗ φ(x)) = 2x ⊗ x − 1 ⊗ x²`; they
   >   differ by `1 ⊗ x² ≠ 0`.
   > - The cochain map goes backwards: for the quotient `φ : k[x] → k[x]/(x²)` the derivation `x∂_x`
   >   of `k[x]/(x²)` pulls back to the derivation `p ↦ x p′ mod x²` of `k[x]` into
   >   `φ*(k[x]/(x²))`. Every pulled-back cochain kills `ker φ = (x²)`; when `2 ≠ 0` in `k` the
   >   derivation `p ↦ p′ mod x²` of `k[x]` into the same bimodule is not one, as it sends `x²` to
   >   `2x ≠ 0`.

   and to §1.4:

   > **Checks.**
   >
   > - The hypothesis is needed for chains. For `k = ℤ` and `A = ℤ[ε]/(ε², 2ε) = ℤ ⊕ (ℤ/2)ε`, which is
   >   not flat, let `ℤ` be the bimodule on which `ε` acts by `0`. The sequence
   >   `0 → ℤ --2--> ℤ → ℤ/2 → 0` is exact and not `ℤ`-split, and `C₁(A,ℤ) = ℤ ⊗ A = ℤ ⊕ ℤ/2`; the map
   >   induced by `2` sends `1 ⊗ ε ≠ 0` to `1 ⊗ 2ε = 0`, so the sequence of complexes is not exact on
   >   the left in degree one.
   > - The hypothesis is needed for cochains, same example: the cochain `ε ↦ 1`, `1 ↦ 0` of
   >   `C¹(A, ℤ/2)` has no lift to `C¹(A, ℤ)`, a `ℤ`-linear map `A → ℤ` being `0` on the torsion
   >   element `ε`.
   > - A split sequence needs nothing of `A`: for `k = ℤ`, `A = 𝔽₂` and `0 → 𝔽₂ → 𝔽₂² → 𝔽₂ → 0`, every
   >   `C_n` and `C^n` of the three bimodules is `𝔽₂`, `𝔽₂²`, `𝔽₂` and the sequences are exact.

   **Tested on.** `ℤ[ε]/(ε², 2ε)`: `ℤ ⊗_ℤ (ℤ/2)ε = ℤ/2`, and `2 · (1 ⊗ ε) = 1 ⊗ 2ε = 0`.

One P2 and one P3, both in the README; no statement of `Suggested.lean` and no README target or
Check was found false. All nine findings of round 1 are repaired at this head and no repair
introduced an error. This pass is read-only and ran no Lean; signatures were compared on the
worker's elaborated types (14 declarations).

## Round 1 findings at this head

| Finding | Status | Witness at 7fa7abc |
|---|---|---|
| 1a/F01 (P2) §6.2 route used an unstated brace relation | repaired | `README.md:1827–1835`: "One route is Gerstenhaber's direct computation … This uses §§1.2 and 5.1 only"; `:1844` *Needs:* "§§1.2, 5.1, 5.2; Mathlib `finCongr`; for the comparison … only, §6.1 …"; `:702–703` "no relation between braces is consumed". Recomputed at `(p,q) = (1,1)`: `f∘δg + δf∘g − δ(f∘g) = g(a)f(b) + f(a)g(b)`; at `(1,0)`: both sides `y f(a) − f(a) y`. |
| 1a/F02 (P3) `s(0,q)` unpinned | repaired | `:1676` "with `s(p,0) = 1` and `s(0,q) = 1`"; Check at `:1708–1714`. Lift for central `x`: `f̃_q` then `g` gives `x g(a₁,…,a_q)`, sign `(−1)^{0·q} = 1`. |
| 1a/F03 (P3) process wording | repaired | `:2420` "No other roadmap imports this one."; a search of both files for "merge order", "pull request", "round", "repair" finds nothing. |
| 1a/F04 (P3) `R ⊗ R` versus `R ⊗ Rᵐᵒᵖ` | repaired | `:2216` "`t_i = X_i ⊗ 1 − 1 ⊗ op X_i` of `Rᵉ = R ⊗[k] Rᵐᵒᵖ`"; route `:2222–2230`; `AlgEquiv.toOpposite` and `Algebra.TensorProduct.congr` in *Needs:* (`:2234–2235`) and "From Mathlib" (`:366–368`). |
| 1b/F01 (P2) cochain normalisation statable | repaired (as a homotopy equivalence, stronger than proposed) | `Suggested.lean:129–134`; `README.md:1070–1076`. Tested: `A = N = k` gives full complex `k` with differentials `0,1,0,1,…`, normalised complex `k, 0, 0, …`, `H⁰ = k` on both; `A = 0`: `1 = 0`, every cochain of positive degree vanishes at an argument `0`, inclusion is the identity. Pin read: `normalizedHochschildCochains` is "`i ≠ 0 → a i = 1 → φ a = 0`" (`TauCeti/RingTheory/CyclicCohomology/Normalized/Basic.lean:41–43`), the cosimplicial normalisation of `C^•(A, A →ₗ[k] N)` after currying slot `0`. No pinned file proves it (no `HomotopyEquiv` or `QuasiIso` about this inclusion in `TauCeti/RingTheory/CyclicCohomology/` or `HochschildCohomology/`). |
| 1b/F02 (P3) cohomology defined without commuting actions | repaired | `Suggested.lean:108–113`; `README.md:841–843`, Check `:884–888`. Recomputed: `δ(δm)(a,b) = (bᵀa − abᵀ)m`, at `a = b = E₁₂`, `m = 1`: `E₂₁E₁₂ − E₁₂E₂₁ = E₂₂ − E₁₁`. |
| 1b/F03 (P3) Weibel 9.4.7 cited for the cohomological form | repaired | `Suggested.lean:261–262` "the homological form over a field is Weibel …". |
| 1b/F04 (P3) determinant cochain attributed to Ginz05 §9.2 | repaired | `Suggested.lean:211–212`; `README.md:2092–2096`. Ginz05 line 2142 is the alternation map; `det(D_j(r_i)) = (D₁ ∪ ⋯ ∪ D_n)(alt(r₁ ⊗ ⋯ ⊗ r_n))`, on `k[x,y]`: `1 − 0 = 1`. |
| 1b/F05 (P3) §5.2 without Checks | repaired | `:1654–1666`, three Checks. Recomputed: `(E₂₁E₁₁ − E₁₁E₂₁)(E₁₁E₁₂ − E₁₂E₁₁) = E₂₁E₁₂ = E₂₂`; `∂ ∪ ∂ = −δ(∂^{[2]})` on `k[x]`. |

## Suggested.lean: declarations, context and values

No `variable` or `include` line: every declaration carries its binders (compared with the
elaborated types of the worker's signature file; 0 binders lost).

| Declaration (line) | Context it needs, and where it is | Instances and values | Result |
|---|---|---|---|
| `hochschildBimoduleCocycles` (95) | `Module A M`, `Module Aᵐᵒᵖ M`, two towers; no `SMulCommClass` (docstring says so) | `A = M = k`, `n = 0`: `ker(0) = k`; `n = 1`: `ker(1) = 0` | as README §1.2 |
| `hochschildBimoduleCoboundaries` (102) | same | `n = 0`: `⊥`; `A = M = k`, `n = 2`: range of `1` is `k` | as README |
| `hochschildBimoduleCohomology` (114) | same | `A = M = k`: `k, 0, 0, …`; transposed action on `Mat₂(ℤ)`: `B¹ ⊄ Z¹` (`E₂₂ − E₁₁`) | docstring accurate |
| `exists_homotopyEquiv_normalizedHochschildCochainComplexι` (129) | `Algebra k A` supplies the tower and commutation the pin asks | `A = N = k`: `H⁰ = k = H⁰`; `A = 0`: identity; `A = k[x]`, `N = k`: `φ(a₀,a₁) = (a₀∂a₁)(0)` normalised cocycle | true; not at the pin |
| `homology_one_linearEquiv_kaehler` (145) | none beyond `CommRing R` | `R = k`: `0 ≅ 0`; `k = ℤ`, `R = 𝔽_p`: `N₁ = 𝔽_p ⊗ 0 = 0 = Ω¹`; `k[x]`: `[1 ⊗ x²] = 2[x ⊗ x]`, `d(x²) = 2x dx` | true; values on tensors determine `e` |
| `nonempty_linearEquiv_ext` (164) | `SMulCommClass A Aᵐᵒᵖ M`, `Module.Projective k A` present | `A = k = M = ℤ`: `HH¹ = 0 = Ext¹`; `n = 0`: `M^A = Hom_{Aᵉ}(A,M)` | true |
| `cupProduct` (177) and its `example` | — | `(∂_x ∪ ∂_y)(x,y) = 1`, `(∂_y ∪ ∂_x)(x,y) = 0` | first `p` arguments to `f` |
| `cupProduct_graded_comm` (194) | `A` over itself by `Semiring.toOppositeModule`; commutation holds | `p = q = 0`: `gf − fg = 0 ∈ ⊥` for central `f, g`; `(1,1)`, `∂` on `k[x]`: `2 ∂ ∪ ∂ = −δ(∂²)`; `(0,1)`: `g(a)x − x g(a) = 0` for central `x` | true |
| `cupDerivations` (206) | — | `n = 0`: constant `1` | as §7.5 |
| `detCochain` (213) and its `example` | — | `⟨∂_x,∂_y⟩(x,y) = 1`, `(y,x) = −1`; `n = 0`: `1` | row `i`, column `j` |
| `detCochain_sub_factorial_smul_cupDerivations_mem` (232) | none (every commutative `R`) | `n = 0`: `1 − 1 = 0 ∈ ⊥`; `n = 1`: `0`; `n = 2`: `det − 2·cup = −(D₁aD₂b + D₂aD₁b) = δ(D₁D₂)(a,b)` | true |
| `cohomological_hkr_hom_kaehler` (246) | `Algebra.Smooth`, `Module.Projective k R`, symmetric `M` all present | `n = 0`: `e[m](1) = m`; `ℤ → ℤ[1/2]` (excluded by projectivity): both sides `0` for `n ≥ 1`; `k[x]/(x²)` over `ℚ` (excluded by smoothness): `h₂ = 0` on `ℚ → ℚ` | true; values on `dr₁ ∧ ⋯ ∧ dr_n` determine `e` |
| `cohomological_hkr` (263) | same | `𝔽₂[x,y]`, `n = 2`: `Ψ(∂_x ∧ ∂_y)` pairs to `1` with `1⊗x⊗y − 1⊗y⊗x`; `D ∧ D ↦ [D ∪ D]`, which pairs to `det` with two equal columns, `0` | true; strict alternation comes from (1), not from graded commutativity |
| `homological_hkr_mvPolynomial` (283) | none | `m = 0`: `k ≅ k`, `0` above; `m = 1`, `n = 2`: `1⊗X⊗X² − 1⊗X²⊗X = b(1⊗X⊗X⊗X)`; `m = n = 2`, `𝔽₂`: class nonzero though `π ε = 2 = 0` | true; needs S01's step for general `r_i` |

## README targets: values computed

| Target | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions: right `Aᵉ`-structure | product of two elements | `m·((a⊗op b)(a′⊗op b′)) = b′b m aa′ = (m·(a⊗op b))·(a′⊗op b′)` | right module |
| §1.1 | `A = M = k`; `Mat₂` | `b_n = Σ_{i≤n}(−1)^i`: `0,1,0,1`; `b(E₁₂⊗E₂₁) = E₁₁ − E₂₂` | holds |
| §1.2 | `A = M = k`; sign variant | `δ^n = Σ_{i≤n+1}(−1)^i`; variant `δδm = 2(mab − amb) = 2E₁₂` | holds |
| §1.3 | none in README | S02 | Checks missing |
| §1.4 | `ℤ[ε]/(ε²,2ε)` | `2·(1⊗ε) = 0`, `1⊗ε ≠ 0` | hypothesis needed; S02 |
| §1.5 | first-factor action; `Mat₂` | `x⊗1 − 1⊗x ≠ 0`; `E₁₁ − E₂₂` versus `E₁₁` | holds |
| §2.1 | `m⊗1`; `k[x]`; pinned faces | `b(m⊗1⊗1) = m⊗1`; `b(1⊗x⊗x) = 2x⊗x − 1⊗x²`; face `0` is `a₀a₁`, last is `a_{n+1}a₀` | holds |
| §2.2 | currying | `δψ(a₁,…)(x) = φ(xa₁,…) + Σ(−1)^iφ(x,…a_ia_{i+1}…) + (−1)^{n+1}φ(a_{n+1}x,…) = bφ` | holds |
| §3.1 | `Mat_n`, `n ≥ 1`, `n = 0` | `E_ij = [E_ij,E_jj]`, `E_ii − E_jj = [E_ij,E_ji]`; `Mat₀ = 0` | holds |
| §3.2 | `Mat₂` | `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂` | holds |
| §3.3 | `Mat₂`; sign | `δE₁₁(E₁₂) = −E₁₂ = −innerDerivation E₁₁ (E₁₂)` | holds |
| §3.4 | `k[x]/(x²)` over `𝔽₂`, `ℚ`; `𝔽_p/ℤ` | dimensions `2`, `1`; `b₂ = 1` onto | holds |
| §3.5 | associativity; unit; `g`-twist; `k[t]/(t³)` | defect `= −δf(a,a′,a″)`; `f(1,a) = f(1,1)a`; product in `f − δg` gains `g(aa′)`; cocycle at the four triples with `x`: `0` | holds |
| §3.6 | `𝔽₂/ℤ`; commutativity | `δ¹ = 1`, `HH² = 0`; commutator `(0, f(a,b) − f(b,a))`; `ι(m)ι(m′) = ι(π(ι m) m′) = 0` | holds |
| §4.1 | `Mat₂` | `E₁₂E₂₂E₂₁ = E₁₁`, `E₂₁E₂₂E₁₂ = 0` | holds |
| §4.2 | `B₀`, `B₁`; `A = k` | `(hμ + b′h)(a₁⊗a₂) = a₁⊗a₂`; `b′_n = Σ_{i≤n}(−1)^i` | holds |
| §4.3 | generic | `φ ∘ b′` at `1⊗a₁⊗⋯⊗a_{n+1}⊗1` is `δf`, no sign | holds |
| §4.4 | `ℤ` | `δ¹ = 1`, `Z¹ = 0` | holds |
| §4.5 | balancing; `ℤ[x]/(px)`; swap | `a_{n+1}bmaa₀` both ways; `ann(x−y) = pℤ`, `ann(p) = (x,y)`, `Tor₂ = 𝔽_p`, `HH₂ = 0`; `τ(bx⊗op(ya)) = (y⊗op x)(a⊗op b)` | holds |
| §5.1, §5.2 | `Mat₂`, `k[x]` | defect `E₁₁ − E₂₂`; `E₂₂`; `(∂∪∂)(x,x) = 1`, class `0` | holds |
| §5.3, §5.4 | `p = 1` lift; `p = 0`; `q = 0` | `b′f̃_{i+1} = f̃_i b′` with `(−1)^{pi}`; `f̃_q` then `g` is `(−1)^{pq} f∪g` | holds; `s(p,q)`, `p,q ≥ 1`, not computed |
| §6.1 | `n = 0, 1, 2`; degree count | `−1, +1, −1`; degree `−1 − (−ℓ) = n − 1` forces `ℓ = n`; model without `(−1)^q` gives `2` at `(1,x,1)` | holds at the pin |
| §6.2 | `(1,1)`, `(1,0)`, antisymmetrisation | above; `δ{f,g} = {f,δg} + {δf,g}` at `(1,1)`, the stated `−(−1)^q` | holds |
| §6.3 | `𝔽_p/ℤ` | classical `HH₂ = 0`, derived `𝔽_p` | holds; `ν_n` not testable |
| §6.4 | cycle; `n = 2` derivation | `sgn σ[1 + (−1)^n(−1)^{n−1}] = 0`; S01's identity | (a) true, route incomplete: S01 |
| §7.1 | generic; non-symmetric `k` | `F_f(b(r₀⊗⋯)) = r₀ δf(r₁,…)` uses `m r = r m`; `δm(x) = m` | holds |
| §7.2 | `ℚ[x]/(x²)`, `𝔽₂[x]/(x²)`; general | `HH₁ = R/(x)`, `HH₂ = xR`, `h₂ = 0` on `ℚ → ℚ`; `X_n/B_n ≅ H_n ⊕ B_{n−1}` when `H_j` projective for `j < n` | holds |
| §7.3 | `R²`; `R^{(ℕ)}` | `det I₂ = 1`, transpose `−1`; decomposables have rank `≤ 2` | holds |
| §7.4 | `k[x,y]`; inseparable | `τ₂(∂_x∧∂_y)(dx∧dy) = 1`; `D(a² − u) = 2aD(a) = 0`, `T² = ⋀²R = 0` | holds |
| §7.5 | `n = 2` cocycle; class identity | `δf = af(b,c) − af(b,c) − bf(a,c) + bf(a,c) + cf(a,b) − f(a,b)c = 0`; permutation classes need only distinct-slot anticommutation | holds |
| §7.6 | `𝔽₂[x,y]`; `ℤ[1/2]`; inseparable | `[⟨∂_x,∂_y⟩] = 2Ψ₂ = 0`; `C^n = ℤ[1/2]`, `HH^{≥1} = 0 = T^{≥1}`; `HH² = R/(2a) = R`, `T² = 0` | holds |
| §8.1 | `m = 0, 1`; `k[x]/(x²)` | `Rᵉ = k`; `t(x⊗1 + 1⊗x) = 0` | holds |
| §8.2 | `k = 0` | `Module.rank = 1` over the zero ring (`rank_subsingleton`, `Mathlib/LinearAlgebra/Dimension/Basic.lean:168`) | holds |
| §8.3 | `j = 1, 2`; unsigned | `b′ι(e₁∧e₂) = t₁·(1⊗X₂⊗1) − t₂·(1⊗X₁⊗1)`; defect `2(X₂⊗X₁⊗1 + 1⊗X₂⊗X₁ − 1⊗X₁X₂⊗1)` | holds |
| §8.4 | duality; alternation | `h_n[∂_I∪](ε(dX_J)) = δ_{IJ}`; `[D∪D]` pairs to `0` with every basis class | holds |
| §8.5 | `m = 2`, `m = 0` | `det = 2X₁`; empty determinant `1`, class `g` | holds |

## Verified sound

- **Declarations read: 14** (3 definitions of Layer 1, `cupProduct`, `cupDerivations`,
  `detCochain`, 8 theorems) and the 2 proved `example`s, each against its elaborated type and its
  README statement; generality agrees in both directions; every Lean name is in the README and the
  README's own backticked names (14) are all declared. No `set_option`, `lemma`, `#eval`, sorry'd
  data or placeholder; imports are `Mathlib` and three `TauCeti` modules, all at the pin and used.
- **Targets read: 37** (§§1.1–8.5) with the conventions, scope, contracts and worked examples.
- **Checks tested: 121** bullets in 32 blocks read; about 100 recomputed (values in the tables);
  none false or vacuous.
- **Headlines.** The end theorems of the summary (the two forms of the cohomological HKR theorem,
  the factor `n!`, the polynomial case in homology) and `HH^n ≅ Ext^n`, `HH₁ ≅ Ω¹`, graded
  commutativity and the pinned cochain normalisation are stated; the four not statable are named in
  the module docstring with the missing carrier. One-tactic probe: no theorem follows from one
  library lemma (the nearest pinned statements are `exteriorPower.bijective_pairingDual`, free
  modules only, and `TauCeti.hochschildBimoduleCoboundary_ofSubsingleton_eq_zero_iff`, degree one).
  No padding found.
- **Pinned declarations opened this round: 26**, among them
  `ModuleCat.projective_of_categoryTheory_projective` (from `Module.Projective`, as the README
  says), `rank_subsingleton`, `Module.Flat.of_retract`, `exteriorPower.bijective_pairingDual`
  (`Module.Free`, `Module.Finite`), `Module.Basis.exteriorPower`, `exteriorPower.instFree`,
  `Algebra.Smooth.flat` (`Mathlib/RingTheory/Smooth/Flat.lean:57`), the
  `Module.FinitePresentation S Ω[S⁄R]` instance, `Module.dual_finite`, `Module.dual_projective`,
  `Module.evalEquiv`, `ComplexShape.embeddingDownNat`, `Functor.leftDerivedZeroIsoSelf`,
  `HomologicalComplex.HomologySequence.δ_naturality`, `LinearEquiv.isWeaklyRegular_congr'`,
  `MvPolynomial.span_X_image_eq_ker_aeval_ite_mem`, `TensorPower.algebraMap₀`,
  `TauCeti.normalizedHochschildCochains`, `TauCeti.normalizedHochschildCochainComplexι`. The
  remaining names rest on the worker's resolver (one lead, below) and on round 1.
- **Sibling citations checked: 15**, on main or at the open heads: DGAInfinity Layers 0, 1, 8;
  DerivedModuleAlgebra §§0.K.1, 0.5; IntegralIwasawaTheory §12.6 (owner of the planned name
  `TauCeti.StarkSystems.toExteriorBidual`, the resolver's one lead: a roadmap target, correctly
  cited); EulerSystemsAndKolyvaginSystems §6.1 ("an isomorphism for finite projective X");
  KTheoryFiniteLocalFields §4.0; RefinedTraceMethods §§1.1, 1.6, 1.9, 1.10; LanglandsParameterStacks
  §1.17; NoncommutativeGeometry N1.Cyclic; BanachAlgebras Layer 6; ZigzagPreprojective Layer 7;
  DerivedDeRhamCohomology Layer 2. RefinedTraceMethods §1.9 at its head still proves only
  `π_n ε_n = n!` and the degree-one case: `gap:smooth-hkr-antisymmetrisation` asks for nothing
  already provided, has the same slug and sentence in `design/plan.json` and in the README, and is
  not raised.
- **Ownership against open work.** Searched by object, on main and at the open heads, for the
  shuffle product on Hochschild chains, Hochschild cohomology with bimodule coefficients, `Ext` and
  `Tor` over the enveloping algebra and square-zero extensions. No second owner.
  CyclicHomologyLieHomologyAndQuasiFreeAlgebras (the closest open roadmap) characterises quasi-free
  algebras by `Ext²_{Aᵉ}(A, M) = 0` stated directly in `ModuleCat (A ⊗[k] Aᵐᵒᵖ)` and owns none of
  this roadmap's objects; it is not cited here. No `Suggested.lean` declaration has the fully
  qualified name of a declaration of another roadmap.
- **Locators re-read: 18** (Ginz05 lines 96–97, 1379, 2086, 2142, 2142–2156, 2161–2166, 2187,
  2193–2196; HKR62 lines 210, 268–279, 301, 495, 509–521, 522, 528–546, 548; AV20 lines 70,
  237–243); all support the claims as stated, including HKR62's standing `K`-projectivity
  (HKR62 line 523). The other locators of the three texts and the two Stacks tags rest on round 1.
- **Policy.** The pull request changes only `packages/HochschildHomologyAndHKR/`; no pull-request
  number, process narrative, machine path or algorithm in the README or docstrings; every target
  has a locator.
- **Dependency check output:**

      depcheck: 250 roadmaps, 2367 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.

Source independence: 23 passages compared with 3 sources (the 18 locators above and five further passages: the route of §6.4 against Ginz05 lines 2147–2150 and AV20 lines 237–243, the route of §7.6 against HKR62 lines 527–535, the docstring of `cohomological_hkr` against HKR62 lines 548–557, §8.2 against HKR62 lines 268–279, §1.5 against Ginz05 lines 2160–2166), none shared beyond formulas and standard names; largest share Ginz05, 45 of 117 locators; contents compared with Ginz05 (its sections 3, 4, 5, 6, 8, 9 against Layers 1–8): independent, the roadmap building the complexes simplicially and normalising before the low degrees, placing `Ext` and `Tor` after them, and Layers 6 and 8 and §§4.5, 7.2, 7.3 having no counterpart there. StacksSmooth was not reopened this round; Loday98, Weibel94, CE56, Ger63 and Mat86 could not be read.

## Not verifiable

- Locators into Loday98, Weibel94, CE56, Ger63 and Mat86 (uncertified): not read; this includes the
  locator Loday98 §4.2 offered in S01.
- The sign `s(p,q)` of §5.3 for `p, q ≥ 1` and the signs `ν_n` of §6.3: fixed by Mathlib's shift
  conventions and by DGAInfinity Layer 8's chain differential, neither of which has a formula to
  test against.
- The clauses of the DGAInfinity contract marked "Assumed" (arity-zero cochains, the multiple
  brace, the termwise form of the chain differential): DGAInfinity on main names these objects
  without formulas; only §§6.1 and 6.3 use them and no later section does.
- That `Suggested.lean` elaborates, and that its two `example`s close: no Lean was run; I relied on
  the worker's elaborated signatures and on the repair report's elaboration record.

## Source issues

- none (the errata of Ginz05 found in round 1 were re-encountered and are already reported there)

## For the human reviewers

- **Scope.** The source with the largest share of locators, Ginz05 (45 of 117; `sources.toml`,
  arXiv math/0506603v1), is an unrefereed set of lecture notes; the headline results are also cited
  to HKR62, Loday98 and Weibel94.
- **Not tested.** Loday98, Weibel94, CE56, Ger63 and Mat86 (47 locators) are uncertified: wording
  and locators were not compared with their texts.
- **Licence.** None open: the three texts read are HKR62 (recorded `publisher-open`, fetched from
  the AMS journal archive) and two arXiv preprints (recorded `open-repository`) in `sources.toml`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7fa7abc2cca733426ec38b04b6288ef9cd3c9340", "job": "RT-HochschildHomologyAndHKR~2a", "model": "fable", "worker": "chris-x26"} -->
