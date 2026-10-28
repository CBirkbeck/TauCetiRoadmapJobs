<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1599#issuecomment-6398271922 -->
Review (codex) of 6875d07

Verdict: needs_changes

1. **F01** (P1) Twenty active gaps have no supplier contract

   **Location:** `packages/StableReductionPartII/design/plan.json:32455`, beginning with `"slug": "parent-and-foundational-stage-imports-remain-open"`; compare `packages/StableReductionPartII/README.md:40`, “Exact supplier contracts”.

   **Claim:** The recorded prerequisites form owned, intake-readable supplier contracts.

   **Witness:** Of 37 plan gaps, 20 have no `supplier`, `section` or `needs` field and no matching `gap:<slug>` in the README; only the other 17 have both records.

   The affected slugs are:

   - `parent-and-foundational-stage-imports-remain-open`
   - `picard-supplier-composition-and-arbitrary-base-descent`
   - `strong-torelli-owner-extension`
   - `full-level-rigidity-source`
   - `teichmuller-and-mapping-class-inputs`
   - `tame-normalized-level-component-comparison`
   - `generic-positivity-and-ampleness-supplier-extension`
   - `surface-positivity-inputs`
   - `line-valued-determinants-and-deligne-pairing`
   - `all-characteristic-compactified-torelli`
   - `pointed-noetherian-to-arbitrary-base-passage`
   - `rigid-genus-one-locus-and-boundary-normalization-details`
   - `suggested-lean-type-interfaces`
   - `source-locator-and-published-version-collation`
   - `reusable-stable-reflexivity-interface-and-two-base-completion`
   - `arbitrary-base-moduli-foundations-and-tricanonical-frame-comparison`
   - `coherent-deformation-ext-supplier-scope`
   - `expansion-formal-proj-and-flatness-transfer`
   - `integral-boundary-normalization-and-deformation-line-descent`
   - `integral-parameter-family-generation-and-fixed-line-ampleness`

   **Exact repair:** Reconcile every entry against the 17 newer contracts and current suppliers. For each remaining mathematical obligation, give an earlier owner, exact section and independently testable hypotheses/conclusion, and put the same slug under that supplier in the README. Record a crosswalk for obligations already discharged by named targets; eliminate duplicate active obligations through the permitted gaps-list reconciliation. Source acquisition and Lean-inventory bookkeeping are not mathematical supplier contracts. Replace unresolved request aliases in consuming Needs clauses with the resulting exact contracts. Do not require implementation of an otherwise valid declared gap before conditional acceptance.

   **Repair test:** Joining plan slugs to README `gap:` occurrences currently gives 20 unmatched records; joining those records to named suppliers gives zero owners. The repaired inventory must give zero unmatched active gaps and zero ownerless mathematical prerequisites. R04 identifies concrete already-owned parts; a blanket new foundational owner would not repair minimality.

2. **F02** (P1) The cited arithmetic-moduli sections do not supply one-gons

   **Location:** `packages/StableReductionPartII/README.md:8936` and `:8942`, “Import properness, smoothness, DM and the one-gon cusp from the arithmetic-moduli nodes”.

   **Claim:** AlgebraicModuliForArithmeticGeometry §§7.3, 8.1–8.3 supplies the imported generalized elliptic one-gon stack and its integral properties.

   **Witness:** `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:140` excludes generalized elliptic curves; §7.3 concerns Picard carriers and §§8.1–8.3 framing, effectivity and completion. `TauCetiRoadmap/ModularCurvesPartII/README.md:798` supplies the polygon-count stacks instead.

   These sections were read at the supplied open-head copies, not inferred from names. The missing one-gon input is written as supplied, rather than as a corresponding declared gap.

   **Exact repair:** Import ModularCurvesPartII §§2.1–2.3 and 2.11, especially `polygonCountStack` with polygon count one, and update Scope, supplier contracts and §2.482 Needs. Keep only the comparison from stable one-pointed genus-one families to that existing groupoid here. Use the existing Weierstrass/group-law inputs at their actual owners. Do not construct generalized elliptic curves again.

   **Repair test:** At polygon count one, the supplied stack is proper, smooth, dimension one and DM over Z; its cusp inertia is the constant C₂. Over an algebraic closure of F₂ that group has two geometric elements, whereas μ₂ has one. Thus the corrected supplier gives precisely the stated B(C₂) boundary, including characteristic two.

3. **F03** (P1) Individual marking bounds do not make collision discrepancies nonnegative

   **Location:** `packages/StableReductionPartII/README.md:9425`, “retaining 0≤a_i≤m so pushforward comparisons through exceptional curves have the required nonnegative exceptional coefficients”.

   **Claim:** The individual weight inequalities suffice for the asserted nonnegative exceptional-divisor comparison during marked-surface modifications.

   **Witness:** Blow up a collision of two sections with m=2 and a₁=a₂=2. The exceptional coefficient is m−a₁−a₂=−2; the relevant pushforward is I_p², not O.

   Here is a complete projective instance. Let B=P¹, S=P¹×B, D₁ the constant zero section and D₂ the diagonal. They meet once at p=(0,0). After blowing up p their strict transforms are disjoint smooth-locus sections of a nodal family with smooth genus-zero generic fibre. Before blowing up,

   `ω_(S/B)^2(2D₁+2D₂) = O_S(0,2)`.

   For b:S′→S with exceptional E, the corresponding line is

   `b*O_S(0,2) ⊗ O_(S′)(−2E)`.

   Consequently the two direct images on B are respectively O_B(2) and O_B(2)(−2[0])=O_B. Their degrees are 2 and 0. Both are nef: this refutes the stated transfer step, not the final nefness theorem. The README's own contract at line 72 already records the correct coefficient m−Σaᵢ.

   **Exact repair:** Remove the implication from individual bounds to nonnegative discrepancy. State and use the actual exceptional coefficient and ideal-twisted pushforward in the negative case, with a precise supplier comparison sufficient for the nefness argument, or give a justified route avoiding that transfer. Preserve the full weight range; adding Σaᵢ≤m to the final theorem would improperly narrow it. Add the displayed collision as a negative-control Check.

   **Repair test:** The corrected formula gives −2 and b_*O(−2E)=I_p² in this instance, hence degree 0 after pushforward rather than the erroneous degree 2 identification. A remaining nefness-transfer obligation must be owned explicitly; the corrected formula alone is not a proof of that obligation.

