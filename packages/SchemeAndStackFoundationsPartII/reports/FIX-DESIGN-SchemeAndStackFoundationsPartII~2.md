# Design repair report: SchemeAndStackFoundationsPartII

Changed only `packages/SchemeAndStackFoundationsPartII/design/README.md`, `packages/SchemeAndStackFoundationsPartII/design/plan.json`, `packages/SchemeAndStackFoundationsPartII/sources.toml` and this requested report. The final design has 48 local targets, including the newly needed BC22 comparison, and 30 supplier gaps. No commit or external write was made.

## F01 (P1) — applied

Locally planned Dieudonné comparison, prime continuity and principal excision → PrismaticCohomologyPartIII §6.0 imports; four proof-route constructions → explicit export gaps. Updated every consumer in Layers 3–10 and route coverage. Layer 4 retains only affine vanishing. The supplier’s §6.0 states all three named theorems and its Bégueri/deformation route; CS24 line 2356 confirms the coefficient generality.

## F02 (P1) — applied differently

Four affine/twisted targets and the rank/étale-domination requests → HeightsRationalPointsAndObstructions §§2.6a–2.6c imports. Layers 1 and 8 use those exact contracts. Noetherian approximation and varying-base continuity reduce the ample proof to §2.6a, so no extra gerbe calculus is requested. The arithmetic ample extension remains here: DJ line 158 and line 323; affine comparison: L08 line 495.

## F03 (P1) — applied

Unowned G1 and its false Check → deletion. All four specified Layer 9 consumers cite SchemeAndStackFoundations §§0.14–0.15 by exact names. The parent states Popescu without a field-case reservation. The completion route additionally requires geometrically regular fibres, now explicit in §9.1 and gap:henselized-formal-fibres (BC22 line 253; CS24 line 3202).

## F04 (P1) — not actionable in this package: supplier exports and ArcTopologyAndDescent availability require external changes

Implicit supplier requests → 30 explicit top-level gaps, matching contract lines and consuming prerequisites. Split henselian stack/cohomology and continuity/torsor obligations; the Noetherian gerbe obligations are imported under F02. Five arc interfaces remain gaps: their board sections exist, but the roadmap is absent from main/open-roadmap supply. Editing this package cannot supply those exports or decide their placement.

## F05 (P1) — applied differently

Unowned Azumaya injectivity → gap:brauer-class-injective on SchemeAndStackFoundations §2.22, consumed by ample comparison and identifying HRPO §2.6c’s same prerequisite. Invalid PD.6 classification → PrismaticCohomologyPartIII §6.0 throughout. Neutrality of a splitting gerbe gives End(E); DJ line 131 supplies the construction. Matrix algebras have class 0; real quaternions have nonzero class.

## F06 (P2) — applied

Overbroad asks → missing remainders only. Import pinned syntomic local models/base change and completion flatness; use DerivedModuleAlgebra §§0.5, 1.7, 1.9 and EnhancedDerivedSheaves E5:animation.3. Update Layers 0, 2, 6 and 10. Adic-limit systems now explicitly require cartesian reductions (Y18 line 180); the limit theorem is Y18 line 704. Perfection tensors likewise remain an EnhancedDerivedSheaves import.

## F07 (P3) — applied

Principal-descent parameter a∈R → a∈π₀A, with fixed animated A and cosimplicial A-algebra A^•. Updated plan hypotheses, source match, §8.4 and its continuity consumer. Checks include t∈ℤ[[t]] over ℤ, the base-ring parameter case and a=1. CS24 line 3081 explicitly quantifies the parameter in A.

## F08 (P3) — applied

Invented SF/key/DD/PD/R23 labels → actual supplier sections and names in all prerequisites, coverage and prose. Gerbes cite AlgebraicModuliForArithmeticGeometry Layer 4; characteristic-p Kummer cites parent §2.11. PMCS cites §2.8 moret_bailly_integral_point. The resolver reports no missing citations; the dependency gate now recognizes the last supplier as PMCS.

## F09 (P3) — applied

Obsolete baseline → manifest pins 6b7abb3c/a91d3aaf. Re-read all 14 cited declarations in their pinned GitHub files, recording file/line and actual kind; cartierDual is an abbrev at line 331. Added completion flatness, standard syntomic/base-change and affine point-sheaf interfaces. The ordinary cohomology export explicitly compares against the pinned group-valued point sheaf.

## F10 (P3) — applied

Field-list target blocks → upstream prose form with Summary, ownership, conventions, exact contracts, reading order and eleven numbered layers. Preserve definition APIs; replace Lean-like Check labels and citation-only checks with computed prose. Every layer ends with Examples and Dependencies. No proposed local Lean names remain backticked. Read three main roadmaps before rendering; no Suggested.lean was created.

## F11 (P3) — applied

Faithful flatness from π₀ alone → flatness plus faithful π₀; k over k⊕k[1] fails since k≠0 in degree one. Tensor weight one → weight n+1 followed by weight −n correction, or a μ_n-lift. Updated statements, proof routes, Checks and worked examples together; CS24 line 2200 fixes the flatness condition.

## F12 (P3) — applied differently

