# Review of ThetaKernelsForUnitaryDualPairs (pull request #2907 at 621fa2e)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaKernelsForUnitaryDualPairs/`
**Verdict:** needs changes

**Summary.** Changes are needed for three findings. First, 3.46a states the archimedean correspondence of discrete series only under a gap hypothesis that the roadmap itself calls a hypothesis of its route. Second, almost no target carries a theorem or page locator, and five of the fifteen sampled targets cite no source at all. Third, a Check in 3.47c is false when ε₀ is a half-integer. The explicit computations held up throughout (all Checks recomputed in the sample agree), and the report also has seven small corrections and one format note. The human reviewers are asked about the unpublished formal development the family follows.

## R01 (P2) — 3.46a states the correspondence of discrete series only under the gap hypothesis (G), which the roadmap itself calls a hypothesis of its route

A library target cut down to what one proof needs leaves the general statement unplanned. Readers outside this family would cite the general statement, and the project's planning principles rule out route-specific restrictions, however much more the general proof costs. Hypothesis (G) (lines 380–381) asks that entries of `λ` in different blocks differ by more than `(n + t)³` and by at least `120·n·min(p, q)^{3/2}`. The Remark (lines 438–440) says the correspondence "is classical without (G) and for the full theta quotient (J.-S. Li 1990; A. Paul 1998)" and that "(G) is a hypothesis of the route above". The first Check (line 450) adds that (G) is not needed for `U(1) × U(1, 1)`. Clauses (a), (b), (d), (e) and (f) are nevertheless stated only under (G). 5.6a's (R1)–(R3), and the consumers, then inherit the restriction.

The smallest change: state (a), (b) and (e) in the generality the cited literature proves, with its locators. Keep (G) as the hypothesis of the Casimir route, either in the route paragraph or as a separate route lemma. If (d) and (f) need a regularity condition, state the condition the literature uses (for instance integrability of the lowest-type matrix coefficient of `π_λ`), not (G).

## R02 (P2) — Almost no target carries a locator, and five of the fifteen sampled targets cite no source

Without locators a reader cannot check a statement against the literature. Nor can they tell a published theorem from one that exists only in the formal development credited in the family index, which this README never cites. Across the 22 targets there are two theorem-level locators into outside sources: Kudla96 III.4 Propositions 4.1, 4.3–4.5 (3.9a) and GQT Theorem 7.1 (6.4a, wrongly; C01). There are a few section-level ones (Weil65 §§V–VI, Gan–Ichino §4, Harris–Kudla–Sweet §1, GQT §§7, 11), and no page numbers anywhere. Every other source is cited as a whole work, for example "(Mínguez08; R. Godement, H. Jacquet, LNM 260 (1972); A. Zelevinsky …)" for 3.47. 3.47c, 5.7b, 6.11 and 6.13c cite no source at all, and 3.46a's statement is sourced only through its remark.

The smallest change: give each cited result its theorem number and page, as MetaplecticAutomorphicForms does (for example "GanTakeda16, Theorem 1.2, PDF2"). For a target that appears in no publication, say so in the target, keep the route, and name where it is proved. If that is the formal development, cite it by declaration.

## R03 (P2) — The second Check of 3.47c says the sequence is unbounded exactly when ε₀ ≥ 2; it is unbounded exactly when ε₀ > 1, which includes ε₀ = 3/2

Half-integral `ε₀` is in scope. The definition in 3.47 (lines 464–466) puts no parity condition on `a − a′`, and the last Check of 5.7d (line 1439) says (c) holds without `a ≡ a′ (mod 2)`. The Check (lines 822–825) therefore misstates when the sequence of lemma 3 grows. By lemma 3, for `|r| > 1` the value has order `(|r|/q)^j`, and with `|r_V| = q^{ε₀}` this is `q^{(ε₀−1)j}`. For `r_{V′} = r_V⁻¹` the order is `q^{−(1−ε₀)j}`, with the same threshold. For `a = 4`, `a′ = 1` (`ε₀ = 3/2`, `N = 5`) the sequence grows like `q^{j/2}`, so it is unbounded although `ε₀ < 2`. I checked lemma 3 itself for `n = 1`, `N = 2`. The functional `l(φ) = ∫ φ̂(u, −1/u) ξ⁻¹(u) |u|⁻¹ d^×u` has the two laws. Its value on `1_{O²}(y·diag(ϖ^j, ϖ^{−j}))` is `C q^{−j} Σ_{e=−j}^{j−c} (q/ξ(ϖ))^e = x (qr)^{−j} Σ_{i=0}^{2j−c} r^i`, as stated.

