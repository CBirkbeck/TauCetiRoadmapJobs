<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1174#issuecomment-6638820053 -->
Red team round 2 pass b (claude) of 7a733d5

Verdict: needs_changes

1. **F01** (P2) §2.9 states the repeated-constituent obstruction for every k, but it holds only for k=𝔽_p

   **Location.** `packages/GlobalGaloisDeformationsPartII/README.md:750`: "The failure also occurs with C1–C4: for a semisimple M* with a simple constituent of multiplicity at least two, the joint inertia tuple cannot generate the entire product for any basis." The Check at `:759` begins "Let k=F_p and suppose M* is semisimple…".

   **Claim.** For any coefficient field k, prime-field multiplicity ≥2 of a simple constituent S of M* forces the Γ_F-span of the inertia tuple (e_b*)_b to be a proper submodule of ∏_b M*_{e_b*}.

   **Witness.** k=𝔽₉, M*=k(χ) with χ valued in 𝔽₃×; as an 𝔽₃[Γ_F]-module this is 𝔽₃(χ)², multiplicity 2. The k-basis {1} gives M*_1=𝔽₃·1, the product is 𝔽₃(χ), and the inertia tuple (1) generates it. The argument needs Σ_b mult_S(M*_{e_b*}) > dim S/dim End(S); with k=𝔽_p the left side is ≥ 2 dim S and the claim holds, with larger k it can fail.

   **Repair.** Replace the sentence at `:750` by: "The failure also occurs with C1–C4: for k=𝔽_p and a semisimple M* with a simple constituent of multiplicity at least two, the joint inertia tuple cannot generate the entire product for any basis; for general k the criterion is that some simple 𝔽_p[Γ_F]-constituent S of M* satisfies Σ_b mult_S(M*_{e_b*}) > dim S/dim End(S)." Add the negative control as a Check after `:759`: "For k=𝔽₉ and M*=k(χ) with χ valued in 𝔽₃×, the prime-field multiplicity of 𝔽₃(χ) is 2, but the basis {1} gives M*_1=𝔽₃·1 and the inertia tuple (1) generates that product; the k=𝔽_p hypothesis is needed." Tested: with k=𝔽₃ and M*=𝔽₃(χ)², any basis has two vectors with nonzero S-component, the product has S-multiplicity 2 > 1 = dim S/dim End(S), and the cyclic span has multiplicity ≤1, so the claim holds; with k=𝔽₉ the criterion reads 1 > 1 and correctly fails.

## Round-1 findings at this head

Each earlier finding was re-checked against the head, with the repaired passage quoted.

