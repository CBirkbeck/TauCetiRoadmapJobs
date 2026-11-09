# Review of QuantumGroups (pull request #1705 at 7c3e850)

**Verdict:** needs changes

This is a full review of the head the previous review read. Nothing in the folder or outside it has changed since that review. Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise. Sources are cited as `<id> line N` in the worker's cache.

## R01 (P2) — 140 of the README's 143 Tau Ceti names do not exist at the branch's pinned Tau Ceti, and the `Suggested.lean` docstring contradicts itself about that pin

**Location:** the branch's `lake-manifest.json` pins Tau Ceti `358314d4`, Mathlib `f6090c70` and toolchain `v4.35.0-rc3`. Main pins `2fd255d9`, `1b1ccf4b` and `v4.36.0-rc2`. The affected text is the `From Tau Ceti` contract (`:155`–`:192`), the Tau Ceti citations of §§3.1, 3.3 and 4.1 (`:675`–`:686`, `:759`–`:766`, `:882`–`:886`), all of Layer 8, and `Suggested.lean:24`, `:26`–`:34`, `:66`–`:69` and `:70`–`:77`.

**Claim:** every Tau Ceti declaration the folder cites exists at the pinned Tau Ceti.

**Witness:** `358314d4` has none of `TauCeti/QuantumGroups/`, `Algebra/Coalgebra/Star.lean`, `Algebra/HopfAlgebra/{Star,Cancellation}.lean`, `Comodule/Finite/{Monoidal,RightRigid,Rigid}.lean` or `Algebra/Category/FiniteHopfModuleCat/`. Of the README's 143 backticked `TauCeti.*` names, 140 are absent there. All 143 exist at `2fd255d9`.

**Detail.** The gap is wider than the previous review recorded. It reaches §§3.1, 3.3 and 4.1 as well as Layer 8:

- §§3.1 and 4.1 cite `TauCeti.StarCoalgebra`, `TauCeti.HopfAlgebra.antipode_star_antipode_star`, `antipode_bijective`, `antipodeAlgEquivOp` and the three cancellation equivalences.
- §3.3 cites `Finite/RightRigid`.
- `Suggested.lean:24` names `comul_star` of `TauCeti.StarCoalgebra ℂ A` as the source of `hΔ`.

At `2fd255d9` these are `Algebra/Coalgebra/Star.lean:46`/`:49`, `Algebra/HopfAlgebra/Star.lean:65`, `:85`, `:93`, and `Cancellation.lean:72`, `:149`, `:178`.

The docstring now makes three claims that no single pin satisfies:

- `:26`–`:34` says "Proved in the pinned Tau Ceti and not restated: the Layer 8 algebra `TauCeti.UqSl2` …". This is false at `358314d4`.
- `:66`–`:69` says "the pins supply recoupling only for triple products (`TauCeti.UqSl2.clebschGordanRecouplingEquiv`)". This is also false at `358314d4`.
- `:76` says "the pinned Tau Ceti has none of these modules". This is false at `2fd255d9`, the pin the folder will have once merged.

**Repair:**

1. Merge `origin/main` into the branch. The branch changes neither `lake-manifest.json` nor `lean-toolchain`, so the merge brings main's pins. Then re-run the gate with its build.
2. At `2fd255d9` the §8.5 sphericity headline becomes statable from real-bodied carriers:
   - `TauCeti.FiniteHopfModuleCat.rigidCategory` (`Algebra/Category/FiniteHopfModuleCat/Rigid.lean:146`), fed `TauCeti.UqSl2.antipode_bijective` (`QuantumGroups/UqSl2/Antipode.lean:73`);
   - `TauCeti.FiniteHopfModuleCat.unitEvalNatIso` (`…/Pivotal.lean:119`) and `unitEvalNatIso_isMonoidal` (`:221`), both at `g = (kUnit q)⁻¹`, using `TauCeti.UqSl2.antipode_antipode` (`Antipode.lean:59`), `comul_kInv` and `counit_kInv` (`Hopf.lean:192`, `:208`);
   - the two-field class `TauCeti.PivotalCategory` (`CategoryTheory/Monoidal/Pivotal/Basic.lean:76`).
3. Add the `TauCeti.*` imports, a local rigid and pivotal structure built from these, and `theorem uqSl2_sphericalCategory (q : ℂ) [Fact (q ≠ 0)] (hq : q - q⁻¹ ≠ 0) : TauCeti.SphericalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q))`.
4. Delete `:70`–`:77`, list the headline under "Stated here", and name the new declarations in §8.5. Elaborate with `lake env lean` after the merge.

