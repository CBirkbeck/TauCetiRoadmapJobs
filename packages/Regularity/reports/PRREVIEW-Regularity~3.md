# Review of Regularity (pull request #2631 at 42247a3)

**Verdict:** accepted

**Summary.** Accepted, with one small correction and no format notes. The previous finding is repaired: the first Check of §8.2 now assumes `t₀ ≥ 1` for its first claim and a nonempty top palette for `B ≥ t₀`, and both claims recompute. The new route step of §8.2 is sound and matches Rödl–Schacht's Lemma 25 at `k = 2`. In that step, a single color fixed by the reversal makes every cell pair regular, and the polyads it changes carry `O(1/t + ε′)` of the triples. The rewritten Scope notes agree with the Tau Ceti lemmas at the pin, except that one sentence describes a library error term as a sum over transversal placements when it sums over all placements (C01). The two questions of the previous review are answered at this head. One licence fact remains for the human reviewers.

## C01 — The second term of `exceptional_route_prediction_mass_le` sums over all placements, not only the transversal ones

In the paragraph after the Scope table (line 574), the README says that the lemma's "second term is the lower-route counting error summed over all routes of all transversal placements". A reader who takes this as the lemma's content underestimates the term. Tau Ceti `Hypergraph/Triadic/ExceptionalPrediction.lean`, line 182, states the second term as `m^(k choose 2) · (k choose 2) · ε · |V|^k`. This is the per-route bound `(k choose 2) · ε` times the cell-size product, summed over every route of every placement, since the cell-size products of all placements add up to `|V|^k`. The proof restricts to transversal placements only on the left-hand side. Take `k = 3`, three cells of size `s` and one pair color: the six transversal placements give `18εs³`, while the term is `81εs³`. A repair: "whose second term, `m^(k choose 2) · (k choose 2) · ε · |V|^k`, bounds the lower-route counting error summed over all routes of all transversal placements".

## Previous findings

- R01 — repaired: "Suppose `t₀ ≥ 1`. Then no version without a large-host hypothesis holds, since the empty host already fails, and when `κ₃` is nonempty every admissible bound satisfies `B ≥ t₀`." (§8.2, Checks, line 315)
- C01 (small correction) — repaired: "§0.1 uses no other layer: it needs the uniform hypergraphs of Convention 3 and, for the comparison at `r = 2`, the graph densities of DenseGraphLimits." (line 52)
- C02 (small correction) — repaired: Downstream consumers lists CoboundaryExpansion only. The DenseGraphLimits content is under "Owned elsewhere" (line 583) and matches DenseGraphLimits Layer 9a.
- C03 (small correction) — repaired: the last column of the Scope table now states the library's forms ("the bound is `4^⌈1/ε²⌉`", "the estimate's error is `(15τ + 3√ε)|V|³ + 6m|V|²`…"). The comparison with the earlier wording is gone.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / library or source) | Result | Change |
|---|---|---|---|---|
| §8.2 Check 1 (changed) | `t₀ = 1`, `V = ∅`; `κ₃ = Fin 1`, `t₀ = 10`, `B = 9`; `κ₃` empty, `t₀ = 10` | ∅ has 0 cells < 1, so there is no `(H′, C)`; `\|V\| = 9` gives ≤ 9 cells < 10, so `B ≥ 10`; empty palette makes `B = 3` vacuous, and the Check excludes this case | holds | none |
| §8.2 route: one reversal-fixed color (new) | distinct `A, B`; `(A, A)` with `\|A\| = 3`, `f = 1/2`; `\|A\| = 2`, `f = 1/2` | density 1 on every nonempty rectangle; test sets ≥ 2, density 1 = 1; `({v},{v})` density 0 against 1, irregular since 2 ≤ 1/f | holds, agrees with §8.1 Check | none |
| §8.2 route: mass of the changed polyads | 10 equal cells of 10 vertices; ε′-fraction of irregular cell pairs | triples meeting a cell twice: 250200 of 970200 = 0.258 ≤ 3/t = 0.3; irregular pairs ≤ 3ε′ of the triples | small once t is large and ε′ is small | none |
| §8.2 route vs Lemma 25 at k = 2 | RodlSchacht2007Reg lines 473–489, 1424–1426 | pair partition changed on ≤ νn² pairs per class, each class perfectly regular on pairs of distinct vertex classes; used to prove RL(k+1) | supported | none |
| Scope: placed counting at rank one | `PlacedCounting.lean` l. 490; `InducedCounting.lean` l. 77 | transversal φ, `IsPairColorRegular ε`, route `(η, 1)`: error `(C(k,2)ε + C(k,3)η)∏\|A_i\|`; every `r ≥ 1` via `of_rank_le` | holds | none |
| Scope: lower-route counting | `SparseCounting.lean` l. 135 | `C(k,2) · ε · ∏\|A_i\|` at transversal φ, no density hypothesis | holds | none |
| Scope: `exceptional_route_prediction_mass_le` | `ExceptionalPrediction.lean` l. 182; k = 3, three cells of size s, m = 1 | sum over transversal placements 18εs³; library term 81εs³ | imprecise | C01 |
| Scope table, new entries | `FriezeKannan.lean` l. 187; `StrongRegularity.lean` l. 222; `Subpolyad.lean` l. 196; `Stability.lean` l. 169; `Triadic/Basic.lean` l. 434 | `4^⌈1/ε²⌉`; `(15τ+3√ε)\|V\|³+6m\|V\|²` with τ > 0; sets need not lie in cells; factor `k.choose 3` in both | holds | none |
| Guide to the build, §0.1 | §0.1 *Needs:* and Layer 0 Dependencies | uniform hypergraphs, `homDensityFin`, `injHomDensity`; "no other layer" | holds | none |
| DenseGraphLimits item, Owned elsewhere | `Completed/DenseGraphLimits/README.md` line 420, on main and at its open revision | the graph-regularity roadmap owns the adapters to `homDensityFin`/`injHomDensity`; neither roadmap depends on them | holds | none |
| References, numbering | NagleRodlSchacht2006 lines 224, 251, 299; RodlSchacht2007Count lines 120, 158, 189, 239 | Def 9, Thm 12, Cor 15 and Thms 10, 13 numbered consecutively; companion cites 2.13 and 2.16 | supported | none |
| §8.2 headline (Lean, cited by the Check) | elaborated type against README | ε > 0, F > 0, R ≥ 1, t₀; ∃ B before V; `B ≤ \|V\|`; cells ≥ t₀ ∧ five conditions at `B` | matches | none |
| §9.4 composition (cited by the Scope note) | the Lean proof | uses `hR C.complexity` as the rank `r ≥ 1` of the library lemma; elaborates without `sorry` | matches "every R ≥ 1" | none |

