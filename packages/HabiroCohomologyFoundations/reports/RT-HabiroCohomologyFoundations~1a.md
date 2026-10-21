<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/149#issuecomment-6323103285 -->
Red team round 1 pass a (codex) of 0220c88

Verdict: needs_changes

1. **F01** (P2) The stated library revisions are not the required pins

   Location: `packages/HabiroCohomologyFoundations/README.md:51` (the two native starting-point revisions).

   Claim: the native API audit applies at the listed Mathlib and Tau Ceti commits.

   Witness: `lake-manifest.json` pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; neither equals the README revision.

   Exact repair text: “The native algebraic starting point is Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, with Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.” Recheck imported declarations and object-level duplication at these revisions.

2. **F02** (P1) The q-Witt supplier locators do not exist at its current head

   Location: `packages/HabiroCohomologyFoundations/README.md:140`, “QWittVectors QW.1”; the same obsolete labels occur throughout the supplier table and dependencies.

   Claim: QW.1–QW.4 supply the arithmetic, relative-ring and étale contracts, while QW.5/QW.6 designate interfaces constructed here.

   Witness: `TauCetiRoadmap/QWittVectors/README.md:274`, `:592`, `:682`, `:758` use §§2.1, 4.3, 5.1, 6.1; no QW.n section label exists at the supplied head.

   Exact repair text: replace the supplier contract with “Import arithmetic Λ-rings and perfect coverage from QWittVectors §§2.1–2.4; relative q-FV systems, rings and ghosts from §§4.2–4.4; étale base change and ghost pushouts from §§5.1–5.2; and completed étale and cyclotomic Frobenius from §§6.1–6.3.” Use those exact sections and their target names at every use. Remove the fictitious shared-owner labels QW.5 and QW.6:framings.

3. **F03** (P1) Framed calculus and positive-degree q-Witt theory already have an earlier owner

   Location: `packages/HabiroCohomologyFoundations/README.md:30`, “This roadmap constructs these interfaces in HQ.4 and HQ.1”.

   Claim: this package owns framed difference calculus and positive-degree q-Witt constructions, rebuilding them in §§1.2 and 3.1–3.13.

   Witness: `TauCetiRoadmap/QWittVectors/README.md:833`, `:855`, `:877`, `:937`, `:957`, `:986`, `:1010` already target the same systems, initial object, ghosts, base change, framed automorphisms and Jackson derivatives.

   Exact repair text: “QWittVectors Layers 7–10 supply positive-degree q-Witt systems and operators, complete framed difference calculus, and smooth torsion and comparison results. This roadmap imports them and constructs their global q-de Rham, filtered Nygaard and Habiro applications.” Replace the duplicate construction blocks by exact imports: §§3.1–3.2 → QWittVectors §§7.1,7.3–7.4; §3.4 → §7.2; §3.5 → §7.5; §3.7 → §7.6; §§3.8–3.9 → §7.7; §1.2 → §§8.1–8.3. Import §3.10 from QWittVectors §9.7 `QWitt.differential_pLocalDecomposition`; §3.11 from §§9.6–9.7 and 10.1–10.2. Retain only the additional fracture and crystalline-identification claims of §§3.12–3.13, with explicit inputs from those imports. Preserve this package’s distinct completion, animation, Nygaard and descent statements.

4. **F04** (P1) The q-V-system definition omits compatibility with degree-zero Verschiebung

   Location: `packages/HabiroCohomologyFoundations/README.md:977`, “with maps qW_m(R/A)→P_m^0 and transitive graded module maps”.

   Claim: the listed axioms define the category whose initial object has degree zero qW_m(R/A) and the usual Verschiebungen.

   Witness: take A=R=ℚ, P_m=ℚ[q]/(q^m−1), d=0, V_1=id and V_n=0 for n>1. All listed differential/transitivity laws hold; the expected initial system cannot map to it because V_2(1)=1+q≠0.

   Exact repair text: “Import QWittVectors §7.1 `QWitt.DifferentialVSystem`, including V_1=id and compatibility of each structural map qW_m(R/A)→P_m⁰ with the degree-zero Verschiebungen.” If the definition is displayed for reference, explicitly require the commutative square s_m∘V_{m/d}=V_{m/d}∘s_d. QW Definition 3.1(b), QW line 1827, includes this condition.

5. **F05** (P2) The restriction obstruction is incorrectly applied to every differential system

   Location: `packages/HabiroCohomologyFoundations/README.md:1032`, “Since P_m^0=qW_m(R/A), the differential systems cannot acquire such restriction operators either.”

   Claim: an arbitrary differential q-V-system has the specified degree-zero ring and cannot admit restrictions.

   Witness: the terminal zero family explicitly allowed at README:999 has P_m⁰=0 and unique restriction maps satisfying every restriction identity. For A=R=ℤ this is not qW_m(ℤ/ℤ).

   Exact repair text: “For the initial q-de Rham–Witt system, whose degree-zero ring is qW_m(R/A), the degree-zero obstruction rules out a functorial system of ordinary restriction maps on the full coefficient domain. It does not rule out restrictions on special q-V-systems.”

6. **F06** (P2) Nonexistence of a smooth section is not failure of essential surjectivity on smooth objects

   Location: `packages/HabiroCohomologyFoundations/README.md:1416`, “not essentially surjective and has no section, even over all smooth algebras”.

   Claim: the sentence applies both assertions to the smooth restriction.

   Witness: QH lines 940–966 prove failure of essential surjectivity on animated algebras using a nonsmooth quotient, and failure of a functorial section on smooth algebras. They do not provide a smooth object with no filtration.

   Exact repair text: “The forgetful functor on all animated A-algebras is not essentially surjective. Moreover, its restriction to all smooth A-algebras has no functorial section, since such a section could be animated.”

7. **F07** (P1) The locally dimension-bounded scheme construction evaluates the functor outside its domain

   Location: `packages/HabiroCohomologyFoundations/README.md:2018`, “with the relative dimension taken locally” and “Over the affine étale opens Spec S of X”.

   Claim: every such affine S is an input to the global-dimension condition in §5.8.

   Witness: X=Spec(ℤ×ℤ[1/2][x,y]) satisfies the local condition: its components have dimensions 0 and 2. Its identity affine open has dimension 2 but 2 is not invertible in S.

   Exact repair text: “First extend the canonical affine construction to locally admissible smooth algebras: decompose Spec S into its finitely many open-and-closed constant-relative-dimension loci and take the product of their canonical pairs. Prove compatibility with maps and étale localization. Use this extended affine functor in scheme descent and the affine comparison.” Retain the local scheme domain; do not replace it by a smaller global-prime domain.

