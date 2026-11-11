<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13142#issuecomment-6783442079 -->
Review (codex) of 9308044

Verdict: needs_changes

1. **F01** (P2) Ordinary bases do not make every object of the big animated site ordinary

   **Location.** `packages/SchemeAndStackFoundationsPartII/README.md:342`, 348, 360. Line 348 says: “For discrete A the three sites recover their ordinary counterparts; the affine fppf topology matches TauCeti.CommAlgCat.fppfTopology.”

   **Claim.** Section 2.4 places the topologies on animated A-algebras without restricting their objects, then identifies the resulting sites over a discrete A with ordinary sites. Its proof only establishes discreteness for algebras flat over A. A condition on covering morphisms does not impose that condition on every object's structural map to the base.

   **Witness.** Take A=k and B=k⊕k[1]. Then π₁B=k≠0, whereas every ordinary k-algebra has π₁=0. CS24 lines 2280–2283 restrict objects to étale/fppf/flat A-algebras.

   The native topology at `TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:61` is on ordinary commutative R-algebras. On the unrestricted animated site B is an object even though k→B is not flat. It cannot be eliminated by covering it with ordinary flat algebras: for a faithfully flat B→C, the flatness formula gives π₁C=π₁B⊗_kπ₀C=π₀C≠0. The same argument excludes a jointly faithful covering family all of whose terms are ordinary. Thus the ordinary subcategory does not present the whole big animated site by a cover-dense inclusion. The valid comparison of cohomology evaluated at an ordinary base is a different assertion.

   **Exact repair.** Keep the general big animated sites, but specify that their objects are all animated A-algebras, their arrows are all A-algebra maps, and the stated flatness conditions concern covers. Replace line 348 by the precise assertion that, for discrete A, restriction to the full subcategory of ordinary A-algebras gives the ordinary big sites, and this restricted affine fppf topology is Tau Ceti's. State separately that cohomology at an ordinary algebra, with the coefficient classes of this roadmap, agrees with ordinary cohomology through the already declared `gap:animated-flat-cohomology` and §5.0; do not claim equivalence of the entire sites. Explain the relation to the restricted sites actually used in CS24 §5.2.5. Amend the proof sentence at 360 accordingly and add the B=k⊕k[1] negative-control Check. An alternative explicit choice of CS24's restricted object categories is possible, but must likewise distinguish them from Tau Ceti's big site and retain the cohomology comparison.

   **Repair test.** In the proposed formulation, B remains a legitimate object of the big animated site with π₁=k, and is absent from its ordinary restriction. The k-flat objects over the ordinary base have π₁=0. Evaluation at k still gives RΓ(k,𝔾_a)=k[0] on both theories, whereas evaluation at B retains H⁻¹(B,𝔾_a)=k. Thus the repair preserves the general animated theory and the actual ordinary-cohomology acceptance tests.

2. **F02** (P2) Pruned preliminary layers retain an unforced source order

   **Location.** `packages/SchemeAndStackFoundationsPartII/README.md:204`, 286, 408, with dependency lists at 284, 406, 472. The headings are “Animated group points and cotangent deformation”, “Flat animated algebras, henselization and towers”, and “Split refinements, derived glueing and perfection”.

   **Claim.** The build paragraph at line 167 presents these as the preliminary layer sequence. After the duplicated cohomology targets were replaced by imports, their explicit prerequisites no longer force this sequence.

   **Witness.** Layer 1 uses CS24 §5.1, Layer 2 uses §5.2, Layer 3 uses §§5.3–5.4. Dependencies at lines 406 and 472 contain no edge from Layer 2 to 1 or Layer 3 to 2.

   This is the specific source-order pattern prohibited by the brief: consecutive mathematical layers follow the source's sections although their stated dependencies leave that order free. Layer 2 now imports its cohomology/Postnikov inputs from PrismaticCohomologyPartIII and Purity, rather than constructing them from this roadmap's point-deformation layer. Layer 3's split-refinement, arithmetic-square, completion-defect and perfection statements likewise use the named suppliers and their own internal dependencies. The old review's justification for the layer organization therefore needs to be reconsidered after the deletion of the connecting targets.

   **Exact repair.** Organize these independent inputs around the remaining end theorems. One concrete valid order is: current Layer 0; current Layer 2 (flat algebra/site, henselization and tower inputs for the cohomology problem); current Layer 1 (point/cotangent deformation); current Layer 3 (ring inputs for completion); then current Layers 4–6. Explain that the independent site/tower and deformation inputs meet at complete continuity. Renumber the first two moved layers and update their internal references, supplier uses, build paragraph and any affected docstrings. Keep real prerequisite edges; do not invent an edge just to justify retaining source order. No scope change or new theorem is needed.

   **Repair test.** The permutation (0,2,1,3,4,5,6) preserves every stated internal prerequisite: the moved Layer 2 uses only its own earlier targets and external suppliers, and the moved Layer 1 uses only its own earlier targets and external suppliers. Layers 4–6 still follow all their inputs. On A=k⊕k[1], the flatness test still computes k≠0 in degree 1, the tower comparison still returns H⁻¹=k, and the later deformation input still computes C_(G_a)=k[0]. This changes the exposition around the mathematical inputs without changing those statements or the supply direction.

Two P2 findings: the ordinary-site identification in §2.4 needs an explicit restriction of objects, and the independent preliminary layers retain an unforced source-section order after the ownership pruning. The six previous findings are repaired. All 15 seeded source targets were readable and their principal statements are supported at the cited locators. The two Lean headlines elaborate, retain their hypotheses, and do not close under the padding probes. No change to either headline signature is requested.

### Previous findings checked first

Locations below are in `packages/SchemeAndStackFoundationsPartII/README.md` unless another file is named.

