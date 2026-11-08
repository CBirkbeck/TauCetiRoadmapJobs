# Review of TemperleyLiebOperatorAlgebras (pull request #867 at be26d68)

**Verdict:** needs changes

Incremental re-review of the 36 lines changed since `b0e66ea` (32 insertions, 4 deletions, all in `README.md`: the Layer 3 ownership bullet, the "single home" paragraph in the scope, the consumer sentence after the scope, the former-label table A1–A7 after "How to read the build", and the rewritten `## Downstream consumers`). The head also merges main (`22d7ebb1`), which moves the pins from Mathlib `6b7abb3c` / Tau Ceti `a91d3aa` to Mathlib `1b1ccf4b` / Tau Ceti `2fd255d9`; `Suggested.lean` is byte-for-byte unchanged and was re-elaborated at the new pins (clean, five `sorry` warnings). The worker's gate fails on `build=2` at this head (the Lake module-system warning), so no acceptance is possible; two of the changed sentences are wrong about what this roadmap supplies, and the pin move leaves the supplier contract naming as roadmap targets several declarations that Tau Ceti now provides.

## R01 (P1) — the gate's build fails at the new pins: `Suggested.lean` lacks the module-system header

Location: `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/Suggested.lean:5–8` (`import Mathlib`, three `import TauCeti.…` lines).

Claim: the worker's gate at `be26d68` reports `build=2 FAIL`, both lines being Lake's "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". The brief counts a failing build check as a finding, and no acceptance while the gate fails.

