<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1517#issuecomment-6396351517 -->
Review (codex) of 302b635

Verdict: needs_changes

1. **F01** (P2) The bounded sublattice refinement omits acyclicity

   **Location:** packages/CstConjectureForDaggerVarieties/README.md:207: “if the Newton slopes are in [0,r] and M⊗B_dR⁺⊆L⊆M⊗t⁻ʳB_dR⁺”.

   **Claim:** Those bounds suffice to choose a weakly admissible L′ between M⊗B_dR⁺ and L. The preceding paragraph states equivalences for an arbitrary pair; it does not impose acyclicity on this new conditional.

   **Witness:** Put r=1, M=Fⁿʳe, φ(e)=pe, N=0, L=B_dR⁺e. The bounds hold, but L′=L is forced and its bundle degree is 0−1=−1.

   Thus the only candidate is O(−1), with nonzero H¹, not a weakly admissible bundle. More generally any sublattice tᵐB_dR⁺e, m≥0, has degree −1−m. CN25 line 1670 explicitly assumes acyclicity; the C-lattice argument at CN25 line 1918 is inside Proposition 5.23, whose acyclicity hypothesis is at CN25 line 1913.

   **Exact repair:** Start this paragraph “For an acyclic pair (M,L) and r≥0, …”; explicitly impose the same hypothesis on the arithmetic counterpart. Add the displayed slope-one example as a negative-control Check and cite bounded-arithmetic-filtration for the arithmetic refinement in this target's Needs line.

   **Repair test:** The counterexample has acyclicity false and is excluded. With the same M but L=t⁻¹B_dR⁺e, degree is 1−1=0 and L′=L satisfies every bound. With φ(e)=e, L=t⁻¹B_dR⁺e, one can choose L′=B_dR⁺e. The general acyclic assertion is preserved.

2. **F02** (P2) A declared gap requests an existing supplier target

   **Location:** packages/CstConjectureForDaggerVarieties/README.md:86 and packages/CstConjectureForDaggerVarieties/design/plan.json, gaps entry natural-period-hom: “bounded-image vanishing of arbitrary VS natural Hom from finite torsion period modules to B_dR”.

   **Claim:** This vanishing, including its bounded-image step, is missing from VectorBundlesAndIsocrystals.

   **Witness:** TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:1751–1757, at head c380d7d, already targets arbitrary VS Hom vanishing for torsion period BC objects and explicitly includes the bounded-image argument.

   The supplier's finite-length/curvature-zero equivalence at line 1743 identifies precisely the finite torsion inputs used here. This is planned mathematical supply, not an implemented-library claim. An unproved target on a supplier roadmap is still supplied under the brief's contract.

   **Exact repair:** Remove the already-owned Hom-vanishing clause from this gap in both declarations. Cite VB3, “Curvature-zero finite-length modules” and “VS Hom vanishing from torsion period modules”, directly in the supplier subsection and the Needs lines of §§0.8–0.9. Keep the genuinely additional natural Ext¹, rank-equals-height and VS/TVS comparison requests.

   **Repair test:** For W=B_dR⁺/t and W=B_dR⁺/t², the existing supplier gives Hom_VS(W,B_dR)=0 in both cases without assuming period-linearity. The remaining Ext¹ and comparison obligations are not lost or claimed proved.

3. **F03** (P1) The general countable derived-limit input has no matching contract

   **Location:** packages/CstConjectureForDaggerVarieties/README.md:794: “countable derived-limit dimension one in LocallyAnalyticDistributions §0.0”; also lines 779 and 787.

   **Claim:** That section supplies the general Milnor sequences and R²lim=0 used before the obstruction terms have been proved to vanish.

   **Witness:** TauCetiRoadmap/LocallyAnalyticDistributions/README.md:258 defines ordinary projective limits; line 273 constructs bounded strict derived categories. Its line 442 limit theorem instead assumes Fréchet complexes, strict Roos surjectivity and finite-dimensional Mittag–Leffler cohomology.

   These are different statements. The degree-one filtered group of a dagger disc is O(D)/C, infinite-dimensional over Q_p, so the latter theorem cannot supply the required general comparison. The analytic-syntomic-descent gap promises geometric exhaustion descent, and qbc-pairs promises vanishing for BC systems; neither states the categorical Milnor/cohomological-dimension input for the filtered and pro-étale systems.

   **Exact repair:** Add a named gap with supplier LocallyAnalyticDistributions, §0.0/§0.2, and the same slug in the README and plan. Require the countable Roos construction in the strict derived category used here, its compatibility with left-heart cohomology, the Milnor short exact sequences for common-left-bounded towers, and Rᵠlim=0 for q≥2 on the applicable systems. State and prove the necessary exact-product hypotheses as part of that contract. Point §§4.1–4.3 to it. Do not replace the obstruction calculation by the supplier's theorem that already assumes the relevant vanishing conditions.

   **Repair test:** The new interface must apply to the tower of filtered disc groups F_n^(1,1)=O(D_n)/C, not just finite-dimensional cohomology. For a constant such tower, 1−shift on the product is surjective, lim is O(D)/C, and lim¹=lim²=0. It must also retain a possibly nonzero lim¹ for a general tower until §4.3 or §4.5 kills it.

4. **F04** (P1) The crystalline splitting consumes more than its declared analytic gap

   **Location:** packages/CstConjectureForDaggerVarieties/README.md:600: “the functorial log-crystalline complex and completed-unramified HK comparison in the analytic-syntomic-descent contract”.

   **Claim:** That named contract supplies the specific complex and comparison used in §2.8 and then §2.9.

   **Witness:** README:98 and the matching plan gap name HK, B_dR⁺ and syntomic complexes, but no log-crystalline complex or completed-unramified crystalline comparison. CohomologyComparisons §4.9a restricts ordinary log-crystalline model agreement to proper models.

   See TauCetiRoadmap/CohomologyComparisons/README.md:896–898, head a99732e. The missing extra structure is exactly what CN25 line 2394 and CN25 line 2400 introduce before Lemma 7.13: a chosen functorial crystalline complex, its map to the de Rham completion, and the non-Galois-equivariant comparison over the completed coefficient field. The gap's general HK/de Rham comparison does not specify these objects or maps.

   **Exact repair:** Extend the analytic-syntomic-descent needs sentence, identically in the README and plan gaps list, to include this overconvergent crystalline realization for smooth quasi-compact dagger X/C, its Frobenius, map to the filtered de Rham completion, and the strict comparison with completed-unramified HK tensored with B_cris⁺ used in CN25 §7.3. Explicitly distinguish it from ordinary completed log-crystalline cohomology of a nonproper model. Alternatively construct and compare that realization as a named target in §2.8 rather than attributing it to an unstated supplier input.

   **Repair test:** At a point, the crystalline complex gives B_cris⁺ in degree zero and its derived φ=1 eigenspace has H⁰=Q_p and higher cohomology zero. On the dagger disc the chosen overconvergent realization must have HK¹=0; it must not silently substitute completed rigid de Rham cohomology. The latter has the nonzero class of Σ_(n≥1) pⁿT^(pⁿ−1)dT, whose formal primitive Σ_(n≥1) T^(pⁿ) does not converge on the closed unit disc.

5. **F05** (P2) The geometric gap combines independent and underspecified obligations

   **Location:** packages/CstConjectureForDaggerVarieties/README.md:66 and the matching geometric-finiteness-tubes plan gap: “finite-free B_dR⁺ and HK cohomology for small geometric classes over C”.

   **Claim:** One needs sentence specifies finiteness, strict differentials, Künneth, global resolution and two tube-complement comparisons.

   **Witness:** README:370 consumes only finiteness; :666 consumes Künneth; :694 consumes proper-pair resolution; :725 and :742 consume distinct tube comparisons. These have different domains and hypotheses.

   This is a compound gap under the brief's explicit precision rule. “Small geometric classes” does not enumerate the classes in the contract; smallness itself was defined using the finite freeness being requested. The body does provide enough information to repair it without narrowing the roadmap.

   **Exact repair:** Keep geometric-finiteness-tubes for the two explicitly stated tube settings of §§3.6–3.7, spelling out their chart, codimension, radius and Čech compatibility hypotheses. Add separately named AdicSpacesPartIV contracts for: (1) finite-free period cohomology of smooth quasi-compact dagger spaces, naive interiors of smooth quasi-compact rigid spaces and smooth finite-type algebraic analytifications over C; (2) the C-valued strict-differential and finite-cohomology cup-product Künneth extension used for arbitrary small factors in §3.2; (3) resolution of a nowhere-dense closed analytic boundary in a smooth proper rigid C-space, isomorphic off the boundary. Mirror all slugs and needs in plan.json and repoint the five cited consumers.

   **Repair test:** A point has ranks (1,0,…); a countable union of points has infinite rank and is not included in the finiteness assertion. Two annuli give Künneth ranks (1,2,1). A nonreduced proper boundary is resolved via its support after discarding contained components. The tube contract retains the empty-intersection/empty-union distinction and one common radius on the required Čech intersections. None of these tests substitutes for one of the other contracts.

