# Review of ShimuraVarietiesPartII (pull request #2463 at 53e61e3)

**Verdict:** needs changes

## R01 (P2) — gap:component-specialization is stated on this roadmap's own Layer 0 models

**Location:** `TauCetiRoadmap/ShimuraVarietiesPartII/README.md:205`: "For the normal Hodge models S_K of Layer 0 at neat tame level … prove that the special fibre of each connected integral component is geometrically irreducible, compatibly with specialization".

**Claim:** The contract asks ShimuraCompactifications, which comes earlier in the merge order, for a theorem about S_K. S_K is defined only in §0.1 here. To state the target, the supplier would have to cite this later roadmap or define S_K a second time, which creates a cycle. "Compatibly with specialization" names no statement.

**Witness:** `board/merge-order/ORDER.txt` puts ShimuraCompactifications at line 175 and ShimuraVarietiesPartII at line 393. S_K is defined at `README.md:219` (§0.1). ShimuraCompactifications' scope says it does not construct parahoric-level moduli interpretations.

**Repair:** Replace the sentence after the slug with: "Let (G,X) be of Hodge type with a Hodge embedding into (GSp(V),S^±), p>2, and N a normal scheme, flat and finite over the Siegel model of PELModuli §§M6.1–M6.4 or of gap:siegel-chain-moduli at a neat level over O_(E,v), with generic fibre Sh_K(G,X)⊗E. If the geometric special fibre of N is locally integral, prove that every connected component of N⊗O_Ĕ has irreducible special fibre (as used in the proof of HT Corollary 1.3.16, p.20)." §§4.7 and 5.4 then apply it with N=S_K. On the hyperspecial modular curve, N is the smooth model and every connected component has irreducible special fibre.

## R02 (P2) — gap:hodge-cover-refinement states no conclusion and bundles three requests

**Location:** `README.md:69`: "Refine the Hodge-type witness (ShimuraVarieties §P.1) of an abelian-type datum by the fundamental type-A and quaternionic-D representations and a CM scalar field split at all prescribed p-places, with Hodge cocharacters in the identity component of the matched-multiplier group".

**Claim:** "Refine … by" does not say what is to be proved. The sentence combines three requests: the vertex choice, the CM field, and the factorization through a fibre product. "Matched-multiplier group" is defined only in §5.2 here, and §5.2 proves that factorization itself.

**Witness:** KPZ lines 3394–3416 (§7.2.3) produce a Hodge-type datum with G^der=Res_(F/Q)H^♯ and a Hodge embedding on W⊗_F K. `README.md:1129` (§5.2): "check the Hodge homomorphism factors through the identity component".

**Repair:** Replace the sentence after the slug with: "Let (G₂,X₂) be of abelian type with G₂^ad≅Res_(F/Q)H, H absolutely simple over a totally real F. Let S be the vertex set of KPZ §7.2.3: both extreme vertices at every real place in type A, the first vertex in type D^H, Deligne's maximal choice otherwise. Let W be the Q-representation of G₂^sc attached to S, and K a CM extension of F, disjoint from K_S, in which every prime of F above p splits. Prove that Deligne's construction on V=W⊗_F K gives a Shimura datum (G,X) of Hodge type with G^der=Res_(F/Q)H^♯, an isomorphism (G^ad,X^ad)≅(G₂^ad,X₂^ad) and a Hodge embedding (G,X)→(GSp(V),S^±) (KPZ §§7.2.2–7.2.3, pp.77–78)." Delete the matched-multiplier clause.

## R03 (P2) — gap:noot-coarse-comparison does not say what is to be proved

**Location:** `README.md:187`: "For the tensor Hodge realization of an abelian special fibre, after an extension defining its geometric endomorphisms and a neat Frobenius power with sufficiently divisible positive exponent, supply equality and rationality of its Conj′ classes at all realizations as used in HT Corollary 2.1.9".

**Claim:** The sentence names no group whose Conj′ is meant. It names no tensors or characteristic-zero lift for Noot's theorem to run on, and no list of realizations. "Tensor Hodge realization" is not standard vocabulary, so ArithmeticGaloisRepresentations Layer 6 cannot state the target from it.

**Witness:** HT lines 1099–1103: the Conj′(G) images of the Frobenius realizations γ_(m,ℓ), with ℓ=p read in G(Q_(q^m)), and of γ_(m,ℓ0) lie in Conj′(G)(Q) and are equal, for m with γ_m neat (Noot, Theorems 1.8 and 4.2).

