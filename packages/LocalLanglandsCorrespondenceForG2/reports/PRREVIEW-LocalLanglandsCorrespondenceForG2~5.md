# Review of LocalLanglandsCorrespondenceForG2 (pull request #2458 at 88decde)

**Verdict:** needs changes

## R01 (P2) — Xu's packets are not defined over unbounded parameters, where §§10.8–10.9 use them

**Location:** `TauCetiRoadmap/LocalLanglandsCorrespondenceForG2/README.md` line 1237 (§10.8): "constancy on each of Xu's tempered induced packets and on each of Xu's nontempered Langlands-quotient packets"; line 1247 (§10.9): "every fibre of L_w is a union of Xu packets".

**Claim:** §10.9 is stated on all of Irr(PGSp₆(F)). Neither this README nor the cited supplier defines a Xu packet over an unbounded parameter outside Φ⁺_unit, so the statement has no meaning for the nontempered representations it covers. The passage is unchanged since 038ac84.

**Witness:** σ = the trivial representation of PGSp₆(F): exponents ±3, ±2, ±1 (§2.0, Checks). ModularityAndLanglandsExtensions §3.19 at its open head (its README lines 2089–2095) defines the packets for bounded φ and extends them to Φ⁺_unit only.

**Repair:** In §10.8, before "prove that", add: "For a parameter φ♭ of Sp₆ (§2.0) that is not bounded, with Langlands data M ≅ GL_(n₁) × ⋯ × GL_(n_r) × Sp_(2n₀), ν₁ > ⋯ > ν_r > 0, φ₁, …, φ_r, φ₀, define a Xu packet over φ♭ as the set of Langlands quotients of the normalized inductions, from the standard parabolic subgroup of PGSp₆ whose Levi subgroup is the image of GL_(n₁) × ⋯ × GL_(n_r) × GSp_(2n₀), of rec⁻¹(φ₁)|det|^(ν₁) ⊗ ⋯ ⊗ rec⁻¹(φ_r)|det|^(ν_r) ⊗ τ̃₀, τ̃₀ running over one of Xu's packets of GSp_(2n₀)(F) over φ₀ (ModularityAndLanglandsExtensions §3.19, n₀ ≤ 2; one character when n₀ = 0) whose central character makes the tensor product trivial on the centre. Prove that these sets partition the representations whose restriction has parameter φ♭ and are permuted transitively by the quadratic twists." Add the Check: "over the parameter of the trivial representation the packets are the singletons {χ ∘ sim}, χ quadratic, and L_w(χ ∘ sim) = χ · L_w(1)." On the witness: r = 3, n₀ = 0, the central condition gives τ̃₀ = |·|⁻³χ with χ² = 1, and the Langlands quotient is χ ∘ sim.

## R02 (P3) — §9.1 transfers a lift on PGL₂(D) "by Jacquet–Langlands" where only the inner-form parameter is available

**Location:** `TauCetiRoadmap/LocalLanglandsCorrespondenceForG2/README.md` line 1103 (§9.1): "where τ is the lift to PGL₄ or PGL₂(D), transferred to PGL₄ by Jacquet–Langlands"; *Needs* lines 1115, 1119 and 1196 cite §§4.7a, 10.30 only.

**Claim:** The lift to PGL₂(D) need not be essentially square-integrable, and §4.7a transfers only such representations. The parameter is the inner-form parameter of §10.31, as the pgsp6-lower-tower-parameters contract (line 94) already says; §§9.1, 9.2 and 10.4 do not cite it. The passage is unchanged since 038ac84.

**Witness:** EndoscopicTransferAndUnitaryTraceComparison at its open head: §4.7a (its README line 1873) is for essentially square-integrable representations; §10.31 (line 4225) defines the parameter from standard data and asserts no general Jacquet–Langlands identity. Instance: the irreducible induction of χ₁ ∘ Nrd ⊗ χ₂ ∘ Nrd on GL₂(D).

