<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/47#issuecomment-6305814741 -->
Review (codex) of e179dec

Verdict: needs_changes

1. **F01** (P2) Four intake contracts still have summary-only needs fields

   **Location.** `packages/CohomologyComparisonsPartII/design/plan.json`: lines 2143, 2194, 2273 and 2428; matching design README lines 68, 76, 88 and 116. Representative text: “Provide a Part II contract for general exact-category Yoneda extensions on the existing ExactStructure carrier.”

   **Claim.** The `crystalline-inputs`, `rigid-realizations`, `nearby-cycle-inputs` and `exact-yoneda` records are precise supplier requests as consumed by intake. Their `needs` sentences instead request topics or section identification. They omit the hypotheses and mathematical outputs required by the brief. The longer `detail` paragraphs help a human reader, but do not make the required one-sentence fields self-contained. In particular, “the required log-local Cartier calculation” does not specify a map or conclusion even in the detail paragraph.

   **Witness.** Plan line 2428 specifies neither smallness, linearity, degree nor extension operations; line 2273 names no Cartier map or degree range. Compare the additional requirements in README lines 116 and 400–404.

   **Exact repair.** Keep the suppliers and the valid ownership boundaries. Replace the four `needs` sentences in both files with mathematical contracts, and split independent obligations where necessary:

   | Gap | Required repair |
   | --- | --- |
   | `exact-yoneda` | State: for an essentially small R-linear category with a chosen `TauCeti.ExactStructure`, provide all i≥0 Yoneda groups of admissible extensions modulo zigzags, Ext⁰=Hom, Baer/R-module operations, splicing, exact-functor naturality and the canonical abelian comparison; state the additional biexact symmetric tensor hypothesis for the external/unit-source products. These requirements are already in its detail paragraph. |
   | `crystalline-inputs` | State the W(k)/canonical-log-V/arithmetic-pair domains and their fine/integral/log-syntomic or log-smooth hypotheses; identify O_cr,n, J^[r], the n≥1 reduction and flatness statements, filtered PD presentations and the rational filtered quotient comparison of NN Corollary 2.4. Separate site/carrier provision from the filtered realization theorem if one sentence cannot give each domain unambiguously. Do not request 3.1's new J^⟨r⟩ construction back from the supplier. |
   | `rigid-realizations` | State the domains of the K0/K rigid complexes and smooth characteristic-zero compactification complexes, the scalar-extension, Frobenius, product and finite Čech comparisons, and separately the smooth projective W(k) normal-crossings-pair log-crystalline/rigid comparison. Preserve the distinction between filtered algebraic de Rham data and unfiltered rigid cohomology. |
   | `nearby-cycle-inputs` | Separate the site/recollement contract from the local calculation. Specify i, j and the projection functors, coefficient domain and exact open-extension/projection comparisons. For the local calculation give the actual Cartier/nearby-cycle map, local hypotheses, n and r ranges and conclusion, with a numbered source locator. Do not use the final assertion of 4.3 as its own prerequisite. |

   Synchronize any new slugs and `neededBy`/prerequisite entries. This finding does not ask for supplier implementations or treat absent accepted sections as unowned.

2. **F02** (P3) Cite the landed exact-category carriers at the pin

   **Location.** `packages/CohomologyComparisonsPartII/design/README.md` lines 46–50, 116 and 168; the corresponding supplier/prerequisite entries in `design/plan.json`. Text: “From TauCetiRoadmap.GrothendieckEulerForms Layer 0: Quillen ExactStructure and conflation-exact functors”.

   **Claim.** The supplier floor identifies these objects only through the roadmap and omits their existing pinned declarations. There is no duplicate generic construction target here, so this is a citation/ownership precision defect, not a reason to delete the specialized FilFMIC exact structure.

   **Witness.** TauCetiExactReview line 245 defines `TauCeti.ExactStructure`; TauCetiExactFunctorReview line 78 defines `TauCeti.ExactStructure.IsConflationExact`. Both files occur at the recorded Tau Ceti pin.

   **Exact repair.** Add these exact names and files, with their additive-category binders, under From Tau Ceti and use them in 1.3 and `exact-yoneda`. The files are `TauCeti/CategoryTheory/Exact/ExactStructure.lean` and `TauCeti/CategoryTheory/Exact/Functor.lean`. Retain GrothendieckEulerForms only for additional named API actually consumed and not covered by the pinned declarations. Retain the genuine all-degree exact-category Yoneda gap: TauCetiExtReview line 54 still assumes `[Abelian C] [HasExt C]`.

