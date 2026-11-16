# Review of LocalLanglandsCorrespondenceForG2 (pull request #2458 at 038ac84)

**Verdict:** needs changes

## R01 (P2) — Xu's packets are not defined over unbounded parameters, where §§10.8–10.9 use them

**Location:** `TauCetiRoadmap/LocalLanglandsCorrespondenceForG2/README.md` line 1224 (§10.8): "constancy on each of Xu's tempered induced packets and on each of Xu's nontempered Langlands-quotient packets"; line 1234 (§10.9): "every fibre of L_w is a union of Xu packets".

**Claim:** §10.9 is stated on all of Irr(PGSp₆(F)). Neither this README nor the cited supplier defines a Xu packet over an unbounded parameter outside Φ⁺_unit, so the statement has no meaning for the nontempered representations it covers.

**Witness:** σ = the trivial representation of PGSp₆(F): exponents ±3, ±2, ±1 (§2.0, Checks). ModularityAndLanglandsExtensions §3.19 at its open head (its README lines 2089–2095) defines the packets for bounded φ and extends them to Φ⁺_unit only.

**Repair:** In §10.8, before "prove that", add: "For a parameter φ♭ of Sp₆ (§2.0) that is not bounded, with Langlands data M ≅ GL_(n₁) × ⋯ × GL_(n_r) × Sp_(2n₀), ν₁ > ⋯ > ν_r > 0, φ₁, …, φ_r, φ₀, define a Xu packet over φ♭ as the set of Langlands quotients of the normalized inductions, from the standard parabolic subgroup of PGSp₆ whose Levi subgroup is the image of GL_(n₁) × ⋯ × GL_(n_r) × GSp_(2n₀), of rec⁻¹(φ₁)|det|^(ν₁) ⊗ ⋯ ⊗ rec⁻¹(φ_r)|det|^(ν_r) ⊗ τ̃₀, τ̃₀ running over one of Xu's packets of GSp_(2n₀)(F) over φ₀ (ModularityAndLanglandsExtensions §3.19, n₀ ≤ 2; one character when n₀ = 0) whose central character makes the tensor product trivial on the centre. Prove that these sets partition the representations whose restriction has parameter φ♭ and are permuted transitively by the quadratic twists." Add the Check: "over the parameter of the trivial representation the packets are the singletons {χ ∘ sim}, χ quadratic, and L_w(χ ∘ sim) = χ · L_w(1)." On the witness: r = 3, n₀ = 0, the central condition gives τ̃₀ = |·|⁻³χ with χ² = 1, and the Langlands quotient is χ ∘ sim.

## R02 (P3) — §9.1 transfers a lift on PGL₂(D) "by Jacquet–Langlands" where only the inner-form parameter is available

**Location:** `TauCetiRoadmap/LocalLanglandsCorrespondenceForG2/README.md` line 1090 (§9.1): "where τ is the lift to PGL₄ or PGL₂(D), transferred to PGL₄ by Jacquet–Langlands"; *Needs* lines 1102, 1106 and 1183 cite §§4.7a, 10.30 only.

**Claim:** The lift to PGL₂(D) need not be essentially square-integrable, and §4.7a transfers only such representations. The parameter is the inner-form parameter of §10.31, as the pgsp6-lower-tower-parameters contract (line 93) already says; §§9.1, 9.2 and 10.4 do not cite it.

**Witness:** EndoscopicTransferAndUnitaryTraceComparison at its open head: §4.7a (its README line 1873) is for essentially square-integrable representations; §10.31 (line 4225) defines the parameter from standard data and asserts no general Jacquet–Langlands identity. Instance: the irreducible induction of χ₁ ∘ Nrd ⊗ χ₂ ∘ Nrd on GL₂(D).

