<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1623#issuecomment-6404037570 -->
Review (claude) of 02f336a

Verdict: accepted
Conditional on the announced gaps: `lie-invariants`, `associated-bundle-descent`, `local-geometric-comparisons`, `derived-bimodule-sheaves`

1. **F01** (P3) §8.1 and §8.2 need each other

   Location: `packages/SpringerResolutionAndCharacteristicCycles/README.md:827` "*Needs:* FormalConnectionsOpers F2.2; … §8.2 for the finiteness equivalence" and line 840 "*Needs:* FormalConnectionsOpers F2.2; … the supplied operator sheaf of §8.1".

   Claim: the two Needs lines form a target-level cycle inside Layer 8 (the depcheck sees only roadmap-level edges and cannot report it).

   Witness: line 807 defines coherence as "locally finitely presented modules over D_Y" and line 815 states the finite-generation equivalence as an API bullet of §8.1, while M23 Definition 3.1 (M23 lines 474–477) defines coherence as quasi-coherent and locally finitely generated over D, needing no Noetherianity.

   Repair: in §8.1 define coherent as locally finitely generated over D_Y (M23's definition), delete "§8.2 for the finiteness equivalence" from its Needs, and move the bullet "finite presentations agree with finite generating sets" into §8.2's statement, where left Noetherianity is proved. Test: §8.2's Needs line already names "the supplied operator sheaf of §8.1, independent of its coherence theorem", so the layer then builds 8.1 → 8.2 → 8.3 with no back edge.

2. **F02** (P3) garbled self-referential sentences

   Location: `packages/SpringerResolutionAndCharacteristicCycles/README.md:680` "Reducedness of Q is the separate the conditional comparison in §6.5 input"; line 684 "bounded by the conditional comparison in §6.5" (inside §6.5); line 942 and line 966 "the §9.1 and the derived-bimodule contract input" (line 966 reads "input input"); lines 1097 and 1163 "the §§9.7 and 9.9 input" (line 1097 is inside §9.9); line 1222 "The exact cycle/base-field comparison remains in §§4.2 and 11.1" (inside §11.1); line 1296 "This extension is included in §§10.4 and 12.1" (inside §12.1).

   Claim: these are substitution artefacts that cite a subsection as its own input and leave two sentences ungrammatical.

   Witness: the eight lines quoted above.

   Repair: rewrite each to name the actual input. Line 680: "Reducedness of Q is a hypothesis of this comparison, not a theorem of this roadmap." Line 684: replace "the comparison remains bounded by the conditional comparison in §6.5 and is not used by the cycle identities" by "the comparison remains conditional and is not used by the cycle identities". Lines 942 and 966: "the derived-bimodule contract". Line 1097: "General-field comparisons are the field-descent targets of §9.7 and of this subsection." Line 1163: "the field-descent targets of §§9.7 and 9.9". Line 1222: delete the sentence (the two comparisons are already named as targets in the same paragraph). Line 1296: "This extension is proved in this subsection."

3. **F03** (P3) Examples sections are lowercase fragments

   Location: `packages/SpringerResolutionAndCharacteristicCycles/README.md:212` "ranks 0,1; over k[ε]/ε² the actual intersection is (ε)e₁ …"; the same pattern at lines 278, 443, 523, 587, 704, 797, 928, 1112, 1208, 1282, 1331, 1419 and 1503.

   Claim: each layer's `### Examples` repeats the "compute:" fragment of its last Check verbatim, starting mid-sentence, instead of a worked example in prose.

   Witness: line 212 against line 206 (the Check it copies); line 1503 against line 1497.

   Repair: replace each fragment by one or two sentences, for instance for Layer 1 "For SL₂ the flags are the lines of k², the two orbits have dimensions 1 and 2, and over k[ε]/ε² the summands (1,0) and (1,ε) have intersection (ε)e₁, which is why §1.5 assumes a reduced base." Where the SL₂ worked example at lines 1515–1519 already covers the layer (Layers 3, 7, 11, 13, 14), the Examples section may point to it in a sentence.

4. **F04** (P3) M23's standing hypothesis is not recorded

   Location: `packages/SpringerResolutionAndCharacteristicCycles/README.md:807` "Let k have characteristic zero" and the References entry at line 1531.

   Claim: Layers 8–9 cite M23 for arbitrary characteristic-zero k, but M23 fixes an algebraically closed field (M23 line 466, "over an algebraically closed field k of characteristic 0"); the README records this scope restriction for ElliottBB and EH18 but not for M23.

   Witness: M23 line 466; README line 1531 says nothing about the field.

   Repair: add to the M23 reference line and to §8.1 one sentence: M23 assumes k algebraically closed; the arguments of §§8.1–9.6 (étale coordinate charts, Noetherian graded rings, Kashiwara's normal-coordinate expansion, the Sato–Kashiwara filtration) use no closure property, and the one place where the field matters, regularity, is the explicit descent target of §9.7. Test: the three A¹ Checks of §§8.5–8.6 are unchanged over ℚ.

5. **F05** (P3) four locators point at page markers or the wrong proposition

   Location: `packages/SpringerResolutionAndCharacteristicCycles/README.md:168` "Proposition 2.2.1, pp. 311–312 (BHS19 lines 470–474)"; line 615 "§2.4, p. 320, BHS19 line 842"; line 903 "G98, Definition 1.1.12, p. 5, … (G98 line 151)"; line 1218 "BR12, §1.1, pp. 538–539; … (BR12 line 137)".

   Claim: the cited places do not contain the statement the sentence attributes to them.

   Witness: BHS19 Proposition 2.2.1 (lines 518–519) is the vector-bundle statement for V_w→U_w; the closure order of the U_w is invoked at line 574 ("well known closure relations") and their smoothness and dimension at lines 473–474. BHS19 (2.12) and the Springer map are at lines 836–838 on p. 319, line 842 is the marker of p. 320. G98 line 151 is the marker of p. 5; Definition 1.1.12 is at line 191. BR12 line 137 is the marker of p. 538; the definitions of 𝒩̃ and g̃ are at lines 192–195 on p. 539.

   Repair: §1.4: cite "BHS19 §2.1, p. 310 (lines 473–474) for smoothness and dimension; Lemma 2.2.4 proof, p. 313 (line 574) for the closure order; SchubertGeometry S2 item 3 for the criterion". §6.2: "§2.4, pp. 319–320 (BHS19 lines 836–838)". §8.6: "(G98 line 191)". §11.1: "BR12 §1.1, p. 539 (BR12 lines 191–195)".

Acceptance is conditional on the four declared supplier gaps `lie-invariants`, `associated-bundle-descent`, `local-geometric-comparisons` and `derived-bimodule-sheaves`, each with a named supplier and the same slug in `design/plan.json` and in the README's supplier contracts. Five P3 notes follow; none is blocking.

## Round-1 findings, checked one by one

| Round-1 finding | Repaired passage (README) | Status |
|---|---|---|
| F01 (P1) second owner of Springer geometry | Scope line 13: "NilpotentOrbits N1, N5.0 and N7 own the complex adjoint semisimple nilpotent cone … Sections 6.1–6.3 here compare those objects over arbitrary characteristic-zero fields"; §6.2 line 615: "compare the supplied Springer incidence object … In the complex adjoint semisimple case these are exactly NilpotentOrbits N1 and N7's objects and maps"; supplier contract lines 97–99; docstring of `Suggested.lean` names NilpotentOrbits as supplier. N1 (NilpotentOrbits README line 129), N5.0 (line 239) and N7 (line 390) exist on main and state the cone, reducedness/CI and the Springer map with scheme fibres. | repaired |
| F02 (P2) non-minimal Lie-invariants gap | Gap text lines 53 and plan `gaps[0]` now ask only for Lie Jordan/centralizer comparisons, the regular-semisimple Borel W-torsor, quasi-finiteness, invariant forms under central isogenies and the single-root-wall regularity; §6.1 line 601 consumes FormalConnectionsOpers F4.3 (open head 9b62023, F4 item 3: restriction `S(g*)^G≃S(h*)^W`, central factors, ℚ-descent, regular nilpotents with unique containing Borel); §1.4 line 174 consumes SchubertGeometry S1 and S2 item 3 (subword/Bruhat criterion, SchubertGeometry README line 42). | repaired |
| F03 (P2) associated-bundle ownership | Gap text line 61 and plan `gaps[1]` now consume SchemeAndStackFoundations §§1.1/1.16 (main lines 2071, 2589) and ask AlgebraicVectorBundles L0B–L2B (main lines 228–340) only for the linear/subbundle/incidence comparison; frame-torsor Checks lines 65–67 (degrees 1, −1, 0). The transfer of AutomorphicBundles B0.4 (open head 055b77e, line 521, merge order line 228) to AlgebraicVectorBundles needs edits outside this package. | residual gap repaired; transfer settled as not actionable, reason valid |
| F04 (P2) local-geometric gap repeats supplied theorems | Line 45: "Use `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite` in Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:372"; line 75: "§4.11 for `IsModification.isIso_of_isFinite` on normal integral targets" (SchemeAndStackFoundations README line 5534); §2.3 line 254 and §3.9 lines 428–434 cite them; gap text line 77 and plan `gaps[2]` keep only completed-component equidimensionality and cycle comparisons. | repaired |
| F05 (P2) global good filtrations restricted to flags | §8.4 line 866: "Every coherent D_Y-module admits a global good filtration. Any two global good filtrations F and G are globally comparable"; route line 868 uses a finite affine cover, §0.4 extension and the finite sum. Matches M23 Proposition 3.25 (M23 lines 771–784) and Proposition 3.24 (lines 754–767). | repaired |
| F06 (P2) CC only in holonomic dimension | §8.6 line 903: "For every coherent D_Y-module M define CC(M)=Σ_C … over all irreducible components C of Ch(M), in the ungraded native cycle group … No dimension condition on Ch(M) is imposed"; Checks lines 916–917 give CC(D_A¹)=[A²] and the D⊕O counterexample to unrestricted additivity; §9.8 line 1082 uses "the all-component CC(M) of §8.6". Matches M23 Definition 6.40 and Proposition 6.41 (M23 lines 2728–2768). | repaired |
| F07 (P2) G-characters versus X*(T) | Conventions line 26: "The algebraic weight lattice is X*(T) for the specified isogeny form of G … ρ … need not belong to X*(T), although −wρ−ρ does"; §10.1 line 1124; §12.1 line 1294: "whose highest weight λ belongs to X*(T)"; Checks lines 1130 and 1307 (SL₂: λ_e=−α pairs to −2, X*(SL₂)=0; PGL₂: ω excluded, 2ω included). | repaired |
| F08 (P3) characteristic-two Check | §13.2 line 1370: "In characteristic two the Weyl action on t is trivial, so invariants formed over k are k[t], and t×_(t/W)t is the reduced diagonal … Reduction of the integral square-invariant quotient instead gives k[x,ε]/ε²". | repaired |
| F09 (P3) locators and strong-equivariance source | §§1.1–1.4 cite p. 310 (BHS19 lines 470–488); §4.2 line 472 cites BR12 §2.10, p. 571 for the evaluation map; §13.5 line 1404 cites "statement p. 326 and proof pp. 326–327 (BHS19 lines 1116–1121 and 1143–1154)"; §13.3 line 1378 and the completion contract line 85 cite DeformationAndDerivedPatchingAlgebra §1.16 (open head a3b5dea, line 362: `localCompletionMap`, flatness, closed fibre `k[[y]]`); §9.8 line 1073 cites EH18 §4.3.1, Definition 4.10 (EH18 lines 1725–1740) with its algebraically closed scope stated; `sources.toml` has the EH18 entry (certified, institutional). | repaired |

## Verified sound

**Scope of this round.** The four package files, the previous review and its repair report, all 69 numbered target groups and 14 layers were read in full. Every passage the repairs changed was recomputed; the sampled targets and headline groups were recomputed independently of the round-1 table. Content checkout `fb74f5e7693b290ca2ed883a52122460517e36a3`; pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

**Principles.** No route-specific shortcut: the characteristic bound p>h is a source hypothesis of the component geometry, the D-module layers are stated for every smooth separated finite-type characteristic-zero scheme, and the general characteristic cycle (F06) covers every coherent module. No roadmap is re-planned: the complex Springer construction is imported from NilpotentOrbits, invariants from FormalConnectionsOpers F4.3, differential operators from F2.2, affine cycles from DeformationAndDerivedPatchingAlgebra §6.7. No copied passage, no algorithm, no `set_option`, no sorry'd data, no LaTeX delimiters (`$` count 0), no process words, no pull-request numbers, no machine path in any of the four files. Single direction of supply: see the audit below.

**Adversarial table.** Rows cover the sampled targets, the headline groups and every target a finding touches. Component coordinates for SL₂ are in the order (Z_e, Z_s).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions: dimensions | trivial group; rank-r torus; SL₂; GL₃ | (N,r,D)=(0,0,0); (0,r,r); (1,1,3); (3,2,8); dim F=0,0,1,3 | agree with §§1.1–1.2 |
| Conventions: second Cartan coordinate w⁻¹ | GL₃, w: e₁↦e₂↦e₃↦e₁, z=diag(1,2,4) | (ŵ⁻¹zŵ)e_i=z_{i+1}e_i gives diag(2,4,1); wz=diag(4,1,2) | S₃ witness fixes the inverse; same value at §5.1, §13.1 |
| Conventions: −wρ−ρ∈X*(T) | SL₂, PGL₂ | ρ−wρ is a sum of positive roots and 2ρ is in the root lattice, so wρ+ρ is in the root lattice ⊂ X*(T); SL₂: −2ρ=−α; PGL₂: −2ω∈X*(T), ω∉X*(T) | F07 convention correct |
| Conventions: Kashiwara shift | i:{0}→A¹, δ=D/Dx | [x,∂ʲ]=−j∂ʲ⁻¹ so x∂ʲδ=−j∂ʲ⁻¹δ; coker x=0, ker x=kδ; Tor₁ in degree −1, Li*δ[−1] has it in degree 0; identity: shift 0 | sign and index correct |
| Conventions: KL matrix | W={e,s}, rows e,s | m_{w,v}=P_{w₀w,w₀v}(1): m_{s,e}=P_{e,s}(1)=1, m_{e,s}=P_{s,e}(1)=0; matrix ((1,0),(1,1)); unprefixed P_{w,v}(1) gives ((1,1),(0,1)) | agrees with BHS19 lines 883–888 and [M(0):L(−2ρ)]=1 |
| §1.4 orbit dimensions and closure | SL₂ e,s; torus | N+ℓ(w)=1,2; 0; closure of U_s is P¹×P¹ ⊃ U_e, closure of U_e is U_e | agrees with BHS19 lines 473–474; locator R05 |
| §2.1 bundle | torus; GL₂; ψ=0 | g̃=t, q=id; rank dim b=3 over P¹, total 4=dim GL₂; q⁻¹(0)=F=P¹ | agrees with (2.1)–(2.2) |
| §2.3 regular cover (F04) | SL₂ regular semisimple, E₁₂; torus | fibres of q: 2 flags, 1 flag (length 2 as a scheme fibre), 1; degree |W|=2,1 | proper + locally quasi-finite ⇒ finite closes by `exact` on the pin |
| §3.3 strata | SL₂ e,s | fibres b∩Ad(ŵ)b: b (dim 2), t (dim 1); zero section in both | agrees with (2.6) |
| §3.4 bundle rank | SL₂ e,s; torus | (N+ℓ)+(r+N−ℓ)=1+2=3=D, 2+1=3; torus 0+r=r | agrees with Prop. 2.2.1 |
| §3.9 birational projections (F04) | SL₂ e,s; torus | over gʳˢ, X=g̃ʳˢ×W, each V_w a graph of degree 1 while q has degree 2; torus identity | finite modification of normal integral target is an isomorphism: §4.11 cited |
| §4.3 scaling argument | A=ℤ_(p), Spec A ⊔ Spec ℚ[x,y]/(x²,xy) | A-flat (torsion-free), special fibre Spec F_p (CM), generic component depth 0 < dim 1 | flat + CM special fibre is insufficient; the scaling-and-specialisation route closes the gap |
| §5.1 Weyl relation | GL₃ three-cycle; zero | κ₂=diag(2,4,1)=w⁻¹κ₁; at ψ=0 both ideals equal | agrees with Lemma 2.3.4 (line 715) |
| §5.3 root wall | SL₂; GL₃ diag(a,a,c)+E₁₂, a≠c | centralizer dimensions 1=r and 3=r; without E₁₂: 3 and 5 | regular on the wall as stated |
| §6.1 invariant quotient (F01/F02) | torus; sl₂; gl₂; rank-one torus over k[ε]/ε² | t→t identity, zero fibre = origin; a²+bc; trace form nondegenerate, Killing form zero on scalars; ε has ad ε=0 but central coordinate ε≠0, excluded | reductive-centre convention excludes the wrong model; N5.0 already includes the complex reductive centre (NilpotentOrbits line 257) |
| §6.2 Springer adapter (F01) | PGL₂/ℂ; SL₂; torus | cone a²+bc=0 of dim 2; source Tot O(−2), dim 2=2N; μ⁻¹(0)=P¹; μ⁻¹(E₁₂)= one reduced flag; torus: point→point | same objects as N1/N7 |
| §6.3 cotangent form and sign | SL₂ trace form and twice the form; two factors | tr(E₂₁E₁₂)=1; with 2tr the representative is E₁₂/2; (−ψ,ψ) sums to 0, (ψ,ψ) to 2ψ; Springer×Springer dim 4 versus Grothendieck×Grothendieck dim 6 | sign and factors pinned |
| §6.6 Steinberg components | SL₂ e,s; torus | conormal rank N−ℓ(w)=1,0 plus orbit dim 1,2 gives 2,2=2N; nilpotent part of t⊕(u∩Ad(ŵ)u) is u∩Ad(ŵ)u; torus 0 | agrees with Prop. 2.4.1 and lines 911–918 |
| §7.3 zero-fibre cycles | SL₂, chart k(1,x),k(1,y), ψ=((a,b),(c,−a)) | incidence c=2ax+bx², c=2ay+by²; difference (x−y)(2a+b(x+y)); on X_s, κ₁=b(x−y)/2; zero fibre b=0 (Z_s, ψ=0) and x=y (Z_e), multiplicities 1,1 | [X̄_s]=(1,1), [X̄_e]=(1,0) |
| §8.1 coherence (R01, R04) | point; A¹; D_A¹; δ | D_pt=k; [∂,x]=1; D has D-rank 1, infinite O-rank; ∂δ≠0 | definition matches M23 Def. 3.1 after R01 |
| §8.4 global filtrations (F05) | s affine charts; O shifted by 1; two local bounds 1,3 | s coherent extensions sum to one generator M₀; comparison bound 1 each way; global bound max=3 | matches M23 Props. 3.24–3.25 |
| §8.5 characteristic variety | O, δ, D, D/Dx², 0 on A¹ | supports ξ=0, x=0, A², x=0, ∅ | matches M23 Def. 3.28, Prop. 3.30 |
| §8.6 all-component CC (F06) | D, O, D/Dx², D⊕O, 0 | [A²], [ξ=0], 2[x=0], [A²] (k[x] localises to 0 at the generic point of A²), 0; ends of the split sequence give [A²]+[ξ=0]≠[A²] | independence proof: adjacent filtrations F⊂G⊂F[1] give 0→N(−1)→gr^F→gr^G→N→0, equal lengths at every component generic point (M23 lines 2748–2755) |
| §9.8 strong equivariance (F09) | G_m on a point, weights 0,1; H={1} on A¹ with M=D | differentiated weight 0=0 ✓, 1≠0 ✗; CC(D)=[A²] invariant | definition matches EH18 lines 1734–1737 |
| §10.1 D-affinity lattice (F07) | SL₂ ω; PGL₂ ω, 2ω; torus | dim 2 module although X*(SL₂)=0; ω absent, 2ω gives dim 3; ΓD=k after z↦0 | ample weights exist in X*(T) (2ρ is always one) |
| §10.4 principal block | SL₂ e,s; torus; k[z]/z² | M_e=M(−2ρ)=L_e; M_s=M(0) has L_e, L_s=k; torus weight 0 only; z≠0 on k[z]/z², excluded by strict reduction | matches BHS19 lines 874–892 |
| §11.1 Verma cycles | SL₂ e,s; torus | CC(M_e)=(1,0), CC(M_s)=(1,1); torus (1); BR label w⁻¹ (BR12 line 1730) | consistent with §7.3 and §11.3 |
| §11.3 KL input | A₁; A₃ w=s₂s₁s₃s₂, y=s₂ | matrix ((1,0),(1,1)); P_{y,w}(q)=1+q, value 2 at q=1 (BR12 line 1757) | both w₀ prefixes needed |
| §12.1 parabolic (F07) | SL₂ e,s; PGL₂; torus | pairings −2,0 give I=∅,{α}, P=B,G; PGL₂ −α=−2ω∈X*(T); torus P=G | integrality criterion applies to the actual weights |
| §13.2 Cartan fibre product (F08) | SL₂ char 0; char 2; torus | k[x,y]/(x²−y²) two reduced lines meeting at 0; char 2: W acts trivially, k[t]^W=k[t], t×_{t/W}t=t reduced with e=s; reducing ℤ[t²]-quotient instead gives ε=x−y, ε²=0, ε≠0; torus diagonal | negative control now tests the actual quotient |
| §13.3 completed detection (F09) | SL₂ origin; k[x]_(x)→k[x,y]_(x,y) | on graph e: y−x=0, y+x=2x≠0 in k[[x]]; swapped on s; completion k[[x]]→k[[x,y]], closed fibre k[[y]], 2=1+1 | matches DDPA §1.16 Check |
| §13.4 tangent bound | SL₂ (e,e),(s,e),(s,s); torus | 1+1+1=3, 2+0+1=3, 2+1+0=3 (dim ker(ss⁻¹−id)=1, ℓ(sw₀)=0); torus 0+r+0=r | matches BHS19 lines 1141–1152 |
| §13.5 smoothness | SL₂ (s,e),(s,s) | codim ker = 1=1−0, 0=1−1; bound 3 = local dimension 3 | sufficient criterion as stated |
| §14.1 completion of cycles | A¹ at 0; y²=x²(1+x) at 0; axes at (1,0) | [k[[t]]]; two branches y∓x(1+x/2−x²/8+…) of length 1; (1,0) | all branches retained |
| §14.4 completed KL identity | SL₂ at a point on both components; off Z_s; torus | (1,1)=(1,0)+(0,1); 1=1+0; 1=1 | matches Cor. 2.5.6 |
| Lie-invariants gap minimality | Mathlib `Mathlib/Algebra/Lie/AdjointAction/JordanChevalley.lean` | provides only `ad` of the semisimple and nilpotent parts of an endomorphism's decomposition (lines 36, 52); no reductive Lie-algebra Jordan decomposition or centralizer comparison | gap asks for nothing supplied |

**Seeded source audit.** All six manifest texts are cached, legal and readable; there were no author-flagged unverified locators.

| Target | Text read | Support |
|---|---|---|
| 1.4 | BHS19 lines 470–474 (p. 310), 565–574 (pp. 312–313) | smoothness, dimension N+ℓ(w), stratification and closure order supported; proposition locator imprecise (R05) |
| 2.1 | BHS19 lines 475–480, (2.1)–(2.2), p. 310 | incidence scheme, associated bundle with (g,ψ)b=(gb,Ad(b⁻¹)ψ), q and p supported |
| 3.3 | BHS19 line 517, p. 311 | V_w=π⁻¹(U_w) supported |
| 3.4 | BHS19 lines 518–538, Prop. 2.2.1, (2.6)–(2.7), pp. 311–312 | rank dim B−ℓ(w), fibre Ad(g)(t⊕(u∩Ad(ŵ)u)) supported |
| 5.1 | BHS19 lines 715–723, Lemma 2.3.4, pp. 316–317 | κ_{2,w}=Ad(w⁻¹)∘κ_{1,w} and the t/W square supported |
| 6.2 | BHS19 lines 836–838, (2.12), p. 319 | Springer map and G×ᴮu≅𝒩̃ supported; page locator R05 |
| 6.6 | BHS19 lines 844–845, Prop. 2.4.1, p. 320; lines 911–918, p. 321 | equidimensional of dimension dim G−dim T, components Z_w, conormal closures supported |
| 8.1 | M23 lines 466–477, Def. 3.1, p. 9 | coherent = quasi-coherent + locally finitely generated over D; standing field algebraically closed (R04) |
| 8.4 | M23 lines 754–784, Props. 3.24–3.25, pp. 14–15; lines 843–859, Prop. 3.33, p. 16 | global existence, two-sided comparison, exact induced filtrations supported |
| 8.5 | M23 lines 811–835, Def. 3.28, Prop. 3.30, pp. 15–16 | reduced support, independence by the radical-annihilator argument supported |
| 10.4 | BHS19 lines 874–910, pp. 320–321; lines 959–1005, Thm. 2.4.7, pp. 322–323 | O(0), M(ww₀·0)=M(−wρ−ρ), BB_G equivalence, Remark 2.4.3 supported |
| 11.1 | BHS19 line 956, Prop. 2.4.6, p. 322; BR12 lines 1729–1730, Prop. 2.14.2, p. 574; BR12 lines 191–195, p. 539 | [X̄_w]=[M(ww₀·0)]; BR label w⁻¹; carriers on p. 539 (R05) |
| 13.2 | BHS19 lines 1071–1080, Lemma 2.5.1, p. 325 | components T_w={(z,Ad(w⁻¹)z)}; reducedness is the package's added characteristic-zero target |
| 13.3 | BHS19 lines 1090–1113, Lemma 2.5.2, pp. 325–326 | factorisation iff w′=w supported; line 1107 misprint recorded below |
| 14.1 | BHS19 lines 1157–1175, pp. 327–328 | completed local rings reduced equidimensional, components of Spec Ô_{Z,x} are the union over w, Lemma 2.5.5 supported |

Additional passages read this round: BHS19 lines 455–464 (characteristic bound, p. 309), 676–710 (Prop. 2.3.3 and its integral model), 1114–1156 (Prop. 2.5.3); BR12 lines 128–140, 950–975 (§2.2 setting: algebraically closed, p>h), 1700–1760; M23 lines 2726–2772; G98 lines 148–200; EH18 lines 1579–1590 and 1718–1745.

**Pinned declarations.** A scratch file with `import Mathlib`, `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf.Basic` and `TauCeti.Algebra.Lie.HighestWeight.Verma` and `#check @name` for every library name in the README elaborated with exit 0 and printed the expected types: `AlgebraicGeometry.Scheme`, `CategoryTheory.Limits.pullback`, `AlgebraicGeometry.AlgebraicCycle` (`Function.locallyFinsupp X R`, Basic.lean:44), `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite` (ZariskisMainTheorem.lean:372, hypotheses `IsProper f` and `LocallyQuasiFinite f` only), `Module.length` (values in `ℕ∞`), `Module.length_eq_add_of_exact` (Length.lean:168, injective, surjective, `Function.Exact`), `Finsupp.linearCombination`, `AdicCompletion`, `LinearMap.ker`, `Module.finrank`, `SymmetricAlgebra`, `SheafOfModules`, `DerivedCategory` (needs `Abelian` and `HasDerivedCategory`), `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf` (Basic.lean:48), `TauCeti.VermaModule` (Verma.lean:195; binders `CharZero`, `IsKilling`, `FiniteDimensional`, Cartan subalgebra, triangularizable, root base, weight). The example `IsFinite f` from `IsProper f` and `LocallyQuasiFinite f` closes by one `exact`. Object searches at the pins for Weyl algebras, differential-operator sheaves, flag varieties, Springer or Steinberg varieties, characteristic varieties and Kazhdan–Lusztig polynomials returned nothing relevant (the only hits for "Borel" are σ-algebra files).

**Supplier and ownership audit.** Every `*Needs:*` line and the supplier contracts were read and resolved: ReductiveGroups Layers 2, 3, 7, 8, 9 (main lines 227, 234, 627, 1023, 1092), 10A/10B (1733, 1759), 11C/11D (2057, 2086); RepresentationTheory/LieHighestWeight Layers 3, 4, 7, 9 (main lines 405, 537, 931, 1432); SchubertGeometry S1 (line 30) and S2 item 3 (line 42); NilpotentOrbits N1, N5.0, N7 (lines 129, 239, 390; N5.0 line 257 already includes the reductive centre over ℂ); AlgebraicVectorBundles L0A–L2B (lines 215–340); SchemeAndStackFoundations §§0.4, 0.7, 0.8, 0.9, 0.16–0.21, 0.30, 1.1, 1.16, 2.6, 2.18, 2.22, 4.11, 4.13, 5.1 (lines 602–6567; `IsModification.isIso_of_isFinite` named at line 5534); EnhancedDerivedSheaves §§0.1–0.4 (429–492), E1.3–E1.4 (549, 580); FormalConnectionsOpers F2.2 and F4.3 at open head 9b62023 (F2 item 2 at line 180: order-filtered operators, principal parts, Lie–Rinehart PBW, gr D≅Sym T in smooth characteristic zero; F4 item 3 at lines 476–622: restriction, central factors, ℚ-descent and base change, regular nilpotents with unique containing Borel); DeformationAndDerivedPatchingAlgebra §§1.13–1.16, 3.3–3.4, 6.7 at open head a3b5dea (lines 300–362, 593, 616, 1293). The two named downstream consumers are later in the merge order (lines 178 and 303) and are cited as consumers only. FormalConnectionsOpers is not in the merge order (design-stage pull request), which is not a defect. Ownership against the board's packages index was read; none of its 19 packages concerns Springer geometry or D-modules. Ownership against open pull requests other than those read through `roadmaps show` was not checked file by file.

Dependency check output, exit 0:

```text
depcheck: 56 roadmaps, 636 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

**Declared gaps.** All four slugs appear verbatim in `design/plan.json` `gaps` and in the README contracts (lines 53, 61, 77, 102), each with a named supplier. Each `needs` sentence states its hypotheses (characteristic zero or p>h and split G; flat affine H, representable fpqc torsor, finite locally free V; reduced pure d-dimensional finite-type Y with a closed point; associative-ring sheaf bimodules). None asks for what the pins, main or an earlier roadmap already supplies (Mathlib's Lie Jordan–Chevalley file is about endomorphisms only; the proper/quasi-finite finiteness and the finite-modification isomorphism have been removed from the local-geometric gap).

**Elaboration.** `lake env lean` on `packages/SpringerResolutionAndCharacteristicCycles/Suggested.lean` from the content checkout: exit 0, no output, real time 7.2 s. The file has one `import Mathlib`, one module docstring, the namespace and no declaration; the `#check @name` list is therefore empty. The docstring names each of the fifteen headline groups and the carrier each lacks. The one-tactic probe has an empty candidate set.

**Headline theorems.** From the README: properness and regular cover (§2.3), reduced lci double incidence (§§3.7–3.8), birational projections (§3.9), CM components and flat Cartan maps (§§4.2–4.4), geometric normality (§5.4), Springer comparisons and Steinberg conormals (§§6.1–6.6), filtration-independent characteristic cycles (§§8.2–8.6), Kashiwara and Bernstein (§§9.2–9.3), holonomic length and intermediate extension (§§9.5–9.6), Beilinson–Bernstein and principal block (§§10.1–10.4), the three cycle bases (§§11.1–11.4), parabolic invariance (§12.2), formal graph detection (§13.3), tangent bound and smoothness (§§13.4–13.5), completed KL identity (§§14.2–14.4). Each needs a flag scheme, an incidence or Steinberg scheme, a differential-operator sheaf or Kazhdan–Lusztig polynomials, none of which exists at the pins; stating any through the Weyl algebra or a bare cycle matrix would be a stand-in. All fifteen are named in the docstring. Nothing is padding.

**Shape.** Headings and order follow upstream (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, 14 layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References). Every definition has an API list and at least three Checks; every theorem states its hypotheses and a locator; every target has a Needs line. The style notes are R02–R03.

## Not verifiable

- Ownership against open pull requests not read at their heads (other than FormalConnectionsOpers, DeformationAndDerivedPatchingAlgebra and AutomorphicBundles) was checked only through the object-based `roadmaps grep` index, not file by file.
- The residual F03 ownership transfer (AlgebraicVectorBundles to own the linear associated-bundle comparison, AutomorphicBundles B0.4 to consume it) is a maintainer decision outside this package; its correctness was not re-adjudicated here.

## Source issues

- **Misprint** in BHS19 at Lemma 2.5.2 proof, printed page 326 (BHS19 line 1107): the source says the generic point of the completed Cartan graph lies in the completed local spectrum of X; it should lie in the completed local spectrum of the Cartan fibre product; affects the proof.
- **Gap** in BHS19 at Proposition 2.3.3 proof, printed page 316 (BHS19 lines 705–707): the source says flatness over the discrete valuation ring and a Cohen–Macaulay special fibre make the whole integral model Cohen–Macaulay; it should add an argument reaching the points of the generic fibre, such as the scaling specialisation; affects the proof.
- **Error** in G98 at Definition 1.1.12, printed page 5 (G98 lines 191–194): the source says the multiplicity along a component is the rank after tensoring with the reduced component; it should be the length at the generic point, which gives 2 for D/Dx²; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "02f336a77099d056d9535a73ecbaaa807bdd8e0e", "job": "REV-PKG-SpringerResolutionAndCharacteristicCycles~2", "model": "fable", "worker": "chris-i"} -->
