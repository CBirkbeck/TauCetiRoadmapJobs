# Review of OperatorAlgebraDynamics (pull request #1137 at f8ae283)

**Verdict:** needs changes

This is a full review of the folder at f8ae283. That is the head the previous review read, and the folder is unchanged since then. There are seven findings: three P2 and four P3.

- **R01–R03 (P2):** three headline theorems can be stated at the pins, but `Suggested.lean` leaves them out. The module docstring calls two of them not statable and does not name the third. Each repair below was elaborated in a scratch copy of the file.
- **R04 (P3):** the branch still deletes six files of other roadmaps, so the gate fails.
- **R05–R07 (P3):** a Lean declaration that tests nothing about the twist, crossed *Needs:* lines in two D2 subsections, and Mathlib names cited without their namespace.

## R01 (P2) — Mackey's theorem is statable at the pins, but the docstring says it is not

**Location.** `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` lines 62–65 list Mackey's theorem as not statable, because there is "no class of analytic Borel spaces (Mathlib has `StandardBorelSpace`, which is narrower, and `MeasureTheory.AnalyticSet` for subsets of a topological space)". README lines 1246–1250 make the theorem a D1.BorelPrefix target.

**Claim.** The missing "class" is one predicate with a real body on native carriers. It transcribes Williams Definition D.19 (p. 375) with Mathlib's `PolishSpace`, `MeasureTheory.AnalyticSet` and `MeasurableEquiv`. With that predicate the theorem elaborates at the pins, so it is a statable headline that is absent.

**Witness.**
- I added the two declarations below to a scratch copy of `Suggested.lean`, after the D1.BorelPrefix section. It elaborates with exit 0 and 16 `declaration uses sorry` warnings: the original 15 plus this one.
- A second scratch file proves the predicate, with no `sorry`, for every `StandardBorelSpace` (take `X = G` with `upgradeStandardBorel`, `s = univ`, `isClosed_univ.analyticSet`). So the hypothesis is not vacuous.

**Repair.** Add the following to the D1.BorelPrefix section. `universe u` and `open MeasureTheory` are already in the file.

```lean
/-- An analytic Borel space: Borel isomorphic to an analytic subset of a Polish space with its
relative Borel structure (Williams, Definition D.19, p. 375). -/
def IsAnalyticBorelSpace (G : Type u) [MeasurableSpace G] : Prop :=
  ∃ (X : Type u) (_ : TopologicalSpace X) (_ : PolishSpace X) (s : Set X),
    MeasureTheory.AnalyticSet s ∧
      Nonempty (@MeasurableEquiv G s _ (@Subtype.instMeasurableSpace X (· ∈ s) (borel X)))

/-- Mackey's theorem (Williams, Theorem D.23, p. 376). -/
theorem exists_unique_lcsc_group_topology {G : Type u} [Group G] [MeasurableSpace G]
    [MeasurableMul₂ G] [MeasurableInv G] (hG : IsAnalyticBorelSpace G) (μ : Measure G)
    [SigmaFinite μ] [μ.IsMulLeftInvariant] (hμ : μ ≠ 0) :
    ∃ τ : TopologicalSpace G, (@IsTopologicalGroup G τ _ ∧ @LocallyCompactSpace G τ ∧
        @SecondCountableTopology G τ ∧ @T2Space G τ ∧ @borel G τ = ‹MeasurableSpace G›) ∧
      @Measure.IsHaarMeasure G _ τ _ μ ∧
      ∀ τ' : TopologicalSpace G, @IsTopologicalGroup G τ' _ → @LocallyCompactSpace G τ' →
        @SecondCountableTopology G τ' → @T2Space G τ' → @borel G τ' = ‹MeasurableSpace G› →
          τ' = τ := by
  sorry
```

Then:
- move the Mackey bullet from the docstring's "Not statable" list to the "Stated here" paragraph;
- write both names in backticks at README line 1246.

Uniqueness has to range over *group* topologies. Over all topologies it is false: see Source issues and row 21 of the table.

## R02 (P2) — The factor characterisation of extreme KMS states is statable and absent

**Location.** `Suggested.lean` lines 70–72 list as not statable "the Choquet simplex of KMS states and the factor characterisation of its extreme points (D7): no Choquet simplex carrier". README line 3138 states the characterisation as a D7 target: "Its extreme states are exactly its factor states".

**Claim.** The characterisation needs no simplex carrier:
- extreme points are Mathlib's `Set.extremePoints ℝ` of Tau Ceti's `TauCeti.CStarAction.kmsStates`;
- a factor state is one whose GNS representation `PositiveLinearMap.gnsStarAlgHom` has trivial centre `π(A)'∩π(A)''`, written with `Set.centralizer`.

Only the simplex property itself lacks a carrier.

**Witness.** In a scratch copy of `Suggested.lean` with the extra import `TauCeti.Analysis.CStarAlgebra.Action.KMS.StateSpace`, the theorem below elaborates: exit 0, 16 `sorry` warnings. `kmsStates` is in that file at line 61, and `gnsStarAlgHom` is in Mathlib `Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`, line 246.

**Repair.** Add the import line `public import TauCeti.Analysis.CStarAlgebra.Action.KMS.StateSpace` and a D7 section:

```lean
/-- The extreme β-KMS states of a unital C*-dynamical system are exactly its factor states
(Bratteli–Robinson 2, Theorem 5.3.30). -/
theorem mem_extremePoints_kmsStates_iff {A : Type*} [CStarAlgebra A] [PartialOrder A]
    [StarOrderedRing A] (α : CStarAction (Multiplicative ℝ) A) (β : ℝ) (ω : A →P[ℂ] ℂ)
    (hω : α.IsKMSState β ω) :
    StrongDual.toWeakDual (ω : A →L[ℂ] ℂ) ∈ Set.extremePoints ℝ (α.kmsStates β) ↔
      ∀ T ∈ Set.centralizer (Set.range ω.toPositiveLinearMap.gnsStarAlgHom) ∩
          Set.centralizer (Set.centralizer (Set.range ω.toPositiveLinearMap.gnsStarAlgHom)),
        ∃ c : ℂ, T = c • (1 : ω.toPositiveLinearMap.GNS →L[ℂ] ω.toPositiveLinearMap.GNS) := by
  sorry
```

