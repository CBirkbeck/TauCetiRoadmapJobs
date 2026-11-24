# Review of LubinTateFormalModulesAndQuasiCanonicalLifts (pull request #3027 at 0b5086d)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 206 changed lines since `aecb53a`. The review covers the three new sections (§4.2a, the functional-equation lemma in several variables; §4.2b, the Dieudonné–Dwork lemma in several variables; §4.3a, quasi-logarithms) and the passages they touch. Those are the Conventions, the layer guide, the scope, the supplier contracts and the references, read against Haz79, KR11, BW16 and H70 and against FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.7 and R07.1.12–R07.1.15 on `main`. Every statement the change adds is true. Two state only a special case of the published theorem they cite, which makes two findings. §4.3a (ii) gives the Gross–Hopkins basis of quasi-logarithms only for height two over `ℤ_p`, and §4.2b gives Dwork's lemma only over `ℤ_p` without a Frobenius lift, which its consumer HodgeTateLatticesAndLubinTateLogarithms §3.3 therefore states for itself. There is one small correction to the description and no format note. The human reviewers are asked to settle the status of the link to Katz's paper, which could not be read.

## R01 (P2) — Clause (ii) of §4.3a gives the basis of quasi-logarithms only for the height-two `ℤ_p`-module, although the lemma it rests on, which its own proof route restates, holds for the standard formal `O_K`-module of every height over every finite `K/ℚ_p`

An implementer who follows the route has to prove the general lemma, but no target states it, so the library records only a special case, and a special case is what a Check is for. BW16, Lemma 2.5 (BW16 line 345–347), with the standard module of BW16 §2.3 (BW16 line 286–296), gives the basis `log, π⁻¹·log(X^q), …, π⁻¹·log(X^(q^(n−1)))` over `O_K̆` for every finite `K/ℚ_p` and every `n ≥ 1`. The README restates exactly this in the route (lines 1490–1497) and then states only "the case `K = ℚ_p`, `n = 2`, `π = sp`". The general clause is statable with what the roadmap already builds. The law and the `O_K`-action of the standard module are integral by §4.2a (i)–(ii) with `S = O_K̆`, `𝔞 = πO_K̆`, `s_1 = π⁻¹` and `τ` the `n`-th power of the `q`-Frobenius: then `D(log) = X` and `D(a·log) = aX`. They are also integral by §4.2 with type `π − Tⁿ`.

The smallest change is to state (ii) for a finite `K/ℚ_p` with uniformizer `π` and residue cardinality `q`, and `n ≥ 1`. The standard formal `O_K`-module of height `n` over `O_K̆`, with logarithm `Σ_(i≥0) X^(q^(in))/π^i`, has `QLog` free with that basis (BW16, Lemma 2.5; HG94, Proposition 13.8). The present text on `ℓ_s` and `g₀` stays as its case `K = ℚ_p`, `n = 2`, `π = sp`, so that HodgeTateLatticesAndLubinTateLogarithms §3.4 still finds what it cites ("its clause (ii), the basis `ℓ_s`, `g₀`", line 728 of that README at this head). The Conventions clause "its clause (ii) over `W(𝔽̄_p)`" then reads `O_K̆`.

## R02 (P2) — §4.2b gives the Dieudonné–Dwork lemma only over `ℤ_p` with trivial Frobenius, although §4.2a gives it at once over every characteristic-zero valuation ring with a Frobenius lift, which is the form its consumer needs and so states for itself

HodgeTateLatticesAndLubinTateLogarithms §3.3 needs the criterion "`exp(Ψ)` integral iff `Ψ^σ(X^p) − pΨ ∈ p·O[[X]]`" over `O` with a Frobenius lift `σ` (lines 698–703 of its README at this head). It states that form itself, as its own adaptation, and cites §4.2b only for "the case `K = ℚ_p`, `σ = id`". The general theorem thus sits in the consumer and its special case in the general roadmap. That reverses the order this revision sets out to establish.

The general form follows from §4.2a. Take the setting of the first Check of §4.2a with `τ = σ`, `q = p`, `s_1 = p⁻¹`, `𝔞 = pO` and `f = log(1 + X)`. Then `D(f) = log(1 + X) − p⁻¹·log(1 + X^p)` lies in `ℤ_(p)[[X]] ⊂ O[[X]]`. At `X^(pm)` the two terms cancel for odd `p`; for `p = 2` they leave `0` for even `m` and `−1/m` for odd `m`. For integral `γ` with constant term `1`, §4.2a (iii) with `h = γ − 1` makes `D(log γ)` integral, that is `γ^σ(X^p)/γ^p ∈ 1 + p·O[[X]]`. Conversely, §4.2a (ii) with `f̄ = log γ` makes `exp(log γ) − 1` integral. The argument works in any number of variables. Haz79 derives Dwork's lemma over `W(𝔽̄_p)` with its Frobenius in exactly this way (Haz79 line 107–113, §3, p.75).