8. **F08** (P1) The analytic side has no admissible supplier contract

   Location: `packages/HabiroCohomologyFoundations/README.md:2224`, “This uses HQ.5, AnalyticHabiroStack HS.3”; also :36, :215, :2255, :2269.

   Claim: HS.3 supplies the analytic coefficient ring, stack and solid coefficient category needed to formulate Layer 6.

   Witness: AnalyticHabiroStack is absent from `merge-order/ORDER.txt`, the supplied main/completed roadmap folders and all six supplied open-roadmap heads; this package has no declared gap or readable design plan.

   Exact repair text: “Layer 6 owns the analytic coefficient ring, Habiro stack and solid coefficient category required to formulate its comparison. Construct these with specified localization maps and boundedness conditions before §6.1; the comparison remains an open target in the stated generality.” Remove HS.3 from supplier/dependency tables and add separate named construction targets here before `TauCeti.QHodge.analyticComparisonProblem.coefficients`. This moves the needed notions to their first consumer; it does not assume an unspecified later analytic owner.

9. **F09** (P1) Acknowledged supplier obligations are not declared gaps

   Location: `packages/HabiroCohomologyFoundations/README.md:1075`, “This is a supplier obligation of CR.4”; also :1771 and :1820.

   Claim: relative ordinary de Rham–Witt factorization and finite-projective Frobenius/Nygaard/décalage transport can be consumed as supplier obligations.

   Witness: the package contains neither `design/plan.json` nor matching gap slugs; §§3.6 and 4.26 explicitly say the required proofs/interfaces remain to be supplied, while §4.28 exports their consequences.

   Exact repair text: replace each unsupported supplier assertion by a separate precise declared contract, with the same slug in the plan’s top-level `gaps` and in `## Exact supplier contracts`: (i) CR.4’s vanishing of differentials of the image of W_{a+1}(A) in qW_{p^a}Ω for a Λ-base that is a ℤ_(p)-algebra and any A-algebra R; (ii) PR.3’s coherent finite-projective Λ-base-change compatibility for relative Frobenius and its Nygaard filtration on the stated twisted q-de Rham inputs; (iii) AI.1’s coherent finite-projective scalar-extension compatibility for the filtered décalage used there. Each needs a verified supplier section or a separately owned target. Until then mark the dependent export as conditional on these explicitly declared contracts, not as already constructed.

10. **F10** (P1) The atlas places décalage on the wrong object

   Location: `packages/HabiroCohomologyFoundations/README.md:2332`, “its q-Hodge modification on the source and unfiltered Lη_h qΩ on the target”.

   Claim: `AtlasSquare.decalageQSubOne` has a q-Hodge source and Lη_h qΩ target.

   Witness: README:2395 instead states Lη_h qHdg≃qΩ. For ℤ[x], qHdg has the nonzero h-torsion class dx; qΩ has h-torsion-free cohomology, since its monomial differential coefficients [n]_q have nonzero constant term n.

   Exact repair text: “`AtlasSquare.decalageQSubOne`: source Lη_h(qHdg), target qΩ, over A[[h]], for a smooth chosen q-Hodge pair; h-complete; no inversion or Frobenius; trivial twist; an equivalence. Record the chosen filtration as the input constructing qHdg.” Use these same corners in the square-commutation targets.

11. **F11** (P1) Regular sequences implying Koszul regularity is already owned on main

   Location: `packages/HabiroCohomologyFoundations/README.md:2067`, “`TauCeti.QHodge.KoszulRegular.of_isRegular`”.

   Claim: this roadmap develops the passage from Mathlib regular sequences to Koszul regularity.

   Witness: `TauCetiRoadmap/DerivedModuleAlgebra/README.md:525` already proves positive Koszul homology vanishes for weakly regular sequences, a stronger hypothesis-free-of-properness result than the proposed regular-sequence target.

   Exact repair text: “Import DerivedModuleAlgebra §0.K.1: a finite weakly regular sequence has vanishing positive Koszul homology. Apply this to `RingTheory.Sequence.IsRegular` through its weak-regularity component when constructing perfect-regular presentations.” Remove the duplicate theorem from this package’s target list and add the exact supplier section.

12. **F12** (P2) The perfectoid parameter lacks its primitive-root hypothesis

   Location: `packages/HabiroCohomologyFoundations/README.md:2349`, “containing p-power roots with chosen ε”; also §§8.6 and 8.18.

   Claim: the unspecified choice ε gives q=[ε], ξ=φ⁻¹([p]_q), ker θ=(ξ), and faithful flatness of ℤ_p[[h]]→A_inf.

   Witness: choose ε=(1,1,…). Then q=1, h=0 and ξ=p. But θ(p)=p≠0 in O_C, so p cannot generate ker θ. BS line 4404 specifies compatible primitive roots.

   Exact repair text: “Choose primitive pⁿ-th roots ζ_{pⁿ} for every n≥1, with ζ_{pⁿ⁺¹}^p=ζ_{pⁿ}, and set ε=(1,ζ_p,ζ_{p²},…)∈O_C^♭. This same choice is used in §§8.2, 8.6, 8.18 and 8.19.” Add the trivial compatible system as a negative-control Check: it does not define the asserted prism parameter.

13. **F13** (P3) The named sources have no required source registry

   Location: `packages/HabiroCohomologyFoundations/README.md:2546`, References, and the absent `packages/HabiroCohomologyFoundations/sources.toml`.

   Claim: thirteen cited works, including four separately identified Stacks pages, support the package without the required recorded source provenance.

   Witness: the package contains no sources.toml. All thirteen works were legally obtainable in this pass; none requires a paywall waiver. The README fixes versions but records no fetched source hashes or statuses.

   Exact repair text: add `sources.toml` with schema `tauceti-roadmap-sources/v1`, one record for each cited work/page, preserving QH v2, QW v5, KU v1, TC v4, GSWZ v2, Pridham v4, BS v4, Bhatt v1, BMS1 v3, BMS2 v2, Sch v1, DAG VIII (5 November 2011), and Stacks tags 091N, 03OY, 06WT, 00NV. Populate authors, title, year, exact locators, cited_for and the source service’s URL, fetch URL/date, hash, licence and status. No machine paths belong in that file.

