# Review of SpinGeometry (pull request #1674 at 8cec611)

**Verdict:** accepted

:robot: Independent AI incremental re-review of 43 changed lines since 49fce1a. There are no findings. The folder is ready for a human's final approval; this verdict does not approve or merge the pull request.

The 43 lines are entirely in the generated progress files. Both specified review targets, `TauCetiRoadmap/SpinGeometry/README.md` and `TauCetiRoadmap/SpinGeometry/Suggested.lean`, are byte-identical to the accepted head of review ~30. The Mathlib and Tau Ceti pins are also unchanged. Accordingly, this report carries forward the mathematical review instead of repeating it.

## Previous findings

Review ~30 introduced no findings. Its one carried repair remains intact:

- R01 — repaired: `TauCetiRoadmap/SpinGeometry/README.md:1623` preserves the chosen orientation under equivalence; `:1735` fixes an orientation before twisting, and `:1744` restricts transitivity to lifts of that orientation. The point and circle Checks remain at `:1666`.

## Verified sound

**Scope and gate.** Confirmed HEAD is `8cec6116e2d9a01ce8a81d725902e28e80b9bca8` and the worktree is clean. The README and Lean file have no changes since 49fce1a; the 26 additions and 17 deletions belong to generated `STATUS.md` and `PROGRESS.md`, which are outside the two review targets. These are inherited main-branch updates, not additional PR changes: the three-dot diff against `origin/main` contains only the README and Lean file in SpinGeometry. The long outside-folder list in the incremental change data likewise describes intervening main changes; the required three-dot outside-folder diff is empty. No out-of-scope edit finding applies.

My gate rerun passes all 28 reported checks, including statement hygiene, imports, dependencies, stray files and outside-folder scope. The supplied worker gate additionally records `build=0` for the targeted module build. The direct elaboration below independently passes. No repository file was edited.

The required dependency command returned:

```text
depcheck: 228 roadmaps, 2121 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No dependency or target changed in this incremental diff.

**Elaboration and signatures.** `lake env lean` on the absolute path of the designated `Suggested.lean`, run from the PR worktree, exited 0 with only its line 129 `sorry` warning. A separate scratch copy with `#check @name` for both declarations also exited 0. Their types match `README.md:1610` and `:1844`:

- `SpinStructure` keeps the base topology, total-space topology, fibre inner products and `NeZero n`; its principal bundle and equivariant frame map are actual data.
- The rank-two criterion keeps a Hausdorff CW base in `Type`, rank exactly two, fibre/vector-bundle structures, continuous Riemannian metric and integral Thom class. The conclusion is existence of a Spin structure iff the Euler class is twice an integral class.

There is no lost binder and no signature change. The worker's extra entry named `of` is a scanner match inside the module docstring, not a declaration. The file contains two declarations, not three. A fresh scratch padding probe tried `simp`, `rfl`, `infer_instance` and `exact Iff.rfl`; none closes the headline. No substitute theorem or sorry'd data was added.

**Pinned declarations opened (7).** Mathlib remains `1b1ccf4b`; Tau Ceti remains `2fd255d9`. Paths below are relative to their library repositories.

| Declaration | Pinned file and line | What was verified |
| --- | --- | --- |
| `TauCeti.PrincipalBundle` | TauCeti/Topology/FiberBundle/Principal.lean:156 | Equivariance of atlas trivializations for the right action; no numerability field or automatic continuity assumption for arbitrary structure groups |
| `TauCeti.OrthonormalFrameBundle` | TauCeti/Topology/VectorBundle/OrthonormalFrame/Basic.lean:109 | A base point and a linear isometric equivalence to its fibre; no chosen orientation |
| `TauCeti.thomPair` | TauCeti/Topology/VectorBundle/EulerClass.lean:108 | Total space relative to the complement of the zero section |
| `TauCeti.IsThomClass` | TauCeti/Topology/VectorBundle/EulerClass.lean:245 | Finite dimension is part of the predicate, together with fibrewise generation |
| `TauCeti.eulerClass` | TauCeti/Topology/VectorBundle/EulerClass.lean:356 | Restriction followed by pullback along the zero section |
| `HilbertSpace` | Mathlib/Analysis/InnerProductSpace/Defs.lean:604 | The near-match bundles a complete inner-product space; it is not a Spin structure |
| `CliffordAlgebra.spinGroup` | Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:293 | The near-match is an algebraic submonoid; its membership equivalence at line 299 is not the bundle existence criterion |

