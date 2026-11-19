# Review of GL2ModularityLifting (pull request #1071 at 647d6aa)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The finding of the previous review is repaired: §1.7 now imports Clozel–Harris–Taylor's Lemma 4.1.2 from ClassicalSerreModularity, whose target and Lean theorem state it as §1.7 quotes it, and `Suggested.lean` keeps only the field-descent theorem. There is one small correction, not blocking (the rewritten Check of §12.2 gives both lifts of Dieulefait–Pacetti's Paso 4 weight two, where the source's first lift has the weight of the system), no format note, and two points for a human to decide.

## C01 — The first Check of §12.2 says both lifts compared in Paso 4 have weights `{0,1}`; in the source only the new lift does

A reader takes from the Check (line 2564, "Both lifts are odd with weights `{0,1}`, so each pair is an instance of the statement with `k = k′ = 2`") that Dieulefait–Pacetti use Theorem 1.5 only between weight-two lifts, and so that the freedom `k ≠ k′` of the statement is not exercised there. It is. The system that enters Paso 4 is the last one built in Paso 3, through a minimal crystalline lift given by their Theorem 1.9 (3), whose Hodge–Tate weights are `{0, k(ρ̄) − 1}` (dp lines 548–552 and 251–252); it has weight two only when Paso 3 changes nothing. In step (1) its 2-adic member is compared with a Steinberg lift of weights `{0,1}` (dp lines 607–614), so the pair is an instance with `k` the weight of the system and `k′ = 2`. The same holds in step (3) when it is reached directly; when it is reached through step (2), the system comes from Lemma 2.3 and has weights `{0,1}` (dp lines 564–571, 626–633), and only then is `k = k′ = 2`.

The pair is an instance of §12.2 in every case, so the statement and the locator stand. The smallest change: replace "the 2-adic member of a weight-two system" by "the 2-adic member of the system left by Paso 3, of weights `{0,k−1}`", and the sentence quoted above by one saying that each pair is an instance with `k′ = 2`, and with `k = 2` as well in step (3) after step (2).

## Previous findings

- R01 — repaired: §1.7 reads "Import ClassicalSerreModularity §I.0, `I.0/soluble-totally-real-base-change` … in its form over a number field"; `cht_soluble_prescribed_completions` and the three completion declarations are gone from `Suggested.lean`.
- C01 — partly repaired: the Check now cites "Paso 4, steps (1) and (3), p. 13" and says that §3 is not an instance; it gives both lifts weights `{0,1}`, which the source does not (C01 above).
- N01 — repaired: §7.1 "the odd-prime lifting proposition at p", §7.2 "The dyadic lifting proposition asserts", §7.4 "The ordinary 3-adic lifting proposition asserts"; the residual predicates and the family view are prose as well.
- N02 — repaired: the Check with `L_v = K_v` is removed; the remaining Check reads "If every `E_v = F_v`, the lemma gives a soluble E/F … in which every `v ∈ S` splits completely".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.7 (sample; import) | supplier target and Lean theorem; `S = ∅`; all `E_v = F_v`; complex v | supplier: number field, places finite or infinite, `K_v ⊗ E ≅ (L v)^n`, `n > 0`; `E = F`; `n = [E:F]`; `ℂ` forced; cht lines 5723–5726 | sound; cited, not restated | none |
| §1.8 (derivation from §1.7) | D = Galois closure of `L·K(μ_p)`; place u; real places | `E ∩ D = F` gives disjointness from L, K, `K(μ_p)`; local degree 2 at u divides `[F′:F]`; `ℝ` at all real places: totally real | sound | none |
| §5.3 (existence) | `S` with real `L_v`; `ℚ(√6)`, `L_3 = ℚ_3(√−3)`; Gee Fact 4.27 | `6/(−3) = −2 ≡ 1 (mod 3)`, a square in `ℚ_3`; gee-mlt lines 1432–1437: no disjointness clause, infinite places allowed | sound | none |
| §7.1 (sample) | DP Theorem 1.4; `p = 3` | dp lines 140–147, p. 4: odd p, `ℚ(√p*)`, `{0,k−1}`, `k > 1`, `ρ̄ ≅ ρ̄_f`; `ℚ(√−3) = ℚ(ζ₃)` | sound; name now prose | none |
| §12.2 Check | Paso 3, Paso 4 (1)–(3), Lemma 2.3, §3 | system weight `{0,k(ρ̄)−1}` (dp 548, 251); new lifts `{0,1}` (dp 611, 631); `{0,1}` after Lemma 2.3 (dp 567); §3 uses 1.4, 1.6 (dp 699–702) | instance; weights misdescribed | C01 |
| §12.3 (sample) | DP Theorem 1.6; Pan 1.0.2; `V₅(11a1) ⊗ ε` | dp lines 166–173, p. 4: `p ≥ 5`, irreducible, `k > 1`; pan lines 100–105: odd p, `p = 3` excludes ratio `ω`; weights `{1,2}` | sound; wording only changed | none |
| Contract, ClassFieldTheory Layers 7, 11–12 | layers on main; uses in the text | Layer 7 absolute local Artin map, 11 global reciprocity, 12 global existence; cited only at §10.7a (line 2317); Layer 13 at §7.11; no Grunwald–Wang citation left | sound | none |
| `odd_involution_descent` | `#check`; one-tactic probe | type as README §0.1, no binder lost; `simp`, `rfl`, `infer_instance` each leave the goal | sound; docstring updated | none |

