<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6909637676 -->
Red team round 2 pass a (claude) of 1d736a3

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Layer 11 uses local conditions and finiteness theorems that need `s̄` trivial above `p` and above `v_0`; only `r̄_π` is made trivial there

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:4129–4131` ("Finiteness is
   PotentialAutomorphyInfrastructurePartII §8.16 as stated, applied twice"), `:4156` ("at `v | p`, `s̄` is
   scalar and `ζ_p ∈ F_{2,v}`"), `:3909–3913` (§11.1: "trivial residual representation" above `p` over
   `F_1` and above `v_0` over `F_2`), `:4052–4057` (§11.4: `R^Δ_v` at `S_{p,F′}`, `R^{St}_v` at `T_{F_2}`).

   **Claim.** The hypotheses of §8.16 (those of §8.7 with one clause replaced) hold for `s̄|_{G_{K_2}}`,
   and the ordinary and Steinberg local conditions of §11.4 are defined for `s̄`.

   **Witness.** PotentialAutomorphyInfrastructurePartII §8.7 at its head: "(1) `π` is `ι`-ordinary and
   `r̄|G_{F_ṽ}` is trivial for `v ∈ S_l`", "(3) … `q_{v₀} ≡ 1 mod l` and `r̄|G_{F_{ṽ₀}}` trivial"; §3.10
   there: "ordinary local residual representation trivial at `p`", Steinberg ring "require `r̄_ṽ`
   trivial". §11.1 makes `r̄_{π,ι}` trivial; `s̄ = (r̄ ⊗ Sym^{r−1} r̄) ⊗ ȳ^{1−r}`. Instance: `r = 2`,
   `ȳ(Frob_ṽ) = c ≠ 1` unramified at `ṽ | p`: `s̄|_{G_{K_{1,ṽ}}} = c^{−1}·1_4`, scalar and not trivial.
   Nothing in §11.1 fixes `ȳ(Frob_ṽ)` (`x̄ = ȳ`, weight `0` at `u_0`, `y y^c = ω_p` leave it free).

   **Repair.** In §11.1, in the list of properties of `F_1` and `F_2`, after "trivial residual
   representation and `[F_{1,v} : ℚ_p] > n(n + 1)/2 + 1` at every `v | p`" insert:

   > and `ȳ` trivial on `G_{K_{1,ṽ}}` for every place `ṽ | p` of `K_1` (the completions `F_{1,v}` are
   > taken to contain the finite abelian extensions of `ℚ_p` cut out by the reduction of the character
   > of `K_0` from which `Y` is obtained by composition with the norm, at both places of `K_0` above
   > `p`, which is compatible with `X_0`-splitness since `X_0` is prime to `p`)

   and after "at those places `q ≡ 1` modulo `p^N` for an `N` with `p^N > n` and trivial residual
   representation" insert "and `ȳ` trivial on the decomposition groups of `K_2` there (the same
   enlargement of the completions above `v_0`)". Add to the API of §11.1: "`s̄` is trivial, not only
   scalar, on `G_{K_{1,ṽ}}` for `ṽ | p` and on `G_{K_{2,ṽ}}` for `ṽ` above `v_0`." In §11.6 replace "`s̄`
   is scalar and `ζ_p ∈ F_{2,v}`" by "`s̄` is trivial and `ζ_p ∈ F_{2,v}` (§11.1)". Add a Check to §11.1:
   "For `r = 2` and `ȳ(Frob_ṽ) = c ≠ 1` at `ṽ | p`, `s̄|_{G_{K_{1,ṽ}}} = c^{−1}·1_4` is scalar and
   non-trivial, and neither the ordinary condition `R^Δ_v` nor hypothesis (1) of
   PotentialAutomorphyInfrastructurePartII §8.7 applies; the triviality of `ȳ` there is therefore part
   of the choice of `F_1`." State after the locator of §11.1 that nt26 Lemma 3.4(2)–(3) asks triviality
   of `r̄_{π,ι}` only and that the triviality of `ȳ` is added here. Tested on the refuting instance: with
   `ȳ(Frob_ṽ) = 1` the twist `ȳ^{1−r}` is trivial on `G_{K_{1,ṽ}}` and `s̄|_{G_{K_{1,ṽ}}} = 1_{2r}`; the
   property persists over `F_2`, `F_3`, and the place `v_2` already has `s̄` trivial (README:4144).

2. **F02** (P3) the contract for PotentialAutomorphyInfrastructure §2.5 is cited for prescribed non-split completions, which that section sends to another owner

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:257–261` ("with a given finite
   set of places split completely … Every auxiliary soluble CM extension with prescribed local behaviour
   used below comes from here"); `:5168–5170` (§14.1: `F⁺_1` with `r̄_{σ_0,ι}` trivial and `q_v ≡ 1` modulo
   `p` at a place `v | q`, cited to §2.5); `:4413–4416` (§12.1 `*Needs:*`); `:3329–3331` (§9.1 `*Needs:*`,
   no field supplier at all although reductions (8), (10) prescribe completions).

   **Claim.** §2.5 supplies soluble extensions with prescribed local behaviour.

   **Witness.** PotentialAutomorphyInfrastructure §2.5 at its head: "a cyclic extension `E/F` of degree
   `N`, disjoint from `A`, with every place of `S` split completely … For soluble prescribed completions
   use `PotentialModularityAndCompatibleSystems` §2.16"; its Check: "a quadratic unramified completion
   has local degree 2 and cannot split completely". Instance in §14.1: `p = 577`, `q = 3`, `3 ≢ 1` modulo
   `577`, so `F⁺_{1,v} ≠ ℚ_3`.

   **Repair.** Replace the last sentence of README:259–261 by: "Extensions in which a finite set of
   places splits completely come from here; soluble extensions with prescribed non-trivial completions
   come from PotentialModularityAndCompatibleSystems §2.16." Under
   `### From TauCetiRoadmap.PotentialModularityAndCompatibleSystems` add: "§2.16 (soluble
   prescribed-completion extensions: a finite soluble Galois extension, linearly disjoint from a given
   finite Galois extension, with prescribed finite Galois soluble completions at a finite set of
   places, totally real when the base is)". Add `PotentialModularityAndCompatibleSystems §2.16` to the
   `*Needs:*` lines of §§9.1, 12.1 and 14.1, to the parenthesis at README:5169, and to the Dependencies
   of Layers 9, 12 and 14. PotentialModularityAndCompatibleSystems is earlier in the merge order.
   Tested on the instance: §2.16 prescribes the unramified completion of `ℚ_3` of the degree making
   `r̄_{σ_0,ι}` trivial and `q_v ≡ 1` modulo `577`.

