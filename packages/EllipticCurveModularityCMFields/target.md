Verdict: part-ii
Name: EllipticCurveModularityImaginaryQuadraticPartII
Base: EllipticCurveModularityImaginaryQuadratic
Owner: none

## Scope

The roadmap is **"EllipticCurveModularityImaginaryQuadratic, Part II: all CM fields"**. It proves that every elliptic curve over every CM number field is modular, with the same automorphic conclusion and local–global compatibility as the base. The filed name EllipticCurveModularityCMFields is replaced by the Part II name, as the board's Part II convention requires (compare RealReductiveGroupsStructure → LieGroupsPartII). The job's files stay in `packages/EllipticCurveModularityCMFields/`, because the job id is fixed.

Below, ECMIQ means EllipticCurveModularityImaginaryQuadratic (roadmap pull request #1048, merge order 183).

**Where the base stops.** ECMIQ ends at `imaginary_quadratic_modularity` (§8.6). Its section "Downstream consumers and boundaries" puts the extension to other CM fields outside its scope. It also warns that ζ₅ ∉ K does not imply ζ₅ ∉ F = K(μ₃ₚ), with the example K = ℚ(ζ₁₅ + ζ₁₅⁻¹, i), so that over such a K the seed at 5 must be proved before the cyclotomic base change. In ECMIQ the imaginary quadratic hypothesis enters in only two places: the ramification proof of ζ₅ ∉ F in §5.1, and the specialization of Layer 8 to imaginary quadratic K (§§8.2–8.4). Layers 1–4, Layer 6 and §7.4 are stated over arbitrary number fields. ECMIQ's CM interfaces are already general:

- the seed criterion `cm_modularity` (§5.3) holds over any CM field L with ζ₅ ∉ L;
- the lifting theorem `potentiallySemistableCM` (§5.2) holds over any CM field;
- `switch_five` and `modular_elliptic_all_coefficients` (§0.3) carry no ζ₅ hypothesis.

This Part II starts exactly there.

**Notation.** K is a CM field and E/K an elliptic curve. The prime p and the parameter t ∈ U(K) are chosen by ECMIQ §§7.2–7.4. Put n = 3p and F = K(μₙ). B_t is the quadratic twist of E, A_t is the auxiliary elliptic curve (the quotient of C₃(t) by the reflection w), and V_θ are the character pieces (ECMIQ §§1.1, 4.1–4.2). The conventions (cohomological H¹, determinant ε⁻¹, geometric Frobenius, unitary normalization) are ECMIQ's.

**This roadmap owns:**

1. **The seed before base change (route 1, ζ₅ ∉ K).** A_t is proved modular over K, not over F, and then base-changed to F. This includes descending ECMIQ §7.4's F-level residual outputs for A_t[5] to K. Since ζ₅ ∉ K does not give ζ₅ ∉ F, ECMIQ's order (seed over F) is not available. Source: LeHung26 §4.6 and Remark 4.2 (LeHung26 lines 342–355).
2. **The general-K assembly.** The three lifts at p, 3, p over F = K(μ₃ₚ), descent along F/K, removal of the twist, all-place local–global compatibility and the CM branch, for an arbitrary CM field K. The input is an automorphic seed for V_η over F, from whichever route supplies it. This applies ECMIQ's lifting table and descent lemma over a general CM base and re-plans no ECMIQ proof (LeHung26 §§4.3, 4.6 and 5, lines 292–366).
3. **The Steinberg-protected lifting theorem at 5 (route 2), in general form.** This is a potentially Barsotti–Tate lifting theorem over CM fields at p = 5 in exactly the configuration that CN Theorem 5.2(4) and CrystallineLocalGlobalCompatibilityCM §9.12 exclude: residual image SL₂(𝔽₅) with ζ₅ in the field. It holds under the extra hypothesis of a "protected" place v ∤ 5, where residual inertia is a nontrivial unipotent and both the lift and the automorphic source are Steinberg-type. The roadmap owns:
   - the self-annihilating Steinberg tangent line;
   - the exclusion of the exceptional classes in H¹(SL₂(𝔽₅), ad⁰) from the dual Selmer group;
   - Taylor–Wiles prime selection in this case;
   - the Steinberg condition on Hecke-valued representations;
   - the patching argument;
   - the solvable preparation that keeps the protected place.

   Source: CaptainSude26 §§3–4, Theorem 4.2 (CaptainSude26 lines 174–498).
4. **The protected auxiliary curve (route 2, ζ₅ ∈ K).** This has three parts:
   - the width-three split multiplicative degeneration of A_t, which gives a local open in which 5 ∤ v(Δ_min(A_t)) at one place above an auxiliary prime q;
   - the modular source with a retained protected place;
   - modularity of A_t over K.

   Source: CaptainSude26 §5 (lines 499–609).
5. **The headline over every CM field.** Route 2 over K′ = K(μ₅), then abelian descent, together with the CM branch (CaptainSude26 Theorem 1.1, proof at line 671).

**Imported, never re-planned** (exact sections in Suppliers):

- From ECMIQ: the covers, degenerations, integral monodromy and congruences (Layers 1–4); Serre's large-prime theorem (§5.1); `potentiallySemistableCM` (§5.2); `cm_modularity` (§5.3); the seed constructions and their local types (§0.3); the local prescription (Layer 6); the simultaneous specialization (§§7.2–7.4); change of coefficient prime and automorphic local types (§8.1); cyclic descent (§8.4); the CM realization (§8.6).
- From CrystallineLocalGlobalCompatibilityCM: CN's integral local–global compatibility, non-neat PGL₂ complexes, prepared patching and the qualified lifting theorem (§§7.5–7.7, 8.1–8.7, 9.1–9.12). Route 2 reuses this machinery with one changed local condition and one changed Taylor–Wiles step. It does not rebuild it.

**Not in scope:**

- Totally real fields. They belong to TARGET-EllipticCurveModularityTotallyReal (#3439), a separate design with different lifting theorems.
- Number fields that are neither CM nor totally real.
- GL₂-type abelian varieties.
- The exceptional modular-curve analysis of CN §7, owned by ModularityAndLanglandsExtensions §2.30.
- Any height-density statement (ModularityAndLanglandsExtensions §2.29).

**Corrections to the filing.**

1. The CN Theorem 6.1 consequence is owned by ECMIQ §5.3 `cm_modularity`. The CN lifting theorem is owned by ECMIQ §5.2 and CrystallineLocalGlobalCompatibilityCM §9.12. ModularityAndLanglandsExtensions §2.29 is a downstream adapter of those ECMIQ outputs (its own *Needs* line and ECMIQ's boundary section both say so), so it is not a supplier. Importing it would also wrongly move this roadmap after ModularityAndLanglandsExtensions in the merge order.
2. In LeHung26, "4.1" is the subsection "The lifting theorem". It quotes CN Theorems 5.2 and 6.1 and states no new theorem. The local-reduction input is "Geometric input 4.1" in §4.2 (LeHung26 lines 274–291).
3. The CaptainSude manuscript at tag v1.0.0 has 15 pages, not 6. A later tag v1.0.1 is described as an attribution revision.
4. The PDF title of LeHung26 matches the filing. The Hexagon landing page lists a different title ("Modularity of elliptic curves over totally real field and CM fields not containing ζ₅"); see `sources.toml`.

**Generality.** The filed headline already has the right generality: every CM field and every elliptic curve. Two choices are made here:

- The ζ₅ ∉ K theorem is kept as its own final target (T1), because it rests only on published lifting theorems. The unrefereed route 2 is needed only when ζ₅ ∈ K.
- The route-2 lifting theorem is stated for an arbitrary ρ, not just for H¹(A_t). The prepared form (CaptainSude26 Theorem 4.2) and the elliptic application become supporting targets and Checks.

## Final targets

"Modular" has ECMIQ's full meaning.

- For non-CM E it means a cuspidal weight-zero π_E of GL₂(𝔸_K) with trivial central character, realizing H¹(E) at every ℓ and every ι. Its Frobenius-semisimple Weil–Deligne parameters, with N retained, agree with rec^T(π_{E,v}) at every v ∤ ℓ. All finite local factors agree, the complex parameter is ECMIQ's, and L(E/K, s) = L(π_E, s − 1/2).
- For geometrically CM E it means the automorphic induction from KM, or the isobaric sum when M ⊂ K, as in ECMIQ §8.6.

**T1 `cm_modularity_zeta5_free`.** Let K be a CM field with ζ₅ ∉ K. Then every elliptic curve E/K is modular. The route is T2, then T3. Its only lifting inputs are CN Theorems 5.2 and 6.1.

- Source: LeHung26 Theorem 1.1, p.2 (LeHung26 line 86). Its CM statement is conditional on OpenAI's geometric Inputs 2.1, 2.2 and 4.1. ECMIQ owns those inputs (Layers 1–4 and 6), so T1 is unconditional relative to ECMIQ.
- Proof: LeHung26 §4.6, p.9 (line 342), and Lemma 5.1, p.9 (line 357).

**T2 `cm_seed_before_base_change`.** Let K be CM with ζ₅ ∉ K and E/K non-CM. Take p and t ∈ U(K) from ECMIQ §7.4 `simultaneous_specialization`, inside the opens of ECMIQ §6.5. Then:

- (a) A_t[5] is decomposed generic over K and absolutely irreducible on G_{K(ζ₅)};
- (b) A_t is modular over K, by ECMIQ §5.3 `cm_modularity` applied with L = K;
- (c) its base change to F = K(μ₃ₚ) is cuspidal and realizes V_η = H¹(A_t)|G_F.

Part (a) is a lemma owned here. Decomposed genericity over F of a representation of G_K implies decomposed genericity over K: a rational prime that splits completely in F splits completely in K, with the same local Frobenius elements. Absolute irreducibility on G_{F(ζ₅)} implies it on the larger group G_{K(ζ₅)}. Cuspidality in (c) holds because A_t[5] stays irreducible over F (ECMIQ §7.4(1)). Base change runs through a prime-cyclic tower: GL2AutomorphicRepresentationsAndTransfer R17.4.2, R17.4.5 and R17.4.8, with PotentialAutomorphyInfrastructure §2.3.

- Sources: LeHung26 §4.4, the last two sentences of "All conjugates" (lines 318–321); §4.5(1) (line 336); §4.6 and Remark 4.2 (lines 343–355). CN23 Theorem 6.1, p.87 (CN23 line 4513), with Lemma 6.1.4, p.88 (line 4562), which is where ζ₅ ∉ F is used.
- **Check:** K = ℚ(ζ₁₅ + ζ₁₅⁻¹, i) is the fixed field of {1, 29} in (ℤ/60)ˣ. It is CM, and ζ₅ ∉ K because 29 ≢ 1 mod 5. Since also 29 ≢ 1 mod 3, [K(ζ₃):K] = 2 and K(ζ₃) = ℚ(ζ₆₀) ∋ ζ₅. So `cm_modularity` cannot be applied over F there, while T2 applies.
- **Check:** for imaginary quadratic K, T2 and T3 recover ECMIQ's `imaginary_quadratic_modularity`.

**T3 `cm_switch_assembly`.** Let K be any CM field (ζ₅ ∈ K allowed) and E/K non-CM, with p and t as in T2 (and, on route 2, also in the extra opens of T5). Suppose V_η is realized over F = K(μ₃ₚ) by a cuspidal weight-zero representation of PGL₂. Then E is modular over K. The proof has four steps:

1. Lift V_η → V_χ → V_ψ → V₁ at p, 3, p over F with ECMIQ §5.2 `potentiallySemistableCM`. The hypotheses come row by row from the table in ECMIQ §8.3. The local matching at places above 3p comes from §§6.5–6.6 and §8.1, and the changes of coefficient prime from §8.1.
2. Descend along F/K through a prime-cyclic tower with ECMIQ §8.4 `cyclic_representation_descent`. Every field between K and F is CM, being a totally imaginary subfield of a CM field.
3. Twist back from B_t to E.
4. Get all-place compatibility from ECMIQ §0.3 `modular_elliptic_all_coefficients` and §8.5.

Sources: LeHung26 §4.3 (line 292), the §4.6 table (lines 344–351) and §5 (lines 356–366); CaptainSude26 Proposition 6.2 (line 634); OpenAI26 Proposition 9.3 and Lemma 9.4, pp.26–27.

- **Check:** the lifting primes are 3 and p > 100, so the exceptional clause at p = 5 never arises in T3, even when ζ₅ ∈ F (LeHung26 line 354).

**T4 `steinberg_protected_lifting`.** Let F be a CM field, ι: Q̄₅ ≅ ℂ, and ρ: G_F → GL₂(Q̄₅) continuous. Assume conditions (1)–(3) and (5) of CN23 Theorem 5.2 at p = 5 (CN23 lines 3849–3870). In place of condition (4), assume: either (4) holds, or there is a nonempty finite set P of places v ∤ 5 of F such that at each v ∈ P:

- ρ̄|G_{F_v} has the local form of CaptainSude26 Lemma 3.1: residual tame inertia acts through a nontrivial unipotent, and residual Frobenius is trivial after changing its tame lift;
- every element of ρ(I_v) is unipotent;
- π_v has Iwahori-fixed vectors, so r_ι(π)|I_v is unipotent and π_v is an unramified twist of Steinberg.

Then ρ ≅ r_ι(Π) for a cuspidal weight-zero Π of PGL₂(𝔸_F).

Remarks on the statement:

- With det ρ = ε₅⁻¹, condition (4) fails only when ζ₅ ∈ F and the residual image is conjugate to SL₂(𝔽₅). This follows from the argument of CN23 Lemma 6.1.4 (line 4562), which uses only the determinant. So the new content is the case F ⊇ μ₅. Since ζ₅ ∈ F_v forces q_v ≡ 1 mod 5, the tame relation makes residual Frobenius commute with the unipotent. The design may widen the first bullet to an unramified quadratic twist of this form, since ad⁰ is unchanged by the twist.
- The prepared form is CaptainSude26 Theorem 4.2, p.9 (line 410). It holds in the setting of pp.6–7 (lines 264–289), with S = S₅ ⊔ R ⊔ P, the conjugates of P outside S, and the field conditions of CN §5.6 (5)–(6).
- The unprepared form follows from the solvable preparation of CrystallineLocalGlobalCompatibilityCM §9.11. That preparation must have ramification index prime to 5 at every place above P (for instance, split there), so that residual inertia stays nontrivial and the protection survives.

Supporting targets:

- **T4a `steinberg_tangent_self_annihilating`:** CaptainSude26 Lemmas 3.1–3.2, pp.4–5 (lines 177–226). Take F_v ⊇ μ₅ with v ∤ 5, and ρ̄ with ρ̄(τ) = U a nontrivial unipotent and ρ̄(φ) = 1. Then:
  - the Steinberg condition at v (every inertia element has characteristic polynomial (X − 1)²) is formally smooth;
  - H¹(F_v, ad⁰ρ̄) is 2-dimensional (the local Euler characteristic with h⁰ = h² = 1);
  - the Steinberg tangent line is the unramified line, and under local Tate duality (with M(1) ≅ M) it is its own annihilator.

  Smoothness of the ring is imported from LocalGaloisDeformationRings §2.3 (minimally ramified lifts, CHT Corollary 2.4.18). The tangent and duality computation is owned here.
- **T4b `exceptional_classes_ramify`:** CaptainSude26 Lemma 3.3, p.5 (line 231). Let M be the adjoint trace-zero representation of SL₂(𝔽₅) over 𝔽₅. Then restriction from H¹(SL₂(𝔽₅), M) to the order-five subgroup ⟨U⟩ is injective (index 24 is prime to 5), and H¹(⟨U⟩, M) is the line spanned by the class of f = E₂₁. So every exceptional class, after inflation, is ramified at every protected place and violates the dual Steinberg condition. ArithmeticGaloisRepresentations §7.9 records (in a Check) that H¹(SL₂(𝔽₅), ad⁰) ≠ 0, which is why SL₂(𝔽₅) is not adequate. The injectivity and the inertial consequence are owned here.
- **T4c `protected_taylor_wiles_primes`:** CaptainSude26 Lemma 3.4, pp.5–6 (line 242). This replaces AKT23 Lemma A.5 (AKT23 line 3979, p.86) and the selection target of CrystallineLocalGlobalCompatibilityCM §9.3 in this case. The relative dual Selmer group with the dual Steinberg condition at P is killed at every cyclotomic depth by degree-one primes whose Frobenius is conjugate to diag(2, 3).
- **T4d `protected_hecke_condition`:** CaptainSude26 Lemma 4.1, p.6 (line 291). It uses AutomorphicGaloisRepresentationsPartII AG2.5 (ACC23 Theorem 3.1.1, p.58) at full Iwahori level with trivial character at P.
- **Check:** with an unframed protected place, the presentation count gives g = r − 3d − 1 + t (CaptainSude26 line 439), where d = [F⁺:ℚ]. The protected place contributes dim L_v − h⁰ = 1 − 1 = 0, so the patching deficit is still ℓ₀ = d.
- **Check:** at a split multiplicative place with 5 | v(Δ), the Tate 5-torsion is unramified, so such a place protects nothing.
- **Check:** an inertia image of order 5 that acts through ζ₅^{±1} reduces to a nontrivial unipotent. So "ρ(I_v) unipotent" is a separate hypothesis, not a consequence of the form of ρ̄.

**T5 `protected_auxiliary_seed`.** Let K be CM with μ₅ ⊂ K and E/K non-CM. Then p and t can be chosen as in ECMIQ §7.4, with finitely many extra local opens away from 3p, so that A_t[5] has image SL₂(𝔽₅) and is decomposed generic, and A_t is modular over K. Supporting targets:

- **T5a `width_three_degeneration`:** CaptainSude26 Lemma 5.1, p.10 (lines 503–532).
  - At the boundary point R_* of exact order 2n = 6p (ECMIQ §2.1), the reflection w exchanges two of the three nodes of ECMIQ §2.3's nodal model for m = 3 and fixes the third. The quotient is then of type I₃ for A_t and its Jacobian.
  - The Tate parameter of A_t has order three in the smoothing parameter s.
  - Hence, at a place v above a suitable rational prime q ≥ 7, a nonempty v-adic open gives A_t split multiplicative reduction with v(Δ_min) = 3k and 5 ∤ k, while A_t has good reduction at the other places above q.
- **T5b `protected_modular_source`:** CaptainSude26 Proposition 5.2, pp.11–12 (line 538). It strengthens ECMIQ §0.3 `switch_five`. The output is a solvable CM extension F/K that satisfies the prepared field conditions of T4 and is split at every place above q, together with a modular non-CM B/F such that B[5] ≅ A_t[5] and B keeps split Tate reduction at the protected places. The proof uses GL2ModularityLifting §1.7 (CHT08 Lemma 4.1.2, p.116), CN23 Proposition 6.1.5, pp.88–89 (line 4574), and the imaginary-quadratic auxiliary fields of ACC23 §6.5.12 (ACC23 line 7163).
- **T5c:** T4, then solvable descent, gives A_t modular over K (CaptainSude26 Corollary 5.3, p.12, line 604).

**T6 `cm_field_modularity` (headline).** Every elliptic curve over every CM number field is modular, in the sense above. The proof has two cases:

- Non-CM E: apply T5 and T3 over K′ = K(μ₅), which is CM and abelian over K, then descend along K′/K with ECMIQ §8.4. When ζ₅ ∉ K, T1 gives an independent proof that avoids T4.
- CM E: apply ECMIQ §8.6 `cm_elliptic_realization` over a general K.

Sources: CaptainSude26 Theorem 1.1, p.1 (line 26), with its proof on p.14 (line 671); LeHung26 Remark 1.3.1 (line 125), which cites CaptainSude26 for the removal of the ζ₅ hypothesis.

- **Check:** K = ℚ(ζ₅) contains ζ₅ and its only quadratic subfield, ℚ(√5), is real. Only T6 covers it. T4's prepared field condition (every relevant rational prime splits in an imaginary quadratic subfield) is reached only after solvable base change; compare the last Check of CrystallineLocalGlobalCompatibilityCM §9.3.
- **Check:** for a CM curve, M ⊂ K gives the isobaric sum and M ⊄ K gives cuspidal induction, exactly as in ECMIQ §8.6's Checks.

**`Suggested.lean`.** As in ECMIQ, the pins have no automorphic representations of GL₂ over number fields. T1, T3, T4 and T6 therefore go in the module docstring as not statable. Statable candidates include:

- the field example in T2's Check, using Mathlib's `NumberField.IsCMField` and `IsCyclotomicExtension`;
- the finite-group statement T4b, using Mathlib's `groupCohomology` on `SL(2, ZMod 5)`;
- the descent of decomposed genericity in T2(a), on Tau Ceti's `WeierstrassCurve.torsionGaloisAction`, if a residual predicate can be phrased without sorry'd data.

## Suppliers

All suppliers are on main or earlier in the merge order. Insert this roadmap immediately after EllipticCurveModularityImaginaryQuadratic (position 183), before ModularityAndLanglandsExtensions.

- **EllipticCurveModularityImaginaryQuadratic** (#1048, 183), the base:
  - §0.2 `fixed_pairing_twist`, `fixed_pairing_twist_rational`;
  - §0.3 `solvable_preparation`, `hilbert_local_selection`, `switch_five`, `modular_elliptic_all_coefficients`, `auxiliary_local_types`;
  - §2.1 `boundary_regular_model` and §2.3 `nodalModel` (for T5a);
  - Layers 1, 3 and 4 (the covers, integral monodromy, `prime_switch_congruences`);
  - §5.1 `nonCM_elliptic_large_residual_primes`;
  - §5.2 `potentiallySemistableCM`;
  - §5.3 `cm_modularity`;
  - §§6.5–6.6 `local_type_opens`, `character_local_types`;
  - §§7.2–7.4 `simultaneous_specialization`;
  - §8.1 `character_automorphy_change_prime`, `character_automorphic_local_type`;
  - §8.3 `three_lift_automorphy` (its table);
  - §8.4 `cyclic_representation_descent`;
  - §8.5 `elliptic_full_local_comparison`;
  - §8.6 `cm_elliptic_realization`.

  §§8.2–8.6 are stated after specializing to imaginary quadratic K, but their proofs do not use that hypothesis. The design first asks ECMIQ to state §8.3 (given a seed over F), the descent step of §8.4 and §8.6 over an arbitrary CM field K, as the totally real triage asked for §8.6. Only if that is declined does it state the general-K applications here, as T3.
- **CrystallineLocalGlobalCompatibilityCM** (#1182, 182):
  - §§7.5–7.7 (CN23 Theorem 4.2.15 and crystallinity at p);
  - §§8.1–8.7 (non-neat PGL₂ complexes, CN23 Proposition 5.5.3, perfectness);
  - §§9.1–9.12, especially §9.1 (prepared hypotheses), §9.3 (AKT Taylor–Wiles data with the p = 5 exception that T4c replaces), §9.4, §§9.5–9.9 (the χ-type problem, the patching complexes and CN23 Lemma 5.6.4), §9.10 (the special-case lifting), §9.11 (solvable preparation) and §9.12.
- **PotentialAutomorphyInfrastructure** (#1081, 181): §2.1 (genericity under restriction) and §2.3 (soluble base change and descent, ACC23 Proposition 6.5.13).
- **AutomorphicGaloisRepresentationsPartII** (#1006, 154): AG2.5 (torsion local–global compatibility away from p, ACC23 Theorem 3.1.1) and AG2.6–AG2.7 (Galois representations over CM fields; Varma's comparison).
- **PotentialModularityAndCompatibleSystems** (#1075, 164): §§2.12–2.16 (solvable CM preparation).
- **GL2ModularityLifting** (#1071, 163): §1.7 (soluble extensions with prescribed completions, CHT08 Lemma 4.1.2).
- **GL2AutomorphicRepresentationsAndTransfer** (#931, 88): R17.4.2–R17.4.5 and R17.4.8 (prime-cyclic base change, its all-place compatibility, descent, the cuspidality criterion and solvable towers), `quadraticInduction`, and R16.3 (local parameters, including Steinberg monodromy R16.3.2).
- **GlobalGaloisDeformations** (#920, 75): §§3.6–3.7 (relative tangent spaces and presentations) and §§5.1, 5.6 (Taylor–Wiles data, shared Chebotarev selection).
- **LocalGaloisDeformationRings** (#923, 74):
  - §2.3 (minimally ramified lifts; the ring at the protected place);
  - §§2.4–2.5;
  - §§4.14–4.15 and 6.6 (Barsotti–Tate and ordinary rings, CN23 §5.3).
- **DeformationAndDerivedPatchingAlgebra** (#1034, 59): §§8.1–8.5 (abstract patching).
- **ArithmeticGaloisDuality** (#858, 43): D7 (local Tate duality over finite coefficients, D7.4 and D7.7).
- **ArithmeticGaloisRepresentations** (#856, 42): Layer 4 with §4.7 (finite subgroups of GL₂, restriction and large image), §7.9 (adequate subgroups, including the failure of adequacy for SL₂(𝔽₅)) and §6.1 (the Tate module).
- **EllipticCurves** (main): Layer 4 (Tate curves and reduction types).
- **NeronModelsAndSemistableAbelianVarieties** (#852, 47): §3.5 (the toric–finite filtration of the Tate module).
- **Pinned libraries:** Mathlib's `NumberField.IsCMField`, `IsCyclotomicExtension` and `groupCohomology`; Tau Ceti's `WeierstrassCurve.torsionGaloisAction` and `WeierstrassCurve.quadraticTwist`.

## Consumers

No roadmap on main, at an open head or on the board cites this endpoint yet. Likely consumers, all later in the merge order:

- The closure's combined headline with TARGET-EllipticCurveModularityTotallyReal (#3439): modularity over all totally real and all CM fields.
- ModularityAndLanglandsExtensions (184 onward), whose CM-field elliptic inputs (§2.29) could then drop the hypothesis ζ₅ ∉ F.
- Arithmetic applications that need an entire L(E/K, s) over CM fields, in the way BianchiModularForms uses `imaginary_quadratic_modularity`.

A general CM-field lifting theorem like T4 could also serve the consumers of CrystallineLocalGlobalCompatibilityCM. If that roadmap's author prefers to own T4 as a continuation of its §9.12, ownership moves there and this roadmap imports it. The direction of supply does not change.

## Sources

All works below are in `packages/EllipticCurveModularityCMFields/sources.toml` and were read through the sources service. Nothing is missing.

**Unrefereed sources the route rests on:**

- **LeHung26:** Le Hung, *A geometric prime switch for elliptic curves over totally real and CM fields*, discussion draft, 7 October 2026, hexagon:2610.00156v1. CC BY 4.0, from the Hexagon open repository (hexagonmath.org), marked as a mixed human/AI draft. It covers route 1: Theorem 1.1 (line 86), Remark 1.3.1 (line 125), §4 (lines 272–355) and Lemma 5.1 (line 357).
- **CaptainSude26:** CaptainSude (pseudonymous), *Every elliptic curve over a CM number field is modular*, tag v1.0.0, 7 October 2026, 15 pages. Read from the author's GitHub repository. No licence is stated, so it is cited with provenance only and no passage is copied. It covers route 2: §§3–6, Theorem 4.2 (line 410), Theorem 1.1 (line 26).
- **OpenAI26:** OpenAI, *Modularity of elliptic curves over imaginary quadratic fields*, 4 October 2026, openai/math at revision adc7f124. It is the base's source, fetched here so that ECMIQ's map from sections to source can be checked.

**Refereed or open-repository sources:**

- **CN23:** Caraiani–Newton, arXiv:2301.10509v3. Theorem 5.2, pp.73–74 (line 3849); Theorem 6.1, p.87 (line 4513); Lemma 6.1.4, p.88 (line 4562); Proposition 6.1.5, pp.88–89 (line 4574); §§5.3–5.6. Open repository.
- **AKT23:** Allen–Khare–Thorne, arXiv:1910.12986v2, published in Camb. J. Math. 11 (2023). Corollary 5.5; Theorem 5.11; Lemma A.2; Proposition A.4; Lemma A.5, p.86 (line 3979); Proposition A.6, p.87. Open repository, preprint numbering.
- **ACC23:** Allen et al., arXiv:1812.09999v2, published in Ann. of Math. 197 (2023). Lemma 2.2.3; Theorem 3.1.1, p.58; Lemma 6.2.4; §6.4; §6.5.12 (line 7059, auxiliary imaginary quadratic fields at line 7163); Proposition 6.5.13. Open repository.
- **CHT08:** Clozel–Harris–Taylor, Publ. Math. IHÉS 108 (2008). Lemma 4.1.2, p.116 (line 5723). Numdam open archive.

**Licence:** LeHung26 is CC BY 4.0. The CaptainSude manuscript has no stated licence. Everything else is cited only. No passage of any source is copied.

## Risks

- **Route 2 rests on one unrefereed, pseudonymous, AI-assisted manuscript.** The design must re-derive T4 and T5 independently and must not cite them as established. I checked the local computations myself: the 2-dimensional local H¹, the self-dual Steinberg line, injectivity into the Sylow-5 cohomology and the presentation count. The global steps I checked only for plausibility. The points the design must verify are:
  - (i) that the augmented relative dual Selmer group of T4c really vanishes once the dual condition at P is the unramified line, with no condition imposed at the framing set;
  - (ii) T4d, the passage of the inertial identity (X − 1)² through non-neat levels and nilpotent ideals;
  - (iii) that the integral comparisons of CN §5.6, which CrystallineLocalGlobalCompatibilityCM plans with clause (4) in force, use that clause only through Taylor–Wiles selection;
  - (iv) the I₃ type and the cubic Tate parameter in T5a, which depend on how w acts on the three nodes of ECMIQ §2.3's nodal model for m = 3;
  - (v) that `switch_five` can keep the protected place, a split prime and CN's §5.6 field conditions all at once (T5b).

  If T4 fails, the roadmap still delivers T1 (all CM fields with ζ₅ ∉ K), and the headline T6 must then be withdrawn to T1.
- **Route 1 also rests on unrefereed drafts:** LeHung26 (a discussion draft) and OpenAI26 (through ECMIQ). Its lifting inputs, however, are only CN23 Theorems 5.2 and 6.1. The design must confirm the one new step, the descent of decomposed genericity from F to K in T2(a), against CN23's definition of decomposed generic (Definition 2.1.27).
- **ECMIQ's statements for imaginary quadratic K.** These are §§8.2–8.6. If ECMIQ does not generalize them, T3 states them here as applications. This is a coordination risk, not a mathematical one.
- **Depth.** T4 is a full CN-style patching argument over CM fields. Its foundations (non-neat PGL₂ complexes, CN23 Theorem 4.2.15, ACC23 Theorem 3.1.1) sit in CrystallineLocalGlobalCompatibilityCM and AutomorphicGaloisRepresentationsPartII, far above the current library. Nothing in this roadmap can be proved before those roadmaps land.
- **Statability.** At the pins there are no automorphic representations, Galois deformation rings or locally symmetric spaces. `Suggested.lean` can state only the field-theoretic and finite-group targets listed above, and must record the automorphic headlines in its docstring.
