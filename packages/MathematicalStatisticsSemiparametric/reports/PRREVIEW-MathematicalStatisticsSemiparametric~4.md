# Review of MathematicalStatisticsSemiparametric (pull request #2378 at 86b0b0c)

**Verdict:** accepted

Incremental re-review of the 11 lines changed since `c096627`. No finding.

## Previous findings

- R01 — repaired: `README.md` lines 88–91 "the `o_P` algebra on one probability space and contiguity basics: … 8.3, 8.5, 8.6"; the 8.4 contract bullet is gone; line 1344 "Layers 1–5; Foundations 8.3, 8.5."; the description's Foundations item reads "(its 8.3, 8.5, 8.6)".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.1 cross-fitting lemma (cites Foundations 8.3, 8.5, the changed contract) | `W ~ N(0,1)`, `n = 4`, two folds of 2, `φ̂ₖ - φ₀ = c·x` | `P(φ̂ₖ - φ₀) = 0`; fold term `n^{-1/2} Σ c Wᵢ` has variance `2c²/4 = c²/2 = (｜Iₖ｜/n)‖φ̂ₖ - φ₀‖²` | the stated variance bound holds with equality; needs only i.i.d. (8.5) and the one-space algebra (8.3) | none |
| Foundations 8.3 item `O_P(1) · o_P(1) = o_P(1)` as contracted | `Xₙ = Z ~ N(0,1)`, `Yₙ = 1/n`; `Xₙ = n`, `Yₙ = 1/n` | `P(｜Z｜/n > ε) = 2(1 - Φ(nε)) → 0`; second product is `1` for every `n`, and `Xₙ = n` is not bounded in probability | the contract states the supplier's bullet; unbounded control fails as it should | none |
| Layer 6 example under the changed Dependencies line | `X ∈ {0,1}` equiprobable, `π₀ = (0.5, 0.8)`, `m₀ = (1, 3)`, `Var(Y ∣ X) = 1` | complete-case mean `1.45/0.65 = 2.2308`; `E Y = 2`; efficient variance `1 + 0.5(2 + 1.25) = 2.625`; IPW variance `0.5(4 + 12.5) - 4 = 4.25` | agrees with the README's values | none |

The rows for untouched statements stand as in the previous review, of `c096627`.

- Source locators checked against the text: 0. The changed passages (a scope bullet, a contract bullet, one Dependencies line) carry no locator and no section of the seeded sample lies in them.
- Cross-roadmap citations resolved at the open heads: MathematicalStatisticsFoundations 8.3 ("The algebra of convergence in probability", with the `O_P(1) · o_P(1)` bullet), 8.5 ("i.i.d. sequences", with `IsIndependentIdenticallyDistributed`, the `Measure.pi` law and the weak law), 8.6 ("Contiguity", with the transfer of convergence in probability); MathematicalStatisticsAsymptotic 1.1 (line 229, Slutsky's lemma on varying spaces). The worker's citation list reports no cross-roadmap citation missing.
- Consumption against the contract: `*Needs:*` lines cite Foundations at lines 553 (8.5, 8.6), 941 (8.3, 8.5) and 995 (8.3, 8.6) only; "Slutsky" now occurs only at line 229 (Asymptotic 1.1). Scope, contract and the Layer 2, 5 and 6 Dependencies lines agree with these.
- Gate: every check passed. Dependency check: `depcheck: 246 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 80 `sorry` warnings and the output of its `#check` pins, nothing else. The diff does not touch `Suggested.lean`, so the `#check @name` comparison of the earlier reviews stands.
- The pull request's text against the head: adds a roadmap (not on main), eight layers as listed, "its 80 theorems are admitted" (80 `theorem`s), suppliers Asymptotic (1.1, 1.2, 7.1–7.6) and Foundations (8.3, 8.5, 8.6) as the contract has them; no sentence contradicted.
- Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, MathematicalStatisticsHighDimensional, PointProcesses, StandardDistributions, OptimalTransport, StochasticCalculus; nothing shared (no change to ownership in this diff; the overlap list reports no dropped id and no other pull request changing this folder).
- Source independence: changed passages only: 0 passages compared with 0 sources, since the changed passages are a supplier list, a deleted contract bullet and a Dependencies line with no source-derived prose; largest share van der Vaart 1998, 37 of 72 locators, text not readable; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- All source locators, including those of the seeded sample: van der Vaart; Bickel–Klaassen–Ritov–Wellner; Kosorok; Little–Rubin: not readable; the earlier lookup through the sources service found no legal copy of any of the four books, and it was not repeated.
- Ownership against the board's packages was checked only through the index given.

## Source issues

- none

## For the human reviewers

- **Not tested.** van der Vaart, *Asymptotic Statistics* (37 of 72 locators), and the three other books could not be read: wording and arrangement were not compared with any source text or table of contents.
- **Licence.** `README.md`, section "Prior formalization", says the headlines of Layers 3–6 are formalized in the author's `lean-CKSD` (Apache 2.0), `CKSD/Asymptotics/`; the names and statements of `Suggested.lean` were not compared with that repository.
