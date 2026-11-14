<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15109#issuecomment-6874999716 -->
Review (codex) of 3b9507d

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The denominator theorem is narrowed to avoid its prerequisite theory

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:101–103,1480–1488`; plan target 8.8. The excluded case is “the denominator bound without a proper cocompact action”.

   **Claim:** The advertised denominator theorem is proved only for groups admitting a particular proper cocompact acyclic action; classical Smith theory is explicitly excluded as the reason for omitting the general theorem.

   **Witness:** Brown1974 lines 607–610, §6 Corollary 1, printed p. 243, assumes finite homological type, without an action or cocompactness hypothesis.

   This is a route-specific restriction of the theorem, contrary to the binding general-library principle. It is not an assertion that the restricted theorem is false. The roadmap already defines finite homological type and its Euler characteristic in 4.4 and 8.4.

   **Exact repair:** Make 8.8 state: for every group of finite homological type, let m be the least common multiple of the orders of its finite subgroups; then mχ(G) is an integer, equivalently every prime power dividing the denominator is realized as a subgroup order. Add the finite-group action/Smith-theory inputs needed for Brown1974 §2 Theorem 2′ and §6, with their hypotheses and dependencies (lines 246–250 and 637–673, printed pp. 234, 244–245). Retain the proper-action formula as a corollary or Check, and remove this general denominator theorem from Non-goals. The lcm exists: finite subgroup orders divide the index of a torsion-free finite-index subgroup. SheafTheoreticSmithTheory concerns sheaf-theoretic Smith functors; its scope does not supply this classical input.

   **Repair test:** C₂ gives mχ = 2·(1/2) = 1; C₄ ∗_{C₂} C₆ gives 12·(−1/12) = −1. Both old examples survive, while the theorem now quantifies over the class of groups in its cited source.

2. **F02** (P1) The chosen trace API makes 7.2 false for projective modules

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:1236–1241`; `packages/FinitenessAndDualityOfGroups/design/plan.json:1499–1514`: “Mathlib `LinearMap.trace`”.

   **Claim:** For arbitrary commutative R and a finite projective RG-module P, the chosen trace equals |C_G(g)|r_P([g⁻¹]).

   **Witness:** R = ℚ×ℚ, G = 1, P = R(1,0): `LinearMap.trace` of the identity is 0, whereas the asserted right side is (1,0).

   P is a finite projective R-module without an R-basis: its ranks at the two factors are 1 and 0. `Mathlib/LinearAlgebra/Trace.lean:75–76` defines the trace to be zero when there is no finite basis. This is not the categorical trace of a general finite projective module.

   **Exact repair:** Use `LinearMap.projectiveTrace` throughout 7.2 and its plan prerequisites, adding its exact supplier contract. It is already defined at `TauCeti/LinearAlgebra/Trace/Projective.lean:72`; its finite-projective hypotheses are at lines 63–65, and its comparison with the free trace is at line 118. Keep arbitrary R; do not add a freeness restriction. Add the witness as a Check.

   **Repair test:** The projective trace of id on R(1,0) is (1,0), so both sides agree. For a one-dimensional C₃-character ζ over ℂ, the idempotent has coefficient ζ/3 at g⁻¹; both sides are ζ. Using g instead would give ζ⁻¹, so this also tests the inverse convention missing from the existing real-character examples.

3. **F03** (P1) The free-group dualizing cokernel has the factors reversed

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:1084–1086`: “`a ↦ (a(s_i − 1))_i`”. Compare the left-regular coefficient/right-action convention at lines 113–121.

   **Claim:** This cokernel models H¹(F, RF) with the residual right multiplication action, subsequently converted to a left action by inversion.

   **Witness:** For F = ⟨s,t⟩, the image vector (s−1,t−1), multiplied on the right by t, is not in that image: its second coordinate forces a=t, but ts≠st.

   Indeed, (a−t)(t−1)=0 forces a=t in ℤF, since a nonzero finitely supported group-ring element cannot be invariant under translation by t. The first coordinate would then require t(s−1)=(s−1)t. Thus the displayed quotient does not inherit the action that the roadmap promises.

   **Exact repair:** Replace the differential by `a ↦ ((s_i − 1)a)_i`. Keep the declared left-regular coefficient convention and induced right action. Add the nonabelian two-generator calculation as a Check; synchronize any corresponding plan text.

   **Repair test:** The corrected δ satisfies δ(at)=δ(a)t, term by term. It is exactly Hom applied to the left-linear free-resolution boundary sending the i-th basis element to s_i−1. For F=ℤ it still gives R[t,t⁻¹]/(t−1)≅R.

4. **F04** (P2) The manifold theorem omits a separation hypothesis

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:1169–1177`; `packages/FinitenessAndDualityOfGroups/design/plan.json:1390–1396`: “compact connected smooth manifold without boundary”. The explicit hypothesis list contains no Hausdorffness assumption.

   **Claim:** The native charted/smooth manifold structure together with compactness, connectedness and asphericity suffices for the PD-group conclusion.

   **Witness:** The circle with one point doubled is compact, connected, smooth and locally Euclidean of dimension one; it has weak homotopy type S¹∨S¹, hence π₁=F₂, not a PD₁ group.

   Construct it by gluing two circles along their punctured circles. The two open circles have contractible intersection; van Kampen and the homotopy pushout calculation give π₁=F₂ and vanishing higher homotopy groups. The inherited orientation is trivial, but H¹(F₂,ℤ)=ℤ² and H₀(F₂,ℤ)=ℤ, contradicting the claimed duality. The space fails Hausdorffness.

   This is a real native-carrier omission: `Mathlib/Geometry/Manifold/ChartedSpace.lean:141` does not include T2, nor does `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:777`. The actual supplier requires compact Hausdorff second-countable manifolds: `TauCetiRoadmap/AlgebraicTopology/README.md:3620–3623`; its duality at lines 2877–2880 also requires Hausdorffness.

   **Exact repair:** Add `[T2Space M]` explicitly in both the statement and plan. Supply second countability to the cited CW-type theorem, either explicitly or by deriving it from a finite chart cover of the compact Hausdorff manifold. Add the doubled-point circle as the negative control for T2.

   **Repair test:** The counterexample is excluded; the torus and Klein bottle satisfy the added assumptions and retain their stated orientation characters.