3. **F03** (P3) Weston is cited without a locator in a gap, and the manifest's locator is a different statement

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:399`
   ("unobstructedness of the local deformation problems at the ramified primes for all but finitely many
   `p` (Weston, wes04)"); `packages/ModularityAndLanglandsExtensionsPartII/sources.toml:247`
   (`locator = "Theorem 1"`).

   **Claim.** wes04 Theorem 1 supports the local statement for every weight `k ≥ 2` of §8.2.

   **Witness.** wes04 lines 29–34: Theorem 1 is the global unobstructedness, for `k > 2` at all but
   finitely many primes and for `k = 2` only at primes satisfying a congruence condition. nt21 line 4534
   uses the local statements, Propositions 3.2 and 5.3 (wes04 lines 202 and 427, pp. 5 and 10).

   **Repair.** In README:399 and in the `needs` of the same slug in `design/plan.json` replace
   "(Weston, wes04)" by "(Weston, wes04 Propositions 3.2 and 5.3, pp. 5, 10: vanishing of
   `H⁰(ℚ_l, ad⁰ r̄(1))` at the ramified primes `l ≠ p`)"; in `sources.toml` set the locator of `wes04`
   to "Propositions 3.2 and 5.3". Tested on the instance `k = 2`: the two propositions carry no weight
   condition, while Theorem 1 would restrict `p`.

Second pass. Read in full: `packages/ModularityAndLanglandsExtensionsPartII/README.md` (5477 lines,
110 numbered targets in Layers 0–14) and
`packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean` (127 lines, 4 declarations and one
proved `example`). Three new findings: one P2, two P3. No Lean statement was found false. No Lean
was run (the brief gives no Lean command); signatures were compared with the worker's elaborated
types.

## Earlier findings at this head

Ids are those of the round-1 reports (pass a: 1a/F01–F05; pass b: 1b/F01–F05).

| Id | Status | Witness at this head |
|---|---|---|
| 1a/F01 (P1) §4.9 route unowned | repaired | README:529 declares `gap:steinberg-equivariant-k-theory` (same slug in `design/plan.json`, supplier SpringerResolutionAndCharacteristicCycles, Layer 6); README:1877–1894: "supplied by SpringerResolutionAndCharacteristicCycles (gap:steinberg-equivariant-k-theory)", and the adapted homomorphism is now proved in the sketch. Its two pinned inputs exist with the stated content: `TauCeti.exists_isSl2Triple_of_isNilpotent_ad` (`TauCeti/Algebra/Lie/Sl2/JacobsonMorozov.lean:87`, under `[IsKilling K L]`) and `IsSl2Triple.exists_isSl2Triple_iff_sub_mem` (`:199`, `h' − h ∈ ker(ad e) ⊓ range(ad e)`). NilpotentOrbits N2 item 1 (on main) states the algebraic `SL₂` homomorphism and conjugacy of triples. Recomputed on `PGL_2`, `s = diag(q^{1/2}, q^{−1/2})`, `u` regular: neutral elements `H + ℂE`, `D`-weight-zero part `H`, `s₀ = 1`. |
| 1a/F02 (P2) removable gap | repaired | The slug `geometric-weak-primitive-auxiliary-finiteness` occurs nowhere (15 slugs in README and in `plan.json`, equal sentences, checked by script). README:4131–4140 proves the added hypothesis of §8.16: `[H, H] = SL_2(𝔽_{p^b}) × 1`, `H/[H, H] ↪ A/SL_2 × k^×` of order dividing `(|k| − 1)²`. Recomputed: `k^×GL_2(𝔽_{p^b})/SL_2(𝔽_{p^b})` has order dividing `(|k| − 1)(p^b − 1)`, prime to `p`. The repair leaves one hypothesis of §8.16 unverified: S01. |
| 1a/F03 (P2) lifting step missing in §11.6 | repaired | README:4159–4165: "The auxiliary-place lifting theorem (gap:auxiliary-place-reducible-lifting, with `Π_2` as input) makes this point `r_{Π′_2,ι}`"; the gap is in the `*Needs:*` line (README:4195) and the Layer 11 Dependencies (README:4328). Order of steps agrees with nt26 lines 945–979. |
| 1a/F04 (P2) Layers 9–13 follow nt21b and nt26 | partly repaired | The layer introductions now open with the mathematics (README:3286, 3620, 3886, 4336, 4690). The pairs Layer 9 ↔ nt21b §2, 10 ↔ §3, 11 ↔ nt26 §3, 12 ↔ §4, 13 ↔ §§5–6 remain; the repair report declines the merges with reasons (different statements, data and bounds in Layers 9 and 12; order forced by §10.6 → §9.8, §13.3 → §11.10, §13.4 → §12.7). Not re-raised: the source with the largest share is nt21, whose contents the layers do not follow (see `Source independence`), and Layer 13 also carries th24 §7 (§§13.8, 13.9). The residual question is put to the human reviewers. |
| 1a/F05 (P3) ordinarity in §14.1 | repaired | README:5175–5181: "at each `w | p`, `F⁺_{1,w} = ℚ_p` … a non-ordinary crystalline representation of `G_{ℚ_p}` with such weights has irreducible reduction". FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11 states this for `K = ℚ_p`, weights `(0, k − 1)`, `1 < k < p`; here `k = 5 < p`. PotentialAutomorphyInfrastructurePartII §0.5 is the converse used. |
| 1b/F01 (P1) weight-two lifting for `σ′` | repaired | README:4811–4822: "ModularityAndLanglandsExtensions §2.25 gives a lift … crystalline with labelled weights `{0, 2}` … automorphic by ModularityAndLanglandsExtensions §2.16". §2.25 at its head: odd `l`, `ζ_l ∉ F`, `l ≥ 2(d + 1)`, `n` distinct labelled weights, no residual automorphy; with `d = 2`, `t > 4r + 2 ≥ 10 ≥ 6`. |
| 1b/F02 (P1) level raising over `F_2` | repaired | README:4144–4150: "Run the Khare–Wintenberger argument of §11.2 over `F_2`, prescribing in addition the unramified Steinberg component at `v_2`". SerreWeightAndLevelOptimisation §2.4 is gone from the Layer 11 Dependencies and kept for §§7.3–7.4 (over `ℚ`, `p ∤ 4`). |
| 1b/F03 (P2) half-plane citation | repaired | README:5285–5288 and 533–540 cite AL.2.4.1, AL.3.3.8, AL.3.6.1. AL.3.6.1 at its head ends: "the finite standard Euler product of every unitary cuspidal `π` of `GLₙ`, `n≥2`, converges absolutely for `Re(s)>1`"; AL.3.3.8: `q^{−1/2} < |α_i| < q^{1/2}`. |
| 1b/F04 (P2) compound gaps | repaired | README:399 and 401 are two gaps (`unobstructed-auxiliary-prime`, `slope-zero-one-dimension-count`); README:321 no longer mentions §1.4; §9.1 `*Needs:*` (README:3329–3331) has no Layer 1 item. |
| 1b/F05 (P3) unconsumed contract rows | repaired | The six ids are gone from README:362–381, 428–431, 493–500; EndoscopicTransferAndUnitaryTraceComparison §2.15 is now used in §5.6 (README:2336–2337, 2363). Every remaining contract id was searched for in the layers: each is consumed. |

