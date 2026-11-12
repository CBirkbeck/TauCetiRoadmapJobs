<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13146#issuecomment-6794197956 -->
Red team round 2 pass b (claude) of 3936d0c

Verdict: needs_changes

1. **F01** (P2) 2.5a computes the cusp constants only of the ordinary series, but reads `a_k` off a decomposition that contains the non-ordinary ones

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md:555` ("for every ordinary series `E_k(η, φ_S)` of 2.2a at level `𝔫_S` … `c_λ(0, E_k(η, φ_S)|A) = 0` unless"), `:560` ("Then slash the decomposition of 2.2a by `A` … the ordinary projector fixes these lines").

   **Claim.** The coefficient `a_k` of `E_k(χ, ω^{1−k})` in `e(E_1(1, χ)·ν_{k−1}(𝒢))` follows from the constants at `A` of the ordinary series, of `E_1(1, χ)` and of `ν_{k−1}(𝒢)`.

   **Witness.** The second item gives `c_λ(0, P|A)` for the unprojected `P = E_1(1, χ)·ν_{k−1}(𝒢)`, whose 2.2a decomposition contains non-ordinary series. `F = ℚ`, `χ_4`, `p = 5`, `k = 5`: `ℰ_5(20, χ_4)` has the four `U_5`-eigenvectors with eigenvalues `1, 625, 1, 625`; the constant at `A` of `E_5(χ_4, 1) − E_5(χ_4, 1)|B_5` is not stated. DDP11 lines 1020–1023 state the vanishing for every pair, not only the ordinary ones.

   **Repair.** In 2.5a replace the first item up to "unless" by:

   > at level `𝔫_S` and character `χω^{1−k}` the complement `ℰ_k` of 2.2a has the basis of imprimitive series `E_k(η′, φ′)` (2.2a, fourth API item) over the pairs of characters of moduli `𝔪_{η′}𝔪_{φ′} = 𝔫_S` with `η′φ′ = χω^{1−k}`: no tame translate occurs (the conductor argument of 2.6), and at a prime `𝔮 | p` where both primitive characters are unramified the two series `(1 − η(𝔮)B_𝔮)E_k(η, φ)` and `(1 − φ(𝔮)N𝔮^{k−1}B_𝔮)E_k(η, φ)` span the two translates, their `U_𝔮`-eigenvalues `φ(𝔮)N𝔮^{k−1}` and `η(𝔮)` being distinct. Each `E_k(η′, φ′)` is an eigenvector of every `U_𝔮`, `𝔮 | p`, and is ordinary exactly when `𝔪_{η′}` is prime to `p`, where it is `E_k(η, φ_S)`. For every such pair, ordinary or not, `c_λ(0, E_k(η′, φ′)|A) = 0` unless `𝔪_{η′} = 𝔫`, `η′ = χν⁻¹` and `φ′ = (ω^{1−k}ν)_S` for a character `ν` of `Cl⁺(F)` (when a prime above `p` divides `𝔪_{η′}`, every lattice vector contributing to the constant has its `η′`-argument divisible by that prime, since `α_λ ∈ 𝔠_p𝔡t_λ`: Dasgupta–Darmon–Pollack, proof of Proposition 2.3, pp. 462–463);

   and in the route replace the sentence beginning "Then slash the decomposition of 2.2a by `A`" by:

   > Then slash the decomposition of the unprojected product `E_1(1, χ)·ν_{k−1}(𝒢)` in this eigenbasis by `A`: cusp forms and the non-ordinary series have zero constants, the remaining tuples are independent by the independence of the characters `ν` of `Cl⁺(F)`, so the coefficient of `E_k(χ, ω^{1−k})` in the product is the stated `a_k`; the ordinary projector kills the non-ordinary eigenvectors and fixes the ordinary lines (eigenvalues `χν⁻¹(𝔮)`, units), so `a_k` is also the coefficient in `e(E_1(1, χ)·ν_{k−1}(𝒢))`.

   Tested on the instance: the four pairs are `(χ_4, 1_5)`, `((χ_4)_5, 1)`, `(1, (χ_4)_5)`, `(1_5, χ_4)`; the second and fourth have `5 | 𝔪_{η′}` and the third has `η′ ≠ χν⁻¹`, so only `(χ_4, 1_5)` has a nonzero constant at `A` and `a_5` is determined. Over `ℚ` the vanishing is direct: the constant of `∑ ψ(c)φ̄(d)G_k^{(cv, d+ev)}|A` needs `c ≡ 0 (mod p)` when `p` divides the modulus of `ψ`, where `ψ(c) = 0`.

2. **F02** (P2) 2.3 passes from Ventullo's family on a small weight disc to `M°(1, ω⁻¹)_(0)` with no carrier and no comparison

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md:499` ("interpolate its powers `f^{s}` in a Λ-adic family over a sufficiently small weight neighbourhood using the binomial expansion … apply the ordinary projector on the integral finite quotients before localizing at weight zero").

   **Claim.** The binomial family, projected, is an element of the supplied module `M°(1, ω⁻¹)` localized at weight zero.

   **Witness.** The supplied families are over `Λ = 𝒪_E[[T]]` and classical at every `k ≥ 2` (PadicFamilies §5.10, Checks: "the condition is imposed at every integer `k ≥ 2`"). The powers `f^j` are classical only in weights `wj`; `F = ℚ`, `p = 5`, `f ≡ 1 (mod 25)` of weight `20`: the weight-`3` member would be `f^{3/20}`. V15 lines 596–610 (§4.1, p. 15) needs a separate module of `ℤ_p[[T/p^r]]`-adic forms and a rank comparison; the README states neither. The alternative "Ventullo's Lemma 3 at an auxiliary level" needs `W_𝔮` on families, which no supplier states.

   **Repair.** In 2.3, (a) delete "or Ventullo's Lemma 3 at an auxiliary level `𝔮 ∤ p`" and "remove an auxiliary level by `(W_𝔮 + U_𝔮)/(1 + N𝔮⁻¹)`;" (`hilbertHasseLift` already has level one); (b) replace "apply the ordinary projector on the integral finite quotients before localizing at weight zero" by the following, and state it as part of the target:

   > Let `Λ_r = 𝒪_E[[T_r]]` be the ring of the disc of weights `k ∈ wℤ_p` around `0`, a `Λ`-algebra, and call a small-disc family a tuple of coefficients `c(𝔞)`, `c_λ(0)` in `Λ_r` whose specializations at infinitely many integers `k ≥ 2` of the disc are the coefficients of classical forms of weight `k`, level `∏_{𝔮|p}𝔮` (the dyadic level at `p = 2`) and character `ω^{−k}` in the standard-component lattice; the binomial family of `f` is one, with specializations `f^j` at `k = wj`. Prove: (1) `∏_{𝔮|p}U_𝔮` acts on small-disc families and its factorial powers converge, because modulo each power of `(ϖ_E, T_r)` a family is determined by finitely many of its classical specializations, each in a finite stable lattice; the limit `e` commutes with those specializations. (2) Every ordinary small-disc family `𝒦` lies in `M′°(1, ω⁻¹) ⊗_Λ Frac(Λ_r)`: for a `Λ`-basis `h_1, …, h_d` of the finite free `M′°(1, ω⁻¹)` and ideals `𝔞_1, …, 𝔞_d` with `D = det(c(𝔞_i, h_j)) ≠ 0`, Cramer's rule gives `x_j ∈ D⁻¹Λ_r` with `c(𝔞_i, 𝒦) = ∑_j x_j c(𝔞_i, h_j)`; at the infinitely many classical weights of the disc with `ν_k(D) ≠ 0`, ordinary control puts `ν_k(𝒦)` in the span of the `ν_k(h_j)`, so every coordinate of `D𝒦 − ∑_j Dx_j h_j` has infinitely many zeros in the disc and vanishes. (3) If `𝒦` is regular at weight zero, choose `y_j ∈ Frac(Λ)` with `x_j − y_j` in the maximal ideal of the localization of `Λ_r` at weight zero (same principal part and value there); then `∑_j y_j h_j ∈ M′°(1, ω⁻¹) ⊗_Λ Λ_(0)`, with the same weight-zero specialization as `𝒦` (Ventullo §4.1, p. 15).

   Add to the *Needs* of 2.3: "NoncommutativeAndEquivariantIwasawa §F.5 (finite freeness of `M′°` and ordinary control at every `k ≥ 2`)". Tested on the instance: for `p = 5`, `w = 20`, the family is used only at the weights `20j`, where `f^j` is classical; weight `3` is never evaluated on the small-disc family, and the output `∑ y_jh_j` is classical at weight `3` because the `h_j` are.

