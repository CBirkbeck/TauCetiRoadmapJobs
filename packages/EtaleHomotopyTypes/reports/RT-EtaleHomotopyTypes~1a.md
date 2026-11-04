<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1304#issuecomment-6436428508 -->
Red team round 1 pass a (codex) of 6962204

Verdict: needs_changes

1. **F01** (P2) The abelian derived-limit headline is statable but absent

   **Location:** `packages/EtaleHomotopyTypes/Suggested.lean:7`, “None is statable at these pins”; `packages/EtaleHomotopyTypes/README.md:381`.

   **Claim:** All headline theorems require missing carriers, so the acceptance test contains no declarations.

   **Witness:** §2.2 explicitly uses native `AddCommGrpCat`, `Functor.rightDerived`, `Limits.lim` and `HasInjectiveResolutions`. Their pinned definitions are `Mathlib/CategoryTheory/Abelian/RightDerived.lean:108` and `Mathlib/CategoryTheory/Limits/HasLimits.lean:555`; no pro-space carrier occurs in this abelian theorem.

   **Exact repair text:** “The abelian part of §2.2 is stated here: for a small cofiltered category I, a diagram A : I ⥤ AddCommGrpCat with every A.obj i finite, and s > 0, assuming HasInjectiveResolutions (I ⥤ AddCommGrpCat), the object ((Limits.lim).rightDerived s).obj A is zero.” Add that theorem with `sorry`, its explicit size/existence hypotheses, and its name in README §2.2; remove the blanket assertion that nothing is statable. Keep the nonabelian theorem on the missing-carrier list.

   **Review-history check:** `packages/EtaleHomotopyTypes/reports/FIX-PKG-EtaleHomotopyTypes~2.md:9` removed this theorem because it was a supporting lemma. The present contract includes deep intermediate headline results. Vanishing in every positive derived degree over arbitrary small cofiltered indices is neither a boundary Check nor a one-tactic consequence of the pinned compatible-family theorem; the dimension-shifting argument is substantive. The source calling it Lemma A.7 does not establish padding.

   **Repair test:** For a constant C₂ diagram, R¹lim = 0; R⁰lim = C₂, so s > 0 must remain. For ℤ ←×2 ℤ ←×2 ⋯, R¹lim = ℤ₂/ℤ ≠ 0, so levelwise finiteness must remain. No stand-in definition is needed. No Lean execution was performed.

2. **F02** (P3) Raw profiniteness consumes a later target

   **Location:** `packages/EtaleHomotopyTypes/README.md:578`, “§3.6 makes each Et(X_i) → Et(X) a finite pro-covering”; also the Needs line at 587.

   **Claim:** The higher raw profiniteness proof in §3.5 uses finite-cover invariance supplied in §3.6.

   **Witness:** §3.5 cites §3.6 at README:578 and 587. §3.6's own Needs at README:595 uses §§3.3, 1.1, 1.5 and 3.0a, so it can be placed before §3.5 without a cycle.

   **Exact repair text:** Move “Finite étale base change” before “Raw and finite étale homotopy groups”; renumber those subsections and update their internal references and source `cited_for` entries. Keep the finite-cover statement at its present locally noetherian generality.

   **Repair test:** For the Kummer cover z ↦ z² of Gₘ over ℂ, the degree-two pro-covering and higher-group invariance are now available before the finite-cover tower is used to establish profiniteness. All direct inputs of the moved subsection precede it.

3. **F03** (P1) Relative Abhyankar uses an unowned relative purity theorem

   **Location:** `packages/EtaleHomotopyTypes/README.md:611`, “proved by SGA1's argument”.

   **Claim:** The absolute Abhyankar supplier and the existing contracts suffice for the relative normal-crossings proof over arbitrary base changes.

   **Witness:** SGA1 line 12585 uses relative étale depth for uniqueness; line 12598 invokes SGA2 XIV 1.20 for extension. The latter permits singular bases. CrystallineCohomology's regular-local absolute lemma does not supply it.

   **Exact repair text:** Insert a target before the relative Abhyankar argument: “For a regular morphism f:X→S of locally noetherian schemes and a closed Z⊂X, restriction FEt(X)→FEt(X∖Z) is an equivalence if, for each s∈f(Z), either codim(Z_s,X_s)≥2, or codim(Z_s,X_s)≥1 and prof_et,s(S)≥1, or prof_hop,s(S)≥3. Define these depth conditions. For full faithfulness under a flat morphism with geometrically reduced fibres and fibrewise nowhere-dense Z, retain both source alternatives: the closure of f(Z) is nowhere dense, or the fibres are geometrically unibranch along Z.” Cite SGA2 XIV Corollaries 1.19–1.20, printed pp. 176–177 (sga2 line 6545 and line 6563), and put these targets before their use. Alternatively declare precisely these missing inputs with a named earlier supplier and matching gap entries. Record the legally available SGA2 text in sources.toml. Preserve the noetherian approximation step for arbitrary S′.

   **Repair test:** Take S=Spec(ℂ[ε]/ε²), X=𝔸²_S, Z the zero section. The relative map is smooth, fibre codimension is 2, and finite étale covers extend uniquely, although X is not regular. This is outside the cited absolute supplier. On 𝔸¹_ℂ with Z={0}, codimension is 1 and the base has depth 0: the criterion excludes the Kummer cover t↦t², which does not extend étale across 0. The new prerequisite distinguishes both cases.

   **Ownership check:** No earlier roadmap or pinned declaration found supplies this relative statement. `packages/PurityForFlatCohomology/design/README.md:289` plans étale depth in a later direction; it cannot supply this prerequisite. The relative theorem must be owned here or contracted to an earlier supplier. The older repair's acknowledgment of undecomposed purity citations is not a supplier contract.

