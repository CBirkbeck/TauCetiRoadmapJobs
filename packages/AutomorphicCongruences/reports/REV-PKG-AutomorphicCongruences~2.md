<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/129#issuecomment-6393199016 -->
Review (codex) of b047dd3

Verdict: needs_changes

1. **F01** (P1) The torsion module is attached to the unreduced lattice

   **Location:** packages/AutomorphicCongruences/README.md:316, also :322: “N is the finite torsion R-module with ℒ(ρ) ≅ N ⊗_R (V ⊗_A R)”.

   **Claim:** The middle block of the stable lattice itself is a tensor product with a torsion module.

   **Witness:** Over a DVR, an unreduced rank-two lattice has generic rank 2; the proposed torsion tensor has generic rank 0. SU line 2012 reduces the lattice modulo I before line 2029 introduces N.

   **Exact repair:** Introduce separate notation for the lattice and its quotient by I, reduce every block map, and define N, N′ and the indicated subquotients on that quotient. Carry this distinction through the cocycle construction and API. With I = (ϖ), the repaired middle block is (R/ϖ)², correctly equal to N ⊗ R² for N = R/ϖ. The unreduced lattice remains rank two. SU lines 2038–2055 explicitly distinguish these objects.

2. **F02** (P1) The trace uses the wrong coefficient of the reciprocal polynomial

   **Location:** packages/AutomorphicCongruences/README.md:568: “−1 times the X^3-coefficient of the Hecke polynomial”.

   **Claim:** This recovers the rank-four trace under the package's det(1 − MX) convention.

   **Witness:** M = diag(1,2,3,4) gives 1 − 10X + 35X² − 50X³ + 24X⁴. The claimed trace is 50; the actual trace is 10.

   **Exact repair:** Use minus the coefficient of X, or explicitly reverse to det(XI − M) before using the cubic coefficient. Add this four-eigenvalue Check in every layer using the convention. The repaired reciprocal formula returns 10. Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:334 states the degree-one formula. SU line 3954 contains the same source slip; copying that slip does not make the target true.

3. **F03** (P1) The full ordinary Igusa tower is not a torus torsor

   **Location:** packages/AutomorphicCongruences/README.md:95: “the Igusa tower … as a pro-étale torsor under the p-adic torus”; matching gap in design/plan.json.

   **Claim:** The full ordinary tower for GU(2,2) has the torus as structure group.

   **Witness:** At p = 3 and level p, SU's fibre has size |GL₂(𝔽₃)|² = 2304; the diagonal torus has size 16. SU lines 3200–3205 specify the former group.

   **Exact repair:** State the correct Levi/automorphism-group torsor, then separately specify the unipotent invariants or quotient used to define forms and the torus acting on weights. Synchronize the existing gap's needs sentence in the README and plan. The corrected finite-level fibre is 2304, and elementary upper/lower unipotents need not commute. IgusaVarietiesAndTorsionConcentration §IG.1.1 also uses an automorphism group, not an unconditional torus.

4. **F04** (P2) Corank-one forms are called all forms

   **Location:** packages/AutomorphicCongruences/README.md:399 and :411: “q = 1 for all forms”; also §§1.2 and 1.6.

   **Claim:** SU's q = 1 module is the full space of forms and its boundary sequence controls that full space.

   **Witness:** For GU(2,2), I¹ still vanishes on genus-zero boundary strata. A full form with constant coefficient 1 there is excluded. SU lines 2775–2782 and 3237–3239 define this restriction.

   **Exact repair:** Call the space forms of boundary corank at most one, with its precise boundary ideal, and use its Hecke algebra and control theorem consistently. Distinguish this from any genuinely full Hecke algebra. Add the genus-zero constant-term Check: it is 0 in this module and 1 for the excluded full form. Preserve any separately promised full-space construction as a separate, supported target.

5. **F05** (P2) The Skinner–Urban layer omits the odd-prime hypothesis

   **Location:** packages/AutomorphicCongruences/README.md:399–401: “Γ_2 = (1 + pℤ_p)^4”; the hypothesis paragraph only requires splitting and neatness.

   **Claim:** The stated weight-algebra and control setup includes p = 2.

   **Witness:** In 1 + 2ℤ₂, −1 has order two. Thus ([−1] − 1)([−1] + 1) = 0 in its completed group ring, with both factors nonzero; μ_(p−1) removes nothing.

   **Exact repair:** Explicitly carry SU's odd-prime standing hypothesis into §§1.1–1.11 and the corresponding contracts. This is the source's generality, not a good-prime shortcut. At p = 3, 1 + 3ℤ₃ is torsion-free and the offending order-two element is absent. If a separate p = 2 theory is intended, it needs its own weight components and control statement; the displayed p-odd formulas cannot silently cover it.

6. **F06** (P1) The corrected local endomorphism hypothesis is lost downstream

   **Location:** packages/AutomorphicCongruences/README.md:1274: “FW's version … works under Assumptions 2.1 and 3.5”; also :1324 and §§4.3–4.5.

   **Claim:** The cited envelope-removal route constructs the FW zeta morphism for this entire class without N3.

   **Witness:** At p = 5, two distinct unramified characters with Frobenius values 1 and 2 satisfy the stated ratio exclusions, but End(ρ̄_p) = 𝔽₅ × 𝔽₅, not 𝔽₅.

   **Exact repair:** Retain N3 on the branch using PadicLocalLanglandsForGL2Qp §§5.8–5.9 and CompletedCohomologyAndLocalGlobalCompatibility §4.7. Supply a named construction/comparison or a precise supplier gap for the split and non-absolutely-irreducible local cases needed by the full FW endpoint. Do not merely narrow that endpoint. The witness then enters the additional branch and is excluded from envelope cancellation under End = 𝔽. The README already acknowledges this distinction at :1119; it must reach every consumer. FW lines 928–929 do not justify the missing implication.

7. **F07** (P1) Hilbert coprimality consumes an imaginary-quadratic-only contract

   **Location:** packages/AutomorphicCongruences/README.md:1657–1663, §5.5: the general CM coefficient argument uses “gap:katz-cm-padic-l”.

   **Claim:** This supplies the auxiliary CM Hecke-character nonvanishing and CM-family congruence input over general M/F.

   **Witness:** At p = 23, F = ℚ(√29), M = Fℚ(√−7) has two CM embeddings in its CM type, whereas the named gap at :111 only covers imaginary quadratic K/ℚ. Wan-2015 lines 4038–4068 use the former setting.

   **Exact repair:** Add a precise general-CM contract on the earliest appropriate supplier, with the infinity types, local conductors, unit L-value and CM-family congruence hypotheses actually used in Wan's proof. Alternatively own and state that extension here, without duplicating the imaginary-quadratic case. Register any new slug in both required places. Here 29 ≡ 11² and −7 ≡ 4² modulo 23, so the split-p requirement holds. Test the repaired interface on this degree-four M; a K/ℚ-only function cannot fill it. Keep Wan's totally real scope.

8. **F08** (P2) The Katz nonvanishing contract drops necessary hypotheses

   **Location:** packages/AutomorphicCongruences/README.md:111: “the nonvanishing modulo p … for all but finitely many characters of ℓ-power conductor”.

   **Claim:** The stated field and prime assumptions suffice for Hsieh2012's nonvanishing conclusion.

   **Witness:** In the self-dual branch, root number −1 forces the central value to be 0. Hsieh2012 lines 82–92 require root number +1 and local μ = 0, explicitly identifying them as necessary.

   **Exact repair:** State the separate Theorem A and B branches, including their local μ, residual-self-duality, conductor, ramification and auxiliary-prime hypotheses, and match the auxiliary choices in the consuming targets. Synchronize the existing gap. The sign −1 test must be rejected, with value 0 rather than a unit; the +1 test still needs the other hypotheses. A theorem label alone does not supply the omitted quantifiers and conditions.

9. **F09** (P2) The integral BCS headline is narrowed to the available route

   **Location:** packages/AutomorphicCongruences/README.md:2114–2116 and :2142: “the unit condition … for each of the four twists”.

   **Claim:** The completed roadmap's integral BCS endpoint requires this additional unit condition.

   **Witness:** E: y² = x³ − 4x + 7, p = 5 satisfies the BCS image hypotheses, but its split-multiplicative Euler factor at 11 is 10/11, of valuation 1.

   **Exact repair:** Restore BCS Theorem 1.1.2(b)'s full (im) endpoint. Keep §7.7's weaker intermediate bound accurately stated, and obtain the missing integral, saturated Kato-to-Néron comparison through a precise supplier contract or a separately owned comparison. Do not assume the final divisibility as a substitute. The repaired headline must include this E. The full point-count, Tate-inertia and irreducibility verification appears below. BCS published lines 584–590 assert the integral bound under (im), without this extra restriction. KatoEulerSystems §7.4's existing r_E and imprimitive factors explain the missing interface, not a license to narrow the theorem.

10. **F10** (P3) The specialization “direction check” does not discriminate

   **Location:** packages/AutomorphicCongruences/README.md:225: “X = A/(T) ⊕ A/(T−p)”.

   **Claim:** This distinguishes the claimed characteristic-ideal containment from its reverse.

   **Witness:** With A = ℤ_p⟦T⟧ and T ↦ 0, the characteristic generator specializes to 0. The specialized module has positive rank, so its extended characteristic ideal is also 0. Both directions hold.

   **Exact repair:** Replace this direction test with M = A/(p,T): Ch_A(M) = A, while Ch_(A/(T))(M/TM) = (p), strictly contained in A. The reverse inclusion now fails. Keep the non-torsion example only as a test of the zero convention.

11. **F11** (P3) Several constructions still lack their API and three Checks

   **Location:** packages/AutomorphicCongruences/README.md:508, :527 and :833, §§1.5, 1.6 and 2.10.

   **Claim:** These introduce p-adic functions/families but meet the package's definition-interface requirements.

   **Witness:** Their Checks lists have respectively 2, 2 and 1 bullets; none has an API list. The sole §2.10 bullet merely says the construction is new in general weight.

   **Exact repair:** Add the construction API and at least three discriminating mathematical Checks per definition. For §1.6, test singular versus nonsingular β, zero versus nonzero reduction of the family, and full versus cuspidal eigencharacters. For §2.10, test the reparametrized weights: (k,m) = (2,0) gives (0,0,0;κ), while (4,1) gives (1,−1,−1;κ+1); also test the displayed nonunit-denominator exclusions. Keep these in the README, not Suggested.lean.

12. **F12** (P3) The Lean docstring points to obsolete headline sections

   **Location:** packages/AutomorphicCongruences/Suggested.lean:27: “README §3.6 and §§3.12–3.14”; also :30, :33 and :37.

   **Claim:** The module docstring identifies the current README's headline locations.

   **Witness:** Layer 3 ends at §3.10, Layer 6 at §6.6, and Layer 8 has only §8.1. §§3.12–3.14, 6.10, 8.9 and 8.10 do not exist.

   **Exact repair:** Use §§2.14 and 2.20–2.22; §§4.3 and 4.5; §5.10; and §§6.6, 7.9 and 7.10 for the corresponding four bullets. Each replacement is the actual heading carrying the named theorem. Add no stand-in declaration.

