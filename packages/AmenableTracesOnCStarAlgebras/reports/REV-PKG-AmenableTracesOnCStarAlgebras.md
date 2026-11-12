<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13767#issuecomment-6796449355 -->
Review (claude) of 6b8f660

Verdict: needs_changes

1. **F01** (P2) Statable permanence headlines are absent from `Suggested.lean`

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md` lines 17–18 (Summary, among the
   end theorems): "convexity, closure, the face property and the permanence of these classes under
   subalgebras, quotients, ideals, unitization and minimal tensor products";
   `packages/AmenableTracesOnCStarAlgebras/Suggested.lean` lines 38–47 and 311–335.

   **Claim.** The module docstring lists the headlines that are not statable; every other headline is
   stated.

   **Witness.** The docstring names only "Permanence under minimal tensor products" as not statable,
   so it treats permanence as a headline; Layer 6 of the Lean file states the two face theorems only.
   Normalized restriction (§6.3), extension from ideals (§6.5) and unitization (§3.2) need no carrier
   beyond `A →P[ℂ] ℂ`, `A →⋆ₙₐ[ℂ] B` and `Unitization ℂ A`.

   **Repair.** Add the three statements below (Layer 3 for the third, Layer 6 for the first two),
   name them in README §6.3, §6.5 and §3.2 (Unitization bullet) and in the docstring's "Stated here"
   paragraph. Appended to a scratch copy of the file, they elaborate at the pins with `sorry` as the
   only warning, and the one-tactic probe does not close them. The first covers subalgebras, corners,
   ideals (restriction) and, with `c = 1`, lifting from quotients, so no separate quotient statement
   is needed (the bare pullback of §3.4 is a composition of approximants and stays a README target).

   ```lean
   theorem isAmenableTrace_of_normalized_comp {A B : Type*} [NonUnitalCStarAlgebra A]
       [PartialOrder A] [StarOrderedRing A] [NonUnitalCStarAlgebra B] [PartialOrder B]
       [StarOrderedRing B] (ι : A →⋆ₙₐ[ℂ] B) (τ : B →P[ℂ] ℂ)
       (hτ : IsTracialState τ) (γ : A →P[ℂ] ℂ) (hγ : IsTracialState γ) {c : ℝ} (hc : 0 < c)
       (hγτ : ∀ a, γ a = (c : ℂ)⁻¹ * τ (ι a)) :
       (IsAmenableTrace τ → IsAmenableTrace γ) ∧
         (IsUniformAmenableTrace τ → IsUniformAmenableTrace γ) := by
     sorry

   theorem isAmenableTrace_of_comp_ideal {A B : Type*} [NonUnitalCStarAlgebra A]
       [PartialOrder A] [StarOrderedRing A] [NonUnitalCStarAlgebra B] [PartialOrder B]
       [StarOrderedRing B] (ι : A →⋆ₙₐ[ℂ] B) (hι : Function.Injective ι)
       (hideal : ∀ (b : B) (x : A), b * ι x ∈ Set.range ι ∧ ι x * b ∈ Set.range ι)
       (γ : B →P[ℂ] ℂ) (hγ : IsTracialState γ) (τ : A →P[ℂ] ℂ) (hτ : IsTracialState τ)
       (hτγ : ∀ x, τ x = γ (ι x)) :
       (IsAmenableTrace τ → IsAmenableTrace γ) ∧
         (IsUniformAmenableTrace τ → IsUniformAmenableTrace γ) := by
     sorry

   theorem isAmenableTrace_unitization_iff {A : Type*} [NonUnitalCStarAlgebra A]
       [PartialOrder A] [StarOrderedRing A] (τ : A →P[ℂ] ℂ) (hτ : IsTracialState τ)
       (τ' : Unitization ℂ A →P[ℂ] ℂ)
       (hτ' : ∀ (z : ℂ) (a : A), τ' (Unitization.inl z + (a : Unitization ℂ A)) = z + τ a) :
       (IsAmenableTrace τ' ↔ IsAmenableTrace τ) ∧
         (IsQuasidiagonalTrace τ' ↔ IsQuasidiagonalTrace τ) ∧
         (IsUniformAmenableTrace τ' ↔ IsUniformAmenableTrace τ) := by
     sorry
   ```

   Instances computed: corner `M_3 → M_4`, `τ = tr_4`, `c = 3/4`: `γ(a) = (4/3)·Tr(a)/4 = tr_3(a)`,
   amenable. `λ ↦ (0, λ)` into `ℂ ⊕ ℂ` with `τ = pr₁`: `τ ∘ ι = 0`, no state `γ` satisfies `hγτ`, so
   the first statement is not falsified. `M_2 ⊕ 0 ⊆ M_2 ⊕ ℂ`, `τ = tr_2`: `γ = tr_2 ∘ pr₁`. `A = ℂ`
   (unital): `τ'` is the first-summand evaluation on `ℂ ⊕ ℂ`, amenable on both sides; `A = c₀`,
   `τ = δ_1`: `τ'(z + a) = z + a_1`, evaluation at `1` on `c`.

2. **F02** (P3) Two docstring locators into Theorem 3.1.6 point at the wrong items

   **Location.** `packages/AmenableTracesOnCStarAlgebras/Suggested.lean` line 165: "(README §4.4;
   brown2006, Theorem 3.1.6 (1) ⇔ (3))"; line 178: "(README §4.4; brown2006, Theorem 3.1.6
   (1) ⇔ (4))".

   **Claim.** Item (3) of the source theorem is the u.c.p. extension and item (4) the tensor
   functional.

   **Witness.** brown2006 line 810: item (3) is min-continuity of `μ_τ`; line 812: item (4) is
   min-continuity of the homomorphism into `B(L²(A,τ))`; line 815: item (5) is the u.c.p. map
   `B(H) → π_τ(A)''`, with footnote 2 (line 819) for one representation.

   **Repair.** Line 165: "Theorem 3.1.6 (1) ⇔ (5), with footnote 2". Line 178: "Theorem 3.1.6
   (1) ⇔ (3)". The module docstring's bimodule form is then item (4).

3. **F03** (P3) Proposition 1.4 of tikuisis-white-winter2017 is cited for more than it states

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md` line 1872: "Proposition 3.3.2,
   first part, lines 1097–1121; tikuisis-white-winter2017, Proposition 1.4, line 418"; line 1920;
   `Suggested.lean` lines 431 and 439.

   **Claim.** That proposition supports "a nonzero unital quasidiagonal algebra has a quasidiagonal
   trace" (§8.1) and "a separable algebra with a faithful quasidiagonal trace is quasidiagonal"
   (§8.3) as stated.

   **Witness.** tikuisis-white-winter2017 line 418: the proposition assumes `A` separable, unital and
   nuclear; lines 419–428 characterize quasidiagonality and quasidiagonal traces by maps into `Q_ω`;
   existence of a quasidiagonal trace is not among its statements. Line 431 is under the same nuclear
   hypothesis.

   **Repair.** §8.1 and the docstring at line 431: drop the Proposition 1.4 citation (brown2006,
   Proposition 3.3.2 carries it) and drop "8.1" from that source's `cited_for`. §8.3 and the docstring
   at line 439: write "tikuisis-white-winter2017, Proposition 1.4, line 431 (there for nuclear `A`),
   and Remark 1.5 (iii), line 461".

4. **F04** (P3) "the acceptance file" is not a defined term

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md` lines 78, 94, 138, 1336, 1575,
   1781, for example line 138: "`Mat` of the acceptance file".

   **Claim.** Every term is the literature's, Mathlib's, or defined where it first appears.

   **Witness.** The README never says what "the acceptance file" is and never names `Suggested.lean`
   (0 occurrences); roadmaps on main write "`Suggested.lean` defines …"
   (`TauCetiRoadmap/CStarAlgebras/README.md` lines 1281, 1591).

   **Repair.** Replace the six occurrences by "`Suggested.lean`" ("this roadmap's `Suggested.lean`"
   at lines 78 and 94).

5. **F05** (P3) Two malformed titles in the source manifest

   **Location.** `packages/AmenableTracesOnCStarAlgebras/sources.toml`, entries `connes1976` and
   `pedersen2018`.

   **Claim.** Each entry records the work's title.

   **Witness.** `connes1976`: the title ends "III λ , λ � 1", with a U+FFFD replacement character
   where "≠" stood. `pedersen2018`: the title field reads "G. K. Pedersen, C*-Algebras and Their
   Automorphism Groups, 2nd ed., 2018", repeating the author, edition and year.

   **Repair.** `connes1976` title: "Classification of injective factors. Cases II₁, II∞, III_λ,
   λ ≠ 1". `pedersen2018` title: "C*-Algebras and Their Automorphism Groups" (the edition goes in a
   `version_note`). Nothing else in either entry changes.

6. **F06** (P3) The locator "§3" of kirchberg1993 is contradicted by the readable source

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md` lines 1570–1571: "kirchberg1993,
   §3, uncertified, as the origin"; lines 2036–2038: "§3, amenable traces on exact algebras";
   `sources.toml`, entry `kirchberg1993` (`locator = "§3"`).

   **Claim.** Section 3 of the Inventiones paper is the origin of the exact case of §5.4 and treats
   amenable traces on exact algebras.

   **Witness.** brown2006 lines 1910–1913 place that paper's related results at its Theorem 7.5 and
   Proposition 7.1 (factorization property, exactness and invariant means); lines 804, 1283 and
   4745–4746 attribute amenable traces to Kirchberg's 1994 Math. Ann. paper. The text itself is
   paywalled.

   **Repair.** In §5.4, the References and the manifest, cite `kirchberg1993` as "Theorem 7.5 and
   Proposition 7.1 (as quoted in brown2006, lines 1910–1913)", described as "the group case relating
   local reflexivity of `C*(Γ)` and amenability", `locator_scheme = "theorem"`; delete "as the
   origin" and "amenable traces on exact algebras". The entry stays `uncertified`.

Six findings: one P2 (statable headline theorems absent from `Suggested.lean`) and five P3
(locators, vocabulary, manifest). No false statement, no vacuous statement, no unowned
prerequisite, no upward supply and no padding was found. `Suggested.lean` elaborates at the pins
with `sorry` as its only warning. No previous review of the package exists and no maintainer notes
were left; the plan declares no supplier gaps.

## Verified sound

**Elaboration.** `lake env lean` on `packages/AmenableTracesOnCStarAlgebras/Suggested.lean` from
the content checkout: exit 0; 18 warnings, all "declaration uses `sorry`", one per sorried theorem;
no other message. Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`, equal to the two commits the README names.

**Padding probe.** On a scratch copy every `sorry` was replaced by
`first | rfl | (simp; done) | infer_instance | trivial | tauto | fail`: 18 of 18 theorems are not
closed; no other error. The four instances and twenty definitions have real bodies; no sorried
data, no `set_option`, no `lemma`, no `#eval`/`#print`, no line over 100 characters. Imports are
`import Mathlib` and three `TauCeti.*` modules, each used (`IsKMSState`, `VonNeumannAlgebra.adjoin`,
`TauCeti.Amenable`).

**Signatures.** The 41 elaborated types were compared with the README statements. Four definitions
drop an order binder their bodies do not use (`IsFaithfulTrace`, `IsHypertrace`, `IsFoelnerTrace`:
`[StarOrderedRing A]`; `IsAF`: both order classes); no theorem loses a hypothesis. All 41 names
occur in the README and every backticked name the README attributes to the roadmap is declared.

**Headlines.** Stated: Connes–Kirchberg (hypertrace, extension, tensor forms), Følner (sufficiency
and equivalence), tracial von Neumann form, uniform amenability ⇔ injectivity, nuclear case, exact
case, the two face theorems (with convexity), commutative and AF algebras (finite-dimensional and
UHF are AF), the group theorem, quasidiagonal algebra ⇒ quasidiagonal trace, faithful quasidiagonal
trace ⇒ quasidiagonal, Rosenberg, subalgebras of simple unital AF algebras. Named not statable:
bimodule form, vector-trace clause, minimal tensor products (no C*-tensor product at either pin:
grep finds none). Absent: R01.

**Library declarations opened at the pins (file:line).** Mathlib:
`CompletelyPositiveMap` (`Analysis/CStarAlgebra/CompletelyPositiveMap.lean`:51, 133, 153),
`PositiveLinearMap.GNS`, `gnsNonUnitalStarAlgHom`, `gnsStarAlgHom`
(`GelfandNaimarkSegal.lean`:147, 196, 246), `PositiveContinuousLinearMap` (`Positive.lean`:31),
`tendsto_nhds_opNorm`, `ofReal_opNorm_eq_map_one` (`PositiveLinearFunctional.lean`:48, 74),
`exists_norm_apply_le` (`PositiveLinearMap.lean`:63), `StarSubalgebra.cstarAlgebra`,
`nonUnitalCStarAlgebra` (`Classes.lean`:50, 63), `Subtype.starOrderedRing` (`Range.lean`:285),
`StarSubalgebra.isClosed_topologicalClosure` (`Topology/Algebra/StarSubalgebra.lean`:83),
`Set.isClosed_centralizer` (`Topology/Algebra/Group/Basic.lean`:34),
`VonNeumannAlgebra.centralizer_centralizer` (`VonNeumannAlgebra/Basic.lean`:121),
`ContinuousLinearMap.instStarOrderedRing` (`InnerProductSpace/StarOrder.lean`:79),
`Unitization.instCStarAlgebra` (`CStarAlgebra/Unitization.lean`:182), `Unitization.starLift`
(`Algebra/Algebra/Unitization.lean`:805), `approximateUnit`, `increasingApproximateUnit`,
`IsIncreasingApproximateUnit` (`ApproximateUnit.lean`:215, 320, 143), `exists_sum_four_unitary`
(`Unitary/Span.lean`:87), `gelfandStarTransform` (`GelfandDuality.lean`:190),
`RealRMK.rieszMeasure` (`RieszMarkovKakutani/Real.lean`:66), `TensorProduct.mapL`
(`InnerProductSpace/TensorProduct.lean`:603), `lp.single` (`lpSpace.lean`:1007),
`Matrix.frobenius_norm_def` (`Analysis/Matrix/Normed.lean`:578), `Matrix.trace_mul_comm`
(`Matrix/Trace.lean`:156), `toPointwiseConvergenceCLM` (`PointwiseConvergenceCLM.lean`:155),
`geometric_hahn_banach_closed_point` (`Separation.lean`:230). Tau Ceti:
`CStarAction.trivial` (`Action/Basic.lean`:145), `Hom` (`Action/Hom.lean`:36), `IsKMSState`,
`isKMSState_zero_iff`, `IsKMSState.comp`, `comp_of_surjective`,
`isKMSState_comp_iff_of_surjective`, `IsKMSState.restrict` (`KMS/Basic.lean`:222, 237, 321, 330,
337, 349), `isKMSState_trivial_iff` (`KMS/Dense.lean`:144), `kmsStates`,
`closure_kmsStates_inter_subset`, `convex_kmsStates`, `isClosed_kmsStates`, `isCompact_kmsStates`,
`IsKMSState.of_tendsto` (`KMS/StateSpace.lean`:61, 106, 119, 138, 148, 51),
`eq_zero_of_apply_toPreGNS_one_eq_zero` (`KMS/Separating.lean`:114), the GNS module
(`CStarAlgebra/GNS.lean`:54, 62, 72, 86, 94, 99, 110), `VonNeumannAlgebra.adjoin`, `subset_adjoin`
(`VonNeumannAlgebra/Adjoin.lean`:38, 59), the density theorem (`Density.lean`:155),
`traceRadical`, `traceRadical_ne_top` (`TraceFunctional/Radical.lean`:45, 87), the Frobenius
inner product (`Analysis/Matrix/Frobenius.lean`:57, 106), trace duality
(`Matrix/Trace/Duality.lean`:31, 52), `Mean.IsLeftInvariant`, `Amenable`
(`Amenable/Basic.lean`:64, 130), `Amenable.of_lpTop` (`Linfty.lean`:159; its variables ask for a
Borel space and a left-invariant measure, no countability), `not_amenable_freeGroup`
(`FreeGroup.lean`:40, `[Nontrivial α]`). `isKMSState_zero_iff` reads `‖ω‖ = 1 ∧ ∀ a b,
ω(ab) = ω(ba)`: it includes positivity (through `→P`) and norm one, not faithfulness. The Lp left
translate is `x ↦ f(g⁻¹x)` (`MeasureTheory/Function/Lp/LeftTranslation.lean`:86–90), the README's
convention. No tracial-state predicate, normalized matrix trace, 2-norm, nuclearity,
quasidiagonality, AF predicate or injectivity predicate exists at either pin, and no closedness
instance for `VonNeumannAlgebra`.

**Cross-roadmap citations resolved.** CStarAlgebras (main): C2.1 (line 544), C2.8 (763; central
summand at 771), C4.1 (986; Kadison–Schwarz for unital 2-positive maps, unitization of c.p.
contractions, multiplicative domain), C4.2 (1021), C5.1 Check on `C*_r(F₂) ⊙ C*_r(F₂)` (1133),
C5.2 (1143; `M_n ⊗ A ≅ M_n(A)`, `C(X) ⊗ C(Y)`), C5.4 (1203; `c₀` ideal and `limsup` norm at
1210–1212), C6.1 (1272), C6.5 (1414; unitization, `C₀(X)`, limits of finite-dimensional algebras),
C7.1 (1455; faithful representation nuclear, independence, subalgebras, unitization variants),
C8.1 (1587), C8.2 (1617), C8.3 (1645; nonunital c.p.c. version; compressions Check at 1662; Toeplitz
at 1668), C9.1 (1711; cones quasidiagonal at 1720), C9.7 (Dugundji operator at 1924).
VonNeumannAlgebras (main): V13a (4635; contractive projection at 4658–4660), V13b.SpatialNorm
(4696), V13b hypertraces, Powers–Størmer, Følner criterion (4825–4840), commutant (4966), `L(F₂)`
(4775, 4787). OperatorAlgebraDynamics (main): D2 (1466; nuclear reduced products at 1549),
D2.FreeGroups (1781). FactorRigidity (main): §2.2 (217; `Q = ℂ` case at 231). BanachSpaceTheory
(main): B1 (54; weak/norm closure of convex sets and Mazur at 82–84). CStarClassification (open
roadmap, read at its head): §2.1 `IsAF` and the unitization criterion, §3.4 trace pairing, §3.5
UHF. The restated definitions agree verbatim with their owners' `Suggested.lean`:
`IsQuasidiagonalSet`, `IsQuasidiagonal` (CStarAlgebras lines 277, 286), `IsInjective`, the normality
predicate (VonNeumannAlgebras lines 684, 234), `generatedCStarAlgebra` (OperatorAlgebraDynamics
line 337), `IsAF` (CStarClassification line 83); `IsNuclearMap` is `IsNuclearContraction`
(CStarAlgebras line 251) on bare functions, which the map `a ↦ π_τ(a)` into `M_τ` needs. The
namespaces differ, so no fully qualified name is shared.

**Ownership and overlap.** `roadmaps grep` for amenable, quasidiagonal and uniform amenable traces
and hypertraces over main and the open heads: only VonNeumannAlgebras V13b (hypertraces of finite
von Neumann algebras on `B(L²M)`), Subfactors and FactorRigidity, all on the von Neumann side and
named in the README's scope. No roadmap owns the C*-algebraic classes. The overlap listing computed from the open heads: no
pull request changes this roadmap, no cited id is dropped, none is defined only by a revision.

**Dependency check.** Output: `depcheck: 229 roadmaps, 2060 edges, 0 problem(s)`. No UPWARD or
CYCLE line. FactorRigidity and CStarClassification are the only cited roadmaps placed near this one
in the order (234 and 231; this roadmap is 232); FactorRigidity is on main and §7.3 says no
statement depends on it.

**Sources: sampled locators (15 targets), all read at the cited lines.** brown2006: lines 361,
378–384, 403–406, 413, 429, 466, 486, 514, 530, 558, 589, 595, 613, 662, 759, 804, 807, 819,
841–850, 864–874, 897, 953, 973, 990, 993–1015, 1035, 1038–1048, 1078, 1097–1121, 1192, 1201,
1218, 1235–1261, 1250, 1269, 1274, 1283, 1291, 1306, 1312, 1317, 1338, 1423, 1426, 1452, 1469,
1515, 1539, 1541–1549, 1551–1566, 1575, 1577, 1608, 1613, 1707, 1925, 1952, 1969, 1971 each carry
the cited statement. tikuisis-white-winter2017: 53, 359, 362–364, 376, 456–458, 461 (418 and 431:
R03). schafhauser2020: 69–70, 75, 78–81, 82–84. The source's standing hypothesis (unital,
separable; brown2006 line 357) is dropped in §4.4, §5.2, §5.4 and §8.1; in each the README says so
and gives a finite-set route, checked below.

**Adversarial table (sampled targets, headlines, targets of findings).**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 tracial state, polarization, pullback | `x ↦ x₁₁` on `M_2`; corner `ℂ → M_2`; `c₀` | `ω(e₁₂e₂₁) = 1`, `ω(e₂₁e₁₂) = 0`; `‖tr_2 ∘ ι‖ = 1/2`; `δ_n → 0` weak-star | definition excludes each; norm-one clause needed |
| §1.5 `tr_k`, `‖·‖₂` | `e₁₁ ∈ M_k`; `e₁₂, e₂₁ ∈ M_2`; `c = diag(1,0)`; `k = 0` | `‖e₁₁‖₂ = k^{-1/2}`, `tr = 1/k`; `‖e₁₂e₂₁‖₂ = 2^{-1/2} = ‖e₁₂‖‖e₂₁‖₂`, `‖e₁₂‖₂‖e₂₁‖₂ = 1/2`; `‖x − cxc‖₂ = 2^{-1/2} ≤ 2^{1/2}`; `tr_0 = 0` | inequalities hold; Lean `matrixTrace` gives `0` at `k = 0` |
| §2.2 defect estimates | `φ(x) = x₁₁`, `(e₁₂, e₂₁)`; `φ = tr_n`; `C(𝕋)` compressions | LHS `1`, RHS `d₂(φ, e₂₁)^{1/2} = 1`; `d₂(tr_n, e₁₂) = 1/n`; `d₂(φ_n, z̄) = 1/n`, `d_∞ = 1` | sharp; one-term form follows from `φ(ab) − φ(a)φ(b) = T(a*)*T(b)` |
| §2.2 product rule | general | `T(ab) = T(a)φ(b) + (1−VV*)^{1/2}π(a)(1−VV*)^{1/2}T(b)` | holds with `‖V‖ ≤ 1` |
| §2.5 bitranspose | `c₀`, `δ_1`; `x ↦ x_1 + lim_U` | norm `2`, value `1` on tail indicators tending to `0` weak-star | weak-star continuity selects `φ**` |
| §3.2 unitization bound | `a + λ1` | `(tr φ̃ − τ̃)(a + λ1) = (tr φ − τ)(a)`, `‖a‖ ≤ 2‖a + λ1‖` | factor `2` correct |
| §3.1 normalization Check | `φ_m = τ(·)1_m/m` on `M_2` | `Tr_m φ_m(e₁₁) = 1/2`, defects `1/(2m)`, `1/(2m^{1/2})`, `tr_m φ_m(1) = 1/m` | normalized definition rejects it |
| §4.4 (a)–(g), three Lean forms | `M_n`; `ℂ ⊕ ℂ`, `pr₁`; zero algebra; `n = 0` | `Φ(T) = T₁₁`, `μ_τ = ac`, norm `1`; no state on `0`; `0 ≤ 0` | consistent; `hτ` excludes the zero algebra |
| §4.5 Følner, both theorems | `ℂ²` diagonal, `τ = (1/3, 2/3)`; `C(𝕋)` | rank one, `|ξ₁|² = 1/3`: `‖[e₁₁,P]‖²_HS = 4/9`; rank two: trace `1/2`; `‖[M_z,P_n]‖²_HS = 2` | general position needed for the converse only, as stated |
| §4.6 `isAmenableTrace_iff_isInjective` | `M_n`; `L(F₂)`; `H = 0` | identity projection, norm `1`; zero map, norm `0`, no state | holds; `‖P‖ ≤ 1` form matches V13a |
| §5.1 commuting-range lemma | `β = id_{M_2}`, `y_kl = e_lk` | `Σ e_kl e_lk = 2·1`, flip has norm `1` | commutation needed; lemma verified from `[β(e_kl)] = R*R` |
| §5.2 (i) ⇒ (iv) estimate | `x ∈ A**`, `a ∈ A`, `‖a‖ ≤ ‖x‖` | `d(x) ≤ 2d(a) + 2d(x−a)`, `d(x−a) ≤ τ**((x−a)*(x−a)) + 4‖x‖²‖tr∘φ − τ‖` | formula as written |
| §5.2 Check | interval averages, `f(t) = t` | defect `1/(12n²)`, `tr_n ∘ φ_n = τ` | correct |
| §5.4 exact TFAE | `C*_r(F₂)`; `C*(F₂)` | all four fail together; amenable but `L(F₂)` not injective | target `M_τ` and exactness both needed |
| §6.2 faces | `γ̃ = sτ̃₁ + (1−s)τ̃₂`; `C*_r(F₂) ⊕ ℂ` | `AT = {χ ∘ pr₂}` | holds; unitization is affine |
| §6.3 decomposition | `M_3 ⊆ M_4` | at `1_{M_3}`: `3/4 = (3/4)·1 + (1/4)·0`; at the unit: `1` | correct |
| §6.4 | `ℂ ⊕ ℂ`, `pr₁`; `C*(F₂)` | `σ(λ) = (λ, 0)`, `pr₁ ∘ σ = id` | splitting hypothesis needed |
| §7.1 | `C[0,1]`, `f(x) = x`; `M_2 ⊕ ℂ` | Riemann sum `(n+1)/(2n)`; `tr_4 ρ = (Tr x + 2λ)/4 = τ` | correct |
| §7.2 | `φ_n = ρ_n ∘ Φ_{B_n}`; `K(ℓ²)` | `‖tr∘φ_n − τ‖ ≤ ‖tr∘ρ_n − τ|_{B_n}‖` from `τ ∘ Φ = τ`; `T = ∅` | holds; unit needed for existence |
| §7.3 group TFAE | `ℤ`; `S₃`; trivial group; convention | `λ_g M_f λ_g* δ_x = f(g⁻¹x)δ_x`; `Tr(λ_g) = 6, 0`; `⟪δ_g, λ_g δ_e⟫ = 1`, value `0` at `1` | clause (iv) non-vacuous: `τ_Γ` exists (D2.FreeGroups) |
| §8.2 | `ℂ²`; block sums of late terms | `σ = diag(t, 1−t)` | route sound with tails norming |
| §8.4, §8.1 | `ℤ`, `F₂`, finite; degenerate faithful representation | `Pπ(1)P` near a nonzero projection | holds; Lean definition equals the supplier's |
| §8.5 `subalgebra_isAF_simple` | `B = 0`; `M_3 ⊆ M_4 ⊆ CAR`; `ℂ ⊕ ℂ` | `[Nontrivial A]` forces `B ≠ 0`; `c = 3/4`; `pr₁` not faithful | holds; simplicity needed |
| `IsQuasidiagonal.{u}` universe | separable `A`, any `u` | representation on a separable space lifts to every universe | conclusion of §8.3 is provable |
| R01 repairs | see R01 | see R01 | elaborate; not padding |

**Remarks needing no change.** The Check of §8.4 cites brown2006 lines 340–341, which support
"`C*_r(F₂)` is not quasidiagonal", the main clause of that sentence. The Downstream consumers
section names prospective "Part II" roadmaps with "can consume", as several roadmaps on main do.
The move of no notion from a later roadmap was needed.

## Not verifiable

- `connes1976`, `brown-ozawa2008`, `paulsen2002`, `pedersen2018`: waived in the manifest; cited as
  background by locator, texts not read.
- `kirchberg1993`: paywalled, recorded `uncertified`; its text was not read (R06 rests on what
  brown2006 says of it).
- The numbering of the published Memoir of brown2006 against arXiv v2: not compared; the README
  cites the arXiv numbering explicitly.
- Packages under review on other board branches (three, none in operator algebras) were not opened.

## Source issues

- **Misprint** in brown2006 at proof of Proposition 3.5.3, printed page 29: the source says the projections lie in the double commutant of the GNS image and writes the representation of the wrong trace; it should be the commutant, as in Lemma 3.5.2, and the representation of the combined trace; affects nothing.
- **Gap** in brown2006 at proof of Lemma 3.1.4, printed page 17: the source picks, for each eigenvector, as many orthonormal vectors of the same Hilbert space as its multiplicity numerator, without ensuring the space is large enough; it should tensor with an auxiliary space of dimension at least the common denominator; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6b8f660d1af7df5a72d67f146660d081944ee3dd", "job": "REV-PKG-AmenableTracesOnCStarAlgebras", "model": "fable", "worker": "chris-x10"} -->