The broader pinned-library audit of unchanged text is carried from review ~30 via ~29, rather than claimed as freshly repeated.

**Suppliers and overlaps.** Re-ran citation resolution against main `8101f2c` and the indexed 438 open heads: no unresolved cross-roadmap citation. That tool explicitly did not check external library names, so it is not evidence for those; the pinned checks above and the unchanged-pin prior audit supply that evidence. Re-read the named supplier block and checked the current section locations for its 11 suppliers. In particular:

| Citation | Current repository-relative witness |
| --- | --- |
| CharacteristicClasses C1.0: oriented frames and metric transport | TauCetiRoadmap/CharacteristicClasses/README.md:214 |
| CharacteristicClasses C3.2: top Stiefel–Whitney class as Euler reduction | TauCetiRoadmap/CharacteristicClasses/README.md:1106 |
| SpinRepresentations Layer 2: simple connectivity in rank ≥3 | TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:520 on main |
| AlgebraicTopology §8.9: primary relative obstructions | TauCetiRoadmap/AlgebraicTopology/README.md:2108 |
| ComplexKahlerGeometry K5/K5a and former-number mapping | TauCetiRoadmap/ComplexKahlerGeometry/README.md:365, :1438, :1440 |
| SmoothBundlesConnections B1–B5 and B6.0 | TauCetiRoadmap/SmoothBundlesConnections/README.md:219, :557, :869, :977, :1070, :1306 |
| TopologicalKTheory T1–T3, T6 and T7 | TauCetiRoadmap/TopologicalKTheory/README.md:170, :757, :928, :1202, :1517 |
| GeneralizedCohomology G5 | TauCetiRoadmap/GeneralizedCohomology/README.md:1373 |
| PseudodifferentialOperators P1.0/P4–P6 | TauCetiRoadmap/PseudodifferentialOperators/README.md:164, :782, :927, :1484 |
| RiemannianGeometry R1/R7; DifferentialGeometry L0–L2/L5–L9 | TauCetiRoadmap/RiemannianGeometry/README.md:863, :3522; TauCetiRoadmap/DifferentialGeometry/README.md:691, :862, :1005, :1644, :2406, :2469, :2521, :2634 |

Read the scope and conventions of the merged SmoothBundlesConnections and PseudodifferentialOperators roadmaps as shape references. No new object, ownership claim, fully qualified declaration name or supplier is introduced here. The existing section-level supply analysis is carried from reviews ~29–30.

Both overlap leads were checked against the actual citing text:

- G1's former anchor is cited by GeneralizedCohomology on main at `TauCetiRoadmap/GeneralizedCohomology/README.md:42`; that link is pinned to commit 41b8e275. SpinRepresentations #1207 also cites it at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:1099` and `:1574`.
- G4's former anchor is cited by #1207 at the same file's `:1101` and `:1575`.
- `TauCetiRoadmap/SpinGeometry/README.md:519` retains the explicit former-heading → layer table, including G1 and G4. This is the mapping the overlap rule permits, so neither lead is a finding.
- Retrieved #1207 through `roadmaps show` because the supplied flat checkout path was absent; its actual nested roadmap path is the one cited above. Its scope at line 40 assigns Clifford bundles, spin structures and Dirac operators to SpinGeometry. The object search through `roadmaps grep` corroborates that ownership. No declaration changed, so the rest of the open-ownership audit is carried forward.

The PR description still describes the unchanged README and Lean file. No change makes its summary block false.

