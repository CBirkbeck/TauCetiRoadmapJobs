# Review of ClassicalGroupsPartII (pull request #1492 at dab14f6)

**Verdict:** needs changes

:robot: Independent AI review, full pass. There are three findings, all P3, and none is blocking. The mathematics of every statement I tested holds; the computed values are in the table below.

Of the previous review's four findings, three are repaired (R01, R03, R04). R02, the unnamed ClassicalGroups revision, is still open and is carried forward here as R02.

The two other findings are new and both concern the GSp supplier contract that replaced CG.0.1–CG.0.2's own construction:
- **R01:** the bare group scheme GSp₂g already has an owner earlier than PELModuli, namely ArithmeticGaloisRepresentations §7.3.
- **R03:** the Siegel datum is cited at the wrong PELModuli section.

## R01 (P3) — The GSp₂g group scheme is first owned by ArithmeticGaloisRepresentations §7.3, not PELModuli

**Location:** `TauCetiRoadmap/ClassicalGroupsPartII/README.md:75` (“The group GSp₂g itself belongs to PELModuli.”). The same attribution appears in the PELModuli supplier subsection (lines 316–337), in CG.0.1 (lines 379–381), in “How to read the build” (line 353) and in the `Suggested.lean` module docstring (line 15).

**Claim:** Two open new-roadmap pull requests each build the group scheme GSp₂g with its multiplier: ArithmeticGaloisRepresentations §7.3 and PELModuli §M0.7. ArithmeticGaloisRepresentations is earlier in the merge order (line 57, against PELModuli's 116 and this roadmap's 200).

Its §7.3 covers:
- `SimilitudeGroup.groupScheme J` over every commutative ring, closed in GL×G_m, with points (g,ν) satisfying gᵀJg=νJ;
- ν determined by g;
- `SimilitudeGroup.multiplier`;
- `SimilitudeGroup.GSp` for J=−`Matrix.J`, which is this roadmap's J;
- the Check GSp₂=GL₂ with ν=det.

LocalGaloisDeformationRings already consumes the group from there. Under the rule of one owner, earlier in the merge order, the owner of the bare group scheme is ArithmeticGaloisRepresentations §7.3. PELModuli §M0.7 restates that group and does not cite §7.3; that duplication is for PELModuli's own review to settle. This README nonetheless names PELModuli as the owner of the group. Only the connected reductivity of §M0.8 is PELModuli's alone: ArithmeticGaloisRepresentations does not prove GSp reductive.

**Witness:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md` at #856 (head f901260): §7.3 starts at line 4551 and line 4556 defines `SimilitudeGroup.GSp` with J=−`Matrix.J`. `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:1529` at #923 cites “ArithmeticGaloisRepresentations, §7.3 (Similitude groups)”.

**Exact repair:**
1. Add `### From TauCetiRoadmap.ArithmeticGaloisRepresentations` to the supplier contracts. Consume §7.3's `SimilitudeGroup.GSp` for J=−`Matrix.J` and `SimilitudeGroup.multiplier`: points (h,r) with hᵀJh=rJ over every commutative ring, r determined by h, and GSp₂=GL₂.
2. In CG.0.1, set O_g(K) to the coordinate Hopf algebra of `SimilitudeGroup.GSp` over K. Keep the displayed presentation, its proof by the inversion argument of step 1, and the K/F comparison.
3. Keep PELModuli §M0.8 in CG.0.2 for connected reductivity over Q. Add one sentence: PELModuli's Siegel group and `SimilitudeGroup.GSp` over Q have the same points functor (pairs (h,r) with hᵀJh=rJ), so they are the same group.
4. Rewrite lines 75–87 and 353, and the docstring sentence at `Suggested.lean:15`, to name ArithmeticGaloisRepresentations §7.3 as the owner of the group. Add #856 to the description's depends-on list; it is already in the merge-order chain.

