<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13001#issuecomment-6856984071 -->
Red team round 1 pass b (claude) of 3e807ed

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §7.12 uses the Drinfeld–Kedlaya slope theorem for convergent F-isocrystals, which nobody owns

   **Location.** `README.md:1374` (§7.12, proof sketch): "…restrict them to convergent `F`-isocrystals
   (§RD.3.37), where indecomposability is preserved … and apply their slope theorem for convergent
   `F`-isocrystals (Theorem 1.1.5)". `README.md:1372` (*Needs*) lists only
   PadicDifferentialEquationsAndRigidCohomology §§RD.2.3, RD.3.34, RD.3.37, RD.3.43, RD.5.8, RD.7.7.

   **Claim.** Every input of the proof plan is a target, a supplier section, a declared gap or a pinned
   declaration.

   **Witness.** DK17 line 122–123 is a separate main theorem (indecomposable convergent F-isocrystal:
   consecutive generic slopes differ by at most 1); DK17 line 124–126 and 296–297 derive it from full
   faithfulness of restriction of convergent F-isocrystals to a dense open (their Theorem 2.2.3). Neither
   statement is a target here, neither is in the cited sections (RD.5.8 is overconvergent → convergent on
   the same `X`, a different functor), and `roadmaps grep -i 'slopes of indecomposable|generic slopes|isocrystal.*indecomposable'`
   returns no match on main or at any open head. The declared gap `gap:curve-crystalline-companions`
   covers the companions only.

   **Repair.** Declare it as a second gap on the same supplier (the package may add gaps). Add under
   `### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology`, and the same slug to the
   `gaps` list of `design/plan.json` (supplier `PadicDifferentialEquationsAndRigidCohomology`, section
   `RD.3.34 Convergent F-isocrystals`):

   > What PadicDifferentialEquationsAndRigidCohomology must provide (gap:slopes-of-indecomposable-convergent-isocrystals): For a smooth irreducible variety X over a perfect field of characteristic p and an indecomposable convergent F-isocrystal M on X of rank n, with slopes at the generic point a_1 ≥ ⋯ ≥ a_n, the inequality a_i − a_(i+1) ≤ 1 for 1 ≤ i < n (Drinfeld–Kedlaya, Theorem 1.1.5, arXiv v11 p. 3), which rests on the full faithfulness of restriction of convergent F-isocrystals from X to a dense open subset (their Theorem 2.2.3, p. 6).

   and after the existing gap sentence of §7.12 add: "It also uses the requirement
   `gap:slopes-of-indecomposable-convergent-isocrystals`, for the indecomposable convergent
   `F`-isocrystals obtained from the companions." Tested on the refuting instance: the step "apply
   Theorem 1.1.5" then resolves to a declared contract.

