# Review of SerreWeightAndLevelOptimisation (pull request #2518 at 514db70)

**Verdict:** accepted

**Summary.** Accepted, with no finding: the 15 sampled targets agree with their sources where those could be read, the four `Suggested.lean` headlines match Ribet's (1.3), (1.5), (2.1) and (2.2), and every Check that can be computed comes out as stated. The head is the one the previous review read, so its three small corrections and its format note stand unrepaired. There are six small corrections in all, three of them new: the consumer sentence overstates what SerreModularityByCompatibleSystems takes from here, the auxiliary place of §6.10 is described as Steinberg, and three declaration names are attributed to a supplier that does not declare them. There is one format note; none of these blocks. The status of the Gross scan is left to the human reviewers.

## C01 — Downstream consumers no longer names ClassicalSerreModularity, which still consumes Layers 3–6

The revised paragraph (line 1710) names SerreModularityByCompatibleSystems where ClassicalSerreModularity stood, and the README now mentions ClassicalSerreModularity nowhere. At its open head ClassicalSerreModularity still lists this roadmap among its needs: §§3.1–3.6 and 4.7–4.8, Layer 4, §3.7 with §§6.6–6.11, and Layer 5 for Lemma 6.2(i). A reader tracing who uses the KW optimisation finds only GL2ModularityLifting (line 1714). One sentence restores it, for example: "ClassicalSerreModularity Layer I consumes the weight results of Layer 3, Layer 4, the dihedral export of Layer 5 and the KW optimisation of §§6.6–6.11."

## C02 — SerreModularityByCompatibleSystems does not consume the odd-characteristic conductor descent; it proves that statement again

Line 1710 says that SerreModularityByCompatibleSystems "consumes the conditional conductor/weight cases", and the description says the same. At its head, its target `S6/strong-form-by-minimal-lifts` needs only §3.7 and §3.8 from here, and the strong form adds §5.6 and Layer 6; §2.13 is cited nowhere in that roadmap. For odd p it reaches level `N(ρ̄)` from a minimal lift and Khare–Wintenberger's lifting theorem. Its statement there (an S-type modular ρ̄ in odd characteristic arises from `S_{k(ρ̄)}(Γ₁(N(ρ̄)))`) is the conclusion of §2.13 with §3.7 here, the first two rows of the §6.12 table. So the sentence misleads on what is consumed, and one theorem has two owners.

This roadmap is on main and is the earlier owner, so nothing in its statements changes. The smallest repair on this side is to make the sentence exact, for example: "SerreModularityByCompatibleSystems consumes the weight results of §§3.7–3.8 and the dyadic optimisation of Layers 5–6; for odd p it proves the level `N(ρ̄)` again by minimal lifts." The citation of §2.13, or one clause saying how the minimal-lift statement differs, is owed by SerreModularityByCompatibleSystems.

## C03 — §2.11 assumes that α itself has ℓ-power order, which is narrower than Ribet's (4.5) and than the use in §5.8

§2.11 (line 547) supposes "α ramified of ℓ-power order and hence residual α trivial". Ribet's (4.5) (ribet94 lines 499–506, pp. 10–11) assumes only that the conductor drops and that α is ramified; the proof then shows that ᾱ is unramified and that `α|I_q` has ℓ-power order, so α may carry a non-trivial unramified factor. §5.8 lists §2.11 among its needs for Buzzard's case (iii) (buzzard00 lines 623–624 and 636, p. 108), a twist of Steinberg by a tamely ramified character whose reduction is unramified but need not be trivial. Nothing false is stated, since the route of §2.11 already works with `α|I_q = ω_q^i`, but the statement does not cover that use.

A repair: "with α ramified and `α|I_q` of ℓ-power order (so ᾱ is unramified)". The phrase "residually trivial ramified-special twists" in §5.8 (line 1283) would then read "ramified-special twists whose residual character is unramified".

## C04 — The auxiliary place r₀ of §6.10 is not a Steinberg place, and it plays no part in the discriminant

§6.10 (line 1622) says: "Add an auxiliary Steinberg place `r_0` when needed for the definite discriminant/neatness argument". In Khare–Wintenberger's proof (kw2 lines 3578–3592, p. 77) r₀ is any prime outside Σ and not above p, and the level there is the principal congruence subgroup `U(r′)`, chosen so that the group is neat and the pairings are perfect. The quaternion algebra `D_i` is ramified exactly at the infinite places and above `v_1,…,v_i`, so r₀ does not enter its discriminant. Theorem 8.2 is then applied to remove whatever ramification appears above r₀ (lines 3616–3618, p. 78). An implementer who imposed an Iwahori or Steinberg condition at r₀ would not obtain neatness. Kisin's Lemma 3.5.3 uses its auxiliary prime the same way (kisin09 lines 3929–3937, pp. 1168–1169).

