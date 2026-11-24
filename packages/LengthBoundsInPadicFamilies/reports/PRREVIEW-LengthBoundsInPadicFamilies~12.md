# Review of LengthBoundsInPadicFamilies (pull request #3027 at 6f088b9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LengthBoundsInPadicFamilies/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 105 changed lines since `b8f3652`. The change adds the *Origin* and *Method of the formal proof* labels to the five sections of Layer 1, five references and a citation of PadicFamilies §1.7a, and drops the pointer to AutomorphicCongruences §0.7; no statement, layer id or Lean declaration changes. I read every new locator in its text (Hida, Johnston–Nickel, Berger, Dasgupta, Ophir–Weiss) and, this time, the five method labels against the formal proof at its cited commit: all five describe its proofs correctly, with one exception, the sentence saying that 1.7a (4) is not a statement of the formal proof, which it is. Accepted with three small corrections, all about attribution, and no format notes; the two corrections of the previous review are not yet made. Nothing new is left for the human reviewers beyond the status of the formal proof as a source.

## C01 — The Method label of 1.7a says the bound (4) is not a statement of the formal proof; the formal proof states and proves it

A reader is told that only the family form (4′) is in [FormalProof] and that (4) is this README's deduction from it ("The bound (4) is not a statement of [FormalProof]; it is the case of (4′) given in the statement", lines 67–68). At the cited commit, `Formalism/CharacterColumnKernels/StatementN.lean` has `Formalism.NG.StatCongBoundGood`: for `Zg ⊆ Z`, an endomorphism commuting with the algebra, acting by a scalar on `V_x` for `x ∈ Zg` and by `0` for `x ∈ Z ∖ Zg`, the length of the congruence module of `Zg` is at most `Σ_{x∈Zg} mult(x)·(v(cc_Z(x)) + v(A))`. That is (4), with the algebra local and the scalar an integer. Its last sentence is `Formalism.NG.StatCongBound` in the same file. Both are proved in `Formalism/CharacterColumnKernels/IdempotentNormalForms/LengthQuotSmulRangeFree.lean` (`congBound`, `congBoundGood`), from the same induction as (4′), and `congBoundGood` is used further (`IdempotentNormalForms/SumIteLe.lean`). The Origin label of the same section already calls (4) "particular to this proof", and the Labels paragraph does not list it among the roadmap's own forms, so only this sentence is out of line.

The smallest change: replace the sentence by one saying that [FormalProof] states (4) as `Formalism.NG.StatCongBoundGood` (for a local algebra and an integer scalar) and its last sentence as `Formalism.NG.StatCongBound`, both proved by the same induction. The line after the statements (lines 107–109), which derives the last sentence of (4) from `congMod_le_of_family`, would then name these two as well.

## C02 — The Origin label of 1.8d and the [Urban01] entry call the injection into a Selmer group Urban's, quoted by Berger; Berger proves it himself, after Skinner and Urban

(Raised in the previous review; the text is unchanged.) A reader who opens Berger for a quotation of Urban's Selmer step finds none. Berger quotes Urban for the lattice (his Theorem 7, Berger09 line 371) and for the bound on `N/IN` (Urban, p. 519; Berger09 line 378). The injection is steps (i) and (ii) of the proof of Berger's Theorem 6 (Berger09 lines 385–426), introduced as "similar arguments as in [Ski04] and [Urb01]" (Berger09 line 383). In the Origin of 1.8d (line 366), "adapted from Urban (2001), as quoted in Berger (2009), proof of Theorem 6" would read "adapted from Berger (2009), proof of Theorem 6, steps (i)–(ii), after Skinner (2004) and Urban (2001)"; in the [Urban01] entry (line 696), the clause "and the injection into a Selmer group (1.8d), as quoted in [Berger09]" would go, or say that [Berger09] follows Urban there.

## C03 — The comparison with the polarized three-block method in 1.8c names Skinner–Urban without a source

(Raised in the previous review; the text is unchanged.) The sentence at lines 334–336 used to point to AutomorphicCongruences §0.7; dropping that pointer was right, since that roadmap is not on `main`. References has no Skinner–Urban entry, so the claim about the polarization and the abelian term can no longer be traced. Either add an entry for the Skinner–Urban work meant, with the locator of its lattice construction, or remove the parenthesis.

## Questions for the author

- The locators of [JN13] (Definition 2.1, Theorem 2.4, §3.8, Lemma 4.15), [Berger09] (Theorems 6 and 7) and [OW24] (Theorem 1.3) agree with arXiv v3, v1 and v3. Do they agree with the journal versions the same entries name? The journal texts were not open to me.

## Previous findings

