<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/134#issuecomment-6353449611 -->
Red team round 2 pass b (claude) of add3164

Verdict: needs_changes

1. **F01** (P2) Two Cartan headlines are statable at the pins but absent, and the docstring gives a wrong reason

   **Location:** `packages/EllipticCurveModularityPartII/Suggested.lean:22`–`:25`: “The Cartan correspondence, winding quotient, formal immersion and integrality headlines lack the modular curves with their moduli/j maps, modular Jacobians with integral Hecke quotients, and their canonical integral models.”; `README.md:521` (6.6) and `README.md:537` (6.8).

   **Claim:** The statements of 6.6 (Lemos, Proposition 2.1: rational cyclic r-isogeny, r ∈ {2,3,5,7,13}, mod-p image in a nonsplit Cartan normalizer, p outside the set, hence j(E) ∈ ℤ) and 6.8 (Lemos, Theorem 2.3: non-CM, p > 37, proper image lies in a nonsplit Cartan normalizer) mention no modular curve, Jacobian or integral model; only their proofs do. Every carrier they need exists at the pins or in the file: `WeierstrassCurve.j` (Mathlib, with `[IsElliptic]`), `HasCyclicIsogeny`, `NonCM`, `torsionRepresentation`, `E.torsionGaloisAction`. The one missing notion, “image contained in the normalizer of a nonsplit Cartan subgroup”, is a simple real-bodied predicate on `Module.End (ZMod p) (GeometricTorsion E p)`: a subring that is a field with p² elements and is normalized under conjugation by every Galois element (its unit group is a nonsplit Cartan, and normalizing the subring as a set is normalizing its unit group). The file therefore omits two statable headlines and names a missing carrier they do not need.

   **Witness:** a probe copy of `Suggested.lean` with the definition and the two theorems below appended elaborated with exit 0 and only `declaration uses 'sorry'` warnings; Lemos2017 line 136 (Proposition 2.1) and line 223 (Theorem 2.3) state exactly these hypotheses.

   **Exact repair text:** in `Suggested.lean`, under `/-! ## Layer 6: rational-isogeny uniformity -/` after `HasCyclicIsogeny`:
   ```lean
   /-- The image of the mod-p representation lies in the normalizer of a nonsplit Cartan
   subgroup: some subring of the 𝔽_p-endomorphisms of geometric p-torsion is a field with
   p² elements, and every Galois element normalizes it under conjugation. -/
   def ImageInNonsplitCartanNormalizer (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ)
       [Fact p.Prime] : Prop :=
     ∃ C : Subring (Module.End (ZMod p) (GeometricTorsion E p)),
       IsField C ∧ Nat.card C = p ^ 2 ∧
         ∀ σ, ∀ c ∈ C,
           torsionRepresentation E p σ * c * torsionRepresentation E p σ⁻¹ ∈ C

   /-- Lemos, Proposition 2.1: a rational cyclic r-isogeny for r in {2,3,5,7,13} and a
   mod-p image inside a nonsplit Cartan normalizer, p outside that set, force an integral
   j-invariant. -/
   theorem lemos_integral_j (E : WeierstrassCurve ℚ) [E.IsElliptic] (r : ℕ)
       (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ)) (hisog : HasCyclicIsogeny E r)
       (p : ℕ) [Fact p.Prime] (hp : p ∉ ({2, 3, 5, 7, 13} : Finset ℕ))
       (hns : ImageInNonsplitCartanNormalizer E p) :
       ∃ m : ℤ, E.j = m := by sorry

   /-- Lemos, Theorem 2.3: for a non-CM curve and p > 37, a proper mod-p image lies in a
   nonsplit Cartan normalizer. -/
   theorem nonsplit_of_not_surjective (E : WeierstrassCurve ℚ) [E.IsElliptic] (hCM : NonCM E)
       (p : ℕ) [Fact p.Prime] (hp : 37 < p)
       (h : ¬ Function.Surjective (E.torsionGaloisAction (K := AlgebraicClosure ℚ) (p : ℤ))) :
       ImageInNonsplitCartanNormalizer E p := by sorry
   ```
   In the module docstring replace the sentence quoted above by “The Cartan correspondence, winding quotient and formal immersion headlines lack the modular curves with their j maps, the modular Jacobians with integral Hecke quotients, and their canonical integral models.” In `README.md:521` and `:537` name `lemos_integral_j` and `nonsplit_of_not_surjective`; in 6.6 or 6.15 define `ImageInNonsplitCartanNormalizer` in prose with three Checks (the normalizer of order 2(p²−1) at p = 11 satisfies it; the full group GL₂(𝔽_p) fails it; a split Cartan normalizer fails it because its diagonal subring is not a field).

