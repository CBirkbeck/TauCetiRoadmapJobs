# Review of NoncompactQuantumSymmetry (pull request #1015 at 1acf23c)

**Verdict:** needs changes

This is a full review of head 1acf23c. The folder changed by 302 lines since a7afa46. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with four `sorry` warnings and nothing else.

Status of the previous review's findings (details at the end):

- Repaired: R01, R02, R03, R04 and R07.
- Not repaired: R05 and R06. Both are carried below as R07 and R08.

There is one new P2. The module docstring says M0a's Glimm theorem cannot be stated at the pins, but it can: four short predicates on Mathlib carriers are enough, and the statement elaborates. There are also four new P3s:

- M1 plans to re-prove the Borel selector that Tau Ceti already proves.
- `Suggested.lean` does not use the `ContRepresentation.IsUnitary` convention that the README fixes.
- Two pinned Tau Ceti APIs are missing from the supplier contracts.
- One locator into Arends–Bang-Jensen–Frahm is wrong, and one M1 Check is misattributed.

## R01 (P2) — Glimm's theorem (M0a) is statable at the pins; the docstring's reason for omitting it is false

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean:28–29`: "M0a's GCR/factor-type-I equivalence needs C*-representation spectra, primitive ideals with hull-kernel topology and spatial type-I factor representations." The target is README `:653–692` (M0a.1), which the docstring itself lists as a headline.

**Claim:** every headline that is statable at the pins is stated, and the docstring names the carrier that is actually missing.

**Witness:** three of Glimm's equivalent conditions need only Mathlib's `→⋆ₙₐ[ℂ]`, `Set.centralizer`, `IsStarProjection`, `IsCompactOperator` and `≃ₗᵢ[ℂ]`. They are: factor representations are type I, irreducible images contain compacts, and equal kernels imply equivalence. The statement below elaborates against the pins with one `sorry` warning.

**Repair:** add a section `/-! ## Layer 2: M0a — separable GCR and factor-type-I comparison -/` with the following declarations. This is the tested form:

```lean
variable {A : Type*} [NonUnitalCStarAlgebra A]
section
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
def IsNondegenerateRep (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) : Prop :=
  (Submodule.span ℂ {w | ∃ a v, w = π a v}).topologicalClosure = ⊤
def IsIrreducibleRep (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) : Prop :=
  π ≠ 0 ∧ ∀ K : Submodule ℂ H, IsClosed (K : Set H) →
    (∀ a, ∀ v ∈ K, π a v ∈ K) → K = ⊥ ∨ K = ⊤
def IsFactorRep (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) : Prop :=
  Nontrivial H ∧ IsNondegenerateRep π ∧
  ∀ z ∈ Set.centralizer (Set.range π) ∩ Set.centralizer (Set.centralizer (Set.range π)),
    ∃ c : ℂ, z = c • (1 : H →L[ℂ] H)
def HasMinimalProjection (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) : Prop :=
  ∃ p ∈ Set.centralizer (Set.centralizer (Set.range π)), IsStarProjection p ∧ p ≠ 0 ∧
    ∀ x ∈ Set.centralizer (Set.centralizer (Set.range π)), ∃ c : ℂ, p * x * p = c • p
end
theorem typeI_tfae [TopologicalSpace.SeparableSpace A] :
    List.TFAE
      [ ∀ (H : Type) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
          [TopologicalSpace.SeparableSpace H] (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)),
          IsFactorRep π → HasMinimalProjection π,
        ∀ (H : Type) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
          [TopologicalSpace.SeparableSpace H] (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)),
          IsIrreducibleRep π → ∃ a, π a ≠ 0 ∧ IsCompactOperator (π a),
        ∀ (H₁ H₂ : Type) [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁] [CompleteSpace H₁]
          [TopologicalSpace.SeparableSpace H₁] [NormedAddCommGroup H₂] [InnerProductSpace ℂ H₂]
          [CompleteSpace H₂] [TopologicalSpace.SeparableSpace H₂]
          (π₁ : A →⋆ₙₐ[ℂ] (H₁ →L[ℂ] H₁)) (π₂ : A →⋆ₙₐ[ℂ] (H₂ →L[ℂ] H₂)),
          IsIrreducibleRep π₁ → IsIrreducibleRep π₂ → (∀ a, π₁ a = 0 ↔ π₂ a = 0) →
          ∃ U : H₁ ≃ₗᵢ[ℂ] H₂, ∀ a v, U (π₁ a v) = π₂ a (U v) ] := by
  sorry
```

