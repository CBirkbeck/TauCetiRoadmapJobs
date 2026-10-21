<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/47#issuecomment-6307032572 -->
Review (codex) of e9f98a6

Verdict: needs_changes

1. **F01** (P2) The nearby-cycle contract uses the wrong open locus on its full domain

   **Location:** `packages/CohomologyComparisonsPartII/design/README.md:94`; `packages/CohomologyComparisonsPartII/design/plan.json:2305` and `:2306`. The contract states “For log-syntomic X/W(k)” and specifies “j′:X_tr→X_K”.

   **Claim:** On every log-syntomic X/W(k), the entire trivial-log locus is a generic-fibre open, giving both j′ and u and the displayed projection comparisons. The convention at README line 19 explicitly defines X_tr as the locus of trivial log structure, not its generic-fibre restriction.

   **Witness:** Take trivial-log X=Spec(Z_p). Then X_tr=X; no map X→Spec(Q_p) factors its identity. EN line 292–293 instead uses X_tr,K. The design itself admits this X at README line 365.

   **Exact repair:** On the full W(k)-domain define X_η=X[1/p] and U=X_tr∩X_η. Use j_η:X_η→X, j′:U→X_η, j=j_ηj′ and u:U_et→X_η,se throughout the contract, with Λ on U. When X has the structural V-morphism used by Layer 4, identify X_η with X_K=X×V K. For its canonical-vertical-log inputs, additionally record U=X_tr. Update both `detail` and `needs` in plan.json and the matching README paragraph. Add the trivial-log point as a negative-control Check: U=Spec(Q_p), whereas X_tr=Spec(Z_p). This retains the general log-syntomic contract and all existing consumers. It also removes the ambiguity of calling X×W(k)K an open generic fibre when K/K0 is ramified and no V-structure on X was specified.

One P2 finding; no P1 or P3 findings. The required correction concerns the domain of one declared supplier contract, not the absence of the promised supplier theory. The classical comparison targets retain their stated generality.

## Previous findings and repairs

The named report `packages/CohomologyComparisonsPartII/reports/REV-DESIGN-CohomologyComparisonsPartII~3.md` is absent. Consequently, the following is a finding-by-finding verification of F01–F06 as described in `packages/CohomologyComparisonsPartII/reports/FIX-DESIGN-CohomologyComparisonsPartII~4.md`, not certification that the unavailable review contained no other requirements. None of these six entries is marked “not actionable in this package.”

| Repair-report finding | Repaired passage in design/README.md | Independent result |
| --- | --- | --- |
| F01: ownership and period prerequisites | Line 7: “every comparison the base owns is imported, none reconstructed”; line 68: “The canonical-vertical-log domain of 4.2 and 4.5 does not supply this horizontal-log map.” | **Repaired.** `base-ownership` is absent; the five replacement mathematical contracts are consumed by the appropriate targets. BesserI line 1214 and AM line 1327–1334 support the two period domains. The horizontal and vertical point computations differ as stated. |
| F02: completed horizontal-log carrier | Line 352: “For every log-syntomic X/W(k) of 3.2 define RΓ_syn(X,r)=Rlim_n RΓ(X_et,S′_n(r)), its divided analogue” | **Repaired.** Both completions and rationalizations have the full domain; `completedReduction` and `rationalFiber` remain restricted to arithmetic pairs. The trivial-log point Check at line 365 computes both towers correctly. EN line 196–218 and NN line 1299–1338 distinguish these constructions. |
| F03: period-ring contract | Line 78: “No Frobenius or monodromy operator on B_dR is stipulated.” | **Repaired.** Operators, coefficient sequences, approximate sequences, and the filtered PD comparison are enumerated. CN line 973–980 and CN line 1169–1185,1234–1239 support the hypotheses and separate error bounds. Section 4.1 no longer consumes this gap. |
| F04: native exact carriers | Line 50: “`TauCeti.ExactStructure.IsMonoidal E`”; “`TauCeti.ExactStructure.op E`” | **Repaired.** The binders and tensor-exact fields match TauCetiExactMonoidal line 48–57 and TauCetiExactOpposite line 150–155,201–203. Section 1.3 proves the specialization rather than recreating either carrier. |
| F05: workflow prose | Line 31: “Suggested declaration homes are the ordinary TauCeti cohomology, exact-category and coefficient namespaces.” | **Repaired as described.** The revised text gives mathematical ownership and declaration homes; it contains no job/round/PR references, local machine paths, Lean workflow instructions or extraction-cache instructions. Source-access and OCR limitations remain identified in References. |
| F06: discriminating computations | Line 200: “d(a)=(0,2a)”; line 482: “not bijective for every such m>1”; line 574: “Their union is not a relative normal-crossings divisor over S there” | **Repaired.** The fibre differential has the positive second component; t↦t^p on Q_p[t]/t^m is nonbijective for m>1; specializing x(x−t) at t=0 gives x² in every characteristic. |