13. **F13** (P3) Hsieh2012's manifest locator names a nonexistent theorem

   **Location:** packages/AutomorphicCongruences/sources.toml:592: “Theorem C and its corollaries (arXiv 1208.4751)”.

   **Claim:** This is the primary locator for the cited nonvanishing result.

   **Witness:** Hsieh2012 line 82 states Theorem A; line 104 states Theorem B. The latter is proved as Corollary 6.5. This paper has no Theorem C.

   **Exact repair:** Correct this existing key's locator to Theorems A–B, pp. 2–3, and Corollary 6.5 as appropriate. Keep the same key and version; do not confuse it with Hsieh2014, which does have Theorem C. The reviewer has left the author's entry untouched.

14. **F14** (P2) The triple-product quotient lacks nonzero-pairing hypotheses

   **Location:** packages/AutomorphicCongruences/README.md:737: “divided by the three Petersson pairings”.

   **Claim:** The quotient formula is stated without restricting the chosen test vectors or requiring its denominator to be nonzero.

   **Witness:** Orthogonal nonzero vectors have pairing 0. Wan-2020 lines 4081–4085 explicitly handle vanishing pairings by choosing translates with nonzero pairings; that requirement is absent from the target's formula.

   **Exact repair:** State the identity without division for arbitrary permitted test tensors, then state the normalized quotient only when every global and local pairing used as a denominator is nonzero. State the same nonvanishing requirement on the chosen translated pairings. The orthogonal-vector test must enter only the identity without division, or a translated version whose pairing is nonzero. On the two-dimensional pairing model, ⟨e₁,e₂⟩ = 0, whereas translating e₂ to e₁ gives ⟨e₁,e₁⟩ = 1; division is legitimate only in the latter case. This is a missing-hypothesis finding, not a new request for the waived Ichino text.

There are 14 findings: five P1, five P2 and four P3. The dependency graph and Lean elaboration pass. The mathematical interfaces do not: reduction of a lattice is missing, a reciprocal-polynomial coefficient is wrong, and several supplier contracts or proof routes have incompatible scope. The integral BCS endpoint has also been narrowed below the cited theorem. These defects are repairable; this is not a recommendation to reject the roadmap's scope.

The review left README.md, Suggested.lean, metadata.toml and design/plan.json unchanged. The sources service added LZ14 and LZ16 under new keys; the 39 pre-existing manifest entries were retained. Source quotations below are locators or paraphrases, not copied passages.

## Previous findings, checked first

“Repaired” here concerns the particular earlier defect, not approval of every nearby statement. All changed mathematical passages received fresh probes below. The earlier review's narrative-only rows were not treated as computed evidence.

| Earlier finding | Status | Repaired passage in packages/AutomorphicCongruences/README.md, unless specified | Recheck |
|---|---|---|---|
| F01 nonexistent supplier | Repaired as a citation; replacement contract partly repaired | §1.1: “the ordinary Igusa tower with its p-adic forms is gap:unitary-ordinary-igusa” | No AutomorphicPadicLFunctions supplier remains. The replacement tower contract is false as written: R03. |
| F02 undeclared refinements | Repaired as registration; mathematical scope partly repaired | §Exact supplier contracts: “What PadicFamilies must provide (gap:katz-cm-padic-l)” | All twelve supplier slugs match plan.json and name an earlier supplier. R03, R07 and R08 concern their content, not their absence. |
| F03 Kato normalization | Partly repaired | §7.7: “(r_(E^χ)·L_(E^χ,N_χ)) ⊆ char” | This weaker bound agrees with the supplier. Propagating its unit restriction into the headline loses BCS's generality: R09. |
| F04 stand-in headline | Partly repaired | Suggested.lean: “None of them is statable at the pins, so the file states nothing.” | The stand-in is deleted. Several module-docstring section numbers are stale: R12. |
| F05 p = 3 envelope | Repaired | §3.7: “at p = 3 this uses PadicLocalLanglandsForGL2Qp §§5.8–5.9 and gap:paskunas-p3-freeness” | The supplier at its supplied head really says p ≥ 3 in §§5.8–5.9. The repair's reason is correct; the old p ≥ 5 objection is not re-raised. R06 concerns a different hypothesis, N3. |
| F06 finite ramification | Repaired | §Conventions: “unramified outside a finite set of places” | The finite set is repeated in §0.1 and its finite-generation API. The infinitely ramified square-zero character is now excluded. |
| F07 Lean padding | Repaired | Suggested.lean: “the file states nothing” | Zero definitions, theorems and examples remain. |
| F08 claimed undeclared Lean names | Repaired | §0.7 API statements are prose; e.g. “The extension classes are those of the automorphic family” | No own backticked API declaration is being promised without a Lean declaration. |
| F09 supplier section drift | Repaired for section existence | §Exact supplier contracts: “PadicLocalLanglandsForGL2Qp §5.5 … §5.7 … §5.8 … §5.9” | 177 cited section/layer headings were resolved afresh; the ledger below records their lines. Existence does not resolve R06–R07's scope defects. |
| F10 process wording | Repaired for the reported instances | §Scope: “This roadmap is consumed by ModularIwasawaMainConjectures” | The reported pull-request numbers, access-date narrative and “not yet upstream” wording are gone. |
| F11 Checks | Partly repaired | §1.11: “For the curve 11a1” and “a_7 = −2 is a 7-adic unit” | The revised point counts, splitting, local Euler value and quadratic-field Checks compute correctly. §0.3's claimed direction test still separates nothing: R10. |
| F12 undefined notation/local End | Partly repaired | §3.1: “End = 𝔽×𝔽” for the split example; §0.7: “N is the finite torsion R-module” | The local counterexample is correct but not propagated to the FW route (R06). Defining N without first reducing the lattice introduces R01. |
| F13 Ichino scope | Partly repaired | §2.4: “for a definite quaternion algebra D over ℚ” | The weight-dependent factor is retained, but the quotient needs nonzero pairings (R14). Ichino2008 remains waived; no independent certification of that inaccessible primary text is claimed. |
| F14 sources | Partly repaired | sources.toml: “id = "Hsieh2012"” | Legal cached texts and six settled statuses are present. Two missing primary works were added by the service. Hsieh2012's author-recorded locator is wrong: R13. |
| F15 Needs/API shape | Partly repaired | Every target ends in “*Needs:*” | All 92 targets have a Needs line and all nine layers have Examples and Dependencies. Some constructions still lack their API and three discriminating Checks: R11. |

The repair report's explanation that automorphic-endpoints and primitive-toric-mu are **consumer** gaps is correct. They must not be registered as this package's own supplier gaps. No settled “not actionable in this package” finding is re-raised.

## Verified sound

The following are bounded verification claims, not an acceptance of the targets affected by findings. The audit covered all 92 target sections, their API/Check paragraphs, conventions, twelve registered gaps, and supplier contracts. The computed probes below test equations, boundaries, quantifiers and interfaces; they do not purport to prove deep automorphic theorems by examples.

### Mechanical checks and headline inventory

- The requested dependency command returned exactly: `depcheck: 48 roadmaps, 559 edges, 0 problem(s)`. There was no UPWARD or CYCLE line.
- The requested `lake env lean` invocation on packages/AutomorphicCongruences/Suggested.lean, from the pinned content checkout, exited 0 with no messages or warnings. No TauCeti import needed building.
- Suggested.lean has one `import Mathlib`, the required namespace and module docstring, and zero declarations. There is no sorry'd data, set_option, admitted example, stand-in theorem or padding. The all-declaration `#check @name` comparison and one-tactic padding probe therefore have zero instances; no signature silently loses a binder.
- The README's endpoint headlines are §§1.10–1.11, 2.7–2.8, 2.14, 2.20–2.22, 4.3, 4.5, 5.10, 6.6 and 7.9–7.10; §8.1 aggregates earlier endpoints. The module docstring names these mathematically, but R12 corrects their references. The required Iwasawa Selmer, Hida-family, universal deformation/zeta and normalized p-adic L-function carriers are not supplied by the pins. Native matrices, completed group rings or continuous H¹ alone do not make these headlines statable through a few simple definitions. No missing statable endpoint was identified.
- All 92 target Needs lines and nine Examples/Dependencies endings were read. The scope separates general cohomology, deformation, determinant and characteristic-divisor inputs from the source-specific comparisons owned here. No computational algorithm or copied source passage was found. Main-branch PadicMeasuresIwasawaAlgebras and ProfiniteCohomology were read as shape comparisons.

### Seeded source verification

Page numbers in this table refer to the version actually identified in the README/source manifest; BCS's published numbering is distinguished from v2. All fifteen seeded targets were checked against their source text, including hypotheses and direction.

| Target | Text opened and locator | Result |
|---|---|---|
| 0.3 | SU lines 869–924, Proposition 3.2.8, Corollaries 3.2.9 and 3.2.11, pp. 23–24 | Finite ramification and the coefficient-control assumptions are retained. The specialization containment is in the stated direction; its advertised negative Check is R10. |
| 0.8 | SU lines 8365–8398, Lemma 12.2.2 and family normalization, pp. 194–195; lines 8546–8555, Theorem 12.3.1, p. 199 | Stabilization, 2⁻³(2i)^(κ+1), Petersson and canonical-period denominators were compared. Unit changes preserve ideals; a uniformizer change does not. |
| 1.1 | SU lines 2775–2793, §§5.4.9–5.5; lines 3192–3244, §6.1.4–6.1.5; lines 3555–3578, Theorem 6.3.3 | The tower and q = 1 carrier are misidentified: R03–R04. Source's odd p is not stated here: R05. |
| 1.6 | SU lines 8687–8735, Theorems 12.4.1–12.4.2, pp. 202–203; lines 3800–3852, §6.5.3 and Theorem 6.5.4, pp. 97–98 | The conductor, irreducibility, distinguishedness, singular-coefficient divisibility and nonzero-reduction condition are retained. The Hecke-space description inherits R04. |
| 1.10 | SU lines 1550–1591, Theorem 3.6.1, pp. 41–42 | Direction, squarefree inert level, odd number of inert factors, residual ramification and central-character restrictions match. R05 concerns the omitted standing prime hypothesis. |
| 2.1 | CLW lines 959–1010, Theorem 2.9.1, p. 13; lines 2101–2132, Theorem 4.6.1, p. 29 | Semi-ordinary projector and the smaller weight algebra are distinguished from full ordinary Hida theory. |
| 2.2 | CLW lines 959–1010 and 2101–2132, same locators | The cone 0 ≥ t⁺ ≥ −t⁻ + 4 and sufficiently large boundary weight are retained. The exact sequence is not asserted at arbitrary weights. |
| 3.2 | FW lines 914–1142, Assumption 2.1, Theorem 2.4 and Corollary 2.5, pp. 17–20 | Reduced complete intersection, finite freeness and R = T are stated with the source's modular setting. No UFD conclusion for T is substituted for regularity of Λ. |
| 4.6 | FW lines 1772–1848, Proposition 3.17, Definition 3.19 and Proposition 3.20, pp. 31–32; NAK lines 3413–3427 and change-of-Σ formulas (77)–(79), pp. 78–80 | Derived tensor/Tor terms, the restriction on full-line base change and determinant norms are retained. Unrestricted full-line base change would be false. |
| 4.8 | NAK lines 3400–3452, §5.2 and Theorem 5.7, pp. 78–79 | Residual morphism uses the ±1 tensor relation and Euler-corrected reduction; nonzero does not mean a unit. |
| 5.5 | Wan-2015 lines 3974–4089, Propositions 95–96 and proof, pp. 78–81 | Height-one exclusions and a nonconstant Fourier coefficient are retained. The proof's general-CM nonvanishing input is not covered by the cited imaginary-quadratic contract: R07. |
| 5.13 | BCS published lines 513–568, Proposition 5.2.1 and Lemma 5.2.3, pp. 11–12; Wan-2015 lines 4526–4564, Theorem 103, pp. 91–92; Fujiwara lines 2556–2572, Definition 6.11, pp. 54–55 | The six minimality clauses are requested explicitly, not replaced by just unramifiedness. The q_v rather than rational-prime congruence and p = 5 exception are correctly distinguished. |
| 6.2 | BCS v2 lines 441–469, Lemma 5.1.1, p. 9 | Specialization followed by Shapiro has the correct containment direction. README repairs the source's mistaken field on the Shapiro right-hand side. |
| 6.4 | BCS v2 lines 479–487 and 521–530, Proposition 5.2.1/Lemma 5.2.3, pp. 9–10 | Splitting, irreducibility and residual exceptions match. The removed extra Δ+ clause is automatic under the stated discriminant conditions. |
| 7.5 | BCS published lines 569–590, proof of Theorem 1.1.2, p. 12, especially (5.2)–(5.4) | The early product bound precedes factor separation and has the correct integral orientation. The subsequent headline's added unit restriction is R09. |

