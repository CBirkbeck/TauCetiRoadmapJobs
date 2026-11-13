<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14773#issuecomment-6864934186 -->
Review (claude) of 6de1805

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) three `*Needs:*` lines omit an item their own bullets use

   **Location.** `packages/SpectralSequencesAndConvergencePartII/design/README.md` §2.3: "*Needs:* 2.1; Mathlib
   `HomologicalComplex₂`, `InjectiveResolution`"; §4.3: "*Needs:* 2.6, 4.1; base §§5.1, 5.3; …"; §6.2: "*Needs:*
   6.1; base §§1.3, 1.4, 3.1, 3.2, 6.2."

   **Claim.** Each line lists what the statement and its route need, item by item.

   **Witness.** §2.3 bullet *Total complex* uses "(1.5, finite case, applied to the columns)", and `design/plan.json`
   target 2.3 lists `target:1.5`. §4.3's two-column bullet is the deduction for which §4.2 cites "base §§1.3, 3.4".
   §6.2 *Multiplicativity* uses "(5.2; …)".

   **Exact repair.** §2.3: "*Needs:* 1.5 (finite case), 2.1; Mathlib …". §4.3: add "base §§1.3, 3.4 (for the
   two-column sequence)" to the line and `roadmap:SpectralSequencesAndConvergence §1.3`, `§3.4` to plan target 4.3.
   §6.2: add "5.2 (for multiplicativity only)" to the line and `target:5.2` to plan target 6.2. Tested: with these
   the three lines equal the items used by the bullets named in the witness, and no cycle arises (1.5 < 2.3,
   5.2 < 6.2; the gate below still reports 0 problems, since no roadmap edge is added).

