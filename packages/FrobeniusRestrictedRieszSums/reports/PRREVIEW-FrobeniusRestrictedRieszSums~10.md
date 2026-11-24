# Review of FrobeniusRestrictedRieszSums (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FrobeniusRestrictedRieszSums/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 246 changed lines since `aecb53a`. The change adds labels (`*Origin:*`, `*Method of the formal proof:*`, `*Corollary of:*`), two supplier contracts and reworded attributions. It changes no statement, heading or Lean declaration. I checked the two corollary claims and the new contracts against QuasiRiemannHypothesis §5.4, AnalyticNumberTheoryPartI §1.4e, ZerosOfLFunctions §8.6a and RieszSumsOverPrimesAndExceptionalZeros §1.4i at this head, and the method labels of 0.2, 0.4, 0.7, 0.8 and 0.8a against the Lean source of the formal proof. None of them is false. Accepted with no findings: two small corrections (one sentence of the description that this folder contradicts, and a Check that makes a supplier's theorem conditional) and one format note, none blocking. One scope fact is left for the humans who approve.

## C01 — The description says that every section stating something to prove carries two labels; five sections of this folder carry one

The description's account of the family says: "Each section that states something to prove now carries two labels". In this folder five sections state facts to prove but carry only `*Origin:* definitions and conventions`, as the README's Labels paragraph (line 122) says they do: 0.1 (API (i)–(iv), with Hilbert reciprocity in (iv)), 0.3 (Lemma (a)–(e)), 0.5 (Statements (i)–(iv)), 0.6 (Lemma (i)–(v)) and 0.9 (Lemma (i)–(vi)). A reader who goes by the description will look for a method label there and not find one. The sentence would be right as: "Each section carries an `*Origin:*` label. Each section that states something to prove, except the sections of definitions together with the elementary facts they state, also carries `*Method of the formal proof:*`."

## C02 — The third Check of 1.4 presents a theorem of AnalyticNumberTheoryPartI as a hypothesis

The Check (line 1025) now opens "If the bound of AnalyticNumberTheoryPartI §0.34 holds". On main, AnalyticNumberTheoryPartI §0.34 states that bound as a theorem (`landau_siegel_exclusion`, with a complete route through §§0.34a–0.34c). The sibling RieszSumsOverPrimesAndExceptionalZeros §1.4i (c) uses it with no condition. The conditional suggests to a reader that the supplier only assumes the bound. The implication itself is true: with `(1 − β) log q ≥ c_LS` and `log q ≤ (log y)^α`, the exceptional term is at most `(2/c_LS)(log y)^α·y·exp(−c_LS (log y)^{1−α})`, which is absorbed with `y₀` depending on `α` alone. There are two possible repairs. One restores the assertion ("AnalyticNumberTheoryPartI §0.34 (…) gives the conclusion of (b) …") and keeps the new clause "which assumes no such bound". The other, if the hedge is there because §0.34 rests on a preprint that has not been refereed, says so in those words.

## N01 — The method label of 0.7 gives no locator into [FormalProof]

