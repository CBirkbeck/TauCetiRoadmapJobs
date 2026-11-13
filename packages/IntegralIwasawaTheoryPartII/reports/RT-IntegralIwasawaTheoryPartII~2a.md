<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13146#issuecomment-6849478302 -->
Red team round 2 pass a (claude) of 3936d0c

Verdict: needs_changes

1. **F01** (P2) 2.5a reads `a_k` from constants at the cusps `A` without controlling the non-ordinary Eisenstein part

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md:555` and `:560`: "for every ordinary series `E_k(η, φ_S)` … `c_λ(0, E_k(η, φ_S)|A) = 0` unless …" and "Then slash the decomposition of 2.2a by `A`: cusp forms have zero constants, the remaining tuples are independent".

   **Claim.** `a_k`, defined as a coefficient in `e(E_1(1, χ)·ν_{k−1}(𝒢))`, is read off from `c_λ(0, (E_1(1, χ)·ν_{k−1}(𝒢))|A)`, the constant of the form before the projector.

   **Witness.** `F = ℚ`, `𝔫 = 4`, `p = 5`, `k = 5` (so `ω^{1−k} = 1`). The basis of 2.2a at level `20` contains the non-ordinary `g = E_5(χ_4, 1) − E_5(χ_4, 1)|B_5` (`U_5`-eigenvalue `5⁴`). The product has a `g`-component, and no item of 2.5a gives `c(0, g|A)`.

   The missing statement is true, so the conclusion of 2.5a stands. In the witness both terms of `g` have the same constant at `1/5` (the lower-left entries `5a′` and `a′` have the same `χ_4`-value), so `c(0, g|A) = 0`, while the ordinary `E − 5⁴E|B_5` has constant `(1 − 5⁴)c ≠ 0`. In general it is the case `𝔭 ∤ 𝔟` of the proof of Dasgupta–Darmon–Pollack Proposition 2.3 (DDP11 lines 1048–1052).

   **Repair.** Add as a new item after the first item of 2.5a:

   > - for every `f` in the kernel of `e` on `M_k(𝔫_S, χω^{1−k})`, `c_λ(0, f|A) = 0`: on the Eisenstein part this kernel is spanned by the series `(1 − η(𝔮)B_𝔮)E_k(η, φ)|B_{𝔱𝔮^j}` and by the pairs with `η` ramified above `p` (2.2a), whose first character has modulus divisible by a prime `𝔮 | p`; a lattice vector whose image under `A_λ` has vanishing first coordinate has first entry in `𝔮`, because `α_λ ∈ 𝔠_p𝔡t_λ`, so every term of the constant carries the value `0` of the first character (Dasgupta–Darmon–Pollack, proof of Proposition 2.3, the case `𝔭 ∤ 𝔟`, p. 463). Consequently `c_λ(0, e(f)|A) = c_λ(0, f|A)` for every `f`.

   In the route, replace "Then slash the decomposition of 2.2a by `A`: cusp forms have zero constants, the remaining tuples" by "Then slash the decomposition of 2.2a of `E_1(1, χ)·ν_{k−1}(𝒢)` by `A`: cusp forms and the non-ordinary Eisenstein members have zero constants, the tuples of the ordinary members". Add the witness as a Check of 2.5a.

   Tested on the witness: the new item gives `c(0, g|A) = 0`, as computed.

2. **F02** (P3) IntegralIwasawaTheory §0.4 is cited for the cyclotomic character, which it does not state

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md` lines 35, 89, 332, 437, 580; for example line 89: "Conventions and §§0.1, 0.4: the full cyclotomic character `κ = ε_cyc` on `G_F`, its principal-unit projection and the procyclic coordinate".

   **Witness.** IntegralIwasawaTheory at its open head: §0.4 is "Arithmetic completed actions and finite-layer quotients" (`arithmeticCompletedAction`, `arithmeticLayerProjection_comparison`). The character, its principal-unit projection `κ_Γ`, the generator `u` and the dyadic sign are in its Conventions and in §0.1 (`kappaFull_spec`, `teichmullerFull`).

   **Repair.** Replace "§§0.1, 0.4" by "§0.1" at lines 35, 89 and 332, "Conventions and §0.4" by "Conventions and §0.1" at line 437, and "§§0.4, 9.3" by "§§0.1, 9.3" at line 580.