**Repair:** Replace the sentence after the slug with: "Let A be an abelian variety over a number field F with good reduction at a place v|p with residue field F_q. Let (s_α) be absolute Hodge tensors on H₁(A_ℂ,Q) whose stabilizer G is connected reductive, with F large enough that every ℓ-adic representation lands in G(Q_ℓ). Let γ be the q-Frobenius at v, with realizations γ_ℓ∈G(Q_ℓ) for ℓ≠p and γ_p∈G(Q_(q^m)) in a crystalline tensor frame. For every m≥1 with γ^m neat (HT §2.1.8, p.24), prove that the images of the γ^m_ℓ, ℓ≠p, and of γ^m_p in Conj′(G) lie in Conj′(G)(Q) and coincide (Noot, Theorems 1.8 and 4.2, as used in HT Corollary 2.1.9, p.24)." §4.13 lifts x to a point of S_K over a number field and applies it there.

## R04 (P3) — the three Checks of §2.3 only restate the construction's hypotheses

**Location:** `README.md:575–577`: "For a split type-A local datum the non-exceptional path is available." … "A perfect alternating form on the enlarged lattice must identify Λ with its dual; an arbitrary integral lattice fails."

**Claim:** No Check computes an invariant of the constructed cover or excludes a wrong cover. Each one repeats a hypothesis: non-exceptional type, or self-duality of the lattice.

**Witness:** For (PGL₂,ℋ^±), GL₂ is a Hodge cover with G_der=SL₂. It has every listed property except one: its Z^c_G=μ₂ is not a torus. None of the three Checks detects this.

**Repair:** Replace the first and third bullets with:
- "For the target (PGL₂,ℋ^±) at p=5, GU(1,1) of Q(i) with the self-dual lattice Z[i]²⊗Z₅ has every listed property. G_der≅SL₂=H^♯ with π₁=1. Z_G=Res_(Q(i)/Q)G_m is an R-smooth torus split at 5. Z^c_G=U(1)≅G_m over Q₅ is quasi-tame. X_*(Z^c_G/Z_(G_der))_I=X_*(U(1)/μ₂)≅Z is torsion-free. The reflex field is Q."
- "GL₂, also a Hodge cover of (PGL₂,ℋ^±) with G_der=SL₂, is not an output: its compact central subtorus is trivial, so Z^c_G=μ₂ is not a torus."

## R05 (P3) — the description repeats its summary block and leaves the second copy unclosed

**Location:** In the pull-request description, a second `<!-- roadmap-summary -->` marker opens "**What this roadmap builds.** It takes the canonical generic tower of ShimuraVarieties to integral models…" and is never closed. The first block also says: "It follows Kisin–Pappas–Zhou and Kisin–Zhou with published corrections".

**Claim:** There are two summary blocks, and the second has no closing marker. The first block describes the plan as following its sources. The head's layer order is set by the *Needs:* lines (§§5.10 and 6.3 before §7.4), not by the sources.

**Witness:** In the description, the opening marker `<!-- roadmap-summary -->` appears twice and the closing marker `<!-- /roadmap-summary -->` once.

**Repair:** Delete the second paragraph and its marker. In the first block, replace "It follows Kisin–Pappas–Zhou and Kisin–Zhou with published corrections:" with "Its end theorems are those of Kisin–Pappas–Zhou and Kisin–Zhou, stated with the published corrections:".

## R06 (P3) — the description's Dependencies and Validation sentences do not match the head

**Location:** Description: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them)." and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** No dependency list follows the first sentence. The description never mentions the 22 supplier gaps that the head declares on 11 roadmaps. `Suggested.lean` declares nothing, so the build emits no `sorry` warning.

**Witness:** `## Exact supplier contracts` has 28 roadmap subsections and 22 "What … must provide (gap:…)" paragraphs. `lake env lean` on `Suggested.lean` exits 0 and prints nothing.

**Repair:** After "Dependencies", list the 28 supplier roadmaps and add: "It declares 22 supplier gaps: ReductiveGroupsPartIII (6), ShimuraData (4), HeckeStacksAndLocalShtukas (2), CrystallineCohomology (2), ShimuraCompactifications (2), and one each on GeometricSatakeAndFusionPartII, GlobalShtukasAndFunctionFieldLanglands, ArithmeticGaloisRepresentations, AlgebraicModuliForArithmeticGeometry, ShimuraVarieties and ReductiveGroupsPartII." Replace the validation clause with "the targeted Lake build succeeds with no warnings (the file declares nothing)".

