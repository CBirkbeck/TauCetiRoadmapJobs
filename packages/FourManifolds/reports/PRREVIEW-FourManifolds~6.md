# Review of FourManifolds (pull request #936 at f1e8fde)
**Verdict:** needs changes

One blocking finding: the head replaces three declared GeometricTopology gaps, and the finite Arf algebra formerly cited from TangentialBordism, by citations of GeometricTopology sections that do not exist on main. Three P3 notes follow, two of them carried from the previous review. Every locator of the seeded sample, the Lean file (byte-identical since the third review) and the gate are sound.

## R01 (P1) — GeometricTopology §4.3, §4.3.1, §4.4 and Layer 11's smoothing comparison are cited as supplied, but exist only in GeometricTopology's open revision, not on main

**Location:** `TauCetiRoadmap/FourManifolds/README.md:25`–28 (“GeometricTopology 4.3 supplies oriented linking, Seifert matrices and their S-equivalence; 4.4 supplies the Alexander-module presentation …; 4.3.1 supplies the finite quadratic Arf algebra and knot/proper-link invariant”), 171, 187–188, 324, 337, 348 (“Consume GeometricTopology 4.3's … / 4.4's …”), 458, 476, 501–510, 551–557 (“GeometricTopology Layer 11's relative dimension-three smoothing comparison”), 631, 733, 1552, 1565, 1573, 1585, 1602, 1871, 2010.

**Claim:** The oriented linking number, the Seifert matrix with S-equivalence of Seifert surfaces, the Alexander module with Crowell's comparison, the finite nonsingular-F₂ Arf algebra, the Arf invariant of knots and proper links, and the relative uniqueness of smooth structures on three-manifolds are stated by GeometricTopology §4.3, §4.3.1, §4.4 and Layer 11.

**Witness:** GeometricTopology on main (`TauCetiRoadmap/GeometricTopology/README.md`, main at `fa41b37`): Layer 4 is lines 409–518 with no subsections; Layer 11 is 831–929. `grep -c Arf` on that file returns 0, and “linking number”, “S-equival”, “Alexander module” and “infinite cyclic” occur nowhere in it. Its Layer 11 states Moise's triangulation existence (line 883) and keeps “smoothable” as a separate predicate (903); no relative three-dimensional smoothing theorem. The sections cited exist only at the head of GeometricTopology's open revision (`rev/903/…/README.md:1315` §4.3, 1371 §4.3.1 constructing `finiteQuadraticArf`, 1653 §4.4, 5490 §11.2 with Moise–Munkres), and a pull request that revises an existing roadmap is never a supplier: this is exactly why the first review had these declared as gaps, and why TangentialBordism's head (`rev/942/…/README.md:154`–172, 191–211, repaired on 2026-10-31) now declares `gap:finite-quadratic-arf` on GeometricTopology Layer 4.3.1 instead of owning `finiteQuadraticArf` at its 1.1. Neither the dependency check (“0 problem(s)”, it reads roadmap names only) nor `roadmaps resolve` (it resolves against open heads, where #903 has the sections) can see this. No roadmap on main owns any of the four objects: QuadraticFormInvariants excludes the characteristic-two Arf theory (its `README.md:177`), and MorseNovikov N6 (`README.md:555`–558) has only the Seifert-matrix Alexander-module presentation.

**Repair:** Restore the declared-gap form for everything consumed from GeometricTopology's revision, one slug each, in the supplier contracts, and name the slug at every use:

1. `gap:oriented-linking-number`, `gap:seifert-matrix-s-equivalence` and `gap:alexander-module-presentation`: reinstate the three paragraphs of the previous head (`556ef72`, `README.md:324`–361) verbatim with “What GeometricTopology must provide (gap:…)” as their opening, and change “GeometricTopology 4.3” / “4.4” back to the slugs at 458, 476, 551, 631, 733, 1552, 1573, 1585 and 1602. The previous review's R02 (narrow the Alexander-module gap to Crowell's comparison and cite MorseNovikov N6 for the presentation) can be applied at the same time.
2. `gap:finite-quadratic-arf`: add “What GeometricTopology must provide (gap:finite-quadratic-arf): …” with the sentence TangentialBordism's head uses (symplectic-basis Arf of a nonsingular F₂ quadratic form, basis independence, isometry invariance, orthogonal-sum additivity, hyperbolic/anisotropic classification, Gauss sum, and Arf 0 iff a q-zero Lagrangian), and cite the slug at 505, 523, 1871 and 2010.
3. The knot and proper-link Arf invariant: either restore §1.4's own definition as at `556ef72` (`README.md:493`–523: the Seifert refinement q(x)=V(x,x) mod 2, descent on the polar radical for proper links, independence through S-equivalence, Levine's congruence), evaluating Arf through `gap:finite-quadratic-arf`, or declare `gap:knot-arf-invariant` with one `needs` sentence saying exactly that; in both cases keep the new T(2,4) and reversal Checks (they are correct, see the table).
4. The three-manifold smoothing: either declare `gap:three-manifold-smoothing` (every topological three-manifold has a smooth structure, unique up to diffeomorphism, relative to a neighbourhood of a closed set where one is given; Moise, Munkres) and cite it at 556, or restrict §1.4's slice-disc comparison to smooth slice discs and move the locally flat branch to §3.6 (see R02).

