# Review of ClassicalGroupsPartII (pull request #1492 at ce69dfc)

**Verdict:** needs changes

Incremental re-review of the 135 README lines changed since bfad31a. `Suggested.lean` is unchanged. The gate passes. Three findings remain:

- R01 (P2) and R02 (P2) were introduced by this round's repair. It replaced the ClassicalGroups Layer 3A citations with citations of main's Layers 0–5, and it proves the Sp contraction statements here. The open ClassicalGroups revision moves the Sp classification that main's Layer 3 holds into its new Layer 3A. That revision also still claims the Sp contraction statements and says this roadmap consumes them.
- R03 (P3) carries forward the unrepaired part of the previous R01.

The new mathematics is correct. The pair-decomposition proof of the commutator, the transpose relation, the positivity argument for surjectivity and the new Check were all recomputed exactly (table below). The findings concern ownership and citation, not truth.

## R01 (P2) — The type C classification and chamber are cited from ClassicalGroups Layer 3, which the open ClassicalGroups revision moves to Layer 3A

**Location.**
- `README.md:297–305`: “Consume Layer 3's highest-weight classification of the connected symplectic group Sp₂g(ℂ) … With the diagonal torus diag(z,z⁻¹) of Sp₂g … and the positive roots fixed in CG.0.4, it is used in this form”.
- Other Layer 3 citations for Sp at lines 33–35, 45, 61, 553 (CG.0.4 step 2, “the one used with the type C classification of ClassicalGroups Layer 3”), 570 (CG.0.4 *Needs:* “for the matching type C chamber”), 675, 911, 921, 939, 990, 1034 and 1095.

**Claim.** On main (b0fe353), ClassicalGroups Layer 3 does carry a one-bullet Sp type C classification (lines 265–270). It fixes no Sp torus, Borel or chamber.

