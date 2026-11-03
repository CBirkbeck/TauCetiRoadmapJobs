# Review of GlobalShtukasAndFunctionFieldLanglands (pull request #1490 at c0563df)

**Verdict:** needs changes

## R01 (P2) — Retire the four redundant supplier-gap requests

**Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/design/plan.json:4`, 10, 16, 22; `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:29`, 139, 460, 1056, 2088. “The elliptic-sheaf carrier and its comparison with one-leg shtukas belong to §2.7.”

**Claim:** Previous R01 is not repaired. The four active gaps still request constructions assigned to this roadmap or supplied already. Their slugs are also absent from Exact supplier contracts. These are redundant requests, not legitimate additional prerequisites whose future delivery prevents acceptance.

**Witness:** Sections 0.13, 2.7 and 7.6 own volume, elliptic chains and ordinary-centre restriction. SmoothRepresentationsOfLocalGroups SR.5.2, *classical-llc-normalization*, owns rec; §7.11 owns its additional equal-characteristic comparisons.

**Exact repair:** Retire `classical-centre-restriction`, `equal-characteristic-glr-correspondence`, `elliptic-sheaf-carrier` and `function-field-sl-volume` from the active package gaps. Keep the existing mathematical targets and supplier assignments: §0.13, §2.7, §7.6, and the rec adapter/pair-factor comparisons of §7.11. Synchronize the package record with that ownership; do not request a second construction of rec.

**Repair test:** Each object still has an owner: SL₂ over F₃(t) has product-Haar quotient volume 1/16; rank 2 at a degree-2 pole has period 4; the completed function with coefficients λʲ has unbounded support and is excluded by §7.6; the duality adapter sends geometric Frobenius 2 to rec-value 2. No target disappears. The older FIX-RT~1 dispositions F10/F17 concerned missing supplier inputs. This finding concerns the later, explicit local ownership and the now-redundant live requests; it does not ask those unavailable suppliers to finish work.

## R02 (P3) — Register the three additional references

**Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/sources.toml`; `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:476`, 1077, 1368, 2255, 2280, 2282. “YZ-I Definition 4.1 and Lemma 4.2, pp. 22–23.”

**Claim:** Previous R02 is not repaired. Sp, Harder and YZ-I are absent from the 28-entry manifest, although all three are cited. The YZ entry is the second paper, not the first paper under another name.

**Witness:** Manifest searches by key, author, title and identifier find no entries for these works. YZ-I line 1262 defines the Eisenstein kernel; line 1271 states surjectivity.

**Exact repair:** Add one record per work under the README keys Sp, Harder and YZ-I, retaining their cited versions and locators and recording legal retrieval metadata. Keep YZ separately: 1512.02683v3 and 1712.08026v2 are different papers.

**Repair test:** Sp supplies the matrix-order/elliptic-chain comparison, Harder the SL_r volume route, and YZ-I the rational Satake–Picard map. All three were retrieved through the sources service and their relevant text opened in this review. This repair requires metadata, not a new source-access request. The manifest was not edited during review.

## R03 (P3) — Cite the Lang-fibre construction at its actual locator

**Location:** `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:522`. “Chapter VI §1d, remark after Theorem VI.9, p. 158; §1e, proof of Proposition VI.11, p. 159.”

**Claim:** These locators discuss the rank-one reciprocity correspondence, which the target explicitly imports. They do not give the Lang-isogeny description that §0.15 adds.

**Witness:** LL line 9106 identifies rank one with class field theory; line 9149 recalls finite-order characters. The geometric Lang pullback instead appears at LL line 9634, remark after Proposition VI.15(iii), p. 168.

**Exact repair:** Cite the remark after VI.15(iii), p. 168, for the rank-one shtuka/Lang pullback, and retain VI.9/VI.11 only for reciprocity. Keep the Picard-stack and connected Lang-theorem suppliers for the stack and general finite-leg extension; the two-leg source alone is not a proof of every stack-level assertion.

**Repair test:** On P¹/F₃ the Pic⁰ Lang kernel has order 1, the full Picard kernel has one component in each integer degree, and quotienting degrees by dZ leaves d components. This agrees with the finite-cover description after a central quotient, without wrongly calling the whole Picard Lang map finite.

## Previous findings

The supplied change record has zero changes since the previous review, which read this same head. Both findings were checked before the wider review:

- Previous R01 — **not repaired**. The plan still contains all four requests. The README still says “The function-field SL_r volume and its Tamagawa normalization belong to §0.13” and “The comparison with the ordinary smooth Bernstein centre is a separate target of this section.” The ownership conflict persists as R01.
- Previous R02 — **not repaired**. The references still name “Twists of Drinfeld–Stuhler modular varieties”, “Chevalley groups over function fields and automorphic forms” and “Shtukas and the Taylor expansion of L-functions”; none has a matching manifest entry. Repeated as R02.

## Verified sound

This is a fresh review of the whole folder: 92 numbered targets in eight layers, the conventions, worked examples, supplier contracts and the complete Lean file. The numerical and model tests below are diagnostics, not proofs of the geometric theorems. No PR file was changed. No route-specific good-place restriction replaces the all-place theory, and no computational algorithm, copied source passage, sorry'd data or option override was found.

### Gate, build and form

The worker's supplied gate, including its targeted build, passed:

```text
gate GlobalShtukasAndFunctionFieldLanglands: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The independently executed dependency command returned:

```text
depcheck: 204 roadmaps, 1641 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Direct `lake env lean` elaboration of `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean` also exited 0, with no output or warnings. The inspected head matches the requested commit; the outside-folder diff is empty.

The 34-line Lean file has one Mathlib import, one module docstring, the prescribed namespace and **zero declarations**. There are therefore zero elaborated declaration signatures to compare and zero sorried theorems on which to run a one-tactic probe. No placeholder replaces a headline. The README has the prescribed summary, scope, conventions, supplier contracts, build order, layer examples/dependencies and references. Definition sections have API descriptions and at least three Checks; theorem-only sections also have the layer examples. Main-branch AlgebraicCurves and AlgebraicVectorBundles were read for shape.

