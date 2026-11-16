<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13172#issuecomment-6913356193 -->
Red team round 2 pass a (claude) of 11a1332

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) Three properties of Arthur's tempered correspondence are used and no supplier states them

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:70`: "§3.15 Arthur's local packets and the local correspondence for quasi-split classical groups (used for Sp₆ and split SO₈ …)". Consumers: line 542 (§3.1: "for non-supercuspidal π read the parameter from the explicit lift tables and the correspondence for the Levi subgroups"), line 584 (§3.4: "compare Levi parameters through normalized induction"), line 444 (§2.0 Check: "St_Sp₆ is tempered (r = 0) with parameter Sym⁶"), line 817 (§5.1: "the set of discrete parameter classes"), line 862 (§5.5), line 893 (§6.1: "the supercuspidal spin-pole criterion gives a nonzero G₂ lift"), §§8.2, 9.3, 10.2, 10.8.

   **Claim.** ModularityAndLanglandsExtensions §3.15 supplies, for Sp₆ and split SO₈: (a) that a tempered packet consists of discrete series exactly when its parameter is discrete; (b) that the packet of a bounded parameter factoring through a Levi subgroup is the set of constituents of the induced representations; (c) the parameters of non-supercuspidal discrete series in terms of their supercuspidal support, and supercuspidality of the packets of discrete parameters trivial on SL₂(ℂ).

   **Witness.** ModularityAndLanglandsExtensions §3.15 at its head states only (a) stable characters, (b) endoscopic identities, "(c) … Π̃_φ is tempered, a set with injective pairing (bijective for p-adic F), and these packets partition the tempered dual". ExceptionalThetaCorrespondencesForG2 §8.9 assumes "generic supercuspidal σ of PGSp₆"; §6.1 never shows σ supercuspidal. `roadmaps grep` finds no owner (Mœglin, cuspidal support, induction of packets: no hit for classical groups).

   Instances: (b) θ(π_gen[1]) restricted to Sp₆(F) is a tempered constituent of the Siegel induction of St₃; §3.4 and §4.4 give it the parameter 1 ⊕ Sym² ⊕ Sym², which §3.15(c) does not determine. (c) θ(St_G₂) = St_PGSp₆; §3.1, §2.3 and §8.1 give its restriction the parameter Sym⁶, which no cited section states locally. (a) §5.2 needs the parameter of the discrete series σ to be discrete for KS(σ) ≠ ∅.

   **Repair.** Add three contracts under `### From TauCetiRoadmap.ModularityAndLanglandsExtensions`, with the same slugs in the top-level `gaps` of `design/plan.json` (supplier `ModularityAndLanglandsExtensions`, section `Layer 3, §3.15`), and add each to the `*Needs:*` of its consumers and to the Dependencies of Layers 2, 3, 5, 6, 8, 9 and 10:

   - "What ModularityAndLanglandsExtensions must provide (gap:classical-discrete-packets): for G = Sp₂ₙ or split SO₂ₙ over F and a bounded parameter φ, the members of the tempered packet of φ (§3.15(c)) are square-integrable exactly when φ is discrete, that is, when its composite with the standard representation is a multiplicity-free sum of irreducible orthogonal representations of WD_F; used in §§5.1, 5.2, 8.2 and 10.2."
   - "What ModularityAndLanglandsExtensions must provide (gap:classical-packets-parabolic-induction): for G = Sp₂ₙ or split SO₂ₙ over F, a standard Levi subgroup M ≅ GL_(n₁) × ⋯ × GL_(n_r) × G₀, bounded parameters φ_i of GL_(n_i) and a bounded parameter φ₀ of G₀, the tempered packet of ⨁_i (φ_i ⊕ φ_i∨) ⊕ φ₀ is the set of irreducible constituents of the normalized inductions of rec⁻¹(φ₁) ⊗ ⋯ ⊗ rec⁻¹(φ_r) ⊗ τ₀, τ₀ running over the tempered packet of φ₀ (for SO₂ₙ up to the outer automorphism); used in §§3.1, 3.4, 3.6, 5.5, 9.3 and 10.8."
   - "What ModularityAndLanglandsExtensions must provide (gap:classical-packets-cuspidal-support): for G = Sp₂ₙ or split SO₂ₙ over F and a discrete parameter φ = ⨁_i ρ_i ⊠ S_(a_i) (ρ_i irreducible representations of W_F, S_a the a-dimensional representation of SL₂(ℂ)): if every a_i = 1, every member of the packet of φ is supercuspidal; and if a member is a subquotient of the normalized induction of a supercuspidal τ₁ ⊗ ⋯ ⊗ τ_r ⊗ τ₀ of a Levi subgroup GL_(d₁) × ⋯ × GL_(d_r) × G₀, then ⨁_j (rec(τ_j) ⊕ rec(τ_j)∨) ⊕ λ₀ ≅ ⨁_i ⨁_(0 ≤ k < a_i) ρ_i|·|^((a_i−1)/2−k) as representations of W_F, λ₀ being the same restriction for the parameter of τ₀; in particular St_Sp₂ₙ has parameter Sym²ⁿ (Mœglin's description of the cuspidal support of discrete series; GS, proof of Proposition 6.1, pp. 21–22, uses both parts); used in §§2.0, 2.3, 3.1, 6.1, 7.2 and 8.1."

   In §6.1 Route insert after "a generic lift σ to PGSp₆": "which is supercuspidal, its restriction containing the supercuspidal σ₀ (classical-packets-cuspidal-support contract)". In §3.1 Route replace "and the correspondence for the Levi subgroups" by "and the correspondence for the Levi subgroups, through the classical-packets-parabolic-induction and classical-packets-cuspidal-support contracts". Add the names of the three properties to the last paragraph of "Scope and ownership".

   Tested on the refuting instances: (c) at St_Sp₆, support the trivial character of the torus with exponents (3, 2, 1): |·|^(±3) ⊕ |·|^(±2) ⊕ |·|^(±1) ⊕ 1 = the restriction of Sym⁶ (ρ = 1, a = 7: exponents 3, …, −3), and a discrete parameter is determined by that restriction (the longest segment is read off the largest exponent, then removed), so the parameter is Sym⁶; (b) at I₃(St₃): φ₁ = Sym², G₀ trivial, packet parameter Sym² ⊕ Sym² ⊕ 1 = v ∘ j ∘ Sym²; (c) at §6.1: q ∘ i ∘ φ trivial on SL₂(ℂ) has every a_i = 1, so σ₀ is supercuspidal and §8.9 applies; (a) at σ = St: Sym⁶ is irreducible, hence discrete.