Until the merge, no folder file needs to change.

Re-raised: R01 of the previous review. No repair report lists it as not actionable, and the head is unchanged.

## R02 (P2) — §§0.2–0.3 have a second owner in each of two open roadmaps

**Location:** `:33`–`:42`: "Section 0.2 is the single home of C*-categories … §0.3 is the single home of the unitary Temperley–Lieb category … CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras Layer 3 … consume these objects from §§0.2–0.3". Also `:1795`–`:1801`.

**Claim:** §§0.2–0.3 have a single owner, and the two named roadmaps consume them.

**Witness:** CategoricalOperatorAlgebras (#888, head `136b93af`), `README.md:44`–`:46`: CA1a and CA2a "have their single home here; QuantumGroups consumes CA1a and CA2a". TemperleyLiebOperatorAlgebras (#867, `ba43cc7a`), `:72`–`:75`: "Layer 3 are the single home of the positive Temperley–Lieb completion".

**Detail.**

- #888 `:2303`–`:2309` lists QuantumGroups as consuming "the balanced unitary dual functor, signed self-duality, standard solutions and intrinsic dimension".
- #867 `:72`–`:76` claims the unitary Temperley–Lieb category "with its standard solutions, simple objects and fusion rules", and says roadmaps that need it "consume them from here".
- QuantumGroups #1649 (`9b3ff6c`) assigns the same objects to CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras ("owned later in the build by …, from which nothing is imported here").

Each side names the other as its consumer. That is the P2 case of an object two roadmaps each hand to the other.

This head's allocation is the right one. QuantumGroups is on main, so it is earlier than both open roadmaps (merge-order lines 229 and 245). A roadmap on main may not name an open roadmap as a supplier, and main's own QuantumGroups (`README.md:42`–`:43`) still does exactly that. The defect is the missing coordination: neither side says the other must change.

**Repair:** state in this pull request's description:

- §0.2 and §0.3 own these objects;
- #888 (`:40`–`:46`, `:2303`–`:2309`, and its CA2a construction of the balanced dual functor) and #867 (`:72`–`:76` and its Layer 3) are to cite QuantumGroups §0.2 and §0.3 instead of building them;
- #1649's Layer 0 scope paragraph is superseded.

No folder file changes.

Re-raised: R02 of the previous review.

## R03 (P3) — The description describes a different head, and no order is stated against the conflicting #1649

**Location:** the title "QuantumGroups: construct the ribbon category RepUqg" and the description's "Add Q9 to build `RepUqg`", "Prerequisites: #1125 and #1124 must merge first" and "Only the roadmap README changes".

**Claim:** the description matches the head, and no other open revision of the folder conflicts with it unannounced.

**Witness:** this head has no Q9, no `RepUqg` and no braiding (no match in the README), and it changes `Suggested.lean`, which has four headlines. The overlap listing reports that #1649 (`9b3ff6c`) "and #1705 conflict in `README.md`, `Suggested.lean`". Neither description names an order.

**Repair:**

- Retitle and redescribe the pull request for what the head is: Layer 0 foundations, Layers 1–7, Layer 8 on Tau Ceti's rank-one theory, and four `Suggested.lean` headlines.
- Drop the #1125/#1124 prerequisites.
- State which revision prevails (close #1649, or rebase one onto the other), in the same paragraph as R02's ownership sentence.

No folder file changes.

Re-raised: R03 of the previous review.

## R04 (P3) — §8.7's locator credits Virelizier Example 3.3 with a Laurent form it does not give

**Location:** `:1780`: "Virelizier Example 3.3 gives the Laurent form of the ladder."

**Claim:** the source gives the ladder matrices of §8.7 with Laurent-polynomial entries.

**Witness:** `virelizier` lines 552–554 (p.11) use the basis `F^i v_0` and write the E-coefficient as a quotient, `(q^(n−2i+2)−q^(−n))(q^(2i)−1)/((q−q⁻¹)(q²−1))`, which is `0/0` at q=1. Line 348 assumes q is not a root of unity throughout.

**Detail.** The quotient equals `[i]_q[n−i+1]_q`, so the module is right, but neither the basis nor the Laurent form is in Example 3.3. The source's divided-power ladder is in §4.1, p.13 (`virelizier` lines 638–642). There `w_i = F^i w_0/(i)_q!`, with `(t)_q = (q^(2t)−1)/(q²−1) = q^(t−1)[t]_q`, and the action is `F w_i = (i+1)_q w_{i+1}` and `E w_i = q^(1−n)(n−i+1)_q w_{i−1}`. Every entry lies in `ℤ[q,q⁻¹]`, and the README's basis is `v_i = q^(i(i−1)/2) w_i`.

**Repair:** replace the sentence with: "Virelizier §4.1, p.13, gives the ladder in the divided-power basis `w_i` with entries `(i+1)_q` and `q^(1−n)(n−i+1)_q` in `ℤ[q,q⁻¹]`; the symmetric basis here is `v_i = q^(i(i−1)/2) w_i`, and the specialization at v=1 is derived here."

Tested at n=2:

- §4.1 gives F-coefficients `1, 1+q²` and E-coefficients `q+q⁻¹, q⁻¹`. At q=1 these are `1, 2` and `2, 1`, which is §8.7's classical Check.
- With `v_2 = q w_2`, `F v_1 = (1+q²)q⁻¹ v_2 = [2]_q v_2` and `E v_2 = q·q⁻¹ w_1 = v_1`, which are §8.2's ladder formulas.

## Previous findings

- **R01: not repaired.** The pins are unchanged (`358314d4`, `f6090c70`, `v4.35.0-rc3`). This review finds the gap wider than recorded: 140 of the 143 README `TauCeti.*` names are absent at the branch pin, including the Hopf *-algebra facts of §§3.1 and 4.1. Carried as R01.
- **R02: not repaired.** `:33`–`:42` is unchanged, #888 at `136b93af` still says "have their single home here; QuantumGroups consumes CA1a and CA2a" (`:44`–`:46`), and #867 `:72`–`:75` still claims Layer 3 as single home. Carried as R02.
- **R03: not repaired.** The description still reads "Add Q9 to build `RepUqg`" and "Prerequisites: #1125 and #1124", and #1649 (`9b3ff6c`) still conflicts in both files with no stated order. Carried as R03.

## Verified sound

**Head, gate and order.**

- **Head:** `7c3e850a`, clean worktree. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The folder diff against main touches only `README.md` and `Suggested.lean`; `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's.
- **Gate:** I re-ran `gate … --base origin/main` on this head. Every check is 0 and the result is `OK`. The worker's gate on the same head records `build=0`.
- **Dependency check:** the unmodified output of the required command is `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Suppliers:** every supplier the README names is on main (TemperleyLieb, Subfactors, VonNeumannAlgebras, HilbertModules, CStarAlgebras, RepresentationTheory/CompactGroups, RepresentationTheory/LieHighestWeight, OperatorAlgebraDynamics, FreeProbability, AmenableGroups, PivotalSpherical), as a roadmap already on main requires. CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras appear only as consumers.
- **Policy scan:** the README has no LaTeX, pull-request numbers, process words, "optional"/"deferred", machine paths or `lemma`.
- **Shape:** all 29 subsections carry a Checks block, with 3–6 bullets each (0.1:4, 0.2:5, 0.3:4, 1.1:5, 4.1:5, 8.1:6, 8.5:5, the rest 3). There are 30 *Needs:* lines, and every layer ends with Examples and Dependencies.

**Elaboration, signatures and padding (branch pin).**

- `lake env lean` on `Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at `:121`, `:153`, `:164` and `:174`.
- I put `#check @` for all six declarations, plus `AlgebraicHaar.positive`, in one scratch copy and elaborated it. The types match `scratch/signatures.md`.
  - `AlgebraicHaar` and `unitaryCoefficientSet` omit `[StarModule ℂ A]`, which none of their fields or bodies use.
  - Every theorem carries `Ring`, `HopfAlgebra ℂ`, `StarRing`, `StarModule ℂ` and `hΔ` in its own signature. `schur_orthogonality` also carries `IsSimpleOrder (Subcomodule)` and `hu`, and `compactType_iff` carries `Nontrivial A`.
  - This matches the README's generality: "every Hopf *-algebra with an `AlgebraicHaar`" (`:888`–`:890`) and "nonzero Hopf star algebra" (`:899`).
- The one-tactic probe `first | rfl | infer_instance | trivial | simp | decide | exact ⟨_, rfl⟩` fails on all four headlines, so there is no padding.
- `coefficientMatrix` (`Comodule/MatrixCoefficient/Matrix.lean:68`) is `c(eⁱ, eⱼ)`, a column convention matching `δ(e_j)=Σ_i e_i⊗u_ij` (`:93`). The comodule tensor product (`Comodule/TensorProduct.lean`) is `m⊗n ↦ m₀⊗n₀⊗m₁n₁`, so its entries are `u_ij v_kl`, as the Conventions say.

**Headlines.** The README's headlines and how each is handled:

- **Stated:** `schur_orthogonality` (§3.1), and `compactType_iff`, `haar_modular_automorphism` and `haar_trace_iff_antipode_involutive` (§4.1).
- **Named in the docstring as not statable, with the missing carrier:**
  - Haar existence and uniqueness, Peter–Weyl, the completions and coamenability, `SUq(2)` and `O_F^+`, Tannaka–Krein, and the Layer 7 fusion and Haar laws: all lack the minimal C*-tensor product or Hilbert-module operators.
  - §§3.2–3.4: lack `F^z` and the C*-tensor category.
  - The §8.5 pentagon: needs channel coordinates on quadruple products. This is accepted as not statable without a long encoding.
  - §8.6: lacks `C(SUq(2))`.
  - §8.5 sphericity: R01.

**Seeded sample, checked at the locators.**

- **0.1:** `kustermansvaes` lines 162–200 (p.840) give strict maps' unique strictly continuous extension to `M(A)→M(B)` and leg numbering `x_13`. Lines 739–744 (p.853) give Definition 2.1, the bi-C*-algebra.
- **0.2:** `longoroberts` line 389 (Lemma 3.3, p.10: same left inverse iff unitary transport), line 621 (Theorem 3.8, p.15: product of standard is standard), line 681 (Theorem 3.11, p.17: `R*R R̄*R̄ ≥ d²` with equality iff a multiple is standard) and line 2000 (Appendix, p.48).
  `nt` lines 1427, 1446, 1458, 1501 and 1596 cover Definitions 2.2.10 and 2.2.12, Proposition 2.2.13 and Theorems 2.2.14 and 2.2.17 (printed pp.32–35; extraction pages 36–39, minus 4).
  `nt` lines 1633 and 1655 are Theorem 2.2.19 and Remark 2.2.20 (pp.36–37). `nt` line 3236 is Definition 2.7.1 (p.70), with the remark at lines 3240–3241 giving `d(U)≥1`; the equality case is argued in the README.
- **0.3:** `penneys` lines 745, 758, 941 and 1000 are Proposition 4.5.3, Facts 4.5.5 and Examples 4.6.12 and 4.6.14. Printed pp.158, 159, 163 and 164 equal the extraction pages plus 140; the footer "164" is at line 1016.
  `nt` lines 2408–2431 cover §2.5 and `R̄=−τR` on p.52, and lines 2478–2500 the existence for `d≥2` or `d=2cos(π/k)`, `k≥4`, on p.54.
- **4.1:** `nt` lines 447–450 (Theorem 1.4.2, p.9: `h(u_kl u_ij*)=δ_ki ρ_jl/dim_q` and `h(u_ij* u_kl)=δ_jl(ρ⁻¹)_ki/dim_q`, so `F̃=ρᵗ` is exact), line 810 (Theorem 1.6.6, p.18), lines 977–978 (Theorem 1.7.3, p.22: `h(ab)=h(bσ_{−i}(a))`), lines 1036–1040 (Proposition 1.7.7, p.23: trace iff `S²=ι`) and line 1034 (`S²=τ_{−i}`, used in 3.4).
- **4.3, 5.1:** `bmt` line 257 (Theorem 2.2, p.6), line 461 (Theorem 2.8, p.10), line 478 (Corollary 2.9, p.11) and line 858 (Theorem 3.6, pp.18–19). Lines 592 and 614–645 put `0<|q|<1` (p.13) and the weighted shift and Corollary 2.13 (pp.13–14).
- **6.1, 6.3:** `malacarne` lines 285–291 (Theorem 4.1, p.5): existence, and uniqueness of `(C[G],Δ)`. The finite sums and subobjects convention is at line 290.
- **8.1, 8.3, 8.4, 8.7:** `virelizier` lines 348–359 (§2.3 and Proposition 2.4, p.8). Its coproduct `ΔE=K⊗E+E⊗1`, `ΔF=1⊗F+F⊗K⁻¹`, `S(E)=−K⁻¹E`, `S(F)=−FK` and `S²=Ad(K⁻¹)` match `:1418`–`:1422`. Line 537 (§3.2: type 1) and lines 625 and 635 (Theorem 3.13 and Corollary 3.14, p.13) also check out. For 8.7, see R04.
- **2.3, 3.2, 3.3, 3.4, and 5.1's Timmermann:** see Not verifiable. Their mathematics is computed in the table below.

**Cross-roadmap citations resolved on main (`3090489`), 33.**

- VonNeumannAlgebras: V13b.SpatialNorm `:70`, V4.Core/PositivePredual/Normality `:244`, V10.ModularTheory `:2364`, V10.KMS `:2459` (convention `σ_t(x)=Δ^(it)xΔ^(−it)`), Layer 11 full left Hilbert algebras and Tomita's theorem `:2794`–`:2805`, Layers 0, 1 and 3 `:275`, `:392`, `:905`.
- CStarAlgebras: C1.7 `:468`, C1.CommutativeMultiplierMorphisms `:497`, C5.1 `:1112` (flip, associativity, functoriality with norm bounds), C5.2 `:1143` (`C₀(X)⊗min A≅C₀(X,A)`, `C(X)⊗min C(Y)≅C(X×Y)` with pullback naturality).
- HilbertModules: H1 `:126`, `:157`, `:165`; H2 `:179`, `:204`–`:213` (`K_A(H⊗A)≅K(H)⊗min A`, `L_A(H⊗A)≅M(K(H)⊗min A)`); H3 `:262`.
- Subfactors: §§3.1–3.3 `:676`, `:697`, `:774`; `markovTrace_nonneg_iff` `:729`.
- TemperleyLieb: Layer 4 presentation `:554`; Layer 6 negligible ideal and Goodman–Wenzl `:713`–`:724`.
- PivotalSpherical: Layers 0–2 `:257`, `:283`, `:318`; Layer 7 `:477`–`:490`; trace formulas `:329`–`:330`.
- FreeProbability: F1, F3, F6 `:127`, `:255`, `:307`, `:532`.
- AmenableGroups: Layers 1, 5, 7 `:98`, `:289`, `:415`.
- OperatorAlgebraDynamics: D1, D2 `:148`, `:221`.
- RepresentationTheory: CompactGroups `su2Irrep` `:190`; LieHighestWeight Layer 0 `:319`.
- Downstream: QuantumEnvelopingAlgebras `:181`–`:185` (Q8 item 1) and HopfologicalAlgebra `:36`–`:41`, `:165` (Q8 item 5) both match `:211`–`:215`; CStarAlgebras `:1957` matches the supplier table.
- No roadmap on main or at an open head cites a `TauCetiRoadmap.QuantumGroups.*` Lean name (`roadmaps grep`), and the overlap listing reports no dropped id in either direction.

**Library declarations opened.**

- **Tau Ceti `2fd255d9`:** `Algebra/Coalgebra/Star.lean:46`, `:49`, `:91`; `Algebra/HopfAlgebra/Star.lean:65`, `:85`, `:93`; `Cancellation.lean:72`, `:149`, `:178`; `InverseAntipode.lean:36`; `FiniteHopfModuleCat/{Basic:107,227,234; RightRigid:123; Rigid:69,146; Pivotal:119,221}`; `CategoryTheory/Monoidal/Pivotal/{Basic:76,187; Trace:88,93; Spherical:69}`; `QuantumGroups/UqSl2/{QuantumTrace:41; LadderModule/Basic:407,589,607; TypeOne:253,349,370; LocallyFinite:104,115; Center:103,129,187; ClassicalSpecialization:115,193,664; Star:202,213; Antipode:59,73; Hopf:192,208}`; `Algebra/OreExtension/SkewPolynomial.lean:61`, `:148`. This is 49 locations; a namespace-aware search finds all 143 README names.
- **Tau Ceti `358314d4`:** `MatrixCoefficient/Matrix.lean:68`, `:173`; `Comodule/Fixed.lean:57`; `Convolution.lean:49`; `LinearlyReductive.lean:104`; `Algebra/TemperleyLieb/Basic.lean:132`.
- **Mathlib (both pins):** `GelfandNaimarkSegal.lean:147` (`GNS`), `:246` (`gnsStarAlgHom`); `GelfandDuality.lean` (`gelfandStarTransform_naturality`, `compContinuousMap`); `Topology/ContinuousMap/Ideals.lean` (`homeoEval`); `RepresentationTheory/Rep/Iso.lean` (`equivalenceModuleMonoidAlgebra`); `Algebra/SkewPolynomial/Basic.lean`; `Algebra/WithConv.lean:28`; `CStarMatrix.lean`; `RingTheory/HopfAlgebra/Convolution.lean` (`antipode_mul_antidistrib`); `RingTheory/Coalgebra/GroupLike.lean`; `CompletelyPositiveMap.lean` (`instCompletelyPositiveMapClass`); `Spectrum.lean` (the two eigenspace lemmas). `RingHom.powersMulSemiringAction` is Tau Ceti's (`SkewPolynomial.lean:61`), as the README's wording allows.
- No main-pin Tau Ceti declaration already gives the U_q pivotal or spherical instance (its `SphericalCategory` instances are the symmetric and centre ones), so §8.5's targets are not duplicates.

**Ownership.** By object, I searched the sibling checkouts of #888, #867 and #1015 (NoncompactQuantumSymmetry, which owns locally compact group representations, not quantum groups), #1649 via `roadmaps show`, and `roadmaps grep` for "Biedenharn" and for U_q pivotal or spherical structures. Only QuantumGroups (main, #1649 and #1705) carries the pentagon and the U_q pivotal or spherical structure, so Layer 8's owned targets have no second owner. The §§0.2–0.3 conflict is R02.

**Adversarial table** (q=1/2 unless stated; "ok" means both sides agree as computed).

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 legs `U_12U_13=(id⊗Δ)U` | H=ℂ, A=C(C₂), sign u | `(id⊗Δ)u=u⊗u`; `(u⊗1)(1⊗u)=u⊗u`; two ι₂ legs give `1⊗u²=1≠u⊗u` | ok | none |
| 0.1 isometry only for injective φ | φ=ε, T=1[s] | `‖T‖=1`, `T_ε=ε(1[s])=0` | ok | none |
| 0.1 W is σ-semilinear | y=1⊗1, c=u⊗1 | `W(yc)=1⊗u`, `W(y)c=u⊗1` | ok | none |
| 0.2 C*-identity | T=diag(2,1) | `‖T†T‖=4=‖T‖²`; Hilbert–Schmidt gives `√17≠5` | ok | none |
| 0.2 standard vs rescaled | ℂ², (2R, R̄/2) | squared norms 8 and 1/2, norm product `√8·√(1/2)=2=d`; left and right traces scale by 4 and 1/4, so not standard (LR Thm 3.11: minimum up to scalars) | ok | none |
| 0.2 `d≥1`, equality iff invertible | SU_(1/2)(2) fundamental; a character | `d=5/2`, `(5/2)²=25/4=1+21/4` with `[3]=1/4+1+4`; character `d=1` | ok | none |
| 0.2 composite `(ι⊗R_X⊗ι)R_Y` standard | Hilb_f, ℂ²⊗ℂ³ | `‖composite‖²=6=d(X)d(Y)`; the tensorator permutes orthonormal bases | ok | none |
| 0.3 cup, projection, reflection | d=5/2 | `‖∪‖²=5/2`, `tr₂(p)=1/d²=4/25`, `tr₂(1−p)=21/25`; linear reflection `⟨i∪,i∪⟩=−5/2` | ok | none |
| 0.3 truncated fusion | m=3; m=4 | d=1, `min(2, 2·1−2)=0` so `1⊗1=0`; d=√2, `[4]=d³−2d=0`, dimensions 1, √2, 1 | ok | none |
| 0.3 sign comparison | δ=−5/2 | `e=δp`, `e²=δ²p=δe`; `pp′p=δ⁻²p=4/25 p` | ok | none |
| 2.3 regular corepresentation | right invariance; C₂; S₃; trivial group | `⟨δΛa,δΛb⟩=(h⊗id)Δ(a*b)=h(a*b)1`; dims 1+1=2, 1+1+4=6; `Λ(2)↦2⊗1` | ok | none |
| 3.1 `schur_orthogonality` | SU_(1/2)(2), `F̃=diag(2,1/2)=ρᵗ` | `h(a*a)=(1/2)/(5/2)=1/5`, `h(c*c)=2/(5/2)=4/5`, `h(aa*)=4/5`, `h(u₁₂u₁₂*)=q²·4/5=1/5=(1/2)/(5/2)`; NT `(ρ⁻¹)_ki=(F̃⁻¹)_ik` | ok | none |
| 3.1 normalization Check | character, F̃=2 | `Tr 2=2≠1/2=Tr 2⁻¹` | ok | none |
| 3.2 Plancherel, characters | a+c; f_z on a | `1/5+4/5+0+0=1`; `f₁*f₁(a)=4=f₂(a)`; Vandermonde `[[1,1],[1,4]]`, det 3 | ok | none |
| 3.2 `θ=f₁*·*f₁` | u fundamental | `θ(u)=FuF`, `θ(a)=4a`, `h(a*θa)=4/5=h(aa*)`; `ε∘θ(u)=F²=f₂(u)` | ok | none |
| 3.3 dual metrics | right dual ū, left dual `F̃ūF̃⁻¹`, double dual `FuF⁻¹` | `ū*F̃ū=F̃`; `F̃⁻¹ū*F̃·F̃⁻¹·F̃ūF̃⁻¹=F̃⁻¹`; `F⁻¹u*F·F⁻²·FuF⁻¹=F⁻²` | ok | none |
| 3.3 pivotal traces | F=diag(2,1/2), f=diag(1,0) | `tr F=tr F⁻¹=5/2`; `tr(Ff)=2`, `tr(F⁻¹f)=1/2` | ok | none |
| 3.4 modular and scaling groups | a, c | `σ_(−i)(a)=4a`; `τ_(−i)(c)=(1/2)c(1/2)=c/4=q²c=S²(c)`; `σ_t(c)=(1/2)^(it)2^(it)c=c` | ok | none |
| 4.1 `compactType_iff` | ℂ; ℂ[C₂]; zero ring; ℂ[x] | true/true; `h((a+bu)*(a+bu))=|a|²+|b|²`; span=⊤ but `h(1)=h(0)=0≠1`, excluded by `Nontrivial`; `x+h(x)≠h(x)1` and the only unitary group-like is 1, so false/false | ok | none |
| 4.1 `haar_modular_automorphism` | ℂ[S₃]; SU_(1/2)(2); uniqueness | θ=id; θ(a)=4a vs θ⁻¹ giving 1/20; `x=θa−θ′a`, `h(x*x)=0⇒x=0` | ok | none |
| 4.1 `haar_trace_iff_antipode_involutive` | ℂ[S₃]; SU_(1/2)(2) | `δ_(gk,e)=δ_(kg,e)`, `S²=id`; `h(a*a)=1/5≠4/5=h(aa*)` and `S²(c)=c/4≠c` | ok | none |
| 4.3 coamenability | ℤ; F₂ | Følner ratio `2/(2N+1)`; `‖Σλ‖=2√3≈3.46<4=ε(Σ)` | ok | none |
| 5.1 relations iff unitarity | entries of `u*u`, `uu*` | `a*a+c*c`, `q²cc*+aa*`, `ac−qca`, `ac*−qc*a`, `cc*+a*a`; the first and last give `c*c=cc*`; q=1/2, a=0, c=1: `1/4≠1` | ok | none |
| 5.1 antipode | c, c* | `S(c)=−c/2`, `S(c*)=−2c*`, `S²(c)=c/4` | ok | none |
| 5.2 cup invariance | u=FūF⁻¹, uu*=1 | `X(F⁻¹)ᵗ=I` gives `Σ_(j,l)u_ij F_lj u_kl=F_ki`; F=I gives `uuᵗ=1` | ok | none |
| 5.2 signed cup | F=[[0,1],[−2,0]] | `FF̄=−2I`, `E=−2e₀⊗e₁+e₁⊗e₀`, `‖E‖²=5`, `J(e₀)=−√2e₁` | ok | none |
| 6.1 reconstruction | Rep(C₂); Rep(S₃) | dim 2; `1+1+4=6` vs diagonal 4 | ok | none |
| 6.3 cancellation ⇒ group | monoid {1,0}; C(C₂) | `0·1=0·0` with `1≠0`, so `(x,y)↦(x,xy)` is not injective; Haar 1/2 each | ok | none |
| 7.1 Haar moments | q=1/2; q=±1 | `1/(1+q²)=4/5`, `(1−q²)/(1−q⁶)=16/21`; 1/2, 1/3 | ok | none |
| 7.1 q=−1 model | a=√(1−t)zσ₃, c=√t wσ₁ | `ac=−ca`, `a*a+c*c=1`, `ac*=−c*a`; at t=0, z=1: a=σ₃, c=0 | ok | none |
| 7.2 normal form | F=[[0,1],[−q⁻¹,0]] | `FF̄=−q⁻¹I`, d=5/2; intrinsic dims 1, 5/2, 21/4, 85/8 | ok | none |
| 8.1 PBW sign, relations | KF; L₁⁺ | `KF=q⁻²FK=4FK`; `EF−FE=diag(1,−1)=diag(−3/2,3/2)/(−3/2)` | ok | none |
| 8.2 ladders | L₂⁺; L₁⁻ | weights 1/4, 1, 4; `[2],[0],[−2]=5/2,0,−5/2`; L₁⁻: `diag(3/2,−3/2)/(−3/2)=diag(−1,1)` | ok | none |
| 8.3 Casimir | L₀⁺, L₁⁺, L₂⁺ | `(5/2)(4/9)=10/9`, `(17/4)(4/9)=17/9`, `(65/8)(4/9)=65/18`; mixed ordering diag(8/9,26/9) | ok | none |
| 8.4 type 1 vs local finiteness | L₀⁻; Verma M(1) | K=−1 ∉ {2^(−k)}; weights 4^j, F not locally nilpotent | ok | none |
| 8.5 Clebsch–Gordan | m=n=j=1; Δ(E²) | `α₁=−q=−1/2`, top coefficient `1/2−1/2=0`; `q[2]=5/4=1+q²` | ok | none |
| 8.5 pivotal traces and sphericity (R01) | L₁⁺; L₀⁻; q=±1 with ℂ, K=2 | `tr K⁻¹=5/2=tr K`; −1 and −1; right trace 1/2 vs left trace 2 | statement ok; statability R01 | R01 |
| 8.6 invariant metric | m=1 | `h₁=q=1/2`, `⟨Ev₁,v₀⟩=1=q⁻¹h₁`; orthonormal entries √2 and 1/√2, commutator diag(1,−1) | ok | none |
| 8.7 classical ladder | m=2 | F 1, 2, 0; E 0, 2, 1; `[E,F]=diag(2,0,−2)`; `v_j↦C(2,j)w_j` | ok | none |
| 8.7 locator (R04) | Virelizier Ex. 3.3 at q=1 | the source's E-coefficient `(0·0)/(0·0)`; §4.1 at n=2: `1, 2` / `2, 1` | locator wrong | R04 |
| `Suggested.lean:24` cites `StarCoalgebra` (R01) | Tau Ceti `358314d4`; `2fd255d9` | absent; `Algebra/Coalgebra/Star.lean:46` | fails at branch pin | R01 |
| §§0.2–0.3 single owner (R02) | #888 `:44`–`:46`; #867 `:72`–`:75` | both claim the objects; QuantumGroups `:33`–`:42` claims them too | fails | R02 |

## Not verifiable

- **Timmermann**, *An Invitation to Quantum Groups and Duality* (EMS 2008), is `uncertified` (paywalled) and is cited by locator alone. These locators were not opened:
  - Theorem 5.1.6 (§1.2), Definition 5.1.4 and §5.3 (§2.1), Theorem 5.3.3 (§2.2), Propositions 5.3.7–5.3.8 (§2.3);
  - Propositions 3.2.9 and 3.2.17 and Theorem 5.4.1 (§3.1), Theorems 3.2.19, 5.4.3 and 5.4.5 (§§3.2, 3.4), §§3.2 and 5.4 (§3.3);
  - Proposition 2.2.4, Remark 2.2.2(iv)(c) and Theorem 3.2.12 (§4.1), and Chapter 6 §2 (§§5.1, 7.1, 8.6).

  Wherever a statement also has an open-source locator, I checked it there (Neshveyev–Tuset, Bédos–Murphy–Tuset). The mathematics is computed in the table above.
- **Elaboration at main's pins:** the Lean commands this review may run use the branch's pins only. The sphericity statement in R01's repair is therefore checked by reading the declarations at `2fd255d9`, not by elaborating it.
- **Descriptions of #888, #867 and #1649** were not read. Their README texts were read at the heads named in R02 and R03.
- **Ownership against open pull requests** was checked against the sibling checkouts the brief lists, `roadmaps grep`/`show` and the overlap listing. Pull requests outside those were not searched.

## Source issues

- none