Then:
- shorten the docstring bullet to "the Choquet simplex property of `K_β` (D7): no Choquet simplex carrier";
- name the theorem in backticks at README line 3138.

## R03 (P2) — Cuntz's simplicity theorem is statable on `generatedCStarAlgebra` and is absent

**Location.** `Suggested.lean` lines 68–69 name only "the universal identification of `O_n`" as not statable. README lines 2964–2980 make the simplicity of O_n a D6 target ("deduce simplicity and nuclearity from the groupoid theorems").

**Claim.** Simplicity does not need the universal algebra.
- By Cuntz's uniqueness theorem (Cuntz 1977, §1, already cited by the README), take n≥2 isometries on a nonzero Hilbert space with `S_i*S_j=δ_ij` and `ΣS_jS_j*=1`. They generate a copy of O_n.
- So the simplicity of the C*-algebra they generate is statable on the file's own `generatedCStarAlgebra`.
- This is exactly how `reducedFreeGroup_isSimpleRing` states Powers's theorem.

The docstring neither states this theorem nor names it as not statable.

**Witness.**
- The theorem below elaborates in a scratch copy of `Suggested.lean`: exit 0, 16 `sorry` warnings.
- `exists_residue_family` supplies such a family on every separable infinite-dimensional H, so the hypotheses can be satisfied.
- n=1 has to be excluded: the bilateral shift U on `ℓ²(ℤ)` satisfies both relations, and `C*(U)≅C(𝕋)` is not simple.

**Repair.** Add to the D6 section:

```lean
/-- Cuntz's theorem: for `n ≥ 2` the C*-algebra generated by `n` isometries with orthogonal ranges
summing to the identity is simple (Cuntz, §1). -/
theorem cuntz_isSimpleRing {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [Nontrivial H] (n : ℕ) (hn : 2 ≤ n) (S : Fin n → (H →L[ℂ] H))
    (hS : ∀ i j : Fin n, (ContinuousLinearMap.adjoint (S i)).comp (S j) =
      if i = j then (1 : H →L[ℂ] H) else 0)
    (hsum : (∑ j : Fin n, (S j).comp (ContinuousLinearMap.adjoint (S j))) = 1) :
    IsSimpleRing (generatedCStarAlgebra S) := by
  sorry
```

Then:
- keep "the universal `O_n` and its nuclearity" in the "Not statable" list;
- name `cuntz_isSimpleRing` at README line 2980.

You may also state Cuntz's uniqueness: there is `e : generatedCStarAlgebra S ≃⋆ₐ[ℂ] generatedCStarAlgebra T` with `e ⟨S i, _⟩ = T i`. It elaborated as well. The membership proof is the real term `StarSubalgebra.le_topologicalClosure _ (StarAlgebra.subset_adjoin ℂ _ ⟨i, rfl⟩)`.

## R04 (P3) — The branch still deletes six files of other roadmaps, so the gate fails

Re-raised: H02

**Location.** These six files lie outside the folder:
- `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`

**Claim.** Merging deletes from main six files that belong to other roadmaps. Until this is fixed the gate fails, and the folder cannot be accepted.

**Why the reason fails.** The repair reports say that a repair of this folder may not write outside it. That limits who can make the change; it does not remove the defect. The fix is one commit on the branch by someone who may write outside the folder.

**Witness.**
- At f8ae283, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OperatorAlgebraDynamics'` gives `6 files changed, 159 deletions(-)`, for exactly these paths.
- My gate run gives `outside-folder=6 … FAIL`, and every other check is 0.

**Repair.** In a new commit on the branch, run `git checkout origin/main -- <the six paths>`, then re-run the gate.

I re-checked this repair on this head:
- The merge base is 32a0bcc9.
- `git diff 32a0bcc9 origin/main -- <paths>` is empty, so main has not changed these files since the merge base.
- `git diff --stat HEAD origin/main -- <paths>` is `6 files changed, 159 insertions(+)`, so the checkout restores exactly the dropped blobs.

## R05 (P3) — `exists_centralIntegratedOperator` does not use the twist it is named for

**Location.** `Suggested.lean` lines 200–212. The module docstring (line 34) announces it as "the projective integrated form of a continuous central multiplier cocycle". README line 997 attaches it to "`‖T_f‖≤‖f‖₁` (`exists_centralIntegratedOperator`), multiplicativity and star preservation".

**Claim.** The conclusion uses only `P.pi`, the strong continuity of `P.unitaryMap` and the integrability of f. None of the following plays any part:
- the cocycle, centrality and normalisation laws of `CentralCocycle`;
- the `covariance` and `projective` fields of `CentralCovariantPair`.

It is `exists_integratedOperator`'s statement and proof again; its own docstring says "the same measurability argument … applies". So the D1.CentralTwists entry tests nothing about ω. Multiplicativity is the statement that does use ω.

**Witness.** Take G=ℤ/2, A=ℂ, `ω(a,a)=−1`, counting measure and `U_a=1`.
- This U breaks the projective law, but the bound `‖T_(δ_a)‖=1≤1` still holds.
- Multiplicativity separates the two cases. Since `δ_a *_ω δ_a=−δ_e`, U_a=1 gives `T_(δ_a)²=1≠−1=T_(δ_a *_ω δ_a)`, while the genuine pair `U_a=i` gives −1 on both sides.

**Repair.** Replace `exists_centralIntegratedOperator` with the multiplicativity statement below; the README carries the bound. I tested it in a scratch copy of `Suggested.lean`: exit 0, 16 `sorry` warnings.

