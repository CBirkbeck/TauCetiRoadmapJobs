## H01 (CBirkbeck) — answered

SchemeKTheoryOperations §§6.2.1–6.2.2 and PrismaticCohomologyPartII §§3.16, 5.0, 5.13, 5.18–5.20 are direct suppliers, as `TauCetiRoadmap/QWittVectors/README.md:62`, line 94, §2.1a and §§8–9 already specify; the live description at head c3c3d76 omits both and incorrectly classifies the remaining named roadmaps as consumers. The worker must add #1229 after its predecessors, including #853, and #1065 after #1057, both before #1351, in the dependency declaration and merge plan; this job expressly excludes PR-text edits, so this finding remains unresolved in the live description.

## H02 (CBirkbeck) — answered

The elementary λ-ring import in `TauCetiRoadmap/QWittVectors/README.md:62` requires no K₀, but SchemeKTheoryOperations at 88dbd5a consumes AlgebraicKTheory A2/A4 in its larger development and its live merge declaration requires #1142, which is open, authored by kim-em, and adds a roadmap absent from main a07e202. The worker must acknowledge that inherited prerequisite and replace the assertion that no other author's open PR is required; retaining the narrow mathematical import is correct, and moving or splitting its supplier's foundations would require changes outside this job.

## H03 (CBirkbeck) — answered

PrismaticCohomologyPartII at 2a6d228 includes the still-open ColemanPowerSeries #1309 at 37908a0 in its declared predecessor chain, while #1351 omits it; PhiGammaModulesAndIwasawaCohomology's supplier contract independently imports ColemanPowerSeries §§1.45–1.49 for §2.5. The worker must include #1309 after #1306 and before #1310, preserve #1065 after #1057 and before #1351, and reconcile the inherited declarations rather than presenting the two direct additions as the complete repair; no Coleman theory is added to this roadmap's proof inputs.

## Validation

The unchanged acceptance signatures elaborate with only the two intended admissions.

`lake build TauCetiRoadmap.QWittVectors.Suggested` exited 0:

```text
⚠ [8976/8976] Built TauCetiRoadmap.QWittVectors.Suggested (7.0s)
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:80:8: declaration uses `sorry`
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:100:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

The content gate against origin/main exited 0:

```text
gate QWittVectors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required dependency-direction check with `--movable` exited 0:

```text
depcheck: 26 roadmaps, 231 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or moved line. These results validate the README graph and unchanged acceptance signatures; they do not validate the PR description or the complete inherited PR merge plan.

No roadmap file changed. HEAD remains c3c3d76df6399f3faa41a1cda67af3c545ff5a8f, the worktree is clean, and there is no repair commit or push. All three numbered points concern metadata that the worker must change, and none is reported as applied.

## Supplier and merge-plan evidence

The review has three actionable points: omitted direct suppliers, the inherited AlgebraicKTheory requirement, and the inherited ColemanPowerSeries requirement. Its affirmative mathematical checks introduce no additional request or question.

| Evidence inspected | Checkable consequence |
| --- | --- |
| Live #1351, head c3c3d76, Dependencies and Merge order | #1229, #1065, #1142 and #1309 are absent; the consumer-only and no-other-author assertions remain present. |
| `TauCetiRoadmap/SchemeKTheoryOperations/README.md`, head 88dbd5a, §§6.2.1–6.2.2, lines 1697, 1709 and 1711 | The imported objects are pre-λ operations and morphisms, integral special identities and Newton Adams operations. Projective K₀ operations start separately at §6.2.3. |
| The same supplier, scope and §3.6; live #1229 Merge order | A2 supplies determinant, scalar section and SK₁; A4 supplies semilocal shortening; #1142 is an explicit prerequisite of the packaged supplier. |
| `TauCetiRoadmap/AlgebraicKTheory/README.md`, head e5df75ba, A2 and A4; main a07e202 tree and open-roadmap index | Those sections exist at the cited open head; the folder is absent from main, and the index classifies #1142 as a new roadmap, so the rule excluding revision PRs does not exclude this prerequisite. |
| `TauCetiRoadmap/PrismaticCohomologyPartII/README.md`, head 2a6d228, §§3.16, 5.0, 5.13, 5.18–5.20 | Complete framing, divided differences, the skew DGA, Frobenius-twisted comparisons and framing coherence have the owners named in QWittVectors. The power-series realization and scaled model remain QWittVectors targets. |
| Live #1065 Merge order; live #1309, head 37908a0 | #1309 precedes #1310 in the inherited chain; #1309 is open and declares #1306 as a predecessor. |
| `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md`, analytic supplier contract and §2.5 | ColemanPowerSeries §§1.45–1.49 supply the integral zeroth Frobenius coordinate and trace identity. This is an actual inherited mathematical interface, not merely a PR-body coincidence. |

The direct dependency wording the worker needs is: “SchemeKTheoryOperations §§6.2.1–6.2.2 supplies the special λ-ring foundations; PrismaticCohomologyPartII §§3.16, 5.0, 5.13, 5.18–5.20 supplies complete framing and prismatic comparisons. Their packaged merge prerequisites must also precede this PR, including AlgebraicKTheory and ColemanPowerSeries.” This replaces the inaccurate consumer-only classification without adding K-theory hypotheses to §2.1a.

Checking the existing predecessor PRs' live merge declarations also found the following inherited requirements absent from #1351. This is a concrete list of verified omissions, not a certification of the recursive closure of every external PR; the worker must not publish a claim that four insertions exhaust the graph.

| Existing predecessor and inspected head | Additional prerequisite named by its merge declaration |
| --- | --- |
| StableHomotopyKTheory #1227, 00bfbf79 | TangentialBordism #942; AlgebraicKTheory #1142 |
| GeneralAlgebraicKTheory #1212, e0552fe4 | AlgebraicKTheory #1142 |
| ResolutionOfSingularitiesCharacteristicZero #1199, bf45c86f | GroebnerGeometry #899 |
| CrystallineCohomology #857, 013a9213 | PurityOfBranchLocus #1103; AbhyankarLemma #1104 |
| ReductiveGroupsPartII #785, 1383569e | CFSGBasicProperties #446; ChevalleyGroups #447 |
| IntegralIwasawaTheory #1306, 5d2ed25e | LFunctions #248; LinearFormsInLogarithms #451 |
| AdelicAlgebraicGroups #792, 70c43249 | LFunctions #248; QuaternionicModularForms #934 |
| AlgebraicModuliForArithmeticGeometry #853, 0b849541 | GroebnerGeometry #899 |
| ComplexComparisonPartII #848, 2d50a887 | SmoothBundlesConnections #887; CharacteristicClasses #896; TopologicalSheafCohomology #973; GlobalHolomorphicFunctions #992; FormalConnectionsOpers #1056 |

The index classifies each listed external prerequisite as a new roadmap. These are packaging requirements reported by suppliers, not additional direct imports proposed for QWittVectors; no supplier ownership, merge-order file or external roadmap was changed. A complete whole-PR topological order is not certified here: in particular, AlgebraicKTheory A3 imports GeneralAlgebraicKTheory §4.15 while the latter's PR body also requires #1142, so mechanically concatenating whole-PR prerequisites would need reconciliation of that upstream packaging as well.

## Signatures, sources and ownership

I compared all four mechanically elaborated `#check @name` types supplied with the job against the unchanged declarations and their README statements. No binder, signature or README generality changed; since the Lean file was not edited, no second scratch elaboration was needed.

