<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1067#issuecomment-6394045743 -->
Review (codex) of 10a4560

Verdict: needs_changes

1. **F01** (P2) Ample-degree positivity already has an earlier owner

   **Location.** `packages/AnalyticToricGeometryPartII/README.md:83`: “What SchemeAndStackFoundations must provide (gap:ample-degree-positivity)”. Also lines 704, 712, 729, 737 and `packages/AnalyticToricGeometryPartII/design/plan.json:2281`.

   **Claim.** Positivity of ample degree on integral projective subvarieties, and hence on nonzero effective pure-dimensional cycles, is a missing supplier export.

   **Witness.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1228`, §A2.7, at head `71ecc01`, already states `ampleIntersectionPositive` for proper schemes over any field and arbitrary ample line bundles. Its statement starts at line 1230.

   **Exact repair.** Remove only the `ample-degree-positivity` entry from the plan's top-level gaps and its README gap sentence. Add AbelianSchemesAndArithmeticModuli §A2.7 `ampleIntersectionPositive` to Scope and ownership and to its own exact supplier subsection. Replace this gap in the §6.3 route and Needs, §6.4 Needs and Layer 6 dependencies by that named theorem; retain SchemeAndStackFoundations' Chern, degree and Gysin inputs. Apply §A2.7 with all d bundles equal to H and add over the finitely many components of an effective cycle. Keep the separate generic-cuts gap.

   **Test of repair.** On ℙ¹×ℙ¹, two distinct ruling fibres have total class 2F and degree H·2F=2 for H=O(1,1); each component has degree 1 by §A2.7. For an integral closed point with residue degree p, the d=0 value is p>0, including inseparable points. The cited theorem has precisely this arbitrary-field scope; its source is also readable at STACKS line 4827, Lemma 33.45.9, tag 0BEV, printed p. 104. The supplier is at position 49 of `merge-order/ORDER.txt`, before this roadmap at position 180. This completes the ownership part of previous F02; it is not a re-raising of a finding marked not actionable.

2. **F02** (P3) Duplicate graded-algebra API bullets remain

   **Location.** `packages/AnalyticToricGeometryPartII/README.md:410`: “At z∈Q_D the convolution coefficient is Σ_(x+y=z) f_x g_y”; line 411 repeats the norm bound.

   **Claim.** These are additional API facts after the coefficient formula and norm bound already given at line 408.

   **Witness.** Line 408 already gives the same convolution coefficient, its construction by continuous extension, and the bound ‖f*g‖≤‖f‖‖g‖. Lines 410–411 add no distinct conclusion.

   **Exact repair.** Merge the convergence sentence of line 410 into line 408, then delete lines 410–411. Keep the singleton product at line 409 and every Check. This is the repetition pattern of previous F09 in an API list.

   **Test of repair.** For D=0 and f=2χ^(0,1), g=3χ^(0,−1), the surviving statements still give coefficient 6 at (0,0), zero elsewhere, and norm |6|=|2||3|. They distinguish convolution from the zero pointwise product.

3. **F03** (P3) The fibre Check assigns the union's class to the fibres

   **Location.** `packages/AnalyticToricGeometryPartII/README.md:708`: “For two distinct fibres of type (2,0) on ℙ¹×ℙ¹ and H=O(1,1), the degree is 2”.

   **Claim.** The wording labels the fibres themselves by (2,0), although the calculation uses the class of their union.

   **Witness.** `packages/AnalyticToricGeometryPartII/README.md:749` correctly gives two fibres total class O(2,0). One ruling fibre has class (1,0) and H-degree 1; two divisors each of class (2,0) have sum of H-degree 4.

   **Exact repair.** Write: “For the union of two distinct fibres of one projection on ℙ¹×ℙ¹, the total class is (2,0) and its degree against H=O(1,1) is 2.” Keep the disconnectedness conclusion.

   **Test of repair.** H·(F₁+F₂)=1+1=2, and F₁∩F₂=∅. Thus this is one Cartier equation, c=1, with two components of dimension 1, exactly the example used in §6.4.

4. **F04** (P3) The source manifest omits Lemma 1.16's page

   **Location.** `packages/AnalyticToricGeometryPartII/sources.toml:10`: the SCH12 locator includes “Lemma 1.16” but its page list includes “249–250” and omits 251.

   **Claim.** The page list covers the enumerated locators.

   **Witness.** SCH12 line 271 places Lemma 1.16 on printed p. 251, before the p. 252 marker at line 284. README:631 already gives the correct page.

   **Exact repair.** In the existing SCH12 entry, change the locator's page range 249–250 to 249–251. Keep its key, URLs, hash, version and other locators unchanged.

   **Test of repair.** Lemma 1.16 at SCH12 line 271 then falls inside the manifest range; Theorem 1.13 on p. 249 remains covered. This is a manifest locator correction, not an error in the source.

Four findings: one P2 and three P3; no P1. The blocking issue is a redundant supplier gap, not a counterexample to a headline theorem. Authored package files were not changed.

## Verified sound

### Previous findings, checked before the new pass

The previous report's computed rows were read, rather than its conclusions being treated as instructions. Every changed or added passage and every seeded target was rechecked. The table below records each repair, quoting the repaired package wording. No previous finding was marked not actionable.

| Previous finding | Status | Repaired passage and independently checked evidence |
| --- | --- | --- |
| F01, valuation specialization | Repaired | README:560: “Apply ClassicalAdicEtaleCohomology §6.2 proper specialization … then EtaleCohomologyFoundations §F.2.3 smooth universal local acyclicity”. The suppliers at lines 3143 and 540 respectively have the required nonnoetherian scope. For ℙ¹, both fibres give (Λ,0,Λ(−1)). The old gap is absent. |
| F02, compound intersection gap | Partly repaired | README:704: “gives 0_s^![X]∈CH_(n−c)(Z(s))”. The zero-section pullback and excess formula really occur in SchemeAndStackFoundations §5.5. README:83 and :85 split positivity from generic cuts, with matching plan slugs. However positivity is already supplied: R01. |
| F03, face projections versus localization | Repaired | README:51: “C0.9 supplies face open immersions by inverting an exposing character”. All localization references now use C0.9/C0.16; C0.6–C0.7 serve closed strata. On k[t], projection gives k, localization gives k[t,t⁻¹]. |
| F04, completed colimits and tilde-limit meaning | Repaired | README:450: “SCH12 Definition 7.14 is the weaker residue-field relation”. README:452 names P7.11 and R0.20.1; P7.15 supplies conversion. Isometric monomial embeddings detect ϖ^r divisibility, including r=0. |
| F05, tautological tilt notation | Repaired | README:436: “(TΣ,K)♭≅TΣ,K♭”. On the ray the coefficients change from K to K♭ while the exponent monoid stays ℤ[1/p]≥0. |
| F06, wall sign translation | Repaired | README:660: “u(ρ)=−m_ρ”. FS94 line 235 and its degree assertion at line 236 give the stated conversion. For O(D₋), 0−(−1)=1 and 1−0=1; both degrees are +1. |
| F07, extraneous estimate and missing compactness | Repaired | README:398: “the estimate itself is applied in §5.2”. The unused approximation gap is absent from §§2.1, 2.4, 3.1; README:610 now names R0.19.1–R0.19.3. The radius and zero-locus calculations below check the application. |
| F08, locators and manifest | Repaired at all listed locations | README:57 says “AdicSpaces §§2–5”; README:631 and :635 cite Proposition 8.7 at “p. 306”. The FS94 manifest coverage is “Conventions”, “0.6”, “Layer 6”. Source pagination and supplier Layer 2 agree. A separate manifest page omission is R04. |
| F09, trailing repeated Checks | Repaired at all listed locations | The twelve flagged trailing paragraphs are absent. For example README:192 retains “the Cartier equation x² has vanishing order 2 at zero”, followed by the other Checks and Needs, without the repeated paragraph. The broader repetition search found R02. |

### Principles, structure and elaboration

The package extends the parent's finite-fan algebraic and complex geometry; it does not re-plan it. Singular fans remain allowed in the earlier layers, all coefficient rings are retained for integral modules, complete nonprojective fans remain in the proper comparison and hypersurface endpoint, and projectivity enters only the intersection-degree endpoint. No good-prime shortcut, algorithm target, upward supplier, source-copy passage, sorried data, forbidden import or `set_option` was found. R04 concerns only the source manifest's page coverage.

Read main-branch shape examples `TauCetiRoadmap/AnalyticToricGeometry/README.md`, `TauCetiRoadmap/AdicSpaces/README.md` and `TauCetiRoadmap/AdicSpacesPartIII/README.md`. The package has all required top-level headings and seven layers ending in Examples and Dependencies. Its 29 target subsections have 101 Check bullets, at least three each; the twelve principal construction/definition subsections have prose API lists. All 29 Needs lines were read together with their routes. No hidden forward proof dependency or cycle was found. R02 and R03 are the remaining local presentation issues.

Pins were checked against `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Main is `7bd35ba3a6197cb1fadd5dac74e67499aa22b3b4`.