```lean
/-- Twisted convolution `(f *_ω g)(s) = ∫ f(r) α_r(g(r⁻¹s)) ω(r,r⁻¹s) dμ(r)`, the multiplier
acting on the right. -/
def twistedConvolution {G A : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]
    [NonUnitalCStarAlgebra A] {α : CStarAction G A} (ω : CentralCocycle α) (μ : Measure G)
    (f g : G → A) (s : G) : A :=
  ∫ r, (ω.value r (r⁻¹ * s) : 𝓜(ℂ, A)).snd (f r * α r (g (r⁻¹ * s))) ∂μ

/-- Multiplicativity of the projective integrated form: `T_(f *_ω g) = T_f T_g` on `C_c(G,A)`. -/
theorem centralIntegrated_twistedConvolution {G A H : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G]
    [NonUnitalCStarAlgebra A] [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (α : CStarAction G A) (ω : CentralCocycle α) (P : CentralCovariantPair H α ω)
    (μ : Measure G) [μ.IsHaarMeasure] (f g : C_c(G, A)) (ξ : H) :
    ∫ s, P.pi (twistedConvolution ω μ f g s) ((P.unitaryMap s : H →L[ℂ] H) ξ) ∂μ =
      ∫ r, P.pi (f r) ((P.unitaryMap r : H →L[ℂ] H)
        (∫ t, P.pi (g t) ((P.unitaryMap t : H →L[ℂ] H) ξ) ∂μ)) ∂μ := by
  sorry
```

The proof route is left invariance in t (`t=r⁻¹s`), covariance, the projective law and Fubini on compact supports. Update README line 997 to name the new theorem for multiplicativity.

## R06 (P3) — D2.BoundedSequenceTranslation and D2.SequenceToeplitz have crossed dependencies

**Location.** README lines 1902–1905, in D2.BoundedSequenceTranslation: "Construct the faithful inclusion of SequenceToeplitz's C₊⋊ℤ in R from its translation-invariant coefficient inclusion, respecting the common compact ideal and quotient maps." The two *Needs:* lines are at 1923–1929 (BoundedSequenceTranslation) and 2010–2017 (SequenceToeplitz).

**Claim.** The two *Needs:* lines don't match what each subsection uses:
- BoundedSequenceTranslation builds a map out of `C₊⋊ℤ`, which only the later D2.SequenceToeplitz defines. Its *Needs:* line does not name D2.SequenceToeplitz.
- SequenceToeplitz's *Needs:* line lists "the inclusion `C₊⋊ℤ→R`" as an input, but its text never uses it. So the two subsections cite each other.
- BoundedSequenceTranslation also uses CStarAlgebras C1.7's embedding `R→M(K(H))` and Tau Ceti's `NonUnitalStarAlgHom.multiplierExtension` (lines 1889–1891). Its *Needs:* line names neither.
- SequenceToeplitz's *Needs:* line carries that embedding under BoundedSequenceTranslation's name R, not its own algebra B.

**Witness.**
- `C₊` is constructed at line 1933 ("Inside native `lp` … construct the closed nonunital star subalgebra C₊"), in SequenceToeplitz.
- BoundedSequenceTranslation's *Needs:* line names only D1, D2, CStarAlgebras C1.3, C2.2–C2.4 and C2.AnnHull, and Mathlib `lp`.
- SequenceToeplitz's *Needs:* line reads "(matrix units, the inclusion `C₊⋊ℤ→R`)" and "CStarAlgebras C1.7 (the embedding `R→M(K(H))`)".

**Repair.**
1. Move the two sentences from "Construct the faithful inclusion of SequenceToeplitz's C₊⋊ℤ in R" (line 1902) to "need not extend to R." (line 1905) to the end of the D2.SequenceToeplitz target. "The same relation holds in Q." stays where it is.
2. In SequenceToeplitz's *Needs:* line:
   - replace "the inclusion `C₊⋊ℤ→R`" by "the algebra R with its compact ideal and quotient Q";
   - replace "the embedding `R→M(K(H))`" by "the embedding `B→M(K(ℓ²(ℤ)))`".
3. Add to BoundedSequenceTranslation's *Needs:* line: "CStarAlgebras C1.7 (the embedding `R→M(K(H))`); Tau Ceti `NonUnitalStarAlgHom.multiplierExtension` (the extension from the compact ideal)".

Afterwards, BoundedSequenceTranslation refers to no later subsection, and each *Needs:* line lists only what its own text uses.

## R07 (P3) — Four Mathlib names are cited without their namespace and do not resolve as written

**Location.**
- README lines 1233, 1308 and 1397: `div_mem_nhds_one_of_haar_pos`.
- README line 2202: `isMulLeftInvariant_eq_smul_of_regular`.
- `Suggested.lean` line 218: `AddMonoidHom.continuous_of_measurable`.

**Claim.** All three lemmas live in `MeasureTheory.Measure`. The previous round renamed the last one to its full name in the README (line 1234), but not in the Lean docstring.

**Witness.** In a scratch file at the pins with `open TauCeti MeasureTheory`, the three short names fail with "Unknown identifier" or "Unknown constant". The `MeasureTheory.Measure.`-prefixed names elaborate. They are in Mathlib `MeasureTheory/Measure/Haar/Basic.lean` line 638, `Haar/Unique.lean` line 906 and `Haar/NormedSpace.lean` line 79.

**Repair.**
- In the README, write `MeasureTheory.Measure.div_mem_nhds_one_of_haar_pos` (three places) and `MeasureTheory.Measure.isMulLeftInvariant_eq_smul_of_regular`.
- In `Suggested.lean` line 218, write `MeasureTheory.Measure.AddMonoidHom.continuous_of_measurable`.

## Previous findings