6. **F06** (P3) The proper qBC Check changes cohomological degree

   **Location:** packages/CstConjectureForDaggerVarieties/README.md:516: “the finite Q_p negative-curvature piece Hʳ_proét”.

   **Claim:** In §2.3, whose objects have degree i≤r, the final graded piece is described using degree r.

   **Witness:** For X=P¹_C, i=0 and r=1, the final piece is H⁰_proét(X,Q_p(1))=Q_p(1), whereas H¹_proét(X,Q_p(1))=0.

   **Exact repair:** Write “For proper X, the only potentially nonzero piece is Hⁱ_proét(X,Q_p(r)) in negative curvature; the positive and torsion pieces vanish.” Add the displayed (i,r)=(0,1) Check.

   **Repair test:** The corrected Check gives Q_p(1) in this instance and zero for i=r=1. It agrees with §2.3's h⁰_i(r) quotient in both cases.

7. **F07** (P3) The tube definition lacks its API and three Checks

   **Location:** packages/CstConjectureForDaggerVarieties/README.md:731: “define Z(ε) by all inequalities |f_j|≤ε”; Checks at lines 737–740.

   **Claim:** This gives the local tube construction used by §3.7, but there is no definition API and there are only two Check bullets, neither computing a tube.

   **Witness:** For f=T on a unit chart and ε=|π|, T=1 is outside the tube. Replacing f by πT puts T=1 inside; replacing f by a unit multiple does not.

   **Exact repair:** Add a prose API for compatibility on overlapping integral charts, invariance under integral changes of trivialization, monotonicity in ε, and the intersection/union constructions. Give at least three discriminating Check bullets computing unit rescaling, nonunit rescaling, and the zero-equation/empty-union cases. These belong in the README, with no Lean padding.

   **Repair test:** For |a|=1, {|aT|≤|π|}={|T|≤|π|}; for f=πT the same bound gives {|T|≤1}. Zero equations give the whole chart, while the empty union gives the empty tube. Their complements are respectively empty and the whole chart.

Reviewed independently on 2026-10-25. Seven findings: two P1, three P2, two P3; five blocking findings. No previous package review was supplied. No package source, roadmap, design or metadata file was edited.

## Verified sound

All 44 numbered sections were read, including their proof routes, Needs lines, APIs and Checks. The 15 seeded targets were checked against the cached legal texts; there were no author-flagged unverified locators and no unread cited mathematical work. The theorem and definition numbers and manuscript pages of those 15 targets resolve. R01 concerns a dropped hypothesis, not an unavailable source.

The review found no route-specific prime restriction, computational algorithm, copied source exposition, wholesale re-planning of a readable roadmap, sorry'd data, or set_option in this package. Its statements cover p=2 and arbitrary complete discretely valued characteristic-zero K with the stated perfect countable residue field. Equal-characteristic and nonsmooth examples are expressly excluded from the geometric comparison claims. The two unrestricted conjectures are identified as research statements rather than asserted as theorems.

There are 11 principal definition/API blocks: §§0.1, 0.2, 0.3, 0.5, 1.1, 1.2, 1.3, 2.1, 2.3, 3.1 and 4.1. Each has an API and at least three Check bullets; their mathematical tests are recomputed below. The additional tube definition in §3.7 lacks the required API and three Check bullets (R07). All six layers have Examples and Dependencies. The main-branch AdicSpacesPartII and AdicSpacesPartIV roadmaps were read as shape references. The package follows the requested prose-and-layer form. Repeated Checks headings are cosmetic, not counted as an additional finding.

The computed rows below are finite adversarial tests and source/supplier checks, not a claim to have formally proved the unimplemented theory.

### Seeded source checks

All page references in this table are to the version recorded in sources.toml. CN25's journal pagination was not substituted for the 61-page author manuscript.

| Target | Locator opened | Hypotheses and support |
|---|---|---|
| 0.1 | CN25 line 1798, §5.3.1, p.36; operators at CN25 line 1600 | Finite Fⁿʳ coefficient module, bijective semilinear φ, Nφ=pφN, embedded full B_dR⁺ lattice. No Galois datum required over C. |
| 0.4 | CN25 line 1812 and CN25 line 1821, Remark 5.14(ii)–(iii), p.36; CN25 line 1670, Lemma 5.4, p.33; CN25 line 1918, p.38 | The equivalences and lattice inclusion direction match. The bounded refinement additionally needs acyclicity: R01. |
| 0.7 | CN25 line 1870, Proposition 5.18, pp.37–38; CN25 line 939, Proposition 3.27(i), p.20 | Slopes in [0,r]; natural VS Hom; dual coefficient module. Rank equality is supplied by the specific Hom theorem, not Euler height alone. |
| 0.9 | CN25 line 1913, Proposition 5.23, pp.38–39; CN25 line 1941 | k≥2r, full lattice bounds and acyclicity match. The proof gives the stronger tʳ kernel bound used in the README; the cokernel bound is t²ʳ. |
| 1.1 | CN25 line 2263 and CN25 line 2294, §§7.1.1,7.2.1, pp.46–47; CN25 line 1954, Proposition 6.1, pp.39–40 | F is cohomology of a filtered complex; Fil is its image. Stable-range pro-étale comparison and derived invariants are retained. |
| 1.5 | CN25 line 2098, Theorem 6.14, p.43 | Smooth dagger Stein or affinoid, r≥0, strict maps, Fréchet/LB topology, p⁻ʳ normalization and φ=p^(r−1) kernel all match. |
| 2.4 | CN25 line 2354, Corollary 7.9(ii), p.47; CN25 line 2367, Proposition 7.10, p.48 | Smallness, i≤r and both adjacent H¹ failure terms retained. Difference sign makes the displayed composite zero. |
| 2.5 | CN25 line 2376, Proposition 7.10 proof, p.48; CN25 line 676 and CN25 line 683, equation (3.10)/Remark 3.11, p.15 | Additive signed height and strict negative height for nonzero bundle H¹ are correct. Torsion at another point is explicitly excluded from that strict claim. |
| 3.2 | CN25 line 2466 and CN25 line 2473, Theorem 8.1(a), p.50 | Both factors small and acyclic in all degrees; cup product yields lattice containment and a torsion cokernel, not filtered equality. |
| 3.4 | CN25 line 2501, Theorem 8.1(c), p.51 | Smooth proper ambient space and arbitrary closed analytic boundary. Discarding whole components handles Z=X before resolution. |
| 3.7 | CN25 line 2557, Proposition 8.4, p.52; GK04 line 499, Proposition 3.7, pp.14–16; BKV22 line 1176, §4, p.26 | Projective complete intersection, codimension c and sufficiently small radius. BKV supplies the integral-trivialization tube definition. The union proof requires the explicitly requested extra Čech compatibility; full-intersection smoothness is not silently used for every partial intersection. |
| 4.2 | CN25 line 2611 and CN25 line 2615, Remark 8.9(ii)–(iii), p.53 | Milnor and obstruction sequences match, including the corrected global index and stagewise sequence. The mathematical statement is supported; its categorical supplier is R03. |
| 5.1 | CN25 line 2746, Lemma 9.5, pp.55–56; CN25 line 2753 | Continuous Galois-equivariant maps and density are essential; smooth Hom is the union over finite extensions. |
| 5.4 | CN25 line 2821 and CN25 line 2829, Theorem 9.8/proof, pp.57–58 | Small acyclic X/C, natural TVS Hom, dense torsion-Pair presentation, and extended dual modules match. The theorem does not assert recovery of the omitted operators. |
| 5.5 | CN25 line 1888 and CN25 line 1908, Remarks 5.19/5.21, p.38; CN25 line 2859, Remark 9.9(ii), p.58 | Affinoid, r=i, crystalline untwisting, positive equality and completed coefficient extension match the intended target. The additional positivity proof is expressly a supplier obligation, not inferred from the sandwich. |

### Pinned library audit and Lean outcome

Content main is 6ef1bbddc593bfbbf46976c005c598e0535c9426. The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following declarations were opened at those pins.

