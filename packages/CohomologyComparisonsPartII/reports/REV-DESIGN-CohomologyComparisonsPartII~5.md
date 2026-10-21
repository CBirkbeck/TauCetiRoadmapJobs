<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/47#issuecomment-6307738091 -->
Review (claude) of 46f8e4b

Verdict: accepted
Conditional on the announced gaps: `rigid-syntomic-etale-period`, `crystalline-inputs`, `crystalline-filtered-quotient`, `hyodo-kato-proper`, `arithmetic-pair-deformation`, `period-rings`, `rigid-realizations`, `rigid-log-crystalline`, `relative-rigid-coefficients`, `relative-rigid-projective-finiteness`, `relative-rigid-log-finiteness`, `rigid-gysin`, `relative-hodge`, `nearby-cycle-inputs`, `nearby-cycle-cartier`, `nearby-cycle-graded`, `local-period-pd-radius`, `local-period-annulus-entry`, `local-period-frobenius-change`, `local-period-lie`, `local-period-lazard`, `local-period-annulus-change`, `local-period-phi-psi`, `local-period-disk-change`, `local-period-galois`, `local-period-approximation`, `local-period-kpi1`, `local-period-etale-gaga`, `local-period-descent`, `exact-yoneda`, `rational-descent`

1. **F01** (P3) `period-rings` bundles chart-level contracts with the ring-level contract

   **Location:** `packages/CohomologyComparisonsPartII/design/README.md` line 78 (and the matching `gaps` entry in `plan.json`): "on the completed CN §2.2.2 semistable charts supply the Artin–Schreier exact sequences of CN Lemma 2.23(i) … supply the p^s quasi-isomorphism F^rΛ→F^rΩ•_(S_Λ^s/Λ) of Lemma 2.37".

   **Claim:** One gap, homed at PadicPeriodRings, asks for the absolute period rings and Fontaine–Messing sequences and also for chart-level statements on `A_R`, `A^[u,v]_R` and the PD envelopes `S_Λ^s`.

   **Witness:** CN line 973–980 states Lemma 2.23 for the relative rings `A_R`, `A^(0,v]+_R`, `A^[u,v]_R` of a chart `R`; CN line 1234–1239 states Lemma 2.37 for de Rham complexes of `S_Λ^s`. The thirteen other chart-level CN contracts (README lines 100–124) are homed at PadicHodgeTheory.

   **Exact repair:** Split the gap: keep `period-rings` (PadicPeriodRings) for `A_cris`, `B_cris`, `B_st`, embeddings, filtrations, `t`, Frobenius, monodromy and the two Fontaine–Messing coefficient sequences (EN line 299–308); move Lemma 2.23(ii)–(iii) and Lemma 2.37 into a new `local-period-fundamental-sequences` gap homed with the other CN chart contracts, with the same hypotheses sentence (completed §2.2.2 charts, `v>0`, `0<u≤1≤v`, level `s≥0`). Update the `*Needs:*` lines of 4.2 and 4.4 and the Layer 4 Dependencies list. The statements themselves are precise and need no change; this is a routing note so that each supplier receives only its own contract.

Files reviewed: `packages/CohomologyComparisonsPartII/design/README.md`, `packages/CohomologyComparisonsPartII/design/plan.json`, `packages/CohomologyComparisonsPartII/sources.toml`. The acceptance is conditional on the 31 declared supplier gaps listed in `design/review.json`.

## Previous findings

The round-4 review (`packages/CohomologyComparisonsPartII/reports/REV-DESIGN-CohomologyComparisonsPartII~4.md`) raised one finding, F01 (P2): the `nearby-cycle-inputs` contract used the full trivial-log locus `X_tr` as a generic-fibre open on its whole log-syntomic-over-`W(k)` domain. The repair report `FIX-DESIGN-CohomologyComparisonsPartII~5.md` marks it applied; nothing was marked not actionable.

| Finding | Repaired passage | Result |
| --- | --- | --- |
| F01 | README line 94: "For log-syntomic X/W(k), put X_η=X[1/p] and U=X_tr∩X_η, with open immersions j_η:X_η→X, j′:U→X_η and j=j_ηj′." The needs sentence now carries `U`, `j_η!` and `j_η!Rj′_*Λ`; plan.json lines 2310–2311 are identical. The new negative control `Syntomic.fontaineMessingPeriod_trivialLogPoint` (README line 409) records `X_tr=Spec(Z_p)` against `U=Spec(Q_p)` and the canonical-vertical-log case `X_tr=U`. | **Repaired.** EN line 292–293 defines `j` on `X_tr,K`, the generic restriction; EN line 313–317 and 336–357 are the two projection comparisons as cited. The clause "on the canonical-vertical-log inputs of Layer 4, U=X_tr" is correct: the pulled-back log structure is nontrivial at every closed-fibre point, so `X_tr⊂X_K`. Sections 4.2, 4.3 and 4.5 still consume the same maps. |

