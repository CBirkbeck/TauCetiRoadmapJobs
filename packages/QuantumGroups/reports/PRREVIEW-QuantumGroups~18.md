# Review of QuantumGroups (pull request #1649 at 79e1cb6)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/QuantumGroups/` at `79e1cb6`, the same head the previous review read; nothing in the folder changed since then. It covers every passage, the seeded source sample, the gate, the dependency check, elaboration with `#check` of every declaration, and a one-tactic padding probe. It finds one new P2: two Layer 3 headlines are statable but absent, and the module docstring calls them not statable. There is one new P3 (a false justification in §0.2) and one carried P3 (#1705 order and a stale description).

## Previous findings

- R01 (P3, two open revisions with no stated order; stale description) — **not repaired.** #1705 is still open (now at `4a56324`) and still conflicts with this head in `README.md` and `Suggested.lean`. This pull request's description still opens with "Current head `d7a6c540…`" and still says "No Lean elaboration was repeated because no Lean files change". Carried as R03.

## R01 (P2) — The modular automorphism and the Kac equivalence are statable but absent, and the docstring says they are not statable

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:26`–`:28`: "Layer 3: the dense Hopf core, Plancherel completion, modular/Kac comparison and unitary pivotal comparison need that analytic CQG, its Haar GNS completion, the full left Hilbert algebra and unitary tensor-category carriers." The targets are `README.md:631` (§3.2, `h(ab)=h(bθ(a))` with θ multiplicative) and `README.md:691`–`:693` (§3.3, "Kac equivalences: Haar traciality, S²=id on Pol(G)").

**Claim:** Both statements are algebraic statements about the Hopf *-core and its Haar functional. They are statable on the same native carriers the file already uses for `schur_orthogonality` (also a statement about Pol(G) in §3.1): `AlgebraicHaar` on a Hopf algebra with `TauCeti.StarCoalgebra`. The docstring names the "modular/Kac comparison" as a Layer 3 headline, so they are headlines by the file's own account. Its reason for not stating them (an analytic CQG, GNS completion and left Hilbert algebra) does not apply to them. A statable headline that is absent is P2.

**Witness:** A scratch copy of this head's file with the two theorems below elaborates with `lake env lean`: exit 0, four `sorry` warnings. Neshveyev–Tuset prove both on C[G]: Theorem 1.7.3 (`nt` line 977, p.22) and Proposition 1.7.7 (`nt` line 1036, p.23).

**Repair:** Add to `Suggested.lean`, under `/-! ## Layer 3 … -/`, after `schur_orthogonality`. This is the form I elaborated at the pins; it uses only the file's existing imports and carriers.

```lean
/-- The modular automorphism of the Haar functional: there is exactly one algebra automorphism
`θ` with `h(ab) = h(b θ(a))`; on a unitary coefficient matrix `θ(u) = F u F`
(Neshveyev–Tuset, Theorem 1.7.3, p. 22). -/
theorem haar_modular_automorphism {A : Type u} [Ring A] [HopfAlgebra ℂ A] [StarRing A]
    [StarModule ℂ A] [TauCeti.StarCoalgebra ℂ A] (h : AlgebraicHaar (A := A)) :
    ∃! θ : A ≃ₐ[ℂ] A, ∀ a b : A, h.functional (a * b) = h.functional (b * θ a) := by
  sorry

/-- The Kac equivalence: the Haar functional is a trace exactly when the antipode is involutive
(Neshveyev–Tuset, Proposition 1.7.7, p. 23). -/
theorem haar_trace_iff_antipode_involutive {A : Type u} [Ring A] [HopfAlgebra ℂ A] [StarRing A]
    [StarModule ℂ A] [TauCeti.StarCoalgebra ℂ A] (h : AlgebraicHaar (A := A)) :
    (∀ a b : A, h.functional (a * b) = h.functional (b * a)) ↔
      ∀ a : A, HopfAlgebra.antipode ℂ (HopfAlgebra.antipode ℂ a) = a := by
  sorry
```

In the README, name them where they are proved, so the README and Lean names agree:
- §3.2, after `README.md:636`: "The headline `haar_modular_automorphism` states that θ is the unique algebra automorphism with this property; uniqueness is faithfulness of h."
- §3.3, after the sentence ending "all these F matrices equal to one" (`README.md:693`): "The headline `haar_trace_iff_antipode_involutive` states the equivalence of the first two conditions."

Add Neshveyev–Tuset Theorem 1.7.3 and Proposition 1.7.7 to those *Needs:* lines; `nt` is already in the manifest.

In the docstring, move "modular/Kac comparison" out of the Layer 3 not-statable bullet and into the opening "It states …" sentence. Keep the Plancherel completion, the Tomita comparison and the unitary pivotal comparison in the bullet.

