<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/384#issuecomment-6369346569 -->
Review (claude) of d4bb48d

Verdict: needs changes

1. **F01** (P1) The auxiliary isogeny's degree is stated in two incompatible ways

   **Location.** `packages/PELModuliPartII/design/README.md:622`, the same text at `packages/PELModuliPartII/design/plan.json:1395`: "The polarization degree equation forces deg α=q^(n+1); ker λ_Y has order q² and deg(ϖλ_barℰ)=q²." Lines 587 and 609 of the same target (U2/mixed-framed-space) say deg α=q².

   **Claim.** An acceptance criterion of U2/mixed-framed-space.

   **Witness.** The target X is principal, so α*λ_X=λ_Y×ϖλ_barℰ gives (deg α)²=q²·q², hence deg α=q². At n=2, q=3: deg α=9, while q^(n+1)=27. LZ22 line 2854 (§10.2, p. 65) fixes this pullback identity.

   **Repair.** In both files replace "deg α=q^(n+1)" by "deg α=q²" and keep the reason clause. Tested at n=2, q=3: 9·9=81=9², so the degree is 9. Add 27 as the rejected value in the existing degree Check.

2. **F02** (P1) Both declared gaps have no supplier

   **Location.** `README.md:2641–2657` and the `gaps` list of `plan.json` (entries G1 and G2 have no supplier or section). `README.md:779`: "For general K retain the source claim as a target whose component proof requires the gap recorded in this packet."

   **Claim.** G1 and G2 are supplier contracts.

   **Witness.** Neither gap names a supplier, so neither is owned. G1's claim is LL22 Lemma 2.4 (LL22 line 437–438), whose footnote 8 (line 450) extends Wu's proof to every base field. No prerequisite consumes G2 (no `gap:` entry in `plan.json`).

   **Repair.**
   - G1: own the statement here. Keep U3/exotic-smoothness as the smoothness theorem for every K. Add a theorem target `U3/exotic-components`: for every finite K/ℚ_p, L/K ramified quadratic, p>2 and even n≥2, N^exo has exactly two connected components, told apart by the parity of the Kottwitz invariant. Proof route: the Bruhat–Tits stratification and the connectivity argument of Wu16 Theorems 5.17–5.18 (pp. 30–31), run over K as LL22 footnote 8 asserts; LL22 §2.3 already uses that stratification over a general base field. Locator: LL22 Lemma 2.4 and footnote 8, p. 10. Check: for K=ℚ_p and n=2 there are two components, each of relative dimension 1. Then delete G1 from both files.
   - G2: delete the gap. U7/ramified-global-geometry and U9/kramer-formal-comparison are already stated for n≥3, which is the range of RSZ21 Theorem 6.7(ii) (RSZ21 line 1722–1724). Add a negative Check citing RSZ21 Remark 6.8 (p. 33, line 1741–1744). For n=2 the local model is semistable over the ring of integers of F⁺_{v₀}, but semistability is lost after the necessarily ramified extension to O_{E_ν}. Keep the local rank-two chart of U5/kramer-local-charts.
   - Tested: after the repair the `gaps` list is empty and every target is owned.