3. **F03** (P3) The inverse-limit Check has no test instance

   **Location.** `packages/CohomologyComparisonsPartII/design/README.md` line 354 and its plan test entry. Text: “Rlim is retained: a tower is not replaced by an underived limit without an exactness hypothesis.”

   **Claim.** `LogSyntomic.presentationsAndCompletion_tower` is a correct caution, but is not a discriminating Check: it names no tower and computes no difference between derived and ordinary limits.

   **Witness.** Take A_n=⊕_(j≥n) F_p with inclusion transitions. Its ordinary limit is zero, whereas lim¹ A_n=(∏_(j≥0) F_p)/(⊕_(j≥0) F_p) is nonzero.

   **Exact repair.** Replace the caution by that explicit tower computation, including the nonzero class of (1,1,…) in the quotient. It follows from the short exact tower sequence A_n→⊕_(j≥0) F_p→⊕_(j<n) F_p, whose latter two towers have vanishing lim¹. This tests the shared derived-limit adapter without imposing an underived-limit identification on syntomic towers. Mirror it only when a genuine kept definition and the relevant carriers are available; do not add an admitted example or artificial carrier to this design.

One P2 contract-specification finding and two P3 findings; no P1 finding. The mathematical checks below found no counterexample to the revised headline statements. Missing supplier implementations are not counted as defects. No design target was edited.

## Previous findings and repairs

The designated previous review, `packages/CohomologyComparisonsPartII/reports/REV-DESIGN-CohomologyComparisonsPartII.md`, is absent. Consequently this comparison uses the six finding descriptions in `packages/CohomologyComparisonsPartII/reports/FIX-DESIGN-CohomologyComparisonsPartII~2.md`; it cannot certify correspondence with an unavailable original review. None of those six descriptions marks a finding “not actionable in this package”.

| Previous finding | Status | Repaired passage and independent verification |
| --- | --- | --- |
| F01: algebraic finiteness does not follow from rigid coherence | Repaired | Design README line 532: “Independently assume the algebraic finiteness, Hodge-filtration and connection hypotheses below on the actual modules of 6.1.” Lines 534–545 make the hypotheses operational. For U=D(pt−1) in A¹ over Z_p, the dagger inverse exists, while unbounded pole order proves algebraic nonfiniteness. The corrected assumptions propagate through 6.4, 6.6, 6.7 and 7.5. |
| F02: rigid Gysin prerequisite | Repaired | Line 84: “when D meets every geometric component, supply H²_rig(U)=0.” The declared `rigid-gysin` contract retains H²(U) in general. Lines 598–610 use affineness for the shorter relative sequence and include the empty-boundary P¹ control. AM line 595–607 supports the relative proof and the separate absolute Frobenius input. |
| F03: three bundled supplier obligations | Repaired for the three bundles described in the repair report | Line 72: “the proper cohomology theorem alone supplies no such enhanced triangle”; line 80: “algebraic filtered finiteness is a separate contract”; line 96: “at p=2 its dimension dependence is retained.” Proper HK and arithmetic-pair deformation are separate, relative coefficient and geometric finiteness inputs are separated, and thirteen numbered CN inputs replace the former local-period bundle. Their mathematical outputs were checked below. R01 concerns four other summary-only `needs` fields. |
| F04: period-ring carrier floor | Repaired | Line 42: “`BDeRhamPlus R p` and `BDeRham R p` are global declarations in `Mathlib/RingTheory/Perfectoid/BDeRham.lean`.” The four binder conditions agree with MathlibBDeRhamReview line 55–56; the definitions are at lines 79 and 92. The gap extends the carriers instead of reconstructing them. |
| F05: classical-pair to h-realization locator | Repaired | Line 490: “NN, Proposition 3.18, p. 33, NN line 1688–1691 for the classical-pair map”. That proposition has the fine, log-smooth, Cartier-type arithmetic-pair hypotheses and all r≥0. It is correctly distinguished from the truncated period comparisons. |
| F06: production-stage narrative | Repaired to the extent checkable without the original review | Line 7 now says “This Part II owns the explicit classical producer diagrams and their adapters, the AM filtered relative assembly, extension evaluation and specialization.” The stage sentence described by the repair report is absent. No round/job/pull-request narrative occurs in the target prose. |