Tested on the refuting instances, at q=1/2:
- SU_q(2): `θ(a)=4a` gives `h(a*θ(a))=4·(1/5)=4/5=h(aa*)`.
- SU_q(2) Kac equivalence: traciality fails (`h(a*a)=1/5≠4/5=h(aa*)`) and `S²(c)=c/4≠c`, so both sides are false.
- ℂ[S₃]: h is a trace and `S(g)=g⁻¹`, so both sides are true and `θ=id`.
- Neither theorem closes with `rfl`, `simp`, `exact trivial` or `aesop`, so neither is padding.

#1705 at `4a56324` states the same two theorems, with an explicit `hΔ` in place of `TauCeti.StarCoalgebra` (R03).

## R02 (P3) — §0.2 gives a false reason why the sign map respects the Temperley–Lieb relations

**Location:** `README.md:254`–`:257`: "It respects the three defining relations, because e_i²=δe_i changes sign on both sides and the other two relations are homogeneous of even degree, so it is an algebra isomorphism commuting with the adjoint".

**Claim:** The conclusion is true, but both stated reasons are false:
- `e_i e_(i±1) e_i = e_i` has sides of degree 3 and 1, so it is not homogeneous, and its parity is odd.
- Under `s`, `(−e_i)² = e_i²`, so the left side of `e_i²=δe_i` does not change sign.

**Witness:** In TL₃, `s(e₁e₂e₁) = (−e₁)(−e₂)(−e₁) = −e₁e₂e₁ = −e₁ = s(e₁)`: the relation survives because both sides have odd degree. Also `s(e₁)² = e₁² = d·e₁ = (−d)(−e₁) = s((−d)·e₁)`.

**Repair:** Replace the clause with: "It respects the three defining relations: s(e_i)² = e_i² = d·e_i = s(−d·e_i), and in e_ie_j = e_je_i (|i−j| ≥ 2) and e_ie_(i±1)e_i = e_i both sides have the same degree parity (2 and 2; 3 and 1), so s multiplies both sides by the same sign. Hence s is an algebra isomorphism commuting with the adjoint". I tested this on the TL₃ instance above and on TL₄'s `e₁e₃ = e₃e₁` (degree 2, sign +1 on both sides). TemperleyLiebOperatorAlgebras 2.1 at `ba43cc7` (`README.md:1155`–`:1156` there) makes the same check in this form.

## R03 (P3) — Two open revisions of this folder conflict with no stated order, and the description describes an earlier head

Re-raised: H01. The reply to the previous review answered H01 as "correct in substance", with the repair belonging to the pull-request description, "which the worker rewrites". That names the right owner, but it is not a reason to drop the finding. The description is unchanged at this head, so the defect stands, and an accepted verdict would send a false description to the human approver.

**Location:** the pull-request description (`scratch/pull-request.md`, data) and the folder as a whole.

**Claim:** When two open pull requests change one roadmap and their heads conflict, one is rebased on the other before either merges, and the description says which. The description must also describe the head under review.

**Witness:** `roadmaps list` shows `#1705 QuantumGroups @kim-em 4a56324` beside `#1649 … 79e1cb6`; `roadmaps overlaps` says they "conflict in README.md, Suggested.lean". This description opens "Current head `d7a6c540…`". #1705's description names only #1125 and #1124.

**Repair (for the worker):**
- Rewrite this description to describe `79e1cb6`: §1.1 ClassicalMultipliers, Layer 0 moved down with CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras named as later owners, Layer 8 on native `TauCeti.UqSl2`, and a four-declaration `Suggested.lean` built with only `sorry` warnings.
- State which of #1649 and #1705 is rebased on the other.
- Content to reconcile: #1705 at `4a56324` already carries R01's two theorems. It lacks this head's supplier-row sentence "Tau Ceti implements them as …" and the §8.5 trace identification "`TauCeti.rightTrace` sends f to tr_V(gf)" (neither string occurs in its README).

## Verified sound

**Gate.** I ran the gate on this head: `gate QuantumGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. This agrees with the worker's gate, which also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.

**Dependency check** (output of the required command, unmodified):

```text
depcheck: 235 roadmaps, 2258 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. Every supplier named in the table and in the *Needs:* lines is on main: CStarAlgebras, VonNeumannAlgebras, HilbertModules, TemperleyLieb, Subfactors, OperatorTheory/SelfAdjointSpectralTheory, RepresentationTheory/CompactGroups and LieHighestWeight, OperatorAlgebraDynamics, FreeProbability, AmenableGroups and PivotalSpherical.

