<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17370#issuecomment-6904441278 -->
Red team round 1 pass b (claude) of f78c7d9

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the "universal Hausdorff quotient" is never asserted to be Hausdorff

   **Location.** `packages/SurfaceGroupCharacterVarieties/Suggested.lean:332–353`,
   `characterVariety_universalHausdorffQuotient`; docstring: "**The universal Hausdorff quotient**
   (Layer 7.2; Sikora2012, §11). For a connected reductive group `G` over `ℂ` …". README §7.2
   (`README.md:1994–2002`) and the module docstring (`Suggested.lean:35–36`) make the same claim.

   **Claim.** The closed-orbit map `q : Hom(Γ, G(ℂ)) → 𝒳(Γ, G(ℂ))` is the universal Hausdorff
   quotient of `Hom(Γ, G(ℂ))` by conjugation, `𝒳(Γ, G(ℂ))` being homeomorphic to `(Hom(Γ, G)//G)(ℂ)`.

   **Witness.** The elaborated conclusion is `∃ q, Continuous q ∧ … ∧ ∀ Z [T2Space Z] F, … ∃! F', …`:
   no `T2Space (CharacterVariety Γ ⊤)` conjunct. The only Hausdorff statement in the file,
   `characterVariety_t2_locallyCompact_secondCountable` (`Suggested.lean:323`), takes
   `[HopfAlgebra ℝ H]` and a subgroup of `WithConv (H →ₐ[ℝ] ℝ)`, so it never applies to
   `CharacterVariety Γ (⊤ : Subgroup (WithConv (H →ₐ[ℂ] ℂ)))`. An object that is initial among
   Hausdorff targets is a universal Hausdorff quotient only if it is itself Hausdorff; as typed, the
   headline says "every invariant map to a Hausdorff space factors through `q`" about a space whose
   Hausdorffness the acceptance test never requires. The README proves it (homeomorphism with
   `(Hom//G)(ℂ)`, §7.2), so the Lean is weaker than the README and than its own docstring.

   **Repair.** In `Suggested.lean`, change the conclusion of
   `characterVariety_universalHausdorffQuotient` to

   ```lean
       T2Space (CharacterVariety Γ (⊤ : Subgroup (WithConv (H →ₐ[ℂ] ℂ)))) ∧
         ∃ q : (Γ →* (⊤ : Subgroup (WithConv (H →ₐ[ℂ] ℂ)))) →
             CharacterVariety Γ (⊤ : Subgroup (WithConv (H →ₐ[ℂ] ℂ))),
           Continuous q ∧ …            -- the four existing clauses, unchanged
   ```

   and in the docstring replace "is a continuous map `Hom(Γ, G(ℂ)) → 𝒳(Γ, G(ℂ))`" by "is a
   continuous map from `Hom(Γ, G(ℂ))` to the Hausdorff space `𝒳(Γ, G(ℂ))`". In README §7.2, last
   sentence, replace "that the closed-orbit map is continuous, constant on orbits, …" by "that
   `𝒳(Γ, G(ℂ))` is Hausdorff and the closed-orbit map is continuous, constant on orbits, …".
   Tested on the instance: `Γ = ℤ`, `G = SL₂`: `𝒳(ℤ, SL₂(ℂ))` is the set of semisimple classes,
   homeomorphic to `ℂ` by the trace, Hausdorff; `q` sends `[[1,1],[0,1]]` and `1` to the same point
   (trace `2`), which the naive orbit space `Hom/G` separates non-Hausdorffly (README §7.1 Check 3).
   The added conjunct is true for every connected reductive `G/ℂ` and finitely generated `Γ` by
   §7.2's homeomorphism with the complex points of an affine scheme of finite type.