Tested on the instance that shows the overlap: at g=1 and h=diag(2,3), §7.3's convention gives hᵀJ₂h=[[0,6],[−6,0]]=6J₂. CG.0.1's hJhᵀ=6J gives the same group and the same multiplier, 6.

This does not reopen the previous R01: consuming the group rather than rebuilding it was the right repair. Only the owner it names changes.

## R02 (P3) — The §3A citations resolve only at an open ClassicalGroups revision that the pull request still does not name

**Location:** `TauCetiRoadmap/ClassicalGroupsPartII/README.md:34` (“Its Layer 3A owns the complex Sp₂g theory: the maximal torus and dominant weights (§3A.1), the group–Lie comparison (§3A.2), and in §3A.3 …”). The anchors `#3a1-…`, `#3a2-…` and `#3a3-…` are at lines 550, 875, 918 and 1009. §3A is also cited at lines 62, 292–312, 847, 889, 896 and 969.

**Claim:** ClassicalGroups on main has no Layer 3A: its subsections are Layers 0–6, at `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:175–310`. §§3A.1–3A.3 exist only in the open revision of ClassicalGroups (#1192, now at head 47ca68e).

The pull request's description names that revision nowhere:
- its depends-on block lists only #966;
- its merge-order chain omits #1192;
- its dependency sentence still says “In open pull requests of ours: none”. That is now also inaccurate, because PELModuli (#966) is an open pull request of ours that the README consumes.

**Witness:** The worker's overlap report lists all six §3A ids under “Ids this README cites that only an open revision defines”, each resolving to #1192. `grep -n 3A` on main's ClassicalGroups README returns nothing. At #1192's head, Layer 3A is at line 621, §3A.1 at 658, §3A.2 at 749 and §3A.3 at 801.

**Exact repair:**
1. No README change is needed: at #1192's head the consumed statements are present and cited by name and section (table below).
2. In the pull request's description, name the ClassicalGroups revision #1192 as a pull request that must merge first, in both the depends-on block and the merge-order paragraph.
3. Replace “In open pull requests of ours: none” with the open pull requests the README consumes. These are PELModuli (#966), plus ArithmeticGaloisRepresentations (#856) once R01 is repaired.

Re-citing main's Layer 3 instead does not work: it states neither the commutator, the kernel's simplicity nor the Cartan components. This is the previous review's R02, unchanged.

## R03 (P3) — The Siegel datum is cited at PELModuli §M0.7; it is a §M0.5 Check, rationalized in §M0.6

**Location:** `TauCetiRoadmap/ClassicalGroupsPartII/README.md:318` (“Consume §M0.7 for the Siegel datum `IntegralPELDatum.siegel` of genus g≥1”) and line 322 (“`RationalPELDatum.coordinate` of its rationalization”). CG.0.1's *Needs:* (line 427), CG.0.2's *Needs:* (line 461) and the Layer CG.0 Dependencies (line 655) cite only §§M0.7–M0.8.

**Claim:** A cited supplier object does not exist at the section cited:
- `IntegralPELDatum.siegel` is a Check of PELModuli §M0.5, “Integral PEL data”.
- The rationalization that feeds `RationalPELDatum.coordinate`, and §M0.8's rational datum, is §M0.6's `IntegralPELDatum.toRational`. Its action is faithful exactly when g≥1.

§M0.7 and §M0.8 apply to these data but do not define them.

**Witness:** `TauCetiRoadmap/PELModuli/README.md` at #966 (head 697b514): the §M0.5 heading is at line 630, `IntegralPELDatum.siegel` at 662, the §M0.6 heading at 682, `IntegralPELDatum.toRational` at 690, and the §M0.7 heading at 712.

**Exact repair:**
1. At line 318, cite PELModuli §M0.5's datum `IntegralPELDatum.siegel` (Gram matrix −`Matrix.J`).
2. At line 322, cite its rationalization by §M0.6's `IntegralPELDatum.toRational`, faithful for g≥1.
3. Add §§M0.5–M0.6 to the *Needs:* lines of CG.0.1 and CG.0.2, and to the Layer CG.0 Dependencies.

Tested: at g=1, line 662 lies between the §M0.5 heading (630) and the §M0.6 heading (682), so the datum is in §M0.5.

## Previous findings

- **R01 (P2), “GSp₂g coordinate Hopf algebra and connected reductivity owned by PELModuli M0.7–M0.8”: repaired.**
  - Line 75 now reads “The group GSp₂g itself belongs to PELModuli”.
  - The supplier subsection at lines 316–337 consumes §§M0.7–M0.8.
  - CG.0.1 sets “O_g(K)=K⊗_Q O_g(Q)” (line 379).
  - CG.0.2 transfers reductivity from §M0.8 by Milne Proposition 19.13.
  - The description's depends-on block names #966.

  R01 above corrects only which roadmap owns the bare group scheme.
- **R02 (P3), §3A revision not named: not repaired.** The description still reads “In open pull requests of ours: none”, and its depends-on block lists only #966. Carried forward as R02.
- **R03 (P3), CG.1.5 needs the later CG.1.6: repaired.**
  - CG.0.1 now gives the Hopf comparison O_g(K)≃K⊗_F O_g(F) (lines 394–395 and the interface bullet at 412).
  - CG.1.5 step 3 (line 902) now uses CG.1.1's coaction-equation Hom spaces and Milne Corollary 4.34 with Exercise 4-4(a).
  - CG.1.5's *Needs:* (line 918) no longer lists CG.1.6, and CG.1.6 cites CG.0.1 (line 956).

  Every *Needs:* edge in Layer CG.1 now points to an earlier section.
- **R04 (P3), `MultLaurent`/`coeffT`/`coeffTInv`: repaired.**
  - `Suggested.lean:109–113` states the presentation over `MvPolynomial (Fin g) (LaurentPolynomial ℤ)`, with `LaurentPolynomial.T 1` and `T (-1)`.
  - The Mathlib contract row is at README line 159.
  - The two coefficient-ring Checks are gone. The new g=0 Check at line 1243, which excludes the composite with T↦T⁻¹, is discriminating.

## Verified sound

**Gate, order, build.**
- I re-ran the gate at this head. Every count was 0 (`outside-folder=0`, `stray-files=0`, `dirty=0`, `statement-hygiene=0`), and it ended `OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check printed the following, with no UPWARD, CYCLE or moved line:

  ```text
  depcheck: 236 roadmaps, 2421 edges, 0 problem(s)
  ```

- Merge order: PELModuli is line 116, ArithmeticGaloisRepresentations line 57 and ClassicalGroupsPartII line 200. ReductiveGroups and ClassicalGroups are on main.
- `lake env lean TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` exited 0 in 8 s. The only warnings were three `sorry` warnings, at lines 109, 130 and 136.
- The file has a single `import Mathlib`, no `set_option`, no sorry'd data and no `lemma`.

**Lean signatures and padding.**
- In one scratch file I elaborated `#check @…` for all 21 declarations. Each elaborated type matches its README statement:
  - `fullInvariantPresentation` holds for every `g`;
  - `mem_positiveSubring` and `positiveInvariantPresentation` carry `0 < g`;
  - there is no `variable` block, so no binder can be lost.
- Every definition is used by a headline, so none is padding: `monomial`, `t`, `tInv`, `z`, `pairedZ`, `permWeight`, `flipWeight`, `permLaurent`, `flipLaurent`, `invariantSubring`, `pairSum`, `exteriorCharacter`, `fundamentalCharacter`, `positiveSubring`, `positiveInvariantSubring` and `coneValue`.
- The one-tactic probe on a scratch copy failed on every headline:
  - `simp` made no progress on `fullInvariantPresentation` or `positiveInvariantPresentation`;
  - `⟨inferInstance, by simp⟩` was rejected;
  - `simp [positiveSubring, coneValue]` left the closure/support equivalence open;
  - `exact Subring.mem_closure_iff` got stuck;
  - `aesop` made no progress.
- The docstring names the eight headlines that are not statable, and the missing carrier: the GSp coordinate Hopf algebra and its comodule category. These are heavy definitions, so they stay as README targets.

**Pinned declarations opened** (Tau Ceti a91d3aaf, Mathlib 6b7abb3c):
- `Symplectic.coordinateHopfAlgebra`/`groupScheme` (`Algebra/AlgebraicGroup/Symplectic/Basic.lean:104, 122`).
- `GeneralLinear.coordinateHopfAlgebra` (`…/GeneralLinear/Coordinate/HopfAlgebra.lean:479`).
- `JFin` (`…/Symplectic/Basic.lean:243`, `Matrix.J` along `finSumFinEquiv`).
- `Comodule.baseChange` (`Comodule/BaseChange.lean:166`).
- `Comodule.exteriorPower`, `Hom.exteriorPowerMap` and `baseChange_subtype_endOfPoint_ιMulti` (`ExteriorAlgebra/Power.lean:73, 110, 166`).
- `Comodule.Hom.ker`/`ker_finite` (`Subcomodule/Comap.lean:238, 249`).
- `SplitK0`/`of` (`GrothendieckGroup/Split.lean:114, 124`); `of_mul_of`, `liftRingHom` and `mapRingHom` (`Monoidal/Basic.lean:179, 263, 324`).
- `FGComoduleCat` (`Finite/Basic.lean:96`), `instMonoidalCategory` (`Monoidal.lean:161`), `instBraidedCategory` (`Symmetric.lean:81`), `hasBinaryBiproducts` (`Product.lean:158`).
- `DiagonalizableGroup.weightSpace`/`isInternal_weightSpace` (`DiagonalizableGroup/Weight.lean:83, 105`).
- `matrixCoefficientSubcoalgebra`/`_finite` (`MatrixCoefficient/Subcoalgebra.lean:53, 92`).
- `GLSymplecticFin.diagonal` (`Diagonal/Basic.lean:95`), the three Weyl elements (`Weyl.lean:79, 422, 428`), `repRing` (`RepresentationRing/Basic.lean:106`).
- `smoothCommHopfAlgProperty_of_charZero`/`HopfAlgebra.isReduced_of_charZero` (`Smooth/CharZero.lean:148, 166`), `char_extPowerRep_diagonal` (`ExteriorPower.lean:138`), and the two Lie classification theorems (`HighestWeight/Existence.lean:240`, `FiniteDimensional.lean:126`).
- Mathlib:
  - `Matrix.J := fromBlocks 0 (-1) 1 0` (`LinearAlgebra/SymplecticGroup.lean:58`);
  - `LaurentPolynomial` and `T` (`Algebra/Polynomial/Laurent.lean:84, 155`);
  - `MvPolynomial.esymmAlgEquiv` (`FundamentalTheorem.lean:340`);
  - `MonoidAlgebra.domCongr` (`Basic.lean:302`);
  - `GeneralLinearGroup` (`Defs.lean:42`).

**Declared gaps.** The three slugs, with supplier ReductiveGroups Layer 1 or Layer 3, are stated at README lines 222, 242 and 264. Each is precise and minimal, as found last round; the text is unchanged.

**Cross-roadmap citations resolved.**
- ReductiveGroups on main:
  - Layer 0 (129), Layer 1 (176), Layer 3 (234);
  - Layer 6 (466: Milne's definition of reductive, central isogenies, and reductive ⇔ linearly reductive in characteristic 0);
  - Layer 7 (627), §7C (652), §10A (1733), §10B (1759: classification by X⁺, absolute simplicity, End=k, base change).
- ClassicalGroups on main: Layers 0, 1, 2 and 4 (175, 200, 216, 272).
- PELModuli at #966's head:
  - §M0.7 (712), with `coordinate` (717), `coordinatePoints` (719), `multiplier` (720) and the rational forms (725);
  - `multiplier_unique` (732–733: flat R, L≠0, R≠0) and `isometry_siegel` (735);
  - `similitudeGroup_siegel_one` (751);
  - §M0.8 (765), `similitudeGroupStructure` in Case C (767) and `similitudeGroupStructure_siegel` (783).

  Neither section uses this roadmap. The points convention ⟨gx,gy⟩=r⟨x,y⟩ is hᵀJh=rJ. CG.0.1 step 1 shows this is equivalent to hJhᵀ=rJ, and the two ideals coincide: take A=R/I in the functor-of-points comparison.
- ClassicalGroups §3A at #1192's head 47ca68e, compared item by item:

| This README (line) | #1192 head 47ca68e (line) | Agrees |
| --- | --- | --- |
| native `Matrix.J`=[[0,−I],[I,0]] on `(Fin g ⊕ Fin g)→ℂ` (292–293) | 623–626 | yes |
| torus diag(t,t⁻¹), dominant λ₁≥⋯≥λ_g≥0 (294–295) | 666–671, 736–737 | yes |
| group-stable ⇔ Lie-stable, smooth connected, algebraically closed, characteristic 0 (295–298) | 751–756 | yes |
| κ with (−1)^(a+b−1); L by the bivector of every basis with ω(a_i,b_j)=δ_ij; commutator (g−k)·id (298–302) | 806–816 | yes |
| surjective for 1≤k≤g; kernel simple, of weight ω_k, dimension binom(2g,k)−binom(2g,k−2) (302–305) | 816–820 (surjective for k≤r+1) | yes |
| Cartan component of the highest tensor; exhaustion (305–307) | 886–898 | yes |

  #1192 cites this roadmap's CG.1.4–CG.1.5 and CG.1.7 at its lines 54–55 and 1895. These ids are unchanged at this head.

**Sources: the seeded sample.**
- I read the “Construction and proof” blocks of CG.0.1, CG.1.5, CG.1.6, CG.1.7, CG.2.4, CG.3.1, CG.3.2 and CG.3.4.
- I read the “Consequences to check” blocks of CG.0.1, CG.1.5, CG.1.6, CG.2.4, CG.2.5, CG.3.4 and CG.3.6.
- The README flags no locator as unverified.

I checked every locator these blocks use. For Milne, printed page = PDF page − 11.
- `yu line 3729–3770` (printed p.64) covers §7.1, (7.1.1) and Remark 7.1.1:
  - GSp₂g over Q is defined by h·[[0,I],[−I,0]]·ᵗh=z·J;
  - the trace on diag(z_i, t/z_i) gives the Weyl invariants;
  - the ring is polynomial in t^±1 and ∧^kV−t∧^(k−2)V for 1≤k≤g;
  - the tensor-constituent subring is Z[z,t/z]^W.
- Milne:
  - `milne line 16462–16464` is the new locator: Proposition 19.13, printed p.400. It says an algebraic group variety is reductive iff its base change to any extension field is. The definition at `milne line 16441` matches ReductiveGroups Layer 6.
  - `milne line 4245–4260` gives 4.32 and 4.34 on p.96; `milne line 4281–4287` gives Exercise 4-4(a,b) on p.97.
  - `milne line 15761–15765` is Theorem 17.93(a) on p.382: k perfect, so G(k) is dense when k is infinite.
  - `milne line 16482–16504` gives 19.16–19.19 on p.401.
- Sternberg:
  - `sternberg line 5019–5058` (p.131): Cartan product; contraction surjective for j=2,…,n; the kernels are the fundamental representations of C_n.
  - `sternberg line 5112–5149` (pp.132–133): (2n+1)(2n−2)/2 = 2n²−n−1 = binom(2n,2)−1.

Each source supports the statement as written. The descent to every characteristic-zero K and the ν-twist are this roadmap's own, as its text says.

**Adversarial table.** Rows marked (machine) were computed by a pure-Python script over ℤ and ℚ: Laurent polynomials as exponent dictionaries, the exterior algebra on e₁…e_g, f₁…f_g with ω(e_i,f_j)=δ_ij. Every other row was computed by hand.

| Statement (line) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `fullInvariantPresentation` (Lean 109; README 1220) | g=0,1,2,3 | g=0: no perms beyond id and no flips, so `invariantSubring 0`=⊤≅ℤ[t±1]; T↦t. The composite with T↦T⁻¹ sends T 1 to t⁻¹≠t. g=1: z²+(t/z)²↦X²−2T. g=2: e₂(x)↦X₂−T. 20/50/50 dominant orbit sums (g=1/2/3) written in ℤ[t±1,F], 0 failures (machine) | True in every rank; retain |
| `mem_positiveSubring` (Lean 130; 1356) | g=1,2,3 box; g=0 | 32/165/380 weights: monoid of z_i, t/z_i against cone≥0, 0 mismatches (machine). g=0: t has cone 1 but B₀=ℤ | `0<g` needed and present; retain |
| `positiveInvariantPresentation` (Lean 136; 1404) | g=1,2,3; g=0 | 12/30/30 orbit sums with cone≥0 written in ℤ[t,F₁…F_g], every t-exponent ≥0 (machine). The leading monomials of t^a∏F^c are distinct, so the generators are independent. g=0: t∉B₀ | True for g≥1; retain |
| E_k generating formula (1095, 1231) | g=1..4, 0≤k≤2g | E_k=Σ_j binom(g−k+2j,j)t^j e_(k−2j)(x) in all cases; E_(2g)=t^g; E_(2g+1)=0 (machine) | Holds; retain |
| F_k triangular, augmentation (1097, 1212) | g=1..4, 1≤k≤g | Coefficients [1], [1,1], [1,2], [1,1], [1,3], [1,2], [1,1,2]. Augmentations 2; 4, 5; 6, 14, 14; 8, 27, 48, 42 = binom(2g,k)−binom(2g,k−2). g=3: F₃ has augmentation 20−6=14 (machine) | Diagonal 1; retain |
| orbit recurrence (1079, 1229) | g=1, n=0..7 | p₀=2, pₙ=xpₙ₋₁−tpₙ₋₂ equals zⁿ+(t/z)ⁿ for n≥1 (machine); the zero orbit is 1 | No division; retain |
| `exteriorCharacter`/`fundamentalCharacter` (Lean 97, 103) | g=0; k=−1,0,1 | E₋₁=0 by the `k<0` branch; E₀=1; E₁=0. F₁=E₁−t·E₋₁=E₁ | No truncated subtraction; retain |
| `permWeight`/`flipWeight` (Lean 50, 58) | g=3 cycle (1 2 3); g=1 | u∘σ⁻¹ sends z₁ to z₂ (u∘σ would give z₃). Flip: (0,δ_i)↦(1,−δ_i)↦(0,δ_i); (−1,2)↦(1,−2) | Matches 555–556, 607; retain |
| CG.0.1 inversion argument (401) | invertible h | hᵀJh=rJ ⇒ h⁻¹(−J)h⁻ᵀ=r⁻¹(−J) ⇒ hJhᵀ=rJ. Equal ideals: R→R/I kills I, hence I′ | Correct; retain (owner per R01) |
| CG.0.1 new Check (422) | g=2, A=[[1,1],[0,1]] | B=3A⁻ᵀ=[[3,0],[−3,3]]: ABᵀ=AᵀB=3I. B′=3A⁻¹=[[3,−3],[0,3]]: AB′ᵀ=[[0,3],[−3,3]] and AᵀB′=[[3,−3],[3,0]], neither equal to 3I | Discriminating; retain |
| CG.0.1 rank one, scalars, g=0, zero algebra (417–421) | 2×2 h; 2I; g=0; A=0 | hJhᵀ=det(h)J; 2I gives 4J; at g=0, s=1 and s=2 both work; both point sets are singletons over A=0 | Retain |
| CG.0.2 reductivity transfer (434–438) | Q⊂K | Milne 19.13: G reductive ⇔ G_K reductive, for smooth G; GSp over Q is reductive by PELModuli §M0.8 | Correct; retain |
| CG.0.2 new Check (458) | π(a,c)=ca against c²a | ca·J·(ca)ᵀ=c²J; c²a gives c⁴J. Kernel of c²a: a=c⁻²I∈Sp, so c⁴=1, i.e. μ₄ | Excludes the variant; retain |
| CG.0.2 kernel and fppf (445, 455–457) | ca=I; diag(1,2) over Q; Q[ε]/ε² | a=c⁻¹I and c²=1 give (±I,±1); the lift needs c²=2; (1+ε/2)²=1+ε | Retain |
| CG.0.3 pullback and parity (473–476, 497) | z_i=cy_i, t=c²; ((1,0…),0) | (m,u)↦(u,2m+Σu); d−Σu=−1 is odd, so not in the image | Retain |
| CG.0.3 roots (499–513) | entry (i,g+j); g=1 | Weight z_iz_j/t gives e_i+e_j−e_t, so α_g=(−1,2δ_g) and ⟨α_g,α_g^∨⟩=2; 2α₁=(−2,4); m unrestricted | Retain |
| CG.1.5 commutator (898) | g=1,2,3, every k from 0 to 2g | κL−Lκ=(g−k)·id on every basis wedge (machine) | Holds, negative g−k included; retain |
| CG.1.5 ranks and kernels (879–885, 913) | g=2, g=3 | g=2: κ₂ has rank 1 (kernel 5); κ₃ is 4→4 of rank 4. g=3: κ₂, κ₃, κ₄ have ranks 1, 6, 15 (kernels 14, 14, 0); κ₅ has rank 6 against a 20-dimensional target. Surjective exactly for k≤g+1 (machine) | Range 1≤k≤g correct; retain |
| CG.1.5 Checks (906–910) | g=2; g=1 | κ₂L₀(1)=2; L₁(e₁)=e₁∧e₂∧f₂ and κ₃L₁(e₁)=e₁; κ₄L₂(q₁)=q₁+q₂=L₀κ₂(q₁). g=1: κ₄L₂(q₁)=0 and L₀κ₂(q₁)=q₁, difference −q₁ (machine) | Retain |
| CG.1.5 characteristic-2 control (912) | g=2 | κ₂ row [0,1,0,0,1,0]; κ₂(Ω)=2≡0 mod 2 (machine) | Retain |
| CG.1.5 step 3 Hom descent (902) | ℚ⊂ℂ, P_k | Corollary 4.34 and Exercise 4-4(a): dim_ℂ End=1 ⇒ dim_ℚ End=1, and then dim_K̄ End=1 | Correct, no CG.1.6 needed; retain |
| §3A transport (308–312, 896, 910) | g=1 native form | Ω_J=Σf_i∧e_i=−Ω; ω_J(e_i,−f_j)=δ_ij. (−κ)(−L)−(−L)(−κ)=κL−Lκ; κ₂(Ω_J)=g | Retain |
| CG.1.2 cell, 𝔽₄, s−1 (792–794) | (2,3,5,7); [[α,1],[1,0]]; 2I | [[5,15],[10,37]] has det 35=rs; α²−α=1 and det 1 over 𝔽₄; s−1 takes the value 3 at 2I | Retain |
| CG.1.2 pair swap (790) | J∈Sp | JJJᵀ=J; Je₁=−f₁ | Retain |
| CG.3.4 occurrence (1466–1477) | g=1, (−1,2,0); general u | Every weight of V^⊗d has m=#(t/z)≥0 and degree d. Σk·a_k=Σk(u_k−u_(k+1))=Σu_k. (−1,2) has d=0 but m<0, so it does not occur | Exact criterion; retain |
| CG.1.1 and CG.2.6 at g=1 (718, 1294) | V⊗V, Sym²V | x²=z²+2t+(t/z)²; x²−t=z²+t+(t/z)² (machine); dimensions 4=3+1 | Retain |
| CG.1.8 rank one (1025) | z=a, t=ab | t^m z^u=a^(m+u)b^m | Retain |
| Sternberg dimension (1580–1582) | general n | (2n+1)(2n−2)/2=2n²−n−1=binom(2n,2)−1 | Retain |
| R01 convention match | g=1, h=diag(2,3) | ArithmeticGaloisRepresentations: hᵀJ₂h=[[0,6],[−6,0]]=6J₂. Here: hJhᵀ=6J. Same group and multiplier | Owner per R01 |
| R03 locator | PELModuli README lines | `IntegralPELDatum.siegel` at 662, between §M0.5 (630) and §M0.6 (682); §M0.7 begins at 712 | Repair per R03 |

**Ownership and duplication.** I searched by object with `roadmaps grep` over main and every open head (patterns `GSp`, `similitude … Hopf`, `R(GSp`, central isogeny onto GSp, `t/z_i`, primitive exterior, `1807.04659`). I also read the sibling checkouts of ClassicalGroups #1192 and ReductiveGroups #1332.
- The bare GSp group scheme: ArithmeticGaloisRepresentations §7.3 and PELModuli §M0.7 (see R01).
- Yu's ring and the support cone have no other owner. DeligneWeightsAndPurity and AutomorphicLFunctionsAndLocalFactors cite Yu §7.1 p.64 only for Weil-number background. FunctionFieldArithmetic, GlobalShtukasAndFunctionFieldLanglands and WeilConjectures cite other sections of Yu.
- No roadmap states the central isogeny Sp₂g×G_m→GSp₂g or GSp primitive exterior powers. AbelianSurfacesModularity's “primitive exterior square” is a finite-field coset model.
- SiegelModularForms (#1714) defers “the algebraic symplectic similitude group, its coordinate Hopf algebra, its multiplier and its representations” to this roadmap (its line 84). That is consistent with this roadmap owning O_g(K) and the representation theory.
- The overlap report finds no other pull request changing this roadmap and no dropped id. Only the six revision-only §3A ids remain (R02). The citation resolver's five leads are PELModuli README targets, all resolved above.

## Not verifiable

- None of the cited texts was inaccessible; no fetch was needed.
- I read PELModuli, ArithmeticGaloisRepresentations, LocalGaloisDeformationRings and SiegelModularForms at their open heads through the roadmap index (`roadmaps show`), not from sibling checkouts. I judged the pull request's description from the worker's quoted copy, not from the live page.
- Outside this pull request, the package manifest's `milne` locator still lists 19.16–19.19, not Proposition 19.13.

## Source issues

- **Misprint** in sternberg at §7.9, printed p.131 (`sternberg line 5054`): the source subtracts binom(2n,2j−2) in the contraction-kernel dimension; it should be binom(2n,j−2), the dimension of the target Λ^(j−2); affects a stated result.
- **Misprint** in sternberg at §7.9, printed p.132 (`sternberg line 5123`): the source gives numerator j in the second difference-factor product; it should be j−1, as (r₂−r_j) requires and as the displayed telescoping product needs; affects the proof.
- **Misprint** in sternberg at §7.9, printed p.131 (`sternberg line 5025`): the source names the second highest weight σ; it should be µ, as in the following sum and highest vector; affects nothing.
- **Misprint** in sternberg at §7.9, printed p.132 (`sternberg line 5106`): the source writes r_i=a+n−i; it should be r_i=a_i+n−i; affects nothing.
- **Misprint** in milne at Chapter 4 §i, Exercise 4-4(b), printed p.97 (`milne line 4286`): the source repeats the word “if”; it should appear once; affects nothing.