## Verified sound

| Statement | Instances tried | Roadmap side | Source / computed side | Result |
|---|---|---|---|---|
| 1.1 Pointwise Hodge comparison | lift over finite K/Q̆_p | integral tensors in D, frame, filtration by a conjugate of μ_h⁻¹ | KZ lines 1331–1355; Prop 3.3.2 at line 1083 | agrees |
| 1.5 Same-field henselization | Iwahori with G^fix≠G° (PGL₂ edge, index 2) | requires G^fix=G°, y∈M_loc(k′) | KPZ line 3204, Thm 7.1.3(3): same hypothesis | agrees |
| 1.8 Strict comparison | GSp₄ Siegel Iwahori chain | strict henselizations only; no (B), no very good | KPZ lines 3254–3269, Thm 7.1.8 and proof | agrees |
| 2.2 Reflex splitting | E₂=Q; cover Q(i) at p=5, p=3 | every v₂ splits in EE₂ | KPZ line 3675; 5 split (Q₅), 3 inert (Q₉) | agrees |
| 2.5 Cover for every abelian type | PGL₁(D), index 3, at p=3 | (1)–(4) plus torsion-free clause | KPZ lines 3669–3683; D excluded from clause | agrees |
| 3.4 Twisting action | γ=diag(ℓ,1) | transported level γK^pγ⁻¹ | KP Lemma 4.5.4 (line 2973); γ[[1,0],[1,1]]γ⁻¹=[[1,0],[ℓ⁻¹,1]]∉GL₂(Z_ℓ) | agrees |
| 3.5 Component stabilizer | GL₂, principal level N | extension of Gal by A_int° | KP Lemma 4.6.6 (line 3179); (Z/N)^×, Q(ζ_N); level ker(GL₂(Z_p)→GL₂(F_p)) gives Q(ζ_Np) | agrees |
| 3.8 Abelian-type models | GU(1,1) of Q(i), p=5 | finite étale tower, DVR bijection, local model | KPZ Thm 7.2.21 (lines 3735–3758); i has multiplier 1, inertia order 4 | agrees |
| 4.4 Newton closure | modular curve | closed S_≤[b]; closure ⊂ lower strata | HT (1.3.14.1), (1.3.14.3), lines 885–901; κ=−1 for both classes | agrees |
| 4.10 Rosati compactness | supersingular E | I(R)/scalars compact | HT §2.1.3 (lines 969–981), K17 line 1390; I(R)/R^×≅SO(3), I(R)=ℍ^× not compact | agrees |
| 4.13 Tate comparison | E: y²=x³+x over F₅ | I_x,Qℓ≅Z_G(γ_ℓ) for every ℓ | HT Cor 2.1.9 (lines 1095–1105); Q(i)^× of dimension 2 on both sides | agrees |
| 5.9 Ordinary special lifts | CM torus T at p=5 | lift with the I_x(Q)-action | KZ Thm 4.4.6 (line 1900), proof §4.4.11 (lines 1994–2031) | agrees |
| 6.1 KR strata | GU(1,1), split at 5 | Adm={t^λ: λ⋞μ}; strata defined over the orbit field | KZ lines 2141–2166; one KR stratum versus two Newton strata | agrees |
| 6.3 Same-field curves | marked point of degree 2 | c∈C(F_q) | KZ Cor 5.2.7 (lines 2322–2351), Prop 5.3.5 (lines 2411–2418); T²+(6/25)T+1/25≠T²−(2/5)T+1/5 | agrees |
| 7.5 Common algebraic class | SL₂(R) rotations by ±π/2 | all characters; finite Conj map | KZ §5.3.2 (lines 2370–2374), §5.3.6 (lines 2429–2432); trace 0 for both, no SL₂(R) conjugator | agrees |
| 7.6 Headline KZ 5.1.4 | torus point of y²=x³+x over F₅ | unique γ_y∈Conj(G)(Q) | KZ lines 2104–2106; Conj(GL₂) image (2/5,1/5), over F₂₅ (−6/25,1/25) | agrees; uniqueness from Q⊂Q_ℓ |
| 5.10 Headline KZ Cor 4.4.13 | same torus point | γ₀∈G(Q), elliptic | KZ lines 2038–2050; γ₀=(1∓2i)/5, T(R)/R^×=S¹ | agrees |
| 4.7 / 5.4 density | Γ₀(p): k[[u,v]]/(uv); hyperspecial curve | local integrality required | HT Cor 1.3.16 (line 915), KZ Thm 4.4.4 (line 1887); ordinary locus = complement of finitely many points | agrees |
| Conventions, Checks of §4.9 | E/F₅: points 1,0,1,1,0 | trace 2; T²−2T+5 | #E=4; over F₂₅ trace 2²−10=−6; ζσ(ζ)=ζ⁶; ζ⁻⁶=ζ¹⁸; ζ¹²=−1 | agrees |
| §0.1, §1.7 Checks | GSp₄ Iwahori, p=3; E: y²=x³−x | P¹ of lines in ker F | #E(F₃)=4, trace 0; stabilizer has dim 7 = dim Borel(GSp₄), not solvable | agrees |
| §1.6 remark | y²=x³+p, p≥5 | additive reduction | c₄=0, v_p(Δ)=v_p(−16·27·p²)=2 | agrees |
| §3.1, §3.6 Checks | GL₂; w=[[0,1],[p,0]] | closure of GL₂(Z_(p))_+; w normalizes I | det quotient ∏Z_ℓ^×; w·[[a,b],[c,d]]·w⁻¹=[[d,c/p],[pb,a]] | agrees |
| §5.3, §5.4 Checks | Q(√2), Q(√−2), Q(i), Q(√−11) at 5; lattice f₁=e₁+e₂/5 | splitting behaviour; lattice not stable | 2, −2 non-squares mod 5; −1, −11 squares; Gram det u²; t=(1,2) sends f₁ outside | agrees |
| §7.1 Check | K^p cut out by χ₃χ₇ | not a product at 3 | K₃=G(Z₃); K^p∩G(Q₃) has index 2 | agrees |
| R04 §2.3 | GU(1,1) of Q(i) versus GL₂ for PGL₂ | none of the three Checks separates them | Z^c=U(1) (torus) versus μ₂ (not a torus) | finding |
| R01–R03 gaps | supplier order; KPZ §7.2.3; HT p.24 | needs text | ORDER lines 175/393; KPZ lines 3394–3416; HT lines 1099–1103 | findings |

