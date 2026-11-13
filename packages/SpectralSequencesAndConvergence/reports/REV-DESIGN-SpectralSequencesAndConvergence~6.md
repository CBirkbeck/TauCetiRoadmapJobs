<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13813#issuecomment-6853532497 -->
Review (codex) of 9e28545

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P1) Convergence to the limit has the wrong total degree

   **Location.** `packages/SpectralSequencesAndConvergence/design/README.md:1385`, `:1391`, `:1407`; `packages/SpectralSequencesAndConvergence/design/plan.json:1620`, `:1664`. Claim: “the spectral sequence converges strongly to `A^{+∞}`”, with `A^s = D^{s,n−s}`.

   **Witness (computed).** Set `D^{s,1−s}=ℤ` for `s≥1`, zero otherwise; transitions are identities where possible. Set `E^{0,0}=ℤ`, all other E zero, `j=0`, and `k:E^{0,0}→D^{1,0}=id`. Then `E_∞^{0,0}=ℤ` but `A^{+∞,0}=0`.

   This is an exact couple of precisely the cohomological degrees specified in Conventions and 6.1. At the sole break, `ker(D^{1,0}→D^{0,1})=ℤ=im k`; at E, `ker k=0=im j`; elsewhere exactness is the identity/zero calculation. Its colimit is zero in every degree, every differential is zero, and every cycle tower is constant, so all the hypotheses of the limit clause hold. Nevertheless its only nonzero limit D-degree is 1, whereas its only nonzero E-degree is 0.

   The missing shift is visible in the proof cited: helle-rognes2024 line 238 and line 245, printed p. 5, identify the graded quotient using γ (our k). The source allows γ to have nonzero internal degree (line 113). Here k has total degree +1. Merely reversing the filtration index does not remove that degree.

   **Exact repair.** Keep both degrees visible: write `A_n^s=D^{s,n−s}`, `L^n=lim_s A_n^s`, and `RL^n=lim¹_s A_n^s`. The limit theorem must give strong convergence to

   `H^n=L^{n+1}`, with `F^s H^n=ker(L^{n+1}→A_{n+1}^s)`.

   Its graded comparison is `E_∞^{s,n−s} ≅ F^s L^{n+1}/F^{s+1}L^{n+1}`. Keep the obstruction identity in D-degrees, `RL^m ≅ W^m`. Update the limit clause, its half-plane consequence, the plan statement/API and the indexing conventions. The colimit theorem and 7.5 retain their existing total degree. Add the step couple above as a Check alongside the opposite step (D in degree 0, nonzero for s≤0), which tests the unshifted colimit theorem.

   **Repair tested.** For the refuting couple, `L¹=ℤ`, `F⁰L¹=ℤ`, `F¹L¹=0`, so `gr⁰H⁰=ℤ=E_∞^{0,0}`; all other pieces are zero. For the opposite step, the colimit in degree 0 and `E_∞^{0,0}` are both ℤ. No change of the differential convention is needed.

2. **F02** (P2) Restricted recipes need their actual carriers and boundary hypotheses

   **Location.** `packages/SpectralSequencesAndConvergence/design/README.md:802`, `:814`; `packages/SpectralSequencesAndConvergence/design/plan.json:781`. Claim: “The same formulas hold for `coreE₂CohomologicalNat` and `coreE₂CohomologicalFin`”. The stated carrier is `SpectralObject C EInt` and the formulas use untruncated integer endpoints.

   **Witness.** `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean:214` takes `SpectralObject C (Fin (l+1))`; lines 218–221 clamp endpoints. For l=2, r=3: q=0 gives i₀=0, not −1; q=1 gives i₃=2, not 3.

   Furthermore the natural-index recipes require `X.HasSpectralSequence data` (`Mathlib/Algebra/Homology/SpectralObject/FirstPage.lean:70`), unlike the unrestricted integer recipe. This is mathematical, not just an instance-search inconvenience. Take `K=(ℤ→id ℤ)` in degrees 0,1 and the increasing filtration `G_t=0` for t≤0, `G_1=K¹`, `G_t=K` for t≥2. The native page 2 has an isomorphism `d₂:E₂^{−1,1}=ℤ→E₂^{1,0}=ℤ`. Restricting positions to ℕ×ℕ removes its source: the restricted page-2 homology at (1,0) is ℤ, but the proposed page 3 there is zero. An arbitrary EInt spectral object therefore cannot give that restricted sequence.

   **Exact repair.** State the restricted clauses separately, on their native carriers, with `X.HasSpectralSequence data` (the quadrant hypotheses are sufficient instances). For the finite recipe use `X:SpectralObject C (Fin (l+1))`, positions `(p,q):ℤ×Fin l`, degree `n=p+q.val`, and

   `i₀=max(0,q.val−r+2), i₁=q.val, i₂=q.val+1, i₃=min(l,q.val+r−1)`.

   Express the cycle and boundary maps using those endpoints. Establish the finite recipe's first-page endpoint equalities directly, or supply its `HasFirstPageComputation` instance; the pinned FirstPage file supplies that instance for the three EInt recipes, not Fin. For the homological recipe explicitly use `n=−p−q` as well as replacing the filtration coordinate q by −q. Synchronise plan hypotheses and prerequisites. Add clamped-endpoint and missing-boundary Checks.

   **Repair tested.** At l=2,r=3 the corrected endpoint lists are `(0,0,1,2)` and `(0,1,2,2)`, all in Fin 3. At r=2 they are `(q,q,q+1,q+1)`, hence `Z₂=⊤`, `B₂=⊥`. At l=0 there are no page positions. The crossing-boundary example fails the stated `HasSpectralSequence` hypothesis; the `IsFirstQuadrant` instance used in 4.5 satisfies it.

