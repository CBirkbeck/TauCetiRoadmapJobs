<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/384#issuecomment-6403952890 -->
Review (claude) of 4592423

Verdict: needs changes

1. **F01** (P1) U9/basic-hom-comparison is false at ℓ≠p as stated

   **Location.** `packages/PELModuliPartII/design/README.md:2188` (same text in plan.json, node `U9/basic-hom-comparison`): "such that for every place 𝔭 of K above p the 𝔭-part of the rational Dieudonné module of each is isoclinic. Then Hom_K(A,A′)⊗ℚ_ℓ→Hom_K(V_ℓA,V_ℓA′) is an isomorphism".

   **Claim.** The ℓ-adic comparison holds for any two K-objects that are separately isoclinic at every 𝔭.

   **Witness (computed).** K imaginary quadratic, p split in K, A an ordinary elliptic curve over F̄_p with CM by O_K, A′=A with the K-action precomposed by conjugation. Each satisfies the hypotheses: Rosati is conjugation; N_𝔭 and N_𝔭̄ are one-dimensional (slopes 0 and 1), hence isoclinic. Hom_K(A,A′)={f∈End A : fι(a)=ι(ā)f}; End⁰A=K is commutative, so (a−ā)f=0 and Hom_K(A,A′)=0, dimension 0. Hom_K(V_ℓA,V_ℓA′) is the space of conjugate-semilinear endomorphisms of a free rank-one K⊗ℚ_ℓ-module: dimension 2 over ℚ_ℓ. 0≠2. At p both sides are 0 (slope 0 against slope 1), so only the ℓ≠p clause fails. The cited source has the same gap: RZ96 line 8959–8964 (Corollary 6.29) assumes the hypotheses of Lemma 6.28 (line 8931–8937) for A and for A′ separately, but the proof of Lemma 6.28 produces a Frobenius element u∈K whose 𝔭-valuations are the slopes of N_𝔭; for A and A′ these elements are π and π̄, and a K-linear map of Tate modules need not commute with both.

   **Repair.** Add the hypothesis "for every 𝔭 above p the slopes of N_𝔭 and N′_𝔭 agree; equivalently A×A′ with the diagonal K-action satisfies the isoclinic hypothesis at every 𝔭" and prove the theorem by applying RZ96 Lemma 6.28 to A×A′ (one Frobenius power lies in K for both), then Tate's theorem over the common finite field (EndoscopicTransferAndUnitaryTraceComparison §8.3) on the corners of End_K(A×A′). Add the instance above as a negative-control Check. Tested on the instance: A×A′ has slopes 0 and 1 at 𝔭, so the new hypothesis excludes it. The roadmap's own application keeps working: for a basic CM pair (A₀,A) with Kottwitz type nΦ−φ₀+φ̄₀ the slope of A[w^∞] at a banal place w is Σ_{φ∈Hom_w}r_φ/(n[F_w:ℚ_p])=|Φ_w|/[F_w:ℚ_p], the slope of A₀[w^∞], and at the distinguished inert place both are 1/2; say so in the statement ("basic pair" = A₀×A isoclinic at every 𝔭).

