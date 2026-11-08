# Review of TriangulineVarietyAndItsLocalModel (pull request #1829 at 154076d)

**Verdict:** accepted

No finding. The folder `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel` (README.md, Suggested.lean, metadata.toml) is ready for a human's final approval, conditional on the twelve declared supplier gaps listed under "Gaps" below.

## Verified sound

**Gate and build.** The worker's gate at 154076d reports every check 0 (set_option, blob, latex, prnum, sorry-data, imports, stray-files, outside-folder, build). I reran the dependency check with `--movable`:

```
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. `lake env lean TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/Suggested.lean` exits 0 with no output (32 s). The file has one module docstring in the "<title>: target signatures" form, the namespace, and no declaration; there is nothing to probe for padding and no signature to compare with `#check @name` (I note this explicitly: the mechanical signature check has an empty domain). Its import form `public import Mathlib` is the form the gate accepts and that eight roadmaps on main use.

**Headline statability.** Every headline the README states (local-model identification §7.4, normality and Cohen–Macaulayness §7.5, flatness §8.1, accumulation §8.4, companion criterion §8.7, weight-fibre Kazhdan–Lusztig identity §9.2, crystalline multiplicity formula §9.8, NT strictness §4.2 and criterion §4.4, the rank-two cases §4.5, injection-line recovery §§10.4/10.6, surjective modification §10.8, derivative transport §11.3, paraboline products §11.7, partial quotient comparison §12.7, matched-relation rigidity §13.5, higher intertwining §13.6, the recovery sequences §§13.10/13.14/13.15) needs a Robba module, a trianguline variety, a Weil–Deligne representation, a Galois period representation or Kazhdan–Lusztig polynomials. At Mathlib f6090c7 the greps for `Robba`, `Trianguline`, `WeilDeligne`, `KazhdanLusztig`, `HeckeAlgebra`, `PhiGamma`, `IsDeRham` return 0 files; `Crystalline` hits only elliptic-curve and categorical Galois files; Tau Ceti 358314d has no file matching `robba`, `trianguline`, `PhiGamma` or `BDeRham`. Mathlib's `BDeRhamPlus` (Mathlib/RingTheory/Perfectoid/BDeRham.lean line 75) and `BDeRham` (line 88) are `AdicCompletion`/`Localization` rings with no Galois action, as the docstring says. The docstring names every headline and the carrier it lacks; no stand-in is written. The other eight Mathlib citations (`LinearMap.prod` Prod.lean:95, `LinearMap.range` Range.lean:57, `LinearMap.ker` Ker.lean:59, `finrank_range_add_finrank_ker` Lemmas.lean:173, `finrank_sup_add_finrank_inf_eq` Lemmas.lean:53, `AdicCompletion` Basic.lean:171, `Module.length` Length.lean:30, `AlgebraicCycle` Basic.lean:44) are exact at the pin. The README's backticked Lean names are only these Mathlib names; none of the roadmap's own, consistent with an empty Lean file. The pinned revisions quoted at README line 47 equal those of lake-manifest.json.

**Seeded sample, verified at the text.**

