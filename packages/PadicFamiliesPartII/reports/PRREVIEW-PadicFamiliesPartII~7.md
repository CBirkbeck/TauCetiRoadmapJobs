# Review of PadicFamiliesPartII (pull request #2280 at c64e881)

**Verdict:** needs changes

## R01 (P2) — The descent between G and G₁ is stated in the wrong direction, and the hypothesis on Δ is attached to the wrong group

**Location:** `TauCetiRoadmap/PadicFamiliesPartII/README.md:613`: "For descent to the common-similitude group G, the order of the finite unit/deck quotient Δ is prime to p; statements for `G₁` do not need this." Also `:636` ("For descent from `G₁` to G") and `:1579`.

**Claim:** The PEL moduli spaces are those of G; the spaces `X_{G₁,…}`, on which every target of Layers 4–6 is stated, are their quotients by Δ. The Δ-invariants, and with them `p ∤ |Δ|`, concern the statements for `G₁`, not those for G.

**Witness:** BCGP21 lines 2032–2037, 3777–3779, 4842–4849: the moduli are G's and `X^{G₁}` is the quotient; Proposition 3.8.3 (line 2765) splits `RΓ(X^{G₁}) → RΓ(X)`. For `Δ = ℤ/p`, `O·N ⊕ I_Δ` has index p in `O[Δ]`.

**Repair:** Replace the sentence at `:613` by: "The moduli problem of gap:hilbert-siegel-models is that of the subgroup G of `G₁` of elements with similitude in `𝔾_m`; the spaces `X_{G₁,…}` are the quotients of its moduli spaces by the finite group Δ through which the totally positive prime-to-p units act on the polarization, and the coefficient sheaves descend to them (BCGP21 §3.7.2, pp. 55–56; §4.4.2, p. 99). A statement proved on the moduli spaces passes to `X_{G₁,…}` as the direct factor of Δ-invariants (BCGP21 Proposition 3.8.3, p. 57), which requires `p ∤ |Δ|`; this is assumed for the statements on `X_{G₁,…}`. Statements on the moduli spaces of G do not need it." At `:636` write "For descent from the moduli spaces of G to `G₁`". At `:1579` write "§4.2 keeps that hypothesis for the quotient spaces of `G₁`". A target on `X_{G₁,…}` meant to hold when `p | |Δ|` needs its own route through `RΓ(X_{G₁}) = RΓ(Δ, RΓ(X))`, stated at that target.

## R02 (P2) — The description of HigherHidaAndColemanTheory §9.6, item 4, is no longer what that section says

**Location:** `README.md:7`: "HigherHidaAndColemanTheory §9.6, item 4, words it with `p^{−k−1}U` on the last term, the printed reading of P20 Proposition 13.3.3.1". Also `:120`, `:964` and `:1574` ("keeps the printed wording").

**Claim:** The supplier states the corrected identity, so the four sentences are false, and "The intertwining from which those ranges follow is not imported" leaves the case `F = ℚ`, `I = {p}` of §5.7 with two owners.

**Witness:** `TauCetiRoadmap/HigherHidaAndColemanTheory/README.md:1652` at the head of pull request #2342 (b82e0be): "d1∘U=p^(k+1)U∘d1", with `p^(k+1)U` on the last term and slopes `≥ k−2`, `≥ k+1`.

**Repair:** At `:7` replace the last three sentences by: "The intertwining from which those ranges follow, `d₁ ∘ U = p^{k+1} U ∘ d₁` with U normalized alike on both terms, is HigherHidaAndColemanTheory §9.6, item 4 (AIP15 Proposition 7.2.3, p. 34); §5.7 states it at each place of the Hilbert setting (`p > 2`), and its case `F = ℚ`, `I = {p}` is that item." At `:120` replace the last sentence by "The intertwining of the differential with U is item 4 of §9.6; §5.7 is its Hilbert form." At `:964` write "The exponent `−k − 1`, the printed reading of P20 Proposition 13.3.3.1, would give …". At `:1574` delete "HigherHidaAndColemanTheory §9.6, item 4, keeps the printed wording; no target of this roadmap uses §9.6 (supplier contract)."

## R03 (P2) — The cuspidal clause of §§2.8–2.9 has no source and no route

**Location:** `README.md:496`: "a cuspidal f gives a cuspidal form (BPS Theorem 5.3.1, HAL p. 31)". Also `:483`, and the Check at `:506` ("preserves vanishing along −D").

**Claim:** BPS states nothing about cusp forms; "cuspidal overconvergent form" is not defined in Layer 2; in dimension greater than one the route continues on the open variety and then applies Koecher, which gives no vanishing on boundary components outside the multiplicative tube. Analytification alone does not give it.