Corrected retained locators and corresponding plan/source entries: Lemma 5.4.3 p.67, supports §5.2.5/Corollary 5.3.8, Corollary 4.1.9 p.38, Tag 0A6R and Bégueri pp.22–27. Deleted duplicate proposition/affine targets use their owners. Raynaud attribution is verified directly: BG80 line 789 and line 3526; R70 line 978. C19 line 215 is a Laurent comparison; no Gabber-book citation was introduced.

## F13 (P3) — applied differently

Missing route inputs → §9.1 finitary completion comparison, gap:henselized-formal-fibres and explicit finite-ideal excision in the open comparison. Popescu, smooth lifting and completion flatness are listed separately. The prime-continuity proof is imported; its smooth/finite-étale lifting belongs to that supplier. Expose nilpotent flatness in primary complete descent. BC22 line 263 proves the retraction route; SP line 6126 supplies the missing stability fact.

## F14 (P3) — applied

Absent manifest → nine legally fetched works under their original eight keys plus R70. Added authors, titles, years, all target/gap locators and cited_for entries; retained service hashes/licence/status and version numbering. SP records both downloaded chapters under one key. Sources validation reports zero problems. No missing text remains, and no settled work was renamed.

### Disposition of every original supplier request

The F04 local repair makes the missing supply explicit; these entries do not assert that another author has added the requested theorem. The three parts of the gerbe request are each discharged by the Noetherian route under F02.

| Original request | Exact disposition |
| --- | --- |
| animation-composition | gap:animation-composition, EnhancedDerivedSheaves E5:animation |
| general-square-zero | gap:general-square-zero, only animated Postnikov classification; ordinary classes from DerivedModuleAlgebra §0.5 |
| finite-group-ext | gap:finite-group-ext, parent Layer 2 §2.4; consumed by gap:begueri-resolution |
| gerbe-module-descent: quasi-coherent part | HeightsRationalPointsAndObstructions §2.6a on the Noetherian μ_n-model; pull back finite presentation data |
| gerbe-module-descent: finite-pushforward part | Same supplier §2.6a, which explicitly includes finite locally free pushforward |
| gerbe-module-descent: coherent-extension part | Same supplier §2.6a, which explicitly extends coherent modules from quasi-compact opens |
| projective-rank-lemmas | HeightsRationalPointsAndObstructions §2.6b; no gap or duplicate target |
| henselian-torsor-gerbe | gap:henselian-stack-lifting and gap:henselian-torsor-cohomology; latter depends on former |
| cauchy-algebraization | gap:cauchy-algebraization, parent Layer 4 |
| punctured-h2-injectivity | gap:punctured-h2-injectivity, parent Layer 4 |
| adic-flat-module-limits | gap:adic-flat-module-limits, DerivedModuleAlgebra §1.7; retains weak proregularity and cartesian systems |
| char-p-etale-dimension | gap:char-p-etale-dimension, parent Layer 2 |
| flat-cohomology-limits | gap:flat-cohomology-continuity and gap:torsor-limit-descent, with qcqs inverse-limit continuity needed by the Noetherian reduction |
| complete-torsor-effectivity | gap:complete-torsor-effectivity, parent Layer 4 |
| complete-module-hyperdescent | gap:complete-module-hyperdescent, DerivedModuleAlgebra §1.9, beyond its bounded-torsion p-adic Čech theorem |
| koszul-geometric-support | gap:koszul-geometric-support, DerivedModuleAlgebra §0.K.1 and §§1.2–1.4; exchange supplied separately by EnhancedDerivedSheaves E5:animation.3 |
| syntomic-presentations | gap:syntomic-presentations, global predicate/composition/limit descent only; local base change is pinned |
| gabber-finite-free-etale | HeightsRationalPointsAndObstructions §2.6c localEtale_finiteFree_domination |
| classical-affine-group-adapter | gap:classical-affine-group-adapter, reusing native points and Cartier duality |
| flat-group-cotangent-amplitude | gap:flat-group-cotangent-amplitude, parent Layer 1 §1.15 |
| ample-global-generation | gap:ample-global-generation, parent Layer 2; properness is not assumed |
| noetherian-completion-flat | gap:noetherian-completion-flat requests local faithfulness and quotient comparison only; flatness is pinned |

### Ownership and citation evidence

Read main at `a8132fb235144b25aba003881cc74e35d7d15f36`, the suppliers at the open heads exposed by `roadmaps show`, and the board arc design. The ownership searches used `roadmaps grep` by object on main and available open heads, together with a board-wide search. They covered Bégueri resolutions, ind-fppf maps, twisted bundles, perfect-base Dieudonné theory, CS24 citations, geometric supports and the BC22 comparison. The open-work index was 2026-10-25T17:16:58Z (366 pull requests). No ownership claim is inferred merely from a similar name.

The relevant overlaps are PrismaticCohomologyPartIII §6.0 and HeightsRationalPointsAndObstructions §§2.6a–2.6d. FiniteFlatGroupsAndIntegralPadicHodgeTheory’s field/classical Dieudonné theory and PerfectoidQuotients’ perfectoid constructions are distinct from the remaining flat-cohomology assertions. The local §9.1 comparison is the BC22 lemma used in the existing henselian-invariance route, not another Popescu target; no owner stating that set-valued functor comparison was found. Its two general prerequisites are imported from the parent. ArcTopologyAndDescent's board sections are §6.4, §8.6, §11.2, §11.5 and §12.7; `roadmaps show` reports no main/open-roadmap supplier for it. All five stay gaps, without an invented placement.

