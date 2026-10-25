## H01 (CBirkbeck) — applied

TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:913 replaces the single tensor power with the explicit boundedness-under-finite-central-isogeny prerequisite at line 915: characterwise descent after a finite separable splitting extension, fixed equivariant lattice comparisons across the models, tensor-slope inequalities and componentwise descent give the inverse-image bound, including non-smooth kernels. The counterexample is recorded at line 935 and as correction E8 at line 2178; VL line 8797–8804 contains the invalid step, while AH19 line 368–389 supplies the invariant-extension input used at line 919.

## H02 (CBirkbeck) — applied

TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:2132 replaces a second segment classification with SmoothRepresentationsOfLocalGroups §SR.5.2, *segment-representations*, and line 2134 specifies its exact transport from ℂ to Q̄_ℓ, preserving normalized induction, intrinsic segment strings, ordering and the distinct Z/L constructions. Ownership, the supplier contract, §7.11 Needs and Layer 7 Dependencies now agree (lines 25, 138, 2154 and 2165); the compatible square-root choice and the two-term Steinberg check are explicit at lines 36 and 2142, consistent with LL line 11282–11286, line 11396–11413 and line 12455–12472.

## H03 (CBirkbeck) — applied

TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:2051 and line 2165 extend the local dependency lists from LanglandsParameterStacks §§LP2c.1–LP2c.2 to §§LP2c.1–LP2c.4, distinguishing prescribed projection and abstract reconstruction from relatively discrete and discrete-coefficient Weil continuity. These match the supplier's actual §§LP2c.3–LP2c.4 and the existing proof at line 2033; GeL line 214–217 explicitly requires continuity of the invariant evaluations.

**Ownership and citation record.** The object searches covered main, the board packages, the supplied sibling roadmap heads and the open-roadmap index. SmoothRepresentationsOfLocalGroups owns the shared segments; LanglandsParameterStacks owns the continuity interfaces; no supplier later in the merge order was added. No earlier owner of the curve-model inverse-image boundedness theorem was found: it belongs here as the missing prerequisite for §2.2. The special descent of the character tensor powers is included in that prerequisite. ClassicalGroupsPartII §CG.0.6 also plans a general representation-descent equivalence; the special factorization needed here is moved earlier into §2.2, using ReductiveGroups Layers 0–1 and 3 for the fppf quotient, without importing the later roadmap or reconstructing its general equivalence.

The new group-theoretic inputs resolve to ReductiveGroups Layers 1, 3, 4 and 6; the curve normalization and finite-map inputs resolve to AlgebraicCurves §§12B–12C, and the associated-bundle inputs to SchemeAndStackFoundations §§1.1 and 1.15–1.16. The cross-roadmap citation scan found no unresolved citations. The supplied lead concerning GlobalFunctionField.classFormation is resolved by ArithmeticGaloisDuality §R02.3.2, *The class formation of a global function field*; it is a supplier target, rather than a claim of a pinned declaration. Existing source keys VL, AH19, LL and GeL suffice for these repairs; no missing-source request or new source key is needed.

**Pinned carriers and binders.** The package commits match the requested Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The representation-side carriers remain TauCeti.FGPointRepresentationCat and TauCeti.fgPointRepresentationCategoryEquivalence in TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean:216 and line 231; the curve-bundle moduli and smooth local representation carriers needed for these targets are absent. Suggested.lean remains unchanged: its module docstring identifies the missing headline carriers, and a mechanical declaration/binder scan found zero declarations and zero variable/include blocks, so the list of per-declaration #check requests is empty and no elaborated binder changed.

**Adversarial mathematics pass.** Rows cover the mathematical statements introduced or changed by the repairs; dependency-list changes are checked against the named supplier sections above.