4. **F04** (P2) The geometric product package discards the source's non-finite-type range

   **Location:** `packages/EtaleHomotopyTypes/README.md:613`, “Let X be a finite-type K-scheme”; also 615, 617 and 619.

   **Claim:** Cohomological properness, universal local 1-asphericity, the projection theorem and geometric product formula are planned only for finite-type inputs (both factors in the product theorem).

   **Witness:** SGA1 line 11939 allows coherent X/k; line 11945 uses resolution of all finite-type schemes. Lines 12078–12086 do likewise for local asphericity; lines 12282–12294 allow qcqs X and arbitrary connected Y.

   **Exact repair text:** “For any characteristic-zero field k and qcqs k-scheme X, prove cohomological properness in degree ≤0 for every étale sheaf of sets and in degree ≤1 for every ind-finite sheaf of groups, and universal local 1-asphericity for all primes. Over an algebraically closed characteristic-zero field, a connected qcqs X has 0-acyclic projections to every k-scheme Y. For connected qcqs X and any connected k-scheme Y, the projections induce π₁^ét(X×Y) ≅ π₁^ét(X)×π₁^ét(Y).” Retain the finite-type proofs as the approximation step, import or declare the nonabelian continuity input, and use SGA1 XIII 3.2(b), 3.4(b), 4.6(b). Do not require a k-rational point of arbitrary Y; use geometric-base-extension invariance to identify the fibre group.

   **Repair test:** X=Spec ℂ[t₁,t₂,…] and Y=Spec ℂ are excluded now, although X is affine and π₁(X)=1 by finite-presentation descent to affine spaces. The repaired product map is 1→1×1. With X=𝔾ₘ and Y=Spec ℂ(t), Y has no ℂ-point; both sides are ℤ̂(1)×G_ℂ(t), using the geometric fibre. These tests retain precisely the range the present finite-type/K-rational-point proof loses.

5. **F05** (P2) One gap bundles independent base-change and descent contracts

   **Location:** `packages/EtaleHomotopyTypes/README.md:133` and `packages/EtaleHomotopyTypes/design/plan.json`, gap:nonabelian-proper-base-change.

   **Claim:** A single announced supplier gap requests proper base change for three coefficient categories and universal effective descent for proper surjections.

   **Witness:** README:611 uses base change along P→S; README:613 independently uses descent along X₁→X. SGA1 XIII 1.8 and 1.11(2) are different inputs. The plan has only the combined slug.

   **Exact repair text:** Keep the base-change requirements in gap:nonabelian-proper-base-change and remove its final descent clause. Add “What EtaleCohomologyFoundations must provide (gap:proper-surjective-etale-descent): Proper surjective morphisms of finite presentation are of universal effective descent for étale sheaves and their torsor stacks (SGA 4 VIII 9.4).” Add the identical needs sentence with supplier EtaleCohomologyFoundations, section F.2.1, to the plan's gaps list, and point the normalization/descent steps at this new slug. This is the minimum split needed to separate the independent obligations.

   **Repair test:** ℙ¹_ℂ→Spec ℂ tests base change: the C₂-torsor groupoid has one isomorphism class before and after algebraically closed field extension. For a rational nodal curve N over ℂ, the normalization ℙ¹→N tests descent: for C₂ there are two gluing classes on N, although only one torsor class on ℙ¹. Completion of the first contract cannot mark the second complete.

