# Review of LieHighestWeightPartII (package, round 2)

**Verdict:** needs changes

Twelve findings: ten blocking (P1/P2), two P3. The four package inputs were read without modification. All twelve earlier findings were checked first; their disposition is below. All 23 numbered subsections were read, including every repair and the fifteen seeded targets. The original acceptance file fails elaboration. An import-only repair in scratch elaborates with precisely eight `sorry` warnings and all fourteen requested signatures. No headline padding was found.

## R01 (P2) — Two imported modules no longer exist at the pin

**Location:** `packages/LieHighestWeightPartII/Suggested.lean:6–7`; corresponding supplier paths in `packages/LieHighestWeightPartII/README.md:60`.

**Claim:** `TauCeti.Algebra.AlgebraicGroup.Representation.PointsAction` and `TauCeti.Algebra.AlgebraicGroup.Representation.SemisimplePoint` are importable.

**Witness:** The original elaboration exits 1. Targeted builds report both source modules absent. Their declarations are at `TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction/Basic.lean:102` and `TauCeti/Algebra/AlgebraicGroup/Representation/SemisimplePoint/Basic.lean:81`.

**Exact repair:** Append `.Basic` to both imports and update the corresponding README paths. Also update the relocated symplectic reductivity path to `TauCeti/Algebra/AlgebraicGroup/Symplectic/Reductive/Basic.lean`. Use the required `import Mathlib` header followed by the used `import TauCeti.*` lines; the scratch version without `module`, `public import`, or the exposed public-section wrapper passes the prescribed command. The import-only repair, retaining all fourteen signatures, exits 0 with eight `sorry` warnings. No pin change or new carrier is necessary.

## R02 (P2) — The inner automorphism group is reconstructed despite a native carrier

**Location:** `packages/LieHighestWeightPartII/Suggested.lean:57–66`; `packages/LieHighestWeightPartII/README.md:13`: “restates `Int(L)` as `innerAutGroup`”.

**Claim:** A second closure-of-exponentials definition is needed to state the headlines.

**Witness:** `TauCeti/Algebra/Lie/AdjointAction/InnerAutomorphismGroup.lean:70` defines `TauCeti.intLieAlgebra` by precisely these generators; line 108 supplies its Lie automorphisms. Its general-linear-group carrier already acts on `L`.

**Exact repair:** Import that module, consume `TauCeti.intLieAlgebra`, and state the six inner-conjugacy headlines using its action, with the rational Lie-algebra instance supplied by `TauCeti.ratLieAlgebra`. Delete the independent closure definition and move its existing API to the native supplier contract. If a linear-equivalence adapter is essential, transport the native subgroup instead of regenerating it. On `sl₂`, both groups contain `exp(ad E)`, which sends `H` to `H − 2E`; on an abelian algebra both are the identity subgroup. Thus transport retains the intended group, including its degenerate case.

## R03 (P2) — Repaired proof steps duplicate results now proved at the pin

**Location:** `packages/LieHighestWeightPartII/README.md:11,141,265,341`; the package assigns itself the general-field surjectivity, label-bound, Cartan-existence and invariant-form proportionality arguments.

**Claim:** These inputs need to be proved here because the earlier complex roadmap does not supply them over `K`.

**Witness:** Native declarations already supply them: `Sl2/EigenspaceMap.lean:209`, `Sl2/WeightedDiagram/Basic.lean:124`, `CartanExists.lean:45`, and `InvariantForm/Basic.lean:141`, all under `TauCeti/Algebra/Lie/`. Their exact names and hypotheses are recorded below.

**Exact repair:** Cite those native results in Scope and Exact supplier contracts, and remove the duplicated general proofs. Keep the zero-triple extension as a direct case split, and keep the new recognition, filtration, explicit invariant-form construction and parity statements. The supplied raising-map theorem gives `[E, KH] = KE` since `[E,H] = −2E`; the zero case has image and target zero, although `L_0 = L` need not be zero. The label theorem gives `2` for the standard `sl₂` triple and the direct zero branch gives `0`. The Cartan theorem applies because the integral weight decomposition makes `ad h` semisimple. These tests verify the proposed reuse at the generality needed by the repairs.

## R04 (P1) — The common rank range incorrectly makes so(2) Killing

**Location:** `packages/LieHighestWeightPartII/README.md:249`: “Let `r ≥ 1`” and “are finite-dimensional Killing Lie algebras”; the same paragraph later calls `so(2)` abelian.

**Claim:** All four listed families have nondegenerate Killing form throughout the common range `r ≥ 1`.

**Witness:** At `r = 1`, `so(2,K) = K·[[0,1],[-1,0]]` is one-dimensional abelian. Every adjoint map is zero, so its Killing matrix is `[0]`, of rank 0 rather than 1.

**Exact repair:** Give separate ranges: `sl(r+1)`, `sp(2r)` and `so(2r+1)` for `r ≥ 1`; `so(2r)` Killing for `r ≥ 2`, and simple for `r ≥ 3`. Retain the classification's nonredundant `D_r` range `r ≥ 4`. State `so(2)` separately as nonzero abelian with degenerate Killing form and add that negative-control Check. This agrees with KIR Theorem 6.33, printed p.75, KIR line 2920, which explicitly requires orthogonal dimension greater than two. The `r=2` calculation gives two `A₁` factors, dimension 6 and nondegenerate Killing form; it remains covered.

## R05 (P2) — Orthogonal orbit splitting omits the zero-dimensional exception

**Location:** `packages/LieHighestWeightPartII/README.md:277–279`: “splits into two … exactly when the partition is very even”.

**Claim:** The criterion applies to every finite-dimensional nondegenerate orthogonal space, including dimension zero.

**Witness:** On `V = 0`, the empty partition satisfies both stated evenness conditions. But `O(0) = SO(0) = 1`; their index is 1 and the only triple has one orbit, not two.

**Exact repair:** State that splitting occurs exactly when `dim V > 0` and the partition is very even; give the zero-dimensional case separately. Qualify the index-two argument by positive dimension. Add Checks for the empty partition (one class) and `(2,2)` in dimension four (two classes). Do not exclude dimension zero from the general library or the recognition theorems.

## R06 (P1) — The characteristic-two Check drops the remaining bracket relation

**Location:** `packages/LieHighestWeightPartII/README.md:111`: “with arbitrary `e, f` satisfies the three relations”.

**Claim:** In characteristic two every `(0,e,f)` is a zero-inclusive triple.