3. **F03** (P3) 2.3: the Eisenstein decomposition it uses is not in its *Needs*, and the constants are normalized by an unstated division

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md:499` ("finally subtract the Eisenstein contributions `E(η, η⁻¹ω⁻¹)` with `η ≠ 1` by Hecke operators … *Needs:* 2.2; IntegralIwasawaTheory §9.3").

   **Claim.** After the Hecke operators the family has every standard-cusp constant identically `1`; the inputs are 2.2 and the listed suppliers.

   **Witness.** That only the pairs `(η, η⁻¹ω^{−k})`, `η` of conductor `1`, occur is the decomposition 2.2a at level `∏_{𝔮|p}𝔮`, which `:499` does not list. After the operators the family is `a·𝒢_0 + (cusp)` with `𝒢_0` the constant-one multiple of `E(1, ω⁻¹)`; its constants are `a`, with `ν_0(a) = 1` only.

   **Repair.** Append to the route: "the surviving family is `a·𝒢_0` plus a cuspidal family, where `𝒢_0` is the multiple of `E(1, ω⁻¹)` with all standard constants `1` and `a ∈ Λ_(0)` is its common standard constant, with `ν_0(a) = 1`; divide by the unit `a`." Change the *Needs* to "2.2, 2.2a; …". Tested: for `a = 1 + (T − u⁻¹ + 1)` the undivided family has constant `a ≠ 1` and weight-zero value `1`; after division both are `1`.

Round 2. All eleven round-1 findings are repaired at this head and no repair introduced an error. The full pass found two new P2 findings (S01, S02), both proof-plan steps with no owner, and one P3 (S03). No statement of the roadmap was found false.

## Round 1 findings at this head

| Finding | Status | Repaired passage (file:line) and witness |
|---|---|---|
| 1a/F01 (P1) reversed family `E(χ, 1)` unowned | repaired | `packages/IntegralIwasawaTheoryPartII/README.md:115`: "What NoncommutativeAndEquivariantIwasawa must provide (gap:reversed-ordinary-eisenstein-family): for odd `p` … `χ(𝔮) = 1` for every `𝔮 \| p`"; same slug in `design/plan.json` `gaps`; cited in 2.2 (`:454`). Coefficient check: `ν_1` has coefficient `χ(𝔞_p)∑_{𝔯 \| 𝔞′}χ(𝔯)`, equal to that of `E_1(1, χ_S)` iff every `χ(𝔮) = 1`. |
| 1a/F02 (P1) reducedness of `Â` | repaired | `README.md:704`: "`A` is excellent and in particular a local G-ring (SchemeAndStackFoundations §0.21, `excellent_examples`), its completion map `A → Â` is regular"; both names are at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1568,1581` on main, with the stated content. |
| 1a/F03 (P2) edge isomorphism absent from the Lean file | repaired (differently) | `Suggested.lean:62`: `isIso_coinfNatTrans_app_of_isZero_groupHomology_res`, for any normal `S` and the vanishing hypothesis; README `:273` carries the name. Tested below (four instances). |
| 1a/F04 = 1b/F02 (P1) weight-one series and products | repaired | `README.md:117`, `:135` (two gaps, both slugs in `plan.json`); new target 2.2b (`:483`). `θ²/4` recomputed: coefficients `1, 1, 0, 1, 2`, constant `1/4`; `(U_5 − 1)` gives `1` at `n = 1, 5`. |
| 1a/F05 (P2) Baker–Brumer on a dependent list | repaired | `README.md:849`: "(i) `ker ℓ̄ = K ⊗ ℚ̄` … (ii) `K ∩ (U^- ⊗ ℚ) ⊆ ker ord_{𝔓_1}`". Recomputed: `ℚ(i)`, `p = 5`: `u_0^n = 5^aζ` has divisors `(n, −n)` versus `(a, a)`, so `n = 0`. |
| 1a/F06 (P2) domain of the measure cocycle | repaired | `README.md:232`: "Put `Γ_{ℓ,p} = Γ_ℓ ∩ GL_n(ℤ[1/p])` … `μ_ℓ : Γ_{ℓ,p}^n → M_p`"; CD14 lines 1063–1089. `(ℓ, p) = (5, 3)`: `3 ∈ Γ_{5,3}`, `2 ∉ GL_1(ℤ[1/3])`. |
| 1b/F01 (P1) missing tame factor in `W` | repaired | `README.md:518`: "`W = ε(𝔫) · (ℒ_χ/ℒ_{χ⁻¹}) · L(χ⁻¹, 0)/L(χ, 0)`"; new 2.5a. Exponent recomputed independently over `ℚ` (see the table, row 2.5a): the cusp constant carries `φ̄(N)N^{−k} = N^{−1}⟨N⟩^{1−k}`, so `a_k ∝ ⟨N⟩^{k−1}`, as DDP11 line 1213 and (79). The route of 2.5a has a remaining gap: S01. |
| 1b/F03 (P3) decomposition maps and inertia exist at the pin | repaired | `Suggested.lean:30–34` and `README.md:68`; `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Map.lean:82`, `TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:112`, `TauCeti/NumberTheory/ClassFieldTheory/Local/Unramified.lean:456`. |
| 1b/F04 (P3) 0.7 over-specialised | repaired | `README.md:270–273`: "for a commutative ring `k`, a group `G`, a normal subgroup `S` of `G`"; Koszul rows gone; `S₃/A₃` Check at `:287` recomputed (`ℂ_p, 0, 0, …` both sides). |
| 1b/F05 (P3) remark after 3.9 | repaired | `README.md:682`: "For `r = s = 1` and `w ∉ {0, −1}`, `W_2 = E[π]/(π²)` … For `r = 1` and `s ≥ 2` there is no such formula"; for `s = 2`, 3.5 gives the basis `1, π, y, y²`. |

