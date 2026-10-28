<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1642#issuecomment-6399892297 -->
Review (claude) of 96a72c9

Verdict: needs_changes

1. **F01** (P2) SRU.4.8 proof route: compact centre does not make the Bernstein component of σ a singleton

   **Location.** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md` line 1009 (proof route of 4.8): "the component of σ is {σ ⊗ ψ : ψ unramified}, which for compact centre is {σ} up to isomorphism; … For an irreducible unitarizable π, π(f) ≠ 0 iff π is in the component of σ and π^K ≠ 0, iff π ≅ σ."

   **Claim.** For `G` with compact centre, every irreducible unitarizable `π` with `π(e ∗ 1_K) ≠ 0` is isomorphic to `σ`, so `{[σ]}` is open.

   **Witness.** `G = PGL₂(ℚ_p)`, compact centre. The README's own 4.5 example `χ(g) = (−1)^{v_p(det g)}` is a nontrivial unramified character of `G`, so `X_nr(G) ≠ 1`. Take `σ` a supercuspidal of `GL₂(ℚ_p)` with trivial central character attached to a ramified quadratic extension `E`; then `σ ⊗ χ ≇ σ` (a dihedral `σ` is fixed only by the quadratic character of its own extension, and `χ_{E/ℚ_p}` is ramified while `χ` is unramified), `σ ⊗ χ` has trivial central character, lies in the Bernstein component of `σ`, and `(σ ⊗ χ)|_K = σ|_K` since `χ|_K = 1`. Hence `(σ⊗χ)(e ∗ 1_K) ≠ 0` and the displayed set `{x : rep x (f) ≠ 0}` is `{[σ], [σ⊗χ]}`, not `{[σ]}`. The intermediate claim is false; the component is the finite set `{σ ⊗ ψ : ψ ∈ X_nr(G)}` up to isomorphism (finite because `X_nr(G)` is finite when the centre is compact).

   **Repair.** Replace the sentence by: the component of `σ` is the finite set of classes `σ ⊗ ψ`, `ψ ∈ X_nr(G)`; the `H(G,K)`-modules `(σ⊗ψ)^K` for the finitely many pairwise non-isomorphic twists are simple and pairwise non-isomorphic, so by the density theorem used in SRU.3.2 (SR.1 corner-irreducibles, hecke-module-equivalence) there is `f ∈ e ∗ H(G,K)` with `σ(f) ≠ 0` and `(σ⊗ψ)(f) = 0` for every twist `σ⊗ψ ≇ σ`; then `{x : rep x (f) ≠ 0} = {[σ]}`. Add the negative-control Check: for `PGL₂(ℚ_p)` and a ramified-dihedral supercuspidal `σ`, `σ` and `σ ⊗ χ` lie in one Bernstein component with the same `K`-fixed vectors, so `e ∗ 1_K` alone does not isolate `[σ]`. Add `SR.1 / corner-irreducibles` to the *Needs:* line. Tested on the instance: with the separating `f`, `σ(f) ≠ 0`, `(σ⊗χ)(f) = 0`, and the open set is `{[σ]}`.

2. **F02** (P3) Extracted-line locators that point at the wrong passage

   **Location and witnesses** (README line in parentheses; all other locators I opened were correct, see Verified sound):

   - 0.8 (line 385) and sources.toml Cas95 entry: "§2.1, definition of P_K …, p. 20; Cas95 line 298". Cas95 line 298 is Proposition 1.2.1 on associate subsets (page 8). The definition of `P_K` is Cas95 line 744 (page 20).
   - 2.3 (line 661) and 2.5 (line 681): "Cas95 line 298" for Propositions 2.1.5/2.1.14–2.1.15. Proposition 2.1.5 is Cas95 line 760 (page 20); 2.1.15 is line 858 (page 23).
   - 3.1 (line 765): "§2.3, definition of the distribution character, p. 25; Cas95 line 327". Line 327 is Corollary 1.2.3; the definition is Cas95 line 964–968 (page 25).
   - 2.4 (line 675): "CH26, §6, before (6.2), p. 17; CH26 line 333". Line 333 is Definition 2.6 (pure Weil–Deligne representation); the passage is CH26 line 789–791.
   - 5.6 (line 1138): "CH26, §6, (6.5), p. 17; CH26 line 333". (6.5) is CH26 line 825.
   - 6.3 (line 1580): "CH26, Corollary 7.5, PDF p. 26; CH26 line 661". Corollary 7.5 is CH26 line 1268.
   - 7.1 (line 1642): "§3, Corollaire 3.9, p. 2189; Aub95 line 265". Line 265 is Théorème 2.3; Corollaire 3.9 is on page 2189, after the §3 resolution (the OCR of this page carries no theorem numbers; cite the printed page only).
   - 0.1 (line 153): "(BHV, Definition F.1.1, PDF p. 431; BHV line 16025)" is the definition of weak containment. The definitions of 0.1 are BHV Definition A.1.1 (unitary representation, BHV line 11667, PDF p. 80) and Definition A.1.7 (irreducibility, BHV line 11764).
   - 1.4 (line 476): "the characters χₙ ∈ P₁ tend weak-* to 0 (Riemann–Lebesgue), so P₁(G) is not weak-* closed (BHV Remark C.5.7)". BHV's text for non-closedness of `P₁(S¹)` is Exercise C.6.10 (BHV line 14649 and 14923); Remark C.5.7 (line 14812) is the Raikov non-example, which 1.5 cites correctly.

   **Repair.** Replace each line number as listed, in the README and in the Cas95 `locator` field of `sources.toml` (which repeats "extracted line 298" three times and "327" once).

3. **F03** (P3) Supplier citations that do not exist where cited

   **Location, witness, repair.**

   - 2.1 (lines 610, 612, 635): "SR.0 countable-schur" twice and the *Needs:* item `SmoothRepresentationsOfLocalGroups SR.0 abelian-category / countable-schur`. No target with that slug exists in SmoothRepresentationsOfLocalGroups (grep of its README at the open head: 0 hits; the SR.0.2 slugs are *compact-open-invariants*, *smooth-discrete-comparison*, *smooth-rep-abelian*, *smooth-rep-category*). Schur's lemma for irreducible smooth representations with countable compact-open coset spaces is stated in SR.3a.1 as an unslugged sentence (SmoothRepresentationsOfLocalGroups README line 2357). Repair: cite "SmoothRepresentationsOfLocalGroups SR.3a.1 (Schur's lemma for countable coset spaces)".
   - 3.1 (lines 744, 755): "EndoscopicTransfer ET.4" three times. The EndoscopicTransferAndUnitaryTraceComparison README has no section labelled `ET.4` (grep `ET\.[0-9]`: 0 hits); the character theorem is §2.16, which the *Needs:* line cites correctly. Repair: replace `ET.4` by §2.16.
   - 7.2 (lines 1650, 1652): "the semisimple parameter L^ss of ExcursionOperatorsAndSpectralAction ES5, compatible with parabolic induction (ES7:parabolic)" and "ExcursionOperators ES7:parabolic parabolic-induction … normalised-induction-dictionary". No roadmap `ExcursionOperatorsAndSpectralAction` (without Part II) exists on main, in any open roadmap pull request, in the merge order or among the board's packages (`roadmaps grep --fixed 'ES5'`: no match). The need is covered by the declared gap `gap:semisimple-parameter-cuspidal-support` on ExcursionOperatorsAndSpectralActionPartII SC4/SC3, which the *Needs:* line cites. Repair: cite the gap in the prose too and drop the `ES5`/`ES7` labels.

4. **F04** (P3) The pinned GL₂(𝔽_q) Steinberg representation must be cited

   **Location.** 4.1 (lines 891–919), Checks "For Γ = GL₂(𝔽₃), dim st_Γ = 3 and Ind_B^Γ 1 ≅ 1 ⊕ st_Γ" and the `### From Tau Ceti` contract (lines 53–69).

   **Witness.** `TauCeti/RepresentationTheory/CharacterTable/GL2/Steinberg.lean` at the pin: `TauCeti.GL2Steinberg : FDRep ℂ (GL (Fin 2) F)` (line 107), `TauCeti.finrank_GL2Steinberg : Module.finrank ℂ (GL2Steinberg F) = Fintype.card F` (line 130), `character_GL2Steinberg` (line 142), `character_GL2PrincipalSeries_one_one_eq_one_add` (line 172, the decomposition `Ind_B 1 = 1 + St`). The roadmap `RepresentationTheory/CharacterTheory` on main owns this GL₂ object (its README lines 173 and 488–490).

   **Repair.** List these declarations under `### From Tau Ceti`, and turn the GL₂(𝔽_q) Check into the agreement-with-the-library Check: for `𝐆 = GL₂`, the finite Steinberg of 4.1 is `TauCeti.GL2Steinberg F` and its degree `q = Fintype.card F` is `finrank_GL2Steinberg`. The general split-𝐆(𝔽_q) definition stays here (no other owner: grep of all open roadmaps for "Steinberg representation" finds only the p-adic one in SmoothRepresentationsOfLocalGroups SR.3.4 and consumers).

