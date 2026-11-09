# Review of SchubertGeometry (pull request #1224 at 25ea793)

**Verdict:** needs changes

This is a full review of the same head the previous review read: `TauCetiRoadmap/SchubertGeometry/README.md` (1924 lines) and `Suggested.lean` (46 lines). No file outside the folder changed. Nothing changed since the previous review.

## R01 (P2) — The branch still builds at Tau Ceti a91d3aa: README and Lean describe different pins, and the S4 headlines stay unstated

Carried from the previous review's R01. It is not repaired: the head is unchanged.

**Location:** `Suggested.lean:7–8`: “None of the following headlines is statable at the pins this folder's manifest fixes, so nothing is stated”. `README.md:3`: “The finite-type Lakshmibai–Seshadri path engine is consumed from the pinned Tau Ceti”.

**Claim:** The README's From Tau Ceti contract (lines 75–336) and S3.3–S4.7 cite native declarations as present at the pin. `Suggested.lean` says the manifest's pin has none of them. Both statements cannot hold at one pin. The pull request does not touch `lake-manifest.json`. After the merge, the folder builds at main's Tau Ceti `2fd255d`. Every S4 carrier exists there, so the S4.2, S4.3 and S4.4 headlines are statable but absent.

**Witness:** All 163 backticked library names in the README exist at `2fd255d` (with Mathlib `1b1ccf4b`). At `a91d3aa`, 124 are absent, among them every `TauCeti.LSPath.*`, `TauCeti.PLPath.*`, `TauCeti.NormalCrystal.*` and `RootPairing.demazureOperator*` name. `git merge-tree --write-tree origin/main HEAD` exits 0.

**Repair:** This needs a merge, which the worker or a human must do; a README or Lean round cannot move the pin.

1. Merge origin/main into the branch; it is conflict-free. Afterwards the manifest pins Tau Ceti `2fd255d`.
2. Restore `Suggested.lean` from c339e23c (`git checkout c339e23c -- TauCetiRoadmap/SchubertGeometry/Suggested.lean`). That file states `exists_toPLPath_eq_of_lower_eq_some`, `exists_toPLPath_eq_of_raise_eq_some`, `reflTransGen_lower_toPLPath_straight` and `weylDenominator_mul_finsum_single_eq_dotAlternatization`.
3. Change one clause of that file's docstring. Its S1 item ends “the native Grassmannian is a module carrier”, which is false at `2fd255d`: `Module.Grassmannian.scheme` is at `TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean:161`. Write instead that the Grassmannian scheme is native but the relative parabolic and flag schemes are not.
4. Retest: `lake env lean` on the file should give only `sorry` warnings, and the gate's `imports` and `build` checks should be 0.

## R02 (P3) — At main's Tau Ceti pin, S1.1, S1.3 and S1.5 restate or ignore native declarations

**Location:** S1.3, `README.md:544`: “The increasing basis flag has dim(V∩F_j)=#{i:p_i≤j}; cell dimension is Σ_i(p_i−i). For the rectangle partition λ_i=N−r+i−p_i, this is r(N−r)−|λ|.” S1.5, line 576: “construct the isotropic Grassmannian as the universal zero locus of the restricted form on the tautological bundle”. Lines 64–69 and 340 cite only Mathlib's `Module.Grassmannian` and ModularCurves §0G.

**Claim:** R01's repair moves the folder to `2fd255d`. There, three of these targets are already native, and the supplier contracts do not name them:

- S1.3's pivot, cell-dimension and partition statements are proved, in the same zero-based `Fin n` convention.
- S1.1's ambient Grassmannian exists as a scheme, with a universal property on affine points and properness.
- S1.5's zero-locus ideal is native. So is the extension of a Lagrangian basis to a symplectic basis, which is the transitivity input. Neither is cited.

**Witness:** At `2fd255d`:

- `TauCeti/LinearAlgebra/Basis/Flag.lean`: `Module.Basis.flagPivots` (:137), `Module.Basis.finrank_inf_flag` (:215), `StrictMono.card_echelonFreeEntries_image` (:94).
- `TauCeti/Data/Fin/StrictMono.lean:111`: `sum_sub_add_sum_sub_eq_mul`.
- `TauCeti/AlgebraicGeometry/Grassmannian/Points.lean:405`: `Module.Grassmannian.schemeHomEquiv`.
- `TauCeti/RingTheory/Grassmannian/Isotropic.lean:81`: `isotropicLocus`.
- `TauCeti/LinearAlgebra/BilinearForm/LagrangianBasis.lean:131`: `IsAlt.exists_basis_toMatrix_eq_J_inl_eq`.

None of these is at `a91d3aa`.

**Repair:**

- **From Tau Ceti:** name these declarations, with their files.
- **S1.3:** cite `Module.Basis.flagPivots`, `Module.Basis.finrank_inf_flag`, `StrictMono.card_echelonFreeEntries_image` and `StrictMono.sum_sub_add_sum_sub_eq_mul`. Keep as targets only what is new: the quotient-rank conversion, the scheme-level comparison and the N≤1 cases. The native file states that it does not construct cells as schemes.
- **S1.1:** take the ambient Grassmannians from `Module.Grassmannian.scheme`, `Module.Grassmannian.schemeHomEquiv` and `Module.Grassmannian.isProper_toSpec`. ModularCurves §0G stays the planning owner.
- **S1.5:**
  - Build the isotropic Grassmannian on `Module.Grassmannian.isotropicLocus` and `Module.Grassmannian.isotropicLocus_le_ker_iff`.
  - Take Lagrangian transitivity from `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J_inl_eq`. Its convention is Mathlib's `Matrix.J`, with B(f_i,e_j)=δ_ij.
  - Take the rank bound from Mathlib's `LinearMap.BilinForm.finrank_add_finrank_orthogonal`.
  - Keep the parabolics P_r for r<m and their factorization as targets.
- **Tested:** in Gr(2,4), pivots (1,3) give one native echelon free entry, the same as the README's dimension 1 and partition λ=(2,1).

## R03 (P3) — Four sampled targets have no usable source locator

**Location:**

- S5.6 (lines 1201–1221): its *Needs:* line ends “The integral section comparison is the smooth-source cohomology argument above.” No source is cited for the integral comparison, global F-regularity, Cohen–Macaulayness or Richardson intersections.
- S6.2 (1294–1298): no source.
- S9.8 (1668–1692): no source.
- S3.1 (line 801): “The rank-one sign agrees with BrionFlags §1.4 after opposition”.

**Claim:** Each theorem needs a locator, or an explicit statement that it is a deduction from named inputs. For S3.1, a bare section number is ambiguous: §1.4 contradicts itself on exactly this sign (see Source issues).

**Witness:**

- BrionFlags line 593 defines the B⁺-action b(g,t)=(gb⁻¹,λ(b)t). Read literally, GL₂ with λ=(1,0) then has no sections. Proposition 1.4.3 (line 638) instead gives degree λ_i−λ_j.
- Ramanathan1987, lines 960–970 and 1042–1045, carries S5.6's integral route and Cohen–Macaulayness.

**Repair:**

- **S5.6:** cite
  - Ramanathan1987, proof of Theorem 3.11, p. 86 (lines 960–970), for the free-ℤ-model and mod-p-surjectivity route;
  - Theorem 4.2(i)–(ii), p. 88 (lines 1042–1045), for Cohen–Macaulayness in every characteristic;
  - BrionFlags §1.3, p. 12 (lines 469–477) and Proposition 1.3.2, for the proper standard/opposite intersection over ℂ;
  - the primary source for global F-regularity of Schubert varieties, by theorem number, requested through the sources service.
- **S6.2:** cite CFL §1.1, p. 1 (lines 26–32) for the Plücker standard basis and straightening, and LLM Theorem 4, p. 299 (line 263) for the Schubert restriction basis.
- **S9.8:** state that it is a deduction from S9.0's coherent analytification (SGA1 Exposé XII, Proposition 1.3.1, p. 241, line 9479) and S3.1.
- **S3.1:** cite BrionFlags Proposition 1.4.3, p. 16 (lines 636–639). Under the Chevalley involution, Brion's L_λ on G/B⁺ is this roadmap's L(λ) on G/B⁻, with the degree preserved.
- **Tested:** for GL₂ and λ=(1,0), sections of the README's L(λ) are spanned by row 1 of g⁻¹. That is 2 sections, degree +1=λ₁−λ₂, Brion's Proposition 1.4.3 value.

