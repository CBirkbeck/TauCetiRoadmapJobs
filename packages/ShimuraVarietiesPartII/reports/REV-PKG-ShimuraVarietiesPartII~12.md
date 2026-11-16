<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6913271497 -->
Review (claude) of c02300c

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the Newton class, ordinary locus and I_x of the matched model are used for an abelian scheme no section defines them for

   **Location.** `packages/ShimuraVarietiesPartII/README.md:1155` (§5.6): "Then 1→C_i→I_(x_3)→I_(x_i)→1 is an exact sequence of Q-algebraic groups for i=1,2." Also `README.md:1143` (§5.5): "so [b_(x_3)] maps to [b_(x_i)] under G_3→G_i for i=1,2, and x_3 is ordinary exactly when x_1 is".

   **Claim.** [b_(x_3)], ordinariness of x_3 and I_(x_3) are defined objects on the model of (G_3,X_3), formed for A_3≅j_1^*A_1×j_2^*A_2.

   **Witness.** `README.md:1094` (§5.3) defines that model by an embedding "on the Q-space (V_3⊗_Q K′)^r"; §5.4 covers only "a strongly acceptable triple". KZ line 1971–1972 forms I_(x_3) in Aut_Q(A_(3,x_3)).

   In detail: Layer 4 forms its objects for the defining embedding, whose abelian scheme has dimension r[K′:Q]·(dim A_1+dim A_2). (G_3,X_3,G_3°) need not be strongly acceptable: Z^c_(G_3)≅Z^c_(G_2)×Z^c_(G_1), and Z^c_(G_1) is only a product of restrictions of tame tori (§2.6), not of induced tori. On GU(1,1) of Q(i) at p=5 with K′=Q and r=2, §4.8 read on the §5.3 model gives a group of quasi-isogenies of a variety isogenous to A_3², of twice the dimension of A_3. §5.4 says independence of the embedding is not asserted, so the two readings are not identified by anything stated.

   **Exact repair.** Keep the numbering.

   1. §5.5, after the sentence ending "not merely an isogeny of unstructured fibres.", insert:

      > The map i_3 from S_(K_3) to the Siegel model of (V_3, V_1,Zp⊕V_2,Zp), the composite through the pair moduli, is not the embedding that defines S_(K_3) in §5.3. As S_(K_3) is normal and flat, i_3 factors through the normalization of the Zariski closure of its image, as in the construction of §5.4; so §§0.4–0.6 give, for A_3 and a tensor family cutting out G_3 in V_3^⊗ that contains the two projections and the pullbacks of the families of G_1 and G_2, the prime-to-p étale tensors, the lift-independent crystalline tensors and the crystalline tensor functor. For a geometric special-fibre point x_3 of S_(K_3), the class [b_(x_3)]∈B(G_(3,Qp),{μ_(h_3)⁻¹}), the ordinary locus and the group I_(x_3) are those of §§4.1, 4.6 and 4.8 for A_3 with these tensors, and §§4.2 and 4.9–4.13 hold for them with the same proofs. At x_1 they are the objects of Layer 4 for the defining embedding ι_1.

      and extend its locator to "(KZ, Proposition 4.4.8 and equation (4.4.9.1), pp.44–45; §4.4.9, pp.44–45, for A_3 and I_(x_3); proof of Theorem 4.4.6, …)".
   2. §5.5 `*Needs:*`: add §0.4; §0.5; §0.6; §4.1; §4.2; §4.6; §4.8; §4.9; §4.10; §4.11; §4.12; §4.13 (all already in the Layer 5 Dependencies).
   3. §5.6, replace "with I_(x_2) formed as in §5.4 for the embedding ι_2 of the matched datum" by "with I_(x_3) formed for A_3 and ι_3 as in §5.5, I_(x_1) that of Layer 4 for ι_1, and I_(x_2) formed as in §5.4 for the embedding ι_2 of the matched datum".
   4. §5.9, proof sketch: after "for points in the comparison image" add "(their ordinariness on S_(K_3) is that of §5.5)".

   **Repair test.** On GU(1,1), Q(i), p=5: after the repair I_(x_3)⊂Aut_Q(A_(1,x_1)×A_(2,x_2)), the projection idempotents are among its tensors, so I_(x_3)→I_(x_i) is defined and the kernel is C_i; a G_3-frame of D(A_(3,x_3)) preserves the projections and is a pair (φ_1,φ_2), giving b_3↦(b_1,b_2). The steps are KZ line 1957–1966 (i_3 and (4.4.9.1)), line 1969–1972 (I_(x_3)) and line 1977–1983 (projection tensors).