2. **F02** (P2) The spin-factor contract does not say what the archimedean factors of its functional equation are

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:101` (gap:pgsp6-shahidi-spin-factor): "the gamma and epsilon factors … of generic irreducible representations σ of PGSp₆(F) … and the global functional equation for globally generic cuspidal representations of PGSp₆ over a number field"; line 510 (§2.4): "at every complex place the identity is the pgsp6-pgso8-complex-theta contract".

   **Claim.** The contract fixes every factor of the functional equation that §2.4 divides out.

   **Witness.** F is nonarchimedean (Conventions, line 27), so the contract defines no γ(s, Σ_v, spin, Ψ_v) at a complex place v; §2.4 uses a totally complex k. A supplier meeting the contract with any archimedean factor leaves R_v at the complex places undetermined, and the cancellation R_u R_w R_σ^(#T) = 1 (line 517) fails.

   **Repair.** In line 101 (and in the `needs` of the plan entry) replace "and the global functional equation for globally generic cuspidal representations of PGSp₆ over a number field" by: "and the global functional equation L^S(1 − s, Σ∨, spin) = ∏_(v∈S) γ(s, Σ_v, spin, Ψ_v) L^S(s, Σ, spin) for globally generic cuspidal representations Σ of PGSp₆ over a number field k, S a finite set of places containing the archimedean ones and those where Σ or Ψ is ramified, in which the factor at an archimedean place v is the gamma factor of the representation s ∘ φ_v of W_(k_v), φ_v : W_(k_v) → Spin₇(ℂ) the Langlands parameter of Σ_v (AutomorphicLFunctionsAndLocalFactors, AL.1.4 and AL.R.2)". In §2.4 Route replace "at every complex place the identity is the pgsp6-pgso8-complex-theta contract" by "at every complex place v the spin factor is that of s ∘ φ_v (pgsp6-shahidi-spin-factor contract) and SpinLift(Σ_v) has parameter s ∘ φ_v (pgsp6-pgso8-complex-theta contract), so R_v = 1". Tested: with both sides at a complex v equal to γ(s, s ∘ φ_v, Ψ_v), R_v = 1 and the two identities of line 517 read R_u R_w R_σ = 1 and R_u R_w R_σ² = 1.

3. **F03** (P3) §0.3 cites a work with no locator and no manifest entry for the centralizer comparison

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:202`: "the centralizer comparison is Gross–Savin's".

   **Claim.** The isomorphism S_φ ≅ S_(i∘φ)/image Z(Spin₇) has a route with a located source.

   **Witness.** `sources.toml` has 14 ids (CG, GF, HKT, HD, GS, C, KS, Shin, GS20, SV, ILM, Griess, SpV, MagaardSavin); none is a Gross–Savin text, and the sentence gives no theorem or page. ExceptionalThetaCorrespondencesForG2 §0.8 defines the two groups and proves no comparison.

   **Repair.** Replace "the centralizer comparison is Gross–Savin's" by: "for the centralizers, s ∘ i ∘ φ = 1 ⊕ v ∘ φ and v ∘ φ has no nonzero invariant vector for diamond discrete φ (§0.2), so the invariant spinors form one line ℂx₀, x₀ nonisotropic with stabilizer i(G₂(ℂ)); Z_(Spin₇)(i ∘ φ) preserves that line and the spin quadratic form, so it acts on x₀ by ±1, the central −1 acting by −1; hence Z_(Spin₇)(i ∘ φ) = i(Z_(G₂)(φ)) × μ₂ and the quotient by μ₂ is Z_(G₂)(φ) (GS, §8.3, p. 24)". Tested on the Check of §0.3: for φ principal, Z_(G₂)(φ) = 1 and Z_(Spin₇)(i ∘ φ) = μ₂, quotient trivial.

