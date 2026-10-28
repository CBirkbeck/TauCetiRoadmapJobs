# GATE-ComplexKahlerGeometry~1: answers to human review

The review covers commit `882e12b`. The branch head `1c03b0e` already contains a K4.P rewrite that responds to both points. This round checked that rewrite against the suppliers and made small consistency repairs in commit `f7282383`.

## H01 (roed-math) — applied

The concrete repair the reviewer proposed is in K4.P (`TauCetiRoadmap/ComplexKahlerGeometry/README.md`, K4.P, the paragraph after "Prove that H¹(M,𝒪)=H²(M,𝒪)=0 …"). The old wording "SBC B2/B6's smooth complex-line classification … each topological line-bundle isomorphism class" now consumes TopologicalKTheory T1.6d's smoothing in unstabilized rank one. It defines Pic_sm(M) and Pic_cont(M) and builds the forgetful group isomorphism F_M:Pic_sm(M)≃Pic_cont(M) from both of the reviewer's statements: a smooth representative of every continuous line, and smooth isomorphisms between continuously isomorphic smooth lines. It also proves c₁ compatibility and the tensor, dual and pullback laws. The conclusion now reads "each **continuous** complex-line isomorphism class". T1.6d on main supplies exactly these statements, on smooth finite-dimensional manifolds: smooth representatives of continuous bundles and of continuous isomorphisms, in the closing sentence of TopologicalKTheory T1.6d. Its stable-class clause is not used.

This round also:
- added TopologicalKTheory T1.6d to the "Conventions and suppliers" paragraph;
- replaced the commit-pinned blob link with `../TopologicalKTheory/README.md`;
- added a K4.P entry to "Order and references".

That entry records that K4.P uses only T1.6d's smoothing clause, which runs on partitions of unity and T1.5–T1.6's matrix models. T1.6d's rank-one CP∞ comparison is the part that consumes CKG K7.2, and no K7 item consumes K4.P. So the two roadmaps cite each other only on disjoint items.

## H02 (roed-math) — applied

The head's K4.P "lower inputs" paragraph replaces "AlgebraicTopology's sheaf/singular comparison" with this wording: SBC B6.1 owns the manifold good-cover/sheaf/singular comparison, and K2 supplies the Čech/derived comparison. AlgebraicTopology supplies only singular cochains and their coefficient sequences. Checked against SmoothBundlesConnections B6.1, which builds the integer/exponential sheaves and the native Čech complex, and B6.2, which gives the exponential c₁ and the circle-bundle classification by `H²(M;ℤ)`. The supplier paragraph now names B6.1 and B6.2 the same way. It also says B2's associated-bundle comparison turns B6.2 into the complex-line classification, so the attribution is consistent across the README.

## H03 (roed-math) — answered

The "Mathematical checks of the additions" section confirms these parts and asks for no change:
- the Picard torsor route against Stacks 040E;
- the exponential segment;
- the frame convention `A_j=A_i+g_ij⁻¹dg_ij`;
- the rational-quartic charts, sumset and surjectivity for n≥2;
- the analytic-before-Chow route (Serre, Cartan seminar 19 §3).

The README already carries each of these in K4.P and K7.2.RationalQuartic, so there is nothing to edit. The native `Sheaf.H.δ` and `δ_naturality` that K4.P names exist at the pinned Mathlib, in `Mathlib/CategoryTheory/Sites/SheafCohomology/ExactSequences.lean` at lines 60 and 66.

## H04 (roed-math) — applied differently