**Repair:** In §9.1 replace the clause by: "where τ is a constituent on PGL₄(F), respectively PGL₂(D), of the lower-tower lift and φ_τ is rec(τ) (§10.30), respectively the inner-form parameter of τ (§10.31), determined up to φ_τ ↔ φ_τ∨". In §10.4 replace "(with the reduced norm on GL₂(D) before Jacquet–Langlands)" by "(on PGL₂(D) the twist by χ ∘ Nrd multiplies the inner-form parameter by χ, block by block, by §4.7a)". Add EndoscopicTransferAndUnitaryTraceComparison §10.31 to the *Needs* of §§9.1, 9.2 and 10.4 and to the Dependencies of Layers 9 and 10. On the instance: φ_τ = χ₁ ⊠ S₂ ⊕ χ₂ ⊠ S₂, of dimension 4 and determinant (χ₁χ₂)² = 1, and the twist gives χχ₁ ⊠ S₂ ⊕ χχ₂ ⊠ S₂.

## Deferred findings

- D01 — stands

## Previous findings

The previous review (of this same head) raised no finding of its own. Its carried lines:

- R01 — not repaired: deferred (D01)
- R02 — repaired: line 1214 reads "hence X ⊂ Irr♠ ∪ Irr♣, and all σ ∈ X have the same SpinLift parameter (φ_τ ⊗ χ) ⊕ (φ_τ ⊗ χ)∨ and the same L_w".

## Verified sound

