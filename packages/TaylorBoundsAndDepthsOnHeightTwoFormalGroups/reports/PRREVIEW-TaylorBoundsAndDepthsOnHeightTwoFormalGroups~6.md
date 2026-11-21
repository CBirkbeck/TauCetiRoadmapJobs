# Review of TaylorBoundsAndDepthsOnHeightTwoFormalGroups (pull request #2914 at ef74e2f)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups/`
**Verdict:** needs changes

**Summary.** Changes are needed: three findings, all P2. The colength bound 4.8c is stated for every polarisation while the supplier section it is an instance of assumes a principal one; a Check in 4.4a asserts the sign `−1` for every CM curve at an inert prime, which a quadratic twist refutes; and 4.8b′ (1) is stated for a wider class of fields than the README says the formal proof covers, with its key step not given. There are three small corrections and one format note. The cited formal proof could not be read from a legal place, so none of its locators was verified, and the scope and licence questions that follow from that are left to the human reviewers.

## R01 (P2) — The colength bound 4.8c drops the principal polarisation that its supplier assumes

4.8c (line 603 on) is stated for an algebraic integral framed point of any unitary PEL moduli problem above an unramified `p ≠ 2`, and its route is one sentence: it is "the instance of HodgeTateLatticesAndLubinTateLogarithms §0.5d (a) for the model `𝒜` of `y`". An implementer who follows that route cannot reach the stated generality, and 4.18 (c), which applies 4.8c "at an algebraic integral framed point" with no further hypothesis, inherits the gap.

HodgeTateLatticesAndLubinTateLogarithms §0.5d, at the head of its open pull request, opens with the hypothesis "assume that the polarisation of `B` is principal" (`B` the abelian part of the uniformisation), and its route derives (a) from (b), which begins "Here `G = B` is principally polarised" and uses the period data of a principally polarised abelian scheme (its §0.5g). The moduli problem of 4.8b is PELModuli M1.7, whose polarisations are prime-to-`□` (M1.2), not principal, and 4.8c puts no condition relating `p` to `□`. The later sections already carry the hypothesis: 4.19e (c) and 4.19f say "whose polarisation `λ` is principal".

Smallest change: add "whose polarisation `λ` is principal" to the hypotheses of 4.8c and to the character clause of 4.18 (c), and to the line on §0.5d (a) in the supplier contracts (which also omits it). If the general case is wanted, it needs its own route, since §0.5d does not supply it.

## R02 (P2) — The Check of 4.4a asserts the sign `−1` for every CM elliptic curve at an inert prime; an unramified quadratic twist has sign `+1`

The Check of 4.4a (line 253) says: "The sign `−1` is that of a CM elliptic curve with good reduction at a prime `p` inert in its CM field: over `W(𝔽_{p²})` its formal group is the Lubin–Tate module of `−p`". A reader takes this as a fact about all such curves; it holds only under the hypotheses of the two sections cited for it.

Counterexample: `E: y² = x³ − x` has `a_7 = 0`, so `#E(𝔽_49) = 49 + 1 + 14 = 64` and the `49`-power Frobenius is `[−7]`. Take `u = 2 + i`; its norm `5` is a non-residue mod `7`, so `u` is a non-square in `𝔽_49`. The curve `u·y² = x³ − x` over `ℚ(i)` has CM by `ℤ[i]`, good reduction at the inert prime `7`, and `2·50 − 64 = 36 = (7 − 1)²` points over `𝔽_49`, so its Frobenius is `[+7]` and its formal group over `W(𝔽_49)` is the Lubin–Tate module of `+7` (LubinTateFormalModulesAndQuasiCanonicalLifts §4.3 with `s = 1`). The cited sections agree: LubinTateFormalModulesAndQuasiCanonicalLifts §4.4 gives `−p` "for `E` over `ℤ_p` with good reduction and `a_p(E) = 0`", and NonordinaryCMSpecialValues §3.4 for Hecke characters equivariant under conjugation (its §0.1).

Smallest change: restrict the sentence, for instance "of a CM elliptic curve over `ℤ_p` with good reduction at an inert `p` (so `a_p = 0`)". The curve `y² = 4x³ − 4x` of the 4.5 Check is of this kind, so nothing else moves.

## R03 (P2) — 4.8b′ (1) is stated for every field with surjective relative trace, but neither the formal proof nor the route written here supports it beyond the narrower class

