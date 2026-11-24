# Review of LubinTateFormalModulesAndQuasiCanonicalLifts (pull request #3027 at dd70a50)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 232 changed lines since `74a09b7`. The three added sections (§4.2a, the functional-equation lemma in several variables; §4.2b, the Dieudonné–Dwork lemma in several variables; §4.3a, quasi-logarithms and the Dieudonné module) and the passages that mention them (Conventions, the layer guide, the introduction of Layer 4, scope, supplier contracts, references) were recomputed and read against Haz79, KR11 and BW16; both findings of the previous review are repaired and no finding remains. There is one small correction and no format note: the consumer of §4.2b in this pull request still describes it as the `ℤ_p` case. Katz's paper (K81), on which §4.3a (i) rests, could again not be read, and the status of its link is left to the human reviewers.

## C01 — HodgeTateLatticesAndLubinTateLogarithms §3.3 still describes §4.2b as "the case `K = ℚ_p`, `σ = id`" of its own first statement, although §4.2b now states that statement in full

A reader of the two roadmaps is told that the Frobenius-lift form of Dwork's lemma lives only in the family's roadmap, when §4.2b at this head (README lines 1391–1398) states it for every field of characteristic zero with a nonarchimedean absolute value of residue characteristic `p` and every lift `σ`, without completeness, which contains the first statement of §3.3 there (complete `K`, the same `σ`). The stale description stands in three places of `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HodgeTateLatticesAndLubinTateLogarithms/README.md`: the `*Origin:*` label of 3.3 (line 699), the Dependencies of Layer 3 (line 843) and the supplier contract for §4.2b (line 889).

Nothing changes in this folder. In that README, the first statement of 3.3 would carry `*Corollary of:* LubinTateFormalModulesAndQuasiCanonicalLifts §4.2b`, as 3.2 (a) and 3.4 (a) do for §§4.2a and 4.3a, and the three descriptions would read "the Dieudonné–Dwork lemma in several variables with a Frobenius lift, which is the first statement of 3.3"; the relation `≃` stays particular to that roadmap.

## Questions for the author

- Does K81, (5.3.1)–(5.3.2), identify the quotient of the quasi-logarithm module by the invariant differentials with the tangent space of the Cartier dual, as §4.3a (i) states (lines 1489–1490), or with `Ext(G, Ĝ_a)`, the tangent space then needing a second locator? The statement is the standard Hodge filtration and agrees with the computed cases below; no legal copy of K81 could be read to check the locator.

## Previous findings