2. **F02** (P3) §2.3 uses F0, H^sharp and "quasi-tame" without defining them

   **Location.** `packages/ShimuraVarietiesPartII/README.md:509` (§2.3): "Construct a Hodge cover G with G_der=Res_(F0/Q) H^sharp, the same adjoint datum, split local reflex composite, … R-smooth torus centre, quasi-tame Z_G^c". "quasi-tame" recurs at `README.md:557` (§2.5).

   **Claim.** Every term is the literature's name or is defined where it first appears.

   **Witness.** A search of the README finds F0 once and H^sharp once, at line 509, with no definition; "quasi-tame" twice, undefined. The source names them: KPZ line 3381 (G_2^ad≅Res_(F/Q)H), line 3373–3374 (H^♯), line 713–715 (Definition 3.1.4).

   **Exact repair.**

   1. §2.3, replace "Suppose G_2^ad is Q-simple and" by "Suppose G_2^ad is Q-simple, so that G_2^ad≅Res_(F/Q)H with F totally real and H absolutely simple over F, and write H^♯ for the simply connected cover of H, or, in type D, its quotient that is the image in the standard orthogonal representation at the places of type D^H (KPZ §7.2.1, pp.76–77). Suppose that"; replace "G_der=Res_(F0/Q) H^sharp" by "G_der≅Res_(F/Q)H^♯".
   2. Conventions, after the R-smooth paragraph, add: "A reductive group over a finite extension F of Q_p is quasi-tame when it is a product of Weil restrictions Res_(K_i/F)H_i with each H_i split by a tamely ramified extension of K_i (KPZ Definition 3.1.4, p.16)."
   3. `sources.toml`, entry `KPZ`, `locator`: add "Definition 3.1.4; §7.2.1".

   Tested on the instance: for GU(1,1) of Q(i) with the isotropic form diag(1,−1), F=Q, H=PGL₂, H^♯=SL₂ and G_der=SU(1,1)≅SL₂, as the Check of §2.1 computes.

Two findings: R01 (P2) and R02 (P3); one is blocking. Both findings of round 11 are repaired, and the repaired passages pass the adversarial pass. R01 is the round-11 pattern (Layer 4 objects used on a model, for an abelian scheme, that no section defines them for) found once more, on the matched model of §5.3. R02 is undefined notation in a sampled target. This review changed no authored file and fetched no source (`sources.toml` is unchanged; no `needs-references.toml` was written). No maintainer notes were supplied.

## Previous findings, verified first

| Finding (round 11) | Repaired passage | Status |
|---|---|---|
| F01 (P2), Newton strata, the ordinary locus and I_x not defined on the strongly acceptable model | `packages/ShimuraVarietiesPartII/README.md:1115` (§5.4, Construction): "Let A_2 be the pullback of the universal abelian scheme along the integral Siegel map … this map factors through N, the normalization in Sh_(K_2)(G_2,X_2) of the Zariski closure of its image". `README.md:1119` is the density theorem; `README.md:1191` and `:1203` name ι_2; `README.md:932` no longer mentions the strongly acceptable model. | **Repaired** for strongly acceptable models. KZ line 1862–1872, 1875–1885, 1887–1898 support each step. The same pattern on the matched model is R01. |
| F02 (P3), `cited_for` of KZ lacks §3.8 | `packages/ShimuraVarietiesPartII/sources.toml`, entry `KZ`: `"§2.6", "§3.8", "§3.10"`; HT and KPZ gained `"§5.4"`. | **Repaired.** Recomputed: the README sections citing each of the five ids equal the five lists. |