The nondegeneracy clauses are required. Without `π ≠ 0` and the dense span, the zero representation on ℂ counts as irreducible and the zero space as a factor. Both sides are then false for every A, and the theorem becomes vacuous; my first probe made exactly this error. Checked on the repaired form:

- A=0: all three conditions are vacuously true.
- A=ℂ: all three are true. A nondegenerate representation has π(1)=1 and `π(A)''=ℂ1`, so p=1 is minimal. The only irreducible representation is one-dimensional, and π(1)=1 is compact.

Name the five declarations in M0a.1. The composition-series condition and the Fell–hull-kernel homeomorphism stay README targets. Rewrite the docstring bullet to say that only those two need primitive-ideal carriers.

## R02 (P3) — M1 plans to re-prove the Borel selector that Tau Ceti's Kuratowski–Ryll-Nardzewski theorem gives

**Location:** README `:1145` ("M1 owns the standard-Borel quotient selector"); `:1167` ("prove the selector by countable nested balls if the consumed API supplies only a universally measurable selection"); `:1324` ("lift representatives by the Borel selectors of the closed subgroup quotients").

**Claim:** what the pinned libraries prove is consumed by name, not re-planned.

**Witness:** Tau Ceti `TauCeti.exists_measurable_forall_mem` (`TauCeti/MeasureTheory/MeasurableSpace/Selection.lean:151`) gives a measurable selection for closed-valued maps into a Polish space that are weakly measurable. For `M(x)=q⁻¹{x}` the hypotheses hold: cosets are closed, and `{x : M(x)∩U≠∅}=q(U)` is open because q is open. G is Polish because it is lcsc.

**Repair:** list `TauCeti.exists_measurable_forall_mem` under "From Tau Ceti". At `:1145` and `:1167`, derive the Borel section of `G→G/H`, and of each closed-subgroup quotient at `:1324`, from it by the computation in the witness. Delete the conditional nested-balls route. Burgess's transversal for countably separated orbit relations (`:1324`) is not covered by this theorem and stays an M1 target.

## R03 (P3) — `Suggested.lean` uses ad hoc `Isometry` fields instead of the `ContRepresentation.IsUnitary` convention the README fixes

**Location:** README `:60`: "Use `ContRepresentation.IsUnitary` for inner-product preservation, keeping strong orbit continuity separate." `Suggested.lean:143` (`fiber_isUnitary : ∀ h, Isometry (fiberRepresentation h)`), `:176` (`(∀ g, Isometry (U g))`) and `:196` (`rep_isometry : ∀ g, Isometry (rep g)`).

**Claim:** the README and the Lean file agree, and the Lean file uses the native predicate the README pins.

**Witness:** Tau Ceti defines `ContRepresentation.IsUnitary` at `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean:49`. Its `isUnitary_iff_norm_map` (`:52`) shows that it is equivalent to the current fields, so nothing changes mathematically.

**Repair:** add `public import TauCeti.RepresentationTheory.Continuous.Unitary.Basic`. Replace the three fields by `fiber_isUnitary : fiberRepresentation.IsUnitary`, `U.IsUnitary` and `rep_isUnitary : rep.IsUnitary`, and adjust the M1 prose at `:1154` ("whose operators are isometries"). Tested: the modified file elaborates with only its four `sorry` warnings.

## R04 (P3) — Supplier contracts omit pinned Tau Ceti carriers that Layer 0, M1 and M4 use

**Location:**

- `:11`: "OperatorAlgebraDynamics D1 for covariant pairs, integrated forms, group C*-algebras and continuous actions".
- `:2673`: "Consume OperatorAlgebraDynamics D1 for the integrated covariant representation, its L¹ norm bound, full crossed product … nondegenerate multiplier extensions".
- M1 Dependencies `:1735`: "P.1–P.3; Layer 0; OperatorAlgebraDynamics D1 … VonNeumannAlgebras V3 and V4.0.Fields".

**Claim:** declarations that exist at the pins are cited by exact name and file, and every layer lists its dependencies.

**Witness:** these all exist at the Tau Ceti pin:

- `TauCeti.CStarAction.CovariantRepresentation` (`…/Action/Covariant/Basic.lean:33`).
- `integratedOperator` and `norm_integratedOperator_le` (`…/Covariant/Integrated.lean:88`, `:115`).
- `FullCrossedProduct`, a `NonUnitalCStarAlgebra` (`…/CrossedProduct/Full.lean:266`, `:276`).
- `coefficientMultiplier` and `groupMultiplier` (`…/CrossedProduct/Multiplier.lean:144`, `:224`).

