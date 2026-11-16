<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17976#issuecomment-6907371502 -->
Red team round 1 pass b (claude) of 713ca6a

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The normalisation theorem is statable on the pinned cochain complexes

   - **Location.** `packages/HochschildHomologyAndHKR/Suggested.lean:59–63`: "the normalisation theorem
     over every `k` (§§2.1–2.2) … (the pinned `TauCeti.normalizedHochschildCochainComplex` has
     coefficients in a dual bimodule only)".
   - **Claim.** The headline is listed under "not statable at the pins".
   - **Witness.** `TauCeti/RingTheory/CyclicCohomology/Normalized/Basic.lean:300` at the pin:
     `normalizedHochschildCochainComplexι : normalizedHochschildCochainComplex R A M ⟶ hochschildCochainComplex R A M`.
     README §2.2 (lines 1036–1050) identifies both complexes with `N^•` and `C^•` of `A →ₗ[k] N`, and
     line 577 says the pin does not prove the comparison.
   - **Why it is a defect.** §3.4 and §8.4 are already stated on the pinned normalised chains, the
     `M = A` case of their README statements; the cochain half of the normalisation theorem has the same
     status (every carrier is pinned, the statement is a README target of §2.2, and it is not a
     one-tactic consequence of the library). The chain half stays not statable: the pin has no
     unnormalised chain complex.
   - **Repair.** Add the import `TauCeti.RingTheory.CyclicCohomology.Normalized.Basic`, and under a new
     `/-! ## Layer 2: Normalisation -/` section between Layers 1 and 3:

     ```lean
     /-- The normalisation theorem on Tau Ceti's Hochschild cochains (README §2.2): for a `k`-algebra
     `A` and a `k`-module `N`, the inclusion of the normalised cochains (those vanishing when an
     argument other than the zeroth is `1`) into the full complex is a quasi-isomorphism, over every
     commutative ring `k`. Under currying of the zeroth argument this is the inclusion
     `N^•(A, A →ₗ[k] N) → C^•(A, A →ₗ[k] N)` for the dual bimodule (Loday, *Cyclic homology*, §1.5). -/
     theorem quasiIso_normalizedHochschildCochainComplexι (k A N : Type u) [CommRing k] [Ring A]
         [Algebra k A] [AddCommGroup N] [Module k N] :
         QuasiIso (TauCeti.normalizedHochschildCochainComplexι k A N) := by
       sorry
     ```

     In the module docstring, add the bullet
     "`quasiIso_normalizedHochschildCochainComplexι` (§2.2): the inclusion of Tau Ceti's normalised
     cochains into its Hochschild cochain complex is a quasi-isomorphism, the case `M = A →ₗ[k] N` of
     the normalisation theorem" to "Stated here", and replace the second "not statable" bullet by:
     "the normalisation theorem for chains, and for cochains with coefficients in an arbitrary
     bimodule, as homotopy equivalences (§§2.1–2.2): the pins have no unnormalised Hochschild chain
     complex and no normalised complex with bimodule coefficients." In README §2.2, add after the
     last bullet: "On the pinned complexes the resulting statement, that
     `TauCeti.normalizedHochschildCochainComplexι k A N` is a quasi-isomorphism for every `k`-module
     `N`, is `quasiIso_normalizedHochschildCochainComplexι`."
   - **Tested on.** `A = k`, `N = k`: the pinned full complex is `k →0 k →1 k →0 ⋯` (README §1.2
     Checks after currying) and the normalised one is `k` in degree `0` and `0` above (a cochain with
     `φ(a₀, 1) = 0` is `0` on `k²`); the inclusion is a quasi-isomorphism, `H⁰ = k` on both sides.
     `A = k[x]`, `N = k`: the class of `φ(a₀,a₁) = (a₀ ∂a₁)(0)` of README §2.2 Checks is normalised and
     nonzero in both. The zero ring: both complexes are `0`.