## Verified sound

**Method.** Every line of `README.md` (930 lines) and `Suggested.lean` (68 lines) was read. No Lean was run in this pass (read-only); the elaborated type of the one declaration was taken from the worker's elaboration record and compared with README 0.7: every binder is in the declaration's own signature (`{k G : Type u} [CommRing k] [Group G] (S) [S.Normal] (A : Rep k G)`, hypothesis for `0 < q`, conclusion `IsIso ((groupHomology.coinfNatTrans k S n).app A)`), no `variable` block exists, nothing changed.

**Counts.** Declarations read: 1. Targets read: 54. Locators verified against the cached texts: 57 (DKV16 24, DDP11 13, CD14 11, V15 5, Lin12 4). Checks read: 99, the numerical ones recomputed (table). Sibling citations checked at main or at the open heads: 40 sections and 18 declaration names. Pinned declarations opened: Mathlib 17, Tau Ceti 16; all exist with the cited content.

**Declaration table.**

| Declaration | Context | Instances | Values | Result |
|---|---|---|---|---|
| `isIso_coinfNatTrans_app_of_isZero_groupHomology_res` | no section variables; `k`, `G` in one universe | `S = ⊥` | hypothesis automatic (`isZero_groupHomology_succ_of_subsingleton`); map is `Hₙ(G, A) → Hₙ(G, A)` | iso |
| | | `S = G` | `n > 0`: `0 → 0`; `n = 0`: `A_G → A_G` | iso |
| | | `G = S = ℤ`, `A = k` trivial | `H₁(S, A) = k ≠ 0`: hypothesis fails; `k → 0` not iso | hypothesis needed |
| | | `G = S₃`, `S = A₃`, `A = k[S₃]` | `k, 0, 0, …` on both sides | iso |
| | | `G = ⟨ε⟩ × ⟨π⟩`, `S = ⟨π⟩`, `A = k[S]` | `H₁`: `k → k` | iso |