4. **F04** (P2) Supplier gaps ask for objects already owned upstream

   **Location:** `packages/StableReductionPartII/README.md:64`, “Provide effective fppf descent of proper flat finitely presented schemes with a specified relatively ample line and its actual cocycle”; also the plan gap `generic-positivity-and-ampleness-supplier-extension`.

   **Claim:** These constructions still require new supplier extensions.

   **Witness:** `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1715` states `ModuliDescent.polarizedDescentComparison` over arbitrary bases, with actual line cocycles, sections and coherent pullback. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5826` and `:5851` already own generic nefness operations and determinant-quotient ampleness.

   The first supplier theorem assumes proper finite presentation and a relatively ample invertible sheaf. Flatness descends separately under the same fppf cover; it does not require another polarized-descent construction. The positivity target explicitly includes curve-test nefness, quotients, extensions, symmetric powers, finite pullback/descent and the Grassmannian argument. Thus the older gap's assertion that this supplier only has intersection/GRR is stale. Likewise the older Picard-gap description of normalization as only a DVR statement is superseded by the arbitrary geometric nodal-curve target at `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:1901` (§4.1).

   **Exact repair:** Cite these exact existing targets and remove their content from the active requests. Retain only a precisely stated residual comparison or genuinely stronger hypothesis range. Reconcile the corresponding plan entries and README contracts together. Ordinary exterior determinants, parity-graded ring determinants and their geometric extensions must also remain distinct.

   **Repair test:** The polarized descent statement covers the constant polarized P¹ over k[ε]/(ε²), with its actual O(1) cocycle, without a reduced-base assumption. The existing nefness criterion rejects O(−1): its quotient degree is −1 and after a finite cover of degree e it is −e. The existing nodal normalization target covers the rational curve with two self-nodes: toric rank 2, abelian rank 0. No new generic construction is needed for these cases.

5. **F05** (P2) The surface gap omits essential hypotheses and combines unrelated inputs

   **Location:** `packages/StableReductionPartII/README.md:72`, “Provide the positive-twist pluricanonical surface bound h¹≤1 including characteristic two and m=2, the smooth-generic general-type criterion, crepant and exceptional pushforward comparisons and marked-collision transport”.

   **Claim:** This is a precise single supplier contract for the surface input.

   **Witness:** `clm line 918` requires a smooth projective minimal surface of general type and a reduced effective Cartier divisor with genus-at-least-two connected components and trivial normal line. None of these appears in the gap's bound.

   The missing range matters. For S=C×P¹ with C smooth of genus two, D=C×{point}, and m=2, D has genus two and trivial normal line but S is not of general type. Künneth gives

   `h¹(S,ω_S²(D)) = h⁰(C,ω_C²) h¹(P¹,O(−3)) = 3·2 = 6 > 1`.

   **Exact repair:** Make the vanishing contract state the full hypotheses of the cited Lemma 6.4: over an algebraically closed field, smooth projective minimal general-type S, the stated reduced Cartier D with trivial normal line, and m≥2; the bound is zero unless characteristic two and m=2, when it is at most one. Split the general-type criterion, crepant/pushforward comparisons and marked-collision transport into separately quantified contracts with named earlier owners and matching plan/README slugs. The latter must use the actual coefficient from R03.

   **Repair test:** The corrected vanishing contract excludes C×P¹ because it is not general type. It retains the exceptional characteristic-two, m=2 bound of one instead of incorrectly demanding vanishing there.

6. **F06** (P2) A native finite tensor equivalence is planned again

   **Location:** `packages/StableReductionPartII/README.md:3961`, “Construct cₙ:Qₙ⊗_Â N≃ₗ[Â](Fin(r)→Qₙ), exactly the pinned TensorProduct.piScalarRight equivalence.”

   **Claim:** The finite-coordinate construction and its pure-tensor/inverse-single formulas are targets owned here.

   **Witness:** `Mathlib/LinearAlgebra/TensorProduct/Pi.lean:163` defines `TensorProduct.piScalarRight`; lines 139 and 175 already give the displayed pure-tensor and inverse-single formulas, for any finite index type.

   **Exact repair:** Delete the duplicate construction and imported API bullets as roadmap targets. Cite those declarations in Scope/supplier contracts. If §2.188 is retained, make its target only the new compatibility with this roadmap's quotient-transition diagram and say explicitly what differs. Use the existing equivalence directly. The same audit should distinguish the native completion transition law (`AdicCompletion.transitionMap_comp_eval_apply`) from the specialized comparisons built on it.

   **Repair test:** For rank two, q=3 and coordinates (2,3), both constructions give (6,9); the native inverse gives 6e₀+9e₁ in tensor coordinates. Rank zero gives the unique zero element and rank one gives 6. There is no difference to justify a second finite-coordinate construction. This finding concerns README ownership; it is not a request to add or prove a padding theorem in Suggested.lean.

7. **F07** (P3) Compatible-Hom Checks also accept the zero submodule

   **Location:** `packages/StableReductionPartII/README.md:4029`, “the actual transition from level2 to level1 takes h₂(x) to h₁(x)”, followed by zero evaluation and pointwise extensionality.

   **Claim:** These three Checks discriminate the intended compatible-Hom carrier from plausible wrong carriers.

   **Witness:** Replace H_L by its zero submodule. Transition compatibility, zero evaluation and extensionality all still hold, although the nonzero compatible multiplication family is missing.

   **Exact repair:** Keep the laws as API, but replace the Checks with three explicit positive/negative instances. Take A=Z, p=(2), R=Z[u,v]/u², completion ideal (2), N=Z₂ and L=R. Use (i) multiplication by 5 modulo 2ⁿ, whose value at 1 is 1 modulo 4; (ii) an incompatible family with h₁(1)=0 modulo 2 and h₂(1)=1 modulo 4; (iii) the compatible multiplication families 5 and 1, equal through level two but different at level three.

   **Repair test:** The first excludes the zero submodule; the second fails compatibility because 1≠0 modulo 2; the third gives 5≠1 modulo 8 and excludes a carrier or equality test retaining only the first two levels. These use finite free coefficients, hence satisfy the stronger API range stated in §2.190. Similar API-restatement Checks occur in §2.188 and should be removed with R06.

8. **F08** (P3) Several sampled locators do not locate the claimed result

   **Location:** `packages/StableReductionPartII/README.md:4622`, `:5883`, `:6883`, “Mathlib modules named in the prerequisites”; also `:3318` and `:4107`.

   **Claim:** These citations locate the theorem or derivation precisely enough to verify its hypotheses.

   **Witness:** There are 93 occurrences of the generic Mathlib phrase. The full Corollary 3.2 proof cited at §2.193 ends on page 13 (`knudsen2012 line 524`), outside the stated pages 11–12.

   **Exact repair:** For native facts give exact pinned declaration and file; for a new diagram calculation say it is a deduction and identify the precise input declarations and local earlier results. For example, the transported scalar tower has `LinearEquiv.isScalarTower` in `Mathlib/Algebra/Module/TransferInstance.lean:95`. Give §2.152 its actual §3 pages 11–13, distinguishing the polynomial argument from the completed corollary. Correct §2.193's full-corollary range to pages 12–13, or cite only the specific multiplication formulas on page 12 actually used. Apply this repair to the other generic locators rather than claiming Knudsen states native categorical API formulas.

   **Repair test:** The corrected locator reaches the end of Corollary 3.2 at line 524. The multiplication identity needed for K is at lines 484–508; the tower lemma has the actual transported action in its type. The sampled formulas themselves passed the computations below.

9. **F09** (P3) Stale process prose contradicts the delivered Lean and pin

   **Location:** `packages/StableReductionPartII/README.md:3967`, “All eight geometric stages remain partial”; `:9576`, “The suggested file states this arithmetic test”; `:10464`, “this does not require its missing inverse operation”.

   **Claim:** The README accurately describes its acceptance file and native line-class interface in timeless mathematical language.

   **Witness:** Suggested.lean contains two polynomial headline theorems, no transvection test. `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:95` supplies inversion and `:142` a CommGroup instance; inversion is not missing.

   **Exact repair:** Replace status narration and obsolete admitted-sketch/opaque-constructor descriptions around lines 8059–8131 with mathematical scope and exact contracts. Remove the claim that the transvection Check is in Suggested.lean; do not add it there. Correct line classes to the pinned commutative group, citing `inv_mk`. Consolidate the 74 repetitions of the eight-stage status sentence into the appropriate scope boundaries, without process language or historical source-issue identifiers.

   **Repair test:** Tensoring the classes of O(1) and O(−1) on P¹ gives the identity class using the native inverse. The level-four transvection still has T² off-diagonal entry 2 and T⁴=I as a README Check; the acceptance file remains limited to its two deep polynomial statements.

10. **F10** (P3) The numbered build is not in dependency order

   **Location:** `packages/StableReductionPartII/README.md:381`, §1.1 Needs §1.6; also §2.453 Needs §§2.471, 2.473–2.474 and §5.3 Needs §5.18.

   **Claim:** The displayed layers and targets form the promised build order.

   **Witness:** Resolving all internal Needs anchors gives 1,361 distinct edges, zero missing targets and zero cycles, but 34 edges to later numbered targets. This is separate from the clean inter-roadmap dependency check.

   **Exact repair:** Topologically order the targets within each layer, then update numbering, anchors and internal references consistently. Do not remove genuine proof prerequisites. The explicit sentence allowing Needs clauses to override numerical order does not meet the required build-order shape.

   **Repair test:** Moving the generic criterion currently at §1.6 before its consumer §1.1 removes that witness. A topological ordering exists because the graph is acyclic. Re-resolving the same graph after reordering must preserve all dependencies and give zero forward edges. No supplier move is required by this finding.

Ten findings: three P1, three P2 and four P3. The package is a legitimate continuation of StableReduction and is repairable. The principal defects are ownership/contract errors and an incorrect exceptional-divisor inference in a proof route. Neither of the two Lean headline statements was refuted. No earlier independent review was supplied.

## Verified sound

The following is bounded evidence for the mathematical and mechanical checks, not a claim that the incomplete supplier proofs have been supplied.

**Coverage and principles.** Read the 598 numbered primary claims and hypotheses (layer counts 7, 16, 487, 14, 16, 21, 22, 15), the 156 numbered-target Checks blocks plus three convention/supplier Checks blocks, and 511 distinct proof-route paragraphs; repeated coefficient/setup paragraphs were compared once and their use tracked. Read StableReduction, AlgebraicVectorBundles and ModularCurves on main for ownership and house shape. Checked all target Needs clauses and the supplier-contract section. The continuation does not replace the parent roadmap. No route-specific prime exclusion, computational algorithm, copied source passage, sorry-defined data or `set_option` was found in the delivered Lean file. The local algebra explicitly includes the zero ring and repeated roots; geometric nodality is separately qualified. No proposed fix should reduce the general library to good-prime or smooth-only cases.

The report records the mandatory sampled, headline and finding witnesses below. Reading a statement, checking a numerical instance and proving a general theorem are different: this review does not claim the computations prove the geometric targets or every API identity. There is no blanket soundness certification of the 598 targets.

**Exact pins and elaboration.** The supplied content checkout was main at `35c9f96d09370061f84422fd640552aaf1609e8d`; its manifest pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Ran the requested `lake env lean` on the package Suggested.lean from that checkout: exit 0, only the two expected declaration-uses-sorry warnings at lines 79 and 95. No additional module build was needed: the file imports only Mathlib.

A separate scratch copy with `#check @name` for all seven declarations elaborated. Compared every printed type with the README: no lost binder and no changed signature. The five real definitions retain A, its CommRing structure and γ,δ,s,t. Universal exactness retains an arbitrary A-module N in its own universe, with no flatness assumption. Both ordinary reflexivity conjuncts use the actual quotient ring, section ideal and ring-linear dual. The finite-projective/noetherian restrictions in other README completion statements are not silently assumptions of these two polynomial theorems.