14. **F14** (P1) The p-local product takes a derived tensor over the wrong ring

   Location: `packages/HabiroCohomologyFoundations/README.md:1119`, “qW_{p^a}Ω⊗_{A[q],ψ^d;q↦q^d}A_(p)[q]/Φ_d(q^{p^a})”; compare the derived-tensor convention at :102.

   Claim: this tensor gives the p-local q-Witt complex, even for the single prime-power factor.

   Witness: A=R=ℤ, p=m=2, a=1, n=d=1. The proposed derived self-tensor over ℤ[q] has Tor₁=ℤ_(2)[q]/(q²−1); the left side is concentrated in degree zero.

   Exact repair text: “Import QWittVectors §9.7 `QWitt.differential_pLocalDecomposition`. Put C_a=A[q]/(q^{p^a}−1). The displayed product uses ordinary degreewise tensor over C_a, along a↦ψ_d(a), q↦q^d. For perfectly covered A these scalar maps are flat, so those tensors also agree with derived tensors over C_a. They are not derived tensors over A[q].” Add the n=1 self-tensor as a negative-control Check.

15. **F15** (P1) Equality of smooth graded forms does not identify the uncompleted filtration

   Location: `packages/HabiroCohomologyFoundations/README.md:1225`, “Thus the animated stupid filtration is the stupid filtration of the underived qW_mΩ complex”.

   Claim: the smooth associated-graded comparison upgrades to equality of the entire filtered complexes before completion.

   Witness: A=ℚ, S=ℚ×ℚ, m=1. Polynomial animation and the rational Poincaré lemma give dR_{S/ℚ}≃ℚ, while Ω*_{S/ℚ}=ℚ×ℚ. QH line 1781 identifies graded forms only; QH lines 978–989 explicitly distinguish these complexes.

   Exact repair text: “For smooth S, identify qW_m dRⁱ with the underived form module qW_mΩⁱ, hence grⁱ≃qW_mΩⁱ[−i]. This identifies the associated graded, not the entire uncompleted filtered complex. Preserve the completion hypotheses of each comparison.” Add: “At A=ℚ, S=ℚ×ℚ, m=1, the first derived Hodge step is fib(ℚ→ℚ×ℚ)≃ℚ[−1], while the first stupid step of the ordinary complex is zero.”

16. **F16** (P1) The derived-commutative upgrade imports a carrier its supplier does not provide

   Location: `packages/HabiroCohomologyFoundations/README.md:590`, “Import the enhanced fact that the relevant limits and colimits are computed on underlying E∞-objects.”

   Claim: EnhancedDerivedSheaves E5 supplies the derived-commutative category and forgetful-functor theorem needed for qOmegaDAlg and the later filtered upgrades.

   Witness: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1937` supplies simplicial animated rings; :1996 supplies their connective E∞ comparison. Neither is Raksit’s unbounded derived-commutative category. QH line 3493 explicitly invokes Raksit Proposition 4.2.27 for this step.

   Exact repair text: “The unbounded category DAlg_B of derived commutative B-algebras and its conservative forgetful functor to CAlg(D(B)), creating limits and colimits, are a separate required supplier contract; animated rings alone do not supply this.” Assign that precise contract to an earlier owner using matching README/plan gap declarations, or construct it before §1.18. Separately declare the filtered/graded refinements required by §§3.18, 3.30 and 4.23; do not silently identify DAlg with E∞-algebras or connective animated rings.

17. **F17** (P1) The fully faithful pushout input is not an E0 target

   Location: `packages/HabiroCohomologyFoundations/README.md:1946`, “use E0's fully faithful pushout interface”; also the supplier table at :32.

   Claim: EnhancedDerivedSheaves E0 already supplies preservation of full faithfulness under categorical pushout.

   Witness: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:213` supplies generic coherent limits/colimits; :230 concerns pushouts in stable categories. Neither provides pushouts preserving fully faithful functors in Cat∞, invoked separately at QH line 2587.

   Exact repair text: “For §5.6, require the theorem that a pushout of a fully faithful functor in Cat∞ is fully faithful.” Cite an actual earlier target for this statement, declare a precise EnhancedDerivedSheaves supplier gap, or own the needed categorical theorem here before the dimension-gluing proof. Keep the additional localization adjunction and cross-component mapping-space argument from QH Lemma 4.9; set union is not its replacement.

18. **F18** (P2) Construction order still contains forward edges and a layer cycle

   Location: `packages/HabiroCohomologyFoundations/README.md:1366`, “After §4.17”; also :1192, :1246, :1644 and :1673.

   Claim: Layer 3 is completed before Layer 4, and the subsection dependencies specify construction stages.

   Witness: §3.31.compare needs §4.17 while Layer 4 needs Layer 3. Within layers, §3.17’s animated conclusion needs §3.18; §3.20’s comparison needs §§3.22–3.28; §4.18 uses §4.20; §4.21 uses §4.22.

   Exact repair text: move `FramedHabiroKoszul.compare` to Layer 4 after the framed-pair and Habiro-descent constructions, leaving the independent complex in Layer 3. Move the animation definition before the animated deformation conclusion and the Nygaard comparison after both filtrations and their comparison proof. Construct the ascending q-Witt filtration before proving strong monoidality, and the smooth-completion comparison before the étale identification. Replace the corresponding blanket HQ dependencies by these exact subsection/target edges.

19. **F19** (P3) Some definition Checks restate axioms or fail at the zero ring

   Location: `packages/HabiroCohomologyFoundations/README.md:1216`, the Checks for qWittDR; also :1248 and :1281.

   Claim: the listed groups provide at least three discriminating tests of each definition, including the asserted nonzero Verschiebung class for S=A.

   Witness: §3.18’s first three Checks repeat `one`, `ofPolynomial` and `gr_hodgeWittFil`; §3.22’s first two repeat its zeroth/preimage specifications. At A=S=0, the claimed nonzero [p]_q at :1221 and :1252 is zero.

   Exact repair text: specialize the nonzero Nygaard/stupid comparison to A=S=ℤ. For qWittDR add the explicit m=1, S=ℚ×ℚ noncomplete filtration from R15, the m=p, S=A=ℤ graded computation, and a polynomial degree-one form with its explicit shift. For prismatic Nygaard keep the perfectoid-quotient calculation and add A=S=ℤ: N⁰=B, N¹=Φ_pB, N²=Φ_p²B on the Frobenius-twisted degree-zero B=ℤ_p[[h]], with the Frobenius map specified. Count actual examples and negative controls, not repetitions of a definition.

20. **F20** (P3) Native Checks are not all mirrored by proved examples

   Location: `packages/HabiroCohomologyFoundations/README.md:2294`, “qDiff 1 X=1”; also :838, the exact value −1.

   Claim: the statable native Checks are represented in Suggested.lean.

   Witness: Suggested.lean:57 checks a characteristic-two derivative of X² but never qDiff 1 X=1. At :160 it proves coefficientRelation evaluates nonzero at (2,2,1), not the stated signed value −1.

   Exact repair text: extend the existing qDiff example block with `qDiff (1 : ℤ) (X : ℤ[X]) = 1`, and strengthen the existing coefficientRelation negative example to `MvPolynomial.eval (![2,2,1] : Fin 3 → ℤ) (coefficientRelation 2) = -1`. Prove both directly from the kept definitions; retain at most two example blocks per definition.