No repair introduced a false statement. The repair of 1a/F02 states that §8.16 is applied "as
stated"; one hypothesis it keeps from §8.7 is not established by §11.1 (S01).

## The adversarial pass: values computed

### `Suggested.lean`

No section `variable` exists in the file, so no binder can be lost; the four elaborated types of the
worker's signature file equal the README statements of §§14.4–14.5. Nothing changed.

| Declaration | Context | Instances and computed values | Result |
|---|---|---|---|
| `symPowerEulerFactor` (line 62) | none; `ℕ → ℂ → ℂ → ℂ → ℂ` | `n = 0`: `1 − x`; `n = 1`: `(1 − βx)(1 − αx)`; `Δ`, `p = 2`, `n = 2`: `α² + αβ + β² = 576 − 2048 = −1472` | real body, equals README §14.4 |
| `example` (line 68) | none | reindex `j ↦ n − j`; tests the kept definition | kept |
| `HasQuadraticSelfTwist` (line 83) | `{N} [NeZero N] {k}` | `M = 0`: `Coprime p 0 ⇔ p = 1`, no prime tested, so `0 < M` needed; `M = 1, 2`: unit groups trivial; level `32`, `χ_{−4}`: `0·(−1) = 0`, `(−2)·1 = −2`; `Δ`: `252·(−1) ≠ 252`; `ψ ≠ 1` modulo `M` means non-principal, so its primitive character is non-trivial | equals README §14.5; wrong model `M ≥ 0` excluded |
| `symPowerEulerProduct_levelOne_entire` (line 98) | `Newform 1 k` (pin: new, normalised, eigen away from the level) | `n = 0` gives `ζ(s)` (excluded by `hn`); `n = 1`: abscissa `(k + 1)/2`; factor non-zero: `|α^jβ^{n−j}p^{−s}| < p^{1/2 + n(k−1)/2 − Re s} < p^{−1/2}`; `k < 12` or odd: no form, vacuous | true as typed |
| `symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist` (line 117) | `[NeZero N]`, `2 ≤ k` | CM level `32`, `n = 4`: `α²β² = p²`, factor `ζ(s − 2)`, pole at `3 = 4·1/2 + 1`; weight one icosahedral: pole at `1`; omitted factors at `p | N` are reciprocals of polynomials | every hypothesis needed; true as typed |