A repair: "Add an auxiliary place `r_0` outside the prescribed places and not above p, with full level there to make the level neat, then remove the ramification it introduces by Theorem 8.2."

## C05 — Three declaration names attributed to HilbertModularVarietiesAndShimuraCurves are declared nowhere

The supplier contracts cite §R18.3.24 as `twTwist_commonLiftableImage` and §R18.3.32 as `ramifiedSign_independentOfEigenform` (line 127), and §§R18.5.17–R18.5.18 as `ShimuraJacobianTorsionDatum` (line 115). The three sections exist on main under the headings "Common liftable image of Taylor–Wiles coefficient twists", "Fixed ramified signs throughout a localized eigensystem" and "Quaternionic character lattice and monodromy", and they state what is used here. But neither that roadmap's README nor its `Suggested.lean`, nor any other roadmap on main or open, contains any of the three names, so a reader who searches for them finds only this README. Cite the sections by their headings, or say that the names are proposals.

## C06 — The description attributes θ-operators to this roadmap; the README gives them to AlgebraicModularFormsAndSerreWeights

The summary block says that Layer S6 of SerreModularityByCompatibleSystems "uses this roadmap's θ-operators, Edixhoven's weight theorem and dyadic optimisation (Layers 3–6)". The README's scope (line 11) gives the Hasse, theta and Frobenius operations to AlgebraicModularFormsAndSerreWeights R15.1–R15.4 and says this roadmap gives them no new definitions; §3.7 itself needs R15.3, "Theta cycles". A correct version: "uses this roadmap's Edixhoven weight theorem and small-weight twisting (§§3.7–3.8) and its dyadic optimisation (Layers 5–6)".

## N01 — Three of the renamed references read awkwardly or could be more precise