Each sorried theorem was tried with `simp`, `rfl` and `infer_instance` on a scratch copy; all probes failed. Object searches and the pinned declarations below did not reveal a single exact library theorem closing either whole statement. Dual reflexivity alone follows from reflexivity of J, but the conjunction still contains the substantive section-ideal theorem. No padding declaration was identified. There are no admitted examples, extra imports, `lemma` declarations or sorry-defined data. The file has 104 lines.

**Headline coverage.** The README summary, local headline declarations and geometric end results give the following acceptance inventory.

| Headline | Acceptance status |
|---|---|
| Polynomial section complex, both directions and transposes, universally exact over arbitrary coefficient modules | `nodeSection_universallyExact`, Suggested.lean:79; native carriers, not a weakened substitute |
| Actual polynomial section ideal and its dual reflexive | `pointedSection_reflexive`, Suggested.lean:95; native canonical bidual evaluation |
| Formally versal pointed-node hull | Named unstatable in module docstring: missing nodal deformation groupoids/formal hull interface |
| Relative stable reflexivity, arbitrary-coefficient Hom/Ext and completed-local transfer | Named unstatable: coherent sheaf Ext and the required completed comparison interfaces |
| Expansion–contraction and unrestricted universal curve | Named unstatable: stable pointed families, their moduli stacks and expansion-sheaf relative Proj |
| Decorated boundary normalization and smoothing conormal descent | Named unstatable: clutching, stack normalization and marking cotangent lines |
| Connected fine symplectic curve level | Named unstatable: polarized relative Jacobian, level moduli and dual/Tate-twist comparison |
| Integral Noether line isomorphism | Named unstatable: stable moduli, Hodge pushforward, determinant of cohomology and Deligne pairing |
| Stable compactification after finite base change | Named unstatable: stable-family/classifying-stack carriers |
| Compactified Torelli and Hodge nefness/bigness | Named unstatable: relative Jacobian, Siegel minimal compactification, Torelli and positivity interfaces |
| Degree-Picard parameters, lifting obstruction/torsors and infinitesimal Hodge comparison | Named unstatable: relative Picard and stack cohomology interfaces |

