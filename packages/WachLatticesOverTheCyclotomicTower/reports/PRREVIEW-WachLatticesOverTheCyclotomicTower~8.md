# Review of WachLatticesOverTheCyclotomicTower (pull request #2899 at fb73fd9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/WachLatticesOverTheCyclotomicTower/`
**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 31 lines changed since `da69b99`, and no finding remains. The one finding of the previous report (the clause "nothing below depends on the choice" in 6.4) is repaired, and every sign in the replacement text was recomputed and holds; the new locators into Wach 1996, Herr 1998 and Cherbonnier–Colmez 1999 were read at their pages and support what they are cited for. No small correction and no format note. The human reviewers decide on scope, on the licence of the formal proof, and on the section of the family index about reviews.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: 6.4, lines 55–61, "the lattices and every `X`-adic order below are the same for both choices, but a formula written in the coordinate may change sign … the Sen weights of 6.5 (2) are the `−ū`".
- N01 — repaired: line 159 "Wach 1996, Théorème, p. 380, with Remarque a), p. 381"; line 404 "Herr 1998, Théorème 2.1, p. 572 … Proposition 3.1, p. 578 … Théorème 3.8 (1), p. 584"; "Cherbonnier–Colmez 1999, Proposition I.5.1".
- N02 — not repaired: deferred (D01)
- N03 — repaired: References, [FormalProof]: "at the first commit of that repository (…/tree/40e56bab…), with paths relative to its directory `src/` (see the family index)"; the commit is the one the index names.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `(ν₀) = (π₀)` in `O_E[[π]]^{Γ_F^{tor}}`, quotient a unit | expansion in `π`; power sums of `ω(δ)` | `ν₀ = π^{p−1}·∏(δ(π)/π)`, constant `∏ω = −1`. `π₀`: `Σ_ω ω^j = 0` for `(p−1) ∤ j`, so coefficients of `π^k`, `k < p−1`, vanish exactly; that of `π^{p−1}` is `(p−1)/(p−1)! ≡ 1` | holds | none |
| `(ν₀ − p) = (π₀ + p)`, quotient a unit | values at `π = ζ − 1`; Weierstrass degree | `π₀(ζ−1) = Σ_{a}ζ^a − (p−1) = −p`; `ν₀(ζ−1) = ∏(ζ^a − 1) = p`. Both of degree `p − 1` mod `p` with the `p − 1` simple zeros of `q`: each is a unit times `q` | holds | none |
| `π₀/ν₀ = −1` at the zeros of `π₀ + p`; eigenvalues of 6.5 (1) become `−c(−u)` | `ν = π₀^{−1}(γ − 1)`, eigenline of exponent `m` | `γ − 1` acts by `(1+p)^m − 1 = −p·c(m)`; `π₀ ↦ −p` gives `c(m)`, `ν₀ ↦ +p` gives `−c(m)`; `m = −u`: `c(−u)` against `−c(−u)` | holds | none |
| `X′^{−1}(γ − 1) ≡ −∇` on `N̄_i/XN̄_i`; Sen weights `−ū` | `X′ = −X(1 + O(X))`; rank one, `γe = e`, lattice `X^h k[[X]]e` | `X′^{−1} = −X^{−1}(1 + O(X))`, `(γ−1)N̄ ⊂ XN̄`. Rank one: `∇` gives `−h`, `X′^{−1}(γ−1)` gives `+h`. `c(−u) ≡ u`, so `ū` against `−ū` | holds | none |
| `γ(X′) ∈ X′ + X′² + …` equivalent to `γ(X) ∈ X − X² + …` | `X′ = −X + aX²`, `γ(X) = X + bX²`, `γ(X′) = X′ + cX′²` mod `X³` | left `−X + (a − b)X²`, right `−X + (a + c)X²`: `c = −b`, so `c = 1` exactly when `b = −1`, for every `a` | holds, both directions | none |
| 6.4 (8) against Wach 1996 | hypothesis `K ⊂ K_{0,∞}`; `F` unramified | Théorème, condition 4 (free `N` of rank `d`, `Γ` finite on `(N/πN)(−r)`), printed p. 380; Remarque a), p. 381: trivial action gives crystalline. `F = K₀` satisfies the hypothesis | supports the citation | none |
| 6.7: `γ − 1` bijective on `ψ`-zero parts | torsion (Herr) and `ℤ_p`, `ℚ_p` coefficients (Cherbonnier–Colmez) | Herr, Théorème 3.8 (1), printed p. 584: `γ − 1` bijective on `Ker ψ` of a torsion étale module; Proposition 3.1, p. 578: `ψ` exists, unique, surjective, `ψφ = id`; C–C Proposition I.5.1: invertible on `D(V)^{ψ=0}` | supports the citation | none |
| 6.7, 6.9: the Herr complex computes Galois cohomology | `p`-torsion representations | Herr, Théorème 2.1, printed p. 572: `H^i(G_K, V)` is the cohomology of the three-term complex of `D_K(V)` | supports the citation | none |

