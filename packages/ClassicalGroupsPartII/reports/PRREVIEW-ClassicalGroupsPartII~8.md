# Review of ClassicalGroupsPartII (pull request #1492 at e26957b)

**Verdict:** needs changes

This is an incremental re-review of the 141 README lines changed since ce69dfc. `Suggested.lean` is unchanged and the gate passes.

The README now consumes ClassicalGroups §§3A.1–3A.3 for the Sp statements and keeps only their GSp form here. That resolves the previous R01 and R02. The new transport, the new Check and the CG.1.7 orbit-span argument were recomputed and are correct (table below).

One finding remains. It concerns the pull-request description, not the folder.

## R01 (P3) — The description does not name the ClassicalGroups revision whose §§3A.1–3A.3 the README now consumes

**Location.** The pull-request description:
- the Dependencies paragraph: “In open pull requests of ours: none. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite.”
- the depends-on block, which lists only #856 and #966;
- the merge-order paragraph: “… → #966 (PELModuli) → **this pull request** (#1492). Every pull request in this chain is ours.”

**Claim.** The README cites ClassicalGroups §3A.1, §3A.2 and §3A.3 at these places:
- `README.md:34–48`, 62 and 298–321 (Scope and the supplier contract);
- 564 and 581 (CG.0.4);
- 686 and 1102 (layer Dependencies);
- 878 and 906 (CG.1.4);
- 910, 919–932 and 950 (CG.1.5);
- 1001–1005 and 1041 (CG.1.7).