## Verified sound

### Principles, shape and consistency

Read all seven layers, 33 targets, 121 named API entries, 106 Checks and 31 supplier-gap records. Each target has a locator and at least three Checks; all API and Check names occur in the README. Each layer ends with Examples and Dependencies. All 53 internal target dependencies point backwards. All 31 gap slugs, needs sentences, section contracts and `neededBy` incidence sets agree between the README and plan. All gaps have named suppliers. The difference between the plan's plain declaration names and their backtick formatting in README §1.3 is only formatting.

The scope is an extension of CohomologyComparisons, with explicit boundaries for classical producers, base comparison theory and regulator consumers. There is no good-prime restriction on the general producers, computational-algorithm target, copied source passage identified in the checked material, or dependency on a consumer. Relative AM constructions retain the stronger modulo-p Frobenius hypothesis and its ramified negative control. Source hypotheses are not silently replaced by Z_p-only conclusions. No Suggested.lean exists in this design; there is no admitted data or `set_option` in a submitted Lean file.

The gap audit distinguishes absent supplier results from defects: missing sections are recorded as contracts, not asserted to exist. The 13 local-period gaps isolate the analytic/Galois comparison steps; general Koszul complexes remain imported. The rigid, crystalline and relative contracts retain their field, smoothness, log, finite-type and finiteness domains. No additional duplicate or unowned gap was found in the inspected material. R01 is the precise open-locus defect in `nearby-cycle-inputs`.

### Seeded source sample

All 15 requested targets were checked against the named legal cached texts, including theorem/equation numbers, page markers and hypotheses. No target locator is flagged unverified in the design or plan. BesserI's damaged equations limit direct transcription verification as recorded below; the other sampled passages were readable. Numbering refers to the specified preprint versions, not assumed journal pagination.