2. **F02** (P1) The exotic good-reduction theorem is stated over the wrong base ring

   **Location.** `README.md:840` (`U3/exotic-smoothness`): "N^exo is formally smooth of relative dimension n−1 over Spf O_K̆". In U3, K is the ground field and L/K is ramified (`:17`, `:842`), so K̆ is the unramified base. The sibling `U3/exotic-rz` at `:804` says "over O_L̆", and `U0/rz-representability` at `:208` says "over Spf O_L̆ (resp. Spf O_K̆)" without saying which.

   **Claim.** Formal smoothness over Spf O_K̆.

   **Witness.** LL22 line 402–405 defines Exo(n−1,1)(S) for S over O_Ĕ, Ĕ the completed maximal unramified extension of the ramified field E (the design's L), and Lemma 2.4 (line 437–438) proves formal smoothness over Spf O_Ĕ=Spf O_L̆. Computed at n=2: the completed local ring at a point is O_L̆[[t]] (relative dimension 1 over O_L̆); its fibre over the closed point of Spf O_K̆ is (O_L̆/ϖ)[[t]]=k[u]/(u²)[[t]], nonreduced, so N^exo is not formally smooth over Spf O_K̆ (already Spf O_L̆→Spf O_K̆ is not formally smooth when L/K is ramified). The statement is false as written and contradicts `:804`.

   **Repair.** Replace O_K̆ by O_L̆ at `:840` (and in plan.json), and at `:208` write "over Spf O_L̆ in every case (O_L̆=O_K̆ when L/K is unramified)". Tested at n=2: over O_L̆ the special fibre is k[[t]], smooth of dimension 1, matching LL22 Lemma 2.4 and the Check at `:949`. The global coefficient ring O_K̆ of `U9/exotic-uniformization` (`:2352`) is unaffected: there K=F_uE_Φ contains the ramified field, so K̆=L̆ (LL22 line 2896–2899).

3. **F03** (P2) gap:bad-prime-projectivity asks, in part, for what ShimuraCompactifications already provides

   **Location.** `README.md:134` and plan.json `gaps[3]`: needs "For PEL moduli at a neat level whose local level at p is the stabilizer of a polarized lattice multichain, prove quasi-projectivity … and properness when the generic fibre is proper"; consumer `U8/smooth-geometry-tangent` (`:2161–2171`: "Projectivity … requires gap:bad-prime-projectivity"; `*Needs:*` `:2163`).

   **Claim.** The contract is minimal, and the LTXZZ smooth model needs it.

   **Witness.** A single self-dual lattice is a polarized multichain, so the needs sentence covers hyperspecial levels at primes unramified in the PEL algebra. ShimuraCompactifications §C5.18 ("Quasi-projectivity of PEL moduli at good primes": the neat moduli of PELModuli M2.8 is quasi-projective over the good-prime base) and §C5.5 (properness of the complete toroidal model, hence of the moduli when the cusp-label set is empty, i.e. when the generic fibre is proper) already provide exactly this case; the design's own `detail` field says so. `U8/smooth-geometry-tangent` works in LTXZZ22's special inert setting, p odd, inert and unramified in F, F⁺_𝔭=ℚ_p, self-dual lattices at every q|p, neat level (`:1967`): a good prime in Lan's sense. (`U7/localized-smoothness` keeps a genuine use: over O_E[1/d] primes ramified in F⁺ remain, where Lan's hypothesis fails; the other two consumers are at a ramified place and at parahoric level.)

   **Repair.** Restrict the needs sentence to "… at a prime where ShimuraCompactifications Layer C5 does not apply (p ramified in the PEL algebra, or a multichain that is not a single self-dual lattice)". In `U8/smooth-geometry-tangent` cite ShimuraCompactifications §§C5.5, C5.18 instead of the gap, together with the finite morphism from the pair functor (A₀×A with the product action and polarization) to the PEL moduli of PELModuli M2.8, stated as one clause of `U8/ltxzz-smooth-moduli`; in `U7/localized-smoothness` say that the gap is used only at primes ramified in F⁺. Tested: after the change, the gap's needs sentence names nothing C5 provides, and the gap keeps its three bad-prime consumers.

4. **F04** (P3) Two source editions cited in the README are not the ones the manifest records

   **Location.** `README.md:2552–2556` (Zhang21: "published PDF", Tsinghua archive URL, SHA-256 `6f8ac537…`) and `:2592–2596` (LTXZZ22: "published version, NSF public-access copy", SHA-256 `dd821abd…`); the same in plan.json `sources` and `sourceVersions`.

   **Witness.** `sources.toml` records Zhang21 as arXiv 1909.02697v3 with SHA-256 `f58b275c…` and LTXZZ22 as arXiv 1912.11942v3 with SHA-256 `84dc7c83…`, each with a version note that the published page numbers were checked; the round-2 repair report says the Tsinghua host is in no licence class and the NSF copy timed out, so neither was read by the service.

   **Repair.** In the README's Source editions and in plan.json cite the arXiv v3 texts with the manifest's digests and version notes (page numbers of the published versions, as the notes say). Never remove the manifest entries.

5. **F05** (P3) U9/formal-arithmetic-quotient cites the uniformization sections instead of the quotient construction

   **Location.** `README.md:2218`: "RZ96, §§6.13–6.16, pp. 282–285; Theorem 6.30, p. 293".

   **Witness.** RZ96 §§6.13–6.16 (line 8613–8700) define the morphism Θ and its continuity; the existence of Γ\𝔐 for a discrete Γ⊂J(ℚ_p) is Proposition 2.34 (finiteness of {γ : γU∩U≠∅}, line 2349–2352), Corollary 2.35 (torsion-free ⇒ fixed-point free, line 2380), Lemma 2.36 and Proposition 2.37 (torsion-free separated ⇒ the étale quotient is a formal algebraic space locally formally of finite type, line 2409–2411), printed pp. 64–67; discreteness of I(ℚ) in J(ℚ_p)×G(𝔸_f^p) is in the proof of Theorem 6.23 (line 8838–8844, p. 289).

   **Repair.** Cite "RZ96 Propositions 2.34–2.37, pp. 64–67; Theorem 6.23, p. 289; Theorem 6.30, p. 293", and say in the route that hypothesis (ii) (a neighbourhood U with γU∩U=∅ for γ≠1) is what upgrades RZ96's formal algebraic space to a formal scheme: the quotient is then locally isomorphic to 𝔐. Tested: (ii) follows from Proposition 2.34 and Corollary 2.35 for a torsion-free discrete Γ, since distinct points of equal dimension in a locally noetherian formal scheme are not specialisations of each other.