No finding of the last repair report was marked not actionable; nothing is re-raised.

## Verified sound

**Coverage.** The whole README was read (1423 lines; 63 numbered targets in 8 layers; 71 `*Needs:*` lines; 27 definitions and constructions), with `Suggested.lean`, `metadata.toml`, `sources.toml` and the `gaps` list of `design/plan.json`. The round-12 diff (README, Lean docstring, manifest, plan) was read line by line.

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no copied passage, no computational algorithm, no sorry'd data, no `set_option`.

**Seeded source sample: 15 of 15 read at their locators.** The author flags no locator as unverified.

| Target | Locator as read | Result |
|---|---|---|
| 0.4 | KZ §4.1.6–4.1.7, pp.30–31 (KZ line 1304–1355); §5.1.1, p.47 (KZ line 2063–2079) | supported; (5.1.1.1) is Isom(V_Qℓ, dual of R¹h_*Q_ℓ), the H₁ convention |
| 0.6 | HT Proposition 1.3.12, Corollary 1.3.13, p.19 (HT line 856–884); Lemma A.4, Proposition A.6, Corollary A.7, pp.38–39 (HT line 1746–1807) | supported; HT's V is cohomological, so "the dual of the tower representation goes to D" is right |
| 1.2 | KZ Proposition 4.1.9, pp.31–32 (KZ line 1361–1391), under (A′)–(B′) (KZ line 1272–1275) | supported: neat level, very good at y, adapted criterion in both directions |
| 1.4 | KPZ Theorem 7.1.3, pp.72–73 (KPZ line 3191–3203); §7.3.1(1), p.85 (KPZ line 3783–3786) | supported: π a torsor under the stabilizer scheme, q smooth of relative dimension dim G |
| 1.5 | KPZ Theorem 7.1.3(3), p.73 (KPZ line 3204–3206) | supported: connected stabilizer, k′/k_E finite, y over the same k′ |
| 2.3 | KPZ Proposition 7.2.10, pp.79–80 (KPZ line 3489–3554) | supported in content; notation is R02 |
| 2.6 | KZ Proposition 4.2.3, Lemma 4.2.4, pp.34–35 (KZ line 1491–1535) | supported; the README's "torsion-free" corrects item (5) |
| 3.5 | KP §4.6.5, Lemmas 4.6.6, 4.6.9, pp.199–201 (KP line 3167–3256) | supported: extension by the connected integral group, star-product isomorphism, map of extensions over the composite reflex field |
| 4.3 | HT Theorem 1.3.14, pp.19–20 (HT line 885–906) | supported |
| 4.7 | KZ Theorem 4.4.4, p.43 (KZ line 1887–1896); HT Corollary 1.3.16, p.20 (HT line 915–925) | supported: locally integral special fibre, density on every component |
| 4.9 | HT §2.1.5–2.1.7, (2.1.7.1)–(2.1.7.2), pp.22–24 (HT line 1011–1078); K17 §2.1.2, p.29 (K17 line 1281) | supported: frame over Q_(q^m) for m sufficiently divisible, norm of length rm |
| 5.4 | KZ Proposition 4.3.6, p.40, §4.3.7–4.3.8, pp.40–42 (KZ line 1767–1848); §4.4.1–4.4.2, §4.4.5, pp.42–43 (KZ line 1850–1898); HT §1.3.5, Proposition 1.3.7, pp.17–18 (HT line 760–807); KPZ §7.3.1(3), pp.86–87 (KPZ line 3814–3847) | supported |
| 5.7 | KPZ Corollary 5.3.16, p.60 (KPZ line 2632–2635); KZ Remark 4.1.13, p.33 (KZ line 1438–1442) | supported: good and smooth at the point gives very good there |
| 5.9 | KZ Theorem 4.4.6, proof §4.4.11, pp.43–46 (KZ line 1900–1903, 1994–2031) | supported: comparison image first, then the j-pieces by prime-to-p and p-power quasi-isogenies |
| 6.1 | KZ §5.2.1, pp.48–49 (KZ line 2125–2166) | supported: dominant coinvariant coweights below μ, top stratum smooth, descent to F_(p^n) with σ^n(λ)=λ |