M1 uses `TauCeti.ProjValMeasure` and `ProjValMeasure.map`, but its Dependencies list does not mention them.

**Repair:**

- List these names under "From Tau Ceti" and cite them where Layer 0 and M4.SpatialLocalization consume integrated forms, the full crossed product and the multiplier unitaries.
- Keep OperatorAlgebraDynamics D1 for what Tau Ceti lacks: D1.BorelPrefix and the twisted algebras.
- Add "Tau Ceti `TauCeti.ProjValMeasure`, `ProjValMeasure.map`" and "InductionRestriction Layer 2.1" (consumed at `:1427`) to M1's Dependencies.

## R05 (P3) — The Arends–Bang-Jensen–Frahm locator puts (1.5) and observations A–C in the wrong section, and the source is missing from References

**Location:** README `:4918–4919`: "[Arends–Bang-Jensen–Frahm, §1.2, (1.4)–(1.5), observations A–C](https://arxiv.org/html/2406.11349)".

**Claim:** a locator names the section that contains the cited statement.

**Witness:** in arXiv:2406.11349v1 (key ABF24 here), (1.4) is in §1.2 (p.7, ABF24 line 392). (1.5) and observations (A)–(C) are in §1.3, "The admissible dual" (p.8, ABF24 lines 414–425). The References section (`:9325–9344`) has no entry for this paper, although `:4906`, `:4918` and `:5296` cite it.

**Repair:** write "§1.2, (1.4), and §1.3, (1.5) and observations (A)–(C), pp.7–8". Add a References entry: C. Arends, F. Bang-Jensen and J. Frahm, "Explicit Hilbert spaces for the unitary dual of rank one orthogonal groups and applications", arXiv:2406.11349v1, citing it for Lemma 2.2 (p.13), Proposition 1.3 (p.7–8) and Theorem 3.8 (p.22). Tested: Theorem 3.8 (ABF24 line 1224) gives exactly the helicity sets of "Finite-null labels" (`:5270–5278`) at n=3.

## R06 (P3) — An M1 Check claims a general arbitrary-Hilbert extension that M4 does not prove; one undefined abbreviation remains

**Location:** `:1184–1185`: "The extension to arbitrary Hilbert spaces is the separate M4.SpatialLocalization theorem." `:2036`: "SA supplies its single-representation spectral/multiplicity comparison".

**Claim:** prose claims match the targets, and every abbreviation is defined.

**Witness:** M4.SpatialLocalization `:2673` owns only "the following bounded spatial extension of that theorem": `G_sp=ℝ³⋊SU(2)` acting on ℝ³, not the general transitive theorem. "SA" is used standalone only at `:2036`; elsewhere it appears only as the target prefix in "SA-B85".

**Repair:** at `:1184` write "For `G_sp=ℝ³⋊SU(2)` on ℝ³ the arbitrary-Hilbert extension is M4.SpatialLocalization; the general transitive theorem is stated for separable 𝓗 only." At `:2036` write "SelfAdjointSpectralTheory supplies".

## R07 (P3) — Three OperatorAlgebraDynamics ids exist only at that roadmap's open revision, which the description does not name

Carried from R05 of the previous review, which first raised it three reviews ago. No repair report marks it not actionable, and the description is unchanged.

**Location:**

- D1.BorelPrefix: README `:19`, `:151`, `:234`, `:309`, `:340`, `:358`, `:429`, `:1145`, `:1453`, `:1481`, `:1491–1492`, `:1515–1517`, `:1735`, `:1757`, `:1781`, `:2073`, `:4242`; `Suggested.lean:16–17`.
- D1.TwistedBorel: `:19`, `:151`, `:1763`, `:2073`.
- D4.Harmonic: `:19`, `:151`, `:195`, `:220`.

The description's revision line reads: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1145".

**Witness:** OperatorAlgebraDynamics on main (1d4e7ce) contains the three strings 0, 0 and 0 times. At the head of #1137 it contains them 14, 12 and 17 times. The overlap report lists D1.BorelPrefix and D1.TwistedBorel as defined only by #1137. The description and its merge-order chain never mention 1137.

**Repair:** nothing in the folder changes. Name #1137 (OperatorAlgebraDynamics) in the revision line and in the merge-order chain before this pull request. Note that #1145 adds a new folder; it is not a revision of a roadmap on main.