5. **F05** (P3) Process narrative and catalogue labels in the README

   **Location and witnesses.**

   - Line 43 (From Mathlib, `Submodule.orthogonalProjectionOnto`): "Replaced deprecated alias (line 124) by Submodule.orthogonalProjectionOnto." Process narrative with a local line number.
   - Line 159 (0.1 proof route): "the open NoncompactQuantumSymmetry roadmap M0". "open" is pull-request status.
   - Line 1809 (7.11 proof route): "the F₄, B₃ coordinate is corrected by comparison with Ciubotaru's F₄ classification (E5)". `E5` is an errata-register label, not a locator.
   - Line 1402 (5.27 proof route): "(half-integral-parameter, test halfIntegral_g2_all)". `halfIntegral_g2_all` is a Lean-looking test name declared nowhere.

   **Repair.** Delete the first sentence; write "NoncompactQuantumSymmetry M0"; replace "(E5)" by "(CiF4, §3.1 and the B₃ row of its table; see also the Examples below)"; replace the test name by the Check in prose ("every weight of every representation of G₂(ℂ) lies in the root lattice").

6. **F06** (P3) Style defects

   **Location and witnesses.** Line 254 (0.4): "the coefficient the coefficient π w v". Line 535 (1.7 API bullet): "the form in which the set-closure formulation of Proposition 11.6." is not a sentence. Line 859 (3.9 statement): "…a fixed Haar measure dg on G. with 𝐆 split simple." duplicates the hypothesis and starts a sentence in lower case. Spaces before full stops at lines 1035 ("unitarity is preserved ."), 1144 ("governed by U₀^g ."), 1386 ("g2-noncentral-witness ."), 1398 ("CS(G₂, 0) ."), 574 ("increasing subsequence ."), 1805 ("½ω₂ ≠ 0 .") and 362 ("the factor dim τ .").

   **Repair.** Delete the duplicated words, complete or delete the 1.7 bullet ("this is the set-closure formulation of Proposition 11.6"), merge the 3.9 clause into the hypothesis sentence, remove the stray spaces.

