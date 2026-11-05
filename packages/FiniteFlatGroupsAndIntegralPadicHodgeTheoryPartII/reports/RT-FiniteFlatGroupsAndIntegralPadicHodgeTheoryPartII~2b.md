<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1244#issuecomment-6643271116 -->
Red team round 2 pass b (claude) of cf48b63

Verdict: needs_changes

1. **F01** (P3) VectorBundlesAndIsocrystals is cited by layer labels it does not have

   Location: `README.md:16`, `:108`, `:543`, `:1032`, `:1179`, `:1191`: "VectorBundlesAndIsocrystals VB0 supplies finite tensor isocrystals; VB4, “Integral group torsors and Frobenius”".

   Claim: the two consumed targets sit in layers labelled VB0 and VB4 of VectorBundlesAndIsocrystals.

   Witness: at #1205 (head c7a0b33) that README has no label "VB" followed by a digit anywhere; its layers are "## Layer 0" … "## Layer 6". "Finite isocrystals over the completed maximal unramified coefficient field" is the heading at its line 213, inside "## Layer 1: Finite isocrystals and division algebras" (line 209); "Integral group torsors and Frobenius" is the heading at line 2024, inside "## Layer 6: Families, pure models and local systems" (line 1647). The titles resolve; the layer numbers 0 and 4 do not.

   Repair: replace "VectorBundlesAndIsocrystals VB0" by "VectorBundlesAndIsocrystals Layer 1" and "VB4" by "Layer 6" in the six lines above (keeping the quoted titles), and "VectorBundlesAndIsocrystals VB4" in the Layer 4 Dependencies line likewise. Tested: with "Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field”" and "Layer 6, “Integral group torsors and Frobenius”" both citations land on the headings at lines 213 and 2024 of the supplier at its head.

2. **F02** (P3) the hypothesis labels (A)–(C) are used before they are defined and collide with the cited KPZ26 labels

   Location: `README.md:1119` (§4.10) "Under (A)–(C) of §4.12"; `README.md:1130` (§4.11) "Under (A)–(C) of §4.12"; `README.md:1141` (§4.12) "Under (A) local-model acceptability, (B) the specified good integral Hodge embedding of the full fixer, and (C) very-goodness at x … (KZ25, Proposition 3.2.7 …; KPZ26, §7.1.3, pp.72–74; KPZ26 line 3191)".

   Claim: a reader of §4.10 or §4.11 can determine the hypotheses from the text at hand, and the labels agree with the cited passages.

   Witness: the labels are first defined two targets later, in §4.12. They are KZ25's (KZ25 lines 1011–1019: (A) acceptable and of local Hodge type, (B) good local integral Hodge embedding, (C) very good), but the second source cited in the same sentence letters different hypotheses with the same letters: KPZ26 lines 3177–3179 read (A) K_p=𝒢(ℤ_p), (B) 𝒢 R-smooth and p∤|π₁(G_der)|, (C) very good Hodge embedding. Checking "(A)" against the KPZ26 locator gives a level-structure condition the README never imposes.

   Repair: in §4.10, replace "Under (A)–(C) of §4.12" by "Under (A) acceptability and local Hodge type of the local-model triple, (B) the specified good integral Hodge embedding of the full fixer, and (C) very-goodness at x, the conditions (A)–(C) of KZ25 §3.2.5 (KZ25 lines 1011–1019) used throughout §§4.10–4.12"; in §4.11 and §4.12 write "Under (A)–(C) of §4.10"; in §4.12 add after the KPZ26 citation "whose own (A)–(C) letter the global level, R-smoothness and very-good hypotheses of its Theorem 7.1.3, not these". Tested: §4.10 then names all three conditions where first used, and the KPZ26 locator is read for §7.1.4(1)'s correction only.

3. **F03** (P3) two Checks state a hypothesis or an instruction instead of testing an instance

   Location: `README.md:257` (§0.7) "An arbitrary kernel without compatible divided powers supplies no relative frame by this construction." and `README.md:683` (§2.8) "Over R/p, define Ψ as a torsor isomorphism; do not recover it uniquely from rational Frobenius, which has lost information."

   Claim: each is the third discriminating Check of its definition.

   Witness: the first restates the PD hypothesis of §0.7 with no ring, kernel or value; the second is an instruction with no display, ring or computed rationalization. Neither distinguishes a wrong construction from the right one on an instance. The remaining Checks of §0.7 (B=R; k[ε]→k) and of §2.8 (GL_h; endomorphism-cut group) are two each.

   Repair: replace the §0.7 bullet by "For B=𝔽₃[x]/(x⁴)→R=𝔽₃ with kernel b=(x), a PD structure would need 3!·γ₃(x)=x³, but 3!=0 in B while x³≠0, so b carries no divided powers and no relative frame is formed; for B=𝔽₃[x]/(x³) the same equation reads 0=0, γ₂(x)=x²/2 and γ₃(x)=0 give nilpotent divided powers, and `D_{B/R}` exists." Replace the §2.8 bullet by "Over R=k[ε]/ε², p·Ŵ(m_R)=0 because p=VF and F kills every coordinate in kε (ε^p=0), so Ŵ(R)[1/p]=W(k)[1/p]; the tilde-torsor isomorphisms Ψ₀ and Ψ₀(1+[ε]E₂₁), with [ε]²=[ε²]=0, are distinct over Ŵ(R) but have the same rationalization, so Ψ is data of the display and is not recovered from rational Frobenius." Tested: in 𝔽₃[x]/(x³) the products γ₂(x)², γ₁(x)γ₂(x) are x⁴/4=0 and x³/2=0, matching C(4,2)γ₄=0 and 3γ₃=0, so the structure is a PD structure; over k[ε], (aε)³=0 for every a, so F(x)=0 for x∈Ŵ(m_R) and px=V(F(x))=0.