**Repair:** In §9.1 replace the clause by: "where τ is a constituent on PGL₄(F), respectively PGL₂(D), of the lower-tower lift and φ_τ is rec(τ) (§10.30), respectively the inner-form parameter of τ (§10.31), determined up to φ_τ ↔ φ_τ∨". In §10.4 replace "(with the reduced norm on GL₂(D) before Jacquet–Langlands)" by "(on PGL₂(D) the twist by χ ∘ Nrd multiplies the inner-form parameter by χ, block by block, by §4.7a)". Add EndoscopicTransferAndUnitaryTraceComparison §10.31 to the *Needs* of §§9.1, 9.2 and 10.4 and to the Dependencies of Layers 9 and 10 (lines 1154, 1262). On the instance: φ_τ = χ₁ ⊠ S₂ ⊕ χ₂ ⊠ S₂, of dimension 4 and determinant (χ₁χ₂)² = 1, and the twist gives χχ₁ ⊠ S₂ ⊕ χχ₂ ⊠ S₂.

## R03 (P3) — The new central-character contract is not declared in plan.json

**Location:** `TauCetiRoadmap/LocalLanglandsCorrespondenceForG2/README.md` line 78: "What ModularityAndLanglandsExtensions must provide (gap:symplectic-packets-central-character)".

**Claim:** A contract counts as declared when the plan's `gaps` list has the same slug. The README states 29 contracts; `design/plan.json` of this package has 27 slugs, and this one is absent (the other absent slug is D01).

**Witness:** `design/plan.json`: no occurrence of `symplectic-packets-central-character`. README slugs minus plan slugs = {pgsp6-lower-tower-xu-packets, symplectic-packets-central-character}.

**Repair:** No change in this folder. Add to the `gaps` list of the board's `design/plan.json` of this package: slug `symplectic-packets-central-character`, supplier ModularityAndLanglandsExtensions, section "Layer 3, §3.15", needs = the sentence of README line 78.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — not repaired: line 1237 still reads "constancy on each of Xu's tempered induced packets and on each of Xu's nontempered Langlands-quotient packets", with no definition over unbounded parameters. Written again as R01.
- R02 — not repaired: line 1103 still reads "where τ is the lift to PGL₄ or PGL₂(D), transferred to PGL₄ by Jacquet–Langlands"; §10.31 is not cited in §§9.1, 9.2, 10.4. Written again as R02.

## Verified sound

| Statement | Instances tried | Values computed | Other side | Result |
| --- | --- | --- | --- | --- |
| Contract symplectic-packets-central-character (line 78) | n = 1: St of SL₂; principal series from χ with χ(−1) = −1 | Sym² lifts to SL₂ = Spin₃ (through S₂), St(−1) = 1. χ ⊕ 1 ⊕ χ⁻¹ lifts only if χ = μ², impossible; central value −1 | GS p. 22 (GS line 926), p. 21 (GS line 900), p. 39 (GS line 1638); supplier §§3.15, 3.19 do not state it | holds; R03 for its declaration |
| §6.1, new clause | φ trivial on SL₂ | q ∘ i ∘ φ lifts to i ∘ φ, so σ₀(−1) = 1 and σ₀ lives on the image of Sp₆(F) in PGSp₆(F) | GS proof of Proposition 6.1, p. 21 (GS lines 897–902) | holds |
| §10.5, route | [φ̃] principal; σ with σ ⊗ χ ∘ sim ≅ σ | q ∘ φ̃ = Sym⁶ lifts, St_Sp₆(−1) = 1; self-twist: restriction reducible, constituent does not extend | GS proof of Theorem 12.7(i), p. 39 (GS lines 1635–1641) | holds |
| §1.1, definition of L²_e | trivial representation; V ⊕ V; ε_v at a split place; e ↦ h(e) | Period of 1 = volume ≠ 0. Copy (av, bv) has period (a + b)P₀(v): zero iff b = −a. ε_v: trivial on H(k) (3[D] ≠ 0 in Br), −1 on the trace-form adjoint, integral 0. f(h x h⁻¹) = f(x h⁻¹) | GF proof of Lemma 2.5, pp. 8–9 (GF lines 327–342): Aut(e ↪ D), H(k_v) = PGL₃ ⋊ ℤ/2 | holds; three Checks, each discriminating |
| §1.3(c), restated setting | v ∈ S | D_v division, H(k_v) = PD_v× compact, H_e(k_v) = e_v×/k_v×; same D, H, e, H_e as §1.1 | poincare-weak-containment contract (line 119), third instance | consistent |
| §§10.8–10.9 | trivial representation of PGSp₆(F) | Exponents ±3, ±2, ±1, outside Φ⁺_unit; the representations over φ♭ are the χ ∘ sim | ModularityAndLanglandsExtensions §3.19: bounded φ and Φ⁺_unit | R01 |
| §9.1, §10.4 | χ₁ ∘ Nrd × χ₂ ∘ Nrd on GL₂(D) | Not essentially square-integrable: no transfer under §4.7a; inner-form parameter χ₁ ⊠ S₂ ⊕ χ₂ ⊠ S₂, dimension 4 | EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.31 | R02 |

