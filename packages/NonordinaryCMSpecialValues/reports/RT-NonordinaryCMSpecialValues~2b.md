<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13089#issuecomment-6860992706 -->
Red team round 2 pass b (claude) of 2d195d5

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) Kronecker's limit formula is off by a factor 2 in the stated normalisation

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:332`: "`Σ_σ χ(σ) log|σ(_az_f)| = (N(a) − χ(a)⁻¹) · lim_{s→0} s⁻¹ L_{K,f}(χ, s)`"; the Checks at README.md:338, 356 and 421 ("the standard units … give `Σ_σ log|σ(_az_f)| = −12 log 3`; the theta values give `+12 log 3`").

   **Claim.** With `|·|` the absolute value of `ℂ` (the one in which the same bullet writes `log|_aθ_E|` as minus the lattice sum built from `E^{(0)}(z) = ∂_s Σ_w |z + w|^{−s}|_{s=0}`), the two sides are equal, and the Check values are `∓12 log 3`.

   **Witness.** `K = Q(i)`, `f = (3)`, `a = (5)`, `χ = 1`. `_aθ_E` has a zero of order `24` at `0`; the `8` primitive `3`-torsion parameters have product `3·unit`, so `v_3(_aθ_E(α)) = 24/8 = 3`; `[K(3):K] = 2`, so `N_{K(3)/K}(_aθ_E(α))` generates `(3)^6` and `Σ_σ log|σ(_aθ_E(α))| = 6 log 3`. Analytically `Σ_{w ∈ f}|1 + w|^{−s} = Σ_{x ≡ 1 (f)} N(x)^{−s/2}`, half the derivative. ModularIwasawaMainConjecturesPartII README.md:49 and :312 (open head) read these formulas with "the explicit factor 2 in the supplier's ordinary-absolute-value formulas", which this README does not have.

   **Repair.** README.md:332: "`2 Σ_σ χ(σ) log|σ(_az_f)| = (N(a) − χ(a)⁻¹) · lim_{s→0} s⁻¹ L_{K,f}(χ, s)`, `|·|` the ordinary absolute value of `ℂ` (equivalently the formula without the `2` for `log(σ(u) conj σ(u))`): the lattice sum `Σ_w |z + w|^{−s}` is the partial zeta function at `s/2`". README.md:338: "the right side is `24 · (−(log 3)/2) = −12 log 3`; `N_{K(3)/K}(_az_f)` generates `(3)^{−6}`, so `Σ_σ log|σ(_az_f)| = −6 log 3` and twice it is `−12 log 3`; the theta values give `+6 log 3`". README.md:356 and 421: replace `−12 log 3` and `+12 log 3` by `−6 log 3` and `+6 log 3`. README.md:343: state the finite-layer formula (15.6.5) with the same factor `2`. Tested on the witness: `2·(−6 log 3) = −12 log 3`.

2. **F02** (P3) The identifiers NCM.0–NCM.5 that two consumers cite have no mapping in the README

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:126–128` (How to read the build) and README.md:918 (Downstream consumers); `grep -c NCM README.md` gives `0`.

   **Claim.** Citing roadmaps can follow this README's numbering.

   **Witness.** AnticyclotomicLocalUnits README.md:15, :104, :385 (open head) and the board package InertAnticyclotomicCMMainConjecture README.md:20, :117, :132 cite "NonordinaryCMSpecialValues NCM.0 … NCM.5". The README of this roadmap's own open content head carries the table "The identifiers NCM.0–NCM.5 of the former numbering name the following sections"; this package has none.

   **Repair.** Add after README.md:128:

   "The identifiers NCM.0–NCM.5 of the former numbering name the following sections.

   | Former numbering | Sections here |
   | --- | --- |
   | NCM.0 | §§0.4–0.6, 1.1, and the dual and Tate-twist dictionary of §2.4 |
   | NCM.1 | §§2.7–2.10 |
   | NCM.2 | §§3.1–3.5 |
   | NCM.3 | §§1.2–1.4 |
   | NCM.4 | §§5.1–5.5 |
   | NCM.5 | §§6.1–6.5, 5.6, 5.7 |"

   Tested on the citations: NCM.2/inert-frobenius is §3.4; NCM.5/central-nonvanishing is §6.4; NCM.3 is §§1.2–1.4 here (the local Fröhlich–Queyrut theorem is now a declared gap, not a section).

