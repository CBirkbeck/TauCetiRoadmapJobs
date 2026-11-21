# Review of WachLatticesOverTheCyclotomicTower (pull request #2899 at b863ff6)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/WachLatticesOverTheCyclotomicTower/`
**Verdict:** accepted

**Summary.** Accepted, with no findings: every statement, route and Check of 6.4–6.11 was recomputed (heights and labelling, the Sen clauses, the comparison exponent `σ`, `ψ` modulo `p` and its excluded exponents, the two polar counts, the counting theorem, the position arithmetic and the Sen-weight counts of the largest model, the cokernel exponents, the truncated Herr complex, the carries) and holds. The head is the one the previous review read, so its seven small corrections and its format note are still open; they are restated below, with one further format note, and none blocks. The human reviewers must decide on scope: 6.6–6.11 rest only on a formal proof announced in November 2026, which no refereed source states and whose text could not be read.

## C01 — The recurrence for `g_i` in the Check on `σ^{−1}`-semilinearity of 6.4 holds only for constant units `u_i`

In the Check "the localisation is `σ^{−1}`-semilinear" of 6.4 (line 144), a reader who derives `g_i = φ(g_{i−1})·(q/γ(q))^{k_i}` from `φγ = γφ` with units `u_i ∈ O_E[[π]]^×` gets a different formula. Comparing `φγ(e_{i−1}e) = φ(g_{i−1})u_iq^{k_i}e_ie` with `γφ(e_{i−1}e) = γ(u_i)γ(q)^{k_i}g_ie_ie` gives `g_i = φ(g_{i−1})·(u_i/γ(u_i))·(q/γ(q))^{k_i}`.

The conclusion `g_i(ζ_p − 1) = χ(γ)^{−k_i}` stands, because `γ(u_i)(ζ_p − 1) = u_i(ζ_p^{1+p} − 1) = u_i(ζ_p − 1)`, so the extra factor is `1` there. Either say that the basis is chosen with `u_i ∈ O_E^×` (possible for a rank-one Wach module), or keep the factor `u_i/γ(u_i)` and note its value at `ζ_p − 1`.

## C02 — Berger 2004 does not state 6.4 (6)–(7) in their `Fil⁰` form, and "the description of `N(V)` through its localisations" names no statement

6.4 (6)–(7) (lines 53–69) say that `ι_s(e_iN(V))` generates the `Fil⁰` lattice `Σ_j t^{−j}(E⊗F_s)[[t]] ⊗ Fil^jD_dR(V)`. The Sources line (lines 111–113) and the References send the reader to "the description of `N(V)` through its localisations" in Berger-Wach-2004 §§II–III, and no statement there has that form. What the text has (Berger-Wach-2004 lines 477, 528, 608, 628, 764):

- `D_cris(V) ⊂ B^+_{rig,F} ⊗ N(V)` (Proposition II.2.1);
- the elementary divisors of that inclusion, powers of `φ^{n−1}(q)/p` with exponents the weights (Propositions II.3.1 and III.2.1), which give the comparison after `t` is inverted;
- the diagonal action of `Γ_n` on `N(V)/φ^{n−1}(q)N(V)` and its identification with the Sen module (Proposition III.2.2);
- the filtration (Theorem III.4.4).

The statements (6)–(7) are true; the locator does not lead to them. Cite these propositions as the inputs, and a source for the `Fil⁰` description of the localised lattice of a de Rham representation if one is meant.

## C03 — The `γ`-descent of 6.10 (2) and its exponent are in Berger 2004 (Proposition IV.1.3 and the constant `α(r)`), and 6.10 does not cite it

6.10 has no Sources line and the References credit it to [FormalProof] alone (line 707). Berger-Wach-2004 Proposition IV.1.3 (line 853, manuscript p. 24) proves `π^{r−i}∏_{j<i}(χ(γ)^{r−j} − 1)N₁ ⊂ N₂` by the same induction, and its constant `α(r) = inf_γ Σ_{j≤r} v_p(χ(γ)^j − 1)` (line 807, p. 23) is `cost(0, r)`: both equal `⌊r/(p−1)⌋ + v_p(⌊r/(p−1)⌋!)`, and the bound given there, `α(r) ≤ rp/(p−1)²`, is the README's bound for `cost(0, s)`. Add this locator to 6.10 (2).

## C04 — 6.6–6.11 cite the formal proof with no file or declaration, and 6.10 and 6.11 have no Sources line