| Id | Status at 7a733d5 | Witness |
|---|---|---|
| a-F01 (ND.0 supplier) | settled, dispute upheld | `merge-order/ORDER.txt` line 300 is LocallyAnalyticDistributionsPartII, line 301 this roadmap; `packages/LocallyAnalyticDistributionsPartII/design/README.md:65` "## Layer ND.0: p-valued groups, their analytic structure and Lazard lattices", `:128` the ordered-basis chart theorem. The brief lists LocallyAnalyticDistributionsPartII among the earlier roadmaps. |
| a-F02 (PL.7 supplier) | settled, dispute upheld | `packages/PotentialAutomorphyInfrastructurePartII/design/README.md:3744` "### The ANT lifting theorem with source primitivity", `:3746` `PL.7/source-primitive-ant-lifting` stating ANT20 Theorem 1.1 with all eight hypotheses and weak primitivity tested over F̄_l; `ORDER.txt` line 89. README §10.2 cites only PL.7. |
| a-F03 (Levi-restricted H¹) | repaired | `packages/GlobalGaloisDeformationsPartII/README.md:154` "What ArithmeticGaloisRepresentations must provide (gap:levi-restricted-adjoint-h1): At §7.7: For each split connected reductive root datum…"; `:496` (§1.5 route) and `:580` (§1.10 route) cite it; the slug is in `design/plan.json` (29 slugs on each side, sorted diff empty). The contract matches FKP22 line 2040–2043 and 2268–2269 (coefficients: every absolutely irreducible subquotient of the dual ambient adjoint, Galois group inside M(k)×k×). |
| a-F04 (unconditional selection) | settled: not actionable, reason holds | A target needs a locator into a legal source; the only printed proof (FKP22 Lemma 3.7, line 666–694) is refuted by §2.9 (recomputed below), and no published correction is readable here. Not re-raised. A remark on a possible route is under Not verifiable. |
| a-F05 (§4.4 in Lean) | settled, dispute upheld | §4.4 is FKP19 Lemma B.1 (line 2842), an input lemma consumed by §4.5; the README's headline list (Summary, Downstream consumers) does not contain it, so its absence from `Suggested.lean` is not a missing headline. |
| a-F06 (orbit Check) | repaired | `:1077` "For four simple factors with C₂ swapping the first pair and the second pair, there are two factor orbits; each orbit quotient … has component group C₂." Recomputed: fibre product over the common C₂ has component order 2, unrestricted product 4, mismatched (0,1),(1,0). |
| a-F07 (inseparable F′) | repaired | `:557` "Fix an algebraic closure of F containing the fixed separable closure; every finite extension F′/F, separable or not, has an F-embedding into it, and Γ_{F′} maps to Γ_F … with image Γ_{F′_s}"; Check `:571`. Recomputed: over 𝔽₂(t), p=5, κ̄ has order 4; 𝔽₂(t^{1/2}) keeps 4; 𝔽₄(t) gives 2; 𝔽₁₆(t) kills it, so D(1,1,2) holds and D(1,1,4) fails. Γ_{F′}→Γ_F has image Γ_{F′_s} because F′^{sep}=F^{sep}F′. |
| b-F01 (§§10.1–10.3 hypothesis) | repaired | `:1572`–`:1577` "Apply §6.6. Oddness holds because the similitude κ̄^{1−2n} takes the value −1 on every complex conjugation…", `:1579` "*Needs:* §6.6; …" without §6.3; Summary `:3` and Downstream consumers `:1632` say §§10.1–10.3 use §6.6. Recomputed: n=1 fixed dimension 1=dim Flag(Sp₂), n=2: 4=dim Flag(Sp₄), identity fixes 10. |
| b-F02 (per-newform count) | repaired | `:1448` "f contributes at most 1+2Σ_𝔭 f_𝔭≤2[K_f:Q]+1 classes"; `:1467` "Σ_i(2[K_{f_i}:Q]+1)". Recomputed: ℚ(√5), p=11: 5≡4² so two degree-one primes, 1+2·2=5; inert 𝔽₉: f=2, again 5; both ≤2·2+1. Realisation over K_{f,𝔭} uses the eigenvalues ±1 of complex conjugation (p odd). |

No repair introduced a new error: the new gap text, the new Checks and the re-routed §10.1 were each recomputed (table below).

## Verified sound

**Head and policy.** `git diff --stat origin/main...HEAD` touches only `packages/GlobalGaloisDeformationsPartII/` (README.md, Suggested.lean, design/plan.json, metadata.toml, sources.toml, five reports). No `lemma` declaration, no `set_option`, no pull-request number, no process narrative, no machine path in README.md or Suggested.lean (grep; the word "lemma" occurs only in prose about sources). Every one of the 81 numbered targets has a locator; no computational algorithm.

**Dependency check**, complete output:

```text
depcheck: 208 roadmaps, 1815 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every `*Needs:*` line names only earlier sections of this roadmap (each §x.y checked against its own Needs; the only later section mentioned anywhere is §6.6 in the prose remarks of §§4.6, 5.1, 5.3–5.5 and 6.1, which is a consumer, not an input), a supplier section that exists at its current head or on main, a declared gap, or a pinned declaration.

**Gaps.** The 29 `must provide (gap:…)` slugs of the README equal the 29 slugs of `design/plan.json` `gaps` (sorted diff empty); every `gap:` mention in the README is one of them. Every gap has a named supplier earlier in the merge order. The new gap:levi-restricted-adjoint-h1 is precise (hypotheses: root datum bound, Levi L, Γ⊂L(k)×k× with absolutely L-irreducible projection, coefficients the duals of the irreducible subquotients of Lie(Gᵈᵉʳ) twisted by the second projection), minimal (the G-irreducible gap does not cover Levi images: SL₃ with the (2,1) Levi has coefficient dimension 2+4+2=8 against 3) and declared in both places.

**Citations resolved this round** (open heads through the roadmaps tool, index of 448 pull requests; board packages; `merge-order/ORDER.txt`): AlgebraicModularFormsAndSerreWeights R15.4–R15.6 and R15.5A (the roadmap at #928, line 18, declares the identifiers R15.1–R15.5 for Layers 1–5, R15.5A for Layer 6 and R15.6 for Layer 7; Layer 4 at line 955 is "The local Serre weight", Layer 5 at 1203 "Deligne–Serre eigenvalue lifting", so the worker's R15.4 lead is a naming convention, not a missing section); LocallyAnalyticDistributionsPartII ND.0 (board design README lines 65, 128); PotentialAutomorphyInfrastructurePartII PL.6, PL.7 and the source-primitive ANT target (3132, 3744–3775); the merge-order positions of ReductiveGroupsPartII (25), IntegralHeckeAndGaloisDeterminants (29), NoncommutativeAndEquivariantIwasawa (31), ArithmeticGaloisRepresentations (50), ArithmeticGaloisDuality (51), ArithmeticLocallySymmetricSpaces (77), AutomorphicFormsOnReductiveGroups (78), LocalGaloisDeformationRings (88), PotentialAutomorphyInfrastructurePartII (89), GlobalGaloisDeformations (90), AutomorphicLFunctionsAndLocalFactors (95), AutomorphicSpectralTheory (97), AlgebraicModularFormsAndSerreWeights (104), FunctionFieldArithmetic (170), AutomorphicGaloisRepresentationsPartII (183), AutomorphicGaloisRepresentations (184), ClassicalSerreModularity (187), OrdinaryAutomorphicFormsAndModularityLifting (193), GL2ModularityLifting (195), ModularityAndLanglandsExtensions (255), LocallyAnalyticDistributionsPartII (300), all before this roadmap (301). The worker's `roadmaps resolve` lists nothing else as unresolved.

**Ownership by object.** `roadmaps grep` over main and the 448 open heads for Fakhruddin–Khare–Patrikis, relative Selmer, doubling, reducible mod p, Hamblen, infinitely many nonisomorphic extensions, stable-lattice segments and Ribet's lemma: the hits are source citations (ArithmeticGaloisDuality, SelmerIwasawaCohomology, LocalGaloisDeformationRings, ModularityAndLanglandsExtensions §2.28) and EllipticCurveModularityPartIIGL2TypeAbelianVarieties §§2.3, 2.4, 2.9, 5.4, which are Ribet's GL₂-type lemmas on determinants, oddness and residual irreducibility, not lattice segments. No roadmap on main, on the board or at an open head builds the cyclic ramification classes, doubling, relative images, auxiliary-prime annihilation, finite-ramification assembly, lattice-segment reductions, actual-reduction modularity or the two-place symplectic lift. The Lean file declares nothing, so no fully qualified name can collide.

**Suggested.lean.** One `import Mathlib`, the module docstring in the prescribed form naming the nine not-statable headlines and what each lacks, the namespace, no declaration, no `lemma`, no `set_option`, no `#check`, no example. Nothing to elaborate with `#check @name`, nothing for the one-tactic probe; no binder could have been lost. The not-statable list was re-checked: the pins have no newform Galois attachment, no restricted-ramification Galois group, no G-valued deformation functor, no ordinary or de Rham local condition and no function-field Langlands carrier, so no listed headline is statable and no statable headline is absent. §§8.8 and 8.9 are statable lemmas (FKP22 Lemmas 7.6 and the segment argument), not headlines, and are correctly absent.

