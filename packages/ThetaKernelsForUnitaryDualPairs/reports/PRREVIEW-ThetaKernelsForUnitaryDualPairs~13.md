# Review of ThetaKernelsForUnitaryDualPairs (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaKernelsForUnitaryDualPairs/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 222 changed lines since `b8f3652`. I checked every changed passage: the 22 new *Origin* and *Method* labels, the six *Corollary of:* lines with the MetaplecticAutomorphicForms sections they name at this head, the revised attributions in 3.21a, 3.47 and 3.47b, and the new citations, *Needs* lines and scope sentences. I also checked the seeded sample and the record of the README on `main`, which loses nothing. One finding blocks: 3.3b calls clause (a) of *Orthogonal sums* for a non-split acting space this roadmap's own formulation. MetaplecticAutomorphicForms §3.3d, at this head, states that clause for every space, so two roadmaps own it. There are four small corrections (one misattributed range in 6.4a, one overstated source in 3.46a, three untouched sentences that the new labels contradict, and the description's account of this folder) and one format note. Nothing in the mathematics is left for a human to decide; one fact about the scope is listed for the human reviewers.

## R01 (P2) — 3.3b claims clause (a) of *Orthogonal sums* for a non-split acting space as its own, but MetaplecticAutomorphicForms §3.3d at this head states it, so that clause has two owners

An implementer reading 3.3b thinks that (a) for a non-split `V` is this roadmap's own work, with no route ("Orthogonal sums: route not given here", line 90). The general roadmap that this section names as its supplier already states that case and proves it. Under the Scope paragraph (lines 2255–2257), 3.3b's orthogonal sums are owned here except for the clauses its *Corollary of:* line names, so the clause is now owned in two places.

The *Origin* (line 40) ends: "(a) when the space of the acting group is not split, are this roadmap's own formulation". The *Corollary of:* line (line 44) describes §3.3d as covering the other member's space only "when the acting group's space is split". The *Method* label (line 42) and the route (lines 91–92) say the same. At this head, MetaplecticAutomorphicForms §3.3d (its README, lines 673–689) states (a) with no condition on `V`. Its route contains a paragraph "(a) for arbitrary `V`", which goes through the split space `V ⊕ V⁻` and clause (b) with the roles exchanged. It cites HKS96, Appendix, (a.22)–(a.24), p. 997, for that reduction. The statements of (a) in the two roadmaps are otherwise the same.

The smallest repair:
- Extend the *Corollary of:* line to all of (a) and (b), and correct its description of §3.3d.
- Remove the clause on the non-split case from the own-formulation sentence of the *Origin*, and credit Harris–Kudla–Sweet's appendix as §3.3d does.
- At lines 42 and 91–92, write that MetaplecticAutomorphicForms §3.3d states (a) and (b).

## C01 — 6.4a's *Origin* calls the convergent-range Siegel–Weil formula for the data that are not unitary pairs this roadmap's own, but for orthogonal–symplectic data it is Kudla–Rallis (1988)

The *Origin* (line 1879) lists "the data of MetaplecticAutomorphicForms §5.7 that are not unitary pairs" among the cases of `d(n) < m ≤ 2d(n)` that it calls this roadmap's own formulation. The locator the label itself cites does not support this. In the proof of Proposition 11.1 (ii), p. 53, GQT derives the convergent case from the Siegel–Weil formula of Kudla–Rallis and of Ichino 2007 (GQT line 2605). The Kudla–Rallis papers are *On the Weil–Siegel formula* and its sequel *II: the isotropic convergent case* (J. reine angew. Math. 387 and 391, 1988; GQT lines 2805–2806). GQT §3.1 credits Kudla–Rallis with extending Weil's formula as well (GQT line 596). A reader would take a published theorem for new mathematics. Name Kudla–Rallis (1988) for the orthogonal–symplectic data, and keep "own formulation" only for the cases that remain.

## C02 — The *Method* label of 3.46a attributes to Ichino (2020), §7 an account of Li's proof that §7 does not give

The label (line 451) says that Li's proof, "as Ichino (2020), §7, presents it", uses Flensted-Jensen's formula, the identification by infinitesimal character (Vogan and Zuckerman) and Howe duality. Ichino20 §7 (lines 1258–1668) does something narrower. In the base step, Lemma 7.7, it takes the Flensted-Jensen function of the lowest `K`-type (lines 1661–1663) and states that the nonvanishing of the integral follows from the proof of Li's Theorem 4.1 (line 1666). §7 does not mention Vogan–Zuckerman, the infinitesimal character or Howe duality. One way to fix this: say that Ichino (2020), §7.4, Lemma 7.7, uses Flensted-Jensen's function together with the argument of Li (1990), Theorem 4.1. Cite Li (1990) itself, or Vogan–Zuckerman 1984, for the identification through the infinitesimal character.

