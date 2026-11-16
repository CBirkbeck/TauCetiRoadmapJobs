<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6911086709 -->
Review (claude) of 40d2407

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Newton strata, the ordinary locus and I_x are not defined on the strongly acceptable model

   **Location.** `packages/ShimuraVarietiesPartII/README.md:1169` (§5.9): "For every ordinary geometric point x on a strongly acceptable triple's integral model, there exists an integral lift … whose abelian fibre carries a lift of I_x(Q)". Also `README.md:932` (§4.7): "In particular the corrected very-special strongly acceptable model has dense ordinary locus."

   **Claim.** The ordinary locus, the class [b_x] and the group I_x of a point of the model of a strongly acceptable triple are objects the roadmap has defined.

   **Witness.** `README.md:823` defines [b_x] "For x on the geometric special fibre of the Hodge model"; §0.5 and §4.8 likewise. The strongly acceptable model is the descent of §3.8, not a §0.1 normalization. KZ line 1862–1872 and line 1875–1884 make the definition, through a fixed ι_2.

   On the roadmap's own example, GU(1,1) of Q(i) at p=5: its model (§3.8) is assembled from pieces of an auxiliary cover (G_1,X_1), so it carries no abelian scheme until the Siegel map of §5.4 for a chosen ι_2. Hence "ordinary" in §§5.9, 5.10, 6.1 (Check 2), 6.3 and 7.4 has no referent, the statements of §§5.9–5.10 do not say which ι_2 the ordinary locus and I_x are formed for, §5.6 uses I_(x_2) and §4.13 at a point of that model, and the last sentence of §4.7 (Layer 4) needs §5.4 (Layer 5).

   **Exact repair.** Keep the numbering; add the missing construction to §5.4 and move the forward clause.

   1. §4.7: delete the sentence "In particular the corrected very-special strongly acceptable model has dense ordinary locus." Remove "§3.6" from the `*Needs:*` of §4.7 and from the Layer 4 Dependencies (no other target of Layer 4 uses it).
   2. §5.4, after its Remark, add:

      > **Construction.** Fix for a strongly acceptable triple (G_2,X_2,G_2°) a Hodge embedding ι_2 with self-dual lattice as in the theorem above, and let A_2 be the pullback of the universal abelian scheme to S_(K_2) by its integral Siegel map. At neat level this map factors through the normalization N, in Sh_(K_2)(G_2,X_2), of the Zariski closure of its image, because S_(K_2) is normal and flat; A_2 is pulled back from N. Form the étale tensors (§0.4), the lift-independent crystalline tensors (§0.5) and the crystalline tensor functor (§0.6) for A_2 on N and pull them back: two lifts of one point of S_(K_2) map to two lifts of one point of N, so lift-independence holds on S_(K_2). For a point x of S_(K_2), the class [b_x]∈B(G_2,Qp,{μ_(h_2)⁻¹}), the Newton strata, the ordinary locus and the groups I_x and I_(x/Fq) are those of §§4.1, 4.3, 4.6 and 4.8 for A_2 with these tensors, and §§4.2, 4.4, 4.5 and 4.9–4.13 hold for them with the same proofs. They are formed for the fixed ι_2; independence of ι_2 is not asserted. At a level that is not neat they are formed on a neat normal cover and descend. Layers 5, 6 and 7 use them in this sense.
      >
      > (KZ, §4.4.1–4.4.2, pp.42–43; §4.4.5, p.43.)
      >
      > **API.**
      >
      > - For the auxiliary datum with its own embedding ι_1, N is the model itself and the construction returns the objects of Layers 0 and 4.
      > - Under the maps j_1, j_2 of §5.5 the identification A_3≅j_1^*A_1×j_2^*A_2 matches the tensors, so [b_(x_3)] maps to [b_(x_1)] and [b_(x_2)], and x_3 is ordinary exactly when x_2 is (BunGAndNewtonStrata §1.28).
      > - The strata and the groups I_x are compatible with prime-to-p level change and Hecke translation.
      >
      > **Checks.**
      >
      > - For GU(1,1) of Q(i) at p=5 with ι_2 on Q(i)², O_E⊗Z_5=Z_5×Z_5 splits A_2[5^∞] into H×H∨ with H of height 2 and dimension 1; x is ordinary when H has slopes (0,1) and basic when (1/2,1/2). Both occur, as the Check of §6.1 uses.
      > - For the torus Res_(Q(i)/Q)G_m at p=5, B(T,{μ⁻¹}) is one class, so every point is ordinary: the curve y²=x³+x over F₅ has trace 2, prime to 5.
      > - The model of §3.8 for GU(1,1) is assembled from an auxiliary cover; the auxiliary A_1 lives on S_(K_1), not on S_(K_2). Reading "ordinary" from A_1 defines it only at points in the image of j_2, where it agrees with this construction by §5.5.
      >
      > **Theorem.** At neat K_2^p the geometric special fibre of S_(K_2) is locally integral and its ordinary locus, formed for ι_2, is open and dense.
      >
      > (KZ, Theorem 4.4.4, p.43.)
      >
      > *Proof sketch.* The geometric special fibre of the local model is integral at very special level (gap:local-models), so that of S_(K_2) is locally integral by §3.10. Openness is §4.4; nonemptiness is §4.5, G_2,Qp being quasi-split. Each connected component of S_(K_2) over the maximal unramified extension is a quotient of a connected component of the auxiliary Hodge model (the pieces of §3.6), whose special fibre is irreducible by §1.9 and gap:component-specialization; so its special fibre is irreducible. An isogeny between two characteristic-zero points matching the étale tensors matches the crystalline tensors of the reductions, and G_2(A_f) permutes the connected components transitively.

   3. Extend the `*Needs:*` of §5.4 by: §0.4; §0.5; §0.6; §1.9; §3.6; §3.8; §3.10; §4.1; §4.2; §4.3; §4.4; §4.5; §4.6; §4.8; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); ShimuraCompactifications Layer 7 (gap:component-specialization); BunGAndNewtonStrata §1.28. Add the same items to the Layer 5 Dependencies.
   4. Add "§5.4" to the `*Needs:*` of §5.6 and §5.9. In §6.3 replace "§4.7" by "§5.4" in `*Needs:*` and in the Layer 6 Dependencies.
   5. In "How to read the build", after "Layer 5 proves integral functoriality", insert ", carries the Newton strata and isogeny groups of Layer 4 to strongly acceptable models through a chosen Hodge embedding,".

   **Repair test.** On GU(1,1), Q(i), p=5: after the repair "ordinary point of S_(K_2)" means that the factor H of A_2[5^∞] has slopes (0,1), which is defined at every point; the Checks of §6.1 and §6.3 have a referent; §4.7 no longer refers to Layer 5. The steps of the proposed construction were checked at KZ line 1862–1872 (pullback along the Siegel map, lift-independence through the normalization of the image), KZ line 1875–1884 (the class and strata), KZ line 1897–1898 (I_x) and KZ line 1887–1896 (density), and the component description at KPZ line 3836–3845. The plan's `gaps` list is unchanged: both gaps named are already declared, and component-specialization is applied to the auxiliary model, a Layer 0 Hodge model, as its `needs` says.

