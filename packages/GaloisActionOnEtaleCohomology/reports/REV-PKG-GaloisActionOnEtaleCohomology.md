<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13862#issuecomment-6798574910 -->
Review (claude) of c70891a

Verdict: needs_changes

1. **F01** (P1) the cohomology of the point is attributed to a supplier section that does not state it

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md` line 91: "the equivalence `F ↦ F_ξ` with discrete `Λ[G_K]`-modules and `H^n(Spa(K, 𝒪_K), F) ≅ H^n_cont(G_K, F_ξ)`"; used at line 346 (§2.5: "after the identifications … of ClassicalAdicEtaleCohomology §1.1") and in the §2.5 Checks.

   **Claim.** ClassicalAdicEtaleCohomology §1.1 supplies `H^n(Spa(K, 𝒪_K), F) ≅ H^n_cont(G_K, F_ξ)`.

   **Witness.** ClassicalAdicEtaleCohomology §1.1 at its open head (README lines 104, 138, 142) states only the equivalence of `Sh(X_ét, Λ)` with discrete `Λ[Gal(K^sep/K)]`-modules. No target of that roadmap identifies `H^n` of the point with continuous cohomology (it appears only inside Checks, lines 1189 and 2238). The scheme side is supplied: SchemeAndStackFoundations §2.15 `etale_galois_comparison` does state `H^q ≅ H^q_cont`.

   **Repair.** In line 91 delete "and `H^n(Spa(K, 𝒪_K), F) ≅ H^n_cont(G_K, F_ξ)`". In §2.5 add a first target, before the `E_2` statement: "Prove that for a sheaf `𝒢` of `Λ`-modules on `Spa(K, 𝒪_K)_ét` there are isomorphisms `H^n(Spa(K, 𝒪_K), 𝒢) ≅ H^n_cont(G_K, 𝒢_{ξ_C})`, natural in `𝒢` and compatible with connecting maps. Route: ClassicalAdicEtaleCohomology §1.3 (b) for the pro-finite-étale `G_K`-torsor `lim_L Spa(L, 𝒪_L) → Spa(K, 𝒪_K)` gives `E_2^{p,q} = H^p_cont(G_K, colim_L H^q(Spa(L, 𝒪_L), 𝒢))`, and `colim_L H^q(Spa(L, 𝒪_L), 𝒢) = H^q(Spa(C, 𝒪_C), 𝒢_C)` (§2.1) is `𝒢_{ξ_C}` for `q = 0` and vanishes for `q > 0`, because every étale covering of `Spa(C, 𝒪_C)` has a member with a section (AdicEtaleGeometry A1.7, *geometric-point-etale-split*)." Change the §2.5 sentence to cite this target for the rigid case, and add ClassicalAdicEtaleCohomology §1.3 (b) to what the target needs (it is already in the §2.5 `*Needs:*` line). Tested on the instance that exposed it: the first Check of §2.5 (`X = Spa(K, 𝒪_K)`, collapse to `H^p_cont(G_K, ℱ_{ξ_C})`) is then this target, with an owner. The alternative repair is a declared gap on ClassicalAdicEtaleCohomology §1.1 with this sentence as its `needs`.

2. **F02** (P2) the cup-product route cites a lax monoidal structure that the supplier section does not state

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md` line 199 (§1.1, Cup products): "the lax monoidal structure of `RΓ` from §0.4 (`ClassicalDerived.functorCoherence`) … because inverse image is monoidal and `c_a` is compatible with the tensor isomorphism".

   **Claim.** EnhancedDerivedSheaves §0.4 supplies a lax monoidal structure on `RΓ`, and monoidality of inverse image with its tensor isomorphism is available.

   **Witness.** EnhancedDerivedSheaves §§0.1–0.4 on main (README lines 430–506): §0.4 states the enhanced adjunction, base-change and projection transformations and composition coherence; the word "monoidal" does not occur in lines 430–506, and no statement `f^{-1}(M ⊗^L N) ≅ f^{-1}M ⊗^L f^{-1}N` is made there.

   **Repair.** Define the cup product from §0.3 alone: classes `x : Λ → p^{-1}M[i]` and `y : Λ → p^{-1}N[j]` give `x ∪ y : Λ ≅ Λ ⊗^L_Λ Λ → (p^{-1}M ⊗^L_Λ p^{-1}N)[i+j]` (unit, bifunctoriality and the shift sign of `ClassicalDerived.tensorHom`). Add to the "Prove" list of §1.1 its own bullet: "**Inverse image and tensor.** For commutative `Λ` and a morphism `g` in one of the settings (a)–(c), there is a natural isomorphism `g^{-1}(M ⊗^L_Λ N) ≅ g^{-1}M ⊗^L_Λ g^{-1}N`, compatible with units, associativity and the composition isomorphisms `(g ∘ h)^{-1} ≅ h^{-1} g^{-1}`: the exact inverse image commutes with the sheaf tensor product and preserves K-flat complexes with flat terms (EnhancedDerivedSheaves §0.2)." Then the cup-product bullet cites this bullet instead of §0.4. Tested on the unbounded-target Check (`Λ = ℤ/4`, `M = N = ℤ/2`): the product of the two unit classes is still the degree-zero generator, since only the unit isomorphism is used.