3. **F03** (P2) Identity transport needs the canonical marking

   **Location.** `packages/SpectralSequencesAndConvergence/design/README.md:353`. Claim: “A presentation with `B = ⊥` and `Z = ⊤` is the identity presentation; transport along it is the identity.”

   **Witness.** Take `A=X=ℤ²`, B=0, Z=A, and mark the quotient by the coordinate swap e. Preimage sends `ℤ×0` to `0×ℤ`, whereas identity transport sends it to `ℤ×0`.

   The definition at line 339 includes e as data. Fixing the two subobjects does not fix e. The plan already states the correct restricted claim (`packages/SpectralSequencesAndConvergence/design/plan.json:52`: canonical iso).

   **Exact repair.** Replace the sentence by: “For `A=X`, the presentation `(⊥,⊤,e)` with e the canonical quotient identification is the identity presentation; its transport is the identity.” Add the swap example as a negative-control Check, retaining the existing checks.

   **Repair tested.** With the canonical e, both axes have themselves as preimage. With the swap, they exchange, and the corrected hypothesis excludes it.

4. **F04** (P3) A Check asks for a non-finite filtration on zero

   **Location.** `packages/SpectralSequencesAndConvergence/design/README.md:1081`. Claim: a complex supported in degrees 0,1 has a filtration finite on those terms “but not on the zero terms”.

   **Witness.** `Subobject 0` has one element. For every p, `F^p0=0`; a=b=0 witnesses finiteness. The proposed test object cannot exist. The plan's `zero_terms_trivial` test correctly says finiteness is automatic.

   **Exact repair.** Replace this Check and the corresponding plan test with a genuine distinction between degreewise and uniform finiteness: take `K^m=ℤ` for m≥0, zero otherwise, d=0, and `F^pK^m=ℤ` exactly when p≤m.

   **Repair tested.** In degree m≥0 the filtration ends at m+1, `E₁^{m,0}=H^m=ℤ`, and all differentials vanish. No single p kills all the terms. Thus 5.3 applies without a global finite-filtration bound, while every zero term is automatically finite.

5. **F05** (P3) Odd-page vanishing is called degeneration

   **Location.** `packages/SpectralSequencesAndConvergence/design/README.md:791`: “The vanishing of `d_r` for odd `r` is a degeneration statement on odd pages.”

   **Witness.** Let `E₁=E₂` have ℤ at (0,1),(2,0), d₁=0, d₂=id, and E₃=0. Every odd differential vanishes, but E₁ does not degenerate: E₂≠E₃.

   This conflicts with 1.3's definition, which requires every subsequent differential to vanish. browning-sawin2020 line 75 and line 575 assert odd-differential vanishing only.

   **Exact repair.** Replace the sentence by: “Every odd-page differential vanishes, so its homology identifies that page with the next; this does not assert degeneration at those pages.”

   **Repair tested.** The witness has `E₁≅E₂` and `E₃≅E₄=0`, but d₂ remains nonzero, exactly as the revised statement permits.

Five findings: one P1, two P2, two P3; three blocking. The three findings of the preceding review are repaired. The new blocking witnesses concern the degree of the limit abutment, the finite-index spectral-object recipe, and the marking of an identity subquotient presentation. No design or source-manifest file was changed.

## Verified sound

**Previous findings, checked before the new pass.** None was marked not actionable. All three are repaired; none of the findings above re-raises a settled repair.