2. **F02** (P3) the manifest does not record §3.8 for KZ

   **Location.** `packages/ShimuraVarietiesPartII/sources.toml`, entry `KZ`, `cited_for`: "…, "§2.1", "§2.6", "§3.10", "§§4.1, 4.6–4.8", …".

   **Claim.** `cited_for` lists every place that cites KZ.

   **Witness.** `README.md:751` (§3.8): "KZ §4.1.5, p.30, and §4.3.5, p.40, for levels that are not sufficiently small". The list has §3.10 and no §3.8. The other four entries agree with the README section by section (computed section by section for all five ids).

   **Exact repair.** In the `KZ` entry replace `"§3.10"` by `"§3.8", "§3.10"`. The locator already covers §§3–5. Tested: with that element the set of README sections citing KZ equals the set the list covers.

Two findings: R01 (P2) and R02 (P3); one is blocking. Both findings of round 10 are repaired and the repaired passages pass the adversarial pass. R01 is new: it comes from following the objects of the headline theorems §§5.9, 5.10 and 6.3 back to their definitions. This review changed no authored file and fetched no source (`sources.toml` is unchanged; no `needs-references.toml` was written). No maintainer notes were supplied.

## Previous findings, verified first

| Finding (round 10) | Repaired passage | Status |
|---|---|---|
| F01 (P2), §§5.2–5.3 use gap:multiplier-exact-sequences outside its hypothesis | `packages/ShimuraVarietiesPartII/README.md:63`: "For a Hodge-type datum (G,X), with no simplicity hypothesis on G^ad, with G^c generated by G^der and the largest compact subtorus Z_(G,0) of Z_G …". The same sentence is the `needs` of the entry in `design/plan.json`. `README.md:1094` now names the datum: "The multiplier sequence of the Hodge-type datum (G_3,X_3) with its embedding ι_3, whose adjoint group G_2^ad need not be Q-simple". `README.md:1103` is the new Check. | **Repaired.** KZ line 1786–1787 applies the lemma to G_3; KPZ Lemma 7.2.5 is stated after assuming simplicity. I recomputed the widened statement (rows below). |
| F02 (P3), "good" cited to the section that defines "very good" | `README.md:21`: "Good is the notion of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1 (the map of the scheme local model to the Grassmannian is a closed immersion) and very good that of its §2.10". `README.md:83` begins with §2.1; `README.md:9` reads "states goodness (§2.1), very-goodness (§§2.10–2.11)"; §2.1 is in the `*Needs:*` of §§0.1, 1.2, 1.3, 5.1, 5.3, 5.7, 5.8 and in the Layer 0, 1, 5 Dependencies. | **Repaired.** At that roadmap's open head §2.1 "Integral tensor and local-model datum" reads "It is good when the induced map from the scheme local model … to Gr(d,Λ) over O_E is a closed immersion"; §2.10 starts from a supplied good embedding. |