6. **F06** (P2) The covering-classification gap does not restrict its coverings

   **Location:** `packages/EtaleHomotopyTypes/README.md:73` and `packages/EtaleHomotopyTypes/design/plan.json`, gap:simplicial-covering-classification, “identify coverings … with subgroups of π_1”.

   **Claim:** Coverings over a connected pointed simplicial set are classified by subgroups of its fundamental group.

   **Witness:** Over the point, both the identity cover and the two-point discrete cover have vertex-unique lifting. The trivial fundamental group has one subgroup. Even marking one sheet does not make the two-point cover connected.

   **Exact repair text:** “For a connected pointed simplicial set K, classify connected pointed coverings with vertex-unique lifting by subgroups of π₁(K); pullback followed by taking the component of the selected vertex corresponds to inverse image of subgroups. Compare their realizations with connected pointed ordinary covering spaces.” Change both occurrences of this needs sentence. If all coverings are wanted, state their classification by π₁(K)-sets separately; unpointed connected coverings use conjugacy classes of subgroups.

   **Repair test:** Over a point, only the one-point cover remains connected, matching the unique subgroup. Over the circle, 2ℤ gives the pointed two-sheeted connected cover; pulling it back along *→S¹ gives two points, whose selected component is one point, matching the inverse-image subgroup 0⊂0.

7. **F07** (P3) The missing-carrier list omits the new deep geometric targets

   **Location:** `packages/EtaleHomotopyTypes/Suggested.lean:31`, the Layer 3 missing-headline list; README:609–617.

   **Claim:** The module docstring lists the headline results that cannot yet be stated.

   **Witness:** The list names the geometric product and fundamental-group exact sequence, but not strong desingularizability, relative Abhyankar/cohomological properness, universal local 1-asphericity or 0-acyclic projections, all separately promised in §3.8a.

   **Exact repair text:** Add to Layer 3: “Strong desingularizability lacks the resolution and boundary-refinement interface. Relative Abhyankar and cohomological properness lack relative normal-crossings divisors, finite-cover extension and étale torsor stacks with base change. Universal local 1-asphericity and 0-acyclic projections lack the strict-localization fibre and nonabelian étale-sheaf interfaces.” Keep these as missing-carrier explanations; add no proxy predicates or admitted data.

   **Repair test:** The doubled-origin line exercises the resolution target; ℙ¹ minus two points exercises cohomological properness; the nodal cubic exercises local 1-asphericity. Each now has an explicit missing-carrier entry independent of the already-listed product theorem. The native abelian theorem in R01 remains a real acceptance statement.

8. **F08** (P3) The Appendix line anchor points to the preceding proof

   **Location:** `packages/EtaleHomotopyTypes/README.md:1044`, “SS line 1410”.

   **Claim:** This is a line locator for the cited Appendix A discussion.

   **Witness:** SS line 1410 is inside the preceding Kummer-theory argument. The Appendix heading is SS line 1421; its opening pro-space/model discussion begins at line 1432.

   **Exact repair text:** Replace “SS line 228 and SS line 1410” with “SS line 228 and SS line 1421”.

   **Repair test:** The new second anchor lands on the Appendix heading. The first remains the raw-homotopy scope paragraph.

## Verified sound

Read all 1,058 README lines and all 72 Suggested.lean lines. Coverage comprises **59 numbered subsections, all six additional bold targets in §3.8a, 111 Check bullets, 88 separate API/proof bullets, 40 explicitly named pinned APIs, and the supplier sections/API claims across 16 supplier roadmaps**. All 26 gap slugs and needs sentences agree verbatim between the README and plan; their absence from a supplier is not counted as a defect. R05–R06 concern the contracts themselves.

The source audit resolved **103 distinct cached-text line anchors** in nine cited works: I01 7, IStr 1, SS 37, IEt 9, SGA1 39, StacksVarieties 2, BHH 3, IC 2, DAG13 3. Of these, 102 point into the relevant discussion; the Appendix anchor is R08. Theorems and nearby proofs, rather than just the anchor lines, were read. SGA2 XIV 1.19–1.20 was additionally fetched legally to resolve R03. The six settled uncertified works are excluded from the verified-locator count.

**Lean declaration/context inventory.** There are zero theorems, definitions, abbreviations, structures, instances, variables, or include blocks in Suggested.lean. Its only code is import Mathlib and the empty TauCetiRoadmap.EtaleHomotopyTypes namespace. Consequently there are no declaration binders to elaborate, no fully qualified name collisions, and no padding to delete. No Lean command was run. R01 identifies the native abelian acceptance theorem that should be present; R07 concerns missing explanations, not proposed proxy declarations.