21. **F21** (P3) The two final examples test library objects without a roadmap definition

   Location: `packages/HabiroCohomologyFoundations/Suggested.lean:212` and :220, the cyclotomic and sign examples.

   Claim: these are admissible examples under the file’s own-definition-only rule.

   Witness: both statements and proofs mention only Polynomial, cyclotomic, ring constants and evaluation. Neither refers to any of the five kept definitions; `cyclotomic_prime_decomposition` is a theorem, not a definition.

   Exact repair text: re-express the coefficient/sign tests through `qDiff` and `qHodgeDiff`, folding them into those definitions’ existing example blocks. For example, at q=2 over ℤ verify that evaluation at X=1 of `qDiff 2 (X^2)` is 3 and of `qHodgeDiff 2 X` is 1, so their difference is 2 and their sum is 4. Use the polynomial coefficient ring for the full cyclotomic identities. Remove the two standalone library-only examples; do not introduce a dummy definition to retain them.

22. **F22** (P2) Étale extension is stated for arbitrary differential graded algebras

   Location: `packages/HabiroCohomologyFoundations/README.md:1103`, “For a nonnegatively graded differential A[q]-algebra P”.

   Claim: étale extension of degree zero always gives a compatible DGA structure on the left-module tensor product.

   Witness: put B=ℤ[q,x], P⁰=B, P¹=Bu, u²=d=0 and ub=b(q,0)u. For S=B[x⁻¹], S⊗_B P¹=Su≠0, but a compatible multiplication forces u=(ux)x⁻¹=0.

   Exact repair text: “Import QWittVectors §7.7 `QWitt.differential_etaleDifferential` for P=qW_mΩ.” If displaying the generic input for reference, specify nonnegative graded-commutative, strictly odd-alternating DGAs, with degree-zero ring central; these are the hypotheses of the generic input declared by that supplier. The sibling’s §7.7 negative control at `TauCetiRoadmap/QWittVectors/README.md:972` explicitly distinguishes this from the false associative-DGA version.

23. **F23** (P3) Swapping the two weights does not fail the stated Check

   Location: `packages/HabiroCohomologyFoundations/README.md:834`, “with the degrees of β and t exchanged, fails this”.

   Claim: the identity βt=q−1 with q=1+βt detects interchanging the degrees +1 and −1.

   Witness: after assigning deg β=−1 and deg t=+1, βt still has degree zero, and βt=q−1 is unchanged. Both gradings satisfy the stated identity.

   Exact repair text: “Over ℤ, with variable weights (0,1,−1), β has degree +1 and t has degree −1. Exchanging the weights fails these individual degree assertions, although the relation remains homogeneous of degree zero.” Include the individual weighted-degree tests in an existing `coefficientRelation` example, together with its relation evaluation; keep the two-example limit and do not introduce a dummy definition.

## Verified sound

Read all **2558 README lines** and **226 Lean lines**, plus both repository rule files. Inventory: **151 numbered target subsections**, **314 named API entries (313 distinct names)**, and **24 Lean declarations: 5 definitions, 7 theorem targets, 12 examples**. All **222 Check bullets in 54 groups** were read and assessed against their formulas, hypotheses and negative controls; the table records the boundary tests and their limits. The twelve Lean examples were inspected, not executed. No Lean command or build was run.

Checked **225 distinct numbered source anchors** in the fixed versions, counting repeated citations and subclauses once; inspected the additional broad section references. All **13 cited works** were legally obtained, in **16 source-service records** because Stacks has four separate pages. This verifies locator positions, not every new extension of a source theorem. The defects where the cited statement does not support the package are reported above.

Searched all **six supplied sibling heads** for overlapping objects and supplier names. Directly compared **27 QWittVectors section contracts**: §1.7, §§2.1–2.4, §§4.2–4.4, §§5.1–5.2, §§6.1–6.3, §§7.1–7.7, §§8.1–8.3, §§9.6–9.7 and §§10.1–10.2. Checked the main-branch EnhancedDerivedSheaves E0/E1/E5 and DerivedModuleAlgebra §0.K.1 inputs used in the findings. Keyword searches of the other five heads produced no additional overlapping target requiring a finding.

The seven native theorem types have the required ring and prime instances in their own mathematical types. The zero ring, exponent zero, rank zero, negative Laurent exponents and characteristic-two specializations give no counterexample to them. No forced cohomology carrier, sorry-defined data, `set_option`, extra import, `lemma`, admitted example or `True` placeholder occurs in Suggested.lean. No additional easy missing headline was established from the inspected pinned carriers. The enhanced headlines need their planned carriers and appropriately remain in the README.

Pinned object checks include `geom_sum_mul` (`Mathlib/Algebra/Ring/GeomSum.lean:232`), `Polynomial.cyclotomic_prime` (`Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:366`), `Polynomial.eval_one_cyclotomic_prime` (`Mathlib/RingTheory/Polynomial/Cyclotomic/Eval.lean:32`), `AddMonoidAlgebra.lift` (`Mathlib/Algebra/MonoidAlgebra/Basic.lean:597`), `MvPolynomial.IsWeightedHomogeneous` (`Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean:122`), `KaehlerDifferential.D` (`Mathlib/RingTheory/Kaehler/Basic.lean:226`), `Algebra.Etale` (`Mathlib/RingTheory/Etale/Basic.lean:205`), `Algebra.Smooth` (`Mathlib/RingTheory/Smooth/Basic.lean:539`), and `TauCeti.torusCharacter` (`TauCeti/LinearAlgebra/Basis/DiagonalTorus/Basic.lean:102`). These were read at the manifest revisions in R01. The generic character evaluation does not itself construct the proposed coherent torus module descent.

The source misprints explicitly corrected by the package were checked: dF=nFd in QW Lemma 3.7; the positive prime-power exponent boundary in QH Corollary 3.25; and the truncation adjunction direction in QH Lemma 4.2. The noncompleted rational corner in §5.26 is necessary: polynomial animation over ℚ gives dR_{0/ℚ}=ℚ, so the source's rational-vanishing shortcut cannot be used. The package retains that corner. GSWZ's finite-projective rank claim has support at GSWZ line 283; it is not an additional finding.

