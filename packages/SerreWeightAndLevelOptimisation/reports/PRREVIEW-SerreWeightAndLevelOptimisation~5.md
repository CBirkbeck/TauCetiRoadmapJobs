# Review of SerreWeightAndLevelOptimisation (pull request #2518 at 514db70)

**Verdict:** accepted

**Summary.** Accepted, with no finding. The renamed owner is right: SerreModularityByCompatibleSystems' Layer S6 (`S6/strong-form-by-minimal-lifts`) covers exactly the case this roadmap leaves downstream (p = 2, scalar restriction at 2, non-dihedral image), and no proof here depends on it. A full re-check of the 15 sampled targets against their sources, the four `Suggested.lean` headlines and the computable Checks found nothing false. There are three small corrections (a consumer dropped from Downstream consumers, a §2.11 hypothesis narrower than Ribet's (4.5), and a misattribution of θ-operators in the description) and one format note, none of them blocking. The licence of the Gross scan is left to the human reviewers.

## C01 — Downstream consumers no longer names ClassicalSerreModularity, which still consumes Layers 3–4 and §§6.6–6.11

The revised paragraph (line 1710) puts SerreModularityByCompatibleSystems where ClassicalSerreModularity was, and the README now mentions ClassicalSerreModularity nowhere. At its open head, the dependencies of ClassicalSerreModularity's Layer I cite this roadmap's §§3.1–3.8, 4.2, 4.7–4.8, Layer 4 and §§6.6–6.11 for its lifting inputs. A reader tracing who uses the KW optimisation therefore finds only GL2ModularityLifting (line 1714). One sentence would put it back, for example: "ClassicalSerreModularity Layer I consumes the weight results of Layer 3, Layer 4 and the KW optimisation of §§6.6–6.11."

## C02 — §2.11 assumes that α itself has ℓ-power order, which is narrower than Ribet's (4.5) and than the case §5.8 uses it for

§2.11 (line 547) supposes "α ramified of ℓ-power order and hence residual α trivial". Ribet's (4.5) (ribet94 lines 499–506, pp. 10–11) assumes only e > 0 and α ramified. So ᾱ is unramified, only α|I_q has ℓ-power order, and α may carry a non-trivial unramified factor. §5.8 lists §2.11 among its needs for Buzzard's case (iii) (buzzard00 lines 623–636, p. 108). That case is Steinberg twisted by a tamely ramified μ whose reduction is unramified but need not be trivial. Nothing false is stated, because the proof route of §2.11 already works with `α|I_q = ω_q^i`. But the statement does not cover that use.

A fix: "with α ramified and α|I_q of ℓ-power order (so ᾱ is unramified)". The phrase "residually trivial ramified-special twists" in §5.8 (line 1283) would then become "ramified-special twists whose residual character is unramified".

## C03 — The description attributes θ-operators to this roadmap; the README gives them to AlgebraicModularFormsAndSerreWeights

The summary block says that Layer S6 of SerreModularityByCompatibleSystems "uses this roadmap's θ-operators, Edixhoven's weight theorem and dyadic optimisation (Layers 3–6)". The README's scope (line 11) gives the Hasse, theta and Frobenius operations to AlgebraicModularFormsAndSerreWeights R15.1–R15.4 and says this roadmap gives them no new definitions. §3.7 also needs R15.3, "Theta cycles". A correct version: "uses this roadmap's Edixhoven weight theorem and small-weight twisting (§§3.7–3.8) and its dyadic optimisation (Layers 5–6)". SerreModularityByCompatibleSystems' own boundary table repeats the same attribution.

## N01 — Three of the renamed references read awkwardly or could be more precise