**Locators verified against the cached texts this round** (29; each theorem compared with the README statement): FKP22 Lemma 3.7 and proof (666–694), Proposition 3.8 and proof (712–840), Theorem 4.4 (891–911), Theorem 5.2 with footnote 6 (1008–1034), Theorem 5.6 (1193–1200), Corollary 6.6 (1331–1359), Lemma 7.1 (1409–1421), Theorem 7.4 and proof (1601–1640), Lemma 7.6 (1666–1675), Proposition 7.7 (1676–1690), Theorem 8.1 (1728–1740), Remark 8.2 (1741), Corollary 8.3 (1753–1776), Corollary 8.4 (1796–1811), §9 weight convention (1850–1861), Proposition 9.1 and proof (1864–1892), Lemma A.5 (2026–2051), Definition A.13 and Lemma A.14 (2233–2275); FKP19 Lemma 3.9 (851–859), Definition 5.8 (1298–1306), Theorem 6.11 (2250–2261), Lemma A.5 (2791–2811), Lemma A.6 (2812–2821), Corollary A.7 (2823–2830), Lemma B.1 and Corollary B.2 (2842–2870); ANT20 Theorem 1.1 (44–68); Pan22 Theorem 1.0.2 (100–105). All support the README statements as written, with the source issues below.