| Target | Text inspected | Result |
| --- | --- | --- |
| 1.4 coefficient fibre | AM Definition 2.4 and (2.2),(2.6), pp. 6–7; AM line 224–258 | Form-degree action, shifted filtration and differential agree. Integrability/horizontality give d²=0; strict exactness gives the claimed degreewise exactness. |
| 1.5 extension evaluation | AM (2.3)–(2.7), pp. 6–7; AM line 229–268 | Iterated connecting evaluation agrees. Using the distinguished class 1 avoids the source's unjustified H⁰=Q_p simplification on disconnected bases. Cup compatibility is a stated proof obligation using the exact tensor construction. |
| 1.6 representatives | AM Lemma 2.5, pp. 7–8, and (2.22), p. 19; AM line 283–297,795–816 | F⁰H=0 is essential and retained. The lift is algebraic; R has sign 1−Φ and depends on the Frobenius lift. |
| 2.3 rigid basic theory | BesserI Propositions 6.2–6.3, Definition 6.5, pp. 19–20, Remark 8.7(3), p. 28; BesserI line 719–759,1073–1080; AM line 1321–1326 | Finite Čech descent, cone long exact sequence and product construction are supported. Eliminating the identity bc at K=K0 gives the stated single fibre without inverting sp. Some original displayed coordinates are unreadable in BesserI. |
| 3.2 integral fibres | EN §2.1/(2.1), pp. 4–5; EN line 158–197 | Divided kernel identification uses syntomic-site surjectivity; étale realization uses derived pushforward. Divided and undivided ideals remain distinct. |
| 3.4 presentations/completion | EN §2.1.1, p. 5; EN line 198–218; NN (32), pp. 25–26; NN line 1299–1338 | Local PD presentations and gluing support the full log-syntomic construction. NN reduction and rational quotient assertions retain arithmetic-pair hypotheses and the p^r rescaling. |
| 4.1 lattices | EN §2.2, p. 7; EN line 299–308; CN §§1.1.1,2.4.3, pp. 2,23; CN line 67–69,968–979; NN §4.1 | EN factorial and CN p-power normalizations are separated. Denominators are nonzero in characteristic zero. Finite-level inclusion need not be injective. |
| 4.3 exact comparison | EN Proposition 2.1 and Theorem 2.2, pp. 5,7; EN line 186–192,318–323; TsujiNearby Theorem 5.1, pp. 555–561, line 944–963,1074–1095 | fs log-smooth domain and 0≤r≤p−2 agree. The proof obligations cover the general fs reduction, not only smooth boundary charts. |
| 4.4 bounded comparison | CN Theorem 1.1, p. 2, §2.2.1, p. 10, §5.1.2, p. 54; CN line 70–90,413–438,2587–2606 | Semistable/base-change charts, 1≤h≤e, q≤r, uniform n/X bound and the separate p=2 dimension qualification agree with v4. |
| 5.1 HK data | HK §§3.2–3.6, pp. 243–246, Theorem 5.1, pp. 262–263; HK line 698–770,1321–1342 | Properness and Cartier type are retained. Frobenius is bijective on the specified carrier; Nφ=pφN and the positive uniformizer-change sign agree. |
| 5.2 total fibre | NN Proposition 3.8, pp. 26–27; NN line 1341–1391 | The four corners, lower twist r−1 and arithmetic-pair domain match. The enhanced deformation input is a distinct declared contract. |
| 5.3 h-adapter | NN Theorem A(1),(4), p. 2; Proposition 3.18, p. 33; Proposition 4.6, p. 46; Corollary 4.11, p. 53; NN line 85–100,1688–1691,2400–2404,2778–2785 | Classical-to-h comparison is restricted correctly; arithmetic/geometric periods retain τ≤r and products. They are imported and transported, not re-proved. |
| 6.1 relative datum | AM Definition 2.12 and Remark 2.13, pp. 11–12; AM line 451–505 | The comparison is constructed before coherence or invertibility. Actual pushforwards and frame descriptions are used. |
| 6.4 geometric settings | AM Settings 2.14,2.16 and Propositions 2.15,2.17, pp. 12–14; AM line 510–585 | Projective smoothness, log integrality, Zariski type and both boundary conditions are retained. Algebraic filtered finiteness is explicitly supplied separately. |
| 7.3 specialization | AM (2.1), p. 5, Lemma 2.5, p. 7, Theorem 3.7 proof, pp. 30–31; AM line 206–217,283–297,1352–1364 | Pullback applies to the actual extension. Frobenius compatibility is retained; dP_a of a relative base form is zero, not its cotangent-fibre evaluation. |

Additional checks covered EN's product warning (EN line 243–244), the two new period-ring locators (CN line 973–980,1234–1239), every local-period contract's cited comparison, AM's nonsplit-boundary residue sequence (AM line 587–607), the affine domain of its acyclicity proof (AM line 609–620), point lifting/detection (AM line 1229–1301), and the derived-limit example (StacksRlim line 10638–10675). The source manifest parses: 21 records, 20 certified cached texts and one settled uncertified consumer-context work, BesserII. No source entry was changed or added.

### Adversarial mathematics pass