## Verified sound

### Principles and scope

Read all seven layers, 33 target statements, 120 associated API entries and 104 Checks in the README and plan. The extension boundary is explicit: classical producer diagrams and relative coefficient assembly are here, while the base's general comparison/h-descent results remain imports. The unavailable base text prevents final overlap certification, but that is the declared `base-ownership` contract, not a rejection of the Part II scope.

No route-specific good-prime restriction was found. The classical layers allow every prime and ramified mixed-characteristic DVRs. The AM modulo-p Frobenius restriction is an actual source hypothesis; π²=p disproves its existence in that ramified example. The small-weight exact theorem, all-weight bounded theorem and rational theorem remain separate. Symbol/regulator and integration constructions remain downstream and supply no premises. No copied mathematical passage, executable algorithm target or suspicious instruction was found in the reviewed design. Searches of the source sample supported paraphrase rather than transcription; this is not an exhaustive text-similarity proof.

### Seeded source sample

All 15 selected targets were compared with the specified source text, numbering, page markers and hypotheses. There are no additional explicitly unverified mathematical locators in the design. Missing supplier-section locators are the declared contracts audited separately. BesserII is the settled uncertified consumer-context citation and is unused by producer targets.

| Target | Text read and result |
| --- | --- |
| 1.5 Evaluation of extensions | AM equations (2.3)–(2.7), pp. 6–7, AM line 229–268: connecting evaluation and de Rham projection agree. The roadmap correctly uses the unit class rather than asserting H⁰=Q_p on every disconnected base. Cup compatibility is an additional formal tensor/connecting-map API, with a proof route in 1.3–1.5. |
| 1.6 Canonical representatives | AM Lemma 2.5, pp. 7–8, AM line 283–297, and (2.22), p. 19, AM line 795–816: F⁰H=0 is essential. Strictness gives the algebraic filtered lift; zero degree-zero source eliminates boundaries. The sign of (1−Φ)e is correct. |
| 2.1 de Rham-to-rigid diagram | BesserI §5, manuscript pp. 17–18, BesserI line 648–688; Frobenius at line 625–636. The source gives a functorial comparison, not a general equivalence. Compactification filtration and natural K0/K scalar fields are retained. |
| 2.3 Exact sequence/descent/products | BesserI Propositions 6.2–6.3 and Definition 6.5, pp. 19–20, BesserI line 719–760; Remark 8.7(3), p. 28, line 1073–1081. Finite Čech descent and cup construction are visible. Some displayed maps are lost in OCR: the unramified presentation is independently visible in AM equation (3.12), AM line 1321–1326; eliminating the identity component verifies the claimed fibre equivalence. |
| 3.3 Error maps/products | EN §§2.1–2.1.2, pp. 5–6, EN line 193–195 and 219–244: both coefficient maps, composite p^r, products and the failure of general τ-multiplicativity agree. |
| 3.4 PD/completion/rational fibres | EN §2.1.1, p. 5, EN line 198–218: local PD fibres, refinement and logarithmic extension. NN equation (32), pp. 25–26, NN line 1299–1338: homotopy limit, derived reduction and filtered de Rham quotient. The roadmap retains the quotient and the rescaling; R03 only concerns its tower Check. |
| 4.1 Tate lattices | EN p. 7, line 306; NN §4.1, p. 44, line 2324; CN pp. 2,23, line 67–69 and 968–977. The EN factorial, CN inclusive endpoint convention, denominators and reduction L/p^nL agree. The p=2,r=2 coordinate is 2 and vanishes modulo 2. |
| 4.3 Exact divided comparison | EN Proposition 2.1, p. 5, line 186–188, and Theorem 2.2, p. 7, line 318–323. Fine/saturated log smoothness, canonical base log structure, ordinary coefficients and r≤p−2 are retained, as is the source's degree bound. R01 concerns the specification of a missing proof input, not this theorem's mathematical range. |
| 6.1 Relative datum | AM Definition 2.12 and Remark 2.13, pp. 11–12, AM line 451–505. Modules and adjunction/restriction comparison agree. Coherence and comparison bijectivity are not asserted on arbitrary open families. |
| 6.2 Admissibility | AM Definition 2.1, pp. 3–4, line 131–150, and Assumption 2.20, p. 15, line 627–630. The repair now separately assumes actual algebraic finiteness, Hodge conditions and horizontal comparison. The generic-divisor control shows why these cannot be inferred from Assumption 2.20 alone. |
| 6.3 Compactification | AM Setting 2.16, pp. 13–14, line 530–558. Smooth projective ambient V-schemes, total V-normal crossings, relative S-normal crossings, log integrality and Zariski type are all present. The definition makes no universal compactification-existence assertion. |
| 6.5 Affine acyclicity | AM Lemma 2.19, p. 14, line 609–620, and Remark 2.21(3), p. 15, line 639 onward. The printed lemma omits affineness, but its proof starts with an affine embedding. The roadmap correctly states the affine result; a proper elliptic curve disproves the unrestricted wording. |
| 7.1 Frobenius lifts | AM Lemma 3.8, pp. 28–29, line 1229–1287. Formal smoothness, all-level compatible lifts and Witt Frobenius give existence and uniqueness. For σ(t)=t^p+p the lift of zero equals p modulo p², including p=2. |
| 7.4 Horizontal-log/rigid comparison | AM Lemma 3.10 and (3.10)–(3.12), pp. 29–30, line 1302–1334. The pair is projective smooth over W(k), and its log structure comes only from the horizontal boundary. The source explicitly includes cup and period compatibility. The vertical-log point has different H¹ and is correctly excluded. |
| 7.5 Absolute extension value | AM pp. 30–31, line 1352–1400, with BesserI Proposition 6.3. The two filtered hypercohomology vanishings yield the connecting isomorphism. Positive connecting coordinates are (0,b); the downstream symbol factor (−1)^n is not inserted into this adapter. |