2. **F02** (P3) the four Layer 5 definitions are wider in Lean than in the README

   **Location.** `packages/SurfaceGroupCharacterVarieties/Suggested.lean:177–198` (`symmetricPart`,
   `IsRealReductiveLinearGroup`, `minimalVectors`, `linearOrbit`); `README.md:1506–1508`: "Let `V` be
   a real finite-dimensional inner product space and `G` a subgroup of `GL(V) = (V →L[ℝ] V)ˣ`. Define
   its symmetric part …".

   **Claim.** The definitions are made for finite-dimensional `V`.

   **Witness.** The elaborated types (the worker's `#check @name` listing) are
   `{V} → [NormedAddCommGroup V] → [InnerProductSpace ℝ V] → Subgroup (V →L[ℝ] V)ˣ → …`: the section
   variable `[FiniteDimensional ℝ V]` is absent from all four, present in the five theorems. For
   `V = ℓ²` the predicate `IsRealReductiveLinearGroup` is defined and the README says nothing of it.

   **Repair.** No truth is affected (the five theorems carry the binder). Make the two sides agree by
   adding, after `README.md:1518` ("… and the orbit `linearOrbit G v = {g v : g ∈ G}`."), the
   sentence: "The four definitions use no finiteness and are stated in `Suggested.lean` for every
   real inner product space; every theorem of this section assumes `V` finite-dimensional." (The
   alternative, an explicit `[FiniteDimensional ℝ V]` binder on the four `def`s, changes nothing in
   the theorems and is equally acceptable.)

3. **F03** (P3) convention witness misstates a value

   **Location.** `packages/SurfaceGroupCharacterVarieties/README.md:288–290`: "the conjugation orbit
   of `A = [[1,1],[0,1]]` has `‖diag(t, t⁻¹) A diag(t, t⁻¹)⁻¹‖² = 2 + t⁴`, which tends to the norm `2`
   of the identity".

   **Claim.** The norm of the identity of `M₂(ℝ)` for `⟨A, B⟩ = tr(A Bᵀ)` is `2`, and the limit is
   taken without a direction.

   **Witness.** `diag(t, t⁻¹) A diag(t⁻¹, t) = [[1, t²],[0, 1]]`, squared norm `1 + t⁴ + 1 = 2 + t⁴`;
   `‖1‖² = tr(1) = 2`, so `‖1‖ = √2`. As `t → ∞` the expression tends to `∞`; the limit `2` is for
   `t → 0`.

   **Repair.** Replace "which tends to the norm `2` of the identity, a point of the closure outside
   the orbit" by "which tends, as `t → 0`, to the squared norm `2` of the identity, a point of the
   closure outside the orbit".

One P2 finding (R01) and two P3 findings (R02, R03). No P1 finding: every Lean statement was
found true as typed on the instances below, every cited supplier section and pinned declaration
exists where it is cited, and the dependency check is clean.

Dependency check (run on `packages/SurfaceGroupCharacterVarieties/README.md` at the head):

    depcheck: 235 roadmaps, 2237 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line for this roadmap.

## Verified sound

Counts: 24 named declarations and 1 anonymous instance of `Suggested.lean` read (all 371 lines);
all 2232 lines of the README read, 30 numbered targets and the Conventions; 51 source locators
verified against the cached texts (BohmLafuente2021 21, Sikora2012 10, BateMartinRohrle2005 10,
BCGGO2024 6, LandesmanLitt2024 4); 61 Checks and convention witnesses recomputed; 52 pinned
declarations opened at the pins; 41 sibling citations checked at main or at the open heads. No
Lean was run (the brief forbids builds); the elaborated types are those of the worker's
`#check @name` listing, each compared with its README statement; the only difference is R02.

### Suggested.lean, declaration by declaration