| Declaration and repository-relative file | Actual content and test |
|---|---|
| BDeRhamPlus, Mathlib/RingTheory/Perfectoid/BDeRham.lean:75 | Theta-kernel adic completion after inverting p. Binders at :51 require a commutative ring, prime p, p nonunit and p-adic completeness. At R=F_p, the localization target is zero, the kernel is the unit ideal and the completion is zero. No geometric complete-DVR or topological-field theorem is supplied here. |
| BDeRham, Mathlib/RingTheory/Perfectoid/BDeRham.lean:88 | Localization at completed images of generators of the theta kernel. At R=F_p it is again zero; no nontrivial-field instance follows from the carrier. |
| WittVector.Isocrystal, Mathlib/RingTheory/WittVector/Isocrystal.lean:113 | A module with a Frobenius-semilinear equivalence. The two structure fields are module and equivalence, not finiteness, N, filtration or Galois action. An infinite direct sum admits the structure but is not finite-dimensional. README :112 points to the closing line of its docstring, immediately before the declaration. |
| WittVector.isocrystal_classification, same file :180 | Algebraically closed characteristic-p residue field and finrank=1. The conclusion is a standard one-dimensional block indexed by an integer. Rank two is outside this signature. |
| Module.Free, Mathlib/LinearAlgebra/FreeModule/Basic.lean:43 | Nonempty choice of an indexed basis. Infinite direct sums are free; finite generation is not included. |
| Module.Finite, Mathlib/RingTheory/Finiteness/Defs.lean:121 | The top submodule is finitely generated. Z/2 over Z is finite but not free. |
| ModuleCat, Mathlib/Algebra/Category/ModuleCat/Basic.lean:56 | Bundled additive commutative group and module; morphisms are linear maps. It supplies neither topology nor finite rank. |
| CategoryTheory.BicartesianSq, Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/BicartesianSq.lean:56 | Extends both IsPullback and IsPushout. It does not supply analytic corners or a strict left heart. The split diagonal/difference square has both properties. |
| TauCeti.AdicSpace, TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243; isAdic at :206 | Full subcategory of sheafy locally affinoid pre-adic objects. Smoothness, dagger structure, properness and analytic cohomology are not bundled in it. |
| TauCeti.FarguesFontaine.spaY, TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean:116 | The valuation-spectrum subset where p and the Teichmüller parameter are nonvanishing. If the parameter is zero, the subset is empty. |
| TauCeti.FarguesFontaine.frobeniusHomeomorph, same file :218 | Pullback along Witt Frobenius on that subset, with perfectness and the specified adic topology. It is not a coherent-bundle Frobenius functor. |
| TauCeti.FarguesFontaine.spaX, TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:56 | Orbit quotient by the cyclic Frobenius action, with quotient topology. No structure sheaf, modified coherent bundle or bundle cohomology is constructed by this declaration. |

Object searches covered both pinned source trees, including period rings, isocrystals, monodromy, dagger varieties, Hyodo–Kato realizations, sympathetic algebras and Banach–Colmez objects. The broad Bst hits in Mathlib/Data/Ordmap are binary-search-tree invariants, not semistable periods. Native categorical and algebraic objects do not supply any of the missing analytic headlines.

The prescribed lake env lean command was run from the content checkout on packages/CstConjectureForDaggerVarieties/Suggested.lean. It exited 0 with no output and no warnings. No build or cache command was needed. The file has exactly one import, Mathlib, a single module docstring and the required empty namespace. There are zero named declarations, zero sorry bodies and zero examples. Consequently the requested elaborated-signature comparison has zero signatures, and the one-tactic padding probe has zero targets. No stand-in or omitted statable analytic headline was found.

The 33 headline results named in the docstring are: §§0.4,0.6–0.9; §§1.4–1.6; §§2.2–2.9; §§3.2–3.7; §§4.2–4.7; §§5.1–5.5. In mathematical terms these are the acyclicity/period-Hom calculations, elementary and geometric fundamental diagrams, defect/height/qBC equivalences, crystalline and syntomic splittings, geometric slope classes, inverse-limit and proper-factor theorems, torsion vanishing and both recovery theorems with the positive crystalline refinement. Each names its missing carrier in the docstring. Section 5.6 is the scope/forgetful consequence, not a substitute theorem; the proper comparison theorems are imported from their owner. The computed convention checks alone are not headline results and correctly have no Lean padding declarations.

### Ownership, supply and gap audit

The open-roadmap index and board package index were read before any absence conclusion. Searches by object used roadmaps grep in both README and Lean files; broad truncated output was narrowed to C_st, qBC, sympathetic and acyclic filtered objects. Supplied citations were then read with roadmaps show. The five supplier heads below are new-roadmap heads, not progress revisions of a roadmap already on main.

| Supplier | Resolved file/sections and scope |
|---|---|
| AdicSpacesPartII, main | TauCetiRoadmap/AdicSpacesPartII/README.md:2759, R0.5 completed Banach tensor; R0.10–R0.17 morphisms/differentials/smoothness; R1 analytification and rigid/adic comparison. Its tensor is separated completion with complete Hausdorff targets. |
| AdicSpacesPartIV, main | TauCetiRoadmap/AdicSpacesPartIV/README.md:4238, F1.7 dagger/coherent/strict neighbourhoods; :4515, F1.8 and :4608 analytification; :4662, F1.9 de Rham; :5594, F1.11 finiteness; :5880 Künneth; :5897 F1.12 log pairs; :6460 F1.16 tubes. The discrete-base, quasi-compact, MWF/RES restrictions are real and are not enough for all C-valued applications. |
| PadicHodgeTheory, head 4c4f1e8 | TauCetiRoadmap/PadicHodgeTheory/README.md, §§0.2–0.5,3.4–3.7,5.2. The semistable coordinate paragraph at :283 gives N(u)=−1 and N(u_π)=−1/e. Section 3.4 uses t_N−t_H as filtered degree and the opposite destabilizing slope. The C-lattice datum is the package's additional object, not a second arithmetic filtered module. |
| VectorBundlesAndIsocrystals, head c380d7d | TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:228–324, VB0; :568, isocrystal-to-bundle; :600, slope cohomology; :670, untilt completions; :771, HN; :1116 and :1126, VB2 classification/Hom/Ext; :1431, sympathetic VS; :1456, finite BC; :1607, Le Bras; :1617, HN invariants; :1687, Euler height; :1725–1818, period/curvature calculus. Sign tests agree. R02 is the duplicated gap clause. |
| LocallyAnalyticDistributions, head 3a4526a | TauCetiRoadmap/LocallyAnalyticDistributions/README.md:246, §0.0 and :398, §0.2. Non-Hausdorff versus Hausdorff categories, strict hearts, completed tensors, density and functional analysis resolve. Compact-type duality has coefficient restrictions. General derived-limit attribution fails as R03 explains. |
| CohomologyComparisons, head a99732e | TauCetiRoadmap/CohomologyComparisons/README.md:870, §4.8 algebraic K comparison; :884, §4.9 dual Hom; :894, §4.9a analytic HK; :910 and :922, §§4.10–4.11 proper rigid comparison over K/C with induced filtration. Proper comparison is imported, not replanned. The dagger/TVS extensions are genuine additions; the crystalline splitting interface still needs R04. |
| ClassicalAdicEtaleCohomology, head dfcb6b7 | TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:278, §1.3 and :373, §1.4 coefficient dictionary; :3891, §8.4 proper base change/projection; :4683, §9.7 pairings/traces. The finite-coefficient ranges do not silently imply the requested perfect Z_p proper-factor input; that is declared separately. |
| CohomologyComparisonsPartII, head 8858e49 | TauCetiRoadmap/CohomologyComparisonsPartII/README.md:3–19 separates classical rigid/log-syntomic producers, h-realizations and relative filtered Frobenius connections. These do not own the present analytic qBC defect, slope-class or geometric TVS recovery theorems. No dependency on this later roadmap is added. |

All 11 declared slugs occur in both the README's supplier subsections and the plan's gaps list with matching supplier and needs; none has supplier none. The gap slugs are period-lattice-gluing, qbc-pairs, natural-period-hom, bounded-arithmetic-filtration, analytic-syntomic-descent, geometric-log-periods, geometric-finiteness-tubes, proper-rigid-integral-etale, compact-extension-duality, positive-crystalline-hom and galois-period-hom-vanishing.

The gluing, qBC extension, arithmetic acyclic reconstruction, positive crystalline positivity, Galois torsion vanishing, C-valued logarithmic comparison, integral proper-factor comparison and continuous period-linear splitting are legitimate additional contracts, rather than findings merely because they are not implemented. R02 removes an already-owned clause; R03–R04 make consumed but unstated inputs explicit; R05 separates independent geometric obligations. No claimed ownership against an unread board head is asserted.