| Previous id | Status and repaired passage | Verification |
|---|---|---|
| F01 | Repaired, with a justified alternative equivalence. README:1297: “`C` is replete if and only if it satisfies `CountableAB4Star` and every tower with epimorphic transitions has `lim¹ = 0`”. | `TauCeti/CategoryTheory/Limits/Replete.lean:91,107,118,357` supplies the class, projections, descent and exact products. Shear and kernel towers below verify both implications. The extra exact-products conjunct on the right makes the converse proof valid; it is not an extra left-hand hypothesis. |
| F02 | Repaired. README:309: “the spectral sequence of a first-quadrant double complex `A` in an abelian category”, followed by the column filtration, graded identification and stabilisation in prose. | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955–978` contains precisely these statements. Its line 65 really names `DoubleComplex.edgeBottom` and `DoubleComplex.edgeLeft`; the two supplied citation leads are therefore not missing-library findings. |
| F03 | Repaired. README:1108: “The exhaustiveness step of the route … is, for complexes of modules, Tau Ceti's …”. | `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Exhaustive.lean:102` assumes exhaustion in Kⁿ only. On ℓ-adic ℤ, `F⁰H⁰=ℤ`, but no sufficiently large filtration step vanishes. The step applies and 5.4 does not, as the revised Check says. |

The repair pattern pass reread all uses of repleteness, exact products, module universes, epimorphic towers, “contains”, “recovers”, and comparisons with library results. The new Galois-module Check is valid: for every open subgroup some cyclotomic χ(g)≠1, and `(χ(g)−1)x=0` in the integral domain ℤ_ℓ forces x=0. Its smooth inverse limit is zero although each finite transition is onto. The revised module assertion in every universe follows from the faithful forgetful functor, its preservation of limits and epimorphisms, and `IsReplete.of_reflectsEpimorphisms`; enough projectives is only the alternative under `Small R`.

**Principles and shape.** Read the full README and all 31 plan target statements, with their APIs, hypotheses, prerequisites and Checks. There are seven mathematical layers, 31 target `*Needs:*` lines, 100 Check bullets, seven Examples subsections and seven Dependencies subsections. All required top-level headings are present. The design develops a general abelian-category library and distinguishes specialised suppliers. No algorithmic deliverable, good-prime restriction, second copy on main, forbidden supplier, process residue, source transcription, sorry'd data or `set_option` was found in the reviewed design. R04 is a defect in a counted Check, so the count is not itself evidence of adequacy. Maintainer notes: none. No supplier gaps are declared (`gaps=[]`).

Read the shape and scope of DerivedModuleAlgebra, EnhancedDerivedSheaves and SchemeAndStackFoundations on main. The target organisation is mathematical: arbitrary pages and towers → assignments and boundedness → filtered abutments → spectral objects → filtered complexes → exact-couple identification → conditional convergence. For example 3.2 explicitly needs 1.4/2.1/3.1, 4.4 needs 3.2/3.4/4.2/4.3, 5.3 needs 4.4/5.1/5.2, 6.3 needs 4.1/5.1/6.1/6.2, and 7.5 needs 5.1/5.2/6.3/7.1/7.2/7.4. No citation-to-source ordering is imposed in place of those dependencies.

**Seeded sources.** All 15 sampled targets were checked against the readable text, including hypotheses and endpoint/index conventions. No separate author-flagged unverified locator was found. Six whole works are explicitly settled as uncertified, listed below; their contents were not guessed. “Supported” below distinguishes the cited source's setting from the roadmap's own generalisation.

| Target | Locator opened, with printed page | Outcome |
|---|---|---|
| 1.4 | stacks-012K line 2625, Definition 20.2, p. 53; helle-rognes2024 line 71, Definition 2.3, p. 2 | Both define the cycle/boundary quotient; Stacks explicitly conditions it on existence. The product/coproduct existence argument is supplied here. |
| 2.1 | stacks-012K line 2981, p. 61; line 3010, Lemma 24.2, p. 62 | Filtration/total degrees and differential `(r,1−r)` agree. Native and homological translations were additionally computed at the pins. |
| 2.2 | stacks-012K line 3107, Definition 24.7, p. 64; line 3120, Lemma 24.8, p. 64 | Directions of “bounded below/above” and regular/coregular agree; quantitative bound computed below. |
| 3.3 | stacks-012K line 3055, Lemma 24.4, p. 63 | Supports filtered-complex naturality. The category of abstract convergence structures is the roadmap's extension, verified by the compatibility equation. |
| 3.4 | stacks-012K line 3152, Lemma 24.11, p. 65; line 3175, Lemma 24.12, pp. 65–66 | Source is for filtered complexes; finite-filtration induction and page Euler identity give the claimed abstract variant. |
| 4.1 | helle-rognes2024 line 291, Definition 4.5/Remark 4.6, p. 6; line 334, Remark 4.10, p. 6 | Integer tower formulas agree after shifting first page 1→2. Restricted-recipe extension fails as stated: R02. |
| 4.2 | helle-rognes2024 line 145, Definition 3.6, p. 3; pinned Abutment file | Source gives the image filtration of a colimit. Tau Ceti supplies the spectral-object construction; `n−p+1` and graded `n−p` checked independently. |
| 4.3 | stacks-012K line 3072, Lemma 24.6, pp. 63–64; line 3144, Lemma 24.10, p. 65 | Correctly distinguishes a canonical subquotient comparison from an arbitrary isomorphism. |
| 4.4 | stacks-012K line 3202, Lemma 24.13, pp. 66–67 | The all-degree filtered-complex theorem supports the route. The stated range-local spectral-object generalisation was recomputed, including q outside [a,b). |
| 5.1 | stacks-012K line 3038, Lemma 24.3, pp. 62–63; line 3055, Lemma 24.4, p. 63; Tau Ceti FirstPage:89 | Stacks 24.3 states countable sums; the native Tau Ceti theorem and the local exact-sequence construction provide the claimed arbitrary-abelian-category version. Sign +2 agrees. |
| 6.1 | stacks-012K line 2653, Definition 21.1/Lemma 21.2, p. 54; line 2683, Definition 21.3, p. 55 | Exact-couple derivation and page formation agree; supplier owns the derived-couple carrier. |
| 6.2 | stacks-012K line 2687, Lemma 21.4 and following remark, p. 55; helle-rognes2024 line 136, Definition 3.3/Lemma 3.4, p. 3 | r versus r+1, preimages/images, and the lift formula agree. |
| 6.3 | stacks-012K line 2834, §23, pp. 58–59, especially Lemmas 23.2–23.3; native spectral-object exactness | Supports filtered differential objects. Arbitrary spectral objects use the pinned exact triangles and §7.22's supplied couple; the native degree and page shift check succeeds. Weibel 5.9.4 remains uncertified. |
| 7.2 | bhatt-scholze2015 line 701, Definition 3.1.1, p. 16; line 755, Proposition 3.1.10, p. 17; stacks-012K line 3715, Definition 31.2/Lemma 31.3, p. 78 | Topos and abelian-group cases are accurately labelled. The general shear/kernel proofs support the extension. Neeman warning is present at Stacks line 3722. |
| 7.4 | helle-rognes2024 line 145–178, p. 3, and line 185–247, pp. 4–5 | Conditional hypotheses and obstruction definition agree; the limit comparison loses the degree of γ: R01. Boardman's half-plane theorem numbers remain uncertified. |

**Adversarial computations.** This table includes the seeded targets, headlines, changed passages and all findings. Earlier computed rows were used only for unchanged claims; missing cases, especially restricted recipes and the nonzero limit branch, were recomputed. Variables below refer to the actual constructions, not arbitrary stand-ins. “Hold” reports these checks and the stated proof route, not a Lean proof.

| Statement | Instances | Computed sides/values | Result; change |
|---|---|---|---|
| 1.1 correspondence and identity | ℤ/4 in ℤ; swap on ℤ² | `0≤2ℤ/4≤ℤ/4` lifts to `4ℤ≤2ℤ≤ℤ`; swap preimage of horizontal axis is vertical, not horizontal | Correspondence holds; R03 adds canonical marking |
| 1.1 zero/nesting | X=0; B⊆B′⊆Z′⊆Z | B=Z gives one interval point; pulling back the nested pair in two stages gives the same inverse images | Hold |
| 1.2 towers/naturality/rebasing | d₂=×2:ℤ→ℤ; zero sequence | source `(Z₃,B₃)=(0,0)`; target `(ℤ,2ℤ)`; rebase at 3 gives target `(ℤ/2,0)`; zero gives `(0,0)` | Hold |
| 1.3 regular/coregular | same ×2 sequence | source leaving d₂≠0, entering d₂=0; both zero from 3; target incoming nonzero at 2; towers constant from 3 | Hold |
| 1.4 limit versus stable page | ℓ=2,3 example of 1.4; zero | `Z₁=ℤ,Z₂=ℓℤ,Z₃=ℓ²ℤ`, meet 0; B=0; each Eᵣ≅ℤ but E∞=0; zero sequence gives 0 | Hold; product-kernel and coproduct-image give these same meet/join |
| 2.1 degrees and wrong assignments | cohomological r=2,3; homological r=2; Fin 0 | `Δ(deg,fil)=(1,2),(1,3)`; classical native `(1,1),(1,2)`; homological with negated assignment `(1,2)`; Fin 0 has empty image | Hold; e=1 native, e=0 classical/cohomological |
| 2.1 injectivity | `(p,q)↦(p,p+q)` and `(p,p)` | inverse is `(s,n)↦(s,n−s)`; `(0,0),(0,1)` collide for `(p,p)` | Hold |
| 2.2 quantitative bound | first quadrant; (1,0); ℓ-adic nonregular example | outgoing fil=`f+r−e≥β(n+1)`; incoming=`f−r+e≤α(n−1)`; α=−1, β=n+1 gives `r≥max(p+1,q+2)`; at (1,0), r=2; ℓ-adic Zᵣ never constant | Hold |
| 2.3 Euler identity | ℤ/4→ℤ/2 onto; ×2 over ℚ | lengths `−2+1=−1=−1+0`; ranks `−1+1=0=0`; infinite-dimensional example gives finrank `0≠1+0` without the additive invariant hypothesis | Hold |
| 3.1 predicates/graded comparison | ℓ-adic ℤ,ℤ_ℓ; constant/zero filtration; ℤ/4 | completion ℤ_ℓ≠ℤ versus identity on ℤ_ℓ; constant meet X; zero join 0; `gr⁰=gr¹=ℤ/2`, same as split group but extension differs | Hold |
| 3.2 convergence in I | ×2 complex; zero pages with H⁰=ℤ constant; I empty | `E∞^{1,0}=gr¹H¹=ℤ/2`; zero pages have gr=0 but meet ℤ; empty I imposes no equations | Hold; exhaustiveness/separation remain independent |
| 3.3 morphism law | (−1,id); identity; zero pair | β′f=−β versus gr(id)β=β on ℤ; identity gives β=β; zero pair gives 0=0; composition gives β″gf=gr(kh)β | Hold |
| 3.4 finite consequences | ℤ/4 and (ℤ/2)²; zero graded pieces; finite-support Euler | length `2=1+1`; constant steps plus finite endpoints force H=0; finite support has no differentials once displacement exceeds its width, giving the page sum=abutment sum | Hold |
| 3.5 comparison | ℤ→ℤ_ℓ; constant ℤ→0; finite filtered iso | same gr=ℤ/ℓ but map not onto; same zero pages but kernel ℤ; in finite induction kernel=cokernel=0 at each step | Hold; completeness/separation controls discriminate |
| 3.6 two rows/columns | Hopf pages; two ℤ/2 pieces | d₂=id gives H¹=H²=0,H⁰=H³=ℤ; two columns give extension with order 4, either ℤ/4 or (ℤ/2)² | Hold |
| 3.6 dimension/five-term | ×2⊗ℚ; m=0 | degree-1 page rank 1 drops to 0; at m=0 both edge maps on ℤ are id, composite 1≠0 | Hold; m≥1 needed |
| Layer 3 example | d₁=0,d₂=id,d₃=0 | all odd differentials 0; E₁=E₂≠0,E₃=0; degeneration at 1 false | R05 |
| 4.1 EInt towers | r=2; ×2 at native (1,−1) | r=2: kernel of map to 0 is whole object, image from 0 is 0; r=3: ker(×2)=0 | Hold |
| 4.1 restricted recipes | l=2,r=3,q=0,1; crossing-boundary complex | finite endpoints `(0,0,1,2)` and `(0,1,2,2)`, not integer endpoints; Nat page homology ℤ versus proposed next page 0 | R02 |
| 4.2 native abutment | ×2, n=1; quadrant | native `F³=ℤ/2,F⁴=0`, gr³ at (3,−2); quadrant F⁰=Hⁿ and Fⁿ⁺¹=0 | Hold |
| 4.3 subquotient and bounds | nonexhaustive acyclic ℤ→ℤ; ×2; ℓ-adic example | first has `E∞=ℤ,grH=0,B∞=0,Bᵗ=ℤ`; ×2 bound `max(2,3)=3`; ℓ-adic has `Z∞=Zᵗ=0` without stabilisation | Hold |
| 4.3 continuity only epi | degree n−2→n−1 identity complex, finite steps only in n−1 | colimit comparison `ℤ→0` is epi, not mono; image of δ and join of boundaries are both 0 in degree n | Hold; no exact-colimit premise used here |
| 4.4 degree-local convergence | a≤q<b; q≥b; q<a; ×2 | max(q−a+2,b−q+1)≤b−a+1; q≥b gives zero gr from page q−a+2; q<a has Hⁿ(q≤q+1)=0; ×2 a=−2,b=0 gives F²=H¹,F⁴=0 | Hold |
| 4.5 quadrants | n=0,n<0; third quadrant m=−2 | first n=0 only (0,0), H⁰=E₂⁰⁰; n<0 Hⁿ=0; third a=−2,b=1, positions (0,2),(1,1),(2,0), total cohomological degree −2 | Hold |
| 4.6 comparison | identities; finite complexes | page and abutment maps id; vanishing Hⁿ⁻¹(j≤⊤),Hⁿ(j≤⊤) gives kernel=cokernel=0 for Hⁿ(⊥≤j)→Hⁿ(⊥≤⊤) | Hold; contains the pinned comparison |
| 5.1 sign/reindexing | ×2; trivial filtration | classical (0,0),(1,0) map to native (1,−1),(3,−2); d₁=+2, H¹=ℤ/2; trivial F gives only p=0 and all dᵣ=0 | Hold |
| 5.2 canonical versus arbitrary β | ℤ^(ℕ)⊕ℤ with acyclic extra summand | E∞=ℤ^(ℕ)⊕ℤ≅ℤ^(ℕ)=H⁰, but comparison kernel is 0⊕ℤ; B∞=0, Bᵗ=0⊕ℤ | Hold; equality criterion is for the comparison |
| 5.3 cohomological hypotheses | x=dy∈FˢKⁿ; missing n+1 hypothesis | injectivity on Hⁿ forces `[x]=0`, hence x∈dFˢKⁿ⁻¹; in 1.4's example H¹(FˢK)=ℓˢ⁻¹ℤ≠0 and Zᵣ keeps shrinking | Theorem holds |
| 5.3 second Check | zero terms; replacement degreewise finite complex | every Fᵖ0=0 and a=b=0; replacement E₁^{m,0}=Hᵐ=ℤ, finite cutoff m+1 but no uniform cutoff | R04 |
| 5.4 route and repaired bullet | ℓ-adic ℤ; nonexhaustive acyclic example | ℓ-adic exhaustion gives F⁰H⁰=ℤ, but FˢK⁰≠0; acyclic example has E∞=ℤ,H⁰=0; under the theorem, Fᵖ⁰Hⁿ=0 and union F=Hⁿ | Hold; prior F03 repaired |
| 6.1 exact couple and shift | D=E=ℤ²; k=1 page shift | im i=ker j=horizontal, im j=ker k=horizontal, im k=ker i=vertical; jk(x,y)=(y,0), page 2=0; shifted fil rise r+1−1=r | Hold |
| 6.2 towers | ℤ, i=×ℓ; ℤ/ℓ² couple | first Bᵣ=0,Zᵣ=ℤ/ℓ; second d₁=0,Z₂=(ℤ/ℓ)² but Z₃=ℤ/ℓ⊕0; d₂ sends second coordinate to first | Hold; off-by-one model excluded |
| 6.3 native couple | ×2 complex | k degree (2,−1), dᵣ degree (r+1,−r); Aᵖ in degree 1 is 0 for p≥4, ℤ at 3, ℤ/2 for p≤2; lim=0,colim=ℤ/2 | Hold; native/classical total degree preserved |
| 7.1 difference and completeness | identity tower; ×ℓ; zero transitions | identity lim=A,lim¹=0; ×ℓ lim=0,lim¹=ℤ_ℓ/ℤ; zero transitions 1−s=id, both zero; partial sums give (1−s)σ=−inclusion and (1−s)(Δc−σ)=inclusion | Hold |
| 7.2 new equivalence ⇒ | epi tower, shear Pₙ | transition on cone `(πₙ₊₁x,(1−s)x)` gives `(fₙπₙ₊₁x+πₙx−fₙπₙ₊₁x,(1−s)x)=(πₙx,(1−s)x)`; limit ∏F, projection `(π₀,1−s)` epi | Hold; cokernel(1−s)=0 |
| 7.2 new equivalence ⇐ | Kₙ=ker(Fₙ→F₀); cyclic reduction tower | snake gives coker(Kₙ₊₁→Kₙ)=0; six-term tail `lim F→F₀→lim¹K=0`; cyclic case Kₙ=ℓℤ/ℓⁿ⁺¹, surjective transitions | Hold; exact products used explicitly |
| 7.2 projectives/ML/repleteness | modules; finite groups; Galois modules | P↠F₀ lifts to a cone, giving epi lim F→F₀; stable-image quotient pro-zero has lim=lim¹=0; Galois tower limit 0→μℓ not epi | Hold; revised hypothesis discriminates |
| 7.3 double tower | constant; ×ℓ; eventual zero | respectively all 0; `0→0→ℤ_ℓ/ℤ→ℤ_ℓ/ℤ→0` with ×ℓ invertible; all 0 | Hold |
| 7.4 conditional controls | zero couple; identity D=ℤ,E=0 | zero: all invariants 0; identity: E∞=RE∞=W=0, but lim=colim=ℤ | Hold; conditional premise needed |
| 7.4 colimit obstruction | product-tail example, m=1,2 and general m | d₁,d₃ respectively kill E at s=−1,−2 against s=0,1; E∞=RE∞=0; colim=∏k/⊕k; Fˢ constant, lim¹F=0, meet=W⁰=∏k/⊕k≠0 | Hold; weak does not imply strong |
| 7.4 nonzero limit branch | step couple of R01 | E∞⁰⁰=ℤ, L⁰=0,L¹=ℤ, gr⁰L¹=ℤ | Fails unshifted claim; R01 |
| 7.4 half-plane indices | exact triangle in total degree n | `E₁^{s−1,n−s}→A_n^s→A_n^{s−1}→E₁^{s−1,n−s+1}`; zero outer terms in n−1,n make i an iso; cycle calculation uses A_{n+1} | Bounds agree; limit conclusion needs R01's shift |
| 7.5 complete convergence | ℓ-adic ℤ_ℓ; ℤ; degreewise-complete route | ℤ_ℓ has E∞^{p,−p}=ℤ/ℓ (p≥0), W=0, complete target; ℤ has same gr but completion ℤ_ℓ≠ℤ; exact products commute cohomology with invertible 1−s, giving lim H=lim¹H=0 | Hold; uses the unaffected colimit branch |

**Pinned declarations and duplication by object.** The plan's pins match `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches were by page carriers, tower operations, filtration fields, limit/convergence predicates and repleteness, not just proposed names. The following are the principal declaration locations opened; related named declarations in the same contracts were also located and their signatures read.