- R01 — repaired: §4.3a (ii) now reads "let `K/ℚ_p` be a finite extension with uniformizer `π` and residue field of cardinality `q`, let `n ≥ 1`, and let `H` be the standard formal `O_K`-module of height `n`", with the basis `log_H, π^(−1)·log_H(X^q), …` over the integers of `K̂^ur` (BW16 line 345–347), and keeps `ℓ_s`, `g₀` as the case `K = ℚ_p`, `n = 2`, `π = sp`.
- R02 — repaired: §4.2b now reads "a series `γ ∈ K[[X]]` with constant term `1` lies in `O[[X]]` if and only if `γ^σ(X^p)/γ(X)^p ∈ 1 + p·O[[X]]`" for `K`, `O`, `σ` as in the first Check of §4.2a, with the route through §4.2a (ii), (iii), a negative control for `σ = id`, and §4.2a in its *Needs:*. The consumer's description of §4.2b was not updated (C01).
- C01 — repaired: the description now lists "LubinTateFormalModulesAndQuasiCanonicalLifts §4.3a (i) for one-dimensional formal group laws over complete noetherian local rings" among the exceptions and describes §4.2b as stated for a Frobenius lift on the valuation ring of any nonarchimedean field of characteristic zero and residue characteristic `p`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §4.2a hypotheses against Haz79 (2.1)–(2.2) | `S ⊂ Q`, `𝔞`, `τ`, `q`, `s_i` | source: `p ∈ 𝔞`, `σ(b) ≡ b^q`, `σ^r(s_i(j,k))·𝔞 ⊂ B` (Haz79 line 51–60); README: the same three | agree | none |
| §4.2a (i)–(iv) against Haz79 (2.5)–(2.8) | `f` in `m`, `f̄` in `n` variables | (2.5) law, (2.6) `f^(−1)(f̄)`, (2.7) `D(f(h))`, (2.8) congruence iff, `α` over `B`, `β` over `L` (line 84–95) | agree | none |
| §4.2a first Check | `S = O`, `𝔞 = pO`, `τ = σ²`, `q = p²`, `s_1 = p⁻¹`; `ℓ₁` | `σ²(b) ≡ (b^p)^p`; `τ^r(p⁻¹)·pO = O`; at `X^(p^(2j))`: `p^(−j) − p⁻¹·p^(−(j−1)) = 0`, so `D(ℓ₁) = X` | holds | none |
| §4.2a second and third Checks | `u = p − T²`; `g = X + X²/p`, `p = 2, 3` | `(p − T²)⋆g = pg − g^(σ²)(X^(p²)) = p·D(g)`; `D(g)` at `X²`: `1/p` since `p² ≥ 4`; §4.2 gives `XY`: `−2/p`, `p = 2`: `X²Y²` | holds | none |
| §4.2a route congruence | `x = y + a`, `a ∈ 𝔞^r`; `p = 2`, `r = 1` | binomial terms `p·a^k ∈ 𝔞^(1+r)`, `a^p ∈ 𝔞^(rp) ⊂ 𝔞^(r+1)`; `p = 2`, `r = 1`: `2ya + a² ∈ 𝔞²` | holds | none |
| §4.2b, `D(log(1+X))` | odd `p`; `p = 2`, `m = 1, 2` | at `X^(pm)`: `((−1)^(pm+1) − (−1)^(m+1))/(pm)`; odd `p`: `0`; `p = 2`: `m = 2` gives `0`, `m = 1` gives `−1`; `p ∤ n`: `±1/n ∈ ℤ_(p)` | integral | none |
| §4.2b both directions | `γ` integral; quotient in `1 + pO[[X]]` | `D(log γ) = −p⁻¹·log(γ^σ(X^p)/γ^p)`; (iii) with `h = γ − 1`; (ii) with `f̄ = log γ` gives `γ − 1`; `τ^r(p⁻¹)·pO = O` | holds | none |
| §4.2b two forms | `k = 1, 2, p`; `p = 2` | `v_p(p^k/k!) ≥ k − (k−1)/(p−1) ≥ 1` (`p = 2`: binary digit sum of `k`); `v_p(p^k/k) = k − v_p(k) ≥ 1` | equivalent | none |
| §4.2b Checks 1, 2 | `ϑ = X_1`; Artin–Hasse | `X_1^p − pX_1`, coefficient `1` at `X_1^p`; `1/p!` has absolute value `|p|⁻¹`; telescoping sum `= −pX_1` | holds | none |
| §4.2b Check 3 (negative control) | `W(𝔽_(p²))`, `ζ` of order `p² − 1`, `p = 2`: order 3 | `ζ^p ≠ ζ` in `𝔽_(p²)`; `(1+ζX)^p ≡ 1 + ζ^pX^p`; with `σ`: quotient `≡ 1`; with `id`: `1 + (ζ − ζ^p)X^p` mod `p` | holds | none |
| §4.2b against sources | Haz79 §3; KR11 Lemma 1, §4 | Haz79: one variable, completed maximal unramified ring, Frobenius, from (2.6)–(2.7) (line 107–113); KR11: `ℤ_p`, `d` variables (line 506), exponential form (line 753–760) | as cited | none |
| §4.3a definition against BW16 Def. 2.3 | `c·ℓ_F`; integral `f` | `ℓ_F′·∂_Y F(X,0) = 1`, so `(cℓ_F)′` integral, defect `0`; BW16: no constant term, `δg` and `dg` integral, modulo integral series (line 313–329) | agree | none |
| §4.3a (i) | `Ĝ_m` over `ℤ_p`, `h = 1`; `f = log(1+X^p)/p` | rank `h − 1 = 0`; `f′ = X^(p−1)/(1+X^p)`; `f − log(1+X) = p⁻¹·log((1+X^p)/(1+X)^p)` integral, class `1·log(1+X)` | consistent; K81 not read | none |
| §4.3a (ii), type and action (seeded 4.3a, 4.2) | `K`, `π`, `n`; `n = 1`; `K = ℚ_p`, `n = 2`, `π = ±p` | `π·log_H − log_H(X^(q^n)) = πX`; `(π − T^n)a = a(π − T^n)` for `σ = id`; `(sp)⁻¹ℓ_s(X^p) = s·g₀`; `n = 1`: basis `log_H`, rank 1 | holds | none |
| §4.3a (ii), basis elements | `π⁻¹log_H(X^(q^k))`, `1 ≤ k < n` | derivative coefficient `q^(in+k)/π^(i+1)`, valuation `≥ in + k − i − 1 ≥ 0`; BW16 Lemma 2.5 over the completed unramified ring (line 293–297, 345–347) | holds; as cited | none |
| §4.3a Checks 1, 2 | `g₀`, `β·ℓ_s`, `β ∈ W(𝔽̄_p)[1/p]` | `g₀` has `1/p` at `X^p`, `ℓ_s` only degrees `p^(2j)`; `(βℓ_s)′(0) = β`; `β(sp)^(−j)` unbounded for `β ≠ 0` | holds | none |
| §4.2 (seeded; cited by §§4.2a, 4.3a) | `log(1+X)`, type `p − T`; `X + X²/p` at `p = 2` | `p·log(1+X) − log(1+X^p)` at `X^(pm)`: `p·D` above, in `pℤ_(p)`; `XY`: `−2/p`, `p = 2` gives `−1`, README uses `X²Y²` there | holds | none |