2. **F02** (P3) a consumer line contradicts the scope paragraph

   **Location.** `design/README.md`, *Downstream consumers*: "**InverseGaloisAndArithmeticFundamentalGroupsPartII**
   (the change-of-rings and hyperhomology sequences of its declared gap on graded Tor spectral sequences)".

   **Claim.** That roadmap's graded Tor sequences are this roadmap's change-of-rings and hyperhomology sequences.

   **Witness.** Its README at the open head, *Exact supplier contracts*: "What DGAInfinity must provide
   (gap:dga-graded-tor-spectral-sequences): … graded `k`-algebra `R`, not necessarily commutative". This README,
   *Scope*: "graded Tor over graded algebras and Tor of one-sided modules over noncommutative rings are not part of
   this roadmap"; §4.4(a) takes `R`, `S` commutative.

   **Exact repair.** Replace the parenthesis by: "(its composite Tor sequence `Tor^{R̄}_i(k, Tor^R_j(R̄, M)) ⇒
   Tor^R_{i+j}(k, M)` and its hyperhomology sequence, over graded algebras, are instances of 3.4's right exact
   composites and of 2.6 in the abelian category of graded modules; Layer 4 does not state them, and their owner
   is named in that roadmap's supplier contracts)". Tested on the instance: `F = R̄ ⊗_R −` sends graded free modules
   to graded free modules, which are acyclic for `G = k ⊗_{R̄} −`, so 3.4 gives `E²_{p,q} = L_pG(L_qF(M))`, the
   displayed page; nothing of Layer 4 is used, so the scope sentence stands. The words "declared gap" go.

3. **F03** (P3) Tau Ceti's finite projective horseshoe is not cited

   **Location.** `design/README.md` §2.1: "The dual statements hold for projective resolutions, through `𝒜ᵒᵖ`", and
   *Exact supplier contracts*, *From Tau Ceti*, which names only the one-step injective horseshoe.

   **Claim.** The pinned Tau Ceti has only the one-step horseshoe; the projective horseshoe is new here.

   **Witness.** `TauCeti/CategoryTheory/Exact/Resolution/Horseshoe.lean:235`,
   `TauCeti.ExactStructure.FiniteResolution.horseshoe`: for a conflation and finite projective resolutions of its
   outer terms, a middle resolution, augmentation-compatible chain maps and degreewise splittings (structure at
   line 49).

   **Exact repair.** Add to *From Tau Ceti*: "`TauCeti.ExactStructure.FiniteResolution.horseshoe`
   (`TauCeti/CategoryTheory/Exact/Resolution/Horseshoe.lean`): the horseshoe for finite projective resolutions of
   the outer terms of a conflation; consumed as it stands." Add to §2.1's projective bullet: "for finite
   projective resolutions of objects this is Tau Ceti's `TauCeti.ExactStructure.FiniteResolution.horseshoe` for
   `TauCeti.ExactStructure.abelian`; the statement here adds resolutions of unbounded length, complexes and the
   relative form." Tested on the instance: for `0 → ℤ →(×2) ℤ → ℤ/2 → 0` with resolutions of lengths 0 and 1, the
   Tau Ceti statement gives the middle resolution with terms `ℤ ⊕ ℤ`, `ℤ`, of length `≤ max(0, 1)`, which is the
   dual statement of §2.1(a) for these objects; the injective statements of §2.1 are not covered by it.

Three findings, all P3 (none blocking); each carries a repair, so the verdict asks for changes: two `*Needs:*` and consumer-line corrections and one uncited Tau Ceti
declaration. Both findings of round 4 are repaired. No false statement, missing hypothesis, upward supply or
second owner was found. No file of the design was edited by this review; `sources.toml` is unchanged.

## Previous findings (round 4), one by one

| Round-4 finding | Repaired passage (quoted) | Check made now | Status |
| --- | --- | --- | --- |
| F01 (P2) a self-pairing does not supply algebra laws | `design/README.md` §5.3, Check *One column*: "A differential graded algebra `A` placed in column `0` … with its associative unital multiplication as the self-pairing, satisfies both rules"; new Check *A self-pairing is not an algebra*: "`e² = f`, `fe = e`, `ef = f² = 0`". Same in `design/plan.json`, tests `one_column` and `pairing_not_algebra`. | Vertical rule at `p = p′ = 0`: `d₂(xy) = d₂(x)y + (−1)^q x d₂(y)`, the Leibniz rule of `A`. Rank-two control: `(ee)e = fe = e`, `e(ee) = ef = 0`; `eu = af` for `u = ae + bf`, never `e`. | repaired |
| F02 (P3) the socle witness labels the wrong variable | §4.1, third Check: "because `− ⋆ k` is not right exact: applied to `R ↠ X` it gives the zero map `soc(R) = k·xy → soc(X) = k·x ⊕ k·y`"; added: "`X ⋆ −` … sends `R ↠ k` to the zero map `X ≅ X ⋆ R → X ⋆ k = soc(X)`". Same in plan test `degree_zero_needs_right_exactness`. | `U ⋆ k = D(DU/𝔪DU) = soc(U)`; `xy ↦ 0` in `X = R/(xy)`, rank 0 into dimension 2. For `X ⋆ −`: `Dk → DR ≅ R` is `1 ↦ xy`, so `DX ⊗ k → DX` is multiplication by `xy`, zero on `DX`; its dual `X → soc(X)` is zero with nonzero target. | repaired |

The repaired pattern (a product on `H` claimed without algebra laws) was looked for in §5.2 (both Checks take a
differential graded algebra), §5.3 (`A ⊠ B` of two differential graded algebras), §6.2 *Multiplicativity* (`M` a
differential graded `A`-algebra): none needs a change. The repair report marked nothing as not actionable. No
maintainer notes were supplied.

## Verified sound

### Principles

No route-specific shortcut (every statement is for an arbitrary abelian category or an arbitrary commutative
ring, with exactness and boundedness hypotheses stated at the target); the base is extended, not re-planned
(each convergence statement cites a base section); supply runs one way (below); no copied passage, no
algorithm; no `Suggested.lean` exists at this stage, so no sorry'd data and no `set_option`.

### Sources: the seeded sample (15 targets) and further locators

Read at the cached texts; "p." is the printed page of the extraction's page marker.

| Target | Locator read | Result |
| --- | --- | --- |
| 1.1 | stacks-012K line 2154–2164 (Def. 18.3, total differential `d₁ + (−1)^p d₂`); line 3400–3409 (`Tot_π` in Lemma 26.3, p. 71) | supports both totals and the sign; weibel1994 §1.2 uncertified |
| 1.3 | stacks-012K line 3284–3291 (Lemma 25.3, p. 68), item (4) at 3289–3290 | (a) as stated: bounded, finite filtrations, weak Serre class with all `p, q`; (b), (c) rest on base §§5.4, 7.5 (read, see below); weibel1994 §5.6 uncertified |
| 1.4 | stacks-012K line 3293–3315 (Lemma 25.4, pp. 68–69) | supports the augmentation form with finite antidiagonals only, as the README says |
| 2.3 | stacks-05QI line 3621–3629 (Def. 21.1), 3630–3654 (Lemma 21.2, pp. 72–73), 3682–3689 (split rows) | definition, existence and splitting as stated; the bound `p < a` is the roadmap's normalisation of the source's "some `i ≪ 0`" |
| 2.4 | stacks-05QI line 3655–3681 (Lemma 21.3, pp. 73–74); grothendieck1957 line 1236–1252, 1348–1354 (pp. 146, 148) | `′E_1 = R^qF(K^p)`, bounded, finite filtrations; Remarque 3 for a resolution of an object |
| 2.6 | grothendieck1957 line 1304–1308 (p. 147); stacks-05QI line 3449–3456 (§19) | only announces the dual statements; the README's route through `𝒜ᵒᵖ` supplies them; weibel1994 §5.7 uncertified |
| 3.1 | stacks-05QI line 3696–3717 (§22, Lemma 22.1, p. 74); grothendieck1957 line 1338–1342 | "the following are equivalent" is in the source; Remarque 1 gives the effaceability form |
| 3.2 | stacks-05QI line 3718–3730 (Lemma 22.2, pp. 74–75); grothendieck1957 line 1330–1337, 1343–1347 | page `R^pG(H^q(RF(X)))`, bounded, finite filtrations, construction by a Cartan–Eilenberg resolution of `F(I)` |
| 3.4 | weibel1994 §5.8, cartan-eilenberg1956 Ch. XVI | uncertified; the statements follow from 3.1–3.3 in opposite categories (computed below) |
| 4.1 | weibel1994 Theorem 2.7.2 | uncertified; route checked against `TauCeti/Algebra/Homology/TotalComplex.lean:596` |
| 4.3 | stacks-more-algebra line 7399–7412 (Lemma 65.4, p. 160), 7413–7422 (Example 65.5) | source: `D^b(R)`; the README says so and gives its own route for bounded-above complexes |
| 4.4 | stacks-more-algebra line 7135–7140 (Example 63.2, p. 154) | Tor form and its route; (b), (c) are derived from 3.2, 3.4 |
| 5.1 | may-primer line 249–266 (conditions `μ_n`), 267–279 (Prop. 4.1, p. 7), 280–287 (Cor. 4.2) | as stated; the README's `m ≥ 0` shift supplies the positivity the source omits |
| 6.1 | may-primer line 136–150 (Example 2.3, p. 4); stacks-more-algebra line 12960–13006 (p. 280–281), footnote at 13013–14 | couple and filtered-complex description; the source assumes `f` a nonzerodivisor of `A`, the README only injectivity on the terms (checked below) |
| 6.2 | may-primer line 147–150, 155–168; hatcher-at line 13330–13337 (Prop. 3E.3) | higher universal-coefficient sequence (homological form there); the three rules of Prop. 3E.3 |

Also read: stacks-012K line 3241–3265 (Lemma 25.1, item (4) with the sign `(−1)^q`, used in §1.2's Check), line
3354–3358 and 3433–3438 (Lemmas 26.1, 26.4: direct-sum total for `0 → M → A_0 → ⋯`, product total for
`⋯ → A_0 → M → 0`, as §1.5 says); stacks-05QI line 2872–2970 (§16) and 3402–3412 (Lemma 18.9);
stacks-more-algebra line 7121–7134 (Example 63.1) and 8115–8127 (§69); grothendieck1957 line 1266–1268
(commuting differentials), 1295–1298, 1506–1529 (Prop. 2.5.4); may-primer line 288–324 (Example 4.3, filtered
pairings). All 11 cited works are in the manifest, each under one key.

### Computed adversarial pass

`k = 𝔽_p`. Each row gives the values on both sides.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, total sign | unit square of `ℤ` | `d(1) = (1, 1)`; `K^{1,0} → K^{1,1}` is `−1`, `K^{0,1} → K^{1,1}` is `+1`; `d² = −1 + 1 = 0`; unsigned sum gives `2` | holds |
| 1.1 staircase | `D_p = K^{p,−p}`, `O_p = K^{p+1,−p}`, `p ≥ 0` | component into `O_p`: `x_p − (−1)^p x_{p+1}`. Sum: back-substitution from the last nonzero `y_p` gives a unique preimage, `H^0 = H^1 = 0`. Product: kernel `(1, 1, −1, −1, …)`, `H^0 = ℤ`, `H^1 = 0` | holds |
| 1.1 column sign | `K^{1,0} →(×2) K^{1,1}` | total `−2` at `p = 1`; `(−1)^q` and `(−1)^{p+1}` both give `+2` | holds |
| 1.2 `gr^p` and shift | column `p` | degree-`n` term `K^{p,n−p}`, differential `(−1)^p d₂ = (−1)^{−p} d₂` | holds |
| 1.2 sign of `″d_1` | column-sign complex | `Tot(K.flip) = ℤ →(+2) ℤ`, `Tot(K) = ℤ →(−2) ℤ`, flip iso `(+1, −1)`; Stacks 25.1(4) at `q = 1`: `−2` | holds |
| 1.3(a) stabilisation bound | `K^{0,0}`, `K^{100,−99}` only | a nonzero `d_r` from diagonal `n` needs nonzero terms in `r` consecutive columns of diagonal `n`; here `d₁ = d₂ = 0`, every `d_r = 0`, bound `2 + 1` | holds |
| 1.3(a) weak Serre Check | `ℚ → ℚ/ℤ`, `P` = ℚ-vector spaces | `′E_1^{0,0} = ℚ`, `′E_1^{1,0} = ℚ/ℤ ∉ P`, `′E_2^{0,0} = ℤ = H^0 ∉ P` | both forms respected |
| 1.3(b), (c) on the staircase | `″E` on sum, `′E` on product | rows exact, `q ≤ 0`: abutment `0 = H^*(Tot^⊕)`. `′E_1 = ℤ` at `(0, 0)`, `p ≥ 0`, regular: abutment `ℤ = H^0(Tot^Π)` | holds; the two crossed predictions (`ℤ`, `0`) are not licensed |
| 1.3(c) regularity criterion | `d_r : (p, n−p) → (p+r, n+1−p−r)` | target `′E_1 = H^{n+1−p′}(K^{p′,•})`, `p′ = p + r ≥ p₁(n)` for large `r`: zero | holds |
| 1.4 | projection of the staircase to column 0 | commutes with `d₁` (`O_0 ↦ 0`); product totals `ℤ → ℤ` identity on the generator; sum totals `0 → ℤ` | holds; sum case fails only where (b) fails (`p` unbounded above on diagonal 0) |
| 1.5 augmented forms | staircase read as `M = ℤ[0] → A_0 → A_1 → ⋯` | `Tot^⊕(A)`: `H^0 = coker(⊕_{c≥1} D_c → ⊕_{c≥0} O_c) = ℤ`; `Tot^Π(A)`: acyclic | sum is the right total for right resolutions, as stated and as Stacks 26.1 |
| 1.5 Weibel dictionary | four cases | `C_{p,q} = K^{−p,−q}`: his upper half-plane ↦ `q ≤ 0`, i.e. `p ≥ n − b`; his right half-plane ↦ `p ≤ 0`, i.e. `q ≥ n` | each lands in the stated case |
| 2.1(b) relative horseshoe | route | `ν₁ = ν − (dh̃ + h̃d)`; `h⁰ = 0` so the augmentation is unchanged; `μ = ν₁ − (dg̃ + g̃d)` gives `π′μ = βπ`, `μι = ι′α` | holds |
| 2.1 third Check | `I₁ = I₃ = (ℚ/ℤ →(×2) ℚ/ℤ)`, `h⁰ = id`, `h¹ = 0` | transported differential `(u, v) ↦ (2u − 2v, 2v)`; at `(0, 1/4)`: `(1/2, 1/2)` against `(0, 1/2)` | holds |
| 2.2 | `Hom(ℤ/2, −)` at `ℤ`; `− ⊗ ℤ/2` at `ℤ` | `R⁰ = 0`, `R¹ = Hom(ℤ/2, ℚ/ℤ) = ℤ/2`; `R⁰(− ⊗ ℤ/2)(ℤ) = ker(0 → 0) = 0 ≠ ℤ/2` | holds |
| 2.3 | columns `ℚ → ℚ/ℤ` over `ℤ →(×2) ℤ`; `A →(id) A` | `H_I^1 = (ℚ/2ℚ, (ℚ/ℤ)/2) = (0, 0)` does not resolve `ℤ/2`. Identity: `Z^0 = 0`, `B^1 = Z^1 = A` resolved by the second column, `H = 0` | definition excludes the wrong model |
| 2.4 | `Hom(ℤ/2, −)`, `K = (ℤ →(×2) ℤ)` | `′E_1^{0,1} = ′E_1^{1,1} = ℤ/2`, `′d_1 = ×2 = 0`; abutment `Ext^{n−1}(ℤ/2, ℤ/2) = ℤ/2`, `n = 1, 2` | holds |
| 2.5 | same; identity functor on the non-CE model | `″E_2^{0,1} = ″E_2^{1,1} = ℤ/2`. Non-CE: row 1 is `ℚ/ℤ →(×2) ℚ/ℤ`, kernel `ℤ/2` at `(1, 0)`, against `(0, 1)` | holds |
| 2.5 functor on `D⁺` | localisation | `Mathlib/Algebra/Homology/DerivedCategory/Plus.lean:280`: `Q.IsLocalization (CochainComplex.Plus.quasiIso C)` | the factorisation has its pinned input |
| 2.6 | `K = (ℤ →(×2) ℤ)` in degrees `−1, 0`, `− ⊗ ℤ/2` | `(K°)^0 = op K^0`, `(K°)^1 = op K^{−1}`; `H^0(K°) = op ℤ/2`, `H^1 = 0`; `E^1_{0,0} = E^1_{1,0} = ℤ/2`, `d^1 = 0`, `L_0 = L_1 = ℤ/2` | holds |
| 3.1, both directions | `F = G = Hom(ℤ/2, −)` at `ℚ/ℤ`; summand argument | `R¹(GF)(ℚ/ℤ) = 0` against `Ext¹(ℤ/2, ℤ/2) = ℤ/2`. If injective `I ⊆ M` then `F(I)` is a summand of `F(M)` | holds |
| 3.2, 3.3 | `ℤ/4 → ℤ/2` coextension, `A = ℤ/2` | `R^qF = ℤ/2` all `q`; `E₂^{0,q} = ℤ/2`; five terms `0, 0, ℤ/2, ℤ/2, 0, ℤ/2`, middle map iso | holds |
| 3.3 `m`-form | rows `0 < q < m` zero | `0 → E₂^{m,0} → H^m → E₂^{0,m} → E₂^{m+1,0} → H^{m+1}`, the form of base §3.6 | holds |
| 3.4 | `− ⊗ ℤ/2` then `Hom_{ℤ/2}(−, ℤ/2)`; then `Hom_ℤ(−, ℤ)` | `E₂^{0,q} = ℤ/2`, `q = 0, 1`, against `Ext^n_ℤ(ℤ/2, ℤ/2)`. Second: composite `0`, `Ext¹(ℤ/2, ℤ) = ℤ/2` | hypothesis needed and stated |
| 4.1 | `ℤ/4, ℤ/6`; `𝔽₂[x,y]/(x²,y²)` with `⋆` | `{0, 2}` and `{0, 3}`, both `ℤ/2`. `Tor_0 = X/(x, y)X = k`, `Tor'_0 = coker(0 : soc R → soc R) = k`, `X ⋆ k = soc(X)`, dimension 2 | balance holds; degree-zero Check correct |
| 4.2(a) | `ℤ/2[0] ⊗^L ℤ/2`; `⊕_n ℤ/2[n]` | rows `q ≤ 0` (lower half-plane, 1.3(b) for `″E`); `E₂^{0,0} = E₂^{−1,0} = ℤ/2`; unbounded: `H^n = (ℤ/2)²` | holds |
| 4.2(a) first sequence | `K` unbounded above | diagonal `n` has `p = n − q ≥ n` unbounded: 1.3(b) for `′E` fails | "if `K` is bounded above" is needed and stated |
| 4.2(c) | `X = (ℤ →(×2) ℤ)`, `M = ℤ` | `(1, 0)`: `Ext¹(ℤ/2, ℤ) = ℤ/2`; `(0, 0)`: `0`; `H¹(Hom(X, ℤ)) = ℤ/2` | holds; matches Tau Ceti's sequence with `H_{n−1} = H^{1−n}` |
| 4.3 | `k[ε]/ε²`, `K = L = k[0]`; bounds `a, b` | `E₂^{p,0} = k` for all `p ≤ 0`, `H^{−n} = k`. Degree `n`: `n − a − b ≤ p ≤ 0`; `q − b ≤ i ≤ a` | finite in each degree; no collapse in general |
| 4.3 `E₂` | rows of the projective CE resolution | `gr^s = P^{•,s} ⊗ L`, split with projective cohomology: `⊕ H_I^i(P)_s ⊗ H^j(L)`; `H_I^i(P)` resolves `H^i(K)` in the first variable: `Tor'`, then 4.1 | holds |
| 4.4(a) | `ℤ → ℤ/4`, `M = N = ℤ/2` | `E²_{p,q} = ℤ/2`, `p ≥ 0`, `q = 0, 1`; abutment `ℤ/2` in `n = 0, 1`; degree 1 has `E²_{1,0}` and `E²_{0,1}`, so `d² : E²_{2,0} → E²_{0,1}` is onto; all `d² : (p, 0) → (p−2, 1)`, `p ≥ 2`, iso | holds |
| 4.4(b), (c) | `ℤ/4 → ℤ/2`; `ℤ → ℤ/2`; identity | column 0 with `ℤ/2`; `ℤ/2` in `n = 0, 1`; identity: `Ext^q_R(R, M) = Tor_q(M, R) = 0`, `q > 0` | holds |
| 5.1 `μ₀` iff Leibniz; shift | `M = (ℤ →(×4) ℤ)`, `f = 2` | `k(1) = 2`, `j(2) = 0`: `μ₀` true. `i(c) = 2` forces `c` odd, `j(c) = 1 ≠ 0`: `μ₁` false; `d₂(1·1) = 1 ≠ 0`: `μ₀` false for `φ′` | false ⟺ false |
| 5.1 converse step | `iⁿk = 0`, `n ≥ 1` | `c ↦ c − k(z)` keeps `iⁿ(c)` and corrects `j(c)` by `jk(z)` | holds |
| 5.2 route | representatives | `dx̃ ∈ F^{p+n+1}`, `dỹ ∈ F^{p′+n+1}`, `d(x̃ỹ) ∈ F^{p+p′+n+1}`, class `c`: `iⁿ(c) = k(xy)`, `j(c) = j(a)y ± xj(b)` | holds |
| 5.2 Check | `𝔽₂[x,y]/(x²)`, `dx = y` | `y^p` at `(p, p)`, `xy^p` at `(p, p+1)`, `d₁(xy^p) = y^{p+1}`, `E₂ = 𝔽₂` | holds |
| 5.3 rules | expand `D = d₁ + (−1)^p d₂` | degree `(1, 0)`: `d₁(xy) = d₁(x)y + (−1)^{p+q} x d₁(y)`; degree `(0, 1)`: `(−1)^{p+p′} d₂(xy) = (−1)^p d₂(x)y + (−1)^{p+q+p′} x d₂(y)` | the stated rules |
| 5.3 flip sign | `σ = (−1)^{pq}` | `(p+p′)(q+q′) − pq − p′q′ = pq′ + p′q` | holds |
| 5.3 `A ⊠ B` | `x = 1 ⊗ b`, `y = a′ ⊗ 1`, `p′` odd | `d₂(xy) = (−1)^{qp′} a′ ⊗ db`; rule without `(−1)^{p′}` gives `(−1)^{(q+1)p′}` | holds |
| 6.1 | `ℤ →(×p) ℤ`; `ℤ →(×p²) ℤ`; `A = ℤ × ℤ`, `f = (p, 0)` | `k(1) = [1]`, `d₁ = +1`; `k(1) = [p]`, `d₁ = 0`; zero divisor `f` injective on a complex supported on the first factor | holds; termwise injectivity suffices |
| 6.2 higher sequence | `Z_r = k^{−1}(f^{r−1}H^{n+1})` | `ker k/B_r = Hⁿ/(fHⁿ + Hⁿ[f^{r−1}]) ≅ f^{r−1}Hⁿ/f^rHⁿ`; `k(Z_r) = (f^{r−1}H^{n+1})[f]` | holds |
| 6.2 stabilisation | `H[f^∞] = H[f^b]`, `r ≥ b` | `z = f^r y`, `fz = 0` ⇒ `f^b y = 0` ⇒ `z = 0` | holds; page `max(a, b) + 1` |
| 6.2 Checks | `ℤ →(×p^r) ℤ`; `⊕_k (ℤ →(×p^k) ℤ)`; `ℤ → ℤ[1/p]` | `E_s^0 = E_s^1 = ℤ/p` for `s ≤ r`, `0` after; `E_r^0 = ⊕_{k≥r} ℤ/p`, `E_∞^0 = 0`; `E_∞^0 = ℤ/p` against `H^0[1/p] = 0`, obstruction `H^1[p] = ℤ/p` | holds |
| 6.2 Hatcher | summands `ℤ`, `ℤ/p^k`, `ℤ/p` of `Hⁿ` | `pℤ/p²ℤ = ℤ/p` in `E_2ⁿ`; `(pH)⊗ℤ/p = ℤ/p` in `E_2ⁿ` and `(pH)[p] = ℤ/p` in `E_2^{n−1}`; `p·ℤ/p = 0` | agrees with Prop. 3E.3 |