3. **F03** (P3) the Milne locators of §1.4 do not contain the scheme action

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md` line 255: "(§1.1 (c) with `p` the projection; milneLEC §12, page 81, and §17, page 114; sga4half, Arcata)".

   **Claim.** These pages support the definition of the Galois action on `H^i(X_{k^sep}, M)`.

   **Witness.** milneLEC lines 3211–3247 (page 81) are higher direct images and their stalks (Proposition 12.1, Corollary 12.2); lines 4442–4480 (page 114) are proper base change in topology. Neither mentions a Galois group.

   **Repair.** Replace the Milne part by "stacks03N1, Section 56 (Tag 03QW), line 3966, for the action through `Spec(σ)` on a geometric point; milneLEC §14, page 99, lines 3940–3945, where `Gal(k^al/k)` acts on `H^r(Ū, ℱ)` in the Hochschild–Serre sequences of a curve over a finite field". In §2.2 make the Milne locator exact: "milneLEC Corollary 12.2, page 81, line 3237" (the stalk of a higher direct image as a colimit over étale neighbourhoods). The References entry for milneLEC gains "§14 (page 99)".

4. **F04** (P3) case (c) of §4.4 gives no source for vanishing above `2d`

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md` line 513: "(c) … §4.2 and EtaleCohomologyFoundations §F.3 (`VanishingCycles.etaleFiniteness`) for `Y_{K̄}`".

   **Claim.** The cited inputs give the hypotheses of §4.3 (a)–(d) with `N = 2d`.

   **Witness.** EtaleCohomologyFoundations §F.3 on main (README line 693) gives finiteness "with bounded cohomological amplitude", not the bound `2d`; the bound is its separate section F.3.0 (`VanishingCycles.etaleCohomologicalDimension`, line 630), which the README does not cite.

   **Repair.** Append to (c): "vanishing above `2d` is ClassicalAdicEtaleCohomology §8.4 applied to `Y^an` (or, on the scheme side, EtaleCohomologyFoundations §F.3.0, `VanishingCycles.etaleCohomologicalDimension`, with §4.2)". §8.4 is already in the `*Needs:*` line; it applies with no condition on the torsion, so `ℓ = p` with `char K = 0` is covered.

