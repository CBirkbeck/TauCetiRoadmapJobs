# Review of TopologicalKTheory (pull request #1781 at c4dda33)

**Verdict:** needs changes

The pull request changes 26 lines of `TauCetiRoadmap/TopologicalKTheory/README.md` (T6.4, lines 1021–1044: the continuous principal-bundle foundation placed before the compact-group descent). `Suggested.lean` and `metadata.toml` are byte-identical to main, and nothing outside the folder changes. The review is of the whole folder at this head, as the brief asks, so the blocking findings below (R01, R02) are inherited from main and not introduced by the diff; the diff itself adds only the P3 items of R03. The gate fails at this head (`build=13`, `imports=1`, `mathlib-subimports=13`, `no-import-mathlib=1`, `sorry-data=3`, `blob=4`, `prnum=1`), so there is no acceptance until it passes.

## R01 (P1) — Gate build and import rules fail: thirteen `Mathlib.<submodule>` imports and no `import Mathlib`

**Location.** `TauCetiRoadmap/TopologicalKTheory/Suggested.lean` lines 1–15: `import TauCeti.RingTheory.PowerSeries.Log`, then `import Mathlib.RingTheory.PowerSeries.Derivative` … `import Mathlib.Analysis.Complex.Polynomial.Basic`, then `import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic`.

**Claim.** The file imports the pinned libraries in the required form.

**Witness.** The worker's gate at c4dda33 reports `build=13 FAIL`: one module-system warning per `Mathlib.<submodule>` import ("imports … from package `mathlib`, which is designed for use with the module system"), plus `imports=1`, `mathlib-subimports=13`, `no-import-mathlib=1`. Under `lake env lean` the file elaborates with only the seventeen `declaration uses sorry` warnings (exit 0), so the mathematics is not the problem; the import header is.

**Repair.** Replace lines 1–15 by

```lean
import Mathlib
import TauCeti.RingTheory.PowerSeries.Log
import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic
```

Both `TauCeti.*` modules exist at the pinned Tau Ceti (358314d) and are the only Tau Ceti modules the file uses (`PowerSeries.logDeriv`, `logDeriv_mul`; `TauCeti.SplitK0` and its monoidal instances). Everything the thirteen submodule imports supplied is in `import Mathlib`.

## R02 (P2) — Sorry'd data: two `def`s with a `sorry` in their body and one `def` that is entirely `sorry`

**Location.** `Suggested.lean` line 238 `finiteGrassmannianFrameSpan` (body `⟨Submodule.span 𝕜 (Set.range f.1), by sorry⟩`), line 258 `finiteGrassmannianOrthonormalSpan` (same shape), line 274 `finiteGrassmannianQuotientConventionEquiv` (`:= by sorry`). The instance at line 242 and the theorems at lines 246, 250, 263, 279 mention them.

**Claim.** The file contains no sorry'd data.

**Witness.** Gate `sorry-data=3` at the three lines above. The `finrank` proofs are real one-liners at the pin: `finrank_span_eq_card` (`Mathlib/LinearAlgebra/Dimension/Constructions.lean:458`, for a linearly independent family indexed by a `Fintype`) gives `finrank 𝕜 (span 𝕜 (range f)) = Fintype.card (Fin r) = r`; for the orthonormal frame, `Orthonormal.linearIndependent` (`Mathlib/Analysis/InnerProductSpace/Orthonormal.lean:183`) gives linear independence of `fun j => toLp 2 (f j)`, which transports to `f` along the linear equivalence `WithLp.linearEquiv`.

**Repair.** Give the two span definitions their real `finrank` proofs by those two lemmas (so the topology instance at line 242 no longer mentions a `sorry`). For the convention comparison, either give `finiteGrassmannianQuotientConventionEquiv` a real body (the forward map sends `V` to the `Module.Grassmannian` point with `toSubmodule := V`, whose quotient is a finite-dimensional vector space, hence finite and projective, with `rankAtStalk` equal to `finrank (… ⧸ V) = N − r` at every prime; the inverse reads off `toSubmodule`), or delete the `def` together with `finiteGrassmannianQuotientConventionEquiv_submodule` and state the comparison as one sorried `theorem`: for `r ≤ N` there exists an equivalence `finiteGrassmannian 𝕜 r N ≃ Module.Grassmannian 𝕜 (Fin N → 𝕜) (N − r)` whose underlying submodule is the identity. Tested on the instance `r = 0, N = 0`: the convention equivalence must send the unique point `{0}` to the Grassmannian point with zero quotient, which the body above does.