5. **F05** (P1) A supplier's R-splitting is promoted to an equivariant splitting

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:280`: “the split exact sequence ... of permutation modules”.

   **Claim:** The augmented tree sequence splits as a sequence of G-representations.

   **Witness:** For ℤ translating its line, an equivariant section of ℤ[ℤ]→ℤ would send 1 to an invariant finite-support vector of augmentation 1. The invariant submodule is 0.

   The actual supplier says only “split over k”: `packages/CohomologyOfGroups/design/README.md:964–966`. The sequence over ℤ is 0→ℤ[t,t⁻¹]→ℤ[t,t⁻¹]→ℤ→0, with first map t−1; an equivariant splitting would incorrectly make the trivial module projective.

   **Exact repair:** Write “an exact sequence of permutation representations, split after forgetting the G-action”. Retain the supplier's action without inversions and invariant edge orientation. Do not use equivariant splitting in the downstream tree/amalgam arguments.

   **Repair test:** Choosing the vertex 0 gives the underlying ℤ-linear section 1↦[0]; translation sends it to [1], verifying exactly why the section is not equivariant. The exact-sequence arguments of 1.8 and 2.6 remain valid.

6. **F06** (P3) The free-group resolution Check has the wrong degree-zero term

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:478–480`: “terms `R`, `RG²`, `0` in degrees `0, 1, 2`”.

   **Claim:** The cellular free resolution of the trivial module for F₂ has R in degree zero.

   **Witness:** At R=ℤ, the universal-cover vertices form one free F₂-orbit: C₀=ℤF₂, of infinite abelian rank, whereas ℤ has abelian rank one.

   **Exact repair:** Write terms RG, (RG)², 0 in degrees 0,1,2, with R the augmentation target in degree −1. Explicitly display 0→(RG)²→RG→R→0 if useful.

   **Repair test:** The boundary (a,b)↦a(s−1)+b(t−1) is left-linear, has augmentation zero, and its image is the augmentation ideal; dualizing gives the corrected map in R03.

7. **F07** (P1) The finite-group Euler Check contradicts the stated value at 1

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:1384–1385`: “For a finite group `G` ... `χ̃` is not defined”. Compare line 1376, which states χ̃(1)=1.

   **Claim:** No finite group admits the finite projective resolution needed to define χ̃.

   **Witness:** G=1 has the length-zero projective resolution ℤ→ℤ. Thus χ̃(1)=1, whereas the Check says it is undefined.

   **Exact repair:** Split the Check: χ_ℚ(G)=1 for every finite G; χ̃ is undefined for a **nontrivial** finite G; for G=1 it is defined and equals 1. Also qualify the analogous “finite groups ... not FP over ℤ” example at lines 587–589.

   **Repair test:** At G=1 the Euler sum is 1; at G=C₂, cd_ℤ=∞ and χ̃ is undefined, while χ_ℚ=1 and χ=1/2. All three invariants are now distinguished consistently.

8. **F08** (P3) Two Checks need their discriminating boundary hypotheses

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:805–809,757–759,1191`. The sign Check concludes “the model without the Koszul sign is not a chain map”; the Examples assign dimension 1 to free groups without excluding rank zero.

   **Claim:** These examples distinguish the intended convention for every admitted coefficient ring and free-group rank.

   **Witness:** In characteristic two, y⊗x−x⊗y=y⊗x+x⊗y, so the sign-free swap commutes with d. For F₀=1 over ℤ, cd=hd=0, not 1.

   **Exact repair:** State the non-chain-map computation over ℤ (or require 2≠0), and add that over 𝔽₂ the two signs coincide. Qualify the dimension-one free-group examples by positive rank/nontriviality; explicitly retain rank zero as dimension zero.

   **Repair test:** Over ℤ the two images are negatives with a nonzero coefficient difference 2; over 𝔽₂ their difference is 0. F₀ has dimension 0; F₁=ℤ and F₂ have dimension 1. The correctly qualified theorem in 2.6 is unchanged.

9. **F09** (P3) Seven citations still have no exact locator

   **Location:** `packages/FinitenessAndDualityOfGroups/sources.toml:10`: “sections ... (numbers to be read)”; README targets 1.7, 1.8, 2.5, 6.1, 6.3, 6.4 and 6.5 cite Bieri1981 without a section, theorem or page.

   **Claim:** Bieri1981 supports the indicated statements, including their general-ring forms, but the recorded locator is explicitly unfinished.

   **Witness:** The manifest's `cited_for` lists these seven targets at line 14; its locator at line 10 supplies none of their numbers.

   **Exact repair:** Supply exact locators in the recorded 1981 edition, or replace these bare citations with exact locators to available sources and explicitly identified general-ring arguments. Remove “numbers to be read”. The waived availability status remains settled; this finding is not a request to fetch the book again.

   **Repair test:** A reader must be able to locate each of the seven claims from its citation alone. No replacement numbers are guessed here; this documentary repair needs the author's bibliographic evidence.

