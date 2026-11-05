<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1623#issuecomment-6638613934 -->
Red team round 2 pass b (claude) of 4f98d3f

Verdict: needs_changes

1. **F01** (P2) §4.2's convolution identity is stated without a convolution convention; under the cited source's convention it names the wrong component

   **Location.** README.md:482 "prove O_(X_s₁)⋆⋯⋆O_(X_sₘ)≅O_(X_w) … The product is derived pullback/tensor followed by proper projection from its support"; README.md:486 K_w, K_w^∨; README.md:488 "BR … labels the orbit by w⁻¹ … replace w by w⁻¹ to compare the closures".

   **Claim.** For a reduced word w=s₁⋯sₘ the convolution of the simple graph sheaves, in the displayed order, is O_(X_w), where X_w lies over U_w=G·(eB,ŵB).

   **Witness.** BR12 lines 233–235 define F⋆G:=R(p₁,₃)_*((p₁,₂)^*G⊗(p₂,₃)^*F) (G in the first slot), and BR12 line 958 defines Z_w over the orbit of w⁻¹, so X_w=Z_(w⁻¹). Supports compose as relations: with BR's product, O_(X_s₁)⋆O_(X_s₂) is supported over pairs (x,z) with (x,y) of relative position s₂ and (y,z) of relative position s₁, i.e. over Ū_(s₂s₁)=π(X_(s₂s₁)), not Ū_(s₁s₂). For W=S₃, w=s₁s₂≠w⁻¹ and X_(s₁s₂)≠X_(s₂s₁). The identity as displayed holds only for the opposite product F⋆G:=Rp₁₃_*(p₁₂^*F⊗^L p₂₃^*G), which the README never states; for SL₂ both conventions agree, so the existing Checks cannot detect the choice. (With the opposite product the K_w^∨ order at README.md:486 is also the right one, so only the convention is missing, not the formulas.)

   **Repair.** In §4.2 after "The product is derived pullback/tensor followed by proper projection from its support" insert: "Fix F⋆G:=Rp₁₃_*(p₁₂^*F⊗^L_(O) p₂₃^*G) on g̃×g̃, so that supports compose relative positions in reading order. This is the opposite of BR12's product (BR12 lines 233–235, which pulls G back by p₁₂): ⋆_here(F,G)=⋆_BR(G,F); together with X_u=Z_(u⁻¹) this is why K_w and K_w^∨ keep BR's displayed factor order." Add the Check: "For SL₃ and w=s₁s₂, O_(X_s₁)⋆O_(X_s₂) is supported over Ū_(s₁s₂): (gB,gs₁B) then (gs₁B,gs₁s₂B) compose to (gB,gs₁s₂B). BR's product order would give Ū_(s₂s₁)=π(X_(s₂s₁)), a different component. For SL₂ the two orders agree." Tested: with this convention O_(X_s₁)⋆O_(X_s₂)≅O_(X_(s₁s₂)); transporting BR's theorem for w⁻¹=sₘ⋯s₁ with Z_u=X_(u⁻¹) gives exactly the displayed K_w and the reversed K_w^∨.

