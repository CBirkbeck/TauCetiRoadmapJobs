# GATE-ModularCurves~2: answers to the review of pull request #1101

Head answered: `1381fec`, with one repair commit `7cf82077` on top. The comment answered is
CBirkbeck's external-formalisations note of 2026-11-06. Its six points were checked against the two
external repositories at the commits other roadmaps already cite (AxiomMath/Weil `27cdb204`,
formal-arithmetic-geometry/weil-conjectures `55abf461`) and against the pinned Mathlib and Tau Ceti
(Tau Ceti `2fd255d9`). The main finding is that, for every item the note maps, the pinned Tau Ceti
is a better source than either external repository: Layers 0D, 0E and 2D (and, by the same pattern,
0B) planned material that the bumped Tau Ceti pin already proves. Those layers now consume it.

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/ModularCurves/README.md` §Provenance (lines 3117–3135) now names both repositories
at fixed commits. It says they are Apache-2.0 (checked via the GitHub licence API: both
`Apache-2.0`), contain no modular curves, are not dependencies and are built against other
Lean/Mathlib versions, so statements are compared before use and adapted proofs keep the
attribution. It lists what they share with this roadmap that is already at the pin, and gives the
one file that bears on a target not at the pin (H02). The note's sentence about proving purity by
Weil II with the Fourier–Deligne transform concerns the Weil-conjectures roadmaps: no layer here
uses purity, so that sentence has no counterpart in this README.

## H02 (CBirkbeck) — applied differently

The files exist at Weil `27cdb204`. `Descent/AffineDescentEffective.lean` proves
`isEffective_of_isAffineHom_of_faithfullyFlat`: a descent datum with affine structure morphism is
effective along a flat, surjective, quasi-compact `f`. `QuasiAffineFpqcDescent.lean` proves the
quasi-affine case. `Sites/Fpqc.lean` gives the sheaf property of representables for the singleton
cover. But most of 0E is already at the pin:
- Mathlib `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:88`: `fpqcTopology.Subcanonical`, plus
  `EffectiveEpi` instances at lines 116 and 125.
- Tau Ceti `TauCeti/CategoryTheory/EffectiveEpi/Descent.lean`: `sectionDescentEquiv`,
  `homDescentEquiv`, `DescentDatum.baseChangeHomEquiv` and `Hom.descendIso`.
- Tau Ceti `TauCeti/AlgebraicGeometry/Descent/`:
  - `Affine.lean`, `exists_isAffine_baseChange_hom_isIso`;
  - `AffineMorphism.lean`, `isIso_toBaseChangeDescended_hom` (affine flat `p`, arbitrary base);
  - `FiniteLocallyFree.lean`, with rank;
  - `MorphismProperty.lean`, closed immersions and finite morphisms;
  - `Proj.lean`.

So §0E (lines 674–717) changes from "prove … affine schemes; finite locally free schemes and closed
subschemes; sections and morphisms; …" to a list of the forms consumed from the pin and a list of
the remaining forms. The first remaining form is effectivity along a non-affine flat surjective
quasi-compact `p` (Stacks, Tag 0245, read at stacks.math.columbia.edu: Lemma 35.37.1). Weil's
`AffineDescentEffective.lean` is the README's one external pointer, for exactly that form. The
quasi-affine case is used by no target, and Weil's `Sites/Fpqc.lean` is superseded by Mathlib's
subcanonical topology, so neither is cited. §Exact supplier contracts gains the Mathlib sentence
(line 214) and the Tau Ceti descent bullet (line 361). Each name is pinned by `#check`.

## H03 (CBirkbeck) — applied differently

W2 `AlgebraicGeometry/FundamentalGroup/Basic.lean` at `55abf461` does declare
`equivalenceContAction : Y.FiniteEtale ≌ ContAction FintypeCat G`, for `[ConnectedSpace Y]` and a
compact fundamental group `G` of a geometric fibre functor. The pinned Tau Ceti is closer to 0D,
though. `TauCeti/AlgebraicGeometry/FiniteEtale/Galois/Basic.lean` has
`FiniteEtaleScheme.galoisEquivalence K Ω : FiniteEtaleScheme (Spec K) ≌ ContAction FintypeCat
Gal(Ω/K)`, monoidal and braided, with `galoisEquivalenceGrp`, `galoisEquivalenceCommGrp` and
`galoisEquivalenceAlternatingPairingEquiv`. That is 0D's old paragraph ("construct the equivalence
… preserves products and transports group objects, commutative group objects, homomorphisms, and
alternating pairings") word for word. `Galois/Category.lean:111` has the connected-scheme
`GaloisCategory` that corresponds to W2's version. §0D (lines 653–672) now consumes these and
`essImage_mapGrp_ι_iff`. Cancellation (`FiniteEtaleScheme.isFinite_hom_left`, `etale_hom_left`)
and étale-local splitting (`Scheme.Hom.exists_split_etaleLocally`, Stacks 04HN) are also cited
from the pin. Fibre cardinalities, local constancy and descent stay targets. The claim that Weil
has only the splitting lemma was not checked file by file, since the pin supersedes both
repositories here.

