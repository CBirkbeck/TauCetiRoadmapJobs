<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1289#issuecomment-6396233867 -->
Review (claude) of 6b12a11

Verdict: needs changes

1. **F01** (P1) The Part I this "part II" extends still exists nowhere

   - **Location.**
     - `packages/ExcursionOperatorsAndSpectralActionPartII/README.md:1`: "# Roadmap: excursion operators and the spectral action, part II".
     - README:3: "Starting from the Fargues–Scholze spectral action, this roadmap proves…".
     - README:7: "The universal spectral action is outside this scope."
   - **Claim.** The roadmap extends an existing base, and its subject includes the spectral action.
   - **Witness.** There is no `ExcursionOperatorsAndSpectralAction` anywhere: not on main (`TauCetiRoadmap/`, `Completed/`), not at the 355 open heads (`roadmaps grep` finds citations only), not in the board checkout or index, not in ORDER (only the PartII entry at line 287). HS README:24 and README:2560 still credit it with ES1 finite ramification, which §0.0 now owns. LP README:19 credits it with the universal spectral actions, which nobody owns.
   - **Repair.** Renaming a job's package is a maintainer decision, which the fix worker cannot make. The maintainer chooses one of:
     - (a) Rename the package to a standalone roadmap, for example `ExcursionOperatorsAndStableBernsteinCentre`, titled "excursion operators and the stable Bernstein centre". This drops "PartII" from the folder, title, namespace and docstring title. §0.0 already carries everything a base would supply.
     - (b) Create the base roadmap first, move §0.0 into it, and cite it.

     Independently of that decision, the fix worker now makes two edits:
     - Replace README:3's opening clause with "Starting from the Fargues–Scholze excursion centre map Ψ_G of §0.0,".
     - Replace README:7's last sentence with "The universal spectral action of FS24 Chapter X is used by no target here."
   - **Test.** Neither edit adds a supplier, so depcheck stays at 0 problems. The local `§0.0` citations in §§1.2, 1.4, 1.5, 3.3, 4.3, 5.1–5.3 and 6.1 are unaffected.

2. **F02** (P2) gap:normalized-bernstein-levi asks SR for an identity in I(M), which SR cannot state

   - **Location.** README:63: "and (z∗f)_M=r_M(z)∗f_M in I(M)". README:25 defines I(G) as "H(G) modulo the common kernel of regular orbital integrals".
   - **Claim.** SR §SR.3.2 can state this constant-term identity.
   - **Witness.**
     - SR (ORDER 26) has no orbital integrals: a search finds none, and SR README:112 says Plancherel theory is not there.
     - Regular orbital integrals are ETUTC §2.1 (README:686, ORDER 163).
     - The identity serves only the cuspidality of z∗f, which gap:arthur-stable-decompositions already requests.
   - **Repair.** In README:63 and in the plan's `gaps`, replace "and (z∗f)_M=r_M(z)∗f_M in I(M)" with "and tr σ((z∗f)_M)=tr σ(r_M(z)∗f_M) for every irreducible smooth σ of M(E) and every f∈H(G), with f_M the normalized constant term (H26 line 207)".
   - **Test.** Take G=GL₂, M=T, and z acting by 2 on the block of i_B(χ). Both sides equal 2·tr(f | i_B χ), which SR can state with its SR.0.4 characters.

3. **F03** (P2) gap:bounded-elliptic-orbital-integrals asks for boundedness ETUTC already plans

   - **Location.** README:89: "prove boundedness of |D_G(t)|^(1/2)O_t(f) on the strongly regular elliptic locus of T(E) and compactness of its support closure".
   - **Witness.** ETUTC §2.1's interface bullet `TauCeti.normalizedOrbitalIntegral_bounded` (README:698) says that, for fixed f, the normalized orbital integral J_G(·,f) is bounded on G_reg(F). H26 line 489 uses exactly this fact.
   - **Repair.**
     - Replace the needs with: "For every f∈H(G) and elliptic maximal E-torus T, prove that the closure in T(E) of {t∈T(E)∩G(E)_ell : O_t(f)≠0} is compact (H26, §2.3, p. 10; H26 line 486)."
     - Add to README:79: "§2.1 `TauCeti.normalizedOrbitalIntegral_bounded` supplies boundedness of |D_G|^(1/2)O_γ(f) on G_reg(E); for elliptic T, H26's A_G(E)\G(E) normalization differs by the finite factor vol(T(E)/A_G(E))."
   - **Test.** For a torus G=T, O_t(f)=vol·f(t). This is bounded, and its support closure is supp f, which is compact.

