# Review of EulerSystemsAndKolyvaginSystems (pull request #3188 at 10ffe54)

**Verdict:** accepted

**Summary.** An incremental re-review of 0 changed lines since `10ffe54`, reading the pull request's title and description against the head: accepted, with no finding. The description now agrees with the change sentence by sentence, including the two ArithmeticGaloisDuality sections and the second supplier-contract subsection that the earlier text left out. There is no small correction and one format note carried from the previous review; the dependency on the open SelmerIwasawaCohomology revision, the licence of one linked copy and one unreadable source are left to the human reviewers.

## N01 — Two hyphenated labels of the kind this revision repaired remain in untouched text

Line 1231 ("by core-rank-formula") and line 4901 ("of twisting-by-characters-of-gamma") point to sections by labels that no heading defines, as the three repaired in Layers 0.8 and 0.9 did. Naming the layers they mean (apparently Layer 0.10 and the twisting section of Layer 8) would finish the repair; it can go in a separate change.

## Questions for the author

- Layer 0.1 says the Selmer kernel "is the Selmer kernel of SelmerIwasawaCohomology §2.2" for a module of the coefficient category over any coefficient ring. §2.2 states the kernel for abstract Selmer data, but its title and first sentence speak of compact lattice and rational coefficients. Is §2.2 meant to cover a global module `H¹(K_Σ/K, M)` over a general complete noetherian local `R`? Nothing in §2.2 excludes it, so I could not decide it from the text; the formula of Layer 0.1 is self-contained either way.

## Previous findings

- The previous report had no finding (no R-numbered point). Its small correction C01 is repaired: the description now has a bullet "For the finite generation of `H²(RΓ_f(Δ(F)))`, Layer 0.9 also cites the finiteness clause of ArithmeticGaloisDuality §D7.3 … and §R02.4.4 …, both on main" and names "a second new supplier-contract subsection".
- Its format note N01 is not repaired (the folder did not change); it is written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.9, `0 → H¹_F(K,T)/m^k → H¹_F(K,T/m^k) → H²(RΓ_f(Δ(F)))[m^k] → 0` with torsion-free local quotients (line 450; described in the Layer 0.9 bullet) | `K = ℚ`, `p` odd, `T = ℤ_p(1)`, `Σ = {p, ∞}`, relaxed at `p` | `H¹_F = ℤ[1/p]^× ⊗ ℤ_p = ℤ_p`, quotient `ℤ/p^k`; `H¹(G_Σ, μ_{p^k}) = ℤ[1/p]^×/p^k = ℤ/p^k` (`Pic = 0`); `H² ⊆ H²(G_Σ, T) = 0` (`Br(ℤ[1/p])[p^∞] = 0`) | lengths `k = k + 0`; exact | none |
| Description, each bullet against the diff from the base (40 lines; 2 headings added) | Layers 0.1, 0.4, 0.7, 0.9 sentences; lines 407, 438, 446; lines 5867, 5955; `Suggested.lean` | 0.1: one sentence replaced, pointer added (line 53); 0.4: line 250; 0.7: line 337; 0.9: line 450; three labels replaced; two subsections; 0 Lean lines changed | every sentence agrees with the head | none |
| Description, "§D7.3 (Cohomological finiteness and perfect amplitude) and §R02.4.4 (Finiteness of Galois cohomology with restricted ramification), both on main" | ArithmeticGaloisDuality on main | both statements stand under headings D7.3 and R02.4.4 on main; the first assumes only finite length of finite-length cohomology for its finiteness clause, `cd_p ≤ e` for perfectness | agrees | none |
| Description, "the new sections §2.22a, §2.23a and §2A.8" of the SelmerIwasawaCohomology revision | head `c673f11` of that revision; main | headings 2.22a, 2.23a, 2A.8 present at that head, absent on main; 2A.8 principal case: cone `(H¹(C_v(M))/L_v)[f]`, "No perfectness is needed" | agrees | none |

The rows for the statements of the folder (the sentences of 0.1, 0.4, 0.7 and 0.9, the supplier contracts and the two headline theorems of `Suggested.lean`) stand as in the previous review, of `10ffe54`.

- Source locators checked against the text: 0 this round (no passage changed; the description cites Mazur–Rubin Lemma 3.7.1`(i)` only as the README already does, in Layer 0.4, line 250).
- Cross-roadmap citations resolved: SelmerIwasawaCohomology §2.22a, §2.23a, §2A.8 at head `c673f11` of its open revision (unchanged since the previous review); ArithmeticGaloisDuality §D7.3 and §R02.4.4 on main.
- Seeded sample: none of the fifteen targets lies in a changed passage (no passage changed); they are not re-read.
- Dependency check: `depcheck: 94 roadmaps, 1058 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks run again at `10ffe54`: all pass; no file changed outside the folder.
- Elaboration of `Suggested.lean` (unchanged): two warnings, both `declaration uses sorry` (102:8, 120:8); no library declaration opened, since the change touches no Lean statement.
- Record: no layer or item removed, retitled or renumbered against the merge base; two headings added, both supplier-contract subsections. No other open pull request changes this roadmap; none drops an id it cites.

Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology (`main` and the cited revision), EulerSystemsCyclotomicMainConjecture; the shared objects of the change are the simple local conditions with `Δ(F)`, their `H²` and their base change, owner SelmerIwasawaCohomology, and the finiteness of continuous cohomology, owner ArithmeticGaloisDuality, both cited here; the others consume this roadmap's descent and own none of it.

Source independence: changed passages only; no passage changed since `10ffe54`, so 0 passages compared this round (the previous review compared 3 passages with 1 source, Mazur–Rubin 2016, Definition 2.1, none shared); largest share Rubin, Euler Systems, 102 of 343 linked locators, cited by no passage of this revision; arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap is the Euler- and Kolyvagin-system descent of Rubin (2000), Mazur–Rubin (2004, 2016), Howard (2004) and Burns–Sakamoto–Sano (2018), consumed by Heegner-point, cyclotomic-unit and Kato-class bounds; the change ties its Selmer structures to Selmer complexes. Rests on the README overview and References.

## Not verifiable

- Mazur–Rubin 2004, Lemma 3.7.1(ii) and Corollary 5.2.6, p. 56, cited in Layer 0.9 by sentences this revision does not alter: the memoir is paywalled, no legal copy was found, and the copy the README links is on a third party's page, which was not read.
- The description's account of how the text was drafted and reread cannot be checked from the head.

## Source issues

- none

## For the human reviewers

- **Merge order.** The README cites SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8 (lines 53, 250, 337, 450, 5867 and the `*Needs:*` lines), defined only at the head of that roadmap's open revision, which the description names under "Depends on". That revision merges first.
- **Licence.** `README.md` Layer 0.1 (lines 43–49) and later (untouched text): the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page, not an author's page or the publisher.
- **Not tested.** Mazur–Rubin 2004 could not be read legally; Layer 0.9 cites it in unchanged sentences. Rubin's "Euler Systems", the source with the largest share of locators, is cited by no passage of this revision and was not opened.
