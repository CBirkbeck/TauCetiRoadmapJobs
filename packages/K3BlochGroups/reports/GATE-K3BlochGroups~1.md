## H01 (CBirkbeck) — applied differently

The shared-carrier contract in `TauCetiRoadmap/K3BlochGroups/README.md:15` and `TauCetiRoadmap/K3BlochGroups/README.md:2254` now specifies Coleman's carrier aliases, symbols, boundary and field maps, while the reduced-presentation equivalence is explicitly symbol-preserving and field-natural, with its boundary square and kernel restriction at lines 677 and 718 and computed Checks at lines 688 and 728. The supplied merge order places the shared algebraic construction in K3BlochGroups Layer 3 before ColemanIntegration, but ColemanIntegration §L2.Fb and PolylogarithmFunctions “Downstream consumers” still assign that construction to ColemanIntegration; those files are outside the permitted edits, so the cross-roadmap ownership conflict remains open and needs those two contracts reconciled.

## H02 (CBirkbeck) — applied

The identification of separately normalized injections has become equality of their images in `TauCetiRoadmap/K3BlochGroups/README.md:1870` and `TauCetiRoadmap/K3BlochGroups/README.md:1880`, retaining the natural exact sequence for the specified monomial injection; Hutchinson's statement and proof give the homological sequence, without the additional monomial-arrow normalization (hutchinson2013 line 1731, Corollary 7.5, pp.35–36). The new Check at line 1891 computes the equal eight-element images of the multipliers 3 and 15 on ℤ/8→ℤ/24, their distinct values at 1, and the automorphism fixing both the ℤ/4 quotient and the order-two kernel.

## H03 (CBirkbeck) — applied

Stable GL/E and Whitehead's theorem are now attributed to AlgebraicKTheory A1, with GeneralAlgebraicKTheory §§3.3–3.4 explicitly supplying aliases and transport, in `TauCetiRoadmap/K3BlochGroups/README.md:9`, line 63 and line 67. The native field-matrix helper is identified with A1's block inclusion after the specified reindexing in §4.8, line 1291, and `TauCetiRoadmap/K3BlochGroups/Suggested.lean:74`; its rank-zero and rank-one values are unchanged.

### Signature and ownership verification

All 13 declarations were re-elaborated together with `#check @name` in a scratch copy, and every printed type was compared with the supplied elaborated signature and its README statement: all 13 types are unchanged, and no binder repair was needed. In particular, the types retain `Infinite F`, the bounds on homological degrees, `NeZero m`, identity coefficient morphisms, `Fintype F`, `Fact p.Prime`, `CharP F p`, the cardinality bound 4≤q, and `IsFormallyReal F` where required; the final acceptance file contains no temporary signature checks.

Ownership was searched by object in main, the cached open-roadmap inventory, the supplied sibling heads, board packages and the pinned libraries. The existing conflicting construction is ColemanIntegration §L2.Fb; Polylogarithms “Scope and ownership” already assigns the general algebraic objects to K3BlochGroups Layers 3–4, and no new dependency on a later roadmap was introduced. The revised contract moves the common algebraic input to the earlier Layer 3 and leaves the p-adic evaluation, branch descent and coordinate transport with ColemanIntegration; this records the required ownership direction without claiming the other two documents have changed.

The cross-roadmap resolver found no unknown roadmap references. The previously flagged `uce.source_superperfect` is an explicit target of StableHomotopyKTheory §3.29, not a claim of a pinned library declaration. The pins were confirmed as Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: Mathlib's native GL carrier is matrix units (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42`), while Tau Ceti's antisymmetric tensors are the negative flip eigenspace (`TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126`), distinct from the retained cokernel. The resolver's library-name phase was unavailable, so those pinned interfaces were checked directly.

The presentation and boundary deductions use weibel line 29550 and weibel line 29553 (VI.5.1, PDF p.495); the finite homology and Bloch orders use hutchinson2013 line 704, hutchinson2013 line 861 and hutchinson2013 line 1679. The stable-matrix attribution agrees with AlgebraicKTheory A1 and GeneralAlgebraicKTheory §§3.3–3.4, and its mathematical convention with weibel line 9957 and weibel line 10139; the existing waived Suslin citations remain settled.

### Adversarial mathematics pass

