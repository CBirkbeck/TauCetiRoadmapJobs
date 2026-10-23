<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/383#issuecomment-6369402652 -->
Review (claude) of 7e88c38

Verdict: needs changes

1. **F01** (P1) GAP-1 has no supplier, and its premise about Geraghty is wrong

   **Location.** `design/plan.json` line 2259 (gap `OrdinaryAutomorphicFormsAndModularityLiftingPartII/GAP-1`, `kind: source`, no `supplier`). `design/README.md` line 993: "which Geraghty states for odd l … Geraghty's paper was not read for this plan".

   **Claim.** The l = 2 Hecke-side inputs of OL.1/dyadic-hida-theory and OL.2/dyadic-hecke-galois-representation are a declared supplier gap.

   **Witness.** The intake reads supplier `none`. Ger19 is now readable as the author preprint, and its §2 fixes "a prime number l" with no parity condition (Ger19 line 144). Only §2.7 uses Clozel–Harris–Taylor (CHT) lemmas that need l > 2 (Ger19 lines 1003, 1113, 1146).

   **Repair.** Delete GAP-1 from `gaps`, from the README's Open points and from the OL.1 `coverage.remaining` entry. Then choose one of two options.
   - (a) Keep OL.1/dyadic-hida-theory and OL.2/dyadic-hecke-galois-representation as targets owned here. Cite Ger19 by preprint numbering next to BCGP's published numbers: published Lemma 2.10, 2.14, 2.17, 2.25, Corollary 2.21, Proposition 2.29 and Corollary 3.4 are preprint Lemma 2.3.3, 2.4.4, 2.4.7, 2.6.4, Corollary 2.5.4, Proposition 2.7.4 and Corollary 3.1.4 (Ger19 lines 493, 600, 632, 954, 749, 1116, 1460; matched by content, recorded as `version_note`). Say that the only l > 2 step is the 𝒢_n-extension in Proposition 2.7.4, which Tho17 Lemma 2.4 (Tho17 line 218) replaces.
   - (b) Combine this with R08 and declare a gap with supplier `PotentialAutomorphyInfrastructurePartII`, section PL.2. Its `needs`: "state PL.2/unitary-algebraic-modular-forms, iwahori-ordinary-parts, big-ordinary-hecke-algebra, ordinary-forms-free-over-lambda and hida-classicality for every prime l, including l = 2".

   Tested at l = 2: Ger19 Proposition 2.5.3 and Corollary 2.5.4 (lines 716–752) use only sufficient smallness and Lemma 2.2.6, not the parity of l.

2. **F02** (P1) AbelianSurfacesPotentialModularity exists nowhere: the OL.4–OL.5 inputs from BCGP21 are unowned

   **Location.** `design/README.md` line 21 ("BCGP21's GSp₄ Hida–Hecke modules, Galois representations and patching: `AbelianSurfacesPotentialModularity` AP.0–AP.3"), line 656, line 775 (AP.0/weight-two-galois), line 868 (AP.1/hecke-modules, AP.2/hida-hecke-galois), lines 878, 909–911 and 939 (AP.2/taylor-wiles-descent, AP.3/patching-datum, AP.3/patched-mcm).

   **Claim.** BCGP21 §§7.8–7.11 are supplied for p > 2: the finite free Hida module M¹ from ordinary coherent H⁰ of Hilbert–Siegel varieties, Theorem 7.9.4, Proposition 7.9.8 and the patching datum. So is the weight-two Galois representation of BCGP25 Theorem 1.8.17.

   **Witness.** No roadmap on main or in an open pull request, no board package (index, checkout, `origin/main`) and no board job issue (search: 0) has this name. HigherHidaAndColemanTheory H2–I3 (board head da88512, line 56) treats GSp_{2g} over ℚ only.

   **Repair.** The finished roadmap must have a real owner for each input. One option is to add targets to OL.4 owned here, stated exactly as WHI22 states them for I = ∅, with BCGP21 as locator:
   - the ordinary Hida module and its freeness (WHI22 Propositions 7.5–7.6);
   - the Galois representation over T_{S_1} (WHI22 Theorem 7.8, lines 3188–3260);
   - the Taylor–Wiles descent;
   - the patching datum (WHI22 Lemma 7.10 and Proposition 7.11, lines 3299–3389).

   Their Hilbert–Siegel carriers then become declared gaps against a named existing roadmap, for example AutomorphicBundlesPartII, whose design treats the BCGP21 Hilbert–Siegel models at its line 1064.

   The other option is to move OL.4–OL.5 into a separate Part that comes after an owner of BCGP21's Hilbert–Siegel Hida theory exists.

   BCGP25 Theorem 1.8.17 (BCGP25 lines 641–659) needs its own owner, or a target here. It is stated only for weight-2 π, while Hypothesis 6.3.1 allows regular weights (BCGP25 line 6642; see Source issues). Remove every `AbelianSurfacesPotentialModularity:` citation from README and plan.json. Tested: after these edits no prerequisite of OL.4/gsp4-hida-galois-representation points to a nonexistent roadmap.