Each target row covers its definition or theorem, associated named API, hypotheses and Checks. “None” means no correction identified by these instances and source/interface checks, not that a future formal proof has been completed. Equal-characteristic bases and inseparable coefficient extensions do not satisfy the mixed-characteristic/characteristic-zero hypotheses; zero modules and empty schemes do, while zero coefficient fields do not.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: bases/scalars | p=2,3; π²=p; k=F_p and infinite perfect k; zero ring | Ramified AM obstruction has valuation 1<2. Classical layers need no lift. 1−φ/p^r is Q_p-linear, not generally K0-linear. | None |
| Conventions: signs/twists | Q —2→ Q; O(1)⊗O(−1); two-dimensional Nφ=pφN | Positive second differential, cancelling twists and lower exponent r−1 agree. | None |
| 1.1 objects/morphisms | zero; unit; Φe=te; generic-only Spec(K) | Horizontal unit is admitted; te fails by dt; rigid forgetful functor can lose a generic-only object, de Rham forgetful does not. | None |
| 1.2 tensor/dual/pullback | zero factor; opposite twists; identity base map; evaluation/coevaluation | Exponents and filtration jumps add; finite locally free graded pieces make duality and tensor admissible. | None |
| 1.3 exact structure/Ext | split extension; Ext¹(O,0); unequal-filtration identity | Filtered exactness excludes the non-strict identity; locally split graded pieces give biexact tensor; generic exact Ext is not replaced by abelian Ext. | None |
| 1.4 connection fibre | point O(0), O(1), zero; multiplication 2 | O(0) has Q_p in degrees 0,1; O(1) only degree 1; multiplication 2 fibre is acyclic. | None |
| 1.5 evaluation | i=0; split; Φe=e−h; disconnected base | Identity maps to 1, split to 0, nonsplit to (0,h). Distinguished 1 exists without H⁰=Q_p. | None |
| 1.6 projections | O(1), Φe=e+ah; split; F⁰H nonzero | R=−ah; F⁰H=0 removes degree-zero coboundaries. Without it the filtered lift is not unique. | None |
| 2.1 specialization | Spec(V); empty; Spec(K) | sp is id, zero, and K→0 respectively; no false general equivalence. | None |
| 2.2 rigid fibre | Z_p point, r=0,1,2; empty special fibre | f(a,b)=(0,a−b) at r=0; positive r leaves H¹=Q_p; generic-only fibre is filtered de Rham. | None |
| 2.3 exactness/products/descent | zero sp; identity bc; G_m,r=1; empty scheme | Elimination does not invert sp; φ(dlog t)=p dlog t; empty products vanish. | None |
| 3.1 divided PD | r=0; p=2,r=1; mod-p ambiguity | Equality range reaches p−1, distinct from period exactness. Higher-level division avoids nonunique solutions of py=0. | None |
| 3.2 integral fibres/sites | zero map A[0]→B[0]; r=0; empty | Fibre has H⁰=A,H¹=B; site-dependent kernel replacement is explicit. | None |
| 3.3 ω,τ,products | r=0; p on Z/p²; odd degrees, p=2 | Composites p^r give killed errors, not isomorphisms; no multiplicativity of τ is asserted. | None |
| 3.4 local/completed/rational | r=0; constant point tower; tail direct-sum tower | Quotient term vanishes at r=0; both point completions give [Z_p→0 Z_p]; tail tower has lim¹=product/direct sum. | None |
| 4.1 modified lattices | p=2,r=2; r=p−1; n=1 | EN=(1/8)Z_2(2), CN=(1/4)Z_2(2); inclusion is zero mod 2; alternate endpoint changes one power of p. | None |
| 4.2 periods | r=0; unit; nonproper X; horizontal versus vertical log point | Unit and reduction agree. The target is nearby cycles on the closed part, not arbitrary generic global cohomology. | R01 fixes the supplier's wider domain; target domain is already canonical log. |
| 4.3 exact small weights | p=2,r=0,1; p=3,r=1,2; t dlog t | Endpoints correct; inverse Cartier gives [t^p dlog t], whereas [dt]=0; no undivided exactness inferred. | None |
| 4.4 bounded all weights | xy=π^h,h>1; p=2,r=1; q>r | Base-change charts included, uniform finite-level bounds retained, no above-range conclusion. | None |
| 4.5 gluing | empty closed part; identity j′; r=0 | Open restriction is Rj′_*Λ; localization leaves the open object when the closed part is empty. | R01 fixes its general supplier contract. |
| 5.1 HK adapter | N=0 rank one; φ=diag(1,p), Ne1=e0; t^m=0 | Positive change law and Nφ=pφN hold; t↦t^p has kernel and misses t when m>1. | None |
| 5.2 semistable fibre | r=0; two-dimensional datum; zero D,E | Lower map is 1−pφ at r=0; Na−(1−φ/p^(r−1))c kills the first differential. | None |
| 5.3 h-realization | identity refinement; p=2; r=0 | Imported comparison stays truncated; identity acts identically on both period maps. | None |
| 6.1 relative datum | identity; empty family; P¹_S | Ranks 1,0,1 and H²=O(−1); no arbitrary-open finiteness claimed. | None |
| 6.2 promotion | c=0; bad graded piece; U=D(pt−1) | Nonfinite Q_p[t,(pt−1)⁻¹] has the same dagger realization as the base; independent algebraic hypotheses are necessary. | None |
| 6.3 compactification | constant G_m; empty boundary; x=0 and x=t | Constant diagrams qualify; colliding boundary has nonreduced fibre x²=0 at every prime. | None |
| 6.4 geometric settings | constant genus-g curves, g=0; G_m; p=2 | Proper ranks 1,2g,1; G_m H¹=O(−1); strong AM base condition remains. | None |
| 6.5 acyclicity | affine line; G_m; proper elliptic curve | Dagger H¹ is respectively 0 and K dlog t; elliptic H¹(O)=K excludes unrestricted smooth-scheme acyclicity. | None |
| 6.6 residues | {0,∞}; quadratic étale boundary over Z_2; empty boundary | Residues (1,−1); quadratic trace-zero Frobenius −2; proper empty-boundary H² survives outside affine hypotheses. | None |
| 6.7 geometric projections | n=0; G_m,n=1; split | Weight n+1 and residue twist m−1 agree; G_m(2)=O(1) has F⁰=0. | None |
| 7.1 compatible lifts | t↦t^p at 0 and Teichmüller a; t↦t^p+p | Lifts are 0 and [a]; latter lift of 0 is p mod p², also at p=2. | None |
| 7.2 point detection | rank zero; constant 1; k=F_p and t^p−t | Nullstellensatz proof uses algebraic closedness and reduced special fibre; finite-residue counterexample is nonzero. | None |
| 7.3 specialization | identity point; split extension; t=p | Actual extension pullback commutes with evaluation; p^p≠p rejects the incompatible point. | None |
| 7.4 horizontal comparison | point,r=0,1; G_m; adding vertical log | Horizontal point H¹=Q_p at r=1; vertical C_st point H¹=Q_p². Horizontal period source is separate. | None |
| 7.5 absolute value | curve n=1,r=2; split; omitted second vanishing | F² log forms vanish on a curve; connecting representative is (0,b). Both filtered hypercohomology vanishings are needed. | None |
| Supplier contracts | r=0; p=2; identity scalar extension; trivial-log Spec(Z_p) | Named owners and domains are explicit except the missing generic restriction in nearby-cycle-inputs. | R01 |