| Target | Locator read | Result |
|---|---|---|
| 1.1 | BHS19 Prop 3.1.1 (line 1257), X_W, X_W^□ pp. 332–333 | equivalence Rep_pdR ≃ Rep_K(G_a); groupoids as stated |
| 3.1 | BHS19 T₀ (lines 2143–2148), T_reg (2617–2620) | T₀: δ_iδ_j⁻¹ and εδ_iδ_j⁻¹ not algebraic; T_reg: complement of z^(−k), ε z^k, k ≥ 0; T₀ⁿ ⊊ T_regⁿ; README's ordered form equivalent |
| 5.4 | BHS19 Prop 3.4.6 (2219), Lemma 3.4.7 (2232) | closed immersion for δ∈T₀ⁿ; ν=0 ⇒ split with locally algebraic lifts |
| 6.2 | Lemma 3.5.3 (2322), Cor 3.5.4 (2353), Lemma 3.5.5 (2362); standing assumptions at 2305, 2321 | relative representability; wt−wt(δ) formally smooth of relative dimension n; finiteness via dim H¹(R(δ)[1/t]) for δ∈T₀ (line 2350) |
| 6.5 | Cor 3.5.9, (3.25)–(3.26), Prop 3.5.10 (2445–2465), S(x) (2477) | as stated, including frame independence by G-equivariance |
| 7.5 | Remark 3.7.9 (2850), Cor 3.7.10 (2879) | normal, hence irreducible, CM at x under the locally algebraic generic regular-Sen hypotheses |
| 8.4 | Prop 4.1.4 and proof (2946–2956); BHSsmooth17 Lemma 2.10 (617), Prop 2.12 proof (720–729) | proof route identical: flat affinoid with open weight image, local irreducibility, open normal locus, Lemma 2.10, accumulation of algebraic weights |
| 9.1 | BHS19 (4.6)–(4.8), Remark 4.3.1 (3137–3200) | weight-fibre codimension [K:ℚₚ]n(n+1)/2 (3174); C_(w₀)=Z_(w₀) ≠ 0 iff de Rham (3186); crystalline identification (4.8) |
| 9.5 | Prop 4.3.6 and proof (3288–3302) | conditional uniqueness by the unitriangular linkage system, including non-locally-algebraic parameters giving zero fibres |
| 10.6 | Ding25 Props 2.7–2.8 (599–616) | Hom bound, rank-drop criterion, annihilator E[D_σ] one-dimensional for every K |
| 10.8 | Ding25 Prop 2.5, (2.7) (560–590) | "(surjective)" asserted without proof; README's transverse-flag route checked (below) |
| 11.6 | Ding25 (2.18), Prop 2.13 (812–824) | F_P-deformations, κ_(F_P), dim 1+d dim P |
| 13.4 | Ding25 (2.36) (1224–1227), Cor 2.31 | ι⁻(M)=D̃₁, −ι⁺(M)=C̃₁, the README's sign |
| 13.7 | Cor 2.33 and proof (1263–1271) | (1+d)+(1+(n−1)(n−2)d)+(−1+(n−1)d) = 1+(n²−2n+2)d; sum 1+n²d |
| 13.9 | definition before Cor 2.34 (1274–1291) and proof (1306–1307) | V on the barred quotients, the opposite-twist representative condition, kernel of the sum map |

Also read and found consistent with the README: NT21 Notation (261), ordinary dictionary (1083–1087), Lemma 2.4 (1098), Lemma 2.8 (1189–1215), Def 2.9 and reformulation (1276–1290), Example 2.10 (1297–1314), Prop 2.15 proof (1465–1485); BHS19 Lemma 3.3.6 (1880), Prop 3.5.7 (2380–2412), Cor 3.5.8 (2421), Cor 3.5.11–3.5.12 (2479–2509), Thm 3.6.2, Cor 3.6.3, Prop 3.6.4 (2567–2612), Props 3.7.1–3.7.3 (2641–2661), Lemma 3.7.4 (2729), Cor 3.7.8 (2838), Prop 4.1.5 and Remark 4.1.6 (2962–2996), Thm 4.2.3 and Remark 4.2.4 (3040–3101), Cor 4.3.2 (3203–3216), Conjecture 4.3.4 and Remark 4.3.5 (3263–3272), Example (i) (276–285); BHSsmooth17 δ_k (248–262), Lemma 2.4 proof (455–468), Definition 2.11, Remark 2.14 (737–740), §2.1 (280–330); Colmez08 Def 4.1, Prop 4.3 (944–967); HartlHellmann Thm 8.15 (2085), Prop 8.17 (2137), (9.1) (2207); Ding19 Prop A.3, Cor A.4, Prop A.5 (2083–2099); Ding25 Prop 2.2, Remark 2.3, Prop 2.4 (484–540), Prop 2.10, Lemma 2.11 (679–714), Prop 2.12 (801), Prop 2.20–2.22, Remark 2.21 (990–1027), Prop 2.24 (1041–1074), Lemma 2.28, Prop 2.29, Lemma 2.30 (1140–1217), Thm 2.32 (1233), Prop 2.35, Cor 2.36, Thm 2.37 (1319–1355), Cor 2.38, Prop 2.39, Cor 2.40 (1367–1410).

**Adversarial table** (statement; instances; values computed; result).

