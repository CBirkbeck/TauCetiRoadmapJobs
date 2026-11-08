# Answer to human review: ClassicalGroupsPartII

One review (roed-math, 2026-11-06T06:19:45Z) with three points, H01–H03. The repairs are in `TauCetiRoadmap/ClassicalGroupsPartII/README.md` only, in commit `110ca61` on top of `00a13fd`. `TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` is unchanged byte for byte. Line numbers marked "old" are at `00a13fd`; unmarked line numbers are at `110ca61`.

## H01 (roed-math) — applied

The complex Sp₂g statements now come from ClassicalGroups §3A.3: the contraction/inverse-form-wedge commutator, surjectivity of contraction for 1≤k≤g, and the kernel's highest weight ω_k, simplicity and dimension binom(2g,k)−binom(2g,k−2) (Scope L32–49; supplier contract L286–308; CG.1.4 L818–824; CG.1.5 L853–877). The Lefschetz-string proof of surjectivity (old L837) is deleted. CG.1.4–CG.1.5 keep only what §3A.3 lacks: the ν-valued GSp-equivariant contraction and raising map, the sign transport to J=−JFin, descent from ℂ to Q to every characteristic-zero K through integer matrices, and the transfer of simplicity from Sp₂g to GSp₂g (point criterion of CG.1.2, End=Q via CG.1.6, then semisimplicity over K̄). CG.1.7 now says that its rational Cartan component, extended to ℂ, is §3A.3's Cartan component (L942–948).

- §3A.3 at the ClassicalGroups head (L757–758) states that the commutator exists but does not give its value. The supplier contract here pins it: `κ_(k+2)∘L_k − L_(k−2)∘κ_k = (g−k) id` for every k≥0, with L the wedge by the bivector Σa_i∧b_i of a symplectic basis, so that κ₂(Σa_i∧b_i)=g (L292–297). Under that normalization the value is the same for the native form and for J=−JFin (computed below).
- New Checks in CG.1.5 (L884–888): the sign transport; the rank of κ₂ over Q and ℂ; a characteristic-2 negative control for the descent; the correct surjectivity bound; and the need for semisimplicity. A new Check in CG.1.7 (L961) shows that GSp-spans and Sp-spans agree only when scalars act by a single power.

## H02 (roed-math) — applied

ClassicalGroups "Layer 3 supplies the Sp maximal torus and highest-weight comparison" (old L272) is replaced as follows: §3A.1 supplies the torus diag(t,t⁻¹), the lattice Z^g and the dominant tuples; §3A.2 supplies the group–Lie comparison; §3A.3 supplies the classification by Cartan components (L286–303). The classification goes to §3A.3 because at the ClassicalGroups head it sits there (L770–781), and §3.5 hands it to Layer 3A (L519–523). "Layer 5 supplies the Sp fundamental dimension" (old L273–274) is replaced by §3A.3 (head L757–760). The *Needs* lines and both layer *Dependencies* lines are updated to match: CG.0.4 L509 and L526, Layer CG.0 L631, CG.1.4 L849, CG.1.5 L892, CG.1.7 L983, Layer CG.1 L1044.

- Evidence that this is content moved by the revision, so that citing the head is the correct repair. On main, ClassicalGroups has no contraction, primitive-kernel or binomial-dimension statement: "contraction" occurs only at L39 and L43, as the V⊗V→ℂ remark. Its Sp material is the one classification bullet at L265 and the instruction at L307 to give the Sp product forms. The Layer 3 and Layer 5 anchors survive at the head, which is why the overlaps listing did not flag them, but the Sp content they were cited for now lives in Layer 3A.
- The pull-request description cannot be edited by this job. The ClassicalGroups revision is listed below as a dependency, for the worker to name.

## H03 (roed-math) — answered

Levi-character theory is not in this roadmap's scope: no version of the README (`753d6b5`, `cb5deca`, `00a13fd`, `110ca61`) mentions Levi or parabolic subgroups. What it reserves is the GSp rational representation ring R_g(K), the constituent subring C_g(K) and their integral Laurent presentations. The sentence at the ClassicalGroups head (L46–48) is therefore right about "the GSp representation-ring" and should drop "and Levi-character theory". No edit was made here.

## Same pattern: LieHighestWeight Layer 4 (lead from the overlaps listing)

