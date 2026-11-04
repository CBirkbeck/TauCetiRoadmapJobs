<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/971#issuecomment-6392874798 -->
Review (codex) of 7de7f5a

Verdict: needs_changes

1. **F01** (P1) Formal proper mapping over O_C has no supplier contract

   **Location.** packages/ClassicalAdicEtaleCohomologyPartII/README.md:175: “Apply coherent formal proper mapping”; line 185 cites “AdicSpacesPartIII §§F0.6–F0.8”.

   **Claim.** The route to §0.2 uses coherent proper higher direct images for topologically finitely presented formal schemes over the nondiscrete valuation ring O_C, as though the cited formal-coherence sections provided them.

   **Witness.** TauCetiRoadmap/AdicSpacesPartIII/README.md:2731 restricts coherent formal modules to locally Noetherian formal schemes. AC line 4990 states the separate proper-mapping theorem used at AC line 5058. O_C is not Noetherian.

   **Exact repair.** Add one gap, for example gap:valuation-formal-proper-mapping, owned by AdicSpacesPartIII, section R2.2–R2.8, to the top-level gaps in packages/ClassicalAdicEtaleCohomologyPartII/design/plan.json and to that supplier's subsection of the README. Its needs sentence should be:

   “For a complete rank-one valuation ring O_K, a topologically finitely presented O_K-algebra A, and a proper topologically finitely presented morphism f:𝔜→Spf A of admissible formal schemes, every coherent O_𝔜-module F has coherent A-modules Hⁱ(𝔜,F), and the canonical associated-sheaf map Hⁱ(𝔜,F)^Δ→Rⁱf_*F is an isomorphism for every i≥0.”

   Cite AC Theorem 5.1.5, pp. 116–117, AC line 4990. Cite this gap in §0.2's route and Needs line. Keep the existing almost proper-mapping target, which is the additional approximation argument of AC Theorem 5.1.6. Do not impose Noetherianity on O_C.

   **Repair test.** Take C=ℂ_p and the formal completion of ℙ¹ over O_C. Its unit has H⁰=O_C and H¹=0; O/p has H⁰=O_C/p≠0 and H¹=0. The proposed contract covers both. The cited Noetherian theorem covers neither base. Generic-fibre Kiehl theory only gives C and 0 respectively, so it cannot recover these integral modules. The maximal ideal of O_C is not finitely generated: a finite set has a least positive valuation, whereas p has roots of arbitrarily small positive valuation. These are a useful negative-control Check for the supplier interface.

   The search also covered AdicSpacesPartIII's admissible-model sections and rigid Kiehl theorem, the pinned libraries, main and indexed new-roadmap heads, and the board packages. R2 supplies the formal carriers and coherence calculus, while R3.6 is the generic-fibre theorem. None supplies this formal proper-mapping statement. The existing valuation-upper-shriek contract concerns schemes and is not a formal proper-mapping contract.

One new P1 finding: an undeclared valuation-ring formal proper-mapping prerequisite. All thirteen findings from the preceding review are repaired. The declared thirteen supplier gaps are valid contracts, not findings. No false headline, duplicate owned target, upward dependency, cycle, computational algorithm, copied source passage, or Lean padding was found.

## Verified sound

The review covered all 54 numbered targets, their API assertions and 169 Checks, all 54 Needs lines, seven layer Examples/Dependencies blocks, conventions, worked examples, thirteen declared gaps, the sixteen Lean headline explanations, metadata and the source manifest. Each target has at least three Checks. Main-branch shape references were SchemeAndStackFoundations, EnhancedDerivedSheaves and AdicSpacesPartIII.

### Earlier findings, checked before the new pass

All quotations in this table are from the repaired package. Unchanged mathematics was inherited only from rows of the preceding review that contained computed values; changed passages and all fifteen newly sampled targets were checked afresh. The table below restates the concrete computations so this report is self-contained.

| Earlier finding | Repaired passage and location | Status and verification |
| --- | --- | --- |
| F01: duplicated relative proof | README:11, “Scholze–Weinstein Theorem 10.5.1, with the §10.5 module estimates of its proof, is owned by HodgeTateAndCanonicalSubgroups §7.6” | Repaired. Layer 6 and its unused contracts are absent; the supplier owns the theorem and proof. Layer 7 uses that supplier directly. |
| F02: Z printed as ℤ | README:1134, “D_cᵇ(Z,ℤ/n)”; README:1220, “Hᵐ_ét(Z,ℤ/n)” | Repaired. Two points give H⁰=Λ², not Λ. Coefficient arguments remain ℤ/n. |
| F03: one open for every map | README:72, “For each proper map f:X→Y”; README:1168 uses a finite intersection | Repaired. For {a}→D, S_f=D∖{a}; finitely many points give their finite complement. No open uniform over all a is asserted. |
| F04: compound model/duality gaps | README:56–88, “gap:reduced-model-cofinality”, “gap:refined-formal-algebraization”, “gap:finite-formal-quotients”, “gap:polystable-uniformization-zigzag”, “gap:valuation-upper-shriek”, “gap:valuation-duality-amplitude”, “gap:valuation-canonical-reflexivity” | Repaired. Seven individual contracts, with algebraic closedness and geometric reducedness where required. README:90, 201 and 279 import compactifications from AdicCoefficientsAndComparisons L2. |
| F05: geometric descent assigned to an abstract supplier | README:100, “gap:connective-totalization-truncation”; README:102 names DiamondEtaleCohomology | Repaired. Only the i+1 truncation remains a gap. Geometric descent is imported with the coefficient and cutoff restrictions. |
| F06: singular toric charts | README:1187, “proper hypercover”; README:114, “a smooth C-affinoid with an étale map to a torus” | Repaired. Resolve before using toric charts, on both sides of field extension. A rational nodal curve has smooth normalization and point terms, with ranks 1,1,1 in degrees 0,1,2. |
| F07: three wrong locators | README:189, “AC Lemma 5.5.6 and Theorem 5.5.7”; README:983, “§§9.5, 9.7”; README:1168, “§10.5” | Repaired. AC line 5537 and AC line 5569; the parent's trace and local-constancy sections were opened at its head. |
| F08: garbled contract substitutions | README:921, “polystable-uniformization-zigzag contract”; README:1152 distinguishes “finite-branched-covers” | Repaired. The altered-uniformization, algebraization and extension routes now name their actual inputs. The self-supplying sentence is absent. |
| F09: duplicate/blanket Needs | README:1044 cites “ClassicalAdicEtaleCohomology §§8.4, 9.5, 9.7” | Repaired. Re-read all 54 Needs lines; the previously repeated inputs were removed and the parent blocks narrowed. R01 is a different, previously unexamined generality defect. |
| F10: differentials mistaken for targets | README:680, “[O_C →(ζ_{pᵐ}−1) O_C]”; README:1079, “[ℤ_p →p ℤ_p]” | Repaired, including Layer 5 Examples. H¹ is O_C/(ζ−1) and ℤ/p respectively, whereas maps onto the image ideals have H¹=0. |
| F11: incorrect missing carrier | Suggested.lean:14, “it needs the integral projection trace tr_m⁺, defined through the character decomposition (a theorem)” | Repaired. AdicCompletion's ring and completed-base module instances exist; the trace-dependent theorem cannot be replaced by an unmarked abstract isomorphism. |
| F12: integral trace comparison | README:1048 names “IntegralSmoothProperTrace” and “smooth proper formal model” | Repaired. At finite levels both send a degree-one class to 1; their inverse limits agree. The extension here removes the smooth-model requirement. |
| F13: stratification quantifiers | README:1112, “one locally finite stratification”; README:1150, “equivalent to the existence of a finite such stratification on every affinoid open” | Repaired. BH's global definition is used first, and locality proves the affinoid characterization. Infinite disjoint points with degree-j coefficients remain locally bounded. |