5. **F05** (P3) the general proper case of §4.4 (d) has no locator

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md` line 514: "for the remaining proper `X`, finiteness is `gap:proper-rigid-finiteness`".

   **Claim.** `H^i(X_C, ℤ/ℓ)` is finite for every proper rigid `X` over `K` of any characteristic, `ℓ` invertible in `𝒪_K`.

   **Witness.** No source in `sources.toml` is cited for this case: huber1996 Proposition 6.1.1 is the locally algebraic case, berkovich1993 Corollary 7.4.4 the smooth case, and hansenzavyalov2023 Theorems 3.3.1–3.3.2 (line 1684) assume a discretely valued `p`-adic field.

   **Repair.** Add the locator of the theorem the gap asks ClassicalAdicEtaleCohomology to prove, recorded in `sources.toml`, at line 514 and in the gap sentence of line 100. If that source carries a hypothesis on `char K` (Huber's finiteness theorems outside the smooth and locally algebraic cases are usually quoted for characteristic zero), state the same hypothesis in (d) and in the `needs` sentence of the gap, in the README and in `design/plan.json`. The gap as declared is precise, has a named supplier and the same slug in both files; this finding is the missing locator, not the gap.

6. **F06** (P3) `CompletedAlgClosure ℚ_[p]` is `PadicComplex p` itself, not an isomorphic copy

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md` line 132: "up to the `ℚ_p`-isomorphism `AlgebraicClosure ℚ_p ≅ PadicAlgCl p`, an isometry by the uniqueness of the spectral norm"; `Suggested.lean` lines 96–97: "up to an isometric `ℚ_p`-isomorphism".

   **Claim.** The two fields are related by a nontrivial isomorphism.

   **Witness.** At the pin, `Mathlib/NumberTheory/Padics/Complex.lean` line 54 is `abbrev PadicAlgCl := AlgebraicClosure ℚ_[p]`, line 67 gives it `spectralNorm.normedField`, and line 137 is `abbrev PadicComplex := UniformSpace.Completion (PadicAlgCl p)`. `example (p : ℕ) [Fact p.Prime] : CompletedAlgClosure ℚ_[p] = PadicComplex p := rfl` elaborates.

   **Repair.** README line 132: "For `K = ℚ_p`, `C` is Mathlib's `PadicComplex p`: `PadicAlgCl p` is by definition `AlgebraicClosure ℚ_[p]` with the spectral norm, so the two completions agree as types and as normed fields; algebraic closedness is then `PadicComplex.isAlgClosed`." Docstring: "For `K = ℚ_p` it agrees with Mathlib's `PadicComplex p`." The third Check of §0.2 (finite `K/ℚ_p`, where `AlgebraicClosure K` is a different type) is correct as written.

