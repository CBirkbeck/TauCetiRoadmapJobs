# Review of CstConjectureForDaggerVarieties (pull request #1759 at 3ed5d07)

**Verdict:** accepted

Incremental re-review of the 87 lines changed since 2ad4b9a (README supplier contracts, §§2.3, 2.9, the new §2.10, nine `*Needs:*` lines and four layer dependency paragraphs; one docstring bullet in `Suggested.lean`). The changed passages, everything that cites them, the two previous findings, the gate, the dependency check and the elaboration were checked as in a full review. No P1 or P2 finding remains. Two P3 notes follow.

## R01 (P3) — Plan gap entries lag the README's re-homed contracts

**Location:** `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:110` and `:112` (“What VectorBundlesAndIsocrystalsPartII must provide (gap:qbc-pairs)”, “… (gap:natural-period-hom)”), against `packages/CstConjectureForDaggerVarieties/design/plan.json`.

**Claim:** The README now states `gap:qbc-pairs` and `gap:natural-period-hom` under VectorBundlesAndIsocrystalsPartII and no longer states `gap:galois-period-hom-vanishing` at all (its content is consumed from Part II §0.9). The plan's `gaps` list still names VectorBundlesAndIsocrystals VB3 as the supplier of the first two and still carries the third with supplier PadicHodgeTheory §§0.1–0.3 and 3.7. The two re-homed slugs count as declared (same slug in both places), so this is not a blocking gap defect; but the intake reads the supplier from the plan, so the announcements would go to the parent roadmap instead of Part II, and PadicHodgeTheory would be asked for a vanishing statement this roadmap no longer needs.

**Witness:** `plan.json` entries `qbc-pairs | VectorBundlesAndIsocrystals | VB3 …`, `natural-period-hom | VectorBundlesAndIsocrystals | VB3 …`, `galois-period-hom-vanishing | PadicHodgeTheory | §§0.1–0.3 and 3.7`; README grep for `galois-period-hom-vanishing` returns nothing.

**Repair:** On the board package, retire `galois-period-hom-vanishing` from the plan's `gaps` and change the `supplier`/`section` of `qbc-pairs` and `natural-period-hom` to VectorBundlesAndIsocrystalsPartII (§§2.7–2.8 and §§6.6–6.7 respectively, matching README lines 110 and 112), so the intake announces each gap on the job that owns it. No README change is needed.

**Repair test:** After the edit, the 23 README `gap:` slugs and the plan's `gaps` agree slug by slug and supplier by supplier; Part II §0.9 (board design README line 238) supplies `Hom_(G_L)(tʲB_dR⁺/tᵏB_dR⁺,B_dR)=0` for j<k over general K, so nothing is lost by retiring the third slug.

## R02 (P3) — `properRigidLogResolution` names no declaration of PadicHodgeTheory

**Location:** `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:82`: “§2.7, Primitive comparison and integral finiteness, supplies `properRigidLogResolution`: for a reduced proper rigid X/C …”.

**Claim:** The repair replaced this name in the gap sentence (line 84, now “the analytic log-resolution morphism of PadicHodgeTheory §2.7”) and in §3.4's `*Needs:*` (“PadicHodgeTheory §2.7, Analytic log resolution”), but the supplier paragraph at line 82 still presents a backticked declaration name. PadicHodgeTheory at its open head has the target as the prose paragraph **Analytic log resolution** of §2.7 (its README line 614) and declares no `properRigidLogResolution` in its README or `Suggested.lean`; the only occurrence of the name anywhere is this line.

**Witness:** `roadmaps grep --fixed 'properRigidLogResolution'` returns a single hit, `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:82`; PadicHodgeTheory `Suggested.lean` at its head has no match.

**Repair:** Replace “supplies `properRigidLogResolution`:” by “supplies its Analytic log resolution target:”, as the gap sentence and §3.4 already do. The described content (proper Y→X isomorphic over U, Y smooth proper, reduced boundary a strict normal crossings divisor, standing C the completion of an algebraic closure of a finite extension of Q_p) matches that paragraph and needs no change.

