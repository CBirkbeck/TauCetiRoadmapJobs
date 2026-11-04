<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1674#issuecomment-6625723159 -->
Red team round 2 pass b (claude) of 906c684

Verdict: needs_changes

1. **F01** (P1) the Schneider–Lang step of §0.7(b) cites a supplier section that does not state it

   Location: `packages/SheafConvolutionOnAbelianVarieties/README.md:115` ("Consume §3.5 for the Schneider–Lang criterion, used in §0.7(b) to show that a translate of a character subtorus whose Betti and de Rham points are defined over Q̄ contains a point of finite order"); :326 and :334 (`*Needs:*` … DiophantineApproximationAndTranscendence §3.5).

   Claim: DiophantineApproximationAndTranscendence §3.5 supplies the criterion in the form that Sim Theorem 3.3 needs.

   Witness: DiophantineApproximationAndTranscendence §3.5 on main ("### 3.5 Schneider–Lang and Baker independence", its README lines 2336–2380) states Schneider–Lang only in Waldschmidt's exponential form, for the groups ℂ^{d₀}×(ℂ^×)^{d₁} (its supplier LinearFormsInLogarithms says so at its README line 10). Sim lines 376–380 (Proposition 3.4) apply the criterion to the commutative algebraic group A♮, the vector extension of the dual abelian variety. A roadmap search for Schneider–Lang finds only LinearFormsInLogarithms, in the exponential form; no roadmap, pinned declaration or declared gap owns the algebraic-group form.

   Repair: declare the step as a gap. In `design/plan.json` `gaps` add `{"slug": "vector-extension-torsion-criterion", "supplier": "DiophantineApproximationAndTranscendence", "section": "3.5", "needs": …}` and under the DiophantineApproximationAndTranscendence contract (:113–115) write: "Consume §3.5 for the exponential-form Schneider–Lang criterion. What DiophantineApproximationAndTranscendence must provide (gap:vector-extension-torsion-criterion): For an abelian variety A over Q̄, a point of A♮(ℂ) that is a Q̄-point of A♮ and whose holonomy character π₁(A,0)→ℂ^× takes values in Q̄^× is a torsion point of A♮ (Schneider–Lang for the commutative algebraic group A♮; Sim, Proposition 3.4, p. 369, Sim line 376)." In §0.7 `*Needs:*` and the Layer 0 Dependencies replace "DiophantineApproximationAndTranscendence §3.5" by "DiophantineApproximationAndTranscendence §3.5; vector-extension torsion-criterion contract", and in the §0.7 proof route write "by the vector-extension torsion-criterion contract (Sim Theorem 3.3)". Tested on the refuting instance: for ρ=(2,1) on an elliptic curve over Q̄ the holonomy values are algebraic and ρ has infinite order (2^k≠1), so the contract says Φ⁻¹(ρ) is not a Q̄-point of E♮, which is exactly what §0.7's second Check uses; the exponential-form criterion of §3.5 says nothing about E♮.

2. **F02** (P2) §4.3(f) asserts an effectiveness that the source denies

   Location: `README.md:684` ("[e]_*cc(N)=S(Λ₁,…,Λ_r) with Λ_i=cc(Ψ^e U_i) effective clean cycles of degree dim U_i"); API bullet :693 ("so cc(Ψ^e U) is effective although Ψ^e U is in general only a virtual representation"); proof route :695 ("effectiveness follows from the displayed character of Ψ^e U and (e)"); consumed at :713 ("Apply the isogeny lifting §4.3(f), which produces effective clean cycles").

   Claim: the cycles cc(Ψ^e U_i) on A are effective.

   Witness: K2 line 783 says the cycles Λ_i of Theorem 2.3.1 need not be effective and only their pushforwards g_*Λ_i to A/Γ_tors are, and line 796 names this "effective up to isogeny". The README's argument through (e) fails because T_u need not lie in a maximal torus of G_u: in SO₃×SO₃ the diagonalizable subgroup V₄×SO₂ (V₄ the diagonal sign matrices of SO₃) lies in no torus; for Ĝ=SL₂→SO₃ on the first factor, Ψ²U=Sym²U−1 has T-character e²+e⁻², nonnegative, but its restriction to V₄ is ε₁+ε₂+ε₃−1, which is not nonnegative, so a nonnegative weight character does not give a nonnegative X_u-graded dimension. A second defect: cc is defined on R(G_u) ((c), :684) while Ψ^e U_i lies in R(G_u°), so (f) is only meaningful when G_u is connected (K2 line 776: "the group G = G(M) must be connected").

   Repair: restate (f): "(f) Suppose G_u is connected, which (d) achieves after replacing K by f_*K for an isogeny f with K₀⊂ker f, and let p:Ĝ→G_u be a central isogeny of degree e from a connected reductive group. If N∈⟨K⟩ and p⁎ω_u(N)≅S(U₁,…,U_r), then [e]_*cc(N)=S(Λ₁,…,Λ_r) with Λ_i=cc(Ψ^e U_i)∈⟨cc(K)⟩ of degree dim U_i, effective up to isogeny: for g:A→A/X_(u,tors) each g_*Λ_i is effective, so if t is the exponent of X_(u,tors) and q∘g=[t], then [et]_*cc(N)=S(q_*g_*Λ₁,…,q_*g_*Λ_r) with effective clean factors of degrees dim U_i." Replace the API bullet by "Ψ^e U has character Σ_λ m_λ e^(eλ) with nonnegative coefficients, so g_*cc(Ψ^e U) is effective on A/X_(u,tors); cc(Ψ^e U) itself need not be effective." In §4.4 (:713) write "Apply the isogeny lifting §4.3(f), whose further isogeny [et] produces effective clean cycles of degrees the dimensions of the two factors." Add the negative control as a Check: "On SO₃ the Klein four-group of diagonal sign matrices lies in no torus; Ψ²U=Sym²U−1 for SL₂→SO₃ restricts to it as ε₁+ε₂+ε₃−1, so a nonnegative T-character need not restrict to a nonnegative T_u-character, and effectiveness is asserted only after the isogeny." The statement of §4.4 (free m, effective Λ₁,Λ₂) already matches K2 Proposition 6.1.1 (K2 line 1402–1408) and needs no change; its degree bookkeeping is unaffected since q_*g_* preserves Gauss degrees.