## R08 (P3) — Size: split into a Part II

Carried from R06 of the previous review. No repair report addresses it.

**Location:** the folder. The README now has 9,344 lines (683,856 bytes). M5 spans `:3720–6357` and M6 spans `:6358–9314`.

**Witness:** both figures grew this round (from 9,298 lines). The named consumers use Layer P, M2/M4 and the helicity models (`:9315–9323`), not the M5 all-sequence tables or the M6 pair/exchange/tree tables.

**Repair:** as before. Move M5.DeSitterNullZero, M5.DeSitterRemainingTransitions, M5.StructuralModelComposition and the M6 tables after M6.MeasuredPair into "NoncompactQuantumSymmetry, Part II". Its introduction says that the base roadmap stops at M5.DeSitterFiber and the M6.MeasuredPair interface.

## Previous findings

- **R01 (Whitehead duplicated): repaired.** `:13` now reads "Tau Ceti already proves both Whitehead lemmas … P.4 consumes these … and does not restate them". P.4 `:533–539` reads "Both are consumed, not proved here", and `Suggested.lean` no longer declares the two theorems. I opened `TauCeti/Algebra/Lie/Whitehead.lean:105`, `:113` and `:140`. The README's description of the Tau Ceti routes (sheared module `V⊕K`; Levi on `ofTwoCocycle`) matches the file header there.
- **R02 (imprimitivity theorem absent): repaired.** `SystemOfImprimitivity` and `SystemOfImprimitivity.exists_induced` are at `Suggested.lean:190`, `:213`, and the docstring `:46–47` now says the PVM "is not the missing carrier". Adversarial rows 5–6 below.
- **R03 ("G0 item0"): repaired.** "item0" occurs 0 times. `:156`, `:3790` and `:6356` cite §G0.0, and `:3791` cites §G0.2. Both headings exist on main (LieGroupoidsPoisson `:261`, `:420`).
- **R04 (abbreviations, heading, "prototype"): repaired.** SAST, VNA, NQS, "phase cut" and "prototype" each occur 0 times, and the heading now reads "Basic theory, rescalings and global models". The standalone "SA" at `:2036` is new to this review (R06).
- **R05 (#1137 not named): not repaired.** The description is unchanged; carried as R07.
- **R06 (size): not repaired.** The README grew to 9,344 lines; carried as R08.
- **R07 (three classical theorems without locators): repaired.** `:1167` gives Mackey1958 §6 and Echterhoff2010 Theorem 6.4 p.25 with Example 6.6(1) p.26. `:662–667` and `:687–688` give BekkaDeLaHarpe2019 Theorem 8.F.3, Remark 8.F.2(3) and Comments (1), (8), (9). `:1848–1853` give Theorem 6.D.7 and Remark 6.D.6. All of these are verified below.

## Verified sound

**Gate** (my run on this head): `gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate records the same with `build=0`.

- The diff outside the folder is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.MP"`).

**Dependency check** (`--movable`): `depcheck: 236 roadmaps, 2419 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

- NoncompactQuantumSymmetry is line 156 of the merge order.
- Its suppliers in the order all come earlier: VonNeumannAlgebras 5, CStarAlgebras 7, HilbertModules 8, PseudodifferentialOperators 13, AutomorphicFormsOnReductiveGroups 59, MetaplecticAutomorphicForms 151, LieGroupoidsPoisson 153.
- SmoothBanachRepresentations (#1145), OperatorTheory/UnboundedOperators (#1027) and LaguerreJacobi (#117) are open pull requests that add new folders; the description's "Depends on" list names them.
- QuantumFoundations (210) and RelativisticQuantumFieldTheory (212) are consumers only. LocalVariationalFieldTheory (223, on main) is named for field-side ownership, not consumed.

**Build.** `lake env lean` on `Suggested.lean` (10 s) warns `declaration uses sorry` at `:83`, `:101`, `:174` and `:213`, and nothing else.

**Signatures.** I elaborated `#check @name` for all ten declarations in one scratch file.

- The five "dropped `[IsClosed (H : Set G)]`" leads are false: each type carries `[inst_8 : IsClosed ↑H]`.
- `exists_induced` carries every binder of the README statement at `:1167`: lcsc Hausdorff G, closed H, Polish X with continuous action, separable complete E, and `e` with its equivariance.
- `SystemOfImprimitivity` carries `[MeasurableSMul G X]`, which `exists_induced` gets from `ContinuousSMul` and `BorelSpace`.
- Nothing changed after my probes, except the R03 variant, which also elaborates.