**Elaboration and signatures.** `lake env lean` on a copy of `Suggested.lean` with `#check @name` for all 4 declarations (plus `AlgebraicHaar.mk`) exits 0 with exactly two `declaration uses sorry` warnings (`:79`, `:107`). The elaborated types equal `scratch/signatures.md`.
- `AlgebraicHaar` drops `[StarModule ℂ A]`. No field uses it, and both theorems carry it explicitly.
- `schur_orthogonality` keeps `[TauCeti.StarCoalgebra ℂ A]` and `[IsSimpleOrder (TauCeti.Subcomodule ℂ A H)]` in its own signature.
- `compactType_iff` has `[Nontrivial A]`.
- README generality equals Lean generality for both headlines: the algebraic Hopf *-core with a positive normalized two-sided integral.

**Padding probe.** `rfl`, `simp`, `infer_instance`, `exact trivial`, `constructor` and `aesop` each fail on both `schur_orthogonality` (`:92`) and `compactType_iff` (`:111`), with "rfl failed", "simp made no progress", "type class instance expected", "Type mismatch" or "unsolved goals". Nothing in the file is padding.

**Headline theorems** (from the Summary, Scope and layers), against `Suggested.lean`:
- Stated: weighted Schur orthogonality (§3.1) and the algebraic compact-type equivalence (§4.1).
- Statable but absent (R01): the modular automorphism (§3.2) and the Kac equivalence (§3.3).
- Named in the docstring as not statable, and confirmed absent at the pins: Haar existence and uniqueness on a C*-bialgebra (no minimal C*-tensor product in Mathlib or Tau Ceti); complete reducibility and analytic Peter–Weyl (no free Hilbert module `H⊗A`); the Tomita comparison; the universal and reduced completions and coamenability; SUq(2) and A_o(F) as universal C*-algebras; Banica's fusion theorem; Tannaka–Krein and commutative reconstruction; §0.1–§0.2; the §8.5 pentagon (`clebschGordanRecouplingEquiv` is triple-only, `ClebschGordan/Recoupling.lean:135`); and §8.6.
- Proved natively and named in the docstring: Layer 8.

**Seeded sample** (statement, hypotheses and page checked against the text):

| Target | Locator | Result |
| --- | --- | --- |
| 1.2 | Timmermann Thm 5.1.6 | not verifiable (uncertified); statement standard, Checks computed below |
| 2.1 | Timmermann Defs 5.1.4, §5.3 | not verifiable (uncertified) |
| 2.3 | Timmermann Props 5.3.7–5.3.8 | not verifiable (uncertified) |
| 3.1 | Timmermann Props 3.2.9, 3.2.17, Thm 5.4.1 | not verifiable (uncertified); both Schur forms recomputed on SU_(1/2)(2) |
| 3.2 | Timmermann Thms 3.2.19, 5.4.3, 5.4.5 | not verifiable (uncertified); the modular identity agrees with `nt` Thm 1.7.3, line 977, p.22 |
| 3.4 | Timmermann Thms 3.2.19, 5.4.5 | not verifiable (uncertified); the `σ_z=f_(iz)*·*f_(iz)` convention agrees with `nt` line 968 and Thm 1.7.3, and `S²=τ_(−i)` with `nt` line 1034 |
| 4.3 | BMT Thms 2.2, 2.8, Cor 2.9, Thm 3.6, pp.6, 10–11, 18–19 | verified: `bmt` line 257 (p.6: coamenable ⟺ faithful Haar and bounded counit), line 461 (p.10: faithful Haar ⇒ bounded counit ⟺ nonzero character), line 478 (p.11), lines 858–865 (pp.18–19: A_u→A_r iso ⟺ faithful h_u); coamenability defined at line 232 |
| 5.1 | BMT §2 pp.12–14; Timmermann Ch.6 §2 | BMT verified: fundamental matrix `[[α,−qγ*],[γ,α*]]` lines 600–604, monomial basis lines 594–597, Thm 2.12 (0<\|q\|<1) line 614, p.13; Timmermann uncertified |
| 5.2 | Banica Prop 1, Lemma 1; Malacarne §2, Lemma 2.1 | verified: `banica` lines 54–57 (cup `1→ΣF_ji e_i⊗e_j`, p.2), line 65 (`(E*⊗1)(1⊗E)=c`); `malacarne` lines 171–183 (R=(ι⊗F)r, `FF̄=±1`, `U*=FᵗUᵗ(F⁻¹)ᵗ`, equivalent to `U=FŪF⁻¹`, p.3) |
| 6.2 | Malacarne Lemmas 1.2, 2.1, 3.1, proof of Thm 4.1, pp.2–6 | verified: Thm 1.1 line 52, A, A_n, B_n, I_n lines 63–126, Lemma 1.2 line 127, Lemma 2.1 line 183, Lemma 3.1 line 235, Thm 4.1 and the filtered union lines 285–312 |
| 7.2 | Banica Thm 1, Prop 2, pp.1–4 | verified: lines 42–46, 68–75 (`β=c⁻²‖E(1)‖⁴`); Thm 1's "n ∈ ℕ" is a source issue below, and the README restricts to n≥2 |
| 8.2 | Virelizier Ex 3.3, Prop 3.7, Cor 3.8, pp.11–12 | verified: `virelizier` lines 552–555, 585, 594 |
| 8.3 | Virelizier Thm 3.13, Cor 3.14, p.13 | verified: lines 625, 635 |
| 8.6 | Virelizier §2.3; Timmermann Ch.6 §2 | Virelizier verified: lines 348–359, p.8 (relations, ΔK, ΔE, ΔF, S, `S²=Ad(K⁻¹)`); Timmermann uncertified |
| 8.7 | Virelizier Ex 3.3 | verified: line 554; after `w_j=v_j/[j]!` the E coefficient is `[n−j+1]_q`, the README's ladder |