| Lean section | Declarations | Variable/instance context | Computed comparison | Result/change |
| --- | ---: | --- | --- | --- |
| Whole module | 0 | None | README §2.2 gives R¹lim(cC₂)=0; number of corresponding acceptance statements=0 | R01 |

**Sampled adversarial computations.** The rows below retain selected tests from the completed audit; the exhaustive target, Check and API ledgers are omitted. These are computed instances, not proofs of the general statements. “Retain” means the instances did not refute the statement, not that an unread source was certified. The statement column includes the hypotheses relevant to the instance. Cₙ is cyclic of order n, c denotes a constant pro-object, and * is a point.

| Statement and context | Instances tried | Values on the construction/left side | Values on the claimed comparison/right side | Result/change |
| --- | --- | --- | --- | --- |
| §0.2 Isaksen model; arbitrary small pro-SSet | c∏ₙ≥1K(ℤ,n)→(P_mK); S²→* | Fixed π_n becomes ℤ at every m≥n; S² has π₂=ℤ | Pro-π_n map is iso in first case; ℤ→0 in second; no finite truncation is a level equivalence | Retain distinction from strict model |
| §0.5 all-local-coefficient detection | S¹ with sign coefficients; K(C₂,2)→* | H⁰=0,H¹=ℤ/2; H²(K(C₂,2),C₂)=C₂ | Constant system instead gives ℤ,ℤ; target H²=0 | Retain local systems and all degrees |
| §1.7 full faithfulness | G=C₂,H=S₃; G=1 | 4 strict pointed maps; 1 from B1 | 4 homomorphisms (trivial map or 3 transpositions); 1 trivial homomorphism | Retain pointedness |
| §2.2 nonabelian derived limit; finite groups | Constant S₃; tower C₂ʳ; infinite ℤ with ×2 | lim¹=singleton, singleton, ℤ₂/ℤ | Finite cases give point; infinite case is nontrivial | Retain finiteness, R01 for abelian statement |
| §2.2 abelian derived limits; finite A_i,s≥1 | Constant C₂; zero diagram; s=0 control | R¹=0,0; R⁰(cC₂)=C₂ | Zero in positive degrees; not zero at degree 0 | R01 |
| §2.5 transport/conjugation | C₂→S₃ sending generator to (12); transport α=(123),β=(12) | (12)→(23)→(13) | (βα)(12)(βα)⁻¹=(13); α⁻¹ gives (13) at first step | Retain order |
| §2.10 stabilizer quotient | Same C₃,S₃,C₂ model | S_X=C₂, Δ=S₃, Δ-orbits=2 | Kernel A₃-orbits=3; unpointed relative Hom=2 | Retain full stabilizer |
| §3.0a pro-group completion/unit | cℤ; cS₃; (ℤ,×2) | Completions ℤ̂,S₃,∏_{ℓ≠2}ℤ_ℓ; last Hom to C₃ has 3 elements | Finite-target Hom counts 2 to C₂,4 C₂→S₃,3 from tower to C₃; completion of lim tower would give 1 | Retain actual pro-unit |
| §3.5 raw/profinite groups; unibranch condition | Nodal cubic; 𝔾ₘ; field; ℙ¹ | Raw node admits infinite-image map to ℤ; 𝔾ₘ π₁=(C_n); field higher π=0; H³(ℙ¹,ℤ)=ℚ/ℤ(−1) | Finite node group ℤ̂; 𝔾ₘ Hom to ℤ=0; BG_k; ℙ¹ classes survive finite covers | R02; examples retain distinction |
| §3.8a bold: strong desingularizability | Empty, double point, doubled-origin line | Resolutions empty, Spec K, identity of doubled-origin line | Reduced smooth sources; doubled-origin line still nonseparated | Retain general resolution; R07 |
| §3.8a bold: normal-crossings complements/relative Abhyankar | ℙ¹ minus 0,∞; empty divisor; base dual numbers | C₂ torsor classes 2,1; smooth relative root covers over singular base | Same strict-local base-change counts; absolute regular-local lemma does not cover third input | R03, R07 |
| §3.8a bold: cohomological properness | Nodal cubic and C₂,S₃; infinite-dimensional affine space | Torsor classes 2,3 (conjugacy classes); affine-space π₁=1 | Same over strict henselian scalar base; last valid qcqs input excluded now | R04, R05, R07 |
| §3.8a bold: universal local 1-asphericity | Nodal cubic→point; x↦x² as control | Strict-local node has π₀=1, finite torsors trivial; square map has 2 generic local-fibre points | Required local-fibre counts 1 and 1; square map fails | R04,R07; no unibranch condition needed |
| §3.8a bold: projections 0-acyclic | X connected; X=two points; X=empty | Constant C₂ sections 2→2,2→4,2→1 | Unit bijective only in first case | R04,R07; retain connected nonempty |
| §3.8a bold: homotopy exact sequence and geometric product | 𝔾ₘ²; 𝔸²∖0→ℙ¹; X=𝔾ₘ,Y=Spec ℂ(t) | ℤ̂²; fibre π₁→total is ℤ̂→1; product group ℤ̂×G_ℂ(t) | Product ℤ̂×ℤ̂; right-exact low sequence; latter non-finite-type Y excluded now | R04; no left injectivity without boundary condition |
| §3.9b effacement iff raw K(π,1) | Separably closed point; ℙ¹,C₂; dual numbers | All positive classes 0; nonzero H² survives every surjective finite cover; point type after reduction | Higher raw π vanish, do not vanish, vanish | Both directions retain surjective covers |
| §3.9d elementary-fibration sequence | Product 𝔾ₘ×Y; 𝔸²∖0→ℙ¹ | Product boundary 0; second boundary π₂ℙ¹→π₁𝔾ₘ is an iso ℤ̂(1)→ℤ̂(1) | Split injection in first; kernel map ℤ̂→1 not injective in second | Retain complete LES; Fr text uncertified |
| §4.0a strong center-free/relative outer Hom/open image | 1,C₂,S₃; C₂→C₂² over second projection; pℤ_p | Strong center-free true,false,false; 2 relative maps; index p | Z(A₃)=C₃; two kernel orbits; open although not surjective | Retain all open subgroups/topology |
| §4.3 geometric orbit surjection | C₃→S₃ over C₂ | Kernel orbits=3 | Unpointed relative classes=2 | Surjection, not blanket bijection |
| §5.1 algebraic evaluation; T compact Hausdorff,X quasi-projective | T=*,empty,[0,1]; X=𝔸¹,𝔾ₘ,double point | Evaluation z↦z; singleton from zero ring; units 1+t, not t; ε↦0 | Continuous maps have same z,empty map,nonvanishing function,point | Retain zero ring and nilpotents |
| §5.3b analytic hypercover descent | Countably many points→point; node xy=0; double point | Degree n ℕ^(n+1), node Sing contractible, point | All diagonals contractible; empty degree-0 cover gives π₀=0≠1 | Retain infinite pieces and singular bases |
| §6.1 p-finite predicate | 0,2 discrete points; BC₂ at p=2,3; ∏K(𝔽_p,n) | Finite components,zero positive groups; π₁=C₂; π_n=𝔽_p for every n≥1 | True,true; true,false; last false for lack of bound | Retain truncation and all components |
| §6.3 localized-model/coherent-Pro comparison | Constant BC₂ at p=2; two points | Map(*,BC₂)=BC₂, π₁=C₂; Map(*,2)=2 | Same mapping spaces in coherent Pro; homotopy-category Hom alone loses C₂ | Retain mapping spaces |
| §6.4 materialized Et_p/comparison | Spec ℂ; simplicial BC_p; ∐ℕSpec ℂ | H⁰=𝔽_p; H¹=𝔽_p; H⁰ of Mat=(𝔽_p)^(βℕ) | Continuous H⁰ for last is C(βℕ,𝔽_p)≅𝔽_p^ℕ, strictly smaller | Retain non-isomorphism warning |
| §6.6 specified graded completion | Empty grading; singleton; ℕ point grades | Empty; Et_p of one grade; ordinary discrete ℕ | H⁰=0,𝔽_p,∏ℕ𝔽_p; H₀ of last=⊕ℕ𝔽_p | Retain actual simplicial grading |
| §6.9 semilinear naturality/strict action | Identity, conjugation on 𝔾ₘ, two labels | i→−i; positive loop has winding −1; labels fixed | π₁ action −1; conjugation squared +1; label permutation still swaps | Retain algebraic action for discontinuous automorphisms |