The requested `lake env lean` elaboration was run from the content checkout, with the absolute argument required by the brief, on `packages/AnalyticToricGeometryPartII/Suggested.lean`: exit 0, no output and no warnings. There are zero declarations and zero `sorry`s. The mechanical binder inventory produced an empty list; the generated signature-probe file containing `import Mathlib` also elaborated with exit 0 and no output. There are consequently no theorem bodies on which to run the one-tactic padding probe and no elaborated binder differences. No TauCeti object build was needed; no Lean process was left running.

The required dependency command used the supplied configuration, README, roadmap name, order and `--movable`. Exact output:

```text
depcheck: 48 roadmaps, 546 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The pinned citation resolver reported only `Chow.gysin`; this is a false positive as a library-name lookup, because README:704 explicitly attributes it to SchemeAndStackFoundations §5.5, which states it at line 6818. No cross-roadmap citation was unresolved.

### Headline inventory and why the Lean file is empty

| README headline | Missing carrier at the pins, explicitly named in the module docstring |
| --- | --- |
| §§0.3–0.6: integral monomial sections/base change, invariant representatives, class relations | Arbitrary-coefficient fan scheme with ray divisors and Cartier modules; the native realization is over ℂ. The free coefficient-module calculation alone is not this geometric headline. |
| §1.2: unit-model/full-analytification comparison | Integral toric formal completion, generic fibre and its comparison map. |
| §§2.1, 2.4: perfected toric charts and graded divisor algebra | Perfected cone completions with plus rings, perfectoidness and tilts. |
| §§3.1–3.6: five toric comparisons and sharp projection; §3.7: full affine line | Actual toric perfectoid spaces, power tower, tilting and adic étale topoi/geometric morphisms. |
| §§4.1–4.2: power-pullback automorphism and torsion comparison | Cohomology of these sites and their constructed pullbacks. |
| §§5.1–5.3: cofinal tubes, nonzero dense-field approximation and hypersurfaces | Integral toric line bundles and section domains, the homogeneous cone algebra and its sharp map. |
| §§6.1–6.2: operational Chow/Minkowski weights and displacement | Native operational Chow groups and toric orbit-closure evaluation. |
| §§6.3–6.4: positive refined degree and complete-intersection approximation | The intersection constructions, actual algebraic zero loci, analytification and π. |

All are named in `Suggested.lean:8` onward. No headline at the stated geometric generality is statable using only a few simple native definitions at these pins. In particular, a bare integer matrix kernel would replace the Chow identification, and a standalone Finsupp tensor identity would replace the section-sheaf theorem. No such substitutes, boundary declarations or fully qualified name collisions occur.

### Source verification

All four works were read from their existing legal line-numbered caches; no source was missing, waived, paywalled or flagged unverified in the package. No new manifest entry or source request was needed. SCH12 uses published IHÉS pagination; FS94 uses arXiv v1 pagination; FS25 uses author version 0.27. The following table covers all fifteen seeded targets, including hypotheses and proof-internal extensions.

| Sampled target | Opened source locator | Result and generality boundary |
| --- | --- | --- |
| 0.6 | SCH12 line 2384, Definition/Proposition 8.4, p. 304; line 2461, p. 306; FS94 lines 222–240, Corollary 2.4, p. 7 | Invariant representatives and principal Cartier relations support the route. The arbitrary-field class presentation is proved using the named Laurent-divisor contract; completeness is retained for the free quotient. |
| 1.3 | SCH12 lines 2410–2413, p. 304 | Character multiplication by p, with fixed coefficients. The all-positive-q extension uses the cited native monoid-algebra map; q=0 is explicitly excluded. |
| 2.2 | SCH12 lines 2405–2409, p. 304 | p-local divisors and the Banach monomial basis occur for general fans. c₀, rather than arbitrary coefficient products, is the stated Banach direct sum. |
| 2.3 | SCH12 lines 2463–2471, proof of Proposition 8.7, p. 306 | Both the character and divisor-degree coordinates occur, with j in all of ℤ[1/p]; negative degrees cannot be discarded. |
| 2.4 | SCH12 lines 2471–2474, p. 306; lines 1344–1355, Proposition 5.20, p. 280 | The completion and its tilt are explicit in the proof. Proposition 5.20 alone treats polydiscs; the cone extension is honestly assigned to the declared supplier gap. |
| 3.2 | SCH12 lines 2422–2427, Theorem 8.5(ii), p. 305; lines 2317–2323, Definition 7.14, p. 302 | Source uses residue-field density; the stronger chart-density relation is supplied separately by P7.11/R0.20.1 and converted by P7.15. |
| 3.3 | SCH12 lines 2428–2429 and 2437–2442, Theorem 8.5(iii), p. 305 | Direction is tilted unperfected space to the untilted topological power limit. No ringed-space identification is asserted. |
| 3.5 | SCH12 lines 2430–2432, Theorem 8.5(iv), p. 305; lines 2335–2351, Theorem 7.17/Corollary 7.19, pp. 302–303 | Fibred-topos limit, with qcqs noetherian finite levels and inseparable characteristic-p tower; not a pointwise categorical limit. |
| 3.7 | SCH12 lines 91–94, Theorem 1.5, p. 247; lines 2428–2436, p. 305 | Full affine line. Removing infinity from the complete ℙ¹ tower retains points of norm greater than 1. |
| 4.1 | SCH12 lines 2450–2456, proof of Proposition 8.6, pp. 305–306 | Smooth proper, algebraically closed K, ℓ≠p. The replacement suppliers really furnish the valuation-specialization argument. |
| 4.2 | SCH12 lines 2446–2449, Proposition 8.6, p. 305; lines 2344–2347, Corollary 7.18, p. 303 | Finite torsion comparison in all nonnegative degrees; cup and field coherence are explicitly assigned to the geometric-morphism contract. |
| 5.1 | SCH12 lines 2475–2481, proof of Proposition 8.7, p. 306; lines 2496–2506, p. 307 | Integral-model section bounds, with the finite-family cofinality argument made explicit using constructible compactness. Fractional bounds preserve all-rank valuations. |
| 5.2 | SCH12 lines 1752–1767, Lemma 6.5/Remark 6.6, p. 288, proof pp. 289–290; lines 2482–2492, p. 306 | General rational c; p-local ε is sufficient for the application. Cone approximation is a gap, not falsely attributed to the polydisc theorem. The new nonzero refinement and imperfect-field denominator clearing are valid. |
| 5.3 | SCH12 lines 2458–2492, Proposition 8.7 and proof, p. 306; line 271, Lemma 1.16, p. 251 | Proper smooth, no projectivity or algebraic closedness requirement. The independent class-group argument ensures a nonempty proper output. FS25 lines 299–322 give the nonprojective fixture. |
| 6.1 | FS94 lines 117–121, Proposition 1.1, p. 4; lines 176–200, Proposition 1.4/Theorem 2.1, p. 6; lines 222–240, Corollary 2.4, p. 7 | Correct cone codimension, saturated quotient lattice, balancing and wall sign. The arbitrary-field split-orbit duality is the stated supplier contract, not an unsupported extension of a generic orbit claim. |

Also opened: SCH12 lines 186–202 (Theorem 1.13 and coordinate sharp), lines 2324–2331 (open/étale restrictions), and lines 2496–2506 (the complete-intersection endpoint); FS94 lines 373–386 and 393–509 (cap/cup products and quotient-lattice displacement); FS25 lines 299–322; STACKS lines 223–245 (tags 020I/035X) and 4827–4843 (tag 0BEV, the R01 supplier's theorem). The seven earlier source errata were rechecked; the additional FS94 error is listed below.

### Pinned declarations opened

These are citations to library source files at the pins, not to proposed implementation names.

| Declaration/object | File and line | What the native object does and does not assert |
| --- | --- | --- |
| `AddMonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64` | Finite coefficient functions, with the native convolution structure; no geometric sheaf assertion. |
| `MonoidAlgebra.mapDomainRingHom` | `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean:285` | Exponent homomorphism induces a ring map. Coefficients are unchanged. |
| `ZeroAtInftyContinuousMap` | `Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean:45` | Extends continuous maps with cocompact convergence to zero. It does not assume discreteness or supply the toric convolution. |
| `PointedCone`; `ConvexCone.Salient` | `Mathlib/Geometry/Convex/Cone/Pointed.lean:33`; `Mathlib/Geometry/Convex/Cone/Basic.lean:298` | Nonnegative-scalar submodule versus the separate no-line condition. |
| `TauCeti.Toric.Fan` | `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean:83` | Finite cone family, face/intersection laws and integral lattice; no nonemptiness field. README adds it. |
| `TauCeti.Toric.IsToricCone` | `TauCeti/Geometry/Toric/Algebraic/Cone/Basic.lean:147` | Rationality and salience are explicit fields. |
| `TauCeti.Toric.primitiveGenerator` | `TauCeti/Geometry/Toric/Algebraic/Ray/Primitive.lean:167` | Requires an integral lattice and toric-cone proof; does not choose a rescaled ray. |
| `TauCeti.Toric.dualSemigroup` | `TauCeti/Geometry/Toric/Algebraic/DualSemigroup/Basic.lean:53` | Integral characters nonnegative on the cone. |
| `TauCeti.Toric.IsToricCone.fg_dualSemigroup` | `TauCeti/Geometry/Toric/Algebraic/DualSemigroup/Finiteness.lean:76` | Gordan finite generation, with the integral-lattice hypothesis. |
| `TauCeti.Toric.affineCoordinateRing` | `TauCeti/Geometry/Toric/Algebraic/AffineScheme.lean:60` | Body is a monoid algebra with coefficients ℂ; it is not an arbitrary-ring toric chart. |
| `TauCeti.Toric.Fan.algebraicRealization` | `TauCeti/Geometry/Toric/Algebraic/Fan/Scheme.lean:136` | Colimit of those complex affine charts, including singular fans. |
| `TauCeti.AlgebraicGeometry.SchemeWeilDivisor` | `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean:46` | Finite integer coefficients at codimension-one points; no ray indexing built in. |
| `WeilDivisor.OrderSystem.ofScheme` | `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Principal.lean:126` | Integral and noetherian scheme required. |
| `SchemeWeilDivisor.sheaf` | `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean:250` | Integral, locally noetherian, codimension-one DVR hypotheses are at lines 75–82. |
| `SchemeWeilDivisor.nonempty_iso_sheaf_of_linearlyEquivalent` | Same file, line 642 | Uses the noetherian binder at line 565 as well. Normal toric field fibres satisfy it; arbitrary valuation models are not substituted. |
| `TauCeti.PreAdicSpace.isAdic`, `isAdic_restrict`, `TauCeti.AdicSpace` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:206`, :231, :243 | Sheafy and locally affinoid, open restriction and full subcategory; no perfectoid or toric structure. |
| `PreTilt.untilt` | `Mathlib/RingTheory/Perfectoid/Untilt.lean:49` | Multiplicative map out of a pretilt of a p-adically complete ring; the file explicitly distinguishes it from an untilt functor. |