The rows for the untouched statements stand as in the previous review, of `da69b99`.

- Changed passages: the paragraph on the form of [FormalProof] in 6.4 (lines 49–61), three source lines (6.4, 6.7, 6.9) and four entries of the References. No statement, section number, supplier or Lean declaration changes; nothing changed outside the folder since `da69b99`.
- Source locators checked against the text: 6 of 6 new ones (Wach-1996 lines 229–241 and 245–247; Herr-1998 lines 376–382, 569–575, 810–813; Cherbonnier-Colmez-1999 lines 274–275). Printed pages agree: the Numdam files carry a cover page, so file page 7 is p. 380 and file page 23 is p. 584.
- Seeded sample: of 6.4–6.11 only 6.4, 6.7 and 6.9 are touched, each in a source line or in the 6.4 paragraph; checked above.
- Library declarations opened: none (the changed text names no Mathlib or Tau Ceti declaration).
- Cross-roadmap citations: none added or changed; the tool finds no cross-roadmap citation unresolved, and `PhiGammaModulesAndIwasawaCohomology §3.6` (cited beside the new Herr locator in 6.9) stands as resolved before.
- Dependency check: `depcheck: 133 roadmaps, 1478 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed in the worker's run. Elaboration of `Suggested.lean`: no message, exit 0; it declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Title and description against the head: they describe `X` as the reduction of the trace, which the head keeps ("The statements below are written with `π₀` and `X`"); no sentence contradicted, no change left unstated.

Overlap check: read SelmerLengthBoundsAndLocalLifting, PhiGammaModulesAndIwasawaCohomology, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, LengthBoundsInPadicFamilies, CongruenceModulesOfThetaLifts (scopes as read at the previous rounds; the change touches no owned object); nothing shared. No other open pull request changes this roadmap, and none drops an id it cites.

Source independence: changed passages only: 7 passages compared with 3 sources (Wach-1996, Herr-1998, Cherbonnier-Colmez-1999), none shared (the new text is locators, formulas and one clause per citation in the README's own words); largest share FormalProof, 52 locators at the previous count against 6 added to other sources, text and layout not readable; the arrangement was not compared again (no layer added, removed or reordered).

Research link: Wach modules of crystalline representations (Wach 1996; Berger 2004) and Herr's complexes (Herr 1998); 6.10 (2) extends Berger 2004, Proposition IV.1.3. The family's other roadmaps use 6.4–6.11 towards the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026). Rests on the README and the texts read.

## Not verifiable

- [FormalProof]: the file paths and declaration names cited in 6.4–6.11 (none added at this head); its host is in no class the source service reads, as at the previous round. The mathematics of the 6.4 paragraph was recomputed independently (table).
- Fontaine 1990: not among the texts held; cited without a locator, for a standard fact (untouched text).

## Source issues

- none

## For the human reviewers

- **Scope.** 6.6–6.11 (lattice families, counting theorem, position data and residual bound, carries) cite only [FormalProof], announced 20 November 2026 with no written proof ([Announcement] lines 45–49); no refereed source states them. 6.4, 6.5, 6.10 (2) have refereed sources.
- **Licence.** The family index records (index README, lines 16–18) that the formal proof was published without a licence and is mirrored for verification only. The README cites fifty-two of its file paths and declaration names; `Suggested.lean` declares nothing.
- **Not tested.** [FormalProof] has the largest share of the locators; its text and file layout could not be read, so wording and arrangement were not compared with it.
- **Review policy in the family index.** The section "When a roadmap is wrong" (index README, from line 45) tells reviewers of implementing contributions when not to block a departure from a roadmap. Whether an index may set this is a project decision.