Three new findings: S01 (P1), S02 (P2), S03 (P3). All twelve round-1 findings are repaired at this head. No finding re-raises a settled one (the repair report marks nothing `not actionable in this package`).

## Round-1 findings at this head

| Round-1 finding | Status | Witness at 11a1332 |
|---|---|---|
| a/F01 = b/F01 (local unacceptability absent) | repaired | `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean:155–163`: `theorem spin7_not_acceptable_weilGroup (K : Type*) … ∃ r η : TauCeti.ClassFieldTheory.WeilGroup K →* spinGroup sumSquaresSeven, IsOpen (r.ker …) ∧ Finite r.range ∧ …`; README line 262 names it; README line 53 lists the pinned Weil group. Pin checked: `TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:181` (`def WeilGroup`), `…/WeilGroup/Topology.lean:77` (topology induced from `G_K × ℤ`, so the kernel `W_E` of `sgn_(E/F)` is open). |
| a/F02 = b/F03 (compound gaps) | repaired | README lines 85–88: four contracts `gap:pgsp6-similitude-twist-rule`, `gap:pgsp6-steinberg-pgo6-vanishing`, `gap:pgsp6-lower-tower-parameters`, `gap:pgsp6-pgso8-induction-principle`; lines 64–65: `gap:cubic-jordan-global-theta`, `gap:cubic-period-global-theta`. The 23 slugs of the README equal the 23 of `design/plan.json` (compared mechanically). The old slug occurs nowhere. |
| a/F03 = b/F05(2) (SRU numbering) | repaired | README line 105: "SRU.5.4, *unramified-principal-series-irreducibility* … and SRU.5.5, *spherical-generic-criterion*"; no "§5.3" remains with SRU. |
| a/F04 (§3.14 hypotheses) | repaired | README line 714: "Prove that a map Irr(G₂(F)) → Φ(G₂) satisfying the two diagrams of §3.2 equals L; in particular so does a map that also satisfies §§3.5–3.7". |
| b/F02 (Arthur parameter of non-tempered representations) | repaired, with a remaining gap raised as S01 | README §2.0 (lines 428–448) defines the parameter by the Langlands classification; Conventions line 34 points to it. The definition is sound on the instances tried (table below); what it still takes from the supplier without a statement is S01. |
| b/F04 (unbounded localizations in §§3.1, 8.2) | repaired | README line 542: "If ψ_v₀ is bounded the packet is its tempered L-packet (§3.15); if it is unbounded its members are irreducible standard modules with L-parameter ψ_v₀ (§3.25)"; same in §8.2 (line 1054) and §5.2 (line 832). The "image statement of §5.1" it uses exists: ModularityAndLanglandsExtensions §5.1, "Image/converse: Π=⊞Π_i … Sp/even SO requires symmetric-square poles, orthogonal type, and total trivial central character". |
| b/F05(1) | repaired | README line 678: "being lifted from the split group H(k_v) (§§5.9, 8.3)"; ExceptionalThetaCorrespondencesForG2 §8.3 states "Irr♣ … is contained in Irr♥". |
| b/F05(3) | repaired | README line 1218: "§12.8, pp. 39–40"; GS line 1629 is on p. 39. |
| b/F05(4) | repaired | README line 163: "§0.1 (the octonion model of G₂ … so that v is valued in SO₇) and §0.6". |
| b/F06 | repaired | README line 137: "the faithful representation of Spin₇(ℂ) by left multiplication on the complex Clifford algebra with its Hermitian inner product and adjoint g†". |
| b/F07 | repaired | README line 312: "an eight-dimensional unital K-algebra that is not assumed associative"; Check at line 333 recomputed: (uu′)w = ⟨0,0,−e₂,0⟩, u(u′w) = 0. |
| b/F08 | repaired | README lines 273–275: three Checks on `sumSquaresSeven` (values 1 and 7; 1 + i² = 0; polar form 2δ_ij). |