The README and Suggested.lean at board heads AnalyticNumberTheory 310e834, ArithmeticStatistics 357e723, AutomorphicCongruences b047dd3, KatoEulerSystems 5fb6ef4 and LogicAndDefinabilityInNumberTheory 3062436 were read and searched by the same objects. No competing analytic qBC or C-lattice recovery construction was found. Their ordinary arithmetic/period vocabulary is not evidence of ownership of these constructions. The unread board heads are listed below.

All 44 Needs lines and six layer dependency paragraphs were read. The local build order is acyclic: Layer 0 precedes the fundamental square, Layer 2 uses its comparison triangle, Layer 3 avoids the splitting branch, Layer 4 uses stagewise geometric comparison, and Layer 5 uses the bounded period-Hom and qBC results. Sections 2.8–2.9 and 5.5 retain their separate extra obligations. The mechanical dependency output was:

    moved: CstConjectureForDaggerVarieties moved in the merge order from #8 to #204, right after its last supplier CohomologyComparisons (AdicSpacesPartIV, ClassicalAdicEtaleCohomology, LocallyAnalyticDistributions, PadicHodgeTheory, VectorBundlesAndIsocrystals also came after it); checked as moved (the worker moves it there when it submits)
    depcheck: 50 roadmaps, 582 edges, 0 problem(s)

There was no UPWARD or CYCLE line. The permitted moved line is not a finding; the merge-order file was not changed.

### Adversarial computations: conventions and every numbered target