| Source | Numbered anchors checked | Representative extraction locator |
|---|---:|---|
| QH v2 | 124 | QH line 1781; QH line 3493 |
| QW v5 | 39 | QW line 1822; QW line 3645 |
| Stacks, four tags | 6 | Stacks091N line 12101; Stacks03OY line 1174; Stacks06WT line 953; Stacks00NV line 8610 |
| Sch v1 | 6 | Sch line 766 |
| DAG VIII, 5 November 2011 | 12 | DAGVIII line 3089; DAGVIII line 3283 |
| Pridham v4 | 2 | Pridham line 285; Pridham line 386 |
| TC v4 | 8 | TC line 173; TC line 1370; TC line 1643 |
| GSWZ v2 | 1 | GSWZ line 260; additionally §5.2 at GSWZ line 3292 |
| BS v4 | 16 | BS line 4013; BS line 4148; BS line 4404 |
| BMS1 v3 | 5 | BMS1 line 2356; BMS1 line 5752 |
| BMS2 v2 | 2 | BMS2 line 252; BMS2 line 1348 |
| Bhatt v1 | 3 | Bhatt line 1548; Bhatt line 1571; Bhatt line 1598 |
| KU v1 | 1 | KU line 292 |

The mechanical dependency check returned exit status 1 with exactly:

```text
NOT IN ORDER: HabiroCohomologyFoundations (insert it after its last supplier)
CYCLE among: HabiroCohomologyFoundations, QWittVectors
depcheck: 7 roadmaps, 51 edges, 2 problem(s)
```

The exact line `CYCLE among: HabiroCohomologyFoundations, QWittVectors` is a false positive from downstream-consumer mentions. `TauCetiRoadmap/QWittVectors/README.md:1281` identifies HabiroCohomologyFoundations as a consumer; :1286 and :1288 expressly exclude a reverse prerequisite. No QWittVectors Needs line consumes this package. The NOT IN ORDER line is not used as a finding under the supplied intake rule. No UPWARD line was printed. The internal target-order defects are R18; the unowned analytic input is R08.

The requested `git diff --stat origin/main...HEAD` shows four changed files, all inside `packages/HabiroCohomologyFoundations/`: README.md (2558 lines), Suggested.lean (226), metadata.toml (1), review.json (8); total 2793 insertions. The review changed no tracked file. The only board addition is this report.

**Lean declaration and adversarial inventory.**

All Lean rows refer to `packages/HabiroCohomologyFoundations/Suggested.lean`. The sole universe is `u`; the namespace is `TauCetiRoadmap.HabiroCohomologyFoundations`. The mathematical checks below do not certify elaboration. Section parameters absent from a declaration type are identified explicitly.

| Line | Section and declaration | Variable / instance context | Instances tried | Result / change |
|---:|---|---|---|---|
| 40 | Jackson; def qDiff | {A : Type u} [CommRing A]; q:A, f:A[X] | n=0,1,2; A=0; q=0,1,2 | Coefficient formula defined without division |
| 46 | Jackson; theorem jackson_calculus | Same A; q:A; f,g:A[X] | f=1,x,x²; g=x; q=1 over 𝔽₂ | All three identities true in these cases; product rule has correct order |
| 53 | Jackson; example | Same A; q,a:A | Constant polynomial, including a=0 | Statement and displayed proof consistent |
| 57 | Jackson; example | No generic A; ℤ and ZMod 2 | x³ at 2; x² at 2 and at 1 mod 2 | 7x²,3x,0; R20 adds missing x-at-1 test |
| 68 | Jackson; def uniformDenominator | n:ℕ only; A and its instance are unused and absent | n=0,1,2,3 | 1,1,64,2^14·3^26 |
| 74 | Jackson; theorem uniformDenominator_pos | n:ℕ only | Empty product and n=2 | Positive prime-power factors; no lost ring hypothesis |
| 77 | Jackson; example | No variables | n=0,1 | Both values 1 |
| 80 | Jackson; example | No variables | n=2,3 | Both displayed values correct |
| 93 | Torus; def torusScaleHom | {B : Type u} [CommRing B] {d:ℕ}; q:Bˣ; a:Fin d→ℤ | d=0; q=1; negative coordinate | Unit parameter permits all integer powers |
| 105 | Torus; theorem torusScaleHom_action | Same B,d; q:Bˣ; a,b quantified in type | a=0; b=−a; d=0 | Identity and composition follow on monomials |
| 116 | Torus; theorem torusScale_exists_unique | Same B,d; q:Bˣ; a:Fin d→ℤ | d=0; B=0; a=−1 in rank 1 | Inverse is scaling by −a; basis fixes algebra homomorphism |
| 124 | Torus; example | {B : Type u} [CommRing B]; q:Bˣ; dimensions 1 and 2 explicit | Exponent −1; dot product 2(−1)+(−1)3 | q⁻¹ and q⁻⁵ |
| 131 | Torus; example | Same B; {d:ℕ} appears in second conjunct; q:Bˣ,b:B | d=0 in first conjunct; q=1 in second | Both scalings identity on displayed monomials |
| 149 | FilteredCoefficients; def coefficientRelation | {A : Type u} [CommRing A]; m:ℕ | m=0,1,2; A=0 | Polynomial relation well-defined, with correct sign |
| 155 | FilteredCoefficients; theorem coefficientRelation_eval | Same A; m:ℕ; q,β,t:A | m=0; βt=0; (2,3,1) and (2,2,1) | Iff is true by evaluating the polynomial |
| 160 | FilteredCoefficients; example | No generic A; coefficient ring ℤ | m=2 at the two triples | 0 and −1; strengthen second statement as R20 |
| 166 | FilteredCoefficients; example | No generic A; coefficient ring ℤ | m=1 at (2,1,1); m=0 at (2,0,0) | Both zero; m=0 is excluded only from the cohomological construction |
| 182 | QHodgePolynomial; def qHodgeDiff | {A : Type u} [CommRing A]; q:A; f:A[X] | q=1; f=constant; A=0 | h times qDiff, with no division |
| 186 | QHodgePolynomial; theorem qHodge_polynomial | Same A; q:A; n:ℕ; f:A[X] | n=0,1,2; q=0,1,2; characteristic 2 | Monomial coefficient q^n−1 and zero specialization correct |
| 191 | QHodgePolynomial; example | Same A; f:A[X]; q,a:A | q=1 and constant input | Both zero |
| 195 | QHodgePolynomial; example | No generic A; coefficient ring ℤ | q=2; f=x² | 3x |
| 207 | Layer 8; theorem cyclotomic_prime_decomposition | p:ℕ; [Fact p.Prime] explicitly in declaration | p=2,3; evaluation at 1 | u=1 and u=X; prime hypothesis retained |
| 212 | Layer 8; example | No variables; ℤ and ZMod 2 | p=2,3; Φ₁=Φ₂ mod 2 | Identities true; inadmissible library-only example, R21 |
| 220 | Layer 8; example | No variables; ℤ[X] | q=2; sign reversed | Correct side 2; reversed sign gives 4; R21 |