Witness: `lake env lean` on the file from the pull-request worktree exits 0 with exactly the five `sorry` warnings (lines 107, 151, 288, 314, 333), so the mathematics elaborates; only the header is at fault. Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` are module-system packages (`TauCeti/Algebra/TemperleyLieb/JonesWenzl.lean:6` begins `module`).

Repair, tested on a scratch copy: line 5 `module`, blank line, `public import Mathlib`, `public import TauCeti.Algebra.TemperleyLieb.MarkovTrace`, `public import TauCeti.Algebra.MonoidAlgebra.Twisted.Basic`, `public import TauCeti.LinearAlgebra.CliffordAlgebra.Dimension`, the module docstring unchanged, then `@[expose] public section` on its own line immediately before `noncomputable section`. The copy elaborated with `lake env lean --root=<scratch> <copy>`: exit 0, the same five `sorry` warnings, nothing else.

## R02 (P2) — the positive Temperley–Lieb completion now has two owners among the open pull requests

Location: `README.md:71–75` ("The comparisons 1.2–1.3, the sign isomorphism 2.1 and Layer 3 are the single home of the positive Temperley–Lieb completion … Roadmaps that need these objects consume them from here and do not restate them") and `:1747–1754` (QuantumGroups Q7 consumes 1.2–1.3, 2.1 and Layer 3).

Claim: both open revisions of QuantumGroups build the same objects themselves and cite this roadmap nowhere. QuantumGroups #1649 (head `968db79`) `README.md:21–22`: "Layer 0 owns … positive Temperley–Lieb completions"; `:280–322` (§0.4) constructs the analytic adjoint, the Markov-trace positivity classification, the identification of the trace radical with the negligible ideal, the `δ = −d` comparison by `e_i ↦ −e_i` preserving the normalised trace, and the unitary tensor category with Hom norms, standard conjugates, simple objects and the generic and truncated fusion rules. QuantumGroups #1705 (head `a938955c`) has the same section as §0.3 (`README.md:244–286`). A grep of both heads for `TemperleyLiebOperatorAlgebras` returns nothing. The ownership claim here agrees with QuantumGroups on main (`TauCetiRoadmap/QuantumGroups/README.md:43`, the supplier row citing A1–A6), which both revisions delete; the cross-check comment on the pull request asked the two sides to agree on one owner, and at this head the agreement is one-sided.

Witness: the objects of `README.md:72–74` (trace radical = negligible ideal; loop parameters `−d` and `d`; unitary tensor category with standard solutions, simples, fusion) are, item by item, the targets of #1649 `README.md:290–293`, `:296–298` and `:298–304`.

Repair: the README keeps the ownership paragraph; the settlement has to be recorded where the merge order reads it. The pull request's merge-order paragraph states that this roadmap merges before the QuantumGroups revision and that the revision's positive-completion section is then a citation of 1.2–1.3, 2.1 and 3.1–3.4 (keeping only the `O_F^+`-specific comparison of Q7), and the QuantumGroups revision drops its restatement; or, if the project settles the other way, this roadmap's 1.2–1.3, 2.1 and Layer 3 become citations of the QuantumGroups section once it is on main. Either way one pull request yields; until one does, two open pull requests own the objects.

## R03 (P2) — the consumer contract describes a map that 2.1 itself refutes

Location: `README.md:1749–1750` ("2.1 when its signed loop parameter is `−d`, for the algebra isomorphism carrying the generator `−d·p_i` to `d·p_i` with equal normalised traces").

Claim: 2.1 constructs `s : TL_n(δ) ≃ TL_n(−δ)` with `s(e_i) = −e_i` (`:1131`). With `p_i = e_i/δ` on each side, `s(p_i) = (−e_i)/δ = e_i/(−δ) = p_i`: the isomorphism carries projections to projections. The signed generator of `TL_n(−d)` is `e_i = −d·p_i`, and `s⁻¹(e_i) = −e_i = −d·p_i` in `TL_n(d)`, which is minus the positive generator `d·p_i`, not `d·p_i`. A map carrying `−d·p_i` to `d·p_i` is `e_i ↦ e_i`, exactly the map 2.1's last Check (`:1179–1181`) shows is not an algebra map.

Witness: `n = 2`, `d = 2`, basis `{1, e}`: `s(p^d) = s(e/2) = −e/2 = e/(−2) = p^(−d)`; `s⁻¹(e^(−d)) = −e^(d) = −2·p^(d)`, while `d·p^(d) = e^(d)`. The normalised traces are equal as stated: `τ^d(1) = 1 = τ^(−d)(s 1)`, `τ^d(e) = 1/2 = τ^(−d)(−e) = (−2)/4`.

Repair: "2.1 when its signed loop parameter is `−d`, for the algebra isomorphism `s` carrying each projection `p_i` to `p_i`, hence the signed generator `−d·p_i` to minus the positive generator `d·p_i`, with equal normalised traces and `Q_n^(−d) ≅ Q_n^d`".

## R04 (P3) — 1.2–1.3 are cited for an object the scope assigns to Subfactors

Location: `README.md:1748` ("It consumes 1.2–1.3 for the faithful Hermitian trace form on `Q_n`").

Claim: the Hermitian form `H_n = T_n(x† y)`, the trace radical `R_n` and the faithful trace on `Q_n = TL_n/R_n` are Subfactors 3.2–3.3 by this README's own scope (`:85–96`: "the Hermitian form `H_n`, the trace radical `R_n`, Jones's positivity theorem … (3.2); … the C*-inductive limit `B_δ` with its faithful trace … (3.3). None of it is restated here"). What 1.2 adds is the Hermitian cell form on `CellModule` and its Gram anchors (`:409–453`); what 1.3 adds is `presentedTLEquiv(R_n) = negligibleIdeal (n, n)` and `Q_n ≅ End(n)` in the negligible quotient (`:455–506`).

Witness: Subfactors on main, `README.md:697` (§3.2, `H_n`, `R_n`, positivity) and `:774` (§3.3, `Q_n`, C*-tower).

Repair: "It consumes Subfactors 3.2–3.3 for the faithful Hermitian trace form on `Q_n`, 1.3 for the identification of `Q_n` with the endomorphism algebra of the negligible quotient of the diagram category, and 1.2 for the comparison of the Hermitian and bilinear cell forms".

## R05 (P3) — after the pin move, the supplier contract and the Lean docstring assign to TemperleyLieb targets that Tau Ceti now provides

Location: `README.md:202` (From Tau Ceti: `Basic.lean`, `MarkovTrace.lean` only), `:243–245` (Layer 0: `qInt`, `exists_qInt_eq_zero_iff`), `:251–252` (Layer 4: `IsMarkovTrace`, `existsUnique_isMarkovTrace`), `:259–260` (Layer 6: `jonesWenzl n`, `existsUnique_jonesWenzl`, both recursions, `IsMarkovTrace.apply_jonesWenzl`), `:1141` and `:1186` (2.1's route "from TemperleyLieb Layer 4's `existsUnique_isMarkovTrace`"); `Suggested.lean:53–56` ("Jones–Wenzl projections and negligible ideal of TemperleyLieb Layers 3–7, none of which exist at the pins").

Claim: at Tau Ceti `2fd255d9` these are native: `TauCeti.qInt` (`TauCeti/QuantumGroups/QuantumInteger/Chebyshev.lean:69`), `TauCeti.exists_qInt_eq_zero_iff` (`…/QuantumInteger/RootOfUnity.lean:89`), `TauCeti.TemperleyLieb.IsMarkovTrace` (`TauCeti/Algebra/TemperleyLieb/Trace.lean:52`, four fields: value `δ^n` on `1`, traciality, the factor `δ` under `strandIncl`, the Markov property), `IsMarkovTrace.unique` (`Trace.lean:88`), `IsMarkovTrace.eq_markovTrace` (`MarkovTrace.lean:518`, every Markov trace at `δ = −(q + q⁻¹)` is `markovTrace q hδ`), `TauCeti.TemperleyLieb.jonesWenzl` (`JonesWenzl.lean:122`), `jonesWenzl_add_two` (`:142`, Wenzl's recursion), `existsUnique_jonesWenzl` (`:374`), `IsMarkovTrace.apply_jonesWenzl` (`QuantumDimension.lean:60`, value `[n+1]` when `[1], …, [n]` are units) and `markovTrace_jonesWenzl` (`:71`). None of these files exists at the previous pin `a91d3aa` (`git cat-file -e` on `JonesWenzl.lean`, `QuantumDimension.lean`, `Trace.lean`, `Tower.lean`, `QuantumInteger/Chebyshev.lean`: absent). The brief's rule is that what exists at the pins is cited from the library with its exact name and file, not from a roadmap; TemperleyLieb on main already does so (`TauCetiRoadmap/TemperleyLieb/README.md:708`, "on the native algebra `IsMarkovTrace.apply_jonesWenzl`").

Witness: `JonesWenzl.lean:122` `noncomputable def jonesWenzl : (n : ℕ) → TemperleyLieb R δ n`; `Trace.lean:88` `theorem unique … (htr : IsMarkovTrace R δ tr) (htr' : IsMarkovTrace R δ tr') : tr = tr'`.