Object searches across both pinned libraries found no arbitrary-coefficient fan realization, operational Chow carrier, perfectoid-space carrier, toric analytification or toric tilde-limit construction that makes a missing headline statable. The search included related fields/operators, not only the roadmap's proposed names.

### Supplier resolution and ownership

All supplier sections were reopened on main or at the supplied current open heads. The three open suppliers already used by the package are ShimuraCompactifications `63e3f03`, ClassicalAdicEtaleCohomology `dfcb6b7`, and WeilConjectures `d90e186`. AbelianSchemesAndArithmeticModuli `71ecc01` is the newly identified earlier owner. No revision of an existing roadmap was substituted for its main-branch version.

| Citation family | Resolved location and boundary |
| --- | --- |
| AnalyticToricGeometry Layer 0 | `TauCetiRoadmap/AnalyticToricGeometry/README.md`: scope at line 19 and algebraic supplier at line 61; Layer 0 imports the finite-fan, dual-monoid and face API. Its complex analytic constructions do not own the nonarchimedean extension. |
| ShimuraCompactifications C0.6–C0.7, C0.9, C0.16–C0.18 | `TauCetiRoadmap/ShimuraCompactifications/README.md:498`, :513, :568, :747, :775, :798: closed face maps, ordinary localization, arbitrary-ring fan gluing, support properness, regular boundary. C0.10 at :587 supplies regular coordinates; the general field-fibre wrapper is the declared extension. |
| AdicSpaces §§2–5 | `TauCetiRoadmap/AdicSpaces/README.md:354` onward: Spa/rational opens, structure sheaf and space gluing; not an étale or perfectoid theory. |
| AdicSpacesPartII R0, R1 | `TauCetiRoadmap/AdicSpacesPartII/README.md:7466`, :7522, :7577, :8136, :8968, :9660: constructible topology, pro-constructible calculus, completed-colimit criterion, analytification and properness. R0.20.1 includes finite-stage ideal-power detection, verified for the isometric monomial inclusions. |
| AdicSpacesPartIII R2.2–R2.4, R2.8, R2.10 | `TauCetiRoadmap/AdicSpacesPartIII/README.md:4356`, :4615, :4986, :7480, :8158: nonnoetherian valuation formal models, generic fibres, specialization, good-reduction comparison and rational section bounds. The nonnoetherian generic-fibre functor is d, not the noetherian t construction. |
| PerfectoidSpaces P1.30, P2.1–P2.12 | `TauCetiRoadmap/PerfectoidSpaces/README.md:5423`, :6105, :6136, :6235, :6923, :7061, :7163, :7322: perfected polydiscs/Laurent variants, homogeneous estimate, rational localization, perfectoid spaces and functorial tilting. Arbitrary cone algebras/estimates remain declared contracts. |
| PerfectoidSpaces P3.18/P3.20 | Same README:9657 and :9976: small étale sites and site tilting, including coverings and field-functorial maps. |
| PerfectoidSpaces P7.1–P7.3, P7.11–P7.15 | Same README:15443, :15571, :15707, :16687, :16796, :16893, :17059, :17140. The open/étale base-change APIs are also explicitly listed at :15622 and :15733, so §3.6's P7.1–P7.3 citation is not missing. |
| AdicEtaleGeometry A1.6 | `TauCetiRoadmap/AdicEtaleGeometry/README.md:3259`: the genuine small étale site with jointly surjective coverings, including all-rank points, and its pullback functoriality. |
| SchemeAndStackFoundations §§0.7, 0.17–0.18, 0.23a, 0.29 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:755`, :1138, :1254, :1508, :1825: dimension/regular-sequence input, Cohen–Macaulayness, universal-homeomorphism étale invariance and correctly twisted relative Frobenius. |
| SchemeAndStackFoundations §§2.1–2.2, 3.4, 4.13 | Same README:3265, :3309, :4789, :5643: site cohomology, Picard/excision, regularity and Bertini. The existing smooth Bertini statement is not the arbitrary possibly nonreduced generic-cuts contract. |
| SchemeAndStackFoundations §§5.1–5.6 | Same README:6567, :6653, :6701, :6721, :6768, :6921. Refined Gysin at :6818 has arbitrary base-change map f; excess at :6823 and zero-section/homotopy comparison at :6813 justify support on Z(s). |
| EtaleCohomologyFoundations F.2.3 | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:540`: smooth ULA for finite lisse invertible coefficients, with no noetherian-base restriction. |
| ClassicalAdicEtaleCohomology §§1.1, 6.2, 8.2 | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:91`, :3143, :3599: derived fixed-coefficient cohomology, proper valuation specialization, proper algebraic comparison. Valuation-field extensions here are rank one and surjective on the two-point valuation spectra. |
| WeilConjectures WC.6 | `TauCetiRoadmap/WeilConjectures/README.md:1071`, :1108: the fixed seven-ray nonprojective model and its Chow presentation. The package only applies its general theorem to it. |
| AbelianSchemesAndArithmeticModuli A2.7 | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1228`: the full mixed ample-intersection positivity theorem; R01 removes the duplicate gap. |

