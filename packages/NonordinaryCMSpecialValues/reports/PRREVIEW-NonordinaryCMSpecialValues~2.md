# Review of NonordinaryCMSpecialValues (pull request #2290 at ae1efd5)

**Verdict:** needs changes

## R01 (P3) — The ordinary periods are cited at the wrong supplier section

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:27,107,671,701`: “The ordinary CM `ℓ`-adic period and Katz measure at split `ℓ` are supplied by AutomorphicPadicLFunctionsPartII §§6.1, 8.5”; “§§5.1, 6.1 and 8.5: the paired complex and ordinary periods”.
**Claim:** AutomorphicPadicLFunctionsPartII §6.1 defines ordinary lifted types and level structures only; the unit periods `Ω_p`, `Ω_p∨` that §4.5a's moment comparison divides by are defined in its §6.2.
**Witness:** Open head of AutomorphicPadicLFunctionsPartII, `README.md:953` (“6.1 Ordinary lifted types and CM level structures”, no period) and `README.md:980–982` (“6.2 Canonical differentials and p-adic periods”: `ω_A = Ω_p·ω_can(A)`).
**Repair:** Line 27: “§§6.2, 8.5”. Lines 107, 671 (*Needs*) and 701: “§§5.1, 6.1–6.2, 8.5”. In the pull-request description write “imports the ordinary periods and measure from AutomorphicPadicLFunctionsPartII §§5.1, 6.1–6.2 and 8.5”.

## R02 (P3) — The scope line still cites a supplier section nothing consumes

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:24`: “the good-prime Frobenius identities: ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2, 4.1–4.3”.
**Claim:** The range includes §4.2 (all-prime factors and induction), whose two consumptions this head removed; no contract bullet, *Needs:* line or Dependencies line cites it any more.
**Witness:** The supplier-contract block (README lines 60–65) lists §§4.3, 4.1, 1.2, 2.2, 3.2 only; §3.4, Layer 3 Dependencies, §6.3 and Layer 6 Dependencies no longer name §4.2.
**Repair:** Write “ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2, 4.1, 4.3”.