Main (e2d1245) has no Layer 3A. Only the open revision of ClassicalGroups (#1192, another author's, head 47ca68e) defines these sections. Under the overlap rule, citing a revision's numbering makes the revision a dependency, and the description must name it. Neither the depends-on block nor the merge-order paragraph does.

The Dependencies sentence is also still false for #856 and #966 (the previous R03). The description says “none” and calls everything else a consumer, while the README consumes ArithmeticGaloisRepresentations §7.3 and PELModuli §§M0.5–M0.8, both of which are open.

This also completes step 4 of the previous R01's repair, which this head did not carry out.

**Witness.** On main, `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md` has headings Layer 0–6 at lines 175–310 and no 3A heading. At #1192 the same file has “### 3A.1 Tori, lattices and differentiation” at line 658. `scratch/overlaps.md` flags all six §3A ids: “#1192 … must merge first”.

**Exact repair.** Make three edits to the description; the merge-order paragraph is the worker's to regenerate.
1. Add `- [ ] #1192 ClassicalGroups (revision defining Layer 3A)` to the depends-on block.
2. Put #1192 before #1492 in the merge-order paragraph, and replace “Every pull request in this chain is ours” with a sentence that names #1192 as the one chain member by another author.
3. Replace the Dependencies sentence with the open suppliers consumed: ArithmeticGaloisRepresentations (#856) §7.3, PELModuli (#966) §§M0.5–M0.8, and ClassicalGroups revision (#1192) §§3A.1–3A.3. Delete “everything else named in the README is a consumer”.

Tested at the heads named: §3A.1, §3A.2 and §3A.3 are at #1192 lines 658, 749 and 801. `SimilitudeGroup.GSp` is at #856 `ArithmeticGaloisRepresentations/README.md:4618`, and `IntegralPELDatum.siegel` is at #966 `PELModuli/README.md:662`.

## Previous findings

- R01 — partly repaired: the README now cites “[ClassicalGroups §3A.1] … for the Sp torus, Borel subgroup and dominant chamber” (line 581), §3A.3 throughout CG.1.4–CG.1.5 and §§3A.2–3A.3 in CG.1.7. No ClassicalGroups Layer 3 or 5 citation remains. Step 4, naming #1192 in the description, was not done and is carried as R01.
- R02 — repaired: the README now says “The complex Sp₂g statements behind these (commutator, surjectivity, kernel highest weight ω_k, simplicity and dimension) are ClassicalGroups §3A.3's. This section owns their ν-twisted GSp form …” (lines 919–923). “proved here over Z and Q” is gone.
- R03 — not repaired: the description still reads “In open pull requests of ours: none … everything else named in the README is a consumer”. Carried as R01.

## Verified sound

**Gate, order, build.**
- Gate rerun at e26957b, with every check at 0:

  ```text
  gate ClassicalGroupsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- Dependency check with `--movable`:

  ```text
  depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
  ```

  It has no UPWARD, CYCLE or `moved:` line.
- Merge order: ArithmeticGaloisRepresentations is line 58, PELModuli line 115 and ClassicalGroupsPartII line 199. ClassicalGroups and ReductiveGroups are on main.
- `git diff --stat origin/main...HEAD` outside the folder is empty. `git diff --stat ce69dfc HEAD` touches only `README.md` (74+/67−). The folder holds README.md, Suggested.lean and metadata.toml.
- `lake env lean TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` exited 0 in 4 s. Its only warnings were `declaration uses sorry` at lines 109, 130 and 136.
- A scratch copy with `#check @…` for all 21 declarations elaborated cleanly (exit 0). The headline types are unchanged:
  - `fullInvariantPresentation : ∀ g, ∃ e, …`
  - `mem_positiveSubring : ∀ g, 0 < g → …`
  - `positiveInvariantPresentation : ∀ g, 0 < g → ∃ e, …`

  No section binder is lost.
- The module docstring mentions neither ClassicalGroups nor §3A, so the change leaves it accurate.
- Headlines and padding are unchanged since the r5–r7 probes. Three headlines are stated, and the docstring names the eight that cannot be stated at the pins and the missing GSp coordinate Hopf algebra.

**The open revision consumed** (#1192 ClassicalGroups, head 47ca68e, rechecked before writing):
- §3A.1, lines 666–671: the Sp torus diag(t,t⁻¹), the Borel `[[A,B],[0,(Aᵀ)⁻¹]]` and the positive roots ε_i−ε_j, ε_i+ε_j and 2ε_i. Line 737 gives the dominant tuples λ₁≥⋯≥λ_r≥0.
- §3A.2, lines 751–756: for G smooth connected over an algebraically closed field of characteristic zero, G-stable subspaces are the Lie-stable ones, with the Hom form.
- §3A.3:
  - line 806: native ω;
  - line 811: Ω_J=Σf_i∧e_i, the bivector of every symplectic basis;
  - line 815: the commutator (r−k)·id;
  - line 817: κ_k surjective for k≤r+1;
  - lines 817–820: P_k simple, of highest weight ω_k, with highest vector e₁∧⋯∧e_k and dimension binom(2r,k)−binom(2r,k−2);
  - lines 891–893: the U(g)-submodule generated by the highest tensor is the simple module of the summed weight.
- Lines 52–56 and 1890–1896 state exactly the division this head adopts: Part II consumes the Sp statements of §§3A.1–3A.3 and owns only their GSp forms. Ownership now has one owner per object.
- All three changed anchors match the GitHub slugs of the headings at lines 658, 749 and 801.

**Supplier names resolved.** The five Lean-name leads in `scratch/citations.md` are supplier declarations at open heads, not pinned names:
- `SimilitudeGroup.GSp`: #856 `ArithmeticGaloisRepresentations/README.md:4618`.
- `IntegralPELDatum.siegel`: #966 `PELModuli/README.md:662`.
- `IntegralPELDatum.toRational`: line 690 of the same file.
- `PELDatum.similitudeGroup`: line 724.
- `RationalPELDatum.coordinatePoints`: line 725.

**Sources: the seeded sample where it falls in changed text.**
- *Construction and proof* of CG.0.4, step 2 (rewritten). The base ε_i−ε_(i+1), 2ε_n and the roots ±2ε_i, ±ε_i±ε_j are `milne line 19149–19153` (Summary 21.98, printed p.461). This agrees with §3A.1 line 671 and with the computed restriction below.
- *Construction and proof* of CG.1.5, steps 1–2 (rewritten). `sternberg line 5039–5058` (§7.9, printed p.131, page marker at line 5018) asserts surjectivity of contraction for j=2,…,n and identifies the kernels as the fundamental representations. Yu's (7.1.1) and Remark 7.1.1 are at `yu line 3736–3760` (printed p.64). The §3A.3 statements now consumed are listed above.
- The *Construction and proof* prose of CG.1.7 (rewritten). The Cartan-product passage is `sternberg line 5024–5029` (p.131).
- *Consequences to check* of CG.0.4, CG.1.4, CG.1.5 and CG.1.7 are unchanged and agree with the recomputed values: f_i has weight (1,−δ_i)=e_t−e_i, and dim P₂=5 at g=2.
- The README flags no locator as unverified.

**Adversarial table.**
- Rows marked (new) were computed this round, by hand and with exact-integer scripts. The scripts use the exterior algebra with basis order e₁,…,e_g,f₁,…,f_g, both our J=[[0,I],[−I,0]] and the native `Matrix.J`, and sp₂g={[[A,B],[C,−Aᵀ]]: B, C symmetric}.
- Rows marked (r7), (r6) or (r5) are statements the diff leaves untouched. They are carried from PRREVIEW-ClassicalGroupsPartII~7 with the values computed there or in rounds 5–6.

| Statement (line) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| (new) Scope and contract: §§3A.1–3A.3 consumed (34–48, 298–321) | revision 47ca68e; g=1..4 | Contract wording vs §3A lines 666–671, 751–756 and 806–820, 891–893: each consumed clause is present. κ₂(Σa_i∧b_i)=Σω(a_i,b_i)=g | Resolves at the revision; description R01 |
| (new) Native symplectic basis (e_i,−f_i) has bivector −Ω (927) | g=1..4 | ω_nat(e_i,−f_j)=δ_ij and ω_nat(e_i,e_j)=ω_nat(f_i,f_j)=0. Σe_i∧(−f_i)=Σf_i∧e_i=Ω_J=−Ω (machine) | True; retain |
| (new) Negating the form negates κ and L and keeps the commutator (318–321, 927) | g=1..4, every k=0..2g, every basis wedge | κ_nat=−κ and L_nat=−L on every wedge. [κ,L]=(g−k)·id for both forms on every wedge (machine) | True; retain |
| (new) Surjectivity for k≤g+1, descent through integer matrices (37, 310, 910, 931) | g=1..4 | rank κ_k = binom(2g,k−2) for every 2≤k≤g+1. The largest surjective k is 2, 3, 4, 5 (=g+1); k=g+2 fails | True, bound sharp; retain |
| (new) CG.1.5 step 2: dim P_k, e₁∧⋯∧e_k∈P_k (932) | g=2,3,4 | dim ker κ_k vs binom(2g,k)−binom(2g,k−2): g=2: 5=5. g=3: 14,14. g=4: 27,48,42 (equal). κ_k(e₁∧⋯∧e_k)=0 for 2≤k≤g | True; retain |
| (new) CG.1.4 comparison: same kernel as §3A.3 (876–881) | g=1..4 | κ_ours=−κ_nat entrywise, so the kernels are equal | True; retain |
| (new) CG.0.4 step 2: restricted roots and §3A.1 Borel (564) | g=2, torus diag(z,t/z) | Upper-block GSp roots: (0,(1,−1)), (−1,(2,0)), (−1,(1,1)), (−1,(0,2)). At t=1 these are ε₁−ε₂, 2ε₁, ε₁+ε₂ and 2ε₂, which is §3A.1 line 671. The simple roots (0,(1,−1)) and 2e_g−e_t restrict to ε₁−ε₂ and 2ε₂, the base of Milne 21.98 | True; retain |
| (new) New Check L₁(e₂), κ₃ (939) | g=2 | L₁(e₂)=e₁∧f₁∧e₂=−e₁∧e₂∧f₁. Pair (1,3): (−1)³·1·e₂=−e₂, so κ₃L₁(e₂)=+e₂=(g−1)e₂. The unsigned formula gives +e₂ on both orderings, which are negatives (machine) | Discriminating; retain |
| (new) Native-form Check at g=1 (942) | g=1, k=0 | L_nat,0(1)=f₁∧e₁=−e₁∧f₁. κ_nat,2(f₁∧e₁)=ω_nat(f₁,e₁)=+1=g, which is §3A.3's own Check at line 860 | Consistent; retain |
| (new) Characteristic-2 Check rewording (944) | g=2 over 𝔽₂ | κ₂(e₁∧f₁+e₂∧f₂)=2≡0. The row (1 at e₁∧f₁, e₂∧f₂) has rank 1, so L₀(ν)⊂ker of dimension 5 | Retain |
| (new) CG.1.7: orbit span = U(sp)-span = §3A.3 Cartan component (1000–1006) | g=1 u=(2); g=2 u=(1,0),(1,1),(2,0),(2,1),(2,2); g=3 u=(1,1,1),(2,1,1) | dim U(sp)·(highest tensor) = 3; 4, 5, 10, 16, 14; 14, 70. The Weyl C_g dimensions are 3; 4, 5, 10, 16, 14; 14, 70 (machine) | True; retain |
| (new) GSp(ℂ)=ℂ^×·Sp(ℂ) on tensors (933, 1003–1005) | g=1, h=diag(2,3); ⊗P_k^(a_k) | ν(h)=6, h=√6·h₀ with ν(h₀)=1. The scalar c acts by c^(Σk·a_k) on ⊗P_k^(a_k), a single power | True; retain |
| (new) Dependencies lines (686, 1102) | Needs lines of CG.0.4, CG.1.2, CG.1.4, CG.1.5 and CG.1.7 | CG.0: Layer 0 and §3A.1 cited (581). CG.1: Layers 0–2 (784, 829, 950), §3A.2 (1041) and §3A.3 (906, 950, 1041); no Layer 3 or 5 remains | Consistent; retain |
| (r7) CG.1.4 sum formula vs ι-form (866–869) | g=1,2,3, every k | Σ_(a<b)(−1)^(a+b−1)ω(v_a,v_b)(…) equals Σ_iι(f_i*)ι(e_i*) on all wedges | Retain |
| (r6) GSp owner and §7.3 contract (75–92, 325–339) | m=1; J=0; multiplier one | −`Matrix.J`=J₂ of §7.3. J=0 makes ν undetermined. gᵀ(−MJ)g=−MJ ⇔ `mem_iff'` | Retain |
| (r6) PELModuli contract (340–357) | g=0,1 | g=0: ℚ→End(0) is not injective, so there is no `toRational`. g=1 is faithful; ⟨hx,hy⟩=r⟨x,y⟩ ⇔ hᵀJh=rJ | Retain |
| (r6) CG.0.1 steps 1–4 and Checks | g=2, 300 similitudes and 2000 random 4×4; A=0; g=0 | The two equations agree in 2000/2000 cases. (2I)J(2I)ᵀ=4J. h=diag(A,3A⁻ᵀ) passes; 3A⁻¹ fails | Retain |
| (r6) CG.0.2 transfer, diag(2,3) Check | g=0,1 | diag(2,3) has s=6, while h⁻ᵀ gives 1/6 | Retain |
| (r5) `fullInvariantPresentation` (Lean 109) | g=0,1,2,3 | g=0: ⊤≅ℤ[t±1]. g=1: z²+(t/z)²↦X²−2T. 20/50/50 orbit sums, 0 failures | Retain |
| (r5) `mem_positiveSubring` (Lean 130) | g=1,2,3; g=0 | 32/165/380 weights, 0 mismatches. g=0: t has cone value 1 but B₀=ℤ | `0<g` needed; retain |
| (r5) `positiveInvariantPresentation` (Lean 136) | g=1,2,3; g=0 | 12/30/30 orbit sums, every t-exponent ≥0. g=0: t∉B₀ | Retain |
| (r5) E_k, F_k triangularity and augmentations | g=1..4 | E_(2g)=t^g and E_(2g+1)=0. F-augmentations: g=3: 6,14,14; g=4: 8,27,48,42 (this round's kernel dimensions agree) | Retain |
| (r5) Orbit recurrence; `exteriorCharacter`/`fundamentalCharacter` | n=0..7; k=−1,0,1 | p₀=2, pₙ=xpₙ₋₁−tpₙ₋₂. E₋₁=0, E₀=1, F₁=E₁ | Retain |
| (r5) `permWeight`/`flipWeight` | g=3 cycle; g=1 | u∘σ⁻¹ sends z₁ to z₂; (−1,2)↦(1,−2) | Retain |
| (r5) CG.0.3 parity and roots | ((1,0…),0); g=1 | d−Σu=−1 is odd. α_g=(−1,2δ_g), ⟨α_g,α_g^∨⟩=2 | Retain |
| (r5) CG.1.2 cell, 𝔽₄, pair swap | (2,3,5,7); [[α,1],[1,0]] | det [[5,15],[10,37]]=35; α²−α=1; JJJᵀ=J | Retain |
| (r5) CG.3.4 occurrence | (−1,2,0) | d=0 but m<0, so it does not occur | Retain |
| (r5) CG.1.1/CG.2.6 at g=1; CG.1.8 | V⊗V; z=a, t=ab | x²=z²+2t+(t/z)²; t^m z^u=a^(m+u)b^m | Retain |

Remarks on text this round did not touch: none.

## Not verifiable

- I judged the pull-request description from the worker's quoted copy (`scratch/pull-request.md`), not from the live page.
- ArithmeticGaloisRepresentations (#856) §7.3 and PELModuli (#966) §§M0.5–M0.8 were not re-read in full, because their citations are untouched. Their declaration names were resolved at those heads with `roadmaps grep` (above).
- Ownership against open pull requests was checked through the sibling checkout of #1192 and `scratch/overlaps.md`. No other open pull request changes this roadmap or drops an id it cites. No source text was inaccessible, and no fetch was needed.

## Source issues

- **Misprint** in sternberg at §7.9, printed p.131 (`sternberg line 5054`): the source subtracts binom(2n,2j−2) in the contraction-kernel dimension; it should be binom(2n,j−2), the dimension of Λ^(j−2)V; affects a stated result.
- **Misprint** in sternberg at §7.9, printed p.132 (`sternberg line 5123`): the source gives numerator j in the second difference-factor product; it should be j−1, since the factor for r₂−r_j is (j−1)/(j−2); affects the proof.