Ownership searches used `roadmaps list`, `roadmaps grep` and `roadmaps show` over main and the 352-head index, with object phrases for finite-fan schemes, perfected cone algebras, toric towers, Minkowski weights, fan displacement, operational Chow, finite-orbit duality, homogeneous sections, ample positivity and generic cuts. Related AInfCohomology/PadicHodgeTheory hits are framed root covers and coefficient sheaves, not this global finite-fan comparison. Later HodgeTateAndCanonicalSubgroups and PerfectoidShimuraVarieties build log/all-root applications; they were not imported upward. TropicalAndBerkovichArithmetic imports the same finite-fan owner rather than supplying these constructions.

The board index was read before searching packages. All twenty listed heads were inspected: five have package READMEs; the other fifteen return 404 for that exact file but contain `packages/<Name>/design/README.md`, which was read and searched at the listed head. This includes SchemeAndStackFoundationsPartII, PELModuliPartII and ShimuraVarietiesPartII. The board checkout's other README/design files were searched too. No competing owner for the toric specializations was found; ample positivity is the exception recorded as R01. Zero Lean declarations means zero fully qualified collisions.

All eight README gap sentences match the plan's slug, supplier and needs text. Seven remain precise, owned extension contracts: toric-field-fibres; perfected-cone-algebras; homogeneous-cone-approximation; operational-chow-finite-orbits; ample-generic-cuts; geometric-morphism-cup-pullback; split-torus-divisors. Their absence today is not a finding. They retain the standing nonempty-fan/perfectoid hypotheses. The positivity gap fails minimality because of the exact earlier owner. Regular coordinate isomorphisms and polynomial UFD tools alone are not the missing global field-fibre/divisor interfaces, so those other contracts are not rejected merely because some proof ingredients exist.

### Computed adversarial pass

Each distinct mathematical assertion is covered below; repeated prose and identical API formulas share a row. These are computations and negative controls, not a claim that finite testing proves the general theorems. Source support and proof-route ownership were checked separately above. Let r=|ϖ| with 0<r<1, F be a ruling class and H=O(1,1). Rows use actual source/target objects; the package was not edited.