The repair report leaves the supplier's policy on generic smoothness to its maintainer. That is settled: the precise declared contract is not re-raised as a defect here. Searches through the rest of the package found no remaining instance of F01–F13's patterns.

### Seeded source verification

All fifteen requested locators were read in the supplied legal cached texts, including the relevant proof steps where the roadmap uses them. No additional author-flagged unverified locator was found. The sources are cited in the versions recorded in sources.toml; no published-version numbering was substituted.

| Target | Locator read | Hypotheses, map and normalization verified |
| --- | --- | --- |
| 1.4 | Z Lemmas 2.5.3–2.5.4, Theorem 2.5.5, pp. 22–24; Z line 970, Z line 987, Z line 1032 | Dense formal open and reduced residue fibre for reflexive Hartogs; separated, smooth pure-d generic fibre and geometrically reduced residue fibre for canonical reflexivity. |
| 1.5 | Z Lemmas 2.6.1–2.6.2, pp. 24–25; Z line 1060, Z line 1081 | Proper morphisms, same pure dimension; underived bottom trace from compatible reduction counits; composition has the stated direction. |
| 1.6 | Z Theorem 2.7.1, Lemmas 2.7.3 and 2.7.5, Remark 2.7.4, pp. 25–27; Z line 1125, Z line 1142, Z line 1174 | Algebraically closed base for reduced-model localization. Bottom comparison is canonical; the roadmap does not overstate canonicity of the whole complex. |
| 2.2 | Z Lemmas 3.2.3–3.2.4, Definition 3.2.5, Remarks 3.2.6–3.2.8, pp. 31–33; Z line 1373, Z line 1389, Z line 1417 | Cotangent construction on admissible models, positive degrees, exterior cup powers, flat functoriality and étale restriction. |
| 2.5 | Z Theorem 3.4.12, Definitions 3.4.13–3.4.14, Remark 3.4.15, pp. 38–44; Z line 1938, Z line 1957, Z line 2024, Z line 2078 | Torus character normalization and finite étale trace square. The roadmap explicitly resolves equation (3.7)'s scalar discrepancy using (3.6) and the inverse-Scholze normalization. |
| 2.6 | Z Theorem 3.5.2, Definitions 3.5.3 and 3.5.5, Lemma 3.5.4, pp. 44–45; Z line 2093, Z line 2113, Z line 2142 | Nice model, integral uniqueness, smooth-locus gluing, integral shift −d and mod-p full-dualizing-complex shift −2d. |
| 2.7 | Z Definition 3.6.1, Example 3.6.2, p. 46; Z line 2168, Z line 2172 | Both generic finiteness and almost amplitude [0,d] are required; finite maps and proper rig-isomorphisms are examples. |
| 4.2 | Z Lemma 4.4.3, p. 67; Z line 3227 | Proper rig-isomorphism between nice models, pushed-forward adjoint and almost proper duality. |
| 4.3 | Z Definition 4.4.2, p. 67; Z line 3219 | Finite group, formal quotient and generic G-torsor; no division by the group order. FQ line 750, FQ line 760 and FQ line 1349 supply the quotient-existence hypotheses. |
| 4.7 | Z Theorems 4.4.1 and 4.4.24, pp. 66–67, 74–75; Z line 3188, Z line 3587 | Finite quotient/rig-isomorphism zigzag and niceness. The missing niceness hypothesis in the source's abbreviated restatement is correctly retained. |
| 5.1 | Z Definitions 5.2.1 and 5.2.3, Lemma 5.2.2, pp. 75–76; Z line 3640, Z line 3648, Z line 3664 | Smooth proper pure dimension; common refinement gives model independence; target is shifted −2d. |
| 5.3 | Z Theorem 5.4.2, Lemma 5.4.3, pp. 78–79; Z line 3805, Z line 3822 | Connectedness for top trace being an isomorphism; almost detection for finite-dimensional vector spaces. Disconnected trace is addition. |
| 5.8 | Z Theorem 5.5.4, p. 82; Z line 3968 | Smooth proper geometric fibre, perfect integral complexes, Galois action and derived dual. The target shift omitted in print is restored. |
| 7.1 | BH Definition 3.1, Warning 3.2, pp. 14–15; BH line 594, BH line 600, BH line 611 | Global locally finite Zariski stratification, local boundedness, and distinction from Huber constructibility. |
| 7.3 | BH Theorem 3.5, Propositions 3.6–3.7 and proof, pp. 15–17; BH line 647, BH line 653, BH line 672, BH line 708 | Characteristic zero, locality, qcqs finite-cover generators, affinoid algebraization and extension of branched covers. |