The smallest change is to state §4.2b for `K`, `O` and `σ` as in the first Check of §4.2a: a series `γ ∈ K[[X]]` with constant term `1` lies in `O[[X]]` if and only if `γ^σ(X^p)/γ(X)^p ∈ 1 + p·O[[X]]`. Equivalently, `exp(ϑ) ∈ O[[X]]` if and only if `ϑ^σ(X^p) − p·ϑ ∈ p·O[[X]]`. Cite Haz79 §2, (2.6)–(2.7), and §3, p.75, and give the route above. Keep the `ℤ_p` form (KR11, Lemma 1) as its case `O = ℤ_p`, `σ = id`, and add §4.2a to its *Needs:*. The Conventions clause "§4.2b works over `ℤ_p`" changes with it.

## C01 — The description says each added section is stated "in the generality of its source", but §4.3a is narrower than its sources and is not among the listed exceptions

Clause (i) of §4.3a is stated for one-dimensional formal group laws over complete noetherian local rings. The README itself (line 1475) says that K81, Theorem 5.3.3, covers `p`-divisible formal Lie groups of any dimension `d` over `ℤ`-flat `p`-adically complete rings. Clause (ii) is the case `K = ℚ_p`, `n = 2` of BW16, Lemma 2.5 (R01). The sentence would be true with "in LubinTateFormalModulesAndQuasiCanonicalLifts §4.3a (i) for one-dimensional formal groups over complete noetherian local rings" added to its parenthetical list of exceptions. Clause (ii) belongs on that list too if R01 is not applied.

## Questions for the author

