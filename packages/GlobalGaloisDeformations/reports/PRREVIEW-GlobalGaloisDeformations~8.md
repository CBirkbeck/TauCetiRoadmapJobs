# Review of GlobalGaloisDeformations (pull request #3027 at 3b77a6a)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 93 changed lines since `74a09b7`. The folder's text is the one the previous review read; the change is the new §3.6a (universal rings of type `(𝒪, χ, ℳ)` and the identification of `Hom_𝒪(℘/℘², 𝒪/λ^m)` and `Hom_𝒪(℘/℘², Frac(𝒪)/𝒪)` with `H¹_ℳ`), with the matching lines of the guide, the R04.3 dependencies, the scope and the references. I read DDT §2.6 at each locator, recomputed the statement, its proof route and its three Checks (including `p ∣ n`, `n = 1`, `m = 1`), and resolved every citation of the section on `main` and at this head: no finding. Accepted with two small corrections, both carried over from the previous review and not yet made (a supplier pointer and a page range), and no format notes; nothing is left for a human to decide.

## C01 — The *Needs* line of 3.6a cites LocalGaloisDeformationRings §F.2.2 for `Φ_p`, but for the group of 3.6a the statement is in §F.2.1

Not repaired since the previous review: the line still reads "§§F.2.2, F.2.9 (`Φ_p` and fixed-determinant representability)" (line 367). A reader who follows it finds only the arithmetic cases: §F.2.2 on `main` proves `Φ_p` for `G_{F,S}` and for `G_K`, `K/ℚ_ℓ` finite. The group of 3.6a is an arbitrary topologically finitely generated profinite group, and the statement it needs is the last API bullet of §F.2.1 ("Topologically finitely generated profinite groups satisfy `Φ_p`"), which §F.2.9 then uses. The line would read "§§F.2.1, F.2.9 (`Φ_p` for topologically finitely generated groups, and fixed-determinant representability)".

## C02 — The DDT entry of the References gives the printed article as pages 1–107; it is pp. 1–157

Not repaired since the previous review (line 2328). Darmon's publication list gives *Current Developments in Mathematics* 1, 1995, International Press, pp. 1–157. No locator is affected, since all of them are pages of the authors' PDF, which the entry says; only a reader looking for the printed article is given the wrong extent. "1–107" would read "1–157".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 3.6a representability (DDT Theorem 2.36, DDT line 2747) | `n = 1`; `ℳ` = all profinite modules | `n = 1`: only `χ_A`, so `R_ℳ = 𝒪/I`; `ℳ` = all: the fixed-determinant ring of LocalGaloisDeformationRings §F.2.9 | hypotheses agree with DDT lines 2731–2746 | none |
| 3.6a remark: for Schur `ρ̄`, conjugacy is `Γ̂ₙ(A)`-conjugacy up to a scalar | `ρ′ = gρg⁻¹`, `g ∈ GLₙ(A)` | `ḡ` commutes with `ρ̄`, so `ḡ = a ∈ k^×`; `ã⁻¹g ≡ 1 mod 𝔪_A` conjugates the same way | true | none |
| 3.6a: `H¹(G, End M)` as self-extensions killed by `λ^m` | `M` free over `𝒪/λ^m` | `M` projective over `𝒪/λ^m`, so every such extension splits linearly and is a cocycle in `End M` | true; needs freeness, which is assumed | none |
| 3.6a: `H¹_ℳ(G, End⁰M)` as intersection with the image of `H¹(G, End⁰M)` | `p = 2`, `n = 2`, `m = 1`, Schur | `tr(aI) = 2a = 0`, so `δ(1) ≠ 0` in `H¹(ad⁰)`, `0` in `H¹(ad)`; tangent is `Z¹(ad⁰)/(B¹(ad) ∩ Z¹(ad⁰))` | README's reading is the right one | none (source issue) |
| 3.6a parenthesis: `H¹(ad⁰ρ ⊗ K/𝒪) → H¹(ad ρ ⊗ K/𝒪)` injective | `p = 2 = n`, `𝒪 = ℤ₂` | scalars `xI ↦ 2x`; `×2` is onto `ℚ₂/ℤ₂`, so the connecting map is zero | true; uses characteristic 0 of `𝒪`, which the Conventions give | none |
| 3.6a: `ad⁰ρ ⊗ 𝒪/λ^m = End⁰(M_ρ ⊗ 𝒪/λ^m)` | `n = 2`, `p = 2` | `tr(E₁₁) = 1`: trace is split onto `𝒪`, so its kernel commutes with `⊗ 𝒪/λ^m` | true | none |
| 3.6a level-`m` isomorphism (DDT Lemma 2.40 and proof, DDT lines 2825–2829) | `m = 1`, `m = 2`; `a = α + x`, `b = β + y` | `δ(ab) = αδ(y) + βδ(x)`: linear maps killing `1`, `℘²` are the `θ`-derivations; `det(1 + εc) = 1 + ε·tr c`; centraliser of `ρ mod λ^m` is scalars (induction on `m`) | true | none |
| 3.6a passage to the limit | `λ^{−m}𝒪/𝒪 ⊂ λ^{−m−1}𝒪/𝒪` | `℘/℘²` finitely generated, so `Hom(℘/℘², K/𝒪) = lim Hom(℘/℘², λ^{−m}𝒪/𝒪)` | true | none |
| Check tangentTorsion_level_one | `R_ℳ = 𝒪 ⊕ ℘` | `𝔪 = λ ⊕ ℘`, `(λ, 𝔪²) = λ ⊕ (λ℘ + ℘²)`, quotient `℘/(λ℘ + ℘²)` | true | none |
| Check tangentTorsion_rank_one | `n = 1` | `R_ℳ = 𝒪/I`, `θ` forces `I = 0`, `℘ = 0`, `ad⁰ρ = 0`: `0 = 0`; with `ad` in place of `ad⁰` the right side is `Hom(G, 𝒪/λ^m)` | true, and tells `ad⁰` from `ad` | none |
| Check tangentTorsion_trace_boundary | `p = 2`, `n = 2`, Schur | `H⁰(ad ρ̄) = k → H⁰(k)` is `a ↦ 2a = 0`, so `δ` is injective and `δ(1) ≠ 0`; it dies in `H¹(ad ρ̄)` | true; agrees with the Check of LocalGaloisDeformationRings §8.6 | none |
| 3.6a *Needs*: `Φ_p` pointer | §F.2.2 against §F.2.1 on `main` | F.2.2: `G_{F,S}`, `G_K`; F.2.1: topologically finitely generated ⇒ `Φ_p` | wrong section | C01 |
| 3.6a *Needs*: first-order comparison at `𝒪/λ^m` | ArithmeticGaloisDuality §D8.1 and `Adjoint.firstOrderLift_equiv_cocycles` | prose has `k` a field, then "for every ring `A`"; the Lean binder is `[Ring A]`, so `A = Mₙ(𝒪/λ^m)` is covered | supplier states what is used | none |
| DDT reference entry | Darmon's publication list | pp. 1–157 against the README's 1–107 | wrong extent | C02 |
| Headline 4.10 `character_eq_one_of_dyadic_self_twist` (untouched) | elaborated type against README | `[IsLocalRing A]`, finite residue field, `CharP … 2`, nonsolvable residual range, `U ≡ 1`: all present in the elaborated type | agrees | none |
| Headline 5.6 `exists_primes_jointly_injective` (untouched) | `H = 0`, `q = 0` | `Q = ∅`, the map from `0` is injective; `Module.finrank k H ≤ q` and `[FiniteDimensional k H]` in the elaborated type | agrees | none |

