<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13172#issuecomment-6911017885 -->
Red team round 1 pass a (claude) of 3b3f4a7

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The local form of the unacceptability of Spin₇ is statable at the pins and is absent

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean:18–21`: "With its local form (README §0.8: two `Spin₇`-valued parameters of `W_F × SL₂(ℂ)`, of finite image on `W_F` …), which needs the `Spin₇`-valued parameters that the pins lack". README target: `packages/LocalLanglandsCorrespondenceForG2/README.md:256` ("Prove also the local form, for every F as in Conventions").

   **Claim.** The local form (CG, Proposition 8.3) cannot be stated at the pins.

   **Witness.** The pair of README §0.8 is trivial on SL₂(ℂ) and has finite image on W_F, so it is a pair of homomorphisms of W_F with open kernel and finite range. `TauCeti.ClassFieldTheory.WeilGroup K` with `instTopologicalSpaceWeilGroup` exists at the pin (`TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:181`, `…/WeilGroup/Topology.lean:78`).

   Why the encoding is faithful, on the README's own data: a homomorphism r : W_F → Spin₇(ℂ) with open kernel and finite range is continuous, has finite inertia image and a Frobenius image of finite order (hence semisimple), so (w, x) ↦ r(w) is a parameter in the sense of Conventions; elementwise conjugacy on W_F × SL₂(ℂ) of two parameters trivial on SL₂(ℂ) is elementwise conjugacy on W_F. Open kernel alone is not enough (an unramified character of infinite order has open kernel and infinite range), so finiteness of the range is carried. This is the form of the theorem that the docstring itself gives as the reason for weak classes, and it is the form §§0.4, 0.6, 0.7 and the Worked examples use.

   **Repair.** Add the import line `import TauCeti.NumberTheory.ClassFieldTheory.WeilGroup.Topology` after `import TauCeti.Algebra.Octonion.Basic`, and after `spin7_not_acceptable`:

   ```lean
   /-- **`Spin₇` is unacceptable on local Weil groups** (Chenevier–Gan, *Spin(7) is unacceptable*,
   Proposition 8.3). For every nonarchimedean local field `K` of characteristic zero there are a
   homomorphism `r : W_K → Spin₇(ℂ)` with open kernel and finite image and a character `η` of `W_K`
   with open kernel and values in the central elements of square one, such that `r w` and `η w * r w`
   are conjugate in `Spin₇(ℂ)` for every `w`, while no single element of `Spin₇(ℂ)` conjugates `r`
   to `η · r`. Extended trivially to `SL₂(ℂ)`, these are two `Spin₇`-valued parameters with one weak
   class and two conjugacy classes. -/
   theorem spin7_not_acceptable_weilGroup (K : Type) [Field K] [ValuativeRel K]
       [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K] :
       ∃ r η : TauCeti.ClassFieldTheory.WeilGroup K →* spinGroup sumSquaresSeven,
         IsOpen (r.ker : Set (TauCeti.ClassFieldTheory.WeilGroup K)) ∧ Finite r.range ∧
         IsOpen (η.ker : Set (TauCeti.ClassFieldTheory.WeilGroup K)) ∧
         (∀ w, η w ∈ Subgroup.center (spinGroup sumSquaresSeven) ∧ η w * η w = 1) ∧
         (∀ w, IsConj (r w) (η w * r w)) ∧
           ¬ ∃ g : spinGroup sumSquaresSeven, ∀ w, η w * r w = g * r w * g⁻¹ := by
     sorry
   ```

   In the module docstring replace the sentence quoted above by: "and its local form on the Weil group of every nonarchimedean local field of characteristic zero (README §0.8; Chenevier–Gan, Proposition 8.3), stated on `TauCeti.ClassFieldTheory.WeilGroup`: with it, this is the reason the PGSp₆ correspondence of Layer 10 takes values in weak parameter classes." In README §0.8, second paragraph, add after the locator: "On the pinned Weil group this is `spin7_not_acceptable_weilGroup`, whose homomorphisms have open kernel and finite range." Add `TauCeti.ClassFieldTheory.WeilGroup` (file `TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean`, topology in `…/WeilGroup/Topology.lean`) to "From Tau Ceti".

   Tested on the instances of the README: F = ℚ₅, r the pullback of the pair of CG Example 1 along W_ℚ₅ → ℚ₅× → μ₄ × μ₄ (surjective, ℚ₅×/ℚ₅×⁴ ≅ ℤ/4 × ℤ/4), η the pullback of b²: kernel open of index 16, range of order 16, η² = 1 central, conjugate elementwise on ker a² ∪ ker b² ∪ ker (ab)², not conjugate (surjectivity, then the polar-decomposition step of §0.8). F = ℚ₃: no such pullback (order 8 < 16), the pair is that of CG Proposition 8.3, of finite image by construction (characters of finite order). The statement was not elaborated in this pass (no Lean run is permitted here): the repair worker checks it with `#check @spin7_not_acceptable_weilGroup` and adjusts coercions if needed.