Additional primary checks included HT94 Theorems 0.1–0.3 (lines 84–173) and Theorem 7.1 (lines 2390–2420), with the localization/exceptional factors retained; Hsieh2012 Theorems A–B (lines 82–108); Fujiwara Theorems 11.1–11.2 and Corollary 11.5 (lines 4465–4482 and 4570–4579); Pottharst2013 Theorems 1.11–1.13 (lines 593–627) and Proposition 3.13 (lines 1463–1472); LZ14 §3.2 (lines 423–432) for the Yager inverse convention; and LZ16 Theorem 7.1.5 (lines 1740–1757) for the Coleman-family reciprocity and its p-regular weight-one extension. The two latter works were fetched legally through the sources service and added under distinct existing-work keys, not copied into the repository.

### Explicit elliptic witness for R09

For E: y² = x³ − 4x + 7, direct finite-field counts give #E(𝔽₃) = 7 and #E(𝔽₅) = 4, hence a₃ = −3 and a₅ = 2. The discriminant is −16·11·97. Thus reduction at 5 is good ordinary. The mod-5 Frobenius polynomial at 3 is X² + 3X + 3, with discriminant 2, a nonsquare; E[5] is irreducible over 𝔽₅.

At 11, c₄ = 192 is a unit, v₁₁(Δ) = 1, and −c₆ = 6048 ≡ 9 modulo 11. The reduction is split multiplicative. The Tate parameter has valuation one, so tame inertia has a unit transvection on T₅(E). This inertia fixes all 5-power roots of unity, and its transvection has free rank-one cokernel. This verifies (im). Its unique invariant line over an algebraic closure is already defined over 𝔽₅; combined with irreducibility, this also excludes a hidden failure of absolute irreducibility. The trivial twist's Euler augmentation is 1 − 1/11 = 10/11, with v₅ = 1, so no choice of the other three twists repairs the added unit condition.

### Adversarial target table