Also read: KZ Lemma 2.2.8 (KZ line 453–462); KZ §4.4.7–4.4.10 (KZ line 1922–1993); KZ Corollary 4.4.13 (KZ line 2038–2056); KZ §5.1.2–Theorem 5.1.4 (KZ line 2080–2106); KPZ §2.1.4, Proposition 2.1.5 (KPZ line 440–456); KPZ §7.1.2 (KPZ line 3168–3190); KPZ Lemma 7.2.5, Definition 7.2.7, Lemma 7.2.11 (KPZ line 3425–3460, 3555–3564); HT §1.3.2 (HT line 696–715); HT §2.1.1–Lemma 2.1.4 (HT line 940–1010).

**Adversarial table** (repaired passages, the sample, the headlines, the targets of the findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §5.4 Construction, factoring through N | S_(K_2) normal flat; Z the closure of the image | a function on the preimage of an affine of Z, integral over O(Z), lies in O of the normal S_(K_2) | holds (KZ line 1870–1872) |
| Same, level G_2°(Z_p) smaller than the lattice stabilizer | G_2^fix≠G_2° | generic fibre of N is finite étale over its image, not closed in the Siegel variety; completed local rings of N are normal domains, rigid fibre smooth and connected, so horizontal tensors are constant | lift-independence still holds; remark, no change |
| §5.4 Theorem, normality | local-model fibre integral with normal components | integral + normal components ⇒ normal; passes along smooth q, π | holds; KZ line 1890–1895 |
| Same, quasi-split | G_2^der,Qp product of Res of split groups | adjoint group quasi-split ⇒ G_2,Qp quasi-split | §4.5 applies |
| Same, density | special points [h,g′], g′∈G_2(A_f) | quasi-isogenous with matching tensors ⇒ same class; components permuted transitively; each component fibre irreducible | dense |
| Same, conjugate pieces | level jK_p°j⁻¹, j∈G_2(Q_p) | j acts on the building through G_ad(Q_p); image of a very special point is very special | §1.9 applies to each piece |
| §5.4 Check 1 | GU(1,1), Q(i), p=5 | −1≡4=2²; Z[i]⊗Z₅=Z₅²; dim A=2, factors of height 2, dimension 1; slopes (0,1): p-rank 1+1=2; (1/2,1/2): 0 | keep |
| §5.4 Check 2 | T=Res_(Q(i)/Q)G_m; E: y²=x³+x | ψ(1,i)=Tr(1/2)=1, ψ(1,1)=Tr(i/2)=0; F₅ counts 1,0,1,1,0, #E=4, trace 2; (2y)²=−y², (−x)³−x=−(x³+x), 2²=−1 so order 4 | keep |
| Same, p=3 | y²=x³+x over F₃ | values 0,2,1 → 1+0+2 points, +∞ = 4, trace 0; Q₃^×/N(Q₉^×)=Z/2 | supersingular; torus not induced |
| §5.4 Check 3 | ι_2⊕ι_2 | frame φ⊕φ, Frobenius (ρ∨⊕ρ∨)(b_x)σ | class unchanged |
| §5.5 added sentence | G_3-frame of D(A_3) | preserves the projections, so it is a pair (φ_1,φ_2) of G_i-frames; b_3↦(b_1,b_2); B(G,{μ})→B(G_ad,{μ_ad}) keeps ordinariness | true once the G_3-tensors on A_3 are defined: R01 |
| §5.6 | GU(1,1), r=2, K′=Q | defining embedding of S_(K_3) on V_3², dimension 2(dim A_1+dim A_2); A_3 has dimension dim A_1+dim A_2 | two referents for I_(x_3): R01 |
| §2.3 | GU(1,1) of Q(i), form diag(1,−1) | F=Q, H=PGL₂, H^♯=SL₂=SU(1,1)=G_der | content right; symbols undefined: R02 |
| Conventions, Frobenius | E/F₅, E/F₂₅ | H¹: T²−2T+5; tower T²−(2/5)T+1/5; over F₂₅ trace 4−10=−6, tower T²+(6/25)T+1/25; γ_x² trace 4/25−10/25=−6/25 | keep |
| Conventions, norm | ζ of order 24, σ(ζ)=ζ⁵ | ζ·ζ⁵=ζ⁶≠ζ²; dual ζ⁻⁶=ζ¹⁸; ratio ζ¹²=−1 | keep |
| §4.9 Checks | π=1±2i; E: y²=x³−x over F₃; δ_D=[[0,−1],[5,0]] | (1+2i)^a(1−2i)^b=1 ⇒ a=b=0, e=1; relations a+b=0, b even, X^*(S)=Z⊕Z/2, e=2; δ_D²=−5 | keep |
| §4.5 Remark | SL₂, T′=dTd⁻¹, d=diag(3,1) | normalizer determinants ±(a²+b²), even 3-adic valuation; 1/3 odd | keep |
| §4.8 Check 3 | p⁻¹=f/n | n^(2d) versus p^(2d)·deg f | p⁻¹ not integral |
| §2.1 Checks | GU(1,1) split at p; GSp_(2g) | Z^c=U(1), split G_m at p; Z^c=μ₂, not a torus | keep |
| §3.8 Check 3 | scalar i, GU(1,1), p=5 | i·ī=1; neat level meets Z(Q) trivially | inertia Z/4 |
| §3.10 Check | GU(1,1) curve | dim G=5, dim G_ad=3; 1+3=4, 1+5=6 | keep |
| §0.1 Check 2 | E×E over F₃ | ker F=α₃², order-3 subgroups a P¹ | chain fibre of dimension ≥1 |
| Layer 0 Example | Y(9)→Y(3) | kernel 1+3M₂(Z/9), order 3⁴; −1≢1 mod 3 | 81 |
| §5.3 Checks | Q(√2), Q(√−2), Q(i), Q(√−11) at 5 | 2, 3 non-squares; −1≡4, −11≡4 squares | keep |
| §7.1 Check 4 | Q(i), 3 and 7 inert | unit norms onto Z_v^×; image G(Z₃), intersection of index 2 | image, not intersection |
| §6.1 Check 2 | hyperspecial, minuscule μ | {λ dominant, λ≤μ}={μ} | one KR stratum, two Newton classes |
| §7.6 headline | KZ line 2104–2106 | Conj(G)(Q)→Conj(G)(Q_ℓ) injective | unique |
| §3.8, §4.7, §4.13, §5.9, §5.10, §6.3 headlines | source hypotheses at KPZ line 3735–3763, HT line 915–925, 1095–1109, KZ line 1900–1903, 2038–2042, 2169–2173 | hypotheses in the README equal the sources' | keep |

**Pinned declarations opened** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): `WittVector.Isocrystal` (Mathlib/RingTheory/WittVector/Isocrystal.lean:112), `Isocrystal.frobenius` (:124); `TauCeti.AlgebraicGeometry.AbelianVariety` (AbelianVariety/Basic.lean:95); `AbelianVariety.End` (End/Basic.lean:74, `Additive (A ⟶ A)`); `Matrix.transpose_mul_J_mul_eq_det_smul` (SymplecticMultiplier.lean:63); `TauCeti.reductiveCommHopfAlgProperty` (Reductive/Basic.lean:71); `conjugationAlgHom` (Hopf/Conjugation.lean:66), `productMap_comp_conjugationAlgHom` (:107), `conjugationAlgHom_counit_left`, `_counit_right`, `_coassoc` (:176, :196, :248); `TauCeti.ComoduleAlgebra.coinvariants` (ComoduleAlgebra.lean:136). All exist where cited. No declaration of either pin is named for a Shimura variety, a parahoric, a Newton stratum or a conjugacy quotient. No backticked name in the README is presented as this roadmap's own.