The smallest change: "unbounded exactly when `ε₀ > 1` (`ε₀ ≥ 2` when `a ≡ a′ mod 2`)".

## C01 — 6.4a cites GQT Theorem 7.1 "in its range r > 0", but that theorem is the anisotropic case r = 0 only

The route paragraph (line 1516) offers "GQT Theorem 7.1 in its range `r > 0`". GQT §7.1, Theorem 7.1 (p. 33) is headed "Anisotropic case" and assumes `r = 0`. The rest of GQT §7 gives no Siegel–Weil formula for `r > 0` in the convergent range: Theorem 7.3 is the first-term range and Theorem 7.4 the range `m ≤ d(n)`. Drop that alternative and the "GQT §7" locator for `r > 0`. Cite instead the theorems of Weil 1965 (`m > 2d(n)`) and Ichino 2007 that cover `r > 0`, with locators (see the question below).

## C02 — 6.13c is stated for N = l·t, a hypothesis neither the statement nor its route uses

Line 1715 imposes `N = l·t`, and the Remark (line 1750) says a general `N` is not claimed. Route step (5) gives the exponent `−(N/2 + s)` for every `N`, and `l` never enters. Take `r = 0`, `N = 1`, `t = 2`, which is not of the form `l·t`. Then `ζ(ϖ^e) = q^{−(3/2)|e|}α^e` and `H^{s−1} = q^{−(s−1)|e|}`, and the integral is `(1 − q^{−(2s+1)})/((1 − αq^{−(s+½)})(1 − α⁻¹q^{−(s+½)}))`, exactly (ii). Would you state 6.13c for every `N ≥ 0` and mention `N = l·t` as the case the consumer uses?

## C03 — The Lean docstring says headline (2) lacks the coinvariants of a smooth representation; Mathlib has them

`Suggested.lean` lines 35–37 say that local matching "lacks, besides these, the coinvariants of a smooth representation". Mathlib at the pin has `Representation.Coinvariants` for any representation (`Mathlib/RepresentationTheory/Coinvariants.lean:57`). What is missing is the type-II Weil representation on Schwartz–Bruhat functions and normalised parabolic induction of `GL_N(F)`. Reword the sentence.

## C04 — 3.3b and 4.4a locate the Levi normalisation in Gan–Ichino §4; the formula is in §7.4

Gan–Ichino §4.1 (p. 12) only says that `(ψ, χ_V, χ_W, δ)` determines a splitting, citing Kudla and Harris–Kudla–Sweet. The Levi formula that 3.3b reads in the left-action convention, `ω(m_Q(a))φ(x) = χ_V(det a)|det a|^{m/2}φ(a*x)`, is displayed in §7.4 (p. 35). I checked that 3.3b's `χ_V(det(h|_Y))·|det(h|_Y)|^{−n/2}` on `V ⊗ Y` agrees with it. Cite §7.4, p. 35 for the formula (lines 62 and 899).

## C05 — Three statements restate results that roadmaps on main already state

- 3.46(i) (lines 284–286) and the first clause of 3.47b(ii) (line 664, a unique irreducible quotient of `Θ` and `Θ′`) are instances of archimedean Howe duality. MetaplecticAutomorphicForms §3.7 states it, applied here to compact pairs and to the trivial representation of `U(V)`.
- The unramified values in 6.11(b) and (c) are also stated by AutomorphicLFunctionsAndLocalFactorsPartII §2.3, besides the MetaplecticAutomorphicForms §6.11 the README credits.