**Witness:** In `sl₂(𝔽₂)`, take `e = E₁₂`, `f = E₂₁`. Then `2e = 2f = 0`, but `[e,f] = diag(1,1) ≠ 0 = h`.

**Exact repair:** Replace “arbitrary” by “commuting” and explain that the remaining requirement is `[e,f] = 0`. Use `(0,E₁₂,0)` as the nonzero characteristic-two solution: all three brackets and both doubled elements are zero. Retain `(0,E₁₂,E₂₁)` as a negative control. This fixes the Check without changing the valid characteristic-zero definition or theorem.

## R07 (P1) — The unipotent counterexample contradicts the actual weightPattern definition

**Location:** `packages/LieHighestWeightPartII/README.md:544`: the nontrivial unipotent and the identity allegedly have “equal patterns (every eigenvalue is `1`)”.

**Claim:** The pair satisfies the pattern-equality hypothesis after dropping semisimplicity.

**Witness:** On the standard two-dimensional module, `ker([[1,1],[0,1]] − I)` has dimension 1, while `ker(I − I)` has dimension 2. Therefore `weightPattern q u 0 = 1 ≠ 2`.

**Exact repair:** Take `s = s' = u = [[1,1],[0,1]]`, but `r = u` and `r' = 1`. The patterns are then identical by equality of the inputs. Both positive-part predicates hold on every representation, as §5.4 already explains, yet `u` and `1` are not conjugate. At degree zero the two standard patterns are now both 1; the conclusion still fails. Keep the eigenspace definition and the explicit semisimplicity hypotheses. Do not replace the definition by generalized eigenspaces merely to preserve this Check.

## R08 (P2) — The root-profile support bound is false on its declared domain

**Location:** `packages/LieHighestWeightPartII/README.md:355–361`: the definition accepts `a ∈ ℤ^r`, but bounds support by `Σ_i a_i θ_i`.

**Claim:** That bound holds for arbitrary integer label vectors.

**Witness:** In `G₂`, take `a = (−1,0)` and highest root `(3,2)`. The claimed bound is `−3`. At `m=0`, `|m| > −3`, but `D(a)_0 = 4`, not zero.

**Exact repair:** Keep the general definition. Use `B(a) = Σ_i |a_i| θ_i` for arbitrary integer labels; state the sharper original formula only for nonnegative labels. The corrected bound is 3 for this witness, and the nonnegative profile is `(4,2,1,2)`, supported through 3. Also replace “`H` is the zero-weight space” at line 355 by “`H` contributes rank `r` to the zero-weight space”: at `a=0` in `G₂`, the entire 14-dimensional algebra has weight zero, whereas `dim H=2`. The displayed root-count formula itself is correct and must be preserved.

## R09 (P2) — Positive-real-part recognition is unnecessarily restricted to semisimple groups

**Location:** `packages/LieHighestWeightPartII/README.md:535`; `packages/LieHighestWeightPartII/Suggested.lean:254`: `TauCeti.semisimpleCommHopfAlgProperty ℂ H`.

**Claim:** The supplied end theorem covers connected complex semisimple groups only, although its source and proof route cover connected reductive groups.

**Witness:** `G = G_m`, `q=4`, `s=2i`, `s'=2` have equal patterns in every character and positive parts both 2. This valid reductive instance is excluded solely because `G_m` is not semisimple.

**Exact repair:** Widen §§5.3–5.5, Summary, Conventions and the Lean theorem to connected complex reductive groups. Import `TauCeti.Algebra.AlgebraicGroup.Reductive.Basic` and use `TauCeti.reductiveCommHopfAlgProperty`. Retain semisimplicity of the two points, geometricity and `q>1`. The widened signature was elaborated in scratch: exit 0, eight `sorry` warnings. For character `z ↦ z^k` in the witness, both patterns are 1 at degree `k`, with trace of the positive part `2^k`; conjugacy in the torus is equality. CH line 314 sets the connected reductive dual-group context, and CH lines 1554–1565 use character separation, which ReductiveGroupsPartIII §0.5 states for reductive groups. The earlier repair report's observation that widening had not previously been requested does not override the general-library contract.

## R10 (P1) — ReductiveGroups Layer 6 does not construct a group from an arbitrary Killing Lie algebra

**Location:** `packages/LieHighestWeightPartII/README.md:143`: “the adjoint group of `L` … ReductiveGroups Layer 6”.

**Claim:** That section supplies, for arbitrary finite-dimensional Killing `L/K`, a connected semisimple algebraic group with a specified isomorphism `Lie(G) ≅ L`.

**Witness:** `TauCetiRoadmap/ReductiveGroups/README.md:1949–2042` treats structure of an already given group. Root-datum existence is instead at lines 3846–3854; the constructed group's Lie-algebra comparison is at lines 3056–3061.

**Exact repair:** Name the actual construction: choose the adjoint root datum of `L`; use ReductiveGroups §§9A.1, 9B and 9D for its split adjoint group and Lie-algebra comparison, and LieHighestWeight Layer 7 for the identification with `L`, componentwise for semisimple `L`. Add those exact inputs to the contract and §0.3's Needs/Dependencies. Alternatively provide an equally explicit earlier owner, but do not retain the Layer-6 claim. On `sl₂`, the construction gives `PGL₂`, whose differential has the three-dimensional bracket relations `[H,E]=2E`, `[H,F]=−2F`, `[E,F]=H`; over `K=ℚ̄` it has the same dimension and brackets. All proposed suppliers precede this package. This is a citation defect, not a request to reconstruct their group theory here.

## R11 (P3) — The invariant-form target lacks a source locator

**Location:** `packages/LieHighestWeightPartII/README.md:265–273`, §2.1, has no theorem, section or page locator.

**Claim:** Existence and the parity of the invariant form are given as sourced theorem targets, but only a roadmap Needs line is provided.

**Witness:** The entire subsection contains no external locator. KIR Theorem 5.6, printed p.61, KIR lines 2369–2375, gives the explicit ladder from which the stated form is directly derived.

**Exact repair:** After consuming native proportionality under R03, give a locator for the retained existence/parity result or explicitly present it as a consequence of KIR Theorem 5.6, equation (5.4), p.61. In the basis with `f v_j = v_(j+1)`, the form with anti-diagonal entries `(-1)^j` is invariant, nondegenerate and has transpose `(-1)^n` times itself. For `n=1` it is `[[0,1],[-1,0]]`; for `n=2` the anti-diagonal is `(1,−1,1)`. Record the extra KIR locator/cited-for in the existing manifest entry during the fix; do not create another key.

## R12 (P3) — The comparison Check calls an unspecified basis isomorphism the identity

