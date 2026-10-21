<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/110#issuecomment-6312008559 -->
Review (claude) of 538903f

Verdict: accepted
Conditional on the announced gaps: `rigid-syntomic-etale-period`, `crystalline-inputs`, `crystalline-filtered-quotient`, `hyodo-kato-proper`, `arithmetic-pair-deformation`, `period-rings`, `rigid-realizations`, `rigid-log-crystalline`, `relative-rigid-coefficients`, `relative-rigid-projective-finiteness`, `relative-rigid-log-finiteness`, `rigid-gysin`, `relative-hodge`, `nearby-cycle-inputs`, `nearby-cycle-cartier`, `nearby-cycle-graded`, `local-period-pd-radius`, `local-period-annulus-entry`, `local-period-frobenius-change`, `local-period-lie`, `local-period-lazard`, `local-period-annulus-change`, `local-period-phi-psi`, `local-period-disk-change`, `local-period-galois`, `local-period-approximation`, `local-period-kpi1`, `local-period-etale-gaga`, `local-period-descent`, `exact-yoneda`, `rational-descent`, `local-period-fundamental-sequences`

1. **F01** (P3) Two `*Needs:*` lines cite the new contract in a form unlike every other contract citation

   **Location.** `packages/CohomologyComparisonsPartII/README.md` line 445: "contract `period-rings`; `gap:local-period-fundamental-sequences`; contract `nearby-cycle-inputs`"; line 479: "§4.2; §4.1; `gap:local-period-fundamental-sequences`; contract `local-period-pd-radius`".

   **Claim.** The README cites its other 31 contracts in `*Needs:*` lines as "contract `slug`" (62 occurrences); the Layer 4 Dependencies paragraph (line 509) also lists this one among "contracts". Only these two citations use the registry's `gap:` prefix, so a reader scanning Needs lines for contracts misses it, and the file now carries two forms for one notion.

   **Witness.** `grep -c 'contract \`' README.md` versus `grep -n 'gap:local-period' README.md` (lines 128, 445, 479 only); sibling line 400: "contract `crystalline-inputs`; contract `rational-descent`".

   **Exact repair.** On lines 445 and 479 replace "`gap:local-period-fundamental-sequences`" by "contract `local-period-fundamental-sequences`". No other change; the registry entry and line 128 stay as they are.

One P3 finding and no blocking finding. The acceptance is conditional on the 32 declared supplier gaps listed in `review.json`.

## Repair check of the round-2 review (F01–F03)

| Id | Status | Repaired passage |
| --- | --- | --- |
| F01 (P2) | **repaired** | `packages/CohomologyComparisonsPartII/design/plan.json` now lists 32 gaps; the new entry has `slug` `local-period-fundamental-sequences`, `supplier` `PadicHodgeTheory`, `neededBy` `["4.2", "4.4"]`, section "accepted sections unavailable; CN Lemma 2.23, pp. 23–24, CN line 973–980; Lemma 2.37, pp. 28–29, CN line 1234–1239", and its `needs` is verbatim the README line 128 sentence from "On the completed étale semistable charts" to "partial powers of level s". The registry's `period-rings` `needs` now ends "(EN §2.2, p. 7, EN line 299–308)" and is verbatim README line 102. All 32 `needs` strings occur verbatim in the README (checked mechanically). |
| F02 (P3) | **repaired** | README lines 660–662: "`RelativeCohomology.continuousDifferentialComparison_affineLine`", "`…_gM`", "`…_properCounterexample`"; `affineOverconvergentAcyclicity` no longer occurs in the file. |
| F03 (P3) | **repaired** | README lines 182–186: "`FilFMIC.ofData_zero`", "`FilFMIC.ofData_unit`", "`FilFMIC.ofData_nonhorizontal`", "`FilFMIC.ofData_ramifiedBaseObstruction`", "`FilFMIC.ofData_genericOnlyRealization`"; line 242: "`FilFMIC.fiberCoordinatesDifferential_zeroInput`"; the API name `FilFMIC.fiberCoordinatesDifferential_zero` remains only on line 226. |