The README cited LieHighestWeight Layer 4 at old L50, L276–281, L934 and L995. The LieHighestWeight head `beea1d2` no longer has Layer 4. Its Scope (L11–30) tells consumers to cite the native declarations instead, and main's own Layer 4 (L537–541) already consumes those same declarations. The citation now names `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` and `TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` (Scope L58–62). They are checked at the content pin `2fd255d` (`TauCeti/Algebra/Lie/HighestWeight/Existence.lean` L234, `FiniteDimensional.lean` L122) and at the branch pin `a91d3aa` (L240 and L126). This roadmap reaches them only through ClassicalGroups §3A.3, so the "From TauCetiRoadmap.LieHighestWeight" contract is deleted, and no dependency on the LieHighestWeight revision remains.

## Dependencies, ownership and overlaps

- **Ids only an open revision defines:** ClassicalGroups Layer 3A, §3A.1, §3A.2 and §3A.3. They exist only at the head `4dcaac5` of the ClassicalGroups revision (kim-em), so this roadmap now depends on that revision: the worker names it in the merge-order paragraph and the PR description, as H02 asks. Every other ClassicalGroups id cited here (Layers 0, 1, 2 and 4) exists on main and at that head.
- **Why this dependency is admissible:** the revision moves content this roadmap cited (Sp torus and classification from Layer 3 to Layer 3A, head §3.5 L519–523), which is a renumbering. The duplicate object of H01 is settled with ClassicalGroups, which is earlier in the supply direction, as owner.
- **Ownership:** ClassicalGroups owns the complex Sp₂g contraction blocks and Cartan components. This roadmap owns their GSp form over every characteristic-zero field and the Q-form of the Cartan component. No declaration of `Suggested.lean` changed.
- **Notions moved down from later roadmaps:** none.
- **Overlaps:** no open pull request changes this roadmap. The ids other roadmaps cite here (CG.0.1, CG.0.4, CG.0.5, CG.2.4–CG.2.6) are unchanged. The ReductiveGroups pull requests closest in vocabulary drop no id cited here. Their scopes were not re-compared in this round, because the review does not touch the ReductiveGroups contracts.

## Adversarial pass on the statements this repair adds or changes

Notation: q_i=e_i∧f_i, Ω=Σe_i∧f_i, ω(e_i,f_j)=δ_ij for J=−JFin. The contraction and wedge matrices were computed exactly over Q in the standard exterior bases.