**Repair test:** After the edit no backticked name of a supplier declaration remains that the supplier does not declare; the resolver and the gate's readme-ids check are unaffected (the name was never one of this roadmap's own).

## Previous findings

- R01 — repaired: §2.3 (line 521) now asserts “Only this constructed functorial filtration … reasonableness of the middle Pair is not required”; §2.9 needs “§2.3, only its constructed filtration and graded-piece identifications; §2.8; …”; the new §2.10 proves reasonableness and intrinsic uniqueness after §2.9, with needs §2.3, §2.9, §1.4, §1.2 and Part II §§4.2–4.3 and 5.3. The target order is now constructed filtration → syntomic splitting → reasonableness/uniqueness, with no cycle; the Layer 3, 4 and 5 dependency paragraphs say “using §§2.1–2.7, without the splitting and reasonableness branch §§2.8–2.10”, and no `*Needs:*` line of Layers 3–5 cites §§2.8–2.10 (checked by grep over lines 667–1041). The displaced negative control (D†⨿D) now sits in §2.10 where reasonableness is asserted.
- R02 — repaired: a `### From TauCetiRoadmap.VectorBundlesAndIsocrystalsPartII` block (lines 102–112) consumes §0.9 (with §0.8 density), §§2.3, 2.7–2.8, 4.2–4.3, 5.1–5.3 and 6.6–6.7; the `galois-period-hom-vanishing` request is gone, and `qbc-pairs` and `natural-period-hom` are reduced to the dense finite-length presentation and the VS/TVS Hom comparison, which Part II does not state. The Scope paragraph (line 14) names the sections Part II owns; the `*Needs:*` lines of §§0.7, 0.8, 2.3, 2.5, 2.6, 2.9, 2.10, 5.1 and 5.4 and the Layer 0, 2, 3, 4 and 5 dependency paragraphs cite Part II by section. The residual plan-side desynchronisation is R01 above (P3).

## Verified sound

**Gate and dependency check.** The gate was rerun on this worktree at 3ed5d07 and passed:

```text
gate CstConjectureForDaggerVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The movable dependency check with the content checkout returned

```text
depcheck: 204 roadmaps, 1642 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line (eight edges more than at 2ad4b9a, the new Part II edges). VectorBundlesAndIsocrystalsPartII is at position 110 of the merge order, this roadmap at 164; the Part II design is a board package whose design review is accepted (2026-10-26), its README's only mention of this roadmap is as a downstream consumer (board design README line 1326), so there is no reverse edge. The diff outside the roadmap folder is empty.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/CstConjectureForDaggerVarieties/Suggested.lean` from the pinned worktree exited 0 with no output. The file still has the single `import Mathlib`, the module docstring, the namespace and no declarations; the only change is the renamed §2.3 bullet and the new §2.10 bullet in the not-statable list, which names the missing carriers (analytic torsion period Pair, reasonable presentation, qBC subobject and quotient carriers). With zero declarations the signature-binder, padding and duplicate-name probes have zero cases. §2.10 is a corollary of §2.9 on the same carriers, so it is not a statable headline omitted.

**Supplier citations resolved this round** (all at the Part II board design README, `packages/VectorBundlesAndIsocrystalsPartII/design/README.md`, the only copy; Part II is in no open pull request and not on main):

