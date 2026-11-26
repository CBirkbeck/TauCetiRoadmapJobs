# Review of EulerSystemsAndKolyvaginSystems (pull request #3188 at acd5006)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 28 changed lines since `94e80af`. I re-derived the four added passages myself: the bijection `F ↦ Δ(F)` with `H¹ = H¹_F` (0.1), the criterion that reduction modulo `π^k` is simple exactly when the local quotient is torsion-free (0.4), the claim that `F_can` and `F_ur` meet that criterion (0.7), and the kernel, cokernel and exact sequence for `H¹_F(K,T)/m^k → H¹_F(K,T/m^k)` (0.9). Each holds at the stated generality and agrees with the cited sections at the head of the SelmerIwasawaCohomology revision that the description names as a dependency; there is no finding. There are two small corrections (one on the description, one on untouched text), no format notes, and one question for the author. The three cited sections exist only at that revision's head, so it has to merge first. That, the licence of two linked copies and an untested source are left to the human reviewers.

## C01 — Three sentences of the description do not match the head

A reader who goes by the description gets the scope of the change slightly wrong in three places.

- "No section is added": the head adds the supplier-contract subsection "From SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8", as the description's own last bullet says. "No numbered section is added" would be accurate.
- The Layer 0.4 bullet says "the reduction modulo `π^k` of the canonical condition". In this roadmap "canonical" names `F_can` (Layer 0.7), but the added sentence in 0.4 (line 250) treats the condition `U(H¹_F(K_q, T))` of `Δ(F)` for every Selmer structure `F`. Would "the reduction modulo `π^k` of the condition `U(H¹_F(K_q, T))` of `Δ(F)`" serve?
- "the new text does not restate that lemma": the added sentence in 0.4 ends by asserting that the cartesian property "holds under the same hypothesis (Lemma 3.7.1`(i)`)". "the new text cites Lemma 3.7.1`(i)` only as the untouched sentence before it does" would be accurate.

## C02 — Untouched text: README Layers 0.8 and 0.9 point to sections by labels that name nothing

These labels are in the README, Layer 0.8 line 407 ("core-rank-independence-of-modulus") and Layer 0.9 lines 438 ("the invariants hypothesis of core-rank") and 446 ("apply selmer-torsion-identification"). They read like catalogue labels: no heading or other text in the README defines them, so a reader cannot follow the pointer. From the context they mean Layer 0.9, Layer 0.8 and Layer 0.6(b). Naming those sections would repair it. The pull request did not write this text, so this belongs in a separate pull request.

## Questions for the author