| # | Statement | Instances | Values | Result |
|---|---|---|---|---|
| 1 | dim X_tri = n²+dn(n+1)/2 (contract, §§7.5, 8.1, 9.9) | (n,d)=(1,d),(2,1),(2,2),(3,1) | 1+d, 7, 10, 15 | agrees with every README check |
| 2 | ω′-fibre dimension n²−n+dn(n−1)/2 (§9.6) vs BHS19 n²+dn(n−3)/2 | (1,2); (2,2); (2,1) | 0 vs −1; 4 (=10−6) vs 2; 3 vs 3 | README right; source wrong for d>1 |
| 3 | full-character codimension dn(n+1)/2+n (§9.4) vs dn(n+3)/2 | (1,2) in Spec R_r of dim 3 | 3 vs 4 | README right |
| 4 | weight-fibre codimension dn(n+1)/2 (§9.1) | (1,1),(1,2),(2,1),(2,2) | 1 of 2; 2 of 3 → dim 1; 3 of 8 → 5; 6 of 12 → 6 | matches §9.1 checks and BHS19 line 3174 |
| 5 | dim g̃ = dn² (§§1.4, 2.4) | (2,1); (1,2) | 1+3=4; 0+2=2 | ok |
| 6 | §6.3 framed d(n²+n(n+1)/2); rigidified n+dn(n+1)/2 | (2,2); (1,1) | 14; 8; 8+8−2=14; 2,2 | matches BHS19 Prop 3.5.7 (n+dn(n+1)/2, 2411) |
| 7 | §6.4 relative dimension dn(n+1)/2 over X̂ (dim dn²) | (2,2); (1,2) | 8+6=14; 2+2=4 | ok |
| 8 | §6.8 dim R_(r,F) = n²+dn(n+1)/2 | (2,2); (1,2) | 10, 10+8=14+4; 3 | ok, BHS19 2569 |
| 9 | §6.9 tangent formula | (2,2), smooth incidence point | 4−8+6+8=10 | ok, Cor 3.6.3 |
| 10 | §7.4 frame counts | (2,2); (1,2) | 10+8=8+10=18; 3+2=2+3=5 | ok |
| 11 | §8.5 bound and Springer §13.4 | (2,1,w=s,w_x=e); (3,1,w₀,e); substitution dim ker(wv⁻¹−1)=dn−d_u into Springer's bound | 7−1+1=7; 15−1+3=17; Springer's bound becomes the README's verbatim | ok, BHS19 Prop 4.1.5(ii) |
| 12 | §9.2 KL identity, S₂ | w=s,w_x=e; w=e,v=s | P_(e,s)(1)=P_(e,e)(1)=1 → C_e+C_s; P_(s,e)=0 | ok, support restriction as BHS19 3212–3216 |
| 13 | §§9.4/9.6 fibre dimension | (2,1),(2,2),(1,2) | 8−5=3; 12−8=4; 3−3=0 | ok |
| 14 | §9.9 split example | n=2,d=1 | dims 7, 4, 3, 2, 5; two components of dim 3 | BHS19 276–283 |
| 15 | §§11.3–11.4 dimensions, dim Ext¹₀=1−n+dn(n−1)/2, dim barExt¹=n+dn(n+1)/2 | (3,1); (2,1) | 10,4,7; target 6; kernel 1; bar 9 — 5,2,4; 0; 5 | ok, Ding25 690–691 |
| 16 | §11.5 dim 1+d(n(n−1)/2+1) | (2,1) | 3 | ok |
| 17 | §11.7 dim P − n(n−1)/2 = Σ n_i(n_i+1)/2 | symbolic; (3,1),(2,1) | identity verified by expanding (Σn_i)²; 7, 8, 7=4+3 | ok |
| 18 | §11.8 Hom_(P,g′) dim n+rd | (3,2),(2,1); (2,2) G and B | 7; 4 excluding (log_σ,0); 6 containing it | ok |
| 19 | §12.2 dim Ext¹_σ=1+(d−1)n(n−1)/2+n² via Ding19 (54) with Fil⁰End of dim n(n+1)/2 at τ∈J | (3,2); blocks (2,1); kernel 4 | 13; 11; 7=5+2 | ok |
| 20 | §12.3 modified dimensions | (2,2) | 9, 2, 3, 5, 4 | ok, Prop 2.20–2.22, Rem 2.21 |
| 21 | §12.5 ker T_σ=(d−1)n(n−1)/2; non-surjective full map | (3,2) | 3; 7→4; 13→10; 19→image 16 | ok, Prop 2.24 (1067) |
| 22 | §§12.6–12.7 | (2,2); (3,2) | 0 vs 1; 13−4=10−1=9 | ok |
| 23 | §13.2 three dimensions | (3,1),(3,2),(4,1); symbolic sum | 2,0,4; 4,1,7; 6,3,9; 2A−B=1+n(n−2)d | ok, Lemma 2.28 |
| 24 | §13.3 injective image 1+(n−1)(n−2)d vs exceptional sum | (3,2) | 5 < 7 | contradiction route sound |
| 25 | §13.7 intersection and ker κ_F=−1+(n−1)d | (3,2); (2,1) | 15,15,11→19=1+18; 4,4,3→5 | ok, Ding 1266–1270 |
| 26 | §13.10 dim L = dim V − dim barExt¹ | (3,1); (2,1) | 14−9=5; 8−5=3 | ok |
| 27 | §13.11 partial image 1+(n−1)(n−2) | n=3; n=2 | 3; 1 | ok, Prop 2.35(1) |
| 28 | §13.14 | (3,2) | 14=9+5 | ok |
| 29 | §13.16 | (2,2) original/modified | 5+5−4=6; 4+4−3=5 | ok |
| 30 | Conventions witness x|x| | δ(p)=p·p⁻¹ | Frobenius 1, BHS wt +1, NT wt −1, jump −1; x: Frobenius p | matches PhiGamma §7.1 |
| 31 | Art_K geometric; η(Frob_arith)=2 over ℚ₃ | D_cris(η)=(η⊗K̂₀^nr)^G, φ(v⊗c)=η(Frob_arith)⁻¹(v⊗c) | δ(3)=1/2=crystalline Frobenius; §8.6 check (1+T)⁻¹ | consistent throughout |
| 32 | §3.3 torsion interval {1−k,…,0} | graded pieces t^jR(δ)/t^(j+1) have weight wt δ+j; K=ℚₚ,k=1 | weight 0: (1,1); weight 1: (0,0); k=0: empty | ok |
| 33 | §5.2 | K=ℚ₃, δ=unr(2)x² | εδ⁻¹(3)=1/18=unr(1/6)x⁻¹(3); wt 2∉{1}: rank 1; 2∈{1,2}: rank 0 | ok |
| 34 | §3.1 | n=1; ratio 1 (a=0); ratio ε | vacuous; fails T₀ and T_reg; fails both | ok |
| 35 | §§4.3–4.4 | (0,3) slope 2, 3; gaps (3,1) two embeddings; NT Lemma 2.8 d=2 bound 3+0 | 2<3; 3<3 false; fails at second; δ₁(p) valuation 2 | ok |
| 36 | §4.5 both refinements noncritical for reducible indecomposable | Kummer 0→ℚₚ(1)→V→ℚₚ→0 | sub line jumps at −1, Fil⁰∩L₁=0, Fil⁰≠L₂ (else split): both noncritical; split ψ₁⊕ψ₂: Fil^(−h₁)=L₁, one critical | agrees with NT Example 2.10 (1303–1313) |
| 37 | §6.7 Cartan graph | w=(123), z=(ε,2ε,3ε) | w⁻¹z=(2ε,3ε,ε), wz=(3ε,ε,2ε) | agrees with BHS19 2735 Ad(w⁻¹)(ν)_i=ν_(w(i)) |
| 38 | §7.3 Sen polynomials | roots ε, 2+3ε; 0,0 | X²−(2+4ε)X+2ε; X²=(X−ε)(X+ε) | ok |
| 39 | §1.1 frame change | N=E₁₂,B=diag(1,0); N=εE₁₂ | (1+εB)⁻¹N(1+εB)=N+ε[N,B]; [E₁₂,diag(1,0)]=−E₁₂; ε[N,B]=0 | ok |
| 40 | §10.7 | a=2; a=1; a=0 | normal (1,−1,a−1)=(1,−1,1), dot (1,2,1)=0; third coordinate 0; line second coordinate 0; cross-ratio invariant under diagonal rescaling | ok |
| 41 | §§10.1/11.3 permutation convention | w=(123) | labels (φ₃,φ₁,φ₂); (a₁,a₂,a₃)↦(a₃,a₁,a₂) | consistent with (wz)_i=z_(w⁻¹(i)) |
| 42 | §8.3 | (e,slope,k)=(2,1,(4,1)); d=2,e=1,(0,2)²,prefix −3 | 3>2; gap −2>−3 holds and −3≥−4 holds so w not forced; prefix bound v_p≥0 excludes | ok; the bound's density argument checked (admissible open {|f|>1} inside a nowhere-dense Zariski closed set is empty) |
| 43 | §8.2 weights (a+(p−1)p^m,b−(p−1)p^m) | p odd; p=2 | gap→∞; u^((p−1)p^m)→1 on ℤₚ×; factor 1 at p=2 | ok |
| 44 | §13.4 relation | f=g=id_E | {(a,−a)}∌(1,1),(1,0); scaling by 2 preserves | ok |
| 45 | §13.13 | ψ=log_τ, τ≠σ; log_σ | τ-derivative 1, not in Hom_σ; admissible | ok |
| 46 | §12.4 | d=1; ε·id | identity; spectrum {0,0}, nonzero | ok |
| 47 | §§2.1–2.2 | W⁺=B_dR⁺; εA⊂A | Fil^iK=K (i≤0), 0 (i>0); inclusion ⊗E is 0 | ok |
| 48 | §2.3 | h=(0,2) | Fil_1=Fil⁰ rank 1, Fil_2=Fil⁻² rank 2 | ok |
| 49 | §6.1 negative control | Sen weight 1/2 | D_pdR=0 | ok |
| 50 | §5.1 | ν=0 on E²; Jordan block | (2,2); (1,1) | ok |
| 51 | §8.6 | n=1, K unramified quadratic, k=0 | dims 1, 2, 3, relative 1; (a,b)↦(au₂/u₁,bu₁/u₂) by semilinearity | ok |
| 52 | §10.8 surjectivity route | D′∈ΦΓ_nc(φ,T_σh) | off-σ flags transverse to the n! refinement flags exist (nonempty open of the flag variety over an infinite field); Fil_D⊂Fil_(D′) indexwise; Prop 2.5(1) uniqueness gives T_σ(D)=D′ | sound |