Round 2. One P2 (a missing step in the proof plan of 2.5a, new in the round-1 repair) and one P3 (a supplier section cited for a statement it does not make). Every round-1 finding is repaired. No finding of the repair report was marked `not actionable`, so nothing is re-raised.

## Round-1 findings: state at this head

| Id | State | Witness at this head |
|---|---|---|
| 1a/F01 (reversed family unowned) | repaired | `packages/IntegralIwasawaTheoryPartII/README.md:115` "What NoncommutativeAndEquivariantIwasawa must provide (gap:reversed-ordinary-eisenstein-family)"; slug present in `design/plan.json`; 2.2 (line 454) cites it. Recomputed: weight-one coefficients `χ(𝔪_p)Σ_{𝔯∣𝔪′}χ(𝔪′/𝔯)` equal `Σ_{𝔯∣𝔪′}χ(𝔯)` exactly when all `χ(𝔮) = 1`. |
| 1a/F02 (completion reduced) | repaired | line 704: "`A` is excellent and in particular a local G-ring (… `excellent_examples`), its completion map `A → Â` is regular". SchemeAndStackFoundations §0.21 on main states both names with these hypotheses. |
| 1a/F03 (statable headline absent) | repaired | `Suggested.lean:62` states `isIso_coinfNatTrans_app_of_isZero_groupHomology_res`; docstring names §§2.3, 2.6 as not statable. |
| 1a/F04, 1b/F02 (weight one, products) | repaired | lines 117 and 135 (two gaps, both in `plan.json`); new target 2.2b (line 483). See S01 for the one step the new 2.5a leaves out. |
| 1a/F05 (rank one) | repaired | line 849, steps (i) and (ii). Recomputed on `ℚ(i)`, `p = 5`: divisors `(n, −n)` against `(a, a)` force `n = 0`. |
| 1a/F06 (domain of `μ_ℓ`) | repaired | line 232: "Put `Γ_{ℓ,p} = Γ_ℓ ∩ GL_n(ℤ[1/p])`"; CD14 line 1064 and lines 1084–1089. |
| 1b/F01 (factor in `W`) | repaired | line 518: `W = ε(𝔫) · (ℒ_χ/ℒ_{χ⁻¹}) · L(χ⁻¹, 0)/L(χ, 0)`. DKV16 line 624 has no such factor; DDP11 line 1304 has it. I recomputed the exponent independently (table, row 2.5a). |
| 1b/F03 (Tau Ceti carriers) | repaired | lines 28, 68; all three names exist at the pin (`FieldTheory/Galois/AbsoluteGaloisGroup/Map.lean:82`, `NumberTheory/LocalField/Unramified/Inertia/Basic.lean`, `NumberTheory/ClassFieldTheory/Local/Unramified.lean`). |
| 1b/F04 (generality of 0.7) | repaired | line 273, any normal `S ⊴ G` over a commutative ring `k`; I checked the double-complex route step by step (table, row 0.7). |
| 1b/F05 (remark after 3.9) | repaired | line 682: "For `r = s = 1` and `w ∉ {0, −1}` …"; line 903 restricted likewise. |

No repair introduced a false statement. The repair of 1b/F01 introduced the incomplete route of S01.

## Verified sound

**Counts.** 1 Lean declaration read and compared with its elaborated type. 54 numbered targets read (all 930 README lines). 99 Check bullets read; the numerical ones recomputed (the table below shows the values). 53 locators verified against the cached texts (DKV16 22, DDP11 9, CD14 13, V15 5, Lin12 4). Every cited supplier section and declaration name of the 12 supplier roadmaps resolved at main or at the supplier's open head; the only mismatch is S02. 28 pinned declarations found at the pins.