**Padding probe.** `first | (simp; done) | rfl | infer_instance | (aesop; done) | exact ⟨_, rfl⟩` on each of the four `sorry`s: none closes.

**Headlines.**

- Wigner (P.1): stated.
- Becker–Kechris realization (M1): stated.
- Induced representation on `Lp` (M1): stated.
- Mackey imprimitivity (M1): stated.
- Glimm (M0a): statable but absent (R01).
- The M1 stages/tensor, M2 classification and disintegration, and M3–M6 classifications and tables are named as not statable. Their carriers are absent at both pins: there is no direct integral, measurable Hilbert field, unitary dual or twisted group C*-algebra (I searched both libraries).
- The Whitehead lemmas and Pettis's theorem are consumed and correctly not stated.

**Adversarial table.** Conventions: Hilbert inner products are conjugate-linear in the first slot, `g_*μ(B)=μ(g⁻¹B)`, `k_s(g,x)=s(x)⁻¹gs(g⁻¹x)`, and `η=diag(−1,−1,−1,+1)`.

| # | Statement | Instance | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `rayTransitionProbability` Checks `:259–261` | e₁,e₂; e₁,e₁+e₂; 2e₁,i(e₁+e₂) | 0; 1/(1·2)=½; ⟨2e₁,i(e₁+e₂)⟩=2i, 4/(4·2)=½ | Pass |
| 2 | `wigner_reconstruction` | H=ℂ; ℂ² with conjugation | one ray, U=id; Bloch (x,y,z)↦(x,−y,z), det −1 ∉ SO(3), so the antiunitary disjunct is needed | Pass |
| 3 | `exists_polishTopology_continuousSMul` | ℤ on ℝ swapping [0,1),[1,2) | Borel, not continuous; the refinement making both intervals clopen is Polish with the same Borel sets | Pass |
| 4 | `exists_inducedRepresentation` | C₂, H={1}, masses (1,4), F=(1,0) | r_s=(4,¼); U_sF=(2·0, ½·1)=(0,½); ‖U_sF‖²=¼·4=1=‖F‖² | Pass |
| 5 | `SystemOfImprimitivity.covariant` | ℝ on L²(ℝ), B=[0,1], t=1 | U₁E(B)U₁⁻¹=1_[1,2]=E(1·B), not 1_[−1,0] | Pass |
| 6 | `exists_induced`, Checks `:1171–1185` | ℤ on ℤ, H={0}; H=G; G=H={1} with E=ℓ²(ℝ); E=0 | (WU_mv)(n)=U_(−n)U_mE({n−m})v=(Wv)(n−m), isotropy −n+m+(n−m)=0, r=1; isotropy g (s=1) or a⁻¹ga (s=a); L²(pt;K)≅K separable, so no W; E=0 gives K=0 | Pass (Check wording: R06) |
| 7 | Mackey/Green locators `:1167` | BekkaDeLaHarpe2019, Echterhoff2010 | BekkaDeLaHarpe2019 line 1985 (p.47) "[Mack–58, §6]"; Echterhoff2010 line 1221 Thm 6.4 (p.25), line 1256 Ex 6.6(1) (p.26) Rep(H)↔Rep(C₀(G/H),G) | Pass |
| 8 | M0a locators `:662–667`, `:687` | BekkaDeLaHarpe2019 | Thm 8.F.3 line 12057 (p.257); Rem 8.F.2(3) line 12048; Comments (1) 12073, (8) 12090 (Kaplansky (iii)⇒(i); Dixmier (iii)⇔(iv)), (9) 12097 (Glimm (i)⇒(iii)); GCR group = irreducible image ⊇ K (Def 6.E.2 line 9521), so (ii)⇔(iii) covers "GCR ⇒ composition series" | Pass |
| 9 | M0a statability | probe of R01 | elaborates; A=0: three vacuous truths; A=ℂ: three truths; without nondegeneracy, π=0 on ℂ is "irreducible" and both sides are false for every A | Fail: R01 |
| 10 | M2.TypeIDisintegration `:1848–1853` | BekkaDeLaHarpe2019; A=ℂ⊕ℂ | Thm 6.D.7 line 9457 (p.202), Rem 6.D.6 line 9440 (p.201), 8.F.3(vi) standard; ℂ⊕ℂ² gives m=(1,2), dims 1+2=3 | Pass |
| 11 | TransformationTypes.HeisenbergShear `:1783` | φ((r,s),t)=(r,t,s+rt) | φ(ab) and φ(a)φ(b) both (r+r′,t+t′,s+s′+rt+rt′+r′t′); t·χ_(a,b)(r,s)=χ(r,s+tr)=χ_(a+tb,b); π_b(gg′) phase ib(u(r+r′)+s+s′−tr′) on both sides; centre e^(ibs); N-spectrum {(bu,b)}=ℝ×{b}. Tau Ceti law at `GroupTheory/SpecificGroups/Heisenberg.lean:95` matches | Pass |
| 12 | M4.P `:2362–2385` | n=0,3,4; q_B | n=0: ∫I_(0,iν), no D; n=3: D_3⁺; n=4: D_2⁺⊕D_4⁺ (D_l⁺ has weights l+2ℕ); I: (1+ν²)/4; D_2: 0, which is the trivial value | Pass (Lang not verifiable) |
| 13 | Actual normalized principal carrier `:3486` | g⁻¹g_z, k_z | g⁻¹g_z=g_(z′)p with p=[[α,c],[0,α⁻¹]], α=a−cz, factor \|α\|^(−2)·\|α\|^(−2λ)phase(α)^(−m); k_z∈SU(2), p₁₁=(1+\|z\|²)^(1/2), giving (1+\|z\|²)^(−1−iρ); ∫d²z/(π(1+\|z\|²)²)=1; F(conj φ)(ξ)=conj φ̂(−ξ) | Pass |
| 14 | M5.LittleDual.CoefficientSequence `:4024` | Fell closure; s=0,1 | π∈closure{π_k(r)} for all subsequences ⇔ π_j→π; a_2(s)=(1−s)/(1+s): 1 at s=0, 0 at s=1 (trivial); SL(2,ℂ) a_1=(1−s)/(1+s) | Pass |
| 15 | Finite-null labels `:5270` | ABF24 Thm 3.8, n=3, σ=spin p | I(σ,1,j)± on ±τ>j, so q=j+1 gives {q..p}, {−p..−q}; Q(σ,1,0) on τ=0 gives {0}=π_(P,0); principal {−p..p}; A²=[μ(μ+1)−t][s+t]=−Ω′+t(2−Ω)−t² with Ω=2+s−μ(μ+1), Ω′=−μ(μ+1)s | Pass |
| 16 | ABF24 dictionaries `:4895–4906`, `:4918–4926` | Lemma 2.2 (line 638), (2.11) (line 636), Obs. (C) (line 425) | N̄ ↦ −i[ξΔ−2(E−λ+ρ)∂−2dσ(…)] with ρ=3/2; J₃₄ ↦ −(E−λ+3/2); (ρ+1−k+α_k), n=3: c_N=N+3/2, c_M=M+1/2 | Pass; locator: R05 |
| 17 | Uniform lower models `:5639` | massive, continuous spin, spacelike, π_(P,0) | rν→m/ℏ: r²κ→−(m/ℏ)², rA→(m/ℏ)√(j(j+1)−t); rp²→ρ/ℏ: r²κ→0, rA→ρ/ℏ; rμ→a/ℏ: rA→(a/ℏ)√(s+t); μ=0, s=−P(P+1): κ=P(P+1), Ω′=0 | Pass |
| 18 | One nonzero mass, one zero mass `:6544` | A⊗E, A⊗C; j=½, s=0 | V_j⊗Ind_U(1)^SU(2)e^(isθ)=⊕_a Ind e^(i(s+a)θ), so Q_J(½,0)=2 for each J∈½+ℕ₀; C fibre (2j+1) copies of all weights ≡j+e, giving (2j+1)(2J+1) | Pass |
| 19 | Both momenta zero / one zero `:6565–6600` | E⊗E, B⊗E, C⊗E | η∈(\|κ₁−κ₂\|,κ₁+κ₂), stabilizer {±1}, multiplicity 1; transverse radius κ=η sinθ∈(0,η) with two hemispheres, so C²; ζ∈(max(κ−η,0),κ+η) with a κ′-family, so C^∞ | Pass |
| 20 | Positive-energy Poincaré examples `:6685` | h₁=h₂=1; h₁=1,h₂=−1; continuous spin + helicity | character h₁−h₂: J∈ℕ₀ vs J≥2; weights e+h+ℤ each once, so 2J+1 | Pass |
| 21 | Discrete spacelike input `:7183` | l=1, j=0, σ=+; pair geometry | V_J=#{b≤J−½}=J+½; opposite list L≤2j−l=−1 is empty; q(p_s)=−r₀², q(p_m)=m², pairing s, q(sum)=m²−r₀²+2s, spatial (m²+r₀²−q)/(2r₀)>0 for q<0 | Pass |
| 22 | Principal Lorentz × spacelike `:7697` | m=5, l=1 | chain n=2b−4<0 for b=0,1 gives n=−4,−2, so D_2⁻ twice, D_4⁻ once; E_L: L=2, k=1 gives 2; L=4, k=0 gives 1; L=3, k=½ gives 0 | Pass |
| 23 | Pair normalization `:8973–8986` | atoms 3; 1,3 one layer; 1,3 two layers; three singletons | Z=½, w=⅓, √3; w=¼ giving (¼,¾); Z=¾, w=(⅔,1/9) giving (⅔,⅓); Z=7/8 giving (4/7,2/7,1/7) | Pass |
| 24 | One common measure `:8995` | SU(2) leaves (½,½,1) | splits (1/6,2/3,1/6), (¼,½,¼)×2; average (2/9,5/9,2/9); r=(¾,6/5,¾), (9/8,9/10,9/8)≤6; conditional (½,1/6)/(2/3)=(¾,¼); Echterhoff2010 Rem 5.10(2) line 975 (p.20) | Pass |
| 25 | Young fields `:9218` | unitary D; gauge S; n=2 | E_ij*=E_ji; E′_ij=Σ S_ai conj(S_bj)E_ab; W*W=Σ\|S_a1\|²E₁₁=E₁₁, WW*=E′₁₁; n=2 Sym: E=(1+U_swap)/2 | Pass |
| 26 | M5.AffineG5 `:6244` | group law, cocycle, radical | M₂M₁=(Λ₂Λ₁,a₂+Λ₂a₁+b₂σ₁,b₂+Λ₂b₁,σ₂+σ₁); M·M⁻¹ a-part a−a+bσ−bσ=0; H(x)S(σ)=S(σ)H(a+σb,b), so c=½ω(shear_(σ₁)x₂,Λ₂x₁) as displayed; series span{P,Z}⊃ℝZ⊃0 | Pass |
| 27 | P.3 Checks `:474–493` | ℤ/2 odd; ℝ² ω_θ | ω(t,t)=conj ω(t,t), so ±1, δb(t,t)=1, H²=ℤ/2; Z¹≅𝕋, f_z(t)=z⁻² onto, H¹=0; commutator exp(iθ(ab′−a′b)) | Pass |
| 28 | P.4 Checks `:556–578` | Galilei τ; so(3) | Dτ=v·a′−v′·a; f(x)=x×a=δa; c(x,z)=⟨a,x×z⟩=d₁₂λ with λ=−⟨a,·⟩ | Pass |
| 29 | M3 momentum model `:2190–2208` | generators | [X,P]=iℏ, [K_i,P_j]=iℏmδ, [K_i,H]=iℏP_i; exp(iv·K/ℏ)ψ(p)=ψ(p−mv); dΠ(T_i)=−iP_i/ℏ gives T↦−P | Pass |
| 30 | M1 selector `:1167` | q:G→G/H | M(x)=q⁻¹{x} closed and nonempty, {x: M(x)∩U≠∅}=q(U) open; Tau Ceti hypotheses hold | Fail: R02 |
| 31 | Unitarity fields | `IsUnitary` variant | elaborates; `isUnitary_iff_norm_map` gives equivalence | Fail: R03 |