## R03 (P3) — The new T6.4 foundation: relation to SBC B1.1's mixin, a leftover re-plan, and no locators

**Location.** README lines 1021–1044 (the new text) and lines 1049–1051 (retained): "Build the continuous principal/associated-bundle category needed here and compare smooth descent with SmoothBundlesConnections."

**Claims and witnesses.**

1. The new paragraph defines the principal structure as "Mathlib's actual `FiberBundle`, `Trivialization` and `Bundle.TotalSpace` with a right `MulAction (MulOpposite H)` and equivariance of every atlas trivialization". SmoothBundlesConnections on main, Conventions (`TauCetiRoadmap/SmoothBundlesConnections/README.md` lines 114–118) and Scope (lines 25–26, "the principal-bundle mixin on Mathlib's fibre-bundle data and its smooth atlas (B1.1)"), define the same mixin in the same encoding, with the smooth-atlas condition as an extra requirement and Lie structure groups. CharacteristicClasses on main (line 19) and the open SpinGeometry pull request name TopK T6.4 as the owner of the *continuous* category, so ownership is consistent across consumers; what is missing is the one clause that says how this object differs from B1.1's (no smooth-atlas condition, Hausdorff topological structure group, paracompact Hausdorff rather than manifold bases) and that B1.1's structure is its smooth specialization. "Compare the smooth specialization with SmoothBundlesConnections B1–B2" compares results; it does not say which of the two definitions the Lean mixin is.
2. The retained sentence at lines 1049–1050 still says "Build the continuous principal/associated-bundle category needed here", which the paragraph immediately above now does: the same construction is planned twice in one item.
3. None of the ten claims of the new paragraphs carries a locator (cocycle gluing, change of section and refinement, numerability over paracompact Hausdorff bases, preservation by pullback, homotopy invariance over X×I, associated bundles, extension of the structure group), and the References list has no principal-bundle source at all. The brief treats a target without a locator as a policy defect.

**Repair.** (1) Add one clause after the encoding sentence: this continuous structure is SBC B1.1's mixin without its smooth-atlas condition, for Hausdorff topological H over arbitrary bases, and B1.1's smooth principal bundles are the specialization. (2) Replace "Build the continuous principal/associated-bundle category needed here and" by "Using the category above,". (3) Add locators to a standard source for each claim, for example Husemoller, *Fibre Bundles*, 3rd ed., Chapter 4 §§9–10 (homotopy invariance of numerable principal bundles over B×[0,1] and the numerable classification setting), tom Dieck, *Algebraic Topology*, §14.3, and Kolář–Michor–Slovák §10 (cocycles, division, associated bundles), and add the chosen source to the References list.

## R04 (P3) — Padding in `Suggested.lean`

**Location and witnesses.**

- `finiteGrassmannianFrameSpan_isQuotientMap` (line 250): closes in one term from the file's own surjectivity theorem, because the topology is coinduced by definition. Probe in the scratch directory, elaborated against the built module: `⟨⟨rfl⟩, finiteGrassmannianFrameSpan_surjective 𝕜 r N⟩` type-checks (exit 0). It restates the instance at line 242.
- `finiteGrassmannian_isEmpty_of_rank_gt` (line 268): a boundary case (`N < r`); a probe closed it in four tactics from `Submodule.finrank_le` and `omega`.
- `bijective_of_surjective_trivial_identity_fiber` (line 117): a theorem about free variables only (an arbitrary monoid and group) whose conclusion is algebra on its hypotheses; the brief's headline rule excludes it. (It is true: if `f s = g ≠ 1` then surjectivity gives `t` with `f t = g⁻¹`, so `f (s t) = f (t s) = 1`, hence `s t = t s = 1`; thus every element of `S` is invertible, `S` is a group, and a group homomorphism with trivial kernel is injective.)
- `finiteGrassmannianQuotientConventionEquiv_submodule` (line 279): once the equivalence has a body (R02) this is its defining equation.
- `adamsValueOfLambdaSeries_mul` (line 133) and `adamsValueOfLambdaSeries_eq_coeff_logDeriv` (line 153): proved API lemmas about a formal power-series coefficient, not headline theorems; the README's T2.5 keeps the comparison as prose.

**Repair.** Delete these from `Suggested.lean`; the README keeps each statement (T1.5, T2.4, T2.5).

## R05 (P3) — Gate style rules: pinned-commit links and pull-request numbers