**README adversarial inventory.**

Section identifiers refer to `packages/HabiroCohomologyFoundations/README.md`. Each subsection includes its named subtargets counted above. “Consistent” records only the listed calculation, source specialization or domain check; it is not a proof of the planned theorem. U means an enhanced supplier interface could not be certified from the supplied checkouts; I means an explicitly open implementation target. A dash means no change from this row, not approval of its other dependencies. R02 applies to every obsolete QW supplier label.

| Statement section | Instances tried | Result | Change / limitation |
|---|---|---|---|
| 0.1 | A=0; M=0; h-invertible module; unit ideal | Completion kills the last case; idempotence consistent | — |
| 0.2 | m=1,2; A=𝔽₂; repeated cyclotomic supports | Overlaps cannot be treated as disjoint; source retains them | R02 |
| 0.3 | Identity étale map; finite étale quadratic input; completion at h | Adams twist and completed Frobenius retained | R02 |
| 1.1 | A=ℤ,0; polynomial rank 0 | Local input specialization consistent | R03; U |
| 1.2 | Constants; x²; q=1 over 𝔽₂ | D_q(x²)=(1+q)x; no cancellation assumption needed | R03 |
| 1.3 | R=A; R=𝔽₂ over ℤ₂ | PD quotient has nonzero 2-torsion; not ℤ₂ | U |
| 1.4 | R=A; p-completion before/after rationalization | Order of operations matters and is retained | U |
| 1.5 | n=0,1; p=2,3 | Zero iterate and denominators consistent with A.5 | U |
| 1.6 | First divided power; p=2 | Coefficient p and h-power both required | U |
| 1.7 | First inverse expansion; p=2 | Inverse denominator differs from forward one | U |
| 1.8 | n=0,1,2,3 | 1,1,64,2^14·3^26 | — |
| 1.9 | Empty sequence; one operator; identity twist | Complex unchanged with required commutation | U |
| 1.10 | Polynomial rank 0,1; rational coefficients | Framed comparison specializes consistently | U |
| 1.11 | Identical framings; composite frame changes | Identity and cocycle diagrams have matching domains | U |
| 1.12 | R=A; A=ℚ; A=0 | Rational corner survives; zero base is harmless | U |
| 1.13 | q=1; fixed p; A=ℚ | De Rham, prismatic and rational corners have correct completions | U |
| 1.14 | Rank 0 framing; one variable | Framed differential matches the global source theorem | R03; U |
| 1.15 | Identity base change; A→A×A | Completed coefficient extension has expected unit/product cases | U |
| 1.16 | Equal frames; three equal frames | Identity and cocycle specializations consistent | U |
| 1.17 | P=S=A; polynomial presentation | Čech augmentation and PD totalization have correct direction | R16; U |
| 1.18 | R=A; polynomial rank 1 | Degree-zero case does not supply the general DAlg carrier | R16 |
| 1.19 | Identity cover; affine étale localization | Ordinary sheaf statement supports degreewise limit passage | U |
| 1.20 | Constant Čech cover; repeated frame | Coherence required, not just equality in a homotopy category | U |
| 1.21 | Affine identity open; empty scheme | Expected affine value and terminal empty value | U |
| 1.22 | Rank 0; q=1; zero module | Ordinary connection at q=1, no operators at rank 0 | U |
| 1.23 | d=0,1,2; q=1; exponent −1 and dot product −5 | All four stated values correct | — |
| 1.24 | q=1; zero module; trivial lattice action | Semilinear automorphisms remain extra data at q=1 | U |
| 1.25 | Rank 0; identity equivariance | Quotient is the affine base; infinite-lattice descent still needed | U |
| 1.26 | Zero complex; shifted module; trivial action | Homotopy-coherent action cannot be replaced by a finite tuple of maps | U |
| 1.27 | Rank 0; trivial action of ℤ | Quotient retains stabilizers; coarse orbit space would fail | U |
| 1.28 | Zero module; free rank 1; a shifted free module | Heart, vector bundles and perfect complexes remain distinct | U |
| 2.1 | Zero map on ℤ/2; unit element; zero object | Derived quotient retains the degree −1 kernel | U |
| 2.2 | m=0,1,2; (q,β,t)=(2,3,1),(2,2,1) | Evaluations 0,−1; weight-swap Check does not distinguish conventions | R20,R23 |
| 2.3 | F^i=h^iA[[h]]; i=0,1,2 | Degree-one quotient is A only at step 0 | U |
| 2.4 | Polynomial input; zero ℚ-algebra | Animation can be nonzero on zero algebra | R16; U |
| 2.5 | ℚ→ℚ×ℚ; R=𝔽₂ over ℤ₂ | Uncompleted animation differs from smooth ordinary complex | U |
| 2.6 | Identity extension; A→A×A | Base change needs its displayed completion | U |
| 2.7 | R=A; first two filtration steps | h-adic filtration recovered on constants | U |
| 2.8 | A=ℚ; zero ℚ-algebra | Non-Hodge-completed rational complex retained | U |
| 2.9 | R=A=ℤ; rationalize before/after p-completion | ℚ_p versus 0 distinguishes the operations | U |
| 2.10 | Same base example ℤ; first filtration step | Local rational clause is not the global clause alone | U |
| 2.11 | h-torsion class; zero map on ℤ/2 | Lη and derived quotient are not ordinary cokernels | U |
| 3.1 | Zero family; V_n=0 for n>1; degree-one ghost | Missing degree-zero V square changes initiality | R03,R04 |
| 3.2 | m=1; p=2; degree-one Teichmüller form | Corrected dF=nFd, not the source misprint with V | R03 |
| 3.3 | Terminal zero family; initial system at m=2 | Restriction obstruction is not universal over all systems | R05 |
| 3.4 | m=1; A=R=ℤ; zero ring | Expected ordinary de Rham and coefficient ring cases | R03,R04 |
| 3.5 | m=1; F₂(dτ₂(x)) | F₁=id and x·dx normalization consistent | R03 |
| 3.6 | a=0; R=A; relative scalar differentials | Relative factorization is acknowledged but not supplied | R09 |
| 3.7 | A=R=ℤ,m=2; degree-one V₂(dx) | Ghost image parity; degree-one factor 4 | R03 |
| 3.8 | Noncentral square-zero DGA; invert x | Compatible multiplication impossible after stated tensor | R22 |
| 3.9 | Identity étale map; invert a polynomial variable | Differential must extend to d(x⁻¹)=−x⁻²dx | R03 |
| 3.10 | A=R=ℤ,p=m=2,n=1 | Extra Tor₁ in displayed derived tensor | R14 |
| 3.11 | Relative dimension 0; m=1; p=2 | Smooth torsion and completed comparisons have earlier owner | R03 |
| 3.12 | m=N=1; m=2,N=6 | Empty prime product and extra prime factor consistent | U |
| 3.13 | R=A; degree-one form; a=1 | Frobenius scaling differs by the form degree | U |
| 3.14 | One variable; smooth category versus chosen pairs | Nonexistence statement keeps functoriality, not objectwise nonexistence | — |
| 3.15 | m=1; one prime power; identity Adams twist | Twist 1 and completed tensor order consistent | U |
| 3.16 | m=1; prime dividing or not dividing m | Rational and primewise corners match specified twists | U |
| 3.17 | m=1; smooth and animated inputs | Animated conclusion precedes its definition | R18 |
| 3.18 | Polynomial input; ℚ×ℚ; zero ring | Restated Checks; zero-ring nonzero claim fails | R15,R19 |
| 3.19 | A=ℚ,S=ℚ×ℚ,m=1 | Underlying complexes ℚ and ℚ×ℚ differ | R15 |
| 3.20 | a=1; n=0,1,2; A=S=ℤ and 0 | First steps im V,p·im V; zero-ring claim fails | R18,R19 |
| 3.21 | n=0,1; coefficient input | Pullback comparison preserves the divided Frobenius direction | U |
| 3.22 | A=S=ℤ; n=0,1,2 | Relative-twisted coefficient Nygaard powers distinguish steps | R19; U |
| 3.23 | n=0,1; p=2 | Divided Frobenius target and degree shift match source | U |
| 3.24 | p=2; i=0; a=1 | Kernel formula keeps coefficient hypotheses | U |
| 3.25 | a=1, p=2; attempted a=0 | Package correctly excludes source boundary misprint | U |
| 3.26 | Polynomial input; p-completion; identity cover | Underived agreement is limited to the stated completion | U |
| 3.27 | a=1; lowest filtration steps | Degree-one filtered quotient retained | U |
| 3.28 | a=1; smooth versus animated | Comparison needs both already-defined filtrations | R18; U |
| 3.29 | A=S=ℤ; invert p after completion | V-image dies in the designated cyclotomic rational corner | U |
| 3.30 | E₀ versus E∞ input | Transport does not construct missing commutative data | R16 |
| 3.31 | No coordinates; one Laurent coordinate; m=1 | Complex valid in basic cases; comparison depends on later descent | R18 |
| 4.1 | A=ℚ; R=A=ℤ; first and second filtration step | Naive preimage has hB in step 2 rather than h²B | U |
| 4.2 | Nonsmooth source witness; restriction to smooth algebras | Essential-surjectivity and section obstructions conflated | R06 |
| 4.3 | p=2; α=1 in free δ-ring quotient | q-divided-power obstruction persists at the smallest prime | — |
| 4.4 | Base pair; constant filtration; zero object | Modification of constant filtration completes to zero | U |
| 4.5 | Tensor unit; zero factor; chosen E_n data | Monoidality is on pairs with the specified structure | U |
| 4.6 | Base pair; polynomial degree-one form | Ascending conjugate filtration retains form shift | U |
| 4.7 | One generator; first two graded steps | β and t degrees give stated opposite filtrations | U |
| 4.8 | One variable; q=1; p=2 | hD_q specializes to zero; stronger multiplication is not automatic | R03; U |
| 4.9 | a=0,1,2; coefficient input | Recursion starts at untwisted pair; indices consistent | U |
| 4.10 | Base pair; invert p after completion | Combined Hodge/cyclotomic filtration has expected powers | U |
| 4.11 | a=1; lower point q=1 | Successive twists have the stated lower-point completion | U |
| 4.12 | m=1; one-prime index; rational base | Fracture uses coherent transitions, not arbitrary arrows | U |
| 4.13 | m=1; polynomial degree-one form | Filtered quotient gives stupid filtration with shift | U |
| 4.14 | m=1; coefficient pair; constant filtration | Modification colimit precedes completion | U |
| 4.15 | A=S=ℤ; divide by Φ_p versus q^p−1 | First recovers qΩ; second completes to zero | U |
| 4.16 | Identity divisor; m divides itself | Transition and completion unit consistent | U |
| 4.17 | R=A; zero object; factorial transitions | Underlying descent is well-formed subject to inputs | U |
| 4.18 | Tensor unit; degree-one filtration | Proof refers forward to q-Witt filtration | R18 |
| 4.19 | Base pair; m=1 | Factorization preserves chosen-pair domain | U |
| 4.20 | m=1; degree-one form; zero module | Ascending filtration indexing matches shifted forms | R18; U |
| 4.21 | R=A; étale quadratic ring; m=1 | Static coefficient result needs later smooth-completion comparison | R18 |
| 4.22 | A=ℚ,S=ℚ×ℚ; ℤ[x] | Completion, not equality of raw complexes; décalage direction correct here | U |
| 4.23 | E₀ versus E∞ pair; derived commutative lift | Input structure explicitly required, carrier still unowned | R16 |
| 4.24 | m=1; constants; polynomial degree-one Bockstein | Differential from Bockstein, not merely graded modules | U |
| 4.25 | Identity; A→A×A; base h-adic pair | Dualizability supplies limit exchange; flatness alone would not | U |
| 4.26 | Identity finite-projective map; diagonal map | Special cases do not supply the missing coherent theorem | R09 |
| 4.27 | Identity; rank-two product extension | Export depends on undeclared contracts in preceding target | R09 |
| 4.28 | Finite étale arithmetic input; powerful m=4 | Algebraic, trace and ordinary-number-field outputs remain distinct | R09 |
| 5.1 | n=0,1; zero object; relative dimension 0 | Adjunction direction corrected relative to source wording | — |
| 5.2 | Relative dimension 0,1,2 | Prime bound nonvacuous first at dimension 2 | — |
| 5.3 | n=0,1,2; p=2 | Smoothness and prime inversion retained | — |
| 5.4 | Identity frame; one polynomial coordinate | Coordinate filtration agrees in admissible dimension | — |
| 5.5 | Relative dimension 0; p=2 | p-complete comparison retains its frame and truncation | U |
| 5.6 | n=0,1; mixed-component maps | Generic stable pushouts do not supply the categorical theorem | R17 |
| 5.7 | Two identical bounds; adjacent bounds | Coherent overlap theorem required before gluing | R17 |
| 5.8 | A=ℤ; relative dimension 0,1,2 | Allowed curve range includes p=2; surface requires 2 inverted | — |
| 5.9 | Unit; two curves; zero factors | Tensor product can leave admissible dimension range | — |
| 5.10 | n=0; unit; fixed admissible tensor | Truncation monoidality matches source domain | — |
| 5.11 | Unit map; admissible input/output dimensions | Cartesian-lift requirement retained | — |
| 5.12 | Two relative curves over ℤ | Product is a surface requiring inversion of 2 | — |
| 5.13 | Spec(ℤ×ℤ[1/2][x,y]); empty scheme | Local admissibility does not imply globally admissible affine algebra | R07 |
| 5.14 | Point; smooth proper curve; dimension 2 | Properness plus smoothness retained; source status is open | I |
| 5.15 | Empty regular sequence; unit ideal; regular versus weakly regular | Regular-to-Koszul step already owned on main | R11 |
| 5.16 | Empty sequence; perfect base; regular quotient | Staticity range not arbitrary singular rings | U |
| 5.17 | Base ring; quotient by x versus x² | Preimage construction alone does not give a q-deformation | — |
| 5.18 | Zero ideal; first filtration step; p=2 | Injectivity is distinguished from surjectivity | — |
| 5.19 | α=2,p=2; α=1 negative control | Higher-power restriction essential; no good-prime exclusion | — |
| 5.20 | α=1 in free δ-ring example | Obstruction distinguishes this case from α≥2 | — |
| 5.21 | Identity flat map; perfect cover | Flatness is used for preimages, not arbitrary limit exchange | U |
| 5.22 | Empty regular sequence; rational base; quasi-regular input | Construction domain and local-to-global order retained | U |
| 5.23 | Unit; disjoint regular generators; excluded tensor products | Partial operad avoids global tensor closure claim | — |
| 5.24 | Chosen filtration versus bare smooth algebra | Uniqueness does not erase the extra input | — |
| 5.25 | Finite étale point; discriminant localization | No regulator/class identification inferred from coefficient equality | — |
| 5.26 | m=1,4,9; p=2,α=2; zero rational algebra | Rational ℚ[[h]] corner retained; h-completed modification kills constant corner | — |
| 6.1 | Finite étale point; dimension-2 affine space; localized base | Comparison domain cannot be formed from unspecified analytic coefficients | R08 |
| 6.2 | p=2; q=1; cyclotomic specialization | Open problem does not establish a comparison | R08 |
| 6.3 | Bounded-below versus unbounded solid objects | B.8 supplies only bounded-below tensor compatibility | R08 |
| 7.1 | Point; line; finite étale arithmetic ring | Examples keep coordinate and coefficient hypotheses | — |
| 7.2 | q=1 over ℤ and 𝔽₂; constants; q=2 | Native Check mirror incomplete | R20 |
| 8.1 | ℤ[x]; base pair; identity comparison | One atlas entry reverses the décalage placement | R10 |
| 8.2 | p=2,3; trivial compatible roots | Cyclotomic identities correct; primitive-root requirement missing | R12 |
| 8.3 | Smooth input; non-Cartier input; bounded prism | Domains distinguish AΩ and q-de Rham bases | U |
| 8.4 | R=A; identity base map; p=2 | p-completed square consistent with source | U |
| 8.5 | Identity frame; two equal frames | Framed q-crystalline direction and completion consistent | U |
| 8.6 | Primitive ε versus ε=1 | θ-kernel and faithful-flatness assertions need primitive ε | R12; U |
| 8.7 | ℤ[x]; first h-torsion class | Lη_h(qHdg)≃qΩ direction correct | R10 affects atlas only |
| 8.8 | Coefficient input; relative Frobenius | Lη at prism ideal distinguished from Lη_h | U |
| 8.9 | Smooth choice versus functorial choice | Filtration obstruction not a proof of comparison failure | — |
| 8.10 | a=1; first Nygaard step | Independent Frobenius construction must precede comparison | U |
| 8.11 | m=1; m=p; relative dimension 0 | Ordinary Witt comparison is a map with separate completion hypotheses | R09; U |
| 8.12 | q=1; ℤ[x]; h-torsion in degree 1 | Derived reduction recovers classes missed by H⁰/h | — |
| 8.13 | Identity coefficient maps; equal frames | Eight-square commutation is separate coherent target | U |
| 8.14 | Invert p; h-completion; ε=1 | Loss of information retained; root choice still deficient | R12 |
| 8.15 | Perfect prism coefficient; n=0,1 | Independent prismatic Nygaard input required | U |
| 8.16 | Point; polynomial line; p=2 | Source specializations retain coefficient assumptions | U |
| 8.17 | Native coefficient rings versus enhanced cohomology | No artificial Lean carrier introduced | U |
| 8.18 | ε=1; primitive ε; identity base scheme | Canonical θ compatibility requires the fixed primitive system | R12; U |
| 8.19 | Coefficient scheme; primitive ε; Witt specialization | Common normalization needs primitive-system correction | R12; U |