In §5.11 (line 1337), a leftover label makes the sentence ungrammatical ("is assigned to SerreModularityByCompatibleSystems, scalar dyadic completion and appears only in the export manifest"). The §6.11 Check (line 1668) is missing a possessive ("nor final SerreModularityByCompatibleSystems Serre theorem"). §6.12 (lines 1672, 1685–1686, 1694) could cite `S6/strong-form-by-minimal-lifts` and `S6/strong-form-of-serre-conjecture`, as the §5.11 Check already does.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 localised degeneracy sequence | ribet94 (5.2)–(5.3), lines 707–745, pp. 15–16 | `X↪L` injective; `Y=L/αX` torsion-free by Ihara for `2≤k≤ℓ+1`, `ℓ∤N`; Y cuts out the q-new quotient | matches; Ihara imported as stated |
| 1.4 support, descent, Jacobian torsion | ribet-stein §3.6 lines 1820–1837 (p. 40), §3.9 lines 2007–2023 (p. 44); ribet94 Thm 8.1 proof line 1339 (p. 28); N=1 | descent ⇔ m pulls back to the lower quotient; `J[m]≠0`, `V⊂J[m]`; `J₀(1)=0` gives no m | matches |
| 2.4 Diamond's criterion | ribet94 (5.1) lines 610–618 (p. 13); 11a1, ℓ=7, q=29 | `#E(F₂)=5`, `a₂=−2`; `#E(F₂₉)=30`, `a₂₉=0`; disc `−4≡3`, a non-square mod 7; `0≠900≡4` | matches; Check true |
| 2.11 special twist | ribet94 (4.5) lines 499–510 (pp. 10–11) | source needs only `α|I_q` of ℓ-power order (ᾱ unramified); README needs α of ℓ-power order | true but narrower: C02 |
| 3.1 ordinary local form | edixhoven92 Thm 2.5 lines 182–187 (p. 5); gross90 Props 12.8–12.9 (pp. 490–492) | `[[χ^{k−1}λ(ε(p)/a_p),*],[0,λ(a_p)]]`, `2≤k≤p+1`, `a_p≠0`; det `εχ^{k−1}` | matches |
| 3.7 Edixhoven weight theorem | edixhoven92 Remark 4.4, Thm 4.5 lines 365–380 (pp. 10–11); intro item 3, line 88 | weights differ only at unramified (1 vs p) and dyadic très ramifiée (3 vs 4); p>2 removes exceptionality | matches; symbol swap stated |
| 3.9 four sets of levels | ribet94 (3.3) lines 360–375 (p. 8) | N₁=N₂ by 3.1, N₂=N₃ by 2.1, N₂⊆N₄ by 2.2 plus a twist costing ℓ²; `ℓ≥5` | matches |
| 3.10 ordinary Tate sequence | cg18 lines 2586–2623 (pp. 65–66); gross90 12.9–12.10 (pp. 492–493) | `T_pG⁰` free of rank one; `T_pGᵉ=Hom(T_pG⁰,Z_p)`; `p≥3`, `N*∈{N,Np}`; Gorenstein only under Gross's extra hypotheses | matches |
| 3.14 localised Hasse injection | cg20 Lemma 8.14 lines 2540–2603 (pp. 65–66); α=2, β=3 in F₇ | needs α≠β; `T=U+⟨p⟩V`, `UVF=F` give `VF=α⁻¹F=4F`, `αβ=6`; source writes VF=βF | matches; source slip |
| 4.3 first character normalisation | ribet94 Step 1, lines 197–211 (p. 5) | `κ=εηω^i`, `η=ξ⁻²`; `f⊗ξ` has character `εω^i` on `Γ0(ℓ^r)∩Γ1(ℓN)`; `2t≡−1` gives `ξ²=η⁻¹` | matches |
| 4.5 coefficient-prime depth | ribet94 Step 3, lines 233–243 (p. 5) | `g=(σ⁻¹f)^ℓ|U` lies on `Γ0(ℓ^{r−1})∩Γ1(N)`; σ a Frobenius at v; `g≡f` mod v | matches |
| 5.9 Buzzard combined theorem | buzzard00 Thm 3.2 and proof, lines 649–676 (pp. 108–109) | weight 2 if finite, else 3, at level N; Q(i) case via weight one at level 4N plus Prop 1.3; Remark: weight 4 | matches |
| 5.10 dihedral weight one | wiese04 Thm 9 lines 347–384 (pp. 130–131); Prop 7, Cor 8 (pp. 129–130); ℚ(√229) | 229≡5 mod 8, so 2 is inert; class number 3; image S₃; unramified at 2; Katz weight one with character det ρ | matches; Check true |
| 5.11 scalar dyadic boundary | buzzard00 Prop 2.4 lines 304–338 (pp. 101–102); wiese07 Cor 4.2, 4.5 lines 636–709 (pp. 77–79); kw1 lines 79–82 (p. 2) | scalar ⇒ multiplicity one unknown; weight-one witness ⇒ `r≠1` ⇒ `r≥2`; KW name the missing scalar non-dihedral level control | matches |
| 5.11, 6.11, 6.12 renamed owner | SerreModularityByCompatibleSystems at its head: Layer S6, scope "Owned here" | `S6/strong-form-by-minimal-lifts` covers p=2, k=2, scalar non-dihedral; no *Needs:* edge from here to it | matches; no cycle |
| 6.12 case manifest | buzzard00 Thms 3.1–3.2 (pp. 107–109); wiese04 Thms 9–10 (pp. 130–132); kw1 Lemma 6.2(i) line 458 (p. 11) | p=2 rows: nonscalar non-Q(i), Q(i), scalar dihedral, scalar non-dihedral; together they cover p=2 | matches |
| `ribet_level_lowering` (§2.10) | ribet94 (1.5) lines 131–134 (p. 3); M=1 | `ℓ≥3`, `Γ0(Mq)`, trivial χ, unramified at q ⇒ `Γ0(M)`; at M=1 no weight-two level-one forms exist, so the hypotheses cannot hold | matches |
| `strip_coefficient_prime_powers` (§4.2) | ribet94 (2.1) lines 177–178; k≥2 at lines 168–169, 200–201 | `ℓ≥3`, level `Nℓ^r` ⇒ level N in some weight ≥2; at r=0 the statement is a level identity | matches |
| `congruent_nebentypus` (§4.1) | ribet94 (1.3) lines 106–110 (p. 3); `η(τ)η(23τ)`, ℓ=11 | `ℓ≥5`, same N and k; k=1 control: `ε′=εθ` has order 22, projective inertia order 22 ⇒ dihedral ⇒ unramified quadratic field, impossible | matches; Check true |
| `weight_two_at_level_mul_prime` (§4.7) | ribet94 (2.2) lines 280–287 (p. 6) | `ℓ∤N`, `2≤k≤ℓ+1`, `ℓ>3 or N>3` ⇒ `S₂(Γ1(Nℓ))`; Gross needs N≥4 | matches |
| §3.6 BCG example | `ΔE₄²E₆` expanded to q¹⁰⁷ | `a₁=1`, `a₂=−48`, `a₄=a₂²−2²⁵` holds; `a₁₀₇≡106≡−1` mod 107; companion weight `108−26=82` | true |
| §4.6 trace Check | E₄ at ℓ=5, a=4 | g has q-coefficient 240 (v₅=1); `g|W=25(E(q⁵)−E(q))` has q-coefficient −6000 (v₅=3=1+a/2) | true |
| §6.1 Checks | M=33, 141, 45; 141a1 | M₀=11, 141, 47, 9; disc(141a1)=102789=3⁷·47 | true |
| §2.5 matrices | `U=[[T,q],[−1,0]]` | `[[−1,T],[0,−1]]·[[q+1,T],[T,q+1]]=[[T²−q−1,qT],[−T,−q−1]]=U²−1`; char poly `X²−TX+q` | true |
| §1.3 nodal Check | `A={(a,b):a≡b mod π}`, λ(a,b)=a | ker λ={(0,πb)}, Ann={(πa,0)}, η=(π), Ψ(A)=O/π; `O⊗_A O′=O/π` | true |
| §6.6 alignment vs KW II Lemma 7.10 | kw2 lines 3192–3213 (p. 69); the character of ℚ(i) | source characters live on `F^×\(A_F^∞)^×`, so they are totally even; the README's Galois form adds the parity hypothesis; the Check is a valid negative control | matches; no source slip |
| Downstream consumers (C01) | ClassicalSerreModularity at its head, Layer I dependencies | cites §§3.1–3.8, 4.2, 4.7–4.8, Layer 4, §§6.6–6.11; the README names it nowhere | omission: C01 |
| §5.8 case (iii) (C02) | buzzard00 lines 623–636 (p. 108) | μ tamely ramified with unramified reduction, μ̄ possibly ≠1; twist by a 2-power character of conductor p | uses general §2.11: C02 |
| Description (C03) | README line 11; §3.7 *Needs:* | Hasse/theta operations are owned by AlgebraicModularFormsAndSerreWeights R15.1–R15.4 | C03 |