Headline theorems of the README: §§2.4, 3.8, 5.4, 5.10, 6.4, 6.7–6.9, 7.5–7.7, 8.3, 9.8, 10.8, 11.10,
12.7, 13.5, 13.6, 13.10, 14.1–14.5. Stated: §§14.4, 14.5. All others need automorphic
representations, Galois representations of forms, eigenvarieties or deformation rings, absent at the
pins, and each is named in the module docstring. No padding: the level-one theorem is not one tactic
from the general one (it needs `2 ≤ k` and the absence of self-twists in level one). Imports: Mathlib
and one existing Tau Ceti module.

### README targets

| Statement | Instances tried, values on each side | Result | Change |
|---|---|---|---|
| §0.2 | `Hom(ℤ_3^× × ℤ̂, C_5) = 5`, `Hom(ℤ_3^× × ℤ_3, C_5) = 1`; pro-`p` quotient `ℤ_p²`, dimension `2`; general `[F_ṽ : ℚ_p] + 1` | holds | none |
| §0.3 | conjugation of `(A, μ)j` by `(α, 1)` gives `(α²A, μ)j`; `α² = λ^{−1}` solvable as `2` is a unit | holds | none |
| §2.1 | `v_p(ζ − 1) ≤ 1/(p − 1) < 1 ≤ v_p((1 + p)^{k−2} − 1)`; `p = 2`: `1 < 2`; `Δ`: `3 + 8 = 11` | holds | none |
| §2.5 | `Q_8`: `Sym³` eigenvalues `−i, i, −i, i`; `g² = −1` scalar, discriminant `0` for `i = 2`, non-zero for `i = 1`; binary icosahedral: `Sym^6` factors through `A_5`, degrees `≤ 5 < 7` | holds | none |
| §3.2 | `k = 3`: `w = 4`; `k = 4`: `24`, `v = 3`; `k = 6`: `624 = 2⁴·39`; `m ≥ 1`: `v = 2^{1−m}`, `(k − 1)2^{m−1} ∈ ℤ` | holds both ways | none |
| §3.4 | orders: `2³ = 3`, `2⁵ = 2` in `𝔽_5` (order `4`); `2³ = 1`, `2⁵ = 4`, `2⁷ = 2` in `𝔽_7` (order `| 3`); `4 ∤ 3·7^b` | holds | none |
| §3.7 | `2i < (k′ − 2)/2 ⇔ 2^{m+1} > 2i + 3`; `i′ = (2i + 2^{m+1} − 2)/2 − i = 2^m − 1`; `i = 1`: `m = 2`, `k′ = 9`, slope `6` on `X_3` | holds | none |
| §4.4 | `|U_3(𝔽_q)|_{p′}/(q³ + 1) = (q + 1)(q² − 1)`; `−1 + q(q − 1) + q³` equal to it; `q = 3`: `32`, `28 = 4·7` | holds | none |
| §4.9 | adapted `φ`: `Ad(d)h_1 − h_1 = Σ(λ(d) − 1)h_1^λ ∈ V` forces `h_1^λ ∈ V` for `λ ≠ 1`; `PGL_2`, `s = diag(i, −i)`: `zs = −s` is `W`-conjugate, `2 = 1 + 1` | holds | none |
| §4.10 | `n = 7`: `2 + 2 + 4 = 8 = 1 + 7`; `n = 9`: `2·2 + 2 + 8 = 14 = 1 + 11 + 2`; `k = 5`: `22 = 1 + 16 + 5`; increments `k + (k − 2) = 2(k − 2) + 2`; `[K : B] = 4·40·364 = 58240` | holds | none |
| §5.6 | `l = 5`: packets of `2`, `2^{s+1}` and half `2^s`; `l > 5`: `4^{s+1}`, `4^{s+1}/2`; `s = 1`: `2` and `4` | holds | none |
| §5.8 | partitions of `7` dominating `3 + 3 + 1` with even parts of even multiplicity: `331`, `511`, `7` | holds | none |
| §5.10 | `2(a + b) ≤ a + 3b ⇔ a ≤ b`; `a = 2`, `b = 1`: `6 > 5` | holds | none |
| §7.2 | `(p − 1)/8 ≥ 6·n! > 2n(n − 1)` for `n ≥ 3` (`36 > 12`); `χ_iχ_i^c = ε^{3(n−1) − 4(n−1)}`; `577 = 2·288 + 1` | holds | none |
| §7.3 | Diamond: `0 ≡ δ(q)q³(q + 1)²` iff `q ≡ −1` | holds | none |
| §7.5 against nt21 Theorem 7.1 | nt21 lines 4054–4071: `n ≥ 3`, `p ≡ 1 (48·n!)`, any prime `q ≠ p`, `X_0` prime to `2pq`; `TS_1`: `Π = 1`, `r̄ = ω̄⁰` | agrees; `q = 2` allowed and covered by §14.1 (`r̄` trivial at `v` kills the order-two ramification) | none |
| §10.3 against nt21b Definition 3.6 | nt21b lines 1054–1067; `t > 48` gives `53`; `158` not prime, `211` prime, `212 = 4·53` | agrees | none |
| §11.1 against nt26 Lemma 3.4 | nt26 lines 745–762: `[F_{1,v} : ℚ_p] > n(n + 1)/2 + 1`, `ζ_p ∈ F_{1,v}` (implied here by `r̄` trivial and `det = ε̄^{−1}`), `p^N > n`, `d_{0,F_2} > 1` | agrees; `ȳ` not controlled above `p`, `v_0` | S01 |
| §11.6 against §8.16 | §8.7(1): trivial above `l`; (3) trivial at `v₀`; (5) no quotient of order `l`; (6) `l > 3`, `l ∤ n` (`p ∤ 2r` as `r < p`); auxiliary place: eigenvalues of `ad` are `(α/β)^j`, `|j| ≤ r`, times `q_{v_a}`, never `1` | (1) fails for scalar `c^{−1} ≠ 1` | S01 |
| §11.6 cyclotomic hypothesis | index-`2` subgroup contains the perfect `SL_2`; `[A, A] ⊂ [k^×GL_2, k^×GL_2] = SL_2`; a `p`-group with trivial abelianisation is trivial | holds | none |
| §12.6 | `dim W′_∞ = nq + 4|S ∪ S_∞|`, `dim W′_∞ − dim W_∞ = (n − 1)q`; `γ = 2 − 3 + 3 = 2` | holds | none |
| §13.2, §13.6 against nt26 Theorems 5.5, 5.9 | nt26 lines 1855–1871, 2058–2079; `M > p^{a₀(p)} ≥ 125 > 4r` since `r < p` and `4p ≤ p³` | agrees | none |
| §13.4 | `r = 4`, `q = 17`, `x = 2`: forbidden `{1, 2, 4, 8, 9, 13, 15, 16}`; `y = 3`: `7, 6, 10, 11, 14, 12, 3, 5` | holds | none |
| §13.8 | eigenvalues on `ad(Sym^{p+r−1} r̄)(1)`: `−(α/β)^j`, `j = 0` gives `−1 ≠ 1`; `t` of order `> 4p − 4` exists as `p^a − 1 ≥ p³ − 1` | holds | none |
| §13.9 | `r ≤ 3`, `p = 5, …, 23`: `6…10`, even `12…26` reached (also `13 = 11 + 2`); `11` needs `TP_4` | holds | none |
| §13.10 | `m = ⌊n/2⌋ < p ≤ 2m ≤ n`, `p ≠ n` for even `n > 2`; `n ≥ 6` gives `p ≥ 5`; `n = 12`, `p = 7`: `SP_4, SP_5, SP_6, SP_2` | holds | none |
| §14.1 | twist: `(Sym ⊗ ω^{n−1})^c = Sym ⊗ ω^{1−n}ε^{3(n−1)} = (Sym ⊗ ω^{n−1})^∨ ε^{1−n}` with `det = ε^{−4}` on `G_{F_1}`; ordinarity over `ℚ_p`, weights `{0, 4}`, `4 ≤ p − 2`; `q = 3`, `p = 577`: completion not split | holds; field supplier | S02 |
| §§14.4–14.5 | shift `n(k − 1)/2`; `HasProd` from absolute convergence and non-zero factors | holds | none |