**Conventions and supplier boundary tests.** These are also used when reading the supplier statements.

| Statement/convention | Instances | Computed values on both sides | Result/change |
| --- | --- | --- | --- |
| Small universes and Pro Hom direction | cC₂ to cS₃; larger universe lift | lim colim Hom has 4 elements in each universe | Index-category size remains an explicit contract; moving only morphisms is not sufficient |
| Nonempty cofiltered Pro indices versus native empty-index limit | Empty native index; two-element constant diagram | Empty-product sections=singleton; constant diagram limit has 2 elements | Native compactness theorems allow empty index; the Pro presentation requires nonempty cofiltered index |
| Pointed/nonpointed and degree ranges | Empty space, S⁰, BS₃, K(C₂,2) | π₀ cardinalities 0,2,1,1; π₁=S₃ nonabelian; π₂=C₂ abelian | No degree-zero group or missing basepoint inferred |
| Loop/action order across StableHomotopyKTheory and this package | α=(123),β=(12),γ=(12) | αγα⁻¹=(23); βαγ(βα)⁻¹=(13); α⁻¹γα=(13) | Supplier's edge convention and package agree |
| Direct versus dual local coefficients | Point, integral coefficient ℤ/2 | Direct H⁰=ℤ/2; Hom_ℤ(ℤ/2,ℤ)=0 | AlgebraicTopology's direct-cochain input is necessary; pinned twisted Hom complex is not substituted |
| Finite/compact inverse-system hypotheses | {0,1} with constant-zero transitions; intervals [n,∞) without compactness | First limit singleton despite nonsurjective transitions; second compatible intersection empty | Native compactness scope retained |
| Topological finite generation/pro-p structure | 1,ℤ₂,ℤ₃,C₂,∏ℕC₂ | Ranks 0,1,1; finite cyclic C₂ factor; last requires infinitely many generators | No arbitrary compact pro-p group is fed to the finite-generation structure theorem |
| Empty/zero-ring cases and total functions | T=∅, Spec 0; n=0 simplex; p=1 | Map from empty source unique; Δ⁰ has one vertex; p=1 fails Prime | No 0/0, natural subtraction, out-of-range Fin index or polynomial-degree junk occurs in the acceptance file |
| Scalar extension and ramification | Separable degree 2, purely inseparable degree p; p=2,3 | Finite-cover indices 2 and 1; all characteristic-zero finite coefficients allowed | No inseparable degree substituted for étale index |
| Nonseparated and nonreduced geometry | Doubled-origin line, dual numbers | Two trait extensions; analytic point count 1 after reduction | Full raw construction retains both; quasi-projective analytic evaluation has its stated narrower source domain |
| Kummer/Betti normalization | Positive loop on 𝔾ₘ, conjugation | Kummer exponent 1; conjugate winding −1 | Matches ComplexComparisonPartII's ζ_n convention |
| Coherent mapping spaces versus Hom sets | Map(*,BC₂) | Mapping space has π₁=C₂, while Hom-set has 1 element | Ordinary Pro(Ho) cannot replace coherent Pro |
| Nonabelian p-group test across §§1,2,6 | Q₈, p=2 and 3 | BQ₈ has π₁=Q₈ and higher π=0; Hom(Q₈,C₂)=4; Hom(C₂,Q₈)=2, both central; lim¹(cQ₈)=1 | BQ₈ is 2-finite and fixed by 2-completion; it is not 3-finite; no commutativity premise is inferred in degree one |