3. **F03** (P1) The eleven supplier contracts are undeclared gaps, and several cite sections that lack the statement

   **Location.** `README.md:2547–2637` (the opening sentence: "These contracts request additional mathematics from the named owners"), the twelve "rescope" paragraphs at `README.md:2667–2731`, and the 11 entries of `plan.json` `requests`. Meanwhile `gaps` holds only G1 and G2.

   **Claim.** The target prerequisites that cite these labels are supplied.

   **Witness.** On main, AdicSpacesPartII has only Layers R0 and R1 (`TauCetiRoadmap/AdicSpacesPartII/README.md:514`, `:8399`), so its "R2" does not exist. Formal generic fibres are AdicSpacesPartIII Layer R2 (`TauCetiRoadmap/AdicSpacesPartIII/README.md:4100`). The table covers the other rows.

   | Contract (README line) | What the supplier says at its head (or main) | Verdict | Re-route |
   | --- | --- | --- | --- |
   | FiniteFlatGroups… R07.2 (2551) | Layer R07.2 is Dieudonné theory over perfect bases. Its "Not built here" paragraph leaves Zink displays, Norman–Oort theory and polarized O-displays to PELModuli. PELModuli §M2.15 has only Wedhorn's char-p displays and particular one-parameter lifts. | misrouted, partly missing | Own strict O_K-modules, relative duality, relative O-displays and the Mihatsch contraction here (U0). Declare a gap to FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII TD.0 `display`, `display-classification` and TD.1 `display-deformations` (board design) for Zink displays. Cite EndoscopicTransferAndUnitaryTraceComparison §7.6 for strict O-Dieudonné classification in dimension one. |
   | SchemeAndStackFoundations SF.4 (2559) | Layer 4 works with adic thickening systems. Topologically ringed formal schemes and polarized algebraization are outside its scope (README line 73–75). | misrouted | Cite IgusaVarietiesAndTorsionConcentration §IG.0.27 (PEL Rapoport–Zink spaces, RZ96 Theorem 3.25, unramified principal data of type A or C) and AdicSpacesPartIII §F0 (locally noetherian formal schemes). For the nonprincipal, ramified and relative cases, own the representability here or declare a gap to §IG.0.27. |
   | SchemeAndStackFoundations SF.1 (2567) | Layer 1 is descent and stacks for schemes. No roadmap states a formal quotient by a discrete group. | missing | Own the formal quotient in U9 (RZ96 §§6.13–6.16) or declare a gap with a named supplier. |
   | PELModuli M4 (2575) | §M4.7 assumes p unramified in F. The rescope text at line 2689 asks for "PELModuli, Part II", which is this roadmap. | missing | Own the ramified-prime CM moduli extension as a U6 target. |
   | GeometryOfNumbers… GN.2 (2583) | Layer 2 §§2.7 and 2.9 cover hermitian lattices and signed local forms; no roadmap states Landherr existence. SelmerIwasawaCohomologyPartII asks AdelicAlgebraicGroups for the same theorem (gap:hermitian-local-global). PELModuli §§M3.1–M3.2 give the ker¹ forms and the unitary Hasse principle. | partly missing; a second owner is already requested | Declare gap:hermitian-local-global to AdelicAlgebraicGroups with the same needs. Cite PELModuli §M3.2 and GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9. |
   | ReductiveGroupsPartII RG2.3 (2591) | §RG2.3.5 `lattice-chain-stabilizer-schemes` treats GL and GSp only. | missing | Declare a gap to §RG2.3.5: for p>2 the automorphism scheme of a polarized O_L-multichain is smooth. |
   | LubinTate… LT.3 (2599) | The roadmap exists only as an available board package job with no design text. EndoscopicTransferAndUnitaryTraceComparison §10.2 already proves the Cartier-divisor Drinfeld level, the regular finite level cover and the generic torsor. | already provided | Cite §10.2 (and §IG.0.31, see R04); drop the contract. |
   | AdicSpacesPartII R2 (2607) | See the witness. | does not exist | Repoint to AdicSpacesPartIII §§F0, R2, and declare a gap there if the locally formally finite type case is absent. |
   | ShimuraCompactifications C5 (2615) | Layer C5 treats good primes; bad primes are not treated (README line 2634, 2640). | missing | Declare a gap to §C5, or own properness of the compact unitary pair models here. |
   | Faltings… R28.4 (2623) | Layer R28.4 is the Tate conjecture over number fields. Finite-field Tate and Honda are EndoscopicTransferAndUnitaryTraceComparison §8.3; B-linear isogeny classification is its §8.10. | misrouted | Cite §§8.3 and 8.10. Own RZ96 Corollary 6.29 (p. 293) in U9, or declare it a gap. |
   | AbelianSchemes… A6 (2631) | §§A6.10–A6.12 give the ℤ-characteristic polynomial, its Tate comparison and traces through a subfield. None states an F-linear polynomial or constancy in families. | missing | Declare a gap to §§A6.11–A6.12 for Zhang21 Lemmas 7.10(b) and 7.11. |

   **Repair.** For every row marked missing, put `gap:<slug>` in each consuming target's prerequisites. Add a `gaps` entry with `supplier`, `section` and a one-sentence `needs`, and state it under the README's supplier contracts. For the misrouted rows, repoint the prerequisites. Replace the twelve rescope paragraphs: they propose new Part II roadmaps, but FFG, SF, GN, AdicSpacesPartII, AlgebraicModuli and Faltings already have Part II packages on the board. Tested on the AdicSpacesPartII row: after the repair U2/mixed-generic-projections cites AdicSpacesPartIII, whose Layer R2 states the generic-fibre functor.

4. **F04** (P2) Two U7 targets and the absolute Rapoport–Zink representability restate open roadmaps

   **Location.** `README.md:1833–1874` (U7/split-drinfeld-level), `README.md:1984–2003` (U7/split-integral-geometry), and `README.md:2561` (RZ96 Theorem 3.25 requested from SF.4).

   **Claim.** This roadmap owns the split Drinfeld-level models.

   **Witness.** IgusaVarietiesAndTorsionConcentration §IG.0.31 uses the signature-(1,n−1) datum, the RSZ20 §4.3 matching condition and H=Hom(A₀[w₀^∞],A[w₀^∞]). From EndoscopicTransferAndUnitaryTraceComparison §10.2 it builds the full-set Drinfeld level, the regular finite cover and the principal-congruence generic fibre. Its §IG.0.27 owns PEL Rapoport–Zink spaces.

   **Repair.** Delete both U7 targets. Cite §IG.0.31 and §10.2 in Scope and in the consumers (U7/global-integral-gluing, U8/integral-hecke-system). Keep one Check: at a split v₀ the datum of §IG.0.31 is this roadmap's U7/semiglobal-rsz model. Cite §IG.0.27 for U1's absolute representability (with R03). Tested: afterwards no target constructs T[ϖ^m] or the Drinfeld cover, and the LT.3 contract disappears. IgusaVarietiesAndTorsionConcentration is merge-order line 138; nothing earlier consumes this roadmap.