The round-3 repair diff touched only these passages, the two `*Needs:*` lines of 4.2 and 4.4, and the registry; `Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.

## Verified sound

**Principles.** Read the whole README (816 lines), `Suggested.lean` (169 lines), `metadata.toml`, `sources.toml` (24 records) and `design/plan.json`. The roadmap is a Part II of CohomologyComparisons: the Scope paragraph names what the base owns (§§1.11, 2.14, 3.7, 4.2–4.5, 4.8, 6.3; all exist in the base README at commit 67130cb) and re-plans nothing of the base, CrystallineCohomology, PadicPeriodRings, PadicHodgeTheory or PadicDifferentialEquationsAndRigidCohomology. No route-specific restriction: Layers 2–5 keep every prime, every weight r≥0 and ramified V; the AM Frobenius-lift hypothesis is confined to Layers 1, 6, 7 with its ramified obstruction recomputed (p=uπ^e, a ring endomorphism has v(F(π))=1 while v(π^p)=p, so the congruence modulo π^e fails for e>1). No algorithm (7.1 is existence and uniqueness by formal smoothness and contraction). No source passage is copied. `Suggested.lean`: one `import Mathlib`, no `set_option`, no `lemma`, no `#eval`/`#print`/`#synth`, no `abbrev`/`instance`/`opaque`, no sorry'd data, four `sorry` sites all in theorems, six proved examples, two per kept definition, all about the roadmap's own definitions. No LaTeX delimiters, process words, pull-request numbers or machine paths in any package file (grepped).