Read the additional supporting passages for the remaining layers: AM line 117–217 for coefficient/tensor/exact data; EN line 158–218 and 336–369 for divided coefficients and gluing; CN Theorem 1.1, p. 2, line 54–90 for all-weight quantifiers; HK §§3.2–3.6 and Theorem 5.1, printed pp. 243–246,262–263, HK line 698–770 and 1321–1342 for proper HK and its change law; NN Proposition 3.8, pp. 26–27, line 1341–1391, and Proposition 3.18, p. 33, line 1688–1691; AM line 587–607 for residues and line 1289–1301 for point detection. These reads support the theorem domains, but are not a proof of every proposed derived coherence API.

### Adversarial mathematics pass

Each row covers the target's defining convention, headline statement and named API together. “No change” means no counterexample found in the stated tests; it does not mean formal verification. Hypotheses such as perfectness, characteristic zero, smoothness, strictness, finiteness, Cartier type, affineness, scalar towers and truncation were checked at their actual uses. Equal-characteristic and zero coefficient-field tests are excluded by the standing mixed-characteristic DVR hypotheses; empty schemes and zero modules remain admitted.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | p=2,3; π²=p; zero modules; fibre of 2:Q→Q; identity | Strong AM Frobenius fails on the ramified trait. Fibre d²=0 and connecting class +(0,b); inverse twists cancel. | No mathematical change. |
| 1.1 FilFMIC and its four APIs | Zero/unit; Φ(e)=te on G_m; Spec(K) | Nonhorizontal datum fails; generic-only rigid realization is zero and not faithful. Finite locally free filtration yields a finite projective algebraic realization. | No change. |
| 1.2 Tensor, dual, transport | Twists −1,0,1; zero factor; identity; noncommuting lifts | Filtration jumps and exponents add; dual evaluation cancels them. Lift transport is through isocrystals. | No change. |
| 1.3 Exact structure/Ext | Split extension; differently filtered identity; zero coefficient | Strictness is stronger than underlying exactness. Abelian Ext cannot replace general exact-category Ext. | R01, R02 concern contract precision. |
| 1.4 Connection fibre | Point O(0), O(1), zero; d²(a,b) | Respectively H⁰=H¹=Q_p, only H¹=Q_p, and zero. Transversality and horizontality give the chain map. | No change. |
| 1.5 Evaluation | i=0; split extension; Φe=e−h; disconnected base | Values are identity class, zero and +(0,h); no connectedness inference is needed. Tensor signs are consistent with the bicomplex construction. | No change. |
| 1.6 Unique projections | F⁰H=0; Φe=e+ah; F⁰H≠0 split case | Unique lift gives remainder −ah. Without vanishing lifts differ; the theorem does not claim uniqueness there. | No change. |
| 2.1 Specialization | Point, empty scheme, generic-only scheme | Maps are id_K, zero and K→0. Nonproper comparison need not be invertible. | No change. |
| 2.2 Rigid fibre | r=0,1,2 at Z_p; empty special fibre | Weight zero has diagonal kernel and first-component cokernel. Positive weight has H¹=Q_p; generic-only fibre is F^rDR. | No change. |
| 2.3 Basic theory | sp=0; zero complex; G_m; identity presentation | Unramified elimination uses an identity, not sp⁻¹. φ(dlog t)=p dlog t fixes twist 1. | No change. |
| 3.1 Divisibility | r=0; p=2,r=1,n=1; p·0=p·1 in F_p | Higher-level division is necessary; r≤p−1 coefficient equality does not enlarge the exact period range. | No change. |
| 3.2 Integral fibres | Zero map A[0]→B[0]; r=0; empty scheme | H¹=B rules out ordinary-kernel replacement after étale pushforward. Both families agree at r=0. | No change. |
| 3.3 Error/product maps | r=0; multiplication p on Z/p²; odd degree at p=2 | Composite identities imply killed kernels/cokernels, not integral equivalence. No τ algebra-map or division by 2 is required. | No change. |
| 3.4 Completion | r=0; invert p^r; non-Mittag-Leffler tail tower | Quotient vanishes at r=0; ω⁻¹=p^(−r)τ rationally. Ordinary limits can miss H¹. | R03 supplies the missing concrete Check. |
| 4.1 Lattices | r=0; p=2,r=2,n=1; r=p−1 endpoints | Denominator nonzero; inclusion coordinate 2 vanishes modulo 2; endpoint lattices differ by p. | No change. |
| 4.2 Periods | Unit; r=0; horizontal boundary; nonproper X | Correct nearby-cycle target and trivial-log locus; no unrestricted global generic-fibre identification. | R01 specifies the missing site input. |
| 4.3 Exact range | p=2,r=0,1; p=3,r=1,2; undivided map | Only the divided ordinary-lattice range r≤p−2 is exact; ω cannot transfer this integrally. | R01 specifies the missing local proof input. |
| 4.4 Bounded comparison | xy=π^h, h>1; p=2; q>r; two radius choices | Base-change charts retained; only q≤r bounded. CN's dimension qualification at p=2 remains visible in the refined bound. | No change. |
| 4.5 Gluing | Empty closed part; j′ identity; weight-zero unit | Open restriction is Rj′_* of the lattice, not zero; attachment and unit are consistent. | No change. |
| 5.1 HK adapter | Rank one N=0; rank two Ne1=e0; non-Cartier thickening | Nφ=pφN and positive uniformizer exponential agree. Cartier type is necessary for invertible Frobenius. | No change. |
| 5.2 Total fibre | r=0; rank-two datum; D=E=0; nonproper interior | Bottom arrow is 1−pφ at r=0; d₁d₀=0. Enhanced pair deformation is separate from proper cohomology. | No change. |
| 5.3 h-adapter | Identity; p=2; r=0; log-smooth Cartier pair | Pair equivalence is untruncated; arithmetic/geometric periods remain truncated. | No change. |
| 6.1 Unpromoted datum | Identity, empty family, P¹, D(pt−1) | Data exist without coherence; P¹ has H²=O(−1); generic-divisor H⁰ is not algebraically finite. | F01 repair verified. |
| 6.2 Promotion | Zero/identity; c=0; nonfree graded piece; D(pt−1) | Explicit actual-module conditions reject the invalid cases; no faithfulness descent through weak completion is used. | F01 repair verified. |
| 6.3 Compactification | Constant G_m; empty horizontal divisor; colliding sections | Both normal-crossings conditions matter. Collision over t=0 violates relative normal crossings. | No change. |
| 6.4 Geometric settings | Genus 0,1 constant curves; G_m; p=2 | Ranks 1,2g,1 and G_m's O(−1) fit; algebraic finiteness is independently supplied. | No change. |
| 6.5 Acyclicity | Dagger A¹; G_m; proper elliptic curve | Integration kills affine-line H¹; dlog survives on G_m; proper elliptic H¹(O) disproves unrestricted smooth acyclicity. | No change. |
| 6.6 Residues | P¹ minus 0,∞; nonsplit quadratic boundary over Z_2; D empty | Residues (1,−1); trace-zero boundary Frobenius −2; empty boundary retains H²(U). | F02 repair verified. |
| 6.7 Extension projections | Split case; n=0; G_m,n=1 | Zero projections for split class; weight n+1 and boundary twist n are consistent. | No change. |
| 7.1 Frobenius points | a=0,1; Teichmüller points; t=p; σ(t)=t^p+p | Uniqueness and congruence p modulo p² hold; arbitrary lift t=p fails for t^p. | No change. |
| 7.2 Detection | Rank zero; constant 1; k=F_p; empty special fibre | Nullstellensatz argument requires algebraically closed k. Nonzero t^p−t vanishes at all finite Teichmüller points. | No change. |
| 7.3 Specialization | Identity point; split extension; t=p | Actual extension pullback commutes with connecting evaluation; pulled-back differential is zero, unlike a cotangent-fibre value. | No change. |
| 7.4 Absolute comparison | Point r=0,1; G_m; added vertical log | Horizontal r=1 gives H¹=Q_p; vertical semistable point gives Q_p². Hypotheses keep these producers separate. | No change. |
| 7.5 Absolute value | Curve n=1,r=2; split extension; omitted filtered vanishing | F² log complex is zero on the curve; connecting sign positive. Without the next filtered vanishing surjectivity is not guaranteed. | No change. |