The previous review (at `3bddf73`) had no findings. Its two small corrections are not repaired; the folder is unchanged since that head. They are C02 and C03 above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 1.7a Origin: Hida's module `(ξA ⊕ (1−ξ)A)/A` is `Ψ_e(A)` | `A = {(a,b): a ≡ b mod ϖⁿ}`, `e = (1,0)`; `A = O × O` | `(O×O)/A ≅ O/ϖⁿ`, length `n`; `eA/(A ∩ eA_K) = O/ϖⁿO`, `n`. `O × O`: `0`, `0` | agrees |
| 1.7a Origin: PadicFamilies §1.7a is `M = A` of (1) without functoriality, (2), first clause of (3) | clause by clause against its five bullets | symmetry, finite length, `Ann(𝔠_ξ) = 𝔠_{1−ξ}`, split case present; functoriality, `cc_Z`, (4) absent | exact |
| 1.7a Method (4′): induction on `S`, step bound `mult(π)·v(a_π)` | same `A = M`, `S = {1}`, `α = (ϖⁿ, 0)`; `M = O^X` | `η_S = n`, bound `1·n`; `η = 0 ≤ n`. Formal proof: `congMod_le` by `Finset` insertion | holds |
| 1.7a Method, last sentence (C01) | (4) with `Z′ = Z`, `α = 1` | README: `Σ mult·v(cc_Z)`; `StatCongBoundGood` with `Zg = Z`, `A = 1`: `Σ mult·(vcc + 0)` | (4) is in the formal proof |
| 1.8b Origin: JN13 Def. 2.1, Prop. 3.7 as one block | JN13 Ex. 2.7: `Λ = M₂(ℤ)`, `M = Λ/2Λ`; 1.8b (2), `g = 1`, `d = 2`, `Rel = 2Λ` | `Fit_Λ(M) = 4ℤ`; `det ψ(2·1) = 4`, `v₂ = 2`, `length Sol = 2` | agrees |
| 1.8b Method (1′): multiplier `C`, `Θ = C·P`, degree `≤ g·d_b`, `#k > g·Σd_b` | third Check, `O = ℤ₂`, `Σd = 3`; `k = 𝔽₄` | `X₁X₂(X₁+X₂)` zero on `𝔽₂²`, `3 > 2`; non-root `(1, ω)`. `StatGenericFin`: `card g * Σ card d < #k` | matches; Lean (1′) has the same bound |
| 1.8c Method: one determinant, vanishing off `Z`, descent, block product | two-point Check, `c(π) = ϖ^mO`; `Xs = Z = {π}` | LHS `m`, RHS `2m`; `c(π) = O`, bound `0 ≤ …`. `globalConcrete_of`: `genericFin`, `hvanish`, descent, block-triangular determinant | matches |
| 1.8c Origin: Berger Thm. 7 (two blocks), Dasgupta Lemma 4.5 | Berger09 line 371; Dasgupta23 line 460 | one-direction bound `val(T/I) ≤ val(N/IN)`; `D′w = 0` with `w ≠ 0` on each field factor gives `det D′ = 0` | supports the label |
| 1.8d Method: `(E − τ)E ↦ −δ_A(π)m`, then `δ_A(π)²m = 0` | `E = ϖ^a e`, `e` idempotent | `τ(π) = δ = ϖ^a`; `φ(y) = −ϖ^a m`; `E·y = δy` gives `ϖ^{2a}m = 0`; length `≤ 2d_b·a`, actual `C_b = 0` | matches `cobColumn` (`(δO * δO) • v = 0`) |
| 1.8d Origin: Dasgupta §3; OW24 Thm. 1.3 "with a loss" | Dasgupta23 lines 333–342; `n = 4`, `m = 1` and `m = 3` | `κ(τ) = 0`, unit `χ₂⁻¹χ₁(τ) − 1` gives `x ∈ B′`; `s = 3`, `s = 2 < 4` | correct |
| 1.8d Origin: Urban via Berger (C02) | Berger09 lines 371–426 | Urban cited for the lattice and p. 519; steps (i), (ii) Berger's, "similar arguments" | attribution loose |
| 1.8e Method: dimension count gives a nonzero homomorphism | `StatColumnJ` | rank one for `E`, `e₁`; bound `j_l + dim ker`; conclusion `∃ φ ≠ 0` | matches |
| 1.8e Origin: `t = 1` of (4) | `t = 1` | `E′ = e_B`, `δ_{A′} = 1`, empty sum `0` | consistent |
| Headline 1 (1.7a (4), (4′); Lean, unchanged) | `A = M` as above; `M = O^X` | `n ≤ n`; `0 ≤ n` | holds; one-tactic probe open |
| Headline 2 (1.8b (1), (1′); Lean, unchanged) | `𝒜 = O × O`, `Rel = ϖ^aO × ϖ^bO` | `J = ϖ^{a+b}O`, length `a+b`; `Σ length Sol_b = a + b` | equality; probe open |
| Headline 3 (1.8c (3) with 1.8d; README only) | `𝒱 = ∅`, two points, free profinite `G` on 4 generators | LHS `m`; `H¹(G, ℚ_p/ℤ_p) = (ℚ_p/ℤ_p)⁴`, infinite | holds; docstring says why it is not stated |
| C03: Skinner–Urban | References | 10 entries, none of Skinner–Urban; AutomorphicCongruences not on `main` | unsourced |