2. **F02** (P3) §11.1's Weyl-action/convolution comparison has no primary locator

   **Location.** README.md:1237 "Prove the Weyl-action/convolution comparison that sends w to the localised Verma cycle and the coadjoint zero-fibre kernel labelled w⁻¹ … (BR12 §2.14, pp. 574–575, BR12 line 1703)"; README.md:1239 "BR proves the equality in top Borel–Moore homology using convolution kernels and the Weyl-group action."

   **Claim.** BR12 §2.14 is the source for the isomorphism Q[W]≅H^BM_top(Z) sending w to CC(M̃_w), for its multiplicativity with convolution, and for s↦[Z′_s].

   **Witness.** BR12 lines 1713–1727: the isomorphism (2.14.1) is quoted from [28, Prop. 5.3] and described "as in [28, Section 6] or [43]", the product comparison from [28, §5.1], and s↦[Z′_s] from [54, §6.2]; Proposition 2.14.2 (line 1729) only combines these with Theorem 2.2.1. BR12 lines 2736–2798 identify [22] Chriss–Ginzburg, [28] Ginzburg, G-modules, Springer's representations and bivariant Chern classes, Adv. Math. 61 (1986), [43] Kashiwara–Tanisaki, The characteristic cycles of holonomic systems on a flag manifold, Invent. Math. 77 (1984), [54] Riche, Represent. Theory 12 (2008). None is in `packages/SpringerResolutionAndCharacteristicCycles/sources.toml`; BHS19 line 957 proves Proposition 2.4.6 by citing BR12 alone. A target that owns these comparisons cites only a derivation that itself cites elsewhere.

   **Repair.** In §11.1 after "(BR12 §2.14, pp. 574–575, BR12 line 1703)" add: "The Weyl action on top Borel–Moore homology and its identification w↦CC(M̃_w) follow Ginzburg, Adv. Math. 61 (1986), §§5–6 (Proposition 5.3 and Section 6), and Kashiwara–Tanisaki, Invent. Math. 77 (1984); the image of a simple reflection is [Z′_s] by Riche, Represent. Theory 12 (2008), §6.2." Fetch the three works through the sources service (Adv. Math. and Invent. Math. are in publisher open archives/GDZ; record `uncertified` if only a paywalled page resolves) and add them to `sources.toml` with these locators. Tested on SL₂: the identity CC(M_s)=[X̄_s]=(1,1) is unchanged; the repair changes locators only.

3. **F03** (P3) §9.9's classification uses "simple" without naming the category; for nonconnected H the two readings differ

   **Location.** README.md:1114 "the strongly H-equivariant regular holonomic simple objects are exactly the intermediate extensions of trivial rank-one connections on individual orbits"; the hypotheses admit nonconnected H (README.md:1092 "including nonconnected H").

   **Claim.** Under finitely many orbits and geometrically connected stabilizers, the simple objects are the j_!* of O on orbits.

   **Witness.** H=Z/2 swapping the two points of Y=Spec k⊔Spec k: one orbit, trivial (connected) stabilizer. The orbit's trivial connection is O_Y=k⊕k, simple in the strongly equivariant category but not a simple D_Y-module (δ at either point is a D-submodule and is not H-stable). Read as "simple D-modules that are strongly equivariant", the right side contains no simple object at all, so the statement is false; read as "simple objects of the equivariant category", it is true. For connected H the two readings coincide (strong equivariance is then a property inherited by D-submodules), which is why the SL₂ and G_m Checks cannot separate them.

   **Repair.** README.md:1114: replace "the strongly H-equivariant regular holonomic simple objects are exactly" by "the simple objects of the category of strongly H-equivariant regular holonomic modules (for connected H, equivalently the D-module-simple strongly equivariant modules) are exactly", and add the Check: "For Z/2 swapping two points, the single orbit's trivial connection k⊕k is the unique simple equivariant object and is not a simple D-module; for connected H the two notions agree." Tested on the witness: the repaired statement holds (one orbit, one simple equivariant object).

4. **F04** (P3) §9.4's API asserts §9.5's theorem

   **Location.** README.md:1016 "CC gives an additive map K₀(Hol(D_Y))→Z_n(T*Y)", in §9.4 whose Needs (README.md:1025) are §8.5 and §9.3 only.

   **Claim.** The holonomic category's API includes CC-additivity on K₀.

   **Witness.** Additivity of CC on holonomic short exact sequences is the theorem of §9.5 (README.md:1029, Needs §8.6, §8.4), which itself needs §9.4. The bullet is a forward reference inside an API list and duplicates §9.5's conclusion; §8.6 (which defines CC) is not in §9.4's Needs.

   **Repair.** Delete the bullet at README.md:1016 (§9.5 already states "Hence CC defines a group homomorphism from K₀(Hol(D_Y)) to the free group on n-dimensional characteristic components").