### Duplication and pinned-library audit

The content manifest matches Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. GitHub object searches were followed by reading cached source at these pins; default-branch search results were not used as pin evidence. The pinned recursive trees were also inspected (10,680 Mathlib entries and 13,144 Tau Ceti entries, neither truncated).

| Object | Existing owner checked | Result |
| --- | --- | --- |
| Cochain cones and fibre signs | MathlibCone line 61,76,80,84,92; TauCetiCone line 40–57 | Imported; the roadmap specializes coordinates rather than defining a second generic cone. |
| Semilinear isocrystals | MathlibPin line 67–77,117–143 | Imported carrier; proper HK transport supplies a particular Frobenius, with no rank-one classification used as general finiteness. |
| Abelian Ext versus Quillen exact Yoneda Ext | MathlibExt line 53–61,122; TauCetiExtReview line 54–84 | Existing Ext assumes an abelian category. General exact-category extension groups remain a legitimate gap. |
| Exact-category carrier and exact functors | TauCetiExactReview line 245–267; TauCetiExactFunctorReview line 69–81 | Landed at the pin: R02 updates the supplier citation. FilFMIC's particular exact structure remains new. |
| de Rham period rings | MathlibBDeRhamReview line 55–56,79–95 | Existing completion/localization carriers are cited. Their existence alone does not supply filtration or classical fundamental sequences. |
| Syntomic algebra predicate | TauCetiSyntomic line 79–93 | A flat presentation/fibre-dimension predicate; no syntomic cohomology construction is imported from it. |
| Dagger geometry and acyclicity | `TauCetiRoadmap/AdicSpacesPartIV/README.md` F1.5,F1.7–F1.9,F1.12,F1.16; especially lines 4363–4379 | Existing dagger Theorems A/B and differential carriers are premises. Target 6.5 changes to j† on the algebraic analytification and relative continuous forms; it is not a new generic dagger Theorem B. |
| Enhanced fibres, products and towers | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` §§0.1–0.4,E2:towers.1,E5:abstract | General machinery imported by section; only specialized comparison diagrams are constructed here. |
| Tate systems and Koszul carriers | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` F.0.3,F.1,F.4.1–F.4.5; `TauCetiRoadmap/DerivedModuleAlgebra/README.md` 0.K.1 | Generic objects are imports. CN-specific group/Lie/differential comparisons are explicitly separate supplier obligations. |