2. **F02** (P2) Two declared gaps are compound: each bundles statements with different hypotheses and different consumers

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:82` (gap:pgsp6-similitude-theta-tables: "the parameters of the theta lift of every irreducible representation induced from each proper Levi … the rule that a quadratic twist … the lift of each generic constituent … and the vanishing of the lift of the Steinberg representation") and `README.md:62` (gap:cubic-jordan-global-theta), with the same two entries of `design/plan.json`.

   **Claim.** Each is one supplier contract.

   **Witness.** gap:pgsp6-similitude-theta-tables has four parts with disjoint consumers: Levi tables (§§9.1–9.3, 10.7), twist rule (§§2.5, 10.3, 10.4), Siegel constituent (§5.5), Steinberg vanishing at PGO₆ (§§2.3, 8.1). gap:cubic-jordan-global-theta joins a construction for every D of degree three (§3.11(ii)(b)) to four theorems for division D with a period (§3.11 uniqueness).

   **Repair.** Keep the two slugs for the first part of each and add four slugs, in the README under the same supplier subsections and in the top-level `gaps` of `design/plan.json` (same supplier and section as the parent):

   - `What MetaplecticAutomorphicForms must provide (gap:pgsp6-similitude-theta-tables)`: for the similitude pairs PGSp₆ × PGSO₈, PGSp₆ × PGO₆ and PGSp₆ × PGO₅,₁ over F, the parameters of the theta lift of every irreducible representation induced from each proper Levi of PGSp₆, including the lower-tower Jacquet–Langlands identification with a duality orbit of PGL₄ or PGL₂(D); used in §§9.1–9.3 and 10.7.
   - `What MetaplecticAutomorphicForms must provide (gap:pgsp6-similitude-theta-quadratic-twist)`: for the same three pairs and a quadratic character χ of F×, the theta lift of σ ⊗ χ ∘ sim is the lift of σ twisted by χ ∘ sim; used in §§2.5, 10.3 and 10.4. (The pullback of χ ∘ sim along f₂ to the spinor-norm character is §2.1 of this roadmap and leaves the contract.)
   - `What MetaplecticAutomorphicForms must provide (gap:pgsp6-siegel-generic-theta)`: for τ a discrete series of PGL₃(F), the similitude theta lift to PGSO₈(F) of each generic constituent of the Siegel-induced representation I₃(τ) of PGSp₆(F), with its parameter; used in §5.5.
   - `What MetaplecticAutomorphicForms must provide (gap:pgsp6-steinberg-pgo6-vanishing)`: the similitude theta lift of the Steinberg representation of PGSp₆(F) to split PGO₆(F) is zero (GS, proof of Lemma 12.5, p. 37); used in §§2.3 and 8.1.
   - `What ExceptionalThetaCorrespondencesForG2 must provide (gap:cubic-jordan-global-theta)`: the present text up to "(§5.1 where D_v is a division algebra, §5.9 where it is split)"; used in §3.11(ii)(b).
   - `What ExceptionalThetaCorrespondencesForG2 must provide (gap:cubic-period-global-theta)`: the present text from "for D a division algebra and e ⊂ D a cubic subfield" to the end, with "the global lift of gap:cubic-jordan-global-theta" for "global lift"; used in the uniqueness part of §3.11.

   Replace each citation "pgsp6-similitude-theta-tables contract" by the slug of the part it uses (§2.3 and §8.1: pgsp6-steinberg-pgo6-vanishing; §§2.5, 10.3, 10.4: pgsp6-similitude-theta-quadratic-twist; §5.5: pgsp6-siegel-generic-theta; §§9.1–9.3, 10.7: pgsp6-similitude-theta-tables), and in §3.11 cite cubic-period-global-theta for the lift Π = Θ(Ξ). Tested on the instance: §8.1 then needs only the one-line vanishing statement, which σ = St, parameter Sym⁶ (not through Spin₆, Check of §8.1) instantiates.

3. **F03** (P3) The two SRU.5 targets are cited under the wrong number

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:17, 99, 477, 503, 1009, 1034`: "SRU.5, §5.3, … *unramified-principal-series-irreducibility* … and *spherical-generic-criterion*".

   **Claim.** Both targets are §5.3 of SmoothRepresentationsOfLocalGroupsPartII.

   **Witness.** At that roadmap's head §5.3 is *spherical-tempered-criterion*; the two targets are "**5.4 Irreducibility of unramified principal series (*unramified-principal-series-irreducibility*)**" and "**5.5 Generic spherical representations (*spherical-generic-criterion*)**" (its README lines 1126 and 1139).

   **Repair.** In the six places write "SRU.5.4 (*unramified-principal-series-irreducibility*) and SRU.5.5 (*spherical-generic-criterion*)" for "SRU.5, §5.3" / "SRU.5 (§5.3)"; in the Dependencies lines "SRU.5 (5.4, 5.5)". The hypotheses quoted (split, adjoint, quasi-simple, hyperspecial K) agree with the supplier's and stay.