## Not verifiable

- The supplied main/completed and revision checkouts did not expose the current owner texts for DerivedDeRhamCohomology, CrystallineCohomology, PrismaticCohomology, AInfCohomology, PerfectoidQuotients, CohomologyComparisons or HabiroCyclotomicCompletions. They are permitted earlier suppliers; absence of their local text is not itself a finding. Their exact section names, hypotheses and enhanced contracts remain uncertified. CohomologyComparisonsPartII does not substitute for its base roadmap. R09 concerns explicitly acknowledged but undeclared obligations, not merely unavailable files.
- Lean elaboration and the existing proof scripts were not executed because this pass prohibits Lean builds. The earlier review's reported successful build was treated as an unverified assertion. Inspection found no false native theorem; it cannot rule out an elaboration or tactic failure at the current pins.
- Generic coherent limit existence does not certify every new enhanced construction. The explicitly open perfectness/comparison targets, scheme-level coherence of all eight squares, and enhanced finite-projective transport require future proofs. The table distinguishes these from false or unowned claims; no open target was treated as already proved.
- Repository-wide absence searches are not exhaustive theorem-prover searches: candidate declarations located by object searches were read at the pinned commits, but no claim is made that every conceivable alternate formalization was excluded.
- No cited work remained legally unreadable, and no missing-reference request was necessary. Source access succeeded for every work; the absent package provenance file is separately R13. No repair report marking a finding “not actionable in this package” was supplied or found in the package.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0220c88753b6f03e2f05d1a60b1a4dcf0fd7052d", "job": "RT-HabiroCohomologyFoundations~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