| Round-2 finding | Status and repaired passage | Verification |
| --- | --- | --- |
| R01, overlapping Purity ownership | **Repaired.** Line 13: “These are imported and not restated here.” Lines 123–125 give the Purity contract. | Open head #1840, `TauCetiRoadmap/PurityForFlatCohomology/README.md`, §§0.2–0.3, 2.1, 3.2–3.6, 7.10, has the imported statements. The old duplicate target sections are gone. The Summary and Lean docstring now identify four end theorems. The old finite-ideal continuity gap is absent. The changed imports and examples were recomputed below. |
| R02, redundant Arc gaps | **Repaired.** Line 163: “§11.5: for torsion F on Spec A and finite I” introduces the four hypercomplete functors. | Open head #1755, `TauCetiRoadmap/ArcTopologyAndDescent/README.md:1502`, 1552, 1624 supplies §§11.2, 11.5, 12.7. All three former gap slugs are absent from README and plan. The deduction of étale acyclicity from splitting covers is valid. |
| R03, redundant Noetherian completion gap | **Repaired.** Line 54: “Flatness of the adic completion of a Noetherian ring, used in §5.1.” | The old gap is gone. Its old local-completion consumer is now imported from Purity §3.5. Accordingly there is no need to add unused faithful-flat/quotient declarations to this package. The remaining Mathlib flatness citation is correct. |
| R04, retired AlgHom namespace | **Repaired.** Line 586: “it is functorial through `AlgHom.mapValue`”. | The Needs line at 603 and Dependencies at 697 also use the root namespace. No `TauCeti.AlgHom` remains. Opened `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:143`, including its namespace context and implementation. |
| R05, nonexistent henselization declaration | **Repaired.** Line 107: “Noetherianity of A and faithful flatness of A→Â are Tau Ceti's” named instances. | Lines 77–79 and the consumers at 632 and 697 cite the actual native instances and `completionEquiv`. Opened their bodies at `TauCeti/RingTheory/Henselization/Noetherian.lean:62`, 72 and `Quotient.lean:155`. The remaining gap asks for regular formal fibres, not these existing results. |
| R06, HenselianRing locator | **Repaired.** Line 53: `Mathlib/RingTheory/Henselian.lean:81`. | Line 81 is the pair class, with Jacobson containment and simple-root lifting. The local-ring class starts at line 95. |

No previous finding was marked “not actionable in this package.” R01 below concerns the site definition and R02 the layer order after pruning; neither re-raises an old ownership or supplier-name finding. The earlier report's table did not have a computed row for the old §3.4, now §2.4; this section was reviewed in full.

## Verified sound

Read all 31 numbered subsections, their APIs, Checks, proof routes, Needs lines, seven layer endings, conventions, supplier paragraphs and worked examples. Recomputed the sampled targets and all changed mathematical passages; for unchanged material also compared the earlier table's actual computations. The following tables retain the computations needed to reproduce this review rather than treating a successful `sorry` build as evidence of truth.

### Sources and the seeded sample

The manifest identifies CS24 as arXiv 1912.10932v3 and BC22 as arXiv 1908.07480v4, with printed preprint pagination. These are the versions read. The source extractions were readable. No locator is marked unverified or uncertified in the current package. All eight cited works have manifest entries; none was added, removed or rewritten in this review.

| Seeded target | Locator opened | Hypotheses and content verified against the text |
| --- | --- | --- |
| 1.1 Animated points | CS24 §5.1.11, p.52, line 2149; Examples 5.1.6, p.49 | Ordinary base, commutative flat affine group, animated evaluation with a genuine ℤ-module-object structure, preservation of limits. |
| 1.2 Cotangent at the identity | CS24 Proposition 5.1.12, p.52, line 2165; line 2159 | Underlying module e*L tensor A; finite-presentation qualification for the canonical scalar action. The tangent fibre is over the identity. |
| 2.3 Nilpotent flatness test | CS24 Lemma 5.2.2, pp.53–54, line 2216 | Surjective π₀ with nilpotent kernel, connective modules, derived tensor product, both flatness and faithful flatness, and zero detection. |
| 2.5 Animated henselization | CS24 Proposition 5.2.4, p.54, line 2256; proof of Lemma 5.6.5, p.74, line 3088 | Étale lifting from π₀ defines henselization; flat base change computes higher homotopy. The source's use of animated henselization is in the cited proof. |
| 2.6 Approximation towers | CS24 Corollary 5.2.7, p.56, line 2345; proof lines 2349–2352 | Compatible tower of A-algebras and truncation equivalences through n; smooth affine or finite locally free coefficients. The rewritten two-limit proof is valid. |
| 3.1 Split refinements | CS24 Lemma 5.3.1 and Remark 5.3.2, p.58, lines 2408, 2419 | Arbitrary ring, ind-fppf refinement; optional henselian refinement requires I in every maximal ideal. Split covers imply exact evaluation and positive cohomology vanishing for abelian sheaves. |
| 3.3 Completed π₀ | CS24 Lemma 5.3.4, p.58, line 2433; proof p.59, line 2439 | Surjection to ordinary completion, lim¹ kernel, multiplicative limit filtration and lim²=0 make that kernel square-zero. |
| 3.4 Perfection | CS24 Lemma 5.4.1, p.62, line 2591; proof lines 2596–2607 | Perfect source, semiperfect target, derived principal residue equivalence, unique divisibility of the nil kernel. The stated conclusion follows by composing the two residue equivalences. |
| 4.3 Bounded continuity | CS24 Lemma 5.6.4, pp.72–73, line 3000 | Both degree-≥3 vanishing hypotheses and derived completeness are retained. The source separately treats negative degrees, H² and torsor effectivity in H¹. |
| 4.6 Ordinary quotients | CS24 Example 5.6.7, pp.75–76, line 3162; lines 3173–3180 | Finite generating tuple, derived completeness, surjectivity from degree 1, bijectivity from degree 2, derived H⁰ in the lim¹ term; its replacement by ordinary point groups requires classical completeness. |
| 5.0 Ordinary cohomology and nonunital rings | CS24 §5.2.5, p.55, lines 2279–2300; BC22 §2.1.1, p.5, line 214; SP Tag 09XI, line 1369 | Ordinary-algebra cohomology comparison, both clauses of Gabber's criterion, and the actual Dorroh multiplication. The Ext-from-free-representable construction was also checked at the pins. |
| 5.1 Finitary completion | BC22 Lemma 2.1.3, pp.6–7, line 253 | Noetherian henselian pair, geometrically regular completion fibres, filtered-colimit-preserving set functor; injectivity and equality of the sets of liftable residue elements, not unconditional surjectivity. |
| 5.3 Topological algebraization | CS24 Corollary 5.6.10, p.76, line 3209; BC22 Theorem 2.1.15, pp.11–12, line 458 | Open henselian nonunital subring, ideal neighbourhood basis, arbitrary separated completion, finite locally free commutative coefficients, degree ≥2. No countability or Noetherianity is needed. |
| 5.4 Laurent algebraization | CS24 Example 5.6.11, p.77, line 3217 | Any R; B=R{t}[1/t], B′=tR{t}, completion R((t)). Applied to Corollary 5.6.10 with G defined over B. |
| 5.5 Punctured comparison | CS24 Corollary 5.6.12, p.77, line 3223 | Both henselian π₀-pairs, finite I, the derived residue condition, punctured animated cohomology and degree ≥2; support triangles justify the proof route. |