2. **F02** (P2) §4.4 proves unipotence at infinity only for `gcd(n, N) = 1`; the self-dual statements that consume it do not assume it

   **Location.** `README.md:807` (§4.4, proof): "`det ρ_{t′}(γ∞) = 1`, so `c^n = 1`; `gcd(n, N) = 1`
   gives `c = 1`." `README.md:813` Check: "The hypothesis `gcd(n, N) = 1` is used". Consumers without that
   hypothesis: §4.4's own statement ("For Qian's data and for the self-dual data"), §§4.5–4.7, §5.6
   (`README.md:941`, "`n` even, `N > n + 1`"), §7.10(2), §8.1 and §9.4 (`README.md:1502`, "`N` odd,
   prime to `2∏lᵢ·l′`, `N > nᵢ + 1`", several `nᵢ` with one `N`).

   **Claim.** For the self-dual datum `ρ(γ∞)` is unipotent whenever `n` is even and `N > n + 1` is odd.

   **Witness.** `n = 6`, `N = 9` satisfies every stated hypothesis of §5.6 and §9.4; the proof's last step
   fails: `c = ζ₉³` has `c⁹ = 1` and `c⁶ = 1`, `c ≠ 1`. The statement itself is true (BLGHT11 line 1113
   and 1139–1140 prove it with no coprimality), so the defect is the proof route, not the claim; adding
   `gcd(nᵢ, N) = 1` to §5.6 would narrow it below the source.

   **Repair.** Replace the last two sentences of the §4.4 proof sketch by:

   > After the Betti–étale comparison, `ρ_{t′}(γ∞) = c·u` with `u` unipotent and `c` the value of `L_θ` on `γ∞`, a scalar with `c^N = 1`; the value of `L_θ` on `γ₀` is `c⁻¹`. For Qian's data, `det ρ_{t′}(γ∞) = 1` (§4.2 and the unipotence part of §4.3, which does not use this target) gives `c^n = 1`, and `gcd(n, N) = 1`, which is assumed for Qian's data, gives `c = 1`. For the self-dual data no coprimality is used: at `t′ = 0` the pullback of `E_λ` has the eigenvalues of `⊕ L_{ρᵢ}` (§3.3), which as a set are `ζ_N^b`, `b ∈ B`, because `B = −B`; so `ρ(γ₀)` has eigenvalues `c⁻¹ζ_N^b`, and by §4.2 these are again `ζ_N^b`, `b ∈ B`. Writing `c⁻¹ = ζ_N^θ`, `B + θ = B`, hence `C + θ = C` for the complement `C`, an interval of length `L = N − n` with `3 ≤ L ≤ N − 2`; by the overlap count of §1.5(2), `#(C ∩ (C + θ)) < L` for `θ ≠ 0`. So `θ = 0` and `c = 1`.

   and replace the third Check of §4.4 by: "For Qian's data `gcd(n, N) = 1` is used: for `n = N = 3` a
   scalar cube root of unity has determinant one. For the self-dual datum with `n = 6`, `N = 9`
   (`gcd = 3`) the scalar `c = ζ₉³` has `c⁶ = 1` and is excluded by the eigenvalues at zero instead:
   `B = {2, …, 7}` and `B + 3 = {5, 6, 7, 8, 0, 1} ≠ B`." Add §1.5 to the *Needs* of §4.4. Tested on
   the instance: `C = {8, 0, 1}`, `C + 3 = {2, 3, 4}`, overlap `0 < 3`, so `θ = ±3` is excluded.

3. **F03** (P2) Qian's switching theorem (§9.3) does not state the ordinarity at `l` that Layer 8 exists to supply; no target consumes §8.1

   **Location.** `README.md:1488` (§9.3): "Consequently `V_{λ,t}` has the prescribed residual
   representation at `l`, `V_{λ′,t}` at `l′`, `V_{λ′,t}` is ordinary at the places above `l′` (§7.8), and
   `V_{λ′,t}` has maximal unipotent monodromy at the places above `l` (§7.10)." `README.md:1490`
   (*Needs*): "§§7.8, 7.10, 9.1, 9.2; …". `README.md:1666` lists Layer 8 among Layer 9's dependencies.

   **Claim.** The switching theorem delivers the local properties its consumers need, and every layer is
   what the final targets need.

   **Witness.** QIAN23 line 1299–1300: the proof of the potential automorphy theorem uses that the
   `λ`-adic fibre at the switching point, twisted by `χ₁⁻¹`, is regular ordinary at the places above `l`
   (its Lemma 3.10(4), QIAN23 line 1017–1018, `v(t) < 0`). §9.3(iii) arranges `v(t) < 0` above `l` but
   never draws that conclusion, and `grep '§8.1'` finds it only in Checks (§3.4, §7.10): Layer 8 is
   consumed by no target.

   **Repair.** In §9.3 extend the "Consequently" sentence with: "and, for every place `v | l` of `F′`,
   `V_{λ,t}|_{G_{F′_v}}` is ordinary of weight `μ` with `μ_{σ,i} = M(a_σ)` (§8.1, since `v(t) < 0`,
   `l ∤ 2N` and `F′_v ∋ ζ_N`); for `n = 2`, `V_{λ,t}((N − 3)/2)` is ordinary of weight `0` there"; add
   §8.1 to its *Needs*. In §9.4 add the same clause for `V_{λᵢ,tᵢ}((N − 1 − nᵢ)/2)` at the places above
   `lᵢ` and §8.1 to its *Needs*. Tested: the instance QIAN23 line 1299–1300 is then a stated conclusion.

4. **F04** (P2) `gap:twisted-modular-curve-over-number-fields` is compound, and one clause is unused and false as stated

   **Location.** `README.md:137`: "…its geometric connectedness, a smooth model with good reduction of
   the universal curve over O_F[1/r], and for every prime p ∤ r the equality of the geometric mod-p
   monodromy…".

   **Claim.** A declared gap is precise and minimal.

   **Witness.** The integral-model clause occurs nowhere else in the README (§§9.11–9.12 get good
   reduction from integral `j` and trivial `ℓ`-torsion). It is false at the stated generality: for `ρ`
   ramified at a place `v ∤ r`, the universal curve has `r`-torsion `ρ`, ramified at `v`, hence no good
   reduction there (Néron–Ogg–Shafarevich).

   **Repair.** Replace the `needs` sentence, in `README.md:137` and in the `gaps` entry of
   `design/plan.json`, by: "For a number field F, an integer r ≥ 3 and a continuous ρ : G_F → GL₂(ℤ/r)
   with determinant the mod-r cyclotomic character, the twisted curve Y(ρ)/F with its universal elliptic
   curve, smooth and geometrically connected over F, such that for every prime p ∤ r the geometric
   mod-p monodromy of the universal curve is SL₂(𝔽_p)." Tested on the instance: no clause now speaks of
   places where `ρ` ramifies.

5. **F05** (P2) §0.11(1) is a target with no proof plan; its only source is uncertified

   **Location.** `README.md:336`: "(1) is the odd-characteristic, dimension-greater-than-two case of the
   Zalesskii–Serezhkin classification; no argument through an element of large order replaces the
   classification."

   **Claim.** Each target carries a proof plan whose inputs are owned.

   **Witness.** The sketch restates the target. `sources.toml` records `ZS76` as `uncertified`
   (`licence_class = "none"`), so no text of the proof was read; §§5.1–5.3, i.e. three of the five
   theorems of `Suggested.lean`, rest on it. No roadmap on main or open states it (`roadmaps grep
   'Serezhkin|generated by transvections'`: only an unrelated `K₁(ℤ)` line).

   **Repair.** Either (a) give the route in the roadmap's own words with readable sources, fetched
   through the sources service and recorded in `sources.toml`: the reduction of an irreducible group
   generated by transvections to one generated by full root subgroups and the classification of the
   latter (candidates to fetch and check, locators not verified by this pass: J. McLaughlin, *Some
   groups generated by transvections*, Arch. Math. 18 (1967), 364–368; W. M. Kantor, *Subgroups of
   classical groups generated by long root elements*, Trans. Amer. Math. Soc. 248 (1979), 347–379,
   Theorem II); or (b) say plainly in §0.11 that (1) is taken from the classification with no plan and
   list it for the human reviewers as an input whose proof text was not read. This pass could not write
   (a) from a read text.

6. **F06** (P2) Two statements follow their source clause by clause

   **Location and witness.**

   1. `README.md:1387` (§7.13): "There is a nonempty Zariski open `U(v; λ) ⊂ T_{0,k(v)}` such that for
      every finite extension `F_w/ℚ(ζ_N)_v` and every `t ∈ T₀(O_{F_w})` whose reduction lies in …" —
      BCGNT25 line 2127–2130, same clauses in the same order with "any" → "every"; 7 consecutive words
      shared ("is a crystalline ordinary representation of `G_{F_w}`").
   2. `README.md:889` (§5.2): "a diagonal element `diag(α, β, (αβ)⁻¹, 1, …)` of `SU` with
      `σ(α)α = σ(β)β = 1` is conjugate into `Sp_n` only if one of `α, β, αβ` is `1`" — BLGHT11 line
      1205–1208, same sentence; 5 consecutive words shared.

   **Repair.** (1) "Ordinarity of `W^ℚ_{t,λ}` depends only on the reduction of `t`, and holds generically:
   the points `x` of `T_{0,k(v)}` such that `W^ℚ_{t,λ}` is crystalline ordinary for every integral lift
   `t` of `x` over the ring of integers of a finite extension of `ℚ(ζ_N)_v` contain a nonempty Zariski
   open subset `U(v; λ)`." (2) "For `n > 2`, `SU(n, k′)` has no conjugate inside `Sp_n`: an element of
   `Sp_n` has its eigenvalues in inverse pairs, while `SU(n, k′)` contains diagonal elements with three
   eigenvalues `α, β, (αβ)⁻¹` of norm one, none equal to `1`, and all others `1`."

7. **F07** (P3) §3.1 does not say which character of `μ_N` an index `b ∈ B(a)` denotes

   **Location.** `README.md:642`: "For a zero-shaped Dwork datum the characters are those indexed by
   `B(a)`, with this Kummer convention".

   **Witness.** BCGNT25 line 2001–2003 takes the `ρᵢ` to be the nontrivial characters absent from `χ`,
   i.e. the exponents `−B(a)` in the identification of `README.md:428` (`B(a)` is the complement of the
   negatives of the values). For Qian's data `−B ≠ B` (§1.5), so `ζ ↦ ζ^b` and `ζ ↦ ζ^{−b}` give
   different sheaves `E_λ`, and §3.4 holds for one of them only. No Check pins the choice.

   **Repair.** Replace the sentence by: "For a zero-shaped Dwork datum the `ρᵢ` are the `n` nontrivial
   characters of `μ_N` that do not occur among the components `ξ_j ↦ ξ_j^{a_j}` of `χ_a`; they are
   normalised by the requirement that the local monodromy at `t′ = 0` of the pullback of `⊕ L_{ρᵢ}`
   along `t′ ↦ 1/t′`, on the loop `γ₀` of §4.1, has the eigenvalues `ζ_N^b`, `b ∈ B(a)` (§4.2)", and add
   the Check: "For Qian's datum with `n = 3`, `N = 401` the set is `{1, 2, 398}` for one orientation and
   `{400, 399, 3}` for the other; only the first agrees with §4.2."

8. **F08** (P3) Scope is silent on the hypergeometric lisse sheaf of HypergeometricMotives §5.0

   **Location.** `README.md:14` and `README.md:40` (Kept variants: "The hypergeometric sheaves of Layer 3
   are Katz's general construction…").

   **Witness.** HypergeometricMotives §5.0 (earlier in the merge order): "Construct the corresponding
   hypergeometric lisse sheaf on `𝔾_m ∖ {1}` and its middle extension from this cohomology", with local
   monodromies its triple of §3.2. Two roadmaps construct a hypergeometric lisse sheaf on the same base
   and neither names the other.

   **Repair.** Add to Kept variants: "HypergeometricMotives §5.0 constructs, for a cyclotomic datum over
   `ℚ` and `ℚ_ℓ`-coefficients, a hypergeometric lisse sheaf on `𝔾_m ∖ {1}` from a toric hypersurface.
   The sheaves `E_λ` of §3.1 have `M_λ`-coefficients and a list of characters of `μ_N` that is not stable
   under `Gal(M/ℚ)` (Qian's `B` has trivial stabiliser, §1.5), so they are not among them; no comparison
   of the two constructions is asserted or used."

9. **F09** (P3) The symplectic case of §5.12 is stated here and in ModularityAndLanglandsExtensions §2.14

   **Location.** `README.md:1046`: "For the self-dual data this is the geometric connectedness of the
   pairing-preserving trivialization scheme in ModularityAndLanglandsExtensions §2.14".

   **Witness.** That section's API (ModularityAndLanglandsExtensions §2.14, third bullet): "Prove
   geometric connectedness of this scheme and nonemptiness of the prescribed real and finite local
   loci." §5.12 proves the same statement from §§5.6 and 5.10; the supplier is earlier in the merge
   order and states no residual-monodromy target.

   **Repair.** In §5.12 write: "For the self-dual data the statement is ModularityAndLanglandsExtensions
   §2.14 and is cited, not a target here; what this roadmap adds for it is the residual monodromy
   (§§5.6, 5.10), which that section's proof needs and does not state." and keep the linear, unitary and
   mixed cases as this roadmap's target. Record for the board that the supplier's §2.14 has an input in
   this later roadmap.

Read in full: `packages/PotentialAutomorphyDworkMotivesPartII/README.md` (1702 lines) and
`packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean` (197 lines). Nine findings: one P1,
five P2, three P3. No finding of an earlier repair report is marked `not actionable in this package`,
so nothing is re-raised.

## The adversarial pass: values computed

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `qianIndexSet` (Lean) / §1.4 | `n = 3, N = 401`; `n = 4, N = 501`; `n = 5, N = 601` | `{1,2,398}` sum 401; `{1,2,3,495}` sum 501; `{1,2,598,300,301}` sum 1202 = 2·601; general sum `(n−3)N/2`, `(n−4)N/2` ≡ 0; card `n` | agrees with README and QIAN23 line 485–486 |
| Qian's `a` vs `B` (§1.4) | complement of `−values` for odd and even `n` | values `{1,2,4,…,(N−n+2)/2,(N+n−2)/2,…,N−3}`: count `N−n−1`; even case `{1,…,5,7,…}` | agrees |
| `selfDualIndexSet` | `N = 7, n = 2`; `N = 5, n = 2`; `N = n + 1` | `{3,4}`; `{2,3}`; all nonzero residues | agrees; boundary excluded by `2m+1 < N` |
| `ZeroShapedDatum.indexSet` | `N = 5`: `A′ = {1,4}`; `N = 7`: `A′ = {1,2,4}`; `n = 0`; `N = 3, n = 1` | `B = {2,3}`; `B = {1,2,4}`; `B = ∅`; no datum exists (sum ≠ 0) | card `n`, `0 ∉ B` |
| `zeroShaped_gauss_product` | multiset `B ⊎ (A′+B)`: `N = 5` → `{1,2,2,3,3,4}`; `N = 7` → each of 1..6 twice; general count `m(c) = m(−c)` | both sides `q^{n(N−n)/2}·(∏g(b))^n`; numerically at `N = 7`, `q = 29` reduced mod 43: determinants `41, 42` (cubes) | true as typed (holds even without `sum_eq_zero`); `χ(−1) = 1` needs `Odd N` (in scope) |
| `qian_hypergeometric_group_eq_SL` | `h₁` determinant; proper subfield; `Sp`; `SU`; `l ≡ 1 (N)` | `det h₁ = ζ^{−ΣB} = 1`; `l^jB = B ⇒ l^j ≡ 1`; `B ≠ −B`; `l^jB = −B` impossible | consistent with QIAN23 line 682–715, given §0.11 (R05) |
| `selfDual_hypergeometric_group_conj_Sp` | trace field: `αC = C` for interval `C`; `l = 3, N = 7` | only `α = ±1`; `𝔽₃(ζ₇+ζ₇⁻¹) = 𝔽₂₇ ⊊ 𝔽₇₂₉` | consistent with BLGHT11 line 1182–1227 |
| `qian_hypergeometric_group_conj_SU` | `σ = id`?; eigenvalue stability; rank condition under `g ↦ σ(g)⁻ᵀ` | `σζ = ζ⁻¹`, `N > 1` odd ⇒ `σ ≠ id`, order 2; `σ(ζ^b)⁻¹ = ζ^b`; rank preserved | statement consistent; hypotheses in scope |
| `qian_two_prime_hypergeometric_group` | `l₁ = l₂`; orders 5, 7, 11, 3209 mod 401 | diagonal is proper; orders 25, 200, 200, 1; `7¹⁰⁰ ≡ 11¹⁰⁰ ≡ 400` | agrees with README Checks and QIAN23 line 738–742 |
| §0.1 Check `w(2)w(−1)` | matrix products | `[[0,2],[−1/2,0]]·[[0,−1],[1,0]] = diag(2,1/2)` | true |
| §0.4 Check 4 | `h₀ = diag(1/2,1/3)`, `h∞ = diag(2,4)` | `h₁ = diag(1,3/4)` | true |
| §0.5 order formula | `n = 2, q = 3` | `3·(9−1) = 24` | true |
| §1.1 | `l = 3, s = 4, N = 35`; `l = 2, N = 7` | order 12, `3⁶ ≡ 29`; order 3 | true |
| §1.2 Hessian | `(1:…:1)`, `t = 1` | `N(N·I − J)`, kernel the Euler direction | true |
| §2.1 count | `N = 5` | `(1024 − 4)/5 = 204` | true |
| §2.5 idempotent, twist | `e = ½(1+ς)(e_χ+e_{χ⁻¹})`; `(2−N)+(N−1−n)` | `e² = e`, rank `n`; `1 − n` | true |
| §3.5 weights | `Ψ c(Ψ)`; `n = 2, N = 5` | `ε^{(2−N)−(1−n)} = ε^{n+1−N}`; weight 6 = `n(N−2)` | true; BCGNT's printed twist is a misprint |
| §4.4 | `n = 6, N = 9` | `c = ζ₉³`, `c⁶ = 1` | proof fails: R02 |
| §5.6 | products of two order-3 elements of `SL₂(𝔽₅) ⊂ SL₂(𝔽₉)` | trace `2 ± i` is a root of `x² − x − 1`: order 10, not 5 | true |
| §5.11 | `#SL₃(𝔽₇)`; `#Sp₂(𝔽₁₁)` | 5630688; 1320 | true |
| §6.1 Check | cubic Jacobi sum over `𝔽₇` | norms of `2+3ω`, `−1−3ω` are 7; trace −1; 9 points | true |
| §6.3 Check | orders mod 301, 43, 7 | 42; 42; 6 | true |
| §6.4 Check 4 | `a = (0,0,0,1,3,5,5)`, `q = 29`, `l = 43` | exponents `6,1,5,2,3,4`; reductions `{4,6,7,22,29,31}`; `29¹⁴ ≡ 6`, `29²⁸ ≡ 36` | true |
| §6.7 | exponent arithmetic | `n(N−n−2)/2 − n(n−1)/2 = n(N−2n−1)/2`; `3209 ≡ 2 (3)` | true |
| §7.2 | wrap count; self-dual `M(a)` | `G(d+1) − G(d) = 1 − w`; `M(a) = (N−1−n)/2` for every `a`; grades `1,1,2` and `2,2,3` | true |
| §7.12(ii) | ordinary vs supersingular point | `1/2 ≤ 1` | direction agrees with DK17 line 223–229 |
| §8.1 Check 2 | `φe₁ = pe₁`, `φe₂ = p²e₂`, `Ne₂ = e₁` | `Nφ = pφN`; `t_H = t_N = 3`; sub `⟨e₁⟩`: `0 ≤ 1` | true |
| §9.7 Checks | point counts | `p = 5`: 8; `p = 7`: 8; `p = 11`: 12, 12, 14; `p = 13`: 8, 12, 14, discriminant 5 | true |
| §9.8 | `m = 3, Q = 7` | `(1,2,−3) ≡ (1,2,4)`, sum 0; bound `(m−1)(m+2)/2 = 5 < 7` | true |
| §9.12 | determinant and multiplier | `ε̄^{−m²n(n−1)/2 − nm(m−1)/2} = ε̄^{−nm(nm−1)/2}`; `ε̄^{1−nm}` | true |
| Examples | `3209`, `7237` | smallest prime ≡ 1 (401); `12·603+1`, prime | true |

## Verified sound

- **Declarations read:** 10 of 10 in `Suggested.lean` (4 definitions including one structure with its
  three fields, 5 theorems, 1 helper definition). Each elaborated type in the worker's signature file
  was compared with its README statement (§§1.4, 5.1–5.4, 6.2): binders, instances and generality
  agree; no section `variable` is used, so nothing is lost. I ran no Lean and changed no file, so
  there is no `#check` re-run to report.
- **Headlines and padding:** the headline theorems are the residual hypergeometric groups (stated),
  the Gauss-sum determinant formula (stated) and the geometric, `p`-adic and switching theorems, each
  named as not statable in the module docstring with the missing carrier. One-tactic probe, by
  reading: none of the five theorems follows from one library lemma (`zeroShaped_gauss_product` needs
  the multiset symmetry above plus `gaussSum_mul_gaussSum_eq_card`). No padding found, no statable
  headline found absent.
- **Form and policy:** single `import Mathlib`; no `set_option`, `lemma`, `#eval`, `True` placeholder
  or sorry'd data; no pull-request number or process word in README or docstrings.
  `git diff --stat origin/main...HEAD` shows only files of the package folder.
- **Targets read:** all 84 numbered targets of Layers 0–9, with Conventions and the supplier contracts.
- **Checks tested:** 45 recomputed (the rows of the table above, several Checks to a row); none
  false. The other Checks were read against their section and not recomputed. Each of the 84 targets
  has a Checks block with at least three entries.
- **Locators verified against the cached texts:** 46 (QIAN23 15, BLGHT11 12, BCGNT25 13, DK17 2,
  KATZ09 3, DMOS82 1); spot-located only: BLGGT14, WATERHOUSE69, BER10, QIAN21, CEGS, BH89, ACC23.
  BLGHT11's printed page is the extraction's page minus one, which the README's pages follow.
- **Pinned declarations grepped:** 32 Mathlib and 11 Tau Ceti names of the contracts (every name of
  the Tau Ceti contract; of the Mathlib contract all but the basic carriers such as `Matrix.charpoly`,
  `Matrix.rank`, `MulChar`, `IsPrimitiveRoot`), all present at the pins with the stated content (`LinearEquiv.transvections` and `dilatransvections` both contain
  the identity, as the README says).
- **Sibling citations checked at their heads:** HypergeometricMotives §3.4 (`levelt_rigidity_field`,
  `levelt_irreducible_field`, items (i), (ii), (iv), same hypotheses); ArithmeticGaloisDuality
  §R02.4.6 (including the split primes and unramified root); ModularityAndLanglandsExtensions
  §§2.9–2.12, 2.14, 2.18; LefschetzPencilsAndVanishingCycles §2.4 (the henselian implicit function
  theorem is inside that section) and §§0.1, 0.5, 0.8a, 1.1, 1.6, 2.7, 2.8 by heading;
  PadicDifferentialEquationsAndRigidCohomology §§RD.2.3, RD.3.34, RD.3.37, RD.3.43, RD.5.8, RD.7.7 by
  heading; ModularCurvesPartII §5.14 by heading. The worker's citation list reports no cross-roadmap
  citation found nowhere; its five Lean-name leads are three supplier names and two of this file's own.
- **Declared gaps:** five, each with the same slug in `design/plan.json` and in the README; four are
  precise and minimal; the fifth is R04.
- **Dependency check** (command of the brief): `depcheck: 223 roadmaps, 1993 edges, 0 problem(s)`.
  No UPWARD, CYCLE or `moved:` line. No supplier from the forbidden list is cited.
- **Ownership against open pull requests:** searched by object (`Zalesskii`, `Drinfeld–Kedlaya`,
  `hypergeometric shea`, `Dwork`, finite unitary groups, `Levelt`, the four definition names) on main
  and at the open heads; results are R01, R08, R09. No `Suggested.lean` at an open head declares a
  name of this file. The overlap list reports no pull request changing this roadmap and no dropped id.

## Not verifiable

- `ZS76`, `ARTIN55`, `LEWIS82`, `KM74`, `KIS99`, `KATZ90`: settled as uncertified; the statements of
  §§0.7, 0.10, 0.11, 3.2, 3.3, 6.8 and 9.5 attributed to them were not compared with a text.
- The exact sign in §3.4 and §4.2 between `B` and `−B` (R07) depends on Katz's normalisations in
  `KATZ90`, not readable here.
- Truth of the three classical-group theorems of `Suggested.lean` was checked only against the
  sources' arguments and by the exclusions above; no instance is small enough to enumerate
  (`N > 100n + 100`, or `Sp₄(𝔽₂₇)`).
- §§9.7–9.12 were checked for internal consistency and against BCGNT25 line 3160–3345, not
  re-derived; the README's source corrections that I did not recompute are not repeated under
  `## Source issues`.
- Supplier sections cited by heading only (the EtaleCohomologyFoundations, PadicHodgeTheory,
  LocalGaloisDeformationRings, PotentialModularityAndCompatibleSystems, FourierDeligneTransform,
  CharacterSumsOverFiniteFields, EtaleDualityAndPerverseSheaves, ComplexComparisonPartII lists): their
  existence rests on the worker's resolver; their hypotheses were not re-read line by line.

## Source issues

- **Misprint** in BCGNT25 at proof of Lemma 4.2.4, arXiv v3 p. 42: the source says the conjugate eigensheaf is the dual twisted by `1 − N`; it should be `2 − N`, the fibres having dimension `N − 2`; affects a stated result.
- **Misprint** in BCGNT25 at Lemma 4.2.4, arXiv v3 p. 41: the source says `Ψ` times its conjugate is the `(N − n)`-th power of the norm character; it should be the power `N − n − 1`; affects a stated result.
- **Misprint** in BCGNT25 at Definition 4.3.1, arXiv v3 p. 45: the source says the special unitary group is the kernel of the multiplier; it should be that kernel intersected with determinant one, as used in Proposition 4.4.2; affects nothing.
- **Misprint** in BCGNT25 at §4.1, arXiv v3 p. 40: the source says the eigensheaf is cut out of the direct image with no degree; it should be the higher direct image of degree `N − 2`; affects nothing.
- **Error** in BCGNT25 at Lemma 4.4.4, arXiv v3 p. 48: the source says inertia acts by positive powers of the direct fundamental characters; with its own conventions (§1.6, weights `0..n−1`, determinant a negative cyclotomic power) the exponents should be negative; affects a stated result.
- **Error** in BCGNT25 at proof of Theorem 6.2.4, arXiv v3 p. 67: the source says the residual image of the auxiliary system is the full general unitary group; it should be the subgroup with the prescribed determinant and multiplier, containing the special unitary group; affects the proof.
- **Gap** in QIAN23 at Lemma 3.3(2), arXiv v1 pp. 13–14: the source says a semistable model over the parameter line gives unipotence of the monodromy at infinity on the quotient line; it gives it only for the `N`-th power, and the scalar must be excluded separately; affects the proof.

## Copyright, licences and scope

Wording: 15 passages compared (§§0.8, 1.2–1.3, 1.5, 2.5, 3.1–3.4, 5.1, 5.2, 5.11, 6.2, 7.11, 7.12,
7.13, 9.7, and the docstrings of the four group theorems of `Suggested.lean`) with QIAN23, BLGHT11,
BCGNT25 and DK17; two follow their source clause by clause (R06). Arrangement: QIAN23 has the largest
share; it has three sections (preliminaries, Dwork motives, proof), and the ten layers do not map onto
them: Layers 0, 3 and 8 and the unitary and two-source Layer 9 have no counterpart section, and the
order of Layers 1 → 2 → 4 → 5 is forced by the *Needs* lines (§2.3 needs §1.2–1.4, §4.2 needs §2.6,
§5.5 needs §4.7). Reuse: no table, figure or data set is taken over; the exponent vectors and index
sets of §1.4 are formulas. No declaration of `Suggested.lean` was found in a public formalisation
(not searched beyond the pinned libraries and the open roadmaps).

Source independence: 15 passages compared with 4 sources, 2 shared (R06); largest share QIAN23, 54 of 179 locators; contents compared with QIAN23: independent.

## For the human reviewers

- **Licence.** `sources.toml` records `ZS76`, `ARTIN55`, `LEWIS82`, `KM74`, `KIS99`, `KATZ90` as uncertified (paywalled); §0.11(1), on which three theorems of `Suggested.lean` rest, cites only `ZS76` (R05).
- **Licence.** `BLGHT11`, `KATZ09`, `ACC23`, `CEGS` are read from author pages (`licence_class = "author-page"`); the README cites author pagination for them.
- **Scope.** `QIAN21` and `ACAMPO24` are arXiv preprints with no journal reference in the README (`README.md:1683`, `README.md:1702`); they are cited for §8.1 and one Check only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3e807ed2cf5e92a862e1e0f414027cedc7e557ba", "job": "RT-PotentialAutomorphyDworkMotivesPartII~1b", "model": "fable", "worker": "chris-x11"} -->