**Witness:** BPS lines 1331–1337: the conclusion is membership in `H⁰(X_Iw × Spec K, ω^κ)`; the words for cusp forms do not occur in BPS. On `X₀(p)`, `E_k(z) − E_k(pz)` (slope `k − 1`) vanishes at ∞ and not at 0.

**Repair:** Either delete the clause at `:483` and `:496` and the Check at `:506`; or make it a statement of its own after the locator: "If moreover f is a section of `ω^κ(−D)` over a strict neighbourhood of the closure of `X_Iw(0)` in the rigid toroidal compactification, the classical form lies in `H⁰(ω^κ(−D))`", with its route (the continuation of §§2.2–2.7 run for `ω^κ(−D)` on the compactification, as §2.8 does on the compactified curve, the correspondences preserving the boundary ideal by ShimuraCompactifications §4.3) and its *Needs*, and replace the Check by the `X₀(p)` example: the slope bound, not analytification, excludes `E_k(z) − E_k(pz)`.

## R04 (P3) — Scope names supplier sections that no contract and no *Needs* line uses

**Location:** `README.md:15`: "AutomorphicBundles §§3.3, 5.3, 5.4, 11.16, 12.1, 12.11, 12.15"; "HodgeTateAndCanonicalSubgroups §§0.6–0.8, 0.14–0.16, 0.28, 3.6, 5.1, 5.5, 5.8"; "7.16–7.26"; "AutomorphicFormsOnReductiveGroups §§6.4–6.6".

**Claim:** The contracts no longer list AutomorphicBundles §3.3 and §12.15, HodgeTateAndCanonicalSubgroups §3.6, ShimuraCompactifications §§7.17–7.18, 7.23–7.24, 7.26 or AutomorphicFormsOnReductiveGroups §6.4; Scope still does, and §12.15 (Fourier–Jacobi expansions) is not among "coefficients, traces and Hecke operators".

**Witness:** `README.md:141–146`, `:160–166`, `:174–178`, `:211–213` and the nine `### Dependencies` lists: none of these sections occurs outside line 15.

**Repair:** In line 15 write "AutomorphicBundles §§5.3, 5.4, 11.16, 12.1, 12.11", "HodgeTateAndCanonicalSubgroups §§0.6–0.8, 0.14–0.16, 0.28, 5.1, 5.5, 5.8", "ShimuraCompactifications §§4.1, 4.3, 4.10, 6.12, 6.16–6.17, 7.16, 7.19–7.22, 7.25" and "AutomorphicFormsOnReductiveGroups §§6.5–6.6".

## R05 (P3) — The pull request description names a supplier the README no longer cites

**Location:** description of pull request #2280: "On main: AdicSpacesPartIII, SchemeAndStackFoundations, SmoothRepresentationsOfLocalGroups, PadicMeasuresIwasawaAlgebras and LieHighestWeight."

**Claim:** The head cites no roadmap LieHighestWeight: the enveloping algebra is Mathlib's and the Verma modules are Tau Ceti's.

**Witness:** `README.md:104` (`UniversalEnvelopingAlgebra`), `:108` (`TauCeti.VermaModule`); the string "LieHighestWeight" does not occur in the README at c64e881.

**Repair:** "On main: AdicSpacesPartIII, SchemeAndStackFoundations, SmoothRepresentationsOfLocalGroups and PadicMeasuresIwasawaAlgebras."

## R06 (P3) — Two page locators start one page late

**Location:** `README.md:656`: "BCGP21 §4.5, pp. 100–105"; `README.md:691`: "BCGP21 §4.2.30, Lemma 4.2.31, Proposition 4.2.33, p. 93".

**Claim:** §4.5 begins on p. 99 and §4.2.30 on p. 92.

**Witness:** BCGP21 line 4852 (page 99): heading of §4.5; BCGP21 line 4472 (page 92): heading of §4.2.30.