Not padding: it is the degenerate Hochschild–Serre isomorphism; Mathlib has only the degree-one sequence `groupHomology.H1CoresCoinf` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:413`). Headlines 5.5–5.8, 0.8, 1.9, 2.3, 2.6, 3.8–3.10 are named as not statable; the pins have no Iwasawa logarithm, no Deligne–Ribet function and no Hilbert families (grep of both libraries), so none is statable.

**Adversarial table (values computed in this pass).**

| Statement | Instance | Values on each side | Result |
|---|---|---|---|
| Conventions, `rec` | `ℚ_5`, `x = 2`; `ℚ_2`, `x = 2` | `rec(2)`: `ζ_5 ↦ ζ_5²`, `Art(2)`: `ζ_5 ↦ ζ_5³`; `Art(2)`: `ζ ↦ ζ²`, `rec(2)`: `ζ ↦ ζ³` | consistent |
| Conventions, `log ε_cyc(rec x) = ℓ(x)` | `x = p` | `ε_cyc(rec p) = p·p⁻¹ = 1`; `ℓ(p) = 0` | holds |
| 0.1 | `ℚ(i)`, `p = 2, 3, 5` | `χ(2) = 0`, `r = 0`; `χ(3) = −1`, `r = 0`; `r = 1` | holds |
| 0.4 | `O = diag(2,3)`, `L = diag(5,7)`; right-multiply by `diag(4,1)` | `35/6`; `140/24 = 35/6` | invariant |
| 0.5 | `ℚ(i)`, `p = 3` | `D_χ = (1 − (−1))·(1/2) = 1` | holds |
| 0.5 nonvanishing of `f_χ(n)` | parity of `χω^n` at `n = 1 − m` | `(−1)^{1−n} = (−1)^m` | values nonzero |
| 0.6 `n = 1` | `ℓ = 3`, `k = 0` | `(1 − 3)(−1/2) = 1` | holds |
| 0.6 full weight | `p = 3`, `𝔠 = (2)`, `κ = x⁻¹` | `(−3)(−2)(−1/12) = −1/2`; principal branch `0` | differ, as stated |
| 0.6 smoothing factor | `p = 2`, `χ = χ_4`, `𝔠 = (3)` | `s = 0`: `4`; `s = 1`: `1 + 3·(−3)⁻¹ = 0` | unit at `0` only |
| 0.6 interpolation | `s = −k` | `χ(𝔠)N𝔠⟨N𝔠⟩^k = χω^{−k}(𝔠)N𝔠^{1+k}` | agree |
| 0.7 balancing | contragredient versus `(uλ)(m) = λ(um)` | `κ(g)(u⁻¹m)` versus `κ(g)(um)` | contragredient needed |
| 0.7 route | columns and rows of `Q_• ⊗ (P_• ⊗ M)_S` | `Q_a ⊗ M_S` in degree `0`; `(P_b ⊗ M)_G` in degree `0` | both augmentations quasi-isomorphisms |
| 0.8 identity | general `J`, `n` | `(1 − π_i)(1_{𝒪_{J₀}}g_n) = 1_{𝒪_J}g_n + 1_{𝒪_{J₀}}D_ig_n − 1_{𝒪_J}D_ig_n` | exact |
| 0.8 Check | `ℚ(√5)`, `p = 11` | `(4+√5)⁴ = 761 + 336√5`; `48² ≡ 5`; `52^{10} ≡ 100`, `log ≡ 22`, `c ≡ 88 (mod 121)` | holds |
| 1.9 | `XO + YL = 0` | `det X/det Y = det(−L)/det O` | holds, no extra sign |
| 2.1 | `f = as² + bs³` | `ν_k(ℒ) = aπ² + O(π³)`; linear term `cs ↦ −cπ` | holds |
| 2.2 `U_𝔮` identity | `𝔞 = 𝔮^a𝔞′`, `𝔮 ∈ R ∖ J` | `c(𝔞𝔮) − c(𝔞) = χ(𝔮)^{a+1}c′(𝔞′) = c′(𝔞′)` | needs `χ(𝔮) = 1`, which `R′ ⊆ J` gives |
| 2.2a | level `8`, `k = 4` | `(1, 9, 73, 585)` unitriangular; `(1_2, 1_4) ↦ E − 9E\|B_2 + 8E\|B_4` | holds |
| 2.2a `U_𝔮` | span of `E\|B_{𝔮^j}`, `j ≤ m` | `m = 1`: `X² − aX + b`; ramified `η`: `X^m(X − φ(𝔮)N𝔮^{k−1})` | formula holds in all ramification cases |
| 2.2a | `(25)`, `(1,1)` versus `(ξ, ξ)` | `λ = 2`: `9, −9`; `λ = 11`: `1332, 1332` | density `1/2` |
| 2.2b | `d_2 = (1+T) − u` | `ν_2 = 0`, `ν_1 = 1 − u` (`−p`; `−4`) | unit of `Λ_(1)` |
| 2.4 | `χ ↔ χ⁻¹` | `W ↦ ε(𝔫)²W⁻¹`; `χ = χ⁻¹`: `W = ε(𝔫)` | consistent |
| 2.4 Check | `ℚ(i)`, `p = 5`, `W = 1` | `1 − (−4)^{k−1}`; `−15` at `k = 3` | factor needed |
| 2.5 constants | `𝔫 = 1`; `𝔫 ≠ 1`; Case 1 | `ℒ − ℒ − χ⁻¹(λ)L(χ⁻¹)ℒ/L(χ) + χ⁻¹(λ)ℒ_{χ⁻¹}W = 0`; `ℒ − ℒ = 0`; `ℒ − D_χℒ/D_χ = 0` | vanish |
| 2.5a exponent | `F = ℚ`, `E_k^{ψ,φ}\|A`, functional equation at conductor `Np` | constant `= ψ(−α)φ̄(N)g(ψ)N^{−k}L(1−k, ψ̄φ)`; `φ = ω^{1−k}`: `N⁻¹⟨N⟩^{1−k}` | exponent `1 − k`; `a_k ∝ ⟨N⟩^{k−1}` |
| 2.5a | coefficient in `e·ν_k(F̃)` | `ν_k(W) − (f_χ/L(χ,0))·⟨N𝔫⟩^{k−1}L(χ⁻¹,0)/f_{χ⁻¹} = 0` | cancels (given S01) |
| 2.6 | `T_λ − η(λ) − η⁻¹χε(λ)` | weight `k`: kills `(η, φ)`; weight one on `E_1(1, χ_S)`: `(1 − η(λ))(1 − χη⁻¹(λ))` | nonzero for the chosen `λ` |
| 3.1–3.3 | `r = s = 1`; `r = 1`, `s = 2`; `w = −1`; `r = t = 1`, `s = 2` | `ε_1 = aπ`; `−aπ²`; `π^s = 0`, `(π − y)^s = −y^s`; `y = cπ²`, `ε_1 = by` | hold |
| 3.3 sign | `c = (−1)^{s−t}a/b` | `(−1)^{s+1}aπ^s = (−1)^{t+1}b y^t` | consistent |
| 3.4–3.6 dimensions | `(r, s) = (2, 3)`; `(r, s, t) = (1, 2, 1)` | `6`; `8`; `3` | hold |
| 3.7 | denominator of `Y` | residue `−(χ(𝔮) − 1)log_p⟨N𝔮⟩` | unit iff `χ(𝔮) ≠ 1` |
| 4.1 Check | `𝒪_E[[T]][y]/(y² − T²(T + p))` | `√(T + p) ∉ 𝒪_E[[T]]`, `∈ E[[T]]^×`; completion has two minimal primes | holds |
| 4.3 | `κ = b̄χ⁻¹` | `κ(στ′) = κ(σ) + χ⁻¹(σ)κ(τ′)` | left cocycle |
| 4.4 | `πz`, `z²`, `yz` | `π² − y²`, `π² − y²`, `0`; `ε_yε_z = ε` | holds |
| 4.6 | first column of `ρ(σ)M = M·[[χεη⁻¹, ∗], [0, η]]` | `b = (A/C)(χεη⁻¹ − a)`, `c = (C/A)(χεη⁻¹ − d)` | holds |
| 5.1–5.2 | entries after `φ_𝔪` | `ℓz + oε_i`; `det L·z^r + det O·(−1)^{r+1}L_an z^r = 0` | `L_an = det(−L)/det O` |
| 5.4 | `r = t = 1` | `det L⁻ + det O⁻·b = 0` | `R_p(χ⁻¹) = b` |
| 5.8 (ii) | norm to `Ĥ^D`, `\|τ(y)\| = 1` | `z^n = p^a ⇒ a = 0 ⇒ ord_{𝔓_1}(y) = 0` | holds; fails for the plus-part unit `p` |
| Worked example | `ℚ(i)`, `p = 2` | `−B_{1,χ_4} = 1/2 = D_χ` | holds |

**Suppliers, gaps and order.** The eight gap slugs of `design/plan.json` are the eight "What … must provide" lines of the README, each with a named supplier and section; each `needs` states its hypotheses; none asks for something supplied (NoncommutativeAndEquivariantIwasawa §F.5 and §6.1 step 0(c) start at weight two, state no product of forms and only `ℰ(1, χ)` for odd `p` and conductor prime to `p`; PadicFamilies §§5.10–5.13 assume `p` odd and conductor prime to `p`; OrdinaryAutomorphicFormsAndModularityLifting §2.12(a) starts at weight two). Ownership: no roadmap on main or open pull request states the coinflation edge isomorphism, a Sczech or Eisenstein cocycle, Gross's regulator or a Hilbert Eisenstein complement (searched by object with the roadmap search over main and all open heads); this roadmap is their owner. No fully qualified name of `Suggested.lean` occurs elsewhere. The pull request changes only `packages/IntegralIwasawaTheoryPartII/`. Policy: one `import Mathlib`, no `set_option`, `theorem` only, no process words or pull-request numbers in `README.md` or the docstrings; every definition has at least three Checks. Dependency check:

```text
depcheck: 236 roadmaps, 2147 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Not verifiable