| Statement | Instances | Values (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Contract: κ_(k+2)L_k−L_(k−2)κ_k=(g−k)id for every k≥0 (J=−JFin) | g=1,2,3; every k from 0 to 2g | matrix equality in all 3+5+7 degrees. g=1: k=0 gives 1=1; k=2 gives −q₁=(1−2)q₁. g=3, k=6: −3=3−6 | holds | value pinned in contract L292–297 |
| Same identity for the native form vᵀ(`Matrix.J`)w with bivector −Ω | g=1,2,3, all degrees | identical (g−k) in every degree. Negating κ alone at g=1, k=0 gives −1≠1 | holds only if both maps change | Check L884 |
| Symplectic basis of the native form is (e_i,−f_i), bivector −Ω | g=1 | ω_native(e₁,f₁)=−1, so ω_native(e₁,−f₁)=1; κ'₂(−Ω)=1=g | holds | L870 |
| κ_k is the negative of the native contraction (CG.1.4) | g≥1, e₁∧f₁ | ours κ₂=1; e₁ᵀ(JFin)f₁=−1 | holds, same kernel | L820–822 |
| Surjectivity of κ_k (earlier wording: "k≤g is necessary") | g=1,2,3, k=2…2g+2 | ranks: g=1, k=2: 1/1, k=3: 0/2. g=2, k=2: 1/1, k=3: 4/4, k=4: 1/6. g=3, k=2: 1/1, k=3: 6/6, k=4: 15/15, k=5: 6/20 | onto exactly for k≤g+1; the earlier claim was false | Check reworded, L887 |
| dim P_k=binom(2g,k)−binom(2g,k−2) by rank–nullity | (g,k)=(2,2),(3,2),(3,3),(2,3) | kernels 5,14,14,0; formula 6−1, 15−1, 20−6, 4−4 | holds; the kernel is 0 for k>g | none |
| Descent ℂ→Q→K through integer matrices | g=2, κ₂ row | (0,1,0,0,1,0) on (e₁e₂,e₁f₁,e₁f₂,e₂f₁,e₂f₂,f₁f₂): rank 1 over Q and over ℂ, kernel 5 | holds | Check L885 |
| Characteristic zero needed for the splitting | g=2 over 𝔽₂ | rank still 1, but κ₂(Ω)=2=0, so L₀(ν)⊂ker κ₂; the 5-dimensional kernel contains a stable line | split and simplicity fail | Check L886 |
| GSp weight of e₁∧⋯∧e_k pulls back to ω_k via (m,u)↦(u,2m+Σu) | g=2 | e₁∧e₂: (0,(1,1))↦((1,1),2). e₁: (0,(1,0))↦((1,0),1). f₁∧f₂: (2,(−1,−1))↦((−1,−1),2), the lowest weight | holds | L875 |
| One-dimensional End plus semisimplicity gives absolute simplicity | V at g=1; Λ²V at g=2; upper Borel B₂ on K² | End dims: 1; 2 (P₂⊕ν, dims 5 and 1, not isomorphic); 1 for B₂ (diagonal and commuting with [[1,1],[0,1]] forces scalar), yet K e₁ is stable | semisimplicity necessary | Check L888 |
| GSp₂g(ℂ)=ℂ^×·Sp₂g(ℂ) | g=1, h=diag(2,3) | s=6, c=√6, det(h/c)=6/6=1. Over Q, diag(I,2I) has no such c (existing CG.0 Check) | holds over ℂ only | none |
| CG.1.7 component ⊗ℂ = §3A.3 Cartan component | g=1, u=(2); ν⊕1 | e₁⊗e₁: GL₂-span and SL₂-span are both Sym²V, dim 3. n+1: SL₂-span 1, GL₂-span 2 | needs scalars acting by a single power | Check L961 |
| CG.1.7 at u=0 | empty tensor | both are the unit (head §3A.3 L789) | holds | L943 |
| CG.0.4: at t=1 the roots are §3A.1's Sp roots, and dominance fixes the simple roots | g=2 | e₁−e₂=(0,(1,−1))↦ε₁−ε₂; 2e₂−e_t=(−1,(0,2))↦2ε₂; e₁+e₂−e_t↦ε₁+ε₂ (head L649). Pairings λ₁−λ₂≥0, λ₂≥0. With −2ε₂ as simple root, λ₂≤0 contradicts | holds | L509 |
| Native Lie theorems as cited | hypotheses at the pin | Existence.lean L95–99: Field, CharZero, IsAlgClosed, IsKilling, FiniteDimensional, Cartan, finite M, irreducible. FiniteDimensional.lean L71–76: IsTriangularizable, irreducible. All hold for sp₂g over ℂ | holds | L58–62 |
| `Matrix.J` and `Matrix.symplecticGroup` as quoted in the contract | Mathlib pins 1b1ccf4 and 6b7abb3 | `fromBlocks 0 (-1) 1 0`; carrier A*J*Aᵀ=J (SymplecticGroup.lean L58–60, L101–103) | holds | L286–287 |

## Signature check

All 24 declarations of `Suggested.lean` got a `#check @name` appended temporarily to the file. The file was elaborated once with `lake build TauCetiRoadmap.ClassicalGroupsPartII.Suggested` (exit 0) and then restored; `git diff` is empty. All 24 elaborated types match `signatures.md` exactly. The file has no section `variable`s. `mem_positiveSubring` and `positiveInvariantPresentation` carry `0 < g` explicitly, and the README states both for g≥1 (L1334, L1382). `fullInvariantPresentation` is stated for every natural g in both the file and the README (L1194). Nothing changed.

## Build and gate

- **Build** at `110ca61`: `lake build TauCetiRoadmap.ClassicalGroupsPartII.Suggested` completed successfully (8976 jobs, exit 0). The only warnings are three `declaration uses 'sorry'`, at L116, L137 and L143 (the three headline theorems). The previous attempt's EEXIST failure on `.lake/packages` came from the shared Lake pin directory being absent on the host. That pin is now provisioned, and the build ran without any change to Lake files.
- **Gate** (exit 0): `gate ClassicalGroupsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Depcheck** (`--movable`, at `110ca61`): `depcheck: 239 roadmaps, 2358 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citations:** `roadmaps resolve` finds no cross-roadmap citation and no Lean name of the README unresolved. Lean names outside TauCetiRoadmap were checked by hand at the pins above.
- **Sources:** no new source was cited or fetched, and `needs-references.toml` was not written. The Sternberg locator kept in CG.1.5 (§7.9, pp.131–133) covers the C_n contraction kernels: `sternberg` line 5151.
