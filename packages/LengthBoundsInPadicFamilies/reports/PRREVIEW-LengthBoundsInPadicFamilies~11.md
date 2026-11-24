# Review of LengthBoundsInPadicFamilies (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LengthBoundsInPadicFamilies/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 105 changed lines since `b8f3652`. The change adds *Origin* and *Method of the formal proof* labels to the five sections of Layer 1, five new references and a citation of PadicFamilies §1.7a, and drops the pointer to AutomorphicCongruences §0.7, which is not on `main`. No statement, layer id or Lean declaration changes. Every new locator I could read supports what it is cited for (Hida; Johnston–Nickel; Berger; Dasgupta; Ophir–Weiss), and the account of PadicFamilies §1.7a as the case `M = A` of 1.7a (1)–(3) is exact. Accepted with two small corrections, both about attribution, and no format notes. The human reviewers are asked only about the formal proof, which the new method labels describe and which could not be opened.

## C01 — The 1.8d Origin label and the [Urban01] entry call the Selmer injection Urban's, quoted by Berger; Berger proves it himself, after Skinner and Urban

A reader who looks in Berger for Urban's Selmer step will not find a quotation of it. Berger states Urban's lattice as his Theorem 7 and cites Urban, p. 519, only for the bound on `N/IN` (Berger09 lines 369–379). The injection is steps (i) and (ii) of the proof of his Theorem 6 (Berger09 lines 385–426), an argument he describes as "similar arguments as in [Ski04] and [Urb01]" (Berger09 lines 382–384). Two small rewordings would fix this:

- In the Origin of 1.8d (line 366), "adapted from Urban (2001), as quoted in Berger (2009), proof of Theorem 6" would read "adapted from Berger (2009), proof of Theorem 6, steps (i)–(ii), after Skinner (2004) and Urban (2001)".
- In the [Urban01] entry (line 696), "and the injection into a Selmer group (1.8d), as quoted in [Berger09]" would be dropped, or would say that [Berger09] follows Urban there.

## C02 — The comparison with the polarized three-block method in 1.8c now names Skinner–Urban without a source

The sentence at lines 334–336 ("In the polarized three-block form of the method (Skinner–Urban), the polarization and the vanishing of the abelian term isolate the Selmer group of the middle block") used to point to AutomorphicCongruences §0.7. Dropping that pointer was right, since that roadmap is not on `main`. But References has no Skinner–Urban entry, so a reader cannot find the claim. Either add an entry for the Skinner–Urban work meant, with the locator of its lattice construction, or remove the parenthesis.

## Questions for the author

- The locators of [JN13] (Definition 2.1, Theorem 2.4, §3.8, Lemma 4.15), [Berger09] (Theorems 6 and 7) and [OW24] (Theorem 1.3) match the arXiv versions (v3, v1 and v3). Does the numbering also match in the journal versions that the same entries name? The journal texts were not open to me.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 1.7a Origin: PadicFamilies §1.7a is the case `M = A`, `A` commutative, of (1) without functoriality, (2), first clause of (3) | `A = M = {(a,b): a ≡ b mod ϖⁿ}`, `Y = {1}`; `A = O × O` | 1.7a (3): length `n`; PadicFamilies Check: `Ψ_ξ(A) ≅ O/ϖⁿ`, `n`. `O × O`: `0` on both sides | agrees |
| 1.7a Method: induction step bounds by `mult(π)·v(a_π)` | same `A = M`, `S = {1}`, `α = (ϖⁿ,0)`; `S = X` | step bound `n`, `η_S = n`; `S = X`: `η = 0 ≤ 2n` | holds; equality case |
| 1.8b Origin: JN13 Def. 2.1, Prop. 3.7, one block | JN13 Ex. 2.7: `Λ = M₂(ℤ)`, `M = Λ/2Λ`; 1.8b (2) with `g = 1`, `d = 2`, `Rel = 2Λ` | `Fit_Λ = 4ℤ`, colength `2`; `det ψ(2·1) = 4`, length `Sol = 2` | agrees |
| 1.8b Method (1′): one multiplier when `#k > g·Σd_b` | third Check, `O = ℤ₂`, `Σd = 3`; `O = W(𝔽₄)` | `X₁X₂(X₁+X₂)` vanishes on `𝔽₂²` (`3 > 2`); non-root `(1, ω)` in `𝔽₄²` | threshold needed there |
| 1.8c Origin: Berger Thm. 7 (two blocks) against 1.8c (1) | two-point Check (a), `c(π) = ϖ^mO` | LHS `m`; 1.8c (1) RHS `2m`; one-direction bound of Thm. 7: `m` | consistent; summed form weaker, as stated |
| 1.8c Method and Dasgupta Lemma 4.5: determinant vanishes off `Z` | `Xs = Z = {π}`; two-point case | `c(π) = O`; at `x`, nonzero solution `(y_γ(x)u)_q` gives `det = 0` | holds |
| 1.8d Method: `δ_A(π)²m = 0` | `E(E−τ)E` against `δ_A(E−τ)E`; `E = ϖ^a e` | both `δ_A(δ_A−τ)E`; bound `2d_b·a` against actual `C_b = 0` | holds as upper bound |
| 1.8d Origin: OW24 Thm. 1.3 "with a loss" | `n = 4, m = 1`; `n = 4, m = 3` | `s = 3`; `s = 2` (Berger: no loss) | correct |
| 1.8e Origin: `t = 1` of (4) this roadmap's own | `t = 1` | `E′ = e_B`, `δ = 1`, `v(δ)` empty sum `0` | consistent with (4) |
| Labels: every section carries both labels | sections 1.7a, 1.8b–1.8e | 5 *Origin* lines, 5 *Method* lines | holds |
| Headline 1 (1.7a (4), (4′); Lean, unchanged) | `A = M` as above; `M = O^X` | `n ≤ n`; `0 ≤ n` | holds; `simp` makes no progress |
| Headline 2 (1.8b (1), (1′); Lean, unchanged) | `𝒜 = O × O`, `Rel = ϖ^aO × ϖ^bO` | `J = ϖ^{a+b}O`, length `a+b`; `Σ length Sol_b = a + b` | equality; `simp` makes no progress |
| Headline 3 (1.8c (3) with 1.8d; not in Lean) | `𝒱 = ∅`, free profinite `G` on 4 generators, two points | LHS `m`; `H¹(G, ℚ_p/ℤ_p) = (ℚ_p/ℤ_p)⁴`, infinite | holds; docstring names it unstatable |
| C01: Berger attribution | Berger09 lines 369–384 | Urban cited p. 519 for `N/IN` only; Selmer steps "similar to" Skinner, Urban | attribution loose |
| C02: Skinner–Urban | References | 10 entries, none Skinner–Urban; pointer to AutomorphicCongruences §0.7 (not on `main`) removed | unsourced |

