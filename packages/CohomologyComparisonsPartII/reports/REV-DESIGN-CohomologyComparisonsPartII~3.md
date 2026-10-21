<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/47#issuecomment-6306405365 -->
Review (claude) of 1fc6199

Verdict: needs_changes

1. **F01** (P2) `base-ownership` needs is non-mathematical and hides an unowned étale period map

   Location: `packages/CohomologyComparisonsPartII/design/README.md` line 66, "Supply the base roadmap text and exact sections identifying its comparison objects and already-owned theorems"; line 700, "`ClassicalSyntomic.logRigidComparison_period` (The two period maps to generic-fibre étale cohomology commute through this equivalence.)"; line 717, "`absoluteExtensionValue_period` (Applying the log or rigid period map gives the same étale class.)"; `design/plan.json` gap `base-ownership` and targets 2.1, 5.1, 5.2, 5.3, 7.4.

   Claim: the gap is a precise supplier contract, and 7.4 and 7.5 may assert compatibility of the log-syntomic and rigid-syntomic period maps to étale cohomology.

   Witness: the needs sentence requests text and sections, not a theorem with hypotheses, so the intake cannot announce a mathematical obligation; and the rigid syntomic period map H^i_rsyn(X,r)→H^i_et(X_K,Q_p(r)) exists in no layer, section or gap. AM line 1327–1334 obtains it from BesserI Corollary 9.10; BesserI line 1209–1216 constructs it through Nizioł's comparison, for smooth quasi-projective X. No Layer 2 target mentions an étale period map, and `rational-descent` supplies only NN's h-syntomic period maps.

   Repair: (i) rewrite the `base-ownership` needs as the list of mathematical outputs each consuming target imports, with hypotheses, and delete it from the Needs of every target that imports nothing identifiable (2.1 takes its carriers from `rigid-realizations`; 5.1 from `hyodo-kato-proper`; 5.2 from `arithmetic-pair-deformation`); (ii) either add a gap `rigid-syntomic-etale-period` (supplier CohomologyComparisons) whose needs reads "For smooth quasi-projective X over V and r≥0, supply the functorial, product- and pullback-compatible period map H^i_rsyn(X,r)→H^i_et(X_K,Q_p(r)) of BesserI Corollary 9.10, and, for Y projective smooth over W(k) with relative normal-crossings D and horizontal log structure M, its commutation with the log-syntomic period map of 4.2 and 4.5 through the comparison of 7.4", required by 7.4 and 7.5, or cut `logRigidComparison_period`, `absoluteExtensionValue_period` and the two prose clauses "and the period maps on the shared base carriers" (line 698) and "Products and period compatibility are those of the comparison maps" (line 715), leaving the étale compatibility to PadicHodgeRegulators; (iii) mirror in plan.json (`prerequisites`, `neededBy`, gaps) and in the README gaps list.

2. **F02** (P3) 7.4 uses a completed log-syntomic complex that 3.4 defines only on arithmetic pairs

   Location: README line 350, "For an arithmetic pair (U,Ubar) log-smooth over V with canonical log structure, set RΓ_syn(U,Ubar,r)=Rlim_n RΓ(S′_n(r))"; line 698, "construct RΓ_log-syn((Y,M),Q_p(r))≃RΓ_rsyn(U,r)"; line 702, "Form completed and rational horizontal-log coefficients from 3.2 and the local PD presentations of 3.4".

   Claim: the completed and rational complex for the horizontal-log pair (Y,M) over trivial-log W(k) is a Layer 3 carrier.

   Witness: Conventions line 19 states that 7.4's pair "does not add Y0 to D", so it is not an arithmetic pair with canonical log structure, and no other sentence of Layer 3 defines Rlim or ⊗Q_p outside that domain. AM line 275 defines the absolute object as Q⊗lim_n H^i(S_1,S_n(r)).

   Repair: in 3.4 define RΓ_syn(X,r):=Rlim_n RΓ(X_et,S′_n(r)) and its divided analogue, and RΓ_syn,Q, for every log-syntomic X over W(k) of 3.2, keeping `completedReduction` and `rationalFiber` on the NN arithmetic-pair domain; make 7.4 cite that carrier.