7. **F07** (P3) Two Checks name their data ambiguously

   **Location, witness, repair.**

   - 0.3 Check (line 244): "for the standard real two-dimensional representation and v a unit vector on a reflection axis, the Gram matrix at {e,(12)} is [[1,1],[1,1]]". This holds only if `v` lies on the axis fixed by `(12)`; for `v` on the axis of `(13)` the reflection `(12)` moves `v` by 120° and the Gram matrix is `[[1, −½],[−½, 1]]` (quadratic values `1` at `(1,1)` and `3` at `(1,−1)`). Repair: "a unit vector on the axis fixed by (12)".
   - 1.6 example (line 512): "for G = ℤ/2, σ the regular representation and π = 1 ⊕ sgn, σ ≺ π but the coefficient of (1, 1)/√2 in σ, the indicator of 0, is not a normalised coefficient". In the regular representation on `ℓ²(ℤ/2)` with basis `δ₀, δ₁`, `(1,1)/√2` is the invariant vector and its coefficient is the constant `1`; the indicator of `0` is the coefficient of `δ₀`. The SRU.0 Examples paragraph uses `(1,1)/√2` in the `1 ⊕ sgn` coordinates, where it is right. Repair: write "the coefficient of δ₀" here, or state the `1 ⊕ sgn` coordinates.

8. **F08** (P3) Needs-line and hypothesis hygiene

   - 5.9 (line 1196): the *Needs:* line lists `SRU.4 / howe-moore`, while the route says "Coefficient decay alone does not supply this exclusion" and uses signature forms. Either drop the item or say what Howe–Moore contributes.
   - `Suggested.lean` line 83, `mem_extremePoints_positiveTypeOne_iff`: `hunitary` and `hstrong` follow from `htranslation` and `hcont` (on features, `⟪π g Φa, π g Φb⟫ = K(ga, gb) = φ(a⁻¹b) = K(a,b)`; `‖Φ(ga) − Φ(a)‖² = 2 Re(φ(e) − φ(a⁻¹ga)) → 0`). They are harmless redundancies; keeping them is acceptable, dropping them is a simplification. No change required.
   - 7.12 (line 1821): "Adjoint half-integrality imposes two lattice possibilities … or all lie in ¼ + ½ℤ". The second case is empty: the E₈ roots `½(1,…,1)` and `½(−1,1,1,1,1,1,−1,1)` pair with `(0,0,ν₁,ν₁,ν₂,ν₂,−ν₃+ν₄,ν₃+ν₄)` to `ν₁+ν₂+ν₄` and `ν₁+ν₂+ν₃`, which with `ν₁ − ν₂ ∈ ½ℤ` force every `νᵢ ∈ ½ℤ`. CH26 §8.3 makes the same over-inclusive split, so the argument is sound; a one-clause remark would tighten it. No change required.

One blocking finding (P2): the proof route of SRU.4.8 rests on the false claim that a compact centre makes the Bernstein component of a supercuspidal representation a single isomorphism class. The theorem itself is true and the repair is local. Everything else is P3: wrong extracted-line locators, three supplier citations that point at sections or slugs that do not exist where cited, a pinned library declaration that should be cited, process narrative and labels, and two ambiguous Checks. The Lean file elaborates with `sorry` as the only warning, none of its six theorems is padding, and the dependency check reports no upward or cyclic edge.

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: exit 0 in 3 s, warnings only `declaration uses 'sorry'` at lines 71, 83, 108, 119, 131, 144 (the six theorems). Imports are `import Mathlib` plus `TauCeti.Analysis.PositiveDefinite.Kernel.Kolmogorov` and `TauCeti.RepresentationTheory.Continuous.Unitary.Basic`, both with object files at the pin. No `set_option`, no `lemma`, no `#eval`, no sorry'd data; 5 `def`s with real bodies, 6 `theorem`s, one module docstring naming the non-statable headlines.

**Signatures.** A scratch file with `#check @name` for all 12 declarations elaborated; every elaborated type agrees with `scratch/signatures.md` and with the README statement (0.1, 0.3, 0.4, 0.5, 0.7, 1.1, 1.2, 1.3, 1.5, 1.6). No section binder is lost: `godement`, `raikov` and `exists_coeff_approx_of_weaklyContainedIn` carry `[T2Space G] [LocallyCompactSpace G] [SecondCountableTopology G] [BorelSpace G] [μ.IsHaarMeasure]` as the README's "second-countable locally compact group with a left Haar measure"; the two Hilbert spaces of 1.6 carry `[CompleteSpace]`.

**Padding probe.** A scratch copy replacing each `sorry` by `first | rfl | (simp; done) | infer_instance | exact?` leaves all six goals open (six `exact?` failures, no closure). No theorem restates a definition, mirrors a Check or computes a value. Milman's converse (`extremePoints_closure_convexHull_subset_closure`) is not in Mathlib at the pin (only `extremePoints_convexHull_subset` for the algebraic hull, `Mathlib/Analysis/Convex/Extreme.lean` line 293, and Krein–Milman `closure_convexHull_extremePoints`, `Mathlib/Analysis/Convex/KreinMilman.lean` line 96) and in no open roadmap (grep "Milman" finds only Krein–Milman and Bierstone–Milman).

**Headline theorems.** From the Summary and Scope: Fell closure and isolated summands (1.8–1.10), smooth/unitary dual correspondence (2.6–2.7), Miličić and Tadić limits (3.3–3.4), Steinberg and supercuspidal isolation (4.7–4.8), Howe–Moore (4.5), the spherical unitary classification and its half-integral consequences (5.11, 5.23, 5.26, 5.27), nonsplit transfer (6.2–6.3), Aubert duality and Kazhdan–Lusztig parameters (7.1, 7.4), central-point unitarity and extraneous points (7.7, 7.10–7.12). Statable at the pins: the GNS theorem (0.5), pure-iff-irreducible (0.7), Milman's converse (1.2), Godement (1.3), Raikov (1.5), single-coefficient approximation (1.6); all six are stated. Every other headline needs the unitary-equivalence quotient and Fell topology, the reductive-group smooth categories, Hecke algebras and Satake parameters of SmoothRepresentationsOfLocalGroups, or Springer parameters, none of which exists at the pins; the docstring names each with its missing carrier. No statable headline is absent and none is forced through a stand-in.

