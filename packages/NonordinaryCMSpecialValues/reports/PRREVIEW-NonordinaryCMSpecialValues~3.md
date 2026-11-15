# Review of NonordinaryCMSpecialValues (pull request #2290 at 26e27c6)

**Verdict:** needs changes

## R01 (P2) — §2.7 asserts integrality of the whole family; the route proves it only where a smoothing factor is a unit

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:466`: “Construct … the norm-compatible family `z_a ∈ H¹(K(a), T_φ^∨(1))` for admissible moduli `a` … Integrality is a theorem here … Proof route for the component the local-unit argument uses”.
**Claim:** The target is integrality at every level and on every component. The route (a unit smoothing factor `N(a) − φ(a)σ_a`, then (15.6.3)) covers only components where some factor is a unit. On the component where the Artin symbols act through the residual character of `T_φ^∨(1)`, every factor is a nonunit, and (15.6.3)–(15.6.4) give only membership in the reflexive hull of the Iwasawa cohomology; over a rank-two tower that hull can be strictly larger, with quotient killed by exactly these factors. No layer, supplier or source closes this: Kato's Proposition 15.9 is a statement after `⊗ Q(Λ)`, and BKO21 lines 414–416 assert the integral family by citing it.
**Witness:** `K = Q(√−7)`, `p = 5`, level `K(f·5)`, eigencomponent `σ_b ↦ N(b)/φ(b) mod 5`: for `b = (α)`, `α ≡ 2 mod 5`, the factor is `4 − 2·2 = 0`; for every `b` it is `N(b) − φ(b)·N(b)/φ(b) = 0`.
**Repair:** Replace the first sentence and the two integrality sentences by: “Construct … the norm-compatible family `z_a ∈ H¹(K(a), T_φ^∨(1)) ⊗ Q`, the image of `z_{p^∞f}` under the cup product with `γ` (§2.6), … . Prove integrality where a smoothing factor is a unit: on every component of `R[[Gal(K(ap^∞)/K)]]` other than the one on which the Artin symbols act through the residual character `σ_b ↦ N(b)/φ(b)` of `T_φ^∨(1)`, the class lies in the image of the cohomology of the lattice `T_φ^∨(1)` fixed in §2.4; this covers every level prime to `p` and the `ν`-evaluated, `Gal(H/K)`-augmented, `Δ`-invariant projection of §3.6. On the excluded component the class is only shown to lie in the reflexive hull, and no integrality is asserted.” Keep the existing route as the proof. On the witness the new text asserts nothing on the excluded component, and on the `Δ`-invariant projection the factor is `2(2 − 1) = 2`, a unit. In §2.8 write “the class of §2.7” for “the integral class”; its identity is rational and unchanged.

## R02 (P3) — “How to read the build” omits Layer 3 from the inputs of Layer 5

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:125`: “Layer 5 specialises Finis to the canonical family to obtain the unit theorem and the coefficient descent; it uses Layers 0, 1, 2 and 4.”
**Claim:** Layer 5 uses Layer 3 in three sections.
**Witness:** *Needs:* of §5.3 (“§§0.3, 0.6, 3.4”), §5.6 (“§§0.6, 2.8, 3.3, 3.6, 5.3”), §5.7 (“§§3.5, 5.6”); Layer 5 Dependencies, line 829: “Layers 0, 1, 2, 3 and 4”.
**Repair:** “it uses Layers 0–4.”