- Source locators checked against the text: 5 (DDT §2.6 p. 73, Theorem 2.36 p. 73, Lemma 2.39 p. 75, Lemma 2.40 p. 76, the proofs pp. 75–76; DDT lines 2724–2830), in the authors' PDF dated 9 September 2007 (DDT line 25), fetched from Darmon's page.
- Library declarations opened at the pin: `TauCeti.ContCohomology.H1` (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`, line 829).
- Cross-roadmap citations resolved, on `main` and at this head: LocalGaloisDeformationRings §§F.1.3, F.1.7, F.2.1, F.2.2, F.2.9, 8.6 (with its `p = 2` Check); ArithmeticGaloisDuality §D8.1, both named items (the pull request adds §D7.6a to that roadmap and leaves D8.1 as it is); SelmerIwasawaCohomology §2A.4. The one consumer, UniformWildKernelBounds (README lines 808 and 4583), cites §3.6a for its tangent spaces at `𝒪`-valued points.
- Record: the README at the merge base and the head have the same 6 layers; no heading is removed or retitled; §3.6a is a new id; `Suggested.lean` is unchanged.
- Previous review: no finding; its two small corrections are C01 and C02 here, neither repaired (the folder's text is unchanged since that head).
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 50 and 65), nothing else. The elaborated types of its 3 declarations agree with README 4.10 and 5.6; no section binder is lost.
- Seeded sample (3.5, 3.6, 3.7, 4.2, 4.11, 5.1, 5.2, 5.8, 6.1, 6.4, 6.7, 7.1, 7.2, 8.2, 8.4): none lies in a passage the change adds, alters or affects, so none was re-checked; 3.6 and 3.7 neither cite nor depend on 3.6a.

Overlap check: read LocalGaloisDeformationRings §§F.2.1–F.2.2, F.2.9 and 8.6 (main); searched PotentialAutomorphyInfrastructurePartII and GL2ModularityLifting (main), and every open head and every roadmap on main, for the object (`℘/℘²` against a Selmer group, rings of type `ℳ`, DDT §2.6); only the rings cut out by a category are shared: the local finite-length form is owned by LocalGaloisDeformationRings §8.6, the form for a topologically finitely generated profinite group by §3.6a here, which cites §8.6. Nothing else is shared.

Source independence: changed passages only; 9 passages compared with 1 source (DDT) and with LocalGaloisDeformationRings §8.6; longest shared run 5 words, in the closure hypotheses on the category (DDT line 2736), which the mathematics forces; none copied. Largest share of locators: KW final (21 page locators by my count, against 13 for Gee, 6 for ACC, 4 for DDT). Contents not compared: the change adds, removes or reorders no layer.

Research link: §3.6a is Wiles's computation of `℘/℘²` by a Selmer group (Wiles 1995, as presented by Darmon–Diamond–Taylor 1995, §2.6), the Galois side of `R = T`; the roadmap's headlines are the presentations used by Khare–Wintenberger (2009) and ACC (2023). Rests on the README's overview and References and on DDT line 2787.

## Not verifiable

- Wiles (1995): the README credits the result to it without a locator, and every locator of 3.6a is into DDT, which was read; the article itself was not opened.
- The pull request's description is cut off in the copy given to this review; the part read (through "Not in this pull request") has no sentence about this folder that the head contradicts. Its remaining text was not read.
- The head of the other open pull request that changes this roadmap was not available to read, so whether it and this change touch the same lines of this README was not checked.

## Source issues

- **Error** in DDT at §2.6, the definition before Lemma 2.39, p. 75: the source says the trace-zero group is the intersection of `H¹(G, End⁰M)` with `H¹_D(G, End M)`, as if the first were a subgroup of `H¹(G, End M)`; it should be the intersection with the image of `H¹(G, End⁰M)`, the map not being injective when `p` divides `d`; affects a stated result.

## For the human reviewers

- none