The rows for the untouched statements stand as in the previous review, of `038ac84`.

- Incremental re-review of the 31 lines changed since `038ac84` (README lines 23, 78, 119, 352–364, 384, 922, 1009, 1206, 1262); `Suggested.lean` is unchanged.
- Source locators checked against the text: 4 (GS §7 p. 22; GS proof of Proposition 6.1 p. 21; GS proof of Theorem 12.7(i) p. 39; GF proof of Lemma 2.5 pp. 8–9). All on the stated pages. No sampled target has changed text.
- Cross-roadmap citations resolved at the open heads: ModularityAndLanglandsExtensions §§3.15, 3.19 (its README lines 2023, 2089), EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.31 (lines 1873, 4225). The supplier does not already state the central-character property: the contract asks for nothing provided.
- The section title of §1.1 changed; no other roadmap, open or on main, cites it. The three references to L²_e (lines 119, 384, 364) point to §1.1.
- Gate at 88decde: every check passes. Nothing is changed outside the folder. Dependency check: `depcheck: 261 roadmaps, 2598 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: three `declaration uses sorry` warnings (lines 124, 143, 158), no error.
- Pull request text against the head: no sentence is contradicted; the change adds no supplier, removes no section and no declaration.
- Declared gaps: 29 contracts in the README, 27 slugs in `design/plan.json`; the difference is D01 and R03.

Overlap check: read ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, ModularityAndLanglandsExtensions, TwistedAutomorphicDescents, GanGrossPrasadUnitaryGroups, AutomorphicFormsOnReductiveGroups, SpinRepresentations; nothing shared (as in the previous review; the change adds a contract on ModularityAndLanglandsExtensions and a definition, L²_e, that no other roadmap states).

Source independence: changed passages only; 5 passages compared with 2 sources (GS, GF), none shared; largest share GS, about 119 of 189 locators; no layer added, removed or reordered, so the contents comparison with GS stands: independent.

Research link: The roadmap formalizes the local Langlands correspondence for G₂ of Gan–Savin (2023), with the gamma-factor characterization of Gan–Savin (2023), the exceptional theta correspondences of Gan–Savin (2021), Chenevier–Gan's unacceptability of Spin₇ (2023), Kret–Shin (2023) and Harris–Khare–Thorne (2019); README summary and sources GS, GF, HD, CG, KS, HKT.

## Not verifiable

- Griess, Theorem 1 (§0.0 and `griess_conjugacy`): recorded as uncertified (paywalled); the text was not read.
- SpV, Theorems 1.7.1 and 1.8.1 and §1.5 (§1.1(i)–(iii)): recorded as uncertified (Springer monograph); the text was not read.

## Source issues

- none

## For the human reviewers

- Griess (Theorem 1) and SpV (Theorems 1.7.1, 1.8.1, §1.5) are cited by locator only (manifest: uncertified). `griess_conjugacy` (`Suggested.lean` line 124) and README §1.1(i) rest on texts this review did not read.
