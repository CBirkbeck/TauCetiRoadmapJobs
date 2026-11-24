# Review of SeesawForThetaChains (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SeesawForThetaChains/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 157 changed lines since `b8f3652`. The change touches only the README: origin and method labels on the 19 sections, `*Corollary of:*` lines at 6.9 and 6.10 with the supplier contracts they name, a citation in the route of 6.2c, and thirteen references. The folder's text is the same as at the head the previous review read, so its three small corrections and two format notes stand unrepaired; they were checked again against the sources (Wang, Theorem 4.5; Furusawa–Morimoto, Proposition 3.1; Haan–Kwon, Theorem 4.1), the formal proof and the supplier sections at this head. Nothing mathematical is wrong: accepted, with three small corrections and two format notes, none blocking. Nothing is left for a human to decide beyond the standing questions of scope and licence about the formal proof.

## C01 — The origin of 6.13 is labelled "this roadmap's own formulation", but the formal proof states two of its four clauses

The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 191–195) reserves this label for a statement that is neither published nor a statement of the formal proof. A reader who relies on it concludes that the formal proof has nothing of 6.13. Yet the section (line 393) cites [FormalProof] for (o) (`GlobalTheory.Core.Mi.EvalAll`) and (a) (`GlobalTheory.Core.Mi.SBes.PerLaw`), derives (b) and (c) from its statements, and carries a method label for it; the Labels paragraph of the Conventions needs a sentence of its own to explain the exception.

6.12, 6.14 and 6.15 follow the definition: their label is "particular to this proof", with a clause naming the part that is the roadmap's own form. The same would fit here, for example "*Origin:* particular to this proof: the unfolding of a Poincaré series over a Bessel subgroup …, the nearest published result being the classical unfolding of Poincaré series". The sentence of the Labels paragraph about 6.13 could then go.

## C02 — The contract for MetaplecticAutomorphicForms §3.7a (iii) sums over all partitions of ℓ, but the supplier sums over those with at most `min(n, d)` parts

The contract bullet (Exact supplier contracts, From MetaplecticAutomorphicForms, the §3.7a line) says the polynomials of degree `ℓ` are the vacuum character tensored with a sum of `σ_μ ⊗ σ_μ` over the partitions `μ` of `ℓ`. Read literally with `n = 1`, `ℓ = 2`, that sum contains `σ_{(1,1)}` of `U(1)`, which does not exist; the space described, `Sym²(ℂ^d)`, is `σ_{(2)}` alone. MetaplecticAutomorphicForms §3.7a (iii) at this head (line 790) restricts the sum to partitions "with at most `min(n,d)` nonzero parts". Add those words to the bullet.

## C03 — Haan–Kwon, Theorem 4.1 is cited as "extreme cases of the exchange" without its setting, which is orthogonal–symplectic and is a nonvanishing criterion

The origin of 6.2d (line 145) gives the setting of Wang's and of Furusawa–Morimoto's results but not of Haan–Kwon's, and the References (line 569) say only "extreme cases of the exchange of Fourier–Jacobi and Bessel periods". A reader would look there for an identity of integrals for unitary pairs. The theorem (arXiv:2605.04389v2, p. 39) is a different statement: for orthogonal and symplectic or metaplectic groups, the theta lift is nonzero and generic if and only if a Bessel period is nonzero; the unfolding appears in its proof, and the introduction leaves unitary groups to later work. The parenthesis would read "(orthogonal–symplectic and metaplectic pairs, the Whittaker case, as a nonvanishing criterion proved by this unfolding)".

## N01 — Where the change replaced the old markers by `*Sources:*`, the label is followed by a topic in parentheses and no source

This is so at 6.3, 6.4, 6.6, 6.10 and 6.13 (lines 213, 229, 265, 339, 393), for example "*Sources:* (Kudla's seesaw)."; the works are in the new origin lines. The word could be dropped, or the works named there.

## N02 — The origin labels of 6.2c, 6.3, 6.4, 6.9 and 6.10 name works without a theorem or page

Gan–Gross–Prasad (2012), Kudla (1984), Mœglin–Vignéras–Waldspurger (1987, chapters only), Howe (1979), Weil (1964), Kashiwara–Vergne (1978) and Gross (1999); 6.2a, 6.2b and 6.2d give theorem numbers. Would add the locators.

## Previous findings