Checks recomputed in this pass: about 70 (the numerical Checks of Layers 0–5, 7, 10, 13, 14 and the
ones listed above); none false. Every definition has at least three Checks.

## Verified sound

- **Declarations read: 4** (and one `example`); **targets read: 110**, every line of both files.
- **Locators verified: 29** against the cached texts in this pass: nt21 Theorem 7.1 and the
  definition of `σ_0` (pp. 82–83), the Weston passage of the proof of Proposition 8.3; nt21b
  Definition 3.6 and Proposition 3.7 (p. 23); nt26 Lemmas 3.3, 3.4, 3.5, 3.7, 3.8,
  Proposition 3.9 (pp. 15–21), Theorem 5.5, Lemma 5.6 (p. 40), Theorem 5.9 (p. 44); at20
  Theorem 5.1 (p. 19); chen14 §§1.22, 4.1, 4.2 and Proposition 1.23; moe07 §§5.4, 5.5, 5.7; dm18
  Theorem 1; ls20 §8; kv12 Theorem 2.2.5; con99 Theorem 3.4.2; wes04 Theorem 1 and
  Propositions 3.2, 5.3. All are where the README says, except the wes04 locator (S03).
- **Sibling citations checked: 76** section ids resolved at the suppliers' heads in this pass (the
  46 section titles of PotentialAutomorphyInfrastructurePartII that the README quotes, against that
  roadmap's headings; ModularityAndLanglandsExtensions §§1.12, 2.1, 2.13, 2.16, 2.25, 4.2, 4.8, 4.9, 4.11,
  4.15, 4.20, 4.22, 4.23, 4.29, 4.30; SerreWeightAndLevelOptimisation §§2.4, 6.9, 6.11;
  AutomorphicLFunctionsAndLocalFactors AL.2.4.1, AL.3.3.8, AL.3.6.1, AL.3.7.1;
  FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11; PotentialModularityAndCompatibleSystems
  §§2.16, 9.2, 10.10; PotentialAutomorphyInfrastructure §2.5; SpringerResolutionAndCharacteristicCycles
  §§6.2, 6.4; NilpotentOrbits N2). Statements read in full for 14 of them. One is cited for more than
  it states (S02).
