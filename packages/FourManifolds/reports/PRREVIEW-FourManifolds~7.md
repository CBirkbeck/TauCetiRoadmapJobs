# Review of FourManifolds (pull request #936 at 7930a3e)
**Verdict:** accepted

No P1 or P2 finding. The previous review's four findings are repaired (details under Verified sound), the gate passes, and the adversarial table below has its values. Two P3 notes remain, both the author's to take or leave.

## R01 (P3) — Joined token in the Gompf citation

**Location:** `TauCetiRoadmap/FourManifolds/README.md:3063` (“[Gompf, §1, Theorem1.2](…)”).

**Claim:** House style is readable prose; the previous review's typography list (its R04) is otherwise fully repaired.

**Witness:** The span “Theorem1.2” has no space; every other instance in the file writes “Theorem 1.2” (for example line 3020, “Gompf, Theorem 1.2, pp. 319–320”).

**Repair:** Write “Theorem 1.2”.

## R02 (P3) — Three works cited inline are missing from the reference list

**Location:** `TauCetiRoadmap/FourManifolds/README.md:387`–396 (the gap:three-manifold-smoothing paragraph cites Moise, GTM 47; Munkres, Ann. of Math. 72 (1960); Whitehead, Ann. of Math. 73 (1961)) against the list at 3095–3154 (“The remaining works cited inline are …”).

**Claim:** The reference section lists every work cited inline.

**Witness:** `grep -n -i "moise\|munkres\|Whitehead, \*Manifolds"` returns only lines 387, 392 and 394; none of the three appears after line 3095. Crowell (line 1663, “Crowell; Freedman–Quinn §11.9”) is likewise cited by name only, which is acceptable since the Freedman–Quinn locator carries the statement.

**Repair:** Add the three entries to the final list (Moise, *Geometric Topology in Dimensions 2 and 3*, GTM 47 (1977); Munkres, *Obstructions to the smoothing of piecewise-differentiable homeomorphisms*, Ann. of Math. 72 (1960); Whitehead, *Manifolds with transverse fields in Euclidean space*, Ann. of Math. 73 (1961)).

## Verified sound

:robot: Independent AI review. I read the whole README (3154 lines) and `Suggested.lean` (157 lines, byte-identical since the third review, last changed at `aceef66c`) at `7930a3e`, checked the previous review's findings first, then reviewed every section against the brief. I changed nothing in the pull-request worktree (`git status` clean at the end). The diff outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FourManifolds'`) is empty; `metadata.toml` is unchanged.

**Gate and build.** The worker's gate (`gate.md`) and my own re-run both end `OK` with every scanner at 0 (set_option, blob, latex, prnum, sorry-data, sorry-examples, imports, readme-ids-missing, empty-sections, round-labels, long-fences, depcheck, stray-files, outside-folder, source-material, build). `lake env lean` on `Suggested.lean` succeeds in three seconds with exactly six `declaration uses sorry` warnings, at lines 68, 77, 96, 120, 134 and 143. The dependency command returned exactly:

```text
depcheck: 204 roadmaps, 1404 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line (one more edge than last round: the new MorseNovikov supplier row).

**Previous findings, finding by finding.**