- Sc93 Theorem 4, W86 Proposition 1.5, Br82 Chapter V §3 and Chapter VII §6, AL13 Proposition 3.11 and Theorem 3.6: settled as uncertified; texts not read. That DDP11 attributes the weight-two decomposition to W86 Proposition 1.5 was confirmed (DDP11 line 1162), not the statement itself.
- No Lean was elaborated in this pass; the signature comparison rests on the worker's elaboration record for this head.
- 2.2a, "the standard constants of `f|B_𝔱` are those of `f` moved between the narrow-class components by the class of `𝔱`": Lin12 §2 gives only the coefficient formula; whether a power of `N𝔱` enters the normalized constants depends on the normalization of §F.5 and was not computed for a nontrivial narrow class group.
- The extension of DDP11 Propositions 2.3–2.5 from one prime above `p` to several (2.5a) is in no cached source; only the case `F = ℚ` was recomputed.
- ArithmeticGaloisDuality §§R02.1.3–R02.4.3, D7.6, D7.7 and IntegralHeckeAndGaloisDeterminants §§1.3, 1.4: headings and subjects confirmed at the open heads (the `S`-unit Kummer sequence with its Picard term, the dual-first local pairing and its sign were read); their hypotheses were not compared line by line with Layers 1 and 4.
- The convergence and classicality claims inside the repair of S02 were checked as arguments, not against a source: V15 only asserts the rank comparison.
- Ownership against board packages outside the supplied index was not checked.