Read the scope and representative structure of GrothendieckEulerForms and RigidAnalyticGeometry on the supplied main checkout. Object searches across main, completed roadmaps and board README files found no second owner for the specialized syntomic/FilFMIC targets, subject to the unavailable named supplier texts. The two open additions were read at their actual heads: ArithmeticDynamics `1921611a7a96ac19fb15c2b1291b35958c3ef0cb` and ErdosProgressionPowers `e101259371172a32b3dd13e926676ae33b6af5cd`. Their full README blobs were searched by object; neither owns a syntomic, filtered-connection, exact-category or modified-Tate-lattice interface consumed here. Board copies were not assumed identical to those heads.

### Supplier direction and gaps

All 33 `*Needs:*` lines and seven layer dependency paragraphs were read. All named target prerequisites precede their consumer. All 27 slugs agree between README and plan, and every `neededBy` backlink agrees with the prerequisite list. All gaps have a named supplier; none has supplier `none`. All eleven roadmap supplier names are eligible main/earlier owners. Six have concrete sections checked in the supplied main checkout; the remaining five owner texts are covered by declared contracts. No downstream consumer is used as a premise, and no ownership move is required.

| Gap | Precision/minimality result |
| --- | --- |
| `base-ownership` | Precise missing inventory/text request; conditional ownership reconciliation remains necessary. |
| `crystalline-inputs` | Named owner and detailed boundary; `needs` field requires R01. |
| `hyodo-kato-proper` | Proper Cartier-type cohomology, bijective φ, N and uniformizer law agree with HK line 698–770,1321–1342; distinct from enhanced pair data. |
| `arithmetic-pair-deformation` | NN line 1341–1383 supplies the stated enhanced N-triangle/section domain, including nonproper interiors. |
| `period-rings` | Retains existing BDeRham carriers and requests additional filtered/fundamental-sequence API; no duplicate carrier request found. |
| `rigid-realizations` | Detailed absolute realization/log comparison boundary; `needs` field requires R01. |
| `relative-rigid-coefficients` | Coefficient realization, lift transport and unpromoted relative pushforward are stated without finiteness. This does not duplicate the two geometric finiteness contracts. |
| `relative-rigid-projective-finiteness` | Projective smooth domain and all-degree coherent output agree with AM line 510–527. |
| `relative-rigid-log-finiteness` | Full 6.3 domain and all-degree output agree with AM line 530–585. |
| `rigid-gysin` | General curve sequence correctly retains H²(U); trace, twist and scalar extension are explicit; AM line 595–607 identifies the input. |
| `relative-hodge` | Independent algebraic hypotheses on the actual relative modules, with the two geometric domains and strict curve residue compatibility. No rigid-coherence implication is smuggled in. |
| `nearby-cycle-inputs` | Named owner, but the local calculation is unspecified; R01. |
| `local-period-pd-radius` | CN Proposition 3.3, p. 32, line 1453–1456: both radius maps and p^(6r) bound agree. |
| `local-period-annulus-entry` | CN Corollary 3.9, p. 34, line 1545–1548: pu≤v, truncation and referenced p^(2c_e+2r) bound agree. |
| `local-period-frobenius-change` | CN Proposition 3.10/Lemma 3.11, pp. 34–35, line 1569–1588: zigzag and 2^(2(d+1)) agree. |
| `local-period-lie` | CN Lemma 4.4, p. 43, line 1998–2001: p^(40r) and mod-p^n p^(80r), with truncation. |
| `local-period-lazard` | CN Proposition 4.5, pp. 43–44, line 2055–2057: correct direction and unqualified quasi-isomorphism. |
| `local-period-annulus-change` | CN Lemma 4.8, p. 45, line 2148–2150: direction and ring pair agree. |
| `local-period-phi-psi` | CN Lemma 4.10, p. 46, line 2176–2187: shifted ψ-lattice and p^(p+7) bound retained. |
| `local-period-disk-change` | CN Lemma 4.12, p. 47, line 2249–2255: shifted lattice and disk comparison agree. |
| `local-period-galois` | CN Proposition 4.13, p. 48, line 2267–2277: Artin–Schreier, tower inflation and decompletion are intermediate comparisons, not the final period theorem. |
| `local-period-approximation` | CN Lemma 5.8, pp. 55–56, line 2659–2674: the henselian restriction on the Galois-group isomorphism is retained. |
| `local-period-kpi1` | CN §5.1.4, p. 56, line 2704–2725: all locally constant constructible p^n-torsion coefficients and positive-degree killing criterion retained. |
| `local-period-etale-gaga` | CN §5.1.5, p. 57, line 2728–2746: henselian algebraic/rigid boundary-complement comparison; not proper coherent GAGA. |
| `local-period-descent` | CN Lemma 5.9, pp. 57–58, line 2748–2762: ramification-dependent p^(cre1) bound. Derived reduction can double a cohomological error exponent, consistent with the added finite-level bound. |
| `exact-yoneda` | Legitimate nonabelian exact-category extension; R01 makes the intake sentence precise and R02 identifies the existing carrier. |
| `rational-descent` | NN Proposition 3.18 and Theorem A(1),(4) identify the pair equivalence and h-descent/period inputs. The roadmap transports them instead of reproving base-owned theorems. |