In §5.11 (line 1337) a leftover label makes the sentence ungrammatical ("is assigned to SerreModularityByCompatibleSystems, scalar dyadic completion and appears only in the export manifest"). The §6.11 Check (line 1668) lacks a possessive ("nor final SerreModularityByCompatibleSystems Serre theorem"). §6.12 (lines 1672, 1685–1686, 1694) could cite `S6/strong-form-by-minimal-lifts` and `S6/strong-form-of-serre-conjecture`, as the §5.11 Check already does.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 2.1 conductor interface | ribet94 lines 153–165 (p. 4), 394–395 (p. 9); tame and wild instances | `n=Σ dim(V/V_i)/(G_0:G_i)`; tame, one fixed line: 1; no invariants, Swan 1: `2+1=3`; `N(ρ)∣N` | matches |
| 2.7 two character-group sequences | ribet94 lines 889–899 (p. 18), 1175–1180 (p. 24) | `0→Y_q→L_p→X_p→0` and the swap; `T_p,T_q` involutions on J; `(X_q)_m=0` gives `Y_p/m≅L_q/m` | matches |
| 2.9 Mazur's principle | ribet94 lines 532–535 (p. 12), 1306–1313 (p. 27) | (4.7): `ℓ≥5`, `p≢1`, weight k, M prime to p; (8.1): ℓ odd, weight two, N prime to q only | matches |
| 2.10 and `ribet_level_lowering` | ribet94 lines 131–137 (p. 3), 1299–1303 (p. 27); M=1 | `ℓ≥3`, trivial character on `Γ1(M)∩Γ0(p)`, M may contain ℓ; `2μ≤λ`, `2λ≤2μ` force `λ=μ=0`; at M=1 no form exists | matches |
| 3.1 ordinary local form | edixhoven92 lines 182–187 (p. 5) | `2≤k≤p+1`, `a_p≠0`; diagonal `χ^{k−1}λ(ε(p)/a_p)`, `λ(a_p)`; product `χ^{k−1}λ(ε(p))` | matches |
| 3.8 twisting to small weight | ribet94 lines 350–359 (p. 8) | some `ρ⊗χ^i` in weight `2≤k(ρ_i)≤ℓ+1` at the same N; θ applied i times | matches |
| 3.9 four sets of levels | ribet94 lines 362–375 (p. 8) | N₁=N₂ by 3.1, N₂=N₃ by 2.1, N₂⊆N₄ by 2.2 and a twist to `Nℓ²`; `ℓ≥5` | matches |
| 5.1 Buzzard multiplicity one | buzzard00 lines 267–298 (pp. 100–101) | all `T_n` and diamonds; `dim J(Γ)[m]=2`; M odd if finite, `2∥M` otherwise; `Γ1(M)` suffices by Lemma 2.3 | matches |
| 5.2a auxiliary character replacement | buzzard00 lines 402–409, 421–424 (p. 103); `r≡3 mod 4` | Diamond Lemma 2.2 at `m=q>3`; `r−1=2·odd`, so an even r-character has odd order; trivial reduction makes it trivial | use matches; Diamond's lemma not readable |
| 5.5 dyadic level raising | buzzard00 lines 443–447 (p. 104), 509–521 (p. 105) | image of even order; `ρ(Frob_q)` of order 2, trace 0; q-new form on `Γ1(M)∩Γ0(pq)`; `a₂` preserved inside the proof | matches |
| 5.6 Buzzard lowering | buzzard00 lines 426–433 (p. 103), 496–498 (p. 105); ribet-stein lines 2209–2211 (p. 49); ρ ramified at p | printed statement omits unramified; proof uses it; ramified ρ has `p∣N(ρ)`, so no level-M form | matches; README's added hypothesis is right |
| 6.6 KW data and determinant alignment | kw2 lines 3171–3174 (p. 68), 3192–3213 (p. 69), 3236–3265 (p. 70); character of ℚ(i) | source characters live on `F^×\(A_F^∞)^×`, so totally even; ℚ(i): reduction 1, trivial on `1+4ℤ₂`, unramified at 3, value −1 at conjugation | matches; Check is a true negative control |
| 6.8 weight two to p+1 | kw2 lines 3399–3434 (pp. 73–74); f=1, 2 | `F[P¹(k_w)]=1⊕V`; `p^f+1` points; V of dimension p, p²; tensor of f copies of `Sym^{p−1}` has `p^f` | matches |
| 6.9 quaternionic level raising | kisin09 lines 3195–3220 (pp. 1151–1152); kw2 lines 2769–2790 (p. 60) | Gram `[[Nq+1,T],[T,ψ(Nq+1)]]`, determinant `(Nq+1)²ψ−T²`; quotient non-zero and free; Lemma 7.1 kernel Eisenstein | matches |
| 6.10 quadratic tower | kw2 lines 3564–3628 (pp. 76–78); kisin09 lines 3905–3953 (pp. 1168–1169) | Σ made even; `v_i` split in `F_i`, others inert; `D_i` ramified above `v_1..v_i` (2i places); level `U(r′)` at r₀ | matches except the label of r₀: C04 |
| `strip_coefficient_prime_powers` (§4.2) | ribet94 lines 168–178 (p. 4); r=0 | `ℓ≥3`, level `Nℓ^α` to N; "arises from Γ" means some `k≥2`; at r=0 take g=f | matches |
| `congruent_nebentypus` (§4.1) | ribet94 lines 106–110 (p. 3); `η(τ)η(23τ)`, ℓ=11, weight 1 | `ℓ≥5`, same N and k; `ε′=εθ` of order 22 forces dihedral image with an everywhere unramified quadratic field | matches; Check true |
| `weight_two_at_level_mul_prime` (§4.7) | ribet94 lines 280–287 (p. 6) | `ℓ∤N`, `2≤k≤ℓ+1`, `ℓ>3` or `N>3`; conclusion `S₂(Γ1(Nℓ))` | matches |
| §2.4 Check | 11a1, ℓ=7, q=29 | `#E(F₂)=5`, `#E(F₂₉)=30`; `a₂=−2`, `a₂₉=0`; `−4≡3`, a non-square mod 7; `900≡4≠0` | true |
| §2.5 matrices | `U=[[T,q],[−1,0]]` | `[[−1,T],[0,−1]]·[[q+1,T],[T,q+1]]=[[T²−q−1,qT],[−T,−q−1]]=U²−1`; characteristic polynomial `X²−TX+q` | true |
| §3.6 example | `ΔE₄²E₆` mod 107, expanded to q¹⁰⁷ | `a₁=1`, `a₂≡59≡−48`, `a₁₀₇≡106≡−1`; companion weight `108−26=82` | true |
| §3.14, §3.14a | α=2, β=3 in F₇; `ℤ₂/8` | `αβ=6`, `α⁻¹=4`, `VF=4F`; `240≡0 mod 8`, `2⁴=0`, `odd⁴≡1`; `U(φT₂−Uφ)=φ〈2〉` | true |
| §4.6 trace Check | E₄ at ℓ=5, a=4 | g has q-coefficient 240 (v₅=1); `g|W=25(E(q⁵)−E(q))` has −6000 (v₅=3=1+a/2) | true |
| §6.1 Checks | M=33, 141, 45; 141a1 | M₀=11, 141, 47, 9; discriminant of the model 102789=3⁷·47 | true |
| §1.3 nodal Check | `A={(a,b):a≡b mod π}`, λ(a,b)=a | ker λ={(0,πb)}, annihilator {(πa,0)}, η=(π), Ψ(A)=O/π; `O⊗_A O′=O/π` | true |
| Downstream consumers (C01, C02) | ClassicalSerreModularity and SerreModularityByCompatibleSystems at their heads | the first cites §§3.1–3.7, 4.7–4.8, Layers 4–5, §§6.6–6.11; the second cites §§3.1–3.2, 3.5–3.8, 4.1, 5.6, Layer 6, never §2.13 | C01, C02 |
| §2.11 (C03) | ribet94 lines 499–506 (pp. 10–11); buzzard00 line 623 (p. 108) | source: `e>0`, α ramified; only `α|I_p` of ℓ-power order; README: α of ℓ-power order | true but narrower: C03 |
| Supplier names (C05) | HilbertModularVarietiesAndShimuraCurves on main, README and Lean file | sections R18.3.24, R18.3.32, R18.5.17–18 exist at lines 3256, 4371, 2449, 2490; the three names occur 0 times | C05 |