The headline inventory is: bundle masses and SL_r volume (§0.13); rational, integral and arithmetic Satake (§§1.7–1.14); global shtuka geometry, truncations and compact cohomology (§§2.1–2.5); elliptic sheaves (§2.7); Eichler–Shimura (§3.7), integral cusp and local-Hecke finiteness (§§3.10–3.12), PGL₂ Eisenstein decomposition (§3.11); Drinfeld descent and ind-smoothness (Layer 4); split, nonsplit and modular excursion decompositions (§§5.7–5.11); companions and GL_r comparison (Layer 6); local parameters, local–global compatibility, gamma factors and the ramified GL_r comparison (§§7.6–7.11). The docstring names these and their missing actual carriers. The pinned representation category alone does not make geometric Satake statable; schemes and abstract descent alone do not supply the cohomology of algebraic moduli stacks.

### Seeded source sample

All **15** requested targets were checked against the cached text of the cited version, including hypotheses and page/theorem numbering. No additional target is marked unverified in the README. The following are source-text checks, separate from the computed tests below.

| Target | Text opened and locator | Result |
|---|---|---|
| 0.4 Iwahori flags and fractional twists | YZ lines 1061–1163; Definition 3.1 and §§3.1–3.1.3, pp.17–19 | Positive rank, full periodic flag, graph/residue-field sections and fractional rotations are retained. Full level is not confused with a flag. |
| 0.7 Adelic bundle groupoids | VL lines 6267–6279, Remark 8.21, pp.116–117; lines 8319–8352, Remark 12.2, p.150 | Split single-component description and the nonsplit union over ker¹ are distinguished, including automorphisms and local levels. |
| 0.12 Nonsplit bundle descent | VL lines 8319–8352, Remark 12.2, p.150 | Pure inner forms, finite ker¹ and local triviality support the rational-points description. The general smooth-model gluing is an owned descent extension, not a claimed finite constant splitting of the model. |
| 0.13 Bundle/torsion masses | Sch lines 1015–1043, Theorem 4.1, pp.316–317; lines 3259–3318, Appendix A, p.356; Harder lines 1771–1823 and 1955–1991, §3, pp.298–305 | Positive-rank fixed-degree formula, torsion plethystic series and convergence agree. Harder works with simply connected semisimple Chevalley groups and concludes Tamagawa number 1; SL_r is in that scope. The product-Haar normalization is kept separate. |
| 0.15 Picard Lang fibres | LL lines 9106–9111 and 9149–9152, pp.158–159; lines 9634–9641, p.168 | Mathematical connected-component restriction is sound; the supplied geometric locator needs R03. |
| 1.5 Fusion smallness | Var lines 1310–1340, Lemma A.12 and Proposition A.13, pp.35–36 | Global convolution is small, the fixed collision fibre semismall, and disjoint-leg convolution an isomorphism. No smallness claim is imposed on every local fibre. |
| 2.10 Coalescence | VL lines 3704–3764, Proposition 4.12 and Proposition 4.14, pp.69–70; lines 7344–7367, Proposition 9.7, p.132 | Arbitrary maps of finite leg sets, composition, relative IC normalization and grouped partial Frobenius agree. No extra shift is inserted on a diagonal. |
| 3.6 Hecke from Frobenius | VL lines 3965–4050, equations (6.2)–(6.5), Proposition 6.2, pp.74–75; lines 4608–4640, Lemmas 6.11–6.13, p.86; lines 8842–8868 and 9022–9039, §12, pp.161–165 | The creation/Frobenius/annihilation calculation uses deg(v) iterations, geometric normalization and changing HN bounds. The nonsplit comparison uses the local L-group and projector, rather than an arbitrary global induced representation. |
| 4.2 Lisse Drinfeld lemma | VL lines 5755–5785, Lemma 8.2, p.107; lines 5998–6027, Lemma 8.12, pp.112–113 | Finite O_E modules may have torsion. Partial Frobenius and extension across the chosen product open are hypotheses, not automatic properties of an arbitrary constructible sheaf. |
| 4.5 Finite lisse envelopes | VL lines 6424–6468, Proposition 8.27 and Remark 8.28, pp.119–120; lines 6477–6535 and 6591–6668, proof, pp.120–123 | The finite recurrence box yields a finite O_E envelope; its product open can depend on the envelope. Restriction to the original dense open is not a claim that it was already a product. |
| 4.6 Hecke-finite specialization | VL lines 6672–6686, Proposition 8.31, p.123; lines 6766–6803, Proposition 8.32, p.125; lines 6955–6978, Corollary 8.34, p.127 | Image containment and injectivity combine into the Hecke-finite isomorphism. Arbitrary constructible specialization is not asserted to be invertible. |
| 4.7 Product Galois action | VL lines 6424–6468 and 6477–6535, Proposition 8.27/proof, pp.119–121 | The union of stable finite lisse envelopes gives a continuous product action. Finite rational dimension and integral lattice stability are not conflated. |
| 5.2 Invariant-function indexing | VL lines 7774–7799, Lemma 10.6 and proof, p.138 | The regular bi-invariant quotient function is represented by a diagonal-invariant matrix coefficient; the operator depends on that function. The second variable is inverted. |
| 5.7 Global excursion algebra | VL lines 7754–7773, Notation 10.5, p.137; lines 7973–7988, Remark 11.6, pp.142–143 | Finite commutative algebra on finite-dimensional cusp space, hence primary decomposition. The source's reducedness argument is for the spherical subalgebra, not the whole excursion algebra. |
| 7.6 Bernstein centre parameters | GeL lines 193–247, Theorem 1.1 and Remark 1.2, pp.5–6; lines 308–310, Remark 1.5, p.8; lines 1468–1499, Remark 6.3, pp.39–40 | Integral parameters extend to Galois; arbitrary ones are Weil parameters. A uniform support theorem, not merely compatibility of completed corners, supplies the ordinary centre. The README explicitly owns the geometric uniform-modification step described in the source. |

Additional source checks cover the repaired rational Satake/Picard normalization (YZ-I lines 1229–1277, §§4.1.1–4.1.2, pp.22–23), elliptic-sheaf matrix-order comparison (Sp lines 1138–1143, Remark 4.3(b), p.622), and the source corrections listed below. No new inaccessible reference was found.

### Suppliers, ownership and pinned APIs

The 22 named roadmap contracts were resolved against main where the roadmap exists there, otherwise its indexed new-roadmap head. The object searches used `roadmaps grep` and the supplied package/main/open-checkout files. Twenty-seven supplier/overlap texts were located; the consumed sections and ownership boundaries were read. The table gives repository-relative witness locations, not guesses from roadmap names. Every target's `*Needs:*` line was read, including the distinctions between scheme and stack operations, rational and integral coefficients, and global and local Frobenius conventions.

