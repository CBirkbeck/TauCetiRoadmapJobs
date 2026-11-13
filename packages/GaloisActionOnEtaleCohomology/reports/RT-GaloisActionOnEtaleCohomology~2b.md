<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13862#issuecomment-6851416046 -->
Red team round 2 pass b (claude) of 86878fa

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §1.1 "Base change of the cover" assumes a fibre product that need not exist

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md:200`: "**Base change of the cover.** For `g : X′ → X` with `Y′ := Y ×_X X′` and `a′ := a × id`, `a′^♮ ∘ g_Y^* = g_Y^* ∘ a^♮`".

   **Claim.** In each setting (a)–(c) of §1.1, for every morphism `g : X′ → X` and every `p : Y → X`, the fibre product `Y ×_X X′` exists in the setting and the identity holds.

   **Witness.** Settings (a), (b) are all locally strongly sheafy (resp. locally noetherian) analytic adic spaces, with `p` and `g` arbitrary. AdicSpacesPartII §R0.7 (on main) opens: "Fibre products of adic spaces do not exist in general", and *fibre-products-existence* gives them only under Huber's two hypotheses. §1.1's Needs line (README:214) names no fibre-product supplier.

   **Values.** `X = Spa(K, 𝒪_K)`, `Y = X′ = Spa(C, 𝒪_C)`: neither map is locally of finite type, so no supplier gives `Y ×_X X′`, and nothing guarantees it is locally strongly sheafy; the bullet is not a statement there. The only use, §1.3 (a) (`Y = X_C`, `g` a morphism of rigid `K`-spaces), has `Y′ = X′_C`, which exists by §R0.7 case (a).

   **Repair.** Replace the bullet at README:200 by:

   > - **Base change of the cover.** Let `g : X′ → X` be a morphism in the same setting such that the fibre product `Y′ := Y ×_X X′` exists and lies in the setting (always in setting (c); in settings (a) and (b) under the hypotheses of AdicSpacesPartII §R0.7, *fibre-products-existence*, with `Y′` again locally strongly sheafy, resp. locally noetherian; in particular for `Y = X_C` and `g` a morphism of rigid `K`-spaces, where `Y′ = X′_C`). With `a′ := a × id`, `a′^♮ ∘ g_Y^* = g_Y^* ∘ a^♮` on `H^i(Y, p^{-1}M) → H^i(Y′, p′^{-1} g^{-1} M)`.

   and add "AdicSpacesPartII §R0.7 (*fibre-products-existence*)" to the Needs line at README:214. Tested: on `Spa(C) ×_{Spa(K)} Spa(C)` the repaired bullet asserts nothing; on §1.3 (a) it applies (`X′_C` exists, rigid over `C`, locally noetherian), and for `X′ = Spa(L, 𝒪_L) → X = Spa(K, 𝒪_K)`, `M = ℤ`, it gives the diagonal `ℤ → ℤ^{Hom_K(L, C)}`, which commutes with the permutation `e_τ ↦ e_{σ∘τ}`.

2. **F02** (P3) §2.5, scheme side: the profinite Hochschild–Serre sequence already on main is listed in Needs but neither used nor compared

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md:353–357` and Needs at README:367 ("`hochschildSerre_galois_covering`"). README:357: "For rigid `X`, prove that this spectral sequence agrees from `E_2` on with the spectral sequence of ClassicalAdicEtaleCohomology §1.3 (b)".

   **Claim.** For a qcqs `k`-scheme, the spectral sequence `H^p_cont(G_k, H^q(X_{k^sep}, ℱ)) ⇒ H^{p+q}(X, ℱ)` is obtained here from Leray; the comparison with the supplier's torsor sequence is made for rigid `X` only.

   **Witness.** SchemeAndStackFoundations §2.15 (main, `README.md:4926–4928`): `hochschildSerre_galois_covering` gives `H^p(G, H^q(Y, F)) ⇒ H^{p+q}(X, F)` "and for a profinite Galois covering the continuous version". For `Y = X_{k^sep} → X` that is the same spectral sequence, with an unspecified module structure.

   **Repair.** Append to the paragraph at README:357:

   > For a scheme `X`, prove likewise that this spectral sequence agrees from `E_2` on with the continuous case of SchemeAndStackFoundations §2.15 (`hochschildSerre_galois_covering`) for the profinite Galois covering `X_{k^sep} = lim_L X_L → X` with group `Gal(k^sep/k) ≅ G_k` (restriction, Conventions), under `colim_L H^q(X_L, ℱ) ≅ H^q(X_{k^sep}, ℱ)` of §2.2; in particular the `G_k`-module structure on `H^q(X_{k^sep}, ℱ)` used there is `ρ`.

   Tested on `X = Spec k′`, `k′/k` finite separable, `ℱ = ℤ/n`: both sequences have `E_2^{p,q} = 0` for `q > 0` and `E_2^{p,0} = H^p(G_k, (ℤ/n)[G_k/G_{k′}]) = H^p(G_{k′}, ℤ/n)` (Shapiro), the abutment `H^p(Spec k′, ℤ/n)`.