| Declaration (layer; context) | Instances tried | Values on each side | Result |
|---|---|---|---|
| `innerAut_range_normal` (1; `Γ` group) | `Q₈`, `ℤ` | `φ ∘ conj g ∘ φ⁻¹ = conj (φ g)`; `Inn(Q₈)` order 4 normal in `S₄`; `Inn(ℤ) = 1` | true; needed by `Out`; no instance for `MulAut.conj.range` at the pins (only `ContinuousAut.normal_range_conj`) |
| `Out` (1) | `Q₈`, `ℤ²`, `S₃` | `24/4 = 6`; `GL₂(ℤ)`; `1` | same quotient as TeichmullerGeometry §4.2 `OuterAut` (other namespace, other name) |
| `exists_outAction_iff_commute` (1; `Γ H` groups) | `Γ = H = F₂`; `Γ = F₂, H = S₃`; `H` abelian; `Γ = 1` | `conj a · id = conj a⁻¹ ≠ id`, RHS false (`ab ≠ ba`); `(1 2)(2 3) ≠ (2 3)(1 2)` both sides false; both true; both true | iff holds in both directions; `(φψ)·ρ = ρ ψ⁻¹ φ⁻¹ = φ·(ψ·ρ)` so `a` is a homomorphism |
| `existsUnique_homeomorph_extension` (2; `X` compact `T2`, `P` finite) | `S²`, `P = {N, S}` end swap; `[0,1]`, `P = {0,1}` flip; `S¹`, `P` two points; `P = ∅`; `X` finite discrete | extends to rotation by `π`; extends to flip; `U ∖ {p}` disconnected, hypothesis false (and the one-arc reversal does not extend); `e = h`; `U = {p}` gives `U ∖ {p} = ∅`, `IsConnected` false, hypothesis false | true; nonemptiness is in `IsConnected`; uniqueness by density (no `p ∈ P` isolated) |
| `existsUnique_ambientIsotopy_extension` (2) | constant isotopy; `P = ∅` | extension constant, fixes `P`; `Φ' = Φ` | true; continuity at `(t, p)` from sets `J × (U ∖ {p})`, `J ∋ t` shrinking |
| `exists_outerAction` (3; `X` path-connected) | `f = id`, `δ = σ` loop; `S¹`, conjugation and rotation by `π`; composition | `[σ ⬝ γ ⬝ σ̄] = conj [σ]⁻¹`, inner, class `1`; `−1`, `+1`; `(fg)_{δ ⬝ f ε} = f_δ g_ε` | true, homomorphism (not anti); `mul_def` at the pin is `p * q = of (q.trans p)`; `AmbientIsotopic f g := ∃ Φ, Φ.final.comp f = g` |
| `pointwiseTopology`, `conjOrbit` (4) | `Γ = ℤ`, `Γ = F₂` | `Hom(ℤ, G) ≅ G`; product topology of `G²` | real bodies; no `TopologicalSpace (_ →* _)` instance at the pins |
| `symmetricPart`, `IsRealReductiveLinearGroup`, `minimalVectors`, `linearOrbit` (5) | `GL(V)`; `SO(V)`; unitriangular `N ⊂ GL₂(ℝ)`; irrational line in a torus; `V = 0` | `𝔭 = Sym`, `M = {0}`; `𝔭 = 0`, `M = V`; `K exp 𝔭 = 1 ≠ N` rejected; polar but not closed, rejected; trivially reductive | match BohmLafuente2021 lines 52–62; wrong model "𝔭 = whole Lie algebra" excluded by `N`; R02 |
| `minimalVectors_eq_normMinimizers` (5; fin. dim.) | `ℝ_{>0}` on `ℝ²`, `(λx, λ⁻¹y)`; `GL₁` on `ℝ` | `⟨Av, v⟩ = x² − y²`, zero iff `|x| = |y|` iff norm minimal on orbit; `{0}` both sides | true (`d'(0) = 2⟨Av, v⟩`, `d'' ≥ 0`) |
| `isClosed_linearOrbit_iff` (5) | same action: `(1,1)`, `(1,0)`, `0` | hyperbola closed and contains `(1,1) ∈ M`; half-axis not closed, misses `M`; `{0}` closed, `0 ∈ M` | true; closedness of `G` needed (README Check, dense line) and present |
| `linearOrbit_inter_minimalVectors` (5) | same action, `w = (1,1)`; `SO(V)` | orbit `∩ M = {(1,1)} = K w` with `K = 1`; `K w = G w` | true |
| `exists_tendsto_closed_linearOrbit` (5) | `(ℝ_{>0})²` on `ℝ²`, `v = (1,1)` | `α = diag(−1,−1)`: limit `0`, closed orbit; `diag(−1, 0)`: limit `(0,1)`, orbit not closed, correctly not a witness | true; `atTop` is `t → +∞` |
| `existsUnique_closed_linearOrbit` (5) | same; closed orbit | `{0}` the only closed orbit in the closed quadrant; `O = G v` | true |
| `adjointRepresentation`, `IsReductiveRep` (6) | `𝔾_m`; `SL₂`, `ρ(1) = [[1,1],[0,1]]`; `GL₂`, `diag(2,3)` | `Ad` trivial, reductive; nontrivial unipotent, not semisimple; eigenvalues `1, 1, 2/3, 3/2`, semisimple | real bodies on `Derivation.adRepresentation`, `AlgHom.mapValue` |
| `isReductiveRep_tfae` (6; `H` real reductive, `G` open, `Γ` f.g.) | `Γ = ℤ`, `SL₂(ℝ)`: rotation, unipotent, `diag(2, 1/2)`; `G^ℝ = ℝ^×` | all four true; all four false (identity in both orbit closures); all four true; all four true | true; items are (a), (b), (e'), (f) of §6.7; orbit of item 4 is the `G^ℝ`-orbit in `Γ →* G` |
| `reductiveConjSetoid`, `CharacterVariety`, topology instance (7) | `Γ = ℤ`, `SO(2)`; `Γ = 1` | circle; point | real bodies; quotient topology of the subtype of `pointwiseTopology` |
| `characterVariety_t2_locallyCompact_secondCountable` (7) | `Γ = ℤ`, `SL₂(ℝ)`; `Γ = F_∞`, `ℝ^×` | semisimple classes, Hausdorff; `(ℝ^×)^ℕ` not locally compact, excluded by `Group.FG` | true |
| `characterVariety_universalHausdorffQuotient` (7) | `Γ = ℤ`, `SL₂`; `Z = ℂ`, `F = tr` | `q(unipotent) = q(1)`; `F' = tr` on classes | true as typed, weaker than the README: R01 |
| `exists_outAction_characterVariety` (7; any `k`, `A`, `G`, `Γ`) | `Γ = ℤ`, `SO(2)`; `𝔾_a`, `Γ = ℤ`; inner `φ = conj γ` | `[g] ↦ [g⁻¹]`; `x ↦ −x`; `ρ ∘ conj γ⁻¹ = conj (ρ γ)⁻¹ ∘ ρ`, same class since `ρ γ ∈ G` | true with no hypothesis on the topology of `k` (precomposition permutes coordinates) |

Padding probe: no declaration follows from one tactic or one pinned lemma, restates a definition
or mirrors a Check; the proved bodies are the normality instance and the setoid, both needed to
state headlines. Headlines not stated are named in the module docstring with the missing carrier;
the pins were checked for each (no genus or orientability of a topological surface, no
`IsGCompletelyReducible`, no Zariski closure of a set of points of an affine group, no affine
quotient; `MvPolynomial.zariskiClosure` at the pin is for subsets of `σ → K` only).

### README targets (values recomputed)

| Target | Instances and values | Result |
|---|---|---|
| Conventions, actions | `(φψ)⁻¹ = [[1,−1],[−1,2]]`, first row `(1,−1)`; `(ψφ)⁻¹ = [[2,−1],[−1,1]]`, first row `(2,−1)` | correct |
| Conventions, paths | `fundamentalGroupMulEquivOfPath σ = (iso ⟦σ⟧).conj`, `γ ↦ σ̄ ⬝ γ ⬝ σ`; `conj [u] [γ] = [ū ⬝ γ ⬝ u]` | agrees with the pin |
| Conventions, realization | `2 + t⁴` correct; value of the limit misnamed | R03 |
| 1.1–1.3 | `|Out(Q₈)| = 24/4 = 6`; `Rep(ℤ, S₃)` 3 of 6; `Rep(ℤ/2, GL₂(ℂ))` 3; `e φ e⁻¹ = φ ∘ conj(φ⁻¹(g) g⁻¹)` | correct |
| 2.1 | `Mod^±(ℝ) = 2`; `S² ⊔ S²`: `8`, orientation-preserving `2`, index `4`; path-component claim via the exponential law for locally compact `X` | correct |
| 2.2–2.3, 2.5 | `(θ, s) ↦ (−θ, −s)` extends to a rotation swapping `N, S`; indices `0! , 1!, 2!, 3!`; conjugation by `diag(1,−1)` outer on `SL₂(ℤ)` (determinant) | correct |
| 2.4 | `a b a⁻¹ b⁻¹`: `d₂ = 0`, `H₂ = ℤ`, `H₁ = ℤ²`; `a a b b`: `d₂ = 2a + 2b`, `H₂ = 0`, `H₁ = ℤ ⊕ ℤ/2`; `a a⁻¹`: `H₁ = 0`, `H₂ = ℤ` | correct |
| 3.1–3.3 | change of path `conj [δ ⬝ δ̄'] ∘ f_δ = f_{δ'}`; push `f_const = conj [α]`; shear `↦ [[1,0],[1,1]]` | correct |
| 3.4 | reflection `z ↦ e^{2πi/g} z̄`: arc `j`, parameter `t` to arc `3 − j`, `1 − t`; pairs `(4i, 4i+2) → (4j+3, 4j+1)`, `(4i+1, 4i+3) → (4j+2, 4j)`, `j ≡ −i`; `det` on `Λ²ℤ²` | correct |
| 3.5 | Burnside `(36 + 12 + 18)/6 = 11`; `(1 2)(2 3)(1 2) = (1 3)`; `ρ ∘ M⁻¹ : (a, b) ↦ b − a`, kernel `M(ker ρ)` | correct |
| 4.1–4.3 | `𝔽₂[t]/(t² − 1) = 𝔽₂[t]/((t−1)²)`; `ℝ[t]/(2t)`; `G^{2g+n−1}` | correct |
| 5.2 | `J ḡ J⁻¹ = [[a, −b̄],[b, ā]]`; `F ∩ iF = 0`; `2/conj(2/z̄) = z` | correct |
| 5.3 | `u r_θ u⁻¹ = [[c+s, −2s],[s, c−s]]`, column lengths `1 + s(2c+s)`, `1 + 2s(2s−c)` | correct |
| 5.4 | separation function on `xy = 1`: values `0`, `1`, limit `1/2`; `diag(a, b)` limits | correct |
| 6.1–6.7 | `Ad(diag(2,3))`: `1, 1, 2/3, 3/2`; `O₂`: `ker Ad = SO₂ ≠ {±1}`; `[[1, t²],[0,1]] → 1`; finite-generation argument (maximal `C`, infinite-order point of `Z⁰/C`) | correct |
| 7.1–7.3 | `(ℝ^×)^ℕ` not locally compact; `C₂` on `𝔸²/𝔽₂`: `𝔽₂[x+y, xy]|_{x=y} = 𝔽₂[x²] ⊊ 𝔽₂[x]` | correct |
| 7.5 | `(2,2,3)`: `4+4+9−12−2 = 3`; `(A, AB)`: `(2,3,4)`, `4+9+16−24−2 = 3`; `(A, A⁻¹B)`: `(2,1,2)`, `4+1+4−4−2 = 3` | correct |

### Suppliers

Read at main or at the open heads and found to state what the README takes from them:
MordellLawrenceVenkatesh §§5.1, 5.4, 5.5, 5.6, 5.9 (with its Checks on `Sym(3)` and the pure
group), 5.15, 5.17, 5.19 (with "on the torus `Push` is trivial"), 5.22; TeichmullerGeometry
§§0.0b (`image_boundary`), 0.0e, 0.0f (`schemaRealization`, `StandardSurface.*`,
`classification_of_surfaces`, `Surface.genus`, `Surface.IsOrientable`), 0.0h, 4.2 (`OuterAut`,
`innerAut_normal`), 5.4 (`dehn_nielsen_baer`), 5.4a, 6.1 (Euler number `2 − 2g`, reflection
conjugate `2g − 2`); MappingClassGroupsAndCanonicalRepresentations §§0.1–0.3, 1.4, 2.1;
NonabelianLevelStructures §§5.1 (`integral_trace_coordinates`), 5.2 (the three moves and the right
action); ArithmeticGaloisRepresentations §1.7 and the two named paragraphs of §1.11;
LanglandsParameterStacks §2.2; RealSemisimpleLieGroups §2.5; LieGroups Layer 9
(`kakDecomposition`, global matrix models); ClassifyingSpaces Stage 3 items 11, 15 and Stage 4
item 17; ReductiveGroups Layers 1, 2, 3, 3A, 4, 5, 5P, 6, 7; ReductiveGroupsPartII §§RG2.0.1,
RG2.0a.2; ComplexComparisonPartII §C-1.1; GeometricTopology Layer 1.7.2; FreeGroupsAndLimitGroups
§§6.1–6.2; SymplecticGeometry/HamiltonianReduction R5; ArithmeticLocallySymmetricSpaces ALS.F.1
and ALS.0.1; AlgebraicTopology Stage 4 items 2–3, which that roadmap's README maps to its §§4.2–4.3
("Stage k is Layer k … item m of Stage k is §k.m"), so the Stage citations stay valid.
The four names the citation tool reports as found nowhere (`StandardSurface.eulerChar_model`,
`StandardSurface.homeomorph_unique`, `StandardSurface.isSurface_model`, `Surface.IsOrientable`)
are TeichmullerGeometry §0.0f's and are there. RealSemisimpleLieGroups is another author's open
pull request adding a new folder, an allowed supplier. The three declared gaps have the same slugs
in `design/plan.json` and in the README, each with a named supplier and section, one statement
each with its hypotheses; none asks for something already provided (no Borel–Tits, no
kernel-of-`Ad` statement and no "G-cr implies reductive identity component" in ReductiveGroups or
ArithmeticGaloisRepresentations §1.11 as read). No fully qualified name of `Suggested.lean`
coincides with a sibling's. Ownership of `Rep(Γ, H)`, `Mod^±(X)`, the representation scheme, real
Kempf–Ness and the character variety was searched by object at main, at the open heads and at the
pins: the special cases found (MappingClassGroupsAndCanonicalRepresentations §§0.2, 1.4, 2.1,
NonabelianLevelStructures §5.1, InverseGaloisAndArithmeticFundamentalGroups §IG.3.2,
GroupActionsOnRiemannSurfaces §3.4) are the ones the Scope already names as special cases.

Policy: the pull request changes only `packages/SurfaceGroupCharacterVarieties/`; no `lemma`,
`set_option`, `#eval`, pull-request number or process narrative in the README or the Lean file;
imports are `import Mathlib` and four `TauCeti.*` modules that exist at the pin; every target has
a locator; every definition has at least three Checks.

Source independence: 17 passages compared with 5 sources, none shared (longest run in common is
the formula `lim_{t→∞} exp(tα) v` of BohmLafuente2021 line 82, forced by the mathematics); largest
share Sikora2012, 13 of 72 source citations; contents compared with Sikora2012 (§§1–14): Layer 4
↔ §5, Layer 6 ↔ §§3 and 7, Layer 7 ↔ §11, not in the same order, Layers 1, 2, 3, 5 without
counterpart: independent.

## Not verifiable

- FarbMargalit2012 (waived): the locators Ch. 1 §§1.1, 1.4, Ch. 2 §§2.1–2.2, Ch. 4 §4.2, Ch. 8
  §8.1 were not opened; in particular whether the index-`n!` statement for the pure group is in
  §4.2 rather than elsewhere in Ch. 4.
- RichardsonSlodowy1990 (waived): §§4, 7, 9, cited for the real closed-orbit criterion and the
  Hausdorff quotient.
- Knapp2002 (waived), Richardson1988 and Goldman1984 (uncertified): cited by locator only.
- Elaboration: no Lean was run in this pass; the types compared are the worker's listing for the
  head.
- The section-level contents of the supplier sections were compared with the contract paragraph by
  paragraph, not sentence by sentence; a clause of a supplier target that a later revision of that
  supplier changes is outside this pass.

## Source issues

- **Misprint** in BCGGO2024 at §2.3, printed page 10 (line 471–472): the source says the real form `SO_{p,q}` has two components whenever `p` or `q` is nonzero; it should be whenever both are nonzero (`SO_{n,0}` is connected); affects nothing.
- **Misprint** in BohmLafuente2021 at Lemma 6.3, proof (line 520): the source calls the group `T = exp(𝔱)` a maximal abelian subalgebra; it should be that `𝔱 ⊂ 𝔭` is a maximal abelian subalgebra and `T = exp(𝔱)`; affects nothing.
- **Gap** in BohmLafuente2021 at Lemma 6.5, proof (line 569): the source takes a vector of minimal norm in the orbit closure minus the orbit, which is empty when the orbit is closed; it should take one of minimal norm in the whole closure; affects the proof.
- **Misprint** in Sikora2012 at §11, printed page 18 (line 836): the source refers to Proposition 30; it should be Theorem 30 (line 572); affects nothing.

## For the human reviewers

- **Not tested.** FarbMargalit2012, RichardsonSlodowy1990 and Knapp2002 are waived and Richardson1988 and Goldman1984 uncertified in `packages/SurfaceGroupCharacterVarieties/sources.toml`: 19 of the README's 72 source citations were checked by locator form only, not against text.
- **Licence.** `Suggested.lean:87–90` restates `OuterAut` of TeichmullerGeometry's `Suggested.lean` (open pull request, same project) as `Out`, with the same normality proof; no outside formalisation was found to match any declaration.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f78c7d9d61b6b5c1a373b9ad5eef65d1d063e3de", "job": "RT-SurfaceGroupCharacterVarieties~1b", "model": "fable", "worker": "chris-x26"} -->
