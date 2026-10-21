<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/110#issuecomment-6313735387 -->
Red team round 2 pass b (claude) of 4d14e60

Verdict: needs_changes

1. **F01** (P2) The "CN lattice" p^(−a)Z_p(r) is a misprint of CN; the exported CN-normalized period map has no construction and the v_p(a!) error transport is spurious

   **Location.** `packages/CohomologyComparisonsPartII/README.md:447` ("On the semistable chart domain of 4.4, also export the CN-normalized undivided map to its L_CN lattice with its specified coordinate adapter"); `:481` ("H^q(α′_CN) has kernel and cokernel killed by p^A"); `:483` (`boundedPeriod_lattice`: "changes the bound by v_p(a!). Write A_EN=A(e,p,r)+v_p(a!)"); `:497` (A_EN, B_EN in 4.5); `:27`, `:427`, `:431` (L_CN(r)=p^(−a)L(r) as a second period normalization); `Suggested.lean:56–58` (docstring "The period lattice at weight r always uses a = r/(p−1)").

   **Claim.** CN's lattice Z_p(r)′=p^(−a)Z_p(r) (CN line 67–69, 971) is a genuine second period lattice, CN Theorem 1.1 bounds a map α′_CN into it, and the bound is carried to L_EN by composing with the inclusion L_CN→L_EN at a cost v_p(a!).

   **Witness.** At p=2, r=2: t/2∈J, so γ₂(t/2)=t²/8∈J^[2]=F²A_cr with φ(t²/8)=4·t²/8; CN's t{2}=t²/4 (CN line 970). NN line 2324–2326 gives the kernel (p^a a!)^(−1)Z_p(r); EN line 330–335 restates CN Theorem 1.1 with that lattice.

   **Details.** The kernel of p^r−φ on F^rA_cr is (p^a a!)^(−1)Z_p(r), not p^(−a)Z_p(r): t^r/(p^a a!)=t^b·γ_a(t^(p−1)/p) lies in F^rA_cr (t^(p−1)/p∈F^(p−1)A_cr is asserted by CN line 969–970 and by the README's own Check at :441; divided powers of an element of J^[p−1] lie in J^[(p−1)a]) and satisfies φ(x)=p^r x. So CN's recalled sequence 0→Z_p t{r}→F^rA_cr→A_cr (CN line 968–970) is exact only when a!≢0 mod p, i.e. a≤p−1; Tsuji's fundamental sequence (NN line 2324–2326) and EN line 306 give the kernel (p^a a!)^(−1)Z_p(r) for all r, and EN Theorem 2.3 (EN line 330–335) restates CN Theorem 1.1 for α_r:H^i(S′_n(r))→i^*R^ij_*Z/p^n(r)′ with EN's lattice. Consequently there is one period map α′=α̃∘ω into L_EN(r)/p^n (EN line 326–329); a map S′_n(r)→i^*Rj_*(L_CN(r)/p^n) is not induced by any lattice inclusion (the only lattice map is L_CN→L_EN, in the wrong direction), and the 4.4 bound is stated for an object the roadmap never constructs.

   **Repair.** (1) In 4.2 delete the sentence "On the semistable chart domain of 4.4, also export the CN-normalized undivided map to its L_CN lattice with its specified coordinate adapter" and in the proof paragraph delete "The CN-normalized chart map additionally uses the local-period-fundamental-sequences contract on its semistable domain." (2) In 4.4 state: "For all n≥1, r≥0 and 0≤q≤r, H^q(α′_n,r):H^q(S′_n(r))→i^*R^qj_*(L_EN(r)/p^n) has kernel and cokernel killed by p^A for an integer A independent of n and X (EN Theorem 2.3, EN line 330–335, which restates CN Theorem 1.1 with the lattice (p^a a!)^(−1)Z_p(r) of EN line 306)"; delete `boundedPeriod_lattice` and the sentences "Transport to L_EN by 4.1, increasing the exponent by the recorded factorial lattice error" and "Write A_EN=A(e,p,r)+v_p(a!), and B_EN=Nr+c_p+v_p(a!)". (3) In 4.5 replace A_EN, B_EN by A and Nr+c_p. (4) In Conventions (:27) and 4.1 (:427, :431) say: "L_EN(r)=(p^a a!)^(−1)Z_p(r) is the kernel lattice of the fundamental sequence for every r≥0 (NN line 2324–2326; EN line 306). CN prints Z_p(r)′=p^(−a)Z_p(r) (CN line 67–69, 971); its recalled exact sequence (CN line 968–970) is exact only for a≤p−1, and EN Theorem 2.3 restates CN's bound with L_EN. `cnLattice` records CN's printed coordinate lattice only; no period map into it is asserted." Replace the Check `modifiedTateLattices_factorial`'s reading of the two lattices as "two normalizations" by the negative control: "At p=2, r=2, t²/8=γ₂(t/2)∈F²A_cr with φ=4·, so the kernel is (1/8)Z₂(2)=L_EN(2); CN's printed (1/4)Z₂(2) is strictly smaller and is not the kernel." (5) Retitle `Syntomic.modifiedLattice_EN_CN` as the coordinate inclusion only, keep `Syntomic.modifiedLattice_errorTransport` as pure module algebra, and change the `cnLattice` docstring (Lean:56–58) to "CN's printed coordinate lattice p^(−a)Z_p(r) (CN line 971); the kernel lattice is `enLattice`."

2. **F02** (P3) The all-weight constant is quantified over e, but CN's body theorem only gives dependence on K

   **Location.** `packages/CohomologyComparisonsPartII/README.md:481` ("killed by p^A for an integer A=A(e,p,r) independent of n and X"); `:483` (`boundedPeriod_uniform`: "∃A(e,p,r), ∀X,n,q≤r").

   **Claim.** For fixed e, p, r one constant works for every complete DVR V of ramification index e.

   **Witness.** CN Theorem 5.4(ii), CN line 2605–2606: "N=N(K,p,r), which depends on K, p, r"; its proof passes to R(ζ_(p^i)), i≥c(K)+3 (CN line 2640–2641) and descends at cost p^(c r e₁) (CN line 2751).

   **Details.** CN Theorem 1.1(ii) (CN line 83–84) prints N(e,p,r), and EN Theorem 2.3 (EN line 334–335) copies it; but neither the index i nor the relative ramification index e₁ of K(ζ_(p^i))/K used in the proof is bounded in terms of e alone in the text, so the body theorem supports only dependence on K.

   **Repair.** Replace "A=A(e,p,r) independent of n and X" by "A=A(K,p,r) independent of n, X and q (CN Theorem 5.4(ii), CN line 2605–2606; the introduction, CN line 83–84, and EN Theorem 2.3 print A(e,p,r), a uniformity in K of fixed e that the proof does not establish)". Change `boundedPeriod_uniform` to "∃A(K,p,r), ∀X,n,q≤r; the constant is not chosen separately for each n or X". Keep the enough-roots exponent Nr+c_p unchanged (CN line 80–82, 2603–2604 agree).

3. **F03** (P3) Twenty-six contracts are not stated in the intake's form

   **Location.** `packages/CohomologyComparisonsPartII/README.md:88, 96, 98, 102, 110, 112, 116, 118, 120, 124, 126, 128, 134–148, 152–160, 164` (the contracts `rigid-syntomic-etale-period`, `crystalline-inputs`, `crystalline-filtered-quotient`, `arithmetic-pair-deformation`, `rigid-realizations`, `rigid-log-crystalline`, `relative-rigid-projective-finiteness`, `relative-rigid-log-finiteness`, `rigid-gysin`, the three `nearby-cycle-*`, `local-period-pd-radius`, `-annulus-entry`, `-frobenius-change`, `-lie`, `-lazard`, `-annulus-change`, `-phi-psi`, `-disk-change`, `-galois`, `-approximation`, `-kpi1`, `-etale-gaga`, `-descent`, `exact-yoneda`).

   **Claim.** Each declared gap is stated under `## Exact supplier contracts` as `What <Supplier> must provide (gap:<slug>): <needs>`.

   **Witness.** `grep -c "must provide (gap:"` on the README returns 7 of 33 slugs; the other 26 contracts carry the `needs` sentence verbatim (checked against `design/plan.json`) without the prefix.

   **Repair.** Prefix the `needs` sentence of each of the 26 contracts with "What <Supplier> must provide (gap:<slug>): " using the supplier named in `design/plan.json` (CohomologyComparisons, CrystallineCohomology, PadicDifferentialEquationsAndRigidCohomology, EtaleCohomologyFoundations, PadicHodgeTheory, GrothendieckEulerForms). No `needs` text changes.

4. **F04** (P3) Seven accepted gap entries were amended in plan.json after the design was accepted

   **Location.** `packages/CohomologyComparisonsPartII/design/plan.json`, entries `hyodo-kato-proper` (neededBy), `period-rings` (needs, section), `rigid-realizations` (title, detail, needs), `relative-rigid-coefficients` (needs, section), `relative-hodge` (neededBy, needs, section), `local-period-galois` (detail), `rational-descent` (neededBy, needs, section); compared with the accepted design at commit 19ae3e0.

   **Claim.** After the design, the package changes nothing in `plan.json` but additions to the top-level `gaps` list.

   **Witness.** Field-by-field comparison of `design/plan.json` at 19ae3e0 and 4d14e60: every top-level value equal except `gaps`, where two entries were added and seven rewritten (fields listed above). The original seven `needs` sentences were announced at design acceptance.

   **Details.** The strengthened sentences (the absolute de Rham clause in `relative-hodge`, the coherent-model clause in `relative-rigid-coefficients`, the convention clause in `rational-descent`, the integral fundamental sequences in `period-rings`) have no announcement path. The amendments themselves are mathematically right and were required by round-1 findings b.F02, b.F06 and the merged F01.

   **Repair.** Do not revert the amendments. Add at the end of the `### From TauCetiRoadmap.CohomologyComparisons`, `…PadicPeriodRings`, `…PadicDifferentialEquationsAndRigidCohomology` and `…PadicHodgeTheory` subsections one sentence each of the form "Amended since the accepted design: `relative-hodge` (absolute filtered de Rham realizations added), `rational-descent` (monodromy convention identification added)", "`period-rings` (integral Fontaine–Messing coefficient sequences added)", "`relative-rigid-coefficients` (affine coherent models and derived-colimit comparison added), `rigid-realizations` (algebraic de Rham clause removed)", "`local-period-galois` (Koszul bridge moved to `local-period-koszul-resolution`)", so that the intake can re-announce the changed contracts on the suppliers' jobs.

## Round-1 findings at this head

Each earlier finding was checked against the current `packages/CohomologyComparisonsPartII/README.md` and `packages/CohomologyComparisonsPartII/Suggested.lean`.

| Finding | Status | Witness at head |
|---|---|---|
| a.F01 (P2) arbitrary CN endpoints do not support products | repaired | README:427 "a=floor(r/(p−1)), b=r−(p−1)a, so 0≤b<p−1"; README:429 `modifiedLattice_product` "requires a_(r+s)≥a_r+a_s"; README:433 integral coordinate p^c a_(r+s)!/(a_r!a_s!) (computed: correct, c∈{0,1}); README:443 `modifiedTateLattices_product`; Lean:115–116 `(2)⁻¹*(2)⁻¹ ∉ cnLattice 2 1` with proof at Lean:117–130 (statement true: 1/4=z/2 forces z=1/2∉ℤ₂). |
| a.F02 (P3) finite-level failure has no Lean mirror | repaired | Lean:107–114: generator-coordinate squares, `RingHom.ker (toZModPow 1) = span {2}`, `(2 : ZMod 2) • id = 0`, `toZModPow 1 1 ≠ 0`; README:440 describes the same model. All conjuncts true. |
| a.F03 (P3) every tested D1 value zero | repaired | Lean:217–221: D1(2,0)(e1,0,0)=e0, D1(2,0)(0,0,e0)=e0, D1(2,1)(0,0,e1)=e1, scaled D1=−e0/2; README:554. All four recomputed by hand and correct. |
| a.F04 (P1) Koszul-to-continuous bridge unowned | repaired as a declared gap | README:150 `gap:local-period-koszul-resolution` (supplier PadicHodgeTheory, CN line 1824–1942, 1943–1954); plan.json `gaps` has the slug; README:487 §4.4 *Needs:* cites it; QWittVectors §1.7 `CommutingEndomorphisms.koszulComplex` exists at the sibling head (rev QWittVectors README:226–228) and is earlier in the order. The repair's "not actionable" reason (the supplier must prove λ) is correct. |
| a.F05 (P2) 6.5 omits the general acyclicity form | repaired | README:658 "such that H^j(S_K^an,R^iu_rig j†O)=0 for every i≥0 and j>0" (AM line 639–641); README:660 `continuousDifferentialComparison_ofCoherent` as the corollary. |
| a.F06 (P3) first differential never tested | repaired | README:248 `fiberCoordinatesDifferential_first` (2,5)↦(2,−4); Lean:38–41. Value recomputed: (2, 3·2−2·5)=(2,−4). |
| a.F07 (P3) only two EN Checks | repaired | README:442 `modifiedTateLattices_unitFactorial`; Lean:82–83 `enLattice 3 4 = span{18⁻¹}` and `= cnLattice 3 2`. 9·2!=18, 2 is a 3-adic unit: correct. |
| b.F01 (P3) inclusive endpoint is a misprint | repaired | README:427 Euclidean decomposition; README:433; README:441 rewritten Check (t^(p−1)/p∈F^(p−1)A_cr, φ=p^(p−1)·, kernel p⁻¹Z_p(p−1): correct at r=p−1); Lean:56–58 docstring "always uses a = r/(p−1)"; the "two CN decompositions" phrase is gone. The remaining apparatus of a second CN lattice is S01 below, a different defect. |
| b.F02 (P2) two owners for the Hodge filtration | repaired | README:90 `relative-hodge` now carries the absolute case "For smooth separated finite-type T over any characteristic-zero field L … over L=K this is the absolute specialization S=Spec(V)"; README:110 `rigid-realizations` says "Algebraic filtered de Rham realizations belong to `relative-hodge`"; *Needs:* at README:300, 316, 332, 771 cite `gap:relative-hodge`. |
| b.F03 (P3) half a definitional restatement | repaired | Lean:189–192 first conjunct is now the degree-0 square through the projections of the unscaled `semistableD0`; docstring Lean:181–184 names both squares. Both conjuncts recomputed: true for every natural e. |
| b.F04 (P3) colliding or restating Check labels | repaired | README:743 `detectSection_zeroModule`; README:262 `extEvaluation_degreeZeroTate` (Hom(O,O(1))=0 since F⁰O(1)=0: correct); README:459 `fontaineMessingPeriod_nearbyPoint` (H¹(I_Qp,Z/p^n)≠0 from the cyclotomic Z_p-extension: correct). |
| b.F05 (P3) transported exponent unstated | repaired differently, correctly | README:497 A_EN=A(e,p,r)+v_p(a!); README:499 "exact closed and open restriction detect its cohomology kernel and cokernel … without doubling". Checked: with K_q=ker H^q, j_K^*K_q=0 and i^*K_q=ker H^q(α′) since i^* is exact and i^*E′=S′, i^*(gluing map)=α′ (README:499 `etaleGluing_period`); a sheaf whose generic stalks vanish and whose closed stalks are killed by p^A is killed by p^A. The doubling I proposed was unnecessary; the repair is right. |
| b.F06 (P3) unreadable supplier sections written as supplied | repaired | README:100 "What CrystallineCohomology must provide (gap:hyodo-kato-proper)"; README:550 §5.2 *Needs:* cites `gap:hyodo-kato-proper`, `gap:rational-descent`; README:114 `relative-rigid-coefficients` carries the coherent-model/derived-colimit sentence (AM line 612–620) and README:168, 664 cite it; README:92 `rational-descent` carries the convention N_base,norm=−N_c/e. |

No repair introduced a new error that I could find: the new Checks at README:262, 441, 442, 443, 459, 554, 560, 743 were recomputed; the new Lean statements at Lean:38–41, 79–96, 102–147, 209–231 are true as typed (every numerical conjunct recomputed by hand). The sheaf-level exponent argument at README:499–501 is correct. The amended `relative-hodge` text is consistent with BesserI Definition 5.1 (BesserI line 648–662).

## Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| Conventions :23 F_V obstruction | π²=p at p=2,3; general e>1 | F_V fixes W(k) (Teichmüller characterization), F_V(π) is a root of the σ-twisted Eisenstein polynomial, v(F_V(π)−π^p)=1<e. Correct. | none |
| Conventions :25 fibre coordinates | d_A=0,d_B=id,f=2 on Q; d_A=id,d_B=2id,f=3id at (2,5) | (0,2),(0,−1),(2,−4); matches AM line 258 (ω,ξ)↦(dω,(1−Φ)ω−dξ). | none |
| Conventions :29 Tate/HK conventions | O(±1); φe0=e0, φe1=pe1, Ne1=e0; π→πu | Nφ=pφN holds; exp(log u N)e1=e1+log(u)e0; HK line 1340 ρ_(πu)=ρ_π∘exp(log(u)N). Correct. | none |
| 1.1 FilFMIC and Checks | zero, unit, Φe=te, Spec K | Nonhorizontal datum rejected; B†=0 for S=Spec K so rigid realization not faithful. Correct (AM line 131, 160–163). | none |
| 1.3 exact structure | F⁰A=K vs F⁰B=0, F⁻¹B=K | Identity B→A not strict; AM line 188–190 defines exactness on every Fil^i. Correct. | none |
| 1.4 S_σ(H)=Fib(1−Φ) | O(0), O(1) at F_p; d² | A_H=0 in degree 0 for O(1); H⁰=H¹=Q_p for O(0). Correct. | none |
| 1.5–1.6 evaluation and remainder | Φe=e−h; Φe=e+ah | u₁=(0,h)≠0; R=−ah. AM line 283–289. Correct. | none |
| 2.1–2.3 rigid syntomic fibre | V=Z_p, r=0,1; X_k=∅; K=K0 | H⁰=Q_p, H¹=Q_p at r=0; H⁰=0,H¹=Q_p at r>0; fibre=F^rRΓ_dR when X_k=∅ (BesserI line 746–749); elimination of a=sp(b) gives Fib((1−φ_r)sp_r) (BesserI line 1073; AM line 1322). Correct. | none |
| 3.1–3.3 divided/undivided coefficients, ω, τ | r=0; r≤p−1; Z/p; Z/p² | J^⟨r⟩ via level n+s (EN line 166–168); τω=ωτ=p^r (EN line 193–195); products EN line 223, 237. Correct. | none |
| 3.4 Rlim tower | A_n=⊕_(j≥n)F_p | lim=0, lim¹=∏/⊕ via Stacks line 10670–10674. Correct. | none |
| 4.1 lattices | p=2,r=1,2; p=3,r=4; r=0; products | enLattice/cnLattice spans and the p=2 product correct in coordinates; but p^(−a)Z_p(r) is not a kernel lattice: t²/8=γ₂(t/2)∈F²A_cr killed by 4−φ. | S01 |
| 4.2 period maps | r=0; trivial-log point; canonical-log point | Nearby-cycle H¹ stalk nonzero; j from U=X_tr∩X_η. Correct. CN-normalized map has no construction. | S01 |
| 4.3 exact range | p=2 (r=0), p=3 (r≤1); G_m Cartier witness | Matches EN line 186–188, 318–323; C⁻¹(t dlog t)=[t^p dlog t] (Tsuji line 1211–1217). Correct. | none |
| 4.4 bound | enough roots; general K; q>r | p^(Nr+c_p) with d-dependence at p=2 (CN line 80–82); general constant proved as N(K,p,r) (CN line 2605) not N(e,p,r). | S02 |
| 4.5 gluing and exponent | empty closed part; identity open map; stalks | Sheaf kernels/cokernels killed by the closed exponent; no doubling. Correct. Exponent is A, not A+v_p(a!). | S01 |
| 5.1 HK adapter | point; rank-two block; k[t]/t^m, p∤m, m>1 | φ(t)=t^p not bijective on W_n[t]/(t^m), HK line 730–739. Correct. | none |
| 5.2 C_st and adapter | r=0,1; e=0,1,2; N=0 | D1D0=−p^(−r)Nφ+p^(1−r)φN=0 under Nφ=pφN (needs p≠0, supplied by the prime instance); both adapter squares hold for all e; all twelve Lean conjuncts recomputed. Correct. | none |
| 5.3 h-descent transport | identity; p=2; r=0 | NN Prop 3.18 hypotheses (NN line 1688–1691) retained. Correct. | none |
| 6.1–6.4 relative data | id_S; P¹; D(pt−1)⊂A¹_(Z_p); collision x=0,x=t | H²(P¹)=O(−1); genericDivisor: U_k=S_k, (1−pt)⁻¹ overconvergent, Q_p[t,(pt−1)⁻¹] not finite over Q_p[t]: 6.1 applies, 6.2 fails. Correct. | none |
| 6.5 continuous differentials | A¹; G_m; elliptic curve | AM line 639–645 hypothesis is the all-degree vanishing; Lemma 2.19's proof is affine. Correct. | none |
| 6.6 residue sequence | P¹−{0,∞}; t²+t+1 over Z_2; D=∅ | Res=(1,−1), Gys=sum; trace-zero line with σ=−1 twisted by (−1): Frobenius −2; D=∅ contradicts affineness. Correct (AM line 587–607). | none |
| 6.7 projections | G_m, n=1; n=0 | H¹(G_m)(2)=O(1), F⁰=0; residue lands in H⁰(D)(1). Correct. | none |
| 7.1–7.2 lifts and detection | σ(t)=t^p, t^p+p; t=p; k=F_p, t^p−t; M=0 | Ring-map convention P_a∘σ=F_W∘P_a matches AM line 1229–1242; x=x^p+p gives x≡p mod p²; t^p−t vanishes at all Teichmüller lifts over F_p. Correct. | none |
| 7.4–7.5 absolute comparison | point r=0; G_m; vertical log r=1; curve n=1,r=2 | C_st point complex Q_p→Q_p³→Q_p has H¹=Q_p²; horizontal fibre H¹=Q_p; AM line 1316, 1322; connecting map iso when both F^r groups vanish. Correct. | none |

## Verified sound

- Read: all 824 README lines and all 233 Lean lines; 9 Lean declarations and 6 examples (every numerical conjunct recomputed by hand); 33 subsections with 119 named Checks and 96 bold items; the 33 gap slugs of `design/plan.json` all appear in the README with the same `needs` text and a named supplier (none is `none`).
- Lean versus README: binders, instance arguments and coercions of all nine declarations agree with the README (ℚ-modules, natural-number floor division, integer exponents −r and 1−r); every Lean name appears in the README; single `import Mathlib`; no `set_option`, `lemma`, `#eval`, `True` placeholder or sorry'd data; four honest `sorry` theorems, all true as typed; at most two examples per kept definition. The Mathlib names used by the new proofs exist at the pin: `PadicInt.norm_natCast_eq_one_iff` (PadicIntegers.lean:313), `PadicInt.isUnit_iff` (:385), `PadicInt.toZModPow` and `ker_toZModPow` (RingHoms.lean:447, 459), `Submodule.span_singleton_eq_span_singleton` (Span/Basic.lean:237) whose `Module.IsTorsionFree ℤ_[p] ℚ_[p]` binder is supplied by `PadicInt.isFractionRing` through `FaithfulSMul` (FractionRing.lean:162) and `FaithfulSMul.to_isTorsionFree` (Algebra/Basic.lean:468), `IsUnit.unit_spec`, `Submodule.mem_span_singleton`, `CharZero ℚ_[p]` (PadicNumbers.lean:563).
- Locators verified against the cache (about 140 line locators in 60 ranges): CN 55–92, 405–426, 960–982, 1453–1456, 1545–1548, 1822–1832, 1930–1956, 2267–2270, 2540–2660, 2704–2708, 2747–2765; EN 150–246, 278–390; NN 76–95, 358–362, 475–487, 519–523, 1341–1390, 1684–1694, 2318–2330; HK 696–700, 713–717, 725–745, 765–772, 1318–1342; AM 115–135, 160–220, 245–292, 451–560, 587–645, 793–812, 1185–1200, 1229–1334, 1352–1400, 1432, 1445, 1483, 1644; BesserI 623–665, 700–760, 1068–1078, 1205–1218; TsujiNearby 805–822, 1156–1166, 1205–1245; Buhler 192–198, 2212–2218; StacksRlim 10638–10676; the pinned Lean extractions MathlibPadicReductionReview 354–355, 450–464, MathlibSpanReview 241–254, 895–906, MathlibPadicLattice 317–319, 389, 580–588, MathlibBDeRhamReview 55–56, 79, 92, MathlibPin 77, 117, 136, 142, 184. All support the statements they are cited for except as recorded in S01 and S02.
- Sibling and main-branch citations checked (34): QWittVectors §1.7 `CommutingEndomorphisms.koszulComplex` (rev 1351 README:226–228, with intertwining maps, signs, scalar extension and concatenation as the README says); AdicSpacesPartIV §F1.5, F1.7 with its four named targets `dagger-coherent-affinoid-kiehl`, `dagger-coherent-theorem-b`, `strict-neighbourhood`, `overconvergent-sections-formula`, F1.8, F1.9, F1.12, F1.16; GrothendieckEulerForms Layers 0 and 5 (abelian, k-linear Ext: the `exact-yoneda` extension is correctly a gap); DerivedModuleAlgebra §0.K.1; EtaleCohomologyFoundations F.0.3, F.1, F.3a, F.4.1–F.4.5; EnhancedDerivedSheaves 0.1–0.4, E2:towers.1, E5:abstract; RigidAnalyticGeometry 6.1, 6.2, 7.3, 7.4, 8.1, 8.4. ErdosProgressionPowers and ArithmeticDynamics contain no syntomic, rigid, isocrystal or Koszul material. No `*Needs:*`, supplier row or "Supplied by" cites a later roadmap; ColemanIntegrationPartII is named only as a non-dependency.
- Dependency gate (unchanged tooling and order file), exit status 0:

  ```text
  depcheck: 4 roadmaps, 31 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line.
- Policy: `git diff --stat origin/main...HEAD` lists nine files, all under `packages/CohomologyComparisonsPartII/`; no pull-request number or process narrative in the README or docstrings; every target paragraph has a locator; no computational algorithm; `sources.toml` has 26 entries with no machine path; BesserII is `uncertified` and uncited.
- Checks tested by hand (48): every Check of 1.1–1.6, 2.1–2.3, 3.1–3.4, 4.1–4.5, 5.1–5.3, 6.1–6.7, 7.1–7.5 listed in the adversarial table above; all correct except the reading of the two weight-two lattices recorded in S01.
- Headlines: the four `sorry` theorems are honest statements on existing carriers; no forced headline; no further easy headline on existing carriers is missing (the geometric milestones have no carriers at the pins).

## Not verifiable

- Lean elaboration: no Lean command is permitted in this pass and the package has never been compiled. Statements were checked by hand. Elaboration risk points: `Nat.Coprime 3 2` closed by `norm_num` at Lean:91; `(2 : PadicInt 3)` unified with `Nat.cast 2` in `norm_natCast_eq_one_iff`; the `change` lines at Lean:94, 120, 135, 139 (smul to coerced multiplication); `norm_num only [pow_one] at hz` followed by `field_simp` and `linear_combination hz` at Lean:122–125, whose normal form may need `linear_combination hz / 2`; `ZMod (2 ^ 1)` against `ZMod 2` at Lean:111, 129; `let`-bound maps inside `norm_num` at Lean:209–231.
- CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicDifferentialEquationsAndRigidCohomology and PadicHodgeTheory have no folder on main, in the three open checkouts or on the board, so the section numbers cited under "Consume …" and in Scope and ownership could not be checked; every such dependency goes through a declared gap with a named supplier, which is not a finding.
- BesserI is an OCR extraction with damaged displayed formulas (lines 709–714, 729–734, 1075–1076); the fibre and cone descriptions were checked through AM (3.11)–(3.12) and the text around them.
- Whether `nearby-cycle-cartier` belongs to EtaleCohomologyFoundations or CrystallineCohomology is a design-stage ownership question; it is a declared gap and is not raised.
- The claim γ_a(J^[p−1])⊂J^[(p−1)a] used in S01 for p≥3 is the standard divided-power filtration property; the p=2, r=2 witness in S01 does not depend on it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4d14e605caa3f3f756eb393a84cb37f563f82632", "job": "RT-CohomologyComparisonsPartII~2b", "model": "fable", "worker": "chris-g"} -->