Every other method label stands beside a Sources line that names a file of the formal proof; the Sources line of 0.7 names none. The argument the label describes is `UpperTheory.BernoulliSumsFrobeniusOrbits.topsGroup` (selection probability `δ` on `A₀` and `3δ/4` on the other cosets) in `Development/AutomorphicArithmetic/ThickFrames/topsGroup.lean`. Its single-functional step is `UpperTheory.BernoulliSumsFrobeniusOrbits.select` in `select.lean` of the same folder. These names are from commit `e50d098` of the repository; the README's locators refer to commit `40e56ba`. Naming them would let a reader check the label.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.1 (sampled; Origin label only) | `E = ℚ(√−3, √−7)`; `E = ℚ(i)` | `f = 2`, `E/F` unramified at all finite places; `f = 1` odd, `E/F` ramified at 2: agrees with (iv) | holds | none |
| 0.2, *Corollary of* QuasiRiemannHypothesis §5.4 | `E = ℚ(ζ₅)` at levels `N = 5, 10` | §5.4: four primitive characters of conductor dividing 5; `(ℤ/10)^× ≅ (ℤ/5)^×`, so the same primitive characters at both levels; injective | holds | none |
| 0.2 method label | `N = 12`, `p = 2`, `N′ = 3` | `I₂ = {1, 7}`: `σ₇` fixes `ζ₃`, moves `i`; `Fr(2) = {5, 11}`: `σ₅` fixes `i`, `ζ₃ ↦ ζ₃²`; matches `mem_localUnits_iff`, `isFrobUnit_iff` | holds | none |
| 0.3 (sampled; Origin label only) | `E = K = ℚ(i)`, `d = 2` | `I₂ = G = {1, c}`, `σ₂ = c ∉ Φ = {1}`; inert-free up to 2, not up to 3 (3 inert) | holds | none |
| 0.4 method label | `d = 526679`, `q = 19`, `n = 2` | `d ≡ 7 (mod 16)`, `7² ≡ 1`, so `d^k ≡ 7 ≢ ±1 (mod 16)` for odd `k`; `−d ≡ 1 (mod 8)`; `19 ∣ d + 1` | holds | none |
| 0.4, model field of the formal proof | `UpperTheory.Top.IsChiField` | fixed group: `a ≡ ±1 (mod 2^{e+2})`, `ψ(a) = 1`, `(a/q) = (a/d) = 1`: the kernel of the label's homomorphism | holds | none |
| 0.7 method label | `topsBase` → `topsFrame` → `topsGroup` → `select` | probability `δ` on `A₀`, `3δ/4` elsewhere; mean of `ΣY²/D² + B/(4m)` is `≤ 1`; a subset at or below the mean | holds | N01 |
| 0.8 method label | `sphere_rel`; the base in `ThickExists.lean` | base `4·L·d`; equal norms give `i(i − j)‖v₃ − v₁‖² = 0`, with `i ≠ 0`, `i ≠ j` | holds | none |
| 0.8 headline | `M = L = 2`; `i = 1, j = 2` | `T = {0} ⊂ [0, 1/4)`; lower bound `2^{−C} ≤ 1`; the relation makes `s₂` the midpoint (a 3AP) | holds | none |
| 0.8a method label | `L = 5`, `M = 100` | `\|(i₃−i₁)(s₂−s₁)\| ≤ 4·4 = 16 < 25 = M/4`; for `ord h ≤ 20`, `\|ord h·(s−s′)\| ≤ 80 < 100` | holds | none |
| 0.8b method label | positions `i`, `h = φ_A` | `(yφ^i)_A = y_A h^i`: three thick letters in `L` positions give three points of `u₀𝒯`, against 0.8a (a) | holds | none |
| 0.9 (sampled; Origin label only) | `(19, 526679)`, `B = 12` | `d + 1 = 2³·3²·5·7·11·19`, `v₂ = 3`; `13 ∤ d + 1`, so `B < 13` | holds | none |
| 1.1 (sampled) | `E = K = ℚ(i)`, `w ≡ w₀` | `ℛ − 𝔐 = w₀(G₁ − G_{χ₋₄})(a/w₀)`; at `n = 2` the mean of `2·𝟙[g ∉ Φ]` is `1 = 1 − χ₋₄(2)` | holds | none |
| 1.2 headline | `E = K = ℚ(i)` | `ℭ = w₀(G₁ + conj χ₋₄(c)·G_{χ₋₄}) = w₀(G₁ − G_{χ₋₄}) = ℛ − 𝔐` | holds | none |
| 1.4 method label (integral identity) | `χ = 1`, `χ ≠ 1` | `∫₁^∞(ψ(u) − u)u^{−2}du = −1 − γ`, so `G₁(y) = −y∫_y^∞(ψ − u)u^{−2}du`; for `χ ≠ 1`, `−L′/L(1, χ) = ∫₁^∞ψ_χ u^{−2}du` | holds | none |
| 1.4 (b), *Corollary of* AnalyticNumberTheoryPartI §1.4e | `log N ≤ (log u)^α`, `α ≥ 1/2` | exponent `≥ (c/2)(log u)^{1−α}`; exceptional term `≤ 2y^{1−c_ex}/c_ex`; the tail integral keeps the saving | holds | none |
| 1.4, third Check | `(1 − β) log q ≥ c_LS` | term `≤ (2/c_LS)(log y)^α·y·e^{−c_LS(log y)^{1−α}}`; `y₀` depends on `α` alone | holds | C02 |
| 1.5 (sampled) | `G = A₀ = ℤ/2`, `χ` nontrivial | `Σ_{u∈A₀}χ(gu) = χ(g)(1 − 1) = 0`; for trivial `χ`, `2χ(g)` | holds | none |
| 1.6 method identity (sampled) | `A = ℤ/4`, `A₀ = {0, 2}`, `S = {0, 1, 2}`, `χ = (−1)^a` | `Σ_α χ(α)#(S ∩ αA₀) = 2 − 1 + 2 − 1 = 2`; `\|A₀\|·Σ_{τ∈S}χ(τ) = 2·(1 − 1 + 1) = 2` | holds | none |
| 1.7 (sampled) | `𝒯 = ∅` | `δ_th = 0`; the conclusion reads `Err ≥ −2\|Φ_top\|mb/x`; the method label follows the route step by step | holds | none |
| 1.9 headline | `o = 1`, `o = 4` | `ν̂₀(κ) = (1/4)/(1 + 3(o − 1)/4) = 1/(3o + 1)`: `1/13` at `o = 4`; at `o = 1`, `𝔜 = G₁` | holds | none |
| Contract: AnalyticNumberTheoryPartI §1.4e | supplier at this head | both: `c, c₁` absolute, `N ≥ 3`, error `X e^{−c log X/(√log X + log N)}(log N)^4`, window `(1 − c₁/log N, 1)` | agree | none |
| Contract: ZerosOfLFunctions §8.6a | `K = ℚ` | `EK(ℚ) + 1 = γ + 1`, the constant of `G₁`; for `χ ≠ 1`, `L′/L(1, χ)`, the constant of `G_χ` | agree | none |
| Contract: RieszSumsOverPrimesAndExceptionalZeros §1.4i | supplier at this head | head: (c′) "this roadmap's own", (b′) the formal proof's statement; the contract says the same | agree | none |
| Labels paragraph | headings 0.1–1.9 | Origin label only on 0.1, 0.3, 0.5, 0.6, 0.9; both labels elsewhere; *Corollary of* lines on 0.2 and 1.4 | agree | none |