3. **F03** (P3) `period-rings` needs is compound and names an unspecified "missing API"

   Location: README line 76, "supply the missing filtration and comparison API and the divided/undivided integral fundamental sequences, including the CN chart PD Poincaré and Artin–Schreier sequences"; plan.json gap `period-rings`; Needs of 4.1 (line 382).

   Claim: the contract says exactly what is missing.

   Witness: "missing filtration and comparison API" names no statement; the paragraph's own sentence "NN §4.1 and CN §2.4.3 specify which sequence is used" is outside the needs sentence the intake announces. 4.1 (line 376–380) uses only Z_p(r)⊂Q_p(r) and factorial valuations, no period ring.

   Repair: replace the needs by the enumerated statements: filtration, φ, N and t on A_cris, B_cris, B_st and B_dR over V; the fundamental sequence for the divided map with lattice Z_p(r), 0≤r≤p−2, and for the modified-lattice map with L_EN(r), r≥0 (EN §2.2, p. 7, citing Fontaine–Messing III.5); the chart PD Poincaré and Artin–Schreier sequences of CN §2.4.3, p. 23 (CN line 968). Remove `period-rings` from 4.1's Needs and plan prerequisites unless a period-ring statement is used there.

4. **F04** (P3) pinned monoidal and opposite exact-structure carriers are described, not cited

   Location: README line 124, "under an additional R-bilinear biexact symmetric monoidal structure"; line 170, "duality (viewed from the opposite exact category)"; line 172, `FilFMIC.ext_cup`.

   Claim: biexactness of the tensor product and the opposite exact structure are new data the supplier must introduce.

   Witness: Tau Ceti at pin a91d3aa has `TauCeti.ExactStructure.IsMonoidal` in `TauCeti/CategoryTheory/Exact/Monoidal.lean` (binders `[MonoidalCategory C] [MonoidalPreadditive C]`, fields `isConflationExact_tensorLeft/Right`) and `TauCeti.ExactStructure.op` in `TauCeti/CategoryTheory/Exact/Opposite.lean`.

   Repair: cite both under From Tau Ceti; add an API item `FilFMIC.exactStructure_isMonoidal` to 1.3 asserting `IsMonoidal` for the tensor of 1.2; phrase the `exact-yoneda` needs as "under `TauCeti.ExactStructure.IsMonoidal` with Mathlib `SymmetricCategory` and R-bilinearity"; record both files in `sources.toml` through the sources service.

5. **F05** (P3) process text in a timeless README

   Location: README line 31, "A production module imports proved definitions rather than a roadmap prototype. Suggested.lean is reserved for headline forms …"; line 66, "Bind every overlapping comparison to its accepted section before implementing the adapters here"; line 747, "line numbers identify the service-cached or operator-held extraction".

   Claim: these sentences are mathematics or scope.

   Witness: each describes the workflow (Lean file policy, an implementation-time instruction, the review cache), which the house style excludes.

   Repair: delete the two policy sentences at line 31; reword line 66 as an ownership statement ("Every comparison the base owns is imported, none reconstructed"); at line 747 keep theorem and page locators and drop the sentence about the extraction.

6. **F06** (P3) three Check wordings

   Location: README line 571, "For p odd, the horizontal sections x=0 and x=t over A¹_V collide at t=0"; line 198, "is acyclic, including the sign on its second differential"; line 479, "φ(t)=t^p on its rational crystalline H⁰ need not be invertible".

   Claim: each Check states a computed fact.

   Witness: the collision of x=0 and x=t at t=0 does not depend on p; a two-term complex has one differential (the intended point is the positive sign of f(a) in the second component); HK line 737–739 states that φ is not bijective whenever r>1, so "need not be" understates the source.

   Repair: delete "For p odd"; write "with d(a)=(0,2a), the second component carrying +f(a)"; write "is not bijective for every m>1 (HK (3.3), HK line 738)".