4.8b′ (1) (line 576) asserts that every framed point has an integral chart as soon as `𝒪_E → 𝒪_{E⁺}` is onto. The README's own account leaves this without support: the line on the formal proof under 4.8b′ says the statement there is "for the fields of Host (4.8b), a narrower class than the one of (1)"; the paragraph "Statements of the formal proof" in the Conventions says a wider form "is this roadmap's own, proved by the route written here"; and the route of (1) (lines 592–594) ends "the existence of a polarisation series in canonical gauge over `R` is not given here". That existence is the whole content of (1) once `w₀` is given. The last clause of (2) ("by (1)") and the description of the supremum defining `ν_𝔩` rest on it.

Smallest change, either of: state (1) for the class of fields for which it is proved (the fields of 4.8b's last paragraph) and keep the wider statement as a remark marked as not proved; or add the missing step as a target with hypotheses and a route (a trivialisation, in canonical gauge, of the biextension `Λ(L)` on `𝒜̂ × 𝒜̂` whose four coboundary series are integral).

## C01 — The pointer "Mathlib … finite-dimensional linear programming" in 4.6 names nothing the pinned Mathlib has

The *Needs:* line of 4.6 and the Mathlib entry of the supplier contracts cite "Mathlib convexity (finite-dimensional linear programming)" for LP duality and complementary slackness. At the pin Mathlib has the geometric Farkas lemma for proper cones (`ProperCone.hyperplane_separation'`, `Mathlib/Analysis/Convex/Cone/InnerDual.lean`, line 96), and strong duality is listed as still to do in `Mathlib/Analysis/Convex/Cone/Basic.lean` (line 36). An implementer of `flowProgramme_duality` would look for a duality theorem that is not there. Name the declaration that exists and say that duality for the finite programme of 4.6 is proved here from it.

## C02 — 4.6 (f) asks `p ≥ 5`, which its route does not use

The route of (f) uses `p^{−3} < 2/p`, `γ_LT ≥ 1/p`, `σ ≤ 1` and (d3); each holds for `p ≥ 3`, and the three losses still sum to `κΣw/p³ + 8Σw/p`. Elsewhere the text says where such a restriction comes from ("`ℓ ≥ 5` enters only through the constants" in 4.19b). One clause here would do the same: the restriction is that of the formal proof and the route gives `p ≥ 3`.

## C03 — The description's validation sentence no longer matches the head

The validation sentence of the description says that every automatic check passes except the one on changes outside the roadmap folder, "which lists only the three files of the family index". At this head those three files are the pull request's own (the roadmap is nested in the family folder), so no check fails and a reader is told of a failure that is not there. Text that would be right: "every automatic check passes; outside the roadmap folder the pull request changes only the three files of the family index".

## N01 — The classical references carry no locators

"J. Lubin and J. Tate (1965); T. Honda (1970)", Hazewinkel, Katz, Mumford, Breen, Cayley and Capelli are listed for whole ranges of sections ("4.1–4.8c, 4.19") without title (the first two), theorem or page. Where a target is marked *KNOWN* (4.1, 4.6, 4.8a) a locator at the claim would let a reader find it.

## Questions for the author

- Does the statement in the formal proof that 4.8c names (the colength bound with "`p ∤ disc(E)`") assume a principal polarisation? I could not read the formal proof (see below), so R01 rests on the supplier section only.
- 4.19c says that (ii), (iii) and (iv) without bi-blocks hold for every `ℓ ≥ 3`. Is that the range of the formal proof, or this roadmap's own widening? The line on the formal proof under 4.19c does not say, and I could not check it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.1 (c)–(f) | `n = 1, p, p^k`; `e = 0, 1, 2` | `γ+ρ = (p+1)/(p²−1) = 1/(p−1)`; `p/(p−1) − 1 = 1/(p−1)`; `(p⁴−1)ρ = p²+1 ≥ 2` | holds | none |
| 4.1 Checks | `exp(T)`, `D = T/p`, `κ = (1,1)`, `f = X₁²/p` | terms `p^{v_p(n!)}` unbounded, sup `0`; `p^{n+v_p(n!)}`; coefficient `2/p` at `Y₁Y₂` | holds | none |
| 4.2 (sample) | `T^{p+1}/p`; `w_s mod (p+1)` | `(p−1)v + m ≥ 1`; `v = −1 ≤ −1/(p−1)`; `(−1)^s p^s ≡ 1` | holds | none |
| 4.3 | `n′ = 2`, `p = 3`, degrees `4, 8, 12` | invariant: `(3,1),(1,3)`; `(8,0),(6,2),(4,4),(2,6),(0,8)`; bound `1/2 − 1 − 4/8 = −1`; `E(p,3) = 1+p` | holds | none |
| 4.4 (sample) | coefficient of `xy^p`; `(i,j) = (0,0),(0,1),(1,1)`; `𝔰 = −1` | `𝔠/p`; `1/(p−1) − 1`, `(p²−3p+3)/(p−1)`, `p²/(p−1) − 3`; `𝔇G_𝔠` recomputed; `𝔲^{p^{2j}} = (−1)^j𝔲` | holds | none |
| 4.4a Check | `ℓ_{−1}^{−1}∘ℓ_{+1}`; twist `(2+i)y² = x³ − x` at `7` | `T + (2/p)T^{p²}`; `#E′(𝔽_49) = 36`, Frobenius `[+7]` against claimed `[−7]` | sign sentence false | R02 |
| 4.5 (sample), headline (1) | bad bi-power monomial; `p = 7`, `y² = 4x³ − 4x` | `Σκ_i(1/(p−1) − ρ − σ_i)`; mixed monomials gain `v_p C(p^α, a) ≥ 1`; `G₄ = 1/15`, `v_7(G₈) = −1`; `exp(cz⁸/7)` bounded only at radius `γ` | holds | none |
| 4.5a (sample) | `α > α′`, `α < α′` | `e = |α−α′|` odd; `p^ασ + p^{α′}σ′ = p^{min}(p^eσ_z + σ_{h^ez}) ≥ 1` | holds | none |
| 4.6 (sample), headline (2), Lean | `n′ = 2, p = 3`, `D = (1,1), (1,0), (1,δ)`; `n_o = 3, p = 5`; `n_o = 1` | flow `1/2`, `𝔉 = 1/4`; flow `0`, `𝔉 = 3/8`; loss `4δ(1−γ)`; `5/24`, `5/24 − 1/126`; `ρD`; (d4) `8+4 = 12`; (f) holds for `p ≥ 3` | holds | C01, C02 |
| 4.7 (sample) | (ii) constants; `R^{top}` vs `R^{base}` | `2γ ≤ 9/(4p)` iff `p² ≥ 9`; `12 + 9/4 ≤ 15`; `γν₀ −` rhs of 4.6 (e) `= R^{top}` | (ii) follows from (i); (i) not checked | none |
| 4.8a (sample) | `ν(0) = ν(1) = (n)`; `ν(0) = (n)`, `ν(1) = (1^n)` | jet `n!(−S)^n`, `c′ = n`; `c′ = 1` and `Λ²` kills the product (two equal columns) | holds | none |
| 4.8b | ramified place; harmonic Check | `Lie_τ = R(X+ϖ)`, determinant `2ϖ`; Laplacian of `x_τx_τ̄` is `1`; trace of `ℤ[i]` is `2ℤ` | holds | none |
| 4.8b′ (sample) | route of (1) against the Conventions | wider than the formal proof by the README's account; key step "not given here" | (1) unsupported | R03 |
| 4.8c (sample) | height two, `E_w = ℚ_{p²}`; supplier §0.5d | `S = 1/p + 1/p³ + ⋯ = γ`; `S ≤ max r/(p−1)`; supplier assumes principal polarisation, 4.8c does not | hypothesis missing | R01 |
| 4.18 (sample) | (c) alternating ranks; (b) `s = 1`; products Check | `(pA+B)/(p²−1) = B/(p−1) + (A−B)γ`; Fitting ideal grows under quotients; `2Bκ_τ > B(κ_τ+κ_τ′)` | holds; (c) inherits R01 | R01 |
| 4.19 (sample) | value bound of a plan; `G_𝔠` Check | `nγΣW − nΣy` plus errors; `∂_yA(x,y)` has `p^{j−i}`, difference terms `p^{i−j−1}`, integral | holds | none |
| 4.19a | integration condition | `ℓ = 5`: `5·(32/120) = 4/3 ≥ 1`; `ℓ = 3`: `3·(1/24)·2 = 1/4 < 1`; defect `(i+1)j′ + j` | holds | none |
| 4.19b (sample) | exponent identities; `n₀ = 2`, `h₁ = 0` | both sides `(L+1)ρK + 7K/8 − K/(8L)`; `L/(ℓ−1) − E = (L+1)γ − 1`; `(Ly+1)^{−1}ΣC(y,k)/C(Ly,Lk) ≡ y+1` | holds | none |
| 4.19c (sample) | (i) against 4.19a, 4.19b | `n − n₀ ≤ (i+1)j_t`; `(L+1)γ − 1 = 1/(ℓ−1) > 0` at `i = 1`; `S_int` monotone in `n₀` | consistent | none |
| 4.19e (sample) | (RD7) from 4.8c, 4.18 (c) | `S = (n+j)γ + j′ρ ≤ nγ + j_t/(ℓ−1)`; constant: `j′/(ℓ−1)` | consistent | none |
| 4.19f (sample), headline (3) | copies; (g2); `ℚ(ζ_7)` at `17` | `Σn_o = f`, `f·n·i₀ + 2r·#orbits ≤ f(i₀n + 2r)`; `j_t ≤ n`; `17 ≡ 3`, order `6`, pattern `+++−−−` | consistent with 4.19d, 4.19e | none |

- Source locators checked against the text: 0 of the 21 lines "In [FormalProof]" (text not readable); 1 passage of [Announcement] read (lines 116–117).
- Library declarations opened at the pin: `MvPowerSeries.gaussNorm` (line 58), `HasGaussNorm` (63), `le_gaussNorm` (68), `gaussNorm_mul_le` (138) in `Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean`; `FormalGroup` (`Mathlib/RingTheory/FormalGroup/Basic.lean`, 57); `PowerSeries.exp`; `MvPowerSeries.subst`; `ProperCone.hyperplane_separation'`.
- Cross-roadmap citations resolved: 30 sections in 16 roadmaps (10 on main, 6 at open heads), all found; one cited for more than it states (R01), two cited for a sentence wider than they state (R02).
- Dependency check: `depcheck: 171 roadmaps, 1996 edges, 0 problem(s)`; no upward or cyclic edge.
- Elaboration of `Suggested.lean`: three `sorry` warnings and nothing else; the five elaborated types compared with 4.6, all binders present.
- One-tactic probe (`simp`, `rfl`, `simp` with the two definitions unfolded, `exact le_refl _`): none closes any of the three theorems; no padding.
- Headlines: (2) stated; (1) and (3) named in the module docstring with the missing carriers.
- Overlap check: read HodgeTateLatticesAndLubinTateLogarithms, LocalGainOfThetaChains, GluedTargetAndDivisionInequality, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties; nothing shared (each leaves §§4.1–4.8c, 4.18–4.19f to this roadmap, and this one leaves §§3.1–3.5, 0.5d to the first).

Source independence: 1 passage compared with 1 source ([Announcement]), nothing shared beyond a formula; largest share [FormalProof], 21 of 21 located statements, text not readable; contents not compared with [FormalProof].

Research link: The targets are steps of the Lean formalisation of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026), unrefereed, with classical inputs from Lubin–Tate (1965), Honda (1970), Hazewinkel (1978) and Mumford (1969); this rests on the README's References and on [Announcement] lines 9–13 and 116–117.

## Not verifiable

- Every sampled target (4.2, 4.4, 4.5, 4.5a, 4.6, 4.7, 4.8a, 4.8b′, 4.8c, 4.18, 4.19, 4.19b, 4.19c, 4.19e, 4.19f) against [FormalProof]: the repository named in the References is on a host the sources service has in no legal class, and the archive named in [Announcement] line 53 is not a document it can read. Declaration names, file paths, hypotheses and the "more or less general" remarks of the 21 lines "In [FormalProof]" are unchecked.
- 4.7 (i), 4.8 with (J1)–(J3), 4.19a, 4.19e (a)–(c), 4.19f (o), (g1), (g3): their routes are stated as not given, and the only support is [FormalProof].
- Wording and arrangement against [FormalProof]: not compared.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target rests on [FormalProof], a Lean formalisation announced on 20 November 2026; [Announcement] lines 45–49 say no written proof exists yet. No refereed source states these targets.
- Licence: the README records 63 file paths and many declaration names of the [FormalProof] repository; I could not classify its host or read its licence.
- Not tested: [FormalProof] holds all 21 located statements and could not be read, so wording and arrangement were not compared; the README numbers its layer "`4` as in the family's core", and the family index says the family "follows" that proof.