**Supplier resolution and ownership.** All six intake resolver leads were inspected: the five mathematical suffixes resolve at the current supplier versions, and sources.toml is a filename. In particular, SchemeAndStackFoundations §0.10 has IsGeometricallyUnibranch.of_etale at README:887 and restricts unibranch_finite_components to finite locally constant sheaves at 889; the package correctly proves its infinite-torsor component step separately. EtaleCohomologyFoundations §F.3 has VanishingCycles.lisseDirectImageTransport at README:707 with proper/smooth and invertible finite-coefficient hypotheses. ComplexComparisonPartII §C−1.1 has the complexPoints, fibreProduct, reduction, etaleLocalIso and smooth interfaces at README:749–755 on locally finite-type schemes, including infinite unions and nonreduced bases.

The other resolved sections are AdicSpacesPartII R0.19.9; DiamondsAndVStacks D0.13; PerfectoidSpaces P6.10; AlgebraicTopology Stages 6 and 8; GeneralizedCohomology G2.1 and G2.10; BordismFormalGroups F6.5 (both the monoidal axiom and model-diagram rectification); StableHomotopyKTheory §§1.19–1.23, 1.28–1.34, 2.3–2.6; Completed/UniversalCovers Stages 2–4; Orbifolds O4-N; EnhancedDerivedSheaves E0.2–E0.5, E0.8, E2.6; SchemeAndStackFoundations §§0.9–0.12, 2.10, 2.15; EtaleCohomologyFoundations §§F.0.2, F.0.A2, F.0.4, F.2.6, F.3, 0.10; ResolutionOfSingularitiesCharacteristicZero §§5.1–5.5, 6.1–6.2; CrystallineCohomology CR.5:log-algebra.4; ProfiniteProPGroups Layers 0, 3, 4. Existing roadmaps were checked on main; new supplier roadmaps were read through the service at their current heads. The original strong-desingularizability input preserves generic nonvanishing of principalized ideals and the quasi-projective scope of compactification.