No repair introduced a false statement. The repairs introduced no new slug mismatch, no process wording and no change outside the package folder (`git diff --stat origin/main...HEAD`: 13 files, all under `packages/LocalLanglandsCorrespondenceForG2/`).

## Verified sound

**Dependency check** (the command of the brief), full output:

    depcheck: 259 roadmaps, 2476 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. In `merge-order/ORDER.txt` the roadmap is line 316; AutomorphicLFunctionsAndLocalFactorsPartII is 298 and ExceptionalThetaCorrespondencesForG2 is 299.

**Declarations of `Suggested.lean` (6).** No Lean was run (not permitted in this pass); the elaborated types are those the worker supplied, compared one by one with the README. Nothing changed.

| Declaration | Context | Lean side | README side, instances and values | Result |
|---|---|---|---|---|
| `octonionAut` (def, l. 87) | no variables | `Subgroup (Octonion ℂ ≃ₗ[ℂ] Octonion ℂ)`, carrier g(xy) = g(x)g(y) | §0.0; id ∈; 2·id: 2 against 4, ∉; conj: conj(uu′) = ⟨0,0,0,−e₃⟩ against ū ū′ = ⟨0,0,0,e₃⟩, ∉ | agree, real body |
| `octonionRep` (def, l. 104) | `{Γ : Type*} [Group Γ]` in the signature | γ ↦ linear map of ρ γ | §0.0; t = diag(ζ, ζ, ζ³), det ζ⁵ = 1: eigenvalues 1, 1, ζ, ζ, ζ³, ζ⁴, ζ⁴, ζ² | agree |
| `griess_conjugacy` (theorem, l. 121) | `{Γ : Type*} [Group Γ]`; both semisimplicity hypotheses and the intertwiner are explicit binders | ∃ g, ∀ γ, ρ′ γ = g ρ γ g⁻¹ | §0.0; Γ = 1: g = 1; ℤ/5 with t, t²: ζ has multiplicity 2 against 1, no intertwiner, t ≁ t²; arbitrary Γ: reduction to a maximal compact subgroup of the reductive Zariski closure of (ρ, ρ′) | agree; true |
| `sumSquaresSeven` (abbrev, l. 131) | none | `weightedSumSquares ℂ 1` on `Fin 7 → ℂ` | §0.8; e₁ ↦ 1, (1,…,1) ↦ 7, e₁ + i e₂ ↦ 0, polar 2δ_ij | agree |
| `spin7_not_acceptable` (theorem, l. 140) | closed | ∃ finite Γ, r, r′, pointwise `IsConj`, no conjugator | §0.8; weights (1,0), (1,2), (0,1), (2,1), sum (4,4) ≡ 0; η ⊗ V = (1,2), (1,0), (0,3), (2,3); V∨ = (3,0), (3,2), (0,3), (2,3); on ker a²: η ⊗ V = V∨; on ker (ab)²: η ⊗ V = V; on ker b²: η = 1 | agree; true |
| `spin7_not_acceptable_weilGroup` (theorem, l. 155) | `(K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K]`, all in the signature | ∃ r η, open kernels, finite range of r, η central of square one, pointwise `IsConj (r w) (η w * r w)`, no conjugator | §0.8 local form; r = η = 1: all clauses but the last, g = 1 refutes it; r = 1, η = sgn: 1 ≁ −1; unramified r of infinite order: kernel I_F open, range infinite; ℚ₅×/ℚ₅×⁴ of order 16, ℚ₃×/ℚ₃×⁴ of order 8; Mathlib `spinGroup` = even products of vectors with ∏Q = 1, which over ℂ is Spin₇(ℂ) | agree at the README's generality (nonarchimedean, characteristic zero); true by CG Proposition 8.3 |