| Statement | Instances tried | Computed values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: finite nonempty fan, rank and salience | Rank 0; empty fan; rank-one line | The zero-cone rank-zero realization is Spec A; the empty realization is ∅. The line contains 1 and −1, so its intersection with its negative is ℝ, whereas a ray's is {0}. | Sound | None |
| Conventions: primitive and regular rays | Ray ℝ≥0 in ℤ | The primitive vector 1 extends to the basis (1); using 2 gives index [ℤ:2ℤ]=2 and fails regularity. Rank zero has empty basis and determinant 1. | Sound | None |
| Conventions: divisor, frame and equation signs | ℙ¹, D=2D₋ | div(t)=(1,−1); W(D)={0,1,2}; frame weights are 0,2 and equation weights 0,−2. First/second frame ratio is t⁻², not t². | Sound | None |
| Conventions: arbitrary coefficient rings | A=ℤ/4, 𝔽₂[ε]/ε², and 0 | For W={0,1}, S_A(D)=A²: cardinalities 16,16,1. The coefficient εχ⁰ is nonzero over the square-zero ring; it becomes zero after reduction. | Sound | None |
| Conventions: p-local rather than rational exponents | p=2,3 | 1/2∈ℤ[1/2] but 1/3∉ℤ[1/2]; 1/3∈ℤ[1/3] but 1/2∉ℤ[1/3]. Thus the two exponent carriers differ. | Sound | None |
| Conventions: rational thresholds and strict error | r=1/4, c=1/2, ε=1/2 | ∣f∣≤1/2 iff ∣f∣²≤1/4; ∣f∣=1/2 passes and ∣f∣=1 fails. Error factor r^(1−ε)=1/2<1; ε=1 would give 1 and is excluded. | Sound | None |
| Conventions: sharp and direction | Mixed characteristic p=2; equal characteristic | (1+1)♯=0 but 1♯+1♯=2 in mixed characteristic. In equal characteristic sharp is identity, giving 0=0. π has tilted source; cohomological pullback reverses that arrow. | Sound | None |
| Conventions: coefficients, inverses and degree | p=2, Λ=ℤ/3; p=3, Λ=ℤ/4 | 2·2=1 mod 3 and 3·3=1 mod 4. With ℓ=p, p=0 mod p has no inverse. Negative cohomological groups are 0; m=0 is excluded. | Sound | None |
| 0.1: ray-to-native-divisor injection and image | ℙ¹; zero-cone fan | Coefficient vectors (1,0),(2,0) map to distinct native divisors with coefficients 1,2 at D₊; all coefficients at an interior point [a], a≠0,∞, are 0. No rays gives the zero group. | Sound | None |
| 0.1: character divisor | ℙ¹; ℙ² with rays e₁,e₂,−e₁−e₂ | For t the vector is (1,−1). For χ^(1,0) the vector is (1,0,−1), equal to the three pairings; the opposite sign gives a different divisor. | Sound | None |
| 0.1: face projection versus face localization | Positive-ray chart k[t] | Closed orbit quotient sends t↦0 and gives k; zero-face open map sends t to an invertible t and gives k[t,t⁻¹]. Their targets have dimensions 0 and 1. | Sound | None |
| 0.2: weight set and membership equivalence | ℙ¹, d=2,−1; zero-cone fan | The two inequalities give 0≤u≤d: {0,1,2} for d=2 and ∅ for d=−1. With no inequalities the set is M, so for M=ℤ it contains −1 as well as 0. | Sound | None |
| 0.2: local Cartier translates and monoid action | ℙ¹, D=2D₋ | W₊=0+ℤ≥0, W₋=2+ℤ≤0. Adding 3 preserves W₊ but sends global weight 0 outside global {0,1,2}; thus no global chart-monoid action is inferred. | Sound | None |
| 0.2: principal translation | D=D₋ and m=1 on ℙ¹ | D+div(t)=D₊; W(D)−1={−1,0}=W(D₊). The inverse translation is +1; using +m in the forward map gives {1,2}, which fails. | Sound | None |
| 0.2: addition of admissible weights | D=E=D₋ on ℙ¹ | 0+1=1 and 1+1=2 both lie in W(2D)={0,1,2}; the endpoints give inequalities 0≤2≤2. | Sound | None |
| 0.3: support module, basis and equality | A=𝔽₂[ε]/ε², W={0,1} | Coefficients of 1+εt are (1,ε), distinct from (1,0); the two singleton basis elements remain independent. For A=0 the module has only 0, as does its section module. | Sound | None |
| 0.3: chart gluing and global sections | ℙ¹, O(2); Laurent overlap | The positive-chart support is u≥0 and the negative-chart support is u≤2; their intersection is {0,1,2}. Thus both glued sections and S_A(2D₋) are A³. | Sound | None |
| 0.3: coefficient change, identity, composition and tensor | ℤ→ℤ/4→𝔽₂, D=D₋ | Coefficient 3 goes 3↦3↦1, equal to the composite. A²⊗_A B=B²; the identity sends (a,b) to (a,b), including B=0. | Sound | None |
| 0.3: convolution target, associativity and unit | D=D₋; ℤ/4 and 𝔽₂ | (1+t)²=1+2t+t² over ℤ/4 and 1+t² over 𝔽₂, in S(2D). (χ⁰χ¹)χ¹=χ⁰(χ¹χ¹)=χ²; χ⁰ is the unit. Pointwise squaring would miss t². | Sound | None |
| 0.3: multiplication need not be a tensor isomorphism | O(1) on ℙ¹ over a field | Source dimension is 2·2=4; target dimension is 3. The nonzero tensor 1⊗t−t⊗1 maps to 0 (also nonzero in characteristic 2). | Sound | None |
| 0.4: invariant representative and rational equivalence | ℙ¹, a∈k× | div(t−a)=[a]−D₋, so [a] and D₋ both have class 1. On Gₘ, div(t)=0 because t is a unit. div(t²)=2D₊−2D₋ retains multiplicities. | Sound | None |
| 0.5: integral Cartier frames and transition cocycle | ℙ², D=D₃, v₃=−e₁−e₂ | On cones 12,13,23, frame weights are (0,0),(0,1),(1,0). Differences (0,−1)+(−1,1)=(−1,0) equal the direct difference; products of transition characters agree. | Sound | None |
| 0.5: integral unit norm and coefficient change | ℙ¹ overlap; frame change by t or ϖ | On the unit torus, ∣t∣=∣t⁻¹∣=1, so section bounds agree. ∣ϖ∣=r<1 and ϖ⁻¹ is not integral, so this changes the bound. Base extension keeps the exponent ratio t⁻ᵈ. | Sound | None |
| 0.5: line-bundle triviality and divisor multiplication | D=0 and D₋ on ℙ¹ | For D=0 both frames are 1 and transition is 1. Tensoring frames 1,t with themselves gives 1,t² and transition t⁻² for 2D₋. | Sound | None |
| 0.6: class-group presentation and its kernel | ℙ¹, affine plane, rank-one zero-cone fan | ℙ¹: u↦(u,−u), cokernel ℤ via sum. A²: (a,b)↦(a,b), cokernel 0. Zero-cone fan: ℤ→0 has kernel ℤ, so left injectivity is not asserted. | Sound | None |
| 0.6: regularity without completeness does not imply free Picard group | Fan with only 0 and rays (1,0),(1,2) | Both rays are primitive and regular. Pairing matrix has rows (1,0),(1,2), determinant 2; (0,1) is not in its image, but twice it is the image of (0,1). Hence Pic=Cl=ℤ/2. | Sound in package; source error | Record FS94 error below |
| 0.6: complete regular free quotient | Complete ℙ¹ and ℙ² fans | A maximal regular cone supplies a unimodular rank-n minor: 1 in rank 1, determinant 1 in rank 2. Cokernel ranks are 2−1=1 and 3−2=1, both torsion-free. | Sound | None |
| 0.6: field independence and power pullback | ℙ¹ over ℚ, 𝔽₂, 𝔽₃ and an inseparable extension | The same matrix (1,−1) gives class group ℤ in each case. Pulling O(d) through t↦t^(pᴺ) gives O(pᴺd), e.g. d=2,p=3,N=1 gives degree 6. | Sound | None |
| 1.1: Gauss completion and integral plus ring | Positive ray; f=1+ϖt, g=1−ϖt | Both norms are 1 and fg=1−ϖ²t² has norm 1, including characteristic 2. Coefficient ϖ⁻¹ has norm r⁻¹>1 and is excluded from the plus ring. | Sound | None |
| 1.1: chart identity and rank-zero boundary | Positive ray, zero cone in rank 1, rank zero | Algebras are K⟨t⟩, K⟨t,t⁻¹⟩, K. In the middle algebra t and t⁻¹ both have norm 1; t has no inverse in the disc algebra. Rank-zero chart is Spa(K,K°). | Sound | None |
| 1.1: face overlaps, gluing and field change | Two ℙ¹ charts | The overlap has ∣t∣=1 and t·t⁻¹=1 on both charts. Coefficient extension sends Σa_utᵘ to Σι(a_u)tᵘ and preserves the normalized Gauss values; transition exponents remain ±1. | Sound | None |
| 1.2: unit model versus full analytification | A¹ and ℙ¹, point t=ϖ⁻¹ | ∣t∣=r⁻¹>1 excludes this point from the disc. Its reciprocal coordinate has norm r<1, so the second ℙ¹ unit chart includes it. Rank-zero comparison is identity. | Sound | None |
| 1.2: complete regular need not be projective | Fujino–Sato/WeilConjectures seven-ray fan | Ten maximal-cone determinants are 1,−1,1,1,−1,−1,1,−1,1,−1; sphere f-vector (7,15,10) gives 7−15+10=2. Every edge has two adjacent cones on opposite sides. | Sound | None |
| 1.2 and 5.3: nonprojective fixture | Same fan, v₁=e₁,v₂=e₂,v₃=e₃; v₅=(−1,−1,0),v₆=(0,−1,−1),v₇=(−1,0,−1) | v₂+v₆=v₁+v₇=(0,0,−1); v₃+v₇=v₂+v₅=(−1,0,0); v₁+v₅=v₃+v₆=(0,−1,0). Strict ample inequalities for these three relations sum to 0>0, impossible. | Sound | None |
| 1.3: power morphism and functoriality | q=1,2,3; character χ² | Pullbacks give χ²,χ⁴,χ⁶; φ₂*φ₃*(χ²)=χ¹²=φ₆*(χ²). Coefficients remain fixed. q=0 would send boundary coordinate t to 1 and is excluded. | Sound | None |
| 1.3: divisor and field compatibility | A¹, q=2; coefficient a∈𝔽₄ with a²=a+1 | Pullback div(t)=D₀ becomes div(t²)=2D₀. φ₂*(a)=a, whereas absolute Frobenius sends a to a+1. Scalar extension and exponent doubling commute coefficientwise. | Sound | None |
| 2.1: perfected chart monoids and gluing | Ray, zero cone, rank zero | Exponent sets are ℤ[1/p]≥0, ℤ[1/p], {0}. Weight −1/p exists only in the torus case; weight 1/p exists in both positive-rank cases. Glued overlap retains inverse pairs. | Sound | None |
| 2.1: tower relation | n=0,1,2; χ¹ | pr_n* gives χ¹,χ^(1/p),χ^(1/p²). pr_(n+1)*φ*(χ¹)=χ^(p/p^(n+1))=χ^(1/pⁿ), exactly the claimed order of composition. | Sound | None |
| 2.1: fan maps and valued-field extension | Lattice map u↦2u and coefficient a | Either composite sends aχ^(u/pⁿ) to ι(a)χ^(2u/pⁿ); with u=1,n=1 both exponents are 2/p. Rank-zero projections are identity. | Sound | None |
| 2.2: perfected weights and divisorial module | ℙ¹, D=D₋; complete D=0; incomplete zero cone | Indices are ℤ[1/p]∩[0,1], {0}, and M[1/p], respectively. For p=2, weight 1/2 passes and 2 fails the first inequalities; constant-only description fails for the incomplete torus. | Sound | None |
| 2.2: c₀ support, coefficient equality and norm | Distinct weights 1/pⁿ with coefficients ϖⁿ | Norm is sup rⁿ; truncating after N has norm error r^(N+1)→0. Coefficient 1 at all these weights has infinitely many coefficients ≥1 and is excluded. | Sound | None |
| 2.2: dense span and complete-target extension | Evaluation at weight 1/p; identity into finite-support span | Evaluation has norm 1 on that singleton and 0 on other singletons and extends to c₀. Truncations above converge to an infinite-support vector, so their identity images cannot converge in the finite-support target. | Sound | None |
| 2.2: convolution, coefficient sum and boundedness | ℙ¹ D=E=D₋, δ₀ and δ₁ | δ₀*δ₁=δ₁ in Ŝ(2D), with coefficient sum 1 at weight 1 and 0 elsewhere; pointwise product is 0. Both product norm and product of norms equal 1. | Sound | None |
| 2.2: summability of infinite convolution | Coefficient norms rⁿ and rᵐ on distinct indices | A product coefficient can have norm ≥rᴺ only if n+m≤N; there are at most (N+1)(N+2)/2 such pairs for nonnegative n,m. Thus each output sum and the full product have c₀ tails. | Sound | None |
| 2.2: scalar monomials and admissibility | f=2χ⁰, g=3χ¹ over a characteristic-zero perfectoid field | Product is 6χ¹, supported in W(2D₋); ∥fg∥=∣6∣=∣2∣∣3∣. The weight inequalities add 0≤0≤1 and 0≤1≤1 to 0≤1≤2. | Sound | None |
| 2.2: clearing both weight and divisor denominators | p=2, D=(1/4)D₋, constant section | After one squaring the divisor is (1/2)D₋; after two it is D₋. For a+bt^(1/2), the square is a²+b²t in characteristic 2; no mixed term remains. | Sound | None |
| 2.3: cone and degree fibres | ℙ¹, D=D₋; j=1,0,−1 | 0≤u≤j gives fibre [0,1]∩ℤ[1/p], {0}, ∅. For D=0 the fibre is {0} for every j, including j=−1; hence the whole monoid is {0}×ℤ[1/p]. | Sound | None |
| 2.3: monoid addition and division by p | ℙ¹ D=D₋, p=2 | (0,1)+(1,1)=(1,2), with 0≤1≤2; (1,1)/2=(1/2,1/2), with equal bounds. A positive-degree truncation would wrongly discard (0,−1) for D=0. | Sound | None |
| 2.3: principal-cone isomorphism and grading | D=D₋, D′=D₊ on ℙ¹ | (u,j)↦(u−j,j) sends 0≤u≤j to −j≤u−j≤0, with inverse (v,j)↦(v+j,j). At (1,2), image is (−1,2); degree remains 2. | Sound | None |
| 2.3: complete degree zero versus incomplete | Complete ℙ¹ versus positive-ray fan, D=0 | Complete inequalities force u≥0 and −u≥0, hence u=0. A single ray imposes only u≥0 and admits u=1, so its degree-zero algebra is not K. | Sound | None |
| 2.4: graded Gauss algebra identification | ℙ¹, D=D₋ | (u,j)↦(u,j−u) maps Q_D to the perfected positive quadrant; inverse (a,b)↦(a,a+b). The monomial (1/2,1) maps to (1/2,1/2), degree 1 and norm 1 on both sides. | Sound | None |
| 2.4: homogeneous pieces and outer c₀ | D=0 on a complete fan | Each degree piece is K, but total algebra contains z,z⁻¹ and zz⁻¹=1; it is K⟨z^(±1/p∞)⟩. Coefficients 1 in all integer degrees have tail norm 1 and are excluded. | Sound | None |
| 2.4: product, scalar coefficients and norm | f=2χ^(0,1), g=3χ^(0,−1) | fg=6χ^(0,0); the character sum is 0 and the degree sum is 0. Norm is ∣6∣=∣2∣∣3∣; disjoint-support pointwise product is 0. | Sound mathematics; duplicate wording | R02 |
| 2.4: tilt and homogeneous sharp | Singleton degree 1; mixed characteristic p=2 | The exponent (u,1) stays (u,1), and coefficient a becomes a♯. For the constant homogeneous singleton, sharp preserves degree 1 and norm; (1+1)♯=0 differs from 2, so no additive algebra map is inferred. | Sound | None |
| 3.1: toric tilting and chart compatibility | Perfected disc, perfected torus, rank zero | The disc exponent set remains ℤ[1/p]≥0 and t remains noninvertible; the torus exponent set is ℤ[1/p] and t^(1/p)t^(−1/p)=1. Only coefficients change to K♭. In equal-characteristic rank zero the comparison is identity. | Sound | None |
| 3.1: plus rings and p-local divisor models | ℙ¹, D=(1/p)D₋ | Frame exponents 0,1/p and overlap ratio t^(−1/p) are unchanged under tilt; coefficient norms ≤1 on either side describe the two integral lattices. | Sound | None |
| 3.2: completed colimit and chart-density | Disc, monomials and infinite series | Level n contains t^(a/pⁿ), so their union contains every allowed singleton. The series with coefficients ϖⁿ at weights 1/pⁿ has truncation error r^(N+1), whereas the coefficient-one family has tail norm 1. | Sound | None |
| 3.2: integral lattice detection and residue relation | ϖ²t at any finite level; rank zero | Norm r² means membership in ϖ²A° and nonmembership in ϖ³A°; exponent rescaling leaves this unchanged. Rank zero has constant space and residue field K, whose image in itself is dense with error 0. | Sound | None |
| 3.3: inverse-limit map and inverse in characteristic p | Classical coordinate x; x=0,1 | If x_n=(x^(1/pⁿ))♯, then x_(n+1)^p=x_n. For x=0,1 all coordinates are 0,1 respectively. In a perfect characteristic-p field, the unique root gives the inverse to level-zero evaluation. | Sound | None |
| 3.3: strata and boundary | ℙ¹, x=0,∞, and nonzero torus point | The first two towers are constantly 0 and ∞; a nonzero torus coordinate has every root nonzero. Thus boundary inverse images are the matching strata, not their exchange. | Sound | None |
| 3.4: projective sharp well-definedness | [x₀:x₁], scalar λ≠0 | (λx_i)♯=λ♯x_i♯ and λ♯(λ⁻¹)♯=1; hence the images differ by a nonzero common scalar. For [1:0] and [0:1], images are identical coordinates. | Sound | None |
| 3.4: power commutation and field naturality | Coordinate x, exponent p, isometric embedding ι | π(x^p)=(x♯)^p=φ_p(π(x)); ι(x♯)=(ι♭x)♯. On 0 and 1 both composites have values 0 and 1; monomial χ² gives (x♯)² by both paths. | Sound | None |
| 3.4: nonadditivity negative control | p=2, [1:1:0]; equal characteristic control | Tilted polynomial sum is 0, whereas the mixed-characteristic sharp sum is 2. In equal characteristic both sums are 0. Finite-stage equations have exponents pⁿ, not an additive sharp substitution. | Sound | None |
| 3.4: surjectivity and continuity at level zero | Rank-zero point; ℙ¹ boundary; rational open | Rank zero maps its one point onto itself, and 0,∞ have displayed lifts. The inverse image of ∣t∣≤r is ∣t♯∣≤r, with 0 inside and 1 outside. Surjectivity is on adic points, not a claim that K♭-rational sharp is onto K. | Sound | None |
| 3.5: finite étale objects and constants | Algebraically closed rank-zero field; r=0,1,2 factors | Finite algebras K^r correspond to (K♭)^r: empty, singleton and two-point spectra. Constant Λ has respectively 0,1,2 independent section coordinates; tilting preserves these counts. | Sound | None |
| 3.5: inseparable tower versus étale branching | Characteristic-p torus, t↦t^p | k(t^(1/p))/k(t) has inseparable degree p and separable degree 1; one geometric point lies above each point. A separable degree-p cover would have p geometric lifts and is the wrong tower. | Sound | None |
| 3.5: full toric comparison is not unperfected perfectoidness | ℙ¹ unit chart K⟨t⟩ | The unperfected monomial exponents are nonnegative integers; t^(1/p) is absent. In the tower chart it is present and (t^(1/p))^p=t. The topos comparison does not erase this difference. | Sound | None |
| 3.6: restricted geometric morphism and square | U=∅ and U=AΣ,K | π⁻¹(∅)=∅ and π⁻¹(A)=A♭. Restriction gives respectively the empty-space topos map and the original global map; both square composites have these same domains and targets. | Sound | None |
| 3.6: moving finite-stage opens | U={∣t−ϖ∣≤r²}, t=ϖ, p=2 or 3 | At t=ϖ the left side is 0≤r². At φ_p(t), ∣ϖᵖ−ϖ∣=r>r². Thus U differs from φ_p⁻¹(U), as the construction allows. | Sound | None |
| 3.6: arbitrary-open gluing and base change | Union of rational opens; complement of infinity | Preimage distributes: π⁻¹(∪U_i)=∪π⁻¹(U_i). For U=ℙ¹∖{∞}, φ_p⁻¹({∞})={∞} and V is the same complement over K♭. Isometric extension keeps bounds r and r². | Sound | None |
| 3.7: full affine-line homeomorphism | t=ϖ⁻¹, x=0,1,∞ | The finite point has norm r⁻¹>1 and remains after deleting ∞; a disc would discard it. Towers of 0 and 1 are constant and retained; the constant ∞ tower is deleted. | Sound | None |
| 4.1: smooth proper specialization over valuation rings | ℙ¹ over nondiscrete K° and its residue field | On either fibre (H⁰,H¹,H²(Λ(1)))=(Λ,0,Λ); power pullback is (1,0,p). No DVR uniformizer/discreteness formula is used, so the nondiscrete algebraically closed case has the same values. | Sound | None |
| 4.1: automorphism, not identity; excluded coefficients | p=2, Λ=ℤ/3, and Λ=ℤ/2 in mixed characteristic | Top class 1 maps to 2 mod 3 and then back to 1; inverse is multiplication by 2. Mod 2 it maps to 0, so injectivity fails in the excluded range. | Sound | None |
| 4.1: higher dimension and rank zero | ℙ², p=2, Λ=ℤ/5; rank-zero point | On degrees 0,2,4 the multipliers are 1,2,4, all units mod 5. Rank zero gives Λ in degree 0 and 0 in positive degrees, with identity power map. | Sound | None |
| 4.1: relative versus absolute Frobenius | Toric chart over 𝔽₄, a²=a+1 | Relative Frobenius with the fixed-fan twist identification sends t↦t² and a↦a; absolute Frobenius sends a↦a+1. The coefficient-linear power map is the former. | Sound | None |
| 4.2: filtered colimit and level-zero isomorphism | ℙ¹ top class, p=2, Λ=ℤ/3 | Sequence is 1↦2↦1↦2. Identify stage n by multiplication by 2^(−n); all represented classes then agree, and the colimit is Λ. Quotient by p−1 would be Λ/Λ=0 and is wrong. | Sound | None |
| 4.2: cup product, pullback and equivariance | Unit 1 and hyperplane class h; toric power q=2 | 1∪h=h on both sides; π*(1∪h)=π*h. φ₂*h=2h, so both naturality composites give 2π*h. A field automorphism fixes the geometric hyperplane class in H²(Λ(1)). | Sound | None |
| 4.2: degree and coefficient scope | ℙ¹, i=−1,0,1,2,3 | Groups are 0,Λ,0,Λ(−1),0 on both sides. The result is finite Λ throughout; replacing Λ with an unprocessed inverse system is not one of these asserted equalities. | Sound | None |
| 5.1: section domain and rational exponent | f=t on the unit disc, r=1/4 | At t=0,1/4,1 the c=1 inequalities are 0≤1/4, 1/4≤1/4, 1≤1/4 (false). For c=1/2, t of norm 1/2 passes since its squared norm is 1/4. | Sound | None |
| 5.1: cofinality and finite intersections | Y={t=0}, neighbourhood ∣t∣<r; two coordinate equations | N₂ has ∣t∣≤r²<r, hence lies in the neighbourhood. For (t₁,t₂), taking max(c₁,c₂) imposes both individual bounds; at (0,0) both values are 0. | Sound | None |
| 5.1: all-rank valuation interpretation | Additive lexicographic valuation, v(ϖ)=(1,0), v(f)=(0,1) | For c=1 the condition is (0,1)≥(1,0), false. For f=0 its value is ∞ and every bound holds. No conversion to a real norm is required for this test. | Sound | None |
| 5.1: powers versus fixed radii | r=1/4, f=t, squaring | With threshold 2c=2, ∣t²∣≤1/16 iff ∣t∣≤1/4. Keeping c=1 instead allows ∣t∣≤1/2, so a point of norm 1/2 distinguishes the domains. | Sound | None |
| 5.1: scaling, integral frames and empty family | Multiply f by ϖ or an integral unit; s=0 | ∣ϖf∣≤rᶜ iff ∣f∣≤r^(c−1). A unit of norm 1 leaves the bound unchanged. Empty intersection is X, its common zero locus is X, and its only containing open in X is X. | Sound | None |
| 5.2: exact homogeneous approximation | f=χᵘ, g=χᵘ | The error is 0 and both truncated maxima are max(∣χᵘ∣,rᶜ); at a Gauss point they are 1. Multiplying a frame changes both valuations by the same norm-one transition. | Sound | None |
| 5.2: strict error gives equal truncated maxima | r=1/4, c=1, ε=1/2 | If ∣f∣=1/2, error≤1/4<1/2 forces ∣g♯∣=1/2, so maxima are both 1/2. If ∣f∣=1/16, error≤1/8 forces ∣g♯∣≤1/4, so maxima are both 1/4. | Sound | None |
| 5.2: excluding the zero approximant | f=ϖ²χᵘ, p=2, ε=1/2 | At c=0, g=0 gives r²≤r^(1/2), true. At c′>2, the same choice requires r²≤r^(5/2), false. For r=1/4 these are 1/16≤1/2 and 1/16≤1/32. | Sound | None |
| 5.2: bounded map from graded cone to chart | ℙ¹ D=D₋, (u,j)=(1/2,1) | On the positive chart exponent u−jm₊=1/2; on the negative chart exponent u−jm₋=−1/2, allowed by its opposite cone. Both singleton norms are 1 and both inequalities are satisfied. | Sound | None |
| 5.2: dense-field finite support and nonzero retention | A coefficient b with perturbation e satisfying ∣e∣<∣b∣ | Ultrametric equality gives ∣b+e∣=∣b∣>0. Tail and coefficient errors <rᶜ give total error <rᶜ; replacing all coefficients by 0 instead changes b by exactly ∣b∣ and fails the retention bound. | Sound | None |
| 5.2: clearing denominators over imperfect k₀ | g₀=a+bt^(1/p), b≠0; k₀=𝔽ₚ(s) algebraically | g₀ᵖ=aᵖ+bᵖt with bᵖ≠0 and coefficients still in k₀. It is a section of O(pD₋), while its divisor weight at infinity is p; no root of s is required in k₀. | Sound | None |
| 5.2: vanishing and containment after powers | g₀(x)=0; h=g₀^(pᴺ) | h(x)=0^(pᴺ)=0, and conversely a field value with pᴺth power 0 is 0. The preserved truncated bound then gives ∣f(πx)∣≤rᶜ, exactly the pulled-back section domain. | Sound | None |
| 5.3: nonempty proper hypersurface and class | ℙ² line, doubled line; rank zero | Classes are 1 and 2 in Pic=ℤ; after powering they are pᴺ and 2pᴺ, never 0. A nowhere-vanishing section would give class 0, impossible. Rank zero has no nonempty effective Cartier hypersurface input. | Sound | None |
| 5.3: completeness without projectivity | The smooth complete FS25 threefold | The fan's regular maximal cone has determinant ±1, so its class presentation has a free quotient. A nonzero effective divisor cannot be the divisor of a nonzero global regular function on a proper geometrically integral variety, whose global functions are k. | Sound | None |
| 5.3: repeated divisor and neighbourhood | Y: f²=0 versus f=0 | Supports agree, classes are 2D versus D, and bounds r^(2c) versus rᶜ agree after squaring. At fixed c the permitted norm changes from rᶜ to r^(c/2), so the normalization cannot be silently reduced. | Sound | None |
| 6.1: degree-zero balance and equality | ℙ¹ weights (a,b) | Balance is a−b=0; (1,1) gives 0 and (1,0) gives 1. Thus MW⁰≅ℤ with equal cone values; valuewise equality detects (1,1)≠(2,2). | Sound | None |
| 6.1: codimension indexing and rank zero | ℙ¹, j=0,1; rank-zero fan | For j=0 weights are on its two rays and have kernel ℤ; for j=1 the only cone is {0}, giving ℤ with no balance relation. Rank zero has just MW⁰=ℤ and evaluation 1. | Sound | None |
| 6.1: balance in rank two and basis change | ℙ¹×ℙ¹ rays; ℙ² rays | Product fan balance of (1,0,1,0) is (0,0); of (1,0,0,0) is (1,0). ℙ² balance is (c₁−c₃,c₂−c₃), so (1,1,1) gives (0,0). Negating a basis row negates its value without changing its kernel. | Sound | None |
| 6.1: singular complete fan remains admitted | Rays (1,0),(0,1),(−1,−2) | Balance is (c₁−c₃,c₂−2c₃); (1,2,1) gives (0,0), while (1,1,1) gives (0,−1). One cone has determinant 2, so this is a singular input still covered by operational Chow. | Sound | None |
| 6.1: Cartier wall sign and source translation | ℙ¹ O(D₋), positive annihilator b=1 | Section weights m₊=0,m₋=1 give m₋−m₊=1. Equation weights u₊=0,u₋=−1 give u₊−u₋=1. Both produce degree +1; reversing only one convention gives −1. | Sound | None |
| 6.1: field and orbit-splitting requirement | Spec ℂ over ℝ versus Spec k over k | Evaluation of operational 1 on the fundamental point has degree 2 over ℝ, so ℤ→ℤ is ×2 and not surjective. In the split rank-zero case it is ×1 and is an isomorphism. | Sound | None |
| 6.2: product and top evaluation | ℙ¹×ℙ¹; L=O(2,0), H=O(1,1) | Degree ad+bc gives 2·1+0·1=2. A ruling square gives 1·0+0·1=0; opposite rulings give 1. Pointwise multiplication of the ray weights would not give these degrees. | Sound | None |
| 6.2: displaced cones and index in a concrete product | ℙ² hyperplane weights; v=(1,2) | The contributing rays e₂ and −e₁−e₂ satisfy αe₂=v+β(−1,−1) with α=β=1. Their lattice index is 1, and all other ray pairs fail nonnegative intersection; degree is 1. | Sound | None |
| 6.2: quotient lattice and nontrivial multiplicity | Rank-two ray γ; primitive vectors (1,0),(1,2) | N/N_γ has rank 1, whereas N_γ projects to 0 and cannot furnish a generic nonzero displacement. The two displayed vectors have determinant 2, so their finite lattice index is 2, not 1. | Sound | None |
| 6.2: field independence and boundary product | Same product over characteristics 0,2,3; rank zero | O(2,0)·O(1,1) has integer degree 2 in every case; this integer is not reduced mod the field characteristic. The rank-zero empty product evaluates on Spec k to 1. | Sound | None |
| 6.3: positive initial intersection | Two distinct lines on ℙ²; line and conic; two ruling fibres as one divisor | Degrees are 1,2, and H·(F₁+F₂)=1+1=2 respectively. The last divisor has two disjoint components; positivity does not give connectedness. | Sound after wording repair | R01 supplier; R03 wording |
| 6.3: fibre-class wording negative control | Two fibres versus two divisors each of class (2,0) | Two actual fibres have classes (1,0)+(1,0)=(2,0) and degree 2. Two divisors each labelled (2,0) have total (4,0) and degree 4. | Ambiguous original Check | R03 |
| 6.3: powered classes and c=0 | ℙ² two line classes, p=2,N₁=1,N₂=2; rank zero | Degree changes 1↦2¹·2²=8, equal to p^(N₁+N₂)δ. For c=0 on ℙ² with H=O(1), δ=1; for rank zero the empty product has degree 1. | Sound | R01 supplier |
| 6.3: refined support in excess intersection | s=(ℓ,ℓ) on ℙ² | Z(s)=L has dimension 1, but localized class is c₁(O(1)∣_L)∩[L] in CH₀(L), degree 1. Pushforward is h²∩[ℙ²], also degree 1. CH₀(∅)=0 cannot support it. | Sound | None |
| 6.3: arbitrary sections and nonreduced inputs | Zero sections of O(1)²; square of a line equation | For the zero pair support is all ℙ² and top Chern degree remains 1. A double line has generic length 2 and ample degree 2. Neither excess dimension nor nilpotents forces the degree to vanish. | Sound | None |
| 6.3 and positivity supplier: zero-dimensional fields | Closed point of residue degree p, including inseparable | The empty Chern product evaluated on that point has degree [κ(x):k]=p>0. For Spec k itself it is 1. AbelianSchemesAndArithmeticModuli A2.7 supplies these values without a perfect-field assumption. | Sound mathematics; ownership duplicated | R01 |
| 6.4: exact equation count and dimension | Distinct versus identical lines on ℙ² | Distinct lines: c=2, codimension 2, output dimension 0. Identical lines: two equations but codimension 1, so they fail the stated c=codim(Y) input condition. A hypersurface has c=1, dimension 1. | Sound | None |
| 6.4: generic cuts and nonemptiness | Excess W of dimension 2; target dimension 0 | A hyperplane cut of ℙ² is ℙ¹ of dimension 1; a further generic cut is a nonempty point of dimension 0. Degrees against the relevant ample powers are 1 at both stages. A cut containing W would leave dimension 2 and is excluded. | Sound | R01 supplier |
| 6.4: boundary and disconnected output | c=0; union of two fibres | With c=0, Y=X and Z₀=X over k₀, both dimension n. For the union, c=1 and both components have dimension 1; output dimension is 1, not 0. Connectedness is not claimed. | Sound | None |
| 6.4: imperfect-field model versus geometric reduction | k₀=𝔽ₚ(t), equation xᵖ−t | Over k₀ the coordinate ring is a field of degree p and is reduced. Over k₁=k₀(t^(1/p)), it is k₁[x]/(x−t^(1/p))ᵖ of length p; reduction has length 1. Both dimensions are 0 and supports coincide. | Sound | None |
| 6.4: perfect-field and dense-field qualifications | Perfect k₀; a finite candidate dense subfield | For perfect k₀ the preceding pth root already lies in k₀, so the reduced equation is linear and remains reduced after extension. A finite subfield is a finite closed subset of a Hausdorff valued field and cannot be dense in the infinite nontrivially valued K♭. | Sound | None |
| Declared split-torus divisor contract | k[M] for M=0 or ℤ | M=0 gives k and Cl(k)=0. For M=ℤ, t·t⁻¹=1 and a tᵘ is a unit for a≠0; 1+t has a zero at t=−1 and is not a unit. Laurent divisor classes vanish. | Sound owned extension | None |
| Declared generic-cut contract on nonreduced W | Double line in ℙ², dimension 1 | A line avoiding that support component cuts a length-2 zero-dimensional scheme, nonempty of dimension 0; passing to the reduction changes length 2→1 but not dimension. This distinguishes cutting from discarding nilpotents. | Sound owned extension | None |
| Convention and carrier scope: denominator and index junk | q=0, n=0, out-of-range codimension, empty covering | q=0 and j>n are excluded by explicit inequalities; n=0 has determinant/empty product 1. All fractional bounds have b>0 and ϖ≠0. An empty family covers only ∅, not the nonempty rank-zero point. | Sound | None |