5. **F05** (P2) The proposed Part III re-plans SelmerIwasawaCohomologyPartII, and the LTXZZ models get two owners

   **Location.** `README.md:2661–2665` (split proposal with D0–D6) and the routing ledger at `README.md:3003–3266` (189 rows routed to "PELModuliPartIII:D…").

   **Claim.** The LTXZZ22 special-fibre items need a new owner, PELModuliPartIII.

   **Witness.** SelmerIwasawaCohomologyPartII Layer 2 already plans these items: §2.2 is LTXZZ22 Theorem 4.3.5, §§2.3–2.6 the strata, link cohomology and product resolution, and Appendix A is its gap:unitary-incidence. PELModuliPartIII does not exist on main, at the open heads, in the board index or in board job titles.

   **Second witness.** That roadmap's gap:native-shimura asks ShimuraVarieties for the LTXZZ22 §5.2 models that U8 builds here.

   **Repair.** Route the 189 items to the SelmerIwasawaCohomologyPartII sections: D1–D3 and D5–D6 to §§2.2–2.6 and the reciprocity targets that cite LTXZZ22 Theorem 5.11.5, the D4 Cartesian squares (Propositions 4.5.5 and 5.10.6) to its gap:unitary-special-compatibility, and the D0 Appendix A items to its gap:unitary-incidence. Delete the split proposal and every mention of PELModuliPartIII. In Scope, record U8 as the owner of the native models of LTXZZ22 §§4.2 and 5.2. Under Downstream consumers, name SelmerIwasawaCohomologyPartII Layer 2 and say that U8 discharges its gap:native-shimura, whose supplier should then be this roadmap. Tested: the string "PELModuliPartIII" no longer occurs, and LTXZZ22 Theorem 4.3.5 has one owner.

6. **F06** (P2) The dependency check cannot see the supplier lines, so the gate places the roadmap too early

   **Location.** Every target, for example `README.md:80` "**Prerequisites:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, …", and the layer headers, for example `README.md:1369` "**Layer imports:** … `PadicHodgeTheory:R06.2` …".

   **Claim.** The dependency check certifies the supply direction.

   **Witness.** The prescribed gate places the design after PELModuli (merge-order line 89). With these two labels rewritten as `*Needs:*`, it lands after ShimuraCompactifications (115). The cited suppliers PadicHodgeTheory (95), FaltingsFinitenessAndIsogenyTheorems (112) and ShimuraCompactifications all sit below PELModuli.

   **Repair.** Give each target a `*Needs:*` line, item by item. In a scratch test the gate then reports `depcheck: 27 roadmaps, 235 edges, 0 problem(s)`, after ShimuraCompactifications. After R03 and R04 the suppliers also include EndoscopicTransferAndUnitaryTraceComparison (110), IgusaVarietiesAndTorsionConcentration (138), AdelicAlgebraicGroups and AdicSpacesPartIII, so the intake must insert the roadmap after IgusaVarietiesAndTorsionConcentration.

7. **F07** (P3) Locator errors in the sample, unmapped labels and the baseline commits

   **Location and witness**, item by item (each source line was read):
   - U1/product-embedding (`README.md:355`): the map δ is LZ22 §2.11, equation (2.11.0.1), p. 15 (LZ22 line 582–585). §4.5, p. 23, treats quasi-canonical liftings (line 912). In Zhang21, δ is equation (3.2) of §3.1 (arXiv v3 line 683–688); §3.2 is Proposition 3.9.
   - U1/special-hom (`README.md:394`): the space V is LZ22 §2.2, p. 11 (line 419–426), not §2.1.
   - U2/almost-self-dual-rz (`README.md:482`): N¹ is defined in LZ22 §10.1, pp. 63–64 (line 2805–2815).
   - U3/exotic-special-hom (`README.md:836`) and U3/rank-one-source (`README.md:797`): the u^−2 form is LL22 (2.1), p. 11 (line 459–468). LL22's (2.3) is a density identity, and "Remark 2.4" is Lemma 2.4. For U3/exotic-rz (`README.md:729`) cite Definition 2.3 and Lemma 2.4.
   - U3/exotic-smoothness and G1: footnote 8 is on p. 10.
   - U4/absolute-exotic (`README.md:885`): Exo_Φ is LL22 Definition 2.59, p. 38 (line 1929). LL22 2.58 is a lattice lemma (line 1821).
   - U9/nearby-framing-datum (`README.md:2315`): Zhang21 §2.1 is the group-theoretic setup and has no nearby space (arXiv v3 line 396). Cite §7.3, (7.3)–(7.4) (line 1817–1824).
   - U6/eisenstein-condition (`README.md:1513`): RSZ21 case (2) takes its condition from Rapoport–Zink 2017, (8.2) (RSZ21 line 1374, reference line 2040). Cite that paper, and Zhang21 footnote 3 (line 1846–1849) for its equivalence with Mihatsch's condition in signature (n−1,1). The split case of (2) is the strictness clause of U7/split-drinfeld-level.
   - U7/semiglobal-local-types (`README.md:1971`): semistability is stated on LZ22 p. 76 (line 3312–3313).
   - U8/mixed-global-moduli: the pullback-degree identity is AbelianSchemesAndArithmeticModuli §A6.13, not the A6.1 node cited.
   - U6/rsz-datum: cite PELModuli §M5.5 (unitary PEL data with prescribed signatures) for the datum V.
   - Unmapped atlas labels: PadicHodgeTheory "R06.2/plan/admissible-category-tannakian" is §§3.3–3.5 and "R06.5/plan/abelian-scheme-dcris" is §8.3. ShimuraVarieties "V1/level-index" is §1.7, "V2/plan/baily-borel" §§2.5–2.7, "V4/plan/torus-model" §4.5, "V5/plan/main-cm" §5.10 and "V6/plan/abelian-canonical" §6.7.
   - Baseline (`README.md:32`): the design records Mathlib 082e2d37 and Tau Ceti f7904748, but the pins are Mathlib 6b7abb3 and Tau Ceti a91d3aa. The cited declarations exist at the pins on other lines, for example `ZMod` at `Mathlib/Data/ZMod/Defs.lean:138` and `Matrix.charpoly` at `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132`.
   - Manifest: the design had no `sources.toml`. This review's fetches recorded eleven works (LZ22, HLSY23, RSZ20, Cho18, Mih19, LL22, RSZ21, LTXZZ22, Zhang21 as arXiv v3, Wu16, RZ96). Howard19, Kraemer03, LRZ26, LL21 and Rapoport–Zink 2017 still need entries.

   **Repair.** Correct each locator as above, give the label-to-section map in Scope, restate the pins from `lake-manifest.json` with the lines read there, and add manifest entries for every cited work.