- Does K81 identify the quotient of the quasi-logarithm module by the invariant differentials with the tangent space of the Cartier dual, as §4.3a (i) states, or with `Ext(G, Ĝ_a)` (equivalently `H¹(G, O)`)? In the second case the identification with `Lie(G^D)` is a further comparison (Messing), with a locator of its own. No legal copy of K81 could be read to settle this.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §4.2a hypotheses, first Check | `S = O`, `Q = K`, `𝔞 = pO`, `τ = σ²`, `q = p²`, `s_1 = p⁻¹` | `σ(b) = b^p + pc` gives `σ²(b) ≡ (b^p + pc)^p ≡ b^(p²)` mod `p`; `τ^r(p⁻¹)·pO = O ⊂ S` | holds | none |
| §4.2a first Check, `D(ℓ₁)` and isomorphism direction | `ℓ₁ = Σ p^(−j)X^(p^(2j))`; `φ = g′⁻¹∘g` | at `X^(p^(2j))`, `j ≥ 1`: `p^(−j) − p⁻¹·p^(−(j−1)) = 0`, so `D(ℓ₁) = X`; `φ(F_g) = g′⁻¹(g(X)+g(Y)) = F_(g′)(φX, φY)` | holds | none |
| §4.2a second and third Checks | `u = p − T²`, `σ` as (F1); `g = X + X²/p` | `(p − T²)⋆g = pg − g^(σ²)(X^(p²)) = p·D(g)`; `D(g)` at `X²`: `1/p` (`p² ≥ 4 > 2`); law `XY` coefficient `−2/p` | holds | none |
| §4.2a (iv) and route congruence | `x = y + a`, `a ∈ 𝔞^r`; `p = 2`, `r = 1` | middle terms `p·a^k ∈ 𝔞^(1+rk)`; `a^p ∈ 𝔞^(rp) ⊂ 𝔞^(r+1)` since `r(p−1) ≥ 1`; `p = 2`, `r = 1`: `a² ∈ 𝔞²` | holds; matches Haz79 (2.8) | none |
| §4.2b, the two forms (sample) | `k = 1, p`; `p = 2` | `v_p(p^k/k!) ≥ 1` (`k = p = 2`: `v₂(4/2) = 1`); `v_p(p^k/k) = k − v_p(k) ≥ 1` (`k = 2`: `1`) | holds; KR11 line 506, 753–817 | none |
| §4.2b Checks | `ϑ = X_1`; Artin–Hasse `ϑ = Σ X_1^(p^e)/p^e` | `X_1^p − pX_1 ∉ p·ℤ_p[[X]]`, coefficient `1/p!`; `Σ X_1^(p^(e+1))/p^e − Σ X_1^(p^e)/p^(e−1) = −pX_1` | holds | none |
| §4.2b generality (R02) | `O`, `σ` general; `f = log(1+X)` | `D(f)` at `X^(2m)`, `p = 2`: `(−1 + (−1)^m)/(2m) ∈ {0, −1/m}`, in `ℤ_(2)`; odd `p`: `0`; σ-form follows from (ii), (iii) | true, not stated | R02 |
| §4.3a definition | `c·ℓ_F`; `f ∈ X·R[[X]]` | `(cℓ_F)′ = c/∂_Y F(X,0) ∈ R[[X]]`, defect `0`; integral `f` has integral `f′` and defect | holds; BW16 Def. 2.3 | none |
| §4.3a (i), third Check | `Ĝ_m` over `ℤ_p`, `h = 1`; `f = log(1+X^p)/p` | `f′ = X^(p−1)/(1+X^p)` integral; `f − log(1+X) = p⁻¹·log((1+X^p)/(1+X)^p) ∈ ℤ_p[[X]]` | consistent with rank `1` | none |
| §4.3a (ii), type and `[a]` | `s = ±1`, `σ = id` | at `X^(p^(2j))`: `p(sp)^(−j) − s(sp)^(−(j−1)) = p(sp)^(−j)(1 − s²) = 0`; `(p − sT²)a = a(p − sT²)`, `t = a` | holds | none |
| §4.3a (ii), `g₀` | `g₀ = ℓ_s(X^p)/p` | `g₀′ = Σ s^j p^j X^(p^(2j+1)−1)` integral; defect `p⁻¹(ℓ_s(F^p) − ℓ_s(F(X^p,Y^p)))` integral by §4.2a (iv); `π⁻¹ℓ_s(X^p) = s·g₀` | holds; BW16 L. 2.5 | none |
| §4.3a (ii) generality (R01) | BW16 Lemma 2.5 at `K`, `n` | source: every finite `K/ℚ_p`, every `n`; README clause: `K = ℚ_p`, `n = 2` only | narrower | R01 |
| §4.3a first and second Checks | `β ∈ W(𝔽̄_p)[1/p]` | `g₀` has `1/p` at `X^p`, `ℓ_s` degrees `p^(2j)`; `(βℓ_s)′` constant term `β`; coefficients `β(sp)^(−j)` unbounded | holds | none |
| §4.3 (sample, cited by §4.3a) | `s = −1`, `(p + T²)⋆ℓ_(−1)` | `p(−p)^(−j) + (−p)^(−(j−1)) = (−p)^(−j)(p − p) = 0`; H70 Lemma 4.2 at H70 line 738, p.231 | holds | none |
| Headlines §§1.2, 1.3, 2.3, 2.5, 4.3, 4.4 (unchanged) | `πX + X^q`; `K = ℚ_p`, `m = 1`; `y² + y = x³`, `p = 2` | degree `(q−1)q^(m−1) = p − 1 = [ℚ_p(ζ_p):ℚ_p]`; `#E(𝔽₂) = 3`, `#E(𝔽₄) = 9 = 4+1+4`, `s = −1` | holds | none |

- Source locators checked against the text: 13 in total. Haz79 §2 (2.1)–(2.8), pp.74–75 (Haz79 line 51–96) and §3, p.75 (line 107–113). KR11 Lemma 1 (KR11 line 506), §4 (line 753–817) and its citation of Lang (line 504, 1640). BW16 §2.3 (BW16 line 286–298), Definition 2.3 (line 318–329), Proposition 2.4 (line 341) and Lemma 2.5 (line 345–347). H70 Lemma 2.4 p.222 (H70 line 380), Theorem 3 p.225 (line 482), Proposition 3.3 p.226 (line 537) and Lemma 4.2 p.231 (line 738).
- Library declarations opened at the pin: Mathlib `PowerSeries.substInv` (`Mathlib/RingTheory/PowerSeries/Substitution.lean:457`), `PowerSeries.substInvOfIsUnit` (`:567`), `PowerSeries.subst` (`:158`), `MvPowerSeries.subst` (`Mathlib/RingTheory/MvPowerSeries/Substitution.lean:217`), `PowerSeries.exp` (`Mathlib/RingTheory/PowerSeries/Exp.lean:50`) and `PowerSeries.derivative` (`Mathlib/RingTheory/PowerSeries/Derivative.lean:50`). Neither Mathlib nor Tau Ceti at the pins has a multivariable substitution inverse, the functional-equation lemma, Dwork's lemma or quasi-logarithms (searched by object).
- Cross-roadmap citations resolved: FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.7, R07.1.12, R07.1.13, R07.1.14 and R07.1.15 on `main` (its README lines 540, 754, 814, 841, 871), each saying what §§4.2a and 4.3a take from it. HodgeTateLatticesAndLubinTateLogarithms §§3.2–3.4 at this head cite §§4.2a, 4.2b and 4.3a (its lines 672, 698, 728).
- Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folders that the brief names as the pull request's own.
- Automatic checks: the worker's checks all passed. My own gate run, made without the list of the pull request's folders, flags those folders' files as outside this one; all of them are the pull request's own.
- Elaboration: `lake env lean` on `TauCetiRoadmap/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean` gives 8 warnings, all `declaration uses sorry`, one per theorem. The file is unchanged since `main`, and the elaborated signatures (for example `exists_hondaType_log_of_map_zsmulSeries`) still carry their binders.
- Ownership against open pull requests: the 124 checked-out heads and the index of 450 were searched for the functional-equation lemma, Dwork's lemma and quasi-logarithms. The quasi-logarithm map of Scholze–Weinstein in EndoscopicTransferAndUnitaryTraceComparison §12.6 and IgusaVarietiesAndTorsionConcentration §3.26 is a different object.