The table records the changed mathematical clauses and all retained acceptance declarations. Finite SL₂ homology invariants on the left are read from the cited source; the numerical values of the proposed cyclic orders and presentation relations are evaluated explicitly, rather than inferred from successful elaboration.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Shared pre-Bloch carrier, reduced/unreduced presentation | F₂, F₃, F₄, F₅, F₇ | Reduced presentations give 0, ℤ, ℤ/5, ℤ/6, ℤ/8; unreduced adds one generator and the relation [1]=0, giving the same groups. Maximal-minor gcds are 1, 0, 5, 6, 8. | Same integral presentation at all tested sizes | Exact common-carrier contract |
| Shared antisymmetric tensor carrier | U=C₄, C₃; zero module | C₄⊗C₄=C₄, quotient by 2 gives C₂ with diagonal 1; C₃/2C₃=0; the zero-module quotient is 0. Exterior square of C₄ is 0 instead of C₂. | Diagonal retained | Explicit common Qₛ(F) |
| Shared boundary and sign | F₅, ℚ | At F₅, [2]=2[3], ∂[2]=0 and ∂[3]=1 in C₂. Over ℚ, v₂-v₃ pairing on 3∧(−2) is −1, reversed order +1. | Map determined, sign distinguished | Boundary shared, not just its kernel |
| Shared Bloch kernel | F₂, F₃, F₅ | Kernels are 0, 2ℤ inside ℤ, {0,2,4} inside ℤ/6; [3] in F₅ has boundary 1 and is excluded. | Both containments distinguish kernel from quotient | Common kernel specified |
| Shared field maps | ℚ→ℂ; identity and composite embeddings | [2] goes to [2] by either symbol route. The image of 2∧(−1) is 0 since 2=(√2)², so both boundary routes give 0; over ℚ its sign–v₂ detection is 1. Identity and composite maps send [2] to [2]. | Naturality does not require injectivity on Bloch carriers | Exact field-map contract |
| Reduced-to-unreduced isomorphism and inverse | F₃; generators 0,1; admissible pair (4,2) over ℚ | On the F₃ free generator both composites are +1; negation gives −1. Symbols at 0,1 give 0 on either quotient. Pair arguments are (4,2,1/2,3/2,3), giving the same zero relation in each quotient. | Symbol preservation excludes unmarked automorphisms | Adapter strengthened |
| Evaluation transport | F₃, additive target ℤ, generator mapped to 7 | Evaluating then transporting and transporting then evaluating both give 7; the zero transport gives 0. | Universal property preserves evaluation | Exact transport clause |
| Boundary square for the presentation adapter | ℚ, symbols [2],[3] | For [2], both routes give 2∧(−1), detected as 1 modulo 2; a zero adapter gives 0. For [3], both give 3∧(−2), valuation pairing −1. | Same boundary, hence same kernel | API and discriminating Check added |
| Kernel restriction of the adapter | F₃, F₅ | At F₃, generator 2[−1] has boundary 2 mod 2=0; [−1] has boundary 1. At F₅, [2]=2[3] has boundary 0 and [3] has boundary 1. Both presentations give these values. | Restriction and inverse preserve exactly the kernels | Explicit natural kernel isomorphism |
| Native finite block inclusion and inverse | n=0, n=1 over ℚ | Empty matrix maps to (1); (2) maps to diag(2,1), inverse diag(1/2,1), product diag(1,1), determinant 2. A zero last block has determinant 0. | Same map as A1, including rank zero | Ownership and adapter attribution |
| Stable GL/E alias and Whitehead theorem | Zero ring; distinct-index commutator over ℤ; finite E₂(F₂) | Zero-ring GL and E both have one element. [I+E₁₂,I+E₂₃]=I+E₁₃. E₂(F₂)=S₃ has order 6 and derived subgroup A₃ order 3, so finite-rank perfection would fail. | Stable theorem, not a finite-rank assertion | A1 exposed as owner |
| Finite exact sequence, both parities | q=4,5,7,8,9 | (order K₃, order T̃, order B)=(15,3,5),(24,8,3),(48,12,4),(63,7,9),(80,16,5). In each case order K₃/order T̃ equals order B. | Order calculation agrees with chosen-arrow exactness | Equality-of-arrows claim narrowed |
| Enhanced-Tor injectivity through closure | Standard cyclic transition C₈→C₁₆; µ₂ kernel | H₃ transition sends 1 to 2, with image {0,2,4,6,8,10,12,14}, of order 8; µ₂ inclusion sends its nonzero element to the nonzero element, not 0. | Injective transition consistent with closure argument | Separately identify injectivity and image arguments |
| Range equals kernel in cyclic K₃ | q=4,5,7 | The unique subgroups of sizes 3,8,12 in groups of orders 15,24,48 have indices 5,3,4, equal to the computed Bloch orders. | Both subgroups coincide without fixing generator images | Image comparison only |
| Equality of images does not identify arrows | C₈→C₂₄, multipliers 3 and 15 | Both images are {0,3,6,9,12,15,18,21}; values at 1 are 3 and 15. Precomposition by 5 has 5·4=4 mod 8 and 5x=x mod 4. | Counterexample to the deleted normalization inference | Negative-control Check added |
| Naturality of the chosen finite arrows | Identity F₅ embedding; composite identity | On 0∈T̃(F₅), both left routes give 0∈C₂₄, and on a source generator either route has image of order 8. On 0∈K₃(F₅), both right routes give 0∈C₃, and either right route has image of order 3. These identity tests do not compare with a different injection. | Naturality belongs to the constructions, not the order argument | Wording separates these inputs |
| antisymSquare | R=ℤ, M=ℤ, C₃; zero ring with zero module | ℤ/2ℤ=C₂, C₃/2C₃=0, and the zero module gives 0; negative flip eigenspace on ℤ is 0 instead of C₂. | Definition matches README | No signature change |
| antisymSquare_diagonal_exact | A=0, ℤ, C₂, C₃, ℤ² | Diagonal kernels are 0,C₂,C₂,0,(C₂)². For ℤ², projection (a,b,c)↦c kills (1,0,0) and sends (0,0,1) to 1. In ℤ, diagonal equality at 1,3 is true since 1−3=2(−1); at 1,2 it is false. | Exactness and both directions of diagonal relation agree | No signature change |
| preBlochRawSymbol | F₂, x=0,1 | Values are 0 and a nonzero free generator, respectively; raw [1] is not 0. | Raw and quotient symbols distinguished | No signature change |
| preBloch | F₂,F₃,F₄,F₅,F₇ | 0,ℤ,C₅,C₆,C₈, with relation-index values 1,0,5,6,8 above. | Real quotient matches integral conventions | No signature change |
| preBlochSymbol | F₅, x=0,1,2,3,4 | Coordinates in C₆ on [3] are 0,0,2,1,0; orders at 2 and 3 are 3 and 6. A zero symbol map gives 0 at both. | Total extensions and nonzero symbols match | No signature change |
| generalLinearStabilization | n=0,1; (2) over ℚ | Empty→(1); (2)→diag(2,1), inverse diag(1/2,1); determinant 2 and product I₂. | A1 specialization | Docstring attribution only |
| generalLinear_homology_stable | (n,i)=(0,0),(1,1); excluded (0,1) over ℚ | H₀ map ℤ→ℤ is 1↦1; H₁ determinant map ℚˣ→ℚˣ is 2↦2. Outside the range, 0→ℚˣ misses 2. | Range and coefficient identity needed | No signature change |
| cyclicHomology_power_map | m=7, a=2, j=1,2; m=1; excluded j=0 | H₁ multiplier 2¹=2; H₃ multiplier 2²=4. At m=1 both groups are 0. At j=0 total subtraction yields degree 0, H₀=ℤ rather than C₇. | Weight two and index restriction match | No signature change |
| symmetricGroup_homology_stable | (n,i)=(0,0),(2,1); excluded (1,1) | H₀ is ℤ→ℤ with 1↦1; Σ₂=C₂→Σ₃=S₃ gives C₂→C₂ on H₁ with transposition↦1. Excluded Σ₁→Σ₂ gives 0→C₂. | Includes a nonabelian test and sharp lower range control | No signature change |
| finite_sl2_localized_homology | q=2,3,4,5,7,8,9,27 | Source homology orders after localization: 3,8,15,24,48,63,80,728; right side q²−1 gives the same list. | Both small characteristics and exceptional sizes retained | No signature change |
| finite_sl2_integral_homology | Same fields | Source integral homology orders: 6,24,30,120,48,126,240,2184; conditional p(q²−1) formula gives exactly this list. At q=7 it gives 48 without a p-factor. | Exception list matches hutchinson2013 lines 704 and 861 | No signature change |
| finiteBloch_order | F₄,F₅,F₇; excluded F₂,F₃ | Presentation kernels have orders 5,3,4, equal to q+1,(q+1)/2,(q+1)/2. At F₂ the kernel is 0, not C₃; at F₃ it is 2ℤ, not C₂. | q≥4 essential | No signature change |
| blochC_order_six | ℚ and real-closed extension; F₅ as negative control | Detector coefficients: 1/12−1/4=−1/6; multiples 2,3,6 are −1/3,−1/2,−1, so exact order 6 modulo ℤ. At F₅, c=2[3] has order 3. | Formally-real hypothesis and period agree | No signature change |

### Build and gates

Commit: `000a2ba` — `K3BlochGroups: review repairs (shared carriers, finite torsion images, stable matrix ownership)`; only `TauCetiRoadmap/K3BlochGroups/README.md` and `TauCetiRoadmap/K3BlochGroups/Suggested.lean` changed, and the worktree is clean. Nothing was pushed.

`lake build TauCetiRoadmap.K3BlochGroups.Suggested` exited 0, with the eight intended theorem-`sorry` warnings and no errors:

```text
Build completed successfully (8976 jobs).
```

The first gate run reported only the two uncommitted files; after the required commit the final gate exited 0:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check with `--movable` exited 0; its complete output contains no UPWARD, CYCLE or moved line:

```text
depcheck: 28 roadmaps, 253 edges, 0 problem(s)
```
