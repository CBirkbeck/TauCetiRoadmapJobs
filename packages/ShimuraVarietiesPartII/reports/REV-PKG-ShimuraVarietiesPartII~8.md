<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6901746259 -->
Review (claude) of ac7840a

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §7.1 does not define `K_ℓ`, and §7.6 drops the source's product-level hypothesis

   **Location.** `packages/ShimuraVarietiesPartII/README.md:1260` (§7.1): "refine the ℓ-component of the prime-to-p Shimura tower to obtain its pro-étale K_ℓ-cover, then extend structure group to G(Q_ℓ)". `README.md:1344` (§7.6): "let K^p be any prime-to-p level".

   **Claim.** The G(Q_ℓ)-local system L_ℓ, and so γ_(y,ℓ) and the end theorem, are defined at every prime-to-p level.

   **Witness.** KZ line 2068–2073 (§5.1.1, p.47) defines the cover only when K has the form K_ℓK^ℓ. For G=GL₂, p=7 and K^p={k∈GL₂(Ẑ^(7)): χ₃(det k₃)χ₅(det k₅)=1}, χ_ℓ the quadratic character of Z_ℓ^×, the image of K^p in GL₂(Q₃) is GL₂(Z₃) (index 1) and K^p∩GL₂(Q₃) is ker(χ₃∘det) (index 2). K^p is not a product at 3, and the README does not say which group K_ℓ is.

   **Exact repair.** The statement of §7.6 is true as written once the cover is defined, so keep it and fix §7.1. Replace the first sentence of the Construction of §7.1 by:

   > For ℓ≠p and any prime-to-p level K^p, let K_ℓ be the image of K^p under the projection G(A_f^p)→G(Q_ℓ), a compact open subgroup, and let K^(ℓ) be the kernel of K^p→K_ℓ. At neat level the prime-to-p tower over S_K is a pro-étale K^p-torsor (§0.3); its quotient by K^(ℓ) is a pro-étale K_ℓ-cover of S_K. Extend its structure group to G(Q_ℓ). When K^p=K_ℓK^ℓ is a product, this is the cover `lim_(K′_ℓ⊂K_ℓ) S_(K_pK′_ℓK^ℓ)` of KZ §5.1.1, which assumes that form.

   Add to the Checks of §7.1:

   > For G=GL₂, p=7 and K^p the index-two subgroup of GL₂(Ẑ^(7)) on which χ₃(det k₃)χ₅(det k₅)=1, with χ_ℓ the quadratic character of Z_ℓ^×, the image of K^p in GL₂(Q₃) is GL₂(Z₃), whereas K^p∩GL₂(Q₃) is the kernel of χ₃∘det, of index 2. The level is not a product at 3; the cover uses the image, and using the intersection would give a group that K^p does not surject onto.

   **Repair test.** On the witness, K_ℓ=GL₂(Z₃) and K^p/K^(3)≅GL₂(Z₃), so the quotient of the K^p-torsor is a GL₂(Z₃)-torsor. At neat level its extension to GL₂(Q₃) is Isom(V_Q₃,H₁(A)), which is the identification of §7.1 (KZ (5.1.1.1), KZ line 2077). For product K^p, K^(ℓ)=K^ℓ and the quotient is KZ's cover. The proof route of §§7.3–7.6 (ordinary lifts, same-field curves, companions) does not use the product form.