## R03 (P3) — Layer 3 Dependencies names Layer 2, which no section of Layer 3 uses

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:585`: “Layers 0 and 2 (the class field `K(f)` and torsion fields); ComplexMultiplicationAndExplicitReciprocity §§3.2, 4.1; ClassFieldTheory Layer 13”.
**Claim:** No *Needs:* line of §§3.1–3.6 cites a section of Layer 2; the ray class fields and torsion fields come from ClassFieldTheory Layer 13 and ComplexMultiplicationAndExplicitReciprocity §§3.2, 4.1, already listed. The layer-level edge blocks Layer 3 behind Kato's reciprocity for nothing.
**Witness:** The six *Needs:* lines cite, inside the roadmap, only §§0.1, 0.6, 3.1–3.5.
**Repair:** “Layer 0; ComplexMultiplicationAndExplicitReciprocity §§3.2, 4.1; …” (rest unchanged).

## R04 (P3) — The description cites a section number the head no longer has

**Location:** Pull-request description, third paragraph: “Section 4.5a imports the ordinary periods and measure from AutomorphicPadicLFunctionsPartII §§5.1, 6.1–6.2 and 8.5”.
**Claim:** The head has no §4.5a: Layer 4 is §§4.1–4.8 and the weight comparison is §4.7; Layer 3 gained §3.6. The description does not say so.
**Witness:** `README.md:703` “### 4.7 Comparison of weights at a split valuation prime”; `README.md:569` “### 3.6 The semilocal character factors”.
**Repair:** “Section 4.7 imports the ordinary periods and measure from …”; add “Layer 4 has eight sections (§4.8 is Finis's theorem) and Layer 3 six (§3.6, the semilocal character factors).”

## Previous findings

- R01 — repaired: line 27 “supplied by AutomorphicPadicLFunctionsPartII §§6.2, 8.5”; lines 107, 707, 737 “§§5.1, 6.1–6.2, 8.5”. At that roadmap's open head §6.2 is the target “6.2 Canonical differentials and p-adic periods” under its heading 6.1.
- R02 — repaired: line 24 “ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2, 4.1, 4.3”.
- R03 — repaired: line 433 “Let `β ∈ H₁(E(ℂ), Q)` be the image of `1 ∈ K` …, and let `ξ = (ξ_n)_n` be the `O_K ⊗ Z_p`-basis”.

## Verified sound

| Statement | Instances tried | Computed, one side | Computed, other side | Result / change |
| --- | --- | --- | --- | --- |
| §0.1 type and rational law | Gaussian `φ`, `n = 7`; `ψ = φ³/N` at `3 + 2i` | `κ(7)·7 = −7`; `(3+2i)³/13 = (−9+46i)/13` | `3 + 2i`; `2+2i = −i(1+i)³` | Converse needs the type; JIA24 lines 126–129 |
| §0.3 Euler factor, central value | `φ((7)) = −7`, `s = 1`; inert `p` deletion | `(1 + 1/7)⁻¹ = 7/8` | `+7` gives `7/6`; `E_p(1) = 1 + 1/p` | Pins: `idealCharacter_apply_prime` uses valuation `exp(−1)` |
| §0.4 period datum | `Q(√−5)`, `a = (2, 1+√−5)` | `x² + 5y² = 2` has no solution | `a ≠ ΩO_K` | BKO21 lines 404–407 |
| §0.5 auxiliary prime | `K = Q(√−7)`, `p = 5`, `l = 23, 11, 13` | `−7 ≡ 16, 4, 6`; residues mod 13: `1,3,4,9,10,12` | `23 ≡ 3`, `11 ≡ 1 mod 5` | 23 admissible, 11 and 13 not; BKO21 lines 388–390 |
| §2.2 Kronecker formula | `Q(i)`, `f = (3)`, `a = (5)`, `χ = 1` | `∏_{Q ∈ E[3]∖0} θ(Q) = 3²⁴`, 4 units, so `log∣Nθ∣ = 6 log 3`; left `2·(−6 log 3)` | `24·ζ_K(0)·log 9 = −12 log 3` | Equal with the factor 2; KATO04 lines 5271–5292 |
| §2.4 integral dictionary | `z ↦ Ωtz`, `t ∈ f⁻¹`; compose with `[5]` | degree `N(tf)`; lattice `5Ωtf` | transported vector `5γ` | Prime-to-`p` degree needed; both curves have character `φ ∘ N_{K(f)/K}` |
| §2.5 height-one law | `Q(i)`, `p = 7`, `g = (56)`; `p = 2`, `g = (4)` | `1 ≡ 8 + 49`; `ν_1 = 7`; `8 − 7 = 1 = α_1` | `8 + 7 = 15 ≠ α_1`; idele `i` acts on `T_3` by `−i` | KATO04 lines 5478–5530; hypothesis and sign as stated |
| §2.6 descent | Gaussian, `q ∣ 5`, `r = 1` | `(6−2i)(6+2i)/25 = 8/5` | `1 − 5/25 = 4/5` | Nonzero; cancellation rational only |
| §2.7 smoothing factor | `α ≡ 2 mod 5`: `Δ`-invariants; residual component | `2(2−1) = 2` | `4 − 2·2 = 0` | R01 |
| §3.1 composita | `p = 5`, `n = 0`; order `l^r` | `[Φ_0 : Φ] = 24` | modulus `f l^{r+1} p^{n+1}` | BKO21 lines 435–437 (one letter for order and conductor there) |
| §3.2 disjointness | `p = 47`, `l = 23`, `Q(√−7)` | `47² − 1 = 2208 = 23·96`; `(−7/47) = −1` | degrees not coprime | Ramification argument needed and sufficient |
| §4.1 local invariants | conductor `q`, values `ζ_ℓ`; inert `v_q(f_λ) = 0, 1` | `μ_ℓ = 1/(ℓ−1)` | `W_q = 1, −1` | FINIS06 lines 61–99 |
| §4.3 dagger on eigenlines | 2-dim eigenspace, `†`-fixed `u, v` | `(u + iv)† = u − iv` | needs `γ = 1` and `γ = −1` | Restriction to `V^{prim}` right; FINIS06 lines 473–483, 859–861 |
| §4.4 valuation identity | powers of `D`; `v(b′) = 3/4`, product `1` | `−v(D)/2 + v(D)/4 + v(D)/4 = 0` | `0 − 0 − 3/4 + 1 = 1/4` | (13)+(15) give the line; FINIS06 lines 867, 928–940, 1137–1140 |
| §4.6 mod-`ℓ` nonvanishing | `ℓ ≠ p`, `p` odd split, `p ∤ d_0`, `m` large | README hypotheses | FINIS06 lines 1221–1225 | Same hypotheses, same quantifier order |
| §4.7 weight comparison | `k = 2`; `k = 1, 2, 3` | `(−2,1) + (1,−1) = (−1,0)` | `(k−1)! = 1, 1, 2` | FINIS06 lines 1149–1216 |
| §4.8 Finis's theorem | split `ℓ`, all `k`; nonsplit, `k = 1` | README statement | FINIS06 lines 101–122 | Same hypotheses and exception `Q(√−3)`, `ℓ = 3` |
| §5.1 weight-one family | norm 25, `η(a) = −5` | `1 + 1/5 = 6/5` at centres `0, 1, 2` | `Nη` at `−1`: `1 + 3125 = 3126` | Divided twist is the right one |
| §5.4 unit theorem (headline) | tower `23`, valuation `5`, `D = 7` | right side `0 + 0` (§5.2) | `v_5(7^{1/4}) = 0` | Nonsplit `k = 1` case applies; BKO21 lines 501–508 |
| §5.5 witness | orders `23^r`, `r ≥ 1` | conductors `23^{r+1}`, pairwise distinct | finite exceptional set | BKO21 lines 490–513 |
| §6.1 Rohrlich counts (Lean) | `P = {5}`, `α = 5`, `β = 0`; `d = 11/20` | `q = 5`: 6 pairs; `q = 25`: 0 | `5d/2 − 1 = 3/8 < 7/16` | ROHRLICH84 lines 763–775, 896–900; Lean matches |
| §6.2 average | `r = 7/16`, `a = 15/16`; `P = {5}` | `r − a/2 = −1/32` | `2L(1,κ)(1 + 1/5)` | Decay; support `{5, 7}` |
| §6.5 parity dichotomy (Lean) | orders `1, 5, 25, 125`; even `ν` on `Q(√−15)`, `p = 7` | `c = 0, 2, 3, 4`; signs `+,+,−,+` | `(φν)((7)) = −7`, unitary value `−1` | Holds for finite-order `ν`; only `χ` needs odd order |
| How to read the build | Layer 5 inputs | line 125: Layers 0, 1, 2, 4 | *Needs:* of §§5.3, 5.6, 5.7 cite §§3.3–3.6 | R02 |
| Layer 3 Dependencies | *Needs:* of §§3.1–3.6 | internal: §§0.1, 0.6, 3.1–3.5 | line 585 names Layer 2 | R03 |
| Description, third paragraph | section numbers | “Section 4.5a” | head: §4.7 | R04 |

- Source locators checked against the text: 31, in BKO21, FINIS06, KATO04, JIA24 and ROHRLICH84 (all 15 seeded targets); 0 README locators are flagged unverified.
- Library declarations opened at the pins: 11 (`HeckeCharacter.idealCharacter_apply_toPrincipalIdeal` Ideal.lean:200, `idealCharacter_apply_prime` Ideal.lean:155, `finiteComponent` FiniteComponent.lean:85, `conductorExponent` :181, `finiteConductor` :254, `finiteConductor_ne_bot` :270, `IsFiniteOrder`, `ringClassField` Field.lean:111, `linearDisjoint_iff_injective` LinearDisjoint.lean:233, `LFunction_apply_one_ne_zero` Nonvanishing.lean:412, `MonoidAlgebra.lift_single` Basic.lean:250); none states a target of this roadmap.
- Cross-roadmap citations resolved: ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2, 4.1, 4.3, AutomorphicPadicLFunctionsPartII §§5.1, 6.1–6.2, 8.5 and LubinTateFormalModulesAndQuasiCanonicalLifts §§2.1–2.4, 4.3–4.4 at their open heads; AnalyticNumberTheoryPartI §2.3a, PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5, DiophantineApproximationAndTranscendence §§2.1, 2.3 and ArithmeticDirichletSeries Layers 5–6 on main. Other roadmaps cite only §§2.1–2.6 and NCM.0–NCM.5 of this one; the renumbered §§3.3–3.6 and 4.1–4.8 are cited nowhere else, and the former-numbering table covers NCM.0–NCM.5.
- Gate: every worker check passes at `26e27c6`, including the targeted build. `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder changes.
- Lean: `lake env lean` on `Suggested.lean` gives exactly 3 `sorry` warnings. The 11 elaborated signatures were compared with the README: no binder lost; the only statement change since `ae1efd5` drops `Odd (orderOf ν)`, matching §§1.4 and 6.5. One-tactic probes (`simp`, `rfl`, `infer_instance`, `simp [rohrlichCount]`, an anonymous-constructor `exact`) close none of the three theorems.
- Headlines: the parity dichotomy and Rohrlich's two counts are stated; the unit theorem and witness, Finis's theorem, Kato's reciprocity and the integral class, the Layer 3 comparisons, the root-number formulas and Jia's average are named in the docstring with their missing carriers, which are absent at the pins (no anticyclotomic, CM-curve or central-value declaration in either library).
- Ownership against the open pull requests listed: no other `Suggested.lean` declares any of the seven definitions.