- Source items read against the README's locators: about 100 (KZ 40, KPZ 28, HT 20, KP 14, K17 1). All 15 sampled targets match their theorem, page and hypotheses.
- Library declarations opened at the pins (13): `WittVector.Isocrystal` (`Isocrystal.lean:112`; the field is `frob`; `IsDomain`, `PerfectRing` hypotheses), `AbelianVariety` (`Basic.lean:95`), `AbelianVariety.End` (`End/Basic.lean:74`), `Matrix.transpose_mul_J_mul_eq_det_smul` (`SymplecticMultiplier.lean:63`), `reductiveCommHopfAlgProperty` (`Reductive/Basic.lean:71`), and `conjugationAlgHom` with its four laws (`Hopf/Conjugation.lean:66,107,176,196,248`).
- Further declarations at the pins: `reductiveCommHopfAlgProperty.linearlyReductive` (`CompleteReducibility.lean:96`), `finiteType_coinvariants` (`LinearlyReductive.lean:148`) and `coinvariants` (`ComoduleAlgebra.lean:136`). Only conjugation by a diagonalizable D(X) is registered as a comodule algebra (`BialgHom.conjugationComoduleAlgebra`, `Centralizer/Smooth.lean:208`), so the docstring's account of the missing conjugacy quotient holds.
- Cross-roadmap citations resolved: 28 supplier roadmaps (9 on main, 19 at their open heads), about 75 section citations, all present with the stated content. AGR §1.11's named target *Reductive quotients over fields and DVRs* supplies Conj_H and its geometric points. The 22 gap slugs appear in both `design/plan.json` and the README.
- Gap minimality: ReductiveGroupsPartII puts R-smoothness and KZ Prop 2.4.10/2.4.13 out of its scope (README lines 86–98), so the six ReductiveGroupsPartIII gaps ask for nothing already provided. ShimuraVarieties §7.0i has no p-adic comparison. The stable-centralizer statement was checked: for e|n, the n-torsion of the eigenvalue group equals its torsion, so the closure of ⟨γⁿ⟩ is S°.
- Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, PELModuliPartII, ReductiveGroupsPartII, AbelianSchemesAndArithmeticModuli; nothing shared. Integral Shimura models, canonical models and KZ §§4–5 are owned only here. The roadmap imports local models (GeometricSatakeAndFusionPartII), tensor-display deformations (FiniteFlatGroups Part II), KZ §6 and Conj′ (ReductiveGroupsPartIII), and B(G) with ordinary classes (BunGAndNewtonStrata). `roadmaps grep` finds no other owner of canonical integral models or Hodge-type Newton strata.
- Gate at 53e61e3: every check is 0 (OK). Depcheck output: `depcheck: 261 roadmaps, 2598 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: exit 0, no output. There are no declarations to pass to `#check`, and the file is one module docstring with `public import Mathlib`, the form used by 63 roadmaps on main.
- Headlines: KZ 5.1.4, 4.4.6, 4.4.13, 5.2.7; KPZ 7.2.21; HT 2.1.9, 1.3.16. None is statable at the pins because integral Shimura models are missing. All seven are named in the docstring. There is no padding.

