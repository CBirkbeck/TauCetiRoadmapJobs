<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13172#issuecomment-6913422625 -->
Red team round 2 pass b (claude) of 11a1332

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §2.3 reads local spin lifts off the global SO₈ parameter without the hypothesis that this parameter is generic

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:486` (§2.3): "Prove that it is independent of the constituent and that its local component at every finite place where Σ is generic is the local SpinLift." Consumers: line 510 (§2.4: "the corresponding product of GL₈ factors of SpinLift(St), SpinLift(δ) and SpinLift(σ)") and line 832 (§5.2: "the spin side at the generic place v₀ is §2.3").

   **Claim.** For every cuspidal Σ with cuspidal lift, SpinLift(Σ)_v ≅ SpinLift(Σ_v) at each finite place where Σ_v is generic.

   **Witness.** ModularityAndLanglandsExtensions §3.17 only puts the component in the packet of the localization; §3.25 needs a generic parameter. README line 688 itself: "a member of a packet of a parameter with nontrivial Arthur SL₂ need not have the L-parameter of that parameter". MetaplecticAutomorphicForms §3.41 gives nonvanishing, the f₁-parameter and unramified Satake only; no supplier makes the global lift generic.

   This is the SO₈ side of round 1's 1b/F04. In §5.3 the parameter is 1 ⊞ A by strong multiplicity one and in §8.2 it is a single cuspidal representation of GL₈, so both are sound; in §2.4 and §5.2 nothing makes the SO₈ parameter generic. GS obtains it from the global genericity of the theta lift (GS lines 738–741), which no layer, supplier section or gap of this roadmap states.

   **Repair.**

   1. Add under "From TauCetiRoadmap.MetaplecticAutomorphicForms", and to the top-level `gaps` of `design/plan.json` (supplier MetaplecticAutomorphicForms, section "Layer 6, §§6.13–6.14, with §3.34"):

      "What MetaplecticAutomorphicForms must provide (gap:pgsp6-pgso8-global-generic-theta): for a number field k, a nondegenerate Whittaker character ψ and a globally ψ-generic cuspidal automorphic representation Σ of PGSp₆(𝔸_k), the global similitude theta lift of Σ to split PGSO₈ has a nonzero Whittaker coefficient for the corresponding nondegenerate character; in particular it is nonzero (GS, §4.3, p. 17); used in §2.3."

   2. Replace the sentence of §2.3 quoted above by:

      "Prove that it is independent of the constituent: the constituents are nearly equivalent, and an isobaric representation is determined by almost all of its Satake classes (AL.3). Prove that, when the global Arthur parameter Ψ of these constituents is generic (ModularityAndLanglandsExtensions §3.8, every b_i = 1), the component of SpinLift(Σ) at every finite place v where Σ_v is generic is the local SpinLift(Σ_v). *Route:* Ψ is an isobaric sum of distinct unitary self-dual cuspidal representations of orthogonal type with trivial determinant, hence by the image statement of ModularityAndLanglandsExtensions §5.1 the transfer of a globally generic cuspidal representation of split SO₈, whose component at v is a Whittaker-generic member of the packet of the localization Ψ_v (§3.17); so Ψ_v is generic in the sense of §3.25. The component at v of a constituent lies in that packet (§3.17): the tempered L-packet of Ψ_v when Ψ_v is bounded (§3.15), a set of irreducible standard modules with L-parameter Ψ_v when it is unbounded (§3.25). In both cases its parameter (§2.0) is Ψ_v."

      and add "3.15, 3.25, 5.1" to the ModularityAndLanglandsExtensions entry of that `*Needs:*` line.

   3. Append to the second statement of §2.3, after "so that SpinLift(Σ) is defined": "Its global Arthur parameter is generic: the lift is globally generic (pgsp6-pgso8-global-generic-theta contract), so its pullback along f₂ has a globally generic cuspidal constituent on SO₈, whose transfer is an isobaric sum of distinct unitary self-dual cuspidal representations (ModularityAndLanglandsExtensions §5.1) and is the parameter by strong multiplicity one; hence SpinLift(Σ)_v ≅ SpinLift(Σ_v) at every finite place." Add the new contract to the `*Needs:*` of that statement and to the Dependencies of Layer 2.

   Tested on the instances: §2.4 (Σ globally generic with a Steinberg place) and §5.2 now have a generic SO₈ parameter by item 3, so the factors at u, w and T are those of the local lifts; §5.3 (parameter 1 ⊞ A) and §8.2 (one cuspidal summand) satisfy the hypothesis of item 2 without the new contract; a parameter with a summand μ ⊠ ν₂ is outside the statement.

2. **F02** (P2) §2.4 uses a change-of-character rule for the Langlands–Shahidi spin factor that no contract supplies

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:510` (§2.4 Route): "its components at these places are of the form ψ_a, and by the Check on ψ_a below the ratio of the two sides of the identity does not depend on a"; line 516 (Check): "Replacing ψ by ψ_a multiplies both sides by the same factor … since the spin parameter has trivial determinant."

   **Claim.** γ(s, σ, spin, ψ_a) = |a|^(8(s−1/2)) γ(s, σ, spin, ψ) for the Langlands–Shahidi factor.

   **Witness.** The reason given ("the spin parameter has trivial determinant") is the GL₈ side only. README line 101 (gap:pgsp6-shahidi-spin-factor) lists the factors, the unramified normalization, the quadratic-twist rule, holomorphy and the global functional equation; AutomorphicLFunctionsAndLocalFactorsPartII Layer 6 (§§6.1–6.11, doubling factors) has no such rule.

   The rule is needed: the components at the four places of a character Ψ₀(c ·) of k \ 𝔸_k are ψ_F(ι_v(c) ·) with four different images of c ∈ k×, so without it the quotient of the two global identities gives the statement only for the component at t₂, not for every ψ (the same point as the README's own Check on rule (e) of §3.11).

   **Repair.** In the README contract gap:pgsp6-shahidi-spin-factor (line 101) and in the `needs` of the same slug in `design/plan.json`, insert after "the rule γ(s, σ ⊗ χ ∘ sim, spin, ψ) = γ(s, σ, spin ⊗ χ, ψ) for quadratic χ,": "the change-of-character rule γ(s, σ, spin, ψ_a) = |a|^(8(s−1/2)) γ(s, σ, spin, ψ) for a ∈ F×, ψ_a(x) = ψ(ax),". Replace the Check at line 516 by: "Replacing ψ by ψ_a multiplies both sides by |a|^(8(s−1/2)): the Langlands–Shahidi side by the change-of-character rule of the pgsp6-shahidi-spin-factor contract, the GL₈ side by det(s ∘ φ)(a) |a|^(8(s−1/2)) with det(s ∘ φ) = 1, the spin representation being valued in SO₈." In the `*Needs:*` of §2.4 write "(functional equation, unramified normalization and change-of-character rule)". Tested on the README's instance F = ℚ₅, s = 2, a = 5: both sides acquire 5⁻¹², as line 514 already computes.

3. **F03** (P3) The Klingen Levi subgroup of PGSp₆ is GSp₄, not GL₁ × PGSp₄

   **Location.** `README.md:70` ("for the GL₁ × PGSp₄ Levi of PGSp₆"), `README.md:1100` ("GL₁ × PGSp₄ quotient"), `README.md:1104` ("the Klingen Levi GL₁ × PGSp₄").

   **Claim.** The Levi subgroup of the Klingen parabolic of PGSp₆ is GL₁ × PGSp₄.

   **Witness.** In GSp₆ the Levi is GL₁ × GSp₄ and the centre is {(z, z)}; (a, g) ↦ a⁻¹g identifies the quotient with GSp₄, whose derived group Sp₄ has centre μ₂, while that of GL₁ × PGSp₄ is adjoint. README line 88 already writes "the image of GL_(n₁) × ⋯ × GSp_(2n₀)".

   **Repair.** Line 70: "(for the Klingen Levi of PGSp₆, the image of GL₁ × GSp₄, isomorphic to GSp₄ by (a, g) ↦ a⁻¹g)". Line 1100: "(the maximal ones are the images of GL₃ × GL₁, GL₂ × GSp₂ and GL₁ × GSp₄, isomorphic to GL₃, (GL₂ × GL₂)/GL₁ and GSp₄)". Line 1104: "does not cover the Klingen Levi, the image of GL₁ × GSp₄ ≅ GSp₄". Tested: an irreducible representation of GSp₄(F) whose central character is not a square is inducing data for the Klingen parabolic and is no representation of GL₁(F) × PGSp₄(F); the Gan–Takeda correspondence for GSp₄ (§3.5 of the supplier) covers it.

4. **F04** (P3) §2.0 proves constancy of the SO₈ parameter on O₈(F)-orbits, but §2.2 needs it on similitude orbits

   **Location.** `README.md:437` (§2.0): "φ_σ is constant on PGSp₆(F)-orbits for Sp₆ and on O₈(F)-orbits for SO₈"; `README.md:470` (§2.2): "choose an irreducible constituent of the restriction to SO₈(F) … Prove that it is independent of the constituent".

   **Claim.** The bullet of §2.0 gives the independence of §2.2.

   **Witness.** The constituents of the pullback along f₂ of an irreducible representation of PGSO₈(F) form one orbit under PGSO₈(F) acting on SO₈ by conjugation, that is under GSO₈(F); sim : GSO₈(F) → F× is onto and sim(F× · O₈(F)) = F×², so for a non-square similitude the orbit is not an O₈(F)-orbit.

   **Repair.** Replace the quoted bullet text by: "φ_σ is constant on PGSp₆(F)-orbits for Sp₆ and on GO₈(F)-orbits for SO₈ (conjugation by orthogonal similitudes, which contains the O₈(F)-orbits and the conjugation by PGSO₈(F) used in §2.2)"; the argument given in the bullet (invariance of the stable character identity) is unchanged. Tested: for g ∈ GSO₈(F) with sim g a non-square, τ and τ ∘ Ad(g) are two constituents in §2.2 and now have the same parameter by the bullet.

5. **F05** (P3) §3.15 compares ℓ-adic Frobenius images with complex Satake classes without an identification of the coefficients

   **Location.** `README.md:725` (§3.15): "every semisimple ρ_Π : Gal(k̄/k) → GL₇(ℚ̄_ℓ) with ρ_Π(Frob_v)^ss conjugate to the Satake class of Π_v for almost all v".

   **Claim.** The hypothesis is a condition on ρ_Π.

   **Witness.** ρ_Π(Frob_v) lies in GL₇(ℚ̄_ℓ) and the Satake class of Π_v in G₂(ℂ); neither v nor an isomorphism ℚ̄_ℓ ≅ ℂ is named, and the conclusion "is L(Π_u)" compares a ℚ̄_ℓ-valued Weil–Deligne representation with a complex parameter. §0.10 names its coefficient field.

   **Repair.** Replace the quoted clause by: "fix a prime ℓ and an isomorphism ι : ℚ̄_ℓ ≅ ℂ; every semisimple ρ_Π : Gal(k̄/k) → GL₇(ℚ̄_ℓ) such that ι(ρ_Π(Frob_v)^ss) is conjugate to the image under v of the Satake class of Π_v for almost all v", and in the conclusion "transported by ι, is L(Π_u)". Add the Check: "The choice of arithmetic or geometric Frobenius does not matter here: it replaces ρ_Π by its dual, and every semisimple class of G₂(ℂ) is conjugate to its inverse (−1 lies in the Weyl group), so v ∘ ρ̃ is self-dual and L(Π_u) is conjugate to its contragredient." Tested at an unramified place: both sides are the class of v(s_u), which is stable under inversion (eigenvalues 1, a^(±1), b^(±1), (ab)^(±1) of §0.1).

6. **F06** (P3) Two `*Needs:*` lines omit targets their Routes use

   **Location.** `README.md:893` (§6.1 `*Needs:*` "§0.3, §2.4, §2.5, §5.2; …") and `README.md:903` (§6.2 `*Needs:*` "§5.3, §6.1; …").

   **Claim.** The lines list what the Routes use.

   **Witness.** §6.1 concludes L(π) = φ from the Sp₆-parameter of θ(π), which is the definition of L on Irr♥ (§3.2) and standard injectivity (§0.4). §6.2 says "§5.3 makes their KS parameters i ∘ φ ⊗ χ": §5.3 gives the untwisted member only, the twists come from §2.5.

   **Repair.** §6.1: "*Needs:* §0.3, §0.4, §2.4, §2.5, §3.2, §5.2; …". §6.2: "*Needs:* §2.5, §5.3, §6.1; …", and in its Route "§5.3 and §2.5 make their KS parameters χ · (i ∘ φ)". Layer 6 Dependencies ("Layers 0–5") need no change.

Second pass. Two P2 findings (S01, S02) and four P3 findings (S03–S06). No P1. No finding re-raises a settled one (the repair report of round 1 marks nothing `not actionable in this package`).

## Round 1 findings at this head

| Id | Status | Witness at 11a1332 |
|---|---|---|
| 1a/F01 = 1b/F01 (local unacceptability absent) | repaired | `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean:155` `spin7_not_acceptable_weilGroup`, import of `TauCeti.NumberTheory.ClassFieldTheory.WeilGroup.Topology` (line 3); README §0.8: "On the Weil group `TauCeti.ClassFieldTheory.WeilGroup` with its Weil topology this is `spin7_not_acceptable_weilGroup`". Elaborated type in `signatures.md` has all five binders. Statement checked against CG lines 1232–1252 (Proposition 8.3: finite image, η = sgn_(E/F), type I). |
| 1a/F02 = 1b/F03 (compound gaps) | repaired | README lines 85–88: four contracts `pgsp6-similitude-twist-rule`, `pgsp6-steinberg-pgo6-vanishing`, `pgsp6-lower-tower-parameters`, `pgsp6-pgso8-induction-principle`; lines 64–65: `cubic-jordan-global-theta`, `cubic-period-global-theta`. 23 slugs in the README, the same 23 in `design/plan.json` (computed, symmetric difference empty). |
| 1a/F03 = 1b/F05(2) (SRU.5 numbering) | repaired | README lines 17, 105, 510, 1043, 1068: "SRU.5.4 (*unramified-principal-series-irreducibility*) … SRU.5.5 (*spherical-generic-criterion*)". |
| 1a/F04 (§3.14 unused hypotheses) | repaired | README §3.14: "a map Irr(G₂(F)) → Φ(G₂) satisfying the two diagrams of §3.2 equals L", with the St_G₂ Check. |
| 1b/F02 (Arthur parameter of non-tempered representations) | repaired, with one residue (S04) | README §2.0 and the Conventions bullet "The parameter of an irreducible representation of Sp₆(F) or of split SO₈(F) … is the parameter of §2.0". The orbit bullet of §2.0 does not cover the orbits §2.2 uses: S04. |
| 1b/F04 (unbounded localization) | partly repaired | Sp₆ side repaired in §§3.1, 5.2, 5.3, 8.2 ("If ψ_v₀ is bounded … (§3.15); if it is unbounded … (§3.25)"). The SO₈ side of the same step is still asserted without its hypothesis in §2.3 and used in §§2.4 and 5.2: S01. |
| 1b/F05(1),(3),(4) | repaired | §3.11 "(§§5.9, 8.3)"; §10.9 "§12.8, pp. 39–40"; §0.0 *Needs* "§0.1 … and §0.6". |
| 1b/F06 (faithful unitary representation) | repaired | README line 137: "the faithful representation of Spin₇(ℂ) by left multiplication on the complex Clifford algebra with its Hermitian inner product". |
| 1b/F07 (octonion algebra definition) | repaired | §1.1: "eight-dimensional unital K-algebra that is not assumed associative"; Check recomputed on the pinned product (`TauCeti/Algebra/Octonion/Basic.lean:279`): uu′ = ⟨0,0,0,e₃⟩, (uu′)w = ⟨0,0,−e₂,0⟩, u′w = 0. |
| 1b/F08 (`sumSquaresSeven` Checks) | repaired | §0.8, last three Checks (values 1 and 7; 1 + i² = 0; polar form 2δ_ij). |

No repair introduced a false statement that I could find; the residues are S01 and S04.

## Verified sound

**Dependency check.** Full output: `depcheck: 259 roadmaps, 2476 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. `merge-order/ORDER.txt` has ExceptionalThetaCorrespondencesForG2 at line 299 and this roadmap at line 316.

**Policy.** `git diff --stat origin/main...HEAD` changes 13 files, all under `packages/LocalLanglandsCorrespondenceForG2/`. No `set_option`, `lemma`, `#eval`, `#check`, pull-request number or process word in the README or the Lean file (grep). Imports: `Mathlib` and two Tau Ceti modules, both present at the pin. Gap slugs: 23 in the README, the same 23 in `design/plan.json`, each with a named supplier earlier in the merge order.

**Suggested.lean (6 declarations read).** No Lean was run in this pass (none is permitted); the elaborated types are those of `scratch/signatures.md`, compared one by one with the README, no binder lost, nothing changed.

| Declaration | Context | README | Instances and values | Result |
|---|---|---|---|---|
| `octonionAut` | no variables | §0.0 | id in; 2·id: 2 against 4, out; t = diag(ζ, ζ, ζ³) ∈ SL₃: on the pinned product the bottom entry carries tv × tv′ = t^(−T)(v × v′), the top entry t^(−T)w × t^(−T)w′ = t(w × w′), in | real body, agrees |
| `octonionRep` | `{Γ} [Group Γ]` in the signature | §0.0 | at t: eigenvalues 1, 1, ζ, ζ, ζ³, ζ⁴, ζ⁴, ζ² (a, b, v, w entries) | real body, agrees |
| `griess_conjugacy` | `{Γ} [Group Γ]`, two semisimplicity hypotheses, intertwiner | §0.0 | Γ = 1: g = 1; ℤ/5 with t, t²: multiplicity of ζ is 2 against 1, hypothesis fails; arbitrary Γ: the Zariski closure of (ρ, ρ′)(Γ) in G₂ × G₂ is reductive, its two projections restricted to a maximal compact subgroup land in conjugates of compact G₂ and are element-conjugate (χ₁₄ = Λ²χ₇ − χ₇), hence conjugate | true; not padding |
| `sumSquaresSeven` | none | §0.8 | e₁ ↦ 1; e₁ + i e₂ ↦ 0 | needed by the next two |
| `spin7_not_acceptable` | closed | §0.8 | weights (1,0), (1,2), (0,1), (2,1), sum (4,4); η ⊗ V = (1,2), (1,0), (0,3), (2,3); V∨ = (3,0), (3,2), (0,3), (2,3): three distinct multisets | true; not a one-tactic consequence of the Weil-group form (it needs a p-adic field and a finite quotient) |
| `spin7_not_acceptable_weilGroup` | `(K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K]`, all in the elaborated type | §0.8 | r = η = 1: every clause but the last holds, g = 1 refutes the last; r = 1, η = sgn: IsConj(1, −1) fails; x·star x = (−1)^k ∏Q(v_i), so `spinGroup` at this form over ℂ is Spin₇(ℂ); ker η = W_E is open in the Weil topology (`Topology.lean:78`, induced from G_K × ℤ) | true (CG lines 1232–1252); agrees |

Headline theorems of the README: §0.0 and both forms of §0.8 are stated; §§0.2–0.5, 0.9–0.10, 1.4–1.7, 2.2–2.5, 3.12–3.15, 5.1–5.6, 6.6, 7.1–7.3, 8.2, 10.1, 10.9 are named in the module docstring as not statable with the missing carrier (no G₂-valued parameters, no smooth representations of G₂(F), no automorphic representations at the pins; checked again by grep for the new §2.0, which needs Arthur's packets). Nothing in the file is padding. No declaration name of the file occurs in any roadmap on main or at an open head (`roadmaps grep --lean-only`: no match).

**Adversarial table (README), statements recomputed in this pass.**

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| §0.2 injectivity modulo duality | toral φ_τ = (χ₁, χ₂, χ₃); φ′ = (χ₁, χ₂⁻¹, χ₃⁻¹); φ_τ = (1, χ, χ⁻¹) against (1, χ, χ) | det φ′ = χ₁², so φ′ is a parameter only if χ₁² = 1, and then φ′ = φ_τ∨; det(1, χ, χ) = χ², = 1 forces equality | holds | none |
| §0.2 centralizers | φ_τ not self-dual; irreducible H ⊂ SO₃ | centralizer preserves the three summands, lies in SL₃, is μ₃; commutant GL₁ × GL₂ in GL₇ as for SO₃, so S₃ | holds | none |
| §0.3 converse | φ = j ∘ φ_τ | i(j(SL₃)) ⊂ SL₄ = Spin₆ commutes with a torus of SL₄, so i ∘ φ is not discrete | holds | none |
| §0.7, unipotent parts | q(t) with −1-eigenspace W of dimension 2, 4, 6; u_W very even | the conjugator of t to −t has determinant −1 on W; it can be chosen in Z(u) unless u_W is very even; only (2, 2) in dimension 4 is, and there s(x) has 2-blocks at c·μ and trivial blocks at −c·μ, so s(x) ≁ −s(x) | holds on the instances | none |
| §1.1(i)–(iii) | isotropic (a, x) with a = 0 and a ≠ 0; ℚ(√2), c = −1 − √2; (−1, −3)_ℚ | n₀(x/a) = −1, or n₀ isotropic hence universal; −c = 2.414 and −0.414; symbols −1, −1, +1 at 3, ∞, 2 | holds | none |
| §1.7 weights | t = 0, 1; positive coroots | h₁ − h₂ − h₃ = 2t; (11, 6, 3): 10, 7, 4, 1; pairings of λ_t: 2t, 4t, 6t, 6t, 10t, 12t, 8t, 4t, 2t | holds | none |
| §2.0 definition | trivial representation of Sp₆, of SO₈; exponent (3, 2, 1, −½) on SO₈ | dimensions 6 + 1 = 7 and 6 + 2 = 8; the last coordinate is positive only after the outer automorphism, and the parameter is an O₈(ℂ)-class, so the value is unchanged | well defined | S04 (orbits) |
| §2.1 similitude pullback | f₁, f₂ | sim cuts out H¹ of the quotient by ker(Spin₈ → SO₈); composed with triality it is an isomorphism on SO₈(F)/im Spin₈(F): the spinor norm | holds | none |
| §2.2 independence of f₂ or f₃ | π extending to PGO₈(F) | f₃ = c′ f₂ c with c, c′ the outer involutions, so f₃*π = c*(f₂*π): same O₈(ℂ)-class | holds | none |
| §2.3 local components | Ψ generic; Ψ with μ ⊠ ν₂ | packet of Ψ_v is an L-packet only in the first case | missing hypothesis | S01 |
| §2.4 | ℚ₅, s = 2, a = 5; #T = 1, 2 | (24/25)/(−4) = −6/25; 5^(−8·3/2) = 5⁻¹²; R_u R_w R_σ = 1 = R_u R_w R_σ² needs R independent of a | rule unowned | S02 |
| §3.8 | T[2] ⊂ T; (χ, χ⁻¹, 1) cubic | no root in 2X*(T), W acts on T[2] through S₃ with kernel ±1: S_φ = ℤ/2; the stabilizer −(12) is the reflection in the short root e₃: S_φ = 1 | holds | none |
| §3.11 (i)(b),(c) | dual Levis | ⟨3a + 2b, a∨⟩ = 6 − 6 = 0, so the Heisenberg Levi has the short root and its dual the long root: 2 + 2 + 1 + 1 + 1; the other: 2 + 2 + 3 | holds | none |
| §3.11 real factor | λ = 0 | (3a+b)∨ = a∨ + b∨, (3a+2b)∨ = a∨ + 2b∨: 1, 2, 3; short: 1, 4, 5; det = sgn³ · sgn = 1 | holds | none |
| §3.11 uniqueness | Irr♥ and Irr♠ | every place of S other than v₀ is St, spherical, π_deg[1], real, or in Irr♥ (already treated) | holds | none |
| §3.13 | candidate L′ | tempered: v ∘ L′(π) bounded with the gamma factors of v ∘ L(π), converse theorem, §0.4; nontempered: §3.5 | holds; §3.7 and the induction half of §3.6 are not used (P3 note, not a finding) | none |
| §3.15 | arithmetic against geometric Frobenius | dual of ρ_Π; classes of G₂(ℂ) are inverse-stable | holds once ι is named | S05 |
| §4.2 | D₂ = D₁^op | the representation of D₂× with the character of JL(τ) is JL(τ)∨ on D₁×: "τ on D₂ = τ∨ on D₁" | holds | none |
| §6.1 | φ trivial on SL₂ | zero of γ at s = 0 ⇔ pole of L(s) at 0, since L(1 − s, σ∨) is holomorphic and nonzero at s = 0 for tempered σ | holds | S06 (Needs) |
| §8.1 | \|λ_i\| ∈ (q^(−1/2), q^(1/2)) | root values λ_i^(±1), λ_i^(±1)λ_j^(±1) in (q⁻¹, q) | holds | none |
| §9.3 Levis | Klingen | (GL₁ × GSp₄)/{(z, z)} ≅ GSp₄ by a⁻¹g | misnamed | S03 |
| §10.5, §10.9 | weak class of i ∘ φ | lifts are χ · (i ∘ φ); L_w(X*(φ) ⊗ χ) = χ · [i ∘ φ] equals [i ∘ φ] iff χ stabilizes i ∘ φ iff it stabilizes X*(φ) | holds | none |

**Counts.** Declarations read: 6 of 6. README lines read: 1279 of 1279 (all targets of §§0.0–10.9, 76 with §2.0). Locators verified against the cached texts in this pass: 21 (GS §4.1–4.4 pp. 16–19, Lemma 12.4 and Lemma 12.5 p. 37, Theorem 12.6 pp. 38–39, Theorem 12.7 pp. 39–40; C Theorem E p. 100, Corollary 6.8 p. 150; CG formula (16), Lemma 8.2, Proposition 8.3, Proposition 8.4 pp. 32–33; GS20 Theorem 1.1 p. 2; MagaardSavin Proposition 8.2 p. 10; KS Lemma 2.1, Corollary 2.2 p. 16, Proposition 13.1(4) pp. 60–61; Shin Definition 3.5, Corollary 4.12 p. 24, Theorem 5.8 p. 27; ILM Lemma A.2, Proposition A.5 p. 26). Checks recomputed: 31 (the table above). Sibling citations checked at the open heads (`roadmaps show`): 34 ids — ExceptionalThetaCorrespondencesForG2 §§0.1, 0.6–0.9, 1.8, 5.1–5.4, 5.7–5.9, 6.7, 8.1–8.4, 8.8–8.10, 9.1, 9.3–9.6, 10.1, 10.3–10.7 (every italic heading the README quotes exists; hypotheses of §§9.4, 9.5, 10.4–10.6 read); ModularityAndLanglandsExtensions §§3.15, 3.17, 3.25, 5.1 (read); MetaplecticAutomorphicForms §§3.41, 3.42 (read), 3.10, 3.34, 6.13, 6.14 (headings); AutomorphicLFunctionsAndLocalFactorsPartII Layer 6 (§§6.1–6.11) and §10.0 (headings). Pinned declarations opened: 22 (`TauCeti.Octonion` product, `conj_mul`, `trace`, `norm_mul`, `normQuadraticForm`, `imaginary`, `finrank_imaginary`; `TauCeti.CayleyDickson` product, `normSq`, `normSq_def`, `DivisionOctonionReal`; `QuadraticMap.IsometryEquiv.exists_extension`; `QuadraticForm.not_anisotropic_atFinitePlace_of_five_le_finrank`; `TauCeti.BrauerGroup.natCard_twoTorsion`; `TauCeti.ClassFieldTheory.WeilGroup`, `weilDegree`, `instTopologicalSpaceWeilGroup`; `TauCeti.D4Tripled.trialityAutomorphism`, `trialityAutomorphism_pow_three`; Mathlib `spinGroup`, `IsNonarchimedeanLocalField`, `Representation.IsSemisimpleRepresentation`, `QuadraticMap.weightedSumSquares`, `Matrix.charpoly_diagonal`), each at the file the README names.

**Ownership.** `roadmaps grep` finds no other statement of the classification of octonion algebras by norm forms, of Griess's theorem or of the unacceptability of Spin₇; ExceptionalThetaCorrespondencesForG2 uses "octonion algebra O/k" and "totally definite O" as hypotheses (§§9.1, 10.1, 10.4) without stating existence or uniqueness, so §1.1 has one owner. `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no second copy. Ownership against open pull requests was checked through the `roadmaps` tools at their heads.

**Declared gaps.** The 23 contracts were read for precision and minimality; none has supplier `none`, none is already provided at the supplier heads I searched (MetaplecticAutomorphicForms §§3.41–3.42, ModularityAndLanglandsExtensions §§3.15–3.25, AutomorphicLFunctionsAndLocalFactorsPartII Layer 6). One is incomplete for the route that uses it (S02) and one dependency has no contract (S01). Note, not a finding: gap:relative-generic-isolation leaves the number field implicit (it is used over a totally complex field in §2.4 and a totally real one in §5.2), and its cited source proves the two ingredients for split SO(2n+1) (ILM lines 1231, 1259–1263).

**Copyright.** Passages set beside the sources in this pass: §§2.2–2.4 / GS lines 714–810; §1.7 / GS lines 1543–1570; §8.1 / GS lines 1574–1590; §§10.3, 10.5 / GS lines 1614–1643; §0.9 / C lines 235–243 and 2282–2288; §0.8 local form and the docstring of `spin7_not_acceptable_weilGroup` / CG lines 1232–1252; the symplectic-steinberg contract / MagaardSavin lines 394–406 and KS lines 693–700; the spin-pole contract / GS20 lines 44–48; the relative-isolation contract / ILM lines 1231–1263. Longest shared run: six words (a list of hypotheses in §0.9 that the mathematics forces). No table, figure or list is taken over. Arrangement: GS has the largest share; its sections run 2, 3, 3.5, 4, 5, 6, 8, 9, 10, 11, 12, and the layers correspond as Layer 0 ↔ §2.2 (with C, CG, HKT), Layer 1 ↔ §10, Layer 2 ↔ §4, Layer 3 ↔ §§3.1–3.4 (with GF), Layer 4 ↔ §3.5, Layer 5 ↔ §5, Layer 6 ↔ §§6, 8, Layer 7 ↔ §§1, 9, Layers 8–10 ↔ §12: not the source's order (Layers 1 and 2 precede Layer 3), not one to one (Layers 0, 3, 6, and §2.0, which has no counterpart), and the run Layers 4–7 is forced by the `*Needs:*` lines §4.1 → §3.4, §5.3 → §3.2, §6.2 → §5.3, §7.1 → §6.7.

Source independence: 10 passages compared with 7 sources (GS, C, CG, MagaardSavin, KS, GS20, ILM), none shared; largest share GS, 104 of 176 locators (counted by pattern); contents compared with GS: independent.

## Not verifiable

- Griess, Theorem 1, and SpV §1.5, Theorems 1.7.1 and 1.8.1: settled as uncertified, not read. `griess_conjugacy` was checked by the independent argument in the table, not against the theorem as printed.
- The repair texts of S01 and S02 change no Lean; nothing was elaborated in this pass.
- §0.7 for all elements with nontrivial unipotent part: checked on the very even instance and by the centralizer argument of the table, not as a complete proof.
- The statements behind the 23 declared gaps and the suppliers' own sources (Arthur, Xu, Jiang–Zhang, Kudla, Adams–Barbasch) are not in this roadmap's manifest; the contracts were compared with the suppliers' READMEs only.
- Locators into HD, GF, HKT, SV and the remaining GS locators were verified in round 1 and not reopened here.
- Whether the Langlands–Shahidi spin factor satisfies the rule of S02 with exactly the factor |a|^(8(s−1/2)) was not checked against Shahidi's text (not in the manifest); it is the value the GL₈ side forces.

## Source issues

- **Gap** in GS at proof of Proposition 4.1(i), p. 18: the source takes one global additive character whose components at all the chosen places equal a given ψ; it should use the change-of-character rule for both gamma factors, a global character reaching only some ψ; affects the proof.
- **Gap** in GS at §4.3, pp. 17–18: the source asserts that the global spin lift has the local spin lifts as components at every place; it should derive this from the genericity of the global parameter and the structure of generic packets; affects the proof.
- **Gap** in GS at proof of Lemma 12.4, p. 37: the source asks Shin's Theorem 5.8 for spin-regular real components; it should use the density limit along an explicit spin-regular weight sequence (Shin, Corollary 4.12); affects the proof.
- **Gap** in GS at proof of Lemma 8.3, p. 25: the source applies the spin-pole theorem over a totally real field; it should note that GS20 Theorem 1.1 is stated over ℚ only; affects the proof.
- **Error** in HKT at proof of Lemma 4.6, arXiv v3 p. 21: the source gives every nonzero spinor a stabilizer conjugate to G₂; it should restrict to nonisotropic spinors, available by complete reducibility; affects the proof.
- **Error** in GS at Main Theorem (vi), p. 4: the source puts generic discrete series of PGSp₆ in the middle of the spin diagram; it should be generic tempered representations, the partner of a PGL₃ lift being Siegel-induced; affects a stated result.
- **Misprint** in GS at Main Theorem (ix), p. 4: the source closes the parenthesis of the gamma factor before the tensor product; it should be the gamma factor of the tensor product of the two parameters; affects nothing.

## For the human reviewers

- **Licence.** Griess and SpV are `uncertified` in `sources.toml` (texts not read); `griess_conjugacy` in `Suggested.lean` and README §1.1(i) rest on them by locator only.
- **Scope.** GF (arXiv:2308.12561 v1) and MagaardSavin (arXiv:1406.3773 v1) are cited as preprints; README "Notes on the sources" departs from thirteen printed statements or proofs of GS, GF and HKT, and S01–S02 add two more for GS.
- **Not tested.** The relative-isolation contract cites ILM Lemma A.2 and Proposition A.5, which the source states for split SO(2n+1) (ILM lines 1231, 1259); whether the PGSp₆ analogue is in the refereed literature was not settled.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "11a1332ac637c1f34aabb3c5496bd8298a44d7ec", "job": "RT-LocalLanglandsCorrespondenceForG2~2b", "model": "fable", "worker": "chris-x26"} -->