- **R01 of the previous review — not repaired.** The outside-folder diff still deletes the six `PROGRESS.md`/`STATUS.md` files (`6 files changed, 159 deletions(-)`), and the gate still reports `outside-folder=6 … FAIL`. Raised again as R04.
- **Pull-request description (H03) — unchanged, recorded as settled by the previous review.** `scratch/overlaps.md` still reports that #1137 and #1187 conflict, including in this folder's `Suggested.lean`. The description still names no order between them. It also still ends with a "Revisions … which merge first" line, although `overlaps.md` again finds no id that only an open revision defines.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate** (my run at f8ae283): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=6 source-material=0 FAIL`. This agrees with the worker's gate, which adds `build=0`.
- **Dependency check:** the output is `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`, exit 0, with no UPWARD, CYCLE or `moved:` line.
  - The roadmap is on main, so it may consume only Mathlib, Tau Ceti and roadmaps on main.
  - All 25 *Needs:* lines name only those. I checked that BanachAlgebras, CStarAlgebras, HilbertModules, VonNeumannAlgebras, OperatorTheory/SelfAdjointSpectralTheory, Completed/OneParameterSemigroups, LieGroupoidsPoisson, AmenableGroups, RepresentationTheory/CompactGroups and RepresentationTheory/SpinRepresentations exist on main (f8836c4).
  - Seven roadmaps not on main appear only as deferrals or consumers, never in a *Needs:* line: MetaplecticAutomorphicForms, NoncompactQuantumSymmetry, OperatorKTheory, CStarClassification, QuantumFoundations, CompactQuantumMetricSpaces and HeisenbergImprimitivity.
- **Elaboration:** `lake env lean` of the file exits 0 in 7 s. Its only diagnostics are the 15 `declaration uses sorry` warnings, at lines 103, 116, 131, 203, 222, 237, 253, 274, 295, 306, 323, 339, 361, 385 and 409.
- **`#check @` of all 18 declarations** (appended to a scratch copy) elaborates. I compared each elaborated type with its README statement:
  - the universes are as the docstring states: `integratedFull` is on `Type (max u v)`, and in the amenable theorem H is in A's universe;
  - no section binder is lost;
  - no README/Lean generality mismatch beyond R05. The extra `[μ.Regular]` of `injective_integratedFull_regular_of_amenable` only supplies the `InnerRegularCompactLTTop` instance that Tau Ceti's `CovariantRepresentation.regular` needs (`Covariant/Regular.lean` lines 104–105).
- **One-tactic probe:** I replaced each `sorry` with `first | rfl | infer_instance | trivial | decide | simp`. All 15 theorems fail (errors at all 15 proof lines), so none is padding by that test. The three definitions have real bodies.

### Seeded sample

- **"Worked example: the saddle flow"** (README lines 2028–2065), checked against `williams-cpcsa-draft31` lines 6178–6198:
  - Example 3.32 is on printed p. 96 (line 6145) and p. 97 (line 6191).
  - The action is `r·(x,y)=(rx,r⁻¹y)`. The orbits are the origin, the four half-axes and two orbits per hyperbola `xy=b≠0` (line 6181).
  - Basis (c), at line 6194, is the README's neighbourhood basis of a half-axis point; basis (b) is the README's basis at the origin.
  - The README's orbit description, closures, bases and T₀/non-T₁/non-Hausdorff conclusions are right (row 19).
- **"D5.Fields — the standard-fibre model as a measurable field"** (lines 2553–2643):
  - Definition E.16 is at line 23770 and Theorem E.17 at line 23776, both on printed p. 405 (the page break is line 23790). E.17 assumes H separable, X second-countable locally compact Hausdorff and μ a finite Borel measure, which matches D5.Fields' standing hypotheses.
  - Definition F.1 is at line 23897, p. 409. Appendix F's assumption of nonzero fibres is at line 23893, p. 409.
  - All seven Checks recomputed (row 20).
- **"Concrete Cuntz families on separable Hilbert space"** (lines 3013–3049): every formula was recomputed (row 17). Cuntz 1977 is uncertified (see Not verifiable).
- The README flags no locator as unverified.

### Locators of the stated headlines, at `williams-cpcsa-draft31`

- Proposition 2.40, line 3988, p. 59.
- Proposition 3.19, line 6050, p. 93: an α-invariant ideal, with the exact sequence of `ι⋊id` and `q⋊id`.
- Proposition 3.1, line 5398, p. 82.
- Theorem 7.13, line 12297, p. 199.
- Theorem D.11, line 21995, p. 372: G and H separable metric groups, G Polish. This matches `continuous_of_measurable_monoidHom`.
- Theorem 4.24, line 8504, p. 133.
- Definition 4.26, line 8646, p. 135: `S_γR_s=γ(s)R_sS_γ`, which is the Lean `hcov` after conjugation.
- Theorem 4.29, line 8788, p. 137.
- Theorem D.23, line 22193, p. 376.

`delaharpe2007`:
- Definition 9, line 323, p. 7. It is the Lean partition statement exactly, with `γ_jD` pairwise disjoint.
- Corollary 12(i), line 367, p. 8.
- Theorem 14, line 423, p. 10.
- Kesten, line 712, p. 16.
- The Dixmier property, line 856, p. 19.

### Library declarations at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d)

- In a scratch file with all relevant built Tau Ceti modules imported, 169 names elaborate under `open TauCeti MeasureTheory`. These are the 148 dotted backticked names of the README and 21 further names it cites (`twistedMonoidAlgebra`, `unitary`, `exists_hilbertBasis`, `finSumFinEquiv`, `HilbertBasis`, `DoubleCentralizer`, `CStarModule`, `CStarMatrix`, `ContinuousLinearMapWOT`, `VonNeumannAlgebra`, `PontryaginDual`, `Circle`, `IsSimpleRing`, `ContRepresentation`, `AddCircle`, `StandardBorelSpace`, `StandardSubspace`, `MeasureTheory.AnalyticSet`, `Real.fourier_eq'` and the two prefixed names of R07). Only the three short forms of R07 fail.
- Mathlib declarations opened:
  - `MeasureTheory.Measure.div_mem_nhds_one_of_haar_pos` (`Haar/Basic.lean` line 638; needs `IsHaarMeasure`, local compactness and `InnerRegular`);
  - `MonoidHom.isOpenMap_of_sigmaCompact` (`Topology/Algebra/Group/OpenMapping.lean` line 114; source σ-compact, target Baire T₂, f surjective and continuous, all of which hold for `j:E_ω→G`);
  - `Nat.divModEquiv` (`Logic/Equiv/Fin/Basic.lean` line 358);
  - `MeasureTheory.AnalyticSet` (`Constructions/Polish/Basic.lean` line 186);
  - `PositiveLinearMap.gnsStarAlgHom` (`GelfandNaimarkSegal.lean` line 246);
  - `Real.instFourierTransform` (`Analysis/Fourier/FourierTransform.lean` line 428).