In the tables, A is the indicated coefficient ring, π is a uniformizer, and v is its normalized valuation. “Pass” means the displayed probe is consistent, with the source/supplier restrictions retained; it is not a new proof of the target. Algebraic models are labelled as such. The zero ring is excluded wherever a domain, local ring or DVR is assumed. Arithmetic p-adic inputs are mixed characteristic; equal-characteristic models below test algebraic interfaces only.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| 0.1 Selmer definition/finiteness/characteristic ideal | T = 0; A = k⟦x,y⟧, M = A/(x,y); infinitely ramified square-zero character | Sel(0) = X(0) = 0, Ch = A; Fitt₀(M) = (x,y), Ch(M) = A; (1+εX^j)^p = 1, infinitely many ramified places | Finite ramification is now present; Ch is not Fitt | None |
| 0.2 primitive versus imprimitive | Split multiplicative ℓ = 11, p = 5, α = 1 | Euler augmentation 1−α/ℓ = 10/11; v₅ = 1, not 0 | Bad Euler factor cannot be discarded | None |
| 0.3 specialization | A = ℤ_p⟦T⟧; M = A/(T−p), then A/(p,T), then author’s rank-positive example | First pair: (p) = (p); second: specialized Ch = A versus Ch of specialization = (p); author's pair: 0 = 0 | Strict direction requires second model | R10 |
| 0.4 Eisenstein ideals/quotient | ℤ→𝔽₅ with I = 0; constants ℤ→ℤ[X] | E = (5), ℤ/E = 𝔽₅; constants omit X, so quotient equivalence fails without surjectivity | Pass | None |
| 0.5 polarized datum | Middle ranks 1,2; ν(c) = ±1; three residual constituents equal | Total ranks 3,4; Φᵗ = −ν(c)Φ gives alternating/symmetric cases; equal constituents yield no separating idempotents (1=0 would be required) | Parity/disjointness conditions matter | None |
| 0.6 local extension conditions | Trivial minus coefficient ℚ_p/ℤ_p; unramified class Frob↦1/p | Restriction to inertia = 0; restriction to D is nonzero 1/p; Euler at 11 gives v₅ = 1 | Strong D-kernel implies inertia-kernel, not conversely | None |
| 0.7 lattice bound | Unreduced rank-two lattice; reduction modulo π; v(J)=2, N′=0 | Generic ranks 2 versus 0 before reduction; reduced sides both (R/π)²; required Selmer length ≥2, not merely ≥1 | Definition fails before reduction | R01 |
| 0.8 periods/congruence number | Ω↦2Ω at p=5; Ω↦5Ω; Δ in S₁₂(1) | Unit rescaling changes v by 0; 5-rescaling changes it by 1 in absolute value; one-dimensional cuspidal algebra has congruence ideal (1), even at 691 | Cuspidal and Eisenstein congruences distinguished | None |
| 0.9 CM congruence denominator | K=ℚ(√−23), p=3; Euler φ(7),φ(5) | h_K=3 and −23≡1 mod3; v₃(h_K)=1; φ(7)=6 has v₃=1, φ(5)=4 has v₃=0 | Class-number/local factors cannot be treated as units | None |
| 1.1 ordinary forms/tower | p=3 level p tower; p=2 weight group; genus-zero constant term | Fibres 2304 versus 16; ([−1]−1)([−1]+1)=0; corank-one boundary value 0 versus unrestricted value 1 | Three interface failures | R03–R05 |
| 1.2 Hida control/boundary | Split exact rank model A→A²→A; excluded genus-zero value | Ranks 1+1=2; allowing an additional constant boundary value adds a coordinate not in this sequence | Sequence applies to restricted space | R04 |
| 1.3 Eisenstein datum/Hecke quotient | Four eigenvalues 1,2,3,4; γ↦(1+W)⁻¹(1+T)²; quotient ℤ→𝔽₅ | Polynomial constant 1, linear coefficient −10; linear expansion 1−W+2T; quotient kernel (5) | Reciprocal and character conventions consistent here | None |
| 1.4 normalized pullback | Scalar 3 and raw coefficient 2; β=diag(1,0), diag(1,1) | Normalized coefficient 6, not 18; determinants 0 and 1 | Scalar applied once; singularity condition discriminates | None |
| 1.5 SU L-function | N⁻=1, one inert prime, two inert primes; period unit/nonunit | Prime counts 0,1,2: only 1 has required odd parity; v₅(2)=0, v₅(5)=1 | Hypotheses retained; construction Checks incomplete | R11 |
| 1.6 family/constant terms/congruence | Boundary divisible by π², one coefficient a unit; zero family | Unit coefficient has v=0, boundary v≥2, ideal bound v(E)≥2; zero family gives no unit coefficient | Nonzero-reduction hypothesis essential; q=1 mislabel persists | R04, R11 |
| 1.7 nonsingular coprimality | R=O⟦S,T⟧, P=(T), P=(p) | (T)∩O⟦S⟧=0; (p)∩O⟦S⟧=(p)≠0 | Pulled-back/excluded primes differ | None |
| 1.8 pseudocharacter | diag(1,2,3,4); identity rank four | tr=10 versus −coeff₃=50; T(1)=4, not 2 | Wrong coefficient | R02 |
| 1.9 congruence-to-Selmer | v(scalar Selmer)=0, v(J)=2; scalar length positive | First case requires Selmer length≥2; a scalar length 1 may absorb a contribution | No cancellation of nonunit scalar factor | None |
| 1.10 two-variable bound | DVR ideals Ch=(π³), L=π² | (π³)⊆(π²); 3≥2. Reverse inclusion false | Direction correct; p=2 not covered by source | R05 |
| 1.11 cyclotomic SU application | 11a1,p=7,K=ℚ(√−3); p=5 | a₇=−2; 7∤5=v₁₁(Δ); −3≡4 mod7, ≡8 nonsquare mod11; rational 5-torsion makes mod5 reducible | Revised Check discriminates | None |
| 2.1 semi-ordinary projector | U=diag(1,5); two weight variables | lim U^(r!)=diag(1,0); e²=e; dim ℤ₅⟦X,Y⟧=3 | Pass | None |
| 2.2 exact sequence/control cone | t⁺=0,t⁻=4 then 3 | 0≥0≥0 true; 0≥0≥1 false | Boundary weight cannot be omitted | None |
| 2.3 two Klingen families | κ=6 then 4; two coefficients X,Y | 6≥6 true,4≥6 false; neither X nor Y is a unit | Indexed pair retained | None |
| 2.4 joint Fourier–Jacobi coprimality/Ichino factor | (X,Y)⊂k⟦X,Y⟧; k=2,4 | ht(X,Y)=2, ideal proper; no height-one prime contains both; 1/(k−1)=1,1/3 | Joint nondivisibility is weaker than a unit coefficient; orthogonal pairing 0 makes the displayed quotient undefined | R14 |
| 2.5 Eisenstein ideal valuation | E=(π³), boundary exponent m=2 | E⊆(π²), v(E)=3≥2; 3≤2 false | README uses correct direction unlike source slip | None |
| 2.6 CAP exclusion interface | Decomposition dimensions 1+1+2; p=5 local ratio 2 | Sum dimension 4 alone does not prove cuspidality; ratio 2 is neither 5 nor 1/5 | Dimensional argument alone insufficient; Harris input retained | Primary text waived |
| 2.7 localized divisibility | R=O⟦S,T⟧⊗_(O⟦S⟧)Frac(O⟦S⟧) | S becomes a unit, T need not; (S) disappears, (T) survives | Cyclotomic localization not merely p-inversion | None |
| 2.8 p-inverted refinement | p=3, φ(7)=6; localization at p | v₃(6)=1; (3) becomes the unit ideal after inverting 3 | Exceptional/localization factors retained | None |
| 2.9 arithmetic weights | Boundary threshold A, b=A+1 then A | b−A=1 then 0; strict inequality succeeds then fails | “Sufficiently large” not all weights | None |
| 2.10 vector-valued family | (k,m)=(2,0),(4,1) | Weights (0,0,0;κ), (1,−1,−1;κ+1) | Reparametrization computes; Check absent | R11 |
| 2.11 Hida–Katz factorization | h_K=3, product of remaining scalars=2, p=3 | Including h_K gives 6 with v₃=1; omitting it gives 2 with v₃=0 | Integral class-number factor necessary | None |
| 2.12 general-weight joint coprimality | k=2,4; ν₁=X,ν₂=Y versus X,X² | Archimedean constants 1,1/3; ht(X,Y)=2 versus ht(X,X²)=1 | Nonzero alone does not give coprimality | None |
| 2.13 μ/nonvanishing | f=T+5 versus 5(T+1) in ℤ₅⟦T⟧ | μ=0 versus1; first has coefficient1, second all coefficients divisible by5 | Unit-coefficient criterion discriminates | None |
| 2.14 FW divisibility | Steinberg sign at ℓ=11,k=2 then4 | −ℓ^(k/2−1)=−1 then−11, not +1 or +11 | Local sign retained | None |
| 2.15 BF construction/local conditions | Empty Euler set; induced rank-two CM representation; zero candidate | Product1; tensor rank2·2=4; zero has localization0, while required localization is nontorsion | Construction and nonvanishing exclude zero class | None |
| 2.16 reciprocity/cokernel | Map A→A by T versus by unit2 at p=5 | Cokernels A/(T),0; height-one lengths1,0 | “Nonzero” insufficient for pseudo-null cokernel | None |
| 2.17 two-variable equality comparison | Shared nonzero factor π³ versus zero | v(π³a)=3+v(a), cancels3; 0·a=0·b for arbitrary unequal a,b | Nonzero factors retained | None |
| 2.18 auxiliary K | D=−7 versus−4 at2 | −7≡1 mod8: split; −4 even: ramified | Odd-prime Jacobi rule not used at2 | None |
| 2.19 Yager module/exponential | Unramified degree-p trace; cyclic cubic inverse convention | Tr(1)=p, not1; a normal basis can have trace1. For F₂₇, α³=α+1: y=αe₀+(α+1)e₁+(α+2)e₂ has coeff₀(y^τ)=α+1=coeff₀(e_τ⁻¹y) | Inverse action consistent when basis e_σ is distinguished from action notation | None; retain explicit convention |
| 2.20 finite-slope and p-irregular comparison | Complex [A→^X A], X↦0; α=β | Specialized H⁰=H¹=E, but H⁰(C)⊗E=0; α−β=0 | Derived comparison required; no division by α−β | None |
| 2.21 ordinary reverse bound | Ideals (π²),(π³); local character −1 mod5 | (π³)⊆(π²); invariants of scalar−1 have dimension0, scalar1 dimension1 | Unramified-invariant condition is substantive | None |
| 2.22 Wan family theorem | Oldspace at an extra unramified prime versus newspace; smoothing factor | Old degeneracy span has two vectors, not a single new eigenline; at j=0,trivial character,c=2, c²−c²=0 | “New outside p” and nonunit corrections retained | None |
| 3.1 residual hypotheses | Split distinct unramified chars over𝔽₅; irreducible X²+2 over𝔽₅; non-split distinct extension | End dimensions2,2,1 over𝔽₅; first algebra𝔽₅×𝔽₅, second𝔽₂₅, third𝔽₅ | Local correction sound, not propagated | R06 |
| 3.2 R=T/free complete intersection | Λ=O⟦X₁,X₂,X₃⟧, finite free T rank2 | dimΛ=4; rank_Λ(T²)=4, rank_T(T²)=2 | Restriction of scalars distinguished | None |
| 3.3 smooth classical points | Étale fibre E×E versus ramified E[u]/u² | Nilradical dimensions0 versus1; latter not reduced or étale | Regularity only at specified points | None |
| 3.4 determinant lines | [A→^π A] degrees0,1; shift by1; α=1 | Determinant lattice (π), inverse (π⁻¹); shift reverses exponent; 1−α=0 so no acyclic trivialization | Sign and nonvanishing retained | None |
| 3.5 completed cohomology factorization | Unramified principal series K₁(ℓ^m), m=0,1; split local residual | Invariant dimensions1,2; split End dimension2 not1 | Minimal conductor matters; N3 needed | R06 |
| 3.6 homological zeta map | k=2, trivial W; c=2,j=0,trivial cyclotomic character | Tensor over O⟦K_m⟧ gives coinvariants; smoothing augmentation4−4=0 | Plain tensor/unsmoothing inverse rejected | None |
| 3.7 universal zeta morphism | Σ={p}; added Euler1−γ; split local residual | Empty correction1; 1−(1+T)=−T; End dimension2 violates cancellation input | Norm relation sound; full FW route unsupported | R06 |
| 3.8 specialization to Kato | Steinberg versus unramified degree2; Σ₀ empty | P=1−a_ℓX degree1 versus degree2; empty correction1 | Correct inertia-invariant polynomial retained | None |
| 3.9 trivialization/norm | t(e)=π⁻¹; degree2 scalar extension | t∨(e∨)=π; Norm(π)=π², notπ | Dual and regular-subring maps distinguished | R06 for availability |
| 3.10 conjecture predicates | Images A,πA,TA in O⟦T⟧ | First equalsA; other two do not. After p-inversion πA=A but TA≠A | Integral/rational/full-ring predicates differ | None |
| 4.1 integrality of dual image | Fraction1/T; T/p | v_(T)(1/T)=−1; v_(p)(T/p)=−1 | Each fails integrality at a different prime | None |
| 4.2 unit detection | α=1+T then p+T; T↦0 | Specializations1 andp; first α unit, second nonunit | Unit specialization in a local map discriminates | None |
| 4.3 family theorem over Λ | Finite rank2 extension; scalarπ | Determinant normπ², notπ; total fraction algebra dimension2 over FracΛ | Correct ring level retained; missing zeta branch remains | R06 |
| 4.4 passage to classical points | t=u², t↦0 | Fibre E[u]/u² has u≠0,u²=0; not étale | Cannot replace limit argument by arbitrary étale base change | R06 upstream |
| 4.5 pointwise main conjecture | k=2, odd p; putative 2a≡k−1 mod(p−1) | Left even, right1 odd; no solution | A universal naive critical twist cannot replace the stated pointwise route | R06 upstream |
| 4.6 Euler/Tor/norm corrections | [A→^X A], X↦0; N=[[0,X],[0,0]] | Tor₁=E; inertia kernel rank1 generically,2 atX=0; Euler degree may jump1→2 | Derived and suitability restrictions necessary | None |
| 4.7 congruence of zeta maps | m=2,n=1; scalarπ | π modπ²≠0, π modπ=0 | Both maps must reduce modulo the same exponent m | README corrects source slip |
| 4.8 residual map/points | Euler1−γ; ±1 component in odd characteristic | Reduction −T≠0 and nonunit; e₊e₋=0, e₊+e₋=1 | Nonzero residual morphism not automatically a basis | None |
| 4.9 μ detection | Λ/(p), Λ/(T²) | μ=1 with reduction𝔽_p⟦T⟧ infinite-dimensional; μ=0 with reduction dimension2 | Finite residual length is substantive | None |
| 4.10 λ variation | Λ/(T), Λ/(T−p); defects | Both λ=1 but ideals unequal; (3−1)=(5−3)=2 | Equal numerical defects do not imply ideal equality | None |
| 5.1 Fujiwara setup | Elliptic odd representation at p=5; complex conjugation | det(c)=−1=4 mod5, while square of a determinant character at c is1 | Exceptional determinant condition is not automatic | None |
| 5.2 Hilbert periods | Basis scaled by2 or5 atp=5 | v₅(2)=0, v₅(5)=1 | No unsupported exact square of elliptic period | None |
| 5.3 Hilbert anticyclotomic function | Degree[F:ℚ]=2 versus1, N⁻=1; nonunit toric factor | Prime count0 has even parity, not odd; factorπ contributes μ=1 | Field-degree parity and μ hypotheses retained | None |
| 5.4 normalized Hilbert Klingen family | β=diag(1,0),diag(1,1); normalization3 | detβ=0,1; coefficients multiply by3 once, not9 | Singular-boundary restriction discriminates | R03 upstream carrier |
| 5.5 nonconstant coprimality | M=ℚ(√29,√−7); ideal(X,Y) | [M:ℚ]=4, CM type size2 versus imaginary-quadratic size1; ht(X,Y)=2 | Contract scope insufficient | R07–R08 |
| 5.6 Eisenstein ideal | ℤ→𝔽₅; operator8,eigenvalue3 | Difference5; I=0 in𝔽₅, contraction(5) inℤ; 5 not25 | Coefficient ideal correctly a kernel | None |
| 5.7 valuation inequality | Map k[x,y]→k(y); v(L)=2 or0 | 1/y absent before localization, present after localization at(x); v(E)≥2 or≥0, not always>0 | Localization/surjectivity and weak inequality retained | None |
| 5.8 lattice/Selmer dictionary | 1+2+1 decomposition; v(J)=2, scalar length0 | Rank4; lower bound2; local Euler10/11 has v₅=1 | Scalar comparison cannot drop bad-prime factor | None |
| 5.9 excluded height-one primes | P=(p) versus(T_anti); local μ1 | First contracts nontrivially to cyclotomic subring, second contracts0; μ correction1 versus0 if dropped | Exclusions and local factors retained | None |
| 5.10 Wan divisibility | p=5,κ=2; non-torsion convention | 5>3 and2≥2; Ch(A)=0 under extended convention makes 0⊆(L) vacuous | Weight2 included; divisibility alone proves no torsion | None |
| 5.11 weight-two specialization | T↦p versus0, generatorT² | Valuesp²≠0 versus0 | Cancellation allowed only first case | None |
| 5.12 quartic specialization | [F:ℚ]=2,M=FK; p=5 versus3 | [M:ℚ]=4; three ℤ_p directions in CM tower;5>3 true,3>3 false | Scope and tower ranks consistent | None |
| 5.13 auxiliary hypotheses | p=5,ℓ=19 inert versusℓ=11 split | q_v=19²≡1 versus11≡1 mod5; using19 itself gives−1 | Correct q_v test | None |
| 6.1 four Selmer/L-function identity | DVR model H/z length2, strict length1, L_PR length3, ordinary length2, L_Gr length2, Gr length1 | 2+2=3+1=4 and2+1=2+1=3 | Ratios agree; no unsupported cancellation of zero modules | None |
| 6.2 quartic restriction/Shapiro | C₂ character decomposition; pseudonull specialization | Idempotents sum1/product0; A/(p,T) gives Ch_A=A but specialized Ch=(p) | Both decomposition and containment orientation discriminate | None |
| 6.3 analytic factorization | Quartic scalar p times product of two factors | v_p differs by1 integrally, by0 after p-inversion | Rational identity not integral normalization | None |
| 6.4 existence of K,F | K=ℚ(√−7),F=ℚ(√29), local checks only | −7≡14² mod29; −7≡1 mod8;7∤29, so M/F ramifies above7 | Removed Δ+ requirement follows; example not asserted to satisfy every E-dependent hypothesis | None |
| 6.5 μ specialization | f=T versus1+S+T; f² | μ(f)=0 for both; atT=0 first becomes0, second1+S hasμ0; μ(f²)=2μ(f) | μ0 does not survive arbitrary specialization | None |
| 6.6 integral early product bound | Analytic μ0 versusμ1, algebraic μ0 | 0≤0 passes; required1≤0 fails in second case | μ input restores precisely the lost p-prime inequality | None |
| 7.1 integral twist dictionary | Characters ±1; discriminants−7,29 | Product character corresponds to−203; multiplying signs twice gives1 | Twist distinct from base change | None |
| 7.2 biquadratic Shapiro | C₂ atp=5 andp=2 | 1/2=3 mod5; e₊e₋=0 and sum1; 2 not invertible overℤ₂ | Odd-prime integral splitting essential | None |
| 7.3 cyclotomic control | GeneratorT−p versusT underT↦0 | −p≠0 versus0; first preserves torsion conclusion, second does not | Nonzero specialization retained | None |
| 7.4 analytic four-factor factorization | √7 atp=5; period scaled by5 | v₅(√7)=0; v₅(5)=1 | Unit algebraic period factors harmless, p-period rescaling not harmless | None |
| 7.5 early four-factor bound | Ch exponents(2,1,0,1), analytic(1,1,0,1) | Sum4≥3; (π⁴)⊆(π³) | Correct orientation | None |
| 7.6 stability of (im) | σ=1+N, N₁₂=u; twist value−1; u=1 thenp | σ²=1+2N; unit2u at oddp; cokernels ℤ_p thenℤ_p⊕𝔽_p | Integral rank-one condition, not rational rank | None |
| 7.7 Kato bound | E of R09; Euler at11 | v₅(10/11)=1; r_E times imprimitive L has at least this extra valuation | Weak supplier bound accurately stated | R09 for headline use |
| 7.8 factor separation | Nonnegative defects sum≤0; counterexample J₁=J₂=π,L₁=π²,L₂=1; empty set | Each defect0 when all inequalities hold; productsπ²=π² in counterexample but factors differ; empty products1=1 | All individual inequalities and nonzero factors necessary | None |
| 7.9 rational BCS equality | E of R09,p=5 | a₅=2; inverse-p ring sends (5) to(1) | Rational endpoint includes example | None |
| 7.10 integral BCS equality | Same E, trivial twist | (im) cokernelℤ₅; Euler valuation1 rejects added hypothesis | Source supports larger endpoint | R09 |
| 8.1 aggregate | Ideals(π) andA before/after p-inversion | Unequal before, equal after; equality of aggregate labels cannot restore lost valuation | Inherits narrowed endpoint | R09 |

