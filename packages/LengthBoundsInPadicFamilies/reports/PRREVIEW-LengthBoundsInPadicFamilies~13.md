# Review of LengthBoundsInPadicFamilies (pull request #3027 at 3f8c596)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LengthBoundsInPadicFamilies/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 22 lines changed since `6f088b9`, all in the README's attribution labels and references; no statement, layer id or Lean declaration changes. The three small corrections of the previous review are made, and each new sentence about the formal proof agrees with its declarations at the cited commit: the bound 1.7a (4) is stated and proved there for a local algebra and an integer scalar, and the hypothesis used there in place of (D) of 1.8c is block triangularity over `O`, which (D) implies. There are no findings, no small corrections and no format notes; the status of the formal proof as a source remains for the human reviewers.

## Previous findings

The previous review (at `6f088b9`) had no findings; its three small corrections are accounted for here.

- C01 — repaired: "[FormalProof] states (4) as well, for a local `A` and an integer `A_α`, and its last sentence for a local `A` … and proves both by the same induction … for a general `A`, (4) is the case of (4′)".
- C02 — repaired: "adapted from Berger (2009), proof of Theorem 6, steps (i) and (ii), after Urban (2001), for two blocks"; the [Urban01] entry now says [Berger09] "follows Urban for the injection into a Selmer group (1.8d)".
- C03 — repaired: the sentence now reads "In the polarized three-block form of the method, the polarization and the vanishing of the abelian term isolate the Selmer group of the middle block", with no unsourced name.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 1.7a Method: [FormalProof] states (4) for a local `A` and an integer `A_α` (`Formalism.NG.StatCongBoundGood`) | `O = ℤ_p`, `A = M = {(a,b): a ≡ b mod pⁿ}` (local), `Z = X`, `Z′ = {1}`, `α = (pⁿ, 0)` | `η_{Z′}(M) = n`; `cc_X(1) = O`, bound `1·(0 + v(pⁿ)) = n`. Declaration: `[IsLocalRing T]`, `A : ℤ`, bound `finrank·(vcc + addVal A)` | agrees; equality |
| 1.7a Method: last sentence of (4) for a local `A` (`Formalism.NG.StatCongBound`) | same `A = M`, `Z = {1}`; `Z = X` | `cc_Z(1) = pⁿO`, `η_Z = n ≤ 1·n`; `Z = X`: `0 ≤ 0`. Declaration: `[IsLocalRing T]`, bound `Σ finrank·vcc` | agrees |
| 1.7a Method: "for a general `A`, (4) is the case of (4′)" | `A = O × O` (not local), `M = A`, `Z′ = Z = {1}` | `η = 0`, `cc_Z(1) = O`, bound `0`; outside both declarations (`IsLocalRing` fails), inside (4′) with `S = Z′`, `α_π = f_π·α` | consistent |
| 1.7a Method: "proves both by the same induction" | `congBound`, `congBoundGood` | both `refine congMod_le …` with the family `act c` resp. `a * act c`, `c` in the ideal of `Z`; `congMod_le` rests on `core`, a `Finset.induction_on` over `S` | matches |
| 1.8c form of the formal proof: block triangular over `O` in place of (D) (`Formalism.NG.CharacterColumnGlobal`) | `G = ℤ`, `r_π(1) = [[1,1],[0,1]]`; `r_π = diag(χ₁, χ₂)` | unipotent: triangular with `1 × 1` blocks, block maps onto `O`, not conjugate to a block sum over `K`, so (D) fails; diagonal: both hold | (D) strictly stronger, as said |
| 1.8c: residue field bound of that statement | `g` generators, blocks of sizes `d_b` | declaration: `card g * Σ_k card{a : bl a = k} < #k`, and `Σ_k = card d = n`; README: more than `g·n` elements | agrees |
| 1.8d Origin: Berger, proof of Theorem 6, steps (i), (ii), after Urban | Berger09 lines 383–389 | Urban cited for the lattice (line 371) and p. 519 (line 378); the injection `ϕ` is Berger's, "similar arguments" to Urban's | supports the label |

The rows for the untouched statements, and for the four declarations of `Suggested.lean`, stand as in the previous review, of `6f088b9`.

- Source locators checked against the text: 2 this round (Berger09 lines 369–379 and 383–389), both in the changed passages; the seeded sample falls in them at 1.7a (Method), 1.8c (form of the formal proof) and 1.8d (Origin).
- Formal proof at its first commit (the three cited files exist there): 6 declarations opened, `Formalism.NG.StatCongBound`, `StatCongBoundGood`, `CharacterColumnGlobal` (`Formalism/CharacterColumnKernels/StatementN.lean`, lines 145, 157, 60), `congBound`, `congBoundGood`, `congMod_le` with `core` (`…/IdempotentNormalForms/LengthQuotSmulRangeFree.lean`, lines 590, 605, 559, 351).
- Cross-roadmap citations in the changed passages: IntegralHeckeAndGaloisDeterminants §§6.1, 6.7 and IntegralIwasawaTheory §9.6, unchanged and on `main`; no citation added or dropped.
- Record of the roadmap: no layer, section or item removed or renumbered; the 8 deleted lines are rewordings of labels and one reference entry.
- Lean: `Suggested.lean` unchanged; `lake env lean` on it gives four `declaration uses 'sorry'` warnings and nothing else.
- Automatic checks: all passed. Dependency check: `depcheck: 124 roadmaps, 1409 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Pull request text: its account of the origin and method labels agrees with this folder at this head; the change adds no section, supplier or declaration that the description would have to state.
- The family index changed since the previous head only in its table of published results (one row naming this roadmap, reworded about Fontaine–Laffaille theory); nothing there is about this folder's statements.

Overlap check: read AutomorphicCongruences, IntegralIwasawaTheoryPartII, ModularIwasawaMainConjectures (open) and CongruenceModulesOfThetaLifts, SelmerLengthBoundsAndLocalLifting, WachLatticesOverTheCyclotomicTower (on `main`); the congruence module of a commutative finite free algebra along an idempotent is owned by PadicFamilies §1.7a and cited here, the module form by this roadmap; nothing else shared.

Source independence: changed passages only; 5 passages compared with 2 sources (Berger09, [FormalProof]), none shared beyond declaration names and standard terms; largest share [FormalProof], 29 of 57 locators (the previous count plus the three added here); no layer added, removed or reordered, so the arrangement was not compared.

Research link: The bounds are length forms of the lattice method bounding congruence ideals by Selmer groups (Ribet 1976; Urban 2001; Bellaïche–Chenevier 2009; Berger 2009), on Hida's congruence modules (1986) and Johnston–Nickel's Fitting invariants (2013); they serve the formal proof of GRH for Dirichlet L-functions (Alpöge 2026). Rests on the README and on Hida, JN13, Berger09.

## Not verifiable

- [Urban01], Theorem 1.1 and p. 519: no open copy; read only as Berger09 restates it (Berger09 lines 369–379).
- The journal versions of JN13, Berger09 and OW24: numbering compared on arXiv only.

## Source issues

- none

## For the human reviewers

- Licence and scope: [FormalProof], the most-cited source (29 of 57 locators), is an unrefereed formalization announced on 20 November 2026; I read it at the cited commit in a copy the operator holds, its repository's licence not checked.
- Decisions applied: neither recorded decision touches this folder; no section leaves it, and 1.7a keeps its statements beside the citation of PadicFamilies §1.7a.