| Cited | Resolved | Says what the README consumes |
|---|---|---|
| §0.8 Density of algebraic constants | line 224 | K̄ dense in B_dR⁺, general discretely valued K; it is a `*Needs:*` item of §0.9 as the README states. |
| §0.9 Continuous equivariant Hom in de Rham periods | line 238 | Continuous Q_p-linear G_K-equivariant Hom, general K, not assumed period-linear; Hom(tʲB_dR⁺/tᵏB_dR⁺,B_dR)=0 for j<k. With j=0,k=1 this is Hom(C,B_dR)=0; applied to L it is what §5.1 uses. |
| §2.3 Topological Vector Spaces | line 475 | Functors Symp_C→LH(C_Q_p) with the uniform boundedness condition, pointwise exact structure; CN25 Definition 4.1. |
| §2.7, §2.8 Completed balanced period Modules; Period Pairs in the left heart | lines 545, 573 | B_m-model realization and torsion period Pairs as left-heart cokernels of injective continuous B_m-linear maps, no strictness, algebraic quotient M₂/M₁; CN25 Definition 4.4. |
| §4.2, §4.3 Reasonable topological B_m-modules; Reasonable Pairs and same type | lines 793, 819 | Fréchet or c-compact countable inductive limit of B_m-Banach models; same-type presentations; matches the Conventions paragraph (line 29). |
| §5.1 Filtered quasi–Banach–Colmez spaces | line 1076 | Three-piece filtration, height = sum of the two outer BC heights, classical BC embedding preserving height and curvature, no finite dimension for the middle Pair; CN25 Definitions 4.5, 4.7. |
| §5.2, §5.3 Positive BC spaces have no maps into a reasonable Pair; Intrinsic filtration of a reasonable qBC | lines 1106, 1123 | Hom_TVS(Y,P)=0 for Y of curvature >0 and reasonable P; W_{>0} largest positive sub-BC, W_{<0} largest negative quotient BC, for reasonable qBC; CN25 Propositions 4.25–4.26. |
| §6.6, §6.7 Vanishing and exactness in nonpositive curvature; Height and period Hom/Ext ranks | lines 1281, 1298 | Ext¹_VS(W,B_dR)=0 for curvature ≤0; rank h(W)=ht(W)+rank Ext¹_VS(W,B_dR), the Ext term vanishing for curvature ≤0; CN25 Lemma 3.26, Proposition 3.27. |
| PadicHodgeTheory §2.7 Analytic log resolution (open head, via `roadmaps show`) | its README lines 600, 614 | Proper Y→X isomorphic over a dense smooth Zariski open U, Y smooth proper, boundary strict normal crossings; standing C over a finite extension of Q_p, so the C-extension contract remains a gap. Name drift is R02. |

**Minimality of the two retained Part II gaps.** Part II's Hom/Ext comparison targets (§§4.7–4.16, 5.4) compare continuous model Hom, period-Module/Pair Hom and TVS Hom for reasonable models and Pairs, and §6.1 defines h(W)=Hom_VS(W,B_dR) in VS only; no target of Part II identifies Hom_TVS(W,B_dR) or Hom_TVS(W,B_st) with the VS Hom for finite BC W (B_dR and B_st are not bounded period Modules, so §§4.10–4.13 do not apply). The dense finite-length presentation of a torsion Pair appears only inside the proof route of §5.3 (for reasonable qBC, into a negative BC), not as a stated target for every torsion Pair into B_dR or B_st. Both `needs` sentences are precise, single-statement and hypothesis-complete.

**Seeded locator audit, where the sample falls in the diff.** The changed passages touch two of the fifteen seeded targets (§0.7 and §5.4, `*Needs:*` and proof-route wording only); the other thirteen are unchanged and keep the round-1 audit. All page markers were recomputed from the cached CN25 text.