Cite these. 6.11's own additions are (a) and the regions of absolute convergence. AutomorphicLFunctionsAndLocalFactorsPartII §2.3 works in the right-action convention, with `d_n(s, χ⁻¹)` and `BC(π^∨) ⊗ χ⁻¹`, against 6.11's `d_n(s, χ)` and `BC(α) ⊗ χ`. One sentence relating the two would prevent a convention mix-up downstream.

## C06 — The description says each sub-roadmap states its targets in the generality in which they hold

The description says each sub-roadmap "states as targets what that proof establishes, in the generality in which the statement holds". By the README's own account, 3.46a (under (G)) and 6.13c (for `N = l·t`) are narrower than that. The sentence becomes true once R01 and C02 are addressed; until then, qualify it.

## C07 — The second Check of 3.46 gives the paired weight with the wrong sign for the decomposition of ω

Line 327 says "the lifted weight `−w + (m_V − m_W)/2` of a weight `w`". From the same Check, `z^k` has weights `(−k − a, −k − b)` for `ε = −1` and `(k + a, k + b)` for `ε = +1`. In both cases the `U(d)`-weight paired with `U(n)`-weight `w` in `ω` is `w + (m_V − m_W)/2`. The formula `−w + (m_V − m_W)/2` is right only for the linear lift of a form of weight `w`. Say which is meant.

## N01 — The ids 3.3b and 6.11 coincide with the MetaplecticAutomorphicForms sections they extend

This README has both "6.11" and "MetaplecticAutomorphicForms §6.11" (line 1542), and ThetaLiftsForDefiniteUnitaryGroups 3.2 cites both side by side. A distinct id would avoid misreading.

## Questions for the author

- Do Li 1990 and Paul 1998 prove 3.46a (a), (b) and (e) for every `t ≥ 1` and all data of the stated shape? Paul treats equal and almost equal rank. Do (d) and (f) need an integrability hypothesis there? Both texts are behind publisher paywalls, so I could not check.
- Does Ichino 2007 (Math. Z. 255) prove the Siegel–Weil formula for `r > 0` with `d(n) < m ≤ 2d(n)`, the range 6.4a needs beyond Weil 1965? GQT p. 33 credits it only for the anisotropic case. The text is paywalled.

## Verified sound