8. **F08** (P3) One hermitian space with two normalizations

   **Location.** `README.md:2436`: "the induced definite Hermitian V′ with h=ϖ^−1 λ₀^−1 y∨λ_Ax"; `README.md:832`: "use h(x,y)=u^−2 λ_0^−1 y^∨λ_𝕏 x".

   **Claim.** U9/exotic-uniformization identifies V′⊗K_u with the space V^exo of U3 through U4.

   **Witness.** The two forms differ by the scalar u²/ϖ ∈ K_u^×. LL22 fixes the valuation of ϖ only at the places of its set U, which excludes u (LL22 line 3374–3375). The identification is an isometry only if ϖ=u² in K_u. If val_u(ϖ)≠1, lattice duality shifts as well.

   **Repair.** In Conventions, require ϖ=u² in K_u at the distinguished place, or record the similarity factor u²/ϖ. Add a Check: for n=2 the two forms on the same Hom space differ by u²/ϖ, which equals 1 under that choice. Also align `README.md:2275` (ϖλ₀) with the statement's u₀λ₀.

9. **F09** (P3) Checks, process narrative and house style

   **Location and witness.**
   - On 40 targets the Acceptance block repeats named checks word for word. Some checks do not discriminate: AdmissibleCMData.compositum (`README.md:1447`) and KramerIsocrystal.traceFactor (`README.md:1219`). UnitaryRZ.productNoSwap (`README.md:372`) restricts to n≥2, although (1,0)+(1,0)=(2,0)≠(1,1) already fails at n=1.
   - Process narrative: "this packet" (779), "now proves" (646, 2613), "not a declaration that the continuation was source-closed in this run" (2665), "consulted in the maintainer's cleared library" (2875), and "the compact shape prescribed on 12 October 2026" next to a companion-file path (3270). Fifteen "Read 2026-10-19" lines, pipeline item ids in the routing ledger (3001–3266) and "Atlas name" fields add to it.
   - ASCII mathematics: "a-bar", "breve L", "O_breveL", "bar ℰ".
   - Checks carry Lean-style names.
   - The planned companion (3270) states signature relabelling, Jordan and crossing checks and degree arithmetic. Under the Suggested.lean rules all of these are padding.

   **Repair.** Replace each duplicated Acceptance line with a new discriminating case or delete it. Rewrite the narrative passages without time references. Write the mathematics in Unicode, and make Checks prose. At the package stage, the Suggested.lean docstring should name the headlines that cannot be stated at the pins, each with its missing carrier: the unitary Rapoport–Zink spaces (formal schemes and polarized p-divisible groups over O_K̆), the RSZ integral models (abelian schemes with PEL structure over a base) and the basic uniformization. It should state no padding.

Reviewed on 2026-10-23. There are nine findings, six of them blocking (three P1, three P2). There was no previous review to reconcile. The design does not re-plan its parent PELModuli and is repairable. I changed no design file. The design carried no `sources.toml`; the sources service created `packages/PELModuliPartII/sources.toml` while fetching the texts checked below.

## Adversarial pass

Values computed by me on the left, against the design's statement or the source on the right. W are the worked checks of `README.md:19–28`.

