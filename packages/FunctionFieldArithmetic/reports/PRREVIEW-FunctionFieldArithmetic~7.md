# Review of FunctionFieldArithmetic (pull request #1474 at 8c93181)

**Verdict:** needs changes

This is a full review. Since d62f4a9 the folder changed by 328 lines, all in `README.md`; `Suggested.lean` and `metadata.toml` are unchanged. The three findings of the previous review are repaired (table under *Previous findings*).

On this head:
- the gate passes;
- the dependency check reports no problem;
- `Suggested.lean` elaborates with 13 `sorry` warnings and nothing else;
- the one-tactic probe closes none of the 13 theorems.

There are six new findings:
- **R01 (P2).** §5.8 restates a supplier's Frobenius count and its constant-field vanishing.
- **R02 (P2).** §5.8's headline bound can be stated at the pins, but the docstring says it cannot.
- **R03 (P3).** §2.1 attributes pinned repartition results to AlgebraicCurves only.
- **R04 (P3).** Two sampled locators do not support the statements they are cited for.
- **R05 (P3).** A §2.3 Check is false without the hypothesis `c ∉ A(D′)`.
- **R06 (P3).** Some quoted titles and layer labels do not match what they name.

## R01 (P2) — §5.8 restates ArithmeticGaloisRepresentations §5.13's Frobenius count and its constant-field vanishing

**Location.** `TauCetiRoadmap/FunctionFieldArithmetic/README.md`:
- lines 2293–2299: "Define `π_C(r)` to count the unramified places of `F` of degree `r ≥ 1` whose arithmetic Frobenius lies in `C`. Its API is: …";
- lines 2301–2302: "Prove frobeniusPlaceCount_constant_congruence: the count is zero unless the image of `C` in `Gal(k_M/k)` is `Frob_q^r`."

**Claim.** A supplier earlier in the merge order already states both the count and its vanishing outside the compatible degrees: ArithmeticGaloisRepresentations is at line 58 of the order, this roadmap at line 356. Each therefore has two owners.

The README also contradicts itself on what §5.8 adds:
- line 122 says it adds "an explicit error estimate with the same constant-field Frobenius congruence";
- line 2316 says "The additional target here is this numerical bound".

**Witness.** ArithmeticGaloisRepresentations README at its open head, §5.13, paragraph *Chebotarev for function fields* (lines 3884–3889). For a connected finite étale Galois cover with group `H`, exact constants `𝔽_{q^a}`, `H_geom = ker(H → Gal(𝔽_{q^a}/𝔽_q))` and a class `B` with image `b ∈ ℤ/a`, it says: "let `π_B(n)` count the degree-`n` closed points with `φ(Frob_x) ∈ B`. Prove `π_B(n) = 0` if `n ≢ b mod a`".

Take `Y → U` to be the normalization in `M` of the unramified locus `U`, with `H = G`, `a = h` and `H_geom = N`. Then `π_B(r)` is §5.8's `π_C(r)`, and the vanishing is frobeniusPlaceCount_constant_congruence.

**Repair.**
1. In §5.8, delete as targets the definition of `π_C(r)` with its three API bullets, and frobeniusPlaceCount_constant_congruence. Write instead: "`π_C(r)` is ArithmeticGaloisRepresentations §5.13's `π_B(n)` for the cover attached to `M/F` over its unramified locus (`H = G`, `a = h`, `H_geom = N`); that section also proves that it vanishes unless the image of `C` is `Frob_q^r`."
2. Keep degree_sensitive_chebotarev, in the compatible degrees, as the only target of §5.8. In its *Needs* (lines 2340–2341), change the existing entry "ArithmeticGaloisRepresentations §5.13, *Chebotarev for function fields* (comparison with its asymptotic)" to "(the count `π_B`, its constant-field vanishing, and comparison with its asymptotic)".
3. Line 122 then needs no change.

**Test.** Take the quadratic constant extension `M = F·𝔽_{q²}` (`h = 2`, `N = 1`) and `C = {1}` (`b = 0`). Then §5.13 gives `π_B(r) = 0` for every odd `r`. That is §5.8's own first Check ("odd degrees cannot have trivial Frobenius"), so the cited supplier reproduces the deleted target.

## R02 (P2) — The degree-sensitive Chebotarev bound of §5.8 is statable at the pins; the docstring's reason for omitting it is false

**Location.**
- `TauCetiRoadmap/FunctionFieldArithmetic/Suggested.lean`, lines 31–32: "quantitative Chebotarev (§5.8) needs the finite-cover Frobenius conjugacy classes."
- Lines 34–36: "The inducing-character obstruction and existence theorems (§7.1) need the curve Picard pullback and adelic unitary-character interfaces."
- README §5.8, lines 2303–2311: degree_sensitive_chebotarev.

**Claim.**
- **§5.8.** The docstring counts §5.8 among "the remaining headline theorems", and §5.8 is listed under *This roadmap owns*. The pinned Tau Ceti already has two things:
  - the decomposition group of a place of a Galois extension of function fields;
  - its action on the residue field, whose kernel is the inertia group.

  So the arithmetic Frobenius at an unramified place is a one-line predicate, and the bound elaborates. A headline that is statable at the pins but absent is a defect.
- **§7.1.** The same docstring says §7.1 needs "the curve Picard pullback", but that pullback is pinned. What §7.1 does lack at the pins is the idele class group of a function field: only the finite adeles of an affine chart are pinned, as `TauCeti.repartitionToFiniteAdeles`.

**Witness** (pinned Tau Ceti):
- `TauCeti.Place.residueAut` (`TauCeti/FieldTheory/FunctionField/Place/Extension/Inertia.lean:164`) is the map `P.integers.decompositionSubgroup F →* (P.ResidueField ≃ₐ[(P.restrict k F).ResidueField] P.ResidueField)`. Its kernel is `ValuationSubring.inertiaSubgroup` (`ker_residueAut`, line 182).
- `TauCeti.Place.restrict` and `TauCeti.Place.ramificationIdx` are in `Place/Extension/Basic.lean`, lines 322 and 337.
- `TauCeti.Divisor.conorm` and `TauCeti.Divisor.conorm_principal` are in `TauCeti/FieldTheory/FunctionField/Divisor/Conorm.lean`, lines 136 and 413.
- The following block, in a scratch file after `import Mathlib` and the three Tau Ceti modules `TauCeti.FieldTheory.FunctionField.Place.Extension.Inertia`, `….RiemannRoch.ClassNumber` and `….ConstantField`, elaborates with `sorry` as its only warning:

```lean
variable {k F M : Type*} [Field k] [Field F] [Field M] [Algebra k F] [Algebra k M]
  [Algebra F M] [IsScalarTower k F M] [FiniteDimensional F M] [IsGalois F M]

def IsArithFrobAtPlace (σ : M ≃ₐ[F] M) (P : Place k M) : Prop :=
  ∃ h : σ ∈ P.integers.decompositionSubgroup F,
    ∀ x : P.ResidueField,
      Place.residueAut F P ⟨σ, h⟩ x = x ^ Nat.card (P.restrict k F).ResidueField

noncomputable def frobeniusPlaceCount (C : ConjClasses (M ≃ₐ[F] M)) (r : ℕ) : ℕ :=
  Nat.card {v : Place k F // v.degree = r ∧ ∀ P : Place k M, P.restrict k F = v →
    P.ramificationIdx F = 1 ∧ ∃ σ ∈ C.carrier, IsArithFrobAtPlace σ P}

theorem degree_sensitive_chebotarev [Finite k] (hF : IsFunctionField k F)
    (hk : IsIntegrallyClosedIn k F) (hM : IsFunctionField k M)
    (C : ConjClasses (M ≃ₐ[F] M)) (r : ℕ) (hr : 0 < r)
    (hC : ∀ σ ∈ C.carrier, ∀ x ∈ algebraicClosure k M, σ x = x ^ (Nat.card k ^ r)) :
    |(r : ℝ) * frobeniusPlaceCount (k := k) C r -
        (Nat.card C.carrier / Nat.card {σ : M ≃ₐ[F] M //
          ∀ x ∈ algebraicClosure k M, σ x = x} : ℝ) * ((Nat.card k : ℝ) ^ r + 1)| ≤
      (2 * genus (algebraicClosure k M) M + r * (1 + 2 * genus k F)) *
          (Nat.card k : ℝ) ^ ((r : ℝ) / 2) + r +
        ∑ᶠ v ∈ {v : Place k F | ∃ P : Place k M, P.restrict k F = v ∧
          P.ramificationIdx F ≠ 1}, (v.degree : ℝ) := by
  sorry
```

**Repair.**
1. Add the predicate, the count and `degree_sensitive_chebotarev` above to `Suggested.lean`, with the import `TauCeti.FieldTheory.FunctionField.Place.Extension.Inertia`. Each gets a docstring. If R01 is applied, the count's docstring says it is ArithmeticGaloisRepresentations §5.13's `π_B` on the pinned carriers.
2. In README §5.8, name the three declarations in backticks.
3. In the module docstring:
   - delete the §5.8 clause;
   - in the §7.1 clause, replace "the curve Picard pullback" by "the idele class group of a function field (the divisor pullback is the pinned `TauCeti.Divisor.conorm`)".

**Test.**
- The block elaborates against the pins (`lake env lean` on the scratch copy: 7 s, one `sorry` warning).
- On `M = F = 𝔽_q(t)` with `C = {1}` and `r = 2`:
  - the count is `(q²−q)/2`;
  - the left side is `|q²−q−(q²+1)| = q+1`;
  - the right side is `(0 + 2·1)·q + 2 + 0 = 2q+2`.

  This matches the README's second Check (line 2350).

## R03 (P3) — §2.1 attributes pinned repartition results to AlgebraicCurves only

**Location.** README §2.1:
- lines 841–843: "naturally isomorphic to the repartition quotient `A_F ⧸ (A_F(D) + F)` of AlgebraicCurves Layer 4, hence of dimension `i(D) = ℓ(W − D)`";
- lines 851–855: "AlgebraicCurves Layer 5's completion comparison gives a map of repartitions into `𝔸_K` with dense image", and "the local count … of AlgebraicCurves Layer 4";
- *Needs* at lines 858–859.

**Claim.** These inputs are declarations of the pinned Tau Ceti. *From Tau Ceti* must name them with their files, as it already does for the expansion and point-topology declarations. The README names none of them.

**Witness** (pinned Tau Ceti, all in namespace `TauCeti`):
- `TauCeti.finrank_quotient_repartitionSpace` (`TauCeti/FieldTheory/FunctionField/Repartition/IndexOfSpecialty.lean:199`). Under `IsIntegrallyClosedIn k F`, the `k`-dimension of `repartitionSpace ⧸ (adeleFiltration D ⊔ diagonalRepartitions)` equals `Divisor.indexOfSpecialty D`.
- `TauCeti.adeleFiltration` and `TauCeti.diagonalRepartitions` (`Repartition/Basic.lean`, lines 178 and 308).
- `TauCeti.repartitionToFiniteAdeles` and `TauCeti.denseRange_repartitionToFiniteAdeles` (`Repartition/FiniteAdele.lean`, lines 53 and 178): repartitions to the finite adeles of an affine chart, with dense range.
- `TauCeti.adeleFiltrationQuotientEquiv` (`Repartition/Quotient.lean:193`): the one-place quotient of two filtration steps.

**Repair.**
1. Add the five declarations above to *From Tau Ceti*, with their files and the hypothesis `IsIntegrallyClosedIn k F`.
2. Cite them at lines 841–855 and in the *Needs* at line 858. AlgebraicCurves Layers 4–5 stay the planning owners.

**Test.** On `𝔽_q(t)` with `D = −2∞`, `finrank_quotient_repartitionSpace` gives `i(−2∞) = ℓ(0) = 1`. That is the value of §2.1's first Check (line 864).

## R04 (P3) — Two sampled locators do not support the statements they are cited for

**(a) §0.3.**
- **Location.** README lines 678–680: "(Milne, *Arithmetic Duality Theorems*, 2nd ed., Appendix A, proof of A.7, pp. 131–132, for the use of this comparison over finite fields.)"
- **Witness.** milne lines 4953–5021 (pp. 131–132). The proof takes the Galois cohomology of `0 → k^s× → K̄× → Div(X̄) → Pic(X̄) → 0` and of `0 → Jac(k^s) → Pic(X̄) → ℤ → 0`, in degrees 1 and 2, to compute `Br(K)`. Nothing there compares `Pic(X)` with `Pic_{X/k}(k) = Pic(X̄)^{G_k}`.
- **Repair.** Delete the parenthetical. The claim rests on SchemeAndStackFoundations §3.6 (main line 4905: `ofLineBundleClass` is injective with cokernel in `Br(k)`) together with `Br(k) = 0`, both already cited.
- **Test.** §3.6's check `picardSheafPoints_test_brauer` (cokernel `ℤ/2 = Br(ℝ)` for the real conic) is the README's own Check at line 690.

**(b) §5.7.**
- **Location.** README lines 2258–2260: "(Abdurrahman–Venkatesh, … §3.2, equations (3.1)–(3.2), p. 27, for this statement on a curve with torsion coefficients.)" "This statement" is `L(X, ρ, T) = det(1 − T·Fr | RΓ(X_k̄, j_*ρ))⁻¹`, for ramified `ρ` and finite rings `Λ`.
- **Witness.** abdurrahman_venkatesh:
  - line 1182: `V` is a finite-dimensional vector space over a coefficient field;
  - line 1193: (3.2) is stated only "in the everywhere unramified case";
  - lines 1189–1192: for ramified `ρ`, the text asserts only that `L` is rational.