5. **F05** (P3) layer "Dependencies" blocks omit suppliers added by the repairs

   **Location.** README.md:540–542 (Layer 4), 721–723 (Layer 6), 814–816 (Layer 7), 947–949 (Layer 8), 1227–1229 (Layer 10), 1303–1305 (Layer 11), 1354–1356 (Layer 12).

   **Claim.** Each layer's Dependencies paragraph lists the external inputs of its Needs lines.

   **Witness.** Compared mechanically against the Needs lines: Layer 4 omits ReductiveGroups Layer 2, SchemeAndStackFoundations §§2.18, 2.22, EnhancedDerivedSheaves §§0.1–0.4 and the two contracts (README.md:506); Layer 6 omits ReductiveGroups Layers 8–9 and the Lie-invariant contract (README.md:626); Layer 7 omits DeformationAndDerivedPatchingAlgebra §6.7 and SchemeAndStackFoundations §§0.4, 5.1 (README.md:749, 773); Layer 8 omits FormalConnectionsOpers F2.2, AlgebraicVectorBundles L0A and L1A–L2B, SchemeAndStackFoundations §0.2 (README.md:842, 856) and lists ReductiveGroups Layer 2, which no Layer-8 Needs line cites; Layer 10 omits ReductiveGroups §§10A–10B (README.md:1152); Layer 11 omits AffineMorseLefschetz A4.0–A4.1, ComplexComparisonPartII §C−1.1 and TypeAHeckeAlgebras H1 (README.md:1247, 1284); Layer 12 omits ReductiveGroups Layer 3 and SchemeAndStackFoundations §1.16 (README.md:1348).

   **Repair.** Regenerate each listed Dependencies paragraph as the union of the external citations of that layer's Needs lines, adding the omitted items above and deleting "ReductiveGroups Layer 2" from Layer 8. The dependency check reports no problem on the current text, so this is a consistency repair, not a direction change.

Files read in full: `packages/SpringerResolutionAndCharacteristicCycles/README.md` (1556 lines, 69 numbered targets in 14 layers) and `packages/SpringerResolutionAndCharacteristicCycles/Suggested.lean` (38 lines, module docstring and empty namespace, no declaration). Earlier passes: round 1 pass a (F01–F08), round 1 pass b (F01–F03), and their repair report. No Lean was run (read-only brief; the acceptance file declares nothing, so the `#check @name` audit has an empty domain).

## Round-1 findings at this head

