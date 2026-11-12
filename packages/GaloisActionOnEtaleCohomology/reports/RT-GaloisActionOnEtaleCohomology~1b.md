<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13862#issuecomment-6802225273 -->
Red team round 1 pass b (claude) of d334997

Verdict: needs_changes

1. **F01** (P2) §4.4: "properness is used in every case" is false for case (d), and case (d) is narrower than its own sources

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md:528`: "For the closed unit disc (not proper) and `ℓ = p`, `char K = 0`, finiteness fails in degree one; properness is used in every case." Also `README.md:521`, case (d): "`X` proper and `ℓ` invertible in `𝒪_K`".

   **Claim.** Each of the cases (a)–(d) needs `X` proper.

   **Witness.** Closed unit disc, `ℓ` invertible in `𝒪_K`: `README.md:451` computes `H⁰(X_C, ℤ_ℓ) = ℤ_ℓ`, higher groups `0` (finite, not proper). `README.md:521` itself says huber2007 Corollary 5.6 (huber2007 line 963) covers every quasi-separated `X` of finite type. The supplier's §11.1 is stated for qcqs spaces and carries the bound `cd_ℓ(X) ≤ 2 dim.tr(X/S)` over a geometric point (ClassicalAdicEtaleCohomology §11.1, Huber 2.8.1–2.8.3).

   **Values.** Disc, `ℓ ≠ p`: `dim_{𝔽_ℓ} H^i(X_C, ℤ/ℓ) = 1, 0, 0` for `i = 0, 1, 2`; hypotheses of §4.3 (a)–(d) hold with `N = 2`, although `X` is not proper. Disc, `ℓ = p`, `char K = 0`: `H¹(X_C, ℤ/p)` infinite (§4.3 last Check). So properness separates the cases only when `ℓ` is the residue characteristic.

   **Repair.**

   1. Replace the Check at line 528 by: "For the closed unit disc (not proper), `char K = 0` and `ℓ = p` the residue characteristic, finiteness fails in degree one (§4.3, last Check): properness is used in cases (b) and (c) with `ℓ = p`. For `ℓ` invertible in `𝒪_K` properness is not needed: the disc has `H⁰(X_C, ℤ/ℓ) = ℤ/ℓ` and no higher cohomology, and case (e) applies."
   2. Add after case (d): "(e) `X` quasi-compact quasi-separated, `ℓ` invertible in `𝒪_K`, and `X_C` locally algebraically of finite type over `Spa(C, 𝒪_C)` (for instance `X` smooth): finiteness is ClassicalAdicEtaleCohomology §11.1 (huber1996, Proposition 6.1.1, with `B = ℤ/ℓ`), and vanishing above `2d` is the bound `cd_ℓ(X_C) ≤ 2 dim.tr(X_C/Spa(C, 𝒪_C))` of the same section (huber1996, Corollary 2.8.3; hansenzavyalov2023, line 1708)." Change the opening of §4.4 from "hold in the following cases" to "hold in the following cases (proper in (a)–(d), quasi-compact quasi-separated in (e))". The gap `gap:proper-rigid-finiteness` is unchanged.

   Tested on the refuting instance: for the disc and `ℓ ≠ p`, (e) applies (the disc is smooth and qcqs) and gives finite groups vanishing above degree 2, which agrees with line 451; for `ℓ = p` no case applies, which agrees with the infinite `H¹`.

2. **F02** (P2) §2.3 proves again the stalk isomorphism that ClassicalAdicEtaleCohomology §1.5 states, and uses the sheaf-only neighbourhood formula on `D⁺`

   **Location.** `README.md:315`: "prove that `R^i f_* M` corresponds to `(H^i(X_C, M_C), ρ)`: there is an isomorphism `(R^i f_* M)_{ξ_C} ≅ H^i(X_C, M_C)` of `Λ[G_K]`-modules"; route at `README.md:317`; contract at `README.md:94`.

   **Claim.** The isomorphism is a target of this roadmap, obtained from the neighbourhood stalk formula of the supplier's §1.5 and §2.1, for every `M ∈ D⁺(X_ét, Λ)`.

   **Witness.** ClassicalAdicEtaleCohomology §1.5 (head of its open pull request), the statement after the neighbourhood formula: for `f` qcqs locally of weakly finite type, "`(Rⁿ f_*F)_ξ ≅ Hⁿ(X ×_Y Spa(C_ξ, C_ξ⁺), G)`, compatible with connecting maps and natural in `ξ` (in particular equivariant for automorphisms of the strict localisation over `y`); for `K ∈ D⁺(X_ét, Λ)`, `(Rf_*K)_ξ ≅ RΓ(X ×_Y Y(ξ), K|)`", with clause (b) `(C_ξ, C_ξ⁺) = (C, C⁺)` for the completed algebraic closure. The neighbourhood formula that §2.3 cites is stated there for `F ∈ Sh(X′_ét, Λ)` only.

   **Values.** For `Y = Spa(K, 𝒪_K)`, `ξ = ξ_C`: supplier clause (b) gives `(R^i f_*F)_{ξ_C} ≅ H^i(X ×_{Spa K} Spa(C, 𝒪_C), F) = H^i(X_C, F_C)`, the same two sides as line 315, and its `D⁺` clause gives the complex form that the route at line 317 uses without a supplier.

   **Repair.**

   1. `README.md:94`, add to the §1.5 contract: "the strict-localisation stalk theorem: for `f : X → Y` quasi-compact, quasi-separated and locally of weakly finite type and a geometric point `ξ` built from the completed algebraic closure, `(R^n f_*F)_ξ ≅ H^n(X ×_Y Spa(C, C⁺), F)`, compatible with connecting maps, natural in `ξ` (equivariant for automorphisms of the strict localisation), and `(Rf_*M)_ξ ≅ RΓ(X ×_Y Spa(C, C⁺), M)` for `M ∈ D⁺`."
   2. `README.md:315`, replace "prove that … there is an isomorphism … compatible with connecting maps" by: "the isomorphism `(R^i f_* M)_{ξ_C} ≅ H^i(X_C, M_C)`, natural in `M ∈ D⁺(X_ét, Λ)` and compatible with connecting maps, is ClassicalAdicEtaleCohomology §1.5 (strict-localisation stalk theorem, clause (b)). Prove that it carries the stalk action of §0.3 to `ρ`, so that `R^i f_* M` corresponds to `(H^i(X_C, M_C), ρ)`."
   3. `README.md:317`, begin the route with: "The supplier's isomorphism is the composite of its neighbourhood formula with its colimit theorem; for `M ∈ D⁺` both hold by the supplier's `D⁺` clause. On the neighbourhood side …" and keep the rest (initial subcategory, `σ_L^♮`, §2.1) as the proof of equivariance.

   Tested: with `X = Spa(L, 𝒪_L)`, `M = ℤ`, the supplier isomorphism gives `(f_*ℤ)_{ξ_C} ≅ ℤ^{Hom_K(L, C)}` and the retained equivariance step gives the permutation action `e_τ ↦ e_{σ∘τ}`, the value of the Check at line 327.

3. **F03** (P3) The §8.2 contract attributes "natural in the data" to the supplier; §4.2's equivariance rests on it

   **Location.** `README.md:96`: "`φ_Y^* R⁺f_* ≅ R⁺f^ad_* φ_X^*` on torsion `D⁺`, natural in the data." `README.md:484`: "Huber's base-change transformation is natural in the adic space `R` over `S`".

   **Claim.** ClassicalAdicEtaleCohomology §8.2 provides naturality of the comparison in `R`.

   **Witness.** ClassicalAdicEtaleCohomology §8.2, "(Theorem 3.7.2) If `f` is proper and `Λ` is a torsion ring, the base-change transformation … is an isomorphism": the statement of Theorem 3.7.2 in that section, and its "This uses" line, assert no naturality in `R`, `S` or `f`.

   **Repair.** Line 96: replace "natural in the data" by "where the transformation is the base-change map (mate) of the commutative square of étale sites formed by `φ_X`, `φ_Y`, `f` and `f^ad`". Line 484: replace the quoted clause by "the base-change map of a pasted square of morphisms of sites is the pasting of the base-change maps (a formal property of mates, proved here from the adjunctions of ClassicalAdicEtaleCohomology §1.1 and SchemeAndStackFoundations §2.1); applied to the automorphism `Spa(σ̂)` of `R` over `S = Spec K`, it gives the equivariance, since `Spa(σ̂)`". Tested on `Y = Spec L`, `L/K` finite separable: the pasted square for `Spa(σ̂)` permutes the components of `(Y^an)_C` by `τ ↦ σ⁻¹∘τ`, giving `e_τ ↦ e_{σ∘τ}` on both sides, the value of the Check at line 488.

4. **F04** (P3) Six declarations, five line numbers

   **Location.** `README.md:65`: "`UniformSpace.Completion`, `UniformSpace.Completion.map`, `map_id`, `map_comp`, `map_unique`, `ext` (`Mathlib/Topology/UniformSpace/Completion.lean`, lines 477, 496, 506, 491, 414)".

   **Witness.** At the pin: `def Completion` line 291, `map` 477, `map_id` 496, `map_comp` 506, `map_unique` 491, `ext` 414. Read positionally the list gives `Completion` ↦ 477.

   **Repair.** "lines 291, 477, 496, 506, 491, 414".

Two P2 findings and two P3 findings. No statement of `Suggested.lean` or of the README was found false; the findings are an overclaiming Check with a narrowed case, a supplier theorem proved again instead of cited, a supplier contract that attributes a naturality the supplier does not state, and a locator list.

## Record of the adversarial pass

`Suggested.lean` declarations (context: `universe u`, no `variable` block; every binder is explicit in each signature; compared with the elaborated types in the worker's signature file, nothing lost; no Lean was run in this pass).

| Declaration | Instances tried | Values on each side | Result |
|---|---|---|---|
| `SpectralAlgClosure K` (+ `Field`, `Algebra K`, `Algebra.IsAlgebraic K`, `NormedField`, `NormedAlgebra K` instances) | `K = ℚ_p`: carrier `AlgebraicClosure ℚ_[p]`, norm `spectralNorm.normedField`, equal to Mathlib's `PadicAlgCl.normedField` body; `ℚ_3(√3)`: `‖√3‖ = 3^{-1/2}` | instance classes needed by `spectralNorm.normedField` (`Algebra.IsAlgebraic`) all present | not padding: each instance is used by the headline |
| `CompletedAlgClosure K` | `K = ℚ_p`: unfolds to `UniformSpace.Completion (AlgebraicClosure ℚ_[p])`, the body of `PadicComplex p`; `K` algebraically closed: completion of a complete field, `C = K` | binders `NontriviallyNormedField`, `CompleteSpace`, `IsUltrametricDist` as in Conventions | sound |
| `exists_galois_continuousAut_equiv` | `K = C`: both sides trivial group, bijection 1↔1; `K = ℚ_2`, `S₃`-extension: `(σ*τ)(x) = σ(τ x)` in Mathlib, `(sr)(2^{1/3}) ≠ (rs)(2^{1/3})` in all three choices of `s`, so the second conjunct is the homomorphism, not the anti-homomorphism; `K = 𝔽_p((t))`: `G_K = Aut(K̄/K) ≅ Gal(K^sep/K)`, continuous automorphisms of `C` preserve `K̄`; discontinuous automorphism of `ℂ_p` swapping `t₁, t₂` with `‖t₁‖ = 1`, `‖t₂‖ = p⁻¹` is excluded by `≃A[K]` | four conjuncts each exclude a wrong model: extension clause (trivial `e`), product clause (inverse convention), bijectivity (image only), joint continuity (discrete `G_K`) | true as typed, same generality as README §0.2 |

README targets (values recomputed; "ok" rows list the computed values).

| Target | Instances and values | Result |
|---|---|---|
| 0.1 | `𝔽_p((t))`: `(b_s − t^{1/p})^p = b_s^p − t = s·b_s`, `‖b_s‖^p ≤ max(‖s‖‖b_s‖, ‖t‖)` bounded; `X^{p^e} − tX − b` derivative `−t ≠ 0`; `ℚ_p(√p)`: max-norm gives `‖√p‖² = 1 ≠ ‖p‖` | ok |
| 0.2 | ultrametric estimate: `‖σ̂y − σ̂₀x‖ ≤ max(‖y−a‖, ‖σa−σ₀a‖ = 0, ‖a−x‖)`; `S₃` order check as above | ok |
| 0.3 | `μ_4(ℚ_3)`: `−1` non-square mod 3, order 2 vs `μ_4(K^sep)` order 4; `P^op` direction: one arrow `Spa L → Spa K`, none back | ok |
| 1.1 | `(a∘b)^♮ = b^♮a^♮`: `δ_1 ↦ δ_s ↦ δ_{rs}` vs wrong order `δ_{sr}`; `Tor_n^{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` all `n`; `M_2(𝔽_2)`: `E_{12}e_1 = 0`, `E_{12}E_{21}e_1 = e_1`; `g ↦ (g⁻¹)^♮` left: `((gh)⁻¹)^♮ = (g⁻¹)^♮(h⁻¹)^♮` | ok |
| 1.2 | `L ⊗_K C = ∏_τ C`; `id ⊗ σ̂` sends `(y_τ) ↦ (σ̂ y_{σ⁻¹τ})`, so component `τ ↦ σ⁻¹τ` and `e_τ ↦ e_{στ}`; cubic: rank 3, trace 1 at a transposition, vs regular rank 6, trace 0 | ok |
| 1.3 | (f): `Spa(τ̂⁻¹)∘Spa(σ̂) = Spa(σ̂τ̂⁻¹) = Spa((τστ⁻¹)^)∘Spa(τ̂⁻¹)`; Kummer: `H¹(G_K, (K^sep)^×) = 0` gives `K^×/K^{×n}` | ok |
| 1.4 | `(στ)_X = τ_Xσ_X`; `k = 𝔽_p(u)`: `k̄ ⊗ k(u^{1/p}) = k̄[T]/(T−u^{1/p})^p`; Frobenius on `μ_{ℓ^n}`: `ζ^q` | ok |
| 2.1 | non-qc: stabiliser `ker χ_ℓ`, `[ℚ_p(μ_{ℓ^∞}):ℚ_p] = ∞`; `σ_{X,L} : X_{σL} → X_L` direction | ok |
| 2.2 | `ℚ(2^{1/3})^{⊗2}`: degrees `3 + 6 = 9`, ranks `1, 2, 3` | ok |
| 2.3 | R02; order of 2 mod 3, 9, 27 = 2, 6, 18; `(ℤ/3)²` order 9 | R02 |
| 2.4 | `ℝ ⊂ ℂ`: `(i, 1) ↦ (σ(1), σ(i)) = (1, −i)`; `[ℚ(μ_{ℓ^m}):ℚ] = ℓ^{m−1}(ℓ−1)` | ok |
| 2.5 | `Br(ℚ_2)[5] = ℤ/5`; `H²(ℤ/5(−1)) ≅ H⁰(ℤ/5(2))^∨`, `2² = 4 ≢ 1 (5)`, zero | ok |
| 2.6 | `F_{X_{k̄}} = (F_X × id)∘φ_X`, so `(F_X × id)^* = ρ(φ)⁻¹`; `q = 2`, `ℓ = 7`: `2·4 = 8 ≡ 1` | ok |
| 3.1 | tower `ℤ ←ℓ ℤ`: `lim = 0`, `lim¹ = ℤ_ℓ/ℤ`; `ℤ/ℓ^n ⊗^L ℤ/ℓ^m`: `Tor_1` transitions are multiplication by `ℓ`, pro-zero; `∏_m ℤ_ℓ/ℓ = ∏ ℤ/ℓ` infinite discrete | ok |
| 3.2 | component maps factor through `G_K × H^i_n` discrete; `ℤ_ℓ × H → H_n` through `ℤ/ℓ^n × H_n` | ok |
| 3.3 | basis closed under `∩`, `ℓ^{±1}`; `G·W ⊆ U` by finite subcover; `A = ∏ ℤ_ℓ`: `e_m ∈ ℓΩ` for large `m`; `A = ℚ_ℓ` indiscrete: `Ω = V` only | ok |
| 4.1 | elliptic curve: `χ·χ⁻² = χ⁻¹` vs `χ³`; `n = 7`, `q = 2`: `4` vs `1`; `ℙ¹`: `1 = 4·2` | ok |
| 4.2 | R03; `Y = Spec L` permutation values as in 1.2 | R03 |
| 4.3 | Artin–Schreier: `a_{2^k(2m+1)} = c_m^{2^k} = c_m`; units `1 + aT^m`: `‖u − 1‖ = ‖a‖`, case `‖h‖ ≤ ‖p‖^{1/(p−1)}` gives `≤ ‖p‖^{p/(p−1)} < ‖a‖`, other case reduction in `k[T^p]`; surjective transitions from `H^{N+1}(ℤ/ℓ(j)) = 0` | ok |
| 4.4 | R01; `ℙ^d`: degrees `0, 2, …, 2d` | R01 |

## Dependency check

```
depcheck: 206 roadmaps, 1901 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Later roadmaps named in the README (PadicHodgeTheory, ClassicalAdicEtaleCohomologyPartII and the downstream consumers) occur only as consumers or as owners of statements this roadmap does not plan.

## Verified sound

- **Declarations read:** 3 named declarations and 5 instances of `Suggested.lean`, every line. Imports (`import Mathlib` only), no `set_option`, no `lemma`, no sorry'd data, one module docstring listing the headlines that are not statable. No padding found: the two definitions and five instances are all used by the one theorem. The docstring's "not statable" claims were checked at the pin: no continuity of base change for `Scheme.smallEtaleTopology` in Mathlib's `AlgebraicGeometry/Sites`, no étale site on Tau Ceti's adic spaces.
- **Targets read:** all 20 sections (0.1–0.3, 1.1–1.4, 2.1–2.6, 3.1–3.3, 4.1–4.4), Conventions, contracts, Examples and Worked examples, every line.
- **Checks tested:** 87 Checks recomputed; 86 correct, 1 false in part (R01). Every definition has at least three Checks.
- **Locators verified against the texts (38):** dejongvanderput1996 lines 1159, 1201, 1476–1488, 1571–1587, 1594–1606 with pages 28, 29, 36, 38, 39; stacks03N1 lines 3733, 3745, 3746, 3963–3969, 4216, 4229, 4241; milneLEC lines 3237, 3834–3866, 3940, 4133, 4534, 4783, 4860 with their pages; stacks01FQ lines 1451, 1515, 1525 with tags; zavyalov2025 lines 3798, 3800 and Theorem 5.4.2; hansenzavyalov2023 lines 1684, 1706, 1708; huber2007 lines 953, 963, printed page 996, hypotheses (`k` algebraically closed, torsion prime to the residue characteristic, no hypothesis on `char k`, lines 949–951); berkovich1993 lines 4584, 5110, 5339 with printed pages 128, 143, 150; scholze2013 line 1279.
- **Pinned declarations checked (45):** every Mathlib and Tau Ceti name and line number of the contracts; all correct except the list of R04. `Field.absoluteGaloisGroup` is `AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K` (line 42); `ContinuousAlgEquiv` has no group instance in its file; `IsAlgClosed.of_denseRange` assumes `CharZero`; `Module.Finite.of_quotient_smul_top` has exactly the hypotheses quoted; `TauCeti.ContinuousRep (Γ A M)` argument order matches the README's use.
- **Sibling citations checked (62):** every cited section, slug and declaration name exists where cited: ClassicalAdicEtaleCohomology §§1.1, 1.3, 1.4, 1.5, 7.1, 8.2, 8.4, 9.7, 11.1 and AInfCohomology §AI.3.1 (`AInf.primitive_mod_p_comparison`), ArithmeticGaloisRepresentations §§1.1–1.2 (*TateTwist.zlOne*, `tateTwist`), PadicDifferentialEquationsAndRigidCohomology §RD.0.33, PadicPeriodRings §§1.1, 2, DiamondsAndVStacks §D6.7 at the heads of their open pull requests; AdicEtaleGeometry (A1.1, A1.6, A1.7, A1.14 and the six names), AdicSpacesPartII (§§R0.6, R0.7, R1.1, R1.2, R1.7), AdicSpacesPartIV R4, SchemeAndStackFoundations (§§0.23a, 1.10, 2.1, 2.2, 2.15, 2.16 and the twelve names), EtaleCohomologyFoundations (ten sections, seven names), EnhancedDerivedSheaves §§0.1–0.4, DerivedModuleAlgebra §1.T.1, ProfiniteCohomology Layers 0, 1, 10 (§§10.3, 10.4) on main. Hypotheses compared for A1.14 (qcqs, locally of finite type, separable algebraic `L/K`), §2.15 (`etale_cohomology_limits`: qcqs, affine transitions), §F.4.1 (locally noetherian, `ℓ` invertible), §8.4 (proper, `dim.tr f ≤ d`, any `ℤ/n`), §9.7, §11.1, §AI.3.1: all as the README states them. The README's statement that ClassicalAdicEtaleCohomology §1.1 records `H^n(Spa(K, 𝒪_K), F) ≅ H^n_cont` only as a Check is accurate, so §2.5 keeps that target.
- **Ownership against open work:** searched the open roadmap heads and main for the general identification `G_K ≅ Aut_cont(C/K)` and for the three Lean names; only the narrower forms the README already lists (PadicPeriodRings §1.1 and its consumers) occur. No `Suggested.lean` name collides.
- **Gap:** `gap:proper-rigid-finiteness` has the same slug and `needs` in `design/plan.json` and in the README, a named supplier and section, one precise sentence, and asks for nothing §9.7 or §11.1 already gives.
- **Policy:** the pull request changes only the package folder; no pull-request numbers, process words, `lemma` or `set_option` in the README or the Lean file.

## Not verifiable

- huber1996 (Proposition 2.3.10, Corollary 2.4.6, Corollary 2.8.3, Theorem 3.7.2 page 226, Proposition 6.1.1), huber1994 §§1–3, sga4half (Arcata, Rapport), serreGC1997 Chapter I §2: recorded as uncertified, texts not read; the locators agree with those the supplier ClassicalAdicEtaleCohomology gives for the same results.
- Elaboration of `Suggested.lean`: no Lean was run in this pass; the elaborated types were taken from the worker's signature file, which lists all three declarations with no lost binder.
- PadicPeriodRings §2 and DiamondsAndVStacks §D6.7: existence of the sections and names was checked; the README's description of how their statements are narrower than Layer 0 was not checked line by line.
- The claim in §3 Examples that `H¹(X_C, ℤ_p)` of the closed disc is not finitely generated was checked only through the argument of the last Check of §4.3, not against a source.

## Source issues

- **Gap** in dejongvanderput1996 at Corollary 3.7.5, printed page 39: the source says the spectral sequence holds for any abelian sheaf, but its proof identifies the cohomology of the geometric fibre with the stalk of the direct image only for overconvergent sheaves; it should either assume overconvergence or justify the identification for general sheaves; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d3349976f751079728304bbd7b02bbc98c4a89ea", "job": "RT-GaloisActionOnEtaleCohomology~1b", "model": "fable", "worker": "chris-x8"} -->