4. **F04** (P3) §3.14 carries three hypotheses that its own route does not use

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:681`: "Prove that a map Irr(G₂(F)) → Φ(G₂) satisfying §§3.5–3.7 and the two diagrams of §3.2 equals L".

   **Claim.** The characterization needs §§3.5–3.7.

   **Witness.** With the diagrams of §3.2 on all of Irr♠ and Irr♥ = Irr(G₂): on Irr♠ the value is j ∘ L_PD×(θ_D(π)); on Irr♥ its v-image is prescribed and §0.4 is injective. The Route uses nothing else; GS Main Theorem (v), GS line 147, lists (i)–(iv).

   **Repair.** Replace the first sentence of §3.14 by: "Prove that a map Irr(G₂(F)) → Φ(G₂) satisfying the two diagrams of §3.2 equals L; in particular so does one that also satisfies §§3.5–3.7, the form of GS, Main Theorem (v), p. 4 (see also §3.4, p. 12)." Add the Check: "The spectral properties §§3.5–3.7 are not needed: the map π ↦ L(π) is recovered from the diagrams alone, since Irr♠ ⊔ Irr♥ is all of Irr(G₂)." Tested on π = St_G₂ ∈ Irr♥: v-image Sym⁶ forces the principal parameter with no use of §3.7.

Four findings: two P2 (R01, R02), two P3 (R03, R04). No P1. No finding re-raises a settled one (no earlier repair report marks anything `not actionable in this package`).

Dependency check (`gate --depcheck … --name LocalLanglandsCorrespondenceForG2 --movable --pr 13172`), full output:

    depcheck: 254 roadmaps, 2413 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. In `merge-order/ORDER.txt` the roadmap is at line 316, after ExceptionalThetaCorrespondencesForG2 (line 299).

## Declarations of Suggested.lean (5)

| Declaration | Context | Lean side | README side | Result |
|---|---|---|---|---|
| `octonionAut` (def, l. 84) | no variables; `TauCeti.Octonion ℂ` has `NonAssocRing`, `Module ℂ` at the pin | subgroup of `≃ₗ[ℂ]` with g(xy) = g(x)g(y); id ∈; 2·id ∉ (2 against 4); conj ∉ (uu′ = ⟨0,0,0,e₃⟩, conj gives −e₃ against +e₃, computed on the pinned Zorn product) | §0.0, same predicate; g(1) = 1 implied by surjectivity | agree |
| `octonionRep` (def, l. 101) | `{Γ} [Group Γ]` explicit | γ ↦ linear map of ρ γ | §0.0; at t = diag(ζ, ζ, ζ³): eigenvalues 1, 1, ζ, ζ, ζ³, ζ⁴, ζ⁴, ζ² | agree |
| `griess_conjugacy` (theorem, l. 118) | `{Γ : Type*} [Group Γ]`, no lost binder (signatures.md) | semisimple `octonionRep ρ`, `octonionRep ρ′`, intertwining `≃ₗ` ⇒ ∃ g, ρ′ = gρg⁻¹ | §0.0; ρ = ρ′: g = 1; ρ(1) = t, ρ′(1) = t² on ℤ/5: multiplicity of ζ is 2 against 1, hypothesis fails, t ≁ t²; non-semisimple ρ excluded by hρ | agree; true (see Not verifiable for the source) |
| `sumSquaresSeven` (abbrev, l. 128) | none | `weightedSumSquares ℂ 1` on `Fin 7 → ℂ` | §0.8 | agree; needed by the next |
| `spin7_not_acceptable` (theorem, l. 137) | none; `Γ : Type` | ∃ finite Γ, r, r′, `IsConj` pointwise, not conjugate | §0.8; weights (1,0),(1,2),(0,1),(2,1), sum (4,4); η⊗V = (1,2),(1,0),(0,3),(2,3) ≠ V, ≠ V∨ = (3,0),(3,2),(0,3),(2,3) | agree |

Padding probe: the two theorems are a cited deep theorem and an existence theorem of CG; no one-tactic consequence, no Check mirrored, no `example`. The three definitions are used by the two theorems. Imports: `Mathlib` and one existing Tau Ceti module. No `set_option`, `lemma`, `#eval`, `#check`. I did not run `#check @name` (no Lean command is permitted in this pass); the elaborated types are those of the worker's `signatures.md`, compared one by one with the README.

