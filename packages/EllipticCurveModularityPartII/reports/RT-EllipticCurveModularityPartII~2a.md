<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/134#issuecomment-6376695254 -->
Red team round 2 pass a (codex) of add3164

Verdict: needs_changes

1. **F01** (P1) Source citations still substitute for owned prerequisites

   **Location:** packages/EllipticCurveModularityPartII/README.md:539: “BPR split-Cartan exclusion”; :509: “Manin–Drinfeld makes a multiple of the cusp difference descend”.

   **Claim:** These inputs are available through the named supplier contracts.

   **Witness:** None of the thirteen entries of packages/EllipticCurveModularityPartII/design/plan.json supplies split-Cartan rational-point exclusion or torsion of cusp differences. BPR2013 line 55 states the former; DarmonMerel2001 lines 759–764 use the latter.

   **Exact repair text:** Add two separate contracts, with identically named entries in the plan's `gaps` list: “What ModularCurvesPartII must provide (gap:split-cartan-rational-points): For every prime p≥11 with p≠13 and integer m>1, every rational point of X₀⁺(pᵐ) is cuspidal or CM (BPR, Theorem 1.1, p. 2).” “What ModularSymbolsPadicLFunctions must provide (gap:cuspidal-divisor-torsion): For a smooth projective congruence modular curve over a number field, every degree-zero divisor supported on geometric cusps has torsion class in its Jacobian.” Cite these contracts in §§6.8 and 6.4 respectively. The second is separate from an integral winding/cotangent comparison.

   **Repair test:** At p=41,m=2 the first contract gives precisely the missing exclusion; p=13 is excluded. For a cusp difference D of order m and P rational, mσ(P−∞)=m(P−∞); finiteness of A(ℚ), of order h, then gives hm·u(P)=0. Neither computation follows just from the current geometry or rank-zero contracts. The supplied open-head searches found no earlier owner of the BPR exclusion; its use in later work cannot create an upward edge here.

2. **F02** (P2) A statable integrality headline is omitted

   **Location:** packages/EllipticCurveModularityPartII/Suggested.lean:23: “formal immersion and integrality headlines lack the modular curves with their moduli/j maps”.

   **Claim:** The advertised integrality theorem cannot be stated at the pins.

   **Witness:** Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:388 defines `WeierstrassCurve.j`. The file already has geometric torsion, the Galois action and cyclic isogenies. A nonsplit Cartan is a cyclic subgroup of order p²−1 in GL₂(𝔽ₚ).

   **Exact repair text:** State the full containment version on these native carriers, using the standard cyclic-subgroup characterization of a nonsplit Cartan, and add its name and the characterization to the README:

   ```lean
   /-- Nonsplit-normalizer containment and a rational isogeny of one of the
   five genus-zero prime degrees force integral j (Lemos, Proposition 2.1). -/
   theorem cartan_integral_j (E : WeierstrassCurve ℚ) [E.IsElliptic]
       (r : ℕ) (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ))
       (hisog : HasCyclicIsogeny E r) (p : ℕ) [Fact p.Prime]
       (hp : p ∉ ({2, 3, 5, 7, 13} : Finset ℕ))
       (hcartan : ∃ C : Subgroup (Multiplicative (AddAut (GeometricTorsion E p))),
         IsCyclic C ∧ Nat.card C = p ^ 2 - 1 ∧
         (E.torsionGaloisAction (K := AlgebraicClosure ℚ) (p : ℤ)).range ≤
           Subgroup.normalizer (C : Set (Multiplicative (AddAut (GeometricTorsion E p))))) :
       ∃ z : ℤ, E.j = (z : ℚ) := by sorry
   ```

   Keep the modular-curve, winding-quotient and integral-model constructions in the missing-carrier explanation, but remove integrality itself. Prove the equivalence of the cyclic-subgroup characterization with field multiplication using the supplied rank-two torsion theorem; it is not a freely assigned predicate or an admitted matrix representation.

   **Repair test:** At p=11 a Cartan has order 120 and its normalizer 240, whereas the full group has order 13200. A split Cartan has element orders dividing 10, so cannot witness a cyclic subgroup of order 120. Thus the characterization discriminates the required object. The conclusion holds for integral j=1728 without a non-CM hypothesis and rejects the rational value −122023936/161051. No conductor or modular-curve carrier appears. The proposed signature was checked by reading the pins, not elaborated during this read-only pass.

3. **F03** (P2) The integral Sturm input is restricted to the application

   **Location:** packages/EllipticCurveModularityPartII/README.md:387: “integral prime-power-ideal Sturm theorem at weight two”.

   **Claim:** Building only weight two and moduli Pᵐ supplies the reusable congruence theorem.

   **Witness:** Kraus1997 lines 1060–1063 state the theorem for every nonnegative weight and every ideal of the integer ring, with bound kμ(N)/12. The package retains only k=2 and prime-power ideals.

   **Exact repair text:** “For N>0, k≥0, a number field K with a fixed complex embedding, a Dirichlet character modulo N, and an ideal J of O_K, prove: two weight-k forms on Γ₀(N) with that character and O_K-valued q-expansions are congruent modulo J at every coefficient if they are so for every integer 0≤n≤kμ(N)/12. Include coefficient zero. Apply this with k=2 and J=Pᵐ to the filtered forms (Kraus, Appendix II, Proposition 1, p. 1158). The level-one, rational-coefficient, prime-modulus specialization is already owned by ComputationalNumberTheory §3.4; cite that specialization instead of planning it again.”

   **Repair test:** At k=0,N=1 the bound is zero and compares the constant terms; omitting coefficient zero would incorrectly identify 1 and 0 modulo (2). At k=12,N=1, Δ and 0 agree at coefficient zero but differ at coefficient one. J=(6) is not a prime power and must also be covered; J=(1) is the trivial congruence and J=(0) gives actual equality. These cases are outside the proposed restricted interface, while k=2,J=(2)² gives the required mod-four application.

4. **F04** (P2) Existing Atkin–Lehner theory is planned again

   **Location:** packages/EllipticCurveModularityPartII/README.md:607: “Construct the corresponding involution on the curve and on the weight-two newspace”.

   **Claim:** Construction of the exact-divisor operator on the newspace belongs here.

   **Witness:** TauCetiRoadmap/ModularForms/README.md:679–706 already owns all exact-divisor Atkin–Lehner operators, their character transport, newform signs and normalization. The current supplier list names only Layers 3, 8 and 10.

   **Exact repair text:** “Consume ModularForms Layer 6's normalized Atkin–Lehner operator at the exact divisor p² of rp², specialized to weight two and trivial character. The new target here is its comparison with pullback of differentials on the arithmetic quotient supplied by the Chen contract; prove that the invariant differentials descend to that quotient.” Add Layer 6 to the exact supplier contracts and this target's Needs line.

   **Repair test:** For r=5,p=11 the exact divisor is 121 of 605 and the weight-two normalization factor is (√121)⁰=1. For r=p=5 the exact-divisor hypothesis fails. These controls survive the import and require no second operator construction.

5. **F05** (P2) Several declared gaps are not exact contracts

   **Location:** packages/EllipticCurveModularityPartII/README.md:62–64: “coefficient-prime weight-two reduction alternative”; “subgroup classification and inertia-order bounds used in Lemos Theorem 2.3”.

   **Claim:** The needs sentences specify the missing mathematical statements and their hypotheses.

   **Witness:** Neither the reduction alternative nor an inertia bound is stated in those sentences. The oddness contract bundles complex conjugation, absolute irreducibility and an unspecified classification. Matching text in plan.json repeats the ambiguity.

   **Exact repair text:** Separate the contracts and give each an atomic needs sentence. For the local comparison use: “For E/ℚ and prime ℓ≥5, at q≠ℓ the residual conductor exponent equals v_q(M), except at multiplicative q with ℓ dividing ord_q(Δ), where it is zero.” Separately: “For E/ℚ and prime ℓ≥11 with E[ℓ] irreducible of Serre weight two, E has good reduction at ℓ or multiplicative reduction with ℓ dividing ord_ℓ(Δ).” Separate complex conjugation (eigenvalues 1,−1 for odd ℓ) from its absolute-irreducibility consequence. Replace the unspecified finite-image clause by: “For odd prime p and H≤GL₂(𝔽ₚ) not containing SL₂(𝔽ₚ), H is contained in a Borel or a split/nonsplit Cartan normalizer, or its projective image is isomorphic to A₄, S₄ or A₅.” Separately require: “For E/ℚ and prime p>17, the projective image of E[p] is not isomorphic to A₄, S₄ or A₅” (Mazur, Theorem 3 proof, p. 130; Mazur1978 lines 68–75). These are exact statements; an unspecified inertia-order bound is not. Keep the same descriptions and slugs in both intake locations.

   **Repair test:** At multiplicative q≠ℓ with v_q(Δ)=ℓ the first formula gives residual exponent 0 versus elliptic exponent 1. At additive ℓ the second statement is not applicable unless weight two is supplied, and its conclusion excludes that case for ℓ≥11. At ℓ=2 the two conjugation eigenvalues coincide; the oddness statement must exclude it. This finding concerns precision/compound needs, not absence of the declared suppliers' implementations.

   The same atomic-contract rule applies to newform-residual-and-conductor: separate its residual representation/Frobenius theorem from its Nᵈ conductor theorem, retaining their current hypotheses verbatim. Separate modular-curves-and-jacobians into the mixed-curve construction (specifying r>0, prime p coprime to r, and the Borel, split-normalizer and nonsplit-normalizer level subgroups), its pull-push Hecke construction, and the quotient for a primitive rational weight-two newform. These are three independently consumed inputs. S12 specifies two further inputs which the generic wording does not request. S11 specifies the missing cotangent map and its hypotheses. The compound cyclic-degree sentence can be split into the all-degree classification and the non-CM prime refinement without changing either set.