The pin has schemes, a generic stack predicate and a weak curve-family predicate; none alone is the missing stable-family moduli carrier. The two polynomial results are explicitly independent headlines. No missing statable headline or geometric stand-in was demonstrated.

**Computed adversarial witnesses.** Notation for the table: R=A[u,v]/(q(u,v)−q(s,t)), q(X,Y)=X²+γXY+δY², c=u−s, d=v−t, b=u+s+γt, a=δv+δt+γu. Then Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), J=(c,d), D=Hom_R(J,R). In the repeated-root fixture γ=δ=s=t=0, R=A[v,u]/u², ε(u)=0, ε(v)=u. The coefficient-completion fixture has A=Z, p=(2), the same R, completion ideal (2), Â=Z₂, N=Â and Qₙ=(Z/2ⁿ)[v,u]/u². Only constant elements are used in its finite numerical rows; R̂ is not identified with the polynomial ring over Z₂.

| Statement / convention | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Polynomial equation and Φ, Ψ definitions; both local headlines | Symbolic γ,δ,s,t, no division | Before quotient, ΦΨ=ΨΦ=(q(u,v)−q(s,t))I₂; both off-diagonals 0. After quotient all four entries 0 | Correct factorization and signs; zero product alone is not used as exactness |
| Universal exactness, Φ then Ψ | Repeated root over F₂, F₃, Z/4; also coefficients M=Z/2 over Z | ker Ψ=im Φ={(uα,vα+uβ)}; Φ(−β,α)=(uα,vα+uβ) | Monic normal forms give exactness even for nonflat coefficients |
| Universal exactness, Ψ then Φ | Same rings/modules | ker Φ=im Ψ={(vα+uβ,uα)}; Ψ(α,−β)=(vα+uβ,uα) | Correct |
| Transpose exactness / §2.340 | Same fixture | ker Ψᵀ=im Φᵀ={(uα,−vα+uβ)}; Φᵀ(β,−α) gives that pair. ker Φᵀ=im Ψᵀ={(−vα+uβ,uα)}; Ψᵀ(−α,β) gives that pair | Correct, including characteristic two |
| Universality boundary | Zero ring, zero module; then inadmissible chart specialization u=v=0 over a field | Zero cases: image=kernel={0}. Arbitrary R-specialization gives zero matrices with kernel k² and image 0 | README correctly promises A-coefficient universality, not every chart-ring base change |
| Rotation convention | p(x,y)=(−y,x), vector (1,0) | pΨ=Φᵀp and pΦ=Ψᵀp; p²(1,0)=(−1,0) | Correct; replacing p by an involution would lose the sign |
| Ordinary reflexivity headline / §2.152 | F=η(v) and F=0 in repeated-root ring | F(incl)=v, F(ε)=u; ψ(F)=v; ηψ(F)=F. Zero gives 0 on both sides | Correct inverse direction; dual reflexivity follows from the native dual-reflexivity interface |
| Geometric discriminant versus polynomial theorem | (p,γ,δ)=(2,1,0),(2,0,−1),(3,0,−1),(4,0,0) | γ²−4δ is respectively 1,0,1,0 | Geometry distinguishes the degenerate forms; polynomial headline does not exclude them |
| §0.6 unrestricted extra section | Stable (0,3), old-mark collision; nodal curve and extra section at node | M̄₀,₄ has dimension 1; three old marks give three boundary points. At a node the unrestricted fibre contains that node; the smooth-only fibre omits it | Supports unrestricted universal curve; old-mark-disjoint and smooth-only wrong models excluded |
| §2.73 projection kills coefficients | P(r)=r−ι(ev r), r=1,u with s=t=0 | P(ι1)=1−1=0; P(u)=u. Also P(u·1)=u whereas uP(1)=0 | Correct A-linearity; it is not falsely R-linear |
| §2.132 relations of dual surjection | P_D(z)=z₀incl−z₁ε, repeated-root Φ columns | P_DΦ(e₀)=uε=0; P_DΦ(e₁)=u incl−vε=0. Replacing minus by plus gives value 2uv at v over Q | Correct sign and relations; zero map is excluded by P_D(e₀)(v)=v |
| §2.193 correction identity | K=εP, r=v² | dK(v²)=v·uv=uv²; b(v²−ιev(v²))=u·v²=uv² | Formula sound; locator repair R08 |
| §2.226 Hom transition equation | hₙ multiplication by 5, levels 2→1 | [5] modulo 4 is 1; its reduction modulo 2 is 1=h₁(1) | Correct; absent precise native locator is R08 |
| §2.253 inverse finite comparison, all transitions | 3⊗5, levels 2→1; also 3⊗5+2⊗7 | Product 15 reduces 3→1 on both routes; sum 29 reduces 1→1 on both routes. Level 0 gives 0 | Correct; does not prove infinite arbitrary-module interchange |
| §2.263 coefficient-map projection square | Coefficient map ×3, compatible constant 5, level 2 | Both routes give [15]=3 modulo 4 | Correct |
| §2.279 completed coefficient balancing | Scalar 3, tensor factors 5 and 7 | (3·5)·7=5·(3·7)=105; both images at level 2 are 1 | Correct after the specified comparison map; no injectivity of original-base tensor map inferred |
| Original-base versus completed-base tensor distinction | In the completion fixture take α=√17 in Z₂, α not in Q, and N=Z₂ | α⊗1−1⊗α maps to 0 in R̂⊗_(Z₂)Z₂ but is nonzero over Z: evaluation into Z₂ and rationalization give two independent Q₂⊗_Q Q₂ basis terms | Confirms why §2.279 must not assert injectivity of this map, even for rank-one completed coefficients |
| §2.300 DiagramIso hom on pure tensors | 3⊗5, level 2 | Both sides are the same pure tensor, identified here with [15]=3 | Correct native tensor formula; locator R08 |
| §2.359 transported coefficient scalar tower | Scalars 2,3 and compatible constant 5 | 2·(3·5)=(2·3)·5=30; both projections modulo 4 are 2 | Correct; exact native transport lemma exists |
| §2.368 adjacent section Hom pairs | Repeated-root ring, all parities of the periodic resolution | The four kernel/image sets above alternate; even and odd pairs have equal kernel/image. With zero coefficient module both are {0} | Correct after coefficient-universal exactness, rather than mere zero composition |
| §2.424 original-base projective projection square | N=Â and constant 5; rank 0; projective summand e(Â×Â), e=(1,0) | Level-2 projection 1=1; rank 0 gives 0=0; varying-rank summand gives e=e modulo 4 | Correct finite-projective range, including nonconstant global rank |
| §2.461 stable reflexivity | (Z/4)² versus Z-module Z/2 | Free case: bidual map identity on 16 elements and positive Ext zero. Z/2 over Z: dual=0, double dual=0, Ext¹=Z/2 | Correct definition separates reflexivity/Ext from mere finite generation |
| Formally versal node / chart-flatness headline | xy=a; a=0 and a=ε over k[ε]/ε² | Basis 1,xⁱ,yʲ survives; xy=ε, ε²=0. Singular locus for a=ε is Spec k, not all Spec k[ε]/ε² | Flatness does not require a non-zero-divisor; node incidence is not automatically étale |
| Expansion–contraction and universal induction | Mark collision; nodal bridge; F₂ | Tail attaches at [1:−1], which is [1:1] over F₂, distinct from [1:0],[0:1]. For xy=t, eliminating t leaves independent x,y | Correct three special points and dimension increase 1 |
| Tricanonical frame comparison | g=2 | Rank 5, ambient dimension 4, degree 6, P(1)=5. Sym² rank 15, H⁰(ω⁶) rank 11, kernel rank 4 when multiplication is onto | Correct ranks; a base-line twist remains necessary |
| Genus-one triangle and one-gon | M̄₂,₂ dimension 5; smooth versus nodal attached genus-one curve | Four fixed internal/attachment nodes leave dimension 1; nodal genus-one boundary adds a fifth parameter. One-gon cusp inertia has order 2 | Correct codimension four, not three; supplier repair R02 |
| Boundary normalization and conormal | x′=2x,y′=3y over Q; branch exchange; xy=ε | t′=6t; dx′⊗dy′=6(dx⊗dy). Branch exchange factor +1. Persistent-node base is Spec k for ε, whole base for zero | Correct conormal, rather than normal with factor 1/6; integral incidence needs its stated contract |
| Hodge and residue signs | Ranks (1,1),(1,2); two branch residues | Hodge swaps −1,+1; conormal swap +1,+1; residues (r,−r) become (−r,r) | Correct distinct conventions |
| Fine full-level and connectedness headline | N=2 versus 3; characteristic 2 with N=3; N=4 transvection | −1=1 modulo 2 but −1≠1 modulo 3. T² has off-diagonal 2 modulo 4, T⁴=I; T order 4 | Level-two rigidity is excluded; boundary cover need not be étale; R09 only removes false Lean claim |
| Coarse-line power / nonabelian stabilizers | B(S₃) over F₃, with sign-character line; compare B(C₂) | A transposition acts by −1=2, a three-cycle by 1; square character is 1 on both. Atlas degree is 6 although 3 divides 6 | A positive power descends while the original sign line does not; no tame-stabilizer-order assumption introduced |
| Integral Noether/determinant headline | P¹ line bundles; identity two-term complex; nodal thicknesses 2,5 | Determinant grades for O(1),O,O(−2): 2,1,−1; identity complex grade 0. Boundary contribution 2+5=7; rank-zero determinant O | Correct grading and multiplicity controls; not a proof of the global line isomorphism |
| Deligne pairing symmetry | O(1) with O(1) on P¹; dualizing degree | Interchange sign (−1)^(1·1)=−1; dualizing sign (−1)^((2g−2)²)=+1 | Correct graded permutation; ordinary symmetric interchange would lose the first sign |
| Stable compactification / pullback headline | Trait smoothing xy=π; ramified π=τᵉ; empty boundary | Thickness 1 becomes e, and Cartier order is e on both descriptions; empty boundary contributes 0 | Correct ramified versus unramified convention; existence still consumes stable reduction and descent |
| Torelli headline | Smooth genus 2 versus nonhyperelliptic genus 3; rational two-nodal curve; compact type E₁∪E₂ | Hyperelliptic involution realizes −1 in genus 2; nonhyperelliptic ± levels give two curve-level classes. Abelian/toric ranks are (0,2) and (2,0) in the two boundary cases | Correct sign distinction and abelian quotient; no global finite compactified Torelli conclusion inferred |
| Hodge nefness/bigness headline | Constant family over positive-dimensional base; finite inseparable curve cover; zero-dimensional base | Constant λ has degree 0 and variation 0; degree under inseparable degree-p pullback is p·deg λ; dimension-zero top degree is 1 | Maximal-variation condition excludes the constant positive-dimensional counterexample |
| Picard parameter and lift-torsor headline | Constant genus-two family over P¹; field; dual numbers | L and L⊗O(1) have same relative class but absolute difference 1 in Pic(P¹)=Z. Pic(k)=0. First-order relative lift space has dimension h¹(O_C)=2 | Correct sheaf/class versus actual-lift distinction |
| Obstruction/torsor and scalar inertia | Nonempty lifts indexed by n,m∈Z; no lift; trivial line over dual numbers | Difference is m−n; action is free/transitive only on nonempty fibre. Scalar automorphisms include 1+εk | Correct; empty obstruction fibre is not called a torsor |
| R03 marked collision route | Two weights 2, m=2, blow-up of the described ruled surface | Exceptional coefficient −2 versus claimed nonnegative; direct-image degrees 0 versus 2 | False step; exact repair R03 |
| CLM Corollary 6.6 proof | Blow up a constant smooth genus-two family at a point on its section, creating a rational tail carrying the mark; m=2 | On the tail ω⁻¹(mark)=O(2); sections vanishing at the attachment have dimension 2. Thus h¹(ω²(−mark))=2, versus claimed 0; without the mark twist h¹(ω²)=1, again not 0 | The blanket vanishing step is false; README correctly uses the evaluation image instead |
| R05 surface contract | C₂×P¹, D=C₂×{point}, m=2 | h¹=3·2=6 versus requested bound ≤1 without hypotheses | Under-specified; exact repair R05 |
| R06 finite coordinates | Rank 0,1,2; q=3, z=(2,3) | Native and planned outputs: 0; 6; (6,9) | Duplicate construction; retain only distinct transition compatibility |
| R07 compatible-Hom carrier | Multiplication families 5,1; zero submodule; incompatible first two levels | Both first families give 1 modulo 4, but 5 versus 1 modulo 8; incompatible pair reduces 1 versus 0 modulo 2 | Existing Checks insufficient; three discriminating replacements given |
| R09 absolute line classes | O(1),O(−1) on P¹ | Product class 0 in Pic(P¹)=Z; inverse of 1 is −1 | Native group already exists |