Repair: add to the From Tau Ceti list (`:202–236`) the files `TauCeti/QuantumGroups/QuantumInteger/{Chebyshev,RootOfUnity}.lean` with `qInt`, `exists_qInt_eq_zero_iff`; `TauCeti/Algebra/TemperleyLieb/Trace.lean` with `IsMarkovTrace` and `IsMarkovTrace.unique`; `MarkovTrace.lean` with `isMarkovTrace_markovTrace`, `IsMarkovTrace.eq_markovTrace`; `JonesWenzl.lean` with `jonesWenzl`, `jonesWenzl_add_two`, `existsUnique_jonesWenzl`; `QuantumDimension.lean` with `IsMarkovTrace.apply_jonesWenzl`, `markovTrace_jonesWenzl`. Keep under TemperleyLieb Layer 0 only what the pin lacks (the Chebyshev-`S` description if the roadmap states it), under Layer 4 the diagram-side items (`TLAlg`, `presentedTLEquiv`, `tr̂`, `condExp`, the comparison with `markovTrace`), under Layer 6 the partial-trace formula, tensor ideals, `negligibleIdeal` and Goodman–Wenzl. In 2.1 replace "TemperleyLieb Layer 4's `existsUnique_isMarkovTrace`" by "Tau Ceti's `IsMarkovTrace.unique` with `isMarkovTrace_markovTrace`" at `:1141` and `:1186`. In the docstring: "they need the diagram category, cell modules and negligible ideal of TemperleyLieb Layers 3, 5–7, none of which exist at the pins (the Jones–Wenzl projections do, as `TauCeti.TemperleyLieb.jonesWenzl`)".