Padding probe: neither unacceptability theorem follows from the other by one tactic (the finite-group form would need a concrete K and finiteness of the centre of `spinGroup`); no `example`, no Check mirrored. Imports: `Mathlib` and two existing Tau Ceti modules. No `set_option`, `lemma`, `#check`, `#eval`. Headline theorems of the README: §0.0 and both forms of §0.8 are stated; §§0.2–0.5, 0.9–0.10, 1.4–1.7, 2.2–2.5, 3.12–3.15, 5.1–5.6, 6.6, 7.1–7.3, 8.2, 10.1, 10.9 are named in the module docstring with the missing carrier (smooth representations of p-adic groups, G₂- and Spin₇-valued parameters, automorphic representations, the comparison of `octonionAut` with `spinGroup`); none of these carriers is at the pins.

**Adversarial pass on the README targets.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.0 four forms | Γ = 1; ℤ/5; Γ = ℤ; WD_F | t²: 1, ζ², ζ², ζ, ζ³, ζ³, ζ⁴ | holds | none |
| §0.1 branchings | a = b = 1; a = −1, b = 1; a = 2, b = 3; centre | (X−1)⁷; (X−1)³(X+1)⁴; {1,2,3,1/6,1/2,1/3,6}; traces 8, −8 | holds | none |
| §0.2 | Sym²; χ ⊗ Sym²; three characters (χ₁, χ₂, χ₃) against (χ₁, χ₂⁻¹, χ₁⁻¹χ₂) | equal v-images force χ₂² = 1 or χ₁² = 1, and then the two triples coincide | holds | none |
| §0.3 | principal; subregular | 1 ⊕ Sym⁶, one line; 1 ⊕ 1 ⊕ Sym² ⊕ Sym², multiplicity 2 in q, not discrete | holds | S03 (route) |
| §0.4, §0.5 | ρ = 1; sign on the SL₃-line | χ^⊕7; invariants of a completely reducible orthogonal representation are nondegenerate | holds | none |
| §0.6, §0.7 | trivial against central; g = su with s̄ = diag(−1⁴, 1³), u of type (2,2) | spin restricted to Spin₄ × Spin₃: +1 space of Jordan type (2,2), −1 space (1⁴); for −g they are exchanged, so s(g) ≁ −s(g) where g ≁ −g | holds on the instance | none |
| §0.8 | (ℤ/4)²; ℚ₅; ℚ₃; three quadratic extensions for p odd (F×/F×² of order 4) | as in the declaration table | holds | none |
| §0.9, §0.10 | Sym⁶ f; 1 ⊕ ρ ⊕ ρ∨ | principal SL₂ in G₂; j ∘ ρ | holds | none |
| §1.1(i)–(iii) | isotropic x = a + v with a = 0 and a ≠ 0; ℚ₂; ℚ(√2); S = {p}, {p, p′}; totally complex k | n₀(v/a) = −1 or n₀ universal; 7 + (√−7)² = 0; −c = 2.414, −0.414; parities 2, 3 → 4; R = ∅ gives M₂(k) | holds | none |
| §1.3–§1.6 | S = ∅; ℝ in L²(ℝ); SL₂(ℝ) D_k^± | constants; ⟨Λ, α∨⟩ = k − 1 | holds (contracts) | none |
| §1.7 | t = 0, 1 | h = (11,6,3): ±10, ±7, ±4, ±1; t = 0: h₁ = h₂ + h₃, weight 0 twice; 14t even | holds | none |
| §2.0 | trivial of Sp₆; St_Sp₆; trivial of SO₈; Borel module of SO₈ with ν₃ > −ν₄ > 0 | q^(−3..3), N = 0; Sym⁶; 6 + 2 = 8; the abstract isomorphism M ≅ GL₁⁴ gives exponent |ν₄| and the class modulo O₈(ℂ) is unchanged | well defined | S01 (inputs) |
| §2.1 | f₁ against f₂ | sim ∘ f₁ trivial modulo squares; sim ∘ f₂ = connecting map of Spin₈ → SO₈ = spinor norm | holds | none |
| §2.2–§2.3 | trivial parameter; Steinberg place | 1⁸ against (−1)⁸; Sym⁶ has no SL₂-invariant, 1 ⊕ Λ²Sym³ has two | holds | none |
| §2.4 | ℚ₅, s = 2; ψ(5x); #T = 1, 2; principal SL₂ | (24/25)/(−4) = −6/25; 5^(−8·3/2) = 5⁻¹²; R_σ = 1; (±6 ± 4 ± 2)/2 = 6, 4, 2, 0, 0, −2, −4, −6 | holds | S02 (complex places) |
| §2.5 | St, χ unramified | traces 8, −8 | holds | none |
| §3.1–§3.9 | St_G₂; trivial; real weights of θ of compact G₂ | pairings n, m + n, m + 2n with m, n ≥ 1 are distinct, so the seven weights 0, ±n, ±(m+n), ±(m+2n) are distinct and A is regular; nontempered φ has Z(φ) inside GL₂ or T, connected | holds | S01 (inputs of §§3.1, 3.4) |
| §3.8 | W_F → T[2] with three distinct quadratic characters | W(G₂) → GL₂(𝔽₂) has kernel ±1, centralizer T ⋊ ⟨−1⟩, S_φ = ℤ/2 | holds | none |
| §3.10–§3.12 | ψ_a; P- and Q-Levi | det(A ⊗ B) = (det A)^r (det B)⁷; 2+2+1+1+1 and 2+2+3 | holds | none |
| §3.11 | λ = 0; split real place with a + b < 1/2 | short coroots 1, 2, 3, long 1, 4, 5; pairings a, b, b − a, a + 2b, 2a + b, a + b, a + b, b, a, all in (−1, 1) | holds | none |
| §3.13–§3.15 | St_G₂; regular weight; weight orthogonal to a long root | differences of weights of v are roots or twice short roots: seven distinct weights; two equal | holds | none |
| §4.1–§4.5 | p = 3; self-dual supercuspidals | irreducible subgroups of SO₃: A₄, S₄, A₅; A₄ and S₄ need a normal 2-group as wild inertia, so p = 2 | holds | none |
| §5.1–§5.6 | St; π_gen[1] | KS(St) principal; Sym² ⊕ Sym² ⊕ 1 ⊕ 1 | holds | S01 (discreteness, induction) |
| §6.1–§6.7 | φ trivial on SL₂; two-place substitution | every a_i = 1; sign² = 1; ζ^S pole | holds given S01 | S01 |
| §7.1–§7.4 | principal, subregular, trivial | fibres 1, 3, 1; |Irr(S₃)| = 3 | holds | none |
| §8.1–§8.2 | trivial representation; unitary cuspidal Π | (q³, q², q), coroot value q; |λ_i^(±1) λ_j^(±1)| ∈ (q⁻¹, q) | holds | none |
| §9.1–§9.4 | St_PGL₄; Levi count | Λ²Sym³ = Sym⁴ ⊕ 1; 2³ − 1 = 7 | holds | none |
| §10.1–§10.9 | χ twist; q-image with a trivial summand | Λ²(φ ⊗ χ) = Λ²φ; a fixed vector with trivial character puts φ̃ in Spin₆ | holds | none |

