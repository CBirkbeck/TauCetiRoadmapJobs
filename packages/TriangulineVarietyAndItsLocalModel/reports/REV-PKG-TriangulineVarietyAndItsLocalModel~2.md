<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1547#issuecomment-6400189708 -->
Review (claude) of 6d21a0c

Verdict: needs_changes

1. **F01** (P2) Two open designs build the nontrianguline rank-two connection obstruction

   **Location.** `packages/TriangulineVarietyAndItsLocalModel/README.md` line 3 ("the nontrianguline rank-two connection obstruction"), §4.6 (line 618) and §4.7 (line 640: "Then P(∇) is injective"), the gap `polynomial-connection-finiteness` (line 136), and the Lean docstring's last two headline bullets.

   **Claim.** This roadmap owns, as a headline, that for an absolutely irreducible nontrianguline two-dimensional V over ℚₚ every nonzero P(∇) is injective on D_rig(V) (DLB17 Lemma 6.3), with the finiteness of ker P(∇) as a gap on PadicDifferentialEquationsAndRigidCohomology.

   **Witness.** The board design PadicLocalLanglandsForGL2QpPartII plans the same statement from the same source as its target `GR.1/nontrianguline-differential-control`, with its own gap G2 for the finiteness of ker P(∇): `packages/PadicLocalLanglandsForGL2QpPartII/reports/REV-DESIGN-PadicLocalLanglandsForGL2QpPartII.md` lines 19, 116 and 242 (adversarial row "rank-one trivial: ∇1=0, so P(X)=X fails injectivity", the same witness as this README's §4.7 Check). That design's README at head 3e0777d could not be fetched (HTTP 404), so the evidence is its design review's target table. Nothing in this roadmap consumes §4.6 or §4.7 (only §4.7's `*Needs:*` line names §4.6; no later layer, Example or consumer uses either).

   **Repair.** Give the object one owner. Since DLB17's Lemma 6.3 and Proposition 6.4 are the Drinfeld-tower roadmap's material and nothing here uses them: delete §§4.6–4.7, the gap `polynomial-connection-finiteness` (in the README and in `design/plan.json`'s `gaps`), the two matching bullets of the Lean docstring, the Layer 4 Examples sentence on P(∇) (line 658), and the summary clause "and the nontrianguline rank-two connection obstruction"; in Scope and ownership record that PadicLocalLanglandsForGL2QpPartII `GR.1/nontrianguline-differential-control` owns the statement, and drop Colmez08 and DLB17 from `sources.toml` only if no other target cites them (§4.5 still cites Colmez08). If instead this roadmap is to be the owner, say so in Scope with the reason and have the fix worker's report flag the other design for the intake. Test: after deletion the depcheck still reports 0 problems, and the Layer 4 Dependencies line loses PadicDifferentialEquationsAndRigidCohomology §RD.2.43 and PhiGamma §§7.1–7.8 only where §§4.6–4.7 were their sole consumers.

2. **F02** (P3) Three supplier contracts are consumed by no target

   **Location.** `README.md` lines 104–110 (From TauCetiRoadmap.PadicFunctionalAnalysis; From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras) and lines 120–122 (From TauCetiRoadmap.ModularityAndLanglandsExtensions: "Section 4.3 supplies the NT-ordered regular condition").

   **Claim.** The contract section lists only what is consumed by name.

   **Witness.** No `*Needs:*` line names PadicFunctionalAnalysis, PadicMeasuresIwasawaAlgebras or ModularityAndLanglandsExtensions (grep over the README: 0, 0 and 0 Needs lines). §4.1 (line 506, "Use NT-regularity of δ") restates the condition the contract says ModularityAndLanglandsExtensions §4.3 owns, with `*Needs:*` naming only PhiGammaModulesAndIwasawaCohomology and PadicHodgeTheory.

   **Repair.** Add "ModularityAndLanglandsExtensions §4.3" to §4.1's `*Needs:*` line and to the Layer 4 Dependencies line (it is at merge position 255, earlier than 303). Delete the PadicFunctionalAnalysis and PadicMeasuresIwasawaAlgebras paragraphs, or move their one-sentence content into the PhiGammaModulesAndIwasawaCohomology §4.0 paragraph, which already names them as the ℤₚ× inputs; the repair report of round 1 deleted the LocallyAnalyticDistributions contract for the same reason.

3. **F03** (P3) "Algebraic unit weight" understates the accumulation hypothesis

   **Location.** `README.md` line 1048, §8.2: "For x with algebraic unit weight, the accumulation property means".

   **Claim.** The definition is stated for points whose unit restriction ω(x) is an algebraic character.

   **Witness.** BHS19 line 2939 (Definition 4.1.3, p. 373): the hypothesis is that ω(x) is algebraic. The README's own §8.3 last Check (line 1094) shows a ramified finite-order character has integral weight 0 and non-algebraic unit restriction, so "algebraic weight" and "algebraic unit restriction" differ; §8.4 (line 1098) states the hypothesis correctly.

   **Repair.** Replace "For x with algebraic unit weight" by "For x whose unit restriction ω(x)=δ|_(O_K×)ⁿ is an algebraic character", matching §8.4.

4. **F04** (P3) Colmez's definition does not include coefficient extension

   **Location.** `README.md` line 622, §4.6: "nontriangulinity is meant after every finite extension of coefficients, as in Colmez's definition".

   **Claim.** Colmez's Definition 4.1 defines trianguline after allowing finite extension of L.

   **Witness.** Colmez08 line 944 (Definition 4.1, p. 237) and lines 127–128 (p. 216): V is trianguline when D_rig(V) is triangulable over the given L; no scalar extension is mentioned. The extension is DLB17's usage: line 1255 ("éventuellement après avoir remplacé L par une extension finie").

   **Repair.** Moot if R01 deletes §4.6; otherwise write "as DLB17's proof of Lemma 6.3 uses it (DLB17 line 1255)". The hypothesis as stated in the theorem is correct and unchanged.

5. **F05** (P3) Two Mathlib line locators are off by one

   **Location.** `README.md` line 42: "`Module.length` (Mathlib/RingTheory/Length.lean, line 31)" and "`AlgebraicGeometry.AlgebraicCycle` (Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean, line 45)".

   **Witness.** At the pinned Mathlib `6b7abb3c`, `def Module.length : ℕ∞ :=` is at line 30 and `abbrev AlgebraicCycle (X : Scheme.{u}) (R : Type*) [Zero R] :=` at line 44. The other six locators (lines 95, 57, 59, 173, 53, 171) are exact.

   **Repair.** Change 31 to 30 and 45 to 44.

One blocking finding (P2, an ownership overlap with an open board design) and four non-blocking notes. All nine findings of the first round are repaired; the repaired passages pass the adversarial pass. The four input files were not changed.

## Verified sound

**Repairs of round 1, finding by finding.** Each repaired passage was opened and checked against the source line the repair cites.

| Finding | Repaired passage (README line) | Status |
|---|---|---|
| F01 | line 58: "δ_i(u)=∏_τ τ(u)^(k_(τ,i)) for every u∈O_K× with integers k_(τ,1)>⋯>k_(τ,n)"; plan gap identical | repaired; BHSsmooth17 lines 617–624 hypothesis ω(x)=δ_k |
| F02 | line 11: "the unrestricted local form used here (every finite K, every n≥1, every residual representation, with smooth full-character projection on the regular locus) is the contract gap:unrestricted-trianguline-variety"; lines 114–118 | repaired; CCLGC §5.2a at head #1270 lines 1831–1851 retains §5.1's setting and states no smoothness of ω′; BHS17 lines 298–334 |
| F03 | line 66: "W=`compactCharacterSpace` of O_K× and T=`localMultiplicativeCharacterSpace` K … dim W=d, dim T=d+1"; line 68 narrowed gap | repaired; PhiGamma §4.0 at head #1310 lines 1465–1470 constructs both; §7.3 line 2345 `CharacterWeights` |
| F04 | line 702: "The map `H^1(R_E(delta)) -> H^1(t^(-k)R_E(delta))` … isomorphism when wtτδ∉{1,…,kτ} … zero when wtτδ∈{1,…,kτ}"; line 714 ℚ₃ Check | repaired; BHS19 lines 2061–2077 |
| F05 | line 1230: "No de Rham hypothesis enters this identity, and individual terms C_v^wt may vanish"; §§9.6–9.7 likewise | repaired; BHS19 lines 3203–3224, 3303–3343 |
| F06 | line 2078: "κ_G … followed by the exchange of the two factors: κ_(G,1) records the quotient C₁ and κ_(G,2) the rank-one submodule" | repaired; Ding25 lines 1128–1133, 1233–1239 |
| F07 | lines 92–96: three gaps `completed-normalization-injectivity`, `rigid-normal-cm-openness`, `rigid-flat-openness`; line 958 §7.2 route with normalization after each blowup | repaired; NT21 lines 1463–1485, BHS19 lines 2691, 2923, 2948, BHSsmooth17 line 464 |
| F08 | line 1076: "At every point x=(r,δ) of X_tri, v_p((δ₁⋯δ_i)(ϖ_K))≥0 … No dominance of k is assumed"; line 1080 route | repaired; see the adversarial row for the prefix-bound proof |
| F09 | line 2292: "PadicFamilies, CompletedCohomologyAndLocalGlobalCompatibility and ModularityAndLanglandsExtensions precede this roadmap and consume none of its results" | repaired; merge order lines 190, 247, 255 < 303 < 304 |

Pattern search for each repaired pattern in the rest of the package: integral-weight versus algebraic-unit-restriction wording occurs once more (R03); finite-shift versus full localization only in §5.2; the de Rham hypothesis is retained only in §8.5, where BHS19 Proposition 4.1.5 (line 2963) assumes it; the exchanged κ_G is carried into §§13.9, 13.12 and 13.13; no backward consumer promise remains (Scope line 18 names CompletedCohomologyAndLocalGlobalCompatibility as an earlier owner).

**Principles.** Read all 2311 lines of the README, the Lean file, metadata and manifest. No route-specific restriction (every p, every finite K, p=2 handled in Conventions and in the character spaces), no re-planned roadmap (every imported object is cited by roadmap and section; the one overlap is R01), no upward or cyclic supply (depcheck below), no copied passage (the sampled statements are paraphrases; none of the 40 source passages opened is reproduced), no algorithm, no sorry'd data, no `set_option`, no process words, no LaTeX delimiters, no pull-request numbers, no absolute paths (grep over the README for each: 0 hits).

**Seeded source sample.** All eight manifest works are certified copies in the cache; no locator is flagged unverified, uncertified or waived. Every sampled target was opened at its locator:

| Target | Source read (file line) | Outcome |
|---|---|---|
| 1.1 | BHS19 Prop 3.1.1, Cor 3.1.2, p. 330–331, lines 1257–1295 | equivalence D_pdR with (V,ν) and exactness; groupoid definition retained |
| 2.1 | BHS19 Prop 3.2.1, p. 336–337, lines 1505–1545 | lattice ↔ decreasing exhaustive separated ν-stable filtration, formula (3.5) as stated |
| 2.4 | BHS19 Thm 3.2.5, p. 341, lines 1720–1724 | pro-representable, formally smooth of dimension n²[K:ℚₚ] |
| 3.2 | BHS19 Lemma 3.3.4, Def 3.3.8, ω_δ, p. 343–348, lines 1805–1829, 1953–2002 | localized isomorphism forces a constant algebraic ratio; unique lift of the fixed residual tuple |
| 4.5 | NT21 Example 2.10, p. 32–33, lines 1297–1314; Colmez08 Def 4.1, Prop 4.3, p. 237–238, lines 944–980 | three cases with counts 1, 2, 2 and the critical reversed parameter; "assume χ₁≠χ₂" retained |
| 5.3 | BHS19 Thm 3.4.4, p. 352–353, lines 2150–2200 | locally algebraic δ∈T₀ⁿ; formal smoothness of X_(M,F)→T̂ⁿ_δ×_t̂ X_(W,F) |
| 6.3 | BHS19 Lemma 3.5.5, Cor 3.5.6, Prop 3.5.7, p. 357–359, lines 2362–2412 | dimension [K:ℚₚ](n²+n(n+1)/2); rigidified n+[K:ℚₚ]n(n+1)/2; forgetful relative dimension n |
| 8.2 | BHS19 Def 4.1.3, p. 373, lines 2939–2945 | ω(x) algebraic (R03), conditions (i)–(iii), accumulation in the Bellaïche–Chenevier sense |
| 8.5 | BHS19 Prop 4.1.5, Rem 4.1.6, p. 373–374, lines 2962–2993 | de Rham hypothesis present; both formulas and the smoothness criterion as stated; U_w is the Schubert cell (line 472), its closure Ū_w in the README's bound |
| 10.5 | Ding25 Prop 2.5, Lemma 2.6, (2.7), p. 13, lines 554–596 | T_σ(h) replaces off-σ weights by h_(τ,n); refinement parameters; endpoints D₁,σ=T_σ(D₁), C₁,σ=T_σ(C₁) |
| 10.8 | Ding25 (2.7) "(surjective) map", p. 13, lines 585–590 | surjectivity asserted without injectivity |
| 11.6 | Ding25 P-filtration, (2.18), p. 18, lines 807–827 | graded ranks n_i, κ_(F_P) to ∏Ext¹(M_i,M_i), compatible refinements |
| 12.6 | Ding25 Cor 2.25 and the definition after it, p. 24, lines 1075–1090 | kernel inside Ext¹_g(D_σ,D_σ), independence of w, strictly smaller than the full kernel when K≠ℚₚ |
| 13.4 | Ding25 (2.36), Cor 2.31, p. 28, lines 1224–1232 | I_ι as the image of M↦(ι⁻M,−ι⁺M); rigidity ι′=aι |
| 13.13 | Ding25 definition before Cor 2.38, p. 31–32, lines 1356–1365 | V_σ and L_σ with Hom_σ; the source's "D_{2,σ}" is a misprint for C_{1,σ} (below) |

Further passages opened for the repairs and the adversarial rows: BHS19 lines 1510–1511, 2055–2060, 2118–2148, 2355–2360, 2680–2700, 2870–2898, 2920–2956, 3170–3200, 3236–3268, 3300–3360, 3385–3395, 262–285; BHSsmooth17 lines 612–656, 458–468, 720–729; BHS17 lines 240–260, 290–350; NT21 lines 1463–1490; DLB17 lines 1236–1262; Colmez08 lines 113–135, 695–722; Ding19 lines 2073–2129; Ding25 lines 375–400, 540–620, 770–830, 1060–1140, 1215–1300, 1340–1400.

**Adversarial pass (computed values).** A=E[ε]/ε² in infinitesimal rows.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 groupoid X_W | A=E; A=E[ε], rank one trivial | one class, automorphisms 1; ν=ε has ν²=0, charpoly X−ε≠X, distinct from ν=0 | sound; scheme nilpotent cone excluded |
| 2.1 lattice filtration | W⁺=B_dR⁺; t^aB_dR⁺ | Fil^i=K for i≤0, 0 for i>0; unique jump −a; Sen weight of W⁺/tW⁺ is a=−jump (BHS19 line 1510) | sound |
| 2.4 second model | h=(0,2), d=1; n=1, d=2 | 1+3=4=dn²; 0+2=2 | sound |
| 3.2 based parameter | δ versus δx; δ(1+εlog) | R[1/t](δ)≅R[1/t](δx); weights differ by ε, residues equal | sound |
| 4.5 three cases | N≠0; potentially crystalline; split | counts 1, 2, 2; critical counts 0, 0, 1; Tate extension: rank N=1 so one stable line | sound |
| 4.6–4.7 (R01) | P=1; P=0; unit line | ker=0; ker=D_rig; ∇1=0 gives ker X=E≠0 | mathematics sound; ownership R01 |
| 5.2 (F04) | ℚ₃, δ=unr(2)x², k=1,2,∞ | εδ⁻¹=x|x|·unr(1/2)x⁻²=unr(1/6)x⁻¹, nonalgebraic; ranks 1, 0, 0; dim H¹=d=1 | sound |
| 5.3 fibre product | rank one, derivative ε | κ=wt(ω)−wt(δ)=ε must equal ν=ε; ν=0 fails | sound |
| 6.3 dimensions | n=2,d=2; n=d=1 | 2(4+3)=14; 2+2·3=8; 8+8−2=14; 2 and 2 | sound |
| 7.2 node (F07) | A=E[[x,y]]/(xy) | y↦(0,y), kernel 0; single branch kills y | sound |
| 8.2 accumulation | p=2, weights (a+2^m,b−2^m) | gap a−b+2^(m+1)→∞; p-adic distance to (a,b)→0 | sound |
| 8.3 prefix bound (F08) | f=(δ₁⋯δ_i)(ϖ_K) on X_tri | on U_tri, ∧^iFil_i saturated in étale ∧^iD gives v_p(f)≥0; {|f|>1} is an admissible open inside the Zariski-closed complement of the dense U_tri, of lower dimension in equidimensional X_tri, hence empty | proof valid; closes the BHSsmooth17 gap |
| 8.3 induction | w_τ⁻¹ fixes 1..i−1 | summand k_(τ,i)−k_(τ,w⁻¹(i))≥0, nonzero one ≥ k_(τ,i)−k_(τ,i+1) > e·v_p(prefix) ≥ Σ_τ summands: contradiction, so w=1 | sound |
| 8.3 Checks | e=2,v=1,(4,1); d=2,(0,2),v=−3; n=1 unr(p); ramified finite-order χ | 3>2, gap 2 fails; −2>−3 each and −3≥−4, so induction alone allows w=s, prefix bound excludes v=−3; v(unr(p)(ϖ))=1 not étale; wt 0 but χ|O×≠1 excluded | sound |
| 8.5 bounds | n=2,d=1,w=s,w_x=e; n=3,d=1,w=w₀ | d_s=1, ℓ(s)=1: 7−1+1=7; d_(w₀)=3−dim{(a,b,a)}=1, ℓ=3: 15−1+3=17 | sound |
| 9.2 (F05) | S₂; N=[[0,1],[0,0]]; N=0 | P_(e,s)(1)=P_(e,e)(1)=1 so [fibre]=C_e+C_s; N≠0: unique stable line, w_x=e, Cartan 0, x∉Z_s; near a regular nilpotent X≅g̃_reg and the ideal (κ₁,κ₂)=(κ)=(a,d) is reduced, so [X_e∩κ⁻¹0]=Z_e and [X_s∩κ⁻¹0]=Z_e+Z_s with multiplicities 1, giving C_e=Z_e, C_s=Z_s; at x, C_s=0, C_e≠0; N=0: both nonzero | sound; zero term permitted |
| 9.6 codimension | n=2,d=1; n=2,d=2 | 8−(3+2)=3; 12−(6+2)=4; BHS19's exponent dn(n+3)/2 would give 10 and fibre 2, inconsistent with the flat fibre dimension 10−6=4 | README correct; source misprint recorded |
| 10.5 endpoints | n=3, off-σ (3,1,0) | weights (0,0,0); both endpoints (0,0), not (1,1) | sound |
| 10.8 surjectivity | d=1; d=2 | identity; two transverse off-σ flags give one D_σ | sound |
| 11.6 paraboline | blocks (2,1); P=G | graded (2,1), cumulative (2,3); one block, κ identity | sound |
| 12.6 modified kernel | n=2,d=2; n=3 | 1−2+1=0; full-refinement kernel (1+6)−6=1; n=3: 1 | sound |
| 13.4 relation | f=g=id_E | {(a,−a)}; (1,0) in product of ranges, not in relation; (1,1) excluded as 1≠−1 | sound |
| 13.6 κ_G (F06) | n=3,d=1 scalar twist | targets (2,5) versus (5,2); κ_G(D⊗R(1+εψ))=(C₁⊗R(1+εψ),ψ) | sound |
| 13.13 V_σ | n=2,d=2 | endpoints 2+2, scalars 2+2: dim V_σ=8; target 1+n²=5; relation 3=4+4−5 | sound |
| gap unrestricted-trianguline-variety | (n,d)=(2,1),(2,2),(1,d) | relative dimension n²+dn(n−1)/2−n = 3, 4, 0 = dim U_tri − n(d+1) | sound |
| gap general-character-spaces | G=ℤₚ disc coordinate; finite-order χ | d log(1+T)/dT=1/(1+T), unit on the disc, so wt is étale; wt=0 iff locally constant iff finite order on compact O_K× | sound |
| gap partial-de-rham-cohomology | Ding19 (54) | dim H¹_(g,J)=[L:ℚₚ]rkW+dimH⁰(W)+dim H̃²_J(W)−dim H⁰(W⁺_dR,J), H̃²_J a positive J-twist | matches |
| PhiGamma §4.0 contract | K=ℚ₂; general K | O_(ℚ₂)×={±1}×(1+4ℤ₂): two components of dimension 1; dim T=d+1 | sound |
| Mathlib locators | eight declarations | 95, 57, 59, 171, 173, 53 exact; 31≠30, 45≠44 | R05 |

**Gaps.** Fourteen gaps; the same fourteen slugs with identical `needs` and suppliers in `design/plan.json` and the README (checked mechanically); none has supplier `none`; each is used by at least one `*Needs:*` line. Each `needs` sentence is single-purpose with its hypotheses: the three analytic gaps replace the compound one of round 1; `dominant-trianguline-semistability` now carries the unit restriction; `general-character-spaces` asks only for étaleness of wt and Zariski accumulation, which PhiGamma §§4.0, 7.3 at head #1310 do not state; `unrestricted-trianguline-variety` asks exactly what CCLGC §5.2a (head #1270, lines 1831–1851) does not state. `polynomial-connection-finiteness` is precise and consistent with DLB17 line 1253, which cites the finiteness externally; its fate follows R01.

**Library declarations opened at the pins** (Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039): `LinearMap.prod` (Mathlib/LinearAlgebra/Prod.lean:95), `LinearMap.range` (Algebra/Module/Submodule/Range.lean:57), `LinearMap.ker` (Algebra/Module/Submodule/Ker.lean:59), `LinearMap.finrank_range_add_finrank_ker` and `Submodule.finrank_sup_add_finrank_inf_eq` (LinearAlgebra/FiniteDimensional/Lemmas.lean:173, 53, both with finite-dimensionality hypotheses), `AdicCompletion` (RingTheory/AdicCompletion/Basic.lean:171), `Module.length` (RingTheory/Length.lean:30, valued in ℕ∞), `AlgebraicGeometry.AlgebraicCycle` (AlgebraicGeometry/AlgebraicCycle/Basic.lean:44, locally finite functions, no rational equivalence). Tau Ceti at the pin has no Robba ring, (φ,Γ)-module, B_dR, de Rham or crystalline carrier (grep over `TauCeti/**/*.lean`: 0 files), so the docstring's "not statable" verdicts hold.

**Cross-roadmap citations resolved** (roadmap service, main 20b02f6, open heads of 2026-10-25): PhiGammaModulesAndIwasawaCohomology #1310 §§1.0c, 1.1–1.2, 3.1, 3.4a, 3.8–3.9, 4.0, 7.1–7.8 (lines 617–2543) with `compactCharacterSpace`, `localMultiplicativeCharacterSpace`, `CharacterWeights`; PadicHodgeTheory #1062 §§3.2, 4.3–4.5, 5.2, 6.3 (lines 660–1200) with `fullRankQuotient_H0` (line 932); LocalGaloisDeformationRings #923 §§0.4, 1.1, 1.4, 1.12, 1.18, 1.23, 3.4, 3.6, 3.10, with §1.23's dimensions 1+d²f, 1+d(d+1)f/2, 1+d(d−1)f/2 equal to the README's 1+n²d, 1+dn(n+1)/2, 1+dn(n−1)/2; CompletedCohomologyAndLocalGlobalCompatibility #1270 §5.2a; ModularityAndLanglandsExtensions #1180 §4.3; PadicDifferentialEquationsAndRigidCohomology #1002 §RD.2.43; DeformationAndDerivedPatchingAlgebra #1034 §§1.6–1.9, 1.11, 1.13–1.14, 2.1–2.7, 3.1–3.2; SchemeAndStackFoundations (main) §§0.16–0.21, 4.3–4.5; RigidAnalyticGeometry (main) §§1.2, 7.3, 8.1–8.3 (no openness of the normal, CM or flat loci there, so the three analytic gaps are needed); AdicSpacesPartII (main) R1.1, R1.5, R1.7, R1.9; PadicFunctionalAnalysis (main) §§5.1–5.3; PadicMeasuresIwasawaAlgebras (main) §3a.1; the board designs SpringerResolutionAndCharacteristicCycles (all 24 cited target ids present), LocallyAnalyticRepresentationsOfLocalGroups (LR.4/principal-series and the five LR.5 targets present) and PadicHodgeParametersInLocallyAnalyticRepresentations (TR1–TR5 present, naming this roadmap). The resolver lists no unresolved citation or Lean name.

**Ownership.** `roadmaps grep` for "trianguline variety", "local model for the trianguline", "higher intertwining", "accumulation property", "companion point" and "double-flag" finds no owner other than the suppliers cited (CCLGC, LGDR, PhiGamma mention the variety as consumers or inputs). CompletedCohomologyAndLocalGlobalCompatibilityPartII's design review cites this roadmap's refined crystalline space as a supplier, consistent with the merge order. The one overlap found is R01.

**Supplier order.** The dependency check, run as prescribed:

```text
depcheck: 52 roadmaps, 594 edges, 0 problem(s)
```

Exit 0; no UPWARD, CYCLE or moved line. Merge positions: suppliers at 2–302, this roadmap at 303, the only consumer at 304. Every `*Needs:*` line was read; internal references point to earlier sections (§11.7 explicitly defers the spanning argument to after §13.8, avoiding the cycle).

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (per supplier), How to read the build, thirteen layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Every definition (sections with a "reusable interface" list) has at least three Checks (counts 3–6); theorem sections carry hypotheses, a locator and a `*Needs:*` line.

**Lean.** `lake env lean` on `packages/TriangulineVarietyAndItsLocalModel/Suggested.lean` from the content checkout: exit 0, no output (4.7 s). Single `import Mathlib`, one module docstring, an empty namespace `TauCetiRoadmap.TriangulineVarietyAndItsLocalModel`; no declaration, no `sorry`, no `lemma`, no `set_option`, no `TauCeti.*` import. The seventeen headline groups of the README are each named in the docstring with the missing carrier; none is statable at the pins (no period, Robba or trianguline carrier exists there), and no stand-in is written. With no declaration the `#check @name` comparison and the one-tactic probe have no cases; there is no padding to delete. No Lean process was left running.

## Not verifiable

- Board package READMEs at the heads in `board-packages-index.txt`: PadicHodgeTheoryPartII (6502997), CompletedCohomologyAndLocalGlobalCompatibilityPartII (777a863), PadicLocalLanglandsForGL2QpPartII (3e0777d), HigherHidaAndColemanTheory (519048f), OrdinaryAutomorphicFormsAndModularityLiftingPartII (7e88c38) and ArithmeticLocallySymmetricSpacesPartII (c1b8f80) returned HTTP 404 both at the listed head and at the listed branch; their local folders hold only `reports/`. Ownership against those READMEs is certified only through their local design-review reports (which gave R01). The other indexed packages were not opened except AutomorphicCongruences and KatoEulerSystems, which contain no trianguline, local-model or intertwining text.
- No sampled source text was inaccessible; no manifest entry was added or changed; no `needs-references.toml` request was needed.

## Source issues

- **Misprint** in BHS19 at Theorem 1.9, printed p. 305, Conjecture 4.3.4, p. 381, (4.12), p. 382, and the proofs of Proposition 4.3.7 and Theorem 4.3.8, pp. 383–385: the source says the full-character cycles have codimension [K:ℚₚ]n(n+3)/2 in the framed deformation space; it should be [K:ℚₚ]n(n+1)/2+n, the two agreeing only for K=ℚₚ; affects a stated result.
- **Misprint** in Ding25 at the definition preceding Corollary 2.38, printed p. 31: the source says the relation is indexed by the endpoints D_{1,σ} and D_{2,σ}; it should be D_{1,σ} and C_{1,σ}, as in (2.42) and Proposition 2.39; affects nothing.
- **Misprint** in BHSsmooth17 at the proof of Lemma 2.10, printed p. 15: the source says the prefix product of the saturated parameter at ϖ_K has absolute value at least one; it should be at most one (valuation at least zero), which is what its inequality (2.13) uses; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6d21a0c906003ca49e0925744c9c95139d4aad56", "job": "REV-PKG-TriangulineVarietyAndItsLocalModel~2", "model": "fable", "worker": "chris-i"} -->