- Source locators checked against the texts: 43 in 6 sources (ribet94 15, buzzard00 11, kw2 9, edixhoven92 4, kisin09 3, ribet-stein 1).
- Library declarations opened at the pins: `HeckeRing.GL2.Eigenform` (Tau Ceti, `NumberTheory/ModularForms/Newforms/Eigenform.lean` lines 76–90: nonzero, nebentypus, eigenvalue at every positive index); `Submodule.mkQ`, `mkQ_surjective`, `mk_eq_zero`, `quot_hom_ext`, `linearMap_qext` (`Mathlib/LinearAlgebra/Quotient/Defs.lean` lines 98–248), `subsingleton_iff`, `liftQ`, `liftQ_mkQ`, `mapQ`, `mapQ_id`, `mapQ_comp`, `Quotient.equiv` (`Quotient/Basic.lean` lines 76–325), `Submodule.localized` (`Algebra/Module/LocalizedModule/Submodule.lean` line 99); the Tau Ceti modules `Newforms/Basic.lean`, `Degeneracy.lean`, `Newforms/Newform.lean` and `Newforms/MultiplicityOne.lean` contain the five names cited from them.
- Cross-roadmap citations resolved on main (890b66d), 47 ids in 16 roadmaps, among them AlgebraicModularFormsAndSerreWeights (the R15 map at line 17, `ArisesFrom`), FiniteFlatGroupsAndIntegralPadicHodgeTheory (`HasFiniteFlatModel.of_isUnramified`, `card_points_quot_multiplicativePart`, R07.1.24a), ModularCurvesPartII (§§9.11, 14.4a, 15.7, 17.7), NeronModelsAndSemistableAbelianVarieties (§4.14, §5.3h and its three structures), HilbertModularVarietiesAndShimuraCurves (14 sections), ArithmeticGaloisDuality, IntegralIwasawaTheory §9.1, GL2AutomorphicRepresentationsAndTransfer, ArithmeticGaloisRepresentations, AutomorphicFormsOnReductiveGroups, ModularForms (8G and 8W through its table at lines 344–345), ClassFieldTheory Layers 7, 11, 12 and Chebotarev Layer 10.
- Open heads read: SerreModularityByCompatibleSystems (Layer S6, scope, boundary table), ClassicalSerreModularity (needs lines), GL2ModularityLifting (citations of §§6.6, 6.11), AutomorphicGaloisRepresentations (citations of §§2.10, 2.13, 4.7–4.8), GL2ModularityLiftingPartII (citation of §3.4).
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. This roadmap is at position 177 of the merge order; ClassicalSerreModularity is at 182, GL2ModularityLifting at 185, SerreModularityByCompatibleSystems at 266.
- Elaboration: `lake env lean` on `Suggested.lean` gives four `declaration uses sorry` warnings (lines 74, 93, 108, 128) and nothing else. The elaborated types of the six declarations keep every binder (`CharP k ℓ`, `IsAlgClosed k`, `IsGalois ℚ L` through `include`) and agree with §§2.10, 4.1, 4.2 and 4.7. None is padding, decided by reading: each asks for an eigenform at another level, weight or character, and at `r=0` the stripping statement is the only one with a trivial instance.
- The automatic checks all pass at this head. Against main the folder changes by 10 insertions and 10 deletions in `README.md`; no heading or Lean declaration is added or removed, and nothing outside the folder changes.
- Earlier remarks: the previous review read this same head and raised no finding. Its C01 (line 1710), C02 (line 547, here C03), C03 (the description, here C06) and N01 (lines 1337, 1668) are unchanged and are carried above.