Files reviewed: `packages/CohomologyComparisonsPartII/design/README.md`, `packages/CohomologyComparisonsPartII/design/plan.json`, `packages/CohomologyComparisonsPartII/sources.toml`. The round-2 review file is absent from the package; its three findings were taken from `packages/CohomologyComparisonsPartII/reports/FIX-DESIGN-CohomologyComparisonsPartII~3.md`, which quotes them.

## Previous findings

- **F01 (gap contracts summary-only → mathematical needs).** Repaired for the contracts it named. `crystalline-inputs` (README line 68) now reads "for X log-syntomic over W(k), the sheaves O_cr,n=H⁰_cr(X_n,O) and J_n^[r]=H⁰_cr(X_n,J^[r]) with J^[r]=O for r≤0, their Z/p^n-flatness …" and agrees with EN line 158–168; `crystalline-filtered-quotient` (line 70) states the NN Corollary 2.4 quotient equivalence (NN line 1331–1337); `rigid-realizations` / `rigid-log-crystalline` (lines 78, 80) separate the semilinear K0 realization from the horizontal-log comparison (AM line 1302–1326); `nearby-cycle-cartier` and `nearby-cycle-graded` (lines 94, 96) state Tsuji Theorems A3–A4 and Lemmas 4.3–4.4 with their hypotheses (TsujiNearby line 1211–1233, 805–810, 873–878). Every gap paragraph agrees verbatim with its plan entry. The `base-ownership` needs was outside that finding's scope and is still non-mathematical; see R01.
- **F02 (pinned exact-structure carriers).** Repaired. README line 48: "`TauCeti.ExactStructure C` … requires `[Category C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]`" matches TauCetiExactReview line 245–246; "`IsConflationExact E E′ F` requires … an additive functor" matches TauCetiExactFunctorReview line 68–81; line 176 lists both carriers in 1.3's Needs.
- **F03 (tower Check with an instance).** Repaired. README line 362 gives A_n=⊕_(j≥n)F_p, the short exact tower 0→A_n→B→C_n→0 with constant B and Mittag–Leffler C_n, lim A_n=0 and lim¹A_n≃(∏F_p)/(⊕F_p) with the nonzero class of (1,1,…). I recomputed it: lim C_n=∏F_p, lim¹B=lim¹C_n=0, so the six-term sequence gives lim¹A=coker(⊕→∏). Correct (StacksRlim line 10638–10675).

## Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: F_V obstruction, fibre sign, Tate normalisation | e=2 with π²=p at p=2,3; multiplication 2 on Q; O(±1) | v(F(π))=1 while v(π^p)=p, so F(π)−π^p∉pV; d(a)=(0,2a) acyclic; O(−1) has Φ=pσ matching φ(dlog t)=p dlog t | None |
| 1.1 FilFMIC | zero object; unit; Φ(e)=te; S=Spec K with B†=0 | ∇Φ(e)=dt⊗e≠Φ∇e; B†=0 since (1−πx)⁻¹ converges on a disc of radius >1, so the rigid realization is not faithful; de Rham faithful because c determines H_rig | None |
| 1.2 tensor, Tate, pullback | O(1)⊗O(−1); zero factor; identity pullback | exponents and jumps add; identity pullback is identity | None |
| 1.3 exact structure, Yoneda | split extension; B→A with F⁰B=0, F⁰A=K | identity is a morphism but not strict; Ext⁰=Hom; needs the pinned monoidal carrier | R04 |
| 1.4 S_σ(H) | O(0) and O(1) at Spec Z_p; H=0 | S(O(0))=[Q_p→0 Q_p]; S(O(1))=Q_p[−1] since F⁰O(1)=0; S(0)=0 | R06 wording |
| 1.5 u_i | i=0 identity; split class; Φe=e−h | u_1=(0,h)≠0 in coker(1−Φ)=Q_p; split gives 0 | None |
| 1.6 unique lift, δ, R_σ | H=O(1), Φe=e+ah; H=O(0) | remainder −ah; without F⁰H=0 lifts differ by ch, so projections are not exported | None |
| 2.1 sp diagram | Spec V; empty X; Spec K | id_K; zero; K→0 not an equivalence | None |
| 2.2 RΓ_rsyn | V=Z_p, r=0 and r>0; X_k=∅ | r=0: H⁰=Q_p (diagonal), H¹=Q_p; r>0: f injective, H⁰=0, H¹=Q_p; X_k=∅ gives F^rRΓ_dR | None |
| 2.3 long exact sequence, products, K=K0 fibre | elimination of a=sp(b); G_m weight 1 | single fibre by Gaussian elimination, not inversion of sp; (1−φ/p)dlog t=0 | None |
| 3.1 J^⟨r⟩, φ_r | r=0; p=2, r=1; Z/p division | J^⟨0⟩=O_cr; equality J^⟨1⟩=J^[1] at p=2 while 4.3's range is r≤0; py=0 has two solutions in Z/p | None |
| 3.2 S_n, S′_n | r=0; zero map A[0]→B[0]; empty scheme | fibres agree at weight 0; H⁰=A, H¹=B | None |
| 3.3 ω, τ, cup | r=0; multiplication p on Z/p² | τω=ωτ=p^r; killed error is not an equivalence | None |
| 3.4 PD presentations, Rlim, rational fibre | r=0; invert p^r; tower A_n=⊕_(j≥n)F_p; horizontal-log (Y,M) | quotient zero at r=0; ω⁻¹=p^(−r)τ; lim¹≠0; the completed carrier for 7.4 is not defined on its domain | R02 |
| 4.1 lattices | r=0; p=2, r=2 (a=2); r=p−1 endpoints | L_EN=(1/8)Z_2(2), L_CN=(1/4)Z_2(2), coordinate 2, zero mod 2; endpoint lattices differ by p | R03 (Needs only) |
| 4.2 α, α′ | r=0; unit; nonproper X | maps coincide at r=0; no RΓ(X0,i*Rj_*)=RΓ(X_tr) inferred | None |
| 4.3 exact comparison | p=2 (r=0 only), p=3 (r≤1); t dlog t on G_m/F_p | C⁻¹(t dlog t)=[t^(p−1)dt]≠0 since p c_p=1 is unsolvable, [dt]=0; τω=p^r does not transfer to S′ | None |
| 4.4 bounded comparison | xy=π^h, h>1; p=2, r=1; q>r | CN 1.1(ii) constant N(e,p,r) independent of n and X (CN line 83–84); p=2 keeps d in c_2; no claim above r | None |
| 4.5 gluing | empty closed part; j′=id; weight 0 | open direct image only; lattice itself; units glue | None |
| 5.1 HK adapter | rank one; φ=diag(1,p), Ne1=e0; k[t]/t^m, p∤m | Nφ=pφN holds; exp(log(u)N)e1=e1+log(u)e0; HK (3.3) φ not bijective for m>1 | R06 wording |
| 5.2 C_st | r=0; two-term datum; D=E=0; point at r=1 | lower map 1−pφ at r=0; N(1−φ/p^r)e1=(1−p^(1−r))e0; point complex Q_p→Q_p³→Q_p has H¹=Q_p² | None |
| 5.3 h-adapter | identity refinement; p=2; r=0 | NN Theorem A(4) states both arithmetic and geometric τ≤r equivalences (NN line 93–100) | None |
| 6.1 datum | id_S; empty U; P¹_S | H²(P¹)=O(−1) with Frobenius p | None |
| 6.2 promotion | c=0; non-locally-free graded; U=D(pt−1)⊂A¹_(Z_p) | U_k=S_k, H⁰_dR=Q_p[t,(pt−1)⁻¹] not finite over Q_p[t], H_rig=B†_K via Σp^jt^j, c bijective: rigid coherence does not give algebraic finiteness | None |
| 6.3 goodCompactification | A¹×G_m; empty boundary; x=0 and x=t | collision at t=0 fails relative normal crossings, independent of p | R06 wording |
| 6.4 two domains | genus-g curve, g=0; G_m; p=2 | ranks 1,2g,1; H¹(G_m)=O(−1) | None |
| 6.5 affine acyclicity | A¹; G_m; elliptic curve E/V | H¹(E^an_K,O)=K, so AM Lemma 2.19 needs the affine hypothesis the proof uses | None |
| 6.6 residue sequence | P¹−{0,∞}; D: t²+t+1 over Z_2; D=∅ | residues (1,−1), Gys=sum; trace-zero part of Q_4 twisted by (−1) has Frobenius −2; empty D excluded by affineness | None |
| 6.7 δ, R_σ | n=0; split class; G_m with n=1 | F⁰(H^n(n+1))=F^(n+1)H^n; the hypothesis is automatic for affine U (degree-n term of Ω^(≥n+1) vanishes), harmless | None |
| 7.1 Frobenius-compatible lifts | σ(t)=t^p: 0 and Teichmüller; σ(t)=t^p+p | [a]^p=F_W[a]; α=α^p+p gives α≡p mod p² for every p | None |
| 7.2 detection | M=0; constant 1; k=F_p with t^p−t | zero-rank included; t^p−t vanishes at all Teichmüller lifts, so algebraic closure is needed | None |
| 7.3 specialization | split; Z=Spec W(k); t=p with σ(t)=t^p | p^p≠p, so an arbitrary lift breaks the Frobenius equation | None |
| 7.4 log/rigid comparison | point, r=0; (P¹,{0,∞}); vertical log at r=1 | horizontal fibre H¹=Q_p versus C_st point H¹=Q_p²; étale period compatibility has no owner | R01 |
| 7.5 absolute value | curve, n=1, r=2; split; nonvanishing H^(n+1)(F^r) | F²=0 for a curve so H¹_rig≃H²_rsyn(U,2); connecting class (0,b) | R01 (period API) |
| Gaps (31) | supplier `none`? already provided? vague? | no `none`; nothing already provided (grep below); `base-ownership` vague, `period-rings` compound | R01, R03 |

