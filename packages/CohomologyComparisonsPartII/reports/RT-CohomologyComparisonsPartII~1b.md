<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/110#issuecomment-6312538535 -->
Red team round 1 pass b (claude) of 538903f

Verdict: needs_changes

1. **F01** (P3) CN's inclusive endpoint `0≤b≤p−1` is a misprint, carried into 4.1 as a genuine second convention

   Location: `packages/CohomologyComparisonsPartII/README.md:421` ("for a specified CN decomposition r=(p−1)a_c+b_c with a_c≥0 and 0≤b_c≤p−1"), `:427` ("CN's printed endpoint inequality is inclusive; retain the decomposition as data"), `:435` (Check `modifiedTateLattices_boundary`: "At r=p−1, CN permits (a_c,b_c)=(1,0) or (0,p−1)"), and `Suggested.lean:58` ("The inclusive endpoint convention is retained in the choice of exponent").

   Claim: CN admits two decompositions at r≡0 mod (p−1), the two lattices p⁻¹L and L are both "CN lattices", and period maps and error bounds must be transported across a one-power "endpoint lattice error" (4.4, line 473: "increasing the exponent by the recorded factorial and endpoint lattice errors").

   Witness: CN line 968–971 states the sequence 0→Z_p t{r}→F^rA_cr→A_cr with t{r}=t^b(t^{p−1}/p)^a as exact, so Z_p t{r} is the kernel of p^r−φ on F^rA_cr, a single lattice. At r=p−1 the element t^{p−1}/p lies in F^{p−1}A_cr and is killed by p^{p−1}−φ, so the kernel is Z_p·t^{p−1}/p, which is the (a,b)=(1,0) choice only; the choice (0,p−1) gives a strictly smaller span and a false exact sequence. EN line 306 and NN line 2324 print the same decomposition with b<p−1 and a the largest integer ≤r/(p−1). The inclusive bound at CN line 69 and line 970 is a typographical slip, not a convention.

   Repair: in 4.1 define L_CN(r)=p^{−a}L(r) with a=floor(r/(p−1)) only; delete "If the alternative CN endpoint decomposition exists, its lattice differs by one factor p; transport period maps and error bounds explicitly" and the phrase "and endpoint lattice errors" in 4.4; replace Check `modifiedTateLattices_boundary` by: "At r=p−1 the printed inclusive bound of CN would allow b=p−1; this is a misprint, since t^{p−1}/p∈F^{p−1}A_cr is killed by p^{p−1}−φ, so the kernel lattice of CN Lemma 2.23(ii) is p⁻¹Z_p(p−1), the floor choice (CN line 968–971; EN line 306)". In `Suggested.lean` either keep `cnLattice p a` as a coordinate definition whose docstring says the exponent is `r/(p−1)` in use, or replace its argument by `r` with body `((p : Padic p) ^ (r / (p - 1)))⁻¹`; drop "inclusive endpoint convention" from the docstring and the "two CN decompositions of weight one" phrase from the p=2 example docstring.