2. **F02** (P3) The Lean cohomology is defined without commuting actions, and its docstring calls it the cohomology of a complex

   - **Location.** `packages/HochschildHomologyAndHKR/Suggested.lean:101–108`: "Hochschild cohomology
     `HHⁿ(A, M) = Zⁿ(A, M) / Bⁿ(A, M)` … the cohomology in degree `n` of the Hochschild cochain
     complex"; README line 240 makes `SMulCommClass A Aᵐᵒᵖ M` part of a bimodule.
   - **Claim.** The three definitions take `M` with `Module A M` and `Module Aᵐᵒᵖ M` only, a wider class
     than the README's bimodules, and there `δ ∘ δ ≠ 0`.
   - **Witness.** `A = M = Mat₂(ℤ)`, `a • m = a m`, `op b • m = bᵀ m` (a module over `Aᵐᵒᵖ`, not
     commuting with the left action): `δ(δm)(a,b) = (bᵀa − a bᵀ) m`, which is `(E₂₂ − E₁₁) m ≠ 0` at
     `a = b = E₁₂`, `m = 1`. So `B¹ ⊄ Z¹` and the Lean quotient is `Z¹/(B¹ ∩ Z¹)`.
   - **Repair.** No theorem is affected (each has `SMulCommClass` in scope or takes `M = A`). Replace
     the last sentence of the docstring of `hochschildBimoduleCohomology` by: "For commuting actions
     (`SMulCommClass A Aᵐᵒᵖ M`, part of the bimodule convention of the README) `Bⁿ ≤ Zⁿ` and this is
     the cohomology in degree `n` of the Hochschild cochain complex of README §1.2; without that
     hypothesis the definition is the quotient of `Zⁿ` by `Bⁿ ∩ Zⁿ` and is not used." In README §1.2,
     after "as the quotient `k`-module `Z^n(A,M)/B^n(A,M)`", add: "(in `Suggested.lean`, the quotient of
     `Z^n` by the preimage of `B^n`, which is `B^n` itself for a bimodule)", and add the witness above
     to §1.2 Checks as a negative control for the hypothesis `SMulCommClass A Aᵐᵒᵖ M`.

3. **F03** (P3) A homological theorem over a field is cited for the cohomological statement

   - **Location.** `packages/HochschildHomologyAndHKR/Suggested.lean:233–235`: "(… Theorem 5.2, for a
     regular affine algebra over a perfect field; Weibel, *An introduction to homological algebra*,
     Theorem 9.4.7)".
   - **Claim.** The citation reads as support for `⋀ⁿ_R Der_k(R) ≅ HHⁿ(R, R)`.
   - **Witness.** Weibel94 Theorem 9.4.7 is the homological statement `Ω^•_{R/k} ≅ H_•(R,R)` for a
     smooth algebra essentially of finite type over a field (Weibel94 is uncertified here: stated from
     the locator, not from the text); the README cites it at line 1850 for §6.4, the homological map.
   - **Repair.** Replace the parenthesis by: "(Hochschild–Kostant–Rosenberg, *Differential forms on
     regular affine algebras*, Theorem 5.2, for a regular affine algebra over a perfect field; the
     homological form over a field is Weibel, *An introduction to homological algebra*,
     Theorem 9.4.7)".

4. **F04** (P3) The determinant cochain is attributed to a section that does not define it

   - **Location.** `packages/HochschildHomologyAndHKR/Suggested.lean:184–185`: "The determinant cochain
     `⟨D₁, …, Dₙ⟩ : (r₁, …, rₙ) ↦ det (Dⱼ(rᵢ))` … (README §7.5; Ginzburg, *Lectures on noncommutative
     geometry*, §9.2)"; README lines 2028–2029 cite "Ginz05 §9.2, lines 2101–2156" for §7.5.
   - **Claim.** The source is cited for the cochain.
   - **Witness.** Ginz05 lines 2104–2113 name maps `κ` and `alt` without formulas; the only displayed
     maps are `alt` (Ginz05 line 2142) and `π` (Ginz05 line 2154). No determinant of derivations occurs
     in Ginz05 lines 2101–2166.
   - **Repair.** Docstring: "(README §7.5; it is `D₁ ∪ ⋯ ∪ Dₙ` evaluated on the alternation map of
     Ginzburg, *Lectures on noncommutative geometry*, §9.2)". README §7.5, replace "(Ginz05 §9.2,
     lines 2101–2156; HKR62 lines 509–521; AV20 lines 237–243)" by "(the cochain is `D₁ ∪ ⋯ ∪ D_n`
     composed with the alternation map of Ginz05 §9.2, line 2142; HKR62 lines 509–521 for the
     alternating forms `h*(a)(D₁,…,D_n)`; AV20 lines 237–243 for the factor `n!`)". Check on `k[x,y]`:
     `(∂_x ∪ ∂_y)(x ⊗ y − y ⊗ x) = 1 − 0 = 1 = ⟨∂_x, ∂_y⟩(x,y)`.