Also checked outside the sample: Kustermans–Vaes Definition 2.1 is on printed p.853 (`kustermansvaes` line 743), as §1.1 cites.

**Library declarations opened at the pins** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). One `#check` file covers all 62 fully qualified `TauCeti.*` names in the README, plus 48 further names: the unqualified Tau Ceti names in their namespaces and the Mathlib names the README consumes. All resolve. The 8 misses were in modules my probe did not import (the six comodule interfaces and the two `FDRep` names), and grep found each at the pin:

| Name | File:line | What it says |
| --- | --- | --- |
| `TauCeti.UqSl2.existsUnique_linearEquiv_ladderModule` | `QuantumGroups/UqSl2/SimpleClassification.lean:62` | generic q, `Fact (q≠0)`, finite-dimensional simple ⇒ ∃! `(m,ε)` |
| `TauCeti.UqSl2.polynomialAlgEquivCenter` | `UqSl2/Center.lean:187` | `Polynomial ℂ ≃ₐ[ℂ] center`, generic q |
| `TauCeti.UqSl2.isSemisimpleModule_of_finiteDimensional` | `UqSl2/CompleteReducibility.lean:300` | generic q, finite-dimensional ⇒ semisimple |
| `TauCeti.UqSl2.casimir`, `casimir_mem_center` | `UqSl2/Casimir/Basic.lean:65`, `:138` | — |
| `TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule` | `UqSl2/TypeOne.lean:370` | — |
| `TauCeti.UqSl2.LadderModule.invariantForm`, `_pos`, `_k_pos` | `UqSl2/LadderModule/InnerProduct.lean:78`, `:115`, `:265` | q real, `0<q`, `q−q⁻¹≠0` |
| `TauCeti.UqSl2.instStarRing`, `instStarCoalgebra` | `UqSl2/Star.lean:156`, `:202` | `[Fact (IsSelfAdjoint q)]` |
| `TauCeti.UqSl2.ClassicalLadder.equivSl2Std`, `ladderMatrixH` | `UqSl2/ClassicalSpecialization.lean:664`, `:115` | Lie-module iso over a char-0 field; Laurent `ℤ[v,v⁻¹]` matrices |
| `TauCeti.UqSl2.clebschGordanEquiv` | `UqSl2/ClebschGordan/Basic.lean:326` | `⊕_(j≤min m n) L_(m+n−2j)^(εδ) ≃ L_m^ε⊗L_n^δ`, generic q |
| `TauCeti.UqSl2.comul_e_pow`, `antipode_antipode`, `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` | `UqSl2/ComulPow.lean:48`, `UqSl2/Antipode.lean:59`, `UqSl2/QuantumTrace.lean:41` | — |
| `TauCeti.UqSl2.VermaModule`, `TauCeti.UqSl2.LadderModule` | `UqSl2/Verma/Basic.lean:88`, `UqSl2/LadderModule/Basic.lean:86` | `LadderModule : ℂ → ℕ → ℤˣ → Type` |
| `TauCeti.IsGenericQuantumParameter`, `TauCeti.quantumInteger` | `QuantumInteger/Basic.lean:33`, `:150` | — |
| `TauCeti.StarCoalgebra`, `TauCeti.Comodule.coefficientMatrix`, `TauCeti.Subcomodule` | `Algebra/Coalgebra/Star.lean:46`, `Comodule/MatrixCoefficient/Matrix.lean:69`, `Subcomodule/Basic.lean:73` | — |
| `FDRep.ofShrink`, `FDRep.ofShrinkEquiv` (§8.5 "native") | Tau Ceti `RepresentationTheory/FDRep/Basic.lean:314`, `:320` | Tau Ceti, not Mathlib; exists at the pin |
| `IsGroupLikeElem` | Mathlib `RingTheory/Coalgebra/GroupLike.lean:37` | — |