- Source locators checked against the text: 10. Haz79 §2 (2.1)–(2.8) (Haz79 line 51–96) and §3, p.75 (line 97–113); KR11 Lemma 1 (line 506), §4 (line 752–762) and its citation of Lang, ch. 14, p.76 (line 64, 504, 1640); BW16 §2.3 (line 286–298), Definition 2.3 (line 318–329), Proposition 2.4 (line 341–342), Lemma 2.5 (line 345–347).
- Library declarations opened at the pin: Mathlib `PowerSeries.substInv` (`Mathlib/RingTheory/PowerSeries/Substitution.lean:457`), `PowerSeries.substInvOfIsUnit` (`:567`), `MvPowerSeries.subst` (`Mathlib/RingTheory/MvPowerSeries/Substitution.lean:217`), `PowerSeries.exp` (`Mathlib/RingTheory/PowerSeries/Exp.lean:50`), `PowerSeries.derivative` (`Mathlib/RingTheory/PowerSeries/Derivative.lean:50`).
- Cross-roadmap citations resolved: FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.7, R07.1.12, R07.1.13, R07.1.14, R07.1.15 on `main` (its README lines 540, 754, 814, 841, 871); RamificationOfCompleteDiscretelyValuedFields §4a.3 on `main` (line 906); HodgeTateLatticesAndLubinTateLogarithms §§3.2–3.5 at this head cite §§4.2a, 4.2b, 4.3a (C01).
- Record: the README at the merge base against the head: 0 layers or items removed, 0 ids retitled, 3 sections added (4.2a, 4.2b, 4.3a); `Suggested.lean` unchanged.
- Dependency check: `depcheck: 131 roadmaps, 1463 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`: 8 warnings, all `declaration uses sorry`; the change adds or alters no Lean declaration, so the one-tactic probe and the signature comparison had nothing new to test.
- The pull request's text: its sentences on §4.2b and §4.3a (i) agree with the head; files changed outside the folder all lie in the folders the pull request owns.

Overlap check: read HodgeTateLatticesAndLubinTateLogarithms, FiniteFlatGroupsAndIntegralPadicHodgeTheory and BordismFormalGroups; the functional-equation lemma, the Dieudonné–Dwork lemma with a Frobenius lift and the quasi-logarithm basis are shared with HodgeTateLatticesAndLubinTateLogarithms §§3.2–3.4, owner this roadmap (§§4.2a, 4.2b, 4.3a), cited there as corollaries for 3.2 and 3.4 and with a stale label for 3.3 (C01); the Cartier dual, its tangent space and the Dieudonné equivalence are owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory and cited; nothing shared with BordismFormalGroups.

Source independence: changed passages only; 9 passages compared with 3 sources (Haz79, KR11, BW16), none shared beyond formulas and hypothesis lists that the mathematics forces; largest share Y95, 24 of 114 locators, and within the changed passages K81 and BW16, 4 each, K81 not read; contents not compared, since the change adds, removes or reorders no layer.

Research link: §§4.2a–4.2b are Hazewinkel's functional-equation lemma (1978, 1979) and the Dieudonné–Dwork criterion as Krattenthaler and Rivoal (2011) use it; §4.3a (ii) is Hopkins and Gross (1994), Proposition 13.8, used by Boyarchenko and Weinstein (2016); Layers 6–8 serve Gross (1986), Yu (1995), Burungale–Kobayashi–Ota (2021). Rests on the README's references and on Haz79, KR11, BW16 as read.

## Not verifiable

- K81, §5.1 p.193, Theorem 5.2.1, (5.3.1)–(5.3.2), Theorem 5.3.3: the sources service refused the README's link as not shown to be an author's page; no other legal copy.
- HG94, Proposition 13.8: not read; the statement was checked in BW16, Lemma 2.5, which attributes it to HG94.
- Haz78, I.2, II.10 and §2: a book with no legal copy reached; the statement was checked in Haz79 §2, which sends the reader to sections 2 and 10 of that book for the proof.
- Lan80, chapter 14, p.76: paywalled; the locator agrees with KR11's citation of it.

## Source issues

- none

## For the human reviewers

- Licence: the README links K81 to a file under web.math.princeton.edu/~nmk/ (README line 2847), apparently Katz's own page; the sources service could not confirm it as an author page, and the text was not read.
- Not tested: K81 shares the largest count of locators in the changed passages (4, with BW16); its text was not read, so the wording of §4.3a against it and the locators of §4.3a (i) were not checked.