Read the README forms of SchemeAndStackFoundations, DerivedModuleAlgebra and PadicMeasuresIwasawaAlgebras on main. Cross-roadmap names were checked against the cited texts, including PMCS §2.8, the parent’s §§0.9, 0.12, 0.14–0.15, 0.21, 1.15, 2.10–2.11, 2.15 and 2.22, AlgebraicModuliForArithmeticGeometry Layer 4, EnhancedDerivedSheaves E5:animation.3, DerivedModuleAlgebra §§0.5, 1.7–1.9, DerivedDeRhamCohomology §1.22, PerfectoidQuotients Layer 0, ReductiveGroupsPartII RG2.0a and AlgebraicVectorBundles L0A–L0C.

| Source evidence | Mathematical point settled |
| --- | --- |
| CS24 line 1519, line 1538 and line 1589 | Proposition 4.1.4; pro-fppf site; Corollary 4.1.9 on printed p.38 |
| CS24 line 2016 | Animation-composition comparison and its conditional equivalence |
| CS24 line 2200 | Flatness retains all homotopy groups; faithfulness is added to that condition |
| CS24 line 2279 and line 2356 | Animated cohomology/open evaluation; untruncated deformation triangle |
| CS24 line 2800 and line 2816 | Derived residue equivalences; finite-ideal support excision |
| CS24 line 3081 | Principal complete descent permits a in the animated algebra |
| CS24 line 3162, line 3190 and line 3288 | Complete comparison, general henselian invariance, supported descent |
| BC22 line 253 and line 263 | Finitary completion comparison and its smooth-retraction proof |
| BC22 line 283 and line 306 | Stack lifting and torsor/H² consequences are different contracts |
| BG80 line 632, line 746, line 789 and line 3526 | Printed §2.1 starts p.22; resolution; Ext input and Raynaud attribution |
| R70 line 978 | General finite locally free commutative Ext¹-sheaf vanishing, printed p.51 |
| DJ line 131, line 158 and line 323 | Splitting gerbe, ample Brauer proof and arithmetic section avoidance |
| L08 line 495 and line 497 | Affine twisted bundle and affine Brauer comparison, with no residue-characteristic restriction |
| C19 line 215 | Lemma 3.1 compares henselian Laurent Brauer groups, not arbitrary affine Brauer classes |
| Y18 line 180, line 217 and line 704 | Cartesian adic systems, limit reductions and adic flatness |
| SP line 589 and line 622 (dualizing chapter) | Geometric support is the extended Čech/dual Koszul colimit without weak proregularity |
| SP line 6106 and line 6126 (more-algebra chapter) | Regular completion for G-rings and henselization stability |

The pin audit read the actual bodies and explicit section assumptions in the GitHub files at the manifest commits. The README’s baseline table gives all 14 exact file/line locators. In particular the completion flatness instance requires a Noetherian ring, the syntomic class supplies a flat presentation and fibre dimension, `HenselianRing` includes Jacobson containment, and `IsAzumaya` includes finite projectivity and faithful scalar action. The point sheaf is group-valued; an abelian adapter is still a supplier obligation. No claim about a missing pinned carrier is needed for this design repair.

### Adversarial mathematics pass

The following are explicit computations, made again for the repaired objects. Each local target is a separate row; its API is read with the hypotheses in that row's section. Definition Checks retain positive, negative and degenerate instances. Equal-characteristic and mixed-characteristic coefficients, p=2 and p=3, nonreduced algebras, empty/unit ideals and identity maps occur explicitly. There is no noncommutative coefficient-group claim: the sheaf coefficient groups are assumed commutative throughout; S₃ would fail that hypothesis. No denominators without localization or an invertibility assumption are introduced.