Additional changed-contract checks: Z line 507 (valuation upper shriek), Z line 635 (amplitude), Z line 755 (canonical reflexivity), Z line 4217 (refined algebraization); AC line 5504 and AC line 5569 (almost duality), AC line 7390 and AC line 7404 (general nearby coherence); BH line 567 (per-map smooth open), BH line 780 (finite-degree hyperdescent), BH line 1102 (field extension); Han line 134 (branched covers), Han line 196 and Han line 226 (relative comparison), Han line 801 (quasi-excellent direct images). U Theorems 1.3–1.4, pp. 4–5, U line 143 and U line 169, were read in full, closing that limitation of the earlier review. FQ Theorems 3.3.4 and 4.4.1, pp. 16–17 and 29–30, were checked for the newly separated quotient contract.

### Pinned declarations and headline audit

The content main commit was b41e47bc34e30def0db01d84cc92062ed72c6e68. The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| Declaration opened at the pin | File and line | Actual content and boundary |
| --- | --- | --- |
| LinearMap.IsPerfPair | Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39 | Both induced maps are bijective. Finite generation and projectivity are not fields of this class. |
| Representation.invariants | Mathlib/RepresentationTheory/Invariants.lean:73 | Fixed by every group element; no finiteness or commutativity of G. |
| Scheme.smallEtaleTopology | Mathlib/AlgebraicGeometry/Sites/Etale.lean:50 | The carrier is a scheme. This is not a rigid or adic étale site. |
| Representation.exists_common_fixed_vector_of_isPGroup; Representation.invariants_ne_bot_of_isPGroup | TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean:151 and :158 | Field, ExpChar, finite-dimensional and nontrivial representation, IsPGroup. The group itself need not be finite. |
| TauCeti.AdicSpace | TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243 | Sheafy locally affinoid full subcategory. It supplies neither a rigid étale site nor almost coefficients. |
| CommRing (AdicCompletion I R); AdicCompletion.module | Mathlib/RingTheory/AdicCompletion/Algebra.lean:97 and :324 | Genuine ring and module bodies exist. A projection trace through a proved character decomposition does not follow from these instances. |

Object searches in both pinned trees covered formal schemes, almost modules, perfectoid spaces, rigid étale/pro-étale sites, Faltings traces and polystable duality. Generic schemes, module sheaves, derived categories and completions do not fill the missing geometric interfaces.

These are the sixteen README headlines, each explicitly named in the module docstring:

| Headline | README targets | Missing interface at the pins |
| --- | --- | --- |
| Formal Hartogs and canonical traces | 1.1–1.7 | Admissible formal schemes, canonical sheaves and generic-fibre comparisons |
| Integral Faltings trace and compatibility | 2.3–2.9 | Formal specialization, completed pro-étale coefficients, almost dualizing objects |
| Product-polystable root-algebra derived duality | 3.1–3.7 | The integral projection trace specified by the character decomposition theorem |
| Polystable local duality | 3.8–3.10 | Ringed formal/pro-étale sites and Faltings pairing |
| Wild quotient descent and local almost duality | 4.2–4.7 | Formal quotients and equivariant almost nearby cycles |
| Global almost duality | 5.2 | Almost pro-étale cohomology and global trace |
| Geometric mod-p duality | 5.4 | Rigid étale cup product, trace and twisted Galois action |
| Finite local-system mod-p duality | 5.5 | Rigid local systems and their cohomology |
| Finite p-power derived duality | 5.6 | Rigid derived sections and coefficient traces |
| Integral derived duality | 5.8 | Completed integral pro-étale sections and compatible trace |
| Rational p-adic duality | 5.9 | Rational pro-étale sections and Tate line |
| Affinoid algebraization and finite-cover generators | 7.2–7.3 | Rigid analytification/site comparison and Zariski-constructible subcategories |
| Constructible proper pushforward | 7.4 | Rigid direct image on locally bounded complexes |
| Proper field-extension invariance | 7.5 | Rigid scalar extension and its cohomology comparison map |
| All-torsion proper base change | 7.6 | Rigid cartesian squares and derived exchange |
| Constant cohomology sheaf on the big smooth site | 7.7 | Big smooth rigid étale site and proper direct-image sheaf |

No statable headline was omitted. In particular, an abstract root-module self-duality would omit the specified trace and be an unacceptable stand-in. The characteristic-p computation is a supporting calculation, not a replacement headline.

The prescribed lake env lean elaboration of packages/ClassicalAdicEtaleCohomologyPartII/Suggested.lean, from the content checkout, exited 0 with no diagnostics. There is exactly one import Mathlib, an appropriate module docstring and namespace, and zero declarations. Consequently the mechanical declaration/binder inventory is empty: there are zero types to compare using #check @name and zero sorried theorems to test with the one-tactic probe. No padding, sorry'd data, set_option or extra import exists. No Tau Ceti object file needed building, and no Lean process was left running.

### Supplier order, resolved citations and duplication by object

The prescribed dependency command, with the given configuration, name, order and movable flag, exited 0:

    depcheck: 48 roadmaps, 545 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. The citation resolver found no missing roadmap citations or backticked names; its inability to inspect external Lake packages was covered by opening the pinned trees directly. R01 concerns the generality of a present section, which a name resolver cannot establish.

Main-branch roadmaps were read on main; suppliers adding new roadmaps were read at their indexed open heads. A revision to an existing roadmap was not substituted for main. Paths below identify the supplier README; a section range denotes the actual sections inspected, not an inferred contract.