Headline theorems (README): Griess (§0.0, stated), unacceptability (§0.8: finite-group form stated; local form R01), the G₂ correspondence (§7.1), generic supercuspidal correspondence (§7.2), gamma-factor characterization (§§3.11–3.13), global–local compatibility (§3.15), spin identity (§5.6), diamond fibres (§6.6), partial PGSp₆ correspondence (§7.3), weak correspondence and fibres (§§10.1, 10.9), spin transfer (§§2.2–2.5), globalizations (§§1.4–1.7), Chenevier's theorems (§§0.9–0.10). All but the first two need smooth representations of p-adic groups, parameters valued in G₂(ℂ) with algebraicity on SL₂(ℂ), or automorphic representations; the docstring names each with its missing carrier, and I found none of these carriers at the pins.

## Adversarial pass on the README targets

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.0 Griess, four forms | Γ = 1; Γ = ℤ/5 with t, t²; Γ = ℤ; arbitrary Γ | t² has v-eigenvalues 1, ζ², ζ², ζ, ζ³, ζ³, ζ⁴; character of v determines the semisimple class (χ₁₄ = Λ²χ₇ − χ₇); arbitrary Γ reduces to a maximal compact subgroup of the reductive Zariski closure of (ρ, ρ′) | holds | none |
| §0.0 SL₃ Check | t ∈ SL₃ on the pinned product | tv·t^(−T)w′ = v·w′; t^(−T)w × t^(−T)w′ = t(w × w′); tv × tv′ = t^(−T)(v × v′) | holds | none |
| §0.1 branchings | a = b = 1; a = −1, b = 1; a = 2, b = 3; centre | (X−1)⁷; three 1 and four −1; {1,2,3,1/6,1/2,1/3,6}; traces 8, −8 and 7, 7; diag(−1,1,−1): spin trace 0, vector trace −1 | holds | none |
| §0.2 A₂ detection | Sym²; χ ⊗ Sym², χ cubic; 1⊕1⊕1; irreducible subgroup H ⊂ SO₃ | det χ³ = 1; dual χ⁻¹ ⊗ Sym²; pole order 7; Z_G₂(H) = G₂ ∩ Z_GL₇(H) = Z_G₂(SO₃) = S₃ | holds | none |
| §0.3 spin detection | principal; subregular | one invariant line; 1⊕1⊕Sym²⊕Sym², pole order 2, q-image 1 ⊕ 2·Sym² not discrete; raw centralizer μ₂ against S_φ = 1 | holds | none |
| §0.4, §0.5 | ρ = 1, χ ≠ 1; ρ in j(SL₃) ⋊ ⟨duality⟩ | χ^⊕7 has no invariant; invariant line gives conjugacy, not χ = 1; isotropic spinors excluded by nondegeneracy of the invariant subspace | holds | none |
| §0.6, §0.7 weak classes | trivial against unramified central; φ̃ with Frobenius i(j(diag(−1,1,−1))) | spin eigenvalues all 1 against all −1; tr s(g) = ∏(t_i^(1/2) + t_i^(−1/2)) = 0 iff some t_i = −1, and then the reflection in e_i conjugates g to −g | holds | none |
| §0.8 both forms | (ℤ/4)²; ℚ₅; ℚ₃; polar step | union of three kernels; ℚ₅×/⁴ ≅ ℤ/4 × ℤ/4; ℚ₃×/⁴ of order 8; r·(r⁻¹pr) = u·p gives u = r | holds | R01 (Lean) |
| §0.9, §0.10 | Sym⁶ of a newform; reducible 1 ⊕ ρ ⊕ ρ∨ | C Theorem E, Theorem 6.4, Corollary 6.5, Corollary 6.8 read: totally real, algebraic regular at real places, semisimple as the README says | holds | none |
| §1.1 (i)–(iii) | a = 0 and a ≠ 0 isotropic vectors; ℚ at 2; ℚ(√2), c = −(1+√2); S = {p}, {p, p′}, {2} split | n₀ represents −1 in both cases; 7·1 + (√−7)² = 0; −c = 2.414 and −0.414; parities 2, 3 → 4; (−1,−3) has symbols −1, −1, +1 at ∞, 3, 2 | holds | none |
| §1.1–1.2 selected spectra | multiplicity two | zero-period copy antidiagonal, selected copy diagonal | holds | none |
| §1.3 (a)–(c) | S = ∅; ℝ in L²(ℝ); H(k) for division D | D ≇ D^op in degree three, so H(k) = PD×(k); ramification set finite, nonempty, no real place | holds (contract) | none |
| §1.4, §1.6 | S = ∅; ℚ with S = {p, ∞} and {p, p′}; product isolation | relative isolation in ∏R_v with the product topology; SL₂(ℝ): D₂^± limits of complementary series, D_k^±, k ≥ 3 isolated | holds | none |
| §1.5 | δ = St; π_gen[1] | rank two ≥ 2; θ(π_gen[1]) not discrete, excluded | holds | none |
| §1.7 | t = 0, 1 | h = (11,6,3): spin weights ±10, ±7, ±4, ±1; t = 0: 0 twice; 14t even; h₁ − h₂ − h₃ = 2t | holds | none |
| §2.1 | f₁ against f₂ | sim ∘ f₁ trivial modulo squares; three central kernels in μ₂ × μ₂ | holds | none |
| §2.2–2.3 | trivial parameter; Σ lifted from PGO₆ | eigenvalues 1⁸ and (−1)⁸; ζ^S pole at 1 from 1 ⊕ Λ²φ_τ | holds | none |
| §2.4 | ℚ₅, s = 2; ψ(5x); #T = 1, 2 | Tate factor (24/25)/(−4) = −6/25; 5⁻¹²(6/25)⁸; R_σ = 1 from the quotient; (6,4,2) on spin weights: 6,4,2,0,0,−2,−4,−6 | holds | none |
| §2.5 | χ unramified, σ = St | traces 8 and −8 | holds | none |
| §3.1–3.4 | St_G₂; trivial representation; St_PGL₃^± | real weights x, x+y, 2x+y distinct, so the GL₇ transfer is regular; q^(−3..3), N = 0 against N ≠ 0 | holds | none |
| §3.5–3.8 | nontempered φ; torus 2-torsion | Z_(M∨)(φ) connected; centralizer of T[2] is T ⋊ ⟨−1⟩, so R = ℤ/2 at most | holds | none |
| §3.9–3.10 | ψ_a | det((v∘L)⊗φ_τ) = det(φ_τ)⁷, dimension 7r | holds | none |
| §3.11 | P- and Q-Levi; λ = 0 compact; Irr♥ and Irr♠ uniqueness | 2+2+1+1+1 (long root of the dual), 2+2+3 (short root); coroots b∨, a∨+b∨, a∨+2b∨ give 1, 2, 3 and a∨, a∨+3b∨, 2a∨+3b∨ give 1, 4, 5; det = sgn³·sgn = 1; every place other than v₀ is non-supercuspidal or in Irr♥ | holds | none |
| §3.12–3.14 | π = St; Irr♠ | 7r; diagrams alone determine L | holds | R04 |
| §3.15 | Steinberg place | Sym⁶ irreducible, one summand | holds | none |
| §4.1–4.5 | p = 3; std₂ on μ₃ | self-dual discrete φ_τ: χ ⊗ Sym² with χ² = χ³ = 1, or Ad of a primitive two-dimensional representation (p = 2 only); trace −1 | holds | none |
| §5.1–5.6 | St; π_gen[1] | KS(St) principal; I₃(St)_gen, Sym²⊕Sym²⊕1⊕1 | holds | none |
| §6.1–6.7 | φ principal; two-place substitution | sign characters squared = 1; pole from ζ^S | holds | none |
| §7.1–7.4 | principal, subregular, trivial | fibres 1, 3, 1; |Irr(S₃)| = 3 | holds | none |
| §8.1–8.2 | trivial representation; unitary Π | (q³, q², q): coroot value q, reducible; bound gives root values in (q⁻¹, q) | holds | none |
| §9.1–9.4 | τ = St_PGL₄ | Λ²Sym³ = Sym⁴ ⊕ 1; 4 + 4 = 8; 2³ − 1 = 7 Levis | holds | none |
| §10.1–10.9 | χ twist; dihedral σ of PGL₂; discreteness on a weak class | Λ²(φ ⊗ χ) = Λ²φ; restriction of length two; Z_Spin₇(φ) → Z_SO₇(q∘φ) has finite kernel and image of finite index | holds | none |