3. **F03** (P3) A stale reference to §4.1 for the vanishing of `b_ℓ`

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:696`: "For split `ℓ`, `b_ℓ = 0` (§4.1), `D^{1/4}` is an `ℓ`-adic unit and `v_ℓ(W̃) = v_ℓ(W_ℓ(λ))`".

   **Claim.** §4.1 states `b_ℓ = 0` for split `ℓ`.

   **Witness.** README.md:553 (§4.1): "the pairing invariant `b_ℓ` … is defined in §4.4"; the convention "for split `ℓ` put `b_ℓ = 0`" is at README.md:682, in §4.4.

   **Repair.** README.md:696: "For split `ℓ`, `b_ℓ = 0` (the convention in the definition of `b_ℓ` above), …".

4. **F04** (P3) "two prime divisors" where the source and the argument need "at least two"

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:326`: "a unit when `f` has two prime divisors"; README.md:343: "a unit when `p^n f` has two prime divisors; when it has only one, that prime lies above `p`".

   **Claim.** The case distinction of §2.3 covers every modulus `p^n f`.

   **Witness.** KATO04 lines 5286–5287 state the unit property for a modulus with at least two prime divisors. `K = Q(i)`, `p = 7`, `f = (3)(2 + i)`: `p^n f` has three prime divisors and falls under neither clause of README.md:343.

   **Repair.** README.md:326: "a unit when `f` has at least two distinct prime divisors"; README.md:343: "a unit when `p^n f` has at least two distinct prime divisors; when it has only one, that prime lies above `p`". On the witness the first clause now applies.

One P1 finding (S01) and three P3 findings (S02–S04). The twelve round-1 findings are repaired; one repair left a stale cross-reference (S03).

## Round-1 findings at this head

| Finding | Status | Witness at 2d195d5 |
|---|---|---|
| 1a/F01 `†` on eigenspaces | repaired | README.md:630 "on a one-dimensional eigenspace … every `ϑ` satisfies `ϑ† = ε_ϑ ϑ` for a unique `ε_ϑ` with `|ε_ϑ| = 1`"; Check README.md:640 gives `(u + iv)† = u − iv`; README.md:679 restricts the nonvanishing Check to `V^{prim}_{d,C}`. |
| 1a/F02 `b_ℓ` before its prerequisites | repaired, one stale reference (S03) | README.md:553 "the pairing invariant `b_ℓ` … is defined in §4.4"; definition at README.md:682, after `T^{int}` (README.md:600), `F*_ℓ` (README.md:620) and `b_ar` (README.md:668); §5.2 *Needs* has §4.4. |
| 1a/F03 good reduction of the canonical pair | repaired | README.md:390 "need not have good reduction at the places above `p`", base change to `K'' = K'(E[N])`; recomputed: `Ng + p^n f = g`, so `K(Ng) ∩ K(p^n f) = K(g)`; Check README.md:396 (`1/48 ∉ (1/12)Z`). |
| 1a/F04 integral lattice | repaired | README.md:46 fixes `T_φ|_{G_H} = T_pE ⊗_{O_Φ} R`; README.md:380 proves `γ = β^∨`; recomputed: `z ↦ Ωyz`, `y ∈ f⁻¹`, has degree `N(yf)`; `y = 5/√−7` gives `25`. |
| 1a/F05 empty `P` | repaired | README.md:863 "For `P = ∅` … `M(q, t) = (2⌊t⌋ + 1)²`". |
| 1a/F06, 1b/F01 supplier scope | repaired | README.md:68 "No all-prime factorisation of `L(E/H, s)` is used"; §3.4 reads Frobenius from §4.1; §6.3 uses R17.4.16, R16.2.13, R16.6.1, R16.5.3, each read at the supplier's head (central character `κ_K·κ_K = 1`, `D_2`). |
| 1a/F07 Checks | repaired | README.md:187–188 (`7/8` against `1`), README.md:903 (infinite family `c = 2k`). |
| 1b/F02 arrangement of Layer 4 | repaired | §§4.2–4.4 are grouped by object; each draws on parts of FINIS06 §§2 and 3; README.md:549 no longer says it follows the source. |
| 1b/F03 AL.1.6.1 | repaired | README.md:74 and the *Needs* of §§1.1–1.3 cite AL.1.6.1; the heading exists at the supplier's head. |
| 1b/F04 `hνodd` | repaired | `Suggested.lean:167–174` has no `hνodd`; README.md:276 "odd or even". |
| 1b/F05 `factPrime` | repaired | README.md:846 names it. |
| 1b/F06 scope list | repaired | README.md:30 "ArithmeticDirichletSeries Layers 3 and 5". |

