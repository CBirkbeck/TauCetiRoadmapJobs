# Review of ShimuraVarietiesPartII (pull request #2463 at 65db2be)

**Verdict:** needs changes

## R01 (P3) — §1.1 cites a passage whose standing hypotheses the statement drops

**Location:** `TauCetiRoadmap/ShimuraVarietiesPartII/README.md:351–353`: "choose a lift over O_K … and the prescribed smooth full-fixer integral tensor stabilizer … (KZ, §4.1.7, pp.30–31, especially (4.1.7.1))."

**Claim:** §1.1 is stated for the full fixer G^fix with no goodness hypothesis, and §§1.4 and 1.7 use it when G^fix≠G°. KZ §4.1.7 stands under KZ §4.1.3 (A′) G^fix=G° and (B′) a good embedding, so the locator covers only that case.

**Witness:** KZ lines 1272–1275: (A′) and (B′) hold "for the rest of §4.1". The full-stabilizer statement is KZ Proposition 3.3.2, p.25 (KZ lines 1075–1087); KPZ lines 3220–3226 apply it at a Shimura point with a stabilizer that need not be connected.

**Repair:** Replace the locator by: "(KZ, Proposition 3.3.2, p.25, for the full stabilizer of the tensors; KZ §4.1.7, pp.30–31, especially (4.1.7.1), at a point of the model when G^fix=G°; KPZ, proof of Theorem 7.1.3, p.73, at a point of the model when G^fix is not connected)."

## Previous findings

- R01 — repaired: "take the cover of gap:hodge-cover-refinement with K=F·k, where k is an imaginary quadratic field in which p splits … Hence E⊂E^ad·k and E E_2⊂E_2·k". Recomputed in the table below.
- R03 — not repaired: deferred (D01)

## Deferred findings

- D01 — stands
- D02 — stands

## Verified sound