| Declaration | Elaborated context compared with the README |
| --- | --- |
| BigWitt.TruncationSet, line 68 | A positive, positive-divisor-closed subset of ℕ; the empty set is admitted. |
| BigWitt.ghostPolynomial, line 75 | Arbitrary-universe CommRing R, n : ℕ and x : ℕ→R; §1.1 explicitly distinguishes this unital signature from the planned nonunital polynomial extension. |
| BigWitt.ghost_image, line 80 | CommRing R, S, independently specified ring endomorphisms φ, their prime-lift congruences and b; §1.2 requires neither commuting lifts nor torsion-freeness for existence. |
| QWitt.framedGamma_existsUnique, line 100 | Explicit commutative rings A and R, both algebra structures, the scalar tower, étaleness over the finite polynomial algebra and i : Fin r; the result is an equivalence over PowerSeries A preserving constant coefficients, exactly as §8.1 states. |

The library copies were verified at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Mathlib's `WittVector` in `Mathlib/RingTheory/WittVector/Defs.lean:52` has ℕ-indexed coefficients with a fixed p; it does not provide the arbitrary-truncation big Witt carrier. `Algebra.FormallyEtale` in `Mathlib/RingTheory/Etale/Basic.lean:46` records vanishing of Kähler differentials and H1Cotangent; `Algebra.Etale` at line 205 adds finite presentation, not module-finiteness. `PowerSeries.algebraPowerSeries` in `Mathlib/RingTheory/PowerSeries/Basic.lean:942` uses coefficientwise scalar extension, and `TauCeti.kaehlerBasisOfFormallyEtale` in `TauCeti/RingTheory/Kaehler/FormallyEtale.lean:67` retains the scalar tower and formal étaleness.

Cross-roadmap resolution against main a07e202 and the indexed open heads found no unresolved cross-roadmap citation or roadmap declaration. Its library lookup was unavailable; the relevant native carrier and hypothesis claims above were checked directly at the pins, and the supplier names in the initial citation leads were confirmed in their own roadmap sections rather than mistaken for implemented declarations. Object searches covered main/open roadmap text, the board packages and the supplied sibling checkouts; the λ-ring and complete-framing owners agree with the contracts, and the Habiro roadmaps consume QWittVectors rather than supply these objects. No new construction, fully qualified declaration or ownership move is proposed.