Add the new slugs to the package plan's `gaps` list. Tested on the instance that refutes nothing: the trefoil (Δ(−1)=−3, Arf 1), 6₁ (Δ(−1)=9, Arf 0) and the T(2,4) Checks at 531–549 are unchanged by the relabelling, so no mathematics moves.

## R02 (P3) — The slice-disc comparison placed in §1.4 needs §3.2 and §3.5, so Layer 1 depends on Layer 3 while §3.6 and §3.7 depend on §1.4

**Location:** `TauCetiRoadmap/FourManifolds/README.md:512`–527 (“Own the geometric slice-disc comparison here … For a locally flat disc use the early TOP normal-data comparison and smooth W intrinsically …”) and the `*Needs:*` line at 551–558 (“§3.2 and §3.5's independent local surface and membrane constructions; GeometricTopology Layer 11's …”).

**Claim:** §1.4 is a Layer 1 target.

**Witness:** Its `*Needs:*` line lists §3.2 and §3.5 (Layer 3), while §3.6's `*Needs:*` (1600) lists “§1.4's Arf invariant and framed-link handlebodies” and §3.7's (1713) “§1.4 and §1.6's framed-link handlebodies, Kirby moves and Arf invariant”. Layer 1's Dependencies paragraph (630–638) says only that “F3's caps are used only in the later topological applications”. The handlebody and Kirby-move part of §1.4 needs none of Layer 3, and nothing in Layers 2–3 consumes the slice-disc comparison (the slice theorem of §3.6 goes the other way).

**Repair:** Keep the smooth slice-disc comparison in §1.4 with its own `*Needs:*` line (GeometricTopology Layer 4 Seifert surfaces, AlgebraicTopology Stage 6 relative duality, TangentialBordism B3.2(b)–(c)), and move the locally flat branch, which needs §3.5's normal-bundle theorem and the smoothing of W, to §3.6 next to the normal-filling theorem; or give the slice-disc comparison its own paragraph label so that §1.4's handlebody `*Needs:*` (475–477) is not blocked behind Layer 3. The genus-one trefoil instance (dim U = g(F) = 1, q|U = 0 impossible since all three nonzero classes have q = 1, so the trefoil is not slice) is unaffected.

## R03 (P3) — The pinned parameter-projection declarations are still cited under a namespace that does not exist at the pin

**Location:** `TauCetiRoadmap/FourManifolds/README.md:158`–163, 2302–2306 and 2329 (“`ContinuousLinearMap.parameterProj` … `ContinuousLinearMap.isFredholm_parameterProj`, `ContinuousLinearMap.index_parameterProj` … `ContinuousLinearMap.parameterProj_surjective_iff`”).

**Claim:** These are declarations of the `ContinuousLinearMap` namespace. Carried from the previous review's R01, unrepaired.