| Statement | Instances tried | Values computed (mine / design or source) | Result | Change |
| --- | --- | --- | --- | --- |
| W1 heights | n=3, [K:ℚ_p]=2 | rel. height 2n=6, abs. 12, dim 3 / same | ok | — |
| W2 mixed degrees | n=2, q=3 | (1,1)+(0,1)=(1,2)=(1,n); 9·9=81 ⇒ deg 9; q+1=4 / same | ok | — |
| W3 Jordan | [[0,1],[0,0]] over 𝔽₃ | charpoly T², N²=0, N≠0 / same | ok | — |
| W4 ramified crossing | uv=t², point (u,v,t) | dim m/m²=3 > Krull dim 2 ⇒ not regular / same | ok | — |
| W5 rank-two chart | y(1+x²)=2u, p=3 | roots ±i simple (2x≠0); z=(1+x²)/2 gives yz=u / same | ok | — |
| W6 graph dimensions | n=4 | rel. 2 and 5; abs. 3 and 6 / same | ok | — |
| W7 period line | N=3 | vacuous condition gives dim 3; Hom(rank 1, rank 1)=1 / same | ok | — |
| W8 full level | n=1, m=1, special fibre | zero sections: divisor q[0]=[H[ϖ]] / allowed (also EndoscopicTransfer §10.2 Check) | ok | — |
| U0/principal-hermitian-module | n=1; (r,s)=(1,0),(0,1); a≠ā | Lie characters a, ā; λi(a)=i(a)^∨λ fails when a≠ā / same | ok | — |
| U0/relative-comparison-functor | K₀=K | Ψ={ψ₀,ψ₁}, P₀₁=T−ā, P₁₀=T−a, P(r,s)=(T−a)^r(T−ā)^s / matches U0 module | ok | — |
| U0/relative-framed-comparison | K₀=K | identity framing ⇒ identity isomorphism / same | ok | — |
| U0/relative-local-model | (1,n−1); r=0 | dim Gr(1,n)=n−1; Gr(0,n)=point / same | ok | — |
| U0/signature-conjugation | n=1, twice | (1,0)↔(0,1); conjugating twice gives id / same | ok | — |
| U1/unramified-rz | n=1; cλ | N₁=Spf O (LZ22 line 415); cλ with c≠1 fails ρ*λ_𝕏=λ / same | ok | — |
| U1/unramified-smoothness | n=1, 2 | rel. dim 0, 1 / same; LZ22 line 407–408 | ok | — |
| U1/rank-one-lift | — | heights 2, dims 1; double conjugate = id / same | ok | — |
| U1/product-embedding | n=1; ℰ instead of barℰ | (1,0)+(0,1)=(1,1), height 4; (2,n−1)≠(1,n) for every n≥1 / Check says n≥2 | ok | R09, R07 |
| U1/special-hom | n=2 | dim_L V=2, height 4; nonsplit (LZ22 line 423) / same | ok | R07 |
| U1/diagonal-graph | n=2, 3 | 0 in 1; rel. 1/3, abs. 2/4; half formal dimension (Zhang21 (3.5)) / same | ok | — |
| U2/almost-self-dual-rz | q=3 | order q²=9; principal order 1 / same; LZ22 line 2806–2807 | ok | R07 |
| U2/almost-self-dual-geometry | uv−ϖ, uv−t² | regular; not regular / same | ok | — |
| U2/split-special-hom | W split, adjoin ⟨ϖ⟩ | ε(V_{n+1})=χ((−1)^n)ε(W)χ(ϖ)=−1, nonsplit / same | ok | — |
| U2/mixed-framed-space | n=2, q=3 | deg α=9 / Acceptance says q^(n+1)=27 | false | R01 |
| U2/mixed-generic-projections | q=3 | q+1=4 self-dual Λ♯ (LZ22 Remark 10.2.1, line 2871–2883) / 4 | ok | — |
| U3/exotic-relative | n=2; i(u)=0 in char p | height 4, dim 2; T^n ≡ (T−u)^{n−1}(T+u) mod u, wedge holds, spin fails / excluded | ok | — |
| U3/exotic-symmetrization | λ=σ i(u), λ^∨=−λ | Rosati gives σ^∨=σ (LL22 Remark 2.2, line 428) / same | ok | — |
| U3/exotic-rz | c≠1 | multiplier rejected (LL22 Definition 2.1 morphisms) / same | ok | R07 |
| U3/exotic-smoothness | n=2; general K | rel. dim 1; two components asserted by LL22 Lemma 2.4 via footnote 8 / design keeps an unowned gap | defect | R02 |
| U3/rank-one-source | — | height 2, dim 1, End⁰=L (LL22 line 455) / same | ok | R07 |
| U3/exotic-special-hom | omit u^−2 | u²=−uū∈K, so symmetry is kept; factor u² / same; LL22 (2.1) | ok | R07, R08 |
| U4/absolute-exotic | f=2, n=2; f=1 | abs. height 8, dim 4; f=1 relative / same (LL22 Def. 2.59) | ok | R07 |
| U4/banal-display-contraction | f=1; identity | no components; (u⊗1−1⊗[φ(u)])(−u⊗1−1⊗[φ(u)])=Vε (LL22 line 1985) / same | ok | — |
| U4/exotic-relative-functor | f=1, 2 | empty product ⇒ μ=1; heights 2n vs 4n (LL22 (2.20)) / same | ok | — |
| U4/exotic-relative-equivalence | f=1 | identity / same (LL22 Proposition 2.62) | ok | — |
| U4/principal-source-comparison | f=2 | 4/2 → 2/1; isometry (LL22 Corollary 2.66, line 2198–2201) / same | ok | — |
| U4/exotic-framed-comparison | f=1 | identity (LL22 Corollary 2.65) / same | ok | — |
| U5/kramer-filtration | n=3 | rank 2, quotient 1; rank-one subbundle fails (HLSY23 line 442–445) / same | ok | — |
| U5/kramer-rank-one-source | — | Lie action ā (HLSY23 line 494–496); heights 2, 2[K:ℚ_p] / same | ok | — |
| U5/kramer-rz | c∈O_K^× | λ~cλ (HLSY23 line 447) / same | ok | — |
| U5/kramer-dieudonne-space | trace recovery; n=3 | Tr(u^−1)=0 ⇒ Tr(u^−1(A+uB))=2B; dims 3 and 6 / same (HLSY23 (2.1)–(2.2)) | ok | — |
| U5/kramer-framing-sign | n=3, n=2 | odd n: a non-norm unit c flips χ(c^n·det); even n: c^n a norm / same (HLSY23 line 472–474) | ok | — |
| U5/kramer-local-charts | n=2; n≥3 at a quadric point | simple roots of 1+x²; Σ_{i≠k}x_i²=−1 ⇒ gradient ≠0; n variables, 1 equation / same | ok | — |
| U5/kramer-geometry | — | abs. dim n, rel. n−1 / same | ok | — |
| U5/kramer-special-hom | λ_Y↦cλ_Y; n=2 | h·c^−1; dim 2 / same | ok | — |
| U5/kramer-hom-comparison | e↦ae | factor aā (HLSY23 (2.6)) / same | ok | — |
| U6/rsz-datum | (z,g); n=2 | c(z^−1g)=Nm(z)^−1c(g)=1; inverse (z,zu); E⊇φ₀(F) since σ fixing Φ and r fixes φ₀ / same (Zhang21 §6.1) | ok | R07 |
| U6/admissible-cm-type | E_Φ⊂E_u | K=E_u, a tautology / Check | weak | R09 |
| U6/auxiliary-cm-generic-comparison | scalars | one c for λ₀ and λ (as in LTXZZ22 Def. 4.2.2, line 2042) / same | ok | — |
| U6/cm-coefficient-unramified | composita | compositum of unramified extensions is unramified / same | ok | — |
| U6/eisenstein-condition | A_ψ=∅; F_w/ℚ_p unramified | Q=1 ⇒ Lie_ψ=0; automatic (RSZ21 line 1364) / same | ok | R07 |
| U6/local-level-data | unramified, length one | order q_v²; unimodular ⇒ ε=+1, so no self-dual lattice when nonsplit / same | ok | — |
| U6/sign-condition | r₀|Φ=0, 1 | (−1)^{Σr_φ}; Σ(n−r_φ)=Σ_{Φ̄}r / same (RSZ20 (A.7), Remark A.2) | ok | — |
| U7/localized-rsz | bad set | D₀={residue char 2, ramified, inert nonsplit} (Zhang21 line 1640–1643) / same | ok | — |
| U7/localized-smoothness | n=2 | rel. dim 1 (Zhang21 Theorem 6.2) / same | ok | — |
| U7/semiglobal-rsz | ASD place | kernel order q_v² (LZ22 (M7), line 3282–3284) / same | ok | — |
| U7/exotic-global-model | n=2, f=1 | A₀[u^∞] height 2f≠2nf (LL22 p. 66, rendered) / same | ok | — |
| U7/ramified-kramer-model | distinguished factor | rank n−1 structural vs U5 conjugate, consistent after conjugation / same | ok | — |
| U7/split-drinfeld-level | m=0; char 0 | unique datum; zero map fails (q^m distinct points) / same | ok | R04 |
| U7/unitary-local-model-diagram | self-dual unramified | Gr(1,n), dim n−1 / same | ok | R03 |
| U7/exotic-global-smoothness | n=2, f=2 | rel. dim 1 vs abs. 4; smooth projective (LL22 p. 66) / same | ok | — |
| U7/ramified-global-geometry | n=2 | reflex field F⁺_{v₀}, but E_ν⊇F_{v₀} is ramified ⇒ semistability lost (RSZ21 Remark 6.8) / same | ok | R02 |
| U7/semiglobal-local-types | self-dual vs ASD | kernel orders 1, q²; semistable when ν is unramified over p (LZ22 p. 76) / same | ok | R07 |
| U7/split-integral-geometry | m=0 | smooth, rel. dim n−1 / same | ok | R04 |
| U7/global-integral-gluing | inert self-dual | localization smooth / same | ok | — |
| U8/ltxzz-smooth-moduli | N=1, N=3 | rel. dim 0; period line 1 vs 3 / same (LTXZZ22 Thm 4.2.3) | ok | — |
| U8/ltxzz-asd-moduli | F⁺_𝔭=ℚ_p | kernel rank p²=q² (LTXZZ22 Def. 5.2.1); N=1 strata empty (Remark 5.2.4) / same | ok | — |
| U8/asd-completed-local-rings | N=2 | W[[x₁,x₂]]/(x₁x₂−p): Krull dim 2, rel. dim 1 / same | ok | R09 ("Thus quasi-projective" does not follow from local rings) |
| U8/asd-generic-datum | definite V′, N>1 | contradicts signature (N−1,1) / same | ok | — |
| U8/integral-hecke-system | g=a=1 | identity; F⁺-adeles (cf. E3) / same | ok | — |
| U8/mixed-global-moduli | q=3 | v₀-degree 9 (LZ22 line 3593 prints q_{v₀}) / same | ok | R07 |
| U8/smooth-geometry-tangent | N=2 | Hom(rank 1, rank 1)=1 / same | ok | — |
| U9/nearby-framing-datum | flip v₀ only; inert principal/ASD | ∏ε=−1; flipping the φ₀ signature restores 1; V′ nonsplit or split / same | ok | R07 |
| U9/banal-local-factors | v₀ the only place above p | empty product = point / same (Cho18 Thm 4.3) | ok | — |
| U9/uniformization-morphism | Hasse | Z′⊂Z open and closed, equal under Hasse (RZ96 Thm 6.30, p. 293) / same | ok | R03 |
| U9/exotic-uniformization | normalization | ϖ^−1 vs u^−2 differ by u²/ϖ / not pinned | defect | R08 |
| U9/inert-uniformization | n=1 | no formal parameter; matches Zhang21 (7.4) and Cho18 Thm 4.3 / same | ok | — |
| U9/cm-partition-and-product | two CM classes | two labelled fibres (Zhang21 (7.5)–(7.6)) / same | ok | — |
| U9/kramer-formal-comparison | n | n≥3 only, as in RSZ21 Thm 6.7(ii) / same | ok | — |
| U9/mixed-uniformization | — | deg α=q² ≠ deg π₁=q+1 / same | ok | — |