| Statement | Instances tried | Values computed | Other side | Result |
| --- | --- | --- | --- | --- |
| §0.3 (sample) | principal φ; subregular φ; quotient by μ₂ | 1 ⊕ Sym⁶: invariants of dimension 1. Subregular: 1 ⊕ 1 ⊕ Sym² ⊕ Sym², pole order 2, inside the Levi GL₃ | GS Lemma 2.4(ii), p. 9 (GS lines 407–414); §8.3, p. 24 (GS line 1004) | holds |
| §0.9 (sample) | Sym⁶ of a newform; direction (ii) ⇒ (i) | Sym⁶ of diag(t, t⁻¹) has eigenvalues t⁶, …, t⁻⁶ = v on the principal torus; (ii) ⇒ (i) is immediate at unramified places | C Theorem E, p. 100 (C lines 235–243); Corollary 6.8, pp. 150–151 (C lines 2282–2314): same hypotheses | holds |
| §1.3 (sample) | S = ∅; St ⊕ ⨁ 1; twisted against untwisted space | S = ∅: constants. f(n) = −1 against +1 when ψ_v(n) = −1 | SV Theorem 16.3.2 (SV line 11075) gives Fell limits with no control of sphericity; that control is the declared contract (ILM pp. 19–20, ILM lines 959–983) | consistent |
| §1.6 (sample) | (i) against the source; (ii) over a totally complex field | (i) leaves one finite place open, #({z} ∖ S) = 1 | GS Proposition 10.7, pp. 29–30 (GS lines 1223–1237): spherical at all but one place | holds; (ii) rests on the contract |
| §2.3 (sample) | Σ the lift of a G₂ form; no Steinberg place | s ∘ i = 1 ⊕ v gives the factor X − 1 and SpinLift = 1 ⊞ A, ranks 1 + 7; without Steinberg, ζ^S(s) gives a pole of the standard L-function | GS §4.3, pp. 17–18 (GS lines 737–747) asserts the local components with no genericity hypothesis | README narrower, with reason |
| §3.2 (sample) | St; trivial representation; D and its opposite | St ↦ Sym⁶. v ∘ L(1): Frobenius eigenvalues q⁻³, …, q³, N = 0. j ∘ φ_τ and j ∘ φ_τ∨ conjugate | GS §3.1, pp. 10–11 (GS lines 437–460) | holds |
| §3.3 (sample) | τ = St with both signs; τ ≇ τ∨ | θ(St⁺) = π_gen[1] and θ(St⁻) = π_sc[1], both ↦ the subregular parameter | HD Theorem 8.5, pp. 27–28 (HD lines 1017–1038); GS §3.2, p. 11 | holds |
| §3.4 (sample) | τ = St_PGL₃ | Sp₆-parameter 1 ⊕ Sym² ⊕ Sym² = v ∘ j(Sym²), dimensions 1 + 3 + 3 | HD Theorem 15.2(iii), pp. 52–53 (HD lines 2021–2031) | holds |
| §3.8 (sample) | three distinct quadratic characters with product 1; the trivial character | No root lies in 2X*(T) and the Weyl stabilizer of T[2] is {±1}: S_φ = ℤ/2, two constituents. Trivial character: S_φ = 1 | GS §3.4, p. 12 (GS lines 528–535); HD Theorem 8.2(iii) (HD lines 928–931) | holds, every p |
| §3.12 (sample) | St × 1; ψ ↦ ψ_a | γ(s, Sym⁶, ψ); multiplier det(φ_τ)(a)⁷ ∣a∣^(7r(s−1/2)) on both sides | GS Main Theorem (ix), p. 4 (GS line 174); p. 13 (GS line 578) | holds |
| §3.14 (sample) | St_G₂; Irr♠ with the dual parameter | Diagram (b) gives Sym⁶, and §0.4 forces the principal parameter; diagram (a) is defined up to a conjugate pair | GS Main Theorem (v), p. 4 (GS line 145), uses (i)–(iv) | holds from (iv) alone |
| §5.2 (sample) | St; twist by the unramified quadratic χ | Principal: q = Sym⁶, s = 1 ⊕ Sym⁶. χ · φ̃ has spin trace −8, not 8: not a member | GS Proposition 5.1, p. 20 (GS lines 839–861) | holds |
| §5.3 (sample) | π = St_G₂; π_gen[1] | χ ⊗ (1 ⊕ Sym⁶) ≅ 1 ⊕ Sym⁶ forces χ = 1: one class. π_gen[1] has a non-discrete lift and is excluded | GS Proposition 5.2, pp. 20–21 (GS lines 863–882) | holds |
| §9.1 (sample) | dimensions; τ ↔ τ∨; a lift on PGL₂(D) that is not square-integrable | 4 + 4 = 8; φ_τ ⊕ φ_τ∨ symmetric; χ₁ ∘ Nrd × χ₂ ∘ Nrd has no transfer under §4.7a | GS §§12.2–12.3, pp. 34–36 (GS lines 1454–1509) | R02 |
| §10.6 (sample) | σ = St; a second member σ′ of X | X = {St}. σ′ has the same φ♭, with no trivial summand, so by §9.2 σ′ ∉ Irr♠ ∪ Irr♣ and §8.1 applies to it | GS pp. 39–40 (GS lines 1644–1675) | holds; the route leaves this step implicit |
| §§10.8–10.9 | trivial representation of PGSp₆(F) | Exponents ±3, ±2, ±1, outside Φ⁺_unit. The representations over φ♭ are the χ ∘ sim, with L_w(χ ∘ sim) = χ · L_w(1) | ModularityAndLanglandsExtensions §3.19: bounded φ and Φ⁺_unit | R01 |
| `griess_conjugacy` (headline) | Γ = 1; Γ = ℤ/5 with t, t²; 2 · id | g = 1. Multisets {1, ζ, ζ, ζ³, ζ⁴, ζ⁴, ζ²} and {1, ζ², ζ², ζ, ζ³, ζ³, ζ⁴}: no intertwiner. 2(1 · 1) = 2 ≠ 4 | Elaborated type equals §0.0. C p. 149 (C line 2239) and HKT p. 22 (HKT line 913) use it for an arbitrary Γ | holds; Griess's text unread |
| `spin7_not_acceptable` (headline) | weights in (ℤ/4)² | V: (1,0), (1,2), (0,1), (2,1), sum (4,4). ηV: (1,2), (1,0), (0,3), (2,3). V∨: (3,0), (3,2), (0,3), (2,3) | CG Example 1 and Corollary 4.8, pp. 13–14 (CG lines 489–507) | holds |
| `spin7_not_acceptable_weilGroup` (headline) | r = η = 1; F = ℚ₅, ℚ₃ | The trivial pair is refuted by g = 1. ℚ₅×/ℚ₅×⁴ ≅ (ℤ/4)²; ℚ₃×/ℚ₃×⁴ has order 8 < 16 | CG Proposition 8.3, pp. 32–33 (CG lines 1232–1252): η = sgn_(E/F), finite image | holds |
| §7.1 (headline) | principal, subregular, trivial, non-self-dual A₂ parameter | Fibres of size 1, 3 (∣Irr S₃∣ = 3, ∣S₃∣ = 6), 1, 3 (μ₃, p ≠ 3) | GS Main Theorem, pp. 3–4 (GS lines 103–176) | holds |
| §7.2 (headline) | π_sc[1]; St_G₂ | Supercuspidal, nongeneric, SL₂ nontrivial; generic, not supercuspidal | HD Theorem 8.5(iii)–(iv) (HD lines 1023–1025) | holds |
| §10.1 (headline) | St; unramified quadratic twist | Class of the principal parameter; spin trace 8 ↦ −8 with the standard trace 7 fixed | GS Theorem 12.6, p. 38 (GS lines 1598–1613) | holds |
| §1.7, weights | t = 1; t = 0 | h = (11, 6, 3): ±10, ±7, ±4, ±1. t = 0: (3 − 2 − 1)/2 = 0 twice | GS Lemma 12.4, p. 37; Shin Corollary 4.12, p. 24 | holds |
| §2.4, normalization | F = ℚ₅, s = 2, a = 5 | (1 − 5⁻²)/(1 − 5) = −6/25; eighth power (6/25)⁸; multiplier 5^(−8·3/2) = 5⁻¹² | Checks of §2.4 | agree |
| §3.11, direction | ζ at s = 2 | Γ_ℝ(−1) = −2π, Γ_ℝ(2) = π⁻¹, γ_∞(2) = −2π², −2π² · (−1/12) = π²/6 | GS p. 18 (GS lines 768–770) and GF p. 5 (GF lines 199–204) print the inverse | README form correct |
| §3.11, real factor | λ = 0 on compact G₂ | Long coroots b∨, a∨ + b∨, a∨ + 2b∨ pair with ρ to 1, 2, 3; det of the three inductions and sgn is sgn⁴ = 1 | Check of §3.11 | agree |
| §6.7, Check | φ through (SL₂ × SL₂)/μ₂ | v ∘ φ = (ρ ⊠ S₂) ⊕ S₃; centralizer in SO₇ is {(±1, 1)}; S_φ = ℤ/2 ≤ (ℤ/2)^(k−1), k = 2 | Check of §6.7 | agree |
| §§0.0, 1.1, octonion Checks | u, u′, w at the pinned product | uu′ = ⟨0, 0, 0, e₃⟩; (uu′)w = ⟨0, 0, −e₂, 0⟩; u′w = 0 | `TauCeti/Algebra/Octonion/Basic.lean` lines 279–281 | agree |