6. **F06** (P3) U0/strict-module-display cites Proposition 12.3 for the Lubin–Tate frame equivalence

   **Location.** `README.md:156`, `:162`: "prove the Lubin–Tate frame equivalence and its duality compatibility (Mih19 Proposition 12.3 and Lemma 11.2)", "Proposition 12.3, p. 44".

   **Witness.** Mih19 Proposition 12.3 (line 1993–1999, p. 44) is the existence and uniqueness of Lubin–Tate O-displays with a given unit κ. The equivalence "strict formal O′-modules over R ≅ nilpotent L_{O′/O,κ}(R)-windows", compatible with base change, is Proposition 12.11 (line 2114–2121, p. 47); its duality compatibility is Lemma 11.2 (line 1860–1863, p. 41) as cited.

   **Repair.** Replace "Proposition 12.3, p. 44" by "Proposition 12.11, pp. 47–48" in the Source line and in step 3; keep Lemma 11.2.

7. **F07** (P3) A stale duplicate Check survives the widening of U1/product-embedding

   **Location.** `README.md:501` "(2,n−1)≠(1,n) for every n≥1; already at n=1 it gives (2,0)" and `:503` "Adding ℰ in the (1,n−1) convention gives (2,n−1), hence fails the target signature when n≥2".

   **Witness.** The two bullets test the same wrong model; the second keeps the pre-repair restriction n≥2 that round 1 (F09) asked to remove, since (1,0)+(1,0)=(2,0)≠(1,1) already fails at n=1.

   **Repair.** Delete the bullet at `:503` (and the corresponding plan.json test).

8. **F08** (P3) House style: backslash-bracket quotient notation and backticked API names

   **Location.** `README.md:2315`, `:2352`, `:2376`, `:2399`: quotients written `G̃′(ℚ)\[N′×…]`, `U(V′)(F⁺)\[N^exo×…]`; API bullets throughout carry backticked names of this roadmap's own (for example `:166` `StrictOModule.toDisplay`).

   **Witness.** The sequence `\[` is the LaTeX display delimiter the house style forbids and a delimiter check will flag; four occurrences. A backticked own name in an API bullet is, by the README rules, a claim that `Suggested.lean` declares it; at the design stage no such file exists.

   **Repair.** Write the quotients as `G̃′(ℚ)\(N′×G̃(𝔸_f^p)/K^p)` or inside a code span; at the package stage either declare the API names in `Suggested.lean` (only where a headline needs them) or drop the backticks and keep the prose. Non-blocking.

Reviewed at the pull request head `4592423` (confirmed equal to the board checkout). Files reviewed read-only: `packages/PELModuliPartII/design/README.md`, `packages/PELModuliPartII/design/plan.json`, `packages/PELModuliPartII/sources.toml`. Eight findings, three blocking (two P1, one P2). The design does not re-plan PELModuli and is repairable; every repair below is local. Nothing was changed, committed, posted or pushed.

## Round-1 findings, repair by repair

| Round 1 | Status | Witness at this head |
| --- | --- | --- |
| F01 degree of α | repaired | `README.md:682` "deg α=q²"; `:704` Check computes (deg α)²=q²·q², rejects 27 (27²=729≠81); worked check 2 at `:28`. `q^(n+1)` no longer occurs in README or plan.json. |
| F02 unowned gaps G1, G2 | repaired | G1 is now the theorem `U3/exotic-components` (`:928–951`, LL22 Lemma 2.4 and footnote 8, Wu16 §3.4, Thms 5.17–5.18); G2 deleted; `U7/ramified-global-geometry` carries the n=2 negative Check (`:1900`). plan.json `gaps` holds four supplier contracts only. |
| F03 contracts as undeclared gaps | repaired, applied differently (accepted) | "From X" blocks `:66–134`; four `gap:` contracts each with supplier, section and one-sentence needs; new owned targets `U0/strict-module-display`, `U0/rz-representability`, `U6/cm-moduli-integral`, `U9/basic-hom-comparison`, `U9/formal-arithmetic-quotient`; `requests` and `restructure` lists empty; AdicSpacesPartII R2 replaced by AdicSpacesPartIII Layer F0 and §R2.9 (`:102`), which exist on main (Layer F0 §§F0.1–F0.9; §R2.9 "Conrad's FS_C, smooth formal schemes…"). One residual minimality defect: R03. |
| F04 split Drinfeld targets | repaired | `U7/split-drinfeld-level` and `U7/split-integral-geometry` absent from plan.json; consumers cite IgusaVarietiesAndTorsionConcentration §IG.0.31 and EndoscopicTransferAndUnitaryTraceComparison §10.2 (`:1930`, `:2097`); split clause in `U7/semiglobal-local-types` (`:1906`) with the RZ17 §8 Lubin–Tate condition; Check at `:1746`. |
| F05 PELModuliPartIII | repaired | the string occurs nowhere in README or plan.json; 189 routing items go to SelmerIwasawaCohomologyPartII §§2.2–2.6, 5.2, 5.4 and its gaps (`:2680–2690`); those sections exist at that roadmap's open head (§2.2 basic isogeny correspondence … §5.4 potential map). |
| F06 dependency lines | repaired | every target has an item-by-item `*Needs:*` line; gate output below places the roadmap after IgusaVarietiesAndTorsionConcentration with 0 problems. |
| F07 locators, labels, pins | repaired | each corrected locator re-read at the text (table below); pins `6b7abb3…`/`a91d3aa…` match `lake-manifest.json`; atlas labels replaced by sections; manifest has 16 entries. Two new locator defects: R05, R06. |
| F08 normalisation ϖ vs u² | repaired, applied differently (accepted) | Conventions `:23` require val_u(ϖ)=1 and record h′=(u²/ϖ)·h^exo; `U9/exotic-uniformization` `:2352`, `:2370`; worked check 8 `:34`; `U8/mixed-global-moduli` uses u₀λ₀ (`:2128`, `:2149`). LL22 line 3374–3375 fixes ϖ only at the places of U, so the extra condition at u is free. |
| F09 Checks, narrative, style | partly repaired | 78 duplicated Acceptance lines gone (plan.json: no acceptance line equals a test line); no "packet", "now proves", "Read 2026", "Atlas", "a-bar", "breve"; dated lines and companion paragraph gone; inert-clause Check `:1471` and trace Check `:1265` are computed. Residual: the stale duplicate Check of `U1/product-embedding` (R07) and the `Γ\[…]` notation (R08). |