**Location:** `packages/LieHighestWeightPartII/README.md:217`: for an arbitrary `M` and `K^(dim M)`, “the identity map intertwines”.

**Claim:** There is an identity map between these two generally different carriers.

**Witness:** Take `M` to be the degree-at-most-one polynomials. Its carrier is not `K²`. The coefficient map `a+bX ↦ (a,b)` is an isomorphism; it is not an identity map between the stated types.

**Exact repair:** Say “any chosen basis isomorphism intertwines the two trivial actions”. In the witness both actions are zero, so the coefficient map sends each action value `0` to `0`; both filtrations have a single jump of size 2 at degree zero. No preferred basis or canonical identity is being asserted.

## Verified sound

**Earlier review, checked finding by finding before the new pass.** Quotations here are from the repaired package, not from sources.

| Previous finding | Repaired passage | Disposition at this pin |
|---|---|---|
| F01, missing type-D headline | Suggested.lean:155, `exists_innerAut_of_finrank_weightFiltration_typeD`; README:309, “no restriction on the Jordan type” | Repaired mathematically. Both standard and actual even-half-spin filtrations occur. Import failure is R01. |
| F02, supposedly missing group carriers | Suggested.lean:231,240,252 defines `IsGeometricPoint`, `IsPositiveRealPart`, and the positive-part headline | Partly repaired: the carriers and statement are real and meaningful; the file still needs R01, and the generality needs R09. |
| F03, importing complex results over arbitrary K | README:11, “are proved here over `K`, in §0.3 and §3.1” | Generality repaired, ownership partly repaired: the new arguments are valid but native inputs now exist, R03. |
| F04, classical type identification | README:249, “by the Serre presentation … is isomorphic to” the matrix models | Partly repaired. ReductiveGroups 9A and the native type-D model provide the missing pieces; the new common rank range is false, R04. |
| F05, dominant uniqueness | README:341, “`W`-invariant polynomials separate the orbits of the finite group `W`” | Repaired. Finite-orbit polynomial interpolation and the product over W prove separation; Chevalley restriction is cited. |
| F06, centralizer assertion attributed to Layer 9 | README:341, “a Cartan subalgebra `H'` of `L_0` … is self-normalising in `L`” | Mathematical argument repaired; it is now a native theorem to consume, R03. |
| F07, exceptional Layer 7/8 attribution | README:399, “is LieHighestWeight Layer 8”; Suggested.lean:183 agrees | Repaired. Layer 8 contains the concrete exceptional identifications. |
| F08, root-subgroup generation | README:117, “by the Bruhat decomposition”, followed by rank-one and coroot-torus generation | Repaired. No reliance on an unproved assertion that individual coroot maps are isomorphisms. Algebraic closedness supplies surjectivity on points. |
| F09, unowned minuscule implication | README:296, “realised explicitly”, followed by exterior weights, irreducibility and highest-vector citations | Repaired. For even rank the even exterior summand has the required even-sign weights; rank 2 is handled separately. |
| F10, unnamed analytic owner/consumer boundaries | README:12, “Rational forms … are treated by neither roadmap”; line 15 names NoncompactQuantumSymmetry Layer 3 | Repaired. The analytic mention is a scope distinction, not an upward input. The consumer's remaining design-label/gap repairs remain outside this package; not re-raised. |
| F11, half-integrality headline omitted silently | Suggested.lean:33–35, “a short coset argument … kept in the README” | Repaired. It is explicitly accounted for without adding padding. |
| F12, Sommers licence classification | sources.toml, SOM: `licence_class = "institutional"` | Repaired. The recorded university-hosted copy is the one read. |

**Principles and shape.** This is an extension of LieHighestWeight, not a replacement roadmap. No computational algorithm is required by the text: §3.3 states a finite injectivity theorem, and the reviewer computations are evidence, not a proposed implementation. No copied source passage, sorry'd data, `set_option`, admitted example or own-name collision was found. README headings include Scope, Conventions, supplier contracts and build order; every layer ends with Examples and Dependencies. All 23 numbered subsections have Check blocks, at least three bullets each. The six Lean definitions/structures have real bodies; all fourteen own Lean names occur in the README, and its own backticked identifiers resolve to these declarations. Mathematical notation in backticks is not treated as a declaration claim. Missing locator and false Checks are findings, not waived by those counts.

**Elaboration and padding.** Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. From the content checkout, the prescribed `lake env lean` on the original file exits 1 because the old PointsAction object file is absent. The permitted targeted build of PointsAction, SemisimplePoint and Semisimple.Basic exits 1, confirming the first two source paths are absent. No broad build or dependency update was run.

Changing only the two imports to `.Basic` on a scratch copy yields exit 0 and precisely eight `declaration uses sorry` warnings. Appended `#check @...` commands printed all fourteen signatures. I compared the elaborated types with the README: no standing hypothesis was lost; the recognition quantifier is `Type (max u v)`; the type-D statement retains `P`, finite basis `b`, `hline`, and both filtrations; the positive-part theorem retains `q>1`, group property, both semisimplicity/geometricity hypotheses, equality on every finite comodule and both positive-part predicates. The types were unchanged by the import repair. A second scratch copy with the prescribed plain import header likewise exits 0 with only those eight warnings.

Every one of the eight sorried theorems was probed with `simp`, `rfl`, and `infer_instance`, using failure assertions so a successful tactic could not go unnoticed. All 24 closure probes fail; the probe file elaborates with eight remaining `sorry` warnings. The library near-match list was also examined: weight-space extensionality, transport of generalized weight spaces, classical carrier definitions, Killing transport and the existence of root triples do not prove filtration recognition. No single matching library theorem was found for any of the eight conclusions. Native auxiliary inputs that must be reused are R02–R03, not padding theorems to prove in place.

**Headline coverage.**