In these tables R=B_dR⁺, B=B_dR and U₁=(B_cris⁺)^(φ=p). A “formal defect test” substitutes bundles into the exact-sequence calculation; it does not assert existence of a geometric variety with those defects. A dash in the change column means the tested assertion needs no change. The 63 rows here and 55 API rows below give actual values, objects or maps on both sides (118 computed rows in total).

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Standing coefficient hypotheses, :23 | Q₂, Q₃, Q₂(√2); equal-characteristic F₂((z)); C[ε]/ε² | First three: char=0 and p≠0. Fourth: char=2, excluded. Thickening: ε≠0, ε²=0 and Ω has dε≠0, unlike the smooth point's Ω=0. | Correct domain exclusions; no good-prime restriction. | — |
| Nφ=pφN and horizontal sign, :25,:35 | φ=diag(1,p), Ne₁=e₀; p=2,3 | Nφ(e₁)=pe₀=pφN(e₁). N(e₁+ue₀)=0; N(e₁−ue₀)=2e₀, nonzero also over Q₂. | Correct. | — |
| Tensor/dual operator conventions | The same rank-two module and its dual | N(e₁⊗e₁)=e₀⊗e₁+e₁⊗e₀. N(e₀∨)=−e₁∨, φ(e₁∨)=p⁻¹e₁∨; Nφ(e₀∨)=−e₁∨=pφN(e₀∨). | Correct; zero N and unsigned dual fail. | — |
| Degree and dual filtration, :25,:36–37 | Newton-zero line, Hodge jumps −1,0,1 | L=tR,R,t⁻¹R; bundle degrees −1,0,1. Dual of jump 1 has jump −1; at j=−1 annihilator of Fil² is the whole dual, at j=0 annihilator of Fil¹ is zero. | Correct sign and 1−j index. | — |
| Difference map and shifts, :31,:37–38 | Diagonal Q_p→Q_p²; K→K with d=1 or 0 | (1,1)↦1−1=0; wrong sum gives 2. Identity complex has H⁰=H¹=0; zero differential has H⁰=H¹=K, with K[−1] in degree 1. | Correct. | — |
| Signed height, :31,:39 | Q_p, R/t, zero | Heights 1,0,0; BC dimensions 0,1,0 respectively. Ordinary Q_p-dimension of C is infinite. | Correct distinction. | — |
| Galois contragredient, :41 | S₃ on Q_p³; g=(12), h=(23); cyclic transposition | gh(e₁)=e₂, hg(e₁)=e₃. Correct dual sends e₁∨ to e₂∨ under gh; using f∘gh sends it to e₃∨. A transposition squared is identity in either representation. | Nonabelian test fixes order. | — |
| Ramification scale, :42 | π²=2; unramified Q₃ | u=2u_π gives N(u_π)=−1/2, N(u)=−1. For Q₃, e=1 and N(u)=−1. | Agrees with PadicHodgeTheory §0.5. | — |
| VS/TVS and imported Pair conventions, :27–29 | Constant Q_p, V₁, Pair (0,C), identity Pair (C,C) | Evaluations are Q_p,C,C,0 respectively. Identity Pair's cokernel is zero; (0,C) has height zero. A Q_p-linear functional C→Q_p with f(1)=1 is a C-point map, whereas natural VS Hom(C,B)=0. | Natural functors cannot be replaced by C-point maps. | — |
| 0.1 object | M=0; trivial line with tᵐR; zero lattice in a line | Ranks 0 and 1; tᵐR[1/t]=B for every m∈Z; 0[1/t]=0≠B. | Full embedded lattice, not abstract rank, determines object. | — |
| 0.2 gluing and sections | Newton-zero line with L=R,tR,t⁻¹R; zero | Bundles O,O(−1),O(1),0; H⁰=Q_p,0,U₁,0. Completed lattices are exactly R,tR,t⁻¹R,0. | Correct. | — |
| 0.3 predicates | Same three lines and zero; O(1)⊗O(1) | Acyclic truth values true,false,true,true; weak admissibility true,false,false,true. Tensor is O(2), slope 2≥0. | Both directions distinguished. | — |
| 0.4 H¹/surjectivity/sublattice equivalence | O(1),O,O(−1),0 | H¹=0,0,C/Q_p,0; quotient maps onto precisely first, second and fourth. Admissible sublattice R⊂t⁻¹R exists; none inside tR. | Correct equivalences. | — |
| 0.4 finite sections and evaluations | O versus O(−1) | O has V=Q_p and surjective fundamental map; Q_p⊗B_st=B_st and Q_p⊗R=R. O(−1) has V=0 finite but nonzero cokernel C/Q_p. | Finite-dimensionality alone is insufficient; exactness retained. | — |
| 0.4 bounded refinement | φ(e)=pe, r=1, L=R | Newton slope 1∈[0,1], R⊆R⊆t⁻¹R; only L′=R, with degree −1 rather than 0. With L=t⁻¹R the degree becomes 0. | Fails as written. | R01 |
| 0.5 bounded eigenspaces/kernels | Trivial line: r=0,L=R; r=1,L=R; r=0,L=t⁻¹R | First: X=V=Q_p, quotient 0. Second: X=U₁, V=Q_pt, quotient C, ht(X)=1. Third: upper bound t⁰L⊆R is false. | Bounds and positive period ring are essential. | — |
| 0.5 denominator levels and Tate twist | Trivial line, L=R,r=1; k=0,1 | Kernel at both levels is Q_pt. At k=0 quotient R/tR=C; at k=1 quotient t⁻¹R/tR has length 2. t·Q_p=Q_pt and g(t)=χ(g)t. | Same kernel; no equality of Galois actions asserted. | — |
| 0.6 generation | Slope-zero line,r=0; slope-one line,r=1; slope-one line,r=0 | Eigenspaces Q_pe,Q_pe,0; R-spans Re,Re,0. Last case is outside [0,r] and fails to span Re. For U₁, θ(U₁)=C and a preimage of 1 generates modulo t. | Correct bound and nonzero reduction. | — |
| 0.7 eigenspace Hom | M=0; trivial line,r=0; slope-one line,r=1 | Hom(0,B)=0=0∨⊗B. Hom(Q_p,B)=B and Hom(Q_pe,B)=Be∨, both rank 1; likewise with B_st. | Correct dual and rank. | — |
| 0.8 acyclic-kernel Hom | Trivial line,L=R,r=1; L=t⁻¹R,r=1 | Kernels Q_pt and U₁; both natural period Hom modules have rank 1 and are B or B_st. Torsion quotient is C in first case, 0 in second. | Correct Hom/Ext route; supplier clause duplicated. | R02 |
| 0.9 truncated reconstruction | Trivial line,L=R,r=1,k=2; r=0,k=1; r=k=0 | In basis t of Q_pt, evaluation is multiplication by t on R/t²: kernel tR/t², cokernel R/t, each killed by t. At r=0,k=1 it is identity on C; at k=0 both modules are 0. | tʳ kernel/t²ʳ cokernel bounds hold; finite-level iso would be false. | — |
| 1.1 filtered groups and image | Point at r=0,1; disc at (r,i)=(1,1); i=−1 | Point: (F,B,Fil,A)=(tʳR,R,tʳR,0). Disc: (O(D)/C,0,0,O(D)/C), with [T]≠0 and dT≠0. Negative degree: all 0. | F and Fil differ. | — |
| 1.2 smallness/rank | Point; closed dagger disc; countable disjoint points | Point/disc de Rham ranks (1,0,…); disc pro-étale H¹=O(D)/C≠0. Union has B⁰=∏R, containing arbitrarily many independent coordinate vectors, so rank is not finite. | Smallness is not pro-étale finite dimension. | — |
| 1.3 fundamental square | Point,i=r=0; dense diagonal c₀→c₀ | Point sequence 0→Q_p→Q_p⊕R→R→0: (q,f)↦q−f has kernel {(q,q)} and is onto via (0,−f). Diagonal x_n↦pⁿx_n has separated cokernel 0; y_n=pⁿ is outside its range since its inverse would be (1,1,…)∉c₀. Its left-heart defect is nonzero. | Difference sign and category matter. | — |
| 1.4 twist invariance | Point,i=0,r=0→1 | H:Q_p→Q_pt; F:R→tR; X quotient U₁/tQ_p=C; B quotient R/tR=C, bottom map identity. Exactness on both levels agrees. | Correct stable range. | — |
| 1.4 induction | Zero complex; formal two-degree obstruction | Zero preceding degree has cokernel 0 and therefore next left kernel 0. A preceding cokernel C/Q_p instead contributes kernel C/Q_p, even if the current right map is onto. | Requires all preceding surjectivities, as stated. | — |
| 1.5 Stein/affinoid rows | Point,r=0; disc,r=1; annulus,r=1 | Point rows Q_p→Q_p and C→C; φ=p⁻¹ kernel 0. Disc: top H¹=O/C, bottom closed forms=dO, [T]↦dT, HK¹=0. Annulus: HK¹ has φ=p, so X¹¹=Q_p and β-kernel at φ=1 is 0; dlog T survives. | Correct r−1, sign and topology range. | — |
| 1.6 elementary bicartesian cases | Proper point; disc,i=r=1 | Point horizontal maps injective, A=0. Disc horizontal maps to X=B=0 are surjective with kernel O(D)/C on both rows. | Both distinct behaviors give bicartesian squares. | — |
| 2.1 failure bundles and twist | Point i=0,r=0,1; zero HK | (φ,L)=(1,R) and (p⁻¹,tR) both give O, hence (h⁰,h¹)=(Q_p,0). Lattice-only twist gives O(−1), (0,C/Q_p). Zero HK gives (0,0). | Simultaneous twist is essential. | — |
| 2.2 kernel/cokernel descriptions | Point,i=r=0; disc,i=r=1 | Point reduced map Q_p⊕R→R has kernel Q_p,cokernel 0; preceding h¹=0. Disc reduced map 0→0 has both 0; H→F is identity, kernel 0. | Correct. | — |
| 2.3 qBC graded pieces | Point; disc,i=r=1; P¹,i=0,r=1 | Triples (0,0,Q_p), (0,O(D)/C,0), (0,0,Q_p(1)); heights 1,0,1. P¹ H¹=0 does not describe its degree-zero triple. | The theorem is correct; the proper Check misindexes. | R06 |
| 2.4 two defects | Point/disc; formal h¹_(i−1)=C/Q_p, h¹_i=0 | Geometric tests give exact diagonal sequence or identity O/C→O/C. Formal test gives a nonzero left kernel C/Q_p although right cokernel is 0. | Both defects needed for the iff. | — |
| 2.5 height identity | Point; disc; formal degree-r bundle O(−1), previous bundle 0 | 1=1+0+0; 0=0+0+0; formal case 0=1+0−1. O(−1) Euler height is 0−(−1)=1. | Correct plus signs for negative heights. | — |
| 2.5 strictness restriction | H¹(O(−1)); torsion sheaf at x≠∞ | First height −1, nonzero. Second H⁰ has height 0 despite positive curvature, and rank 0. | Correctly excludes false general positive-curvature strictness. | — |
| 2.6 degreewise equivalence | Point,r=0; disc,r=1; formal negative degree-r bundle | First two have defects (0,0), height equality 1=1 or 0=0, and no positive piece. Formal negative bundle gives adjacent syntomic positive piece C/Q_p and deficit −1. | Adjacent syntomic term detects right failure; no out-of-range pro-étale identification. | — |
| 2.7 all-degree equivalence | Point and disc; formal defect confined to degree 2 | Point/disc: all h¹=0 and heights equal dimensions in every degree. A formal h¹_2=C/Q_p makes both the degree-2 height test and degree-3 positive-piece test fail; degree 0 alone still passes. | All-degree quantification retained. | — |
| 2.8 crystalline splitting | Point,r=0,1; two-term identity complex | Derived eigenspace cohomology is Q_p or U₁ in degree 0 only. A complex K→K with d=1 contributes 0, not K⊕K[−1]. | Formula agrees with source; required realization interface missing. | R04 |
| 2.9 noncanonical syntomic splitting | Point; disc,r=1; split short extension R→R²→R | Decompositions Q_p and (0,O/C,0), respectively. Sections of projection (x,y)↦y include y↦(0,y) and y↦(y,y), giving distinct complements. | Noncanonical nature is necessary; duality gap retained. | — |
| 3.1 nonnegative de Rham slopes | Point, disc, countable points | Bundles O and 0 give slope lists {0} and empty, hence acyclicity. Infinite union has infinitely generated B⁰, so predicate false despite each component's truth. | Smallness is indispensable. | — |
| 3.2 product slopes/cup map | Point×point; annulus×annulus; zero factor | Cohomology ranks 1; (1,2,1), from (1,1)·(1,1); 0 for an empty factor. Two distinct H¹ generators give nonzero wedge in H². H¹ of torsion cokernel at ∞ is 0. | Correct product and modification argument. | — |
| 3.3 algebraic analytification | A¹, G_m, P¹, empty | De Rham ranks (1,0), (1,1), (1,0,1), all zero respectively. G_m's degree-one Newton/Hodge numbers are (1,1); the admissible algebraic bundle is O. Lattice enlargement preserves H¹=0. | Includes nonproper examples without identifying entire pro-étale groups with algebraic étale ones. | — |
| 3.4 almost proper | P¹ with Z=∅, {∞}, P¹, doubled {∞} | U=P¹,A¹,∅,A¹; ranks (1,0,1),(1,0),(0,…),(1,0). Boundary multiplicity 2 does not change U. | Whole components and nonreduced boundary handled correctly. | — |
| 3.5 discrepancy complexes | Proper empty-boundary pair; P¹ minus ∞ in degree 1 | Proper case both maps are identities, both cones 0. Open affine line has algebraic H¹_ét=0 and analytic H¹_proét=O(A¹)/C; naive filtered H¹ contributes the same O(A¹)/C while the log group is 0. | Correct two-term derived comparison. | — |
| 3.6 semistable tubes | P¹ with ∞ section; m=s empty intersection and union | A¹ and dagger disc both have ranks (1,0). Empty intersection removes all: ranks 0. Empty union removes nothing: proper generic-fibre cohomology retained. | Correct unfiltered comparison and empty-set conventions. | — |
| 3.6 filtration negative control | f(T)=(1−πT)⁻¹ on closed dagger disc | Coefficients πⁿ give convergence for 1<ρ<abs(π)⁻¹; at T=π⁻¹ denominator is 0 on A¹. Thus gr⁰ restriction is not onto, although H⁰_dR on both sides is K and H¹=0. | Correctly rejects the source's filtered-complex overclaim. | — |
| 3.7 tube definition | One local equation f; unit a and nonunit π; c=0 | abs(af)≤ε equals abs(f)≤ε when abs(a)=1. abs(πf)≤ε equals abs(f)≤ε/abs(π), a different radius. Zero equations give the whole X; empty union is empty. | Integral trivializations and radius data determine the tube; API/Checks are incomplete. | R07 |
| 3.7 small-radius comparison/union | P¹ with ∞; cuspidal cubic plus transverse line avoiding cusp in P² | First comparison has ranks (1,0) on both complements. Second full intersection can be three reduced points (smooth dim 0), while the cubic's cusp has tangent dimension 2, not 1. | No inference that all partial intersections are smooth; extra Čech contract is necessary. | R05 clarifies contract |
| 4.1 exhaustion | Constant point; increasing discs; subsequence 2n | Point limits X=Q_p,B=R and lim¹=0. Disc F_n^(1,1)=O(D_n)/C≠0 while Fbar_n=0. Cofinal limit still has the same compatible sequences and cohomology. | Correct image/group distinction and cofinality. | R03 for categorical supply |
| 4.2 Milnor sequences | Constant point/disc; algebraic tail tower V_n=⊕_(j≥n)Q_p | Constant tower: lim=original group, lim¹=0. Tail tower: lim=0, lim¹=(∏Q_p)/(⊕Q_p), with class (1,1,…)≠0. Milnor inserts that class one degree later. | Obstruction cannot be deleted universally. | R03 |
| 4.2 inverse-limit obstruction | Constant point comparison; hypothetical nonzero lim¹H | Constant: 0→Q_p→Q_p⊕R→R→0, both lim¹ terms 0. In general sequence identifies cokernel of lim(X⊕F)→lim B with kernel of lim¹H→lim¹F; it need not be 0. | Correct conditional conclusion. | R03 |
| 4.3 de Rham criterion | Constant disc,i=r=1; point | Disc DR⁰=C-valued functions, A=O/C, H/A=0; all constant-system lim¹ values are 0. Point A=0,H/A=Q_p, again lim¹=0. Quotient by A has finite-BC height 0 or 1. | Correct quotient direction and use of BC, not arbitrary TVS vanishing. | R03 |
| 4.4 integral/rational Künneth | Y=point; Y=T=P¹; T countably many points | Point tensor is identity. P¹ product ranks (1,0,2,0,1), from two classes in degree 2. With Y=point and T infinite discrete, H⁰(T,Z_p)=∏Z_p is not perfect. | Proper-factor perfection is correctly assigned to Y. | — |
| 4.5 proper×Stein limits | Y=point or P¹; open disc exhaustion | Stein comparison gives lim¹H(S_n)=0. For P¹ the only proper coefficients are Q_p in degree 0 and Q_p(−1) in degree 2, so each lim¹ is a finite sum of zeros. | Correct finite-factor use; no termwise completion claim. | — |
| 4.6 pro-étale Künneth | P¹×open disc; point×S | With V=H¹(S,Q_p), groups in degrees 0–3 are Q_p,V,Q_p(−1),V(−1), on both sides. Point product gives Hⁱ(S) identically. | Correct twist and degree shifts. | — |
| 4.6 nonproper negative control | Two open discs | Their degree-one closed forms on the product include exact mixed forms d(TS)=S dT+T dS, absent from the direct sum of pullbacks of one-variable forms. Proposed degree-one tensor sum misses these classes in the pro-étale differential contribution. | Correctly disclaims general nonproper tensor formula. | — |
| 4.7 fundamental diagram for proper×Stein | Point×disc,i=r=1; P¹×disc,i=r=2 | First: H=F=O/C, X=B=0, so sequence is identity. Second: proper degree-two contribution has X=U₁, Fil=tR, kernel Q_pt and quotient R via the difference map. | Correct stable-range comparison; no smallness inference. | R03 affects proof supply |
| 5.1 differential Hom | Disc,i=1; i=0; finite L/K | Differential term O(D)/K contains [T]≠0. For every simple tensor [T]⊗c, a continuous G_L-map has value 0 by Hom_G_L(C,B)=0. Dense completion remains 0. i=0 term is 0. | Correct continuity and finite-extension quantifiers. | — |
| 5.2 arithmetic torsion kernel | Point; disc,i=r=1; truncations tʲR/tᵏR | A=0 for point; A=O(D)/C≠0 for disc. Galois period Hom is 0 in both; j=0,k=1 gives C, j=−1,k=1 has length 2, and both have Hom_G_L(−,B)=0. | Correct; not a finite-BC claim about the whole A. | — |
| 5.3 arithmetic recovery | Point; P¹ in degree 2; disc in degree 1 | Point Hom values Fⁿʳ,K, each rank 1. P¹ H²=Q_p(−1) gives dual φ=p⁻¹ and jump −1. Disc Hom=0=dual HK¹=dual H¹_dR. | Correct duals, Tate sign and arithmetic structure. | — |
| 5.4 geometric recovery | Constant Q_p^d, d=0,1,2; disc H¹ | Hom_TVS(Q_p^d,B_st)=B_st^d and Hom_TVS(Q_p^d,B)=B^d, ranks 0,1,2. Disc maps vanish and both target dual modules are 0. | Correct functorial input and extended-module output. | — |
| 5.5 positive crystalline refinement | Point,i=0; annulus,i=1; outer-bound test | Point Hom= B_cris⁺. Annulus HK line has φ=p, X_cris¹=Q_p e, so Hom=B_cris⁺e∨; Fil^(1+k)B=tᵏB. t⁻¹∈t⁻¹B_cris⁺ but t⁻¹∉B_cris⁺. | Equality fits examples; sandwich alone does not prove it. | Retain declared positivity gap |
| 5.6 information retained | Proper rank-one constant functor; rank 0; Tate/good elliptic H¹ | Extended modules have ranks 1,0,2 respectively. Both elliptic cases have height 2, but monodromy ranks 1 and 0. | Rank does not encode omitted arithmetic structure. | — |
| Worked examples, :985–991 | Trivial line triple; genus g=0,1; disc [T]; geometric series | Degrees (1,0,−1); proper ranks (1,2g,1) give (1,0,1)/(1,2,1); exp(−uN)(e₁+ue₀)=e₁; [T]↦dT≠0; pole at π⁻¹. | Agrees with corresponding target rows. | — |