- **Pinned declarations opened: 3** in this pass (`TauCeti.exists_isSl2Triple_of_isNilpotent_ad`,
  `IsSl2Triple.exists_isSl2Triple_iff_sub_mem`, `HeckeRing.GL2.Newform`); the 16 of round 1 were not
  reopened.
- **Gaps.** 15 slugs in the README, the same 15 in `design/plan.json`, each `needs` equal to its
  README sentence (script), each with a named supplier earlier in the merge order or on main.
  PotentialAutomorphyInfrastructurePartII §3.2 says "Let `l` be odd", so
  `gap:dyadic-definite-unitary-forms` does not ask for what exists.
- **Ownership.** No declaration of `Suggested.lean` has the name of a declaration in another
  roadmap's Lean file (round-1 search; `scratch/overlaps.md` lists no shared roadmap, dropped id or
  second copy). Ownership against open pull requests was checked with `roadmaps show` on the
  suppliers named above.
- **Policy.** `git diff --stat origin/main...HEAD` touches only the package folder. No `lemma`,
  `set_option`, `#eval`, pull-request number or process narrative in the README or the Lean file.
- **Direction of supply.** Output of the dependency check: `depcheck: 251 roadmaps, 2407 edges,
  0 problem(s)`; no UPWARD, CYCLE or `moved:` line.