3. **F03** (P1) Three requests are written as supplied prerequisites, and one of them is false

   **Location.** `design/README.md` lines 985–989 (Requests to other roadmaps), which are `design/plan.json` `requests` at line 2191 and not `gaps`. They are used as plain prerequisites: line 382 (`LocalGaloisDeformationRings:L7`), line 767 (`LocalGaloisDeformationRings:R08.2`) and line 427 (`SmoothRepresentationsOfLocalGroups:SR.3/bernstein-components`, `…/bernstein-decomposition`).

   **Claim.** The cited supplier sections provide the facts the three targets use.

   **Witness.** LocalGaloisDeformationRings (open head 11b2c65) has flag-ring dimensions only for trivial residual data of large degree (§6.24), and GSp₄ Taylor–Wiles lifts only for distinct eigenvalues (§2.17). SmoothRepresentationsOfLocalGroups §SR.3.2 lacks local Langlands; its line 128 excludes GL_n essential vectors.

   **Repair.** Move each request to `gaps`, with supplier, section and one precise `needs` sentence. Also list each under the supplier's subsection of the README's contracts.
   1. LocalGaloisDeformationRings §6.24: "for v | 2 and any residual ρ̄|G_{F_ṽ} with a stable full flag, every irreducible component of Spec R^△_v has dimension at least 1 + n² + [F_ṽ:ℚ₂]n(n+1)/2". Ask for no more: the lower bound is all that OL.2/ordinary-dimension-bound uses. Geraghty's Lemma 3.2.3 (Ger19 lines 1582–1587) is a route.
   2. LocalGaloisDeformationRings §2.17: Whitmore's local problem at Taylor–Wiles places for GSp₄ with semisimple Frobenius, with its tangent space, its Δ_v-algebra structure and its dual condition L_v^⊥ = H¹_ur(F_v, M_v^∨(1)) (WHI22 (3.5), line 936). The request's "dual condition H¹_ur(F_v, N_v^∨(1))" is the quotient that detects a class, not L_v^⊥.
   3. SmoothRepresentationsOfLocalGroups §SR.3.2, with the local Langlands correspondence from the roadmap that owns it. Clause (i) as written is false. In it, "inertial types (restriction to inertia, with monodromy …)" must drop "with monodromy". Witness: SR.3.2's own Check puts the trivial and Steinberg representations of GL₂(ℚ_p) in the same block [T, 1], but their parameters have N = 0 and N ≠ 0. Clause (ii) follows from the projective generator of each block, so state it as "for each Bernstein block there is a compact open subgroup U such that every irreducible member has U-invariants".

4. **F04** (P1) OL.0/dyadic-dual-selmer-group states h³_{𝒮,T} = 0, which is false at p = 2

   **Location.** `design/README.md` line 125: "for T ≠ ∅ the cohomology h^i_{𝒮,T} of Thorne's complex C^•_{𝒮,T} vanishes for i ≠ 1, 2". The same claim is at line 132 (step 4), line 149 (API `OrdinaryPartII.h2_eq_finrank_dualSelmer`) and `design/plan.json` line 241.

   **Claim.** BCGP25 asserts that the cohomology of Thorne's complex lives only in degrees 1 and 2 (BCGP25 lines 5567–5571).

   **Witness.** Tho17 Lemma 2.15 (line 433): h³_{𝒮,T} = h⁰(F(S)/F⁺, ad r̄(1)). At p = 2, j acts on Lie GL_n by X ↦ ᵗX, so 1_n is G_{F⁺}-invariant and h³ = 1, as PotentialAutomorphyInfrastructurePartII PL.3/taylor-wiles-primes-two-adic (proof step 2) uses.

   **Repair.**
   - Replace the clause with: "for T ≠ ∅, h⁰_{𝒮,T} = 0, h^i_{𝒮,T} = 0 for i ≥ 4, h³_{𝒮,T} = h⁰(F(S)/F⁺, ad r̄(1)) = 1, and h²_{𝒮,T} = h¹_{𝒮^⊥,T} (Tho17 Lemmas 2.13 and 2.15)". Rename the API entry to match.
   - Add a Check. With h² = 1 and #Q = q, Tho17 Corollary 2.14 gives χ_{𝒮_Q,T} = 1 − #T − q + [F⁺:ℚ]n(n−1)/2, hence h¹ = q + #T − 1 − [F⁺:ℚ]n(n−1)/2 = g of BCGP25 Proposition 5.5.6. With h³ = 0 one would get g + 1.

   Tested at n = 2, [F⁺:ℚ] = 2, #T = 3, q = 5: h¹ = 5 = g. This is BCGP's error; see Source issues.

5. **F05** (P1) OL.3/neat-base-change-preparation contradicts its own roots-of-unity clause

   **Location.** `design/README.md` line 482, and `design/plan.json` line 1012: "for v ∈ T′ ∖ S_2, π_{F′,ṽ}^{Iw(ṽ)} ≠ 0, every lift of ρ̄|G_{F′_ṽ} is unipotently ramified, and if 2^N ∥ q_v − 1 then … O contains a primitive 2^N-th root of unity".

   **Claim.** After the preparation, every lift of the (trivial) restriction ρ̄|G_{F′_ṽ} is unipotently ramified.

   **Witness.** q_v is odd, so N ≥ 1. A tame character ψ through k(ṽ)^× → μ_{2^N} ⊂ O^× is trivial modulo ϖ, so ψ ⊕ 1^{n−1} lifts the trivial ρ̄|G_{F′_ṽ}. Its inertia polynomial (X − ψ(σ))(X − 1)^{n−1} is not (X − 1)^n. OL.3/two-type-patching-data uses exactly such characters.

   **Repair.** Replace the clause by "every lift of ρ̄|G_{F_ṽ} (v ∈ T ∖ S_2, the original field) becomes unipotently ramified on restriction to G_{F′_w} for every w | ṽ (BCGP25 Lemma 5.6.2, line 5794)". This is the form OL.3/dyadic-ordinary-finiteness step 2 already uses (line 616). Make the same change in the corresponding source-correction entry (line 1008). Tested on ψ ⊕ 1^{n−1}: it is a lift over F′, not a restriction from F, so the corrected clause does not cover it.

