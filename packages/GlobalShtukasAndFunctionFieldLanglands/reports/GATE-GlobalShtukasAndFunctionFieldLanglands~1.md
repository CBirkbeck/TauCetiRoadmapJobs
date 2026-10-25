## H01 (CBirkbeck) — applied

Bundle-level adjoint/cofinality assertions → faithful-representation exhaustion in `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:294` and `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:389`, with the norm-one-torus negative controls; adjoint cofinality is proved only on bounded shtuka quotients at line 912 using Frobenius closure and abelianization (VL line 8764, Lemma 12.19, pp. 159–160; proof at VL line 8774 and VL line 8784). The counterexample retains every geometric d∈Z but only |d|≤b in a faithful bound, whereas zero-leg shtukas satisfy d=−d and therefore d=0.

## H02 (CBirkbeck) — applied

Global L-group spanning → local coefficients for Q_v=im(Γ_v→Q) and ᴸG_v=Ĝ⋊Q_v at `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:800`, with fixed-leg restriction, induction retracts and coefficient projectors at line 764, their creation/annihilation comparison at line 1254, and the all-good-place character-extension argument at line 1802. VL line 8368 specifies local representations, VL line 8687 supplies fixed legs, and VL line 9033 supplies their comparison; the added product-torus Check distinguishes the local values 2 and 1/2 from the globally invariant sum 5/2.

## H03 (CBirkbeck) — applied

Finite étale model-splitting cover → étale local model trivializations with coherent inner and outer transition maps at `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:430` and line 760, retaining the original good open in the conventions and line 1792. The GL(O⊕O(1)) Check computes h⁰(Lie(𝒢)(−1))=1 versus 0 for the constant model and retains ∞; inner descent uses adjoint equivariance (VL line 2698, Remark 1.20, p. 51; VL line 8666, Theorem 12.16, p. 157), with fppf-local lifts when the centre is non-smooth.

## H04 (CBirkbeck) — applied

Two standard legs → one standard and one dual-standard leg at `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:986`: total degree 2 → 0, with an explicit trivial Frobenius-periodic bundle and identity composite modification supporting the P¹ fibre. The Check retains cohomology ranks (1,0,1) and Std⊗Std∨=1⊕Ad, and records two standard legs as an empty-shtuka negative control; the two-standard-leg Grassmannian examples remain valid in Layer 1.

## H05 (CBirkbeck) — applied

Duplicate construction of local orbits, reduced Schubert schemes and jet actions → import from GeometricSatakeAndFusion GS0, `equalCharacteristicSchubertModels`, in `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:27`, line 154 and line 571, with its Needs and layer dependency included. Section 1.2 now owns coordinate-independent transport, factorization and reduced multi-leg collision closure; EndoscopicTransferAndUnitaryTraceComparison §3.2 retains `LocalLoopGrassmannian`, and the ordinary P¹ versus perfected P¹ Check prevents replacing the imported ordinary schemes by their perfections.

## Verification and ownership

The repair is commit `83b302a`; only `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md` changed. No push or external reply was made.

The repository's README writing checklist and CONTRIBUTING were read, together with the main-branch AlgebraicVectorBundles and EtaleCohomologyFoundations roadmaps. Main was checked at `ae2562c`; Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the supplied pins.

Object searches covered main, the board packages, the indexed open roadmap heads and the supplied sibling checkouts. GeometricSatakeAndFusion GS0 explicitly constructs ordinary finite-dimensional schemes before perfection; its Schubert models, strata and finite-jet comparisons are therefore imports. EndoscopicTransferAndUnitaryTraceComparison §3.2 supplies the local quotient and coordinate-change interface; SmoothRepresentationsOfLocalGroups §SR.4.1 supplies the unramified spherical algebra and normalization; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2 supplies the dual/L-group carriers; LanglandsParameterStacks §§LP2c.1–LP2c.2 supplies prescribed-projection reconstruction. SchemeAndStackFoundations §§1.15–1.16 supplies the generic torsor/contracted-product/inner-form descent: this roadmap owns its curve-bundle and Satake applications, the fixed/moving-leg coefficient comparison, and the global collision family, rather than a second generic carrier. No later supplier was introduced or ownership moved to a later roadmap.