10. **F10** (P3) The finite-projective-dimension contract says finite free

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:210–214`: “a finite free resolution exact everywhere whose m-th syzygy is projective”. See also the free-only product route at lines 548–549.

   **Claim:** This wording identifies `IsFPD` with a finite-length free resolution, rather than a finite projective resolution.

   **Witness:** The trivial ℚ[C₂]-module ℚ is finite projective of dimension zero, but no finite free resolution exists: its ℚ-dimension is 1, whereas every alternating sum of free-module dimensions is even.

   The native definition at `TauCeti/Algebra/Module/PseudoCoherent/FiniteProjectiveDimension.lean:69` uses a sequence of finite free terms, exact throughout, with projective m-th syzygy; it does not say the entire free sequence terminates.

   **Exact repair:** Say “a possibly unbounded resolution by finitely generated free modules whose m-th syzygy is projective, equivalently a finite resolution by finitely generated projective modules”. In 1.7's product route explicitly tensor finite projective resolutions for FP, finite free resolutions for FL, and partial finite free resolutions for FP_n.

   **Repair test:** ℚ over ℚ[C₂] remains FP with dimension zero and is not incorrectly assigned FL. The tensor product of two finite projective resolutions has finite projective terms and the required length.

11. **F11** (P3) The downstream paragraph contains merge-process narrative

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:1642–1645`: “sit earlier and compare ... in revisions placed after this roadmap”.

   **Claim:** The roadmap records when other revisions should be placed in a merge sequence.

   **Witness:** This is future revision/merge-order language in the mathematical README, rather than a timeless statement of a consumer's mathematics.

   **Exact repair:** Replace the bullet's process clause by: “These arithmetic and mapping-class-group instances provide comparisons with the general invariants of Layers 4, 6 and 8.” Keep the named owners and their sections. No supplier edge is reversed or added.

   **Repair test:** The paragraph still identifies the comparisons and owners, without prescribing revision timing. The dependency graph is unchanged.

Reviewed the design README, all 49 plan targets, the source manifest, the supplied overlap and citation leads, the pinned libraries, and the relevant supplier texts. There are 11 findings, of which six are blocking (P1/P2). No previous review or maintainer note was supplied. This is a design review: no `Suggested.lean` is present, and this lane does not elaborate. No design input was changed.

## Verified sound

All nine layers and 49 numbered targets were read, including their API bullets, routes and Checks. The following are positive results, subject to the explicit findings above and the unread-source limitations below.

- The design develops arbitrary commutative coefficient rings, including the zero ring, rather than only good primes. Integral specializations are distinguished. Natural-number subtraction in duality is protected by an explicit vanishing clause above dimension n. The C₂ example over ℤ/6 correctly distinguishes a unit from a nonzero element.
- The 13 subsections introducing the principal definitions/constructions (1.2, 2.1, 3.1, 4.1, 4.4, 5.1, 6.1, 6.4, 7.1, 8.3, 8.4, 9.2, 9.3) have API statements and at least three Checks. The defects in particular Checks are listed above. Every numbered target has a Needs line; all nine layers end with Examples and Dependencies. All target-to-target prerequisites in the plan point backwards. No declared supplier gaps occur.
- No algorithmic target, copied source table/figure, re-planned same-name roadmap, forbidden supplier, upward edge or cycle was found. The pinned Gorenstein-projective structure, pseudocoherence, Tate cohomology and cellular-resolution constructions are imported, not reconstructed as new generic carriers.
- The README uses mathematical notation and prose rather than a numbered target catalogue. Its backticked library identifiers resolve; the three automated unresolved-citation leads are explained below. Future declaration names in plan.json are not existing declarations of this design.

### Computed adversarial table

Here R≠0 unless specified, C_m denotes the cyclic group of order m, F_r the rank-r free group, and K the Klein bottle group. Values are computed on the actual coefficients shown; a finite sample is evidence, not a proof of the general statement. “Pass” means these computations agree, not that an unread citation was certified.