## Verified sound

- **Principles.** No route-specific shortcut. The design does not re-plan PELModuli (§§M0–M4 are imported). I found no copied source passage, no computational algorithm, no sorry'd data and no `set_option`. The design has no Lean file, and its "Suggested Lean companion" refers to a file outside the package.
- **Seeded sample** (15 targets, drawn with Python `random.Random('REV-DESIGN-PELModuliPartII-2026-10-23')` over the sorted ids; the author flagged no locator as unverified). Eleven sampled targets were correct as cited at the source: U4/banal-display-contraction (LL22 Lemma 2.60, p. 39), U4/principal-source-comparison (LL22 (2.25), Corollary 2.66, p. 43), U5/kramer-filtration (HLSY23 Definition 2.2(3), p. 10), U5/kramer-framing-sign (HLSY23 §2.2, p. 11; RSZ21 Remark 6.9, p. 33), U6/rsz-datum (Zhang21 (6.1)–(6.6)), U6/sign-condition (RSZ20 (A.1)–(A.8), Proposition A.1, Remarks A.2–A.3, pp. 54–58), U7/exotic-global-smoothness (LL22 p. 66; RSZ21 Theorem 5.7, p. 27), U7/localized-smoothness (Zhang21 Definition 6.1, Theorem 6.2), U7/semiglobal-local-types (LZ22 §§11.2–11.3, with the page note of R07; Cho18 Proposition 4.2, Theorem 4.3), U8/ltxzz-asd-moduli (LTXZZ22 §5.1, Definition 5.2.1, Remark 5.2.4, pp. 188–190) and U8/mixed-global-moduli (LZ22 §13.4 and §10.2). U6/eisenstein-condition was also correct in content, apart from the attribution in R07. Wrong locators are listed in R07: U1/product-embedding, U1/special-hom, U9/nearby-framing-datum (Zhang21 §2.1). The statements are supported in substance in all 15 cases.
- **Source corrections** confirmed at the text: E1 (HLSY23 Definition 2.2(2), line 441), E2 (HLSY23 line 75 against Definition 2.2(3)), E3 (LTXZZ22 line 2047), E4 (LTXZZ22 line 2066–2069), E5 (LZ22 line 3593) and E6 (LL22 p. 66, checked on the rendered page).
- **Library declarations at the pins** (Mathlib 6b7abb3, Tau Ceti a91d3aa): `LinearMap.charpoly` (`Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`), `LinearMap.charpoly_monic` (`:72`), `LinearMap.charpoly_natDegree` (`:76`, needs `StrongRankCondition`), `Matrix.charpoly` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132`), `AlgebraicGeometry.Smooth` (`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59`), `AlgebraicGeometry.Flat` (`Mathlib/AlgebraicGeometry/Morphisms/Flat.lean:42`), `MvPolynomial.eval` (`Mathlib/Algebra/MvPolynomial/Eval.lean:256`), `ZMod` (`Mathlib/Data/ZMod/Defs.lean:138`), `TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, a field base only) and `AbelianVariety.smooth` (same file `:127`).
- **Cross-roadmap citations resolved by content.** PELModuli: M0/determinant-condition §M0.18, M0/hermitian-space §M0.22, M0/generalized-cm-type §M0.25, M0/rational-pel-datum §M0.6, M0/similitude-group §M0.7, M0/skew-hermitian-space §M0.23, M0/reflex-field §M0.16, M0/reflex-field-comparison §M0.17, M0/symplectic-o-lattice §M0.4, M1/char-zero-adelic-moduli §M1.9, M1/moduli-problem §M1.7, M1/prime-to-box-quasi-isogeny §M1.1, M1/level-structure §M1.6, M1/hecke-action §M1.13, M2/unitary-deformation §M2.12, M2/representability §M2.8, M2/isogeny-kernel-ranks §M2.14, M3/hermitian-hom-space §M3.8, M4/canonical-model-identification §M4.3, M4/higher-level-normalization §§M4.5–M4.6, M4 CM moduli §M4.7 (p unramified only). AbelianSchemesAndArithmeticModuli: A4/etale-tate-module §A4.1, A4/abelian-h1-de-rham §A4.3, A4/grothendieck-messing §A4.7, A4/polarized-effectivity §A4.8, A4/serre-tate-equivalence §A4.9, A6 §§A6.1, A6.10–A6.12. AlgebraicModuliForArithmeticGeometry R09.1 is §1.3 (`grassmannSmoothness`, `coherentGrassmannian`). FiniteFlatGroups R07.1 is Layer R07.1 and R07.2 is Layer R07.2. ReductiveGroupsPartII RG2.3 is §RG2.3.5. ShimuraCompactifications C5 and Faltings R28.4 are the layers of those names. ShimuraVarieties and PadicHodgeTheory are mapped in R07.
- **Supplier order.** All cited roadmaps are on main or earlier in the merge order, except LubinTateFormalModulesAndQuasiCanonicalLifts (a board package job only), AdicSpacesPartII:R2 (does not exist) and PELModuliPartIII (nowhere). Gate output, verbatim:

      candidate: PELModuliPartII is not in the merge order yet; checked as if placed after PELModuli (the intake inserts it when its design is accepted)
      depcheck: 27 roadmaps, 230 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line. The placement is wrong for the reason in R06; with `*Needs:*` lines the gate reports placement after ShimuraCompactifications with 235 edges and 0 problems.
