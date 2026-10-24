<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/168#issuecomment-6379128438 -->
Red team round 2 pass a (codex) of 5eff35d

Verdict: needs_changes

1. **F01** (P1) The new evaluation point has no separation hypothesis

   **Location:** packages/PadicHodgeRegulators/README.md:1731: “If j is not in J, ev_j(B) is invertible over E.”

   **Claim:** The hypotheses on the already imposed indices guarantee invertibility at an unused index.

   **Witness:** Take R=ℚ[X], d=1, J={0}, t=X, x₀=x₁=0, both evaluations at zero, V₀=0 and B=(X). Every hypothesis at line 1693 holds; ev₁(B)=(0), determinant 0.

   **Exact repair text:** “For a new index j∉J, impose the evaluation hypotheses of §9.1 on J∪{j}, including x_j≠x_i for every i∈J. Then ev_j(B) is invertible.” Add: “With two evaluations at zero, B=(X) is singular at the unused index; that datum is permitted by §9.1 but cannot be used as a new separated point.”

   **Repair test:** At x₁=5, ev₁(B)=5 with inverse 1/5; the repeated-zero instance is excluded only from this induction step. The narrowed Lean hypotheses from r1a F14 remain correct.

2. **F02** (P1) Vertical log-syntomic cohomology is still identified with rigid syntomic cohomology

   **Location:** packages/PadicHodgeRegulators/README.md:254: “For X smooth over O_K with trivial horizontal log structure and K unramified, the rational complex agrees” with the rigid theory.

   **Claim:** The log-syntomic theory over the canonical log trait agrees with compactification-filtered rigid syntomic cohomology for every such smooth X.

   **Witness:** X=Spec ℤₚ, r=1, with its vertical log structure: H¹_log-syn has dimension 2; H¹_rsyn has dimension 1. TauCetiRoadmap/CohomologyComparisonsPartII/README.md:890 computes exactly these two complexes.

   **Exact repair text:** “For a smooth projective Y/W(k) and relative normal-crossings divisor D, use the log structure from D alone over the trivially logged base. CohomologyComparisonsPartII §7.4 identifies this horizontal-log syntomic complex with rigid syntomic cohomology of Y−D. This is not the canonical-vertical-log complex above. For Spec ℤₚ in weight one, the horizontal/rigid H¹ is ℚₚ, whereas adding the vertical log gives ℚₚ².” Retain the arithmetic-pair hypotheses of §3.4 on every rational quotient presentation and derived-reduction assertion in lines 241–254.

   **Repair test:** The point with empty horizontal boundary has dimensions 1=1; the vertical-log point retains its extra uniformizer Kummer direction and is no longer asserted equivalent. The filtration repair for r1a F05 does not fix this independent log-structure mismatch.

3. **F03** (P2) The completed-Bloch gap asks a second owner to supply existing root classes

   **Location:** packages/PadicHodgeRegulators/README.md:65: “include its coefficient-localized prime-to-p root classes”; design/plan.json:30 repeats this request.

   **Claim:** KTheoryFiniteLocalFields must supply the coefficient-localized Bloch root classes as part of the missing completed comparison.

   **Witness:** TauCetiRoadmap/K3BlochGroups/README.md:2054–2132, §§6.3–6.4, already constructs m[ζ] and m⁻¹(m[ζ]) over ℤ[1/m], ℤ/n and ℤₚ, with denominator independence and embedding naturality.

   **Exact repair text:** “K3BlochGroups §§3.5,4.20,6.3–6.6 supplies the Suslin boundary, integral exact sequence and coefficient-localized root classes. What KTheoryFiniteLocalFields must provide (gap:completed-bloch-comparison): for finite unramified L/ℚₚ and odd p, identify the ordinary K₃, indecomposable K₃ and Bloch finite-quotient systems with completed K₃, controlling the Tate-module obstruction, compatibly with the already supplied root classes and finite products.” Use this same narrowed needs sentence in design/plan.json. Section 5.6 then composes the imported root class with that completion comparison.

   **Repair test:** For ζ of order 4 over ℚ₅ the imported class remains 4⁻¹(4[ζ]); only its map into completed K₃ is requested from the gap. The genuine completion gap remains declared and is not itself a finding.

4. **F04** (P1) Global K₃ finite generation and ranks have no cited supplier

   **Location:** packages/PadicHodgeRegulators/README.md:1108: “a finitely generated Z-submodule of rank at most r_2(F)”; line 1130 replaces Borel's theorem with a hypothesis.

   **Claim:** Layer 6 uses unconditional finite generation and Borel ranks, while its dependencies list only local K-theory, the completed-Bloch gap and an explicit rank hypothesis for §6.7.

   **Witness:** TauCetiRoadmap/ArithmeticKTheory/README.md:914–1010, §§3.3–3.4, supplies finite generation for integer rings, rational localization and Borel ranks. KTheoryFiniteLocalFields explicitly excludes global finiteness; its §7.6 supplies only the completed localization map.

   **Exact repair text:** “Import ArithmeticKTheory §§3.2–3.4 for finite generation of K₃(𝒪_F), rational localization K₃(𝒪_F)⊗ℚ≃K₃(F)⊗ℚ, and dim_ℚ K₃(F)⊗ℚ=r₂(F). Localization and finite-field K₂=0 make K₃(𝒪_F)→K₃(F) surjective, hence K₃(F) finitely generated. Use these inputs throughout §§6.1,6.5–6.7; Borel's rank formula is an imported theorem, not an additional hypothesis.” Add ArithmeticKTheory §§3.2–3.4 to Exact supplier contracts and Layer 6 dependencies.

   **Repair test:** For F=ℚ the rational source is zero; for F=ℚ(i) it has dimension one. Neither result assumes injectivity of the p-adic regulator. ArithmeticKTheory precedes this roadmap in the supplied merge order.

5. **F05** (P1) Rational localization is false over an arbitrary perfect residue field

   **Location:** packages/PadicHodgeRegulators/README.md:806: “K_(2n−1)(R) ⊗ Q ≅ K_(2n−1)(K) ⊗ Q.”

   **Claim:** This holds for every complete mixed-characteristic DVR R with perfect residue field, the section's declared base.

   **Witness:** Let k=𝔽ₚ(s,t)^perf, R=W(k), K=Frac(R), n=2. The boundary of {p,[s],[t]} is {s,t}≠0 in K₂(k)⊗ℚ, so it cannot come from K₃(R)⊗ℚ.

   **Exact repair text:** “For general R retain the localization sequence K_(2n−1)(R)⊗ℚ→K_(2n−1)(K)⊗ℚ→K_(2n−2)(k)⊗ℚ. For residue field k algebraic over 𝔽ₚ and n≥2, positive-degree residue K-groups are torsion, so localization is a rational isomorphism and defines the extension of the regulator to K. In particular this applies to the integers of every finite extension of ℚₚ.” Import ColemanIntegration §L3.Fa.1, `KTheoryQ.localization`, `noLowWeightKTheory_of_algebraic_over_Fp` and its DVR localization comparison, together with K2SymbolsBrauer §§9.11,11.1,11.3 for the residue witness.

   **Repair test:** In the counterexample the t-residue of {s,t} is s, of infinite order; purely inseparable finite extensions preserve its nonzero rational class by restriction–norm. Thus the last arrow remains nonzero. For k=𝔽_q both adjacent positive-degree rational residue groups vanish, restoring the isomorphism. HK2011 line 145 assumes R finite over ℤₚ and does not supply the asserted wider isomorphism.

6. **F06** (P1) Layer 4 replans regulator formulas already owned by ColemanIntegration

   **Location:** packages/PadicHodgeRegulators/README.md:857: “The input of ColemanIntegration §L3.15 is this theorem with F = Q(ζ_N).” Sections 4.3–4.5 claim these constructions again.

   **Claim:** This roadmap supplies the special-unit, higher-weight and Gros formulas to ColemanIntegration.

   **Witness:** TauCetiRoadmap/ColemanIntegration/README.md:2548,2605,2633,3008, §§L3.Fb.2,L3.Fb.5–L3.Fb.6,L3.15, already constructs the regulator, proves the special-symbol formula and Gros conversion, and extends the cyclotomic formula to p-power roots. ColemanIntegration is earlier in the merge order.

   **Exact repair text:** “Import ColemanIntegration §§L3.Fb.2,L3.Fb.5–L3.Fb.6,L3.14–L3.15 for the normalized syntomic regulator on its stated residue-field domain, the special-unit and cyclotomic polylogarithm formulas, and Gros depletion. Here compare those imported normalizations with §4.2's étale/Bloch–Kato regulator.” Replace the standalone construction claims in §§4.3–4.5 by these supplier contracts; retain only the new comparisons and genuinely broader domains, with explicit conversion from the supplier's fixed (−1)^n sign. Delete the sentence reversing supply at line 857.

   **Repair test:** At n=2 the imported raw-symbol coefficient is +1; at n=3 it is −2. Transporting the chosen de Jeu normalization once yields the package's root normalization, without a second proof or an edge from the earlier roadmap to this one.

7. **F07** (P2) The factorial lattice agreement fails in weights this roadmap uses

   **Location:** packages/PadicHodgeRegulators/README.md:262: “the lattices coincide when a! is a p-unit, in particular for all weights used by Layer 4/Layer 5 here.”

   **Claim:** All relevant weights have identical EN and CN modified Tate lattices.

   **Witness:** At p=2,r=2, a=2: EN gives ⅛ℤ₂(2), CN gives ¼ℤ₂(2). Section 4.6 allows r=2,p=2; §4.4 allows arbitrary n≥2. At p=3,r=6 the same factorial obstruction occurs.

   **Exact repair text:** “The lattices coincide exactly when v_p(a!)=0, equivalently a<p. Outside that range, including p=2,r=2, transport the period map by the explicit factorial change of lattice before applying CN's comparison. Layer 4 uses such weights; the p>3, weight-two calculation in Layer 5 does not.”

   **Repair test:** For p=2,r=2 the conversion retains the factor 2; for p=5,r=2, a=0 and both lattices are ℤ₅(2).

8. **F08** (P2) The sharper nearby-cycle bound omits its p=2 dimension dependence

   **Location:** packages/PadicHodgeRegulators/README.md:284: “killed by p^(Nr+cₚ) with enough roots of unity ... uniformly in m and X.”

   **Claim:** The sharper bound has no dependence on the dimension of X at p=2.

   **Witness:** CN2017 lines 80–84, Theorem 1.1(i), explicitly allows c₂ to depend on chart dimension d. TauCetiRoadmap/CohomologyComparisonsPartII/README.md:550 retains this dependence. Its general N(e,p,r) bound is a separate assertion.

   **Exact repair text:** “With enough roots of unity the sharper bound is p^(Nr+cₚ), with cₚ depending only on p for odd p and also on chart dimension d for p=2. It is uniform in m, and in X at fixed d when p=2. Retain the separately stated general bound N(e,p,r).” Keep the directed undivided/divided conversion and factorial normalization when importing either bound.

   **Repair test:** For p=2 and charts of dimensions 1 and 2, use c₂(1) and c₂(2); no equality between them is inferred. For p=3 the same c₃ applies to both dimensions.

9. **F09** (P3) Two source records give the wrong years and one misnames an author

   **Location:** packages/PadicHodgeRegulators/sources.toml:279–299 and README.md:2202: “Kei Miyatani”, “year = 1993” (AM18), and “year = 2003” (AC20).

   **Claim:** These fields identify the cited works and versions.

   **Witness:** AM18 lines 5–7 identifies arXiv:1711.08854v2, 8 April 2018, and Kazuaki Miyatani. AC20 lines 5–9 identifies arXiv:2003.08888v2, 8 September 2020, and its authors.

   **Exact repair text:** In the existing AM18 entry use `authors = "Masanori Asakura, Kazuaki Miyatani"` and `year = 2018`; in the existing AC20 entry use `year = 2020`. Also replace “Kei Miyatani” by “Kazuaki Miyatani” in README.md:2202. Keep both existing keys and version identifiers. Note AM18's inconsistent internal date if retaining it in version metadata; do not substitute that date for the explicitly cited arXiv version.

   **Repair test:** Both manifest records now match the arXiv versions actually cited and cached; no duplicate key is introduced.

