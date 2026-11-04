<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1197#issuecomment-6403303439 -->
Red team round 1 pass b (claude) of f0cf796

Verdict: needs_changes

1. **F01** (P2) gap:witt-characteristic-series asks for what QWittVectors §§1.3–1.4a already provide

   Location: `packages/GeneralAlgebraicKTheoryPartII/README.md:248` ("What QWittVectors must provide (gap:witt-characteristic-series): Supply the natural characteristic-series identification χ:W_(ℕ>0)(R)≃1+tR[[t]] …") and `design/plan.json` gap `witt-characteristic-series` (supplier QWittVectors §1.3).

   Claim: the identification W(R)≃1+tR[[t]] with the product/zero/unit/ghost/topology laws is missing from the supplier.

   Witness: QWittVectors at its open head (#1351), `TauCetiRoadmap/QWittVectors/README.md:203–233` (§1.4a "Big Witt power-series comparison") already constructs γ_∞:(W_{ℕ>0}(R),+)≅U_∞(R), γ_∞((a_d))=∏(1−a_dt^d)^{−1}, with coefficient naturality, the restriction compatibility ρ_{N,M}∘γ_N=γ_M∘res (the finite-restriction topology), the Verschiebung substitution law and γ_∞(τ(a))=(1−at)^{−1}; §1.3 (`README.md:155`) states W_S as the inverse limit of its finite subtruncations. The series requested here is χ=γ_∞^{−1} (the multiplicative inverse in R[[t]]): χ(0)=1, χ(1)=χ(τ(1))=1−t, χ(a+b)=χ(a)χ(b), and (1−at)*(1−bt)=1−abt is τ(a)τ(b)=τ(ab) transported through γ_∞. The ghost identity −tχ′/χ=tγ_∞′/γ_∞=∑w_n(a)t^n is the universal-ring logarithmic-derivative identity the supplier's §1.4a construction already uses. Tested on the instance of the README's own Check: over 𝔽₃ with a=τ(1), χ(a)(εx)=(1−εx) and γ_∞(a)(εx)=(1−εx)^{−1}=1+εx; the two differ by 2εx≠0, so the inverse must be taken explicitly, but nothing new is needed from the supplier.

   Repair: in "### From TauCetiRoadmap.QWittVectors" replace the gap paragraph by "Consume §1.4a's power-series comparison γ_∞:W_{ℕ>0}(R)≅1+tR[[t]], γ_∞((a_d))=∏(1−a_dt^d)^{−1}, with its coefficient, restriction, Verschiebung and Teichmüller laws, and §1.3's inverse-limit topology. Define the characteristic series χ:=γ_∞^{−1} (inverse in R[[t]]); then χ(0)=1, χ(τ(1))=1−t, Witt addition is series multiplication and (1−at)*(1−bt)=1−abt. The ghost identity −tχ′/χ=∑_{n≥1}w_n(a)t^n is proved in §4.36 from the universal torsion-free case by the coefficient naturality of γ_∞." Add "QWittVectors §§1.3–1.4a" to the §4.36 `*Needs:*` line, delete `witt-characteristic-series` from the plan's `gaps` list and from the gap list the README states. If the maintainers prefer to keep a supplier request, reduce its `needs` to the single sentence "Export the ghost identity tγ_∞′/γ_∞=∑_{n≥1}w_n(a)t^n over every commutative ring R."

2. **F02** (P2) gap:suslin-algebraically-closed-comparison asks for the group computation KTheoryFiniteLocalFields §6.5a and §1.6 already provide

   Location: `packages/GeneralAlgebraicKTheoryPartII/README.md:266` ("What KTheoryFiniteLocalFields must provide (gap:suslin-algebraically-closed-comparison): §6.5a: Prove K(L)^∧p≃ku^∧p for every algebraically closed field L of characteristic zero and every prime p.") and §6.4 (`README.md:1687`).

   Claim: the supplier lacks the p-complete K-theory of an algebraically closed characteristic-zero field.

   Witness: KTheoryFiniteLocalFields at its open head (#1281), §6.5a: for a field F, ℓ invertible in F and d=cd_ℓ(F), the comparison from connective K with ℤ/ℓ^ν coefficients to periodic étale K-theory is an isomorphism in nonnegative degrees n≥d−1, and the separably closed coefficient identification is π₂ᵢ=ℤ/ℓ^ν(i), π₂ᵢ₊₁=0; its first Check states the separably closed case d=0 explicitly. §1.6 supplies `completed R ℓ` as the limit of the coefficient spectra with its Milnor sequence. For L algebraically closed of characteristic zero and any prime p, d=0, so the supplier already gives π_nK(L;ℤ/p^ν)=ℤ/p^ν for even n≥0 and 0 for odd n, hence π_*K(L)^∧_p=ℤ_p[β]. Instance: L=ℚ̄, p=2: π₂K(ℚ̄;ℤ/2)=ℤ/2, π₁=0, π₀K(ℚ̄)^∧_2=ℤ₂, which is all §6.4 uses to conclude L_T(1)K(E₀(L))≠0. What §6.5a does not state is the identification of the p-complete spectrum with ku^∧_p (a multiplicative Bott-class comparison).

   Repair: narrow the gap's `needs` (README and plan) to "Identify K(L)^∧p with ku^∧p as a ring spectrum for every algebraically closed field L of characteristic zero and every prime p, through the Bott class of §1.2 and the separably closed coefficient calculation of §6.5a; the homotopy groups ℤ_p[β] are already §6.5a with §1.6." Alternatively state §6.4 as "π_*K(E₀(L))^∧_p≅ℤ_p[β]⊕Σℤ_p[β]; in particular L_T(1)K(E₀(L))≠0", cite §6.5a and §1.6 directly, and delete the gap.

3. **F03** (P2) gap:multiplicative-postnikov is compound and partly provided by RefinedTraceMethods §4.14 and GeneralizedCohomology G3.8

   Location: `packages/GeneralAlgebraicKTheoryPartII/README.md:53` ("What EnhancedDerivedSheaves must provide (gap:multiplicative-postnikov): Supply coherent connective E₁-ring Postnikov sections and their derivation-classified square-zero pullbacks, with the bimodule structures and tensor-connectivity bounds …"); consumed by §4.40 (`README.md:1385`).

   Claim: all four items are missing from the suppliers earlier in the order.

   Witness: RefinedTraceMethods at its open head (#1493), §4.14 "Connective bimodules and square-zero extensions" (`README.md:2034–2052`) already constructs connective A-bimodules, the split square-zero algebra A⊕M and, for an extension datum (A,I,δ), the coherent pullback algebra A×_{A⊕ΣI}A, which is exactly the "derivation-classified square-zero pullback" form used in the LMMT Lemma 3.3 square τ≤kR→Hπ₀R over τ≤k−1R→Hπ₀R⊕Σ^{k+1}Hπ_kR. GeneralizedCohomology G3 item 8 (`TauCetiRoadmap/GeneralizedCohomology/README.md:785–873`) constructs τ_{≥k}E and τ_{<k}E with their universal properties, the R-module structure on τ_{≥k}E for connective R and the bound that the smash of an a-connective and a b-connective spectrum is (a+b)-connective. The only items no earlier roadmap states are the E₁-ring structure on τ≤kR natural in R, the identification of τ≤kR→τ≤k−1R as the pullback of §4.14's datum for the k-invariant derivation τ≤k−1R→Σ^{k+1}Hπ_kR (HA 7.4.1.28–29), and the connectivity bound for a relative tensor I⊗_A J over a connective A.

   Repair: rewrite the `needs` (README and plan) as "For a connective E₁-ring R and k≥1, supply the E₁-ring structure on τ≤kR natural in R, the derivation τ≤k−1R→Σ^{k+1}Hπ_kR whose RefinedTraceMethods §4.14 pullback algebra is τ≤kR, and the bound that I⊗_AJ is (a+b)-connective for an a-connective right and a b-connective left module over connective A." Add "RefinedTraceMethods §4.14 (Connective bimodules and square-zero extensions); GeneralizedCohomology G3.8" to the §4.39 and §4.40 `*Needs:*` lines.

4. **F04** (P3) one coarse RefinedTraceMethods `*Needs:*` block is repeated on fourteen targets with different needs

   Location: `packages/GeneralAlgebraicKTheoryPartII/README.md:999` (§4.19 `*Needs:*` "… RefinedTraceMethods §§2.1–2.17, 4.9–4.18 and 6.1 …"), and the same phrase in §§4.22, 5.2, 5.3, 5.4, 5.6, 6.3, 6.6, 8.3, 9.6, 9.7, 10.2, 10.3, 10.4, 10.5.

   Claim: each of these targets depends on the listed thirty-odd supplier sections.

   Witness: §4.19 (telescopes on L_n-local spectra) uses no trace input at all; §5.2 uses §4.17 (integral DGM) and §4.10; §9.6 uses §4.17's gaps and §2.9; RefinedTraceMethods §6.1 ("Spherical bases and compatible global lifts", étale E∞-lifts, `TauCetiRoadmap/RefinedTraceMethods/README.md:2478`) is used by none of them. The brief's class 11 ("one `*Needs:*` line covering several theorems with different needs") applies; the block also hides which sections of RefinedTraceMethods are really consumed, so a later change there cannot be matched to its consumers.

   Repair: delete "RefinedTraceMethods §§2.1–2.17, 4.9–4.18 and 6.1" from the §4.19 `*Needs:*` line, and on the other thirteen targets replace it by the specific sections, e.g. §5.2: "RefinedTraceMethods §4.17 (The Dundas–Goodwillie–McCarthy theorem); §4.10"; §5.3: "§§2.1–2.2 and 2.11–2.12"; §5.4: "§4.19 (The TC assembly map for C_p); §2.3"; §6.3: "§2.3; §2.9"; §9.6: "§2.9"; §10.4–10.5: "§2.10". Remove §6.1 everywhere.

5. **F05** (P3) the real/complex Bott class names clash with the supplier's names

   Location: `packages/GeneralAlgebraicKTheoryPartII/README.md:214` ("π₀ko=ℤ … α²=4β with |α|=4 and |β|=8; complex Bott has degree 2") and `README.md:218` ("c(α)=2b², c(β)=b⁴").

   Claim: the symbols match GeneralizedCohomology G5.4 and TopologicalKTheory T7.

   Witness: `TauCetiRoadmap/GeneralizedCohomology/README.md:1676–1677` names the degree-4 class a, the degree-8 class b and complex Bott u: a²=4b, c(a)=2u², c(b)=u⁴; TopologicalKTheory T7 (open head #894, `README.md:1246` and `:1288`) uses a, b with a²=4b. The README's "b" is the supplier's u, and the supplier's b is the README's β. The values agree (c(α)=2u², c(β)=u⁴, α²=4β), so this is a naming mismatch only (class 7).

   Repair: in both supplier paragraphs write "with GeneralizedCohomology's names a=α (degree 4), b=β (degree 8) and u for the degree-two complex Bott class: a²=4b, c(a)=2u², c(b)=u⁴", and use u, not b, for the complex class in `README.md:218`.

Scope of the pass: the whole `packages/GeneralAlgebraicKTheoryPartII/README.md` (2412 lines, 103 numbered targets, 346 Check bullets, 103 `*Needs:*` lines, 33 declared gaps) and the whole `packages/GeneralAlgebraicKTheoryPartII/Suggested.lean` (52 lines, module docstring only, no declaration) were read line by line. Every `<source id> line N` citation (119 distinct) was opened in the cached extraction. Every cross-roadmap citation was resolved against main (`TauCetiRoadmap/EnhancedDerivedSheaves`, `BordismFormalGroups`, `GeneralizedCohomology`, `AlgebraicTopology`, `ModularCurves`), against the open heads named in the brief (RefinedTraceMethods at the head of #1493, QWittVectors at the head of #1351) and, through the roadmap service, against the open heads of GeneralAlgebraicKTheory, StableHomotopyKTheory, KTheoryLowDegrees, KTheoryFiniteLocalFields, SchemeKTheoryOperations, AInfCohomology, MotivicEtaleKTheory, HomotopySpheres, EllipticCohomology and TopologicalKTheory, and against the board designs of StableHomotopyKTheoryPartII and ChromaticHomotopyTheory.

Dependency check, run on this head:

```text
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Citation resolver: no cross-roadmap citation and no Lean name found nowhere.

## Verified sound

- Declarations read: 0 (Suggested.lean declares nothing; `#check @name` audit is empty). The module docstring names 31 headline groups and the carrier each lacks; every group corresponds to README targets (§§0.1, 1.1–1.4, 2.1–2.4, 3.2–3.6, 4.1–4.46, 5.1–5.6, 6.1–6.7, 7.1–7.8, 8.1–8.9, 9.1–9.7, 10.1–10.5). None is statable at the pins: Mathlib has no K-spectrum, no spectra and no ring spectra; Tau Ceti's `SplitK0`, `AbelianK0`, `TriangulatedK0` and `finiteProjectiveModulesExactStructure` are degree-zero ordinary objects (confirmed in `TauCeti/CategoryTheory/GrothendieckGroup/*.lean` and `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean` at pin a91d3aa). The degree-zero statements this roadmap could phrase there (nilpotent K₀ invariance, Witt operations) are gaps or targets of KTheoryLowDegrees and QWittVectors, not headlines here. An empty acceptance file is therefore correct; no padding, no `set_option`, no `lemma`, single `import Mathlib`.
- Targets read: 103 of 103, with all 103 `*Needs:*` lines and 346 Checks. Policy: no pull-request number, no process word, no `lemma` keyword, every target has a locator, `sources.toml` ids (30) equal the References (30), `metadata.toml` topic math.KT, the diff touches only the package folder.
- Locators verified: 119 distinct `<id> line N` citations opened; all 119 point at the cited theorem, definition, remark or passage (LMMT 54/54: Theorems A, 1.1, B, Purity, Redshift, Def 2.1, Lemmas 2.2–2.8, Prop 2.9, 2.11, Rem 2.12, Prop 3.1, Lemmas 3.2–3.3, Prop 3.4, Cor 3.5, Prop 3.6, Lemma 3.7, Thm 3.8, Rem 3.9, 3.11, Prop 3.12, Cor 4.2–4.5, Rem 4.6, Cor 4.7, Ex 4.8, Cor 4.9, Rem 4.10, Cor 4.11–4.12, 4.14, Lemma 4.15, Cor 4.16, 4.18, 4.19, Rem 4.20, Cor 4.21, Rem 4.22, Cor 4.23–4.25, Rem 4.27–4.29, Cor 4.30–4.32, Prop 4.33, Cor 4.34; LT 6/6; BGT 7/7 anchors; CMNN20 4/4; CMNN24 2/2; Hahn 4/4; Weibel 4/4 including Exercise 3.2's sign convention α(t)*[1−νy]=[α(νy)]; Ravenel Thm 2.1(b),(d),(e),(f); Hopkins–Smith Theorems 3, 7, 11 at lines 89, 129, 166; Kuhn, Clausen–Mathew, CSY, BHM, Mitchell, Yuan Theorems A, C, 4.3, Lemma 4.5, BSY Theorem D, Cor 5.2, Prop 9.12, Rem 9.13, Thm 9.11, AGH Def 2.1–2.7, Thm 3.18, §4.2 definitions and Prop 4.4, Ex 4.6(4)–(5), Barwick 6.1, HS 8.1.3, PP 4.24–4.26, cdh §4.4, bgt-mult 5.8–5.11, thom 3.1, 3.5, 3.16, 5.1, 5.7, akq §2.1, Lemma 2.2, Prop 2.22, bhls Thm A, MNN Thm B, Thm 2.1, MM 7.2, 7.6, Behrens 1.6.8, 1.6.12, Goerss 3.6). AGH's definition of "right regular noetherian" was compared word for word with §3.4's standing hypotheses; CMNN24's convention T(0)=S[1/p] (line 28) agrees with the README's; Yuan's Theorem 4.3/Lemma 4.5 are at n≥0 with a rational bottom, which the README's D₀=Hℚ contract records.
- Checks tested: 74 Checks and worked examples recomputed (table below); none false, vacuous or a restatement. Every definition (§§1.1, 1.2, 1.4, 2.1, 3.1, 3.2, 4.1, 4.2, 4.5, 4.10, 4.11, 4.13, 4.22, 4.26, 4.28, 4.32, 5.3, 7.1, 8.1, 9.3, 10.3) has at least three discriminating Checks.
- Sibling citations checked (all resolve at the stated heads): EnhancedDerivedSheaves E0.4, E0.7, E3.1, E5:abstract.1–4, E5:presentability.1–3; BordismFormalGroups F1–F3, F6.1–F6.5 (telescopes with ⟨K(n)⟩≤⟨T(n)⟩ at F6.3 line 1171–1177, straightening in F6.5, Margolis homology in F6.3); GeneralizedCohomology G2, G3 (item 8 Postnikov), G4.5, G5.1–G5.4; AlgebraicTopology Stages 4 and 8; ModularCurves §7E; RefinedTraceMethods §§2.1–2.17 (2.3 Tate fixpoint lemma, 2.10 spherical group rings), 4.6, 4.9 (all three named sub-targets), 4.10, 4.14, 4.15 ("Stable K-theory is THH" with the ΣTHH convention), 4.17, 4.18 ("Truncating invariants: nil-invariance and excision"), 4.19 ("The TC assembly map for C_p", p−1 copies), 6.1; QWittVectors §§1.1–1.6 and 1.4a; GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13, 11.15–11.16, 13.6, 13.8a–13.8c; StableHomotopyKTheory Layers 3–7 with §§3.18–3.21, 5.18–5.19, 6.1–6.3, 7.1–7.27; StableHomotopyKTheoryPartII PO.4 "Degree-zero power operation" and "The transfer ideal for a prime power operation" (board design; PO.4's own prerequisites do not involve ChromaticHomotopyTheory, so the README's dependence on it creates no cycle); KTheoryLowDegrees §§1.1–1.3, 13.1; KTheoryFiniteLocalFields §§1.1–1.6, 6.5a; SchemeKTheoryOperations §§1.1–2.7, 3.1–3.5, 4.1–4.3, 4.12, 5.2–5.9 (no KH, cdh or abstract-blowup content, so those gaps are genuine); AInfCohomology §AI.7.2 (`tateOrbit`, `completedTateComparison`, circle norm); MotivicEtaleKTheory §7.2 (regulator comparison, as the README says); HomotopySpheres §3B, §4B, §4C (both open PRs #284 and #1287 carry them); EllipticCohomology E1–E6, E2 items 2–3 (heights 1 and 2 only, so the all-height gap is genuine), E4's Δ²⁴ in degree 576, E5's gl₁ and Thom data; TopologicalKTheory T4, T7 (its item 1 is the README's T7.1). Merge order: every supplier is earlier than line 220 or on main or an other-author new-folder pull request; ChromaticHomotopyTheory (line 222) appears only as a downstream consumer. Ownership by object: searches for Bousfield–Kuhn functor, telescopic Tate vanishing, stable envelope, purity theorem, Witt action on NK and Farrell–Jones assembly find no owner on main or in any open pull request; the only competing plan is the board design of ChromaticHomotopyTheory (same titles for its CH.3–CH.10, CH.13), which the round-2 repair report settled as F15 "not actionable in this package" with a correct reason (ChromaticHomotopyTheory is later in the order and must repoint); not re-raised.
- Declared gaps: all 33 slugs agree between the README contracts and the plan's `gaps` (supplier, section, `needs` text); none has supplier `none`; apart from R01–R03 each is precise and not already provided.

Adversarial mathematics table (statement; instances; values; result):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, cofiber sign | k→0→Σk in Perf(k) | [Σk]=−[k]; Σ² acts by +1 | sound |
| Conventions, hom vs Hom | X=ΣHk, Y=Hk | π₋₁Hom=π₀End(Hk)=k; π₋₁hom=0 | sound |
| Conventions, T(0)=S[1/p] | p=2, X=H𝔽₃ | T(0)⊗H𝔽₃=H𝔽₃≠0; Hℚ⊗H𝔽₃=0 | sound |
| Conventions, connectivity of maps | S¹→*, ΣHℤ→0 | fibers S¹ (0-connected) and ΣHℤ; both 1-connective | sound |
| Supplier PO.4 additivity | p=2, x=y=1 | res P(2)=4, res(P(1)+P(1))=2, difference 2∈(p) | sound |
| KFLF descent Check | p=3, 𝔽₄/𝔽₂, 2-adic | K(𝔽_q)^∧₂=Hℤ₂ (odd orders 2^i−1, 4^i−1); H²(C₂,ℤ₂)=ℤ/2 vs π₋₂=0 | S[1/p] excluded, sound |
| §0.1 | q=id, q:D→0, A=0 | fibers 0, KD, 0 | sound |
| §1.1 | Hk, Hk⊕ΣHk, Hℤ | π₀GL₁(Hk)=k×; π₁GL₁(Hk⊕ΣHk)=k; π₀GL₁(Hℤ)={±1} | sound |
| §1.2 | fd k-spaces, C=0 | π₀Kadd=ℤ with [k]=1; Kadd(0)=0 | sound |
| §1.3 right action | X=A | End_A(A)=A by left multiplication; Hom(A,A²)=A² | sound |
| §1.4 | X=*, S¹; finite vs dominated | S[Ω*]=S; S[ΩS¹]=S[ℤ]; π₀=ℤ vs K₀(ℤ[π₁]) | sound |
| §2.2 Milnor square with identity leg | A=k[ε]/ε² | correction algebra A′⊗_A A=A′; fiber 0 | sound |
| §2.3 (LT 2.4) | Λ=ℤ/2,ℤ/3; S[1/p]→Hℤ[1/p] | both sides mod p zero; K fiber p-complete zero | sound |
| §2.4 | Hℤ, Hk⊕ΣHk | K₀=ℤ, K₋₁=0 on both sides | sound |
| §3.1 amplitudes | Hk, ΣHk, ΣʳHk | [0,0],[1,1],[r,r]; τ≤0S=Hℤ not finite | sound |
| §3.2 Stab | Projω(Hk), 0, Perf(k) additive | Stab=Perf(k), K₀=ℤ; Stab(0)=0; additive K₀=⊕_jℤ vs ℤ | sound |
| §3.3 | Perf(k) | [Σk]=−1; K_j=0, j<0 | sound |
| §3.4 | R=Hk[u], |u|=2 | cofib(Σ²R→R)=Hk; π₀=k, πᵢ=0 (i≠0) | sound |
| §3.6 | C=Perf(k) | ⊕_jℤ→ℤ, e_j↦(−1)^j; kernel ∋ e₀+e₁ | sound |
| §4.1 | Tel(0), Tel(v²) | 0; ≃Tel(v) | sound |
| §4.2 | X=*, ΣʳH𝔽_p, S/q | positive periodic groups 0, 0; π₀(H𝔽_q)[1/p]=𝔽_q | sound |
| §4.3 | Hℚ, S/p | p-completion of Hℚ=0, T(0)Hℚ=Hℚ | sound |
| §4.4 | H𝔽_p, H𝔽_q (q≠p) | T(n)H𝔽_p=0=K(n)H𝔽_p; T(0)H𝔽_q≠0, K(0)H𝔽_q=0 | sound |
| §4.5 | n=0 | L₀^fS=Hℚ, L₀^(p,f)S=S[1/p]; both fix Hℚ | sound |
| §4.6 | n=0, S/p, S/q | kills S/p, fixes S/q; L₀^f kills both | sound |
| §4.7 | S_(p), H𝔽_q | Hℚ,Hℚ; H𝔽_q,0 | sound |
| §4.8 | m=0,n=1, X=H𝔽_q | corners H𝔽_q, 0, H𝔽_q, 0; pullback H𝔽_q | sound |
| §4.9 | p=2, H𝔽₃, Hℚ | L₁^(p,f)H𝔽₃=H𝔽₃; L₁^(p,f)Hℚ=Hℚ | sound |
| §4.11/4.12 | Hℤ, T(n), Σ⁻¹Hℚ | Φ_nΩ∞Hℤ=0; Σ∞Ω∞Hℤ=Σ∞ℤ has sphere summands; Ω∞Σ⁻¹Hℚ=* | sound |
| §4.13 | S⁰, K(ℤ,1), r=1,2 | τ≤₀S⁰=S⁰; X⟨1⟩=component; K(ℤ,1)⟨2⟩=* | sound |
| §4.14 | id_X, ∅→*, E=0 | E→E; 0→E fails for E≠0; 0→0 | sound |
| §4.15 sharp bound | n=1,2; K(π,n+1) | m=n+1 (CSY: Σ∞B^{n+1}C_p⊗T(i)=0, i≤n); K(π,n) has K(n)_*≠0 so m=n fails | sound |
| §4.17 | n=0,1 | BP[1/p] rational; BP⟨1⟩⊗H𝔽_p≠0, E(1)⊗H𝔽_p=0 | sound |
| §4.18 | multiplicative, additive over 𝔽_p, elliptic | heights 1, ∞, ≤2; additive ideal (p,v₁,…)=0 | sound |
| §4.19 | n=1 X=Hℚ; n=2 X=L₁S | T(1)Hℚ=0; T(2)L₁S=0; L_T(n)X≃L_K(n)X for L_n-local X via fiber of X→L_K(n)X being L_{n−1}-local | sound |
| §4.21 | n=1, p=2, degree −2 | π₋₂(BP⟨1⟩)⊗ℚ=0, π₋₂E(1)⊗ℚ=ℚ (v₁⁻¹, |v₁|=2) | sound |
| §4.22 | G=1; rational C₂ | norm=id; transfer ×2 invertible | sound |
| §4.23 | Hℚ, C₂, C₃ | (1/2)·2=1, (1/3)·3=1 | sound |
| §4.24 | KU_p^∧, C_p trivial | raw Tate rational nonzero; T(1)-local value 0 | sound |
| §4.25 | n=1, X=0, rational X | target p-inversion; 0; 0 | sound |
| §4.26 | p=2,h=2,k=1 | [2](z)≡u₁z²+_Fu₂z⁴+_Fz⁸; g₂ constant u₂; res P(2)=4, 8 at p=3 | sound |
| §4.27 | H𝔽_p, Hℚ; h=0,1 | all finite K(i)H𝔽_p=0; K(0)Hℚ≠0, K(1)Hℚ=0 | sound |
| §4.28 heights | 0, H𝔽_p, Hℚ, H𝔽_q | −1, −1, 0, 0 | sound |
| §4.29 | R=0, rational R, i=0 | Tate 0; every T(j)R=0, j≥1 | sound |
| §4.30 | Δ²⁴ | degree 24·24=576 | sound |
| §4.31 | p=2; S³⟨3⟩ | unit 1−2=−1; π₂fib(S³→K(ℤ,3))=0, with K(ℤ_p,3) target π₂=ℤ_p/ℤ; 3-locally null twist gives π₃⊇ℤ/3 | sound |
| §4.32 | m=0,1; p=2 | y(0)=S₂^∧, π₀=ℤ₂; J₁S²=S²; π₀y(1)=𝔽₂, π₀z(1)=ℤ_(2) | sound |
| §4.32 slopes | p=3,m=2,i=1; p=5 | 1/16 vs 1/4; 1/48 vs 1/8; i=m equal slopes | sound |
| §4.33 | W=*, S², mod-3 Moore at p=2 | 0; summands S^{2r}; ΣS/3≠0 after inverting 2 | sound |
| §4.34 | H𝔽₂, ℚ×ℚ | zero rational and mod-3, nonzero mod-2 homology; (a,b)(c,d)=(ac,bd) vs E₁₂E₂₁≠E₂₁E₁₂ | sound |
| §4.35 | ℤ/4→𝔽₂, ℤ/9→𝔽₃ | K₀=ℤ→ℤ id, K₋₁=0 | sound |
| §4.36 sign | 𝔽₃[ε]/ε², a=τ(1) | χ(a)(εx)=1−εx fixed; inverse convention gives 1+εx, 2εx≠0 | sound |
| §4.36 | ν=0; regular k, j=−1; p=2 | value 1; NK₋₁(k)=0; t² coefficients 0 and 1 | sound |
| §4.37 | ℤ[1/2][ε]/ε²; 𝔽₂[ε]/ε²; ℤ/9 | ×2 invertible; ×2=0; K₁(ℤ/9,(3))={1,4,7} order 3 | sound |
| §4.38–4.40 | id, k=0, HA | fiber 0; τ≤₀R=Hπ₀R; τ≤₁HA=HA | sound |
| §4.39 bound | m=n=0 | m+n+2=2 (LMMT 3.2 recomputed: σ iso ≤m+n−1, μ (m+n+1)-connective, Σ shifts to m+n+2) | sound |
| §4.41–4.42 | H𝔽₂ (p=2), 𝔽₃[ε]/ε² (i=2), ℤ/pʳ | K(𝔽_p)^∧p=Hℤ_p; positive telescopes 0; K₀=ℤ | sound |
| §4.43 | 0, Perf(H𝔽_p) | 0; p nilpotent in π₀ since R[1/p]=0 | sound |
| §4.44 | S, n=0, q≠p | S/p↦0, S/q↦S/q≠0 | sound |
| §4.45 | i=1 control | K(ℤ) has nonzero height-one part | sound |
| §4.46 | A=0, local A | 0→0; id; part (ii) only n≥2 (LMMT 3.8 line 659–661) | sound |
| §5.1–5.2 | KU, n=2 | τ≥₀KU=ku; both zigzag fibers 0 | sound |
| §5.3 | G=1, free orbit | norm id; res∘ind=p on K₀ | sound |
| §5.4 | n=2,3 | m=0,1; L_T(2)K(S[1/p])=0; p−1 copies: 1 at p=2, 2 at p=3 | sound |
| §5.6 | ℤ/4→𝔽₂, ℤ/9→𝔽₃ | π₀ kernels (2),(3), squares zero | sound |
| §6.1 | H𝔽_p, Hℚ, E_n, 0 | heights −1,0,n; bounds 0,1,n+1; K(0)=0 | sound |
| §6.2 | E₁(L), Hℚ, H𝔽_q | identity field map; rational map; rationalization 0 | sound |
| §6.4 | L alg. closed, |u|=2 | [HL]=[HL[u]]−[Σ²HL[u]]=0; composite id−Σ²=0; π₀=π₁=ℤ_p | sound |
| §6.5 counterexample | (H𝔽₂)^tC₂, p odd | 1=−1 on K so 2=0; T(j)K=0 (j≥1); R[1/p]=R≠0, R⊗ℚ=0; ht_p(K(R))=0≠1 | sound |
| §6.6 stable K | M=HA | π₁ΣHA=A, π₀=0; relative units 1+A | sound |
| §6.7 | Hℚ, E₁ | M₀(Hℚ)≠0, M₁K(ℚ)≠0; E₁ support at 1, K at 2 | sound |
| §7.1 | Hℤ⊕ΣHℤ→Hℤ, id_{H𝔽_p} | π₀ id, rational π₁ ℚ→0; π₀=𝔽_p excluded | sound |
| §7.3 | p=2,3; r=1,2 | K₀=ℤ; no ring map ℤ/pʳ→ℤ | sound |
| §7.4 | m=1, i=3 | heights {0,1,2}; composite id+Σ^{2p^m−1}=0; rational ranks (1,1) | sound |
| §7.5–7.6 | r=0; n=0,1,2 | τ≤₀S=Hℤ; equivalence from i=n+1, vanishing from n+2 | sound |
| §7.8 | m=1,2, p=2 | empty range; i=1: T(1)K(y(2))=T(1)K(𝔽₂)=0, T(1)K(z(2))≃T(1)K(ℤ_(2)); π₀(z(2)[1/2])=ℚ | sound |
| §8.1 | Σ=∅, zero tower | T_(ε,∅)=T; nilpotence length 1 | sound |
| §8.3 | G=1, A→A×A | identities; (1,0)↦1 | sound |
| §8.4–8.5 | H=1; d, |H| | X=S rank 1; k-dimension d|H|; M=d|H| cells, M·1=d·tr(1) | sound |
| §8.8 | p=2,3 | |GL₂(𝔽₃)|=48; 12·2=24; TMF(3) at p=3 has K(2)-localization 0 | sound |
| §9.1 | Hℤ, H𝔽₂, H𝔽₃ | 𝔽_p[1/p]=0; L_K(1)K(𝔽_p)=0 | sound |
| §9.3 | S, d=0,1,2 | S, S, Σ∞_+BC₂ | sound |
| §9.4–9.5 | 𝔽_p[ε]/ε² | 1+εx nonconstant unit, evaluation 1; localized fiber 0 | sound |
| §9.6 | p odd | L_K(1)TC(ℤ)=L_K(1)S⊕ΣL_K(1)S⊕Σ³KU_p^∧≠0; TC(ℤ[1/p])^∧p=0 | sound |
| §10.1 height one | Perf(ℤ/p²) | both sides T(1)-acyclic; heart dévissage to K(𝔽_p) (LMMT 3.12(ii)) | sound |
| §10.2 | T(n−1)-local rings | C→L_{T(n−1)}C is T(n−1)∨T(n)-equivalence since L_{n−1}^f smashing | sound |
| §10.3–10.5 | 1, C₂, ℤ, S₃, Q₈ | terminal orbit for first three; none for S₃, Q₈ | sound |

## Not verifiable

- Printed page numbers (JAMS pagination of lmmt, manuscript pages of the arXiv sources): the extractions carry page markers only intermittently; the line numbers were verified, the page numbers were not independently checked.
- BGT labels adjacent to the verified anchors (Theorem 4.23, Definition 5.12, Proposition 5.15, Theorems 9.8 and 9.10, Proposition 9.32): the extraction of `bgt` does not render these labels searchably; the anchors at the cited lines (Theorem 4.22, Definition 5.8, Proposition 5.14, Definition 9.1, Lemma 9.39, Proposition 9.40, Theorem 9.53) are correct.
- HomotopySpheres is carried by two open pull requests (#284 and #1287) with the same folder name; both contain §3B, §4B and §4C, so the citation resolves either way, but which head the intake will treat as the supplier is not decidable from this package.
- Ownership against open pull requests whose files the brief does not give was checked only through the roadmap service's grep over their README and Suggested.lean; their design folders were not available.
- The exact pages of Behrens's chromatic fracture discussion (pp.29–32) and of CMNN24 Theorem 4.10 (p.21) were not matched to page markers.

## Source issues

- **Misprint** in lmmt at Remark 3.11, printed p.1026 (lmmt line 745–747): the source says the stabilized relative K-theory colimit of the square-zero extensions S⊕ΣʳM→S is ΩM; it should be ΣM, by Dundas–McCarthy (relative units of ℤ⊕εA give π₁=A); affects nothing (both are T(n)-locally nonzero).
- **Misprint** in akq at §2.1, manuscript p.5 (akq line 199–203): the source says the Thom spectrum of Ω²(S³⟨3⟩)→Ω²S³→BO→BGL₁S is HZ with no localization; it should be the 2-local (or 2-complete) statement, since 3-locally the map is null and the Thom spectrum retracts onto S_(3) with π₃=ℤ/3; affects nothing (the paper works 2-locally).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f0cf796419574218f8ebb11ecd8a00a717b118d2", "job": "RT-GeneralAlgebraicKTheoryPartII~1b", "model": "fable", "worker": "chris-k"} -->