## Verified sound

### Principles

Read the whole README (762 lines) and plan.json (7 layers, 33 targets, 121 API entries, 107 Checks, 31 gaps). The roadmap continues CohomologyComparisons as a Part II: the scope paragraph says what the base owns and what is imported; its rational h-descent, relative Hodge and period inputs are gaps, not reconstructions. No good-prime or route-specific restriction appears in the producers (all weights `r≥0` and all primes are kept in Layers 2–5; the AM `F_V` hypothesis is confined to the relative Layers 1, 6, 7 with its ramified obstruction recorded as a Check). No computational algorithm: 7.1 is stated as an existence-and-uniqueness theorem. No passage of any source is copied; every statement is paraphrased with a locator. No `Suggested.lean` exists at the design stage, so no sorry'd data, `set_option` or `lemma` keyword can occur; the README contains no LaTeX delimiters, no process words, no pull-request numbers and no machine paths. Every layer ends with Examples and Dependencies; every target has a locator, named API and at least three Checks; every Check name and statement in plan.json occurs verbatim in the README; all 53 internal prerequisites point backward.

### Seeded source sample

All 15 requested targets were read against the cached texts at the cited lines. No author-flagged unverified locator exists.

| Target | Text | Result |
| --- | --- | --- |
| 1.1 | AM Definition 2.1, Remark 2.2, AM line 117–169 | Objects, `F_V` mod `pV`, `σ` mod `pB`, horizontality `Φ∇=∇Φ`, morphisms as compatible pairs all agree. The source's "isomorphism of B†_K-algebra" (AM line 138) is a misprint for module isomorphism, as the README's References note says. Fibre-product description is Remark 2.2(1). |
| 1.3 | AM line 186–205; Buhler Definition 2.1, Buhler line 195 | Exactness on every `Fil^i` of the de Rham part, Yoneda `Ext` by zigzags, uniquely divisible. Kernel-cokernel pairs of Bühler as cited. |
| 1.4 | AM Definition 2.4, (2.2), (2.6), AM line 224–259 | `S(M)^i=Ω^i⊗Fil^{-i}M_dR⊕Ω^{i-1}_{B†}⊗M_rig`, `d(ω,ξ)=(dω,(1−Φ)ω−dξ)` as in the README's fibre coordinates; exactness on exact sequences at AM line 260–264. |
| 1.5 | AM (2.3)–(2.7), AM line 229–268 | `u` sends an extension to `δ(1)`; compatibility with the de Rham projection (2.5) at AM line 267–268. The README's use of the class `1` without `H⁰=Q_p` is a correct strengthening. |
| 4.1 | EN line 306; NN line 2324; CN line 67–69 | `(p^a a!)^{-1}` with `0≤b<p−1` (EN, NN) versus `p^{-a(r)}` with `0≤b(r)≤p−1` (CN): the inclusive endpoint ambiguity the README records at `r=p−1` is in the printed source. |
| 4.3 | EN Proposition 2.1 (line 186–192), Theorem 2.2 (line 318–323); TsujiNearby Theorem 5.1 (line 944–945), proof pp. 558–561 (line 1074–1143) | fs log-smooth over `O_K^×`, `0≤r≤p−2`, `S_n(r)≃τ≤r i*Rj_*Z/p^n(r)`, vanishing above `r`. The toric and stalk-induction reductions the README lists as proof obligations are Tsuji's. |
| 4.4 | CN Theorem 1.1 (line 78–84), §2.2.1 (line 413–427), §5.1.2 (line 2587–2606) | Charts with `1≤h≤e`, `0≤i≤r`, `p^{Nr+c_p}` with `c_p` depending on `d` at `p=2` under enough roots, `p^{N(e,p,r)}` in general; the "enough roots" inequality is CN line 423. |
| 5.2 | NN §3.2 diagram (line 1341–1384), Proposition 3.8 (line 1387–1391) | Square with `(1−φ_r,ι_{dR,π})`, `N`, `(N,0)`, `1−φ_{r−1}`; log-smooth over `V^×` and Cartier type; the `N`-triangle at NN line 1378–1381 is the declared `arithmetic-pair-deformation` input. |
| 5.3 | NN Proposition 3.18 (line 1688–1691); Theorem A(1),(4) (line 85–100); Proposition 4.6 (line 2400–2404); Corollary 4.11 (line 2778–2781) | Fine, log-smooth, Cartier type for the classical-to-h map; `τ≤r` arithmetic and geometric period comparisons, product-compatible. |
| 6.1 | AM Definition 2.12, Remark 2.13, AM line 451–501 | The datum and the adjunction/restriction construction of `c` agree; Remark 2.13(2) restricts use to the coherent case, as the README's 6.2 does. |
| 6.4 | AM Settings 2.14, 2.16, Propositions 2.15, 2.17, AM line 510–585 | Projective smooth; all three conditions of Setting 2.16 (total relative NCD, relative NCD over `S`, log smooth integral with Zariski-type base) retained in 6.3. |
| 6.5 | AM Lemma 2.19 (line 609–620), Remark 2.21(3) (line 637–645) | The proof embeds in affine space, so the README's affine restriction is the proved statement; the elliptic-curve Check shows the printed wording would be false. |
| 6.6 | AM Proposition 2.18 (line 587–607), Lemma 4.2 (line 1483–1490) | Relative dimension one, connected fibres, projective smooth `X`, `D` finite étale, sequence `0→H¹(X)→H¹(U)→H⁰(D)(−1)→H²(X)→0`; Frobenius compatibility reduced to closed points (the declared `rigid-gysin` input). |
| 7.1 | AM Lemma 3.8 (line 1229–1288) | Unique `W`-point with `σ_n∘a_n=a_n∘F_W` at every level, by contraction on fibres of the reduction map; the README's proof chain follows it. |
| 7.5 | AM proof of Theorem 3.7 (line 1352–1401), Lemma 3.10 (line 1302–1334); BesserI Proposition 6.3 (line 727–737) | The isomorphism `i` from the long exact sequence under the two filtered vanishings, the connecting representative `(0,b)`, and the `(−1)^n` left to the consumer. |