- **Ownership and duplication by object.** Searched main, the 330 open heads (`roadmaps grep`), the board packages and board job titles for unitary Rapoport–Zink spaces, Krämer, exotic and almost self-dual models, the RSZ datum, split Drinfeld levels, Landherr existence, finite-field Tate, Rapoport–Zink representability, formal quotients and basic uniformization. The overlaps are those of R03–R05. MotivesAndAlgebraicCycles §7.19 uses the almost-principally-polarized space only inside a premise. HilbertModularVarietiesAndShimuraCurves §R18.5.13 takes a basic PEL uniformization as a supplier contract. GeometricSatakeAndFusionPartII (board) treats rank-two unitary local models, a different object. No other owner of U0–U6, U8 or U9 was found, so this roadmap owns them.
- **Shape.** All 13 definitions and 29 constructions have at least three named checks, and every target has hypotheses (stated or inherited) and a locator. The README is in the explorer's design shape. The TauCetiRoadmap headings, prose targets and `*Needs:*` lines are package-stage work (R06, R09).
- **Lean.** Elaboration is not available: this lane does not elaborate, and the design has no Suggested.lean. Headlines and padding are package-stage questions; advisory in R09.

## Not verifiable

- Mih19 Definitions 2.7–2.11 and Appendix §§11–13. The text was fetched; I checked only that U6/eisenstein-condition's citation exists and did not re-derive the P(r,s) divisibility beyond the case K₀=K.
- Kraemer03, Howard19, LRZ26, LL21 and Rapoport–Zink 2017: not in the sample and not fetched, so E1's appeal to Howard19 §2 and U5/kramer-local-charts' (4.11) are unchecked.
- Zhang21's published Annals pagination: I read arXiv v3, where section and equation numbers match the design but page numbers cannot be compared.
- RZ96 is an image-only scan. I read Theorems 6.27–6.30 (pp. 292–294) from page images, and the OCR text (RZ96 line 8959–8965) agrees.
- The LubinTateFormalModulesAndQuasiCanonicalLifts design text (no copy on the board) and E7 (LTXZZ22 Remark 4.2.5), which was not rechecked.