- Source locators checked against the text: 78 (GS 41, CG 10, GF 8, HD 5, C 4, KS 3, SV 2, Shin 2, HKT 1, ILM 1, MagaardSavin 1). All on the stated pages.
- Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d): 31, all present. Among them `spinGroup` (`Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:293`, a `Submonoid` of the Clifford algebra, with no topology), `Representation.IsSemisimpleRepresentation` (`Mathlib/RepresentationTheory/Semisimple.lean:34`, complemented lattice of subrepresentations), `TauCeti.Octonion` (`TauCeti/Algebra/Octonion/Basic.lean:143`), `TauCeti.ClassFieldTheory.instTopologicalSpaceWeilGroup` (`TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Topology.lean:78`).
- Cross-roadmap citations resolved at main (fb3f1e1) or the open heads: 96, none missing. ExceptionalThetaCorrespondencesForG2 34, ModularityAndLanglandsExtensions 9, SmoothRepresentationsOfLocalGroupsPartII 11, EndoscopicTransferAndUnitaryTraceComparison 8, MetaplecticAutomorphicForms 6, AutomorphicLFunctionsAndLocalFactors 5, roadmaps on main 16, others 7.
- Gate at 038ac84: every check passes. Nothing is changed outside the folder. Dependency check: `depcheck: 263 roadmaps, 2577 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: three `declaration uses sorry` warnings (lines 124, 143, 158), no error. `#check @` of the three theorems agrees with README §§0.0 and 0.8; no binder is lost.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`, `tauto`, `exact ⟨1, fun _ => by simp⟩`) closes none of the three theorems: no padding. Every README headline that is not stated is named in the module docstring with the carrier it lacks.
- Pull request text against the head: no sentence is contradicted; the eleven open suppliers of the README are the eleven listed.
- Declared gaps: 28 contracts in the README, 27 slugs in `design/plan.json`; the difference is D01.