- Source locators: none of the five external texts the changed labels cite was readable this round (paywalls or network errors). Formal-proof locators opened at commit `e50d098`: fourteen files (`PrimRead`, `GaloisMapComplexConjugation`, `GaloisToProductIsIso`, `ExistsPageN`, `HostThickExists`, `ThickExists`, `ThickFrames`, `topsBase`, `topsFrame`, `topsGroup`, `select`, `Analytic`, plus `MainSup` and `ExplicitFormulaErrorOfHostConditions` for the Sources lines).
- Cross-roadmap citations resolved at this head: QuasiRiemannHypothesis §5.4; AnalyticNumberTheoryPartI §§0.34, 1.4e; ZerosOfLFunctions §8.6a; RieszSumsOverPrimesAndExceptionalZeros §1.4i (a)–(c′); QuadraticTwistSelectionOverPrimes §§2.7c, 2.7d (ii′). §1.4e and §8.6a are added by this pull request; the rest are on main. None of the three cites this roadmap back.
- Library declarations: the change cites none. `Suggested.lean` is unchanged (0 declarations added, removed or restated).
- Record: the README at `aecb53a` against this head: 0 layers or items removed, 0 ids retitled, 0 headings added.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1469 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `sorry` warnings and nothing else.
- Ownership: the change adds no object, so ownership against open work is as on main.
- Overlap check: read ThetaChainsAndFrobeniusPrimeSums (a consumer, on main), QuadraticTwistSelectionOverPrimes (supplier of §§2.7c–2.7d, on main), SidonSetsAndLinearEquations (open) and FourierAnalyticAdditiveCombinatorics (open). Nothing is shared with the change. SidonSetsAndLinearEquations §4.2 (Behrend's construction for one convex equation) is a different statement from 0.8 here (all relations of length `L` at once), and 0.8 is on main and untouched.

Source independence: changed passages only; 16 passages compared (the labels of 0.2, 0.4, 0.7, 0.8, 0.8a, 0.8b, 1.1, 1.2 and 1.4–1.9, the Labels and Corollaries paragraphs, two supplier contracts) with 3 sources (the formal proof's Lean source, [Announcement], the suppliers' text), none shared; largest share [FormalProof], 29 of 42 locators; contents not compared (no layer added, removed or reordered); Ihara–Murty–Shimura, Davenport, Washington, Behrend and Ruzsa not read.

Research link: this roadmap is the analytic frame of the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge on 20 November 2026 ([Announcement], [FormalProof]). Its 1.9 reduces a square-root bound for the cyclic family to the Frobenius-restricted inequality of ThetaChainsAndFrobeniusPrimeSums, with tools from Behrend (1946) and de la Vallée Poussin, Landau and Page. This line rests on the README.

## Not verifiable

- Ihara, Murty and Shimura 2009 (§2.2, Theorem 1, formula (2.2.1), p. 257), cited in the Origin label of 1.2: the DOI landing page failed (HTTP 502) and the cache has no copy.
- Davenport, *Multiplicative Number Theory*, 3rd ed., chapters 19–20 (Origin labels of 1.2 and 1.4): a Springer book with no legal open copy.
- Washington, *Introduction to Cyclotomic Fields*, chapters 3 and 14 (Origin label of 0.2): a Springer book with no legal open copy.
- Behrend 1946 (Origin labels of 0.8 and 0.8a): the publisher's page refused the sources service (HTTP 403); not read this round.
- Ruzsa 1993 (Origin label of 0.8): the publisher's page is on a host in no licence class, and the arXiv search was rate-limited; not read.
- [FormalProof] was read in the operator's copy at commit `e50d098`, not at the first commit `40e56ba` that the README names; the method labels were checked at `e50d098`.
- The claim that [FormalProof] has 1.5 only at the instance used in 1.7 (Labels paragraph) is a negative claim about the whole proof; not checked.

## Source issues

- none

## For the human reviewers

- Scope: the principal source is [FormalProof], a Lean proof announced on 20 November 2026 ([Announcement]) with no refereed publication. The new Origin labels mark 0.4, 0.8b, 1.1, 1.7, 1.8 and 1.9 as resting on it alone.
