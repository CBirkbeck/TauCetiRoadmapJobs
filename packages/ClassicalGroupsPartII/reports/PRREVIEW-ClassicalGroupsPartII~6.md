# Review of ClassicalGroupsPartII (pull request #1492 at bfad31a)

**Verdict:** needs changes

:robot: Independent AI review, incremental: 128 changed lines since dab14f6. One finding remains, a P3, and it is not blocking. It is the previous R02, carried forward unchanged: the pull-request description still does not name the ClassicalGroups revision that defines §3A. The previous R01 (owner of the GSp₂g group) and R03 (Siegel-datum locator) are repaired, and the repairs introduce no new defect. Computed values are in the table below.

## R01 (P3) — The §3A citations resolve only at the ClassicalGroups revision, which the description still does not name

**Location:** `TauCetiRoadmap/ClassicalGroupsPartII/README.md:34–35` (“Its Layer 3A owns the complex Sp₂g theory: the maximal torus and dominant weights (§3A.1), the group–Lie comparison (§3A.2), and in §3A.3 …”). §3A is also cited at lines 43–48, 62, 298–304, 578, 875, 903, 907, 917, 946, 997, 1001 and 1037.

**Claim:** ClassicalGroups on main has no Layer 3A. §§3A.1–3A.3 exist only in the open ClassicalGroups revision #1192 (head 47ca68e). The pull-request description still does not name that revision:
- its depends-on block lists #856 and #966 only;
- its merge-order chain ends `#966 (PELModuli) → this pull request` without #1192;
- it still says “In open pull requests of ours: none”, which contradicts its own depends-on block (#856 and #966 are open pull requests by the same author).

**Witness:** `grep -c 3A` on main's `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md` returns 0. At #1192's head 47ca68e, the Layer 3A heading is at line 621, §3A.1 at 658, §3A.2 at 749 and §3A.3 at 801. The worker's overlap report lists all six §3A ids under “only an open revision defines”.

**Exact repair:** No README change.
1. In the pull-request description, add the ClassicalGroups revision #1192, which defines Layer 3A and §§3A.1–3A.3, to the depends-on block.
2. Add #1192 to the merge-order paragraph, before this pull request.
3. Replace “In open pull requests of ours: none” with the open pull requests the README consumes: ArithmeticGaloisRepresentations (#856) §7.3, PELModuli (#966) §§M0.5–M0.8, and ClassicalGroups (#1192) Layer 3A.

Tested on the instance that refuted the original: each of the six §3A ids in the overlap report resolves at #1192's head (lines 621, 658, 749 and 801), so once #1192 is named every “only an open revision defines” id is covered. Re-citing main's ClassicalGroups Layer 3 instead does not work: main states neither the commutator, nor the simplicity of the kernel, nor the Cartan components that CG.1.4–CG.1.7 consume.

## Previous findings

- R01 — repaired: README line 75 now reads “The group GSp₂g itself belongs to ArithmeticGaloisRepresentations. Its §7.3 builds, over every commutative ring, the similitude group scheme …”. Supporting changes:
  - The new `### From TauCetiRoadmap.ArithmeticGaloisRepresentations` subsection is at lines 322–335.
  - CG.0.1 is now defined from `SimilitudeGroup.GSp` (lines 396–399).
  - `Suggested.lean:15–16` is updated.
  - The description's depends-on block now lists #856.
- R02 — not repaired: the description still says “In open pull requests of ours: none”, its depends-on block lists only “#856 ArithmeticGaloisRepresentations” and “#966 PELModuli”, and #1192 is absent from the merge-order chain. Carried forward as R01.
- R03 — repaired: lines 339–343 now read “Consume the Siegel datum `IntegralPELDatum.siegel` of genus g≥1, a Check of §M0.5 … §M0.6's `IntegralPELDatum.toRational` rationalizes it”. The *Needs:* of CG.0.2 (lines 488–489) and the Layer CG.0 Dependencies (line 683) cite §§M0.5–M0.8.

## Verified sound

**Gate, order, build.**
- I re-ran the gate at this head: `gate ClassicalGroupsPartII: set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- The worker's gate also reports `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The worktree is clean after the gate.
- The dependency check printed the following, with no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
  ```

- Merge order: ArithmeticGaloisRepresentations is line 56, PELModuli line 113 and ClassicalGroupsPartII line 198. Both new suppliers are earlier, and neither cites ClassicalGroupsPartII: `grep ClassicalGroupsPartII` over both READMEs at their heads returns nothing.
- `lake env lean TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` exited 0 in 17 s. The only warnings were `declaration uses sorry`, at lines 109, 130 and 136.

**Lean.**
- Only the module docstring changed (lines 15–16). The 21 declarations are untouched.
- I elaborated `#check @…` for all 21 declarations in one scratch file. The types are identical to those the previous review compared with the README: no section binder lost, `0 < g` on `mem_positiveSubring` and `positiveInvariantPresentation`.
- The docstring says the GSp coordinate Hopf algebra is “not in the pinned libraries”, which holds. `grep -ril similitude` finds 0 files in the pinned Tau Ceti. In Mathlib it finds one, `Topology/MetricSpace/Dilation.lean`, about metric dilations, not algebraic groups.
- The one-tactic probe of the previous review stands, since the three headlines are unchanged: `simp`, `aesop` and `exact Subring.mem_closure_iff` all failed.

**Pinned declarations opened this round** (Tau Ceti a91d3aaf, Mathlib 6b7abb3c):
- `Matrix.transpose_mul_J_mul_eq_det_smul` (`TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:76`) carries `[DecidableEq l] [Fintype l] [Unique l] [CommRing R]` and states `Aᵀ * J l R * A = A.det • J l R`. This is exactly the new contract row's statement.
- `TauCeti.Symplectic.relationMatrix_def` (`Algebra/AlgebraicGroup/Symplectic/Basic.lean:85–90`) gives `X·JFin·Xᵀ − JFin`, and `coordinateHopfAlgebra` (line 104) uses `JFin`.
- `ConstantForm.relationSet` (`ConstantForm/Basic.lean:132–133`) is the set of entries, and `definingHopfIdeal` (lines 259–261) is `HopfIdeal.ofSpan relationSet`. So CG.0.1 step 4's claim that the entries generate the Sp Hopf ideal holds.
- Mathlib:
  - `Matrix.J` (`LinearAlgebra/SymplecticGroup.lean:58`);
  - `symplecticGroup` with carrier `A * J * Aᵀ = J` (lines 101–102);
  - `mem_iff'`, i.e. `Aᵀ J A = J` (line 185). This supports the claim at line 81 that the multiplier-one points of `SimilitudeGroup.GSp` form `Matrix.symplecticGroup`.

**Cross-roadmap citations resolved this round.**
- ArithmeticGaloisRepresentations at #856, head cf6ae2f (read through `roadmaps show`). §7.3 runs from line 4595 to 4630:
  - `SimilitudeGroup.groupScheme` J: points (g,ν) with B(gx,gy)=νB(x,y), closed in GL×G_m, with ν determined by g for a perfect form of constant positive rank (4597–4600);
  - `SimilitudeGroup.multiplier`, and `SimilitudeGroup.GSp` for J₂ₘ=(0 1;−1 0)=−`Matrix.J` (4600–4601);
  - the Checks GSp₂=GL₂ with ν=det, and Sp₂ₘ equal to `Matrix.symplecticGroup` (4620–4621).

  The README subsection at lines 322–335 matches this item by item.
- PELModuli at #966, head 697b514 (unchanged since the previous review):
  - §M0.5 (631) with the `IntegralPELDatum.siegel` Check (663): order ℤ, ℤ^{2g}, Gram matrix −`Matrix.J`;
  - §M0.6 (683), whose `IntegralPELDatum.toRational` (691) requires a faithful rationalized action;
  - §M0.7 (713) with `PELDatum.similitudeGroup`, `RationalPELDatum.coordinate` and `RationalPELDatum.coordinatePoints` (725–726);
  - §M0.8 (766), with `similitudeGroupStructure` (768) and `similitudeGroupStructure_siegel` (784).

  These cover all five leads in the citation resolver's list.
- ClassicalGroups:
  - at #1192 head 47ca68e: Layer 3A (621), §3A.1 (658), §3A.2 (749), §3A.3 (801);
  - on main: no “3A” (see R01).
- Consumers whose ids this change could break, all of which are unchanged:
  - SiegelModularForms (#1714) cites CG.0.1 at its lines 36, 164, 479 and 507;
  - CountingBundlesAndHallAlgebrasOfCurves (#1547) cites CG.0.4, CG.0.5 and CG.2.6.

  The overlap report finds no dropped id and no other pull request changing this roadmap.

**Ownership.** The change moves the owner of the bare GSp₂g group scheme to ArithmeticGaloisRepresentations §7.3, the earliest owner. It keeps connected reductivity with PELModuli §M0.8, which only PELModuli proves. It adds a Yoneda identification of the two Q-forms, which uses both suppliers and restates neither. No new object is claimed here. I checked against main and the open heads with `roadmaps grep 'ClassicalGroupsPartII'` and by reading both suppliers' sections.

**Declared gaps.** The three `What ReductiveGroups must provide (gap:…)` contracts at lines 228, 248 and 270 are untouched (shifted by one line), and the slugs match the design's `gaps`.

**Sources: the seeded sample, where it falls in changed passages.**
- The “Construction and proof” of CG.0.1 (all four steps rewritten) and its “Consequences to check” (Hopf-quotient Sp fibre, g=1 multiplier = det) were checked against the declarations above.
- `yu line 3745–3755` (Remark 7.1.1, page marker 64 at line 3728) defines GSp₂g over Q by h·[[0,I],[−I,0]]·ᵗh=z·[[0,I],[−I,0]]. That is this roadmap's J and the hJhᵀ=sJ presentation of CG.0.1.
- `milne line 16462–16463` is Proposition 19.13: for an algebraic group variety over k and a field k′ containing k, G is reductive iff G_k′ is. This is cited unchanged in CG.0.2.
- The remaining sampled blocks (CG.1.5–CG.1.7, CG.2.4–CG.2.5, CG.3.1–CG.3.6) are untouched and were verified in the previous review. The README flags no locator as unverified.

**Adversarial table.** Rows marked (r5) are untouched statements, carried forward from the previous review (PRREVIEW-ClassicalGroupsPartII~5) with the values it computed. Rows marked (new) cover the changed statements and were computed this round: by hand, and by an exact-rational script over integer matrices (machine).

| Statement (line) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| (new) GSp owner and §7.3 contract (75–86, 322–335) | m=1; J=0 on ℚ¹; multiplier one | −`Matrix.J`=−[[0,−1],[1,0]]=[[0,1],[−1,0]]=J₂ of §7.3. For J=0, (1,ν) is a point for every ν, so “determined” needs a perfect form; det J=1 for g≥1. gᵀ(−MJ)g=−MJ ⇔ gᵀ·MJ·g=MJ ⇔ `mem_iff'` | Matches §7.3; retain |
| (new) PELModuli contract (337–354) | g=0, g=1; Gram entries | g=0: V=0, ℚ→End(0)=0 is not injective, so there is no `toRational`. g=1: ℚ acts on ℚ² injectively. ⟨hx,hy⟩=xᵀhᵀJhy=r·xᵀJy for all x,y ⇔ hᵀJh=rJ. ⟨e₁,f₁⟩=1 for PELModuli's −`Matrix.J` and for §7.3's J₂ | “Faithful exactly when g≥1” holds; retain |
| (new) CG.0.1 step 1, the two similitude equations (419) | g=2: 300 random similitudes (torus diag(z,c/z), symmetric unipotents, J); 2000 random invertible 4×4 | 300 of 300 with hᵀJh=rJ also have hJhᵀ=rJ. Among the 2000, the two tests disagree 0 times (machine) | Same ideal; retain |
| (new) CG.0.1 step 2, multiplier uniqueness (409, 420) | entry (a,g+a); A=0; g=0 | J_{a,g+a}=1, so sJ=s′J forces s=s′ over every A, the zero algebra included. At g=0 the empty J admits s=1 and s=2 | g≥1 needed and present; retain |
| (new) CG.0.1 step 3 and identity-extension Check (421, 441) | 1⊗s ↦ s at Q-point 2I | (2I)J(2I)ᵀ=4J on both sides; the variant s↦s⁻¹ would give 1/4 | Retain |
| (new) CG.0.1 step 4, s=1 fibre (422) | random integer 4×4 X | XJXᵀ−J = −(X·JFin·Xᵀ−JFin) entrywise (machine). Negated generators span the same ideal = `definingHopfIdeal` | Hopf quotients agree; retain |
| (new) CG.0.1 step 4, rank one via the Tau Ceti lemma (422) | 2000 random 2×2; X=[[2,5],[7,3]] | XJXᵀ=det(X)J and Xᵀ·MJ·X=det(X)·MJ in all cases (machine). At A=Xᵀ: X·MJ·Xᵀ=−29·MJ; negated, XJXᵀ=−29J. The relations become (det X−s)J=0, so s=det X, s⁻¹=D, and the quotient is K[x,D]/(D det X−1)=O(GL₂) | Retain |
| (new) contract row `Matrix.transpose_mul_J_mul_eq_det_smul` (198) | l=Fin 1; l=Fin 2 | Line 76 needs `[Unique l]`. At g=2, diag(2,1,1,1) is no similitude (PELModuli §M0.7 Check), so the rank-one restriction is necessary | Row accurate; retain |
| (new) CG.0.1 g=2 Check, now citing §7.3 (440) | A=[[1,1],[0,1]] | h=diag(A,3A⁻ᵀ), 3A⁻ᵀ=[[3,0],[−3,3]]: hJhᵀ=3J true, hᵀJh=3J true. With 3A⁻¹=[[3,−3],[0,3]] the off-diagonal block is [[0,3],[−3,3]], not scalar, and hᵀJh is no multiple of J (machine) | Discriminating; retain |
| (new) CG.0.2 Yoneda identification and transfer (452–462) | ℚ-algebras; K/ℚ; g=0 | Same equation hᵀJh=rJ, same J and componentwise product on both sides, so the Hopf algebras are isomorphic and the multipliers match. K/ℚ comes from CG.0.1 step 3, then Milne 19.13. g=0 is excluded by `toRational` | Correct; retain |
| (new) CG.0.2 Check diag(2,3) (484) | g=1 | hᵀJh=[[0,6],[−6,0]]=6J=hJhᵀ, so s=6. The contragredient h⁻ᵀ=diag(1/2,1/3) gives (1/6)J (machine), so the Check excludes an identification through h↦h⁻ᵀ | Discriminating; retain |
| (new) *Needs:* and Dependencies, CG.0.1, CG.0.2, Layer CG.0 (445, 486–493, 683) | build order | §7.3 at order 56 and §§M0.5–M0.8 at 113, both before 198. CG.0.2 needs CG.0.1 only, from inside the roadmap. depcheck: 0 problems | Retain |
| (new) `Suggested.lean` docstring (15–16) | pinned libraries | `similitude` in 0 Tau Ceti files and 1 metric-space Mathlib file; 21 `#check` types unchanged | True; retain |
| (r5) `fullInvariantPresentation` (Lean 109) | g=0,1,2,3 | g=0: ⊤≅ℤ[t±1], T↦t (T↦T⁻¹ gives t⁻¹≠t). g=1: z²+(t/z)²↦X²−2T. g=2: e₂(x)↦X₂−T. 20/50/50 orbit sums, 0 failures | Retain |
| (r5) `mem_positiveSubring` (Lean 130) | g=1,2,3; g=0 | 32/165/380 weights, 0 mismatches. g=0: t has cone value 1 but B₀=ℤ | `0<g` needed; retain |
| (r5) `positiveInvariantPresentation` (Lean 136) | g=1,2,3; g=0 | 12/30/30 orbit sums, every t-exponent ≥0. g=0: t∉B₀ | Retain |
| (r5) E_k formula, F_k triangularity and augmentations | g=1..4 | E_(2g)=t^g, E_(2g+1)=0. F-augmentations at g=3: 6, 14, 14; at g=4: 8, 27, 48, 42 | Retain |
| (r5) orbit recurrence; `exteriorCharacter`/`fundamentalCharacter` | n=0..7; k=−1,0,1 | p₀=2, pₙ=xpₙ₋₁−tpₙ₋₂. E₋₁=0, E₀=1, F₁=E₁ | Retain |
| (r5) `permWeight`/`flipWeight` | g=3 cycle; g=1 | u∘σ⁻¹ sends z₁ to z₂ (u∘σ gives z₃). (−1,2)↦(1,−2) | Retain |
| (r5) CG.0.1 rank-one, scalar, g=0 and zero-algebra Checks | 2×2 h; 2I; g=0; A=0 | hJhᵀ=det(h)J; 2I has multiplier 4; at g=0 both s=1 and s=2 work; both point sets over A=0 are singletons | Retain |
| (r5) CG.0.2 kernel, fppf lifts, c²a variant | ca=I; diag(1,2); ℚ[ε]/ε² | (±I,±1); a lift needs c²=2; (1+ε/2)²=1+ε; c²a has multiplier c⁴ and kernel μ₄ | Retain |
| (r5) CG.0.3 parity and roots | ((1,0…),0); g=1 | d−Σu=−1 is odd; α_g=(−1,2δ_g), ⟨α_g,α_g^∨⟩=2 | Retain |
| (r5) CG.1.5 commutator, ranks, Checks, characteristic-2 control | g=1,2,3 | κL−Lκ=(g−k)·id. At g=3, κ₂, κ₃, κ₄ have ranks 1, 6, 15; κ₅ has rank 6 against a 20-dimensional target. κ₂(Ω)=2≡0 mod 2 | Retain |
| (r5) §3A transport | g=1 native form | Ω_J=−Ω; ω_J(e_i,−f_j)=δ_ij | Retain |
| (r5) CG.1.2 cell, 𝔽₄, pair swap | (2,3,5,7); [[α,1],[1,0]] | det [[5,15],[10,37]]=35; α²−α=1; JJJᵀ=J | Retain |
| (r5) CG.3.4 occurrence | (−1,2,0) | d=0 but m<0, so it does not occur | Retain |
| (r5) CG.1.1/CG.2.6 at g=1; CG.1.8; Sternberg dimension | V⊗V; z=a, t=ab; n | x²=z²+2t+(t/z)²; t^m z^u=a^(m+u)b^m; (2n+1)(2n−2)/2=binom(2n,2)−1 | Retain |

Remarks on text this round did not touch: none.

## Not verifiable

- ArithmeticGaloisRepresentations and PELModuli were read at their open heads through the roadmap index (`roadmaps show`), not from sibling checkouts.
- The pull-request description was judged from the worker's quoted copy, not the live page.
- No source text was inaccessible, and no fetch was needed.

## Source issues

- none