**Library declarations opened at the pins.**

- Tau Ceti `Algebra/Lie/Whitehead.lean:105`, `:113`, `:140`.
- Tau Ceti `Analysis/InnerProductSpace/ProjValMeasure/Basic.lean:91` (structure; `proj_univ`, `proj_inter`, `inner_proj`) and `:524`.
- Tau Ceti `…/ProjValMeasure/Map.lean:40`, `:56`, `:69`, `:77`.
- Tau Ceti `MeasureTheory/MeasurableSpace/Selection.lean:151`.
- Tau Ceti `RepresentationTheory/Continuous/Unitary/Basic.lean:49`.
- Tau Ceti `Analysis/CStarAlgebra/Action/Covariant/Basic.lean:33`, `…/Integrated.lean:88`, `…/CrossedProduct/Full.lean:266`, `…/Multiplier.lean:144`, `:224`.
- Tau Ceti `GroupTheory/SpecificGroups/Heisenberg.lean:95–101` and `Topology/Algebra/Group/Heisenberg.lean:62`, `:130`.
- Tau Ceti `GroupTheory/GroupExtension/Of/FactorSet.lean:96`.
- Tau Ceti `RepresentationTheory/Compact/UnitaryModel.lean:88`, `SchurOrthogonality.lean:151`, `PeterWeyl.lean:713`, `Unitarizable.lean:241`.
- Tau Ceti Specht names in `RepresentationTheory/Symmetric/Specht/Complex.lean`.
- Mathlib `Algebra/Lie/CartanCriterion.lean:257` and `Algebra/Lie/Semisimple/Basic.lean:288`.
- Mathlib `Probability/Kernel/RadonNikodym.lean:229`, `:237`, `:505`, `:608`.
- Mathlib `Probability/Kernel/Disintegration/Basic.lean:132`.
- Mathlib `RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:629`.
- Mathlib infers no `PolishSpace` for lcsc spaces (probe), so OperatorAlgebraDynamics is the correct supplier for that.