Also read the two other end-theorem locators: CS24 Theorem 5.6.6, p.75, line 3138, and Theorem 5.7.2, pp.78–81, line 3288; the henselian end theorem is Corollary 5.6.9, p.76, line 3190. The two complex-valued statements require animated carriers absent from the pins. Lemma 5.7.1, p.78, line 3261, proves discreteness, not arbitrary ordinary flatness; the README preserves this distinction.

The repaired formal-fibre contract is supported by CS24 lines 3201–3204 and SP Tags 0AH2/0AH3, lines 6106 and 6126. The adic-flat limit contract retains weak proregularity as in Y18 Theorems 1.8, 4.3, 5.9, lines 217, 587, 704, with the preprint/published numbering distinction recorded. BG80 Proposition 2.2.1, printed pp.25–27, lines 746–791, and R70 Lemma 6.2.2, printed p.51, lines 978–985, supply the smooth resolution and local vanishing of commutative extension classes. The R70 extraction corrupts the lemma label typographically, but the statement, proof and printed page are readable. BC22 lines 283, 306–326 and 458–474 support the smooth-stack, torsor/H² and Cauchy-algebraization contracts. SP Tag 0A6R, lines 589–631 in its additional manifest text, gives the geometric localization complex, without an unwarranted weak-proregularity assumption.

### Computed adversarial table