| Statement | Instances tried | Computed values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Half-Tate normalization, README line 36 | q=9, degree 1 and 2; q=3, degree 2 | √9=3; (√9)²=9=√81; (√3)²=3=√9; an isomorphism fixes −3 and cannot send it to +3 | The chosen coefficient isomorphism admits the selected root at every degree | Fix the root through ι and add line 48 |
| §2.2 finite-type proof through the product and Ξ | G=1; split G_m on P¹; the norm-one torus of F₉/F₃ | G=1 gives one point; a degree-2 central lattice leaves 2 classes Z/2Z; the norm-one closing equation a=−a gives a=0 | Only the shtuka closing condition bounds the nonsplit central components | Apply the new lemma to the product family, retaining the finite-type theorem |
| Uniform inverse-image bound under a finite central isogeny, line 915 | G_m→G_m by pth power, p=2,3; degree-zero target | a=−1,0,1 maps to −p,0,p; preimage of degree 0 is a=0, hence faithful associated slopes (0,0) | A bound exists without separability of the isogeny | State the full fixed-model prerequisite |
| Bounded-family hypothesis, line 915 | Same power isogenies, but every target degree allowed | Source degrees 1,2,3,… give faithful maximal slopes 1,2,3,… | Removing boundedness would make the conclusion false | Keep B finite type; add negative control |
| Character summands and correction E8, lines 917 and 2178 | SL₂×SL₂ over F₃, V=Std₁⊕Std₂; n=1,2,3,4 | (−I,I) has value (−1)·1^(n−1)=−1 on the mixed summand in each case; separate squares have values (+1,+1) on each kernel generator | A single tensor power fails, including n=#K=4; the separate powers descend | Replace the false step and record E8 |
| Scheme-theoretic descent of character powers, line 917 | μ₂ on F₂[ε]/ε²; μ₃ on F₃[ε]/ε³ | Standard character is 1+ε≠1; its square is 1+0ε=1 at p=2 and its cube is 1+0ε+0ε²=1 at p=3 | Geometric-point tests alone miss the nontrivial character | Require action on all value algebras |
| Invariant extensions and uniform lattice comparisons, line 919 | O(−x)⊂O⊂O(x), deg x=1; replace x by mx | Slopes −1,0,1 give pole error 1; the sequence O(mx) has maximal slope m and no uniform error | The pole divisor must be fixed before the bundle varies | Explicitly extend both comparisons and their duals across every bad point |
| Tensor-slope inequality, line 921 | E=O(2)⊕O(−1); e=1,2,3 | e μ_max(E)=2,4,6; tensor maxima are 2,4,6, with square slopes (4,1,1,−2) and cube slopes (6,3,3,3,0,0,0,−3) | The required lower inequality holds; no tensor semistability assertion is needed | Use the maximal-slope subbundle |
| Dual inequality and direct-sum comparison, line 921 | E∨=O(−2)⊕O(1); e=1,2,3 | e μ_max(E∨)=1,2,3 equals the tensor maxima; μ_min(E)=−1; μ_max(O(2)⊕O(−1))=max(2,−1)=2 | Duals recover the lower bound and finite sums preserve the upper bound | Include duals and sum comparisons in the interface |
| Descent of slope bounds along h, line 921 | Degree-1 identity and z↦z² on P¹ | d μ_max(E)=2,4 equals μ_max(h*E)=2,4; dual values are 1,2 on both sides | The factor is the geometric map degree d≥1 | State the pullback inequality explicitly |
| Constant splitting extension in the same descent | Norm-one torus of F₉/F₃, cubing map; constant cover of P¹ | a=−1,0,1 maps to −3,0,3; the two geometric cover components have degrees (1,1), so a slope 2 pulls back to 2 on each, rather than 4 | Total constant-extension degree cannot replace component degree | Add the component-degree Check at line 940 |
| HN truncation of the whole family, line 921 | Degree-zero O(a)⊕O(−a), bound b=1; constant dual-number families | a=0,1 have maximal slopes 0,1 and lie in the open; a=2 has slope 2 and is outside; their constant dual-number extensions have the same fibre polygons | Factorization through an open is tested on geometric points, including a nonreduced base | State that the bound contains the entire inverse-image family |
| Identity and zero-summand cases of the boundedness interface | Identity isogeny, trivial group with the trivial line, empty B | e=d=1; the trivial line has slope 0 and remains 0; empty B has 0 members; zero summands contribute no slope expression | No division by e=0 or slope of the zero bundle is used | Require e,d≥1 and omit zero character summands |
| Coefficient equivalence for smooth representations, line 2134 | Trivial line and zero representation; identity and zero morphisms | Invariant dimensions are 1→1 and 0→0; the maps 1 and 0 remain 1 and 0; ν(ϖ)=1/3 maps to 1/3 | Algebraic coefficient transport preserves smoothness and exactness | Transport through the supplier's smooth-category equivalence, with no continuity claim for ι |
| Preservation of induction and the Z/L convention, line 2134 | A one-term segment; [ν^(−1/2),ν^(1/2)] at q_K=3 | Length 1 gives Z=L=τ; length 2 gives Z=1 with monodromy rank 0, L=Steinberg with rank 1 | The two constructions remain distinct after transport | Reuse the supplied classification and pin its two-term convention |
| Intrinsic segment strings and independence of transport | Lengths a=1,2; singleton multisegment [0]+[1] on the trivial cuspidal line | Strings are τ and (τ,τν); endpoints differ by 0 and 1; [0] precedes [1], giving standard module ν×1, character quotient ν^(1/2) and Steinberg subrepresentation ν^(1/2)St | Linkage and the unique constituent characterizations survive coefficient equivalence; real endpoints are unnecessary on Q̄_ℓ | Express the transported indexing by finite norm-twist strings |
| Special Weil–Deligne block identification, line 2134 | (a,d)=(1,1),(2,1),(3,2) | Total ranks ad=1,2,6; monodromy ranks d(a−1)=0,1,4; at q=3, diag(3^(−1/2),3^(1/2)) conjugates E₁₂ to (1/3)E₁₂ | The geometric Frobenius direction and the monodromy retained by L agree | State the constituent list and both ranks |
| Square-root condition for transport, line 2143 | The two roots of q_K=3 | Half-norm values are 3^(−1/2) and −3^(−1/2); their ratio is −1 | Changing the root changes the inducing character | Fix normalization in the transport statement and its Check |
| Local reconstruction requires the continuity interfaces | Unramified Weil characters at ℓ=5 with Frobenius 5^(−1) and 2; discrete inertia C₂→F₃× | Valuations of the first nth power are −n, versus 0 for the unit character; the discrete inertia image has order 2 and open kernel of index 2, while the trivial image has order 1 | Abstract reconstruction does not imply profinite extendibility; the two coefficient topologies need their stated interfaces | Extend §7.6 Needs and Layer 7 Dependencies to LP2c.1–LP2c.4 |

**Commit.** 4e67fab8 — GlobalShtukasAndFunctionFieldLanglands: review repairs (central isogeny bounds and supplier interfaces). Only TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md changed; the worktree is clean and nothing was pushed.

**Build.** `lake build TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands.Suggested` exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands.Suggested (2.0s)
Build completed successfully (8976 jobs).
```

**Gate.** The final gate exited 0:

```text
gate GlobalShtukasAndFunctionFieldLanglands: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency direction.** The prescribed movable dependency check exited 0; it emitted no UPWARD or CYCLE line:

```text
depcheck: 48 roadmaps, 554 edges, 0 problem(s)
```