Overlap check: read HodgeTateLatticesAndLubinTateLogarithms, FiniteFlatGroupsAndIntegralPadicHodgeTheory and BordismFormalGroups (on `main`), and searched AnticyclotomicLocalUnits, InertAnticyclotomicCMMainConjecture, ModularIwasawaMainConjecturesPartII and FunctionFieldArithmetic for the three new objects. The functional-equation lemma and the quasi-logarithm basis are shared with HodgeTateLatticesAndLubinTateLogarithms §§3.2 and 3.4: this roadmap owns them (§§4.2a, 4.3a), cited there as corollaries. Dwork's lemma with a Frobenius lift is stated only there (R02). The Dieudonné crystal and its Hodge sequence are owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory and not restated here. BordismFormalGroups shares none of the three.

Source independence: changed passages only. Nine passages were compared with 4 sources (Haz79, KR11, BW16, H70): the statements and routes of §§4.2a, 4.2b and 4.3a, their Checks, and the Conventions, guide and scope sentences. Nothing is shared beyond forced formulas, hypothesis lists and the standard phrase "completion of the maximal unramified extension". The largest share of the README's locators is Y95, 24 of about 115; within the changed passages it is K81 and BW16, 4 each, and K81 could not be read. The arrangement was not compared, since no layer was added, removed or reordered.

Research link: §4.3a (ii) is the case `n = 2` of Hopkins and Gross (1994), Proposition 13.8, the basis of the Dieudonné module that Boyarchenko and Weinstein (2016) use on the Lubin–Tate tower. Layers 6–8 serve Gross (1986), Yu (1995) and Burungale–Kobayashi–Ota (2021, Rubin's conjecture). This rests on the README's references and on BW16 §2.4, which I read.

## Not verifiable

- K81, §5.1 p.193, Theorem 5.2.1, (5.3.1)–(5.3.2) and Theorem 5.3.3. The sources service did not accept the README's link (web.math.princeton.edu/~nmk/…) as an author page, and the DOI resolves only to a paywalled publisher.
- HG94, Proposition 13.8: the AMS landing page is in no licence class and the arXiv search failed. The claim is cited through BW16, Lemma 2.5, which was read.
- Haz78, I.2, II.10 and §2 (a book; no legal copy reached). The lemma's statement was checked in Haz79 §2, which names Haz78's sections 2 and 10 for the proof (Haz79 line 96).
- Lan80, chapter 14, p.76 (paywalled). The locator agrees with KR11's own citation of it (KR11 line 504, 1640).

## Source issues

- **Misprint** in BW16 at Definition 2.1, p.7 (arXiv v3): the source takes the ideal of definition inside `R` and calls `Adic_A` the category of adic `R`-algebras; it should be an ideal of `A` and adic `A`-algebras; affects nothing.

## For the human reviewers

- Licence: the README links K81 to web.math.princeton.edu/~nmk/old/CrCohDModJacSum.pdf (README line 2825), apparently Katz's own page, but the sources service could not confirm it as an author page. The text was not read.
- Not tested: K81 carries the largest share of the changed passages' locators, together with BW16. Its text could not be read, so the wording of the four passages that cite it was not compared with it, and §4.3a (i) rests on K81 unverified.
