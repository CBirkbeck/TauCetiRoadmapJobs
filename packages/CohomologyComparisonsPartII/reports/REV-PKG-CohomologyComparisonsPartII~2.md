<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/110#issuecomment-6310955473 -->
Review (claude) of 05fcc7c

Verdict: needs_changes

1. **F01** (P2) a consumed contract is not a declared gap

   Re-raised: F01

   **Location.** `packages/CohomologyComparisonsPartII/README.md` line 128: "**`local-period-fundamental-sequences`.** On the completed étale semistable charts with horizontal boundary of CN §2.2.2, require the Artin–Schreier exact sequences…"; cited at lines 445, 479 and 509 as `contract local-period-fundamental-sequences`.

   **Claim.** The README declares 32 contracts; `design/plan.json` declares 31 gaps and has no slug `local-period-fundamental-sequences`. Its `period-rings` `needs` sentence still contains the CN Lemma 2.23 and Lemma 2.37 chart statements (542 of 1102 characters agree with README line 102, then the texts diverge). The intake announces gaps from `design/plan.json`, so PadicPeriodRings would be told to supply chart lemmas the README no longer asks of it, and PadicHodgeTheory would never be told of the contract that 4.2 and 4.4 consume. An acceptance's `conditional_gaps` can list only declared slugs.

   **Witness.** `design/plan.json` gap list (31 slugs, none equal to `local-period-fundamental-sequences`); its `period-rings` entry: "…on the completed CN §2.2.2 semistable charts supply the Artin–Schreier exact sequences of CN Lemma 2.23(i)…"; README line 102 ends "(EN §2.2, p.7, EN line 299–308)".

   **Why the reason fails.** "Outside permitted files" is true of the registry, but the previous review's in-package alternative was available and was declined on a preference, not an impossibility. Both files now disagree on what is announced to two suppliers, which is exactly the defect the gap mechanism exists to prevent. Parking for a human is the right outcome, since the correct edit is the registry one.

   **Exact repair.** A human (or the design lane) adds to `design/plan.json` `gaps` the entry `local-period-fundamental-sequences`, supplier `PadicHodgeTheory`, section "accepted sections unavailable; CN Lemma 2.23, pp. 23–24, CN line 973–980; Lemma 2.37, pp. 28–29, CN line 1234–1239", `needs` equal to README line 128 from "On the completed étale semistable charts" to "…partial powers of level s"; replaces the registry's `period-rings` `needs` by README line 102's sentence from "For V a complete" to "(EN §2.2, p. 7, EN line 299–308)"; and adds `gap:local-period-fundamental-sequences` to the prerequisites of targets 4.2 and 4.4. If the registry is to stay frozen instead, apply the README-side alternative of the previous review.

2. **F02** (P3) Checks of 6.5 are labelled with a target the README no longer has

   **Location.** `packages/CohomologyComparisonsPartII/README.md` lines 660–662: "`RelativeCohomology.affineOverconvergentAcyclicity_affineLine`", "`…_gM`", "`…_properCounterexample`".

   **Claim.** The target of 6.5 is `RelativeCohomology.continuousDifferentialComparison` (line 650); the affine vanishing theorem was moved to the supplier paragraph "Affine overconvergent coefficient vanishing" (line 160–162). No README target or Lean declaration is named `affineOverconvergentAcyclicity`, so these three Checks name a carrier that does not exist in the file.

   **Witness.** `grep -c affineOverconvergentAcyclicity README.md` finds only the three Check labels; the subsection's only named target is `continuousDifferentialComparison`.

   **Exact repair.** Rename the three labels to `RelativeCohomology.continuousDifferentialComparison_affineLine`, `_gM` and `_properCounterexample`. Their content (H⁰=K, H¹=0 on A¹; H¹=K dlog t on G_m; H¹(E_K^an,O)=K on an elliptic curve) stays as it is.