## C03 — Untouched text: three sentences in 3.47b, 3.47c and 5.7b contradict the new *Origin* labels

The new labels cite published sources for the clauses that these older sentences call unpublished or own:
- 5.7b, line 1401: "No publication is cited for (i)–(iv)". The new *Origin* (line 1326) and the References cite Kudla–Rallis (1994) and Ichino (2004) for (i), (ii) and (iv).
- 3.47c, line 1033: "No publication is cited for these lemmas". The new *Origin* (line 999) cites Tate (1950) and Godement–Jacquet (1972).
- 3.47b, first *Status*, lines 875–878: (iii) and (v) are called "this roadmap's own". The new *Origin* (line 832) credits Li (1990) and Paul–Trapa (2002) for the identification with `A_𝔮(λ)`, which is (v).

Under the Conventions (lines 21–23), *Status* and *Origin* both record what is this roadmap's own, so the two now disagree. Rewrite each sentence to agree with its label, for example: "the sources cited in *Origin* prove related statements; the route above proves these".

## C04 — The description's account of this folder is out of step with the head in three places

- The description says that ThetaKernelsForUnitaryDualPairs 5.7c and ThetaLiftsForDefiniteUnitaryGroups 6.12 "add AutomorphicLFunctionsAndLocalFactors §AL.1.2.1 and §AL.1.2.3". At this head, 5.7c adds only §AL.1.2.1 (line 1622), and 6.12 adds only §AL.1.2.3.
- The list "Wrong statements on main" names only §3.21a for this roadmap. The head also reverses two claims about the formal proof that are on `main`:
  - In 3.47's *Status*, the identification of `Θ`, `Θ′` with the induced representation was "not on the path of the formal proof". It is now published for `N` even, and the matched quotient is said to be on that path.
  - In 3.47b's second *Status*, lemma (o) was "not on the path". The formal proof is now said to state (o).
- The sentence that a section "now states the proof's form and the general roadmap the general theorem" does not hold here. 3.3b, 3.9a, 3.45, 3.46, 5.6a and 6.11 keep their general statements beside a *Corollary of:* line. The description's own paragraph "General theorems first" describes these sections correctly.

## N01 — 3.47b now has two paragraphs headed *Status* (lines 875 and 895)

The second paragraph names no clause of this roadmap's own and instead reports what the formal proof states, which the Conventions (line 21) assign to *The form of the formal proof*. Moving that sentence into the first *Status*, or giving it that heading, would keep one *Status* per section.

## Questions for the author