- R01 (P1, GeometricTopology §4.3/§4.3.1/§4.4/Layer 11 cited as supplied): repaired. Lines 328–397 declare `gap:oriented-linking-number`, `gap:seifert-matrix-s-equivalence`, `gap:alexander-module-presentation`, `gap:finite-quadratic-arf` and `gap:three-manifold-smoothing`, each opening “What GeometricTopology must provide (gap:…)”. The Scope paragraph (lines 23–34) says these “are stated by no GeometricTopology layer; each is declared as a gap, one slug each”. Slug use counts: oriented-linking-number 7, seifert-matrix-s-equivalence 5, alexander-module-presentation 5, finite-quadratic-arf 10, three-manifold-smoothing 3; no remaining text cites “GeometricTopology 4.3”, “4.3.1”, “4.4” or “Layer 11” (grep returns nothing). The r5 request to narrow the Alexander-module gap is also applied: the gap now covers the cover and Crowell's comparison, and the `tV − Vᵀ` presentation is cited to MorseNovikov N6 (supplier row at line 174; N6 on main, `TauCetiRoadmap/MorseNovikov/README.md:377`, 554–558, constructs the infinite cyclic cover of the zero surgery and the Seifert-matrix Alexander module with the polynomial/module comparison).
- R02 (P3, §1.4 depended on Layer 3): repaired. §1.4 now proves the smooth case only (“Prove that a smoothly slice knot has Arf invariant 0 … Nothing of Layer 3 is used”, lines 578–602) with its own `*Needs:*` line (632–640) naming GT Layers 1 and 4, the three gaps, AT Stage 6, SpinGeometry G4 and TB B3.2(b)–(c); the handlebody block keeps its separate `*Needs:*` (509–511). The locally flat branch is §3.6's (1676–1700) with §3.5's normal-bundle theorem and transversality, `gap:three-manifold-smoothing` and `gap:tangent-microbundle-stable-classifier`. Layer 1's Dependencies (700–706) now name the gaps and TB B3.2(b)–(c).
- R03 (P3, `ContinuousLinearMap.` namespace): repaired at 158–163, 2402–2406 and 2429; `TauCeti.parameterProj` is `TauCeti/Analysis/Fredholm/Parametric.lean:130` under `namespace TauCeti` (line 109), with `parameterProj_surjective_iff` 343, `index_parameterProj` 407, `isFredholm_parameterProj` 429.
- R04 (P3, typography): every listed span is repaired (“pp. 139–153”, “mod 2”, “Arf 0 and 5 mod 8”, “number 1”, “from +2 to −2”, “dimension 0”, “a 1-complex”, “small, 1-connected”, “a 2-complex”, “FQ8.17's 5-connectivity”, “1 or ℤ”, “target ℤ”, “group ℤ”, “F₂”, “framing +2”, “pair (−1,−1)”, “kernel ℂ³”); one pre-existing span not on that list remains (R01 above).

No repair report marked any finding not actionable.

**Change set.** The 326 changed lines are confined to the Scope paragraph, the supplier table (GT row narrowed, MorseNovikov row added), the gap preamble and five gap paragraphs, §1.4 (Arf definition, API, smooth slice-disc proof, Checks, `*Needs:*`), Layer 1 Dependencies, §2.3's `*Needs:*`, §3.6 (Arf and Alexander consumptions, the new topologically-slice paragraph and merged `*Needs:*`), §4.2's Arf evaluation and `*Needs:*`, Layer 4 Dependencies, §5.2's pinned names and the typography. Everything else is the text the previous reviews read; I re-read it and re-ran its sample.

**Declared gaps.** Fifteen contracts are stated under “What GeometricTopology must provide” (lines 197–397): top-manifold-cw-type, tangent-microbundle-stable-classifier, brown-schoenflies, torus-trick-immersion, relative-pl-five, low-codimension-normal-bundles, marin-stable-transversality, spherical-classifier-g-top, laurent-l-group-splitting, controlled-k-whitehead-spectrum, oriented-linking-number, seifert-matrix-s-equivalence, alexander-module-presentation, finite-quadratic-arf, three-manifold-smoothing. Each has a named supplier, a one-paragraph `needs` with hypotheses, and is named at every use (every `gap:` token in the file is one of these fifteen). Minimality of the five new ones against main and the open heads: no roadmap on main states the oriented linking number, S-equivalence of Seifert surfaces, Crowell's comparison, the F₂ Arf algebra (QuadraticFormInvariants excludes characteristic two at its `README.md:177`) or three-manifold smoothing; TangentialBordism's head (`rev/942/…/README.md:154`–172) declares `gap:finite-quadratic-arf` with the same `needs` sentence plus a q-zero count, and its §1.1 (line 189) is the interface B3.2(b)–(c) consume, as the README says. No `design/plan.json` is readable for this pull request, so slugs could not be cross-checked against a plan.

**Headlines and padding.** The README's headline theorems are the four-dimensional annulus theorem, Freedman's slice theorem, Freedman's classification, Donaldson's theorem, Rokhlin's theorem, `E(2) ≅ K3`, the exotic ℝ⁴ and the nonrecognition theorem. The two statable at the pins are stated (`annulusTheorem_four : TauCeti.AnnulusConjecture 3`, `freedmanSliceTheorem : TauCeti.FreedmanSliceTheorem`; `TauCeti/Geometry/Manifold/LocallyFlat/Annulus.lean:105`, `TauCeti/KnotTheory/Slice/Freedman.lean:64`, neither proved at the pin); the module docstring (lines 20–52) names each of the others with the carrier it lacks. One-tactic probe on a scratch copy (`Probe.lean`, elaborated with `lake env lean`): `unfold … ; simp` on the annulus statement leaves the full quantified goal; `simp` makes no progress on the slice theorem and on the quartic derivative; `simp [enriquesQuadric]` leaves the surjectivity goal; `simp [...] at *` leaves the fixed-point goal; `exact` with standard ℝ⁴, `inferInstance` and `Homeomorph.refl` fails on `IsEmpty (EuclideanSpace ℝ (Fin 4) ≃ₘ[ℝ] EuclideanSpace ℝ (Fin 4))`. Nothing is padding. The worker's `signatures.md` lists thirteen declarations with no lost binder (the file has no `variable` block); I compared each elaborated type with its README statement (§3.1 for the two end theorems, §7.2 for the quartic, §7.3 for the Enriques quadrics and involution, §8.3 for the exotic space) and they agree.

**Adversarial table.** One row per statement; values computed on both sides this round (the exact-arithmetic script is `adv.py` in my scratch directory; rows marked (new) concern text changed since the previous review).

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| Conventions: signed signature | S²×S²; −CP² | inertia (1,0,1) gives 1−1=0; (0,0,1) gives −1 | pass |
| Conventions: torsion quotient | S⁴; Enriques | rank 0, empty determinant 1; rank 10, 2t=0 pairs to 0 in ℤ | pass |
| §1.1 CP² ring, product | line; S²×S² | h²[CP²]=1, h³=0; a²=b²=0, a·b=1, det `[[0,1],[1,0]]`=−1 | pass |
| §1.2 twisted bundle | H=S+F, E=S | S²=−1, F²=0, S·F=1; H²=1, H·E=0, E²=−1: diag(1,−1) | pass |
| §1.3 sums | CP²#−CP²; CP²#CP²; M#S⁴ | σ=0, χ=4; σ=2; Δχ=0 | pass |
| §1.4 matrices | 0-, +1-unknot; Hopf | [0], [1]; H, det −1 | pass |
| §1.4 slide | diag(0,1), P=`[[1,0],[1,1]]`; P=`[[1,1],[0,1]]` | PᵀQP=`[[1,1],[1,1]]`, det 0; diag(0,1) | pass |
| §1.4 blow-up | empty link + unlinked +1-unknot | H₂: 0 → ℤ with form [1]; boundary S³ both times; not diffeomorphic | pass |
| §1.4 Arf definition (new): radical and properness | Hopf annulus V=[1]; T(2,4) V 3×3 | radical dim 1 both; q(core)=1 for Hopf (lk 1 odd: no value assigned); q=0 on ⟨e₁+e₃⟩ for T(2,4) (lk 2 even) | pass |
| §1.4 Levine congruence (new wording) | unknot, 3₁, 4₁, 6₁, 5₁, 5₂; all 588 integer 2×2 V with det(V−Vᵀ)=1, entries in [−3,3] | Δ(−1)=1, −3, 5, 9, 5, −7 ≡ 1,5,5,1,5,1 mod 8; Arf by Gauss sum 0,1,1,0,1,0; |Δ(−1)| mod 8 = 1,3,5,1,5,7; over the 588 matrices 0 failures of Δ(−1)≡1 mod 4 and 0 disagreements between Arf=0 and Δ(−1)≡1 mod 8; pinned `trefoilSeifertMatrix = !![-1,1;0,-1]` (`Alexander.lean:562`) | pass |
| §1.4 pinned normalization (new) | `alexander` at `Alexander.lean:378` | T^(−g)·det(T·V−Vᵀ); det(V−Vᵀ)=1 so Δ(1)=1 | pass |
| §1.4 T(2,4) | V=`[[−1,1,0],[0,−1,1],[0,0,−1]]` | V−Vᵀ=`[[0,1,0],[−1,0,1],[0,−1,0]]`, det(V+Vᵀ)=−4; quotient anisotropic, Arf 1 | pass |
| §1.4 T(2,4) Jones | V=−t^{3/2}−t^{7/2}+t^{9/2}−t^{11/2} | at u=e^{iπ/4}: √2 (numerically 1.41421); Murakami (−√2)(−1)^Arf=√2 ⇒ Arf 1 | pass |
| §1.4 reversal | one component reversed | annulus [±2]: radical dim 1, quotient dim 0, Arf 0; factor i^{−6}=−1; change 1 = lk/2 mod 2 | pass |
| §1.4 smooth slice-disc proof (new) | genus g; trefoil g=1 | H₁(exterior)=ℤ by Alexander duality (H̃²(F̂)=ℤ); normal Euler number F̂·F̂=0 in D⁴ so the normal bundle is trivial; dim ker(H₁(F̂)→H₁(W))=g; trefoil q=(1,1,1) on nonzero classes, no q-zero line, Arf 1 | pass |
| §1.4 Spin comparison (new) | unknot core of untwisted band | 0-framed unknot bounds a disc in S³, Spin structure bounding, q=0 = V(x,x) mod 2 (TB B3.2(b) convention q(disc boundary)=0 at `rev/942:1849`) | pass |
| gap:finite-quadratic-arf (new) | hyperbolic plane; anisotropic plane; m=0 | Gauss sums 2 and −2 = (−1)^Arf·2¹; m=0: sum 1, Arf 0, zero-dimensional q-zero subspace | pass |
| gap:three-manifold-smoothing (new) | S³; D³ with boundary; closed set C=∂ | compact with boundary allowed; relative form agrees near C; nothing smooths a locally flat disc (text says so) | pass; locator not verifiable |
| gap:alexander-module-presentation vs MorseNovikov N6 (new) | zero surgery X_K vs exterior | the longitude lifts to a null-homologous curve (bounds a lift of the Seifert surface), so H₁ of the two infinite cyclic covers agree; N6 presents `tV−Vᵀ`, the gap keeps the exterior's cover and Crowell | pass |
| §1.5 boundary | [0]; [2]; [1] | ker, coker: ℤ,ℤ; 0, ℤ/2; 0,0 | pass |
| §1.6 E₈ | positive Cartan matrix | leading minors 2,3,4,5,6,7,8,1; framings 1,2 linking 1: `[[1,1],[1,2]]`, det 1 | pass |
| §2.1–2.2 | r=0,1,2; Q=`[[1,1],[1,2]]` | π₃ ranks 0,1,3; C=Q⁻¹=`[[2,−1],[−1,1]]`, QC=I | pass |
| §2.4 isotropic splitting | H; diag(1,−1); diag(1,−2) | (1,0)²=0; (1,1)²=0; x²=2y² has no nonzero integral solution; GS 1.2.25 `gompfstipsicz` 728–734 | pass |
| §3.1 order | §1.4 → §3.6 | §1.4's `*Needs:*` names no Layer 3 item; §3.6 names §1.4 | pass; R02 repaired |
| §3.2 λ(f,f) | one ± double point, e=0 | µ=±1, λ=±2; `powellrayteichner` 290: λ(f,f)=µ+µ̄+e·1; Thm A 87–96; Def 3.2 481–484 | pass |
| §3.2 FQ 2.9.1; KQ | locators | `freedmanquinn` 1496: poly-(finite or cyclic), height ≥3; `krushkalquinn` 60–61: height ≥2, subexponential | pass |
| §3.3 controls | 1/4 against 1/2, 1/8, strict 1/4 | pass, fail, fail; S¹→point winding 1 | pass |
| §3.4 Theorems 7.5–7.6 | locators | `freedmanquinn` 3854, 3906 | pass |
| §3.4 coefficients | 1, ℤ | Wh 0; K̃₀(ℤ)=0 (`Module.free_of_finite_type_torsion_free'`, `Mathlib/LinearAlgebra/FreeModule/PID.lean:385`, an instance); K̃₀(ℤ[ℤ])=0 (GAK §10.12a); K₋ᵢ=0 (§10.13); L₅(ℤ)=0, L₅(ℤ[ℤ])=ℤ | pass |
| §3.5 8.2, 9.6, §9.12, §7.8 | locators | `freedmanquinn` 4064, 4983, 5879–5887, 4041–4043 | pass |
| §3.6 surgery sequence, 11.11, Crowell | locators | `freedmanquinn` 7469; 7884–7887 (perfect kernel iff Δ=1, N a homology 3-sphere); 7925–7930 | pass |
| §3.6 Ω₃^Spin(S¹) | suspension | Ω̃₃(S¹)≅Ω₂(pt)=ℤ/2, Ω₃^Spin=0; TB head B2.1–B2.4 at `rev/942:591`–677, B3.2(b) 1840, B3.2(c) 1867, B3.3 1894 | pass |
| §3.6 topologically slice Arf (new) | F̂ locally flat, W TOP 3-manifold | Alexander duality and Euler number 0 hold in TOP; the preimage of a regular value under a transverse map to S¹ has boundary F̂×{θ}; smooth and TOP Spin structures on W are both H¹(W;F₂)-torsors and BO→BTOP is 3-connected (TOP/O 2-connected), so the comparison is a bijection; curves of F carry all of H₁(F̂;F₂) since D is a disc; kernel dim g by TOP Poincaré–Lefschetz duality | pass |
| §3.7 realization | 0, H, E₈, 2E₈, [1] | KS 0,0,1,0; odd admits both; FQ 10.10 `freedmanquinn` 6416–6418 (k≡σ/8 only for even λ) | pass |
| §4.2 formula | CP² line; E₈; 2E₈; Bastl 5.3 | (1−1)/8+0=0; 1; 0; `bastletal` 427–429: ks=Arf+(λ(c,c)−σ)/8, equal mod 2 to (σ−F²)/8+Arf | pass |
| §4.2 even implies Spin | H₁ without 2-torsion; Enriques | Ext(H₁,ℤ/2)=0 so H²(ℤ/2)→Hom(H₂,ℤ/2) injective; Enriques even form, w₂≠0 | pass |
| §4.3 Pontryagin square | CP²; S²×S² | P(h̄)=1; P(a+b)=2 with j(1)=2 | pass |
| §5 energy, scaling | S⁴; g↦λ²g | E=8π²k+2‖F⁺‖²; E scales λ^{n−4} | pass |
| §5.1 index | S⁴; S²×S²; Q₈ on Σ₂×Σ₂ | −3=0−3−0; −6=0−3−3; 6−0−12=−6=−3(1−8+9) | pass |
| §5.1 Kuranishi | FL §3.1 | `feehanleness` 666–668 | pass |
| §5.2 budget and names | N=5, s=3 | q=6, ℓ≥10; `TauCeti.isMeagre_image_criticalPoints_of_isFredholm` (`SardSmale.lean:33`) threshold (dim ker)²+1 | pass; R03 repaired |
| §5.3 gluing, Donaldson | FL Thm 3; Q=−I_r | `feehanleness` 275–278: closed connected oriented smooth four-manifold, compact G; r pairs ±eᵢ, σ+r=0 | pass |
| §6.1 blowup | CP²; nine times | χ=4, σ=0; χ=12, σ=−8, (3H−ΣE)²=0 | pass |
| §6.3 SL₂ | A,B,S | SAS⁻¹=`[[1,0],[−1,1]]`=B; AB=`[[0,1],[−1,1]]`; (AB)³=−I; (AB)⁶=I | pass |
| §7.1 indices | K3; reversed | −(−16)/8=2, −(−16)/16=1; −2, −1; IndexTheory I7 item 5 (`rev/1077:852`–871) | pass |
| §7.2 E(n) | n=1,2,3 | (12,−8,10), (24,−16,22), (36,−24,34) | pass |
| §7.3 Enriques Check | v=(i,√3,i√3,1,0,0); t=(1,2,3),(4,5,6) | squares (−1,3,−3,1,0,0), all three quadrics 0 (to 10⁻¹⁵); minor of columns 0,1,2 = −48; Vandermonde determinants 2, 2 | pass |
| §8.1 nonrecognition | Tancer; GS 1.2.33 | `tancer` 73–76 (deficiency 9), 131–134; `gompfstipsicz` 838 | pass |
| §8.2 bound, KS | Q=Q′=[1]; ±1 unknot | v²≤1, solutions ±1; `bastletal` 598–601; KS=(1−1)/8+0=0 | pass |
| §8.3 headline | standard ℝ⁴ | `IsEmpty` component refuted by `Diffeomorph.refl` (probe); K3 minus 3H = 2(−E₈), even, ≠ −I₁₆ | pass |
| gap:top-manifold-cw-type | Milnor 1959 | `milnor1959` 20 (Theorem 1, dominated by a countable CW complex) and 37 (Corollary 1: every separable manifold) | pass |
| gap:brown-schoenflies | Brown 1960 | `brown1960` 84 (Theorem 4) and 101–103 (Theorem 5: closure of either complementary domain is an n-cell) | pass |

That is 52 rows. No instance refuted a stated theorem, and no changed passage introduced a defect.

**Pinned declarations opened** (Tau Ceti `a91d3aa`, Mathlib `6b7abb3c`): `TauCeti.parameterProj`, `isFredholm_parameterProj`, `index_parameterProj`, `parameterProj_surjective_iff` (`Analysis/Fredholm/Parametric.lean:130`, 429, 407, 343); `isMeagre_image_criticalPoints_of_isFredholm` (`Analysis/Fredholm/SardSmale.lean`); `KnotTheory.alexanderMatrix` (`Alexander.lean:92`, body `T 1 • V.map C − (V.map C)ᵀ`), `alexander` (378), `enlargeColumn` (156), `enlargeRow` (227), `trefoilSeifertMatrix` (562), `figureEightSeifertMatrix` (579); `IntegralSquareMatrix.SEquivalent` (`SeifertMatrix/SEquivalence.lean`); `brownBicollaring` (`LocallyFlat/Brown.lean:39`); `e8Plumbing` (`Plumbing/E8.lean:63`); `PlumbingGraph.intersectionForm` (`Plumbing/IntersectionForm.lean:171`), `characteristicVectors` (`Plumbing/Differential.lean`); `IntegralLattice.ofIntegralForm` and `carrierEquiv` (`IntegralLattice/Rationalization.lean:118`, 153); `TopCat.singularCup` (`AlgebraicTopology/Cohomology/Cup.lean`); `filledHull` (`Topology/FilledHull.lean:83`); `IsTopologicallySlice` (`KnotTheory/Slice/Basic.lean:277`); `SmoothCircleEmbedding.HasPerfectCommutatorSubgroup` (`KnotTheory/KnotGroup.lean`); `FreedmanSliceTheorem` (`Slice/Freedman.lean:64`); `AnnulusConjecture`, `CoboundAnnulus` (`LocallyFlat/Annulus.lean:105`, 91); Mathlib `Module.free_of_finite_type_torsion_free'` (`LinearAlgebra/FreeModule/PID.lean:385`). `Projectivization.map`, `submodule`, `IsManifold`, `Diffeomorph` elaborate in `Suggested.lean`.

**Cross-roadmap citations resolved** (main unless stated): GeometricTopology Layers 1 (handle attachment 213, tubular neighbourhoods 218), 2 (annulus conjecture 329–353), 3 (diffeomorphism groups 357), 4 (`FramedDiagram`, Seifert matrix, Conway-normalised Alexander 472–506), 5 (519) and comparison item 3 (930–952); MorseNovikov N6 (377, 554–558); SpinGeometry G4 (395) with G4.3/G4.4 (52–53) and G6.7 (821); HeegaardFloer F0 Sard (19–20, 112); AlgebraicTopology 8.11a (119), `SimplyConnectedAtInfinity` 1703, `endComponents` 1711, `ConnectedAtInfinity` 1716, `stableFundamentalGroupAtEnd` 1719, `properWhiteheadSimplyConnectedCW` 1734, `properStrongDeformationRetract_of_inverse` 1752; IntegralLattices 0F (562) and 6A (1643); CharacteristicClasses C1.2a (62); ComplexKahlerGeometry K5 (568), K7 (1405); AffineMorseLefschetz A0 (67), A4.0 (27), A5 (494), A6 (535); GroebnerGeometry G1 (63); TopologicalKTheory T1 (163), T6 (962); GeneralizedCohomology G4.0b (39–40); SmoothBundlesConnections B1.3 (395), B1.5 (498), B2.1 (559), B2.5 (802), B3–B5 (871–); QuadraticFormInvariants Arf exclusion (177); SeibergWittenTheory SW1 (downstream, exists). Open heads given by the brief: TangentialBordism (`rev/942`) 1.1 = B3.2(a) (189) with `gap:finite-quadratic-arf` (154–172), B1.7 (519), B2.1–B2.4 (591–677), B4.1/B4.3 (726, 831), B5.2 (1014), B3.2(b) (1840), B3.2(c) (1867), B3.3 (1894), B3.4 (1774); HomotopySpheres (`rev/1287`) 3C (477), 4B (648), 6B with the finite E₈ plumbing family (951, 1083), 6C (1115), 7A–7C (1141–1192); IndexTheory (`rev/1077`) I4 (432), I7 item 5 (852–871, `rokhlin_signature_dvd_sixteen`); StringOrientation (`rev/948`) `spinLambda_adjoint_eq_neg_two_cTwo` (269), `spinLambdaMap_isEightConnected` (311), `spinLambda_modTwo_eq_wFour` (267); PseudodifferentialOperators (`rev/952`) P5–P7 (914, 1470, 1584); GeneralAlgebraicKTheory §10.3, §10.5, §10.12a, §10.13 (`roadmaps show`, lines 2326, 2364, 2505, 2529). Every supplier is on main or earlier in the merge order (TangentialBordism 9, HomotopySpheres 64, FourManifolds 119); IndexTheory, not yet in the order, is placed after its suppliers by the check. The worker's `citations.md` found no unresolved citation or Lean name, and `roadmaps resolve` reported none.

**Ownership against open work.** `roadmaps grep` over the 433 open heads and main: `TauCeti.AnnulusConjecture` and `TauCeti.FreedmanSliceTheorem` are declared only here and in GeometricTopology's open revision (#903, `Suggested.lean:72`, 91), which is a revision of an existing roadmap and so never a supplier; GeometricTopology on main names Freedman's theorem only as an “unlock” needing its Layer 6 (`README.md:516`), and this README says GeometricTopology consumes nothing from here. The exotic four-space, Donaldson's theorem, the Enriques quadrics and the Casson-handle construction occur in no other roadmap; the knot Arf invariant, oriented linking number and S-equivalence occur elsewhere only in #903's Layer 4 (the content this roadmap now declares as gaps) and MorseNovikov N6. No second `Suggested.lean` declares any of the twelve fully qualified names. The board's packages index lists no competing package.

**Sources read at their locators this round** (cache texts): `freedmanquinn` 2.9.1 (1496), 7.5 (3854), 7.6 (3906), §7.8 (4041–4043), 8.2 (4064), 9.6 (4983), §9.12 (5879–5887), 10.10 (6416–6418), 11.5 (7469), 11.11 (7884–7887), §11.9 (7925–7930); `powellrayteichner` Theorem A (87–96), (1.1) (290), Definition 3.2 (481–484); `krushkalquinn` unnumbered theorem (60–62); `feehanleness` Theorem 3 (275–278), §3.1 (666–668); `bastletal` Theorem 5.3 (427–429), Lemma 6.5 (598–601); `tancer` Theorems 1–2 (73–76), Proposition 5 (131–134); `gompfstipsicz` 1.2.25 (728–734), 1.2.33 (838); `milnor1959` Theorem 1 (20), Corollary 1 (37); `brown1960` Theorems 4–5 (84, 101–103). Each supports the statement as written, with the hypotheses the README states.

**Remark, not a finding.** In §3.6's topologically-slice paragraph, `TauCeti.brownBicollaring` is cited for the bicollar of W; the transverse preimage already carries the pulled-back product neighbourhood, so the citation is redundant rather than wrong.

## Not verifiable

- **Moise, GTM 47, Theorems 35.3, 36.1, 36.2 (pp. 252–253); Munkres, Ann. of Math. 72 (1960); Whitehead, Ann. of Math. 73 (1961):** the texts behind `gap:three-manifold-smoothing` are a Springer book and JSTOR-only articles; not in the cache and not legally fetchable. The mathematical content (triangulation and Hauptvermutung for three-manifolds, relative form, PL-to-smooth in dimension three) is the standard statement; the theorem numbers and pages are cited by locator only.
- **Lickorish Chapters 1, 6, 8, 10; Rolfsen Chapter 7; Robertello 1965; Freedman–Kirby 1978; Kirby LNM 1374 Chapter XI:** not in the cache; the §1.4 Arf, linking, S-equivalence and Alexander-module statements are checked by the computed instances in the table instead.
- **Gompf 1983, Theorem 1.2:** the Project Euclid fetch returns a landing page without the text; cited by locator.
- **Gompf–Stipsicz §5.1 (pp. 139–153), §2.2, §8.2, §3.1:** the legal preview ends at printed p. 36; checked by instance (blow-up row).
- **Kirby–Siebenmann Essays, Kirby 1969, Marin, Kister, Shaneson, Madsen–Milgram, Hirsch–Mazur, Cerf, Bass 1968, Quinn 1979/1982/1988, Browder, Lees, Lashof, Serre, Hanner, Edwards–Kirby, Freedman 1982, Donaldson 1983:** image-only scans, landing pages or absent from the cache, as in the previous reviews; unchanged text, cited by locator.
- No `design/plan.json` is readable for this pull request, so the fifteen gap slugs could not be cross-checked against a plan.
- The global shrinking, controlled-product, obstruction-gluing and continuation arguments are not proved by the instance table; the table checks their stated values and hypotheses.

## Source issues

- **Misprint** in tancer at Proposition 5(iii), printed p. 3: the source calls H₂ of the boundary a free product of 2k copies of ℤ; it should say free abelian group of rank 2k; affects a stated result.
- **Gap** in freedmanquinn at Theorem 8.17, printed p. 134: the source attributes the i = 5 vanishing to a reference whose replacement criterion is not justified; it should cite the stable pseudo-isotopy route of Gabai–Gay–Hartman–Krushkal–Powell, Theorem 1.1; affects the proof; corrected in print at arXiv 2311.11196, Theorem 1.1.