| Target | Instances and computed sides | Result / change |
|---|---|---|
| 1.1 | A=k[x₁,x₂,…], M=k, N_i=A/(x₁,…,x_i): colim Hom(M,N_i)=0, Hom(M,colim N_i)=k; M finitely generated but not finitely presented. M=0 gives 0→0 in every degree. | Pass; distinguishes injectivity from bijectivity. |
| 1.2 | G=1: length-zero free resolution, FL=true. G=C₂ over ℤ: FP_∞=true, FP=false since H²ʲ(C₂,ℤ)=ℤ/2 for j≥1. Over ℚ: FP=true. R=0: all four finiteness predicates true. | Pass. |
| 1.3 | ℤ→ℚ, G=C₂: FP changes false→true; ℤ→𝔽₂, G=ℤ: two-term resolution remains exact, FL=true on both sides. | Pass; converse fails. |
| 1.4 | F₂: C₀ has ℤ-rank ∞, not 1; augmentation target has rank 1. Additive ℚ has FP₀=true, FP₁=false. | R06. |
| 1.5 | G=ℚ, M_i=R[ℚ/(1/i!)ℤ]: colim M_i^G=0, (colim M_i)^G=R; comparison 0→R is injective at n=0 and not bijective at n=1. For G=1 all comparisons are identities, higher groups 0. | Pass, including the endpoint bounds. |
| 1.6 | C₂×ℤ⊇ℤ: FP_∞ true on both sides; FP over ℤ is false/true. Over ℚ both have cd=1 and FP=true. | Pass; only the stated finiteness predicates ascend. |
| 1.7 | ℤ×ℤ: FL=true, tensor-resolution ranks (1,2,1). Lamplighter: middle group FP₁=true, normal direct sum of C₂ has FP₁=false. | Statement passes; distinguish projective/free routes in R10. |
| 1.8 | At n=0, n−1=0, all groups meet FP₀; at n=1 any amalgam of finitely generated vertices is generated by their finite union. C₄∗_{C₂}C₆ has FP_∞=true. | Pass, including truncated subtraction. |
| 2.1 | (cd,hd)(1)=(0,0), (cd,hd)(ℤ)=(1,1); R=0 gives (0,0) for C₂, versus (∞,∞) over ℤ. | Pass. |
| 2.2 | ℤ²: cd=hd=2, top H²(ℤ²,Rℤ²)=R. Additive ℚ: hd=1, cd=2. C₂ over ℤ: positive regular-coefficient cohomology=0 although cd=∞. | Pass; both finiteness qualifications matter. |
| 2.3 | 2ℤ≤ℤ: 1=1. ℤ≤C₂×ℤ over ℤ: 1<∞; over ℚ: 1=1 and index 2 is invertible. | Pass. |
| 2.4 | ℤ²: 2≤1+1=2. C₂×ℤ over ℤ: ∞≤∞+1=∞. K over 𝔽₂: H²=𝔽₂, hence cd=2. | Pass. |
| 2.5 | ℚ=union (1/i!)ℤ: hd=1=sup 1, cd=2=sup 1+1. ℤ² as union of all cyclic subgroups: 2>sup hd=1; that family is not directed. | Pass. |
| 2.6 | F₀: cd=0≤1; F₂: cd=1. C₄∗_{C₂}C₆ over ℚ: bound max(0,0,1)=1, attained. BS(1,2): bound max(1,2)=2. | The theorem passes; R08 corrects the unqualified Examples. |
| 2.7 | C₂ over ℤ[1/2]: cd=0; over ℤ/6: H²=ℤ/2 and cd=∞. C₃ over ℤ[1/2]: H²=R/3R≠0, cd=∞. | Pass; tests p=2,3 and nonunit/nonzero distinction. |
| 2.8 | Discrete ℤⁿ: continuous-torsion dimension=n=cd_ℤ, detected by Hⁿ(ℤⁿ,ℤ/p)=ℤ/p. For 1: 0=0; for C₂: ∞=∞. | Pass; continuous and discrete carriers remain distinct. |
| 3.1 | Over ℤ, d(x⊗x)=y⊗x−x⊗y; the unsigned swap gives its negative. Over 𝔽₂ the two results coincide. H=G: one tensor factor and the identity construction. | R08 qualifies the negative control. |
| 3.2 | K⊇ℤ² of index 2: cd=2=2. C₂×ℤ⊇ℤ: ∞≠1 without torsion-freeness. G=H=1: 0=0. | Pass. |
| 4.1 | vcd(C₂)=0, vcd(C₂×ℤⁿ)=n, vcd(⊕ C₂)=∞; the index-12 free kernel in C₄∗_{C₂}C₆ gives vcd=1. | Pass. |
| 4.2 | C₂≤C₂×ℤ: 0≤1; ℤ≤C₂×ℤ has finite index and 1=1. Extension C₂→C₂×ℤ→ℤ gives 1≤0+1=1. An infinite right side gives the tautological ∞ bound. | Pass; source locator unread. |
| 4.3 | C₂×ℤ: cd_ℚ=1≤vcd=1; over 𝔽₂, Hᵏ contains 𝔽₂ for every k, so cd=∞>1. | Pass; index invertibility is necessary. |
| 4.4 | C₂: finite homological type=true, virtual FL=true. C₂×ℚ: vcd=2 but H₁(ℚ,ℤ)=ℚ is not finitely generated, so finite homological type=false. | Pass. |
| 5.1 | gd(1)=0, gd(F₂)=1, gd(ℤ²)=2, gd(C₂)=∞; the corresponding cd lower bounds have the same values. | Pass. |
| 5.2 | T² cellular ranks (1,2,1) give cd≤2, attained over ℤ; a nontrivial finite group has cd=∞ and cannot have a finite-dimensional BG. | Pass. |
| 5.3 | G=1: 0≤3; ℤ²: 2≤3; ℤ³: 3≤3; C₂: ∞≤∞. In the proof n≥3 ensures n−1≥2, preserving π₁ during the attachments. | Pass on cases and proof indexing; primary text unread. |
| 6.1 | ℤ: x∩[t]=x(t), so the generator maps to 1. Finite C₂ over ℚ: averaging (1/2)(1+s) inverts invariants→coinvariants. R=0: all dimensions satisfy the zero duality. | Pass. |
| 6.2 | ℤ: D=R, H⁰(ℤ,Rℤ)=0, H¹=R. F₂: the written image fails right-invariance by ts−st≠0; the corrected image is right-invariant. | R03. |
| 6.3 | ℤⁿ: regular cohomology is R in degree n and 0 elsewhere; R is flat. ℤ∗ℤ²: cd=2 but H¹ contains ℤG≠0, so the criterion fails as intended. C₂/ℤ fails FP. | Pass; zero-ring version has both sides true in every n. |
| 6.4 | K: w(a)=1, w(t)=−1 and H²(K,ℤ)=ℤ/2; the trivial-orientation model would give ℤ. Over 𝔽₂, −1=1. F₁ is PD₁; F₂ has an infinite-rank dualizing module, not PD₁. | Pass. |
| 6.5 | ℤ²⊇2ℤ×ℤ: transfer sends the oriented fundamental class to the subgroup's generator, coefficient 1, not 2. K extension gives w(t)=−1. C₂×ℤ fails the torsion-free ascent with cd=∞. | Pass; integral source verified. |
| 6.6 | Tⁿ gives PD_n and trivial orientation; K gives PD₂ with w(t)=−1. Doubled-point circle: H¹(F₂,ℤ)=ℤ² versus predicted H₀=ℤ. S² has π₁=1 of dimension 0, not 2. | R04; asphericity and Hausdorffness separately tested. |
| 7.1 | For S₃ over ℚ, the trivial idempotent has class-rank values 1/6,1/2,1/3 at identity/transposition/3-cycle; their sum is 1. Regular-module rank is (1,0,0). | Pass, including a nonabelian conjugacy-class calculation. |
| 7.2 | R=ℚ×ℚ, P=R(1,0), G=1: native trace=0, RHS=(1,0). For C₃-character ζ, projective trace=ζ=3·(ζ/3) at g⁻¹, versus ζ⁻¹ at g. | R02. |
| 7.3 | P=(ℤS₃)²: rank_ℤ=12, m=12/6=2; character at nonidentity=0. Trivial ℤ over C₂: character(s)=1 and rational dimension 1 is not divisible by 2, but P is not projective. | Pass. |
| 7.4 | P=(ℤC_p)² for p=2,3: reduction dimensions 4,6, free rank 2. Trivial ℤ reduces to dimension 1, not a multiple of p, and is not projective. | Pass; no good-prime restriction. |
| 7.5 | Γ=ℤ, P=ℤΓ, dim V=1: Hom dimension=1 for every λ∈Kˣ. With nonprojective P=ℤ and λ≠1, Hom dimension=0 versus rank formula 1. | Pass. |
| 8.1 | C=(ℤ^(ℕ)→id ℤ^(ℕ)): H=0 and replacement D=0. Over k[x₁,x₂,…], a resolution of k has finite H₀=k but no finite-free terms in degrees 0,1, since k is not finitely presented. | Pass; tests noetherianity and unbounded term ranks. |
| 8.2 | C=ℤC₂ in degree 0: χ=2=2·1 and nonidentity Lefschetz trace=0. Nonprojective trivial ℤ: 1≠2·1. Contractible complex: 0=2·0. | Pass. |
| 8.3 | F_r: χ_ℚ=1−r; ℤ²: 1−2+1=0. G=1: χ̃=1, contradicting the finite-group Check's undefined value. C₂: χ_ℚ=1, χ̃ undefined. | R07. |
| 8.4 | C₂: χ=1/2 and [C₂:1]χ=1. Amalgam: χ=−1/12, free kernel χ=−1=12χ. C₂×ℤ: χ=0=χ(ℤ)/2. | Pass; normalization and index direction fixed. |
| 8.5 | ℤ with λ=1: (dim H⁰,dim H¹)=(1,1); λ≠1: (0,0); both Euler sums 0. F₂ trivial coefficients: 1−2=−1. C₂ over ℚ without FP: 1≠1/2. | Pass over every field; source Appendix A supplies the extension. |
| 8.6 | F₂×F₃: cohomology dimensions (1,5,6), alternating sum 2=(−1)(−2). K: 0=0·0. C₂×ℤ: 0=(1/2)·0. | Pass; total-degree sign tested. |
| 8.7 | C₄∗_{C₂}C₆: 1/4+1/6−1/2=−1/12; reversing edge sign gives 11/12. C₂∗C₃: 1/2+1/3−1=−1/6. F_r: 1−r; BS(1,2): 0−0=0. | Pass; monomial sign coefficients handled by their index-two kernel. |
| 8.8 | Amalgam: mχ=12·(−1/12)=−1; C₂: 2·(1/2)=1; C₂×ℤ: 2·0=0. | Restricted formula passes; R01 restores the general theorem. |
| 9.1 | Over 𝔽₂ with G=C₂,H=1, every module restricts to a vector space and is Gorenstein projective. G=ℤ, H=G, M=ℤ: pd=1, not projective or Gorenstein projective. | Pass; restriction hypothesis distinguishes the examples. |
| 9.2 | C₂/ℤ: alternating maps 1−s,1+s have product 1−s²=0; kernels equal opposite images. G=1 admits a contractible completion, hence all Hom cohomology=0. | Pass on existence model and indexing. |
| 9.3 | C₂ with ℤ: degrees (−1,0,1,2) give (0,ℤ/2,0,ℤ/2); a shift by one gives the wrong degree-zero value 0. Regular coefficients and G=ℤ give 0 in every degree. | Pass; source texts unread. |
| 9.4 | C₂×ℤ: ordinary and Farrell groups are ℤ/2 for k≥2. Amalgam: kernel of ℤ/4⊕ℤ/6→ℤ/2 is cyclic of order 12, generated by (1,1); odd groups vanish. At C₂,k=0: ℤ→ℤ/2 is onto with kernel 2ℤ. | Pass; endpoint surjectivity is not promoted to injectivity. |
| 9.5 | Finite C₂: norm on trivial ℤ is ×2, so Tate and Farrell values are (ℤ/2,0,ℤ/2,0) in degrees (0,1,2,−1). For G=1 norm=id, so all groups vanish. | Pass against the native norm splice; source texts unread. |

