<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6889863079 -->
Red team round 2 pass b (claude) of cdb927a

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) LocallyAnalyticRepresentationsOfLocalGroups is consumed with no supplier contract

   **Location.** `packages/HigherHidaAndColemanTheory/README.md:1151` — "*Needs:* … LocallyAnalyticRepresentationsOfLocalGroups §1.4; LocallyAnalyticRepresentationsOfLocalGroups §5.1."; also README.md:1149 and the Dependencies of Layer 6 (README.md:1315).

   **Claim.** README.md:9: "The following objects are imported from their existing owners; their exact hypotheses and missing extensions are specified under Exact supplier contracts."

   **Witness.** The section "Exact supplier contracts" (README.md:48–302) has 27 "### From …" subsections and none for LocallyAnalyticRepresentationsOfLocalGroups; the name occurs only at README.md:1149, 1151 and 1315. Every other roadmap named in a *Needs* line has its subsection (checked mechanically, 124 distinct roadmap edges).

   **Repair.** Insert, in alphabetical place before "### From TauCetiRoadmap.OverconvergentAutomorphicForms":

   "### From TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups

   - §1.4: in the category of admissible locally analytic representations of a locally F-analytic group, every morphism is strict with closed image, and a closed invariant subspace of an admissible representation is admissible. Used in §6.5(1), for a compact open subgroup G₁ of M(F), to prove that the image of each differential is closed.
   - §5.1: the locally analytic parabolic induction of a reductive group is a closed subspace of the locally analytic functions, of compact type, and is admissible when the inducing representation is inflated from an admissible representation of the Levi. Used in §6.5(1) for the Borel subgroup of M and a locally analytic character: the induction from B∩G₁ to G₁ is the closed G₁-stable subspace of the functions supported in B(F)G₁."

   Tested on the instance: with this subsection every roadmap named in a *Needs* line has a contract; the two statements are items (ii)–(iii) of that roadmap's §1.4 and items (i)–(ii) of its §5.1 at its open head, and they are exactly the two facts the route at README.md:1149 takes from Jones-BGG Lemma 22 and the proof of Proposition 24.

2. **F02** (P3) the edge SmoothRepresentationsOfLocalGroups §SR.2.3 is missing from Layer 9's Dependencies and from the contracts

   **Location.** `packages/HigherHidaAndColemanTheory/README.md:1613` — "*Needs:* §9.1; SmoothRepresentationsOfLocalGroups §SR.0.2; … SmoothRepresentationsOfLocalGroups §SR.2.3; …"; README.md:1702 (Dependencies of Layer 9); README.md:291–300 (the contract list).

   **Claim.** Each layer's Dependencies paragraph is the union of its targets' external *Needs*, and each consumed section is described in the contracts.

   **Witness.** Computed for Layers 1–9, external *Needs* minus Dependencies: empty for Layers 1–8; for Layer 9 it is {SmoothRepresentationsOfLocalGroups §SR.2.3}. The contract list has bullets for §SR.0.2, 1.2, 4.1, 1.4, 2.2, 3.1, 3.4, 4.5 and none for §SR.2.3; its §SR.2.2 bullet does not name the geometric lemma that README.md:1611 cites from it.

   **Repair.** (i) In the Dependencies of Layer 9 add "SmoothRepresentationsOfLocalGroups §SR.2.3". (ii) In "### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups" replace the §SR.2.2 bullet by "§SR.2.2: normalized parabolic induction (*parabolic-induction*), induction in stages, Jacquet functors and the geometric lemma (*geometric-lemma*): r_Q∘i_P has a natural filtration indexed by W_L\W/W_M." and add after it "§SR.2.3: Jacquet's lemma on invariants (*jacquet-invariants*): for a compact open K₀ with an Iwahori decomposition for (P,P̄) and admissible V, V^(K₀)→(V_N)^(M₀) is surjective and intertwines [K₀aK₀] with δ_P(a)⁻¹π_N(a) for a∈M contracting N; used in §9.5 with K₀=Kli(p), P the Klingen parabolic and a=diag(p²,p,p,1)."

   Tested on the instance: the difference set of Layer 9 becomes empty; at the supplier (its SR.1.4, *klingen-positive-hecke*) U₁=[Kli diag(ℓ²,ℓ,ℓ,1) Kli], the element a of README.md:1611, which scales the three root coordinates of N_Kli by p, p, p² and so contracts N_Kli as (2) of *jacquet-invariants* requires.