2. **F02** (P2) The algebraic Hodge-filtration realization has two owners

   Location: `packages/CohomologyComparisonsPartII/README.md:106` (contract `rigid-realizations`, supplier PadicDifferentialEquationsAndRigidCohomology: "for smooth separated finite-type T over a characteristic-zero field L supply F^rRΓ_dR(T/L) for r∈ℤ from smooth proper normal-crossings compactifications, with filtered independence, products, finite Čech descent and scalar-extension compatibility") and `:86` (contract `relative-hodge`, supplier CohomologyComparisons: "finite algebraic H^i_dR, a finite exhaustive separated Hodge filtration ... Griffiths transversality, horizontal comparison and filtered base change").

   Claim: two different suppliers are asked for the Hodge filtration on algebraic de Rham cohomology built from normal-crossings compactifications, the absolute one (any characteristic-zero field L, consumed in 2.1, 2.2, 7.4) from a rigid-cohomology roadmap, the relative one (over smooth affine S_K, consumed in 6.2, 6.4, 6.6, 6.7) from the comparison roadmap.

   Witness: the relative contract specialised to S=Spec V is the absolute contract for T=U_K over L=K; both are defined from the same log de Rham complexes (BesserI line 652–662 and AM line 456–458 use the same Hodge filtration), and neither clause is rigid cohomology. Defect class 6 (two owners for one object).

   Repair: remove the de Rham clause ("and for smooth separated finite-type T over a characteristic-zero field L supply F^rRΓ_dR(T/L) ... scalar-extension compatibility") from `rigid-realizations`, and add to `relative-hodge` the sentence "The absolute case is S=Spec V: for smooth separated finite-type T over a characteristic-zero field L supply F^rRΓ_dR(T/L), r∈ℤ, from smooth proper normal-crossings compactifications, with filtered independence, products, finite Čech descent and scalar extension", with the `rigid-realizations` contract keeping only the rigid realizations over K0 and K. Point the *Needs:* lines of 2.1, 2.2 and 7.4 at `relative-hodge` as well. If the package may not reassign an existing gap's text in `plan.json`, record the move in the README contracts and in this repair report so that the intake announces it on the right supplier job.

3. **F03** (P3) `semistable_baseConvention_differentials` is half a definitional restatement

   Location: `packages/CohomologyComparisonsPartII/Suggested.lean:129-137`; README `:538` ("Provide `ClassicalSyntomic.semistable_baseConvention_differentials`, the two differential-commutation identities").

   Claim: the theorem states the two chain-map identities of the convention adapter identity, (a,b,c)↦(a,b,−c/e), −1/e in degrees 0, 1, 2.

   Witness: the first conjunct `semistableD0 p r phi ((-(e:ℚ)⁻¹) • N) iota x = (x - p^(-r) • phi x, iota x, (-(e:ℚ)⁻¹) • N x)` is `rfl` after unfolding `semistableD0` (line 103–106): it is the definition written out, not a commutation identity. Only the second conjunct is the degree-1→2 square.

   Repair: replace the first conjunct by the degree-0→1 square, `semistableD0 p r phi ((-(e:ℚ)⁻¹) • N) iota x = ((semistableD0 p r phi N iota x).1, (semistableD0 p r phi N iota x).2.1, (-(e:ℚ)⁻¹) • (semistableD0 p r phi N iota x).2.2)`, and say in the docstring that the two conjuncts are the two chain-map squares of the adapter (identity, diag(1,1,−1/e), −1/e).

4. **F04** (P3) Check labels that collide with targets or restate definitions

   Location: `packages/CohomologyComparisonsPartII/README.md:727` and `:735` (`FrobeniusPoint.detectSection_zeroRank` is both a "Prove" target and a Check with the same text); `:256` (Check `FilFMIC.extEvaluation_degreeZero`: "the identity of O maps to 1; the zero map maps to zero" restates line 246 "At i=0 it sends f:O_S→H to the class f(1)"); `:451` (Check `fontaineMessingPeriod_site` restates target `Syntomic.period_site` at line 441).

   Claim: each definition has three discriminating Checks.

   Witness: a Check with the same name as a target cannot be told apart from it by the Check scanner; a Check that is the definition's clause at i=0 discriminates nothing.

   Repair: rename the 7.2 Check to `FrobeniusPoint.detectSection_zeroModule` ("For M=0 the only section is zero; the hypothesis set is unchanged"); replace `extEvaluation_degreeZero` by a discriminating case, e.g. "For i=0 and H=O(1) at Spec(Z_p), Hom(O,O(1))=0 since F⁰O(1)=0, so u_0 is the zero map on a zero source; for H=O(0) the map f↦f(1) identifies Hom(O,O) with the Φ-fixed, horizontal part of F⁰O, which is Q_p"; replace `fontaineMessingPeriod_site` by a case that fails on the wrong site, e.g. "For X=Spec(Z_p) with canonical log structure and r=0, RΓ(X0,i*Rj_*Z/p^n)=RΓ(Spec Q_p,Z/p^n) has nonzero H¹, so the period target is not the closed-point constant sheaf".