6. **F06** (P1) The rationality proof cites the wrong supplier sublayer

   **Location:** packages/EllipticCurveModularityPartII/README.md:283–285: “ModularForms Layers 3, 8 and 10”; “applies Galois conjugation at the same primitive level”.

   **Claim:** The imported layers supply existence of the conjugate newform and its coefficient-field orbit.

   **Witness:** TauCetiRoadmap/ModularForms/README.md:935–963 assigns exactly this construction to Layer 8G and explicitly distinguishes it from Layer 8's coefficient integrality. No Galois-conjugate-newform declaration was found at the pin.

   **Exact repair text:** “Consume ModularForms Layer 8G, ‘Galois stability and the conjugate newform’, including aₙ(f^σ)=σ(aₙ(f)), character transport and the orbit-size theorem. Use this input in §§2.2, 3.1 and 3.2 to compare conjugates and to bound the coefficient-field degree by the actual newspace dimension.” Add 8G to the scope, supplier and dependency paragraphs.

   **Repair test:** For a quadratic coefficient field with c_q=√2, the two required coefficients are √2 and −√2, so there must be two occurring eigensystems and degree 2≤g⁺(N). Algebraic integrality alone supplies no second modular form. For the rational level-11 form the orbit has size 1, as required.

7. **F07** (P2) The displayed build order repeatedly consumes later targets

   **Location:** packages/EllipticCurveModularityPartII/README.md:99: “dimension comparison below”; :329: “Sturm target and local filters below”; :499: “five-level winding nonvanishing below”.

   **Claim:** The numbered order is a build whose inputs precede their consumers.

   **Witness:** Edges include §1.1→§1.10, §1.4→§1.5, §4.1→§§4.6–4.7, §4.3→§4.7, §6.3→§6.14, §6.4→§6.14, §6.7→§§6.12–6.15 and §6.10→§6.13.

   **Exact repair text:** Reorder the existing targets inside their six layers, without changing ownership: “Layer 1: local factors, arithmetic expression, native dimension comparison/bound, thresholds, majorant comparison. Layer 4: filters, integral congruence theorem, finite recognition, trace transfer; matrix selection before two-isogeny repair; realization afterwards. Layer 6: exact-divisor comparison and winding nonvanishing before winding quotient; coefficient-support and cotangent comparison before formal immersion; numerator and integral-parameter definitions before finite j-sets, then finite-image bounds and Lemos.” Put the proper-image classification before its use in the integrality corollary and give separate Needs lines to the distinct §6.14 results.

   **Repair test:** The listed dependencies then all point to earlier targets. The macro dependency gate's zero problems does not test these numbered-target edges. This is not a re-raising of the repaired two-isogeny/full-two-realization cycle: that specific cycle is gone.

8. **F08** (P3) The action Checks do not distinguish a nontrivial action

   **Location:** packages/EllipticCurveModularityPartII/README.md:452: “for rational coordinates each action fixes P. This excludes an inverted composition convention.”

   **Claim:** The displayed Checks give discriminating instances of the action and its composition direction.

   **Witness:** Identity/composition are asserted abstractly; evaluated points have rational coordinates, where both orders coincide. The other bullets only count torsion carriers. No nonrational point or noncommuting pair is instantiated.

   **Exact repair text:** Add three computed controls: “For E:y²=x³−2, let α³=2, ζ³=1 with ζ≠1, and P_i=(ζⁱα,0). Choose σ(α)=ζα, σ(ζ)=ζ and τ(α)=α, τ(ζ)=ζ². Then σP₀=P₁≠P₀; τP₁=P₂≠P₁; (στ)P₀=P₁ whereas (τσ)P₀=P₂. On this killed-by-two group, 2P_i=0 and (3 mod 2)P_i=P_i.” Keep these in the README.

   **Repair test:** The trivial action fails the first two values, and reversal of composition interchanges P₁ and P₂ in the third. The three nonidentity points are distinct because x³−2 is separable over ℚ. The actual real-bodied Lean adapter already implements the correct action; no Lean padding is requested.