3. **F03** (P3) Mathlib contract says `IsAlgClosed.of_exists_root` is used for the density of `K^sep`; no target uses it

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md:66`: "`IsAlgClosed.of_exists_root` and the continuity of roots `Polynomial.exists_roots_norm_sub_lt_of_norm_coeff_sub_lt` (…) are used for the density of `K^sep`."

   **Witness.** The density argument (README:128) uses only the continuity of roots, applied to `X^{p^e} − b` and `X^{p^e} − tX − b`; the Needs line (README:139) does not list `IsAlgClosed.of_exists_root`; algebraic closedness of `C` is imported from PadicDifferentialEquationsAndRigidCohomology §RD.0.33 (README:129). The name occurs at README:66 only.

   **Repair.** Replace the sentence by: "The continuity of roots `Polynomial.exists_roots_norm_sub_lt_of_norm_coeff_sub_lt` (`Mathlib/Analysis/Normed/Field/Approximation.lean`, line 52: monic polynomials of equal degree with close coefficients, the second split) is used for the density of `K^sep`." Tested against the pin: line 52 has hypotheses `f.eval a = 0`, `f.Monic`, `g.Monic`, `g.natDegree = f.natDegree`, close coefficients, `g.Splits`; with `f = X^{p^e} − b`, `a` its root, `g = X^{p^e} − tX − b` over `K̄` all hold.

4. **F04** (P3) Scope does not say that the supplier's §9.7 equivariance is for the stalk-transported action, which §2.3 identifies with `ρ`

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md:42`: "AInfCohomology §AI.3.1 asserts the `G_K`-equivariance of its constant-coefficient de Rham comparison … without constructing the action; that action is `ρ` of §1.2"; contract at README:99.

   **Claim.** The earlier roadmaps that speak of a Galois action on `H^i(X_C, −)` are accounted for, so the action has one owner.

   **Witness.** ClassicalAdicEtaleCohomology §9.7 (earlier in the order, a supplier here): "a `G_K`-equivariant map `t_X:H^{2d}_et(X_C,ℤ/n(d))→ℤ/n` … The field-point stalk comparison transports the continuous Galois action", and its pairings are stated `G_K`-equivariant. README:99 omits this; README:330 handles it only inside a Check.

   **Repair.** Append to the paragraph at README:42:

   > ClassicalAdicEtaleCohomology §9.7 states the `G_K`-equivariance of its trace `t_X` and of its duality pairings for the action on `H^i(X_C, −)` transported from the stalk at `ξ_C` of `R^i f_*` under the equivalence of its §1.1; by §2.3 that transported action is `ρ`, and this roadmap consumes from §9.7 only the morphism of sheaves `R^{2d} f_* ℤ/n(d) → ℤ/n`, not the equivariance.

   Tested on `X = ℙ¹_K`: `R²f_*μ_n` is the constant sheaf `ℤ/n` (generated by `c₁(𝒪(1))`, defined over `K`), stalk action trivial; `ρ` is trivial on `H²(X_C, μ_n)` (Layer 1, Examples); `t_X(c₁(𝒪(1))) = 1` is invariant for both descriptions.

One P2 and three P3 findings (S01–S04). All seven round-1 findings are repaired at this head and no repair introduced an error. No statement of `Suggested.lean` and no Check was found false.

## Round-1 findings at this head

