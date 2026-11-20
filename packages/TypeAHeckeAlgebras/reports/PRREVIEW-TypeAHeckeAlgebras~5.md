# Review of TypeAHeckeAlgebras (pull request #2716 at e249524)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 67 lines changed since `4571a5d`; the three small corrections of the previous review are repaired, the two new sources (Andersen–Stroppel–Tubbenhauer, Theorem 5.1; Mathas, Example 2.15) support the statements they are cited for, and the description agrees with this head. One small correction remains, not blocking: Mathas's example names Murphy's basis without printing its elements, so the comparison "unit multiples of these" cannot be read off at the locator. There are no format notes. For the human reviewers: Jones 1987 and Sawin 1995 could not be read legally.

## C01 — Mathas's Example 2.15 quotes Murphy's basis without printing its elements, so "its elements are unit multiples of these" is not checkable at the locator

A reader who opens the citation in §1.2 (lines 187–189) to compare `T_(d(s))* x_λ T_(d(t))` with the source finds only that Murphy has shown that the algebra has a cellular basis `{m_st}` indexed by pairs of standard tableaux of the same shape (Mathas2008 lines 283–284); the formula for `m_st` is not on that page, and the sentence in §1.2 reads as if it were. The comparison itself is right for Murphy's elements `m_st = g_(d(s))* m_λ g_(d(t))`, `m_λ = Σ_(w ∈ S_λ) g_w`: with `g_w = q^(ℓ(w)) T_w`, the sum `m_λ` is exactly Tau Ceti's `parabolicEigenSum` at the eigenvalue q, and `m_st` is `q^(ℓ(d(s)) + ℓ(d(t)))` times the element of §1.2.

It would be enough to say that Mathas quotes the basis from Murphy and to give the unit: for instance "(Mathas, Example 2.15, p. 6, quoting Murphy, in the normalization `(gᵢ − Q)(gᵢ + 1) = 0`, gᵢ = qTᵢ; Murphy's `m_st = g_(d(s))* x_λ g_(d(t))` is `q^(ℓ(d(s)) + ℓ(d(t)))` times the element above)".

## Questions for the author

- In §4.7, does Sawin 1995 (§3, Theorem 3 and Proposition 9) prove the weak-closure equality `M_Q = K_Q = (E_Q)^T` for every r ≥ 2 and every Q > 0, Q ≠ 1, in the quantum-trace normalization used here? The text is behind a paywall and no legal copy was found. (Carried from the previous review.)
- The References say that Wenzl's Theorem 3.7 prints `q = e^(±πi/l)`. The line of that hypothesis did not survive the text recognition of the scan, so the printed angle could not be confirmed; is it as quoted? (Carried from the previous review.)

## Previous findings