**Counts.** Declarations read: 6 of 6. README lines read: 1279 of 1279; targets and definitions read: 76 (§§0.0–10.9). Checks recomputed: 41 (values in the two tables). Pinned declarations opened this round: `TauCeti.ClassFieldTheory.WeilGroup` and its `Group` instance, `instTopologicalSpaceWeilGroup`, `weilToAbsolute`, `weilDegree`, `Representation.IsSemisimpleRepresentation` (`Mathlib/RepresentationTheory/Semisimple.lean:34`), `spinGroup` (`SpinGroup.lean:293`, `Group` at l. 385), `QuadraticMap.weightedSumSquares` (`QuadraticForm/Basic.lean:1408`): 8. Sibling citations read at the supplier's head this round: ModularityAndLanglandsExtensions §§3.15, 3.17, 3.19, 3.24, 3.25, 5.1; ExceptionalThetaCorrespondencesForG2 §§0.8, 5.1, 5.2, 5.7, 8.3, 8.8, 8.9, 10.4–10.7 and the 20 italic headings of that roadmap that the README quotes (all exist); MetaplecticAutomorphicForms §§3.41, 3.42: 23 sections. `roadmaps resolve` reports no citation and no Lean name found nowhere. Locators verified against the cached texts this round: 31 (GS: Definition 12.1, Lemma 12.2, §§12.2–12.8, Theorems 12.3, 12.6, 12.7, Lemmas 12.4, 12.5, Proposition 6.1, with pages 34–40 and 21–22; HD: Theorems 8.2, 8.5, 15.1, 15.2, Lemmas 13.4, 13.8; GF: Definition 2.1, Proposition 2.3, Theorem 2.4, Lemma 2.5, §2.8; HKT: Theorem 3.3, Proposition 4.3, Lemma 4.4, Proposition 4.5, Lemma 4.6; CG: Proposition 8.3 with formula (16); Shin: Definition 3.5, Corollary 4.12, Theorem 5.8; MagaardSavin: Proposition 8.2; ILM: Proposition 4.5, Lemma A.2, Proposition A.5; GS20: Theorem 1.1; SV: Theorem 16.3.2, Remark 16.4.1).