## Not verifiable

- kl87, bbm82, kw09: settled as uncertified; cited by locator only.
- ct17: the corrections the README makes to the printed text (the `(10, 10)` matrix entry, the
  exponent of `X` for `m = 3`, the socle after (3.9)) were checked for internal arithmetic only.
- §6.9 against th24 §§3–6 and the trace-formula counts of §§5.3, 5.6: consistency with the stated
  sources only; the proofs were not followed.
- Whether ANT's finiteness theorem (the source of PotentialAutomorphyInfrastructurePartII §8.7) is
  true with "scalar" in place of "trivial" above `l`: its text is not among the cached sources; S01
  is raised against the supplier's statement as it is at its head.
- Elaboration of `Suggested.lean`: not run here; the repair report of round 1 records exit 0.

Source independence: 8 passages compared with 3 sources (README §§7.1, 7.5, 8.2, 10.3, 11.1, 11.4,
11.6, 13.2 against nt21 lines 4042–4071 and 4528–4537, nt21b lines 1054–1067, nt26 lines 745–762,
866–873, 933–979, 1855–1868, 2058–2075), none shared: the hypothesis lists of §§7.5, 10.3, 13.2 keep
the sources' clause order, which the mathematics forces, and no run of more than eight consecutive
words is common; largest share nt21, 97 of 266 locators; contents compared with nt21: independent
(its §2 is split over Layers 0–2, §1 is placed after §3 and merged with ct17 §§2–3 in Layer 4, §5 is
imported, Layers 5–7 merge its §§4, 6, 7 with ct17 and th24); contents of nt21b and nt26 compared as
well: Layers 9–10 and 11–13 correspond to their sections in order (see the human reviewers).