**Witness:** `TauCeti/Analysis/Fredholm/Parametric.lean:109` opens `namespace TauCeti`; my scratch probe elaborates `#check @TauCeti.parameterProj` (type `(D₁ : E →L[𝕜] F) → (D₂ : Λ →L[𝕜] F) → ↥(D₁.coprod D₂).ker →L[𝕜] Λ`) and `@TauCeti.isFredholm_parameterProj` (`D₁.IsFredholm → (TauCeti.parameterProj D₁ D₂).IsFredholm`, with `CompleteSpace E`, `CompleteSpace Λ`), and reports `Unknown constant ContinuousLinearMap.parameterProj`.

**Repair:** Replace the prefix `ContinuousLinearMap.` by `TauCeti.` in the four names at the three places; the statements attributed to them agree with the elaborated types.

## R04 (P3) — Typography: joined tokens, now also in the new §1.4 text

**Location:** `TauCetiRoadmap/FourManifolds/README.md:470` (“pp.139–153”), 503 (“mod2”), 509 (“Arf0 and5 mod8”), 510 (“mod8”), 539 (“number1”), 543 (“Arf1”), 545 (“from+2 to−2”), 547 (“dimension0, so Arf0”), 548 (“1 mod2”), 1076 (“a1-complex”), 1094 (“small,1-connected”), 1122 (“a2-complex”), 1243 (“FQ8.17's5-connectivity”), 1522, 1614, 1622 (“1 orℤ”, “1 andℤ”), 1530 (“targetℤ”), 1534 (“groupℤ”), 1548 (“F2” where the file writes F₂ elsewhere), 1750 (“framing+2”), 1803 (“pair(−1,−1)”), 2400 (“kernelℂ³”).

**Claim:** House style is readable prose with Unicode mathematics. The previous review's R03 list is unrepaired and the new §1.4 text adds nine more.

**Witness:** Each span is a dropped space or an ASCII subscript.

**Repair:** Insert the spaces and write F₂.

## Verified sound

:robot: Independent AI review. I read the whole README (3054 lines) and `Suggested.lean` (157 lines, byte-identical to the head of the third review) at `f1e8fde`, checked the previous review's three findings first, then reviewed every section. I changed nothing in the pull-request worktree. The diff outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FourManifolds'`) is empty; `metadata.toml` is unchanged. The worker's gate passes every check (`gate.md`: 25 scanners at 0, `OK`); my own `lake env lean` of `Suggested.lean` succeeds in seven seconds with exactly the six `sorry` warnings at lines 68, 77, 96, 120, 134 and 143.

The dependency command returned exactly:

```text
depcheck: 204 roadmaps, 1403 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. It reads roadmap names, and GeometricTopology is on main and earlier, so R01 is invisible to it.

**Previous findings.** R01 (`ContinuousLinearMap.` namespace): not repaired, carried as R03 above. R02 (`gap:alexander-module-presentation` overlaps MorseNovikov N6): the gap was deleted rather than narrowed and replaced by a citation of GeometricTopology §4.4, which is R01 above; the N6 overlap is moot until the gap is restored. R03 (typography): not repaired, carried as R04 with the new spans. No repair report marked any finding not actionable.

**Change set.** The 175 changed lines are confined to the Scope paragraph, the supplier table, the “What GeometricTopology must provide” preamble and three gap paragraphs, §1.4 (Kirby-move text, the Arf paragraph, the slice-disc comparison, the Checks and `*Needs:*`), Layer 1 Dependencies, §2.3's `*Needs:*`, §3.6's three consumptions of the knot gaps, §4.2's Arf evaluation and Layer 4 Dependencies. The new §1.4 mathematics is correct (table rows below); the defect is ownership.

**Signatures.** The worker's `signatures.md` lists the thirteen declarations with no lost binder (the file has no `variable` block); each elaborated type equals the README statement, as recorded in the previous review and unchanged. My scratch probe re-elaborated the six sorried theorems with one tactic each on a copy of the file: `simp` with `AnnulusConjecture` and `CoboundAnnulus` unfolded leaves the full quantified goal (unsolved goals); `infer_instance` on it fails (“type class instance expected”); `simp` with `FreedmanSliceTheorem` unfolded leaves `∀ K, HasPerfectCommutatorSubgroup K → IsTopologicallySlice K`; `simp` on the quartic derivative makes no progress; the Enriques Jacobian and fixed-point goals survive unfolding; `exact` with standard ℝ⁴ and `Homeomorph.refl` fails on the `IsEmpty (Diffeomorph …)` component. The positive control `¬ IsEmpty (Diffeomorph … ℝ⁴ ℝ⁴ ⊤)` compiled by `Diffeomorph.refl`. Nothing is padding.

**Headlines.** The README's headline theorems are the four-dimensional annulus theorem, Freedman's slice theorem, Freedman's classification, Donaldson's theorem, Rokhlin's theorem, `E(2) ≅ K3`, the exotic ℝ⁴ and the nonrecognition theorem. The two statable at the pins are stated as `annulusTheorem_four : TauCeti.AnnulusConjecture 3` and `freedmanSliceTheorem : TauCeti.FreedmanSliceTheorem`; neither is proved at the pin (`TauCeti/Geometry/Manifold/LocallyFlat/Annulus.lean`, `TauCeti/KnotTheory/Slice/Freedman.lean`). The module docstring (20–52) names each of the others with the carrier it lacks. The Layer 7 smoothness, freeness and exotic-space statements are genuine theorems about the explicit models.

**Declared gaps.** The README now states ten gap contracts (top-manifold-cw-type, tangent-microbundle-stable-classifier, brown-schoenflies, torus-trick-immersion, relative-pl-five, low-codimension-normal-bundles, marin-stable-transversality, spherical-classifier-g-top, laurent-l-group-splitting, controlled-k-whitehead-spectrum), each precise, minimal against main and the open heads (checked as in the previous review: no Schoenflies, torus trick, microbundle, Kister, Marin, Shaneson or Whitehead spectrum on main) and named at every use. The three knot gaps and the finite Arf algebra, which should be the eleventh to fourteenth, are R01. No `design/plan.json` is readable, so slugs could not be cross-checked against a plan.

**Adversarial table.** One row per statement; values computed on both sides this round (the `python3 -I` script with exact fractions is in my scratch directory).

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| Conventions: signed signature | S²×S²; −CP² | inertia (1,0,1) gives 1−1=0; (0,0,1) gives −1 | pass |
| Conventions: torsion quotient | S⁴; Enriques | rank 0, empty determinant 1; rank 10, 2t=0 pairs to 0 in ℤ | pass |
| §1.1 CP² ring, product | line; S²×S² | h²[CP²]=1, h³=0; a²=b²=0, a·b=1, det `[[0,1],[1,0]]`=−1 | pass |
| §1.2 twisted bundle | S,F; H=S+F, E=S | S²=−1, F²=0, S·F=1; H²=−1+2=1, H·E=0, E²=−1: diag(1,−1); (F,S) basis keeps off-diagonal 1 | pass |
| §1.3 sums | CP²#−CP²; CP²#CP²; M#S⁴ | σ=0, χ=4; σ=2; Δχ=0 | pass |
| §1.4 matrices | 0-, +1-unknot; Hopf | [0], [1]; H, det −1 | pass |
| §1.4 slide | diag(0,1), P=`[[1,0],[1,1]]`; P=`[[1,1],[0,1]]` | PᵀQP=`[[1,1],[1,1]]`, det 0; diag(0,1) | pass |
| §1.4 blow-up (new) | empty link + unlinked +1-unknot | D⁴ ♮ (CP²∖B⁴) = D⁴#CP² = CP²∖B⁴: H₂=ℤ, form [1], boundary S³#S³=S³; H₂ differs from D⁴, so not diffeomorphic | pass |
| §1.4 Arf congruence (new wording) | unknot; trefoil; 4₁; 6₁; 5₁; 5₂ | Δ(−1)=1−4Σ_{i odd}a_i ≡ 1 mod 4: 1, −3≡5, 5, 9≡1, 5, −7≡1 mod 8 → Arf 0,1,1,0,1,0; \|Δ(−1)\| mod 8 = 1,3,5,1,5,7 so “d≡±1” exactly for Arf 0; pinned trefoil `!![-1,1;0,-1]` (`Alexander.lean:562`) | pass |
| §1.4 Hopf annulus | V=[1] | q(core)=1 on the radical, lk 1 odd, not proper | pass |
| §1.4 T(2,4) (new) | V=`[[−1,1,0],[0,−1,1],[0,0,−1]]` | V−Vᵀ=`[[0,1,0],[−1,0,1],[0,−1,0]]`, radical over F₂ = ⟨e₁+e₃⟩, q(e₁+e₃)=−2≡0; quotient classes have q=1,1,1: anisotropic, Arf 1; det(V+Vᵀ)=−4, \|det\|=4=det T(2,4) | pass |
| §1.4 T(2,4) Jones (new) | V=−t^{3/2}−t^{7/2}+t^{9/2}−t^{11/2} (skein from Hopf and trefoil) | at t=1: −2=(−2)^{c−1}; at u=e^{iπ/4}: −u³−u⁷+u⁹−u¹¹=√2; Murakami (−√2)(−1)^{Arf}=√2 ⇒ Arf 1 | pass |
| §1.4 reversal (new) | one component reversed | lk +2→−2; annulus V=[±2], q(core)=0, quotient 0-dimensional, Arf 0; Jones factor t^{−3·2} at t=i is i^{−6}=−1; Arf change 1 = lk/2 mod 2 | pass |
| §1.4 slice-disc kernel (new) | genus g Seifert surface; trefoil | F̂ closed of genus g, dim H₁(F̂;F₂)=2g, kernel of H₁(F̂)→H₁(W) has dim g; trefoil: g=1 but all three nonzero classes have q=1, no q-zero line, consistent with Arf 1 and non-sliceness | pass; placement R02 |
| §1.5 boundary | [0]; [2]; [1] | ker, coker: ℤ,ℤ; 0, ℤ/2; 0,0 | pass |
| §1.6 realization, E₈ | framings 1,2 linking 1; Cartan | `[[1,1],[1,2]]` det 1; leading minors 2,3,4,5,6,7,8,1 | pass |
| §2.1–2.2 | r=0,1,2; Q=`[[1,1],[1,2]]` | π₃ rank 0,1,3; C=Q⁻¹=`[[2,−1],[−1,1]]`, QC=I | pass |
| §2.4 isotropic splitting | H; diag(1,−1); diag(1,−2) | (1,0)²=0; (1,1)²=0; x²=2y² has no nonzero integral solution; GS 1.2.25 at `gompfstipsicz` line 728 | pass |
| §3.1 order | §3.2→§3.6 | each subsection's `*Needs:*` names only earlier ones except §1.4's new line (R02) | pass |
| §3.2 λ(f,f) | one ± double point, e=0 | µ=±1, λ=±2; `powellrayteichner` line 290: λ(f,f)=µ+µ̄+e·1; Thm A lines 87–90; Def 3.2 line 481 | pass |
| §3.2 FQ 2.9.1; KQ | locators | `freedmanquinn` 1496: poly-(finite or cyclic), height ≥3; `krushkalquinn` 60: height ≥2, subexponential | pass |
| §3.3 controls | 1/4 against 1/2, 1/8, strict 1/4 | pass, fail, fail; S¹→point winding 1 | pass |
| §3.4 Theorems 7.5–7.6 | locators | `freedmanquinn` 3854, 3906: (δ,1)-connected δ-h-cobordism, simplicial NDR with good local groups | pass |
| §3.4 coefficients | 1, ℤ | Wh 0 (BHS line 101), K̃₀(ℤ)=0 (PID), K̃₀(ℤ[ℤ])=0 (GAK §10.12a), K₋ᵢ=0 (§10.13); L₅(ℤ)=0, L₅(ℤ[ℤ])=ℤ | pass |
| §3.5 8.2, 9.6, §9.12, §7.8 | locators | `freedmanquinn` 4064, 4983, 5879–5881, 4041–4043 | pass |
| §3.6 surgery sequence, 11.11, Crowell | locators | `freedmanquinn` 7469, 7884–7886 (perfect kernel iff Δ=1), 7925–7927 | pass |
| §3.6 Ω₃^Spin(S¹) | suspension | Ω̃₃(S¹)≅Ω₂(pt)=ℤ/2, Ω₃^Spin=0; TB head 8.1–8.3 (B3.2(b), B3.2(c), B3.3) at `rev/942/…:1840`, 1867, 1894 | pass |
| §3.7 realization | 0, H, E₈, 2E₈, [1] | KS 0,0,1,0; odd admits both; FQ 10.10 line 6416 (k≡σ/8 only for even λ) | pass |
| §4.2 formula | CP² line; E₈; 2E₈; Bastl 5.3 | (1−1)/8+0=0; 1; 0; `bastletal` 427–429: ks=Arf+(λ(c,c)−σ)/8 | pass; Arf owner R01 |
| §4.2 even implies Spin | H₁ without 2-torsion; Enriques | Ext(H₁,ℤ/2)=0 so H²(ℤ/2)→Hom(H₂,ℤ/2) injective; Enriques even form, w₂≠0 | pass |
| §4.3 Pontryagin square | CP²; S²×S² | P(h̄)=1; P(a+b)=2 with j(1)=2 | pass |
| §5 energy, scaling | S⁴; g↦λ²g | E=8π²k+2‖F⁺‖²; E scales λ^{n−4} | pass |
| §5.1 index | S⁴; S²×S²; Q₈ on Σ₂×Σ₂ | −3=0−3−0; −6=0−3−3 (full H²=6 gives −9); 6−0−12=−6=−3(1−8+9) | pass |
| §5.1 Kuranishi | FL §3.1 | `feehanleness` 666–668, κ(0)=0, Dκ(0)=0 | pass |
| §5.2 budget | N=5, s=3 | q=6, ℓ≥10; pinned `isMeagre_image_criticalPoints_of_isFredholm` threshold (dim ker)²+1 | pass; naming R03 |
| §5.3 gluing, Donaldson | FL Thm 3; Q=−I_r | `feehanleness` 275–277: any closed connected oriented smooth four-manifold, compact G; r pairs ±eᵢ, σ+r=0 | pass |
| §6.1 blowup | CP²; nine times | χ=4, σ=0; χ=12, σ=−8, (3H−ΣE)²=0 | pass |
| §6.3 SL₂ | A,B,S | SAS⁻¹=`[[1,0],[−1,1]]`=B; AB=`[[0,1],[−1,1]]`; (AB)³=−I; (AB)⁶=I | pass |
| §7.1 indices | K3; reversed | −(−16)/8=2, −(−16)/16=1; −2, −1 | pass |
| §7.2 E(n) | n=1,2,3 | (12,−8,10), (24,−16,22), (36,−24,34) | pass |
| §7.3 Enriques Check | v=(i,√3,i√3,1,0,0); t=(1,2,3),(4,5,6) | squares (−1,3,−3,1,0,0), all three quadrics 0; minor of columns 0,1,2 = −48; Vandermonde determinants 2, 2 | pass |
| §8.1 nonrecognition | Tancer; GS 1.2.33 | `tancer` 73–76 (deficiency 9), 131–133; `gompfstipsicz` 838 | pass |
| §8.2 bound, KS | Q=Q′=[1]; ±1 unknot | v²≤1, solutions ±1; `bastletal` 598–600; KS=(1−1)/8+0=0 | pass |
| §8.3 headline | standard ℝ⁴ | `Diffeomorph.refl` refutes IsEmpty (probe compiled); K3 minus 3H = 2(−E₈), even, ≠ −I₁₆ | pass |

That is 44 rows. No instance refuted a stated theorem; the blocking finding is ownership, not mathematics.

**Pinned declarations opened** (Tau Ceti and Mathlib at the manifest pins): `TauCeti.AnnulusConjecture`, `CoboundAnnulus` (`TauCeti/Geometry/Manifold/LocallyFlat/Annulus.lean`), `TauCeti.FreedmanSliceTheorem` (`TauCeti/KnotTheory/Slice/Freedman.lean`), `TauCeti.KnotTheory.trefoilSeifertMatrix` and `figureEightSeifertMatrix` (`TauCeti/KnotTheory/Alexander.lean:562`, 579), `TauCeti.parameterProj`, `isFredholm_parameterProj` (elaborated in the probe; `TauCeti/Analysis/Fredholm/Parametric.lean:109` namespace), `ContinuousLinearMap.parameterProj` (unknown constant), `Projectivization.map`, `submodule`, `IsManifold`, `Diffeomorph` (elaborated in `Suggested.lean`). The remaining declarations named in the supplier contracts were opened in the previous review and the file is unchanged.

**Cross-roadmap citations resolved** (main unless stated): GeometricTopology on main Layers 1, 2, 4, 5 and comparison item 3 (177, 289, 409, 519, 930) exist; its §4.3, §4.3.1, §4.4 and a Layer 11 smoothing comparison do not (R01); MorseNovikov N6 (555–558); QuadraticFormInvariants scope exclusion (177); TangentialBordism head (`rev/942`, 2026-10-31) 1.1 now a gap on GeometricTopology 4.3.1 (154–211), B3.2(b) 1840, B3.2(c) 1867, B3.3 1894; GeometricTopology's open revision (`rev/903`) §4.3 1315, §4.3.1 1371, §4.4 1653, §11.2 5490 (the content FourManifolds attributes to them is there, but it is not a supplier); GeneralAlgebraicKTheory §10.3/§10.5/§10.12a/§10.13, AlgebraicKTheory A2, HomotopySpheres, IndexTheory, StringOrientation, SmoothBundlesConnections, PseudodifferentialOperators and HeegaardFloer F0 as in the previous review (unchanged text).

**Ownership against open work.** `AnnulusConjecture` and `FreedmanSliceTheorem` are declared only here and in GeometricTopology's revision (#903), which states them as targets and consumes nothing from here. The finite F₂ Arf algebra has no owner on main (QuadraticFormInvariants excludes it; TangentialBordism's head declares a gap for it); the knot Arf invariant, linking number, S-equivalence and Alexander module exist only in #903's Layer 4 and partly in MorseNovikov N6. No second `Suggested.lean` declares any of the twelve fully qualified names. The board's packages index lists no competing package.