- **Source locators checked against the text:** 12, in 5 texts.
  - Hida: §0, p. 232 (line 59); (3.11), p. 254 (lines 906–909).
  - JN13 (arXiv v3): Definition 2.1, Theorem 2.4, §3.8 with Proposition 3.7, Lemma 4.15.
  - Berger09 (arXiv v1): Theorem 7; the proof of Theorem 6, steps (i) and (ii).
  - Dasgupta23 (arXiv v1): §3; Lemma 4.5.
  - OW24 (arXiv v3): Theorem 1.3.
- **Cross-roadmap citations resolved at this head:**
  - PadicFamilies §§1.7, 1.7a and 1.8. §1.7a is added by this pull request; its clauses were compared one by one with 1.7a (1)–(3).
  - AutomorphicCongruences is not on `main` (merge order line 405), so removing it is correct.
  - CongruenceModulesOfThetaLifts §§7.1 and 7.10a consume 1.7a (4) and (4′).
  - SelmerLengthBoundsAndLocalLifting §§4.10b, 4.10c and 4.10f exist under those headings.
- **Record of the roadmap:** no layer, section or item is removed or renumbered. Layer 1 and §§1.7a, 1.8b–1.8e keep their statements, and the 8 deleted lines are rewordings of prose.
- **Library and Lean:** `Suggested.lean` is unchanged. Its 4 elaborated signatures were compared with 1.7a (4), (4′) and 1.8b (1), (1′). With `simp` in place of each `sorry` on a copy of the file, `simp` made no progress 4 of 4 times, so there is no padding.
- **Automatic checks:** all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line). `lake env lean` on `Suggested.lean`: four `declaration uses 'sorry'` warnings and nothing else.
- **Files outside the folder:** all 129 changed paths lie in folders that the brief names as this pull request's own, or in the two family indexes.

Overlap check: I read the scope of AutomorphicCongruences, IntegralIwasawaTheoryPartII and ModularIwasawaMainConjectures (open), and of CongruenceModulesOfThetaLifts, SelmerLengthBoundsAndLocalLifting and WachLatticesOverTheCyclotomicTower (on `main`).
- The congruence module `Ψ_e(A)` of a commutative finite free `A` is owned by PadicFamilies §1.7a and cited here.
- The module form along a central idempotent is owned by LengthBoundsInPadicFamilies.
- AutomorphicCongruences uses only PadicFamilies §§1.7–1.10.
- CongruenceModulesOfThetaLifts consumes 1.7a and 1.8c–1.8e.
- SelmerLengthBoundsAndLocalLifting supplies §§4.10b–4.10f.
- Nothing else is shared.

Source independence: changed passages only; 11 passages compared with 5 sources (Hida, JN13, Berger09, Dasgupta23, OW24), no wording shared beyond standard terms. Largest share: [FormalProof], 57 of 76 locators, not readable. No layer was added, removed or reordered, so the arrangement was not compared.

Research link: The headline bounds are length forms of the lattice method that bounds congruence ideals by Selmer groups (Ribet 1976; Urban 2001; Bellaïche–Chenevier 2009; Berger 2009, Theorem 6), built on Hida's congruence modules (1986). In the family they serve the formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026). This rests on the README and on Berger09 and Hida, which I read.

## Not verifiable

- [Urban01], Theorem 1.1 and p. 519: the Duke DOI resolves to a Project Euclid page with no open PDF. I read it only as Berger09 restates it (Theorem 7, Berger09 lines 369–379).
- [FormalProof]: the five new *Method of the formal proof* labels, and the declaration locators beside them, could not be checked. The sources service puts the repository's host in no licence class, so it was not opened.
- The journal versions of JN13, Berger09 and OW24: their numbering was compared only on arXiv.

## Source issues

- **Misprint** in Berger09 at the proof of Theorem 6, step (ii), p. 9 (arXiv v1): the source says the inclusion of `T` modulo the kernel of `ϕ` into `R^∨` is induced by `f`; it should be `T` modulo the kernel of `f`; affects nothing.
- **Misprint** in JN13 at §3.8, proof of Proposition 3.7, p. 11 (arXiv v3): the source calls the chosen finite presentation a presentation of `Λ`; it should be a presentation of `M`; affects nothing.

## For the human reviewers

- Not tested: [FormalProof], the most-cited source (57 of 76 locators). It is an unrefereed formalization announced on 20 November 2026 and was not readable, so the five new method labels that describe its proofs were not compared with it.
- Decisions applied: neither recorded decision touches this folder. No section leaves it; PadicFamilies §1.7a, added by this pull request, is cited as the case `M = A`, and 1.7a here keeps its statements.