Additional locators read: EN §2.1 (line 158–218) for 3.1–3.4; EN Theorem 2.5 (line 360–369) for 4.5; HK line 698–739 and Theorem 5.1 (line 1321–1342) for 5.1; NN (32)–(33) (line 1299–1330) for 3.4; AM (2.22) (line 795–816) for 6.7; AM Lemmas 3.9–3.10 (line 1289–1334) for 7.2 and 7.4; BesserI §5 (line 644–688) for 2.1 and Corollary 9.10 (line 1214–1216); TsujiNearby Theorems A3–A4 (line 1211–1245) and Lemmas 4.3–4.4 (line 805–883); StacksRlim line 10638–10675; the CN locators of all thirteen local-period gaps (CN line 1234–1239, 1453–1456, 1545–1548, 1569–1588, 1998–2001, 2055–2057, 2148–2150, 2176–2187, 2249–2255, 2267–2277, 2659–2674, 2704–2725, 2728–2762). All agree with the contracts as written.

### Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: `F_V` | `π²=p`; general `e>1`; `e=1` | `F_V` preserves valuation, so `v(F_V(π)−π^p)=1<e` when `e>1`: the AM relative setting forces `V=W(k)`; the README records this as the ramified negative control and keeps the classical layers free of `F_V`. Not vacuous: `W(k)` satisfies it. | None |
| Conventions: fibre sign, twists | `[Q —2→ Q]`; `O(1)⊗O(−1)`; `H¹(G_m)` | `d(a)=(0,2a)`, connecting image `(0,b)`; `Φ=p^{-a-b}σ`; `φ(dlog t)=p dlog t` gives `O(−1)`. | None |
| 1.1 | zero; unit; `Φe=te` on `G_m`; `S=Spec(K)` | `∇Φe=dt⊗e≠0`; `B†=0` for `V[T]/(πT−1)` since `(πT−1)^{-1}` is overconvergent, so the rigid realization is not faithful. | None |
| 1.2 | identity pullback; zero factor; `O(a)⊗O(b)` | Exponents and jumps add; `p` invertible in characteristic zero. | None |
| 1.3 | split extension; `Ext¹(O,0)`; `F⁰A=K` versus `F⁰B=0,F⁻¹B=K` | The identity `B→A` is a morphism, not an isomorphism; conflations need every `F^j`. Underlying `H_dR` is projective, so the sequence splits and the rigid sequence is exact without a flatness theorem. | None |
| 1.4 | point `O(0)`, `O(1)`, `0`; multiplication 2 | `[Q_p —0→ Q_p]`; `Q_p` in degree 1 only (`F⁰O(1)=0`); acyclic. | None |
| 1.5 | `i=0`; split; `Φe=e−h` over `Z_p`; disconnected `S` | `u_1=(0,h)` in `coker(1−Φ)=Q_p`, nonzero; `1` is used without `H⁰=Q_p`. | None |
| 1.6 | `H⊕O`; `Φe=e+ah` with `H=O(1)`; `H=O(0)` | `R=−ah`; without `F⁰H=0` the lift varies by `ch`; `R_σ′−R_σ=(Φ_σ−Φ_σ′)e`. | None |
| 2.1 | `Spec(V)`; empty; `Spec(K)` | `sp=id_K`, `0`, `K→0`; no equivalence claimed. | None |
| 2.2 | `V=Z_p`, `r=0`, `r>0`; empty special fibre | `r=0`: `H⁰=Q_p` diagonal, `H¹=Q_p`; `r>0`: `F^r=0`, `H⁰=0`, `H¹=Q_p`; generic-only gives `F^rRΓ_dR` (BesserI Remark 6.4). | None |
| 2.3 | `K=K0` elimination; `G_m`, `r=1`; empty | Gaussian elimination of the identity row of `[[1−φ_r,0],[1,−sp_r]]` gives the single fibre of AM (3.12); `(1−φ/p)dlog t=0`. | None |
| 3.1 | `r=0`; `p=2,r=1`; `py=0` mod `p` | `J^⟨0⟩=O_cr`; equality range `r≤p−1` (EN line 165, 203); division is defined at level `n+s`. | None |
| 3.2 | zero map `A[0]→B[0]`; `r=0`; empty | Fibre keeps `H¹=B`; kernel replacement only on the syntomic site (EN line 171–174). | None |
| 3.3 | `r=0`; `p` on `Z/p²`; odd degrees at `p=2` | `τω=ωτ=p^r` (EN line 195); killed errors are not isomorphisms; `τ` not multiplicative (EN line 243–244). | None |
| 3.4 | `r=0`; trivial-log point tower; `A_n=⊕_{j≥n}F_p` | `lim A_n=0`, `lim¹A_n=(∏F_p)/(⊕F_p)`, recomputed through the six-term sequence (StacksRlim line 10670–10674); `(p^r−φ)` versus `1−φ_r` fibres differ by the automorphism `p^{-r}` rationally. | None |
| 4.1 | `r=0`; `p=2,r=2`; `r=p−1` | `L_EN=(1/8)Z_2(2)`, `L_CN=(1/4)Z_2(2)`, inclusion zero mod 2; endpoint decompositions differ by one power of `p`; composite error bound `p^{A+B}` checked. | None |
| 4.2 | `r=0`; unit; nonproper `X`; trivial-log point | Repaired supplier domain; Layer 4 inputs have `U=X_tr`. | None (F01 repaired) |
| 4.3 | `p=2`: `r=0` only; `p=3`: `r=0,1`; `t dlog t` on `G_m/F_p` | `C⁻¹(t dlog t)=[t^p dlog t]≠0` while `[t dlog t]=[dt]=0`; no transfer to `S′` integrally. | None |
| 4.4 | `xy=π^h`, `h>1`; `p=2,r=1`; `q>r` | Charts and bounds match CN Theorem 1.1; nothing asserted above `r`. | None |
| 4.5 | empty closed part; `j′=id`; `r=0` | Triangle `j_!Rj′_*→E→i_*S` (EN line 352); open part identity. | None |
| 5.1 | `D=K0`, `N=0`; `φ=diag(1,p)`, `Ne1=e0`; `k[t]/t^m` | `Nφ=pφN`; `e1↦e1+log(u)e0`; `t↦t^p` kills `t^{m−1}` for `m>1` (HK line 737–739), so no `Isocrystal` instance. | None |
| 5.2 | `r=0`; two-dimensional datum; `D=E=0` | `N(1−φ/p^r)e1=(1−p^{1−r})e0` equals the lower map on `Ne1`; lower map `1−pφ` at `r=0`; `d²=0`. | None |
| 5.3 | identity refinement; `p=2`; `r=0` | Truncation `τ≤r` retained; rational only. | None |
| 6.1 | `id_S`; empty; `P¹_S` | `H²(P¹)=O(−1)` has `Φ=pσ`, filtration jump 1. | None |
| 6.2 | `c=0`; non-locally-free graded piece; `U=D(pt−1)` over `Z_p[t]` | `(pt−1)` is a unit in `B†_K` (series converges for radius `<p`), so `c_0` is bijective and the rigid sheaves are coherent, while `Q_p[t,(pt−1)^{-1}]` is not finite over `Q_p[t]`. The independent algebraic hypotheses are genuinely needed. | None |
| 6.3 | constant `G_m`; no horizontal boundary; sections `x=0`, `x=t` | `x(x−t)=0` is a total-space NCD but its fibre at `t=0` is `x²=0`: condition (2) of Setting 2.16 fails. | None |
| 6.4 | constant genus-`g` curve, `g=0`; `G_m`; `p=2` | Ranks `1,2g,1`; `H¹(G_m)=O(−1)`. | None |
| 6.5 | `A¹`; `G_m`; elliptic curve | `H¹=0`, `K dlog t`, `H¹(E^an,O)=K` respectively; affineness essential. | None |
| 6.6 | `{0,∞}`; `t²+t+1` over `Z_2`; `D=∅` | `Res(dlog t)=(1,−1)`; `H⁰(D)=Q_2(ζ_3)` with `Φ=2σ`, trace-zero part `Φ=−2`; `D=∅` leaves `H²` and is excluded by affineness. | None |
| 6.7 | `n=0`; `G_m`, `n=1`; split | `F⁰(H^n(n+1))=F^{n+1}H^n`; twist drop by one under residue; AM's `Fil^{n+1}H^{n+1}=0` retained only for the §2.7 application. | None |
| 7.1 | `σ(t)=t^p` at `0`, `a`; `σ(t)=t^p+p` | `P_a(t)=[a]`; `α=α^p+p` gives `α≡p` mod `p²`, also at `p=2`; `t=p` is incompatible with `t^p`. | None |
| 7.2 | `M=0`; constant `1`; `k=F_p`, `t^p−t` | Nullstellensatz needs algebraically closed `k` and reduced `C/p`; `t^p−t` vanishes at all Teichmüller lifts over `F_p`. | None |
| 7.3 | identity point; split; `t=p` | `dP_a` of a base form is zero; the Frobenius equation is used in the second component only. | None |
| 7.4 | `Spec(W)`, `r=0,1`; `P¹_W` with `{0,∞}`; vertical log at `r=1` | Horizontal point `H¹=Q_p`; `C_st` point complex `Q_p→Q_p³→Q_p` with `d⁰=((1−p^{-1})x,x,0)`, `d¹=0`, `H¹=Q_p²`, matching `H¹_st(G_{Q_p},Q_p(1))`. | None |
| 7.5 | curve `n=1,r=2`; split; `H^{n+1}(F^r)≠0` | `F²Ω•=0` on a curve; both vanishings needed for the connecting isomorphism. | None |
| 31 gap contracts | `r=0`; `p=2`; ramified `V`; horizontal versus vertical log; empty inputs | Every supplier named; needs sentences present identically in README and plan; none asks for an object at the pins or on main (Mathlib has only the `BDeRham` carriers, abelian `Ext`, the cone and the isocrystal class; Tau Ceti has only exact structures and abelian Ext). | R01 (P3, routing only) |