Overlap check: read ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, ModularityAndLanglandsExtensions, TwistedAutomorphicDescents, GanGrossPrasadUnitaryGroups, AutomorphicFormsOnReductiveGroups, SpinRepresentations; nothing shared. ExceptionalThetaCorrespondencesForG2 (its §1.9 and Downstream consumers) assigns the complete G₂ parametrization to this roadmap and declares no Lean name; Griess's theorem, the unacceptability of Spin₇ and the classification of octonion algebras by norm forms are stated in no other roadmap, open or on main.

Source independence: 31 passages compared with 11 sources, none shared beyond forced phrases (longest run 9 words, "does not factor through a proper Levi subgroup of", GS line 106); largest share GS, about 116 of 185 locators; contents compared with GS: independent (Layer 1 ↔ §10 and §12.5, Layer 2 ↔ §4, Layer 3 ↔ §§3.1–3.4 with GF §2, Layers 8–10 ↔ §12 in the order 12.5–12.6, 12.2–12.4, 12.7–12.8; the run Layers 3–7 is forced by the *Needs* of §§4.2, 5.3, 6.1 and 7.1).

## Not verifiable

- Griess, Theorem 1 (§0.0 and `griess_conjugacy`): recorded as uncertified (paywalled); the text was not read. Its use for an arbitrary group with completely reducible image was read in C (line 2239) and HKT (line 913).
- SpV, Theorems 1.7.1 and 1.8.1 and §1.5 (§1.1(i)–(iii)): recorded as uncertified (Springer monograph); the text was not read.

## Source issues

- **Gap** in GS at proof of Theorem 12.7(ii), p. 39: the source says the fibres inside the lower-tower loci are handled along similar lines and leaves them to the reader; it should be argued separately, since members of Irr♠ have zero lift to split PGSO₈; affects the proof.
- **Gap** in GS at proof of Theorem 12.7(ii), p. 40: the source says the global lift of the representation with the substituted component is nonzero as in Lemma 12.5; it should first show that the substituted member lies in the heart locus; affects the proof.
- **Misprint** in GS at proof of Proposition 4.1(i), p. 18: the source puts the partial L-function at 1 − s of the contragredient alone on one side; it should stand on the side of the product of gamma factors; affects nothing.
- **Gap** in GS at proof of Proposition 4.1(i), p. 18: the source takes all finite places outside the prescribed ones spherical, citing Proposition 10.7; that proposition leaves one finite place uncontrolled; affects the proof.
- **Gap** in GS at proof of Proposition 4.1(i), p. 18: the source fixes one global additive character with the given local character at every prescribed place; it should use a change-of-character rule, such components being constrained; affects the proof.
- **Misprint** in GS at Main Theorem (ix), p. 4: the source closes the parenthesis before the tensor product with the parameter of the general linear group; it should close after it, as on p. 13; affects nothing.
- **Misprint** in GS at §3.3, p. 11: the source says the totally definite octonion algebra is over the local field; it should be over the number field; affects nothing.
- **Misprint** in GS at §4.4, p. 19: the source says the displayed identity is for representations of the exceptional group; it should be for representations of PGSp₆; affects nothing.
- **Misprint** in GF at Theorem 2.4(ii), p. 5: the source puts the partial L-function at 1 − s of the contragredient alone on one side; it should stand on the side of the product of gamma factors; affects nothing.

## For the human reviewers

- Griess (Theorem 1) and SpV (Theorems 1.7.1, 1.8.1, §1.5) are cited by locator only (manifest: uncertified). `griess_conjugacy` (`Suggested.lean` line 124) and README §1.1(i) rest on texts this review did not read.