Here k is a nonzero field, and all cohomology groups use the displayed coefficient and topology. The computed values are mathematical tests, not a claim that the future proofs have been formalized.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Conventions: V−1 | ℤ/p and μ_p over 𝔽_p, p=2,3 | Constant group: V−1=0, so fibre H⁰=H¹=𝔽_p. Multiplicative group: V−1=−1, so both groups 0. | Agrees with PrismaticCohomologyPartIII §6.0; ordinary kernel alone gives the wrong H¹. |
| Conventions: indexing and supports | A=k⊕k[1]; I=0,1 | G_a gives H⁻¹=k,H⁰=k. I=0 gives fib(RΓ→0)=RΓ; I=1 gives fib(id)=0. | Correct sign and support direction. |
| 0.1 Pro-fppf site | ℤ→ℚ; ℤ→ℤ[1/2] and ℤ→ℤ_(2); k×k | ℚ⊗𝔽_p=0, so ℚ alone misses all closed primes. The two localizations together hit every prime. A single component of k×k hits 1 of 2 points; both hit 2 of 2. | Covers distinguished from merely flat maps. Empty cover covers only the empty scheme. |
| 1.1 Animated points | G_a on k⊕k[1]; G_m on k; trivial group | G_a: π₀=π₁=k, versus π₁=0 after truncation. G_m(k)=k×, higher π=0. Trivial group has one point in all cases. | Excludes discrete-only evaluation and arbitrary nonabelian group models. S₃ is outside the coefficient hypothesis. |
| 1.2 Identity cotangent | G_a, G_m, μ_p over 𝔽_p | First two give R[0]; dlog at 1 sends an infinitesimal 1+εx to x. μ_p gives [𝔽_p --0→ 𝔽_p] in −1,0. | Dual direction C_H→C_G agrees with tangent-map direction. |
| 1.3 Amplitude/annihilation | μ_p over ℤ, reduce or invert p | C=[ℤ --p→ ℤ]; modulo p H⁻¹=H⁰=𝔽_p; over ℤ[1/p] both 0. Homotopy h=id gives dh+hd=p. | Amplitude endpoints and p-power annihilation hold, including p=2. |
| 1.4 Point deformation | G_m and μ_p over 𝔽_p[ε]/ε²→𝔽_p; M=0 | Point kernel is 1+ε𝔽_p≅𝔽_p. For μ_p the degree-zero obstruction group is 𝔽_p but the point obstruction map has image 0. M=0 gives zero obstruction and identity map. | Correctly avoids an untruncated D(ℤ) point triangle. |
| 2.1 Flat animated modules | A=k⊕k[1], M=k; M=0; A=0 | π₁A⊗k=k≠0=π₁M, so M fails flatness. Zero module over k is flat but not faithful; over 0 it is faithful. | Both homotopy and faithfulness conditions are necessary. |
| 2.2 Flat tensor | ℤ, M=ℤ_p,N=ℤ/p; k,M=k,N=k[1] | First: π₀=𝔽_p, all positive Tor=0 on both sides. Second: π₁=k,π₀=0 on both sides. | Graded formula, base change and identity tested. |
| 2.3 Nilpotent detection | ℤ/4→𝔽₂,M=𝔽₂; M=A; ℤ→ℚ | Tor_i^(ℤ/4)(𝔽₂,𝔽₂)=𝔽₂ for every i≥0: neither flatness test passes. M=A gives free rank one before/after. ℤ/2⊗ℚ=0 although ℤ/2≠0. | Nilpotent hypothesis excludes localization counterexample. |
| Layers 1–3 organization | Dependency lists 284, 406, 472 | Number of Layer 2 prerequisites in Layer 1: 0; number of Layer 3 prerequisites in Layer 2: 0. Both (0,1,2,3,4,5,6) and (0,2,1,3,4,5,6) are topological orders of the stated internal dependencies. | R02: choose the mathematical exposition rather than retaining the unforced source sequence. |
| 2.4 Animated sites | Base k, object B=k⊕k[1]; a faithful flat cover B→C | π₁B=k; π₁C=k⊗_kπ₀C=π₀C≠0; every ordinary object has π₁=0. Over k, a flat structural map instead forces π₁=0. | R01: object restriction and cohomology comparison must be distinguished. |
| 2.5 Henselization | I=0,1; A=ℤ_(3); A=C⊕C[1] | At I=0, π₁ remains π₁A; at I=1 henselization is 0. For C=ℤ_(3), T²−T−3 has no rational root (discriminant 13), but has a root ≡1 mod 3 in C^h; π₁((C⊕C[1])^h)=C^h. | The identity-on-all-rings and π₀-only alternatives fail these tests. |
| 2.6 Approximation tower | A=k⊕k[1], A_n=τ≤nA; false constant approximation k | Correct tower is A from n=1, giving H⁻¹=k,H⁰=k on both sides for G_a. Constant k gives H⁻¹=0 and fails τ≤1A≃τ≤1k. | Compatible increasing accuracy is essential; rewritten route valid. |
| 3.1 Split refinements | Algebraically closed k; R=0; nonzero R | Every nonzero finitely presented k-algebra has a k-point, so H⁰(k,F)=F(k), H>0=0 for abelian fppf sheaves. Over 0 all groups are 0. A faithful refinement of nonzero R cannot be 0, since 0⊗R=0. | Split and faithful conditions discriminate. |
| 3.2 Derived glueing | ℤ→ℤ_p,a=p; a=0,1 | ℤ_p∩ℤ[1/p]=ℤ; ℤ_p+ℤ[1/p]=ℚ_p, so fibre has H⁰=ℤ,H¹=0. At a=1 localizations are identities; at a=0 residue equivalence detects the original map. | No regular-element hypothesis inserted. |
| 3.3 Completed π₀ | ℤ,p; ℤ/p²,p; a=1 | First: lim¹π₁=0, completed π₀=ℤ_p. Second: transition products p² kill the π₁ tower, lim¹=0, completed π₀=ℤ/p². At a=1 both rings and kernel are 0. | Milnor term and square-zero multiplication verified. |
| 3.4 Perfection | A=A′ perfect; A=𝔽_p,A′=𝔽_p[t^(1/p^∞)]/(t),a=1; a=0 | Identity case has kernel 0. Second kernel contains nonzero t^(1/p), killed by Frobenius; multiplication by 1 is bijective and both derived residues are 0. At a=0 the hypothesis forces equality and zero kernel. | Nil kernel need not itself vanish when a is a unit. |
| 4.1 Completeness→henselianity | ℤ_p,(p); ℤ,(p); k⊕k[1],I=0 | ℤ_p is complete/henselian; ℤ has Jac=0 and completion ℤ_p≠ℤ. At I=0 completion is the original animated ring. | No false assertion that arbitrary π₀ is classically complete. |
| 4.2 H² henselian comparison | ℤ_p, μ_p, p=2,3; I=0 | H²(ℤ_p,μ_p)=H²(𝔽_p,μ_p)=0. H¹ source is (ℤ/2)² for p=2 and ℤ/3 for p=3, target 0. I=0 gives identity. | Independent low-degree result and range checked. |
| 4.3 Bounded continuity | ℤ_p,μ_p; zero G; a=1 | For odd p, both limits have H¹=ℤ/p,H≥2=0; lim¹H⁰=0. Zero G gives 0=0. At a=1 completeness forces A=0. | Both bounds and completeness retained. |
| 4.4 Principal complete descent | A=ℤ[[t]],a=t; A→A×A | Mod t gives ℤ and the split Čech nerve of ℤ→ℤ×ℤ. Extra degeneracy contracts to RΓ(A,G); identity hypercover gives the identity complex. | Parameter need not lie in the ordinary base ℤ. |
| 4.5 Complete continuity headline | Empty tuple; ℤ_p,μ_p; ℤ/p²,p | Empty tuple gives constant RΓ(A,G). For odd p, H¹=ℤ/p on both sides. ℤ/p² /^Lp has π₀=π₁=𝔽_p, versus π₁=0 in the ordinary quotient. | Derived quotient generality preserved. |
| 4.6 Ordinary quotient comparison | ℤ_p,μ_p,p odd; I=0 | H¹ source ℤ/p maps onto 0; at level n≥2 μ_p(ℤ/p^n) has p elements, whose images at any fixed level eventually equal {1}. Thus lim¹=0 and lim H¹=ℤ/p. I=0 gives constant system and lim¹=0. | Correct exact sequence and degree bounds. |
| 4.7 Failure of H¹ continuity | 𝔽_p{t}→𝔽_p[[t]] | Source unit quotient is countable. Classes 1+t h(t^p) are distinct for distinct h, giving uncountably many target classes; if their ratio is in 𝔽_p[[t^p]], comparison of the 0 and 1 residue classes of exponents forces equality of h. H²=0 on both. | Sharp degree-one negative control. |
| 5.0 Points, sheaf and Ext | Trivial G; α_p on 𝔽_p[t]; μ_p on ℤ_p | Trivial points are a singleton, abelian sheaf 0, all Ext groups 0. H¹(α_p)=𝔽_p[t]/𝔽_p[t^p], with [t]≠0. H¹(μ₂,ℤ₂)=(ℤ/2)², generated by −1,5; H¹(μ₃,ℤ₃)=ℤ/3. | Actual coefficient and fppf topology, not a zero or étale stand-in. |
| 5.0 Nonunital predicate | 0; ℤ⊂ℤ; 3ℤ_(3); pℤ_p | Zero passes with r=0. ℤ fails 2(1+y)=1. In 3ℤ_(3) quasi-inverses exist but T(T−1)−3 has no root since 13 is not a rational square. pℤ_p satisfies both clauses. | Neither polynomial clause nor Jacobson/quasi-inverse clause is redundant. Fin(N+1) includes indices 0 through N. |
| 5.1 Finitary functors | F(C)=C, A=ℤ_(p)^h; I=0; constant two-point F | A→ℤ_p is injective; residue 1 lifts to 1 in both. I=0 gives Â=A and identity. Constant functor gives 2→2 identity. | Does not claim F(A)→F(Â) always surjective. |
| 5.2 Henselian headline | α_p on 𝔽_p[[t]],I=(t); I=0; n=0,1,2 | H¹ source contains [t]≠0, target 0; H²=0=0. I=0 gives identity for all n. At n=0 both degree-conditional implications are vacuous, but the theorem's n=1,2 conclusions are substantive. | Source/Lean ranges agree; whole theorem is not boundary padding. |
| 5.3 Algebraization headline | Discrete B,B′=0; 𝔽_p{t}; coarse topology on (A,I) | Discrete completion gives identity. Equal-characteristic example gives H²=0=0 but fails H¹ surjectivity. Coarse ideal topology has completion A/I. | Non-Hausdorff rings and absence of countability restrictions are deliberate. |
| 5.3 Wrong nonunital model | B=ℤ_(3),B′=3B, topology with open ideal 3B | Completion is 𝔽₃. A Brauer class of ℚ with invariants 1/3 at 2, −1/3 at 5 is unramified at 3, giving nonzero H²(B,μ₃); H²(𝔽₃,μ₃)=0. | The polynomial clause correctly excludes B′; quasi-inverses alone would make the headline false. |
| 5.4 Laurent puncture | R=𝔽_p,G=μ_p; trivial G | Both H² groups are Br[p]=ℤ/p; H¹ is countable on 𝔽_p{t}[1/t] and uncountable on 𝔽_p((t)). Trivial G gives 0=0. | Degree ≥2 is exact. |
| 5.5 Punctured animated comparison | ℤ_(p)^h→ℤ_p,I=(p); I=0,1 | Generic-field H²(μ_p)=ℤ/p on both sides. I=0 gives empty puncture, hence 0=0; I=1 with henselianity forces zero rings. | Derived residue and both henselian conditions retained. |
| 5.6 Noetherian open comparison | Same DVR map,U=D(p); identity R→R | H²(μ_p)=ℤ/p→ℤ/p; quotient maps are ℤ/p^n→ℤ/p^n. Identity gives identity on every allowed U. | No flatness hypothesis silently inserted in the general statement. |
| 6.1 Complete-flat discreteness | A=𝔽_p,I=0,M=A,A[1],0 | A gives π₀=𝔽_p, higher 0; A[1] gives π₁=𝔽_p and fails flatness over discrete A; 0 gives 0. | Conclusion is discreteness, not ordinary flatness. |
| 6.2 Adic support-descent headline | I=1; empty tuple; split A→A×A | I=1 supported complexes are 0 even without completeness. Empty tuple returns full fpqc descent. Split Čech complex contracts to RΓ_I(A,G). | Full/punctured assertions keep completeness. |
| 6.2 Koszul-support proof step | T=ℤ_p,b=p,N=T | Dual Koszul has H¹=ℤ/p^n; colimit is ℚ_p/ℤ_p, agreeing with H¹ of [ℤ_p→ℚ_p]; H⁰=0 on both. For empty tuple both complexes are T. | Uses geometric support, with uniform lower bound 0 for the totalization exchange. |