7. **F07** (P3) the last Check of §4.3 uses a space outside the section's hypothesis

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md` line 503: "For `X` the open unit disc and `ℓ = p` the residue characteristic, the hypothesis of (a) fails".

   **Claim.** The Check tests the finiteness hypothesis of (a).

   **Witness.** §4.3 line 490 assumes `X` quasi-compact quasi-separated; the open unit disc is not quasi-compact, so no clause of §4.3 applies to it whatever the value of `H¹`, and the Check does not separate (a) from a version without its hypothesis.

   **Repair.** Replace "the open unit disc" by "the closed unit disc, `char K = 0`", as in the Examples of Layer 3 and the last Check of §4.4. Value recomputed: `H¹(X_C, μ_{p^n}) = 𝒪(X_C)^×/p^n`, the transitions are surjective, and `𝒪(X_C)^×/p` is infinite, so `H¹(X_C, ℤ_p)` is not finitely generated.

8. **F08** (P3) the manifest locator of `sga4half` omits a cited chapter

   **Location.** `packages/GaloisActionOnEtaleCohomology/sources.toml` line 79: `locator = "Arcata"`.

   **Claim.** The manifest records every locator the README cites.

   **Witness.** README lines 362 and 560 cite "sga4half, Arcata and Rapport".

   **Repair.** `locator = "Arcata; Rapport"`.

Eight findings: one P1, one P2, six P3. The Lean file elaborates with `sorry` as its only warning, the dependency check is clean, and the mathematics of every statement I recomputed is sound; the blocking findings are two supplier citations for statements the cited sections do not make. No previous review of the package exists, and no maintainer notes were left.

## Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_galois_continuousAut_equiv` (§0.2, Lean) | `K = C` algebraically closed; `K = 𝔽_p((t))`; product order in `S₃` | `K = C`: `G_K = 1`, `Aut_cont(C/K) = {id}`, bijection of one-point sets. `𝔽_p((t))`: `σ̂(t^{1/p}) = t^{1/p}`, `K̄ ≠ K^sep` but restriction to `K̄` still injective. `(σ * τ) x = σ (τ x)` in `AlgEquiv`, so conjunct 2 agrees with conjunct 1 | true | none |
| surjectivity of `σ ↦ σ̂` | continuous endomorphism `τ`, `a ∈ K̄` with minimal polynomial `f` | `f = ∏ (X − a_i)` over `K̄`, so roots of `f` in `C` are the `a_i`; `τ(K̄) ⊆ K̄` | true | none |
| continuity not droppable (§0.2 Check) | swap of `t₁, t₂`, `|t₁| = 1`, `|t₂| = p⁻¹` | fixes `PadicAlgCl p`, so it would be `1̂ = id`; it moves `t₁` | Check sound | none |
| density of `K^sep` (§0.1) | `X^{p^e} − tX − b`, `p^e ≥ 2` | derivative `−t ≠ 0`; coefficients differ from `X^{p^e} − b` only in degree 1, by `t`; root distance `< ((p^e + 1)|t|)^{1/p^e} max(|a|, 1) → 0` | true | none |
| `𝔽_p((t))` Check (§0.1) | root `b_s` of `X^p − sX − t` | `(b_s − t^{1/p})^p = s b_s`; `|b_s|^p ≤ max(|s||b_s|, |t|)` bounds `b_s` | sound | none |
| composition order (§0.2, §1.1 Checks) | `ℚ_2`, `T³ − 2`, `r: α ↦ ζα`, `s: ζ ↦ ζ²` | `sr(α) = ζ²α`, `rs(α) = ζα`; in general `(rs)⁻¹sr = r²` moves every root; `(a∘b)^♮ δ_1 = δ_{rs}`, wrong order `δ_{sr}` | sound | none |
| degree-zero formula (§1.1) | `V = Spa(K[T]/(T^n − 1))`, `a = Spa(σ̂)` | `s ↔ (T ↦ ζ)`, `s ∘ a ↔ (T ↦ σ̂(ζ))` | `a^♮(ζ) = σ(ζ)` | none |
| unbounded tensor (§1.1, §1.3 (d)) | `Λ = ℤ/4`, `M = N = ℤ/2` | `Tor_n^{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` for all `n ≥ 0` | target outside `D⁺`, as stated | R02 (route only) |
| noncommutative Check (§1.1) | `M_2(𝔽_2)`, `v = e_1`, `A = E_{12}`, `B = E_{21}` | `B(Av) = 0`, `(AB)v = e_1` | sound | none |
| permutation module (§1.2) | `X = Spa(L)`, component `τ` | `(τ ⊗ 1) ∘ (id ⊗ σ̂) = σ̂ ∘ ((σ⁻¹τ) ⊗ 1)`: component `τ ↦ σ⁻¹τ`, indicator `τ ↦ στ`; cubic `ℚ_2(2^{1/3})`: rank 3, trace 1 on a transposition, regular representation of `S₃`: 6 and 0 | sound | none |
| change of closure (§1.3 (f)) | `τ ∈ G_K` | ring maps: `σ̂ τ̂⁻¹ = τ̂⁻¹ (τστ⁻¹)^`; statement becomes `ρ(τ)⁻¹ρ(τστ⁻¹)ρ(τ) = ρ(σ)`; with `ρ(τ)`: `ρ(τ²στ⁻²)` | sound | none |
| scheme action (§1.4) | `k = 𝔽_p(u)`, `X = Spec k(u^{1/p})`; `k = ℝ`, `μ_4` | `X_{k̄} = Spec k̄[T]/(T − u^{1/p})^p`, one point; conjugation `i ↦ −i` | sound; locator R03 | R03 |
| discreteness (§2.1) | `⊔_m Spa(K)`, `μ_{ℓ^m}` on the `m`-th | stabiliser of a compatible system `= ker χ_ℓ`, not open (`ℚ_p(μ_{ℓ^∞})/ℚ_p` infinite) | quasi-compactness needed, as stated | none |
| finite levels (§2.2) | `X = Spec ℚ(2^{1/3})` | `H⁰` at `L = ℚ, ℚ(α), ℚ̄`: `ℤ, ℤ², ℤ³` (`ℚ(α) ⊗ ℚ(α) = ℚ(α) × ℚ(α, ζ_3)`) | sound | none |
| dictionary (§2.4) | `k = ℝ`, `X = Spec ℂ`, `μ_4` | new coordinate at `τ` is the conjugate of the old one at `cτ`: `(i, 1) ↦ (1, −i)` | sound | none |
| Hochschild–Serre (§2.5) | `X = Spa(K)`; `ℚ_2`, `μ_5` | collapse needs `H^p(Spa K, ℱ) = H^p_cont(G_K, ℱ_ξ)`; `ord_5(2) = 4`, `2² = 4 ≢ 1`, so `H⁰(ℤ/5(2)) = 0` and `H²(ℤ/5(−1)) = 0` against `H²(μ_5) = ℤ/5` | direction Check sound; input unowned | R01 |
| Frobenius (§2.6) | `F_{X_{k̄}} = (F_X × id) ∘ φ_X`; `q = 2`, `ℓ = 7` | `(F_X × id)^* = (φ_X^*)⁻¹`; scalars `2` and `4`, product `8 ≡ 1` | sound | none |
| derived reduction (§3.1) | cone of `ℓ^m` on `(ℤ/ℓ^n)_n`, `n ≥ m` | `H⁰ = ℤ/ℓ^m` with identity transitions; `H^{−1} = ℤ/ℓ^m` with transitions multiplication by `ℓ`, pro-zero | sound | none |
| Milnor term (§3.1) | `ℤ ← ℤ` by `ℓ` | `lim = 0`, `lim¹ = ℤ_ℓ/ℤ` | sound | none |
| continuity (§3.2) | `⊔_m Spa(K(μ_{ℓ^m}))` | stabiliser `G_{K(μ_{ℓ^∞})}`, not open | sound | none |
| rational topology (§3.3) | `A = ℤ_ℓ/ℓ`; `ℤ_ℓ(1)`; `∏_m ℤ_ℓ`; indiscrete `ℚ_ℓ` | `V = 0`; basic `Ω = ℓ^k ℤ_ℓ(1)`; `e_m ∈ j_A⁻¹(ℓΩ)` for large `m`, so `ℓ⁻¹e_m ∈ Ω ∖ j_A(A)`; only `Ω = V`. Basic sets are closed under `∩` and under `ℓ^{±1}` (a subgroup containing an open subgroup is open) | definition determines a vector-space topology | none |
| twisting (§4.1) | elliptic curve, `n = 7`, `K = ℚ_2`; `ℙ¹` | `det = χ·χ⁻² = χ⁻¹`: `2⁻¹ ≡ 4`; wrong twist `χ³`: `8 ≡ 1`; `ℙ¹`: `1 = 4·2` | sound | none |
| comparison (§4.2) | `R = Spa(C, 𝒪_C)`, `S = Spec K`, target `Spec K` | `Y^ad = Spa(C, 𝒪_C)`, global sections of `φ^*R^if_*M` are the stalk at `Spec C → Spec K` | hypotheses match ClassicalAdicEtaleCohomology §8.2 (torsion `Λ`, proper `f`, `D⁺`) | none |
| packaging (§4.3 (b), (d)) | Nakayama hypotheses; `X = Spa(K)`; disc over `𝔽_2((t))` | `H` closed in a product of finite groups, `H/ℓH ↪ H^i(ℤ/ℓ(j))`; `N = 0`: surjective reductions, `H¹_cont = 0`; disc: `a_{2^k(2m+1)} = c_m`, `a_r → 0` forces `c_m = 0`, `H² = 0` gives surjective transitions | sound; last Check off-hypothesis | R07 |
| instances (§4.4) | (a)–(d) against suppliers | (a) §9.7 smooth proper, `n` invertible in `𝒪_C`; (b) AInfCohomology §AI.3.1 with vanishing above `2 dim X`; (c) F.3 gives finiteness only; (d) §11.1 locally algebraic only | (c), (d) under-sourced | R04, R05 |