| Statement | Instances tried | Values computed (README / mine) | Result | Change |
|---|---|---|---|---|
| 3.3b Levi, unipotent | `k = 1`, `m(A)` on `Y` with matrix `ᵗA⁻¹`; `n(b)` | `χ_V(det A)⁻¹|det A|^{n/2}φ(xA)` / same from `χ_V(det h|_Y)`; `B(x⊗y, −bx⊗y*) = −2b⟨x,x⟩` gives `ψ(b⟨x,x⟩)` | holds | C04 locator |
| 3.3b odd `n`, real place | `χ_V(z) = (z/|z|)^{m_V}`, `m_V` odd | `χ_V(−1) = −1 ≠ χ_V(1)`; both have `x/x̄ = 1` | holds | none |
| 3.21a (iii), Check `n = 0` | `n = 0`; convention against Atobe–Gan | segment `χ_V(ϖ)q^{(d−1)/2−i}`, `q` the residue cardinality of `E` / same; segment carries target's splitting character | holds | none |
| 3.21a Check, shifted exponents | `d = n + t` | `(n + 2t − 2)/2 − i` / `(2d − n − 2)/2 − i = (n + 2t − 2)/2 − i` | holds | none |
| 3.45 Checks | `N = 1`, Gaussian, `T = δ₀`, `P = z²` | vacuum norm 1; `dω(J)` eigenvalue `−i/2`; `[dω(J), d/du] = 2πiu`; `⟨ϑ_T, z²⟩ = −2^{1/4}/π`, `h₂(0) = −2^{−1/4}` | holds | none |
| 3.46 (iii), `n = d = 1` | `ε = ∓1` | `t^{−k−a}s^{−k−b}`, `a = (1 − m_W)/2` / same; paired weight `w + (m_V − m_W)/2` | holds | C07 |
| 3.46a Checks | `U(1) × U(1,1)`, `t = 1`; `λ = (1 | −1)` | weights `(i + ½ | −j − ½)`, `Λ((k|0)) = (k+½ | −½)`; `(r,s) = (3,0)`, `λ′ = ρ`, vacuum `(3/2 | −3/2)` | holds | R01 for (G) |
| 3.46a Check 3 | `q = s = 0` | `α_k = μ_k + (t+1)/2 + n − k` / HC parameter of 3.46(iii) summand after negation; tail `σ_t` | holds | none |
| 3.47 split matching | `k = diag(ϖ,1,…)`; `β` for `α` in `ω′` | factors `β(ϖ)q^{a/2}`, `α(ϖ)q^{−a′/2}`, ratio `ν(ϖ)q^{−N/2}`; central character ratio `ν^{−N}` | holds | none |
| 3.47 law of `P`, `P′` | `δ_P` for type `(a, a′)` | `|det A|^{a′/2}|det D|^{−a/2}` / `δ_P^{1/2}` | holds | none |
| 3.47b numerical Check | `a=3, a′=1, (2,1), (1,0), m_β=1, m_α=−5` | `L_± = 3`, `La = (−3,−3)⊗(1,−2)`, `Ω = 26 → 38`, gap `12`; `λ+ρ = (½, −3/2, −5/2, −7/2)` | holds | none |
| 3.47b (o) Casimir gap | general expansion | `Ω_n = Ω_V + Σ_s(Ω_{V⊗𝔭_s} − Ω_V − d) + Ω_{𝔭^{⊗n}}`; `d = P_W + Q_W = N` | holds | C05 for (ii) |
| 3.47b gap formula | general `La + β₁` | `Ω` change `= N − κ + P + P′ − Q − Q′` / same | holds | none |
| 3.47c lemmas 1, 3 | lemma 3 at `n=1, N=2`; lemma 1 orbits | `x(qr)^{−j}Σ r^i` / `Cq^{−j}Σ_{e=−j}^{j−c}(q/ξ)^e`, equal; stabiliser `diag(1_k, g₂)` forces `ξ(ϖ) > 0` | holds | R03 Check |
| 4.4a characterisation | role-of-(5) Check; double cover; density | `x ∈ E_v^1` (inert) not in `H`; `U(1)×U(1) → SO(2)` degree 1, no lift; split primes of `E` density 1 | holds | C04 locator |
| 5.6a Check | `U(1)` to `U(1,1)` | `𝒫(1,0;0,0)` weight `n′/2 = 0`; cusp form weight `|k| ≥ 1`; (R3) kills lowered lift | holds | none |
| 5.7b (iii) | vacuum weights, invariants | `(s′ − r′ + m_W)/2` from `det_J^{−1/2}`; `det^{−ℓ}` needs `r ≤ r′`, `det^{ℓ}` needs `r ≤ s′` | holds | none |
| 5.7c (L), datum laws | `μ = χ_W⁻¹`, `z₀ = n − d/2`; pairs of a datum | cone law `(χ_X/χ_W)|t|^{(d−n)/2}`; laws `β|t|^{a/2}`, `α|t|^{a′/2}`; `z₀ = ε₀`, `1 − z₀ = ε₀ + 1` | holds | none |
| 5.7d (d) branching | restriction to `U(1) × U(P_W−1)` | common type `La₁` at `c = s − L₊`, `U(1)`-weight `s + s′ = m_β` / weight of `χ_β` | holds | none |
| 6.11 (b), (c) | `n = 1` inert; `n = 1` split | `L_E(s+½,χ)/L_F(2s+1,χ|) = 1`; `(1 − X₁X₂)/((1−αX₁)(1−α⁻¹X₂))` / both computed | holds | C05 citation |
| 6.11 (b) route | substitution | `y = q^{n−1}X = χ(ϖ)Q^{−(s+½)}`; `(−q)^jX` gives `L_F(2s+n−j, χη^j)⁻¹` | holds | none |
| 6.13a (i) constant | GQT normalisations | `C = [E:F]/c` / GQT `I_{n,r} = τ⁻¹∫θ` (line 582), Thm 7.1 `E = c(τ/[E:F])I`, Prop 11.2 `[E:F]·Z` | holds | none |
| 6.13b (ii), (iv), (v) | `a ≤ 1`; `s = −n/2`; `n = 1` support | domination `|f a^{s−s₀}| ≤ |f a^{s₁−s₀}|`; `H^{s+n/2} ≤ 1`; `g ∈ K₁` | holds | none |
| 6.13c (i), (ii) | `N = 1, α = q^ρ`; `r = 1` Iwahori | sum `(1−q^{−2s−1})/((1−αq^{−s−½})(1−α⁻¹q^{−s−½}))`; `vol(IdI) = q^{|e|}`; exponent `−(N/2+s)` | holds | C02 |
| 6.13c, general `N` | `r = 0, N = 1, t = 2` | formula (ii) / same value, `N ≠ l·t` | holds | C02 |
| Headline 1 (3.21a) | as above | parameter `(cα, χ_V(ϖ)q^{(d−n−1)/2−i})`, `c = χ_V/χ_W` | holds | none |
| Headline 2 (3.47 irreducibility) | `ν` ramified or `ν(ϖ) ≠ 1`; `ν = 1` | segments unlinked as `α_w/β_w ∉ |·|^ℝ`; `ν = 1`: nested or different cosets | holds | none |
| Headline 3 (5.7a, 6.4a) | rank one; split `W` | growth `|l|^{dim W/2}` against `|l|^{−(m−1)}`: `m−1 > dim W/2`; `m − r > n = d(n)` | holds | C01 locator |
| Headline 4 (6.13a) | `n = 1` | `L^S(m/2, μ̃χ^{∓1})`, central exactly at `m = 1` | holds | none |
| Lean docstring | Mathlib at pin | "lacks coinvariants" / `Representation.Coinvariants` exists | wrong | C03 |