No round-1 finding was marked "not actionable", so nothing is re-raised.

## Adversarial pass

Values I computed on the left of the slash, the design's or the source's on the right. Lines are README lines; source lines are those of the cached texts.

| Statement | Instances tried | Values computed (mine / design or source) | Result | Change |
| --- | --- | --- | --- | --- |
| W1 heights (:27) | n=3, [K:ℚ_p]=2 | rel. 6, abs. 12, dim 3 / same | ok | — |
| W2 mixed degrees (:28) | n=2, q=3 | (1,1)+(0,1)=(1,2); 9·9=81 ⇒ deg α=9; 27²=729≠81; q+1=4 / same | ok | — |
| W3 Jordan (:29) | [[0,1],[0,0]] over 𝔽₃ | charpoly T², square 0, N≠0 / same | ok | — |
| W4, U7/ramified-global-geometry n=2 (:30, :1900) | uv=t²·unit at (u,v,t) | dim m/m²=3 > Krull dim 2 ⇒ not regular / same; RSZ21 Remark 6.8 (line 1741–1744) | ok | — |
| W5, U5/kramer-local-charts (:31, :1300) | y(1+x²)=2u, p=3 | roots ±i, 2x≠0 at them; z=(1+x²)/2 ⇒ yz=u / same; Kraemer03 Thm 4.5 (line 268–272) is n≥3 | ok | — |
| W6, U1/diagonal-graph (:32) | n=4 | rel. 2 and 5; abs. 3 and 6 / same | ok | — |
| W7, U8 period line (:33) | N=3 | zero source Hodge subspace ⇒ vacuous ⇒ dim 3; Hom(rank 1, rank 1)=1 / same | ok | — |
| W8, U9/exotic-uniformization (:34, :2352, :2370) | n=2, val_u(ϖ)∈{0,1} | h′/h^exo=ϖ^−1/u^−2=u²/ϖ, val 1−val_u(ϖ); LL22 line 3374–3375 fixes ϖ only on U / same | ok | — |
| U0/strict-module-display (:150, :174–176) | O=ℤ_p; ℚ_p(√p) twist over O_K/(p); ht 1 dim 1 | μ_{p∞}: rank P 1, P/Q 1; ℚ_p/ℤ_p: P/Q=0 not nilpotent; 2√p≠0 mod p (val 1/2); dual dim 1−1=0 étale ⇒ not biformal / same; Mih19 Remark 11.11 (line 1945–1947) | ok | R06 (locator only) |
| U0/rz-representability (:208, :224–227) | n=1 unramified; spin | strict: Spf O_L̆ (LZ22 line 415); unstructured ht 2d dim d: d² parameters; i(u)=0 on Lie closed ⇒ spin open (LL22 line 417–418) / same; RZ96 Thm 3.25 line 3008–3009 | ok except base | R02 |
| U0/principal-hermitian-module (:233, :256–260) (sample) | n=1, (1,0)/(0,1); [K:ℚ_p]=2, n=3 | Lie characters a / ā; rel. 6, abs. 12; Mih19 Def 2.2 line 270–275: λ^−1ι(a)^∨λ=ι(a^σ) / same | ok | — |
| U0/signature-conjugation (:358) (sample) | n=1, twice | (1,0)↔(0,1), twice = id; Zhang21 (3.1) line 664: (T−a)^{n−1}(T−ā); LZ22 line 396–397: (T−a)(T−σa)^{n−1} / same | ok | — |
| U1/unramified-smoothness (:423) | n=1, 2 | rel. dim 0, 1; LZ22 line 407–408 "formally smooth of relative dimension n−1 over Spf O_F̆" / same | ok | — |
| U1/product-embedding (:480, :500–503) | n=1 | (1,0)+(0,1)=(1,1), ht 4; (1,0)+(1,0)=(2,0)≠(1,1) / Check :503 still says n≥2 | duplicate | R07 |
| U2/almost-self-dual-geometry (:626) | uv−ϖ; uv−t^e | regular; not regular; LZ22 line 2814–2815 regular, semistable over Spf O_F̆ (unramified, =O_L̆) / same | ok | — |
| U2/split-special-hom (:649) (sample) | x₀, W_n split, adjoin ⟨ϖ⟩ | LZ22 line 2854–2857: (x₀,x₀)=ϖ, V_{n+1}=W_n⊥⟨x₀⟩; χ(ϖ)=−1 flips the invariant ⇒ V_{n+1} nonsplit / same | ok | — |
| U2/mixed-framed-space (:682, :704) | n=2, q=3 | deg(α*λ_X)=(deg α)²·1=q²·q² (AbelianSchemes §A6.13: deg(α*λ′)=deg λ′·(deg α)²) ⇒ q² / same | ok | — |
| U3/exotic-smoothness (:840) | n=2 over O_K̆ vs O_L̆ | fibre over k: k[u]/(u²)[[t]] nonreduced vs k[[t]] smooth; LL22 line 437–438 over Spf O_Ĕ=O_L̆ / design: O_K̆ | false | R02 |
| U3/exotic-components (:932, :949–951) | n=2 anisotropic plane; strata | LL22 Def 2.10 (line 519–523): L^∨=(L,·)⊆u^−1O_E, vertex ⇔ invariants ≤1; orthogonal basis of norms a_i: invariants 1+2val(a_i) ⇒ vertex ⇔ unit norms ⇒ t=2; ⟨1⟩⊥⟨−ε⟩ nonsplit, its maximal norm-integral lattice M is the unique vertex lattice (Λ⊆M and Λ^∨=u^−1Λ ⇒ Λ=M) ⇒ one point per component; V_Λ∩V_Λ′=V_{Λ+Λ′} (line 1113); dim t/2−1 (line 1121–1122); max type n ⇒ n/2−1=[(n−1)/2] (Wu16 line 1615–1616); κ₂ and (3.24) (Wu16 line 653–665) / same | ok | — |
| U4/exotic-relative-equivalence (:1054) (sample) | f=1; ramified K | μ=1, rel=id; LL22 Prop 2.62 (line 2045) isomorphism of prestacks; Remark 2.68 (line 2214–2215) leaves ramified F/ℚ_p open / same | ok | — |
| U4/principal-source-comparison (:1075) (sample) | f=2 | source ht 2f=4, dim 2, each Lie_{ψ_i} rank 1 (LL22 line 2182–2184) → rel. 2/1; (2.25) isometry, Cor 2.66 (line 2198–2201) / same | ok | — |
| U5/kramer-dieudonne-space (:1243, :1265) | A, B | Tr(u^−1·δ(A+uB))=δ(A·Tr(u^−1)+2B)=2δB since u^−1+ū^−1=0; HLSY23 (2.1)–(2.2) line 463–465 with 1/(2δ) / same | ok | — |
| U5/kramer-framing-sign (:1279) (sample) | n=3, n=2; unit c non-norm | sign χ((−1)^{n(n−1)/2}det C) (HLSY23 line 471); rescaling multiplies det by c^n: n=3 flips, n=2 invariant; line 472–473 odd iso / even non-iso / same | ok | — |
| U5/kramer-special-hom (:1346) (sample) | λ_Y↦cλ_Y; n=2 | (2.4) has λ_Y^−1 ⇒ factor c^−1; dim_L V=n=2 vs isocrystal dim 4 (line 455, 476–479); (2.6) norm factor (e,e)_Y / same | ok | — |
| U5/kramer-geometry (:1323) | n≥3; n=2 | Howard19 Prop 2.2 (line 245–248): flat, regular of dim n, smooth iff k/ℚ_p unramified; Kraemer03 Thm 4.5 n≥3; n=2 by W5 / same | ok | — |
| U6/admissible-cm-type (:1448, :1471) (repaired Check) | F⁺_v=ℚ_p(√p), F_v=F⁺_v(√ε) | max unramified subfield ℚ_{p²}; embeddings (σ,±); conjugation (σ,±)↦(σ̄,±); {(σ,+),(σ,−)} pulled back, {(σ,+),(σ̄,−)} not; LL21 Notation 5.6 (line 1308–1313), LL22 Notation 4.19 (line 2889–2899, K unramified over E_u) / same | ok | — |
| U6/cm-moduli-integral (:1561, :1577–1579) (sample) | k[ε], R[x]/(x²); imaginary quadratic p ramified | stable rank-1 summands = (x+εc) (a²=0 ⇒ a∈εk; the other case forces x=0); charpoly on quotient T+εc fixes c, rank alone does not; LT height 1 ⇒ unique lift; RSZ21 line 963–964 "finite and étale over Spec O_E", Remark 3.7(i) line 688; PELModuli §M4.7 assumes p unramified / same | ok | — |
| U6/eisenstein-condition (:1525, :1546–1548) | A_ψ=∅; Jordan block | Q=1 ⇒ summand 0; T² with N≠0 fails Q(i(π))=0; RZ17 (8.2) line 1495–1497; Zhang21 footnote 3 line 1846–1849 / same | ok | — |
| U7/localized-rsz (:1663) (sample) | bad set D₀; c≠1 | Zhang21 line 1640–1643 (residue char 2, ramified, inert nonsplit); Def 6.1 line 1667–1678: prime-to-d principal λ, level at d; scaling by c≠1 breaks exact pullback / same | ok | — |
| U7/localized-smoothness (:1699) | n=2 | rel. dim 1; Zhang21 Thm 6.2 line 1710; over O_E[1/d] primes ramified in F⁺ survive | ok | R03 (clause) |
| U7/semiglobal-local-types (:1906) | split v₀ ramified over p; inert split | LZ22 (MS) line 3319–3320 Lubin–Tate, automatic when v₀ unramified over p; RSZ20 Thm 4.2 line 1019–1025; (H1) line 3245 "inert (possibly ramified over p)"; semistability needs ν unramified (line 3312) / same | ok | — |
| U7/ramified-kramer-model (:1794) (sample) | distinguished factor | r^Φ_{w,ψ}=Σ_{Hom_{w,ψ}∩Φ}r_φ (RSZ21 line 1764–1766) = n−1 at φ₀ ⇒ P rank n−1, quotient 1; (6.10) two annihilators (line 1800–1801); Lemma 6.11 / same | ok | — |
| U7/ramified-global-geometry (:1885) | n≥3; n=2 | RSZ21 Thm 6.7(ii) line 1722–1724: blow-up semistable away from ν ramified over F; n=2 Remark 6.8 / same | ok | — |
| U7/unitary-local-model-diagram (:1828) (sample) | self-dual unramified; ramified base change | (5.5) π a P-torsor, P smooth (line 1274–1276), φ̃ formally smooth of equal rel. dim (line 1279–1280); Gr(1,n) dim n−1; uv−t^e not regular (W4) / same; RG2.3.5 treats GL, GSp only (gap justified) | ok | — |
| U8/asd-completed-local-rings (:2039) (sample) | N=1; N=2 | LTXZZ22 Thm 5.2.5(1) line 2654–2657 strictly semistable, rel. dim N−1, projective iff generic fibre; Remark 5.2.4 N=1 strata empty ⇒ smooth; W[[x₁,x₂]]/(x₁x₂−p): Krull 2, rel. 1 / same | ok | — |
| U8/ltxzz-asd-moduli (:2004) (sample) | p-principal λ; N=1 | ker λ[p^∞]⊂A[p] of rank p² (Def 5.2.1 line 2616–2617) rejects principal; tame level through definite V° (Remark 5.2.2) / same; source datum says N>1 (line 2608) while Remark 5.2.4 treats N=1 | ok | source issue |
| U8/smooth-geometry-tangent (:2161) | special inert prime | p unramified in F, self-dual lattices, neat: Lan-good prime ⇒ C5.5, C5.18 apply / design routes through the gap | misrouted | R03 |
| U8/mixed-global-moduli (:2128, :2149) | q=3 | v₀-degrees 9·9, target principal ⇒ 9; LZ22 §13.4 prints q (E5) / same | ok | — |
| U9/basic-hom-comparison (:2188) (sample) | ordinary CM curve, conjugate action; supersingular, K=ℚ | dims 0 vs 2 at ℓ≠p (false); supersingular: 4=4 at ℓ, D_{1/2} at p / design claims iso | false | R01 |
| U9/formal-arithmetic-quotient (:2212, :2235–2237) | Γ=1; ℤ-shift; {±1} on N_n | 𝔐; 𝔑; −1_X carries ρ to −ρ so −1 acts trivially, quotient sheaf N_n, not a torsor / same; RZ96 Props 2.34–2.37 (line 2349–2411) / cited §§6.13–6.16 | ok, locator | R05 |
| U9/nearby-framing-datum (:2248, :2269) | flip v₀ only | product formula needs an even number of flips ⇒ real signature also changes; Zhang21 (7.3) line 1817 / same | ok | — |
| U9/inert-uniformization (:2376) (sample) | n=1; ramified F⁺_{v₀}/ℚ_p | no formal parameter; (7.3)–(7.6) line 1817–1835; LZ22 (13.1.0.1) line 3519 with N′ line 3525–3527; Cho18 Thm 4.3 line 1825–1830; LZ22 line 3564 Mihatsch applicable when v₀ ramified over p / same | ok | — |
| U9/exotic-uniformization (:2352) | base point; isometry | LL22 (4.8) line 3399–3406, Prop 4.30 line 3442, Remark 4.29 line 3440; u²/ϖ unit iff val_u(ϖ)=1 / same | ok | — |
| U9/mixed-uniformization (:2441) | degrees | deg α=q²≠q+1=deg π₁; LRZ26 Thm 14.6.2 line 2622–2634: π₁ finite flat of degree q+1, π₂ proper and an isomorphism on the non-special locus, exceptional P^{n−1} / same | ok | — |

