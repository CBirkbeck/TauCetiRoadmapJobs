# Review of AlmostPeriodicityAndBohrSets (pull request #3191 at 2e0cc0a)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The one finding of the previous review is repaired (`exists_linearMap_isAddFreimanIso` now carries `1 ≤ s`), and so are its three small corrections and two format notes; the new Lean statement of the de Leeuw–Glicksberg decomposition is true and agrees with 10.5. There is one small correction, in the rewritten step 1 of the proof of 5.5, and no format note; it does not block. Two points are left for the human reviewers (reused Lean shapes, and the books of Layers 8–10 that could not be read).

## C01 — In step 1 of the proof of 5.5, `W = A` does not give the triple convolution written next to it

Step 1 (README lines 667–671) applies 2.2 with "`B = A + A`, `W = A`" to `1_{−A} ⋆ 1_{A+A} ⋆ 1_{−A}`, and says its normalisation equals `1` at `0`. In 2.2 the function is `μ_A ⋆ 1_B ⋆ μ_W`, so the convolution written is the case where both outer sets are `−A`: then the value at `0` is the average of `1_{A+A}(a + a')` over `a, a' ∈ A`, which is `1`, and the support lies in `2A − 2A`. With `W = A` the value at `0` is the average of `1_{A+A}(a − a')`, which need not be `1`: for `G = ℤ/5`, `A = {1}`, `A + A = {2}` and `a − a' = 0`, so it is `0`. Write `W = −A` (and say that the set called `A` in 2.2 is `−A`, with `S = A`, so that `μ(S − A) ≤ 1`). The ratios are unchanged, since `μ(−A) = μ(A)`; after the passage to a compact subset of measure at least `α/2` they are `≤ 2/α` and not `≤ 1/α`, which the `O(·)` absorbs.

## Previous findings

- R01 — repaired: `Suggested.lean` line 264 reads "`(A : Finset G) (hA : A.Nonempty) (s : ℕ) (hs : 1 ≤ s)`", and the docstring says "for `s ≥ 1`"; the elaborated type has `1 ≤ s →`, as the README's theorem of 7.3 does.
- C01 — repaired: step 1 of 5.5 now names "`B = A + A`", "`m ≈ L`, with `ε ≈ 1/L`", the compact subset, and the unnormalised convolution for the `α²` error. The repair writes `W = A` where `W = −A` is meant (C01 above).
- C02 — repaired: "the map taking a residue to its integer representative in `[0, P)` reduced mod `q`".
- C03 — repaired: the docstring says "One result of the Summary is not stated here", and `exists_isAlmostPeriodic_add` states the decomposition elementwise.
- N01 — repaired: "`0 ≤ ρ < 2`: the Bohr set is `{0}`; for `ρ < 0` it is empty; for `ρ ≥ 2` it is `G`".
- N02 — repaired: the heading and the bullets of 1.1 name Marcinkiewicz–Zygmund first, matching "Theorems 7.2 and 7.3".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.3 `exists_linearMap_isAddFreimanIso` | `s = 1`, `𝔽₂²`, `A` everything; `G = 0`; elaborated type | `#(A − A) = 4`, bound `2·4 = 8 ≥ 4`, identity works; `p·1 ≥ 1`; type has `1 ≤ s →`; `s = 0` excluded | holds; Lean = README | none |
| 10.5 `exists_isAlmostPeriodic_add` | `ℤ`, `f = c + 1_{0}`; `f` almost periodic; `G` compact; not both parts trivial | `g = c`, `h = n = 1_{0}`, mean `0`; `h = 0`, `m 0 = 0`; `g = f` fails unless `f` is almost periodic; `m n` fixed by uniqueness since `|h|` is weakly almost periodic | holds; equals the direct sum of 10.5 elementwise | none |
| 5.5 proof, step 1 | `g = μ_{−A} ⋆ 1_{A+A} ⋆ μ_{−A}`; `W = A` on `ℤ/5`, `A = {1}` | `g(0) = 1`, support in `2A − 2A`; `k ≈ L·L² = L³`, `K^k = e^{O(L⁴)}`; with `W = A` the value at `0` is `0` | sketch right with `W = −A` | C01 |
| 7.3 torsion-free proof, step 2 | `P = 5`, `q = 3`, `k = 2`, arc `{0, 1, 2}` | `1 + 1 = 0 + 2` maps to `2 = 2` in `ZMod 3`; `k` representatives in an arc of length `P/k` sum inside an interval shorter than `P` | holds; Sanders2012 line 920 has `k ≥ 2`, `q ≥ #(kA − kA)`, `#A' ≥ #A/k` | none |
| 4.2 Check on `ℤ/2` | `ρ = −1, 0, 1, 2` | `|1 − 1| = 0`, `|−1 − 1| = 2`: sets `∅`, `{0}`, `{0}`, `G` | holds | none |
| 1.1 order of names | Sanders2013 lines 655, 681 | Theorem 7.2 is Marcinkiewicz–Zygmund, 7.3 Khintchine | agrees | none |