10. **F10** (P1) The finite Bloch–Kato complex and dual exponential already have an owner

   **Location:** packages/PadicHodgeRegulators/README.md:417: “The additional targets are the normalized kernel and crystalline exact sequences”; §1.4 also constructs the dual exponential and adjunction.

   **Claim:** These generic normalized constructions are new outputs of this roadmap.

   **Witness:** TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:3648 constructs precisely [D_cris→D_cris⊕t_V], with arrow ((1−φ)x,x̄), its cohomology comparison, dual exponential and adjunction. PhiGammaModulesAndIwasawaCohomology §5.7 reexports its period-boundary construction, including the positive cocycle.

   **Exact repair text:** “Import NoncommutativeAndEquivariantIwasawa §F.6's normalized finite complex, its comparison with H¹_f, exponential/dual-exponential adjunction and functoriality; use PhiGammaModulesAndIwasawaCohomology §5.7 for its exponential reexport. The exact fragments in §1.2 and the generic dual exponential in §1.4 are these supplied results. New outputs here are their regulator-specific comparisons and logarithm specializations.” Add that earlier supplier to the contract and Layer 1 dependencies; remove the duplicate construction obligations.

   **Repair test:** For V=ℚₚ the imported complex is [ℚₚ→⁰ℚₚ], so H¹_f=ℚₚ; for V=ℚₚ(1), its arrow is x↦((1−p⁻¹)x,x), giving a one-dimensional H¹_f. The sign and domains already match; no renormalized second construction is needed.

11. **F11** (P2) The reduced higher-weight symbol comparison drops a source hypothesis

   **Location:** packages/PadicHodgeRegulators/README.md:850: “under the Beilinson–Soulé conjecture for F and its residue field (n ≥ 3).”

   **Claim:** Those two vanishing hypotheses suffice for the comparison from reduced de Jeu cohomology in an arbitrary characteristic-zero field.

   **Witness:** BdJ2003 lines 162–180 requires vanishing for every characteristic-zero field and the residue field. ColemanIntegration §L3.Fa.4 distinguishes this reduced-complex hypothesis from the weaker hypothesis sufficient for the unreduced complex.

   **Exact repair text:** “For the reduced complex over a general characteristic-zero F, assume Beilinson–Soulé vanishing for every characteristic-zero field and for the residue field of O, as in ColemanIntegration §L3.Fa.4. The number-field case and the weight-two case retain their unconditional statements. If only F and its residue field satisfy the weaker hypotheses, use the imported unreduced comparison instead.”

   **Repair test:** At n=3 for a general F, knowing vanishing only for F and κ no longer licenses the reduced quotient comparison; at n=2 or for a number field the unconditional result remains. This is a source/supplier hypothesis mismatch, not a claimed counterexample to Beilinson–Soulé vanishing.

12. **F12** (P2) The general local-regulator formula invokes root classes outside their domain

   **Location:** packages/PadicHodgeRegulators/README.md:1000: “localRegulator L (rootClassK3 L ζ) = etaleDilog L ζ”; §5.7 declares arbitrary p and arbitrary finite étale L/ℚₚ.

   **Claim:** The root-class normalization equation is available over that entire general domain.

   **Witness:** Section 5.6 (line 975) defines rootClassK3 only for odd p, unramified L, and prime-to-p root order. At p=5,L=ℚ₅(ζ₅), the displayed argument is undefined and 5⁻¹ is not a ℤ₅ coefficient.

   **Exact repair text:** “The regulator is defined for every finite étale L/ℚₚ by the Chern, rationalization and logarithm composite. The rootClassK3 formula below is restricted to the odd-p unramified domain of §5.6 and its admissible roots. Fix its single universal sign there and transport the normalized composite naturally to all finite local extensions; this does not define additional integral root classes.” Qualify the equation and its normalization sentence accordingly; any broader integral root construction must be a separate named target with its coefficient domain.

   **Repair test:** The formula remains meaningful for L=ℚ₅,ζ=ω(2), with value 25 modulo 125. The regulator on K₃(ℚ₅(ζ₅);ℤ₅) remains defined, but the unavailable integral rootClassK3 argument is no longer used.

13. **F13** (P3) Several Checks are instructions without a test instance

   **Location:** packages/PadicHodgeRegulators/README.md:1395: “Prove both sides without assuming commutativity of the full matrix ring.” Similar instruction-only Checks occur at lines 1421, 2006 and 2147.

   **Claim:** These bullets provide adversarial Checks for their respective results.

   **Witness:** None supplies an input or evaluates an output; the 1395 bullet merely asks for the theorem's proof. It cannot reject replacing either inverse by zero or transposing a coordinate map.

   **Exact repair text:** Replace these four bullets respectively with: “For Φ=[[2,1],[0,3]], a=−5,b=6, P=[[1/2,−1/6],[0,1/3]] and ΦP=PΦ=I; the transposed candidate fails.” “For the same Φ, Q=[[-1,1/2],[0,−1/2]] and (I−Φ)Q=Q(I−Φ)=I; at Φ=1 the product is zero.” “For one constraint V₀=0 at x₀=0 in rank one, the coordinate image is XE[X]: X is admitted and 1 is excluded.” “For V=ℚₚ,j=−1, the relevant twist is ℚₚ(1); exp has the unit Kummer line as image, and the uniformizer class is outside it.” Keep these in README only.

   **Repair test:** Matrix multiplication gives diagonal entries 1 and off-diagonal entry 0 in both products; the transpose gives a nonzero lower-left entry. Evaluation at zero gives X↦0 and 1↦1. The uniformizer has valuation 1 while every exponential class has valuation 0.

14. **F14** (P3) Two Frobenius Checks still use the source's known mislabeled row

   **Location:** packages/PadicHodgeRegulators/README.md:733: “checked on the expansions of GSWZ (273)”; line 1103 cites the same row as the fifth-power value.

   **Claim:** The displayed expansions in (273) verify the arithmetic-Frobenius identity.

   **Witness:** Modulo 5, α⁵=4α+4. Frobenius fixes 4α²+4α+2, while the printed fifth-power row is 2α²+3α+1. GSWZ2024 lines 2705–2710; README:1152 correctly identifies that row as the square.

   **Exact repair text:** Replace both Checks by: “In the cubic example, modulo 5 we have α⁵=4α+4 and φ(4α²+4α+2)=4α²+4α+2. Thus p⁻²D(ζ₂₄⁵) has this same leading coefficient. The second row of GSWZ (273), with leading coefficient 2α²+3α+1, belongs to ζ₂₄² and cannot test this Frobenius identity.”

   **Repair test:** On the quadratic factor α²+α+2=0, the genuine Frobenius coefficient is 4; the mislabeled row is α+2≠4. On the linear factor α=2 they are 1 and 0. The theorem remains true; the claimed source-based Check is repaired.

## Earlier findings verified at this head

The IDs below are those in FIX-RT-PadicHodgeRegulators_r1.md. None was marked “not actionable in this package”; no settled finding is reopened. Quotes are from the repaired package. A repaired original defect can still have a distinct residual issue numbered above.

| Earlier finding | Status | Repaired passage and independent witness |
|---|---|---|
| r1a F01: invented comparison suppliers | Repaired | README:47: “Section citations identify the mathematical contracts; no additional declaration names are presumed.” The actual supplied CohomologyComparisonsPartII §§1–7 contain the named section contracts. All five residual gap slugs occur in both README and plan. S02 and S08 concern hypotheses of particular uses, not absent identifiers. |
| r1a F02: invented integration suppliers / wrong edge | Repaired | README:67: “both supply this roadmap independently.” ColemanIntegrationPartII §§3.0a–3.0c,4.0c,4.2–4.4,5–7 supply the stated integration objects. The regulator-specific comparison is explicitly owned in §7.11. No comparison→integration edge is assumed. |
| r1a F03: empty-boundary differential quotient | Repaired | README:1197 restricts the global-form quotient to “nonempty boundary.” README:1209 gives the proper elliptic value dim H¹_dR=2; its global-function differential quotient has dimension 0. This distinguishes the corrected carrier. |
| r1a F04: split simple graph restriction | Repaired | README:1321 retains “loops, parallel edges” and nonsplit descent; §7.11 covers geometric nodes and traces. An I₁ loop and an I₂ two-edge graph both have b₁=1; collapsing parallel edges incorrectly gives 0. The remaining cohomological descent is a declared gap. |
| r1a F05: conflated syntomic filtrations | Partly repaired | README:216 uses “compactification-filtered” rigid cohomology; line 223 distinguishes the dagger theory. At A¹, H¹(F¹RΓ_dR)=0 for the compactification filtration, whereas algebraic stupid truncation leaves K[x]dx. HK2011 lines 543–562 and Besser2000 line 636 distinguish the models. S02 records the independent surviving vertical/horizontal-log conflation. |
| r1a F06: false specialization nonlinearity | Repaired | README:617: “Λ-linear when the target has its Λ-action through η.” For γ acting through η(γ)=2, specialization sends γz to 2·sp(z); twisting with the unchanged action gives 2z rather than z for a nonzero class, but 0=0 for z=0. |
| r1a F07: unjustified ℚₚ-module on motivic classes | Repaired | README:1323 separates “ℚ-linear” maps on M from their extension to “M⊗_ℚℚₚ.” For M=ℚξ and a∈ℚₚ∖ℚ, aξ is not an element of M, while ξ⊗a has regulator a·reg(ξ). |
| r1a F08: missing exact-image headline | Repaired | Suggested.lean:101 declares evaluationConstraints_coordinate_image; README:1825 names it. For V₀=0 at 0 in ℚ[X], both sides admit X and exclude 1; for the diagonal condition in rank two, each coordinate image is all R. |
| r1a F09: inadequate tests | Repaired by the permitted alternative | No admitted example remains in Suggested.lean. README:1043 records “f₅(2)=1, f₅(3)=4 and f₅(4)=0”; §§8–9 retain the other computations. The requested extra Lean examples would violate the current acceptance contract. Instruction-only README Checks still need S13. |
| r1a F10: README/Lean name mismatch | Repaired | README §§5.1,5.2,5.5,9.1,9.7,9.9,9.11 register all seven remaining names, including “evaluationConstraints_coordinate_image” at 1825. The removed support names are not promised as Lean declarations. |
| r1a F11: missing manifest / duplicate source keys | Repaired | sources.toml has schema “tauceti-roadmap-sources/v1”, 32 distinct work IDs and no duplicate lifetime key. Each cached hash resolves. S09 concerns incorrect metadata inside two otherwise present entries. |
| r1a F12: generic reconstruction duplication | Repaired | README:29 cites “LinearEquiv.symm_apply_apply”; §9.13 is absent. Mathlib/Algebra/Module/Equiv/Defs.lean:358 states e.symm(e b)=b. §9.16 retains the arithmetic identification rather than declaring that generic inverse law again. |
| r1a F13: undefined largest weight at rank zero | Repaired | README:1369 and 1627 set “r_max=s_max=0” for empty tuples. The index range is empty, modules are zero and both determinant products are 1; these conventions reach §§9.23–9.26. |
| r1a F14: unused-index hypotheses | Repaired in both Lean headlines; collateral defect S01 | Suggested.lean:83 and 104 use “Set.InjOn x J”; the evaluation/nonzero/kernel assumptions quantify only over j∈J. For J={0} with two repeated evaluations, S=XR and det=X. README §9.4 nevertheless still needs a separate new-point assumption. |
| r1a F15: FO locator/version drift | Repaired | README:75 cites “Theorem 7.26(3), Theorem 7.28(4), Remark 7.29.” FO lines 6878,6926,6947 contain those exact sequences in the supplied 303-page version, printed pp.169–171. |
| r1a F16: API catalogue / undocumented padding | Repaired | Suggested.lean:3–23 identifies the “headline theorems” and missing carriers. Four real definitions support three nontrivial theorems, every declaration is documented, and no catalogue, prime instance or example remains. |
| r1b F01: nonexistent upstream contracts | Partly repaired | README:7 now cites “KTheoryFiniteLocalFields §§1.8,3.0a,6.6–6.7”; those sections exist. The Heegner attribution is gone. The now-readable K3BlochGroups supplies part of the declared gap (S03); global rank/finiteness was turned into an assumption or left uncited instead of imported from ArithmeticKTheory (S04). |
| r1b F02: nonexistent Selmer period sections | Repaired | README:33 names “PadicPeriodRings §§1.5,4.1–4.3” and “FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5”; those sections contain the objects. Selmer §§4.7,4.9 provide their stated realization/finite-condition contracts. The additional ownership overlap found in §F.6 is S10. |
| r1b F03: tame symbols assigned to wrong owner | Repaired | README:69: “K2SymbolsBrauer §§9.2–9.4 supply the tame symbol”; §§9.11,9.13 supply higher residues/finite support. For {u,π} the residue is ū, for {π,u} it is ū⁻¹; the regulator sections retain this order. |
| r1b F04: six elementary admitted theorems | Repaired by deletion | Suggested.lean now has only the three arithmetic/constraint headlines. The deleted inverse, Gamma, covariance, shear and finite-value claims remain as README mathematics. This follows the binding “delete padding” rule rather than the earlier suggestion to prove it. |
| r1b F05: unresolved Coleman slugs | Repaired | README cites “§L2.18” for the branch-dependent dilogarithm and §§L0.15,L0.18,L1.1,L1.19,L2.Fb,L2.13,L2.25 at their current headings. Those sections exist. The deeper overlapping construction ownership is S06. |
| r1b F06: nonexistent Tau Ceti declaration | Repaired | README:31 names “TauCeti.rootsOfUnityAlgebraMulEquivUnitsResidueField”. TauCeti/RingTheory/Henselian/Teichmuller.lean:258 gives that equivalence; :92,:123 give the lift and residue law. TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean:281 gives the full product decomposition. |
| r1b F07: unfixed absolute sign | Repaired | README:21 specifies “geometric reciprocity, the inverse of the arithmetic reciprocity” and the norm exponent for general K. At K=ℚ₅, κ(6) paired first with logχ gives +log₅6≠0; reversing degree-one entries gives −log₅6. An extension of degree two sends scalar units through u↦u². |