5. **F05** (P3) §5.2 defines the cohomology algebra and has no Checks

   - **Location.** `packages/HochschildHomologyAndHKR/README.md:1603–1615` (§5.2): "deduce an
     associative unital `k`-bilinear product on `HH^•(A,A) = ⊕_n HH^n(A,A)` making it a graded
     `k`-algebra".
   - **Claim.** A defined structure with two "Witnesses" bullets and no **Checks** block; every other
     section that defines an object has at least three.
   - **Witness.** Lines 1613–1615 are the whole test material of §5.2.
   - **Repair.** Add to §5.2:

     "**Checks.**

     - For `A = k`, `HH^•(k,k) = k` in degree zero (§1.2 Checks) and the product is the multiplication
       of `k`.
     - For `A = k[x]` with `k` nonzero, `HH^•` is `k[x]` in degree zero and `k[x]·[∂]` in degree one;
       `[∂] ∪ [∂] = 0` because `HH² = 0` (§8.4), although the cochain `∂ ∪ ∂` has value `1` at `(x,x)`.
     - `Z ∪ B ⊆ B` needs the first factor to be a cocycle: for a central `x` and `m ∈ A`,
       `x ∪ δm = δ(xm)`; for `A = Mat₂(k)` with `k` nonzero, `x = E₁₁` (not central) and `m = E₁₂`,
       `δ(x ∪ δm)(a,b) = (δx ∪ δm)(a,b) = (aE₁₁ − E₁₁a)(bE₁₂ − E₁₂b)`, which at `(a,b) = (E₂₁, E₁₁)` is
       `E₂₁E₁₂ = E₂₂ ≠ 0`, so `x ∪ δm` is not even a cocycle."

     Values: `E₂₁E₁₁ − E₁₁E₂₁ = E₂₁`, `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂`, `E₂₁E₁₂ = E₂₂`; and for central `x`,
     `(x ∪ δm)(a) = x(am − ma) = a(xm) − (xm)a`.

One P2 (a headline the module docstring calls not statable is statable on pinned carriers) and four
P3. No false statement, no unowned prerequisite, no supplier drift and no upward dependency was
found. This pass is read-only and ran no Lean: the Lean text proposed in R01 is not elaborated here,
and the comparison of signatures used the elaborated types of `scratch/signatures.md` (13
declarations), not a fresh `#check` run.

## The adversarial pass

### Declarations of `Suggested.lean` (13)