The rows for the untouched statements stand as in the previous review, of `4d9521e`.

- Source locators checked against the text: 4 (Sanders2013 Theorems 7.2, 7.3; Sanders2012 Lemma 11.2 and §3, lines 102–116).
- Library declarations opened at the pins: none new; the changed Lean statements use only `IsAddFreimanIso` and the file's own predicates, checked by elaboration.
- Cross-roadmap citations resolved: the diff touches none; the citation resolver reports none missing.
- Automatic checks: all passed. Dependency check: `depcheck: 94 roadmaps, 1056 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 20 `sorry` warnings, nothing else. `#check @name` for the two touched declarations compared with the README: both agree; `exists_isAlmostPeriodic_add` carries `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`.
- One-tactic probe on a copy (`simp`, `rfl`, instance search) for the two touched theorems: neither closes.
- Pull request text read against this head: no sentence contradicted; the change adds no supplier and removes no section or declaration.

Overlap check: read FourierAnalyticAdditiveCombinatorics, CompactGroupsPartII, SidonSetsAndLinearEquations, CompactGroups, AmenableGroups, BanachSpaceTheory; compact abelian characters, coefficient and Parseval: owner CompactGroupsPartII §5.1, cited here; Bogolyubov in finite abelian groups: owner FourierAnalyticAdditiveCombinatorics Layer 4, which leaves Bohr sets and Chang's lemma to others; nothing else shared. The diff changes no ownership.

Source independence: changed passages only; 4 passages compared with 2 sources (Sanders2012, Sanders2013), none shared; largest share Sanders2012, 10 of about 25 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again (independent in the previous review). The books cited for Layers 8–10 could not be read.

Research link: Layers 2 and 5–7 are the Croot–Sisask lemma (Croot–Sisask 2010) and the Bogolyubov–Ruzsa and Freiman–Ruzsa bounds of Sanders 2012 and 2013, with Ruzsa's and Green–Ruzsa's modelling; Layer 11 is Følner 1954 and Beiglböck–Bergelson–Fish 2010 per the README's References. Rests on the README and on the five texts read.

## Not verifiable

- de Leeuw–Glicksberg 1961 (10.5, now also stated in Lean): no legal copy found in the earlier rounds; the statement was checked by computation and against the README's 10.5 only.
- Ruzsa 2009, Theorem 3.5 (7.3): book chapter not held; read only as quoted at Sanders2012 line 920.
- The other texts listed in the previous review (Namioka–Asplund, Følner, Beiglböck–Bergelson–Fish, Grothendieck, Eberlein, Ellis, Namioka, Chang, Bourgain, the books of Layers 8–10, LeanAPAP, openai/math): not sought again; the diff does not touch what they are cited for.

## Source issues

- none

## For the human reviewers

- **Licence.** `BohrSet` in `Suggested.lean` is said to follow LeanAPAP's `BohrSet`, and the README's Provenance section names openai/math at `adc7f124`; both are stated to be Apache-2.0. Neither repository was opened.
- **Not tested.** Layers 8–10 cite three books (Burckel; Berglund–Junghenn–Milnes; Ruppert) that could not be read; wording and arrangement were not compared with them.
