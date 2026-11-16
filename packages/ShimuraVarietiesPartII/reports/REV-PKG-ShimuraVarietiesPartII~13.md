<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6914224445 -->
Review (claude) of 15f1c52

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §5.4: the lattice hypothesis of the integral Siegel map is "suitable", not stated

   **Location.** `packages/ShimuraVarietiesPartII/README.md:1112` (§5.4, Theorem): "Given a strongly acceptable target and any Hodge embedding into a Siegel datum with a suitable self-dual lattice and compatible levels, the generic Siegel map extends over its constructed integral model."

   **Claim.** The extension holds for a Hodge embedding with a "suitable" self-dual lattice; `README.md:1118` then fixes "a self-dual lattice V_2,Zp as in the theorem above", and §5.5 builds V_1,Zp⊕V_2,Zp on it.

   **Witness.** KZ line 1762–1764 requires that G_2→GSp(V_2,Qp) extend to a morphism of stabilizer schemes into the stabilizer of V_2,Zp. For T=Res_(Q(i)/Q)G_m at p=5, eigenlines e_1,e_2, the self-dual lattice ⟨e_1+e_2/5, e_2⟩ fails: diag(1,2) sends e_1+e_2/5 to itself plus (1/5)e_2.

   In detail: on V_2,Q5=Q_5e_1⊕Q_5e_2 the form of the §5.4 Check is u·(x_1y_2−x_2y_1) with u a unit, so Λ=⟨f_1,f_2⟩ with f_1=e_1+e_2/5, f_2=e_2 has ψ(f_1,f_2)=u and is self-dual. For t=(1,2)∈T(Z_5), t·f_1=e_1+(2/5)e_2=f_1+(1/5)f_2∉Λ. So K_2,p=T(Z_5) does not lie in the stabilizer of Λ, and there is no map Sh_(K_2)→Sh_(K′_2) to extend. Self-duality alone is therefore not the hypothesis; the condition KZ imposes is not in the README (a search for "stabilizer scheme" near ι_2 finds nothing in §§5.4–5.5). KZ also does not prove the statement for "any" embedding: an arbitrary ι_2 is first replaced (KZ line 1761–1762).

   **Exact repair.** Keep the numbering.

   1. §5.4, first Theorem, replace its first sentence by:

      > Let (G_2,X_2,G_2°) be a strongly acceptable triple, ι_2:(G_2,X_2)→(GSp(V_2),S_2^±) a Hodge embedding and V_2,Zp⊂V_2,Qp a Z_p-lattice that is self-dual for the symplectic form and such that G_2,Qp→GSp(V_2,Qp) extends to a morphism from the full fixer G_2^fix to the stabilizer scheme of V_2,Zp in GSp(V_2,Qp). Let K′_2,p be the stabilizer of V_2,Zp and K′_2^p a compact open subgroup of GSp(V_2)(A_f^p) containing the image of K_2^p. Then the generic Siegel map Sh_(K_2)(G_2,X_2)→Sh_(K′_2)(GSp(V_2),S_2^±) extends to a map from the integral model of §3.8 to the single-lattice Siegel model over O_E2. Every Hodge embedding can be replaced by one that admits such a lattice, by the equivariant embedding of buildings and Zarhin's enlargement (KZ §4.3.5, p.40); the extension is not asserted for a self-dual lattice that the fixer does not stabilize.

      and extend the locator to "(KZ, §4.3.5 and Proposition 4.3.6, p.40, with §4.3.7–4.3.8, pp.40–42)".
   2. §5.4, Checks, add:

      > For T=Res_(Q(i)/Q)G_m at p=5 with eigenlines e_1,e_2 of T(Q_5)=Q_5^××Q_5^×, the lattice spanned by e_1+e_2/5 and e_2 is self-dual, but diag(1,2)∈T(Z_5) sends e_1+e_2/5 to itself plus (1/5)e_2, outside the lattice. So T(Z_5) is not in the stabilizer and the Siegel map is not defined at these levels; Z[i]⊗Z_5=Z_5e_1⊕Z_5e_2 is stable under T(Z_5).

   **Repair test.** With the hypothesis, the instance above is excluded (the fixer T(Z_5) does not map to the stabilizer), and for Z_5e_1⊕Z_5e_2 the hypothesis holds: diag(a,b) with units a,b preserves it. The §5.5 lattice V_1,Zp⊕V_2,Zp is then stable under G_3°(Z_p) through G_3°→G_2°.