The Sources lines of 6.6–6.9 (lines 237, 318–319, 358–359, 476) say only "[FormalProof]", and the References entry attributes all of 6.4–6.11 to a repository as a whole. A reader cannot find the formal statement behind a target, nor check that it has the generality stated here (general `E`, unramified `F` of degree `n`). The companion roadmap SelmerLengthBoundsAndLocalLifting names declarations of the same development in its §4.10e. Give at each section the declarations that state it, and add a Sources line to 6.10 and 6.11.

## C05 — The rank-zero Check of 6.8 says `d = 0`, which the hypotheses do not force

In 6.8 the integers `d_i ≥ 0` are data. In rank zero every hypothesis holds for every choice of the `d_i` (the high-type condition reads `d_i + 0 ≥ 0`), so "Rank zero: `d = 0` and there is nothing to count" (line 368) asserts a value the statement leaves free, and as a test it passes for every bound. Would "Rank zero: the only Herr pair is `0`, so the bound holds for every `d`" say what is meant?

## C06 — The Check "a failure outside the hypothesis" of 6.9 needs `ρ̄ = χ̄_1`, which it does not state

The Check (lines 492–496) fixes only `HT(ρ) = {p}` and concludes that `T̄` is trivial. A crystalline character of that weight is `χ_1χ_cyc^{−(p−1)}` times an arbitrary unramified character, so `T̄` can be a nontrivial unramified character, and the sum `χ_1 ⊕ χ_1χ_cyc^{−(p−1)}μ` is full only when `ρ̄ = χ̄_1`. Add "take `ρ = χ_1χ_cyc^{−(p−1)}`".

With that choice the values stand: `σ = 1`; (P3) reads `11 < p`; (P4) is vacuous; (P5) fails at `y = 0`; the classes `(χ_cyc^{−(p−1)}μ − 1)/p` span `H¹(G_{ℚ_p}, 𝔽_p)`, of dimension `2`; `d = 0`.

## C07 — The description names polynomial rings where the roadmap has power series, and reports a `sorry` warning that the file cannot produce

The description says `V` "has a Wach lattice `N(T)` over `O_E⊗W(k_F)[π]`" and speaks of "a family … of `k[X]`-lattices"; the README has `O_E⊗W(k_F)[[π]]` and `k[[X]]` (line 3). It also says the targeted build "succeeds with `sorry` as the only warning"; `Suggested.lean` declares nothing and elaborates with no message. Write `[[π]]`, `[[X]]` and "succeeds with no warning".

## N01 — Two citations name a paper or a range of sections where a numbered statement exists

Wach 1996 for 6.4 (8) (line 113): the Théorème on p. 380 with Remark a) on p. 381, restated as Berger-Wach-2004 Proposition II.1.4. Herr 1998 "§§2–4" for `γ − 1` on `ψ`-zero parts (line 318): Théorème 3.8, p. 584. The Roman numbering cited for Berger 2004 is that of the published text and of the author's manuscript; the arXiv version (v2) is numbered 1–4 and does not carry it.

## N02 — The family index says that the family "follows" a source

The index of the family, which this pull request carries, says "The family follows the formal Lean proof of these theorems" (index README, line 9), and so does the description. The house rule is that a roadmap does not say it follows a source. Would "The theorems of the family are those of the formal Lean proof of …" do, with the sentence on generality kept?

## Questions for the author