## Acceptance signatures and headline coverage

The supplied elaborated-signature record was compared declaration by declaration with the source and README. No Lean command was run: the read-only prohibition takes precedence over the generic instruction to elaborate a scratch file. There are seven declarations: four definitions with bodies and three theorems with sorry. Their namespace is TauCetiRoadmap.PadicHodgeRegulators. No surviving theorem is a one-tactic library restatement.

| Declaration / README section | Complete ambient context relevant to its type | Computed instances, both sides, and conclusion |
|---|---|---|
| finitePolylog / §5.1 | p:ℕ, Fact p.Prime, n:ℤ; native polynomial over ZMod p; no section field | p=5,n=2 gives X+4X²+4X³+X⁴; evaluations at 0,1,2,3,4 are 0,0,1,3,0. n=0 gives X+X²+X³+X⁴; n=−1 gives X+2X²+3X³+4X⁴. No k=0 denominator is included. At p=2 the polynomial is X, not zero. |
| residueDilogValue / §5.2 | p prime; F:Type u, Field F, Algebra (ZMod p) F; x:F | p=5: f(2)=1/1=1, f(3)=3/2=4, f(4)=0/3=0. The total Lean value at x=1 is 0/0=0; the theorem excludes it. At p=3, admissible x=2 has value 0, so the spanning headline needs p>3. |
| residueDilogValue_spans / §5.5 | p,s:ℕ, Fact p.Prime, hp:3<p, hs:0<s; scalar field ZMod p; native GaloisField p s | For (p,s)=(5,1), values {1,4,0} and differences both span a one-dimensional space. In 𝔽₂₅=𝔽₅[α]/(α²−2), f(2)=1, f(α)=4+2α, f(−1)=0; values and differences each have rank 2=dim 𝔽₂₅. At p=3,s=1 the span is 0≠𝔽₃, excluded by hp. Degree s=0 is excluded; the native splitting field is not a one-element field. |
| evaluationConstraints / §9.1 | E:Type u, R:Type v, Field E, CommRing R, Algebra E R; d,m:ℕ; J⊆Fin m, ev_j:R→ₐ[E]E, V_j≤E^d | ℚ[X],d=1,V₀=0 at 0: X belongs, 1 does not. Diagonal V⊆ℚ²: (1,1) belongs, (1,0) does not. J=∅ gives R^d; d=0 gives the zero module. Scalar closure computes ev(aF)=ev(a)ev(F), so it does not require R-linearity of ev into the unmodified E-module. |
| constraint_basis_and_determinant / §§9.7–9.8 | Previous E,R,d,m context plus IsDomain R; J,t,x,ev,V; InjOn x J; ev_j(t)=x_j, q_j≠0 and ker(ev_j)=(q_j), all only for j∈J | Rank one, zero conditions at 0 and 5: basis X(X−5), determinant and product both X(X−5). Rank two, V₀=E(1,0), V₁=E(0,1): basis rows (X−5,0),(0,X), determinant/product X(X−5). J=∅ gives determinant 1 associated to 1; d=0 gives the empty determinant 1 and exponents 0. Repeated unused x₁=0 leaves basis X and determinant X. |
| coordinateImageGenerator / §9.9 | E,R,d,m as for the definition; no IsDomain, no ev, and no unwanted hker binder; J,t,x,V,k:Fin d explicit | Previous two-axis example: g₀=X−5, g₁=X. Diagonal allowed line at 0: g₀=g₁=1, despite the constraint module being proper. J=∅ gives 1. In characteristic two E=𝔽₂, points 0,1 and zero lines give X(X−1)=X²+X. |
| evaluationConstraints_coordinate_image / §9.11 | Exactly the basis theorem's context, plus k:Fin d and r:R; all surviving hypotheses present in the supplied elaborated type | At zero conditions 0,5, r=X(X−5) has witness itself and g∣r; r=1 has neither a witness nor divisibility. For the diagonal line, (r,r) realizes every r and 1∣r. J=∅: r·e_k realizes r and 1∣r. Rank zero has no k:Fin 0, so no falsely asserted coordinate. |

The two constraint proofs require actual arguments: separation makes ev_j(t−x_i)=x_j−x_i a nonzero field scalar, adapted bases give successive free principal summands, and interpolation in E[t] supplies the coordinate witnesses. A PID or Noetherian hypothesis is unnecessary. Finite-dimensionality of V_j follows from V_j≤E^(Fin d), hence finrank(V_j)≤d and natural subtraction does not introduce a junk codimension. Neither headline assumes its own conclusion.

For finite-residue spanning, when q>p the nonconstant fibers have at most p−2 points after the double-root cancellation. Thus the image has at least (q−2)/(p−2)>q/p elements, exceeding every proper affine 𝔽ₚ-subspace. At q=p, f(−1)=0 and nonvanishing give both linear and difference spanning. For q=25,p=5, the lower bound is 23/3>5; the explicit rank-two computation above independently tests it.

README headline inventory: the local integral logarithm (§1.10); Chern/Bloch–Kato and syntomic-boundary comparisons (§§4.2,4.6); finite-residue spanning and completed local K₃ isomorphism/generation (§§5.5,5.8–5.9); global regulator compatibilities (§6); proper, open, relative and semistable curve formulas (§7); Perrin–Riou interpolation, reciprocity and determinant (§8); constraint basis/determinant/image (§§9.7–9.11); arithmetic Coleman image, elementary divisors, integral cokernel and de Rham interpolation (§§9.23–9.36). The three statable headline statements are present. Suggested.lean:11–17 names the missing K-theory, syntomic/continuous-period, Wach/étale-module and analytic-distribution carriers for the others. The global positive-rank injectivity proposition is explicitly conjectural, not an admitted theorem. Algebraic inverse, Gamma, shear and row-matrix identities are support statements, correctly absent from the acceptance file.

## Computed statement ledger

This ledger has one row for each of the 113 numbered target sections and each of the 18 supplier subsections, plus the conventions. Values are computations in the indicated models, not claims of completed Lean proofs. “Conditional” means the named declared supplier contract is retained; it does not manufacture that missing construction. References to findings give the required change.