**Adversarial table.** One row per statement checked, with the values computed.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.9 repeated-constituent obstruction (:750) | k=𝔽_p, S of multiplicity m≥2; k=𝔽₉, M*=k(χ), χ 𝔽₃-valued | cyclic span has mult_S ≤ dim S/dim End(S) ≤ dim S; product has ≥ #{b:(e_b*)_S≠0} ≥ m·dim S ≥ 2 dim S; for 𝔽₉: multiplicity 2, M*_1=𝔽₃, tuple (1) generates | holds for 𝔽_p, fails for 𝔽₉ | S01 |
| §2.9 refutation of FKP22 Lemma 3.7 | F=ℚ, trivial SL₂ image, M*=𝔽_p(κ̄)³ | ζ_w=η₁^{(w)}−η₂^{(w)} has inertia 1−1=0 at w, lies in the finite H¹(Γ_{ℚ,T},𝔽_p(κ̄)); ζ_w=ζ_{w′} gives the relation (1,−1,−1,1) on Γ_K; the proof's second paragraph (682–690) maps the b-th factor, not the diagonal inertia tuple, to Gal(L/K) | refutation valid, C4 holds, C1 fails | none |
| §2.8 inertia-generated disjointness | L_i with inertia at v_i generating; B unramified at all v_i | inertia at v_i sits in factor i of ∏_j Gal(L_j/K); a quotient unramified at v_i kills factor i; each L_i∩(∏_{j≠i}L_j·B)=K gives the product isomorphism | correct; exactly the hypothesis the η-tuples lack | none |
| FKP22 Proposition 3.8 Equation (2) in the counterexample | W₀=⊕_m 𝔽_p[Γ_F]d_m, d_m the inertia tuple at v_m | for each m, (⟨w_{m,b},X_n⟩)_b with w ranging over 𝔽_p[Γ_F]d_m covers (⟨e_b*,Y⟩)_b for Y∈Σ_n𝔽_p[Γ_F]X_n=gᵈᵉʳ, hence all of k^B; blocks for different m are coordinate-disjoint | Equation (2) alone is solvable from inertia-generated elements; the norm-class and K_h compatibilities are what §3.2 assumes | none (a-F04 settled) |
| §2.4 one-prime sequence | trivial w, Z≠0; Z=0 | dim L_{w,Z}=dim M_Z+1, h⁰_w=dim M_Z, local term 1; L^⊥={ψ unramified, ψ(σ_w)⊥Z}; stabilised Sha gives ψ(σ_w)=0 for all ψ∈Sha¹_T(M_Z*), so the dual Selmer group is unchanged; Z=0: term 0 | correct | none |
| §2.2 Sha annihilation | nonzero class, C4 | inflation–restriction injects into Hom(Γ_{K,T},M*); Frobenius at a K-split w off the kernel; Sha¹_{T∪w}⊂Sha¹_T (classes locally trivial at w are unramified at w) and misses the class | correct | none |
| §3.3 general two-term formula | φ=φ_σ+φ_τ, ψ=ψ_σ+ψ_τ | inv(φ_σ∪ψ)=−⟨φ(σ),ψ(τ)⟩ (FKP19 line 857), inv(φ_τ∪ψ_σ)=⟨φ(τ),ψ(σ)⟩ (line 859), inv(φ_τ∪ψ_τ)=0 since ⟨τ⟩≅ℤ_p has cohomological dimension 1; τ^{q−1}=1 on W as q−1∈ϖ^rO | correct | none |
| §8.2 C1–C3 for (χ̄ *;0 1) nonsplit | χ̄ odd, χ̄≠κ̄⁻¹; χ̄=κ̄ | C1: commutant of I+E₁₂ and diag(a,1) in sl₂ is yE₁₂ with ay=y, so 0; C2: unique sub line kE₁₂ of weight χ̄, so C2 ⟺ χ̄≠κ̄⁻¹; C3 prime-field: χ̄^σχ̄=κ̄⁻¹ and χ̄^σ=χ̄κ̄⁻¹ fail at c (1≠−1), χ̄^σ=κ̄⁻¹ forces χ̄=κ̄⁻¹; χ̄=κ̄: κ̄⁻¹≠κ̄² as κ̄ has even order | correct; FKP22 Lemma 7.1 line 1409 | none |
| §7.1 lattice change | SL₂, cocharacter diag(t,t⁻¹), e′=2 versus 3 | congruence kernel lies in the big cell U⁻MU; U coordinates scale by ϖ′², U⁻ by ϖ′^{e′−2}; e′=2 leaves a possibly unit U⁻ entry so the reduction is not in M; e′=3 clears it | correct, the Check uses e′=3 | none |
| §7.4 local lift | t=α∨(√q), u₁∈A(O), u₂∈U_α(O) | (tu₁)u₂(tu₁)⁻¹=tu₂t⁻¹=u_α(qx)=u₂^q; √q≡1 so the residual values are ū₁,ū₂; p=3,q=7: x²=7, x≡1 | correct | none |
| §1.11 D(1,1,4) for 𝔽_p-valued χ | a=m₁−m₂, |a|≤2 | χ^aκ̄⁻¹ trivial on some Γ_{F′} with [F′:F]≤4 ⟺ its order ≤4; so D ⟺ ord(χ^aκ̄)≥5 for |a|≤2; χ=1, ord κ̄=5: five tests pass | correct | none |
| §9.3 constant-field boundary | F=𝔽_q(t), q≡−1 mod p, ρ̄=Ind θ from 𝔽_{q²}(t) | κ̄=η of order 2, κ̄|Γ_{F′}=1; M=η⊕Ind θ, M*=1⊕Ind θ; common constituent Ind θ, C3 fails; for every p some prime ℓ≡−1 mod p exists | correct; FKP22 Remark 8.2's uniform claim fails (source issue) | none |
| §10.1 weights and sign | n=1, ξ=0; GSp_{2n} pairing | weights 0,1, multiplier κ⁻¹ of weight 1; w_i+w_{2n+1−i}=2n−1>0 forces the nonnegative formula ξ_{τ,2n−i+1}+i−1; the source's −(ξ+i−1) at line 1861 is inconsistent with the similitude κ^{1−2n} | README correct | none |
| §10.1 oddness through §6.6 | ν(g)=−1, g²=1; n=1,2; identity | eigenspaces isotropic of dimension n, fixed gl_n of dimension n²; 1, 4; identity fixes 10 | correct (b-F01) | none |
| §10.2 against ANT20 Theorem 1.1 and PL.7 | eight hypotheses; constituent ranks | the symplectic form restricts nondegenerately to each GL_{2n}-constituent (an isotropic constituent would give a stable parabolic), so every constituent has even rank ≥2 and is individually polarized; PL.7 line 3746 lists the same eight conditions with weak primitivity over F̄_l | correct | none |
| §10.3 descent twist | Gal(L′/F′)=⟨η⟩ | r(π′)|Γ_{L′}≅ρ|Γ_{L′} irreducible, so r(π′)≅ρ|Γ_{F′}⊗(1 or η) | correct | none |
| §8.10 count | ℚ(√5), p=11; inert 𝔽₉ | 1+2·2=5 in both cases; ≤2[K_f:ℚ]+1=5 | correct (b-F02) | none |
| §8.11 negative control | p=5, κ̄, S={5}; S′={5,11} | ℤ[1/5]×/5=⟨5⟩ (−1=(−1)⁵), Pic(ℤ[1/5])=0, dimension 1; valuation vectors (1,0),(0,1), dimension 2; 11≡1 mod 5 | correct | none |
| §8.9 apartment | g=[[a,b],[c,d]] on Λ_s | stable iff v(c)≥s and v(b)+s≥0; min v(b)=2, min v(c)=1: s∈{−2,…,1}, 4 vertices; index 3: {−6,…,3}, 10 vertices, same two nonsplit endpoints | correct | none |
| §5.5 four-factor Check | C₂=(12)(34) | orbits 2; quotients by H₃×H₄ and H₁×H₂ have component group C₂; fibre product component order 2, product 4 | correct (a-F06) | none |
| §1.9 Check over 𝔽₂(t) | p=5, χ=1, N=2,4 | orders 4, 4 (purely inseparable), 2 (𝔽₄(t)), 1 (𝔽₁₆(t)) | correct (a-F07) | none |
| §4.3 balance | F totally real, odd ρ̄ | p-exponent [F:ℚ]dim Flag equals Σ_real dim M^{c_v}; C1, C2 kill the global H⁰ terms at every level | correct | none |
| §4.4 and §4.5 | C₃ on ℤ₃[ζ₃] by ζ₃; ℤ₃ trivial | H¹(C₃,O/ϖʳ)=(O/ϖʳ)/ϖ of order 3 for all r, uniform annihilator ϖ, H⁰(V/ϖ)=𝔽₃≠0 so excluded from §4.5; ℤ₃: exponent 3ʳ, abelian Lie algebra | correct | none |
| §4.6 depth | O=ℤ₃, M=2 | v₃(18)=2 passes, v₃(108)=3 fails | correct | none |
| §6.5 inequality | GL₂, real place | unrestricted p-exponent [F:ℚ]dim Gᵈᵉʳ=3[F:ℚ] ≥ Σ_real dim M^{c_v}; so |Sel|≥|DualSel| | consistent with Theorem 5.6 | none |
| §9.4 split orientation | both orientations failing | r₁≅r₂κ̄⁻¹ and r₁≅r₂κ̄ give r₂≅r₂κ̄², ord κ̄² ∣ n₂, [F(ζ_p):F]≤2n₂ | correct | none |
| §1.6 boundary | P=G; Borel of SL₂ | A=1, a=0, z(m)=0 (semisimple G), faithful vacuously; [h,E₁₂]=2E₁₂ | correct | none |
| §0.7 cyclotomic layer | V killed by p | Gal(K_z/K) elementary abelian; K_z∩K∞ of degree 1 or p; conjugation on Gal(K∞/K) trivial by §0.6 with A=F(μ_{p∞}) abelian | correct | none |
| §2.3 Check | 𝔽₃[x,y]/(x,y)² | coinvariants of a cyclic module ≤1; dual has coinvariant dimension = socle dimension 2 | correct | none |
| §4.2 Check | C₃ on ℤ/9 by 4 | (4·1−1)/3=1, nonzero connecting image | correct | none |
| RGPII Checks | Heisenberg at p=7; sl₃ H=diag(2,1,−3) | 1/2=4; root values 1,4,5 at p=7; at p=5: 2−(−3)≡0 | correct | none |
| AGR Check | conjugate of diag(1,−1) by I+E₁₂ | diag(1,−1)−2E₁₂; (−1)-eigenvector e₁+e₂ | correct | none |
| §1.12 Check | diag(2,6,1) in sl₃(𝔽₁₁) | 2·6⁻¹=4, 6; bracket −2E₁₃ | correct | none |
| Conventions Check | SL₄/𝔽₇ | 7·6·5·4=840, 120 trace-zero regular tuples | correct | none |