## H04 (CBirkbeck) — answered

Confirmed on Weil's side. `EtaleCohomology/HenselianRings/StrictHenselization.lean` states
`henselianLocalRing_strictLocalRing_and_isSepClosed` for the strict local ring of a scheme at a
geometric point, which is not the roadmap's carrier. The roadmap's carrier and the Stacks 04GP,
08HQ, 04GT and 04GU clauses are Tau Ceti's `TauCeti.StrictHenselization` at the pin (§Exact
supplier contracts). The two clauses still stated in `Suggested.lean` are still absent at the bumped
pin (grep of `TauCeti/RingTheory/StrictHenselization/`). The residue-field clause follows from the
pinned `ker_toTarget_eq_maximalIdeal` and `toTarget_surjective`, as §4D says. Noetherianity and the
Tag 06LJ completion clauses are not in the Weil file read. The W2 `RingTheory/` directory is too
large to list through the API and was not searched file by file. No 4D text changed. §Provenance
records that both repositories work with strict local rings of schemes.

## H05 (CBirkbeck) — applied differently

The claim is partly inaccurate. W2 `Picard/Defs.lean` defines `picardFunctor f` as an fppf sheaf
for any `f : X ⟶ S` (variable line `{X S : Scheme.{u}}`). Only the degree-`d` subfunctors of
`Picard/Jacobian.lean` (`picardSubfunctorDegree`) are over a field base `[Field k]`. The pinned Tau
Ceti `TauCeti/AlgebraicGeometry/PicardFunctor/` has both items over an arbitrary base:
`relativePicardPresheaf`, `rigidifiedPicardFunctor` with `rigidifiedPicardFunctorIso`,
`relativePicardFppfSheaf`, `relativePicardDegreeZeroSubfunctor` and
`relativePicardDegreeZeroFppfSheaf`, and also the Abel–Jacobi map `abelJacobiMapToPicZeroFppf`.

- §2D items 1–3 (lines 1142–1172) change from "define the fppf Picard functor … define the
  degree-zero open-and-closed subfunctor" to consuming these declarations.
- Consuming the degree-zero sheaf needs `[GeometricallyConnected f]`, which the pinned
  `EllipticCurveGeom` does not supply, so item 2 adds it as a target. The proof route goes
  through the pointed atlas and `isIntegral_projModel`. A negative control shows the atlas is
  needed: `E ⊔ E'` pointed in `E` is smooth, proper, of relative dimension one and has a section,
  but is disconnected.
- Item 2 keeps open-and-closedness of the degree-zero locus as a target.
- Item 3 states representability as "`abelJacobiMapToPicZeroFppf π E.zero_comp` is an
  isomorphism".
- The §Scope, §Existing Mathlib and §Dependency-order sentences that called the relative Picard
  functor this roadmap's own construction are corrected.

## H06 (CBirkbeck) — answered

Confirmed at directory level. At the cited commits, no directory name contains "Modular",
"Elliptic" or "Moduli" in Weil's `Weil/AlgebraicGeometry/` (28 entries) or in W2's top-level
`WeilConjectures/` (53 entries); the GitHub contents API was used for both. W2's
`AlgebraicGeometry/` listing is too large to read in full through the API. No pointer is recorded
for Layers 1 and 3–10.

## Further repairs of the same pattern

- **Layer 0B.** The pinned Tau Ceti `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/`
  has Cartier duality over an affine base: `cartierDuality`, `cartierDualDualIso`,
  `cartierDualBaseChangeIso`, `finrank_cartierDual`, and `ConstantGroup` / `DiagonalizableGroup`
  `.cartierDualIso`, which includes `(ℤ/N)ᴰ ≅ μ_N` with no invertibility hypothesis. §0B (line
  589) now consumes these and keeps as target the globalisation to `FiniteFlatCommGroupScheme S`
  over an arbitrary base, plus exactness. A supplier bullet is added (line 347).
- **`Suggested.lean` docstring.** It said the dual isogeny, Cartier–Nishi duality and `e_N` lack
  "the relative Picard functor of Layer 2D and the multiplicative group over an arbitrary base".
  At the pin the Picard functor exists, and `𝔾_m`, `μ_n` exist as fpqc sheaves
  (`TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean`). It now names what is actually
  missing (line 85): the pullback `Pic⁰(φ)` along a homomorphism, the Poincaré bundle, and Cartier
  duality over a non-affine base. Grep of `PicardFunctor/` shows no functoriality in `X` and no
  Poincaré bundle.
