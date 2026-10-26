<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1244#issuecomment-6406319659 -->
Review (claude) of e5dbe2c

Verdict: accepted
Conditional on the announced gaps: `perfect-residue-bt-realization`, `relative-crystalline-constants`, `tensor-isomorphism-flatness-descent`, `formal-dvr-point-detection`, `punctured-disc-torsor-patching`, `full-fixer-cutting-tensors`, `parahoric-disc-purity`, `full-fixer-component-reduction`, `ordinary-levi-full-fixer`, `scheme-local-model-representative`, `scheme-local-model-hodge-immersion`, `schubert-curve-spanned-tangents`, `local-model-curve-spanned-tangents`, `integral-hodge-realization-extension`

1. **F01** (P3) deJong95 Proposition 7.3.6 is on printed page 89

   **Location.** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:46`: "(deJong95, Proposition 7.3.6, p.88 and Theorem 7.4.1, pp.90–91; deJong95 lines 2952 and 2988)"; line 1612 of the References: "Proposition 7.3.6, p.88"; `sources.toml`, entry `deJong95`, field `locator`.

   **Claim.** The proposition is on printed page 88.

   **Witness.** deJong95 line 2952 lies in the page block opened at line 2934, whose running head (line 2935) is printed page 89. The next block (line 2969, head 90) holds Theorem 7.4.1 at line 2988, so "pp.90–91" is right and "p.88" is one page early. The manifest's own note (printed 88 is PDF 85) gives PDF 86 = printed 89, consistent with the running head.

   **Repair.** Write "Proposition 7.3.6, p.89" at README lines 46 and 1612 and in the manifest `locator`; keep the `version_note`. Retested: PDF page index 86 − 85 + 88 = 89.

2. **F02** (P3) KZ25 §3.4.1 begins on page 25

   **Location.** `README.md:1305`: "(… KZ25, §3.4.1, p.26; KZ25 lines 1115–1140)"; `README.md:1494`: "(KZ25, §3.4.1–3.4.2, pp.26–27; KZ25 line 1115)".

   **Claim.** The cited line 1115 is on page 26.

   **Witness.** KZ25's page-26 marker is line 1123; §3.4.1 opens at line 1115, inside the page-25 block (lines 1081–1122). This is the pattern of round 3's F02 (a section that starts on the previous page).

   **Repair.** Line 1305: "§3.4.1, pp.25–26"; line 1494: "§§3.4.1–3.4.2, pp.25–27". The Layer-6 header at line 1474 (lines 1133–1176, pp.26–27) and the worked example at line 1592 (line 1139, p.26) are correct and stay. Every other KZ25 page citation was checked against the markers (lines 321, 367, 414, 459, 505, 961, 1003, 1042, 1081, 1123, 1166, 1209) and is right: README lines 547, 591, 692, 1027, 1036, 1047, 1129, 1140, 1164, 1478, 1515, 1524, 1546, 1555, 1590.

3. **F03** (P3) §3.4 is stated at all points but §3.10 uses it at one point

   **Location.** `README.md:814`: "their product acting on Λ₁⊕Λ₂ is good and very good"; `README.md:880`: "is good and very good at (x,…,x) by the product criterion".

   **Claim.** §3.10's proof route obtains very-goodness of 𝒢ⁿ at the single point (x,…,x) from §3.4, whose hypothesis and conclusion are global ("very-good embeddings", "is good and very good"), while §3.10's hypothesis is very-goodness at x only.

   **Witness.** KPZ26 Lemma 5.3.9 (line 2444) is stated globally, but its proof (lines 2449–2453) is pointwise: c = ⊕c_i and the projection endomorphisms are horizontal by Lemma 5.3.2, so the i-th cutting family is horizontal at (x₁,…,x_r) exactly when it is horizontal at x_i. The pointwise statement is what §3.10 (and §3.14's "product criterion for GO⁺×GO⁺") consumes.

   **Repair.** In §3.4 state: "the product is good, and very good at (x₁,…,x_r) whenever the i-th factor is very good at x_i; in particular it is very good when every factor is." Nothing changes in §3.10. Tested on §3.10's own instance: 𝒢 = G_m on ℤ₃, n = 2; the product G_m² on ℤ₃² has local model a point for the weight-(1,1) type, c = c₁⊕c₂ = 1 ⊕ 1, and the diagonal G_m is cut out of G_m² by the single endomorphism E₂₁ (commutation forces a = b); very good at the unique point.

4. **F04** (P3) §2.0's inner-form identification has no locator

   **Location.** `README.md:532`: "identify it as an inner form of the Newton Levi for basic b in that Levi (KZ25, §3.4.4, p.27; KZ25 line 1183)".

   **Claim.** KZ25 §3.4.4 supports the inner-form identification.

   **Witness.** KZ25 lines 1183–1188 say that J_b is a reductive group over ℚ_p, give its functor of points, and show J_b(ℚ_p) ⊂ M(Q̆_p) for b = σ(ṫ_{μ′}); there is no inner-form statement. The Needs line's other supplier, PadicHodgeTheory §5.5 (line 1102 of its README), supplies σ-conjugacy, B(G), ν_b and the Kottwitz invariant, not J_b.

   **Repair.** Add a locator for the inner-form clause, for instance RZ96 Corollary 1.14 under the existing uncertified key (widening the RZ96 entry at README line 1613 and in the manifest from "the toral criterion" to both uses), or drop the clause and keep "reductive over ℚ_p with J_b(ℚ_p) ⊂ M(K₀)". Checked on b = diag(p,1): M is the diagonal torus, J_b = (ℚ_p^×)² = M(ℚ_p), the trivial inner form; on b = p in G_m, J_b = G_m.

Reviewed at the pull request's current head (the checkout was already at it; no fetch was needed): `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md` (1613 lines), `Suggested.lean` (60 lines, zero declarations), `metadata.toml`, `sources.toml`, and `design/plan.json` for the gap list. The round-3 review and the round-4 repair report were read first; both round-3 findings are repaired (table below). Four non-blocking findings remain, all P3: two page locators, one route input stated at a different generality from its use, one claim without a locator. No P1 or P2. The acceptance is conditional on the fourteen declared supplier gaps listed in `review.json`.

## Verified sound

### Mechanical checks

- Head: the checkout's HEAD equals the pull request's current head (the fix commit "round 4 … 2 of 2 findings applied"); the round-4 diff touches README lines 98, 753, 872–882 and 1058 and the `gaps` entry of `design/plan.json` only.
- `lake env lean` on `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean`, run from the pinned content checkout (Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…` per `lake-manifest.json`, both checked against the package checkouts' HEADs): exit 0, no output, 3.3 s. The file has one `import Mathlib`, one module docstring, the namespace and no declarations; the `#check @name` enumeration is empty, so there is nothing for the one-tactic probe, no sorry'd data, no `set_option`, no `lemma`.
- Dependency check (`gate --depcheck … --movable`), complete output:

  ```text
  depcheck: 56 roadmaps, 648 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. In the merge order this roadmap is at line 150; its suppliers are at lines 2 (SchemeAndStackFoundations), 20 (PadicPeriodRings), 21 (DerivedDeRhamCohomology), 22 (CrystallineCohomology), 24 (ReductiveGroupsPartII), 47 (AbelianSchemesAndArithmeticModuli), 54 (FiniteFlatGroupsAndIntegralPadicHodgeTheory), 55 (LubinTateFormalModulesAndQuasiCanonicalLifts), 118 (ShimuraVarieties), 131 (PELModuli), 139 (PadicHodgeTheory), 142 (VectorBundlesAndIsocrystals), 149 (GeometricSatakeAndFusion); ModularCurves is on main.
- Citation resolver on the README: no cross-roadmap citation and no Lean name found nowhere. The two leads the worker recorded (`Crystalline.fontaineEnvelope_initial`, `Crystalline.fontaineEnvelope_periodPDEnvelope`) resolve to DerivedDeRhamCohomology §PD.7 (its README lines 2767 and 2850 at the open head), planned targets of that supplier, not pinned declarations.

### Previous findings checked individually

| Round-3 finding | Repaired passage (README) | Status and witness |
| --- | --- | --- |
| F01 (P2): isomorphic copies for every multiplicity including zero | Line 872: "let n≥1 … if Λ₁ is good and very good at x, the diagonal sum Λ₁⊕⋯⊕Λ_n is good and very good at x. The hypothesis n≥1 is needed"; lines 874–878, three Checks; line 880, n-block route via §3.4 and §3.8; line 882, Needs gains §3.4. Line 753 (§2.13): "r≥1 lattices". Line 98 and `plan.json` gap `scheme-local-model-hodge-immersion`: "some repeated sum ρ^⊕m with m≥1". | **Repaired.** KPZ26 Lemma 5.3.7(b) (lines 2412–2416) is the two-copy step from a very-good Λ₁; line 1122 writes ρ^{⊕m} "for any m≥1"; §5.2.4 (lines 2351–2357) defines tot(L) from a determining segment. Recomputed: n=0 gives Λ⁰=0, GL(0)={1}, image of 1 and −1 equal, kernel G_m; n=1: a↦a; n=2: a↦diag(a,a), kernel 1. Intertwiner equation: diag(a,b)·E₂₁ = bE₂₁, E₂₁·diag(a,b) = aE₂₁, equal iff a=b. Weight ±1: an intertwiner c∈ℤ₃^× needs a=a⁻¹ for all a; a=2 gives 2·2=4≠1. Goodness of the diagonal: Mloc→Gr(d,Λ₁) closed immersion and ∏Gr separated give Mloc→∏Gr closed, and ∏Gr(d,Λ_i)→Gr(nd,⊕Λ_i) is closed (KPZ26 line 2418). The old word "Inductively" is gone. |
| F02 (P3): rigid-section construction cited on p.23 | Line 1058: "(KZ25, §§3.2.5–3.2.6, pp.23–24, especially the proof of Proposition 3.2.7, p.24; KZ25 lines 1055–1063; …)". | **Repaired.** KZ25 page-24 marker is line 1042; §3.2.6 at 1044; the section of T constant mod a_E and its lift to the GL isomorphism at 1055–1063; "by assumption (C)" at 1059 with (C) = very-goodness at line 1019. The KP18 §3.2.12 locator with its correction note is kept. |

No finding in the repair report is marked not actionable. The earlier settled point (an empty acceptance test) is not reopened; the pin audit below confirms it.

### Repaired patterns elsewhere in the package

- Zero multiplicity: §3.12 "adding complete periodic repeats" (nonempty segments from §2.13's r≥1); §3.13 `ρ^{⊕r}` with that r; §3.14 Check 3 (zero PEL multiplicity rejected); §3.15 "s≥1"; §3.16 two named summands L⊕L∨; §3.17 "s≥1"; the hodge-immersion contract "m≥1". No other sum with an unstated count remains.
- Page off-by-one: every KZ25 page citation (list in R02), every KPZ26 citation (markers 2042, 2086, 2131, 2172, 2216, 2259, 2302, 2339, 2381, 2425, 2474, 2518, 2558, 2599, 2648, 2693, 3103, 3151, 3194, 3238 against README lines 130, 163, 222, 266, 288, 299, 408, 429, 472, 547, 591, 634, 649, 714, 735, 744, 753, 787, 796, 805, 814, 834, 843, 852, 863, 872, 887, 896, 905, 1140), and the Hoff23 (lines 711, 717, 796, 857, 1195, 1338, 1346), Lau14 (1730, 1741), Kisin17 (386, 391, 405, 722, 4253–4280), KP18 (2398, 2439, 2185–2188), Anschuetz22 (1388, p.33), Zhou20 (598, 753), vanHoften24 (614, 1190, 2799), Zhu17 (2298, 2408), Wintenberger97 (1622) locators were checked against their page markers: all agree except deJong95 (R01) and KZ25 §3.4.1 (R02).

### Adversarial pass on the round-4 passages

| Statement | Instances tried | Values computed on both sides | Result |
| --- | --- | --- | --- |
| §3.10, n-fold diagonal sum | 𝒢=G_m, Λ=ℤ₃, n=0,1,2 | n=0: rank 0, kernel G_m (1 and −1 both ↦ 1). n=1: a↦a. n=2: a↦diag(a,a). | n=0 excluded by n≥1; theorem holds at n=1,2. |
| §3.10, intertwiner cuts the diagonal | G_m×G_m ⊂ GL₂, h₂=id; also GL₂ blocks with non-commuting g₁,g₂ | diag(a,b)E₂₁ = bE₂₁ versus E₂₁diag(a,b) = aE₂₁; equal iff a=b. In blocks, (g₁,g₂) commutes with the block-1→2 map iff g₂h = hg₁. | Diagonal cut out scheme-theoretically, nonabelian case included. |
| §3.10, no intertwiner for weights ±1 | a=2 in ℤ₃ | 2·2 = 4 ≠ 1 | diag(a,a⁻¹) correctly outside the theorem. |
| §3.10, goodness of the diagonal | (h,d)=(2,1), n=2; (1,1), n=2 | P¹→P¹×P¹→Gr(2,4): dimensions 1,2,4, closed. Gr(1,1)²→Gr(2,2): point to point. | Good. |
| §3.10, route through §3.4 and §3.8 | KPZ26 Cor. 5.3.4 hypotheses | 𝒢ⁿ good (product of good), composite good (above), 𝒢 = 𝒢ⁿ ∩ centralizers as closed subschemes, 𝒢ⁿ very good at (x,…,x). | Holds, but the last input is the pointwise §3.4 (R03). |
| §2.13, r≥1 | r=0; r=1 | r=0: tot(L)=0, not faithful. r=1: tot(L)=Λ₀, the one-step Check. | Explicit. |
| Gap hodge-immersion, m≥1 | GL₂, μ=(1,0); m=0,1,2 | m=0: Gr(0,0) a point, P¹ does not immerse. m=1: P¹→Gr(1,2)=P¹. m=2: P¹→Gr(2,4). | m≥1 required; KPZ26 line 1122 agrees. |
| §4.6, locator and statement | c=1+εE₂₁ | Ψ=Ψ₀(1−εE₂₁) gives Ψc=Ψ₀; existence, not uniqueness. | Locator now on p.24; statement unchanged. |

### Seeded sample: sources read at their locators

All fifteen targets were read at the cited lines; values recomputed.

| Target; source lines read | Instances | Values on both sides | Result |
| --- | --- | --- | --- |
| 0.8 Invariant tilde module; KPZ26 2101–2129 ((5.1.3)) | Composition of two block maps; identity; d=0,h; zero ring | Lower-left of a composite: φ₁(C′A+D′C) = φ₁(C′)φ(A)+φ(D′)φ₁(C). Upper-left: φ(A′A+B′C) = φ(A′)φ(A)+pφ(B′)φ₁(C) using φ|I = pφ₁. Lower-right: φ(C′B+D′D) = pφ₁(C′)φ(B)+φ(D′)φ(D). Identity ↦ identity. Over the zero ring both modules are 0. Omitting p in the upper-right breaks the upper-left identity. | Pass; the three Checks compute as stated (Vx ↦ x since φ₁=V⁻¹). |
| 0.9 Strict base change; KPZ26 2082–2084, 2133–2137 ((5.1.4)) | Strict α; a map with φ₁′∘α = u·α∘φ₁, u≠1; two-step; S′=0 | On the common basis the two four-block matrices agree iff α∘φ=φ′∘α and α∘φ₁=φ₁′∘α; a unit u multiplies the lower-left block only. KPZ26's frame morphisms are strict by definition (line 2083). Cocycle for two steps is the identity; S′=0 gives 0≅0. | Pass; the nonstrict Breuil–Kisin map (φ(E([π])) = p·unit, §2.5) is rightly excluded. |
| 0.13 Displays and p-divisible groups; Hoff23 717–735; Lau14 1730–1755 | ℚ_p/ℤ_p, μ_{p∞}, ordinary height two over k | Î_k = pW. ℚ_p/ℤ_p: Φ=σ, M₁=pM, rank(M₁/ÎM)=0=dim. μ_{p∞}: Φ=pσ, M₁=M, rank 1=dim. Ordinary: rank M=2, rank(M₁/ÎM)=1. Hoff: complete Noetherian local with perfect residue field, contravariant, compatible with duality; Lau: admissible topological rings with countable base, Cartier duality. | Pass; p>2 is the roadmap's convention (Lau14 allows p=2 with a modified frame; this is a declared scope, not a narrowing of a theorem). |
| 1.3 Canonical first-order comparison; KPZ26 2196–2214, 2222–2238, 2276–2281 | Z=Vε over k[ε]; constant pair; p-killed quotient | c = [[1,0],[V⁻¹(Z̄),1]] = 1+εE₂₁. Square: j∘c = [[1,0],[φ(Z̄),p]] = φ*ψ∘j₀ with ψ=[[1,0],[Z,1]]. Over R/a with pR⊂a, φ(Ŵ(m))=0 (line 2281) so φ(Z̄)=0 and the square reads diag(1,p); p·Ŵ(εk)=0 because p=VF and F kills (ε,0,…). Constant pair: c=1. | Pass; a commuting square cannot select ε (Remark 5.1.17). |
| 1.8 Universal display; Hoff23 692–715; KPZ26 2282–2290 | h=1; (h,d)=(2,1); a=m²+m_F R | a := m²_{R^univ}+m_F R^univ (line 701); R^univ a power series ring over O_F; tangent dimension d(h−d): 0 for h=1, 1 for (2,1). Universality for Def on complete local O_F-algebras with residue k. | Pass. |
| 2.0 Rational σ-centralizer; KZ25 1177–1192 | G_m, b=p; GL₂, b=diag(p,1); rank 0 | σ(g)=g gives ℚ_p^× ⊋ ℤ_p^×. For diag(p,1): pσ(a)=pa, pσ(b)=b forces v(b)=1+v(b) so b=0, σ(c)=pc so c=0, σ(d)=d: J_b=(ℚ_p^×)². Rank 0: trivial. J_b(ℚ_p)⊂M(Q̆_p) (line 1188). | Pass for the definition; R04 for the inner-form clause. |
| 2.1 Tensor and local-model datum; KPZ26 2292–2297, 1234–1237; KZ25 966–989, 820–823 | Empty family; endomorphism; identity in Λ⊗Λ∨; disconnected fixer | Fixer of ∅ is GL(Λ). Identity Σe_i⊗e_i^* is fixed; treating Λ∨ covariantly sends it to g²=4≠1 on ℤ₃ for g=2. "Good" = Mloc_{𝒢,μ}→Gr(d,Λ) a closed immersion (Def. 3.4.4). "Acceptable" = G^ad a product of Res_{K_i/F} of adjoint groups tamely split (KZ25 Def. 3.1.2). Full fixer G̃ versus parahoric 𝒢 as in KZ25 3.2.2. | Pass. |
| 2.11 Independence of the defining tensors; KPZ26 2341–2344 | One horizontal cutting family; invariant t | Lemma 5.2.3: t fixed by 𝒢 ⇒ t̃ horizontal; T independent of (s_a) (line 2343). | Pass, exact match. |
| 3.3 Curvewise horizontality; KPZ26 2461–2501 | Frames (W[ε],(p)) and (W[ε],(p,ε)), φ(ε)=0 | φ₁ on (p,ε) = p⁻¹φ on pW and 0 on Wε (line 2481). The statement proved is exactly: if v lifts to a k[[u]]-point then c over Ŵ(k[ε]) preserves the base-changed s̃_a (lines 2463–2467). | Pass; no claim that every tangent vector lifts. |
| 4.2 Trivial Kottwitz invariant; KP18 2393–2403 | k algebraically closed; G_m with κ(p)=1 | Image of ρ in ker κ_G (Prop. 3.3.4, Wintenberger); for G_m the crystalline character has image in ℤ_p^×, κ=0. Connected-parahoric image needs the fixer characterization 𝒢°(ℤ_p)=𝒢(ℤ_p)∩ker κ, cited to RG2.3.3. | Pass. |
| 4.4 Integral crystalline and Witt comparison; KZ25 1083–1097; KP18 2433–2456 | ℚ_p/ℤ_p, μ_{p∞}; evaluation tensor | L(μ_{p∞}) = Hom(ℤ_p(1),ℤ_p) = ℤ_p(−1) = T_p(ℚ_p/ℤ_p)⊗ℤ_p(−1); crystalline φ=p matches F=pσ. L(ℚ_p/ℤ_p)=ℤ_p, φ=1. Evaluation 1↦1. KP18 3.3.7 assumes tame and no E₈; KZ25 replaces Prop. 1.4.3 by Anschütz 10.3 (line 1096). | Pass; twist convention consistent with Conventions line 28. |
| 4.12 Versal adapted deformation; KZ25 1044–1063; KPZ26 3191–3214 | Empty tensors; torus cut by E₁₁ | Factor through A_G iff (G̃,μ_y)-adapted (Prop. 3.2.7). GL₂, (2,1): R_G=R_E=O_Ĕ[[t]]; torus: t=0. Remark 7.1.4(1): assumption (C) was omitted in KP18. | Pass. |
| 5.6 Hodge cocharacter and double coset; Kisin17 403–409 | b=h₁p^{υ′}h₂; GL₂, F=diag(p,1)σ | b = (h₁h₂)p^{h₂⁻¹υ′h₂}, one-sided with h=h₁h₂∈G(W). Fil¹ = ker(F mod p) = ke₁; μ₀(z)=diag(z⁻¹,1), υ₀=σ(μ₀⁻¹)=diag(z,1), p^{υ₀}=diag(p,1)=b with h=1. | Pass. |
| 5.12 Formally smooth adapted space; Kisin17 386–390, 4253–4274 | GL₂ ambient; diagonal torus | Prop. 1.1.10: R_G formally smooth over W, factorization iff adapted. E.1: ∇_{R_G} has coefficients in Lie G, not Lie U∘G; E.3: A′_G=A_G. Relative dimensions 1 and 0 = dim G/P. | Pass; the dimension clause is the standard flag-variety count, not asserted by Prop. 1.1.10 itself. |
| 5.19 Central quotient specialization; Kisin17 722–741 | det: GL₂→G_m, g=diag(p,1); f=id on G_m, g=p, ph | f(g)=f(g₀) in H(L)/H(O_L) under the central-image hypothesis; valuation 1 on both sides; ph gives the coset pW^× again. | Pass. |

### Headline theorems and statability

The README's end theorems fall into the 21 groups named in the module docstring: perfect-ring Dieudonné anti-equivalence (0.2/0.5); complete-local display anti-equivalence (0.13); universal marked displays (1.8); integral filtration and tilde tensor torsors (2.4/2.6); formal- and arithmetic-curve criteria (3.7/3.9); nonexceptional very-good chains (3.13/3.16); Dᴴ PEL and enlargement (3.14/3.17); wild type-A and symplectic enlargement (3.11/3.15); integral crystalline comparison and étale recognition (4.4/4.14); versal adapted deformation (4.12); universal marked parahoric display (4.13); hyperspecial tensor frames (5.1); explicit adapted lift (5.7); Frobenius-pullback integrality (5.8); toral weak admissibility (5.3); horizontal/adapted locus equality and smooth quotient (5.11/5.12); lattice specialization and Kottwitz equality (5.16/5.18/5.19); adapted isogenous realization (5.17); ordinary σ-conjugacy normalization (6.0); central ordinary lift with the rational action (6.3–6.5); specified Levi lift (6.6). Each is named in the docstring with the missing carrier.

Pin audit by object (file counts under `Mathlib/` and `TauCeti/` at the pins): p-divisible or Barsotti–Tate groups 0 and 0; Breuil–Kisin modules 0 and 0; parahoric group schemes 0 and 0; local models 0 and 0 (the two Tau Ceti hits for "local model" are in `TauCeti/FieldTheory/FunctionField/Different/Basic.lean` and `…/Place/Extension/Basic.lean`, unrelated); Zink ring 0 and 0 (the three Mathlib hits for "Zink" are author lines in `Mathlib/Probability/Independence/Integration.lean`, `Mathlib/MeasureTheory/PiSystem.lean` and `Mathlib/MeasureTheory/Measure/Sub.lean`); displays 0 and 0; "Dieudonné" in Tau Ceti only as Cartan–Dieudonné (`TauCeti/LinearAlgebra/CliffordAlgebra/CartanDieudonne.lean`). Mathlib has `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean:113`, a `K(p,k)`-module with a Frobenius-semilinear equivalence `frob`, variables `[IsDomain k] [CharP k p] [PerfectRing k p]` at line 73) and no filtration, lattice, group structure or finiteness field, so none of the 21 headlines is statable without a sorry'd data carrier or a stand-in; the empty file is the correct acceptance test and contains no padding.

Declarations named in the "From Mathlib" contract, opened at the pin: `WittVector` (`Mathlib/RingTheory/WittVector/Defs.lean:52`, structure with `coeff : ℕ → R`); `WittVector.frobenius` (`Mathlib/RingTheory/WittVector/Frobenius.lean:218`, ring hom, variables `[Fact p.Prime] [CommRing R]` at line 52); `WittVector.frobeniusEquiv` (line 283, needs `[CharP R p]` from line 252 and `[PerfectRing R p]`); `WittVector.verschiebung` (`Mathlib/RingTheory/WittVector/Verschiebung.lean:109`, additive); `DividedPowers` (`Mathlib/RingTheory/DividedPowers/Basic.lean:77`, with `dpow_null` at 80 and `dpow_mul` at 86 requiring membership in the ideal). The README's descriptions (prime and commutative-ring parameters, characteristic p and perfectness for the equivalence, Verschiebung additive, PD operations on an explicit ideal with the membership hypothesis) match.

### Supplier citations resolved this round

Every cross-roadmap citation was resolved at the supplier's current head through the roadmap service (open pull requests) or on main; line numbers are in that supplier's `README.md`.

| Supplier (where read) | Sections found | Note |
| --- | --- | --- |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory (open head, #879) | R07.1.6 (829), 1.7 (890), 1.8 (932), 1.22 (1798), 2.10 (3315), 2.11 (3349), 2.12 (3377), 2.27 (4030) with `deJongBoundedFormalFunctions` (4074), 3.2 (4516), 3.3 (4566), 4.1 (5346), 4.13 (5896), 4.16 (5995), 4.17–4.21 (6082–6249), 4.25 (6406) | R07.4.20 (6215) is for finite K/ℚ_p, so the perfect-residue gap is an extension, not a restatement. |
| ReductiveGroupsPartII (#785) | RG2.1.5 (2447), RG2.2.4 with *division-algebra-building* (3409, 3616), RG2.3.3 (4152), RG2.3.5 (4665), RG2.3.7 (5202), RG2.4.3 (5993) | RG2.4.3 defines t^λ as the inverse image of −λ with split representative λ(ϖ)⁻¹ (lines 6000–6004): the Layer-6 adapter t_here^λ = t_RG^{−λ} is the right conversion; G_m check: t_here¹ = t_RG^{−1} has representative ((−1)(p))⁻¹ = p, κ=1. |
| GeometricSatakeAndFusion (#1235) | "Witt affine flags and components" (825), "Bounded admissible affine flag loci" (947) | Both named subsections exist under Layer GS0. |
| VectorBundlesAndIsocrystals (#1205) | VB0 "Finite isocrystals over the completed maximal unramified coefficient field" (229); VB4 "Integral group torsors and Frobenius" (2294) | Present. |
| PadicHodgeTheory (#1062) | §5.5 "General residue fields and the tensor torsor" (1076–1131) | Supplies B(G), ν_b, κ, admissibility and the period-torsor class; not J_b (R04). |
| PadicPeriodRings (#940) | §3 (334), §4.1 (360), §4.3 (413) | Absolute identity only, so the relative-constants gap is an extension. |
| DerivedDeRhamCohomology (#868) | PD.7 (2736) with `Crystalline.fontaineEnvelope_initial` (2767) and `Crystalline.fontaineEnvelope_periodPDEnvelope` (2850) | Resolves the resolver leads. |
| ShimuraVarieties (#933) | §7.0i (1869) | Present. |
| AbelianSchemesAndArithmeticModuli (#849) | A4.CR.7.2 (2060) | Present. |
| CrystallineCohomology (#857) | Layer CR.1 (602), CR.7.1 (11178) | Present. |
| PELModuli (#966) | M2.15 "Displays and polarized O-displays" (2578) | Scope boundary only. |
| SchemeAndStackFoundations (main) | §0.6 (678), 1.15 (2502), 2.3 (3330), 4.1–4.4 (5066–5194), 4.7–4.8 (5339–5383), 4.12 (5613) | Present. |
| ModularCurves (main) | §0G (427) | Present. |
| LubinTateFormalModulesAndQuasiCanonicalLifts (board design, merge order line 55) | LT.0–LT.6 (design README lines 68–905) | Cited only as an ownership boundary in Scope; no supply edge. |

### Declared supplier gaps

`design/plan.json` `gaps` and the README's `## Exact supplier contracts` carry the same fourteen slugs, each with a named supplier and section; none is `none`. Precision and minimality were checked against the suppliers above: `perfect-residue-bt-realization` (Part I states finite K/ℚ_p), `relative-crystalline-constants` (PadicPeriodRings §4.3 is absolute), `tensor-isomorphism-flatness-descent` (SSF §4.12 is generic flattening; the pointed henselian form is what KP18 lines 2185–2188 use), `formal-dvr-point-detection` (SSF §§4.7–4.8 give completion, not joint injectivity), `punctured-disc-torsor-patching` (SSF §1.15 gives torsors, not the formal gluing), `full-fixer-cutting-tensors`, `parahoric-disc-purity` (Anschuetz22 Prop. 10.3 at line 1388, p.33, for every parahoric over O_E), `full-fixer-component-reduction`, `ordinary-levi-full-fixer` (KZ25 §3.4.2 hypotheses), `scheme-local-model-representative`, `scheme-local-model-hodge-immersion` (m≥1, KPZ26 lines 1122–1130), `schubert-curve-spanned-tangents`, `local-model-curve-spanned-tangents`, `integral-hodge-realization-extension`. Each `needs` sentence carries its hypotheses; none asks for what a supplier already states.