| Round-1 id | Status | Witness at 86878fa |
|---|---|---|
| 1a/F01 and 1b/F01 (§4.4: "properness is used in every case"; case (d) too narrow) | repaired | `packages/GaloisActionOnEtaleCohomology/README.md:532`: "(d) `X` quasi-compact quasi-separated and `ℓ` invertible in `𝒪_K`, proper or not (this contains (a))"; README:539: "Properness is used only when `ℓ` is the residue characteristic, in (b) and in (c) with `ℓ = p`." Recomputed: closed disc, `ℓ` prime to the residue characteristic: `dim H^i(X_C, ℤ/ℓ) = 1, 0, 0`, finite, zero above `2d = 2`; covered by (d). `ℓ = p`, `char K = 0`: `H¹` infinite; no case applies. README:540 adds the negative control `⊔_m Spa(K)`, `H⁰ = ∏_m ℤ/ℓ` infinite. |
| 1a/F02 (nonproper comparison neither planned nor disclaimed) | repaired | README:488–492: "let `Y` be a `K`-scheme of finite type, `n` an integer invertible in `K` and `F` a constructible sheaf of `ℤ/n`-modules … is a `G_K`-equivariant isomorphism". Supplier hypotheses checked: ClassicalAdicEtaleCohomology §11.1 has `f` of finite type, `n > 0` prime to `char(k)`, `F` constructible; applied with `k = C`. Recomputed `𝔾_m`, `μ_n`: `ℤ/n`, trivial action; `𝔸¹`, `𝔽_p((t))`, `n = p`: image `⊕ K̄·T^m ⊊ ⊕ C·T^m`. |
| 1a/F03 (DeligneWeightsAndPurityPartII not named as consumer) | repaired | README:559: "DeligneWeightsAndPurityPartII: the compatibility of the proper algebraic–adic comparison … with the continuous `K`-automorphisms of `C`, which are exactly the `σ̂` for `σ ∈ G_K` (§§0.2, 4.2)". A consumer line only; depcheck clean. |
| 1b/F02 (§2.3 re-proved the supplier's stalk theorem) | repaired | README:317: "the isomorphism `(R^i f_* M)_{ξ_C} ≅ H^i(X_C, M_C)` … is ClassicalAdicEtaleCohomology §1.5 (the strict-localisation stalk theorem with its clause (b)…). Prove that this isomorphism carries the stalk action of §0.3 to `ρ`". Supplier §1.5 read at its head: clauses (a), (b) and the `D⁺` form exist with `f` qcqs, locally of weakly finite type. |
| 1b/F03 ("natural in the data" attributed to §8.2) | repaired | README:97: "The supplier states no naturality of this map in `R`, `S` or `f`; §4.2 derives what it needs from the pasting of mates." README:486 uses `CategoryTheory.mateEquiv_vcomp`, `mateEquiv_hcomp`; both exist at the pin (`Mathlib/CategoryTheory/Adjunction/Mates.lean:167`, `:205`). |
| 1b/F04 (six names, five line numbers) | repaired | README:65: "lines 291, 477, 496, 506, 491, 414"; at the pin `def Completion` is line 291, `map` 477, `map_id` 496, `map_comp` 506, `map_unique` 491, `ext` 414. |

New errors introduced by the repairs: none found. The new §4.2 nonproper statement, the widened §4.4 (d), the contracts of §§1.5, 8.2, 11.1, 11.2 and the widened gap were each checked against the supplier's text at its open head and against huber2007 lines 948–965 and 67–68.

## Running tables

### Suggested.lean declarations (3, plus 5 instances)

| Declaration | Binders in the elaborated type | README side | Lean side | Result |
|---|---|---|---|---|
| `SpectralAlgClosure` (def, line 67) | `(K : Type u) [Field K]` | Conventions, §0.1: `AlgebraicClosure K` carrying `spectralNorm.normedField`, `spectralNorm.normedAlgebra` | body `AlgebraicClosure K`; instances `Field`, `Algebra K`, `Algebra.IsAlgebraic K` by `inferInstanceAs`; `NormedField`, `NormedAlgebra K` under `[NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]` (the hypotheses at `SpectralNorm.lean:755`, `:809`) | agree; real body; needed by the headline |
| `CompletedAlgClosure` (abbrev, line 100) | `(K) [NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]`, all three present | `UniformSpace.Completion K̄` | `UniformSpace.Completion (SpectralAlgClosure K)` | agree. `K = ℚ_p`: unfolds to `Completion (AlgebraicClosure ℚ_[p])` with the spectral norm, as `PadicComplex p` |
| `exists_galois_continuousAut_equiv` (theorem, line 120) | same three instance binders, explicit in the signature | §0.2 end theorem: bijection `G_K → (C ≃A[K] C)`, compatible with composition, jointly continuous | `∃ e`, (i) `e σ` extends `σ` on `K̄`, (ii) `e (σ * τ) x = e σ (e τ x)`, (iii) `Function.Bijective e`, (iv) `Continuous fun p => e p.1 p.2` | agree; true as typed (values below) |

Values for the theorem: `K = C` algebraically closed: `G_K = 1`, `C ≃A[K] C = {id}`, all four clauses hold. `K = ℚ_3`, `σ(√3) = −√3`: `e σ ≠ id`, isometric. `K = 𝔽_p((t))`: `e σ` fixes `t^{1/p}`; `e` still injective because `G_K = Aut(K̄/K)` and `K̄/K^sep` is purely inseparable. `S₃` (splitting field of `T³ − 2` over `ℚ_2`, `r = (123)`, `s` any transposition): `sr(α) ≠ rs(α)` in all three cases (`3 ≠ 2`, `1 ≠ 3`, `2 ≠ 1` on root labels), so clause (ii) excludes the anti-homomorphism. Clause (i) pins `e` uniquely (a continuous map on `C` is determined on the dense `K̄`), so the zero/trivial/inverse models are excluded. Joint continuity: `|σ̂(y) − σ̂₀(x)| ≤ max(|y − a|, |σ(a) − σ₀(a)|, |a − x|) = max(<ε, 0, <ε)`. Surjectivity fails without continuity (README:156 swap of `t₁, t₂` with `|t₁| = 1 ≠ p⁻¹ = |t₂|`); the Lean codomain `≃A[K]` carries continuity. Padding probe: no declaration follows from one library lemma (no extension of `G_K` to a completion exists in Mathlib or Tau Ceti: grep for `Completion.map` on algebra automorphisms and for a Galois action on `PadicComplex` found none). No `set_option`, no sorry'd data, single `import Mathlib`, `theorem` only.

Headlines (README:5–9): five groups; the first is stated; the other four are named in the module docstring (nine bullets, each with its missing carrier). Statability rechecked at the pins: `smallEtaleTopology` occurs in three Mathlib files and no `IsContinuous` instance for the base-change functor on it exists there or in Tau Ceti; `TauCeti.AdicSpace` has no étale site. No statable headline is absent.

### README targets: record of the adversarial pass

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.1 density of `K^sep` | `𝔽_p((t))`, `a = t^{1/p}` | `(b_s − t^{1/p})^p = b_s^p − t = s b_s`, so `|b_s − t^{1/p}| = |s b_s|^{1/p} → 0`; derivative of `X^{p^e} − tX − b` is `−t ≠ 0` | sound |
| §0.1 uniqueness Check | `ℚ_p(√p)`, `max(|a|,|b|)` | submultiplicative; `|√p| = 1` but `|√p²| = p⁻¹`: not power-multiplicative | sound |
| §0.2 end theorem | table above | — | sound |
| §0.3 neighbourhoods `≃ P^op` | `K = ℚ_3`, `L = K(√3)`, `F = μ_4` | one arrow `(Spa L) → (Spa K)`, none back; `μ_4(ℚ_3) = {±1}` (order 2) vs `μ_4(K^sep)` (order 4) | sound |
| §0.3 Artin–Schreier Check | `𝔽_2((t))`, `α² + α = t⁻¹` | `℘` of pole order `m` has pole order `2m`, `t⁻¹` has order 1: irreducible; two embeddings `α, α+1`; `K(t^{1/2})`: one embedding | sound |
| §1.1 composition | `S₃` on `H⁰(Y, ℤ) = ℤ^{Gal}` | `b^♮a^♮(δ_1) = δ_{rs}`, `a^♮b^♮(δ_1) = δ_{sr}`, `rs ≠ sr` | sound |
| §1.1 degree zero | `μ_n = h_V`, `a = Spa(σ̂)` | `s ∘ a` is `T ↦ σ(ζ)` | sound |
| §1.1 unbounded tensor | `Λ = ℤ/4`, `M = N = ℤ/2` | `Tor_n^{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2`, all `n ≥ 0` | sound |
| §1.1 noncommutative Check | `M_2(𝔽_2)`, `v = e_1`, `A = E_{12}`, `B = E_{21}` | `BAv = 0`, `ABv = e_1` | sound |
| §1.1 base change of the cover | `Spa(C) ×_{Spa K} Spa(C)` | no supplier gives the fibre product | S01 |
| §1.2 action | `X = Spa(L)` | `σ_X`: component `τ ↦ σ⁻¹τ` (kernel of `l⊗c ↦ τ(l)σ̂(c)`); `ρ(σ)e_τ = e_{στ}`; cubic: rank 3, trace of a transposition 1 | sound |
| §1.3 (f) | `K̄′ = K̄`, `τ ∈ G_K` | `σ̂τ̂⁻¹ = τ̂⁻¹(τστ⁻¹)^`; iso is `ρ(τ)⁻¹`; wrong choice gives `ρ(σ) = ρ(τ²στ⁻²)` | sound |
| §1.4 | `ℝ`, `μ_4`; `𝔽_p(u)`, `X = Spec k(u^{1/p})` | `i ↦ −i`; `X_{k̄}` nonreduced one point, `H⁰ = ℤ` both sides | sound |
| §2.1 | `⊔_m Spa(K)` with `μ_{ℓ^m}` | stabiliser `ker χ_ℓ`, not open | sound; qc needed |
| §2.2 | `X = Spec ℚ(2^{1/3})` | `H⁰(X_L, ℤ) = ℤ, ℤ², ℤ³` for `L = ℚ`, `ℚ(2^{1/3})`, Galois closure | sound |
| §2.3 | `p = 2`, `ℓ = 3` | `[L_m : K] = 2, 6, 18`; `(ℤ/3)²` of order 9 | sound |
| §2.4 | `ℝ`, `Spec ℂ`, `μ_4` | `(i, 1) ↦ (1, −i)` | sound |
| §2.5 first statement | `ℚ_3`, `μ_4`; `ℚ_2`, `μ_5` | invariants of order 2; `H²(μ_5) = ℤ/5`; `H²(ℤ/5(−1)) = H⁰(ℤ/5(2))^∨ = 0` since `2² = 4 ≢ 1 (mod 5)` | sound |
| §2.5 scheme spectral sequence | `Spec k′` | `E_2^{p,0} = H^p(G_{k′}, ℤ/n)` | S02 |
| §2.6 | `Spec 𝔽_2`, `ℓ = 7` | `F_X × id = F_{X_{k̄}} ∘ φ_X⁻¹`; scalars `2` and `4`, product `8 ≡ 1` | sound |
| §3.1 | tower `ℤ ←ℓ ℤ`; `⊔_m Spa(K)` | `lim = 0`, `lim¹ = ℤ_ℓ/ℤ`; `ℓ`-adic topology on `∏ ℤ_ℓ`, quotient `∏ ℤ/ℓ` infinite discrete | sound |
| §3.2 | `ℤ_ℓ/ℓ` trivial action; `⊔ Spa(L_m)` | continuous, torsion; stabiliser `G_{K(μ_{ℓ^∞})}` not open | sound |
| §3.3 topology | `ℤ_ℓ/ℓ`; `ℤ_ℓ(1)`; `∏ ℤ_ℓ`; indiscrete `ℚ_ℓ` | `V = 0`; basic `Ω = ℓ^k ℤ_ℓ(1)`; `Ω ∋ ℓ⁻¹e_m ∉ j_A(A)`; only `Ω = V`. `⋂_σ σ(Ω)` basic: checked both defining conditions | sound |
| §4.1 | `E`, `n = 7`, `ℚ_2`; `ℙ¹` | `χ·χ⁻² = χ⁻¹`, `2⁻¹ ≡ 4`; wrong twist `2³ ≡ 1`; `1 = 4·2` | sound |
| §4.2 proper | `Spec L`; `ℙ¹` | `Λ^{Hom}`, `e_τ ↦ e_{στ}`; `q⁻¹` on all three | sound |
| §4.2 nonproper | `𝔾_m`; `𝔸¹` char 0, `n = p`; `𝔽_p((t))`, `n = p` | `ℤ/n` trivial; `H¹ = 0` both sides; `cT`, `c ∈ C ∖ K̄`, not hit | sound |
| §4.3 (a)–(d) | `i = 0`; disc over `𝔽_2((t))`; Enriques | `a_{2^k(2m+1)} = c_m^{2^k} = c_m`, `a_r → 0` forces `c_m = 0`; `ℤ_2^{10} ⊕ ℤ/2` | sound |
| §4.3 Kummer Check | `|p|^{p/(p−1)} < |a| < 1` | `|(1+h)^p − 1| ≤ max(|ph|, |h|^p) ≤ |p|^{p/(p−1)} < |a|` in the small case; `(u−1)/a` reduces to `Σ ē_m T^m`, not in `T^p` | sound |
| §4.4 (a)–(d) | disc `ℓ ≠ p`, `ℓ = p`; `ℙ^d`; `⊔ Spa(K)` | `1,0,0`; infinite `H¹`; `ℤ_ℓ(−m)`, `0 ≤ m ≤ d`; `∏ ℤ/ℓ` infinite | sound |
| Worked examples | `S₃` | characters `(6,0,0)` and `(3,1,0)` | sound |

Checks per section: 0.1: 4, 0.2: 6, 0.3: 6, 1.1: 6, 1.2: 4, 1.3: 4, 1.4: 4, 2.1: 4, 2.2: 3, 2.3: 4, 2.4: 4, 2.5: 5, 2.6: 3, 3.1: 4, 3.2: 4, 3.3: 5, 4.1: 4, 4.2: 7, 4.3: 5, 4.4: 5.

## Dependency check

```
depcheck: 208 roadmaps, 1901 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Suppliers on main: AdicEtaleGeometry, AdicSpacesPartII, AdicSpacesPartIV, SchemeAndStackFoundations, EtaleCohomologyFoundations, ProfiniteCohomology, EnhancedDerivedSheaves, DerivedModuleAlgebra. Earlier in the order: PadicPeriodRings (22), ArithmeticGaloisRepresentations (57), ClassicalAdicEtaleCohomology (74), AInfCohomology (81), DiamondsAndVStacks, PadicDifferentialEquationsAndRigidCohomology (120); this roadmap is line 121. No forbidden supplier is cited. EtaleCohomologyFoundations is cited as on main (its open revision is not a dependency).

## Verified sound

- **Declarations read:** 3 (plus 5 instances), every line of `Suggested.lean`; elaborated types taken from the worker's signature file and compared with README Conventions and §§0.1–0.2: no binder lost.
- **Targets read:** all 20 sections (0.1–0.3, 1.1–1.4, 2.1–2.6, 3.1–3.3, 4.1–4.4), every bullet; 91 Checks and the Examples and Worked examples recomputed (table above).
- **Pinned declarations:** 42 names with file and line resolved at the pins (Mathlib 31, Tau Ceti 11), all at the stated lines; statements read for `Module.Finite.of_quotient_smul_top` (needs `Module.Finite R (M ⧸ I • ⊤)`, compact `R`, compact Hausdorff `M`, `I.FG`, topologically nilpotent elements: as README:79 says), `TauCeti.ContinuousRep` (arguments `Γ A M`, as used), `TopRep` (`k` then `G`), `Polynomial.exists_roots_norm_sub_lt_of_norm_coeff_sub_lt`, `continuousLocalCyclotomicCharacter`, `PadicTateTwist`.
- **Sibling citations checked:** ClassicalAdicEtaleCohomology §§1.5, 7.1, 8.2, 8.4, 9.7, 11.1, 11.2 reread at its open head (§§1.1, 1.3, 1.4 were taken from the round-1 verification); AInfCohomology §AI.3.1 (`AInf.primitive_mod_p_comparison`, hypothesis (C)); PadicPeriodRings §1.1 (`completedGaloisAction`, `completedGaloisAction_continuous`) and §2 (*PadicFieldCompletion*); PadicDifferentialEquationsAndRigidCohomology §RD.0.33 (heading: every characteristic); ArithmeticGaloisRepresentations §§1.1–1.2 (*TateTwist.zlOne*); DiamondsAndVStacks §D6.7; on main: AdicEtaleGeometry A1.1, A1.6, A1.7 (*geometric-point-etale-split* is in A1.7), A1.14 and the six `AdicSpace.*` names; AdicSpacesPartII §§R0.6, R0.7, R1.1, R1.2, R1.7; AdicSpacesPartIV *proetale-site-functoriality*; SchemeAndStackFoundations §§0.23a, 1.10, 2.1, 2.2, 2.15, 2.16 with 11 declaration names; EtaleCohomologyFoundations §§F.0.3–F.10.2b with 8 `VanishingCycles.*` names and the Checks README §2.6 quotes; ProfiniteCohomology Layers 0, 1, 10, §§10.3–10.4; EnhancedDerivedSheaves §§0.1–0.4 with 5 names; DerivedModuleAlgebra §1.T.1. The 16 "Lean names found nowhere" of the worker's citation list are all names of supplier roadmaps and occur in those roadmaps' READMEs.
- **Locators verified against the cached texts:** 41 (dejongvanderput1996: 9; stacks03N1: 8; stacks01FQ: 3; milneLEC: 8; berkovich1993: 3; scholze2013: 1; zavyalov2025: 2; hansenzavyalov2023: 3; huber2007: 4 with the coefficient hypothesis at lines 67–68). Each supports the claim it is cited for, with the stated hypotheses.
- **Declared gap** `gap:proper-rigid-finiteness`: same slug in `design/plan.json` (`gaps[0]`, supplier ClassicalAdicEtaleCohomology, §11.1) and README:102; one sentence with its hypotheses; the README says what §§9.7 and 11.1 already cover. Not raised.
- **Policy:** `git diff --stat origin/main...HEAD` touches only `packages/GaloisActionOnEtaleCohomology/` (10 files). No pull-request number, process word, machine path, `lemma`, `set_option`, `#eval`, `#print` or `#synth` in README or `Suggested.lean`. Every target has a locator.
- **Ownership:** searched by object in the pinned libraries (Galois action on a completed algebraic closure; separable approximation; continuity of the étale base-change functor) and in the roadmaps on main and the supplier heads read above. Overlaps list: none. Ownership against the full set of open pull requests was checked only through the worker's citation and overlap lists and the supplier heads named here.
- **Arrangement:** 64 source-id locators in the README; dejongvanderput1996 and stacks03N1 have 12 each. All dejongvanderput1996 locators lie in its §§3.3, 3.6, 3.7; the roadmap's five layers (fields; action; discreteness and dictionary; adic coefficients; twists, comparison, finiteness) do not map onto that paper's sections or onto the Stacks chapter's section run.

Source independence: 14 passages compared with 8 sources, none shared beyond formulas and standard names; largest share dejongvanderput1996 and stacks03N1, 12 of 64 locators each; contents compared with dejongvanderput1996 and stacks03N1: independent.

## Not verifiable

- huber1996 (Proposition 2.3.10, Corollary 2.4.6, Corollary 2.8.3, Theorems 3.7.2 and 3.8.1, Proposition 6.1.1), huber1994 §§1–3, sga4half (Arcata, Rapport), serreGC1997 Chapter I §2: uncertified, texts not read; the locators agree with those ClassicalAdicEtaleCohomology gives for the same results.
- milneLEC printed page numbers other than page 125: the extraction has no page markers; the theorem numbers and line numbers were verified.
- Elaboration: no Lean was run in this pass; the elaborated types are the worker's.
- §2.5, agreement "from `E_2` on" of the Leray spectral sequence with the supplier's pro-finite-étale torsor spectral sequence: depends on how ClassicalAdicEtaleCohomology §1.3 (b) constructs its sequence; stated as a target, not checked beyond the equality of the two composite functors.
- The claim of Scope (README:17) that PadicPeriodRings §2 and DiamondsAndVStacks §D6.7 are narrower than Layer 0 was checked on their headings and hypotheses lines, not statement by statement.

## Source issues

- **Gap** in dejongvanderput1996 at Corollary 3.7.5, printed page 39: the source says the spectral sequence exists for every abelian sheaf on a quasi-compact variety, while its proof identifies the fibre cohomology with the direct-image stalk only for overconvergent sheaves; it should assume overconvergence or justify the general case; affects a stated result.
- **Misprint** in dejongvanderput1996 at the proof of Corollary 3.7.5, printed page 39: the source says it used "Lemma 3.3.2" for the Galois-cohomology identification; it should be Corollary 3.3.2 (there is no Lemma 3.3.2); affects nothing.

## For the human reviewers

- **Licence.** huber1996, huber1994, sga4half and serreGC1997 are recorded `uncertified` in `packages/GaloisActionOnEtaleCohomology/sources.toml` and are cited by locator only; parts 1 and 2 of the source comparison were not run against them (11, 1, 2 and 2 locators).
- **Not tested.** milneLEC page numbers (README:258, 305, 486, 508, 531) could not be checked against the extraction except page 125.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "86878faec825b8de84952e93595c3dcadc438aaa", "job": "RT-GaloisActionOnEtaleCohomology~2b", "model": "fable", "worker": "chris-x8"} -->