Round 2. The head cf48b63 carries the round-1 repairs (FIX-RT ~1). The Mathlib and Tau Ceti pins moved since round 1 (Mathlib now f6090c7, Tau Ceti 358314d), and every supplier was re-read at its current head (FiniteFlatGroupsAndIntegralPadicHodgeTheory #879, AbelianSchemesAndArithmeticModuli #849, CrystallineCohomology #857, DerivedDeRhamCohomology #868, PadicPeriodRings #940, PELModuli #966, PadicHodgeTheory #1062, VectorBundlesAndIsocrystals #1205, GeometricSatakeAndFusion #1235, ShimuraVarieties #933; SchemeAndStackFoundations, ModularCurves and ReductiveGroupsPartII on main). Nothing in this pass is remembered from round 1: every locator, declaration and section was re-resolved.

## Round-1 findings at this head

| Id | Status | Witness at cf48b63 |
|---|---|---|
| F01 (P2, σ-centralizer needs a ℚ_p-group) | repaired | `README.md:532` "Let G be a connected reductive group over ℚ_p and b∈G(K₀) … σ acts … through the given ℚ_p-structure of G … a group given only over K₀ has no such σ". New fourth Check at `README.md:541`: u·diag(2,1)·u⁻¹=[[2,−a],[0,1]] (recomputed: [[2,a],[0,1]]·[[1,−a],[0,1]]=[[2,−a],[0,1]]), its entrywise Frobenius [[2,−σ(a)],[0,1]] is not of the form [[x,a(y−x)],[0,y]] since a(1−2)=−a≠−σ(a). No "G/K₀" remains. |
| F02 (P1, period-torsor residue range) | repaired differently, correctly | `README.md:110` "For K finite totally ramified over K₀=W(k)[1/p] with k perfect, the same conclusion follows by unramified base change, proved in §5.17". Checked: PadicHodgeTheory §5.5 at #1062 (dump line 1113) states the torsor theorem "For K/ℚ̆_p finite"; K̆=K⊗_{K₀}W(k̄)[1/p]=ℚ̆_p(π) is a field because E(u) stays Eisenstein over W(k̄); B_cris and B_dR depend only on C, Γ_K̆=I_K, so (B_cris⊗_{K₀}D)^{φ=1}∩Fil⁰ is the same ℚ_p-space with restricted action; weak admissibility is insensitive to the unramified change. The new Check `README.md:1439` computes κ(b)−μ♮=1−1=0 for k=𝔽₃, K=ℚ₃, G=G_m, b=3, and V_cris=ℚ₃t⁻¹ for both jump-one lines. No new gap was needed. |
| F03 (P2, point-detection gap bundled Mathlib facts) | repaired | `README.md:72` gap `formal-dvr-point-detection` now asks only joint injectivity of R→O_K; `design/plan.json` line 5320 has the same sentence. `README.md:42` cites `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson` and `IsLocalization.algebraMap_mem_map_algebraMap_iff`; both re-read at the new pin: `Mathlib/RingTheory/Filtration.lean:415` needs `[IsNoetherianRing R] [Module.Finite R M] (h : I ≤ Ideal.jacobson ⊥)`, `Mathlib/RingTheory/Localization/Ideal.lean:76` gives `algebraMap R S x ∈ I.map … ↔ ∃ m ∈ M, m * x ∈ I`, exactly as the contract states. §4.11's *Needs* line cites both. |
| F04 (P3, deJong95 page) | repaired | `README.md:46` and `README.md:1614` "Proposition 7.3.6, pp.89–90"; `sources.toml:237` "pp.89–90". deJong95 line 2952 lies after the marker of page 86, whose running head is printed p.89. |
| F05 (P3, duplicate horizontality Check) | repaired | `README.md:662` torus datum with E₁₁, R_G=W(k), a_G=(3), c=id; diag(2,1)E₂₁diag(1/2,1)=(1/2)E₂₁ recomputed (row 2 unchanged, column 1 scaled by 1/2), and 1/2≡2≢1 mod 3. |
| F06 (P3, two law-restating Checks) | repaired | `README.md:198`: Witt sum [x]+[y] over 𝔽₃[x,y]/(x³,y³) has second coordinate (x³+y³−(x+y)³)/3=−x²y−xy²≠0, recomputed; the PD structure γ₂=x²/2, γ₃=0 exists (it is 𝔽₃⟨x,y⟩ modulo the sub-PD-ideal of x^[3],y^[3]) and is nilpotent (γ_n(ax+by)=0 for n≥5). `README.md:727`: wE₁₁w⁻¹=E₂₂≠E₁₁. |
| B01 (P2, §4.2 connected-parahoric image) | repaired | `README.md:1019` "If moreover 𝒢=𝒢_z is the Bruhat–Tits stabilizer … places the image in 𝒢°(Z_p). Without the stabilizer hypothesis this second conclusion fails: the dilatation of GL₂ along … {diag(a,b): a^(p−1)=b^(p−1)}"; Conventions `README.md:32` say when 𝒢° is a parahoric. ReductiveGroupsPartII §RG2.3.3 on main (line 4335) states P°_Ω=Fix_{G(E)}(Ω)∩ker κ_G, so the derivation g∈𝒢(ℤ_p)∩ker κ ⊂ 𝒢°(Z̆_p)∩𝒢(ℤ_p)=𝒢°(ℤ_p) is supported. |
| B02 (P3, §2.9/§2.10 uncomputed Checks) | repaired | `README.md:705`: E₁₁(e₁+te₂)=e₁∉K(e₁+te₂) for t∈m_K∖0, t=0 adapted; §2.10 uses the F06 swap test. |
| B03 (P3, three page numbers) | repaired | `README.md:320` "Definition 1.10, p.11" (Hoff23 line 504 is on marker 11); `README.md:1306` "pp.25–26" and `README.md:1496` "pp.25–27" (KZ25 line 1115 on marker 25); `README.md:1476` "pp.7–10 and 25–27". |

No repair introduced an error: the eleven changed passages were recomputed above, the gate-markup code spans (`K̆=K⊗_{K₀}W(k̄)[1/p]`, `W(𝔽_{p²})`, `H¹(Spec𝔖\{(p,u)},𝒢°)=1`) carry unchanged mathematics, and the three gap sentences whose README wording differs from `design/plan.json` (`relative-crystalline-constants`, `scheme-local-model-hodge-immersion`, `local-model-curve-spanned-tangents`) differ only by the prose expansion of `∪_{n≥0}`, `(…)^{φ=1}` and `Res_{…}`; the slugs, suppliers and contents agree (14 slugs in both).

## Verified sound

- Read in full: `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md` (1615 lines, 92 numbered targets, 45 Checks blocks with 143 bullets) and `Suggested.lean` (60 lines). Lean declarations read: 0 (the file has one `import Mathlib`, one module docstring naming 21 headline groups and the carrier each lacks, one namespace). No `set_option`, `lemma`, `#eval`, `#print`, `True` placeholder, sorry'd data, pull-request number or process word in either file; `git diff --stat origin/main...HEAD` touches only the package folder (10 files). The `#check @name` binder audit is vacuous; no Lean was run.
- Headline statability at the new pins: Mathlib f6090c7 has no p-divisible group, Dieudonné module, display, Breuil–Kisin or local-model carrier (case-insensitive search for p-divisible, Dieudonné, Breuil–Kisin, parahoric, display returns only unrelated Lie-algebra, Clifford and dynamics files); `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean`, class over `FractionRing (WittVector p k)` with a Frobenius-semilinear equivalence) carries no finiteness, filtration or integral lattice. Tau Ceti 358314d has none of these objects either. Every headline needs one of them, so none is statable and the empty file is the correct form; no padding is possible.
- Mathlib contract re-read at the pin (8 declarations): `WittVector` (`Defs.lean:52`), `WittVector.frobenius` (`Frobenius.lean:218`), `WittVector.frobeniusEquiv` (`Frobenius.lean:283`, `[PerfectRing R p]`), `WittVector.verschiebung` (`Verschiebung.lean:109`, additive), `WittVector.Isocrystal` (`Isocrystal.lean`), `DividedPowers` (`DividedPowers/Basic.lean:77`, `dpow_mul` with `x ∈ I`), `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson` (`Filtration.lean:415`), `IsLocalization.algebraMap_mem_map_algebraMap_iff` (`Localization/Ideal.lean:76`). Each hypothesis the README states is the pinned one.
- Supplier citations resolved at current heads (52 section or target citations in 14 roadmaps): FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.6–1.8, 1.22, 2.10–2.12, 2.27 (`deJongBoundedFormalFunctions` at its line 4203), 3.2–3.3, 4.1, 4.13, 4.16–4.21, 4.25 (R07.4.20 is stated for finite K/ℚ_p only, so gap `perfect-residue-bt-realization` is real; R07.4.19 and 4.25 are for K/K₀ finite totally ramified with perfect k, as consumed); AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (contravariant 𝓔xt¹ crystal); CrystallineCohomology §CR.7.1 and Layer CR.1; DerivedDeRhamCohomology §PD.7 with `Crystalline.fontaineEnvelope_initial` and `Crystalline.fontaineEnvelope_periodPDEnvelope` (its lines 2884 and 3007: these are the two resolver leads; they are planned supplier targets, not pinned names); PadicPeriodRings §3, §4.1, §4.3 (fundamental sequence 0→ℚ_p→B_cris^{φ=1}→B_dR/Fil⁰→0, absolute case only, so the relative gap is real); SchemeAndStackFoundations §§0.6, 1.15, 2.3, 4.1–4.4, 4.7–4.8, 4.12 on main; ModularCurves §0G on main; ReductiveGroupsPartII §§RG2.1.5, RG2.2.4 (*division-algebra-building*), RG2.3.3 (*parahoric-kottwitz-characterization*, P°_Ω=Fix_{G(E)}(Ω)∩ker κ_G), RG2.3.5, RG2.3.7, RG2.4.3 (t^λ is the inverse image of −λ with representative λ(ϖ)⁻¹, so the Layer 6 adapter t_here^λ=t_RG^(−λ) is still right); GeometricSatakeAndFusion Layer GS0 §0.31 "Witt affine flags and components" (GL₂ component label = determinant valuation, matching κ_Gm(p)=1) and §0.37 "Bounded admissible affine flag loci"; VectorBundlesAndIsocrystals by title (S01 for the layer numbers); PadicHodgeTheory §5.5 (torsor theorem for K/ℚ̆_p finite; general-perfect-residue admissibility); ShimuraVarieties §7.0i; PELModuli §M2.15 (Zink displays over W(R), formal groups); LubinTateFormalModulesAndQuasiCanonicalLifts is cited only as a scope boundary with no *Needs* edge.
- Merge order: this roadmap is line 150 of `merge-order/ORDER.txt`; every supplier is earlier (last: GeometricSatakeAndFusion, line 149). Dependency check output, verbatim: `depcheck: 210 roadmaps, 1835 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Every internal *Needs* reference points to an earlier target; the 14 `gap:` slugs of the README are exactly the 14 of `design/plan.json`, each with a named earlier supplier and a single-sentence `needs`.
- Ownership by object against the 452 open pull requests at their heads and main (roadmap grep): "Dieudonné display" occurs elsewhere only as a consumer in EndoscopicTransferAndUnitaryTraceComparison; "very good (integral|Hodge|embedding)" and "adapted lift/deformation" occur nowhere else; the σ-centralizer and ordinary normalization are restated in BunGAndNewtonStrata (#1241, order line 240) and AdmissiblePairsAndPadicHodgeStructures (#1511, line 245), both later, so ownership stays here as the package report recorded. No `Suggested.lean` name can collide (none declared).
- Locators: all 168 cited source lines (13 sources, 127 parenthetical citations plus 9 nested ones) were opened and read against the statement they support; each printed-page claim was checked against the page markers with the offsets KPZ26 0, KP18 +120, KZ25 0, Kisin17 0, Hoff23 0, vanHoften24 0, Zhu17 +402, Anschuetz22 0, Zhou20 0, Wintenberger97 +1287, Lau14 +2198, deJong95 +3: all agree. Restated hypotheses were compared with the sources: Hoff23 Notation 1.19 (nilpotent, compatible, continuous divided powers) with §1.7; KZ25 Definition 3.2.4 with §2.9 (its frame condition is equivalent to the README's "lifting the marked residual one" after a constant 𝒢(W) change of frame); KZ25 (A)–(C) with §4.12; KZ25 Proposition 2.3.3 (b in the admissible union and in [b]_μ) with §6.0; KPZ26 §5.3.19–Proposition 5.3.20 with §3.5; KPZ26 Theorem 6.1.1 (generic facet, R-smooth centralizer, p∤|π₁(G_der)|, G⊂G′ with equal derived groups, restriction a Hodge embedding) with §3.13; KPZ26 §5.2.4 and §3.4.3 (tot(L) over a determining segment) with §2.13; Kisin17 Theorem 1.1.4(2) (k separably closed, or G connected and k finite) with §5.1; Kisin17 Lemma 1.1.12's proof (b=h₁h₂·p^{h₂⁻¹υ′₀h₂}) with the one-sided form of §5.6; KP18 Lemma 3.1.17 (m_A^N⊂pA) with §1.4; KP18 Proposition 3.2.17 with §4.11; Zhou20 §5.5 (M(L)∩𝒢(O_L) parahoric) with §6.6; KPZ26 line 2688 supports the henselianity of Ŵ(S) asserted in §2.6's route.
- Checks tested by computation: 143 bullets read, 96 recomputed with values (ledger below); apart from the two in S03 and the restatements noted there, every bullet holds and discriminates.
- Policy: every target has a locator in its statement paragraph and a *Needs* line; `theorem`/`lemma` do not occur in Lean; no machine path in README, Lean or manifest; `sources.toml` has one key per work, RZ96 `uncertified`, RG71 `certified` with the Inventiones scan.

## Not verifiable

- RG71, I, Théorème 4.1.2, p.27 (gap `tensor-isomorphism-flatness-descent`, §§2.6 and 3.5): the cached extraction of the Inventiones scan carries page markers only, so the henselian-local hypothesis and the pointed-local form of the flattening functor could not be read against the text; KP18 line 2185 applies it to Ŵ(R_G) without restating hypotheses, and KPZ26 line 2688 calls Ŵ(S) henselian.
- RZ96, Proposition 1.21 (§5.3): settled uncertified; only the Kisin17 application (line 1455) was read.
- That Spf R_G with its maximal-ideal topology lies in de Jong's FS_O and is formally normal (the hypotheses under which §2.6 invokes `deJongBoundedFormalFunctions`): asserted in the supplier contract, not derived here; deJong95 Definition 7.0.1 was not opened.
- Ownership against open pull requests was checked through the roadmap index (452 pull requests) and the sibling checkouts named in the brief; board-stage designs other than those in the merge order were not read.
- The adversarial rows are falsification tests on instances, not proofs of the 92 targets, and they do not turn declared supplier contracts into theorems.

## Source issues

The round-1 errata (KPZ26 §3.3.1, §5.1.2, Remark 5.3.8, proof of Theorem 6.1.9, proof of Corollary 6.3.5; KP18 Lemmas 3.1.9, 3.1.17 and §3.2.12; KZ25 §§2.2.2, 3.2.5, 3.3.2, 3.4.2; Kisin17 Corollary 1.1.7, §1.1.15, Lemma 1.2.18, Corollary 2.2.5, (1.5.2)–(1.5.3); vanHoften24 Theorem 3.1.4) were re-read and stand; nothing further was found at the 168 locators opened.

- none

## Adversarial pass

Context: p=3 unless stated, W=W(k), 𝔖=W[[u]], ε²=0, E_ij matrix units, residue k as the layer prescribes. One row per statement; every row carries the values computed.

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| Conv.: D(H*)=D(H)^∨(−1), twist r multiplies F by p^{−r} | ℚ_p/ℤ_p (F=σ), μ_{p∞} (F=pσ) | dual of F=1 has F^∨=1, (−1) gives p; dual of p gives p⁻¹ then 1; jumps 0↔1 | exchanges the two lines; agrees with FFG R07.2.10's (Ff)(x)=σ(f(Vx)) |
| Conv.: μ₀, υ₀ for F=diag(p,1)σ | GL₂ | Fil¹=ker(F mod p)=ke₁; μ₀=diag(z⁻¹,1); υ₀=σ(μ₀⁻¹)=diag(z,1); p^{υ₀}=diag(p,1)=b | one-sided form with h=1 |
| Conv.: right action, T_p(q_g)=gᵗ | g=[[1,1],[0,1]], h=[[1,0],[1,1]] | gh=[[2,1],[1,1]]=(gh)ᵗ; hg=[[1,1],[1,2]]=(hg)ᵗ | distinct; order pinned |
| Conv.: κ_Gm(p)=1 versus GSF components | G_m, lattice pW | GSF §0.31: GL₂ label = determinant valuation; v(p)=1 | same sign |
| 0.1 Ŵ(R) | R=k; R=k[ε] | Ŵ(k)=W(k), Î=VW(k); m²=0 so "→0" means eventually 0: (ε,ε,…) excluded, (ε,0,…) allowed; p·Ŵ(m_R)=V(F(x))=0 since (aε)³=0 | holds |
| 0.2 perfect-ring Dieudonné | R=k×k ranks (0,1); R=0 | F=(0,1),V=(0,p): FV=VF=(0,p)=p; zero ring: zero module | holds; locally constant rank needed |
| 0.3 p-frame | D_k; (𝔖,(p)); multiplier a≠1 | φ₁(Vx)=x, φ(Vx)=px; φ₁(pu)=u³, pφ₁(pu)=pu³=φ(pu); a·φ₁ gives pau³≠pu³ | holds (KPZ26 lines 2077–2081) |
| 0.4 log coordinates | B=𝔽₃[x,y]/(x³,y³), b=(x,y) | [x]+[y] second coordinate (x³+y³−(x+y)³)/3=−x²y−xy²≠0; [x+y]_log additive; γ₃(x+y)=(x²y+xy²)/2, γ_n=0 for n≥5 on b | holds; PD structure exists and is nilpotent |
| 0.5 height-one shtuka | R=𝔽₃, M=ℤ₃ | F=3 ⇒ V=F⁻¹p=1; F=1 ⇒ V=3; F=9: 3M⊄9M | both endpoints allowed, height two excluded |
| 0.6 normal pair | d=0; d=h; S², M₁=Se₁⊕Ie₂, e₁↦e₂ | M₁=IM; M₁=M; e₁∈M₁↦e₂∉M₁ when 1∉I | holds |
| 0.7 relative frame | B=R; k[ε]→k; 𝔽₃[x]/(x⁴)→𝔽₃ | Î_{B/B}=Î_B; φ₁([ε])=0; x³≠0=3!γ₃(x): no PD structure | holds; third Check S03 |
| 0.8 tilde functor | composition of two block maps; upper-right b; lower-left Vx | (1,1) block φ(A′A)+pφ(B′)φ₁(C)=φ(A′A+B′C) since φ(C)=pφ₁(C); (2,1) block φ₁(C′A+D′C)=φ₁(C′)φ(A)+φ(D′)φ₁(C); b↦pφ(b); Vx↦x | composition preserved; holds |
| 0.9 strict base change | identity; W(k)→k | identity gives identity; W(k)→k is not strict (φ₁(p)=1 cannot descend) and is excluded | holds |
| 0.10 j | d=0; d=h; (2,1); S=W, d=0 ⊗k | j=p; j=1; diag(1,p), image φ*L⊕pφ*T=image(φ*M₁) as φ(I)=pS; p⊗k=0:k→k | holds |
| 0.11 display | ℚ_p/ℤ_p; μ_{p∞}; ordinary | (Φ,M₁)=(σ,pM); (pσ,M); Φ(px)=pσ(x)=pΦ₁(px); ranks (2,1) | holds; rank(M₁/ÎM)=dim H matches Hoff Def 1.2/Thm 1.29 |
| 0.12 base change | identity; R/m³→R/m²→k vs direct | Ψ; Ψ₀ on both routes (ε killed) | holds |
| 0.13 anti-equivalence | ℚ_p/ℤ_p; μ_{p∞} | (F,V)=(1,p), Fil¹=0; (p,1), Fil¹=M; duality with (−1) swaps | holds (Lau14 Cor 5.5–5.6, Hoff Thm 1.29 contravariant) |
| 1.1 R_GL | (1,0),(1,1),(2,1),(3,1) | O_F; O_F; O_F[[t]]; dimension 2=d(h−d); dim H=d | holds |
| 1.2 enlarged ideal | I=I′; k[ε] | identity; [ε]E₂₁ is a pair map for Î_B⊕[ε] but not for Î_B (w₀([ε])=ε≠0), tilde lower-left φ₁′([ε])=0 | holds |
| 1.3 canonical c | constant; Z=Vε; ⊗k | c=1; c=1+εE₂₁, c⁻¹=1−εE₂₁; diag(1,p)⊗k=diag(1,0) kills e₂ so the square alone cannot fix the lower-left block | holds (KPZ26 (5.1.18)) |
| 1.4 rational section | constant display; (p)-adic topology of Ŵ(A)[1/p] | section = constant embedding; every element lies in all pⁿŴ(A)[1/p], topology trivial, so the lattice neighbourhoods pⁿŴ(A) are required | holds (KPZ26 §7.3.1(2)) |
| 1.5 constancy | c=1+εE₂₁; p=aπ_E² | Ψ=Ψ₀c⁻¹=Ψ₀(1−εE₂₁); R/(m²+p)=O_E/(π_E²)≠R/(m²+π_E)=k | holds |
| 1.6 tensors under section | id; E₁₁ with diagonal c | c·id·c⁻¹=id; cE₁₁c⁻¹=E₁₁ | holds |
| 1.7 crystalline deformation | k[ε]→k, (2,1); (1,1) | lifts of ke₁: graph(e₁+aεe₂), a∈k, one-dimensional; unique lift | matches Grassmannian tangent d(h−d) |
| 1.8 universal display | (2,1); (1,0) | O_F[[t]], tangent k; O_F, tangent 0 | holds |
| 2.0 J_b | G_m,b=p; diag(p,1); conjugated torus | σ(g)=g ⇒ ℚ_p×; pσ(x)=x ⇒ v(x)=1+v(x) ⇒ x=0; [[2,−a],[0,1]] vs entrywise [[2,−σ(a)],[0,1]] | holds after F01 |
| 2.1 tensor datum | empty; E₁₁ on k[ε]; id∈Λ⊗Λ∨ | GL(Λ); (1+εE₂₁)E₁₁(1−εE₂₁)=E₁₁+εE₂₁ excluded; g·id·g⁻¹=id but covariant g⊗g moves Σe_i⊗e_i^∨ unless ggᵗ=1 | holds; "acceptable" = KZ25 Def 3.1.2 |
| 2.2 Eisenstein lattice | Fil¹=0; full; split | E(D⊗𝔖); D⊗𝔖; 𝔖e₁⊕E𝔖e₂ with quotient 𝔖/(E)=O_K; with p: k[[u]] | holds |
| 2.3 R_G | GL₂ (2,1); torus E₁₁ | O_Ĕ[[t]], line e₁+te₂; O_Ĕ, point | holds; properties come from the declared gaps |
| 2.4 lattice torsor | torus, F=𝔖e₁⊕E𝔖e₂ | E₁₁e₁=e₁∈F, E₁₁(Ee₂)=0; frame (e₁,Ee₂) | trivial torsor with explicit section |
| 2.5 BK to tilde | full line; zero filtration | unscaled; φ(E([π]))=p·unit so the p-scaled line, matching j=p at d=0 | holds (KP18 (3.2.10)) |
| 2.6 integral tilde tensors | f=p, f=1 in Ŵ(O_K); s=x/p in ℤ_p[[x]] at x↦π, π²=p; empty tensors | p/p=1; 1/p∉O_K; v_K(π/p)=1−2=−1 so unbounded; T=GL_h flat, ideal 0 | holds; henselianity at KPZ26 line 2688 |
| 2.7 horizontality | id; E₁₁ with 1+εE₂₁; torus datum | id; E₁₁+εE₂₁≠E₁₁; R_G=W(k), a_G=(3), c=id, E₁₁ fixed, diag(2,1)E₂₁diag(1/2,1)=(1/2)E₂₁ with 1/2≡2 | holds |
| 2.8 parahoric display | GL_h; R=k[ε]; E₁₁-cut | ordinary (h,d); Ŵ(R)[1/p]=W(k)[1/p], Ψ₀ and Ψ₀(1+[ε]E₂₁) agree rationally; Ψ block-diagonal | holds; second Check S03 |
| 2.9 adapted | empty; torus type, line K(e₁+te₂); μ_{p∞} | usual type; E₁₁(e₁+te₂)=e₁∉line (t≠0), adapted at t=0; Fil¹=M | holds; equals KZ25 Def 3.2.4 up to a constant frame change |
| 2.10 very good | empty; GL iso moving E₁₁; torus swap | all good are very good; fails; wE₁₁w⁻¹=E₂₂ | holds (KPZ26 Def 5.2.5) |
| 2.11 independence | E₁₁ vs (E₁₁,1−E₁₁); id alone | same fixer, c fixing E₁₁ fixes 1−E₁₁; id alone has fixer GL₂ | holds |
| 2.12 unramified detection | k→𝔽_q coefficients | ε stays nonzero; σ[a]=[a³]≠[a] for a∉𝔽₃ | holds (KPZ26 §5.2.6) |
| 3.1 curve lattice | k[[u]]-curve e₁+ue₂ | F=S(e₁+ue₂)+pSe₂ rank 2, pM⊂F⊂M; u/p has valuation −1 in W(K)[1/p]∖W(K); S[1/p]∩W(K)=S since S/p=k[[u]]↪K | holds |
| 3.2 invariant endomorphisms | scalar λ; E₁₁ vs 1+εE₂₁ | [λ,c]=0; [E₁₁,1+εE₂₁]=−εE₂₁ so only 𝒢-fixed endomorphisms, for which c is 𝒢-valued, are horizontal | holds (KPZ26 Lemma 5.3.2) |
| 3.3 curvewise c | u↦ε; (p,ε)-frame | u²↦0; φ(ε)=φ₁(ε)=0; id discrepancy 0; ε≠0 integrally but 0 rationally on k[ε] | integral equality is not deduced from rational |
| 3.4 products | two rank-one diagonal factors; rank-0 factor | c=diag(1,1), E₁₁,E₂₂ fixed; nothing | holds |
| 3.5 neutral closure | hyperbolic O₂ on ℤ₃² | XᵗJ+JX=aJ forces diagonal X; swap lies in the other component; μ=diag(z,1) is in GO⁺ | holds (KPZ26 §5.3.19) |
| 3.6 summand | c=diag(c₁,c₂); zero summand | restriction c₁; rank 0 not faithful | holds |
| 3.7 curve-spanned | xy=0 | tangents (1,0),(0,1) from the branches span k²; a curve with jet (1,1) has xy=u²+…≠0 | spanning, not lifting |
| 3.8 centralizer | E₁₁ in GL₂ | centralizer = diagonal torus; 1+εE₂₁ fails by εE₂₁ | scheme-theoretic intersection needed |
| 3.9 arithmetic curves | π_E=π_K²; unramified | m_K/(m_K²+π_E)=k; 0 | holds |
| 3.10 copies | G_m on ℤ₃, n=0,1,2; weights ±1 | GL(0)={1}, kernel G_m; a↦a; diag(a,a), commuting with the block map forces a=b; 2≠2⁻¹ in ℤ₃ | n≥1 needed and stated |
| 3.11 type A | D=K, m=1; m=0 | rank-one lattice, frame 1; no carrier | holds (KPZ26 Prop 6.3.2) |
| 3.12 segments | repeated segment | rh→2rh, transitions p·id, projections id | holds |
| 3.13 nonexceptional | GL₂ hyperspecial μ=(1,0); torus | P¹, tangent 1; point | hypotheses equal KPZ26 Thm 6.1.1 |
| 3.14 Dᴴ pairing | (−1,3)/ℚ₃, φ(t,t′)=tit̄′, φ₀(x,y)=x̄y | (i⊗1,1⊗1): φ₀(1,i)φ(1,1)=i·i, Trd −2; (1⊗i,1⊗1): φ(i,1)=i², Trd −2; reversed φ₀: (−i)(i)=1 gives +2 vs −2 | order as printed descends (KPZ26 line 2981) |
| 3.14 split | V₀=K², S₀(e₁,e₂)=1 | ψ(e₁⊗v,e₂⊗w)=1, reverse −1 | holds |
| 3.15 trace form | D=K, m=1, ξ=(1,−1) | ψ((v,f),(w,g))=fw−vg; ψ((1,0),(0,1))=−1, reverse 1 | holds |
| 3.15 paired chain | Λ_i=p⁻ⁱℤ_pe | Λ_i^♯=pⁱℤ_pf; p⁻ⁱ(ℤ_pe⊕ℤ_pf) has dual index −i; ℤ_p² and p⁻¹ℤ_pe⊕pℤ_pf incomparable | holds |
| 3.15 GSp | (1,diag(1,2)) | multipliers 1 and 2 | excluded, also mod 3 |
| 3.16 tame dual | δ=1; L=ℚ₃(π), π²=3, δ=2π, M=πO_Le⊕O_Lf | self-dual; M^Γ=3ℤ₃e⊕ℤ₃f, dual ℤ₃e⊕3⁻¹ℤ₃f; δ⁻¹M^♯=π⁻¹O_Le⊕3⁻¹O_Lf with invariants ℤ₃e⊕3⁻¹ℤ₃f; without δ⁻¹: ℤ₃e⊕ℤ₃f | holds |
| 3.17 enlargement | diag(a,b); (1,g), g∈SO noncentral; l∈L× | similitude ab; h(v,gw) not proportional; l(xd)=(lx)d | holds |
| 4.1 punctured exactness | ideal (p,u) | unit ideal on D(p)∪D(u), not on Spec 𝔖 | exactness only on U (KP18 Thm 3.3.2) |
| 4.2 Kottwitz image | GL₂ hyperspecial; dilatation of GL₂ along H₀ | 𝒢°=𝒢; diag(1,χ): det a unit so κ=0, reduction diag(1,χ̄)∈H₀(𝔽_p)∖scalars (χ̄ onto 𝔽_p^×) | B01 repair holds |
| 4.3 tensor frames | constant torus; smooth torsors over 𝔖 | frame 1; k algebraically closed gives a k-point, Hensel lifts it | holds |
| 4.4 integral comparison | μ_{p∞}; ℚ_p/ℤ_p | L=ℤ_p(−1), F=p; L=ℤ_p, F=1 | holds |
| 4.5 filtration cocharacter | ordinary ke₁; swap | diag(z,1); ke₂ is a different marked type | holds |
| 4.6 rigid section | c=1+εE₂₁; lift ·(1+pX) | Ψ=Ψ₀c⁻¹; same reduction mod p | existence, not uniqueness |
| 4.7 Hoff compatibility | constant torus; off-diagonal | E₁₁ both; E₁₁ vs E₁₁+εE₂₁ | equals Assumption 2.28 |
| 4.8 tangent lifting | (2,1); (1,0) | O_K both sides; 0 | holds |
| 4.9 interpolation | a≡b mod π; (0,1) | f(T)=a+(b−a)T/π; 0≢1 so (0,1)∉O_K×_kO_K | holds |
| 4.10 four criteria | GL₂ ordinary; torus; ε↦pⁿε | rank 1=dim GL₂/B; 0; injective over O_K[ε], zero over k[ε] | holds |
| 4.11 factorization | O[[t]], torus t=0; I=(T²), I=(3) in ℤ₃[[T]] | adapted ⇔ t↦0; ∩(T²+Tⁿ)=(T²), contraction (T²); B/(3) has 3-torsion, contraction B | holds |
| 4.12 versal | GL datum; torus | all maps factor; exactly t↦0 | holds; labels S02 |
| 4.13 parahoric universal | O_Ĕ[[t]]→k[ε], t↦ε; T^m∈(T^n) | ε survives, every map to O_K kills it; iff m≥n, ∩=0 | reduced lifting needed |
| 4.14 recognition | constant E₁₁; rational projector with p⁻¹ | forces t=0; different integral type | holds |
| 5.1 BK frames | G_m; finite k, connected; finite k, ℤ/2 | frame 1; H¹(𝔽_q,G)=1; H¹(𝔽_q,ℤ/2)=ℤ/2 | connectedness needed for finite k |
| 5.2 relative A_cris | R=W(k); x=[p♭]−p; p | cover completes to O_C, φ(t)=pt; θ(x)=0, θ(φ(x))=p^p−p≠0; θ(p)=p so p∉Fil¹, p∈J | holds |
| 5.3 toral admissibility | G_m, b=p; slope-0 line with jump 1 | μ_T=z⁻¹, average = ν⁻¹; filtration by μ_T⁻¹=z has t_H=t_N=1; t_H=1>t_N=0 fails | sign consistent with μ₀⁻¹ |
| 5.4 hyperspecial adapted | empty; E⁻¹; μ_{p∞} | ordinary lift; pole at E=0; ℤ_p(−1), F=p | holds |
| 5.5 relative comparison | ℚ_p/ℤ_p; μ_{p∞}; 0; ordinary | identity; t·unit with θ(t)=0; 0; diag(t,1) | holds (Kisin17 (1.1.16)) |
| 5.6 double coset | b=diag(p,1)σ | Fil¹=ke₁, μ₀=diag(z⁻¹,1), υ₀=diag(z,1), b=1·p^{υ₀} | one-sided form from Kisin17's proof |
| 5.7 explicit lift | E(0)=ap | c=σ⁻¹(h)μ₀(E(0)/p)∈G(W); residual cμ₀(E(0))⁻¹=σ⁻¹(b); with μ₀(p): σ⁻¹(b)μ₀(a)⁻¹ | unit correction needed |
| 5.8 Frobenius pullback | constant g; denominator p^r | dg=0, n=0; σⁿ puts d into pⁿΩ, integral for n≥r | holds |
| 5.9 framed datum | b=1; p; diag(p,1); swap | Fil¹=0; all; diag(1,p)W²→ke₁; ke₂ | holds (KZ25 line 1140) |
| 5.10 connection | R=W[[t]], F=(1+tE₂₁)diag(p,1), N=nE₂₁ | dF=pE₂₁dt, NF=npE₂₁, Fφ(N)pt^{p−1}=φ(n)pt^{p−1}E₂₁ ⇒ 1+n=t^{p−1}n(t^p), n=−Σt^{pʳ−1}; σ=E₁₁+hE₂₁ with h′=−n, h=Σt^{pʳ}/pʳ; Fil¹ kept iff h=0; (h)=(t) | holds exactly |
| 5.11 loci equality | projector example | adapted ideal (t), horizontal ideal (h)=(t); ambient [N(0),E₁₁]=−E₂₁ | holds |
| 5.12 smooth quotient | GL₂ ordinary; torus | dim 1=dim GL₂/B; 0 | holds (Kisin17 Prop 1.1.10) |
| 5.13 étale tensors | constant projector; disconnected base | coefficient 1; components with 1 and p⁻¹ | connected base retained |
| 5.14 recognition | μ_{p∞}; lattice p⁻¹L | ℤ_p(−1), jump 1, F=p; different marked type | holds |
| 5.15 geometric tensors | product family | factor projector E₁₁ in étale, de Rham, crystalline; polarization keeps twist | holds |
| 5.16 specialization | g=1; g=p; gh | L; pL, dual p⁻¹T_p, crystal pW, κ=1; unchanged | holds |
| 5.17 isogenous lift | reference filtration; g=p; k=𝔽₃, K=ℚ₃ | identity quasi-isogeny; lattice changes; K̆=ℚ̆₃, κ(b)−μ♮=0, V_cris=ℚ₃t⁻¹ for both lines | F02 repair holds |
| 5.18 Kottwitz equality | G_m, g=p; g=1 | g⁻¹bσ(g)=p, κ(g₀)=κ(g)=1; 0 | holds |
| 5.19 central quotient | id on G_m; det on GL₂ | pW↦pW; diag(p,1)↦p, valuation 1 | holds |
| 6.0 normalization | G_m μ=1; GL₂ (1,0); (1/2,1/2); σ-swapped torus; trivial | t_here¹↦p, κ=ν=1, pW⊂W; t_RG¹↦p⁻¹ fails; diag(p,1): det valuation 1, ℓ=⟨(1,0),(1,−1)⟩=1, slopes (1,0); not ordinary; t^{(1,0)}σ(t^{(1,0)})=t^{(1,1)}; identity | adapter matches RG2.4.3 and KZ25 Prop 2.3.3 |
| 6.1 ordinary datum | b=diag(p,1); supersingular | M diagonal, slopes 1,0, Hodge lattice diag(1,p)W²→ke₁; fails | holds |
| 6.2 central filtration | diagonal Levi | diag(z,1) central fixes ke₁; E₂₁ moves it | holds |
| 6.3 central lift | E=u−p; E(0)=ap | c_E=p(u−p)/(−p)=p−u, c_E(0)=p; c_E=E/a, c_E(0)=p, E alone gives ap; image E(u)Θ(φ*𝔐)⊃E(u)φ*𝔐 so height ≤1 | holds (Zhou20 line 613) |
| 6.4 existence | μ_{p∞}⊕ℚ_p/ℤ_p; 0 | product lift with its filtration; unique zero lift | holds |
| 6.5 centralizer action | (gh)ᵗ vs (hg)ᵗ; p | [[2,1],[1,1]]≠[[1,1],[1,2]]; quasi-isogeny of height 2, inverse not integral | holds |
| 6.6 Levi filtration | diagonal Levi, ke₁; opposite line | same product lift; different marked filtration | holds (Zhou20 §5.5) |

## Check ledger

| Section | Bullets | Computed outcomes in bullet order |
|---|---:|---|
| 0.1 | 3 | W(k), VW(k); constant ε excluded, finite support allowed; W(k)→R=W(k) exists without a section |
| 0.3 | 3 | φ₁(Vx)=x; u³ not 3u³; multiplier 2 gives 2≠1 |
| 0.4 | 3 | b=0: Î_B, V⁻¹; φ₁([ε])=0; −x²y−xy²≠0 versus 0 |
| 0.5 | 3 | (3,1),(1,3); zero module; ranks (0,1) |
| 0.6 | 3 | IM; M; e₁↦e₂ excluded |
| 0.7 | 3 | absolute frame; 0; third bullet has no instance (S03) |
| 0.8 | 3 | pφ(b); x; diag(1,0) has kernel, τ stays free |
| 0.10 | 3 | p; 1; p⊗k=0 and φ₁(p)=1 |
| 0.11 | 3 | (σ,pM); (pσ,M); (2,1) versus (2,2−1) |
| 0.12 | 3 | Ψ; free; both routes Ψ₀ |
| 1.1 | 3 | O_F; O_F[[t]]; dim H=d |
| 1.2 | 3 | identity; [ε] direction killed; three-ideal chain gives the identity on either route |
| 1.3 | 3 | 1; ε lower-left; diag(1,0) kernel |
| 1.4 | 3 | constant; p⁻¹∉Ŵ(A); graph(e₁+ae₂)≠residual line |
| 1.5 | 3 | Ψ₀(1−εE₂₁); O_E/(π_E²) vs k; identity over k |
| 2.0 | 4 | ℚ_p×∋p⁻¹; off-diagonal 0; trivial; [[2,−a],[0,1]] vs [[2,−σ(a)],[0,1]] |
| 2.1 | 4 | GL(Λ); dual-number test εE₂₁; disconnected fixer rejected; id fixed, covariant copy fails |
| 2.2 | 3 | E·; all; O_K versus k[[u]] |
| 2.3 | 3 | O_Ĕ[[t]], line e₁+te₂; no map; O_Ĕ |
| 2.6 | 3 | 1 versus 1/p; valuation −1 versus 1; ideal 0, ℤ_p→ℚ_p not pointed local |
| 2.7 | 3 | id; E₁₁+εE₂₁; torus c=id, (1/2)E₂₁ |
| 2.8 | 3 | (h,d); second bullet has no instance (S03); diagonal blocks |
| 2.9 | 3 | usual type; e₁∉K(e₁+te₂), t=0 adapted; Fil¹=M |
| 2.10 | 3 | all; fails; E₂₂, wE₁₁w⁻¹≠E₁₁ |
| 2.13 | 3 | Λ; e↦pe; p⁻ⁱ versus pⁱ indices |
| 3.10 | 3 | kernel G_m at n=0; a=b; 2≠2⁻¹ |
| 3.14 | 3 | −2,−2 versus 2,−2; 1,−1; zero representation |
| 3.15 | 3 | −1,1; incomparable same-index pairs; 1,2 |
| 3.16 | 3 | self-dual; ℤ₃e⊕3⁻¹ℤ₃f both sides, ℤ₃² without δ⁻¹; index −i |
| 3.17 | 3 | ab; not proportional; (lx)d |
| 4.6 | 3 | εE₂₁ obstruction; GL lift; 1+pX |
| 4.9 | 3 | residues differ; constant; (0,1) excluded |
| 4.13 | 3 | O_Ĕ[[t]]/(t); ε killed by O_K-points; ∩(Tⁿ)=0 |
| 5.2 | 6 | p^{1/3}∉W(k); conjugation; k[ε] not normal; φ(t)=pt; p^p−p≠0; p∉Fil¹ |
| 5.4 | 3 | all types; pole at E; ℤ_p(−1) |
| 5.5 | 3 | 1; t nonunit; 0 and diag(t,1) |
| 5.7 | 3 | invertible; cokernel 𝔖/(E); ap versus p |
| 5.9 | 3 | 0; all; ke₁ versus ke₂ |
| 5.10 | 3 | origin; ideal 0; N(0)=−E₂₁, h=t+…, (h)=(t) |
| 5.13 | 3 | 1; components 1 and p⁻¹; Hom(T_p,ℤ_p) |
| 5.16 | 3 | W; pW, κ=1; gh |
| 5.17 | 4 | identity; g=p; ramified extension insufficient; K̆=ℚ̆₃, 1−1=0 |
| 6.0 | 4 | p, (1,1); diag(p,1) values 1,1,1,(1,0); (1/2,1/2) fails; torus (1,1), trivial 0 |
| 6.1 | 3 | ke₁; not ordinary; O₂≠SO₂ |
| 6.3 | 4 | F=1; F=E/a; non-central λ̃ breaks M-stability; p versus ap |

## Declared-gap audit

| Slug | Supplier (order line) | Precise, minimal, declared in both files |
|---|---|---|
| perfect-residue-bt-realization | FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.20 (#879) | R07.4.20 stops at finite K/ℚ_p; K=W(F̄_p)[1/p] is inside the request; same sentence in plan and README |
| relative-crystalline-constants | PadicPeriodRings 4.3 (#940) | §4.3 is absolute; relative cover and filtration shift stated; prose expansion of the formula only |
| tensor-isomorphism-flatness-descent | SchemeAndStackFoundations 4.12 (main) | henselian, pointed-local, finite-type hypotheses stated; ℤ_p→ℚ_p excluded as a detector |
| formal-dvr-point-detection | SchemeAndStackFoundations 4.7–4.8 (main) | joint injectivity only, after F03; k[ε] shows why reduced is kept |
| punctured-disc-torsor-patching | SchemeAndStackFoundations 1.15 (main) | (p,f) primary excludes f=p whose opens miss (p) |
| full-fixer-cutting-tensors | ReductiveGroupsPartII RG2.3.5 (main) | scheme-theoretic on every algebra; E₁₁ over dual numbers |
| parahoric-disc-purity | ReductiveGroupsPartII RG2.3.3 (main) | Anschuetz22 Prop 10.3 verbatim range; triviality separate |
| full-fixer-component-reduction | ReductiveGroupsPartII RG2.3.3 (main) | KP18 (3.2.7)–(3.2.8) step; trivial Γ-class needed |
| ordinary-levi-full-fixer | ReductiveGroupsPartII RG2.3.3 (main) | KZ25 lines 1152–1165 hypotheses; diagonal GL₂ gives W^××W^× |
| scheme-local-model-representative | GeometricSatakeAndFusion GS0 §0.37 (#1235) | KPZ26 Thm 3.2.15 hypotheses; v-sheaf model is the supplier's §0.37 |
| scheme-local-model-hodge-immersion | GeometricSatakeAndFusion GS0 §0.37 | m≥1 retained; m=0 not faithful |
| schubert-curve-spanned-tangents | GeometricSatakeAndFusion GS0 §0.37 | KPZ26 Thm 4.1.6 hypotheses; spanning only |
| local-model-curve-spanned-tangents | GeometricSatakeAndFusion GS0 §0.37 | KPZ26 Thm 4.4.3 (1)–(2) retained |
| integral-hodge-realization-extension | ShimuraVarieties 7.0i (#933) | rational comparison on a given abelian scheme; no integral model consumed |

## Lean inventory

| File region | Section variables / instances | Declarations | Conclusion |
|---|---|---|---|
| `Suggested.lean` lines 1–60 | none; one namespace | 0 definitions, 0 instances, 0 theorems, 0 examples; `import Mathlib` only | nothing to elaborate; no binder can be lost; no padding; docstring names 21 non-statable headlines with their missing carriers |

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cf48b630bb1c99d04ec2fe544295e53b140c3329", "job": "RT-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~2b", "model": "fable", "worker": "chris-f"} -->
