# Review of TypeAHeckeAlgebras (pull request #2716 at 3bcc7c3)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 65 lines changed since `e249524`. The four changes were recomputed and are right: the side of `d(t)` in Murphy's basis (§1.2), with its new Check; the semisimplicity hypothesis on the branching Checks (§1.3 and the Layer 1 examples); the integral-domain hypothesis on the H₂(q) trace-radical Check (§2.2); and the strong density of the balanced matrix units for countably infinite colour sets (§§4.6, 4.15). There is one small correction (the description's count of Checks) and one format note, neither blocking. For the human reviewers: Jones 1987 and Sawin 1995 could not be read legally.

## C01 — The description says the update adds 87 Checks; this head has 89

A reader who counts finds two more than the description states: "The update adds 87 Checks in 47 sections". This head adds a Check to §1.2 (the side of `d(t)`, at λ = (3,1) in `ℚ[S₄]`) and one to §4.6 (J = ℕ at one site), so the count is 89 Checks in 47 sections. The text that would be right: "The update adds 89 Checks in 47 sections".

## N01 — Murphy's formula for `m_st` is given in §1.2 with no entry for Murphy in the References

§1.2 (lines 193–196) now states Murphy's `m_st = g_(d(s))* m_λ g_(d(t))`, and the locator beside it (Mathas, Example 2.15) names the basis without printing its elements. A reader who wants the formula has no reference to open; an entry for Murphy's paper in the References, with its locator, would give one.

## Questions for the author

- In §4.7, does Sawin 1995 (§3, Theorem 3 and Proposition 9) prove the weak-closure equality `M_Q = K_Q = (E_Q)^T` for every r ≥ 2 and every Q > 0, Q ≠ 1, in the quantum-trace normalization used here? The text is behind a paywall and no legal copy was found. (Carried from the earlier reviews.)
- The References say that Wenzl's Theorem 3.7 prints `q = e^(±πi/l)`. The line of that hypothesis did not survive the text recognition of the scan, so the printed angle could not be confirmed; is it as quoted? (Carried from the earlier reviews.)

## Previous findings