### Duplication audit

Searched the content repository's `TauCetiRoadmap/` (main), the board packages and the two open roadmap heads (ArithmeticDynamics, ErdosProgressionPowers) for filtered F-isocrystals, rigid or log-syntomic cohomology, Hyodo–Kato data and Fontaine–Messing period maps: no roadmap other than this one states any of them. Pinned carriers verified at the cited lines of the cached pinned sources: `CochainComplex.mappingCone` with `inl`, `inr`, `fst`, `snd` (MathlibCone line 61, 76, 80, 84, 92); `WittVector.Isocrystal`, `IsocrystalHom`, `IsocrystalEquiv` under `[IsDomain k] [CharP k p] [PerfectRing k p]` (MathlibPin line 77, 117, 136, 142, 184); `HasExt` and `Abelian.Ext` requiring `[Abelian C]` (MathlibExt line 53, 59, 122); `BDeRhamPlus`, `BDeRham` with their four binders (MathlibBDeRhamReview line 55–56, 79, 92); `nonempty_homotopy_id_zero_of_homotopyEquiv` (TauCetiCone line 40, 53); `IsStandardSyntomicOfRelativeDimension` as a flatness/presentation predicate (TauCetiSyntomic line 79–93); `TauCeti.ExactStructure` (TauCetiExactReview line 245–267); `IsConflationExact` (TauCetiExactFunctorReview line 68–81); `IsMonoidal` (TauCetiExactMonoidal line 48–57); `op` and `op_conflation_op_iff` (TauCetiExactOpposite line 150–155, 201–203); Tau Ceti Ext requiring `[Abelian C] [HasExt C]` (TauCetiExtReview line 54). Each is consumed, none restated. The pins match `lake-manifest.json` (Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…`).