- The References give the formal proof as a repository on GitHub, while the announcement's footnote names archives on the author's own site. Are these the same development, and which declarations state 6.6–6.11? The repository could not be opened: its host is in no class the legal-source service reads.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.4 setting: `π₀`, `X`, `γ(X)` | mod `(p, π^p)`; `π = ζ − 1`; integrally | `π^k`-coefficient `binom(p, k+1)`: `0` (`k ≤ p−2`), `1` (`k = p−1`); `π₀(ζ−1) = −p`; `γ(X) − X = −π^{2p−2} + …` | holds | none |
| 6.4 (2), (4) heights and labelling | `ℤ_p(−a)`; `n = 2`, `(k₀, k₁) = (5, 0)` | `φ(π^ae) = q^aπ^ae`; index `X^a` on invariants, `π^{(p−1)a}` over `k[[π]]`; `φ(e_{i−1}) = e_i`, so the exponent in `φ(e_{i−1}e)` is the weight at `emb_{i−1}` | holds | none |
| 6.4 (5) exact sequences | `m = 1` sharp example | `N(T₁) = {(a/p, π^{−c}βe_c) : β ≡ π^ca}`; cokernel `ℤ_p[[π]]/(p, π^{p−1}) ≠ 0`; equal after inverting `p` | holds | none |
| 6.4 (6)–(7) localisation | `ℤ_p(−1)`, `d = te_{−1}` | `φ^{−1}d = d/p`, `t ↦ t/p`: `ι_1(πe_{−1}) = unit·t^{−1}d`; `Fil⁰ = t^{−1}F_1[[t]]d`; `σ^{−1}` sends `e_i` to `e_{i−1}` | holds | C02 locator |
| 6.4 `σ^{−1}` Check | units `u_i` non-constant | extra factor `u_i/γ(u_i)`; at `ζ_p − 1`: `1`; `q/γ(q) ↦ χ(γ)^{−1}`; `φ(g)(ζ_p−1) = g(0) = 1` | conclusion holds | C01 |
| 6.4 (8) crystallinity; `Γ` Check | `N = πO_E[[π]]` | `φ(N) = qN`: `a = 0`, `b = 1`; `(γ−1)π ≡ pπ ∉ π²`; equality `N = N(T)`: cokernel of finite length forces unit determinant | holds | none |
| 6.5 (1)–(4) Sen clauses | `ℤ_p(−1)`; `U = {0}`, `{0,0}`, `{0,p}` | `ν = c(m)` on graded piece `m`; direct: `(γ−1)n′ ≡ π^{p−1}n′`, `∇ = 1`; `U = {0}`: (3) applies iff `s ≤ p` | holds | none |
| 6.6 (1)–(3) | rank one `φe = X^he`; `h = 60`, `p = 41` | `∇` on `X^{a+j}N/X^{a+j+1}N` is `∇ − (a+j)`; lattices `X^{−m}`, `0 ≤ m ≤ ⌊h/(p−1)⌋`; `S = 1.5`, `σ = 1`, `2 ≤ 22` | holds | none |
| 6.7 (1), (2) gauge, polar kernel | trivial family, pair `(1, 0)` | `p(σ_{i−1}+2) − w_i ≥ σ_i + 1 + p`; `(1,0)` not a coboundary (`ker(γ−1) = k`); bound `sen(N)(−1) = 0` | holds | none |
| 6.7 (3b) range | `a = 1, 2, 2−p, 1−p` | `⌊(p−1)a/p⌋ = 0, 1, 2−p, 1−p`; images `X^0, X^1, X^0, X^{−1}` | `[2−p, 1]` exact | none |
| 6.7 (3c) levels | `a = 0, 1, 2, 3`; `y = 1 − X` | levels `B_c`, `c = ⌈((p−1)a − p + 2)/p⌉ = 0, 1, 1, 2`; `ψ(X) = 1`, `ψ(X²) = 0`; `(γ−1)y = X² + …` | holds | none |
| 6.7 (4) polar count | `v = 0` against `v ≥ 1` | `φ(N₀) ⊂ X^{1−v}φ^*N₀` needs `v ≥ 1`; `1 − v ≥ 3 − p`; tail in `X^{p(σ+3)−1−w}N ⊂ X^{v+1}N` | holds | none |
| 6.8 counting theorem | high piece `c = b′ + x − y` | `(γ−1)c = φ(g′_{i−1}) − (g_i − (γ−1)x_i)`; `p(σ_{i−1}+3) − w_i ≥ v_i + σ_i + 1 + 2p`; rank zero: `d_i` free | holds | C05 |
| 6.9 position consequences | (P1)–(P5), both types | window differences `≤ η + σ + 1 < p`; out-of-window intervals inside `[−2σ−2, η+2σ+3]`; `t ≤ η`, `t + 2σ + 1 < p` | holds | none |
| 6.9 (1a) semisimplicity, high type | `s = h − w + 1 ≤ η + 1` | block: `[0, t−1] ⊂ [0, h−w]`; window weights below `w`: gap `≤ η < p`; others excluded by (P5) at `y ∈ [0, η]` | holds | none |
| 6.9 (1c) count | `μ` full summands | Sen weights in `{0..t−1}`: exactly `μt`; character pieces `≥ μt`; `pm_{i−1} ∈ [s+w−h, s+w]` gives one sign; `Σm = 0` | holds | none |
| 6.9 (2) counts | low and high type | low: `mult_Q(0)`, `mult_Q(−w)` vanish, sum `= d_i`; high: sum over `[0, v+σ+1]`, interval length `v+σ+2 < p`, sum `= r − d_i` | holds | none |
| 6.9 (3), (4) | `u = w + k(p−1)`; `e = 0`, `e ≥ 1` | `k ≥ w + 2σ + 3` against `σ ≥ k`: impossible; `e + j₀ ≤ η < p`; `e = 0`: class `(μ−1)/λ` | holds | none |
| 6.9 Checks | `p = 41`: `(h, η, w, t, U) = (100, 26, 80, 2, {66})`, `(100, 20, 85, 1, {99})`; `p ≥ 13`, `U = {p}` | `σ = 2`; `40 < 41`, `34 ∉ [−6, 33]`, `−40 ∈ [−80, 20]`; `34 < 41`, `14 > 4`, `−66 ∈ [−85, 15]` | holds | C06 |
| 6.10 (1) general form | sharp example `c = (p−1)p^{m−1}` | `c_i ≥ p·c_{i−1}` around the cycle gives `c_i = 0`; `C = ℤ_p[[π]]/(p^m, π^c)`, `H = c` | holds | none |
| 6.10 (2) descent and bounds | `p = 3`; window `(j, s]` | `v_p(u^k−1) = 1 + v_p(k)` iff `(p−1) ∣ k`; `cost(c−1, c) = m`; `p/(p−1) − log_p(p−1) = 0.87` at `p = 3` | holds | C03 credit |
| 6.10 (3) recursion | terms with `U < t` | `2 + t/(p−1)² + U/(p−1) > 0`; `2p² ≤ 10(p−1)(p−2)` at `p = 3`: `18 ≤ 20` | holds | none |
| 6.10 (4) truncated complex | `M = 0`; `M + h ≤ p − 2` | `φ(π₀) = π₀Q^{p−1}·unit`; `c_Γp^kω′ = δY′ + π₀^a(z′ − m′)`; `v_p(R(0)c_Γ) = Σv_p(j) + a + v_p(a!)`; `M = 0`: onto | holds | none |
| 6.11 (0)–(5), Check | `T = {a ≡ b mod p} ⊂ ℤ_p ⊕ ℤ_p(1−p)` | `N(T) = π^{p−1}v₁ ⊕ v₂`; carries `−1, +1`; quantities `0, p−1`; residues `{p, −1}`; `p − 1 = σ₂(U)` | holds | none |
| Headline 1 (6.4, 6.5) | rows above | rank `dim V`; heights `X^{−a_i}`, `X^{b_i}`; characteristic polynomial `∏(Y − ū)` | holds | none |
| Headline 2 (6.9 (3)) | hypotheses of 6.8 for `N^max` | `1 ≤ t ≤ v_i ≤ η ≤ p − 7`; low count `= d_i`, high count `= r − d_i`; polarity monotone | holds | none |
| Headline 3 (6.10 (1)–(3)) | sharp example | `π^H` needed; `p^m` needed at `π^{c−1}`; `H ≤ p − 2`: `cost = 0`, `C = 0` | holds | none |
| Headline 4 (6.11) | example above | `(p − 1)·|c| = h` attained; (5) an equality | holds | none |