For the general polynomial exactness route, the cancellation input is monicity in X of q(X,Y)−q(s,t) on M[Y][X], valid for every A-module M, not domain cancellation or invertibility of the discriminant. The explicit matrix products and rotations were also recomputed symbolically in scratch. In the repeated-root rows α and β range over the polynomial coefficient module; hence the displayed sets are kernel/image descriptions, not just a handful of selected vectors. Completion rows test both zero level and nontrivial levels, preserve A versus Â, and use finite projective coefficients only for the asserted limit interchange.

**Seeded source verification.** All 15 requested targets were inspected against the supplied cached texts and, where appropriate, the actual pin. A locator into a motivation is not treated as a theorem about a newly authored native diagram. No author-marked unverified item requiring a new fetch was identified beyond the two settled uncertified works below.

| Target | Text actually read, locator and hypothesis comparison | Outcome |
|---|---|---|
| 0.6 | `knudsen2 line 115`, Definition 1.2, printed p.164; `knudsen2 line 595`, Corollary 2.6, p.179; `knudsen2012 line 45`, introduction pp.1–2 | Extra section is unrestricted, morphisms retain the family identification; source supports the intended groupoid/universal-curve formulation |
| 2.73 | `knudsen2012 line 484`, §3/Proposition 3.1, p.12, with setup at line 410 | Projection formula is an elementary authored deduction from evaluation and its section; not asserted to be the literal source theorem |
| 2.132 | `knudsen2012 line 415` through line 508, §3, pp.11–12 | Matrices, presentations and multiplication dual agree; source has Noetherian/discriminant hypotheses, while README supplies a distinct monic proof route for arbitrary A |
| 2.152 | `knudsen2012 line 484` through line 508, p.12; Corollary 3.2 ends at line 524, p.13 | Bidual inverse is an authored deduction using previously proved membership; mathematics passed, locator needs pages (R08) |
| 2.193 | `knudsen2012 line 488`, multiplication formulas, p.12; full Corollary 3.2 at lines 509–524, pp.12–13 | Correction identity follows from dε(j)=bj. Stated full-proof page range is incomplete (R08) |
| 2.226 | Native compatible-family submodule plus §2.190; generic Mathlib citation only | Formula is the actual defining compatibility; no precise external locator supplied (R08) |
| 2.253 | `knudsen2 line 1062`, Appendix Proposition 6, pp.194–195, and Proposition 7 at line 1072, p.195 | The source is a two-base completion result, not this finite tensor equivalence. README labels the latter a deduction; p finitely generated and both scalar rings are retained |
| 2.263 | Same Appendix Proposition 6; native tensor-map formulas in Mathlib | Square follows by tensor naturality on pure tensors and additivity; no arbitrary-module completion theorem inferred |
| 2.279 | Knudsen II Appendix Definition 1/Theorem 2, pp.191–193, and Proposition 6, pp.194–195 | Source supports the surrounding relative/completed problem; displayed balancing is an authored tensor calculation. It is only an equality after the specified map |
| 2.300 | Native tensor-map action on pure tensors | Formula passed; citation says only Mathlib modules, so exact locator required (R08) |
| 2.340 | `knudsen2012 line 415` through line 481, §3, pp.11–12 | Rotation and transpose identities agree. The arbitrary-coefficient extension is proved by the proposed monic route, not borrowed without source hypotheses |
| 2.359 | `Mathlib/Algebra/Module/TransferInstance.lean:95`, `LinearEquiv.isScalarTower` | Exact scalar-tower transport exists; name/file should replace generic locator (R08) |
| 2.368 | Knudsen §3 exact matrix sequences, `knudsen2012 line 507`; completion separated in §4 | Parity of the Hom complex uses the actual transposes; arbitrary coefficients rely on local universal exactness, not completion flatness alone |
| 2.424 | Knudsen Appendix Proposition 6 plus native limit projections and finite-projective retraction | Special comparison is not directly a printed Knudsen theorem; correct finite-projective and finitely-generated-ideal qualifications retained |
| 2.461 | `ile line 268`, Definition 3.1/Remark 3.2, p.6; Definition 3.4/Proposition 3.5 at lines 286–302; Proposition 4.3 at lines 416–447, pp.9–10 | Reflexivity plus all positive Ext vanishings, finite/coherent relative assumptions and shifted dual convention agree; no unjustified arbitrary completion comparison follows |