2. **F02** (P3) Conventions: the quasi-tame definition restates ReductiveGroupsPartII §RG2.3.2 without citing it

   **Location.** `packages/ShimuraVarietiesPartII/README.md:25` (Conventions): "A reductive group over a finite extension F of Q_p is quasi-tame when it is isomorphic to a product of Weil restrictions Res_(K_i/F)H_i, with K_i/F finite and each H_i split by a tamely ramified extension of K_i".

   **Claim.** The notion is introduced here, with KPZ Definition 3.1.4 as its only reference.

   **Witness.** Main, `TauCetiRoadmap/ReductiveGroupsPartII/README.md:4123–4130`, target *quasi-tame-group* of §RG2.3.2: "`G` is quasi-tame iff `G ≅ ∏_i Res_{K_i/K} H_i` with `K_i/K` finite separable and each `H_i` … split over a tamely ramified extension of `K_i`", same source.

   **Exact repair.**

   1. Conventions, replace the sentence by: "Quasi-tame is the notion of ReductiveGroupsPartII §RG2.3.2 (*quasi-tame-group*): a connected reductive group over a finite extension F of Q_p that is isomorphic to a product of Weil restrictions Res_(K_i/F)H_i, with K_i/F finite and each H_i split by a tamely ramified extension of K_i (KPZ Definition 3.1.4, p.16). A group over Q, such as Z_G^c, is called quasi-tame here when its base change to Q_p is."
   2. `### From TauCetiRoadmap.ReductiveGroupsPartII`: add "§RG2.3.2 (*quasi-tame-group*: quasi-tame groups; a Weil restriction of a quasi-tame group is quasi-tame)" to the list; in Scope and ownership, "ReductiveGroupsPartII §RG2.3 states full fixers, connected parahorics, quasi-tame groups and Lang's theorem."
   3. Add "ReductiveGroupsPartII §RG2.3" to the `*Needs:*` of §2.5, which uses the word (§2.3 already lists it).

   The Check at `README.md:42` stays: it tests the imported notion at p=3 (the supplier's own negative example is at p=2). ReductiveGroupsPartII is already a supplier, so the dependency check is unchanged.

3. **F03** (P3) §3.9: the structure group of the "adjoint fixer torsor" is not the object the words name

   **Location.** `packages/ShimuraVarietiesPartII/README.md:770` (§3.9): "construct an adjoint fixer torsor π:S̃_ad→S and an equivariant smooth map q:S̃_ad→M_loc(G₂,{μ_h,2}) of relative dimension dim G₂_ad"; also the API bullet at `README.md:780`.

   **Claim.** π is a torsor under the "adjoint fixer"; by Conventions (`README.md:21`) a fixer is the full fixer of a building point, here of x_ad in G_2^ad.

   **Witness.** KPZ line 3303–3306: the group is the quotient of the cover's stabilizer scheme by the Zariski closure of its centre, which "in general" is not the Bruhat–Tits stabilizer of x_ad; under (E) it is smooth with neutral component the parahoric of x_ad.

   **Exact repair.**

   1. §3.9, replace "construct an adjoint fixer torsor π:S̃_ad→S" by "construct π:S̃_ad→S, a torsor under the quotient G^fix/Z, where G^fix is the full fixer of the auxiliary cover of §2.5 at a point lifting x_ad and Z is the Zariski closure of Z_G in G^fix. Under condition (E) this quotient is smooth and its neutral component is the connected parahoric of G_2^ad at x_ad; it is not asserted to be the full Bruhat–Tits fixer of x_ad (KPZ §7.1.12, p.75)".
   2. API, first bullet: "Return the torsor under G^fix/Z and its reduction to the connected adjoint parahoric under the stated nonexceptional, strongly acceptable or general shtuka route, with the corresponding inputs."
   3. Extend the locator: "(KPZ, §7.1.12 and Proposition 7.1.14(3), pp.75–76; Theorem 7.2.21(3), pp.84–85; Corollary 7.2.24, p.85)".

   **Repair test.** For a torus G=T, Z=G^fix and the quotient is trivial, so π is the identity, as the second Check of §3.10 computes. For hyperspecial GL₂, GL₂/G_m=PGL₂ over Z_p of dimension 3, the value in the first Check of §3.10.

4. **F04** (P3) §6.3: the top-stratum curve has no locator

   **Location.** `packages/ShimuraVarietiesPartII/README.md:1266–1268` (§6.3): "For a point already in the top stratum, use a curve meeting the dense ordinary open … inside its smooth component." with the locator "(KZ, Proposition 5.2.3 and Corollary 5.2.7, pp.49–53)".

   **Claim.** The cited statements contain the top-stratum curve.

   **Witness.** KZ line 2169 and 2322 both assume λ≠μ. The curve through a point of the open stratum whose inverse image of the ordinary locus is dense is in the proof of Proposition 5.3.5, KZ line 2411–2418, p.54.

   **Exact repair.** §6.3, locator: "(KZ, Proposition 5.2.3 and Corollary 5.2.7, pp.49–53; proof of Proposition 5.3.5, p.54, for a point of the top stratum)". No statement changes; `sources.toml` already lists §§3–5 of KZ.

5. **F05** (P3) terms used before or without their definition, and one count

   **Location and witness** (a search of the README for each term):

   1. `README.md:250` (§0.3): "For a fixed admissible p-level … is finite étale with the expected finite level action". "admissible p-level" occurs once and is not defined; "expected" states no action. HT line 950 gives finite étale transitions; KZ line 1299–1303 the quotient by K^p/K_1^p.
   2. `README.md:94`: "no (NE) hypothesis". "(NE)" occurs once; §2.3 calls the condition "non-exceptional".
   3. `README.md:1097` (§5.3 proof sketch) uses ι_3, V_3 and Ψ_3; `README.md:1148` (§5.5) says "Write ι_3 for the Hodge embedding of (G_3,X_3) on V_3=V_1⊕V_2". §5.2 constructs the representation without a name.
   4. `README.md:532` (§2.3, Remark): "The five cover properties". The construction at `README.md:512` lists seven (derived group, adjoint datum, reflex splitting, very-good self-dual embedding, R-smooth centre, quasi-tame Z_G^c, torsion-free coinvariants).

   **Exact repair.**

   1. §0.3: "For the p-level K_p of integral Hodge data (§0.1) and neat prime-to-p levels K_1^p normal in K_2^p with compatible Siegel levels, the transition S_(K_pK_1^p)→S_(K_pK_2^p) is finite étale, and K_2^p/K_1^p acts on its source over its target, simply transitively on geometric fibres; the pro-object carries a continuous G(A_f^p)-action."
   2. Line 94: "no non-exceptional hypothesis (the condition of §2.3)".
   3. §5.2, after "Its direct-sum representation on V_1⊕V_2 is symplectic because the multipliers agree." add "Write V_3=V_1⊕V_2, Ψ_3=Ψ_1⊕Ψ_2 and ι_3:(G_3,X_3)→(GSp(V_3),S_3^±) for this embedding."; in §5.5 replace "Write ι_3 for the Hodge embedding of (G_3,X_3) on V_3=V_1⊕V_2 and i_3 for" by "With ι_3 on V_3=V_1⊕V_2 as in §5.2, write i_3 for".
   4. §2.3, Remark: "The cover properties listed in the construction are asserted together, under the non-exceptional restriction of the source."

   **Repair test** (item 1). Y(9)→Y(3) for p∤3: the group is the kernel of GL₂(Z/9)→GL₂(Z/3), 1+3M₂(Z/9), of order 3⁴=81, the degree in the Layer 0 Example. At a non-neat K_2^p containing −1 with −1∉K_1^p the action is not free (−1 acts trivially), which the neatness hypothesis excludes.

Five findings: R01 (P2) and R02–R05 (P3); one is blocking. Both findings of round 12 are repaired. R02 is a defect of the round-13 repair itself (the new quasi-tame convention restates a definition a roadmap on main already states). R01, R03 and R05 are the round-12 pattern of F02 (a term or hypothesis used without being stated) found in three more places, two of them in sampled targets. This review changed no authored file and fetched no source (`sources.toml` is unchanged; no `needs-references.toml` was written). No maintainer notes were supplied.

## Previous findings, verified first

| Finding (round 12) | Repaired passage | Status |
|---|---|---|
| F01 (P2), Newton class, ordinary locus and I_x of the matched model used for an abelian scheme no section defines them for | `packages/ShimuraVarietiesPartII/README.md:1148` (§5.5): "Write ι_3 for the Hodge embedding of (G_3,X_3) on V_3=V_1⊕V_2 and i_3 for the map of S_(K_3) to the pair moduli followed by the map sending a pair to its product"; `:1160` (§5.6): "with I_(x_3) formed for A_3 and ι_3 as in §5.5"; `:1200` (§5.9): "(their ordinariness on S_(K_3) is that of §5.5)". | **Repaired.** KZ line 1957–1966 (i_3, (4.4.9.1)), 1969–1972 (I_(x_3)), 1977–1983 (projection tensors), 1870–1872 (factorization through the normalized image) support each step. |
| F02 (P3), F0, H^sharp and "quasi-tame" undefined | `README.md:512` (§2.3): "so that G_2^ad≅Res_(F/Q)H with F totally real and H absolutely simple over F. Write H^♯ for the simply connected cover H^sc of H, except when H is of type D^H"; `README.md:25` (Conventions) defines quasi-tame; `sources.toml`, `KPZ` locator gains "§§7.2.1–7.2.2; Definition 3.1.4". | **Repaired** as to the definitions (KPZ line 3360–3362, 3373–3374, 3381, 3495, 713–715). The added convention is R02. |

No finding of the last repair report was marked not actionable; nothing is re-raised.

## Verified sound

**Coverage.** The whole README was read this round (1428 lines; 63 numbered targets in 8 layers; 71 `*Needs:*` lines; 27 API lists; 30 Checks blocks), with `Suggested.lean`, `metadata.toml`, `sources.toml` and the `gaps` list of `design/plan.json`. The round-13 diff (README and manifest) was read line by line.

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no copied passage, no computational algorithm, no sorry'd data, no `set_option`.

**Seeded source sample: 15 of 15 read at their locators.** The author flags no locator as unverified.

| Target | Locator as read | Result |
|---|---|---|
| 0.3 | HT §2.1.1–2.1.2, p.21 (HT line 940–968); KZ §4.1.5, pp.29–30 (KZ line 1283–1303) | supported; wording is R05 |
| 0.4 | KZ §4.1.6–4.1.7, pp.30–31 (KZ line 1304–1355); §5.1.1, p.47 (KZ line 2063–2079) | supported; (5.1.1.1) is Isom(V_Qℓ, dual of R¹h_*Q_ℓ), the H₁ convention |
| 1.2 | KZ Proposition 4.1.9, pp.31–32 (KZ line 1361–1391), under (A′)–(B′) (KZ line 1272–1275) | supported: neat level, very good at y, component ≅ Spf A_G, adapted criterion in both directions |
| 1.5 | KPZ Theorem 7.1.3(3), p.73 (KPZ line 3204–3206) | supported: connected stabilizer, k′/k_E finite, y over the same k′ |
| 1.9 | KP Corollary 0.3, p.124 (KP line 130–134); KPZ Theorem 7.1.3(2), p.73 (KPZ line 3198–3203); KZ Theorem 4.4.4, p.43 (KZ line 1887–1896) | supported: reduced, strictly local components normal; normality at very special level |
| 3.5 | KP §4.6.5, Lemmas 4.6.6, 4.6.9, pp.199–201 (KP line 3167–3256) | supported: extension by the connected integral group, star-product isomorphism, map of extensions over the composite reflex field |
| 3.9 | KPZ Theorem 7.2.21(3), pp.84–85 (KPZ line 3750–3763); Corollary 7.2.24, p.85 (KPZ line 3768–3780) | supported; the structure group is R03 |
| 4.4 | HT Theorem 1.3.14(1),(3), pp.19–20 (HT line 885–906) | supported; local closedness for every class follows from (1) and finiteness of the acceptable set |
| 4.5 | HT Proposition 1.3.10, p.18 (HT line 821–837); §1.2.5, pp.14–15 (HT line 648–683) | supported; the README's choice of the place induced by ι_p is needed (Source issues) |
| 5.4 | KZ §4.3.5, Proposition 4.3.6, p.40, §4.3.7–4.3.8, pp.40–42 (KZ line 1751–1848); §4.4.1–4.4.5, pp.42–43 (KZ line 1850–1898) | supported except the lattice hypothesis: R01 |
| 5.6 | KZ Proposition 4.4.10, p.45 (KZ line 1973–1993) | supported |
| 5.8 | KZ Theorem 4.1.11, Remark 4.1.12 and proof, pp.32–33 (KZ line 1410–1437) | supported: very good at y, lift of all of I_x(Q), toric Mumford–Tate group by full rank |
| 6.3 | KZ Proposition 5.2.3, p.49 (KZ line 2169–2173); Corollary 5.2.7, pp.52–53 (KZ line 2322–2351) | supported for λ≠μ; the top stratum is R04 |
| 7.4 | KZ Proposition 5.3.5 and proof, p.54 (KZ line 2392–2425) | supported: companions on the curve, Chebotarev, ordinary points, then descending induction |
| 7.5 | KZ §5.3.2, p.53 (KZ line 2367–2376); §5.3.6, p.55 (KZ line 2428–2432) | supported |

Also read: KZ Lemma 2.2.8 (KZ line 453–472); KZ Definition 4.2.2–Remark 4.2.7 (KZ line 1481–1580); KZ §4.4.6–4.4.14 (KZ line 1900–2056); KZ §5.1.2–Theorem 5.1.4 (KZ line 2080–2106); KZ §5.2.1 (KZ line 2112–2166); KPZ §7.1.2 (KPZ line 3168–3190), Theorem 7.1.8, Remark 7.1.9 (KPZ line 3254–3277), §7.1.10–Proposition 7.1.14 (KPZ line 3281–3348), §7.2.1–7.2.2 (KPZ line 3350–3393), Lemma 7.2.5–Definition 7.2.7 (KPZ line 3425–3460), Proposition 7.2.10 and Lemma 7.2.11 (KPZ line 3489–3564), Proposition 7.2.19 (KPZ line 3669–3731), §7.3.1 (KPZ line 3782–3847); HT §1.3.8–Corollary 1.3.16 (HT line 808–925), §2.1.3–Corollary 2.1.9 (HT line 969–1105).

**Adversarial table** (repaired passages, the sample, the headlines, the targets of the findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §5.4 Theorem, lattice | T=Res_(Q(i)/Q)G_m, p=5, Λ=⟨e_1+e_2/5, e_2⟩ | ψ(f_1,f_2)=u unit, self-dual; diag(1,2)f_1=f_1+(1/5)f_2∉Λ | hypothesis missing: R01 |
| Same, standard lattice | Z_5e_1⊕Z_5e_2 | diag(a,b), a,b units, preserves it | holds |
| §5.5, i_3 into one Siegel model | diag(2,1)⊕diag(3,1) on two planes | multipliers 2 and 3: no similitude; equal multipliers give one | defined only on the pair moduli; consistent with §5.2 Check 2 |
| §5.5, factorization through N_3 | S_(K_3) normal flat, Z the closure | a function integral over O(Z) and regular on the generic fibre lies in O of a normal flat scheme | holds |
| §5.5, enlarged tensor family | e_1, e_2, pullbacks of the G_1- and G_2-families | their common stabilizer in GL(V_3) is G_1×G_2⊋G_3 (dimensions 5+5 against 5+5−3−1=6 for GU(1,1) twice) | further tensors are needed, as "a family cutting out G_3 that contains" says; holds |
| §5.5, frame comparison | frame φ of D(A_(3,x_3)) | φ carries e_i to the crystalline projections, so φ=φ_1⊕φ_2; b_3↦(b_1,b_2); KZ Lemma 2.2.8(2) in both directions | holds |
| §5.6, surjectivity | kernel C_1=Z^c_(G_2), a torus; SL₂→PGL₂, diag(i,−i) as control | commutator map from the connected preimage of Z_(G_1)(fγ) lands in the finite C_1∩G_3^der, so is trivial; for SL₂→PGL₂ the kernel μ₂ is finite and the centralizer of the image has two components | exact because C_i is connected and the centralizers are the stable ones |
| §5.6, rank | G_1=G_2=GU(1,1) of Q(i) | C_1=U(1), dimension 1; rank G_3=3+1=4 | consistent with full rank |
| Conventions, quasi-tame Check | Res_(Q_9/Q_3)G_m; norm-one tori of Q_3(√3), Q_3(∛3) | one induced factor; e=2 prime to 3; μ₃⊄Q_3, so the closure of Q_3(∛3) has group S_3 of order 6, faithful on Z³/Z(1,1,1), wild (e divisible by 3); decompositions give image of order dividing 8 | Check correct |
| Conventions, Frobenius | y²=x³+x over F₅, F₂₅ | counts 1,0,1,1,0, #E=4, trace 2; T²−2T+5; tower T²−(2/5)T+1/5; over F₂₅ trace 4−10=−6 | keep |
| Conventions, norm | ζ of order 24, σ(ζ)=ζ⁵ | ζ·ζ⁵=ζ⁶; dual ζ⁻¹·ζ⁻⁵=ζ¹⁸; ratio ζ¹²=−1; ζ²≠ζ⁶ | keep |
| §0.1 Check 2 | y²=x³−x over F₃ | x=0,1,2 give 0: 3 affine points, #E=4, trace 0; ker F of E×E is α₃², lines a P¹ | fibre of dimension ≥1 |
| §0.3 | Y(9)→Y(3), p∤3 | \|1+3M₂(Z/9)\|=3⁴=81 | torsor of degree 81: R05 repair |
| §1.9, global components | node; G^fix=G° | two regular branches strictly locally, one non-normal component; π⁻¹(Y) irreducible of dimension dim Y+dim G, a component of the normal q⁻¹(Z) | holds |
| §2.1 Checks | GU(1,1) split at p; GSp_(2g) | Z^c=U(1)⊇μ₂, G_m at p; Z^c=μ₂, not a torus | keep |
| §3.4 Check 3 | γ=diag(ℓ,1) | conjugates of the elementary matrices have entries ℓ and ℓ⁻¹ | level moves |
| §3.8 Check 3 | scalar i, GU(1,1), p=5 | i·ī=1; i, −1, −i outside a neat level | inertia Z/4 |
| §3.9 | torus; hyperspecial GL₂ | G^fix/Z trivial; PGL₂ of dimension 3 | R03 repair agrees with §3.10 Checks |
| §3.10 Check 1 | GU(1,1) curve | dim G=5, dim G_ad=3; 1+3=4, 1+5=6 | keep |
| §4.5 Remark | SL₂, d=diag(3,1) | det(d/√3)=1; normalizer determinants ±(a²+b²), even 3-adic valuation; 1/3 odd | keep |
| §4.9 Checks | π=1±2i; y²=x³−x over F₃; δ_D=[[0,−1],[5,0]] | non-associate primes, rank 2, e=1; γ²=−1/3 scalar, e=2, centralizers of dimension 2 and 4; δ_D²=−5, inverse transpose squared −1/5 | keep |
| §4.9 Check 2 | norm-one torus of Q₂₅/Q₅, N(z)=5 | norms have even valuation, v(5)=1; over Q₂₅ the point (5,1) | framing degree 2 |
| §5.3 Checks | Q(√2), Q(√−2), Q(i), Q(√−11) at 5 | 2, 3 non-squares; −1≡4, −11≡4 squares; centre rank 2+2−1=3 | keep |
| §5.4 Check 2 | ψ=Tr(i·xȳ/2); y²=x³+x over F₃ | ψ(1,i)=Tr(1/2)=1; counts 1,0,2, #E=4, trace 0; (2y)²=−y², 2 of order 4 mod 5 | keep |
| §6.3, top stratum | zero-dimensional torus component | constant map A¹→{x}, marked point 0, all of A¹ ordinary | Example consistent |
| §7.1 Check 4 | Q(i), 3 and 7 inert | unit norms onto Z_v^×; image G(Z₃), intersection of index 2 | image, not intersection |
| §7.2 Check 1 | g=diag(1,1/5) | T²−(6/5)T+1/5 | keep |
| §7.6 headline | KZ line 2104–2106; KZ line 2433–2439 | residue field with a degree-one prime over almost every ℓ is Q; Conj(G)(Q)→Conj(G)(Q_ℓ) injective | unique |
| §3.8, §4.7, §4.13, §5.9, §5.10, §6.3 headlines | KPZ line 3735–3763, HT line 915–925, 1095–1105, KZ line 1900–1903, 2038–2042, 2322–2327 | hypotheses in the README equal the sources', except the lattice of R01, on which §§5.9–5.10 depend through §5.4 | R01 |

**Pinned declarations opened** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the pins of the manifest): `WittVector.Isocrystal` (Mathlib/RingTheory/WittVector/Isocrystal.lean:112), `Isocrystal.frobenius` (:124); `TauCeti.AlgebraicGeometry.AbelianVariety` (AbelianVariety/Basic.lean:95); `AbelianVariety.End` (End/Basic.lean:74, `Additive (A ⟶ A)`); `Matrix.transpose_mul_J_mul_eq_det_smul` (SymplecticMultiplier.lean:63); `TauCeti.reductiveCommHopfAlgProperty` (Reductive/Basic.lean:71); `conjugationAlgHom` (Hopf/Conjugation.lean:66), `productMap_comp_conjugationAlgHom` (:107), `conjugationAlgHom_counit_left`, `_counit_right`, `_coassoc` (:176, :196, :248); `TauCeti.ComoduleAlgebra.coinvariants` (ComoduleAlgebra.lean:136). All exist where cited. A search of both pins for Shimura varieties, parahorics, Newton strata and conjugacy quotients finds no declaration. No backticked name in the README is presented as this roadmap's own.

**Lean.** `lake env lean` on `packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. One `import Mathlib`, one module docstring, the namespace, 0 declarations; the one-tactic probe and the `#check @name` comparison have 0 inputs. No `set_option`, no sorry'd data, no padding possible.

**Headlines.** Seven, from the README's last scope paragraph: §3.8 (KPZ Theorem 7.2.21), §4.7 with §5.4 (HT Corollary 1.3.16, KZ Theorem 4.4.4), §4.13 (HT Corollary 2.1.9), §5.9 (KZ Theorem 4.4.6), §5.10 (KZ Corollary 4.4.13), §6.3 (KZ Corollary 5.2.7), §7.6 (KZ Theorem 5.1.4). Each is named in the module docstring with the carrier it lacks; none is statable at the pins; no stand-in is used.

**Suppliers.** The resolver lists nothing unresolved. I resolved all 118 cited headings again at the current heads (24 suppliers: 6 on main, 18 at open heads): every section and layer cited exists under the cited number. Texts read for what the README says of them: ArithmeticGaloisRepresentations §1.11, paragraph *Reductive quotients over fields and DVRs* (Conj_H, χ_H, flat base change, semisimple classes); ReductiveGroupsPartIII §§0.5, 0.6, 1.2, 3.5 (§3.5 is stated over number fields, so the contract for a field of characteristic zero asks for more than it has); BunGAndNewtonStrata §1.28 (both directions); GlobalShtukasAndFunctionFieldLanglands §6.2 (irreducible sheaves only); GeometricSatakeAndFusionPartII §§3.1, 3.7, 7.6 (normal special-fibre components in §3.1; no irreducibility at very special level); ReductiveGroupsPartII scope (R-smoothness is outside it) and §RG2.3.2. No never-cite roadmap is cited. This roadmap is at 363 in the merge order; its last supplier, GlobalShtukasAndFunctionFieldLanglands, at 360.

Dependency check, prescribed command with `--movable`, exit 0:

```text
depcheck: 259 roadmaps, 2485 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Gaps.** 21 slugs in the README, 21 contracts, 21 entries in `design/plan.json`; the three sets are equal and each contract names the plan's supplier. None is found at its supplier's head (no slug occurs there), and none asks for what a supplier already states: ShimuraCompactifications mentions lattice chains only in an example, PELModuli not at all, ShimuraData Layer 4 has no multiplier sequence, AlgebraicModuliForArithmeticGeometry no Bertini theorem. An acceptance of a later round would be conditional on these 21 gaps.

**Shape.** Every target has a `*Needs:*` line and a locator; every Definition and Construction has an API list and at least three Checks; every layer ends with Examples and Dependencies. Residue search (LaTeX delimiters, pull-request numbers, round labels, machine paths, "optional", "deferred", "so far", HTML anchors, target-numbering blocks): no hit; the two occurrences of "lemma" are prose (Krasner's lemma, the unit-eigenvalue lemma).

**Duplication and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id defined only by a revision and no second copy. By object over main and the open heads: "strongly acceptable" occurs in ReductiveGroupsPartIII (as an imported hypothesis) and in an unrelated sense in two arithmetic-statistics roadmaps; no roadmap states integral models of abelian type or lattice-chain Siegel moduli; Kottwitz–Rapoport strata are named only as a consumer note of GeometricSatakeAndFusionPartII. The one duplicate found is the quasi-tame definition (R02). `Suggested.lean` declares no name.

Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, PELModuliPartII, ReductiveGroupsPartII and AbelianSchemesAndArithmeticModuli (the third list is empty); one object shared: quasi-tame groups, owner ReductiveGroupsPartII §RG2.3.2 (R02). Otherwise nothing shared: very-good embeddings and adapted lifts are owned by the first, local models and same-field Schubert curves by the second, Conj′ and the abelian-variety application by the third, B(G) by the fourth, unitary formal and integral moduli by the fifth, fixers and parahorics by the sixth, Tate modules and Serre–Tate theory by the seventh.

**Copyright.** Wording: 21 passages set beside the source lines: the 15 sampled, and the new §5.5 paragraph against KZ line 1963–1972, the quasi-tame convention against KPZ line 713–715, the H^♯ sentence of §2.3 against KPZ line 3360–3362 and 3373–3374, the §4.5 sketch against HT line 653–683, §3.9 against KPZ line 3768–3780, and the first docstring item of `Suggested.lean` against KZ line 2104–2106. The longest shared runs are forced phrases of five or six words ("a tamely ramified extension of", "standard representation of the orthogonal group"). Arrangement: KZ runs §2.4, §3, §4.1, 4.2, 4.3, 4.4, 5.1, 5.2, 5.3, 6. Its §4.1 is spread over Layers 0, 1, 4 and 5; Layers 1, 3 and 4 rest on KPZ, KP and HT; Layer 5 joins KZ §4.3, §4.4 and Theorem 4.1.11; Layer 7 joins KZ §5.1 and §5.3 after §5.2. The order of Layers 4 to 7 is forced (§5.6 needs §4.13; §6.3 needs §5.4; §7.4 needs §5.10 and §6.3). No table, figure or list of examples is taken over.

Source independence: 21 passages compared with 4 sources (KZ, HT, KPZ, KP), none shared; largest share KZ, 37 of 65 locator lines; contents compared with KZ: independent. K17 was not opened this round.

## Not verifiable

- K17 (three locator lines, §§4.9, 4.10, 4.12) was not re-read this round; the round-12 review read §2.1.2 at K17 line 1281.
- The published versions of KZ (Annals), HT (Duke) and K17 (JAMS) were not collated with the preprint or author versions `sources.toml` records; locators are for the recorded versions.
- The 21 declared supplier gaps are contracts; their future proofs cannot be checked here.
- Whether the Newton class and I_x of a point depend on the chosen Hodge embedding was not settled; the README asserts no independence.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), p.34: the source says the inertia coinvariants of the cocharacters of G^ab are torsion; it should be torsion-free, as Lemma 4.2.4 and its use on p.41 require; affects nothing.
- **Gap** in KZ at the proof of Lemma 4.3.8(1), p.40: the source applies the multiplier sequence of the cited KPZ lemma to the matched group; that lemma assumes a simple adjoint group, though its proof does not use it; affects the proof.
- **Gap** in KZ at §4.4.9, pp.44–45: the source forms the isogeny group of the matched point "in the same way" for a product abelian scheme not coming from the embedding that defines that model; it should pass through the normalized image, as in §4.4.1; affects the proof.
- **Misprint** in KZ at §4.4.2, p.43: the source indexes the strata by the acceptable set of G; it should be that of G_2; affects nothing.
- **Misprint** in KZ at §4.4.5, p.43: the source writes the étale tensors preserved by the isogeny group with the crystalline index 0; it should be the ℓ-adic tensors at the point, as in §4.1.10; affects nothing.
- **Misprint** in HT at §2.1.3, p.21: the source defines the integral isogeny group as the Q_p-points meeting Aut; it should be the Q-points meeting Aut, as in the proof of Lemma 2.1.4, p.22; affects nothing.
- **Misprint** in HT at Proposition 1.2.5, p.14: the statement takes the basic class of the Hodge cocharacter of x; it should be that of its inverse, as the proof and Proposition 1.3.10 use; affects nothing.
- **Gap** in HT at the proof of Proposition 1.3.10, p.18: the source fixes any place of the torus reflex field above v; it should be the place induced by the fixed p-adic embedding, which defines the class; affects the proof.

## For the human reviewers

- Licence: `sources.toml` records HT and K17 from author pages (`licence_class = "author-page"`) and KZ from arXiv v2, not collated with the Annals version (its `version_note`); the published texts were not read.
- Scope: the roadmap states 21 supplier gaps on 11 other roadmaps (`packages/ShimuraVarietiesPartII/README.md`, Exact supplier contracts); its headline theorems hold only once those suppliers accept them.
- Scope: this roadmap asks ReductiveGroupsPartIII for the R-smooth torus and stabilizer-immersion theorems (three `gap:rg3-…` contracts); GeometricSatakeAndFusionPartII asks ReductiveGroupsPartII for them (`gap:r-smooth-full-fixer-embeddings`, its README line 77); ReductiveGroupsPartII on main lists them outside its scope (lines 85–99).
- Scope: gap:siegel-chain-moduli here and PELModuliPartII's gap:bad-prime-projectivity (its README line 368) both ask ShimuraCompactifications Layer 7 for lattice-chain moduli of abelian schemes; whether that supplier states one target for both is its owner's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "15f1c524b6594d1ab235a9f5b7ab75d56da25571", "job": "REV-PKG-ShimuraVarietiesPartII~13", "model": "fable", "worker": "chris-x29"} -->