- Previous review: no findings; its seven small corrections and its format note are not addressed at this head (the head it read) and are restated as C01–C07 and N01.
- Source locators checked against the text, 12: Berger-Wach-2004 Propositions II.1.1, II.1.4, II.2.1, II.3.1, III.2.1, III.2.2, III.4.2, Theorem III.4.4, Proposition IV.1.3 and `α(r)` (lines 397, 458, 477, 528, 608, 628, 742, 764, 853, 807); Wach-1996 Théorème, p. 380 (line 229); Herr-1998 Théorème 3.8, p. 584 (line 810), with Théorème 2.1 (line 376).
- Library declarations opened at the pin, 9: `Field.absoluteGaloisGroup` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`), `WittVector.fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`), `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean:112`), `BDeRhamPlus`, `BDeRham` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75, 88`), `Module.End.maxGenEigenspace` (`Mathlib/LinearAlgebra/Eigenspace/Basic.lean:557`), `ExteriorAlgebra.exteriorPower` (`Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:79`), `LaurentSeries` (`Mathlib/RingTheory/LaurentSeries.lean:101`), `TauCeti.continuousLocalCyclotomicCharacter` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean:54`). No file of either pinned library mentions Wach modules, `B_cris` or crystalline representations.
- Cross-roadmap citations resolved: the supplier sections of PhiGammaModulesAndIwasawaCohomology (Conventions, §§0.1, 1.0, 2.2, 2.4, 2.5, 3.1, 3.4, 3.5, 3.6, 5.6a, 6.0–6.3, 7.2a) and PadicPeriodRings §§4.1–4.3 exist on main with the cited subjects; the consumer sections §§4.10a, 4.10c–4.10f of SelmerLengthBoundsAndLocalLifting exist at its open head and cite 6.4–6.10 back.
- Dependency check with the candidate merge order: `depcheck: 170 roadmaps, 1986 edges, 0 problem(s)`; both suppliers are on main and earlier in the order.
- Elaboration: `lake env lean` on `Suggested.lean` ends with no message. The file declares nothing, so there is no signature to compare; its docstring names the four headlines and the carriers each lacks, and the one-tactic probe has nothing to try.
- Headlines: the four of the README's overview; none is statable at the pins (no crystalline representation, `D`, or Wach lattice in either library), and the docstring says so for each.

Overlap check: read SelmerLengthBoundsAndLocalLifting and PhiGammaModulesAndIwasawaCohomology (scope and the cited sections), and CongruenceModulesOfThetaLifts, LengthBoundsInPadicFamilies, PadicHodgeRegulators, TriangulineVarietyAndItsLocalModel, PadicHodgeTheory and FiniteFlatGroupsAndIntegralPadicHodgeTheory at every passage on Wach lattices (the last two cite PhiGammaModulesAndIwasawaCohomology §6.0 for comparisons with strongly divisible and Breuil–Kisin modules; two have none). Wach modules: owner PhiGammaModulesAndIwasawaCohomology §6.0, cited here. Reduced Wach lattices, lattice families, position data, admissible modules, cokernel annihilators, carries: owner this roadmap; SelmerLengthBoundsAndLocalLifting and CongruenceModulesOfThetaLifts cite §§6.4–6.11. Lattices at finite level of the tower, with crystallinity assumed: owner SelmerLengthBoundsAndLocalLifting §4.10e (0). Nothing has two owners.

Source independence: 8 passages compared with 4 sources (Berger-Wach-2004, Wach-1996, Herr-1998, Announcement), none shared: 6.4 (1), 6.4 (5) route, 6.4 (8), the filtration of 6.4, 6.7 (3c), 6.10 (2) with its route, the References, the docstring of `Suggested.lean`. Largest share [FormalProof], 4 of 10 Sources-line citations, with all of 6.4–6.11 attributed to it in the References; contents compared with Berger-Wach-2004 (chapters I–V): independent. The text and contents of [FormalProof] could not be read.

Research link: 6.4, 6.5 and 6.10 extend Berger's Wach lattices of crystalline lattices and their behaviour modulo `p^n` (Berger 2004, §§II–IV, read) and Wach's criterion (Wach 1996, read); 6.7 extends Herr's torsion complexes (Herr 1998, read). 6.6–6.11 are steps of the formal proof announced by Alpöge in 2026 (README References; Announcement read).

## Not verifiable

- [FormalProof], the repository cited for 6.6–6.11: its host is in no class the legal-source service reads, so no locator into it was checked; 6.6–6.11 were verified by recomputing their routes and Checks.
- Cherbonnier–Colmez 1999 and Fontaine 1990: not fetched; they are cited only for classical background (`γ − 1` on `ψ`-zero parts in characteristic zero, étale `(φ,Γ)`-modules).
- Berger-Wach-2004 was read in the author's manuscript, whose numbering is the one cited; the journal's pagination was not checked.

Automatic checks set aside as false positives: run against the default merge order, the order check reports this roadmap as not listed, while the candidate order lists it after both suppliers; the check on changes outside the roadmap's folder lists the three files of the family index, which belong to this pull request because the roadmap is nested in the family.

## Source issues

- none

## For the human reviewers

- Scope: 6.6–6.11 cite only [FormalProof], a Lean development; the announcement says its author chose to present only Lean and no written proof (Announcement lines 72–76). No refereed source stating 6.6–6.9 or 6.11 was found.
- Not tested: [FormalProof] has the largest share of the Sources citations and could not be read, nor its file structure; wording and arrangement were not compared with it. The family index says the family "follows" it.
- Licence: the README cites a GitHub repository for the formal proof, the announcement's footnote (Announcement line 53) names archives on its author's site; the licence of either, and whether they are one development, were not determined.