**Source sample and headlines.** All 15 seeded targets—G1.1, G1.3, G2.2, G2.3, G3.4, G4.2, G4.3, G4.4, G4.4a, G5.1, G5.2, G5.3, G6.2, G6.5 and G6.6—lie wholly outside the incremental diff. There are zero changed source locators and zero changed mathematical statements to resample. Source certification is carried from [review ~30](PRREVIEW-SpinGeometry~30.md) and its incorporated [review ~29](PRREVIEW-SpinGeometry~29.md), subject to the limitations below.

For the retained orientation repair I also reopened Kirby Chapter IV, pp. 33–34 (`kirby line 1133`, `kirby line 1157`, `kirby line 1163`) and Nicolaescu Proposition 12.2.25 / Remark 12.2.28 / Exercise 12.2.30, pp. 669–670 (`nicolaescu line 30950`, `nicolaescu line 30971`, `nicolaescu line 30984`). They support the oriented lift and fixed-orientation torsor interpretation.

The unchanged headline inventory is: smooth Clifford/spinor comparisons; w₂ existence and the H¹ torsor; skeletal comparison and rank-two Euler divisibility; plane-bundle square roots; intrinsic Dirac and closed-domain/adjoint results; Bochner and Lichnerowicz formulas and curvature vanishing; D=d+d*; the real KO index; the compact-support symbol; and quaternionic index parity. The Euler-divisibility theorem is stated. The module docstring names the missing carriers for the other geometric headlines and cites the already-proved algebra. No headline or statability claim changed.

**Adversarial table, carried forward.** Each row below retains the computed values from review ~30, including the ~29 rows it incorporated. References to bare README line numbers are to `TauCetiRoadmap/SpinGeometry/README.md`; its lines have not moved since ~30. The two ~29 rows superseded by the orientation repair are omitted. There are 37 rows, zero changed statements, and no new requested repair. The G4.4a headline row includes G4.3's obstruction test; G4.4's count row and G6.1's circle row include the G6.5 instances.