| Statement | Instances tried | Roadmap side | Source / computed side | Result |
|---|---|---|---|---|
| §2.2 sketch (previous R01) | F: x³−4x+1, p=7, I_c={v₁,v₂}, k=Q(√−3), T={(v₁,ε),(v₂,ε)} | E⊂E^ad·k; every prime of E^ad above 7 splits in E | Stab(T)={1,((12),1)} contains each D∩Gal(Q̄/E^ad): ⟨(12)⟩, 1, 1; (−3/7)=1 | agrees |
| §2.2, T meets the gap's condition | any F, K=F·k, p split in k | every decomposition group at p fixes k, so preserves T when it preserves I_c | Hom(K,ℂ)=Hom(F,ℂ)×Hom(k,ℂ); k⊗Q_p=Q_p², so K⊗Q_p=(F⊗Q_p)²: primes of F split | agrees |
| Correction bullet, `README.md:1489` | same F, T={(v₁,ε),(v₂,ε̄)} | degree-1 prime of E^ad inert in E | x³−4x+1≡(x−4)(x²+4x+5) mod 7; disc 229; Stab(T)={1,((12),c)}, D∩Stab(T)=1, local degree 2 | agrees; KP lines 3450–3458 |
| §0.2 (sample) | K_1^p=K^p neat | quotient by the trivial group returns S_K | KZ lines 1248–1250 and 1299–1303: quotient of a neat normal level by the finite group K^p/K_1^p | agrees |
| §1.1 (sample) | G^fix≠G° (used in §§1.4, 1.7) | stated for the full fixer, cites KZ §4.1.7 | KZ lines 1272–1275: (A′) G^fix=G°, (B′) good; KZ line 1083 and KPZ lines 3220–3226 cover the full stabilizer | finding R01 |
| §1.9 (sample) | nodal curve; Γ₀(p) crossing | strictly local components normal; global normality only for G^fix=G° | KP lines 130–134; node: two regular branches, one non-normal component; k[[u,v]]/(uv) has 2 components | agrees |
| §3.3 (sample) | GL₂ hyperspecial | finite étale; splits over an unramified extension at small level | KPZ lines 3294–3297 under (A)–(D); KP lines 2805–2807; torsor group K_p/K_p°=1 for GL₂(Z_p) | agrees |
| §3.4 (sample) | γ=diag(ℓ,1), K_ℓ=GL₂(Z_ℓ) | transported level is γK^pγ⁻¹ | γ[[1,0],[1,1]]γ⁻¹=[[1,0],[ℓ⁻¹,1]]∉GL₂(Z_ℓ); KP lines 3011–3046 | agrees |
| §4.4 (sample) | modular curve | S_≤[b] closed; closure inside smaller strata, no equality | HT lines 885–906; supersingular locus finite hence closed; (1/2,1/2)≤(0,1) | agrees |
| §4.11 (sample) | g₂=−g₁; scalars p⁻¹, ℓ⁻¹ | same image in I_x(Z_(p))\G(A_f^p); one direction only | HT lines 989–1009, 1038–1041; [n]=[p]∘f forces n^(2d)=p^(2d)·deg f, impossible for p∤n | agrees |
| §4.12 (sample) | E: y²=x³−x over F₃; y²=x³+x over F₅ | rank I_x=rank G | K17 lines 1381–1394; HT lines 1036–1047; I=B^× rank 2; I=Q(i)^× rank 2; rank GL₂=2 | agrees |
| §4.13, HT Corollary 2.1.9 (headline) | E: y²=x³−x over F₃, m=1, 2 | I_x,Qℓ=Z_G(γ_ℓ^m) for divisible m | π²=−3: dim Z(γ²)=4=dim B^×; dim Z(γ)=2≠4, so m=1 fails; HT lines 1095–1105 | agrees |
| §5.4 (sample; density headline) | T=Res_(Q(i)/Q)G_m, p=5; lattice f₁=e₁+e₂/5, f₂=e₂ | Siegel map needs G^fix-stable self-dual lattice; ordinary locus dense | #E(F₅)=1+0+1+1+0+1=4, trace 2; t=(1,2): tf₁=f₁+f₂/5 outside; KZ lines 1751–1769, 1887–1896 | agrees |
| §5.9, KZ Theorem 4.4.6 (sample, headline) | torus point y²=x³+x over F₅ | special lift carrying I_x(Q) in the isogeny category | KZ lines 1900–1903; I_x=T, the CM curve over Z_5 lifts all of Q(i)^× | agrees |
| §5.10, KZ Corollary 4.4.13 (headline) | same point | γ_0∈G(Q), exact q-Frobenius, elliptic over R | γ_0=(1∓2i)/5: T²−(2/5)T+1/5, discriminant −16/25<0; KZ line 2038 | agrees |
| §6.1 (sample) | split GU(1,1), hyperspecial | index set λ≤μ_h; strata descend over Frobenius-orbit fields | KZ lines 2130–2166; minuscule μ: one index, yet two Newton classes (slopes (0,1), (1/2,1/2)) | agrees |
| §6.2 (sample) | connected group; constant Z/2 | F_q-point of the fibre by Lang | KZ lines 2333–2335; H¹(F_q,connected smooth)=1, H¹(F_q,Z/2)=Z/2 | agrees |
| §6.3, KZ Corollary 5.2.7 (headline) | marked point of degree 2 | residue field stays F_q | KZ lines 2322–2351; degree 2 would give T²+(6/25)T+1/25 instead of T²−(2/5)T+1/5 | agrees |
| §7.1 (sample) | GU(1,1), K^p cut out by χ₃(ν(k₃))χ₇(ν(k₇))=1 | K_ℓ is the image of K^p, not the intersection | ν(G(Z₃))=Z₃^×, so K₃=G(Z₃); K^p∩G(Q₃) has index 2; KZ lines 2068–2079 assume a product level | agrees |
| §7.2 (sample) | g=diag(1,1/5); torus point over F₅, F₂₅ | det(T−g); geometric Frobenius on H₁ | T²−(6/5)T+1/5; (2/5,1/5); ((1∓2i)/5)²=(−3∓4i)/25: (−6/25,1/25); KZ lines 2091–2100 | agrees |
| §7.6, KZ Theorem 5.1.4 (sample, headline) | torus point; ℓ-adic unit check | unique γ_y∈Conj(G)(Q) mapping to γ_(y,ℓ) for all ℓ≠p | KZ lines 2104–2106, 2428–2439; Conj(T)=T, γ_y=(1∓2i)/5∈Q(i)^×; uniqueness since Conj(G)(Q)⊂Conj(G)(Q_ℓ) | agrees |
| §3.8, KPZ Theorem 7.2.21 (headline) | GU(1,1) of Q(i), p=5, K_2^p∋i | quotient stack at non-small level has inertia Z/4 | KPZ lines 3735–3763; i·ī=1, i∈G(Z_ℓ) all ℓ, i^k∉K_1^p for k=1,2,3 | agrees |
| Conventions, Frobenius norms | ζ of order 24 in W(F₂₅); E/F₅ over F₂₅ | group norm ζ⁶ on V, ζ¹⁸ on D | ζ·ζ⁵=ζ⁶; ζ⁻¹·ζ⁻⁵=ζ¹⁸; ratio ζ¹²=−1; trace 2²−2·5=−6 | agrees |
| Conventions, neat Siegel levels | N=3,4,6; element −1 at 7 | principal level N≥3 is neat; no level is torsion-free | ℓ^k∥N with ℓ^k≥3 exists; v(ζ−1)≤1/(ℓ−1)<k unless ℓ^k=2 | agrees |
| gap:rg3-cyclic-torus-and-neatness | γ for y²=x³−x over F₃; n=0,1,2 | closure of ⟨γⁿ⟩ is S° for e\|n, n>0 | e=2; ⟨γ²⟩=⟨−1/3⟩ has closure G_m=S°; n=1: two components; n=0: centralizer GL₂ | agrees |
| gap:multiplier-exact-sequences | GSp_(2g); GU(1,1); GU(1,1)×_c GU(1,1) | 1→Z^c→Z→G_m→1 | μ₂→G_m→G_m (squaring); U(1)→Res G_m→G_m (norm); ranks 2+1=3 | agrees |
| gap:open-curve-companions | constant sheaf on A¹/F₅, Frobenius 3, ℓ=2, ℓ′=3 | p-plain hypothesis needed | 3 is a 2-adic unit and not a 3-adic unit; supplier §6.2 states the irreducible case only | agrees; minimal |
| §1.7 Checks | blow-up at a supersingular point; Λ with Λ^∨/Λ≅(Z/p²)² | (d) fails; stabilizer not quasi-parahoric | chart W[t,v]/(tv−p), special fibre a node; (GL₂×GL₂)^(det) and a Borel of GSp₄ both have dimension 7 | agrees |