- **Repair.** Change the parenthetical to "(Abdurrahman–Venkatesh, §3.2, p. 27: (3.1) for the definition, (3.2) for everywhere-unramified `ρ` over a coefficient field)". The ramified, finite-ring identity rests on Stacks Tag 03UZ alone.
- **Test.** The README's §5.7 Check over `Λ = 𝔽₃×𝔽₃` (ramified at `0`, coefficients not a field) is outside Abdurrahman–Venkatesh's setting. It is inside Stacks Theorem 64.20.1 (stacks lines 1138–1141: a finite ring of order prime to `p` and a constructible flat sheaf).

## R05 (P3) — A §2.3 Check is false without `c ∉ A(D′)`

**Location.** README lines 948–949: "For `|k| > 2`, the indicator of a coset `c + A(D′)` moved by multiplication by a constant `λ ∈ kˣ` is not in the span of the `kˣ`-invariant unshifted indicators."

**Claim.** For `c ∈ A(D′)` the coset is `A(D′)` itself, and so is `λ(c + A(D′))`. Its indicator is then an unshifted indicator, which lies in the span.

**Witness.** Take `c = 0` and any `D′`: then `1_{c+A(D′)} = 1_{A(D′)}`.

**Repair.** Reword the Check: "For `|k| > 2`, `c ∉ A(D′)` and `λ ∈ kˣ ∖ {1}`, `λ(c + A(D′)) = λc + A(D′) ≠ c + A(D′)`, because `(λ − 1)c ∉ A(D′)`. So `1_{c+A(D′)}` is not `kˣ`-invariant, while every unshifted indicator is, and it lies outside their span."

**Test.**
- On `𝔽₃(t)`, take `D′ = 0`, `c` the adele equal to `t⁻¹` at the place `t = 0` and `0` elsewhere, and `λ = 2`. Then `(λ − 1)c = c ∉ A(0)`, and the reworded Check holds.
- With `c = 0` the hypothesis fails, as it should.

## R06 (P3) — Some quoted titles and layer labels do not match what they name

1. **Italic titles that are not the cited headings.**
   - Location: README lines 125–127, 647 and 1986 (SchemeAndStackFoundations), and line 112 (ArithmeticGaloisRepresentations).
   - The titles as written: "§2.16 *Tsen's theorem*", "§3.3 *Vector bundles and duality on curves*", "§3.6 *Picard schemes and Picard torsors of a curve without a rational point*", "§5.11 *Weil bound via surfaces*" and "§3.7 *Artin–Schreier characters*".
   - Witness: the headings are:
     - SchemeAndStackFoundations on main, lines 3896, 4713, 4905 and 7273: "Tsen's theorem, `𝔾_m` on curves and proper hypercoverings", "Degrees of vector bundles, Riemann–Roch and Serre duality on curves", "Picard torsors of a curve without a rational point and rational divisor classes" and "The Weil bound via surfaces";
     - ArithmeticGaloisRepresentations at its head, line 3064: "Computations and Artin–Schreier characters".
   - Repair: quote these headings exactly, or drop the italics. The section numbers are correct.
2. **Layer list for the worked examples.**
   - Location: line 586: "The worked examples after Layer 7 use Layers 0, 3 and 5".
   - Witness: the examples are labelled "(Layers 0, 2, 5)", "(Layers 1, 5)", "(Layer 5.5)" and "(Layers 3, 5)" (lines 3388, 3395, 3404, 3411).
   - Repair: "use Layers 0, 1, 2, 3 and 5".
3. **Section comments in `Suggested.lean`.**
   - Location: lines 61, 167, 207 and 280.
   - Witness: the comments read "Layer 1: reduced bases of Riemann–Roch spaces", "Layer 4: equal-characteristic local class field theory", "Layer 5: zeta functions and `L`-polynomials" and "Layer 5.6: …". The README titles (lines 704, 1178, 1979) are "Riemann–Roch spaces over a polynomial subring", "equal-characteristic class field theory and ray geometry" and "zeta functions and `L`-polynomials of function fields", and 5.6 is a subsection, not a layer.
   - Repair: copy the README layer titles, and make 5.6 a `/-! ### 5.6 … -/` subsection comment.

## Previous findings

