# GATE-GlobalHolomorphicFunctions~1: answers to human review

Three reviews by CBirkbeck (heads `30a7252`, `f37db7e`, `ffb25b5`), answered at commit `debfd342`
on top of `ffb25b5`. Points are numbered in the order they appear. Where a later review repeats an
earlier point, the repeat has its own number and is cross-referenced.

## H01 (CBirkbeck) — applied

The GH1 quotient statement now has the codiscrete convention. `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md`
line 590 reads `∀ᶠ z in codiscreteWithin Ω, g z ≠ 0 ∧ F z = f z / g z`, says that values at exceptional points are not constrained, and keeps the condition that the denominator is nonzero on each component. The reviewer's own review of `f37db7e` confirmed the fix, and `exists_holomorphic_quotient` in `Suggested.lean` was already stated this way.

## H02 (CBirkbeck) — applied

The README now says who owns which part of the primary-factor work. GH owns the general `E_p` and its API, the `E₁` specialisation, the weighted-support and native-divisor genus-one products, and the equal-divisor factorisation (README lines 247–298; `exists_entire_genusOne_product`, `exists_entire_genusOne_product_of_divisor`, `exists_entire_exp_mul_of_divisor_eq`). ZerosOfLFunctions keeps `OrderLE`, the growth and summability estimates, the Hadamard degree bound and the L-function applications. This round also fixes a citation in the same paragraph (line 288): the link to the open pull request is replaced by the plain citation "ZerosOfLFunctions, Layer 5, a later roadmap", because cross-roadmap citations name the roadmap and section, never a pull-request number. ZerosOfLFunctions is not on main and not in the merge order, so it appears only as a consumer and GH takes no dependency on it.

## H03 (CBirkbeck) — applied

The compact-summability product target is now an adapter over the native theorem. README lines 235–245 consume `Summable.hasProdUniformlyOn_one_add` (pinned Mathlib, `Mathlib/Analysis/Normed/Module/MultipliableUniformlyOn.lean` line 86) on each compact set, with the majorant `sup_K |u_j|` and its cofinite eventual-bound hypothesis. The new work that remains is the germ-order and unit-tail bookkeeping and the separate uniform-absolute-tail criterion. The reviewer confirmed this at `f37db7e`.

## H04 (CBirkbeck) — applied

This is H02 repeated in the review of `f37db7e`. The handoff it asks for, through the index `Σ ρ : S, Fin (m ρ)` with constant `p = 1` and the translation to the native divisor, is in README lines 268–284 and in the signature of `exists_entire_genusOne_product`. The review of `ffb25b5` (H06) accepts that the GH side is done.

## H05 (CBirkbeck) — applied differently

The bound `A_s ≤ exp(Σ ‖u_i‖)` is exactly the pinned `Real.prod_one_add_le_exp_sum` (Mathlib `Mathlib/Analysis/Complex/Exponential.lean` line 682) applied to `t_i = ‖u_i‖ ≥ 0`. README line 334 changes from "Derive the second bound by multiplying `1+t≤exp t`" to "The second bound is not a new target: it is the pinned `Real.prod_one_add_le_exp_sum` … applied to the nonnegative family `t_i=‖u_i‖`". The README also now writes out the combined bound `‖P_s−1‖≤exp(Σ‖u_i‖)−1`. The `sorry`'d `majorant_exp` in the companion file `ProductCotangentTargets.lean` was not touched, because this job may edit only `README.md` and `Suggested.lean`. As a follow-up, it should become a one-line proof using that lemma, or be deleted.

## H06 (CBirkbeck) — answered

The supplier side is complete in this roadmap (H02, H04). What is left is the consumer-side update to ZerosOfLFunctions' export list and Layer 5, which belongs to that roadmap and cannot be made from this folder. Nothing in GH blocks that update: GH has no dependency on ZerosOfLFunctions, and the handoff paragraph (README lines 288–298) names exactly the interfaces ZerosOfLFunctions should consume.

## H07 (CBirkbeck) — applied differently

The overlap is real. Hyperfunctions on main (HF2.AnalyticPreparation, its README lines 197–218) claims the filled-compact exhaustion for open sets in ℝ^(2n), and GH0 states the planar case. But the repair the reviewer suggests cannot be used at the pins:

- Hyperfunctions consumes GH0 (its README lines 29–30), so GH importing HF2 would create a cycle.
- `TauCeti.IsFilledIn` and the exhaustion theorem from the Tau Ceti pull request do not exist at the pinned Tau Ceti `a91d3aaf`. Only `TauCeti/Topology/FilledHull.lean` with `filledHull` is there.

So ownership moves to the earlier roadmap, GH. README line 390 changes from the planar "Provide a compact exhaustion of every open plane set … and fill relatively compact complementary components" to a generic statement. For any finite-dimensional real normed space `E` and open `Ω`, take `K_n` to be the points of norm at most n whose extended distance to `Ωᶜ` is at least `1/n`. The README now gives the proof that no filling step is needed: a segment argument for points near `Ωᶜ`, and the ray `t ↦ (1+t)x` for points of norm greater than n. It also states the `Ω = E` convention (the extended distance to an empty complement is infinite, whereas the real-valued distance would be 0), identifies the planar condition with `IsRungeCompactPair`, and records that HF2's exhaustion is the instance `E = ℂ^d`. The dependencies paragraph (line 1229) records the same supply. The matching change in Hyperfunctions, to consume GH0's generic exhaustion instead of owning it, has to be made in that roadmap.

## H08 (CBirkbeck) — disputed

The Cauchy-kernel and Pompeiu cores cited by the reviewer are on a newer Tau Ceti main and cannot be consumed here. At the pinned Tau Ceti `a91d3aaf` (from `lake-manifest.json`), the directory `TauCeti/Analysis/Complex/` contains no `CauchyKernel.lean` and no `Pompeiu.lean`, and no pinned file mentions `Pompeiu`. The reviewer notes the same in their caveat. The roadmap states its targets against the pins, so `cauchyGreen_kernel_integrable`, `cauchyGreen_barDerivative_reconstruct` and the related targets stay as GH targets. When the pin advances past those files, they become deletions that cite the library declarations.

## H09 (CBirkbeck) — disputed

The ConformalMapping text cited by the reviewer is in a pull request that revises an existing roadmap, and such a pull request is never a dependency. The roadmap is cited as it stands on main. On main, ConformalMapping L5 (its README lines 124–135) gives Jordan separation and filled-hull topology but no winding-number or unit-index conclusion, so README line 989 ("L5 alone does not state that winding conclusion") is accurate. The reviewer agrees it is accurate for main. ConformalMappingPartII, the one ConformalMapping-family roadmap in the merge order, has no Jordan winding theorem (searched for "winding", "index" and "Jordan"), and no pinned Tau Ceti theorem gives a general Jordan winding number (the only winding results there are about the modular fundamental-domain boundary). No change.

## Other changes this round

These fixes were needed for the gate to pass and do not change any statement:

- The ten LaTeX `\[ … \]` displays in GH4 (sine, cosine, cotangent, shifted sine, theta, sinh, the lattice `E₂` product, ratio products, and Cauchy–Pompeiu) are rewritten as inline Unicode code spans with the same content.
- TeX macros are replaced: `\bar z` becomes `z̄`, `\overline D` becomes `closure(D)`, `\widehat{L_n}_Ω` becomes the hull in words, and `Σ_{k=1}^{N_a}` becomes `Σ_(k=1..N_a)`.
- The 17 HTML `<a id>` anchors are removed, and the two internal links that used them are now plain section references.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Generic exhaustion `K_n={‖x‖≤n, infEDist(x,Ωᶜ)≥1/n}` | `E={0}`, `Ω={0}` | `Ωᶜ=∅`, extended distance infinite, so `K_n={0}`; `Ω∖K_n=∅` | holds | none |
| same | `Ω=∅` | every x has distance 0 < 1/n, so `K_n=∅`; union `∅=Ω` | holds (empty stages allowed) | "empty early stages are allowed" added |
| same | `Ω=ℂ` | `K_n` = closed disk of radius n; `ℂ∖K_n` connected and unbounded | holds | the real-valued `infDist x ∅ = 0` would give `K_n=∅` for all n; extended distance required in the text |
| same | annulus `1<|z|<3`, n=2 | `K_2={1.5≤|z|≤2}`; components `{1<|z|<1.5}` (closure meets `|z|=1`) and `{2<|z|<3}` (closure meets `|z|=3`) | no relatively compact component | none |
| same | `Ω=ℝ∖{0}` (dim 1), n=2 | `K_2=[−2,−1/2]∪[1/2,2]`; components `(−1/2,0)`, `(0,1/2)` (closures contain 0∉Ω), `(2,∞)`, `(−∞,−2)` unbounded | holds in dimension 1 | none |
| segment step | x with `‖x−y‖<1/n`, `y∈Ωᶜ` | every z on `[x, first exit)` has `‖z−y‖≤‖x−y‖<1/n`, so z∉K_n | x's component has a point of `Ωᶜ` in its closure | none |
| ray step | `‖x‖>n` | `‖(1+t)x‖=(1+t)‖x‖>n` for t≥0, so the ray avoids K_n | component unbounded or closure meets `Ωᶜ` | none |
| nesting | general | `K_n ⊆ {‖x‖<n+1, infEDist>1/(n+1)}`, which is open and inside `K_{n+1}` | `K_n⊆int K_{n+1}` | none |
| `A_s ≤ exp Σ‖u_i‖` via `Real.prod_one_add_le_exp_sum` | `s=∅` | `1 ≤ exp 0 = 1` | holds | none |
| same | `s={i}`, `u_i=−1` | `A=2 ≤ e≈2.718`; `‖P−1‖=1 ≤ e−1≈1.718` | holds with a zero factor | none |
| combined bound `‖P_s−1‖≤exp(Σ‖u_i‖)−1` | `u=(1,1)` | `P−1=3`, bound `e²−1≈6.39` | holds | none |
| de-LaTeX `π cot(πz)` display | z=1/2 | `π cot(π/2)=0`; `2 + Σ_(n≥1) 1/(1/4−n²) = 2 − 2 = 0` (telescoping `Σ 1/(n²−1/4) = 2`) | the rewritten formula is the same identity | none |
| shifted sine display | z=0 | both sides `sin(πα)` | holds | none |
| Cauchy–Pompeiu display | f≡1 on the unit disk, ξ=0 | `(2πi)⁻¹·2πi − 0 = 1` | holds | none |

The pass also confirmed that `IsRungeCompactPair` (`Suggested.lean` line 31) is exactly the planar specialisation of the generic condition: its fields are `IsOpen Ω`, `IsCompact K`, `K ⊆ Ω` and the closure-compact-in-Ω component clause. That name now appears in the README.

## Citations, ownership and signatures

- **Citations checked.** `Real.prod_one_add_le_exp_sum` (Mathlib pin, `Exponential.lean:682`), `Summable.hasProdUniformlyOn_one_add` (`MultipliableUniformlyOn.lean:86`) and `Finset.norm_prod_one_add_sub_one_le` (`Log/Summable.lean:142`) all exist at the pin. Tau Ceti `IsFilledIn`, `CauchyKernel.lean` and `Pompeiu.lean` are absent at pin `a91d3aaf`. Hyperfunctions HF2 and ConformalMapping L5 were checked on content main `d2e0f0d3`. ConformalMappingPartII was checked at its open head.
- **Ownership.** The generic exhaustion moves into GH (H07). This is a move down to the earlier roadmap: Hyperfunctions, on main, consumes GH0.
- **Signatures.** The only change to `Suggested.lean` is in a proof body, not a statement: at line 377 (`HolomorphicMapSpace.tendsto_iff_tendstoLocallyUniformly`), `letI :=` becomes `let :=`, which clears the `haveILetI` style-linter warning. So the elaborated signatures are still as at `ffb25b5`. No `#check` scratch comparison was rerun: this brief allows only the build and gate commands, and the pre-computed signatures file failed to elaborate (unknown module prefix `TauCeti`).
- **Sources.** No source was fetched. `sources.toml` is not part of this job, and no text is requested.

## Build and gate

- `lake build TauCetiRoadmap.GlobalHolomorphicFunctions.Suggested`, rerun after the line-377 `letI` → `let` repair: `Build completed successfully (9013 jobs).` The only warnings are the expected `declaration uses 'sorry'` lines. The linter warning at line 377 is gone.
- Gate, at `bcaf6131` (repair commit on top of `debfd342`): `gate GlobalHolomorphicFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`. At `ffb25b5` the gate failed with latex=10, tex=39 and residue=17.
- Depcheck (`--movable`): `depcheck: 148 roadmaps, 1002 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

No suspicious instructions were found in the review text.