3. **F03** (P3) §4.7: the passage of the Hecke action to R_w^ε is taken from derived-category data that do not determine it

   **Location.** `packages/HigherHidaAndColemanTheory/README.md:805` — "so they act on the filtered colimit over the level modulo p^m and then on the derived p-adic limit R_w^ε of §4.3 … the relations of §3.8 are identities of correspondences at each level and persist on the limit."

   **Claim.** The ring homomorphisms T^S⊗A_m→End_(D(A_m)) of §3.8, compatible with the transition maps, give a ring homomorphism T^S→End(R_w^ε) and then T^S→End_(D(Λ))(M_w^ε).

   **Witness.** §3.8 supplies endomorphisms in D(A_m) and commuting squares in D(A_m). For R=Rlim_m R_m the Milnor sequence 0→lim¹_m Hom(R,R_m[−1])→End(R)→lim_m Hom(R,R_m)→0 shows that such a system determines an endomorphism only modulo lim¹, and relations only modulo lim¹; the same holds for the colimit over the level. README.md:672 closes exactly this step for C_w by a bijection of endomorphism rings; §4.7 has no counterpart.

   **Repair.** Replace the two quoted sentences by: "They are transported to M_w^ε through endomorphism rings, as in §3.8. M_w^ε is perfect over the compact noetherian ring Λ (§4.5), and the ideals J_(m,n)=ker(Λ→ℤ/p^m[T(ℤ_p)/T_n]), for the torus levels T_n of the tower of §4.3, are cofinal among the open ideals; the groups Hom(M_w^ε,M_w^ε⊗^L_Λ Λ/J_(m,n)[−1]) are finite, Λ/J_(m,n) being a finite ring, so lim¹ vanishes and reduction is a bijection End_(D(Λ))(M_w^ε)→lim_(m,n) End_(D(Λ/J_(m,n)))(M_w^ε⊗^L_Λ Λ/J_(m,n)). By §§4.1 and 4.4–4.5 with the anti-equivalence of CompletedCohomologyPartII §3.12, M_w^ε⊗^L_Λ Λ/J_(m,n) is the dual of the weight-zero ordinary Igusa complex of torus level T_n over ℤ/p^m, on which T^S⊗A_m acts by §3.8 compatibly in (m,n). The compatible finite-level actions therefore define the ring homomorphism T^S→End_(D(Λ))(M_w^ε), and through the anti-equivalence its action on R_w^ε." In the route (README.md:807) replace "Transport the actions of §3.8 through §§4.3–4.5 as above" by "Transport the actions of §3.8 to M_w^ε through the bijection of endomorphism rings above". Add "§4.1; §4.4; CompletedCohomologyPartII §3.12" to the *Needs* of §4.7 (the last is already in Layer 4's Dependencies).

   Tested on the instance of the first Check of §4.7: Λ=ℤ₃[[X]], M=Λ[0], J_(m,n)=(3^m,(1+X)^(3^n)−1); End(M)=Λ=lim Λ/J_(m,n), Hom^(−1)=0, and the degree character (3, 6, 1 on the three double cosets at ℓ=2) is the unique lift of its residues, the relation 3²=6+3·1 holding in ℤ₃. If the supplier contract is instead meant to give the action functorially in the correspondence before passing to D, say so in the statement and in `gap:coherent-correspondences`; the text as written starts from the D(A_m)-level homomorphisms of §3.8.

4. **F04** (P3) §9.9 defines w_r and κ_r with a coset convention and has no Checks

   **Location.** `packages/HigherHidaAndColemanTheory/README.md:1688` — "Minimal left representatives are w_r=(1,…,n−r,n+1,n−r+1,…,n), r=0,…,n, of length r, using (w x)_i=x_(w⁻¹i). … the weights κ_r=−w0M w_r(ν+ρ)−ρ".

   **Claim.** The section fixes a coset and action convention for U(n,1); the route says "checking the left-coset and inverse-action conventions".

   **Witness.** §9.9 has no **Checks.** block (41 blocks in the README, none in §9.9), and the one worked value (n=2) cannot detect the inverse convention being used for w_1, which is an involution. With (w x)_i=x_(w i) the representative w_2=(3,1,2) gives (−6,1,−1) at ν=(4,2,0), which is not M-dominant.

   **Repair.** Add after the route of §9.9:

   "**Checks.**

   - n=1, ρ=(1/2,−1/2), ν=(2,0): κ_0=−(5/2,−1/2)−ρ=(−3,1) and κ_1=−(−1/2,5/2)−ρ=(0,−2), of lengths 0 and 1; ν_(w_0)(κ_0)=−(−5/2,1/2)−ρ=(2,0) and ν_(w_1)(κ_1)=−w_1⁻¹(1/2,−5/2)−ρ=(2,0).
   - Action convention, n=2, ν=(4,2,0), ν+ρ=(5,2,−1). With (w x)_i=x_(w⁻¹i), w_2(ν+ρ)=(2,−1,5) and κ_2=(0,−2,−4), M-dominant. With (w x)_i=x_(w i) one gets (−1,5,2) and (−6,1,−1), not M-dominant since −6<1; w_1 is an involution and does not see the difference.
   - Duality. With 2ρ_nc=(1,1,−2), κ_0∨=−w0Mκ_0−2ρ_nc=(4,2,0)=κ_2(−w0ν) and κ_1∨=(4,−1,3)=κ_1(−w0ν), where −w0ν=(0,−2,−4): Serre duality exchanges r with n−r and ν with −w0ν, as §1.1 and §9.1 state for C₂."

   Tested: each value recomputed from κ_w(ν)=−w0M w(ν+ρ)−ρ and ν_w(κ)=−w⁻¹w0M(κ+ρ)−ρ of §1.1; the general identity is κ_w(ν)∨=w(ν+ρ)−ρ=κ_(w0M w w0)(−w0ν).

Four P3 findings (S01–S04), none P1 or P2. Two of them (S01, S02) are omissions left by the round-1 repair itself. The whole of `packages/HigherHidaAndColemanTheory/README.md` (1741 lines) and of `packages/HigherHidaAndColemanTheory/Suggested.lean` (41 lines) was read.

## Round-1 findings at this head

| Finding | State | Witness at `cdb927a` |
| --- | --- | --- |
| 1a/F01 (P2) presentation line bundles | repaired | README.md:34 "A locally principal closed subscheme D=V(I) carries a chosen presentation: an invertible sheaf L_D and a map s_D:L_D→O whose image is I"; README.md:43 (Check, ranks (1,1,1) against (1,0,0)); README.md:515 "the two natural maps of the presentations of Conventions … which need not be injective"; README.md:525 "O(D+)=O, and the natural map O→O(D+) is multiplication by e_a". Recomputed: σ*(e_a)=(1,1,0), T(0,1,0)=(0,0,1). |
| 1a/F02 (P1) vector-bundle refinement unowned | repaired (differently) | README.md:401–407, items (1)–(5); README.md:59–63 names `AdicCoefficientsAndComparisons` L2/strict-from-dense, L2/cartier-boundary-cofinal, L2/vector-bundle-extension-cofinal. All three ids exist at that roadmap's open head with the hypotheses quoted (noetherian affine S, no reducedness), and that roadmap is earlier in the merge order. README.md:459 and :495 cite §2.2(3) and §2.2(4). |
| 1a/F03 (P3) §8.1 Checks | repaired | README.md:1459–1461. Recomputed: y/x∉ℤ_p[x,y]/(xy−p) since y≠0 in 𝔽_p[y]; Ext¹(B/t^k,B)=B/t^k of dimension k; over (ℤ/9)[x], 1 and 3 ∉(x). |
| 1b/F01 (P1) §6.5 route and algebraic input | repaired | README.md:1144 item (0) with `TauCeti.VermaModule`; README.md:1145–1147 items (1)–(3); README.md:1149 route; Checks README.md:1165–1166. Jones-BGG locators verified (below). Two omissions remain: S01. |
| 1b/F02 (P3) LieHighestWeight Layer 3 | repaired | The subsection is gone; the only remaining mention is README.md:20 ("LieHighestWeight states no resolution by Verma modules"), which is a scope statement and no edge. README.md:56 cites `TauCeti.VermaModule` (Verma.lean:195) and its universal property (:305); both lines verified at the pin. |
| 1b/F03 (P3) scheme-level gap on analytic targets | repaired | The *Needs* of §§5.4, 5.4a, 5.5, 5.7, 6.1, 6.6b, 6.10, 7.1, 9.6 no longer contain `gap:coherent-correspondences`; §§5.4, 5.7, 6.1, 6.10, 9.6 list AdicSpacesPartIII §R3.8; §9.7 (README.md:1661) lists AutomorphicBundlesPartII §3.2. |
| 1b/F04 (P3) §3.7 operator convention | repaired | README.md:660 "T(ℚ_p) acts on the right-hand side through the unnormalized operators t_naive, units acting by χ, and the superscript ord is the direct factor on which the normalized operator t_κ=ν_w(κ)(t)t_naive is invertible"; README.md:666 (p=3: 3↔1 ordinary, 1↔1/3). |
| 1b/F05 (P3) §9.5 route | partly repaired | README.md:1611: the route now computes 8/2=4 double cosets and uses Jacquet's lemma for a=diag(p²,p,p,1). The new edge §SR.2.3 was added to the *Needs* (README.md:1613) only: S02. |

No repair introduced a false statement. The two omissions are S01 and S02.

## Dependency check

```text
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `AdicCoefficientsAndComparisons` and `LocallyAnalyticRepresentationsOfLocalGroups`, the two suppliers added by the round-1 repair, are earlier in the merge order.

## Verified sound

Declarations of `Suggested.lean`: 0 (one empty namespace, single `import Mathlib`, no `set_option`, no `#check`), so there is no `#check @name` file to elaborate and none was run. Its docstring names all ten headlines of README.md:308 with the carrier each lacks; none is statable at the pins (no Shimura variety, Igusa tower or coherent cohomology of one exists in either library). Padding: none.

| Suggested.lean declaration | Section, variables, instances | README side | Lean side |
| --- | --- | --- | --- |
| none | namespace `TauCetiRoadmap.HigherHidaAndColemanTheory`, no variables | 10 headlines (§§4.6, 4.8, 4.9, 8.4, 5.8, 7.1, 7.5, 7.6, 8.5, 9.8) | 10 headlines named as not statable, 0 stated |

The README has no bold target headings; its targets are the 69 numbered sections (67 with a proof route; §2.1 carries its route in the statement and §5.1 states no target). All 69 were read, with 165 Check bullets in 41 blocks.

Adversarial table (values recomputed in this pass; "=" means the README's value was reproduced):

| Statement | Instance | Computed on each side | Result |
| --- | --- | --- | --- |
| Conventions, presentation | {a,b,c} over 𝔽₂, D=V(e_a) | O(D) ranks (1,1,1); e_aO ranks (1,0,0); colim of ×e_a is O_a | = |
| §2.2(3) blow-up | D+=V(I), D−=V(J) | centre V(IJ)=Xbar∖X, so inverse image of X is X; IJ invertible gives I, J invertible; second centre = p1*D+∪p2*D− by the two inclusions | holds |
| §2.2 against the source's definition | C=Cbar×(X×X) | p1(C)⊂X since p1*D−⊂p2*D−; complement of p1*D+∪p2*D− equals preimage of X×X | consistent |
| §2.2 Check ℙ³ | Frobenius, D−={x̄} | (x_i^p)¹⊂(x_i)^p, s=1/p; kernel of O(−1)³→O at x̄ has rank 2 and 3 generators | = |
| §2.2 Check compact | irreducible Cbar | int of a proper closed set is ∅, so D±∈{∅,Xbar} | = |
| §3.2 unit part | GL₂, κ=(2,0), t=diag(2,3), diag(2,6) | ν_id=(−1,−1), ν_long=(0,−2); 1/6, 1/9, c=3/2; 1/12, 1/36, c=3 | = |
| §3.2 trace | GSp₄, t₂ | (−3,−3;0)·(−½,−½;−½)=3 | = |
| §3.8 relation | ℓ=3 and ℓ=2 | 16=12+4; degree character 9=6+3, both 0 mod 9; all-ones gives 1≠4 | = |
| §3.8 End bijection | C perfect over O | H^(−1)(REnd⊗A_s) finite, lim¹=0 | holds |
| §5.2 standard pair | m=n=0, depth s | U∩B(0,cl s)⊂Z∩U⊂B(0,cl 0); B(s,cl 0)⊂U⊂B(0,−1) | holds |
| §5.2 relative bound | GL₂, p=3, C=2 | z=3 (v=1) breaks the absolute bound at m=0; z=9 (v=2) breaks U⊂B(2m,−1) for m≥1 | = |
| §5.2 exponent | f(z)↦f(3z), f(9z) | eigenvalues 1,3,9 and 1,9,81; slope ≤2 and ≤4 parts both of dimension 3 | = |
| §5.2 pro-Banach | f_n=3^(−n/2)zⁿ | norm 1 at radius 3^(−1/2); 3, 9, 27 at radius 3^(−1/4) | = |
| §5.5 Check | GSp₄, κ=(5,3;−8), t₂ | 0 and 3; κ∨=(0,−2;8) pairs with v(t₂⁻¹) to 3 | = |
| §5.5 torus | empty root cone | a≤b iff a=b, so both bounds read v(η)=κ | consistent with §1.2 |
| §6.1a Checks | Δ of order 2; 𝔸²/±1 | image 2ℤ₂; fibre of dimension 3 against degree 2 | = |
| §6.4 | [A→A] by t | fibre at 0 has H⁰=H¹=F, Tor₁ in total degree 0 | = |
| §6.5(0) | SL₂ κ=1; GL₂ κ=(a,b) | s·1=−3, e·fv₁=v₁; s·κ=(b−1,a+1), restriction −(a−b)−2 | = |
| §6.5 slopes | t=diag(p,p⁻¹), κ=1 | 0,2,4 untwisted; −1,1,3 after the twist −1 | = |
| §6.6a Check | ℙ¹, D={∞} | dimensions 1, 0, 0, 2 | = |
| §6.6b identities | general; C₂ at w=1 | a_an+w⁻¹2ρ_nc=w⁻¹ρ−ρ=−b_an; (3,3)+(−3,−3)=0 | = |
| §6.6b column | κ=(5,3;−8), v=s0 | ν_alg=(0,−2;8), ν_v=(−3,1;8), κ_w(ν_v)=(2,6;−8); thresholds 0, 3 | = |
| §6.6b(3) route | E₂^(0,q), q maximal | no differential out (target has p>0); those in come from second index >q, zero after localization | holds |
| §6.7 Check | general κ | ν_v=(2−k₁,4−k₂;k₁+k₂), pairing −3 with t₂ | = |
| §7.6 singular | id∈Cκ+ | Cκ+=Stab(μ)=W_J with J noncompact simple roots (κ+ρ is M-regular), W_J⊂MW, so a length-one chamber exists | holds |
| §7.6 ↔ §5.5 ↔ §6.6b | twist −ν_alg | a_an−ν_alg=w⁻¹w0Mκ; 0−ν_alg=w⁻¹w0M(κ+ρ)+ρ; − side: ν_alg=w⁻¹(κ∨+ρ)−ρ | consistent |
| §8.1 Checks | xy=p; 𝔽₃[t]; (ℤ/9)[x] | as in the round-1 table above | = |
| §9.1 | ν+ρ=(a,b) | (3−ν₂,3−ν₁), (3−ν₂,ν₁+1), (2−ν₁,ν₂), (ν₁,ν₂) | = |
| §9.3 | κ=(5,3;−8) | A_w=(0,2),(−2,2),(3,−3),(−5,−3); t1: 6,6,11,11; t2: 3,4,4,8; wrong basis 1,2,7,11; a_w pairings 3,3 | = |
| §9.5 | (1,1,9,9), p=3 | products 1,9,9,81; eigenvalues 1/3,3,3,27; ratios 1, 9, 1/9 | = |
| §9.5 route | Klingen | 8/2=4 double cosets; a=diag(p²,p,p,1) central in M_Kli (t=p², a=p, a²/t=1) | holds |
| §9.6(4) | bounds −3, 0 | p^(k+1)U on the third term: ≥k−2, ≥k+1; H⁰ iso and H¹ injective below k+1 | = |
| §9.6 Checks | f=Σ2^m z^(2^m−1); R/(y²) | antiderivative coefficients 1; Tor₁=L; cokernel L | = |
| §9.8 | valuations (0,0,k+1,k+1) | ratios 0, ±(k+1), ≠1 for k≥1; products 0, k+1, k+1, 2k+2; U₂ values 2, 10, 10, 18 | = |
| §9.9 | n=2, ν=(4,2,0) | (−3,−5,2), (0,−5,−1), (0,−2,−4); inverse convention fails at w_2 | = ; S04 |
| Layer Dependencies | Layers 1–9 | Needs minus Dependencies: ∅ for 1–8, {§SR.2.3} for 9 | S02 |

Pinned declarations checked at the pins, file and line: 17 of 17 (`Module.End` :33, `zpow_sub₀` :402, `HasDerivedCategory` :74, `DerivedCategory` :87, `CondensedMod` :41 and :43, `CondensedMod.IsSolid` :83, `IsHeckeTriple` :75, `HeckeCoset` :157, `HeckeRing` :189, `HeckeCosetModule.instRingHeckeRing` :484, `HeckeCosetModule.mul_comm_of_antiInvolution` :459, `TauCeti.Compactification` :58, `commonRefinement` :97, cofilteredness :50, `blowup` :120, `isProper_blowupToBase` :191, `isEffectiveCartier_comap_blowupToBase` :184, `TauCeti.VermaModule` :195, its universal property :305). `TauCeti.Compactification` is quoted correctly: an open immersion, quasi-compact, followed by a proper map, with no density. `VermaModule` is under `[CharZero K] [IsKilling K L] [FiniteDimensional K L] [H.IsCartanSubalgebra] [IsTriangularizable K H L]`, as README.md:56 says. Mathlib's Hecke directory has `Defs.lean` only and no product, as README.md:52 says.

Sibling citations: 124 distinct roadmap edges in *Needs* lines, each matched against the contract list (2 unmatched: S01, S02). Content compared at the supplier's current text for the sections the round-1 repair added or changed: AdicCoefficientsAndComparisons L2 (3 targets), LocallyAnalyticRepresentationsOfLocalGroups §§1.4, 5.1, SmoothRepresentationsOfLocalGroups SR.1.4, SR.2.2, SR.2.3, CompletedCohomologyPartII §§3.11–3.12 (10 sections); the others were resolved by the worker's citation check (none found nowhere) and by the round-1 passes.

Ownership: `roadmaps grep` for the BGG resolution by Verma modules finds only AutomorphicBundles §9.1 (relative, type C₂) and a reference line of LieHighestWeight; LocallyAnalyticRepresentationsOfLocalGroups Layer 4 states category O, generalized Verma modules and the restricted duality but no resolution. §6.5(0) has no second owner. Declared gaps: 10 of 10 with the same slug, supplier and section in `design/plan.json` and under the contracts; the pull request changes `plan.json` only inside `gaps`. Policy: the pull request changes only `packages/HigherHidaAndColemanTheory/`; no `lemma` keyword, `set_option`, pull-request number or machine path in the README, the Lean file or `sources.toml`.

Locators verified against the cached texts in this pass: 35 (BP-Hida 20: Lemmas 2.1.4–2.1.6, 2.1.12, 2.1.13, §2.1.14, Definitions 2.1.15, 2.1.19, 2.1.24, 2.1.26, Remark 2.1.20, Lemmas 2.1.29–2.1.32, pp. 7–10; §2.6.9, Theorem 2.6.10, Lemma 2.6.11; §2.10, Lemma 2.10.1(1) and (4). Jones-BGG 10: §5 display (4), p. 16; Lemma 2, p. 9; Theorem 10, p. 14; Remark after Theorem 13, p. 19; Lemma 16, p. 21; Theorem 19, p. 22; Lemma 22, p. 23; Proposition 24, p. 24; Corollary 25, p. 25; Theorem 26, p. 26. Pilloni-Singular 4: §5.1.5, Propositions 5.1.5.1–5.1.5.2, Lemma 5.1.5.2, pp. 21–22. BP-Coleman 1: contents). The other locators were verified by the two round-1 passes and are unchanged at this head.

Wording: 9 passages put beside their sources — README.md:34 with BP-Hida §2.1.14 (line 369 ff.); README.md:403–407 with Lemmas 2.1.12, 2.1.29, 2.1.30 and 2.1.32; README.md:483 with Theorem 2.6.10; README.md:1444 with §2.10; README.md:1144 with Jones-BGG p. 16; README.md:1149 with Jones-BGG pp. 23–25; README.md:1609 with Pilloni-Singular p. 22. The longest shared run is about ten words, the definition of a locally principal subscheme, which the mathematics forces; no sentence, list or proof plan is reproduced. No table, figure or list of examples is taken over.

Arrangement: locators inside Layers 1–9 by source: BP-Coleman 66, BP-Hida 49, Pilloni-Singular 25, Jones-BGG 4, BP-GL2 2, Humphreys-BGG 1 (147). Against the contents of BP-Coleman (its lines 17–77): Layer 5 takes its §§4.5–4.6, 5.3–5.4, 5.7, 5.9, 5.6, 5.5 with 5.8, 5.12 in that order, and Layer 6 its §§6.3, 4.4, 6.4, 6.1, 6.5, 6.2, 6.7, 6.8, 6.6, 6.9; neither is a run of consecutive sections in the source's order.

Source independence: 9 passages compared with 3 sources, none shared; largest share BP-Coleman, 66 of 147 locators; contents compared with BP-Coleman: independent.

## Not verifiable

- Humphreys-BGG §§6.1–6.3, pp. 108–111 (README.md:1144): the text is uncertified and was not read. The statement of (0) includes the description of the differentials through the Bruhat graph; whether that strong form is in §§6.1–6.3 or in a later section of the same chapter could not be checked.
- The reference "[24]" behind Pilloni-Singular Propositions 5.1.5.1–5.1.5.2 was not opened; §9.5 no longer depends on it.
- Stacks project tags named by the supplier AdicCoefficientsAndComparisons for BP-Hida Lemma 2.1.6 were not opened; the README consumes the supplier's target, not the tags.
- The hypotheses of the ten declared gaps cannot be tested against their suppliers, which do not state them yet.
- No Lean was run; with no declaration there is nothing to elaborate.

## Source issues

- **Misprint** in BP-Hida at Lemma 2.1.5, proof, p. 7: the source says the new compactification is the blow-up of X at the boundary ideal; it should be the blow-up of the compactification of X at that ideal; affects nothing.
- **Misprint** in Jones-BGG at Proposition 24, proof, p. 25: the source says the compactly supported locally analytic functions are dense in themselves; it should be the locally polynomial ones dense in the locally analytic ones, as on p. 15; affects nothing.
- **Misprint** in Pilloni-Singular at §5.1.5, p. 22, paragraph before Proposition 5.1.5.2: the source says the Klingen quadruple satisfies αβ=γδ; it should be αδ=βγ, as on p. 21; affects nothing.

## For the human reviewers

- Layers 2, 3, 4, 8 meet BP-Hida §§2, 4, 5, 6 in that order (README.md:374–849, 1438–1523); the *Needs* lines force the order; BP-Hida is not the source with the largest share. No finding was raised.
- **Licence.** BP-Hida, BP-Coleman and Pilloni-Singular are read from the author's page (`packages/HigherHidaAndColemanTheory/sources.toml`, `licence_class = "author-page"`); Humphreys-BGG is uncertified and cited by locator only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cdb927a0ad2a4af0561931fc9dbd735c2c4a504f", "job": "RT-HigherHidaAndColemanTheory~2b", "model": "fable", "worker": "chris-x79"} -->