- Layer 0.7 admits the equal-characteristic ring `k⟦X⟧`, and the added sentence there forms `Δ(F_can)` through Layer 0.1 and SelmerIwasawaCohomology §2.22a. Does "every coefficient ring `R` of this section" in §2.22a include finite free `k⟦X⟧`-modules? Its §2.21 does not say which rings its compact coefficients are over, and the Conventions of that roadmap name only `O`-lattices, so I could not settle it from the text. (§2A.8 is explicitly stated over every complete noetherian local ring.)

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 added: `Δ(F)` simple, `H¹(RΓ_f(Δ(F))) = H¹_F(K,T)`, `F ↦ Δ(F)` bijective up to zigzags (seeded target 0.1) | `U(L)` degreewise; two simple `U, U′` with equal `L`; complex place in modified diagram; MR16 Def. 2.1 Selmer module | `H^j(U(L)) = H^j(C_v)` for `j ≤ 0`, `H¹ = L`; `U ← τ≤1U → U(L)`; `C_v^mod = 0`, `L = 0`; Selmer module uses `H¹(K_Σ/K, T)`, matching `S = Σ(F)` | holds; injective (image recovers `L`), surjective (`L_v = im H¹(i_v)`) | none |
| 0.4 added: reduction mod `π^k` of `U(L)` simple ⇔ `H¹/L` torsion-free; then `≃ U(L̄)` | cone by hand; `ℤ_p` trivial at `p`, `L = pℤ_pχ`; `L = ℤ_p(ψ| + pχ)` | `U/π^k → U(L̄)` onto, kernel `(H¹/L)[π^k]` in degree 1, so cone `≃ (H¹/L)[π^k][0]`; first case cone `𝔽_p`, propagated `0` but preimage `𝔽_pχ` (neither simple nor cartesian); second quotient `≅ ℤ_p` | holds; `π^k`-torsion-free ⇔ torsion-free over a DVR | none |
| 0.4 added: cartesian along `π^{j−i}` under the same per-place hypothesis | direct proof via `0 → H¹(T)/π^i → H¹(T/π^i) → H²(T)[π^i] → 0`; MR16 Remark 3.2 | `π^{j−i}x ∈ L_j` ⇒ `x = ȳ`, `π^{j−i}(y − π^i z) ∈ L` ⇒ `y − π^i z ∈ L`; MR16 reports MR04 Lemma 3.7.1(i) with this hypothesis | holds | none |
| 0.7 added: every local quotient of `F_can`, `F_ur` torsion-free | `v | p∞` (relaxed), `q ∤ p∞` (rational inertia kernel), `𝔭 | p` for `F_ur` (saturation); `p = 2` real place | quotient `0`; injects into `Frac(R)`-module `H¹(K_q^{ur}, V)`; torsion-free by definition; `F_ur`, `F_can` relaxed at `∞` so `0` | holds, including `p = 2` | none |
| 0.9 added: kernel subquotient of `⊕(H¹/L_v)[m^k]`, cokernel quotient of `H²(RΓ_f)[m^k]`, for all `F` | both §2A.8 sequences composed; direct kernel computation | kernel `⊆` image of `⊕N_v`; cokernel quotient of `H¹(C_f/π^k)/(Sel/π^k) = H²[π^k]`; direct: `c = π^k d`, `loc(d) ∈ (H¹/L)[π^k]` | holds | none |
| 0.9 added: torsion-free ⇒ `0 → H¹_F/m^k → H¹_F(T/m^k) → H²[m^k] → 0` | `ℚ`, `S = {p,∞}`, `T = ℤ_p`, `L_p = ℤ_p(ψ| + pχ)`, `k = 1`; archimedean, `p` odd | `Sel = 0`, `Sel(𝔽_p) = 𝔽_pψ̄`, `H² = coker(ψ ↦ −p) = ℤ/p`: `0 → 0 → 𝔽_p → 𝔽_p → 0`; `H¹(ℤ/2, T) = 0` as `2 ∈ R^×` | holds; parenthetical true | none |
| Supplier contract: §§2.22a, 2.23a, 2A.8 use no perfectness and not `(P)` | §2A.8 principal case; §2.22a without `(P)`; `H²` sequence of §2.23a in modified diagram at a real place, `p = 2` | "no perfectness is needed"; `H¹ = Sel_L` without `(P)`; `H^j(U^−) = 0` (`j ≤ 0`), `H¹(C)/L`, `H^j(C)` (`j ≥ 2`) | holds (the duality part of §2.23a needs `p` odd; not consumed) | none |
| `compactIrreducible_h1_vanish` (unchanged headline) | `G = ℤ/2` by sign on `ℚ_p`; `G = ℤ_p` via faithful `χ` into `1 + pℤ_p`; control `ℤ_p` trivial | `H¹ = 0` (2 invertible); `H¹ = V/(γ−1)V = 0`; control not faithful, `H¹ = ℚ_p ≠ 0` | holds; faithfulness needed | none |
| `integralComparison_finiteCokernel_maximalDivisible` (unchanged headline) | `G = ℤ/p` trivial, `ℚ_p ⊃ ℤ_p`; control `∏_ℕ ℤ/p` | `H¹(V) = 0`, `H¹(V/L) = ℤ/p`, `I = 0` maximal divisible, cokernel order `p`; control infinite `Hom`, excluded by finite generation | holds | none |