2. **F02** (P2) Four declared gaps have compound or vague `needs`

   **Location:** `packages/EllipticCurveModularityPartII/README.md:62`: “Supply arithmetic and residual Artin conductors and Serre weight for E/ℚ, the away-from-ℓ deletion formula for ℓ≥5, and the coefficient-prime weight-two reduction alternative for irreducible E[ℓ] when ℓ≥11.”; `:64`: “…the absolute-irreducibility consequence of irreducibility, and the subgroup classification and inertia-order bounds used in Lemos Theorem 2.3.”; `:66`; `:70`.

   **Claim:** A declared gap is a single statement with its hypotheses. `conductor-and-weight` bundles three theorems (conductor and weight definitions; the away-from-ℓ formula; the weight-two reduction alternative), `oddness-and-finite-images` four (complex conjugation; absolute irreducibility; Dickson's classification; Serre's inertia bound), of which “the subgroup classification and inertia-order bounds used in Lemos Theorem 2.3” names no statement at all; `newform-residual-and-conductor` bundles residual representations with the conductor of the modular abelian variety; `modular-curves-and-jacobians` bundles normalizations, j maps, Jacobians, Hecke correspondences and the newform quotient. Round-1 pass a F06 asked for one statement per contract; the fix kept the bundles, in `README.md` and in `design/plan.json` alike.

   **Witness:** the four `needs` sentences at `README.md:62`, `:64`, `:66`, `:70`, each with two or more independent conclusions; the `gaps` list of `design/plan.json` carries the same sentences.

   **Exact repair text:** replace the four gaps by the following, in `README.md` and in the `gaps` list of `design/plan.json` (same slugs), and repoint each `*Needs:*` or `### Dependencies` line that names an old slug (`README.md:345`, `:361`, `:404` for conductor-and-weight; `:431`, `:439`, `:470`, `:483`, `:539` for oddness-and-finite-images; `:299` for newform-residual-and-conductor; `:299`, `:491`, `:621`, `:665` for modular-curves-and-jacobians) to the new slug(s) it actually uses:

   What ArithmeticGaloisRepresentations must provide (gap:elliptic-conductor-and-weight): For E/ℚ and an odd prime ℓ, the arithmetic conductor M of E, the prime-to-ℓ Artin conductor N(E[ℓ]) and the Serre weight of E[ℓ].

   What ArithmeticGaloisRepresentations must provide (gap:residual-conductor-away-from-ell): For a prime ℓ ≥ 5 and a prime q ≠ ℓ, the exponent of q in N(E[ℓ]) equals its exponent in M, except that it is 0 when q ∥ M and ℓ | ord_q(Δ).

   What ArithmeticGaloisRepresentations must provide (gap:weight-two-reduction-alternative): For a prime ℓ ≥ 11 and E[ℓ] irreducible of Serre weight 2, E has good reduction at ℓ, or multiplicative reduction at ℓ with ℓ | ord_ℓ(Δ).

   What ArithmeticGaloisRepresentations must provide (gap:complex-conjugation-on-torsion): For an odd prime ℓ, complex conjugation acts on E[ℓ] with determinant −1 and eigenvalues 1 and −1.

   What ArithmeticGaloisRepresentations must provide (gap:odd-irreducible-absolutely-irreducible): For an odd prime ℓ, an irreducible two-dimensional 𝔽_ℓ-representation of the absolute Galois group of ℚ on which complex conjugation has the two eigenvalues 1 and −1 is absolutely irreducible.

   What ArithmeticGaloisRepresentations must provide (gap:dickson-classification): For a prime p ≥ 5, a subgroup of GL₂(𝔽_p) not containing SL₂(𝔽_p) lies in a Borel subgroup, in the normalizer of a split or nonsplit Cartan subgroup, or has projective image A₄, S₄ or A₅.

   What ArithmeticGaloisRepresentations must provide (gap:serre-inertia-exceptional-bound): For E/ℚ and a prime p > 37, the projective image of the representation on E[p] is not A₄, S₄ or A₅.

   What AutomorphicGaloisRepresentations must provide (gap:newform-residual-representation): For a primitive weight-two trivial-character newform f of level N and a prime λ of its coefficient field above ℓ, a two-dimensional residual representation whose arithmetic Frobenius at q ∤ Nℓ has characteristic polynomial T² − c_q T + q.

   What AutomorphicGaloisRepresentations must provide (gap:modular-abelian-conductor): For a primitive weight-two trivial-character newform f of level N with coefficient field of degree d, the associated modular abelian variety A_f has arithmetic conductor Nᵈ.

   What ModularCurvesPartII must provide (gap:mixed-modular-curves): For r > 0, p prime and gcd(r,p) = 1, the smooth projective normalizations of X₀(r) ×_{X(1)} X_{ns}⁺(p) and X₀(r) ×_{X(1)} X_{sp}⁺(p) over ℚ, with their j maps.

   What ModularCurvesPartII must provide (gap:mixed-modular-jacobians): For the same curves, their Jacobians over ℚ with the pull-push Hecke correspondences T_n for n prime to p.

   What ModularCurvesPartII must provide (gap:newform-quotient): For a primitive rational weight-two newform f of level N, the elliptic-curve quotient of J₀(N) attached to f, with conductor N and the residual representations of f.