## Source issues

- **Error** in DKV16 at (29)–(31), pp. 848–849: the source says the coefficient of the reversed Eisenstein family is the ratio of the two `p`-adic and two complex values; it should carry the extra factor interpolating `⟨N𝔫⟩^{k−1}`; affects a stated result.
- **Misprint** in DDP11 at Proposition 2.3, p. 462: the source says the cusp constant carries `⟨N𝔫⟩^{k−1}`; it should be `⟨N𝔫⟩^{1−k}`, as the degree-one computation and Proposition 2.7 require; affects a stated result.
- **Misprint** in DKV16 at §3.1, footnote 6, p. 847: the source says the modulus-one weight-one constant of the series for `η` uses values of `χ`; it should use `η` and `η⁻¹`; affects nothing.
- **Misprint** in DKV16 at the proof of Theorem 3.6, p. 854: the source says the Case 2 algebra has dimension two to the analytic order plus twice that order minus two; it should have exponent `r`; affects nothing.
- **Gap** in DKV16 at Theorem 3.2, p. 849: the source says only that some Hecke operator makes the family cuspidal; it should also require that the operator fix the weight-one Eisenstein series, excluding zero; affects the proof.
- **Error** in DKV16 at §3.2, p. 849: the source says the unprojected semi-cusp family is already ordinary; it should be a member of the full family module, ordinary only after projection; affects the proof.
- **Misprint** in DKV16 at §3.2, the parenthesis before the case division, p. 849: the source says the chain of equalities ends with the analytic order of `χ` again; it should end with that of `χ⁻¹`; affects nothing.
- **Misprint** in DKV16 at §3.3, p. 850: the source says the analytic order and leading term are those defined in (2); it should refer to the `p`-adic quantities of §1.3; affects nothing.
- **Gap** in DKV16 at §3.1, p. 847: the source says the Hecke algebra is generated by good-prime operators and those above `p`; it should include the operators at the primes dividing the tame level, used later; affects the proof.
- **Misprint** in DKV16 at Remark 1.1, p. 837: the source says the logarithm-after-inverse-valuation composite is an endomorphism of the unit component; it should be of the divisor component; affects nothing.
- **Misprint** in CD14 at the proof of Theorem 5.1, p. 31: the source says a free module has homological dimension one; it should say its positive-degree homology vanishes, which gives the isomorphism; affects the proof.
- **Gap** in V15 at §4.1, p. 15: the source says one can show that ordinary forms over the smaller power-series ring span the same space as the usual ones; it should give the rank comparison through ordinary control; affects the proof.
- **Misprint** in V15 at §4.2, final sentence of the proof, p. 20: the source says the construction finishes the proof of Theorem 1; it should be Theorem 2; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3936d0c8c2ade14a2ad7f7d69719ac3b93fda36b", "job": "RT-IntegralIwasawaTheoryPartII~2b", "model": "fable", "worker": "chris-l"} -->