The Knudsen II printed p.195 scan was inspected because OCR drops completion hats. Proposition 6 has both the chart completion and coefficient completion; the README correctly distinguishes them. The Knudsen 2012 p.12 scan was also inspected for the colon notation, and the CLM p.25 image was inspected to distinguish a reversed pushforward subscript from a pullback assertion. Source issues found during these readings are recorded below. The arbitrary-ring polynomial results are stronger than Knudsen's initial nodal setup, but their independent coefficient/monic route is explicit; this is not a source-based missing-hypothesis finding.

**Pinned declarations opened, by object.** Paths below are within the corresponding pinned library, not a newer release.

| Object | Declaration and file/line opened | Scope checked |
|---|---|---|
| Tensor finite coordinates | `TensorProduct.piScalarRight`, `Mathlib/LinearAlgebra/TensorProduct/Pi.lean:163`; pure-tensor formula :139; inverse-single :175 | Finite index type, compatible scalar structures; construction already exists (R06) |
| Tensor-map composition | `LinearMap.lTensor_comp`, `rTensor_comp`, `lTensor_comp_rTensor`, `Mathlib/LinearAlgebra/TensorProduct/Map.lean:464`, :471, :517 | Actual scalar ring and commuting tensor factors; generic API is imported |
| Canonical bidual | `Module.IsReflexive`, `Mathlib/LinearAlgebra/Dual/Defs.lean:212`; evaluation equivalence :228; dual reflexivity :263 | Bijectivity of native evaluation, not an arbitrary isomorphism or free predicate |
| Compatible completion projections | `AdicCompletion.transitionMap_comp_eval_apply`, `Mathlib/RingTheory/AdicCompletion/Basic.lean:414` | Native compatible-family law; no new generic inverse-limit construction needed |
| Completion quotient kernel | `AdicCompletion.pow_smul_top_eq_ker_eval`, `Mathlib/RingTheory/AdicCompletion/Completeness.lean:151` | Finitely generated ideal retained |
| Completion/tensor comparison | `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:327` | Finite module and Noetherian ring; does not supply arbitrary completed-coefficient Hom/Ext |
| Completed local residue field | `AdicCompletion.residueField_map_bijective`, `Mathlib/RingTheory/AdicCompletion/LocalRing.lean:151` | Local Noetherian range checked |
| Transported scalar tower | `LinearEquiv.isScalarTower`, `Mathlib/Algebra/Module/TransferInstance.lean:95` | Transported module instance and compatibility with the underlying linear equivalence |
| Native curve predicate | `TauCeti.AlgebraicGeometry.FamilyOfCurves`, `TauCeti/AlgebraicGeometry/Curves/Family.lean:56` | Proper, flat, locally finitely presented, relative dimension at most one; no geometric connectedness, exact genus or pure dimension one bundled |
| Split node | `TauCeti.NodeAlgebra`, `TauCeti/RingTheory/Node/Basic.lean:37` | Split xy−a smoothing, distinct from the section-retaining quadratic model here |
| Total acyclicity/Gorenstein projectivity | `CochainComplex.IsTotallyAcyclic`, `TauCeti/Algebra/Homology/TotallyAcyclic.lean:87`; `TauCeti.IsGorensteinProjective`, :149 | Finite-projective terms, acyclicity and dual acyclicity; generic object already owned |
| Absolute line classes | `TauCeti.AlgebraicGeometry.LineBundleClass`, `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`; inverse :95, `inv_mk` :104, CommGroup :142 | Absolute classes form a group; not a relative Picard sheaf or groupoid of lifts |