- The previous review raised no finding. Its small corrections C01–C03 and format notes N01–N02 are not repaired (the folder's text is unchanged since the head it read); they are written again above under the same numbers.

## Verified sound

| Statement | Instances tried | Values computed (README / source or supplier) | Result | Change |
|---|---|---|---|---|
| 6.2a origin: Wang, Theorem 4.5 | Wang's own setting | Wang25 line 996: outer integral over `LU(A)\G(A)`, inner over `LU(k)\LU(A)`; unitary pairs only in footnote 2 (line 115) / README says the same | agrees | none |
| 6.2b origin: hook-type orbits of §5.2 | `λ′ = [k, 1^a] ↦ [k−1, 1^b]` | Wang25 lines 1118–1126: hook partitions give Bessel or Fourier–Jacobi periods, related to one another / README "hook-type orbits of its §5.2" | agrees | none |
| 6.2c route: ThetaKernelsForUnitaryDualPairs §3.3b (a), roles exchanged | `V′₀ = V_A ⊥ L`, `U(W₀)` acting; `V_A = 0` | supplier (a) and line 76 "likewise with the roles of `V` and `W` exchanged": `ω_{V_A⊥L,W₀} = ω_{V_A,W₀} ⊗ ω_{L,W₀}`; `V_A = 0` leaves `ω_{L,W₀}` | agrees | none |
| 6.2d origin: Furusawa–Morimoto, Proposition 3.1 | `dim V = 2n`, lift to `U(n, n)` | FM25 lines 489–506: Whittaker period of the lift = integral over `R_e(A)\G(A)` of Bessel periods; `2n = 2(n−1) + 1 + 1`, so `V_{A′}` a line, `W₀ = 0` | agrees | none |
| 6.2d origin: Haan–Kwon, Theorem 4.1 | `k = n+ε−1, n+ε`; `ε = 0, 1` | HK26 lines 1561–1566: orthogonal and symplectic/metaplectic groups; lift nonzero and generic iff Bessel period nonzero; unitary deferred (lines 485–492) / README: no setting | imprecise | C03 |
| 6.1 labels | `ξ = 1`; all periods zero | definition by cases gives `ζ(u, 1) = 1`, and `1` when no `z` exists; method label: formal proof only asserts a family exists | consistent | none |
| 6.9 Corollary of MetaplecticAutomorphicForms §§2.5a (i), 3.7a (iii) | `N = 1`, `ℓ = 0, 1`; `n = d = 1` | `exp(θJ)` acts by `e^{−iθ/2}` and `e^{−3iθ/2}`, distinct, so degrees separate; `(t, s)` on `z^ℓ` by `(ts)^{−ℓ}`; finite sum of products | deduction holds | none |
| §2.5a contract bullet | degree `ℓ` | bullet: `det_J(k)^{−1/2}·G∘k⁻¹`, `e^{−i(ℓ+N/2)θ}` / supplier line 518: the same | agrees | none |
| §3.7a (iii) contract bullet | `n = d = 2, ℓ = 2`; `n = 1, ℓ = 2` | `dim Sym²(ℂ⁴) = 10 = 3·3 + 1·1`; for `n = 1`: `Sym²(ℂ^d) = σ_{(2)}` only, `σ_{(1,1)}` of `U(1)` undefined; supplier bounds the parts | wording | C02 |
| 6.10 Corollary of AdelicAlgebraicGroups §4.5a | `G = U(X^h)`, definite | centre `U(1)` anisotropic, so `A_G = 1`, `G(F_∞)` compact, `G(𝔸)^1 = G(𝔸)`; formula `vol(U)·Σ |Γ_i|^{−1}∫ f(g_∞x_i)` matches the bullet | agrees | none |
| 6.12 origin and method | `x = 2, y = 1, S = {2}` | formal relation `(x/y)^n = r ∈ ℚ^×` supported in `S` holds with `r = 2`, yet `2` is no root of unity: formal form strictly weaker, as the label says; reflexivity, product, quotient, power lemmas present | agrees | none |
| 6.13 origin | the family's definition of the label | "own formulation" = neither published nor formal; (o), (a) cited to [FormalProof] on the section's own `*Sources:*` line | contradicts | C01 |
| 6.14 method | the anchor pair | pairing is a squared `L²` norm of `P_uφ₁`, nonzero when `P_u ≠ 0` on `M_u` (hypothesis of 6.14) | consistent | none |
| 6.15 method | every rational period zero | formal proof: constant `1`; 6.1 sets `ζ := 1` in that case | consistent | none |
| Labels paragraph | 6.1–6.15, 6.2a–6.2d | 19 headings, 19 origin lines, 19 method lines; corollary lines at 6.9 and 6.10 only | agrees | none |

- Source locators checked against the text: 6 in 3 sources (Wang, arXiv:2311.14234v1: Theorem 4.5, footnote 2, §5.2, and that Proposition 3.2 and Theorem 3.3 exist; Furusawa–Morimoto, arXiv:2205.09471v2, read through OCR: Proposition 3.1; Haan–Kwon, arXiv:2605.04389v2: Theorem 4.1).
- Formal proof, operator's local copy: the definition `GlobalTheory.Fam.UnitRatio` and its five closure lemmas (behind the labels of 6.12) opened; the other method labels were not reopened this round.
- Cross-roadmap citations resolved at this head: MetaplecticAutomorphicForms §§1.5, 2.5a, 3.7a; AdelicAlgebraicGroups §4.5a; ThetaKernelsForUnitaryDualPairs §§3.3b, 4.4a.
- Record: the headings of the README at the merge base and at the head are identical; no layer, section or item is removed or renumbered; `Suggested.lean` is unchanged. No supplier is added: MetaplecticAutomorphicForms and AdelicAlgebraicGroups were suppliers at the merge base.
- Dependency check: `depcheck: 129 roadmaps, 1444 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives no message. The file declares nothing, so no `#check` comparison and no one-tactic probe applies; the three headlines (the unfolding 6.2a–6.2d with 6.2, the seesaw identity 6.14, the rationality 6.15) are named in its docstring as not statable, with the carriers each lacks.
- Automatic checks: all passed.
- The pull request's text: its part 2 describes the labels and says section numbers are unchanged, which this folder bears out; it names no change of this folder that the head lacks, and the head has none it omits.

Overlap check: read RowTowerAndRallisIdentities, ThetaChainsOnDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, MetaplecticAutomorphicForms and AdelicAlgebraicGroups; the change adds no object owned here. The Fock model and the compact dual pairs are owned by MetaplecticAutomorphicForms (§§1.5, 2.5a, 3.7a), class-set integration by AdelicAlgebraicGroups (§4.5a), the orthogonal-sum compatibility by ThetaKernelsForUnitaryDualPairs (§3.3b); this roadmap cites each.

Source independence: changed passages only; 9 passages compared with 4 sources (the origin lines of 6.2a, 6.2b, 6.2d and 6.2 with Wang and Furusawa–Morimoto, that of 6.2d with Haan–Kwon, the method lines and origin of 6.12 with [FormalProof], the two corollary lines with their supplier sections), none shared beyond standard names; largest share [FormalProof], about 67 of 80 locators; no layer added, removed or reordered, so the arrangement was not compared.

Research link: Layer 6 of the chain in Alpöge's formal proof of GRH for Dirichlet L-functions (Announcement, 2026). Its unfoldings 6.2a–6.2d are unitary forms of the Bessel/Fourier–Jacobi exchange under theta lifts of Wang (2025, Theorem 4.5) and Furusawa–Morimoto (2025, Proposition 3.1), used for Gan–Gross–Prasad; rests on the README's origin labels and the two papers as read.

## Not verifiable

- Journal data and printed numbering of Wang (J. Number Theory 271, 2025) and Furusawa–Morimoto (Math. Ann. 391, 2025): only the arXiv versions were read.
- The works named without a locator in the origin labels of 6.2c, 6.3, 6.4, 6.9 and 6.10 (Gan–Gross–Prasad 2012, Kudla 1984 and 1994, Harris–Kudla–Sweet 1996, Mœglin–Vignéras–Waldspurger 1987, Howe 1979, Weil 1964, Kashiwara–Vergne 1978, Gross 1999), and Furusawa (1995) and Ginzburg–Rallis–Soudry (1997) at 6.2a: not opened, there being no locator to check.
- The method labels other than that of 6.12 were not compared again with the formal proof this round; the previous review compared those of 6.3, 6.5, 6.6, 6.7, 6.9 and 6.10, and the text is unchanged since.

## Source issues

- none

## For the human reviewers

- Scope: the main source is [FormalProof], an unrefereed Lean development announced on 20 November 2026 (Announcement). The change adds published sources for 6.2a–6.4, 6.9 and 6.10 (Wang 2025, Furusawa–Morimoto 2025, Kudla 1984, Gross 1999, among others).
- Licence: the family index says the formal proof was published without a licence; this README cites its file paths and declaration names only, with no text.
- Decisions: neither recorded decision bears on this folder, which removes no section and hands none to another roadmap.