## Verified sound

- **Principles.** No route-specific shortcut; PELModuli is imported by section (§§M0–M5 as listed at `:80`), never re-planned; no copied passage (statements are paraphrases with locators); no algorithm; no sorry'd data, no `set_option`, no Lean file at this stage; no process narrative (greps for the round-1 vocabulary return nothing); no machine path in the three files.
- **Gate**, run from the board checkout, verbatim:

      candidate: PELModuliPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
      depcheck: 56 roadmaps, 640 edges, 0 problem(s)

  Exit status 0; no UPWARD, CYCLE or moved line. Every `*Needs:*` item resolves to a target of this roadmap, a `gap:` with a plan.json entry, or a section of an allowed supplier (script over plan.json: 0 unresolved prerequisites, 0 `uses` entries pointing at deleted targets, every gap consumer listed in `neededBy`, every definition and construction with ≥3 Checks and an API list).
- **Seeded sample** (15 targets, `random.Random('REV-DESIGN-PELModuliPartII~2-2026-10-25').sample(sorted ids, 15)`; the author flagged no locator as unverified): U0/principal-hermitian-module, U0/signature-conjugation, U2/split-special-hom, U4/exotic-relative-equivalence, U4/principal-source-comparison, U5/kramer-framing-sign, U5/kramer-special-hom, U6/cm-moduli-integral, U7/localized-rsz, U7/ramified-kramer-model, U7/unitary-local-model-diagram, U8/asd-completed-local-rings, U8/ltxzz-asd-moduli, U9/basic-hom-comparison, U9/inert-uniformization. Theorem numbers, pages and hypotheses are correct at the text in 14 of 15 (lines in the table); the statements are supported as written in 14 of 15; U9/basic-hom-comparison is R01 (the source carries the same gap).
- **Round-1 locator corrections re-read**: LZ22 (2.11.0.1) line 584 (p. 15); Zhang21 (3.2) line 686; LZ22 §2.2 line 411–426 (p. 11); LZ22 §10.1 line 2805–2815; LL22 (2.1) and footnote 9 line 460–468; LL22 Definition 2.3, Lemma 2.4 line 432–443; LL22 Definition 2.59 line 1929; Zhang21 §7.3 (7.3)–(7.4) and footnote 3; RZ17 (8.2) line 1495–1497 (p. 28); LZ22 p. 76 line 3312–3320; AbelianSchemesAndArithmeticModuli §A6.13; PELModuli §M5.5. New locators re-read: Mih19 §§10–12 (R06), RZ96 Theorems 2.16, 3.25, Definition 3.21, Lemma 6.28, Corollary 6.29, Theorem 6.30, §§6.13–6.16, Theorem 6.23 and Propositions 2.34–2.37 (R05); RSZ21 §§3.3, 4.1, 5.1, Theorem 5.4, 6.7, Remarks 6.8–6.9, Definition 6.10, (6.6)–(6.10), Lemma 6.11; HLSY23 Definitions 2.1–2.2, (2.1)–(2.6), §10.1–10.2 (pp. 76–79); LTXZZ22 §5.1, Definition 5.2.1, Remark 5.2.4, Theorem 5.2.5; Wu16 §3.4 (3.21)–(3.26), Theorems 5.17–5.18; Cho18 Theorem 1.2, §3.9, Theorem 4.3; Kraemer03 Definition 4.1, Theorem 4.5, (4.11); Howard19 Propositions 2.1–2.2; LRZ26 Theorem 14.6.2 (p. 60); LL21 Notation 5.6, Lemma 5.2, 5.5, (8.2); RSZ20 Theorems 4.2, 4.7, Lemma 8.16, Remark 8.18, Proposition A.1, Remark A.2.
- **Source corrections E1–E7** re-confirmed where re-read: E1 (HLSY23 line 441, no polarization clause), E5 (degree equation), E6 (LL22 line 3356–3359 writes A₀[v^∞]/A₀[u^∞] where the height forces A), E4 (LTXZZ22 Theorem 4.2.3's projectivity clause, and the same shape at Theorem 5.2.5(1), line 2657).
- **Library declarations at the pins** (Mathlib `6b7abb3…`, Tau Ceti `a91d3aa…`, as in `lake-manifest.json`): the lines not opened in round 1 were opened now at the pinned commit: `AlgebraicGeometry.Scheme` `Mathlib/AlgebraicGeometry/Scheme.lean:40`, `MvPolynomial.C` `Mathlib/Algebra/MvPolynomial/Basic.lean:102`, `MvPolynomial.X` `:123`; the other ten lines are those round 1 verified and are unchanged in the README. The claim that the pins have no formal schemes, p-divisible groups over a base or abelian schemes with PEL structure stands (round 1; the repair report's grep).
- **Cross-roadmap citations resolved** at the current heads or on main, by section title: PELModuli §§M0.18, M0.25, M1.1, M1.6, M1.7, M1.9, M1.13, M2.8, M2.11, M2.12, M2.14, M2.15 (Zink displays, equivalence only over complete local noetherian rings with perfect residue field: the gap is real), M3.1, M3.2, M3.8, M4.3, M4.5–M4.8 (M4.7 assumes p unramified in F), M5.5; AbelianSchemesAndArithmeticModuli §§A4.1, A4.3, A4.7, A4.8, A4.9, A6.10, A6.11, A6.13; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.1, §§R07.2.10, R07.2.17, R07.2.20, R07.2.26 (its "Not built here" assigns displays to PELModuli); EndoscopicTransferAndUnitaryTraceComparison §§7.6, 8.3, 8.10, 10.2; IgusaVarietiesAndTorsionConcentration §IG.0.27 (unramified type A/C, single self-dual lattice) and §IG.0.31; AdicSpacesPartIII Layer F0 and §R2.9; SchemeAndStackFoundations Layers 1 and 4; AlgebraicModuliForArithmeticGeometry §1.3 (`coherentGrassmannian`, `grassmannSmoothness`); GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; PadicHodgeTheory §§3.3–3.5, 8.3; ShimuraVarieties §§1.7, 2.5–2.7, 4.5, 5.10, 6.7; AdelicAlgebraicGroups §4.1 (weak approximation and torsors; SelmerIwasawaCohomologyPartII declares the same gap there); ReductiveGroupsPartII §RG2.3.5 (GL and GSp chains only); ShimuraCompactifications §§C5.5, C5.18 (good primes; see R03); SelmerIwasawaCohomologyPartII §§2.2–2.6, 5.2, 5.4 and its gaps native-shimura (supplier ShimuraVarieties), unitary-incidence, unitary-special-compatibility, hermitian-local-global.
- **Declared gaps.** All four have a named supplier and section and the same slug in plan.json and README (counts 5/16/6/14 README mentions). zink-display-equivalence: precise and minimal (PELModuli §M2.15 stops at complete local bases). hermitian-local-global: precise; no owner found (Landherr existence is stated nowhere on main or at the open heads; GN §§2.7, 2.9 and PELModuli §§M3.1–M3.2 are local and Hasse-principle only). unitary-multichain-stabilizer: precise; RG2.3.5 is GL/GSp only. bad-prime-projectivity: precise but not minimal (R03).
- **Ownership and duplication by object** (`roadmaps grep` over main and the open heads; the board packages ShimuraVarietiesPartII, SchemeAndStackFoundationsPartII, VectorBundlesAndIsocrystalsPartII, PadicHodgeTheoryPartII, CrystallineCohomologyPartII and EndoscopicTransferAndUnitaryTraceComparisonPartII read at their heads): strict formal O-modules and O-displays occur only in PELModuli §M2.15; RZ96 Theorem 3.25 representability only as IgusaVarieties §IG.0.27's unramified case; the two exotic components, the CM moduli at ramified primes, formal quotients by discrete groups and the Tate–Dieudonné comparison for CM pairs have no other owner. ShimuraVarietiesPartII owns no Rapoport–Zink, Krämer, exotic or almost self-dual object. So this roadmap owns U0–U9 as stated.
- **Shape.** 13 definitions, 30 constructions, 21 theorems, 9 comparisons, 2 lemmas; every definition and construction has an API list and at least three Checks that compute something or exclude a wrong model; every target has hypotheses, a locator and an item-by-item `*Needs:*` line; layers end with their dependency lines; the headline section names what is not statable at the pins. Elaboration: not available (this lane does not elaborate; the design has no `Suggested.lean`).

## Not verifiable

- Published page numbers of Zhang21 (Annals) and LTXZZ22 (Inventiones): the manifest records the arXiv v3 texts; section, theorem and equation numbers were checked there, pages were not (R04 asks the README to say so).
- RZ96 is an image-only scan read through its OCR text; Propositions 2.34–2.37, Theorem 6.23, Lemma 6.28 and Corollary 6.29 were read from it and are legible; page numbers come from the printed running heads.
- Mih19 Propositions 3.4, 3.6, Lemma 3.9, Corollary 3.10 (pp. 12–18): existence and setting confirmed (Theorems 3.1 and 3.3, ℚ_p⊂K⊂E₀⊂E with E/E₀ unramified), proofs not re-derived.
- HLSY23 §10.1–10.2 and LL21 Lemmas 5.2, 5.5, (8.2): existence and pages confirmed, content not re-derived (not in the sample).
- Ownership against open pull requests was checked through the grep tool over all open heads and the listed board packages; the LubinTate board job has no design text and was not consulted (no longer cited).

## Source issues

- **Gap** in RZ96 at Corollary 6.29, printed p. 293: the source says the ℓ-adic K-linear Hom comparison holds for any two polarized K-objects each isoclinic at every place of K above p; it should require a common Frobenius element, for instance equal slopes at every such place; affects a stated result.
- **Misprint** in LTXZZ22 at §5.2, published p. 188: the source says the definite space V° has rank N>1 while Remark 5.2.4 and Theorem 5.2.5 treat N=1; it should read N≥1; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4592423", "job": "REV-DESIGN-PELModuliPartII~2", "model": "fable", "worker": "fable-rev148"} -->