## Source issues

- **Misprint** in LZ22 at §13.4, item (3), printed p. 82: the source says the global isogeny α has degree q_{v₀} while α*λ♯=λ×u₀λ₀; it should be v₀-primary degree q², times any away-from-p factor; affects nothing.
- **Misprint** in HLSY23 at §1 (introduction), printed p. 2: the source says the Krämer filtration has rank one; it should be rank n−1, as Definition 2.2(3) states; affects nothing.
- **Gap** in HLSY23 at Definition 2.2(2), printed p. 10: the source says only that the framing is a height-zero O_F-linear quasi-isogeny, with no polarization condition; it should be required to carry the framing polarization to an O_{F₀}^×-multiple of the object's polarization; affects nothing.
- **Misprint** in LL22 at §4.5, printed p. 66: the source says the exotic conditions at u and the other ramified places hold for the CM factor A₀; it should be A, since A₀ has height 2f; affects nothing.
- **Gap** in LL22 at Lemma 2.4 and footnote 8, printed p. 10: the source says the space has two connected components over every base field, citing a proof only for ℚ_p; it should be proved for every base field by extending Wu's argument; affects a stated result.
- **Misprint** in LTXZZ22 at Definition 4.2.2, published p. 160: the source says the Hecke double cosets lie in the unitary group over the adeles of F; it should be the adeles of F⁺; affects nothing.
- **Gap** in LTXZZ22 at Theorem 4.2.3, published p. 161: the source says the model is projective exactly when its generic fibre is, but the proof covers only representability and tangent spaces; it should be supported by an integral properness argument; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d4bb48d", "job": "REV-DESIGN-PELModuliPartII", "model": "opus", "worker": "fable-rev19"} -->