### Changed suppliers and gap tests

The new Purity contract keeps all degree distinctions: on 𝔽_p[ε]/ε² with α_p, H⁰=H¹=𝔽_pε maps onto 0, whereas H²=0 on both sides. On 𝔽_p(s), Br[p] is nonzero, so the general p-henselian bound cannot be strengthened from i≥3 to i≥2 without the perfect-reduction hypothesis. For the derived residue comparison, ℤ→ℤ_p has residue 𝔽_p and higher Tor=0, whereas ℤ/p²→𝔽_p has Tor₁=𝔽_p and is excluded. The latter computation also checks the rewritten Worked example 2.

For Arc §11.2, a rank-one absolutely integrally closed valuation ring V with nonzero nonunit t has D(t)=Spec Frac(V), so the open's positive étale cohomology is 0; the empty product is the zero ring with empty spectrum. A split étale cover permits lifting a section of any quotient sheaf, which justifies the contract's exact-global-sections consequence. At I=0, Arc §11.5's completed/henselian functors evaluate on R and its punctures are empty. On the identity perfectoid hypercover of 𝔽_p, the three Arc §12.7 comparisons are respectively 𝔽_p, 𝔽_p and ℤ_p on both sides.

For the repaired native henselization contract, ℤ_(p)^h is Noetherian and its completion is ℤ_p, faithfully flat; both quotients modulo p^n are ℤ/p^n. At I=0, henselization and completion are identities. A non-Noetherian polynomial ring k[x₁,x₂,…] remains non-Noetherian after henselization at 0, so the Noetherian assumptions on the two instances cannot be dropped. `completionEquiv` itself needs no such assumption.

All 19 README gap declarations match `design/plan.json` exactly in slug, supplier and needs text. Every referenced slug is declared; every declared gap has a named supplier and a use. The nine old, removed gaps remain absent. These are contracts, not findings for nonavailability at the pins. Their mathematical checks include:

| Contract group | Discriminating computation and boundary |
| --- | --- |
| Animation composition; general square-zero | On A=k⊕k[1], π₁=k survives animation to the additive group. B→τ≤0B has ideal k[1] and τ≤2L_(k/B)=k[2]; for B=k its ideal and relative cotangent are 0. |
| Finite-group Ext; Bégueri resolution | For G=μ_n, G*=ℤ/n and H=𝔾_m^n. The inclusion sends ζ to (ζ^i), whose component at i=0 is 1, not ζ. For G trivial, H→Q is an isomorphism and kernel 0. BG80/R70 concern commutative extensions and fppf local vanishing, not vanishing of every global Ext group. |
| Smooth-stack and torsor/H² lifting | For G_a over k[ε]/ε², H¹=0 on both sides. For α_p, H¹=kε maps onto 0 without injectivity; H²=0 on both. This separates the smooth bijective and finite-flat surjective ranges. |
| Cauchy algebraization | B discrete, B′=0 gives B̂=B; coarse ideal topology gives B̂=B/I. The Cauchy-net formulation includes both and does not assume a countable base. |
| Punctured H² injectivity | ℤ_(p)^h→ℤ_p and D(p) give ℤ/p→ℤ/p. The input requires every ordinary thickening to agree but does not assume the map flat. |
| Adic-flat limits | C=ℤ,J=(p),M_n=ℤ/p^n gives M′=ℤ_p, M′/p^n=ℤ/p^n and Tor_i^ℤ(ℤ/p^r,ℤ_p)=0 for i>0. Weak proregularity is retained for the general result. |
| Torsor finite-stage descent; complete torsor effectivity | A trivial G-torsor and all its identities descend at the first stage; for μ_p over ℤ_p, the automorphism tower has eventual image {1}, lim¹=0. Effectivity concerns systems with their specified isomorphisms, not just an inverse limit of sets of classes. |
| Classical group adapter; cotangent amplitude | Res_(k[ε]/ε²)/k 𝔾_m has points (k[ε]/ε²)× and is an open subscheme of A²; μ_p has both cotangent degrees −1 and 0. The adapter is distinct from re-proving the already supplied ordinary Weil-restriction smoothness theorem. |
| Animated cohomology and deformation | RΓ(k⊕k[1],G_a) has H⁻¹=H⁰=k; τ≤0 retains both. For α_p on dual numbers the point-only obstruction is not surjective but H¹ supplies the missing term in the untruncated cohomology triangle. |
| Perfection of covers | Over perfect k, the split cover k→k×k remains the same faithful cover after perfection; 𝔽_p[t^(1/p^∞)]/(t) has perfection 𝔽_p although t^(1/p) was nonzero. |
| Complete-module hyperdescent; geometric Koszul supports | Split completed Čech descent contracts to M, including M=0. [ℤ_p→ℚ_p] gives H¹=ℚ_p/ℤ_p, as in the table above. These are stronger/different than the supplier's ordinary bounded-torsion p-complete Čech statement. |
| Henselized formal fibres | Finite-type ℤ-algebras are excellent; their henselizations are G-rings, and the completion map is regular (SP 0AH3, 0AH2). Native Noetherianity and completion equivalence are separately cited, not requested again. |

### Pinned library, Lean, and padding

Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened all 24 primary native supplier-table entries, their generated-name context where necessary, and the additional names used inside those rows and in Lean. The following records the declarations actually used to assess the native carriers and comparisons.

| Declaration(s) | Pinned file and line | Content checked |
| --- | --- | --- |
| `Algebra.FinitePresentation` | `Mathlib/RingTheory/FinitePresentation.lean:44` | Quotient of a polynomial algebra on Fin n, finitely generated kernel. |
| `Module.FaithfullyFlat` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:64` | Extends flatness and includes nonvanishing modulo maximal ideals. |
| `Scheme.fppfTopology`, `Scheme.fpqcTopology` | `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:54`, 76 | The generated fppf and quasi-compact flat covering topologies. |
| `HenselianRing` | `Mathlib/RingTheory/Henselian.lean:81` | Jacobson containment and simple-root lifting; neither locality nor completeness. |
| `AdicCompletion.flat_of_isNoetherian` | `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:378` | Native Noetherian completion flatness. |
| `HasExt`, `Abelian.extFunctor` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:55`, 437 | Smallness of shifted derived morphisms and the Ext bifunctor; not a free proposition standing for cohomology. |
| `presheafToSheaf` | `Mathlib/CategoryTheory/Sites/Sheafification.lean:74` | Actual sheafification functor and its typeclass requirement. |
| `AddCommGrpCat.free` | `Mathlib/Algebra/Category/Grp/Adjunctions.lean:54` | Free abelian group on a type. |
| `AddCommGrpCat.uliftFunctor` | `Mathlib/Algebra/Category/Grp/Basic.lean:491` | Generated additive form of the multiplicative universe-lift functor. |
| `Sheaf.cohomologyPresheafFunctor` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:70` | Ext from the sheafified free representable, matching the package's universe-adjusted specialization. |
| `UniformSpace.Completion`, `.algebra` | `Mathlib/Topology/UniformSpace/Completion.lean:291`; `Mathlib/Topology/Algebra/UniformRing.lean:198` | Separation quotient of Cauchy filters and the canonical completion algebra map. |
| `TauCeti.CommAlgCat.fppfTopology` | `TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:61` | Topology on the opposite category of ordinary R-algebras. Relevant to R01. |
| `HopfAlgebra.pointsPresheaf_isSheaf`, `.pointsFppfSheaf` | `TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean:57`, 72 | Subcanonical points sheaf; the existing bundled coefficient is group-valued, so the additive adapter has a purpose. |
| `AlgHom.mapValue`, `.convCommGroupOfSemiring` | `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:143`, 232 | Composition on algebra maps and the abelian convolution structure from cocommutativity. |
| `FiniteLocallyFreeCommAffineGroupSchemeCat` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:122` | Its defining predicate at line 68 requires finite, flat, locally finitely presented, and commutative; no unrelated arbitrary-group carrier. |
| `.coordinateHopfAlgebra`, `.cartierDual` | Same file, lines 298, 321 | Actual coordinate Hopf algebra and Cartier dual on the native category. |
| `.cartierDualBaseChangeNatIso` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean:172` | Natural compatibility with arbitrary base change. |
| `TauCeti.Henselization.isNoetherianRing`, `.faithfullyFlat_adicCompletion` | `TauCeti/RingTheory/Henselization/Noetherian.lean:72`, 62 | Both retain `[IsNoetherianRing R]`. |
| `TauCeti.Henselization.completionEquiv` | `TauCeti/RingTheory/Henselization/Quotient.lean:155` | R-algebra equivalence from completion of R to completion of its henselization, without Noetherianity. |

Ran the prescribed `lake env lean` on the absolute filename of the unchanged package's `Suggested.lean`, from the content checkout: exit 0, exactly two `declaration uses sorry` warnings, at lines 97 and 125. No import object file was missing and no build was needed. No broad Lake operation or pin change was performed.

A scratch copy with `#check @name` for all six declarations also elaborated. All needed binders remain:

- `pointsAddFunctor` and `coefficientSheaf`: ordinary R, CommRing R, native finite locally free commutative G.
- `flatCohomology`: additionally the actual sheaf-category `HasExt` instance, its universe, and n.
- `flatCohomology_henselian_invariance`: ideal I and `HenselianRing R I`, with separate 1≤n and 2≤n conclusions.
- `IsHenselianNonunitalSubring`: actual NonUnitalSubring B, with both explicit algebraic clauses in its body.
- `flatCohomology_algebraization`: UniformSpace, IsUniformAddGroup, IsTopologicalRing, openness, henselian criterion, ideal neighbourhood basis, G,n and 2≤n.

No binder or signature changed. A separate instance probe succeeded for sheafification into `AddCommGrpCat.{u+1}` and verified failure of instance synthesis into `AddCommGrpCat.{u}` on this large site. This supports the universe explanation in the docstring; it is not a mathematical assertion that same-universe sheafification could never be constructed by other means.

Both sorried theorems were tested in a scratch copy with closing attempts using `simp`, `rfl` and `infer_instance`; neither closed under any of the three. The supplied near-match list and object searches reveal no single library lemma proving either conclusion. In particular `Ideal.Quotient.mk_surjective` (`Mathlib/RingTheory/Ideal/Quotient/Defs.lean:124`) is surjectivity on ring elements, not on the image of an Ext-valued functor. Completion's coercion is likewise not its cohomological algebraization theorem. `plusPlusSheaf` (`Mathlib/CategoryTheory/Sites/ConcreteSheafification.lean:574`) is generic sheafification, not the coefficient adapter. `LinearMap.convCommSemiring` and `.convCommRing` (`Mathlib/RingTheory/Coalgebra/Convolution.lean:211`, 229) are convolution structures on linear maps, not either headline.

No admitted examples, sorry'd data, `set_option`, `lemma` declarations, free Prop-valued stand-ins, circular hypotheses or API-padding theorems occur. The file has four necessary definitions and two substantive theorems. The module-system `public import Mathlib` and two used individual Tau Ceti imports are the only imports. All six package-owned backticked names in the README resolve to these declarations; the remaining backticked names resolve to native or explicitly named supplier APIs.

The four stated end theorems in the Summary are accounted for:

| Headline | Acceptance file |
| --- | --- |
| §4.5 Complete animated continuity | Named as not statable: animated rings and their flat cohomology are not native pinned carriers. |
| §5.2 Henselian invariance | Stated by `flatCohomology_henselian_invariance`, at the full arbitrary-ring/arbitrary-ideal generality. |
| §5.3 Topological algebraization | Stated by `flatCohomology_algebraization`, including arbitrary compatible additive uniform structure and nonunital henselian subring. |
| §6.2 Adic descent with supports | Named as not statable: animated flat cohomology, supports and hypercover carriers are missing. |

### Ownership, supplier resolution, and order

Read the board package index before investigating missing-name leads. PerfectoidQuotientsPartII is present in this board checkout; its Q7 sections were opened directly. Supplier roadmaps already on main were resolved on main, not on revisions. New roadmaps were resolved at the indexed open heads. Read the main DerivedModuleAlgebra, EnhancedDerivedSheaves and SchemeAndStackFoundations roadmaps for house shape as well as their cited sections.