| Locator (new or moved in the diff) | Inspected | Support |
|---|---|---|
| CN25 Proposition 2.14(iv), p.11, line 500 (Part II §0.9 import) | line 500 on page 11 (page 11 = lines 475–522) | Hom_{G_K}(tʲB_dR⁺/tᵏB_dR⁺,B_dR)=0 stated; proof over K by density and continuity, applicable to every finite L. |
| CN25 Lemma 3.26 and Proposition 3.27, pp.19–20, lines 921–955 (Part II §§6.6–6.7 import) | lines 921–955 | Ext¹_VS(W,B_dR)=0 for curvature ≤0; rk h(W)=ht(W)+rk Ext¹. Page 20 starts at line 924, so “pp.19–20” is right. |
| CN25 Definitions 4.4–4.5, pp.21–22, lines 992–1025 (Part II §§2.7–2.8, 5.1 import) | lines 992–1025 | Modules, Pairs, qBC filtration, height = ht(W_{>0})+ht(W_{<0}). Page 22 starts at line 1019. |
| CN25 Proposition 4.26, p.28, lines 1432–1445 (§2.10 and Part II §5.3) | lines 1432–1445 | Largest positive sub-BC and largest negative quotient-BC for reasonable qBC; the proof's dense finite-length submodule step is at line 1441. Lines 1443–1445 are on printed page 29, so “pp.28–29” would be exact; not a finding. |
| CN25 Proposition 5.20, p.38, line 1896 (gap:natural-period-hom) | line 1896 | States Hom_VS of the bounded kernel; Theorem 9.8 uses it for Hom_TVS, which is exactly the VS/TVS comparison the gap requests. |
| CN25 Remark 6.23(ii), p.45, lines 2229–2233 (§2.10 t-shift) | lines 2229–2233 | τ_{≤i}F^{r+1}RΓ_dR = tF^rRΓ_dR for i≤r, giving F̃^{r+1,i}≅tF̃^{r,i}; the one-sided truncation misprint is already in the round-1 errata. |
| CN25 Corollary 7.9(i), p.47, line 2350 (§2.3) | lines 2350–2362 | (H^{r,i})_{>0}≅h¹(H^{i−1}_HK{−r}), (H^{r,i})_{=0}≅Ker(F^{r,i}→Bⁱ)=(F^{r,i})_{B_dR⁺-tors}, (H^{r,i})_{<0}≅h⁰(Hⁱ_HK{−r}); no reasonableness asserted there. |
| CN25 Proposition 7.15, pp.49–50, lines 2424–2457 (§§2.9–2.10) | lines 2424–2457 | r≥dim X; the Pair (Ŷ_{i−1},Ẑ_i)=Ẑ_i/d(F^rRΓ^{i−1}) is Ker(F^{r,i}→Hⁱ_dR)=A^{r,i}, then reduced mod tʳ since the image contains tʳẐ_i; “(reasonable)” is asserted. Page 50 starts at line 2453. |
| CN25 Theorem 9.8 proof, p.57, lines 2829–2835 and 2841–2853 (gap:qbc-pairs, gap:natural-period-hom, §5.4) | lines 2821–2853 | A^{r,i} a B_dR⁺-Pair containing a dense inductive limit of finite-length Modules, h(A)=0 by Corollary 3.18; the final step applies Proposition 5.20 (a VS statement) to TVS Hom. Page 58 starts at line 2854. |

