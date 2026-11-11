<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13142#issuecomment-6787697779 -->
Red team round 1 pass a (codex) of f848ec1

Verdict: needs_changes

1. **F01** (P3) The de Jong locator does not support torsor limit descent

   - **Location:** `packages/SchemeAndStackFoundationsPartII/README.md:97`: “DJ §3.1, p.4”.
   - **Claim:** This locator supports descent of torsors, isomorphisms and finite diagrams along filtered colimits of rings.
   - **Witness:** DJ lines 158–159, §3.1, p.4, introduces surjectivity of the Azumaya-to-cohomological Brauer map and fixes a torsion class. It says nothing about filtered systems or torsor descent.
   - **Exact repair text:** Replace the final parenthetical citation by “(CS24 Lemma 5.3.1, Claim 5.3.5.3 and Corollary 5.2.10, pp.57–60).” Remove DJ from the README References if it has no remaining use; its cached provenance may remain in `sources.toml`. Keep the declared supplier contract.
   - **Repair check:** At a constant ring diagram the torsor groupoid and every finite diagram are unchanged. Removing the unrelated Brauer citation changes neither this instance nor the contract's generality; CS24 Claim 5.3.5.3 uses the relevant fppf limit argument.

2. **F02** (P1) The homotopy Tor spectral sequence has no declared supplier

   - **Location:** `packages/SchemeAndStackFoundationsPartII/README.md:240–242`: “Use the homotopy Tor spectral sequence”.
   - **Claim:** §1.1 and EnhancedDerivedSheaves E5:animation.4 supply the inputs to this proof of the graded flat tensor formula.
   - **Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:2010–2012` supplies module categories, their discrete comparison and base change, not this spectral sequence. CS24 lines 2207–2212 explicitly invokes a separate spectral-sequence theorem.
   - **Exact repair text:** Add under the EnhancedDerivedSheaves contracts: “What EnhancedDerivedSheaves must provide (gap:animated-tensor-spectral-sequence): For a connective animated ring A and connective animated A-modules N and M, construct the natural convergent homotopy spectral sequence E²_(s,t)=Tor_s^(π_*A)(π_*N,π_*M)_t ⇒ π_(s+t)(N⊗^L_A M), with its edge map induced by the canonical homotopy tensor map. Section: E5:animation.4. (CS24 §5.2.1, p.53.)” Add the same slug, supplier, section and needs to the plan's `gaps`, and add `gap:animated-tensor-spectral-sequence` to §1.2's *Needs* and Layer 1 Dependencies. The spectral sequence remains with the earlier owner of animated modules.
   - **Repair check:** For A=ℤ and M=N=𝔽₂, E²_(0,0)=E²_(1,0)=𝔽₂ and the abutment has π₀=π₁=𝔽₂. For flat M=ℤ₂ and N=𝔽₂ only E²_(0,0)=𝔽₂ survives, giving the stated flat tensor formula. These distinguish the required general animated tensor input from ordinary flat base change. Searches by Tor/spectral-sequence objects found ordinary-ring and chain-complex variants, not this graded homotopy input among the cited suppliers or pinned declarations.

3. **F03** (P2) The group adapter gap duplicates supplied Weil-restriction smoothness

   - **Location:** `packages/SchemeAndStackFoundationsPartII/README.md:101`: “including smoothness of Res_(X/S)𝔾_m for finite locally free X/S”; the same clause occurs in `design/plan.json`, gap `classical-affine-group-adapter`.
   - **Claim:** Smoothness of this Weil restriction is missing and must be supplied by SchemeAndStackFoundations.
   - **Witness:** `TauCetiRoadmap/ReductiveGroupsPartII/README.md:1178–1192` on main already supplies `smooth_res` for arbitrary smooth affine algebras along finite locally free maps. Apply it to 𝔾_m; no field or reducedness hypothesis is imposed.
   - **Exact repair text:** Replace that gap's needs in both files by “For ordinary rings, connect the native affine Hopf-algebra group-point functors and finite locally free Cartier duality with the smooth affine commutative group-scheme category.” Add after its locator: “Smoothness of Res_(X/S)𝔾_m for finite locally free X/S is supplied by ReductiveGroupsPartII §RG2.0a.2, Weil restriction preserves smoothness and closed immersions (`smooth_res`).” Include this existing smoothness export in the ReductiveGroupsPartII supplier paragraph. Keep the actual carrier adapter as a gap.
   - **Repair check:** For X=S the group is 𝔾_m; for X=Spec(k[ε]/ε²) its units are a+bε with a invertible, giving the smooth scheme 𝔾_m×𝔸¹. Both are covered by the existing arbitrary finite-locally-free theorem, including the nonreduced second example.

## Verified sound

Read all 766 README lines and all 138 Lean lines. The audit covers 6 Lean declarations (4 definitions and 2 theorems), all 31 numbered README targets, 107 Check bullets, the additional API assertions and conventions, and all 19 declared gaps. The tables below record computed values, including negative controls; no numerical execution or Lean build was used.

The four end theorems are §§4.5, 5.2, 5.3 and 6.2. The two ordinary theorems are stated on native carriers. The other two require animated rings and animated supported cohomology and are identified individually in the module docstring. The four retained definitions serve the two actual headlines. Neither theorem reduces to one existing lemma or to its own hypotheses. No padding, sorry-valued data, placeholder predicate, missing standing instance, forbidden option or duplicate fully qualified declaration was found. The six supplied elaborated signatures agree with the written binders, including `HasExt`, `HenselianRing` and every topology assumption.

The 24 pinned supplier-table entries (13 Mathlib, 11 Tau Ceti) resolve at their stated files and lines. In particular, `HenselianRing` includes Jacobson containment, the native finite locally free commutative group carrier includes the group laws and cocommutativity, and the cohomology definition lifts coefficient values before sheafification. Ordinary sheaf cohomology is not confused with the group of points or with étale cohomology of a nonsmooth group. The two Tau Ceti henselization Noetherian/flatness instances have their Noetherian hypothesis; `completionEquiv` has no such hypothesis.

All 19 gap slugs, suppliers and needs sentences agree exactly between the README and `design/plan.json`. None has supplier `none`. Their mathematical boundary tests appear below. R03 concerns minimality, not the absence of a promised future export.

Resolved the 11 named roadmap supplier-contract groups against their available texts: SchemeAndStackFoundations, PerfectoidQuotientsPartII, PrismaticCohomologyPartIII, PurityForFlatCohomology, HeightsRationalPointsAndObstructions, EnhancedDerivedSheaves, DerivedModuleAlgebra, DerivedDeRhamCohomology, PerfectoidQuotients, ReductiveGroupsPartII and ArcTopologyAndDescent. The five resolver leads do not establish missing citations: the four apparent missing Lean names are README targets of their cited suppliers, and PerfectoidQuotientsPartII Q7 exists in the earlier board package. Its Q7.1–Q7.3 are the imported ind-flat-map owner. Parent section references remain resolvable; no broken dropped identifier was found.

Ownership searches used `roadmaps grep`, `roadmaps show`, the main and completed roadmaps, board packages and the supplied open-head material. Compared the nearest owners of animated modules, completion, derived glueing, supports, arc descent and finite-flat cohomology. This package's animated-ring glueing is distinct from module Beauville–Laszlo glueing; its henselian/topological conclusions are distinct from the imported p-primary continuity theorem. No repeated Lean fully qualified name was found. R02 and R03 are the unresolved proof-input/ownership defects.

The package diff against `origin/main` contains only six files within this package. No roadmap source was changed in this review. No forbidden supplier, computational algorithm, pull-request number or process narrative was found in README or Lean. Dependencies between the displayed layers run forward; the independent low-degree H² lemma precedes full henselian invariance.

The requested dependency command returned:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This mechanical result does not detect the absent proof prerequisite in R02.

### Source verification ledger

Verified the primary locator bundle for each of the 31 numbered targets, and checked the source bundles attached to all 19 contracts, using all 8 manifest source entries. Repeated uses of one locator are counted by target/contract, not as additional distinct theorems. DJ's extra locator is unsupported as described in R01. Printed preprint pages and the manifest's explicit version numbering were used. The Stacks dualizing-complex extraction and more-algebra extraction share the same SP key; table entries specify the chapter where needed.

| Targets or contracts | Verified source anchors | Scope comparison |
| --- | --- | --- |
| §0.1; perfection covers; covariant convention | CS24 line 1538 (§4.1.5); line 1547 (Lemma 4.1.6); line 1495 (§4.1.2) | Quasi-compact covering condition, perfection and the directions of F,V retained. |
| §§1.1–1.3 | CS24 line 2200 (§5.2.1); line 2216 (Lemma 5.2.2) | Graded tensor and nilpotent kernel retained; source's graded-index misprint is not copied. |
| §§1.4–1.6 | CS24 line 2241 (§5.2.3); line 2256 (Proposition 5.2.4); line 2279 (§5.2.5); line 2345 (Corollary 5.2.7); line 3088 (henselization in proof of Lemma 5.6.5) | Big-site enlargement is explicitly distinguished from the source's flat-object subcategories. Tower accuracy uses compatible truncation equivalences. |
| §§2.1–2.4; animation, square-zero and cotangent contracts | CS24 line 2016 (Proposition 5.1.5); line 2032 (Example 5.1.6); line 2114 (§5.1.9); line 2134 (Example 5.1.10); line 2149 (§5.1.11); line 2165 (Proposition 5.1.12); line 2171 (Theorem 5.1.13); line 2188 (Remark 5.1.14); line 2505 (p-power annihilator) | Connective points and untruncated cohomology triangles kept separate. Finite presentation is present where amplitude needs it. |
| §§3.1–3.4 | CS24 line 2408 (Lemma 5.3.1), line 2419 (Remark 5.3.2), line 2422 (Lemma 5.3.3), line 2433 (Lemma 5.3.4), line 2591 (Lemma 5.4.1) | Arbitrary rings, faithful split refinement, derived residue equivalence and semiperfect/perfect hypotheses match. |
| §§4.1–4.7 | CS24 line 2974 (Lemma 5.6.2), line 2982 (Lemma 5.6.3), line 3000 (Lemma 5.6.4), line 3081 (Lemma 5.6.5), line 3138 (Theorem 5.6.6), line 3162 (Example 5.6.7), line 3181 (Remark 5.6.8) | Correct finite-ideal, completeness, low-degree and lim¹ qualifications; no termwise replacement by ordinary quotients. |
| §5.0; nonunital criterion | CS24 line 2279 (§5.2.5); BC22 line 214 (§2.1.1); SP more-algebra line 1369 (09XI) | Native Ext model and full Gabber criterion, including the polynomial-root clause. |
| §5.1; stack/torsor contracts | BC22 line 253 (Lemma 2.1.3), line 283 (Proposition 2.1.4), line 306 (Theorem 2.1.6) | Noetherian regular completion used only for the finitary-functor lemma; stack diagonal and torsor hypotheses retained. |
| §§5.2–5.6 | CS24 line 3190 (Corollary 5.6.9), line 3209 (Corollary 5.6.10), line 3217 (Example 5.6.11), line 3223 (Corollary 5.6.12), line 3239 (Corollary 5.6.13) | High-degree range, general nonunital topology, punctured-open conditions and the nonflat Noetherian comparison match. |
| §§6.1–6.2; complete module contract | CS24 line 3261 (Lemma 5.7.1); line 3288 (Theorem 5.7.2); line 3352 (square-zero step) | Discreteness, not ordinary flatness; support-only descent without completeness. |
| Bégueri, Ext and group adapter contracts | BG80 line 632 (§2.1), line 726 (§2.2), line 746 (Proposition 2.2.1); CS24 line 318 (§1.4); R70 line 978 (Lemma 6.2.2) | Sheaf Ext vanishing, not global Ext vanishing; unnormalized symmetric cocycles. Source proof correction recorded below. |
| Cauchy algebraization; punctured H² contract | BC22 line 432 (§2.1.12), line 443 (Lemma 2.1.13), line 458 (Theorem 2.1.15), line 1247 (Corollary 2.3.5) | Nets, not just sequences; no additional flatness assumption on the Noetherian comparison. |
| Adic-flat module contract | Y18 line 217 (Theorem 1.8), line 587 (Theorem 4.3), line 704 (Theorem 5.9) | Weak proregularity and adic flatness retained; preprint numbering declared. |
| Koszul/geometric-support contract | SP dualizing-complexes line 589 (0A6R), line 662 (base change), line 686 (tensor); line 507 (0954), line 744 (§47.10) | Geometric Čech support works without weak proregularity; derived ideal-power torsion is not silently identified with it. |
| Animated cohomology/deformation contracts | CS24 line 2279 (§5.2.5), line 2300 ((5.2.5.1)), line 2356 (Theorem 5.2.8) | Ordinary R and ordinary smooth or finite locally free G, with animated test algebras. |
| Torsor limit/effectivity contracts | CS24 line 2408, line 2459 (Claim 5.3.5.3), line 2378 (Corollary 5.2.10), line 3000 (Lemma 5.6.4 and proof) | Finite presentation in limit arguments; complete ordinary ring for effectivity. R01 removes DJ. |
| Henselized formal fibres | SP more-algebra line 6106 (0AH2), line 6126 (0AH3); CS24 line 3199 (proof of Corollary 5.6.9) | Regularity separated from pinned Noetherianity and faithful flatness. |
| Imported truncation, excision and descent | CS24 line 2318 (5.2.6), line 2366 (5.2.9), line 2378 (5.2.10), line 2537 (5.3.7), line 2560 (5.3.8), line 2800 (5.4.3), line 2816 (5.4.4), line 2832 (5.4.5), line 2893 (5.5.2), line 2939 (5.5.3) | Matches PurityForFlatCohomology §§3.2–3.6; these remain imports. |
| Brauer convention | C19 line 91 (§1.5) | Torsion cohomological Brauer group distinguished from full H² and from the Azumaya presentation. |

## Statement and instance audit

Here k is a nonzero field and p is prime. Values are mathematical computations, not Lean evaluations. “Retain” means no correction to that statement was found, not that its future proof has been formalized. Sections identify `packages/SchemeAndStackFoundationsPartII/README.md`; Lean lines identify its `Suggested.lean`.

### Every Lean declaration and its context

| Declaration / line / README | Actual binder and instance context | Instances and computed values | Result / change |
| --- | --- | --- | --- |
| pointsAddFunctor / 52 / §5.0 | R : Type u; CommRing R; G in native finite locally free commutative affine group category over R; no section variables | G=1: Hom_R-alg(R,A) is a singleton, additive group 0. G=μ₂,A=ℤ/4: maps send T to 1 or 3, giving C₂. G=α₂,A=𝔽₂[ε]/ε²: images of T are 0,ε, giving C₂. | Real body; correct convolution and covariance; retain. |
| coefficientSheaf / 72 / §5.0 | Same R,G; sheaves on (CommAlgCat.{u} R)ᵒᵖ, values AddCommGrpCat.{u+1} | Same three point sets become ULift of 0,C₂,C₂. A representable points functor is already an fppf sheaf, so sheafification adds no sections. On α₂ over 𝔽₂[t], H⁰=0 but its torsor cohomology is nonzero. | Lift is in values before sheafification; retain. |
| flatCohomology / 83 / §5.0 | Same R,G; n : ℕ; HasExt.{w} on the precise larger-valued sheaf category | G=1: Extⁿ(free representable,0)=0 for every n. μ₂ over ℤ₂: H⁰=C₂, H¹=C₂², H²=0. α₂ over 𝔽₂[t]: H¹ has the nonzero class t. | Ext source represents evaluation; algebra maps induce the right covariance. Retain. |
| flatCohomology_henselian_invariance / 97 / §5.2 | R, CommRing, HasExt as above; I : Ideal R; explicit HenselianRing R I; native G; n : ℕ | (ℤ₂,(2)),μ₂,n=1: C₂²→0, surjective and not injective. n=2: 0→0, bijective. n=0: neither inequality is true, so no assertion. I=0: identity in all degrees. R=0: 0→0. | No lost henselian binder; no hidden Noetherian assumption; retain. |
| IsHenselianNonunitalSubring / 114 / §5.0 | B : Type u; CommRing B; B′ : NonUnitalSubring B | B′=0: y=r=0, polynomial value 1^N·0+0=0. B′=pℤ_p: y=−x/(1+x) is in pℤ_p and the special polynomial has a simple root at 1 modulo p. B′=ℤ: x=1 would require 2(1+y)=1, impossible. B′=3ℤ_(3): quasi-inverses exist, but N=1,a₀=−3,a₁=0 gives T²−T−3, discriminant 13, no rational root. | Both conjuncts necessary; N=0 is intentionally excluded; no sorry data; retain. |
| flatCohomology_algebraization / 125 / §5.3 | B, CommRing, UniformSpace, IsUniformAddGroup, IsTopologicalRing, HasExt; B′ open; explicit henselian predicate and open additive B′-ideal basis; native G,n; 2≤n | Discrete B,B′=0: completion B, identity. Coarse I-topology on henselian (A,I): completion A/I, same high-degree map as §5.2. B=𝔽_p{t},B′=tB: H²(μ_p)=0→0; H¹ source countable and target uncountable, so the omitted n=1 would fail. | All topological and algebraic hypotheses survive; separatedness is not assumed. Retain. |

The supplied elaborated signatures were compared against all six declarations and the README. There are no ambient `variable` blocks: every required instance is in the declaration itself. No elaboration was run in this read-only pass. Neither theorem is proved by one library lemma or a definition; the four definitions are used by them. No padding deletion is indicated.

### Every numbered README target, with all its Check instances

| Target | Instances tried and values computed on the two sides | Result / change |
| --- | --- | --- |
| §0.1 pro-fppf site | Identity: full image. Two components of Spec(k×k): union of the two points; one component: one point, not a cover. Faithfully flat finitely presented singleton: full image in both sites. ℤ→ℚ: image {(0)}, missing every (p). ℤ→ℤ[1/2] together with ℤ_(2): D(2)∪{(0),(2)}=Spec ℤ. ℤ/4→(ℤ/4)[X]: all fibres nonempty affine lines. | Retain; no covering claim for a merely flat map. |
| §1.1 animated flatness | A=k⊕k[1],M=k: π₁A⊗k=k but π₁M=0; false flatness and false faithful flatness despite π₀ being faithful. A[X]: both degree-i modules are (π_iA)[X]. ℤ/4→𝔽₂: Tor₁=𝔽₂, not flat. M=0 over k: all flatness maps 0→0 but faithfulness fails since k⊗0=0; over 0 the unique module is faithful. | Retain. |
| §1.2 flat tensor and base change | ℤ,ℤ_p,𝔽_p: π₀=𝔽_p on both sides, higher groups 0. k,k,k[1]: π₁=k,π₀=0 on both sides. A[X]⊗_A B=B[X], degree i equals (π_iB)[X]. Nonflat negative control ℤ/4,M=N=𝔽₂ has Tor₁=𝔽₂, which an underived tensor would erase. | Statement sound; R02 supplies the proof input. |
| §1.3 nilpotent detection | ℤ/4→𝔽₂,M=𝔽₂: both flatness assertions false, Tor₁ of the reduction is 𝔽₂. M=A: reduction B is rank-one free, both assertions true. ℤ→ℚ,M=ℤ/2: 0 after tensor, nonzero before, showing why surjective π₀ with nilpotent kernel is needed. M=0: both sides 0. | Retain, including both directions. |
| §1.4 sites | Over ℤ/4, flat animated algebras have π_i=0 for i>0; G_a cohomology at the base is (ℤ/4)[0]. Over k, B=k⊕k[1] is an object: π₁=k, and any faithful B′ has π₁B′=π₀B′≠0. A=k⊕k[1]→k has π₁ comparison k→0, so is no cover despite π₀ being étale. k×k component family has two-point image; a singleton has one. (ℤ/p²)/^Lp has π₀=π₁=𝔽_p, versus π₁=0 for the ordinary quotient. | Retain the corrected ordinary-subcategory/value comparisons. |
| §1.5 animated henselization | Ordinary A: π₀=A^h_I,π_i=0 for i>0. A=k⊕k[1],I=0: π₀=π₁=k before and after. Same A already henselian along 0: unit is identity on both groups. Additional negative control (ℤ_(3),(3)): T²−T−3 has no root before henselization and has the specified root after it. I=(1): henselization is 0. | Retain; the last two tests distinguish identity and zero wrong models. |
| §1.6 accurate towers | A=k⊕k[1],A_n=τ≤nA: π₁ of tail=k, giving H⁻¹(G_a)=k on both sides. Constant A_n=A: both values RΓ(A,G). A=0: every unital A-algebra is 0, so both complexes 0. | Retain; compatibility of truncation comparisons is stated. |
| §2.1 animated points | G_a(k⊕k[1]): π₀=π₁=k. G_m(discrete A): π₀=A× and higher π_i=0. G_a(0)=0. For G_m(𝔽₂), the point group is trivial, whereas G_a(𝔽₂)=C₂; ordinary multiplicative/additive structures are not confused. | Retain. |
| §2.2 identity cotangent | G_a:C=R[0]; tangent fibre over identity is M. G_m:C=R·dlog[0]; 1+εx corresponds to x. μ_p/𝔽_p:C=[k→⁰k], H⁻¹=H⁰=k; a tangent-space-only model has H⁻¹=0. Under [n]:G_m→G_m, dlog pulls back to n·dlog, including n=0. | Retain contravariance and shift. |
| §2.3 amplitude | μ_p/𝔽_p has both endpoints k. μ_p/ℤ has [ℤ→ᵖℤ], H⁻¹=0,H⁰=𝔽_p, and multiplication by p is homotopic to 0; localization at p is 0. G_a/𝔽₂ has C=𝔽₂[0]. Trivial G has C=0. | Retain; stronger p-power-annihilation clause adds to imported amplitude. |
| §2.4 point deformation | G_m(k[ε]/ε²)→G_m(k): fibre 1+εk≅k; RHom(k,k[1])=k[1], π₀=0,π₁=k. μ_p/𝔽_p: point map k→0; obstruction π₀=k receives zero, so not surjective, and the untruncated point triangle would fail. M=0: target 0 and point map an equivalence. | Retain animated-abelian-group qualification. |
| §3.1 split refinements | Algebraically closed k: any nonempty finitely presented cover has a k-point, so H^{>0}=0. Nonzero R: faithful flatness precludes target 0 since R⊗0=0. R=0: unique refinement 0 and all cohomology 0. 𝔽₂ itself fails splitting for its finite étale algebra 𝔽₄, so the construction cannot always return R. | Retain. |
| §3.2 derived glueing | ℤ→ℤ_p: intersection ℤ_p∩ℤ[1/p]=ℤ and sum ℤ_p+ℤ[1/p]=ℚ_p, so H⁰ of the fibre is ℤ and H¹=0. a=1: fibre of difference A′⊕A→A′ is A. a=0: cone of 0 is A⊕A[1], and residue equivalence detects A≃A′; both localizations are 0. | Retain no torsion bound. |
| §3.3 completed π₀ defect | A=ℤ,a=p: π₁ quotient=0, kernel 0 and both completions ℤ_p. A=ℤ/p²,a=p: π₁ tower transitions multiply by p and two-step transitions are 0, so lim¹=0 and π₀ completion=ℤ/p². a=1: every quotient 0 and both limits 0. | Retain. Tests alone do not prove the square-zero assertion; source supplies multiplicative filtration. |
| §3.4 semiperfect perfection | A=A′ perfect: nilkernel 0, both residues identical. A=𝔽_p,A′=𝔽_p[t^(1/p∞)]/(t),a=1: t^(1/p)≠0 in nilkernel, multiplication by 1 bijective, both derived residues 0. a=0: residue equivalence forces A=A′ and nilkernel 0. | Retain. |
| §4.1 completeness⇒henselian | ℤ_p,(p): completion ℤ_p and henselian true. 𝔽_p⊕𝔽_p[1],I=0: completion same animated ring; π₀ pair (𝔽_p,0) henselian. ℤ,(p): completion ℤ_p≠ℤ and p∉Jac(ℤ)=0, both relevant properties fail. Unit ideal: completeness forces 0. | Retain; no assertion of classical completeness of π₀. |
| §4.2 H² henselian invariance | ℤ_p,μ_p: H²=Br(ℤ_p)[p]=0→0, while for odd p H¹=ℤ/p. I=0: identity. ℂ[[t]],μ_n,n≥1: Pic=Br=0, so H²=0 on both sides. | Retain. |
| §4.3 bounded continuity | ℤ_p,μ_p,p odd: H¹=C_p both before and after the limit; H^{≥2}=0. a=1: complete A=0, both complexes 0. G=1: all groups 0 for every A. μ₂ over ℤ₂ supplies extra check H¹=C₂², so odd-p unit calculation is not universal. | Retain. |
| §4.4 principal complete descent | A=ℤ[[t]],a=t,R=ℤ,identity hypercover: totalization RΓ(A,G), parameter need not be in R. ℤ_p→ℤ_p²: split Čech augmentation is contracted, totalization RΓ(ℤ_p,G). a=1: all complete terms 0, both values 0. | Retain. |
| §4.5 complete continuity | Empty tuple: every quotient A, limit RΓ(A,G). ℤ_p,μ_p,p odd: inverse-limit unit quotient C_p=H¹. ℤ/p²,p: first derived quotient has π₀=π₁=𝔽_p, ordinary quotient only π₀=𝔽_p; π₁ transitions become zero, not termwise equivalences. | Retain. |
| §4.6 ordinary quotients / lim¹ | ℤ_p,μ_p,p odd: C_p→0 is onto, not one-to-one. For n≥2, μ_p(ℤ/pⁿ)={1+c p^(n−1)}; sufficiently late reduction to any fixed level is 1, so lim¹=0, inverse-limit H¹=C_p. I=0: constant tower, lim¹=0. At p=2 the torsor group is C₂²; the odd-p restriction matters. | Retain both exact sequences. |
| §4.7 failure in degree one | R=𝔽_p{t}: countable R×/R×ᵖ, Pic=0. Completed ring: classes 1+t h(tᵖ) indexed injectively by h∈𝔽_p[[tᵖ]], uncountably many. If (1+t h)/(1+t g)=u(tᵖ), comparison of residues 0 and 1 mod p gives u=1,h=g. Both Brauer groups and H²(μ_p) are 0. | Retain. |
| §5.0 ordinary cohomology / nonunital rings | α_p/𝔽_p[t]: H¹=𝔽_p[t]/𝔽_p[t]ᵖ, t≠0, versus étale H¹=0. μ_p/ℤ_p: odd p gives C_p; p=2 gives C₂² with −1,5 generators. G=1: Hⁿ=0 including n=0. Nonunital examples: 0 and pℤ_p pass; ℤ fails at x=1; 3ℤ_(3) passes quasi-inverses but fails T²−T−3. | Retain all four real definitions. |
| §5.1 finitary completion comparison | A=ℤ_(p)^h,F(C)=C: inclusion A→ℤ_p, and residue 1 lifts to 1 on both sides. I=0: Â=A, identity. Constant F={0,1}: both comparisons identity. Additional F(C)={x:x²−x−3=0}: at p=3 both A and completion have the two Hensel lifts, so each residue lift agrees. | Retain both directions of lifting criterion. |
| §5.2 henselian invariance | ℤ_(p)^h,μ_p,odd p: H¹=C_p→0; H²=0→0. I=0: identity. 𝔽_p[[t]],α_p: H¹=R/Rᵖ contains t≠0, reducing onto 0; H²=0→0. R=0: all values 0. | Retain; Lean states precisely this. |
| §5.3 topological algebraization | 𝔽_p{t}→𝔽_p[[t]]: H²(μ_p)=0→0, H¹ countable→uncountable. Discrete B: B̂=B. Coarse I-topology: B̂=A/I. Nonhenselian ℤ_(3),3ℤ_(3): a Brauer class ramified at 2 and 5 with invariants 1/3,−1/3 is nonzero over ℤ_(3), but H²(𝔽₃,μ₃)=0. | Retain; last negative control explains full henselian condition. |
| §5.4 Laurent algebraization | 𝔽_p{t}[1/t] and 𝔽_p((t)): H²(μ_p)=C_p on each, by henselian DVR residue invariant. H¹ unit quotients countable versus uncountable. G=1: 0 in all degrees. R=0: both Laurent rings 0. | Retain. |
| §5.5 punctured animated comparison | ℤ_(p)^h→ℤ_p,I=(p): fraction fields have H²(μ_p)=C_p on each. I=0: residue condition detects A≃A′, U empty and both groups 0. I=(1): Jacobson containment forces π₀A=0, hence A=0, both groups 0. | Retain. |
| §5.6 Noetherian open comparison | ℤ_(p)^h→ℤ_p,U=D(p): H²(μ_p)=C_p→C_p. Identity R→R: comparison identity for each allowed U. I=0: first quotient forces R=R′. Choosing U=Spec R instead of D(p) changes both H² groups to 0 in the first example. | Retain no extra flatness assumption. |
| §6.1 completely flat perfectoid modules | M=A: all reductions rank-one free, M discrete. A=𝔽_p,I=0,M=A[1]: reduction has π₁=A≠0 and is not flat over discrete A. M=0: all reductions 0 flat, discrete conclusion true. Unit ideal: completeness forces M=0. | Retain discreteness only; no ordinary-flatness overclaim. |
| §6.2 supported adic descent | I=(1): V(I)=∅, both supported complexes 0 even for nonzero noncomplete A. Empty tuple:I=0, support whole Spec A, hypothesis actual fpqc hypercover and both sides ordinary fpqc descent. A→A² split cover: fibre of restriction has contracted Čech augmentation, totalization RΓ_I(A,G). A=k[t],I=(t): G_a support model has H¹=k[t,t⁻¹]/k[t]; for (t²) the same support, though ordinary quotients k[t]/t and k[t]/t² differ. | Retain full-cohomology completeness qualification. |

### Additional API assertions and conventions

| Statement | Computed instance / wrong-model test | Result / change |
| --- | --- | --- |
| Ordinary base and commutative coefficients | μ₂/𝔽₂ has coordinate rank 2, including characteristic 2; G=1 has rank 1. A nontrivial S₃ constant group is not a commutative coefficient; rank-zero coordinate algebra cannot define a group over nonzero base since there is no unit section. | Retain; excluded cases are not counterexamples. |
| π_i=H⁻ⁱ | k⊕k[1] has π₀=π₁=k and H⁰=H⁻¹=k. | Retain. |
| Covariant F,V and fib(V−1) | Over 𝔽₂ or 𝔽₃: ℤ/p has V=1,F=0, so fibre of 0:k→k has H⁰=H¹=k; μ_p has V=0,F=1, so fibre of −1 is 0. n=0 gives module W/p⁰=0 for the trivial group. | Retain; kernel alone misses H¹. |
| Derived quotient convention | Over ℤ/p², ker(p)=coker(p)=𝔽_p, in π₁,π₀ respectively. Over ℤ, p has ker 0 and cokernel 𝔽_p. | Retain; no canonical π₀A→A inserted. |
| Support direction and radical invariance | I=1: fib(id)=0; I=0:fib(RΓ→0)=RΓ. D(t)=D(t²), hence equal fibres; k[t]/t≠k[t]/t². | Retain. |
| Henselian vs complete/local | (ℤ,2ℤ) fails Jac containment; (ℤ₂,2ℤ₂) passes; (R,0) passes even for R=k×k, which is not local. | Retain. |
| Dorroh multiplication and ideal criterion | (1,0)(n,y)=(n,y); (0,x)(0,y)=(0,xy); (1,x)(1,y)=(1,0) iff x+y+xy=0. Expanding the root polynomial at (1,r) has integer part 0 and exactly the Lean sum as its second part. | Retain; coordinatewise product would fail the unit law. |
| Brauer distinctions / Kummer | For local R=ℤ_p: Pic=0, H²(μ_p)=Br(R)[p]=0, but H¹(μ₂) over ℤ₂=C₂². For a field, H²(G_m) is torsion; this computation alone makes no claim for arbitrary schemes. | Retain. |
| §0.1 fppf inclusion / fpqc inclusion | ℤ→ℤ[X] is faithfully flat finitely presented, all three singleton-cover conditions true; ℤ→ℚ has all three false as a covering singleton. | Retain. |
| §0.1 base change | Component cover k×k→{k,k}, base change to the first k gives {k,0}; union of images still Spec k. | Retain, zero components allowed. |
| §0.1 composition | Refine each component of k×k by an identity: composite images still both points; omit one and only one point remains. | Retain. |
| §0.1 affine ind-fppf equivalence | ℤ→ℤ[X_i:i∈ℕ] is a filtered polynomial colimit, faithfully flat and a singleton cover; ℤ→ℚ is ind-flat but neither ind-fppf nor covering. | Retain. |
| §0.1 subcanonicity | For the component cover, maps Spec(k×k)→Spec T correspond to pairs of maps T→k; empty overlap imposes no extra equality. | Retain. |
| §1.1 ordinary discrete reduction / transport | Over k, flat M has π_i=π_i(k)⊗π₀M=0 for i>0. An isomorphism k×k→k×k swapping factors permutes both sides of each flatness comparison. | Retain. |
| §1.1 faithfulness / zero module | 0 is flat over k but k⊗0=0; over zero base all modules are 0 and the tensor functor is faithful on the one-object category. | Retain. |
| §1.4 étale→fppf→fpqc | k×k→k is a flat finitely presented component projection; the pair of projections covers and has finite subcover of size 2. | Retain. |
| §1.4 restriction to flat objects | k-base flat objects have no positive homotopy. At B=k⊕k[1], a finite étale lift of k′/k has π₀=π₁=k′. Tensor of two flat objects remains flat. | Retain. |
| §1.4 ordinary-object comparison | Map(k⊕k[1],k) is Hom(k,k), a singleton; α_p over k[t] retains H¹=k[t]/k[t]ᵖ on the ordinary fppf site. | Retain. |
| §1.4 ordinary objects are not a cover basis | B=k⊕k[1], any faithful B′ has π₁B′=π₀B′≠0. A family of discrete objects has all π₁=0, contradicting faithful detection of π₁B. | Retain. |
| §1.4 finite-subfamily fpqc condition | ℤ→{ℤ_(p)} over all primes is jointly surjective; each image {(0),(p)}. Every finite subfamily misses infinitely many closed points, hence is not fpqc under the stated definition. | Retain. |
| §1.5 universal map and uniqueness | I=0 gives A→A; maps out extend by the identical map. I=1 gives 0 and admits maps only to B with π₀B=0, namely B=0; mapping space is contractible. | Retain. |
| §1.5 functoriality | Two successive identity maps of (k⊕k[1],0) act by id on π₀=k and π₁=k; scalar extension along k→k′ gives k′ in each degree. | Retain. |
| §2.1 functoriality / limits / base change | G_a(A×B)=A⊕B, G_m(A×B)=A××B×; base change k→k′ gives G_a(k′)=k′ and G_m(k′)=k′× by both evaluations. | Retain; limits here are in animated abelian groups. |
| §2.2 corepresentation and group-map direction | For G_a and M=k[1], Map(k,M) has π₁=k, not just the zero set of degree-zero module maps. [2] on G_m/𝔽₂ pulls dlog back to 0, not id. | Retain. |
| §2.2 scalar extension / ℤ-action | C_(G_m/k)⊗k k′=k′[0]; multiplication-by-n action is multiplication by n on k′; n=2 over 𝔽₂ gives 0. | Retain finite-presentation qualification. |
| §5.0 H⁰ / exact coefficients | For finite étale C₂ over 𝔽₂, H⁰=C₂; for μ₂ it is 0. Sequence 0→μ₂→μ₄→μ₂→0 over ℤ₂ yields the standard connecting map, whereas ignoring fppf sheaf exactness would miss the needed local square roots. | Retain. |
| §5.0 base change / slice sites | R=ℤ,R′=𝔽₂,A=𝔽₂[t],G=μ₂: both evaluations have H⁰=0 and H¹=A×/A×²=0; for A=𝔽₂[t,t⁻¹], both H¹=C₂ generated by t. | Retain. |
| §5.0 ideal permanence | p²ℤ_p⊂pℤ_p: 1+x invertible, special-polynomial root still in 1+p²ℤ_p. Zero ideal gives r=0. Nonhenselian 3ℤ_(3) fails the degree-two test. | Retain. |

### Declared contracts: boundary tests and consistency

All 19 slugs in the README are present in `design/plan.json`; suppliers are named. These rows test the contracts, without treating their absence from suppliers as a defect.

| Contract | Computed instances | Result |
| --- | --- | --- |
| animation-composition | F=H=id: both animated composites id; forget Ring→Ab→Set on ℤ[X] returns the same underlying polynomial set. | Retain. |
| general-square-zero | m=0,B=k⊕k[1]: ideal k[1], relative cotangent truncation k[2]; B=k gives both 0. | Retain; truncation indices are homotopy indices. |
| finite-group-ext | X=1: Ext¹=0. X=ℤ/n: a commutative extension determined by a unit becomes split after adjoining its n-th root fppf, including n=p in characteristic p. | Retain sheafification, not global Ext vanishing. |
| henselian-stack-lifting | X=𝔸¹_A: A→A/I is surjective. I=0 gives identity groupoid functor. | Retain. |
| henselian-torsor-cohomology | μ₂ over ℤ₂: H¹=C₂²→0 onto but not injective; H²=0→0. Smooth G_m: H¹=Pic=0 on both local rings. | Retain distinct ranges. |
| cauchy-algebraization | Coarse I-topology: completion A/I, and henselian invariance gives F(A)=F(A/I). Discrete topology: completion B and identity. | Retain. |
| punctured-h2-injectivity | ℤ_(p)^h→ℤ_p,U=D(p),μ_p: C_p→C_p; U=Spec R:0→0. | Retain. |
| adic-flat-module-limits | C=ℤ,J=(p),M_n=ℤ/pⁿ: limit ℤ_p, reduction ℤ/pⁿ and Tor_i(N,ℤ_p)=0 for i>0. J=1: all quotients and modules 0. | Retain weak proregularity. |
| torsor-limit-descent | Constant system: the same torsor and isomorphisms at every stage. A torsor x^p=t over 𝔽_p[t] already descends to its single finitely presented coefficient ring; finite tuples of equations use one common stage. | Retain contract; R01 corrects citation. |
| complete-torsor-effectivity | ℤ_p,μ_p: compatible torsors give H¹=C_p for odd p; μ_p automorphism tower is pro-zero and lim¹=0. | Retain ordinary completeness. |
| complete-module-hyperdescent | Split ℤ_p→ℤ_p²: completed Amitsur complex contracts, totalization M. I=1 and complete M: M=0. | Retain conditional arc extension; exact supplier work remains. |
| koszul-geometric-support | T=k[t],b=t,N=T: C_b=[T→T[1/t]], H⁰=0,H¹=T[1/t]/T. b=1 gives 0; empty tuple gives N. | Retain geometric support, not derived power torsion. |
| classical-affine-group-adapter | X=S: Res_X/S G_m=G_m smooth; X=Spec(k[ε]/ε²): units a+bε with a≠0 give underlying G_m×A¹, still smooth. | Mathematical clause true; R03 removes its duplicate ownership. |
| flat-group-cotangent-amplitude | μ₂/𝔽₂:[k→⁰k]; G_m:k[0]; both meet stated amplitude and distinguish smoothness. | Retain. |
| begueri-resolution | G=1:H=Q=G_m, coboundary identity. G=μ₂:H=G_m², embedding ζ↦(1,ζ), not diagonal. | Retain. |
| animated-flat-cohomology | G_a(k⊕k[1]) has H⁻¹=H⁰=k; μ_p on ordinary k has τ≤0RΓ=μ_p(k)[0]. | Retain. |
| cohomology-deformation | G_m,k[ε]→k: fibre k[0]. μ_p/𝔽_p: H⁰ and H¹ kernels each k, matching RHom([k→⁰k],k). | Retain untruncated cohomology triangle. |
| perfection-covers | 𝔽_p→𝔽_p[t] perfects to 𝔽_p→𝔽_p[t^(1/p∞)], still faithfully flat; identity perfects to identity. | Retain. |
| henselized-formal-fibres | ℤ_(p)^h→ℤ_p: closed fibre 𝔽_p, generic fibre a characteristic-zero field extension, geometrically regular. I=0: identity fibres. | Retain; Noetherianity/faithful flatness are separately imported. |

## Not verifiable

- No Lean command or fresh elaboration was run, as required by the read-only restriction. Binder verification uses the supplied six elaborated signatures and the pinned source definitions. It is not a new build certificate.
- Future implementations and proofs of the 19 declared supplier contracts are not present in this package. Their declarations, hypotheses, source support and boundary cases were audited; implementation correctness remains conditional on the suppliers. This is not itself a finding.
- The absent animated carriers prevent a native Lean signature check for §§4.5 and 6.2. Their mathematical statements were checked against CS24 and the recorded instances; no substitute signature was invented.
- Ownership against unprovided open-pull-request file contents was not checked beyond the supplied index/search leads. No unseen pull-request head was fetched. The supplied closest-owner material and all named supplier contracts were examined.
- The cached legal texts were used, including BG80 and R70 OCR. Cited source statements and the displayed proof steps were checked; this does not certify every external theorem those sources themselves cite. No direct roadmap reference required an additional missing-text request.

## Source issues

- **Misprint** in CS24 at §5.2.1, printed page 53 (CS24 line 2212): the source says the graded homotopy tensor is identified with one unspecified degree of the other module; it should be π_* on both graded sides, or π_i on both component sides; affects a stated result.
- **Misprint** in CS24 at Example 5.6.7, printed page 75 (CS24 line 3166): the source says the following piecewise statement concerns only degrees at least two; it should be introduced for degrees at least one, matching its displayed surjectivity range; affects nothing.
- **Misprint** in CS24 at proof of Theorem 5.7.2, printed page 79 (CS24 line 3336): the source says the three descent identities are numbered .1, .2 and .2; it should be .1, .2 and .3, as used on the next page; affects the proof.
- **Error** in BG80 at proof of Proposition 2.2.1, printed page 26 (BG80 lines 769–780): the source says the kernel inclusion for an unnormalized cocycle is a↦(1,a); it should be a↦(1,a/c(1,1)); for X=1 over ℚ and c=2, the twisted identity is 1/2; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f848ec18eb66b7a48795ce6e1d6cdcded229ae5f", "job": "RT-SchemeAndStackFoundationsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