### Seeded source sample and additional locator checks

The five readable texts were checked in their supplied, line-numbered extractions. Printed pages below are the article's pagination, not PDF page indices. General-ring adaptations are distinguished from what the integral source actually states.

| Sampled target | Source and locator read | Outcome |
|---|---|---|
| 1.2 | BieriEckmann1973 §4.1, lines 540–544, p.116; BieriEckmann1974 §3.3, lines 286–295, p.81; Brown1974 §3, lines 345–351, p.236; Serre1971Bourbaki 1.2, lines 55–58, p.338. | FP/finite-free conventions supported. Integral source statements are identified as such; arbitrary-R definitions use native modules. |
| 1.7 | BieriEckmann1974 Proposition 3.3(a), lines 298–313, pp.81–82. | Supports integral FP_∞ and FP extension results. The finite-n arbitrary-R version is an explicit colimit/LHS argument, not falsely attributed verbatim to the proposition. Bieri1981 and Brown VIII.5 unread. |
| 4.2 | BrownGTM87 VIII.11. | Settled uncertified text unavailable; bounds checked independently in the table. |
| 5.3 | EilenbergGanea1957 main theorem; BrownGTM87 VIII.7. | Both settled uncertified; the actual source text and exact printed locator could not be checked. Skeletal dimension and syzygy indices were checked in the proposed route. |
| 6.2 | BieriEckmann1973 Propositions 1.2,1.6, lines 139–164,210–220, pp.105–107; BieriEckmann1974 Proposition 2.1, lines 148–154, p.77; Brown1975 Corollaries 1,2 to Theorem 3, lines 195–215, pp.133–134. | Integral consequences supported. The general-R flatness argument is separately given, rather than confusing torsion-free with flat over every ring. R03 affects a Check. |
| 6.5 | BieriEckmann1973 Theorems 3.2,3.3,3.5, lines 366–516, pp.111–116; Proposition 1.8 and its action construction, lines 238–272, pp.108–109. | Integral finite-index and extension statements supported, including the canonical action. General-R extension is an adaptation; Bieri1981 unread and unlocated. |
| 6.6 | Serre1971Bourbaki 1.4, lines 63–67, p.338; BieriEckmann1974 §3.2, lines 271–281, pp.80–81. | First source discusses the preceding cocompact lattice situation; second discusses Poincaré complexes. The general manifold bridge is supplied by topology roadmaps, with the extra hypotheses in R04. |
| 7.2 | BrownGTM87 IX.2. | Unread; idempotent-matrix calculation checked independently. Pinned API contradicts the statement as encoded: R02. |
| 7.3 | Brown1974 §1, Swan statement, lines 169–172, p.232. | Rational freeness of integral projectives supported. Natural rank and vanishing of nonidentity class coefficients follow by the displayed character argument. |
| 8.1 | Brown1974 §1 unnumbered lemma, lines 136–164, pp.231–232. | Noetherian ring, projective complex, finite homology and the extra cohomological bound agree. Initial free replacement may be unbounded; bounded replacement has a projective top. |
| 8.2 | Brown1974 Theorem 1, lines 125–133 and proof 165–172, pp.231–232. | Boundedness, projectivity and finite homology agree; both Euler and nonidentity Lefschetz conclusions supported. |
| 8.5 | Brown1974 Theorem 4/Corollary 1, lines 425–451, pp.238–239; Appendix A Theorem 7, lines 1284–1355, pp.260–261. | Main-text characteristic-zero restriction is acknowledged. Theorem 7 supplies the every-field projective-Hom result used to extend the Euler formula. |
| 8.7 | Brown1974 §5, lines 464–479, pp.239–240; Proposition 2(i), line 509, p.240; Proposition 4, lines 558–582, p.242. | Unsigned action formula supported. Signed monomial version is the roadmap's explicit extension using the kernel of the sign character; no assumption that all stabilizers preserve orientation is hidden. |
| 9.3 | Farrell1977; BrownGTM87 X.3. | Settled uncertified; source text not read. Native complex model and degree-zero/negative-one values checked independently. |
| 9.5 | Farrell1977; BrownGTM87 VI.3. | Settled uncertified; compared instead with native Tate norm splice and positive-degree comparison. |