| Convention or supplier statement | Instances and computed values on each side | Result / change |
|---|---|---|
| Local fields, products and empty product | ℚ₅×ℚ₂₅ has ℚ₅-dimension 1+2=3; empty product has dimension 0 and zero cohomology. A characteristic-p field is not a finite extension of ℚₚ. | Scope consistent. |
| Tate period and weight | r=0,1,2 give φ(d_r)=1,p⁻¹,p⁻²; filtration jumps 0,−1,−2. At r=1, t⁻¹v₁ is invariant whereas v₁ alone transforms by χ. | Sign/weight conversion consistent. |
| Positive boundary and reciprocity | g(b)−b=c(g), replacing the lift by b+v changes c by a coboundary. At ℚ₅, ordered κ(6),logχ has value log₅6≡55 mod125, reversed order −55≡70. | Nonzero sign witness. |
| Finite-extension reciprocity norm | Unramified quadratic K/ℚ₅, u=6: norm 36; cyclotomic action exponent 36, not 6; log36=2log6. | General-K norm retained. |
| Dilogarithm/Chern/Gros | Weight 2 over ℚ₅: Gros multiplier 1−1/25=24/25; a normalized value 25 mod125 becomes 24 mod5=4. Weight 3 Chern conversion includes 2!, not 1. | S06 ownership; normalization matters. |
| Iwasawa twists and row convention | η(γ)=2: twisting γ gives γ/2. Row (5,7) times [[1,2],[3,4]] gives (26,38), while transpose gives (19,43). | Consistent. |
| Fundamental sequences (71) | V=0: all terms 0. For ℚₚ(2), 1−φ=1−p⁻²≠0; at p=5 its inverse is 25/24. For ℚₚ, 1−φ=0. | Correct exact fragments; S10 ownership. |
| Small-weight integral comparison (83) | p=5 admits weights 0,1,2,3; p=3 excludes weight 2; p=2 has no claimed positive small-weight range. | Boundaries retained. |
| Fontaine h_Iw (95) | V=ℚₚ gives a one-dimensional Λ-torsion fixed subspace; a nontrivial unramified character gives fixed subspace 0. For ℚₚ(1), ψ((1+π)/π)= (1+π)/π, but φ changes π to (1+π)^p−1. | Domain and torsion distinctions sound. |
| Character twisting (115) | η(γ)=2 and z≠0: unchanged-action values 2z and z differ; z=0 gives 0=0. Twisting twice by 2 and 3 scales γ by 1/6. | Earlier false blanket nonlinearity repaired. |
| h_Iw twist compatibility (135) | Identity character yields h(y)=h(y); for χ^r the representation basis changes v₀→v_r and invariant vector t⁻ʳv_r. | Character/twist carriers agree. |
| ψ-fixed Wach containment (146) | Trivial line has 1/π outside A⁺ but inside π⁻¹A⁺. Tate line N=π⁻¹A⁺v₁ contains (1+π)v₁/π. | Quotient hypothesis distinguishes the exponent. |
| Lattice/coefficient change (157) | T and pT have common rational space: (pT)[1/p]=T[1/p]. Rank-one coefficient extension E→E′ changes E to E′, retaining rank 1. | Imported equivalences, no integral inversion inferred. |
| Teichmüller splitting (168) | In ℤ₅, −1 splits as (−1,1), 6 as (1,6); product reconstruction gives −1 and 6. At residue 𝔽₂ the tame factor has order 1. | Native pin supplies it. |
| Unramified Frobenius (180) | On ℚ₅ φ=id; on 𝔽₂₅=𝔽₅(α), α²=2, α⁵=−α and φ²α=α. Fixed subfield has 5 elements. | Arithmetic direction correct. |
| Étale Chern regulator (193) | Weight one u=1 maps to 0; u=6 to κ(6). For 𝔽₃, weight 3 mod2, edge group order 2 but Chern multiplier 2 gives zero. | Edge/Chern distinction correct. |
| Rigid/dagger syntomic (214) | Point n=2,p=5: η(0,1)=25/24. Point n=0: H⁰=H¹=ℚ₅. A¹: H¹(F¹RΓ_dR)=0 versus K[x]dx for algebraic truncation. G_m: (1−φ/p)dlog t=0. | Filtration repair sound; S05 broader arithmetic localization fails. |
| Log-syntomic complexes (233) | ωτ=τω=p^r: r=0 gives identity; r=2 modp gives zero. For the weight-one point, vertical-log H¹ has dimension 2 versus rigid dimension 1. | S02. |
| Fontaine–Messing map (258) | Unit divided class gives κ; undivided gives pκ and vanishes modp. p=5,r=2: both modified lattices ordinary; p=2,r=2: ⅛ℤ₂ versus ¼ℤ₂. | S07. |
| Divided/bounded comparison (280) | r=1,p=3 and r=2,p=5 are divided exact-range cases. p=2 charts of dimensions 1,2 require c₂(1),c₂(2) in the sharper bound. | S08. |
| Finite unramified étale algebra (293) | x³−x²+1 mod5=(x−2)(x²+x+2); the quadratic discriminant is 3, a nonsquare, so degrees 1+2=3. Empty algebra rank 0. ℚ₅(ζ₅) has degree 4 but residue degree 1. | Distinguishes étale/unramified. |
| Completed K₃ (313) | ℚ₂₅×ℚ₅ at p=5 gives free rank 3. Empty product 0. At p=3, ℚ₃ contributes torsion ℤ/3, incompatible with a free lattice. | Correct supplied scope. |
| Completed Bloch comparison (335) | For odd unramified p, finite quotient rank-one free part gives ℤ/p^ν; at p=3 retained torsion contributes an additional ℤ/3. The root denominator m=4 is a unit at p=5. | Conditional completion gap; S03 removes existing root construction from it. |
| Good Wach basis (346) | Rank one gives one ψ-zero Λ-coordinate; rank zero gives zero coordinates. Scaling a basis by a coefficient unit u scales coordinates by u⁻¹, preserving reconstruction. | Supplier congruence retained. |