The mandated gate invocation with candidate `packages/CohomologyComparisonsPartII/README.md` exited 1 before dependency analysis because that file does not exist. Its traceback ended in FileNotFoundError for that candidate; machine-specific traceback paths are omitted here. Re-running the same gate with the actual design candidate `packages/CohomologyComparisonsPartII/design/README.md` and `merge-order/ORDER.txt` exited 0 and produced exactly:

```text
candidate: CohomologyComparisonsPartII is not in the merge order yet; checked as if placed after CohomologyComparisons (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 12 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The gate's count is reported literally; it does not substitute for the separate audit of all eleven supplier entries and 27 contracts. Absence from the order is not a finding.

### Shape, data and Lean

The README has the requested title/summary, scope, conventions, supplier contracts, build paragraph, seven ordered layers, Examples/Dependencies endings, consumers and references. All nine definition-kind targets have at least three Checks (one has five); every target has hypotheses, a locator, named API and prerequisites. README statements, hypotheses, API text, Check text and gap sentences agree with the plan. JSON and TOML parse. No LaTeX delimiters, target-numbering catalogue or local machine paths occur in the design. R03 identifies a Check-quality defect that counting alone misses.

Lean elaboration: **not available**. There is no `Suggested.lean` anywhere in this design package, and the brief provides no executable Lean command. No Lean command was run; no build, elaborated signature, example proof or “sorry-only warnings” result is claimed. Consequently there are no actual sorry-valued data definitions or `set_option` commands in a package Lean file to audit. The prose mentions these restrictions as policy.

The source service added three pinned-source entries for this review: TauCetiExactReview, TauCetiExtReview and TauCetiExactFunctorReview. Bibliographic fields were added only to these reviewer-created entries. The author's fourteen entries were preserved. No source extraction was copied into the repository. Only the manifest additions and the two review deliverables were written in the package; the worklist is in the authorized scratch area.

## Not verifiable

- The original round-one review is absent at its designated path. F01–F06 above are checked against the repair report's descriptions, not an unavailable original text.
- Complete reconciliation against CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicDifferentialEquationsAndRigidCohomology and PadicHodgeTheory cannot be completed without their missing accepted sections. The named gaps remain contracts; their absence is not a finding.
- BesserI's extraction drops parts of displayed formulas at lines 709–714,734 and 1074–1078. The surrounding claims, AM equations (3.11)–(3.12), and the explicit fibre calculation support the design, but the missing printed glyphs were not visually certified from this extraction.
- BesserII remains the author's settled `uncertified` paywalled consumer-context citation. No producer target depends on it; it was not requested again.
- Lean elaboration and statable Check/example correspondence are unavailable for the reasons above.
- The finite source sample and object searches are not a formal proof of all 120 API extensions or an exhaustive semantic search of every pinned declaration. The checked positive matches, complete pinned path inventories, current open-head searches and remaining ownership conditions are recorded explicitly above.

No indispensable newly requested source remained inaccessible; no missing-reference request is pending.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e179dec4cca58efad37d65dc55513b6afbaea389", "job": "REV-DESIGN-CohomologyComparisonsPartII~2", "model": "gpt-6-astra", "worker": "chris-1"} -->