| Previous | Status at 8c93181 | Passage |
| --- | --- | --- |
| R01 (P2): §2.2 restated self-dual volume results owned by §§AL.0.3.1 and AL.0.6.1 | Repaired | Lines 877–881: "The local volume …, the annihilator …, the behaviour under `ω ↦ fω`, the comparison with the measure `μ_int` … and the quotient volume `μ_ω(𝔸_K/K) = 1` are those supplier statements. Prove selfDual_global_volumes". Line 57: "their volumes for the self-dual measure of … §AL.0.6.1". §2.3 *Needs* (line 939) adds §§AL.0.1.7–AL.0.1.8; §6.3 *Needs* (lines 2514–2518) was rewritten. All four AL headings exist at the #924 head (lines 370, 386, 484, 580); §AL.0.3.1 states `ν(ψ_b) = ν(ψ) + ord b`, `(P^m)^∨ = P^(−ν−m)` and `vol(O) = q^(−ν/2)` |
| R02 (P3): the expansion and point topology were cited only through roadmaps | Repaired | Lines 252–279 list `completionEquivLaurentSeriesOfSection`, `valuation_…`, `…ResidueField`, the integral forms, `instTopologicalSpaceWithConv`, `isTopologicalGroup`, `BialgHom.continuous_mapDomain`, `instLocallyCompactSpaceWithConv` and `tensorProductHomeomorph`. §4.5 (lines 1571–1597) and §6.1 (lines 2381–2388) use them. All are at the pin (table below); `AlgHom.convGroupOfSemiring` replaces the old name |
| R03 (P3): four consumers existed nowhere | Repaired | Lines 3426–3450 list ten roadmaps. Each is an open pull request (#1490, #1845, #1831, #1737, #1697, #1547, #1729, #1720, #1707, #1837), and each cites exactly the sections listed (the extraction is in *Cross-roadmap citations*) |

## Verified sound

### Gate, dependencies and scope

The head is `8c93181b8eb835db4c596017948e2fea8610186b`. The diff outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`).

Gate rerun:

```text
gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.
- Suppliers in the merge order (all before this roadmap's line 356): SmoothRepresentationsOfLocalGroups 25, AdelicAlgebraicGroups 52, GeometryOfNumbersAndQuadraticArithmetic 55, ArithmeticGaloisRepresentations 58, ArithmeticGaloisDuality 61, DeligneWeightsAndPurity 72, RelativeJacobiansAndIntegralCurveModels 73, AutomorphicLFunctionsAndLocalFactors 94, AutomorphicSpectralTheory 96, WeilConjectures 125, MetaplecticAutomorphicForms 150, LubinTateFormalModulesAndQuasiCanonicalLifts 345.
- Suppliers on main: AlgebraicCurves, ClassFieldTheory, SchemeAndStackFoundations, JacobianChallenge, ReductiveGroupsPartII, EtaleCohomologyFoundations, PadicMeasuresIwasawaAlgebras.

### Lean

- **Elaboration.** `lake env lean` on `Suggested.lean` gives 13 `sorry` warnings and nothing else, in 4 s.
- **Signatures.** I elaborated `#check @` for all 20 declarations in a scratch file and compared each type with its README statement. They match, and nothing changed from the previous round, because the file is unchanged:
  - `[Finite k]`, `hF` and `hk` are on every Layer 0 and Layer 5 theorem;
  - `[CharP F p]` is on every Witt declaration;
  - `ValuativeRel`, `TopologicalSpace` and `IsNonarchimedeanLocalField` are on both §4.2 `_all` theorems;
  - `2 * genus ≤ n + 1` encodes `n > 2g − 2`;
  - `n + 1 − g`, `2g − j`, `g − j` and `r − 1 − i` are never truncated under their hypotheses.
- **Padding probe.** Each `sorry` in a scratch copy was replaced by `first | (rfl; done) | (simp; done) | (simp_all; done) | (infer_instance; done) | (trivial; done) | (norm_num; done) | (decide; done) | (aesop; done) | sorry`. All 13 theorems still report `sorry`, so none is padding.
- **Headlines.** The Summary's end theorems are §§5.3, 4.2, 4.10, 6.4–6.5 and 7.6.
  - §5.3 is stated (`zeta_rationality`).
  - §4.2 is stated (`localAbelianExistence_all`, `injective_artinMap_all`, `localAbelianExistence_laurentSeries`).
  - §4.10 lacks torsors on curves, §§6.4–6.5 lack parabolic constant terms with adelic measures, and §7.6 lacks unitary Eisenstein series. A grep of the pins finds none of these; only `FiniteAdeleRing` of an affine chart and the elliptic `WeierstrassCurve.zetaFunction` exist.
  - The docstring is wrong only for §5.8 and, in part, §7.1 (R02).
- **Unused hypothesis (note, not a finding).** `hk` is not needed by `zeta_eulerProduct` or `zeta_logDeriv`. Both are formal identities that hold for `𝔽₄(t)` over `𝔽₂`. Layer 5's convention fixes exact constants, and every consumer uses them.

### Pinned declarations opened

| File:line (Tau Ceti unless noted) | Content and hypotheses |
| --- | --- |
| `FieldTheory/FunctionField/Place/Expansion/Laurent/CoefficientField.lean:94, 134, 166` | `completionEquivLaurentSeriesOfSection` (a section `s` lifting the residue map, a uniformizer `t`); `valuation_…` preserves `Valued.v`; `…ResidueField : ≃ₐ[k]` under `[Algebra.IsSeparable k P.ResidueField]` |
| `Place/Expansion/CoefficientField.lean:252, 317, 358`; `Place/Expansion/Completion.lean:49` | The integral forms; `mem_filtration_iff_le_order_…`; the rational-place `completionIntegersEquivPowerSeries` (`hP : P.degree = 1`) |
| `Topology/Algebra/PointTopology/Basic.lean:110`; `Group.lean:102, 120`; `Separation.lean:113`; `Functoriality.lean:145` | Induced topology; `isTopologicalGroup` `[IsTopologicalSemiring R]`; root `BialgHom.continuous_mapDomain`; locally compact for `[CommRing]`, `[T1Space R]`, `[LocallyCompactSpace R]`, `[Algebra.FiniteType k A]`; `tensorProductHomeomorph` on plain `→ₐ[k]` (the group isomorphism is §6.1's API target) |
| `Algebra/AlgebraicGroup/FunctorOfPoints.lean:119` | `AlgHom.convGroupOfSemiring` (root namespace), for a Hopf `H` over `R` and commutative `A` |
| `Place/Extension/Inertia.lean:164, 182`; `Extension/Basic.lean:322, 337`; `Divisor/Conorm.lean:136, 413` | R02 |
| `Repartition/IndexOfSpecialty.lean:199`; `Basic.lean:178, 308`; `FiniteAdele.lean:53, 178`; `Quotient.lean:193`; `RiemannRoch/Genus.lean:340` | R03 |
| `NumberTheory/ClassFieldTheory/LocalExistence/Existence.lean:159, 176`; `ArtinMap.lean:75, 113, 129`; `Correspondence.lean:68, 79, 138`; `AbelianLayer.lean:154`; `Local/ArtinMap.lean:132, 260`; `Local/Conductor/Basic.lean:89, 107, 113`; `Conductor/UpperNumbering.lean:64` | `[CharZero K]` exactly on `localAbelianExistence`, `injective_artinMap`, `profiniteCompletionArtinEquiv`, `localClassFieldCorrespondence`; every other cited name holds in every characteristic |
| `NumberTheory/LocalField/RamificationGroup.lean:99`; `Herbrand/Basic.lean:258, 421`; `Herbrand/UpperQuotient.lean:98`; `Herbrand/HasseArf/Abelian.lean:50`; `RingTheory/LaurentSeries/LocalField.lean:118` | Ramification and Hasse–Arf names; `isNonarchimedeanLocalField [Finite K]` |
| `RingTheory/FormalGroup/Hom.lean:137, 351`; `TopNilpotentPoint/Basic.lean:85`; `AlgebraicGeometry/Descent/AffineMorphism.lean:111, 405, 435`; `CategoryTheory/EffectiveEpi/Descent.lean:241` | `TauCeti.FormalGroupHom`, `TauCeti.FormalGroupIso`, `FormalGroup.TopNilpotentPoint`; descent with `[Flat p]` |
| Mathlib `RingTheory/LaurentSeries.lean:1033`; `RingTheory/Trace/Basic.lean:519` | `LaurentSeries.ratfuncAdicComplRingEquiv`; `Algebra.trace_surjective` `[FiniteDimensional] [Algebra.IsSeparable]` |

Duplication by object:
- The pins have no function-field zeta series, `L`-polynomial predicate, ASW operator, Lubin–Tate module, Schmid–Witt symbol or reduced basis.
- The pins have no function-field Chebotarev; the pinned hits for "Chebotarev" are in group theory and cyclotomic number fields.
- Tau Ceti's elliptic zeta (`AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Zeta.lean:153`) lives on `WeierstrassCurve`, a different carrier.

### Cross-roadmap citations resolved

| Citation | Where | Result |
| --- | --- | --- |
| AL.0.1.7, AL.0.1.8, AL.0.3.1, AL.0.6.1, AL.R.3, AL.3.4.1–2, AL.3.10.2–4, AL.3.14.1 | #924 head 19069a6 | Headings at lines 370, 386, 484, 580, 616, 1633, 1654, 1925, 1931, 1941, 2212. AL.0.1.8 is in the negative-kernel convention; AL.0.6.1 compares the self-dual measures with the integral ones and states the `ω ↦ aω` compatibility |
| ArithmeticGaloisRepresentations §§1.8, 2.5, 3.7, 5.13 | #856 head, lines 1227, 2082, 3064, 3829 (*Chebotarev for function fields* at 3884) | Exist; R01 and R06 |
| ArithmeticGaloisDuality §R02.3.2 | #858, lines 2075, 2077, 2246 | Exists, with both named paragraphs |
| DeligneWeights §§1.6, 1.9, 3.7; WeilConjectures WC.1, §§1.16, 5.20 | #929, lines 990, 1026, 1263; #1208, lines 237, 605, 1081 | Exist |
| RelativeJacobians §§1.3–1.5; SmoothReps SR.2.1–2.3, SR.4.1, SR.4.4 | #1232, lines 300, 331, 358; #1688, lines 1917, 2046, 2206, 3192, 3460 | Exist |
| AdelicAlgebraicGroups AA.0 (= its Layer 0), Layer 1; GeometryOfNumbers §§3.1–3.2 | #792, lines 634, 997; #851, lines 844, 880 | Exist |
| AutomorphicSpectralTheory §§1.11–1.13, 2.15–2.16, 4.11–4.17; Metaplectic §§2.5, 3.2a, 3.3, 3.3b | #925; #1063, lines 521, 607, 619, 647 | All headings exist |
| ReductiveGroupsPartII RG2.0, RG2.0a, RG2.3, RG2.3.7, RG2.4; SchemeAndStack §§1.1, 2.11, 2.16, 3.3, 3.6, 3.7, 5.11; EtaleCohomologyFoundations F.2.5, F.3, F.10.2, F.10.3; PadicMeasures §5.1; JacobianChallenge A–D; AlgebraicCurves Layers 0–12 | main | Exist (e.g. RG2.0 line 437 names `PointTopology.instTopologicalSpaceWithConv`, line 452). AlgebraicCurves Layer 9 includes local expansions (line 1136) |
| LubinTate §§0.1–0.2, 1.1–1.4, 2.1–2.5 | Board package | Layer 1 is over every DVR with finite residue field ("completeness … and the characteristic … play no role"); Layer 2 is for `K/ℚ_p`; FFA is a consumer (line 1854). The package has no pull request, so the description's dependency list cannot name it yet |
| Consumers | #1490 (§§0.3, 2.2, 5.1, 5.3, 5.8, 6.1–6.4); #1845 (§5.8, §§6.2–6.6); #1831 (§0.1, §2.1, §§4.1–4.2, 4.5, 4.8–4.10, §§2–4); #1737 (§§0.1–0.3, 2.1–2.3, 4.8–4.10, 5.8, 6.1–6.4); #1697 (Layers 0–5); #1547 (§§0.2–0.3, 5.1–5.4); #1729 (§§5.1, 5.3–5.6); #1720 (§§5.3–5.4); #1707 (§§5.1, 5.3, 5.6); #1837 (§5.8) | Each matches its README line; every cited id exists here |

`overlaps.md` lists no dropped id and no pull request that changes this roadmap.

Not raised as findings:
- Three consumers declare gaps on this roadmap:
  - #1845: `poincare-series-globalization` and `function-field-simple-trace-formula`;
  - #1831: `quadratic-root-residue-character`;
  - #1737: four gaps.

  The intake routes these to this roadmap's job.
- #1831's README says this roadmap's §§2–4 "own completions, adeles, ideles". That is #1831's citation to correct, since this README gives them to AL §AL.0.6.1 and ArithmeticGaloisDuality §R02.3.2.

**Ownership against the closest open roadmaps.**
- ClassFieldTheory on main does not own unit-filtration reciprocity. Its open revisions #1215 (line 182) and #1411 (line 147) leave `p`-primary existence, local Kronecker–Weber and Lubin–Tate theory to this roadmap. This README derives unit-filtration reciprocity without stating it as a target, which is consistent with both.
- PhiGamma §0.4 (an ASW equivalence of local systems over perfect rings) is a different object from §3.1's character duality over arbitrary fields.
- The one double ownership found is R01.

### Seeded sample (15 targets)

| Target | Locator checked | Outcome |
| --- | --- | --- |
| 0.3 | milne lines 4947–5021 (A.7 and proof, pp. 131–132) | Does not contain the comparison; R04(a). SchemeAndStack §3.6 (main line 4905) does |
| 2.3 | parshin lines 290–299 (p. 7, (6), footnote 4); 363–382 (p. 9); 415–420 (p. 10, (9)–(10)) | (10) is `FδA(D) = q^(1−g+deg D) δA((ω)−D)`, the README formula; the three source corrections hold |
| 3.2 | kw lines 722–736 (Prop. 4.3, p. 15); 1169–1177 (Lemma 4.13, p. 22) | Match: `c ∈ W(𝔽_p)`, `c_i → 0`, parts (i)–(iii); `n_c`, `n₀` and the unramified/totally ramified split |
| 3.3 | kw lines 280–319 (Thm 3.2, pp. 6–7); 722–736 | Match. "pp. 6–8" and "pp. 15–16" are each one page wider than needed |
| 4.2 | yoshida lines 47–64 (Thm A, pp. 411–412); 430 (Def. 4.10, p. 422); 572 (Prop. 5.10, p. 425); 637–669 (Thm 5.15, Cor. 5.16, p. 427); 686–688 (§5.3(iv), p. 428); 854, 905 (Thms 6.11, 6.15, pp. 432–433) | Match. Yoshida's `Frob_K = φ⁻¹` (line 147) confirms the inversion the README states; Theorem A gives the image `W^ab_K` in every characteristic |
| 4.3 | kw lines 670–696 (§4.1, Remark 4.1, p. 14); 703–719 (Prop. 4.2, p. 15); 739–755 (Prop. 4.4, pp. 15–16); 837–846 (`R`, p. 17); 886–903 (Thm 4.7, p. 18) | Match. The README's choice of the profinite topology on `K̂ˣ` corrects KW (*Source issues*) |
| 4.5 | milne lines 5072–5111 (A.10–A.11, pp. 134–135); kw lines 1184–1228; conrad_geom lines 41–117 (§2); kw 703–755; yoshida line 922 (App. I §7, p. 434) | Match |
| 4.7 | guignard lines 794–806 (Props 4.11–4.12, pp. 1319–1320), 830–864 (Prop. 4.14, pp. 1320–1321); russell lines 1654–1683 (§3.3, Thm 3.24, p. 34) | Match: `d ≥ N + 2g − 1`, a torsor under `E = f_*(L_u ⊗ I)` of rank `d − N − g + 1`. Russell works over an algebraically closed field; the README takes only the principal-congruence form from him |
| 5.7 | stacks lines 1136–1154 (Thm 64.20.1, Tag 03UZ, Remark 20.3); abdurrahman_venkatesh lines 1178–1197 (p. 27) | Stacks matches: finite ring of order prime to `p`, constructible flat sheaf, geometric Frobenius, proof deferred to Deligne. Abdurrahman–Venkatesh is narrower; R04(b) |
| 5.8 | kosters lines 47–85 (Thm 1.1, Cor. 1.2, p. 2); 92–166 (Lemmas 1.3–1.4 and proofs, pp. 3–4); 172–175 (p. 5) | Match, including the README's correction of Cor. 1.2's summation range. The degree-`r` deduction checks out (table) |
| 6.5 | ciubotaru_harris lines 370–396 (§3, Prop. 3.1, p. 8), 412–413 (Lemma 3.2, p. 9); bhkt lines 1593–1599 (Prop. 8.2, p. 35); morris1 lines 529–547 (§§5.3–5.4, p. 104) | Match: a Noetherian `ℤ[1/p]`-algebra embedded in `C`; semisimple `G` in the sources; the reductive form rests on Morris §5.3 "compact support modulo `Z(A)G(F)`" |
| 7.1 | fyz lines 371–393 (§2.1, Remark 2.1, pp. 8–9) | Match. FYZ's odd-`n` claim fails: recomputed in the table |
| 7.2 | morris1 lines 1058–1060 (Godement lemma, p. 118), 1082–1100 (p. 119), 1612–1623 (§4.8 Thm, p. 134), 2498–2520 (§5, p. 160); morris2 lines 1300–1306 (§5.5 Thm, p. 1145), 2022–2024 (§6.6 Lemma, p. 1164); fyz lines 371–382 | Match |
| 7.4 | fyz lines 453–479 (§2.3: char ≠ 2, residue char 2 allowed), 481–545 (Def. 2.2, Thm 2.3, pp. 10–11), 582–597 (Remarks 2.4–2.6, p. 12); li_zhang line 688 (Thm 3.5.1, p. 17) | Match. The README restricts the FYZ citation to characteristic other than two, as FYZ does |
| 7.6 | fyz lines 426–442 ((2.2)–(2.3), p. 9), 651–710 (§2.6, (2.9)–(2.15), Thm 2.8, pp. 14–15) | (2.12) at line 678 is the README formula; `|ω_X|^(−n²/2) = q^(−n²(g−1))` is §7.3's prefactor |

### Adversarial table (values computed this round)

| Statement | Instances | Values computed (both sides) / wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_divisor_degree_eq_one` | `𝔽₂(t)`; `𝔽₄(t)` over `𝔽₂`; real conic | `deg ∞ = 1`. Without exact constants all degrees are even (image `2ℤ`), so `hk` is needed. On the conic `Pic = 2ℤ`, so `[Finite k]` is needed | Pass | None |
| `riemannRoch_reducedBasis` | `y² = x³+x+1/𝔽₅`, `D = 0`; `𝔽_p(t)`, `x = t^p` | `d = (0,−2)`: `r=1` gives `{1,x}`, dim 2 = `ℓ(2O)`; `r=2` gives `{1,x,x²,y}`, dim 4 = `ℓ(4O)`. `x = t^p`: `r=1` gives `1,…,t^p`, dim `p+1 = ℓ(p∞)` | Pass | None |
| 0.3 comparison | `ℙ¹`; real conic; `E/𝔽₅` | `Pic⁰ = 0`, `h = 1`; cokernel `ℤ/2 = Br(ℝ)`; `h = #E(𝔽₅) = 9 = L(1)` | Pass | R04(a) |
| 2.1 lattices / `i(D)` | `𝔽_q(t)`, `D = −∞, −2∞`; degree-2 place | `i(−∞) = 0`; `i(−2∞) = ℓ(0) = 1` (= pinned `finrank_quotient_repartitionSpace`); `[A([v]):A(0)] = q²` | Pass | R03 |
| 2.2 `μ_ω(A(D))` | `𝔽_q(t)`, `dt`; `D = 0, −2∞, [v]`; `t·dt` | `q`; `q⁻¹` (`ℓ−i = 0−1`); `q^(3−g)`; `n₀: 0→1`, `n_∞: −2→−3`, factors `q^(∓1/2)`, product unchanged; `μ(A(D))·μ(A((ω)−D)) = 1` | Pass | None |
| 2.3 transforms | `D = 0`; double transform; translate; Check with `c = 0` | `q·1_{A(−2∞)}`; `q^(deg D+1−g)·q^(g−1−deg D) = 1`; AL.0.1.8's `ψ(−L(a,w))` for the negative kernel gives `ψ_ω(cb)` for the positive kernel. With `c ∈ A(D′)` the coset indicator is unshifted, so the Check as written fails | Fail (Check) | R05 |
| `witt_additiveHilbert90` | `n = 0`; `𝔽₄/𝔽₂`, `n = 1`; `p = 2`, `n = 2`, `y²+y = t` | All groups trivial. `ker(1−σ) = 𝔽₂`; `{a+a²} = {0,1} = ker Tr`; `Tr` onto. Witt trace of `(y,0)` is `(1,t)`; coordinatewise addition gives `(1,0)` | Pass | None |
| ASW duality (both lengths) | `𝔽₃`, class 1; `n = 0` | Arithmetic Frobenius maps to `1`; geometric to `−1`, i.e. `2 mod 3` and `8 mod 9`; `ZMod 1` and `Q_0` are trivial | Pass | None |
| 3.2 reduced forms | `[T^(−p)]`; `[1+T]` over `𝔽_{p^p}` | `[T^(−p)] ≡ [T^(−1)]` (`a^(1/p)`); `[1+T] − [1]` has positive-valuation coordinates, so `c = p/Tr(β) ∈ pℤ_p` | Pass | None |
| 3.3 one-pole | `y³−y = t⁻²/𝔽₃`; `m = p` | Different `(p−1)(m+1) = 6`; `2g−2 = −6+6 = 0`; `N₁ = 1+0+3 = 4`; `L = 1+3T²`; `N₂ = 9+1+6 = 16`; `t^(−p) ≡ t^(−1)` | Pass | None |
| `localAbelianExistence_all` / 4.3 symbol | `𝔽₂((T))`, `H = ⟨𝔽₂ˣ, T, 1+T²O⟩`; `H = Kˣ` | Index 2 = degree of `y²+y = T⁻¹`. KW Thm 4.7: `[T⁻¹, 1−aT) = −a`, `[T⁻¹, T) = 0`, so the kernel is exactly `H`. `H = Kˣ` gives the layer `⊤`, index 1. `U¹/(U¹)^p` is infinite, so non-open index-`p` kernels exist and `hH` excludes them | Pass | None |
| `injective_artinMap_all` | `𝔽_p((T))`, `1+T` | `1+T` lies in every prime-to-`p` subgroup; `[T⁻¹, 1+T) = Res(T⁻¹(1−T+…)dT) = 1 ≠ 0` | Pass | None |
| `localAbelianExistence_laurentSeries` | `H = Kˣ` | `L = ⊥`, finrank 1 = index 1, norm image = all units | Pass | None |
| 4.1 LT ramification | `Q=3, m=2`; `Q=2, m=2` | Lower orders 6,3,3,1; `φ(2) = (3+3)/6 = 1`, `φ(8) = 1+6/6 = 2`, so upper orders 6,3,1. `Q = 2`: 2,2,1 in both numberings | Pass | None |
| 4.4 conductors | `x = β+p[T^(−m)]`, `m > p`; `p[T⁻¹]`; `𝔽₃`, `[T⁻²]` | Clamped bound `1` against unclamped `≤ 1−1 = 0`; `n₀ = 1`, `G¹ = G`, length-two exponent `1+1 = 2`; `u₁ = 3`, `u₂ = 7`, `3[T⁻²]` gives `3` | Pass | None |
| 4.5 ray groups / expansion | `𝔽_q(t)`: `m = 0, [0]+[∞], 2[0]`; place `t²+1` of `𝔽₃(t)` | Orders 1, `q−1`, `q`; `(O/𝔭²)ˣ/𝔽_qˣ ≅ (𝔽_q,+)`. Pinned `completionEquivLaurentSeriesResidueField` gives `F_v ≃ₐ[𝔽₃] 𝔽₉((T))` | Pass | None |
| 4.7 Abel bundle / Rosenlicht | `ℙ¹`, `m = 2[∞]`; `[0]+[∞]`; elliptic `m = [P]` | Fibre dim `n−2+1`: 0 at `n=1`, 1 at `n=2`. `(t−c)/t = 1−cT`; sums of roots agree when `f ≡ 1 mod T²`. `(t−1)/t ≡ 1 mod T` but `u([1]−[0]) = 1`, so modulus `[∞]` fails. `(t−c)/(t−1)` rigidifies to `(c,1)`; `2g+N−1 = 2` | Pass | None |
| 4.9 Lang Frobenius | `𝔽₅`, `z⁴ = t`, `t = 2`; `𝔽₃`, `m = 2[∞]`, `a = [1]`, place `t²+1` | `z⁵ = 2z`: arithmetic ×2, geometric ×3. `Tr_{𝔽₉/𝔽₃}(i−1) = −2 = 1`; using `a` in place of `2a` gives `2` | Pass | None |
| 4.10 classification (headline) | `B = ℤ/4`, `θ = 2·deg`; `ℙ¹`, `m = 0`, `r > 1` | `[B : im θ] = 2` components, each constant quadratic; norm group `deg⁻¹(rℤ)` | Pass | None |
| `zeta_eulerProduct` | `ℙ¹/𝔽₂`, `T²` | `A₂ = 7`; product: `C(3+1,2) = 6` multisets of the 3 rational places, `+1` for the degree-2 place, total 7 | Pass | None |
| `zeta_logDeriv` | `ℙ¹/𝔽₂`, `r = 2` | `2·7 = 14`; `N₁A₁ + N₂A₀ = 3·3 + 5·1 = 14` | Pass | Note (`hk` unused) |
| `effectiveDivisorCount_of_large` | `ℙ¹/𝔽₃`, `n=2`; `E/𝔽₅`, `n=1`; `g=1`, `n=0` | `2·13 = 26 = 3³−1`; `4A₁ = 9·4`, so `A₁ = 9 = N₁`; at `n = 0`, `hn` (`2 ≤ 1`) fails, and there `A₀ = 1 ≠ 0` | Pass | None |
| `zeta_rationality` (headline) | `E/𝔽₅`; genus 0 | `Z(1−T)(1−5T) = 1+3T+5T²`: `a₀=1`, deg 2, lead `5 = q^g`, `a₂ = 5a₀`, `a₁ = 9−6`, `P(1) = 9 = h`. `g = 0`: `P = 1`, `a₁ = 0 = N₁−(q+1)` | Pass | None |
| `isLPolynomialData_iff_eq_lPolynomial` | `q=5, g=1, N₁=9`; `q = 0, 1` | Accepts `1+3T+5T²`; rejects `1+2T+5T²` (`a₁ = 3`) and `1+3T+T²` (`a₂ = 5`). Junk `q` gives `1+8T` and `1+7T+T²`, excluded by `q = #k` | Pass | None |
| 5.5 constant extension | `E/𝔽₂₅`; `𝔽_q(t)` | `α+β = −3`, `αβ = 5`, `α²+β² = −1`, so `N₂ = 27`, `L = 1+T+25T²`; `∏_ζ Z(ζT) = 1/((1−T^r)(1−q^rT^r))` | Pass | None |
| 5.7 finite coefficients | `Λ = 𝔽₃×𝔽₃`, `y² = t/𝔽₅`; `ℓ`-dimensional identity; `[ℤ/4 →² ℤ/4]` | `V^{I₀} = 0×𝔽₃`, `P₀ = (1, 1−T)`; zero traces but `(1−T)^ℓ = 1−T^ℓ`; series `(1−T)/(1−T) = 1` | Pass | R04(b) |
| 5.8 Chebotarev (R01, R02) | `M = F = 𝔽_q(t)`, `r = 1, 2`; constant extension `h = 2`, `C = {1}` | `r=1`: count `q+1`, error 0. `r=2`: `|q²−q−(q²+1)| = q+1 ≤ 2q+2`. `π(r) = 0` for odd `r`, exactly AGR §5.13's `n ≢ b mod a`. Deduction: `|C| ≤ |N|`; smaller degrees `≤ r((1+2g_X)q^(r/2)+1)`; ramified `≤ R` | Pass (math) | R01, R02 |
| 6.3 weights | Heisenberg, `p` | `g_y⁻¹Γg_y = {(x,0,xy)}`; stabilizers `p` (`y=0`) and 1 (`y≠0`); probabilities `1/p²` and `1/p` | Pass | None |
| 6.4–6.5 Harder (headline) | `GL₂` Borel; `𝔾_m`, `E/𝔽₅`; `ℤ[1/3] → 𝔽₂` | `⟨α, H₀(diag(π^a,1))⟩ = log_q q^(−a) = −a`. With `deg Ξ = 1`, rank `h = 9`; without `Ξ`, infinite. The kernel of `2x = 0` goes from 0 to `𝔽₂` (not flat) | Pass | None |
| 6.5 integral model | `ℤ[1/p] ⊂ ℂ` | Flat (`R → Frac R → ℂ`); characteristic polynomials over `ℚ`, so eigenvalues are algebraic | Pass | None |
| 6.6 Satake | `GL₂`, `h = 1_{U diag(π,1) U}` | `S*h(diag(π,1)) = vol(π⁻¹O) = q`, `S*h(diag(1,π)) = 1`, so `qX₁ + X₂`; `δ^(1/2)` gives `q^(1/2)(X₁+X₂)`; on `δ^(−1/2)` the eigenvalue is `q+1` | Pass | None |
| 6.7 Yu | `n=2`, `g=2` | Valuation degree of `det t` is `−(n(n−1)/2)(2g−2) = −2`, so Yu degree `+2`; scalar `a^(−1)` gives `+2−2 = 0` | Pass | None |
| 7.1 obstruction | `E/𝔽₃: y² = x³+2x²+2x` | `x = 1, 2` give `y² = 2` (non-square), so `#E(𝔽₃) = 2`. The 2-isogeny maps `E → E` (`a′ = −4 ≡ 2`, `b′ = a²−4b ≡ 2`). `ν⁻¹(P) = {x²+2x+2 = 0}` (discriminant `2`, non-square), so inert; `div(y/x) = [Q]−[P]−[O]`; `η(P−O) = −1` | Pass | R02 (docstring) |
| 7.2 continuation | split `H₁ = GL₂` | Parameter group `μ₂` (`z^(2d) = 1`); `m(π,1)` gives `q^(−s−1/2)`; Borel has 2 Weyl terms | Pass | None |
| 7.3 measure ratio | `n` diagonal and `n(n−1)/2` off-diagonal coordinates | `q^(n(g−1)) · q^(2(g−1)·n(n−1)/2) = q^(n²(g−1))`. Constant cover: `(q²)^g/q² = q^(2(g−1))`; split: `(q^(g−1))²` | Pass | None |
| 7.4 densities | split `(O, π^rO)`, `r = 1, 2`; inert `r = 1, 2`; `𝔽₄²` linking form | `L′ = (π^(−a)O, π^bO)`, `0 ≤ a ≤ b ≤ r`, exponent `r−(b−a)`. `r=1`: `2T+(1−T) = 1+T`; `r=2`: `3T²+2T(1−T)+(1−T) = 1+T+T²`. Inert: `1−T`; `(1−T)+T²`. 9 isotropic vectors give 3 lines: `(1−T)(1+2T)+3T² = 1+T+T²` | Pass | None |
| 7.5 Whittaker = density | `n = m = 1`, `q = 3` | Split: `2·3^(N−1)/3^N = 2/3 = 1−3⁻¹`; inert: `4/3 = 1+3⁻¹` = `L_{1,v}(0)⁻¹` | Pass | None |
| 7.6 FYZ (headline) | `n = 1`, `ℙ¹`, split, self-dual | Exponent `−deg𝓔(s−½) − ½·1·(−2) = −deg𝓔(s−½)+1`; `L₁(s)⁻¹ = ∏(1−q_v^(−1−2s))`; `Den = 1`; equals fyz line 678 | Pass | None |

## Not verifiable

- **sga4half** (Théorème 2.2, cited inside §5.7, which is sampled). The text is recorded as uncertified and is not readable here. Stacks Theorem 64.20.1, which states the same identity, stands in for it.
- **hess**, **roquette**, **rosen**, **goss** and **stichtenoth**: settled (uncertified or waived) and not in this sample.
- **yu** (§6.7) was not re-read this round; the two Yu corrections recorded last round are not repeated below.
- No source was fetched, and no missing-reference request was made.

## Source issues

- **Misprint** in kosters at Corollary 1.2, p. 2 (kosters line 84): the source sums the Frobenius weights over all places of `K`; it should sum over the rational places only, as the proof (line 174) shows; affects nothing.
- **Error** in kw at §4.1, p. 14 (kw lines 674–686): the source gives `K̂*` its `p`-adic topology and calls the induced map onto the compact group `G_p` a homeomorphism; it should use the inverse limit of valuation-topology quotients, which is compact; affects nothing.
- **Error** in kw at Proposition 4.14, p. 22 (kw line 1186): the source calls the solution pairing an isomorphism `Gal(K(℘⁻¹x)/K) → Hom(⟨x⟩, W(𝔽_p))` for every `x`; for `n₀ > 0` its image is `p^{n₀}Hom`, and `x` should first be replaced by the primitive `x/p^{n₀}`; affects nothing.
- **Misprint** in fyz at §2.4, p. 11, and Remark 2.5, p. 12 (fyz lines 505, 594–595): the source writes `L₂^∨/L₁` and `L₁ ⊂ L′₁ ⊂ L′₂^∨ ⊂ L₂^∨`, against its definition `L₁^∨ ⊂ L₁ ⊗ F`; it should read `L₁^∨/L₁` and `L₁ ⊂ L′₁ ⊂ L′₁^∨ ⊂ L₁^∨`; affects nothing.
- **Gap** in kw at Theorem 4.12, p. 21, and Proposition 4.14, p. 23 (kw lines 1136–1138, 1191): the source uses `⌈log_p(r/i)⌉` without clamping at zero; it should use `max(0, ⌈log_p(r/i)⌉)`; affects a stated result.
- **Misprint** in kw at Theorem 3.2, proof of (i), p. 7 (kw line 297): the source invokes "Theorem 3.1" for Hilbert 90; it should be Proposition 3.1; affects nothing.
- **Misprint** in kw at Theorem 3.2, proof of (i), p. 7 (kw line 299): the source writes `F(α+1)−α+1`; since `σα = α−1` it should be `F(α−1)−(α−1)`; affects nothing.
- **Misprint** in parshin at §2.2, p. 9 (parshin lines 367–375): the source writes the adelic pairing as a sum of circle values; it should be their product, the character of the summed traced residues; affects nothing.
- **Error** in parshin at §2.2, p. 9 (parshin line 375): the source takes the additive character of `𝔽_q` to be injective; it should be a nontrivial character, which cannot be injective when `q` is not prime; affects nothing.
- **Error** in parshin at §2.1, p. 7, footnote 4, and p. 10 (parshin lines 298–299, 439–441): the source says the lattice indicators alone span the Bruhat–Schwartz space; it should say that indicators of translates span it; affects the proof.
- **Error** in fyz at Remark 2.1, pp. 8–9 (fyz lines 383–393): the source asserts that odd `n` is unobstructed by cup-product alternation; it should allow a nontrivial obstruction, as on `y² = x³+2x²+2x` over `𝔽₃`; affects a stated result.
- **Error** in fyz at (2.1), p. 9 (fyz line 422): the source states the Levi covariance for every adelic `α`; it should be stated for rational `α` globally, and locally as (2.3); affects nothing.
