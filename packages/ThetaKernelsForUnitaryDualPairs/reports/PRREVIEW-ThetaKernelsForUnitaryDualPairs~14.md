# Review of ThetaKernelsForUnitaryDualPairs (pull request #3027 at 2899581)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaKernelsForUnitaryDualPairs/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 230 changed lines since `b8f3652`. I checked the repairs of the previous review against the sources (3.3b now takes both clauses of *Orthogonal sums* from MetaplecticAutomorphicForms §3.3d; 6.4a credits Kudla–Rallis 1988; the labels of 3.46a and 3.47b), the other new *Origin*, *Method* and *Corollary of:* labels against the supplier sections at this head, the seeded sample where it falls in changed text, and the record of the README on `main`, which loses nothing. No finding remains, so the folder is accepted. There is one small correction (three older sentences that the new labels contradict) and one question for the author about Kudla–Sweet (1997) at split places; nothing in the mathematics is left for a human to decide.

## C01 — Three older sentences in 3.47b, 3.47c and 5.7b still contradict the *Origin* labels this change adds

A reader who meets both cannot tell whether a clause is published, adapted or new, and the Conventions (lines 21–23) say that *Status* and *Origin* record the same thing.

- 5.7b, line 1408: "No publication is cited for (i)–(iv)". The *Origin* of 5.7b (line 1333) and the References cite Kudla–Rallis (1994) and Ichino (2004) for (i), (ii) and (iv).
- 3.47c, line 1040: "No publication is cited for these lemmas". The *Origin* of 3.47c cites Tate (1950) and Godement–Jacquet (1972).
- 3.47b, *Status*, line 878: (iii) and (v) are called "this roadmap's own". The *Origin* (line 832) credits Li (1990) and Paul–Trapa (2002) with the identification with `A_𝔮(λ)`, which is (v).

Rewriting each sentence to agree with its label is enough, for example "the sources named in *Origin* prove related statements; the route above proves these", and in 3.47b dropping (v) from the list of clauses that are the roadmap's own.

## Questions for the author

- 3.47, *Status* (lines 696–699): is the identification of `Θ`, `Θ′` with `α_w ∘ det_a × β_w ∘ det_{a′}` in Kudla–Sweet (1997) at a place where `E = F × F`? Harris–Kudla–Sweet (1996), which summarises that paper, works with a quadratic field extension (HKS96 line 33) and describes its results as the structure of the Siegel degenerate principal series `I_n(s, χ)` of `U(n, n)` (HKS96 lines 287–290), not an induction from the `(a, a′)` parabolic subgroup of `GL_N(F)`. I could not read Kudla–Sweet itself (no legal copy is recorded). If it treats only fields, the split-place statement for `N` even would rest on Mínguez08 or on the route, as it does for `N` odd.

## Previous findings