**Adversarial table.** Rows for statements the diff leaves untouched carry the round-1 values (marked “r1”); rows for the changed statements are recomputed here. B⁺ means B_dR⁺, B_k=B⁺/tᵏ, D the closed dagger disc, A=O(D)/C.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| Conventions (N, φ, degree, dual; ramification; S₃ action; complexes and height) | r1: Nφ(e₁)=pe₀=pφN(e₁); N(e₁−ue₀)=2e₀≠0 even at p=2; Q₂(√2): N(u_π)=−1/2, N(u)=−1; gh(e₁)=e₂≠hg(e₁)=e₃; ht(Q_p)=1, ht(B₁)=0. | r1: correct; unchanged. |
| Conventions, qBC paragraph (changed context: uniqueness only with reasonableness) | For the qBC H¹¹(D)=(0,A,0): A reasonable (compact type), so the filtration 0⊂0⊂H is the unique one, largest positive sub-BC 0 and largest negative quotient 0. For the qBC H¹¹(D†⨿D)=(0,A⊕O(D)/C,0): the middle Pair is not reasonable, and the Conventions assert only the given filtration. | Consistent with §§2.3 and 2.10; no change. |
| §0.1–§0.6 | r1 values (rank 0 and trivial line lattices tᵐB⁺ ↦ O(−m); acyclic/weakly admissible (true,true,false)/(false,true,false); X_st¹=(B_cris⁺)^(φ=p), kernel Q_p t; slope-one line at r=0 has (B_cris⁺)^(φ=p⁻¹)=0). | r1: correct; unchanged. |
| §0.7 period-valued Hom from an eigenspace (Needs changed to Part II §6.7) | Trivial line, r=1: W=X_st¹=U₁, 0→Q_p t→W→C→0, curvature ≤0; ht(W)=ht(Q_p t)+ht(C)=1+0=1; Part II §6.7 gives rank_B_dR Hom_VS(W,B_dR)=1=rank M∨⊗B_dR. M=0: both sides 0, ht=0. Negative control: W=C/Q_p has ht −1 and Ext¹ rank 1, so rank h=0=−1+1; the “curvature ≤0” qualification in the Needs line is necessary. | Values agree; the cited section states exactly the rank formula used. No change. |
| §0.8 period-valued Hom from an acyclic kernel (Needs changed to Part II §6.6) | Trivial line, r=1, L=B⁺: quotient (M⊗B⁺)/tL=C, Ext¹_VS(C,B_dR)=0 by §6.6 (C is finite-length, curvature 0), Hom_VS(C,B_dR)=0 by VB3; so Hom(V,B_dR)=Hom(X,B_dR)=B_dR, rank 1. φ(e)=pe, L=B⁺e: V=0 and both Homs 0 against rank 1, excluded by acyclicity. | Values agree; no change. |
| §0.9, §1.1–§1.6 | r1 values (B_2 —t→ B_2 kernel tB_2, cokernel B_1; point B⁰=B⁺, Fʳ⁰=tʳB⁺, Aʳ⁰=0; disc A¹¹=A; v(1,1)=1−1=0 against 2; Fʳ⁰→Fʳ⁺¹⁰ iso). | r1: correct; unchanged. §1.4 is the t-shift input of §2.10 and its point check (B⁺ ↦ tB⁺) is the instance reused there. |
| §2.1, §2.2 | r1 values (point at (0,1): φ=p⁻¹, lattice tB⁺, degree 0, (h⁰,h¹)=(Q_p t,0); disc (1,1): h¹₀=0). | r1: correct; unchanged. |
| §2.3 constructed functorial qBC filtration (statement changed: reasonableness removed) | P¹ at (0,1): (0,0,Q_p(1)); at (1,1): (0,0,0). D at (1,1): (0,A,0), height 0. Point at (0,0): (0,0,Q_p), height 1. Part II §5.1 recognises each triple as a qBC without any reasonableness hypothesis; for D†⨿D at (1,1) the triple (0,A⊕O(D)/C,0) is still a qBC with the given filtration, although its middle Pair is not reasonable. | Statement true at the weaker generality now claimed; the Needs line's §5.1 is the right owner. No change. |
| §2.4 two-failure exact sequence (route wording) | r1: point 0→0→Q_p t→tB⁺⊕X→B⁺→0→0; disc 0→0→A→A→0→0→0. The route uses only the constructed filtration. | r1 values; no change. |
| §2.5 height formula (Needs changed to Part II §5.1) | Point: 1=1+0+0. Disc: 0=0+0+0 with dim_Q_p A=∞. O(−1): Euler height 0−(−1)=1. Part II §5.1 defines ht=ht(W_{>0})+ht(W_{<0}), which is the additivity used. | Values agree; no change. |
| §2.6, §2.7, §2.8 | r1 values (point r=0: all five conditions hold, H_syn¹(pt,0)=0; formal test O⊕O(−1)[−2] fails in degree 2; [B_cris⁺ —1−φ→ B_cris⁺] has (Q_p,0)). | r1: correct; unchanged (§2.6 Needs now names §5.1 for recognition). |
| §2.9 noncanonical syntomic decomposition (statement extended: P_i identifies with Aʳⁱ) | Point r=i=0: Q_p=0⊕Q_p⊕0, P₀=0=A⁰⁰. Disc r=i=1: A=0⊕0⊕A, P₁=A=A¹¹. From CN25 lines 2449–2457: Ẑ_i/d(FʳRΓⁱ⁻¹)=ker(Fʳⁱ→Bⁱ)=Aʳⁱ and the mod-tʳ reduction does not change the Pair since the image contains tʳẐ_i. | The added identification is what the source's proof constructs; no change. |
| §2.10 reasonableness and intrinsic uniqueness (new) | Shift Aⁿⁱ→Aⁿ⁺¹ⁱ: for y∈Fⁿ⁺¹ⁱ with image 0 in Bⁱ, y=tx with x∈Fⁿⁱ unique (t iso for n≥i), and t·c(x)=0 forces c(x)=0 since Bⁱ is finite free; conversely tA⊆A. So the shift is a B⁺-linear isomorphism. Disc, i=r=1: A¹¹=Ω¹(D)⊗̂(B⁺/t), so internal t is 0 while dT↦t dT lands in H¹(F²)=tΩ¹⊗̂B⁺/t²Ω¹⊗̂B⁺≠0. Point i=r=0: s=0, A=0, filtration 0⊂0⊂Q_p, height 1. D†⨿D: O(D) is Fréchet and not normable, hence not an LB space; O(D†) is compact type and not Fréchet; the sum is neither, so not reasonable; each summand is. s=max(r,dim X) with r≥i keeps every intermediate n≥i. | Route and Checks compute correctly; the only inputs are §§1.2, 1.4, 2.3, 2.9 and Part II §§4.2–4.3, 5.3, all earlier. No change. |
| §3.1–§3.3, §3.5–§3.7 | r1 values (countably many points not small; annulus×annulus (1,2,1); A¹ analytic H¹=O(A¹_an)/C≠0; [Q_p→Q_p] and [B⁺→B⁺] both acyclic; tube radius ε=|π| with T=1 outside). | r1: correct; unchanged. |
| §3.4 almost proper complements (Needs renamed) | r1: Z=∅ proper case; Z=X everything 0; nonreduced thickening same U. The renamed input is PadicHodgeTheory §2.7's Analytic log resolution paragraph (R02 for the stale backticked name). | r1 values; no change to the mathematics. |
| §4.1–§4.7 | r1 values (constant tower lim¹=0, tail tower lim¹=(∏Q_p)/(⊕Q_p)≠0; P¹×disc degrees Q_p,H¹(D),Q_p(−1),H¹(D)(−1); (∏Q_p)⊕(∏B⁺)→∏B⁺ onto with diagonal kernel). | r1: correct; unchanged. |
| §5.1 differential-error vanishing (Needs changed to Part II §§0.8–0.9) | Disc over K, i=1: c↦ψ(T⊗c) is a continuous G_K-map C→B_dR; Part II §0.9 with j=0,k=1 gives Hom(C,B_dR)=0; over L=K(ζ_p) the same statement applies with K replaced by L (general base). i=0: source 0. | The cited section states the needed vanishing over every finite L/K; no change. |
| §5.2, §5.3 | r1 values (disc A¹¹≠0 with both equivariant Homs 0; point dual modules Fⁿʳ and K). | r1: correct; unchanged. |
| §5.4 geometric recovery (route wording and Needs changed) | Point: Hom_TVS(Q_p,B_st)=B_st, Hom_TVS(Q_p,B_dR)=B_dR; the VS/TVS gap is the identity here. Disc degree 1: A=O(D)/C; finite-length C-subspaces have dense union; Hom_VS from each into B_dR is 0 (VB3), so by continuity Hom_TVS(A,B_dR)=0=Hom_(B⁺)(0,B_dR); Hahn–Banach gives nonzero continuous Q_p-linear maps on C-points, excluded because they are not natural. | The two retained gaps are exactly the presentation and the VS/TVS step; no change. |
| §5.5, §5.6 | r1 values (λ=t⁻¹ admitted by Q_p t alone but excluded by x with θ(x)=1; good-reduction vs Tate curve both rank 2). | r1: correct; unchanged. |
| gap:qbc-pairs (rewritten) | Pair [0→B_m]: the finite-length submodules exhaust B_m, which has length m, so the presentation is trivial. Pair A=O(D)/C over B₁: finite-dimensional C-subspaces have dense union; after completed base change to Λ the algebraic tensors are dense. Each piece has zero Hom into B_dR and B_st (CN25 Corollary 3.18), so the continuity clause gives the vanishing CN25 line 2834 uses. | Precise, single-statement, not supplied by Part II (only a proof-route step of §5.3). Declared under the same slug in the plan (supplier name lags: R01). |
| gap:natural-period-hom (rewritten) | W=Q_p: Hom_TVS(Q_p,B_dR)=B_dR=Hom_VS(Q_p,B_dR), evaluation at 1. W=C: both are 0 (Corollary 3.18 for VS; a natural TVS map factors through the same evaluation). W=U₁: VS rank 1 by §6.7; the TVS side is what the gap asks to be identified with it. | Precise and minimal: Part II's §§4.10–4.16 and 5.4 compare Homs into reasonable Modules/Pairs, not into B_dR or B_st. |
| Part II §0.9 import (new supplier paragraph) | j=0,k=1: Hom_{G_L}(C,B_dR)=0; j=−1,k=0: Hom(t⁻¹B⁺/B⁺,B_dR)=0 (the twist C(−1)); j<k required, since j=k gives the zero source trivially and j>k is not a quotient. | Matches CN25 line 500 and Part II line 238; no change. |