6. **F06** (P2) OL.4/reasonable-taylor-wiles-places drops the H⁰ condition that its proof uses

   **Location.** `design/README.md` line 752: "Suppose ρ̄(G_{F⁺(ζ_{p^n})}) satisfies condition (b) of OL.4/gsp4-reasonable and, if ζ_p lies in the field cut out by 𝔰𝔭₄^∨, H¹(…) = 0". Step 3 (line 758) invokes Whitmore Lemma 3.16, citing `ArithmeticGaloisRepresentations:G7/gsp4-big-image-verification`.

   **Claim.** These hypotheses suffice. ArithmeticGaloisRepresentations provides the H¹ vanishing used in step 3.

   **Witness.** WHI22 Lemma 3.16 assumes H⁰(ρ̄(G_{F(ζ_{p^n})}), ĝ^{0,∨}) = 0 (line 1001); Proposition 3.18 omits it (line 1014) yet uses the lemma (line 1046). ArithmeticGaloisRepresentations §7.11 (open head bef111d) assumes ζ_p ∉ L or enormous image.

   **Repair.** Add hypothesis (a), H⁰(ρ̄(G_{F⁺(ζ_{p^n})}), 𝔰𝔭₄^∨) = 0. It is part of GSp₄-reasonable, so consumers are unaffected. Add Whitmore Lemma 3.16 as a step of this target with its two alternative hypotheses (WHI22 lines 1001–1005), instead of citing the enormous-image supplier, which is narrower. Tested on a reasonable image with ζ_p ∈ L that is not enormous: Lemma 3.16 (2) applies and the ArithmeticGaloisRepresentations statement does not. See Source issues.

7. **F07** (P2) The patching and Taylor–Wiles suppliers do not cover p = 2 with the weight algebra Λ

   **Location.** `design/README.md` line 508: Taylor–Wiles data from PL.3/taylor-wiles-primes-two-adic for problems over Λ. Line 510: "the general patching statement is DeformationAndDerivedPatchingAlgebra R03.5/balanced-modules-and-module-patching with zero defect". Line 910 makes the same citation for OL.5.

   **Claim.** These suppliers state what OL.3/two-type-patching-data uses at p = 2, with S_∞ = Λ⟦X⟧ and Λ = O⟦T(l)⟧.

   **Witness.** DeformationAndDerivedPatchingAlgebra (open head a3b5dea) §5.5 is stated for p ≥ 3 over O⟦x⟧; §5.6 needs a domain B; Layer 8 needs Λ = O⟦w⟧. At p = 2, T(l) ⊃ {±1}^n. PL2's PL.3 node has Λ_v = O.

   **Repair.**
   - Add to OL.3 a target for the patching lemma used (Kisin-style ring–module patching with free modules), stated over Λ⁰ = O⟦ℤ₂^{n[F⁺:ℚ]}⟧ ⊂ Λ. Λ is finite free over Λ⁰ and dim Λ = dim Λ⁰, so the count (5.7.17) is unchanged. Alternatively, declare a gap with DeformationAndDerivedPatchingAlgebra Layer 8 asking for its §8.2 datum over any complete Noetherian local O-algebra Λ.
   - State BCGP25 Proposition 5.5.6 with Λ_v-coefficients as an OL.0 target that consumes PL.3/taylor-wiles-primes-two-adic and the remark that Λ does not enter the tangent computation (BCGP25 line 5511).
   - For OL.5 (p > 2, Λ_{GSp₄,F⁺} = O⟦x₁, …, x_{2[F⁺:ℚ]}⟧), cite Layer 8 §§8.2–8.5, which applies there, instead of §5.5.

   Tested at F⁺_v = ℚ₂, n = 2: Spec Λ has four components, so Layer 8's hypothesis Λ = O⟦w⟧ fails.

8. **F08** (P2) OL.1 re-plans AutomorphicFormsOnReductiveGroups §§7.4–7.5 and PotentialAutomorphyInfrastructurePartII PL.2 at l = 2

   **Location.**
   - `design/README.md` line 227 (the definition of S_{λ,{χ_v}}(U, A), its Hecke operators and sufficient smallness);
   - line 250 (API `isSufficientlySmall`);
   - line 296 (the constituents of A_λ);
   - `design/plan.json` line 2468, which says the items were routed to AutomorphicFormsOnReductiveGroups, "whose accepted packets did not take them".

   **Claim.** The l = 2 algebraic modular forms, the smallness condition and the constituent dictionary have no owner, so OL.1 defines them.

   **Witness.** AutomorphicFormsOnReductiveGroups (open head) §7.4 defines `LevelAlgebraicModularForm` S(J, M) with Hecke operators for any p, citing BCGP25 §5.7.2. §7.5 has `IsSufficientlySmall` (Definition 5.7.2) and the constituent decomposition. PL2's PL.2 specialises them, l odd only.

   **Repair.**
   - Delete the restated definitions from OL.1/dyadic-ordinary-hecke-algebra. Import AutomorphicFormsOnReductiveGroups §§7.4–7.5 by name. Keep only what is new here: Iwahori levels at 2, U^j_{λ,ϖ}, the twisted Λ-structure and the universal ordinary Hecke algebra over Λ. Alternatively, obtain these from PL2 through the gap of R01 (b).
   - Cite §7.5 in OL.1/dyadic-ordinary-automorphic-dictionary for the finite-level realization.
   - Correct the restructure note.

   Tested: BCGP25's definition (lines 5902–5907) equals §7.4's S(J, M) with M = M_{λ,{χ_v}} and J = U.