| Statement | Instances | Values on each side | Result; provenance |
| --- | --- | --- | --- |
| G4.2 class decomposition (`:1623–1627`) | X=pt, V=ℝ²; S¹, V=TS¹; non-orientable V (Möbius line bundle); disconnected X=pt⊔pt, V=ℝ² | pt: 2 orientations × 1 lift class = 2, matching the two components of O(2). S¹: 2 × \|H¹(S¹;ℤ/2)\|=2 × 2 = 4. Möbius: local sections of P give continuous local frames of one sign, hence a global orientation, a contradiction; 0 structures. pt⊔pt: 4 orientations × 1 = 4 = 2 per point, squared | holds; none  carried from review ~30 |
| G4.2 Check, rank one (`:1670–1673`) | n=1, g=−1 ∈ Spin(1) | the vector action of ±1 on ℝ¹ is the identity, so the frames of p and p·(−1) agree: the frame map is constant on fibres, and the structure is an orientation plus a double cover | holds; none  carried from review ~30 |
| G4.2 Check, wrong reading (`:1673–1675`) | pt and S¹ | one H¹ torsor would give \|H¹(pt)\|=1 against 2, and \|H¹(S¹)\|=2 against 4 | discriminates; none  carried from review ~30 |
| G4.2 Check, circle (`:1661–1665`) | S¹; a simply connected base | S¹: 2 double covers for the fixed orientation. Simply connected X: H¹(X;ℤ/2)=Hom(π₁,ℤ/2)=0, a line bundle is trivial, so 1 per orientation | holds; none  carried from review ~30 |
| G4.4 torsor, fixed orientation (`:1735–1745`) | pt (n=2); S¹ (n=1); the twist by ε | pt: 1 class = \|H¹\|=1. S¹: 2 = \|H¹\|=2. Twisting multiplies transitions by central ±1, which acts trivially on frames, so the frame map and its orientation are unchanged | holds; the witness of ~29 R01 no longer refutes it  carried from review ~30 |
| G4.4 Check counts (`:1770–1775`) | S¹, T², Sⁿ (n≥2), tangent bundles | fixed orientation: 2, 4, 1 (\|H¹\|=2, 4, 1). Connected orientable bases have 2 orientations, so full-frame structures number 2·2=4, 2·4=8, 2·1=2, as stated | holds; none  carried from review ~30 |
| G4.4a rank one and TS² (`:1851–1856`, `:1875–1877`) | TS² with either orientation; rank one over S¹ | TS²: e=±2=2·(±1), H¹(S²;ℤ/2)=0, so 1 structure per orientation, 2 in all. Rank one over S¹: an orientation trivializes V, 2 lifts for it | holds; none  carried from review ~30 |
| G4.4a Check, rank three on S¹ (`:1878–1880`) | trivial ℝ³ bundle, standard orientation | π₁SO(3)=ℤ/2 gives 2 loop classes, 2 skeletal classes, 2 lifts = \|H¹(S¹;ℤ/2)\|; constant frames see 1 | holds; none  carried from review ~30 |
| G5.3 Check (`:2104–2108`) | S² with E=TS²; flat T² | c₁=2, no 2-torsion in H²(S²;ℤ)=ℤ, one root (c₁=1) for the orientation of J; reversing J gives E̅ with c₁=−2 and root −1, the other orientation's structure. T²: 4 flat roots = \|H¹(T²;ℤ/2)\| | holds; none  carried from review ~30 |
| `SpinStructure` docstring (`Suggested.lean:85–87`) | n=2 over a point; n=1 over S¹ | the structure chooses the orientation (2 classes over the point, 4 over S¹); equivalences preserving `toFrame` preserve it; H¹ acts on the classes of one orientation (1 and 2) | agrees with G4.2 and G4.4; none  carried from review ~30 |
| Headline `nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul` against the changed text | TS²; e=1 on S²; u↦−u | TS²: e=±2, both sides true for either orientation. e=1: 1∉2ℤ, both false. −u gives −e, divisibility unchanged, so "exists for either orientation" (`:1849–1851`) is consistent with the new per-orientation counts | holds; statement untouched  carried from review ~30 |
| Headline `nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul` (G4.4a) | X=∅; X=pt; S² with TS² and with e=±1; ℝP² with its nontrivial oriented plane bundle; u↦−u; non-orientable E | ∅: H²=0, both sides true. pt: e=0=2·0, and P=Spin(2) maps onto the frames of one orientation. TS²: e=±2=2(±1), spin. e=1: 1∉2ℤ, w₂≠0. ℝP²: H²(ℝP²;ℤ)=ℤ/2, 2H²=0, ρ:ℤ/2→ℤ/2 injective, so w₂≠0; both sides false. −u gives −e, divisibility unchanged. Non-orientable: no Thom class, so `hu` cannot hold. A `SpinStructure` forces orientability, because local sections of P give continuous local frames | holds; none ; carried from review ~30 via ~29 |
| G1.1 Pauli dictionary | X, Y, Z; Hadamard H | XY=[[i,0],[0,−i]]=iZ, YZ=[[0,i],[i,0]]=iX, ZX=[[0,1],[−1,0]]=iY; XZ=[[0,−1],[1,0]]=−iY with square −Id; coordinate determinant ±4 (blocks −2 and 2); XYZ=iId, ZYX=−iId; HXH=Z, HYH=−Y | holds ; carried from review ~30 via ~29 |
| G1.1 bivector sign | z=cosθ+sinθ e₁e₂ | positive form: ze₁z⁻¹=cos2θe₁−sin2θe₂; negative form: cos2θe₁+sin2θe₂ | holds ; carried from review ~30 via ~29 |
| G1.2 Fock metric | ℝ²=ℂ, w=e₁^(1,0)=(e₁−ie₂)/2 | g_ℂ(w̄,w)=(1+1)/4=1/2; c(e₁)1=√2w; c(e₁)²1=−2·½=−1; ⟨c(e₁)1,w⟩=√2/2=1/√2; native action ⟨w,w⟩=½≠1 | holds ; carried from review ~30 via ~29 |
| G1.2 Gram determinant | orthonormal w₁, w₂ | det=1; antisymmetrized tensor squared norm 2, its half ½ | holds ; carried from review ~30 via ~29 |
| G1.3 trace and evaluation | Cl(0,1); Q=0; negative plane a=1+e₁+2e₂; S=ℂ²⊕ℂ² | L_a=[[x,−y],[y,x]], trace 2x=2τ(a); Q=0: [[x,0],[y,x]], trace 2x; τ(a*a)=1+1+4=6; τ(star(e)e)=−e²=−1 for positive e; Hom_Cl(S,ℂ²)=ℂ², S⊗Hom of dimension 8≠2 | holds ; carried from review ~30 via ~29 |
| G1.4 odd labels | n=1; n=3 with (iZ,iY,iX) | n=1: (ie₁)²=1; n=3: c₁c₂c₃=i³ZYX=(−i)(−i)=−Id, ω_ℂ=i²ω=+Id; Γ_(u₁,Ju₁)=i(iZ)(iY)=−X, c(u)=iX=(−i)(−X); ψ(e₁e₂e₃)=e₀e₁e₂e₃=−e₁e₂e₃e₀; plane (e₁,e₀): ψ(ie₁)=−ie₁e₀=−Γ | holds ; carried from review ~30 via ~29 |
| G2.1 chirality | negative plane; rotated frame; Fock vacuum | Γ=i·iX=−X, S⁺=ℂ(1,−1), iZ(1,−1)=i(1,1); cross term cs(c₂²−c₁²)=0; c(e₂)=i√2(ε(w)+ι(w̄)), c(e₂)c(e₁)1=2i·½=i, Γ1=i(−i)=1 | holds ; carried from review ~30 via ~29 |
| G2.2 star formula | plane, k=0,1,2 | Γ1=ie₁∧e₂=i∗1; Γe₁=ie₂=i∗e₁; Γ(e₁∧e₂)=−i=i³∗(e₁∧e₂); Γe₂=−ie₁; Γ(1+ie₁∧e₂)=1+ie₁∧e₂ | holds ; carried from review ~30 via ~29 |
| G2.3 graded product | two planes; Koszul swap; negative point | cross anticommutator (cΓ+Γc)⊗c=0; Γ_(V⊕W)=−c c⊗c c=Γ_V⊗Γ_W; the signed swap gives (−1)^(\|s\|\|t\|)c_Wt⊗s on both sides, the unsigned one fails on odd s; Γ=−1 gives c(0,w)=−c_W(w) | holds ; carried from review ~30 via ~29 |
| G3.1 descent | a=1+ω in Cl(ℝ³,−g); SO(2); G=ℝ | ω²=(−1)^6=1, a²=2a, \|a²\|=2√2=√2·2; μ(R_θ) acts by 1 on S⁺ and e^(iθ) on S⁻; both sides at e₁ equal [[0,−e^(−2it)],[e^(2it),0]] | holds ; carried from review ~30 via ~29 |
| G3.3 curvature | unit S²; A=iY dx¹ | R^S(e₁,e₂)=¼(−c₁c₂+c₂c₁)=−½c₁c₂; [R^S,c₁]=−½(2c₂)=−c₂=c(R(e₁,e₂)e₁); [iY,iZ]=−2iX≠0 | holds ; carried from review ~30 via ~29 |
| G3.4 frames | unit S² | ∇_(e₂)e²=−cotθ e¹, de²=cotθ e¹∧e²=d(sinθ dφ), d*e²=0 | holds ; carried from review ~30 via ~29 |
| G4.1 signs | positive plane; φ∈(−π,π) | [e₁e₂,e₁]=−2e₂, [e₁e₂,e₂]=2e₁; R_φ is reached by ±(cos(φ/2)−sin(φ/2)e₁e₂) | holds ; carried from review ~30 via ~29 |
| G4.2 metric change | B=diag(4,1) | g′(e₁/2,e₁/2)=g(2e₁,e₁/2)=1; B⁻¹ gives g′-norm ½; Sylvester eigenvalues √b_i+√b_j>0 | holds ; carried from review ~30 via ~29 |
| G5.0 actions | n=1; n=2 | C₊(e)e=−e²=1; c₋(e)e=−1; anticommutator on 1 is −1+1=0; z·e₁=cosθe₁+sinθe₂; C₊(e₁)C₊(e₂)1=−e₂e₁=e₁e₂ | holds ; carried from review ~30 via ~29 |
| G5.1 ranks and degrees | S² | S⁻=E^(1/2) of degree 1, S⁺ of degree −1 (K^(±1/2) with K=T*S²) | holds ; carried from review ~30 via ~29 |
| G5.2 products | two planes; signed points | chiral ranks (1,1)·(1,1)→(2,2), virtual rank 0; negative point (0,1) negates the class | holds ; carried from review ~30 via ~29 |
| G5.3 roots | ρ(z); ℝP³; S² with e=1 | ρ(z)=cosθ−i sinθ Γ gives e^(∓iθ) on S^±; (S⁻)² has weight z²=E; c₁(γ_ℂ)=β(a)≠0 in H²(ℝP³;ℤ)=ℤ/2; 2c=1 has no solution | holds ; carried from review ~30 via ~29 |
| G6.0 module norm | T³, s=1+ω; S² | ω*=−reverse(ω)=ω, ⟨s,s⟩_A=2+2ω, C*-norm 4 against scalar part 2; c₁c₂(−L_(e₁e₂)/2)=½=Scal/4 | holds ; carried from review ~30 via ~29 |
| G6.1 operator | (iZ,iY); circle c=i; ℝ | D²=−∂₁²−∂₂² (cross term −(ZY+YZ)=0); De^(ikθ)=−ke^(ikθ); σ_F(1)=i·i=−1 | holds ; carried from review ~30 via ~29 |
| G6.2 contraction | ordered pairs | c₂c₁R(e₂,e₁)=c₁c₂B, so the sum over all ordered pairs needs ½ | holds ; carried from review ~30 via ~29 |
| G6.3 Lichnerowicz | unit S², S³ | ½=2/4; round S³ Scal=6, D²≥3/2 | holds ; carried from review ~30 via ~29 |
| G6.4 de Rham | flat circle | c(dx)(f,h dx)=(−h,f dx), D(f,h dx)=(−h′,f′dx), kernel dimensions (1,1) | holds ; carried from review ~30 via ~29 |
| G6.6 symbol | flat plane; point | iY(1,−1)=−(1,1), so c(v)(1,−1)=i(v₁+iv₂)(1,1), winding +1; K_c(pt) class 1, and −1 for σ=−1 | holds ; carried from review ~30 via ~29 |
| G6.7 parity and volume | J on ℂ; Cl(0,4) | J²z=\|a\|²z≠−z; ω₋²=(−1)^6(−1)^4=1; C₊ chain e₄→e₃e₄→e₂e₃e₄→e₁e₂e₃e₄=ω₋; K3: ind=2=2·1 | holds ; carried from review ~30 via ~29 |

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry*, Theorem II.1.7, II.8.2, II.8.8 and Chapter I §§1, 5; and Atiyah–Bott–Shapiro, *Clifford modules*, §§1, 6, 11 remain settled as `uncertified`. Their locator-only citations are carried forward; neither source was requested again.
- Kirby's cached text is OCR. Lines 1141 and 1156 remain garbled and were not used.
- The generated progress reports are not among the two designated review targets. This review does not certify their account of later implementation progress.

## Source issues

The following two source issues are carried from review ~30; no new source issue was found.

- **Error** in nicolaescu at Example 12.2.31(d), p. 670: the source says w₂(ℝPⁿ) vanishes exactly for n≡3 mod 4; it should be spin exactly for n≡3 mod 4 when n≥2, since w₂ also vanishes for n≡0 mod 4; affects nothing.
- **Misprint** in nicolaescu at Example 12.1.54, p. 649: the source says the squaring cover has domain Spin(1); it should be Spin(2), since the example concerns rank two; affects nothing.
