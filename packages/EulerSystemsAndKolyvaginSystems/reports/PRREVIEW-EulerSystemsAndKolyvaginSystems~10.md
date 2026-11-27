# Review of EulerSystemsAndKolyvaginSystems (pull request #3188 at 10ffe54)

**Verdict:** accepted

**Summary.** An incremental re-review of the 22 lines changed since `acd5006`: accepted, with no finding. The new definition of the Selmer module by its kernel formula (Layer 0.1), the derivation in Layer 0.9 that the cokernel of `H¹_F(K,T)/m^k → H¹_F(K, T/m^k)` has length bounded independently of `k`, and the two supplier-contract paragraphs were each checked against the supplier sections they cite and on computed examples, and hold. There is one small correction (the description does not mention the second new supplier subsection) and one format note; the dependency on the open SelmerIwasawaCohomology revision, the licence of one linked copy and one unreadable source are left to the human reviewers.

## C01 — The description counts one new supplier-contract subsection and three cited sections; the head has two subsections and five sections

The description says "a new supplier-contract subsection name the three sections used". At this head Layer 0.9 also consumes ArithmeticGaloisDuality §D7.3 (Cohomological finiteness and perfect amplitude) and §R02.4.4 (Finiteness of Galois cohomology with restricted ramification): they are in its `*Needs:*` line (line 454), in the Layer 0 dependency list (line 486) and in a second new subsection of the supplier contracts (line 5955). A reader of the description alone does not learn that the revision adds two sections of that supplier. A sentence such as "Layer 0.9 also cites the finiteness clause of ArithmeticGaloisDuality §D7.3 and §R02.4.4, named in a second new supplier-contract subsection; both are on main" would make it right.

## N01 — Two more hyphenated labels of the kind this revision repaired remain in untouched text

Line 1231 ("by core-rank-formula") and line 4901 ("of twisting-by-characters-of-gamma") point to sections by labels that no heading defines, as the three repaired in Layers 0.8 and 0.9 did. Naming the layers they mean (apparently Layer 0.10 and the twisting section of Layer 8) would finish the repair; it can go in a separate change.

## Questions for the author

- Layer 0.1 says the Selmer kernel "is the Selmer kernel of SelmerIwasawaCohomology §2.2" for a module of the coefficient category over any coefficient ring. §2.2 states the kernel for abstract Selmer data, but its title and first sentence speak of compact lattice and rational coefficients. Is §2.2 meant to cover a global module `H¹(K_Σ/K, M)` over a general complete noetherian local `R`? Nothing in §2.2 excludes it, so I could not decide it from the text; the formula of Layer 0.1 is self-contained either way.

## Previous findings

- The previous report had no finding (no R-numbered point). Its small correction C01 is repaired: lines 407, 438 and 446 now read "Layer 0.9 The core rank is independent of the modulus", "Layer 0.8 The core rank of a cartesian Selmer structure" and "Layer 0.6 Selmer modules of quotients and torsion submodules".
- Its question (does §2.22a cover finite free modules over a general coefficient ring) is settled by the supplier's head: §2.22a now names that case ("a finite free `R`-module with continuous `R`-linear action", `R` complete Noetherian local with finite residue field of characteristic `p`) and keeps the identification with a §2.13 structure for §2.13's coefficients only, which is what the rewritten sentence of Layer 0.1 says.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1, Selmer module as `ker(H¹(K_Σ/K, M) → ⊕ H¹(K_v, M)/H¹_F)` (line 53) | `ℚ`, `Σ = {p, ∞}`, `M = 𝔽_p`, `p` odd, strict and relaxed at `p`; `p = 2`, `M = 𝔽₂`, strict at `∞` | `H¹(G_Σ, 𝔽_p) = 𝔽_p` injects into `H¹(ℚ_p, 𝔽_p) = 𝔽_p²`: strict `0`, relaxed `𝔽_p`; `p = 2`: global dimension 2, strict at `∞` leaves `ℚ(√2)`, dimension 1 | agrees with Mazur–Rubin 2016 Definition 2.1 and with the strict Check of the supplier's §2.22a | none |
| 0.1, "`H¹` of the Selmer complex of `Δ(F)` is the classical Selmer kernel", over every coefficient ring | supplier §2.22a at its head, second coefficient case; the exception it lists | §2.22a: `H¹(RΓ_f) = Sel_L` for finite free `T` over complete Noetherian local `R`; only the §2.13 identification keeps `O`-coefficients | the head's sentence uses the first and restricts the second to finitely generated `O`-modules | none |
| 0.9, cokernel of `H¹_F(K,T)/m^k → H¹_F(K,T/m^k)` has length ≤ length of the torsion of `H²(RΓ_f(Δ(F)))` (line 450) | `K = ℚ(√−31)`, `p = 3` (inert, class number 3), `T = ℤ_3(1)`, `Σ = {3, ∞}`, relaxed; `ℚ`, `T = ℤ_p`, strict at `p` | first: `Sel/3^k = ℤ/3^k`, `Sel(μ_{3^k})` of length `k+1`, cokernel `Pic(O_K[1/3])[3^k] = ℤ/3` for all `k`; `H² = ℤ/3`, bound 1, attained. Second: `H² = ℤ_p`, torsion 0, cokernel 0 | holds; the bound is sharp | none |
| 0.9, `H²(RΓ_f(Δ(F)))` finitely generated for every `p` | `p = 2`, `ℚ`, `Σ = {2, ∞}`; real place with `T = ℤ₂`, `ℤ₂(1)` | `Hʳ(G_Σ, 𝔽₂) = 𝔽₂` for `r ≥ 3`: finite, so the finiteness hypothesis holds though `cd₂ = ∞`; `H¹(ℝ, ℤ₂) = 0`, `H¹(ℝ, ℤ₂(1)) = ℤ/2`, finite | holds; perfectness correctly not used | none |
| 0.9, "extension of a submodule of `H²(K_Σ/K, T)` by a quotient of `⊕ H¹(K_v, T)`" | supplier §2.23a first sequence | `0 → coker(H¹(G_S,T) → ⊕ H¹(C_v)/L_v) → H² → ker(H²(G_S,T) → ⊕ H²(C_v)) → 0` | same sub and quotient | none |
| Supplier contract, §2A.8 principal case only; general case needs base change of cochains (line 5869) | supplier §2A.8 and §2A.6 at its head | principal case: "No perfectness is needed"; general: base-change maps assumed, given by §2A.6 for `R′` finite over `R` under `(P)`; edge map bijective under `(P)` and perfectness | agrees | none |
| Supplier contract, finiteness clause of ArithmeticGaloisDuality §D7.3 with §R02.4.4 (line 5957) | both statements on main and at the head of that roadmap's open revision | §D7.3: finite-type cohomology under finite-length hypothesis alone; `(P)` enters only with the `cd_p` bound. §R02.4.4: `Hʳ(G_S, M)` finite for all `r`, `S` finite, `#M` an `S`-unit, any `p` | agrees | none |
| Description, "a new supplier-contract subsection name the three sections used" | headings added against the base | two subsections added (lines 5867, 5955); five sections named | does not agree | C01 |