The reviewer listed supplier pull requests (#848, #279, #887, #894) as future inputs. House style cites a roadmap by name and section, never by pull-request number. So the K7.2 citation link that this PR adds, "ComplexComparisonPartII C0 and C1.7–C1.8" (it pointed at `…/pull/848`), now points at `../ComplexComparisonPartII/README.md`. ComplexComparisonPartII comes before this roadmap in the merge order. The `#279` and `#280` references in "Conventions and suppliers" and K3 are already on main and this PR does not touch them, so they were left alone to keep the scope narrow.

## Adversarial pass (statements changed or added this round)

| statement | instances tried | values | result | change |
|---|---|---|---|---|
| F_M: Pic_sm(M)≃Pic_cont(M) | M=∅; M=pt; M=S² ; M=ℂP¹ ⊔ ℂP¹ | ∅: both are 1-element sets; pt: both trivial; S²: both ≅H²(S²;ℤ)=ℤ via c₁ (O(1)↦1 on both sides); disjoint union: ℤ² on both, componentwise | holds | none |
| injectivity of F_M needs isomorphism smoothing, not only bundle smoothing | two smooth lines that are continuously isomorphic | without T1.6d's isomorphism clause, the map from classes could fail to be injective. T1.6d supplies the clause | holds | none |
| exp-sequence corollary under H¹(𝒪)=H²(𝒪)=0 | ℂP¹; elliptic curve E | ℂP¹: H¹(𝒪)=0, H²(𝒪)=0, Pic≅ℤ, matching continuous lines ℤ. E: H¹(𝒪)=ℂ≠0, hypothesis fails, and Pic⁰(E)=E shows the isomorphism really fails | holds, and the hypothesis is needed | none |
| T1.6d supply is rank-preserving | rank 1, comparing stable and unstable classes | T1.6d's first two clauses are unstable (bundles, isomorphisms); only the homotopy clause is stable, and K4.P does not use it | holds | supplier sentence says "rank one only" |
| SBC B6.2 attribution | the text of SBC B6.2 | B6.2 classifies circle bundles by H²(M;ℤ); the complex-line form needs B2's comparison | wording corrected | "B6.2 the circle-bundle classification …, which B2's … comparison turns into …" |

## Ownership and citations

TopologicalKTheory is on main, and its T1.6d text matches the citation. SmoothBundlesConnections B6.1 and B6.2 were checked at the head given for it. The roadmap-level mutual citation between TopologicalKTheory and this roadmap is item-disjoint, as recorded in H01. Ownership against the open pull requests was checked only for these two suppliers. This round added no new constructions.

## Gate repairs (commit `f59e68cb`)

The worker's gate checks flagged defects that predate this PR and come from main's copy of the roadmap. They are repaired in place, and nothing else changed:

- **blob=29 → 0.** Every commit-pinned `…/blob/<sha>/TauCetiRoadmap/<X>/README.md#Lnn-Lmm` link in `TauCetiRoadmap/ComplexKahlerGeometry/README.md` now points to `../<X>/README.md`. That is 37 links, counted including inline duplicates. Line anchors such as `#L1065-L1078` were dropped because they are valid only at the old commit, and the link text keeps the section (GH5.1, V5.1, UO-D06, G1.3, …). Section anchors are kept (`#p10-differential-operator-core`, `#gh0-runge`). The one link text that carried a PR number, "ComplexManifolds #279 Milestone 4", now reads "ComplexManifolds Milestone 4".
- **imports.** The header is now `import Mathlib`, `import TauCeti.Geometry.Symplectic.Manifold.AlmostComplex`, `import TauCeti.Geometry.Symplectic.Manifold.TwoForm`. Removed: four `Mathlib.*` sub-imports, the unused `TauCeti.Analysis.Complex.CauchyIntegralPolydisc`, and the roadmap import `TauCetiRoadmap.DifferentialGeometry.Suggested`. Because that roadmap import is gone, `DensityFiber` (an abbrev on DG's `Density`) was removed. The README never named `DensityFiber`.
- **sorry-data=20 → 0.** The following sorry-bodied declarations were removed, together with every declaration that mentions them:
  - `nijenhuisTensor`;
  - the K5a LF test-section block: `realBundleTestSubmodule`, its four topology instances, `realBundleTestOfChart`, `bundleTestSubmodule`, `bundleTestSmul`, its four topology instances, `bundleTestOfChart`, `bundleTestRestrictScalars`, `bundleSobolevSubmodule`, `bundleSobolevToDistribution`;
  - `realDistributionComplexify` and `bundleDistributionConjugation`;
  - `complexBesselToL2`.

  The module docstring now names these items as not statable at the pins and gives the reason: there is no LF topology on smooth sections, no density carrier, and the unitary comparison is itself a construction. The README keeps them as targets in K5a, and their mentions there are formula-level code spans (`BundleTest(E*⊗DensityBundle M)` etc.).
- **Restated without the removed `nijenhuisTensor`:**
  - `nijenhuisTensor_onFields` became `nijenhuisOnFields_eq_of_eq`. It states K1's tensoriality directly: on smooth fields, the value at `x` depends only on `X x` and `Y x`.
  - `IsKahler`'s integrability clause is now "`nijenhuisOnFields J X Y x = 0` for all smooth fields X, Y". This matches the README's K6.0 wording "real-carrier `IsKahler` prototype (Compatible, closed and N=0)".
  - `nijenhuisTensor_skew` was removed. At field level it follows in one step from Mathlib's `VectorField.mlieBracket_swap`, so it would be padding.
  - `[I.Boundaryless]` was added to the local-geometry section variables. This matches the README Conventions ("without boundary") and makes the bump-function argument behind tensoriality available.

### Adversarial pass on the changed statements

| statement | instances tried | values | result | change |
|---|---|---|---|---|
| `nijenhuisOnFields_eq_of_eq` (via C^∞-linearity) | N(fX,Y) expanded with Leibniz `[fX,Y]=f[X,Y]−(Yf)X` | `[JfX,JY]=f[JX,JY]−(JYf)JX`; `−[fX,Y]=−f[X,Y]+(Yf)X`; `−J[JfX,Y]=−fJ[JX,Y]−(Yf)X`; `−J[fX,JY]=−fJ[X,JY]+(JYf)JX`; the extra terms cancel, giving `N(fX,Y)=f·N(X,Y)` | holds; pointwise dependence then follows by bump functions (finite-dimensional, T2, boundaryless, all in scope per `#check`) | new statement |
| same, flat case | M=ℝ²=ℂ, constant J, X=∂ₓ, X'=(1+x)∂ₓ, Y=∂_y at 0 | X(0)=X'(0)=∂ₓ; constant J is integrable, so N≡0 and both sides are 0 | holds | none |
| same, degenerate | M=∅; E=0 (points) | vacuous; all tangent spaces are 0, so both sides are 0 | holds | none |
| `IsKahler` | ℂ, ω=dx∧dy, standard J; ω=0 | first: closed, compatible (g(u,v)=ω(u,Jv) is the Euclidean product), N=0, so Kähler. Second: compatibility fails because ω(v,Jv)=0 is not >0 | separates | none |
| `IsKahler` wrong model: N=0 only on constant fields | integrability tested only on coordinate fields | the clause quantifies over all smooth X, Y, so this weaker reading is excluded | holds | none |

**Signature check.** `#check @name` was elaborated for all 13 declarations, by appending the lines temporarily and building, then removing them. The theorems `dbarFunction_apply_J`, `dbarFunction_eq_zero_iff` and `nijenhuisOnFields_eq_of_eq` carry `CompleteSpace E`, `FiniteDimensional ℝ E`, `T2Space M`, `IsManifold I ∞ M` and `I.Boundaryless`. The definitions `dbarFunction`, `nijenhuisOnFields` and `IsKahler` keep only `IsManifold I ∞ M`. That is correct, because their bodies need nothing more. No binder was lost from a statement.

## Build and gate

- `lake build TauCetiRoadmap.ComplexKahlerGeometry.Suggested`: `Build completed successfully (8986 jobs)`. The only warnings are `declaration uses sorry` on the six admitted theorems.
- Gate summary line: `gate ComplexKahlerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`
- The gate's only remaining item is `depcheck: NOT IN ORDER: ComplexKahlerGeometry (insert it after its last supplier)`. By the brief this is not a defect: the roadmap is placed when it is accepted.
- Depcheck (`--movable`): `depcheck: 148 roadmaps, 999 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines.
- Commits `f7282383` (review answers) and `f59e68cb` (gate repairs). Neither is pushed.