**Location.** README lines 78, 83, 87, 91 (links of the form `github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…` to ComplexKahlerGeometry, CompactGroups, NoncompactQuantumSymmetry, BanachAlgebras); line 727 (`[Mathlib PR42468](…/mathlib4/pull/42468)`); line 114 (`[HomotopySpheres §4A–4B](…/pull/1287)`).

**Witness.** Gate `blob=4`, `prnum=1`. The Mathlib pin f6090c7 has no `AdamsOperations` or `AdamsHom` (grep over `Mathlib/` finds neither), so the T2.5 citation points at an unmerged interface; the README's fallback sentence ("provide it in Tau Ceti in the same shape") is the right contract and should be the primary statement.

**Repair.** Replace the four blob links by relative links to the roadmap on main (`../ComplexKahlerGeometry/README.md`, `../RepresentationTheory/CompactGroups/README.md`, `../BanachAlgebras/README.md`) and name NoncompactQuantumSymmetry and HomotopySpheres by roadmap and section without a link to a pull request. Rewrite line 727 to state the `AdamsOperations`/`AdamsHom` interface as a Tau Ceti target in prose, without the pull-request number.

## R06 (P3) — README shape and the module docstring

**Location.** Whole README; `Suggested.lean` lines 17–23.

**Witness.** The README has none of the upstream headings (`## Scope and ownership`, `## Conventions` is present, `## Exact supplier contracts`, `## How to read the build`, `## Layer k`, `### Examples`, `### Dependencies`), no `*Needs:*` lines, and no `**Checks.**` list anywhere: every definition (the finite Grassmannian, the gap weights, the relative symbol, the Koszul class, R(G), the transfer) has zero Checks against the required three. Capitalised emphasis ("ACTUAL", "TWO", "CONSTANT") and abbreviations (TopK, CC, AT, CKG, NQS, RB, DGF) are used without expansion. The module docstring does not name the headline theorems that are not statable at the pins (complex Bott periodicity, the Thom isomorphism, equivariant Bott `R(G) ≃ K_{G,c}(V)`, real periodicity with the KO coefficient ring, numerable `BU(n)`/`BO(n)` classification) nor what each lacks (a K-group carrier on the bundle category; stable Grassmannian carriers).

**Repair.** Bring the README to the upstream shape in a dedicated revision (this is pre-existing and larger than this pull request); at minimum add three Checks per definition and `*Needs:*` lines per target, and expand the abbreviations at first use. In the docstring, list the five headlines above with the missing carrier for each.

## Verified sound