9. **F09** (P3) Checks and unit tests that are false, vacuous or outside the hypotheses

   - **Line 258, `unnormalized_U`.** "not a unit for λ ≠ 0" is false. For n = 2, λ = (1, 0), j = 1: w₀λ = (0, 1), and (w₀λ)(α¹_ϖ) = ϖ⁰ = 1. Use j = n, where the scalar is ϖ^{Σ_iλ_{τ,i}}.
   - **Line 257, `weightAlgebra_components`.** One place above 2 with F⁺_v = ℚ₂ forces F⁺ = ℚ, and then n[F⁺:ℚ] = 2 ≢ 0 mod 4. Use n = 2 and two places with F⁺_v = ℚ₂. Then T(l) ≅ ({±1} × ℤ₂)⁴, there are 16 components and dim Λ = 5.
   - **Line 209.** For F⁺ = ℚ there is no CM field F/ℚ unramified at all finite places. State the Check for any F⁺ with √2 ∉ F⁺: m = 3 and L⁺ = F⁺(√2).
   - **Line 354, `not_unique_gl_conj`.** For k finite of characteristic 2, k^× = (k^×)², so the GL_n(k)-classes coincide (BCGP25 lines 5299–5302). Delete it, or state it for p odd.
   - **Line 459, `unramified_case`.** It assumes all lifts unramified, then says GL_n(O) "need not" suffice. Rewrite: if every lift of ρ̄|G_{F_ṽ} is unramified, GL_n(O_{F_ṽ}) is sufficiently deep.
   - **Line 187, and `surjective_F3` at line 733.** These cite AbelianSurfacesModularity AM.2 and AM.1, which are consumers. Cite BCGP25 Lemma 8.2.2 and Remark 8.2.3 (p. 182, lines 8391–8406) and Table 6.4.4 (p. 150).
   - **Conventions, line 32.** The geometric Artin normalisation has no computed Check. Add one: ε(Art_{F_v}(ϖ_v)) = q_v^{−1}.

10. **F10** (P3) Supplier citations by atlas label, with one wrong roadmap

   - Replace atlas labels by section numbers (mapping under Verified sound). The resolver's four leads (R08.1, R08.2, R03.4, R03.5) are labels, not missing content.
   - `GlobalGaloisDeformations:R04.2/framed-unframed-comparison` (lines 656, 668, 698) does not exist: GlobalGaloisDeformations (open head b0adf32) has Layers R04.3–R04.6, G8 and G7. The anchor is LocalGaloisDeformationRings §F.2.6.
   - PotentialAutomorphyInfrastructurePartII is a board design. It is at position 90 of the board's current merge order, but absent from the merge order this brief gives. Record it in the supplier contracts with that status, or declare its uses as gaps if the intake requires it.

11. **F11** (P3) Cite what the libraries and earlier roadmaps already state

   - **OL.0/weak-adequacy-equivalences.** It restates ArithmeticGaloisRepresentations §7.9: `IsWeaklyAdequate`, `AdZeroTraceCondition`, their equivalence, and absolute irreducibility. Keep only the ad ⊗ k̄ variant (1) and the identification with relaxed adequacy.
   - **The dyadic dual Selmer group and µ_v.** These are already defined inside PL2's PL.3/taylor-wiles-primes-two-adic. Cite it, and keep the two consistent (R04).
   - **Existing interfaces (line 46).** Add `TauCeti.completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean` line 145) for Λ, Λ_{GL_n,v} and Λ_{GSp₄,v}. Add `LieAlgebra.Symplectic.sp` (`Mathlib/Algebra/Lie/Classical.lean` line 157) for 𝔰𝔭₄.
   - **Baseline pins.** The baseline pins (082e2d37, f7904748) are stale. `lake-manifest.json` pins Mathlib 6b7abb3c and Tau Ceti a91d3aaf. All six cited declarations exist there.
   - **Ownership of GSp₄-reasonable.** It is unowned elsewhere, and the GSp4NonregularModularityLifting design (line 36) asks ArithmeticGaloisRepresentations G7 for it. Keep it here and say so in the scope.

12. **F12** (P3) Proof sketches with wrong steps

   - **Line 133 (step 5 of OL.0/dyadic-dual-selmer-group).** With the corrected term, surjectivity needs H²(F/F⁺, k) → H²(F⁺_v, ad r̄) to be injective. Writing r̄(c_v) = (B, 1)j with B symmetric, 1_n lies in (1+c)ad exactly when B is alternating. So the step needs strong residual oddness at v when n is even (Source issues).
   - **Line 908 (OL.5 step 1).** "#Q_N = t" is wrong: WHI22 Lemma 7.10 has #Q_N = q, and t is the number of cyclic factors of Δ_{Q_N} (lines 3299–3303).
   - **Line 279.** "Geraghty's Proposition 2.6.1" is preprint numbering, while the rest is published numbering. Use one scheme (R01).
   - **Line 952 (OL.5/symplectic-ordinary-r-equals-t, step 2).** BCGP's Ihara-avoidance step needs the support of M^χ_∞ to meet the selected component modulo λ, not just to be nonzero. Cite the seed point's support explicitly.

13. **F13** (P3) Process words, atlas vocabulary and package-stage shape

   - **Process words.**
     - "packet node" (29 times) and "Planet:" (16 times);
     - "sourceIssues" and "paper extraction … E025" (lines 133, 999–1007);
     - "was not read for this plan" (line 993);
     - the `research/blueprint/…` path and an unverifiable elaboration claim (line 1013);
     - plan.json's "requests" wording.
   - **Package-stage shape.**
     - The README needs the `# Roadmap:` form, `## Exact supplier contracts`, `*Needs:*` lines, and `### Examples` and `### Dependencies` per layer.
     - Unit tests must become prose Checks without Lean names.
     - The `OrdinaryPartII.` prefix should become `TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLiftingPartII`.
   - **Suggested.lean.** The planned prototype items are padding to drop: `weightTwist_one`, `weightTwist_mul`, `IsSufficientlyDeep.mono`, `isSufficientlyDeep_bot`, the two dimension identities "proved by ring" and `trace_one_eq_zero_of_even`. The headlines (Theorems 5.7.14 and 6.3.4, Lemma 5.5.3) are not statable at the pins. Name them in the module docstring with the missing carriers: Galois deformation rings, Hecke algebras of definite unitary and Hilbert–Siegel groups, and G_{F⁺,S}-cohomology.
   - **Sources manifest.** Record the other cited works by locator, or as `uncertified`: BCGP21, Thorne 2012, BLGGT14, Labesse, Shotton, Balaji, Khare–Thorne and Taylor 2008.