| Supplier README and resolved sections | Checked supplied object and boundary |
| --- | --- |
| TauCetiRoadmap/PerfectoidSpaces/README.md:879–1975, :3419; P3.11–P3.22, P5.9–P5.13.4, P6.5–P6.7, P6.15–P6.16 | Basic setups require idempotence and flat m⊗m; almost modules/sheaves, purity, finite-stage descent and corrected pro-étale towers. The completed-tower torsor uses a profinite group and the stated characteristic hypotheses. |
| TauCetiRoadmap/AdicSpacesPartII/README.md:7464, :8134; R0–R1, R0.19–R0.20 | Rigid/adic carriers, spectral/categorical size foundations, tilde-limits with density and topology conditions. A tilde-limit is not automatically a categorical limit. |
| TauCetiRoadmap/AdicSpacesPartIII/README.md:2729, :3272, :3525; R2.2–R2.8, R3.1–R3.8 | Formal carriers, admissible models, blowups, completion, coherent analytic sheaves, Kiehl/GAGA and finite traces. F0's Noetherian restriction causes R01; the declared valuation extensions do not assert that they already exist here. |
| packages/AdicSpacesPartIIPartII/design/README.md:575, :1019, :1296, :1502; RZ.0–RZ.5 | Zariski geometry, normalization, smooth loci, weakly Shilov points and proper resolution. Branched extension and per-map generic smoothness are precise declared additions. Resolution preserves both branches of a node. |
| TauCetiRoadmap/RigidAnalyticGeometry/README.md:177, :205; TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md, §§7.5, 7.8 | Affinoid Noetherianity/excellence and resolution of reduced finite-type schemes over affinoids. The algebraic resolution does not pretend that a Tate algebra is finite type over its field. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md:678, :798, :848, :1394, :3959, :4094, :4406 | Reflexivity, limits, excellence, derived QCoh, Noetherian upper shriek/duality. The three valuation duality contracts supply the extra generality. |
| TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md, L2/fp-compactification-limit and L2/fp-strict-cofiltered | Finitely presented compactifications and their strict cofilteredness. These were removed from the valuation gap and are imported in §§0.3 and 1.1. |
| TauCetiRoadmap/DerivedModuleAlgebra/README.md, §§0.2, 0.4, 0.8, 0.10–0.17, 1.T.1, 1.1–1.8, 1.E.1, S.1; TauCetiRoadmap/DerivedDeRhamCohomology/README.md, §1.22 | Derived tensor/Hom, cotangent/exterior operations, product-difference towers, derived completeness, effectivity and spectral sequences. Quotient-tower formulas retain regularity/bounded-torsion hypotheses; no unrestricted exact ordinary completion is imported. |
| TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429–675, :1294; §§0.1–0.4, E1.1–E1.5, E2:towers.1 | Ringed-site enhancements, replacements, Koszul signs, Hom/tensor, coherent towers. The connective i+1 totalization result is not an existing stated theorem in these sections. |
| TauCetiRoadmap/AInfCohomology/README.md, AI.0:integral.1, AI.1.1–AI.1.7, AI.3.1–AI.3.2, AI.4.1, AI.6.1–AI.6.2 | Breuil–Kisin line, décalage, structure sheaves and smooth Hodge–Tate map. AI.6's one-block p^q chart is distinct from this package's multiple blocks and arbitrary nonzero parameters. No generic décalage or completion theorem is re-owned here. |
| TauCetiRoadmap/PadicHodgeTheory/README.md, §§2.1, 2.4, 2.7, 7.2 | Primitive comparison, including singular proper spaces, finite-level/integral finiteness and lisse coefficients. General model nearby coherence and the integral toric scalar-extension map are separate declared contracts. |
| TauCetiRoadmap/ArithmeticGaloisDuality/README.md, D7.1–D7.3, R02.1.2–R02.2.3 | Discrete/compact coefficient categories, continuous group cochains, Hochschild–Serre and transfer. Compact finitely generated coefficients keep the supplier's coefficient-ring hypotheses. |
| TauCetiRoadmap/DiamondsAndVStacks/README.md, D1.1–D1.6, D1.9–D1.11 | Strictly totally disconnected covers and their section/flatness calculus, with the stated qcqs and integral-modulo-pseudouniformizer restrictions. |
| TauCetiRoadmap/DiamondEtaleCohomology/README.md, C0.1, C0.23, C1.7–C1.12, C2.10 | Adic/diamond comparison, bounded-below embedding into v-sheaves, common-cutoff hyperdescent. Its base-change theorems require quasi-pro-étaleness or prime-to-residue coefficients; they do not already state §7.6 here. |
| TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md, §§1.1–1.5, 7.1, 8.2, 8.4, 9.5, 9.7, 10.5, 11.1 | Sites, field-pair fibre comparison, proper algebraic comparison, torsion amplitude, normalized analytic trace, integral trace with smooth model, invertible-coefficient smooth local constancy and nonproper algebraic comparison. The new p-duality and all-torsion Zariski-constructible base change extend this boundary. |
| TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md, §§7.5–7.6 | Proper finiteness and SW Theorem 10.5.1 including its proof, pp. 82–88. No copy of those module estimates remains. |
| TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57, :105, :139, :175, :405–439, :565, :676, :1120–1157; G.1–G.3, F.0, F.3, §§0.5–0.11 | Scheme compactifications, constructible coefficients, localization, algebraic traces and purity. F.3 has proper finiteness and field/trait variants, not the general quasi-excellent nonproper statement requested by its gap. |

Ownership searches used the prescribed roadmaps grep service on main and the index of 352 open heads (295 new roadmaps), by objects including almost coherence, formal dualizing sheaves, Faltings trace, polystable duality, Zariski constructibility, proper base change, SW 10.5.1, finite branched covers and formal proper mapping. The named open-roadmap set was covered by those head searches. Relevant positive hits were opened; absence was not inferred merely from a proposed declaration name.

The board index was read before searching its twenty packages at their listed heads. Five had package READMEs; the other fifteen were read at design/README.md at those same heads. In particular PadicHodgeTheoryPartII, SchemeAndStackFoundationsPartII, VStackSheavesAndLisseCategoriesPartII and VectorBundlesAndIsocrystalsPartII did not own the disputed formal proper-mapping theorem or these Faltings/Zariski-constructible targets. The v-stack trace material is abstract categorical trace, not a formal canonical-sheaf trace. Searches found no competing owner for the retained product-polystable duality or Zariski-constructible proper pushforward/base change. The empty Suggested.lean declares no fully qualified name that can collide.

All thirteen gap slugs match plan.json and the README, with named suppliers and exact hypotheses. They are individually mathematical contracts; the uniformization zigzag is one geometric theorem, and upper shriek is one pseudofunctor with its defining compatibility laws. They do not duplicate the narrower supplier statements. Their computed tests are below. No gap with supplier none exists.

### Adversarial mathematics table