**Sources read at their locators this round:** `freedmanquinn` 2.9.1, 7.5, 7.6, §7.8, 8.2, 9.6, §9.12, 10.10, 11.5, 11.11, §11.9; `powellrayteichner` Theorem A, (1.1), Definition 3.2; `krushkalquinn` p. 408; `feehanleness` Theorem 3, §3.1; `bastletal` Theorem 5.3, Lemma 6.5; `tancer` Theorems 1–2, Proposition 5; `gompfstipsicz` 1.2.25, 1.2.33. The §1.4 Arf statements were checked by computation (table) since their sources (Lickorish, Robertello) are not in the cache.

## Not verifiable

- **Gompf–Stipsicz §5.1 (pp. 139–153), §2.2, §8.2, §3.1:** the only legal text is the AMS preview, which ends at printed p. 36; the Kirby moves and blow-up laws are checked by instance (blow-up row) and cited by locator.
- **Lickorish Chapters 1, 6, 8, 10; Rolfsen Chapter 7; Robertello 1965; Freedman–Kirby 1978; Kirby LNM 1374 Chapter XI; Moise; Munkres:** not in the cache; the §1.4 Arf, linking, S-equivalence, Alexander-module and smoothing statements are checked against the standard statements and by the computed instances only.
- **Kirby–Siebenmann Essays, Kirby 1969, Marin, Kister, Shaneson, Madsen–Milgram, Hirsch–Mazur, Cerf, Bass 1968, Quinn 1979/1982/1988, Browder, Lees, Lashof, Serre, Hanner, Edwards–Kirby, Freedman 1982, Donaldson 1983, Gompf 1983:** image-only scans, landing pages or absent from the cache, as recorded in the previous review; unchanged text, cited by locator.
- No `design/plan.json` is readable for this pull request, so the gap slugs could not be cross-checked against a plan.
- The global shrinking, controlled-product, obstruction-gluing and continuation arguments are not proved by the instance table; the table checks their stated values and hypotheses.

## Source issues

- **Misprint** in tancer at Proposition 5(iii), printed p. 3: the source calls H₂ of the boundary a free product of 2k copies of ℤ; it should say free abelian group of rank 2k; affects a stated result.
- **Gap** in freedmanquinn at Theorem 8.17, printed p. 134: the source attributes the i = 5 vanishing to a reference whose replacement criterion is not justified; it should cite the stable pseudo-isotopy route of Gabai–Gay–Hartman–Krushkal–Powell, Theorem 1.1; affects the proof; corrected in print at arXiv 2311.11196, Theorem 1.1.