By-object ownership searches covered pinned Mathlib/Tau Ceti, active and completed main roadmaps, board packages/designs, the service's main/open-head index, and the **55 specifically supplied sibling folders** at their given heads. Targeted searches for rigid hypercovers, Isaksen models, pro-simplicial types, p-finite homotopy types, cohomological properness and relative Abhyankar found no competing construction in those 55 folders. Generic Pro, coherent categories, ordinary classifying spaces/coverings, direct coefficients, analytic realization and ordinary group completion have the owners above; this package adds the pro/étale adapters. Zero local Lean names means zero duplicate fully qualified declarations.

Ownership moves are recorded rather than treated as upward dependencies. AnabelianGeometryAndNonabelianChabauty §§1.5–1.6, README:3267 and 3297, still describe raw construction and raw K(π,1) comparison; the earlier general construction and effacement ownership is here, while its geometric applications remain later consumers. EllAdicHomotopyTypesAndWeights' raw realization use at design README:937 and 1015 is likewise downstream. KTheoryFiniteLocalFields §0.1, README:114, has the narrower countable compact-abelian-tower lim¹ result; it is not an earlier supplier for this package's arbitrary-small-cofiltered finite-group theorem. LocalPurity's main scope is absolute regular-local purity and extension where local purity already holds; it does not discharge R03 over singular relative bases. No later roadmap is added as a supplier.

The 26 gap contracts were checked against their named sections and the pinned-object searches. No supplier is none, no slug is missing from the plan, and no full requested pro-space/coherent-Pro/relative-geometry extension is already present at these pins. The ordinary simplicial covering request requires the qualification in R06; its comparison with ordinary coverings uses the already-owned connected pointed classification, not a second topological classification. The split requested in R05 is about separately trackable prerequisites. Conditional reliance on the remaining declared contracts is retained, including the uncertified BK convergence contract; their unimplemented status is not a finding.

**Dependency and package checks.** The prescribed read-only gate returned exactly:

```text
depcheck: 56 roadmaps, 650 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The internal forward reference is independently documented in R02. The head-to-main diff lists 12 changed files, all under packages/EtaleHomotopyTypes; no outside-folder package change was found. Suggested.lean has one import Mathlib, no option override, admitted data, lemma declaration, API catalogue or process narrative. README targets have source locators; R08 is the incorrect line anchor. No computational algorithm or copied source passage was found. The review did not edit package inputs, build Lean, alter git state, or post anything.

## Not verifiable

- **BK:** XI 5.2, XI 7.1, IX 5.1 and IX 5.4, used for the unstable fringe and convergence contracts in §§2.1–2.3, are settled uncertified. The computed examples do not independently prove the full convergence assertion.
- **AM:** Theorems 4.3 and 11.1, used for profinite detection/effacement and raw profiniteness in §§3.5 and 3.9b, are settled uncertified. Their statements are corroborated by the readable Schmidt–Stix usage; the full original proofs were not certified.
- **Fr:** Proposition 5.9 and Theorem 11.5, used for arbitrary local coefficients and the all-prime elementary-fibration comparison, are settled uncertified. In particular, the degree-one boundary comparison inside the latter proof remains locator-only.
- **FGV:** The evaluation theorem, specified grading, comparison zigzag and automorphism-action locators in Appendix A and (6.2) are settled uncertified. Their source wording and full proof scopes could not be checked; the explicit examples were computed independently, and DAG13/BHH were checked directly where used.
- **SGA5:** Exposé I §3.1.5, defining strong desingularizability, is settled uncertified. The named definition's full clauses could not be independently compared with the resolution route, although the two displayed consequences have the correctly scoped resolution suppliers.
- **SGA4:** VIII 9.4, IX 1.6(ii), 2.9, 2.11, XII 5.1 and XV 1.11, 1.16, 2.1, 4.1 are settled uncertified. The relevant SGA1 restatements and uses were checked; the original source text is not certified.
- **Lean elaboration:** Prohibited by the read-only pass. There are no declarations to expand with #check. R01's proposed theorem was assessed against actual pinned carrier definitions and binder requirements, not claimed to have been elaborated.
- **Future implementations:** Supplier README targets and declared gaps are contracts, not existing proofs. This review verifies their scope/ownership and computed test cases, not implementation of those contracts.

No settled text was requested again. The additional relative-purity source was legally obtained, so this pass introduces no unresolved reference request.

## Source issues

- **Error** in SS at Theorem A.8 proof, printed p. 857 (SS line 1619): the source says partial totalization is a product over index chains; it should be the compatible cosimplicial mapping object, with that product describing a cosimplicial degree; affects the proof.
- **Error** in SS at Appendix A.2.3, printed p. 858 (SS line 1652): the source says the collapsed relative-cylinder projection is a trivial fibration; it should be a weak equivalence, without fibrancy in general; affects the proof.
- **Gap** in I01 at Proposition 17.1 proof, preprint pp. 32–33 (IStr line 538 identifies the gap): the source says the favorable level presentations can be used simultaneously in the properness argument; it should be repaired by inserting an intervening pro-isomorphism before the levelwise pullback argument; affects the proof; corrected in print at IStr Remark 4.14 and the preceding properness proof (preprint Remark 4.16, pp. 11–12).
- **Misprint** in I01 at Proposition 18.3 proof, preprint p. 34 (I01 line 1653): the source says the selected truncations are cofinal subsystems of X,Y and concludes f is strict; it should be subsystems of PX,PY, concluding Pf is strict; affects the proof.
- **Misprint** in IEt at §3, preprint p. 8 (IEt line 350): the source says the strict natural transformation runs from EtY to EtX after rigid pullback; it should be from EtX after rigid pullback to EtY; affects the proof.
- **Misprint** in IEt at Remark 5.4, preprint p. 14 (IEt line 630): the source says the component uses U indexed by the source point x; it should be U indexed by f(x), a geometric point of the target; affects nothing.
- **Misprint** in SGA1 at XIII Proposition 1.12(2), printed p. 270 (SGA1 line 10603): the source says the degree-one properness hypothesis is imposed on Φ itself; it should be imposed on Φ₁, from which properness of Φ is deduced; affects the proof.
- **Misprint** in SGA1 at XIII Proposition 4.6 proof, printed p. 310 (SGA1 line 12297): the source says Corollary 3.5 supplies universal local 1-asphericity; it should be Corollary 3.4; affects the proof.
- **Misprint** in SGA1 at XIII Proposition 4.6 proof, printed p. 311 (SGA1 line 12304): the source says g satisfies the hypotheses of Lemma 4.2 for the displayed fibre sequence; it should be f, the projection from X×Y to Y; affects the proof.
- **Misprint** in SGA1 at XIII Proposition 4.6 proof, printed p. 311 (SGA1 line 12307): the source says the fibre-to-product composite ending in π₁(Y) is an isomorphism; it should be the composite ending in π₁(X); affects the proof.
- **Misprint** in SGA1 at XIII Proposition 4.6 proof, printed p. 311 (SGA1 line 12312): the source says the split comparison sequence joins its last two group terms by a product sign; it should be the projection arrow from π₁(X)×π₁(Y) to π₁(Y); affects the proof.
- **Misprint** in SGA1 at XIII Proposition 5.5, printed p. 317 (SGA1 line 12568): the source says Y is the complement of the divisor and U its complement; it should be Y the divisor support and U its complement; affects a stated result.
- **Misprint** in DAG13 at Proposition 3.3.10 proof, printed p. 84 (DAG13 line 3748): the source says the three K(−,1) spaces in the fibre sequence are simply connected; it should be connected, with the displayed nonzero fundamental groups; affects nothing.
- **Error** in DAG13 at Corollary 3.4.10, printed pp. 91–92 (DAG13 line 4134): the source says the H⁰-unit criterion characterizes n-connectivity even for n=0 and n=−1; it should be restricted to n≥1, with the lower connectivity cases stated separately; affects a stated result.
- **Misprint** in DAG13 at Theorem 3.4.12 proof, printed p. 93 (DAG13 line 4199): the source says Proposition 3.3.8 gives vertical isomorphisms and connectivity gives the left vertical isomorphism; it should be horizontal comparison isomorphisms and a right vertical connectivity isomorphism, yielding the left one; affects the proof.
- **Misprint** in sga2 at XIV Lemma 2.1.1, printed p. 178 (sga2 line 6596): the source says its dimension inequality is an inequality exactly when both displayed invariants agree; it should be an equality exactly when both invariants agree; affects nothing.

The package already avoids the SS cylinder/totalization errors, uses the IStr properness repair and corrects the SGA1 product projection. The DAG13 connectivity error concerns n≤0; §6.5 uses n=2. For the latter counterexample, a two-point p-finite space is 0-connective but H⁰=𝔽_p², so the unit 𝔽_p→H⁰ is not an isomorphism.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6962204af0eb231b30302be0bb10a6ea19c9f9ea", "job": "RT-EtaleHomotopyTypes~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