| Declaration (context) | Instances tried | Values computed | Result |
|---|---|---|---|
| `hochschildBimoduleCocycles` (`k A M : Type u`, no `SMulCommClass`) | `n = 0`, `M = A = Mat₂(k)`; `n = 1`, `k[x]` | `Z⁰ = {m : am = ma}` = scalars; `Z¹` = derivations, `∂_x ∈ Z¹`, `id ∉ Z¹` (`δ id(1,1) = 1`) | matches §1.2; wider input class, R02 |
| `hochschildBimoduleCoboundaries` | `n = 0`; `n = 1`, `Mat₂`; `A = M = k`, `n = 2` | `B⁰ = ⊥`; `δE₁₁(E₁₂) = −E₁₂`; `δ¹ = 1 − 1 + 1 = 1`, `B² = k` | matches |
| `hochschildBimoduleCohomology` (abbrev, quotient by `comap`) | `A = M = k`; non-commuting actions on `Mat₂(ℤ)` | `HH⁰ = k`, `HH¹ = 0/…`, `HH² = k/k = 0`; `δδm(E₁₂,E₁₂) = E₂₂ − E₁₁` | correct on bimodules; R02 |
| `homology_one_linearEquiv_kaehler` (`k R` commutative) | `R = k`; `R = k[x]`; `k = ℤ`, `R = 𝔽_p`; `ℚ[x]/(x²)`; zero ring | `0 ≅ 0`; `[1 ⊗ x²] = 2[x ⊗ x] ↦ 2x dx = d(x²)`; `N₁ = 𝔽_p ⊗ (𝔽_p/𝔽_p) = 0`, `Ω¹ = 0`; `HH₁ = R/(2x)` of dimension 1 `= Ω¹`; `0 = 0` | true; `b(r₀ ⊗ r₁) = r₀r₁ − r₁r₀ = 0`, so the required cycle exists |
| `nonempty_linearEquiv_ext` (`SMulCommClass`, `Module.Projective k A`) | `A = k = M = ℤ`, `n = 0, 1`; `A = Mat₂(k)`, `n = 0`; `k = ℤ`, `A = 𝔽_p` (excluded) | `HH⁰ = ℤ = Hom`, `HH¹ = 0 = Ext¹_ℤ(ℤ,ℤ)`; centre `k`; `HH²(𝔽_p,𝔽_p) = 0` while `Ext²_{𝔽_p ⊗ 𝔽_p}` is unaffected, the hypothesis only restricts | true |
| `cupProduct` (real body) | `(p,q) = (1,1)` on `k[x,y]`; `(0,0)` | `(∂_x ∪ ∂_y)(x,y) = 1`, `(∂_y ∪ ∂_x)(x,y) = 0`; product of `A` | first `p` arguments to `f` (`finSumFinEquiv`, `Fin.castAdd`) |
| `example` (cup product) | — | restates the convention by `simp` | a convention test, kept |
| `cupProduct_graded_comm` (`f ∈ Z^p`, `g ∈ Z^q`, target `B^{q+p}`) | `(0,0)`; `(1,1)` derivations of `k[x]`; `(0,1)`, `(1,0)` | `gf − fg = 0 ∈ ⊥` for central `f,g`; `2(∂ ∪ ∂) = −δ(∂²)`, `δ(∂²)(a,b) = −2∂a∂b`; `g(a)x − xg(a) = 0` for central `x`; `yf(a) − f(a)y = 0` | true; the reindexing `finCongr (add_comm p q)` puts both terms in `Fin (q+p)` |
| `cupDerivations` (real body) | `n = 0`; `n = 2` | constant `1`; `D₁(r₁)D₂(r₂)` | matches §7.5 |
| `detCochain` (real body) | `n = 0, 1, 2` on `k[x,y]` | `1`; `D`; `⟨∂_x,∂_y⟩(x,y) = 1`, `(y,x) = −1` | row `i` is `(D_j(r_i))_j`, as `pairingDual_ιMulti_ιMulti` |
| `example` (determinant) | — | restates the index convention | kept |
| `detCochain_sub_factorial_smul_cupDerivations_mem` | `n = 0, 1, 2`; `𝔽₂[x,y]` | `1 − 1 = 0 ∈ ⊥`; `D − D = 0`; `⟨D₁,D₂⟩ − 2 D₁∪D₂ = −(D₁∪D₂ + D₂∪D₁) = δ(D₁D₂)`; over `𝔽₂` `⟨∂_x,∂_y⟩ = δ(∂_x∂_y)` | true |
| `cohomological_hkr_hom_kaehler` (`Algebra.Smooth`, `Module.Projective`, symmetric `M`) | `n = 0`; `n = 1`; `R = k[x,y]`, `n = 2`, `f = ∂_x ∪ ∂_y`; `R = k` | `e[m](1) = m`; `e[D](dr) = D(r)`; `e[f](dx ∧ dy) = 1 − 0 = 1`; `0 ≅ 0` for `n ≥ 1` | true given the declared gap; the values on `dr₁ ∧ ⋯ ∧ dr_n` determine an `R`-linear map |
| `cohomological_hkr` | `n = 0`; `𝔽₂[x,y]`, `n = 2`; `k[x]`, `n = 2` | `r ↦ [r]`, `HH⁰ = R`; `Ψ(∂_x ∧ ∂_y) = [∂_x ∪ ∂_y] ≠ 0` (pairs to `1`); `⋀² = 0 = HH²`, `[∂ ∪ ∂] = 0` | true; composite with the previous map is `τ_n`, `det(D_j(r_i))` |
| `homological_hkr_mvPolynomial` (`k`, `m n : ℕ`) | `m = 0`; `n = 0`; `m = 1`, `n = 2`; `m = n = 2`, `k = 𝔽₂` | `Ω^n_{k/k} = 0 = N_n` for `n ≥ 1`; `r₀ ↦ [r₀]`; `1⊗X⊗X² − 1⊗X²⊗X = b(1⊗X⊗X⊗X)`, class `0 = ε(dX ∧ dX²)`; class of `1⊗X₁⊗X₂ − 1⊗X₂⊗X₁` nonzero | true; `Fin.cons r₀ (r ∘ σ)` puts the coefficient in slot `0` |