No finding of the last repair report was marked not actionable; nothing is re-raised. The repaired pattern (a supplier contract applied outside its stated hypothesis) was looked for in the other 20 contracts against the sections that use them; none recurs.

## Verified sound

**Coverage.** The whole README was read this round (1401 lines; 63 numbered targets in 8 layers), with `Suggested.lean`, `metadata.toml`, `sources.toml` and the `gaps` list of `design/plan.json`.

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no copied passage, no computational algorithm, no sorry'd data, no `set_option`.

**Seeded source sample: 15 of 15 read at their locators.** The author flags no locator as unverified.

| Target | Locator as read | Result |
|---|---|---|
| 0.1 | KZ §4.1.2–4.1.7, pp.29–31 (KZ line 1257–1340); KPZ §7.1.2, p.72 (KPZ line 3168–3190); Theorem 7.1.8, p.74 (KPZ line 3254–3261) | supported: closure then normalization; Λ in its ψ-dual; chain-level Siegel scheme |
| 0.6 | HT Proposition 1.3.12, Corollary 1.3.13, p.19 (HT line 856–884); Corollary A.7, p.39 (HT line 1794–1807) | supported; the functor factors through the generated category, no equality of groups is used |
| 1.1 | KZ §4.1.7 with (4.1.7.1), pp.30–31 (KZ line 1331–1355) | supported: integral tensors, the frame, cocharacter conjugate to μ_h⁻¹ |
| 3.1 | KP §4.5.6, p.195 (KP line 2982–3010); §4.6.1–4.6.4, pp.197–199 (KP line 3091–3166) | supported: the star quotient, closure of Z(Z_(p)) in G(A_f^p), completion description (Lemma 4.6.4(2)); KP's connected-centre hypothesis is covered by (E) |
| 3.4 | KP Lemmas 4.5.2, 4.5.4, 4.5.7, 4.5.9, pp.194–197 (KP line 2954–3090) | supported: twist by the central torsor, level γK^pγ⁻¹, lift to the adjoint frame torsor |
| 3.5 | KP §4.6.5, Lemmas 4.6.6, 4.6.9, pp.199–201 (KP line 3167–3256) | supported: the extension by A_int° and the star-product isomorphism |
| 3.7 | KP proof of Corollary 4.6.15, pp.203–204 (KP line 3313–3388); Corollary 4.6.18, p.205 (KP line 3391–3413); KPZ §7.3.1(3), pp.86–87 (KPZ line 3826–3845) | supported: Δ acts freely; "need not be finite" is KP line 3408–3409 |
| 3.8 | KPZ Theorem 7.2.21, pp.84–85 (KPZ line 3735–3763); Proposition 7.1.14, pp.75–76 (KPZ line 3317–3337); KZ §4.1.5, p.30 (KZ line 1298–1303); §4.3.5, p.40 (KZ line 1751–1754) | supported; no (NE) hypothesis in the theorem |
| 4.2 | HT Lemma 1.3.9, p.18 (HT line 818–821) | supported |
| 4.8 | HT §2.1.3–2.1.5, pp.21–22 (HT line 969–1027); KZ §4.1.10, p.32 (KZ line 1392–1411) | supported; the README's I_x(Q)∩Aut is the form used in the proof of Lemma 2.1.4 (see Source issues) |
| 4.9 | HT §2.1.5–2.1.7, (2.1.7.1)–(2.1.7.2), pp.22–24 (HT line 1011–1078); K17 §2.1.2, p.29 (K17 line 1281–1300) | supported: a frame over Q_(q^m) for m sufficiently divisible, the norm of length rm |
| 5.4 | KZ Proposition 4.3.6, p.40 (KZ line 1767–1769); §4.3.7–4.3.8, pp.40–42 (KZ line 1770–1860) | supported |
| 5.8 | KZ Theorem 4.1.11, Remark 4.1.12, pp.32–33 (KZ line 1412–1437) | supported: very good at y, existence only, no uniqueness |
| 5.10 | KZ Corollary 4.4.13, Remark 4.4.14, p.46 (KZ line 2037–2056) | supported: conjugate in G(Q_ℓ) for ℓ≠p, elliptic over R, the exact q-Frobenius |
| 7.1 | KZ §5.1.1–5.1.2, p.47 (KZ line 2063–2090) | supported: (5.1.1.1) is Isom(V_Qℓ, dual of H¹), the H₁ convention of the README; KZ assumes a product level |