| Supplier README | Resolved sections and ownership |
|---|---|
| `TauCetiRoadmap/ReductiveGroups/README.md:129`, 176, 234, 432, 466, 627, 1023, 1092 | Functors of points, comodules, quotients, tori, central isogenies, root data and pinned integral groups; these are inputs, not reconstructed here. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2071`, 2502, 2589, 2745, 2817, 2843, 2951, 4937, 5066, 5135, 5194, 5244, 5706 | Descent, torsors, algebraic stacks, Picard gerbe, deformations and Quot. Picard-stack automorphisms are units; a product with B G_m needs a splitting. Noetherian Quot charts suffice for the finite-type atlases used here. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` §§F.0–F.2, F.8, F.10, G.1–G.3 | Constructible/lisse scheme coefficients, base change, ULA, compact support, integral p/p⁺ convention, traces and compactifications; the stack extension remains §1.4. |
| `TauCetiRoadmap/AlgebraicVectorBundles/README.md:215`, 228, 254, 269, 290, 306, 340 | L0A–L2B module sheaves, finite locally free sheaves, exterior powers, relative Spec and geometric bundles. |
| `TauCetiRoadmap/AlgebraicCurves/README.md:403`, 455, 478, 520, 578, 624, 1468 | Layers 0–5 and 12 supply function fields, places, divisors, Riemann–Roch and the curve dictionary. |
| `TauCetiRoadmap/JacobianChallenge/README.md:218`, 448 | Relative Picard/Jacobian and Abel–Jacobi. The degree-one Picard torsor avoids assuming X has a rational point. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2312`, 2318, 2324, 2334, 2344, 2354, 2364, 2374, 2458 | AL.3.10 owns additive analysis, reciprocity, local pair factors, vector-bundle HN theory, two-leg shtukas and the GL_r correspondence. This roadmap adds general G, many legs and explicit two-leg comparisons; it does not rebuild the essential-cohomology proof. The arithmetic/geometric inversion agrees. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1093`, 1117 | Bun_G for an everywhere reductive quasi-split model and the unramified local loop quotient. The general smooth model and moving-leg family are specified extensions. |
| `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:668`, 1158, 1659, 1786, 2065, 2331, 2451, 2546, 2785, 5106, 5524, 6218, 6283, 6562, 6934 | Duality, integral tilt, IC, smallness, weights and correspondences. Integral duality exchanges p and p⁺; the target does not silently use field self-duality over O_E. |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3052` | Oriented products and modification/base-change theorem, qcqs irreducible base, finite presentation and invertible torsion coefficients. A modification may depend on the coefficient complex. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:748`, 774, 1565, 2196, 2254, 2308, 2866 | Finite-field weights, twists, finite geometric rank-one monodromy, direct-image bounds and finite-type DM coefficient descent. General Artin-stack operations are not imported from the DM result. |
| `TauCetiRoadmap/FunctionFieldArithmetic/README.md:515`, 719, 1726, 1807, 2019, 2108, 2159, 2204, 2252 | Picard points, self-dual measure, zeta, degree-sensitive Chebotarev, adelic groups and cusp modules/finiteness. The central quotient finiteness and p-invertibility hypotheses are retained. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:2074`, 2245 | Function-field ideles and Brauer invariant sum; the inner-form test uses sum 1/2+1/2=0 in Q/Z. |
| `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1114`, 1128 | Neutral Tannakian reconstruction; exactness, faithfulness, rigidity and ordinary symmetry are supplied by the Satake targets before using it. |
| `TauCetiRoadmap/LanglandsParameterStacks/README.md:135`, 456, 682, 703, 713, 723, 741, 757, 807, 827, 838, 848 | Crossed cocycles, WD parameters, excursion relations, prescribed finite projection, reconstruction and continuity. Only their geometric realization and global continuity are new here. |
| `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:883`, 1951 | Trace determines determinant only when d! is invertible; semisimple field reconstruction is imported. Integral Eichler–Shimura uses exterior powers instead. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md:5201`, 6724, 6931 | Connected Lang surjectivity and the full based-root-datum L-group. The torus lattice cannot be replaced by its empty Dynkin diagram. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:838`, 1268, 1872, 2001, 2526, 2665, 3146, 4401, 4432, 4518, 4624, 4652 | Smooth categories/centres, induction, Satake, segments, WD duality and classical rec. §7.11's coefficient/duality adapter differs from importing a new local correspondence. Confirms R01. |
| `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:317` | Trait nearby cycles; not substituted for the higher-dimensional modification/composition argument. |
| `TauCetiRoadmap/RelativeFarguesFontaine/README.md:2170` | §6.5 Beauville–Laszlo module gluing, with its gluing-pair hypotheses. |
| `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:601` | Coherent Grassmannians and flag bundles; the periodic Frobenius chain is owned here, not already included in a generic flag functor. |
| `TauCetiRoadmap/GeometricSatakeAndFusion/README.md:801` | Ordinary reduced local Schubert models and finite-jet comparison, before perfection. This roadmap adds the multi-leg curve collision family and finite-field Satake. |

The additional overlap checks resolved `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:1323`, 1789, 1844 (local towers/completed cohomology), `TauCetiRoadmap/SheafTheoreticSmithTheory/README.md:87`, 627, 1174 (consumes the finite-extension Satake and extends coefficients/geometric fields), and `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:81`, 85 (consumes the mass identities here). Their directions of supply agree. AdelicAlgebraicGroups §§2.4 and 3.1 are not mistaken for a function-field SL_r volume theorem. Package designs for later consumers were searched as well. No additional same-object owner requiring removal was found; there are no Lean declarations here that could collide by fully qualified name.

All four package gaps have named suppliers and mathematically precise subjects. They fail minimality/ownership agreement for the reasons in R01, not because a supplier's future theorem is unfinished. No newly discovered missing prerequisite or upward edge is asserted.

The pins in `lake-manifest.json` match Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. **Eighteen named declarations in fifteen files** were opened:

| Pinned file/line | What the declaration actually supplies |
|---|---|
| `Mathlib/AlgebraicGeometry/Scheme.lean:40` | `AlgebraicGeometry.Scheme`: locally ringed space with local affine presentations. No smoothness, separation, finite type or nonemptiness field. |
| `Mathlib/CategoryTheory/Sites/Descent/DescentData.lean:59`; `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49` | `Pseudofunctor.DescentData` has objects and compatible arrows; `IsStack` adds effective descent over covering sieves. Neither supplies an algebraic atlas. |
| `Mathlib/CategoryTheory/Galois/Basic.lean:412` | `GaloisCategory` asserts existence of a finite-set fibre functor; it is not a chosen geometric fibre functor. |
| `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:60` | `ExteriorAlgebra` is the zero-quadratic-form Clifford algebra over a commutative ring. |
| `Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`, 89 | `LinearMap.charpoly`, `aeval_self_charpoly`, with finite free module hypotheses. These do not supply the geometric Frobenius/Hecke relation on unbounded cohomology. |
| `Mathlib/RingTheory/Finiteness/Defs.lean:46`, 121 | `Submodule.FG` is finite span; `Module.Finite` is FG of top. Neither says a chosen Hecke operator preserves the generators. |
| `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:32` | `Algebra.adjoin`: least subalgebra containing the given set, not an assertion that its underlying module is finite. |
| `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71`; `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean:74`; `Mathlib/LinearAlgebra/Eigenspace/Pi.lean:194` | `genEigenspace` is the union of the appropriate iterated kernels; the two named spanning theorems require finite dimension, individual generalized-eigenspace spanning, and pairwise commutation for the simultaneous theorem. |
| `Mathlib/CategoryTheory/Limits/Indization/Category.lean:70` | `CategoryTheory.Ind` has its larger object universe and shrunk morphisms; it does not bound ranks of all stages. |
| `Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:45`; `Mathlib/CategoryTheory/Abelian/SerreClass/MorphismProperty.lean:65` | `ObjectProperty.IsSerreClass`, `isoModSerre`: closure under subobjects/quotients/extensions, and the kernel/cokernel condition. The geometric localization and calculus remain a target. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean:216`, 231 | `FGPointRepresentationCat`, `fgPointRepresentationCategoryEquivalence`, over a commutative Hopf algebra. Finite generation becomes finite dimension over E; this is the representation side, not the perverse-sheaf side. |