The open revision of ClassicalGroups (#1192, opened by another author, head 47ca68e) changes this:
- Its §3.5 hands the Sp classification to the new Layer 3A.
- Its Layer 3 keeps only the GL theory and a pointer.
- The Sp torus diag(t,t⁻¹), the Borel [[A,B],[0,A⁻ᵀ]] and the positive roots ε_i−ε_j, ε_i+ε_j and 2ε_i are in §3A.1 (lines 666–671).
- The rational type C highest weights and the classification are in §3A.3 (lines 816–820 and 883–898).

When that revision merges, every “ClassicalGroups Layer 3” citation above points to a section that only names the Sp classification and sends the reader to Layer 3A. The overlap tool did not report this because the Layer 3 heading anchor is unchanged.

The brief makes this a supplier citation of an id an open pull request drops: P2, to be cited as at that head. Its rule that a revision is never a dependency yields here to the exception for a revision that drops an id this roadmap cites. Layer 5 is unaffected: §5.1 at that head (lines 1062–1063) keeps the form-group product formulas in Layer 5.

**Witness.** #1192 `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:590–591` says the connected matrix groups' “exact rational highest-weight classification are constructed in Layer 3A”. Line 599 then names “Layer 3A group/Lie comparison and rational models” as the *Needs:* of §3.5.

**Exact repair.**
1. Cite §3A.1 for the Sp torus, Borel and dominant chamber, at lines 553 and 570 and in the contract at 297–305.
2. Cite §3A.3, with §3A.2 for the group–Lie comparison it uses, for the rational type C classification, at lines 33–35, 45, 61, 297–305, 911, 921, 939, 990, 1034 and 1095.
3. Keep the Layer 0, 2 and 5 citations.
4. In the pull-request description, name the ClassicalGroups revision (#1192) in the depends-on block and the merge-order paragraph, before this pull request.

Tested at 47ca68e: §3A.1 (line 658) states exactly CG.0.4's chamber (positive roots ε_i−ε_j, ε_i+ε_j, 2ε_i; the computed restriction is in the table), and §3A.3 (line 801) states the type C highest weights. The bfad31a text, which cited §§3A.1–3A.3 at these places and which the previous review checked, is a ready form of this repair.

## R02 (P2) — CG.1.4–CG.1.5 and CG.1.7 now prove the Sp contraction statements that ClassicalGroups §3A.3 owns at the open revision

**Location.**
- `README.md:36–47`: “Here the new work is … the ν-valued contraction of exterior powers with its inverse-form wedge map, their commutator and the primitive exterior powers they cut out … restricted to Sp₂g they are the Sp statements”.
- `README.md:910–912`: “The commutator and surjectivity are proved here over Z and Q”.
- CG.1.5 steps 1–2 (lines 916–921) and CG.1.7 (lines 989–999).

**Claim.** After identifying ν with its basis vector, this roadmap's κ and L are the negatives of §3A.3's κ and L for the native `Matrix.J`. The README says so at line 867, and both were recomputed. The identities therefore coincide:
- the commutator `κ_(k+2) ∘ L_k − L_(k−2) ∘ κ_k = (g−k) id`;
- surjectivity of κ_k for k≤g+1;
- the complex kernel P_k as the simple module of highest weight ω_k and dimension binom(2g,k)−binom(2g,k−2);
- the complex Cartan component of a highest tensor.

All four are stated in the open revision's §3A.3, which also assigns them to itself and says this roadmap consumes them. This round's repair proves them here instead. So two open roadmaps own the same statements. The brief settles a shared object with the earlier roadmap (ClassicalGroups) as owner and a citation from the later one. ClassicalGroups cannot cite this roadmap (that would be an upward citation), so the only consistent arrangement is this roadmap consuming §3A.3.

**Witness.**
- #1192 `ClassicalGroups/README.md:815–820`: the commutator “(r−k) · id … for every k≥0”, “κ_k is surjective for every k≤r+1”, and P_k simple of highest weight ω_k with dimension binom(2r,k)−binom(2r,k−2).
- Line 1896: “the Sp statements are §3A.3's”.
- Lines 52–56: this roadmap “consumes the Sp statements of §§3A.1–3A.3 here”.

**Exact repair.**
1. Once R01 makes the revision a named dependency, consume §3A.3 for:
   - the Sp commutator;
   - surjectivity;
   - the highest weight, simplicity and dimension of the complex kernel;
   - the complex Cartan component.
2. Keep here what §3A.3 does not state:
   - the ν-valued GSp-equivariant contraction and wedge maps;
   - the transport to J=−JFin;
   - the descent through the integer matrices to every characteristic-zero K;
   - the transfer of simplicity from Sp₂g to GSp₂g;
   - the rational Cartan model.

   This is bfad31a's division at lines 33–46, 297–310, 880–885 (the CG.1.4 comparison paragraph), 908–913, steps 1–2 of CG.1.5 and 989–999. Restore it, and delete “The commutator and surjectivity are proved here over Z and Q”.
3. The new direct proofs are correct and may stay only as the proof of the GSp form, attributed to §3A.3's statement.

The alternative, keeping the proofs here as owner, would need the revision to drop the Sp contraction statements from its §3A.3 and its lines 52–56 and 1890–1896. That is outside this folder.

Tested: at 47ca68e, §3A.3 states every one of the four statements (lines 813–820 and 883–898), so the restored citations resolve. The previous review checked that the bfad31a transport (sign of the form, integer matrices, descent) is correct.

## R03 (P3) — The description still says the README consumes no open pull request

**Location.** The pull-request description, Dependencies paragraph: “In open pull requests of ours: none. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite.”

**Claim.** The README consumes ArithmeticGaloisRepresentations §7.3 (contract at lines 314–328) and PELModuli §§M0.5–M0.8 (lines 329–346). Neither is on main: main b0fe353 has no folder for either. Both are open pull requests (#856 and #966) listed in the description's own depends-on block. The sentence therefore contradicts the block, and so does “everything else … is a consumer”. This is step 3 of the previous R01's repair, not carried out.

**Witness.** The depends-on block lists “#856 ArithmeticGaloisRepresentations” and “#966 PELModuli”. `find TauCetiRoadmap -maxdepth 3 -name ArithmeticGaloisRepresentations -o -name PELModuli` on main returns nothing.

**Exact repair.**
- Replace the sentence with the open suppliers consumed: ArithmeticGaloisRepresentations (#856) §7.3, PELModuli (#966) §§M0.5–M0.8, and after R01 the ClassicalGroups revision (#1192) Layers 3A.1–3A.3.
- Delete “everything else named in the README is a consumer”.
- Adding #1192, which another author opened, makes “Every pull request in this chain is ours” in the merge-order paragraph false. Reword that sentence too.

Tested on the instance: each named supplier then resolves (§7.3 and §§M0.5–M0.8 were read at their heads in the previous review; §3A at 47ca68e as above).

## Previous findings

- R01 — partly repaired: the README no longer cites §3A (`grep 3A` matches only the matrix “3A⁻ᵀ” at line 432). The description still says “In open pull requests of ours: none” and does not name the revision. That part is carried as R03; re-citing main introduces R01 and R02.

## Verified sound

**Gate, order, build.**
- Gate rerun at this head: `gate ClassicalGroupsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- Dependency check with `--movable`:

  ```text
  depcheck: 239 roadmaps, 2355 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. `git diff --stat bfad31a HEAD` touches only `README.md` (66+/69−). The worktree is clean.
- Merge order: ArithmeticGaloisRepresentations is line 57, PELModuli line 115 and ClassicalGroupsPartII line 199. ClassicalGroups and ReductiveGroups are on main.
- `lake env lean TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` exited 0 in 6 s. Its only warnings were `declaration uses sorry` at lines 109, 130 and 136.

**Lean.**
- `Suggested.lean` is byte-identical to bfad31a.
- I appended `#check @…` for all 21 declarations to a scratch copy and elaborated it (exit 0). The three headline types are unchanged: `fullInvariantPresentation`, `mem_positiveSubring` and `positiveInvariantPresentation` (the last two with `0 < g`). No section binder is lost, which agrees with the worker's signatures file.
- The docstring mentions neither §3A nor ClassicalGroups, so the README change leaves it accurate.

**Main's ClassicalGroups, as now cited** (b0fe353, `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md`). All five anchors in the changed links match the headings' GitHub slugs.
- Layer 0 (line 175): the symplectic inclusion and the invariant alternating form (lines 182–185).
- Layer 1 (line 200).
- Layer 2 (line 216): S^(1^d)V ≅ Λ^dV.
- Layer 3 (line 237): the Sp type C bullet (lines 265–270).
- Layer 5 (line 297): “Give the Spₙ, SOₙ product forms likewise” (lines 307–308).

On main these support the contract at lines 287–310. R01 concerns only the revision's head.

**Pinned declarations opened this round** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf):
- `Matrix.J` = `fromBlocks 0 (-1) 1 0` (`LinearAlgebra/SymplecticGroup.lean:58–59`).
- `symplecticGroup` with carrier `A * J * Aᵀ = J` (lines 101–102).
- `mem_iff'`, i.e. `Aᵀ J A = J` (line 185). This supports line 867's claim that `Matrix.symplecticGroup` preserves vᵀ(`Matrix.J`)w.
- `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` (`Algebra/Lie/HighestWeight/Existence.lean:240`).
- `TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` (`Algebra/Lie/HighestWeight/FiniteDimensional.lean:126`).

Both Tau Ceti names in line 59 exist.

**Open revision checked** (#1192 ClassicalGroups, head 47ca68e; rev-parse rechecked before writing):
- Layer 3 (496–503) is GL-focused, and §3.5 (588–599) hands the Sp classification to Layer 3A.
- §3A.1 (658–671) gives the Sp torus, Borel and positive roots.
- §3A.3 (801–820 and 883–905) states the commutator, surjectivity, kernels and Cartan components.
- §5.1 (1048–1072, form groups at 1062–1063) keeps the form-group product formulas.
- Scope lines 52–56 and Downstream consumers lines 1890–1896.

`roadmaps grep` for the contraction commutator over main and all 467 open heads finds it only in #1192 and here. SpinGeometry's hits are Clifford anticommutators, a different object.

**Sources, the seeded sample where it falls in changed text.**
- *Construction and proof* of CG.0.4 (step 2 rewritten): the restricted roots and base agree with `milne line 19149–19153` (Summary 21.98, printed p.461): roots ±2ε_i and ±ε_i±ε_j, base ε_i−ε_(i+1) and 2ε_n.
- *Construction and proof* of CG.1.5 (steps 1–2 rewritten): `sternberg line 5039–5058` (§7.9, printed p.131) asserts that contraction is surjective for j=2,…,n and that the kernels are the fundamental representations, via the Weyl dimension formula. Lines 5112–5152 (pp.132–133) carry out the case k=2. The README's general-k dimension is verified numerically in the table. The locator supports the claim, with the misprints listed under Source issues.
- *Consequences to check* of CG.0.4, CG.1.4 and CG.1.5 are unchanged and consistent with the recomputed values.
- The CG.1.7 Sternberg locator (`sternberg line 5024–5029`, Cartan product of highest vectors) is unchanged and still supports the new orbit-span argument.
- The README flags no locator as unverified.

**Adversarial table.**
- Rows marked (new) were computed this round, by hand and with exact-integer scripts over the exterior algebra with basis order e₁,…,e_g,f₁,…,f_g (machine).
- Rows marked (r6) are untouched statements carried from PRREVIEW-ClassicalGroupsPartII~6 with the values it computed. That review's (r5) rows are carried with them.

| Statement (line) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| (new) Scope/contract: ClassicalGroups Layers 0–5 (32–47, 287–310) | main b0fe353; revision 47ca68e | Main: L3 Sp bullet 265–270, L5 “Sp product forms” 308, five anchors match. Revision: §3.5 590–591 delegates Sp to 3A | Resolves on main; drifts at revision (R01) |
| (new) CG.0.4 step 2, restriction of GSp roots (553) | g=1,2; Lie(GSp) blocks | Lie(GSp) for J=[[0,I],[−I,0]]: B,C symmetric, A+Dᵀ=cI. B entries weight (−1,ε_i+ε_j), A entries (0,ε_i−ε_j), C entries (1,−ε_i−ε_j). At t=1: ±ε_i±ε_j, ±2ε_i. Base e_i−e_(i+1), 2e_g−e_t ↦ ε_i−ε_(i+1), 2ε_g = Milne 21.98; chamber λ_i≥λ_(i+1), λ_g≥0 | Mathematics correct; citation R01 |
| (new) CG.1.4 sum formula vs ι-form and native form (855–871) | g=1,2,3, every k, every basis wedge | Σ_(a<b)(−1)^(a+b−1)ω(v_a,v_b)(…) = Σ_i ι(f_i*)ι(e_i*) on all wedges; contraction by `Matrix.J`=fromBlocks 0 (−1) 1 0 equals −κ (machine) | Retain |
| (new) CG.1.5 step 1 commutator (916–918) | g=1..4, k=0..2g | One pair on 1,e,f,e∧f: [κ_i,L_i]=1,0,0,−1 (hand). [κ,L]=(g−k)·id on every basis wedge for all g≤4 (machine) | True; owner R02 |
| (new) Transpose relation κ_k=L_(k−2)ᵀ (918) | g=1..4, 2≤k≤2g | Matrices equal entrywise in every case (machine) | Retain |
| (new) Positivity ⇒ surjectivity for 2≤k≤g (918) | g=2,3,4 | det(κ_k L_(k−2)): g=2 → 2,1,0 (k=2,3,4); g=3 → 3,64,4,0,0; g=4 → 4,6561,805306368,65536,0,0,0. Nonzero exactly for k≤g+1. rank κ_k at g=3: 1,6,15, then 6<20 | Bound g+1 confirmed; retain |
| (new) Check L₁(e₂), κ₃ (928) | g=2 | L₁(e₂)=e₁∧f₁∧e₂=−e₁∧e₂∧f₁; κ₃(e₁∧e₂∧f₁)=−e₂; κ₃L₁=I₄; (−κ₃)L₁=−I₄ (machine) | Discriminating; retain |
| (new) Char-2 Check rewording (933) | g=2 over 𝔽₂ | κ₂L₀=g=2≡0, row (0,1,0,0,1,0) of rank 1, L₀(1)∈ker κ₂ | Retain |
| (new) CG.1.5 step 2: the ω_k line and dominance (921) | g=1..4, 1≤k≤g | ω_k has multiplicity 1 in Λ^kV, and every weight of Λ^kV is ≤ω_k in type C order (machine) | Retain |
| (new) CG.1.5 step 2: Weyl dimension at ω_k = dim P_k (921) | g=1..6 | Weyl C_g at ω_k: g=3 → 6,14,14; g=4 → 8,27,48,42; g=6 → 12,65,208,429,572,429, all equal to binom(2g,k)−binom(2g,k−2). dim ker κ_k at g=4: 27,48,42 | Retain |
| (new) GSp(ℂ)=ℂ^×·Sp(ℂ) on Λ^kV (921) | g=1, h=diag(2,3) | h=√6·h₀ with h₀ of multiplier 1; the scalar c acts on Λ^kV by c^k, so stable subspaces agree | Retain |
| (new) CG.1.7 highest tensor (989–999) | g=2, a=(1,1),(2,1); g=3, a=(1,1,1),(0,2,1),(2,0,1) | u=(2,1),(3,1),(3,2,1),(3,3,1),(3,1,1): the u-weight space of ⊗Λ^kV^(a_k) ⊇ ⊗P_k^(a_k) has dimension 1, and every weight is ≤u (machine). Weyl dims 16,35,512,616,216 | Retain; owner R02 |
| (r6) GSp owner and §7.3 contract (74–86, 314–328) | m=1; J=0; multiplier one | −`Matrix.J`=J₂ of §7.3. J=0 makes ν undetermined; gᵀ(−MJ)g=−MJ ⇔ `mem_iff'` | Retain |
| (r6) PELModuli contract (329–346) | g=0,1 | g=0: ℚ→End(0) not injective, no `toRational`. g=1 faithful; ⟨hx,hy⟩=r⟨x,y⟩ ⇔ hᵀJh=rJ | Retain |
| (r6) CG.0.1 steps 1–4 and Checks (396–441) | g=2, 300 similitudes and 2000 random 4×4; A=0; g=0; 2×2 | Two equations agree in 2000/2000 cases. J_(a,g+a)=1 fixes s for g≥1. (2I)J(2I)ᵀ=4J. XJXᵀ−J=−(X·JFin·Xᵀ−JFin). At g=1 the relations give s=det X, so the quotient is O(GL₂). h=diag(A,3A⁻ᵀ) passes, 3A⁻¹ fails | Retain |
| (r6) CG.0.2 Yoneda identification, transfer, diag(2,3) Check | g=0,1; K/ℚ | Same equation and multiplication on both sides. diag(2,3) has s=6, while h⁻ᵀ gives 1/6 | Retain |
| (r5) `fullInvariantPresentation` (Lean 109) | g=0,1,2,3 | g=0: ⊤≅ℤ[t±1], T↦t. g=1: z²+(t/z)²↦X²−2T. 20/50/50 orbit sums, 0 failures | Retain |
| (r5) `mem_positiveSubring` (Lean 130) | g=1,2,3; g=0 | 32/165/380 weights, 0 mismatches. g=0: t has cone value 1 but B₀=ℤ | `0<g` needed; retain |
| (r5) `positiveInvariantPresentation` (Lean 136) | g=1,2,3; g=0 | 12/30/30 orbit sums, every t-exponent ≥0. g=0: t∉B₀ | Retain |
| (r5) E_k, F_k triangularity, augmentations | g=1..4 | E_(2g)=t^g, E_(2g+1)=0. F-augmentations at g=3: 6,14,14; at g=4: 8,27,48,42 (this round's Weyl values agree) | Retain |
| (r5) Orbit recurrence; `exteriorCharacter`/`fundamentalCharacter` | n=0..7; k=−1,0,1 | p₀=2, pₙ=xpₙ₋₁−tpₙ₋₂; E₋₁=0, E₀=1, F₁=E₁ | Retain |
| (r5) `permWeight`/`flipWeight` | g=3 cycle; g=1 | u∘σ⁻¹ sends z₁ to z₂; (−1,2)↦(1,−2) | Retain |
| (r5) CG.0.3 parity and roots | ((1,0…),0); g=1 | d−Σu=−1 is odd; α_g=(−1,2δ_g), ⟨α_g,α_g^∨⟩=2 | Retain |
| (r5) CG.1.2 cell, 𝔽₄, pair swap | (2,3,5,7); [[α,1],[1,0]] | det [[5,15],[10,37]]=35; α²−α=1; JJJᵀ=J | Retain |
| (r5) CG.3.4 occurrence | (−1,2,0) | d=0 but m<0, so it does not occur | Retain |
| (r5) CG.1.1/CG.2.6 at g=1; CG.1.8 | V⊗V; z=a, t=ab | x²=z²+2t+(t/z)²; t^m z^u=a^(m+u)b^m | Retain |

Remarks on text this round did not touch: none.

## Not verifiable

- I judged the pull-request description from the worker's quoted copy, not from the live page.
- I did not re-read ArithmeticGaloisRepresentations (#856) and PELModuli (#966) this round, because their citations are untouched. The citation resolver finds no missing cross-roadmap citation, and the previous review read both heads.
- Ownership against open pull requests was checked through the sibling checkout of #1192 and `roadmaps grep` over all open heads. No source text was inaccessible, and no fetch was needed.

## Source issues

- **Misprint** in sternberg at §7.9, printed p.131 (`sternberg line 5054`): the source subtracts binom(2n,2j−2) in the contraction-kernel dimension; it should be binom(2n,j−2), the dimension of Λ^(j−2)V; affects a stated result.
- **Misprint** in sternberg at §7.9, printed p.132 (`sternberg line 5123`): the source gives numerator j in the second difference-factor product; it should be j−1, as the factor r₂−r_j requires for the telescoping product; affects the proof.
