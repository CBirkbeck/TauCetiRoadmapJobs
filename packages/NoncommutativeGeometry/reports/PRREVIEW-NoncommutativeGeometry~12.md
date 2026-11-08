# Review of NoncommutativeGeometry (pull request #1143 at 1847a9a)

**Verdict:** needs changes

Full review of the folder at 1847a9a6. This is the head the previous review (r11) read, and nothing in the folder or outside it has changed since. Since then main has moved to 87608f1, OperatorKTheory's head to 1377338a and SmoothBanachRepresentations' head to 41f719f2. Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9 (the head's `lake-manifest.json`). The gate and the dependency check pass, and the Lean file elaborates with only the `sorry` warning.

Neither of r11's two findings is repaired (R01, R04 below). The full pass found three more ownership defects:
- N3's trace on trace-class operators restates VonNeumannAlgebras V4.Core, which is on main. The dependency check now accepts citing it (R02).
- NoncommutativeIntegration's head claims the B(H) quasi-ideals, Hölder's inequality and the weak classes that N3–N4 build (R03).
- N1.Tensor restricts to ℂ a construction the pin provides over every normed field (R06).

The rest are P3 locator and prose items. No statement was found false: every value in the adversarial table recomputes as stated.

## R01 (P2) — `A_θ` still has two owners: OperatorKTheory's head builds it and names this roadmap as its consumer

Location: `TauCetiRoadmap/NoncommutativeGeometry/README.md` 48–53 ("N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … which OperatorKTheory's Pimsner–Voiculescu computation consumes") and Downstream 1392–1396; the pull-request description.

Claim: N6 is the single owner of `A_θ`, its universal presentation, the injectivity of its coordinate copy of C(𝕋) and its faithful trace τ.

Witness: OperatorKTheory at head 1377338a (`TauCetiRoadmap/OperatorKTheory/README.md`):
- §7.4, lines 1782–1784, defines `A_θ=C(𝕋)⋊_αℤ` and `τ=HaarIntegral∘E`.
- Lines 1796–1798 prove the universal unitary presentation, the injectivity of the coordinate copy and the faithfulness of τ.
- Lines 2324–2326 list "K7's rotation algebras" as consumed by NoncommutativeGeometry.

N6 must stay the owner: a scratch copy that adds `OperatorKTheory §7.4` to N6's `*Needs:*` gives `UPWARD: NoncommutativeGeometry (on main) -> OperatorKTheory (#9) at README lines [1243]`.

Repair (the same as r11; the README needs no edit):
- Add a paragraph to the description saying that this pull request merges first.
- In that paragraph, say that #866 then replaces its 1782–1784 definition and its 1796–1798 bullet by a citation of NoncommutativeGeometry N6, and removes NoncommutativeGeometry from its Downstream 2324–2326.

After both changes, `roadmaps grep 'universal unitary presentation'` returns N6 alone.

## R02 (P2) — N3 restates the B(H) trace of VonNeumannAlgebras V4.Core (on main), and N4 redefines its normal functionals

Location:
- README 734–741: "Define the trace of a trace-class operator as `Tr(T)=Σ_j⟨e_j,Te_j⟩` … prove its absolute convergence and independence of the basis … `Tr(AT)=Tr(TA)`".
- 936–940: "Call a linear functional on B(H) normal when it is `T↦Tr(ρT)`".
- 251–253 ("N3 builds the trace"), Scope 69–75 and 80–81.

Claim: no supplier provides the trace on trace-class operators of B(H), so N3 builds it.

Witness: VonNeumannAlgebras on main (`TauCetiRoadmap/VonNeumannAlgebras/README.md`), V4.Core (972–981), plans:
- the canonical trace `Tr(x)=∑⟨e_i,xe_i⟩`, with x trace class iff `Tr|x|<∞` and `Tr|x|=‖x‖₁`;
- basis independence;
- cyclicity of trace-class and Hilbert–Schmidt products;
- `B(H)` as the dual of the trace class under `Tr(xh)`, and normal functionals as the predual.

Its open revision (#1041 head a3fbf040, 1083–1090) keeps V4.Core. A scratch copy with `VonNeumannAlgebras V4.Core` in N3's `*Needs:*` gives `depcheck: 236 roadmaps, 2421 edges, 0 problem(s)`. In r1–r2 the same edge was flagged UPWARD, which is why the trace moved here; the dependency check no longer objects.

N4 has a second, smaller defect: it defines "normal" for functionals on B(H) and then applies it to `Tr_ω`, which is defined only on `L^(1,∞)`.

Repair:
- **Supplier table:** add a row "VonNeumannAlgebras V4.Core: the canonical trace on trace class, basis independence, `Tr|x|=‖x‖₁`, cyclicity of trace-class and Hilbert–Schmidt products, the trace-class duality of B(H) and normal functionals".
- **N3:** in 734–741, consume that trace together with `|Tr T|≤‖T‖₁` and `Tr(AT)=Tr(TA)`. Keep here only the cyclicity `Tr(ST)=Tr(TS)` for S∈S_p, T∈S_q with 1/p+1/q=1 and 1<p<∞, proved by Hölder and density (Connes IV.1, p. 300). Add `VonNeumannAlgebras V4.Core` to N3's `*Needs:*` (line 894).
- **Scope and contract:** in Scope 69–75 and in line 253, name V4.Core as the trace's owner.
- **N4:** at 936–940, state "no Dixmier trace is the restriction to `L^(1,∞)` of a normal functional `T↦Tr(ρT)`, ρ trace class (VonNeumannAlgebras V4)", with the same rank-one argument.
- **Checks:** the Checks at 772–781 can stay as Examples of the consumed trace.

## R03 (P2) — S_p for 0<p<1, Hölder's inequality and the weak Schatten classes on B(H) have two owners: NoncommutativeIntegration's head says this roadmap consumes them

Location: README 718–733 (the quasi-ideal `S_p={T compact : Σ_j μ_j(T)^p<∞}`, the p-triangle inequality, the ideal and adjoint bounds, completeness, the majorization and Hölder), 906–916 (`L^(p,∞)`), Scope 75–80 and Downstream 1401–1404; the description.

Claim: N3–N4 own these on B(H). NoncommutativeIntegration's §1.5 is only a comparison with them.

Witness: NoncommutativeIntegration at head 10a56146 (`TauCetiRoadmap/NoncommutativeIntegration/README.md`) says the opposite:
- Lines 25–28: on B(H) these classes "are these spaces … not a second construction on a sequence model".
- Lines 1474–1477: "NoncommutativeGeometry N3–N4 consume Layer 1 (I1) … and do not rebuild it".

Main's copy of this README (line 59) did consume I1. This pull request reversed that, as it did for `A_θ`. The direction is forced: a scratch copy that cites `NoncommutativeIntegration §1.5` in N3's `*Needs:*` gives `UPWARD: NoncommutativeGeometry (on main) -> NoncommutativeIntegration (#298) at README lines [894]`.

Repair (the README needs no edit):
- The description names #864 and the merge order.
- #864 rewrites its 25–28, §1.5 375–378 and Downstream 1474–1477. They should say that on B(H) its Layer 1 compares with N3's S_p and Hölder and with N4's weak classes, and drop "consume Layer 1 … do not rebuild it".
- The description's revision-dependency line ("which merge first: #864") must agree with the order chosen. If #864 merges first, it must already carry the corrected text.

## R04 (P3) — The description describes an earlier head and states no order with #1187, #864 or #866

Location: the pull-request description (carried from r11 R02, r10 R05 and r9 R03).

Claim: only the README changes and `Suggested.lean` is unchanged; the swapped reduction is `x×_K5 y`; N2 keeps AlgebraicKTheory as its A0–A3 supplier.

Witness:
- `git diff --stat origin/main...HEAD` shows `Suggested.lean | 141 +-`.
- README 840 writes the swapped reduction `x⊠_s y`.
- Neither the supplier table (284–290) nor N2's `*Needs:*` (678) cites AlgebraicKTheory.
- `scratch/overlaps.md`: #1187 conflicts in this folder's `Suggested.lean`; #1187's copy is main's old file (`namespace NoncommutativeGeometry`, `CyclicTwoCocycle`).

Repair:
- Rewrite the description to match this head.
- State that #1187's change to this file is superseded and that #1187 rebases after this pull request.
- Add the ordering paragraphs of R01 and R03, and of R06 if adopted.

## R05 (P3) — Scope and Downstream assign comparisons to OperatorKTheory that it excludes, and understate what CompactQuantumMetricSpaces consumes

Location:
- Scope 43–45: "…whose comparison with the pairings of N2, the Fredholm modules and index pairing of N3 and the torus classes of N6–N7 is that roadmap's".
- Downstream 1397–1400: "It compares its C*-K-groups … with N2's pairings …".
- Downstream 1388–1389: "CompactQuantumMetricSpaces consumes N6's smooth two-torus".

Witness:
- OperatorKTheory head 1377338a, line 892: "The smooth-algebra differential calculus and its cyclic cohomology are outside this roadmap". Line 1818 excludes "the smooth rotation algebra and its cyclic cocycles". No target there compares with N2, N3 or N7.
- CompactQuantumMetricSpaces head 7db4c193, lines 286–292, consumes N5, N6 and N7. Line 1578 has `*Needs:* 6.1, 4.3, 4.5; NoncommutativeGeometry N7`.

Repair:
- Delete the clause at 43–45 and the sentence at 1397–1400. No roadmap plans these comparisons, and this roadmap cannot own them because citing OperatorKTheory is UPWARD (R01).
- Change 1388–1389 to "CompactQuantumMetricSpaces consumes N5's spectral triples, N6's rotation algebra and smooth torus, and N7's trace-GNS space and Fourier triple".

## R06 (P3) — N1.Tensor is restricted to ℂ, although the pinned carrier and its universal property hold over every normed field

Location: Scope 16–22 ("The same construction for real locally convex spaces … are stated by SmoothBanachRepresentations §7.2a and are not planned here"); N1.Tensor 320–321 ("Work over ℂ on complex Hausdorff locally convex spaces").

Claim: the real completed projective tensor is a separate construction, owned by SmoothBanachRepresentations.

Witness: at the Tau Ceti pin, `Analysis/Normed/Module/PiTensorProduct/Projective/Completion.lean` declares `CompletedProjectiveTensorProduct` (line 54, `lift` 100, `map` 139) under `[NormedField 𝕜]` (line 31). `…/UniversalProperty.lean` declares `CompletedProjectiveTensorProduct.liftEquiv` (122) under `[NontriviallyNormedField 𝕜]` (108). So the real construction is the pin's. SmoothBanachRepresentations at 41f719f2 (lines 9 and 456–466) plans N1.Tensor's laws again for ℝ.

Repair:
- State N1.Tensor's added laws for `RCLike 𝕜`; Hahn–Banach is available over both fields. These are: identity and composition of `map`, associativity, scalar units, finite sums, Fréchet completeness and metrizability, and the Banach comparison with B4.
- In Scope, say that the real case is these same targets and that SmoothBanachRepresentations §7.2a owns only the complexification isomorphism and the balancing quotient.
- The ℂ-bilinearity Check (358–363) stays.
- #1145's line 9 and §7.2a then cite N1 for both fields; the description names that change.

## R07 (P3) — "only `traceFreePart`" misdescribes the pin

Location: README 251–253 ("The pin has no trace functional on trace-class operators, only `traceFreePart`"); `Suggested.lean` 26–27 ("and only the trace-free part of an operator").

Witness: `Analysis/InnerProductSpace/Trace/Free.lean` 137–141 defines `traceFreePart` as `T − (finrank)⁻¹·LinearMap.trace T·Id`. On an infinite-dimensional H, both `LinearMap.trace` and `finrank` are 0, so `traceFreePart` is the identity there. The module docstring (line 14) restricts it to finite-dimensional spaces.

Repair: write "the pin has the trace only in finite dimension (`LinearMap.trace`, `TauCeti.traceCLM`) and no trace functional on trace-class operators" in both places. With R02, the README sentence then names VonNeumannAlgebras V4.Core as the owner.

## R08 (P3) — Four Connes locators carry the wrong section label

Location:
- References 1414–1416: "Chapter IV §1: p-summability … Definition 3, p. 296; matrix amplification, Proposition 2, p. 295".
- References 1421: "the Tauberian criteria, Propositions 3–4, pp. 312–313".
- N3 828–829: "Connes IV.1, Proposition 4, p. 303 … with the amplification of Proposition 2, p. 295".

Witness:
- `connes94`: §1 begins at line 11203 (p. 298). Proposition 2 (line 11082, p. 295) and Definition 3 (line 11135, p. 296) sit in Chapter IV's introduction, and Connes cites the former as "Proposition 0.2" (line 11371).
- IV.1 Proposition 2 is the compatibility with S (line 11282, p. 300).
- IV.2 Proposition 3 (line 11765) lists properties of `Tr_ω`; the Tauberian criterion is Proposition 4 alone (line 11789).

Repair:
- References: "Chapter IV, introduction: matrix amplification, Proposition 2 (Proposition 0.2), p. 295; p-summability and the Hölder corollary, Definition 3, p. 296".
- References: "IV §2: … Definition 2, p. 312; the properties of `Tr_ω`, Proposition 3, pp. 312–313; the Tauberian criterion, Proposition 4, p. 313".
- N3 line 829: "Proposition 0.2, p. 295".

## R09 (P3) — The Morita headline is stated beyond its locator: Connes proves the case R = M = ℂ

Location: `Suggested.lean` 52–57 and README 479–484 ("for a unital algebra A over a commutative ℚ-algebra R, coefficients in an R-module M … (Connes 1985, Part II, Corollary 24, p. 113)").

Witness: `connes85` lines 1884–1885: Part II's cyclic cohomology is that of algebras over ℂ, with complex-valued (n+1)-linear functionals. Corollary 24 (lines 2592–2594, p. 113) is stated in that setting. Neither file gives a locator or a route for a general ℚ-algebra R and module M.

Repair: keep the statement, which holds. In README 479–484, say that Corollary 24 is the case R=M=ℂ and name the route for the stated generality:
- the corner inclusion and φ↦φ#Tr are mutually inverse on Hochschild cohomology by the explicit trace homotopy;
- the five lemma along the pinned SBI sequence then gives every degree, by induction from `HC⁰=HH⁰`;
- this uses naturality of that sequence under the matrix extension, which commutes with b, B and the cyclic operator at the pin (`RingTheory/CyclicCohomology/Matrix.lean` 434, 522, 588).

## Previous findings

- **r11 R01 (`A_θ` two owners): not repaired.** The folder is unchanged. OperatorKTheory has moved to 1377338a and still builds `A_θ` (1782–1798) and lists this roadmap as its consumer (2324–2326). Carried as R01.
- **r11 R02 (description, order with #1187): not repaired.** The description text is the one r11 read. Carried as R04.

## Verified sound

**Gate and dependency check (run this round at 1847a9a).**
- `gate … --base origin/main`: every scanner 0, `OK` (the same as `scratch/gate.md`).
- `gate --depcheck … --movable`: `depcheck: 236 roadmaps, 2419 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Scratch copies, each with one extra `*Needs:*` item:
  - `OperatorKTheory §7.4`: UPWARD (R01).
  - `NoncommutativeIntegration §1.5`: UPWARD (R03).
  - `VonNeumannAlgebras V4.Core`: 0 problems (R02).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The folder holds `README.md`, `Suggested.lean` and the generated `PROGRESS.md`, `STATUS.md` and `metadata.toml`.
- A policy scan of both files (process words, pull-request numbers, LaTeX, `lemma`, "optional"/"deferred") finds nothing.
- Declared gaps: none, and none needed.

**Lean at the pins.**
- `lake env lean` on `Suggested.lean`: exit 0, with the single warning `declaration uses 'sorry'` (line 58).
- Scratch `#check @bijective_matrixExtension` gives `∀ {R} [CommRing R] [Algebra ℚ R] {A} [Ring A] [Algebra R A] {M} [AddCommGroup M] [Module R M] (ι) [Fintype ι] [DecidableEq ι] [Nonempty ι] (n : ℕ), Function.Bijective ⇑(TauCeti.cyclicCohomology.matrixExtension M ι n)`. This equals `signatures.md` and README 479–484; no binder is lost and nothing changed.
- One-tactic probe (`first | simp | rfl | infer_instance | exact?`): `exact?` could not close the goal, so the headline is not padding.
- The pin has only cochain-level injectivity (`matrixCochainExtension_injective`, `Matrix.lean` 292), so the headline is not a library theorem.
- Form: a `module` header, `import Mathlib` plus `TauCeti.RingTheory.CyclicCohomology.Matrix`, `theorem`, and no `set_option`, data or `lemma`.

**Headline theorems** (README 8–12). Matrix Morita invariance (N1) is stated. The other headlines are named in the docstring with what each lacks, and I checked each reason at the pin:
- N3's character index theorem: no infinite-dimensional trace (but see R07).
- N5's Hochschild-class theorem: no Borel calculus of an unbounded operator, and `dixmierTrace` is real-valued (`DixmierTrace.lean` 91, `dixmierTrace_modulus` 226).
- N6's periodic and Hochschild computations: `SmoothNoncommutativeTorus` has instances up to `Ring` (`Basic.lean` 453) and no topology or derivation.
- N7's index and values: no Heisenberg module.

**Library declarations opened at the pins (44).**
- Tau Ceti, cyclic theory:
  - `RingTheory/CyclicCohomology/Matrix.lean`: `matrixExtension` 497, `matrixCochainExtension_unique` 174, `…_hochschildCoboundary` 434, `…_cyclicOperator` 522, `…_connesB` 588.
  - Universal forms: `UniversalForms` (`UniversalDifferential/Complex.lean` 45), `UniversalForms.ι` (`DGAlgebra.lean` 121), `cycleCocycle_trace` (`UniversalDifferential/Cycle.lean` 305).
  - Cycles and cohomology: `IsClosedGradedTrace` (`CyclicCohomology/Cycle.lean` 84), `cycleCocycle` (279), `exteriorProductCocycle` (`ExteriorProduct.lean` 70), `cyclicCocycles` (`Cohomology.lean` 92), `hochschildCohomology` (`HochschildCohomology/Complex.lean` 166), `periodicCyclicCohomology` (`PeriodicCohomology.lean` 119), `continuousCyclicCohomology` (`Continuous/Cohomology.lean` 239).
  - `selfEquiv` (`GroundRing.lean` 297, with `IsSMulRegular M 2`); `traceDerivationCocycle` and `traceDerivationPairCocycle` (`Derivation.lean` 120, 209).
- Tau Ceti, pairings and K-theory: `evenPairing` (`EvenPairing/Basic.lean` 93), `evenPairingK0` (`EvenPairing/AlgebraicK0.lean` 141), `oddPairing` (`OddPairing/Basic.lean` 106), `AlgebraicK1.oddPairing` (`OddPairing/AlgebraicK1.lean` 77), `ExactK0` (`CategoryTheory/GrothendieckGroup/Exact.lean` 179), `AlgebraicK1` and `StableGeneralLinearGroup` (`LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean` 314, 155).
- Tau Ceti, operator ideals and Dixmier traces:
  - Families: `OperatorIdealFamily.schatten` (`Schatten.lean` 48), `traceClass` (`TraceClass.lean` 59), `logarithmic` and `kyFanLogMean` (`Logarithmic.lean` 163, 79).
  - `dixmierTrace` (`DixmierTrace.lean` 91): `log(1+N)` normalisation, value 0 outside `L^(1,∞)`.
  - Generalized limits (`Analysis/Normed/Order/GeneralizedLimit.lean`): `GeneralizedLimit` 76, `IsDilationInvariant` 177, `exists_isDilationInvariant` 309.
- Tau Ceti, Fredholm and resolvent theory:
  - `isFredholm_one_add` 72, `IsFredholm.add_of_isCompactOperator` 87, `index_add_of_isCompactOperator` 137 (`CompactPerturbation.lean`).
  - `IsFredholm.eventually_isFredholm_and_index_eq` (`SmallPerturbation.lean` 57).
  - `Continuous.index_eq_of_preconnectedSpace` 74 and `Path.index_eq` 81 (`ContinuousFamily.lean`).
  - `LinearPMap.HasCompactResolvent` (`Topology/Algebra/Module/LinearPMap/Resolvent/Compact.lean` 68).
- Tau Ceti, smooth torus (`SmoothTorus/Basic.lean`): `SmoothNoncommutativeTorus` 230, `twist` 180 (`𝐞(θ·y₂z₁)`, the README's `exp(2πiθnm′)`), `U₁` 542, `U₂` 548, `U₂_mul_U₁` 561, `trace` 602 (`a.coeff 0`).
- Tau Ceti, other: `derivationLieAlgebra` (`Algebra/Lie/Derivation/Basic.lean` 118); `CompletedProjectiveTensorProduct`, `liftEquiv` and `reindex` (R06; `Reindex/Completion.lean` 41); `traceFreePart` (R07).
- Mathlib:
  - `CStarModule A A` with `inner x y := y * star x` (`Analysis/CStarAlgebra/Module/Constructions.lean` 79–85) and `inner_op_smul_right` (`Module/Defs.lean` 79), which confirm the N7 opposite-algebra Check.
  - `PositiveLinearMap.GNS` and `gnsStarAlgHom` (`GelfandNaimarkSegal.lean` 147, 246).
  - `LinearMap.index` (`Algebra/Module/LinearMap/Index.lean` 39); `IsFredholm` 123, `FredholmPackage` 178 and `IsFredholm.index_comp` 613 (`Analysis/Normed/Operator/Fredholm/Basic.lean`).

**Cross-roadmap citations resolved now.**
- On main 87608f1:
  - OperatorIdeals: OI-A17 (150), OI-A20 (156), OI-A22 (159), OI-A30 (196), OI-B29–B30 (349–350).
  - OperatorAlgebraDynamics D1 (75), D2 (143), D4 (254); BanachSpaceTheory B4 (239).
  - BanachAlgebras: A1–A8 as layer labels (181), Layer 4 (1121), Layer 6 (1379).
  - SelfAdjointSpectralTheory SA-E01–E02 (1202–1206); RandomMatrices §8.3 (984); VonNeumannAlgebras V4.Core (972–981, R02).
- At their heads:
  - OperatorKTheory 1377338a (45–53, 198–200, 892, 1773–1830, 2324–2326; R01, R05).
  - NoncommutativeIntegration 10a56146 (18–30, 360–385, 1474–1477; R03).
  - SmoothBanachRepresentations 41f719f2: line 9 matches Scope 16–22 (R06); line 11 records N6 as owner of the torus identification, the seminorm comparison and inverse closure, and Layer 8 (507–550) states only generic theorems, matching Scope 81–86 and Downstream 1381–1387.
  - HeisenbergImprimitivity a9eeb6ec (15, 52, 183, 492, 786, 794): consumes N6's `A_θ` and trace and N7's module, as Downstream 1389–1391 says.
  - SpectralManifolds b1e8fb72 (7, 21): consumes N1–N2 and N4–N5.
  - CompactQuantumMetricSpaces 7db4c193 (R05).
- `roadmaps resolve`: nothing missing. `overlaps.md`: no dropped ids and no ids that only a revision defines; #1187 as in R04.

**Sources.** The worker's seeded sample of 15 is the same draw as r11's (same head, same seed). I read all 26 distinct locator targets of the README and `Suggested.lean` at the cache, so the sample is covered:
- Connes III.1 (`connes94`):
  - Propositions 3–4, pp. 190–191 (lines 6905, 6933–6945): universal forms over Ã⊗A, and cycles ⇔ closed graded traces.
  - Theorem 12, p. 197 (7223): cup product.
  - Lemma 14, p. 198 (7274–7278): `Sφ=(n+3)⁻¹A(σ#φ)`.
  - Theorem 26, p. 208 (7650): the SBI triangle.
- Connes III.2 (`connes94`):
  - Proposition 5, p. 217 (7980–7985): H⁰=ℂ for irrational θ; dimensions 2 and 1 under the Diophantine condition; infinite-dimensional and non-Hausdorff without it.
  - Theorem 7, p. 218 (7998–8008): H^ev and H^odd ≅ℂ² for all θ, with bases Sτ, φ and φ₁, φ₂, and `δ_j(U^ν)=2πin_jU^ν`.
- Connes III.3 (`connes94`):
  - Proposition 2, p. 229 (8469–8472): the even pairing.
  - Proposition 3, p. 230 (8493–8496): the odd pairing with `1/√(2i)`.
  - The proof of Proposition 3, pp. 230–231 (8501–8520): the product law.
- Connes IV, introduction and §1 (`connes94`):
  - Introduction (R08): Proposition 2, p. 295 (11082–11100); Definition 3, p. 296 (11135–11148).
  - §1: Proposition 1, p. 299 (11252) and `Tr′` (11242); cyclicity on dual classes, p. 300 (11262); Proposition 2, p. 300 (11282); Definition 3, p. 302 (11346–11347); Proposition 4, p. 303 (11376–11379).
- Connes IV §2 (`connes94`): Definition 2, p. 312 (11754–11760); Proposition 3, p. 312 (11765–11771); Proposition 4, p. 313 (11789–11793); Theorem 8, p. 315 (11865–11873).
- Connes IV §6 and Appendix C (`connes94`):
  - IV §6, pp. 356–357 (13549–13560): the module `ξ·U₁=ξ(s+θ)`, `ξ·U₂=e^(2πis)ξ`, `∇₁=−2πisξ/θ`, `∇₂=d/ds`, θ∈]0,1].
  - pp. 358–361: Theorem 3, cited for comparison only.
  - Appendix C, p. 453 (17381–17404): `L^(p,q)` norms and `‖T‖_(1,∞)=sup σ_N/log N`.
- `connes85`:
  - Part I, Appendix 2, Proposition 5, p. 91 (lines 1802–1808; cache page 52 = printed 91).
  - Part II, Corollary 24, p. 113 (2592–2594; cache page 74 = printed 113; R09).
- `fack-kosaki`: Theorem 4.2(i)–(ii), p. 286 (605–607); Theorem 4.9(iii), p. 295 (863–881; cache page 28 = printed 295).

Every page number matches. Every hypothesis matches the README's use, except the section labels (R08) and the generality of the Morita headline (R09).

**Adversarial pass.** I recomputed the values this round (scratch `py/adv12.py`, pure Python; random complex matrices with seed 12).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `bijective_matrixExtension` (Lean 58; README 479–484) | ι=∅; ι=Fin 1; A=M=R=ℚ, ι=Fin 2, n=0; R=ℤ (excluded) | ι=∅: `M_∅(A)=0`, `HC⁰(0;M)=0` vs `HC⁰(ℚ;ℚ)=ℚ`, so `[Nonempty ι]` is needed and present; Fin 1: φ#Tr=φ (`matrixCochainExtension_unique`); n=0: traces of M₂(ℚ) are ℚ·Tr, matching ℚ; `[Algebra ℚ R]` excludes ℤ, where the cyclic complex does not compute HC; probe fails | true, not padding | R09 (locator) |
| Ground-ring contract (207–216) | R=ℤ, M=ℤ/2; n=0…5 | the coefficient of b on ℂ-constant cochains is `Σ_(j≤n)(−1)^j+(−1)^(n+1)` = 0,1,0,1,0,1; so b: odd→even is the inclusion of M[2], `HC^(2k)=M⧸M[2]=0` (k≥1), `HC⁰=M` | true | none |
| N1 Koszul count (500–505) | m=1…5; m=2 shuffles | `∏_(k≤m)[2k,2]_(q=−1)` = 1,2,6,24,120; shuffle signs of two pairs +,−,+,+,−,+, sum 2; unsigned count 6 | true | none |
| N1/N2 odd constants (466–471, 626–628) | k=0…4 | `k!/((2k+1)!√π)` = `2^(−(2k+1))Γ(k+3/2)⁻¹`: 0.56419, 0.09403, 0.00940, 6.7165e−4, 3.7314e−5 on both sides | true | none |
| N2 smooth Bott (593–598, 658–665) | z=0, 0.7−0.3i, 1.5+2i | `Tr(p dp∧dp)`: 2.0000i, 0.80115i, 0.03805i = `2i(1+|z|²)⁻²`; `∫r(1+r²)⁻²dr=0.50000`; pairing 1.00001 | true | none |
| N3 Hardy calibration (802–807) and Connes' sign | F=2P−1, forward shift | `τ₁=2`; README `λ₁=−(1+i)Γ(3/2)=−0.88623(1+i)`, pairing −1.000 = `ind(PuP)` = −1; Connes' `√(2i)` constants give `(1/√(2i))·½·(2/√π)·(√(2i)√π/2)·2=+1` | README true; source sign issue below | none |
| N3 Clifford reductions (837–864) | Pauli; `W=(σ₁−σ₂)/√2`; random scalars | W²=1, Wσ₁W=−σ₂, Wσ₂W=−σ₁, Wσ₃W=−σ₃; `Tr₂(σ₃[D,a][D,b])=2i(A₁B₂−A₂B₁)` true; `((1+i)√π)²/(2πi)=1.000`; `(−1)(2i)/(4π)=−0.159155i=1/(2πi)` | true | none |
| N3 point cycle (871–877) | ℂ²⊕ℂ², a=0.7+0.2i | F²=1, Fγ=−γF; `Tr′(γπ(e))=1.000`; `π(e)H⁺=eℂ²` has dimension 1 and `π(e)H⁻=0`, so the index is 1 | true | none |
| N3 index on idempotents (821–829) | quasi-inverse | `π(e)Fπ(e)·π(e)Fπ(e)=π(e)+π(e)F[π(e),F]π(e)` ≡ π(e) mod compacts on π(e)H; `connes85` 1806–1807 gives the same parametrix | true | none |
| N3 Schatten Checks (746–781) | as stated | `μ(T)=(1.618,0.618)`, `μ(ST)=(2.921,0.685)`, `0.685>0.618`; `‖S+T‖_(1/2)=9>5`, with p-th powers 3≤3; `‖ST‖₁=4≤5`, `‖I₂‖₁=2` | true | none |
| N3 trace (734–743) | — | duplicates VonNeumannAlgebras V4.Core (972–981) | — | R02 |
| N4 `L^(1,∞)∖S_(1,∞)` (952–958) | j<7·10⁴ | non-increasing: true; max `(j+1)μ_j=6=2k` at k=3 (unbounded in k); max `σ_N/log(1+N)=2.485` (bounded) | true | none |
| N4 ω-dependence (961–973) | 60 blocks | `r_(2k)→0.66667`, `r_(2k+1)→0.83333`; log-Cesàro along N_(2k): 0.743683 = `2/3+(log 2)/9`; along N_(2k+1): 0.756317 = `5/6−(log 2)/9` | true | none |
| N4 Appendix C constant (908–913) | `μ_j=(j+1)^(−1/2)`, N=10⁶ | `N^(−1/2)σ_N=1.99854<2=p/(p−1)` | true, sharp | none |
| N4 Tauberian bridge (975–979) | Connes IV.2 Prop 4 | the iff between `(s−1)ζ(s)→L` and the log means → L, for `0≤T∈L^(1,∞)` (11789–11791) | true | R08 (label) |
| N4 non-normality (936–940) | domain of Tr_ω | `Tr_ω` is defined on `L^(1,∞)` only; "normal on B(H)" is not applicable | ill-posed as written | R02 |
| N5 Checks (1034–1057) | D=diag(0,1,−1); D=diag(j) | `(D−i)⁻¹=diag(i,(1+i)/2,(−1+i)/2)`, `K=diag(1,½,½)`, `F_D=diag(0,0.7071,−0.7071)`; `Σ j/(j+1)³<∞` while `Σ(1+j²)/(j+1)³=∞` | true | none |
| N6 projection replacement (1145–1153) | random rank-2 idempotent in M₄(ℂ) | e²=e, e≠e*; `ez=ze=ee*e`; p²=p, p*=p, ep=p, pe=e; `ss′=1`, `ses⁻¹=p`; Tr e = Tr p = 2.000 | true | none |
| N6 Check (1204–1210) | `e=[[1,a],[0,0]]`, a=1 | `((e+e*)/2)²=[[1.25,0.5],[0.5,0.25]]`; `ee*=diag(2,0)`; z=2 | true | none |
| N6 seminorm comparison (1134–1141) | θ=0, a=1+U₁ | `|a_rs|≤‖a‖` and `|(2πr)^k a_rs|≤‖δ₁^k a‖` give `Q_k≤C_kP_k`; `Σ(1+|r|+|s|)^(−3)=1+Σ_n 4n(1+n)^(−3)<∞` gives `P_m≤D_mQ_(m+3)`; Q₀=1, P₀=2 | true | none |
| N6 cohomology (1212–1230) vs Connes III.2 | irrational, Diophantine or not; all θ | dimensions 1,2,1 and non-Hausdorff as in `connes94` 7980–7985; HP ≅ ℂ², ℂ² with Connes' bases (7998–8008) | true | none |
| N6 ordering Checks (1181–1200) | θ=½, m=n=1; a=U₁, b=U₂U₁⁻¹ | `exp(2πiθnm′)=−1` on both products; `a_(0,1)(ab)=e^(−2πiθ)` ≠ 1 = `a_(0,1)(ba)`; ev₁∘E gives `e^(2πiθ)` vs 1 | true | none |
| N7 Fourier modes (1252–1258, 1342–1347) | (m,n)=(2,−3); r²=0,1,2,5,25 | `D²=513.219=4π²·13`; D⁺ entry `12.566+18.850i=2π(m−in)`; lattice counts 1,4,4,8,12 (doubled: 2,8,8,16,24) | true | none |
| N7 `Tr_ω(|D|⁻²)=1/(2π)` (1261) | R=100, 300 | `σ_N−(1/π)log R`: 0.13096, 0.13093 (constant); `N/(2πR²)`: 1.00003, 0.99984; `σ_N/log N`: 0.1445, 0.1470, converging logarithmically to 0.15915 | true | none |
| N7 odd pairings (1305–1319) | j,k∈{1,2}; θ=0.37 | `ν_j(U_k)`: 1, 0, 0, 1; `V₊S=e^(2πiθ)SV₊` and `SV₋=e^(2πiθ)V₋S` for k∈[−5,5); the compression of S has kernel e₋₁ and cokernel 0, index +1 | true | none |
| N7 Heisenberg (1272–1291, 1360–1365) | θ=0.3; s=−0.8, 0.37, 1.1 | chiral operator on `e^(−πs²/θ)`: −1.4e−12, −8.7e−11, −1.2e−15; `[∇₁,∇₂]=20.944i=2πi/θ`; `∇₁(ξU₁)−(∇₁ξ)U₁=2πiξU₁=ξδ₁(U₁)`; `(ξU₂)U₁=e^(2πiθ)(ξU₁)U₂` | true | none |
| N7 joint map (1294–1305) | [1]; Heisenberg | [1]↦(1,0); `τ_E(1)=θ` with curvature `2πi/θ` gives `(2πi)⁻¹·(2πi/θ)·θ=1`, so the module ↦ (θ,1) | true | none |
| `CStarModule` Check (1327–1333) | e₁₂, e₁₁ | `x*y=e₂₁`, Mathlib `y·x*=0` (Constructions.lean 80) | true | none |
| N1.Tensor Checks (346–370) | ℓ¹, ℓ², ℂ | representation cost `2·1+1·1=3`; `‖Σ_(i<n)e_i⊗e_i‖_π=n` vs √n; 1⊗i and i⊗1 give −i vs i | true | R06 (generality) |
| Docstring "only traceFreePart" (Lean 26–27; README 251–253) | infinite-dimensional H | `LinearMap.trace=0` and `finrank=0`, so `traceFreePart=id` | misleading | R07 |

## Not verifiable

- Elaboration of `Suggested.lean` at #1187's Tau Ceti pin (ab00ba392), which is not checked out in this worktree (R04).
- The OCR of `connes85` Corollary 24 garbles the cohomology symbol ("H^(J^) … H\W"). I read it as cyclic cohomology `H*_λ` in each degree, since the cycle transfer of Corollary 23 (lines 2586–2591) preserves dimension. Under the periodic reading, the fixed-degree headline would need the route R09 asks for in any case.

## Source issues

- **Error** in connes94 at Chapter IV §1, Definition 3, p. 302 (odd case) with Proposition 4, p. 303: the source says its odd normalisation, paired by III.3 Proposition 3, equals the index of `EuE`; it should carry an extra factor −1. On the Hardy module with the forward shift it gives +1 while the index is −1. Affects a stated result.