4. **F04** (P2) gap:stable-orbital-inversion-duality is compound and has no locator

   - **Location.** README:95: "provide invariance of U(G) under inversion and of the Weyl discriminant under stable conjugacy, and the sign-normalized identity Θ(f*)=Trans_G(Θ)(f)…".
   - **Witness.** The sentence carries three unrelated obligations, each with its own consumer:
     - inversion invariance, used by §0.3;
     - discriminant invariance, used by §2.5 (H26 line 398);
     - transfer duality, used by §6.2 (H26 lines 632–636), whose Trans_G is gap:stable-inner-character-transfer.

     It is the only one of the twelve needs sentences without a locator.
   - **Repair.**
     - Narrow the needs to: "For every connected reductive G/E and strongly regular γ, prove SO_γ(f^vee)=SO_(γ⁻¹)(f), so f↦f^vee preserves U(G)."
     - Add to gap:stable-inner-character-transfer: ", and Θ(f*)=Trans_G(Θ)(f) for Θ∈SD_temp(G*) and f*, f with matching stable orbital integrals for the factor e(G) (H26, §2.4, p. 13; H26 line 597 and line 632)".
     - State discriminant invariance in §2.5 from ETUTC §1.3, since stable conjugacy is conjugacy over Ē.
     - Repoint the Needs lines of §§0.1–0.5, 3.2, 4.1, 6.1 and 6.2 to the part each one uses.
   - **Test.** For a torus, SO_t(f^vee)=f(t⁻¹)=SO_(t⁻¹)(f).

5. **F05** (P2) gap:basic-weight-invariant-fibres bundles three contracts

   - **Location.** README:103, which consists of three semicolon-separated clauses.
   - **Witness.** The three clauses have different sources and consumers:
     - the inv[1] comparison (HKW22 line 631), used by §§2.3 and 2.4(b);
     - the existence and uniqueness of [g_b] (HKW22 line 649; FU25 line 955), used by §§1.3, 1.6 and 2.3;
     - the Levi lift b_M (H26 line 116), used by §§5.1, 5.3 and 6.1.

     The phrase "compatibly with their spectral-centre identifications" names no object. The bundling came from the round-1 repair text.
   - **Repair.** Split it into three BunG slugs:
     - `basic-invariant-comparison`: "Identify HKW's inv[1] with the stable-class invariant of EndoscopicTransferAndUnitaryTraceComparison §1.14 under B(T)≃X_*(T)_Γ (§1.36), integrally with torsion (HKW22, Definition 3.2.2, p. 14; HKW22 line 631)."
     - `weight-fibre-classes`: "For strongly regular elliptic g∈G(E), basic b∈B(G,μ) and each weight λ of V_μ, prove existence and uniqueness of the G_b(E)-class [g_b] stably conjugate to g with inv[b](g,g_b)=λ̄ (HKW22 Remark 3.2.5, p. 14; FU25 Lemma 4.2.7, pp. 24–25; HKW22 line 649; FU25 line 955)."
     - `basic-levi-lift`: "For quasi-split G*, basic b∈B(G*) and each E-rational Levi M of G*_b, provide a standard Levi M* and basic b_M∈B(M*) mapping to b with M≃(M*)_(b_M), compatibly with the L-group identification of ReductiveGroupsPartII §RG2.5 (H26 line 116 and line 566)."

     Update the plan's `gaps` and the Needs lines.
   - **Test.** Take GL₂ and D×, with μ=(1,0).
     - The weights (1,0) and (0,1) both map to λ̄=1 in X_*(T_g)_Γ=ℤ, and one class [g_b] exists, which gives −2·3=−6 in §1.6.
     - The Levi lift is M=D×, M*=GL₂ and b_M=b.

6. **F06** (P3) §0.0 packs five FS24 theorems into one target and never defines its source ring

   - **Location.** README:125–159. README:21: "Ψ_G:Z_spec(G)→Z(G) for the spectral map".
   - **Witness.**
     - §0.0 states five FS24 theorems under one Needs line: finite ramification (Proposition IX.5.1), the centre map with Hecke commutation (Theorem IX.5.2), basic restriction (Theorem IX.7.2), parabolic compatibility (Corollary IX.7.3) and the parameter (Definition/Proposition IX.4.1).
     - Z_spec(G) appears at README:21, 127, 129, 136, 491 and 586 and is defined nowhere (H26 line 64; FS24 line 1276).
     - README:145 "Establish the continuity input" asserts nothing.
   - **Repair.**
     - In Conventions, add: "Z_spec(G)=O(Z¹(W_E,Ĝ)_(ℚ̄_ℓ))^Ĝ, the global functions on the stack of L-parameters, the product over the clopen finite-wild pieces of LanglandsParameterStacks LP1.2 (FS24, Definition I.9.2(iii), p. 35; FS24 line 1276)."
     - Label §0.0's statements (a)–(e) in the order above, each with its own Needs line, and keep §0.0 as the locator.
     - Replace "Establish the continuity input" with: "for compact A and each excursion datum, the excursion operator depends continuously on (γ_i)∈W_E^I for the relatively discrete coefficient topology (FS24, Definition/Proposition IX.4.1, p. 327; FS24 line 12667)."
   - **Test.** For GL₁, the unramified piece gives ℚ̄_ℓ[t,t⁻¹]. The §0.0 Check value t↦2 is an evaluation of this ring.

