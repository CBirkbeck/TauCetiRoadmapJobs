# Review of SpinGeometry (pull request #1780 at a2b366b)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/SpinGeometry/` at `a2b366b` (the folder changed by 888 lines since `30cc27d`). The gate passes, the file elaborates, and the previous review's blocking finding is repaired. Four P3 findings remain; none is blocking.

## Previous findings (PRREVIEW-SpinGeometry~21 at `30cc27d`)

- R01 (P2, seven admitted headlines and the G1.3/G2.1/G2.2 objects are theorems of the pinned Tau Ceti) — **repaired.**
  - `Suggested.lean` no longer declares the seven theorems or `cliffordScalarTrace`, `multiplicitySpace`, `chirality`, `positiveSpinors`, `negativeSpinors`; its docstring (lines 13–25) names the Tau Ceti theorems instead.
  - `README.md:31–142` lists the library declarations by name and file, and G1.1–G2.3 cite them and keep only the comparisons the library lacks.
  - `README.md:471–475` records that the trace GeneralizedCohomology G5.5 consumes "as G1.3's cliffordScalarTrace" is `CliffordAlgebra.scalarTrace` (GeneralizedCohomology on main, `README.md:1908`, still uses the old name; the ids G1.1–G2.3 are unchanged).
- The remark on the description's "new companion" sentence: the sentence is gone.
- The reciprocal supplier edges with SpinRepresentations, RiemannianGeometry, CharacteristicClasses and GeneralizedCohomology (R01 of ~19) stay settled and are not re-raised: the dependency check reports 0 problems and `README.md:1642–1650` states the section-level order.

## R01 (P3) — The docstring names a missing carrier that the pins have

**Location.** `TauCetiRoadmap/SpinGeometry/Suggested.lean:34–36`: "existence of a spin structure iff `w₂ = 0`, and the `H¹(X; ℤ/2)` torsor of spin structures (G4.3, G4.4): the pins have no principal `Spin(n)`-bundle over the oriented frame bundle and no Čech `w₂`".

**Claim.** The two headlines are not statable because the pins lack a principal Spin(n)-bundle over the frame bundle.

**Witness.** At Tau Ceti `2fd255d9`: `TauCeti.PrincipalBundle` (`TauCeti/Topology/FiberBundle/Principal.lean:156`), `OrthonormalFrameBundle` (`TauCeti/Topology/VectorBundle/OrthonormalFrame/Basic.lean:109`), `TauCeti.VectorBundleOrientation` (`…/Orientation/Basic.lean:192`) and the compact `realCliffordSpinGroupZero`. A Spin structure is a short structure on these: the `SpinStructure` of #1674's `Suggested.lean` (head `2de5c72`) elaborates at this head's pins (scratch copy, exit 0, one `sorry` warning).

The conclusion "not statable" still holds, for a different reason: the only Stiefel–Whitney classes at the pin are those of quadratic forms over fields (`TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/`), and no declaration under `TauCeti/Topology/FiberBundle/` twists a principal bundle by a principal ℤ/2-bundle.

**Repair.** Replace the reason by the carriers that are missing: "the pins have no second Stiefel–Whitney class of a real vector bundle (their Stiefel–Whitney classes are those of quadratic forms over fields) and no twist of a principal `Spin(n)`-bundle by a principal `ℤ/2`-bundle". Checked against the pin as above.

## R02 (P3) — `even_finrank_of_conjLinear_square_neg` is not a headline of this roadmap

**Location.** `TauCetiRoadmap/SpinGeometry/Suggested.lean:116–160` (the section `QuaternionicKernelParity`), with the docstring lines 9–11 "and the parity theorem for conjugate-linear square roots of `−1` (G6.7)".

**Claim.** The file states the roadmap's headline theorems, "each admitted with `sorry`" (docstring line 8).

