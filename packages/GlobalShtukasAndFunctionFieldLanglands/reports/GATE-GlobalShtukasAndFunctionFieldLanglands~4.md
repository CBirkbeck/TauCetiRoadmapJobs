## H01 (CBirkbeck) — applied

`TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:38` distinguishes the Picard scheme Pic_X from the Picard stack 𝒫_X, and lines 989, 991 and 998 replace the ordinary point-group quotient by the full tensor-groupoid stack quotient, with the Frobenius-graph comparison of YZ (3.14) (YZ line 1488 and YZ line 1498, §3.2.5, p. 23).
Line 1005 adds the P¹/F₃, rank-one, zero-leg witness: the discrete Z quotient leaves B(C₂), whereas the full groupoid quotient gives the point required by PGL₁; line 508 uses the same notation, while the group algebras in §3.11 retain ordinary Picard classes.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:25`, line 139 and line 2185 identify SmoothRepresentationsOfLocalGroups §SR.5.2, *classical-llc-normalization*, as the owner of the shared rec interface over all nonarchimedean local fields; line 2160 states ι_*π≅rec((ι_*D)∨), with D∨=(r∨,−Nᵗ), and lines 2174–2175 compute the rank-one reciprocity and special-block monodromy witnesses.
The supplier at head 1383569 explicitly uses arithmetic reciprocity and the determinant central character (`TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4550`, lines 4561–4563 and 4589–4593), so full duality reconciles conventions; the independent AL.3-to-local construction remains here (LL line 11292, Theorem VII.3, pp. 195–196; LL line 11350 and LL line 11396, Proposition VII.4 and its sequel, pp. 196–197), without a reverse proof dependency.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:2227` replaces the English title with *Comptage des systèmes locaux ℓ-adiques sur une courbe*, retaining arXiv:1807.04659v5 and 18 July 2022, as confirmed by Yu line 5 and Yu line 6.
The existing §3.3 citations remain those of this work: the shifted slope inequality is Yu line 893, and the orbit-volume and automorphism factors are Yu line 904 and Yu line 907.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:1678` changes “VL Remark 9.4” to “VL Lemma 9.4, p. 130”: VL line 7208 explicitly states independence of the geometric generic point and specialization choices.
The other occurrence in §4.11 already cites Lemma 9.4 correctly; the search found no further incorrect occurrence.

**Ownership and citation audit.** Supplier contracts were resolved against main a8132fb and the indexed open heads; existing roadmaps, including SchemeAndStackFoundations, were read on main rather than on their revision pull requests. SchemeAndStackFoundations §3.7 supplies the Picard stack, scalar automorphisms, tensor and base change (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:4937`); §2.4 here owns its action on this roadmap’s fractional-infinity shtukas and the comparison with their Frobenius-graph construction, not a second Picard-stack foundation. SmoothRepresentationsOfLocalGroups owns rec and the generic Weil–Deligne and segment carriers; §7.11 here owns the equal-characteristic construction and identification. Searches by these objects covered main, the supplied sibling checkouts, available board packages and indexed open-roadmap heads. Ownership against open pull requests without supplied files was not checked at separate checkouts. No new supplier, moved notion or declaration name was introduced.

The final citation resolution found no unresolved cross-roadmap citation or Lean name. Its library search reported that pinned packages were unavailable to that resolver; the actual content libraries were inspected separately at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching the manifest. The earlier GlobalFunctionField.classFormation lead is the planned target in ArithmeticGaloisDuality §R02.3.2 (`TauCetiRoadmap/ArithmeticGaloisDuality/README.md:2133`, head 09ad340), not a claimed pinned declaration. The existing VL, YZ, LL and Yu source keys suffice for these repairs; Del73 remains settled as uncertified.

**Pinned carriers and signatures.** The native scheme carrier is a locally affine locally ringed space (`Mathlib/AlgebraicGeometry/Scheme.lean:40`); it does not supply an algebraic moduli stack or its cohomology. Tau Ceti’s finite point-representation category is the full subcategory cut out by finite generation, with its representation/comodule equivalence (`TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean:216`, line 231). Object searches found no global-shtuka stack or smooth-admissible local representation/Weil–Deligne correspondence carrier that would make the repaired headlines statable. Suggested.lean therefore remains unchanged: the mechanical declaration audit found zero declarations, one import Mathlib, zero sorry bodies and zero option overrides. There are consequently zero declaration signatures to elaborate with #check @name and zero retained section binders to compare; the requested build elaborated this empty module and no signature or hypothesis changed.