## R04 (P3) — Undefined roadmap abbreviations, two of which carry ownership deferrals

**Location:**

- Line 1374: “the transverse complex Grassmannian point-count comparison of TPC remains at its existing owner”, and “AVB's proposed general Betti cycle-class programme”.
- Line 1469: “the ordinary TPC puzzle theorem”.
- Line 1296: “GG's”.
- Lines 729 and 1652: “TopK”.
- Line 1654: “HR R2a”.
- Line 1824: “the exact RG owner”.

**Claim:** These names are neither standard nor defined. “TPC” appears only in these two places, and its two deferrals are missing from Scope and ownership (lines 7–50). A deferral must name the roadmap and the section.

**Witness:** On main:

- TensorProductCombinatorics §6.3 (line 1777) owns generic incidence counting, and its Layer 6 (line 1707) owns the puzzle rule.
- AlgebraicVectorBundles §3 (line 429) proposes the Betti cycle-class programme.
- None of these sections cites SchubertGeometry back.

**Repair:**

- Spell each one out: TensorProductCombinatorics §6.3 and Layer 6, GroebnerGeometry G5, AlgebraicVectorBundles §3, TopologicalKTheory T1.5, HamiltonianReduction R2a, ReductiveGroups Layer 10.
- Add to Scope and ownership: “The transverse complex Grassmannian incidence count (TensorProductCombinatorics §6.3) and the puzzle rule (its Layer 6) are not targets here.”
- **Tested:** a scratch copy with exactly these edits gives `depcheck: 239 roadmaps, 2324 edges, 0 problem(s)`.

## R05 (P3) — Run-together words, a process phrase and a misplaced heading

**Location:**

- Missing spaces on 37 lines: 435, 544, 576, 622, 655, 713, 729, 885, 905, 906, 918, 919, 924–926, 930, 1045, 1151, 1191, 1207, 1280, 1296, 1358, 1374, 1591, 1648, 1652, 1654, 1704, 1762, 1763, 1780, 1782, 1783, 1785, 1786, 1794, 1802. Examples: “characteristicp”, “typeA”, “Rank0”, “word121”, “are46”, “dimension81”, “Layer8”, “Layers2/4”.
- Line 1823: “Compare the two zero-weight adjoint path indices without inventing unread diagram labels.”
- Line 1749: the `###` heading interrupts the Worked examples list.

**Claim:**

- “characteristicp” and “typeA” are not words.
- Line 1823 narrates the author's reading. It also sits inside the word-121 blowup bullet, where it does not belong.
- The heading at line 1749 puts the central-transport, SL₂, blowup and general-type bullets (1780–1824) under “The three-dimensional incidence flag”.

**Witness:** `grep -c` for these tokens returns 37. Line 1781 (central transport) is filed under the incidence-flag heading.

**Repair:**

- Insert the missing spaces: “characteristic p”, “type A”, “rank 0”, “word 121”, “are 46”.
- Move line 1823 to S4.4's adjoint Checks as “Compare the two zero-weight adjoint path indices using the positive simple-generator test and the all-root obstruction”.
- Make line 1749 a bold bullet like line 1705, or move bullets 1780–1824 above it.

## Previous findings

- R01 (previous review) — **not repaired.** `lake-manifest.json:8` still pins Tau Ceti `a91d3aa`. `Suggested.lean` still declares nothing, and its docstring (lines 7–8) still says no headline is statable at the manifest's pins. Carried as R01.
- R02 (previous review) — repaired in that round, and still true: `TauCeti.weylDenominator` is at `Denominator/Basic.lean:72` at `a91d3aa`, and that revision has no `Integral.lean`.

## Verified sound

**Gate, build and dependency direction.**