- Tau Ceti declarations opened:
  - `TauCeti.CStarAction.FullCrossedProduct` (`CrossedProduct/Full.lean` line 266) and `integratedFull` (line 417);
  - `CovariantRepresentation.regular` (`Covariant/Regular.lean` line 127);
  - `IsKMSState` (`KMS/Basic.lean` line 222) and `kmsStates` (`KMS/StateSpace.lean` line 61, the image of `A →P[ℂ] ℂ` states in `WeakDual`);
  - `NonUnitalStarAlgHom.multiplierExtension` (`Representation/Nondegenerate.lean` line 204);
  - `PiTensorProduct.reindexRepresentation` (`TensorAction/Basic.lean` line 59);
  - `circleEquivPontryaginDualInt` (`Topology/Algebra/PontryaginDual.lean` line 47);
  - `twistedMonoidAlgebra` (`Algebra/MonoidAlgebra/Twisted/Basic.lean` line 288).
- **Duplication at the pins:** none of the 15 stated headlines is at the pins. I searched both libraries for strong subadditivity, Cuntz, Powers and amenable crossed-product statements and found none, and Tau Ceti's `UnitaryCharacter.lean` is not `C*(G)≅C₀(Ĝ)`.

### Cross-roadmap citations, resolved on main (f8836c4)

- **CStarAlgebras:**
  - C1.3, C1.6, C1.7, C2.2, C5.4 and C8.4 read in full. C5.4 names this roadmap's D1 as the consumer of `C*(F_∞)`; C8.4 has symbol `S↦z`.
  - Headings C1.4, C2.1, C2.3, C2.4, C2.AnnHull, C5.1, C5.2, C6.1, C6.2, C6.5 and C7.1 present.
- **VonNeumannAlgebras:**
  - V11.UnitizationCharacters, line 3185: an injective continuous map from the nonzero characters into Ĝ, with `φ(λ(g))=ĝ(γ_φ)` in the positive-character convention.
  - V11.FourierUniqueness, line 3203.
  - The inversion target, lines 3233–3244, with `f(x)=∫f̂(γ)conj(γ(x))dγ`, `‖λ(f)‖=sup|f̂|` and Pontryagin duality.
  - V4.0.Fields at line 1181, V4.0.Decomposition at line 1279 (it names D5 at line 1305), V2.RectangularL2 at line 634, V10.ModularTheory at line 2364 and V10.KMS at line 2459.
- **SelfAdjointSpectralTheory:** SA-A21 (line 225), SA-B14 (320), SA-B44 (420), SA-B50 (441), SA-B59 (477), SA-B67 (538), SA-B79 (592) and SA-B85 (676). SA-B85 names D5 as a consumer at line 1407.
- **LieGroupoidsPoisson:** G0.0 at line 261 names D5 at line 270.
- **HilbertModules:** H1 (line 126), H2 (179) and H3 (262).
- **AmenableGroups:** Layer 5 (line 289) and Layer 7 (line 415).
- **BanachAlgebras:** A7.CharactersAndUniqueness, line 1739.
- **FreeProbability:** F3, line 255.
- `scratch/citations.md` finds nothing unresolved.
- **Observation outside this folder (not a finding):** on main, VonNeumannAlgebras line 1305 says D5 takes its diagonal C₀ model from V4.0.Multiplication, while SA-B85 line 1407 and this README say SA-B85. Both exist on main and state the same model, so this README's choice resolves. The double ownership belongs to those two roadmaps.

### Ownership against open pull requests and overlaps

- `roadmaps grep` over the 458 open heads finds no second owner of strong subadditivity, the Powers property, the KMS simplex, Takai duality or the twisted group C*-algebra:
  - HeisenbergImprimitivity, OperatorKTheory, CompactQuantumMetricSpaces and NoncommutativeGeometry cite D1/D2.CentralTwists;
  - QuantumFoundations cites MetaplecticAutomorphicForms §1.2 for Stone–von Neumann, as this README does;
  - AnalyticNumberTheoryPartII's KMS simplex is the Bost–Connes one, not a second owner.
- No declaration of another readable roadmap uses the namespace `TauCetiRoadmap.OperatorAlgebraDynamics`.
- `overlaps.md` finds no dropped id and no id that only an open revision defines. Its only conflict is #1187, under H03 above.

### Adversarial table