2. **F02** (P3) two `*Needs:*` lines omit a supplier that the target's own text uses

   **Location.** `packages/ShimuraVarietiesPartII/README.md:857–859` (§4.3): the proof sketch says "the family semicontinuity theorem of PadicDifferentialEquationsAndRigidCohomology §RD.3.43"; the line below is "*Needs:* §4.1; §4.2; BunGAndNewtonStrata §§1.22–1.26, 2.16." `README.md:665–669` (§3.4): "*Needs:* §3.1; §0.4; AbelianSchemesAndArithmeticModuli §§A6.28–A6.29; §0.1", while the first API bullet says "this agrees with the adjoint action of ShimuraVarieties §§6.3–6.6".

   **Claim.** Each `*Needs:*` line lists what the statement and its route use, item by item.

   **Witness.** A mechanical comparison of the supplier citations in each of the 63 targets with its `*Needs:*` line gives exactly these two omissions. §4.4 (`README.md:884`) and §3.1 (`README.md:611`) carry the same suppliers, and both layer `### Dependencies` lines already list them.

   **Exact repair.**

   1. §4.3: "*Needs:* §4.1; §4.2; §0.6; BunGAndNewtonStrata §§1.22–1.26, 2.16; PadicDifferentialEquationsAndRigidCohomology §RD.3.43."
   2. §3.4: "*Needs:* §3.1; §0.4; AbelianSchemesAndArithmeticModuli §§A6.28–A6.29; §0.1; ShimuraVarieties §§6.3–6.6."

   No change to the layer Dependencies, the supplier contracts or `design/plan.json`.

   **Repair test.** After the edit the same comparison finds no supplier named in a target's text that its `*Needs:*` line lacks. The dependency check is unaffected: both edges already exist at layer level and both suppliers are earlier in the merge order.

Two findings, both P3 (0 blocking). Both findings of round 7 are repaired, and the six further page ranges the repair changed are correct. The mathematics, the suppliers, the dependency direction, the manifest and the Lean file are otherwise clean. This review changed no authored file and fetched no source (`sources.toml` is unchanged; no `needs-references.toml` was created).

## Previous findings, verified first

| Finding (round 7) | Repaired passage | Status |
|---|---|---|
| F01 (P3), manifest `locator` fields omit cited locators | `sources.toml`, HT: "§1.1.3, hypothesis (1.1.3.1); Proposition 1.2.5; §§1.3–2.1; … §§2.2–2.3; Appendix A, Lemma A.4, Proposition A.6, Corollary A.7". KZ: "… Definition 2.2.4; Remark 2.2.5; … §6.2, Proposition 6.2.4 through Theorem 6.2.7". KP: "Corollary 0.3; Lemma 3.1.17; …". | **Repaired.** HT line 283–285 (p.7), HT line 648 (p.14), KZ line 437–443 (p.10), KP line 2011. I mapped every source mention in the README to its section (KZ 85, KPZ 57, HT 45, KP 18, K17 5) and every numbered item to a section prefix. Each is inside its entry's `locator` and `cited_for`. HT is not cited in Conventions, so dropping that `cited_for` entry is right. |
| F02 (P3), §4.13 page range | `README.md:1028`: "(HT, Corollary 2.1.9, p.24, with §2.1.8, p.24, for Conj′ and neatness)." | **Repaired.** HT line 1079–1094 (§2.1.8) and HT line 1095–1105 (Corollary 2.1.9) lie between the markers of p.24 (HT line 1070) and p.25 (HT line 1114). |

The repair also narrowed six more ranges. All six are correct:

| README | New locator | Lines read |
|---|---|---|
| §3.5 | KP §4.6.5, Lemmas 4.6.6, 4.6.9, pp.199–201 | KP line 3167 (journal p.199), 3179, 3242–3256; journal p.202 begins at KP line 3257 |
| §3.8 | KPZ Proposition 7.1.14, pp.75–76 | KPZ line 3317–3348; §7.2 begins at KPZ line 3349, p.76 |
| §§4.11, 4.12 | HT Proposition 2.1.6, p.23, setting §2.1.5, pp.22–23 | HT line 1036–1047; HT line 1011–1035 |
| §5.2 | KZ §4.3.7–Lemma 4.3.8, pp.40–41 | KZ line 1770–1803 |
| §5.3 | KZ Lemma 4.3.8, pp.40–41, and proof of Proposition 4.3.6, pp.41–42 | KZ line 1804–1848; the two integral maps are at KZ line 1834–1848 |
| §7.2 | KZ §5.1.2–5.1.3, p.47 | KZ line 2080–2101; p.48 begins at KZ line 2102 |