**Cross-roadmap citations resolved on main.** `roadmaps resolve` finds nothing missing, and I opened each id:
- CStarAlgebras: C1.CommutativeMultiplierMorphisms `README.md:497`, C3 `:888`, C4.1 multiplicative domain `:986`, C5.2 `:1143` (C₀(X)⊗min A ≅ C₀(X,A), and the C(X×Y) identification only for compact spaces, as §1.1 says), C8.4 Toeplitz `:1676`.
- VonNeumannAlgebras: Layers 0, 1, 3, 4 (`:275`, `:392`, `:905`, `:970`), V4.Core `:972`, V10.ModularTheory `:2364`, V10.KMS `:2459` ("existence and uniqueness for faithful normal states", convention `σ_t=Δ^(it)·Δ^(−it)`, matching §3.4's `h(ab)=h(bσ_(−i)(a))`), Layer 11 full left Hilbert algebras and Tomita's theorem `:2794`–`:2801`.
- HilbertModules H1–H3 `:126`, `:179`, `:262`; OperatorAlgebraDynamics D1–D2 `:148`, `:221` (Reiter P₁/P₂ `:258`–`:261`); FreeProbability F1, F3, F6 `:127`, `:255`, `:532` (F3 proves `2sqrt3` and non-injectivity, `:305`–`:307`); AmenableGroups Layers 1, 5, 7 `:98`, `:289`, `:415`; SelfAdjointSpectralTheory Part B `:252`.
- Subfactors 3.1–3.3 `:676`, `:697`, `:774` (`markovTrace_nonneg_iff`, `jonesLoopParameters` `:729`–`:731`, pullback criterion `:752`); TemperleyLieb Layer 2 `TLCat.lift`/`lift_unique` `:466`–`:474` (takes an `ExactPairing V V` with `η≫ε=δ•𝟙`; with coevaluation R and evaluation εR* both zigzags equal ε²=1 and the loop is εd, as §0.2 says), Layers 4, 6, 7 `:545`, `:680`, `:767`.
- RepresentationTheory/CompactGroups `matrixCoeff π v w = ⟪π g v, w⟫` (`:273`), so `π_ij=⟪π(g)e_j,e_i⟫` is the conjugate of `u_ij=⟪e_i,π(g)e_j⟫`, as §1.2 pins.
- Consumers on main still resolve: QuantumEnvelopingAlgebras "Q8 item 1", HopfologicalAlgebra "Q8 item 5", DiagrammaticCoherence and TypeAHeckeAlgebras "Q8", and CStarAlgebras' downstream line (QuantumGroups consumes C1.CommutativeMultiplierMorphisms and Layer 5). Labels Q1–Q8 are mapped to Layers 1–8 (`README.md:171`).

**Overlaps and dropped ids.** `roadmaps overlaps` lists no id this README cites that an open pull request drops, and no id only an open revision defines. The Lean names this pull request removes from main's `Suggested.lean` (`StarCompatibleHopf`, `QuantumSL2`, `quantumSL2*`, `freeOrthogonalCup*`, `suqMatrix`, `SUqRelations`, `FiniteHopfModuleCat`) are cited by no roadmap on main and by none at the 457 open heads (`roadmaps grep`, empty).

**Ownership against open work, and the recorded move-down.**
- §0.1 builds C*-categories, Karoubi completion, standard solutions, intrinsic dimension and signed self-dualities. CategoricalOperatorAlgebras at `c3fc64a` (`README.md:40`–`:46`, `:2253` there) calls these its "single home" with QuantumGroups as consumer.
- §0.2's ℂ sign map is a case of TemperleyLiebOperatorAlgebras 2.1 at `ba43cc7` (its `README.md:64`, `:72`, `:1155`).
- Both are later in the merge order (lines 227 and 243) than this on-main roadmap, which the dependency check places first. Citing them would be UPWARD: the review of `cc02cfc` printed those two UPWARD lines. So the notions moved down into Layer 0, and Scope (`README.md:29`–`:44`) names both roadmaps as later owners "from which nothing is imported here". The re-pointing belongs to #888 and #867, not to this folder.
- NoncompactQuantumSymmetry (#1015) owns imprimitivity and particle representations, not the classical C₀(G) bialgebra, so §1.1 has one owner. Tau Ceti's `ZeroAtInftyContinuousMap.curryEquiv` (`Topology/ContinuousMap/ZeroAtInfty/Discrete.lean:654`) is the C₀ currying for **discrete** index spaces only (`[DiscreteTopology I]`, `:93`). §1.1's locally compact statement is strictly more general, so it is not a restatement; its ℤ×ℤ Check is the discrete case.

**Adversarial table.** q=1/2 throughout unless stated. Every row is computed here.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `schur_orthogonality` (§3.1) | SU_q(2) fundamental, all entries; 1-dim character; ι=∅ | `ū*F̃ū` with `F̃=diag(2,1/2)`: entries `q⁻¹(aa*+q²c*c)=2`, `−ac+qca=0`, `q(c*c+a*a)=1/2`. First form: `h(a*a)=1/5=(1/2)/(5/2)`, `h(c*c)=4/5=2/(5/2)`, column 2: `q²h(cc*)=1/5`, `h(aa*)=4/5`. Second form, row 1: `h(aa*)=4/5=2/(5/2)`, `q²h(c*c)=1/5`. Character: `F̃=1`, `h(u*u)=1`. ι=∅ excluded by `IsSimpleOrder` (⊥≠⊤) | pass | none |
| `compactType_iff` (§4.1) | ℂ; ℂ[C₂]; zero ring; ℂ[x], x primitive; ℂ[ℤ] with `u*=u` | ℂ: `h(z)=z`, span ℂ, both true. ℂ[C₂]: `h((a+bu)*(a+bu))=\|a\|²+\|b\|²`, both true. Zero ring: `h(1)=0≠1`, excluded by `[Nontrivial A]`. ℂ[x]: `x+h(x)=h(x)1` forces x=0, unitary span ℂ, both false. ℂ[ℤ], `u*=u`: `h((u−u⁻¹)*(u−u⁻¹))=−2<0`, the only unitary group-like is 1, both false | pass | none |
| modular automorphism (§3.2; absent) | SU_q(2); ℂ[S₃]; uniqueness | `θ(a)=4a`: `h(a*·4a)=4/5=h(aa*)`; `θ(a*)=a*/4`: `(1/4)h(aa*)=1/5=h(a*a)`; ℂ[S₃]: θ=id; two θ's give `h(b(θa−θ'a))=0` ∀b, so they agree by `h(x*x)>0` | true; statable (scratch elaborates) | R01 |
| Kac equivalence (§3.3; absent) | SU_q(2); ℂ[S₃]; ℂ | SU_q(2): `1/5≠4/5`, `S²(c)=c/4≠c`, both false; ℂ[S₃]: trace and `S²=id`, both true; ℂ: both true | true; statable | R01 |
| §0.2 sign map respects relations | TL₃ `e₁e₂e₁=e₁`; `e₁²=δe₁`; TL₄ `e₁e₃=e₃e₁` | `s(e₁e₂e₁)=−e₁e₂e₁=−e₁=s(e₁)` (degrees 3, 1); `s(e₁)²=e₁²=de₁=s(−de₁)`; `s(e₁e₃)=e₁e₃` | conclusion true; stated reason false | R02 |
| §0.2 closure formula, sign | n=1, 2; d=3/2 | `T₁^(d)(1)=d=−T₁^(−d)(1)`; `T₂^(d)(se)=−d=T₂^(−d)(e)`; `T₂(1)=d²` both; `[2],[3],[4],[5]=3/2, 5/4, 3/8, −11/16` | pass | none |
| §0.2 Checks | ℂ, R=1; ℂ², `R=e₀⊗e₁−e₁⊗e₀` | δ=1: `f₂=1−e`, `T₂(f₂)=[3]=0`; zigzag on e₀ gives −e₀ (ε=−1), `‖R‖²=2`, `(−RR*)²=2RR*=−2(−RR*)` | pass | none |
| §0.1 conjugate solutions | `R=2e₀⊗e₀+e₁⊗e₁`, `R̄=(1/2)e₀⊗e₀+e₁⊗e₁`; `T=diag(2,1)`; J | zigzags `2·(1/2)=1`, `1·1=1`; `√5·√(5/4)=5/2>2`; HS: `√17` vs `5`; `J²(z)=−z` | pass | none |
| §1.1 classical multipliers | S₃, g=(12), h=(23); ℤ, a=1[1], b=1[−1] | `gh=(123)`, `hg=(132)`: `Δf(g,h)=1`, `Δf(h,g)=0`; `d(a⊗b)=0`, `r₊=1[1]=aS(b)`, `r₋=1[−1]=S(a)b`; `r₊Δf(g)=f(gg⁻¹)=f(1)` | pass | none |
| §1.2 cancellation, Haar, Fell unitary | monoid {1,0}; C(C₂); ℤ | span `Δ(A)(A⊗1)={F: F(0,1)=F(0,0)}`, dim 3 (the three spanning functions computed); `h(1[e])=1/2` vs evaluation 1; `W(λ₁⊗1)W*(δ₁⊗δ₂)`: W* gives δ₁⊗δ₁, then δ₂⊗δ₁, then δ₂⊗δ₃ `=(λ₁⊗λ₁)(δ₁⊗δ₂)` | pass | none |
| §2.1 coefficient order | S₃ permutation rep; C₂ sign | `u₁₃(gh)=[g(h(3))=1]=1`, `u₁₃(hg)=[h(g(3))=1]=0`; `(−1)²=1` vs direct sum `−2` | pass | none |
| §2.2 unitarization | `U(s)=[[1,2],[0,−1]]` | `U²=I`; `(U*U+I)/2=[[1,1],[1,3]]`, det 2; `U*TU=[[1,1],[1,3]]` | pass | none |
| §2.3 regular corepresentation | isometry; S₃ | `⟨δΛa,δΛb⟩=(h⊗id)Δ(a*b)=h(a*b)1` by this README's right invariance; `1+1+4=6` | pass | none |
| §3.2 characters, Plancherel | SU_q(2) | `f_z(a)=2^z`, `(f₁*f₁)(a)=(F²)₁₁=4=f₂(a)`; `θ(u)=FuF`, `θ(a)=4a`; `‖a+c‖²=1/5+4/5=1`; Vandermonde det of `[[1,1],[1,4]]` is 3 | pass | none |
| §3.3 `S²u=FuF⁻¹`, traces | SU_q(2), `F=diag(2,1/2)` | `S²(c)=q²c=c/4=(FuF⁻¹)₂₁`; `S²(u₁₂)=−q⁻¹c*=(FuF⁻¹)₁₂`; `tr F=tr F⁻¹=5/2`; `tr(F·diag(1,0))=2` vs `1/2` | pass | none |
| §3.4 σ, τ, KMS | SU_q(2) | `σ_t(a)=4^(it)a`, `σ_(−i)(a)=4a`; `h(aa*)=4/5=h(a*σ_(−i)a)`, inverse convention `1/20`; `τ_(−i)(c)=c/4=S²(c)`, `σ_t(c)=c` | pass | none |
| §4.2 regular unitary | ℤ, (δ₁,δ₂,δ₃); ℂ; C₂ | `U₁₂U₁₃U₂₃`: (1,2,5)→(1,2,6)→(1,3,6); `U₂₃U₁₂`: (1,3,3)→(1,3,6); `\|2+i\|=√5`; `‖1+u‖=2` vs Haar `√2` | pass | none |
| §4.3 coamenability | ℤ; F₂; reduced F₂ | Følner `2/(2N+1)→0`; `2√3≈3.46<4=ε`; faithful Haar with unbounded counit, so BMT Thm 2.2 needs both conditions | pass | none |
| §5.1 SU_q(2) presentation | `u*u`, `uu*` entries; a=0, c=1 | the off-diagonal entries give `ac=qca`, `ac*=qc*a`; diagonals give `a*a+c*c=1=aa*+q²c*c`, hence `c*c=cc*`; q=1/2: `aa*+q²c*c=1/4≠1`; `S²(c)=(−q)(−q)c=c/4` | pass | none |
| §5.2 O_F^+ | `F=[[0,1],[−2,0]]`; `F=I₂`; n=1 | `FF̄=−2I`; `E(1)=−2e₀⊗e₁+e₁⊗e₀`, `‖E‖²=5`, normalized zigzag −I; `5/2≥n=2` (`Tr F*F≥n\|det F\|^(2/n)=n\|c\|`); `J(e₀)=−√2e₁`; `F=[[0,1],[−q⁻¹,0]]`: `FūF⁻¹=[[a,−qc*],[c,a*]]`; n=1: `u=u*`, `u²=1` | pass | none |
| §6.2 finite generators | H=0; H=ℂ; `I_(n+1)∩A_(≤n)=I_n` | A=ℂ, I=0, quotient ℂ; `dim A_(≤1)=2`; P∈B_(n+1)′ gives `B_(n+1)P=(P C_(≤n+1) P)′=B_n` (the bicommutant route the README names; Malacarne line 126 states it without proof) | pass | none |
| §7.1 Haar on SU_q(2) | q=1/2; q=±1; q=−1 model | `(3/4)/(15/16)=4/5`; `(3/4)/(63/64)=16/21`; endpoints `1/2`, `1/3`; `(5/2)²=1+21/4`; model: `ac=−ca`, `a*a+c*c=I` | pass | none |
| §7.2 fusion, dimensions | `F=[[0,1],[−2,0]]`; n=3 | `β=c⁻²‖E‖⁴=25/4=d²`; `δ=−(q+q⁻¹)=−5/2=sign(c)d`; `1, 5/2, 21/4, 85/8` vs `1, 2, 3, 4`; `ε(χ)=3∉[−2,2]`; `m₂, m₄ = 1, 2` vs `1, 1` | pass | none |
| §8.1 Hopf convention | Virelizier §2.3 | same ΔE, ΔF, ΔK and S as README; `[2]=5/2`; `KF=4FK`; `(K−K⁻¹)/(−3/2)=diag(1,−1)` on L₁⁺ | pass | none |
| §8.2 ladders | L₂⁺; L₁⁻ | weights `1/4, 1, 4`; F `1, 5/2, 0`; E `0, 5/2, 1`; `[2−2j]=5/2, 0, −5/2`; L₁⁻: `EF−FE=diag(−1,1)=(K−K⁻¹)/(−3/2)` | pass | none |
| §8.3 Casimir and splitting | L₀⁺,L₁⁺,L₂⁺; the block argument | `10/9, 17/9, 65/18`; on L₁⁺ `FE+toral=diag(0+17/9, 1+8/9)`; `X_r=ε[m−r+1]≠0` on W for 1≤r≤m; `X_(m+1)=0` ⇒ `K²=q^(2m)`; distinctness: `x+x⁻¹=y+y⁻¹` ⇒ `y∈{x,x⁻¹}` ⇒ `q^(2k)=1` with k>0, excluded | pass | none |
| §8.4 local finiteness | L₀⁻; Verma of weight 1 | L₀⁻: locally finite, and type 1 fails (`−1∉q^ℤ`); Verma: `F^jv₀≠0`, weights `4^j` | pass | none |
| §8.5 Clebsch–Gordan | m=n=j=1; Δ(E²); pivot | `α₁=−q[1]/[1]=−1/2`; `ΔE(v₀⊗v₁)=(1/2)v₀⊗v₀`, `ΔE(v₁⊗v₀)=v₀⊗v₀`, so the combination is killed; middle term `(1+q²)=5/4`; `tr K⁻¹` on `L_m^ε` is `ε[m+1]` | pass | none |
| §8.6 compact form, pairing | m=1; relations under the pairing | `h₁=q=1/2`; `KF=2F`; ON basis: `E₁₂=√2`, `F₂₁=1/√2`; `⟨F,ac⟩=q^(1/2)=q⟨F,ca⟩`; `⟨E,ac*⟩=−q^(−1/2)=q⟨E,c*a⟩`; `⟨FE,a*a+c*c⟩=q⁻¹−q⁻¹=0=ε(FE)` | pass | none |
| §8.7 classical specialization | v=1, m=2; Virelizier form | F `1, 2, 0`; E `0, 2, 1`; `[E,F]=diag(2,0,−2)`; `(q^(n−2i+2)−q^(−n))(q^(2i)−1)/((q−q⁻¹)(q²−1))=[n−i+1][i]`, which is `(n−i+1)i` at v=1 | pass | none |

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008): recorded `uncertified` (paywalled). The sampled locators of §§1.2, 2.1, 2.3, 3.1, 3.2 and 3.4, the Chapter 6 §2 locators of §§5.1 and 8.6, and the §4.1 and `compactType_iff` locators (Prop 2.2.4, Remark 2.2.2(iv)(c), Thm 3.2.12) are cited by locator only. I checked their mathematics by the computations above, and for §§3.2 and 3.4 against `nt` (Thm 1.7.3, lines 965–978).
- Ownership against open pull requests: checked against the sibling checkouts the brief lists for the closest roadmaps (#888, #867, #1015), against #1705 through `roadmaps show`, and against all open heads by `roadmaps grep` for the dropped Lean names. Other open pull requests were not read in full.

## Source issues

- **Misprint** in bmt at the proof of Theorem 2.12, printed p.13: the source writes the SU_q(2) Haar state as (1−q²) times the unweighted sum over n of the coefficients ⟨φ(a)e_(n0), e_(n0)⟩; it should weight the n-th term by q^(2n), since the unweighted sum diverges at a=1; affects nothing.
- **Error** in banica at Theorem 1, printed p.2: the source states SU(2)-type irreducibles indexed by ℕ with Clebsch–Gordan fusion for every n ∈ ℕ; at n=1, A_o(F)=C*(ℤ/2) has two irreducibles, so it should require n ≥ 2, as the abstract does; affects a stated result.