- Source locators checked against the text: 11, in 5 texts: Hida §0, p. 232 (Hida lines 56–62) and (3.11), p. 254 (lines 906–909); JN13 Definition 2.1, Theorem 2.4, §3.8 with Proposition 3.7, Lemma 4.15; Berger09 Theorem 7 and the proof of Theorem 6; Dasgupta23 §3 and Lemma 4.5; OW24 Theorem 1.3.
- Formal proof at the cited commit, 8 declarations opened: `congMod_le_of_family`, `congMod_le`, `StatCongBound`/`StatCongBoundGood` with their proofs, `StatGenericFin`/`genericFin`, `gen_key` (Smith normal form), `globalConcrete_of`, `StatCobColumn`/`cobColumn`, `StatColumnJ`.
- Cross-roadmap citations resolved at this head: PadicFamilies §§1.7, 1.7a, 1.8 (§1.7a is added by this pull request and reads as cited); AutomorphicCongruences is not on `main`, so its removal is right; every other supplier named in the changed passages is on `main`.
- Record of the roadmap: no layer, section or item removed or renumbered; the 8 deleted lines are rewordings.
- Library and Lean: `Suggested.lean` unchanged; its 4 elaborated signatures agree with 1.7a (4), (4′) and 1.8b (1), (1′), no section binder lost; with `simp`, `rfl`, `le_top`, `bot_le` in place of each `sorry`, 4 of 4 stayed open.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1442 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean`: four `declaration uses 'sorry'` warnings, nothing else.
- Pull request text: the description's account of the labels and of PadicFamilies §1.7a agrees with this folder's change.

Overlap check: read AutomorphicCongruences, IntegralIwasawaTheoryPartII, ModularIwasawaMainConjectures (open) and CongruenceModulesOfThetaLifts, SelmerLengthBoundsAndLocalLifting, WachLatticesOverTheCyclotomicTower (on `main`); the congruence module of a commutative finite free algebra along an idempotent is owned by PadicFamilies §1.7a and cited here, the module form by this roadmap; nothing else shared.

Source independence: changed passages only; 12 passages compared with 6 sources (Hida, JN13, Berger09, Dasgupta23, OW24, [FormalProof]), none shared beyond standard terms; largest share [FormalProof], 26 of 54 locators; no layer added, removed or reordered, so the arrangement was not compared.

Research link: The bounds are length forms of the lattice method bounding congruence ideals by Selmer groups (Ribet 1976; Urban 2001; Bellaïche–Chenevier 2009; Berger 2009), on Hida's congruence modules (1986) and Johnston–Nickel's Fitting invariants (2013); they serve the formal proof of GRH for Dirichlet L-functions (Alpöge 2026). Rests on the README and on Hida, JN13, Berger09.

## Not verifiable

- [Urban01], Theorem 1.1 and p. 519: no open copy; read only as Berger09 restates it (Berger09 lines 369–379).
- The journal versions of JN13, Berger09 and OW24: numbering compared on arXiv only.
- [Ribet76] and [BC09] in the Origin of 1.8c (3): named for the classical unit case without a new locator; not opened this round.

## Source issues

- **Misprint** in Berger09 at the proof of Theorem 6, step (ii), p. 9 (arXiv v1): the source says the inclusion of `T` modulo the kernel of `ϕ` into `R^∨` is induced by `f`; it should be `T` modulo the kernel of `f`; affects nothing.
- **Misprint** in JN13 at §3.8, proof of Proposition 3.7, p. 11 (arXiv v3): the source calls the chosen finite presentation a presentation of `Λ`; it should be a presentation of `M`; affects nothing.

## For the human reviewers

- Licence and scope: [FormalProof], the most-cited source (26 of 54 locators), is an unrefereed formalization announced on 20 November 2026; I read it at the cited commit in a copy the operator holds, its repository's licence not checked.
- Decisions applied: neither recorded decision touches this folder; no section leaves it, and 1.7a keeps its statements beside the citation of PadicFamilies §1.7a.