| README end theorem | Acceptance declaration/disposition |
|---|---|
| Restricted sl₂-module recovered from the filtration, §1.3 | `finrank_weightFiltration_eq_iff_exists_intertwiner`, line 85 |
| Classical A recognition, §2.4 | `exists_innerAut_of_finrank_weightFiltration_sl`, line 102 |
| Classical C recognition, §2.4 | `exists_innerAut_of_finrank_weightFiltration_sp`, line 116 |
| Orthogonal recognition away from very even partitions, §2.4 | `exists_innerAut_of_finrank_weightFiltration_so`, line 133; nonzero zero-eigenspace explicitly required |
| Full type-D recognition, §§2.3–2.4 | `exists_innerAut_of_finrank_weightFiltration_typeD`, line 155; the correct half-spin carrier is used |
| Exceptional adjoint recognition, §3.4 | `exists_innerAut_of_finrank_weightFiltration_adjoint_exceptional`, line 185; all five types occur |
| Semisimple recognition, §4.1 | `exists_innerAut_iff_finrank_weightFiltration`, line 205 |
| Prescribed factorwise finite test family, §4.1 | Module docstring:27–31 explicitly identifies the missing assembled decomposition with typed factors/test modules. No artificial substitute appears. Native simple ideals alone do not package this prescribed family. |
| Highest-weight half-integrality, §5.2 | Explicitly accounted for at docstring:33–35 as the supplier weight-coset corollary, kept out of the acceptance file |
| Positive-real-part recognition, §5.5 | `exists_conj_positiveRealPart_of_weightPattern_eq`, line 252; meaningful native signature, with the unnecessary restriction recorded in R09 |