## Verified sound

- **Gate.** Exact output of the dependency check:

  ```text
  candidate: CohomologyComparisonsPartII is not in the merge order yet; checked as if placed after CohomologyComparisons (the intake inserts it when its design is accepted)
  depcheck: 3 roadmaps, 12 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line. Every supplier cited is earlier in `merge-order/ORDER.txt` or on main (AdicSpacesPartIV, DerivedModuleAlgebra, EnhancedDerivedSheaves, EtaleCohomologyFoundations, PadicPeriodRings, CrystallineCohomology, PadicDifferentialEquationsAndRigidCohomology, PadicHodgeTheory, CohomologyComparisons; RigidAnalyticGeometry and GrothendieckEulerForms on main). The three named consumers are not cited as suppliers.
- **Sections exist on main.** AdicSpacesPartIV F1.5, F1.7, F1.8, F1.9, F1.12, F1.16; RigidAnalyticGeometry 6.1, 6.2, 7.3, 7.4, 8.1, 8.4; EnhancedDerivedSheaves 0.1–0.4, E2:towers.1, E5:abstract; EtaleCohomologyFoundations F.0.3, F.1, F.3a, F.4.1–F.4.5; DerivedModuleAlgebra 0.K.1; GrothendieckEulerForms Layer 5 (abelian Ext only, so the exact-yoneda Part II gap is correctly a gap).
- **Plan and README agree.** 7 layers, 33 targets, 120 API items, 105 Checks; every target, API and Check name occurs in the README; 31 gaps in both files with identical supplier, needs and section; every `gap:` prerequisite names an existing gap and every `neededBy` matches its users; no target prerequisite points forward; every definition has at least three Checks; every target has a locator; every layer has Examples and Dependencies.
- **Seeded source sample (15 targets, all read at the locators).** 1.1: AM Definition 2.1, Remark 2.2, AM line 117–170. 1.6: AM Lemma 2.5, (2.10), (2.22), AM line 283–297, 795–815. 3.4: EN line 198–218, NN line 1299–1337. 4.2: EN line 299–329, CN line 60–69, 2587–2598. 4.3: EN line 186–192, 318–323, TsujiNearby line 892–945, 1074–1143. 4.4: CN line 70–84, 413–423, 2600–2605. 5.1: HK line 698–723, 730–739, 770, 1321–1342. 6.1: AM line 451–501. 6.2: AM line 497–505, 627–640. 6.4: AM line 510–585. 6.7: AM line 795–815. 7.1: AM line 1229–1288. 7.2: AM line 1289–1301. 7.3: AM line 1352–1364. 7.5: AM line 1352–1400, BesserI line 727–745. Hypotheses, theorem numbers and pages agree with the README in every case; the only sharpening is R02 (domain of the completed complex). Scope line 15's AM Theorem 3.7 hypotheses agree with AM line 1185–1203.
- **Previous repairs.** F01–F03 as quoted above.
- **Duplication by object.** Pinned Mathlib 6b7abb3: `WittVector.Isocrystal`, `CochainComplex.mappingCone`, `Abelian.Ext`/`HasExt`, `BDeRhamPlus`/`BDeRham` (lines 75, 88 of the pinned file) are cited; no syntomic, rigid, crystalline, Hyodo–Kato, Gauss–Manin or Hodge-filtration object exists. Pinned Tau Ceti a91d3aa: `TauCeti.ExactStructure`, `IsConflationExact`, the cone contractibility theorem and the standard-syntomic predicate are cited; `TauCeti/Geometry/Hodge` is complex Hodge theory; no exact-category Yoneda Ext exists; `IsMonoidal` and `op` exist (R04). Main-branch roadmaps and the two open pull requests (ErdosProgressionPowers, ArithmeticDynamics) contain no syntomic, rigid-syntomic or filtered-F-isocrystal objects; the board's ColemanIntegrationPartII is a consumer.
- **Declared gaps.** No supplier is `none`; nothing requested is provided by Mathlib, Tau Ceti or a main roadmap; 29 of 31 needs sentences are precise with hypotheses (exceptions R01, R03).
- **Principles.** General statements throughout (all primes, ramified V admitted in Layers 2–5, nonsplit boundaries, every degree); no algorithm; no copied passage found in the sampled paragraphs; no Lean file, hence no `set_option` or sorry'd data to check.

## Not verifiable

- CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicDifferentialEquationsAndRigidCohomology and PadicHodgeTheory have no text on main or in an open pull request; their contracts are the declared gaps. Overlap of Layers 2–5 with the base cannot be excluded until its text exists; this is recorded as a risk, not a finding.
- BesserI is an OCR extraction whose displayed formulas (Definition 6.1, (6.2)) are damaged; the fibre shape was cross-checked against AM (3.12), AM line 1322. BesserII is paywalled and used by no target.
- The round-2 review file is absent; the repair report's quotations were used instead.
- No `Suggested.lean` exists at the design stage, so no elaboration was run.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1fc61999a2ba3d52aa10c82adf0347e1e649dd2b", "job": "REV-DESIGN-CohomologyComparisonsPartII~3", "model": "fable", "worker": "chris-f"} -->