The rows for the untouched statements stand as in the previous review, of `0ba9e9a`.

- Source locators read at the text this round: 9 in 4 sources (dp 6: Theorems 1.4, 1.5, 1.6, 1.9, Pasos 3–4, §3; gee-mlt 1; cht 1; pan 1).
- Library: no library declaration is named by the changed passages; the pinned import of Tau Ceti's places module is removed with the theorem that used it.
- Cross-roadmap citations resolved this round: ClassicalSerreModularity `I.0/soluble-totally-real-base-change` (README of its open head, line 269, under §I.0) and `soluble_prescribed_completions` (its `Suggested.lean`, line 82); ClassFieldTheory Layers 7, 11, 12, 13 on main.
- Dependency check: `depcheck: 200 roadmaps, 2207 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The automatic checks all pass on this head. No change outside the folder.
- `lake env lean` on `Suggested.lean`: one `sorry` warning (line 46) and nothing else. `#check @odd_involution_descent` in a copy: no `variable` block, every hypothesis in the signature.
- Headline theorems: as in the previous review; none but §0.1 is statable at the pins and the docstring names the missing carriers. §1.7 is an import and is rightly no longer stated.
- Pull request text against the head: title and description agree (one Lean theorem, §1.7 imported, consumers sent to the supplier's target, suppliers as listed).

Overlap check: read ClassicalSerreModularity, SerreModularityByCompatibleSystems, CompletedCohomologyAndLocalGlobalCompatibility, OrdinaryAutomorphicFormsAndModularityLifting, PotentialModularityAndCompatibleSystems, PotentialAutomorphyInfrastructurePartII, SerreWeightAndLevelOptimisation, GlobalGaloisDeformations, LocalGaloisDeformationRings (the last eight as in the previous review; ClassicalSerreModularity reopened); shared: Clozel–Harris–Taylor's Lemma 4.1.2, owner ClassicalSerreModularity `I.0/soluble-totally-real-base-change`, now imported here; the other shared objects as in the previous review. The open heads of PotentialModularityAndCompatibleSystems (README lines 759, 763) and EllipticCurveModularityImaginaryQuadraticPartII (README line 1744) still name `cht_soluble_prescribed_completions` of §1.7; this README's Downstream consumers gives the new owner and name, so nothing is asked here.

Source independence: changed passages only: 4 passages compared with 3 sources (§1.7 with cht and gee-mlt, §5.3 with gee-mlt, the §12.2 Check and its locator with dp), none shared beyond the hypotheses of the lemma; largest share kw2, as in the previous review; no layer added, removed or reordered, so the contents were not compared again.

Research link: Layers 1–6 are the lifting theorems of Khare–Wintenberger (2009) and Kisin (2009) behind Serre's conjecture; Layers 7–12 are those of Kisin (2009), Hu–Tan (2015), Tung (2021), Pan (2022) and Skinner–Wiles (1999) that Dieulefait–Pacetti (2023) use. Rests on the README summary and on kw2, dp, pan, tung-odd, tung-dyadic.

## Not verifiable

- Kisin's Annals, Durham and 2-adic papers are cited by author DVI files that could not be read; no changed passage depends on them.
- Supplier and consumer heads were read through the roadmap tools; line numbers given for other roadmaps are those of their files at the head read.

## Source issues

- **Misprint** in tung-dyadic at Theorem 8.0.3(3), p. 38: the source says the reduction of ρ is totally odd; it should say ρ itself is totally odd, `det ρ(c_v) = −1`, since the reduction modulo 2 cannot see the sign; affects a stated result.
- **Gap** in dp at Theorem 1.7, pp. 4–5: the source says the determinant is a character ψ times a power of the cyclotomic character, with no condition on ψ; it should require ψ of finite order, as Skinner–Wiles do; affects a stated result.

## For the human reviewers

- **Scope.** Every theorem of Layers 7–12 is conditional on named hypotheses (LL1–LL3, CC1–CC5) that this roadmap does not prove (`README.md`, "Conditional arithmetic hypotheses"); SerreModularityByCompatibleSystems states that it discharges them.
- **Not tested.** Three cited texts of Kisin (the Annals paper, the 2-adic paper, the Durham paper) are cited by author DVI files that the sources service cannot read; wording and locators of §§5.1, 5.6, 5.10, 5.16, 6.7a, 6.8, 6.9 were not compared with them.