| Numbered target | Instances and computed values on each side | Result / change |
|---|---|---|
| 0.1 Tate/Hodge conventions | ℚₚ(0),ℚₚ(1),ℚₚ(2): weights 0,1,2; φ=1,p⁻¹,p⁻²; Fil⁰ dimensions 1,0,0. Zero representation: all dimensions 0. | Consistent. |
| 1.1 Local conditions | K=ℚₚ, r=−1,0,1,2: (dim e,f,g,H¹)=(0,0,0,1),(0,1,1,2),(1,1,2,2),(1,1,1,1). | All inclusions and negative controls agree. |
| 1.2 Exponential exact sequences | r=0: tangent 0, exp image 0, finite H¹ dimension 1. r=1: tangent dimension 1, full H¹ dimension 2. r=2: exp 1-dimensional isomorphism. | True; S10 ownership. |
| 1.3 Logarithms | κ(6)↦log₅6≡55 mod125; tame roots↦0. Quotient model Fil⁰=Ee₁, fixed image=Ee₂ in E²: target E²/(Ee₁+Ee₂)=0; omitting fixed image gives dimension 1. | Injectivity and quotient cases distinguished. |
| 1.4 Dual exponential | exp*(logχ)=1 for trivial V; for V=ℚₚ(1), Fil⁰=0 and exp*=0, ker dimension 2≠dim H_f=1. Degree-one swap gives −log₅6, degree-zero swap +log₅6. | Sign sound; generic construction imported under S10. |
| 1.5 Dimensions | With [K:ℚₚ]=2: r=0 gives dim H_f=1, H_g=1, H¹=3; r=1 gives 2,3,3; r=2 gives 2,2,2. V=0 gives 0 throughout. | Formulas agree. |
| 1.6 Duality | ℚₚ(2) pairs with ℚₚ(−1): finite subspaces full/zero, annihilators zero/full. ℚₚ pairs with ℚₚ(1): unramified character evaluates to zero on units and to 1 on a uniformizer. | Both annihilator directions tested. |
| 1.7 Restriction/corestriction/twist | Degree-two extension: cor(res(exp a))=exp(2a); Tr(a)=2a. Identity degree 1 gives a. Finite twists ℚₚ→ℚₚ(1) change dim H_g from 1 to 2, so no basis-induced H¹ twist equality. | Correct. |
| 1.8 Tate conditions | r≤−1: e=f=g=0 but H¹ dimension N. r=0: 0,1,1; r=1: N,N,N+1; r=2: N,N,N. Integral r=2 at p=3 retains ℤ/3 torsion. | Rational/integral distinction correct. |
| 1.9 Abelian Kummer logarithm | Torsion P: κ(P)⊗ℚₚ=0=log_A P. Formal parameter z: logarithm z+O(z²), not identically zero. For pullback differential 2ω, pairing is 2log_ω(P), not log_ω(P). | Good-reduction and differential scaling retained. |
| 1.10 Integral unramified logarithm | p=5,r=2: lattice 25𝒪_L, index q²; at L=ℚ₅, ∂²(1)=exp((25/24)d₂). p=3,r=2 excluded; actual integral H¹ has ℤ/3 torsion. | Lattice and sign consistent with the trace construction. |
| 1.11 Semilocal maps | ℚ₅×ℚ₅: (κ6,0),(0,κ6) span two dimensions; diagonal alone has one. Empty algebra: 0. ℚ(√2) at 7 splits, giving dimension 2. | Product scope correct. |
| 2.1 Generator independence | γ′=γ^a gives logχ(γ′)=a logχγ and logγ′=a logγ, so their quotient is unchanged. a=2 and then 3 gives total factor 6 in numerator and denominator. | Correct on admitted generators. |
| 2.2 Root-system change | ε↦ε^a gives t↦at and v_r↦a^r v_r, hence d_r↦d_r. Changes a=2,b=3 compose to 6; Mellin transport uses σ₆⁻¹. | Arithmetic and period coordinates agree. |
| 2.3 Character specialization | ev_η(γz)=η(γ)ev_η(z): at ηγ=2 this is 2ev_η(z) on both sides. Zero class gives 0=0. | Earlier false nonlinearity repaired. |
| 2.4 Kummer/Coleman and ordered signs | f=1+π gives Δf=1 and h_Iw(v₁)=κ_Iw(ε), although all finite rational Tate-root projections are zero. f₆ has Δf₆(0)=5/2 and second logarithmic derivative 35/12. Pairing κ6,logχ is log₅6≠0; transpose negates it. | Nonzero and torsion-tower tests retained; full period-limit proof remains an implementation obligation. |
| 3.1 Étale dilogarithm | D(−1)=−D(−1), hence 0 in characteristic zero. D₅(ω2)≡25 mod125. Empty algebra: D=0. Branch change at z=5 gives ½log₅(−4)≠0. Diagonal inclusion gives (D(x),D(x)). | Correct domain and branch. |
| 3.2 Naturality/Frobenius | On tame ζ, logζ=0 and depletion equals Li₂(ζ)−p⁻²Li₂(ζ^p). On ℚ₅ this multiplier is 24/25. For degree-two scalar inclusion, Tr(D(x))=2D(x). | No ramified Frobenius asserted; S14 corrects the expansion Check. |
| 3.3 Number-field dilogarithm | F=ℚ gives one factor; F=ℚ(i), p=5 gives two factors exchanged by conjugation. Admissibility of (0,2) fails in the first factor even though 2≠0,1. | Component domain retained. |
| 3.4 Normalization dictionary | At a root of unity logζ=0, so L_mod,2(ζ)=Li₂(ζ). Weight 3 multiplier (n−1)!=2; Gros at p=5,n=2 multiplies by 24/25. | S06 imports the existing formula. |
| 3.5 Unit logarithm/regulator matrix | log(−1)=0; log₅6≡55 mod125≠0. The element p has log p=0 but is not a unit. Rank-zero global unit group yields a 0-column matrix of rank 0. | Unit restriction and rank-zero convention valid. |
| 3.6 Norm–trace logarithm | Scalar u=6 in an unramified quadratic extension: log N(u)=log36=2log6=Tr log6. For a root of unity both sides 0; identity extension gives logu. | Correct. |
| 4.1 Syntomic Chern/regulator | On ℙ², c₂(𝒪(1)⊕𝒪(1))=h²≠0=0+0, excluding additivity at K₀. u=6 gives log₅6. For W(𝔽ₚ(s,t)^perf), boundary {p,[s],[t]}={s,t}≠0 rationally. | S05 localization; S06 existing-domain ownership. |
| 4.2 Chern/Bloch–Kato comparison | n=1 gives κ(6)=exp(log₅6); n=2 gives exp/log inverse on a one-dimensional space. n=3 Chern-character factor is −1/2, so omitting it changes the map. | Source comparison and factorial retained. |
| 4.3 Weight-two special symbols | ζ=ω2 at p=5 is a special unit and gives ±25 mod125. Symbol [5] has valuation 1, so is outside the special-unit domain. The zero Bloch relation has regulator 0. | Formula true on its domain; S06 owner. |
| 4.4 Higher special symbols | n=2 coefficient 1; n=3 coefficient 2; at a root Li_mod=Li because logζ=0. For residue 𝔽₂ the special-unit set is empty, so its symbol-source map is zero. | S06 ownership and S11 reduced-complex hypothesis. |
| 4.5 Gros conversion | ℚ₅,n=2: D=25u becomes 24u, a unit when u is a unit; same kernel because 24/25≠0. A ramified field has no canonical unramified Frobenius of the asserted kind. | Formula correct; import under S06. |
| 4.6 Normalized syntomic exponential | Point p=5,r=2: unscaled boundary gives 25exp(a); multiplying by 1/25 gives exp(a). r=0 gives ω=τ=id; r=2 mod5 gives composites 0. | Conditional boundary gap; all-weight conversion needs S07. |
| 5.1 Finite polylogarithm | p=5,n=2 coefficients 1,4,4,1; li(1)=0 and li′(1)=1+8+12+4=25=0. p=3,n=2: li(1)=2, so double-zero claim cannot extend. p=2 gives X. n=−1 coefficients k. | All index/prime boundaries retained. |
| 5.2 Residue function | p=5 admissible values at 2,3,4 are 1,4,0. x=1 is excluded despite total Lean value 0. At p=7 values at 2,…,6 are 3,1,4,6,0. | Correct rational-function domain. |
| 5.3 Root reduction | ζ=ω2 over ℚ₅ has ζ⁵=ζ and p⁻²D(ζ)≡1 mod5, hence D(ζ)≡25 mod125. ζ=−1 gives 0. At p=2, ζ=−1 has ζ²=1, outside D's domain. | Odd-prime restriction is essential. |
| 5.4 p²-integrality | For p=5, ζ=ω2 has valuation exactly 2. At x=−1, D=0 lies in 25𝒪. At x=5, x is not a unit and the stated special-unit theorem does not apply. | General special-unit condition retained. |
| 5.5 Residue and difference span | 𝔽₅ values {1,4,0}: both spans dimension 1. 𝔽₂₅, α²=2: 1 and 4+2α have determinant 2≠0; subtracting f(−1)=0 retains them. Product coordinates are isolated by subtracting tuples differing in one entry. | True; Lean matches. |
| 5.6 Integral root classes | ζ order 4 at p=5: 4⁻¹(4[ζ]); multiplying back by 4 recovers the integral multiple. ζ=−1 has inverse itself, so 2[ζ]=0 and odd-p completion gives 0. A factor ζ_i=1 has no raw symbol. | S03 owner; domain deliberately restricted. |
| 5.7 General local regulator | ℚ₅ tame class gives 25 mod125; empty algebra gives 0; torsion maps to 0 in a field. Over ℚ₅(ζ₅) the general composite exists but §5.6's class does not. | S12. |
| 5.8 Local K₃ isomorphism | ℚ₂₅×ℚ₅ at p=5 gives free rank 3 and lattice 25(ℤ₂₅×ℤ₅). Rank zero gives 0≃0. Multiplication by 5 between rank-one lattices has zero residue and is not surjective. p=3 has torsion ℤ/3. | Nakayama route discriminates wrong maps. |
| 5.9 Root generation | ℚ₅: ω2 supplies nonzero residue 1 and generates. For the three GSWZ residue rows (4,4,2),(2,3,1),(3,3,2), determinant is 2 mod5, hence a basis. | Finite-product difference argument needed and supplied. |
| 6.1 Global regulator | F=ℚ or totally real: rational K₃ rank 0 and regulator 0. F=ℚ(i),p=5: source rank 1, target dimension 2; neither ranks nor target size imply injection. | S04 supplies the actual rank theorem. |
| 6.2 Special-unit presentations | A zero five-term combination maps to 0; a normalized tame root has value Li₂(ζ). [p] is not a special-unit presentation. | Does not assert the open arbitrary-presentation conjecture. |
| 6.3 Restriction/transfer | For degree-two F′/F and a restricted class ξ, transfer gives 2ξ; trace of the included regulator gives 2D(ξ). Degree-one identity gives D(ξ). | Correct functorial type. |
| 6.4 Frobenius | On ℚ₅ φ=id, so D(ζ⁵)=D(ζ). On an unramified quadratic factor φ²=id and both iterates return D(ζ). | No choice of ramified Frobenius hidden; S14 corrects the expansion Check. |
| 6.5 Torsion/denominators | Torsion order m: mD(ξ)=0 in a characteristic-zero vector space, so D(ξ)=0. For p=5 unramified, every integral class lands in 25𝒪; multiplying a rational presentation by its denominator returns the integral relation. | Finite generation needs S04. |
| 6.6 Habiro export | At p=5 the exported local lattice is 25𝒪 and φ-equivariance is unchanged. Empty product exports zero. No inverse global regulator is supplied in positive rank. | Downstream direction correct; S04 global finiteness. |
| 6.7 Injectivity proposition | Totally real rank 0: kernel 0 automatically. Imaginary quadratic rank 1: an abstract zero map has kernel dimension 1 although target dimension 2, so rank bounds cannot prove injectivity. | Correctly a proposition/conjecture, not a theorem; S04 imports ranks. |
| 6.8 GSWZ worked example | Mod5, normalized root columns have determinant 2. Coefficients (1,3,1) give (4,4,2)+3(2,3,1)+(3,3,2)=(3,1,2), matching normalized ξ. Polynomial factorization gives residue degrees 2 and 1. | Corrects the source's mislabeled squared root. |
| 7.1 Curve syntomic coordinates | ℙ¹: H¹=0, target 0. f=2: B=1−P²=(1+P)(1−P), so βj_p=j_q(1+P). For p=q=5, φv=2v, normalized/raw pairing factor is 1−1/(5·2)=9/10. In H²_rig, φ=q makes 1−φ/q=0 in weight one. | Coordinate, scalar and weight hypotheses distinguish the maps. |
| 7.2 Open-curve splitting | Proper genus-one curve with empty boundary: dim H¹_dR=2, global-function quotient dimension 0. ℙ¹ minus {0,∞}: H¹ has basis dlog t and dimension 1. ℙ¹ minus one point: dimension 0. | Empty boundary repaired. |
| 7.3 Curve symbol regulator | {u,π} has tame residue ū; {π,u} has ū⁻¹. A Steinberg symbol {t,1−t} gives regulator 0. A symbol with residue ū≠1 is outside the tame kernel and cannot define the asserted proper class. | Domain and residue order correct. |
| 7.4 Coleman-integral formula | {f,1−f} represents 0 and pairing is 0; a constant function has divisor 0 and gives zero divisor integral. Swapping symbol entries negates the integral by bilinearity/Steinberg identities. | Comparison uses imported integrals, not a new integration theory. |
| 7.5 Curve Bloch–Kato logarithm | Canonical class a and normalized class B⁻¹a differ: pairing against φ-eigenvalue 2 at p=5 gives the factor 9/10. Zero K₂ class gives zero on both comparison paths. | Raw and normalized maps distinguished. |
| 7.6 Pull/push/base change | Degree-two finite map: cup(f*a,f*b)=2cup(a,b), and cup(f*a,c)=cup(a,Tr c). Identity map gives coefficient 1. In characteristic zero, a nonconstant finite curve map is separable. | Source hypotheses fit. |
| 7.7 Semistable/arbitrary reduction | I₁ loop: b₁=1−1+1=1; I₂ two edges: 2−2+1=1. Good-reduction tree: b₁=0. After a splitting extension of degree e, normalized trace sends a base scalar ec/e to c. | Conditional descent gap; no simple-graph shortcut. |
| 7.8 Relative symbol extension | {t,1−t} gives split extension and coordinates (0,0). Tame residue ū≠1 forbids proper lifting. In degree n=1, source comparison coefficient (−1)^n is −1, so coordinate c goes to −c, not c. | Hypotheses explicitly retained; no invented filtered category. |
| 7.9 Fiber specialization | σ(t)=t^p, W=ℤ₅, evaluation at α=2 gives 32≠2, so is not Frobenius-compatible; evaluation at its Teichmüller lift has α⁵=α and is compatible. Evaluating a zero extension gives zero. | Frobenius-compatible points required. |
| 7.10 Continuous/discrete coordinates | Change lift by a: (y+Na)−N(w+a)=y−Nw and (z−Ia)+I(w+a)=z+Iw. With N(a,b)=(b,0), ρ=(0,1), λ=2, branch correction −λρ−λ²Nρ/2=(−2,−2), not (0,−2). For M=ℚξ, ξ⊗a is valid for a∉ℚ while aξ is not. | Repaired scalar scope; quadratic branch term necessary. |
| 7.10 monodromy/trace conventions | e=2,N_b(e₁)=e₀: N_c(e₁)=−2e₀ and exp(−2·3N_b)e₁=e₁−6e₀=exp(3N_c)e₁. For quadratic α²=π, Tr(α²)=2π but (Tr α)²=0. | The whole local index must be traced. |
| 7.11 Full semistable symbol pairing | A loop has two flags and contributes its two oriented annular terms; reversal negates the residue. For an I₂ cycle, the harmonic vector (1,1) has graph pairing 1²+1²=2; collapsing to a single tree edge gives 0. For N=0 the correction vanishes. | General graph carrier retained; regulator cancellation remains a substantive new proof. |
| 8.1 Frobenius inverse candidate | Φ=2,a=−5,b=6 gives P=1/2; Φ=−1,a=0,b=−1 gives P=−1; Φ=0,a=b=0 gives P=0 and ΦP=0≠1. | Definition and nonzero denominator sound. |
| 8.2 Two inverse identities | Φ=[[2,1],[0,3]],a=−5,b=6 gives P=[[1/2,−1/6],[0,1/3]], with both products I. At Φ=0,b=0 both products 0. | True; replace instruction-only Check under S13. |
| 8.3 Euler inverse candidate | Φ=2 gives Q=−1; Φ=0,a=b=0 gives Q=1; Φ=1,a=−3,b=2 gives Q=0 because 1+a+b=0. | Correct distinction from Φ⁻¹. |
| 8.4 Euler inverse identities | Same triangular Φ gives Q=[[-1,1/2],[0,−1/2]], both products with I−Φ equal I. At Φ=1, product 0≠I. | True; S13 Check. |
| 8.5 Quadratic Euler formula | Φ=2,a=−5,b=6,p=5: left Q(1−P/5)=−9/10; right numerator −54 divided by 60=−9/10. b=0 would give a total-function denominator zero and is excluded. | Noncommuting ambient matrix ring is harmless: all expressions are polynomials in Φ. |
| 8.6 Gamma factor | j=0,−1,−2,−3,2 give 1,1,−1,1/2,2 respectively. Every value is nonzero in the characteristic-zero coefficient field. | Correct Laurent coefficient, not p-adic Gamma. |
| 8.7 Logarithmic factors | At χ³: ℓ₀=3,ℓ₁=2,λ₂=6. At trivial character: ℓ₀=0,ℓ₁=−1; δ₀(0)=1/logχγ≠0. Empty products λ₀=n₀=1. | Removable zero retained. |
| 8.8 Crystalline regulator | φ-fixed Tate tower gives (1−φ)y=0 and regulator 0. Linear model h(x)=2x,boundary=3x,Mellin⁻¹=5x: L(2)=15; wrong direction h gives 60. f₆ supplies the nonzero arithmetic value in §8.21. | Direction and zero class distinguished. |
| 8.9 Derivative obstruction | Rank-one φ=1: zeroth obstruction requires f(0)=0, excluding f=1+π in ψ=0. φ=2,p=5: 1−2=−1 and 1−10=−9 are invertible. φ-fixed constant lift differences have boundary 0. | No unique unquotiented inverse. |
| 8.10 Big exponential | Product ∏_{i=0}^{h−1}(t∂−i) sends t^k to 0 for k<h, and t^h to h!t^h. h=2: k=1 gives 0, k=2 gives 2t². Input 0 gives output 0. | Invariant quotient is essential. |
| 8.11 Auxiliary weight/twist | h=1→2 multiplies by ℓ₁; at χ³ this is 2. Empty weights give r_max=0; use admitted h=1, not inversion of a nonexistent h=0 map. | Correct localization domain. |
| 8.12 Crystalline twist extension | m=0 recovers L; m=1 and 2 agree after the ℓ₋₂ recursion. At χ⁻¹, ℓ₋₁=0; numerator 1 divided by it has a pole, so localization alone is insufficient. | Analytic extension is a separate theorem. |
| 8.13 Ramified interpolation | j=−1 gives Γ*(0)=1 and p^{n(j+1)}=1; j=0 gives 1 and p^n; j=−3 gives 1/2 and p^{-2n}. At n=1,p=5 these conductor factors are 1,5,1/25. | Negative factorial and conductor exponents correct. |
| 8.14 Unramified interpolation | φ=1,j=0,p=5: A=0,B=4/5, giving zero specialization. φ=2 gives A=−1,B=9/10, hence A/B=−10/9. | Invertibility hypothesis used precisely. |
| 8.15 Singular Euler specialization | φ=1/5,j=0,p=5: B=0,A=4/5. Cleared equality has left 0; it constrains the cohomological term but cannot divide by B to determine L. | No exceptional derivative theorem inferred. |
| 8.16 Quotient growth | Frobenius slope −1 yields order 1; slope 0 yields order 0 only on the admitted quotient. Zero functional gives zero regardless of slope, so it cannot certify a sharper general bound. | Quotient hypothesis retained. |
| 8.17 Naturality/lattice | Root changes a=2,b=3 give σ₂⁻¹σ₃⁻¹=σ₆⁻¹; the proposed direct σ₆ has the opposite action. Coefficient extension preserves rank and actual lattice inclusion. | Correct inverse action. |
| 8.18 Explicit reciprocity | P(κ6,logχ)=log₅6≠0; reversed P is its negative. Under involution, ℓ₀↦−ℓ₀ and σ₋₁↦σ₋₁, so +σ₋₁ℓ₀P transforms with the required crystalline symmetry. | Ordered-sign calculation supports the package's correction of LZ's transpose. |
| 8.19 Regulator determinant | Weights (0,2): ℓ₀ℓ₁, at χ³ value 6. Weights (1,1): ℓ₀², value 9. Empty tuple: determinant 1. | Not a rank-only formula. |
| 8.20 Scalar projection | On (2,3), first projection=2, second=3, zero=0; twice the first=4. | Functional is part of normalization. |
| 8.21 Tate/Coleman comparison | f=1+π: (1−φ/p)t=0. f₆ at p=5: Δ(0)=5/2, second log derivative 35/12, Col₀(χ²)=−35/3, L(χ²)=−70/3·d₁. Col₀ mass=(4/5)log₅6≠0. | Essential ℓ₀ and positive Kummer sign tested. |
| 8.22 Ordinary/multiplicative Coleman | α=1 gives zero trivial specialization; α=−1,β=−5 at p=5 gives (1−α⁻¹)/(1−β⁻¹)=2/(6/5)=5/3. Input 0 gives 0. | Split/nonsplit distinction valid. |
| 9.1 Constraint module | Rank one, V₀=0 at 0: X included, 1 excluded. Diagonal line: (1,1) included, (1,0) excluded. J=∅ gives all rows, d=0 only zero row. | Lean context agrees. |
| 9.2 Distinct-factor division | F=X(X−5) vanishes at 0,5 and both factors divide it; repeated point 0 with F=X gives one zero but X²∤X. | Separation necessary. |
| 9.3 Single-condition basis | V=E(1,0) at 0 gives rows (1,0),(0,X), determinant X and codimension 1. Over E[ε]/ε² the ideal (ε) has annihilator (ε)≠0 and is not a free rank-one summand. | Domain/nonzero-factor hypotheses exclude the latter model. |
| 9.4 New-point invertibility | J={0},B=X: unused evaluation at 0 gives determinant 0; unused evaluation at 5 gives determinant 5 and inverse 1/5. | S01. |
| 9.5 Transported subspace | V=E(1,0), C=[[1,1],[0,1]] gives W=E(1,−1); C=I gives V. C=0,V=0 gives W=E², showing invertibility is needed for dimension. | Row direction correct. |
| 9.6 Transported dimension | V=E(1,0),C=diag(2,3): V C⁻¹=E(1/2,0), both dimensions 1. V=0 gives 0. | Correct. |
| 9.7 Simultaneous basis | Zero line at 0,5 in rank one: basis X(X−5), not X². Two-axis rank-two conditions give rows (X−5,0),(0,X). Repeated unused index leaves basis X. | Correct Lean theorem; induction step needs S01 qualification. |
| 9.8 Determinant ideal | Previous rank-two basis has det X(X−5); scaling first row by 2 gives 2X(X−5), same ideal over ℚ[X]. Over ℤ₅, scaling by 5 changes the ideal and is not a basis change. | Associated, not literal equality, is appropriate. |
| 9.9 Coordinate generator | Empty J: 1. Rank-one zero lines at 0,5: X(X−5). Two-axis constraints: g₀=X−5,g₁=X. Diagonal constraint: both generators 1. | Definition discriminates whole-vector versus coordinate restrictions. |
| 9.10 Interpolation witness | Values 0,1 at 0,5 realized by X/5 over ℚ[X]. Over ℤ₅, F(5)−F(0)∈5ℤ₅, so the same values are impossible. Diagonal condition has witness (1,1) for coordinate 1. | No illicit integral interpolation. |
| 9.11 Exact image | For g=X(X−5), r=g has witness and g∣r; r=1 has neither. Diagonal constraint is proper but every coordinate r is realized by (r,r). | Both directions computed; Lean headline present. |
| 9.12 Coleman coordinates | f=0 gives zero; f=id,e=id gives identity. For U=[[1,1],[0,1]], c=(1,0) transforms to (1,−1), reconstructing c after multiplying by U. | Generic inverse law imported. |
| 9.14 Logarithmic matrix | Identity data: M=I. Row map [[1,2],[3,4]] gives that M, not its transpose. diag(1,0) gives det0. | Definition does not presume invertibility. |
| 9.15 Matrix expansion | (5,7)M=(26,38); (5,7)Mᵗ=(19,43). | Correct row convention. |
| 9.16 Arithmetic decomposition | With Col(z)=(5,7), arithmetic reconstruction gives (26,38); if f(z)=0 both sides 0. | Wach/(1−φ) identification remains substantive, unlike generic inverse reconstruction. |
| 9.17 Basis covariance | c=(1,0),U=[[1,1],[0,1]],M=I: c′=(1,−1),M′=U, c′M′=(1,0). Period-basis B=diag(2,3) changes final coordinates to (1/2,0). | Consistent two basis actions. |
| 9.18 Integral shear | e₁=2,e₂=3 sends (7,11) to (29,32), determinant 1−6=−5. e₁=1,e₂=−4 gives det5, nonunit over ℤ₅. e₁=e₂=0 gives I. | Nonzero determinant is not enough integrally. |
| 9.19 Line transformation | With F/G=7/11 and shear (2,3), (1+3·7/11)29=(2+7/11)32=928/11. F=0 transforms to F′=2G′; G=0 to G′=3F′. | Axes and finite slopes covered. |
| 9.20 Avoiding slopes | In ℤ₂, r=−2,e₁=4,e₂=2: e₁+r=2,1+e₂r=−3,det=−7 unit. e₁=2 fails by giving 0. A field has maximal ideal {0}, not infinite. | Hypothesis isolates the required local-ring case. |
| 9.21 Rational surjectivity | (5,X)⊊ℤ₅[[X]], but (5,X)[1/5]=ℤ₅[[X]][1/5]. Thus rational image is full while integral cokernel is 𝔽₅. | No integral equality inferred. |
| 9.22 Noncritical refinement | Rank one has its unique flag. In rank two, a flag starting in Fil¹'s line has intersection dimension 1 rather than the required 0 at that step; scalar φ makes every flag stable but does not fix this discrepancy. | Stability alone insufficient. |
| 9.23 Wach flag | For r=1, n₁(0)=1 after removing the linear zero; ℓ₀(0)=0. Rank zero gives an empty flag and no annihilator entries. | Analytic removable factors distinguished. |
| 9.24 Matrix elementary divisors | Weights (0,2) give (1,n₂), whose determinant n₂ is nonzero but has the admitted remaining zeros; at X=0 its removed factor makes it nonzero, unlike λ₂. | Correct separation from regulator factors. |
| 9.25 Specialization subspaces | V=span(1,0), M=[[0,1],[1,0]] gives W=span(0,1), forcing first coordinate 0. Full filtration with invertible Euler maps gives W=E². φ=1/p at i=0 makes one Euler factor 0 and violates NC. | Actual transported subspaces retained. |
| 9.26 Coleman vector image | One rank-one zero condition at x₀=0 gives XE[X]; X admitted, 1 excluded. Empty conditions give full image. | Generic statement has content; S13 supplies an actual Check. |
| 9.27 Regulator elementary divisors | Weights (0,2): (1,ℓ₀ℓ₁); at χ³ the nonunit factor evaluates to 6, while a rank-only pair or raw evaluation-factor pair differs. Rank zero: empty list. | Correct distinction from M and constraint determinant. |
| 9.28 Modular relation | p=5,k=2,a_p=0,(g,h)=(1,2): 2h=4g=4, corrected ρ=4−4=0, printed source ρ=2−8=−6. Nebentypus ε=−1 changes Frobenius determinant from +5 to −5. | Source error corrected; arbitrary character case keeps actual matrices. |
| 9.29 Integral finite cokernel | h=9,p=5, trace5,det5⁹: Cayley–Hamilton gives P₀²≡0 mod5, so φ^{2n}M⊂𝔪ⁿM. Unit φ=1 instead gives partial sums n, not 𝔪-adic convergence. (ϖ_E,X) has rational image full but integral cokernel 𝒪_E/ϖ_E. | The actual-lattice argument removes the cited special-basis restrictions; it does not prove integral surjectivity. |
| 9.29 Coordinate ideal step | On successive φ(π)-quotients γ acts by u^i. For h=2, (γ−1)(γ−u)F⊂φ(π)²F. Thus X_k times each coordinate lifts; quotient by the rational image is finite-length torsion, not necessarily 0. | No hidden coefficient-field division. |
| 9.30 Signed conditions | Col(z)=(1,0),U⁻¹=[[1,1],[0,1]] gives new vector (1,1); the second kernel changes. Multiplying a coordinate by a unit leaves its zero set unchanged. Zero class lies in both. | Basis dependence honestly retained. |
| 9.31 Admitted character domain | At κ=η valuation difference=∞, so admitted. On another component it is −∞, so excluded. At equality v=p^{N−c}, strict membership fails. | Domain not enlarged to all characters. |
| 9.32 Analytic derivative powers | On ψ-zero z=(1+T)^a with p∤a, ∂^kz=a^kz. k=0,1,−1 give z,az,a⁻¹z; for a=2,p=5 these are z,2z,z/2. | Negative powers use invertibility only on ψ-zero. |
| 9.33 De Rham regulator | Zero z and φ-fixed z give 0. At p=5 quadratic η, primitive Gauss sum divided by itself is 1; using modulus25 with primitive ζ₂₅ gives imprimitive sum0, hence 0. Reversing Gauss denominator multiplies by G(η)²=5. | Conductor and normalization distinguish wrong models. |
| 9.34 De Rham interpolation | j=0 gives Gamma1 and p^n; j=−3 gives Gamma1/2 and p^{-2n}. For V=ℚₚ,j=−1 the twist ℚₚ(1) has full H¹ dimension2 but exponential image dimension1. | “Sufficiently negative” cannot be replaced by “negative”; S13. |
| 9.35 Crystalline extension | Diagonal rank-one terms give α^{-n} times their analytic integral; at α=1/5,n=2 this is 25 times the integral. A Jordan block [[α,1],[0,α]] has only one eigenline, so a two-vector eigenbasis proof cannot cover it. | Package explicitly retains the general reduction proof; source gap recorded below. |
| 9.36 Multiplicative augmentation | α=1 gives augmentation0; α=−1,β=−5 gives multiplier5/3 at p=5. The zero map also has augmentation0, so injectivity is a separate part of Rubin's imported theorem. | Containment does not claim equality or derivative formula. |

