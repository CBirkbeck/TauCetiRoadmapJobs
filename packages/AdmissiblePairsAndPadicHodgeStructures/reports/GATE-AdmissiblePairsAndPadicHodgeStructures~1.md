# GATE-AdmissiblePairsAndPadicHodgeStructures~1 — answers to human review

Review answered: one comment by CBirkbeck (2026-10-25T18:15:49Z) on head `dc906d7`. It makes three numbered findings and one remark on the scope of `Suggested.lean`. Repairs are committed as `23c4c57b` (not pushed). All edits are in `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md`; `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — applied

The finding is correct. HKI requires a G-structure to have ω∘G ≅ ω_std (HKI line 512 for §2.1.1, line 1673 for G−HS(C), line 1965 for G−AdmPair(C)). The PGL₂ counterexample also computes out: b=[[0,p],[1,0]] has b²=p·1, so its projective Newton point is 0, and v_p(det b)=1, so κ=1 in π₁(PGL₂)=ℤ/2. Since B(PGL₂,[0])={[1]}, §2.6 fails for that functor.

Changes:
- **Conventions, README line 23.** Old: "A G-object is an exact tensor functor …". New: the same definition, plus the requirement that a G-Hodge structure or G-admissible pair over C has its rational fibre functor (V, resp. V_et) isomorphic over ℚ_p to the standard one, with HKI locators. The isomorphism must exist; a chosen one is framing data.
  - The condition is not imposed on G-isocrystals or on bilatticed G-torsors over a DVR with algebraically closed residue field, whose torsors are trivial. So it is not applied indiscriminately.
- **§2.5, line 640.** "choose its indicated fibre trivialization" now cites the convention. A trivialization change by g∈G(ℚ_p) conjugates MT/MG by g.
- **§2.6, lines 667–679.**
  - The statement now names the standard-fibre condition.
  - The proof sketch says it is what fixes the Kottwitz invariant.
  - A new **Checks** list has: G_m with ℚ_p(1) (μ=1, b=p⁻¹, κ=−1=μ⁻¹, weight −2 = 2·slope), the unit object, and the PGL₂ negative control.
- **Same defect, repaired in §4.2, lines 850 and 871.** "a G-local system is an exact tensor functor …, equivalently its v-local tensor-frame torsor" is false for Λ=ℚ_p. For the P-twisted constant functor, the frame sheaf has sections only as continuous maps |T|→P(ℚ_p)=∅. The definition now requires v-local isomorphism with ω_std⊗Λ, and a PGL₂ Check was added. This also corrects the unconditional torsor equivalence at HKII line 808.
- **Left unchanged.** §6.3 and §7.1 already imposed the condition. §12.1 keeps HKII's unrestricted G-variation, because §12.2 starts from K-torsors, whose push-outs satisfy §4.2.

## H02 (CBirkbeck) — disputed

The supplier exists and every consumed anchor resolves:
- **Where it is.** AdicSpacesPartIIPartII is a design-stage board package at merge-order position 11, well above this roadmap (position 245). The brief lists it among this roadmap's permitted suppliers. It is not yet on main or in an open pull request, which is why the open-PR inventory did not show it.
- **Anchors.** Its `packages/AdicSpacesPartIIPartII/design/README.md` states all 16 consumed targets (RZ.0 local-dimension through RZ.6 subfield-identity-theorem). Their hypotheses match the uses here:
  - RZ.3 gauss-point-in-closure assumes an infinite residue field, matching the §10.3 Acceptance.
  - RZ.4 weakly-shilov-avoid-nowhere-dense is BhattHansen Corollary 2.10 (BhattHansen line 346).
  - RZ.5 resolution-consequences gives a proper surjective v-cover, with a connected S̃ when S is irreducible.
  - RZ.6 subfield-identity-theorem assumes E⊆C complete of characteristic 0 with E closed, as §11.4 needs.
- **The suggested alternatives do not state these results.** RigidAnalyticGeometry §§1.2, 7.3 and 8.2 and AdicSpacesPartII R1.9 give affinoid dimension, the identity principle on connected normal spaces, and Max A→Spa density. None states diamond rigid points, Gauss-point closure, weakly Shilov avoidance, the constant-rank theorem or the subfield identity theorem.
- **What changed anyway.** The bare list of anchors at README line 174 is now an explicit contract (lines 174–182), so the contract can be checked without opening the supplier. It names the supplier as the continuation of AdicSpacesPartII and gives each consumed target its hypotheses and conclusion.

## H03 (CBirkbeck) — applied

At §9.5, line 1740, "Use symmetry of reductive adjoint weights for the minuscule comparison" is replaced. The new text inherits the two-sided bound through the μ-equivariant inclusion Lie H→Lie G (HKII line 2378) and keeps root-weight symmetry for reductive H only.

New Checks at line 1744:
- GL₂ with μ=diag(t,1) has weights −1,0,0,1. Its Borel has 0,0,1: asymmetric, yet inside [−1,1].
- In the cubic mirabolic example, the ambient weights ±2 show the ambient type is not minuscule.

## H04 (CBirkbeck) — answered

An empty `Suggested.lean` with a docstring naming each headline and its missing carrier is the required form when no headline is statable at the pins. It is not a validation of the README's contracts, and does not claim to be. The carriers were rechecked at the pins:
- **Mathlib** has `BDeRhamPlus`/`BDeRham` and one-dimensional `WittVector.Isocrystal`, but no bundles or modifications on the Fargues–Fontaine curve.
- **Tau Ceti** has, in `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/`, only the topological 𝒴, its windows and the Frobenius orbit space. It has no diamonds: its "Diamond" hits are modular-form diamond operators.

Admissibility (slope zero of the modified bundle), pure weight, Bun_G, the Grassmannians and the moduli diamonds are therefore not statable. No stand-in is written.

## Adversarial pass on changed or added statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: standard rational fibre for G-HS/G-AdmPair | PGL₂ twisted unit; G_m; SL₂; GL_n; trivial G | PGL₂: P(ℚ_p)=∅, κ=1 ∉ {0}; H¹(ℚ_p,G_m)=H¹(ℚ_p,SL₂)=H¹(ℚ_p,GL_n)=1, so the condition is automatic there; G=1: vacuous | the condition excludes exactly the twisted forms | added |
| Conventions: no condition on G-isocrystals or on bilattices over R with algebraically closed residue field | connected G over ℚ̆_p; R with residue field C; §0.2 quaternion Check over ℚ_p[[t]] | H¹(ℚ̆_p,G)=1 (Steinberg, then unipotent dévissage); H¹(R,G)↪H¹(C,G)=1; over ℚ_p[[t]] the residue field is ℚ_p, which is excluded and agrees with the §0.2 Check | consistent | none |
| §2.5 MT/MG up to G(ℚ_p)-conjugacy | G_m; GL₂ with ℚ_p⊕ℚ_p(1) | G_m: conjugation by scalars is trivial; GL₂: MT=diag(1,∗), and the swap w gives diag(∗,1)=w·MT·w⁻¹ | true | added clause |
| §2.6 [b]∈B(G,[μ⁻¹]) | G_m with ℚ_p(1); unit; PGL₂ twist | μ=1, b=p⁻¹, κ=−1=μ⁻¹, weight −2=2·(−1); unit: [1]∈B(G,[0]); PGL₂: κ=1, B(PGL₂,[0])={[1]}, so it fails without the condition | true under the condition | Checks added |
| §2.6 sketch: standard fibre ⇒ modified G-bundle trivial | PGL₂ twist | modified bundle E_b with κ(b)=1; ad gives End₀(O(1/2))≅O³ (slope 0) though E_b≠E₁ | needs the condition, now stated | added |
| §4.2 G-local system = v-locally ω_std⊗Λ | Λ=ℚ_p with PGL₂ twist on Spd C; Λ=O; GL_n | ℚ_p: frame sections Cont(\|T\|,P(ℚ_p))=∅; O: P(C)≠∅, so trivial; GL_n: every form standard | the old "equivalently torsor" is false for Λ=ℚ_p | repaired, Check added |
| §9.5 minuscule ⇒ three notions agree | GL₂ μ=diag(t,1) with Borel; mirabolic in Res_{E/ℚ_p}GL₂; GL₄ diag(t,t,1,1) parabolic | Lie GL₂ {−1,0,0,1} ⊇ Borel {0,0,1}; mirabolic ambient ±1,±1,±2 so not minuscule, Lie H {0,0,0,1,1,−2}; GL₄ parabolic weights ⊆ {−1,0,1} | inheritance correct; symmetry fails for the Borel | proof repaired, Checks added |
| Contract RZ.3 Gauss closure needs an infinite residue field | 𝔽_q residue field (README §10.3 Examples) | closure of \|x^q−x\|≤\|π\| contains all integral points but not the Gauss point | the hypothesis is needed, and is stated | contract text |
| Contract RZ.6 constant rank in characteristic 0 | z↦z^p in characteristic p | derivative ≡0 (constant rank 0) but the map is not locally constant | the characteristic-0 hypothesis is needed, and is stated | contract text |
| Contract RZ.6 subfield identity | E=ℚ_p⊂C=ℂ_p; E=ℚ̄_p (not complete) | vanishing on an open set of ℚ_p^m kills all coefficients; ℚ̄_p is excluded by completeness | hypotheses as stated | contract text |

`Suggested.lean` declares nothing, so the mechanical `#check` comparison has nothing to elaborate. The build confirms the file elaborates, and its docstring is unchanged and still agrees with the README.