3. **F03** (P3) the References list omits BSS, Sch and Sim

   Location: `README.md:1412–1422` ("All locators refer to the versions listed here." followed by LS, KW, K1, K2, EHS, W, CDK, JV, BR only).

   Claim: every cited work is listed with its version.

   Witness: §0.4 (:243) cites "BSS, Theorem 1.1 … Corollary 2.10", §0.7 (:315) cites "Sim, Theorem 3.1(c) … Sch, Definition 2.3 …", §0.8 (:338) cites "Sch, Theorem 7.3 … Corollary 7.5"; `sources.toml` records BSS (arXiv 1702.06395v1), Sch (arXiv 1307.1937v1) and Sim (Numdam, Ann. Sci. ÉNS 26 (1993)); none appears in the README list.

   Repair: append three bullets after BR: "- BSS: Bhargav Bhatt, Christian Schnell and Peter Scholze, [Vanishing theorems for perverse sheaves on abelian varieties, revisited](https://arxiv.org/abs/1702.06395), arXiv v1 (2017), Theorem 1.1, p. 1, Lemma 2.6, Proposition 2.7, Lemma 2.8, Remark 2.9 and Corollary 2.10, pp. 4–5; published in Selecta Math. 24 (2018), 63–84, not collated." "- Sch: Christian Schnell, [Holonomic D-modules on abelian varieties](https://arxiv.org/abs/1307.1937v1), arXiv v1 (2013), Definition 2.3, Theorem 7.3, Corollary 7.5, Theorems 10.5, 15.1, 16.1, Proposition 16.2, Definition 17.3, Theorem 17.4, Lemmas 17.5–17.6; published in Publ. Math. IHÉS 121 (2015), 1–55, not collated." "- Sim: Carlos Simpson, [Subspaces of moduli spaces of rank one local systems](https://doi.org/10.24033/asens.1675), Ann. Sci. École Norm. Sup. 26 (1993), 361–401, Theorem 3.1(c), Corollary 3.2, Theorem 3.3, Proposition 3.4, Theorem 6.1." Tested: each locator named here resolves in the cached texts (BSS lines 25, 172, 183, 192, 214, 221; Sch lines 90, 423, 453, 616, 1033, 1236, 1242, 1291, 1300, 1309, 1325; Sim lines 243, 360, 367, 376, 655).