**Computed adversarial pass.** The following table covers every seeded target, every headline and every finding's target. Other unchanged formulas were checked against the earlier review's computed rows, not its summary claims. I independently recomputed the exceptional data, the half-spin distributions and the newly problematic boundary cases. The finite enumeration uses simple reflections with `A_ij = <α_i,α_j∨>`; it starts from the simple roots and closes under all reflections. The five candidate sets were tested exhaustively, including E₆ opposition.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| §0.1 zero-inclusive predicate and its iff | zero; standard sl₂; swapped E/F; characteristic 2 | Zero: three brackets 0, but native `h≠0` false. Standard: `[E,F]=H`, `[H,E]=2E`, `[H,F]=−2F`. Swapped: `−H≠H`. In 𝔽₂, `[E,F]=I≠0` despite `2E=2F=0`. | Characteristic-zero iff holds both ways; R06 fixes the false Check. |
| §0.2 Int, adjoint image and inner twists | SL₂, `c=2`; abelian algebra; half-spin of so₈ | `w(2)=[[0,2],[-1/2,0]]`; `w(2)w(1)⁻¹=diag(2,1/2)`; conjugation sends `E` to `4E`. `exp(ad E)H=H−2E`; abelian `ad x=0`, both Int definitions give `{1}`. Spin reflection swaps the two top indices `4,3`. | Group/sign conventions agree; R02 reuses native carrier. |
| §0.3 raising map and neutral conjugacy | standard sl₂; zero; rescaled triple | `ad E(H)=−2E`, image dimension 1 = `dim L₂`. Zero: `dim L₀=3`, image dimension 0 = `dim L₂`. `(H,4E,F/4)` is the image under `diag(2,1/2)`. | Algebraic claims hold; R03/R10 repair input ownership. |
| §1.1 restriction | trivial K²; standard triple and exchanged triple; minimal sl₃ triple | Trivial restriction `2V(0)`; standard eigenvalues `±1`, coordinate swap interchanges them; minimal adjoint weights `2,1,1,0,0,−1,−1,−2` equal those of `V(2)⊕2V(1)⊕V(0)`. | Holds; pullback is the native homomorphism construction. |
| §1.2 increasing filtration | V(1); adjoint sl₂; zero module; zero triple | V(1): dimensions `0,1,2` across its two jumps. Adjoint at −2…2: `1,1,2,2,3`; decreasing alternative `3,2,2,1,1`. Zero module: all 0. Zero triple: `0` below 0, `dim M` thereafter. `[E,F]=H∉KF`. | Direction and non-submodule warning correct. |
| §1.3 recovery iff | `V(2)⊕2V(0)`; equal-dimensional nonisomorphic restrictions; trivial actions on different carriers | `d₀=3,d₂=1` gives `m₀=2,m₂=1` and `W₀=4`. V(2) vs V(0)⊕V(1): cumulative arrays `1,1,2,2,3` vs `0,1,2,3,3`; no intertwiner. Trivial dimension-2 carriers both give jump 2, coefficient isomorphism intertwines zero actions. | Both directions hold; natural subtraction justified by actual multiplicities; R12 corrects the named map. |
| §1.4 exactness, tensor and dual | V(1)² tensor; inclusion/projection for V(1)⊕V(0); dual unit | Tensor graded values `1,2,1` at −2,0,2 and cumulative `1,1,3,3,4`. Projection onto V(0) has step ranks 0 at −1 and 1 at 0, equal to the target step ranks. Dual V(1) dimensions at −2…1 are `0,1,1,2`, matching the annihilator formula; wrong shift gives 0 rather than 1 at −1. Unit jumps 1 at 0 on both sides. | Strictness, exactness and the `−i−1` shift pass. |
| §2.0 classical types | ranks 1,2,3,4; so₂ | so₃ and sp₂: dimension 3, roots `±ε` and `±2ε`. so₄: dimension 6, roots split into two orthogonal A₁ pairs. so₅/sp₄: 10; so₆/sl₄: 15. Rank 4: `28=4+24`, `36=4+32`. so₂: Killing rank `0<1`. | R04; corrected rank ranges preserve all nondegenerate examples. |
| §2.1 invariant forms | V(0), V(1), V(2); wrong symmetric form on V(1) | Normalized anti-diagonals `(1)`, `(1,−1)`, `(1,−1,1)` have transpose signs `+1,−1,+1`. Trace form has `tr(H²)=2`. Identity pairing on V(1) gives `B(Ev₂,v₂)+B(v₂,Ev₂)=0`, but on `(v₂,v₁)` gives `1≠0`, so fails invariance. | Parity/existence correct; R03 imports proportionality; R11 adds locator. |
| §2.2 partitions and splitting | sp₄ (3,1)/(2,2); so₄; so₈; V=0 | sp₄ (3,1): odd multiplicities 1,1 forbidden; (2,2) allowed. Reflection determinant on V(n)⊗line is `(−1)^(n+1)`. so₄ (2,2): 2 classes; (3,1): 1. Empty partition: stated criterion predicts 2, actual count 1. | R05 supplies positive-dimension qualifier for splitting only. |
| §2.3 half-spin separation | a=(3,3,1,1), (1,1,1,1), (1,1); both parity summands | First pair S⁺ weights: `{-4:1,−2:1,0:4,2:1,4:1}` vs `{-3:2,−1:2,1:2,3:2}`. Second: `{-2:1,0:6,2:1}` vs `{-1:4,1:4}`. Rank 2: `{-1:1,1:1}` vs `{0:2}`. Maxima are `(4,3),(2,1),(1,0)`; full spin has equal maximum A for each pair. | Correct parity and top-jump convention; the full-spin wrong model is excluded. |
| §2.4 A and C headlines | sl₀, sl₁, sp₀; sl₃ minimal/regular; sp₂ | Zero carriers: only zero triple, identity conjugator. sl₃ standard spectra `(1,0,−1)` vs `(2,0,−2)`, unequal filtrations. sp₂ zero/standard jumps `2@0` vs `1@−1,1@1`. | True at degenerate and nonzero instances; determinant rescaling uses algebraic closedness. |
| §2.4 orthogonal headline | so₀,so₁,so₂; so₇; so₈ (4,4) | so₀: kernel condition false. so₁/so₂: only zero triple, full standard kernel. Odd dimension forces an odd block and at least one zero weight. (4,4): standard weights `±3,±1`, each twice; kernel 0 for both classes. | The nonzero-kernel proviso excludes the genuine ambiguous case. |
| §2.4 split type-D headline | ranks 0,1,2,4 | Rank 0 spin-plus dimension 1, only zero triple; rank 1 algebra abelian, only zero triple. Rank 2 standard restriction on either factor is 2V(1), while S⁺ is V(1) vs 2V(0). Rank 4 (4,4) has equal standard distributions but S⁺ maxima 4 vs 3. | New signature separates precisely the missing classes; finite basis excludes infinite-dimensional finrank junk. |
| §3.1 characteristic and repaired route | sl₂; sl₃ regular; hypothetical label 3; W=S₂ | Labels 2 and (2,2) satisfy the bound. A weight −3 killed by E is forbidden by sl₂ theory. On the Cartan, invariant `x²` has values 1 and 4 on orbits `{±1}`, `{±2}`. E₆ opposition leaves `3⁴=81` out of 729 label vectors. | Correct argument, but native inputs must be consumed under R03. |
| §3.2 profile | zero; G₂ principal; negative label; rank term | G₂ zero: `D₀=14`, Cartan contributes 2. Principal nonnegative half `(2,0,2,0,1,0,1,0,1,0,1)`, total 14. Negative label (−1,0): `(4,2,1,2)`, support radius 3, old bound −3. F₄ principal `D₀=4`, cumulative `F₀=28`; omitting rank gives total 48 instead of 52. | Formula correct; R08 fixes its unrestricted bound and zero-space wording. |
| §3.3 candidate injectivity | exhaustive five-type label sets | Root counts `12,48,72,126,240`; candidates `7,28,34,274,245`; distinct profiles `7,28,34,274,245`. E₆ without opposition: 212 candidates, 123 profiles. G₂ (2,0) has `d₄=1<d₆=2`; its excluded label contrasts with the seven listed candidates. | Pass in every type; C_T is strictly larger than the realised characteristics, as stated. |
| §3.4 exceptional headline | five G₂ classes; zero; classical negative control | G₂ nonnegative profiles `14`; `(4,4,1)`; `(4,2,1,2)`; `(4,0,4,0,1)`; principal row above: five distinct values. Zero jumps `dim L` at 0. so₈ very-even pair has equal adjoint distributions under the outer automorphism. | Exceptional restriction is substantive, not a universal adjoint claim. |
| §3.5 table convention | principal G₂/F₄/E₈; F₄ short/long rows | Top degrees `10,22,58`; zero coefficients `2,4,8`. F₄ `4,0,4` decreases and cannot be cumulative; cumulative degree 0 is 28. Minimal rows `(22,14,1)` and `(22,8,7)` each total 52 after reflection. | Graded interpretation correct; source misprints recorded below. |
| §4.1 recognition and factor tests | L=0; sl₂×sl₂ with (t,0)/(0,t) | Zero: identity conjugator, every filtration equal. Product adjoint weights for both: `2,0,−2,0,0,0`; first-factor standard gives `1@±1` versus `2@0`, so degree −1 dimensions 1 vs 0. | Both directions agree; factor-selective modules prevent exchange of isomorphic ideals. |
| §§5.1–5.2 half-integrality | A₁, ν(α)=1/2 and 1/3; λ=3ω; PGL₂; Q=0 | With α=2ω, ν(ω)=1/4, ν(3ω)=3/4; all relevant odd weights fail half-integrality. With ν(α)=1/3, λ=0 gives 0 in ½ℤ but μ=α gives 1/3 outside. PGL₂ highest weights kα give k/2; Q=0 gives the singleton λ. | Both iff directions and actual-character-lattice restriction pass. |
| §5.3 patterns and geometricity | zero/trivial; diag(√q,1/√q); tensor square; q=1; nondiagonal block | Patterns 0, δ₀, `1@±1`, then `1,2,1@−2,0,2`. At q=1 all indices select modulus 1, explaining q>1. J₂(√q) has pattern 1, not 2. At q=3, weights 2^k and 5^k are powers of √3 only for k=0, so their patterns agree in every SL₂ module despite different positive parts. | Definitions meaningful; API used only for semisimple geometric inputs. |
| §5.4 positive-part predicate | diag(z,z⁻¹); z=i; unipotent u | Positive eigenvalues `|z|,|z|⁻¹`; z=i yields identity, whereas s acts by i on one eigenline and fails the predicate as its own positive part. For u, both u and 1 act by 1 on every fixed vector. | Predicate uniquely pins the part at semisimple s; not at unipotent s. |
| §5.5 positive-part headline | Weyl pair; phase pair; identity vs positive diagonal; corrected unipotent witness; G_m | Equal phase patterns give trace `√q+1/√q` at both positive parts. Identity has trace 2 instead. Original unipotent example has standard degree-zero counts 1 vs 2; corrected s=s'=u gives 1 vs 1 but r=u,r'=1 not conjugate. G_m character k gives `1@k`, positive trace `2^k` for s=2i,s'=2,q=4. | Headline valid at stated scope; R07 fixes Check, R09 restores reductive scope. |

The remaining untouched identities (direct sums of profiles, tensor-unit conventions, integer support and inverse reconstruction of `d_i` from `m_n`) follow from the displayed decompositions. The earlier review contains computed values for these same objects; none was accepted on the strength of its generic “sound” description. No characteristic-p statement is inferred from the characteristic-zero theorems. Rank zero, p=2, nonsemisimple operators, outer automorphisms, omitted geometricity, and negative labels were tested where their definitions admit them.

**Seeded source audit.** All four recorded cached texts were readable; none is waived, uncertified or flagged unverified in the manifest. No additional work needed fetching. Printed pagination and theorem/section identifiers were checked in the cached versions, not guessed from a published edition.