| Supplier | Resolved locations and supplied object |
| --- | --- |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1160`, 1240, 1272, 1548: §§0.12, 0.14, 0.15, 0.21. Group/torsor/stacks ranges §§1.13–1.15 and 1.18–1.22 begin at 2521, 2561, 2604, 2849, 2923, 2949, 3055, 3092. Cohomology §§2.1–2.7, 2.9–2.11, 2.15, 2.22 begin at 3374, 3420, 3442, 3477, 3501, 3554, 3613, 3719, 3772, 3795, 4001, 4604; formal geometry is Layer 4 at 5272. Named henselian, Popescu, Kummer, smooth comparison and Gabber targets resolve. |
| DerivedModuleAlgebra, main | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:649`, 1339, 1533, 1553, 1570, 1588: Koszul, ordinary square-zero, cotangent base change/localization/smoothness/regular quotients. §§1.1–1.9 at 1865, 2024, 2064, 2142, 2160, 2248, 2359, 2399, 2438; perfect complexes at 2472. Its §1.9 explicitly stops at ordinary bounded-torsion p-complete Čech descent, so the general animated hypercover contract remains additional. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:549`, 1153, 1294, 1900, 1949, 1978, 1994, 2869: E1.3, E3.2, E2:towers.1, E5:animation.1–.4, E5:cotangent-export.1. Opened the actual `animatedAlgebras`, `animatedModules`, `cotangentComplex`, ordinary comparison and bounded-totalization paragraphs. |
| ReductiveGroupsPartII, main | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:963`, 1128, 1379: RG2.0a.1–.3. Affine Weil restriction and base change resolve; smoothness is explicitly supplied at 1178. The classical group adapter should use that theorem, as its Needs line does. |
| PerfectoidQuotientsPartII, board | `packages/PerfectoidQuotientsPartII/README.md:814`, 846, 883: Q7.1–Q7.3, including the faithfully-flat filtered-colimit characterization. Nonempty products for ind-fppf are distinguished from the empty product allowed for ind-syntomic. |
| PrismaticCohomologyPartIII, #1070 | `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:105`: §6.0 supplies the three named perfect-Dieudonné/p-continuity/excision targets. Its proof routes discuss animated sheafification, deformation and smooth resolutions; the contracts specify the fuller exported coefficient/adapter interfaces. |
| PurityForFlatCohomology, #1840 | `TauCetiRoadmap/PurityForFlatCohomology/README.md:877`, 1432, 1470, 1503, 1546, 1577, 2488: §0.3, §§3.2–3.6, §7.10; §0.2 and §2.1 were also opened. Imported support/truncation/excision/hyperdescent and Brauer statements match the rewritten contract. |
| ArcTopologyAndDescent, #1755 | `TauCetiRoadmap/ArcTopologyAndDescent/README.md:1502`, 1552, 1624: §§11.2, 11.5, 12.7, read at the head. |
| HeightsRationalPointsAndObstructions, #1017 | `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:979`: §2.6c, `Brauer.affine_comparison`. It is a roadmap-owned name, not a missing native declaration. |
| DerivedDeRhamCohomology, #868 | `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:899`: §1.22, `DerivedDeRham.completionExchanges`, with the uniform lower cohomological bound retained. |
| PerfectoidQuotients, #1042 | `TauCetiRoadmap/PerfectoidQuotients/README.md:548`, 782, 831, 920: §§0.1, 0.4–0.6, the common integral perfectoid predicate, compatible-root annihilators and completed ring operations. |

The five precomputed citation leads are resolved: the missing-from-index PerfectoidQuotientsPartII is on the board; the Brauer, prismatic and derived-de-Rham names are explicitly attributed roadmap interfaces. No retired native name remains. All direct suppliers are permitted and earlier; the forbidden-supplier list is not used.

Object searches used `roadmaps grep` on main and indexed open heads, and searched the board packages. Broad source-number matches were narrowed by mathematical object, rather than treating unrelated same-number results as ownership. Opened all five closest roadmap scopes: PurityForFlatCohomology (#1840), ArcTopologyAndDescent (#1755), PrismaticCohomologyPartIII (#1070), PrismaticCohomology (#1057), and EtaleDualityAndPerverseSheavesPartII (#1743). The latter's excellent-base étale duality, finiteness and tilting targets do not own this package's finite-flat henselian/topological headlines. Ordinary finite-étale henselian comparison and ordinary Beauville–Laszlo module patching are different objects from the unrestricted animated arithmetic square here. No other readable package's Suggested file declares these six fully qualified names.

The overlap report has no conflicting head, dropped cited ID, or dependency on numbering defined only by an open revision. The service's references to this package in Purity are descriptive import/ownership prose, not consumed old section-number targets; no externally consumed removed section ID was found. Thus no old→new numbering repair is required by the overlap rules for the submitted version. The two findings concern internal site precision and organization, not supplier drift.

The prescribed dependency check on the unchanged README returned:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No merge-order file was edited.

The README has all required top-level sections, mathematical layer names, per-target dependencies and seven Examples/Dependencies endings. The later order is supported by explicit dependencies: completion inputs feed bounded continuity, principal complete descent precedes general continuity, and henselian invariance precedes topological algebraization and final supported descent. No heading is a source chapter heading and no claim says to follow the source's exposition. The independent preliminary run in Layers 1–3 is the exception recorded in R02. Definitions have prose API lists and at least three Checks; the site Checks require the additional object-level distinction in R01. No route-specific restriction, computational algorithm, copied source passage, process narrative, job identifier, machine path, HTML anchor or pull-request number was found in the package text. Reference publication/version dates are bibliographic, not process residue. `metadata.toml`'s math.AG topic is appropriate.

## Not verifiable

No seeded source is unreadable and no new source request is pending. This review does not claim that the 19 declared supplier contracts are already implemented or exported at the pins; they remain explicit future supply contracts. Nor does it independently re-prove external literature used inside the cited sources. The source checks establish the statements and proof steps consumed here at their locators.

The computations are adversarial instances, not formal proofs of every future theorem. Lean verified elaboration, signatures, the stated tactic probes and universe instance behavior only. Ownership checks cover the supplied main, board and indexed-head corpus, not inaccessible or unindexed work. Some broad roadmap searches cap their output; narrower object/name searches and direct reading of the closest suppliers were used to resolve relevant candidates rather than asserting an exhaustive absence from a truncated search.

## Source issues

- **Misprint** in CS24 at §5.2.1, printed page 53, line 2212: the source says a graded tensor product is identified with a single unbound degree on the other side; it should be graded homotopy on both sides, or the same fixed degree on both; affects nothing.
- **Misprint** in CS24 at Example 5.6.7, printed page 75, line 3166: the source introduces the comparison only for degrees at least two, then asserts degree-one surjectivity; it should introduce the comparison for degrees at least one; affects nothing.
- **Misprint** in CS24 at proof of Theorem 5.7.2, printed page 79, line 3307: the source says invertibility of p in π₀A makes G étale over R; it should say the base change of G to R[1/p] is étale; affects the proof.
- **Misprint** in CS24 at proof of Theorem 5.7.2, printed page 79, line 3336: the source repeats the second equation reference in its list of three descent comparisons; it should end the list with equation (5.7.2.3); affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9308044ae12a7118f5948d425355ac6abc23058d", "job": "REV-PKG-SchemeAndStackFoundationsPartII~3", "model": "gpt-6-astra", "worker": "chris-9"} -->