| Statement | Instances and computed values | Result | Change |
| --- | --- | --- | --- |
| ind-fppf | (ℤ/4)[X] is free and finitely presented; ℤ[1/2]→D→ℚ would force D/2D=0, contradicting faithfulness; R≠0→0 kills R; 0→0 is faithful on the zero category. | Consistent | Hypotheses retained; supply/Checks synchronized |
| ind-syntomic | ℤ[1/2]=ℤ[x]/(2x−1) has one regular relation and is flat, but its 2-fibre is 0; 𝔽_p[x]/x^p has dimension p as a vector space; Tor₁^ℤ(ℤ/4,ℤ/4)=ℤ/4 excludes ℤ→ℤ/4. | Consistent | Hypotheses retained; supply/Checks synchronized |
| pro-fppf-site | The two components of Spec(k×k) cover two points; a single inclusion covers only one; the identity covers all points, including the empty spectrum. | Consistent | Hypotheses retained; supply/Checks synchronized |
| ample-twisted-generation | For n=2, tensor weight is 3 and twisting by weight −2 gives 1; on BG_m over ℙ¹_ℤ the standard character tensored with O has rank 1 and weight 1. | Consistent | F02/F11: imported calculus and weight correction |
| gabber-ample-brauer | End(ℝ²)=M₂(ℝ) has class 0; the quaternion division algebra has class 1 in Br(ℝ)=ℤ/2; on ℙ¹_k both Brauer groups are Br(k). | Consistent | Hypotheses retained; supply/Checks synchronized |
| animated-group-points | For G_a on k⊕k[1], π₀=π₁=k; for G_m on a discrete ring, π₀=A× and π_i=0 for i>0. | Consistent | Hypotheses retained; supply/Checks synchronized |
| group-linearized-cotangent | G_a gives R; dlog at the identity of G_m gives R; μ_p/𝔽_p gives [𝔽_p→0 𝔽_p] with H^(−1)=H⁰=𝔽_p. | Consistent | Hypotheses retained; supply/Checks synchronized |
| group-cotangent-amplitude | μ_p/ℤ gives [ℤ→p ℤ], whose homotopy for multiplication by p is identity between the two terms; after inverting p both cohomology groups vanish. | Consistent | Hypotheses retained; supply/Checks synchronized |
| points-deformation | For k[ε]/ε²→k and G_m the fibre is 1+εk≃k; for μ_p/𝔽_p the point fibre is 𝔽_p while the obstruction map misses the target π₀=𝔽_p. | Consistent | Hypotheses retained; supply/Checks synchronized |
| animated-flatness | For A=k⊕k[1], M=k, π₁A⊗π₀M=k but π₁M=0; M fails flatness and faithfulness despite faithful π₀. The zero k-module is flat but not faithful. | Consistent | F11: add flatness |
| flat-tensor-base-change | ℤ/p⊗^L_ℤℤ_p=𝔽_p, with π_i=0 for i>0; k[1]⊗_k k=k[1], retaining π₁=k on both sides. | Consistent | Hypotheses retained; supply/Checks synchronized |
| nilpotent-flatness-test | For ℤ/4→𝔽₂ and M=𝔽₂ the reduction has Tor₁=𝔽₂, so both flatness tests fail; M=ℤ/4 reduces to free 𝔽₂. ℤ/2⊗ℚ=0 shows localization is not a detector. | Consistent | Hypotheses retained; supply/Checks synchronized |
| animated-sites | k⊕k[1]→k has étale π₀ but loses π₁=k and is not flat; k×k→k in both projections is jointly faithful; one component alone misses an idempotent. | Consistent | Hypotheses retained; supply/Checks synchronized |
| animated-etale-equivalence | Over 𝔽_p⊕𝔽_p[1], lifting 𝔽_(p²) gives π₀=π₁=𝔽_(p²); lifting the identity algebra returns A. | Consistent | Hypotheses retained; supply/Checks synchronized |
| animated-henselization | For I=0, (π₀A)^h=π₀A and π_i(A^h)=π_iA; for already henselian π₀ the same formula gives A^h≃A. | Consistent | Hypotheses retained; supply/Checks synchronized |
| animated-supports | I=(1): fib(id)=0; I=0: fib(RΓ→0)=RΓ. For G_a on k[t], H⁰_(t)=0 and H¹_(t)=k[t,t⁻¹]/k[t]; (t²) gives the same localization. | Consistent | Hypotheses retained; supply/Checks synchronized |
| fppf-postnikov-hyperdescent | For G_a and k⊕k[1], the Postnikov tower is constant from n=1, giving H^(−1)=k; the split A×A Čech object contracts to the augmentation. | Consistent | Hypotheses retained; supply/Checks synchronized |
| approximation-tower | A_n=τ≤n(k⊕k[1]) is constant from n=1 and Rlim RΓ(G_a)=k⊕k[1]; A_n=A gives the same value immediately. | Consistent | Hypotheses retained; supply/Checks synchronized |
| pi-zero-comparison | G_a on k⊕k[1] gives H^(−1):k→0 and H⁰:k→k; for μ_p on 𝔽_p⊕𝔽_p[1], the H⁰ kernel is 𝔽_p, so finite-flat bijectivity cannot start at degree 0. | Consistent | Hypotheses retained; supply/Checks synchronized |
| nil-invariance | (1+ε)^p=1 in 𝔽_p[ε]/ε², but 1+ε is not a p-th power; H¹(μ_p) has kernel 𝔽_p. G_a has H⁰ kernel ε𝔽_p and zero positive cohomology. | Consistent | Hypotheses retained; supply/Checks synchronized |
| classical-neighborhood-excision | For J=(p), ℤ→ℤ[1/(1+p)] reduces to the identity on 𝔽_p; the removed locus is disjoint from V(p). J=(1) gives 0→0; the identity neighborhood gives id. | Consistent | Hypotheses retained; supply/Checks synchronized |
| perfect-affine-vanishing | ℤ/p over 𝔽_p: fib(0) has H⁰=H¹=𝔽_p and H²=0. μ_p: fib(−1)=0. α_p: Frobenius is bijective on a perfect algebra, giving 0. | Consistent | Hypotheses retained; supply/Checks synchronized |
| split-cover-refinement | Over algebraically closed k every nonempty finite-presentation affine cover has a k-point; its global evaluation is exact. Over R≠0 a faithful refinement cannot be 0; for R=0 all groups are 0. | Consistent | Hypotheses retained; supply/Checks synchronized |
| derived-beauville-laszlo | For ℤ→ℤ_p, ℤ_p∩ℤ[1/p]=ℤ and ℤ_p+ℤ[1/p]=ℚ_p; for a=1 the two localized arrows are identities; for a=0 the residue test is conservative. | Consistent | Hypotheses retained; supply/Checks synchronized |
| pi-zero-derived-completion | For ℤ at p, π₁ of every quotient is 0 and π₀ completion=ℤ_p; for ℤ/p² the π₁ transitions are multiplication by p and pro-zero, hence lim¹=0 and completion=ℤ/p². | Consistent | Hypotheses retained; supply/Checks synchronized |
| p-henselian-dimension | For p odd and μ_p over ℤ_p, H¹=ℤ/p and H²=0; for p=2, H¹(ℤ₂,μ₂)=(ℤ/2)² generated by −1,5 and H²=0; for ℤ/p over 𝔽_p, H¹=𝔽_p and H²=0. | Consistent | F01: state imported hypotheses explicitly |
| p-complete-comparison | The identity gives identical open/support complexes; ℤ_p→ℤ_p×ℚ_p has the same mod-p reduction, but p is a unit on one nonzero factor so p∉Jac of the target; that countermodel is excluded. | Consistent | Hypotheses retained; supply/Checks synchronized |
| semiperfect-perfection-excision | For A=A′ perfect, kernel=0; for 𝔽_p→𝔽_p[t^(1/p^∞)]/(t) and a=1, t^(1/p) is a nonzero nilpotent in the kernel, multiplication by a is id, and both residues are 0. | Consistent | Hypotheses retained; supply/Checks synchronized |
| derived-excision-condition | 𝔽_p⊗^L_ℤℤ_p=𝔽_p, but Tor₁^(ℤ/p²)(𝔽_p,𝔽_p)=𝔽_p; for I=(1) the residue is 0 for every map; for I=0 the condition detects equivalence. | Consistent | Hypotheses retained; supply/Checks synchronized |
| finite-ideal-excision | For ℤ→ℤ_p and I=(p), the derived residue is 𝔽_p on both sides; I=(1) gives two zero supports; I=0 forces ring equivalence and gives full cohomology. | Consistent | Hypotheses retained; supply/Checks synchronized |
| noetherian-local-completion | For ℤ_(p)→ℤ_p, residue tensor is 𝔽_p in degree 0; for a field with m=0, completion=the field and the cohomology map is id in every degree. | Consistent | Hypotheses retained; supply/Checks synchronized |
| fpqc-hyperdescent | A→A×A gives a split augmented Čech complex, with augmentation recovered exactly; the identity hypercover on 𝔽_p retains H¹(ℤ/p)=𝔽_p; over 0 all complexes are 0. | Consistent | Hypotheses retained; supply/Checks synchronized |
| p-completely-flat-descent | 𝔽_p is its own p-henselization; ℚ_p has V(p)=∅ and supported cohomology 0; ℤ_p→𝔽_p fails the hypothesis because derived reduction has Tor₁=𝔽_p. | Consistent | Hypotheses retained; supply/Checks synchronized |
| complete-implies-henselian | ℤ_p is p-complete with p in its Jacobson radical; k⊕k[1] is 0-complete and its pair at 0 is henselian; ℤ is not p-complete and Jac(ℤ)=0. | Consistent | Hypotheses retained; supply/Checks synchronized |
| henselian-h2 | H²(ℤ_p,μ_p)=Br(ℤ_p)[p]=0=H²(𝔽_p,μ_p); H¹(ℤ_p,μ_p)=ℤ/p for p odd, so this computation is confined to degree two. | Consistent | Hypotheses retained; supply/Checks synchronized |
| restricted-complete-continuity | For ℤ_p, a=p and μ_p, H¹=ℤ/p and H^i=0 for i≥2 (p odd), with the same unit-quotient tower; a=1 forces the complete ring and all values to be 0. | Consistent | Hypotheses retained; supply/Checks synchronized |
| complete-principal-descent | For ℤ[[t]] over ℤ, a=t and the identity cosimplicial algebra give RΓ→RΓ; for a=p on ℤ_p, the split product cover contracts; a=1 permits only the zero complete ring. | Consistent | F07: a∈π₀A |
| derived-complete-continuity | Empty tuple gives constant A with Rlim RΓ(A,G)=RΓ(A,G); for ℤ_p and μ_p (p odd), H¹ tower limit=ℤ/p; ℤ/p²/^Lp has π₀=π₁=𝔽_p. | Consistent | Hypotheses retained; supply/Checks synchronized |
| ordinary-complete-comparison | ℤ_p→𝔽_p on μ_p has H¹:ℤ/p→0 (p odd); μ_p(ℤ/p^n) has pro-zero transitions, so lim¹=0; for I=0 the constant tower also has lim¹=0. | Consistent | Hypotheses retained; supply/Checks synchronized |
| henselian-noncomplete-counterexample | The henselized unit quotient is countable; in 𝔽_p[[t]], equality of classes of 1+t h(t^p) and 1+t g(t^p) forces their p-power ratio c(t^p) to have constant term 1 and no higher exponent-0 terms, hence c=1 and h=g; uncountably many classes result. | Consistent | Hypotheses retained; supply/Checks synchronized |
| henselian-completion-comparison | For A=ℤ_(p)^h and F(C)=C, A embeds in ℤ_p and 1∈𝔽_p lifts to 1 on both sides; I=0 gives Â=A; a constant two-element functor gives the identity on two elements. | Consistent | F13: new prerequisite |
| henselian-invariance | For μ_p and (ℤ_(p)^h,p), p odd, H¹:ℤ/p→0 is onto and H²:0→0 is bijective; I=0 gives id in every degree. Formal-fibre regularity is required only in the approximation proof. | Consistent | Hypotheses retained; supply/Checks synchronized |
| topological-algebraization | For 𝔽_p{t} with t-adic topology, H²(μ_p)=0 before and after completion, while H¹ has countable versus uncountable cardinality; for discrete topology B̂=B. | Consistent | Hypotheses retained; supply/Checks synchronized |
| laurent-algebraization | The henselian and complete local fields with residue 𝔽_p both have Br[p]=ℤ/p, so H²(μ_p)=ℤ/p; their H¹ unit quotients are countable versus uncountable. | Consistent | Hypotheses retained; supply/Checks synchronized |
| punctured-animated-comparison | For ℤ_(p)^h→ℤ_p on D(p), H²(μ_p)=ℤ/p on both sides; I=0 gives an empty punctured open; I=(1) and henselianity force the zero ring. | Consistent | Hypotheses retained; supply/Checks synchronized |
| noetherian-open-comparison | The preceding local example has identical quotients ℤ/p^n and H² on D(p) equal to ℤ/p; identity R→R gives id for every U; I=0 forces R≃R′. | Consistent | Hypotheses retained; supply/Checks synchronized |
| perfectoid-flat-discreteness | M=A has free reductions and π_i=0 for i>0; for A=𝔽_p, I=0 and M=A[1], the reduction still has π₁=𝔽_p and fails flatness; M=0 is discrete. | Consistent | Hypotheses retained; supply/Checks synchronized |
| adic-support-hyperdescent | I=(1): both supported complexes=0; empty tuple: fpqc hyperdescent of full cohomology; split A→A×A: the localization fibre is recovered by its contracting Čech totalization. | Consistent | Hypotheses retained; supply/Checks synchronized |