§5.4 still reads "§4.3.7–4.3.8, pp.40–42". That is correct: the proof of Proposition 4.3.6 carries the equation numbers (4.3.8.1)–(4.3.8.5) and ends on p.42. No finding of the last repair report was marked not actionable; nothing is re-raised.

## Verified sound

**Coverage.** The whole README was read (1386 lines; 63 numbered targets in 8 layers; 72 `*Needs:*` lines including the 8 layer lines; 26 Definition or Construction sections with 26 API lists and 27 Checks blocks, none with fewer than three Checks; every layer ends with Examples and Dependencies). `Suggested.lean`, `metadata.toml`, `sources.toml` and the `gaps` list of `design/plan.json` were read.

**Principles.** No route-specific shortcut (ramified primes, exceptional type A and D^H are kept), no re-planned roadmap, no computational algorithm, no sorry'd data, no `set_option`. Residue grep over the README (pull-request numbers, round labels, machine paths, HTML anchors, LaTeX delimiters, "optional", "deferred", "removed", "so far", `lemma` as a keyword): 0 hits; the one match of "lemma" is the prose "the unit-eigenvalue lemma" in §7.4.

**Seeded source sample: 15 of 15 read at their locators.** The author flags no locator as unverified.

| Target | Locator as read | Result |
|---|---|---|
| 0.2 | KZ §4.1.1, p.28 (KZ line 1228); §4.1.5, quotient stack by a neat normal subgroup, p.30 (KZ line 1299–1303) | supported |
| 0.5 | HT Proposition 1.3.7, pp.17–18 (HT line 774–807) | supported; independence is over lifts in the completed normalization (HT line 792–799), as the README says |
| 0.6 | HT Proposition 1.3.12, Corollary 1.3.13, p.19 (HT line 856–884); Lemma A.4, Proposition A.6, Corollary A.7, pp.38–39 (HT line 1746, 1757, 1794) | supported; the README's subgroup H is the correct reading of the proof (see Source issues) |
| 1.7 | KPZ Theorem 7.1.8, Remark 7.1.9(b), p.74 (KPZ line 3254–3274) | supported: canonical model, independent of embedding and lattice |
| 1.9 | KP Corollary 0.3, journal p.124 (KP line 130–134); KPZ Theorem 7.1.3(2) (KPZ line 3198–3203); KZ Theorem 4.4.4, p.43 (KZ line 1887–1896); KPZ Theorem 7.2.21(2) (KPZ line 3749–3750) | supported; the source's normality is for strict henselizations, as stated |
| 2.1 | KZ Definition 4.2.2, p.34 (KZ line 1481–1490); §4.2.1 for Z^c (KZ line 1476–1479) | supported |
| 2.2 | KPZ §§7.2.2–7.2.3, pp.77–78 (KPZ line 3380–3423; the CM field split above p at KPZ line 3406); Proposition 7.2.19(2), p.83 (KPZ line 3675) | supported |
| 3.10 | KZ Theorem 4.2.6(3), Remark 4.2.7(2), pp.35–36 (KZ line 1560–1580); KPZ Proposition 7.1.14(3) (KPZ line 3329–3337) | supported: connected reduction when G^fix=G° |
| 4.2 | HT Lemma 1.3.9, p.18 (HT line 818–820) | supported, for {μ_X⁻¹} |
| 4.3 | HT Theorem 1.3.14, pp.19–20 (HT line 885–906) | supported; nonemptiness needs (1.1.3.1), as stated |
| 4.10 | HT §2.1.3, p.21 (HT line 969–981); K17 Corollary 2.1.7, p.31 (K17 line 1381–1394) | supported: compact modulo the scalars, reductive |
| 5.6 | KZ Proposition 4.4.10, p.45 (KZ line 1973–1993) | supported |
| 6.2 | KZ proof of Corollary 5.2.7, pp.52–53 (KZ line 2333–2336) | supported: connected special fibre gives the F_q-frame |
| 7.2 | KZ §§5.1.2–5.1.3, p.47 (KZ line 2080–2101) | supported; the semisimple-class sentence is corrected in the README (see Source issues) |
| 7.6 | KZ Theorem 5.1.4, p.48 (KZ line 2104–2106); §5.3.6, p.55 (KZ line 2428–2439) | supported; uniqueness is added and true (injectivity on Q-points); level generality is R01 |