**Lean.** `lake env lean` on `packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. One `import Mathlib`, one module docstring, the namespace, 0 declarations; the one-tactic probe and the `#check @name` comparison have 0 inputs. No `set_option`, no sorry'd data, no padding possible.

**Headlines.** Seven, from the README's last scope paragraph: §3.8 (KPZ Theorem 7.2.21), §4.7 with §5.4 (HT Corollary 1.3.16, KZ Theorem 4.4.4), §4.13 (HT Corollary 2.1.9), §5.9 (KZ Theorem 4.4.6), §5.10 (KZ Corollary 4.4.13), §6.3 (KZ Corollary 5.2.7), §7.6 (KZ Theorem 5.1.4). Each is named in the module docstring with the carrier it lacks; none is statable at the pins; no stand-in is used.

**Suppliers.** The resolver finds nothing unresolved. I resolved all 118 cited headings at the heads this round (24 suppliers): every section and layer cited exists under the cited number. Texts read for what the README says of them: BunGAndNewtonStrata §1.28 (ordinary classes under a derived isogeny, both directions); ShimuraVarieties §5.6; ArithmeticGaloisRepresentations §1.11, paragraph *Reductive quotients over fields and DVRs*; ReductiveGroupsPartII *steinberg-quasi-split* and the citation of KZ Lemma 4.2.4 in §RG2.3; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII's contract of the same slug on ShimuraVarieties §7.0i. No never-cite roadmap is cited. This roadmap is at 363 in the merge order; its last supplier, GlobalShtukasAndFunctionFieldLanglands, at 360.