**Cross-roadmap citations resolved.**

- LieGroupoidsPoisson §G0.0 and §G0.2 on main.
- InductionRestriction Layer 2.1 (main `:346`) and `Gassmann.almostConjugate_iff_permutation_equiv` (its `Suggested.lean:729`, namespace `…InductionRestriction.Gassmann`). The citation tool's lead is a false positive; its other four leads are this roadmap's own `Suggested.lean` names.
- OperatorAlgebraDynamics D1/D3/D5 anchors on main (`:75`, `:205`, `:277`).
- SmoothBanachRepresentations at #1145, under `RepresentationTheory/`.
- QuantumFoundations #1771 (`:22`, `:65`) and RelativisticQuantumFieldTheory #1772 consume Layer P and M2/M4 without restating them.

**Ownership.** I searched all open roadmap heads and main for "imprimitivity", "SystemOfImprimitivity", "Wigner's theorem", "Becker–Kechris", "Glimm" and "GCR/postliminal".

- Mackey's PVM imprimitivity theorem and Glimm's type-I theorem have no other owner.
- OperatorAlgebraDynamics D3 owns Green's C*-form, which this roadmap consumes.
- CountableStructureSpaces (#1316 `:707`) and BorelEquivalenceRelations (main `:672`) leave Becker–Kechris to others.
- The overlap report shows no other pull request changing this roadmap and no dropped id. The ids only #1137 defines are R07.

## Not verifiable

- Mackey1958 §6: settled as uncertified in the manifest and cited by locator. BekkaDeLaHarpe2019 line 1985 confirms the section.
- Lang, *SL₂(ℝ)*, Chapter VIII, pp.163–177 (M4.P `:2364`): a Springer chapter behind a paywall; not fetched.
- Fell 1961 §V, Bacry–Lévy-Leblond 1968 §II and Nelson 1959: as in the previous review, only paywalled pages exist. Gel'fand–Naimark 1947 and the other primary references are outside this round's sample.
- Dooley's and Grundling's notes: no legal copy found. Weibel1994 and Kechris1995: books not held.
- The README flags no locator as unverified.
- The package manifest records only Mackey1958, Echterhoff2010 and BekkaDeLaHarpe2019. I read ABF24 (arXiv:2406.11349v1) through the sources service with a scratch copy of the manifest and left the real manifest unchanged.

## Source issues

- **Misprint** in BekkaDeLaHarpe2019 at Remark 8.F.2(3), p.257: the source says Glimm's theorem shows that the class of separable C*-algebras coincides with the class of separable GCR C*-algebras; it should say that the separable type-I C*-algebras are exactly the separable GCR ones; affects nothing.
- **Misprint** in ABF24 (arXiv:2406.11349v1) at Theorem 3.8(4) and its proof, pp.22–23: the source uses the signed weight τ_a and says the coefficient vanishes exactly when τ_a>0; for odd n and a=(n−1)/2 it should use |τ_a| (quotient on τ_a=0, as Proposition 1.3(3)(ii)); affects a stated result.
- **Misprint** in ABF24 at §1.2, p.7: the source credits the Gamma-ratio identity with α_m replaced by |α_m| to the functional equation of Γ; it follows from the reflection formula, since cos π(α±λ) agree for integer α; affects nothing.