| Pinned file | Declarations read and consequence |
|---|---|
| `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36,51,60,90,99,109,118,128` | SpectralSequence, Hom, pageXIsoOfEq, pageFunctor, pageHomologyNatIso and cohomological carriers. Native fields are pages and adjacent-page homology isomorphisms; there is no abutment or convergence field. |
| `Mathlib/Algebra/Homology/SpectralSequence/ComplexShape.lean:36,47`; `Mathlib/Algebra/Homology/ComplexShape.lean:163` | spectralSequenceNat/Fin relations use integer coordinate equations; up′ uses i+a=j. No natural subtraction convention is silently used. |
| `Mathlib/Algebra/Homology/SpectralObject/Basic.lean:41,63,122`; `Cycles.lean:59,63`; `Page.lean:65` | H, δ, exactness, cycles, opcycles and E supply the local kernel/image comparisons. |
| `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean:67,143,176,214,260,303,394,437` | SpectralSequenceDataCore, four recipes, HasSpectralSequence, quadrant hypotheses; R02 records the carrier exception. |
| `Mathlib/Algebra/Homology/SpectralObject/SpectralSequence.lean:479,488`; `FirstPage.lean:78,114`; `EpiMono.lean:191,224` | spectralSequence, spectralSequencePageXIso, spectralSequenceFirstPageXIso, first differential and the two four-index comparison isomorphisms. |
| `Mathlib/CategoryTheory/Filtration/Basic.lean:44,73,90,145` | Filtration has `toMonoOver : I ⥤ MonoOver X`; FilteredObject, Hom and IsStrictHom are native. No exhaustive/separated/complete predicate is bundled. |
| `Mathlib/CategoryTheory/Subobject/Basic.lean:102,292,572`; `Limits.lean:120,314`; `ArtinianObject.lean:55,69` | Subobject, ofLE, pullback, kernel/image subobjects, IsArtinianObject and antitone chain stabilisation. |
| `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean:99,126,152,166`; `Mathlib/Algebra/Category/ModuleCat/AB.lean:28,38`; `Projective.lean:60` | AB4Star, CountableAB4Star, AB5, shrink; same-universe module instances and Small-dependent projectives. |
| `Mathlib/Algebra/Category/ModuleCat/EpiMono.lean:67`; `Mathlib/CategoryTheory/Functor/EpiMono.lean:158` | forget preserves epis in every universe; the faithful-reflection instance has a `to_dual` generated epi counterpart. |
| `TauCeti/CategoryTheory/Limits/Replete.lean:91,97,107,118,357`; `TauCeti/CategoryTheory/Sites/Replete.lean:48` | Replete class, types, projections, functor descent, countable exact products, sheaf result with its stated concrete-category hypotheses. No replacement class is planned. |
| `TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean:32`; `TauCeti/Algebra/Homology/SpectralObject/Comparison.lean:42,78,121` | Later-page isomorphisms and finite abutment comparisons; the stronger vanishing hypotheses imply the maps used by 4.4/4.6 are isomorphisms. |
| `TauCeti/Algebra/Homology/SpectralObject/Abutment.lean:44,50,54,76,92,114,123`; `Stabilization.lean:45,51` | abutment, filtration, maps, graded cokernel, zero/full steps, EInfty and stable-page comparison; these are imported, not reconstructed. |
| `TauCeti/Algebra/Homology/SpectralObject/SpectralSequenceMap.lean:64,230`; `Map.lean:106,223,284` | Page maps, spectralSequenceMap, EMap, opcycles maps and isomorphism propagation. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:147,191,304,409,425`; `Naturality.lean:83`; `FirstPage.lean:89` | Spectral object, functor, sequence, quotient first-page and differential comparisons, naturality. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Stabilization.lean:44,60,83`; `Convergence.lean:51,91,118`; `Comparison.lean:70`; `Exhaustive.lean:102,177,200` | Native boundedness and abutment comparisons; module-only exhaustiveness theorem checked with its actual weaker premise. |
| `TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:410,497` | Row-filtration sequence and stable EInfty comparison; used as an instance. |
| `TauCeti/CategoryTheory/Preadditive/TowerDifference.lean:77,122,150,165`; `TauCeti/Algebra/Category/ModuleCat/Tower/Basic.lean:174`; `MittagLeffler.lean:70,191` | Difference map, kernel limit, naturality, pro-zero invertibility, module lim¹ and ML vanishing. Abstract abelian-category extension is distinguished from these module constructions. |
| `Mathlib/Algebra/Homology/EulerCharacteristic.lean:56,154`; `TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean:165` | EulerCharSigns, homologyEulerChar and the additive-invariant Euler engine. |