**Repair:** "BCGP21 §4.5, pp. 99–105" and "BCGP21 §4.2.30, pp. 92–93; Lemma 4.2.31 and Proposition 4.2.33, p. 93".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.2 normalized `U_i` | modular curve; Siegel threefold; type A `d=a=b=1` | `n = 1, 3, 1`; BPS line 635: `d·a·b`, `d·a(a+1)/2`; composite order matches line 633 | agrees | none |
| §2.1 slope region | `(n,c,s) = (3,4,0), (3,3,0), (3,4,1/2)`; CM datum | `ε < 1/4`; none; `ε < 1/8`; `J = ∅`; BPS line 1116 gives `c > s + n` | agrees | none |
| §2.8 dimension one | `Γ₀(3)` cusps | degrees 1 and 0; pullbacks `3 dz/z`, `dz/z`; BPS line 1353 leaves the boundary continuation undone | target owned here | R03 |
| §2.9 classicality | modular curve; `κ = (6,6)`, `(6,3)`; `E_k(z) − E_k(pz)` | `s < k−1`; `s < 3`; none; slope `k−1`, constant term at 0 is `a₀(p^{k/2} − p^{−k/2}) ≠ 0` | theorem agrees; cuspidal clause unsupported | R03 |
| §3.5 Euler characteristic | `Λ₁ → Λ₁` zero map; `p = 5` | `χ = 0`, cohomology of rank 1; 4 components; P20 line 4886 (p. 107) | agrees | none |
| Layer 4 standing hypotheses | `Δ = ℤ/p` on `𝔽_p[Δ]` | invariants `= 𝔽_p·N`, augmentation of N is `p = 0`, not a summand; BCGP21 line 2765 splits `X^{G₁} → X` | direction reversed | R01 |
| §4.2 universal coefficients | weight `(2,2)`; two places, `|I| = 1` | trivial character; dimension `1 + 2 = 3`; BCGP21 lines 4804–4821, 4829–4833 | agrees | R01 (line 636) |
| §4.3 commuting U | normalizations | `p^{−2}·p^{−1} = p^{−3}`; BCGP21 lines 4913, 4997, 5064; commutation line 5081 | agrees | R06 (page) |
| §4.5 amplitude | `I = ∅`; `F = ℚ`, `I = {p}` | `[0,0]`; `[0,1]`; hypotheses and (1)–(4) as BCGP21 lines 3752–3762 | agrees | R06 (page) |
| §§4.7–4.9 divisor traces | `p = 3`, `F = ℚ` | kernel orders `p^{4d−2}`, `p^{8d−4}`; degrees 27, 9, 81; A-exponents −8, 24, −26; `1 − p³` both ways | agrees | none |
| §4.10 quadratic relation | `(α, β) = (2,3)`; non-commuting matrices | `4 − 10 + 6 = 0`; entries 1 against 1/2; both orders counted: one subgroup each; source gives one order (line 6432) | agrees | none |
| §5.2 trace congruence | `p = 3`, `n = 0, 1`; two places | `4f − 3f = f ∉ 3A`; factor `p^{−5}`; `24T̃f`; `n²` against `(n−1)² + 1`: 4, 2; `k′_w ≥ 2p+3` | agrees with BCGP21 lines 5296–5305, 5439–5446, 5520–5524 | none |
| §5.3 derived control | `I = ∅`; `F = ℚ`, `I = {p}` | `[0,0]`; `[0,1]` = HigherHidaAndColemanTheory §9.8 (line 1688) | agrees | none |
| §5.7 BGG intertwining | eigenlines `θe = f`; gaps 2, 4 | `β = p^{−m}α`; twisted bounds `−3 + m`: 0, 2; AIP15 line 1520: `ΘU = p^{m}UΘ`; BCGP21 line 7420 twist `p^{m}` | identity agrees; supplier described wrongly | R02 |
| §5.9–§5.10 comparison | dimensions `(1,2),(1,1),(1,1)`; `l_v = 3` | `χ = −1, 0, 0`; `χ_s − χ_t = −a − b`; `0 < 0` false | agrees | none |
| §6.1–§6.4 doubling | `T = 5`, `U = 6`; `𝔽̄₃`, `(α,β) = (1,2)` | `C(2,3) = (28,−2)`; `C² − TC + U = 0` and inverse recomputed; `C² = 1`, `(C−1)(C−2) = 0`; `f = −ξg`, `U_Iw f = (u/ξ)f` | agrees | none |
| §7.1 BGG category | `GL₂`, `Q = G`, `λ = ε₁`, `det` | `ε₁(diag(1,−1)) = 1`, `det ↦ 0`; BCGP25 lines 2450–2474 | agrees | none |
| §7.1b, §7.2 | `𝔰𝔩₂` Verma; standard `𝔤𝔩₂`; `λ = 1/3` on `ℤ₃^×` | `e v_k = k(⟨λ,α^∨⟩−k+1)v_{k−1}`; `diag(2,1)`: 1, 4 against 2, 1/2; cubes mod 9 are 1, 8 | agrees | none |
| §7.7 boundary vanishing | reducible `χ₁ ⊕ χ₂ ⊕ ρ₂` | excluded; BCGP25 lines 4647–4662 | agrees | none |
| §7.8 four pieces | `λ = (1,1;2)`, `(1,1;−2)` | `−2,−2,−3,−3`; `0,0,−1,−1`; sum `−6 − 2w`; BCGP25 line 4802 | agrees | none |
| §8.2 Sen block | `w = 2`; Jordan block | `a = −2`; `N_a ≠ 0` with equal graded scalars; sub `Gr³`, quotient `Gr²` as BCGP25 line 4806 | agrees | none |
| §8.6 classicality | `U(−1) ⊕ U^∨(−2)`, `w = 0` | Sen values −1, −1, −2, −2, nilpotent part nonzero; hypotheses (1)–(4) of BCGP25 lines 5084–5091 all present | agrees | none |
| §9.1–§9.7 four modules | `ν = (0,−2)`; `p = 2, 3`; `z = 4·1` | weights `(5,3),(5,1),(2,−2),(0,−2)`; duals `(0,−2)`, `(2,−2)`; `r = 7, 11`: orders 3, 5; `[z²] − 1` regular | agrees with BCGP25 lines 7485–7527 | none |
| §9.4 Coleman specialization | M-dominant, not G-dominant | fibre is `H^{ℓ(w)}_w(…, ω^{κ,sm})^{ord,T(ℤ_p)}`, cuspidal for lengths 0, 1; BCGP25 lines 7507–7515 | agrees | none |