Dependency check, prescribed command with `--movable`, exit 0:

```text
depcheck: 258 roadmaps, 2467 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Gaps.** 21 slugs in the README, 21 contracts, 21 entries in `design/plan.json`; the sets are equal, each with a named supplier and section, and each `needs` agrees with its contract (two differ only in a cross-reference to Conventions and to Layer 0). KPZ Lemma 7.2.11 was read against gap:rg3-r-smooth-abelian-type: its proof uses only quasi-tameness of the adjoint group and R-smoothness of the centre, as the contract says. An acceptance of a later round would be conditional on these 21 gaps.

**Shape.** Every target has a `*Needs:*` line and a locator; every Definition and Construction has an API list and at least three Checks (computed over all 27); every layer ends with Examples and Dependencies. Residue search (LaTeX delimiters, pull-request numbers, round labels, machine paths, "optional", "deferred", "so far", HTML anchors, target-numbering blocks): no hit.

**Duplication and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id defined only by a revision and no second copy. By object over main and the open heads: "strongly acceptable" occurs only in ReductiveGroupsPartIII and BunGAndNewtonStrata (as imported hypotheses) and in an unrelated sense in two arithmetic-statistics roadmaps; KPZ Theorem 7.2.21 in no other roadmap. PELModuliPartII, new in the closest list, owns unitary Rapoport–Zink spaces and unitary integral models; it asks ShimuraCompactifications Layer 7 for multichain PEL moduli under its own contract gap:bad-prime-projectivity, of which the Siegel chain moduli of gap:siegel-chain-moduli here is the symplectic case with further clauses (generic fibre, Hecke transitions, the hyperspecial comparison). Neither roadmap owns the object; both hand it to the same supplier layer. `Suggested.lean` declares no name.

Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, PELModuliPartII, ReductiveGroupsPartII and AbelianSchemesAndArithmeticModuli (the third list is empty); nothing shared: good and very-good embeddings and adapted lifts are owned by the first, local models and same-field Schubert curves by the second, Conj′ and the abelian-variety application by the third, B(G) by the fourth, unitary formal and integral moduli by the fifth, fixers and parahorics by the sixth, Tate modules and Serre–Tate theory by the seventh.

**Copyright.** Wording: 22 passages set beside the source lines: the 15 sampled, and the §5.4 construction against KZ line 1862–1872, its density sketch against HT line 917–925, the §5.5 sentence against KZ line 1994–1997, §2.1 against KZ line 1481–1490, the R-smooth convention against KPZ line 443–448, §7.6 against KZ line 2104–2106, the density item of the `Suggested.lean` docstring against HT line 915–916. Longest shared runs are forced phrases of five to seven words ("the pullback of the universal abelian", "a product of induced tori"). Arrangement: KZ runs §2.4, §3, §4.1, 4.2, 4.3, 4.4, 5.1, 5.2, 5.3. Its §4.1 is spread over Layers 0, 1, 4 and 5; Layers 1, 3 and 4 rest on KPZ, KP and HT; Layer 5 joins KZ §4.3, §4.4 and Theorem 4.1.11; Layer 7 joins KZ §5.1 and §5.3 after §5.2. The order of Layers 4 to 7 is forced (§5.6 needs §4.13; §6.3 needs §5.4; §7.4 needs §5.10 and §6.3). No table, figure or list of examples is taken over.

Source independence: 22 passages compared with 5 sources (KZ, HT, KPZ, KP, K17), none shared; largest share KZ, 37 of 65 locator lines; contents compared with KZ: independent.

## Not verifiable

- The published versions of KZ (Annals), HT (Duke) and K17 (JAMS) were not collated with the preprint or author versions `sources.toml` records; locators are for the recorded versions.
- The 21 declared supplier gaps are contracts; their future proofs cannot be checked here.
- Whether the Newton class and I_x of a point depend on the chosen Hodge embedding was not settled; R01 asks only that the choice be stated for the matched model, as §5.4 states it for ι_2.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), p.34: the source says the inertia coinvariants of the cocharacters of G^ab are torsion; it should be torsion-free, as Lemma 4.2.4 and its use on p.41 require; affects nothing.
- **Gap** in KZ at the proof of Lemma 4.3.8(1), p.40: the source applies the multiplier sequence of the cited KPZ lemma to the matched group; that lemma assumes a simple adjoint group, though its proof does not use it; affects the proof.
- **Gap** in KZ at §4.4.9, pp.44–45: the source forms the isogeny group of the matched point "in the same way" for a product abelian scheme that does not come from the embedding defining that model; it should say the tensors come through the normalized image, as in §4.4.1; affects the proof.
- **Misprint** in KZ at §4.4.2, p.43: the source indexes the strata by the acceptable set of G; it should be that of G_2; affects nothing.
- **Misprint** in HT at §2.1.3, p.21: the source defines the integral isogeny group as the Q_p-points meeting Aut; it should be the Q-points meeting Aut, as in the proof of Lemma 2.1.4, p.22; affects nothing.

## For the human reviewers

- Licence: `sources.toml` records HT and K17 from author pages (`licence_class = "author-page"`) and KZ from arXiv v2, not collated with the Annals version (its `version_note`); the published texts were not read.
- Scope: the roadmap states 21 supplier gaps on 11 other roadmaps (`packages/ShimuraVarietiesPartII/README.md`, Exact supplier contracts); its headline theorems hold only once those suppliers accept them.
- Scope: gap:siegel-chain-moduli here and PELModuliPartII's gap:bad-prime-projectivity both ask ShimuraCompactifications Layer 7 for lattice-chain moduli of abelian schemes; whether that supplier states one target for both is its owner's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c02300c8c1cd1c9245e3244db6221dd9791d6d79", "job": "REV-PKG-ShimuraVarietiesPartII~12", "model": "fable", "worker": "chris-x30"} -->