### Adversarial computations: definition APIs

These rows separately cover the numbered API bullets in their README order. Functoriality is tested on identity, zero and multiplication by p where applicable, so a constant-zero purported construction cannot pass solely through the zero-object cases.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| 0.1 API 1, construction | Zero; trivial rank-one lattice R | Output ranks 0 and 1, with localization 0 and B. | Correct. | — |
| 0.1 API 2, map determined by M | Identity and multiplication by p on trivial line | Period maps send e to e and pe; distinct since p≠1. Equal coefficient maps yield identical scalar extensions. | Correct extensionality. | — |
| 0.1 API 3, lattice localization | tR and zero in B | tR[1/t]=B; zero localizes to 0. | Correct full-lattice requirement. | — |
| 0.1 API 4, tensor and dual | L=tR,L′=t⁻¹R | Tensor lattice R; dual of tR is t⁻¹R. Tensor Newton exponents a,b add to a+b; dual exponent −a. | Correct. | — |
| 0.1 API 5, arithmetic convolution | Jump 1 and jump 0 lines | Fil⁰(D⊗B)=t⁻¹R and R, respectively. A fixed R lattice for both would erase the jump. | Correct. | — |
| 0.1 API 6, extension of arrows | Scalar maps p then p | Both composite extensions multiply by p²; identity by 1. | Correct. | — |
| 0.2 API 1, punctured restriction | Trivial pair with L=R or tR | In both cases punctured sections are B_e; lattice changes only the ∞ restriction. | Correct. | — |
| 0.2 API 2, completed restriction | Same pair | Completed stalks R and tR; both localize to B but are distinct embedded modules. | Correct. | — |
| 0.2 API 3, induced bundle maps | Identity and multiplication by p | Maps on each restriction are 1 and p; two p maps compose to p². | Correct. | — |
| 0.2 API 4, section criterion | Trivial line,L=R,tR | Invariants satisfying lattice condition are B_e∩R=Q_p and B_e∩tR=0. | Correct equalizer. | — |
| 0.2 API 5, tensor bundles | tR⊗t⁻¹R | Gluing gives O; tensor O(−1)⊗O(1)=O. | Correct. | — |
| 0.3 API 1, slope predicate | O(−1),O,O(1),0 | Slope lists {−1},{0},{1},∅ give acyclicity false,true,true,true. | Correct. | — |
| 0.3 API 2, weak admissibility implies acyclic | O² and O(1) | O² has both predicates true; O(1) only acyclic true. | Correct one-way implication. | — |
| 0.3 API 3, isomorphism invariance | Rebasis line by p | Embedded lattice as submodule is unchanged because p is a unit in R; degree unchanged. | Correct. | — |
| 0.3 API 4, tensor acyclicity | O(1)⊗O(2); zero factor | O(3), slope 3; zero with empty slopes. Both H¹=0. | Correct. | — |
| 0.3 API 5, arithmetic transport | Newton/Hodge (0,0),(0,1),(1,0) | Bundle degrees 0,1,−1; admissible/acyclic status matches corrected destabilizing sign, not the raw t_N−t_H degree. | Correct sign dictionary. | — |
| 0.5 API 1, kernel membership | t in trivial r=1,L=R; a∈U₁ with θ(a)=1 | N(t)=0,φ(t)=pt,t∈tR, so t is in V. a is in X but not V since θ(a)=1≠0. | Correct. | — |
| 0.5 API 2, arrow functoriality | Zero,1,p on trivial M | X and V maps are 0,1,p; composition p² agrees. | Correct. | — |
| 0.5 API 3, kernel inclusion | Q_pt⊂U₁⊂R | t maps to the nonzero t in R; no extra kernel. | Correct target and injectivity. | — |
| 0.5 API 4, acyclic surjection | Trivial r=1,L=R | θ:U₁→C sends a chosen lift a to 1 and t to 0; kernel Q_pt. | Correct. | — |
| 0.5 API 5, twist map | Trivial period line | 1↦t, φ(t)=pt, g(t)=χ(g)t; twist has weight +1 instead of 0. | Correct qualified identification. | — |
| 1.1 API 1, triangle maps | Disc,r=1 | DR⁰ contains T; connecting map sends T to [T]∈F¹¹=O/C; subsequent map to B¹=0 kills it. | Correct connecting direction. | — |
| 1.1 API 2, quotient image | Point; disc | tʳR/0=tʳR=Filʳ⁰; (O/C)/(O/C)=0=Fil¹¹. | Correct image topology requirement. | — |
| 1.1 API 3, decreasing filtration | Point,r=0,1,2 | R⊃tR⊃t²R; all localize to B, with distinct filtered steps. | Correct. | — |
| 1.1 API 4, pullback | Disc T↦pT and T↦p²T | [T]↦p[T], dT↦p dT; compositions give p² on both. | Correct naturality. | — |
| 1.1 API 5, arithmetic scalar extension | Point over K; dagger disc H¹ | K⊗_K R=R; 0⊗_K R=0. No choice of C→R is used. | Correct scope. | — |
| 1.2 API 1, free and finite | Point and union of points | B⁰=R has basis {1}; ∏R contains independent e₀,…,e_n for every n. | Correct separate finiteness. | — |
| 1.2 API 2, rank comparisons | Point; annulus degrees 0,1; disc degree 1 | Period/HK/de Rham ranks (1,1,1); annulus (1,1,1) in each degree; disc (0,0,0) in degree 1. | Correct. | — |
| 1.2 API 3, invariance | T↦aT on annulus,a≠0 | Pullback dlog T=dlog T; ranks unchanged at 1 in degrees 0,1. | Correct. | — |
| 1.2 API 4, quasi-compact examples | Dagger disc and two disjoint points | Ranks (1,0,…) and (2,0,…), finite free. | Correct conditional supplier input. | R05 makes domain explicit |
| 1.2 API 5, algebraic analytification | A¹ and G_m | Ranks (1,0) and (1,1); nonproperness does not imply infinite de Rham rank. | Correct. | R05 makes domain explicit |
| 1.3 API 1, commutative square | Point | Both routes send q∈Q_p to q∈R. | Correct. | — |
| 1.3 API 2, complex sign | Point,q=1 | v(u(1))=1−1=0; wrong sign gives 2. | Correct. | — |
| 1.3 API 3, pullback of square | Two points→point | Cohomology sends q to (q,q); both de Rham routes give the same pair in R². | Correct. | — |
| 1.3 API 4, bicartesian iff exact | Point; replace upper-left by 0 in its square | Actual square has kernel Q_p and source Q_p. Replacement has same kernel Q_p but source 0, so neither exactness nor pullback holds. | Both directions discriminated. | — |
| 1.3 API 5, classical corners | Disc degree 1; nonclassical diagonal complex | Disc X=B=0 are classical. Complex [c₀→c₀], x_n↦pⁿx_n, has a nonzero left-heart object despite separated ordinary cokernel 0. | No automatic classical claim for H,F. | — |
| 2.1 API 1, H⁰ | O,O(−1),zero | Q_p,0,0. | Correct. | — |
| 2.1 API 2, H¹ | Same | 0,C/Q_p,0, with heights 0,−1,0. | Correct. | — |
| 2.1 API 3, maps | Scalar p on O | H⁰ map q↦pq; H¹=0. Composition gives p². | Correct. | — |
| 2.1 API 4, degree −1 | Point at i=0 | h⁰_−1=h¹_−1=0; no spurious Q_p summand. | Correct. | — |
| 2.1 API 5, simultaneous twist | Point,r=1 | Total φ on t is p⁻¹·p=1; t∈tR. Lattice-only twist has degree −1. | Correct in the stated stable range. | — |
| 2.3 API 1, first subobject | Point/disc; formal preceding O(−1) | First subobject 0,0,C/Q_p respectively. | Correct index and direction. | — |
| 2.3 API 2, torsion middle | Point; disc,r=1 | A=0; A=O/C with tA=0. Both equal torsion submodule of F. | Correct. | — |
| 2.3 API 3, final quotient | Point; disc | H/A=Q_p; H/A=0. | Correct. | — |
| 2.3 API 4, functorial filtration | Disc T↦pT | Middle piece [T]↦p[T]; both finite pieces remain 0. Point identity fixes Q_p. | Correct. | — |
| 2.3 API 5, finite BC compatibility | Q_p,C,Q_p⊕C | Graded triples (0,0,Q_p),(0,C,0),(0,C,Q_p); heights 1,0,1. | Correct additive restriction. | — |
| 3.1 API 1, smallness implication | Countably many points | Arbitrarily many independent B⁰ coordinates force failure of smallness and of the predicate. | Correct. | — |
| 3.1 API 2, all-degree acyclicity | P¹ | Untwisted modified bundles O in degrees 0,2 and 0 in degree 1; all H¹ vanish. | Correct. | — |
| 3.1 API 3, cohomology isomorphism | Annulus coordinate inversion | dlog(T⁻¹)=−dlog T, an invertible map; slopes remain 0 for the admissible pair. | Correct; map need not preserve chosen generator. | — |
| 3.1 API 4, comparison equivalence | Point/disc; formal negative defect | First two: acyclic and bicartesian true. Formal O(−1) gives nonzero H¹ and nonzero right defect, both false. | Correct. | — |
| 3.1 API 5, height conclusion | P¹; two annuli | Heights/ranks (1,0,1) and (1,2,1). | Correct. | — |
| 4.1 API 1, restriction | Disc tower and class T | Restrictions send T to T and dT to dT; the maps to B¹=0 coincide. | Correct. | — |
| 4.1 API 2, Fbar quotient | Disc at r=i=1 | F=A=O/C, so Fbar=0; deleting A before quotienting would lose [T]≠0. | Correct. | — |
| 4.1 API 3, cofinality | Coordinate truncations Kⁿ and even subsequence K^(2n) | Both limits are K^N, containing (1,1,…); not c₀. Constant-complex cohomology unchanged. | Correct. | R03 for derived interface |
| 4.1 API 4, ordinary limits of X,B | Constant point; disjoint finite-point exhaustion | First limits Q_p,R. Second limits ∏Q_p,∏R, with coordinatewise restrictions, not direct sums. | Correct specified descent conclusion. | R03 for categorical supply |

