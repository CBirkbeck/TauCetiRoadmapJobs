# Review of ModularIwasawaMainConjecturesPartII (pull request #2281 at fadd5ba)

**Verdict:** needs changes

## R01 (P1) — §4.5's dyadic equality contradicts the Euler-system bound of §4.4

**Location:** `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/README.md` §4.5, lines 538–542: "`length (H¹/J_χζ_B(χ))_q = length H²_q` at every height-one q, including q containing p", with `ζ_B = 2ζ_D`; also §4.3 (lattice identity), §4.4(4), §4.6, §4.8, Worked examples line 1008.

**Claim:** At `p = 2` the equality for `J_χζ_B` is incompatible with Rubin's divisibility applied to the unscaled Euler system `aζ` of §4.1, which §4.4's own route and supplier give.

**Witness:** EulerSystemsAndKolyvaginSystems §8.37 (valid at `p = 2`; scaling weakens it) gives, at `q = (2)`, `K = ℚ(i)`, `χ = 1`, `s_a ∉ q`: `length H²_q ≤ length(H¹/J_χζ_D)_q = length(H¹/J_χζ_B)_q − 1`.

**Repair:** Use one normalisation in §§4.3–4.6, 4.8 for which bound and equality agree. By §8.37 that can only be `J_χζ_D`: drop the factor 2 from `ζ_B`, `aζ_B`, `e_B`, and restate §4.2–§4.3 so that the zeta element whose lattice is `Det⁻¹RΓ` satisfies `(N(a) − η(a))·z = e_D` (regulator in the squared norm of §2.5); or prove that §8.37 fails for `aζ` at `p = 2`. Add the instance above as a Check of §4.5.

## R02 (P2) — Layers 2–3 restate what NonordinaryCMSpecialValues §§2.1–2.6 own, and misdescribe that supplier

**Location:** README line 23: "Its §§2.3–2.6 use a direct theta-value convention and have standing hypotheses p ≥ 5 inert and p ∤ h_K"; repeated at lines 111, 119 and in §3.3 (line 444); targets §§2.2 (isogeny norm law), 2.4, 2.5, 2.6, 3.1, 3.2, 3.3.

**Claim:** The supplier states these objects for every prime; standard elliptic units, Kronecker's formula, `z_{p∞f}`, `V_L(ψ)`, `S(ψ)`, `per_ψ`, the height-one law and Proposition 15.9 have two owners.