3. **F03** (P3) Two Tau Ceti imports supply no used declaration; the README misplaces one module

   **Location:** `packages/EllipticCurveModularityPartII/Suggested.lean:2`–`:3`: “import TauCeti.NumberTheory.ModularForms.Newforms.Nebentypus / import TauCeti.NumberTheory.ModularForms.TrivialNebentypus”; `README.md:38`: “Consume `TauCeti.cuspFormsNew` and `cuspFormCharSpace` (NumberTheory/ModularForms/Newforms/Basic and TrivialNebentypus)”.

   **Claim:** The only declarations the file takes from the modular-forms library are `TauCeti.cuspFormsNew`, defined in `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:202`, and `cuspFormCharSpace`, defined in `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279`. Neither `Newforms.Nebentypus` nor `TrivialNebentypus` defines anything the file mentions; they only re-export the defining modules. The README names `TrivialNebentypus` as the home of `cuspFormCharSpace`, which it is not. (`README.md:36` likewise omits `Isogeny/Hom/Basic`, where the `MonoidWithZero` instance supplying `1` on `TauCeti.Isogeny.Hom W W` lives, line 325; `Hom/Add` is used for the integer action.)

   **Witness:** a probe copy with the two import lines replaced by `import TauCeti.NumberTheory.ModularForms.Newforms.Basic` and `import TauCeti.NumberTheory.ModularForms.DiamondOperators` elaborated with exit 0 and the same six `sorry` warnings; `#synth One …` on the Hom type resolves to `TauCeti.Isogeny.Hom.instMonoidWithZero…`.

   **Exact repair text:** lines 2–3 of `Suggested.lean` become
   ```lean
   import TauCeti.NumberTheory.ModularForms.Newforms.Basic
   import TauCeti.NumberTheory.ModularForms.DiamondOperators
   ```
   and `README.md:38` begins “Consume `TauCeti.cuspFormsNew` (NumberTheory/ModularForms/Newforms/Basic) and `cuspFormCharSpace` (NumberTheory/ModularForms/DiamondOperators) for `newDimension`.”; in `README.md:36` write “(AlgebraicGeometry/EllipticCurve/Isogeny/Basic, Degree, Kernel, BaseChange/Basic, Hom/Basic and Hom/Add)”.