- My run of the gate on 25ea793 reports every check at 0 and `OK`. The worker's run also reports `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchubertGeometry'` is empty.
- `lake env lean` on `Suggested.lean`, from the worktree, first exited 0 with no output. A later run could not start because the worktree's `.lake/packages` link had become dangling. That is an environment problem, not a defect of the folder.
- Dependency check: `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. SchubertGeometry is on main (merged as #1116), so it is not in `ORDER.txt`.

**Suggested.lean form.** One module docstring, `import Mathlib` only, an empty `namespace TauCetiRoadmap.SchubertGeometry`. There is no `set_option`, no sorry'd data, and no declaration that a one-tactic probe or a `#check @name` comparison could test. The docstring's S3 and S4 clauses are true at `a91d3aa`: `Weyl/` has no `Demazure/`, `RepresentationTheory/` has no `LSPath/` or `Crystal/`, and `Denominator/` holds Basic, Identity and Reflection only. At c339e23c, `module` with `public import` is the form used by 12 roadmap files on main.

**Headline theorems.** The README's headlines are:

- operator stability (S4.2), generation (S4.3), the character identity and the tensor rule (S4.4);
- the Demazure and Weyl character formulas (S3.4);
- compatible splitting and dominant vanishing (S5.2, S5.5);
- all-degree standard monomials (S6.4);
- the Chevalley coefficient (S7.1);
- the flag K-ring presentation (S8.2–8.4);
- proper GAGA (S9.0).

At `a91d3aa` none is statable, and the docstring names each one with its missing carrier. At `2fd255d`, S4.2–S4.4 become statable (R01). The others still lack flag, Schubert, Bott–Samelson, K-ring or analytic carriers. I checked this at `2fd255d`: no file has a flag or Bott–Samelson scheme, a variety Frobenius splitting, a scheme K₀ or a complex analytic space. The tensor and component theorems need a crystal structure on `TauCeti.LSPath`. No file at `2fd255d` has one; `LSPath/StringLength.lean:28` mentions `NormalCrystal` only in a comment.

**Ownership against open pull requests.**

- **Re-planned targets, already settled.** ShimuraData (#1038) §3.8 `parabolicTypeVariety`, §3.14 and §3.15 `integralSchubertBaseChange` also plan Par_t(G), the integral Bruhat cells and the integral Schubert base change that S1.0 and S5.6 own. Likewise:
  - AlgebraicModuliForArithmeticGeometry (#853) §1.3 `flagBundle` duplicates S1.1;
  - ComplexComparisonPartII (#848) C-1.1, C0.4 and C1.9 duplicate S9.0.

  I probed a scratch copy with a `*Needs:*` line citing all three. It prints `UPWARD: SchubertGeometry (on main) -> AlgebraicModuliForArithmeticGeometry (#34)`, `-> ComplexComparisonPartII (#39)` and `-> ShimuraData (#116)`. So this roadmap, which is already on main, is the earlier owner, and its Scope and ownership (lines 27–32) says so. None of the three cites SchubertGeometry (0 matches each at its head), so the repair is a citation from those pull requests, not a change here.
- **Consistent with this roadmap.** SpringerResolutionAndCharacteristicCycles (#1828) cites SchubertGeometry S1 and S2.3 (its line 12). GeometricQuantization (#1186) consumes S9.1/S9.7; the deferral at line 41 to its §§3.3–3.4 matches that head's §3.3 (line 694). IndexTheory (#1077) has I8 at line 1575 for the Part II deferral at line 46.
- The worker's overlap list: no open pull request changes this roadmap, and no id is dropped in either direction.

**Cross-roadmap citations on main (34f48ff).** All of these resolve:

- ModularCurves §0G (line 901);
- ReductiveGroups Layers 7, 7b, 8, 9 and 10 (lines 627, 732, 1023, 1092, 1731);
- GroebnerGeometry G5 (394);
- SchemeAndStackFoundations Layers 1, 2 and 5, §2.2 (3309), §2.6 (3437, `projectiveSpace_cohomology`), §4.12 (5613) and §5.7 (6987);
- StableReduction Layer 2 (relative `Proj`, its line 323) and Layer 4 (Rees blowup, line 531);
- AlgebraicVectorBundles L2A (306);
- TopologicalKTheory T1.5 (finite Schubert characteristic maps, line 317);
- LieGroups Layer 8 (1078), ComplexKahlerGeometry K3–K4 (296, 444), RealAnalyticGeometry R3.2 (728);
- AlgebraicTopology Stage 5 (849), MorseTheory M2 (144), HamiltonianReduction R2a (157);
- ReflectionInvariantTheory §§1–3, CharacteristicClasses C5 (1344) and C5a, TensorProductCombinatorics §8.3 and Layer 6.

The five unresolved-citation leads (BrionFlags, KnutsonBottSamelson, KnutsonDemazure, SerreGAGA, KnutsonSymplectic) are manifest source ids, not roadmaps.

**Library declarations opened, at the pins.**

- Mathlib `Matrix.J` (`LinearAlgebra/SymplecticGroup.lean:59`, the block matrix [[0,−I],[I,0]]) and `SymplecticGroup.mem_iff'` (:186).
- `Module.Grassmannian` (`RingTheory/Grassmannian.lean:66`) and `Module.Basis.flag` (`LinearAlgebra/Basis/Flag.lean:40`).
- Tau Ceti `Scheme.Modules.Cohomology` (`AlgebraicGeometry/Cohomology/Basic.lean:61`), `LineBundle/Basic.lean:25–28`, `LSPath/Basic.lean:101,217,234,390`, `RootOperator.lean:662,671,749` and `Distinguished.lean:55`.
- `Crystal/Basic.lean:120,134,385,491,626`, `Component.lean:178`, `Tensor.lean:89`, `WeightTwist.lean:45,155`, `ChainProperty.lean:165` and `Concatenation.lean:116,133`.
- The R02 files listed above.

**Seeded sample.** Each locator was read at the text.

| Target | Locator checked | Result |
|---|---|---|
| S1.5 | no locator; LLM §1.5, p. 301 (lines 359–363) has the same antidiagonal form | R02 (native inputs) |
| S2.2 | LLM §1.4, pp. 300–301 (lines 294–305), Z_i=(P_i1×⋯×P_ir)/B^r with twisted action; KnutsonBottSamelson §1 p. 1 (lines 10–26), §2 pp. 1–2 (32–54), §5 p. 4 (152–165) | correct; the §5 order P_αn×_B⋯×_B P_α1 is reversed, which the README makes a target |
| S3.1 | BrionFlags §1.4 (line 593 against lines 613–639, 667–669) | R03 |
| S3.3 | KnutsonDemazure p. 3 (lines 85–98): d_αp=(p−α r_αp)/(1−α); the SL₂ case (lines 134–137) | matches Δ_i=ιD_iι |
| S3.5 | BrionFlags Proposition 1.4.1, p. 14 (549–552), Plücker immersion pp. 15, 17 (562–568, 653–654); Ramanathan1987 Remark 2.4, p. 73 (490), §3.1 simply connected (750), Theorem 3.5(ii), p. 82 (803), Theorem 3.11(i), p. 86 (950) | correct |
| S4.1 | Littelmann1995 §1 (line 137) | correct |
| S4.2 | Proposition 4.7 at line 502 (p. 511), continued on p. 512 (506–517); Remark 4.8 merges equal directions; Corollary 2 at line 520 | correct |
| S4.3 | Corollary 3 at line 524 (p. 512); CFL Definition 2.1 at line 188, §7.1 at lines 941–962: b(σ,σ′)=(σλ,β∨) for σ′=s_βσ covering σ | correct, same sign as b_λ(x,y)=⟨yλ,β∨⟩ |
| S4.4 | Theorem 6.3 at line 726 (p. 517), Theorem 7.1 at line 747 (p. 518), Theorem 9.1 at line 815 (p. 520) with ρ fixed at line 811, §10 at line 848 (p. 521) | correct |
| S4.7 | LLM Proposition 14 at line 809 (p. 312); §4.1 dual embedding at line 946 | the README's “at most w” is right; the source misprints it (Source issues) |
| S5.6 | none | R03 |
| S6.2 | none | R03 |
| S8.4 | Pittie1972 and Steinberg1975, uncertified; the PGL₂ counterexample computed below | correct |
| S9.1 | SGA1 XII Théorème 1.1 at line 9399 (p. 239), Proposition 1.3.1 at 9479 (p. 241), Théorème 4.2 at 9738 (p. 248), Corollaire 4.3 at 9801, Théorème 4.4 at 9805 (pp. 249–250); SerreGAGA §12, pp. 19–20 (lines 711–746), §§13–17, pp. 20–27 | correct |
| S9.8 | none | R03 |

ConradReductive's Theorem 2.3.6, Theorem 5.1.13 and Corollaries 5.2.8–5.2.9 are at lines 2993, 6011, 6512 and 6551, as cited.

**Adversarial table.** All values were computed this round.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| R01: pin | a91d3aa; 2fd255d | 124 of 163 names absent; 0 of 163 absent | R01 |
| R01: c339e23c S1 clause | 2fd255d | “module carrier” against `Grassmannian/Basic.lean:161` scheme | R01, step 3 |
| S1.0 cells | GL₃/𝔽₂; ℙ²; GL₂/ℤ | 168/8=21=1+2+2+4+4+8; 1+2+4=7; det(Lie B)*=ω⁻¹=O(2) | pass |
| S1.0 ℍ | adjoint group of ℍ over ℝ | Borel variety x²+y²+z²=0 has no real point | pass |
| S1.1 incidence | rank 3, ranks (1,2); k[ε] | 4 against 3; e₁+εe₃↦εē₃≠0 | pass |
| S1.3 pivots | Gr(2,4): (1,2), (1,3), (3,4) | Σ(p_i−i)=0, 1, 4; λ=(2,2),(2,1),(0,0) gives 4−|λ|=0, 1, 4; native free entries agree | pass; R02 |
| S1.5 Gram | Q_src, u_i=e_i, f_j=e_(2m+1−j) | Q[i,2m+1−j]=H_m[i,m+1−j]=δ_ij; blocks I_r, J₀, −I_r | pass |
| S1.5 u(Y,Z) symplectic | gᵀJg | entry (2,3) forces a=YᵀJ₀; entry (3,3) gives Zᵀ−Z+YᵀJ₀Y=0 | pass |
| S1.5 product and inverse | Y=(1,2), Y′=(3,4), Z=5, Z′=6 | YᵀJ₀Y′=4−6=−2, giving ((4,6),9); flipped sign gives 13; (Y,Z)(−Y,−Zᵀ)=(0,0) | pass |
| S1.5 conjugation | l=diag(A,D,A^−T) | (DYAᵀ, AZAᵀ); (1,2) block consistent since DᵀJ₀=J₀D⁻¹ | pass |
| S1.5 dimension | m=2: r=0, 1, 2 | dim Sp−dim P_r = r(r+1)/2+2rs = 0, 3, 3 = r(2m−r)−r(r−1)/2 | pass |
| S1.5 characteristic 2 | Z₀ = strict upper part of YᵀJ₀Y | Z₀−Z₀ᵀ=YᵀJ₀Y (zero diagonal), with no division by 2 | pass |
| S2.2 | empty word, i, ii | dimension 0/1/2; fixed sections 1/2/4 | pass |
| S2.3 Demazure product | Q=ii | δ=max(s_i,e)=s_i; sections go to e, s_i, s_i, e | pass |
| S2.4 longest element | A₂ | w₀α₁=−α₂ | pass |
| S2.5 kernel | SU₂×U₁→U₂ | zA=I forces z=±1: {(I,1),(−I,−1)} | pass |
| S3.1 sign | GL₂ λ=(1,0) on G/B⁻; Brion read literally | row 1 of g⁻¹ scales by b₁₁⁻¹: 2 sections, degree +1; literal Brion with B⁺ has no sections for (1,0) | pass; R03 |
| S3.1 forgetful map | torus flag | characters 0 and 1 give the same line with different actions | pass |
| S3.3 D_i strings | m=2, 0, −1, −3 | 3 terms, e^λ, 0, −(e^(λ+α)+e^(λ+2α)); augmentations 3, 1, 0, −2 = h⁰−h¹ of O(m) | pass |
| S3.3 Δ_i=ιD_iι | m=−2, 1, 3 | Σ_(j≤2)e^(λ+jα); 0; −(e^(λ−α)+e^(λ−2α)); s_i(N)=−e^(−α)N | pass |
| S3.3 source | SL₂, Knutson | d(t^−λ)=t^−λ+⋯+t^λ = Δ at m=−λ | pass |
| S3.5 | SL₂ L(1); λ=0; Frobenius twist | identity embedding of ℙ¹; a point; differential 0; ev_e has weight −λ | pass |
| S3.6 | the full computation by script | word 121: 1, 6, 33, 81; word 212: 1, 3, 21, 81, same final character; Δ₁χ₃=Δ₂χ₃=χ₃; 46 weights (21/15/10); formula exact on every weight; (4,4,4)→3, (9,3,0)→0; 81 Gelfand–Tsetlin patterns; D₁D₂D₁e^(7,5,0)=χ₃ | pass |
| S4.1 regression | φ(1/2)=1/4, χ=(1,1) | (3/4,1/2) has x−2y=−1/4; the canonical point (1,1/2) has 0; φ continuous with φ(1)=1 | pass |
| S4.2 stability | SL₂, shape 2 | H=2t, cuts at 0 and 1/2 give (s₁,1;0,1/2,1) with endpoint 0; then min −1 at 1/2 gives (s₁;0,1) with endpoint −2 | pass |
| S4.3 bonds | rank one, bond 2 | 2·(1/2)=1∈ℤ; 2·(1/3)∉ℤ; with break 1/3 the set would have 5 elements | pass |
| S4.3 generation | SL₂, shape 2 | weights 2, 0, −2 by 0, 1, 2 lowerings (Corollary 3) | pass |
| S4.4 character | PGL₂ λ=α; SL₂ λ=ω; λ=0 | e^α−e^(−2α) on both sides; e^ω−e^(−3ω); J(1)=Δ, while the unshifted alternant gives 0 | pass |
| S4.4 adjoint | sl₃ | [E₁₂,E₂₁]=H₁; [E₁₃,E₃₁]=H₁+H₂; [E₁₂,H₁]=−2E₁₂; [E₁₂,H₂]=E₁₂; pairwise determinants 1, 1, −1 | pass |
| S4.7 index test | GL₃ λ=e₁, w=s₂ | κ=−e₃, θ(s₂)=s₁, W_κ=⟨s₁⟩, minimal representative e: one section of weight e₁; untransported test gives 2 | pass |
| S4.7 endpoints | w=e; w=w₀ | e₁ against −e₁, e₃, −e₃; weights e₁, e₂, e₃ | pass |
| S4.7 order | τ₀≤⌊θ(w)⌋ against τ₀≤θ(w) | ⇒ since ⌊θ(w)⌋≤θ(w); ⇐ since the projection is monotone and τ₀ is minimal | pass |
| S5.1 trace | characteristic 2, k[x] | Tr(1)=0, Tr(x)=1, Tr(x³)=x; σ(x²)=x | pass |
| S5.3 kernel | SL₂→PGL₂ in characteristic 2 | μ₂=k[u]/((u−1)²), nonreduced | pass |
| S5.6 | ℙ¹/ℤ; empty union | ranks 1, 2, 3 over 𝔽₂ and 𝔽₃; 0 in every degree | pass; R03 |
| S6.2 Plücker | chart ((1,0,a,b),(0,1,c,d)) | p₁₂p₃₄−p₁₃p₂₄+p₁₄p₂₃=(ad−bc)+bc−ad=0; degree 2: 21−1=20=dim V(2ω₂) | pass; R03 |
| S7.1 Chevalley | GL₃, ω₁, w=s₁s₂; ρ; w=s₂s₁ | coefficients 0 (β=α₂) and 1 (β=α₁+α₂); 1 and 2; v=s₂ gives coefficient 1 with e₃>e₁ not a cover; v=s₁ gives cover e₃>e₂, root α₂, bond 1 | pass |
| S8.2 | SL₂ | (1−t)²=0; λ=0 maps to 1 | pass |
| S8.3 | SL₂, z | 1⊗z restricts to z and z⁻¹; z⊗1 restricts to z and z | pass |
| S8.4 isogeny | PGL₂; SL₂ | [O(2n)]=1+2nu, image ℤ+2ℤu; 1+u; u=([O(2)]−1)/2 over ℚ | pass |
| S8.5 | ℙ¹ | χ(O)=1, χ(O(−1))=0, χ(O(−2))=−1 | pass |
| S9.0 base change | ℙ¹ over ℂ[t], class t | H⁰=0 over A but ℂ at t=0; O(−2): H⁰=0, H¹=ℂ | pass |
| S9.1 | one-letter word; dual numbers | ℙ¹(ℂ), dz/dz=1; ε≠0 is retained | pass |
| S9.6 | SU₂; SU₃ | ℝP²: H⁰=ℤ, H¹=0, H²=ℤ/2; χ=6/6=1 | pass |
| S9.7 | ℙ¹ orbit | indices 0 and 2: 1+q², χ=2 | pass |
| S9.8 | SL₂/B⁻; torus | O(1), degree +1; characters 0 and 1 give the same line | pass; R03 |
| Worked: incidence flag | V=ℂ³ | trace(u↦v⊗(u∧ω))=v∧ω; dim sl⊗det=8; highest weight (2,1,0); dual (0,−1,−2) | pass |
| Worked: fixed plane | (n,k₀)=(4,2), (3,2) | d∈{0,1,2}: 3 orbits; d∈{1,2}: 2 orbits = min(k₀,n−k₀)+1 | pass |
| Worked: blowup of word 121 | Rees charts | u=−yt, v=xt solves ux+vy=0; r·s=1; exceptional divisor ℙ¹×ℙ¹ | pass |
| Worked: cyclicity | Sym⁴, p=3 | binomial(4,i) mod 3 = 1,1,0,1,1: span of 4 < 5 | pass |
| Ownership probe | three owners cited | 3 UPWARD lines | sound here |
| R04 probe | abbreviations spelled out | 0 problems | repair safe |

## Not verifiable

- Pittie1972, Steinberg1975, Jantzen and MehtaRamanathan1985 are uncertified and cited by locator only. I read no text of them.
- I did not elaborate the c339e23c statements at Tau Ceti `2fd255d`. This job runs Lean only in the worktree, whose pin is `a91d3aa`; I read the native signatures at `2fd255d` instead. A second `lake env lean` run in the worktree could not start because of the dangling `.lake/packages` link.
- Ownership was checked against the open pull requests named above (ShimuraData, ComplexComparisonPartII, AlgebraicModuliForArithmeticGeometry, SpringerResolutionAndCharacteristicCycles, GeometricQuantization, IndexTheory and the ReductiveGroups heads), not against all 468.

## Source issues

- **Error** in KnutsonBottSamelson at §6.1, Proposition, p. 5: the source says some Weyl element negates every simple root in S and fixes every simple root outside S; it should say that the longest element of W_S sends S's positive roots to negative roots, since in A₂ with S={α₁} no element fixes α₂ and negates α₁; affects a stated result.
- **Misprint** in BrionFlags at §1.4, p. 15 (line 593): the source lets B⁺ act on G×ℂ through λ(b), which leaves dominant λ without sections; it should act through λ(b)⁻¹, as Propositions 1.4.3 and 1.4.5 (degree λ_i−λ_j, sections iff λ dominant) require; affects a stated result.
- **Misprint** in LLM at Proposition 14, p. 312 (line 809, author copy): the source requires the initial direction to be strictly below w; it should allow equality, as the paper's line 612 does, since V_λ(e) is one-dimensional and only the straight chain indexes it; affects a stated result.
- **Misprint** in LLM at §1.2, p. 295 (line 101): the source makes lengths increase along the Bruhat-descending chain σ₀>σ₁>⋯; it should make them decrease by one at each step; affects nothing.