Reviewed: `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md` (1013 lines, 29 targets in six layers OL.0–OL.5), `design/plan.json` and the sources manifest. The manifest was absent at the start. The sources service has now recorded five certified entries: BCGP25, WHI22, BCGNT25, Ger19 (author preprint) and Tho17 (accepted manuscript).

There are thirteen findings: five P1, three P2 and five P3. The mathematics of BCGP25 §§5–6 is followed closely, and most locators are right. Ten of the author's eleven source corrections are confirmed. The blocking problems are of four kinds:

- unowned inputs: GAP-1, the nonexistent AbelianSurfacesPotentialModularity, and three requests written as if supplied;
- two false statements: one copied from a source error (h³), one a self-contradictory preparation clause;
- a dropped hypothesis in Whitmore's Taylor–Wiles proposition, and patching and Taylor–Wiles suppliers narrower than their use at p = 2;
- a partial re-plan of AutomorphicFormsOnReductiveGroups and PotentialAutomorphyInfrastructurePartII in OL.1.

## Verified sound

**Gate output (verbatim).** Against the brief's order:

```
candidate: OrdinaryAutomorphicFormsAndModularityLiftingPartII is not in the merge order yet; checked as if placed after ErdosProgressionPowers (the intake inserts it when its design is accepted)
depcheck: 27 roadmaps, 223 edges, 0 problem(s)
```

Against the board's current `origin/main` order (e76593a), the gate places it after TwistedAutomorphicDescents and reports `27 roadmaps, 231 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

The real suppliers end at ModularityAndLanglandsExtensions (position 254 on board main). This is before the consumers GSp4NonregularModularityLifting (259) and AbelianSurfacesModularity (260), once R02 and R09's consumer references are removed.

**Parent and scope.** OrdinaryAutomorphicFormsAndModularityLifting (open head faca0d2) is GL₂, p odd (Skinner–Wiles). OL.0–OL.5 re-plan none of its targets. Its Hida families belong to PadicFamilies, not to the parent as line 3 says; that is minor. PL2 owns Thorne 2017's 2-adic minimal lifting (PL.4/two-adic-automorphy-lifting) but not the ordinary dyadic R = T over Λ, so OL.3 is new.

**Seeded sample.** Fifteen targets were drawn by seed `sha256("REV-DESIGN-…PartII")` from the 29; none was found by heading. Each was checked against the text:
1. OL.0/dyadic-dual-selmer-group, BCGP25 §5.4, (5.4.1)–(5.4.3), pp. 122–123 (lines 5523–5571): µ_v, µ_v ⊂ L_v, split vanishing, (5.4.3) ✓; h³ ✗ (R04).
2. OL.0/weak-adequacy-equivalences, Lemma 5.3.1, Definitions 5.3.2–5.3.3, Remark 5.3.4, pp. 120–121 (lines 5402–5437) ✓.
3. OL.0/unavoidable-dual-selmer-class, Lemma 5.5.3, pp. 125–126 (lines 5640–5687) ✓, with the author's correction on m confirmed.
4. OL.1/dyadic-hida-theory, §5.7 pp. 132–133 (lines 5993–6001); Ger19 Proposition 2.6.1 with c ≥ r (lines 771–780) ✓.
5. OL.2/sufficiently-deep-level, Definition 5.7.13, Lemma 5.7.12, p. 134 (lines 6080–6087) ✓.
6. OL.3/two-type-patching-data, pp. 136–137 (lines 6136–6200), (5.7.17) recomputed ✓; supplier R07.
7. OL.3/ihara-avoidance-support, pp. 137–138 (lines 6221–6249) ✓; the author's correction H′ → H at line 6229 confirmed.
8. OL.3/sacrificial-prime-removal, p. 138 (lines 6250–6277) ✓; T′ correction confirmed.
9. OL.3/dyadic-ordinary-finiteness, Theorem 5.7.14 and p. 139 (lines 6088–6106, 6280–6292); Tho17 Lemma 2.4 (line 218) ✓.
10. OL.4/gsp4-reasonable, WHI22 Definitions 1.2, 3.15 and 3.19, Lemma 3.20 (lines 105–115, 985–999, 1064–1077); BCGP25 Hypothesis 6.3.1 (1), Remark 6.4.5 ✓.
11. OL.4/reasonable-taylor-wiles-places, WHI22 Lemma 3.14 and Proposition 3.18, pp. 21–23 (lines 939–1061): hypothesis dropped (R06).
12. OL.4/ordinary-seed-datum, BCGP25 Hypothesis 6.3.1, Remarks 6.3.2–6.3.3, pp. 146–147 (lines 6620–6662) ✓; Lemma 10.4.1 on p. 222 ✓.
13. OL.4/gsp4-hida-galois-representation, BCGP25 p. 147 (lines 6671–6685); WHI22 Theorems 7.7–7.8 (lines 3155–3260) ✓; supplier R02.
14. OL.5/component-dominance, Theorem 6.3.4 proof (lines 6697–6710), Lemma 6.2.6 (lines 6596–6605) ✓.
15. OL.5/symplectic-patched-modules, WHI22 §7.3, Lemma 7.10 and Proposition 7.11 (lines 3295–3389) ✓, step 1 aside (R12).