- The previous review, of `e249524`, had no finding (no R01); its one small correction is accounted for here.
- C01 (Mathas names Murphy's basis without printing its elements) — repaired: "(Mathas, Example 2.15, p. 6, quoting Murphy, in the normalization `(gᵢ − Q)(gᵢ + 1) = 0`, gᵢ = qTᵢ). The product of the gᵢ along a reduced word of w is `g_w = q^(ℓ(w)) T_w` …". The residue is N01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 `d(t) = relabelPerm t t^λ`, the map `k ↦ t^λ(t⁻¹(k))` | λ = (3,1), t = 124/3, 134/2 | `d` = (34), (243) = (34)(23); the other side gives (34), (234) = (23)(34), and `x_λ(234) = x_λ(34)` | holds as stated | none |
| §1.2 Check: `d(s)⁻¹ x_λ d(t)` independent at q = 1 | n = 2, 3, 4, 5, both sides, rank over ℚ | stated side: ranks 2, 6, 24, 120; other side: 2, 6, 14 (17 distinct elements), 44 | holds; the Check separates the two sides from n = 4 | none |
| §1.2 minimal length in the right coset `S_λ d(t)` | s = (i, i+1) in S_λ; λ = (3,1) | `ℓ(s d) > ℓ(d)` iff `d⁻¹(i) < d⁻¹(i+1)`; `d⁻¹` sends `t^λ(c)` to `t(c)`, increasing along rows; representatives e, (34), (34)(23) | holds | none |
| §1.2 right-action reading `t = t^λ d(t)` | reduced word `s_(i1) ⋯ s_(ik)` | right-acting map is `s_(ik) ∘ ⋯ ∘ s_(i1)`, the inverse of Tau Ceti's `s_(i1) ∘ ⋯ ∘ s_(ik)`; so the map `t^λ → t` becomes `relabelPerm t t^λ` | holds | none |
| §1.2 comparison with Murphy's elements | n = 2 | `(g − Q)(g + 1) = q²(T − q)(T + q⁻¹)`; `m_(2) = 1 + g₁ = 1 + qT₁ = x_(2)`; factor `q^(ℓ(d(s)) + ℓ(d(t)))` | holds | N01 |
| §1.3 Check and Layer 1 example on branching | `[2]_Q[3]_Q ≠ 0`; 𝔽₂, q = 1; Q a primitive cube root of unity | under the hypothesis H₂, H₃ semisimple; over 𝔽₂: T₁ = 1 on both characters, and `v₂T₁ = v₁ + v₂` on S^(2,1) with `v₁ = x_λ`, `v₂ = x_λT₂` | holds; hypothesis sufficient, and needed for the induction at `[3]_Q = 0` | none |
| §2.2 Check on H₂(q) | domain; ℤ/8ℤ, q = 1, z = 3; z = q | det `= (q − q⁻¹)z + 1 − z² = −(z − q)(z + q⁻¹)`; mod 8: −(2)(4) = 0, `τ(T₁ − 3) = 0`, `τ((T₁ − 3)T₁) = 1 − 9 = 0`; at z = q kernel `R·(T₁ − q)` | holds | none |
| §4.6 strong density for countably infinite J | J = ℕ, n = 1; finite I ⊆ J | fixed algebra `ℓ∞(ℕ)`; finite combinations of `E_jj` omit 1; `p_I x p_I` lies in the finite-dimensional fixed algebra on `I^n`, norm ≤ ‖x‖, tends strongly to x | holds | none |
| §4.15 compatibility on every finite phase fixed algebra | bounded strongly convergent net `p_I x p_I` | conjugation by Jₙ and `x ↦ x ⊗ 1` are normal, so the identity passes to the strong limit | holds | none |

The rows for the untouched statements stand as in the previous review, of `e249524`.

- Source locators checked against the text: 1 (Mathas2008, Example 2.15, pp. 6–7, lines 269–301: Murphy's basis named at lines 283–284, its elements not printed; the q-integer convention at line 295).
- Library declarations opened at the pin: `TauCeti.YoungTableau.relabel` (`TauCeti/Combinatorics/Young/Tableau.lean`:407, `t.trans σ`, a left action by `relabel_relabel`), `relabelPerm` (:443, `t.symm.trans t'`), `relabel_relabelPerm` (:454); `TauCeti.StandardYoungTableau.rowSuperstandard` (`TauCeti/Combinatorics/Young/StandardTableau/Reading.lean`:134, labels by reading index); `TauCeti.TypeAHeckeAlgebra.parabolicEigenSum` (`TauCeti/Algebra/TypeAHeckeAlgebra/Symmetrizer.lean`:45).
- Cross-roadmap citations resolved: none added or changed by the diff; TemperleyLieb Layer 5 is on main as cited.
- Automatic checks: all passed, rerun at this head. Dependency check: `depcheck: 172 roadmaps, 2004 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Elaboration: `Suggested.lean` gives five `sorry` warnings and nothing else. The diff changes no Lean file, so the elaborated types and the one-tactic probes stand as in the earlier reviews.
- The description against the head: 89 Checks in 47 sections counted (C01); seven roadmap suppliers under the supplier contracts as listed; no other sentence contradicted.
- Overlap check: read TemperleyLieb (main and its open revision), TemperleyLiebOperatorAlgebras, Subfactors, SchurWeyl, GeometricTopology; Murphy's basis of Hₙ(q) and its coset representatives are named by no other roadmap and stay here; nothing else shared by the changed passages.
- Source independence: changed passages only; 3 passages compared with 1 source (Mathas2008), none shared beyond formulas; largest share Wenzl1988 as in the earlier reviews; the diff adds, removes or reorders no layer, so the contents were not compared again.
- Research link: Layers 3–4 are Wenzl's classification of positive Markov traces on H∞(q) and his subfactors of index (sin(kπ/l)/sin(π/l))^(2m) (Wenzl 1988), with product-state models of the Vershik–Kerov traces (Neretin 2021, Theorem 1.1) and Ram's character formula (Ram 1991); rests on the README's References and on the sources read.

## Not verifiable

- Jones 1987, Ann. Math. 126, and Sawin 1995, Amer. J. Math. 117: paywalled, no legal copy found (untouched by this change).
- Murphy's formula for `m_st`: not printed in Mathas2008 at Example 2.15 and Murphy's paper is not among the roadmap's sources; the comparison was checked against the standard definition and by the rank computation above, not at a locator.
- The angle printed in the hypothesis of Wenzl's Theorem 3.7: the line is missing from the recognised text of the scan.

## Source issues

- **Misprint** in Mathas2008 at Example 2.15, p. 7: the source says that for k < 0 the q-integer is −q^(−k)[−k]_q; it should be −q^(k)[−k]_q, since L₂ = q⁻¹T₁ is −q⁻¹ on the sign module; affects a stated result.
- **Misprint** in Mathas2008 at Example 2.15, p. 6: the source says the product of the generator with T_w is the single basis element when iw > (i+1)w; it should be when iw < (i+1)w, as w = 1 shows; affects nothing.

## For the human reviewers

- Not tested: Jones 1987 and Sawin 1995 are behind the JSTOR paywall and are not in the roadmap's sources manifest; their locators (§§2.1, 3.2, 3.4, 4.7) and wording were not compared with the text.