**Gate and build.** Gate at c4dda33 as in the brief (failures above). `lake env lean TauCetiRoadmap/TopologicalKTheory/Suggested.lean`: exit 0, seventeen `declaration uses sorry` warnings and nothing else. The elaborated types of all 30 declarations (worker's `signatures.md`) were compared with the README: the one flagged declaration, `RelativeSymbol`, drops `IsTopologicalAddGroup`/`ContinuousSMul` on the fibres, which its type does not need (it keeps `FiberBundle`, `VectorBundle` and both `FiniteDimensional` hypotheses as named instance binders, as T3.1 requires); no defect. `#check @finiteGrassmannianQuotientConventionEquiv` and `#check @RelativeSymbol` were re-run in the probe file with the same result.

**Dependency check.** `gate --depcheck … --movable`: `depcheck: 205 roadmaps, 1673 edges, 0 problem(s)`. No UPWARD or CYCLE line. TopologicalKTheory is on main and not in the merge order; its open-pull-request suppliers HomotopySpheres (line 65) and NoncompactQuantumSymmetry (line 141) are in the brief's allowed list.

**Cross-roadmap citations resolved (all found where cited).** AlgebraicTopology Stage 4 item 5 (`basedHomotopyInverseOfEquivalence` line 741, `cwProductKelley` line 752, both naming TopK T7.0 as consumer), Stage 8 item 1 (`homotopyGroupKelleyProduct` line 1643), Stage 8 item 5 (Whitehead, line 1700); CharacteristicClasses C1.1a (line 245), C1.1b (line 270, which consumes TopK T6.4 and T1.6a as the new text says), C1.5; SmoothBundlesConnections B1.1–B1.4 (lines 315–421), B2; GeneralizedCohomology G4.0b (line 1082), G2.8 (834), G5.0 (1575); ComplexKahlerGeometry K5 (568), K6 (1243), K7 (1405), K7.2 (1444, tautological O(−1)); CompactGroups Layer 5 (line 318, Peter–Weyl); BanachAlgebras A2 (line 161, holomorphic calculus); GeometricTopology (tubular neighbourhoods, lines 20, 50); RootSystems Layer 3 (Coxeter combinatorics, line 274) on main under `RepresentationTheory/RootSystems`; DGFloer Layer 1 item 2 (fibration homotopy sequence, line 738); SpinRepresentations (graded tensor product and the seed of periodicity, lines 236, 402); LieGroups (closed subgroups, maximal torus, lines 5, 191); GrothendieckEulerForms (presentation machinery); HomotopySpheres at the #1287 head: §4A (line 1202), §4B.1–4B.9 (lines 1343–1457); NoncompactQuantumSymmetry at the #1015 head: K-finite predicate (line 654). ClassifyingSpaces on main is discrete-group `K(G,1)` theory only and owns no principal bundles; Mathlib and Tau Ceti at the pins have no principal-bundle declaration (grep for `PrincipalBundle`/`principal bundle`: none), so T6.4's ownership of the continuous category, which CharacteristicClasses (main, line 19) and SpinGeometry (#1674/#1780) already consume, is consistent. Ownership against the open pull requests the brief lists with files was checked by `roadmaps grep 'T6\.4'`; no second owner.

**Library declarations opened at the pins (Mathlib f6090c7, Tau Ceti 358314d).** `PartitionOfUnity` (`Topology/PartitionOfUnity.lean:99`), `finsupport` (184), `exists_finset_nhds` (294), `exists_isSubordinate` (429, needs `NormalSpace` and `ParacompactSpace`, as T1.6a says); `Orientation.eq_or_eq_neg_of_isEmpty` (`LinearAlgebra/Orientation.lean:217`), `Orientation.map_of_isEmpty` (116); `IsCoveringMap.liftHomotopy` and `liftHomotopyRel` (`Topology/Homotopy/Lifting.lean:308, 341`); `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean:54`: only `toMonoidHom : G →* V →L[R] V`, no continuity in `G`, exactly the gap T6.2 names); `MvPolynomial.psum_eq_mul_esymm_sub_sum` (`NewtonIdentities.lean:245`); `Module.Grassmannian` (`RingTheory/Grassmannian.lean:67–69`: `toSubmodule`, finite and projective quotient, `rankAtStalk = k`); `Analysis/Normed/Operator/Fredholm/{Basic,Open}.lean`; `IsQuotientMap` (`Topology/Defs/Induced.lean:166`); Tau Ceti `SplitK0` (`GrothendieckGroup/Split.lean:113`), `of_biprod` (141), `liftEquiv` (256), `grothendieckAddGroupEquiv` (457), `repRing` (`RepresentationRing/Basic.lean:106`), `PowerSeries.logDeriv` and `logDeriv_mul` (`RingTheory/PowerSeries/Log.lean:48, 64`), `IsCoveringMap.existsUnique_continuousMap_lifts_of_subsingleton_fundamentalGroup` (`Topology/Homotopy/Covering.lean:133`), `Analysis/Fredholm/{SmallPerturbation,CompactPerturbation,ContinuousFamily}.lean`, `RepresentationTheory/Spin/{Structure,OddStructure}.lean` and `Spin/Polarization/CliffordAction.lean`. Not at the pin: Mathlib `AdamsOperations`/`AdamsHom` (R05).

