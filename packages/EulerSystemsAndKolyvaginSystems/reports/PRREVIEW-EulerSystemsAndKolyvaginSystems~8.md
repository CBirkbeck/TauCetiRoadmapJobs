# Review of EulerSystemsAndKolyvaginSystems (pull request #3188 at acd5006)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 28 changed lines since `94e80af`. The four added passages (Layers 0.1, 0.4, 0.7, 0.9) and the new supplier-contract subsection were each proved again by hand and compared with SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8 at the head of the open revision that the description names as a dependency; all hold at the stated generality, and there is no finding. There are two small corrections (one on the description, one on untouched text), no format notes and one question for the author. The dependency on the open SelmerIwasawaCohomology revision, the licence of two linked copies and one source that could not be read are left to the human reviewers.

## C01 — Three sentences of the description do not match the head

A reader who goes by the description gets the change slightly wrong in three places.

- "No section is added": the head adds the supplier-contract subsection "From SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8" (README line 5867), as the description's own last bullet says. "No numbered section is added" would be accurate.
- The Layer 0.4 bullet says "the reduction modulo `π^k` of the canonical condition". In this roadmap "canonical" names `F_can` of Layer 0.7, whereas the added sentence of 0.4 (line 250) is about the condition `U(H¹_F(K_q, T))` of `Δ(F)` for every Selmer structure `F`. "the reduction modulo `π^k` of the condition `U(H¹_F(K_q, T))` of `Δ(F)`" would say what the head says.
- "the new text does not restate that lemma": the added sentence of 0.4 ends with the claim that the cartesian property "holds under the same hypothesis (Lemma 3.7.1`(i)`)". "the new text cites Lemma 3.7.1`(i)` only as the sentence before it already does" would be accurate.

## C02 — Untouched text: README Layers 0.8 and 0.9 point to sections by labels that name nothing

In `README.md`, Layer 0.8 line 407 ("Independence of the modulus is core-rank-independence-of-modulus") and Layer 0.9 lines 438 ("the invariants hypothesis of core-rank") and 446 ("apply selmer-torsion-identification") use hyphenated labels that no heading or sentence of the README defines, so the pointer cannot be followed. From the context they mean Layer 0.9, Layer 0.8 and Layer 0.6. Naming those sections would repair it. The pull request did not write these lines; this is for a separate pull request.

## Questions for the author

- Layer 0.7 admits the equal-characteristic ring `k⟦X⟧`, and Layer 0.1 a general complete noetherian local `R`; the added sentences form `Δ(F)` there through SelmerIwasawaCohomology §2.22a. Does "every coefficient ring `R` of this section" in §2.22a cover finite free modules over such rings? Its §2.21 names "compact, rational or discrete coefficients" and that roadmap's Conventions name only `O`-lattices, so I could not settle it from the text; §2A.8, which uses `U(L)` of §2.22a, is stated explicitly over every complete noetherian local ring with finite residue field.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 added: `H¹(RΓ_f(Δ(F))) = H¹_F(K,T)`; `F ↦ Δ(F)` bijective up to chains of quasi-isomorphisms | `U(L)` degreewise; two simple conditions with equal image; real place in the modified diagram; quotient `T/IT` | `H^j(U(L)) = H^j(C_v)` (`j ≤ 0`), `H¹ = L`; quasi-isomorphism over `C_v` preserves `im H¹`; `H¹(q_v)` bijective; `R/I` again complete local | holds: injective (image recovers `L`), surjective (`L = im H¹(U(L))`) | none |
| 0.4 added: reduction of `U(L)` mod `π^k` simple ⇔ `H¹/L` torsion-free; then `≃ U(L̄)` | kernel of `Z¹_L/f → C¹/f` by hand; `ℤ_p` trivial at `p`, `L = pℤ_pχ` and `L = ℤ_p(ψ + pχ)` | map onto `U(L̄)`, kernel `(H¹/L)[f]` in degree 1, so `H⁰(Cone(i/f)) = (H¹/L)[f]`; first `L`: `𝔽_p ≠ 0`; second: quotient `≅ ℤ_p`, `0` | holds; over a DVR no `π^k`-torsion ⇔ no `π`-torsion ⇔ torsion-free | none |
| 0.4 added: cartesian along `π^{j−i}` under the same hypothesis | direct proof with `0 → T/π^i → T/π^j → T/π^{j−i} → 0`; Mazur–Rubin 2016 Remark 3.2 | `ι_*x = ȳ` ⇒ `y = π^{j−i}y′`, `y′ ∈ L`; `x − ȳ′ = δ(t)` lifts to `H¹(T)[π^{j−i}] ⊆ L`; remark cites Lemma 3.7.1(i) with this hypothesis | holds | none |
| 0.7 added: every local quotient of `F_can`, `F_ur` is torsion-free | `v | p∞` relaxed; `q ∤ p∞` inertia kernel; `𝔭 | p` for `F_ur`; `k⟦X⟧` | quotient `0`; injects into the `Frac(R)`-module `H¹(K_q^{ur}, V)`; saturated by definition; `Frac(R)`-form used in equal characteristic | holds | none |
| 0.9 added: kernel a subquotient of `⊕(H¹/L_v)[m^k]`, cokernel a quotient of `H²(RΓ_f(Δ(F)))[m^k]` | composite of the two sequences of §2A.8 item 2 | kernel `= Sel/f ∩ im(⊕(H¹/L_v)[f])`; cokernel a quotient of `H¹(C_f/f)/(Sel/f) = H²[f]` | holds | none |
| 0.9 added: torsion-free ⇒ `0 → H¹_F/m^k → H¹_F(T/m^k) → H²[m^k] → 0`; archimedean parenthesis | `ℚ`, `S = {p,∞}`, `T = ℤ_p`, `L_p = ℤ_p(ψ + pχ)`, `k = 1`; real place, `p` odd | `Sel = 0`, `Sel(𝔽_p) = 𝔽_pψ̄`, `H² = coker(ψ ↦ −pχ̄) = ℤ/p`: `0 → 0 → 𝔽_p → 𝔽_p → 0`; `H¹(ℤ/2, T) = 0` as `2 ∈ R^×` | holds | none |
| Supplier contract: §§2.22a, 2.23a, 2A.8 need neither perfectness nor `p` odd / no real places | §2A.8 principal case; §2.22a at `p = 2`, real place; `H²` sequence of §2.23a | "No perfectness is needed"; "with or without `(P)`"; `H^j(U_v^−) = 0` (`j ≤ 0`), `H¹(C_v)/L_v`, `H^j(C_v)` (`j ≥ 2`) | holds for what is consumed (the duality paragraph of §2.23a needs `p` odd and is not consumed) | none |
| `compactIrreducible_h1_vanish` (headline, unchanged) | `G = ℤ/2` by sign on `ℚ_p`, `p` odd; control: `ℤ_p` acting trivially | `H¹ = 0` (order of `G` invertible, no invariants needed); control `Hom(ℤ_p, ℚ_p) = ℚ_p ≠ 0`, not faithful | holds; faithfulness needed | none |
| `integralComparison_finiteCokernel_maximalDivisible` (headline, unchanged) | `G = ℤ/p` trivial on `ℚ_p ⊃ ℤ_p`; control `G = ∏_ℕ ℤ/p` | `H¹(V) = 0`, `H¹(V/L) = Hom(ℤ/p, ℚ_p/ℤ_p) = ℤ/p`: `I = 0`, cokernel of order `p`, no divisible subgroup; control: infinite `Hom`, excluded by finite generation | holds | none |