**Duplication and ownership.** `roadmaps grep` over main and the 459 open pull requests for "trianguline variety", "local model", "companion point", "higher intertwining", "crystabelline", "Breuil–Hellmann–Schraen", "accumulation property": the trianguline variety itself appears only in the suppliers (CompletedCohomologyAndLocalGlobalCompatibility §5.2a constructs X_tri; LocalGaloisDeformationRings, PhiGamma, SpringerResolutionAndCharacteristicCycles cite it); no roadmap builds the local model, the companion criterion, the cycle transfer or Ding's recovery sequences; OverconvergentAutomorphicForms cites BHS only for Jacquet-module analytic stages. This roadmap is the owner of what it states. The matched-relation and dimension steps of Layers 11–13 cite Mathlib's `LinearMap.range`, `LinearMap.prod`, `LinearMap.ker` and the two finrank lemmas rather than restating them.

**Supplier citations resolved** (heading found at the cited head): PadicHodgeTheory #1062 §§3.2, 4.3, 4.4, 4.5, 5.2, 5.3, 6.3; PhiGammaModulesAndIwasawaCohomology #1310 §§1.0c, 1.1, 1.2, 2.7 (W_G for compact abelian G and T=W×G_m through K×≃ϖ^ℤ×O_K×), 3.1, 3.4a, 3.8, 3.9, 7.1–7.8 (§7.2's H⁰/H² characters are exactly §3.1's T_reg exclusions; §7.5's strictness is dim H⁰((M/Fil_i)(δ_(i+1)⁻¹))=1); LocalGaloisDeformationRings #923 §§0.4, 1.1, 1.4, 1.12, 1.18, 1.23 (dimensions 1+d²f, 1+d(d+1)f/2, 1+d(d−1)f/2 = the README's 1+n²d, 1+dn(n+1)/2, 1+dn(n−1)/2), 3.4, 3.5, 3.6, 3.10; DeformationAndDerivedPatchingAlgebra #1034 §§1.6–1.14, 2.1–2.7, 3.1–3.2; CompletedCohomologyAndLocalGlobalCompatibility #1270 §§5.1, 5.2a (reduced closure in X^□_r̄×T̂, regular locus with the T_reg exclusions, global setting retained, no full-character smoothness: the gap is precise); ModularityAndLanglandsExtensions #1180 §4.3; LocallyAnalyticDistributions #854 §3.3; PadicDifferentialEquationsAndRigidCohomology #1002 §RD.2.43; SpringerResolutionAndCharacteristicCycles #1828 §§1.1–1.3, 2.1, 3.1, 3.5, 3.6 (necessary direction only, as §6.9 uses), 4.3, 4.4, 5.1, 5.4, 6.6, 7.1–7.3, 11.3, 11.4, 12.2, 13.3, 13.4 (bound reproduces §8.5), 13.5, 14.1, 14.2, 14.4 (completed KL identity with P_(w₀w,w₀v)(1)); on main: SchemeAndStackFoundations §§0.16, 0.17, 0.21, 4.3–4.5; RigidAnalyticGeometry §§1.2, 7.3, 8.1–8.3; AdicSpacesPartII R1.1, R1.5, R1.7, R1.9; PadicMeasuresIwasawaAlgebras §3a.1. The citation resolver's one lead, PadicLocalLanglandsForGL2QpPartII §1.2 (README line 19), is a scope deferral to a later roadmap (merge order line 362) that no target consumes; its design on the board has §1.2 "Polynomial injectivity and invertibility of the connection" stating exactly the two facts the README attributes to it. LocallyAnalyticRepresentationsOfLocalGroups (merge order line 244) and PadicHodgeParametersInLocallyAnalyticRepresentations (line 251, consumer) have no pull request yet; their board designs contain the cited ids LR.4/principal-series, LR.5/orlik-strauch-functor, -exactness, -irreducibility, -jordan-holder, -products, and TR1–TR5 headed with this roadmap's name.