### Pinned declarations opened

All backticked library names of the README were resolved at the pins (87 names). Opened in particular:
`Mathlib/Algebra/Homology/TotalComplex.lean:46, 266, 273, 349, 412`; `HomologicalBicomplex.lean:38, 150`;
`TotalComplexSymmetry.lean:113`; `Bifunctor.lean:83, 124`; `SpectralSequence/Basic.lean:36, 51, 54` (`comm`);
`DerivedCategory/Plus.lean:142, 155, 218, 226, 280`; `DerivedCategory/RightDerivedFunctorPlus.lean:47, 96, 128`
(no comparison with `Functor.rightDerived`; `Mathlib/CategoryTheory/Abelian/RightDerived.lean:45–46` says
`rightDerived` is to be redefined through it); `CategoryTheory/Abelian/LeftDerived.lean:105, 109, 359`
(`leftDerivedZeroIsoSelf` under `[PreservesFiniteColimits F]`); `CategoryTheory/Monoidal/Tor.lean:39–62`
(variables `MonoidalCategory`, `Abelian`, `MonoidalPreadditive`, `HasProjectiveResolutions`; the header says
`Tor ≅ Tor'` needs more theory); `CategoryTheory/Preadditive/Injective/Basic.lean:196, 265, 280`;
`CategoryTheory/Abelian/Injective/Resolution.lean:95` and `descHomotopy`;
`Algebra/Category/ModuleCat/ChangeOfRings.lean:85, 399, 519, 658, 878` (coextension for any rings, extension for
commutative rings); `CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean:126`.
Tau Ceti: `Algebra/Homology/SpectralSequence/Comparison.lean:32`; `Filtered/SpectralObject.lean:304, 409, 425`;
`Filtered/Naturality.lean:83`; `Filtered/FirstPage.lean:89`; `SpectralSequence/Bicomplex.lean:410, 442, 446`;
`Algebra/Homology/TotalComplex.lean:580, 596`; `CategoryTheory/Exact/Abelian.lean:122, 166`;
`CategoryTheory/Exact/Injective.lean:165, 426`; `Algebra/Homology/Monoidal/KFlat/Basic.lean:89, 222, 361`;
`Monoidal/Homology/Cross.lean:153`; `Monoidal/Homology/Kunneth/Sequence.lean:729` (hypotheses: cycles and
`L_q/Z_q(L)` projective); `UniversalCoefficient/Basic.lean:180`.
Not at the pins (searched by object): a product total complex, Cartan–Eilenberg resolutions, a horseshoe for
injective resolutions of unbounded length, `Tor ≅ Tor'`, a Bockstein spectral sequence (Tau Ceti has only the
first-order Bockstein maps of continuous cohomology). The one overlap found is R03.