### README targets (37) and conventions

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Boundary convention, §1.1 | `A = M = k`; `Mat₂` | `b_n = Σ_{i≤n}(−1)^i`: `0, 1, 0, …`; `b(E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂` | holds |
| §1.2 coboundary | `δδm`; sign variant | `a(bm − mb) − (abm − mab) + (am − ma)b = 0`; variant `2(mab − amb) = 2E₁₂` at `(E₁₁,E₁₂,E₂₂)` | holds |
| §1.3 functoriality | `φ = id`; `A = k` | identity maps; `C_•(k,N) = N` | holds |
| §1.4 long exact sequences | `k = A = ℤ`, `0 → ℤ → ℤ → ℤ/p → 0` | `C_n = M` in every degree, exact | holds; flat/projective/split cases distinguished |
| §1.5 `R`-structure | `k[x]`, wrong action; `Mat₂` | `b(1 ⊗ x ⊗ 1) = x ⊗ 1` against `1 ⊗ x`; `E₁₁ − E₂₂` against `E₁₁` | holds |
| §2.1 normalised chains | `b(m ⊗ 1 ⊗ 1)`; `A = k`; `b(1 ⊗ x ⊗ x)` | `m ⊗ 1`; `N_n = 0`; `2x ⊗ x − 1 ⊗ x²` | holds; slot-0 identification agrees with `TauCeti.degenerateHochschildChains` (index `≠ 0`) |
| §2.2 normalised cochains | pinned `φ(a₀,a₁) = (a₀∂a₁)(0)` | `bφ = (a₀a₁∂a₂ − a₀∂(a₁a₂) + a₂a₀∂a₁)(0) = 0`; `ψ(ab) = a·ψ(b) + ψ(a)·b` | holds |
| §3.1 `HH₀` | `Mat₂(k)`, `Mat₀`, commutative | `E_{ij} = [E_{ij},E_{jj}]`, `E_{ii} − E_{jj} = [E_{ij},E_{ji}]`; `0`; `M` | holds |
| §3.2 `HH⁰` | `Mat₂`; commutative | scalars; `A` | holds |
| §3.3 `HH¹` | `k[x]`; `Mat₂`; `D(1)` | `k[x]·∂`; `δE₁₁(E₁₂) = −E₁₂ = −innerDerivation`; `D(1) = 2D(1)` | holds |
| §3.4 `HH₁ = Ω¹` | see Lean row | — | holds |
| §3.5 twisted extension | unit; `k[x]/(x²)`, `f(x,x) = 1`; non-cocycle | `δf(1,1,a) = f(1,a) − f(1,1)a`, unit `(1, −f(1,1))`; `t² = (0,1)`, `t³ = 0`; `δf(x,x,x) = 1` and the two bracketings differ by `(0,1)` | holds |
| §3.6 `HH²` | section `a ↦ (a,g(a))`; `k = ℤ`, `𝔽₂`; `HH²(k,M)` | algebra map iff `f = −δg`, then `g(1) = −f(1,1)`; `δ¹ = 1`, `HH² = 0`, `ℤ/4` not `ℤ`-split; `Z² = B² = M` | holds, both directions of (c), (d) |
| §4.1 enveloping algebra | `Mat₂` | `(E₁₂ ⊗ op E₂₁)·E₂₂ = E₁₁`, reverse order `0` | holds; agrees with `rid_tmul` (`op a • m`) |
| §4.2 bar resolution | `B₀`, `B₁`; `A = k`; `k[x]` | `b′h + hb′ = id` term by term; `k →0 k →1 k`; `h(x·(1⊗1)) = 1⊗x⊗1 ≠ x⊗1⊗1` | holds |
| §4.3, §4.4 cochains and Ext | `A = k = M = ℤ`, degree 1 | `Z¹ = 0`, `Ext¹ = 0`, term `C¹ = ℤ` | holds |
| §4.5 Tor | `ℚ[x]` over `ℤ`; `ℤ[x]/(px)` | Koszul `ℚ[x] →0 ℚ[x]`; `ann(x − y) = pℤ`, `ann(p) = (x,y)`, `Tor₂ = 𝔽_p`, `HH₂ = HH₂(𝔽_p[x],𝔽_p) = 0` | holds; flatness needed |
| §5.1 cup product | variant order on `Mat₂` | defect `E₁₁ − E₂₂` at `(E₂₁,E₁₂)`, `x = E₁₁`, `g = id` | holds |
| §5.2 Leibniz | `(1,1)` | `(a f(b) − f(ab) + f(a)b)g(c) − f(a)(b g(c) − g(bc) + g(b)c)` equals `δ(f ∪ g)` | holds; R05 |
| §5.3, §5.4 Yoneda | `q = 0`; `f̃_q ≫ g` | `(−1)^{pq} a₀ f(…) g(…) a_{p+q+1}` | holds up to the sign `s(p,q)` (see Not verifiable) |
| §6.1 dictionary | `n = 0, 1, 2`; `f(a,b) = a∂b` | `−1, +1, −1`; `δf(a,b,c) = ab∂c`, model `2a(∂b)c − ab∂c = 2` at `(1,x,1)` | internally consistent |
| §6.2 homotopy formula | `(1,1)` general `f, g`; `(0,1)`; `(1,0)` | right side `= g(a)f(b) + f(a)g(b)`; `g(a)x − xg(a)`; `yf(a) − f(a)y` (all twelve terms expanded) | holds; Ginz05 (6.6.3) does not |
| §6.3 chains | `A = k`; `𝔽_p` over `ℤ` | both complexes `k` with `0, 1` alternating; classical `HH₂ = 0`, derived `𝔽_p` | holds |
| §6.4 `ε^cl`, `π^cl` | `k[x,y]`; `k[x]/(x²)`; `𝔽_p` | `π₂ε₂ = 2`; `Ω² = 0`, `HH₂ ≠ 0` in every characteristic; both sides `0` | holds |
| §7.1 pairing | non-symmetric `k` over `k[x]` | `δm(x) = m ≠ 0`, transpose of `b₁ = 0` | holds |
| §7.2 bijectivity | `ℚ[x]/(x²)`, `M = ℚ` | `HH₁ = R/(2x)`, `HH₂ = xR`, `h₂ = 0` between two copies of `ℚ` | holds; hypotheses are those of the pinned theorem |
| §7.3 exterior powers | `R²`; `R^{(ℕ)}` | `det(I₂) = 1`, transpose `−1`; infinite-rank form | holds |
| §7.4 polyvector fields | `𝔽₂(u)[a]/(a² − u)` | `Der = R∂`, `T² = 0` | holds |
| §7.5 determinant cocycle | see Lean row; `n = 2` cocycle | `a f(b,c) − f(ab,c) + f(a,bc) − f(a,b)c = 0` for a biderivation | holds |
| §7.6 HKR | `ℤ[1/2]`; inseparable `R`; `𝔽₂[x,y]` | `C^n = ℤ[1/2]`, `HH^n = 0`, `Der = 0`; `HH² = R/(2a) = R`, `T² = 0`; `[⟨∂_x,∂_y⟩] = 2Ψ₂ = 0` | holds given the gap |
| §8.1 diagonal | `m = 0, 1`; `k[x]/(x²)` | empty sequence; nonzerodivisor; `t(x⊗1 + 1⊗x) = 0` | holds |
| §8.2 Koszul | `m = 1`; zero ring | exact; `rank_subsingleton` gives rank `1` | holds |
| §8.3 comparison | `j = 1, 2`; unsigned | `t₁(1⊗X₂⊗1) − t₂(1⊗X₁⊗1)`; defect `2(X₂⊗X₁⊗1 + 1⊗X₂⊗X₁ − 1⊗X₁X₂⊗1)` | holds |
| §8.4 polynomial algebras | see Lean row | — | holds |
| §8.5 Jacobian | `m = 2`, `(X₁², X₂)`; `m = 0` | `2X₁`; `2 ∈ HH⁰(ℤ,ℤ)` | holds |