**Further locators checked.** BCGP25:
- Lemma 5.1.2 (p. 115), Remark 5.1.3 (p. 116), Definition 5.2.1, Lemma 5.2.3, Lemma 5.2.7;
- Proposition 5.5.6 (p. 126, lines 5694–5704);
- Lemmas 5.6.2 and 5.6.3 (p. 128), Propositions 5.6.4 and 5.6.6 (p. 129), Hypothesis 5.7.1 (p. 130);
- Definition 5.7.2, (5.7.3) (p. 131), (5.7.4) (p. 132), Hypothesis 5.7.5, (5.7.6), Lemma 5.7.7 (p. 133), Proposition 5.7.9 (p. 134);
- §6.1 Definitions 6.1.1–6.1.4 and (6.1.5) (pp. 140–141), Lemma 6.1.6, Lemma 6.2.2 (p. 143), Lemma 6.2.5 (p. 145), Lemmas 6.4.1–6.4.3 (p. 149);
- Theorem 1.8.17 (p. 13).

Elsewhere: BCGNT25 Lemma 3.2.4 (pp. 33–34, line 1636); Tho17 Lemmas 2.2, 2.4, 2.8, 2.10, 2.11, 2.13, 2.15, 2.16 and 2.17 (lines 199–497).

The author's corrections confirmed against the text: Lemma 5.7.7 dim Λ, (5.7.3), (5.4.5)'s last term (R12 adds a condition), T′, G_F → G_{F⁺} (lines 5480, 6398), M_λ over Ĩ_2, χ(c_v), H′_{1,∞}, the unipotent-preparation gap (corrected form in R05), and α_v/β_v (line 6668). The Lemma 5.5.3 entry is a gap, not a misprint (Source issues).

**Library declarations opened at the pins.** Mathlib 6b7abb3c:

| Declaration | File and line |
| --- | --- |
| `Matrix.trace` | `Mathlib/LinearAlgebra/Matrix/Trace.lean` 43 |
| `Matrix.trace_one` | `Mathlib/LinearAlgebra/Matrix/Trace.lean` 144 |
| `Module.End.IsSemisimple` | `Mathlib/LinearAlgebra/Semisimple.lean` 55 (semisimple module over R[X]) |
| `Submodule.span` | `Mathlib/LinearAlgebra/Span/Defs.lean` 46 |
| `Matrix.symplecticGroup` | `Mathlib/LinearAlgebra/SymplecticGroup.lean` 101 (a `Submonoid`, A·J·Aᵀ = J; no similitude group) |
| `groupCohomology` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` 184 |
| `LieAlgebra.Symplectic.sp` | `Mathlib/Algebra/Lie/Classical.lean` 157 |

Tau Ceti a91d3aaf: `TauCeti.completedGroupAlgebra` (line 145). It has no deformation, Hida or adequacy declarations.

**Cross-roadmap citations resolved** (copy read; atlas label → section):

| Roadmap (copy read) | Atlas label → section |
| --- | --- |
| LocalGaloisDeformationRings (open head 11b2c65) | R08.1/g-valued-framed-ring → §1.17; R08.1/smooth-points-generic-fibre → §1.22; R08.2/fixed-type-rings-rank-n → §2.24; R08.2/ihara-avoidance-rings-p2 → §2.29; R08.2/taylor-wiles-block-condition → §2.23; R08.2/gsp4-ihara-avoidance-rings → §2.22; R08.2/gsp4-taylor-wiles-lifts → §2.17; L7/ordinary-flag-scheme → §1.9; L7/trivial-residual-flag-ring → §6.24; L7/gsp4-borel-ordinary-conditions → §6.27; L7/gsp4-ordinary-flag-incidence → §6.29; L7/gsp4-ordinary-regularity → §6.31; L7/gsp4-ordinary-weight-two-components → §6.35; L8/ordinary-coefficient-ring → §1.3 |
| GlobalGaloisDeformations (open head b0adf32) | G7/polarized-deformation-problem, -representability, -tangent-obstruction, -presentation → §§8.1–8.4 (p odd; OL.0 owns p = 2); R04.3/global-deformation-type → §3.3; R04.4/restriction-finiteness → §4.2; R04.2 → none (LocalGaloisDeformationRings §F.2.6) |
| DeformationAndDerivedPatchingAlgebra (open head a3b5dea) | R03.1/completed-tensor-products → §1.12; R03.4 → §4.1, §4.2, §4.6; R03.5 → §§5.5–5.6 (Layer 8 for Λ); R03.6/nearly-faithful… → §6.1; maximal-flat-quotient → §6.3; faithful-quotient… → §6.5; completion-generic-special… → §6.7; P9/support-transport-avoiding-ihara → §9.6 |
| ArithmeticGaloisRepresentations (open head bef111d) | G7 → Layer 7: clozel-harris-taylor-group §7.4, gsp4-and-symplectic-induction §7.5, adequate-subgroup §7.9, vast-tidy-and-enormous §7.11, gsp4-big-image-verification §7.11 |
| PotentialAutomorphyInfrastructurePartII (board design on `origin/main`, 76c708b) | all 22 cited nodes (PL.0–PL.4) exist, by id in its plan.json |
| PotentialAutomorphyInfrastructure (open head 5b4ff38) | PA.2/iota-ordinary-automorphic-representation → §3.44; iota-ordinary-soluble-base-change → anchor at line 2053 |
| AutomorphicGaloisRepresentationsPartII (open head fb0a94c) | AG2.5/caraiani-upgrade… → "Caraiani's full away-prime compatibility" and "Temperedness of regular unitary-type cuspidal forms" |
| SmoothRepresentationsOfLocalGroups (open head 1383569) | SR.3/bernstein-components and bernstein-decomposition → §SR.3.2 (insufficient, R03) |
| ModularityAndLanglandsExtensions (open head 2d70821) | ML.4/gsp4-discrete-spectrum-types → §3.9 |
| EndoscopicTransferAndUnitaryTraceComparison (open head 40d60b6) | ET.7a → §13.2 |
| AbelianSurfacesModularity (board design) | AM.1/allowed-images, AM.2/a5-near-adequate exist (consumers; R09) |
| AbelianSurfacesPotentialModularity | nowhere (R02) |

**Duplication audit (by object).** Used `roadmaps grep` over main and the 330 open heads (the 26 listed in the brief included), board `origin/main` packages, and HigherHidaAndColemanTheory at da88512. Patterns searched:
- 𝒢_n problems, near adequacy, relaxed adequacy, strongly residually odd;
- Taylor–Wiles, dual Selmer, Hida–Hecke, Hilbert–Siegel, BCGP21 7.9.4 and 7.10.1;
- algebraic modular forms, sufficiently small, GSp₄-reasonable, essential vectors, BCGP25 citations.

The only owners found are those in R07, R08 and R11. None of the 26 listed open pull requests overlaps.

**Gaps.** The single declared gap is a finding (R01). No acceptance can be made conditional on it.

**Shape.**
- Every definition has at least three tests (unit tests plus Checks: 5 to 7 each), though R09 lists the defective ones.
- Every theorem has hypotheses and a locator, and every layer lists its dependencies.
- Lean form: no Suggested.lean exists at the design stage.
- Elaboration: not available (this lane does not elaborate), so there is no padding probe beyond R13's reading.

**Headline theorems for the package stage.** BCGP25 Theorem 5.7.14 (finiteness and reduced R = T), Theorem 6.3.4, and Lemma 5.5.3. None is statable at the pins (R13).

**Adversarial table.** There is one row per statement; "OK" means the computed values agree with the statement.

| # | Statement | Instance | Values computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | lambda-polarized-deformation-problem | n=4, #T=3; T=∅; (1,a) versus (λ1,1) on (B,b)j; k[ε] | 17·3−1=50; R^T=R; (a⁻¹B,b)j versus (λ²B,b)j, equal iff λ²=a⁻¹; (x+yε)²=x², so 1+ε is not a square | OK | — |
| 2 | dyadic-dual-selmer-group | p=2, scalars; Euler with h²=1; B alternating | j·1_n=ᵗ1_n=1_n, so h³=1; χ gives h¹=g (g+1 if h³=0); 1_n=Y+ᵗY ∈ (1+c)ad | h³ claim false | R04, R12 |
| 3 | weak-adequacy-equivalences | GL₂(𝔽₂)≅S₃; A₅⊂GL₄(𝔽₂) | H^ss={1,A,A²} spans 𝔽₂[A], dim 2<4, yet absolutely irreducible; H¹(A₅,ad/k)≅H²(A₅,k)=k | OK | R11 |
| 4 | unavoidable-dual-selmer-class | n even; √2∉F⁺; F⁺=ℚ | pairing n·⟨,⟩=0; m=3, L⁺=F⁺(√2); no F/ℚ unramified at finite places | OK; Check excluded | R09 |
| 5 | dyadic-ordinary-hecke-algebra | n=1; n=2 Hecke; λ=(1,0), j=1; F⁺_v=ℚ₂ | twist 1; X²−T¹X+qT²; scalar 1 (unit); 4 components but n[F⁺:ℚ]=2 | definition OK; two tests wrong | R08, R09 |
| 6 | dyadic-hida-theory | Ger19 §2 at l=2; c=r | no parity hypothesis (line 144); Prop 2.6.1 needs c ≥ r | OK | R01 |
| 7 | dyadic-ordinary-automorphic-dictionary | n=1 | every algebraic character is ordinary (normalised U is a unit) | OK | R08 |
| 8 | ordinary-global-problem | n=4; χ≡1 mod ϖ; k finite of char 2 | ε^{−3}δ⁴=ε^{−3}; D^χ/ϖ=D¹/ϖ; k^×/(k^×)²=1 | OK; one test vacuous | R09 |
| 9 | ordinary-dimension-bound | n=2, d=2, #T=3 | dim R^loc=19, s≤14, so ≥5=1+2·2; the printed [F:ℚ] gives 9 | OK; general residual case is a gap | R03 |
| 10 | dyadic-hecke-galois-representation | n=2 | char poly X²−T¹X+qT² equals the heckePolynomial_two test | OK | — |
| 11 | uniform-fixed-vectors | n=1, w∤2; GL₂ trivial and Steinberg | ramification only through the 2-part of k(w)^×, U_w=1+𝔪_w; same block [T,1], N=0 versus N≠0 | theorem OK; route unowned | R03 |
| 12 | sufficiently-deep-level | U′⊂U | π^U⊂π^{U′}; intersection follows from mono | OK; one test muddled | R09 |
| 13 | neat-base-change-preparation | ψ⊕1^{n−1}, ψ of order 2^N | ψ≡1 mod ϖ; inertia polynomial ≠ (X−1)^n | false clause | R05 |
| 14 | two-type-patching-data | n=2, d=2, #T=3, q=5; q=0 | g=5, dim R_∞=24=dim S_∞; S_∞=Λ⟦15 vars⟧ | OK | R07 |
| 15 | patched-component-structure | R^{χ_v} irreducible, R^△/Q irreducible | components ↔ those of R^□_{v₁} | OK | — |
| 16 | ihara-avoidance-support | R_X/m_Λ | (R_X)_red is a quotient of a finite Λ-algebra, so R_X/m_Λ is Artinian, hence finite | OK | — |
| 17 | sacrificial-prime-removal | T′ without S_2(L⁺) | drops the ordinary condition, contradicting S_{1} | OK (author fix) | — |
| 18 | dyadic-ordinary-finiteness | v∈T∖S_2 tame lift | lands in R¹ over F′ only with the Lemma 5.6.2 choice | OK (author fix) | R05 |
| 19 | dyadic-ordinary-r-equals-t | dense ℘_λ points | a closed set containing a dense set is everything, so the kernel is nilpotent | OK, given R03 item 1 | R03 |
| 20 | gsp4-lambda-deformation-problem | #T=1,3; GL₄ | 10; 32; 16·3−1=47≠32 | OK | — |
| 21 | gsp4-reasonable | torus image; regular h; absolutely irreducible H | (𝔰𝔭₄)^H⊇𝔱; tr on 𝔱 is 2(xx′+yy′), nondegenerate for p>2; λ1∈𝔰𝔭₄ ⇒ 2λJ=0 | OK | — |
| 22 | reasonable-taylor-wiles-places | WHI22 Lemma 3.16 hypotheses | needs H⁰=0, absent from Prop 3.18 | missing hypothesis | R06 |
| 23 | ordinary-seed-datum | p=3: 19, 7; q_{w₀}≡1 | 19≡1, 7≢1 mod 9; α/α=1=q, (𝔰𝔭₄)^{Frob}⊇𝔱 | OK | — |
| 24 | selected-ordinary-problem | p-distinguished | R^△[1/p] irreducible (Remark 6.3.2) | OK | — |
| 25 | gsp4-hida-galois-representation | T⊂k×∏O_{E_π} | k-coordinate fixed by the others, so factoring is checked on O_{E′}-points | OK; supplier missing | R02 |
| 26 | component-dominance | p>2 split | Λ_{GSp₄,F⁺}=O⟦x₁…x_{2d}⟧ is a domain; T/Q_π finite and torsion-free, so lying over gives surjectivity | OK | — |
| 27 | symplectic-patched-modules | F⁺=ℚ, #S=3, t=7 | g=5; 5+30+4=39=7+33−1 | OK; step 1 wrong | R12 |
| 28 | symplectic-ordinary-r-equals-t | equal dimensions | a point on one component only gives that component in the support | OK | R12 |
| 29 | symplectic-ordinary-finiteness | nilpotent kernel | R/m_Λ has finite length, so R is finite | OK | — |

**Conventions.**
- dim Λ: each place F⁺_v=ℚ₂ contributes n.
- Twist: (w₀ν)⁻¹ with ν=(n−1,…,0) gives ∏u_i^{1−i}.
- GSp₄ similitude ε^{−1}: ν(Frob_{w₀})=q^{∓1}, and the set of ratios is stable under inversion.
- Geometric Artin: no witness (R09).

## Not verifiable

- **Geraghty, published version (Math. Ann. 373).** The DOI resolves only to a paywall. The numbering was matched by content to the author preprint (Ger19 in the manifest).
- **BCGP25 Table 6.4.4 columns.** The text extraction loses the column of each cross, and no page renderer is available. So the claim in `table_failures` (line 735) that labels 3.540.2, 3.540.7, 3.216.2 and 3.36.1 fail condition (1) was not checked.
- **BCGP21, Thorne 2012, BLGGT14, Labesse, Shotton, Balaji, Khare–Thorne, Taylor 2008.** These were not fetched; they are checked only as BCGP25, WHI22 and Tho17 restate them.
- **Elaboration.** Not available (this lane does not elaborate), and there is no Suggested.lean at the design stage.

## Source issues

- **Error** in BCGP25 at §5.4, p. 123: the source says the cohomology of Thorne's complex vanishes outside degrees 1 and 2 when T is nonempty; it should give degree three dimension one at p = 2, from the invariant scalars (Tho17 Lemma 2.15); affects a stated result.
- **Gap** in BCGP25 at Remark 5.4.4, p. 124: the source deduces surjectivity of restriction from injectivity into H² with trivial coefficients at a real place; it should use adjoint coefficients, which needs strong residual oddness at that place when n is even; affects nothing.
- **Gap** in BCGP25 at proof of Lemma 5.5.3, p. 125: the source reduces without loss of generality to F⁺ lying between two consecutive 2-power cyclotomic real fields; it should choose the least m with K⁺_m not contained in F⁺, since most F⁺ lie in no K⁺_m; affects the proof.
- **Misprint** in BCGP25 at proof of Lemma 5.5.3, p. 126: the source attributes the class of ψ to L/L⁺ and calls L⁺/L unramified outside 2; it should be L⁺/F⁺ in both places; affects nothing.
- **Misprint** in BCGP25 at §5.6.1, definition of the fixed-type problem, p. 129: the source evaluates the characters at the Artin map applied to an inertia element; it should be the inverse Artin map, as in Geraghty; affects nothing.
- **Gap** in BCGP25 at proof of Lemma 5.7.7, p. 133: the source takes local equidimensionality from Proposition 5.6.6, whose dimension clause assumes trivial residual representation and large degree; it should cover the unprepared field, where the lemma is used on p. 139; affects the proof.
- **Gap** in BCGP25 at Hypothesis 6.3.1 and the paragraph before it, p. 146: the source allows π of regular weight but takes its Galois representation from Theorem 1.8.17, stated for ordinary weight 2; it should cite a regular-weight construction; affects nothing.
- **Gap** in WHI22 at Proposition 3.18, p. 22: the source assumes only the trace condition and the conditional H¹ vanishing; it should also assume vanishing H⁰ of the image on the dual adjoint, which its proof uses through Lemma 3.16; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7e88c38", "job": "REV-DESIGN-OrdinaryAutomorphicFormsAndModularityLiftingPartII", "model": "opus", "worker": "fable-rev20"} -->