## Verified sound

- **Elaboration.** `lake env lean` on `packages/GaloisActionOnEtaleCohomology/Suggested.lean`: one warning, `declaration uses sorry` at line 118; no error, no `set_option`, single `import Mathlib`, no sorry'd data (two definitions and five instances with real bodies, one theorem).
- **Signatures.** `#check @name` on the 3 declarations in a scratch copy: no binder lost; the theorem carries `NontriviallyNormedField`, `CompleteSpace`, `IsUltrametricDist`, equal to the README's Conventions. Checked by `rfl` in the same file: `algebraMap K̄ C` is the completion coercion, `algebraMap K C` factors through `K̄`, and the topology on `Field.absoluteGaloisGroup K` is `krullTopology K (AlgebraicClosure K)`. `NormedField`, `CompleteSpace` and `NormedAlgebra K` on `CompletedAlgClosure K` synthesise.
- **Padding probe.** The one sorried theorem tried with `first | simp | rfl | infer_instance | exact? | aesop`: none closes it. It restates no definition and mirrors no Check.
- **Headlines.** Five end theorems in the Summary; the first is stated; the module docstring names the others (nine entries) with the missing carrier. Checked at the pins: no étale site on `TauCeti.AdicSpace`; `Scheme.smallEtaleTopology` is used in three Mathlib files only, none giving continuity of `MorphismProperty.Over.pullback`; `ContinuousAlgEquiv` has no `Mul` instance (`σ * τ` fails to elaborate), as the docstring says.
- **Library pins, 37 declarations opened.** Mathlib: `Field.absoluteGaloisGroup` (`FieldTheory/AbsoluteGaloisGroup.lean:42`), `mapOfAlgebra` (:59), `IntermediateField.fixingSubgroup_isOpen` (`KrullTopology.lean:170`), `spectralNorm` and five companions (`SpectralNorm.lean:381, 755, 809, 573, 699, 451`), `Completion.map`, `map_id`, `map_comp`, `map_unique`, `ext` (`Completion.lean:477, 496, 506, 491, 414`), `instField` (`UniformField.lean:148`), `Normed/Module/Completion.lean:82, 86`, `NormedField.instCompletableTopField` (:24), `IsAlgClosed.of_denseRange` (`Dense.lean:46`, `CharZero` present), `exists_roots_norm_sub_lt_of_norm_coeff_sub_lt` (`Approximation.lean:52`), `ContinuousAlgEquiv` (:45), `SeparableClosure` (:348), `TopRep` (:31, :212), `continuousSMul_iff_stabilizer_isOpen` (:299), `smallEtaleTopology` (:50), `Sheaf.H` (:57, :112), `EllAdicCohomology`, `PadicComplex`. Tau Ceti: `absoluteGaloisGroupRestrictEquiv` (:340), the `CompactSpace` instance (:374), `Sheaf.H.pullback` (:69) with its four lemmas, `continuousLocalCyclotomicCharacter` (:54), `IsArithFrobeniusLift.coe_localCyclotomicCharacter` (:61), `PadicTateTwist` (:88), `Module.Finite.of_quotient_smul_top` (:164), `ContinuousRep` (:82), `toContRepresentation` (:150), `isMittagLeffler_of_surjective` (:104), `subsingleton_limOne_of_isMittagLeffler` (:191), `AdicSpace`. All at the cited files and lines, with the hypotheses the README states.
- **Duplication by object.** Nothing at the pins extends Galois automorphisms to a completed algebraic closure or identifies `G_K` with continuous automorphisms (searched `Completion.map` with `AlgEquiv`, `PadicComplex`, `spectralNorm` across Tau Ceti). No declaration of `Suggested.lean` shares a name with another roadmap's Lean file (`roadmaps grep --lean-only`: no match). PadicPeriodRings §1.1 (`completedGaloisAction`, `K/ℚ_p` finite) and §2 are the narrower forms, named in Scope with the difference. ClassicalAdicEtaleCohomology, DiamondEtaleCohomology, AdicCoefficientsAndComparisons, ClassicalAdicEtaleCohomologyPartII and WeightsInEtaleCohomology, read at their heads, do not construct `σ_X` or `c_σ`.
- **Supplier citations resolved, 15 roadmaps.** Every cited section exists: AdicEtaleGeometry A1.1, A1.6, A1.7, A1.14 with the five italic targets and five `AdicSpace.*` names; AdicSpacesPartII §§R0.6, R0.7, R1.1, R1.2; AdicSpacesPartIV R4; SchemeAndStackFoundations §§0.23a, 1.10, 2.1, 2.2, 2.15, 2.16 with eleven names; EtaleCohomologyFoundations §§F.0.3, F.0.4, F.1, F.2.1, F.3, F.4.0, F.4.1, F.4.6, F.10.2, F.10.2b with six names; ProfiniteCohomology Layers 0, 1, 10; EnhancedDerivedSheaves §§0.1–0.4 with five names; ArithmeticGaloisRepresentations §§1.1–1.2; AInfCohomology §AI.3.1; PadicDifferentialEquationsAndRigidCohomology §RD.0.33; PadicPeriodRings §1.1 and §2; DiamondsAndVStacks §D6.7; PadicHodgeTheory §2.7 and Layer 8; ClassicalAdicEtaleCohomology §§1.1, 1.3, 1.4, 1.5, 7.1, 8.2, 8.4, 9.7, 11.1. Statements compared with the README's contracts; they agree except R01 and R02. DerivedModuleAlgebra §1.T.1 is no longer a heading on main; its Scope says citations of §1.T.1 resolve to the Tau Ceti tower declarations, which the README names, so the citation stands.
- **Dependency check.** Output: `depcheck: 210 roadmaps, 1926 edges, 0 problem(s)`. No UPWARD or CYCLE line. The roadmap is at line 121 of the merge order; its suppliers not on main are at lines 20, 22, 57, 74, 81 and 120. PadicHodgeTheory (line 123) is named as a consumer only.
- **Overlaps.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id defined only by a revision; I found none either. The 13 "Lean names found nowhere" of `scratch/citations.md` are all supplier names, each found in the supplier README.
- **Declared gap.** `gap:proper-rigid-finiteness`: same slug, supplier and section in `design/plan.json` and README line 100; one sentence, with hypotheses; not provided by §9.7 (smooth) or §11.1 (locally algebraic). Acceptance would be conditional on it.
- **Sources, the seeded sample (15 targets).** 0.2, 1.1, 1.2, 1.3: dejongvanderput1996 lines 1477–1488 (§3.6, page 36) and zavyalov2025 lines 3798–3802 (§5.4, page 78). 2.1, 2.5, 3.2: dejongvanderput1996 lines 1594–1605 (Corollary 3.7.5, page 39). 2.2, 2.4: stacks03N1 lines 3733, 3745, 3746, 3963–3969, 4216, 4241. 3.1, 3.3, 4.3: hansenzavyalov2023 lines 1684, 1702–1708 (page 39); milneLEC line 4860 (Theorem 19.2, page 125, hypotheses as described). 4.2: milneLEC line 4534 (Corollary 17.8 (b), page 116); berkovich1993 lines 4584, 5110, 5339 (printed pages 128, 143, 150, hypotheses as described). Also scholze2013 line 1279 (Theorem 5.1, page 28) and dejongvanderput1996 lines 1571–1587 (Theorem 3.7.3, page 38). All correct except the Milne locators of 1.4 (R03).
- **Shape.** Five layers, each ending in Examples and Dependencies; 20 subsections, each with a `*Needs:*` line and 3 to 6 Checks; the layer order is forced by the dependency lines; no layer is named after a source. No LaTeX delimiters, process words, pull-request numbers or machine paths in the README or the Lean file. The three backticked names of the roadmap's own are declared in `Suggested.lean`. All 11 cited works are in `sources.toml`.

## Not verifiable

- huber1996, huber1994, sga4half, serreGC1997: recorded as uncertified; their locators (Proposition 2.3.10, Corollaries 2.4.6 and 2.8.3, Theorem 3.7.2, Proposition 6.1.1; §§1–3; Arcata, Rapport; Chapter I §2) were not read. The targets 2.6 and the Serre half of 2.5 and 3.2 rest on them alone for a literature locator.
- Whether the statement of `gap:proper-rigid-finiteness` is a published theorem when `char K = p`: no text in the manifest covers it and I found none; see R05.
- zavyalov2025: the Annals pagination was not compared with arXiv v3; the manifest says so and the README cites the arXiv numbering.
- Ownership against open pull requests was checked through `roadmaps grep` and the five closest roadmaps of `scratch/overlaps.md`, not by reading all 205 listed roadmaps.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c70891a449837bc6060b570fb166f925a914efe9", "job": "REV-PKG-GaloisActionOnEtaleCohomology", "model": "fable", "worker": "chris-x10"} -->