The table contains 117 computed rows covering the 29 target subsections, their distinct API assertions, the standing conventions and all Check patterns. The finite algebraic computations include the full FS25 cone list 123, 127, 136, 167, 235, 257, 356, 456, 457, 467, with v₄=(−1,−1,−1), in the order of the determinant row. The fifteen adjacent-cone side products are all −1.

All sixteen defect classes were considered: the generality and degeneracies are in the rows; signs and map directions have explicit witnesses; ownership, forward dependencies and supplier drift have the resolved tables; definition discrimination, API coverage, locators and style were inspected throughout; signatures and padding have an empty declaration inventory rather than a surrogate theorem. No additional unused-hypothesis finding is asserted. These targets concern lattices and split tori, not arbitrary discrete groups, so S₃ and Q₈ are outside their carriers. The solvable-group gap expressly requires split orbit strata; the nonsplit degree-two point is its negative control. No restriction on field cardinality is hidden in the universe convention.

## Not verifiable

- No requested source text or seeded locator was inaccessible. All four cached sources and all cited supplier locations were readable.
- Fifteen board entries have a design README but no package README at the listed head. Their available designs were inspected; nonexistent package contents cannot be reviewed. This is not evidence that the roadmap is absent.
- The seven remaining supplier extensions are precise declared contracts, not implemented results verified by this package's Lean elaboration. Their implementations remain outside this package review. Acceptance after R01 would remain conditional on those seven slugs.