**Witness.** The statement is `∀ {V} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (J : V →ₗ⋆[ℂ] V), (∀ v, J (J v) = -v) → Even (finrank ℂ V)`: it mentions no object this roadmap defines, and it is proved, not admitted. The G6.7 headline is `ind D⁺ = 2α`, which the same docstring (lines 39–40) lists as not statable; the parity statement stands in its place. #1674, which the description orders first, records the same reading in its docstring ("abstract vector-space parity does not state this geometric result").

**Repair.** Delete the section (lines 116–160) and the docstring clause from `Suggested.lean`. The README keeps the statement as the G6.7 target; write its name there in prose, without backticks, at `README.md:1585` and `:1615` (a backticked name of this roadmap's own is a claim that the file declares it). Tested: the file without the section elaborates with the two `sorry` warnings of lines 72 and 107 and nothing else. The proof is complete and uses only Mathlib, so it can be contributed to Tau Ceti beside `Representation.IsQuaternionicStructure` (`TauCeti/RepresentationTheory/QuaternionicStructure.lean:72`), which has `bijective` and `apply_eq_self_iff` but no parity statement.

## R03 (P3) — Nicolaescu §12.1.2 is cited for the regular-trace formula, which it does not state

**Location.** `README.md:431–433`: "for every Q on a finite-dimensional V, `2^(dim V)τ(a)=trace(L_a)` on the regular module (`trace_mulLeft_eq_two_pow_mul_scalarTrace`; Nicolaescu §12.1.2, pp. 626–629)".

**Claim.** The source supports the trace formula.

**Witness.** §12.1.2 (`nicolaescu` lines 29249–29380, printed pp. 626–629) defines the Clifford algebra, the grading, the transposition, the action on forms and the symbol map, and states that the ordered monomials of an orthonormal basis form a basis (`nicolaescu` line 29360, p. 629). It has no trace of left multiplication. The head `30cc27d` qualified the locator: "for the ordered monomial basis of an orthogonal basis"; that clause was dropped.

**Repair.** Move the locator to the sentence it supports, `README.md:435–438`: "… is the ordered-product basis e_I (`basis_eq_prod_map_sort`; Nicolaescu §12.1.2, p. 629)", and leave the trace formula with its Tau Ceti citation alone. Checked: p. 629 is where the symbol of `e_(i₁)⋯e_(i_k)` and the monomial basis are.

## R04 (P3) — The description misstates what #1674's `Suggested.lean` contains

**Location.** Pull-request description, "Relation to #1674": "#1674 makes the same Tau Ceti citations for G1–G2 in its restructured README and states no declaration in `Suggested.lean`."

**Claim.** After #1674 merges, the file this pull request is rebased onto is empty of declarations.

**Witness.** #1674 at `2de5c72`, `TauCetiRoadmap/SpinGeometry/Suggested.lean`: `structure SpinStructure` (line 78) and `theorem nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul` (line 116). Its docstring also says "A pointwise contraction is not that operator" and "abstract vector-space parity does not state this geometric result", that is, it excludes `diracInFrame_eq` and the parity theorem, which this head states.

**Repair.** Replace the sentence by what the head shows: "#1674 makes the same Tau Ceti citations for G1–G2 in its restructured README; its `Suggested.lean` states the rank-two Spin criterion of its G4.4a with the definition `SpinStructure`." Then say which declarations the rebased file adds to those two (after R02: `cliffordMultiplication`, `IsGeometricAction`, `cliffordMultiplication_anticommutator`, `diracInFrame`, `diracInFrame_eq`) and that the docstring sentence of #1674 about the pointwise contraction is revised with them. No name is declared by both heads.

## Verified sound

**Gate.** Worker's run: every check passed, `build=0`. My run at `a2b366b`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty. The worktree is clean.

**Dependency check.** `gate --depcheck … --name SpinGeometry --movable --pr 1780` prints `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.

**Pins.** `lake-manifest.json` pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, the revisions main pins and the checkouts under `.lake/packages`.

**Elaboration and signatures.** `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean` exits 0 with exactly two `declaration uses sorry` warnings (lines 72, 107). The six elaborated types were compared with the README:
- `IsGeometricAction` is `(∀ v, Q v = −⟨v,v⟩) ∧ (∀ v s t, ⟨c(v)s,t⟩ = −⟨s,c(v)t⟩)`, the two clauses of `README.md:359–361`;
- `cliffordMultiplication_anticommutator` carries `Q`, `ρ : CliffordAlgebra Q →ₐ[ℝ] Module.End ℂ S` and the predicate;
- `diracInFrame` and `diracInFrame_eq` keep `[∀ x, NormedAddCommGroup (W x)]`, `[∀ x, InnerProductSpace ℂ (W x)]`, `[FiberBundle F W]` and `[RiemannianBundle …]` (instances 7–11 of the elaborated type), so the worker's "lost binder" lead is a false positive.

**One-tactic probe.** On a scratch copy each `sorry` was replaced by `first | (simp; done) | (rfl; done) | (infer_instance; done) | (exact?; done) | (simp [cliffordMultiplication, IsGeometricAction, diracInFrame] at *; done) | (unfold diracInFrame; simp [OrthonormalBasis.sum_repr]; done) | sorry`. Both statements keep their `sorry`: neither is one-tactic padding.

**Library declarations opened at Tau Ceti `2fd255d9`** (paths under `TauCeti/`; `C` = `LinearAlgebra/CliffordAlgebra`). The 170 distinct Tau Ceti names of `README.md:31–760` each resolve to a declaration at the pin, and every name the supplier list (`:40–142`) assigns to a file was found in that file. Statements read in full:
- `C/Neg.lean:76` `equivNeg` (`u*u = −1`, `ι Q m ↦ u • ι Q' m`), `:100` `equivNeg_ι_mul_ι`;
- `RepresentationTheory/Spin/Polarization/Fock/Basic.lean:105` `spinAction_ι_one_tmul` (wedge by `v^(1,0)` plus contraction against the polar form, that is `ε − 2ι` for `Q = −g`), `:119` `fockAction`, `:134` intertwining by the degree scaling `√2^p`, `:144` `fockAction_bijective`, `:162` `fockAction_ι_one_tmul` (`√2•(wedge + ½•contract)`), `:179` square `= Q v`;
- `C/Hermitian/Basic.lean:58` `map_ι_mul_map_ι` (only the diagonal relation `c(v)c(v) = Q v`, as `README.md:357–358` says), `:99`, `:129`;
- `C/Hermitian/Complex.lean:100` `adjoint_map_eq_map_conjStar_iff`, `:140` `existsUnique_pos_mul_of_surjective` (`[Nontrivial S]`);
- `C/VolumeElement/Complex.lean:94` `complexVolume = I^((n+1)/2) • ofBaseChangeAux ℂ Q (volumeElement Q o)`, `:106`, `:112`, `:134`, `:150`, `:192` `star_complexVolume`, `:208`, `:227` `complexVolume_mul_ι_of_even`, `:236`, `:262`, `:279` `complexVolume_mul_self` (hypothesis `∀ v, Q v = −‖v‖²`);
- `C/ScalarTrace/Basic.lean:102, 118, 133, 140, 161, 250, 268`; `C/OrthogonalBasis.lean:102, 129, 450, 515, 542`; `C/ScalarTrace/Positivity.lean:282–372`; `C/ScalarTrace/Radical.lean:184`;
- `RingTheory/Morita/ModuleEnd.lean:184` `isotypicTensorEquivOfBijective`; `C/VolumeElement/Eigenspace.lean:218, 239, 250, 292`; `C/VolumeElement/HodgeStar.lean:111, 149`;
- `Algebra/Quaternion/ComplexMatrix.lean:158` `Quaternion.toComplexMatrix` (i, j, k ↦ `!![I,0;0,−I]`, `!![0,1;−1,0]`, `!![0,I;I,0]`); `C/RealForm/Basic.lean:632` `realCliffordZeroTwoEquivQuaternion` (`ι v ↦ ⟨0, v 0, v 1, 0⟩`); `C/BottPeriodicity.lean:490` `realCliffordSignatureSwitchRecurrenceEquiv p q : Cliff(p+2,q) ≃ Cliff(q,p) ⊗ M₂(ℝ)`;
- `RepresentationTheory/QuaternionicStructure.lean:72` `IsQuaternionicStructure` (no parity theorem in the file);
- the 22 names of G4.1a/G4.1b/G4.2 (covering, compactness, connectivity, units range, SO embedding, Lie maps, `isLocalDiffeomorph_of_mfderiv_eq`, `nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`) each resolve to one declaration.

Three names sit in a file other than the nearest one the supplier list mentions, and the README assigns them no file: `starModule_of_trivialStar` (`C/Star.lean:31`), `dualMetric_cliffordReverseDual_left` (`C/Hermitian/Dual.lean:57`), `finrank_eigenspace_complexVolume_of_bijective_lsmul` (`C/VolumeElement/Eigenspace.lean:292`).

Mathlib at `1b1ccf4b`: `CliffordAlgebra.ι_mul_ι_add_swap` (`LinearAlgebra/CliffordAlgebra/Basic.lean:263`), `star_def` (`Star.lean:43`), `changeForm_ι_mul_ι` (`Contraction.lean:283`), `EquivEven.Q'`, `equivEven`, `evenToNeg`, `evenEquivEvenNeg` (`EvenEquiv.lean:49, 203, 222, 246`), `TensorProduct.star_tmul` (`Algebra/Star/TensorProduct.lean:35`), `Module.Dual.baseChange` (`LinearAlgebra/Dual/BaseChange.lean:43`), `Module.Basis.ExteriorAlgebra` (`LinearAlgebra/ExteriorAlgebra/Basis.lean:32`), `CFC.sqrt`, `fourierBasis` (`Analysis/Fourier/AddCircle.lean:410`).

**Cross-roadmap citations resolved on main.** The 12 relative links of `README.md:14–195` point to existing files. The eleven GeneralizedCohomology G5.5 names of G6.0 (`realHilbertClosedFunctionalCalculus` … `realMixedCliffordBottTransport`) each occur in GeneralizedCohomology's README; TopologicalKTheory has T1–T7 headings (`:170–1517`); ComplexKahlerGeometry has `## K5. Compact Hermitian elliptic theory and Serre duality` with K5a (`:568–570`). `citations.md` lists nothing found nowhere.

**Overlaps (`overlaps.md`, each item checked).**
- #1674 conflicts in both files; the order "#1674 → this pull request" is in the description's merge-order block. No fully qualified name is declared by both heads (R04 is about the sentence, not the order).
- ComplexKahlerGeometry `#k5-compact-hermitian-elliptic-theory-and-serre-duality` (`README.md:195`): each revision that drops the anchor maps it. #1234: "K5 is now Layer 5" (line 367); #1807: the former-numbering list maps `K5` and the anchor to Layer 5 and `K5a` to 5.1–5.8 (line 551); #1808: `K5` → Layer 5, `K5a` → 5.1–5.8 (line 567); #1854: the "Former numbering (id or heading anchor)" table has the row for `K5` and the anchor (line 529). All four keep the heading "Layer 5: … (K5)". The citation needs no change.
- No id of SpinGeometry that this pull request drops is cited elsewhere.
- Ownership against the open roadmaps (`roadmaps grep`): `IsGeometricAction`, `cliffordMultiplication`, `diracInFrame` occur only here and on main's copy of this roadmap; "Pauli matri" occurs in about ten other roadmaps as Checks or conventions, none stating the G1.1 dictionary with the Tau Ceti classifiers. The closest roadmaps (SpinRepresentations #1207, IndexTheory #1077, SpectralManifolds #1158, TangentialBordism #942) own none of the five targets G1–G2 keep.

**Sources: 18 Nicolaescu locators checked against the cached text** (printed page = page marker − 12). 17 agree in number, page and content; one is R03.

| README | Locator | `nicolaescu` line | Result |
| --- | --- | --- | --- |
| G1.2 `:353` | proof of Prop. 12.1.19, p. 630, `h = g(u,v)+i g(u,Jv)` | 29406 | agrees |
| G1.2 `:363` | Def. 12.1.10, p. 626 | 29261–29265 (`uv+vu = −2q(u,v)`) | agrees |
| G1.3 `:402` | Prop. 12.1.19, p. 630 | 29392 | agrees |
| G1.3 `:412` | Cor. 12.1.22, p. 632 | 29466 (with Remark 12.1.23 for Hom_Cl) | agrees |
| G1.3 `:432` | §12.1.2, pp. 626–629 | 29249–29380 | R03 |
| G1.4 `:518` | Lemma 12.1.29, p. 634, `Ψ(x⁰+x¹) = x⁰+e₀x¹` | 29553–29557 | agrees |
| G2.2 `:654` | eq. (12.1.1), p. 633, `Γω = i^(k+p(p−1))∗ω` | 29514 | agrees |
| G2.3 `:760` | p. 633, chiral grading = purely even twisting space | 29492–29499 | agrees |
| G3.3 `:835` | Def. 12.1.64 (a2), p. 653 | 30304–30312 | agrees |
| G3.4 `:866`, G6.4 `:1496` | §12.2.1 and Prop. 12.2.1, p. 657 | 30485, 30497 | agrees |
| G4.2 `:1037` | Exercise 12.2.30, p. 670 | 30984 | agrees |
| G4.3 `:1060` | Prop. 12.2.25, p. 669 (manifolds) | 30950 | agrees |
| G4.4 `:1071` | Remark 12.2.28, p. 669; Exercise 12.2.35, p. 673 | 30957–30980, 31121 | agrees |
| G5.1 `:1169` | Prop. 12.1.30, p. 635 | 29562–29565 | agrees |
| G6.0 `:1298`, G6.3 `:1484` | Thm 12.2.33, p. 673 | 31100 | agrees |
| G6.1 `:1405` | Prop. 12.1.66, p. 655 | 30370 | agrees |
| G6.2 `:1472` | Thm 12.1.67, p. 656 | 30422–30424 | agrees |
| G6.6 `:1527` | §12.2.3, p. 672 (symbol of the chiral operator) | 31068–31069 | agrees |

**Adversarial table.** Values recomputed this round with Pauli matrices `X=[[0,1],[1,0]]`, `Y=[[0,−i],[i,0]]`, `Z=diag(1,−1)`.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| G1.1 positive plane (`:317–320`) | e₁↦X, e₂↦Z | XZ = [[0,−1],[1,0]] = −iY, (XZ)² = −Id; coordinates of Id, X, Z, XZ have determinant 4 | Pass |
| G1.1 negative plane (`:321–322`) vs `toComplexMatrix`, `realCliffordZeroTwoEquivQuaternion_ι` | i, j, k | i ↦ diag(i,−i) = iZ; j ↦ [[0,1],[−1,0]] = iY; k ↦ [[0,i],[i,0]] = iX; (iZ)(iY) = −ZY = iX | Pass |
| G1.1 negative control (`:323–328`) | (X,Y,Z) vs (Z,Y,X) | XYZ = iZ·Z = i·Id; ZYX = Z·(−iZ) = −i·Id | Pass |
| G1.2 `IsGeometricAction` (`:371–374`) | V=ℝ, c(e)=i; c(e)=1 | ⟨is,t⟩ = −i⟨s,t⟩ = −⟨s,it⟩, i² = −1 = Q(e); c=1: 1 ≠ −1 and ⟨s,t⟩ ≠ −⟨s,t⟩ | Pass; both clauses discriminate |
| G1.2 `cliffordMultiplication_anticommutator` (Lean 72) | general; c(e₁)=iZ, c(e₂)=iY | polar Q v w = Q(v+w)−Q v−Q w = −2⟨v,w⟩, so ρ(ιv ιw + ιw ιv) = −2⟨v,w⟩·1; (e₁,e₁): 2(iZ)² = −2Id; (e₁,e₂): −(ZY+YZ) = 0 | Pass; uses only the first clause of the predicate |
| G1.2 Fock (`:378–383`) vs `fockAction_ι_one_tmul` | V=ℝ², w=(e₁−ie₂)/2 | g_ℂ(w̄,w) = ½; c(e₁)1 = √2w; c(e₁)w = −√2·½; c(e₁)²1 = −1; ⟨c(e₁)1,w⟩ = 1/√2 = −⟨1,c(e₁)w⟩; native: w ↦ −2·½ = −1 | Pass |
| G1.3 trace (`:490–496`) | Cl(0,1); Q=0 on ℝ | L_(x+ye) = [[x,−y],[y,x]], trace 2x = 2¹τ; Q=0: [[x,0],[y,x]], trace 2x, τ(e²)=0 with e≠0; Q(e)=−1: τ(reverse(e)e) = −1 < 0 | Pass |
| G1.3 evaluation (`:480–489`) | S=ℂ², E=S⊗ℂ³; S=ℂ²⊕ℂ², E=ℂ² | 2·3 = 6 = dim E; non-surjective ρ: 4·2 = 8 ≠ 2 | Pass |
| G1.4 labels (`:531–541`) vs `complexVolume` | n=1; n=3 with c=(iZ,iY,iX) | n=1: (ie₁)² = 1; n=3: (iZ)(iY)(iX) = i³·ZYX = −Id, ω_ℂ = i²·(−Id) = +Id; Γ_(e₁,e₂) = i·iX = −X, c(e₃) = iX = λΓ with λ = −i, ω_ℂ = iλ = 1; i^((n+1)/2) = i¹, i² | Pass |
| G1.4 ψ (`:547–551`) | n=3 | (e₀e₁)² = −e₀²e₁² = −1; ψ(e₁e₂) = e₁e₂; ψ(e₁e₂e₃) = e₁e₂e₀e₃ = −e₁e₂e₃e₀ | Pass |
| G2.1 Γ (`:625–643`) | ℓ=0, 1; rotated frame; Q=0 | ℓ=1: Γ = −X, Γ² = Id, S⁺ = ℂ(1,−1), iZ(1,−1) = i(1,1); rotation: cross term cosθ sinθ(c₂²−c₁²) = 0; Fock: c(e₂)c(e₁)1 = 2i·½ = i, Γ1 = i·(−i) = 1; Q=0: Γ = 0, eigenspaces 0 | Pass |
| G2.1 star laws (`:574–576`) | n=2ℓ | reverse: (−1)^(ℓ(2ℓ−1)) = (−1)^ℓ; conjStar: conj(i^ℓ)(−1)^ℓ = i^ℓ | Pass |
| G2.2 Hodge formula (`:651–653`) | plane, k=0,1,2; k=3,4 parity | vol·1 = e₁∧e₂ = ⋆1 (sign +); vol·e₁ = e₂ = ⋆e₁ (+); vol·(e₁∧e₂) = −1 = −⋆ (−); (−1)^(C(k+1,2)+k) = +,+,−,−,+ equals i^(k(k−1)) = 1,1,−1,−1,1 | Pass; agrees with (12.1.1) |
| G2.3 graded product (`:744–749`) | two negative planes | Γ_(V⊕W) = −c_V(e₁)c_V(e₂)Γ_V² ⊗ c_W(f₁)c_W(f₂) = −(−iΓ_V)⊗(−iΓ_W) = Γ_V⊗Γ_W; cross anticommutator (c_VΓ_V+Γ_Vc_V)⊗c_W = 0 | Pass |
| G2.1 new target ρ_ℂ(Γ) (`:603–617`) | n=2ℓ | (2ℓ+1)/2 = ℓ, so ρ_ℂ(Γ) = i^ℓρ(vol); `Algebra.TensorProduct.lift` applies since scalars commute with ρ | Pass |
| G3.1 Gram norm (`:796–799`) | a = 1+ω in Cl(ℝ³,−g) | ω² = (−1)³(−1)³ = 1, a² = 2a, \|a²\| = 2√2 = √2·\|a\|² | Pass |
| G3.3 curvature (`:860–863`) | unit S² | R^S = ¼(−c₁c₂ + c₂c₁) = −½c₁c₂; [R^S,c₁] = −½(c₂+c₂) = −c₂ = c(R(e₁,e₂)e₁) | Pass |
| G4.2 metric change (`:1043–1050`) | B = diag(4,1) | g'(e₁/2,e₁/2) = 1; Sylvester eigenvalues 4, 3, 3, 2 > 0 | Pass |
| G5.0 (`:1137–1142`) | Cl(0,1) | C₊(e)e = ε(e)e = −e² = 1; (c₋C₊+C₊c₋)1 = −1+1 = 0 | Pass |
| G5.3 weights (`:1220–1223`) | Γ = ic₁c₂ | c₁c₂ = −iΓ, ρ(z) = cosθ − i sinθ Γ: e^(−iθ) on S⁺, e^(iθ) on S⁻ | Pass |
| G6.0 (`:1376–1380`, `:1388`) | T³, s = 1+ω; S³ | ⟨s,s⟩ = 2+2ω, C*-norm 4, scalar part 2; Scal/4 = 6/4 = 3/2 | Pass |
| G6.1 `diracInFrame_eq` (Lean 107) | rotated frame; (2e₁,e₂); n=0 | B(u,v) = c(u)∇_v s is ℝ-bilinear, Σ B(b_j,b_j) = Σ B(b'_j,b'_j) for orthonormal bases; (2e₁,e₂): 4c₁∇₁+c₂∇₂; empty sum 0 | Pass; orthonormality needed and present |
| G6.1 circle (`:1466–1471`) | c(∂_θ) = i | i·d/dθ e^(ikθ) = −k e^(ikθ) | Pass |
| G6.6 symbol (`:1542–1548`) | c(v) = v₁iZ+v₂iY on (1,−1) | iZ(1,−1) = i(1,1), iY(1,−1) = −(1,1): (iv₁−v₂)(1,1) = i(v₁+iv₂)(1,1), winding +1 | Pass |
| G6.7 parity (Lean 123) | J(z₁,z₂) = (−z̄₂,z̄₁); J z = a z̄ on ℂ | J² = −1 in dimension 2; dimension 1: J²z = \|a\|²z ≠ −z | True; R02 is about its place in the file |
| G6.7 volume (`:1621–1625`) | Cl(0,4) | ω₋² = (−1)⁶(−1)⁴ = 1, Γ = i²ω₋ = −ω₋ | Pass |
| Docstring, not-statable list (Lean 29–40) | each carrier | no Dirac operator, bundle Sobolev space, vector-bundle w₂, KO or spinor bundle at the pin; principal bundle and frame bundle exist | R01 for the G4.3/G4.4 reason; the other four reasons hold |

**Declared gaps.** None are declared (no readable `design/plan.json`); no `*Needs:*` line cites a section or declaration that does not exist where cited.

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry* (Theorems II.1.7, II.8.2, II.8.8; G4.3, G4.4, G6.0, G6.2, G6.3) and Atiyah–Bott–Shapiro, *Clifford modules* (reference list) are recorded `uncertified` in the manifest and are cited by locator only.
- The manifest's `kirby` entry is not cited by this head's README, so it was not opened.

## Source issues

- none