### Supplier-order audit

All eleven suppliers precede the candidate: DerivedModuleAlgebra (merge order line 6), AdicSpacesPartIV (11), EnhancedDerivedSheaves (14), EtaleCohomologyFoundations (15), PadicPeriodRings (16), CrystallineCohomology (18), PadicDifferentialEquationsAndRigidCohomology (93), PadicHodgeTheory (94), CohomologyComparisons (130); GrothendieckEulerForms and RigidAnalyticGeometry are on main. The consumers PadicHodgeRegulators, ColemanIntegrationPartII and EllipticRegulators supply no premise. Cited sections exist on main: EtaleCohomologyFoundations F.0.3, F.1, F.3a, F.4.1–F.4.5; AdicSpacesPartIV F1.5, F1.7, F1.8, F1.9, F1.12, F1.16; RigidAnalyticGeometry 6.1, 6.2, 7.3, 7.4, 8.1, 8.4; EnhancedDerivedSheaves 0.1–0.4, E2:towers.1, E5:abstract; DerivedModuleAlgebra 0.K.1; GrothendieckEulerForms Layer 5 (abelian Ext-Euler, line 383). Every `*Needs:*` line names earlier targets, pinned declarations, those sections or a declared gap; no upward citation, no cycle, no unowned prerequisite.