**Declared gaps.** All 32 registry slugs appear in the README with the same supplier and section and verbatim `needs`; none has supplier `none`; each `needs` names one supplier and precise hypotheses. Read against the texts: `local-period-fundamental-sequences` matches CN Lemma 2.23(i)–(iii) (CN line 973–980: v>0 Artin–Schreier, p^r-exact crystalline, p^(4r)-exact annular with 0<u≤1≤v, continuous sections) and Lemma 2.37; `period-rings` lattices match EN line 306 and NN line 2324; `nearby-cycle-cartier` matches TsujiNearby Theorems A3–A4 (TsujiNearby line 1211–1233, last map 1−C⁻¹); `rigid-syntomic-etale-period` matches BesserI Corollary 9.10 (BesserI line 1214–1216, smooth quasi-projective X; the product compatibility is stated as an extension requirement, as the README's contract preamble says) and AM Lemma 3.10 (AM line 1327–1334); `hyodo-kato-proper` matches HK line 714–715, 770, 1340; `arithmetic-pair-deformation` matches NN line 1378–1391; `rational-descent` matches NN line 1688–1691 and 85–98 (NN's varieties are reduced separated finite type, NN line 521). None asks for an object at the pins or on main. Supplier sections cited exist: on main, RigidAnalyticGeometry 6.1, 6.2, 7.3, 7.4, 8.1, 8.4; GrothendieckEulerForms Layers 0 and 5; AdicSpacesPartIV F1.5, F1.7, F1.8, F1.9, F1.12, F1.16 and its four named F1.7 targets; EnhancedDerivedSheaves 0.1–0.4, E2:towers.1, E5:abstract.1–5; EtaleCohomologyFoundations F.0.3, F.1, F.3a, F.4.1–F.4.5; DerivedModuleAlgebra 0.K.1; ColemanIntegrationPartII design 3.0c, 3.1a, 7.0 (named only as a parallel consumer). At the board-era commits in the content history: CohomologyComparisons 67130cb (1.11, 2.14, 3.7, 4.2–4.5, 4.8, 6.3; its §4.5 formula ρ_{πu}=ρ_π∘exp(−e log(u) N_norm) agrees with the README's transport N_b=−N_c/e); CrystallineCohomology 2c8b22a (CR.3.2, CR.5:log-algebra.1–5, CR.5.1–5.4, CR.6.1–6.5); PadicHodgeTheory 13bf65f (1.1–1.5, 2.1–2.4); PadicPeriodRings e37c9fb (4.1–4.3 under Layer 4; §3); PadicDifferentialEquationsAndRigidCohomology c01dad4 (all 38 RD sections cited, each found once). None of these five is on main, so their contents are declared-gap contracts, not supplier facts.

**Sources, seeded sample (15 targets, each read at the cited lines).**

| Target | Text and lines | Result |
| --- | --- | --- |
| 1.2 | AM Remark 2.2, Definition 2.3, (2.1); AM line 164–176, 181–185, 206–217 | O(n)=(B_K,B†_K,c,p^(−n)σ,d,Fil) with Fil^(−n)=B_K, Fil^(−n+1)=0; σ-independence through F-Isoc†; pullback through the isocrystal equivalence without gσ′=σg. Agree. |
| 1.6 | AM Lemma 2.5, (2.10), (2.22); AM line 283–297, 808–816 | Fil⁰H_dR=0 gives the unique lift and u(M)=(∇e,(1−Φ)e); δ σ-independent, R_σ not. AM line 288 misprints Fil⁰M_rig; the README's F⁰M_dR is right. |
| 2.3 | BesserI Propositions 6.2–6.3, Definition 6.5, Remark 8.7(3); BesserI line 719–745, 752–759, 1073–1080 | Finite Čech descent, the long exact sequence from the iterated cone, cup product on cones, the K=K0 single fibre of (1−Φ/p^n) on Fil^n. Agree (displays garbled, see below). |
| 3.2 | EN §2.1 (2.1); EN line 158–182, 196–197 | S_n(r)=Cone(1−φ_r)[−1] with kernel identification on the syntomic site (EN line 171–174), S′_n(r)=Cone(p^r−φ)[−1], both long exact sequences, Rε_* abuse. Agree. |
| 3.3 | EN line 193–195, 219–244 | ω from (p^r,id), τ from (id,p^r), τω=ωτ=p^r, kernels and cokernels killed by p^r, products on both families compatible with crystalline products and with ω, τ not multiplicative. Agree. |
| 4.1 | EN line 306; NN line 2324; CN line 67–69, 968–971 | EN/NN: (p^a a!)⁻¹ with 0≤b<p−1; CN: p^(−a(r)) with 0≤b(r)≤p−1 inclusive. The README's three normalizations and the endpoint ambiguity are exactly these. |
| 4.5 | EN §2.2.2 (2.6)–(2.7), Theorem 2.5; EN line 336–369 | Gluing by α̃_r, α_r; triangles j_!Rj′_*→E→i_*S; τ≤rE_n(r)≃τ≤rRj_*Z/p^n(r) for 0≤r≤p−2; semistable bounded version in degrees q≤r. Agree. |
| 5.1 | HK §3.2, (3.3), (3.5), Theorem 5.1; HK line 698–739, 770, 1321–1342 | Finite generation, bijective φ under Cartier type, the non-Cartier example Spec(k[t]/t^r) with φ(t)=t^p, Nφ=pφN, ρ_{πu}=ρ_π exp(log(u)N). Agree; the `cartierNecessary` Check recomputed (t^p=0 for p≥m, t∉im φ for p<m). |
| 5.3 | NN Theorem A(1),(4), Proposition 3.18, Proposition 4.6, Corollary 4.11; NN line 78–98, 1688–1691, 2400–2404, 2778–2781 | Unique h-descent extension, product-compatible periods, τ≤r equivalences arithmetic and geometric, classical-pair map for fine log-smooth Cartier-type pairs. Agree. |
| 6.1 | AM Definition 2.12, Remark 2.13; AM line 451–505 | H^i_dR as global sections of R^iu_K*Ω•, H^i_rig=Γ(S^an_K,R^iu_rig j†O), c by adjunction and restriction, frame-independent description, coherence not assumed. Agree. |
| 6.3 | AM Setting 2.16; AM line 530–558 | Sbar, Xbar smooth projective, T relative SNCD, D_h relative NCD, D_v=fbar⁻¹(T), conditions (1)–(3). Agree. |
| 6.5 | AM Lemma 2.19, Remark 2.21(3); AM line 609–620, 637–645 | The lemma's proof embeds X in affine space; the README's affine domain is the proved statement and the elliptic-curve Check (H¹(E^an,O)=K by proper GAGA) shows the printed "smooth V-scheme" wording is false for proper X. |
| 6.6 | AM Proposition 2.18, Lemma 4.2; AM line 587–607, 1483 | Affine curve with connected fibres, projective smooth X/S, D finite étale, the four-term sequence in Fil-F-MIC, Frobenius checked at closed points. Agree. |
| 6.7 | AM §2.7, (2.22); AM line 795–816 | Hypothesis Fil^(n+1)H^(n+1)_dR=0, cocycle set {(ω,ξ): (1−φ_(n+1))ω=dξ, dω=0}, projections δ and R_σ, δ σ-independent. Agree; F^(n+1)H^n_dR=0 is what makes the cocycle set the cohomology group and holds for the geometric Hodge filtration. |
| 7.2 | AM Lemma 3.9; AM line 1289–1301 | k algebraically closed, C smooth affine over W, M locally free of finite rank over Ĉ_K, any system of lifts; proof by splitting, clearing p-powers and the Nullstellensatz. Agree; the t^p−t Check verified. |

Also read: AM Definition 2.4 and (2.6) (AM line 249–258) for the fibre coordinates d(ω,ξ)=(dω,(1−Φ)ω−dξ), which is the Lean `fiberCoordinatesDifferential`; AM Lemma 3.8 (AM line 1229–1240) for 7.1; AM Lemma 3.10 and the proof of Theorem 3.7 (AM line 1302–1334, 1352–1400) for 7.4–7.5; EN Proposition 2.1 and Theorem 2.2 (EN line 186–192, 318–323) for 4.3; CN Theorem 1.1, §2.2.1 and Theorem 5.4 (CN line 70–84, 413–423, 2600–2606) for 4.4, where the garbled "enough roots" inequality is consistent with δ_K+[K:F_i]<e/(2p) since [K:F_i]/e=1/[F_i:F]; NN §3.2 diagram and Proposition 3.8 (NN line 1341–1391) for 5.2; StacksRlim Lemmas 88.1–88.2 (StacksRlim line 10638–10675) for the tower Check. No author-flagged unverified locator exists.

**Adversarial pass.**

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: F_V | π²=p at p=2,3; e=1; general e>1 | v(F(π))=1 from F(p)=p; the congruence modulo π^e fails for e>1 only. | none |
| Conventions: fibre, twists, monodromy transport | [Q —2→ Q]; O(1)⊗O(−1); dlog t; N_b=−N_c/e | d(a)=(0,2a); exponents add; φ(dlog t)=p dlog t; exp(−e log(u)N_b)=exp(log(u)N_c). | none |
| 1.1 `FilFMIC.ofData` | zero; unit; Φe=te on G_m; Spec(K) with B†=0 | ∇Φe=dt⊗e≠0; B†=0 since K/p^nK=0; rigid realization not faithful there. | none |
| 1.3 exact structure | split; Ext¹(O,0); identity B→A with F⁰A=K, F⁰B=0 | AM line 188–190 defines exactness on every Fil^i; B→A preserves F^j but is not strict. | none |
| 1.4 `fiberCoordinatesDifferential` | (1,0), (0,1), (0,0) with d_A=0, d_B=id, f=2 | (0,2), (0,−1), (0,0); matches AM (2.6) and the Lean examples. | none |
| 1.5, 1.6 | Φe=e−h; H=O(1), Φe=e+ah; H=O(0) | u_1=(0,h)≠0; R=−ah; lifts vary by ch without F⁰H=0. | none |
| 2.2, 2.3 | V=Z_p, r=0 and r>0; X_k empty; K=K0 | (H⁰,H¹)=(Q_p,Q_p) and (0,Q_p); fibre is F^rRΓ_dR; elimination of a=sp(b). | none |
| 3.1–3.4 | r=0; p=2, r=1; multiplication by p on Z/p²; tail tower ⊕_(j≥n)F_p | J^⟨r⟩=J^[r] up to r=p−1 (EN line 165); p^r-errors not invertible; lim=0, lim¹=∏/⊕ by the six-term sequence. | none |
| 4.1 `enLattice`, `cnLattice` | r=0; p=2, r=2; r=p−1 both endpoints | span{1}; (1/8)⊃(1/4) with coordinate 2, zero modulo 2; endpoint lattices differ by p; (p^a)⁻¹=a!·(p^a a!)⁻¹. | none |
| 4.2–4.5 | trivial-log Spec(Z_p); p=2 (r=0), p=3 (r≤1); t dlog t; xy=π^h; q>r | U=Spec(Q_p), j′=id; ranges as EN Theorem 2.2; C⁻¹(t dlog t)=[t^(p−1)dt]≠0, [dt]=0; CN chart and constants as Theorem 1.1. | none |
| 5.1 HK adapter | D=K0, N=0; φ=diag(1,p), Ne1=e0; k[t]/t^m | Nφe1=pe0=pφNe1; e1↦e1+log(u)e0; non-Cartier φ not bijective. | none |
| 5.2 `semistableD0`, `semistableD1`, `semistable_d_squared`, adapter | φ=diag(1,2), N=(snd,0), p=2, r=0,1, e=2; e=0; p=0, r=1 | D0(e1)=(−e1,e1,e0) at r=0, (0,e1,e0) at r=1, D1 of both 0; D1∘D0=p^(−r)(pφN−Nφ); transported D0(e1) third term −e0/2; at p=0, r=1 the identity fails so `[Fact p.Prime]` is needed and is bound. | none |
| 5.3 | identity presentation; p=2; r=0 | τ≤r only; nothing above r exported. | none |
| 6.1–6.4 | id_S; empty; P¹_S; D(pt−1) over Z_p[t]; sections x=0, x=t; genus g | H²(P¹)=O(−1) with Φ=pσ; (1−pt)⁻¹ overconvergent so c bijective while Q_p[t,(pt−1)⁻¹] is not finite; x²=0 fibre fails relative NCD; ranks 1,2g,1. | none |
| 6.5 | A¹, G_m, elliptic curve | H¹=0 (a_n/(n+1) keeps overconvergence); K dlog t; H¹(E^an,O)=K. | none |
| 6.6 | {0,∞}; t²+t+1 over Z_2; D=∅ | Res(dlog t)=(1,−1); trace-zero line has Φ=−1, twist gives −2; D=∅ excluded. | none |
| 6.7 | n=0; G_m, n=1; split | F⁰(H^n(n+1))=F^(n+1)H^n; residue target twist n; projections vanish on split. | none |
| 7.1–7.5 | σ(t)=t^p at 0, [a]; t=p; σ(t)=t^p+p; M=0; t^p−t over F_p; vertical log at r=1; curve n=1, r=2 | Teichmüller lifts; p^p≠p; α≡p mod p² also at p=2; Nullstellensatz needs k algebraically closed; H¹=Q_p² versus Q_p; F²Ω•=0 on a curve. | none |
| 32 contract paragraphs | r=0; p=2; ramified V; horizontal versus vertical log | One supplier each, precise hypotheses, nothing at the pins or on main. | none |

**Duplication audit (by object).** Grepped `TauCetiRoadmap/*/README.md` on main and every board package, including the open heads ArithmeticDynamics, ErdosProgressionPowers and QWittVectors (which has only a target and design folder), for syntomic cohomology, Hyodo–Kato, FilFMIC, Fontaine–Messing, isocrystals and nearby cycles. Matches: syntomic morphisms (StableReduction), quasisyntomic sites (PerfectoidSpaces, DiophantineApproximationAndTranscendence), Newton polygons of isocrystals (NewtonPolygons, which defers isocrystal theory), one mention of nearby cycles as owned elsewhere (AdicEtaleGeometry). None states an object of this roadmap; the open heads have no match. Pinned carriers checked in the cached pinned sources at the pins `6b7abb3c` (Mathlib) and `a91d3aaf` (Tau Ceti), which are the `lake-manifest.json` revisions: `PadicInt.algebra`, `algebraMap_apply`, `isFractionRing` (MathlibPadicLattice line 580–588); `LinearMap.fst`, `snd`, `prod` (MathlibLinearProd line 68–99); `CochainComplex.mappingCone`, `inl`, `inr`, `fst`, `snd` (MathlibCone line 61–92); `WittVector.Isocrystal`, `IsocrystalHom`, `IsocrystalEquiv` (MathlibPin line 117–143); `TauCeti.ExactStructure` binders (TauCetiExactReview line 245–267); the abelian and `HasExt` binders of the Tau Ceti Ext API (TauCetiExtReview line 54). The nine Lean declarations specialize `Submodule.span` and product linear maps; none re-implements a library object.

**Supplier-order audit.** Dependency check output, exit 0:

```text
depcheck: 4 roadmaps, 30 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier in a `*Needs:*` line, supplier table or Dependencies paragraph is on main or earlier in the merge order (CohomologyComparisons at line 132, the candidate at 133; ColemanIntegrationPartII at 129 is named only as a parallel consumer). All 33 `*Needs:*` lines were read: each names earlier subsections, pinned declarations, existing sections or a declared contract, and all internal edges point backward.

**Shape and completeness.** Title, Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, six main-branch roadmap sections, 32 contracts), How to read the build, seven layers with 33 prose subsections, each with hypotheses in the sentence, a locator at the claim, named API, a proof-dependency paragraph, `*Needs:*` and at least three Checks (113 labels, all unique and namespace-qualified); every layer ends with Examples and Dependencies; Downstream consumers; References. All nine Lean names occur in the README; the Lean generality equals the README's (ℤ_p-spans in ℚ_p with a=floor(r/(p−1)); ℚ-vector spaces with ℚ-linear φ, N, ι; `[Fact p.Prime]` on the square-zero theorem). Sources manifest: 24 records with full bibliographic fields, 23 certified cached texts, one settled `uncertified` record (BesserII, consumer context only); no local path; nothing added or changed by this review.

## Not verifiable

- **Lean elaboration.** The brief's elaboration command is not available, so `Suggested.lean` was not compiled and no `#check @name` was run; the warning count is unknown. By hand: the four `sorry`'d theorems carry every hypothesis in their own signatures (the file has no section `variable`s), and the six examples were recomputed and are true; their `norm_num`/`simp` proofs rely on `Nat.factorial_two`, `zpow` normalisation and `CharZero ℚ_[2]`, which is plausible but uncertified.
- **BesserI displayed formulas.** The cached extraction loses the displays of Definition 6.1, (6.1)–(6.2) and Remark 8.7(3) (BesserI line 709–714, 728–735, 1074–1078). The fibre coordinates were checked through the prose, the cone description at BesserI line 741–745 and AM (3.11)–(3.12).
- **TsujiNearby displays.** Theorems A3–A4 (TsujiNearby line 1211–1245) are readable in structure but their formulas are OCR-garbled; the hypotheses, the Cartier formula and the 1−C⁻¹ map were confirmed from the surrounding prose.
- **Supplier texts not on main.** CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicDifferentialEquationsAndRigidCohomology and PadicHodgeTheory were read only at the commits in the content history named above; section existence was confirmed there, and their contents remain declared-gap contracts.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "538903f6e09e879f57ca6377395285ef6b17a79f", "job": "REV-PKG-CohomologyComparisonsPartII~3", "model": "fable", "worker": "chris-f"} -->
