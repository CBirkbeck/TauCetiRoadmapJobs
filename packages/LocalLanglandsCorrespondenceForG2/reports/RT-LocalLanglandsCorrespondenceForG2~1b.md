<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13172#issuecomment-6911107222 -->
Red team round 1 pass b (claude) of 3b3f4a7

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The local form of the unacceptability of Spin₇ is statable at the pins and absent

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean:18–21`: "With its local form (README §0.8: two `Spin₇`-valued parameters of `W_F × SL₂(ℂ)`, of finite image on `W_F` …), which needs the `Spin₇`-valued parameters that the pins lack".

   **Claim.** The local form (README §0.8, second statement; CG Proposition 8.3) cannot be stated at the pins.

   **Witness.** The local pair is trivial on SL₂(ℂ) and has finite image, so it is a pair of homomorphisms W_F → Spin₇(ℂ) with open kernel and finite range. The pin has `TauCeti.ClassFieldTheory.WeilGroup` with `Group` (`TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:183`) and `TopologicalSpace` (`…/WeilGroup/Topology.lean:78`).

   **Repair.** Add the import `TauCeti.NumberTheory.ClassFieldTheory.WeilGroup.Topology` and, after `spin7_not_acceptable`, the statement below (the repair worker elaborates it with `#check`; no Lean was run in this pass), name it in README §0.8 after the local statement, and replace lines 18–21 of the module docstring by "its local form for every `F` is `spin7_not_acceptable_local`".

   ```lean
   /-- **`Spin₇` is unacceptable over every `p`-adic field** (Chenevier–Gan, Proposition 8.3). For a
   nonarchimedean local field `K` of characteristic zero there are two homomorphisms
   `r r' : W_K → Spin₇(ℂ)`, continuous with finite image (open kernel, finite range), with
   `r' = η · r` for a character `η : W_K → {±1}` (pointwise `r' w = ± r w`), conjugate element by
   element and not conjugate by one element of `Spin₇(ℂ)`. -/
   theorem spin7_not_acceptable_local (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
       [IsNonarchimedeanLocalField K] [CharZero K] :
       ∃ r r' : TauCeti.ClassFieldTheory.WeilGroup K →* spinGroup sumSquaresSeven,
         IsOpen (r.ker : Set (TauCeti.ClassFieldTheory.WeilGroup K)) ∧ Finite (Set.range r) ∧
           (∀ w, r' w = r w ∨
             (r' w : CliffordAlgebra sumSquaresSeven) = -(r w : CliffordAlgebra sumSquaresSeven)) ∧
           (∀ w, IsConj (r w) (r' w)) ∧
           ¬ ∃ g : spinGroup sumSquaresSeven, ∀ w, r' w = g * r w * g⁻¹ := by
     sorry
   ```

   Tested on the instances: K = ℚ₅, r the pullback of the μ₄ × μ₄ pair along ℚ₅× → μ₄ × μ₄ (README §0.8 Checks): range of order 16, kernel of index 16 and open, r′ = b² · r; K = ℚ₃ (no such pullback, order 8 < 16): CG Proposition 8.3 (CG line 1232). Negative control: r = r′ satisfies every clause but the last (g = 1).

2. **F02** (P2) "The Arthur parameter" of a non-tempered representation of Sp₆(F) or SO₈(F) is used but defined nowhere

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:509` (§3.1): "the parameter assigned by Arthur to the PGSp₆(F)-orbit of irreducible constituents of the restriction of θ(π) to Sp₆(F)"; same object at lines 437 (§2.2), 551 (§3.4), 561 (§3.5), 601 (§3.9), 1040, 1066, 1076 (§§9.1–9.4), 1143 (§10.5).

   **Claim.** ModularityAndLanglandsExtensions §3.15 assigns a parameter to every irreducible representation of Sp₆(F) and of split SO₈(F).

   **Witness.** ModularityAndLanglandsExtensions §3.15(c), at its open head: the packets of bounded φ "partition the tempered dual". Instance: σ = the trivial representation of Sp₆(F) (the restriction of θ(1_G₂), README §3.2 Check) is not tempered and lies in no packet of §3.15. The extension appears only inside a gap sentence (README line 69) and is no target here or there.

   **Repair.** Add to `## Conventions`:

   "- Parameters of all irreducible representations of Sp₆(F) and split SO₈(F). By the Langlands classification (SmoothRepresentationsOfLocalGroups, SR.3.3) an irreducible representation is the Langlands quotient J(P, τ, ν) of one standard module, P = MN standard, M ≅ GL_(n₁) × ⋯ × GL_(n_r) × G₀ with G₀ of the same type and smaller rank, τ = τ₁ ⊗ ⋯ ⊗ τ_r ⊗ τ₀ irreducible tempered, ν = (ν₁ > ⋯ > ν_r > 0). Define its parameter as ⨁_i (rec(τ_i)|·|^(ν_i) ⊕ (rec(τ_i)|·|^(ν_i))∨) ⊕ φ₀, where φ₀ is the bounded parameter of τ₀ (ModularityAndLanglandsExtensions §3.15(c)); for SO₈ it is a class modulo the outer automorphism. Prove that it depends only on the isomorphism class, is constant on PGSp₆(F)-orbits (on outer orbits for SO₈), equals the parameter of §3.15 on tempered representations, and for a generic unbounded parameter has as fibre the irreducible standard modules of ModularityAndLanglandsExtensions §3.25. 'The Arthur parameter' of a representation of Sp₆(F) or SO₈(F) in §§2.2, 3.1, 3.4, 3.5, 3.9, 9.1–9.4 and 10.5 means this parameter. *Needs:* SmoothRepresentationsOfLocalGroups, SR.3.3; ModularityAndLanglandsExtensions §§3.15, 3.25; EndoscopicTransferAndUnitaryTraceComparison §10.30."

   with the Checks: "the trivial representation of Sp₆(F) is J(B, 1, (3, 2, 1)) and has parameter |·|³ ⊕ |·|² ⊕ |·| ⊕ 1 ⊕ |·|⁻¹ ⊕ |·|⁻² ⊕ |·|⁻³, the parameter v ∘ L(1) of §3.2, with N = 0; St_Sp₆ is tempered with parameter Sym⁶, the same Frobenius eigenvalues and N ≠ 0; a tempered representation has P = G and the parameter of §3.15." Tested on the refuting instance: the trivial representation now has the parameter §3.2 and §3.5 assert (eigenvalues q^(±3), q^(±2), q^(±1), 1).

3. **F03** (P2) gap:pgsp6-similitude-theta-tables is compound and does not state what it asks for

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:82`: "the parameters of the theta lift of every irreducible representation induced from each proper Levi of PGSp₆ (including the lower-tower Jacquet–Langlands identification …), the rule that a quadratic twist …".

   **Claim.** The `needs` sentence says exactly what the supplier must prove.

   **Witness.** It bundles four statements for three dual pairs, and the first ("the parameters of the theta lift …") names no parameter: a supplier section stating any formula satisfies it. Consumers use four different parts: §2.5/§10.3 (twist), §2.3/§8.1 (Steinberg), §5.5 (Siegel), §§9.1–9.3, 10.4, 10.7 (Levi and lower tower).

   **Repair.** Replace the bullet by four contracts (same supplier, MetaplecticAutomorphicForms Layer 3, §§3.41–3.42; add the slugs to the `gaps` list of `design/plan.json`, drop the old one, and repoint each `*Needs:*`):

   - "What MetaplecticAutomorphicForms must provide (gap:pgsp6-similitude-twist-rule): for H one of split PGSO₈, split PGO₆, PGO₅,₁ over F, every σ ∈ Irr(PGSp₆(F)) and every quadratic character χ of F×, θ_H(σ ⊗ χ ∘ sim) ≅ θ_H(σ) ⊗ χ ∘ sim_H; under PGO₆ ≅ PGL₄ ⋊ ⟨±1⟩ and PGO₅,₁ ≅ PGL₂(D) ⋊ ⟨±1⟩ the character χ ∘ sim_H restricts to χ ∘ det, respectively χ ∘ Nrd." (§§2.5, 10.3, 10.4)
   - "… (gap:pgsp6-steinberg-pgo6-vanishing): the similitude theta lift of the Steinberg representation of PGSp₆(F) to split PGO₆(F) is zero (GS, proof of Lemma 12.5, p. 37)." (§§2.3, 8.1)
   - "… (gap:pgsp6-lower-tower-parameters): if σ ∈ Irr(PGSp₆(F)) is the similitude lift of an irreducible τ of PGO₆(F) or PGO₅,₁(F), with φ_τ : WD_F → SL₄(ℂ) the parameter of a constituent of τ on PGL₄(F) (through Jacquet–Langlands for PGL₂(D)), determined up to φ_τ ↔ φ_τ∨, then the parameter of the restriction of σ to Sp₆(F) is 1 ⊕ Λ²φ_τ; and two members of one Xu packet in this locus have the same φ_τ up to duality (GS, §12.3(b), pp. 35–36)." (§§9.1, 9.2, 10.7)
   - "… (gap:pgsp6-pgso8-induction-principle): for a proper standard parabolic P = MN of PGSp₆ and σ ∈ Irr♥(PGSp₆) the Langlands quotient, or a tempered constituent, of the normalized induction of an irreducible τ_M, the lift θ(σ) to split PGSO₈(F) is the Langlands quotient, respectively a constituent, of the induction from the parabolic of PGSO₈ with Levi the general linear factors of M times the similitude orthogonal group two ranks above the symplectic factor of M, of the same general linear data tensor the lift of the symplectic datum, in the normalization of §3.34; in particular for τ discrete on PGL₃ the generic constituent of I₃(τ) lifts to the generic constituent of the induction of τ ⊗ 1 from the Levi GL₃ × GL₁, whose pullback along f₂ has standard parameter φ_τ ⊕ φ_τ∨ ⊕ 1 ⊕ 1 (GS, proof of Theorem 12.3, second bullet, p. 36)." (§§5.5, 9.3)

   Tested on the instance: the Steinberg vanishing used in §2.3 and §8.1 is now one contract a supplier can discharge by one statement; the first Check of §2.5 (traces 8 and −8 at σ = St) is the twist contract at H = PGSO₈.

4. **F04** (P2) §§3.1 and 8.2 read a local parameter off the global one without the unbounded-localization step

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:509` (§3.1 Route): "observe that the rank-seven transfer of Σ is cuspidal … and apply §0.9 locally"; `README.md:1020` (§8.2 Route): "local–global compatibility with N at a place not above ℓ gives the local parameter".

   **Claim.** The parameter of A_(v₀) (the GL₇ transfer at the place of θ(π), resp. σ) is the Arthur parameter of the Sp₆-restriction of that local component.

   **Witness.** ModularityAndLanglandsExtensions §3.17 only places the component in the packet of the localization ψ_(v₀), which "may be unbounded" there; §3.15 covers bounded ψ_(v₀). README §§3.11, 3.15 and 5.3 (lines 645, 691, 808) supply the missing case by §3.25; §§3.1 and 8.2 and their `*Needs:*` do not.

   **Repair.** §3.1 Route, after "(symplectic-steinberg-generic-parameter contract)": "; the component at v₀ of a constituent of the restriction of Σ to Sp₆ lies in the packet of the localization of that parameter (§3.17), a tempered L-packet when the localization is bounded (§3.15) and a set of irreducible standard modules with the parameter of the localization when it is unbounded (§3.25, the localization being that of a cuspidal representation of GL₇, hence generic), so in both cases its parameter is that of A_(v₀)". Add "3.25" to the §3.1 `*Needs:*`. §8.2 Route, before "and local–global compatibility": "the localization at v₀ of the global parameter is bounded, since σ is a discrete series and the members of the packet of an unbounded generic parameter are irreducible standard modules induced from proper parabolic subgroups (ModularityAndLanglandsExtensions §3.25), so it is the parameter of the tempered L-packet containing the restriction of σ (§§3.15, 3.17);". Add "ModularityAndLanglandsExtensions §§3.15, 3.17, 3.25" to the §8.2 `*Needs:*` and "3.25" to the Layer 8 Dependencies. Tested on the instance of §5.3 (same argument, line 808).

5. **F05** (P3) Four locators point beside the statement

   **Location and witness.**

   1. `README.md:645` (§3.11): "Π_v ∈ Irr♣ ⊂ Irr♥ at every other finite place, being lifted from the split group H(k_v) (§§5.9, 6.7)". ExceptionalThetaCorrespondencesForG2 §6.7 is the dichotomy Irr♠ ⊔ Irr♥ only; "Irr♣ … is contained in Irr♥" is its §8.3.
   2. `README.md:99, 477, 1009` cite "SRU.5, §5.3, *unramified-principal-series-irreducibility*" and "*spherical-generic-criterion*". At the head of SmoothRepresentationsOfLocalGroupsPartII these targets are numbered 5.4 and 5.5; §5.3 is *spherical-tempered-criterion*.
   3. `README.md:1184` (§10.9): "§12.8, p. 40". GS §12.8 begins on p. 39 (GS line 1629); p. 40 begins at GS line 1658.
   4. `README.md:157` (§0.0 `*Needs:*`): "Layer 0 (the inclusion G₂ ⊂ SO₇)". Layer 0 of ExceptionalThetaCorrespondencesForG2 has no such item; §0.1 states that an octonion automorphism preserves the norm and the imaginary part, and §0.6 gives G₂ → Spin₇.

   **Repair.** (1) "(§§5.9, 8.3)", and "8.3" added to the §3.11 `*Needs:*` list "(§§5.1, 5.9, 6.7, 8.3, …)". (2) "SRU.5.4 (*unramified-principal-series-irreducibility*) … SRU.5.5 (*spherical-generic-criterion*)" at the three places and in the Dependencies of Layers 2 and 8. (3) "§12.8, pp. 39–40". (4) "§0.1 (octonion automorphisms preserve the norm and the imaginary octonions, so v is valued in SO₇) and §0.6 (G₂ → Spin₇)".

6. **F06** (P3) Spin₇(ℂ) has no faithful unitary representation

   **Location.** `README.md:131`: "*SpinComplexPolarTopology*: the faithful unitary representation of Spin₇(ℂ), its compact real form Spin(7) of unitary elements and the positive powers (g†g)^t".

   **Claim.** SpinRepresentations, Layer 2, supplies a faithful unitary representation of Spin₇(ℂ).

   **Witness.** A finite-dimensional unitary representation of the connected simple noncompact group Spin₇(ℂ) is trivial. The supplier states "faithful left multiplication on the whole Clifford algebra" with a Hermitian inner product, in which Spin ∩ U is the compact Spin(n).

   **Repair.** "*SpinComplexPolarTopology*: the faithful representation of Spin₇(ℂ) by left multiplication on the complex Clifford algebra with its Hermitian inner product and adjoint g†, in which the unitary elements of Spin₇(ℂ) form the compact real form Spin(7), and the positive powers (g†g)^t lie in Spin₇(ℂ)". Line 256 already uses this form.

7. **F07** (P3) The definition of an octonion algebra in §1.1 admits no object

   **Location.** `README.md:302`: "An octonion algebra over a field K is an eight-dimensional unital K-algebra with a nondegenerate quadratic form n, its norm form, satisfying n(xy) = n(x) n(y)".

   **Claim.** `TauCeti.Octonion K` is one.

   **Witness.** Read with Mathlib's `Algebra` (associative) no such object exists: an associative algebra with a nondegenerate multiplicative norm has dimension 1, 2 or 4. `TauCeti.Octonion` is a `NonAssocRing` with a module structure (`TauCeti/Algebra/Octonion/Basic.lean`, module docstring).

   **Repair.** "… is an eight-dimensional unital, not necessarily associative K-algebra (a `NonAssocRing` with a compatible K-module structure and K-bilinear product) with a nondegenerate quadratic form n …". Add the Check: "associativity fails in `TauCeti.Octonion K`: for u = ⟨0, 0, e₁, 0⟩, u′ = ⟨0, 0, e₂, 0⟩ and w = ⟨0, 0, 0, e₁⟩ one has (uu′)w = ⟨0, 0, 0, e₃⟩ w = ⟨0, 0, −e₂, 0⟩ (the top entry is −e₃ × e₁), while u′w = 0 (e₂ · e₁ = 0) and so u(u′w) = 0; an associative algebra with a nondegenerate multiplicative norm has dimension 1, 2 or 4". Tested: `TauCeti.Octonion K` satisfies the repaired definition (`TauCeti.Octonion.norm_mul`, hyperbolic norm ab − v · w) and not the original.

8. **F08** (P3) `sumSquaresSeven` has no README Checks

   **Location.** `README.md:254` (§0.8), the only mention: "`sumSquaresSeven` is the form x₁² + ⋯ + x₇² on ℂ⁷".

   **Claim.** Each definition of `Suggested.lean` has at least three discriminating Checks.

   **Witness.** The eight Checks of §0.8 concern the pair (r, r′), the fields ℚ₅ and ℚ₃ and discreteness; none evaluates the form.

   **Repair.** Add to the §0.8 Checks: "`sumSquaresSeven` e₁ = 1 and `sumSquaresSeven` (1, …, 1) = 7. It is isotropic: at e₁ + i e₂ its value is 1 + i² = 0, so over ℂ it is the split form although it is written as a sum of squares. Its polar form at (e_i, e_j) is 2δ_ij, so it is nondegenerate, whereas the weights (1, …, 1, 0) would put e₇ in the radical and the Clifford algebra would not be that of SO₇. Every nondegenerate form on ℂ⁷ is isometric to it, so `spinGroup` of any of them is Spin₇(ℂ)."

Eight findings: four P2 (R01–R04), four P3 (R05–R08). No P1. No finding re-raises a settled one (no earlier report marks anything `not actionable in this package`).

## Verified sound

**Dependency check.** Output: `depcheck: 254 roadmaps, 2413 edges, 0 problem(s)`. No UPWARD or CYCLE line. ExceptionalThetaCorrespondencesForG2 is line 299 of `merge-order/ORDER.txt`, this roadmap line 316.

**Scope of the pull request.** `git diff --stat origin/main...HEAD`: 12 files, all under `packages/LocalLanglandsCorrespondenceForG2/`. No `set_option`, no `lemma`, no process words or pull-request numbers in README or Lean (grep). 19 gap slugs in the README, the same 19 in `design/plan.json`.

**Counts.** Declarations read: 5 of 5. Targets read: 75 (every line of the README). Locators verified against the cached texts: 92 (C 5, CG 11, GS 44, HD 6, GF 6, HKT 6, KS 4, Shin 3, ILM 3, MagaardSavin 1, GS20 1, SV 2), each for the existence of the statement on the cited page; the statements themselves were read for C, CG, HKT Lemma 4.6, GF Theorem 2.4, HD Theorems 8.5 and 15.2, KS Theorem A and Proposition 13.1, Shin Theorem 5.8 and GS §§1.1, 2.2, 3.5, 4.4, 5.2, 8.4, 10.2–10.3, 12.1–12.8. Checks recomputed: about 45 (the tables below give the values). Sibling citations checked: about 90 ids (about 30 in ExceptionalThetaCorrespondencesForG2, about 60 in the other suppliers), of which I read 16 at the supplier text myself (ExceptionalThetaCorrespondencesForG2 §§0.1, 0.6, 6.7, 8.3, 9.4, 9.5, 10.5, 10.6; ModularityAndLanglandsExtensions §§3.15, 3.19, 3.25; SmoothRepresentationsOfLocalGroupsPartII 5.3–5.5; AutomorphicFormsOnReductiveGroups §4.2; GL2AutomorphicRepresentationsAndTransfer R17.1.5) and the rest through located headings and paraphrases. Pinned declarations checked: 27 (all exist with the cited file and namespace; `Matrix.diagonal`, `Matrix.det_diagonal`, `Matrix.charpoly_monic` and `Quaternion` were not opened).

**Suggested.lean table.** No Lean was run (read-only pass); the elaborated types of `scratch/signatures.md` were compared with the README statements, no binder is lost, nothing changed.

| Declaration | Context | README | Instances and values | Result |
|---|---|---|---|---|
| `octonionAut` | no variables; `Subgroup (Octonion ℂ ≃ₗ[ℂ] Octonion ℂ)` | §0.0 | id: in; 2·id: 2 vs 4, out; conj: conj(uu′) = ⟨0,0,0,−e₃⟩ vs ū ū′ = ⟨0,0,0,e₃⟩, out; g(1) = 1 follows from surjectivity | sound, real body |
| `octonionRep` | `{Γ} [Group Γ]` explicit | §0.0 | ρ = 1: trivial representation of dimension 8; t = diag(ζ, ζ, ζ³): eigenvalues 1, 1, ζ, ζ, ζ³, ζ⁴, ζ⁴, ζ² | sound, real body |
| `griess_conjugacy` | `{Γ} [Group Γ]`, two semisimplicity hypotheses, intertwiner `e` | §0.0 | Γ = 1: g = 1; Γ = ℤ/5, t vs t²: multiplicity of ζ is 2 vs 1 on 𝕆, hypothesis fails, t ≁ t²; Γ = ℤ, unipotent image: excluded by semisimplicity; non-abelian Γ = S₃ ⊂ j(SL₃) ⋊ ⟨duality⟩: character determines class; hypothesis on 𝕆 equals that on Im 𝕆 by cancelling the trivial line | true (reduction to a maximal compact subgroup of the reductive Zariski closure and acceptability of compact G₂); not one tactic; not padding |
| `sumSquaresSeven` | abbrev, no variables | §0.8 | e₁ ↦ 1; e₁ + i e₂ ↦ 0; polar 2δ_ij | sound; Checks missing (R08) |
| `spin7_not_acceptable` | closed statement, `Γ : Type`, `Finite Γ` | §0.8 | weights of V: (1,0), (1,2), (0,1), (2,1), sum (4,4) ≡ 0; η ⊗ V: (1,2), (1,0), (0,3), (2,3); V∨: (3,0), (3,2), (0,3), (2,3); three multisets distinct; Γ = ker a² ∪ ker b² ∪ ker (ab)² (x, y or x + y even); `IsConj` in the monoid `spinGroup` uses its units, all elements being units (`Group` instance, `SpinGroup.lean:385`); `spinGroup` at Q = sum of seven squares over ℂ is the even Lipschitz elements with x·star x = 1 | true; not padding; local form absent (R01) |

Headline theorems of the README and their status: §7.1, §7.2, §§3.12–3.13, §3.14, §3.15, §§0.2–0.5, §§0.9–0.10, §§1.4–1.7, §§2.2–2.5, §§5.1–5.6, §6.6, §7.3, §10.1, §10.9: not statable, each named in the module docstring with the missing carrier (checked: `WeilGroup` exists at the pin, no G₂-valued parameters, no smooth representations of G₂(F), no comparison of the octonion automorphism group with `spinGroup`); §0.0 and §0.8 (finite-group form): stated; §0.8 (local form): R01. Nothing in the file is padding. No declaration name of the file occurs in any roadmap on main or at an open head (`roadmaps grep`), and no other roadmap states Griess's theorem or the unacceptability of Spin₇.

**Adversarial table (README).**

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| Conventions, ω = \|·\|⁻¹ | geometric Φ, deg −1 | ω(Φ) = q⁻¹, \|Φ\| = q | consistent with EndoscopicTransfer §10.1 and SR.5.2 |
| §0.0 second form | same character ⇒ isomorphic | characteristic 0, semisimple | holds |
| §0.1 | a = b = 1; a = −1, b = 1; a = 2, b = 3 | (X−1)⁷; (X−1)³(X+1)⁴; {1, 2, 3, 1/6, 1/2, 1/3, 6} | Checks correct |
| §0.1 last Check | Frobenius ↦ i j diag(−1, 1, −1) | spin 1⁴, (−1)⁴, trace 0; vector trace 3 − 4 = −1 | correct |
| §0.2 pole criterion | principal; subregular; 1 ⊕ 1 ⊕ 1 | no pole; pole; order 7, not discrete | holds; uses boundedness of discrete φ |
| §0.2 Check 2 | χ ⊗ Sym², χ cubic | det = χ³ = 1, dual χ⁻¹ ⊗ Sym² | correct |
| §0.5 | ρ = 1; ρ in j(SL₃) ⋊ ⟨duality⟩ | χ^⊕7 no invariants; χ · χ = 1 on the line | both directions consistent |
| §0.7 non-semisimple elements | Spin₄ × Spin₃ ⊂ Spin₇, x = (u, −1, s′u′) | u ⊗ s′u′ ⊕ (−1) ⊗ s′u′ versus its negative: Jordan types (2,2)/(1⁴) or (3,1)/(2,2) differ | the s-isomorphism, not the trace alone, separates; statement holds on the instance |
| §0.8 polar argument | g = kp, x = p r | x = r · (r⁻¹pr) = (k⁻¹ηrk) · p, uniqueness gives r = k⁻¹ηrk | correct |
| §0.8 ℚ₅, ℚ₃ | ℚ₅×/⁴, ℚ₃×/⁴ | ℤ/4 × ℤ/4 (16); ℤ/4 × ℤ/2 (8) | correct |
| §1.1(ii) | ℚ₂; ℚ(√2), c = −(1 + √2) | −7 ≡ 1 mod 8; −c = 2.414 and −0.414 | correct |
| §1.1(iii) | (−1, −3)_ℚ | symbols −1 at 3, −1 at ∞, +1 at 2, product 1 | correct |
| §1.3(c) | D degree 3 | split at real places; H(k_v) compact exactly on S | consistent |
| §1.6 Checks | SL₂(ℝ), D_k^± | ⟨Λ, α∨⟩ = k − 1; D₂^± limits of complementary series | correct |
| §1.7 | t = 0, 1 | h = (3,2,1): weights 0, 0 coincide; h = (11,6,3): ±10, ±7, ±4, ±1 | correct; h₁ > h₂ + h₃ iff t > 0 |
| §2.4 Checks | ℚ₅, s = 2; ψ(5x) | (1 − 5⁻²)/(1 − 5) = −6/25; 5^(−8·3/2) = 5⁻¹² | correct |
| §2.4 St | 2ρ∨ = (6, 4, 2) on (±½, ±½, ±½) | 6, 4, 2, 0, 0, −2, −4, −6 | 1 ⊕ Sym⁶, correct |
| §2.4 cancellation | #T = 1, 2 | R_u R_w R_σ = 1 = R_u R_w R_σ² | R_σ = 1 only with no free place; uses §1.6(ii) correctly |
| §3.10 / §3.11(e) | ψ_a | det(A ⊗ B) = (det A)^r (det B)⁷ | exponent 7r, ω_τ(a)⁷ correct |
| §3.11 real factor | λ = 0 | long coroots b∨, a∨ + b∨, a∨ + 2b∨: 1, 2, 3; short: 1, 4, 5; det Ind(j) = −1 | correct |
| §3.11 uniqueness | Irr♥ and Irr♠ cases | places other than v₀: St or spherical or π_deg[1] or Irr♣ | every auxiliary factor covered by (i) or the earlier case |
| §4.2 | D₂ = D₁^op | Aut(D⁺) identifies PD₂× with PD₁× by inversion | "τ on D₂ = τ∨ on D₁" consistent |
| §4.3 | p = 3 | self-dual discrete of PGL₃: only St | reduces to §4.4, correct |
| §4.5 | τ principal series, three quadratic characters | S_φ = ℤ/2, lifts of τ⁺, τ⁻ | consistent |
| §8.1 | \|λ_i\| ∈ (q^(−1/2), q^(1/2)) | \|λ_i^(±1) λ_j^(±1)\| ∈ (q⁻¹, q) | no coroot value q^(±1); trivial representation: λ₁/λ₂ = q, excluded by the bound |
| §10.2 | discreteness on weak classes | finite centralizer in Spin₇ iff in SO₇; depends on q-image only | holds |
| §10.6 | σ′ ∈ X | "not through Spin₆" is a property of the q-image, shared by X | hypothesis of §8.1 holds for σ′ |
| §10.9 | weak class of i ∘ φ | lifts χ · (i ∘ φ) with s-image 1 ⊕ v ∘ φ are conjugate by §0.5 | one Spin₇-class |

**Suppliers.** All cited sections and named targets exist at main or at the supplier's open head, apart from the four of R05. The normalisations agree: ClassFieldTheory Layer 9 and the pinned `weilDegree` are arithmetic; EndoscopicTransfer §10.1 is geometric with ω(w) = q^(deg w); the README's transport sentence is the inversion of SR.5.2. `TauCeti.CayleyDickson` has the product ⟨ac − d̄b, da + bc̄⟩ of README line 50 (`TauCeti/Algebra/CayleyDickson/Basic.lean:202`). The compound gaps poincare-weak-containment, cubic-jordan-global-theta and real-exceptional-theta-parameters enumerate their parts with hypotheses and conclusions and were not raised.

**Copyright.** Passages set beside the sources: §0.9 / C lines 235–243; §0.10 / C lines 2189–2198; §0.8 / CG lines 489–502 and 1232–1252; §0.6 / GS lines 1444–1446; §0.5 / HKT lines 896–915; §1.1 / GS lines 1171–1178; §1.2 / GS lines 1215–1220; §1.4 / GS lines 1179–1183; §1.7 / GS lines 1543–1570; §2.4 / GS lines 757–807; §3.11 / GF lines 165–204; §3.15 / GS lines 164–171; §10.5 / GS lines 1635–1640; the docstring of `spin7_not_acceptable` / CG lines 505–507. Longest shared run: seven words in the definition of "semisimple" in §0.10 (C line 2196), a definition with one wording. No table, figure or list is taken over. Arrangement: GS has the largest share. Its contents run §2 (theta and parameters), §3 (L), §3.5 (A₂ packets), §4 (triality), §5 (Kret–Shin), §6 (surjectivity), §8 (fibres), §9 (enhanced theta), §10–11 (appendices: globalization, Fell topology), §12 (weak correspondence). The layers correspond as Layer 0 ↔ §2.2 with C, CG, HKT and Griess; Layer 1 ↔ §10; Layer 2 ↔ §4; Layer 3 ↔ §§3.1–3.4 with GF; Layer 4 ↔ §3.5; Layer 5 ↔ §5; Layer 6 ↔ §§6, 8; Layer 7 ↔ §9; Layer 8 ↔ §§12.5–12.6; Layer 9 ↔ §§12.2–12.4; Layer 10 ↔ §§12.7–12.8. The order is not the source's (Layers 1 and 2 precede Layer 3; Layer 8 precedes Layer 9), the scopes are not one to one (Layers 0, 3 and 6), and the run Layers 4–7 is forced by the `*Needs:*` lines §4.1 → §3.4, §5.3 → §3.2, §6.2 → §5.3, §7.1 → §6.7.

Source independence: 14 passages compared with 5 sources (GS, C, CG, HKT, GF), none shared; largest share GS, about 100 of about 170 locators (counted by pattern); contents compared with GS: independent.

## Not verifiable

- Griess, Theorem 1: the text is settled as uncertified. The statement of `griess_conjugacy` was checked against its use in C (line 2239) and HKT (line 913) and against an independent argument, not against the theorem as printed.
- SpV §1.5, Theorems 1.7.1 and 1.8.1: settled as uncertified.
- The Lean statement proposed in R01 was not elaborated: this pass runs no Lean.
- The sources behind the suppliers' sections (Arthur, Xu, Kato, Kudla, Jiang–Zhang, GQT, Adams–Barbasch) are not in this roadmap's manifest; the contracts were checked against the suppliers' READMEs only.
- Eight suppliers (ModularityAndLanglandsExtensions, EndoscopicTransferAndUnitaryTraceComparison, MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactors, AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory, AutomorphicGaloisRepresentationsPartII, GL2AutomorphicRepresentationsAndTransfer) are open pull requests without a checkout in the list of 181; they were read through `roadmaps show`, and ownership against the remaining open pull requests without files was checked only by `roadmaps grep`.
- GS Proposition 11.6 and GF §2.7 (the two "Notes on the sources" entries about them) were not reread against the texts.
- SV Theorem 16.3.2 and Remark 16.4.1: located (SV lines 11075, 11239), hypotheses not compared with the three instances of the declared gap.

## Source issues

- **Error** in HKT at proof of Lemma 4.6, arXiv v3 p. 21: the source says the stabilizers of all nonzero vectors of the spin representation are the conjugates of G₂; it should be the nonisotropic vectors, isotropic ones having other stabilizers; affects the proof.
- **Gap** in GS at proof of Lemma 12.4, p. 37: the source takes spin-regular discrete series at the real places from Shin's Theorem 5.8; it should be the density limit along an explicit spin-regular weight sequence (Shin, Corollary 4.12); affects the proof.
- **Gap** in GS at proof of Proposition 4.1(i), pp. 18–19: the source takes every finite place outside the prescribed ones spherical, while its Proposition 10.7 leaves one place uncontrolled; it should be a globalization with no exceptional place; affects the proof.
- **Gap** in GS at proof of Lemma 8.3, p. 25: the source applies the spin-pole theorem of GS20 over a totally real field; it should be noted that GS20 Theorem 1.1 is stated over ℚ only; affects the proof.
- **Error** in GS at Main Theorem (vi), p. 4: the source puts generic discrete series of PGSp₆ in the middle of the spin diagram; it should be generic tempered representations, the lift of a discrete series from PGL₃ being Siegel-induced (HD, Theorem 15.2); affects a stated result.
- **Misprint** in GS at Main Theorem (ix), p. 4: the source closes the parenthesis of the gamma factor before the tensor product with the parameter of τ; it should be the gamma factor of the tensor product of the two parameters; affects nothing.

## For the human reviewers

- **Licence.** `griess_conjugacy` in `Suggested.lean` rests on Griess, Theorem 1, and README §1.1(i) on SpV Theorems 1.7.1 and 1.8.1; both sources are `uncertified` in `sources.toml` (texts not read).
- **Scope.** GF (arXiv:2308.12561 v1) and MagaardSavin (arXiv:1406.3773) are cited from arXiv preprints; §3.11 rests on GF. The README's "Notes on the sources" changes thirteen printed statements or proofs of GS, GF and HKT.
- **Not tested.** The Lean statement proposed in R01 was written without elaboration.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3b3f4a7812964d134e8cf61a7fd35996a4f846ac", "job": "RT-LocalLanglandsCorrespondenceForG2~1b", "model": "fable", "worker": "chris-x30"} -->