- Source locators checked against the texts: 53 in 13 sources: ribet94, ribet-stein, edixhoven92, gross90, cg18, cg20, coleman-voloch, buzzard00, wiese07, wiese04, kw1, kw2 and bennett-siksek.
- Library declarations opened at the pins: `HeckeRing.GL2.Eigenform` (Tau Ceti, `NumberTheory/ModularForms/Newforms/Eigenform.lean` lines 76–90, full eigenform at every index). Unramified-representation predicates were searched for in Mathlib and Tau Ceti and none was found: only `Algebra.IsUnramifiedAt` and the infinite-place `IsUnramified`, both about rings or places.
- Cross-roadmap citations resolved on main: FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.2, R07.1.3 (paragraph at line 802 and `card_points_quot_multiplicativePart` at line 812), R07.1.7–9, R07.1.24a, R07.5, R07.6.1 and R07.6.8 (`HasFiniteFlatModel.of_isUnramified` at line 8809); AlgebraicModularFormsAndSerreWeights (R15 map at line 17; §§3.1–3.14, 4.1–4.11, 5.10, 7.5); GL2AutomorphicRepresentationsAndTransfer §§R16.0.1, R16.3.1–5, Layers R17.3–R17.6, §§R17.5.1, R17.5.9, R17.6.4, R17.6.12. Also on main: ModularCurvesPartII (30 ids); NeronModelsAndSemistableAbelianVarieties (7); ArithmeticGaloisRepresentations (16); ArithmeticGaloisDuality (3); HilbertModularVarietiesAndShimuraCurves (15); LocalGaloisDeformationRings (4); GlobalGaloisDeformations (3); IntegralIwasawaTheory (2); AutomorphicFormsOnReductiveGroups (2); ClassFieldTheory (3); Chebotarev Layer 10; ModularForms (9, with Layers 8G and 8W mapped by its earlier-label table at lines 344–345).
- Open heads read: SerreModularityByCompatibleSystems (Layer S6, scope and supplier contracts), ClassicalSerreModularity (scope, Layer I dependencies), AutomorphicGaloisRepresentations §6.5, and GL2ModularityLifting's scope, which defers KW II §8 to §§6.6–6.11 here.
- Automatic checks at this head all pass. Dependency check output: `depcheck: 210 roadmaps, 2272 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. This roadmap is at position 177 of the merge order; its consumers are later (ClassicalSerreModularity 182, GL2ModularityLifting 185, EllipticCurveModularity 208, SerreModularityByCompatibleSystems 266).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 in 8.5 s with four `declaration uses sorry` warnings (lines 74, 93, 108, 128) and nothing else. The elaborated types of all six declarations keep every binder (`CharP k ℓ`, `IsAlgClosed k`, `IsGalois ℚ L` through `include`), and each matches its README statement (§§2.10, 4.1, 4.2, 4.7). No statement is padding: each asks for the construction of an eigenform at a new level, weight or character.
- Diff: only `README.md` changes (10 insertions, 10 deletions, 1758 lines before and after); nothing outside the folder; no heading or Lean declaration added or removed.

Earlier findings: the previous review (of 9f2eed7) raised none. The text it had verified as repaired (the §3.3 locator and the References entries) is unchanged at this head.

Overlap check: read SerreModularityByCompatibleSystems, ClassicalSerreModularity, AutomorphicGaloisRepresentations, GL2ModularityLifting, GL2ModularityLiftingPartII (citations), AlgebraicModularFormsAndSerreWeights, HilbertModularVarietiesAndShimuraCurves and ModularCurvesPartII (as suppliers). Nothing is shared. The strong form, including the scalar dyadic case, is owned by SerreModularityByCompatibleSystems S6. Edixhoven existence (§3.7) is owned here, and AlgebraicModularFormsAndSerreWeights §4.10 leaves it out of scope. KW II §8 (§§6.6–6.11) is owned here and cited by GL2ModularityLifting. AutomorphicGaloisRepresentations §6.5 cites §§2.10, 2.13, 4.7–4.8.

Source independence: 21 passages compared with 13 sources (the 15 sampled targets, plus §2.10 against Ribet 1.5, §4.1 against Ribet 1.3, §5.6 against Buzzard 2.8, §6.1 against Bennett–Siksek (3), §6.6 against KW II Lemma 7.10 and §3.5 against Coleman–Voloch 0.1). Nothing is shared beyond standard phrases of at most five words. The largest share is ribet94, with 29 of 102 locators. Its contents compared with the layers: Layer 2 ↔ §§4–8, Layer 3 ↔ §3, Layer 4 ↔ §2 run in reverse order, and Layers 1, 5 and 6 rest on other sources, so the arrangement is independent.

Research link: Layers 2–6 are the level and weight optimisation of Ribet (1990, 1994), Edixhoven (1992), Diamond (1995) and Buzzard (2000). Khare–Wintenberger (2009) use it to pass from qualitative to refined Serre modularity, and SerreModularityByCompatibleSystems S6 consumes it. This rests on the README Summary and on kw1 §1.

## Not verifiable

- Diamond 1995, Theorem 1.1 and Lemma 2.2 (used in §2.13 and §5.2a; not in the sample): the README says no open copy is known and cites them by locator only. Not opened.

Automatic checks set aside as false positives: the citation resolver's report that AlgebraicModularFormsAndSerreWeights has no "R15.3" (that roadmap maps R15.1–R15.5 to its Layers 1–5 on main, line 17), and its report that `HasFiniteFlatModel.of_isUnramified` occurs nowhere (FiniteFlatGroupsAndIntegralPadicHodgeTheory on main names it in §R07.6.8, line 8809).

## Source issues

- **Misprint** in ribet94 at the proof of (4.4), author p. 10: the source identifies α on inertia at p with a power of the Teichmüller character from the proof of (2.1), which has conductor ℓ; it should be the Teichmüller character of (ℤ/pℤ)^×, of conductor p, as φ = ω^{−i} of conductor p requires; affects nothing.
- **Error** in buzzard00 at Theorem 2.8, p. 103: the source states the conclusion without assuming ρ unramified at p, and a ρ ramified at p cannot arise at level M prime to p; it should assume ρ unramified at p, as the proof on p. 105 does and Ribet–Stein Theorem 3.19 states; affects a stated result.
- **Misprint** in cg20 at the proof of Lemma 8.14, author p. 66: the source says the reduced form satisfies VF = βF; it should be VF = α⁻¹F (equivalently ⟨p⟩VF = βF), since T = U + ⟨p⟩V and UVF = F; affects nothing.

## For the human reviewers

- **Licence.** `README.md` line 1732 links Gross's Duke article as a scan of the published paper hosted on a third party's seminar page (`math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf`), which is neither the publisher's nor the author's; its status as a legal copy was not settled.