### Duplication and ownership

Cross-roadmap citations resolved now: base §§1.3, 1.4, 2.1, 2.2, 3.1–3.6, 4.3, 5.1–5.4, 6.1–6.3, 7.1, 7.4, 7.5
(`packages/SpectralSequencesAndConvergence/design/README.md`, headings at lines 367–1363; §3.2's three notions,
§3.5's finite and strong cases, §3.6's `m ≥ 1` form, §5.4's and §7.5's hypotheses read against 1.3–1.4, 3.3 and
6.2); DerivedModuleAlgebra §0.2 (line 794, Check with `[ℤ →p ℤ]`) and §S.1 (line 955); StableHomotopyKTheory
§7.22 (line 2618); ArithmeticGaloisDuality §D7.1 *Derived composite spectral sequence* at its open head (the
target, its construction and its three Checks agree with 3.2's use); ArithmeticStatisticsPartVIII §5.16;
SchemeKTheoryOperations §6.7 (group hyperhomology, first sequence `E¹_{p,q} = H_q(G, C_p)`);
ArithmeticLocallySymmetricSpaces ALS.1.7; AlgebraicTopology §5.1 (line 1888: the Künneth sequence of singular
chains, homological form of 4.3's page); TopologicalSheafCohomology §1.4; SchemeAndStackFoundations §§2.2, 2.7,
2.15 with the four named targets; DGFloer Layer 1 item 2. A search of every roadmap README on main and at the
open heads for Cartan–Eilenberg resolutions, the Bockstein spectral sequence, the acyclic assembly lemma, the
Künneth spectral sequence and the horseshoe lemma found no second owner of a generic statement: the hits are
the applications named in *Scope and ownership*, GrothendieckEulerForms §3.5 (finite projective resolutions in
exact categories) and consumers. `scratch/overlaps.md` reports no other pull request changing this roadmap, no
dropped id and no id defined only by a revision; there is no second copy on main.

Overlap check: read SchemeKTheoryOperations, DerivedInfinityCategories, EnhancedDerivedSheaves, AlgebraicTopology
(main and both open heads), DerivedModuleAlgebra, TopologicalSheafCohomology, GrothendieckEulerForms; shared
objects and owners: group hyperhomology — SchemeKTheoryOperations §6.7; Künneth sequence of singular chains —
AlgebraicTopology §5.1; derived tensor product and first-quadrant double complexes — DerivedModuleAlgebra §§0.2,
S.1; Čech hypercohomology — TopologicalSheafCohomology §1.4; finite projective horseshoe — GrothendieckEulerForms
§3.5 and Tau Ceti (R03); nothing else shared.

### Supplier order

Every `*Needs:*` line was read against `design/plan.json` (24 targets; differences are R01). Named suppliers:
the base, StableHomotopyKTheory, DerivedModuleAlgebra, ArithmeticGaloisDuality; no roadmap of the never-cite list
is cited; no gap is declared and none is needed. Output of the dependency check:

```text
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2171 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Shape, headlines, Lean

Six layers named by their mathematics, each with `### Examples` and `### Dependencies`; summary, scope,
conventions, supplier contracts, reading paragraph, consumers and references are present. Checks per definition:
1.1 — 4, 1.2 — 5, 2.2 — 4, 2.3 — 4, 2.4 — 3, 2.5 — 3, 2.6 — 3, 3.1 — 3, 3.2 — 3, 5.1 — 4, 5.3 — 4, 6.1 — 4; plan
total 89 tests. No LaTeX delimiter, pull-request number, machine path, HTML anchor or process narrative was
found by search. The README does not say it follows a source.

Headline theorems (from the Summary): convergence, comparison and acyclic assembly for both totalisations;
existence of Cartan–Eilenberg resolutions; `RⁿF ≅ F.rightDerived n`; the two hypercohomology sequences and
their duals; the composition criterion and the composite-functor sequence with its low-degree sequences;
`Tor ≅ Tor'`; the universal-coefficient, Künneth and change-of-rings sequences; the Leibniz rule for pairings;
the pages, limit page and convergence of the Bockstein sequence. At the package stage `Tor 𝒞 n ≅ Tor' 𝒞 n` and
the comparison `RⁿF(A) ≅ (F.rightDerived n).obj A` are statable at the pins; the others need the base's
convergence structures and are to be named in the module docstring.

Elaboration: not available (this lane does not elaborate). There is no `Suggested.lean` at the design stage, so
the one-tactic probe and the `#check @name` comparison have nothing to run on.

### Copyright and arrangement

Passages compared with the sources at their locators: the 15 sampled targets and seven further ones (the
total-sign convention, 1.2's page list, 2.2(iii)–(v), 2.5's acyclic-resolution clause, 4.2(b), 5.2's route, the
Hatcher Check). No sentence or proof plan reproduces a source; the closest are the quantifier list of `μ_n`
(may-primer line 252–256) and the three rules of Prop. 3E.3, both statements the mathematics forces, with no run
of more than five shared ordinary words. No table, figure or exercise list is taken over.

Locators before `## References`: stacks-05QI 15, grothendieck1957 14, stacks-012K 11, weibel1994 11, may-primer
10, stacks-more-algebra 7, cartan-eilenberg1956 5, mccleary2001 2, hatcher-at 1, massey1954 1 (77). Against the
contents of stacks-05QI: 2.1 ↔ §18, 2.2 ↔ §16, 2.3–2.5 ↔ §21, 2.6 ↔ §19, 3.1–3.2 ↔ §22, not a run in order, and
Layers 1, 4, 5, 6 draw on other works. The order of layers is forced: 2.4 needs 1.2–1.3, 3.2 needs 2.5, 4.4
needs 3.1–3.4, 6.2's multiplicativity needs 5.2.

Source independence: 22 passages compared with 7 sources, none shared; largest share stacks-05QI, 15 of 77
locators; contents compared with stacks-05QI: independent. The texts of weibel1994, mccleary2001,
cartan-eilenberg1956 and massey1954 could not be read.

## Not verifiable

- weibel1994 (§§1.2, 2.2, 2.7, 5.6–5.8), mccleary2001 (Ch. 2, 10), cartan-eilenberg1956 (Ch. XV–XVII) and
  massey1954 are settled as uncertified: their theorem numbers, pages and hypotheses were not checked. Every
  statement that cites only them (1.3(b), (c), 3.4, 4.1, 5.3) was checked by computation instead.
- The base roadmap was read in this checkout's copy of its design; its review is still open, so the cited
  section numbers are as of that copy.
- Elaboration and the padding probe: no Lean file exists at this stage.

## Source issues

- **Misprint** in may-primer at Proposition 4.1, printed p. 7: the source says `μ_n` for the pairing is equivalent to `μ_{n−1}` for the derived pairing, for every `n`; it should restrict to `n ≥ 1`; affects a stated result.
- **Misprint** in may-primer at Example 2.3, printed p. 4: the source says an infinite cyclic summand gives the integers on every page of the mod `p` sequence; it should be the field with `p` elements; affects a stated result.
- **Misprint** in stacks-05QI at Lemma 18.4 (proof), printed p. 65: the source says the residual map subtracts the homotopy component of index `n − 1`, and composes the chain map and differential in the wrong order; it should use the component of index `n` and `αⁿ ∘ d^{n−1}`; affects the proof.
- **Misprint** in stacks-05QI at Lemma 22.1 (proof), printed p. 74: the source says the transformation is evaluated on the value of the first derived functor at an injective; it should be evaluated at the injective placed in degree zero; affects the proof.

## For the human reviewers

- Scope: the base supplier SpectralSequencesAndConvergence is a board design whose last recorded review is `needs_changes` (`packages/SpectralSequencesAndConvergence/design/review.json`); it is neither on main nor in the merge order. Part II's contracts presuppose its acceptance.
- Not tested: four cited works (weibel1994, mccleary2001, cartan-eilenberg1956, massey1954) are uncertified; wording and arrangement were not compared with them. The largest-share source, stacks-05QI, was read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6de18051d87b88bff94fc1e7f741c758797ac4e0", "job": "REV-DESIGN-SpectralSequencesAndConvergencePartII~5", "model": "fable", "worker": "chris-x55"} -->