- The previous review, of `09d4352`, listed no finding; every passage was read again at this head.
- Source locators checked against the text: 61 (BPS 21, BCGP21 24, BCGP25 13, AIP15 3), covering the 15 sampled targets; 2 wrong pages (R06), 1 unsupported clause (R03).
- Library declarations opened at the pins: 12, each at the file and line the README gives (`Mathlib/Algebra/Module/LinearMap/End.lean:33` through `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/Isomorphism.lean:106`).
- Cross-roadmap citations resolved: 130 section headings in 27 suppliers, on main or at their open heads; 0 missing; statements read in 7 of them; 1 described wrongly (R02).
- Gate: every counter 0, build passed. `depcheck: 244 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- `lake env lean` on `Suggested.lean`: exit 0, no warning; 0 declarations, so no signature comparison and no one-tactic probe. The docstring names every end theorem of the Summary (§§2.8–2.9, 3.3, 3.5, 5.3, 5.10, 6.3, 7.5–7.8, 8.4–8.6, 9.2–9.7) with its missing carriers; none is statable at the pins.
- Declared gaps: 15 contracts in the README, each with supplier and section. The design's gaps `lci-fundamental-class`, `klingen-bgg-normalization` and `spherical-composite-hecke` have no contract here: the first is AlgebraicModuliForArithmeticGeometry §7.5, the second HigherHidaAndColemanTheory §9.6 (R02), the third §3.1 of this roadmap.
- AlgebraicModularFormsAndSerreWeightsPartII §7.5 states neither fan independence nor Hecke commutation of `C_r`, so §3.1 duplicates nothing.

Overlap check: read HigherHidaAndColemanTheory, AutomorphicBundlesPartII, GSp4NonregularModularityLifting, AlgebraicModularFormsAndSerreWeightsPartII and OverconvergentAutomorphicForms (no roadmap on main is listed as close). Shared: the Klingen BGG intertwining for `F = ℚ`, owner HigherHidaAndColemanTheory §9.6 (R02); `C_r`, owner AlgebraicModularFormsAndSerreWeightsPartII §7.5; general analytic coefficient sheaves, owner OverconvergentAutomorphicForms §8.6. GSp4NonregularModularityLifting is a consumer.

Source independence: 14 passages compared with 4 sources (BPS, BCGP21, BCGP25, AIP15), none shared beyond forced hypothesis lists; largest share BCGP21, 92 of 245 locators; contents compared with BCGP21: independent (its §§4, 5, 6 are split across Layers 4, 5, 6; the order of §§5.4–5.10 is forced by their *Needs* lines).

## Not verifiable

- The second repair of R03 in dimension greater than one: no source read carries the continuation onto toroidal compactifications.
- The README's Source issues for P20 (Corollary 14.6.2, Proposition 15.2.4.1) and for BCGP21 Lemma 4.6.16: outside the sample, not read again at this head.

## Source issues

- **Error** in BCGP21 at Lemma 3.8.5, p. 58: the source says the functions on a finite étale Galois cover split as the base functions plus the augmentation part, for every group; it should be assumed that the group order is invertible on the base; affects a stated result.
- **Misprint** in BCGP21 at §6.4, proof of Corollary 6.4.3, p. 154: the source says the second operator composed after the differential equals the power of p times the differential after the operator; it should be the reverse order, as in AIP15 Proposition 7.2.3 and the twist stated next; affects nothing.

## For the human reviewers

- **Scope.** Layers 7–9 rest on BCGP25, arXiv:2502.20645v1, with no journal reference: 90 of the 245 locators (`TauCetiRoadmap/PadicFamiliesPartII/README.md`, References). The other principal sources are published.
- **Licence.** P20 is read from an author PDF and BPS from the HAL deposit; their page conventions are in the References. No passage, table or figure is reused.