| Finding | Status | Witness at 4f98d3f |
| --- | --- | --- |
| a F01 / b F01 (P1) parabolic invariance false | repaired | README.md:1337 now states "every Z_v with a_(w,v)>0 is saturated along the fibres of π_w on the first flag: if (g₁B,g₂B,ψ)∈Z_v and p∈P_w, then (g₁pB,g₂B,ψ)∈Z_v", with the slice form and the explicit negative "Left translation … does not preserve ℒ_w in general". Checks at README.md:1343–1346 carry the SL₂ w=e control, the SL₃ w=s₁ computation and the torus. Recomputed: SL₃, λ_(s₁)=−2ρ+α₁ has pairings 0,−3; u∩Ad(s₁)u=⟨E₁₃,E₂₃⟩, so Z_(s₁)={P₁=P₂=P, ψ(P)=0, im ψ⊂P}, dimension 4+2=6; p=1+E₁₃ sends plane ⟨e₂,e₃⟩ to ⟨e₂,e₁+e₃⟩. The covector transport Ad(g₁p)b⊂Ad(g₁)p_w, p∈P_w, is correct (P_w normalizes u_(P_w)). Summary README.md:3, docstring Suggested.lean:23 and the BHS19 reference note README.md:1550 agree. No new error introduced. |
| a F02 (P1) module/sheaf comparison supplier | repaired | README.md:848 "SchemeAndStackFoundations §0.2 supplies `relativeSpec_modulesEquiv`"; TauCetiRoadmap/SchemeAndStackFoundations/README.md:529 is §0.2 and line 539 states that name. Added to README.md:77 contract, README.md:856 Needs and the A¹ zero-section Check README.md:853. |
| a F03 (P1) Borel–Moore supplier | repaired | README.md:1237 consumes AffineMorseLefschetz A4.0 (TauCetiRoadmap/AffineMorseLefschetz/README.md:210: locally finite chains, proper pushforward, open restriction, compact-pair comparison, fundamental cycle) and A4.1 (line 353: finite triangulation of a compact semialgebraic set compatible with finitely many subsets), and ComplexComparisonPartII §C−1.1 (open head, `complexSchemeAnalytification`); contracts at README.md:91–97; SL₂ Check README.md:1245 (H^BM₄=Q², H₄(T*P¹)=0 since T*P¹ retracts to P¹). AffineMorseLefschetz is on main; ComplexComparisonPartII is at position 42 < 70. |
| a F04 (P3) KL multiplicity has no primary proof route | settled, not actionable | The reason (the known routes need Riemann–Hilbert/decomposition owners later in the order) is correct; the Soergel-bimodule route would also need owners not earlier in the order. README.md:1266–1268 still owns the theorem with the circular route "Use the composition-multiplicity theorem established here". Not re-raised. |
| a F05 (P2) type-A Hecke owner | repaired | README.md:13, 99–101, 1266, 1279, 1284 cite TypeAHeckeAlgebras H1; TauCetiRoadmap/TypeAHeckeAlgebras/README.md:11 has `(Tᵢ−q)(Tᵢ+q⁻¹)=0`, matching the README's R=Z[v,v⁻¹], q=v map. S₃ Check recomputed: (−T−v)(−T+v⁻¹)=T²+(v−v⁻¹)T−1≠T²−(v−v⁻¹)T−1. |
| a F06 (P2) dual-kernel twists | repaired | README.md:486 "K_w^∨=O_(X_sₘ)(ρ,αₘ−ρ)⋆⋯⋆O_(X_s₁)(ρ,α₁−ρ)" with the transport stated; BR12 lines 163–164 take positive roots in g/b, lines 979–981 give the dualizing sheaf O_(Z_sₙ)(−ρ,ρ−αₙ)⋆⋯. Recomputed SL₂: ℓ₁⊗ℓ₂=O(−1,−1) embeds in sl₂ by v₁⊗v₂↦(x↦v₁ω(v₂,x)+v₂ω(v₁,x)) (gives diag(−1,1) for distinct lines, 2E₁₂ for equal lines), ω_(Tot O(−1,−1))=O(−2,−2)⊗O(1,1)=O(−1,−1); (ρ,ρ) gives O(−1,−1), (−ρ,−ρ) would give O(1,1). Conventions README.md:28 and Check README.md:34 (L_B(ρ)=O(−1): [gb,ρ(b)⁻¹x]↦x·gbe₁·ρ(b)⁻¹=x·ge₁) agree. The remaining unpinned convention in this display is the convolution order, S01 below. |
| a F07 (P3) undefined "L" | repaired | README.md:1251 "those of §10.4, transported to F×F by the induction equivalence of §10.3"; §10.3 in Needs README.md:1260. |
| a F08 (P3) ε-extension Check | repaired | README.md:892: 0→D/Dx→D/Dx²→D/Dx→0, [P]↦[Px]; graded factors k[x,ξ]/(x), k[x,ξ]/(x²), k[x,ξ]/(x), lengths 1,2,1. Recomputed: injectivity since D is a domain; length of k[x,ξ]/(x²) at (x) is 2. |
| b F02 (P3) G98 multiplicity locator | repaired | README.md:920 "G98, Definition 1.1.12, p. 5, for the reduced characteristic variety only, its rank-over-the-component multiplicity not being used (G98 line 191)"; G98 lines 191–194 confirm the rank convention. |
| b F03 (P3) garbled input sentences | repaired | README.md:695, 959, 983, 1077, 1114 read as proposed; README.md:699 torus Check also fixed. |

## Verified sound