3. **F03** (P3) Check labels of 1.1 and one duplicated label

   **Location.** `packages/CohomologyComparisonsPartII/README.md` lines 182–186: "`FilFMIC_zero`", "`FilFMIC_unit`", "`FilFMIC_nonhorizontal`", "`FilFMIC_ramifiedBaseObstruction`", "`FilFMIC_genericOnlyRealization`"; line 226 and line 242 both use "`FilFMIC.fiberCoordinatesDifferential_zero`".

   **Claim.** Every other Check in the file is `Namespace.target_qualifier` (the convention the previous round's F04 enforced); the five 1.1 labels use an underscore after the namespace, so a scanner keyed on `FilFMIC.` misses them. On line 226 `FilFMIC.fiberCoordinatesDifferential_zero` is an API lemma (the zero value of the coordinate map) and on line 242 it is a Check label; one name for two items.

   **Witness.** The 108 other Check labels all contain a dot after the namespace; the sibling labels of 1.2 are `FilFMIC.tensorTatePullback_twistOne`, `_tensorCancel`, `_identityPullback`.

   **Exact repair.** Rename the 1.1 labels to `FilFMIC.ofData_zero`, `FilFMIC.ofData_unit`, `FilFMIC.ofData_nonhorizontal`, `FilFMIC.ofData_ramifiedBaseObstruction`, `FilFMIC.ofData_genericOnlyRealization` (or `FilFMIC.zero` etc.), and rename the line-242 Check to `FilFMIC.fiberCoordinatesDifferential_zeroInput`.

One P2 finding, which re-raises the registry mismatch the repair round marked not actionable, and two P3 naming notes. The mathematics of the 33 targets, the 32 contract paragraphs, the 113 Checks and the nine Lean declarations was checked again and found sound; no false statement, vacuous statement, unowned prerequisite, upward citation or duplication was found.

## Repair check of the previous review (F01–F07)

| Id | Status | Repaired passage |
| --- | --- | --- |
| F01 (P2) | **not repaired** (marked not actionable; re-raised as R01) | `design/plan.json` still has 31 gaps; its `period-rings` `needs` still ends "…with partial divided powers of level s≥0"; the README's `period-rings` (line 102) stops at "(EN §2.2, p. 7, EN line 299–308)", and line 128 still declares `local-period-fundamental-sequences`. |
| F02 (P3) | repaired | `packages/CohomologyComparisonsPartII/Suggested.lean` line 3: "/-! # CohomologyComparisonsPartII: representative target signatures". |
| F03 (P3) | repaired | README line 322: "products carry the Koszul sign (−1)^(ij)." |
| F04 (P3) | repaired | README line 770: "`ClassicalSyntomic.logRigidComparison_verticalLog`: For Y=Spec(Z_p), D empty and r=1…". |
| F05 (P3) | repaired | Suggested.lean lines 86–92: the example ends with "(4 : Padic 2)⁻¹ = 2 * (8 : Padic 2)⁻¹"; the `ZMod 2` conjunct is gone. |
| F06 (P3) | repaired | Suggested.lean line 129: `semistable_baseConvention_differentials (p r e : ℕ)` with no `he`; docstring "hold for every natural `e`, including zero; invertibility requires `e ≠ 0`"; README line 538 and the `zeroIndex` Check (line 554) agree. |
| F07 (P3) | repaired | README line 439: "X a log-scheme log-syntomic over W(k), i:X0→X, X_η=X[1/p], U=X_tr∩X_η, j_η:X_η→X, j′:U→X_η and j=j_ηj′"; line 84 says 4.2 constructs the finite-level horizontal-log maps and the contract supplies only the rational period and the Besser square. |

The F01 "not actionable" reason is that `design/plan.json` is outside the package lane's files. That is true of the preferred repair, but the previous review also gave an in-package repair (revert the README's `period-rings` paragraph to the registry's sentence, delete the line-128 paragraph, repoint the three `contract local-period-fundamental-sequences` citations). The repair report declined that alternative because it "would reverse the established ownership split merely to match the registry". The split is the one the accepted design review asked for, so the README is the intended state and the registry is stale; the finding is therefore still live and only the registry edit settles it.

## Verified sound

**Principles.** Read the whole README (816 lines), `Suggested.lean` (169 lines), `metadata.toml`, `sources.toml` (24 records) and `design/plan.json`. The roadmap is a Part II of CohomologyComparisons: the Scope paragraph names what the base owns (§§1.11, 3.7, 4.2–4.5, 4.8, 6.3, 2.14; all eight headings exist in the base README at the commit the author cites) and nothing of the base, CrystallineCohomology, PadicPeriodRings, PadicHodgeTheory or PadicDifferentialEquationsAndRigidCohomology is re-planned. No good-prime or route-specific restriction: Layers 2–5 keep every prime, every weight r≥0 and ramified V; the AM Frobenius-lift hypothesis is confined to Layers 1, 6, 7 and its ramified obstruction is a Check I recomputed (π²=p: a ring endomorphism fixing p sends π to ±π, so v(F(π)−π^p)=1<e). No computational algorithm (7.1 is existence and uniqueness by formal smoothness and contraction). No source passage is copied; statements are paraphrased with locators. `Suggested.lean`: one `import Mathlib`, no `set_option`, no `lemma`, no `#eval`/`#print`/`#synth`/`opaque`/`abbrev`/`instance`, no sorry'd data, four `sorry` sites all in theorems, six proved examples, two per kept definition and all about the roadmap's own definitions. No LaTeX delimiters, process words, pull-request numbers or machine paths in any package file (grepped).

**Declared gaps.** All 31 registry slugs appear in the README with the same supplier and section; 30 `needs` sentences are verbatim identical, one differs (R01). Each `needs` sentence was read: precise hypotheses, one supplier each, none `none`; none asks for an object at the pins or on main (Mathlib supplies only the cone, the isocrystal class, abelian Ext, the `BDeRham` carriers and the ℤ_p-action; Tau Ceti only exact structures, conflation-exact functors, monoidal and opposite structures, abelian Ext and cone contractibility, all cited as contracts). Spot-checked constants against the texts: `local-period-frobenius-change` "2^(2(d+1))" is CN line 1569; `nearby-cycle-cartier`'s inverse-Cartier formula and exact sequence are TsujiNearby line 1211–1233; `period-rings`'s lattices are EN line 306 and CN line 69. Supplier sections cited for the gaps exist at the commits the author read: CohomologyComparisons `67130cb` 1.11, 2.14, 3.7, 4.2–4.5, 4.8, 6.3 (its §4.5 formula "ρ_{πu} = ρ_π ∘ exp(−e log_K(u) N_norm)" matches the README's transport N_b=−N_c/e); CrystallineCohomology `2c8b22a` CR.3.2, CR.5:log-algebra.1, CR.5.1, CR.5.4, CR.6.1, CR.6.2, CR.6.4, CR.6.5; PadicDifferentialEquationsAndRigidCohomology `c01dad4` RD.3.7, RD.3.13, RD.4.5, RD.4.19, RD.4.36, RD.5.99, RD.5.107, RD.5.115, RD.6.88; PadicHodgeTheory `13bf65f` 1.1, 1.5, 2.1, 2.4; PadicPeriodRings `e37c9fb` 3, 4.1, 4.3. None of these roadmaps is on main, so they are declared-gap contracts, not supplier facts.

**Sources, seeded sample (15 targets, each read at the cited lines).**

| Target | Text and lines | Result |
| --- | --- | --- |
| 1.1 | AM Definition 2.1, Remark 2.2, AM line 117–169 | F_V(x)≡x^p mod pV; σ F_V-linear with σ(x)≡x^p mod pB; coherent B_K/B†_K modules; c; finite descending filtration with locally free graded pieces; Griffiths transversality; horizontal Φ; morphisms as compatible pairs; fibre-product description (Remark 2.2(1)); σ-independence (Remark 2.2(2)). All as stated. AM line 138 writes "isomorphism of B†_K-algebra"; the README's module reading is the right one. |
| 1.6 | AM Lemma 2.5 and (2.10), AM line 283–297; (2.22), AM line 808–816 | Fil⁰H_dR=0 gives the unique lift and u(M)=(∇e,(1−Φ)e); the two projections δ and R_σ, with δ σ-independent and R_σ not. AM line 288 misprints Fil⁰M_rig; the README's F⁰M_dR is right. |
| 2.2 | BesserI Definition 6.1 and the cone description in the proof of Proposition 6.3, BesserI line 704–714, 741–745 | Iterated cone of RΓ_rig(X_k/K0)⊕Fil^nRΓ_dR→RΓ_rig(X_k/K0)⊕RΓ_rig(X_k/K); X smooth over V, k perfect. Agree; displays garbled (see below). |
| 2.3 | BesserI Propositions 6.2–6.3, Definition 6.5, Remark 8.7(3), BesserI line 719–760, 1073–1080 | Finite Čech descent, the long exact sequence, the cup product on cones, the K=K0 single fibre of (1−Φ/p^n)∘sp. Agree. |
| 4.1 | EN line 306; NN line 2324; CN line 67–69, 968–971 | EN: Z/p^n(r)′=(p^a a!)⁻¹Z/p^n(r), r=(p−1)a+b, 0≤b<p−1; NN: same with a the largest integer ≤r/(p−1); CN: Z_p(r)′=p^(−a(r))Z_p(r) with 0≤b(r)≤p−1 inclusive. The README's three normalizations and the endpoint ambiguity are exactly these. |
| 4.5 | EN §2.2.2, (2.6)–(2.7), Theorem 2.5, EN line 336–369 | Gluing of S_n(r), S′_n(r) with j′_*GZ/p^n(r)′ by α̃_r, α_r; triangles j_!Rj′_*→E→i_*S; τ≤rE_n(r)≃τ≤rRj_*Z/p^n(r) for 0≤r≤p−2; semistable bounded version in degrees q≤r. Agree. |
| 5.1 | HK §3.2, (3.3), (3.5), Theorem 5.1, HK line 698–739, 770, 1321–1342 | Finite generation of D_n, bijective φ under Cartier type, the non-Cartier example Spec(k[t]/t^r), Nφ=pφN, ρ_{πu}=ρ_π exp(log(u)N). Agree; the `cartierNecessary` Check recomputed (φ(t)=t^p kills t^(r−1) when p(r−1)≥r). |
| 5.2 | NN §3.2 diagram and Proposition 3.8, NN line 1341–1391 | Square (1−φ_r,ι_dR,π), N, (N,0), 1−φ_{r−1}; log-smooth over V^× and Cartier type; r≥0. The degree-zero differentials D0, D1 were re-derived from the fibre convention d(a,b)=(da,f(a)−db) and match the Lean definitions; D1∘D0=p^(−r)(pφN−Nφ) vanishes exactly under Nφ=pφN. |
| 6.1 | AM Definition 2.12, Remark 2.13, AM line 451–505 | H^i_dR as global sections of R^iu_K*Ω•, H^i_rig=Γ(S^an_K,R^iu_rig j†O), c by adjunction/restriction, frame-independent description, coherence not assumed. Agree. |
| 6.4 | AM Settings 2.14, 2.16, Propositions 2.15, 2.17, AM line 510–585 | Projective smooth, and the full compactification with (1) total NCD, (2) relative NCD over S, (3) log-smooth integral, Zariski type; coherence in every degree and bijective c. Agree; AM's "in particular an object of Fil-F-MIC" is what the README's separate `relative-hodge` contract makes explicit. |
| 6.5 | AM Lemma 2.19 and Remark 2.21(3), AM line 609–620, 637–645 | The lemma's proof embeds X in affine space; the README's affine domain is the proved statement and the elliptic-curve Check (H¹(E^an,O)=K) shows the printed "smooth V-scheme" wording is false for proper X. |
| 6.7 | AM §2.7, (2.22), AM line 795–816 | Hypothesis Fil^(n+1)H^(n+1)_dR=0, cocycle set {(ω,ξ): (1−φ_{n+1})ω=dξ, dω=0} inside Ω¹⊗Fil^nH^n⊕B†⊗H^n, δ and R_σ as projections, δ σ-independent. Agree; the README's F^(n+1)H^n=0 is what makes the cocycle set the cohomology group, and AM's F^(n+1)H^(n+1)=0 is correctly kept as the application hypothesis. |
| 7.2 | AM Lemma 3.9, AM line 1289–1301 | k algebraically closed, C smooth affine over W, M locally free of finite rank over Ĉ_K, any system of lifts P_a; proof by splitting into a free module, clearing p-powers and the Nullstellensatz. Agree; the t^p−t Check verified. |
| 7.3 | AM (2.1), Lemma 2.5, proof of Theorem 3.7, AM line 206–217, 283–297, 1352–1364 | Pullback through the isocrystal equivalence; specialization at P_a reduces to (Spec W, W^×, F_W); the Frobenius equation enters the second component. Agree; the σ(t)=t^p+p Check recomputed (α≡p mod p², also at p=2). |
| 7.4 | AM Lemma 3.10, (3.10)–(3.12), AM line 1302–1334; BesserI Remark 8.7(3), line 1073 | Y projective smooth over W, D relative NCD, M from D, U=Y−D; c induced by the log-crystalline/rigid and log-de Rham/de Rham comparisons; compatible with cup products and the two period maps. Agree; the vertical-log Check recomputed (H¹=Q_p² against Q_p). |

Also read: EN §2.1 (EN line 158–196) for 3.1–3.3 (J^⟨r⟩=J^[r] for r≤p−1 at EN line 165; Proposition 2.1 at EN line 186–192; ω, τ at EN line 193–195); EN §2.2 (EN line 278–329) for 4.2; CN Theorem 1.1 (CN line 78–84), §2.2.1 (CN line 413–423), §5.1.2 and Theorem 5.4 (CN line 2587–2606) for 4.4; NN Theorem A (NN line 85–96) and Proposition 3.18 (NN line 1688–1691) for 5.3; AM line 186–199 for the 1.3 exact structure; BesserI §5 (BesserI line 644–688) for 2.1; TsujiNearby Theorems A3–A4 (TsujiNearby line 1211–1245). No author-flagged unverified locator exists. On the 4.4 constant: CN's introduction states N(e,p,r) (CN line 83) while its Theorem 5.4(ii) states N(K,p,r) (CN line 2605); the proof descends from K(ζ_{p^i}) with i=c(K)+3, and the conductor of a totally ramified degree-e extension is bounded in terms of e and p, so the README's A(e,p,r) follows the headline theorem and is not an overclaim.

**Adversarial pass.**

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: F_V | π²=p at p=2,3; e=1; general e>1 | Only e=1 admits an endomorphism with F_V(x)≡x^p mod pV; classical layers need none. | none |
| Conventions: fibre signs, twists | [Q —2→ Q]; O(1)⊗O(−1); dlog t under σ(t)=t^p | d(a)=(0,2a); connecting image (0,b); Φ exponents add; φ(dlog t)=p dlog t gives H¹(G_m)=O(−1). | none |
| 1.1 `FilFMIC` | zero; unit; Φe=te on G_m; Spec(K) with B†=0 | ∇Φe=dt⊗e≠0; rigid realization not faithful on generic-only S. | none |
| 1.3 exact structure | split; Ext¹(O,0); identity B→A with F⁰A=K, F⁰B=0 | AM line 188–190 defines exactness on every Fil^i; pushouts have locally free graded pieces because strict sequences split locally on gr. | none |
| 1.4 `fiberCoordinatesDifferential` | (1,0), (0,1), (0,0) with d_A=0, d_B=id, f=2 | (0,2), (0,−1), (0,0); Lean examples state exactly these. | none |
| 1.5, 1.6 | Φe=e−h; H=O(1), Φe=e+ah; H=O(0) | u_1=(0,h)≠0; R=−ah; without F⁰H=0 lifts vary by ch. | none |
| 2.2, 2.3 | V=Z_p, r=0 and r>0; X_k empty; K=K0 | H⁰=Q_p,H¹=Q_p; H⁰=0,H¹=Q_p; fibre is F^rRΓ_dR; elimination of a=sp(b) gives Fib((1−φ_r)sp_r). | none |
| 3.1–3.4 | r=0; p=2, r=1; multiplication by p on Z/p²; tail tower ⊕_{j≥n}F_p | J^⟨r⟩=J^[r] up to r=p−1 (EN line 165) while exactness stops at p−2; p^r-error maps not invertible; lim=0, lim¹=∏/⊕ by the six-term sequence. | none |
| 4.1 `enLattice`, `cnLattice` | r=0; p=2, r=2; r=p−1 both endpoints | span{1}; (1/8)Z_2⊃(1/4)Z_2 with index 2, reduction mod 2 zero; endpoint lattices differ by p; (p^a)⁻¹=a!·(p^a a!)⁻¹ with a!∈Z_p. | none |
| 4.2–4.5 | trivial-log Spec(Z_p); p=2 (r=0 only), p=3 (r≤1); t dlog t; xy=π^h, h>1; q>r | U=Spec(Q_p), j′=id; ranges as EN Theorem 2.2; C⁻¹(t dlog t)=[t^(p−1)dt]≠0, [dt]=0 on G_m/F_p; CN charts and constants as Theorem 1.1; nothing asserted above r. | none |
| 5.1 HK adapter | D=K0, N=0; φ=diag(1,p), Ne1=e0; k[t]/t^m, p∤m, m>1 | Nφe1=pe0=pφNe1; e1↦e1+log(u)e0; HK (3.3) gives non-bijective φ. | none |
| 5.2 `semistableD0`, `semistableD1`, `semistable_d_squared`, adapter | φ=diag(1,2), N=(snd,0), p=2, r=0,1, e=2; D=E=0; e=0; p=0 | D0(0,1)=((0,−1),(0,1),(1,0)) at r=0 and ((0,0),(0,1),(1,0)) at r=1, D1 of both 0; D1∘D0=p^(−r)(pφN−Nφ)x; at p=0, r=1 the identity fails, so `[Fact p.Prime]` is needed and is bound; the −1/e adapter commutes with both differentials for every e and is invertible only for e≠0. | none |
| 5.3 | identity presentation; p=2; r=0 | NN Theorem A(4) is τ≤r; only τ≤0 exported at r=0. | none |
| 6.1–6.4 | id_S; empty; P¹_S; D(pt−1) over Z_p[t]; sections x=0, x=t; genus-g constant curve | H²(P¹)=O(−1) with Φ=pσ; (1−pt)⁻¹=Σp^j t^j overconvergent so c bijective while Q_p[t,(pt−1)⁻¹] is not finite; x²=0 fibre fails relative NCD; ranks 1,2g,1. | none |
| 6.5 | A¹, G_m, elliptic curve | H¹=0; K dlog t; H¹(E^an,O)=K. | R02 (labels only) |
| 6.6 | {0,∞}; t²+t+1 over Z_2; D=∅ | Res(dlog t)=(1,−1); H⁰(D)=Q_2(ζ_3) with σ the conjugation, trace-zero line has Φ=−1, twist gives −2; D=∅ excluded (and the sequence would be false). | none |
| 6.7 | n=0; G_m, n=1; split | F⁰(H^n(n+1))=F^(n+1)H^n; residue target twist n; projections vanish on split. | none |
| 7.1–7.5 | σ(t)=t^p at 0, [a]; t=p; σ(t)=t^p+p; M=0; t^p−t over F_p; vertical log at r=1; curve n=1, r=2 | Teichmüller lifts; p^p≠p; α≡p mod p²; zero module harmless; Nullstellensatz needs algebraically closed k; H¹=Q_p² versus Q_p; F²Ω•=0 on a curve gives the connecting isomorphism. | none |
| 32 contract paragraphs | r=0; p=2; ramified V; horizontal versus vertical log | Each names one supplier and precise hypotheses; none asks for what exists at the pins or on main. Registry mismatch for one slug. | R01 |

**Duplication audit (by object).** Grepped `TauCetiRoadmap/*/README.md` and `Completed/*/README.md` on main and the board packages, including the two open roadmap heads ErdosProgressionPowers and ArithmeticDynamics, for syntomic cohomology, Hyodo–Kato data, isocrystals, Fontaine–Messing periods, rigid cohomology and FilFMIC: the only matches are syntomic morphisms (StableReduction), quasisyntomic sites (PerfectoidSpaces, DiophantineApproximationAndTranscendence) and Newton polygons of isocrystals (NewtonPolygons), none of which states an object of this roadmap; the two open heads have zero matches. The pinned carriers the README cites were checked in the cached pinned sources at the cited lines: `PadicInt.algebra`, `algebraMap_apply`, `isFractionRing` (MathlibPadicLattice line 580–588); `WittVector.Isocrystal`, `IsocrystalHom`, `IsocrystalEquiv` (MathlibPin line 117–143); `LinearMap.fst`, `snd` (MathlibLinearProd line 68–91). The nine Lean declarations specialize `Submodule.span` and product linear maps; none re-implements a library object.

**Supplier-order audit.** Dependency check output, exit 0:

```text
depcheck: 3 roadmaps, 24 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All suppliers in the merge order precede the candidate (DerivedModuleAlgebra 6, AdicSpacesPartIV 11, EnhancedDerivedSheaves 14, EtaleCohomologyFoundations 15, PadicPeriodRings 16, CrystallineCohomology 18, PadicDifferentialEquationsAndRigidCohomology 94, PadicHodgeTheory 95, CohomologyComparisons 132; candidate 133) or are on main (RigidAnalyticGeometry; GrothendieckEulerForms with Layers 0 and 5 at its lines 178 and 383). Sections cited on main all exist: RigidAnalyticGeometry 6.1, 6.2, 7.3, 7.4, 8.1, 8.4; AdicSpacesPartIV F1.5, F1.7, F1.8, F1.9, F1.12, F1.16 and the four named F1.7 targets (its lines 4363–4408); EnhancedDerivedSheaves 0.1–0.4, E2:towers.1, E5:abstract; EtaleCohomologyFoundations F.0.3, F.1, F.3a, F.4.1–F.4.5 (its lines 231–1041); DerivedModuleAlgebra 0.K.1. Every `*Needs:*` line (33 read) names earlier subsections, pinned declarations, those sections or a declared contract; all internal edges point backward. ColemanIntegrationPartII (order line 129; its design §§3.0c, 3.1a, 7.0 exist) is named only as a parallel consumer; PadicHodgeRegulators and EllipticRegulators only under Downstream consumers.

**Shape and completeness.** Title, Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, six named roadmap sections, 32 contracts), How to read the build, seven layers in build order with 33 prose subsections, each with hypotheses in the sentence, a locator at the claim, named API, a proof-dependency paragraph, `*Needs:*` and at least three Checks (counted per subsection: minimum 3, maximum 6, total 113); every layer ends with Examples and Dependencies; Downstream consumers; References. All nine Lean names occur in the README (`enLattice`/`cnLattice` inside parameterized code spans); the Lean generality equals the README's (ℤ_p-spans in ℚ_p with a=floor(r/(p−1)); ℚ-vector spaces with ℚ-linear φ, N, ι); the Lean sections carry the README's layer titles. Sources manifest: 24 records with all bibliographic fields, 23 certified cache texts, one settled uncertified record (BesserII, consumer context only); no local path; no entry changed or added by this review.

## Not verifiable

- **Lean elaboration.** The brief's elaboration command is not available, so `Suggested.lean` was not compiled and no `#check @name` was run; the warning count is unknown. By hand: every `sorry`'d theorem carries its module, scalar and Frobenius hypotheses in its own signature (the file has no section `variable`s), so nothing silently disappears; the six examples were recomputed and are true (the lattice example needs `Nat.factorial_two`, `zpow` and `CharZero ℚ_[2]` under `norm_num`, which is plausible but uncertified).
- **BesserI displayed formulas.** The cached extraction loses the displays of Definition 6.1, (6.1)–(6.2) and Remark 8.7(3) (BesserI line 709–714, 728–735, 1074–1078). The fibre coordinates were checked through the prose, the cone description at BesserI line 741–745 and AM (3.11)–(3.12).
- **TsujiNearby proofs.** Theorems A3–A4 are readable at TsujiNearby line 1211–1245 but their displays are garbled; the statements, hypotheses and the lemma numbers the README cites agree.
- **Supplier texts not on main.** CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicDifferentialEquationsAndRigidCohomology and PadicHodgeTheory were read only at the commits the package author cited; section existence was confirmed there, and their contents are declared-gap contracts, not supplier facts.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "05fcc7cb61a721fe17876932c356ce97a5571133", "job": "REV-PKG-CohomologyComparisonsPartII~2", "model": "fable", "worker": "chris-g"} -->