## R03 (P3) — A sentence of the repaired §2.5 lost its verb

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:424`: “Let `β ∈ H₁(E(ℂ), Q)` the image of `1 ∈ K` under `K ≅ H₁(ℂ/g, Q)`, and `ξ = (ξ_n)_n` the `O_K ⊗ Z_p`-basis”.
**Claim:** Splitting the sentence to insert the good-reduction hypothesis left the definition of `β` and `ξ` without “be”.
**Witness:** The sentence as quoted; the previous head read “Let `(E, α)` be the canonical CM pair over `K(g)`, `β ∈ … ` the image of …”.
**Repair:** “Let `β ∈ H₁(E(ℂ), Q)` be the image of `1 ∈ K` under `K ≅ H₁(ℂ/g, Q)`, and let `ξ = (ξ_n)_n` be the `O_K ⊗ Z_p`-basis of `T_pE` given by `p^m β`, with `ξ_n` its image in `E[p^n]`.”

## Previous findings

- R01 — repaired: “`2 Σ_σ χ(σ) log|σ(_az_f)| = (N(a) − χ(a)⁻¹) · lim s⁻¹ L_{K,f}(χ, s)` … where `|·|` is the ordinary complex absolute value”; Check and Layer 2 example now give `−6 log 3`.
- R02 — repaired: §2.5 assumes “`E` has good reduction at every place above `p`”; §2.6 enlarges the modulus to `f_0 b` with injective units, proves good reduction above `p`, and cancels the nonzero auxiliary Euler factors.
- R03 — repaired: “For `8 | D` there are two canonical families with opposite root numbers; class-character twists preserve the root number within each family (Rohrlich, Root numbers, Proposition 1.6, p.15).”
- R04 — repaired: the plan's `gaps` list is empty at this state; §1.3 and §2.9 are owned targets, §2.9 now stands before §§2.5–2.8, so §2.7 no longer needs a later section; the description says both “remain targets here”.
- R05 — repaired: the open head of ModularIwasawaMainConjecturesPartII (`README.md:23,120,296,357`) imports §§2.1–2.6 from this roadmap; Downstream consumers here records “Kato's CM theta function, standard elliptic units, zeta elements, realisation and reciprocity law (§§2.1–2.6)”.
- R06 — repaired, with the locator slip of this report's R01: §4.6 states type `(−k, k−1)` with multiplier `Ω^(1−2k)(k−1)!(2π/√D)^(k−1)W_ℓ(λ)` for split `ℓ`; new §4.5a carries the change-of-weight comparison.
- R07 — repaired: “Take `K = Q(√−7)`, `p = 5`, canonical `φ`, and `ρ` of order `25` in the `5`-anticyclotomic family … both have conductor exponent `3`, hence root number `−1` and central value `0`”.
- R08 — repaired, with the residual range of this report's R02: the contract cites §4.1 only, restricts the scalar `−p` statement to rational CM curves, and §6.3 cites GL2AutomorphicRepresentationsAndTransfer R17.4.16 alone.
- R09 — repaired: “This pull request adds the new NonordinaryCMSpecialValues roadmap in `TauCetiRoadmap/NonordinaryCMSpecialValues/`: `README.md`, `Suggested.lean` and `metadata.toml`.”

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side | Result / change |
| --- | --- | --- | --- | --- |
| §1.1, `8 ∣ D` sentence and new Check | `D = 8`, `h = 1` | `∣X(8)∣ = 2h = 2`; one character per sign | Class-character group trivial; orbit size `1 = h` | Matches ROHRLICH-NOTES lines 677–680 |
| §2.2 logarithmic formula | `K = Q(i)`, `f = (3)`, `a = (5)`, `χ = 1` | `2·(−6 log 3) = −13.1833` | `24·(−(log 3)/2) = −13.1833` | Matches; factor 2 is the squared norm |
| §2.5 good-reduction hypothesis | `p = 2`, `g = (4)`, inertia idele `i` | `i ≢ 1 mod 4` globally, yet idele `i` at `2` lies in `K×·U_4` | Action on the 3-adic line `−i ≠ 1` | Hypothesis fails there, as the Check says |
| §2.5 Check, modulus `(20)` | Units `±1, ±i` modulo `5` | `i ↦ (2, 3)`, `−1 ↦ (4, 4)` in `F_5 × F_5` | None equals `(1, 1)` | Unit kernel trivial; obstruction removed |
| §2.6 good reduction after enlargement | Local unit `u` at `𝔭 ∣ p` fixing `K(p^m f_0 b)` | `u = x·w`, `x` a global unit, `x ≡ 1 mod f_0 b` | Injectivity gives `x = 1`, so the prime-to-`p` action is `1` | Argument closes for split and inert `p` |
| §2.6 auxiliary factors | Gaussian character, `q ∣ 5`, `r = 1` | `(6−2i)(6+2i)/25 = 8/5`; modulus of each term `5^{−1/2} ≈ 0.447` | Nonzero; `v_2(8/5) = 3` | Cancellation valid rationally, not integrally |
| §2.9 position | §2.7 *Needs* `2.9`; §2.9 *Needs* `2.4` | §2.9 now after §2.4 | First use §2.7 | No backward dependency; identifiers kept |
| §3.4 route after the contract change | `v ∣ p` in `H`, `p` inert, principal | `N_{H/K}(v) = (p)`; `φ((p)) = κ(p)·p = −p` | Frobenius `ψ_E(v)` of supplier §4.1 for `A/k` general | No rational-curve statement needed |
| §4.5a moment formula | Split `ℓ`, conductor divisible by all tame primes | `v_ℓ(B_k(λ)(1 − λ(𝔩̄))²)` | FINIS06 lines 1156–1163 with unit period `Ω_ℓ` | Matches |
| §4.5a change of weight | `k = 2`: `(−2, 1) + (1, −1)` | `(−1, 0)`; inverse twist `(−3, 2)` | Required type `(−1, 0)` | Matches; wrong direction excluded |
| §4.5a invariance of `α` | `σ` of conductor `ℓ^m`, `ℓ` split, `q` inert | `σ_q` trivial on `O_{K_q}×` | `μ_ℓ(λ_qσ_q) = μ_ℓ(λ_q)` | `α(λ′) = α(λ)` |
| §4.5a strictness | `v(∫(λ̂ − λ̂′)dμ) > α` | `v(B_k) ≥ α`, equality iff `v(B_1(λ′)(1 − λ′(𝔩̄))²) = α` | FINIS06 lines 1196–1206 | Matches |
| §4.5a multipliers | `k = 1, 2, 3` | `Ω⁻¹`, `Ω⁻³(2π/√D)`, `2Ω⁻⁵(2π/√D)²` | `(k−1)! = 1, 1, 2` | Matches |
| §4.5a supplier sections | AutomorphicPadicLFunctionsPartII §§5.1, 6.1, 6.2, 8.5 | §6.1: types and level structures | §6.2: `Ω_p`, `Ω_p∨` | R01 |
| §4.6 statement | Split `ℓ`, all `k ≥ 1`; nonsplit `ℓ`, `k = 1` | Normaliser `Ω^(1−2k)(k−1)!(2π/√D)^(k−1)W_ℓ(λ)`; `Ω⁻¹D^{1/4}` | FINIS06 lines 101–122 | Same hypotheses and exceptions |
| §6.3 Check | `K = Q(√−7)`, `p = 5`, `ρ`, `ρ²` of order `25` | Conductor exponents `3, 3`; signs `(+1)(−1)³ = −1` | Forced values `0, 0` | Matches §§1.1, 1.4–1.5 |
| Scope line for the CM supplier | Sections consumed | `4.1`, `4.3`, `1.2`, `2.2`, `3.2` | Range cited: `4.1–4.3` | R02 |
| `Suggested.lean` docstring | Finis headline entry | “every critical weight for split … weight one for nonsplit” | README §4.6 | Agrees; no statement changed |

The rows for untouched statements stand as in the previous review, of `ecbdd2f`.

- Sources: 3 seeded targets fall in changed passages (§§1.1, 3.4, 4.5a) and were read at their locators (ROHRLICH-NOTES lines 677–680; FINIS06 lines 61–122, 1140–1216); 0 README locators are flagged unverified.
- Suppliers resolved: AutomorphicPadicLFunctionsPartII §§5.1, 6.1, 6.2, 8.5 at its open head (earlier in the merge order); PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5 on main; ComplexMultiplicationAndExplicitReciprocity §4.1 at its open head; ModularIwasawaMainConjecturesPartII at its open head.
- Gate: every worker check passes at `ae1efd5`, including the targeted build; `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Lean: direct elaboration succeeds with exactly 3 `sorry` warnings; the diff changes only the module docstring, so the 11 signatures and the one-tactic probes stand as before.
- Headlines: unchanged set; the docstring entry for §4.6 now names the ordinary CM measure as an additional missing carrier.
- Pull-request text: read against this head; apart from the section list corrected in R01, no sentence is contradicted and the added suppliers, the moved §2.9 and the widened §4.6 are stated.
- Remark: §2.9 stands between §2.4 and §2.5, out of numerical order; the identifiers are kept because other roadmaps cite §§2.5–2.10.
- Outside the folder: no file changed.

Overlap check: read ModularIwasawaMainConjecturesPartII, KatoEulerSystems, AnticyclotomicLocalUnits, ComplexMultiplicationAndExplicitReciprocity, LFunctions and GlobalNumberFields, and the new supplier AutomorphicPadicLFunctionsPartII; Kato's CM units, realisations and reciprocity are owned here and imported by ModularIwasawaMainConjecturesPartII; the ordinary CM measure and periods are owned by AutomorphicPadicLFunctionsPartII and imported here; nothing else shared.

Source independence: changed passages only; 6 passages compared with 3 sources (FINIS06, ROHRLICH-NOTES, KATO04), none shared; largest share FINIS06 as in the previous review; the diff adds a section but no layer, so the contents were not compared again.

## Not verifiable

- KATO99, Theorem 4.3.1, cited by the changed §2.5: no legal full text was available; the application in KATO04 was the text read.

## Source issues

- none

## For the human reviewers

- The primary BOXALL92 text is waived, and KATO99 was unavailable through the sources service; their original proofs were not independently read. The cited applications were checked in FINIS06 and KATO04, respectively.