## The adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `conductorModulus`, `idealCharacter` coercions | pinned `idealCharacter` (Ideal.lean:120) | domain `idealsPrimeTo ⟨χ.finiteConductor, χ.finiteConductor_ne_bot, ∅⟩`, the body of `conductorModulus` | definitional | none |
| `IsEquivariantTypeOneZero`; converse of §0.1 | `ρ = φ/conj(φ ∘ c)` | `φ(a)φ(ā) = κ_K(N a) N a = N a` and `|φ(a)|² = N a` give `φ(ā) = conj φ(a)` | converse true | none |
| `IsAnticyclotomic`, §0.2 triviality on `A_Q×` | finite order; `φN^{−1/2}` | restriction `∈ {1, κ_K}`, archimedean part trivial, so `1`; `κ_K(n)·n·n⁻¹ = κ_K(n)` | finite order needed | none |
| `IsPAnticyclotomic`, conductor formula | `Q(√−7)`, `p = 5`; kernel of `Pic(O_{p^c}) → Pic(O_{p^{c−1}})` | `#Pic(O_{5^m}) = 6·5^{m−1}`; kernel of order `p` for `c ≥ 2` | `c = n + 1`; both parities infinite | none |
| `eulerFactor`, `HasCentralValue` | pin `idealCharacter_apply_prime` (uniformizer of valuation `exp(−1)`); `φ` at `(7)` | ideal value equals `finiteComponent v u`; `(1 + 7/49)⁻¹ = 7/8`; `|η(v)| = N(v)^{1/2}`, product converges for `Re s > 3/2` | primitive, determined | none |
| `rohrlichCount_eq_zero` | `P = {2, 3}`, forms `−v` at `2`, `u` at `3`, `q = 2^a 3^b`; `β` irrational algebraic | `2^a ≤ q^c` and `3^b ≤ q^c` give `q ≤ q^{2c} < q`; Ridout: `q⁻¹ > k q^{−cκ}` fails for `cκ < 1` | true; `c < 1/2` sharp | none |
| `rohrlichCount_lt` | same `P`; unbalanced lattice `λ_1 ≈ q^{1/2−ε}` | count `≈ 4q^{2d−1}`, and `2d − 1 < 5d/2 − 1 < s`; `q^{d−1/2+ε} < q^{5d/2−1}` | true | none |
| `centralValue_parity_dichotomy` | `Q(i)`, `Q(√−3)`, `p = 3`; `χ = 1`; `ε` reversed | JIA24 Theorem 1 has no restriction on `K` or `P`; `c = 0` has sign `+`; reversed `ε` puts infinitely many zeros in the finite set | true as typed | none |
| §1.1 | `D = 7, 15`; `∏_v φ_v(−1)` | `(−1)·(−1)^{m}` with `m` odd is `1`; products `1 = (2/7) = (2/15)` | true | none |
| §1.2, §1.3 | pairing at `l`; `c = 0`; `Q(√−15)`, `p = 7` | `(φ(λ)φ(λ̄)/l)^m = κ_K(l)^m = 1`; `χ((p)) = 1`; `a² + 15b² = 12` has no solution | true | none |
| §2.2 Kronecker formula | `Q(i)`, `f = (3)`, `a = (5)` | left `−6 log 3`, right `−12 log 3` | false by a factor 2 | S01 |
| §2.2 norm compatibility | conjugates of `α` over `K(p^n f)` | `{uα : u ≡ 1 (p^n f)} = α + p^n f/p^{n+1}f`, the fibre of the isogeny | true for `n ≥ n_f` | none |
| §2.3 height-one statement | character `σ_a ↦ N(a)` | its kernel has height two (`G` has rank two) | consistent | none |
| §2.4 integral dictionary | `f = (√−7)`, `y = 1/√−7`, `5/√−7` | degrees `1`, `25` | prime-to-`p` degree needed | none |
| §2.5 torsion data | `g = (56)`, `p = 7` | `ξ_1 = 8`, `α_1 = 1`, `ν_1 = 7`; `pν_{n+1} = ν_n` | as README | none |
| §2.5 disjointness | `Q(i)`, `g = (7)`, `N = 3` | local sums `U^{(a)}U^{(b)} = U^{(min)}`; `21O + 7^{n+1}O = 7O` | true | none |
| §2.6 sign of the derivative | `a = (5)` | `dlog θ ∼ 24 dz/z`; `(d/dz)^r log θ = (−1)^{r−1}(r−1)!(N E_r − Σ E_r)` | README's sign is the computed one | none |
| §2.7 smoothing unit | `α ≡ 2 mod p` | `α(ᾱ − 1) ≡ 2` | unit for `p ≥ 5` | none |
| §3.2 | `p = 47`, `l = 23` | `(−7/47) = (2/47)(5/47) = −1`; `47² − 1 = 23·96` | as README | none |
| §3.3 | `[F_n : H]` | Galois group inside `(O_K/p^{n+1})×`, local degree `(p² − 1)p^{2n}` | product decomposition holds | none |
| §4.2 dimension | `H = 2r√D x̄y`, area `N(a)√D/2` | `rDN(a)`; `25·7/25 = 7` | as README | none |
| §4.3 `γ` | prime above `2` in `Q(√−7)` | `(1/2)(1/2)·2 = 1/2 = γ((2))` | as README | none |
| §4.4 (13) from Yang's formula | `|l|² = ε l²`, `⟨ϑ, ϑ⟩ = ε b(ϑ, ϑ)`, `b = 2π b_ar/Ω` | `Ω⁻¹L = 2^{ν(D)} D^{−1/2} ∏ b_ar⁻¹ (l/w_K)²` | as README | none |
| §4.4 valuation identity | (13) with (15) | `−v(D)/2 + v(D)/4 − v(W̃) + Σμ + b_ℓ + 2v(l/w_K)` | `D^{1/4}` as README | S03 (reference only) |
| §5.1 self-duality | `λ = φ̄ν|·|` | `λ(x̄)⁻¹|x| = φ⁻¹ν = φ̄ν|·|` | `λ = λ*` | none |
| §5.3, §5.4 | `ν ≠ 1`; `p ∤ D` | `L_{pfl^m} = (1 + 1/p)L_f`; `v_p(D^{1/4}) = 0` | as README | none |
| §6.3 | `η|·|^{1/2}` | `η_∞|z| = (z/|z|)⁻¹`; central character `κ_K·κ_K = 1` | weight two, trivial character | none |
| NCM mapping | consumers' citations | NCM.2/inert-frobenius ↔ §3.4; NCM.5/central-nonvanishing ↔ §6.4 | mapping absent | S02 |