| Seeded target | Text and locator read | Support and limits |
|---|---|---|
| 0.1 Zero-inclusive triples | CH §2.1, relations (2.1), p.6; CH lines 272–283 | Three relations, algebraically closed characteristic-zero field. The zero-inclusive convention is explicit; R06 is the package's extrapolated Check, not a source claim. |
| 0.2 Inner automorphisms/adjoint group/twists | CH Lemma 10.9, p.35; CH lines 1701–1708 | Quantifies over all Lie modules and concludes adjoint conjugacy. The exponential/adjoint identification is the package's supplied-input argument, not a separately stated theorem at this locator; R10 identifies its missing construction citation. |
| 1.1 Restriction | CH Lemma 10.9 proof, p.35; CH lines 1707–1708 | Restriction to sl₂ and recovery from weight data. Zero triple requires the separate zero homomorphism, since its span is zero, not sl₂. |
| 1.2 Filtration | CH Definition 2.2, p.6; CH lines 284–295 | Increasing convention, raising by 2, neutral action on degree i. The explicit integer-eigenspace formula implements this convention. |
| 1.3 Recovery | CH Lemma 10.9 proof, p.35; CH line 1708 | Supports uniqueness of the restricted sl₂-module; the multiplicity inversion is derived from standard weight strings. |
| 1.4 Tensor/dual/exactness | CH Definition 2.2, p.6; CH lines 284–295 | Symmetric monoidal weight filtration; exactness and the dual shift are derived explicitly, not attributed to an absent numbered theorem. |
| 2.0 Classical matrix types | KIR Theorem 6.33, p.75, lines 2919–2933; Appendix C.1–C.4, pp.124–129, lines 4760,4835,4888,4958 | Root lists match. KIR's fields are ℝ/ℂ; the algebraic extension over K is supplied by the named matrix/presentation results. KIR excludes so₂ from semisimplicity, exposing R04. |
| 2.3 Half-spin | CH Lemma 10.9 proof, p.35; CH lines 1716–1727 | Very-even split and half-spin maximum distinguish the classes; coordinate and filtration misprints are corrected by the roadmap's own conventions. |
| 2.4 Classical recognition | CH Lemma 10.9 proof, p.35; CH lines 1709–1727 | Standard-module partition comparison, with the very-even exception. The broad zero-dimensional splitting error is the package's extension, R05. |
| 3.3 Candidates | CH Lemma 10.9 proof, p.35; CH lines 1728–1733; DG Tables 2–6, pp.7–16 | CH asserts separation of realised characteristics, not the larger candidate set. The roadmap states this distinction; independent exhaustive values establish its stronger finite assertion. |
| 3.4 Exceptional recognition | Same CH locator | The five-type assertion is correct; the claimed Levi shortcut in the source is insufficient. The package instead proves E₆/E₇ directly. |
| 4.1 Recognition | CH Lemma 2.4, p.6, lines 296–300; Lemma 10.9, p.35, lines 1701–1708 | Semisimple vs simple hypotheses match their separate uses. Product-factor argument supplies the finite family. |
| 5.3 Patterns | CH Definition 2.5, p.7, lines 323–329; §10.1, p.32, lines 1549–1553 | CH's arithmetic geometricity includes algebraicity and all embeddings. The package explicitly defines a complex modulus version; the character proof needs only that version. Ordinary eigenspaces require semisimplicity to equal multiplicities. |
| 5.4 Positive real part | CH §10.1 proof, p.32, lines 1555–1565; torus polar decomposition at CH line 781 | Supports the multiplicative torus positive part and trace formula. The roadmap uses the positive group element, not CH's earlier logarithmic parameter; its `exp((log q)H/2)` example fixes this normalization. |
| 5.5 Recognition | CH Proposition 10.2, p.32, lines 1554–1565 | Equal weighted traces and separation of semisimple classes. Nothing in the proof requires the connected reductive group to have finite centre; R09. |

Additional repaired-locator checks: DG §2, p.3, lines 79–94 and §3, Lemmas 2–3, p.4, lines 139–153 support the label/decomposition and open-orbit route; SOM §3.1, pp.15–16, lines 361–380 supports neutral-element injectivity and the simple-root bound over ℂ. CH Lemma 6.30, p.24, lines 1158–1171 gives the root-coset argument; dominance is unnecessary for that proof, correctly omitted here. The manifest has one key per work, legal provenance, and version notes for the uncollated published editions.

**Library declarations opened at the pins.** These are direct source inspections, not name-search verdicts. Paths beginning `Mathlib/` and `TauCeti/` refer to the libraries at the revisions above.