### Ownership and duplication

- The roadmap service's grep over main and the 367 open roadmap pull requests: "very good (integral) Hodge embedding" occurs nowhere else; "Dieudonné display" only in EndoscopicTransferAndUnitaryTraceComparison (line 4353, an application); "Zink" elsewhere only as Langer–Zink de Rham–Witt complexes in CrystallineCohomology. "σ-centralizer": BunGAndNewtonStrata §1.13 "Algebraic sigma-centralizer" (#1241) builds J_b; that roadmap is at merge-order line 240, after this one (150), so §2.0 is the earlier owner and no citation of it is possible here. The maintainer may want BunGAndNewtonStrata to cite §2.0.
- Board packages (index read first): PELModuliPartII at its listed head imports PELModuli §M2.15 and declares `gap:zink-display-equivalence` on PELModuli for nilpotent W(R)-displays of formal p-divisible groups, a different object from the Ŵ(R)-Dieudonné displays of §0.11/§0.13 for all p-divisible groups. ShimuraVarietiesPartII at its listed head declares five gaps on this roadmap (`gap:ffg-very-good`, `-versal`, `-integral-tensors`, `-nonexceptional`, `-exceptional`) citing plan nodes `TD.2/very-good`, `TD.3/nonexceptional-embedding`, `TD.3/D-central-cover`, `TD.3/A-central-cover`, `TD.4/integral-tensor-frame`, all of which exist among the 92 nodes of this package's `design/plan.json`; it is a consumer, not a second owner. CrystallineCohomologyPartII at its listed head has no overlapping object. The other board packages listed are unrelated topics.
- No fully qualified Lean name can collide: `Suggested.lean` declares none.