### API-by-API probes

Numbers A01–A127 follow the API bullets in README order; each row identifies its section and the actual law being tested. These are additional to the target rows, so a whole API block is not certified merely by testing its first bullet. A “construction” result is checked here for its stated source/target and a discriminating algebraic/local model; primary-source restrictions remain as in the preceding audit.

| API statement | Instance and computed values | Result/change |
|---|---|---|
| A01 §0.1 submodule | Zero coefficient: H¹=0, kernel=0, Sel=0 | Pass |
| A02 §0.1 finite generation | T=0 gives 0 generators; infinitely ramified ε-model has infinitely many ramified places | Finite-S hypothesis now explicit |
| A03 §0.1 relaxation/dual | Kernel model 0⊂𝔽₅ dualizes to 𝔽₅↠0, not 0↠𝔽₅ | Direction correct |
| A04 §0.1 Shapiro | Index-two coinduction of rank r has rank2r; inverse tautological action sends γ toγ⁻¹ | Correct coefficient carrier retained |
| A05 §0.1 Ch versus Fitt | k⟦x,y⟧/(x,y): Fitt=(x,y), all height-one lengths0, Ch=A | Pass |
| A06 §0.1 specialization map | T↦0, M=A/(T−p): M/TM=𝔽_p, Ch=(p) | Isomorphism explicitly conditional |
| A07 §0.1 local conditions | Trivial coefficient atp: unramified Frob class1/p survives inertia kernel, not strict condition | Distinguishes zero ordinary submodule from strict zero condition |
| A08 §0.1 equality/membership | Kernel of identity on𝔽₅ is0; kernel of zero map is𝔽₅ | Localization map determines membership |
| A09 §0.4 operator ideal | Operator8,eigenvalue3 inℤ: difference5, ideal(5) | Pass |
| A10 §0.4 contraction | ℤ→𝔽₅ with I=0: preimage(0)=(5) | Zero coefficient ideal is wrong |
| A11 §0.4 flat base change | ℤ→ℚ sends(5) to(1) and quotient𝔽₅ to0; both kernels becomeℚ | Flat transport, not arbitrary kernel change |
| A12 §0.4 proper iff | ℤ→𝔽₅: E proper and I proper; zero target gives both unit ideals | Both directions checked |
| A13 §0.4 monotonicity | Add differences6 and10: (6)⊂(2); direct factor of ℤ×𝔽₅ changes contraction0 to(5) | Direction correct |
| A14 §0.4 equality | Same ideal(5) generated by5 or−5 has same contraction; image of5=0, image of1=1 | Pass |
| A15 §0.5 companion | χ=2,χᶜ=2,ν=6 inℚ×: χ′=3 and χᶜχ′=6 | Reciprocal, not product, needed |
| A16 §0.5 trace congruence | Block eigenvalues1,(2,3),4 give1+5+4=10 | Rank-four trace consistent |
| A17 §0.5 residual projectors | diag(1,0),diag(0,1) give eigenvalues(1,0),(0,1); equal characters cannot separate | Disjointness needed |
| A18 §0.5 base change | X²+2 irreducible over𝔽₅, split over𝔽₂₅; constituent count1→2 | Absolute condition cannot be dropped |
| A19 §0.5 plus/minus | (1−X)(1−2X) divided by fixed plus factor1−X leaves1−2X | Complementary polynomial fixed by full and plus data |
| A20 §0.5 block type | n=1,2 give block sizes(1,1,1),(1,2,1), total3,4 | Not a two-block Ribet datum |
| A21 §0.5 complete datum | Equal residual chars require projector simultaneously1 and0 | Missing disjointness admits wrong model |
| A22 §0.5 transport | Swap basis on diag(2,3): trace5 and determinant6 unchanged | Must transport local summands too |
| A23 §1.1 dual carriers | M=A², V=Hom(M,A): both rank2 but no chosen self-pairing; genus-zero coefficient0 versus1 | R04 |
| A24 §1.1 expansion map | Two forms differing at coefficient q^1 by1 have unequal expansions | Correct domain M, not unexplained dual V |
| A25 §1.1 commuting operators/projector | Diagonal operators diag(1,5),diag(2,3) commute; e=diag(1,0) | Pass at model |
| A26 §1.1 specialization | Weight map X↦0 sends family1+X to1; an out-of-cone weight has no asserted classical identification | Regularity retained; R05 |
| A27 §1.1 boundary | Projection A²→A has kernel rank1 and image rank1 | Restricted-space exact sequence; R04 |
| A28 §1.1 reduced Hecke algebra | A×A has nilradical0; A[ε]/ε² has nilradicalAε | Reducedness substantive, not finiteness alone |
| A29 §1.1 equality | Difference with all coefficients0 has expansion0; q has coefficient1 and is rejected | Joint expansion principle retained |
| A30 §1.3 coefficient algebra | Three ℤ_p directions over finite Hida branch; O plus3 variables has dimension4 | Variable counts consistent |
| A31 §1.3 polynomial | diag(1,2,3,4) gives coefficients1,−10,35,−50,24 in coefficient ring | Constant1 convention |
| A32 §1.3 ideals | ℤ→𝔽₅, I=0,E=(5) | Hecke/coefficient ideals differ |
| A33 §1.3 quotient | ℤ/(5)→𝔽₅ is bijective, both cardinality5 | Surjectivity used |
| A34 §1.3 analytic product | L₁=π²,L₂=π³ gives L=π⁵, notπ² | Scalar factor retained |
| A35 §1.3 arithmetic specialization | Eigenvalues1,2,3,4 mod5 give same five coefficients reduced mod5:1,0,0,0,4 | Polynomial comparison coherent |
| A36 §1.3 transport | Equal operator differences5 and−5 generate(5) | Pass |
| A37 §1.4 local-section dependence | Scaling a chosen section by3 scales its linear Eisenstein sum by3 | Raw series is not invariant under section scaling |
| A38 §1.4 pullback scalar | Pairing value cE with c=3,E-coefficient2 gives6 | Dropping scalar gives2 |
| A39 §1.4 normalization | Scalar3 twice would give18 instead of6 | Normalization once |
| A40 §1.4 canonical coefficients | C=6, unit u=2, period product3 gives uC/period=4 | Neither raw2 nor normalized6 is the family coefficient |
| A41 §1.4 singular divisibility | β=diag(1,0):det0; β=I₂:det1 | Only first falls under singular formula |
| A42 §1.4 U eigenvalues | β₁=2,β₂=3, exponents1,2 gives2·9=18 | Product convention |
| A43 §1.4 raw constant term | Inducing constant2 and normalization3 give raw2, normalized6 | Distinguishes the two series |
| A44 §1.4 equality/base extension | Coefficients1,2 inℤ map to1,2 inℚ; differing coefficient1−2=−1 persists | Coefficient extension compatible |
| A45 §1.8 dimension | Pseudocharacter at identity gives4, not2 | Pass |
| A46 §1.8 classical trace | diag(1,2,3,4): specialization of trace10 | R02 affects extraction |
| A47 §1.8 Frobenius polynomial | −coeff₁=10, −coeff₃=50 | R02 |
| A48 §1.8 polarization | Eigenvalues2,3,ν=6: ν·tr(g⁻¹)=6·(1/2+1/3)=5=tr(g) | Similitude cannot be omitted |
| A49 §1.8 constituent alternative | 2+2=4; dimension alone also allows1+1+2=4 | Source irreducibility/CAP hypotheses needed |
| A50 §1.8 residual trace | Trace10 reduces to0 mod5 on both sides | Pass |
| A51 §1.8 density | Continuous difference0 on dense set has closed zero locus whole group; atidentity difference4−2=2≠0 rejects wrong dimension | Density input retained |
| A52 §2.1 weight torus | Two variables overℤ₅: Krull dimension3, not5 of four variables | Semi-ordinary distinction |
| A53 §2.1 U product | Commuting scalar factors2,3,4 give24 | Product includes all three factors |
| A54 §2.1 projector | diag(1,5) limitdiag(1,0), squared unchanged | Pass |
| A55 §2.1 ordinary inclusion | e_so=diag(1,1,0),e_ord=diag(1,0,0); product=e_ord | Reverse equality would fail |
| A56 §2.1 weights | Character on(a,b) with exponents(1,2): at(2,3) value18, swapped exponents value12 | Two coordinates distinguished |
| A57 §2.1 membership | e(x,y)=(x,0): fixed iff y=0 | Ambient equality and membership discriminate |
| A58 §2.3 rational pair | ValuesX/p,Y/p belong toR[1/p], not necessarilyR | No integral unscaled claim |
| A59 §2.3 arithmetic value | e on(1,p) gives(1,0); κ6 admitted,κ4 excluded | Projector and range retained |
| A60 §2.3 boundary divisibility | L₁=π,L₂=π² forces boundary in(π³) | Product not either factor alone |
| A61 §2.3 eigencharacter | Difference8−3=5 vanishes mod5 | Eigensystem determines ideal |
| A62 §2.3 Fourier–Jacobi target | Nontrivial line-bundle transition by2 sends coordinatec to2c | Coefficient is a section, not a canonically chosen scalar |
| A63 §2.3 pair index | (ν₁,ν₂)=(X,Y), neither unit, joint height2 | Collapsing index loses theorem |
| A64 §2.3 expansion/character evaluation | Evaluating coefficient family1+T atT=2 gives3 before or after extraction | Operations commute |
| A65 §2.12 dual bases | eᵢ↦2eᵢ, dual↦(1/2)eᵢ* leaves contraction2·1/2=1 | Dual basis essential |
| A66 §2.12 two product identities | ν₁=X,ν₂=Y have same boundary multiplier but different nonconstant values | Auxiliary choices cannot be identified |
| A67 §2.12 height-one equivalence | (X,Y) height2 avoids every height-one prime; (X,X²) contained in(X) | Both directions tested |
| A68 §2.15 tensor carrier | Ranks2 and2 give4 | Not a rank-two ℚ-representation before Shapiro |
| A69 §2.15 Shapiro | Index2×rank2=4 equals tensor rank4 | Correct field change |
| A70 §2.15 critical twist | Eigenvaluea and characterθ givea/θ; a=6,θ=2 gives3, not12 | Inverse twist |
| A71 §2.15 local condition | Projection onto minus line sends(x,0) to0 and(0,1) to1 | Greenberg at one prime differs from relaxed other prime |
| A72 §2.15 norm relations | Empty product1; one Euler1−γ evaluates−T | Nontrivial Euler factor retained |
| A73 §2.15 specialization | θ=1+T atT=0 gives1, inverse also1; atT=p gives(1+p)⁻¹ | Twisting and evaluation agree |
| A74 §2.15 localization non-torsion | Element1 inA has annihilator0;0 has annihilatorA | Excludes zero BF class |
| A75 §2.15 distinguished construction | Injective isomorphism sendsx−y=0 iffx=y; zero-localization condition alone also admits0 | Norm-compatible construction, not arbitrary local data |
| A76 §3.1 A37 inertia | Unipotent matrix[[1,1],[0,1]] has invariant dimension1; identity dimension2 | Prime witness discriminates |
| A77 §3.1 T1.7 μ | μ(Frob)=−1 versus1 gives invariants0 versus1 atoddp | Nontrivial μ retained |
| A78 §3.1 N3 | Split distinct End dimension2 versus absolutely irreducible End dimension1 | Predicate not automatic |
| A79 §3.1 End formula | Non-split distinct extension commuting matrices scalar:dimension1; split diagonal:dimension2 | Correct repaired statement |
| A80 §3.1 twist invariance limits | Twist unramified atℓ acts on inertia by1, preserves dimension1; ramified scalar can reduce invariants to0 | A37 not arbitrary-twist invariant |
| A81 §3.1 T5.1 distinction | μ=1 has value1 atFrob; allowed only reducible branch, not irreducible branch | Quantifier branch retained |
| A82 §3.1 transport | Conjugating rank-one nilpotent preserves kernel dimension1 | Must retain prime/local characters |
| A83 §3.4 partial determinant | Two-term rank1 complex contributes determinant exponent+1; inverse exponent−1 | Sign retained |
| A84 §3.4 full corrections | Add rank-one Euler1−α=π: partial imageA becomesπA after correction | Full differs from partial |
| A85 §3.4 rank-one Euler line | α=1−π gives(π); α=1 gives zero differential | Acyclic trivialization only first |
| A86 §3.4 derived base change | [A→^X A] atX=0 yields two E terms, Euler rank1−1=0 | Derived, not underived H¹ tensor |
| A87 §3.4 suitable full base change | Inertia N(X) kernel rank1→2 atX=0 | Arbitrary map can change correction |
| A88 §3.4 full-to-p-only line | Acyclic local correction has exponentv(π)−v(π)=0 | Cancellation of matching local terms |
| A89 §3.4 characteristic iff | Lengths2,2 give exponent0 and imageA;2,3 give exponent±1 and nonunit image | Both directions discriminate |
| A90 §3.4 generic equality | Maps multiply by2 and3: generic values differ by1; two equal generic scalars have difference0 in domain | Domain/invertible line essential |
| A91 §3.6 equivariance | Linear mapz(av)=az(v); a=2,z(v)=3 gives6 both sides | Correct localized codomain retained |
| A92 §3.6 integrality after residual localization | Atj=0,c=2 smoothing augmentation0, not invertible | Integrality uses construction/localization, not universal unit division |
| A93 §3.6 completed linearity | Compatible reductions of2 atp^n are all2 modp^n; incompatible0 atp and1 atp² cannot define a limit | Continuity/compatibility substantive |
| A94 §3.6 τ-equivariance | Minus componentτv=−v andσ₋₁z=−z | Both sides−z |
| A95 §3.6 tame norm | ℓ divides n:multiplier1; ℓ prime to n:1−γ=−T | Branches differ |
| A96 §3.6 coinvariants | C₂ sign module atoddp: coinvariants A/2A=0, plain tensor A≠0 | Wrong tensor rejected |
| A97 §3.6 limit determination | Difference in everyp^nA has valuation≥n for alln, hence0 in complete separated DVR | Separated limit essential |
| A98 §3.7 linearity | a=2,z(v)=3 givesz(2v)=6 | R06 affects existence, not formal linearity |
| A99 §3.7 ± tensor relation | v⊗σ₋₁a=τv⊗a; in minus branch both=−v⊗a | Relation retained |
| A100 §3.7 norm system | Empty Euler correction1, single factor−T | Pass |
| A101 §3.7 coefficient change | Identity map givessamez; X↦0 on complex retains two terms | Derived base change |
| A102 §3.7 change of Σ | Add one Steinberg factor1−aX, a=1,X=1/11 gives10/11 | Nonunit correction retained |
| A103 §3.7 classical comparison | Σ₀ empty givesz; one factor10/11 gives(10/11)z | Not identical without Euler product |
| A104 §3.7 uniqueness by construction | Transport A↔A by×2 and inverse×1/2 givesidentity,×2 alone givesdifferent map | Paired identifications required; R06 |
| A105 §3.9 injective fractional image | ×π⁻¹:A→FracA has kernel0,imageπ⁻¹A; zero map kernelA | Generic nonzero construction excludes zero |
| A106 §3.9 norm | Rank2 multiplication byπ determinantπ² | Not an identification of fraction rings |
| A107 §3.9 specialization | t(e)=1+X, X↦p gives1+p on both routes | Pass under stated comparison |
| A108 §3.9 full-line compatibility | Eulerπ under unit-preserving specialization remainsπ; degenerating EulerX↦0 loses acyclicity | Suitability retained |
| A109 §3.9 dual image | α=π givesimagesπ⁻¹A,πA; α=2 atp5 givesbothA | Both unit iffα unit |
| A110 §3.9 Kato point | Equal characteristic lengths2,2 giveunit determinant exponent0 | Actual specialization, not arbitrary scalar |
| A111 §3.9 equality/norm | Equal generic scalar2 givessameintegralmap; quadratic norm2²=4 | Norm retained |
| A112 §3.10 partial/full predicates | Empty local correction1 givessame line; nonunitπ changeslattice | Two assertions distinguished |
| A113 §3.10 coefficient rings | Λ-domain hasone genericfield; finite rank2 algebra may havefractionalgebraK×K | No equality of rings assumed |
| A114 §3.10 T⇒Λ | Norm ofunitu has inverseNorm(u⁻¹); product1 | Forward implication sound |
| A115 §3.10 pointwise iff | Characteristic exponents2=2 iff determinant exponent0 | Both directions |
| A116 §3.10 data dependence | Rescale z byπ: quotient characteristic gainsπ, predicate can change | Zeta data must be preserved |
| A117 §4.8 residual source | Oddp ± idempotents haveproduct0,sum1 | Correct balanced tensor |
| A118 §4.8 residual Σ change | 1−γ reduces−T, nonzero in𝔽_p⟦T⟧ | No unit assertion |
| A119 §4.8 points | RingmapO→O has1↦1; zero map has1↦0 and is excluded | Points are unital homomorphisms, not arbitrary maps |
| A120 §4.8 η projection | Atp5, e₊=(1+c)/2 ande₋=(1−c)/2; sum1 | Component selection distinguishes signs |
| A121 §4.8 reduction | Scalars1 and1+p both reduce1 | Congruent specializations agree moduloπ |
| A122 §4.8 compatible reductions | Reduction ofp modulo p is0 along either coefficient path | Identity square commutes |
| A123 §5.6 membership | ℤ→𝔽₅:5 lies inE,1 doesnot | Correct contraction |
| A124 §5.6 kernel | Composite quotient map haskernel(5) | Not a quotient ring named as an ideal |
| A125 §5.6 eigenvalue equality | 8≡3 mod5 | Operator difference killed |
| A126 §5.6 quotient equivalence | ℤ/(5) and𝔽₅ both5 elements, constantsℤ→ℤ[X] omitX | Surjectivity necessary |
| A127 §5.6 base-change containment | A=ℤ,T=ℤ[1/2],I=0,E=0; base change to𝔽₂ givesnew T=0, so new kernel𝔽₂ strictly containsE·𝔽₂=0 | General containment retained; equality only with kernel-base-change hypothesis |