| Object | Declaration and file:line | Hypotheses / what it actually supplies |
|---|---|---|
| Nonzero triple | `IsSl2Triple`, `Mathlib/Algebra/Lie/Sl2.lean:38` | Lie-ring predicate with `h_ne_zero` plus precisely the three bracket fields. It does not include the zero triple. |
| Killing condition | `LieAlgebra.IsKilling`, `Mathlib/Algebra/Lie/Killing.lean:50` | Killing orthogonal complement of top is bottom; excludes nonzero abelian algebras. |
| Classical carriers | `sl`, `sp`, `so`, `typeD`, `typeB`, `Mathlib/Algebra/Lie/Classical.lean:92,157,166,252,321` | Finite matrix index types; `so` uses the identity Gram form, `typeD/typeB` split Gram forms. |
| Form changes | `typeDEquivSo'`, `typeBEquivSo'`, `soIndefiniteEquiv`, same file:290,373,224; `Matrix.reindexLieEquiv`, `Mathlib/Algebra/Lie/Matrix.lean:85` | Invertible 2, actual square root of −1 and actual index equivalence, respectively. |
| Cartan/root inputs | `LieAlgebra.exists_isCartanSubalgebra_engel`, `Mathlib/Algebra/Lie/CartanExists.lean:374`; `LieAlgebra.IsKilling.rootSystem`, `Mathlib/Algebra/Lie/Weights/RootSystem.lean:411` | Finite-dimensional/infinite-field Cartan existence; Killing algebra with split Cartan for root system. |
| Filtration carrier | `CategoryTheory.FilteredObject`, `Mathlib/CategoryTheory/Filtration/Basic.lean:73` | Object plus filtration; the filtration uses monomorphisms into the underlying object. Does not assert an abelian category of filtered objects. |
| Homomorphism from relations | `TauCeti.lieHomOfSl2Basis`, `TauCeti/Algebra/Lie/Sl2/Basic.lean:359` | Source basis satisfying the relations and target elements satisfying them, zero target allowed. |
| Spectrum | `TauCeti.exists_int_of_hasEigenvalue`, `iSup_eigenspace_toEnd_intCast_eq_top`, `isInternal_eigenspace_toEnd_intCast`, `TauCeti/Algebra/Lie/Sl2/Spectrum.lean:151,327,341` | Finite-dimensional module, native nonzero triple, characteristic zero; integral decomposition even drops algebraic closedness. |
| Complete sl₂ decomposition | `TauCeti.Sl2Std.exists_isInternal_lieModuleEquiv`, `TauCeti/Algebra/Lie/Sl2/Decomposition.lean:68` | Algebraically closed characteristic-zero field, finite-dimensional module; returns finite internal decomposition and actual module equivalences. |
| Weight symmetry | `TauCeti.finrank_eigenspace_toEnd_neg`, `TauCeti/Algebra/Lie/Sl2/WeightMultiplicity.lean:167` | Native triple and finite-dimensional module over a characteristic-zero field. |
| Ad-nilpotent action | `TauCeti.isNilpotent_toEnd_of_isNilpotent_ad`, `TauCeti/RepresentationTheory/Lie/AdNilpotent.lean:95`; `TauCeti.exists_lie_eq_self_of_isNilpotent_ad`, `TauCeti/Algebra/Lie/Killing/AdNilpotent.lean:211` | Finite-dimensional Killing algebra, characteristic zero; first also requires finite-dimensional module. |
| Exponentials | `LieDerivation.exp`, `Mathlib/Algebra/Lie/Derivation/Basic.lean:398`; `TauCeti.ratLieAlgebra`, `expAd`, `TauCeti/Algebra/Lie/InnerAutomorphism.lean:99,109` | Finite exponential of nilpotent derivation, with rational scalar structure. |
| Inner group, R02 | `TauCeti.intLieAlgebra`, `intLieAlgebraLieEquiv`, `TauCeti/Algebra/Lie/AdjointAction/InnerAutomorphismGroup.lean:70,108` | Closure of all ad-nilpotent exponentials in the native general linear group; no finite-dimensionality assumption in the definition. |
| Raising map, R03 | `IsSl2Triple.map_toEnd_e_eigenspace`, `map_ad_e_eigenspace_zero`, `TauCeti/Algebra/Lie/Sl2/EigenspaceMap.lean:188,209` | Characteristic-zero finite-dimensional modules; arbitrary-weight surjectivity excludes nonpositive target lowest-weight obstructions. Includes every integer source weight ≥−1. |
| Label bound, R03 | `IsSl2Triple.root_apply_eq_zero_or_eq_one_or_eq_two`, `TauCeti/Algebra/Lie/Sl2/WeightedDiagram/Basic.lean:124` | Finite-dimensional Killing algebra, split Cartan, native triple in Cartan and dominant natural simple-root evaluations. Valid over the package's K. |
| Cartan containment, R03 | `TauCeti.exists_isCartanSubalgebra_mem_of_isSemisimple_ad`, `TauCeti/Algebra/Lie/CartanExists.lean:45` | Finite-dimensional Lie algebra over an infinite field and semisimple adjoint action. Exactly the new centralizer argument. |
| Cartan conjugacy | `LieSubalgebra.exists_map_intLieAlgebraLieEquiv_eq`, `TauCeti/Algebra/Lie/AdjointAction/CartanConjugacy.lean:74` | Algebraically closed characteristic-zero field, finite-dimensional Killing algebra. This also makes the older roadmap citation consumable natively. |
| Form proportionality, R03 | `TauCeti.LieModule.exists_eq_smul_of_lieInvariant`, `TauCeti/Algebra/Lie/InvariantForm/Basic.lean:141` | Finite-dimensional irreducible module over an algebraically closed field, two invariant bilinear forms, one nonzero. Does not construct the form or determine its parity. |
| Half-spin spaces | `TauCeti.spinPlus`, `spinMinus`, `TauCeti/RepresentationTheory/Spin/HalfSpin/Basic.lean:119,125` | Even/odd Clifford grading of the zero quadratic form on the isotropic summand, i.e. the exterior realization. |
| Half-spin action | `TauCeti.SpinPolarizationData.typeDSpinPlusLieRep`, `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/Representation.lean:96` | Basis of W, finite index type, line=bottom, invertible 2; domain is Mathlib typeD, not an unavailable carrier. |
| Half-spin irreducibility/weights | `isIrreducible_typeDSpinPlusLieRep`, `Polarization/Irreducible.lean:201`; `typeDSpinLieRep_apply_cartan_exteriorBasis`, `Polarization/TypeD/CartanWeights.lean:131`; `formalCharacter_typeDSpinLieRep`, `Polarization/TypeD/Character.lean:47` | Actual pulled-back Lie actions; the diagonal weight has +½ on the exterior subset and −½ off it. Paths are under `TauCeti/RepresentationTheory/Spin/`. |
| Highest vector/type-D structure | `isHighestWeightVector_typeDSpinPlusLieRep_exteriorBasis_univ_of_even`, `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/HighestWeight.lean:197`; `TauCeti.TypeDStd.isSimple_typeD`, `isKilling_typeD`, `TauCeti/Algebra/Lie/Orthogonal/TypeD/Killing.lean:265,308`; `lieBasis`, `TypeD/Basis.lean:45` | Highest-vector claim uses even half-rank ≥4; Killing/simple and basis require rank ≥4. Lower ranks are not silently obtained from these results. |
| Point action/semisimple points | `TauCeti.Comodule.basePointsRepresentation`, `TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction/Basic.lean:102`; `TauCeti.HopfAlgebra.IsSemisimplePoint`, `Representation/SemisimplePoint/Basic.lean:81` | Action on the original comodule; semisimplicity tested on every finite comodule after scalar extension. Over ℂ base points these are the required operators. |
| Group properties | `TauCeti.semisimpleCommHopfAlgProperty`, `TauCeti/Algebra/AlgebraicGroup/Semisimple/Basic.lean:73`; `TauCeti.reductiveCommHopfAlgProperty`, `Reductive/Basic.lean:70` | Native geometric group properties; neither is an empty predicate. Reductive property is sufficient for the final source theorem. |
| Classical group reductivity | `TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`, `TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Reductive.lean:149`; symplectic counterpart, `Symplectic/Reductive/Basic.lean:102` | SO requires characteristic different from 2; Sp is valid over every field. SO dimension two is reductive but not semisimple. |