## Verified sound

- Declarations read: 5 of 5; README lines read: 1245 of 1245; targets and definitions read: all of §§0.0–10.9 (75 by the earlier review's count).
- Pinned declarations opened (all exist, statements as the README describes): `TauCeti.Octonion` with its product (`Algebra/Octonion/Basic.lean:279`), `conj_mul`, `norm_mul`, `normQuadraticForm`, `imaginary` (l. 831), `finrank_imaginary` (l. 861); `TauCeti.CayleyDickson` product (`Basic.lean:203`, the README's formula), `normSq`, `normSq_def` (`Quaternion.lean:116, 124`), `DivisionOctonionReal` (l. 312); `QuadraticForm.not_anisotropic_atFinitePlace_of_five_le_finrank`; `QuadraticMap.IsometryEquiv.exists_extension`; `TauCeti.BrauerGroup.natCard_twoTorsion`; `TauCeti.D4Tripled.trialityAutomorphism`, `trialityAutomorphism_pow_three`; `TauCeti.ClassFieldTheory.WeilGroup`, `weilDegree`; Mathlib `spinGroup` (`SpinGroup.lean:293`, `Group` instance l. 385), `Representation.IsSemisimpleRepresentation` (complemented lattice of subrepresentations; no finite-dimensionality in the definition), `Matrix.charpoly_diagonal`, `det_diagonal`, `charpoly_monic`, `charpoly_natDegree_eq_dim`. 19 declarations.
- Sibling citations checked at the heads (`roadmaps show`) or on main, 105 ids (existence of the id and its heading for all; content read for those singled out below): ExceptionalThetaCorrespondencesForG2 §§0.1, 0.6–0.9, 1.8, 5.1–5.4, 5.7–5.9, 6.7, 8.1–8.4, 8.8–8.10, 9.1, 9.3–9.6, 10.3–10.7 (every italic heading the README quotes exists with that title; §5.1 gives Θ_D(1) = π_deg[1] and the PE×-fixed-vector criterion; §§10.4–10.5 are for totally definite O, §10.6 for split G₂, as the README says); ModularityAndLanglandsExtensions §§2.43, 3.5, 3.8, 3.15, 3.17, 3.19, 3.25, 3.27, 5.1; EndoscopicTransferAndUnitaryTraceComparison §§1.13, 4.7a, 4.8, 10.1 (ω(w) = q^(deg w), geometric Φ of degree −1: the Conventions' ω = |·|⁻¹ is right), 10.26, 10.29–10.31; MetaplecticAutomorphicForms §§3.10, 3.17, 3.34, 3.41, 3.42, 6.13, 6.14; AutomorphicLFunctionsAndLocalFactors AL.1.4, AL.R.2, AL.3.3.8, AL.3.6.2, AL.4; PartII Layer 6, §10.0; SmoothRepresentationsOfLocalGroups SR.2.1, SR.2.3, SR.3.1, SR.3.3, SR.5.2 (*classical-llc-normalization*, inversion transport); PartII SRU.1.1, 1.7–1.10 (the product statement of 1.10 rests on that roadmap's finite-product Fell-dual contract, which covers the real factors of §1.6), 3.8, 3.10, 4.7, 4.8, 5.4, 5.5; AutomorphicFormsOnReductiveGroups §§2.4, 2.5, 4.2, 4.3 (the Whittaker coefficient of §4.3 is for a general maximal unipotent quotient); AutomorphicSpectralTheory §§6.16, 6.18, 6.19; AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5, AG2.6; GL2AutomorphicRepresentationsAndTransfer R17.1.5 (ramification realization, with the parity condition quoted); BorelRegulators §3.1; on main GlobalQuadraticForms §6.3, ClassicalGroups §§6.2, 6.7, SpinRepresentations Layers 2 (*SpinComplexPolarTopology*), 4, 5, 6, 8, ClassFieldTheory Layers 5, 9, 10, ReductiveGroups Layer 9, Chebotarev Layer 10, OrthogonalSpinGroups Layers 1–2. One wrong number: R03.
- Declared gaps: 19 slugs in the README, the same 19 in `design/plan.json`, each with a named supplier earlier in the merge order. I searched the supplier heads for eight of them (regular-real-unitarity, regular-real-isolation, poincare-weak-containment, relative-generic-isolation, kret-shin-gspin-galois, automorphic-plancherel-density, gln-generic-local-converse, so8-spinor-norm-twist): none is already provided there. Two compound: R02.
- Locators verified against the cached texts, 59: GS (Main Theorem (i)–(x), Lemma 2.4, §§3.1–3.5, Propositions 3.1, 3.2, 4.1, 5.1, 5.2, 6.1, 8.1, 8.2, Corollary 5.3, Lemma 8.3, Theorem 9.1, §§10.2–10.3, Propositions 10.5, 10.7, 11.6, Lemmas 10.1, 10.8, Definition 12.1, Lemmas 12.2, 12.4, 12.5, Theorems 12.3, 12.6, 12.7: page numbers and, for Lemma 2.4, Definition 12.1, Lemma 12.2 and the Main Theorem, content); C (Theorem E p. 100, Theorem 6.4 p. 148 with the Griess step on p. 149, Corollary 6.5, Corollary 6.8 pp. 150–151); CG (Lemma 3.10, Proposition 3.12, Corollary 4.6, Example 1, Corollary 4.8, Lemma 5.9, Proposition 5.10, formula (16), Lemma 8.2, Propositions 8.3, 8.4); HKT (Theorem 3.3, Proposition 4.3, Lemma 4.4, Proposition 4.5, Lemma 4.6 with its proof ending on p. 22); GF (§§2.4–2.8, Proposition 2.3, Theorem 2.4, Lemma 2.5).
- Checks tested by computation: 48 (those whose values are in the table above); the other Checks were read against the theorems of their sections. None found false or vacuous; every definition has at least three.
- Policy: `git diff --stat origin/main...HEAD` changes only the package folder (12 files); no pull-request number, process word or machine path in the README or the Lean file; every target has a locator; no algorithm.
- Ownership: `roadmaps grep` for the five Lean names and for the octonion-automorphism predicate finds no other declaration; ExceptionalThetaCorrespondencesForG2's `Suggested.lean` declares no definition, and its §0.1 is cited as owner of the octonion model. `overlaps.md` lists no other pull request changing this roadmap, no dropped id and no second copy. Ownership was checked against the open heads through the `roadmaps` tools; the listed sibling checkouts (104) do not contain this roadmap's suppliers.

## Not verifiable

- Griess, Theorem 1 (uncertified, not read): whether it is stated for finite groups or in the generality of §0.0. C (line 2239) and HKT (lines 912–913) apply it to arbitrary groups with completely reducible image, as the README does; the general case follows from the compact case (table, first row), so the Lean statement is true either way.
- SpV, Theorems 1.7.1, 1.8.1 and §1.5 (uncertified, not read); the Route of §1.1(i) is self-contained and I checked it.
- Locators into HD, GS20, KS, Shin, SV, ILM and MagaardSavin: the texts are in the cache but I did not open them in this pass.
- The repair text of R01 is not elaborated (no Lean run permitted).
- The statements imported through the 19 gaps: contracts, not checked beyond their wording.

Source independence: 9 passages compared with 5 sources (GS Lemma 2.4, Definition 12.1 with Lemma 12.2 and the Main Theorem; C Theorems E and 6.4; CG Example 1; HKT Lemma 4.6; GF Theorem 2.4; the two theorem docstrings of `Suggested.lean`), none shared beyond formulas and hypothesis lists that the mathematics forces; largest share GS, 99 of 167 locators; contents compared with GS: independent (Layer 0 ↔ §2.2 with C and CG, Layer 1 ↔ §10, Layer 2 ↔ §4, Layer 3 ↔ §§3.1–3.4 with GF, Layer 4 ↔ §3.5, Layer 5 ↔ §5, Layer 6 ↔ §§6, 8, Layer 7 ↔ §§1.1, 9, Layers 8–10 ↔ §12: the source order 2, 10, 4, 3, 3.5, 5, 6–8, 9, 12 is not the roadmap's, and the run Layers 5–7 is forced by the Needs lines §5.3 → §6.2 → §6.6 → §7.1). No table, figure or data is taken over. HD, GS20, KS, Shin, SV, ILM and MagaardSavin were not compared.

## Source issues

- **Misprint** in GS at Main Theorem (ix), p. 4: the source closes the parenthesis of the gamma factor before the tensor product with the parameter of τ; it should be the gamma factor of the tensor product (std ∘ L(π)) ⊗ φ_τ; affects nothing.
- **Gap** in HKT at Lemma 4.6, proof, p. 21: the source takes the stabilizer of every nonzero spinor to be a conjugate of G₂; it should restrict to nonisotropic spinors, available by complete reducibility; affects the proof.
- **Gap** in GS at Main Theorem (v), p. 4: the source characterizes the map by (i)–(iv); it should say that the two diagrams of (iv), with the dichotomy, already determine it; affects nothing.

## For the human reviewers

- **Licence.** Griess and SpV are recorded `uncertified` (`sources.toml`, licence class `none`); §0.0 and §1.1(i) cite them by locator only, and `griess_conjugacy` is stated from the use made of Griess's theorem in C and HKT.
- **Scope.** CG is cited from arXiv v1 (2303.15897) with a journal reference (Peking Math. J. 8, 2025) whose numbering I did not compare; GF is an arXiv preprint (2308.12561 v1) with no journal reference in the README.
- **Not tested.** Wording and locators against HD, GS20, KS, Shin, SV, ILM and MagaardSavin were not compared in this pass (GS, the source with the largest share, was).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3b3f4a7812964d134e8cf61a7fd35996a4f846ac", "job": "RT-LocalLanglandsCorrespondenceForG2~1a", "model": "fable", "worker": "chris-x80"} -->