Also read: KZ Definition 4.2.2, Proposition 4.2.3, Lemma 4.2.4 (KZ line 1481–1516); KZ §4.4.1–4.4.11 (KZ line 1862–2011); KZ §5.1.3, Theorem 5.1.4 (KZ line 2091–2106); KPZ Theorem 7.1.3 and proof (KPZ line 3191–3236); KPZ §7.1.10–7.1.12, Corollary 7.2.24; HT Proposition 1.3.10, Theorem 1.3.14, §1.3.15, Corollary 1.3.16, Lemma 2.1.4, Proposition 2.1.6, §2.1.8, Corollary 2.1.9; K17 Corollary 2.1.7 (K17 line 1381–1393).

**Adversarial table** (repaired passages, the sample, the headlines, the targets of the findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Widened gap:multiplier-exact-sequences | GSp_(2g); GU(1,1) of Q(i); common-multiplier subgroup for Q(i), Q(√−11) | 1→μ₂→G_m→G_m→1 with t↦t²; ranks 2=1+1; ranks 3=2+1 with Z={(a,b): N a=N b} | exact in all three |
| Same, the splitting of the weight | X_*(Z_G°)⊗Q under complex conjugation c | +1 eigenspace is Q·w_h (compactness modulo the weight); on a Galois-stable complement c and its conjugates act by −1 | Z_(G,0) defined over Q; G=G^c·w_h(G_m) |
| Same, kernel of c | w_h(−1)=h(−1) | image of compact connected h(U_1) in a quotient of G_m is trivial | ker c=G^c |
| Product clause, negative control | GU(1,1)×GU(1,1) | centre rank 4, multipliers onto G_m×G_m | no single-G_m sequence; common multiplier needed |
| §5.3 new Check | p=5, Q(i), Q(√−11) | −1≡4=2², −11≡4=2² mod 5: both split; G^der_Q5=SL₂×SL₂; Z^c_Q5=G_m² | strongly acceptable; two Q-simple adjoint factors |
| §5.3 Check 2 | K′=Q(√−2), x=a+b√−1 | trace form 2(Ψ(a,h(i)a)−Ψ(b,h(i)b)); a=b gives 0 | indefinite |
| Conventions, §0.4, §7.2 | E: y²=x³+x over F₅ | x³+x at 0..4: 0,2,0,0,3; squares mod 5 are 0,1,4; points 1,0,1,1,0; #E=4, trace 2; H¹: T²−2T+5; tower: T²−(2/5)T+1/5 | keep |
| Same over F₂₅ | α²+ᾱ² | 2²−2·5=−6; tower T²+(6/25)T+1/25 | keep |
| Conventions, norm Check | ζ of order 24, σ(ζ)=ζ⁵ | ζ·ζ⁵=ζ⁶, ζ²≠ζ⁶; dual ζ⁻⁶=ζ¹⁸; ζ¹⁸/ζ⁶=ζ¹²=−1 | norm ≠ power, norm ≠ crystalline matrix |
| §4.9 Check, supersingular | E: y²=x³−x over F₃ | x³−x at 0,1,2: 0,0,0; #E=4, trace 0; π²=−3; characters killing γ: a+b=0, b even; X^*(S)≅Z⊕Z/2 | e=2, S°=scalars |
| §4.9 Check, matrix | δ_D=[[0,−1],[5,0]] | δ_D²=−5; δ_D⁻ᵀ=[[0,−1],[1/5,0]], square −1/5; centralizer over Q₅ is Q₅(√−5)^×; over Q₂₅ the norm is scalar | keep |
| §4.9 Check, torsor | N(z)=5 for Q₂₅/Q₅ | norms have even valuation, v(5)=1; over Q₂₅: uv=5, point (5,1) | framing degree 2 |
| §4.8 Check | p⁻¹=f/n, p∤n | deg[n]=n^(2d), deg([p]∘f)=p^(2d)·deg f | p⁻¹∉I_x(Z_(p)); ℓ⁻¹∈I_x(Z_(p)) |
| §3.1 definition | KP line 3137–3147 | numerator G(A_f^p)/closure of Z(Z_(p)); amalgam over G°(Z_(p))_+/Z(Z_(p)) with G_ad°(Z_(p))_+ | agrees |
| §3.4 Check 3 | γ=diag(ℓ,1) | γ[[a,b],[c,d]]γ⁻¹=[[a,ℓb],[c/ℓ,d]]; b=1 gives [[1,ℓ],[0,1]], c=1 gives [[1,0],[1/ℓ,1]]∉GL₂(Z_ℓ) | level is γK^pγ⁻¹ |
| §3.8 Check 3 | scalar i in GU(1,1), Q(i), p=5 | i·ī=1; Z(Q)∩K⊂{±1,±i}; a neat level contains none of i, −1, −i | inertia ⊇ Z/4 |
| §3.8 headline | KPZ line 3735–3763 | all abelian type, p>2, every connected parahoric; (NE) only for the Gad,°-reduction | hypotheses stated |
| §3.10 Check | GU(1,1) curve | dim G=5, dim G_ad=3; frame spaces 1+3=4, 1+5=6 | keep |
| §0.1 Check 2 | E×E, E: y²=x³−x over F₃ | ker F=α₃×α₃, order 9 in A[3] of order 81, isotropic; order-3 subgroups form a P¹ | chain fibre of dimension ≥1 |
| §7.1 Check 4 | Q(i), primes 3, 7 | both ≡3 mod 4, inert; unramified norm onto Z_v^×; image of K^p at 3 is G(Z₃); K^p∩G(Q₃)=ker(χ₃∘ν), index 2 | image, not intersection |
| §7.1, freeness | Z_G(Q)∩K at neat K^p | discrete ∩ compact is finite; torsion; neat | trivial; fails for Res_(F/Q)GL₂ (units ≡1 mod N infinite) |
| §7.6 headline | KZ line 2104–2106; uniqueness | Conj(G)(Q)→Conj(G)(Q_ℓ) injective; inversion carries (2/5,1/5) to (2,5) | keep |
| §4.13 headline | HT line 1095–1109 | equal images in Conj′ give centralizers of equal dimension; I_ℓ connected | keep |
| §5.10 headline | E/F₅ | γ₀ with (trace, det)=(2/5,1/5); T(R)/R^× compact | keep |
| §4.7 headline | HT line 911–925 | Hodge model, locally integral, class exists: open, nonempty, dense | sound for Hodge models; last sentence is R01 |
| §5.9, §6.3 headlines | GU(1,1), Q(i), p=5 | model built from the auxiliary cover; no abelian scheme before §5.4; no ι_2 named | R01 |
| KZ `cited_for` | numbered sections citing KZ | §§0.1–0.4, 1.1–1.3, 1.9, 2.1, 2.6, 3.8, 3.10, 4.1, 4.6–4.8, 5.1–5.10, 6.1–6.3, 7.1–7.6; the list has all but §3.8 | R02 |

**Pinned declarations opened** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the checked-out heads of the pinned packages): `WittVector.Isocrystal` (Mathlib/RingTheory/WittVector/Isocrystal.lean:112), `Isocrystal.frobenius` (:124); `TauCeti.AlgebraicGeometry.AbelianVariety` (AbelianVariety/Basic.lean:95); `AbelianVariety.End` (End/Basic.lean:74, `Additive (A ⟶ A)`); `Matrix.transpose_mul_J_mul_eq_det_smul` (SymplecticMultiplier.lean:63, under `[Unique l]`); `TauCeti.reductiveCommHopfAlgProperty` (Reductive/Basic.lean:71); `conjugationAlgHom` (Hopf/Conjugation.lean:66), `productMap_comp_conjugationAlgHom` (:107), `conjugationAlgHom_counit_left`, `_counit_right`, `_coassoc` (:176, :196, :248); `TauCeti.ComoduleAlgebra.coinvariants` (ComoduleAlgebra.lean:136). All exist where cited. No backticked name in the README is presented as this roadmap's own. A search of both pins for `Shimura`, `Parahoric`, `BruhatTits`, `NewtonStrat` finds only prose mentions of Shimura's book in the Hecke-ring files: no carrier.