Overlap check: read ModularIwasawaMainConjecturesPartII, KatoEulerSystems, AnticyclotomicLocalUnits, ComplexMultiplicationAndExplicitReciprocity, ModularIwasawaMainConjectures, LFunctions and GlobalNumberFields; Kato's CM theta function, units, zeta element, realisation and reciprocity: owner this roadmap, imported by ModularIwasawaMainConjecturesPartII §§2–8; canonical Gross characters and CM periods: owner ComplexMultiplicationAndExplicitReciprocity; the `ξ_ν` projection and signed kernels: owner AnticyclotomicLocalUnits; continuation and functional equation of Hecke L-functions: owner AnalyticNumberTheoryPartI §2.3a on Tau Ceti's `HeckeCharacter` (cited here), with LFunctions Layer 6 owning the Grossencharacter presentation, not consumed; nothing else shared.

Source independence: 15 passages compared with 5 sources (FINIS06, KATO04, BKO21, JIA24, ROHRLICH84), none shared beyond formulas and hypothesis lists; largest share FINIS06, 29 of about 85 locators; contents compared with FINIS06 (§1 introduction, §2 theta functions and L-values, §3 integral theta functions, §4 nonvanishing in characteristic `ℓ`): independent — §§4.2–4.4 each draw on its §§2 and 3, §4.7 on the end of §3 and on two supplier roadmaps, and the other six layers are not from it.