**Cross-roadmap ownership and supplier resolution.** Used the supplied board package index before any absence conclusion, the roadmap service's main/open-head object searches, individual roadmap reads and the citation resolver. The fresh resolver reported no unresolved roadmap citations, but its external Lean-name check reported no pinned Lake packages on its host; the local pin inspection above was therefore necessary. A resolver success was not taken as evidence that a section supplies the claimed object.

| Supplier / exact sections resolved | What the text supplies; disposition |
|---|---|
| StableReduction, Layers 1–3 and 8–9 on main | Curve families, coherent locally Noetherian duality, nodality, stabilization and stable reduction over traits. Arbitrary-base moduli and coherent comparisons are not inferred from the parent alone |
| SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21; §§1.1–1.2, 1.18–1.23; §§2.1–2.2, 2.6, 2.18–2.22; §§3.3–3.7; §§4.1–4.10, 4.14–4.15; §§5.1–5.10, on main | Sections exist. §4.15 already owns terminal stable-stack/level theorems and generic positivity. Explicit coherent chart refinements here have a distinct role, but they must not use their own terminal result circularly. §2.20's relative complex is broader than its Noetherian CM-module concentration statement; the arbitrary-base CM extension is not dismissed as redundant |
| AlgebraicVectorBundles L0A–L0C on main | Tensor, dual, finite local freeness, ordinary determinant and pullback; no second ordinary determinant construction needed |
| PadicMeasuresIwasawaAlgebras §5.1, `README.md:3172`, on main | Ring-level perfect-complex determinants with locally constant parity. Integer-grade refinements and geometric/stack pushforward belong in the explicit extension, not in a claim that the parity carrier already includes them |
| JacobianChallenge and JacobianChallengePartII §§0.1–0.4, 1.1–1.4, 4.4, 6.1–6.3 | Picard/Jacobian, polarization, obstruction and integral Noetherian stable Hodge interfaces. §1.3a has smooth-family determinant of cohomology. §1.4 has polarization; full strong Torelli remains a separately declared contract. No use of its later universal-level Jacobian to build curve-level foundations was found |
| NeronModelsAndSemistableAbelianVarieties §§4.1, 4.13 | Geometric nodal normalization exact sequence and integral Noetherian stable semiabelian Picard component; §4.1 is not merely a DVR result (R04) |
| AlgebraicModuliForArithmeticGeometry §§3.5, 5.4, 7.2–7.3, 7.6, 8.1–8.3 | Polarized descent, moduli/Picard, framing/effectivity/completion sections exist. One-gon attribution is wrong (R02). Polarized descent is already sufficient for the recorded general descent request (R04) |
| ModularCurves §§1C–1D, 2D, 4A–4B, 9E; ModularCurvesPartII §§2.2–2.3, 2.11 | Elliptic presentation/group-law/j-line and generalized polygon stacks are different scopes. The latter is the correct earlier one-gon owner |
| AbelianSchemesAndArithmeticModuli §§A2.5, A3.5–A3.8; PELModuli §§M5.1–M5.3, M6.9–M6.10 | Polarization, torsion/Weil-pairing, ppav level and Hodge interfaces. Curve H¹ versus torsion must retain dual and Tate twist; the recorded comparison contract is not replaced by a bare torsion frame |
| ShimuraCompactifications C4.1–C4.10, C5.16–C5.17 | Integral compactification interfaces with their base restrictions; the all-characteristic stable-family extension is a declared stronger contract, not assumed supplied |
| ComplexComparisonPartII C3.2d.1–C3.2d.4 | Picard-stack, relative-space, separatedness/Brauer comparisons. The needed Teichmüller/boundary-topology interface is not already these statements, but is explicitly a named gap; therefore no missing-supplier finding solely from its present absence |
| StablePeriodicCurved Layer 2; DeformationAndDerivedPatchingAlgebra §3.3 | Complete finite-projective resolutions and the local Noetherian fibre-injection/flat-cokernel criterion. Relative coefficient-universal conditions and the completed-local comparisons here are additional obligations |
| AlgebraicCurves Layers 0–12 | Function-field/divisor/genus/Riemann–Roch dictionary remains with its owner |