- 3.47, *Status* (line 697): is the identification of `Θ`, `Θ′` with `α_w ∘ det_a × β_w ∘ det_{a′}` in Kudla–Sweet (1997) at a split place `E = F × F`? I recall their degenerate principal series of `U(n, n)` as a study over a quadratic field extension. I could not read the paper, because no legal copy is recorded for this roadmap. If they treat only fields, the split-place statement would need Mínguez08 or the route instead.
- 3.47b, second *Status* (line 895): which declaration of the formal proof states lemma (o)? Every other attribution to the formal proof in this section gives a file and a declaration. This one gives none, and I did not find it.

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 3.3b (a), non-split `V` | `V` anisotropic line, `W = W′ ⊥ W″` | 3.3b: own formulation, no route / MAF §3.3d: (a) for every `V` via `V ⊕ V⁻` | R01 |
| 3.3b unipotent Check | `k = 1` | `B(x⊗y, −bx⊗y*) = −2b⟨x,x⟩`, so `ψ(−½·(−2b⟨x,x⟩)) = ψ(b⟨x,x⟩) = ψ(tr(B T_x))` | holds |
| 3.3b Levi source | Gan–Ichino §7.4 | Levi/unipotent formulas at GanIchino lines 1521–1525, derived from Kudla94 Thm 3.1 (line 1515) / *Origin* says the same | holds |
| 3.9a (ii) | `E` field, `W₀` anisotropic dim 2, `n = 1` | `r = 0`: no isotropic line; `r = 1`: one. Mínguez Thm 1 (2): `n ≤ m` ⇒ Hom ≠ 0 | holds |
| 3.9a Corollary line | MAF §3.9a (i)–(iii) | MAF: (i), (ii), first sentence of (iii) / ThetaKernels adds the integral identity only | holds |
| 3.21a *Origin* | Liu21 Thm 1.1 | Liu: `V` even dim, `W_r = E^{2r}` split, trivial character, `q` odd / MAF §3.22a: same hypotheses | holds |
| 3.21a formal proof | `LiftSatU` at 40e56bab | hypothesis `2 * n < d`, split places, no Hecke map / head text: "(iii) for `d > 2n`", no `ξ` | holds |
| 3.45 (iv) Check | `N = 1`, `T = δ₀`, `P = z²` | `ϑ″(0) = −π·2^{1/4}`; `π⁻²ϑ″(0) = −2^{1/4}/π` / `(B⁻¹z²)(0) = −2^{1/4}/π` | holds |
| 3.46 (iii) | `n = d = 1`, `ε = −1` | `(ts)^{−1/2−k}t^{m_W/2}s^{m_V/2} = t^{−k−a}s^{−k−b}`, `a = (1 − m_W)/2 = (d + εm_W)/2` | holds |
| 3.46a route (2) | `n = 1`, `n′ = 2`, `λ = (k)`, `λ′ = (k│0)` | `k² − 0 − ½ = k² − ½` / `k² − ½`; (G): `(n + t)³ = 8`, so `│k│ > 8` | holds |
| 3.46a *Method* | Ichino20 §7 | §7.4: Flensted-Jensen function, Li's Thm 4.1 proof / label adds Vogan–Zuckerman, Howe duality | C02 |
| 3.47 zeta exponent | `a − a′ = 1, 2` | `a − 1 − N/2 = (a − a′)/2 − 1`: `−½` (converges), `0` (shell sum) | holds |
| 3.47a parameters | `Θ`: `c = α(ϖ)`; `Θ′`: `c = β(ϖ)` | `{α(ϖ)q^{(a−1)/2−i}} ∪ {β(ϖ)q^{(a′−1)/2−j}}` on both sides via 3.21a(iii) | holds |
| 4.4a Check `V = 0` | rational `h` | `det h ∈ E¹ = {x/x̄}`, `χ̃_V(x/x̄) = χ_V(x) = 1` on `E^×` | holds |
| 4.4a citations | arXiv 2503.00696, 1606.03346, 1009.0877 | Rapinchuk–Tralle (almost strong approximation); Gutiérrez Frez–Vera-Gajardo `U(n,n)(F_q)`; Gutiérrez–Pantoja–Soto-Andrade | match |
| 5.6a | Wu Prop 3.1 (lines 406–414) | constant term along `Q_a` of lift to `X_a` = lift to `X` / MAF §5.6a same | holds |
| 5.7b Check | `n = 1`, `d = 2` | rank-1 support ⇔ `Φ_{v₁}` vanishes near `0 ∈ F²` | holds |
| 5.7c exponents | complementary datum | `a − N/2 = (a − a′)/2 = ε₀`; `1 − (a′ − N/2) = ε₀ + 1`; split: `a/2 − (N−1)/2 = −(a′−1)/2` | holds |
| 5.7c *Needs* | §AL.1.2.1 | AutomorphicLFunctionsAndLocalFactors README line 584 at this head | exists |
| 5.7d Check | split, `ν = 1`, `ε₀ = 2` | `L(3, ν) = (1 − q⁻³)⁻²`, `c = (1 − q⁻³)²` | holds |
| 5.7e Check | complementary datum | `│κ│ > a + a′ ≥ a − a′ = 2ε₀` | holds |
| 6.4a range | `(m, r, n) = (2,1,1)`, `(3,1,1)` | `m − r = 1 = d(1)`: excluded; `2 > 1`, `m > 2n`: `s₀ = 1`, absolute | holds |
| 6.4a *Origin* | GQT line 2605, p. 53 | GQT: convergent case from KR1, KR2 and I3 / label: non-unitary data own | C01 |
| 6.11 (b) | `n = 1` | `(1 − χ(ϖ)q^{−2s−1})/(1 − χ(ϖ)q^{−2s−1}) = 1` / integral over compact `U(1)` = 1 | holds |
| 6.13a *Origin* | GQT Props 11.1–11.2 | standing hypothesis `d(n) < m ≤ 2d(n)` (GQT lines 2583–2588) / "stated for `n < m ≤ 2n`" | holds |
| 6.13b (iv), Check | `s = −n/2`; `n = 1` | `C·H^{s+n/2} = C`; `d^S(s₀) = L^S(1 + t, η^{t+1})` | holds |
| Headlines (1)–(4) | 3.21a, 3.47, 5.7a/6.4a, 6.13a | unchanged; none statable at the pins; Suggested.lean declares nothing, its docstring says why | holds |