The following rows test every numbered target together with its API, formulas and Checks. Λ is nonzero unless n=1 is specified; a=ζ_p−1. Results are mathematical computations, not conclusions drawn from a sorry build. “Retain” means no change to that statement. The new supplier failure is isolated in §0.2.

| Statement | Instances tried | Values computed on both sides, including wrong-model controls | Result | Change |
| --- | --- | --- | --- | --- |
| Almost/residue convention | O_C/p, O_C/𝔪; v(ε)=v(p)/2 | ε·1≠0 modulo p, ε·1=0 modulo 𝔪; (O_C/𝔪)^a=0 while (O_C/p)^a≠0 | Distinguishes the two reductions | Retain |
| Ramification convention | K=ℚ_p(π), π²=p, p=2,3 | π is nonzero with π²=0 modulo p; π=0 modulo the maximal ideal | Reduced residue fibre is not reduced mod-p fibre | Retain |
| Shift and integer-index convention | d=1, i=3; point | H²(Λ[−2])=Λ, H²(Λ[2])=0; 2d−i=−1, with H⁻¹=0; d=0 gives shift 0 | Correct direction; no natural-subtraction junk value | Retain |
| Twists and orientation | One torus; two swapped coordinates | jΦ⁻¹Sch(dlog T)=dlog T; extra scalar a gives a⁻¹dlog T; swap determinant −1, reducing to 1 at p=2 and 2 at p=3 | Fixes scaling and wedge sign | Retain |
| Finite-trace convention | Split two points, p=2,3 | Tr(1,0)=1; Tr(1,1)=2, hence 0 or 2 modulo p | Sum, without division by degree | Retain |
| Group/right-action convention | g=(12), h=(23) in S₃ | (gh)⁻¹=(132)=h⁻¹g⁻¹; g⁻¹h⁻¹=(123) | Inversion is necessary for a right action | Retain |
| Size and zero conventions | Fixed adequate cutoff; zero ring, empty space, n=1 | All coefficient modules and cohomology of the empty space are 0; an object larger than the cutoff is outside that chosen site | No nonexistent point or unrestricted-size quantifier | Retain |
| 0.1 almost coherent sheaves | Unit, residue module, completed infinite direct sum | Unit has one generator; honest residue sections k≠0 become 0; infinitely many εe_j survive modulo p and cannot lie in finitely many generated coordinates | Excludes all complete modules | Retain |
| 0.2 affine/Hom/proper calculus | F=G=O_C; G in every negative degree; formal ℙ¹/O_C | RHom(O_C,O_C)=O_C[0]; H⁻ʲRHom(O_C,G)=O_C for every j>0; H⁰(O/p)=O_C/p but its generic fibre is 0 | Boundedness order sound; integral proper input unsupplied | R01 |
| 0.3 almost proper duality | Identity, split two points, smooth curve | Hom comparison gives O_C^a/p on both sides; counit (1,0)↦1; f!unit=Ω¹[1], with H⁻¹=Ω¹ | Correct source, target and shift | Retain |
| 0.4 nearby cycles | Point, 2-torus, square-zero thickening | Point A=O_C^a[0], K=O_C^a/p[0]; torsion-free torus ranks 1,2,1; O⁺=O_C+Cε, and Cε/p=0 | General coherence needed; no singular toric chart assumed | Retain |
| 0.5 generic coherent fibre | O_C, O_C/pⁿ, ϖO_C | Generic fibres C, 0, C respectively; identity pushforward gives the same maps 1↦1 | Inversion differs from reduction | Retain |
| 1.1 formal dualizing objects | Point, smooth surface, completed ℤ_p[pT,T²,T³] | Point degree 0; surface generator dT₁∧dT₂ in degree −2; x=pT≠0 modulo p but x²=xT²=xT³=0, so residue depth 0 | Full complex cannot be replaced by its bottom sheaf | Retain |
| 1.2 completion/étale comparison | Identity; U=2T at odd p; n=1 | Id sends generator to itself; dU=2dT with unit determinant at odd p; finite-level reduction recovers the scheme complex | p=2 formal map fails the stated étale condition | Retain |
| 1.3 Glue kernel/API | U=X, U=∅, formal point | Kernel in C⊕O_C is {(s,s):s∈O_C}; (1,0) has difference 1; empty-open output C≠O_C | Excludes unrestricted direct sum | Retain |
| 1.4 Hartogs | Whole open; empty open at point; uv=ϖ | Whole-open map s↦(s,s) recovers F; empty-open output C≠O_C violates density; nodal residue has two components, both met by a dense open | Dense/reduced hypotheses discriminate | Retain |
| 1.5 bottom trace | Id, two copies, degree p | Values 1, 1 on e₁, and p on 1; mod p last value is 0 | Underived trace and composition agree | Retain |
| 1.6 generic canonical sheaf | Point; torus T; U=T⁻¹ | s(1)=1; dlog U=−dlog T in both identifications | Bottom comparison pins the sign | Retain |
| 1.7 coherent trace | S=Tʳ with r=p; ramified quadratic point | f*dlog S=r dlog T; Tr(dlog T)=dlog S, so Tr(f*α)=rα. ℚ_p(π), π²=p, has nonreduced residue order; over C its finite generic algebra splits C² | Algebraic closedness of reduced-model route matters | Retain |
| 2.1 scalar-power torsion quotient | O_C⊕O_C/p²; p=2 | Quotient O_C; torsion-free module unchanged; 2x²=0 implies x²=0 in the torsion-free quotient | Alternating law survives p=2 | Retain |
| 2.2 BMS maps | Point n=1; smooth one-torus | Point source Ω̂¹=0; torus image aR̃¹ and cokernel R̃¹/a; extra scalar a would give a²R̃¹ | Cotangent normalization excludes rescaling | Retain |
| 2.3 smooth inverse | d=0,1; coordinate character | Ψ⁰(1)=1; ranks 1,1,0 for d=1; character↦dlog T, not a⁻¹dlog T; aⁿΨ(x)=ιΦ⁻¹(aⁿx) | Integral lattice and rational inverse agree | Retain |
| 2.4 nice models | Smooth affine, uv=ϖ, t²=ϖ | Residue rings polynomial, k[u,v]/uv reduced, and k[t]/t² nonreduced; generic last algebra C² | Nice is weaker than smooth and excludes last model | Retain |
| 2.5 rational normalization/trace | Torus, S=Tʳ, point | jΦ⁻¹Sch(dlog T)=dlog T; trace values 1 and r on dlog T and f*dlog S; point 1↦1 | Compatible with 1.7 and 2.3 | Retain |
| 2.6 Faltings traces | Point; smooth curve; singular model | Point id; Ω¹[1](−1)[−2]=Ω¹(−1)[−1] has H¹=Ω¹(−1); a non-CM model can retain higher dualizing terms | Correct full target and shift | Retain |
| 2.7 pseudo-finite maps | Id, admissible blowup, positive generic-dimensional fibre | Id generic degree 1 and amplitude [0,d]; blowup generic degree 1 despite exceptional ℙ¹; positive-dimensional generic fibre is not finite | Definition includes independent amplitude condition | Retain |
| 2.8 finite pro-étale trace | Split p-cover, identity, degrees r then s | Tr(1)=p=0 modulo p, Tr(e₁)=1; identity value 1; composite and iterated sum both send a single basis vector to 1 | Zero trace is excluded even in wild degree | Retain |
| 2.9 trace square/locality | Identity; split two-cover; degree p | Both routes give 1, x+y, p respectively | Same normalization on all sides | Retain |
| 3.1 product-polystable chart | uv=ϖ, unit ϖ, uv=0; no blocks | d=1, reduced nodal residue; unit parameter gives a torus; uv=0 has both partial derivatives 0 at origin; no blocks gives d=0 | Nonzero parameters and product dimension are needed | Retain |
| 3.2 root stages/tower | n_i=0; one torus; p=2 node at m=1 | Γ=1; torus Γ=ℤ_p(1); special fibre k[x,y]/(x²,y²,xy) has basis 1,x,y, length 3, versus generic degree 2 | Finite presentation is not base flatness | Retain |
| 3.3 weights/cosets | uv=p; ϖ a unit; m=0 | V_uV_v=pV₀≠V₀; unit parameter makes factor invertible; at m=0 there is one integral coset | Corrects source's false multiplication isomorphism | Retain |
| 3.4 continuous Koszul | Trivial ℤ_p, nontrivial order pᵐ, trivial group | [O_C→⁰O_C] has H⁰=H¹=O_C; multiplication by ζ−1 gives H⁰=0,H¹=O_C/(ζ−1); Γ=1 gives H⁰ only | a-annihilation does not mean almost zero | Retain |
| 3.5 honest décalage comparison | Trivial torus; coefficient unit | Lη gives ranks 1,1; torsion-free quotient of O_C is O_C, not O_C/a | Uses the almost-to-honest criterion with its torsion conditions | Retain |
| 3.6 projection trace | 1, T^(1/pᵐ), T; m≥1 | Values 1,0,T; the ordinary characteristic-p algebra trace instead sends 1 to pᵐ=0 | Projection is fully distinguished | Retain |
| 3.7 derived root duality | m=0; characteristic-2 node; quadratic torus | m=0 sends r to multiplication by r; Hom(A/(v),A)=Ann(v)=(u); torus Gram diag(1,T), determinant T a unit | Derived duality does not assert root-stage projectivity | Retain |
| 3.8 oriented group trace | Γ=1, ℤ_p, swapped two generators | Id in degree 0; chosen top generator↦1; swap multiplies top trace by −1 | Orientation agrees with wedge conventions | Retain |
| 3.9 cochain duality | d=0,1; characters χ,−χ | d=0 multiplication; degrees 0 and 1 pair into 1; nonintegral total character has trace 0 | Opposite characters and completed sum/product are respected | Retain |
| 3.10 polystable local duality | Point, curve, 2-torus | Point unit; curve target Ω¹(−1)[−1]; torus degrees 0↔2,1↔1, with swap −1 | Integral and mod-p shifts consistent | Retain |
| 4.1 perfect Faltings pairing | Point, curve, zero object | Point adjoints both id; curve dualizing target Ω¹/p(−1)[−1]; zero adjoint 0→0 is iso | Perfection means both adjoints, not assumed projectivity | Retain |
| 4.2 rig-isomorphism descent | Id; admissible blowup | Id adjoint unchanged; generic blowup map degree 1, Rf_*K_𝔜=K_𝔛, so both trace routes send 1 to 1 | Pushforward and duality have compatible directions | Retain |
| 4.3 good quotients | G=1; G×𝔛, order p; trivial C₂ action | Fibre counts 1, p, 1; the last is not a C₂-torsor because 1≠2 | Wild split torsors allowed, arbitrary actions excluded | Retain |
| 4.4 derived invariants/coinvariants | C_p trivial action on O_C/p; induced S₃ module; C₃ over 𝔽₂ | Differentials g−1=0,N=p=0 give H¹=O_C/p; induced module gives M in degree 0; 3=1 in 𝔽₂ makes averaging possible only there | No general averaging assumption | Retain |
| 4.5 equivariant pushforward/Hom | G=1,C_p,S₃ | Identity comparison; C_p's H¹ remains O_C/p; (gh)⁻¹=h⁻¹g⁻¹ | Finite cohomological dimension and right-action conversion retained | Retain |
| 4.6 quotient descent | Split C_p torsor M^p; induced S₃ | Invariants diagonal M, coinvariants M, higher induced-group cohomology 0; Tr(diagonal1)=0, Tr(e₁)=1 | Uses induced-module norm, not arbitrary invariants=coinvariants | Retain |
| 4.7 local almost duality | Point, uv=ϖ, t²=ϖ | Point id; node reduced with two branches; t≠0,t²=0 in last residue fibre | Nice hypothesis excludes the bad model | Retain |
| 5.1 global trace | Point, two points at p=2, curve | Id; (1,1)↦0 and e₁↦1; H² target=O_C^a/p for shift −2 | Model independence retains normalized trace | Retain |
| 5.2 global almost duality | Point, ℙ¹, two points | Point multiplication; ℙ¹ ranks 1 in degrees 0,2 with point-class trace 1; two-point Gram diag(1,1), determinant 1 even when Tr(1)=0 | Perfect pairing not equivalent to nonzero unit trace | Retain |
| 5.3 almost detection/top trace | Zero map, identity, two points | Zero-map kernel/cokernel tensor to O_C/p with ε·1≠0; identity has both 0; two-point summation has 1-dimensional kernel | Both implications tested; connectedness needed | Retain |
| 5.4 mod-p PD | Two points; ℙ¹; characteristic-p ℙ¹; i=2d+1 | Gram diag(1,1); ℙ¹ H⁰,H² both 𝔽_p; in char p, Artin–Schreier gives H²(ℙ¹,𝔽_p)=0; out-of-range groups both 0 | Mixed characteristic and integer indices matter | Retain |
| 5.5 finite local systems | Rank 0; rank r constant; C₂ Jordan block over 𝔽₂ | 0→0; evaluation matrix I_r; nontrivial Jordan filtration has two trivial factors, but a degree-2 trace scalar is 0 | Sylow reduction needs prime-to-p degree transfer | Retain |
| 5.6 finite p-power PD | n=1,2; ℙ¹ | Λ in degrees 0,2, paired into Λ[−2]; Tor₁ over ℤ_p of (ℤ/pⁿ,𝔽_p) is 𝔽_p, while base change of the free Λ_n unit over Λ_n has no such Tor | Correct coefficient tensor ring | Retain |
| 5.7 integral trace | Point, ℙ¹, torsion module | Id; c₁↦1 at every level and in ℤ_p; (ℤ_p/p)[1/p]=0 | Agrees with parent's smooth-model trace | Retain |
| 5.8 integral derived PD | ℙ¹; [ℤ_p→pℤ_p] in degrees 0,1; point | ℙ¹ target ℤ_p[−2]; complex H¹=ℤ/p,H⁰=0, and dual has H⁰=Ext¹(ℤ/p,ℤ_p)=ℤ/p; point 1⊗1↦1 | Derived Ext contribution retained | Retain |
| 5.9 rational PD | ℙ¹, torsion, two points | Gram (1); torsion rationalizes to 0; two-point Gram diag(1,1), whereas product of sums has rank 1 | Correct degreewise rational form | Retain |
| 7.1 Zariski constructibility | Skyscraper on disc; constant; disjoint points with Λ[j] | Closed point/complement strata give fibres Λ,0; constant one stratum; at point j cohomology in degree −j, locally bounded but no global lower bound | Distinct from Huber constructibility and global boundedness | Retain |
| 7.2 algebraization | Spec A; closed-point sheaf; Z=two points | Spec A analytic side Spa A; skyscraper support remains same point; H⁰ both sides Λ² | Correct scheme argument Z | Retain |
| 7.3 locality/generators | Point; closed point in disc; nontrivial unipotent local system | Point generator Λ; finite closed immersion gives i_*Λ with stalks Λ,0; length-two unipotent object is an extension of two trivial factors | Thick generation includes extensions, not just direct sums | Retain |
| 7.4 constructible proper pushforward | Id; {a}→disc; truncated connective complexes | Id unchanged; R⁰=i_*Λ,R^{>0}=0,S_f=Y∖{a}; [M→id M] has H⁰=0 versus M after degree-0 truncation; [0→M→id M] has H¹=0 versus M without degree 2 | Requires levels through i+1 and only finitely many smooth opens | Retain |
| 7.5 field-extension invariance | Point, ℙ¹, rational nodal curve; n=2 | Point Λ→Λ; ℙ¹ ranks 1,0,1; nodal ranks 1,1,1 preserved after extension; coefficient reductions preserve 1 | Smooth hypercover precedes toric comparison | Retain |
| 7.6 all-torsion proper BC | g=id; ℙ¹,n=p²; n=1; empty source | Id; H⁰=Λ,H²=Λ(−1) before/after; zero coefficient ring gives 0→0; empty source 0=0 | No good-primes restriction | Retain |
| 7.7 constant big-site sheaf | Z=point; two points; Z=point,Y=ℙ¹ | R⁰=Λ or Λ²; for point Z, R²=0 while H²(Y,Λ)=Λ(−1) | Distinguishes higher direct image sheaf from product cohomology | Retain |
| Worked elliptic example | Symplectic basis e,f; p=2,3 | Matrix [[0,1],[−1,0]], determinant 1; diagonal 0 also modulo 2 | Alternation is stronger than skew symmetry at 2 | Retain |
| Worked nodal example | Semistable node; rational proper nodal curve | Local dualizing complex ω[1]; proper normalization contributes degrees 0,2 and the identified-node loop contributes one H¹ | Local model and global descent examples agree | Retain |