The 17 newer gap slugs all occur in both the plan and README with named suppliers. Their present absence from a supplier is not itself a defect. R04 and R05 concern minimality and precision, respectively; R01 concerns the other 20 records. The remaining contracts were treated as obligations, not as established declarations. Broad object searches covered the accessible main/open-head roadmap corpus and the local board packages; a search for all seven fully qualified Lean names found no duplicate. No consumer later in the order was proposed as a new supplier.

The required dependency command completed successfully. Its exact output was:

```text
depcheck: 51 roadmaps, 590 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The independently resolved internal graph has 1,361 edges, zero broken anchors and zero cycles. R10 concerns the separate numerical order. The 34 forward edges, grouped by consumer, are:

`1.1→1.6; 1.2→1.7,1.8,1.9; 1.3→1.9; 1.4→1.11; 2.453→2.471,2.473,2.474; 2.455→2.477,2.476; 2.457→2.480,2.481; 2.459→2.485,2.486; 2.460→2.482,2.486; 3.4→3.9,3.10; 3.6→3.12; 3.8→3.13; 4.2→4.12; 4.10→4.16; 5.3→5.18; 5.4→5.19,5.20; 5.10→5.14,5.16; 5.11→5.15,5.17; 5.12→5.21; 7.2→7.5,7.7,7.8`.

## Not verifiable

- `blr-relative-picard-LwkQQl`, Néron Models, especially §9.3 Theorem 1 and §8.1: the manifest's settled uncertified status was respected. No fresh full-text or transitive-proof certification is claimed and no new request was made.
- `mc6-fc1990`, Degeneration of Abelian Varieties, especially Chapter V Theorem 2.3: likewise settled uncertified. This review does not certify its exact all-characteristic use from an unread text.
- The board index identifies a SchemeAndStackFoundationsPartII head beginning `accb0a0`, but the provided repository lookup returned 404. Its content could not be read. Ownership against that head, and board-index heads not present in the accessible service corpus or this checkout, is not certified; none was declared nonexistent. Accessible main and open-head searches were still performed.
- The 49 certified manifest entries are cached legal texts; this is acquisition evidence, not proof that every cited page of all 49 works was independently collated. The 15 seeded targets and the additional passages listed above were checked. Published/preprint collation outside those readings, the full FGA/MFK/BLR transitive chains, the unread Bourbaki completion input and proof of Knudsen Appendix Proposition 7's exercise were not certified. These do not become proved because a source is cached or a gap repeats an earlier receipt.
- The generic/arbitrary-base geometric owner extensions remain mathematical contracts. Elaboration of the polynomial signatures does not verify those constructions or their eventual implementations. This report therefore makes no conditional acceptance claim.

## Source issues

- **Misprint** in knudsen2012 at Proposition 3.1, printed p.12, and Corollary 3.2, printed p.13: the source says the dual fractional ideal has colon (J:R); it should be (R:J), the multipliers carrying J into R; affects a stated result.
- **Misprint** in clm at proof of Proposition 6.3, printed p.25: the source says the contraction pushes the target canonical sheaf onto the source canonical sheaf; it should be b_*ω_S=ω_(S′), with the pluricanonical pushforward justified using the exceptional discrepancy; affects the proof.
- **Misprint** in clm at proof of Proposition 6.3, printed p.25, finite-base-change paragraph: the source says the base-changed family and its relative dualizing sheaf use C; it should be C′, the source of the finite cover; affects the proof.
- **Error** in clm at proof of Corollary 6.6, printed p.25: the source says fibre-degree considerations force the marked pluricanonical higher direct image to vanish on all nodal fibres; it should be a justified evaluation-image argument accounting for unstable rational components; affects the proof.
- **Gap** in clm at proof of Proposition 6.7, printed p.25: the source says separating intersecting weighted sections follows from the preceding unweighted blow-up argument; it should be justified using coefficient m−Σaᵢ and the actual ideal-twisted pushforward when negative; affects the proof.
- **Error** in clm at proof of Proposition 6.7, printed p.26: the source says positive pluricanonical twists have zero higher direct image by fibre degrees on arbitrary nodal families; it should be justified with an appropriate degree hypothesis or evaluation-image argument accounting for unstable components; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6875d07a67d92b540577869398957097ebba6757", "job": "REV-PKG-StableReductionPartII", "model": "gpt-6-astra", "worker": "chris-17"} -->