**Dependency check.** `tauceti-roadmap gate --depcheck … --movable`: `depcheck: 52 roadmaps, 589 edges, 0 problem(s)`. No UPWARD or CYCLE line. The roadmap is at position 294 of the merge order; its suppliers SmoothRepresentationsOfLocalGroups (25), ReductiveGroupsPartII (23), SpringerResolutionAndCharacteristicCycles (70), AutomorphicSpectralTheory (94), EndoscopicTransferAndUnitaryTraceComparison (161), ExcursionOperatorsAndSpectralActionPartII (287) and LieHighestWeightPartII (293) are all earlier.

**Supplier citations resolved** (every cited section or slug opened at the head or on main):

- SmoothRepresentationsOfLocalGroups (open head): sections SR.0.1–0.4, SR.1.1–1.5, SR.2.1–2.3, SR.3a.1–2, SR.3.1–3.4, SR.4.1–4.2, SR.5.3 all present; slugs *van-dantzig*, *is-smooth*, *smooth-vectors*, *averaging-projector*, *compact-open-invariants*, *invariants-exact*, *smooth-dual*, *smooth-character*, *admissible*, *modulus-character*, *corner-irreducibles*, *hecke-module-equivalence*, *iwahori-matsumoto*, *bernstein-presentation*, *whittaker-functionals*, *mackey-filtration*, *geometric-lemma*, *parabolic-induction*, *induced-invariants*, *casselman-pairing*, *principal-series-jacquet*, *first-adjointness*, *borel-casselman-invariants*, *jacquet-module*, *jacquet-lemma*, *jacquet-invariants*, *langlands-classification*, *cuspidal-support*, *unramified-characters*, *bernstein-components*, *finite-type-corners*, *bernstein-centre-blocks*, *bernstein-decomposition*, *steinberg*, *finite-length*, *casselman-criterion*, *square-integrable-tempered*, *borel-casselman-block*, *cuspidal-splitting*, *cuspidal-representations*, *uniform-admissibility*, *admissibility-of-irreducibles*, *harish-chandra-tempered-support*, *satake-isomorphism*, *spherical-parameter*, *torus-character-dictionary*, *frobenius-component-invariants*, *highest-derivative-adapter* all found (1–18 hits each). Only *countable-schur* is missing (R03).
- ReductiveGroupsPartII (open head): RG2.0, RG2.3, RG2.4, RG2.5 and slugs *reductive-quotient-of-special-fibre*, *hyperspecial-vertices*, *cartan-decomposition*, *iwasawa-decomposition*, *pinned-automorphisms*, *galois-action-on-dual-group*, *langlands-dual-group* found.
- ReductiveGroups (main): Layer 2 (line 227) and Layer 7 structure theory (line 627). RepresentationTheory/LieHighestWeight (main): Layers 0, 2, 4 (lines 319, 370, 537). RepresentationTheory/CompactGroups (main) exists.
- OperatorTheory/PolarDecomposition (main): PD-B24 (line 373), PD-B34 (393), PD-B36 (397). BanachSpaceTheory (main): B5 (line 253; `C(K)` and finite-measure duality). OperatorAlgebraDynamics (main): scope with strong continuity convention (lines 10–30), D1 (75), D2 (143); D1 builds `ℂ ⋊ G ≃ C*(G)` and integrated forms but no GNS of positive `L¹` functionals, so `gap:integrated-l1-gns` asks for something not yet provided.
- NoncompactQuantumSymmetry (#1015, another author's new roadmap folder): "Shared group C*-algebra and weak-support comparisons" (line 41) defines `σ≺ρ` by C*-kernel inclusion and compares with coefficient weak containment (owned here); M0a (line 75); M0 (line 112) with the same strong-continuity and closed-invariant-subspace conventions, `P_τ = d_τ ∫ conj χ_τ π` (agrees with 0.8's factor `dim τ`) and the bounded unitary Schur lemma (line 208); M2.TypeIDisintegration (line 1003). `gap:finite-product-fell-duals` asks for a product theorem M2 does not state.
- CStarAlgebras (#860): C2 (line 199); no polynomial-identity or bounded-trace theorem in C2, so both C2 gaps are minimal. HilbertModules (#861): H5 constructs the unitary dual as pure states modulo equivalence (line 356). FactorRigidity (#876): R1 Fell topology for correspondences (line 80).
- EndoscopicTransferAndUnitaryTraceComparison (open head): §2.16 (line 1058) states finite rank, Harish-Chandra's theorem and the Weyl integration formula over characteristic-zero fields, with linear independence as a Check; no induced-character continuity, so `gap:induced-character-continuity` is minimal. AutomorphicSpectralTheory (open head): §7.0b (line 3717) owns the finite-place `GLₙ` unitary classification and residual Speh quotients.
- Design-stage board packages (in the merge order, `design/README.md` only): LieHighestWeightPartII N0–N5 (N5 "highest-weight test" at line 648 is exactly the test consumed in 5.25; N0 has Jacobson–Morozov and conjugacy but no reductive-centraliser or open-graded-orbit theorem, so `gap:triple-centralizers-and-orbit-tables` is minimal); SpringerResolutionAndCharacteristicCycles Layers S (line 638) and H (line 1058), no equivariant K-theory, so `gap:steinberg-equivariant-k-theory` is minimal; ExcursionOperatorsAndSpectralActionPartII SC3 (line 571) and SC4 (line 629), whose semisimple parameter is itself imported, so `gap:semisimple-parameter-cuspidal-support` is minimal. `gap:tempered-dual-local-topology` (SR.3.3 states tempered support but no topology) and `gap:pi-admissibility`, `gap:bounded-trace-character-limits` are precise, single-sentence and minimal. All nine gaps appear with the same slug in `design/plan.json` and in the README's supplier subsections.
- Ownership: GeometryOfNumbersAndQuadraticArithmetic §4.2.1 `howe_moore` is for connected almost-simple real Lie groups only; the p-adic Howe–Moore of 4.5 has no other owner. QuiverRepresentationsPartII excludes general Aubert duality (its line 11). ModularityAndLanglandsExtensions uses an "Aubert complex" only inside packet signs. No open roadmap defines the Kazhdan–Lusztig triples, the spherical unitary dual or the finite Steinberg for general split groups.

**Library declarations opened at the pin.** `Matrix.PosSemidef` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean` line 62: Hermitian and `∀ x : n →₀ R, 0 ≤ Σ star xᵢ Mᵢⱼ xⱼ`, so an infinite index type is allowed as the README says); `Matrix.PosSemidef.KolmogorovSpace`, `kolmogorovFeature`, `inner_kolmogorovFeature : ⟪Φ a, Φ b⟫ = K a b` (`TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean` lines 125, 132, 141; the second-linear direction the GNS coefficient needs), `kolmogorovFeature_dense` (170), `kolmogorovIsometry` (208), `kolmogorovEquiv` (278); `TauCeti.ContRepresentation.IsUnitary : ∀ g v w, ⟪π g v, π g w⟫ = ⟪v, w⟫` (`Unitary/Basic.lean` line 52), `subrepresentation` (109), `adjoint_eq_inv` (193); `matrixCoeff π hπ v w g = ⟪π g v, w⟫` with `hπ : Continuous π` (`MatrixCoefficient.lean` lines 73–80, the opposite slot and operator-norm hypothesis the README records); `ContRepresentation` (`Mathlib/RepresentationTheory/Continuous/Basic.lean` line 54: a monoid homomorphism into `V →L[R] V`, no orbit continuity); `TauCeti.IsPositiveDefiniteSub` (`AddGroup.lean` line 140, `AddCommGroup` only; the GNS file line 38 has the same hypothesis); `WeakDual.isCompact_closedBall` (`Mathlib/Analysis/Normed/Module/WeakDual.lean` line 269); `CompactlySupportedContinuousMap` (`Mathlib/Topology/ContinuousMap/CompactlySupported.lean` line 41). Nothing at the pins states positive type on a nonabelian group, strong continuity, topological irreducibility, the unitary dual, weak containment, the Fell topology, Raikov, Godement or Howe–Moore (grep of both libraries).

**Source locators verified at the text** (beyond those in R02): BHV lines 14301 (C.4.1), 14340 (C.4.3), 14433 (C.4.10), 14471 (C.4.13), 14570 (C.5.2), 14634 (C.5.3), 14642 (C.5.4), 14653 (C.5.5), 14690 (C.5.6), 14812 (C.5.7), 14817 (C.5.8), 16025 (F.1.1), 16089 (F.1.3), 16155 (F.1.4), 16219 (F.1.8), 16321 (F.2.1), 16333 (F.2.2), 16343 (F.2.4), 16349 (F.2.5), 16394 (F.2.6), 16976 (F.6.4), 11717 (A.1.4), 11925 (A.2.2); GS23 lines 1277 (§11 opening), 1287 (§11.1), 1303 (weak convergence), 1306 (Theorem 11.1), 1319 (Proposition 11.2), 1357 (Proposition 11.3), 1364 (Lemma 11.4), 1395 (Definition 11.5), 1398 (Proposition 11.6), 1425 (Corollary 11.7), 1179 (Proposition 10.5); Cas95 969 (Proposition 2.3.1), 760 (2.1.5), 858 (2.1.15); Cas80 432 (Proposition 3.5); HO 88 (Theorem 1.1), 103 (Corollary 1.2); BC1 25, 43, 724, 761, 784 (Theorem 3.3), 796 (G₂, F₄ regions), 2191–2254 (E-type rows and roots); BC3 124 (Theorem 1.3.1), 1272 (Corollary 6.2.6, Example 6.2.7); BCP 2694; CIK71 502 (Lemma 4.3, Theorem 4.4); CCLTV 18; GI18 1289 (Proposition A.2); Aub95 107 (Définition 1.5, Théorème 1.7), 265 (Théorème 2.3); Aub96 27; Ban02 246 (Theorem 3.1); CiF4 427 (Theorem 3.1); La24 790 (Definition 4.2, Theorem 4.3), 432 (`(T_s+1)(T_s − t^{2λ(s)}) = 0`, so `IM(T_s) = −q T_s⁻¹` at `λ = 1`); Kato81 229 (Theorem 2.2), 253 (Theorem 2.4); CH26 588 (Lemma 5.2), 563 (Proposition 4.5), 702 (Corollary 5.7), 773–1206 (§6 in full), 1207–1296 (§7, Table 1, Theorem 7.4, Corollary 7.5, Remark 7.6), 1297–1461 (§8: Kazhdan–Lusztig triples, (8.1)–(8.2), Theorem 8.3, Definition 8.4, Theorem 8.5, Remark 8.6, §8.3 and (8.8)).

**Sampled targets.** 1.1, 1.3, 1.6, 2.1, 2.2, 2.4, 3.2, 4.1, 5.8, 5.11, 5.13, 5.29, 6.1, 7.4, 7.9: theorem numbers, pages and hypotheses agree with the sources at the lines above; the Lean statements of 1.1, 1.3, 1.6 match BHV F.1.1, C.5.3 and F.1.4. 5.29's twenty-six `(L, H)` rows for E₆, E₇, E₈ and its fifty-one root vectors agree entry by entry with BC1 §7.2.1–7.2.4; its B/D condition is BC1 Theorem 3.3 with the `a₀ = 0` convention made explicit.

**Adversarial table.** Values computed on each side; rows marked "change" point at a finding.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 Check 2: translation on ℓ²(ℚ_p) not strongly continuous | g ≠ 0 | ‖δ_g − δ_0‖² = 1 + 1 = 2, so ‖λ(g)δ₀ − δ₀‖ = √2 | holds | none |
| 0.1 Check 3: diagonal ℤ_p action strongly continuous, not norm continuous | g = p^m, n = m+1 | χ_{m+1}(p^m) = e^{2πi/p}; for fixed v the tail Σ_{n>M} |v_n|² → 0 | holds | none |
| 0.3 positive type ⟺ `Matrix.PosSemidef (fun a b ↦ φ(a⁻¹b))` | c finitely supported | Σ conj(x_a) x_b φ(a⁻¹b) = Σ cᵢ conj(cⱼ) φ(gⱼ⁻¹gᵢ) with i=b, j=a | same form | none |
| 0.3 Check 6 (S₃ Gram matrix) | v on axis of (12); v on axis of (13) | [[1,1],[1,1]], values 4 and 0; [[1,−½],[−½,1]], values 1 and 3 | ambiguous | R07 |
| 0.4 coefficient vs Tau Ceti `matrixCoeff` | unitary χ with value i | c(π,1)(g) = ⟪1, i⟫ = i; matrixCoeff = ⟪i,1⟫ = −i; at g⁻¹: ⟪−i,1⟫ = i | reconciled as stated | none |
| 0.5 GNS coefficient | g arbitrary | c(π_φ, Φe)(g) = ⟪Φe, Φg⟫ = K(e,g) = φ(g) with `inner_kolmogorovFeature` second-linear | recovers φ | none |
| 0.5 strong continuity | a fixed, g → e | ‖Φ(ga) − Φ(a)‖² = 2φ(e) − φ(a⁻¹g⁻¹a) − φ(a⁻¹ga) = 2Re(φ(e) − φ(a⁻¹ga)) | → 0 | none |
| 0.7 example ℤ/2 | φ(1) = 0 | midpoint of ±1 characters; GNS = regular rep, reducible | not extreme | none |
| 0.8 projector normalisation | K finite, τ of dim d | (1/|K|) Σ conj χ_τ(k) π(k) = e_τ / d | factor d needed | none (source issue S1) |
| 1.1 Check 2: trivial ≺ regular on ℤ | v_N = (2N+1)^{-1/2} 1_{[−N,N]}, k = 1 | coefficient 2N/(2N+1) → 1 | holds | none |
| 1.2 Milman converse, non-compact counterexample | ℓ²(ℕ), F = {eₙ} | 0 = lim (e₁+⋯+eₙ)/n (norm 1/√n), 0 extreme in {x ≥ 0, Σx ≤ 1}, dist(0,F) = 1 | compactness needed | none |
| 1.3 Godement Check | finite group, f = δ_a + iδ_b | φ = 1: |1+i|² = 2; φ = −1, f = δ_e: −1 | matches | none |
| 1.3 ⟨φ, f* ∗ f⟩ versus the Lean integrand | nonunimodular G | f*(y) = Δ(y⁻¹)conj f(y⁻¹); substitution y ↦ y⁻¹ cancels Δ; gives ∫∫ f(x) conj f(y) φ(y⁻¹x) | same integrand | none |
| 1.5 Raikov fails on P≤1 | S¹, χₙ | ⟨χₙ, f⟩ → 0, χₙ(1) = 1 | as stated | none |
| 1.5 Check "nondiscrete ⇒ weak-* convergence to 0 possible" | λ, v_n = 1_{U_n}/√μ(U_n) | c(g) = μ(gU_n ∩ U_n)/μ(U_n) → 1_{e}(g) = 0 a.e. | holds | none |
| 1.6 counterexample for reducible σ | ℤ/2 regular, (1,1)/√2 in δ-basis | coefficient ≡ 1 (not the indicator of 0) | wrong vector | R07 |
| 1.9 subsequence form of GS 11.6 | G₂(ℚ₅), π₁ = St, πₙ = 1 | every increasing subsequence eventually 1; St isolated (4.7) | printed form false | none (source issue S2) |
| 2.1 Checks | χ = |·|_p; ℤ on ℂ² unipotent | ‖χ(p)v‖ = p⁻¹‖v‖; (0,1) ↦ (n,1), norm² n²+1 | not unitarizable | none |
| 2.4 normalisation witness | PGL₂, Ind_B 1 unnormalised | contains 1 with quotient St, non-split | not unitarizable | none |
| 3.1 Check: conductor-n characters | f invariant under 1+p^mℤ_p, n > m | ∫ f χₙ = 0 | limit 0 | none |
| 3.4 non-example | |·|^n on ℚ_p^×, f = 1_{p⁻¹ℤ_p^×} | Θ(f) = p^n → ∞ | no convergent subsequence | none |
| 4.4 Check A₂ positivity sets | w = e, s₁, s₂, s₁s₂, s₂s₁, w₀ | J = Δ, {α₂}, {α₁}, {α₁}, {α₂}, ∅; sizes 1,2,2,1; inverse convention gives s₂s₁ ↦ {α₁} | as stated | none |
| 4.6 A₂ exponent witness | χ = q^ρ, w = s₂s₁, ray −mω₂^∨ | wρ = −α₂, ρ+wρ = α₁, ⟨α₁,ω₂^∨⟩ = 0 ⇒ value 1; St: ⟨2ρ,ω₂^∨⟩ = 2 ⇒ q^{−2m} | as stated | none |
| 4.8 proof route "component = {σ}" | PGL₂(ℚ_p), χ = (−1)^{v_p det}, ramified dihedral σ | σ⊗χ ≇ σ, same component, (σ⊗χ)|_K = σ|_K ⇒ (σ⊗χ)(e∗1_K) ≠ 0 | claim false; theorem true | R01 |
| 5.1 sign convention | PGL₂, ν = ρ | χ_{s_ρ}(α^∨(ϖ)) = q^{⟨α^∨,ρ⟩} = q = δ_B^{−1/2}(α^∨(ϖ)); X(ρ) = Ind 1 ∋ 1 | dominant ⇒ subrepresentation | none (source issue S3) |
| 5.2 Check G₂ | all V | weight lattice = root lattice | adjoint test suffices | none |
| 5.7 region count | F₄: (14·18·20·24)/(2·6·8·12); E₈: ∏(30+dᵢ)/dᵢ | 105; 25080 | matches | none |
| 5.8 PGL₃ hermitian slice of A₀ | ν = c(ω₁+ω₂) | ⟨α₁^∨+α₂^∨, ν⟩ = 2c < 1 ⇔ c < ½ | as stated | none |
| 5.11 alcove counts | G₂, F₄, E₆, E₇, E₈ | 2^d = 2, 2, 2, 8, 16 = BC1 §7.2 row counts | matches | none |
| 5.13 (6.12) | α^∨ and −α^∨; rank ≥ 2 | 2ε ∈ ½ℤ ⇒ ε ∈ {0,¼}; β^∨ = α₁^∨+α₂^∨ ⇒ ε ∈ ½ℤ ⇒ ε = 0 | as stated | none |
| 5.14 PGL(2k) | a₁ ≥ … ≥ a_k ≥ 0, < ½ | 2a_k ∈ ½ℤ, aᵢ − aᵢ₊₁ ∈ ½ℤ ⇒ all aᵢ = ¼ = ½ω_k | {0, ½ω_k} | none |
| 5.15–5.17 classical | SO(2n+1): ⟨2εₙ, Σνᵢωᵢ⟩; PSp: ⟨εₙ₋₁+εₙ, ½ωⱼ⟩; PSO: ⟨εₙ₋₁+εₙ, ½ω₁⟩ | ν₁+2ν₂+⋯+2νₙ; 1 for j<n, ½ for j=n; ½ | as stated and as CH26 §§6.4–6.6 | none |
| 5.18 G₂ | ν = ν₁ω₁+ν₂ω₂, β^∨ = 2α₁^∨+α₂^∨, γ^∨ = 3α₁^∨+2α₂^∨ | 2ν₁+ν₂ < 1 ⇒ ν₁ = 0, ν₂ ∈ {0,½}; ⟨γ^∨, ½ω₂⟩ = 1 | {0} | none |
| 5.19 F₄ | CH26 (6.21): ω₁ = (1,0,0,0), γ^∨ = (2,0,0,0) | ⟨γ^∨, ½ω₁⟩ = 1 | {0} | none |
| 5.20–5.22 E₆, E₇, E₈ | root heights 9, 9, 15 | E₆ one root of height 9 (1,1,2,2,2,1); E₇ four of height 9; E₈ four of height 15; ⟨γ^∨,½ω₇⟩_{E₇} = ½, ⟨γ^∨,½ω₁⟩ = ⟨γ^∨,½ω₂⟩ = 1 | as stated | none |
| 5.25 pairings | SL(2k): ⟨ε₁, ½ω_k⟩; Sp, Spin: analogous; E₇: ½(ω₇,ω₇) | ¼; ¼; ¾ (inverse Cartan entry 3/2) | as stated | none |
| 5.27 G₂ witness | coroots (a,b) ∈ {(1,0),(0,1),(1,1),(2,1),(3,1),(3,2)}, s = s_c s_{½ω₂} | values −1, q^{½}, −q^{½}, q^{½}, −q^{½}, −q; along t∈[0,1]: (−1)^a q^{tb/2} = q^{±1} needs a even, b = 2, none | irreducible, hermitian (w₀ = −1), unitary at t = 0 ⇒ unitary; ν ≠ 0, geometric | CH26 6.32(1) false as printed (source issue S5) |
| 5.28 Check | q = 2, 3 | finite Hecke eigenvalues (q, −1) = (2,−1), (3,−1) | distinct | none |
| 5.29 Checks | B₂ (0,¾): i = 2; B₃ (⅕,⅖,9/10): i = 2 | ¾ < 1 − 0; ⅖ < ⅘ < 9/10 with exactly one 1−a_l = ⅘ in (⅖, 9/10); norms² of β₃₆, β₆₃, β₁₂₀ = 2 | as stated | none |
| 6.1 Table 1 | ²A₃, ²A₂ | SL₄ ⊃ Sp₄ ⇒ SO₅; SL₃ ⊃ SO₃ ⇒ Sp₂ = SL₂ | matches CH26 Table 1, BC3 6.2.7 | none |
| 7.1 Checks | GL₂: J = ∅, Δ; supercuspidal; rank 2 | D[1] = [i_B δ^{−1/2}] − [1] = [St]; (−1)^{|Δ|} = −1; +1 | as stated | none |
| 7.5 IM convention | La24 (T_s+1)(T_s − t^{2λ(s)}) = 0, λ = 1 | IM(T_s) = −qT_s⁻¹ sends eigenvalue q ↦ −1 and −1 ↦ q | swaps trivial/sign | none |
| 7.9 Remark 8.6 | Sp(6), O = (2,2,2), so(3) Cartan t | ½h = (½,½,½); ν with root value ½ ⇒ t = ½ ⇒ (1,½,0) ~ (0,½,1); norms² ¾ and 5/4 | as stated | none |
| 7.11 F₄, B₃ corrected point | h for regular nilpotent of ⟨α₁^∨,α₂^∨,α₃^∨⟩ in CH26 (6.21) | h = (3,−3,3,1) ~ (5,1,1,1) = 2ω₁+2ω₂ (diagram 2200); centraliser A₁ root vector in weight 1 on a^∨ = ℝ(1,1,0,0); ν = (½,½,0,0); ℜ(s) = (2,−1,3/2,½) ~ (5/2,1,½,0) via s_{α₁^∨}; norm² 7.5 = 7 + ½ | README's correction right; printed ω₁+ω₂+½ω₃+½ω₄ has norm² 19.5 | none (source issue S6) |
| 7.12 lattice split | E₈ roots ½(1,…,1), ½(−1,1,1,1,1,1,−1,1) | ν₁+ν₂+ν₄, ν₁+ν₂+ν₃ ∈ ½ℤ with ν₁−ν₂ ∈ ½ℤ ⇒ all νᵢ ∈ ½ℤ; (½,½,½,½): ν₁+ν₄ = 1 ✗; (¼,¾,¾,¾): ν₂+ν₃ = 3/2 ✗ | conclusion holds; quarter case empty | R08 note |
| `IsPositiveType` on an infinite group | `Matrix.PosSemidef` with `n →₀ R` | finitely supported vectors only; no `Fintype` needed | elaborates, matches BHV C.4.1 | none |
| `godement` representative independence | φ = φ' a.e. | for each y, x ↦ y⁻¹x preserves μ-null sets; Fubini | integrand a.e. equal | none |
| `raikov` topology | C(G,ℂ) compact-open, G locally compact | compact-open = compact convergence | BHV C.5.6 statement | none |

## Not verifiable

- `BM94`, `KS71`, `Mi73`, `Rodier81`, `Steinberg68`, `Borel79`, `Ber74`: waived in the manifest; cited by locator only (4.3, 5.8, 3.3, 3.7, 6.1, 6.1, 2.6). The statements attributed to them are the standard ones and agree with the secondary sources read (GS23, CH26, BC1, BC3).
- Kato81 Theorem 2.2: the OCR garbles the definition of `e(λ)`; I verified the two-condition shape of the theorem (line 229) and Theorem 2.4 (line 253), not the exact form of `e_α`.
- CH26 Theorem 8.5(4)–(5): the E₇ and E₈ extraneous points are copied correctly from CH26 lines 1386–1393, but I recomputed only the F₄ `B₃` point (R07 table row) and the Sp(6) example; the exceptional tables themselves come from the declared gap on LieHighestWeightPartII.
- BHV "pp. 421–423" cited in 1.1 for the proof of Lemma F.1.3: printed pages; the lemma is at BHV line 16089 (PDF p. 432). Consistent with the stated printed-page offset, not checked page by page.
- Ownership against open pull requests whose files the brief does not give was not checked beyond the roadmap grep tool.

## Source issues

- **Misprint** in GS23 at §11.1, p. 32 (paragraph before Lemma 11.4): the function `f_τ` is defined as the conjugate character of τ divided by `vol K`, and `π(f_τ)` is called the τ-isotypic projector; it should carry the factor `dim τ`, otherwise `π(f_τ)` is the projector divided by `dim τ`; affects nothing (the proof only uses nonvanishing).
- **Error** in GS23 at Proposition 11.6, p. 33: the statement says an irreducible σ weakly contained in `⊕̂ πₙ` is the limit of a subsequence of the πₙ; it should say σ lies in the Fell closure of `{πₙ}` (the proof produces a sequence in the union of coefficient sets, which may repeat one index); with `π₁ = σ = St_{G₂(ℚ₅)}` and `πₙ = 1` for `n ≥ 2` no subsequence converges to the isolated St; affects a stated result (Corollary 11.7 is unaffected).
- **Misprint** in CH26 at §6, after Definition 6.3, p. 17: it says that for dominant ν, `L(ν)` is the unique irreducible quotient of `X(ν)`; with (6.1) and `s_ν = exp(ν log q)` it is the unique irreducible subrepresentation (PGL₂, ν = ρ: `χ_{s_ρ} = δ_B^{−1/2}` and `X(ρ) = Ind_B 1` contains the trivial representation); affects nothing.
- **Misprint** in CH26 at (6.5), p. 17: the list of coroot types with `w₀ = −1` omits `A₁` and `D_{2n}`; it should read `A₁, B, C, D_{2n}, G₂, F₄, E₇, E₈`; affects nothing.
- **Misprint** in CH26 at Theorem 6.9, p. 18: "the hermitian locus `C₀`" should be `C_{0,h}`; affects nothing.
- **Error** in CH26 at Corollary 6.32(1), p. 25 (inherited by Corollary 7.5, p. 26): stated for an arbitrary compact part `s_c`; for split `G₂`, the involution `s_c` with `(aα₁^∨+bα₂^∨)(s_c) = (−1)^a` and `ν = ½ω₂` gives an irreducible, hermitian, unitary (deformation from `t = 0`), generic `X(s)` with `s` geometric for every representation and `ν ≠ 0`; it should restrict to `s_c = 1` or central, or replace `U₀^g` by the region of the centraliser of `s_c`; affects a stated result.
- **Error** in CH26 at Theorem 8.5(3), p. 28, row `O^∨ = B₃` of `F₄`: the real part is printed as `ω₁+ω₂+½ω₃+½ω₄` (Euclidean norm² 19.5 in the coordinates of (6.21)); it should be `ω₁+½ω₃+½ω₄`, Weyl-conjugate to `½h^∨ + ν` with `½h^∨ ~ (5/2,½,½,½)`, `ν` on the `A₁` centraliser with root value ½ (norm² 7 + ½ = 7.5); affects a stated result.
- **Misprint** in CH26 at the proof of Theorem 8.5, case (2), p. 29: "when `j` is odd and `rⱼ ≥ 3`" should be "`j` even" (the orthogonal factors of the Sp(2n) centraliser are `O(rⱼ)` for even `j`, as in the statement); affects nothing.
- **Gap** in CH26 at §8.3, p. 30: the case split "all `νᵢ` in `½ℤ` or all in `¼ + ½ℤ`" is over-inclusive; the half-spin roots pair with the `4A₁` parameter to `ν₁+ν₂+ν₄` and `ν₁+ν₂+ν₃`, which force every `νᵢ ∈ ½ℤ`, so the second case is empty; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "96a72c9c05c7a87a514497a97ebe0ed70d9d58d5", "job": "REV-PKG-SmoothRepresentationsOfLocalGroupsPartII", "model": "fable", "worker": "chris-i"} -->