## Ownership, citations, sources

- **Ownership.** The repairs add no carrier or construction: they restrict this roadmap's own definitions to the source's. So no ownership search against the open pull requests was needed.
  - A note for the supplier package, not this roadmap: AdicSpacesPartIIPartII states its own RZ.5/functorial-desingularization-qe, while ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6 (`qeResolution_regularFunctorial`) owns the scheme theorem. This roadmap consumes only RZ.5/resolution-consequences.
  - Also a supplier-side note: that design says no RigidAnalyticGeometry directory exists, but one is on main at `8a349f3`.
- **Citations.** `roadmaps resolve` reports no unresolved cross-roadmap citation or Lean name. All 16 AdicSpacesPartIIPartII anchors were checked against the board design README. HKI lines 512, 1673 and 1965, HKII lines 808 and 2378, and BhattHansen line 346 were read at the cited lines.
- **Sources.** None fetched, and `needs-references.toml` was not written.
- **Possible source erratum.** HKII Remark 2.3.5 (HKII line 808) asserts the local-system/torsor equivalence without v-local triviality, which fails for Λ=ℚ_p.
- **Untrusted text.** The review text contained no instructions to act outside the job.

## Build and gate

- `lake build TauCetiRoadmap.AdmissiblePairsAndPadicHodgeStructures.Suggested`: `Build completed successfully (8976 jobs).`
- Depcheck (`--movable`): `depcheck: 55 roadmaps, 631 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Gate after commit `23c4c57b`: `gate AdmissiblePairsAndPadicHodgeStructures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
  - The run before the commit failed only on `dirty=1`.