The brief's gate invocation names `packages/CohomologyComparisonsPartII/README.md`, which does not exist at the design stage (FileNotFoundError). With the design README as candidate and the same configuration, `--only` and order file, the gate exited 0 with:

```text
candidate: CohomologyComparisonsPartII is not in the merge order yet; checked as if placed after CohomologyComparisons (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 12 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Shape and completeness

Shape follows the house form: title and Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, named roadmap sections, declared contracts), How to read the build, seven layers of prose targets with named API, Checks, Examples and Dependencies, Downstream consumers, References. Counts: 33 targets, 121 API lemmas, 107 Checks, minimum three per target. Sources manifest: 21 records, 20 certified cached texts, one settled uncertified record (BesserII, consumer context only); no entry was changed or added. Lean elaboration: not applicable, no `Suggested.lean` is part of this design.

## Not verifiable

- **BesserI displayed formulas.** The cached extraction loses the displays of Definition 6.1, Proposition 6.3 and Remark 8.7(3) (BesserI line 709–714, 729–735, 1074–1078). The fibre coordinates were checked through the surrounding prose, the cone description at BesserI line 741–745 and AM (3.11)–(3.12); the displays themselves could not be read.
- **CN Corollary 3.9 exponent.** CN line 1547 prints the bound as `p2ce+2r`, whose exact form (constant and placement of `e`) the extraction does not resolve; the `local-period-annulus-entry` contract cites the bound by name rather than transcribing it, which is the correct caution. A transcription repair cannot be specified from this text.
- **Supplier texts not on main.** CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicDifferentialEquationsAndRigidCohomology and PadicHodgeTheory have no README on main or in the board packages; their contracts are therefore declared gaps and cannot be checked against supplier sections. This is the declared-gap contract, not a finding.
- **TsujiNearby OCR.** The proofs of Theorems 4.2 and 5.1 (TsujiNearby line 892–940, 1074–1143) are heavily garbled; the theorem statements, hypotheses and lemma numbers used by 4.3 and the two nearby-cycle gaps were readable and agree.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "46f8e4b51533d6ee1ba92254849ea6d0cd576aaa", "job": "REV-DESIGN-CohomologyComparisonsPartII~5", "model": "fable", "worker": "chris-f"} -->