### Declared-gap tests and minimality

These thirteen declared gaps are not findings. Each exists with the same slug and named supplier in both intake locations.

| Gap | Instances and computed values | Contract check |
| --- | --- | --- |
| reduced-model-cofinality | Over algebraically closed C, a point has model Spf O_C; over ℚ_p, the ramified quadratic algebra has residue π≠0,π²=0 and only splits into two points after extension | Algebraic closedness retained; ordinary Raynaud localization alone does not provide reduced cofinality |
| refined-formal-algebraization | B=O_K⟨T⟩ is the completion of O_K[T], generic dimension 1; an extra generic-only component has empty completion | Pure relative dimension is a real additional requirement; Z line 4217 |
| finite-formal-quotients | G=1 gives identity; G acting by permutation on G×𝔛 gives quotient 𝔛 and degree equal to the group order | One finite-quotient theorem with quasiprojective residue hypothesis; FQ line 760 |
| polystable-uniformization-zigzag | A smooth point has the length-zero diagram; uv=ϖ already has one polystable block and generic dimension 1 | One geometric theorem, not four unrelated obligations; Z line 3188 and U line 169 |
| finite-branched-covers | On a punctured normal disc, T=S² is finite étale in characteristic zero and extends to the degree-2 branched disc cover | Branching at 0 is retained; characteristic-p inseparable squaring is excluded; Han line 134 |
| proper-generic-smoothness | For {a}→D, S_f=D∖{a}; for finitely many a_j, intersection=D∖{a_j}; intersection over all points is empty | Per-map quantifiers correct; BH line 567 |
| valuation-upper-shriek | Id gives O[0]; relative affine line gives Ω¹[1]; split two-point counit (x,y)↦x+y | One pseudofunctor contract on universally coherent bases; Noetherian supplier insufficient; Z line 507 |
| valuation-duality-amplitude | Smooth point has amplitude [0,0], smooth d=2 chart bottom in degree −2 and no cohomology outside [−2,0] | Tor and cohomological amplitude of the same object; Z line 635 |
| valuation-canonical-reflexivity | For O_K[T], bottom Ω¹ is free rank 1 and bidual map id; model t²=ϖ has nonreduced residue and lies outside hypotheses | Not the supplier's Noetherian reflexive-sheaf definition; Z line 755 |
| connective-totalization-truncation | Normalized connective complexes [M→id M] and [0→M→id M] have H⁰=0,H¹=0; omitting levels 1 or 2 gives M | i+1 is necessary and sufficient for these controls; abstract gap only |
| general-nearby-coherence | Point ranks (1); smooth 2-torus (1,2,1); square-zero Cε becomes 0 modulo p | General admissible-model theorem, distinct from proper primitive comparison; AC line 7390 |
| integral-toric-field-extension | Toric tower constant coefficient 1 maps to 1; finite Koszul differential ζ−1 remains ζ−1 over C′; a node has no smooth toric chart | Smooth hypothesis and scalar-extension map exact; singular case handled by hyperdescent |
| quasi-excellent-direct-images | For j:𝔾_m→𝔸¹ over an algebraically closed characteristic-zero field, the boundary stalk of R¹j_*Λ is Λ(−1), not 0 | Nonproper input is real; parent F.3's proper theorem does not cover it; Han line 801 |