- R01 — repaired. The *Origin* of 3.3b now reads "MetaplecticAutomorphicForms §3.3d states (a) and (b). The left-action form with its dictionary to matrices acting on columns is this roadmap's own formulation", and the *Corollary of:* line, the *Method* label, the route (line 60), the supplier contract and the References agree with it.
- C01 — repaired. The *Origin* of 6.4a credits "Kudla and Rallis (1988), … Theorem, p. 66, that range for orthogonal `V` of even dimension", and keeps "own formulation" for odd orthogonal dimension, other extensions and other archimedean data.
- C02 — repaired. The *Method* label of 3.46a now attributes to Ichino (2020), §7.4, Lemma 7.7, only Flensted-Jensen's function and the proof of Li's Theorem 4.1, and to Li (1990) the identification with `A_𝔮(λ)`.
- C03 — not repaired: the three sentences stand (C01 above).
- C04 — repaired in the two places I could read: the description now gives §AL.1.2.1 to 5.7c and §AL.1.2.3 to 6.12 separately, and lists 3.3b, 3.9a, 3.45, 3.46, 5.6a and 6.11 as sections that keep their general statements. The copy of the description I was given is cut short before its list of corrected statements, so the third point was not rechecked.
- N01 — repaired. The second paragraph of 3.47b is now headed *The form of the formal proof* and names the declarations.
- Second question of the previous review (which declaration states lemma (o)) — answered by the head; the three declarations it names were opened (table below).

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 3.3b (a), (b), ownership | `V` not split | 3.3b: corollary of §3.3d for (a) and (b) / MAF §3.3d (README lines 673–689): (a) for every `V` via `V ⊕ V⁻` | one owner |
| 3.3b *Origin*, HKS locators | Appendix | (a.22)–(a.24) at HKS96 lines 2654–2666, printed p. 997; Corollary A.3 at lines 2669–2681, p. 998, for any skew-Hermitian `W = W₁ + W₂` | match |
| 3.9a *Corollary of:* | `E = F × F`, `dim W_r ≥ n` | MAF §3.9a (i), (ii), (iii) first sentence, same hypotheses / 3.9a adds only `∫ = c‖v‖²`, `c ≥ vol(H₀)‖φ‖²` | holds |
| 3.9a locators | Kudla96 III.4 | Prop. 4.1 line 1755 (p. 45), 4.3 line 1923 (p. 48), 4.5 line 1961 (p. 49) | match |
| 3.21a published case | `d = n`; `d = n + 2` | MAF §3.22a: `n`, `d` even, `W` split, trivial characters; parameter has `n + (d − n) = d` entries; `d = n`: none added | holds |
| 3.46a *Method* | Ichino20 §7.4, §1 | Lemma 7.7 line 1547; function `Tr(P_μ π(g) P_μ)/dim μ` and Li's Thm 4.1 at lines 1661–1666; `θ(π) = A_𝔮(λ)` for regular character, lines 32–34 | match |
| 3.47 *Status*, `N` even | split place | README: published by Kudla–Sweet / HKS96 lines 33, 287–290: field extension, Siegel series of `U(n, n)` | question |
| 3.47b form of (o) | formal proof at 40e56bab | `cas_bound`: `(Ω − c₀)x ∈ range ι → x ∈ range ι`, hypothesis no eigenvalue `≤ c₀ + d` on `X_i ι(v)` / (o) first assertion | match |
| 3.47b form of (o), quotients | same | `local_of`: a submodule `R` containing every proper invariant submodule; `common_quot`: surjections onto a nontrivial module with no proper invariant submodule, for `Mat r s` | match |
| 4.4a Check `V = 0` | `x/x̄ = y/ȳ` | then `x/y ∈ F^×` and `χ_V│F^× = η⁰ = 1`, so `χ_V(x) = χ_V(y)`: `χ̃_V` well defined | holds |
| 5.6a *Corollary of:* | MAF §5.6a | constant term along `N_C` of the lift to `U(V)` = lift to `U(V′)`; uses §3.3d (a), (b) exchanged / 5.6a: cuspidality only | holds |
| 5.7c *Needs* | §AL.1.2.1 | AutomorphicLFunctionsAndLocalFactors README line 584 at this head | exists |
| 6.4a, Weil's range | orthogonal, `d(n) = n + 1` | KR88b line 86: absolute convergence at `s₀` iff `m > 2n + 2` / README `m > 2d(n) = 2n + 2` | match |
| 6.4a *Origin*, Kudla–Rallis | KR88b p. 66 | `m` even (line 50), `α = 0` or `m − α > n + 1`, `K`-finite `Φ` (lines 78–79), holomorphy and identity / label: even dimension, `K`-finite data | match |
| 6.4a, symplectic `V` | `n = 1, 2, 3` | `m = 2r`, `r > n − 1` gives `m ≥ 2n`: `2 > 0`, `4 > 2`, `6 > 4 = 2d(n)`; range `d(n) < m ≤ 2d(n)` empty | holds |
| 6.4a credit in GQT | Prop. 11.1 (ii) | GQT line 2605: [KR1, KR2] and [I3]; [KR2] is the 1988 paper II (line 2806), [I3] Ichino 2007 (line 2795) | match |
| 6.4a Check | `(m, r, n) = (2, 1, 1)` | `m − r = 1 = d(1)`: outside the range on both sides (MAF §6.4a Check agrees) | holds |
| 6.13a *Origin* | GQT Props 11.1, 11.2 | hypothesis `d(n) < m ≤ 2d(n)` at line 2588 (p. 53); unitary `d(n) = n` (line 353) gives `n < m ≤ 2n`; §11.6 at line 2621 (p. 54) | match |
| 6.13b notation | `dim B = n + t` | `s₀ = (m − n)/2 = t/2` with `m = n + t` | holds |
| 6.11 *Corollary of:* | MAF §§6.10a, 6.11 | both sections exist (README lines 1830, 1844); value `L_v/d_v` on the spherical section / (b), (c) values | holds |
| Headlines (1)–(4) | 3.21a, 3.47, 5.7a/6.4a, 6.13a | unchanged by the diff; none statable at the pins; `Suggested.lean` declares nothing and its docstring says what each lacks | holds |