Also read: KP Lemmas 4.3.2, 4.3.5, Proposition 4.3.7, Corollary 4.3.9 (KP line 2760–2841, journal pp.189–191), Lemmas 4.5.2–4.5.9 (journal pp.194–197), Lemma 4.6.13, Corollaries 4.6.15, 4.6.18 (journal pp.202–205); KZ §4.2.8 (the A-groups, KZ line 1597–1608), §4.3.5–4.3.8, §4.4.2–4.4.6, Definition 2.2.4 and Remark 2.2.5; HT §§1.3.8–1.3.16, §§2.1.1–2.1.9; KPZ §§7.1.2–7.1.14, Theorem 7.2.21. All page ranges in §§3.1–3.7 agree with the journal pages.

**Adversarial table** (sampled targets, headlines, repaired passages, targets of the findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions, elliptic point | E: y²=x³+x over F₅ | x=0..4 give 1,0,1,1,0 affine points; #E=4; trace 2; H¹: T²−2T+5; H₁: T²−(2/5)T+1/5; over F₂₅ trace 4−10=−6 | keep |
| Conventions, norm | ζ of order 24, δ_D=ζ⁻¹ | δσ(δ)=ζ⁶; F_D²=ζ⁻⁶=ζ¹⁸; ratio ζ¹²=−1; framing degree 2 at E/F₅: trace 4/25−10/25=−6/25, det 1/25 | keep |
| 0.1 Check | GSp₄, p=3, A=E×E, E: y²=x³−x | 3 affine points, #E=4, trace 0; ker F=α_p², order-3 subgroups form P¹; fibre dimension ≥1 against 0 for a finite map | keep |
| 0.2 | K₁^p=K^p neat; −1 at non-neat GL₂ level | trivial quotient gives S_K; −1 fixes every point, inertia Z/2 ≠ coarse quotient | keep |
| 0.5, 0.6 | constant ordinary elliptic family | slopes (0,1); monodromy without Frobenius 1; with Frobenius the determinant 1(−1) has slope 1 ≠ 0, so H≠1 | keep |
| 1.7 | A¹ and its blow-up at (p,t) | same generic fibre A¹_Qp; special fibres with 1 and 2 components | keep |
| 1.8 | generality without (A)–(C) | Néron–Ogg–Shafarevich extends to the Siegel moduli; a DVR point lifts to the normalization because its generic point lies where the normalization is an isomorphism | holds |
| 1.9, G^fix=G° | Y a component, T=π⁻¹(Y) | π open with connected group fibres, so T irreducible; components of S̃_k are the connected components of q⁻¹(Z), Z a normal component, q smooth; T normal; T→Y smooth surjective, Y normal | holds |
| 1.9 | Γ₀(p) node; nodal cubic | k[[u,v]]/(uv): 2 regular branches; nodal cubic: 1 non-normal global component | keep |
| 2.1 | GU(1,1), p split; GSp_(2g) | Z^c=U(1)≅G_m at p, G_der=SL₂; Z^c=μ₂, dimension 0, not a torus | keep |
| 2.2 | G₂=GL₂ | E₂=Q, composite Q, 1 place of degree 1 | keep |
| 3.4 | γ=diag(ℓ,1) | γ[[a,b],[c,d]]γ⁻¹=[[a,ℓb],[c/ℓ,d]]; c=1 gives ℓ⁻¹∉Z_ℓ | keep |
| 3.10 | GU(1,1) curve; CM torus | 3+1=4, relative dimension 3; full group 5+1=6; torus: G_ad=1, relative dimension 0; H¹(F_q,Z/2)=Z/2 | keep |
| 4.2, 4.3 | GL₂, μ_h=(1,0); PGL₂ | diag(p⁻¹,1): slopes (0,−1), κ=−1; basic (−1/2,−1/2), κ=−1; PGL₂: Newton point 0 twice, κ=0,1 in Z/2 | keep |
| 4.5 Remark | SL₂, T of Q(i), d=diag(3,1) | det(d/√3)=1; a rational conjugator needs determinant 1/3 in ±(a²+b²), 3-adic valuation −1 against even | keep |
| 4.8 | scalars 1/2, 1/5 at p=5, d=1 | 2∈Z_(5)^×; 1/5=f/n gives n²=25·deg f with 5∤n | keep |
| 4.9 | E/F₅; E: y²=x³−x over F₃; δ_D=[[0,−1],[5,0]] | eigenvalues (1∓2i)/5, rank 2, e=1, centralizer dimension 2; γ²=−1/3 scalar, e=2, dimensions 2 then 4; δ_D²=−5, (δ_D⁻ᵀ)²=−1/5 | keep |
| 4.9 | norm-one torus of Q₂₅/Q₅ | N(z)=5 has no Q₅-point (v(5)=1 odd); over Q₂₅ the point (5,1) | keep |
| 4.10 | supersingular E | I=B^×, I(R)/R^×≅SO(3) compact, I(R) not compact (scalars) | keep |
| 4.11 | g₂=−g₁, hyperspecial GL₂ | points equal, relating automorphism −1∈I_x(Z_(p)) | keep |
| 4.13 headline | ordinary E/F₅; supersingular E/F₉ | dim I=2=dim Z(γ_ℓ); dim I=4=dim GL₂ | keep |
| 5.2 | diag(2,1), diag(3,1) | multipliers 2 and 3; block sum forces c=2 and c=3 | keep |
| 5.6 | G₁=G₂=GL₂ | G₃ the diagonal GL₂, C_i=1, dimensions 2→2 | keep |
| 5.9, 5.10 headlines | ordinary E/F₅ | CM lift by Z[i], Mumford–Tate torus of rank 2 = rank GL₂; γ₀ has (trace, det)=(2/5,1/5) | keep |
| 6.2, 6.3 headline | marked point of degree m>1; constant map | f(c)=x fails over F_q; empty higher-stratum preimage | keep |
| 7.1 (R01) | GL₂, p=7, χ₃χ₅-level | image in GL₂(Q₃) of index 1; intersection of index 2 | K_ℓ to be defined |
| 7.2 | g=diag(1,1/5) | det(T−g)=T²−(6/5)T+1/5 | keep |
| 7.6 headline | uniqueness; H¹ convention | Conj(G)(Q)→Conj(G)(Q_ℓ) injective; (2/5,1/5)↦((2/5)/(1/5),5)=(2,5) | keep |
| Examples | Y(9)→Y(3); Iwahori, j=diag(p,1) | kernel of GL₂(Z/9)→GL₂(Z/3) has 3⁴=81 elements; c=p gives lower-left entry 1∉pZ_p | keep |

**Pinned declarations opened** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`; both are the checked-out heads and the revisions of `lake-manifest.json`): `WittVector.Isocrystal` (Mathlib/RingTheory/WittVector/Isocrystal.lean:112), `Isocrystal.frobenius` (:124); `TauCeti.AlgebraicGeometry.AbelianVariety` (AbelianVariety/Basic.lean:95); `AbelianVariety.End` (End/Basic.lean:74, `Additive (A ⟶ A)`); `Matrix.transpose_mul_J_mul_eq_det_smul` (SymplecticMultiplier.lean:63); `TauCeti.reductiveCommHopfAlgProperty` (Reductive/Basic.lean:71); `conjugationAlgHom` (Hopf/Conjugation.lean:66), `productMap_comp_conjugationAlgHom` (:107), `conjugationAlgHom_counit_left`, `_counit_right`, `_coassoc` (:176, :196, :248); `TauCeti.ComoduleAlgebra.coinvariants` (ComoduleAlgebra.lean:136). All exist at the cited lines. No backticked name in the README is presented as this roadmap's own.

**Lean.** `lake env lean` on `packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file has one `import Mathlib`, one module docstring, the namespace and 0 declarations. The one-tactic probe and the `#check @name` comparison therefore have 0 inputs; nothing changed.

**Headlines.** Seven: §3.8 (KPZ Theorem 7.2.21), §4.7 (density), §4.13 (HT Corollary 2.1.9), §5.9 (KZ Theorem 4.4.6), §5.10 (KZ Corollary 4.4.13), §6.3 (KZ Corollary 5.2.7), §7.6 (KZ Theorem 5.1.4). Each is named in the module docstring with the carrier it lacks. None is statable at the pins: each needs an integral model of a Shimura variety, and a grep of both pins for Shimura data, parahoric group schemes and Dieudonné modules finds no carrier.

**Suppliers.** All 24 cited roadmaps were fetched at main or at their open heads, and each of the 122 cited section or layer ids resolves to a heading there. Contents read: ArithmeticGaloisRepresentations §1.11 contains the target *Reductive quotients over fields and DVRs* with `Conj_H`, `χ_H` and the semisimple-class description; ReductiveGroupsPartIII §0.7 (Out′, Conj′, Aut′ and the conjugacy criterion), §3.5, §5.5 (takes the common class as a hypothesis); ReductiveGroupsPartII *steinberg-quasi-split*; GeometricSatakeAndFusionPartII §§3.1, 3.7, 5.5; ShimuraVarieties §7.0i (over ℂ only, so the gap asks for nothing supplied). No never-cite roadmap is cited.

Dependency check, prescribed command with `--movable`, exit 0:

```text
depcheck: 239 roadmaps, 2265 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Gaps.** 21 slugs in the README, the same 21 in `design/plan.json`, each with a named supplier and section matching the README's contract, each used in at least one `*Needs:*` line. Each `needs` sentence carries its hypotheses and says what the supplier already has.

**Duplication and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id defined only by a revision and no second copy. Object searches over main and the open heads (strongly acceptable triples, Kottwitz–Rapoport strata, integral models of Hodge or abelian type, tensor quasi-isogeny group, density of the ordinary locus, local-model diagram): no second owner. "Strongly acceptable" in ArithmeticStatisticsPartV is a sieve notion; AbelianSchemesAndArithmeticModuli cites HT §§2.1.5–2.1.7 only for Frobenius semisimplicity; EndoscopicTransferAndUnitaryTraceComparison cites HT §2.3, which this roadmap excludes. The board's package index lists two other packages, neither on this subject.

Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, IgusaVarietiesAndTorsionConcentration and ReductiveGroupsPartII (the third list is empty); nothing shared: very-good embeddings and adapted lifts are owned by the first, local models and same-field Schubert curves by the second, Conj′ and the abelian-variety application by the third, B(G) by the fourth, PEL Newton strata by the fifth, fixers and parahorics by the sixth.

**Copyright.** Wording: 19 passages were set beside the source lines (the 15 sampled, plus §4.8 against HT §2.1.3, §4.11 against HT Lemma 2.1.4, §3.1 against KZ §4.2.8, and the ordinary-class note under References against KZ Remark 2.2.5). The longest shared runs are forced phrases of six or seven words ("discrete valuation ring of mixed characteristic"). Arrangement: KZ's order is §4.1, 4.2, 4.3, 4.4, 5.1, 5.2, 5.3. KZ §4.1 is spread over Layers 0, 1, 4 and 5; Layers 1, 3 and 4 rest on KPZ, KP and HT; Layer 7 joins KZ §5.1 and §5.3 after §5.2. The order 4→5→6→7 is forced (§5.6 needs §4.13; §6.3 needs §4.7; §7.4 needs §5.10 and §6.3). No table, figure or example list is taken over.

Source independence: 19 passages compared with 5 sources (KZ, HT, KPZ, KP, K17), none shared; largest share KZ, 34 of 82 source mentions in the 63 locator lines; contents compared with KZ: independent.

## Not verifiable

- The published versions of KZ (Annals), HT (Duke) and K17 (JAMS) were not collated with the recorded preprint or author versions; locators are for the versions `sources.toml` records.
- The 21 declared supplier gaps are contracts; their future proofs cannot be checked here.
- Whether every Hodge-type group at p>2 lies in the "standard" range of GeometricSatakeAndFusionPartII §3.1 rests on the classification of abelian-type data, which I did not recheck.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), printed p.34: the source says the inertia coinvariants of the abelianization are torsion; it should be torsion-free, as Lemma 4.2.4 requires; affects a stated result.
- **Misprint** in KZ at §5.1.3, printed p.47: the source says rational points of the conjugacy quotient are the semisimple classes of rational points; it should be geometric semisimple classes for points over an algebraically closed field; affects nothing.
- **Gap** in KZ at §5.1.1, printed p.47: the source says the level is a product at ℓ and then states the theorem for all ℓ≠p; it should define the cover for a general level or assume the product form at every ℓ; affects a stated result.
- **Misprint** in HT at §2.1.3, printed p.21: the source says the integral group is the intersection of the Q_p-points of the isogeny group with the automorphisms; it should be the Q-points, as in the proof of Lemma 2.1.4; affects nothing.
- **Misprint** in HT at §2.1.8, printed p.24: the source says neatness uses the group generated by an undefined x; it should be the group generated by γ; affects nothing.
- **Gap** in HT at the proof of Corollary 1.3.13, printed p.19: the source says the category generated by the universal isocrystal is the representation category of the full tensor stabilizer of a fibre; it should be that of a subgroup, which suffices by restriction; affects the proof.
- **Error** in HT at §1.3.15, printed p.20: the source says an ordinary class with Newton point the averaged inverse Hodge cocharacter always exists; it should assume its existence, automatic for quasi-split groups; affects a stated result.
- **Error** in KP at the proof of Theorem 4.2.7, printed p.186: the source says the local action map is a torsor; it should be the smooth action morphism; affects the proof; corrected in print at KPZ §7.3.1(1), p.85.
- **Gap** in KP at the proof of Lemma 3.1.17, printed p.169: the source says convergence in a topology for which the ring is not complete suffices; it should be convergence in the p-adic topology, for which it is complete; affects the proof; corrected in print at KPZ §7.3.1(2), pp.85–86.
- **Error** in KP at Lemma 4.6.13 and Corollary 4.6.15, printed pp.202–203: the source says every component piece has the fixed parahoric level; it should be the level conjugated by its coset representative; affects a stated result; corrected in print at KPZ §7.3.1(3), pp.86–87.

## For the human reviewers

- Licence: HT and K17 are read from author pages (`sources.toml`, `licence_class = "author-page"`), in versions dated 27 January 2021 and 27 August 2016; their numbering was not collated with the Duke and JAMS versions.
- Scope: the sources are refereed (KP, Publ. IHÉS 2018; KPZ, Forum Math. Pi 2026; HT, Duke 2022; KZ recorded as Annals 2025); the KZ text read is arXiv v2.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ac7840a4f4ac1c58ef97ae3a6ac612dbf12c8fb8", "job": "REV-PKG-ShimuraVarietiesPartII~8", "model": "fable", "worker": "chris-x91"} -->