- Source locators checked against the text: 56 (KZ 23, HT 12, KPZ 13, KP 6, K17 2), for the 15 sampled targets and §§0.1, 0.5, 1.4–1.6, 1.8, 2.1, 2.2, 2.6, 3.9, 4.2, 4.5, 4.7, 4.9, 4.13, 5.2, 5.3, 5.10, 7.3–7.5. All agree except R01.
- Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d): 13, each at the file and line the README gives (`WittVector.Isocrystal` at Isocrystal.lean:112 through `ComoduleAlgebra.coinvariants` at ComoduleAlgebra.lean:136). The only `ComoduleAlgebra` instance on a Hopf algebra itself is `instSelf` (ComoduleAlgebra.lean:183), comultiplication and not conjugation, as the README says.
- Cross-roadmap citations resolved at main or at the open heads: every cited section of the 28 suppliers by heading, and by text for ArithmeticGaloisRepresentations §1.11 (*Reductive quotients over fields and DVRs*), ReductiveGroupsPartIII §§1.2, 3.5, 5.3a, 5.5, ShimuraVarieties §8.2, ShimuraData §4.2, ShimuraCompactifications §7.18, GlobalShtukasAndFunctionFieldLanglands §§6.1–6.2, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§4.3–4.4.
- Declared gaps: 22 over 10 suppliers, as the description counts. None asks for what its supplier has: ReductiveGroupsPartII's scope places R-smooth tori, the R-smooth central extension and the R-smooth fixer immersion outside it; ReductiveGroupsPartIII, HeckeStacksAndLocalShtukas and ShimuraVarieties have no R-smooth, quasi-parahoric or Blasius–Wintenberger statement.
- Gate at 65db2be: every check 0 (OK). Dependency check: `depcheck: 260 roadmaps, 2594 edges, 0 problem(s)`. No file outside the folder changes.
- `lake env lean` on `Suggested.lean`: exit 0, no output. The file declares nothing, so there is no signature to `#check` and nothing for the one-tactic probe. Its docstring names the seven headlines of `README.md:15` with the carrier each lacks; no integral model, parahoric, stratum or conjugacy quotient exists at the pins.
- Description read against the head: adds the folder (1545 lines); 28 suppliers (9 on main, 19 open), 22 gaps and 7 headlines all match.
- Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, PELModuliPartII, ReductiveGroupsPartII, AbelianSchemesAndArithmeticModuli (the third list is empty); nothing shared. Goodness, very-goodness and adapted deformations: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII. Local models and their Schubert strata: GeometricSatakeAndFusionPartII. Conj′ and the abelian-variety application: ReductiveGroupsPartIII. B(G): BunGAndNewtonStrata. PELModuliPartII owns unitary formal moduli. Models, strata and Frobenius classes on Shimura varieties: here.

