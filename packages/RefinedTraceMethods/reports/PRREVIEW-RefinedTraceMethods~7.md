# Review of RefinedTraceMethods (pull request #1493 at 795405e)

**Verdict:** accepted

**Summary.** Accepted: incremental re-review of the 120 lines changed since 91f73dc (a new opening overview, the scope and supplier contracts moved to the end, and the comparison map of the étale base change named in §1.8). Every statement of the new overview is one the layers make with the same hypotheses, the §1.8 addition agrees with Weibel–Geller at its locators, and the moved sections point "above" where they pointed "below". No finding, no small correction, no format note; one standing question of scope and licence is left to the human reviewers.

## Previous findings

- none: the previous review, of 91f73dc, had no finding (its R01 and R02 of the round before were already repaired there, and the description sentences they concern are unchanged).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result/change |
|---|---|---|---|
| §1.8 étale base change, the named map `b⊗[c]↦b·[φ(c)]` (README:349) | n=0; A=k[x]→B=k[x,x⁻¹], n=1; φ=id; non-étale control k→k[x], n=1 | n=0: `B⊗_A A→B`, `b⊗a↦bφ(a)`, bijective. n=1: `B⊗_A A·dx → B·dx`, bijective. φ=id: identity. Control: `k[x]⊗_k HH₁(k)`=0, `HH₁(k[x])`=k[x]dx≠0. | Pass; étaleness needed. |
| Overview, Dundas–Goodwillie–McCarthy with its ℤ→ℤ/p control (README:5; §4.17, README:2186) | p=5, 2-completed π₀ of relative terms | K side: `π₀` of the fibre = `𝔽₅^×/±1` = ℤ/2. TC side: `TC(𝔽₅)^∧₂`=0, so the fibre is `TC(ℤ₂;ℤ₂)` with `π₀`=ℤ₂. ℤ/2 ≠ ℤ₂. | Pass; same hypotheses as §4.17. |
| Overview, henselian rigidity (README:5; §4.17, README:2218) | (ℤ_p,pℤ_p), n=p, π₁; n invertible; integral control | `K₁(ℤ_p;ℤ/p)⊇ℤ_p^×/p≠0`, `K₁(𝔽_p;ℤ/p)`=0, so K alone is not rigid at p. n invertible: TC(R)/n=0, Gabber. Integral: relative K₁ of `𝔽_p[[x]]^perf` uniquely p-divisible, relative TC p-complete. | Pass; agrees with cmm lines 96, 1570. |
| Overview, Cartier heart (README:7; §3.4, README:1378) | k=𝔽_p | `π_*THH(𝔽_p)`=𝔽_p[u], u in degree 2, nonzero in positive even degrees; `π_*TR(𝔽_p)`=ℤ_p=W(𝔽_p) in degree 0, FV=p. | Pass; an line 1312. |
| Overview, coordinate q-derivative (README:9; §6.10 framed comparison) | f=xⁿ, n=0,1,2; q=1 limit | `(qⁿxⁿ−xⁿ)/((q−1)x)`=`[n]_q x^{n−1}`: 0, 1, (1+q)x; modulo q−1 gives `n x^{n−1}`. | Pass; matches the `∇_{q,k}` of §6.10. |
| Overview, Beilinson squares (README:11; §9.4) | R=ℤ, π₁ | K-side fibre: `K₁(ℤ;ℚ_p)`=0, `K₂(𝔽_p;ℚ_p)`=0, so 0; `π₁ΣHC(ℤ;ℚ_p)`=ℚ_p. TC square holds for ℤ (no henselian hypothesis, §9.4). | Pass; same hypotheses as §9.4. |

The rows for untouched statements stand as in the previous review, of 91f73dc.

- Source locators checked against the text, 6: wg line 57 (Theorem 0.1, p. 368), wg lines 228–230 (§2, p. 374, first paragraph: the natural map and the claim that it is an isomorphism for étale B), wg line 232 (Theorem 2.1, p. 374, with `B⊗_A B` coefficients), cmm line 96 (Theorem A), cmm line 1570 (Remark 4.39), an line 1312 (Theorem 3.26).
- Overview against the layers: 5 paragraphs of statements compared with §4.17, §3.2 and §3.4, §6.10 and the Conventions (q−1=βt), §9.4; the supplier paragraph with the contracts for KTheoryFiniteLocalFields §§2.1, 4.0, AInfCohomology §AI.7.2, PrismaticCohomologyPartIII §7.0 and HabiroCohomologyFoundations Layers 1–4; the layer guide with the nine layer titles. No statement of the overview is absent from, or wider than, its layer.
- Moved sections: Scope and ownership, Exact supplier contracts now follow Downstream consumers; the four sentences that pointed at the layers now say "above"; no remaining "below" pointing at the layers in those sections. The diff adds, removes and renumbers no layer or section id.
- Cross-roadmap citations resolved: HochschildHomologyAndHKR (open head) cites §1.8 for the étale base change and needs the map, which the changed passage now names; RefinedTraceMethodsPartII (open head d062729) cites §§1.2–1.4, 1.9, 2.1–2.6, 2.8–2.10, 2.13, 2.16, 4.12, 4.17–4.18, all present. No supplier added or dropped.
- Automatic checks rerun on this head: every counter 0, `OK`. Dependency check output: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Outside-folder diff against the base: empty.
- Elaboration: `lake env lean` on `TauCetiRoadmap/RefinedTraceMethods/Suggested.lean`, exit 0, no output. The file is unchanged and declares nothing: no binder comparison and no one-tactic probe to run.
- Pull request text against this head: title and description unchanged and not contradicted; the change since 91f73dc removes no heading, headline or declaration and changes no supplier, so the description leaves nothing unstated.
- Seeded sample: none of the 15 targets lies in a changed passage; §4.17 and §9.4 were reread because the overview restates them. No locator is flagged unverified.

Overlap check: read RefinedTraceMethodsPartII, HabiroCohomologyFoundationsPartII, GeneralAlgebraicKTheoryPartII, HabiroCohomologyFoundations (open heads d062729, f737a8b, a61dbb9, 97383da), PrismaticCohomologyPartIII, PrismaticCohomologyPartII, PrismaticCohomology (main); nothing shared: the open ones are consumers or suppliers of the sections this README owns, and RefinedTraceMethodsPartII owns only computations this roadmap does not state.

Source independence: changed passages only; 5 passages compared with 3 sources (wg, cmm, an), none shared; largest share w, 66 locators of the 318 counted in the previous review (this change adds one wg locator); contents not compared again, the diff adds, removes or reorders no layer.

Research link: the layers state the trace theorems of Dundas–Goodwillie–McCarthy (1997) and Clausen–Mathew–Morrow (2018), the Cartier description of Antieau–Nikolaus (2018), Wagner's q-Hodge comparison over ku (2025) and the Beilinson square of Antieau–Mathew–Morrow–Nikolaus (2020); rests on the README's overview and the sources cmm, an, ammn, w.

## Not verifiable

- The description's "0 independent review rounds and 2 red-team rounds on the job board": a statement about the job board, not about the head.

## Source issues

- none

## For the human reviewers

- **Scope/Licence.** The source with the largest share of locators, `w` (66 of 318), is an arXiv preprint (v1, 2025), and the framed comparison of §6.10 rests on its Theorem 6.10; `d-thesis` is a 2025 Ph.D. thesis.