9. **F09** (P2) The finite-prime rationality theorem is statable but absent

   **Location:** packages/EllipticCurveModularityPartII/README.md:281: “then every Fourier coefficient of f is in ℤ”.

   **Claim:** The acceptance file covers the deep rationality results that can already be stated.

   **Witness:** TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104 supplies the normalized primitive form and its character; its coefficients are `UpperHalfPlane.qExpansion`. All the carriers for §3.1 exist, unlike elliptic conductor and Serre weight.

   **Exact repair text:** “Add a headline `rationality_of_small_prime_coefficients`: for N>0 and f : HeckeRing.GL2.Newform N 2 with f.χ=1, if for every prime q with 6q≤(CongruenceSubgroup.Gamma0 N).index there exists z∈ℤ with a_q(f)=z, then for every n∈ℕ there exists z∈ℤ with a_n(f)=z. Here a_n(f) is exactly (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff n. Import TauCeti.NumberTheory.ModularForms.Newforms.Newform and give the theorem a sorry proof and the Kraus Lemma 1 locator.” Add the name to §3.1; this adds no coefficient-field stand-in.

   **Repair test:** At N=11 the bound tests q=2; a₂=−2, a₃=−1 and a₄=a₂²−2=2 agree with the rational conclusion. At N=1, f cannot exist, so the empty prime test does not create a fictitious form. Including a₀=0 in the conclusion is correct for cusp forms. The proof needs Galois stability and Sturm, so this is not a one-tactic API lemma.

10. **F10** (P3) Two available proof inputs lack exact supplier locators

   **Location:** packages/EllipticCurveModularityPartII/README.md:345: “Chebotarev on C[4]”; :547: “perfectness of SL₂(𝔽ₚ) for p≥5”.

   **Claim:** The proof inputs are cited by exact owner/section or pinned declaration.

   **Witness:** TauCetiRoadmap/Chebotarev/README.md:410 supplies Layer 10, Dirichlet-density Chebotarev. Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804 supplies `Matrix.SL2.commutator_eq_top`. Neither locator is in this package.

   **Exact repair text:** “Consume Chebotarev Layer 10, ‘Dirichlet-density Chebotarev’, applied to the finite Galois extension generated by C[4]. Consume Mathlib's Matrix.SL2.commutator_eq_top in LinearAlgebra/Matrix/SpecialLinearGroup for the perfectness input in §6.9.” Add these to the corresponding Needs lines and exact contracts. Do not create new copies of the theorems.

   **Repair test:** In an S₃ torsion extension the transposition class has density 3/6 and the 3-cycle class 2/6; both are nonzero, so an elementwise constraint is tested. In 𝔽₅, a=2 satisfies a≠0 and a²=4≠1, the exact hypotheses of the pinned commutator theorem; in 𝔽₃ this witness is unavailable.

11. **F11** (P2) The cotangent supplier contract omits its map and ramification restriction

   **Location:** packages/EllipticCurveModularityPartII/README.md:74: “cotangent lattice comparison on semistable integral models”.

   **Claim:** This is an exact contract sufficient for the injective reduction of quotient differentials used in §6.14.

   **Witness:** Mazur1978 lines 356–365 specify an exact sequence of Néron cotangent lattices under e<q−1. Lines 370–382 give a characteristic-two counterexample without that restriction. The gap states neither the map nor this hypothesis.

   **Exact repair text:** Split off: “What NeronModelsAndSemistableAbelianVarieties must provide (gap:optimal-quotient-cotangents): For a finite extension K/ℚ_q with absolute ramification index e<q−1 and an exact sequence 0→B→J→A→0 of abelian varieties over K with J semistable, the identity components of their Néron models have an exact sequence of free O_K-modules 0→Cot₀(A)→Cot₀(J)→Cot₀(B)→0 (Mazur, Corollary 1.1, p. 137).” Add the matching plan entry. Keep the winding-annihilator construction separate, and specify its comparison of Cot₀(J) with regular weight-two differentials. Cite this exact cotangent contract before reduction modulo q in §6.14.

   **Repair test:** In the application q≡±1 mod p, K is unramified at q and q>13, so e=1<q−1; exactness of free lattices stays injective after reduction. Over ℚ₂ the inequality 1<1 fails, excluding the source's counterexample. This is a precision defect in a declared contract, not a claim that the valid q>13 formal-immersion theorem is false.

12. **F12** (P1) The modular-curve contract does not supply the explicit j-map and rational-point tables

   **Location:** packages/EllipticCurveModularityPartII/README.md:533: “coordinate/j-map theorem and the rational-point models belong to the modular-curve contract”; :555: “the rational-point j-tables”.

   **Claim:** The generic modular-curves-and-jacobians gap provides the explicit coordinates and the exhaustive rational j-tables consumed here.

   **Witness:** README:70 requests normalizations, j maps, Jacobians, correspondences and a newform quotient; it requests neither a coordinate formula nor rational-point classification. Lemos2017 lines 197–202 and 231–243 are the distinct mathematical inputs.

   **Exact repair text:** Add two atomic ModularCurvesPartII contracts, with matching plan entries. “For r=2,3,5,7,13, supply a ℚ-isomorphism X₀(r)≃ℙ¹ whose noncuspidal coordinate t has j=f_r(t)/t, with f₂=(t+16)³, f₃=(t+27)(t+3)³, f₅=(t²+10t+5)³, f₇=(t²+5t+1)³(t²+13t+49), and f₁₃=(t⁴+7t³+20t²+19t+1)³(t²+5t+13), and whose cusps are t=0,∞ (gap:five-level-j-coordinates).” “The j-images of Y₀(11)(ℚ), Y₀(17)(ℚ), Y₀(37)(ℚ) are respectively {−11·131³,−2¹⁵,−11²}, {−17²·101³/2,−17·373³/2¹⁷}, and {−7·137³·2083³,−7·11³} (gap:rational-isogeny-j-tables).” Cite Lemos §2, pp. 5–7, and use these two contracts explicitly. Keep the integral-divisor argument and finite-image theorem here. If proving the coordinate theorem locally instead, remove the supplier claim and name its proof inputs.

   **Repair test:** Existence of some genus-zero coordinate also permits u=2t, which changes the first formula to (u/2+16)³/(u/2); a generic j-map therefore cannot certify the specified numerator. At level 11 the full table has three entries, whereas the non-CM subtable has two. The proposed exact tables retain the CM point −32768 before the CM exclusion. Object searches found examples of X₀(11) and a modular unit at X₀(37), but no exhaustive table in the allowed main/supplied-head inputs.

13. **F13** (P2) The integral congruence theorem is another missing statable headline

   **Location:** packages/EllipticCurveModularityPartII/README.md:387: “Prove the integral prime-power-ideal Sturm theorem”; Suggested.lean:16–25 lists no such acceptance theorem or missing carrier.

   **Claim:** All deep, locally owned results that are statable at the pins are represented in the acceptance file.

   **Witness:** TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:315 defines modFormCharSpace. Mathlib/NumberTheory/ModularForms/QExpansion.lean:171 supplies coefficients; Mathlib supplies number fields, integer rings and ideals. The mod-ideal theorem needs no missing carrier.

   **Exact repair text:** “Add integral_sturm_congruence with a sorry proof: for N>0, k:ℕ, χ:(ZMod N)ˣ→*ℂˣ, a number field K, an embedding σ:K→ₐ[ℚ]ℂ, an ideal J of O_K, f in modFormCharSpace (k:ℤ) χ, and a:ℕ→O_K satisfying (qExpansion 1 f).coeff n=σ(a n) for every n, if a n∈J whenever 12n≤k·(Gamma0 N).index, then a n∈J for every n. Use the actual modular-form carrier and coefficient identity; import TauCeti.NumberTheory.ModularForms.DiamondOperators. Name this theorem in the module docstring and README.” This is the one-form version of S03; apply it to a difference for the two-form statement.

   **Repair test:** For k=0,N=1,f=1,J=(2), a₀=1 fails the hypothesis at n=0; f=0 satisfies it. For Δ,k=12,N=1,J=(2), a₁=1 is detected at 12·1≤12. At weight two and J=(2)² the theorem gives the needed modulus four. The coefficient sequence is tied to every coefficient of an actual modular form, so it is not a free-data stand-in. Tau Ceti's SturmBound.lean:79–108 proves characteristic-zero vanishing/equality, not this ideal-congruence theorem.

Checked head: add3164d8254f947810f06d1c100ea3946c38a4d. This report is the only package file written. No Lean command or build has been run.

## Earlier findings: verification at this head

`a/Fxx` refers to the first codex review; `b/Fxx` to the independent first-round review. The repaired passages below were read in this head, not inferred from the repair report. “Repaired” addresses the earlier defect; new defects are separately numbered above.

| Earlier finding | Status | Repaired passage and independently checked witness |
| --- | --- | --- |
| a/F01, fictitious central supplier | Repaired | README:7: “this Part II owns the six comparison layers below.” No supplier edge to EllipticModularityEffectiveComparisons remains. The thirteen named gap entries replace the invented imports. |
| a/F02, admitted constructions | Repaired | Suggested.lean:25: “They remain README targets”; all ten supporting declarations have real bodies and only six theorems contain sorry. Pruning introduced the headline omissions S02/S09. |
| a/F03, admitted examples | Repaired | README:140 retains “localTerms(0,0)=(1,1,1,1,1).” There are zero Lean examples. Recomputed all four local-table Checks; no admitted examples were renamed into boundary theorems. |
| a/F04, nonexistent imports | Repaired | Suggested.lean:6 imports `TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.BaseChange.Basic`. All seven Tau Ceti import files exist at the pin; the unused QuadraticTwist import is gone. |
| a/F05, ErdosProgressionPowers overlap | Not repaired, settled as not actionable here | README:669: “ErdosProgressionPowers §1.1 uses removed-prime bounds”. The supplied order puts this package at line 191 and ErdosProgressionPowers at 262. The supplied Erdos head still owns overlapping §1.1 targets at README:589–611. The reason for declining the proposed upward import is correct. No re-raising. At N=11 the sharp H=13+4√3 and majorant H=169 are distinguished. |
| a/F06, unavailable sections | Partly repaired | README:54: “Each gap names the required mathematical input and the owning supplier”. All thirteen slugs and needs sentences match plan.json exactly; nonexistent R/BSD section locators are removed. The precision requirement remains deficient in S05; S01 identifies additional uncontracted inputs. |
| a/F07, duplicate pinned carriers | Repaired | README:36: “Consume WeierstrassCurve.torsionGaloisAction”; Suggested.lean:108 uses its actual additive action. Scalar extension, coefficient fields, ramification groups and finite-flat categories were independently located at the pin. Only small native specializations remain. |
| a/F08, unconditional Chen old vanishing | Repaired | README:607: “factorization is between p-new quotients; vanishing into the full nonsplit Jacobian additionally uses genus zero”. At r=11, dim J₀(11)=1; at r=1 it is 0. General new-to-new and genus-zero new-to-full statements are separated. |
| a/F09, missing exact divisor | Repaired | README:24: “r>0, p prime and gcd(r,p)=1”. At r=p=5, gcd(25,5)=5; at r=5,p=11, gcd(121,5)=1. The hypothesis survives all general quotient specifications. |
| a/F10, p>37 restriction on integrality | Repaired | README:521: “a prime p outside that set”; the containment theorem has no non-CM hypothesis. p=11 and 17 are included. The native acceptance omission is S02. |
| a/F11, omitted ℓ=5 | Repaired | README:429 and Suggested.lean:131 say “ℓ ≥ 5”/`5 ≤ ell`. 4·5=20 and 4·7=28 are both excluded degrees; 4·3=12 is permitted. |
| a/F12, two-isogeny cycle | Repaired | README:389: “Its inputs do not include the full-two realization”. §4.3 depends on matrix selection and isogeny/conductor inputs; §4.4 depends on §4.3. No reverse realization edge remains. S07 concerns different forward references. |
| a/F13, provenance/composite locator | Repaired | README:682: “Use pp. 199–201 for composite cyclic degrees; this citation is uncertified.” sources.toml contains eight unique works with seven legal cached texts and one settled uncertified work. Mazur's prime list is not substituted for Kenku's composite result. |
| a/F14, Lean format | Repaired | Suggested.lean:1: `import Mathlib`; :33: `namespace TauCetiRoadmap.EllipticCurveModularityPartII`. Six theorem declarations, no lemma, no set_option, one module docstring, declaration docstrings and ordered layer comments. All sixteen own Lean names occur in README. |
| a/F15, detached proved block | Repaired | README:633 keeps the integral-parameter target; :389 keeps matrix selection. The detached arithmetic namespace and proved block are absent. No replacement admitted tests were added. New action Checks are addressed in S08. |
| a/F16, period normalization | Repaired | README:26: “its normalized period is 2πi W(f)”. For exp(2πiz), W=i/(2π), normalized period=−1, reversal=+1. The two-term values are −2 and 0, respectively. Source sign slips are recorded below. |
| b/F01, one-tactic threshold padding | Repaired | README:171–172 retains “1≤sharpF(N)” and “sharpF(N)=1” in the API; no corresponding Lean declarations remain. The repair correctly deleted them rather than proving them in the acceptance file. |
| b/F02, format/process narrative | Repaired | README:1 starts “# Roadmap:”; :28 has “Exact supplier contracts”; six numbered layers end with Examples/Dependencies. The old acceptance namespace and field-block/process paragraphs are gone. |

## Verified sound

Read all **683 README lines**, all **167 Suggested.lean lines**, all **16 declarations** (nine definitions/abbreviations and one instance, six theorems), all **42 numbered target subsections**, their separate API assertions, and all **65 bullets under Checks**. This head uses numbered prose targets rather than bold theorem blocks. Read both repository rules files, both earlier reports, the repair report, the plan, source manifest and supplied signatures.

Compared every one of the **16 supplied elaborated types** with the README and source definition. All required E.IsElliptic, NeZero N, Fact ell.Prime, number-field, prime-above, nonzero-element and torsion hypotheses are retained. No section `variable`/`include` context exists that could silently lose a binder. I used the worker's supplied elaboration record and did **not** rerun Lean or a build.

The six retained theorem signatures have mathematical content beyond a defining equation or one pinned lemma. In particular norm_bound combines ideal/norm divisibility, nonvanishing, embedding count and a product estimate; it is not just the norm product formula. No padding theorem is retained. The non-CM and cyclic-isogeny predicates use geometric endomorphisms and the geometric kernel, respectively.

Checked **37 source-locator groups**, listed below, against seven legal cached texts. Kenku remains uncertified. Checked **12 cross-roadmap citation groups**: EllipticCurves Layers 1, 2, 3, 4, 4.5b, 5; ModularForms Layers 3, 8, 10; ModularCurves 1A/1D; StableReduction 5; JacobianChallenge D–F. Also checked ErdosProgressionPowers §1.1 at its supplied head and located the corrections in ModularForms 6/8G, Chebotarev 10 and ComputationalNumberTheory 3.4. All **27 supplied sibling heads** were searched by object in both files, in addition to main, Completed, board packages and the read-only roadmap index. No duplicate fully qualified name of a retained declaration was found. Searches, rather than complete mathematical audits of unrelated siblings, are what this ownership statement certifies.

The seven Tau Ceti imports exist. Native evidence includes Mathlib/Algebra/Module/Torsion/Basic.lean:972 and :1010 (killed-by-integer subgroup and ZMod module, with no finiteness or rank-two assertion); Mathlib/Algebra/Module/ZMod.lean:81 (additive map to linear map); Mathlib/RepresentationTheory/Irreducible.lean:29 (simple subrepresentation order, hence nontriviality); Mathlib/RingTheory/Norm/Transitivity.lean:261 and FieldTheory/PrimitiveElement.lean:360 (finite separable embedding product/count). The characteristic-zero number-field setting supplies separability.

Tau Ceti evidence: AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64 and :85; RepresentationTheory/BaseChange.lean:100; NumberTheory/ModularForms/Newforms/Basic.lean:202 and Newforms/Nebentypus.lean's fixed-character newspace comparison; NumberTheory/ModularForms/DiamondOperators.lean:279; Newforms/Fields.lean:48; Newforms/NumberField.lean:152 and :157; RingTheory/Ideal/RamificationGroup.lean:60; AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:131. Their source files provide the advertised carriers, not the separately requested elliptic conductor/weight or geometric comparison theorems.

Mathlib and Tau Ceti checkout hashes equal the manifest pins, respectively `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The original diff has seven files, all inside packages/EllipticCurveModularityPartII. No package implementation, git state, pin or source manifest was changed by this review.

The required read-only dependency gate exited 0:

```text
depcheck: 28 roadmaps, 236 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. This checks roadmap-level supply, not the within-layer edges of S07. The accepted overlap disposition leaves ownership here, earlier than ErdosProgressionPowers; no later roadmap is suggested as a supplier.

### Declaration table: context and computed controls

Every declaration is in TauCetiRoadmap.EllipticCurveModularityPartII, inside a noncomputable section, with no ambient mathematical section binders. K in norm_bound is universe-polymorphic; the fixed ℚ algebraic closure is the geometric field in the torsion declarations. Computed controls test the statement; they do not purport to prove a universal theorem by examples.

| Declaration / section | Explicit variable and instance context | Instances and computed sides | Result / change |
| --- | --- | --- | --- |
| localTerms / 1 | p,e:ℕ; no instances | (0,0)→five ones; (0,1),(1,2),(4,2)→five zeros; (2,2)→(1/4,0,−1,1,0); (3,2)→(5/9,1,1,−1,0) | Table and junk branches agree. |
| martinValue / 1 | N:ℕ | N=0→0 by branch; N=1→1/12−1/2−1/4−1/3+1=0; N=11→1; N=30→1; N=35→3 | Formula agrees. |
| newDimension / 1 | N:ℕ, NeZero N | N=1,11,30,35: native dimensions 0,1,1,3; N=0 has no instance | Actual trivial-character newspace; not full Γ₁. |
| dimension_comparison / 1 | N, NeZero N | Arithmetic/native sides at 1,11,30,35: 0=0,1=1,1=1,3=3 | Source theorem matches signature. |
| martin_bound / 1 | N, NeZero N | N=1:0<2, equality criterion false; 11:12=12, prime≡11; 35:36=36, exceptional composite; 30:12<31, criterion false | Both directions of iff tested. Arithmetic expression tested at all 1≤N<2000: zero failures. |
| norm_bound / 2 | K:Type u, Field, NumberField; ell prime; I prime/nonzero with contraction (ell); x∈I,x≠0; B:ℝ, every complex embedding bounded | ℚ,ell=5,x=5,B=5:5≤5≤5. ℚ(√2),ell=2,x=√2,B=√2:2≤abs(−2)=2≤2. x=0 would give 5≤0; I=(1) contracts to (1), not (5) | Correct nonvanishing and prime-above conditions. |
| GeometricTorsion / 5 | E/Q, E.IsElliptic, n:ℕ | n=0:whole group; n=1:{0}, cardinality1; n=2:four points over ℚ̄ | No false rank-two assertion at n=0. |
| torsionModule / 5 | same E,n | n=1 zero module; n=2, 2P=0 and 3P=P; n=0, ZMod0=ℤ acts on all points | Native specialization, no lost binder. |
| torsionRepresentation / 5 | same E,n; automorphism group of ℚ̄/Q | On E:y²=x³−2, σP₀=P₁, τP₁=P₂, στP₀=P₁≠P₂=τσP₀; identity=P₀ | Real body has correct order; add S08 README controls. |
| FullRationalTwo / 5 | E/Q, E.IsElliptic | x³−x:4=4 true; x³−2x:2≠4; x³+x+1:1≠4 | Cardinality detects full rationality. |
| RationalTwo / 5 | E/Q, E.IsElliptic | Same curves:3,1,0 nonzero rational two-points respectively | Nonzero conjunct excludes the identity. |
| full_two_irreducible / 5 | E elliptic; ell:ℕ, Fact ell.Prime; 5≤ell; FullRationalTwo E | ell=5/7 would give forbidden degree20/28. At ell=3, E:y²=x(x−27)(x−32) has all four two-points and P=(36,36) with doubling slope7,2P=(36,−36), hence3P=0 | The ell≥5 bound excludes a genuine reducible example. At5 conjugation eigenvalues1,4 are distinct. README/Lean agree. |
| rational_two_irreducible / 5 | E elliptic; ell prime; 11≤ell; RationalTwo E | ell=11 would give forbidden22; ell=7 permits14 and fails bound; eigenvalues1,10 distinct at11 | README/Lean agree. |
| NonCM / 6 | E elliptic; every geometric Hom quantified | j=1728 has order4 automorphism, whereas invertible integer scalars have orders1/2; j=0 has order3; j=−122023936/161051 is nonintegral and hence non-CM | Correct geometric rather than rational endomorphisms. |
| HasCyclicIsogeny / 6 | E elliptic,n:ℕ; existential F elliptic and actual f | id:degree1,kernel order1/exponent1; two-quotient:degree2,order2/exponent2; [2]:degree4,kernel order4/exponent2 | Cyclic condition excludes [2] as a witness; not a degree-only predicate. |
| lemos_surjectivity / 6 | E elliptic, NonCM; n>1, HasCyclicIsogeny; p prime,p>37 | p=41 target automorphism group order2755200; p=37 excluded; n=1 excluded; CM examples excluded | Signature is the full native action and agrees with Lemos. Source/dependency issues do not change its truth. |

### README statement table

The hypotheses in the statement column are retained throughout each control. “Excluded” means the test input does not satisfy them; it is not a proof by vacuity. For geometric theorems, computed dimensions/orders/valuations and comparisons are boundary controls, not claims to have constructed the missing objects. Definitions repeated under two headings receive two rows.

| Statement / location | Instances tried and computed values on each side | Result / change |
| --- | --- | --- |
| §1.1 F♯, :97 | N=1: exponent0, F=1; N=11:μ/6=2,g=1, F=(1+√2)²=3+2√2; N=35:μ/6=8,g=3,F=(1+√8)⁶ | Formula agrees; prerequisite order S07. |
| §1.2 G♯, :105 | N=1,2,4:lcm(N,4)=4,μ=6,G=4; N=3:lcm=12,μ=24,G=9; N=11:lcm=44,μ=72,G=13+4√3 | lcm rather than 4N is correct. |
| §1.3 H♯, :113 | N=11:max(5.828427,19.928203)=19.928203; N=35:max(3148.634919,62.856406)=3148.634919 | Both branches of maximum tested. |
| §1.4 sharp bound/iff, :121 | N=11,35 give 12=12,36=36; N=30 gives12<31; N=1 gives0<2 | Both equality directions and composite exception agree. |
| §1.5 local factors, :130 | (2,1)=(1/2,0,−1,−2,−1); (2,4)=(3/8,1,0,0,0); (3,3)=(16/27,0,0,1,0); (5,1)=(4/5,0,0,−2,−1) | Covers odd/even exponents and exceptional primes, in addition to four README Checks. |
| §1.6 five-product expression, :148 | N=0:0; N=1:empty products all1, result0; N=11:10/12+1/2+2/3−1=1; N=30:1; N=35:3 | No 0/0 or factorization-of-zero issue. |
| §1.7 sharpF, :166 | 1→1;11→5.828427;35→3148.634919, with exponents0,2,6 respectively | Same as §1.1, no differing convention. |
| §1.8 sharpG, :183 | 1→4;4→4;11→19.928203; wrong 4N at N=4 gives9 | Same as §1.2. |
| §1.9 sharpH, :200 | 1→4;4→4;11→19.928203; for t=7, F<t true and G<t/H<t false; t=23 all true | Strict iff and maximum agree. |
| §1.10 native comparison, :218 | N=1,11,30,35:0=0,1=1,1=1,3=3; at N=17 the full Γ₁ cusp dimension5 differs from trivial-character dimension1 | Correct carrier, no freely supplied dimension. |
| §1.10 majorants, :220 | N=11:F♯≈5.828≤9;G♯≈19.928≤169; N=35:F♯≈3148.635≤531441,G♯≈62.856≤2401; N=1:√(1/6)>1/6 but exponent0 gives1=1 | Small-index exception treated correctly. |
| §2.1 norm estimate, :243 | ℚ,x=5:5≤5≤5; ℚ(√2),x=√2:2≤2≤(√2)²; x=0 gives forbidden5≤0; B=0 incompatible with nonzero embedding | Hypotheses sufficient; no B≥1 needed. |
| §2.2 removed-prime estimate, :251 | p=2:p+1−2√p≈0.171573>0; M₀=11 gives exponent2 and upper bound≈5.828427; ell=7 exceeds it | Correct strict positive gap and dimension exponent. |
| §3.1 finite-prime rationality, :281 | Level11:μ/6=2; a₂=−2, a₃=−1, a₄=4−2=2; at level1 dimension0 gives no normalized form | True target; missing 8G import and Lean headline, S06/S09. |
| §3.2 small coefficients, :289 | N=11:g=1 so F♯≈5.828>μ/6=2; ell=7 therefore differs from tested prime2. Good-trace gap≤4√2≈5.657≤5.828; removed-prime gap≤3+2√2≈5.828 | Coefficient prime cannot enter the small-prime range. |
| §3.3 rational comparison, :297 | Rational orbit degree1:associated dimension1 and conductor N¹=N; N=11,ell=7 meets sharp numerical threshold, while 7>9 is false | Not a majorant-only theorem; conditional lift contracts remain essential. |
| §4.1 finite recognition, :327 | N=11:lcm44,μ/6=12, eligible primes3,5,7; level11 curve a₃=−1 gives #C(F₃)=5≢0 mod4, so both finite and all-prime conditions fail | Genuine negative control to the iff, not merely a bound computation. |
| §4.2 trace transfer, :335 | N=11,q=7:4√7≈10.583<19.928=G♯; removed-prime bound(1+√7)²≈13.292<19.928; equal trace implies equal point count q+1−a_q | Bad-reduction alternative is excluded only at small tested primes, as stated. |
| §4.3 two-isogeny repair, :343 | Full case:degree1, torsion multiplier1. Nonfull case:degree2, invertible modulo5 with inverse3; both preserve rational Tate modules | Correct direction and odd-prime restriction; no reverse realization dependency. |
| §4.4 full-two realization, :351 | N=11:H♯≈19.928; ell=23 satisfies both F and G, ell=7 satisfies F but not G | Both requirements genuinely used. |
| §4.5 conductor adapter, :359–363 | At good ell:coefficient-prime exponents0=0; multiplicative with valuation divisible by ell:1−1=0; additive:positive M₀ exponent versus0 in prime-to-ell conductor | Correct distinction; gaps need exact hypotheses, S05. |
| §4.6 filters, :368 | p=2,e=0,a=3:(1−3X+2X²,1); e=1:(1−3X,1); e≥2:(1,1). p=3,e=1,a=−1:(1,1−5X); e=2:(1,1−4X+3X²) | All six branches agree with source. |
| §4.7 integral Sturm, :387 | k=2,L=11:μ/6=2; ideal(2)²=(4). General k=0,L=1 tests a₀; k=12,L=1 tests a₀,a₁, detecting Δ versus0 | Stated specialization true; restore general theorem, S03. |
| §4.7 finite matrix selection, :389 | GL₂(Z/4) has96 elements;24 satisfy determinant/fixed-vector conditions. For64 eligible pairs with odd upper-right/nonzero lower-left, their product violates det(1−g)=0 | Finite exhaustive control validates subgroup-closure step. |
| §5.1 degree exclusions, :413 | 2·11=22 and4·5=20 absent from list;2·7=14 and4·3=12 present;4·7=28 absent | Bounds and ℓ=5 extension agree. |
| §5.2 kernel construction, :421 | C₂×C₅ has order10 and exponent10; E/T→E→E/T′ kernel has order4 and exactly2 elements killed by2, hence C₄ | Full-two case correctly permits an isogenous source curve. |
| §5.3 full-two irreducibility, :429 | Reducibility at5/7 would force20/28; complex conjugation at5 is diag(1,4), determinant4=−1 | Absolute upgrade uses oddness, not irreducibility alone. |
| §5.4 rational-two irreducibility, :437 | Reducibility at11 would force22; cyclic14 supplies order2 and order7 kernels, so7 cannot be included | Threshold11 correct, including CM curves. |
| §5.5 geometric torsion/module, :446 | n=0 entire point group;1 cardinality1;2 cardinality4. On E[2],2P=0 and3P=P | Carrier/module agree with pin; action needs S08 controls. |
| §5.5 rational predicates, :454 | Cubics x³−x,x³−2x,x³+x+1 have respectively3,1,0 rational roots; rational E[2] cardinalities4,2,1 | True/true, false/true, false/false for FullRationalTwo/RationalTwo. |
| §5.5 absolute upgrades, :462 | ell=5:1≠−1=4;ell=11:1≠10;ell=2:1=−1 | Oddness is load-bearing and retained. |
| §6.1 potential good reduction, :481 | At p=11, χ_p=2 gives χ_p²=4≠1, excluding multiplicative at p. q=23 has q²≡1 mod11; q=3 gives9≠1 | Both coefficient-prime and other-prime cases agree. |
| §6.2 correspondence, :489 | r=1,2,3,5,7,13:g(X₀(r))=0; r=11:g=1; p=11 normalizer/Borel product sizes yield GL₂ order13200 | Genus-zero old vanishing correctly separated from general isogeny. |
| §6.3 optimal winding quotient, :497 | Boundary divisor at p=11 has order11, so image class cannot be0; nonzero quotient dimension≥1; A(Q) finite means free rank0, not dimension0 | Source supports nonzero quotient; supplier precision S11. |
| §6.4 formal immersion, :505 | Cusp cotangent dimension1; zero map image dimension0; a surjective pullback has dimension1. p=11,q=23 gives unramified e=1<22 | Correct map direction and residue range. |
| §6.4 point-image torsion, :505/:509 | If m kills cusp differences and h kills A(Q), then h·m·u(P)=0 even if A(K) itself has positive rank | Correct finiteness field; cusp-divisor input S01. |
| §6.5 denominator exclusion, :513 | p=11,q=23:e=1<22; a putative negative v₂₃(j) forces meeting cusp and a torsion image reducing to0, hence image0 | No good-prime-only escape; geometric proof conditional on named inputs. |
| §6.6 integral j, :521 | All q≠p have v_q(j)≥0 by §6.5, and v_p(j)≥0 by §6.1; rational denominator therefore1. j=1728 allowed without non-CM | Valid general containment theorem; native headline S02. |
| §6.7 actual modular coordinate, :529 | r=2:t=−16 gives0,t=8 gives1728; t=0 is cusp. Numerator degrees3,4,6,8,14 and constants4096,729,125,49,13 | Arithmetic agrees; geometry is a supplier requirement. |
| §6.8 proper-image classification, :537 | p=41:outside rational prime-degree list; p=37:allowed degree37, so proper Borel can occur. Split-Cartan source begins11 and excludes13 | Correct threshold; BPR input ownership S01 and precise exceptional gap S05. |
| §6.9 twists, :545 | At p=5,−I has determinant1, χ²=1, SL₂ order120 with commutator equal itself. p=3 has no a with a²≠0,1 | Correct universal p≥5 statement; exact pin S10. |
| §6.10 finite j images, :553 | Large-level lists have2+2+2=6 non-CM entries; excluded −32768 is CM. Five integral sets have sizes25,13,8,6,4; smallest p>37 is41, next43 | The all-prime target is not certified by sampling41; proof of uniform exclusion still required. |
| §6.11 Lemos, :561 | Cyclic degree n>1 has a prime divisor r; allowed non-CM r count8. At p=41, GL₂ order2755200, not merely its projective quotient | Final statement and source agree. |
| §6.12 numerator definition, :570 | r=2:monic degree3,constant4096;7:degree8,constant49;13:degree14,constant13;11:zero polynomial, natDegree0 | Five levels versus junk values handled. |
| §6.13 signed-divisor sets, :589 | Signed divisor counts26,14,8,6,4 collapse to25,13,8,6,4 values. At13 values −39091613782464,576,2101248,2045023375454208 | Exact integer divisions; both signs; no t=0. |
| §6.14 exact-divisor comparison, :607 | r=p=5:gcd(25,5)=5 excludes involution; r=5,p=11:gcd121,5=1,level605; weight2 factor(√121)⁰=1 | Atkin–Lehner import, S04. |
| §6.14 general old/new comparison, :607 | r=11,p=17:old base dimension1; r=1:0. Taking old quotient kills the dimension1 obstruction, not the whole nonsplit Jacobian | General-versus-genus-zero repair is sound. |
| §6.14 winding class and nonvanishing, :609 | If projected e=0, annihilator contains1 and quotient dimension0; at p=11 nonzero divisor class has order11, excluding this case | Nonvanishing is a substantive target. Absolute homology class is determined by periods; its associated cusp divisor is not a nonzero homology boundary. |
| §6.14 period comparison, :619 | exp(2πiz):W=i/(2π),2πiW=−1; exp(2πiz)+2exp(4πiz):W=i/π,period−2; difference gives0 | Orientation/scalar correct. Do not import the source's erroneous L-value sign. |
| §6.14 coefficient support, :621 | For p=11 the unsupported indices include1,…,10; support on11ℕ descends to level r, where dimensions at2,3,5,7,13 are all0. At r=11 dimension1, so that range extension would fail | Correct genus-zero restriction and source q^(n/p) convention. |
| §6.14 cotangent comparison, :623 | Nonzero A supplies dimension≥1; cusp dimension1. If a₁(T_n f)=a_n(f)=0 for every (n,p)=1, coefficient-support conclusion gives f=0, contradicting nonzero injection | Map is from A cotangent to C cotangent; exact integral injection requires S11. |
| §6.15 integral parameter, :633 | f=(T+16)³,t=−16:0 and−16 divides4096; t=8:1728. f=T+1,t=1/2 gives3 despite t nonintegral; degree2 minimum matters | Statement correct; t=0 excluded. |
| §6.15 NonCM, :641 | j=1728 endomorphism order4; j=0 order3; integers only ±1 are finite-order units. Third example j=−122023936/161051 has denominator161051 | Three discriminating controls and geometric field correct. |
| §6.15 cyclic isogeny, :649 | Identity degree1 accepted by predicate but not final theorem; quotient degree2 cyclic; [2] degree4 with C₂² kernel not cyclic | No rational-generator condition imposed. |
| §6.15 automorphism target, :657 | For p=41 additive automorphisms of C₄₁² are automatically F₄₁-linear and number2755200; for n=1 target group has order1, excluded in final prime range | Native target is correct, not a projective or determinant-one image. |

### API and convention controls

These rows cover the additional unnumbered assertions and Checks in the definition paragraphs; repeated Check values above are not new numerical tests.

| Statement | Computed instances / both sides | Result / change |
| --- | --- | --- |
| Arithmetic rather than geometric Frobenius | E:y²=x³−x/F₅ has8 points; a₅=6−8=−2; T²−aT+5=T²+2T+5 and det(1−FT)=1+2T+5T². The inverse has determinant1/5 rather than5 | Correct sign and determinant. |
| Γ₀ index | μ(1),μ(2),μ(3),μ(4),μ(11),μ(16),μ(35),μ(44)=1,3,4,6,12,24,48,72 | Product convention correct. |
| Arithmetic/deletion/residual levels | At multiplicative q≠ell with ord_qΔ=ell: exponents1,0,0; at additive ell: M₀ exponent>0, prime-to-ell exponent0 | Different objects remain distinct. |
| Cyclic kernel versus generator | Stable C₂ has order2, rational generator automatic; a stable C₅ line has order5 without requiring five rational points; C₂² order4 but exponent2 | Correct stable-subgroup convention. |
| Cartan normalizer convention | p=11:|F₁₂₁×|=120, normalizer240, GL₂13200; ratio2 | Correct index; basis changes conjugate. |
| Winding orientation | One term gives−1, reversed gives+1; two terms1,2 give−2; terms1,−2 give0 | Correct normalized rather than raw differential. |
| localTerms exponent-zero API | p=0,1,2,4,e=0 all five coordinates1 | e=0 precedes primality. |
| localTerms nonprime API | p=0,1,4,e>0 all five coordinates0 | Division by p never evaluated in these branches. |
| localTerms prime API | p=2,e=3 gives(3/8,0,1,0,0); e=4 gives(3/8,1,0,0,0); p=3,e=3 gives(16/27,0,0,1,0) | Branch thresholds and natural subtraction correct. |
| martinValue API | N=0→0;N=1→0;N=11 five-product formula→1;N=35→3 | Definition matches formula and total-value convention. |
| F♯≥1 and dimension-zero | At1,2,3,4 exponent0 gives1=1; at11 value5.828>1 | Correct API, appropriately absent from Lean. |
| G♯≥1 / four-divisibility | At4,μ4=6 givesG=4; at44,μ44=72 givesG=19.928; at11 the level is44 | Correct. |
| H♯ order API | At11 F≤H strict,G=H; at35 F=H,G<H. H<7 iff conjunction: false=false; H<23 iff conjunction:true=true at11 | Both max branches and iff directions. |
| Filter constant coefficients | Displayed four pairs have constants(1,1); zero-ring interpretation gives(0,0)=(1,1) | Zero ring allowed, no false nonzero assertion. |
| Filter coefficient base change | (1−3X+2X²,1) mapped ℤ→F₂ is(1+X,1), exactly the p=2,a=1 formula; odd p=3,e=1,a=−1 maps to(1,1+X) | Ring-homomorphism law works in small characteristic. |
| Filter operator convention | R_p(q+2q²)=q^p+2q^(2p), R_p² givesq^(p²)+2q^(2p²); at p=2 exponents4,8 | X² means R_(p²), not twice R_p. |
| Matrix direction Check | g=[[1,1],[0,1]],h=[[1,0],[2,1]] individually det(1−g)=det(1−h)=0; products have determinant2 mod4 | Closure forces lower-left zero, not upper-right. |
| Rationality/isomorphism API | Rational two-point sets have sizes4,2,1 in the three curves; a rational isomorphism is a bijection preserving zero and [2] | Both predicates transported; full implies nonzero point because4>1. |
| Numerator monic/degree API | At r=2,3,5,7,13 leading coefficient1,degree r+1=3,4,6,8,14 | No monicity promised at junk r. |
| Numerator constant/junk API | Constants4096,729,125,49,13; r=11 polynomial0,degree0,constant0 | No accidental claim degree12 for zero polynomial. |
| Finite j membership iff | r=2,j=0 witnessed by t=−16; r=5,j=64 by t=−1; r=11 no witnesses, set empty | Both inclusion directions reduce to exact quotient definition. |
| Finite j cardinality API | 26 signed divisors at r=2 yield25 values;14 at3 yield13; at5,7,13 there are8,6,4 distinct values | Duplicate removal correctly affects first two. |
| p/q range Checks | First q≡±1 mod11 is23; first mod17 is67. Lower bounds21 and33 are both>13. At q=2,e=1 the specialization test1<1 fails | All five r prime to q, no accidental use at2. |
| Degree-one and CM boundary | n=1 identity exists for every E but final hn false; j=0,1728 fail NonCM; p=37 fails37<p | All advertised exclusions retained. |

The **65 Check bullets** were accounted for as follows: Layer 1 has20 (four local table, four dimension, three F, three G, three H, three comparison); Layer 2 has3; Layer 3 has3; Layer 4 has8; Layer 5 has6; Layer 6 has25 (four numerator, four finite sets, five geometric/period, three residue/cotangent, three integral-parameter, three NonCM, three isogeny). Their numerical assertions agree. S08 identifies a discrimination failure in a true symbolic Check, rather than a false numerical value.

### Headline coverage

| Headline or deep local result | Acceptance status at this head |
| --- | --- |
| Martin dimension expression and sharp bound/equality | Both present on actual newspaces. |
| Integral norm lower/upper bound | Present on a number field and its integer ring. |
| Removed-prime exponent bound | Correctly named unavailable: arithmetic conductor/deletion level and residual representation comparison are missing. |
| Finite-small-prime coefficient rationality | Statable on the pinned primitive form and its coefficients; absent, S09. |
| Sharp rational comparison curve | Named unavailable: conductor and Serre-weight interfaces are missing. |
| Sharp full-two comparison curve and finite good-prime test | Named as Kraus realization unavailable; the exact conductor/reduction conditions cannot yet be stated natively. |
| Integral ideal-congruence Sturm theorem | Statable on native modular forms, coefficient embeddings and ideals; absent, S13. |
| Full-two and rational-two irreducibility, including absolute versions | Both present, with ranges ℓ≥5 and ℓ≥11. |
| Mixed Cartan correspondence, optimal winding quotient, formal immersion | Named unavailable with missing modular-curve, Jacobian and integral-model carriers. |
| Integral j under nonsplit-normalizer containment | Incorrectly grouped with those unavailable constructions; conclusion and hypotheses are statable, S02. |
| Lemos surjectivity | Present as surjectivity of the actual torsion action. |

The local tables, thresholds, filters, finite signed-divisor definitions and integral-parameter arithmetic are infrastructure or Checks. Deleting their former acceptance-file padding remains appropriate. The new S13 statement is a general congruence theorem, not the one-tactic characteristic-zero equality result already at the pin.

Common excluded-domain controls were also inspected: NumberField rules out zero rings, positive characteristic and inseparable extensions in the norm theorem; N's NeZero instance rules out the level-zero newspace while martinValue explicitly returns zero there; Fact prime excludes q=1 and composite characteristics in image theorems; E.IsElliptic excludes singular/nonreduced cubic curves. The representation definitions still admit n=0 and1, with the values recorded above, but the irreducibility theorems exclude them. Native geometric torsion carries the actual absolute-Galois action, not an arbitrary topology or an arbitrary rank-zero module. The integral-model targets name smooth loci and Néron models, so a square-zero thickening is not silently treated as a smooth curve. Equal-characteristic DVRs are outside the mixed-characteristic specialization contract. No cover, fan or independently quantified universe-size bound occurs in these signatures.

Nonblocking unused-hypothesis note: norm_bound's hI0 follows already from hx and hx0, since x∈(0) would give x=0. Removing hI0 leaves exactly the same admitted instances. This is a redundant hypothesis, not an additional finding.

### Declared-gap audit

All thirteen entries have named suppliers, matching slugs and needs text in README and plan.json. Every supplier is earlier in the supplied order. No gap is rejected merely because the supplier has not implemented it. The modularity, conductor, local comparison and modular geometry notions were searched by object at the pins; native carriers do not provide the missing comparison theorems.

| Gap | Precision, minimality and computed boundary control |
| --- | --- |
| elliptic-modularity | Exact conductor and every good-prime trace specified; degree-one level11 newform gives a₂=−2. Existing native cusp spaces do not supply modularity of an arbitrary E. |
| optimized-weight-two-lift | ℓ≥5, irreducibility, weight2 and prime-to-ℓ conductor retained; ℓ=5 is included, ℓ=3 excluded. This is distinct from a deletion level possibly containing ℓ. |
| deletion-level-lowering | Exact BS equation and trace lemma identify the level and congruences; multiplicative exponent1 is deleted precisely when ℓ divides ord_qΔ. ℓ=3 is included. |
| conductor-and-weight | Compound and underspecified alternative, S05; q≠ℓ with valuation ℓ gives residual exponent0, not elliptic exponent1. |
| oddness-and-finite-images | Compound and unspecified classification/bounds, S05; determinant−1 has eigenvalues1,4 at5, but1,1 at2. |
| newform-residual-and-conductor | Both clauses have usable mathematical content but need separate needs sentences, S05; d=1 gives conductor N, d=2 gives N². |
| coefficient-bound | Prime q∤N and every embedding retained; a₅=−2 on y²=x³−x has2≤2√5. No bound at bad primes is inferred from it. |
| modular-curves-and-jacobians | Independently consumed constructions are bundled, S05; explicit coordinate and rational-point classifications are absent, S12. A rescaling t↦2t changes the displayed numerator. |
| chen-isogeny | Coherent correspondence/isogeny identification with exact coprimality; r=11 has old dimension1, so the p-new quotients are necessary. Genus-zero old vanishing is local, not re-requested. |
| integral-winding-comparison | Integral map and ramification condition not specified, S11; q=2,e=1 fails1<1, while q=23,e=1 satisfies1<22. The ω normalization is correct. |
| modular-rank-zero | All coefficient-field degrees specified; d=2 permits an abelian surface with finite rational points, not merely an elliptic factor. Rank-zero and nonzero dimension are compatible. |
| cyclic-isogeny-degrees | Precise but independent all-degree/non-CM-prime clauses should be split, S05. Degrees20,22,28 excluded;12,14 allowed. Composite source remains uncertified. |
| neron-torsion-specialization | Includes full torsion and strict e<q−1; unramified q=23 passes, q=2 fails. General Jacobian/group carriers do not prove this specialization theorem. |

### Source locator ledger

Each row records a locator group actually read in the named cached text. Page numbers are the printed or explicitly identified preprint/author-copy pages, not cache-page offsets. All statements here are paraphrases.

| # | Source locator and extraction lines | Result of comparison |
| --- | --- | --- |
| 1 | Kraus1997 equation (7), p.1143, line240 | Square root before power; exponent2g⁺(N). |
| 2 | Kraus1997 equation (8), p.1144, line270 | lcm(N,4), exponent2. |
| 3 | Kraus1997 equation (9), p.1144, line279 | Maximum of the two sharp thresholds. |
| 4 | Kraus1997 Theorem3, p.1144, line249 | Rational coefficient comparison at the sharp threshold. |
| 5 | Kraus1997 Theorem4, p.1144, line284 | Full rational two-torsion comparison at the maximum threshold. |
| 6 | Kraus1997 Lemma1, pp.1144–1145, line295 | Small-prime rationality, source of S09. |
| 7 | Kraus1997 proof of Theorem3, p.1145, lines307–373 | Conjugate forms, norm estimates and small-prime comparison; S06 identifies the missing exact sublayer. |
| 8 | Kraus1997 equations (10)–(11), p.1146, lines397–431 | Mod-four fixed-vector and matrix-closure direction. |
| 9 | Kraus1997 proof of Theorem4, p.1146, lines435–441 | Passage by a rational two-isogeny. |
| 10 | Kraus1997 AppendixII Proposition1, p.1158, lines1060–1081 | Every nonnegative weight and ideal; S03 restores that generality. |
| 11 | Kraus1997 AppendixII Proposition2, pp.1158–1159, lines1082–1093 | Filtered prime-power congruence at lcm(N,4). |
| 12 | Kraus1997 AppendixII corollary, p.1159, lines1095–1108 | Finite odd-prime mod-four recognition. |
| 13 | Kraus1997 AppendixII filter formulas, p.1160, lines1148–1154 | All six local filter branches match. |
| 14 | Martin2003 Theorem1 and Definitions1A–1F, p.2, lines69–90 | Five local factors, weight-two constants and Möbius term match. |
| 15 | Martin2003 Theorem2, p.3, lines113–114 | Equality exactly at35 or primes11 mod12. |
| 16 | Martin2003 §4 Lemmas16–22 and proof, pp.14–16, lines747–846 | Estimates and finite exceptional range support the sharp bound. Nearby Theorem3 proof slips are separately recorded. |
| 17 | BS2020 §2 equation(3) and Theorem3, pp.358–359, lines165–186 | Deletion level includes the coefficient prime; ℓ≥3. The valuation wording has a source slip. |
| 18 | BS2020 Lemma2.1, p.359, lines191–193 | Good and removed-multiplicative congruences, with distinct ranges. |
| 19 | BS2020 Lemma2.2, p.359, lines195–207 | Removed-prime norm bound and coefficient-degree comparison. |
| 20 | BS2020 Theorem4, p.360, lines221–239 | Numerical majorants are different from Kraus's square-root thresholds. |
| 21 | BS2020 Lemma3.3 proof, pp.361–362, lines287–308 | Isogenous cyclic4ℓ-kernel construction; degree20 is also excluded by the full classification. |
| 22 | BS2020 Lemma3.5, p.363, lines331–343 | Rational-two irreducibility for ℓ≥11. |
| 23 | Mazur1978 Theorem1/introduction, pp.129–130, lines35–40 | Prime degrees only; does not certify composite Kenku list. |
| 24 | Mazur1978 §7 Theorem7.1, pp.153–155, lines992–1061 | Rational-isogeny and full-image ingredients at their stated ranges. |
| 25 | Lemos2017 Theorem1.1, p.2, lines44–46 | Final non-CM cyclic-isogeny theorem, p>37. |
| 26 | Lemos2017 Theorem1.4, p.3, lines107–110 | Five-level integrality away from p. |
| 27 | Lemos2017 Propositions2.1–2.2, pp.4–5, lines136–184 | Full integrality under containment; potential good reduction at p as well as other excluded residue classes. |
| 28 | Lemos2017 Theorem2.3, p.6, lines223–226 | Proper-image classification for non-CM E,p>37. |
| 29 | Lemos2017 j-coordinate/divisor argument and lists, pp.6–7, lines231–260 | Monic numerator degrees, signed divisors and all five finite sets agree. |
| 30 | Lemos2017 proof of Theorem1.1, pp.5–7, lines187–215 and261–264 | Seven rational j-values, six non-CM. Source uses database exceptional-prime results; README correctly requests uniform theorems instead of sampling. |
| 31 | Lemos2017 Lemma3.2 and Theorem3.3, p.9, lines325–351 | Old-part vanishing uses genus-zero base; induced new quotient isogeny is separate. |
| 32 | Lemos2017 Theorem3.4 and conclusion, p.10, lines355–388 | Five-level extension of winding/formal-immersion argument. |
| 33 | DarmonMerel2001 Corollaries6.3–6.4 and Proposition6.5, pp.16–17, lines506–538 | Old vanishing and nonzero divisor of order p; sign fixed by D's definition. |
| 34 | DarmonMerel2001 Propositions7.1–7.2, pp.18–21, lines590–685 | Nonzero full-new winding projection and finite rational points; two harmless sign slips recorded below. |
| 35 | DarmonMerel2001 Lemmas8.2–8.3, pp.22–23, lines725–771 | Characteristic-q coefficient support, formal immersion and cusp-divisor torsion argument. |
| 36 | BPR2013 Theorem1.1, p.2, lines55–56 | p≥11,p≠13,m>1; S01 supplies the missing owner contract. |
| 37 | Mazur1978 Corollary1.1 and counterexample, pp.137–138, lines356–383 | Exact cotangent lattices require e<q−1; S11. |

For the source rank error, an independent counterexample is E:y²+y=x³−x. Its discriminant is37, c₄=48, and it has good-reduction point counts5 at2 and7 at3. These force rational torsion to be trivial (each primary part injects at a different residue characteristic); (0,0) is a nonidentity rational point and therefore has infinite order. Modularity at conductor37 gives a positive-rank quotient of J₀(37), contradicting the source's rank-zero assertion. This does not invalidate the known rational j-table, but its proof cannot use that assertion.

## Not verifiable

- Kenku1982, pp.199–201: settled as uncertified. The composite cyclic-degree classification is used conditionally on that citation and the declared supplier contract. No renewed source request was made.
- The complete all-prime exceptional-image calculations for every finite j-value are not reproduced in the cached Lemos text: it relies on database results and an external algorithm at lines206–213 and261–264. The package explicitly makes uniform bounds a theorem target; no claim that finitely many sampled primes prove it was accepted. This review checked the target's source and quantifiers, not a fresh proof of all those bounds.
- Declared supplier extensions remain contracts, not verified implementations. The report audits their hypotheses, ownership direction and pairing; S05/S11/S12 identify precision or missing-input defects independently of implementation status.
- All sixteen current elaborated types were compared with the supplied signature record. No fresh elaboration was run, and the proposed repair signatures are not represented as build-tested. No authorized Lean command was needed for this read-only audit.
- Ownership was searched against main, Completed, board packages and the twenty-seven supplied open heads. The global read-only index also supplied leads. Open heads whose files were not provided were not independently audited, and are not used as newly verified supplier sections.
- I did not exhaust every number field, prime or modular curve. The tables give explicit boundary and wrong-model tests; universal geometric claims were checked against the legal texts and stated contracts, with the limitations above. No missing-reference request is pending.

## Source issues

- **Misprint** in BS2020 at §2, equation (3), printed p.358, line174: the source says ord_q returns the dividing prime power; it should be the valuation exponent, so ord₂(8)=3; affects nothing.
- **Misprint** in Martin2003 at §4, proof of Theorem3, preprint p.16, line852: the source says ν∞⁺(2^α) vanishes for all α≥4; it should be its product with ν∞⁺(N) vanishes, while ν∞⁺(16)=1; affects nothing.
- **Misprint** in Martin2003 at §4, proof of Theorem3, preprint p.16, line858: the source says the final factor is 2^(α−4); it should be 2^(α−5), as in Theorem3, giving dimension1 at level48 and weight2; affects nothing.
- **Misprint** in DarmonMerel2001 at Proposition7.1 proof, author-copy p.20, lines648–651: the source says L(f,1) equals the positive 2πi multiple of the upward integral; it should be the negative multiple for that orientation; affects nothing.
- **Misprint** in DarmonMerel2001 at Proposition7.2 proof, author-copy p.21, lines683–684: the source says the image of (∞)−(0) is D; it should be −D by Corollary6.4, leaving its order unchanged; affects nothing.
- **Error** in Lemos2017 at §2, proof of Theorem1.1, preprint p.5, line194: the source says the Jacobian of X₀(37) has rank zero; it should be positive rank, witnessed by its conductor37 elliptic quotient y²+y=x³−x; affects the proof.
- **Misprint** in Lemos2017 at §2, proof of Proposition2.4, preprint p.7, line280: the source says a coordinate avoiding both cusps away from p must be p^k; it should be ±p^k, since both signs are units in ℤ[1/p]; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "add3164d8254f947810f06d1c100ea3946c38a4d", "job": "RT-EllipticCurveModularityPartII~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