Additional passages read against the sources: 1.1 and 1.5 against Brown1975 Theorem 2, lines 83–114 and 147–157, pp.130–132; 2.2 against BieriEckmann1973 Theorem 4.2/Corollary 4.3, lines 566–607, pp.117–118; 4.4 against Brown1974 lines 359–384, pp.236–237; 7.5 against Brown1974 Theorem 7, pp.260–261; 6.3 against BieriEckmann1973 Theorem 4.5, lines 612–621, pp.118–119. The manifest records all 11 cited works, without a duplicate key. Its unresolved Bieri locator is R09; waived/uncertified availability was not reopened.

### Pinned-library audit

Read against Mathlib pin `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti pin `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Object searches covered projective resolutions, Ext/Tor dimensions, classifying spaces, projective traces, tensor induction, continuous dimensions and complete/Tate cohomology. The principal contracts opened were:

| Pinned file and line | Declaration / material checked |
|---|---|
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:202` | `groupCohomologyIsoExt`; coefficients are representations. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:246` | `groupHomologyIsoTor`; the decidable-equality requirement can be supplied classically. |
| `Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean:53` | `HasProjectiveDimensionLE` uses Ext vanishing, with no finite-generation condition. |
| `Mathlib/LinearAlgebra/Trace.lean:75` | Trace is zero outside finite-free modules: R02. |
| `Mathlib/Topology/CWComplex/Classical/Finite.lean:40` | Finite dimensionality; line 49 separately gives finite type. |
| `Mathlib/Geometry/Manifold/ChartedSpace.lean:141` | Charted spaces do not bundle Hausdorffness. |
| `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:777` | Smoothness does not add Hausdorffness. |
| `TauCeti/Algebra/Module/PseudoCoherent/Basic.lean:89` | Actual finite-free-sequence predicate; zero/one at 133/205, kernel/successor at 364/375. |
| `TauCeti/Algebra/Module/PseudoCoherent/RestrictScalars.lean:155` | Restriction equivalence requires pseudocoherence of the scalar algebra. |
| `TauCeti/Algebra/Module/PseudoCoherent/FiniteProjectiveDimension.lean:69` | Real `IsFPD` body and equivalence at 153; R10. |
| `TauCeti/Data/ENat/LeastBound.lean:39` | Least bound; monotone-predicate characterization at 70. |
| `TauCeti/LinearAlgebra/Trace/Projective.lean:72` | Finite-projective trace, cyclicity at 96, comparison at 118, base change at 158. |