### Duplication and supplier order

Read the scope and relevant sections of three main-branch examples: `TauCetiRoadmap/GrothendieckEulerForms/README.md`, `TauCetiRoadmap/RigidAnalyticGeometry/README.md` and `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`. Checked the named sections of AdicSpacesPartIV, EtaleCohomologyFoundations and DerivedModuleAlgebra against their actual text. Supplier sections exist: AdicSpacesPartIV F1.5/F1.7/F1.8/F1.9/F1.12/F1.16; RigidAnalyticGeometry 6.1/6.2/7.3/7.4/8.1/8.4; EnhancedDerivedSheaves 0.1–0.4/E2:towers.1/E5:abstract; EtaleCohomologyFoundations F.0.3/F.1/F.4.1–F.4.5; DerivedModuleAlgebra 0.K.1.

| Object | Existing owner and witness | Boundary checked |
| --- | --- | --- |
| Cochain cone and contractibility | MathlibCone line 38–61,76–92; TauCetiCone line 40–56 | Actual cones are imported; this design fixes coordinates for its particular fibres. |
| Semilinear isocrystal | MathlibPin line 67–77,117–143 | Bijective Frobenius carrier is imported; HK realization and monodromy are not supplied by the one-dimensional classification. |
| Abelian Ext | MathlibExt line 53–61,117–125; TauCetiExtReview line 54; GrothendieckEulerForms Layer 5, line 383 onward | These require an abelian category. General exact Yoneda remains a legitimate named extension contract. |
| Exact/monoidal/opposite structures | TauCetiExactReview line 245–267; TauCetiExactFunctorReview line 68–81; TauCetiExactMonoidal line 48–57; TauCetiExactOpposite line 150–155,201–203 | All four carriers are consumed under their native binders. Only their FilFMIC specialization is constructed here. |
| Period-ring carriers | MathlibBDeRhamReview line 55–56,79–95 | Existing completion/localization carriers are explicitly reused; missing comparison and filtration API is a supplier contract. |
| Syntomic algebra | TauCetiSyntomic line 79–93 | Flat presentation predicate is not syntomic cohomology. No duplicate cohomology producer follows from the shared name. |
| Towers, sheaf enhancements, tensor and Koszul | EnhancedDerivedSheaves §§0.1–0.4,E2:towers.1,E5:abstract; DerivedModuleAlgebra §0.K.1 | Imported constructions, not new generic targets. |
| Dagger geometry and affine coherence | AdicSpacesPartIV §§F1.5–F1.9; RigidAnalyticGeometry §7.3 | Section 6.5 concerns j† on an algebraic affine analytification and its relative realization adapter; the affinoid dagger theorem and affinoid acyclicity are inputs. |