**Gaps.** 23 slugs in the README, the same 23 in `design/plan.json`, each with a named supplier earlier in the merge order. The six contracts written in round 1 are precise on the instances of the repair report (twist rule: sim(g, a) ≡ det g modulo squares; induction principle at n₀ = 0 gives φ_τ ⊕ φ_τ∨ ⊕ 1 ⊕ 1). MetaplecticAutomorphicForms §§3.34, 3.41, 3.42 at its head state none of them. One contract is imprecise: S02.

**Ownership.** Not a second copy: main has no `LocalLanglandsCorrespondenceForG2` folder. §2.0 is owned here: ModularityAndLanglandsExtensions §3.15 is tempered only, its §3.18 covers odd orthogonal groups, and `roadmaps grep` finds no other parametrization of all of Irr(Sp₆). No declaration name of `Suggested.lean` occurs in another roadmap. Ownership against open pull requests was checked through the `roadmaps` tools and the suppliers' heads (`roadmaps show`).

**Policy.** No pull-request number, process word, `lemma` or machine path in the README or the Lean file (grep); every target has a locator; no algorithm.

**Copyright.** Passages set beside the sources this round: §6.1 / GS lines 891–918; §9.1 / GS lines 1479–1509; §§8.2, 9.3 / GS lines 1520–1536; §8.1 / GS lines 1576–1590; §10.3 / GS lines 1614–1628; Conventions on the PGSp₆ loci / GS lines 1454–1478; §0.8 local Route / CG lines 1232–1250; §0.5 / HKT lines 896–915. Longest shared run: five words ("Let Γ be a group", HKT line 896), in a lemma statement whose hypothesis list has one wording. No table, figure or list is taken over. Arrangement against GS (contents at GS lines 64–71 for §12): Layer 0 ↔ §§2.2, 12.1 with C, CG, HKT; Layer 1 ↔ §10 and Lemma 12.4; Layer 2 ↔ §4; Layer 3 ↔ §3; Layer 4 ↔ §3.5; Layer 5 ↔ §5; Layer 6 ↔ §§6, 8; Layer 7 ↔ §9; Layer 8 ↔ §§12.5–12.6; Layer 9 ↔ §§12.2–12.4; Layer 10 ↔ §§12.7–12.8. The order is not the source's (2, 10, 4, 3, 3.5, 5, 6–8, 9, 12.5–12.6, 12.2–12.4, 12.7–12.8), and Layers 0, 1, 3 and 6 each draw on several sections; the run Layers 4–7 is forced by the `*Needs:*` lines §4.1 → §3.4, §5.3 → §3.2, §6.2 → §5.3, §7.1 → §6.7.