**Suggested.lean.** One theorem, no `def`, no `variable` block, single `import Mathlib`, no `set_option`. Its elaborated type has every binder: `{k G : Type u} [CommRing k] [Group G] (S) [S.Normal] (A : Rep k G)`, the vanishing hypothesis for `0 < q`, and `IsIso ((groupHomology.coinfNatTrans k S n).app A)`. No Lean was run in this pass (read-only); nothing in the file changed.

- It is true as typed: the double-complex argument of README 0.7 works over any commutative `k`, with no flatness assumption (table, row 0.7).
- It is not in Mathlib: Hochschild–Serre is a TODO in `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:62`; the Loogle and LeanSearch leads are Shapiro and degree-zero isomorphisms only.
- It is not padding: it does not follow from one lemma.
- The docstring's claims about the pins hold: no Iwasawa logarithm, no Deligne–Ribet function and no Hilbert modular forms exist in the pinned Mathlib or Tau Ceti.

**Headlines.** 0.8, 1.9, 2.3, 2.6, 3.8–3.10, 5.5–5.8 are named in the docstring as not statable, each with its missing carrier; 0.7 is stated.

**Gaps.** The eight slugs agree between the README and `design/plan.json`; each has a named supplier earlier in the merge order. I checked that §F.5, PadicFamilies §§5.10–5.13 and OrdinaryAutomorphicFormsAndModularityLifting §2.12 are stated for odd `p`, conductor prime to `p` and weight `k ≥ 2` only, so no gap asks for something already provided.

**Ownership.** No roadmap on main or at an open head states the Gross–Stark theorem, the Sczech–Eisenstein cocycle, Spiess's theorems or the Eisenstein complement over a totally real field (`roadmaps grep` for each object returned only supplier bibliography lines). `Suggested.lean` shares no fully qualified name with another roadmap.

**Policy.** The pull request changes only `packages/IntegralIwasawaTheoryPartII/`. No pull-request number, process narrative, `lemma`, `set_option` or machine path in the README or the Lean file.

**Dependency check.**