- Source locators checked: GQT Theorem 7.1 (p. 33), §7.2 Theorems 7.3–7.4 (pp. 34–35), Propositions 11.1–11.2 and Theorem 11.4 (pp. 53–54), definition of `I_{n,r}`; Gan–Ichino §4.1 (p. 12) and §7.4 (pp. 34–35).
- Library declarations opened at the pins: `MeasureTheory.Measure.ext_of_charFun` (`Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean:257`: finite measures, `[CompleteSpace E]`, `[SecondCountableTopology E]`, `[BorelSpace E]`), `Representation.Coinvariants` (`Mathlib/RepresentationTheory/Coinvariants.lean:57`), `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:105`), `IsNonarchimedeanLocalField` (`Mathlib/NumberTheory/LocalField/Basic.lean:46`), `TauCeti.HeisenbergGroup` (`TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean:58`), `TauCeti.hermiteFunction` (`TauCeti/Analysis/SpecialFunctions/Hermite/Function/Basic.lean:36`). Neither pin has a metaplectic cover, a Weil representation or smooth parabolic induction.
- Cross-roadmap citations resolved:
  - MetaplecticAutomorphicForms on main: §§3.3b, 3.7, 3.9, 3.21, 3.22, 3.35, 5.7, 6.4, 6.11, 6.13 read; the other cited sections exist.
  - SmoothRepresentationsOfLocalGroups: *l-sheaf-model*, *geometric-lemma*.
  - AdelicAlgebraicGroups §§3.1, 3.4, 3.5, 4.2; AutomorphicFormsOnReductiveGroups §§2.1, 2.2, 2.4, 4.1, 5.4; AutomorphicSpectralTheory §§1.1–1.4.
  - LFunctions Layer 7; RepresentationTheory/ClassicalGroups §6.1 and CompactGroups Layers 4–5; OrthogonalL2Bases A2–A3.
  - At their open heads: LocalFactorsOfTwistsAndTypes §§3.3, 3.4, 4.1; TensorInductionAndFiniteGroupInputs §7.1; HermitianFormsAndLattices §§2.1, 4.2, 6.5.