**Checks tested:** 33 rows above, plus the Checks of §§0.1–0.7, 1.1–1.12, 2.1–2.9, 3.1–3.6, 4.1–4.8, 5.1–5.5, 6.1–6.6, 7.1–7.8, 8.1–8.11, 9.1–9.5, 10.1–10.4 read against their sections; each definition (§§0.1–0.5, 1.3, 1.6, 1.9, 2.1, 2.7, 3.2, 4.1, 4.6, 4.7, 6.6 K′, 8.1, 8.8, 9.1) has at least three discriminating Checks. The only false statement found is S01. Declarations read: 0 (the Lean file declares none). Targets read: 81 (all of Layers 0–10, every line of the README and of Suggested.lean). Locators verified: 29 this round. Sibling citations checked: 3 open-head or board roadmaps by content (AlgebraicModularFormsAndSerreWeights, LocallyAnalyticDistributionsPartII, PotentialAutomorphyInfrastructurePartII), 1 sibling for duplication (EllipticCurveModularityPartIIGL2TypeAbelianVarieties), 22 merge-order positions, 448 open heads through the tool's resolve and grep.

**Generality and conventions.** The README's generality is the sources' (global field of characteristic ≠p, smooth affine G with split reductive G⁰ and prime-to-p component group, E/ℚ_p finite); the Lean file states nothing, so there is no README/Lean gap. HT(κ)=−1, arithmetic Frobenius, στσ⁻¹=τ^q, the §3.3 sign, M*=Hom(M,k)(1) with one twist and the ordinary weight formula are each pinned by a computed two-term Check and used consistently in §§3.3, 3.4, 7.4, 7.8, 8.3 and 10.1.