Source independence: 8 passages compared with 3 sources (GS, CG, HKT), none shared; largest share GS, 103 of 170 locators (counted by pattern); contents compared with GS: independent.

## Not verifiable

- Griess, Theorem 1, and SpV §1.5, Theorems 1.7.1 and 1.8.1: settled as uncertified, not read. `griess_conjugacy` was checked against its use in HKT (line 913) and by the reduction to the compact case.
- The three contracts proposed in S01 are written from the standard statements (Arthur's construction of tempered packets from Levi subgroups; Mœglin's cuspidal-support description); Arthur's and Mœglin's texts are not in this roadmap's manifest and were not read, so the supplier fixes the locators.
- KS Lemma 2.1, Corollary 2.2, Proposition 13.1 and Theorem A: the pattern search of the cached text did not find the headings in this pass (ligatures in the extraction); round 1 pass b located them.
- The statements imported through the 23 declared gaps: contracts, checked for wording only.
- No Lean was elaborated in this pass; the repair report records exit 0 with three `sorry` warnings.

## Source issues

- **Gap** in GS at proof of Proposition 6.1, p. 21: the source takes the generic member of the Sp₆ packet of a discrete parameter trivial on the Deligne SL₂ to be supercuspidal without a reference; it should cite Mœglin's description of supercuspidal members of packets; affects the proof.
- **Gap** in GS at proof of Theorem 12.3, second bullet, p. 36: the source omits the determination of the lift of a non-discrete heart representation and of its parameter; it should give the induction principle and the Levi parameters; affects the proof.
- **Error** in HKT at proof of Lemma 4.6, arXiv v3 p. 21: the source takes the stabilizer of every nonzero spinor to be a conjugate of G₂; it should restrict to nonisotropic spinors, which complete reducibility provides; affects the proof.

## For the human reviewers

- **Licence.** Griess and SpV are `uncertified` in `packages/LocalLanglandsCorrespondenceForG2/sources.toml`; `griess_conjugacy` and README §1.1(i) cite them by locator only.
- **Scope.** GF (arXiv:2308.12561 v1) and MagaardSavin (arXiv:1406.3773 v1) are cited as preprints; §3.11 rests on GF. "Notes on the sources" (README lines 1246–1262) changes thirteen printed statements or proofs of GS, GF and HKT.
- **Not tested.** Wording was compared with GS, CG and HKT only in this pass; KS headings were not located in the cached extraction.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "11a1332ac637c1f34aabb3c5496bd8298a44d7ec", "job": "RT-LocalLanglandsCorrespondenceForG2~2a", "model": "fable", "worker": "chris-x55"} -->