| Imported or supplier-gap statement | Instances and computed values | Result | Change |
| --- | --- | --- | --- |
| Covariant F,V convention and perfect-base comparison | On ℤ/p over 𝔽_p, F=0,V=1 and fib(V−1) has H⁰=H¹=𝔽_p; on μ_p, F=1,V=0 and fib(−1)=0; FV=VF=p=0 in both cases | Consistent | F01/F05: import PCIII |
| Prime-adic continuity | For ℤ_p and μ_p, p odd, units modulo p-th powers are ℤ/p on both sides; for p=2 they are (ℤ/2)² and −1 remains nonzero | Consistent | F01: import PCIII |
| Principal excision | ℤ→ℤ_p at p has residue 𝔽_p; ℤ/p²→𝔽_p has extra Tor₁=𝔽_p and fails; a=1 gives zero support | Consistent | F01: import PCIII |
| Affine twisted bundle/criterion | On BG_m/k, weight-one line has End=k and class 0; rank-zero sheaf has End=0 and cannot represent a positive-degree Azumaya class | Consistent | F02: import HRPO |
| Affine Brauer comparison | Br(ℤ)=Br′(ℤ)=0; Br(ℝ)=Br′(ℝ)=ℤ/2, with quaternion class 1 | Consistent | F02: import HRPO |
| Projective stabilization | Over a field, P=k^r has rank r, reduced class 0, and P⊗(k)^⊗n⊗k=k^r; r=0 cannot yield positive rank | Consistent | F02: import HRPO |
| Étale finite-free domination | For B=A the choice C=A gives degree 1 and identity localization maps; B need not itself be finite, e.g. a local étale localization | Consistent | F02: import HRPO |
| Gerbe QC descent | On Bμ_p/𝔽_p, weight p=0 descends but weight 1 does not; on a μ_n-lift n·1=0 whereas on BG_m n·1=n | Consistent | F02: Noetherian supplier |
| Gerbe finite pushforward | For a degree-d finite free cover and rank-r bundle, pushforward has rank dr; d=r=1 returns the original line | Consistent | F02: Noetherian supplier |
| Gerbe coherent extension | On A¹_k, O on D(t) extends as O on A¹; the weight-one character is retained under extension on the neutral gerbe | Consistent | F02: Noetherian supplier |
| gap:animation-composition | The identity functor on finite free abelian groups animates to id; composing twice gives id on k[1], with π₁=k on either side. | Consistent | Missing supplier export recorded |
| gap:general-square-zero | B=k⊕k[1], m=0 gives B→k with ideal k[1] and τ≤2L_(k/B)=k[2]; m≥0 is explicit. | Consistent | Missing supplier export recorded |
| gap:finite-group-ext | For X=ℤ/n an extension class is locally killed after adjoining an nth root of the unit defining its n-power lift; for X=0, Ext¹=0 immediately. | Consistent | Missing supplier export recorded |
| gap:henselian-stack-lifting | For X=A¹ over ℤ_p, x̄=1∈𝔽_p lifts to 1; for BG with G smooth affine, the trivial residue torsor lifts to the trivial torsor. | Consistent | Missing supplier export recorded |
| gap:henselian-torsor-cohomology | For Q=G_m over ℤ_p, H¹=Pic=0 on both rings; for μ_p (p odd), H¹:ℤ/p→0 is onto and H²:0→0 injective. | Consistent | Missing supplier export recorded |
| gap:cauchy-algebraization | For discrete B, the Cauchy-net quotient equals B; for t-adic B=𝔽_p{t}, completion=𝔽_p[[t]] and the invariant H²(μ_p) is 0 on both sides. | Consistent | Missing supplier export recorded |
| gap:punctured-h2-injectivity | For ℤ_(p)^h→ℤ_p and U=D(p), H²(μ_p)=ℤ/p→ℤ/p; the map is injective, with both quotients ℤ/p^n. | Consistent | Missing supplier export recorded |
| gap:adic-flat-module-limits | C=ℤ, J=(p), M_n=ℤ/p^n gives M′=ℤ_p, reductions ℤ/p^n and Tor_i(ℤ/p^n,ℤ_p)=0 for i>0; zero systems give M′=0. | Consistent | Missing supplier export recorded |
| gap:char-p-etale-dimension | For constant ℤ/p on 𝔽_p, Artin–Schreier gives H¹=𝔽_p and H²=0; replacing all positive groups by 0 would fail. | Consistent | Missing supplier export recorded |
| gap:flat-cohomology-continuity | The filtered union 𝔽_p[t^(1/p^n)] has Frobenius surjective, so colim H¹(α_p)=0=H¹ of the perfection; identity diagrams give id. | Consistent | Missing supplier export recorded |
| gap:torsor-limit-descent | The α_p-torsor x^p=t over 𝔽_p[t] already occurs at that finite stage; after adjoining t^(1/p), its trivialization descends to the next stage. | Consistent | Missing supplier export recorded |
| gap:complete-torsor-effectivity | The trivial rank-n torsor over C has reductions of rank n and identity transition equations; for μ_p over ℤ_p (p odd), torsor classes form the inverse-limit unit quotient ℤ/p. | Consistent | Missing supplier export recorded |
| gap:complete-module-hyperdescent | For A→A×A and any finite tuple, completed module Čech descent is split and recovers M; at the zero module both sides are 0. | Consistent | Missing supplier export recorded |
| gap:koszul-geometric-support | T=k[t], b=t, N=T gives [T→T[1/t]], H⁰=0,H¹=T[1/t]/T; b=1 gives 0 and b=0 gives T after the Koszul colimit. | Consistent | Missing supplier export recorded |
| gap:syntomic-presentations | ℤ[x] has relative dimension 1; 𝔽_p[x]/x^p has relative dimension 0 and is flat; ℤ/4 is not flat over ℤ and is excluded. | Consistent | Missing supplier export recorded |
| gap:classical-affine-group-adapter | For X=(ℤ/n)_S, Res_X G_m=G_m^n; for X=Spec(𝔽_p[t]/t^p), units are the open set with nonzero constant coefficient in A^p. | Consistent | Missing supplier export recorded |
| gap:flat-group-cotangent-amplitude | For G_m, C_G=R in degree 0; for μ_p/𝔽_p, C_G=[𝔽_p→0 𝔽_p] reaches both degrees −1 and 0. | Consistent | Missing supplier export recorded |
| gap:ample-global-generation | On ℙ¹_ℤ, O(−1)⊗O(n)=O(n−1) is globally generated for n≥1; O(−1) at n=0 has no global generators. | Consistent | Missing supplier export recorded |
| gap:noetherian-completion-flat | For ℤ_(p)→ℤ_p, mĈ=pℤ_p≠ℤ_p and every quotient is ℤ/p^n; a flat target ℚ_p instead has pℚ_p=ℚ_p and is not faithfully flat. | Consistent | Missing supplier export recorded |
| gap:begueri-resolution | For G=0, H=Q=G_m and δ(s)=s²/s=s; for μ_n, ζ maps to (1,ζ,…,ζ^(n−1)), whose coboundary is 1. | Consistent | Missing supplier export recorded |
| gap:animated-flat-cohomology | Over 𝔽_p[t], H¹(α_p)=𝔽_p[t]/𝔽_p[t]^p contains nonzero t; G_a on k⊕k[1] has H^(−1)=k; ordinary G_m has H⁰=A× and H¹=Pic(A). | Consistent | Missing supplier export recorded |
| gap:cohomology-deformation | For G_a and k[ε]/ε²→k, the untruncated triangle is k[ε]/ε²→k→k[1]; its fibre is kε in degree 0. | Consistent | Missing supplier export recorded |
| gap:perfection-covers | The cover 𝔽_p[t]→𝔽_p[t^(1/p)] perfects to an isomorphism of perfect closures; its two perfect source components still cover both points over a product. | Consistent | Missing supplier export recorded |
| gap:torsion-arc-hyperdescent | The identity arc-hypercover on Spec 𝔽_p gives H¹(ℤ/p)=𝔽_p on both sides; the split product cover contracts in all degrees. | Consistent | Missing supplier export recorded |
| gap:formal-glueing | ℤ→ℤ_p at (p) has quotients ℤ/p^n; at I=(1) the complementary opens are whole spectra, so the square has identity horizontal maps. | Consistent | Missing supplier export recorded |
| gap:complete-etale-hyperdescent | At I=0, completion and henselization equal the ring and punctured spectrum is empty; for the identity cover all four comparison maps are id. | Consistent | Missing supplier export recorded |
| gap:complete-valuation-product-basis | For algebraically closed k and I=0, the rank-zero valuation k is a permitted factor; its étale cohomology is H⁰ only. I=(1) leaves only the zero separated complete ring. | Consistent | Missing supplier export recorded |
| gap:integral-perfectoid-hyperdescent | For perfect k of characteristic p, tilt=k and A_inf=W(k); the split product Čech diagrams recover respectively k,k,W(k). The nilpotent ring k[ε]/ε² is excluded from perfectoids. | Consistent | Missing supplier export recorded |
| gap:brauer-class-injective | M₂(ℝ)=End(ℝ²) has class 0; ℍ has class 1 in ℤ/2 and is not End of a real vector space. | Consistent | Missing supplier export recorded |
| gap:henselized-formal-fibres | For ℤ_(p)^h→ℤ_p, the closed fibre is 𝔽_p and the generic fibre is a separable characteristic-zero field extension, hence geometrically regular; dual numbers would have nonregular fibre and are excluded. | Consistent | Missing supplier export recorded |