Object searches at both pins for shtukas, affine/Beilinson–Drinfeld Grassmannians, perverse/lisse étale coefficients, Bernstein centres, WD parameters and automorphic cusp spaces found no missing-carrier assertion contradicted by a native declaration. The shtuka search hits in Witt-vector/Fargues–Fontaine files are titles of Kedlaya references, not definitions of shtuka stacks. The actual native scheme/descent/representation carriers above were distinguished from the unavailable geometric structures.

### Computed adversarial table

The table has 103 computed rows covering all 92 numbered targets and the standing conventions. Each numbered target has a row. “Retain” means the stated hypotheses and construction survive the displayed instance, not that a numerical test proves the theorem. Extra rows expose independent normalization and source-error tests. Integer degrees, nonzero ranks, nonzero torsion coefficients, q≥2, ℓ≠p and finite-type charts are used as stipulated; forbidden q=1 and torsion exponent 0 are tested as negative controls, not silently substituted into the theorems.

| Statement | Instances tried | Computed values / comparison with wrong model | Result; change |
|---|---|---|---|
| Conventions: Frobenius/Artin | G_m, q=3, ℓ=5, χ(ϖ)=2; degrees 1,2 | Geometric values 2,4; arithmetic 1/2,1/4. Inversion gives χ(ϖ)=2 on both sides. | Retain. |
| Conventions: signs/half twists | GL₂ minuscule, q=3; q=9 at degree 2 | IC trace −1/√3 versus normalized +1/√3; sign −1 converts them. √9=3 and its square is 9. | Retain. |
| Conventions: coefficient boundaries | p=3, ℓ=2, s=1 versus 0; q=1 | 3 is a unit mod 2; O/λ has length 1, O/λ⁰ has length 0; q−1 would be 0 at q=1. | Excluded cases are explicit. |
| 0.1 Bundle stack | G_m on P¹/F₃; its one-point dilatation | Each ordinary line has 2 rational automorphisms; a line with prescribed fibre trivialization has 1. The nonparahoric smooth model gives the second stack. | Retain general models. |
| 0.2 Deformations | Trivial line on genus g curve; P¹ | h¹−h⁰=g−1; on P¹, 0−1=−1, not Picard-scheme dimension 0. H²=0. | Retain Euler characteristic. |
| 0.3 Full level | G_m, F₃[t]/t² versus F₃; empty level | Unit counts 6 versus 2; empty-level restriction has one trivialization. Reduction forgets a factor of 3. | Retain nilpotents. |
| 0.4 Flags/fractional twists | Ranks 1,2; degree-2 pole | Rank 1 has no proper flag. Two rank-2 rotations at a chosen graph add total degree 2; a degree-2 closed pole has two geometric graph sections. | Retain graph-sensitive twists. |
| 0.5 Slopes/Euler form | P¹, O and O(1); nonzero torsion | χ(O,O(1))=2, reverse χ=0; torsion has rank 0 and slope +∞, not 0/0. | Retain order and torsion convention. |
| 0.6 Bounded loci | G_m and nonsplit norm-one torus, bound b | Faithful representation keeps 2b+1 geometric degrees; adjoint bound keeps all integers. For the nonsplit torus Frobenius sends d to −d, so only d=0 is rational. | Retain distinction from shtuka finite type. |
| 0.7 Adelic groupoids | G_m, P¹/F₃, degree d | One double coset per degree; stabilizer size 2, matching Aut(O(d)); replacing groupoid by set changes mass 1/2 to 1. | Retain stabilizers. |
| 0.8 Shifted HN | Shift tuple (3,2,0), rank interval (1,3], degree 4 | (4−(2+0))/2=1; subtracting the wrong initial shift gives (4−(3+2))/2=−1/2. | Retain interval indexing. |
| 0.9 Parabolic instability | PGL₂ from O(1)⊕O(−1), no flags; O² | Positive case: instability 2, unique maximizing line O(1). Semistable case: value 0, multiple degree-0 line subbundles. | Uniqueness retained only at positive instability. |
| 0.10 Central lattice | G_m degree lattice Z; Ξ=dZ | Degree quotient has d classes for d>0; Ξ=0 gives infinitely many. A rational-character bound alone leaves all geometric norm-one-torus components. | Retain finite-index hypothesis. |
| 0.11 Orbit masses | G_m/F₃; GL₂ trivial bundle/F₃ | 1/Aut=1/2 and 1/48; volume-one local level yields the same orbit weights, not 1 each. | Retain normalization. |
| 0.12 Nonsplit descent | GL(O⊕O(1)) on P¹ | Its Lie bundle twisted by O(−1) has h⁰=1; a constant GL₂ model has h⁰(O(−1)⁴)=0. Constant-field extension preserves this mismatch. | Retain étale descent with inner transitions. |
| 0.13 Bundle mass | P¹/F₃, rank 2, degree 0 | 1/48+Σ(m≥1)1/(4·3^(2m+1))=1/32; formula 3⁻³·Z(1/9)/2=1/32 since Z(1/9)=27/16. | Retain. |
| 0.13 SL_r volume / R01 | SL₂/F₃(t), then SL₁ | Product-Haar volume=3⁻³·27/16=1/16; gauge multiplier=16 gives Tamagawa volume 1. SL₁: empty product and exponent 0 give 1. | Retain theorem here; retire duplicate gap. |
| 0.13 Torsion and rank 0 | P¹/F₂, degree 2 torsion; zero bundle | Torsion mass 3(1/2+1/6)+3+1/3=16/3; naive ordinary exp gives 9/2. Zero-bundle mass 1 differs from rank-positive formula extended to r=0, which gives 2. | Retain plethystic/rank restrictions. |
| 0.14 Cuspidal bundle functions | G_m on P¹/F₃, degree quotient Z/2 | No proper parabolics, so cusp space=all functions, dimension 2. With no central quotient, degree support has infinitely many basis vectors. | Retain Ξ and support conditions. |
| 0.15 Lang fibres / R03 | Pic of P¹/F₃; Pic⁰ of elliptic curve | Pic⁰(P¹)=0 gives kernel size 1; whole Pic gives kernel Z. Differential of Frob−id is −1, invertible also in characteristic 2. | Mathematics retained; correct locator. |
| 1.1 BD Grassmannian | R=k[ε]/ε², G_m | (1+ε/t)(1−ε/t)=1, but 1+ε/t is not in R[[t]]×. A reduced discrete Z model loses this nonzero tangent direction. | Retain nonreduced test rings. |
| 1.2 Schubert bounds | GL₂ minuscule (1,0) | Ordinary reduced support=P¹, dimension 1 and tangent dimension 1; perfection would kill the ordinary infinitesimal direction. | Retain ordinary models. |
| 1.3 Hecke chains | G_m, two modifications +1 and −1 | Final total degree 0, intermediate degree +1. Collapsing to identity loses the intermediate chain. Disjoint legs give the two-factor product. | Retain ordered chain data. |
| 1.4 Stack sheaves | B S₃ and B G_m/F₃ | Rational S₃-torsor class weights 1/6+1/2+1/3=1; B G_m mass Σ(i≥1)3⁻ⁱ=1/2. Stack compact cohomology is not bounded as for a scheme. | Retain unbounded stack formalism. |
| 1.5 Fusion | GL₂, two standard minuscule modifications | Central collision fibre=P¹: 2 dim fibre=2, local codimension=2; total-family codimension=3, so 2<3. | Local semismall/global small distinction retained. |
| 1.6 Iwahori minuscule geometry | Node ab=t | Total space dimension 2, smooth; fibre t=0 has two branches and tangent dimension 2 at a=b=0 versus fibre dimension 1. | Retain semistable, not smooth, collision fibre. |
| 1.7 Satake category | GL₂ standard V | dim(V⊗V)=4=dim Sym²V+dim ∧²V=3+1. Unit convolution has dimension 1·2=2. | Retain convolution/tensor normalization. |
| 1.8 Satake signs | P¹ minuscule IC and a torus orbit | Shifted P¹ cohomology is odd, giving symmetry −1; the point orbit gives +1. Two odd factors give (−1)²=1. | Retain corrected symmetry. |
| 1.9 Satake equivalence | Rank-one torus weights 2 and −1 | Tensor weight 2+(−1)=1; each fibre functor space has dimension 1; dual sends 2 to −2. | Retain weight and dual conventions. |
| 1.10 Central linearization | SL₂ in characteristic 2, adjoint class diag(1,1+t) | An SL₂ lift would require a(t)²=(1+t)⁻¹. Constant coefficient requires a₀²=1, t coefficient requires 0=1. | Retain descent that does not assume loop surjectivity. |
| 1.11 Nonsplit arithmetic Satake | Trivial geometric group; Frobenius 1+ℓ | One-dimensional arithmetic representation has scalar 1+ℓ, not forced to 1 or ±1. Finite outer action does not remove arithmetic descent. | Retain full arithmetic category. |
| 1.11 L-group correction | SL₂, cycl(γ)=3, u(1) | Printed map gives u(1/3) for product, versus u(3) for product of images. Correct g c(γ)⁻¹ map gives the same u(1)c(γ)⁻¹ on both sides. | Retain source correction E7. |
| 1.12 Nonsplit spherical Satake | Unramified norm-one torus | Frobenius invariants in cocharacters Z are 0; T(K)/T(O)=0 and Hecke algebra has dimension 1. Full E[z,z⁻¹] would have infinite dimension. | Retain invariant lattice/local component. |
| 1.13 Determinant/opposition | Zero quotient; two quotient lines | ∧⁰(0)=R; swapping two lines gives (−1)^(1·1)=−1, becoming +1 in characteristic 2. Opposition on IH⁰, IH² gives +1,−1. | Retain rank and grading conventions. |
| 1.14 Integral Satake | O/λ tensored with O/λ | Derived tensor has H⁰=O/λ and Tor₁=O/λ; ordinary tensor sees only H⁰. Free unit has Tor₁=0. | Retain derived coefficient change and perverse convention. |
| 2.1 Global shtukas | G_m, two weights (+1,−1); one weight +1 | Frobenius preserves degree: 1−1=0 permits closing; total +1≠0 forbids it. Empty legs give Frobenius-fixed bundles, not all geometric bundles. | Retain closing equation. |
| 2.2 Truncations | Norm-one torus; source/modified GL₂ bounds | Frobenius closure requires d=−d, hence d=0; adjoint bundle bound alone permits every d. Source O² has instability 0, a modification can have positive instability. | Retain Frobenius closure and two truncation systems. |
| 2.2 Central-isogeny route | SL₂×SL₂, V=Std₁⊕Std₂, K=μ₂² | (−I,I) acts by −1 on Std₁⊗Std₂^(n−1) for every n, including n=4. Separate squares of character summands have central action (+1,+1). | Retain E8 repair; no whole-tensor-power shortcut. |
| 2.2 Nonreduced central kernel | μ_p over F_p[ε]/εᵖ | (1+ε)ᵖ=1, but 1+ε≠1. Treating the kernel as its geometric point set loses the infinitesimal element. | Retain finite group-scheme argument. |
| 2.3 Local models | Zero bound and a fixed finite jet torsor of dimension d | Relative tangent contribution is d, so chart dimensions differ by d; for trivial group d=0 and map is identity. Smooth pullback shifts by [d], not 0 in general. | Retain quotient/chart distinction. |
| 2.4 Fractional infinity | Rank n, one negative leg, D∞=−Γ∞/n | n·deg(D∞)=−1 equals modification degree −1; changing leg to +1 gives −1≠+1. | Retain sign and degree balance. |
| 2.5 Cohomology systems | Increasing zero-leg truncations with 1,2,3 classes | H⁰ dimensions 1,2,3 and colimit infinite; no single finite rank describes it. Identity transition on a fixed bounded chart preserves its classes. | Retain Ind-system. |
| 2.6 Twisted inner forms | Quaternion invariants at two places | 1/2+1/2=0 in Q/Z permits the global Brauer class; one lone 1/2 has nonzero sum and is excluded. | Retain all inner components and global constraint. |
| 2.7 Elliptic sheaves / R01,R02 | n=2, degree-2 pole on P¹ | Four degree-one quotients add 4, equal to rank·deg(∞)=4; period 2 would add only 2. Distinguished degree −1 becomes +1 after degree-one tensoring. | Retain marking/period; retire duplicate gap, register Sp. |
| 2.8 Horocycles | Instability path N,N+1,N | Two moving-leg steps, each changing instability by 1; the plateau path N,N,N violates that elementary-modification pattern. | Retain path/graph data. |
| 2.9 Partial Frobenius | Degree-2 point; two singleton leg blocks | One iterate moves to conjugate point; two return. Product of singleton operations equals total Frobenius, not either singleton alone. | Retain degree and HN transitions. |
| 2.10 Coalescence | Torus weights 2,−1 merged; V of dimension 2 | Merged weight=1; V⊗V∨ has dimension 4 before and after pullback, with no added shift. | Retain functorial coalescence. |
| 2.11 Hecke action/adjoint | Torus translation by +1 on degree basis | e_d maps to e_(d+1); adjoint is translation −1, returning e_(d+1) to e_d. Translation +1 twice would give e_(d+2). | Retain inverse-double-coset convention. |
| 3.1 Creation/annihilation | V=E², coevaluation/evaluation | Evaluation of coevaluation=2; rescaling only coevaluation by 3 gives 6, so arbitrary invariant arrows are not the normalized unit/counit. | Retain specified maps. |
| 3.2 Hecke finiteness | One-dimensional E with operator λ⁻¹ | Orbit of 1 has valuations 0,−1,−2,…; no finite O-lattice contains it. Identity operator keeps O of rank 1. | Retain integral Hecke stability. |
| 3.3 Horocycle direct images | r=2, #I(κ)=2 | Source shift −2r+#I=−2; adding [2r]=[4] gives [2]. Negative recall would give [−2], four degrees apart. | Retain E1 correction. |
| 3.4 Ind-perverse localization | E² versus ⊕(n≥0) E | Finite object becomes 0 modulo constructible objects; infinite direct sum remains with unbounded finite-stage ranks 1,2,3,… | Retain localization, not blanket vanishing. |
| 3.5 Cusp cohomology | G_m and GL₂ constant function | G_m has zero proper-parabolic tests, so every compactly supported class is cusp. GL₂ constant term of 1 integrates to 1 with quotient volume 1, so is not cusp. | Retain all proper parabolics. |
| 3.6 Hecke via Frobenius | G_m, scalar 2, place degree 2 | Two Frobenius iterations give 4, matching χ(ϖ_v)=4 for the degree character; one gives 2. GL₂ parity changes −1/√q_v to +1/√q_v. | Retain iteration/sign. |
| 3.7 Eichler–Shimura | F=diag(2,3) | F²−5F+6I=diag(4−10+6,9−15+6)=0. In characteristic 2, 2!=0, so trace-only reconstruction cannot replace exterior coefficients. | Retain integral formulation. |
| 3.8 No-leg cusp identification | G_m, P¹/F₃, level {0,∞}, degree quotient Z | Degree-zero ray group=(F₃×)²/F₃× has order 2; both cohomology and function side have dimension 2, versus 1 if level forgotten. | Retain full level. |
| 3.9 Boundary Satake / R02 | P¹/F₃, x=z+3/z, z=2 | x=7/2; ι(z)=3/z gives same x. Product maps to x²=49/4. Normalized generator maps to x/√3. | Retain rational/normalized adapter; register YZ-I. |
| 3.9 Removal of places | Remove all degree-one places of P¹/F₃ | Counts in degrees 2,3,5 are 3,8,48. With a_d=zᵈ+(3/z)ᵈ, a₂a₃−a₅=9x, recovering x without degree-one places. | Retain arbitrary finite exclusion. |
| 3.10 Integral cusp finiteness | Image of a bounded stage; O/λ² quotient | Module needs one generator, has λ²-torsion killed by λ²; a source kernel may be nonzero. Finite generation does not make the stage map injective. | Retain image formulation. |
| 3.11 Eisenstein decomposition | E[x] over degree-2 local Hecke E[x²−6] | Basis 1,x gives module rank 2 but E-dimension infinite. Boundary forward/backward shifts differ from identity by the rank-1 projection onto e₀. | Retain one-dimensional Eisenstein support and finite-rank errors. |
| 3.12 One-place finiteness | O[t] and (O/λ²)[t] over O[t] | Each has one module generator; first has infinite O-rank, second infinite O-length but torsion exponent 2. | Retain finite-Hecke-module versus finite-O distinction. |
| 3.13 Finite-type core | Compatible parity, #Σ∞=2; r=0,2 | r=0<2 forces a finite-type case; r=2 permits an arbitrarily high path and fails strict inequality. | Retain strict threshold and parity hypothesis. |
| 4.1 Finite-étale Drinfeld | Two independent C₂ actions on four points | Product action has image order 4; forcing diagonal action gives order 2 and loses an independent partial Frobenius. | Retain product action data. |
| 4.2 Lisse coefficients | M=O/λ² with identity partial Frobenii | O-length 2 on both sides of descent; M⊗E=0, so rationalizing first loses the entire example. | Retain torsion modules. |
| 4.3 Frobenius–Weil | Rank-one rational Weil action F=λ⁻¹ | Powers have valuations −n; action exists on E but cannot preserve a finite O-lattice or extend to compact Galois image. | Retain rational/geometric continuity distinction. |
| 4.4 Fusion/Frobenius | Merge scalars 2 and 3 | Grouped Frobenius is 2·3=6; taking one factor gives 2 or 3. | Retain product on merged legs. |
| 4.5 Finite lisse envelopes | Recurrence degrees 2 and 3 | Initial exponent box has 2·3=6 positions; exponents (2,0),(0,3) reduce using recurrence. Omitting one direction leaves an unbounded sequence. | Retain finite recurrence box. |
| 4.6 Specialization | Constant rank-2 lisse sheaf; closed-point skyscraper | Lisse stalk dimensions 2→2; skyscraper closed stalk 1→generic 0, so arbitrary constructible specialization is not an isomorphism. | Retain Hecke-finite restriction. |
| 4.7 Product Galois action | ℓ=5, scalar 2 versus 1/5 | 2 preserves Z₅ and has valuation 0 in every power; (1/5)ⁿ has valuation −n. Only first supplies the required finite stable lattice. | Retain envelope hypothesis. |
| 4.8 H-functors | Empty legs, trivial group and unit representation | Cusp space is E, dimension 1; unit coefficient maps give identity. Zero representation gives dimension 0. | Retain zero/unit distinction. |
| 4.9 Galois coalescence | Γ=S₃, diagonal inclusion | (12) maps to ((12),(12)); product is componentwise. Map (a,b)↦ab fails homomorphism for a=(12), b=(23). | Retain diagonal pullback, not multiplication. |
| 4.10 Naturality | Extra retained leg with Frobenius scalar 3 | Acting only on new legs leaves retained factor 3 once; applying an extra Frobenius there gives 9. | Retain identity on old legs. |
| 4.11 Choice independence | diag(2,3), conjugated by basis swap | Trace remains 5 and determinant 6; matrices change to diag(3,2), so equality without conjugacy is too strong. | Retain canonical invariant action. |
| 4.12 Full Weil descent | A=O[t]/(λt−1)=E, m=0 | A/m=E has λ invertible and is not torsion; finite E-dimension 1. A=O/λ gives the other branch, length 1. | Retain E6 two-case proof. |
| 4.13 Ind-smoothness | Constant stages Eⁿ, n≥1 | Every specialization at stage n has ranks n→n; colimit rank is infinite. Ind-smoothness therefore does not imply finite-rank lissity. | Retain. |
| 5.1 Excursions | Unit coefficient, ξ(x)=3 or 0 | Operators are 3·Id or 0; all γ_i=1 evaluates to ξ(x) in both cases. | Retain zero normalization. |
| 5.2 Matrix coefficients | SL₂, A=diag(2,1/2) | tr(A)=5/2; f(A,A)=tr(AA⁻¹)=2, whereas tr(A²)=17/4. | Retain inverse in second variable. |
| 5.3 Parameter separation | S₃→GL₂ standard representation | A transposition has trace 0; a 3-cycle trace −1; trace of identity 2. Tuple invariants distinguish relative products, not merely independent conjugacy classes. | Retain all invariant functions. |
| 5.4 Full cohomology excursions | One retained tensor factor E², scalar excursion 3 | Operator on retained space is diag(3,3), rank 2; an excursion with zero scalar has rank 0. No cusp projection is inserted. | Retain full-cohomology interface. |
| 5.5 Excursion identities | S₃, γ=(12), γ′=(23), γ″=1 | γγ′⁻¹γ″=(123); reversed order gives (132). Scalar commuting examples would miss this order distinction. | Retain three-copy order. |
| 5.6 Unramifiedness | Inertia element acting trivially away from level | σ(τ)=1, hence trace on standard rank-2 space=2 and relative invariant f(gτ,h)=f(g,h). At a ramified place τ need not map to 1. | Retain good-place qualification here and all-place Layer 7. |
| 5.7 Excursion algebra | J=[[1,1],[0,1]] | dim ker(J−1)=1; dim ker((J−1)²)=2; algebra E[J]≅E[ε]/ε². Ordinary eigenspace misses one dimension. | Retain generalized blocks. |
| 5.8 Reconstruction | Unipotent C_ℓ image versus its semisimplification, characteristic ℓ | Each element of 2-dimensional unipotent image has characteristic polynomial (T−1)²; semisimplification is identity with same polynomial. | Retain complete reducibility, not original nonsimple representation. |
| 5.9 Global decomposition | Rank-one character with Frob=2; GL₂ Satake diag(2,3) | Rank-one Hecke scalar 2; GL₂ trace scalar 5 and determinant 6. Generalized excursion blocks coexist with scalar spherical action. | Retain separate adjointness argument. |
| 5.10 Nonsplit decomposition | Q=C₂; norm-one torus | Parameter projection of Frobenius is nontrivial element, inertia projects to 1. Cocharacter invariants are 0, giving one-dimensional spherical algebra, not Laurent polynomials. | Retain prescribed projection and local projector. |
| 5.11 Modular blocks | C₂ in characteristic 2, J=[[1,1],[0,1]] | J²=I, J−I≠0, (J−I)²=0; generalized block dimension 2, eigenspace dimension 1. | Retain nonscalar modular action. |
| 5.12 Conditional eigensheaf | Zero trace function | Excursion equation is 0=χ(S)·0 for every S. It establishes block membership, not nonzero automorphy or eigensheaf existence. | Retain explicit conditional scope. |
| 5.13 Conjectural multiplicities | Centralizer C₂ acting by sign on A=E, W=1 | A has dimension 1 but A^C₂=0; dropping invariants changes no-leg dimension from 0 to 1. | Retain invariant factor and conjecture label. |
| 6.1 Constant twists | ℓ=5, p=7, scalar 6 | v₅(6)=0 permits compact constant Galois image; v₂(6)=v₃(6)=1, so it is not a unit at every prime away from p. | Retain distinction from p-plain compatible algebraic systems. |
| 6.2 Companions | Rank 1 finite-order system; rank-2 slopes ±1/2 and twist +1 | Rank-one slopes 0; translated rank-2 slopes 1/2,3/2 preserve slope differences but not the finite-determinant weight-zero bound. | Retain normalization before companion bounds. |
| 6.3 GL_r comparison | Rank-one χ(ϖ)=2; finite-central-character specialization | Excursion and correspondence give geometric value 2 and polynomial 1−2T; inverse convention gives 1−T/2. Finite-order character has weight 0. | Retain twist adapter. |
| 7.2 Restricted shtukas | No legs, G_m(F₃), one reduced jet | Classifying-stack stabilizer has size 2 and mass 1/2; a discrete point would have stabilizer 1 and mass 1. Frobenius budget r→r−1 is defined only for r≥1. | Retain stack and budget. |
| 7.3 Higher-base nearby cycles | Two smooth geometrically connected curves; crossing components | Product has dimension 2 and one irreducible component; a nodal union has two components and fails the irreducible-base input. Empty product is Spec k, dimension 0. | Retain base hypotheses. |
| 7.4 Transport | Tuples m=(2,5), d=(−1,1) | m+d=(1,6), both nonnegative. Taking m₁=0 gives −1 and is excluded, not truncated to natural-number 0. | Retain integer degrees and sufficient bounds. |
| 7.5 Local convolution | f=1, volume(U_m)=1 | 1_U*1_U=1_U; its integral is 1, so action on U_m-fixed vectors is identity. Zero f gives zero function. | Retain normalization. |
| 7.6 Ordinary centre / R01 | Function on G_m cosets ϖʲ with coefficient λʲ | mod λˢ support sizes 1,2,3,…, union infinite. For f=1 support size is always 1. | Retain uniform support target here; retire duplicate gap. |
| 7.7 Completed action | Same λʲ function | Coefficients tend to 0: valuation j→∞, but support remains infinite. Torsion reduction has finite support s. | Retain decay versus finite support distinction. |
| 7.8 Local–global compatibility | Two WD parameters with same Weil part and N=0 or E₁₂ | Ordinary semisimple Weil restrictions coincide; monodromy ranks are 0 and 1. Semisimple compatibility alone cannot recover N. | Retain scope; §7.11 supplies stronger GL_r comparison. |
| 7.9 Monodromy | q_K=3, F=diag(1/√3,√3), N=E₁₂ | FNF⁻¹=(1/3)N; N²=0 and rank N=1. Setting N=0 leaves F unchanged but changes ker N from dimension 1 to 2. | Retain geometric Weil–Deligne relation. |
| 7.10 Gamma cancellation | q_K=3, a=1,b=3,T=1/9 | Epsilon correction −bT=−1/3; L-ratio correction −1/(bT)=−3; product 1. Separate L-factors differ, gamma does not. | Retain cancellation as rational functions. |
| 7.10 Character rescaling | ψ→ψ_ϖ, rank 1 then rank 2, s=0 | Self-dual epsilon scaling magnitude √q_K then q_K; using the same √q_K in rank 2 loses a factor √q_K. | Retain dimension and determinant factors. |
| 7.11 GL_r adapter / R01 | Geometric Frobenius values 2 and 3; pair at T=1/9 | Arithmetic values 1/2,1/3; full dual restores 2,3. Correct pair L=1/(1−6/9)=3; omitted dual gives 1/(1−1/54)=54/53. | Retain adapter; import existing rec. |
| 7.11 Segments | Segment [ν^−1/2,ν^1/2] | Z convention gives one-dimensional trivial representation with N rank 0; L convention gives Steinberg with special-block N rank 1. | Retain distinct Z/L conventions. |