## Not verifiable

All three mathematical sources in the manifest were readable. No missing-reference request was needed. This review verifies the recorded CN5 author manuscript, GK04 arXiv v1 and BKV22 arXiv v2; it does not certify that journal versions have identical pagination or contain the same misprints. The manifest already states the version boundaries.

The board package index names the following README heads. Read-only requests at those exact heads returned HTTP 404. For PadicHodgeTheoryPartII and VectorBundlesAndIsocrystalsPartII, the indexed branch references also returned HTTP 404. Their ownership, supplier overlap and any declarations in Suggested.lean could not be checked; this is not a claim that those roadmaps do not exist. The five readable indexed board packages were checked in both README.md and Suggested.lean at their indexed heads. The reviewed package itself declares no Lean names.

| Board package | Indexed head | Reason |
|---|---|---|
| ArithmeticLocallySymmetricSpacesPartII | 84a41ac | HTTP 404 at indexed head |
| CompletedCohomologyAndLocalGlobalCompatibilityPartII | 948c94c | HTTP 404 at indexed head |
| CrystallineCohomologyPartII | 84ea77e | HTTP 404 at indexed head |
| EndoscopicTransferAndUnitaryTraceComparisonPartII | 80a66cc | HTTP 404 at indexed head |
| HigherHidaAndColemanTheory | da88512 | HTTP 404 at indexed head |
| LawrenceVenkateshMethod | 9ee7ac3 | HTTP 404 at indexed head |
| OrdinaryAutomorphicFormsAndModularityLiftingPartII | 7e88c38 | HTTP 404 at indexed head |
| PELModuliPartII | d4bb48d | HTTP 404 at indexed head |
| PadicHodgeTheoryPartII | 6502997 | HTTP 404 at indexed head and branch |
| PadicLocalLanglandsForGL2QpPartII | 3e0777d | HTTP 404 at indexed head |
| RealSurfacePeriodIndex | 875bca4 | HTTP 404 at indexed head |
| SchemeAndStackFoundationsPartII | accb0a0 | HTTP 404 at indexed head |
| ShimuraVarietiesPartII | 57dc0a4 | HTTP 404 at indexed head |
| VStackSheavesAndLisseCategoriesPartII | 0987ba7 | HTTP 404 at indexed head |
| VectorBundlesAndIsocrystalsPartII | b58d862 | HTTP 404 at indexed head and branch |