Cross-roadmap resolution reports no missing roadmap citation or Lean name. The supplied `GlobalFunctionField.classFormation` lead is a supplier target, present in ArithmeticGaloisDuality §R02.3.2, *The class formation of a global function field*, and is not claimed to exist at the library pins. The new exact supplier citation was read at GeometricSatakeAndFusion's indexed head; the supplied FunctionFieldArithmetic checkout confirms §§6.1–6.4 and the central-lattice hypothesis of §6.2.

The legal cached source passages read for the repairs are AH19 line 289 (faithful representations) and AH19 line 478 (finite-type bundle opens); VL line 2574 and VL line 2698 (Satake equivariance and adjoint descent); VL line 8311 and VL line 8363 (local L-group and spherical characters); VL line 8638, VL line 8687 and VL line 8710 (model descent, fixed legs and local traces); VL line 8764 through VL line 8804 (shtuka finiteness, including the source's torus and finite-central-kernel proof steps); VL line 8830 through VL line 8872 (fixed-leg cohomology and Frobenius/Hecke comparison); and VL line 9022 through VL line 9039 (local-character extension and restricted global coefficients). No source passages were copied and no new source or missing-reference request was needed; the settled Del73 citation remains uncertified.

`Suggested.lean` remains the honest empty acceptance module: none of the repaired headlines acquires the missing affine/BD Grassmannian, stack, perverse étale-coefficient or shtuka-cohomology carriers. Pinned object searches confirm that the algebraic representation side exists (`TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean`, lines 216 and 231), while those geometric carriers do not. Mechanical declaration/binder inspection found zero declarations and zero section variables: the per-declaration `#check @name` list is empty, there are no elaborated declaration signatures to compare or silently dropped hypotheses, and the required module build elaborated that empty namespace. No stand-in declaration was added.

The review contains no suspicious instruction to act outside the authorized repair. The added mathematical examples are explicit computations, not source quotations or computational library targets.

## Computed adversarial pass

This table records each mathematical assertion added or changed, including its defining comparisons, API and normalization witnesses; occurrences in several sections are listed together where they assert the same statement. The hypotheses remain arbitrary smooth connected-fibre models for faithful bundle bounds, connected parahoric models for VL's adjoint-bounded shtuka theorem, rational E-coefficients for the local character spanning/retract comparison, and ℓ≠p throughout.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: central degrees are detected by F-rational characters | G_m and constant norm-one T/F₃ | Character ranks 1 and 0; geometric degree lattices both Z | Rational degrees cannot control all geometric components | Qualified conventions and Layer 0 introduction |
| Conventions: finite outer quotient is distinct from model triviality | GL(O⊕O(1)); its product with the constant norm-one torus | Outer groups 1 and C₂; after killing either outer action the Lie obstruction still has h⁰ after twist equal to 1, versus 0 for the constant model | Both examples remain allowed | General étale model descent |
| Conventions: Q_v is cyclic with prescribed Frobenius | Product torus at t=2; split G_m | Global Q has order 4, local Q_v has order 2 generated by (−1,+1); for G_m both orders are 1 | Local and global groups can differ | Defined local notation explicitly |
| §0.6 faithful exhaustion | G_m and norm-one T on P¹, b=0,1,2 | Degree sets {0}, {−1,0,1}, {−2,−1,0,1,2}; sizes 1,3,5, while adjoint bound admits all Z | Faithful bounds survive the counterexample | Retained general exhaustion |
| §0.6 rejection of bundle adjoint finite type modulo Ξ | Norm-one T, d=0 and d=b+1 | Adjoint types both 0; faithful maximum slopes 0 and b+1, so second point fails bound b | Original assertion false | Removed general bundle comparison and added negative Check |
| §0.10 rational finiteness does not imply geometric finite type | Norm on F₉× and Pic(P¹) | With i²=2, N(1+i)=(1+i)⁴=2; unit norm image {1,2}; Pic norm 0,1,−1↦0,2,−2, kernel 0; rational torsor set has size 1, geometric degrees are Z | Rational adelic hypothesis does not exclude T | Added explicit rational/geometric distinction |
| §0.10 faithful saturation quotient and change of representation | G_m, Ξ of degree 1; ρ weights (1,−1) versus (1,−1,2,−2), b=0,2, using bounds (b,−b) and (b,b,−b,−b) | Each saturated degree set is Z and its quotient has one degree class; before saturation b=2 permits {−2,…,2} versus {−1,0,1}; both representations are faithful because weight 1 occurs | Quotient systems exhaust and are cofinal, without equal indices | Comparison restricted to faithful systems |
| §0.10 lattice action and finite degree quotient | GL₂ and line degrees 1,−2; G_m degree 0 | Tensoring changes degrees by 2,−4; quotients have 2,4 classes; degree-zero translation leaves infinitely many classes | Nonzero degree is essential in split central directions | Retained nonzero-degree condition; removed geometric overclaim |
| §0.10 rank-zero rational degree group | Semisimple SL₂, p=2 and p=3 | Rational central-degree rank 0, Ξ=1; centre point groups have sizes 1 and 2 over the respective fields | No artificial lattice generator | General semisimple case retained |
| §0.12 effective descent, objects and arrows | Trivial group; trivial split model, identity cover | One torsor and one arrow for G=1; transition products id·id=id, including after identity base change | No spurious descent choice | Explicit descent/refinement API |
| §0.12 outer transition on bundles | Constant norm-one T on P¹ | d=0 satisfies d=−d; d=1 would require 1=−1 and fails; ignoring outer action permits every integer | Outer action cannot be discarded | Added norm-one descent Check |
| §0.12 model obstruction to finite étale splitting | GL(O⊕O(1)) on P¹ over F₃ and F₉ | Lie twist degrees (−1,−1,0,−2) give h⁰=1 over either field; four trivial lines twisted by −1 give h⁰=0 | Constant-field covers cannot trivialize the model | Added obstruction witness |
| §§0.12/1.11 direction of inner transition | Frames e∞=t e₀, D=diag(1,t), t=2 | D E₁₂ D⁻¹=(1/2)E₁₂; D E₂₁ D⁻¹=2E₂₁ | Correct O(−1), O(1) root lines | Explicit frame convention and conjugation witness |
| §1.11 cocycle, composition and refinement | D(2), D(3), identity chart | E₁₂ factors (1/2)(1/3)=1/6, matching D(6); E₂₁ factors 2·3=6; D(1) gives factors 1,1 | Triple overlaps and identity agree | Required coherent inner descent |
| §§1.10/1.11 independence of inner lifts | Central rescaling D→aD; a=2 | Ad(aD)(E₁₂)=(1/t)E₁₂=Ad(D)(E₁₂); central scalar acts by a·a⁻¹=1 | Central lift ambiguity is removed | Added explicit adjoint equivariance input |
| §1.11 non-smooth centre | SL₂ in p=2 and SL₃ in p=3 over k[ε]/ε² | (1+ε)²=1 and (1+ε)³=1 respectively, with nonzero ε; derivative of a↦a^p is 0 rather than an invertible derivative | Étale lifts cannot be assumed | Replaced proposed étale lifts by fppf-local lifts |
| §1.11 tensor compatibility of inner descent | E₁₂ and E₂₁, t=2 | Tensor transition factors (1/2)·2=1; pairing/evaluation transition also 1 | Descent respects evaluation and tensor products | Coherent equivariant descent is a target |
| §1.11 full arithmetic category versus finite Q | G=1, ℓ=2, Frobenius 3 or −1 | 3²=9≠1 and 3 has infinite order; (−1)²=1 | Full arithmetic category remains larger | Retained arithmetic/finite-form distinction |
| §1.11 fixed-leg restriction and local retract | Q=C₂×C₂, Q_v first factor, V weight z on second coordinate | Induced global dimension 2; restriction V⊕V∨; p=(1,0), i=(1,0)ᵗ give pi=1 and ip=diag(1,0) | Local coefficient exists without global extension of V | Added induction/restriction bridge |
| §1.11 projector and independence from extra containing summands | Res W=V⊕V∨, or V⊕V∨⊕1 | Projectors diag(1,0) and diag(1,0,0) square to themselves; projected trace z in both, versus z+z⁻¹ and z+z⁻¹+1 unprojected | Local result independent of containing representation | Explicit coefficient idempotent comparison |
| §1.11 dual, evaluation and coevaluation comparisons | One-dimensional local V inside two-dimensional restricted W | Local coevaluation e⊗e∨ evaluates to 1; inserting the dual inclusion/projection still gives 1; unprojected W evaluates to 2 | Projectors must occur in leg maps | Added evaluation/coevaluation API |
| §1.11 several fixed/moving legs and allowed fusion | Two one-dimensional retracts with weights z,w; unit moving coefficient | Tensor projector has image dimension 1; tensor trace zw; for w=z⁻¹ trace 1; tensoring with unit gives z | Induction itself is not tensor; the split local coefficient is | Required exterior-product and allowed-fusion comparisons |
| §1.11 full local image special case | Q_v=Q, including Q=1 | Index 1, induced dimension dim V, i=p=id, ip=1; unit evaluation 1 | Recovers existing global coefficient | Added identity comparison Check |
| §1.11 pinning/Tate comparison retained with descent | Split dual SL₂, cycl=3; torus; identity Galois element | Old map gives u(1/3) versus u(3); right-multiplication correction gives u(1)c⁻¹ both ways; torus has 2ρ=0 and c=1; identity has c=1 | New inner descent preserves the existing normalization | Retained corrected semidirect-product map |
| §1.11 half Tate character hypothesis | Complex conjugation of order 2 | Every character value has square 1, while cycl(c)=−1 | General-field square root cannot be implicit | Existing hypothesis retained |
| §1.12 local twisted-character spanning | Unramified norm-one torus and split G_m | Invariant cocharacter lattices 0 and Z; spherical algebras E and E[z,z⁻¹]; local trivial-character trace 1 | Correct local carriers in both extremes | Local L-group replaces global coefficient index |
| §1.12 counterexample with locally nonsplit factor | F₃(t), t=2 in quadratic extensions t and t−1 | Residues 2,1; squares in F₃ are 0,1; first inert, second split; local invariant lattice 0⊕Z | Q_v has order 2 despite Q of order 4 | Added product-torus negative control |
| §1.12 local versus global characters | Previous torus, z=2 and z=1/2 | Local character values 2 and 1/2; induced global trace both 5/2 | Global characters miss an individual local operator | Repaired spanning claim |
| §1.12 conjugacy quotient and normalization | Norm-one torus; GL₂ at q_v=9 | Twisted conjugation sends g to g s², so the torus twisted quotient is one point; GL₂ normalized open value +1/3 versus IC trace −1/3 | Local quotient and parity convention agree | Added local-character proof with normalization retained |
| §2.2 torus Frobenius finite type | Constant norm-one T, no legs, d=−1,0,1 | Closing differences 2d=−2,0,2, hence only d=0; Ξ=1 | Frobenius removes geometric anti-invariant degrees | Added separate source-backed shtuka proof |
| §2.2 split central directions and lattice | G_m, no legs, deg Ξ generator 1,−2,3 | Frobenius gives d=d for all integers; quotient degree-class counts 1,2,3 | Frobenius alone is insufficient | Added split-torus Check |
| §2.2 trivial group and infinitesimal automorphisms | G=1; scalar 1+ε under q-Frobenius, ε²=0 | Trivial shtuka is a point; (1+ε)^q=1, so equality with 1+ε forces ε=0 | No rank-zero lattice; infinitesimal stabilizers vanish | Added degenerate Check, retained DM argument |
| §2.2 finite central kernel route | GL₂→PGL₂×G_m, diagonal torus coordinates a,b | Map ([diag(a,b)],ab); kernel a=b and a²=1, hence μ₂; tensor square of the standard representation kills this kernel, even in p=2 where its length is 2 but geometric point count is 1 | Tensor-power reduction uses scheme kernel, not just points | Explicit finite-kernel/abelianization route |
| §2.2 cofinality on shtukas only | Norm-one T with no legs; split G_m modulo degree-one Ξ | All adjoint and saturated faithful shtuka bounds contain the one remaining degree 0 in either example; bundle norm-one adjoint system still contains all Z | Examples distinguish the corrected domain | Moved cofinality to quasi-compact bounded shtuka quotients |
| §2.5 degree-balance repair | GL₂ standard/standard, then standard/dual | Degree sums 1+1=2 and 1−1=0; Frobenius determinant-degree change 0 | First stack empty; second admits trivial identity composite | Replaced the shtuka example |
| §2.5 proper fibre and Satake constituent | Standard/dual collision, E coefficients including ℓ=2 | Fibre parametrizes lines in k², P¹; H⁰,H¹,H² ranks 1,0,1, total 2 versus point total 1; representation ranks 2·2=1+3=4 | Nonempty fibre retains its degree-two class and unit constituent | Corrected tensor decomposition and explicit base point |
| §1.2 unit and coordinate-independent transport | Weight 0; t↦at; identity coordinate | 0↦0; (at)^mR[[t]]=t^mR[[t]] since a^m is a unit; m=0,1,−1 unchanged | Imported local positions are coordinate independent | Transport, rather than local reconstruction |
| §1.2 factorization and collision | G_m weights (1,−1) and (1,1) | Collision exponents 0 and 2; on disjoint legs ordered pairs remain (1,−1) and (1,1) | Factorization must distinguish disjoint and collision bases | Added numerical collision Check |
| §1.2 ordinary model and nonreduced tests | GL₂ minuscule P¹ over F₃; k[ε]/ε² | At a fixed point of P¹ the tangent fibre has 3 elements, while its perfection has only the constant lift; determinant degree +1 versus inverse degree −1 | Ordinary model cannot be replaced by perfection | Imported ordinary GS0 model, added Check |
| §1.2 reduced closure, Bruhat strata and finite jets | GL₂ bound (2,0), lower (1,1); jet action on minuscule quotient | Difference (2,0)−(1,1)=(1,−1) is a positive coroot; minuscule P¹ has dimension 1 and kernel 1+tM₂ acts trivially on k²/tk² | Open orbit alone is too small; jet action agrees locally | Only curve transport/collision closure remains owned here |
| §3.6 local projection through creation/Frobenius/annihilation | Product torus, degree-one place, z=2 | Projected composite trace 2; unprojected global composite 2+1/2=5/2 | Missing projector changes the operator | Updated local Hecke comparison |
| §§1.11/3.6 fixed-leg Frobenius return | Degree-two place, q=3 | One q-Frobenius interchanges residue embeddings; two return to the chosen one, with q_v=9 rather than 3 | No single fixed-leg partial Frobenius endomorphism assumed | Explicit return iterates and residue-field descent |
| §5.10 local character extension and prescribed projection | Q=C₂×C₂, Q_v first factor | Extend χ_V on the two Q_v components and set it to 0 on the other two; restriction gives χ_V, and σ(Frob_v) lies in a Q_v component by its projection | Extension is regular and LG_v-invariant, without full-Q invariance | Added VL(e′) argument |
| §5.10 scalar comparison on all spherical operators | Local weight ±1, z=2 | Scalars 2 and 1/2, with global symmetric sum 5/2; projected construction and parameter trace both give 2 for weight +1 | Individual local operators are recovered | Updated theorem and proof |
| §5.10 finite quotient at good places | Split G_m, U=P¹, N empty; proposed quadratic extension √t | Required Q=1; √t has ramification indices 2 at 0 and ∞, versus required 1 | Auxiliary outer ramification remains excluded | Original good-place hypothesis retained |
| §5.10 all good places for nonconstant model | GL(O⊕O(1)), at 0 and ∞ | Both fibres are GL₂; each standard Schubert fibre has dimension 1 and normalized open value +1/√3, with Q=1 | Neither good place is lost | Model descent on full U |

## Build and gates

`lake build TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands.Suggested` exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands.Suggested (2.3s)
Build completed successfully (8976 jobs).
```

The final direction check exited 0, with no UPWARD, CYCLE or moved line:

```text
depcheck: 43 roadmaps, 441 edges, 0 problem(s)
```

The full gate exited 0 after commit, with a clean worktree:

```text
gate GlobalShtukasAndFunctionFieldLanglands: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