The rows for statements this change does not touch stand as in the previous review, of `4d44900`.

- Source locators checked against the text: 10 (RodlSchacht2007Reg lines 254, 263–274, 473–489, 1424–1426; RodlSchacht2007Count lines 120, 158, 189, 239; NagleRodlSchacht2006 lines 224, 251, 299). All three texts are the authors' versions on Schacht's web page.
- Library declarations opened at Tau Ceti 2fd255d: 13. These are the six Scope-table and Scope-paragraph lemmas above, plus `TriadicComplex3.VertexCellsControlled` (`Triadic/Basic.lean` l. 260), `pairColorDensity` (`PairColor/Density.lean` l. 36), `PairColorSystem.IsRegularPair`, `PairSkeleton3.IsPairColorRegular` and `LowerSkeletonRegular` (`PairColor/Regular.lean` ll. 77, 245, 292), `StrongRegular.inducedGraphCount3_estimate` and `frieze_kannan`.
- Cross-roadmap citations resolved: DenseGraphLimits Layer 9a (main and its open revision), Exchangeability Layer 8 and CoboundaryExpansion (main). The change drops no heading or id.
- Automatic checks: all passed when rerun (every scanner count 0). Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. The pull request changes nothing outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning on line 69. The file is unchanged since `4d44900`, and its three elaborated types match the README statements, with no lost binder.
- Both questions of the previous review are answered at this head: the numbering sentence under References, and the route of §8.2 for irregular and diagonal cell pairs.
- The pull request's description agrees with this head: the nine Checks, the §8.2 Checks, the route, Downstream consumers, the numbering note, and seven Tau Ceti imports.

Overlap check: read DenseGraphLimits (main and its open revision), EquitableOperatorReduction (open), Exchangeability and CoboundaryExpansion (main). The one shared object is the homomorphism and injective densities of finite graphs. DenseGraphLimits owns it, and §0.1 cites it. EquitableOperatorReduction excludes graph regularity. Nothing else is shared.

Source independence: changed passages only. 5 passages were compared with 3 sources and the pinned library's docstrings: the new route step of §8.2, §8.2 Check 1, the numbering note under References, the DenseGraphLimits item and the paragraph after the Scope table. None shares wording beyond standard phrases, at most 5 consecutive words ("no lower bound on the", Tau Ceti `SparseCounting.lean` line 133). The largest share is RodlSchacht2007Reg, 15 of 34 locator mentions. The arrangement was not compared again, since the change adds, removes and reorders no layer; the previous result, independent, stands.

Research link: Layer 8 is the arity-3 case of the Rödl–Schacht regular approximation lemma (2007, Theorem 14 with Lemma 25), a core tool of the hypergraph regularity method. Layer 9 is the induced counting lemma used with it (Rödl–Schacht 2007; Nagle–Rödl–Schacht 2006), the input to hypergraph removal. Rests on README §8.2 and §9.4 and on RodlSchacht2007Reg §1.

## Not verifiable

- The printed numbering of the three Rödl–Schacht and Nagle–Rödl–Schacht papers: the Cambridge Core and Wiley pages are paywalled. The README now cites the authors' versions explicitly, and those were read.
- The Provenance table's descriptions of declarations in the external `regularity-lemmata` library: its files were not opened (the section is unchanged).

## Source issues

- none

## For the human reviewers

- The Provenance section (README lines 484–531) cites the public Lean library `cameronfreer/regularity-lemmata` at a pinned commit, and the library `cameronfreer/graphon`. The GitHub page of the former states Apache-2.0, and none of the three `Suggested.lean` names appears on its top-level page. Its files were not searched.