### Form and scope

The introduction explains the parent roadmap's stopping point. The retained variants concern reduced/nice formal models, multi-block arbitrary-parameter polystability, wild quotients, p-torsion duality and Zariski-constructible all-torsion proper base change. These are extensions of the parent, not a replacement roadmap. Equal-characteristic p is explicitly excluded where its étale p-cohomology would invalidate duality; Layer 7 retains all characteristic-zero complete nonarchimedean fields, including residue characteristic zero.

The house-style structure, separate API/Checks for definitions, exact locators, per-target Needs, layer dependencies and timeless language were checked. No computational algorithm, source passage copied into the package, process instruction masquerading as mathematics, sorry'd data, stand-in Prop or set_option was found. Metadata identifies the same roadmap. The manifest has one key per work, including the newly recorded FQ; no source entry was rewritten or added during this review.

## Not verifiable

- H, Heuer Proposition 2.18, published p. 279: the manifest records the work as uncertified and the text is unavailable here. That settled status was respected; no new request was made. The asserted constant-sheaf statement is independently justified by §7.6 and the point/two-point examples, but the published locator itself is not certified.

There is no newly missing source and no outstanding source-fetch request. U's earlier unread-text limitation was resolved. Ownership of the named open-roadmap set was checked through the supplied head index; board packages were additionally read at the listed heads.