4. **F04** (P3) Process narrative in the supplier contracts

   **Location:** `packages/EllipticCurveModularityPartII/README.md:54`: “Each gap names the required mathematical input and the owning supplier; it asserts no unverified section identifier.”; `:56`–`:80`, thirteen times: “(locator unavailable)”.

   **Claim:** “it asserts no unverified section identifier” and “(locator unavailable)” describe the author's search for a locator, not the mathematics; a reader a year from now learns only that something could not be found. The gap format is `What <Supplier> must provide (gap:<slug>): <needs>`; a section topic may follow, a status may not. The same parenthetical sits in all thirteen `section` fields of `design/plan.json`.

   **Witness:** `README.md:54` and the thirteen parentheticals at `:56`, `:58`, `:60`, `:62`, `:64`, `:66`, `:68`, `:70`, `:72`, `:74`, `:76`, `:78`, `:80`.

   **Exact repair text:** delete the sentence at `README.md:54` (keep “Each gap names the required mathematical input and the owning supplier.”); in each gap replace “Section: <topic> (locator unavailable).” by “Section: <topic>.”, and drop “ (locator unavailable)” from every `section` value in `design/plan.json`.

5. **F05** (P3) Two Lean definitions have no Checks of their own

   **Location:** `packages/EllipticCurveModularityPartII/README.md:218`: “The definitions `localTerms`, `martinValue` and `newDimension` give the arithmetic table, its five-product expression and the actual trivial-character newspace.”; `README.md:446`: “Use `GeometricTorsion` for the subgroup killed by n on E(ℚ̄), with `torsionModule` its natural ZMod n module.”

   **Claim:** `newDimension` has no `**Checks.**` list (the 1.10 Checks test the thresholds; the values of 12g⁺ sit in the Examples paragraph at `:230`), and nothing distinguishes it from the plausible wrong definition “the full Γ₁(N) newspace”. The three Checks at `:450`–`:452` cover `GeometricTorsion` and `torsionRepresentation`; none tests `torsionModule`.

   **Witness:** `README.md:216`–`:227` contains one Checks list, about F♯, G♯ and F_K; `README.md:448`–`:452`.

   **Exact repair text:** after `README.md:218` add
   ```
   **Checks.**

   - newDimension(1)=0 and newDimension(11)=1; the level-one newspace is zero and the level-11 one is spanned by the rational newform.
   - newDimension(13)=0, whereas the full weight-two Γ₁(13) newspace has dimension 2 (the genus of X₁(13)); the trivial-character intersection is essential.
   - newDimension(35)=3 and newDimension(30)=1, the two nonprime values of Layer 1's Examples.
   ```
   and after `README.md:452` add
   ```
   - On geometric two-torsion, (3 : ZMod 2) • P = P and (0 : ZMod 2) • P = 0, so the scalar action is the integer action read modulo n; on one-torsion the module is zero.
   ```

## Verified sound