## Not verifiable

- KATO99, Theorem 4.3.1 (§2.5): recorded as uncertified; the application in KATO04 lines 5495–5517 was the text read.
- BOXALL92, Théorème 1 (§4.5): recorded as waived; the application in FINIS06 lines 1571–1587 was the text read.

## Source issues

- **Gap** in KATO04 at proof of Proposition 15.9, p.258: the source says the canonical pair over the ray field of `p^m f_0` has good reduction everywhere because that modulus lies in `f`; it should require global units to inject modulo the prime-to-`p` part, enlarging it otherwise; affects the proof.
- **Misprint** in KATO04 at proof of Proposition 15.9, p.258: the source says the auxiliary theta functions are translates by plus the torsion point `ν_n`; it should be minus `ν_n`, as its own evaluation at `ξ_n` requires; affects nothing.
- **Gap** in KATO04 at (15.4.2), p.252: the source says the norm along any CM isogeny carries the theta function of `a` to that of the target; it should require the kernel to meet the `a`-torsion trivially; affects a stated result.
- **Gap** in BKO21 at §3.0.2, pp.951–952: the source says Kato's Proposition 15.9 yields a norm-compatible family with integral coefficients; it should say Kato's element is integral only after a smoothing factor, which is a unit on the projection used; affects the proof.
- **Misprint** in BKO21 at §3.0.2, pp.952–954: the source says one exponent letter serves for the order, the field layer and the conductor of an auxiliary character; it should distinguish order `l^r` from conductor `l^{r+1}`; affects nothing.
- **Error** in FINIS06 at Lemma 3.5(4), p.787: the source says every Shintani eigenfunction of the full space is proportional to its conjugate-reflection; it should restrict to multiplicity-one eigenlines of the primitive subspace; affects nothing.
- **Misprint** in JIA24 at (2.43), p.10: the source says the tail bound with a positive exponent in the exponential cutoff; it should be the negative exponent; affects nothing.

## For the human reviewers

- Licence / not read: KATO99 (uncertified) and BOXALL92 (waived) were not read; `README.md:433` and `README.md:683` cite them by locator only.
- Scope: JIA24, the source of §§6.2–6.4, was read as arXiv:2412.05867v1; `README.md:923` gives its publication as Acta Arithmetica 224 (2026), which was not checked.
- R01 asks the roadmap to assert less than BKO21 lines 414–416 print (an integral family obtained from Kato's rational statement); whether to keep the stronger statement as a separately proved target is a design choice.