**Adversarial mathematics pass.** These rows cover the changed mathematical statements, conventions and comparison clauses, including their repetitions in ownership, supplier contracts and APIs. Citation-only changes introduce no new mathematical assertion.

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| Picard scheme versus stack, §§0.15 and 2.4 | O(0), O(1) on P¹/F₃ | Each degree has one class; Aut(O(d))={1,2} has order 2; mass 1/2 versus scheme-point mass 1 | Classes omit arrows | Distinct notation throughout |
| Full rational-point groupoid acts on shtukas | Scalar b=−1 on a closing scalar a=1 over F₃ | b³/b=1, so the arrow preserves a; quotient by Z cannot remove this order-two stabilizer | Scalar arrows belong to the acting object | All three quotient/descent occurrences repaired |
| Geometric closing-scalar orbit | q=3, a=1 and a=2 over the algebraic closure | b²=2 has a solution; a=1 and 2 lie in one orbit; b²=1 has exactly two roots | One geometric class with C₂ stabilizer per degree | Geometric, not rational, orbit specified |
| Closing scalars on a nonreduced test scheme | q=3, R=F̄₃[ε]/ε², a=1+ε | b=1+2ε gives b²=1+ε; a scalar 1+cε fixes a only if 2c=0, hence c=0 | Infinitesimal scalars add no hidden stabilizer to the Lang kernel | Groupoid quotient and graph comparison retain nonreduced bases |
| Picard quotient versus PGL₁ graph | n=1, r=0, D∞=0, no flags | Balance 0=1·0; discrete quotient B(C₂) has stabilizer order 2, full quotient and trivial-group graph each have order 1 | Required comparison separates wrong quotient | Explicit negative-control Check |
| Degree translations and scalar arrows | d=0,1,−1 and tensoring by O(1) | d maps to 1,2,0 respectively; each scalar stabilizer stays C₂ before quotient | Both objects and arrows must descend | Tensor action specified |
| Graph-twist direction in §2.4 | n=1, r=1, μ=−1, D∞=−Γ∞ | deg E₁=deg E₀−1; AL(−D∞) adds 1 and restores deg E₀; opposite sign gives deg E₀−2 | Degree check fixes graph map | Graph comparison keeps AL(−D∞)∘p_r |
| Rational Picard group in §3.11 | P¹/F₃, degree classes 0 and 1 | [O(0)]·[O(1)]=[O(1)]; the degree-one basis element translates by +1, independently of the two scalar arrows | Ordinary group algebra remains appropriate | No groupoid substitution in group algebra |
| Geometric/arithmetic adapter, §7.11 | r=1, χ(ϖ)=2, ℓ=5 | D(F_geo)=2, D(F_ar)=1/2; D∨(F_ar)=2; rec(D∨)(ϖ)=2, rec(D)(ϖ)=1/2 | Dual required by supplier convention | Explicit identification |
| Two-term Frobenius witness in both conventions | F_geo and F_geo² for the preceding character | χ values 2 and 4; arithmetic values 1/2 and 1/4; dual arithmetic values 2 and 4 | Adapter respects powers | Check repeats standing convention |
| Determinant/central-character identity | r=2, unramified D(F_geo)=diag(2,3), N=0 | det D(F_geo)=6; det D(F_ar)=1/6; det D∨(F_ar)=6 | Identity holds in higher rank | Exact central-character equation |
| Full dual retains monodromy | q=3, F_geo=diag(1/√3,√3), N=E₁₂ | F_geo N F_geo⁻¹=N/3; dual has N∨=−E₂₁ and F∨_geo=diag(√3,1/√3), giving N∨/3; arithmetic conjugation gives 3N∨; ranks 1=1 | Correct WD relation in both conventions | Full-duality Check |
| Matrix inversion alone is insufficient | Same special block, invert F but leave N | F_geo⁻¹ N F_geo=3N rather than N/3 | Wrong model excluded | Transpose and dual monodromy specified |
| Duality respects noncommuting products | A=[[1,1],[0,1]], B=diag(2,1) | (AB)∨=A∨B∨=[[1/2,0],[−1/2,1]]; A⁻¹B⁻¹=[[1/2,−1],[0,1]] differs from (AB)⁻¹=[[1/2,−1/2],[0,1]] | Full dual is covariant on the group; bare inversion is not | Adapter uses algebraic dual |
| Contragredients and dual involution | Rank-one value 2; special block N=E₁₂ | 2→1/2→2; E₁₂→−E₂₁→E₁₂ | Dual twice restores parameter and monodromy | Compatibility target |
| Character-twist compatibility | Unramified geometric eigenvalues 2,3, twisted by character value 5 | Eigenvalues 10,15; arithmetic dual eigenvalues 10,15; central determinant 150=6·5² | Adapter commutes with twists | Compatibility target |
| Coefficient transport with fixed square root | q=9 and q=3 special block | At q=9 the chosen root is 3 and half-norm is 1/3 on both sides; at q=3, ι(√3)²=3 and the conjugation ratio is 1/3 on both sides | Field transport preserves dual and WD relation | Supplier interface shares chosen normalization |
| Classical rec versus generic BS twist | Rank two, q=3, central scalar ϖI₂ | Classical central character of the normalized special block is 1; an extra norm twist ν^(−1/2) has value (1/9)^(−1/2)=3 on ϖI₂ | Extra generic normalization would change the central character | Comparison explicitly uses classical rec |
| Degenerate ranks and fields | n=1, q=2; rank 0 and q=1 | F₂× has order 1 and both quotients are points, so q=2 cannot detect H01; rank 0 is outside n≥1; q=1 is not a finite-field size | General theorem retained; separating q=3 Check necessary | Standing scope unchanged |

The internal dependency audit found 92 numbered targets and 212 numbered Needs links, with no missing target, forward edge or cycle. The external direction check exited 0 and printed exactly:

```text
depcheck: 55 roadmaps, 630 edges, 0 problem(s)
```

**Build outcome.** Exit 0 for lake build TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands.Suggested; exact output:

```text
✔ [8976/8976] Built TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands.Suggested (2.1s)
Build completed successfully (8976 jobs).
```

**Gate outcome.** Exit 0 on clean commit 95c88328; exact summary line:

```text
gate GlobalShtukasAndFunctionFieldLanglands: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Commit: 95c88328 — GlobalShtukasAndFunctionFieldLanglands: review repairs (Picard groupoid, shared local correspondence, reference locators). No push was made.