### Conventions and declared contracts

| Convention/contract | Computed positive and negative probes | Assessment |
|---|---|---|
| Divisibility orientation | (π³)⊆(π²) gives3≥2; converse false | Consistent across §§0.3,1.10,2.5,5.7,6.6,7.5 |
| Ramified coefficient DVR | In O with p=unit·π², v_π(p)=2 and v_π(π)=1 | Uniformizer not silently replaced by p |
| Domain/finite hypotheses | A/(x,y) overk⟦x,y⟧ has codimension2; nonnoetherian or zero-ring inputs do not meet standing domain/local hypotheses | No zero-ring counterexample admitted |
| Arithmetic/geometric reciprocity | Eigenvalue2 becomes1/2 on the dual; det(1−2X) differs from1−X/2 | Explicit translation required; R02 is a violation |
| Determinant parity | [A→^π A] and its shift giveπ andπ⁻¹ | Primal/dual distinction retained in Layers3–4 and supplier §5.1 |
| Quadratic field convention | D=−7 is1 mod8; D=5 is5 mod8; D=−4 ramifies at2 | Split/inert/ramified tests correct |
| Nonabelian representation input | S₃ standard 2-dimensional representation has End=base field in characteristic0; its restriction to a cyclic order3 subgroup splits over a field with cube roots | Global irreducibility cannot replace local absolute irreducibility |
| Total-function boundary | Empty determinant/product=1; degree-zero zero polynomial is not evidence of nonvanishing; n=0 excluded from 1+n+1 theorem | No cancellation at zero allowed |
| gap:divisorial-char-ideal | A=k⟦x,y,z⟧/(xy−z²), M=A/(x,z): Ch=(x,z) nonprincipal; pseudo-null A/(x,y) overregular2-dimensionalA hasCh=A | Genuine extension beyond principal charIdeal; named supplier and slug agree |
| gap:unitary-ordinary-igusa | Full GU(2,2) level3 fibre2304 versus torus16 | R03; absence itself is not a finding |
| gap:unitary-galois-imaginary-quadratic | [F:ℚ]=1 falls outside supplierAG2.2's degree≥2; representation rank4 requested | Precise degree extension, no duplicate construction |
| gap:katz-cm-padic-l | Root number−1 givescentralvalue0; CM type size2 not1 | R07–R08; registration correct |
| gap:anticyclotomic-rankin-selberg | Nonsplit local μ1 contributes1, not0; odd number versus even number of inert primes changes sign | Explicit nonsplit/local hypotheses retained; Hung remains uncertified |
| gap:hilbert-hida-odd-degree | [F:ℚ]=1 isodd,2 iseven | Supplier§§5.6–5.9 only cover even degree; extension is genuine |
| gap:msd-neron-periods | ReplacingΩ bypΩ scalesL byp⁻¹; unit replacement givesvaluation0 | Missing normalization comparison precisely identified |
| gap:rubin-imaginary-quadratic | K/ℚdegree2 versus totally-realdegree1; h_(−23)=3 nonunit at3 | Branch/normalization data retained; settled Rubin text waived |
| gap:fujiwara-minimal | Atp5, determinant ofcomplexconjugation is−1≠1 | Exception and minimal type hypotheses retained |
| gap:minimal-lift-base-change | Unramified degree2 restriction takes Frobenius toFrob²; eigenvalue−1 becomes1 | Local type/minimality not automatic from base change |
| gap:paskunas-p3-freeness | p3 satisfies≥3 but fails≥5; split Enddimension2 remains excluded | Genuine application extension; does not repair R06 |
| gap:gl2-essential-vectors | Unramified principal series K₁(1) invariantsdimension1, K₁(ℓ)dimension2 | Common conductor and unchanged monodromy essential |