7. **F07** (P3) Two Needs lines omit suppliers their routes name

   - **Location.** README:159 (§0.0) and README:582 (§5.1).
   - **Witness.**
     - §0.0's route uses three HS inputs: the left adjoint of stratum restriction (HS3.10, README:2070), continuous Weil descent (HS1.8–HS1.9), and the wild-inertia closure with continuous export (HS4.7, README:2533). Its Needs line lists only HS1.1–HS1.7 and HS4.1–HS4.2.
     - §5.1's route (README:575) names ETUTC §§1.6(ii)–(iii) and BunG §1.23. Its Needs line lists neither, and lists "BunGAndNewtonStrata §1.18" twice.
   - **Repair.**
     - Add "HeckeStacksAndLocalShtukas §§HS1.8–HS1.9, §HS3.10, §HS4.7" to the §0.0 Needs line and to the HS contract at README:71.
     - Add "EndoscopicTransferAndUnitaryTraceComparison §1.6; BunGAndNewtonStrata §1.23" to the §5.1 Needs line, and delete the duplicate §1.18.
   - **Test.** All three suppliers are earlier in ORDER (163, 240, 243), so depcheck stays at 0 problems.

8. **F08** (P3) Two gaps ask for what their suppliers nearly provide

   - **Location.** README:61 (gap:bernstein-distribution-realization). README:73: "prove bounded finite-length cohomology and…".
   - **Witness.**
     - SR §SR.1.3 *bernstein-centre-corners* (README:1309) gives Z(G,Λ)≅lim_K Z(H(G,K;Λ)).
     - HS3.8 (README:1960 and README:1967) gives X(ρ)≃𝔻_lis(i^(1*)T(i^b_![ρ∨])) for basic b, and finite length of X(ρ) over ℚ̄_ℓ. Together with HS3.10's compactness, this makes the shriek output finite length.
   - **Repair.**
     - Cite SR §SR.1.3 *bernstein-centre-corners* at README:59.
     - Narrow gap:bernstein-distribution-realization to reading lim_K Z(H(G,K;ℂ)) as essentially compact invariant distributions with z(f)=(z∗f^vee)(1).
     - Delete "bounded finite-length cohomology and" from gap:all-weight-shriek-trace.
     - Add to §§1.1 and 1.4: "finite length follows from HS3.8's duality and HS3.10's compactness preservation, compact objects being reflexive."
   - **Test.** For μ=0 and b=1, the shriek output is the identity functor, and HS3.8's own note gives X(ρ)=ρ.

9. **F09** (P3) Residue of the §4.4 deletion

   - **Location.** README:551: "for nonempty regular supercuspidal L-packets Π_φ(G) of Kaletha whose character sums are atomically stable…". README:667: "## Source issues".
   - **Witness.**
     - `roadmaps grep -i 'regular supercuspidal'` finds no owner on main, at the open heads or in the board packages.
     - No roadmap on main has a "Source issues" section; it is outside the house shape.
   - **Repair.**
     - Replace README:551 with: "The statement applies to any finite set of irreducibles whose character sum is atomically stable; H26 Corollary 1.3 (p. 2; H26 line 79) is this instance for Kaletha's regular supercuspidal packets, whose construction and atomic stability are not targets here."
     - Delete README:667–669. Add one clause to the FKS21v2 reference: "Theorem 4.4.4 states stability and endoscopic identities only for the specified part of S_φ⁺, under §4.3's convergence assumptions, and states no support minimality (FKS21v2 line 993, line 1281 and line 1299)."
     - Repoint "see Source issues" (README:551) to that reference.
   - **Test.** No target depends on Kaletha's construction. The §4.1 torus Check remains the separating example.

10. **F10** (P3) Locators

   - **Location.**
     - README:431: "with the quantitative Fourier deduction in H26 line 393".
     - Suggested.lean:39–40: "the Fourier estimate in H26 Lemma 2.6".
     - README:93, 97, 467 and 675: "HKW22, Lemma 3.1.1 …, pp. 12–13".
     - README:674: "Lemmas 3.2.1–3.2.3: pp. 20–21".
   - **Witness.**
     - H26 line 393 quotes the C/m rate from Fu's proof without deducing it.
     - FU25 lines 1085–1092 prove only a limit, by a degree comparison.
     - The lemma and proof of HKW22 Lemma 3.1.1 lie on p. 13 (lines 577–607; the page markers are at lines 566 and 609).
     - FU25 Lemmas 3.2.1–3.2.3 lie on p. 20 (lines 794–814).
   - **Repair.**
     - README:431: "(deduced here from FU25 Lemma 3.1.2 and the degree bound in the proof of Proposition 3.3.1, pp. 18–21, FU25 line 719 and line 852; H26 uses the C/m rate in the proof of Lemma 2.6, H26 line 393)".
     - In the Lean docstring, write "deduced from FU25 Lemma 3.1.2 and Proposition 3.3.1".
     - Change "pp. 12–13" to "p. 13" and "pp. 20–21" to "p. 20".
   - **Test.** The page markers in the extractions agree with the corrected pages.