The source passages used to verify the retained interfaces were available legally in the existing cache: hesselholt line 205 and line 223 for truncations and Dwork's criterion; borger line 615 for the coalgebra/special-λ equivalence; hesselholt line 711 for the comonad; wagner line 2830 and line 2858 for framed scaling and its skew multiplication; bhatt-scholze line 4289 and line 4378 for the twisted prismatic and framed comparisons. No new source work, manifest key or missing-text request was needed. This metadata-focused response does not claim a fresh proof or complete source recertification of every unchanged auxiliary target.

## Adversarial mathematics record

No mathematical statement was added or changed. The following concrete checks cover the four acceptance declarations and the retained mathematical interfaces implicated by the dependency comments; they do not turn the successful admitted build into a proof.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 TruncationSet | ∅, Div(6), {2} | Div(6)={1,2,3,6}; every positive divisor stays in that set; {2} contains 2 but omits its divisor 1; ∅ has no membership obligations | Correct positive-divisor convention and negative control | None |
| §1.1 ghostPolynomial | x₁=1, x₂=2, x₃=3, x₆=4 over ℤ; n=0,1,2,3,6 | w₀=0 from the empty divisor finset; w₁=1; w₂=1+4=5; w₃=1+9=10; w₆=1+16+27+24=68 | n=0 is a total-function value excluded from headline indices; all positive formulas agree | None |
| §1.2 ghost_image, forward and reverse at 2 | ℤ, φ₂=id, S={1,2}; b=(1,3) and (1,0) | x=(1,1) gives ghosts (1,3), and 3−1=2∈(2); for (1,0), 0−1=−1∉(2), and x₂=−1/2 is not integral | Positive and negative directions agree | None |
| §1.2 ghost_image at 3 | ℤ, φ₃=id, S={1,3}; b=(2,5) and (2,0) | x=(2,−1) gives w₃=8−3=5 and 5−2=3∈(3); 0−2=−2∉(3), matching the impossible equation 3x₃=−8 | Prime 3 normalization agrees | None |
| §1.2 torsion and empty inputs | 𝔽₂ with S={1,2}; ∅ and zero ring | (0,0) and (0,1) both have ghosts (0,0); b=(0,1) instead has congruence 1−0=1∉(0); for ∅ both sides are true with no equations; over the zero ring every value is 0 | No injectivity is incorrectly inferred; existence criterion handles degenerate rings | None |
| §2.1a series convention | A toric line l; canonical ℤ at 2 and −1 | σ(l)=(1−lt)⁻¹ gives σ(−t)⁻¹=1+lt; λ²(2)=1 and ψ₂(2)=4−2=2; λ²(−1)=1 and ψ₂(−1)=1−2=−1 | Inversion and sign match the imported λ normalization; Adams is not the power map on ℤ | None |
| §2.1a generality at characteristic 2 | A hypothetical special structure on nonzero 𝔽₂ | λ²(0)=0 but the sum law on 1+1 gives 0+1+0=1; the zero ring instead has 0=1 and one structure | The equivalence does not assert existence of a special structure on every ring | None |
| §8.1 framedGamma_existsUnique | Rank-one polynomial and Laurent frames over ℤ; reduction modulo h³ | γ(T²)=(1+2h+h²)T², with constant term T² on both sides; γ⁻¹(T)=(1−h+h²)T mod h³ and (1+h)(1−h+h²)=1 mod h³ | Actual equivalence and constant-coefficient law agree; identity fails the required image of T | None |
| §8.1 étaleness and small ranks | 𝔽₂[T]→𝔽₂[Z], T↦Z²; r=0; zero ring | Any square γ(Z)² has h coefficient 0, whereas (1+h)Z² has h coefficient Z²; Fin 0 has no chosen i; the zero ring has one automorphism | Étaleness is necessary; no direction is invented at rank zero | None |
| §8.2 divided difference | T², T³, T⁻¹; q=1 in characteristics 0 and 2 | D(T²)=(1+q)T, D(T³)=(1+q+q²)T², D(T⁻¹)=−q⁻¹T⁻²; at q=1 these are 2T,3T²,−T⁻², with 2T=0 in characteristic 2 | Division before specialization and the Laurent sign match the supplier | None |
| §8.3 product and two-direction sign | Polynomial rank one and two over ℤ | dT·T=qT dT, so d(T²)=(1+q)T dT; d⁰(XY)=(Y,X), d¹(Y,X)=1−1=0; a plus sign gives 2 | Skew multiplication and ordered Koszul convention agree in supplier and realization | None |
| §8.4 scaled Frobenius | p=2, T and h | φ(h)=2h+h²; φ(d_H T)=(2h+h²)T dT=d_H(T²); on C the factor is (1+q)T dT, while on H it is T dT | The supplied C map and owned scaled map have the required distinct factors | None |

The unresolved work is the live dependency/merge declaration and its inherited packaging, not a mathematical repair to either permitted roadmap file.