**Ownership, open heads and suppliers.** Read the board package index before checking absence; its three entries do not overlap these Lie-theoretic objects. Used `roadmaps grep` by object, including very-even splitting, half-spin separation, weight patterns, positive parts, invariant bilinear forms, neutral conjugacy and inner groups. Read the closest heads: LieHighestWeight #1797 and #1220, SpinRepresentations #1207, ReductiveGroups #1332, ClassicalGroups #1192, and the actual new supplier ReductiveGroupsPartIII #2131. Revisions of existing roadmaps are context, not new dependencies.

The classical and spin roadmaps own their representation constructions; this package owns recognition from those representations, not their reconstruction. In particular, SpinRepresentations #1207, `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:279–291`, explicitly consumes the native Fock/type-D core. LieHighestWeight #1220, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1076–1084`, has the general invariant-form sign theorem. The retained §2.1 is the explicit rank-one form and its elementary parity calculation used by partition theory; it is not that general sign theorem. Its generic proportionality clause is already native and is covered by R03. No other read head states the eight recognition headlines under these fully qualified names.

Every named cross-roadmap supplier was resolved on main or its allowed new head:

| Citation in package | Resolution and scope |
|---|---|
| LieHighestWeight Layers 0–6 | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:319,351,370,405,537,567,773`: standard sl₂, roots, weights, highest weights, irreducibles, complete reducibility and characters. General form uniqueness is not invented by those citations; R03 uses its actual native owner. |
| LieHighestWeight Layer 7 | Same README:980–1067 for Chevalley restriction/Int/Cartan conjugacy; Serre presentation later in Layer 7. #1797 preserves Layer 7, including §7.2 and §7.5; #1220 includes former-layer mappings. No dropped cited layer without a map was found. |
| LieHighestWeight Layers 8–9 | Same README:1197 and 1432: exceptional identifications, reductive/general-linear theory. They do not alone assert the type-B/C matrix model; the repair correctly adds ReductiveGroups 9A. |
| NilpotentOrbits N0.2/N0.3, N2.1/N2.2/N2.4, N4 | `TauCetiRoadmap/NilpotentOrbits/README.md:101,113,162,169,187,215`; principal group setting is complex at line 13. General-K comparisons now come from native results where available. Rational orbit classification is not silently assigned to this source. |
| RootSystems old Layers 4–6 | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:1134–1138` explicitly maps the old layer numbers to native chamber, Dynkin classification and integral-root-data owners. This is a valid old-to-new mapping, not drift. |
| SpinRepresentations Layer 5 | Main's half-spin/Fock theory, with the rank/parity convention confirmed against the native type-D action above; the general-K action is imported from Tau Ceti, not inferred from a complex-only section. |
| ReductiveGroups Layers 1–7, 9A, 10B | Main `TauCetiRoadmap/ReductiveGroups/README.md:1030,1230,1262,1687,1880,1949,2253,3046,4087`; 9A.1b's actual matrix comparisons are at 3290–3330. Layer 6 fails only the additional reconstruction attribution in R10. |
| ReductiveGroupsPartIII RG3.0 | #2131 `TauCetiRoadmap/ReductiveGroupsPartIII/README.md:117–122` maps RG3.0 to Layer 0 and character-separation to §0.5; the latter is at 451–465. Its character-ring input is explicitly consumed from SchemeKTheoryOperations §6.3.1 at 81–83 and 261–264. Thus read RG3.0 as this composed supplier, not as ownership of a newly constructed representation ring. |
| NoncompactQuantumSymmetry Layer 3 | Scope-only analytic comparison, not a Needs edge. Its real-Lie-group statement is distinguished from §0.2's algebraic one. |

The supplied overlap report lists no shared-head conflict or dropped cited id. Inspection of the closest heads and the explicit former-numbering maps agrees with that result. Consumer design-label references noted in the previous repair are not re-raised as changes to this package. Ownership against other open heads was searched through the provided index; a full semantic review of every unrelated pull request was not performed.

**Dependency check**, run on the unmodified README, output verbatim:

```
depcheck: 234 roadmaps, 2115 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. In the supplied order, ReductiveGroupsPartIII is at 240 and this roadmap at 241; main suppliers are earlier by contract. Every Needs line was read, not merely passed through the checker. The check does not detect R10's mistaken section content. The plan has `gaps = []`, matching the absence of declared supplier gaps; acceptance is not conditional on any gap.

## Not verifiable

- The original `Suggested.lean` cannot be certified as elaborating: it fails on the two absent module paths (R01). The successfully checked scratch repair is evidence for the repair, not a passing build of the submitted file.
- Published CH and DG versions, and the published Cambridge edition of KIR, were not compared with their preprint/draft numbering. The roadmap explicitly cites the cached versions and records that distinction. All sampled locators in those cached versions were readable; no missing-reference request is needed.
- CH's unpublished computational verification and its unsupported implication from E₈ to Levi subalgebras were not independently recoverable from that text. The package does not rely on them: direct computed root-profile injectivity for E₆ and E₇ was checked here.

## Source issues

- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH lines 1720–1725: the source combines ascending neutral coordinates with descending-chain simple roots; it should reverse the chain roots or reverse the coordinates; affects nothing.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH lines 1726–1727: the source takes a largest index with nonzero increasing filtration; it should take the largest nonzero graded index, or largest filtration jump; affects a stated result.
- **Misprint** in CH at Tables 2–4, printed pp.36–37, CH lines 1734,1813,1831: the source labels graded multiplicities as filtration dimensions; it should label the graded pieces, whose cumulative sums give filtration dimensions; affects a stated result.
- **Gap** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH lines 1731–1733: the source infers E₆/E₇ adjoint separation from the E₈ result via Levi inclusion; it should justify both the complementary summands and descent of conjugacy, or verify those types independently; affects the proof.
- **Misprint** in SOM at §3.1, printed p.15, SOM line 356: the source composes the target adjoint automorphism on the source side of the homomorphism; it should postcompose the sl₂-to-g map with the automorphism of g; affects nothing.
- **Error** in KIR at Appendix C.2 and C.4, printed pp.125 and 128, KIR lines 4828–4829 and 4951–4952: the source describes right multiplication by the Gram matrix as a Lie-algebra isomorphism to the identity-form orthogonal algebra; it should use conjugation from an actual congruence between forms; affects a stated result.
- **Misprint** in KIR at Appendix C.4, printed p.128, KIR line 4951: the source names the odd-dimensional orthogonal algebra for the even-dimensional model; it should name so(2n,C); affects nothing.
- **Misprint** in KIR at Theorem 5.7(2), printed p.62, KIR lines 2414–2416: the source has the raising and lowering isomorphism directions interchanged; it should send weight −n to n by e^n and n to −n by f^n; affects a stated result.