### Supplier-resolution ledger

Each entry below is a resolved heading in the named README, not a remembered citation. Numbers after @ are source-file lines. The copies were read from main or the supplied new-roadmap heads through the roadmap service. KatoEulerSystems was read at the board-index head 5fb6ef4; its index miss is not a missing-roadmap finding. The index was read before any absence claim. The ledger contains 177 section/layer resolutions across 35 suppliers. The twelve gap slugs also agree between the README and plan; all suppliers precede this roadmap.

| Supplier README | Sections/layers and lines |
|---|---|
| TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md | 4.1 @ 2361; 4.4 @ 2530; 4.6 @ 2710; 5.1 @ 3172; 6.5 @ 3897 |
| TauCetiRoadmap/SelmerIwasawaCohomology/README.md | 2.1 @ 346; 2.7 @ 492; 2.8 @ 519; 2.8a @ 546; 2.9 @ 562; 2.10 @ 589; 2.12 @ 645; 2.13 @ 713; 2.19 @ 817; 2.21 @ 845; 2.23 @ 914; 2.24 @ 932; 3.1 @ 1358; 3.2 @ 1390; 3.5 @ 1439; 3.8 @ 1496; 3.9 @ 1522; 3.10 @ 1547; 3.11 @ 1567; 3.12 @ 1585; 3.13 @ 1604; 3.14 @ 1616; 3.16 @ 1743; 3.17 @ 1755; 3.18 @ 1773; 3.19 @ 1797; 3.20 @ 1815; 4.7 @ 1865; 4.10 @ 1935 |
| TauCetiRoadmap/ArithmeticGaloisDuality/README.md | R02.4.3 @ 3324; D7.1 @ 4540; D7.3 @ 4910; D7.4 @ 5220; D7.5 @ 5404 |
| TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md | 4.4 @ 1675; 4.5 @ 1701; 5.4 @ 1864 |
| TauCetiRoadmap/ProfiniteCohomology/README.md | Layer 7 @ 1168 |
| TauCetiRoadmap/EllipticCurves/README.md | Layer 2 @ 647; Layer 7 @ 1262 |
| TauCetiRoadmap/NumberFieldArithmetic/README.md | 1.1 @ 489 |
| TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md | 1.3 @ 2201; 1.4 @ 2375; 2.1 @ 2829; 2.2 @ 2894; 2.3 @ 2954; 3a.1 @ 1661; 4.1 @ 3170; 4.2 @ 3225; 5.3 @ 3477; Layer 6 @ 3545 |
| TauCetiRoadmap/IntegralIwasawaTheory/README.md | 5.0 @ 586; 12.1 @ 1587 |
| TauCetiRoadmap/DirichletPadicLFunctions/README.md | 2.8 @ 614 |
| TauCetiRoadmap/PELModuli/README.md | M5.5 @ 3631; M5.6 @ 3673 |
| TauCetiRoadmap/ShimuraCompactifications/README.md | C5.3 @ 2290; C5.15 @ 2538; C5.16 @ 2572 |
| TauCetiRoadmap/AutomorphicBundles/README.md | B5.1a @ 4567; B5.7 @ 4790; B5.14 @ 5033; B5.15 @ 5103 |
| TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md | Layer IG.0 @ 117; Layer IG.1 @ 866; Layer IG.2 @ 1089 |
| TauCetiRoadmap/MetaplecticAutomorphicForms/README.md | 3.3 @ 618; 6.2 @ 1553; 6.10a @ 1674; 6.11 @ 1688; 6.12 @ 1706; 6.13 @ 1714; 6.17 @ 1746; 6.19 @ 1786; 6.20 @ 1804 |
| TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md | Layer AL.3 @ 1950 |
| TauCetiRoadmap/AutomorphicSpectralTheory/README.md | 1.2 @ 912; 2.4 @ 1600; 4.3 @ 2352 |
| TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md | Layer AG2.2 @ 1203; Layer AG2.5 @ 1758; Layer AG2.6 @ 2036 |
| TauCetiRoadmap/PadicFamilies/README.md | 0a.11 @ 359; 0a.15 @ 429; 0a.16 @ 443; 0a.19 @ 485; 0a.22 @ 541; 1.3 @ 1080; 1.7 @ 1159; 1.8 @ 1192; 1.10 @ 1262; 1.11 @ 1289; 4.0.1 @ 2353; 4.0.2 @ 2369; 4.0.3 @ 2382; 4.1 @ 2395; 4.6 @ 2529; 4.9 @ 2596; 5.1 @ 2639; 5.6 @ 2759; 5.7 @ 2784; 5.8 @ 2798; 5.9 @ 2822 |
| TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md | 1.1 @ 1303; 1.3 @ 1404; 2.5 @ 1742 |
| TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md | 9.15 @ 5419; 9.21 @ 5541 |
| packages/KatoEulerSystems/README.md | 0.1 @ 417; 2.1 @ 686; 2.2 @ 734; 2.3 @ 777; 4.1 @ 1088; 4.2 @ 1158; 4.3 @ 1231; 4.4 @ 1280; 5.1 @ 1415; 5.3 @ 1485; 5.4 @ 1515; 6.6 @ 1800; 7.2 @ 1887; 7.4 @ 1969 |
| TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md | 8.16 @ 5114 |
| TauCetiRoadmap/EulerSystemsCyclotomicMainConjecture/README.md | Layer 3 @ 2339 |
| TauCetiRoadmap/PadicHodgeRegulators/README.md | 1.2 @ 455; 1.10 @ 600; 8.8 @ 1697; 8.18 @ 1861; 8.19 @ 1883; 8.22 @ 1933; 9.22 @ 2258 |
| TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLifting/README.md | 3.28 @ 1199; 3.29 @ 1233; 4.13 @ 1796; 4.14 @ 1816; 4.15 @ 1838; 4.16 @ 1860; 5.6 @ 2125 |
| TauCetiRoadmap/GlobalGaloisDeformations/README.md | 3.7 @ 574; 3.8 @ 640; 4.1 @ 694 |
| TauCetiRoadmap/LocalGaloisDeformationRings/README.md | F.2.5 @ 691; F.2.9 @ 864; 1.1 @ 1293; 3.4 @ 2415; 6.12 @ 3370; 8.3 @ 4021 |
| TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md | 3.1 @ 526; 3.4 @ 615; 6.2 @ 1234; 7.3 @ 1382 |
| TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md | 4.1 @ 1320; 4.4 @ 1463; 4.5 @ 1491; 4.7 @ 1545; 6.2 @ 2111 |
| TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md | 5.5 @ 1882; 5.7 @ 1942; 5.8 @ 1964; 5.9 @ 2000; 5.11 @ 2058; 6.1 @ 2243; 6.6 @ 2348 |
| TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md | SR.5.2 @ 3732 |
| TauCetiRoadmap/GL2ModularityLifting/README.md | 5.16 @ 1491; 7.8 @ 2101; 8.7 @ 2321; 8.8 @ 2341; 10.5 @ 2553; 12.1 @ 2835 |
| TauCetiRoadmap/ClassicalSerreModularity/README.md | Layer R27.6 @ 850 |
| TauCetiRoadmap/SerreWeightAndLevelOptimisation/README.md | 2.13 @ 621 |

The hypotheses, not just heading names, were compared at the interfaces most likely to drift. PadicFamilies §§5.6–5.9 cover even degree, so the odd-degree gap is genuine. AutomorphicGaloisRepresentationsPartII AG2.2 has the degree-at-least-two restriction, so the imaginary-quadratic extension is genuine. PadicLocalLanglandsForGL2Qp §§5.8–5.9 now allow p = 3 but still require scalar local endomorphisms; its §5.11 application is where the p = 3 freeness gap belongs. CompletedCohomologyAndLocalGlobalCompatibility §4.4's split-case deformation does not itself supply the missing universal-envelope comparison in R06. SmoothRepresentationsOfLocalGroups SR.5.2's conditional family statement is weaker than the requested unconditional essential-vector contract. KatoEulerSystems §7.4 retains r_E and imprimitive Euler factors, as the package now acknowledges.

### Pinned declarations and duplication by object

The content main revision was b41e47b. Library reads used Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. These are source-level reads at the pins; only the package's actual Lean file was elaborated. No newer library documentation was substituted.