- Previous review (of the adding pull request at `a0e5702`): accepted with no open finding (its R01 already repaired), so nothing carries over.
- Seeded sample: only 0.1 falls in changed text; its added paragraph cites no source, and its Mazur–Rubin 2016 locators (Definition 2.1, p. 6; Definition 4.1, p. 8) were checked against the text (MazurRubin2016 lines 237–252, 355–360). The other fourteen targets (0.2, 1.17, 1.18, 1.23, 3.1, 3.14, 4.14, 5.7, 5.8, 5.9, 6.7, 8.10, 8.13, 8.37) lie outside the changed and affected text and were not re-checked. The README flags no locator as unverified.
- Source locators checked: 3 (MR16 Definition 2.1, Definition 4.1, Remark 3.2 p. 7, the last for the attribution of the 0.4 sentence).
- Cross-roadmap citations resolved: SelmerIwasawaCohomology §2.22a (heading line 813), §2.23a (line 868), §2A.8 (line 1487) at the head of the SelmerIwasawaCohomology revision named in the description; titles match the README word for word; that roadmap cites nothing of this one (no cycle). The overlap listing shows no open pull request dropping an id this README cites and no other pull request changing this roadmap.
- Dependency check: `depcheck: 73 roadmaps, 930 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The new `*Needs:*` edges (Layer 0.1 from 0.4, 0.7, 0.9) point downward.
- Automatic checks re-run at `acd5006`: every counter 0, `OK`, `outside-folder=0`; nothing changed outside the folder.
- Elaboration of `Suggested.lean`: two warnings, both `declaration uses sorry` (102:8, 120:8); the file is unchanged by the pull request, and its elaborated signatures are those of the previous review.
- Duplication: simple local conditions, `Δ(F)` and their base change are stated only in SelmerIwasawaCohomology (search of all open heads and main); this roadmap cites them and states nothing new of its own.
- Headline theorems: the change adds or removes none; `Suggested.lean` states the two statable ones and its docstring names the rest as not statable, as before.

Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology (main and the head of the revision cited), EulerSystemsCyclotomicMainConjecture, ModularIwasawaMainConjectures, ModularIwasawaMainConjecturesPartII. The only object one of them shares with this change is the simple local conditions with `Δ(F)` and their base change, owned by SelmerIwasawaCohomology and cited here. HeegnerPointEulerSystems §8.18 builds its own ordinary Λ-adic Selmer complex from the SelmerIwasawaCohomology carrier, not from simple conditions. The other SelmerIwasawaCohomology revision drops no id cited here.

Source independence: changed passages only; 6 passages compared (the four added paragraphs, the overview sentence, the new supplier subsection) with 1 readable source (Mazur–Rubin 2016, Definition 2.1 and Remark 3.2), none shared; Mazur–Rubin 2004 Lemma 3.7.1 not readable at a legal host; largest share Mazur–Rubin 2004, about 160 of about 490 citations by name (rough count); arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap is the Euler- and Kolyvagin-system descent of Mazur–Rubin (2004, 2016), Howard (2004), Rubin (2000) and Burns–Sakamoto–Sano (2018), used for Heegner-point, cyclotomic-unit and Kato-class bounds; the change ties its Selmer structures to Selmer complexes. Rests on the README overview and References.

## Not verifiable

- Mazur–Rubin 2004, Lemma 3.7.1(i), cited again by the added 0.4 sentence: the memoir is behind the publisher's paywall, the arXiv identifiers tried are other papers, and the only copy linked in the README is on a third party's page. The attribution was checked only through Mazur–Rubin 2016 Remark 3.2, and the mathematics was proved directly (table).
- The description's account of which AI tools drafted and reread the text cannot be checked from the head.
- Automatic checks set aside as false positives: the signature listing reads the docstring words "structure and" at `Suggested.lean` line 84 as a declaration named `and`; there is no such declaration.

## Source issues

- none

## For the human reviewers

- **Merge order.** The README cites SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8 (lines 53, 250, 337, 450, 5867), which exist only at the head of that roadmap's open revision, named in the description under "Depends on". That revision merges first.
- **Licence.** `README.md` References and 0.1: the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page, not an author's page or the publisher.
- **Licence.** `README.md` References: Rubin's published "Euler Systems" is linked from W. Stein's site, described there as the author's file.
- **Not tested.** Mazur–Rubin 2004, the source with the largest share of locators, could not be read legally; the changed passages cite it only for Lemma 3.7.1(i), and their wording was not compared against it.