## Verified sound

- **Declarations read:** 13 of 13 (6 definitions, 7 theorems), with the two proved `example`s. Each
  elaborated type in `scratch/signatures.md` was compared with its README statement: binders,
  instance arguments and universes agree (§§1.2, 3.4, 4.4, 5.1, 6.2, 7.5, 7.6, 8.4); no section
  variable is used, every binder is in the declaration's own signature. No `set_option`, `lemma`,
  `#eval`, `#print`, sorry'd data or `True` placeholder. Imports: `Mathlib` and two `TauCeti` modules,
  both used and both at the pin.
- **Targets read:** all 37 sections (§1.1–§8.5), the conventions, the supplier contracts and the
  worked examples. Checks tested: all 115 Check bullets (31 blocks) read, and every one with an
  explicit value recomputed except the first Check of §5.4 (the unsigned lift) and the last Check of
  §6.2 (the antisymmetrised identity), which were read only; none found false or vacuous.
- **Pinned declarations:** every backticked library name of the README (364 names besides this
  roadmap's own 13) was searched at the pins; all resolve. Read at the pin and compared with the README's description:
  `TauCeti.normalizedHochschildChains` with `tensor`, `b_tensor`, `chainComplexXIso`;
  `TauCeti.hochschildFace`; `TauCeti.ChainComplex.kronecker_bijective_of_projective_homology_lt`;
  `CategoryTheory.ProjectiveResolution.extLinearEquiv` (both vanishing hypotheses);
  `TauCeti.BalancedTensorProduct` (`lid`, `rid`, `outerFactors`, `finsuppScalarRight`, `liftEquiv`);
  `Module.Projective.tensorProduct`; `exteriorPower.pairingDual_ιMulti_ιMulti`;
  `Algebra.Smooth` and `Algebra.Smooth.flat`; `ModuleCat.Algebra.instLinear`;
  `instModuleTensorProductMop`; the `extMk` lemmas of `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`.
  `Module.Flat.instTensorProduct` is the automatically named instance of
  `Mathlib/RingTheory/Flat/Basic.lean:234`.
- **Sibling citations checked:** 17, all found where cited: DGAInfinity Layers 0, 1, 8 (main);
  DerivedModuleAlgebra §§0.K.1, 0.5 (main); IntegralIwasawaTheory §12.6 (main, line 1847, owner of
  `TauCeti.StarkSystems.toExteriorBidual`, a planned name, which is the one lead of the citation
  resolver); DerivedDeRhamCohomology Layer 2, NoncommutativeGeometry N1.Cyclic, BanachAlgebras
  Layer 6, ZigzagPreprojective Layer 7 (main); KTheoryFiniteLocalFields §4.0, RefinedTraceMethods
  §§1.1, 1.9, 1.10, EulerSystemsAndKolyvaginSystems §6.1, LanglandsParameterStacks §1.17 (open
  heads). RefinedTraceMethods §1.9 proves `π_n ε_n = n!` and the degree-one case only, so the gap
  `gap:smooth-hkr-antisymmetrisation` is precise, minimal and declared under the same slug in
  `design/plan.json` and in the README; it is not raised.
- **Ownership against open work:** searched by object (`roadmaps grep` for the bar resolution, `Ext`
  over the enveloping algebra, polyvector fields, the HKR theorem, and the Lean names) on main and
  at the open heads; no second owner. The closest open roadmap,
  CyclicHomologyLieHomologyAndQuasiFreeAlgebras, owns cyclic and Lie homology and quasi-free
  algebras and none of this roadmap's objects. No pinned file proves the normalisation comparison,
  the cup product or the `Ext` identification.
- **Locators verified:** 56: every line locator of Ginz05 (36 citations), HKR62 (16), AV20 (2) and
  the two StacksSmooth tags (00T2, 00TN). All support the claims as stated, except the attribution of R04.
- **Policy:** the pull request changes only `packages/HochschildHomologyAndHKR/`; no pull-request
  number or process narrative in the README or docstrings; every target has a locator.
- **Dependency check:**

      depcheck: 245 roadmaps, 2291 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.

Source independence: 62 passages compared with 4 sources (the 56 locators of Ginz05, HKR62, AV20 and StacksSmooth, and six further passages: the bimodule convention against Ginz05 lines 751–752, §3.6 against Ginz05 lines 1095–1106, §7.2 against HKR62 lines 301–330, §7.6 and the docstring of `cohomological_hkr` against HKR62 lines 548–557, §6.4 against AV20 lines 237–243), none shared beyond formulas and standard names; largest share Ginz05, 45 of 117 locators; contents compared with Ginz05: independent (the bar resolution is Layer 4 here, after the complexes, normalisation and low degrees, where Ginz05 puts it first; Layers 6 and 8 have no counterpart there, and Ginz05 §§7 and 10 onwards none here). The texts of Loday98, Weibel94, CE56, Ger63 and Mat86 could not be read (uncertified).

## Not verifiable

- The sign `s(p,q)` of §5.3 and the signs `ν_n` of §6.3: each is fixed by a convention (Mathlib's
  shift for `Abelian.Ext.comp`, DGAInfinity Layer 8's chain differential) that has no closed form at
  the pins or in the supplier's text; the README states them as unknown signs with one fixed value
  (`s(p,0) = 1`, `ν₀ = 1`), which is accurate and could not be sharpened here.
- The clauses of the DGAInfinity contract marked "Assumed" (the multiple brace, the brace relation,
  the arity-zero cochains): DGAInfinity Layers 0 and 8 on main name these objects without formulas,
  so the dictionary of §6.1 beyond the pinned arities was checked only for internal consistency.
- Locators into Loday98, Weibel94, CE56, Ger63 and Mat86 (47 mentions): uncertified, not read.
- Truth of the Lean statements as elaborated: no Lean was run in this pass.

## Source issues

- **Error** in Ginz05 at equation (6.6.3), printed page 29: the source says the graded commutator of the cup product is the coboundary of the composition minus two terms, with the sign on the last term given by the first degree; it should be `g ∪ f − (−1)^{pq} f ∪ g = δf ∘ g + (−1)^q (δ(f ∘ g) − f ∘ δg)` for the coboundary of its §5.2; affects the proof.
- **Misprint** in Ginz05 at §5.2, printed page 22 (line 1053): the source says the recalled chain differential has an unsigned middle sum; it should carry the sign `(−1)^j`, as in its §5.1; affects nothing.
- **Misprint** in Ginz05 at equation (6.6.2), printed page 29 (line 1363): the source says the inserted cochain takes the arguments numbered `i` to `i + q`; it should be `i` to `i + q − 1`; affects nothing.
- **Misprint** in Ginz05 at §3.1, printed page 9 (line 404): the source says the inner map of `m` goes from `M` to `M` and is a derivation of `M`; it should go from `A` to `M` and be a derivation of `A` into `M`; affects nothing.
- **Misprint** in Ginz05 at §5.2, printed page 22 (line 1038): the source says a bimodule is a left module over `A ⊗ Aᵉ`; it should be a left `Aᵉ`-module; affects nothing.
- **Misprint** in Ginz05 at §5.3, printed page 22 (line 1068): the source says the invariants form the centre of the module `A`; it should be the centre of the module `M`; affects nothing.
- **Gap** in Ginz05 at §9.3, after Lemma 9.3.1, printed page 46: the source says the ideal of the diagonal of a smooth variety is generated by a regular sequence; it should be said after localising `A ⊗ A` at points of the diagonal, where it holds; affects the proof.

## For the human reviewers

- **Scope.** The source with the largest share of locators, Ginz05 (45 of 117), is an arXiv lecture-notes preprint (`sources.toml`, arXiv math/0506603v1); the headline results are also cited to HKR62, Loday98 and Weibel94.
- **Not tested.** Loday98, Weibel94, CE56, Ger63 and Mat86 are uncertified (`sources.toml`): the wording and arrangement checks were made against Ginz05, HKR62, AV20 and StacksSmooth only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "713ca6ae2d718abb13f2fca1a1eb53a21cf18def", "job": "RT-HochschildHomologyAndHKR~1b", "model": "fable", "worker": "chris-x26"} -->