- Source locators checked against the text: 15 (GQT ×5, Ichino20 ×3, Gan–Ichino ×2, Kudla96 ×1, Mínguez08 ×1, Liu21 ×2, Wu ×1); three arXiv identifiers resolved on arxiv.org.
- MetaplecticAutomorphicForms sections opened at this head: §§1.5, 2.5a, 3.3d, 3.7a, 3.9a, 3.22a, 5.6a, 6.4a, 6.4b, 6.10a, 6.11, 6.13. At the head of the other open revision of MetaplecticAutomorphicForms (#2772), none of the new ids is used for another subject.
- Record: no heading, layer, statement or Check of the README at `b8f3652` is removed; the 43 deleted lines are citations, *Status* sentences, *Needs* lists and scope prose, each replaced.
- Cross-roadmap citations: none unresolved. The 86 leads are all declaration names of the formal proof; one, `UpperTheory.Gal.TP.Loc.LiftSatU`, was opened at commit 40e56bab.
- Library names in the `Suggested.lean` docstring confirmed at the pins: `TauCeti.HeisenbergGroup` (`GroupTheory/SpecificGroups/Heisenberg.lean:58`) and `TauCeti.hermiteFunction` (`Analysis/SpecialFunctions/Hermite/Function/Basic.lean:36`).
- Automatic checks: all passed. Dependency check rerun: "129 roadmaps, 1449 edges, 0 problem(s)" (no UPWARD or CYCLE line).
- Elaboration: `lake env lean` on `Suggested.lean` (unchanged; no declarations) exits 0 with no output. No `#check` comparison was needed, because the file declares nothing.
- Overlap check: I read MetaplecticAutomorphicForms (this head and #2772), ThetaLiftsForDefiniteUnitaryGroups, RowTowerAndRallisIdentities and LocalFactorsOfTwistsAndTypes. MetaplecticAutomorphicForms owns the general theorems behind 3.3b, 3.9a, 3.45, 3.46, 5.6a and 6.11, and this roadmap deduces its clauses from them. Clause (a) of 3.3b for a non-split acting space is owned by both (R01). The other three roadmaps cite this one and own nothing here.

Source independence: 9 changed passages compared with 6 sources (Gan–Ichino §7.4, Kudla96 III.4, Liu21 §1, Wu §3, Ichino20 §7, GQT §§3.1, 7.1, 11.4). None shares wording beyond formulas and names. The largest share of locators is the formal proof (about 107 file or declaration locators). The arrangement was not compared, because the change adds, removes and reorders no layer.

Research link: Layers 5–6 restate, for unitary pairs, Weil's convergence criterion and the Siegel–Weil and Rallis inner product formulas in the convergent range (Weil 1965; Ichino 2007; Gan–Qiu–Takeda 2014). They are inputs of the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026). This rests on the README's Conventions and References, and on GQT §§1.7 and 11.

## Not verifiable

- Harris–Kudla–Sweet 1996 (3.3b, 4.4a): not in the sources cache; the appendix locators of MetaplecticAutomorphicForms §3.3d were not read.
- Kudla–Sweet 1997 (3.47, 3.47a): no legal copy recorded; this is the subject of the first question.
- Mœglin–Vignéras–Waldspurger 1987 and Li 1992 (3.9a, 6.11, 6.13a–b): Springer LNM and Crelle, not opened.
- Li 1990, Paul–Trapa 2002, Flensted-Jensen 1980, Bargmann 1967, Liu 2011, Murase 2001, Murase–Sugano 2000, Yang 1998, Tate 1950, Kudla–Rallis 1994: cited by the new labels; not opened (no copy in the cache).
- Kudla94, Li89, Weil65, KV78, Paul98, Yamana14, GJ72, Rallis87, PSR87, Ichino07, Ichino04: settled as uncertified.
- Formal-proof attributions other than `LiftSatU`, including lemma (o) of 3.47b: not opened.

## Source issues

- none

## For the human reviewers

- Neither recorded decision bears on this folder: it removes no section or layer, and the GeneralizedRiemannHypothesisFromWindowBounds move does not touch it.
- Scope fact: the source with the largest share of locators is the formal proof (about 107 file or declaration locators), a Lean repository announced on 20 November 2026 (README, References "FormalProof", "Announcement"), not a refereed publication. The published theta-correspondence literature carries the remaining locators.