The verdict is needs changes on the independently witnessed package defects, rather than acceptance conditional on an uncompleted ownership audit. Declared but unproved supplier contracts are mathematical obligations, not unread sources; they are audited above and are not otherwise treated as findings.

## Source issues

These issues concern the versions actually read. The package already avoids many of them. No published correction was verified. The arithmetic sign, lattice-direction, diagonal-sign, tube-filtration, height and proper-factor counterexamples are computed above; the smaller indexing corrections can be checked at the indicated source lines.

- **Error** in CN25 at Lemma 3.16, printed pp.16–17, CN25 line 773: the source says every sub-BC without a V₁ subobject satisfies a strict dimension-height inequality; it should be restricted to nonzero objects, since the zero object gives 0<0; affects a stated result.
- **Misprint** in CN25 at Lemma 3.16 proof, printed p.17, CN25 line 791: the source says the final inequality is h<d; it should be h>d, as required earlier in the same proof; affects the proof.
- **Gap** in CN25 at Lemma 3.16 proof, printed p.17, CN25 line 778: the source says decomposition reduces every nonzero input to U_λ with λ>0; it should be accompanied by the finite Q_p-summand case, where dimension is zero and height is positive; affects the proof.
- **Error** in CN25 at Corollary 3.20(b), printed p.18, CN25 line 868: the source says negative curvature implies strictly positive height; it should be restricted to nonzero objects, since zero injects into a period module but has height zero; affects a stated result.
- **Error** in CN25 at Corollary 3.21(iv), printed p.18, CN25 line 875: the source says a height-zero quotient of nonnegative curvature has curvature zero; it should be torsion with arbitrary support, with curvature zero only when supported at infinity; affects a stated result.
- **Misprint** in CN25 at §5.1.2 and Lemma 5.3, printed pp.32–33, CN25 line 1633 and CN25 line 1657: the source says the degree is Newton minus Hodge while shrinking a filtration decreases it; it should be Hodge minus Newton for the ensuing nonnegative-slope convention, or all slope directions must be reversed consistently; affects a stated result.
- **Misprint** in CN25 at Lemma 5.4 proof, printed p.33, CN25 line 1675: the source says the unchanged filtration steps have indices different from zero; it should be indices different from the chosen positive index i₀; affects the proof.
- **Misprint** in CN25 at Remark 5.19, printed p.38, CN25 line 1888: the source says the exponential from Lemma 5.17 also gives the reverse untwisting map; it should be its inverse exponential, so their composition is identity on a nonzero monodromy block; affects a stated result.
- **Misprint** in CN25 at Proposition 5.20, printed p.38, CN25 line 1898: the source says the kernel map starts from unrestricted B_st invariants and lands in a positive de Rham quotient; it should be positive B_st⁺ invariants, as in the following exact sequence; affects a stated result.
- **Misprint** in CN25 at Proposition 5.20 proof, printed p.38, CN25 line 1906: the source says the weakly admissible lattice contains the original lattice; it should be contained in the original lattice, as demonstrated by the trivial line with lattice t⁻¹B_dR⁺; affects the proof.
- **Misprint** in CN25 at Proposition 5.23 proof diagram, printed p.39, CN25 line 1928: the source says the left evaluation source is M∨ tensored with tʳB_dR⁺/tᵏ; it should be M∨ tensored with B_dR⁺/tᵏ, matching the composite and kernel calculation immediately below; affects the proof.
- **Error** in CN25 at Remark 6.13(i), printed p.42, CN25 line 2089: the source says bare B_dR⁺ cohomology is the modification lattice recovering untwisted étale cohomology; it should be F⁰ of localized filtered cohomology, as used in the preceding proof; affects a stated result.
- **Misprint** in CN25 at Corollary 6.15, equation (6.17), printed p.43, CN25 line 2127: the source says the diagonal pair of comparison maps is followed by their sum; it should be followed by their difference, giving zero rather than two at the degree-zero point; affects a stated result.
- **Misprint** in CN25 at Corollary 6.19, diagram (6.20), printed p.43, CN25 line 2137: the source says the upper-left corner is étale cohomology for dagger Stein and affinoid spaces; it should be pro-étale cohomology, retaining the differential-form contribution from Theorem 6.14; affects a stated result.
- **Misprint** in CN25 at Lemma 7.13 proof, printed p.49, CN25 line 2415: the source says a single basis term paired with its correction supplies the mapping-fiber cocycle; it should be the full lifted Frobenius-orbit sum from the preceding identity, paired with that correction, with j indexed by J_i; affects the proof.
- **Misprint** in CN25 at Remark 7.14, printed p.49, CN25 line 2423: the source says the scalar degree is h_i while the chosen block is indexed by j; it should be h_j, the length of that block; affects the proof.
- **Gap** in CN25 at Proposition 7.15 proof, printed p.49, CN25 line 2441: the source says compact-type reflexivity supplies enough continuous period-linear forms extending forms on the finite free submodule; it should be justified by an extension theorem with strict duality and the actual coefficient hypotheses; affects the proof.
- **Error** in CN25 at Theorem 8.1(c) proof, printed p.51, CN25 line 2525: the source says the filtered logarithmic cohomology group has finite B_dR⁺ length; it should be a finite free lattice, already B_dR⁺ at the point in degree and filtration zero; affects the proof.
- **Error** in CN25 at Proposition 8.3 and its application, printed pp.51–52, CN25 line 2544 and CN25 line 2552: the source says tube-complement restriction is a filtered quasi-isomorphism; it should be an unfiltered quasi-isomorphism compatible with a filtration map; gr⁰ fails on the projective-line/disc example; affects a stated result.
- **Gap** in CN25 at Proposition 8.4 proof, printed p.52, CN25 line 2565: the source says smooth scheme-theoretic intersection of c hypersurfaces gives a local product with c disc directions; it should be accompanied by codimension c; repeating one smooth hypersurface gives codimension one, not two; affects the proof.
- **Gap** in CN25 at Proposition 8.4 union proof, printed p.52, CN25 line 2569: the source says the intersection case and Čech descent suffice for the union assertion; it should be accompanied by comparisons on every required partial intersection and a common radius; a smooth total intersection does not imply smooth partial intersections; affects the proof.
- **Misprint** in CN25 at §8.2.1, equation (8.7), printed p.52, CN25 line 2595: the source says the global sequence contains a filtered group indexed by a finite exhaustion stage n; it should be the global filtered group without n; affects a stated result.
- **Misprint** in CN25 at Remark 8.9(iii), printed p.53, CN25 line 2615: the source says the inverse-limit sequence comes from equation (6.11); it should be equation (8.8), the stagewise sequence assumed in this argument; affects the proof.
- **Error** in CN25 at Lemma 8.13 proof, printed p.54, CN25 line 2693: the source says the cohomology over arbitrary T of the proper-factor complex is perfect; it should be the proper-factor complex itself that is perfect; T equal to infinitely many points gives an infinite product; affects the proof.
- **Misprint** in CN25 at Theorem 9.8 proof, printed p.57, CN25 line 2827: the source says X_C in formulas for a space already defined over C; it should be X with no additional base change; affects nothing.
- **Gap** in CN25 at Remark 9.9(ii), printed p.58, CN25 line 2865: the source says nonnegative de Rham valuation of every Frobenius iterate gives the exact positive crystalline lattice; it should be justified by the precise positive-crystalline intersection criterion, distinguishing B_cris⁺ from B_max⁺ and preserving coefficient extension; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "302b635b3c3364020198006a1088fa3c3be26251", "job": "REV-PKG-CstConjectureForDaggerVarieties", "model": "gpt-6-astra", "worker": "chris-8"} -->