Also opened the pinned declarations for cyclic cohomology, Shapiro, corestriction/transfer, the Tate comparison, aspherical cellular resolutions, the Hurewicz and Whitehead theorems, totally acyclic/Gorenstein-projective objects and complete-resolution comparison, projective-character vanishing, p-adic Swan, character determination, and representation tensor induction. Their important limitations are retained: the absolute Hurewicz instance used here is Type-level; the aspherical cellular resolution requires Hausdorff CW data; p-adic character vanishing assumes a local coefficient ring and a nonunit p; the existing tensor induction is for representations, without the chain-complex Koszul signs. General finite-projective trace already exists and should be consumed, as R02 prescribes.

### Ownership, current supplier heads and overlap

Read the board package index before resolving missing-owner leads. The automated “CohomologyOfGroups nowhere” lead is false: its accepted board design is present. Its sections 1.2,1.4,1.5,3.1,3.2,3.4–3.6,4.6,5.2,6.2–6.3 were resolved in `packages/CohomologyOfGroups/design/README.md` (respectively starting at lines 620,663,687,849,900,959,978,1007,1172,1339,1529,1569). Its group operations are upstream; R05 is a misquotation of its actual contract, not an absent supplier. The other two unresolved leads are bibliographic labels BieriEckmann1974 and BrownGTM87, not roadmap names.

- Main `TauCetiRoadmap/ClassifyingSpaces/README.md`: Stage 2 item 10 and Stage 4 items 16–17 supply BG, the cellular resolution and local-coefficient comparison. Both open revisions #1807 and #1808 retain old-to-new mappings in their scope/supplier tables (respectively lines 107–168 and 113–166); legacy citations therefore do not drift.
- Main `TauCetiRoadmap/AlgebraicTopology/README.md`: §§8.1,8.3,8.5,8.7 and §§6.3–6.4 resolve to cellular connectivity, Hurewicz, Whitehead, finite CW type and manifold duality. Its scope and the #1807 scope were read. R04 identifies a missing consumed hypothesis, not a new owner for these constructions.
- Main `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md` and open #2205/#2221: §§4.5,4.7,4.8,4.9 remain one-edge identifications, Bass–Serre trees, free actions and finite-subgroup fixed points. They own the trees, while this design owns finiteness/dimension/Euler consequences.
- `TauCetiRoadmap/SchemeKTheoryOperations/README.md`, new-roadmap PR #1229, §6.7 supplies homology of directed unions over arbitrary commutative coefficients. Main `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`, §F.10.3 (lines 1295 onward, general trace at 1322), owns the generic Hattori–Stallings trace; Layer 7 here is its group-ring specialization.
- ArithmeticKTheory #1418 §3.2 owns arithmetic Steinberg duality; FuchsianOrbifolds on main Layer 5 item 6 owns the signature/covolume formula (giving −1/6 at PSL₂(ℤ)); BianchiModularForms #1719 §9.3 owns Bianchi instances. Their instance-specific scope is distinguished from the general theory here.
- ProfiniteCohomology on main Layer 11 and BordismFormalGroups on main own continuous, rather than discrete, dimension/complete-resolution objects. GorensteinHomologicalAlgebra #323 excludes complete group cohomology and does not duplicate Layer 9's object. MotivicStructuresInModuliOfCurves is present as a board design; its TC.1 is a mapping-class-group instance. PosetHomotopyAndSubgroupComplexes #2296 leaves the Brown Euler theory outside its own scope. SheafTheoreticSmithTheory #1734 does not supply the classical Smith input excluded here.