## R06 (P3) — the inputs sentence of 1.7 still omits the Tau Ceti basis that defines `s_m`

Location: `README.md:834–836` ("use only Mathlib's `CliffordAlgebra`, Tau Ceti's `TemperleyLieb` and Subfactors 3.2's Markov uniqueness").

Claim: unchanged from the previous report's R01: `s_m` is the coefficient at `∅` of Tau Ceti's `CliffordAlgebra.basis` (`:849–851`; `Suggested.lean:140–141`), imported from `TauCeti.LinearAlgebra.CliffordAlgebra.Dimension` (`Suggested.lean:8`), which the sentence's "only" excludes. (With R05 applied, "Subfactors 3.2's Markov uniqueness" is also Tau Ceti's `IsMarkovTrace.unique`.)

Witness: `Suggested.lean:140–141`, `cliffordScalarCoefficient` is `(CliffordAlgebra.basis (cliffordForm m) (Pi.basisFun ℂ (Fin m))).repr a ∅`.

Repair: "use only Mathlib's `CliffordAlgebra`, Tau Ceti's `CliffordAlgebra.basis`, `TemperleyLieb` and `IsMarkovTrace.unique`".

## Previous findings

- R01 — not repaired: `README.md:834–836` still reads "use only Mathlib's `CliffordAlgebra`, Tau Ceti's `TemperleyLieb` and Subfactors 3.2's Markov uniqueness"; raised again as R06.

## Verified sound

**Scope and counts.** `git diff --stat b0e66ea HEAD -- TauCetiRoadmap/TemperleyLiebOperatorAlgebras`: `README.md` only, 32 insertions, 4 deletions. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TemperleyLiebOperatorAlgebras'` is empty (merge base `eaf17b10` = `origin/main`; the files listed under "changed outside the folder" in the change set are the merge of main itself). `Suggested.lean` is unchanged since `556e24c`; the worker's 26 elaborated signatures stand. Pins at this head: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (`lake-manifest.json`), moved by the merge from `6b7abb3c` / `a91d3aa`. 13 adversarial rows with values for the changed statements; 6 supplier sections resolved; 7 roadmaps citing this one read; 12 pinned declarations opened; 1 header probe elaborated.

**Gate, build, dependency check.** Worker's gate at `be26d68`: every text counter `0` (`set_option`, `latex`, `prnum`, `residue`, `round-labels`, `statement-hygiene`, `stray-files`, `outside-folder`, `depcheck`, `readme-ids-missing`), `build=2 FAIL` on the Lake module-system warning (R01). `lake env lean TauCetiRoadmap/TemperleyLiebOperatorAlgebras/Suggested.lean` from the worktree at the new pins: five `sorry` warnings (lines 107, 151, 288, 314, 333: `pottsPartition_eq_fkPartition`, `exists_evenCliffordModel`, `exists_cubicFixedModel`, `finite_gaussianBraid_closure`, `markovTrace_neg_one_pow_nonneg_iff`), nothing else, exit 0 in 9 s; every carrier the file uses (`TauCeti.TemperleyLieb`, `markovTrace`, `twistedMonoidAlgebra`, `IsFactorSet`, `CliffordAlgebra.basis`, `Matrix.extendLast`, `BraidGroup`, `TemperleyLieb.jones`) therefore exists at `2fd255d9`. Dependency check rerun as prescribed:

```text
depcheck: 239 roadmaps, 2350 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. QuantumGroups is on main (not in the merge order), so the consumer sentences at `README.md:131–132` and `:1747` are claims about a consumer, not supplier edges, and the check is unaffected.

**Headline theorems at the new pins.** The five end theorems listed at `README.md:25–37` that were statable remain stated; the pin move makes none of the others statable: the unitary category still needs the diagram category of TemperleyLieb Layers 2–3 and CategoricalOperatorAlgebras CA1a/CA2a (no `TLDiagCat`, `TLAlg`, `presentedTLEquiv`, `condExp` or `negligibleIdeal` at `2fd255d9`: grep of `TauCeti/Algebra/TemperleyLieb/` returns none), the affine results need an affine carrier (none: grep for `affineTemperleyLieb`, `AnnularTemperleyLieb` empty), the Bratteli presentation needs `B_δ` and Bratteli diagrams (grep for `Bratteli` hits only `Analysis/CStarAlgebra/…` dynamics files, no diagram carrier). What the move adds (`jonesWenzl`, `qInt`, Markov uniqueness) changes the supplier contract, not the headline list (R05). No declaration changed, so the padding probe of the earlier rounds stands.

**Adversarial table, the changed statements.** Rows for every statement the diff leaves untouched (1.1–1.8, 2.1–2.2, 3.1–3.4, 4.1–4.7 and the five headlines) are carried forward from the previous report (`PRREVIEW-TemperleyLiebOperatorAlgebras~11`, itself carrying r9–r10). Computations below are exact in `ℚ` on `TL_2` with basis `{1, e}`, `e² = δe`, `T_2(1) = δ²`, `T_2(e) = δ`.

| Statement | Instances tried | Values on both sides | Result | Change |
|---|---|---|---|---|
| Consumer contract: `s` "carries the generator `−d·p_i` to `d·p_i`" (`:1749`) | `n = 2`, `d = 2` | `s(p^d) = −e/2 = p^(−d)`; `s⁻¹(e^(−d)) = −e^(d) = −2·p^(d)`, whereas `d·p^(d) = +e^(d)` | fails: the map `−d·p_i ↦ d·p_i` is `e_i ↦ e_i`, refuted by 2.1's own Check (`:1179`) | R03 |
| "with equal normalised traces" (`:1750`) | `n = 2`, `d = 2`, `x ∈ {1, e, 1 + (3/7)e}` | `τ^d(x) = 1, 1/2, 17/14`; `τ^(−d)(s x) = T^(−d)(s x)/(−d)² = 4/4, 2/4, (34/7)/4` = same | holds | none |
| "`Q_n^(−d) ≅ Q_n^d`" at `d = d(u) ≥ 2` (`:1751`) | `d = 2`, `d = 5/2` | 2.1 (`:1163–1165`) gives `Q_n^δ ≅ Q_n^(−δ)` for `δ < 0` with `|δ|` admissible; `[2, ∞)` is admissible, so `2`, `5/2` qualify | holds | none |
| "`d = d(u) ≥ 2`" (`:1748`) | QuantumGroups main Q7 (`README.md:535–537`) | `|q| + |q|⁻¹ = d(u)` with `0 < |q| ≤ 1` forces `d(u) ≥ 2`; `n ≥ 2` | holds | none |
| "the simple objects `X_r` with the untruncated fusion rule (3.4)" at `d ≥ 2` | `δ = 2`: `X_1 ⊗ X_1` | 3.4 (`:1355–1357`): untruncated for `δ ≥ 2`; dimensions `[2]² = 4 = [1] + [3] = 1 + 3` | holds; at `δ = √2` the truncated rule would apply, excluded by `d ≥ 2` | none |
| "the balanced cup–cap solution with `dim 1 = d` (3.3)" | `δ = 2` | 3.3 (`:1318–1320`): `‖cup‖² = ‖cap‖² = δ = dim 1`; cap ≫ cup `= e`, cup ≫ cap `= δ·𝟙 0 = 2` | holds | none |
| "the Hom norms (3.2)" | `End(2)`, `δ = 2` | 3.2 (`:1297`): `‖e‖ = δ = 2`, since `e/δ` is a projection and `e† e = δe` | holds | none |
| "consumes 1.2–1.3 for the faithful Hermitian trace form on `Q_n`" (`:1748`) | the objects named | `H_n`, `R_n`, faithful trace on `Q_n`: scope `:85–96` assigns them to Subfactors 3.2–3.3; 1.2 defines `⟨u, v⟩_H` on `CellModule`, 1.3 identifies `R_n` with `negligibleIdeal (n, n)` | attribution wrong | R04 |
| Former-label table rows A1–A7 (`:360–366`) | each target | this README has `### 1.1`, `1.2`, `1.3`, `1.4`, `2.1`, `2.2`, `3.1–3.4`, Layer 4 (`:370–1416`); Subfactors on main has `### 3.1 The analytic adjoint` (`:676`), `### 3.2 Markov uniqueness, Jones–Wenzl projections and Jones's positivity theorem` (`:697`, `δ > 0` at `:729`), `### 3.3 Positive path models, Jones quotients and their C*-tower` (`:774`) | holds | none |
| "QuantumGroups consumes Layers 1–3" (`:131`) = main's "A1–A6" (`QuantumGroups/README.md:43`) | the table | A1–A3 → 1.1–1.4, A4–A5 → Subfactors + 2.1–2.2, A6 → Layer 3: Layers 1–3, Layer 4 (A7) not consumed | holds | none |
| Who cites the former labels | `roadmaps grep` | QuantumGroups main `:43` (A1–A6), CategoricalOperatorAlgebras #888 `:158`, `:307`, `:1624` (A6), TemperleyLieb main `:575` (§A1): all covered by the table | holds | none |
| Downstream consumers complete (`:1745–1754`) | `roadmaps grep TemperleyLiebOperatorAlgebras` | only QuantumGroups (main) cites this roadmap as a supplier; CStarAlgebras #860, CStarClassification #863, CategoricalOperatorAlgebras #888, GeometricTopology #903, Subfactors, TypeAHeckeAlgebras name it as their consumer | holds | none |
| "single home … do not restate them" (`:71–75`) against the open roadmaps | #1649 `:280–322`, #1705 `:244–286` | both restate the trace-radical identification, the `e_i ↦ −e_i` comparison and the unitary category with fusion; neither cites this roadmap | two owners | R02 |
| Pin claims after the merge (`Suggested.lean:53–56`, `README.md:243–260`) | `2fd255d9` vs `a91d3aa` | `jonesWenzl`, `existsUnique_jonesWenzl`, `apply_jonesWenzl`, `qInt`, `exists_qInt_eq_zero_iff`, `IsMarkovTrace.unique`: present at `2fd255d9`, absent at `a91d3aa` | stale | R05 |