**Head.** The board clone is at `add3164`; the package folder holds `README.md` (683 lines), `Suggested.lean` (167 lines), `sources.toml` (8 entries), `metadata.toml` (`topic = "math.NT"`), `design/plan.json` (13 gaps, slugs identical to the README's 13) and `reports/`.

**Read.** All 683 README lines (42 numbered subsections in six layers, 13 gaps, 10 definitions with Checks, Conventions, Downstream consumers, References) and all 167 Lean lines: 16 declarations (6 `theorem`, all `by sorry`; 3 `def` with real bodies, 3 `abbrev`/`def` carriers, 1 `instance`, 2 predicates, 1 `Representation` with proved laws). No `lemma`, `set_option`, `#eval`, `#synth`, `#print`, `True` placeholder or sorried data; single `import Mathlib`; namespace `TauCetiRoadmap.EllipticCurveModularityPartII`; layer comments in README order; every Lean name appears in the README (`:218`, `:258`, `:446`, `:454`, `:462`, `:641`, `:649`, `:657`), and no backticked own name in the README is undeclared.

**Elaboration.** The file as submitted elaborated in a probe copy of the review checkout (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, all seven imported object files present): exit 0, exactly six `declaration uses 'sorry'` warnings (lines 69, 74, 82, 130, 137, 162). A second probe appended `#check @` for all 16 declarations: every elaborated type carries the README's hypotheses (`NeZero N`, `IsElliptic`, `Fact ell.Prime`, `NumberField K`, `I.IsPrime`, `I ≠ ⊥`, the contraction to `(ell)`, `x ≠ 0`, the all-embedding bound, `5 ≤ ell`, `11 ≤ ell`, `NonCM`, `1 < n`, `37 < p`); no section variable exists to be dropped.

**One-tactic probe.** Each of the six `by sorry` was replaced by `first | (simp; done) | (norm_num; done) | sorry`: all six `sorry` warnings survived; none of the headlines is trivial. (`hI0 : I ≠ ⊥` in `norm_bound` follows from the contraction hypothesis since `ell ≠ 0`; a redundant hypothesis, noted, not a finding.)

**Round-1 repairs checked.** Pass a F01/F05/F06 (fictitious supplier, ownership, unverifiable sections): the supplier namespace is gone, every citation is to a roadmap on `main` or to a declared gap whose supplier sits above line 143 of the board's current `merge-order/ORDER.txt` (ArithmeticGaloisRepresentations 40, NeronModels… 46, ModularCurvesPartII 71, DeligneWeightsAndPurity 76, EulerSystems… 91, ModularSymbols… 104, EisensteinIdeal… 121, SerreWeight… 136, AutomorphicGalois… 138, EllipticCurveModularity 142; this package is at 143, EllipticCurveModularityWild3Adic at 148, ErdosProgressionPowers at 187). F02/F03/F07/F14/F15 (admitted data, examples, reconstructed carriers, Lean form): no sorried data, no examples, pinned carriers used directly. F04: both imports repaired to existing modules. F08/F09: the genus-zero restriction (`README.md:489`) and `gcd(r,p)=1` (`:24`, `:72`, `:607`) are present. F10: 6.4–6.6 now range over every prime outside {2,3,5,7,13} without non-CM. F11: `full_two_irreducible` at `5 ≤ ell`. F12: the repair's `*Needs:*` (`:345`) no longer lists the realization. F13: `sources.toml` present, Kenku recorded `uncertified`. F16: `ω_f=2πi f(z)dz` and the path 0 → i∞ fixed at `:26`, `:74`, `:619`. Pass b F01: the three one-tactic lemmas deleted. Pass b F02: TauCetiRoadmap form (title, Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers each ending in Examples and Dependencies, Downstream consumers, References); acceptance namespace and narrative gone.

**Mathematics recomputed.** `localTerms` transcribed from the Lean body equals Martin's Definitions 1A–1D (Martin2003 lines 77–88) and the Möbius term of Theorem 1 (line 70); `martinValue(N)` equals an independent computation of dim S₂^new(Γ₀(N)) (genus formula convolved with the Dirichlet inverse of the divisor function) for every 1 ≤ N ≤ 1500; values 0, 1, 1, 3 at N = 1, 11, 30, 35; 12·g⁺(N) ≤ N+1 for all N ≤ 1500 with equality exactly at N = 35 and the primes ≡ 11 mod 12 (11, 23, 35, 47, 59, 71, 83, 107, 131, 167, …), so `martin_bound` is true as typed. μ(1,4,11,16,35,44) = 1, 6, 12, 24, 48, 72; F♯(11) = 3+2√2, F♯(35) = (1+√8)⁶ ≈ 3148.6, G♯(1) = G♯(4) = 4 (9 with 4N), G♯(11) = 13+4√3 ≈ 19.93 = H♯(11), F_K(11) = 9, G_K(11) = 169; 3−2√2 ≈ 0.1716; 4√7 ≈ 10.58 and (√7+1)² ≈ 13.29 < G♯(11); the level-11 coefficients 1, −2, −1, 2; the four filter pairs of 4.6 against Kraus1997 lines 1149–1154; y²=x³−x has 8 points over 𝔽₅, a₅ = −2; the two-torsion counts 4, 2, 1 of 5.5; j(11a1) = −2¹²·31³/11⁵; the five numerators are monic of degree r+1 with constant terms 4096, 729, 125, 49, 13, the signed-divisor sets have 25, 13, 8, 6, 4 elements, contain 0 and 1728 (r = 2) and 64 (r = 5), and the r = 13 set is exactly the displayed four values; 23 and 67 are the least primes ≡ ±1 mod 11 and mod 17; the three winding values i/(2π), i/π, 0 and normalized periods −1, −2, 0. The 4.7 matrix selection was checked exhaustively: of the 96 elements of GL₂(ℤ/4), 24 satisfy det(1−g) = 0 and fix 2e₁; all 85 subgroups generated by up to three of them and lying inside that set have lower-left entries ≡ 0 mod 4 whenever some element has an odd upper-right entry; and every subgroup of GL₂(𝔽₂) whose elements each fix a nonzero vector fixes a common one. Kenku's list contains 12 and 14 and excludes 20, 22, 28, so 5.1, 5.3 (ℓ ≥ 5) and 5.4 (ℓ ≥ 11, sharp by 14) are exactly right.

**Adversarial instances (all consistent).** `norm_bound`: K = ℚ, ℓ = x = B = 5 gives 5 ≤ 5 ≤ 5; B = 0 is impossible for x ≠ 0 since embeddings are injective; the unit ideal contracts to (1). 5.2's degree-4 kernel: for distinct rational T, T′ of order 2, the kernel of E/T → E → E/T′ contains φ(E[2]) ≅ ℤ/2 and an element R with φ̂(R) = P′ ∉ T, which is not 2-torsion, so the kernel is cyclic. Absolute irreducibility for odd ℓ: an irreducible but not absolutely irreducible E[ℓ] has abelian image in 𝔽_{ℓ²}^×, so complex conjugation would be scalar against its eigenvalues 1 ≠ −1. 6.1 at q = p: the squares of inertia elements have eigenvalues ε², 1 with ε onto 𝔽_p^×, so p−1 | 2 forces p ≤ 3; at q ≠ p the squared Frobenius has eigenvalues q², 1 in 𝔽_p, forcing q ≡ ±1. 6.9: det is unchanged by χ² and the only index-2 subgroup of GL₂(𝔽_p), p ≥ 5, is det⁻¹(squares). `NonCM` fails at j = 0, 1728 and holds for 11a1; `HasCyclicIsogeny` admits the identity (degree 1) and the degree-2 quotient and rejects [2] (kernel (ℤ/2)²). 4.5: at an additive ℓ the deletion level keeps a positive exponent while N(E[ℓ]) is prime to ℓ; for ℓ ≥ 5 the exponents at q ≠ ℓ agree except at removed multiplicative primes. 1.10: μ(N) < 6 exactly for N ∈ {1,2,3}, all with g⁺ = 0; μ(lcm(N,4)) ≥ μ(4) = 6.

**Locators verified against the cached legal copies (42).** Kraus1997: (7) line 240 (p. 1143), Théorème 3 line 249, (8) line 270, (9) line 279, Théorème 4 line 284, Lemme 1 line 295 (p. 1144), the trace comparison and two-isogeny paragraph lines 425–441 (p. 1146), Proposition 1 line 1060 and Proposition 2 line 1082 (p. 1158), Corollaire line 1095 (p. 1159, M = lcm(4,N), primes ≤ μ(M)/6 not dividing 2N, as `README.md:327`), the six filters lines 1149–1154 (p. 1160). Martin2003: Theorem 1 line 69 and Definitions 1A–1F lines 77–90 (p. 2), Theorem 2 line 113 (p. 3, with the stated iff), Lemma 16 line 747 (p. 14), proof of Theorem 2 line 836 (p. 16). BS2020: (3) line 169 (p. 358), Theorem 3 line 184, Lemma 2.1 line 191, Lemma 2.2 line 195 (p. 359; p ≠ ℓ, p ∥ M, ℓ | ord_p(Δ), bound (√p+1)^((M₀+1)/6), as `README.md:251`), Theorem 4 line 235 (p. 360), Lemma 3.3 line 287 with proof line 294 (pp. 361–362), Lemma 3.5 line 331 (p. 363). Lemos2017: Theorem 1.1 line 44 (p. 2), Theorem 1.4 line 107 (p. 3), Propositions 2.1–2.2 lines 136–144 (p. 4), Theorem 2.3 line 223, numerator table lines 236–241 (p. 6), divisibility argument and S₂ ∩ ℤ lines 244–255 (pp. 6–7), Lemma 3.2 line 331, Theorem 3.3 line 349 (p. 9), Theorem 3.4 line 355 (p. 10). DarmonMerel2001: Proposition 7.1 line 590 (p. 18), the 2πi differential line 612 (p. 19), Proposition 7.2 line 658 (p. 20), Lemma 8.2 line 725 (p. 22), Lemma 8.3 line 758 (p. 23). Mazur1978: Theorem 1 line 35 (pp. 129–130); §7 and Theorem 7.1 lines 992–996 on the pages printed 153–155. BPR2013: Theorem 1.1 line 55 (p. 2; p ≥ 11, p ≠ 13, r > 1). All seven `sha256` extractions exist in the cache.

**Suppliers.** On `main`: `TauCetiRoadmap/ModularCurves/README.md:449` (1A), `:563` (1D); `TauCetiRoadmap/StableReduction/README.md:491` (Layer 5); `TauCetiRoadmap/EllipticCurves/README.md:423`, `:647`, `:793`, `:1013`, `:1154` (Layers 1, 2, 4, 4.5b, 5); `TauCetiRoadmap/ModularForms/README.md:481`, `:764`, `:1024` (Layers 3, 8, 10); `TauCetiRoadmap/JacobianChallenge/README.md:218`, `:332`, `:448` (D, E, F). No roadmap on `main` mentions Kenku, Lemos or cyclic-isogeny classification. All 13 gaps name an owner and each slug is consumed by at least one `*Needs:*` line. Pinned declarations confirmed: `TauCeti.cuspFormsNew`, `cuspFormCharSpace`, `WeierstrassCurve.torsionGaloisAction` (values in `Multiplicative (AddAut …)`), `Representation.baseChange`, `Representation.IsIrreducible`, `AddSubgroup.torsionBy`, `torsionBy.zmodModule` (a `def`, so the instance is not a duplicate), `AddMonoidHom.toZModLinearMap`, `TauCeti.Isogeny.degree`, `.ker`, `.map`, `WeierstrassCurve.j`. Depcheck:

```text
depcheck: 14 roadmaps, 102 edges, 0 problem(s)
```

**Not re-raised.** Pass a F05 (ErdosProgressionPowers §1.1 overlap), marked `not actionable in this package` because that roadmap is later in the order (187 vs 143): the reason holds; a maintainer decision on ownership is still pending. Pass a F01–F04, F06–F16 and pass b F01–F02 of round 1: repaired as listed above. No pass a comment of round 2 was posted at the time of this pass.

## Not verifiable

- The section topics named in the thirteen gaps (`rational elliptic modularity`, `exact level and weight optimization`, …): their suppliers are in the merge order but on neither `main` nor any head supplied to this pass; existence of such sections was not checked and is not a finding under the gaps rule.
- Ownership against open roadmap pull requests was not checked: this pass received no sibling heads. In particular whether the open board packages KatoEulerSystems or HeegnerPointEulerSystems also claim the `modular-rank-zero` statement assigned here to EulerSystemsAndKolyvaginSystems was not examined.
- Kenku1982 (pp. 199–201, the composite cyclic-degree classification) is `uncertified`, paywalled; the list used in 5.1 was checked against the standard statement, not against the text.
- The deep headlines (`dimension_comparison`, `martin_bound`, `norm_bound`, the two irreducibility theorems, `lemos_surjectivity`) were checked for truth on instances and for agreement with their sources, not proved.
- `review.json` describes the pre-repair package (29 examples, 238 warnings); it is board intake metadata and was not assessed as part of the roadmap.