| Remaining convention or worked example | Instances and computed values | Result | Change |
| --- | --- | --- | --- |
| Dorroh multiplication | (1,0)(n,y)=(n,y), and (0,x)(0,y)=(0,xy); unit and ideal multiplication both agree | Consistent | Retained |
| Homotopy/cohomology indexing | k[1] has π₁=k=H^(−1), with H⁰=0; k has π₀=k=H⁰ | Consistent | Witness added |
| Supports and radical | fib(id)=0 for I=(1); fib(RΓ→0)=RΓ for I=0; k[t][1/t²]=k[t][1/t] | Consistent | Witnesses retained throughout |
| Derived quotient | For ℤ/p² at p, kernel(p)=pℤ/p²=𝔽_p and cokernel(p)=𝔽_p; ordinary residue has no π₁ | Consistent | Applied across all quotient examples |
| fppf Kummer | For 𝔽_p[t,t⁻¹], units/pth powers=ℤ/p generated by t, Pic=0 and H¹_fppf(μ_p)=ℤ/p; étale μ_p is the zero sheaf and H¹_et=0 | Consistent | F08: use parent §2.11 |
| Nonabelian boundary | S₃ has (12)(23)≠(23)(12), so it is outside the commutative coefficient hypothesis; cyclic ℤ/p is inside and has the nonzero H¹ computed above | Consistent | No nonabelian derived H² claim |

