# Review of GlobalGaloisDeformations (pull request #3027 at 0b5086d)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 93 changed lines since `aecb53a`. The change adds §3.6a: the universal rings of type `(𝒪, χ, ℳ)` and Wiles's identification of `Hom_𝒪(℘/℘², 𝒪/λ^m)` and `Hom_𝒪(℘/℘², Frac(𝒪)/𝒪)` with `H¹_ℳ`. It also updates the guide, the R04.3 dependencies, the scope and the references. I checked the new section against DDT §2.6 (Theorem 2.36, Lemmas 2.39–2.40) and recomputed it, including the case `p ∣ n`, where the README's "intersection with the image" is the correct reading and DDT's literal one is not. All three of its Checks hold and each can tell the intended object from a wrong one. Accepted with two small corrections (a supplier pointer and a bibliographic page range) and no format notes; nothing is left for a human to decide.

## C01 — The *Needs* line of 3.6a sends the reader to LocalGaloisDeformationRings §F.2.2 for `Φ_p`, but the group in 3.6a is an arbitrary topologically finitely generated profinite group, and the fact it needs is §F.2.1

Someone following the citation lands on the arithmetic examples. On `main`, §F.2.2 proves `Φ_p` only for `G_{F,S}` and for `G_K`, through ArithmeticGaloisDuality R02.3 and ClassFieldTheory Layer 5. The last API bullet of §F.2.1 is the statement 3.6a uses: topologically finitely generated profinite groups satisfy `Φ_p`. With it, §F.2.9 gives the fixed-determinant ring that the `ℳ`-condition then cuts down. In the *Needs:* line of 3.6a (line 367), "§§F.2.2, F.2.9 (`Φ_p` and fixed-determinant representability)" would read "§§F.2.1, F.2.9 (`Φ_p` for topologically finitely generated groups, and fixed-determinant representability)".

## C02 — The DDT entry in the References gives the published article as pages 1–107; Darmon's own publication list gives pp. 1–157 of *Current Developments in Mathematics* 1 (1995)

The locators cite the authors' PDF, so none of them is affected. Only the bibliographic record is wrong: a reader looking up the printed article gets the wrong extent. In the References (line 2328), "1–107" would read "1–157".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 3.6a representability (DDT Thm 2.36, line 2747) | `n = 1`; `ℳ` = all profinite modules | `n = 1`: lifts are `χ_A` or none, `R_ℳ = 𝒪/I`; `ℳ` = all: `R_ℳ` is LocalGaloisDeformationRings §F.2.9's ring | hypotheses match DDT lines 2731–2746 | none |
| 3.6a: Schur conjugacy is `Γ̂ₙ(A)`-conjugacy up to a scalar | `ρ′ = gρg⁻¹`, `g ∈ GLₙ(A)` | `ḡ` centralises `ρ̄`, so `ḡ = a ∈ k^×`; `ã⁻¹g ∈ Γ̂ₙ(A)` gives the same conjugation | true | none |
| 3.6a: `H¹_ℳ(G, End⁰M)` as intersection with the image | `p = 2`, `n = 2`, `m = 1`, Schur | `δ(1) ≠ 0` in `H¹(ad⁰)` but `0` in `H¹(ad)`; tangent = `Z¹(ad⁰)/B¹(ad)` = image | README right; DDT's literal reading overcounts by one | none (source issue) |
| 3.6a parenthetical: `H¹(ad⁰⊗K/𝒪) ↪ H¹(ad⊗K/𝒪)` | `p = 2`, `n = 2`, `𝒪 = ℤ₂` | `tr(xI) = 2x`; `×2` is onto `ℚ₂/ℤ₂`, so the boundary vanishes | true (`𝒪` has characteristic 0 per Conventions) | none |
| 3.6a level-`m` isomorphism (DDT L2.40 proof, line 2829) | `m = 1`, `m = 2` | `θ̄ + εδ` ↔ `Hom(℘/℘², 𝒪/λ^m)`; `det(1+εc) = 1 + ε·tr c`; classes `Z¹(End⁰M)/B¹(End M)` | true; level-`m` centraliser is scalars by induction | none |
| 3.6a limit over `m` | `λ^{−m}𝒪/𝒪 ⊂ λ^{−m−1}𝒪/𝒪` (×ϖ) | the fibre-product ring map to `(𝒪/λ^{m+1})[ε]` keeps type `ℳ`; `℘/℘²` finitely generated, so Hom to `K/𝒪` is a colimit | true | none |
| Check tangentTorsion_level_one | `R = 𝒪 ⊕ ℘` | `𝔪 = λ⊕℘`, `𝔪² = λ²⊕(λ℘+℘²)`, `𝔪/(λ,𝔪²) = ℘/(λ℘+℘²)` | true | none |
| Check tangentTorsion_rank_one | `n = 1` | `R_ℳ = 𝒪`, `℘ = 0`, `ad⁰ = 0`: both sides 0; a full-adjoint variant gives `Hom(G, 𝒪/λ^m) ≠ 0` | true, discriminating | none |
| Check tangentTorsion_trace_boundary | `p = 2`, `n = 2` | `H⁰(ad) = k`, `tr(aI) = 0`, so `δ` injective; `δ(1) = d(E₁₁)` in `ad` | true; agrees with LocalGaloisDeformationRings §8.6 Check | none |
| 3.6a *Needs* pointer | §F.2.2 against §F.2.1 on main | F.2.2: `G_{F,S}`, `G_K` only; F.2.1: topologically f.g. ⇒ `Φ_p` | wrong section | C01 |
| DDT reference | Darmon's publication list | pp. 1–157 against README's 1–107 | wrong range | C02 |
| Headline 3.7 presentation (untouched) | `n = 1`, `T = S ≠ ∅` | `g = h¹_rel = |T| − 1`; `R^{□T} = 𝒪⟦x₁…x_{|T|−1}⟧`; 0 relations, `h²_rel = 0` | consistent | none |
| Headline 4.10 `character_eq_one_of_dyadic_self_twist` | `A = ℤ₂`, `ρ = Ind ψ` dihedral, `χ` quadratic | `U = diag(1, −1) ≡ 1 mod 2` and `χ⊗ρ = UρU⁻¹`, `χ ≠ 1`: excluded by the nonsolvable hypothesis | hypothesis needed; statement holds | none |
| Headline 5.6 `exists_primes_jointly_injective` | `H = 0`, `q = 0` and `q = 2` | `q = 0`: `Q = ∅`; `q = 2`: the padding class (`ConjClasses` nonempty) has positive density, and degree-one primes have density 1 | true | none |
| Headline 8.7 ACC presentation | `n = 2`, `[F⁺:ℚ] = 1`, `q = 3` / `q = 1` | `g = 2` / `g = −2`, hence "prove `g ≥ 0`" before indexing | consistent | none |