Dependency check (command of the brief), output: `depcheck: 239 roadmaps, 2171 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.

## Verified sound

- Declarations read: all 11 of `Suggested.lean` (7 definitions including `rohrlichCount`, 1 local instance, 3 theorems). I ran no Lean (read-only pass); I compared each README statement with the worker's elaborated signatures, in which no section binder is lost; the two entries `)` and `fields` of that transcript are fragments of the module docstring, not declarations. Nothing changed.
- Headline theorems: the parity dichotomy and Rohrlich's two counts are stated; the unit theorem, Finis's theorem, Kato's reciprocity law, the Lubin–Tate comparison, the root-number formulas and Jia's average are named in the module docstring with the missing carrier. The pins have no root number, Euler factor or `L`-function of a `HeckeCharacter` (searched by object), so `eulerFactor` and `HasCentralValue` duplicate nothing. No declaration is padding.
- Targets read: all 44 numbered sections of Layers 0–6 and every Check. Checks recomputed: 41; all correct except the three values of S01.
- Locators verified against the cached texts this round: 12 groups (KATO04 lines 883–956, 5242–5292, 5321–5350, 5463–5571; FINIS06 lines 55–100, 101–122; BKO21 lines 385–416, 474–488, 490–513; JIA24 lines 17–70, 96–100, 122–129).
- Sibling citations resolved at the open heads: 19 (ComplexMultiplicationAndExplicitReciprocity §§2.2, 4.1, 4.2 for scope, 4.3; NeronModelsAndSemistableAbelianVarieties §§5.1, 5.1a; GL2AutomorphicRepresentationsAndTransfer R16.2.13, R16.5.3, R16.6.1, R17.4.16; AutomorphicLFunctionsAndLocalFactors AL.1.1.1, AL.1.3.1, AL.1.3.4, AL.1.3.5, AL.1.5.2, AL.1.6.1, AL.1.6.2, AL.5.1.1, AL.5.3.2). All exist with the hypotheses the README states.
- Pinned declarations: `idealCharacter`, `idealCharacter_apply_prime`, `idealCharacter_apply_toPrincipalIdeal`, `finiteComponent`, `conductorExponent`, `finiteConductor`, `Modulus`, `IsCongrOne`, the six ring-class declarations, `Subalgebra.linearDisjoint_iff_injective`, `DirichletCharacter.LFunction_apply_one_ne_zero` exist where cited.
- The two declared gaps have the same slugs in `design/plan.json` and the README, a named supplier and section each, and one precise sentence each.
- Ownership: searched the open heads and main for `IsAnticyclotomic`, `IsPAnticyclotomic`, `rohrlichCount`, `HasCentralValue`, `IsEquivariantTypeOneZero`, `conductorModulus`; the only other owner is this roadmap's own open content head, which this package supersedes. The settled finding on ModularIwasawaMainConjecturesPartII is not re-raised.
- Policy: the pull request changes only the package folder; no process words, pull-request numbers, `lemma` or `set_option` in the README or the Lean file; no local path in the manifest.

Source independence: 9 passages compared with 4 sources (BKO21, KATO04, FINIS06, JIA24), none shared beyond formulas and hypotheses the mathematics forces; largest share FINIS06, 45 of 124 locators; contents compared with FINIS06: independent (§§4.2, 4.3 and 4.4 each draw on parts of its §§2 and 3; the order is forced by the *Needs* lines of §§4.3, 4.4, 4.6 and 4.7).

## Not verifiable

- KATO04 (3.8.1)–(3.8.2) and (15.5.1), (15.9.1): the extraction loses symbols in the displays, so the signs the README attributes to Kato's print in §2.6 (the factor `(−1)^{r−1}`, units against theta values) could not be compared with the text; the README's own signs agree with my computation.
- KATO99 (uncertified) and BOXALL92 (waived): cited by locator only; the height-one law over `K''` and Boxall's theorem were not checked against the texts.
- QUEYRUT74, GREENBERG83, RUBIN87, AH05, YANG97, ROHRLICH84 and ROHRLICH-NOTES: not reopened in this round (verified in round 1).
- Elaboration: no Lean was run; the signatures are the worker's transcript.

## Source issues

- **Error** in KATO04 at (15.5.1), printed p.253: the source says, as far as the extraction shows, that the sum of logarithms of ordinary absolute values equals the smoothed limit; it should be half that limit (or use squared absolute values); affects a stated result.

## For the human reviewers

- **Licence.** The cached text of BKO21 carries a JSTOR download notice (BKO21 lines 282–284), while `sources.toml` records it as operator-local and the README links the Caltech repository copy.
- **Scope.** JIA24, source of §§6.2–6.4 and of the nonvanishing half of the Lean headline, was read as arXiv v1; the journal reference at README.md:932 was not confirmed.
- **Not tested.** The signs README §2.6 attributes to Kato's printed Proposition 15.9 rest on displays the KATO04 extraction does not preserve (KATO04 lines 5517–5536).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2d195d5f650205c8a889419c9ed7b4ab2aff484c", "job": "RT-NonordinaryCMSpecialValues~2b", "model": "fable", "worker": "chris-x29"} -->