The Euler engine at `TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean:165` takes the homology relation for an additive invariant, as the regrouping route in 2.3 requires. `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean` supplies `AbelianK0.AdditiveInvariant`. No claim is made that the abstract page convergence structures already exist in those files.

**Ownership and resolved suppliers.** Used `roadmaps grep` over indexed open heads and main for cycle towers, limit pages, bidegree assignments, conditional convergence, the whole-plane obstruction and repleteness. Read the current closest-roadmap scopes, and the cited sections themselves. No second ownership of the general convergence structure or of the abelian-category repleteness characterisation was found. Also read the supplied board heads: `packages/AnalyticNumberTheory/README.md:3` (#123, 310e834) is a navigation index; `packages/LogicAndDefinabilityInNumberTheory/README.md:5` (#164, 475c9e3) owns logic and definability; `packages/LawrenceVenkateshMethod/design/README.md:3` (#345, 9ee7ac3) proposes no independent layers. Object searches in these texts found no spectral-sequence, exact-couple, lim¹ or repleteness ownership.

| Supplier/near neighbour | Scope read and resolution |
|---|---|
| StableHomotopyKTheory, open #1227 | `TauCetiRoadmap/StableHomotopyKTheory/README.md:2618` (§7.22), `:2683` (§7.26), with §§7.21–7.25. Owns exact-couple data/derivation and spectral-tower applications. Here 6.1 assembles the supplied couples into Mathlib's carrier; 7.4 is the general abelian-category result. No reverse citation to this design. |
| DGFloer on main | `TauCetiRoadmap/DGFloer/README.md:621–658`, Layer 1 item 3: classical/native indexing and module-complex convergence. The reindexing matches; this design retains only the general abelian-category version. Item 2 supplies the Serre instance. |
| AlgebraicTopology on main and open #1807/#1808 | `TauCetiRoadmap/AlgebraicTopology/README.md:879` maps Stage 6 item 0 to §6.0 (`:2145`). The open versions retain the tower scope; #1807's mapping is at line 1030. Module tower algebra is Tau Ceti's; topology owns restriction and homotopy-square adapters. |
| DerivedModuleAlgebra on main | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:65,955–1012`. Owns first-quadrant double-complex convergence and the named edges. Read its introductory ownership boundary as well. No new copy of its module towers or double-complex theorem is proposed. |
| EnhancedDerivedSheaves on main and open #1630 | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, Scope and ownership; open §§E2:towers, E2.1, E2.2 (lines 1412,2157,2202). Owns enhanced derived limits and topos specialisations; imports SchemeAndStackFoundations §2.17's epimorphic-tower theorem. These are not a second arbitrary-spectral-sequence convergence package. |
| ArithmeticGaloisDuality, open #858 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:3,42`, Summary and Scope: continuous cohomology, arithmetic duality, compact coefficient and Hochschild–Serre adapters, consuming tower algebra. No general convergence carrier owned there. |
| Other cited owners on main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4184,4977` (§§2.2,2.17); `TauCetiRoadmap/ComplexKahlerGeometry/README.md:366,3317` (K8 mapping and Layer 8); HeegaardFloer filtered-complex discussion at line 1028 and MorseTheory at line 1421. These are the stated geometric/topological instances. |

The supplied overlap report has no conflicting head, dropped cited id or revision-only cited id. The main checkout has no SpectralSequencesAndConvergence folder. Resolved the two citation leads against DerivedModuleAlgebra line 65, rather than treating them as claims that Mathlib defines those names. A fresh `roadmaps resolve` reported no unresolved roadmap citation or Lean name; its explicit caveat about not checking pinned Lake packages was handled by the direct pinned-source inspection above.

Overlap check: read StableHomotopyKTheory (#1227), AlgebraicTopology (main, #1807, #1808), EnhancedDerivedSheaves (main, #1630), ArithmeticGaloisDuality (#858), and DerivedModuleAlgebra (main); exact-couple data/derivation belong to StableHomotopyKTheory, module towers to Tau Ceti with AlgebraicTopology adapters, double-complex convergence to DerivedModuleAlgebra, enhanced/topos limits to EnhancedDerivedSheaves and SchemeAndStackFoundations, arithmetic adapters to ArithmeticGaloisDuality; this design owns the general page/convergence structures and abelian-category extensions.

**Supplier order.** Read every Needs line and supplier contract. Only StableHomotopyKTheory §7.22 is an open-roadmap proof prerequisite. The other named roadmap statements are comparisons or instances on main. The dependency command returned:

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after StableHomotopyKTheory (the intake inserts it when its design is accepted)
    depcheck: 222 roadmaps, 1964 edges, 0 problem(s)

No UPWARD or CYCLE line. There is no missing supplier contract concealed as a gap. R02 is a wrong use of an existing pinned recipe, not an absent supplier.

**Headline coverage and Lean.** From the Summary, the headline families are bounded/regular stabilisation (2.2); comparison and convergence consequences including Euler, dimension, edge and five-term results (2.3,3.4–3.6); spectral-object towers, limit comparisons and range/quadrant convergence (4.1,4.3–4.6); filtered-complex convergence (5.3–5.4); exact-couple sequence and identification (6.1–6.3); and Boardman/complete convergence (7.4–7.5). This is a design submission: no `Suggested.lean` exists. There are zero sorried declarations to probe, no import/header/section-variable signature to elaborate, and no absent-package-file finding. The package must state the statable headlines after the simple tower, filtration and convergence definitions, and justify any missing carrier in its module docstring; the current missing exact-couple carrier does not justify a weakened stand-in. Elaboration and mechanical `#check` comparison: **not available (this lane does not elaborate; no Suggested.lean)**. Padding probe: not applicable here, not reported as passed.

**Source independence.** Compared the 15 sampled passages with their available locators and nine additional passages: 1.1, 1.2, 1.3, 2.3, 3.1, 3.2, 5.2, 7.3 and the Layer 3 circle-method example. Shared notation, standard short definitions and necessary hypothesis lists were distinguished from copied expression. No copied prose, clause-by-clause rewrite, table, figure or exercise collection was found. The detailed product-tail Check gives its own algebraic computation and cites the underlying example. The sources manifest contains all ten named works; no new fetch or key was needed.

Counted explicit source-key citation occurrences before References: Stacks 38, Helle–Rognes 20, Weibel 10, Boardman 5, Eilenberg–Moore 2, Bhatt–Scholze 2, Browning–Sawin 1, McCleary 1, Massey 1: 80 total. Opened Stacks' contents at stacks-012K line 7–41. Its order is filtrations (§19), spectral sequences (§20), exact couples (§21), differential objects (§22), filtered differential objects (§23), filtered complexes (§24), double complexes (§25), inverse systems (§31). This design splits §24's material between Layers 2,3,5, inserts the native spectral-object layer, and places exact couples after filtered complexes for the identification in 6.3. It does not map its layers one-to-one to that sequence. Helle–Rognes's principal interchange theorem and §§5–7 arrangement are not this roadmap's plan.

Source independence: 24 passages compared with 4 readable sources; no copied expression found; largest share stacks-012K, 38 of 80 explicit keyed citation occurrences; contents compared with stacks-012K: independent. The six settled uncertified works were not included in text-level comparison.

## Not verifiable

- weibel1994, boardman1999, eilenberg-moore1962, mccleary2001, massey1952 and cartan-eilenberg1956 remain settled uncertified. Their text, page numbering and wording could not be checked; no new request was made. Helle–Rognes corroborates Boardman 3.4(b), 5.10, 8.10 and 8.13, but not the exact numbering/text of 7.1 and 8.2.
- Lean elaboration, every declaration's elaborated binder scope, and the one-tactic probe are unavailable in this design lane. No Lean process was started.
- The legal cached source versions were checked, not a separate published edition of each preprint. In particular the manifest already records Browning–Sawin's preprint/journal numbering limitation.

## Source issues

- **Misprint** in stacks-012K at Lemma 24.13, proof of (24.6.2), printed page 67 (line 3229–3232): the source says the boundary equality follows from a cohomology isomorphism in degree n−1; it should be injectivity in degree n, using its corresponding eventual bound; affects the proof.

The same misprint was recorded previously and was rechecked: `K=(ℤ→id ℤ)` and the subcomplex `(0→ℤ)` have identical degree-0 cohomology, but in degree 1 the subcomplex's boundaries are 0 while `im d∩F K¹=ℤ`. The roadmap correctly uses degree-n injectivity.

## For the human reviewers

- The six works listed under Not verifiable are deliberately retained as uncertified in `packages/SpectralSequencesAndConvergence/sources.toml`; their text-level wording and numbering checks remain outside this review's evidence. The largest-share source, Stacks, was readable and its contents were compared.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9e28545f1e8fda13a1da356daab37247d1b8527b", "job": "REV-DESIGN-SpectralSequencesAndConvergence~6", "model": "gpt-6-astra", "worker": "chris-8"} -->