Every constructed comparison retains its source and target. The only power-series denominators in the Checks occur in explicit localizations. No free Prop encoding, vacuous conclusion hypothesis or new Lean declaration is introduced. The source-proof geometric-support step uses a perfect dual Koszul object, not ordinary power quotients: the ordinary-ring dual Koszul complex on s elements lies in [0,s], including s=0, so the cited bounded-totalization theorem applies with a uniform lower bound. For the Witt support ideal (p,[a₁],…,[a_r]), this is [0,r+1].

### Check outcomes and maintainer notes

Dependency check, exit status 0:

```text
candidate: SchemeAndStackFoundationsPartII is not in the merge order yet; checked as if placed after PotentialModularityAndCompatibleSystems (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 632 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The candidate is placed after PotentialModularityAndCompatibleSystems; no merge-order file was edited. This fixes the old parser false negative caused by colon-style supplier citations. It does not certify the missing arc supplier: the five top-level arc gaps remain binding prerequisites.

Citation resolver: exit status 0, no cross-roadmap citations found nowhere and no Lean names found nowhere. The tool explicitly does not check external-library names without local Lake packages; the pinned GitHub-file reads above provide that separate verification.

Sources check: exit status 0, `packages/SchemeAndStackFoundationsPartII/sources.toml: 0 problem(s)`. Nine distinct keys, no duplicate work, no local paths, no missing text. The source cache remains outside the repository.

Diff whitespace check: `git diff --check` exited 0, with no output. Only the three authorized design/source files and this requested report are modified.

Structural consistency audit: 48 target IDs; 30 unique supplier-gap slugs, each with supplier/section/needs and a consuming target or gap; no unresolved local prerequisite ID; all 11 layers have Examples and Dependencies. All 10 retained definitions/constructions preserve an API and at least three Checks (counts 4,3,4,3,3,5,4,3,3,4). Fourteen duplicate local constructions/theorems were deleted and their coverage references redirected. The sole added target is the BC22 functor-completion comparison required by F13.

Lean elaboration and `#check @name` binder comparison: not run. This is the design stage, there is no Suggested.lean and there are no Lean declarations to audit. The authorized edit list excludes adding that file. No theorem statement was silently weakened to fit the pins, and no padding declarations were created. A package-stage acceptance test remains separate work.

No gate failures were supplied in the brief. The observed dependency and source checks pass. There are no declaration renames for downstream Lean code; removed design target slugs now point to their owners. Consumers should cite PrismaticCohomologyPartIII §6.0 and HeightsRationalPointsAndObstructions §§2.6a–2.6c directly for the imported results. F04 cannot be closed by this package: supplier authors must expose the listed missing exports, and a human must resolve availability/placement of ArcTopologyAndDescent. No supplier file, tooling, pull-request text or merge-order file was changed.