Ten findings: one P1, four P2 and five P3, so five are blocking.

Thirteen of the fourteen round-1 findings are repaired, and so is the main supply defect: the centre map Ψ_G is now owned locally in §0.0. The added acceptance theorem elaborates, keeps all its binders and is not padding. No hidden cycle was found. Three problems remain:

- **R01.** The Part I that this "part II" presupposes still exists nowhere. Resolving this needs a maintainer decision.
- **R02–R05.** Three gaps are compound or ask for what is already provided, and one cannot be stated by its supplier as written. Two of these defects were introduced by the round-1 repair text.
- **R06–R10.** Five style and completeness notes.

Abbreviations:

- ETUTC is EndoscopicTransferAndUnitaryTraceComparison.
- HS is HeckeStacksAndLocalShtukas.
- LP is LanglandsParameterStacks.
- SR is SmoothRepresentationsOfLocalGroups.
- BunG is BunGAndNewtonStrata.

Supplier README line numbers are at the open heads indexed on 2026-10-25. ReductiveGroups and RepresentationTheory/LieHighestWeight line numbers are on main (6ef1bbd).

## Status of the round-1 findings

| Round-1 | Repaired passage (current README) | Status |
|---|---|---|
| F01 base roadmap exists nowhere | README:7 "The geometric Hecke family comes from HeckeStacksAndLocalShtukas HS1 and HS4; the abstract excursion centre map … come from LanglandsParameterStacks …" (no base cited) | partly repaired: the citation is gone, but the title "part II" still has no Part I (R01) |
| F02 Ψ_G unowned | README:125–127 "### 0.0 The Fargues–Scholze centre map … specialize LanglandsParameterStacks LP2e.15 to the continuous finite-set Hecke action" | repaired (owned locally). New defects R06, R07 |
| F03 normalized-spectral-levi unstatable | README:63 gap:normalized-bernstein-levi; README:136 spectral compatibility in §0.0 | repaired. The new needs sentence has the defect R02 |
| F04 harmonic-analysis gap creates a cycle | README:81–91: six slugs on ETUTC; README:61 the distribution realization alone stays on SR | repaired. New defects R03, R08 |
| F05 atomicity gap / §4.4 | README:551 "atomicity … is an explicit assumption here"; §4.4 deleted | repaired. Residue R09 |
| F06 Levi lift unowned | README:103, clause "provide a standard Levi M* of G* and basic b_M∈B(M*) mapping to b"; Check at README:579 | repaired. The gap became compound (R05) |
| F07 statable headline missing | Suggested.lean:44 `weightPushforward_sum_abs_sub_uniform_le`; README:431 | repaired (elaborates, binders kept, five one-tactic probes fail) |
| F08 rebuilt group-to-Lie comparison | README:382 "Use ReductiveGroups Layer 10B for L(μ_m)=V_(μ_m)"; no "group-to-Lie" left | repaired |
| F09 already-supplied gap clauses | README:93 (torus finiteness only); README:399 (acceptability is now a local Check) | repaired |
| F10 compound shriek gap | README:73 (finite length and the trace formula only) | repaired. Finite length is nearly supplied (R08) |
| F11 weak Checks | README:200 (GL_n Check); README:603 (torus τ Check); README:605 "ℂ×ℂ→ℂ" | repaired |
| F12 printed-proof locator | README:537 "H26 states Corollary 1.2 without a printed proof, p. 2, H26 line 77" | repaired |
| F13 §4.3 Needs | README:559 "LanglandsParameterStacks §LP2c.5; LanglandsParameterStacks §LP2c.8" | repaired |
| F14 second stability notion | README:27 "stable in the sense of EndoscopicTransferAndUnitaryTraceComparison §2.4 (`TauCeti.IsStableDistribution`)"; README:163 | repaired (`TauCeti.IsStableDistribution` is ETUTC's planned name, ETUTC README:778; it is not at the pin) |

How the two key questions were resolved:

- **Ψ_G.** This roadmap now owns Ψ_G in §0.0. That agrees with the suppliers' own boundaries:
  - HS README:24 and README:2560 leave the finite-ramification theorem and spectral centres to a consumer.
  - LP README:602 leaves "the Bernstein-centre application" to consumers.
  - SR README:101 excludes the map to the smooth centre.
- **Cycles.** No supplier consumes this roadmap or anything §0.0 owns:
  - LP README:19 says "nothing here imports the spectral action".
  - HS imports no excursion object.
  - All suppliers are earlier in ORDER: SR 26, LP 75, GeometricSatakeAndFusion 148, ETUTC 163, BunG 240, HS 243, ReductiveGroupsPartII 24. This roadmap is at 287.

## Adversarial pass

Every row gives the values computed on both sides.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Convolution and inversion | central t, f(t)=1, f(t⁻¹)=0 | (δ_t∗f)(1)=f(t⁻¹)=0; δ₁(δ_t∗f^vee)=f(t)=1 | inversion necessary | none |
| Normalized induction | GL₂, diag(ϖ,1), q=2, torus values 2,3 | δ_B=1/2; √2·5=7.071; the inverse modulus gives 5/√2=3.536 | normalization fixed | none |
| Kottwitz sign | GL₂/D×, μ=(1,0) | ⟨e₁−e₂,(1,0)⟩=1→−1; ETUTC §1.13: r(GL₂)−r(D×)=1→−1; doubled full sum gives +1 | agree | none |
| Hecke label | G_m, weight ±1 | d→d±1; HS3.10 torus test κ(b)=κ(b′)−n | consistent | none |
| §0.0 unit and zero | trivial datum; zero creation | 1↦1; 0↦0 | zero map excluded | none |
| §0.0 GL₁ parameter | χ(ϖ)=2 | geometric Frobenius 2; arithmetic 1/2 | the inverse convention is detected | none |
| §0.0 basic restriction | T=GL₁, deg b=1 | J_b=T(E); FS twist 2ρ_Ĝ−2ρ_Ĝb=0 | Ψ^b_T=Ψ_T | none |
| §0.0 parabolic | GL₂⊃T, (2,3) | res(trace)=5; twist (2ρ)(√q) against δ^{1/2} parameter (2ρ)(√q)⁻¹ cancel | normalized compatibility holds | none |
| §0.0 parameter | diag(2,3), diag(3,2), diag(2,4); unipotent | (5,6), (5,6), (6,8); unipotent (2,1)=trivial | semisimplicity needed | none |
| §0.0 Z_spec | GL₁ unramified piece | Z¹=G_m, ring ℚ̄_ℓ[t,t⁻¹], t↦2 | object undefined | R06 |
| §0.1 Z_st | torus; 0; δ₁; ℂ² | U(T)=0; 0(u)=0; δ₁ vanishes on U (Kot88 via gap); a−b | correct | none |
| §0.1 = ETUTC §2.4 notion | weak-* duality | annihilator of ∩ker SO_γ = weak-* closure of span SO_γ | equivalent | none |
| §0.2 Z_vst | GL_n; diag(1,0) | D(T,GL_n)=0, U = null, Θ_π(z∗f)=z_π·0=0; (1,0)∉U | correct | none |
| §0.3 | δ₁; y=(3,3), z=2 | δ₁(f)=0; (6,6), 6−6=0 | correct | none |
| §0.4 | diag(2,2), diag(1,0) | (2,−2)∈U, (2,2)∈S; (1,0) in neither | both directions | none |
| §0.5 | torus | z∗f^vee=0 ∀f → z(f)=0 | faithful | none |
| §1.1 | degrees 0,1 of dimensions 2,1 | 2−1=1; shift −1; sum 1+1=2 | Euler additivity | R08 |
| §1.2 | diag(1,2), swap on (1,1) | (2,1) against (1,2) | non-geometric operator excluded | none |
| §1.3 | stable value 3, dim 5 | 15−15=0; induced 0→0 | correct | none |
| §1.4 | GL₁, μ=1 | labels −1, +1; dimensions 1, 1 | direction not determined by dimension | none |
| §1.5 | scalar 2, transfer −2 | −4=−4; target 3 gives −6 | correct | none |
| §1.6 | GL₂/D×, μ=(1,0), value 3 | weights→λ̄=1 (one class); −1·2·3=−6 | correct | R05 |
| §2.1 Av | 2,6; singleton 2; weights ¼,¾ | 4 (8 undivided); 2 (1 with a spurious 0); 5≠4 | correct | none |
| §2.2 μ_m | A₁ m=1; B₂ m=1 | 2α, d=5 (2mρ gives 3); coroot sum (4,2), μ₁=(8,4), d=625 | dual-root convention correct | none |
| §2.2 product formula | A₁ m=1 | A_{5ρ}/A_ρ=e^{−2α}+…+e^{2α} (5 terms) | correct | none |
| §2.2 acceptability | GL₂ μ=(1,0),(1,−1) | κ=1 excludes 1; κ=0 includes 1 | correct | none |
| §2.3 C_m | SL₂ elliptic T: H_g=ℤ/2; m=1,2 | (3/5,2/5), (5/9,4/9), each of mass 1 | correct | none |
| §2.3 GL₂ | X_*(T)_Γ=ℤ≅π₁ | H_g=0, coefficient 1 | correct | none |
| §2.4(a) Lean | sl₂, A=ℤ/2, m=1,2,10 | ℓ¹=1/5, 1/9, 1/41 ≤ (1/4)/m = 0.25, 0.125, 0.025 | holds | none |
| §2.4(a) Lean | sl₃, A=ℤ/2, φ(α)=1, φ(β)=0 | Fourier value 1·(4m+1)·1/(4m+1)³; ℓ¹=1/(4m+1)², 1/25 at m=1 | holds | none |
| §2.4(a) Lean | sl₂, A=ℤ/3 | m=1: (1/5,2/5,2/5), error 4/15 ≤ bound 2·(2/√3)/5=0.462; m=2 uniform, error 0 | holds | none |
| §2.4(a) controls | m=0; φ=0; L=0 | error 1 against C/0=0; error 1 at every m; A=0, dim M=1, error 0 | hypotheses needed; rank 0 non-vacuous | none |
| §2.4(a) padding probe | simp, aesop, norm_num, positivity, exact ⟨0,…⟩ | all fail (unsolved goals; not a positivity goal; aesop rule limit) | not padding | none |
| §2.5 | values 2,6, discriminant 1 | 18/5, error 2/5; 34/9, error 2/9; bound 6/5 | correct | none |
| §3.1 | SL₂ Weyl element, diag(ϖⁿ,ϖ⁻ⁿ) | off-diagonal valuations 2n, −2n | orbit unbounded | none |
| §3.1 route | SL₂ elliptic T, D=ℤ/2 | U=j₀(C_T)∪j₁(C_T) is compact; j₀(t), j₁(t)∈U | both classes are represented | none |
| §3.2 | measure 2, bounds 3 and 5/m | 30/m; f=0 gives 0 | correct | R03 |
| §3.3 | \|c\|≤30/m | c=1 fails at m=31 | constant vanishes | none |
| §4.1 | span{(1,2,0),(1,1,1)} | (a+b,2a+b,b): no proper 0/1 subsum lies in it; (1,2,0) has support 2 | arbitrary coefficients needed | none |
| §4.2 | (1,2), eigenvalues 3,5 | (3,10)−3(1,2)=(0,4) | rigidity | none |
| §5.1 | D×, κ=1 | no proper Levi; −1·2·3=−6≠0 | correct | R05, R07 |
| §5.2 | ℂ[X] with id, ev₀; pr₁, pr₂ | X↦0, X+2↦2; (0,1) forces τ(0)=1 | kernel direction detected | none |
| §5.2 torus | T, b≠1 | T_b=T, τ=id | correct | none |
| §5.3 | M=G; a=0,1 | both composites are τ_G; 0, 1 | correct | none |
| §6.1 | e=−1, scalar 2, value 3 | −6=−6; irrelevant summand 0 | correct | none |
| §6.2 | a=3 | 6 and −6; irrelevant 0 | correct | none |
| gap stable-inner-character-transfer | GL₂/D×, Steinberg | θ_St=−1 on elliptic set; e(D×)θ_St=+1=θ of 1_{D×} | agrees with Jacquet–Langlands | none |
| gap normalized-bernstein-levi | GL₂⊃T, z=2 on the block | trace form 2·tr(f\|i_Bχ) on both sides | trace form statable in SR | R02 |
| gap bounded-elliptic-orbital-integrals | G=T | O_t(f)=vol·f(t), bounded, compact support | boundedness already in ETUTC §2.1 | R03 |
| gap stable-orbital-inversion-duality | torus | SO_t(f^vee)=f(t⁻¹) | three facts in one sentence | R04 |
| gap elliptic-torus-representatives | GL₂(ℚ_p), p odd | split plus three quadratic E′: 4 classes | finite | none |
| gap kazhdan-cuspidal-decomposition | torus | null space 0, I(T)=H(T)=cuspidal | correct | none |
| gap unstable-tempered-separation | SL₂ elliptic, O_γ=1, O_γ′=−1 | SO=0 with O^κ=2≠0, so U≠0 | non-vacuous | none |
| gap stable-tempered-projection | two classes with values 2, 6 | elliptic value 4 | correct | none |
| gap all-weight-shriek-trace | μ=0, b=1 | identity functor; X(ρ)=ρ | finite length derivable | R08 |

Degenerate inputs checked:

- N=0: d_m=1, H_g=0, error 0.
- m=0 is excluded from every estimate.
- q=2, ℓ=3: √2∈ℂ.
- The zero ring, q=1 and ℓ=p are excluded by the Conventions.
- A non-quasi-split G is allowed in §3.3 (H26 line 72).

## Verified sound

- **Sampled locators (15/15), each read at its locator in the cache:**
  - 0.0: FS24 lines 1253, 1282, 12667, 12683, 12745, 12950, 12977, 12994, 13097. Printed pages 34–35, 327–329, 334–335 and 337–338 match the headers.
  - 1.2: H26 line 305 (Lemma 2.4, p. 7).
  - 1.3: H26 lines 338–362 (Proposition 2.5, pp. 7–8).
  - 1.5: H26 line 413 (Proposition 2.7(i), p. 9).
  - 1.6: H26 line 415; HKW22 line 3190 (Theorem 6.5.2, pp. 65–66).
  - 2.2: H26 line 365; FU25 lines 719–776 (Lemmas 3.1.2–3.1.3, pp. 18–19).
  - 2.5: H26 lines 368–407 (Lemma 2.6, pp. 8–9).
  - 3.1: H26 line 505; HKW22 lines 577–607 (page: R10).
  - 3.2: H26 lines 470–520.
  - 3.3: H26 line 70 and lines 438–520.
  - 4.1: H26 lines 74–76. The README's arbitrary-coefficient reading is equivalent.
  - 5.1: H26 lines 522–565.
  - 5.2: H26 line 114.
  - 5.3: H26 lines 566–585.
  - 6.2: H26 lines 628–638.

  Every hypothesis agrees. The README's strengthenings to a C/m rate for all m≥1 hold: the ℓ¹ distance of two probability vectors is at most 2, so finitely many initial m are absorbed. The author flagged no locator as unverified.
- **Further locators.** FU25 lines 823–856, 955–972 and 1031–1105. HKW22 lines 631–653, 847–853, 3004–3022 and 3497. FKS21v2 lines 984–1000 and 1276–1300.
- **Pinned declarations.** 20 checked with `#check @` in one scratch file, all elaborating:
  - `Finsupp` Mathlib/Data/Finsupp/Defs.lean:88; `Finsupp.mem_support_iff` :158.
  - `Submodule` Mathlib/Algebra/Module/Submodule/Defs.lean:39.
  - `Subalgebra` Mathlib/Algebra/Algebra/Subalgebra/Basic.lean:29; `AlgHom.range` :545; `AlgHom.rangeRestrict` :582; `AlgHom.rangeRestrict_surjective` :588.
  - `Finset.expect` Mathlib/Algebra/BigOperators/Expect.lean:60; `Fintype.expect_eq_sum_div_card` :371.
  - `AddChar.complexBasis` Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean:125.
  - `AddChar.wInner_cWeight_eq_boole` Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean:58.
  - `Ideal.quotientKerEquivRange` Mathlib/RingTheory/Ideal/Quotient/Operations.lean:819.
  - `MeasureTheory.norm_integral_le_of_norm_le_const` Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:999.
  - `CategoryTheory.CatCenter`.
  - `TauCeti.IsHighestWeightVector` TauCeti/Algebra/Lie/HighestWeight/Basic.lean:122. It requires v≠0.
  - `TauCeti.formalCharacter` TauCeti/Algebra/Lie/Weights/FormalCharacter.lean:156, indexed by `Dual K H`.
  - `TauCeti.twoWeylVector` TauCeti/LinearAlgebra/RootSystem/Weyl/Vector.lean:102, the sum of the positive roots.
  - `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator` TauCeti/Algebra/Lie/HighestWeight/Weyl/Character.lean:319.
  - `TauCeti.finrank_eq_prod_coweightPairing_div` TauCeti/Algebra/Lie/HighestWeight/Weyl/Dimension.lean:113.
  - `TauCeti.ExactK0` TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:163; `TauCeti.ExactK0.lift` :324.
  - `TauCeti.AbelianK0.homologyEulerChar` TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean:307.

  The pins are Mathlib 6b7abb3 and Tau Ceti a91d3aa, matching lake-manifest.json.
- **Elaboration.** `lake env lean` on `packages/ExcursionOperatorsAndSpectralActionPartII/Suggested.lean`, run from the content checkout, exits 0. Its only output is "declaration uses `sorry`" at 44:8.
- **Binder audit.** `#check @weightPushforward_sum_abs_sub_uniform_le` keeps K, L, the Field/CharZero/IsAlgClosed/LieRing/LieAlgebra/IsKilling/FiniteDimensional instances, H with IsCartanSubalgebra, b, A, φ, hφ, and every module binder and hypothesis. Nothing dropped, and the generality equals README:431.
- **Imports and form.** The file has `import Mathlib` plus three existing and used `TauCeti` modules, no `set_option`, no `lemma`, no sorry'd data, a single module docstring of the correct form, the namespace and a Layer 2 section comment.
- **Headlines.** The nine headline groups are §0.0, §3.3, §2.4(b)/§2.5, §§1.5–1.6, §0.5, §§4.2–4.3, §§5.1–5.3, §6.1 and §6.2. All are named in the docstring with the carrier each lacks. A pinned search for Bernstein-centre, smooth-representation, orbital-integral, reductive-group and Bun_G carriers finds only Bernstein polynomials and probabilistic excursions. Only §2.4(a) is statable, and it is stated.
- **Cross-roadmap citations resolved.**
  - SR §§SR.0.4, SR.1.1, SR.2.2, SR.3.1–SR.3.3, SR.3a.2.
  - HS §§HS1.1–HS1.7, HS3.8, HS3.10, HS4.1, HS4.2.
  - ETUTC §§1.2, 1.3, 1.6, 1.11, 1.13, 1.14, 2.1, 2.4, 2.11, 2.16, 4.7.
  - BunG §§0.5, 0.6, 1.11, 1.13, 1.18, 1.19, 1.23, 1.24, 1.36.
  - GeometricSatakeAndFusion GS4 "Integral identification, normalization and functoriality".
  - ReductiveGroupsPartII §§RG2.1.5, RG2.5.
  - LP §§LP2e.9, LP2e.15, LP2c.5, LP2c.8.
  - ReductiveGroups Layers 1, 2, 7, 10 (10A, 10B) on main.
  - RepresentationTheory/LieHighestWeight Layer 6 on main.

  The citation resolver's only lead, `TauCeti.IsStableDistribution`, is ETUTC's planned name (README:778).
- **Gaps.** The 12 slugs, suppliers and needs sentences in the README equal the plan's `gaps`, and no unknown slug is cited. Apart from R02–R05 and R08, each is precise, statable by its supplier at its ORDER position, and not otherwise provided. A pinned and roadmap search found no Kazhdan density, Arthur decomposition, stable projection or torus-type finiteness statement elsewhere, including AutomorphicSpectralTheory at its head.
- **Dependency check.** `depcheck: 50 roadmaps, 582 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Ownership.** I searched by object: very stable, atomically stable, stable Bernstein, Fargues–Scholze centre or parameter, excursion, regular supercuspidal, weight equidistribution, Kazhdan density. I searched main, all 355 open heads and the board checkout's packages, including the designs of HeckeStacksAndLocalShtukasPartII, SmoothRepresentationsOfLocalGroupsPartII, GlobalShtukasAndFunctionFieldLanglandsPartII and LocalLanglandsCorrespondenceForG2. No competing owner exists, so this roadmap is the right owner of §0.0, Z_st, Z_vst, the character Hecke operators, atomic stability and τ_G. The Lean name occurs nowhere else.
- **README shape and style.** All headings are present, and every layer ends with Examples and Dependencies. Every definition has at least three Checks (§0.0: 4+3, §0.1: 4, §0.2: 4, §1.1: 4, §1.4: 4, §2.1: 4, §2.2: 7, §2.3: 4, §4.1: 5, §5.2: 5). There is no LaTeX, no process words and no machine paths. The sources manifest has five keys, one per work, and the sha256 values match the cache.

## Not verifiable

- **Var24 (Varma).** H26 cites it for the stable projection and Arthur's criterion. It is not in the manifest. The README routes those inputs through gaps, so I did not fetch it.
- **FKS23 (Duke version of record).** It is behind a paywall. Only the preprint FKS21v2 was read.
- **BDK86, Art93/Art96 and Kot88.** Cited through H26 lines 192, 224 and 286. Not opened; they enter only through gaps.
- **Board packages on other pull-request heads** listed in the index. These were not fetched; for EndoscopicTransferAndUnitaryTraceComparisonPartII only its design review in this checkout was read (Jacquet–Rallis content, no overlap). Ownership against those heads is otherwise unchecked.

## Source issues

- **Misprint** in H26 at §2.2, p. 8: the source calls 2ρ_G the usual sum of positive roots while using 4mρ_G as a Ĝ-weight; it should be the positive roots of Ĝ, the coroots of G (as at FU25 p. 18); affects nothing.
- **Misprint** in HKW22 at §3.3, equation (3.3.3), p. 18: the source describes ρ_G as the sum of the positive roots; it should be the half-sum, so that 2ρ_G is the full sum (as in Appendix A.2, p. 72); affects nothing.
- **Misprint** in H26 at §2.4, p. 13: the reverse composite carries extension index i; it should be the identity-stratum index 1, as defined on p. 9; affects nothing.
- **Misprint** in H26 at §2.3, p. 11: the stable-projection restriction is asserted for every element of D(G); the projection is defined only on D_temp(G) (p. 6), where it is used; affects nothing.
- **Gap** in H26 at Corollary 1.3, p. 2: atomic stability of Kaletha's regular supercuspidal packet sums is attributed to FKS without argument; FKS Theorem 4.4.4 states stability and identities for only part of S_φ⁺ under convergence assumptions; affects a stated result.
- **Gap** in H26 at §2.3, p. 11: the source chooses a compact U containing every C_T whose elliptic part is stably invariant, without argument; it needs finiteness of torus types and of rational classes in a stable class; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6b12a11", "job": "REV-PKG-ExcursionOperatorsAndSpectralActionPartII~2", "model": "opus", "worker": "fable-rev105"} -->