- The previous review, of `4571a5d`, had no finding (no R01); its three small corrections are accounted for here.
- C01 (sources for §§1.2 and 1.6) — repaired: "(Andersen–Stroppel–Tubbenhauer, Theorem 5.1, p. 21, in this normalization, for every q except q = −1 in characteristic ≠ 2 …)"; "Murphy's basis … (Mathas, Example 2.15, p. 6 …)"; "(for the Lᵢ over every commutative ring, Mathas, Example 2.15, p. 7)". The residue is this report's C01.
- C02 (§§3.6 and 3.14 under each other's *Needs*) — repaired: §3.14 "*Needs:* §§1.5, 3.5, 3.12, 3.13 for the models, their positivity and their Markov identity; §3.6 as well for the exhaustion and for `exists_signedCheckedRep_trace_eq_ocneanuTrace`"; the forward-pointing bullet of §3.5 is gone and its content stands in §3.14.
- C03 (§3.7 cited by section) — repaired: "(Wenzl, Theorem 3.6(b), p. 379, with Proposition 2.9, p. 370, for the remaining unit-circle parameters)", in §3.7, in the docstring and in the References.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 criterion / `isSemisimpleRing_typeAHeckeAlgebra_iff` against the source's four cases | q = 1; q not a root of unity; ord(Q) = ℓ ≥ 2; q = −1, char ≠ 2; n = 0, 1 | `[r]_1 = r`, product n!; `[r]_Q = (Q^r − 1)/(Q − 1) ≠ 0`; `[ℓ]_Q = 0` iff ℓ ≤ n; source excludes q = −1, twist gives H(1); empty product 1 | holds; source's relation `H² = (q − q⁻¹)H + 1` is ours | none |
| §1.2 Murphy basis, unit comparison | n = 2, λ = (2), (1,1) | `x_(2) = 1 + qT₁ = 1 + g₁ = m_(2)`; `m_st = q^(ℓ(d(s))+ℓ(d(t)))·T_(d(s))* x_λ T_(d(t))`; `(g − Q)(g + 1) = q²(T − q)(T + q⁻¹)` | holds | C01 |
| §1.6 Lᵢ triangular with diagonal `[c]_Q` | L₂, L₃; trivial and sign modules of H₂; c = −1, −2 | recursion gives `L₂ = Q⁻¹g₁`, `L₃ = Q⁻²g_(13) + Q⁻¹g_(23)`, the source's sum; values 1 = [1], −Q⁻¹ = [−1]; `[−2] = −Q⁻²(1 + Q)` | holds; source misprints `[c]` for c < 0, README has the right formula | none |
| §1.6 Jᵢ diagonal `Q^c` | from `J = 1 + (Q − 1)L` | `1 + (Q − 1)(Q^c − 1)/(Q − 1) = Q^c`; J₂ = Q, Q⁻¹ on H₂ | holds | none |
| §3.5 API after the removed bullet | r = 2, Q = 2 | §3.14 still states positive weights give `η_W = a_(−r)`: `a_(−2)(2) = 2/9 = p₁p₂` with p = (2/3, 1/3) | no content lost | none |
| §§3.6, 3.14 *Needs* | direction of each edge | §3.6 uses §3.14's models (positivity, Markov identity) for sufficiency; realization and exhaustion use §3.6; models need §§1.5, 3.5, 3.12, 3.13 only | acyclic by target | none |
| §3.7 / `ocneanuTrace_nonneg_iff_of_mem_unitary` locator | Wenzl pp. 370, 379 | Proposition 2.9 on the page headed 370; Theorem 3.6(b), 1 ≤ k ≤ l − 1, on the page headed 379 | holds | none |

The rows for the untouched statements stand as in the previous review, of `4571a5d`.

- Source locators checked against the text: 5, in three sources. AndersenStroppelTubbenhauer2017: the convention on q (lines 25–26, 152–156), Definition 3.2 (386–390), Theorem 5.1 on p. 21 (1008–1013). Mathas2008: the base ring (86–88), Example 2.15 on pp. 6–7 (269–301). Wenzl1988: Proposition 2.9 (890–894), Theorem 3.6(b) (1218–1223), with the printed page numbers 370 and 379.
- Library declarations opened at the pin: `TauCeti.TypeAHeckeAlgebra.parabolicEigenSum` (`TauCeti/Algebra/TypeAHeckeAlgebra/Symmetrizer.lean`:45), `Σ a^ℓ(w) T_w`; no semisimplicity theorem for the Hecke algebra exists at the pin.
- Cross-roadmap citations resolved: TemperleyLieb Layer 5 on main (cellular algebras, Gram determinants, semisimplicity), kept as §5.1 at the head of its open revision.
- Automatic checks: all passed. Dependency check: `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`; no UPWARD or CYCLE line; nothing changed outside the folder.
- Elaboration: `Suggested.lean` gives five `sorry` warnings and nothing else. The diff changes two docstrings and no signature, so the elaborated types are those compared with the README in the previous review; the one-tactic probes were not repeated.
- The description against the head: 87 Checks in 47 sections counted; seven roadmap suppliers under the supplier contracts as listed; five theorems and two definitions in the Lean file; the citations it lists (Wenzl, Andersen–Stroppel–Tubbenhauer, Mathas, Neretin) are at the sections named; the `a_d` API it lists is the API of §3.5 at this head. No sentence contradicted, no change left unstated.
- Overlap check: read TemperleyLieb (main and its open revision), TemperleyLiebOperatorAlgebras, Subfactors, SchurWeyl; the general cellular theory is TemperleyLieb Layer 5's and is cited; Murphy's basis of Hₙ(q), its cell modules and Gram determinants are named by no other roadmap, on main or open, and stay here; nothing else shared by the changed passages.
- Source independence: changed passages only; 5 passages compared with 3 sources (AndersenStroppelTubbenhauer2017, Mathas2008, Wenzl1988), none shared beyond formulas; largest share Wenzl1988 as in the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again.
- Research link: Layers 3–4 are Wenzl's classification of positive Markov traces on H∞(q) and his subfactors of index (sin(kπ/l)/sin(π/l))^(2m) (Wenzl 1988), with product-state models of the Vershik–Kerov traces (Neretin 2021, Theorem 1.1) and Ram's character formula (Ram 1991); rests on the README's References and on the sources read.

## Not verifiable

- Jones 1987, Ann. Math. 126, and Sawin 1995, Amer. J. Math. 117: paywalled, no legal copy found (untouched by this change).
- Murphy's formula for `m_st`: not printed in Mathas2008 at Example 2.15; the comparison of C01 uses the standard definition, not a text read at a locator.
- The angle printed in the hypothesis of Wenzl's Theorem 3.7: the line is missing from the recognised text of the scan.

## Source issues

- **Misprint** in Mathas2008 at Example 2.15, p. 7: the source says that for k < 0 the q-integer is −q^(−k)[−k]_q; it should be −q^(k)[−k]_q, since L₂ = q⁻¹T₁ is −q⁻¹ on the sign module; affects a stated result.

## For the human reviewers

- Not tested: Jones 1987 and Sawin 1995 are behind the JSTOR paywall and are not in the roadmap's sources manifest; their locators (§§2.1, 3.2, 3.4, 4.7) and wording were not compared with the text.