**Internal consistency of the repair.** How-to-read (line 156), Scope (lines 14 and 16), the Layer 2 dependency paragraph (line 665: “Only §§2.8–2.10 … use de-rham-quotient-splitting or overconvergent-crystalline-complex; §§2.1–2.7 require only the constructed filtration”) and the Layer 3–5 dependency paragraphs agree with the per-target `*Needs:*` lines: §2.9 needs §2.8 and the splitting contract, §2.10 needs §2.9, and nothing in §§2.1–2.7 or Layers 3–5 needs §§2.8–2.10. The 23 README gap sentences each name a supplier and a single statement with its hypotheses; none has supplier `none`; none asks for what Mathlib, Tau Ceti, a main roadmap, an open head or the Part II design already states (checked for the three slugs the diff touched; the other 20 are unchanged from round 1). No process word, pull-request number, LaTeX delimiter or local path was introduced.

**Ownership against open work.** Searched by object (qBC filtration, torsion period Pairs, reasonable Pairs, VS/TVS period Hom comparison, equivariant Hom into B_dR) with `roadmaps grep` over main and the indexed open heads and in the board packages: the only other owner of these objects is the VectorBundlesAndIsocrystalsPartII design, which this head now cites, and whose downstream paragraph names this roadmap as its consumer. CohomologyComparisonsPartII and AdmissiblePairsAndPadicHodgeStructures at their given heads do not build the analytic qBC filtration or the dagger recovery theorems. Open pull requests not listed with files in the brief were not searched.

## Not verifiable

- The Part II sections are a design on the board (accepted design review, not a merged roadmap and not in any open pull request); their statements were read at that design README and are contracts, not proved library theorems. The two retained gaps and the 21 unchanged ones remain conditional contracts, as in round 1.
- CN25 Proposition 7.15's parenthetical “(reasonable)” for the Pair (Y_{i−1},Z_i) is asserted without a separate proof in the source; the README's §2.9 carries it as a target with its own proof obligation (compact-type quotients and closed subspaces), as accepted in round 1 and unchanged here.

## Source issues

- none new in the passages checked this round; the round-1 register (CN25 Lemma 5.4 proof, Proposition 5.20 and its proof, equation (6.17), Corollary 6.19, Remark 6.23(ii), Theorem 8.1(c) proof, Proposition 8.3 proof, Lemma 8.13 proof, Remark 9.9(ii)) stands.