5. **F05** (P3) 4.5 leaves the exponent of the transported bound unstated

   Location: `packages/CohomologyComparisonsPartII/README.md:489` ("H^q(E′_n(r))→R^qj_*(L_EN/p^n) has the transported 4.4 kernel/cokernel bound for 0≤q≤r") and `:491` (`etaleGluing_truncation`: "transported error bound").

   Claim: the gluing map inherits the bound p^A of 4.4.

   Witness: with τ≤rE′→τ≤rRj_* having cone i_*C, C the cone of τ≤rα′, the long exact sequences give ker H^q ⊂ quotient of H^{q−1}(C) and coker H^q ⊂ H^q(C), and 0→coker H^m(α′)→H^m(C)→ker H^{m+1}(α′)→0, so the kernel and cokernel are killed by p^{2A}, not p^A. EN line 366–369 claims only "a constant N as in Theorem 2.3".

   Repair: write "has kernel and cokernel killed by p^{2A(e,p,r)} with A the constant of 4.4 (p^{2(Nr+c_p)} with enough roots of unity)", and in `etaleGluing_truncation` "doubles the exponent through the cone of the closed map".

6. **F06** (P3) Three *Needs:* citations of unreadable suppliers are written as supplied sections, not as gaps

   Location: `packages/CohomologyComparisonsPartII/README.md:542` ("CrystallineCohomology §§CR.6.1–CR.6.2; CohomologyComparisons §4.5"), `:656` ("PadicDifferentialEquationsAndRigidCohomology §§RD.3.7–RD.3.8,RD.4.24"), `:162` ("PadicDifferentialEquationsAndRigidCohomology §§RD.3.7–RD.3.8, supply finite coherent models on cofinal affinoid neighbourhoods").

   Claim: these sections exist at the suppliers' current versions with the stated content (5.2 builds the sign and 1/e scaling of its adapter on CohomologyComparisons §4.5's "negative, p-normalized" monodromy convention, line 29 and 538).

   Witness: CohomologyComparisons, CrystallineCohomology, PadicDifferentialEquationsAndRigidCohomology, PadicHodgeTheory and PadicPeriodRings have no folder under `TauCetiRoadmap/`, `Completed/`, the three open pull-request checkouts or `packages/`; the package's own gap entries for the same suppliers say "accepted sections unavailable". Every other dependency on these five roadmaps goes through a declared gap, which the intake announces; these three do not.

   Repair: fold them into existing contracts so that the intake announces them: add "including the Frobenius–monodromy relation and uniformizer change on the proper carrier (CR.6.1–CR.6.2)" to `hyodo-kato-proper` (it already names those sections) and cite the contract in 5.2's *Needs:*; add to `relative-rigid-coefficients` the sentence "supply finite coherent models of coherent j†O-modules on a cofinal system of affinoid strict neighbourhoods and the derived-colimit comparison with global sections (AM line 615–620)" and cite it at lines 162 and 656 instead of RD.3.7–RD.3.8; for the base convention, state in 5.2 the convention actually assumed ("the base normalizes monodromy as N_base,norm=−N_c/e with change law exp(−e log(u)N_base,norm)") and cite it as part of the existing `rational-descent` or `rigid-syntomic-etale-period` contract text under CohomologyComparisons, so that a mismatch with the base's §4.5 is caught when that section becomes readable.

Scope of this pass: the whole of `packages/CohomologyComparisonsPartII/README.md` (816 lines) and `packages/CohomologyComparisonsPartII/Suggested.lean` (169 lines), the 32 declared gaps of `design/plan.json`, the merge order, the roadmaps on main cited as suppliers, and every source locator that resolves into the sources cache. No file outside the report and the scratch directory was written; no Lean was run (the package report records that `Suggested.lean` has never been compiled by anyone, so every Lean statement below was checked by hand).

Dependency gate output (unchanged tooling, unchanged order file):