## Not verifiable

- **The published version of FKP22** (Invent. Math. 228): whether Lemma 3.7 or Proposition 3.8 was corrected in print could not be checked; the cache is arXiv v5 and the README cites v5 throughout. The a-F04 "not actionable" reason rests on this. A possible unconditional route for a human: condition the Chebotarev selection on the fixed finite field Z = K^{T,ab,p}·K(μ_{p^{D+1}}); the fields L_vZ are then generated over Z by inertia at the v_m and are strongly disjoint over Z, and Equation (2) of Proposition 3.8 is solvable from the inertia-generated part (table row 4); the K_h/L_v interaction at the shared primes and the norm class remain to be checked. This is the FKP19 K′ device of §6.6 in the reducible setting and has no source, so it is not a finding.
- **Gur99 Theorem A, NSW08 Theorems 8.6.7, 8.6.10, 8.7.9, BC14 Lemma 10, Propositions 11 and 32:** settled uncertified, cited by locator only; not opened, nothing inferred from them.
- **The arithmetic selection hypothesis of §3.2:** an explicit hypothesis of the general reducible results; its elementary estimate and transport properties were read, its arithmetic content is not certified.
- **The 29 declared gaps:** certified precise, minimal and declared; their future proofs are not.
- **Ownership against open pull requests without files:** none were named without files; the tool's index of 448 open heads and the listed sibling checkouts were used.
- **Lean elaboration:** no Lean was run, as the brief requires; the file has no declaration, so nothing depends on it.

## Source issues

- **Misprint** in FKP22 at Proposition 9.1, printed p.41 (FKP22 line 1870): the source says the ordinary weight ξ_v lies in (ℤⁿ₊)^{Hom(F_v,ℚ̄_p)}; it should be (ℤ^{2n}₊)^{Hom}, the representation being 2n-dimensional, as its own ξ_{τ,2n−i+1} shows; affects nothing.
- **Error** in FKP22 at Remark 8.2, printed p.38 (FKP22 line 1741): the source says every absolutely irreducible ρ̄ satisfies the hypotheses of Theorem 8.1 for all p≫n uniformly; it should be require absolute irreducibility on Γ_{F(ζ_p)} and [F(ζ_p):F]>a_{GL_n}, since over 𝔽_q(t) with q≡−1 mod p a representation induced from the quadratic constant extension has Ind θ common to M and M*; affects a stated result.

The source issues registered by the round-1 passes (FKP22 lines 510, 513, 666–799, 1241, 1255, 1636, 1676, 1861, 1959, 1987, 2008, 2018, 2097–2129, 2144, 2163–2194, 2175, 2289, 2296; FKP19 lines 114, 2336, 2435, 2862; Ribet10 lines 161, 228, 278, 286) were re-read where the locators above passed through them and are not repeated.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7a733d5de98373b784436b2ecaaa5f74da96b0af", "job": "RT-GlobalGaloisDeformationsPartII~2b", "model": "fable", "worker": "chris-x17"} -->