## Supplier, ownership and pin audit

Citations were resolved against the supplied main checkout and the current new-roadmap heads, using the supplied sibling checkouts where available. The resolver's sole unresolved token, “FontaineBPR1994 §2.1”, is a source ID, not a missing roadmap. Its actual passage is FontaineBPR1994 line 136. No finding is based on that false positive.

| Supplier or pin | Contract actually located; consequence |
|---|---|
| Mathlib, revision 6b7abb3c7686292736be2955bd3eb9ebf63b456a | `Mathlib/FieldTheory/Finite/GaloisField.lean:66` defines the splitting field of X^(p^n)−X. `GaloisField.finrank` at 80 and `.card` at 130 require n≠0. The native definition does not itself exclude degree zero. |
| Mathlib polynomial and matrix carriers | `Polynomial.aeval`, `Mathlib/Algebra/Polynomial/AlgebraMap.lean:259`, is an algebra homomorphism. `Matrix.det_mul` and `Matrix.det_fin_two`, `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:141,809`, have the required commutative-ring context. These supply the generic algebra, not either simultaneous-constraint theorem. |
| Mathlib generic reconstruction | `LinearEquiv.symm_apply_apply`, `Mathlib/Algebra/Module/Equiv/Defs.lean:358`, has conclusion `e.symm (e b) = b`. This is exactly the removed one-lemma reconstruction target, not the arithmetic Wach comparison. |
| Tau Ceti, revision a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 | `TauCeti/RingTheory/Henselian/Teichmuller.lean:92,123,258` supplies the lift, residue identity and root/residue equivalence. Henselian/local and integral-closure/algebra assumptions are present; it is not an arbitrary-ring construction. `TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean:281` supplies the tame/principal product. |
| Tau Ceti Frobenius | `TauCeti/NumberTheory/LocalField/Frobenius.lean:61,74`: the two named theorems exist with local-field, finite Galois and unramified hypotheses. The root theorem concerns roots of order q_L−1, not all dyadic roots. Specializing K=ℚₚ gives the stated arithmetic action. |
| LocalFieldsRamification / LocalGaloisGroups / ProfiniteArithmetic | Main's unit filtration and deep logarithm, Layer 7 multiplicative completion, and profinite completion infrastructure support the listed imports. They do not supply the completed K₃ regulator. |
| PadicPeriodRings §§1.5,4.1–4.3 | Period carriers, invariant functors and fundamental identity located at README:194,359,391,412. These support the sequences, not a new local regulator. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5 | Finite-K continuous period/cohomology contracts and sequences exist. The small-weight use retains unramified K, odd p and the width p−2 bound. |
| ArithmeticGaloisDuality §R02.1.2 | Continuous cochains and their long exact sequences exist. Period topologies and continuous sections are separate inputs, not consequences of abstract group cohomology. |
| SelmerIwasawaCohomology §§4.7,4.9 | The small-weight realization and `blochKatoCondition`, `blochKatoCondition_T`, `blochKatoStructure` occur at README:1865,1907–1935. Its weight convention is opposite numerically; the package explicitly translates it. The finite exact fragment is already supplied. |
| PhiGammaModulesAndIwasawaCohomology §§5–6 | Integral ψ-complex comparison, twists, positive period-boundary exponential (§5.7), Wach modules and good integral bases are present. Generic normalization is imported; S10 identifies the earlier owner of the finite complex and adjunction. |
| NoncommutativeAndEquivariantIwasawa §F.6 | README:3648 supplies the finite complex and dual exponential with the package's arrow and sign. Merge position 32, before PadicHodgeRegulators at 212. S10. |
| ColemanPowerSeries Layers 1–2 | Norm-compatible unit systems, norm operator, Coleman series and logarithmic derivative exist. The regulator-specific comparison still needs the package's §2.4. |
| PadicMeasuresIwasawaAlgebras / LocallyAnalyticDistributions | The first supplies bounded measures/Iwasawa algebras and evaluation. The latter §§1.1,1.4–1.5,2.1,2.3,3.3 supply unbounded Amice, ψ-zero division, growth/determination and Mellin. Their multiplication-by-x operator is (1+T)d/dT; Dirac at 2 has eigenvalue 2, matching the package. |
| KTheoryFiniteLocalFields §§1.8,6.6–6.7,7.6 | Universal Chern operations, completed étale edge and semilocal completion exist. The edge requires finite cohomological dimension; the package uses the ordinary Chern map globally, including at real dyadic places. Weight-two factorial is 1. The completed-Bloch bridge remains conditional. |
| ColemanIntegration §§L2.Fb,L2.13,L2.18 | Bloch presentation, depleted polylogarithms and branch-aware dilogarithm exist. The branch convention at p distinguishes D¹(p) from D⁰(p) by ½log(1−p). |
| ColemanIntegration §§L3.Fa.1,L3.Fa.4,L3.Fb.2,L3.Fb.5–L3.Fb.6,L3.14–L3.15 | README:2393,2474,2548,2605,2633,3008 supplies the localization/symbol framework and the regulator formulas. S05, S06 and S11 give the domain and ownership repairs. |
| CohomologyComparisonsPartII §§2.1–2.3 | The compactification-filtered nonnegative-weight fibre exists. Dagger filtration and negative weights are declared extensions, not falsely alleged existing targets. |
| CohomologyComparisonsPartII §§3.1–3.4,4.1–4.4 | Directed maps, their factors, arithmetic-pair quotient hypotheses and derived completion exist. The p=2 bound at README:550 retains dimension dependence; S07–S08 concern dropped qualifications. |
| CohomologyComparisonsPartII §§5.1–5.3 | Hyodo–Kato total complex and convention transport exist. With N_c=−eN_b, the supplier's exp(−eλN_b) equals exp(λN_c); the sign is not silently changed. The additional descended extension-coordinate comparison is declared. |
| CohomologyComparisonsPartII §§1.1–1.6,6.1–6.7,7.1–7.5 | Filtered relative realization and extension coordinates, residue/Gysin and compatible evaluations exist with independent algebraic finiteness and compactification hypotheses. Section 7.4 is horizontal-log only: S02. |
| ColemanIntegrationPartII §§1.1–1.3,3.0a–3.0c,4.0c,4.2–4.4,5–7 | Actual geometric nodes, proper/open cohomology, Vologodsky integrals, corrected double pairing, globally compatible triple sums, traces and integration descent are supplied. Regulator cancellation and comparison are owned here; integration descent alone is not cohomological descent. |
| AlgebraicCurves / K2SymbolsBrauer §§9.2–9.4,9.11,9.13 | Divisor/curve carriers, tame symbols, higher residues and finite support exist. The relative regulator target adds the symbol-to-extension comparison, rather than redefines the residue. |
| K3BlochGroups §§3.5,4.20,6.3–6.6 | Suslin exactness and coefficient-localized root classes are present at the supplied head. Merge position 115. The completed comparison must consume them: S03. |
| ArithmeticKTheory §§3.2–3.4 | Global finite generation, localization and Borel ranks exist at the supplied head, merge position 113. They supply the omitted Layer 6 input: S04. |