Overlap check: read SerreModularityByCompatibleSystems, ClassicalSerreModularity, GL2ModularityLifting, GL2ModularityLiftingPartII, AutomorphicGaloisRepresentations, AlgebraicModularFormsAndSerreWeights, HilbertModularVarietiesAndShimuraCurves and ModularCurvesPartII. One statement is shared: "a modular ρ̄ in odd characteristic arises in weight `k(ρ̄)` at level `N(ρ̄)`" is §2.13 with §3.7 here and `S6/strong-form-by-minimal-lifts` in SerreModularityByCompatibleSystems; the owner is this roadmap (on main), and the citation is owed by that open pull request (C02). The scalar dyadic completion and the unconditional theorem are owned by SerreModularityByCompatibleSystems S6. Edixhoven existence (§3.7) and KW II §8 (§§6.6–6.11) are owned here and cited by the others. Theta and Hasse operations are owned by AlgebraicModularFormsAndSerreWeights, the level-lowering exact sequences here (ModularCurvesPartII line 4555 agrees).

Source independence: 24 passages compared with 6 sources (the 15 sampled targets and Ribet (1.3), (2.1), (2.2), (4.5), Buzzard's Theorem 3.1 cases, KW II Theorems 8.2 and 8.4, Kisin Lemma 3.5.3, Ribet–Stein 3.19); nothing shared beyond standard phrases and hypothesis lists the mathematics forces. Largest share ribet94, 29 of 102 locators; contents compared with ribet94: Layer 2 ↔ §§4–8, Layer 3 ↔ §3, Layer 4 ↔ §2, in the reverse order, and Layers 1, 5 and 6 rest on other sources: independent. The Gross scan was not read.

Research link: Layers 2–6 are the level and weight optimisation of Ribet (1990, 1994), Edixhoven (1992), Diamond (1995) and Buzzard (2000), and KW II §8 (2009); Khare–Wintenberger use it to pass from modularity to Serre's refined conjecture, and SerreModularityByCompatibleSystems S6 consumes it. Rests on the README and on kw2 §8.

## Not verifiable

- Gross 1990, Propositions 12.8–12.9, the second locator of the sampled §3.1: the only copy the README links is a scan on a third party's seminar page, whose status as a legal copy is unsettled; not opened. Edixhoven's Theorem 2.5, the first locator, was read.
- Diamond 1995, Lemma 2.2 (sampled §5.2a) and Theorem 1.1 (§2.13): the README says no open copy is known and cites them by locator only; not opened. Buzzard's use of the lemma was read.
- Kisin's standing assumption `p>2` at the start of his §3.1 (p. 1145), cited in the sampled §6.9: not opened this round.

Automatic checks set aside as false positives: the citation resolver's report that AlgebraicModularFormsAndSerreWeights has no "R15.3" (that roadmap maps R15.1–R15.5 to its Layers 1–5 on main, line 17), and its report that `HasFiniteFlatModel.of_isUnramified` occurs nowhere (FiniteFlatGroupsAndIntegralPadicHodgeTheory on main names it).

## Source issues

- **Error** in buzzard00 at Theorem 2.8, p. 103: the source states the lowering conclusion without assuming ρ unramified at p, and a ρ ramified at p cannot arise at level M prime to p; it should assume ρ unramified at p, as its proof on p. 105 does and Ribet–Stein Theorem 3.19 states; affects a stated result.
- **Misprint** in ribet94 at the proof of (4.4), author p. 10: the source identifies α on inertia at p with a power of the Teichmüller character from the proof of (2.1), which has conductor ℓ; it should be the Teichmüller character of (ℤ/pℤ)^×, of conductor p, as φ = ω^{−i} of conductor p requires; affects nothing.

## For the human reviewers

- **Licence.** `README.md` line 1732 links Gross's Duke article as a scan of the published paper on a third party's seminar page (`math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf`), neither the publisher's nor the author's; its status as a legal copy was not settled, and it carries 7 locators.