**Seeded sample.** *T2.0* against hatcher-vbkt: Prop. 1.4 (line 517, finite trivial complement, compact Hausdorff only, with the `RP^∞` counterexample at line 519, matching T1.3's hypothesis), Thm 1.6 and Prop. 1.7 (lines 788–795, homotopy invariance over paracompact bases, the input of T2.0's homotopy law), Prop. 2.1 (line 1522, the group completion over compact Hausdorff X, which T2.0 extends to paracompact bases by its own construction, consistent with Hatcher's remark), Thm 1.16 (line 1161, paracompact classification). The relations `r c = 2`, `c r = 1 + conjugation` have no locator in Hatcher's text (standard; see the table). *T7.0*: it cites no external source; its three AlgebraicTopology inputs resolve as above and each names T7.0 as its consumer; the shear and inverse computations are in the table.

**Adversarial table** (statement; instances; values on each side; result).

| # | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| 1 | T2.0 `K⁰(ℝ)=ℤ`, `K_c⁰(ℝ)=K̃⁰(S¹)=0` | ℝ ≃ pt; S¹ | K⁰(pt)=ℤ; K̃⁰(S¹)=K^{−1}(pt)=0 | sound |
| 2 | T2.0 `r c = 2`, `c r = 1+conj` | ℝ over pt; H over S² | r(c(ℝ))=r(ℂ)=ℝ²: 2; c(r(H))=H⊕H̄: 1+conj | sound (no Hatcher locator) |
| 3 | T2.0 `K⁰(∐X_i)≃∏K⁰(X_i)` | X_i=pt, i∈ℕ, rank i on X_i | class lies in ∏ℤ, not ⊕ℤ | sound, product is needed |
| 4 | T7.0 shear `sh_*(a,b)=(a,a+b)` | inverse (a,b)↦(a,b−a) | (a,(a+b)−a)=(a,b); (a,(b−a)+a)=(a,b) | sound |
| 5 | T7.0 complement inverse | Gr(k,ℝ^N), γ⊕γ^⊥≅1^N | −([γ]−k)=[γ^⊥]−(N−k); −[γ]=[γ^⊥]−N=([γ^⊥]−(N−k))+(−k) | matches (νx,−n) |
| 6 | T7.0 basepoint track | i=0..N−k−1 | e_{k+i}→e_{N+i}→e_i; endpoint (e₀,…,e_{N−k−1}); N+i≤2N−k−1<2N; k=0: e_i→e_{N+i}→e_i backtracks; k=N: empty | sound |
| 7 | T1.6c `ε_k=(−1)^{k(k−1)/2}` | interleaving (0,2,…,2k−2,1,…,2k−1) | inversions Σ_j(k−1−j)=k(k−1)/2; ε_k=−1 iff k≡2,3 mod 4; ε_kε_{k+1}(−1)^k=(−1)^{k²+k}=1 | sound |
| 8 | T1.5 disc block | R(r,θ)·s, s=[[0,−1],[1,0]] | [[−e^{−iθ}sin r,−cos r],[cos r,−e^{iθ}sin r]]=[[d,−cos r],[cos r,d̄]], z=d/cos r=−tan r e^{−iθ} | sound |
| 9 | T1.5a Stiefel groups | V_r(ℝ^n), m=n−r | r=1: S^m, π_m=ℤ; r=2 boundary degree 1−(−1)^m=χ(S^{m+1}): m=1→2 (ℤ/2), m=2→0 (ℤ); π₁SO(2)=ℤ, π₁SO(3)=ℤ/2 | sound |
| 10 | T1.6a gap weights | sorted a₁≥…≥a_m>0; ties; one chart | q_E=a_n−a_{n+1} on strict top-n segments; Σ_n n(a_n−a_{n+1})=Σa_n=1; tie a_n=a_{n+1}: every |E|=n has gap ≤0; one chart: q_{{j}}=1; Lean weight index n ↔ size n+1 | sound, matches `prescribedPartitionColourWeight` |
| 11 | T3.5 block matrix | M=[[σ⊗1,−1⊗τ*],[1⊗τ,σ*⊗1]] | M*M: (σ*σ⊗1+1⊗τ*τ, σσ*⊗1+1⊗ττ*), cross −σ*⊗τ*+σ*⊗τ*=0; MM*: (σσ*⊗1+1⊗τ*τ, σ*σ⊗1+1⊗ττ*) | sound |
| 12 | `exists_continuous_inside_projection` | B=diag(λ₁,λ₂), |λ₁|<1<|λ₂|; |z|=1; k=0; n=0 | P=diag(1,0); (B−z)^k v=0 ⇒ v=0 ⇒ Pv=0=else-branch; k=0 forces v=0; n=0 vacuous | sound |
| 13 | T4.5 Möbius pencil | t<1, |z|=1 | (A+tB)z+(tA+B)=(1+tz)(Aw+B), w=(z+t)/(1+tz), |w|=1; t=1 degenerates at z=−1 | sound with t<1 |
| 14 | `isUnit_segment_of_uniform_inverse_bound` | t=0; t=1; n=0 | (1−t)u+tB=u(1+t·u⁻¹(B−u)), ‖t·u⁻¹(B−u)‖≤t·c<1 ⇒ unit; t=0 gives u; n=0 trivial | sound |
| 15 | `finiteGrassmannian 𝕜 r N` | r>N; r=0; r=N | r>N: no independent r-tuple, empty, both quotient maps vacuous; r=0: {0} with one empty frame; r=N: one point | sound |
| 16 | convention equivalence | r≤N, field | quotient of dim N−r, finite and projective, rankAtStalk N−r at every prime; N−r is not junk under hr | sound once given a body (R02) |
| 17 | T7.1 coefficients | degrees 0..−7; c, r | ℤ,ℤ/2,ℤ/2,0,ℤ,0,0,0; rc(a)=r(2u²)=2a; cr(u)=c(η²)=0=(1+conj)u since conj u=−u | consistent |
| 18 | T7.3 failures | (D²,S¹), (D³,S²) | K(D²,S¹)=K̃(S²)=ℤ→K(D²)=ℤ is 0; K(D³)=ℤ→K(S²)=ℤ⊕ℤβ misses β | sound |
| 19 | T6.2 `ContRepresentation` | pin | structure has only `toMonoidHom`, no continuity in G | README's extra continuity is needed, sound |
| 20 | T6.4 (new) homotopy invariance | H trivial; H=ℤ/2 cover over X×I; X=∅ | trivial bundle; covering homotopy; vacuous | sound |
| 21 | T6.4 descent `K_{G×H}(Y)≃K_G(Y/H)` | H=1; G=1, Y=H | identity; K_H(H)=K(pt)=ℤ | sound, Segal Prop. 2.1 (segal-1968 line 179) |
| 22 | monoid exercise | S=(ℕ,+)→1 | hone fails (f 1=0, 1≠0), so no counterexample; proof: nontrivial fibre elements get two-sided inverses, S is a group | true, but padding (R04) |
| 23 | T2.5 Bott compatibility | β on S², β_n, n=0 | ψ^kβ=kβ; ψ^kβ_n=k^nβ_n; n=0: ψ^k1=1 | sound |
| 24 | T5.2 projective bundle r=0 | E=0 | P(E)=∅, K(∅)=0, relation 1=0 in the zero ring | sound |
| 25 | T1.5 connectivity | k=1 | real: S^{n−1} is (n−2)-connected = n−k−1; complex: S^{2n−1} is (2n−2)-connected = 2(n−k) | sound |

Counts: 25 rows computed; 6 findings (1 P1, 1 P2, 4 P3); 2 blocking; 30 Lean declarations checked against the README; 27 library declarations opened at the pins; 22 cross-roadmap citations resolved.

## Not verifiable

- atiyah-1968-bott (Atiyah, *Bott periodicity and the index of elliptic operators*, Quart. J. Math. 19 (1968), cited for T6.5 §§2, 4, Prop. 4.9): the DOI landing page at academic.oup.com answers HTTP 403 and no open repository copy was found; listed in the job's `needs-references.toml`.
- atiyah-bott-1964 (Atiyah–Bott, Acta Math. 112, cited for T4 and T5.2): Springer is paywalled; the Project Euclid `.full` and `.pdf` URLs returned only an HTML landing page (five lines of text). Listed in `needs-references.toml`; the T4 statements were checked instead against hatcher-vbkt Thm 2.2, Prop. 2.4, Prop. 2.7 and Lemma 2.8 (lines 1613, 1688, 1873, 1903) and debray-freed-ktheory Lecture 5 (line 803 onward: approximate by Laurent, polynomial, linear clutching).
- abs-1964 (Atiyah–Bott–Shapiro, Topology 3, cited for T7.1): Elsevier paywalled, recorded as uncertified by the service; the KO coefficient and c/r values were checked by the table instead.
- Freed's lectures as transcribed by Debray (debray-freed-ktheory, author's page): read; the README cites "§§5–6", which are Lectures 5 and 6 ("The K-theory of X×S²", "The K-theory of the Spheres", lines 771, 969). The numbering matches.
- Kriz–May (kriz-may, author's page, §9 "The linear isometries operad; change of operads", line 4882) and Segal (segal-1968, Numdam, §2 line 138, Prop. 2.1 line 179, Prop. 2.4 line 231, Prop. 3.2–3.3 lines 462–468, Prop. 3.8 line 535) were read and support the T1.6b, T6.1, T6.4 and T6.3 citations.

## Source issues

- **Error** in debray-freed-ktheory at Lecture 5, printed page 15 (line 783): the source says the remaining clutching datum of a bundle over S² is a group homomorphism from the circle group to GL_r(ℂ); it should be a continuous map from the circle to GL_r(ℂ), since a homomorphism would only produce bundles classified by characters; affects nothing here (T4.1 already states the correction).
