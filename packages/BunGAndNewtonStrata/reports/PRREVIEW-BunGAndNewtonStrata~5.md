# Review of BunGAndNewtonStrata (pull request #1241 at 65fe201)

**Verdict:** accepted

No findings. Incremental re-review of the 36 lines changed since `c7d0555`, and a full reading of the pull request's title and description against this head.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/BunGAndNewtonStrata/Suggested.lean:107–108` reads “Nonempty (@IsocrystalEquiv p _ k _ _ _ (Fin n → K(p, k)) _ (wittGLIsocrystal p k c) V _ _) ↔”; gate `statement-hygiene=0`; elaborated type unchanged.
- R02 — repaired: the description now says “The bundle stack, its Newton geometry, the full stratum automorphisms and the contracting charts are imported from VStackSheavesAndLisseCategories §VS4.0, and the modification bound and minuscule flag stratification over ℚ_p … from IgusaVarietiesAndTorsionConcentration §§3.4–3.5”.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `wittGL_isocrystal_classes` (signature restated with the explicit instance) | n=0; n=1, V=(K, pσ), c=(p) and c=(1) | n=0: one matrix, zero isocrystal, both sides true. c=(p): identity is an isomorphism; b=(p) related. c=(1): valuation 0≠1, no isomorphism; 1=g·p·σ(g)⁻¹ impossible, unrelated. | Pass; `#check` type equals that at `c7d0555`. |
| Changed pins, `README.md:48,53`, with `Units.mapEquiv`, `AddEquiv.neg`, `coinvariantsKer_eq_range_of_forall_mem_zpowers` (§1.8) | A=ℤ, generator acting by −id, by id; A=0 | −id: range(τ−id)=2ℤ, coinvariants ℤ/2. id: range 0, coinvariants ℤ. A=0: both 0. Hashes equal `lake-manifest.json` and both installed package heads. | Pass. |
| `AlgHom.mapValue` (`README.md:59`, namespace corrected) | φ=id; H=R | φ=id: `toConv (id.comp f.ofConv)` = f. H=R: one point, sent to the one point. Declared in root namespace `AlgHom`, not `TauCeti.AlgHom`. | Pass; the new name is the pinned one. |
| Module docstring, `Suggested.lean:49–52`: `𝒴/φ^ℤ` adic when `𝒪_𝒴` is a sheaf, proved for rank-one valuation rings | hypothesis present / absent; value group | `isAdic_spaXPreAdicSpace` takes `h : (spaYPresheaf P ϖ).IsSheaf`; `isSheaf_spaYPresheaf` takes `v : Valuation K ℝ≥0`, `v.Integers R`, perfect `R`, `ϖ ≠ 0`, `v ϖ < 1`. | Pass; the sentence states both hypotheses. |
| §2.19 sign sentence after the removal of a supplier label (`README.md:1298`) | lattice `ξ^k B_dR⁺`, k=1 and k=−1 | RelativeFarguesFontaine §7.7: determinant degree `−Σk_i`; k=1 gives O(−1), k=−1 gives O(1), as the section's Checks say (component −1, bundle O(1)). | Pass. |

The rows of the earlier reviews for the untouched statements stand as in the previous review, of `c7d0555`.

- Gate, rerun at `65fe201`: every counter 0 (`statement-hygiene=0`, `outside-folder=0`, `stray-files=0`, `depcheck=0`, `build=0` in the worker's run), OK.
- Dependency check: `depcheck: 246 roadmaps, 2253 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The diff changes no supplier, only the labels in parentheses of four `*Needs:*` or citation lines.
- Elaboration of `Suggested.lean` with `lake env lean`: two `sorry` warnings (lines 102 and 131), nothing else; the seven elaborated signatures agree with the worker's list, no binder lost.
- Library declarations opened at the pins (8): `Units.mapEquiv` (`Mathlib/Algebra/Group/Units/Equiv.lean:42`), `Units.coe_mapEquiv` (:53), `MulEquiv.inv`/`AddEquiv.neg` (:198, same module), `WittVector.IsocrystalEquiv` (`Mathlib/RingTheory/WittVector/Isocrystal.lean:137`), `coinvariantsKer_eq_range_of_forall_mem_zpowers` (`TauCeti/RepresentationTheory/Coinvariants.lean:294`), `AlgHom.mapValue` (`TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:143`), `TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue` (`TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/Basic.lean:84`), `isSheaf_spaYPresheaf` and `isAdic_spaXPreAdicSpace` (`TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Adic.lean:158, 212`).
- Cross-roadmap citations resolved at the suppliers' open heads (10): RelativeFarguesFontaine §§4.7, 4.12, 4.13, 7.0, 7.2, 7.7; HodgeTateAndCanonicalSubgroups §2.14 (“Filtered fibre functors: splittings, type and the filtration parabolic”); PadicHodgeTheory §5.5 (tensor-isomorphism torsor, σ-conjugacy, Newton cocharacter, Kottwitz invariant, local torsor theorem all there); VStackSheavesAndLisseCategories §VS4.0 with its four paragraph titles as quoted. The removed labels (`torsorTensorDictionary`, `modify_gm_degree`, `filteredFiberFunctor_split`, `tensorIsomTorsor`, `localTorsorKottwitz`, `BunCharts` and the like) occur nowhere in the folder any more and none is declared at those heads.
- Seeded sample: of the 15 targets only §3.3 falls in the changed passages; its change is the supplier label, its source locators are untouched; no locator is flagged unverified.
- Pull request text: title, summary block and prose read against the head and the folder's change (a new roadmap: 98 headings and 7 declarations added, none removed; no file outside the folder). Each claim checked has its place in the README (§§1.8, 1.10, 1.12, 1.25, 2.12, 2.17, 2.20, 2.21, 3.11, 3.12, 3.18, 4.7, 4.8; both named consumers in “Downstream consumers”; `README.md:15, 82` for the imports); “two `sorry` declarations” equals the elaboration. Nothing contradicted, nothing unstated.
- Overlap check: not redone by scope, since the diff changes no object and no supplier; the worker's overlap list at this head shows no other pull request changing this roadmap, no dropped or revision-only id and no second copy; the ownership recorded by the earlier reviews stands.

Source independence: changed passages only; 9 changed passages compared, none of them a source locator or a paraphrase of a source (supplier labels, two commit hashes, one docstring paragraph, compared with the pinned Tau Ceti docstring: no shared run beyond four words); no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- GLX Definition 2.3, p. 819, and Lemma 3.16, pp. 829–830: carried from the earlier reviews as paywalled and cited by locator; untouched by this change.
- He21 published pagination against the arXiv text: carried from the earlier reviews; untouched by this change.

## Source issues

- none

## For the human reviewers

- Not tested: this round compared the changed passages only; the comparison of the layers with the contents of the most-cited source was not made in this round nor in the previous one.