| Pinned file and line | Declaration opened; what it supplies and does not supply |
|---|---|
| Mathlib/RingTheory/Length.lean:30 | Module.length takes values in ℕ∞ and is defined by the dimension of the submodule lattice. It is not automatically finite. |
| Mathlib/Algebra/Module/LocalizedModule/Basic.lean:88 | LocalizedModule is OreLocalization S M. Localization alone asserts no finite generation or freeness. |
| Mathlib/RingTheory/Ideal/Maps.lean:80, :185, :654, :769 | Ideal.mem_comap, Ideal.map_span, Ideal.map_mul and RingHom.comap_ker give preimages, generated ideals, multiplication and composite kernels. They do not give arbitrary kernel-base-change equality. |
| Mathlib/RingTheory/Ideal/Span.lean:100 | Ideal.span_singleton_mul_left_unit preserves the principal ideal under a unit factor. A factor p in ℤ_p is not such a unit. |
| Mathlib/RingTheory/Ideal/Quotient/Operations.lean:89, :93, :133 | RingHom.quotientKerEquivOfSurjective, its apply_mk rule, and Ideal.mk_ker give the Eisenstein quotient interface with an actual surjectivity hypothesis. |
| Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132, :143, :147, :150 | Matrix.charpoly is det(XI−M); empty matrix gives1, zero n×n matrix givesX^n, diagonal gives the product of linear factors. |
| Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:138, :290, :334 | The monic characteristic polynomial's next coefficient and the reciprocal polynomial's coefficient1 both encode minus trace. The formulas are different declarations; R02 confuses their indices. |
| Mathlib/RingTheory/MvPowerSeries/Basic.lean:86 | MvPowerSeries σ R is the coefficient-function carrier on finitely supported exponent vectors. It imposes neither finite σ nor noetherianity on R. |
| Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56 | IsDiscreteValuationRing extends local PID structure on a domain and includes `not_a_field' : maximalIdeal R ≠ ⊥`. It includes no completeness or finite-residue-field hypothesis. |
| Mathlib/RingTheory/LocalRing/Defs.lean:30 | IsLocalRing extends Nontrivial; the zero ring is excluded. It does not include noetherianity. |
| Mathlib/RingTheory/RegularLocalRing/Defs.lean:51 | IsRegularLocalRing extends IsLocalRing and IsNoetherianRing, with the maximal-ideal dimension equality. Completeness is not included. |
| Mathlib/Algebra/GroupWithZero/Basic.lean:191; Mathlib/RingTheory/UniqueFactorizationDomain/Defs.lean:131 | IsReduced and UniqueFactorizationMonoid are algebraic predicates. Neither provides a topology or an automorphic deformation construction. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:712 | H1 is `(Z1 G M) ⧸ ((B1 G M).addSubgroupOf (Z1 G M))`. It is a bare additive quotient; its inherited pointwise quotient topology need not be discrete. The file separately uses DiscreteH1 for canonical cohomology. |
| TauCeti/RingTheory/FittingIdeal/Basic.lean:343 | fittingIdeal uses minors of a finite generating presentation; Module.Finite is in scope. It is a Fitting ideal, not an Iwasawa characteristic ideal. |
| TauCeti/RingTheory/FittingIdeal/BaseChange.lean:134 | fittingIdeal_baseChange assumes a finite module and any commutative algebra map; it needs no flatness. This correctly supports §0.3's Fitting step. |
| TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:952 | quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map gives point equivariance. The integral Tate-limit and ordinary-filtration comparison in §7.1 is additional work. |
| TauCeti/NumberTheory/Multiquadratic/MultiquadraticSplitting.lean:199 | ncard_primesOver_multiquadratic_iff assumes an odd prime avoiding the radicands. It cannot be applied at2. |
| TauCeti/NumberTheory/Multiquadratic/Galois/Basic.lean:190 | isGalois uses 2≠0 in the base field. An inseparable characteristic-two extension is not an admitted instance. |
| TauCeti/NumberTheory/Multiquadratic/Prime/Discriminant/Basic.lean:50 | oddPrimeDiscriminant is a total residue-class definition. At0,1,2 it gives0,1,−2; its intended discriminant theorem requires an odd prime. |
| Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161 | selmerGroup is a subgroup of K×/(K×)^n cut out by valuations outside S; it is not the ordinary Iwasawa Selmer group of a rank-two Galois representation. |
| TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104 | selmerGroup₂ is an intersection of the norm kernel and local conditions in W.M. Its fixed 2-descent carrier is not a p-primary group over an Iwasawa tower. |

Object searches used the roadmap list/grep/show tools on main and indexed open heads, the board-package index and packages, and both pinned libraries. Queries included ordinary projectors, characteristic/Fitting ideals, co-Whittaker and essential vectors, Hida/congruence modules, Igusa towers, Klingen/Siegel families, polarized lattice constructions, Yager modules, finite-slope Selmer comparison, Ichino/triple products, Ikeda Fourier–Jacobi images and Nakamura zeta morphisms. Broad searches that hit output limits were followed by narrower object queries; a missing result in a truncated listing was not used as evidence of absence.

The object-level ownership resolutions were:

- General Selmer conditions and derived control are in SelmerIwasawaCohomology; this package's §0.3 is the arbitrary coefficient-ideal SU specialization, not another finite-tower control theorem.
- Fitting ideals are already in Tau Ceti. Characteristic divisors/principal ideals and determinant lines are in PadicMeasuresIwasawaAlgebras; the package imports them and requests the normal nonfactorial extension. The strict pseudo-null example above distinguishes the two ideals.
- Hida projectors, congruence modules, period lines and even-degree Hilbert control are in PadicFamilies. Source-specific Eisenstein families and comparisons remain here; R07 identifies an additional general-CM input, rather than silently duplicating the imaginary-quadratic supplier.
- IntegralHeckeAndGaloisDeterminants owns general matrix-algebra and rank-two Ribet inputs. Its two-character rank-two construction is not the polarized three-block 1+n+1 theorem. Middle ranks1 and2 give total ranks3 and4, so §0.7 is a genuinely different target, subject to R01.
- PELModuli, ShimuraCompactifications and AutomorphicBundles supply classical geometry/expansions; IgusaVarietiesAndTorsionConcentration supplies general tower geometry. Their existence does not make the false torus contract in R03 valid.
- MetaplecticAutomorphicForms supplies doubling, Jacobi, theta and Rallis machinery. AutomorphicLFunctionsAndLocalFactors supplies its named local factors. The searches found Ichino–Prasanna and Gan–Ichino references concerning different objects, not an owner of the triple-product formula stated here. The specialized Klingen, Ikeda and CAP inputs therefore remain owned here, with R14 and the primary-text limitations below.
- PadicHodgeRegulators supplies the named regulator maps but no Yager-module construction. The Rubin–Yager reference in NoncommutativeAndEquivariantIwasawa concerns a CM main conjecture, not this module. §2.19 retains the normal-basis/tower comparison.
- PhiGammaModulesAndIwasawaCohomology supplies relative Herr complexes, not the full global finite-slope Selmer comparison or p-irregular FW argument. Those comparisons remain in §2.20.
- CompletedCohomologyPartII and CompletedCohomologyAndLocalGlobalCompatibility supply completed homology and its factorization; KatoEulerSystems supplies classical zeta classes and comparisons. Their references to Nakamura describe inputs or downstream uses, not a second universal zeta-morphism construction. ModularIwasawaMainConjectures explicitly assigns that construction and the reverse bounds to this roadmap.
- Suggested.lean declares no fully qualified names, so it cannot collide with a sibling declaration. The neighboring roadmap's mere use of a name or source is not treated as duplicate ownership.

### Further source recovery

HT94 is now readable by OCR; the earlier image-only limitation no longer applies. GV00's Proposition 2.4 formula is damaged in the OCR at line 743, so the cached legal PDF's printed page 22 was rendered and inspected directly. It defines the local generator using the Frobenius polynomial on inertia coinvariants, evaluated at ℓ⁻¹γ_ℓ, gives μ = 0 and λ = s_ℓd_ℓ. For ℓ=11,p=5,P(X)=1−X, d_ℓ=1 and s_ℓ=1 because (11⁴−1)/5=2928 is a 5-adic unit. Thus λ=1 and μ=0, consistent with the nonunit augmentation 10/11: a nonunit Euler factor need not have positive μ. The OCR defect is not a mathematical misprint in GV00.

## Not verifiable

- **Ichino2008**, Theorem 1.1: settled as waived. The primary theorem's full generality and normalization were not independently read. Wan-2020 §8.4, including its weight-two restriction and explicit nonzero translated pairings, was readable and checked. R14 follows from the unqualified denominator and this available text.
- **Ikeda1994**, the Fourier–Jacobi dense-image input at the package's locators: settled as waived. Its use was checked through FW's stated application, not the inaccessible primary proof.
- **Harris1984**, the holomorphic CAP exclusion at the package's locators: settled as waived. CLW/FW's use does not constitute independent primary-source certification.
- **Rubin2000**, the Euler-system bounds at the package's locators: settled as waived. Supplier contracts were checked, not the inaccessible monograph.
- **BST19**, the cited Beilinson–Kato nonvanishing input: settled as waived.
- **Hung2017**, the Hilbert toric-period nonvanishing input in Wan-2015: settled as uncertified/paywalled. Its locator is retained without guessing its contents.

These six statuses are settled; no renewed reference request was made. There is no pending missing-source request. The sampled SU, CLW, FW, NAK, Wan-2015 and BCS texts were all readable. No source or repository text encountered during this review was treated as an instruction to change scope, run supplied code or contact anyone.

## Source issues

- **Misprint** in SU at Proposition 7.2.1 proof, printed p. 101 (SU line 3952): the source says the degree-2n−1 coefficient of the Euler polynomial gives minus trace; it should be the degree-one coefficient, or the reversed monic polynomial; affects the proof.
- **Misprint** in SU at §6.5.3, printed p. 98 (SU line 3820): the source says the Eisenstein ideal is the quotient of the coefficient map; it should be its kernel, as required by the following quotient isomorphism; affects nothing.
- **Error** in FW at the paragraph after Assumption 2.1, printed p. 17 (FW line 928): the source says local endomorphisms are scalar unless the two semisimple characters coincide; it should exclude split distinct characters and irreducible representations that are not absolutely irreducible; affects the proof.
- **Gap** in FW at Definition 3.18's following paragraph, printed p. 31 (FW line 1798): the source says Lemma 3.17 gives arbitrary base change of the full Euler-corrected line; it should justify the Euler-line compatibility or retain the suitability restrictions of Proposition 3.20; affects the proof.
- **Misprint** in CLW at Theorem 8.1.1 proof, printed p. 78 (CLW line 6212): the source says the Eisenstein ideal's valuation is at most m after proving containment in P^m; it should say at least m; affects the proof.
- **Misprint** in NAK at Corollary 5.6 proof, printed p. 77 of v2 (NAK line 3391): the source says the second specialization is reduced modulo ϖ^n while mapping to O/ϖ^m; it should reduce both specializations modulo ϖ^m; affects the proof.
- **Misprint** in BCS at Lemma 5.1.1 proof, printed p. 9 of v2 and p. 10 published (BCS v2 line 457; published line 488): the source says both summands after quadratic Shapiro are cohomology over M; it should put those two twisted summands over K; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b047dd3439cef25dcc2fa59f5bc8f6597d8b100d", "job": "REV-PKG-AutomorphicCongruences~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