## Source issues

- **Misprint** in Z at Lemma 2.2.7(2), p. 13 (Z line 558): the source says upper shriek sends complexes from the source scheme to the target; it should be from the target to the source; affects nothing.
- **Misprint** in Z at equation (3.7), Theorem/Definition 3.4.13, p. 43 (Z line 2038): the source says the normalization includes an extra scalar (1−ζ_p)ⁿ; it should be the map without that scalar, agreeing with equation (3.6) and the inverse-Scholze normalization in Remark 3.4.15; affects a stated result.
- **Error** in Z at Lemma 4.2.15, p. 54, and after equation (4.6), p. 53 (Z line 2536, Z line 2563): the source says multiplication identifies each pair of weight lines with the sum-weight line; it should be multiplication with block-parameter factors, giving pV₀ for V_uV_v when uv=p; affects a stated result.
- **Misprint** in Z at proof of Lemma 4.2.23, p. 55 (Z line 2644): the source says γ_i acts by the j-th character value; it should be the i-th character value and exponent; affects nothing.
- **Misprint** in Z at proof of Proposition 4.3.6, Case 2, p. 61 (Z line 2965): the source says the bound on π uses a pⁿ-th root of the parameter; it should be the pᵐ-th root, where m is the root-tower level; affects the proof.
- **Misprint** in Z at Theorem 4.4.24, p. 74 (Z line 3587): the source says local duality holds without restating reduced residue special fibre; it should be stated with niceness from Theorem 4.1.2 and the section's standing assumptions; affects a stated result.
- **Misprint** in Z at proof of Theorem 4.4.24, Step 3, p. 74 (Z line 3596): the source says the map from X′_i to X′ is a good quotient; it should be the map from X′_i to X_i; affects nothing.
- **Misprint** in Z at Definition 5.2.1, p. 75 (Z line 3640): the source says the global trace target has shift +2d; it should be −2d, as in the subsequent formula and Definition 5.2.3; affects nothing.
- **Misprint** in Z at Theorems 5.5.2, 5.5.4 and 5.5.6, pp. 81–83 (Z line 3920, Z line 3968, Z line 3979): the source says derived trace pairings have unshifted coefficient targets; it should be coefficient targets shifted by −2d; affects a stated result.
- **Misprint** in AC at Lemma 4.9.7(2), p. 113 (AC line 4852): the source says the first Hom argument is bounded below and the second bounded above; it should be the first bounded above and the second bounded below; affects a stated result.
- **Misprint** in AC at Theorem 5.5.5, p. 129 (AC line 5512): the source says derived pushforward runs from Y's almost category to X's; it should be from X's almost category to Y's; affects nothing.
- **Misprint** in AC at Lemma 5.5.6, p. 130 (AC line 5540): the source says the internal-Hom comparison lies in X's almost category; it should be in Y's almost category on both sides; affects nothing.
- **Gap** in BH at proof of Lemma 3.25, p. 25 (BH line 1113): the source says an arbitrary affinoid admits the toric perfectoid torsor used in its calculation; it should be applied to smooth toric charts after reduction of proper singular spaces to smooth proper hypercover terms; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7de7f5adf7ed8ca6b81b025355e38169aea995d6", "job": "REV-PKG-ClassicalAdicEtaleCohomologyPartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