Source independence: 26 passages compared with 5 sources (KZ, KPZ, HT, KP, K17); none shared beyond forced statements of under a dozen words. Largest share: KZ, 75 of 222 locators. Contents compared with KZ §§2–6: independent. Layers 0–4 draw on KPZ §7, KP §4 and HT §§1–2. The order 5→6→7 is forced by the *Needs:* lines of §§6.3 and 7.4.

Research link: §7.6 is Kisin–Zhou's ℓ-independence of Frobenius classes on Shimura varieties (KZ Theorem 5.1.4, Annals 2025), the input to their abelian-variety theorem (KZ §6). §3.8 is Kisin–Pappas–Zhou's abelian-type integral models (KPZ Theorem 7.2.21, 2026), and §1.7 is the canonical-model theory of Pappas–Rapoport and DvHKZ. This rests on the README Summary and on KZ and KPZ.

## Not verifiable

- Noot 2009, Theorems 1.8 and 4.2 (cited in R03): not in the sources cache. Its content was taken from HT p.24, lines 1102–1103.
- Madapusi Pera 2019, Corollary 4.1.11 (cited in R01): not in the sources cache. Its content was taken from HT p.20, line 917.
- Annals pagination of KZ: not compared; the README cites arXiv v2 pagination, as its References say.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), p.34: the source says the inertia coinvariants of X_*(G^ab) are torsion; it should be torsion-free, as Lemma 4.2.4 and the proof of Lemma 4.3.8, pp.34–41, use it; affects a stated result.
- **Error** in KZ at §5.1.3, p.47: the source says Conj_H(F) is the set of semisimple H(F)-conjugacy classes for any characteristic-zero F; that holds only for F algebraically closed, rational points being Galois-stable geometric classes; affects nothing.
- **Error** in HT at proof of Corollary 1.3.13, p.19: the source says the Tannakian category generated by D is equivalent to representations of the full tensor stabilizer; its group can be a proper subgroup, and restriction along it suffices; affects the proof.
- **Error** in KP at proof of Theorem 4.2.7, p.187: the source says the filtration map q_loc is a G-torsor; it is the smooth action map G×M^loc→M^loc; affects the proof; corrected in print at KPZ §7.3.1(1), p.85.
- **Gap** in KP at Theorem 4.2.7, pp.186–187: the source omits the very-good hypothesis on the integral Hodge embedding that smoothness of q and the henselization comparison need; it should assume it; affects a stated result; corrected in print at KPZ Remark 7.1.4(1), p.73.

## For the human reviewers

- Two contracts ask ShimuraCompactifications Layer 7 for lattice-chain moduli: gap:siegel-chain-moduli here (`README.md:203`) and gap:bad-prime-projectivity in the PELModuliPartII README. ShimuraCompactifications' scope says parahoric-level moduli interpretations are not constructed there.
- "Good integral Hodge embedding" (KPZ Definition 3.4.4) is stated both in FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1 and in GeometricSatakeAndFusionPartII §0.6. This README (Conventions, `README.md:21` and `:99`) treats them as one notion.
- KPZ was read from the open-access Cambridge publisher PDF and K17 from the author's page. KZ is cited in arXiv v2 pagination, not collated with Annals 202 (2025).