Source independence: 12 passages compared with 5 sources (KZ, HT, KPZ, KP, K17), none shared beyond what the mathematics forces; largest share KZ, 72 of 228 locators; contents compared with KZ: independent (Layers 0–4 rest on HT, KP, KPZ and the shtuka papers; Layers 5, 6, 7 regroup KZ §§4.3–4.4, 5.2 and 5.1 with 5.3, in the order §7.4's *Needs:* §5.10 and §6.3 forces).

Research link: §7.6 is Kisin–Zhou's ℓ-independence for Shimura varieties (KZ Theorem 5.1.4, 2024 preprint, Annals 2025), input to their abelian-variety theorem; §3.8 is Kisin–Pappas–Zhou's abelian-type models (KPZ Theorem 7.2.21, 2026); §1.7 is the canonical-model theory of Pappas–Rapoport (2024) and DvHKZ. Rests on the README Summary and on KZ and KPZ.

## Not verifiable

- Deligne 1979, 2.3.10 (the construction behind gap:hodge-cover-refinement): not in the sources cache; checked against KP lines 3439–3459 and KPZ lines 3392–3406.
- Noot 2009, Theorems 1.8 and 4.2 (gap:noot-coarse-comparison): not in the sources cache; checked against HT lines 1099–1105.
- Laumon–Moret-Bailly, Théorème 6.3 (gap:rational-stack-presentation): not in the sources cache, so its hypotheses on the diagonal were not compared with "an algebraic stack of finite type over F_q"; KZ lines 2341–2343 use it for a quotient stack.

## Source issues

- **Gap** in KP at the proof of Lemma 4.6.22, p.206: the source says that T, chosen stable under the elements of one decomposition group at p preserving I_c, makes every prime of E^ad above p split completely in E; it should take T stable under every decomposition group at p, for instance K=F·k with p split in k and T over one embedding of k; affects the proof.
- **Gap** in KPZ at the proof of Proposition 7.2.10, p.79: the source says that the choice of T taken from KP Lemma 4.6.22 makes every v_2|p of E_2 split in E·E_2; it should use a T stable under every decomposition group at p, as above; affects the proof.
- **Error** in KPZ at §7.2.3, p.77: the source says that in type A_n the field K_S is a CM extension of F; it should exclude n=1, where the first and last vertices coincide and K_S=F is totally real; affects nothing.

## For the human reviewers

- The fixer closed immersion of KZ Propositions 2.4.8 and 2.4.10 is asked of two suppliers: ReductiveGroupsPartIII §5.3a here (`README.md:121`) and ReductiveGroupsPartII in GeometricSatakeAndFusionPartII (gap:r-smooth-full-fixer-embeddings, its README line 78). ReductiveGroupsPartII's scope excludes it.
- This review's list of declared gaps gives gap:noot-coarse-comparison the supplier ArithmeticGaloisRepresentations Layer 6; `README.md:125` names ReductiveGroupsPartIII Layer 5. The listed needs of gap:hodge-cover-refinement and gap:component-specialization are also earlier texts than the README's.
- Two contracts ask ShimuraCompactifications Layer 7 for moduli it scopes out ("parahoric level … not constructed here", its README line 162): gap:siegel-chain-moduli here (`README.md:203`) and gap:bad-prime-projectivity in PELModuliPartII (its README line 368).
- gap:component-specialization (`README.md:205`) asks ShimuraCompactifications Layer 7, which is titled integral PEL compactifications, for a Hodge-type statement whose cited route is MP19 Theorem 1.
- KZ is cited in arXiv v2 pagination, not collated with Annals 202 (2025) (`README.md:1471`); K17 is read from the author's page and MP19 from arXiv v6.