4. **F04** (P3) §0.7 constructs A♮, which AbelianSchemesAndArithmeticModuli §A4.2 owns

   Location: `README.md:315` ("Construct A♮, the moduli space of algebraic line bundles with integrable connection on A; it is a quasi-projective connected commutative algebraic group of dimension 2g, an extension of the dual abelian variety by the vector group H⁰(A,Ω¹_A)"); proof route :326 ("Identify A♮ through the universal vector extension of the dual abelian variety"); `*Needs:*` :334 lists only AbelianSchemesAndArithmeticModuli §§A3.1–A3.5.

   Claim: this roadmap constructs A♮.

   Witness: AbelianSchemesAndArithmeticModuli §A4.2 "The universal vector extension" (open head #849, earlier in the merge order; its README lines 1851–1875) constructs `AbelianVectorExtension`, the extension 0→V(ω_{A^∨})→E(A)→A→0, and "identifies E(A) with the moduli of rigidified line bundles with connection on A^∨ …; the same moduli problem on A gives E(A^∨)", which is A♮.

   Repair: replace the quoted sentence by "Let A♮=E(Â) be the universal vector extension of the dual abelian variety, AbelianSchemesAndArithmeticModuli §A4.2 (`AbelianVectorExtension` on Â, identified there with the moduli of rigidified line bundles with integrable connection on A): a connected commutative algebraic group of dimension 2g, an extension of Â by the vector group of H⁰(A,Ω¹_A)." Delete "Identify A♮ through the universal vector extension of the dual abelian variety and" from the proof route, and add "AbelianSchemesAndArithmeticModuli §A4.2" to the §0.7 `*Needs:*`, the Layer 0 Dependencies and the AbelianSchemesAndArithmeticModuli contract (:75). Tested on the instance of the first §0.7 Check: for an elliptic curve E, E♮=E(Ê) is a G_a-extension of Ê≅E of dimension 2, and the connections d+t·dz form its fibre over the trivial bundle, as the Check uses.

## Round-1 findings at this head

Every round-1 finding was checked against `packages/SheafConvolutionOnAbelianVarieties/README.md` and `Suggested.lean` at 906c684. The repair report marked none `not actionable`, so there is nothing to re-raise.

| Finding | Status | Witness at this head |
|---|---|---|
| a-F01 (P1) generic vanishing used as its own input | repaired | §0.4 (README:243) now proves generic vanishing by the Fourier–Mellin transform, citing BSS Theorem 1.1, Proposition 2.7, Corollary 2.10 (BSS lines 25, 183, 221, read); the proof route ends "This route uses neither convolution nor any Tannakian quotient" (:254). Simpson's theorems are §0.7 (:313) and the structure theorem §0.8 (:336). The gap `stein-perverse-artin-vanishing` is in plan.json `gaps` and at README:109. Repair check: README:258 "dimensions 1,2,1 … 0,0,0 … S^(−1)=S^1={1}", :259 "L_α[1] has S^(±1)={α⁻¹}; its exceptional character is non-torsion". The new text introduces S01, S03 and S04 below. |
| a-F02 (P1) microlocal fibre functor unowned | repaired | New §4.3 (:682–705) states (a)–(f) with K1 Theorems 1.5, 1.7, 5.10 (K1 lines 227, 360, 1893, read) and K2 Proposition 1.3.3, Theorem 2.1.1, Corollaries 2.1.2, 2.2.2, Theorem 2.2.3, Corollary 2.2.4, Theorem 2.3.1 (K2 lines 452, 580, 611, 637, 677, 711, 728, read). §4.4 (:713) and §4.5 (:733) consume §4.3(d), (f) and (b). Repair checks at :699–700: δₓ multiplicity 1, δₓ⊕δₓ multiplicity 2, (2Λₓ)◦(3Λᵧ) multiplicity 6. Gap `microdifferential-localization` in plan.json and at :99. Introduced error: S02 below. |
| a-F03 (P2) "reductive" dropped connectedness | repaired | Conventions :21 "A finite-type affine group … whose identity component is reductive is called linearly reductive … Reductive without qualification means connected reductive"; §1.3 :419 "G(K,χ) is linearly reductive: its identity component is reductive, while G(K,χ) itself may be disconnected"; §7.5 :1211 "linearly reductive algebraic subgroup B⊂N^c"; contract :41 names `TauCeti.FiniteTypeAffineGroupSchemeCat` (FiniteType.lean:97 at pin 358314d4) and `TauCeti.geometricallyConnected_of_reductiveAffineGroupSchemeProperty` (Reductive/Basic.lean:110). Checks: μ₂ at :438, Q₈ at :1229. |
| a-F04 (P1) 13/4<4 | repaired | :1086 "h(v+1)≥⌈A₁/(2(n−1))⌉≥4 … at n=5 the ceiling is ⌈26/8⌉=⌈13/4⌉=4, and for n≥6 the comparison 9(n−1)≤A₁ … gives A₁/(2(n−1))≥9/2"; Check :1090. Recomputed: 26/8=3.25, ceiling 4; n=6: A₁=57, 57/10=5.7, ceiling 6; 9·5=45≤57. |
| a-F05 (P3) locators | repaired | :729 "LS line 966" (LS 966 begins Lemma 3.8); :660 and :111 "K2 line 628" (Definition 2.2.1); :219 "W line 24" (the Proposition); :1419 title "A remark on rigidity of BN-sheaves" (W line 6). |
| a-F06 (P3) Checks | repaired | §5.3 :899 "binom(96,20)=216182590635135019896 is divisible by 6 and D₂=36030431772522503316=binom(94,19)" (recomputed: remainder 0, equality holds); §1.4 :454 real μ₂-torsor; §6.4 :1076; §6.6 :1109–1111; §8.3 :1305. "Record n>2" and the other scope reminders are gone (grep). |
| a-F07 (P3) comparison cited to the de Rham section | repaired | :9, :47, :105 cite "ComplexComparisonPartII §C6.6 (`adicArtinComparison`)" for étale–Betti cohomology and Euler characteristics and EtaleDualityAndPerverseSheaves §3.5 for the perverse comparison; ComplexComparisonPartII at its open head (#848) has "### C6.6 Integral and rational Artin comparison" with `adicArtinComparison` (its README lines 4324, 4331) and "### C5.6 Regular singular connections" (3722); EtaleDualityAndPerverseSheaves has "### 3.5 Betti comparison of perverse categories" (3320). |
| b-F01 (P3) ReductiveGroups Layer 7 for a Layer 6 criterion | repaired | :440 and :480 "ReductiveGroups Layers 3 and 6"; ReductiveGroups on main has "### Layer 3: subgroups, quotients, components" (234) and "### Layer 6: reductive and semisimple groups" (466) with the characteristic-zero equivalence. |
| b-F02 (P3) `fourfold_exterior_impossible` redundant | repaired | `Suggested.lean` has 9 declarations and no such name (grep); :980 "The n=4 case of the headline `exterior_eulerian_classification` (§6.6) is this statement." |

## Verified sound

Counts: 9 `Suggested.lean` declarations read (4 definitions, 5 theorems) and compared with the elaborated types in the worker's signature record (no `variable` block, no binder lost); 56 README targets read (Layers 0–9, every section), 18 declared gaps checked (each has a named supplier, a one-object `needs` with hypotheses, and the same slug and supplier in `design/plan.json` and the README; none asks for what Mathlib, Tau Ceti, a supplier or an earlier roadmap already provides: SpringerResolutionAndCharacteristicCycles' design has no microlocalization, ComplexComparisonPartII at #848 has no Stein Artin vanishing, StableReductionPartII MC.6 compares Hodge bundles only); 49 locators verified against the cached texts (BSS 7, Sim 5, Sch 12, K1 5, K2 12, LS 2, W 2, KW 4), each on the cited page; 41 Checks recomputed (listed below); 73 cross-roadmap section anchors resolved at their current copies (EtaleCohomologyFoundations, ClassicalArithmeticCompletion, ReductiveGroups, JacobianChallenge, DiophantineApproximationAndTranscendence, SchemeAndStackFoundations on main; HodgeStructures in Completed; EtaleDualityAndPerverseSheaves, MotivesAndAlgebraicCycles, AbelianSchemesAndArithmeticModuli, PadicHodgeTheory, DeligneWeightsAndPurity, ShimuraData, ShimuraVarieties, AlgebraicModuliForArithmeticGeometry, JacobianChallengePartII, MordellLawrenceVenkatesh, LieHighestWeight, SpinRepresentations, ComplexComparisonPartII at their open heads; SpringerResolutionAndCharacteristicCycles, LieHighestWeightPartII and StableReductionPartII as design packages on the board's main, which is where the three "found nowhere" leads of the citation scan resolve); 12 pinned declarations grepped at Mathlib f6090c70 and Tau Ceti 358314d4.

**Policy.** `git diff --stat origin/main...HEAD` touches only `packages/SheafConvolutionOnAbelianVarieties/` (README.md, Suggested.lean, design/plan.json gaps, metadata.toml, sources.toml, reports/). No pull-request number or process word in README or docstrings (the word "repairs" at README:1348 is mathematical). `Suggested.lean`: single `import Mathlib`, no Tau Ceti import, no `lemma`, `set_option`, `#eval`, `#print`, `True` placeholder or sorry'd data; `sorry` only in the five theorems; every declaration has a docstring; every Lean name appears in the README and every backticked own name of the README is declared.

**Dependency gate** (run on this head, verbatim; no UPWARD, CYCLE or moved line):

```text
depcheck: 204 roadmaps, 1758 edges, 0 problem(s)
```

**Pinned declarations** at the pins: `ObjectProperty.SerreClassLocalization.abelian`, `.preservesFiniteLimits` (Localization.lean:427), `.preservesFiniteColimits` (:433); `Finset.powersetCard` (Powerset.lean:197), `Finset.card_powersetCard` (:211); `Nat.choose` (Choose/Basic.lean:50); `DerivedCategory` (DerivedCategory/Basic.lean:87); `Matrix.GeneralLinearGroup` (GeneralLinearGroup/Defs.lean:42); `Subgroup.index` (Index.lean:55, ℕ-valued); `Subgroup.Normal` (Subgroup/Defs.lean:606); `TauCeti.AffineGroupSchemeCat` (AffineGroupScheme/Basic.lean:55), `TauCeti.ReductiveAffineGroupSchemeCat` (Reductive/Basic.lean:89), `TauCeti.FiniteTypeAffineGroupSchemeCat` (FiniteType.lean:97), `TauCeti.geometricallyConnected_of_reductiveAffineGroupSchemeProperty` (Reductive/Basic.lean:110), `TauCeti.AlgebraicGeometry.AbelianVariety` (AbelianVariety/Basic.lean:95), `TauCeti.Tannaka.tensorAutFunctor` (GroupFunctor.lean:63), `TauCeti.Tannaka.fgPointTensorIsoEquiv` (Equivalence.lean:188).

**Ownership.** Searched by object (roadmap service over main and the open heads, the 55 sibling checkouts named in the brief, the board's packages): Fourier–Mellin generic vanishing, Simpson's triple-torus theorems, the structure of cohomology support loci, the microlocal fibre functor and cycle–weight dictionary, clean cycle convolution, the exterior-weight classification, the uniform Jordan theorem and the transport Hodge relation have no other owner; the universal vector extension A♮ does (S04). The "generic vanishing" hits elsewhere (EtaleDualityAndPerverseSheaves §6, AnabelianGeometryAndNonabelianChabauty, PotentialAutomorphyInfrastructure) are different statements.

### Declarations of `Suggested.lean`

All in `namespace TauCetiRoadmap.SheafConvolutionOnAbelianVarieties`, no section variables; the elaborated types in the signature record match the source.

| Declaration (line) / README | Context | Instances and computed values | Result |
|---|---|---|---|
| `wedgeMultiplicity` (42) / §5.1 | `{m} (w : Fin m → ℤ) (k : ℕ) (t : ℤ) : ℕ` | (0,0,0,0),k=2,t=0: 6; m=0,k=0: 1 at t=0, else 0; m=2,k=3: 0; (−1,0,1),k=2: 1,1,1 at −1,0,1 | matches the §5.1 Checks; real body |
| `exceptionalPair` (47) / §5.2 | `ℕ → ℕ × ℕ` | j=0..4: (1,5),(5,20),(20,76),(76,285),(285,1065); a²−4ab+b²−a−b=0 at each, e.g. (76,285): 361=361; every subtraction 4b+1−a exact | sound |
| `exceptionalDegree` (53) / §5.3 | `ℕ → ℕ`, natural division | D₀=6/6=1, D₁=53130/6=8855=C(23,4), D₂=C(96,20)/6=C(94,19); remainders 0,0,0 | sound; exact for the sequence |
| `hasEulerianExteriorWeights` (59) / §5.1 | `{m} w k n d s : Prop`, descent `σ(i+1)<σ(i)` on `Fin n` | descent counts give rows (1),(1,1),(1,4,1),(1,11,11,1),(1,26,66,26,1),(1,57,302,302,57,1) for n=1..6, equal to ClassicalArithmeticCompletion §2.18's recurrence values; (0,0,1,1),k=2,n=3,d=1,s=0 holds with 0 at q=−1,3; (0,0,0,0) gives 6 at one weight, fails; (0,0,1,2),k=2 gives 1,2,2,1 ≠ 1,11,11,1; n=0 forces every count 0 (unused, n≥2) | sound |
| `exceptionalPair_classification` (69) / §5.2 | a b : ℕ, 0<a, a≤b | positive solutions with a<120, b<500 are exactly (1,5),(5,20),(20,76),(76,285); a=b gives −2a²=2a impossible; (5,1) excluded by a≤b; ∃! by strict growth | iff holds both ways |
| `surface_exterior_classification` (77) / §5.6 | 1<k, k+1<m, 2k≤m, 1≤d, n=2 row | brute force m≤10, weights −2..3: solutions exactly (m,k,d)=(4,2,3),(6,3,10),(8,4,35),(10,5,126), each with m=2k, d=C(2k−1,k), histogram (2k−1)[v]+[v+1] or its mirror | true as typed |
| `threefold_exterior_classification` (89) / §5.7 | same, n=3 row | brute force m≤10: only (4,2,1) with weights v,v,v+1,v+1; j=1 branch (25,5,8855): endpoint C(23,4)=8855, middle C(23,5)+C(23,3)=35420=4·8855 | true as typed |
| `exterior_eulerian_classification` (106) / §6.6 | 2≤n, 1≤d, 1<k, k+1<m, no normalization | brute force m≤10, n≤5: no row for n=4,5; n=2 with k₀=2 falls in the first disjunct (m=4,k=2), k₀>2 in the second (2<min, d=C(2k₀−1,k₀)); complement (25,20): min=5, same d | matches LS Proposition B.1 |
| `jordan_finite_linear_groups` (123) / §7.4 | n, 1≤n; ∃J before ∀F:Type u [Field F][CharZero F] Γ [Finite Γ]; B.index in Γ | n=1: J=1; Q₈⊂GL₂(ℂ): C₄ normal, index 2; D_{2q}: rotations, index 2 for all q; char p: abelian subgroups of SL₂(F_q) have order ≤q+1, index ≥q(q−1) unbounded, so `CharZero` is needed | true; J uniform in F |

One-tactic probe: none of the nine follows from a definition, a library lemma, a Check or a boundary case; `exceptionalPair_classification` needs the descent (4a+1−b,a). Headlines not statable at the pins are named in the module docstring with their missing carriers (perverse categories, character sheaves, conormal cycle ring, sheaf groups, period maps); no stand-in is written.

### README targets

One row per target; "k.o." means the instance was recomputed here. E is a complex elliptic curve, δₓ a rank-one skyscraper.

| Target | Instances and values | Result |
|---|---|---|
| §0.1 | dim A=0: Π={1}; B=A: T_A={1}; antidiagonal of E²: kernel χ₁=χ₂, codim 2; Π(E)[2] has 4 elements | sound |
| §0.2 | χ=1: constant sheaf, origin action 1; twisting by a nontrivial arithmetic sign character keeps geometric monodromy, origin action −1 | normalization discriminates |
| §0.3 | δₓ*δᵧ=δ_{x+y}, δₓ∨=δ_{−x}; δ₀ unit; shift-one exchange sign −1 | sound; W line 24 |
| §0.4 | E, F[1]: dims (1,2,1) at χ=1, Euler 0; (0,0,0) off χ=1; S^{±1}={1}, codim 2≥1; L_α[1]: S^{±1}={α⁻¹} non-torsion; δₓ: FM free of rank 1 in degree 0; BSS equation (2) gives the R-dual as FM([−1]*D K) (BSS line 158), Remark 2.9 gives codim H^i ≥ i (line 214), Cor 2.10 gives (2)–(4) (line 221) | sound as stated |
| §0.5 | χ(δ₀)=1; χ(F_E[1])=0; δ₀⊕δ₀[1]: total 0, pH⁰=pH⁻¹=δ₀ nonnegligible | sound |
| §0.6 | Q(F_E[1])=0; End(Qδ₀)=F; higher pH^j(K*L) killed | conditional on the heart gap |
| §0.7 | d+t·dz on E: holonomy (e^{−t},e^{−tτ}); a relation x^a y^b=1 needs a+bτ=0, so a=b=0 for τ∉ℝ: dense; ρ=(2,1) infinite order (2^k≠1); B=0: T=Char, B=A: T={1}; antidiagonal of E²: T_C={χ₁=χ₂}; (a) is Sim 3.1(c)+Cor 3.2 (lines 247, 360), (b) is Sch Def 17.3+Thm 17.4 (lines 1291, 1300) | statements sound; supplier defect S01, ownership S04 |
| §0.8 | F[1] on E: S^{±1}=1·T_E arithmetic; L_α[1]: {α⁻¹} linear not arithmetic; antidiagonal curve: T_C codim 2; δₓ: S^j=∅ for j≠0, S⁰₁=Char (B=0); B≠0 forced by codim≥1; Sch 7.3(a),(b) (line 423), Cor 7.5 (453), Thm 15.1 (1033), Thm 10.5 (616), Prop 16.2 (1242), Lemmas 17.5–17.6 (1309, 1325) | sound; see Source issues for Sch 17.2 |
| §1.1 | δₓ admissible for all χ; F_E[1] fails at χ=1 (H^{±1}=F), admissible and zero in the quotient for χ≠1 | sound |
| §1.2 | ω(δ₀)=F; ω(δₓ*δᵧ) dim 1=1·1; negligible admissible object has fibre 0 | sound |
| §1.3 | δ₀: trivial group; δₓ order 2: μ₂ (2 components, in FiniteTypeAffineGroupSchemeCat, identity component trivial); infinite order: G_m; K⊕K: diagonal | sound with the linearly reductive convention |
| §1.4 | diag(2,1) sends E₁₂ to 2E₁₂; x²=−1 over ℝ: 0 real, 2 complex points | sound |
| §1.5 | χ(δₓ)=1; δₓ⊕δₓ: χ=2, not simple; KW 10.1(b) (line 794) | sound |
| §2.1 | nonsplit unipotent [[1,1],[0,1]] at 0: geometrically 2 units, arithmetically not semisimple; δ₀⊗V pulls back to dim V units | sound |
| §2.2 | A=Spec k: G_geo=1, G_ar=Gal^alg; k=k̄: equal categories | sound; EHS gap declared |
| §2.3 | identity Galois image (dim 0) normalizes SL₂ (dim 3) without containing it | sound |
| §2.4 | δₓ with x∈A(k): End dimension 1 before and after; new K-points excluded | sound; gap declared |
| §3.1 | n=2: (−d,d), e_top=−2d; n=3: (d,−4d,d), N=6d; n=4: (d,11d,11d,d), N=24d; n=2,d=1: χ(O_H)=−1≠dim V_H=2 | sound |
| §3.2 | n=2: shift [1], dim 2d; n=3,d=1: dim 6, degree 2; i_*F[n] outside the heart | sound |
| §3.3 | n=3,d=1: native weights 0,−1,−2 with 1,4,1, total 6; HT(ℚ_p(1))=+1 | convention consistent |
| §4.1 | Λₓ◦Λᵧ=Λ_{x+y}, deg 1; (2Λₓ)◦(3Λᵧ)=6Λ_{x+y}, deg 6=2·3; n>0 zero section: clean part 0 | sound |
| §4.2 | cc(δₓ)=Λₓ deg 1=χ; CC(F_E[1]) zero section, cc=0=χ; rank 2: 2Λ_Z; cc(K_H)=Λ_H deg N | sound |
| §4.3 | δₓ: one weight x, mult 1; δₓ⊕δₓ: 2; δₓ^{⊕2}*δᵧ^{⊕3}: weight x+y mult 6; λ²(Λₓ+Λᵧ)=½(Λ_{2x}+2Λ_{x+y}+Λ_{2y}−Λ_{2x}−Λ_{2y})=Λ_{x+y}; SL₂→PGL₂: Ψ²U weights ±2 coefficient 1, deg 2, Sym² dim 3; elliptic SL₃ example: X_u=ℤp rank 1<2; new: V₄⊂SO₃, Ψ²U restricted ε₁+ε₂+ε₃−1 | (a)–(e) sound; (f) S02 |
| §4.4 | Λ₁=Λₓ+Λᵧ, Λ₂=Λ_z+Λ_t, four distinct sums: deg 2·2=4, each Λ_{x+z} mult 1 from one pair, support maps {x+z}→{x},{z}; x+z=y+t: mult 2; δₓ: derived algebra 0; K2 Prop 6.1.1 (line 1402) matches the statement | sound |
| §4.5 | n=3,d=1: six weights, one orbit, mult 1; SL₂ standard {−1,1} one orbit, Sym² {−2,0,2} two orbits; coefficient 2 gives mult 2 | sound |
| §4.6 | n=3,d=1: deg Λ_{Z₁}=6, deg Λ₁·deg Λ₂=6 ⇒ deg Λ₂=1<2; kernel of size 4: generic restriction degree 1; surface d>1: dim Alb(H)=1+d>2 | sound; gaps declared |
| §4.7 | 27≡3, 56≡2 (mod 6); 2^r mod 3∈{1,2}; ∧²SL₄=SO₆ kept; n=2,d=28: N=56, premise fails; zero weight dim 1<6 | sound |
| §4.8 | n=3: shift 2, sign +, SO₆; n=4: shift 3, sign −, Sp; standard SL₆ not self-dual | sound |
| §5.1 | as in the declaration table; complement t↦T−t on (−1,0,1); translation by 3 adds 6 at k=2 | sound |
| §5.2 | (1,5): 1−20+25=6=1+5; (5,20): 25=25; (20,76): 96=96; (76,285): 361=361; (0,0) excluded by a>0 | sound |
| §5.3 | D₁=8855, 6D₁=53130; D₂ as above; D₀=1 excluded by k>1 | sound |
| §5.4 | 0011,k=2: total 6=3!·1; +3 on standard weights adds 6 to ∧²; −1 acts as +1 on ∧²F⁴ | sound; gap declared |
| §5.5 | 0011,k=2: v=0,v′=1, k(v′−v)=2=n−1; 000001,k=3: 0+1+0=1=n−1; 1[−1]+23[0]+1[1],k=5: 1+1+0=2 | sound |
| §5.6 | 000001,k=3: C(5,3)=10 at 0 and C(5,2)=10 at 1, d=10, m=6=2k; ordered triples would give 60 | sound |
| §5.7 | 0011,k=2: 1,4,1; j=1: 8855,35420,8855; P₀ has k=1 | sound |
| §5.8 | 0012,k=2: 1,2,2,1, ratio 2≠11; m=4,k=2: total 6<24d; brute force finds no n=4 row | sound |
| §6.1 | 1[−1]+23[0]+1[1],k=5: r=4,t=19, R_a=19/5, R_b=4/20=1/5, sum 4=A(3,1), product 19/25<1; q=2 ratios 0,0,1,0,0 sum 1=A(3,2); surface 5[0]+[1],k=3: R_a=0,R_b=1 | sound |
| §6.2 | n=5: 28A₂=1848<1875, 78nA₄=390<15625, five-term 58<66; n=7: √2382+1≈49.81≤50=14400/288, 49 fails (48.98); n=11: 27A₂=4121199<4145296, 78nA₄=8355301812<8427392875; n=10: 1291680>1026169; n=6: 45≤57; n=4: 18>10 | sound on the stated ranges |
| §6.3 | 1[−1]+53[0],k=2: R_a=26 but q=2 ratio 0≠66; n=11 threshold 1018; (R_a,R_b)=(0,26) allowed by the sum alone | sound |
| §6.4 | n=5, product ≤4: roots 13±√165≈0.155, 25.845; five-term 5+1+52=58<66; k=5≥n: width ≥5>4 forces v′=v | sound |
| §6.5 | ceilings 26/8→4, 57/10→6; r=4: A(5,10)=0 vs 325; d<3/676 at n=5 | sound after a-F04 |
| §6.6 | (6,3,2,10), (4,2,3,1), (25,5,3,8855), complement (25,20,3,8855) | sound |
| §6.7 | n=3,d=1: SO₆, ∧²SL₄ kernel μ₂; d=8855 excluded at n=3 only; no n=2 claim | sound |
| §7.1 | constant family: constituent constant, G* acts nontrivially (negative control); tensor unit trivial | sound |
| §7.2 | c=1: G; c=2 distinct axes: G×G (dim 6 for SL₂); same axis: diagonal dim 3 | sound |
| §7.3 | δ₀: invariants of dim 1 for every χ, excluded; torsion translates by geometric origin (§0.8) | sound |
| §7.4 | n=1: J=1; Q₈: C₄ index 2; D_{2q}: index 2; char p counterexample; commuting operators have a common eigenvector over F̄, coset translates span | sound |
| §7.5 | B=(G*)^c: all tests 0; c=2 diagonal: cross-adjoint invariant (identity) nonzero; B=1 rejected; Q₈ in one coordinate: irreducibles of dim ≤J<dim W, W reducible, invariant in End(W)/F | sound |
| §7.6 | c=1: one simple normal factor; diagonal tuple: dim 3≠6 for SL₂, so exceptional | sound |
| §8.1 | E², a↦(2a,3a): χ₁²χ₂³=1, first-axis inverse image Π(E)[2] of size 4; box 9, bad ≤6; E³, σ=3 on ℤ/4, (e₂,e₃)=(1,0): 16≡20≡0, η=2∈E₁ | sound |
| §8.2 | ℓ=2,r=3 on E: 64 characters, ≤3 removed; growth ℓ^{2nr} vs ℓ^{2(n−1)r} | sound |
| §8.3 | c=2, SL₂: 6 vs 3; equal exponents give the diagonal tuple; ℓ=p=2: ±1↦1 | sound |
| §9.1 | n=3, m′/m=2: r=2⁶=64, e=u∘t/64 idempotent; m=1: one character; d=2: ker φ_L of order 4 | sound |
| §9.2 | d=1: g=2; d=2: g=3, ≤4 translates; empty M vacuous | sound; gaps declared |
| §9.3 | swap of two identical rational summands: PeP⁻¹=diag(0,1)≠e; ℂ/ℤ[i]: Aut {±1,±i} order 4, (3+4i)/5 has minimal polynomial x²−(6/5)x+1, infinite order; Y(3): δ=±T∉±Γ(3) | sound |
| §9.4 | Z_{m′}⊆Z_m for m∣m′, minimal Z_m by Noetherianity; n=2 via §9.2; positive-dimensional fibre gives finite monodromy against SL₂ (dim 3) | sound |

### Checks recomputed

The 41 Checks recomputed are those quoted with values in the two tables: §0.1 (3), §0.4 (4), §0.5 (3), §0.7 (3), §0.8 (3), §1.3 (2), §1.4 (2), §3.1 (4), §3.3 (2), §4.1 (3), §4.3 (5), §4.4 (3), §4.6 (3), §4.7 (3), §5.1 (6), §5.2 (4), §5.3 (4), §5.5 (3), §5.6 (3), §5.7 (3), §5.8 (3), §6.1 (3), §6.2 (6), §6.4 (3), §6.5 (4), §6.6 (3), §7.4 (4), §8.1 (3), §8.2 (3), §9.1 (3), §9.3 (4). None is false, vacuous or a restatement; every definition (§§0.1–0.3, 0.5–0.7, 1.1–1.3, 3.2, 4.1–4.2, 5.1–5.3, 6.1, 9.1, 9.3) has at least three discriminating Checks.

## Not verifiable

- No Lean elaboration was run on this worker (the brief forbids Lean builds and gives no Lean command); the elaborated types come from the worker's signature record and were compared by reading. After the repair the worker should run the `#check @name` sweep again.
- The published paginations of LS (Annals 202), BSS (Selecta 24), Sch (IHÉS 121) are not collated; all locators use the cached preprints (Sim is the journal version).
- Whether a holonomic module with G_u=SO₃×SO₃ and T_u⊇V₄×SO₂ exists on some abelian variety was not settled; S02 rests on the source's own statement (K2 lines 783, 796) and on the failure of the README's argument, not on a realized counterexample.
- Ownership against open pull requests other than the 441 indexed by the roadmap service and the sibling checkouts named in the brief was not checked.
- The brute-force searches (weights in −2..3, m≤10, n≤5; Pell solutions a<120) support, and do not prove, the three infinite classifications.

## Source issues

- **Gap** in Sch at Theorem 17.2, proof, printed p. 27 (Sch lines 1343–1350): the source says the conjugate M^σ of a simple summand of a geometric-origin module is defined over Q̄ "by the same argument as before", without saying how M^σ is defined for a summand rather than for a module built by functors; it should transport the Q̄-structure (the decomposition is defined over a number field by base change of algebraic de Rham Hom) and identify c_σ of the locus with the locus of that summand; affects the proof.
- **Misprint** in K2 at Corollary 2.2.4, printed p. 15 (K2 line 711–713): the source says the Weyl orbit is realized by a unique clean cycle Λ∈L(A); it should say a cycle on A/Γ_tors, or on A up to the isogeny h, since the dictionary of Theorem 2.2.3 passes through h_*; affects nothing (Remark 2.3.2 states the correct "effective up to isogeny").
- **Misprint** in K2 at Theorem 2.1.1, printed p. 12 (K2 line 580–583): the source says the target category is VB(A,η) of germs of vector bundles with finite flat support, while the text cited from K1 (Theorem 5.10) uses local systems LS(A,η); it should say the two are identified by taking holomorphic sections, as line 584–586 explains; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "906c68422c944aea049241e975f18908f3afb8d1", "job": "RT-SheafConvolutionOnAbelianVarieties~2b", "model": "fable", "worker": "chris-x10"} -->