These tests also check source/target direction, both directions of the identifications where applicable, noncommutative group actions, integral torsion, small characteristics, nonreduced bases, and wrong models retaining the same superficial numerical invariant. They found no new false headline statement. The review does not infer truth from the successful `sorry` build.

## Not verifiable

- **Del73:** remains the settled uncertified source. The README cites §3.12, pp.533–534, Theorem 4.1, p.535, Lemmas 4.12–4.16, pp.544–546, and §8.12, p.572, for local factors; no new access request was made. The equal-characteristic local-constant supplier contract and the explicit gamma-cancellation test were checked, but Deligne's original text is not certified here.
- **Original 1997 trace-formula error behind README E5:** LL lines 1667–1726, Theorem I.13 and its following remark, pp.31–32, were read. They explicitly retain polynomial-times-exponential terms and explain their cancellation after trace comparison. The earlier book's original formula was not independently opened, so this review verifies the correction recorded in LL, not the earlier printing itself.
- The cited GeL Remark 6.3 describes a route to the uniform-support comparison. Reading that route does not amount to constructing its uniform nearby-cycle modification. The roadmap correctly makes that geometric step an owned target; it is not being passed off as a consequence of compatibility of completed corners.

All 15 seeded source texts were accessible. Sp, Harder and YZ-I were recovered legally through the source service. No unresolved request for a new legal copy remains. Ownership against the supplied open-roadmap files was checked; DrinfeldModulesAndTModules was not available from the index, but it is named only as a downstream consumer, not a prerequisite.