- Source locators checked against the text: 14 (HKS96 ×2, KR88b ×3, Ichino20 ×3, GQT ×4, Kudla96 ×2), two of them in texts the previous review could not read (HKS96, KR88b).
- Formal-proof declarations opened at commit 40e56bab: `PositivityTheory.KReal.cas_bound` (`CoreCas.lean:12`), `local_of` (`CoreMain.lean:143`), `common_quot` (`CoreMain.lean:583`), `UpperTheory.Gal.TP.Loc.LiftSatU` (`CompUnit.lean:37`).
- MetaplecticAutomorphicForms sections opened at this head: §§1.5, 2.5a, 3.3d, 3.7a, 3.9a, 3.22a, 5.6a, 5.7, 6.4a, 6.10a, 6.11, 6.13; all exist under the ids cited.
- Record: no heading, layer, statement or Check of the README at `b8f3652` is removed (0 headings removed or retitled; the 43 deleted lines are citations, *Status* sentences, *Needs* lists and scope prose, each replaced).
- Cross-roadmap citations: none unresolved; the 89 unresolved names are all declarations of the formal proof.
- Library names in the `Suggested.lean` docstring at the pin: `TauCeti.HeisenbergGroup` (`GroupTheory/SpecificGroups/Heisenberg.lean:58`).
- Automatic checks: all passed. Dependency check rerun: `depcheck: 129 roadmaps, 1449 edges, 0 problem(s)` (no UPWARD or CYCLE line).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; the file declares nothing, so no `#check` comparison and no one-tactic probe applied.

Overlap check: read MetaplecticAutomorphicForms (at this head), ThetaLiftsForDefiniteUnitaryGroups, RowTowerAndRallisIdentities and LocalFactorsOfTwistsAndTypes; MetaplecticAutomorphicForms owns the general theorems behind 3.3b (both clauses of orthogonal sums), 3.9a, 3.45, 3.46, 5.6a and 6.11, of which this roadmap states corollaries and its own additions; nothing else shared.

Source independence: changed passages only; 6 passages compared with 5 sources (HKS96 Appendix, KR88b p. 66, Ichino20 §§1 and 7.4, GQT §11.4, Kudla96 III.4), none shared beyond formulas and names; largest share of locators is the formal proof (about 110 file or declaration locators); arrangement not compared, since the diff adds, removes and reorders no layer.

Research link: Layers 5–6 state, for unitary pairs, Weil's convergence criterion and the Siegel–Weil and Rallis inner product formulas in the convergent range (Weil 1965; Kudla–Rallis 1988; Ichino 2007; Gan–Qiu–Takeda 2014), inputs of the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026); README References, KR88b and GQT §11.

## Not verifiable

- Kudla–Sweet 1997 (3.47, 3.47a): no legal copy recorded; the subject of the question above.
- Mœglin–Vignéras–Waldspurger 1987, Li 1990 and 1992, Paul–Trapa 2002, Flensted-Jensen 1980, Bargmann 1967, Liu 2011 and 2021, Wu 2013, Murase 2001, Murase–Sugano 2000, Yang 1998, Tate 1950, Kudla–Rallis 1994: cited by the new labels; not in the sources read this round.
- Kudla94, Li89, Weil65, KV78, Paul98, Yamana14, GJ72, Rallis87, PSR87, Ichino07, Ichino04, KS97: settled as uncertified.
- Formal-proof attributions other than the four declarations listed: not opened.
- The description's list of corrected statements: the copy read is cut short before it.

## Source issues

- none

## For the human reviewers

- Neither recorded decision bears on this folder: it removes no section or layer, and the move out of GeneralizedRiemannHypothesisFromWindowBounds does not touch it.
- Scope fact: the source with the largest share of locators is the formal proof (about 110 file or declaration locators), a Lean repository announced on 20 November 2026 (README, References "FormalProof", "Announcement"), not a refereed publication; published theta-correspondence literature carries the rest.