- Source locators checked: 5 DDT locators (§2.6 p. 73, Theorem 2.36 p. 73, Lemma 2.39 p. 75, Lemma 2.40 p. 76, proofs pp. 75–76), DDT lines 2724–2829, from the authors' PDF on Darmon's page.
- Library declaration opened: `TauCeti.ContCohomology.H1` (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`, line 829, at the pinned Tau Ceti).
- Cross-roadmap citations resolved on main: LocalGaloisDeformationRings §§F.1.3, F.1.7, F.2.1, F.2.2, F.2.9, 8.6 (with its `p = 2` Check); ArithmeticGaloisDuality §D8.1, *First-order Galois cocycle comparison* and *Trace-zero adjoint duality without division by n*; SelmerIwasawaCohomology §2A.4; 9 in all. Main has not changed any of them, or this folder, since the merge base. The consumer citation (UniformWildKernelBounds §3.4 → §3.6a, Schur case) matches the hypotheses.
- Record: the README at `aecb53a` and the head have the same 6 layers and every item; no id is removed or retitled, and §3.6a is a new id. Pull request #3036 changes one other line of this README (Layer 7 dependencies), with no common hunk; the description puts #3036 first for this folder.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` (unchanged by the pull request) gives only the two `sorry` warnings (lines 50, 65). The elaborated signatures of the 3 declarations match README 4.4, 4.10 and 5.6, with no section binder lost.
- Not re-checked: the other 14 sampled targets (3.7, 4.2, 4.3, 4.7, 4.8, 5.1, 5.2, 5.5, 5.6, 5.8, 6.3, 6.4, 7.3, 8.3). They lie in untouched text that the change does not affect.
- Pull request text: the description's general account (published theorems added to general roadmaps, in the source's generality, with the source named) covers §3.6a, and its merge-order paragraph orders #3036 first for this folder. No sentence is contradicted by the head.

Overlap check: searched by object (`℘/℘²` tangent identification, type-`ℳ` rings, DDT §2.6) in LocalGaloisDeformationRings, PotentialAutomorphyInfrastructurePartII, GL2ModularityLifting (main) and OrdinaryAutomorphicFormsAndModularityLiftingPartII, AutomorphyLiftingBeyondTaylorWiles, ModularityAndLanglandsExtensionsPartII, GlobalGaloisDeformationsPartII (open). Only the deformation rings cut out by a category are shared: the local finite-length variant is owned by LocalGaloisDeformationRings §8.6, the general one by §3.6a here, which cites §8.6. Nothing else is shared.

Source independence: changed passages only; 9 passages compared with 1 source (DDT) and with LocalGaloisDeformationRings §8.6. The longest shared run is 5 words, in a list of hypotheses the mathematics forces (DDT line 2736); nothing else is shared. Largest share of locators: KW final, 33 of 94 counted by source label. Contents not compared: no layer was added, removed or reordered.

Research link: §3.6a is Wiles's identification of `℘/℘²` with a Selmer group (Wiles 1995, via DDT §2.6, lines 2786–2787), the cohomological input of `R = T`. The roadmap's headlines are the presentations used by Khare–Wintenberger (2009) and ACC (2023). Rests on the README's overview and References and on DDT.

## Not verifiable

- The credit to Wiles (1995) was not opened: the README gives no locator into it, and every locator of 3.6a is into DDT, which was read.

## Source issues

- **Error** in DDT at §2.6, definition before Lemma 2.39, p. 75: the source says `H¹_D(G, End⁰M)` is the intersection of `H¹(G, End⁰M)` with `H¹_D(G, End M)`, treating the first as a subgroup of `H¹(G, End M)`, false when `p ∣ d`; it should be the intersection of the image of `H¹(G, End⁰M)` with `H¹_D(G, End M)`; affects a stated result.

## For the human reviewers

- none