```text
depcheck: 206 roadmaps, 1904 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

### Adversarial pass: computed values

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Lean edge isomorphism / 0.7 route | general `k`, `P_b = k[G]` | `k[G] ⊗_k M ≅ Ind_1^G M`; its `S`-coinvariants `Ind_1^{G/S} M`; `H_q(G/S, ·) = H_q(1, M) = 0` for `q > 0` | rows and columns acyclic; holds without flatness |
| 0.7 Check | `G = E_+ × T`, `M = ℂ_p[T]` | `H_1(G, M) = H_1(E_+, ℂ_p) = ℂ_p`; `H_1(E_+, M_T) = ℂ_p` | agrees |
| 0.7 balancing | action `λ(um)` instead of `λ(u⁻¹m)` | `κ(g)(um)` against `κ(g)(u⁻¹m)` | contragredient needed |
| 0.4 | `O = diag(2,3)`, `L = diag(5,7)` | `det(−L)/det O = 35/6`; after `diag(4,1)`: `140/24` | invariant |
| 0.4 row scaling | `𝔓 ↦ g𝔓` | `ord_{g𝔓}(u) = χ(g)·ord_𝔓(u)`, same for `L` | ratio fixed |
| 0.5 | `ℚ(i)`, `p = 3` | `D_χ = (1/2)(1 − (−1)) = 1` | agrees |
| 0.5 nonvanishing | `n = −(p−1)p^m` | `χω^n` totally odd, `n` even negative: no trivial zero; Euler factors `1 − η(𝔮)N𝔮^{|n|} ≠ 0` | `f_χ ≠ 0` near `0` |
| 0.6 smoothing | `s = −k` | `χω^{−k}(𝔠)N𝔠^{1+k} = χ(𝔠)N𝔠⟨N𝔠⟩^k` | factor correct |
| 0.6 Check | `p = 2`, `χ_4`, `𝔠 = (3)` | `⟨3⟩ = −3`; factor `4` at `s = 0`, `0` at `s = 1` | agrees |
| 0.6 Check | `p = 3`, `𝔠 = (2)`, `k = 1` | `(1 − 4)(1 − 3)(−1/12) = −1/2`; principal branch `≡ 0` | agrees |
| 0.8 identity | general `J`, `n` | `(1 − π_i)(1_{𝒪_{J₀}}g_n) = 1_{𝒪_J}g_n + 1_{𝒪_{J₀}}D_ig_n − 1_{𝒪_J}D_ig_n` | exact |
| 0.8 Check | `ℚ(√5)`, `p = 11` | `(4+√5)⁴ = 761 + 336√5`; `48² ≡ 5`, `52¹⁰ ≡ 100 (mod 121)`, `log_11 52 ≡ 22`, `c ≡ 88` | agrees |
| Conventions `rec` | `ℚ_5`, `ℚ_2` | `rec(2)ζ_5 = ζ_5²`, `Art(2)ζ_5 = ζ_5³`; over `ℚ_2` reversed | agrees with `localArtinMap_Q2_zeta5` |
| 1.7 | Selmer count | relaxed image `= ann(U_χ)`; `dim(W ∩ ann) = 2r − r` | `r` |
| 1.9 | `XO + YL = 0` | `det X/det Y = det(−L)/det O` | no extra sign |
| 2.1 | `f = as² + cs` | `π ↔ −s` to first order: `aπ² − cπ` | sign `(−1)^{s_χ}` |
| 2.2 | `𝔮 ∈ R ∖ J` | `c(𝔪𝔮) − c(𝔪) = Σ_{𝔯∣𝔪, (𝔯, J∪𝔮)=1}χ(𝔯)` using `χ(𝔮) = 1` | holds; fails for `𝔮 ∈ R′`, excluded by `R′ ⊆ J` |
| 2.2a `U_𝔮` | basis `e_j = E∣B_{𝔮^j}` | `Ue_0 = (α+β)e_0 − αβe_1`, `Ue_j = e_{j−1}`; char. poly. `X^{m−1}(X−α)(X−β)` | agrees |
| 2.2a Checks | levels 8, 25, 4 | `E − 9E∣B_2 + 8E∣B_4`; `T_2 = ±9`, `T_11 = 1332`; `T_3 = −8, 8`, `U_2 = 1, 4` | agree |
| 2.2b | `θ²/4`, `p = 5` | coefficients `1,1,0,1,2`; `c(25) = 3`; `(U_5 − 1)`: `1` at `n = 1, 5` | agrees |
| 2.2b clearing | `d_2 = (1+T) − u` | `ν_2 = 0`, `ν_1 = 1 − u` | unit of `Λ_(1)` |
| 2.4 | swap `χ ↔ χ⁻¹` | `W ↦ ε(𝔫)²W⁻¹`; `s = t`: `w = L^*_an(χ)/L^*_an(χ⁻¹)` | agrees |
| 2.5 constants | `𝔫 = 1`, component `λ` | `ℒ − ℒ − χ⁻¹(λ)L(χ⁻¹,0)ℒ/L(χ,0) + χ⁻¹(λ)ℒ_{χ⁻¹}W = 0` | cancels |
| 2.5a exponent | `F = ℚ`, Atkin–Lehner at `N` | pseudo-eigenvalue `N^{k/2−1}τ(χ)/(φ(N)N^{k−1})`; constant `∝ φ(N)⁻¹N^{−k} = N⁻¹⟨N⟩^{1−k}` | exponent `1 − k`; `a_k ∝ ⟨N⟩^{k−1}` |
| 2.5a route | `N = 4`, `p = 5`, `k = 5` | non-ordinary member has constant `0` at `1/5` | S01 |
| 2.6 | `η ∉ {1, χ}` | weight-one eigenvalue `(1 − η(λ))(1 − χη⁻¹(λ))` | nonzero |
| 3.1–3.6 | dimensions | `2^r + s − 1`; `2^r + 2s − 2`; `2^r + s + t − 2` (`3` at `r = t = 1`, `s = 2`) | agree |
| 3.3 | two top products | `(−1)^{t+1}b·cπ^s = (−1)^{s+1}aπ^s` with `c = (−1)^{s−t}a/b` | consistent |
| 3.7, 3.9 | `Y` on `F̃` | `χ + ε − 1 − χε = (χ−1)(1−ε)`; `ε_y + χε_z = 1 + χε + (χ−1)((1−ε)/π)y` | trace matches `T_𝔩` image |
| 3.8, 3.9 top relation | on `F̃` | `∏(U_i − 1)F̃ ≡ (−1)^{s+1}aπ^sE_1`; `(π^s − Y^s)F̃ ≡ π^sE_1` | relations hold |
| 4.1 Check | `y² = T²(T + p)` | `√(T+p) ∉ 𝒪_E[[T]]` (unbounded denominators), `∈ E[[T]]^×` | domain; completion has two minimal primes |
| 4.4 | `E[y′,z′]/(y′²,z′²)` | `1 + 2Lπ + 4L²y′z′` against `1 + 2Lπ + 2L²y′z′` | `yz = 0` needed |
| 4.7 | `𝔮 ∈ R′` | `κ(σ) = (1 − χ⁻¹(σ))ᾱ`; residue of the unit `χ(σ̃) − 1` | coboundary |
| 5.1, 5.2 | `σ = rec(u)` | `(1 + ℓπ)(1 + oε_i) − ψ_1 = ℓz + oε_i`; `L_an = (−1)^r det L/det O` | agrees with 0.4 |
| 5.3, 5.4 | inertia; `r = t = 1`, `s = 2` | `ε − ε_z = ε_y − 1`; `L⁻ + O⁻b = 0` | `R_p(χ⁻¹) = b` |
| 5.8 (ii) | decomposition field | `[HĤ^D : Ĥ^D] = [H_𝔓 : ℚ_p]`, one prime above `𝔭`; all `|τ(z)| = 1` | `a = 0`, `ord_𝔓(y) = 0` |
| Worked example | `p = 2`, `χ_4` | `B_{1,χ_4} = (1 − 3)/4 = −1/2`; value `1/2` | agrees |

## Not verifiable

- Sc93 (Theorem 4), W86 (Proposition 1.5), Br82, AL13: settled as uncertified; cited by locator only. The weight-two case of 2.2a for `F ≠ ℚ` rests on W86; Lin12 line 247 attributes the basis to it as well.
- The exponent `r = e + m + 1` at `p = 2` attributed to Ventullo's Lemma 4 (README line 499): not found by search in the V15 extraction; not checked further.
- The elaboration of `Suggested.lean` was not re-run (read-only pass); the worker's elaborated signature was used.
- Board packages outside the listed open pull requests were not searched for ownership.

## Source issues

- **Error** in DKV16 at §3.2, (31), p. 849: the source defines the weight-`k` value of `W` without a level factor; it should carry `⟨N𝔫⟩^{k−1}` when the tame conductor is not `1`; affects a stated result.
- **Gap** in DKV16 at Theorem 3.2, p. 849: the source asserts only the existence of a Hecke operator making the family cuspidal, which zero satisfies; it should require the operator to fix the weight-one Eisenstein series; affects a stated result.
- **Misprint** in DKV16 at proof of Theorem 3.6, p. 854: the source gives the dimension of the Case 2 algebra with the analytic order in the exponent of two; it should be `2^r + 2s − 2`; affects nothing.
- **Error** in DKV16 at Remark 3.7, p. 855: the source sends the operators at primes dividing the tame level to `1`; it should be `1 + (w/(1+w))·log_p⟨N𝔩⟩·π`; affects nothing.
- **Misprint** in DDP11 at Proposition 2.3, p. 462: the source prints the exponent `k − 1` on the norm factor of the constant term; it should be `1 − k`, as Proposition 2.7 and (79) require; affects nothing.
- **Error** in CD14 at proof of Theorem 5.1, p. 31: the source deduces degeneration from the free module having homological dimension one; it should use vanishing of all positive-degree homology of a free module; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3936d0c8c2ade14a2ad7f7d69719ac3b93fda36b", "job": "RT-IntegralIwasawaTheoryPartII~2a", "model": "fable", "worker": "chris-x10"} -->