The supplied overlap facts were checked: no second copy on main, conflicting head of this roadmap, dropped cited id without a mapping, or citation requiring only a revision's new numbering was established. No finding rests merely on an automatic grep miss.

Overlap check: read ClassifyingSpaces (main, #1807, #1808), AlgebraicTopology (main, #1807), FreeGroupsAndLimitGroups (main, #2205, #2221); shared objects are owned respectively by ClassifyingSpaces (BG and its cellular/local-coefficient comparisons), AlgebraicTopology (cellular connectivity, Hurewicz, Whitehead, manifold CW type and duality), and FreeGroupsAndLimitGroups (graphs of groups and Bass–Serre trees). This design consumes them and owns the resulting discrete-group finiteness, dimension, duality, Euler and Farrell theory. The third closest-roadmap list is empty.

The requested dependency gate returned:

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2200 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. Every Needs line and supplier citation was read; the plan has no forward local target edge and no declared gaps. The source-locator and supplier-content corrections above remain necessary even though the graph passes.

### Headline and Lean-form review

The summary names eight end-theorem targets: 1.5 finiteness criterion; 3.2 Serre; 5.3 Eilenberg–Ganea; 6.3 duality criterion; 8.4 Euler characteristic and finite-index multiplicativity; 8.6 extension multiplicativity; 8.7 equivariant Euler formula; 9.4 Farrell comparison. It additionally promises the substantial Swan results 7.3–7.4, duality inheritance/manifold instances 6.5–6.6, and the denominator theorem 8.8.

No `Suggested.lean` is part of this design. Thus there are zero sorried Lean declarations to probe, no `#check @name` comparison to run, and no package-stage missing-headline or padding verdict to invent. Elaboration: **not available (this lane does not elaborate)**. At the package stage, readily native formulations such as Serre's dimension equality (using a real least-vanishing-bound predicate), Swan's projective-module conclusions and the geometric-dimension bound must not be replaced by boundary cases. The other headline formulations must either use genuine native/simple definitions or be individually identified in the module docstring with the missing carriers. This review does not claim that a nonexistent acceptance-test file passes.

### Source wording, arrangement and reuse

Seventeen passage/source comparisons were made across the five available sources: the readable sampled passages plus 1.1,1.5,2.2,4.4,7.5,6.3; 6.2 was compared with both Bieri–Eckmann and Brown. These cover definitions, theorem statements, Checks and proof routes from different layers. No copied sentence, translated passage, reused table or figure was established. A shared ten-word sequence concerning a resolution of length n by finitely generated projectives is standard mathematical statement wording, not expressive copying. There is no Lean docstring at this stage to compare.

Counting named source citation occurrences before References gives 125: Brown1974 30, BieriEckmann1973 27, BrownGTM87 21, BieriEckmann1974 13, Brown1975 8, Bieri1981 7, Serre1971Bourbaki 7, Farrell1977 5, Serre1971Prospects 5, EilenbergGanea1957 1, Wall1961 1. This count includes bare citations, whose locator shortcomings are not concealed by the total.

Brown1974's contents were read at lines 36–55, printed p.229. The roadmap does not reproduce its section order: Brown §3 supplies Layer 4, Appendix A supplies Layer 7, and §§1,4,5,6 contribute to Layer 8. Within Layer 8, the explicit chain 8.1→8.2→8.4→8.5→8.6→8.7→8.8 explains the order by the proof dependencies. The surrounding tensor-induction, dimension, geometric-dimension, duality and complete-resolution layers are not a one-to-one run of Brown1974's contents. No arrangement finding is established. BrownGTM87's contents were unavailable, so independence from that book is not certified.

Source independence: 17 passage/source comparisons with 5 sources, no expressive copying established; largest share Brown1974, 30 of 125 named citation occurrences; contents compared with Brown1974: no source-order duplication established. BrownGTM87 text/contents and the other settled unread texts were not compared.

## Not verifiable

- Bieri1981 is waived; BrownGTM87, Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects are settled uncertified. Their actual theorem wording, printed pagination and source arrangement could not be checked. Their existing manifest statuses were preserved; none was requested again.
- Consequently the seeded locators for 4.2,5.3,7.2,9.3,9.5 are not text-certified. The unread portions of 1.7 and 6.5, and all bare Bieri references, remain subject to the same limitation. Independent calculations and proof-route checks above do not substitute for reading those texts.
- General-ring extensions of integral Bieri–Eckmann results were checked from the roadmap's algebraic routes, not certified as statements in the unread Bieri book.
- Lean elaboration, fully elaborated binder inspection and one-tactic probes are unavailable in this lane. There is no Suggested.lean in this design; no successful build is claimed.

## Source issues

- none

## For the human reviewers

- BrownGTM87 supplies 21 of 125 named citation occurrences; its settled uncertified text and contents were unavailable, so wording and arrangement were not tested against it. The largest source, Brown1974, was available and compared.
- Bieri1981 is waived; Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects are settled uncertified. Their contents were not inspected; their recorded availability decisions were preserved.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3b9507d366b7996c8942866e2987b5bff7af48b2", "job": "REV-DESIGN-FinitenessAndDualityOfGroups", "model": "gpt-6-astra", "worker": "chris-6"} -->