- Declarations read: 0 (Suggested.lean has only `import Mathlib`, the module docstring and an empty namespace; no `set_option`, `lemma`, `#check`, sorry'd data, or process comment). Headline inventory: the fifteen docstring groups are the README's end theorems; each names its missing carrier. Statability re-checked at the pins by grepping Mathlib and Tau Ceti for a Weyl algebra, a sheaf of differential operators, a flag scheme, a Hecke algebra or KL basis, Borel–Moore homology or a Springer resolution: the only hit is TauCeti/NumberTheory/HeckeRing (modular-form Hecke operators, unrelated). Native carriers that exist (`AlgebraicGeometry.Scheme`, `AlgebraicCycle` as `Function.locallyFinsupp` at Basic.lean:44, `Module.length : ℕ∞` at Length.lean:30 and `Module.length_eq_add_of_exact` at Length.lean:168 with injective/surjective/`Function.Exact` hypotheses, `IsFinite.of_isProper_of_locallyQuasiFinite` at ZariskisMainTheorem.lean:372, `AdicCompletion` at AdicCompletion/Basic.lean:171, `FinitelyPresentedSheaf` as an `abbrev` at Basic.lean:48, `TauCeti.VermaModule` at Verma.lean:195) state no headline on the roadmap's objects. No padding, no stand-in.
- Targets read: 69 of 69 plus Conventions, supplier contracts, Worked examples, References. Checks per definition: 27 definitions, each with 3–6 Checks; 61 Check values recomputed in the table below, none false, none vacuous.
- Locators verified this pass against the cached texts (20): BR12 §1.1 lines 160–165 (split simply connected semisimple over Z; positive roots in g/b), convolution definition lines 231–238 (S01), §2.2 lines 953–965 (p>h, Z_w over the orbit of w⁻¹, rank dim b−ℓ(w)), Theorem 2.2.1 lines 974–983, Remark 2.2.2, §2.10 lines 1575–1584 (f* f_* K→K surjective), §2.11 and Remark 2.11.1 lines 1585–1626 (scheme equality of the special fibre), §2.14 lines 1700–1759 (Proposition 2.14.2, Remark 2.14.3, the SL(4) example P_(s₂,s₂s₁s₃s₂)=1+q); M23 Example 6.11 line 2226 (smooth-morphism coordinates), Definitions 7.25, 7.29, 7.30 (locally closed curve immersions, as the README restates), 7.32 and Theorems 7.31, 7.33 lines 4768–4852; BHS19 §2.4 lines 878–890 (multiplicity P_(w₀w,w₀w′)(1)), Proposition 2.4.4 and 2.4.6 lines 929–957, Theorem 2.4.7 lines 959–1005, Lemma 2.4.8 and Remark 2.4.9 lines 1011–1061 (the first-flag form; the README now uses the saturation form); G98 Definition 1.1.12 lines 191–194. The r1 ledger's remaining locators were not re-read.
- Sibling citations checked at the copies named in the brief (46): SchemeAndStackFoundations §§0.2 (line 529; `relativeSpec_modulesEquiv` line 539), 0.16, 0.17, 0.21, 0.30, 1.16, 2.6, 2.18, 2.22, 4.11, 4.13, 5.1 on main; AffineMorseLefschetz A4.0 (line 210), A4.1 (line 353) on main; TypeAHeckeAlgebras H1 (line 40; relation line 11) on main; NilpotentOrbits N1 (line 129), N5.0 (line 239), N7 (line 390) on main; SchubertGeometry S1 (line 30) and S2 item 3 (subword/Bruhat criterion, π proper birational onto X(w)) on main; AlgebraicVectorBundles L0A–L2B (lines 215–340) on main; EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4 on main; ReductiveGroups Layers 2, 3, 7, 8, 9 (lines 227–1092), 10A (line 1733), 10B (line 1759), 11C (line 2057), 11D (line 2086) on main; RepresentationTheory/LieHighestWeight Layers 3, 4, 7, 9 (lines 405, 537, 931, 1432) on main; ComplexComparisonPartII §C−1.1 (`complexSchemeAnalytification`) at its open head, position 42; DeformationAndDerivedPatchingAlgebra §§1.13–1.16, 3.3, 3.4, 6.7 at its open head, position 69; FormalConnectionsOpers F2.2 (line 579) and F4.3 (line 1383) at the rev/1056 head (another author's new folder). None missing, none drifted, none later in the order.
- Gaps: the four `needs` sentences in `design/plan.json` are byte-identical to the README's contract lines (checked by script); suppliers ReductiveGroups, AlgebraicVectorBundles, SchemeAndStackFoundations, EnhancedDerivedSheaves; none `none`; each names hypotheses; minimality as in the r1 passes (nothing requested is on main or at the pins).
- Dependency check, run from the board checkout with the brief's command on the unmodified README:

```text
depcheck: 208 roadmaps, 1799 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` touches only `packages/SpringerResolutionAndCharacteristicCycles/` (README, Suggested, design/plan.json, metadata, three reports, sources.toml).
- Policy: no pull-request numbers, process words, `lemma` declarations or `set_option` in README or Lean (grep; the only "lemma" hits are source citations such as "Lemma 2.2.4"); every target carries a locator; no computational algorithm. The resolver's single lead `IsModification.isIso_of_isFinite` is a planned export of SchemeAndStackFoundations §4.11 (line 5528), not a claimed pinned name.
- Ownership by object: `roadmaps grep` over main and the open heads for "characteristic cycle", "Steinberg", "Grothendieck simultaneous", "Kazhdan–Lusztig", "strongly equivariant", "Hecke algebra" finds no other owner beyond the cited suppliers (TypeAHeckeAlgebras for type A; NilpotentOrbits for the complex Springer map). The r1 repair's note that TriangulineVarietyAndItsLocalModel (position 303) cites the superseded parabolic-invariance form concerns a consumer, not this package.

### Adversarial pass record

G: split connected reductive; C: char 0 or p>h; D: smooth separated finite-type pure n-dimensional over char 0. N=dim U, r=dim T, D_G=r+2N.

| Statement, context | Instances; values on each side | Result; change |
| --- | --- | --- |
| Conventions: dimensions, L_B(λ), κ₂=w⁻¹κ₁, signed moment, shift, weights, lengths | SL₂ (N,r,D)=(1,1,3); [gb,ρ(b)⁻¹x]↦x·ge₁ well defined so L_B(ρ)=O(−1), L_B(−ρ)=O(1) ample; GL₃ 3-cycle z=(1,2,4): w⁻¹z=(2,4,1), wz=(4,1,2); (−a dx)+(a dx)=0; x∂ʲδ=−j∂ʲ⁻¹δ, Tor₁=kδ, Li*δ[−1]=k in degree 0; M_e=M(−2ρ), M_s=M(0), KL matrix ((1,0),(1,1)); k[ε]/ε² lengths 2=1+1 | agree |
| §1.1–1.2 flag scheme, projectivity, G any field | torus F=pt; SL₂ F=P¹, dim B=2; GL₃ dim F=3; k[ε] line k(1,ε)≠k(1,0) with equal residue lines (sheaf quotient needed) | agree |
| §1.3–1.4 orbits, closures | SL₂ dim U_e=1, U_s=2, Ū_s=P¹×P¹; stabiliser Lie algebra t⊕(u∩Ad(ŵ)u) of dim r+N−ℓ(w); GL₃ six labels | agree |
| §1.5 subbundle intersection, reduced base | k² lines: ranks 0 (coordinate), 1 (equal); k[ε]/ε² spans (1,0),(1,ε): intersection (ε)e₁ not a summand | hypothesis needed; agree |
| §2.1–2.3 g̃, regular loci, properness | torus g̃=t, q=id; SL₂ centraliser dims of E₁₂,0,diag(1,−1): 1,3,1; rs fibre 2 flags, E₁₂ fibre one flag of length 2; proper+quasi-finite⇒finite at the pin | agree |
| §3.1–3.6 X, κ_i, strata, components | SL₂ chart equations c−2ax−bx²=0, c−2ay−by²=0; difference (x−y)(2a+b(x+y)); X_e: x=y, X_s: 2a+b(x+y)=0, dims 3; GL₂ κ₁=(a,b), κ₂=(b,a); V_s fibre t dim 1; X_s∩V_e∋(ke₁,ke₁,E₁₂) | agree |
| §3.7–3.9 lci, reduced, birational | SL₂ ambient 5, equations 2, dim 3; k[t,x]/(x²−t) reduced with fibre length 2; X_w→g̃ degree 1 over regular, q degree 2; torus identities | agree |
| §4.1 Cartan fibres | torus r−r=0; SL₂ 3−1=2 | agree |
| §4.2 BR CM, kernels, order | A₁: p=5,3 admitted, p=2 excluded; ω_(X_s)=O(−1,−1)=(ρ,ρ) twist; empty word O_Δ depth 3; F₃: [∂³,x]=0; S₃, w=s₁s₂: supports compose to Ū_(s₁s₂) with p₁₂^*F⊗p₂₃^*G but to Ū_(s₂s₁) with BR's p₁₂^*G⊗p₂₃^*F | S01: pin the convention |
| §4.3–4.4 CM, flatness | Z_(p)⊔Q[x,y]/(x²,xy): flat, special fibre CM, generic depth 0<1; isogeny kernel orders n+1,2,2,4,3,2,1,1,1 all <p; pt⊔A¹→A¹ local 0≠1+0 | agree |
| §5.1–5.4 Weyl relation, fibres, wall, normality | GL₃ (2,4,1)=w⁻¹(1,2,4); SL₂ fibres dims 1,0; z=0: E₁₂ centraliser dim 1; gl₃ diag(a,a,c)+E₁₂ centraliser dim 3=r; codim-1 boundary forces a reflection; SL₂ X_e,X_s regular, union not normal | agree |
| §6.1–6.6 cone, Springer, cotangent, Steinberg | sl₂ a²+bc; gl₂ trace/det, Killing degenerate on centre; k[ε] central εI excluded; SL₂ 𝒩̃=Tot O(−2); tr(E₁₂E₂₁)=1, doubled form needs E₁₂/2; (−ψ,ψ) moment 0; Z_e=diag T*P¹, Z_s=P¹×P¹×{0}, meet in P¹; conormal ranks 1,0 | agree |
| §7.1–7.4 cycles, zero fibres | V(xy): Z²; A¹: [0] not top; k[ε]: 2[pt]=1+1; κ₁ on X_s = b(x−y)/2: zero fibre b=0 (ψ=0, Z_s) and x=y (ψ=b((−x,1),(−x²,x)) nilpotent preserving (1,x), Z_e), coefficients (1,1); k[x,t]/(x²−t) mod t length 2 | agree |
| §8.1–8.6 D-modules, filtrations, Ch, CC | [∂,x]=1; ranks of F₀,F₁,F₂ 1,2,3; gr O=k[x] with ξ=0; constant filtration unbounded below; a=1 for a unit shift; D/Dx²: gr=k[x,ξ]/(x²), length 2 at (x), G98 rank 1; D⊕O: CC=[A²]≠[A²]+[ξ=0] | agree |
| §9.1–9.3 transfer, Kashiwara, Bernstein | identity transfer D, shift 0; δ: ker x=kδ, coker 0; dual of O: cokernel of ∂·:D→D in degree 1, [1] returns degree 0; dims 1,1,2≥1; trace of [∂,x]=1 forbids finite-dimensional modules | agree |
| §9.4 holonomic category, API bullet 4 | O,δ,0 holonomic, D not; K₀-additivity is §9.5's theorem | S04: delete bullet |
| §9.5–9.7 length, extension, regularity | δ⊕δ: length 2, cycle 2; G_m⊂A¹: j_+O/O≅δ; ∂e=e at ∞: pole order 2; M23 Def 7.30 uses locally closed curve immersions as the README does | agree |
| §9.8 strong equivariance | G_m on a point: weight 1 differential 1≠0 rejected; H=1: D_(A¹) with CC [A²] | agree |
| §9.9 moment support, classification | SL₂ double flags: 2 orbits, stabilisers B,T connected, 2 simples; Z/2 swapping two points: O=k⊕k simple equivariant, not D-simple | S03: name the category |
| §10.1–10.4 D-affinity, Loc, Ind, O_χ₀ | torus ΓD=k; SL₂ ω∈X*(T), X*(SL₂)=0; PGL₂ 2ω only; Loc(k)=O_F; k[z]/z² excluded; Ind δ_(eB)=diagonal direct image, CC=[Z_e]; Ind O_F=O_(F×F), CC=[Z_(w₀)]; M_e=L_e, M_s⊃L_e with quotient L_s=k; ⟨ww₀·0,α∨⟩≥0 iff s_αw<w, so P_w stabilises Ū_w | agree |
| §11.1 Verma cycle | SL₂ CC(M_e)=(1,0), CC(M_s)=(1,1); BR Prop 2.14.2: Ch(M̃_w)=[Z′_(w⁻¹)], Z′_(w⁻¹) over X⁰_w=U_w, so the label is w here (induction in the second factor on both sides); H^BM₄(Z(C))=Q²; inputs (2.14.1) quoted from [28],[43],[54] | S02: primary locators |
| §11.2–11.4 triangularity, KL, bases | SL₂ A=I; m_(s,e)=P_(e,s)(1)=1, m_(e,s)=P_(s,e)(1)=0 (Humphreys-form indices with M_w=M(w·(−2ρ))); A₃ P=1+q gives 2; det M=1, M⁻¹=((1,0),(−1,1)); S₃ Hecke rank 6, Z[S₃] at v=1 | agree |
| §12.1 parabolic | SL₂ pairings −2,0: P_e=B, P_s=G; SL₃ s₁: pairings 0,−3; torus P=G | agree |
| §12.2 saturation (repaired headline) | SL₂ w=e: u=((1,1),(0,1)) moves (ke₂,ke₂,0) off Z_e; g₁pB=g₁B so saturation is the identity; w=s: Z_s=F²×{0} saturated; SL₃ s₁: Z_(s₁) depends only on the common plane, dim 6; covector transport Ad(g₁p)b⊂Ad(g₁)p_w; pr smooth ⇒ generic lengths preserved | agree |
| §13.1–13.5 Cartan graphs, completion, tangent bound | SL₂ k[x,y]/(x²−y²), graphs y=±x; char 2: invariants k[t], fibre product the reduced diagonal; GL₃ graph (1,2,4)→(2,4,1); k[[x]]→k[[x,y]] closed fibre k[[y]], 2=1+1; faithfully flat completed Cartan map forces I_(w′)Ô=I_wÔ hence w′=w; bounds (e,e) 1+1+1, (s,e) 2+0+1, (s,s) 2+1+0, torus 0+r+0; (N+ℓ(w))+(r−ℓ(w)+ℓ(v))+(N−ℓ(v))=D | agree |
| §14.1–14.4 completion of cycles, completed KL | A¹: [k[[t]]]; y²=x²(1+x): branches y∓x(1+x/2−x²/8+…), (1,1); V(xy) at (1,0): (1,0); point k²: 2; SL₂ w=s on Z_e∩Z_s: (1,1)=(1,0)+(0,1), off Z_s 1=1+0; torus 1=1 | agree |
| Gaps | p=3 for A₁ (3>2); x↦xᵖ isogeny excluded by invertible degree; frame torsor of O(1) weights 1,−1,0 give O(1),O(−1),O; node completion at a generic point has dimension 0≠1 (closed-point hypothesis); EDS §0.3 tensor is for commutative R | agree |
| Layer Dependencies blocks | mechanical set difference with Needs lines per layer | S05 |

## Not verifiable

- No Lean was run (read-only brief); the acceptance file has no declaration, so no elaborated signature exists to compare with the README.
- The §11.1 inputs quoted by BR12 §2.14 from Ginzburg (1986), Kashiwara–Tanisaki (1984) and Riche (2008) were not read: they are not in the manifest (S02 asks for them). Their statements were not assumed in any verdict above.
- The positive-characteristic localisation, Azumaya splitting and convolution constructions owned by §4.2 and the KL multiplicity theorem owned by §11.3 (settled F04) are not certified by the small examples; only their conventions and hypotheses were checked.
- Ownership against open pull requests was checked through the roadmap index and `roadmaps grep`, and by reading the sibling heads named in the brief for the cited sections; other open heads were not read file by file.

## Source issues

- none

(The BHS19 Lemma 2.4.8/Remark 2.4.9 error, the BHS19 Lemma 2.3.2 and Proposition 2.3.3 issues, and the G98 Definition 1.1.12 multiplicity error re-encountered while checking locators this pass are already in the register from the round-1 passes and are not repeated.)

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4f98d3f6c284d32b58469e41b8c7e7ae3f93af81", "job": "RT-SpringerResolutionAndCharacteristicCycles~2b", "model": "fable", "worker": "chris-x9"} -->