```text
depcheck: 4 roadmaps, 30 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

## Verified sound

Counts: 9 Lean declarations and 6 examples read and hand-evaluated; 33 README target paragraphs with their sub-targets (about 120 named targets) read; 32 gap entries checked for slug agreement between `plan.json` and the README (32 of 32 match, each supplier named, none `none`); 37 sibling section or target-name citations into roadmaps on main checked and found to exist (AdicSpacesPartIV F1.5, F1.7, F1.8, F1.9, F1.12, F1.16 and the four F1.7 target names; EnhancedDerivedSheaves 0.1–0.4, E2:towers.1, E5:abstract; EtaleCohomologyFoundations F.0.3, F.1, F.3a, F.4.1–F.4.5; DerivedModuleAlgebra 0.K.1; RigidAnalyticGeometry 6.1, 6.2, 7.3, 7.4, 8.1, 8.4; GrothendieckEulerForms Layers 0 and 5; ColemanIntegrationPartII design 3.0c, 3.1a, 7.0); about 170 line locators verified against the cache (AM 45, EN 22, NN 16, CN 32, BesserI 14, HK 9, TsujiNearby 13, StacksRlim 1, Buhler 2, and every cited line of the 14 pinned Lean files); 48 Checks computed by hand.

Adversarial pass (statement, instances tried, result):

| Statement | Instances | Result |
|---|---|---|
| Conventions, F_V obstruction (line 23, Check 1.1 `ofData_ramifiedBaseObstruction`) | e=1; π²=p at p=2,3; general Eisenstein | Correct: F_V restricted to W(k) is F_W by formal étaleness, F_V(π) is a root of a Frobenius-twisted Eisenstein polynomial so has valuation 1, and p≥2 gives v(F_V(π)−π^p)=1<e. Hence the AM layers are exactly over V=W(k); the README says so by obstruction rather than by equation, which is acceptable. |
| 1.1 `ofData_nonhorizontal`, `ofData_genericOnlyRealization` | G_m with Φ(e)=te; S=Spec K | Both correct (∇Φe=dt⊗e≠0; B†=0 so the rigid realization is not faithful). |
| 1.2 Tate convention, H¹(G_m)=O(−1), φ(dlog t)=p dlog t | m=±1, tensor cancel | Consistent with AM line 183 and the filtration jump −m. |
| 1.3 `exactStructure_nonStrictIdentity` | F⁰A=K vs F⁰B=0,F⁻¹B=K | Correct: B→A is a morphism, A→B is not. |
| 1.4 fibre convention d(a,b)=(da,f(a)−db), Fib^q=A^q⊕B^{q−1} | d²; Q→2→Q; (0,b) connecting class | d²=0 uses only that f is a chain map; matches AM line 256–258; Lean example (1,0)↦(0,2), (0,1)↦(0,−1) computed. |
| 1.4 `pointUnit`, `pointTate` | k=F_p, O(0), O(1) | [Q_p→0→Q_p]; Q_p in degree 1. Correct. |
| 1.5 `extEvaluation_pointNonSplit` | Φe=e−h | u_1=(0,h)≠0 in coker(1−Φ)=Q_p; lift ambiguity c·h does not change it. Correct. |
| 1.6 `pointTateRemainder`, `noFzero` | O(1), O(0) | (0,−ah); lifts differ by ch only when F⁰H≠0. Correct; AM line 288 writes Fil⁰M_rig, the README's Fil⁰M_dR is the right reading. |
| 2.2 `pointWeightZero`, `pointPositiveWeight`, `genericOnly` | V=Z_p, r=0,1; X_k=∅ | H⁰=Q_p diagonal, H¹=Q_p; H⁰=0, H¹=Q_p; fibre=F^rRΓ_dR (BesserI line 746–749). Correct. |
| 2.3 unramified single fibre | K=K0 | Eliminating a=sp(b) in f_r gives Fib((1−φ_r)sp_r); matches AM line 1322. |
| 3.1 J^⟨r⟩ via level n+s | r=0; r≤p−1; Z/p | Matches EN line 166–168, 203; r=0 gives O_cr; division modulo p rejected. |
| 3.3 ω=(p^r,id), τ=(id,p^r) | chain squares | (1−φ_r)(p^r x)=p^r x−φx=(p^r−φ)x and (p^r−φ)x=p^r(1−φ_r)x; matches EN line 193–195. |
| 3.4 `tower` (lim¹) | A_n=⊕_{j≥n}F_p | lim=0, lim¹=∏/⊕≠0 by the six-term sequence at StacksRlim line 10670–10674. Correct. |
| 3.4 `horizontalPoint` | Spec Z_p, trivial log, r=0 | [Z/p^n→0→Z/p^n], rational H⁰=H¹=Q_p. Correct. |
| 4.1 lattices | p=2,r=2; r=0 | L_EN=1/8, L_CN(2)=1/4, coordinate 2, zero at n=1; weight zero Z_p. Correct; endpoint remark is R01. |
| 4.3 `cartierWitness` | G_m over F_p | C⁻¹(t dlog t)=[t^{p−1}dt]≠0, [t dlog t]=[dt]=0. Correct (TsujiNearby line 1213–1217). |
| 4.3 range r≤p−2 | p=2,3 | Matches EN line 186–188, 318–323; CN line 85–88 quotes r≤p−1 for a related statement but the README cites its own sources consistently. |
| 4.4 constants | enough roots; p=2 | Matches CN line 78–84 and 421–423 (δ_K+[K:F_i]<e/(2p), d-dependence at p=2). |
| 5.1 `cartierNecessary` | k[t]/t^m, p∤m, m>1 | φ(t^{m−1})=t^{p(m−1)}=0 so φ not injective; matches HK line 730–739. |
| 5.2 square commutes | Nφ=pφN | N(1−φ/p^r)=(1−φ/p^{r−1})N; Lean `semistable_d_squared` is true; all eight numerical conjuncts of the rank-two example recomputed (p=2, r=0,1, e=2, e=0 with 0⁻¹=0). Matches NN line 1353–1361 and HK line 770, 1340. |
| 5.2 adapter N_b=−N_c/e | e=2, e=0 | T1∘D0_c=D0_b and D1_b∘T1=−(1/e)D1_c hold for all e; exp(−e log u N_b)=exp(log u N_c). Correct. |
| 6.1 `projectiveLine` | P¹_S | H²=O(−1) with Frobenius p. Correct. |
| 6.2 `genericDivisor` | U=D(pt−1)⊂A¹_{Z_p} | U_k=S_k, c bijective since (1−pt)⁻¹ overconverges, H⁰_dR not finite over Q_p[t]. Correct and a genuine gap in AM line 502–505. |
| 6.3 `collision` | x=0, x=t over A¹ | Fibre divisor x²=0 at t=0. Correct. |
| 6.5 `properCounterexample` | E/V | H¹(E^an,O)=K; AM Lemma 2.19 as printed (AM line 609–610) is false for proper X and its proof is affine. Correct. |
| 6.6 `splitGm`, `nonsplit` | P¹−{0,∞}; t²+t+1 over Z_2 | Res=(1,−1), Gys=sum; trace-zero line with σ=−1 twisted by (−1): Frobenius −2. Correct. |
| 6.7 twists | G_m, n=1; n=0 | H¹(U/S)(2)=O(1), F⁰=0; residue lands in H⁰(D/S)(1). Correct; F^{n+1}H^n_dR=0 is automatic for the compactified Hodge filtration (Ω^{≥n+1} starts in degree n+1), so the stated hypothesis is harmless. |
| 7.1 lifts | σ(t)=t^p; σ(t)=t^p+p | P_a(t)=[a]; x=x^p+p gives x≡p mod p². Correct (AM line 1229–1288). |
| 7.2 detection | k=F_p, t^p−t; M=0 | Fails over finite k; zero-rank included. Correct (AM line 1289–1301). |
| 7.4 `verticalLog` | Spec Z_p, r=1 | Horizontal fibre H¹=Q_p; C_st point complex Q_p→Q_p³→Q_p with H¹=Q_p²=dim H¹_st(G_{Q_p},Q_p(1)). Correct. |
| 7.5 connecting isomorphism | curve, n=1, r=2 | F²=0 on a curve; H¹_rig≅H²_rsyn(U,2) from the single fibre since V=W(k). Correct. |

Lean versus README: binders, instance arguments and coercions of all nine declarations agree with the README text (ℚ-modules restrict Q_p-vector spaces; natural-number division `r/(p−1)` is the floor; zpow exponents −r and 1−r are the integers stated). No `set_option`, no `lemma`, no `True` placeholder, no sorry'd data, single `import Mathlib`, four honest `sorry` theorems; every Lean name appears in the README; each kept definition has at most two proved examples. The two sorry'd lattice theorems are true (p^{−a}=a!·(p^a a!)^{−1} in a field of characteristic zero). Elaboration of the six examples was traced by hand through the expected simp lemmas (`LinearMap.prod_apply`, `fst_apply`, `snd_apply`, `smul_apply`, `Nat.factorial_two`, `inv_zero`, zpow evaluation) and should close, but see Not verifiable.

Policy: the pull request changes only `packages/CohomologyComparisonsPartII/` (8 files); no pull-request numbers or process narrative in README or docstrings; `theorem` only; every target paragraph has a locator; no computational algorithm; the three roadmaps cited that are absent from `merge-order/ORDER.txt` (RigidAnalyticGeometry, GrothendieckEulerForms) are on main, and ColemanIntegrationPartII (earlier in the order) is mentioned only as a non-dependency.

Sources: all cited locators into AM, EN, NN, CN, BesserI, HK, TsujiNearby, StacksRlim and Buhler support the statements they are cited for, with the single exception recorded in R01. The manifest records BesserII as `uncertified` and the README does not cite it.

## Not verifiable

- CohomologyComparisons §§1.11, 2.14, 3.7, 4.2–4.5, 4.8, 6.3; CrystallineCohomology §§CR.3.2, CR.5:log-algebra.1–5, CR.5.1–CR.5.4, CR.6.1–CR.6.2, CR.6.4–CR.6.5; PadicDifferentialEquationsAndRigidCohomology §§RD.3.7–RD.3.8, RD.3.13, RD.3.25, RD.3.28–RD.3.32, RD.4.5–RD.4.11, RD.4.18–RD.4.24, RD.4.31, RD.4.36–RD.4.38, RD.5.88–RD.5.89, RD.5.99, RD.5.101–RD.5.104, RD.5.107–RD.5.109, RD.5.115, RD.6.88; PadicHodgeTheory §§1.1–1.5, 2.1–2.4; PadicPeriodRings §§3, 4.1–4.3: these five roadmaps are in the merge order but have no folder on main, in the three open pull-request checkouts or on the board, so neither the section numbers nor their hypotheses could be checked. All but the three citations of R06 are covered by declared gaps.
- The monodromy convention attributed to CohomologyComparisons §4.5 (negative evaluation, p-normalized, N_base,norm=−N_c/e), on which the sign and the 1/e factor of the 5.2 adapter depend, could not be read; the adapter is internally consistent with HK line 1340 and NN line 1353–1361.
- Lean elaboration: no Lean command is permitted in this pass and the package report records that the file has never been compiled; the risk points are the `let`-bound rank-two example (line 150–167, relies on zeta-reduction inside `norm_num`) and `Nat.factorial 2` evaluation inside `norm_num [enLattice, cnLattice]` (line 86–92).
- BesserII (manuscript pp. 335–359) is uncertified in the manifest and uncited in the README; nothing depends on it.
- Whether the assignment of `nearby-cycle-cartier` (a characteristic-p Cartier isomorphism on log differentials) to EtaleCohomologyFoundations rather than CrystallineCohomology is the right owner is a design-stage question; it is a declared gap with a named supplier and is not raised here.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "538903f6e09e879f57ca6377395285ef6b17a79f", "job": "RT-CohomologyComparisonsPartII~1b", "model": "fable", "worker": "chris-g"} -->