- Previous review (of this same head): accepted with no finding, so there is none to repair; its two small corrections concern the description and untouched text and stand as C01 and C02 here, each verified again.
- Seeded sample: none of the fifteen targets (1.4, 1.18, 3.2, 3.11, 4.5, 4.18, 5.11, 8.12, 8.16, 8.26, 8.30, 8.31, 8.32, 8.34, 8.35) lies in changed text or in text the change affects (the change alters no existing statement); they were not checked. The README flags no locator as unverified.
- Source locators checked against the text: 3 (Mazur–Rubin 2016 Definition 2.1; Definition 3.1 and Remark 3.2, the latter for the attribution to Lemma 3.7.1(i) repeated by the added sentence of 0.4), in the cached Numdam copy of the published article, lines 241–244 and 341–348.
- Cross-roadmap citations resolved: SelmerIwasawaCohomology §2.22a, §2.23a, §2A.8 at the head `494ecd3` of its open revision (headings at lines 813, 868, 1487; titles agree word for word with the README's citations); `main` has none of the three; that revision is open and is named in the description and its merge-order paragraph.
- Dependency check: `depcheck: 94 roadmaps, 1058 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The new `*Needs:*` entries of 0.4, 0.7 and 0.9 on Layer 0.1 point downward.
- Automatic checks run again at `acd5006`: all pass; no file changed outside the folder.
- Elaboration of `Suggested.lean`: two warnings, both `declaration uses sorry` (102:8, 120:8). The file is unchanged by the pull request; the elaborated types of both theorems were compared with their statements and carry every binder.
- Record: no layer or item removed, retitled or renumbered; one supplier-contract subsection added. Duplication: simple conditions, `Δ(F)` and their base change are stated only in SelmerIwasawaCohomology (search over all open heads and `main`), and are cited here, not restated. Headlines: none added or removed.

Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology (`main` and the cited revision), EulerSystemsCyclotomicMainConjecture, ModularIwasawaMainConjectures; the only shared object of the change is the simple local conditions with `Δ(F)` and their base change, owner SelmerIwasawaCohomology, cited here; the others consume this roadmap's descent and own none of it.

Source independence: changed passages only; 6 passages compared (four added paragraphs, the overview sentence, the supplier subsection) with 1 source (Mazur–Rubin 2016), none shared; largest share Rubin, Euler Systems, 102 of 343 linked locators (Mazur–Rubin 2004: 63); Mazur–Rubin 2004 Lemma 3.7.1 not readable; arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap is the Euler- and Kolyvagin-system descent of Rubin (2000), Mazur–Rubin (2004, 2016), Howard (2004) and Burns–Sakamoto–Sano (2018), consumed by Heegner-point, cyclotomic-unit and Kato-class bounds; the change ties its Selmer structures to Selmer complexes. Rests on the README overview and References.

## Not verifiable

- Mazur–Rubin 2004, Lemma 3.7.1(i), cited again by the added sentence of 0.4: the memoir is paywalled and the only copy the README links is on a third party's page, which was not read. The attribution was checked through Mazur–Rubin 2016 Remark 3.2, and the statement was proved directly (table).
- The description's account of which tools drafted and reread the text cannot be checked from the head.

Automatic checks set aside as false positives: the listing of elaborated signatures reads the docstring words "structure and" at `Suggested.lean` line 84 as a declaration named `and`; the file has no such declaration.

## Source issues

- none

## For the human reviewers

- **Merge order.** The README cites SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8 (lines 53, 250, 337, 450, 5867), defined only at the head of that roadmap's open revision, which the description names under "Depends on". That revision merges first.
- **Licence.** `README.md` Layer 0.1 and References (untouched text): the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page, not an author's page or the publisher.
- **Not tested.** Mazur–Rubin 2004 could not be read legally; the changed passages cite it only for Lemma 3.7.1(i), and their wording was not compared with it. Rubin's "Euler Systems", the source with the largest share of locators, is cited by no changed passage and was not opened.
