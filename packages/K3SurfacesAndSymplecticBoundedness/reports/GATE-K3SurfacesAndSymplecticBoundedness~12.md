## H01 (CBirkbeck) — applied differently

The genus-one-only Picard restriction target is now a regular-surface theorem with its genus-one specialization: `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:770` retains the companion §4.7 domain, line 82 imports SchemeAndStackFoundations §3.4's divisor/excision theory, lines 778–781 add four discriminating Checks, and line 1402 explicitly exports restriction and generation to companion §§4.7–4.8. The companion at `e974688` still independently constructs the shared carrier, Kodaira realization, canonical formula and Jacobian in §§2.1, 2.3, 2.5, 4.1–4.2 and 4.16–4.17; replacing those constructions with imports remains necessary and was not performed because that roadmap is outside the authorized edit scope, so the approval blocker remains unresolved.

### Ownership and source evidence

The shared direction remains K3SurfacesAndSymplecticBoundedness §6.0b → NeronModelsAndSemistableAbelianVarietiesPartII. The regular-surface restriction adapter has no K3 premise, no relative-minimality premise, no genus condition and no ground-field premise; the subsequent Jacobian generation and determinant applications retain their original geometric and proper-base hypotheses. No premise was imported from the companion, and no ownership move to a later supplier was made.

| Shared object | Verified companion location in `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md` | Required companion adoption |
| --- | --- | --- |
| Genus-one carrier, full fibres, localization and field change | §2.1, lines 3798–3832 | Specialize §6.0b by properness of the base; retain the same morphism and specified generic-fibre identification. |
| Geometric Kodaira realization and classification | §§2.3, 2.5, lines 3873–3896 and 3943–3965 | Consume the shared realization of EllipticCurves Layer 4's ReductionSymbol, retaining incidence schemes and multiplicities. |
| Canonical formula and Hodge-line degree | §§4.1–4.2, lines 8861–8897 | Specialize the shared formula including the torsion term. |
| Restriction and generation | §§4.7–4.8, lines 8998–9041 | Consume the general regular-surface restriction adapter and its Jacobian specialization; retain the broader §4.7 domain. |
| Quasi-elliptic Picard group and regular completion | §4.16, lines 9228–9266 | Consume the common geometric construction; retain characteristic-two refinements. |
| Regular minimal Jacobian with zero section | §4.17, lines 9270–9296 | Consume the curve-base construction; retain the extension to other excellent DVRs and the arithmetic applications. |

The companion contains no reference to K3SurfacesAndSymplecticBoundedness at this head. `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:74`–75 at `e030a1b` does consume both shared §6.0b and the overlapping companion stages, confirming that the remaining duplication affects a consumer.

Ownership searches covered main, the indexed open roadmap heads and the board packages by objects, including generic Picard restriction and vertical divisor kernels. On `origin/main` at `64932739`, SchemeAndStackFoundations §3.4 owns the Cartier–Weil comparison and open-subscheme excision, while JacobianChallenge Layer A owns the divisor–line-bundle dictionary; the generic-fibre adapter is the specialization developed here, rather than a second construction of those foundations. StableReduction Layers 4–5 retain smooth-generic minimal models, and EllipticCurves Layer 4 retains the reduction-symbol type. No Lean declaration was added or renamed.

The legal cached text supports the geometric carrier at enriques-one line 17390, localization and minimality at enriques-one line 17424, the canonical formula and degree at enriques-one line 17528, the regular Jacobian and its section comparison at enriques-one line 18320, and the vertical Picard comparison at enriques-one line 18349. Proposition 4.3.2 is cited only for the genus-one specialization; the broader statement is justified by the explicit divisor-closure and rational-trivialization argument in the revised paragraph. No new source was required.

The nonblocking discussion-safety observation does not request a mathematical change. No companion file, pull-request description, issue or comment was changed.

### Adversarial pass

The following records the changed statements and their shared applications, together with the retained acceptance declarations. Computations are mathematical checks of the statements, not proofs of the admitted Lean targets.