### Shape, style and policy

92 numbered targets, 92 `*Needs:*` lines, 45 `**Checks.**` blocks (41 with three bullets, 3 with four, 1 with six; 141 bullets), 37 API lists, seven layers each ending with `### Examples` and `### Dependencies`, the seven required top-level sections in order. Every target's statement paragraph ends with a parenthesised locator (checked mechanically). No LaTeX delimiters, no process words, no target-numbering tables or field lists, no pull-request numbers, no machine paths, no `set_option`, `lemma`, `#eval`, `#print`, `True` placeholder or sorry'd data. Principles: the wild type-A case with p | ind(D) (§3.11), the Dᴴ cases (§§3.14, 3.17), the nonconnected full-fixer steps (§§2.4, 4.2–4.3) and ramified reflex coefficients (Conventions, §1.5) are kept, so no route-specific shortcut; Part I, PELModuli, GeometricSatakeAndFusion and ReductiveGroupsPartII are consumed by section, not re-planned; no algorithm. Mathematical consistency recomputed on the examples the layers share: §5.10's connection (dF+NF = Fφ(N)pt^{p−1}dt gives n+1 = t^{p−1}n(t^p), N(0) = −E₂₁, h′ = −n with h = Σt^{p^r}/p^r, and ∇(E₁₁+hE₂₁) = (h′+n)E₂₁ = 0); §5.7's c = σ⁻¹(b)μ₀(E(0)) = σ⁻¹(h)μ₀(E(0)/p) ∈ G(W) with residual Frobenius σ⁻¹(b) and the a≠1 negative control; §6.3's c_E = −E(u) for E = u−p with c_E(0) = p; §6.0's diag(p,1) with determinant valuation 1 and length 1; the Conventions' composition law (gh)ᵗ = [[2,1],[1,1]] versus (hg)ᵗ = [[1,1],[1,2]].

## Not verifiable

- RZ96, Proposition 1.21 (and the inner-form statement R04 would cite): the manifest's settled uncertified, locator-only reference; not requested again.
- RG71, I, Théorème 4.1.2, p.27: the cached extraction of the GDZ volume scan is image-only (33 text lines over 363 pages; the blocks for PDF pages 33–35 are empty), and a re-read through the sources service returned the same text without an OCR header. The flatness contract's statement was therefore checked only against the citing text, KP18 lines 2185–2188. That service call also re-serialized the author's manifest (key order and a duplicated `cited_for` element on RG71); the file was restored to the committed version, so `sources.toml` is unchanged by this review.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e5dbe2c", "job": "REV-PKG-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~4", "model": "fable", "worker": "fable-rev179"} -->