**Gaps.** Twelve, with identical slug, supplier, section and `needs` sentence in `design/plan.json` and the README's contract sections; none has supplier `none`; each `needs` is single-purpose with its hypotheses and asks for nothing the supplier already states (checked: PhiGamma §2.7 constructs the character spaces but states neither étaleness of wt nor Zariski accumulation; CCLGC §5.2a keeps its global hypotheses; RigidAnalyticGeometry on main has no openness of the normal, Cohen–Macaulay or flat loci and no completed-normalization injectivity; PadicHodgeTheory §4.5 stops at field coefficients and has no partial de Rham dimension formula; LGDR §1.23 gives the individual rings and not Ding's selective modification or the dominant-semistability lemma; LARLG's LR.4/LR.5 nodes do not state the all-family triangular system or the lower-Borel conventions). Each gap is named by at least one `*Needs:*` line.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, eleven roadmaps), How to read the build, Layers 1–13 each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Thirty definitions, each with an interface list and 4–9 Checks; every target carries a parenthesised locator with a source line; no process words, LaTeX delimiters, pull-request numbers or local paths (scanned). The three worked examples recompute §9.9, §10.7 and the Layer 13 dimensions and agree with the targets.

## Not verifiable

None. Every cited text was read from the sources cache (BHS19, BHS17, BHSsmooth17, Ding19, Ding25, NT21, Colmez08, HartlHellmann, all `certified` in sources.toml).