**Lean.** `lake env lean` on `packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. One `import Mathlib`, one module docstring, the namespace, 0 declarations. The one-tactic probe and the `#check @name` comparison have 0 inputs; nothing changed. No `set_option`, no sorry'd data, no padding possible.

**Headlines.** Seven: §3.8 (KPZ Theorem 7.2.21), §4.7, §4.13 (HT Corollary 2.1.9), §5.9 (KZ Theorem 4.4.6), §5.10 (KZ Corollary 4.4.13), §6.3 (KZ Corollary 5.2.7), §7.6 (KZ Theorem 5.1.4). Each is named in the module docstring with the carrier it lacks; none is statable at the pins; no stand-in is used.

**Suppliers.** The citation resolver on the README against main and 455 open heads: nothing found nowhere. I resolved every cited heading at the heads this round: ShimuraVarieties §§4.5, 5.6, 6.3–6.6, 7.0i, 8.1; ShimuraData Layers 1, 4; PELModuli §§M2.8, M4.5–M4.6, M6.1–M6.4; AbelianSchemesAndArithmeticModuli §§A4.1, A4.3, A4.8, A4.9, A6.7, A6.14, A6.20–A6.22, A6.28–A6.29; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2; its Part II §§2.1, 2.10, 2.11, 3.13–3.17, 4.3, 4.4, 4.12, 6.4, 6.5; GeometricSatakeAndFusion Layer GS0; its Part II §§0.6, 1.4, 2.8, 3.1, 3.4, 3.7, 5.5, 7.6, 7.7; ReductiveGroupsPartII Layers RG2.0, RG2.1 (*steinberg-quasi-split*), RG2.3; ReductiveGroupsPartIII §§0.5–0.7, 1.2, 1.3, 2.3, 2.5, 3.5, 5.3a, 5.4–5.9; BunGAndNewtonStrata §§0.6, 0.8, 1.16, 1.22–1.26, 1.28, 1.29, 1.34, 1.37, 1.39, 2.16; HeckeStacksAndLocalShtukas §§HS2.1, HS2.10, HS2.11, HS2.13; CrystallineCohomology §§CR.7.1, CR.7.3; PadicDifferentialEquationsAndRigidCohomology §§RD.3.43, RD.5.116; PadicHodgeTheory §5.5; MotivesAndAlgebraicCycles Layer 6, §6.3; AutomorphicBundles §§3.4–3.8; SchemeAndStackFoundations §§1.17–1.23; AlgebraicModuliForArithmeticGeometry Layers 1, 4, 6; ArithmeticGaloisRepresentations §1.11 (the paragraph *Reductive quotients over fields and DVRs*, with its conjugation case Conj_H and χ_H), §§5.1, 5.13, Layer 6; GlobalShtukasAndFunctionFieldLanglands §§6.1, 6.2; NeronModelsAndSemistableAbelianVarieties §§5.1, 5.2; ShimuraCompactifications Layer 7, §7.18; IgusaVarietiesAndTorsionConcentration §§0.1, 0.2, 0.12. All exist. The texts of FiniteFlatGroups Part II §2.1, GeometricSatake Part II §7.7, ArithmeticGaloisRepresentations §1.11, ReductiveGroupsPartIII §§3.5 and 5.5 were read and state what the README says of them. No never-cite roadmap is cited. ReductiveGroupsPartII and SchemeAndStackFoundations are on main; every other supplier is earlier in the merge order (this roadmap is at 363, its last supplier at 360).