- **Observation, not repaired (no reviewer raised it).** Elliptic autoduality,
  `IsIso (abelJacobiMapToPicZeroFppf E.structureMap E.zero_comp)`, is now statable at the pin, but
  only with an explicit `[GeometricallyConnected E.structureMap]` binder until item 2 of §2D is
  proved. It is a 2D milestone, not in the docstring's headline list, and was not added as a
  headline in this round.

No declaration of `Suggested.lean` changed. The edits are imports, 44 new `#check` pins and
docstring text, so the 39 elaborated types in `signatures.md` stand. Every new pin's elaborated type
was read in the build log and compared with its README description. That is how
`exists_finiteLocallyFree_baseChange_hom_isIso` came to be described as over an affine base and
`isClosedImmersion_descended_hom` as needing `p` affine, flat and surjective.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 2D item 2: `π` geometrically connected | `S = ∅`; `S = Spec K`, `char K = 2`, `W: y²+y=x³`; `S = Spec k[ε]`; negative control `E ⊔ E'` over `K` | `∅`: no field points, so the property is vacuous ✓. Over `K`: the chart base is an open immersion onto a point, hence an iso, so `E ≅ projModel W` over `K`, which is integral, connected ✓. `k[ε]`: field points factor through `k` ✓. `E ⊔ E'`: two components, so not an elliptic curve (no integral chart) ✓ | holds; uses the atlas | target added; negative control in text |
| 2D item 2: degree-zero locus open and closed | `T = Spec k ⊔ Spec k` with `L` of degree 0 / 1 on the two parts; `T = Spec` DVR, `L = 𝒪(P)` | locus is one component, clopen ✓; degree 1 on both fibres, locus empty ✓ | holds (χ locally constant, flat proper fp) | kept as target, route named |
| 2D item 3: AJ map is an iso | `T = Spec K̄`; `T = Spec K̄[ε]`; base point | `E(K̄) → Pic⁰(E)` bijective (genus 1) ✓; `T₀E = H¹(E,𝒪) = Lie Pic⁰` ✓; `0 ↦ 𝒪` (`abelJacobiMapToPicZeroFppf_app_basePoint`) ✓; sign: `t_{−P}^*𝒪([0]) = 𝒪([P])` matches `P ↦ 𝒪(Γ_P − 0)` ✓ | holds | restated on the Tau Ceti map |
| 0E: affine descent along non-affine `p` | `S = ∅`; `p = id`; `p = Spec R' ⊔ Spec R'' → Spec R` | trivial ✓; `X₀ = X` ✓; finite union of affines over affine is affine, so the pinned affine case applies ✓ | holds (Stacks 0245) | route stated |
| 0E: pinned forms' hypotheses | read elaborated types | affine case `[IsAffine S] [IsAffine S'] [Flat p]`; affine-morphism case `[IsAffineHom p] [Flat p]`; finite locally free `[Module.FaithfullyFlat R S]` on `Spec S → Spec R`; closed immersion `[IsAffineHom p] [Flat p] [Surjective p]` | README matches each | wording fixed to match |
| 0D: Galois equivalence | `K = Ω` separably closed; `K = ℝ`, `Ω = ℂ` | `Gal = 1`, finite étale ↔ finite sets (`equivOfIsSepClosed`) ✓; `Spec ℂ ↦` 2-point set, free `C₂`-orbit ✓ | holds (`[IsSepClosed Ω] [IsGalois K Ω]` = separable closure) | consumed |
| 0B: affine Cartier duality, `(ℤ/N)ᴰ ≅ μ_N` | `N = 1`; `N = p` over `𝔽_p` | trivial ↔ trivial ✓; `(ℤ/p)ᴰ = μ_p` non-étale, rank `p` both sides (`finrank_cartierDual`) ✓ | holds without invertibility | consumed; globalisation kept |
| Docstring "lacks" claim | grep `PicardFunctor/` for maps in `X`; grep for Poincaré | no `Pic(φ)`; no Poincaré bundle ✓; `𝔾_m`, `μ_n` exist as sheaves ✓ | corrected | text changed |

## Ownership, citations, sources

- **Ownership.** The new 2D target (geometric connectedness of `EllipticCurveGeom`) was searched
  for with `roadmaps grep` on main and the open pull requests: no match, and this roadmap owns the
  scheme theory of elliptic curves. Every other change narrows the roadmap to the pinned library.
- **Citations.** `roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean
  name found nowhere. The previous lead `KatzMazurQuotientData.exists_of_hasProperty_affine` is
  declared in `Suggested.lean`.
- **Sources.** The only new source is the Stacks project (Tag 0245, read online). The two GitHub
  repositories are cited in §Provenance as existing work, not as sources. No
  `needs-references.toml` entry was needed.

## Build and gate

- `lake build TauCetiRoadmap.ModularCurves.Suggested`: `Build completed successfully (20422 jobs).`
  0 errors; only `declaration uses 'sorry'` warnings.
- Gate: `gate ModularCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
  sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
  lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0
  long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
  outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 239 roadmaps, 2343 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