## Source issues

- **Misprint** in SCH12 at Definition/Proposition 8.4, printed p. 304 (SCH12 line 2382): the source says the ray chart has torus exponent k−1, where k denotes the field; it should be rank(N)−1; affects nothing.
- **Misprint** in SCH12 at the proof of Proposition 8.7, printed p. 306 (SCH12 line 2481): the source says two integral trivializations differ by a scalar unit of K°; it should be a unit of the integral structure sheaf on the overlap, whose valuation is one; affects nothing.
- **Misprint** in SCH12 at the proof of Proposition 8.7, printed p. 306 (SCH12 line 2489): the source says the finite-support degree-one approximation satisfies bounds involving an unbound j; it should be the degree-one inequalities with j=1; affects nothing.
- **Misprint** in SCH12 at the proof of Proposition 8.7, printed p. 306 (SCH12 line 2491): the source says the powered equation is a global regular function on the proper toric variety; it should be a section of O(pᴺD); affects the proof.
- **Gap** in SCH12 at the proof of Corollary 8.8, printed p. 307 (SCH12 lines 2501–2506): the source says positive combinatorial complete-intersection degree forces the approximating intersection nonempty without addressing possible excess intersection; it should be justified by a refined top-Chern class supported on the common zero scheme, with the same positive ample degree; affects the proof.
- **Misprint** in FS94 at Theorem 3.2, printed p. 11 (FS94 line 400): the source says generic displacement avoids subspaces in N_γ; it should be in N, or in N/N_γ after passing to the quotient fan; affects nothing.
- **Misprint** in FS94 at the proof of Lemma 3.4, printed p. 12 (FS94 line 442): the source says the codimension-one argument proves Lemma 3.3; it should be Lemma 3.4, since 3.3 is an example; affects nothing.
- **Error** in FS94 at the paragraph after Corollary 1.2, printed p. 4 (FS94 lines 132–134): the source says smooth toric varieties have free abelian Chow groups without requiring completeness; it should be restricted to complete smooth toric varieties: the incomplete regular two-ray fan computed above has CH₁≅ℤ/2; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "10a4560bf2c90ac9c73740c58a8cd742171a6719", "job": "REV-PKG-AnalyticToricGeometryPartII~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