The rows for the statements the change does not touch (the added sentences of 0.4 and 0.7 and the two headline theorems of `Suggested.lean`) stand as in the previous review, of `acd5006`.

- Source locators checked against the text: 1 (Mazur–Rubin 2016, Definition 2.1, p. 6; MazurRubin2016 lines 237–252, which gives the kernel formula over `K_{Σ(F)}` with all infinite places in `Σ(F)`).
- Cross-roadmap citations resolved: SelmerIwasawaCohomology §2.2, §2.13, §2.18, §2.22a, §2.23a, §2A.6, §2A.8 at head `c673f11` of its open revision; ArithmeticGaloisDuality §D7.3 (Cohomological finiteness and perfect amplitude) and §R02.4.4 (Finiteness of Galois cohomology with restricted ramification) on main and at head `4ea5e62` of its open revision, the same statement in both.
- Seeded sample: of the fifteen targets only 0.9 lies in changed text; its statement and its two source locators are unchanged, its new proof paragraph is the third to fifth rows. The other fourteen (0.2, 0.10, 1.2, 1.5, 3.19, 3.20, 4.2b, 4.10, 5.5, 5.11, 7.3, 8.4, 8.14, 8.29) are untouched and not re-read. The README flags no locator as unverified.
- Dependency check: `depcheck: 94 roadmaps, 1058 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks run again at `10ffe54`: all pass; no file changed outside the folder.
- Elaboration of `Suggested.lean` (unchanged): two warnings, both `declaration uses sorry` (102:8, 120:8); no library declaration opened this round, since the change touches no Lean statement.
- Record: no layer or item removed, retitled or renumbered against the merge base; two headings added, both supplier-contract subsections. No other open pull request changes this roadmap; none drops an id it cites.

Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology (`main` and the cited revision), EulerSystemsCyclotomicMainConjecture; the shared objects of the change are the simple local conditions with `Δ(F)`, their `H²` and their base change, owner SelmerIwasawaCohomology, and the finiteness of continuous cohomology, owner ArithmeticGaloisDuality, both cited here; the others consume this roadmap's descent and own none of it.

Source independence: changed passages only; 3 passages compared with 1 source (Mazur–Rubin 2016, Definition 2.1), none shared beyond the defining formula and the standard clause naming `K_Σ`; the other changed passages cite roadmap sections, not sources; largest share Rubin, Euler Systems, 102 of 343 linked locators, cited by no changed passage; arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap is the Euler- and Kolyvagin-system descent of Rubin (2000), Mazur–Rubin (2004, 2016), Howard (2004) and Burns–Sakamoto–Sano (2018), consumed by Heegner-point, cyclotomic-unit and Kato-class bounds; the change ties its Selmer structures to Selmer complexes. Rests on the README overview and References.

## Not verifiable

- Mazur–Rubin 2004, Lemma 3.7.1(ii) and Corollary 5.2.6, p. 56, cited in Layer 0.9 by sentences this change does not alter: the memoir is paywalled, no legal copy was found, and the copy the README links is on a third party's page, which was not read.
- The description's account of how the text was drafted and reread cannot be checked from the head.

## Source issues

- none

## For the human reviewers

- **Merge order.** The README cites SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8 (lines 53, 250, 337, 450, 5867 and the `*Needs:*` lines), defined only at the head of that roadmap's open revision, which the description names under "Depends on". That revision merges first.
- **Licence.** `README.md` Layer 0.1 (lines 43–49) and later (untouched text): the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page, not an author's page or the publisher.
- **Not tested.** Mazur–Rubin 2004 could not be read legally; Layer 0.9 cites it in unchanged sentences. Rubin's "Euler Systems", the source with the largest share of locators, is cited by no changed passage and was not opened.