**Suppliers and citations resolved.** Subfactors on main: §§3.1–3.3 as above. QuantumGroups on main: `README.md:43` (supplier row A1–A6) and Q7 `:510–592` (the `O_F^+` comparison: signed loop `δ = −(q + q⁻¹) = sign(c)·d(u)`, positive parameter `d(u)`, "the signed generator is `δ p_i` and the positive generator is `d(u) p_i`", consistent with R03's corrected wording). QuantumGroups #1649 (`968db79`) and #1705 (`a938955c`) as in R02. TemperleyLieb on main `:242`, `:682–708` (Jones–Wenzl material already described there as native). GeometricTopology, CategoricalOperatorAlgebras, CStarClassification citations are untouched by the diff and were resolved in the previous rounds.

**Style of the changed lines.** No LaTeX, no pull-request numbers, no process words, no anchors, no absolute paths; every symbol in the changed sentences is in a code span; the gate's text scanners agree (`latex=0 prnum=0 round-labels=0 residue=0 private-paths=0`). The former-label table is a two-column Markdown table, consistent with the README's other tables.

## Not verifiable

- Graham–Lehrer 1998, Temperley–Lieb 1971, Baxter–Kelland–Wu 1976: uncertified or paywalled, settled in earlier rounds and cited by locator; none is touched by this change.
- Ownership against open pull requests whose files the brief does not give (Subfactors #874, if still open, and any roadmap not in the brief's list): not checked beyond `roadmaps grep`, which found no further citer or owner.

## Source issues

- none (the two misprints recorded in r9, Morin-Duchesne–Saint-Aubin (29) and Jones p. 104, are untouched by this change and already in the register).