- Automatic checks: the worker's checks all passed at this head. The dependency check, rerun, reports `depcheck: 171 roadmaps, 1998 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there were no signatures to `#check`.
- Ownership: this roadmap owns the unitary-pair theory that MetaplecticAutomorphicForms lacks. Its §3.9 (persistence) is orthogonal–symplectic only, §3.21 cites orthogonal–symplectic sources, and §3.35 is `SL₂ × O(p, q)`.

Overlap check: I read ThetaLiftsForDefiniteUnitaryGroups, RowTowerAndRallisIdentities, SeesawForThetaChains, ThetaChainsOnDefiniteUnitaryGroups and MetaplecticAutomorphicFormsPartII (open), and MetaplecticAutomorphicForms and AutomorphicLFunctionsAndLocalFactorsPartII (main). Shared objects and owners:
- the Rallis formula for definite pairs: owned here; ThetaLiftsForDefiniteUnitaryGroups 3.2 states it as the definite instance of 6.13a;
- the unramified doubling value: owned by MetaplecticAutomorphicForms §6.11 and AutomorphicLFunctionsAndLocalFactorsPartII §2.3 (C05);
- archimedean Howe duality: owned by MetaplecticAutomorphicForms §3.7 (C05);
- everything else the theta-chain roadmaps share with this one: they cite this roadmap as owner;
- MetaplecticAutomorphicFormsPartII (finite fields): nothing shared.

Source independence: I compared 7 passages with 2 sources, GQT (Theorems 7.1, 11.4, Proposition 11.1, §11.6) and Gan–Ichino (§§4.1, 7.4); they share nothing beyond forced formulas. No source has a meaningful share of the locators: the README has two theorem-level locators in all, and by bare citation GQT leads with 7 mentions. Contents compared with GQT §§1–11: independent. The layer numbering 3–6 follows MetaplecticAutomorphicForms, which is a roadmap, not a source.

Research link: the targets are the local and global theta theory of unitary dual pairs (Howe 1989; Kudla 1994; Harris–Kudla–Sweet 1996; Ichino 2007; Gan–Qiu–Takeda, arXiv 2012) on which ThetaLiftsForDefiniteUnitaryGroups and the theta-chain roadmaps rest. This rests on the README (overview, Downstream consumers) and on GQT §§7 and 11, which I read.

## Not verifiable

- Harris–Kudla–Sweet 1996 (J. Amer. Math. Soc.): the DOI resolves to an AMS page on a host the sources service does not classify, so I did not read it.
- Kudla 1994 (Israel J. Math.), Rallis 1982 (Amer. J. Math.), Kudla–Rallis 1994 (Ann. of Math.), Rallis 1987 (LNM 1245), Piatetski-Shapiro–Rallis 1987, Godement–Jacquet 1972, Bargmann 1961, Paul 1998, J.-S. Li 1989/1990/1992, Ichino 2004/2007, Yamana 2014, Tate 1950: not fetched. The README gives no locator in them to check.
- Howe 1979 and 1989 (two papers), Kashiwara–Vergne 1978, Mínguez 2008, Zelevinsky 1980, Vogan–Zuckerman 1984, Rallis 1984 (two papers), Weil 1965, Li–Liu 2021, Kudla96: not fetched, for the same reason.
- 3.46a (statement), 3.47c, 5.7b, 6.11, 6.13c: no source cited, so there was nothing to check.
- The formal development credited in the family index: not cited by this README, and not read.

## Source issues

- none

## For the human reviewers

- Scope: theta correspondence for unitary pairs is mainstream (Howe, Kudla, Rallis, Gan–Qiu–Takeda). However, 3.46a under (G), 3.47c, 5.7d and 6.13c appear in no cited publication. The family index (lines 9–14) names a formal Lean development announced 20 November 2026 as its source; this README never cites it.
- Licence: Harris–Kudla–Sweet 1996 could not be read because the sources service does not classify the AMS host. GQT was read from an operator-held copy of arXiv:1207.4709v3.
- Not tested: the wording and contents comparison covered only GQT and Gan–Ichino, the two texts read; the README's other sources were not compared.