All 28 supplied sibling folders were searched by object in both README and Suggested.lean; the four board packages and active/completed main roadmaps were also searched. Relevant ownership overlaps are recorded above. BorelRegulators concerns archimedean Borel normalization, not the p-adic comparison; ArithmeticKTheory supplies the ranks. Neither the named siblings nor the searched main/package files declare any of the seven fully qualified names in this acceptance file. The finite-residue spanning theorem and the algebraic simultaneous-constraint results have no competing owner located by these searches; this package owns their regulator applications. Open-head index searches were used as leads and relevant passages read, not treated as instructions or as proof of universal nonexistence.

| Declared gap | Registration and minimality audit |
|---|---|
| dagger-syntomic-filtration | Same slug, supplier and §§2.1–2.3 in plan and README. Dagger-tube filtration is distinct from the already supplied compactification filtration; the affine comparison is not asserted an equivalence. Point/proper normalization specifies the missing bridge. Accepted conditionally. |
| rigid-negative-weights | Same slug/supplier in both; current §§2.1–2.3 cover n≥0. Extending the same fibre with Fⁿ=F⁰ and p⁻ⁿφ specifies a coherent negative-weight extension, not a second syntomic theory. Accepted conditionally. |
| normalized-syntomic-boundary | Same slug/supplier in both; quasi-compact formal semistable domain, r≥1, p⁻ʳ conversion and the degree cutoff are stated. The proper comparison square is specified in §4.6. Accepted conditionally. |
| semistable-period-descent | Same slug/supplier in both; the missing comparison concerns extension coordinates, uniformizer changes and normalized traces, not the already supplied integration descent. Accepted conditionally on that precise cohomological contract. |
| completed-bloch-comparison | Same slug/supplier in both; finite unramified L and odd p retain the Tate-module obstruction. The actual completion bridge is accepted conditionally. S03 removes the redundant request to construct root classes. |

The required read-only dependency check returned exit status 0:

```text
depcheck: 29 roadmaps, 265 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The new suppliers proposed in S03, S04 and S10 are earlier in the supplied merge order. No ownership repair requires an upward edge.

## Source verification ledger

All 32 manifest work IDs resolve to legal cached texts. I also fetched the already identified Berger2003 and LLZ2011 preprint versions through the sources service, reusing their keys; no new work or missing-reference request was needed. The 32 rows below count locator groups, not 32 separate theorem proofs. A source locator can be verified while its scope fails to support the package's stronger claim, as indicated in the findings.

| Source | Locators verified against the text; result |
|---|---|
| GSWZ2024 | §1.5 (19)–(22), Definition 1.3: line 375; §3.1 (174)–(183), Lemma 3.1, Propositions 3.2–3.3, Theorem 9: lines 1965–2026; Example 4.3 (270)–(275): lines 2694–2712. The local theorem is not global injectivity. Root exclusions and the mislabeled example row require the corrections recorded here. |
| BdJ2003 | Theorems 1.6 and 1.10, Remarks 1.11,1.13,1.15 and Conjecture 1.14: lines 162–272. Definition 4.6 and Lemma 4.7: lines 1094–1107. Reduced-complex hypotheses support S11; the inverse normalization and Gros factor are distinct. |
| HK2011 | Base hypothesis: line 145. Definition 2.2.1 and Example 2.2.4: lines 543–595. Definition 2.3.3 and Proposition 2.3.4: lines 638–680. The point result has positive weight, the filtration is dagger-tube, and the coefficient DVR in this source is finite over ℤₚ. |
| Tamme2014 | Corollary 5.19 and proof, plus Remark 5.21: lines 1076–1119. Smooth projective hypothesis retained; the Chern-character/Chern conversion contains (−1)^n/(n−1)!. |
| NN2016 | Proposition 1.1: line 129; Theorem B: line 349; Proposition 4.13 and square: lines 2790–2813; Propositions 5.6–5.7: lines 3003–3045. The boundary uses the geometric-to-arithmetic edge and is not an unqualified finite-dimensional exponential identity. |
| CN2017 | Theorem 1.1 and Corollary 1.4: lines 54–121; Corollary 3.16: lines 1704–1718. The latter is an isomorphism for i≤r−1 and injection at i=r. The sharp p=2 constant retains d; S08. |
| Berger2003 | Journal Theorems II.3,II.6,II.8: lines 618,712,776; Definition II.12/Theorem II.13 and Remarks II.14–II.15: lines 853–905; reciprocity II.16/II.17: lines 943–987; A.3: lines 1019–1029. In the separately fetched arXiv v1, Theorem II.2 and its corestriction diagram really are on p.11, lines 347–361. Thus that apparently shifted locator is not a defect. |
| CC99 | Iwasawa/twist and reciprocity sections II.1,IV.2–IV.3,V.3 were read; in particular IV.3.1–IV.3.3: lines 945–986 and V.3.2: lines 1116–1160. The source uses its own reciprocity/cocycle conventions; the package's §2.4 is the required transport theorem, not a quotation of an identical sign convention. |
| Limites2004 | §III.4, especially Proposition III.4.2: lines 715–768. The lattice correspondence supports the lattice-change contract, not the separate ψ-fixed containment theorem. |
| LLZWach | Wach/good-basis constructions in §§2–3 and integral series argument in Propositions 4.6,4.11: lines 1400–1437,1540–1563. The latter's special-basis restrictions do not establish the package's wider range by citation alone; §9.29 gives an independent actual-lattice contraction argument. |
| LZ2014 | §2.4: lines 200–219; growth Proposition 4.8: lines 747–755; Appendix B (†), B.1–B.6: lines 1620–1797. Cleared Euler formulas, Gauss/Gamma factors and the inverse finite character were compared. The printed reciprocity sign conflicts with its own positive adjunction; the package explicitly corrects this transport. |
| Rubin2000 | Local Kummer/logarithm and duality in I §§3,6–7; semilocal convention in II §2; III §5.8, Proposition 5.14: lines 2392–2405. Split multiplicative gives augmentation containment, not surjectivity onto that ideal. |
| HK2 | §2.3, discussion after Proposition 2.3.2: lines 787–797; Appendix A, Lemma A.1 and Corollary A.2: lines 1829–1844. Completed units are the finite Tate-one condition; the valuation quotient is ℤₚ. |
| BNQD2002 | Lemme 1.3.2 and Théorème 2.1: lines 315,354; §2.2.2–§2.3.2: lines 416–459,589–616. The lattice, trace construction and its scalar normalization are retained, rather than deducing an actual lattice from an index alone. |
| Benois2014 | Proposition 2.8.2(i): lines 1731–1740. The finite complex gives the stated finite-condition dimension. The g-dimension additionally uses duality. |
| AM18 | Proposition 6.4: lines 1757–1768; Theorem 9.1: lines 2280–2286. Raw φ−1 coordinate and normalized inverse-Euler coordinate differ. Author/version metadata: S09. |
| AC20 | Footnote 4, printed p.43: lines 1749–1784. The regulator coordinate carries 1−p⁻²φ; it cannot be suppressed in the pairing comparison. Year: S09. |
| BdJ2012 | §1, especially Remark 1.10: lines 181–200. Divisor Coleman integrals and the open projection are supported; the empty-boundary proper complex is not the global-function quotient. |
| Ara2003 | Lemmas 3.3,3.6–3.7: lines 343–380. Pairing adjunction, trace and degree factor support the normalized curve formulas. |
| BZ2017 | Theorem 1.1: lines 88–119; §3: line 253 onward. Vologodsky gluing uses valuation/graph corrections; it does not alone prove a K₂ regulator formula. |
| Besser2000 | Definition 5.1: line 636; Definition 6.1/Proposition 6.3: lines 695–710; Proposition 8.6/Remark 8.7: lines 946–1034; Corollary 9.10/Proposition 9.11: lines 1173–1178; Proposition 10.3: line 1267. Compactification filtration, normalized coordinate and the unit regulator were compared. The scan's extraction is imperfect; no conclusion here relies on guessing an unreadable symbol. |
| BK1990 | §3.7, Proposition 3.8, Corollary 3.8.4 and (3.8.5): lines 685–882. Tate dimensions and annihilator directions were independently computed in the ledger. |
| EN2016 | §§2.1–2.2: lines 140–335, especially Theorem 2.2 at 318. Directed ω/τ, divided small-weight comparison and modified coefficients are present. The factorial lattice qualification is S07. |
| AM2022 | Theorem 2.23/§2.7: lines 710–805; Theorem 3.7: lines 1180–1225; Proposition 4.3, Lemma 4.4 and Theorem 4.5: lines 1573–1647. Coherence, truncated vanishing, tame kernel and the negative n=1 coordinate sign are retained. |
| Asakura2023 | Theorem 4.9 and Corollary 4.10, p.435: lines 2359–2380. They are a specified hypergeometric application at compatible/adapted Frobenius points, not arbitrary specialization without such compatibility. |
| Besser2025 | §3, Lemma 3.2, Propositions 3.3/3.5, Theorem 3.8: lines 293–385; Theorem 3.10: lines 413–423; Theorem 7.6: lines 1287–1299. The whole weight −2 target in Proposition 3.5 is too large; the package's ker(1−pφ) correction is necessary. The general graph comparison is additional work here. |
| BR2019 | §3 (3.1)–(3.5): lines 446–514; Theorem 4.7 proof, pp.19–20. The simple split graph is a source simplification. General nodes and descent are obtained from the named suppliers, not assumed to follow from this calculation alone. |
| WeibelChern | Proposition 5.1, p.24: lines 1046–1057. The multiplier is (−1)^(i−1)(i−1)!, which vanishes for weight three mod two despite a nonzero edge. |
| FO | Theorem 7.26(3), Theorem 7.28(4), Remark 7.29: lines 6878,6926,6947. The current 303-page text contains the repaired locators. The omitted x in its proof is recorded below. |
| FontaineBPR1994 | §2.1: lines 136–143; explicit lifts/positive boundary: lines 213–239. This resolves the citation-tool false positive and checks the p⁻ʳφ−1 convention. |
| LLZ2011 | Lemmas 4.1,4.3/Proposition 4.2: lines 1018–1076; Theorem 4.6: line 1095 and succeeding determinant/image results; §5A/Proposition 5.9: lines 1430–1449; integral theorem: lines 1458–1469. Preprint §5.3, Proposition 5.11/Remark 5.12: lines 1189–1226 in the separately fetched v2. The maximal-ideal shear is really stated there. Source coordinate and inclusion slips are recorded below. |
| RJ2018 | Proposition I.13: lines 1174–1194; Theorem I.15/Lemma I.17: lines 1255–1320; Theorem I.27, Proposition I.28, Corollary I.29: lines 1628–1666. Negative interpolation has a sufficiently-negative range, and the source's global crystalline proof only computes the negative-slope eigenbasis case. |

## Verified sound

Read all 2,216 README lines and all 114 Suggested.lean lines, together with the repository rules and all three earlier review/repair reports. Rechecked all 23 earlier findings individually. The current acceptance file has 7 declarations: 4 definitions with real bodies and 3 headline theorems with `sorry`. Its supplied elaborated signatures preserve the needed variables and instances. The 113 numbered README targets, 18 supplier subsections and conventions have computed-instance rows above; the Lean table separately records all 7 declaration contexts. There are 364 Check bullets in the README: all were inspected, with computations grouped by their target in the ledger. Four instruction-only bullets are S13; the two incorrect source-expansion Checks are S14. The source ledger verifies 32 locator groups across 32 work IDs and 34 version texts. The supplier ledger checks 25 groups of library/cross-roadmap contracts, alongside object searches of all 28 named sibling heads.

The repaired finite-residue theorem excludes p≤3, zero extension degree and the invalid residue arguments 0,1. The two constraint headlines restrict hypotheses to imposed indices, use genuine native submodules, and correctly handle rank zero, empty constraints and unrelated unused evaluations. No lost Lean binder, sorry'd data, dummy predicate, one-tactic padding or missing statable headline was found. No `lemma`, forbidden command, `set_option`, extra import or process narrative occurs in the acceptance file. The README has no pull-request numbers or process narrative. The numeric examples and geometric-series proof are mathematical checks/proof arguments, not computational algorithms proposed as library targets.

The proper/open curve distinction, continuous/discrete semistable coordinates, scalar restriction, arbitrary-reduction descent contract, rational/integral image distinction, singular Euler handling and negative-character interpolation cutoff survive the second pass. The source/supplier limitations in the findings are not waived by these sound special cases.

The read-only diff lists only files within packages/PadicHodgeRegulators. This review changes only its report and scratch notes; no source file, roadmap file, pin, dependency order, issue or pull request was changed, and no Lean command was run.

## Not verifiable

- I did not independently elaborate a new `#check` file: the brief forbids Lean execution and supplies the current elaborated signatures instead. I compared all seven supplied types with their source and README contexts. No signature edit was made that would invalidate that supplied check.
- The five declared supplier contracts are future mathematical deliverables. Their registration, scope and overlap were checked; their eventual proofs cannot be certified from the present suppliers. Four are accepted conditionally as written; S03 narrows the fifth's ownership without rejecting its genuine completion gap.
- The full construction of the broad crystalline de Rham extension in §9.35 is not supplied by the eigenbasis calculation in RJ2018. The package correctly states the remaining reduction as its own proof obligation; the source gap is recorded below, rather than treating the theorem as established by that calculation.
- Ownership beyond the supplied sibling files and the relevant current-head passages returned by the authorized index was not exhaustively checked. No unseen open pull request is asserted absent. No cited work was inaccessible, and no missing-source request remains.

## Source issues

- **Error** in GSWZ2024 at Proposition 3.2, printed p.38 (GSWZ2024 line 1995): the source says the congruence permits any prime and nonidentity root; it should be restricted to tame roots, excluding the undefined dyadic instance ζ=−1 with ζ²=1; affects nothing.
- **Misprint** in GSWZ2024 at Proposition 3.3, printed p.38 (GSWZ2024 line 1999): the source says the spanning family includes the identity root; it should be restricted to nonidentity roots where D is defined, retaining the surrounding p>3 range; affects nothing.
- **Misprint** in GSWZ2024 at equation (273), printed p.54 (GSWZ2024 line 2706): the source says its second expansion is the fifth-power root value; it should be labeled the value at ζ₂₄², as used in (274); affects a stated result.
- **Misprint** in BdJ2003 at Theorem 1.6(1), preprint p.4, and Theorem 1.10(1), p.5 (BdJ2003 lines 168,209): the source says the target Adams weight is r; it should be n, as in the adjacent diagrams; affects nothing.
- **Misprint** in BdJ2003 at equation (4.4), preprint p.24 (BdJ2003 line 1081): the source says truncated forms vanish when n<j; it should be when j<n, consistently with the preceding degree-at-least-n complex; affects nothing.
- **Misprint** in FO at proof of Theorem 7.28(1), printed p.171 (FO line 6932): the source says t⁻ᵈ belongs to B_e; it should be t⁻ᵈx for the preceding x with φ(x)=pᵈx; affects the proof.
- **Misprint** in LZ2014 at §2.4, preprint p.5 (LZ2014 line 217): the source says the adjunction's second cohomology argument has coefficients V; it should be assigned coefficients V*(1), matching the displayed dual exponential; affects nothing.
- **Error** in LZ2014 at Theorem B.6 and its proof, preprint pp.39–40 (LZ2014 lines 1772,1791–1796): the source says its positive adjunction yields the negative ordered reciprocity formula; it should be the positive formula under that adjunction, retaining the degree-one transposition sign; affects a stated result.
- **Misprint** in LLZ2011 at Proposition 4.2 proof, printed p.1118 (LLZ2011 line 1048): the source says the partially constrained module is contained in the fully constrained module; it should be the reverse inclusion, followed by the displayed membership test; affects the proof.
- **Misprint** in LLZ2011 at Proposition 5.9, printed p.1127 (LLZ2011 line 1449): the source says ρ=(2−a_p)g(0)−(p−1)h(0); it should be (2−a_p)h(0)−(p−1)g(0), up to overall sign; affects a stated result.
- **Error** in Besser2025 at Proposition 3.5, preprint p.8 (Besser2025 line 345): the source says D₀=0 identifies the extension quotient with all D₋₂; it should be an identification with ker(1−pφ), which may be strictly smaller; affects a stated result.
- **Gap** in RJ2018 at §IC9, Proposition I.28 and Corollary I.29, printed p.920 (RJ2018 lines 1644–1666): the source says the eigenbasis calculation gives global extension for every crystalline D; it should be accompanied by reductions handling arbitrary slopes and nonsemisimple Frobenius; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5eff35d27ed15f4590eeefeee780658843db1803", "job": "RT-PadicHodgeRegulators~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