Rows 1–18 are the 15 stated theorems and the 3 definitions. Rows 17, 19 and 20 are the seeded sample. Rows 6 and 21–25 are the targets the findings touch.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` | ℤ counting, `f=δ_0⊗a+δ_1⊗b`; `f(n)=2^(−\|n\|)a`; G trivial | integral `π(a)ξ+π(b)Uξ`; `‖f‖₁=‖a‖(1+2Σ_(n≥1)2^(−n))=3‖a‖`; trivial G gives `π(f(e))` | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` | G trivial, A=ℂ², `L(x,y)=x` on ℂ; L=0 | `L(1,0)=1`, nondegenerate, π=L, U=1 recovers L; for L=0 the span of `L(a)ξ` is 0, excluded by `hL` | holds | none |
| 3 | `fullCrossedProductMap_exact` | G trivial, A=ℂ², I=ℂ⊕0, `q(x,y)=y`; I=A | `0→ℂ→ℂ²→ℂ→0` exact with ker q=I; `hker` forces I=ker q, an ideal; I=A forces B=0 | holds | none |
| 4 | `CentralCocycle` | ℤ/2 on ℂ, `ω(a,a)=−1`; trivial action on M₂, `ω(a,a)=diag(1,−1)` | Lean `cocycle` at r=s=t=a: left `α_a(ω(a,a)α_a⁻¹(ω(a,e)x))=−x`, right `ω(a,a)ω(e,a)x=−x`; on M₂ both sides are `diag(1,−1)x`, but `diag(1,−1)E_12=E_12≠−E_12=E_12diag(1,−1)`, so only `central` fails | discriminating | none |
| 5 | `CentralCovariantPair` | same ℤ/2 data, π=id | `U_a=i`: `U_a²=−1=π̃(ω(a,a))U_e`; `U_a=1`: `1≠−1`, so `projective` fails | discriminating | none |
| 6 | `exists_centralIntegratedOperator` | ℤ/2, `ω(a,a)=−1`, `U_a=1` (not a pair) and `U_a=i` | bound `‖T_(δ_a)‖=1≤1` for both; `δ_a*_ωδ_a=−δ_e`, so `T_(δ_a)²=1≠−1` for `U_a=1` but `−1=−1` for `U_a=i` | holds but independent of ω | R05 |
| 7 | `continuous_of_measurable_monoidHom` | Hamel ℚ-linear map ℝ→ℝ; Williams D.11 | discontinuous, so not Borel; D.11 hypotheses at line 21995: separable metric groups, G Polish, which is the Lean signature | holds | none |
| 8 | `injective_integratedFull_regular_of_amenable` | ℤ, A=ℂ, ρ=id; F₂; `ρ(z)=z⊕0` | `‖λ(f)‖=sup_𝕋\|f̂\|`, the universal norm; F₂: `χ_triv(h)=4`, but `‖λ(h)‖=2√3<4` (Kesten, de la Harpe line 712), so amenability is needed; the degenerate ρ adds a zero summand with the same kernel | holds | none |
| 9 | `transitive_commutant_scalar` | ℤ/2 swapping {p,q}; trivial action on {p,q}; F=∅ | T diagonal `diag(d_p,d_q)`, the swap forces `d_p=d_q`; under the trivial action `diag(1,0)` commutes and is not scalar; with F=∅ and \|I\|=2, `hsep` is false and the swap is not scalar | holds; both hypotheses needed | none |
| 10 | `exists_powers_partition` | F={b}, L=2, `w=ab²`; F=∅, N=2; ℤ | `wbw⁻¹=aba⁻¹`, and for c starting with `b^(±1)`, `aba⁻¹c` starts with a, so it is not in C; `b^jD` has exactly j leading b's; `γ_j=b^jw` gives `γ_j(w⁻¹D)=b^jD`; for ℤ, `(C+1)∩C=∅` forces density of D ≥ ½, so three disjoint translates are impossible | holds | none |
| 11 | `generatedCStarAlgebra` | λ on F₂; bilateral shift | without closure, ℂ[F₂] has the proper nonzero augmentation ideal `ker(Σc_gλ(g)↦Σc_g)`; after closure that character is unbounded (`\|χ(h)\|=4>2√3=‖λ(h)‖`); shift: closure `C*(U)≅C(𝕋)` | discriminating | none |
| 12 | `reducedFreeGroup_isSimpleRing` | singleton basis (excluded by a≠b); {a,b} | `C(𝕋)` has the proper ideal of functions vanishing at 1; F₂ gives a simple algebra | holds | none |
| 13 | `reducedFreeGroup_trace_unique` | `τ(λ(g))`; singleton basis | `⟨δ_1,λ(g)δ_1⟩=[g=1]`; on C(𝕋), `ev_z` is tracial with `ev_z(λ(b))=z≠0=τ(λ(b))` | holds; a≠b needed | none |
| 14 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` | ℤ/2; ℤ; S₃ | `f̂(1)=f₀+f₁`, `f̂(χ)=f₀−f₁`; `δ_1↦z`; `(f*)^=∫conj f(x⁻¹)χ(x)=conj f̂(χ)`; `C*(S₃)=ℂ²⊕M₂` is noncommutative, so the abelian hypothesis is needed | holds | none |
| 15 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` | G=ℤ (Ĝ=𝕋); ν↦cν | canonical unitary at z ↦ `(n↦zⁿ)`; f taken with cν equals cf taken with ν | holds | none |
| 16 | `lcaWeyl_classification` | ℤ/2, ℤ/3, ℤ, E=0 | ℤ/2: `U_aV_χU_a*=diag(−1,1)=conj(χ(a))V_χ`; ℤ/3: `U_1V_χU_1*ξ(t)=ω^(t−1)ξ(t)`, i.e. `ω⁻¹V_χ`; ℤ: `z^(−s)`; Williams line 8648 gives the same phase; E=0 gives ι=∅ | holds | none |
| 17 | `exists_residue_family` (sampled) | n=1, 2; shift family; finite-dimensional H | n=2: `S_0*b_3=0`, `S_1*b_3=b_1`, `(S_0S_0*+S_1S_1*)b_3=S_1b_1=b_3`; in general `S_i*S_jb_k=[(nk+j)%n=i]b_(k)` and `ΣS_jS_j*b_k=b_(n(k/n)+k%n)=b_k`; shift: `S_1*S_0=S_1*≠0`; finite dimension: `n·dim H≤dim H` is impossible for n≥2 | holds | none |
| 18 | `vonNeumannEntropy_strong_subadditivity` | GHZ; 2·GHZ; `\|0⟩⟨0\|⊗Φ⁺`; `ρ_A` in place of `ρ_AB` | `0+log2≤log2+log2`; `−2log2+0≤0+0`; `log2≤log2+0` with equality; `log2≤0` false; Lean's `partialTraceLeft` is `Tr_A`, followed by `partialTraceRight` (`Tr_C`), and `prodAssoc.symm` then `Tr_C` gives `ρ_AB` | holds | none |
| 19 | Saddle flow (sampled) | Williams Ex. 3.32 at `r=e^t`; points (1,1), (−1,−1), (1,−2) | orbits `{(u,1/u):u>0}`, `{(u,1/u):u<0}`, `{(u,−2/u):u>0}`; `{x>0,\|xy\|<ε}` is saturated, open and misses 0; the +x and +y neighbourhoods share the first-quadrant branches with `r<ε` | holds; locator correct | none |
| 20 | D5.Fields (sampled) | point; `N≡ℕ`; N={0} below ½ and {0,1} from ½; non-measurable S; S=[0,½] | `⟨s_i,s_j⟩(x)=δ_ij1_(i∈N(x))` is Borel; `1_(x≥½)E_01` maps fibres into fibres, while constant `E_10` sends `e_0` to `e_1∉span e_0` below ½; `1_Se_0` is not measurable; 1 and `E_00` agree on `span e_0`; zero fibres give `L²(S)` | holds; locators correct | none |
| 21 | Mackey (R01) | predicate on standard Borel spaces; "any topology" reading | predicate proved in Lean for every `StandardBorelSpace`; the Borel automorphism swapping [0,1) and [1,2) of ℝ transports the usual topology to an lcsc topology with the same Borel sets and different open sets | statable; uniqueness needs "group" | R01 |
| 22 | Extreme KMS ⇔ factor (R02) | M₂ and ℂ⊕ℂ with trivial dynamics | M₂: the only trace is Tr/2, extreme, `π(M₂)''=M₂⊗1`, a factor; ℂ⊕ℂ: the extreme traces are the characters, with one-dimensional GNS; the mixture (½,½) has `π(A)''=ℂ²`, centre ℂ², so it is neither factor nor extreme | statable; consistent | R02 |
| 23 | Cuntz simplicity (R03) | n=1 bilateral shift; n=2 residue family | n=1: `U*U=UU*=1`, and `C*(U)≅C(𝕋)` has a proper ideal; n=2: the relations as in row 17 | statable; n≥2 needed | R03 |
| 24 | BoundedSequenceTranslation / SequenceToeplitz order (R06) | README lines | `C₊` defined at line 1933 (SequenceToeplitz) and used at line 1902 (BoundedSequenceTranslation); BoundedSequenceTranslation's *Needs:* line (1923) lacks SequenceToeplitz and C1.7; SequenceToeplitz's *Needs:* line (2010) lists the unused inclusion and `R→M(K(H))` | defect | R06 |
| 25 | Names (R07) | `#check` with `open MeasureTheory` | short forms "Unknown identifier"/"Unknown constant"; `MeasureTheory.Measure.` forms elaborate | defect | R07 |
| 26 | D1 convolution direction | ℤ/3 shift on ℂ³ | `(f*g)(2)=e_0α_1(e_2)=e_0`; the inverse convention gives `e_0e_1=0` | holds | none |
| 27 | Modular conventions | `c=modularCharacter`, Williams Δ | `∫f(xg)=c(g)∫f` and Williams `Δ(g⁻¹)` give `c=Δ⁻¹`; the groupoid star of `Δ^(1/2)f` is `Δ^(1/2)·Δ⁻¹conj f(s⁻¹)`; the I-norm is `max(‖f‖₁,‖Δ⁻¹f‖₁)`; D=Δ | holds | none |
| 28 | Gram order and induced-form sign | M₂, `E_11`, `E_12`; `x_1=−E_12`, `x_2=E_11` | Gram entries `δ_ikδ_jl=ww*`, rank one; the flip has eigenvalue −1; the displayed form gives 0, the transposed one `⟨e_1,−e_1⟩+⟨−e_1,e_1⟩=−2` | holds | none |
| 29 | `T_b` and `ψ_b` directions | ℤ/3, `b(1)=i`, `b(2)=1` | `ω^b(1,2)=i`; `(iδ_1)δ_2=iδ_0`; reversed: −δ_0 against δ_0; in `E_(ω^b)`, `(1,1)(1,2)=(i,0)↦(i,0)`; reversed: `(−1,0)` against `(1,0)` | holds | none |
| 30 | `E_ω` inverse | general | `(z,s)(z̄ω̄(s,s⁻¹),s⁻¹)=(1,e)`; on the left it needs `ω(s,s⁻¹)=ω(s⁻¹,s)`, the cocycle at `(s,s⁻¹,s)` | holds | none |
| 31 | Schrödinger phase | ℤ/3, `x=(1,ψ)` | `Π_xδ_0=ζ²δ_2`, `Π_x*δ_2=ζδ_0`, `Π_(−x)δ_2=δ_0`; `δ_x*δ_x=ζ·ζ²δ_0=δ_0` | holds | none |
| 32 | Weight projection `p_1` | weight k | `∫z̄z^kdz=δ_(k1)`; the z weight gives `V_sV_t=ω̄(s,t)V_(st)`, i.e. `C*(G,ω⁻¹)` | holds | none |
| 33 | Takai sign | ℤ/3 | `(ρ_1e_t)(r)=e_t(r+1)`, so `ρ_1e_t=e_(t−1)` | holds | none |
| 34 | Dual measure and inversion | ℤ/n; ℤ/3, f=δ_1 | `Σ\|δ̂_e\|²=n` against 1; `(1/3)Σχ(1−x)=[x=1]`; with `χ(x)`: `[x=−1]` | holds | none |
| 35 | Uniform Roe matrix units | `E_ij`, p even | `E_ijδ_n=[n=j]δ_i`; the opposite shift gives `δ_(2i−j)↦δ_i`; `UpU*=M_(1_(2ℤ+1))=1−p` | holds | none |
| 36 | `C₊⋊ℤ` primitive space | `{η}∪𝕋` | `{P⊉K}={η}` is open, `hull(K)=𝕋` is closed, the opens are ∅ and `{η}∪O` | holds | none |
| 37 | KMS sign | K=diag(0,1), a=E_12, b=E_21 | `τ_(iβ)(b)=e^(−β)b`; `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(E_22)`; the opposite sign gives `e^β/(1+e^(−β))` | holds | none |
| 38 | Modular strip maps | `z↦−βz+iβ`, `w↦i−w/β` | at t: `F(−βt+iβ)=ω(τ_(−βt)(x)y)`; at t+i: `F(−βt)=ω(yτ_(−βt)(x))`; `G(i−s/β)=ω^Q(yτ̄^P_s(x))`, and at s+iβ it is `ω^Q(τ̄^P_s(x)y)` | holds | none |
| 39 | Perturbation and Dyson cocycle | K=diag(0,1), P=−diag(0,1) | K+P=0; `u_t=diag(1,e^(iβt))`; `Ad(u_t)τ_(−βt)=id`; Q=βP gives the Gibbs state of diag(0,2), with weights `(1,e^(−2β))` | holds | none |
| 40 | CAR `√(n+1)` | f⊥g | `‖P_a(f⊗g)‖²=‖f‖²‖g‖²/2`; `bb†g+b†bg=‖f‖²g/2` | holds | none |
| 41 | `U_σ` left action | ℂ³, σ=(1 2), τ=(2 3) | `U_σU_τe_123=e_312=U_(στ)e_123`; `V_(στ)e_123=e_231⊥e_312` | holds | none |
| 42 | Bogoliubov | U=0, V=conjugation on ℂ | `V*x=x̄`, all four relations hold; `{a(f̄)*,a(ḡ)}=gf̄=⟨f,g⟩`; U=1 gives `U*U+V*V=2` | holds | none |
| 43 | Weyl phase and core | `λ(f)λ(g)δ_v`; `u′=±u` | phase `exp(−i[σ(g,v)+σ(f,g)+σ(f,v)−σ(f+g,v)]/2)=exp(−iσ(f,g)/2)`; bounded solutions on ℝ are 0 | holds | none |
| 44 | Fock `W_F` | h=ℂ, f=t; f=1 | derivative `i(v+w̄)/√2·e^(w̄v)`, the matrix element of `(a+a*)/√2`; the product phase `−⟨f,g⟩/2+Re⟨f,g⟩/2=−iIm⟨f,g⟩/2`; vacuum `e^(−1/4)` | holds | none |
| 45 | `D(A²)` counterexample | `c/(1+\|λ\|⁵)` | `∫dλ/(1+\|λ\|⁵)=2π/(5sin36°)≈2.138`, so c≈0.4677; second moment `2c(π/5)/sin108°≈0.618`; the fourth moment diverges like ∫dλ/λ | holds | none |
| 46 | Jordan–Wigner; Fermi and Bose occupations | `h=ℂ²`; `h₀=ε` | `E_12σ_3=−E_12`, `σ_3E_12=E_12`; `ω(a*a)=1/(e^(βε)+1)`; `coth(x/2)=1+2/(e^x−1)` | holds | none |
| 47 | Ising and on-site | ℤ; on-site h | `M_λ=\|h\|+2\|J\|e^λ`, `M_(λ,2)=\|h\|+8\|J\|e^λ`, so at λ=1 the bound is `(1/2)/(1+8e)=1/(2+16e)`; `p=log2coshβh`, `e=−h tanhβh`, `s=p−βh tanhβh`, `s−βe=p` | holds | none |
| 48 | Relative entropy and D9 scaling | `ρ_AB=¼1`, `σ_B=½1`; GHZ at c=2 | `log¼−log½=−log2=−2log2+log2`; `S(2σ)=2S(σ)−2log2` gives `−2log2,0,0,0` | holds | none |
| 49 | Full-shift topology; strong effectiveness | n=2; ℤ on `ℤ⊔{+∞}` | `(0^m10^∞,0,0^∞)` are non-units converging to a unit; `shift(0^m10^∞)≠0^∞`; `(n,+∞)=lim_k(n,k)`; the invariant opens are ∅, ℤ and everything | holds | none |
| 50 | Regular-module direction; irrational rotation | ℤ/2 swap on ℂ²; θ∉ℚ | `⟨ξ,ξ⟩_A=e_2`, the displayed map gives `η_2e_2` and the alternative `η_1e_1` is not isometric; `uv/vu` phase `e^(2πiθ)` | holds | none |