| Statement | Instances tried | Values on the two sides | Result and change |
| --- | --- | --- | --- |
| Regular-surface restriction is surjective | ℙ¹×ℙ¹→ℙ¹, O(a,b), a=−1,0,1 | Restriction degrees −1,0,1; target classes O(−1), O, O(1) | Every integer is attained; genus-zero Check added. |
| Kernel equals the vertical subgroup | Same product | Restriction (a,b)↦a; kernel {(0,b)}=ℤF; O(0,1) restricts to 0 | Both inclusions hold; the statement is independent of genus. |
| Kernel includes individual components, without minimality | Blowup of one rational point of a product fibre | H↦1, F↦0, E↦0; E²=−1; components E and F−E span ℤF⊕ℤE | One full fibre gives rank 1 instead of kernel rank 2; negative-control Check added. |
| Restriction over mixed-characteristic bases | ℙ¹ over ℤ_(2), ℤ_(3) | ℤ→ℤ is 1↦1; ker=0; [div(2)]=[div(3)]=0 | Neither characteristic is excluded; Check added. |
| Pullbacks of base degree-zero and torsion classes belong to the kernel | E×D→D, P≠Q; also P−Q nonzero of order 2 | r(pr₂*O(P−Q))=0; restriction to a constant section is O(P−Q)≠O; in the torsion case 2[O(P−Q)]=0 | The vertical kernel cannot be replaced by the group of one full fibre; Check added. |
| Compatibility with opens and localization | Product over ℙ¹, restrict to A¹ then localize at 0 | O(a,b) has generic degree a along either path; at the DVR the full fibre has class [div(t)]=0 | The two composites agree; no global proper-base assumption used. |
| Genus-one specialization and Jacobian generation | E×ℙ¹→ℙ¹ with origin O | Generic degree of O is 1, of F is 0; normalized restriction sends O↦0, F↦0, section C_P↦P | The existing generation statement consumes the general restriction theorem. |
| Proper-base carrier and native model are preserved | E×ℙ¹, E×A¹, and inseparable t²−a=(t−b)² | Generic h⁰=h¹=1 in both products; global H⁰ is k versus k[t]; pulled-back divisor length 2 versus reduced length 1 | Proper-base adapter retained; no reduction of fibres or change of localized model. |
| Canonical and Hodge-line conventions in the shared interface | Elliptic product; Jacobian K3; χ=2 and torsion length 1 | deg L=0, −2, −3 respectively; ω over ℙ¹ is pullback of O(−2), O, respectively | Existing sign and wild correction retained. |
| Numerical restriction and determinant specialization | Bielliptic example with MW of order 4; Jacobian K3 with finite MW | Bielliptic N=MW gives q=1 and 1²·1=1; using 4 gives 16≠1; K3 N=0 gives q=|MW| | General restriction does not identify Pic with Num; numerical quotient law retained. |
| differentialForms | Smooth surface, exterior degrees 0,1,2,3 | Ranks 1,2,1,0 | Native exterior powers retained. |
| IsK3 | Complex smooth quartic; abelian surface; empty scheme | Quartic has canonical O and h¹(O)=0; abelian surface h¹(O)=2; empty scheme fails geometric integrality | No chosen trivialization or vacuous empty object admitted. |
| isK3_fieldExtension_iff | Identity; real Fermat quartic extended to ℂ; ℙ² under a field extension | K3 truth values true↔true for the quartic; false↔false for ℙ² since ω=O(−3) | Preserved and reflected predicate retained; all field/algebra binders present. |
| IsK3.noVectorFields | Complex quartic; abelian surface as excluded input | Quartic dimensions (h⁰Ω¹,h⁰T,h²T)=(0,0,0); abelian h⁰T=2 and fails IsK3 | The explicit K3 hypothesis remains. |
| IsK3.hodgeNumbers | Complex quartic, (p,q)=(0,0),(1,1),(2,2),(3,0),(0,3) | Actual dimensions and formula are 1,20,1,0,0; coherent finiteness is a separate conjunct | Finite-dimensionality and out-of-range zeros retained. |
| geometricPicardRank | Complex Fermat quartic; same quartic over ℝ | Geometric ranks 20 and 20 after the same algebraic closure | Definition uses geometric line-bundle classes, not arithmetic rank or h¹¹ by definition. |
| IsK3.picardGroup_finiteFree | Complex Fermat quartic; zero class and a hyperplane | Pic≃ℤ²⁰; O has order 1 and H²=4 forces H to have infinite order | Module.Free and Module.Finite both retained on the native additive Picard carrier. |
| IsK3.picardRank_bounds | Complex Fermat quartic; rank-zero candidate | 1≤20≤20≤22 and 20≤20; candidate arithmetic rank 0 would require 1≤0 | Lower bound and characteristic-zero condition retained. |
| IsK3.boundedPicardDescent | Algebraically closed base, same complex quartic | Choose K=k: degree 1, separable, rank 20=20; 1≤|GL₂₂(𝔽₃)| since the identity is an element | Rank equality, not integral equality of Picard groups, retained. |

### Elaborated signatures and validation

All nine declarations were included as `#check @name` in one scratch copy and elaborated in one scoped build; each resulting type was compared with its README statement. The three definitions retain their field, scheme and structure-morphism binders, the field-extension theorem retains both fields and the algebra instance, and all five IsK3 theorems retain their explicit IsK3 premise. Hodge finiteness, Picard freeness/finiteness, separability, finite-dimensionality and rank equality all remain in the elaborated conclusions. No dropped hypothesis or signature mismatch was found, and `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/Suggested.lean` was restored byte-for-byte before the final build.

The pinned package check confirmed Mathlib `6b7abb3` and Tau Ceti `a91d3aa`. The native model in `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44` stores flatness, finite presentation and its specified generic-fibre isomorphism; properness is separate at line 72, and regularity/minimality are not fields. The integral-scheme Cartier–Picard equivalence is `classGroupAddEquivLineBundleClass` in `TauCeti/AlgebraicGeometry/CartierDivisor/ClassGroup.lean:123`; no curve-only Weil–Cartier equivalence was applied to a surface. The earlier citation leads are accounted for: the five IsK3 names occur in the acceptance signatures, and Crystalline.wittCohomology_V_complete is a supplier target in CrystallineCohomology CR.4.7, not a claim of a pinned library theorem.

Committed as `79a60a64`, with only the authorized README changed; nothing was pushed. The preliminary gate reported dirty=1 before the commit; the committed worktree passes the final gate.

Dependency check, exit 0, complete output:

```text
depcheck: 53 roadmaps, 595 edges, 0 problem(s)
```

There are no UPWARD or CYCLE lines for this roadmap.

Build command: `lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested`. Exit 0, six expected declaration-uses-sorry warnings, exact final line:

```text
Build completed successfully (9040 jobs).
```

Final gate exit 0, exact summary line:

```text
gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