The Mathlib and Tau Ceti pins match `lake-manifest.json`. GitHub object searches located the isocrystal, exact-monoidal and syntomic-algebra objects; conclusions above use the cached files at the actual pins, not the different default-branch revisions returned by search. Searches over main, Completed and board packages found no competing FilFMIC or classical syntomic producer. The two available open-roadmap heads were also searched/read: ArithmeticDynamics at `1921611a7a96ac19fb15c2b1291b35958c3ef0cb`, ErdosProgressionPowers at `dfd6aa053dc89b29a7c840c448351eb248b52b83`. Neither supplies these objects. No later-roadmap input or ownership move was identified.

The exact requested gate invocation failed because `packages/CohomologyComparisonsPartII/README.md` does not exist at this design stage; it reported FileNotFoundError. Re-running with the actual candidate `packages/CohomologyComparisonsPartII/design/README.md`, the same configuration, `--only CohomologyComparisonsPartII` and `merge-order/ORDER.txt` exited 0 and produced:

```text
candidate: CohomologyComparisonsPartII is not in the merge order yet; checked as if placed after CohomologyComparisons (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 12 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Its limited loaded-roadmap count is not treated as an exhaustive ownership proof: all 33 Needs lines, the 11 supplier records and 31 gap owners were also inspected. The named missing-section contracts were not counted as nonexistent supplied sections. No tooling or merge-order file was changed.

## Not verifiable

- **Original previous review:** `packages/CohomologyComparisonsPartII/reports/REV-DESIGN-CohomologyComparisonsPartII~3.md` is absent. The six repair-report descriptions were checked individually, with the limitation stated above.
- **Lean elaboration:** not available. There is no `Suggested.lean` in the submitted design, and the brief provides no executable elaboration command. No Lean command was run; neither successful elaboration nor “sorry is the only warning” is claimed.
- **BesserI damaged displayed equations:** BesserI line 709–714,734 and 1074–1078 lose formula content in the operator-held extraction. Readable surrounding statements, cone algebra and AM line 1314–1326 support the checks recorded above; an exact visual verification of the damaged original displays was not possible from that extraction.
- **BesserII:** settled `uncertified` paywalled consumer provenance, with no producer target depending on it. It was not reopened or added to a missing-source request.
- **Repository-wide absence at library pins:** complete local Mathlib/Tau Ceti source checkouts are unavailable. Pinned declaration files were read, and object searches were performed, but a whole-library grep at those commits was not possible. No universal absence claim is based solely on search results.
- **Unavailable supplier sections:** their promised results have not been independently certified as implemented. The 31 declared gaps are contracts; their current absence is not a finding. R01 concerns a contract's incorrect domain, which can be repaired within this package.

Only this report and `packages/CohomologyComparisonsPartII/design/review.json` were written as deliverables. The design, plan and source manifest were left unchanged.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e9f98a6a48fd859244c92b1ceddeefe23dcd11b1", "job": "REV-DESIGN-CohomologyComparisonsPartII~4", "model": "gpt-6-astra", "worker": "chris-2"} -->