Dependency check, prescribed command with `--movable`, exit 0:

```text
depcheck: 254 roadmaps, 2420 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Gaps.** 21 slugs in the README, 21 contracts "What X must provide (gap:…)", 21 entries in `design/plan.json`; the sets are equal, each with a named supplier and section. Minimality was spot-checked at the suppliers' heads by object: no Bertini statement or rational-point presentation in AlgebraicModuliForArithmeticGeometry; no multiplier sequence, matched fibre product or fundamental embedding in ShimuraData; no R-smooth statement in ReductiveGroupsPartIII; no Blasius–Wintenberger comparison in ShimuraVarieties; no lattice-chain Siegel moduli or Hodge-type component statement in ShimuraCompactifications (its §7.18 says nothing is asserted for general Hodge-type data); no parallel-transport statement in CrystallineCohomology; no integral local Shimura variety in HeckeStacksAndLocalShtukas; Noot's Conj′ comparison is stated by no roadmap (NeronModelsAndSemistableAbelianVarieties §6.0 is his specialization theorem, a different result). The acceptance of a later round would be conditional on these 21 gaps.

**Shape.** Every target has a `*Needs:*` line and a locator; every Definition and Construction has an API list and at least three Checks; every layer ends with Examples and Dependencies. The construction R01 adds comes with its API and three Checks. Residue search (LaTeX delimiters, pull-request numbers, round labels, machine paths, "optional", "so far", "current", HTML anchors, target-numbering blocks, `lemma`): two hits, the prose "Krasner's lemma" (§5.3) and "the unit-eigenvalue lemma" (§7.4), neither a keyword.

**Duplication and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id defined only by a revision and no second copy. The board's package index lists AnalyticNumberTheory and LawrenceVenkateshMethod, neither on this subject. By object over main and the open heads: "Theorem 7.2.21" and "integral models of abelian type" occur in no other roadmap; "strongly acceptable" only in ReductiveGroupsPartIII (as the hypothesis it imports) and in an unrelated sense in two arithmetic-statistics roadmaps; KZ Theorem 5.1.4 is named in ReductiveGroupsPartIII, whose scope says it is not proved there and enters as the hypothesis of its §5.5. GlobalShtukasAndFunctionFieldLanglands and BallQuotientsAndComplexHyperbolicLattices mention this roadmap as a consumer, citing no id of it. `Suggested.lean` declares no name.

Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, IgusaVarietiesAndTorsionConcentration, ReductiveGroupsPartII and AbelianSchemesAndArithmeticModuli (the third list is empty); nothing shared: good and very-good embeddings and adapted lifts are owned by the first, local models and same-field Schubert curves by the second, Conj′ and the abelian-variety application by the third (which disowns KZ Theorem 5.1.4), B(G) by the fourth, PEL Newton strata by the fifth, fixers and parahorics by the sixth, Tate modules and Serre–Tate theory by the seventh.

**Copyright.** Wording: 23 passages set beside the source lines: the 15 sampled, and §2.1 against KZ line 1481–1490, §4.12 against K17 line 1383–1393, §4.7 against HT line 915–925, §5.6 against KZ line 1973–1993, §3.6 against KPZ line 3826–3845, §5.2 against KZ line 1770–1781, §0.2 against KZ line 1298–1303, the first docstring item of `Suggested.lean` against KZ line 2104–2106. Longest shared runs are forced phrases of five to eight words ("a product of induced tori", "the centralizer of a maximal Q̆_p-split torus"). Arrangement: KZ runs §2.4, §3, §4.1, 4.2, 4.3, 4.4, 5.1, 5.2, 5.3. Its §4.1 is spread over Layers 0, 1, 4 and 5; Layers 1, 3 and 4 rest on KPZ, KP and HT; Layer 5 joins KZ §4.3, §4.4 and Theorem 4.1.11; Layer 7 joins KZ §5.1 and §5.3 after §5.2. The order of Layers 4 to 7 is forced (§5.6 needs §4.13; §6.3 needs the density statement; §7.4 needs §5.10 and §6.3). No table, figure or list of examples is taken over.

Source independence: 23 passages compared with 5 sources (KZ, HT, KPZ, KP, K17), none shared; largest share KZ, 35 of 82 locator lines; contents compared with KZ: independent.

## Not verifiable

- The published versions of KZ (Annals), HT (Duke) and K17 (JAMS) were not collated with the preprint or author versions `sources.toml` records; locators are for the recorded versions.
- The 21 declared supplier gaps are contracts; their future proofs cannot be checked here.
- Whether the Newton class of a point of a strongly acceptable model depends on the chosen ι_2 was not settled; R01 asks only that the choice be stated, as KZ does.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), p.34: the source says the inertia coinvariants of the cocharacters of G^ab are torsion; it should be torsion-free, as Lemma 4.2.4 and its use on p.41 require; affects nothing.
- **Gap** in KZ at the proof of Lemma 4.3.8(1), p.40: the source applies the multiplier sequence of the cited KPZ lemma to the matched group; that lemma assumes a Q-simple adjoint group, though its proof does not use it; affects the proof.
- **Misprint** in HT at §2.1.3, p.21: the source defines the integral isogeny group as the Q_p-points meeting Aut; it should be the Q-points meeting Aut, as in the proof of Lemma 2.1.4, p.22; affects nothing.

## For the human reviewers

- Licence: `sources.toml` records HT and K17 from author pages (`licence_class = "author-page"`) and KZ from arXiv v2, not collated with the Annals version (its `version_note`); the published texts were not read.
- Scope: the roadmap states 21 supplier gaps on 11 other roadmaps (`packages/ShimuraVarietiesPartII/README.md`, Exact supplier contracts); its headline theorems hold only once those suppliers accept them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "40d240782588c44fbfd3d1f683773d76a3f8b005", "job": "REV-PKG-ShimuraVarietiesPartII~11", "model": "fable", "worker": "chris-x52"} -->
