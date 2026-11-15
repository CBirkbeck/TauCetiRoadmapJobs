# Review of DiamondEtaleCohomology (pull request #922 at 9e9df99)

**Verdict:** accepted

No finding. Incremental re-review of the 64 lines of `TauCetiRoadmap/DiamondEtaleCohomology/README.md` changed since `e465c50`; `Suggested.lean` is unchanged.

## Previous findings

- R01 — repaired: the nine names are gone from the README (grep: 0 hits); the text now reads “Say that `F` is constant finitely generated on `Z`”, “the modified topological transcendence degree `trdeg.mod(K,L)`”, “the point cohomological dimension `cd_ℓ(y)`”, “The light carrier of `sp_n(X)`”.
- R02 — repaired: `README.md:269` reads “| C4 | Imported properness API, partial properness and canonical compactification |”; no “re-export” remains in the README.

## Verified sound

Adversarial table for the statements the diff changes. `P = Spa(C, O_C)`, `S = Spa(C, C⁺)` of rank two with open point `η` and closed point `s`, sheaves on `S` written `(F_s → F_η)`, `M = 𝔽_ℓ`.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| C4.15 (reworded) | `id_S`; `f : {η} → S` over `S` | `id`: compactification `S`, `f̄ = id`. `{η}`: compactification of `Spa(C,O_C)` over `S` is `Spa(C, C⁺ + C°°) = S`, so `f̄ = id_S` is proper although `f` is not; `f` quasicompact, as the statement requires | retain |
| C4.15 against ECD Corollary 18.8 | seven clauses | partial properness; small and diamond inheritance; limits; surjective, quasi-pro-étale, quasicompact ⇒ proper: all seven present with the same hypotheses (ECD lines 4335–4347) | retain |
| C7.1 “constant finitely generated on `Z`” | `(M → 0)` on `S`; `Z = {s}`, `{η}`, `S` | constant `M`; constant `0`; on `S` stalk ranks `(1, 0)`, not constant | retain |
| C7.9 finite filtration by `P` | `F = 0`; `F` with `P(F)` | `n = 0`, `G₀ = 0 ≅ F`; `n = 1`, `0 → F`, cokernel `F` | retain |
| C8.10 `trdeg.mod` | `K = L`; `C ⊂ C(t)^{a∧}` | `0` (take `E = L`); `≤ 1` from `E = L`, `≠ 0` since `L ≠ K`, so `1` | retain |
| C8.12 tower | `C ⊂ C(t)^{a∧} ⊂ C(t,u)^{a∧}` | `2 ≤ 1 + 1` | retain |
| C8.14 and C8.16, one symbol `dim.trg` for analytic and diamond maps | `∅ → P`; `id_P`; `Spa(D,O_D) → Spa(C,O_C)` | both definitions give `⊥`; `0`; `trdeg.mod(C,D)`: they agree where both apply, as in ECD Definitions 21.5 and 21.7 (lines 5054–5070), which share the symbol | retain |
| C8.15 | `id_P`; Gauss point of the disc over `P` | `0 ≤ 0`; fibre dimension `1 ≤ 1` | retain |
| C8.18 | `Z = ∅`; identities of `P` | `⊥` with no `∞` arithmetic; `0 ≤ 0 + 0` | retain |
| C8.19 locally finite `dim.trg` | `⊔_n` (`n`-dimensional ball) over `P` | each point has a neighbourhood with bound `n`; no uniform bound | retain |
| C8.28 `cd_ℓ(y)` | `P`; `K = (⋃ₙ 𝔽_p((t^{1/pⁿ})))^∧`, `ℓ = p` | `G_y = 1`, value `0`; `x^p − x = 1` reduces to `0 = 1` in `𝔽_p`, so `H¹ ≠ 0`, and `cd_p(K) ≤ 1`: value `1` | retain |
| C8.31, C8.41, C8.47, C8.48, C9.14 (symbol substitutions) | `S` geometric; `id_P`; `D₂ = P ⊔ P` over `P`, `d = e = 0` | `cd_ℓ(η) = 0`, `H^{>0} = 0`; `0 ≤ 0`; `H⁰ = M²`, `H^{>0} = 0` | retain |
| C8.40 | Gauss radius 1; rationally independent radius | `1 + 0 ≤ 1`; `0 + 1 ≤ 1` | retain |
| C8.42 carrier of `sp_n(X)` | `S`, `n = 0, 1, 2` | tuples with `x_i` generalizing `x_j` for `i ≤ j`: `2, 3, 4`; for `n = 1`: `(η,η), (η,s), (s,s)` | retain |

The rows for untouched statements stand as in the previous review, of `e465c50`.

- Gate, run on this head: every counter 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/DiamondEtaleCohomology/Suggested.lean` with `lake env lean`: exit 0, six `declaration uses sorry` warnings (lines 46, 80, 116, 131, 148, 173), nothing else. The file is identical to the one read at `e465c50`, so the signature and padding checks stand.
- Source locators checked against the text: 3 (ECD Corollary 18.8, lines 4335–4347, pp. 105–106; ECD Definition 21.5, line 5054; ECD Definition 21.7, line 5064).
- Seeded sample “Perfectoid field-test reduction”: its passage is outside the diff and is unchanged; it stands as verified at `e465c50`.
- Cross-roadmap: `roadmaps grep` for the nine retired names over main and the open heads: no match, so no other roadmap cited them. The diff changes no section id, supplier or `*Needs:*` line; the two resolver leads (`AdicSpace.relDim`, `VanishingCycles.properBaseChange`) are the supplier targets resolved at `e465c50`.
- Pull request text: title and description read against this head; the wording change touches nothing they state (no section, headline, declaration or supplier added or removed). Diff outside the folder: empty.
- Overlap check: read DiamondSixOperations, ClassicalAdicEtaleCohomology, VStackSheavesAndLisseCategories, AdicCoefficientsAndComparisons, FarguesFontaineDiamonds, DiamondsAndVStacks, EnhancedDerivedSheaves, PerfectoidSpaces; nothing shared (VStackSheavesAndLisseCategories imports C6 and adds the solid statements; the others as at `e465c50`).
- Source independence: changed passages only; 3 passages compared with 1 source (ECD), none shared: C4.15 now states Corollary 18.8 as running prose in a different clause order, longest shared run 6 words (“of separated v-stacks over `Y`”, forced by the mathematics); `dim.trg` is the literature's symbol; largest share ECD, as at `e465c50`; no layer added, removed or reordered, contents not compared again.

## Not verifiable

- Scheiderer 1992 and Huber 1996 (C8.11a): paywalled, not opened; unchanged since `e465c50` and not touched by the diff.
- CS17 and Temkin 2010: journal pagination not verified (arXiv versions read at `e465c50`); not touched by the diff.

## Source issues

- none

## For the human reviewers

- The description's summary block says “The route follows Scholze's *Étale cohomology of diamonds*”; ECD has the largest share of the README's locators. The README itself does not say it follows a source. The arrangement was not compared again in this round.