## Source issues

- **Error** in BHS19 at Theorem 1.9, Conjecture 4.3.4, Remark 4.3.5 and (4.12), printed pp. 305, 381–382: the source says the full-character fibre cycles have codimension [K:ℚₚ]n(n+3)/2 in Spec R_r and the fibre has dimension n²+[K:ℚₚ]n(n−3)/2; it should be codimension [K:ℚₚ]n(n+1)/2+n and dimension n²−n+[K:ℚₚ]n(n−1)/2, which agree with the printed values only for K=ℚₚ (for n=1, [K:ℚₚ]=2 the printed values are codimension 4 and dimension −1 in a 3-dimensional ring); affects a stated result.
- **Misprint** in NT21 at Lemma 2.4, proof, printed p. 29: the source says the one-dimensionality of H⁰((D_rig(ρ)/Fil_i)(δ_(i+1)⁻¹)) is required for each 0≤i≤n; it should be 0≤i≤n−1, the quotient being zero at i=n; affects nothing.
- **Gap** in BHSsmooth17 at Lemma 2.10, proof, printed p. 15: the source takes ω(x)=δ_k with k unrestricted and its induction uses strict dominance of k and nonnegativity of the prefix valuations at x, which it shows only for the saturated parameter δ′; it should first derive v_p((δ₁⋯δ_i)(ϖ_K))≥0 at every point of X_tri from density of the saturated locus, after which (2.12) gives strict dominance; affects the proof.