## Source issues

- **Misprint** in YZ at §3.5.4, p.38 (YZ line 2369): the source says the normalized horocycle direct image has negative shift and twist; it should be positive, as follows by adding [2r](r) to Corollary 3.29; affects a stated result.
- **Misprint** in YZ at §3.5.4, p.38 (YZ line 2372): the source says a fixed-degree rank-one component is a Pic_X(k)-torsor; it should be a Pic⁰_X(k)-torsor, with Pic_X(k) acting on the union of degree translates; affects a stated result.
- **Misprint** in YZ at §3.5.4, p.38 (YZ line 2380): the source says every translated summand uses the fixed N(κ) projection; it should be N(κ′) in the summand indexed by κ′; affects a stated result.
- **Misprint** in Feng at §5.2.3, p.36 (Feng line 1614): the source says the Frobenius–Weil automorphisms fix the closure of F_q although its curve uses F_ℓ; it should be the closure of the actual base field; affects nothing.
- **Error** in Xue-I at proof of Lemma 8.2.4, p.55 (Xue-I line 3366): the source says every maximal-ideal-power quotient of a finite-type O_E-algebra is finite torsion over O_E; it should separate λ-containing ideals from quotients finite over E; affects the proof.
- **Error** in Ric at Corollary 5.8, p.22 (Ric line 1051): the source says conjugating g by χ(γ⁻¹) defines the semidirect-product comparison; it should multiply g by a chosen half-Tate lift c(γ)⁻¹, with existence of that lift assumed; affects a stated result.
- **Error** in VL at proof of Lemma 12.19(c), p.160 (VL line 8800): the source says the tensor power indexed by the central kernel's order kills that kernel; it should take powers separately on central-character summands before using the slope bounds; affects the proof.