**Witness:** NonordinaryCMSpecialValues (open head, #2290) `README.md` line 31: "§§2.1–2.6 hold for every prime `p`, split, inert or ramified, including `2` and `3`"; line 851 names this roadmap as consumer of §§2.1–2.6.

**Repair:** Replace the three sentences by "NonordinaryCMSpecialValues §§2.1–2.6 supply, for every prime, `aθ_E` with its coprime-kernel norm law, canonical CM pairs, `a z_f` with (15.4.4) and (15.5.1), `z_{p∞f}` with (15.6.3)–(15.6.5), `V_L(ψ)`, `S(ψ)`, `per_ψ`, the height-one law and Proposition 15.9." Delete those statements from §§2.2–2.6, 3.1–3.3 and cite the supplier in the `*Needs:*` lines. Keep here only what it lacks: `a ζ_m` for general `m` with the Euler norm relation (§2.4), the module `z ⊂ h¹`, the ideal `J`, the level-change formula (§2.6), the squared-norm statement of §2.5, the admissible auxiliary ideal for `r = 2` (§3.2).

## R03 (P2) — the `r = 2` Check of §3.2 computes a false value

**Location:** README §3.2, line 432: "for the square of the Gaussian curve character twisted by the quadratic ray character modulo (3), ψ((7)) = −49 and ψ((41)) = 1681. At χ = 1 the auxiliary factors are 98 and 0".

**Claim:** `ψ((7)) = +49` for this character, so the factor at `(7)` is 0, not 98.

**Witness:** The quadratic character of `(ℤ[i]/3)^×/μ₄` is `x ↦ N(x) mod 3`; at `x = 7`, `49 ≡ 1`. `ψ_E((7)) = −7` (`−7 ≡ 1 mod (1+i)³`), so `ψ((7)) = (−7)²·1 = 49`.

**Repair:** Replace the twist by the quartic ray class character `ε` modulo `(5)`, `ε(x) = i^{log₂(x mod 2+i) + log₂(x mod 2−i)}` (trivial on `i`: `3 + 1 ≡ 0 mod 4`; on `ℤ` it is the Legendre symbol mod 5). Then `ε(7) = −1`, `ψ((7)) = −49`, factor `98`; `ε(41) = 1`, `ψ((41)) = 1681`, factor `0`.

## R04 (P3) — consumed supplier sections missing from the contracts and from Layer 5's dependencies

**Location:** README §3.3 `*Needs:*` (lines 444, 446) and §5.1 `*Needs:*` (lines 616, 631, 647); `## Exact supplier contracts`; Layer 5 `### Dependencies` (line 723).

**Claim:** Sections used by targets are not in the supplier contracts, and Layer 5's dependency list omits sections its own `*Needs:*` lines use.

**Witness:** Not in any contract: ColemanPowerSeries Layer 1, §§2.37, 2.39, 2.44; IntegralIwasawaTheory §§7.1–7.2; SelmerIwasawaCohomology §3.6; NeronModelsAndSemistableAbelianVarieties §5.1; PadicMeasuresIwasawaAlgebras Layers 1, 4. All resolve at their heads.

**Repair:** Add `### From ColemanPowerSeries` and `### From NeronModelsAndSemistableAbelianVarieties` with these sections and what is assumed; add §§7.1–7.2, §3.6 and Layers 1, 4 to the existing subsections; add to Layer 5's Dependencies: ColemanPowerSeries §§2.37, 2.39, 2.44; IntegralIwasawaTheory §§7.2, 10.0; SelmerIwasawaCohomology §3.3; PadicMeasuresIwasawaAlgebras §5.1 and Layer 4.

## R05 (P3) — §4.2 Check counts two primes above 3 in `ℚ(i)`

**Location:** README §4.2, line 494: "At p = 3, η is ramified and both omitted local factors are 1."

**Claim:** There is one prime above 3.

**Witness:** `−1` is a non-residue mod 3, so `(3)` is inert in `ℤ[i]`; the product `∏_{𝔭∣3}(1 − η(𝔭))` has one factor, equal to 1.

**Repair:** "At p = 3, `(3)` is inert and `η` is ramified there, so the single omitted local factor is 1."

## R06 (P3) — the pull request description omits a supplier and misstates the Lean file

**Location:** Description, "Dependencies (…) In open pull requests of ours: …" and "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti".

**Claim:** NonordinaryCMSpecialValues, cited as supplier (README lines 23, 119, §§2.2, 2.3, 3.3), is not in the dependency prose; `Suggested.lean` has no declaration.

**Witness:** `grep -c NonordinaryCMSpecialValues` on the description: 0; the roadmap is open as #2290. `Suggested.lean` lines 34–36: an empty namespace.

**Repair:** Add "#2290 (NonordinaryCMSpecialValues)" to the dependency prose, and write "the Lean file states no declaration: its docstring names each headline theorem and the carrier it lacks at the pins".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 ray group | `ℚ(i)`: `(p,f) = (2,1), (5,1), (2,(3))` | `Δ = 1`, `ℤ/4`, `ℤ/8` (`(μ₄×ℤ/8)/⟨(i,2)⟩`, `(0,1)` of order 8); Kato line 5190 "three dimensional semi-local" | agrees | none |
| §1.1 twist semilinearity | `χ(g) = i`; `χ` quadratic | `g·(x⊗t) = χ(g)(gx)⊗t` so `φ(gx) = −i·gφ(x)`; quadratic gives −1 both ways | agrees | none |
| §1.2 root-of-unity limit | two-variable tower; cyclotomic line `p = 5` | transverse norm = `p^m`-th power → 1; `N(ζ₂₅) = ζ₂₅^{5+50} = ζ₅` | agrees | none |
| §1.3 Kummer | Kato (15.6.1) p. 253; JLK line 1117 p. 27 | locators at the stated pages | agrees | none |
| §1.4 `h² → H²` | `ℚ(i)`, `p = 5` and `p = 2`, base layer | Brauer kernel rank `2 − 1 = 1`; `1 − 1 = 0`; Kato lines 5302–5320, p. 254 | agrees | none |
| §1.5 Euler module | `ℚ(i)`, `p = 5`, `f = (3)`, `χ = ω∘χ_cyc` | `ω(9) = −1`; factor `1 + γ⁻¹`, augmentation 2, unit in `ℤ₅[[Γ]]`; `I_{(3)}` order 8 | agrees | none |
| §1.7 torsion-freeness | `x`-torsion; one-variable tower | `(R/x)[J] = 0` since `ht J = 2 >` 1; `Σ_j(1+jp^n) = p + p^{n+1}(p−1)/2 ≡ p` | agrees | none |
| §2.1 sign of `E^{(k)}` | `c = 5`, `k = 1, 2, 3` at `z → 0` | `(c²−1)/z = 24/z`; `−24/z²`; `2·24/z³ = 48/z³` | agrees | none |
| §2.5 Kronecker, squared norm | `τ = i`, `c = 5`, `z = 1/3`, `(1+i)/3` | `log|θ| = 0.66192107`, `5.92975266`; `2·diff = 10.53566318 = 8 log(2+√3)`; `24·L′(η,0) = 24·R/3 = 8R` | agrees; ordinary norm gives `4R` | none |
| §2.5 supplier's value | `χ = 1`, `f = (3)`, `a = (5)` | ordinary `log|N θ| = 6.5917 = 6 log 3`; supplier §2.2 prints `12 log 3` (squared norm) | conventions agree only with squared norm | R02 |
| §3.1 realisation | `y² = x³ − x`, `𝔮 = (2+i)` | `ψ(𝔮) = −1+2i` (`≡ 1 mod 2+2i`), `|ψ(𝔮)⁻¹| = 5^{−1/2}`; Kato lines 5385–5453, pp. 256–257 | agrees | R02 |
| §3.2 auxiliary factor | `ψ_E²χ₃` at `(7)`, `(41)`; `ψ_E²ε₅` | `49`, `1681` (factors 0, 0); with `ε₅`: `−49`, `1681` (98, 0) | Check false | R03 |
| §3.3 translate | `ξ = 1/5`, `α = 8/15` | `ν = −1/3`, `ξ − ν = 8/15`; Kato line 5490 prints `+ν_n` | README's sign is the consistent one | R02 |
| §4.2 TNC | `ζ_{ℚ(i)}(0) = −1/4`; `p = 13`, `K(√3)` | `v₂ = −2`; `4² ≡ 3 mod 13`, `η(𝔭) = 13 mod 3 = 1`, `z_{B,13} = 0`; one prime above 3 | one Check wrong | R05 |
| §4.3 regulator factor | `ℚ(i)`, `p = 3`, `η` mod (3), `a = (5)` | `ζ_{ℚ(ζ₁₂)}^*(0) = −R/12`, `L′(η,0) = R/3`; `r_B(e_D) = (25−1)R/6 = 4R` (numerics above) | identity `e_D = (N−η)z_B/2` agrees | R01 |
| §4.4–§4.5 at `p = 2` | `ℚ(i)`, `χ = 1`, `q = (2)` | bound for `aζ`: `ℓ(H²) ≤ ℓ(H¹/Jζ_B) − 1`; §4.5: `ℓ(H²) = ℓ(H¹/Jζ_B)` | contradiction | R01 |
| §4.5 twisted factor | `χ` mod (3), `a = (2+i)`, `(7)` | `5 − (−1) = 6`, `49 − 1 = 48`; untwisted `4`, `48` | agrees | none |
| §4.8 Rubin | `ℚ(√−7)`, `p = 2` | `−7 ≡ 1 mod 8` split; `μ(H) = μ₂` excludes 2 | agrees | R01 (classical form) |
| §5.1 Coleman | `p = 5`, `θ = cT`, `c³ = 1`; `g = (2+T)/ω(2)` | `Φ_θ g = g`, `D_θ log g = 1`, `5 = 5`; mass `1/2 − 1/2 = 0`, first moment `1/4 − 5/4 = −1`; Coleman lines 82, 513, 527 | agrees | R04 |
| §5.1 Tor | `C = A/(S−a, T−b)`, `B = A/(T−b)` | `C⊗B = Tor₁ = B/(S−a)`, length 1 each | agrees | none |
| §5.3–§5.5 | `y² = x³ − x`, `p = 5`; `ι(T)` | `#E(𝔽₅) = 8`, `a₅ = −2`; `((6−2i)/5)² = (32−24i)/25`; `ι(T) = −T(1+T)⁻¹` | agrees | none |
| §6.2 Euler factors | norm `f′ → f` on `z`; trivial component | `z_{f′} ↦ ∏(1 − Frob⁻¹) z_f`; `1 − γ⁻¹` has augmentation 0 | corrected form consistent; BT line 153 omits factors | none |
| §7.3 comparison map | Kato (15.12.1), line 5679, p. 263 | source `H¹_{p∞f}(T)`, target `H¹(T̃)`; `O_λ[[G_{p∞f}]]`-linear | agrees | none |
| §7.5 descent | Kato Lemma 15.13, lines 5704–5730, p. 264 | hypotheses: `K ⊄ ℚ(ζ_{p^∞})`, `f` conductor, 2 and `#Δ` invertible in `κ(𝔭)`; `σ` acts by `σ⁻¹` | agrees | none |
| §7.6 contained case | `(K,p)`: `(ℚ(i),2)`, `(ℚ(√−3),3)`, `(ℚ(√−7),7)`, `(ℚ(i),5)` | `p^* = −3, −7`; `5^* = 5`; `ζ₈ + ζ₈³ = i√2`; Kato line 5731 | agrees | none |
| §7.7 length lemma | `A = ℤ_p[[T]]`: `M = A/(T)`, `A/(p)`, `a = p` | `[𝔽_p] − 0 = 1·[A/(T,p)]`; hypothesis fails for `A/(p)`; Kato lines 4912–4925, pp. 243–244 | agrees | none |
| §7.8 generator | `y² = x³ − 25x` | `(25/4)³ − 25·25/4 = 5625/64 = (75/8)²` | agrees | none |
| §7.9 lattice inequality | condition (b) | `p ∤ #μ(H)` forces `p ≠ 2`, so Lemma 15.13's residue hypothesis holds; Kato line 5762, p. 265 | agrees | none |
| §8.2 reciprocity | `L_{pf}(ψ̄, χ∘N)` vs `L_{{p}}(f^*, χ)` | at `𝔩 ∣ f`: `ψ̄` ramified, factor 1 both sides; Kato lines 5686–5700, p. 263 | agrees | none |
| §8.5 descent to equality | `M₁ = M₂ = A/(y)`, `a = x` | `ℓ(H²(T̃)) = ℓ(M₁/a) = ℓ(M₂/a) + ℓ(M₁[a]) = ℓ(H¹(T̃)/Z)`; `a⁻¹A ∩ A_{(a)} = A` | agrees | none |
| §8.6 endpoint | 32.2.a.a (`4·8`), 27.2.a.a (`3·9`) | levels 32, 27; contained cases via §7.6 | agrees (rational form only) | none |

- Source locators checked against the text: 41 (Kato 22, JLK 12, BT 5, Coleman79 2); all 15 seeded targets.
- Library declarations opened at the pins: `Module.length` (`Mathlib/RingTheory/Length.lean:31`, Krull dimension of the submodule lattice, `ℕ∞`), `logEmbedding_eq_zero_iff` (`…/Units/DirichletTheorem.lean:113`), `regulator_ne_zero` (`…/Units/Regulator.lean:290`), `rayClassArtinEquiv` (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:209`), `Newform` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`), `completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`).
- Cross-roadmap citations resolved at main or the open heads: 90 section headings in 28 roadmaps; none missing.
- Gate: every check passes. Dependency check: `depcheck: 238 roadmaps, 2162 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: no output (no declaration, no warning). All ten headline groups are named in the module docstring with the missing carrier; none is statable at the pins; no padding to probe.
- Declared gap `gap:height-one-explicit-reciprocity` (PadicHodgeRegulators §1.4) has no `What PadicHodgeRegulators must provide` line in the README; §3.3 states the formula as its own target instead (see R02, where it becomes a citation of NonordinaryCMSpecialValues §2.5).
- The sentence mapping CZ.4–CZ.6 to Layers 6–8 matches CMRankZeroConverse `README.md` lines 11, 121, 386.
- Overlap check: read KatoEulerSystems, NonordinaryCMSpecialValues, AutomorphicCongruences, ModularIwasawaMainConjectures, CMRankZeroConverse; Kato's theta function, elliptic units, zeta element, CM realisation and reciprocity law are shared with NonordinaryCMSpecialValues, which owns them (R02); nothing else shared.
- Source independence: 11 passages compared with 3 sources, none shared beyond formulas and hypothesis lists; largest share Kato, 44 of 131 locators; contents compared with Kato §§3, 8, 14, 15: independent (15.6 and 15.11 are each split across two layers, 14.15 sits in Layer 7, Layers 4–6 have no counterpart).

## Not verifiable

- InertAnticyclotomicCMMainConjecture (README line 32): no roadmap of that name on main or in an open pull request; the deferral was not read.
- Which dyadic normalisation of the Tamagawa lattice is true (R01): not computed; only the inconsistency is.
- Rubin91, CGLS, Kriz, HuberKings, Schutt09 locators: outside the sample, not checked.
- Yager, Chapter 3, (7): label not located in the extraction; (10) is at Yager line 539.
- Ownership against the 232 open pull requests without checked-out files: searched by `roadmaps grep` for elliptic units only.

## Source issues

- **Error** in Kato at (15.5.1), p. 253, and (15.6.5), p. 255: the source states Kronecker's formula without fixing the absolute value; it should use `|u| = u·ū`, the ordinary value giving half the right side; affects a stated result.
- **Error** in JLK at Proposition 3.3(4), pp. 14–15, and Theorem 3.9(a), p. 17: the source states the formula with the ordinary complex norm; it should carry a factor 1/2 (or the squared norm), as `4R ≠ 8R` at conductor (3); affects a stated result.
- **Error** in Kato at (15.4.2), p. 252: the source says the norm along any isogeny of CM curves preserves the theta function; it should require an `O_K`-linear isogeny whose kernel meets `E[a]` trivially; affects a stated result.
- **Misprint** in Kato at the proof of Proposition 15.9, p. 258: the source translates by `+ν_n`; it should be `−ν_n`, so that `θ_n(ξ_n)` is the theta value at `α_n`; affects nothing.
- **Misprint** in Kato at the proof of Proposition 15.17, p. 265: the source applies Lemma 14.12; it should be Lemma 14.15; affects nothing.
- **Error** in BT at Theorem 2.1, p. 4: the source equates `ξ(h²_ℚ)` and `ξ((h¹/z)_ℚ)` for every `f`; it should include the factors `ξ(ℤ_p[[G/D_𝔩]]_ℚ)` for `𝔩 ∣ f`, `𝔩 ∤ p`; affects a stated result.
- **Gap** in Kato at Theorem 15.2(2), p. 251: the source quotes Rubin's equality for the level-`p^n f` unit module; it should restrict to components ramified at every `𝔩 ∣ f` or add the Euler factors; affects a stated result.

## For the human reviewers

- **Licence.** Yager is an unpublished PhD thesis read from the ANU repository (README line 1021); it is a cited source for §§5.1–5.2.
- **Licence.** BT is cited as Annals of Mathematics 203 (2026) but read as arXiv:2506.03465v2 (README line 1014); agreement of numbering with the published version was not checked.
- **Not tested.** R01 turns on the 2-adic normalisation in JLK's Theorem 5.2; the review's numerics contradict JLK Proposition 3.3(4) as printed (JLK lines 617–620).