## Not verifiable

These are cited by locator only. The manifest records them as uncertified (paywalled), and I did not read them:

- **Cuntz 1977, §1.** This is the seeded "Concrete Cuntz families" target and R03. The relations and the residue family are verified by computation (rows 17 and 23), not against the text.
- **Bratteli–Robinson 1 and 2** (§§5.2–5.3, Theorems 5.2.8, 5.3.30 and 5.4.4, §6.2). R02 cites Theorem 5.3.30; row 22 checks it on two instances.
- **Renault 1980.**
- **Brown–Ozawa, Proposition 5.1.3.**

Rudin's *Fourier Analysis on Groups* has no manifest entry. It is cited only for statements consumed from VonNeumannAlgebras V11, whose inversion formula I read on main.

## Source issues

- **Misprint** in williams-cpcsa-draft31 at Example 3.32, p. 96 (lines 6184 and 6187–6188): the source begins a sentence with "Given" where an imperative is meant, and writes "The a basis"; it should read "Give A and the Qi the relative topology" and "A basis"; affects nothing.
- **Misprint** in williams-cpcsa-draft31 at Theorem D.23, p. 376 (lines 22194–22195): the source says G has a unique second-countable locally compact topology compatible with its Borel structure; it should say a unique such topology making G a topological group, since transporting ℝ's topology by a Borel automorphism gives another; affects nothing (the README and R01 state the group form).