## Source issues

- **Gap** in nt26 at Lemma 3.4(2)–(3), p. 16, and proof of Proposition 3.9, pp. 20–21: the source says the twisted residual representation is scalar above `p` and applies a finiteness theorem stated for a residually trivial one; it should make the twisting character residually trivial at those places and above `v_0`; affects the proof.
- **Misprint** in nt26 at Lemma 3.4(5), p. 16: the source says the Hodge–Tate condition is for embeddings of a field `K` not defined there; it should be `K_1`; affects nothing.

## For the human reviewers

- **Scope.** Layers 9–10 correspond in order to nt21b §§2–3 and Layers 11–13 to nt26 §§3, 4, 5–6 (README:3284–5148); round 1 raised this, the repair renamed the introductions and declined the merges, giving reasons in `reports/FIX-RT-ModularityAndLanglandsExtensionsPartII~1.md`.
- **Scope.** README:110–118 and §7.4 rest on a defect claimed in the published proof of nt21 Proposition 7.4; both round-1 passes recomputed it from arXiv v3. The Publ. IHÉS text was not compared.
- **Scope.** SmoothRepresentationsOfLocalGroupsPartII and this roadmap both send the equivariant `K`-theory of the Steinberg variety to SpringerResolutionAndCharacteristicCycles, whose scope excludes general Springer representations (README:529; repair report, "For the maintainer").
- **Licence.** ct17, ct15, bk05 and con99 are read from authors' pages (`sources.toml`, `licence_class = "author-page"`); the README cites ct17 and ct15 by manuscript pages.
- **Not tested.** `Suggested.lean` was not elaborated in this pass.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1d736a375bece161cdf45464235952336d5f5a77", "job": "RT-ModularityAndLanglandsExtensionsPartII~2a", "model": "fable", "worker": "chris-x89"} -->
